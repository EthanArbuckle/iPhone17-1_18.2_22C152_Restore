uint64_t sub_24CC33B50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void);
  uint64_t *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  uint64_t v39;
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t vars8;

  sub_24CC59010();
  OUTLINED_FUNCTION_0();
  v50 = v3;
  v51 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2();
  v6 = v5 - v4;
  v7 = sub_24CC58830();
  OUTLINED_FUNCTION_0();
  v49 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  v12 = v11 - v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_2();
  v16 = v15 - v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820020);
  MEMORY[0x270FA5388](v17 - 8);
  OUTLINED_FUNCTION_2();
  v20 = v19 - v18;
  v21 = sub_24CC58AE0();
  OUTLINED_FUNCTION_0();
  v52 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2();
  v26 = v25 - v24;
  v27 = *(void *)(sub_24CC58BD0() + 16);
  swift_bridgeObjectRelease();
  v28 = sub_24CC58BD0();
  if (v27 < 2)
  {
    sub_24CC51368(v28, v20);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v20, 1, v21) == 1)
    {
      sub_24CC34878(v20, &qword_269820020);
      v33 = a1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v26, v20, v21);
      v34 = (void *)sub_24CC58A80();
      v35 = objc_msgSend(v34, sel_punchOutUri);

      if (v35)
      {
        sub_24CC58810();

        (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v16, v12, v7);
        __swift_storeEnumTagSinglePayload(v16, 0, 1, v7);
        v33 = a1;
        if (__swift_getEnumTagSinglePayload(v16, 1, v7) != 1)
        {
          sub_24CC34878(v16, &qword_269820018);
          v36 = sub_24CC58A80();
          v37 = OUTLINED_FUNCTION_6();
          v38(v37);
          *a1 = v36;
          v39 = sub_24CC597A0();
          OUTLINED_FUNCTION_4();
          OUTLINED_FUNCTION_10();
          v40();
          v41 = (uint64_t)a1;
          v42 = 0;
          v43 = v39;
          return __swift_storeEnumTagSinglePayload(v41, v42, 1, v43);
        }
      }
      else
      {
        __swift_storeEnumTagSinglePayload(v16, 1, 1, v7);
        v33 = a1;
      }
      sub_24CC34878(v16, &qword_269820018);
      v44 = OUTLINED_FUNCTION_6();
      v45(v44);
    }
    sub_24CC58FF0();
    v46 = sub_24CC59000();
    v47 = sub_24CC599C0();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_24CC31000, v46, v47, "punchOutUri not found for attribution item", v48, 2u);
      MEMORY[0x25330E970](v48, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v6, v51);
    v43 = sub_24CC597A0();
    v41 = (uint64_t)v33;
    v42 = 1;
    return __swift_storeEnumTagSinglePayload(v41, v42, 1, v43);
  }
  v29 = sub_24CC34028(v28);
  swift_bridgeObjectRelease();
  *a1 = v29;
  v30 = sub_24CC597A0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10();
  v31();
  return __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v30);
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

uint64_t sub_24CC34028(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820028);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_24CC59840();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v29 = (char *)&v25 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v15 = sub_24CC58AE0();
  OUTLINED_FUNCTION_3(v15);
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v28 = v8;
  uint64_t v19 = *(void *)(v18 + 72);
  uint64_t v25 = a1;
  sub_24CC58A00();
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t v26 = v19;
  v27 = v12;
  do
  {
    sub_24CC34328(v17, v5);
    if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
    {
      sub_24CC34878(v5, &qword_269820028);
    }
    else
    {
      v21 = *(void (**)(void))(v8 + 32);
      OUTLINED_FUNCTION_5();
      v21();
      OUTLINED_FUNCTION_5();
      v21();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v20 = sub_24CC348F0(0, *(void *)(v20 + 16) + 1, 1, v20, &qword_269820030, MEMORY[0x263F77708], MEMORY[0x263F77708]);
      }
      unint64_t v23 = *(void *)(v20 + 16);
      unint64_t v22 = *(void *)(v20 + 24);
      if (v23 >= v22 >> 1) {
        uint64_t v20 = sub_24CC348F0(v22 > 1, v23 + 1, 1, v20, &qword_269820030, MEMORY[0x263F77708], MEMORY[0x263F77708]);
      }
      *(void *)(v20 + 16) = v23 + 1;
      OUTLINED_FUNCTION_5();
      v21();
      uint64_t v19 = v26;
    }
    v17 += v19;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24CC34328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_24CC58AE0();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  v37 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CC59010();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  v40 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC597A0();
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (void *)((char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_24CC58830();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (void *)sub_24CC58A80();
  id v18 = objc_msgSend(v17, sel_punchOutUri);

  if (v18)
  {
    sub_24CC58810();

    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v13, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v10);
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v10) != 1)
    {
      sub_24CC34878((uint64_t)v16, &qword_269820018);
      sub_24CC58AC0();
      *uint64_t v9 = sub_24CC58A80();
      (*(void (**)(uint64_t *, void, uint64_t))(v34 + 104))(v9, *MEMORY[0x263F77518], v7);
      uint64_t v19 = v41;
      sub_24CC59830();
      uint64_t v20 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v10);
  }
  sub_24CC34878((uint64_t)v16, &qword_269820018);
  v21 = v40;
  sub_24CC58FF0();
  unint64_t v23 = v37;
  uint64_t v22 = v38;
  uint64_t v24 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v37, a1, v39);
  uint64_t v25 = sub_24CC59000();
  os_log_type_t v26 = sub_24CC599C0();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v43 = v34;
    *(_DWORD *)v27 = 136315138;
    v33[1] = v27 + 4;
    uint64_t v28 = sub_24CC58AA0();
    uint64_t v42 = sub_24CC3AC7C(v28, v29, &v43);
    sub_24CC59A00();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
    _os_log_impl(&dword_24CC31000, v25, v26, "punchOutUri not found for attribution item %s", v27, 0xCu);
    uint64_t v20 = 1;
    uint64_t v30 = v34;
    swift_arrayDestroy();
    MEMORY[0x25330E970](v30, -1, -1);
    MEMORY[0x25330E970](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v21, v36);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v21, v36);
    uint64_t v20 = 1;
  }
  uint64_t v19 = v41;
LABEL_9:
  uint64_t v31 = sub_24CC59840();
  return __swift_storeEnumTagSinglePayload(v19, v20, 1, v31);
}

uint64_t sub_24CC34878(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24CC348CC(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_24CC348F0(a1, a2, a3, a4, &qword_269820038, MEMORY[0x263F24F30], MEMORY[0x263F24F30]);
}

uint64_t sub_24CC348F0(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t), void (*a7)(uint64_t))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    v21 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = OUTLINED_FUNCTION_7();
  uint64_t v16 = a6(v15);
  OUTLINED_FUNCTION_3(v16);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (void *)swift_allocObject();
  size_t v22 = _swift_stdlib_malloc_size(v21);
  if (!v18 || (v22 - v20 == 0x8000000000000000 ? (BOOL v23 = v18 == -1) : (BOOL v23 = 0), v23))
  {
LABEL_24:
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_8();
    uint64_t result = sub_24CC59A60();
    __break(1u);
    return result;
  }
  v21[2] = v13;
  v21[3] = 2 * ((uint64_t)(v22 - v20) / v18);
LABEL_19:
  uint64_t v24 = OUTLINED_FUNCTION_7();
  uint64_t v25 = *(void *)(a6(v24) - 8);
  unint64_t v26 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v27 = (unint64_t)v21 + v26;
  if (a1)
  {
    sub_24CC34C30(a4 + v26, v13, v27, a7);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CC34AEC(0, v13, v27, a4);
  }
  return (uint64_t)v21;
}

uint64_t sub_24CC34AEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = OUTLINED_FUNCTION_7();
    uint64_t v10 = *(void *)(v9(v8) - 8);
    uint64_t v11 = a4 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    uint64_t v12 = *(void *)(v10 + 72);
    unint64_t v13 = v11 + v12 * a1;
    unint64_t v14 = a3 + v12 * v4;
    if (v13 >= v14 || v13 + v12 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v14;
    }
  }
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  uint64_t result = sub_24CC59A90();
  __break(1u);
  return result;
}

void sub_24CC34C30(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_8();
    sub_24CC59A90();
    __break(1u);
  }
  else if (a3 < a1 || (uint64_t v8 = OUTLINED_FUNCTION_7(), a4(v8), OUTLINED_FUNCTION_4(), a1 + *(void *)(v9 + 72) * a2 <= a3))
  {
    uint64_t v10 = OUTLINED_FUNCTION_7();
    a4(v10);
    OUTLINED_FUNCTION_9();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_9();
    swift_arrayInitWithTakeBackToFront();
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24CC34D44(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CC34D64(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_269820040)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269820040);
    }
  }
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

char *sub_24CC34EA8(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_24CC58B90();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_24CC34F90(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CC58B90();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC35008(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24CC58B90();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_24CC3509C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24CC58B90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_24CC35134(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24CC58B90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_24CC351B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58B90();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24CC35244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC35258);
}

uint64_t sub_24CC35258(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24CC58B90();
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_24CC352EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC35300);
}

void *sub_24CC35300(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *__n128 result = a2;
  }
  else
  {
    uint64_t v7 = sub_24CC58B90();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for TipSnippet()
{
  uint64_t result = qword_269820048;
  if (!qword_269820048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC353C8()
{
  uint64_t result = sub_24CC58B90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC35460()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC3547C@<X0>(uint64_t a1@<X8>)
{
  v27[0] = a1;
  uint64_t v2 = type metadata accessor for TipSnippet();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820058);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TipSnippetContentView(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = (_OWORD *)((char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = v1 + *(int *)(v3 + 28);
  uint64_t v15 = (char *)v13 + *(int *)(v11 + 28);
  sub_24CC58B90();
  OUTLINED_FUNCTION_4();
  (*(void (**)(char *, uint64_t))(v16 + 16))(v15, v14);
  v27[1] = sub_24CC59310();
  sub_24CC59730();
  *unint64_t v13 = v28;
  *(void *)&long long v28 = sub_24CC596C0();
  BYTE8(v28) = 0;
  sub_24CC35CAC(v1, (uint64_t)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for TipSnippet);
  unint64_t v17 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = swift_allocObject();
  sub_24CC35B00((uint64_t)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820060);
  sub_24CC35BC4();
  sub_24CC59650();
  swift_release();
  swift_release();
  uint64_t v19 = sub_24CC59790();
  uint64_t v21 = v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820080);
  uint64_t v23 = v27[0];
  uint64_t v24 = v27[0] + *(int *)(v22 + 36);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v24, v9, v6);
  uint64_t v25 = (uint64_t *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269820088) + 36));
  *uint64_t v25 = v19;
  v25[1] = v21;
  sub_24CC35CAC((uint64_t)v13, v23, (void (*)(void))type metadata accessor for TipSnippetContentView);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_24CC35D0C((uint64_t)v13);
}

uint64_t sub_24CC357AC(id *a1)
{
  uint64_t v2 = sub_24CC58830();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CC58A30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TipSnippet();
  sub_24CC58B70();
  type metadata accessor for ActionHandler();
  uint64_t v10 = swift_allocObject();
  sub_24CC58FF0();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v10 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v9, v6);
  sub_24CC58B00();
  if (*a1)
  {
    id v11 = *a1;
    sub_24CC520C8();
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_24CC598A0();
    sub_24CC35E3C((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    uint64_t result = sub_24CC591C0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CC359F4()
{
  return sub_24CC59660();
}

uint64_t sub_24CC35A14()
{
  uint64_t v1 = (int *)(type metadata accessor for TipSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  sub_24CC58B90();
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v8 + 8))(v7);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24CC35B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC35B64()
{
  uint64_t v1 = *(void *)(type metadata accessor for TipSnippet() - 8);
  uint64_t v2 = (id *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return sub_24CC357AC(v2);
}

unint64_t sub_24CC35BC4()
{
  unint64_t result = qword_269820068;
  if (!qword_269820068)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820060);
    sub_24CC35E84(&qword_269820070, &qword_269820078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820068);
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

uint64_t sub_24CC35CAC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_24CC35D0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TipSnippetContentView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CC35D6C()
{
  unint64_t result = qword_269820098;
  if (!qword_269820098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820080);
    sub_24CC35E3C(&qword_2698200A0, (void (*)(uint64_t))type metadata accessor for TipSnippetContentView);
    sub_24CC35E84(&qword_2698200A8, &qword_269820088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820098);
  }
  return result;
}

uint64_t sub_24CC35E3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC35E84(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CC35EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_24CC35F34(uint64_t a1)
{
  uint64_t v2 = sub_24CC58E00();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_24CC35F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC35FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC36060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC360C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC36128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC3613C);
}

uint64_t sub_24CC3613C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_24CC36184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC36198);
}

uint64_t sub_24CC36198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E00();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ListStyleAnswerSnippet()
{
  uint64_t result = qword_2698200B0;
  if (!qword_2698200B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC3622C()
{
  uint64_t result = sub_24CC58E00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC362B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC362D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v90 = a1;
  uint64_t v89 = sub_24CC58D70();
  OUTLINED_FUNCTION_0();
  uint64_t v87 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v83 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v81 = (char *)&v71 - v7;
  uint64_t v88 = sub_24CC58D00();
  OUTLINED_FUNCTION_0();
  uint64_t v86 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_0();
  uint64_t v85 = v10;
  uint64_t v84 = sub_24CC58E00();
  OUTLINED_FUNCTION_0();
  uint64_t v82 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_0();
  uint64_t v80 = v13;
  uint64_t v77 = sub_24CC58A30();
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_0();
  uint64_t v18 = v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C0);
  MEMORY[0x270FA5388](v19 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = type metadata accessor for ListStyleAnswerSnippet();
  uint64_t v24 = OUTLINED_FUNCTION_3(v23);
  uint64_t v26 = v25;
  uint64_t v28 = *(void *)(v27 + 64);
  MEMORY[0x270FA5388](v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C8);
  OUTLINED_FUNCTION_0();
  uint64_t v74 = v30;
  uint64_t v75 = v29;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2();
  uint64_t v33 = v32 - v31;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200D0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_0();
  uint64_t v36 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698200D8);
  OUTLINED_FUNCTION_0();
  uint64_t v78 = v38;
  uint64_t v79 = v37;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_1_0();
  uint64_t v76 = v39;
  sub_24CC38A70(v1, (uint64_t)&v71 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ListStyleAnswerSnippet);
  unint64_t v40 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v41 = swift_allocObject();
  sub_24CC387B0((uint64_t)&v71 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), v41 + v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698200E0);
  sub_24CC35E84(&qword_2698200E8, &qword_2698200E0);
  uint64_t v73 = v33;
  sub_24CC59800();
  sub_24CC58D40();
  uint64_t v42 = sub_24CC58C20();
  if (__swift_getEnumTagSinglePayload(v22, 1, v42) == 1)
  {
    sub_24CC34878(v22, &qword_2698200C0);
    uint64_t v43 = 0;
  }
  else
  {
    uint64_t v43 = (void *)sub_24CC51618();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v42 - 8) + 8))(v22, v42);
  }
  sub_24CC58DD0();
  uint64_t v44 = v36;
  v45 = (uint64_t *)(v36 + *(int *)(v91 + 36));
  uint64_t v72 = v36;
  uint64_t v46 = type metadata accessor for PunchoutModifier();
  uint64_t v47 = v77;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)v45 + *(int *)(v46 + 24), v18, v77);
  sub_24CC598A0();
  sub_24CC38E08((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
  id v48 = v43;
  uint64_t *v45 = sub_24CC591D0();
  v45[1] = v49;
  v45[2] = (uint64_t)v43;
  uint64_t v51 = v73;
  uint64_t v50 = v74;
  uint64_t v52 = v75;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v44, v73, v75);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v47);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
  uint64_t v53 = v82;
  uint64_t v54 = v80;
  uint64_t v55 = v84;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v80, v2, v84);
  v56 = v81;
  sub_24CC58D50();
  uint64_t v57 = v87;
  v58 = v83;
  uint64_t v59 = v89;
  (*(void (**)(char *, void, uint64_t))(v87 + 104))(v83, *MEMORY[0x263F39870], v89);
  LOBYTE(v52) = sub_24CC58D60();
  v60 = *(void (**)(char *, uint64_t))(v57 + 8);
  v60(v58, v59);
  v60(v56, v59);
  uint64_t v62 = v85;
  uint64_t v61 = v86;
  v63 = (unsigned int *)MEMORY[0x263F39868];
  if ((v52 & 1) == 0) {
    v63 = (unsigned int *)MEMORY[0x263F39860];
  }
  uint64_t v64 = v88;
  (*(void (**)(uint64_t, void, uint64_t))(v86 + 104))(v85, *v63, v88);
  uint64_t v65 = sub_24CC58C30();
  uint64_t v67 = v66;
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v64);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v55);
  uint64_t v92 = v65;
  uint64_t v93 = v67;
  sub_24CC38864();
  uint64_t v68 = v76;
  uint64_t v69 = v72;
  sub_24CC595F0();
  swift_bridgeObjectRelease();
  sub_24CC34878(v69, &qword_2698200D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 32))(v90, v68, v79);
}

uint64_t sub_24CC369B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v195 = a2;
  uint64_t v165 = sub_24CC59340();
  uint64_t v180 = *(void *)(v165 - 8);
  MEMORY[0x270FA5388](v165);
  v179 = (char *)&v151 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_24CC593C0();
  uint64_t v177 = *(void *)(v178 - 8);
  MEMORY[0x270FA5388](v178);
  v176 = (char *)&v151 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ListStyleAnswerSnippet();
  uint64_t v159 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v160 = v6;
  uint64_t v162 = (uint64_t)&v151 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = sub_24CC587A0();
  uint64_t v161 = *(void *)(v163 - 8);
  MEMORY[0x270FA5388](v163);
  v191 = (char *)&v151 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = type metadata accessor for AttributionView();
  MEMORY[0x270FA5388](v166);
  v164 = (char *)&v151 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820108);
  uint64_t v167 = *(void *)(v168 - 8);
  MEMORY[0x270FA5388](v168);
  v157 = (char *)&v151 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820110);
  uint64_t v171 = *(void *)(v173 - 8);
  MEMORY[0x270FA5388](v173);
  v158 = (char *)&v151 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820118);
  uint64_t v174 = *(void *)(v175 - 8);
  MEMORY[0x270FA5388](v175);
  v172 = (char *)&v151 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820120);
  uint64_t v12 = MEMORY[0x270FA5388](v197);
  v170 = (char *)&v151 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v169 = (uint64_t)&v151 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C0);
  MEMORY[0x270FA5388](v15 - 8);
  v188 = (char *)&v151 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v194 = sub_24CC58C20();
  uint64_t v193 = *(void *)(v194 - 8);
  MEMORY[0x270FA5388](v194);
  v192 = (char *)&v151 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820128);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v198 = (uint64_t)&v151 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v196 = (uint64_t)&v151 - v21;
  uint64_t v183 = type metadata accessor for ItemListView();
  MEMORY[0x270FA5388](v183);
  v185 = (uint64_t *)((char *)&v151 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820130);
  MEMORY[0x270FA5388](v186);
  uint64_t v184 = (uint64_t)&v151 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820138);
  uint64_t v204 = *(void *)(v24 - 8);
  uint64_t v205 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  v208 = (char *)&v151 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v207 = (char *)&v151 - v27;
  uint64_t v201 = sub_24CC588C0();
  uint64_t v28 = *(void *)(v201 - 8);
  MEMORY[0x270FA5388](v201 - 8);
  uint64_t v30 = (char *)&v151 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_24CC59820();
  uint64_t v182 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&v151 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820140);
  uint64_t v34 = *(void *)(v187 - 8);
  MEMORY[0x270FA5388](v187);
  v202 = (char *)&v151 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820148);
  uint64_t v181 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v38 = (char *)&v151 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820150);
  uint64_t v40 = MEMORY[0x270FA5388](v39 - 8);
  uint64_t v190 = (uint64_t)&v151 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v203 = (uint64_t)&v151 - v43;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  uint64_t v46 = (char *)&v151 - v45;
  MEMORY[0x270FA5388](v44);
  id v48 = (char *)&v151 - v47;
  char v49 = sub_24CC58DE0();
  v206 = v48;
  v209 = v46;
  uint64_t v200 = v28;
  v189 = v30;
  uint64_t v156 = v31;
  uint64_t v199 = a1;
  v155 = v38;
  v154 = v33;
  if (v49)
  {
    uint64_t v50 = sub_24CC58DA0();
    uint64_t v153 = v34;
    uint64_t v51 = sub_24CC499B0(v50);
    uint64_t v53 = v52;
    uint64_t v152 = v36;
    char v55 = v54;
    uint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v212 = MEMORY[0x263F1A830];
    uint64_t v213 = MEMORY[0x263F77348];
    uint64_t v58 = swift_allocObject();
    uint64_t v210 = v58;
    *(void *)(v58 + 16) = v51;
    *(void *)(v58 + 24) = v53;
    id v48 = v206;
    uint64_t v59 = v187;
    uint64_t v60 = v201;
    *(unsigned char *)(v58 + 32) = v55 & 1;
    *(void *)(v58 + 40) = v57;
    sub_24CC59810();
    uint64_t v61 = sub_24CC38E08((unint64_t *)&qword_269820190, MEMORY[0x263F776A0]);
    sub_24CC595D0();
    (*(void (**)(char *, uint64_t))(v182 + 8))(v33, v31);
    uint64_t v62 = v200;
    (*(void (**)(char *, void, uint64_t))(v200 + 104))(v30, *MEMORY[0x263F76980], v60);
    uint64_t v210 = v31;
    uint64_t v211 = v61;
    swift_getOpaqueTypeConformance2();
    sub_24CC595B0();
    uint64_t v63 = v60;
    uint64_t v34 = v153;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v30, v63);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v202, v59);
    uint64_t v64 = v181;
    uint64_t v65 = v152;
    (*(void (**)(char *, char *, uint64_t))(v181 + 32))(v48, v38, v152);
    uint64_t v66 = 0;
    uint64_t v67 = v64;
  }
  else
  {
    uint64_t v66 = 1;
    uint64_t v65 = v36;
    uint64_t v67 = v181;
  }
  uint64_t v68 = 1;
  __swift_storeEnumTagSinglePayload((uint64_t)v48, v66, 1, v65);
  uint64_t v69 = v199;
  uint64_t v70 = sub_24CC58DC0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v72 = (uint64_t)v185;
  uint64_t *v185 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  swift_storeEnumTagMultiPayload();
  uint64_t v73 = v183;
  uint64_t v74 = v72 + *(int *)(v183 + 20);
  *(void *)uint64_t v74 = swift_getKeyPath();
  *(unsigned char *)(v74 + 8) = 0;
  uint64_t v75 = (uint64_t *)(v72 + *(int *)(v73 + 24));
  uint64_t v214 = 0;
  sub_24CC59730();
  uint64_t v76 = v211;
  *uint64_t v75 = v210;
  v75[1] = v76;
  *(void *)(v72 + *(int *)(v73 + 28)) = v70;
  LOBYTE(v73) = sub_24CC37F68();
  uint64_t v77 = swift_getKeyPath();
  uint64_t v78 = v184;
  sub_24CC38A70(v72, v184, (void (*)(void))type metadata accessor for ItemListView);
  uint64_t v79 = v78 + *(int *)(v186 + 36);
  *(void *)uint64_t v79 = v77;
  *(unsigned char *)(v79 + 8) = v73;
  sub_24CC38CF4(v72, (void (*)(void))type metadata accessor for ItemListView);
  sub_24CC38AC4();
  uint64_t v80 = v208;
  sub_24CC595D0();
  sub_24CC34878(v78, &qword_269820130);
  (*(void (**)(char *, char *, uint64_t))(v204 + 32))(v207, v80, v205);
  if (sub_24CC58DF0())
  {
    uint64_t v81 = sub_24CC58DB0();
    uint64_t v82 = sub_24CC499B0(v81);
    uint64_t v83 = v34;
    uint64_t v85 = v84;
    char v87 = v86;
    uint64_t v89 = v88;
    swift_bridgeObjectRelease();
    uint64_t v212 = MEMORY[0x263F1A830];
    uint64_t v213 = MEMORY[0x263F77348];
    uint64_t v90 = swift_allocObject();
    uint64_t v210 = v90;
    *(void *)(v90 + 16) = v82;
    *(void *)(v90 + 24) = v85;
    uint64_t v91 = v201;
    *(unsigned char *)(v90 + 32) = v87 & 1;
    *(void *)(v90 + 40) = v89;
    uint64_t v92 = v154;
    sub_24CC59810();
    uint64_t v93 = sub_24CC38E08((unint64_t *)&qword_269820190, MEMORY[0x263F776A0]);
    v94 = v202;
    uint64_t v95 = v67;
    uint64_t v96 = v182;
    uint64_t v97 = v156;
    sub_24CC595D0();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v92, v97);
    uint64_t v98 = v200;
    uint64_t v99 = v65;
    v100 = v189;
    (*(void (**)(char *, void, uint64_t))(v200 + 104))(v189, *MEMORY[0x263F76980], v91);
    uint64_t v210 = v97;
    uint64_t v211 = v93;
    swift_getOpaqueTypeConformance2();
    v101 = v155;
    uint64_t v102 = v187;
    sub_24CC595B0();
    v103 = v100;
    uint64_t v65 = v99;
    uint64_t v69 = v199;
    (*(void (**)(char *, uint64_t))(v98 + 8))(v103, v91);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v94, v102);
    (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v209, v101, v65);
    uint64_t v68 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v209, v68, 1, v65);
  uint64_t v104 = (uint64_t)v188;
  sub_24CC58D40();
  uint64_t v105 = v194;
  if (__swift_getEnumTagSinglePayload(v104, 1, v194) == 1)
  {
    sub_24CC34878(v104, &qword_2698200C0);
    uint64_t v106 = 1;
    uint64_t v107 = v196;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v193 + 32))(v192, v104, v105);
    sub_24CC58C10();
    if (sub_24CC58D90())
    {
      uint64_t v108 = sub_24CC58D80();
      uint64_t v109 = sub_24CC499B0(v108);
      uint64_t v111 = v110;
      char v113 = v112;
      uint64_t v115 = v114;
      swift_bridgeObjectRelease();
      uint64_t v116 = v113 & 1;
    }
    else
    {
      uint64_t v109 = 0;
      uint64_t v111 = 0;
      uint64_t v116 = 0;
      uint64_t v115 = 0;
    }
    uint64_t v117 = v162;
    sub_24CC38A70(v69, v162, (void (*)(void))type metadata accessor for ListStyleAnswerSnippet);
    unint64_t v118 = (*(unsigned __int8 *)(v159 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80);
    uint64_t v119 = swift_allocObject();
    sub_24CC387B0(v117, v119 + v118);
    uint64_t v120 = (uint64_t)v164;
    (*(void (**)(char *, char *, uint64_t))(v161 + 32))(v164, v191, v163);
    uint64_t v121 = v166;
    v122 = (uint64_t *)(v120 + *(int *)(v166 + 20));
    uint64_t *v122 = v109;
    v122[1] = v111;
    v122[2] = v116;
    v122[3] = v115;
    v123 = (uint64_t (**)(uint64_t, uint64_t))(v120 + *(int *)(v121 + 24));
    *v123 = sub_24CC38C94;
    v123[1] = (uint64_t (*)(uint64_t, uint64_t))v119;
    uint64_t v124 = sub_24CC38E08(&qword_269820188, (void (*)(uint64_t))type metadata accessor for AttributionView);
    v125 = v157;
    sub_24CC595D0();
    sub_24CC38CF4(v120, (void (*)(void))type metadata accessor for AttributionView);
    uint64_t v127 = v200;
    uint64_t v126 = v201;
    v128 = v189;
    (*(void (**)(char *, void, uint64_t))(v200 + 104))(v189, *MEMORY[0x263F76980], v201);
    uint64_t v210 = v121;
    uint64_t v211 = v124;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v130 = v158;
    uint64_t v131 = v168;
    sub_24CC595B0();
    (*(void (**)(char *, uint64_t))(v127 + 8))(v128, v126);
    (*(void (**)(char *, uint64_t))(v167 + 8))(v125, v131);
    v132 = v176;
    sub_24CC593B0();
    uint64_t v210 = v131;
    uint64_t v211 = OpaqueTypeConformance2;
    uint64_t v133 = swift_getOpaqueTypeConformance2();
    v134 = v172;
    uint64_t v135 = v173;
    sub_24CC59690();
    (*(void (**)(char *, uint64_t))(v177 + 8))(v132, v178);
    (*(void (**)(char *, uint64_t))(v171 + 8))(v130, v135);
    v136 = v179;
    sub_24CC59330();
    uint64_t v210 = v135;
    uint64_t v211 = v133;
    swift_getOpaqueTypeConformance2();
    uint64_t v137 = (uint64_t)v170;
    uint64_t v138 = v175;
    sub_24CC596A0();
    (*(void (**)(char *, uint64_t))(v180 + 8))(v136, v165);
    (*(void (**)(char *, uint64_t))(v174 + 8))(v134, v138);
    (*(void (**)(char *, uint64_t))(v193 + 8))(v192, v105);
    uint64_t v139 = v169;
    sub_24CC38D4C(v137, v169);
    uint64_t v107 = v196;
    sub_24CC38D4C(v139, v196);
    uint64_t v106 = 0;
  }
  __swift_storeEnumTagSinglePayload(v107, v106, 1, v197);
  uint64_t v140 = v203;
  sub_24CC38B94((uint64_t)v206, v203, &qword_269820150);
  uint64_t v142 = v204;
  uint64_t v141 = v205;
  v143 = *(void (**)(char *, char *, uint64_t))(v204 + 16);
  v144 = v208;
  v143(v208, v207, v205);
  uint64_t v145 = v190;
  sub_24CC38B94((uint64_t)v209, v190, &qword_269820150);
  uint64_t v146 = v198;
  sub_24CC38B94(v107, v198, &qword_269820128);
  uint64_t v147 = v195;
  sub_24CC38B94(v140, v195, &qword_269820150);
  v148 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269820180);
  v143((char *)(v147 + v148[12]), v144, v141);
  sub_24CC38B94(v145, v147 + v148[16], &qword_269820150);
  sub_24CC38B94(v146, v147 + v148[20], &qword_269820128);
  sub_24CC34878(v107, &qword_269820128);
  sub_24CC34878((uint64_t)v209, &qword_269820150);
  v149 = *(void (**)(char *, uint64_t))(v142 + 8);
  v149(v207, v141);
  sub_24CC34878((uint64_t)v206, &qword_269820150);
  sub_24CC34878(v146, &qword_269820128);
  sub_24CC34878(v145, &qword_269820150);
  v149(v208, v141);
  return sub_24CC34878(v203, &qword_269820150);
}

BOOL sub_24CC37F68()
{
  uint64_t v0 = sub_24CC58D70();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - v5;
  sub_24CC58D50();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F39870], v0);
  char v7 = sub_24CC58D60();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return (v7 & 1) == 0;
}

uint64_t sub_24CC380A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v63 = a1;
  uint64_t v64 = a2;
  uint64_t v62 = sub_24CC58A30();
  uint64_t v60 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v59 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24CC59010();
  uint64_t v5 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  char v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820020);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24CC58AE0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v52 - v19;
  sub_24CC58D40();
  uint64_t v21 = sub_24CC58C20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v21) == 1)
  {
    sub_24CC34878((uint64_t)v10, &qword_2698200C0);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
    uint64_t v22 = v64;
    uint64_t v23 = (uint64_t)v13;
    goto LABEL_22;
  }
  uint64_t v56 = v5;
  uint64_t v57 = v15;
  uint64_t v24 = v7;
  uint64_t v25 = v62;
  uint64_t v53 = v20;
  char v54 = v13;
  uint64_t v55 = a3;
  uint64_t v26 = sub_24CC58C00();
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v10, v21);
  uint64_t v27 = *(void *)(v26 + 16);
  uint64_t v58 = v26;
  if (!v27)
  {
    uint64_t v37 = 1;
    uint64_t v22 = v64;
    uint64_t v40 = (uint64_t)v59;
    uint64_t v39 = v60;
    uint64_t v23 = (uint64_t)v54;
    uint64_t v38 = v25;
    char v7 = v24;
    uint64_t v5 = v56;
    uint64_t v41 = v57;
    goto LABEL_21;
  }
  uint64_t v52 = v24;
  uint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v57 + 16);
  unint64_t v29 = v26 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
  uint64_t v30 = (void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v31 = *(void *)(v57 + 72);
  sub_24CC58A00();
  while (1)
  {
    v28(v18, v29, v14);
    uint64_t v32 = (void *)sub_24CC58A80();
    uint64_t v33 = sub_24CC498D8(v32);
    uint64_t v22 = v64;
    if (v64) {
      break;
    }
    if (!v34) {
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
LABEL_15:
    (*v30)(v18, v14);
    v29 += v31;
    if (!--v27)
    {
      swift_bridgeObjectRelease();
      uint64_t v37 = 1;
      uint64_t v5 = v56;
      char v7 = v52;
      uint64_t v22 = v64;
      uint64_t v38 = v62;
      uint64_t v40 = (uint64_t)v59;
      uint64_t v39 = v60;
      uint64_t v41 = v57;
      uint64_t v23 = (uint64_t)v54;
      goto LABEL_21;
    }
  }
  if (!v34) {
    goto LABEL_15;
  }
  uint64_t v22 = v64;
  if (v33 != v63 || v34 != v64)
  {
    char v36 = sub_24CC59AA0();
    swift_bridgeObjectRelease();
    if (v36)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = v64;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t v41 = v57;
  uint64_t v23 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v54, v18, v14);
  uint64_t v37 = 0;
  uint64_t v5 = v56;
  char v7 = v52;
  uint64_t v38 = v62;
  uint64_t v40 = (uint64_t)v59;
  uint64_t v39 = v60;
LABEL_21:
  __swift_storeEnumTagSinglePayload(v23, v37, 1, v14);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v23, 1, v14) == 1)
  {
LABEL_22:
    sub_24CC34878(v23, &qword_269820020);
    sub_24CC58FF0();
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_24CC59000();
    os_log_type_t v43 = sub_24CC599C0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      uint64_t v65 = v63;
      uint64_t v66 = v22;
      uint64_t v67 = v45;
      sub_24CC58A00();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269820198);
      uint64_t v46 = sub_24CC59900();
      uint64_t v65 = sub_24CC3AC7C(v46, v47, &v67);
      sub_24CC59A00();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC31000, v42, v43, "No attribution item found for %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25330E970](v45, -1, -1);
      MEMORY[0x25330E970](v44, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v61);
  }
  else
  {
    char v49 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v53, v23, v14);
    sub_24CC58BC0();
    sub_24CC58BB0();
    uint64_t v50 = v38;
    uint64_t v51 = (void *)sub_24CC58A80();
    sub_24CC58DD0();
    sub_24CC44450(v51, v40);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v50);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v49, v14);
  }
}

uint64_t sub_24CC387B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ListStyleAnswerSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC38814@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ListStyleAnswerSnippet();
  OUTLINED_FUNCTION_4_0(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_24CC369B4(v5, a1);
}

unint64_t sub_24CC38864()
{
  unint64_t result = qword_2698200F0;
  if (!qword_2698200F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698200D0);
    sub_24CC35E84(&qword_2698200F8, &qword_2698200C8);
    sub_24CC38E08(&qword_269820100, (void (*)(uint64_t))type metadata accessor for PunchoutModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698200F0);
  }
  return result;
}

uint64_t sub_24CC38934()
{
  return sub_24CC59220();
}

uint64_t sub_24CC38958()
{
  return sub_24CC59220();
}

uint64_t sub_24CC3897C(uint64_t a1)
{
  sub_24CC59190();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4 - v3, a1);
  return sub_24CC59230();
}

uint64_t sub_24CC38A18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CC4F384();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CC38A48()
{
  return sub_24CC4F3C0();
}

uint64_t sub_24CC38A70(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_6_0();
  v5(v4);
  return a2;
}

unint64_t sub_24CC38AC4()
{
  unint64_t result = qword_269820160;
  if (!qword_269820160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820130);
    sub_24CC38E08(&qword_269820168, (void (*)(uint64_t))type metadata accessor for ItemListView);
    sub_24CC35E84(&qword_269820170, &qword_269820178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820160);
  }
  return result;
}

uint64_t sub_24CC38B94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_6_0();
  v5(v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for ListStyleAnswerSnippet();
  OUTLINED_FUNCTION_3(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;
  sub_24CC58E00();
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v11 + 8))(v10);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_24CC38C94(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ListStyleAnswerSnippet();
  OUTLINED_FUNCTION_4_0(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_24CC380A4(a1, a2, v7);
}

uint64_t sub_24CC38CF4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24CC38D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC38DB4()
{
  sub_24CC38DF8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CC38DF8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24CC38E08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC38E50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

char *sub_24CC38EF4(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_24CC58CF0();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_24CC38FDC(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CC58CF0();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC39054(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24CC58CF0();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_24CC390E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24CC58CF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_24CC39180(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24CC58CF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_24CC391FC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58CF0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24CC39290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC392A4);
}

uint64_t sub_24CC392A4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24CC58CF0();
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_24CC39338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC3934C);
}

void *sub_24CC3934C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_24CC58CF0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SupplementarySnippet()
{
  uint64_t result = qword_2698201A0;
  if (!qword_2698201A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC39414()
{
  uint64_t result = sub_24CC58CF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC394AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC394C8()
{
  uint64_t v1 = type metadata accessor for SupplementarySnippet();
  uint64_t v2 = OUTLINED_FUNCTION_3(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_24CC3A6F0(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SupplementarySnippet);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_24CC3A63C((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698201B0);
  sub_24CC35E84(&qword_2698201B8, &qword_2698201B0);
  return sub_24CC59800();
}

uint64_t sub_24CC395F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v3 = type metadata accessor for SupplementarySnippet();
  uint64_t v81 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v82 = v4;
  uint64_t v86 = (uint64_t)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TipCollectionBannerView();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v77 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201C0);
  MEMORY[0x270FA5388](v74);
  uint64_t v75 = (uint64_t)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201C8);
  MEMORY[0x270FA5388](v78);
  uint64_t v76 = (uint64_t)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201D0);
  uint64_t v84 = *(void *)(v9 - 8);
  uint64_t v85 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v79 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201D8);
  uint64_t v80 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  uint64_t v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201E0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CC58C90();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v73 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v67 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201E8);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v89 = (uint64_t)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  char v87 = (char *)&v67 - v25;
  uint64_t v26 = type metadata accessor for ActionButtonsView();
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v88 = (uint64_t)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (uint64_t *)((char *)&v67 - v29);
  uint64_t v83 = a1;
  uint64_t v31 = sub_24CC58CD0();
  uint64_t v32 = sub_24CC39ED8(1, v31);
  uint64_t v36 = sub_24CC39F88(v32, v33, v34, v35);
  sub_24CC58CE0();
  sub_24CC598A0();
  sub_24CC3AAD0((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
  *uint64_t v30 = sub_24CC591D0();
  v30[1] = v37;
  v30[2] = v36;
  sub_24CC58CC0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {
    sub_24CC3AB18((uint64_t)v15, &qword_2698201E0);
    uint64_t v38 = 1;
    uint64_t v39 = v90;
    uint64_t v40 = (uint64_t)v87;
  }
  else
  {
    uint64_t v71 = v12;
    uint64_t v41 = v17;
    uint64_t v72 = v17;
    uint64_t v69 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    uint64_t v42 = v21;
    uint64_t v68 = v16;
    v69(v21, v15, v16);
    os_log_type_t v43 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
    uint64_t v44 = (uint64_t)v77;
    uint64_t v70 = v21;
    v43(v77, v21, v16);
    char v45 = sub_24CC593F0();
    uint64_t v46 = v75;
    sub_24CC3A6F0(v44, v75, (void (*)(void))type metadata accessor for TipCollectionBannerView);
    uint64_t v47 = v46 + *(int *)(v74 + 36);
    *(unsigned char *)uint64_t v47 = v45;
    *(_OWORD *)(v47 + 8) = 0u;
    *(_OWORD *)(v47 + 24) = 0u;
    *(unsigned char *)(v47 + 40) = 1;
    sub_24CC3A744(v44, (void (*)(void))type metadata accessor for TipCollectionBannerView);
    uint64_t v48 = v76;
    sub_24CC38B94(v46, v76, &qword_2698201C0);
    uint64_t v49 = v78;
    *(unsigned char *)(v48 + *(int *)(v78 + 36)) = 0;
    sub_24CC3AB18(v46, &qword_2698201C0);
    uint64_t v50 = v73;
    uint64_t v51 = v42;
    uint64_t v52 = v68;
    v43(v73, v51, v68);
    uint64_t v53 = v86;
    sub_24CC3A6F0(v83, v86, (void (*)(void))type metadata accessor for SupplementarySnippet);
    unint64_t v54 = (*(unsigned __int8 *)(v72 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
    unint64_t v55 = (v18 + *(unsigned __int8 *)(v81 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
    uint64_t v56 = swift_allocObject();
    v69((char *)(v56 + v54), v50, v52);
    sub_24CC3A63C(v53, v56 + v55);
    unint64_t v57 = sub_24CC3A984();
    uint64_t v58 = v79;
    sub_24CC59650();
    swift_release();
    sub_24CC3AB18(v48, &qword_2698201C8);
    uint64_t v92 = v49;
    unint64_t v93 = v57;
    swift_getOpaqueTypeConformance2();
    uint64_t v59 = v71;
    uint64_t v60 = v85;
    sub_24CC595D0();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v58, v60);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v70, v52);
    uint64_t v40 = (uint64_t)v87;
    uint64_t v61 = v90;
    (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v87, v59, v90);
    uint64_t v38 = 0;
    uint64_t v39 = v61;
  }
  __swift_storeEnumTagSinglePayload(v40, v38, 1, v39);
  uint64_t v62 = v88;
  sub_24CC3A6F0((uint64_t)v30, v88, (void (*)(void))type metadata accessor for ActionButtonsView);
  uint64_t v63 = v89;
  sub_24CC38B94(v40, v89, &qword_2698201E8);
  uint64_t v64 = v91;
  sub_24CC3A6F0(v62, v91, (void (*)(void))type metadata accessor for ActionButtonsView);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698201F0);
  sub_24CC38B94(v63, v64 + *(int *)(v65 + 48), &qword_2698201E8);
  sub_24CC3AB18(v40, &qword_2698201E8);
  sub_24CC3A744((uint64_t)v30, (void (*)(void))type metadata accessor for ActionButtonsView);
  sub_24CC3AB18(v63, &qword_2698201E8);
  return sub_24CC3A744(v62, (void (*)(void))type metadata accessor for ActionButtonsView);
}

uint64_t sub_24CC39ED8(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_24CC3B66C(0, result, v3);
  if (v4) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = result;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
  if (v3 >= v5)
  {
    sub_24CC58F30();
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_24CC39F88(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_24CC59AB0();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v11 = *(void *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_24CC3B4E0(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_24CC3A070(uint64_t a1, id *a2)
{
  uint64_t v41 = sub_24CC58830();
  uint64_t v4 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CC58A30();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v36 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CC58C90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24CC59010();
  uint64_t v34 = *(void *)(v12 - 8);
  uint64_t v35 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC58FF0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v39 = a1;
  v15(v11, a1, v8);
  uint64_t v16 = sub_24CC59000();
  os_log_type_t v17 = sub_24CC599B0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v32 = v8;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v43 = v33;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v20 = sub_24CC58C60();
    if (v21)
    {
      unint64_t v22 = v21;
    }
    else
    {
      uint64_t v20 = 0;
      unint64_t v22 = 0xE000000000000000;
    }
    os_log_t v31 = v16;
    uint64_t v42 = sub_24CC3AC7C(v20, v22, &v43);
    sub_24CC59A00();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v32);
    os_log_t v23 = v31;
    _os_log_impl(&dword_24CC31000, v31, v17, "Tip Collection (%s) tapped", v19, 0xCu);
    uint64_t v24 = v33;
    swift_arrayDestroy();
    MEMORY[0x25330E970](v24, -1, -1);
    MEMORY[0x25330E970](v19, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v35);
  type metadata accessor for SupplementarySnippet();
  uint64_t v25 = v36;
  sub_24CC58CE0();
  type metadata accessor for ActionHandler();
  uint64_t v26 = swift_allocObject();
  sub_24CC58FF0();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v26 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v25, v38);
  uint64_t v27 = v40;
  sub_24CC58C40();
  if (*a2)
  {
    id v28 = *a2;
    sub_24CC520C8();
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v27, v41);
  }
  else
  {
    sub_24CC598A0();
    sub_24CC3AAD0((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    uint64_t result = sub_24CC591C0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CC3A558()
{
  uint64_t v1 = *(void *)(type metadata accessor for SupplementarySnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;

  sub_24CC58CF0();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = OUTLINED_FUNCTION_3_0();
  v7(v6);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24CC3A63C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SupplementarySnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC3A6A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SupplementarySnippet();
  OUTLINED_FUNCTION_4_0(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_24CC395F8(v5, a1);
}

uint64_t sub_24CC3A6F0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_6_0();
  v5(v4);
  return a2;
}

uint64_t sub_24CC3A744(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_3_0();
  v4(v3);
  return a1;
}

uint64_t sub_24CC3A794()
{
  uint64_t v1 = sub_24CC58C90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for SupplementarySnippet() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  sub_24CC58CF0();
  OUTLINED_FUNCTION_4();
  uint64_t v11 = OUTLINED_FUNCTION_3_0();
  v12(v11);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_24CC3A8FC()
{
  uint64_t v1 = sub_24CC58C90();
  OUTLINED_FUNCTION_3(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for SupplementarySnippet();
  OUTLINED_FUNCTION_4_0(v6);
  uint64_t v8 = (id *)(v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));
  return sub_24CC3A070(v0 + v3, v8);
}

unint64_t sub_24CC3A984()
{
  unint64_t result = qword_2698201F8;
  if (!qword_2698201F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698201C8);
    sub_24CC3AA24();
    sub_24CC35E84(&qword_269820070, &qword_269820078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698201F8);
  }
  return result;
}

unint64_t sub_24CC3AA24()
{
  unint64_t result = qword_269820200;
  if (!qword_269820200)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698201C0);
    sub_24CC3AAD0(&qword_269820208, (void (*)(uint64_t))type metadata accessor for TipCollectionBannerView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820200);
  }
  return result;
}

uint64_t sub_24CC3AAD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC3AB18(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_3_0();
  v4(v3);
  return a1;
}

uint64_t sub_24CC3AB64(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_24CC58F30() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_24CC59A90();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_24CC3AC7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CC3AD50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CC3B484((uint64_t)v12, *a3);
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
      sub_24CC3B484((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_24CC58A00();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24CC3AD50(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24CC3AEA8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24CC59A10();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_24CC3AF80(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_24CC59A40();
    if (!v8)
    {
      uint64_t result = sub_24CC59A60();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_24CC3AEA8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24CC59A90();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_24CC3AF80(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CC3B018(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_24CC3B1F4(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_24CC3B1F4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CC3B018(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_24CC59920();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_24CC3B18C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_24CC59A30();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_24CC59A90();
  __break(1u);
LABEL_14:
  uint64_t result = sub_24CC59A60();
  __break(1u);
  return result;
}

void *sub_24CC3B18C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820210);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24CC3B1F4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269820210);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24CC3B3A4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24CC3B2CC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24CC3B2CC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24CC59A90();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_24CC3B3A4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24CC59A90();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_24CC3B484(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24CC3B4E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      size_t v11 = (void *)MEMORY[0x263F8EE78];
LABEL_12:
      if (v4 != a3)
      {
        uint64_t v14 = *(void *)(sub_24CC58F30() - 8);
        sub_24CC3AB64(a2 + *(void *)(v14 + 72) * a3, v5, (unint64_t)v11+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)));
        return;
      }
      goto LABEL_17;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269820218);
    uint64_t v8 = *(void *)(sub_24CC58F30() - 8);
    uint64_t v9 = *(void *)(v8 + 72);
    unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    size_t v11 = (void *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    if (v9)
    {
      if (v12 - v10 != 0x8000000000000000 || v9 != -1)
      {
        v11[2] = v5;
        v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
        goto LABEL_12;
      }
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      return;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
}

uint64_t sub_24CC3B66C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_24CC3B6B8()
{
  return sub_24CC35E84(&qword_269820220, &qword_269820228);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t *sub_24CC3B704(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    int64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_24CC58B90();
    unint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_24CC3B7EC(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CC58B90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC3B864(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  int64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24CC58B90();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_retain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_24CC3B8FC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  int64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CC58B90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_24CC3B998(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58B90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24CC3BA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC3BA38);
}

uint64_t sub_24CC3BA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24CC58B90();
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_24CC3BACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC3BAE0);
}

void sub_24CC3BAE0()
{
  OUTLINED_FUNCTION_6_1();
  if (v3 == 2147483646)
  {
    *(void *)(v1 + 8) = v0;
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_24CC58B90();
    uint64_t v6 = v1 + *(int *)(v4 + 20);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

uint64_t type metadata accessor for TipSnippetContentView(uint64_t a1)
{
  return sub_24CC3FA3C(a1, (uint64_t *)&unk_269820260);
}

uint64_t sub_24CC3BB7C()
{
  uint64_t result = sub_24CC58B90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC3BC14()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_24CC3BC30(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24CC3BC40()
{
  return sub_24CC59B30();
}

uint64_t sub_24CC3BC68()
{
  return sub_24CC59B40();
}

BOOL sub_24CC3BCB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24CC3BC30(*a1, *a2);
}

uint64_t sub_24CC3BCBC()
{
  return sub_24CC3BC68();
}

uint64_t sub_24CC3BCC4()
{
  return sub_24CC3BC40();
}

uint64_t sub_24CC3BCCC()
{
  return sub_24CC59B40();
}

uint64_t sub_24CC3BD10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820270);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v60 = v3;
  uint64_t v4 = type metadata accessor for TipSnippetContentView(0);
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v56 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820278);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820280);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820288);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820290) - 8;
  MEMORY[0x270FA5388](v57);
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v21 - v20;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820298) - 8;
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_1_0();
  uint64_t v58 = v23;
  long long v63 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202A0);
  sub_24CC59740();
  *(void *)uint64_t v9 = v62;
  *(void *)(v9 + 8) = 0x402C000000000000;
  *(unsigned char *)(v9 + 16) = 0;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202A8);
  sub_24CC3C278(v9 + *(int *)(v24 + 44));
  sub_24CC3FAE0((uint64_t)v1, (uint64_t)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for TipSnippetContentView);
  unint64_t v25 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v26 = swift_allocObject();
  sub_24CC4285C((uint64_t)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25, (void (*)(void))type metadata accessor for TipSnippetContentView);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = sub_24CC3CC10;
  *(void *)(v27 + 24) = v26;
  sub_24CC38B94(v9, v14, &qword_269820278);
  id v28 = (void *)(v14 + *(int *)(v11 + 44));
  *id v28 = sub_24CC3CC8C;
  v28[1] = v27;
  sub_24CC435C4(v9, &qword_269820278);
  LOBYTE(v26) = sub_24CC593E0();
  sub_24CC59080();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  sub_24CC38B94(v14, v19, &qword_269820280);
  uint64_t v37 = v19 + *(int *)(v16 + 44);
  *(unsigned char *)uint64_t v37 = v26;
  *(void *)(v37 + 8) = v30;
  *(void *)(v37 + 16) = v32;
  *(void *)(v37 + 24) = v34;
  *(void *)(v37 + 32) = v36;
  *(unsigned char *)(v37 + 40) = 0;
  sub_24CC435C4(v14, &qword_269820280);
  type metadata accessor for CGSize();
  OUTLINED_FUNCTION_7_0();
  long long v38 = v63;
  uint64_t v56 = v64;
  uint64_t v39 = sub_24CC596E0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_24CC59470();
  uint64_t v41 = sub_24CC59450();
  uint64_t v42 = v60;
  __swift_storeEnumTagSinglePayload(v60, 1, 1, v41);
  uint64_t v43 = sub_24CC59480();
  sub_24CC435C4(v42, &qword_269820270);
  uint64_t v44 = swift_getKeyPath();
  uint64_t v45 = sub_24CC59780();
  uint64_t v47 = v46;
  sub_24CC38B94(v19, v22, &qword_269820288);
  uint64_t v48 = v56;
  uint64_t v49 = v22 + *(int *)(v57 + 44);
  *(_OWORD *)uint64_t v49 = v38;
  *(void *)(v49 + 16) = v48;
  *(void *)(v49 + 24) = 0x6C69662E73706974;
  *(void *)(v49 + 32) = 0xE90000000000006CLL;
  *(void *)(v49 + 40) = KeyPath;
  *(void *)(v49 + 48) = v39;
  *(void *)(v49 + 56) = v44;
  *(void *)(v49 + 64) = v43;
  *(void *)(v49 + 72) = v45;
  *(void *)(v49 + 80) = v47;
  sub_24CC435C4(v19, &qword_269820288);
  OUTLINED_FUNCTION_7_0();
  long long v50 = v63;
  uint64_t v51 = v64;
  uint64_t v52 = v58;
  sub_24CC38B94(v22, v58, &qword_269820290);
  uint64_t v53 = v52 + *(int *)(v59 + 44);
  *(_OWORD *)uint64_t v53 = v50;
  *(void *)(v53 + 16) = v51;
  sub_24CC435C4(v22, &qword_269820290);
  LOBYTE(v51) = sub_24CC593E0();
  uint64_t v54 = v61;
  sub_24CC38B94(v52, v61, &qword_269820298);
  *(unsigned char *)(v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698202B0) + 36)) = v51;
  return sub_24CC435C4(v52, &qword_269820298);
}

uint64_t sub_24CC3C278@<X0>(uint64_t a1@<X8>)
{
  uint64_t v66 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202B8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v65 = (uint64_t *)((char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v61 = (uint64_t *)((char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v60 = (uint64_t *)((char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for TipSnippetContentView.BodyView(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v62 = (uint64_t)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D0) - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v63);
  uint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v64 = (uint64_t)&v57 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TipSnippetContentView.ImageView(0);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (uint64_t *)((char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E0);
  uint64_t v21 = v20 - 8;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v57 - v25;
  uint64_t v59 = (uint64_t)&v57 - v25;
  type metadata accessor for TipSnippetContentView(0);
  sub_24CC58B50();
  *uint64_t v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  swift_storeEnumTagMultiPayload();
  sub_24CC43614((uint64_t)v15, (uint64_t)v19 + *(int *)(v17 + 28), &qword_2698202D8);
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 0;
  uint64_t v28 = sub_24CC59790();
  uint64_t v30 = v29;
  sub_24CC3FAE0((uint64_t)v19, (uint64_t)v24, (void (*)(void))type metadata accessor for TipSnippetContentView.ImageView);
  uint64_t v31 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v24[*(int *)(v21 + 44)];
  *uint64_t v31 = sub_24CC3FAD8;
  v31[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v27;
  v31[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v28;
  v31[3] = v30;
  sub_24CC3FBD4((uint64_t)v19, (void (*)(void))type metadata accessor for TipSnippetContentView.ImageView);
  sub_24CC43614((uint64_t)v24, (uint64_t)v26, &qword_2698202E0);
  uint64_t v58 = sub_24CC58B60();
  uint64_t v33 = v32;
  uint64_t v34 = sub_24CC58AF0();
  uint64_t v35 = sub_24CC58B80();
  uint64_t v37 = v36;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = (uint64_t)v60;
  *uint64_t v60 = v39;
  swift_storeEnumTagMultiPayload();
  uint64_t v41 = swift_getKeyPath();
  uint64_t v42 = (uint64_t)v61;
  *uint64_t v61 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
  swift_storeEnumTagMultiPayload();
  uint64_t v43 = swift_getKeyPath();
  uint64_t v44 = (uint64_t)v65;
  *uint64_t v65 = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  swift_storeEnumTagMultiPayload();
  uint64_t v56 = v34;
  uint64_t v45 = v62;
  sub_24CC3C888(KeyPath, 0, 0, v40, v42, v44, v58, v33, v62, 4.0, v56, v35, v37);
  uint64_t v46 = swift_allocObject();
  *(unsigned char *)(v46 + 16) = 1;
  uint64_t v47 = sub_24CC59790();
  uint64_t v49 = v48;
  sub_24CC3FAE0(v45, (uint64_t)v11, (void (*)(void))type metadata accessor for TipSnippetContentView.BodyView);
  long long v50 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v11[*(int *)(v63 + 44)];
  *long long v50 = sub_24CC437C0;
  v50[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v46;
  v50[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v47;
  v50[3] = v49;
  sub_24CC3FBD4(v45, (void (*)(void))type metadata accessor for TipSnippetContentView.BodyView);
  uint64_t v51 = v64;
  sub_24CC43614((uint64_t)v11, v64, &qword_2698202D0);
  uint64_t v52 = v59;
  sub_24CC38B94(v59, (uint64_t)v24, &qword_2698202E0);
  sub_24CC38B94(v51, (uint64_t)v11, &qword_2698202D0);
  uint64_t v53 = v66;
  sub_24CC38B94((uint64_t)v24, v66, &qword_2698202E0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F8);
  sub_24CC38B94((uint64_t)v11, v53 + *(int *)(v54 + 48), &qword_2698202D0);
  sub_24CC435C4(v51, &qword_2698202D0);
  sub_24CC435C4(v52, &qword_2698202E0);
  sub_24CC435C4((uint64_t)v11, &qword_2698202D0);
  return sub_24CC435C4((uint64_t)v24, &qword_2698202E0);
}

uint64_t sub_24CC3C888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(double *)&long long v30 = a10;
  sub_24CC3FC28();
  sub_24CC590D0();
  uint64_t v20 = (int *)type metadata accessor for TipSnippetContentView.BodyView(0);
  uint64_t v21 = a9 + v20[5];
  *(void *)uint64_t v21 = a1;
  *(void *)(v21 + 8) = a2;
  *(unsigned char *)(v21 + 16) = a3 & 1;
  sub_24CC43614(a4, a9 + v20[6], &qword_2698202C8);
  sub_24CC43614(a5, a9 + v20[7], &qword_2698202C0);
  sub_24CC43614(a6, a9 + v20[8], &qword_2698202B8);
  uint64_t v22 = v20[9];
  sub_24CC59730();
  *(_OWORD *)(a9 + v22) = v30;
  uint64_t v23 = v20[10];
  sub_24CC59730();
  *(_OWORD *)(a9 + v23) = v30;
  uint64_t v24 = a9 + v20[11];
  type metadata accessor for CGSize();
  sub_24CC59730();
  *(_OWORD *)uint64_t v24 = v30;
  *(void *)(v24 + 16) = v31;
  uint64_t v25 = (void *)(a9 + v20[12]);
  *uint64_t v25 = a7;
  v25[1] = a8;
  *(void *)(a9 + v20[13]) = a11;
  uint64_t v26 = (void *)(a9 + v20[14]);
  *uint64_t v26 = a12;
  v26[1] = a13;
  return sub_24CC59500();
}

uint64_t sub_24CC3CA38(uint64_t a1)
{
  sub_24CC3CAD0(0, a1);
  if (v3 & 1) != 0 || (double v4 = v2, sub_24CC3CAD0(1, a1), (v6) || v4 >= v5) {
    sub_24CC59310();
  }
  else {
    sub_24CC59300();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202A0);
  return sub_24CC59750();
}

uint64_t sub_24CC3CAD0(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_24CC3F8C8(a1 & 1), (v4 & 1) != 0)) {
    return *(void *)(*(void *)(a2 + 56) + 16 * v3);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CC3CB28()
{
  uint64_t v1 = *(void *)(type metadata accessor for TipSnippetContentView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  swift_release();
  sub_24CC58B90();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1();
  v5();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_24CC3CC10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TipSnippetContentView(0);
  OUTLINED_FUNCTION_4_0(v2);
  return sub_24CC3CA38(a1);
}

uint64_t sub_24CC3CC54()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC3CC8C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_24CC3CCB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v105 = a1;
  uint64_t v100 = sub_24CC59320();
  uint64_t v98 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v97 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_24CC591A0();
  MEMORY[0x270FA5388](v96);
  uint64_t v99 = (char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CC588E0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v77 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_24CC597C0();
  uint64_t v79 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v78 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698204A0);
  uint64_t v83 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v80 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698204A8);
  uint64_t v89 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  char v87 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698204B0);
  MEMORY[0x270FA5388](v84);
  uint64_t v91 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698204B8);
  MEMORY[0x270FA5388](v88);
  uint64_t v95 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698204C0);
  MEMORY[0x270FA5388](v92);
  uint64_t v93 = (uint64_t)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698204C8);
  MEMORY[0x270FA5388](v104);
  v94 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_24CC590B0();
  uint64_t v13 = *(void *)(v101 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v101);
  uint64_t v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v73 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v76 = (uint64_t)&v73 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v102 = (char *)&v73 - v22;
  v103 = (char *)sub_24CC58830();
  uint64_t v86 = *((void *)v103 - 1);
  MEMORY[0x270FA5388](v103);
  uint64_t v82 = (char *)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v73 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_24CC58B40();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  long long v30 = (char *)&v73 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for TipSnippetContentView.ImageView(0);
  sub_24CC38B94(v1 + *(int *)(v31 + 20), (uint64_t)v26, &qword_2698202D8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27) == 1)
  {
    uint64_t v32 = &qword_2698202D8;
  }
  else
  {
    uint64_t v74 = v28;
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    uint64_t v75 = v27;
    v33(v30, v26, v27);
    sub_24CC4FFF0();
    uint64_t v34 = v101;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x263F18508], v101);
    char v35 = sub_24CC590A0();
    uint64_t v36 = *(void (**)(char *, uint64_t))(v13 + 8);
    v36(v16, v34);
    v36(v18, v34);
    uint64_t v26 = v102;
    if (v35) {
      sub_24CC58B20();
    }
    else {
      sub_24CC58B10();
    }
    uint64_t v37 = (uint64_t)v103;
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, (uint64_t)v103) != 1)
    {
      v103 = v30;
      uint64_t v41 = v86;
      uint64_t v42 = v82;
      (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v82, v26, v37);
      uint64_t v43 = v76;
      __swift_storeEnumTagSinglePayload(v76, 1, 1, v37);
      sub_24CC588D0();
      sub_24CC435C4(v43, &qword_269820018);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698204D0);
      sub_24CC43508();
      uint64_t v44 = v78;
      sub_24CC597D0();
      uint64_t v45 = sub_24CC4357C(&qword_2698204E0, MEMORY[0x263F77558]);
      uint64_t v46 = v80;
      uint64_t v47 = v81;
      sub_24CC595E0();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v44, v47);
      sub_24CC3D9D8();
      sub_24CC3D9D8();
      *(void *)&long long v106 = v47;
      *((void *)&v106 + 1) = v45;
      swift_getOpaqueTypeConformance2();
      uint64_t v48 = v87;
      uint64_t v49 = v85;
      sub_24CC59590();
      (*(void (**)(char *, uint64_t))(v83 + 8))(v46, v49);
      id v50 = objc_msgSend(self, sel_tertiarySystemFillColor);
      uint64_t v51 = MEMORY[0x25330E0E0](v50);
      LOBYTE(v44) = sub_24CC593E0();
      uint64_t v52 = v89;
      uint64_t v53 = (uint64_t)v91;
      uint64_t v54 = v90;
      (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v91, v48, v90);
      uint64_t v55 = v53 + *(int *)(v84 + 36);
      *(void *)uint64_t v55 = v51;
      *(unsigned char *)(v55 + 8) = (_BYTE)v44;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v48, v54);
      uint64_t v57 = v97;
      uint64_t v56 = v98;
      uint64_t v58 = v100;
      (*(void (**)(char *, void, uint64_t))(v98 + 104))(v97, *MEMORY[0x263F19860], v100);
      uint64_t v59 = v99;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(&v99[*(int *)(v96 + 20)], v57, v58);
      __asm { FMOV            V0.2D, #10.0 }
      *uint64_t v59 = _Q0;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v58);
      uint64_t v65 = (uint64_t)v95;
      uint64_t v66 = (uint64_t)&v95[*(int *)(v88 + 36)];
      sub_24CC3FAE0((uint64_t)v59, v66, MEMORY[0x263F19048]);
      *(_WORD *)(v66 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698204E8) + 36)) = 256;
      sub_24CC38B94(v53, v65, &qword_2698204B0);
      sub_24CC3FBD4((uint64_t)v59, MEMORY[0x263F19048]);
      sub_24CC435C4(v53, &qword_2698204B0);
      sub_24CC3D9D8();
      sub_24CC3D9D8();
      sub_24CC59790();
      sub_24CC59130();
      uint64_t v67 = v93;
      sub_24CC38B94(v65, v93, &qword_2698204B8);
      uint64_t v68 = (_OWORD *)(v67 + *(int *)(v92 + 36));
      long long v69 = v107;
      *uint64_t v68 = v106;
      v68[1] = v69;
      v68[2] = v108;
      sub_24CC435C4(v65, &qword_2698204B8);
      uint64_t v40 = v104;
      uint64_t v70 = (uint64_t)v94;
      sub_24CC4FFF0();
      sub_24CC43614(v67, v70, &qword_2698204C0);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v37);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v103, v75);
      uint64_t v71 = v70;
      uint64_t v39 = v105;
      sub_24CC43614(v71, v105, &qword_2698204C8);
      uint64_t v38 = 0;
      return __swift_storeEnumTagSinglePayload(v39, v38, 1, v40);
    }
    (*(void (**)(char *, uint64_t))(v74 + 8))(v30, v75);
    uint64_t v32 = &qword_269820018;
  }
  sub_24CC435C4((uint64_t)v26, v32);
  uint64_t v38 = 1;
  uint64_t v40 = v104;
  uint64_t v39 = v105;
  return __swift_storeEnumTagSinglePayload(v39, v38, 1, v40);
}

uint64_t sub_24CC3D950@<X0>(uint64_t a1@<X8>)
{
  if (!sub_24CC597B0()) {
    sub_24CC596C0();
  }
  uint64_t result = sub_24CC59370();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

double sub_24CC3D9D8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TipSnippetContentView.ImageView(0);
  sub_24CC38B94(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_2698202D8);
  uint64_t v5 = sub_24CC58B40();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v5) == 1)
  {
    sub_24CC435C4((uint64_t)v3, &qword_2698202D8);
    double v6 = 1.0;
  }
  else
  {
    sub_24CC58B30();
    double v6 = v7;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  }
  return 102.0 / v6;
}

uint64_t sub_24CC3DAF8()
{
  type metadata accessor for TipSnippetContentView.BodyView(0);
  sub_24CC42D40();
  sub_24CC58A00();
  uint64_t v0 = sub_24CC59550();
  uint64_t v2 = v1;
  char v4 = v3;
  if (qword_26981FFD0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CC59530();
  sub_24CC38DF8(v0, v2, v4 & 1);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24CC3DC20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v89 = a1;
  uint64_t v87 = sub_24CC59090();
  uint64_t v88 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v84 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for TipSnippetContentView.BodyView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v93 = *(void *)(v3 - 8);
  uint64_t v92 = *(void *)(v93 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v97 = (uint64_t)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820430);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v91 = (uint64_t (*)(uint64_t))((char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v75 = (uint64_t (*)(uint64_t))((char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v79 = sub_24CC59040();
  uint64_t v81 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v76 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820438);
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v78 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820440);
  MEMORY[0x270FA5388](v80);
  uint64_t v96 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820448);
  uint64_t v86 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v98 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820450);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24CC59070();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_24CC59060();
  uint64_t v77 = *(void *)(v94 - 8);
  uint64_t v21 = v77;
  MEMORY[0x270FA5388](v94);
  uint64_t v95 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v73 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835F0]);
  sub_24CC596F0();
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v106 = 0;
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F7F730], v17);
  uint64_t v23 = v1;
  long long v99 = *(_OWORD *)(v1 + *(int *)(v4 + 48));
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820420);
  sub_24CC59740();
  sub_24CC58A00();
  sub_24CC58880();
  uint64_t v24 = sub_24CC58890();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v24);
  sub_24CC59020();
  uint64_t v25 = v95;
  sub_24CC59050();
  uint64_t v26 = v4;
  uint64_t v74 = v4;
  uint64_t v27 = sub_24CC58830();
  __swift_storeEnumTagSinglePayload((uint64_t)v75, 1, 1, v27);
  uint64_t v28 = *(void (**)(uint64_t (*)(uint64_t), char *, uint64_t))(v21 + 16);
  uint64_t v29 = v91;
  uint64_t v30 = v94;
  v28(v91, v25, v94);
  __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v30);
  uint64_t v31 = (void *)(v23 + *(int *)(v26 + 52));
  uint64_t v33 = v31[1];
  unint64_t v34 = v31[2];
  *(void *)&long long v99 = *v31;
  uint64_t v32 = v99;
  *((void *)&v99 + 1) = v33;
  unint64_t v100 = v34;
  sub_24CC58A00();
  sub_24CC58A00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820458);
  sub_24CC59740();
  *(void *)&long long v99 = v32;
  *((void *)&v99 + 1) = v33;
  unint64_t v100 = v34;
  sub_24CC59740();
  char v35 = v76;
  sub_24CC59030();
  uint64_t v36 = v23;
  uint64_t v37 = v23;
  uint64_t v90 = v23;
  uint64_t v38 = v97;
  sub_24CC3FAE0(v36, v97, (void (*)(void))type metadata accessor for TipSnippetContentView.BodyView);
  uint64_t v39 = *(unsigned __int8 *)(v93 + 80);
  uint64_t v40 = ((v39 + 16) & ~v39) + v92;
  uint64_t v41 = (v39 + 16) & ~v39;
  uint64_t v92 = v39 | 7;
  uint64_t v93 = v40;
  uint64_t v42 = swift_allocObject();
  id v73 = (id)v41;
  uint64_t v91 = type metadata accessor for TipSnippetContentView.BodyView;
  uint64_t v43 = v38;
  sub_24CC4285C(v38, v42 + v41, (void (*)(void))type metadata accessor for TipSnippetContentView.BodyView);
  sub_24CC4357C(&qword_269820460, MEMORY[0x263F7F728]);
  uint64_t v44 = v78;
  uint64_t v45 = v79;
  sub_24CC59610();
  swift_release();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v35, v45);
  uint64_t v75 = type metadata accessor for TipSnippetContentView.BodyView;
  sub_24CC3FAE0(v37, v43, (void (*)(void))type metadata accessor for TipSnippetContentView.BodyView);
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = v46 + v41;
  uint64_t v48 = v91;
  sub_24CC4285C(v43, v47, (void (*)(void))v91);
  uint64_t v49 = v82;
  id v50 = v96;
  uint64_t v51 = v83;
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v96, v44, v83);
  uint64_t v52 = v80;
  uint64_t v53 = &v50[*(int *)(v80 + 36)];
  *(void *)uint64_t v53 = sub_24CC42BB8;
  *((void *)v53 + 1) = v46;
  *((void *)v53 + 2) = 0;
  *((void *)v53 + 3) = 0;
  (*(void (**)(char *, uint64_t))(v49 + 8))(v44, v51);
  uint64_t v54 = v74;
  uint64_t v55 = v90;
  uint64_t v56 = v84;
  sub_24CC501F8();
  uint64_t v57 = v55;
  uint64_t v58 = v97;
  sub_24CC3FAE0(v57, v97, (void (*)(void))type metadata accessor for TipSnippetContentView.BodyView);
  uint64_t v59 = swift_allocObject();
  id v60 = v73;
  uint64_t v61 = v58;
  sub_24CC4285C(v58, (uint64_t)v73 + v59, (void (*)(void))v48);
  unint64_t v62 = sub_24CC42BC0();
  uint64_t v63 = sub_24CC4357C(&qword_269820470, MEMORY[0x263F18460]);
  uint64_t v64 = v56;
  uint64_t v65 = v87;
  uint64_t v66 = (uint64_t)v96;
  sub_24CC596B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v64, v65);
  sub_24CC435C4(v66, &qword_269820440);
  uint64_t v67 = (uint64_t *)(v90 + *(int *)(v54 + 56));
  uint64_t v68 = v67[1];
  uint64_t v102 = *v67;
  uint64_t v103 = v68;
  sub_24CC3FAE0(v90, v61, (void (*)(void))v75);
  uint64_t v69 = swift_allocObject();
  sub_24CC4285C(v61, (uint64_t)v60 + v69, (void (*)(void))v91);
  sub_24CC58A00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820198);
  *(void *)&long long v99 = v52;
  *((void *)&v99 + 1) = v65;
  unint64_t v100 = v62;
  uint64_t v101 = v63;
  swift_getOpaqueTypeConformance2();
  sub_24CC42CD4();
  uint64_t v70 = v85;
  uint64_t v71 = v98;
  sub_24CC596B0();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v71, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v95, v94);
}

uint64_t sub_24CC3E818(double a1, double a2)
{
  return sub_24CC3E8C8(a1, a2);
}

uint64_t sub_24CC3E8C8(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24CC59190();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820480);
  uint64_t result = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 != 0.0 || a2 != 0.0)
  {
    uint64_t v45 = v7;
    uint64_t v46 = v6;
    uint64_t v14 = type metadata accessor for TipSnippetContentView.BodyView(0);
    uint64_t v15 = v3 + *(int *)(v14 + 60);
    if (qword_26981FFD8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_24CC594E0();
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v16);
    sub_24CC594F0();
    double v18 = v17;
    sub_24CC435C4((uint64_t)v13, &qword_269820480);
    uint64_t v19 = sub_24CC3DAF8();
    uint64_t v21 = v20;
    uint64_t v47 = v15;
    char v23 = v22 & 1;
    uint64_t v43 = v14;
    uint64_t v44 = v3;
    uint64_t v24 = v3 + *(int *)(v14 + 20);
    uint64_t v26 = *(void *)v24;
    uint64_t v25 = *(void *)(v24 + 8);
    char v27 = *(unsigned char *)(v24 + 16);
    sub_24CC40228(*(void *)v24, v25, v27);
    sub_24CC5002C();
    sub_24CC4049C(v26, v25, v27);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v16);
    sub_24CC594F0();
    double v29 = v28;
    sub_24CC38DF8(v19, v21, v23);
    swift_bridgeObjectRelease();
    uint64_t result = sub_24CC435C4((uint64_t)v13, &qword_269820480);
    double v30 = round(v29 / v18);
    if ((~*(void *)&v30 & 0x7FF0000000000000) != 0)
    {
      uint64_t v32 = v45;
      uint64_t v31 = v46;
      if (v30 > -9.22337204e18)
      {
        if (v30 < 9.22337204e18)
        {
          uint64_t v33 = (uint64_t)v30;
          uint64_t v35 = v43;
          uint64_t v34 = v44;
          sub_24CC50478();
          char v36 = sub_24CC59180();
          uint64_t v37 = *(void (**)(char *, uint64_t))(v32 + 8);
          v37(v9, v31);
          if (v36)
          {
            if (v33 >= 9)
            {
LABEL_10:
              sub_24CC50478();
              char v38 = sub_24CC59180();
              v37(v9, v31);
              if (v38) {
                uint64_t v33 = 9;
              }
              else {
                uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
              }
              long long v49 = *(_OWORD *)(v34 + *(int *)(v35 + 40));
              uint64_t v39 = 1;
              goto LABEL_19;
            }
          }
          else if (v33 == 0x7FFFFFFFFFFFFFFFLL)
          {
            goto LABEL_10;
          }
          sub_24CC50478();
          char v40 = sub_24CC59180();
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v37)(v9, v31);
          uint64_t v41 = 10;
          if ((v40 & 1) == 0) {
            uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
          }
          BOOL v42 = __OFSUB__(v41, v33);
          uint64_t v39 = v41 - v33;
          if (!v42)
          {
            long long v49 = *(_OWORD *)(v34 + *(int *)(v35 + 40));
LABEL_19:
            uint64_t v48 = v39;
            __swift_instantiateConcreteTypeFromMangledName(&qword_269820420);
            sub_24CC59750();
            long long v49 = *(_OWORD *)(v34 + *(int *)(v35 + 36));
            uint64_t v48 = v33;
            __swift_instantiateConcreteTypeFromMangledName(&qword_269820420);
            return sub_24CC59750();
          }
LABEL_24:
          __break(1u);
          return result;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
  return result;
}

uint64_t sub_24CC3ED14()
{
  type metadata accessor for TipSnippetContentView.BodyView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820458);
  sub_24CC59740();
  return sub_24CC3E8C8(v1, v2);
}

uint64_t sub_24CC3ED80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v19 = sub_24CC58890();
  uint64_t v17 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698203D8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698203E0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24CC59360();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  sub_24CC590E0();
  uint64_t v12 = v20;
  *(void *)uint64_t v6 = v11;
  *((void *)v6 + 1) = v12;
  v6[16] = 0;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698203E8);
  sub_24CC3F060(v1, (uint64_t)&v6[*(int *)(v13 + 44)]);
  sub_24CC42800();
  sub_24CC599E0();
  uint64_t v14 = sub_24CC35E84(&qword_2698203F8, &qword_2698203D8);
  sub_24CC59670();
  sub_24CC435C4((uint64_t)v6, &qword_2698203D8);
  type metadata accessor for TipSnippetContentView.BodyView(0);
  sub_24CC58A00();
  sub_24CC58880();
  uint64_t v20 = v4;
  uint64_t v21 = v14;
  swift_getOpaqueTypeConformance2();
  sub_24CC59680();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24CC3F060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820400);
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v58 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v44[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820408) - 8;
  MEMORY[0x270FA5388](v55);
  uint64_t v8 = &v44[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820410) - 8;
  MEMORY[0x270FA5388](v56);
  uint64_t v10 = &v44[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820418) - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v54);
  uint64_t v13 = &v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v48 = &v44[-v14];
  uint64_t v15 = sub_24CC3DAF8();
  uint64_t v51 = v16;
  uint64_t v52 = v15;
  uint64_t v53 = v17;
  int v50 = v18 & 1;
  int v49 = sub_24CC59400();
  uint64_t v19 = (int *)type metadata accessor for TipSnippetContentView.BodyView(0);
  uint64_t v20 = a1 + v19[5];
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *(void *)(v20 + 8);
  char v23 = *(unsigned char *)(v20 + 16);
  sub_24CC40228(*(void *)v20, v22, v23);
  sub_24CC5002C();
  sub_24CC4049C(v21, v22, v23);
  sub_24CC59080();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  long long v59 = *(_OWORD *)(a1 + v19[9]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820420);
  sub_24CC59740();
  uint64_t v47 = v60;
  uint64_t KeyPath = swift_getKeyPath();
  int v45 = sub_24CC59390();
  sub_24CC3DC20((uint64_t)v6);
  long long v59 = *(_OWORD *)(a1 + v19[10]);
  sub_24CC59740();
  uint64_t v32 = v60;
  uint64_t v33 = swift_getKeyPath();
  uint64_t v35 = v57;
  uint64_t v34 = v58;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v57 + 16))(v8, v6, v58);
  char v36 = &v8[*(int *)(v55 + 44)];
  *(void *)char v36 = v33;
  *((void *)v36 + 1) = v32;
  v36[16] = 0;
  (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v6, v34);
  LODWORD(v33) = sub_24CC593A0();
  sub_24CC38B94((uint64_t)v8, (uint64_t)v10, &qword_269820408);
  *(_DWORD *)&v10[*(int *)(v56 + 44)] = v33;
  sub_24CC435C4((uint64_t)v8, &qword_269820408);
  sub_24CC38B94((uint64_t)v10, (uint64_t)v13, &qword_269820410);
  *(_WORD *)&v13[*(int *)(v54 + 44)] = 256;
  sub_24CC435C4((uint64_t)v10, &qword_269820410);
  uint64_t v37 = v48;
  sub_24CC43614((uint64_t)v13, (uint64_t)v48, &qword_269820418);
  sub_24CC38B94((uint64_t)v37, (uint64_t)v13, &qword_269820418);
  uint64_t v39 = v51;
  uint64_t v38 = v52;
  *(void *)a2 = v52;
  *(void *)(a2 + 8) = v39;
  char v40 = v49;
  LOBYTE(v35) = v50;
  *(unsigned char *)(a2 + 16) = v50;
  *(void *)(a2 + 24) = v53;
  *(unsigned char *)(a2 + 32) = v40;
  *(void *)(a2 + 40) = v25;
  *(void *)(a2 + 48) = v27;
  *(void *)(a2 + 56) = v29;
  *(void *)(a2 + 64) = v31;
  *(unsigned char *)(a2 + 72) = 0;
  uint64_t v41 = v47;
  *(void *)(a2 + 80) = KeyPath;
  *(void *)(a2 + 88) = v41;
  *(unsigned char *)(a2 + 96) = 0;
  *(_DWORD *)(a2 + 100) = v45;
  *(_WORD *)(a2 + 104) = 256;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820428);
  sub_24CC38B94((uint64_t)v13, a2 + *(int *)(v42 + 48), &qword_269820418);
  sub_24CC42848(v38, v39, v35);
  sub_24CC58A00();
  swift_retain();
  sub_24CC435C4((uint64_t)v37, &qword_269820418);
  sub_24CC435C4((uint64_t)v13, &qword_269820418);
  sub_24CC38DF8(v38, v39, v35);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC3F4F4()
{
  sub_24CC59420();
  uint64_t v0 = sub_24CC59430();
  uint64_t result = swift_release();
  qword_269820230 = v0;
  return result;
}

uint64_t sub_24CC3F530()
{
  if (qword_26981FFD0 != -1) {
    swift_once();
  }
  uint64_t result = sub_24CC59530();
  qword_269820238 = result;
  unk_269820240 = v1;
  byte_269820248 = v2 & 1;
  qword_269820250 = v3;
  return result;
}

uint64_t sub_24CC3F5B4()
{
  type metadata accessor for CGSize();
  sub_24CC3FC74();
  uint64_t result = sub_24CC598B0();
  qword_269820258 = result;
  return result;
}

uint64_t *sub_24CC3F604()
{
  if (qword_26981FFE0 != -1) {
    swift_once();
  }
  return &qword_269820258;
}

uint64_t sub_24CC3F650(uint64_t *a1, void (*a2)(uint64_t *__return_ptr))
{
  a2(&v4);
  return sub_24CC42D9C(v4, (uint64_t)sub_24CC4330C, 0, a1);
}

uint64_t sub_24CC3F6B8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_24CC3F604();
  return sub_24CC58A00();
}

uint64_t sub_24CC3F700@<X0>(char a1@<W1>, uint64_t *a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = sub_24CC596C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820308);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CC5A2A0;
  *(unsigned char *)(inited + 32) = v3;
  sub_24CC59140();
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = v7;
  type metadata accessor for CGSize();
  sub_24CC3FC74();
  uint64_t result = sub_24CC598B0();
  *a2 = v4;
  a2[1] = result;
  return result;
}

void sub_24CC3F7A4(uint64_t a1@<X8>)
{
  *(double *)a1 = sub_24CC4BFD8();
  *(void *)(a1 + 8) = v2;
}

uint64_t sub_24CC3F7D0()
{
  return sub_24CC4C014();
}

uint64_t sub_24CC3F7F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

unint64_t sub_24CC3F8C8(char a1)
{
  char v1 = a1 & 1;
  sub_24CC59B20();
  sub_24CC59B30();
  uint64_t v2 = sub_24CC59B40();
  return sub_24CC3F938(v1, v2);
}

unint64_t sub_24CC3F938(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for TipSnippetContentView.BodyView(uint64_t a1)
{
  return sub_24CC3FA3C(a1, (uint64_t *)&unk_269820320);
}

uint64_t type metadata accessor for TipSnippetContentView.ImageView(uint64_t a1)
{
  return sub_24CC3FA3C(a1, (uint64_t *)&unk_269820350);
}

uint64_t sub_24CC3FA3C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC3FA70()
{
  return sub_24CC59210();
}

uint64_t sub_24CC3FA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CC3F7F8(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_24CC3FAD8@<X0>(uint64_t *a1@<X8>)
{
  return sub_24CC3F700(*(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_24CC3FAE0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_6_0();
  v5(v4);
  return a2;
}

void sub_24CC3FB34(uint64_t a1@<X8>)
{
  *(double *)a1 = sub_24CC4BFD8();
  *(void *)(a1 + 8) = v2;
}

uint64_t sub_24CC3FB64()
{
  return sub_24CC59200();
}

uint64_t sub_24CC3FB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CC3F7F8(a1, a2, a3, a4, MEMORY[0x263F18460], MEMORY[0x263F19208]);
}

uint64_t sub_24CC3FBD4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1();
  v3();
  return a1;
}

unint64_t sub_24CC3FC28()
{
  unint64_t result = qword_269820300;
  if (!qword_269820300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820300);
  }
  return result;
}

unint64_t sub_24CC3FC74()
{
  unint64_t result = qword_269820310;
  if (!qword_269820310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820310);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TipSnippetContentView.ViewIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TipSnippetContentView.ViewIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC3FE20);
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

uint64_t sub_24CC3FE48(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CC3FE54(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TipSnippetContentView.ViewIdentifier()
{
  return &type metadata for TipSnippetContentView.ViewIdentifier;
}

uint64_t *sub_24CC3FE70(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *((void *)v10 + 1);
    char v13 = v10[16];
    sub_24CC40228(*(void *)v10, v12, v13);
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
    v9[16] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_24CC590B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = a3[7];
    uint64_t v20 = (uint64_t *)((char *)a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_24CC59090();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = a3[8];
    uint64_t v24 = (uint64_t *)((char *)a1 + v23);
    uint64_t v25 = (uint64_t *)((char *)a2 + v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_24CC59190();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    }
    else
    {
      *uint64_t v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = a3[9];
    uint64_t v28 = a3[10];
    uint64_t v29 = (uint64_t *)((char *)a1 + v27);
    uint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = (uint64_t *)((char *)a1 + v28);
    uint64_t v33 = (uint64_t *)((char *)a2 + v28);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = a3[11];
    uint64_t v36 = a3[12];
    uint64_t v37 = (char *)a1 + v35;
    uint64_t v38 = (char *)a2 + v35;
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
    *((void *)v37 + 2) = *((void *)v38 + 2);
    uint64_t v39 = (uint64_t *)((char *)a1 + v36);
    char v40 = (uint64_t *)((char *)a2 + v36);
    uint64_t v41 = *v40;
    uint64_t v42 = v40[1];
    uint64_t v43 = a3[13];
    uint64_t v44 = a3[14];
    uint64_t v45 = *(uint64_t *)((char *)a2 + v43);
    *uint64_t v39 = v41;
    v39[1] = v42;
    *(uint64_t *)((char *)a1 + v43) = v45;
    uint64_t v46 = (uint64_t *)((char *)a1 + v44);
    uint64_t v47 = *(uint64_t *)((char *)a2 + v44 + 8);
    uint64_t v48 = a3[15];
    uint64_t v52 = (char *)a1 + v48;
    uint64_t v53 = (char *)a2 + v48;
    *uint64_t v46 = *(uint64_t *)((char *)a2 + v44);
    v46[1] = v47;
    uint64_t v49 = sub_24CC59510();
    int v50 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24CC58A00();
    sub_24CC58A00();
    sub_24CC58A00();
    v50(v52, v53, v49);
  }
  return a1;
}

uint64_t sub_24CC40228(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24CC40234(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_24CC4049C(*(void *)(a1 + a2[5]), *(void *)(a1 + a2[5] + 8), *(unsigned char *)(a1 + a2[5] + 16));
  uint64_t v5 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CC590B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_24CC59090();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_24CC59190();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + a2[15];
  uint64_t v12 = sub_24CC59510();
  char v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
  return v13(v11, v12);
}

uint64_t sub_24CC4049C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC404A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  sub_24CC40228(*(void *)v9, v11, v12);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_24CC590B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *uint64_t v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_24CC59090();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *uint64_t v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_24CC59190();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *uint64_t v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = a3[9];
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v25);
  uint64_t v28 = (void *)(a2 + v25);
  uint64_t v29 = v28[1];
  void *v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = (void *)(a1 + v26);
  uint64_t v31 = (void *)(a2 + v26);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  uint64_t v33 = a3[11];
  uint64_t v34 = a3[12];
  uint64_t v35 = a1 + v33;
  uint64_t v36 = a2 + v33;
  *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
  *(void *)(v35 + 16) = *(void *)(v36 + 16);
  uint64_t v37 = (void *)(a1 + v34);
  uint64_t v38 = (uint64_t *)(a2 + v34);
  uint64_t v39 = *v38;
  uint64_t v40 = v38[1];
  uint64_t v41 = a3[13];
  uint64_t v42 = a3[14];
  uint64_t v43 = *(void *)(a2 + v41);
  void *v37 = v39;
  v37[1] = v40;
  *(void *)(a1 + v41) = v43;
  uint64_t v44 = (void *)(a1 + v42);
  uint64_t v45 = *(void *)(a2 + v42 + 8);
  uint64_t v46 = a3[15];
  uint64_t v50 = a1 + v46;
  uint64_t v51 = a2 + v46;
  *uint64_t v44 = *(void *)(a2 + v42);
  v44[1] = v45;
  uint64_t v47 = sub_24CC59510();
  uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24CC58A00();
  sub_24CC58A00();
  sub_24CC58A00();
  v48(v50, v51, v47);
  return a1;
}

uint64_t sub_24CC40810(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  sub_24CC40228(*(void *)v9, v11, v12);
  uint64_t v13 = *(void *)v8;
  uint64_t v14 = *(void *)(v8 + 8);
  char v15 = *(unsigned char *)(v8 + 16);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  sub_24CC4049C(v13, v14, v15);
  if (a1 != a2)
  {
    uint64_t v16 = a3[6];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (void *)(a2 + v16);
    sub_24CC435C4(a1 + v16, &qword_2698202E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_24CC590B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[7];
    uint64_t v21 = (void *)(a1 + v20);
    uint64_t v22 = (void *)(a2 + v20);
    sub_24CC435C4(a1 + v20, &qword_2698202F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_24CC59090();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      void *v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = a3[8];
    uint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = (void *)(a2 + v24);
    sub_24CC435C4(a1 + v24, &qword_269820158);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_24CC59190();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *uint64_t v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v28 = a3[9];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  void *v29 = *v30;
  v29[1] = v30[1];
  swift_retain();
  swift_release();
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  uint64_t v34 = a3[11];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  *uint64_t v35 = *v36;
  v35[1] = v36[1];
  v35[2] = v36[2];
  swift_retain();
  swift_release();
  uint64_t v37 = a3[12];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  *uint64_t v38 = *v39;
  v38[1] = v39[1];
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[14];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(a2 + v40);
  *uint64_t v41 = *v42;
  v41[1] = v42[1];
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[15];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = sub_24CC59510();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
  return a1;
}

uint64_t sub_24CC40C0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = (void *)(a1 + v8);
  char v12 = (const void *)(a2 + v8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_24CC590B0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_24CC59090();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_24CC59190();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  uint64_t v25 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v25) = *(_OWORD *)(a2 + v25);
  uint64_t v26 = a3[11];
  uint64_t v27 = a3[12];
  uint64_t v28 = a1 + v26;
  uint64_t v29 = a2 + v26;
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  *(void *)(v28 + 16) = *(void *)(v29 + 16);
  *(_OWORD *)(a1 + v27) = *(_OWORD *)(a2 + v27);
  uint64_t v30 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  long long v31 = *(_OWORD *)(a2 + v30);
  uint64_t v32 = a3[15];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  *(_OWORD *)(a1 + v30) = v31;
  uint64_t v35 = sub_24CC59510();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
  return a1;
}

uint64_t sub_24CC40F14(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 16);
  uint64_t v11 = *(void *)v8;
  uint64_t v12 = *(void *)(v8 + 8);
  char v13 = *(unsigned char *)(v8 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v10;
  sub_24CC4049C(v11, v12, v13);
  if (a1 != a2)
  {
    uint64_t v14 = a3[6];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (const void *)(a2 + v14);
    sub_24CC435C4(a1 + v14, &qword_2698202E8);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_24CC590B0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    uint64_t v19 = a3[7];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (const void *)(a2 + v19);
    sub_24CC435C4(a1 + v19, &qword_2698202F0);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_24CC59090();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    uint64_t v24 = a3[8];
    uint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = (const void *)(a2 + v24);
    sub_24CC435C4(a1 + v24, &qword_269820158);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_24CC59190();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v28 - 8) + 32))(v25, v26, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
  }
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)(a1 + v29);
  long long v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_release();
  uint64_t v34 = a3[10];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (uint64_t *)(a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_release();
  uint64_t v39 = a3[11];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  *(void *)(v40 + 16) = *(void *)(v41 + 16);
  swift_release();
  uint64_t v42 = a3[12];
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (uint64_t *)(a2 + v42);
  uint64_t v46 = *v44;
  uint64_t v45 = v44[1];
  *uint64_t v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRelease();
  uint64_t v47 = a3[14];
  uint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = (uint64_t *)(a2 + v47);
  uint64_t v51 = *v49;
  uint64_t v50 = v49[1];
  *uint64_t v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  uint64_t v52 = a3[15];
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  uint64_t v55 = sub_24CC59510();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 40))(v53, v54, v55);
  return a1;
}

uint64_t sub_24CC412C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC412D4);
}

uint64_t sub_24CC412D4(uint64_t a1, uint64_t a2, int *a3)
{
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
LABEL_15:
    return __swift_getEnumTagSinglePayload(v9, v3, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == v3)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[6];
LABEL_14:
    uint64_t v9 = v4 + v12;
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v14 + 84) == v3)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[7];
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202B8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v16 + 84) == v3)
  {
    uint64_t v8 = v15;
    uint64_t v12 = a3[8];
    goto LABEL_14;
  }
  if (v3 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_24CC59510();
    uint64_t v12 = a3[15];
    goto LABEL_14;
  }
  unint64_t v17 = *(void *)(v4 + a3[13]);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

uint64_t sub_24CC413FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC41410);
}

void sub_24CC41410(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C8);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C0);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[7];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698202B8);
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[8];
        }
        else
        {
          if (a3 == 0x7FFFFFFF)
          {
            *(void *)(v5 + a4[13]) = (v4 - 1);
            return;
          }
          uint64_t v10 = sub_24CC59510();
          uint64_t v14 = a4[15];
        }
      }
    }
    uint64_t v11 = v5 + v14;
  }
  __swift_storeEnumTagSinglePayload(v11, v4, v4, v10);
}

void sub_24CC41534()
{
  sub_24CC41778();
  if (v0 <= 0x3F)
  {
    sub_24CC423C8(319, &qword_269820338, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      sub_24CC423C8(319, &qword_269820340, MEMORY[0x263F18460], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F)
      {
        sub_24CC423C8(319, (unint64_t *)&qword_269820348, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
        if (v3 <= 0x3F)
        {
          sub_24CC59510();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_24CC41778()
{
  if (!qword_269820330)
  {
    sub_24CC3FC28();
    unint64_t v0 = sub_24CC590F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269820330);
    }
  }
}

ValueMetadata *type metadata accessor for ViewSizePreferenceKey()
{
  return &type metadata for ViewSizePreferenceKey;
}

uint64_t *sub_24CC417E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CC590B0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_24CC58B40();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t sub_24CC41998(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24CC590B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_24CC58B40();
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v8(v5, v6);
  }
  return result;
}

void *sub_24CC41A90(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CC590B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58B40();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  return a1;
}

void *sub_24CC41BF4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CC435C4((uint64_t)a1, &qword_2698202E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24CC590B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58B40();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_11;
  }
  if (v12)
  {
LABEL_11:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

char *sub_24CC41DF8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CC590B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24CC58B40();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

char *sub_24CC41F64(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CC435C4((uint64_t)a1, &qword_2698202E8);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CC590B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24CC58B40();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_10;
  }
  if (v13)
  {
LABEL_10:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t sub_24CC42170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC42184);
}

uint64_t sub_24CC42184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
    uint64_t v9 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t sub_24CC42204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC42218);
}

uint64_t sub_24CC42218(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202C8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698202D8);
    uint64_t v11 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, v4, v4, v10);
}

void sub_24CC422A0()
{
  sub_24CC423C8(319, &qword_269820338, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_24CC423C8(319, &qword_269820360, MEMORY[0x263F39848], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24CC423C8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_24CC42430()
{
  unint64_t result = qword_269820368;
  if (!qword_269820368)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698202B0);
    sub_24CC424D0();
    sub_24CC35E84(&qword_2698203C0, &qword_2698203C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820368);
  }
  return result;
}

unint64_t sub_24CC424D0()
{
  unint64_t result = qword_269820370;
  if (!qword_269820370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820298);
    sub_24CC4254C();
    sub_24CC4272C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820370);
  }
  return result;
}

unint64_t sub_24CC4254C()
{
  unint64_t result = qword_269820378;
  if (!qword_269820378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820290);
    sub_24CC425EC();
    sub_24CC35E84(&qword_2698203A8, &qword_2698203B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820378);
  }
  return result;
}

unint64_t sub_24CC425EC()
{
  unint64_t result = qword_269820380;
  if (!qword_269820380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820288);
    sub_24CC42668();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820380);
  }
  return result;
}

unint64_t sub_24CC42668()
{
  unint64_t result = qword_269820388;
  if (!qword_269820388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820280);
    sub_24CC35E84(&qword_269820390, &qword_269820278);
    sub_24CC35E84(&qword_269820398, &qword_2698203A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820388);
  }
  return result;
}

unint64_t sub_24CC4272C()
{
  unint64_t result = qword_2698203B8;
  if (!qword_2698203B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698203B8);
  }
  return result;
}

uint64_t sub_24CC42778()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC42794()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24CC427B4()
{
  unint64_t result = qword_2698203D0;
  if (!qword_2698203D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698203D0);
  }
  return result;
}

unint64_t sub_24CC42800()
{
  unint64_t result = qword_2698203F0;
  if (!qword_2698203F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2698203F0);
  }
  return result;
}

uint64_t sub_24CC42848(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return sub_24CC58A00();
  }
}

uint64_t sub_24CC4285C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_10_0();
  v5(v4);
  return a2;
}

uint64_t sub_24CC428B0(double a1, double a2)
{
  uint64_t v4 = type metadata accessor for TipSnippetContentView.BodyView(0);
  OUTLINED_FUNCTION_4_0(v4);
  return sub_24CC3E818(a1, a2);
}

uint64_t objectdestroy_49Tm()
{
  uint64_t v1 = type metadata accessor for TipSnippetContentView.BodyView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820318);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1();
  v5();
  sub_24CC4049C(*(void *)(v0 + v3 + *(int *)(v1 + 20)), *(void *)(v0 + v3 + *(int *)(v1 + 20) + 8), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 20) + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24CC590B0();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4_1();
    v6();
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24CC59090();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4_1();
    v7();
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24CC59190();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4_1();
    v8();
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CC59510();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1();
  v9();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

unint64_t sub_24CC42BC0()
{
  unint64_t result = qword_269820468;
  if (!qword_269820468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820440);
    sub_24CC59040();
    sub_24CC4357C(&qword_269820460, MEMORY[0x263F7F728]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820468);
  }
  return result;
}

uint64_t sub_24CC42CA0()
{
  uint64_t v0 = type metadata accessor for TipSnippetContentView.BodyView(0);
  OUTLINED_FUNCTION_4_0(v0);
  return sub_24CC3ED14();
}

unint64_t sub_24CC42CD4()
{
  unint64_t result = qword_269820478;
  if (!qword_269820478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820478);
  }
  return result;
}

unint64_t sub_24CC42D40()
{
  unint64_t result = qword_269820488;
  if (!qword_269820488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820488);
  }
  return result;
}

uint64_t sub_24CC42D8C(double *a1, char a2, double a3, double a4)
{
  *a1 = a3;
  a1[1] = a4;
  return a2 & 1;
}

uint64_t sub_24CC42D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *a4;
  *a4 = 0x8000000000000000;
  sub_24CC42E28(a1, a2, a3, isUniquelyReferenced_nonNull_native, &v10);
  *a4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC42E28(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_24CC43354(a1, a2, a3, &v31);
  sub_24CC58A00();
  swift_retain();
  char v7 = sub_24CC43390();
  if (v7 == 2)
  {
LABEL_2:
    swift_bridgeObjectRelease();
    swift_release();
    sub_24CC43500();
    return swift_release();
  }
  else
  {
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    while (1)
    {
      int v13 = (void *)*a5;
      char v14 = v7 & 1;
      unint64_t v16 = sub_24CC3F8C8(v7 & 1);
      uint64_t v17 = v13[2];
      BOOL v18 = (v15 & 1) == 0;
      uint64_t v19 = v17 + v18;
      if (__OFADD__(v17, v18)) {
        break;
      }
      char v20 = v15;
      if (v13[3] >= v19)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269820490);
          sub_24CC59A50();
        }
      }
      else
      {
        sub_24CC43020(v19, a4 & 1);
        unint64_t v21 = sub_24CC3F8C8(v14);
        if ((v20 & 1) != (v22 & 1)) {
          goto LABEL_18;
        }
        unint64_t v16 = v21;
      }
      uint64_t v23 = (void *)*a5;
      if (v20)
      {
        uint64_t v24 = (void *)(v23[7] + 16 * v16);
        *uint64_t v24 = v11;
        v24[1] = v12;
      }
      else
      {
        v23[(v16 >> 6) + 8] |= 1 << v16;
        *(unsigned char *)(v23[6] + v16) = v14;
        uint64_t v25 = (void *)(v23[7] + 16 * v16);
        *uint64_t v25 = v11;
        v25[1] = v12;
        uint64_t v26 = v23[2];
        BOOL v27 = __OFADD__(v26, 1);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_17;
        }
        v23[2] = v28;
      }
      char v7 = sub_24CC43390();
      uint64_t v11 = v29;
      uint64_t v12 = v30;
      a4 = 1;
      if (v7 == 2) {
        goto LABEL_2;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    uint64_t result = sub_24CC59AC0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CC43020(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820498);
  uint64_t result = sub_24CC59A80();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v34 = a2;
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
    if (!v12) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (unint64_t i = v15 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v8 << 6))
    {
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + i);
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 56) + 16 * i);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      sub_24CC59B20();
      sub_24CC59B30();
      uint64_t result = sub_24CC59B40();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v14 + 8 * (v25 >> 6))) == 0)
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          BOOL v30 = v26 == v29;
          if (v26 == v29) {
            unint64_t v26 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v26);
          if (v31 != -1)
          {
            unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v14 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_28:
      *(void *)(v14 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      *(unsigned char *)(*(void *)(v7 + 48) + v27) = v20;
      uint64_t v32 = (void *)(*(void *)(v7 + 56) + 16 * v27);
      *uint64_t v32 = v23;
      v32[1] = v22;
      ++*(void *)(v7 + 16);
      if (v12) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_39;
      }
      if (v17 >= v13) {
        goto LABEL_30;
      }
      unint64_t v18 = v9[v17];
      ++v8;
      if (!v18)
      {
        int64_t v8 = v17 + 1;
        if (v17 + 1 >= v13) {
          goto LABEL_30;
        }
        unint64_t v18 = v9[v8];
        if (!v18)
        {
          int64_t v19 = v17 + 2;
          if (v19 >= v13)
          {
LABEL_30:
            if ((v34 & 1) == 0)
            {
              uint64_t result = swift_release();
              uint64_t v3 = v2;
              goto LABEL_37;
            }
            uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
            if (v33 >= 64) {
              sub_24CC432F0(0, (unint64_t)(v33 + 63) >> 6, (void *)(v5 + 64));
            }
            else {
              *uint64_t v9 = -1 << v33;
            }
            uint64_t v3 = v2;
            *(void *)(v5 + 16) = 0;
            break;
          }
          unint64_t v18 = v9[v19];
          if (!v18)
          {
            while (1)
            {
              int64_t v8 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_40;
              }
              if (v8 >= v13) {
                goto LABEL_30;
              }
              unint64_t v18 = v9[v8];
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          int64_t v8 = v19;
        }
      }
LABEL_18:
      unint64_t v12 = (v18 - 1) & v18;
    }
  }
  uint64_t result = swift_release();
LABEL_37:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24CC432F0(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

__n128 sub_24CC4330C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = sub_24CC42D8C(v5.n128_f64, *(unsigned char *)a1, *(double *)(a1 + 8), *(double *)(a1 + 16));
  __n128 result = v5;
  *(unsigned char *)a2 = v3 & 1;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24CC43354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_24CC43390()
{
  void (*v9)(uint64_t *__return_ptr, char *);
  long long v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  char v19[8];
  long long v20;

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v8 = *(void *)(v1 + 48);
    uint64_t v7 = *(void *)(v1 + 56);
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, char *))v0[5];
    v19[0] = *(unsigned char *)(v8 + v6);
    uint64_t v10 = *(_OWORD *)(v7 + 16 * v6);
    v0[3] = v4;
    v0[4] = v5;
    char v20 = v10;
    v9(&v18, v19);
    return v18;
  }
  unint64_t v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    int64_t v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      uint64_t v14 = v0[1];
      unint64_t v15 = *(void *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        uint64_t v5 = (v15 - 1) & v15;
        unint64_t v6 = __clz(__rbit64(v15)) + (v12 << 6);
        int64_t v4 = v12;
        goto LABEL_3;
      }
      unint64_t v16 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        unint64_t v15 = *(void *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          unint64_t v12 = v16;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          unint64_t v15 = *(void *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            unint64_t v12 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v16 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            unint64_t v15 = *(void *)(v14 + 8 * v16);
            if (v15) {
              goto LABEL_10;
            }
            unint64_t v12 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              unint64_t v15 = *(void *)(v14 + 8 * v12);
              if (v15) {
                goto LABEL_7;
              }
              int64_t v4 = v13 - 1;
              int64_t v17 = v3 + 6;
              while (v17 < v13)
              {
                unint64_t v15 = *(void *)(v14 + 8 * v17++);
                if (v15)
                {
                  unint64_t v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
    return 2;
  }
  return result;
}

uint64_t sub_24CC43500()
{
  return swift_release();
}

unint64_t sub_24CC43508()
{
  unint64_t result = qword_2698204D8;
  if (!qword_2698204D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698204D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698204D8);
  }
  return result;
}

uint64_t sub_24CC4357C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC435C4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1();
  v3();
  return a1;
}

uint64_t sub_24CC43614(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_10_0();
  v5(v4);
  return a2;
}

uint64_t sub_24CC43664()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24CC43724()
{
  unint64_t result = qword_2698204F0;
  if (!qword_2698204F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698204F8);
    sub_24CC35E84(&qword_269820500, &qword_2698204C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698204F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  *(void *)(v0 - 160) = 0;
  *(void *)(v0 - 152) = 0;
  return sub_24CC59730();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0;
}

uint64_t DeviceExpertUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DeviceExpertUIPlugin.init()()
{
  return v0;
}

uint64_t DeviceExpertUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  type metadata accessor for TipSnippet();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_0();
  uint64_t v92 = v2;
  OUTLINED_FUNCTION_4_2();
  uint64_t v93 = sub_24CC58B90();
  OUTLINED_FUNCTION_0();
  uint64_t v91 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v90 = v5;
  OUTLINED_FUNCTION_4_2();
  type metadata accessor for SupplementarySnippet();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_0();
  uint64_t v88 = v7;
  OUTLINED_FUNCTION_4_2();
  uint64_t v89 = sub_24CC58CF0();
  OUTLINED_FUNCTION_0();
  uint64_t v87 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_0();
  uint64_t v86 = v10;
  OUTLINED_FUNCTION_4_2();
  type metadata accessor for SummarizedAnswerSnippet();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_0();
  uint64_t v96 = v12;
  OUTLINED_FUNCTION_4_2();
  uint64_t v97 = sub_24CC58E80();
  OUTLINED_FUNCTION_0();
  uint64_t v95 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_0();
  uint64_t v94 = v15;
  OUTLINED_FUNCTION_4_2();
  type metadata accessor for ListStyleAnswerSnippet();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_0();
  uint64_t v100 = v17;
  OUTLINED_FUNCTION_4_2();
  uint64_t v101 = sub_24CC58E00();
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1_0();
  uint64_t v98 = v20;
  OUTLINED_FUNCTION_4_2();
  uint64_t v105 = type metadata accessor for LearnMoreSnippet();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_2();
  uint64_t v24 = (uint64_t *)(v23 - v22);
  sub_24CC58CB0();
  OUTLINED_FUNCTION_0();
  uint64_t v103 = v26;
  uint64_t v104 = v25;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_1_0();
  uint64_t v102 = v27;
  OUTLINED_FUNCTION_4_2();
  uint64_t v28 = type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2();
  uint64_t v32 = (uint64_t *)(v31 - v30);
  uint64_t v33 = sub_24CC58D30();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v34;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_2();
  uint64_t v39 = v38 - v37;
  uint64_t v40 = sub_24CC58E90();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v41;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_2();
  uint64_t v46 = v45 - v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v45 - v44, a1, v40);
  int v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 88))(v46, v40);
  if (v47 == *MEMORY[0x263F39898])
  {
    uint64_t v48 = OUTLINED_FUNCTION_2_0();
    v49(v48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v39, v46, v33);
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))((char *)v32 + *(int *)(v28 + 20), v39, v33);
    sub_24CC598A0();
    sub_24CC442F4((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    *uint64_t v32 = OUTLINED_FUNCTION_8_0();
    v32[1] = v50;
    sub_24CC442F4(&qword_269820530, (void (*)(uint64_t))type metadata accessor for AttributionItemListSnippet);
    uint64_t v51 = sub_24CC59570();
    sub_24CC4423C((uint64_t)v32, (void (*)(void))type metadata accessor for AttributionItemListSnippet);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v39, v33);
    return v51;
  }
  if (v47 == *MEMORY[0x263F398B8])
  {
    uint64_t v52 = OUTLINED_FUNCTION_2_0();
    v53(v52);
    uint64_t v54 = OUTLINED_FUNCTION_9_0();
    v55(v54);
    (*(void (**)(char *, uint64_t, uint64_t))(v103 + 16))((char *)v24 + *(int *)(v105 + 20), v102, v104);
    sub_24CC598A0();
    sub_24CC442F4((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    *uint64_t v24 = OUTLINED_FUNCTION_8_0();
    v24[1] = v56;
    sub_24CC442F4(&qword_269820528, (void (*)(uint64_t))type metadata accessor for LearnMoreSnippet);
    uint64_t v51 = sub_24CC59570();
    sub_24CC4423C((uint64_t)v24, (void (*)(void))type metadata accessor for LearnMoreSnippet);
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v102, v104);
    return v51;
  }
  if (v47 == *MEMORY[0x263F398A0])
  {
    uint64_t v57 = OUTLINED_FUNCTION_2_0();
    v58(v57);
    uint64_t v60 = v98;
    uint64_t v59 = v99;
    OUTLINED_FUNCTION_10_1();
    uint64_t v61 = v101;
    OUTLINED_FUNCTION_5_0();
    v62();
    uint64_t v63 = v100;
    OUTLINED_FUNCTION_6_2();
    v64();
    sub_24CC442F4(&qword_269820520, (void (*)(uint64_t))type metadata accessor for ListStyleAnswerSnippet);
    uint64_t v51 = sub_24CC59570();
    uint64_t v65 = type metadata accessor for ListStyleAnswerSnippet;
LABEL_10:
    sub_24CC4423C(v63, (void (*)(void))v65);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v60, v61);
    return v51;
  }
  if (v47 == *MEMORY[0x263F398A8])
  {
    uint64_t v66 = OUTLINED_FUNCTION_2_0();
    v67(v66);
    uint64_t v60 = v94;
    uint64_t v59 = v95;
    OUTLINED_FUNCTION_10_1();
    uint64_t v61 = v97;
    OUTLINED_FUNCTION_5_0();
    v68();
    uint64_t v63 = v96;
    OUTLINED_FUNCTION_6_2();
    v69();
    sub_24CC442F4(&qword_269820518, (void (*)(uint64_t))type metadata accessor for SummarizedAnswerSnippet);
    uint64_t v51 = sub_24CC59570();
    uint64_t v65 = type metadata accessor for SummarizedAnswerSnippet;
    goto LABEL_10;
  }
  if (v47 == *MEMORY[0x263F39890])
  {
    uint64_t v71 = OUTLINED_FUNCTION_2_0();
    v72(v71);
    uint64_t v73 = v87;
    uint64_t v74 = v86;
    uint64_t v75 = v89;
    OUTLINED_FUNCTION_5_0();
    v76();
    uint64_t v77 = (uint64_t)v88;
    OUTLINED_FUNCTION_6_2();
    v78();
    sub_24CC598A0();
    sub_24CC442F4((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    *uint64_t v88 = OUTLINED_FUNCTION_8_0();
    v88[1] = v79;
    sub_24CC442F4(&qword_269820510, (void (*)(uint64_t))type metadata accessor for SupplementarySnippet);
    uint64_t v51 = sub_24CC59570();
    uint64_t v80 = type metadata accessor for SupplementarySnippet;
LABEL_16:
    sub_24CC4423C(v77, (void (*)(void))v80);
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v75);
    return v51;
  }
  if (v47 == *MEMORY[0x263F398B0])
  {
    uint64_t v81 = OUTLINED_FUNCTION_2_0();
    v82(v81);
    uint64_t v74 = v90;
    uint64_t v73 = v91;
    OUTLINED_FUNCTION_9_0();
    uint64_t v75 = v93;
    OUTLINED_FUNCTION_5_0();
    v83();
    uint64_t v77 = (uint64_t)v92;
    OUTLINED_FUNCTION_6_2();
    v84();
    sub_24CC598A0();
    sub_24CC442F4((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    *uint64_t v92 = OUTLINED_FUNCTION_8_0();
    v92[1] = v85;
    sub_24CC442F4(&qword_269820508, (void (*)(uint64_t))type metadata accessor for TipSnippet);
    uint64_t v51 = sub_24CC59570();
    uint64_t v80 = type metadata accessor for TipSnippet;
    goto LABEL_16;
  }
  uint64_t result = sub_24CC59A70();
  __break(1u);
  return result;
}

uint64_t sub_24CC4423C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t DeviceExpertUIPlugin.deinit()
{
  return v0;
}

uint64_t DeviceExpertUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24CC442AC()
{
  return sub_24CC442F4(&qword_269820538, MEMORY[0x263F398C0]);
}

uint64_t sub_24CC442F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC4433C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeviceExpertUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_24CC44364(uint64_t a1)
{
  return DeviceExpertUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for DeviceExpertUIPlugin()
{
  return self;
}

uint64_t method lookup function for DeviceExpertUIPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceExpertUIPlugin);
}

uint64_t dispatch thunk of DeviceExpertUIPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_24CC591D0();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return v0;
}

uint64_t sub_24CC44450(void *a1, uint64_t a2)
{
  v29[1] = a2;
  sub_24CC58A40();
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v6;
  uint64_t v31 = v5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_24CC58830();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  uint64_t v18 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v20 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v29 - v21;
  id v23 = objc_msgSend(a1, sel_punchOutUri);
  if (v23)
  {
    uint64_t v24 = v23;
    v29[0] = v2;
    sub_24CC58810();

    uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 32);
    v25(v14, v20, v15);
    __swift_storeEnumTagSinglePayload(v14, 0, 1, v15);
    if (__swift_getEnumTagSinglePayload(v14, 1, v15) != 1)
    {
      v25((uint64_t)v22, (char *)v14, v15);
      sub_24CC58A20();
      sub_24CC58A10();
      (*(void (**)(uint64_t, char *, uint64_t))(v17 + 16))(v3, v22, v15);
      (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v3, *MEMORY[0x263F39828], v31);
      sub_24CC58A50();
      v33[3] = v7;
      v33[4] = MEMORY[0x263F39838];
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
      uint64_t v27 = v32;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v32 + 16))(boxed_opaque_existential_1, v11, v7);
      sub_24CC58BA0();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v11, v7);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v15);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  }
  return sub_24CC44770(v14);
}

uint64_t sub_24CC44770(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_24CC44834()
{
  uint64_t v15 = sub_24CC58A40();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v14 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8 - v7;
  sub_24CC58A20();
  sub_24CC58A10();
  MEMORY[0x25330D8B0]();
  MEMORY[0x25330D8A0]();
  uint64_t v10 = MEMORY[0x25330D890]();
  if (v10)
  {
    uint64_t v11 = v2;
    if (*(void *)(v10 + 16)) {
      sub_24CC58A00();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = v2;
  }
  sub_24CC58A60();
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v0, *MEMORY[0x263F39830], v15);
  sub_24CC58A50();
  v16[3] = v14;
  v16[4] = MEMORY[0x263F39838];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16))(boxed_opaque_existential_1, v9, v14);
  sub_24CC58BA0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v14);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return MEMORY[0x270F25BA0](0);
}

char *sub_24CC44A58(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_24CC58CB0();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_24CC44B40(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CC58CB0();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC44BB8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24CC58CB0();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_24CC44C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24CC58CB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_24CC44CE4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24CC58CB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_24CC44D60(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58CB0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24CC44DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC44E08);
}

uint64_t sub_24CC44E08(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24CC58CB0();
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_24CC44E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC44EB0);
}

void *sub_24CC44EB0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_24CC58CB0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LearnMoreSnippet()
{
  uint64_t result = qword_269820540;
  if (!qword_269820540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC44F78()
{
  uint64_t result = sub_24CC58CB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC45010()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4502C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v26 = sub_24CC58D00();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LearnMoreSnippet();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820550);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC45528(v1, (uint64_t)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = swift_allocObject();
  sub_24CC45680((uint64_t)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820558);
  uint64_t v18 = sub_24CC59820();
  unint64_t v19 = sub_24CC45754();
  uint64_t v28 = v18;
  unint64_t v29 = v19;
  swift_getOpaqueTypeConformance2();
  sub_24CC59800();
  uint64_t v20 = v26;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F39858], v26);
  sub_24CC58CB0();
  uint64_t v21 = sub_24CC58C30();
  unint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v20);
  uint64_t v28 = v21;
  unint64_t v29 = v23;
  sub_24CC457A4();
  sub_24CC595F0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v10);
}

uint64_t sub_24CC452F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v20 = sub_24CC588C0();
  uint64_t v1 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CC59820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LearnMoreSnippet();
  uint64_t v8 = sub_24CC58CA0();
  uint64_t v9 = sub_24CC499B0(v8);
  uint64_t v11 = v10;
  char v13 = v12;
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v23 = MEMORY[0x263F1A830];
  uint64_t v24 = MEMORY[0x263F77348];
  uint64_t v16 = swift_allocObject();
  uint64_t v22 = v16;
  *(void *)(v16 + 16) = v9;
  *(void *)(v16 + 24) = v11;
  *(unsigned char *)(v16 + 32) = v13 & 1;
  *(void *)(v16 + 40) = v15;
  sub_24CC59810();
  uint64_t v17 = v20;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F76968], v20);
  sub_24CC45754();
  sub_24CC595B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_24CC45528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LearnMoreSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC4558C()
{
  uint64_t v1 = (int *)(type metadata accessor for LearnMoreSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_24CC58CB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24CC45680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LearnMoreSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC456E4@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LearnMoreSnippet();
  return sub_24CC452F0(a1);
}

unint64_t sub_24CC45754()
{
  unint64_t result = qword_269820190;
  if (!qword_269820190)
  {
    sub_24CC59820();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820190);
  }
  return result;
}

unint64_t sub_24CC457A4()
{
  unint64_t result = qword_269820560;
  if (!qword_269820560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820560);
  }
  return result;
}

uint64_t sub_24CC457F8()
{
  sub_24CC38DF8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CC4583C()
{
  return swift_getOpaqueTypeConformance2();
}

char *sub_24CC458A4(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_24CC58A30();
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    char v12 = v4;
    sub_24CC58A00();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_24CC45994(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24CC58A30();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC45A14(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24CC58A30();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  sub_24CC58A00();
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_24CC45AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24CC58A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_24CC45B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_24CC58A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_24CC45BEC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24CC58A30();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_24CC45C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC45C9C);
}

uint64_t sub_24CC45C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24CC58A30();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_24CC45D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC45D38);
}

uint64_t sub_24CC45D38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24CC58A30();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ActionButtonsView()
{
  uint64_t result = qword_269820568;
  if (!qword_269820568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC45E00()
{
  uint64_t result = sub_24CC58A30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC45EA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC45EC0()
{
  uint64_t v1 = type metadata accessor for ActionButtonsView();
  uint64_t v2 = OUTLINED_FUNCTION_3(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_24CC58A00();
  sub_24CC50CCC();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  v17[5] = v8;
  swift_getKeyPath();
  sub_24CC46D88(v0, (uint64_t)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  sub_24CC46EDC((uint64_t)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_24CC46F40;
  *(void *)(v11 + 24) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820578);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820580);
  sub_24CC35E84(&qword_269820588, &qword_269820578);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820590);
  uint64_t v13 = sub_24CC597F0();
  uint64_t v14 = sub_24CC35E84(&qword_269820598, &qword_269820590);
  uint64_t v15 = sub_24CC471EC(&qword_2698205A0, MEMORY[0x263F775B0]);
  v17[1] = v12;
  v17[2] = v13;
  v17[3] = v14;
  v17[4] = v15;
  swift_getOpaqueTypeConformance2();
  return sub_24CC59770();
}

uint64_t sub_24CC46124@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v31 = a3;
  uint64_t v4 = sub_24CC597F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  uint64_t v30 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v28 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ActionButtonsView();
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v25 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24CC58F30();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820590);
  uint64_t v14 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  sub_24CC46D88(v26, (uint64_t)v9);
  unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v18 = (v12 + *(unsigned __int8 *)(v25 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v19 + v17, v13, v10);
  sub_24CC46EDC((uint64_t)v9, v19 + v18);
  uint64_t v32 = a1;
  sub_24CC59760();
  uint64_t v20 = v28;
  sub_24CC59380();
  sub_24CC35E84(&qword_269820598, &qword_269820590);
  sub_24CC471EC(&qword_2698205A0, MEMORY[0x263F775B0]);
  uint64_t v21 = v27;
  uint64_t v22 = v29;
  sub_24CC59640();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v21);
}

uint64_t sub_24CC464F4(uint64_t a1, id *a2)
{
  uint64_t v54 = a2;
  uint64_t v2 = sub_24CC59010();
  uint64_t v57 = *(void *)(v2 - 8);
  uint64_t v58 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v48 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CC58EF0();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC58A30();
  uint64_t v55 = *(void *)(v7 - 8);
  uint64_t v56 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int v47 = (char *)&v47 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_24CC58830();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CC58EB0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24CC58F00();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC58F20();
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v23, v20);
  if (v24 == *MEMORY[0x263F398C8])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v19, v23, v16);
    MEMORY[0x25330D870](v25);
    sub_24CC58820();
    swift_bridgeObjectRelease();
    uint64_t v26 = v53;
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v53) == 1)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      return sub_24CC44770((uint64_t)v14);
    }
    else
    {
      uint64_t v34 = v51;
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v52, v14, v26);
      uint64_t v35 = type metadata accessor for ActionButtonsView();
      uint64_t v36 = v54;
      uint64_t v37 = v55;
      uint64_t v38 = v47;
      uint64_t v39 = v56;
      (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v47, (char *)v54 + *(int *)(v35 + 24), v56);
      type metadata accessor for ActionHandler();
      uint64_t v40 = swift_allocObject();
      sub_24CC58FF0();
      (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v40 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v38, v39);
      if (*v36)
      {
        id v41 = *v36;
        uint64_t v42 = v52;
        sub_24CC520C8();

        swift_setDeallocating();
        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v40 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_logger, v58);
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v40 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v39);
        swift_deallocClassInstance();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v42, v26);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      }
      else
      {
        sub_24CC598A0();
        sub_24CC471EC((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
        uint64_t result = sub_24CC591C0();
        __break(1u);
      }
    }
  }
  else if (v24 == *MEMORY[0x263F398D0])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
    uint64_t v29 = v49;
    uint64_t v28 = v50;
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v6, v23, v50);
    uint64_t v30 = type metadata accessor for ActionButtonsView();
    uint64_t v31 = v55;
    uint64_t v32 = v56;
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v10, (char *)v54 + *(int *)(v30 + 24), v56);
    type metadata accessor for ActionHandler();
    uint64_t v33 = swift_allocObject();
    sub_24CC58FF0();
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v33 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v10, v32);
    sub_24CC52440();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v6, v28);
  }
  else
  {
    uint64_t v43 = v48;
    sub_24CC58FF0();
    uint64_t v44 = sub_24CC59000();
    os_log_type_t v45 = sub_24CC599C0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_24CC31000, v44, v45, "Unknown action button type selected.", v46, 2u);
      MEMORY[0x25330E970](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v57 + 8))(v43, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }
  return result;
}

uint64_t sub_24CC46CC4@<X0>(uint64_t a1@<X8>)
{
  MEMORY[0x25330D8E0]();
  sub_24CC42D40();
  uint64_t result = sub_24CC59550();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CC46D20(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698205A8);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_24CC46D88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionButtonsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC46DEC()
{
  uint64_t v1 = (int *)(type metadata accessor for ActionButtonsView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[8];
  sub_24CC58A30();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t))(v8 + 8))(v7);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24CC46EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionButtonsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC46F40@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ActionButtonsView();
  OUTLINED_FUNCTION_4_0(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_24CC46124(a1, v7, a2);
}

uint64_t sub_24CC46FA8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC46FE0(char *a1)
{
  return sub_24CC46D20(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

uint64_t sub_24CC46FE8()
{
  uint64_t v1 = sub_24CC58F30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for ActionButtonsView() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v8 + v6[8];
  sub_24CC58A30();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t))(v12 + 8))(v11);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_24CC4715C()
{
  uint64_t v1 = sub_24CC58F30();
  OUTLINED_FUNCTION_3(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for ActionButtonsView();
  OUTLINED_FUNCTION_4_0(v6);
  uint64_t v8 = (id *)(v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));
  return sub_24CC464F4(v0 + v3, v8);
}

uint64_t sub_24CC471E4@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC46CC4(a1);
}

uint64_t sub_24CC471EC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24CC47238()
{
  unint64_t result = qword_2698205B0;
  if (!qword_2698205B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698205B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820590);
    sub_24CC597F0();
    sub_24CC35E84(&qword_269820598, &qword_269820590);
    sub_24CC471EC(&qword_2698205A0, MEMORY[0x263F775B0]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698205B0);
  }
  return result;
}

uint64_t sub_24CC47368()
{
  return swift_deallocClassInstance();
}

id sub_24CC47378()
{
  _s8SentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2698205C0 = (uint64_t)result;
  return result;
}

id static NSBundle.current.getter()
{
  if (qword_26981FFE8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2698205C0;
  return v0;
}

uint64_t _s8SentinelCMa()
{
  return self;
}

uint64_t sub_24CC47450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_24CC474BC(uint64_t a1)
{
  uint64_t v2 = sub_24CC58E80();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_24CC47520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC47584(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC475E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC4764C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC476B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC476C4);
}

uint64_t sub_24CC476C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_24CC4770C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC47720);
}

uint64_t sub_24CC47720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58E80();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SummarizedAnswerSnippet()
{
  uint64_t result = qword_2698205C8;
  if (!qword_2698205C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC477B4()
{
  uint64_t result = sub_24CC58E80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC47840()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4785C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  sub_24CC58D00();
  OUTLINED_FUNCTION_0();
  uint64_t v63 = v3;
  uint64_t v64 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_1_0();
  uint64_t v62 = v4;
  uint64_t v56 = sub_24CC58A30();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C0);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for SummarizedAnswerSnippet();
  uint64_t v15 = OUTLINED_FUNCTION_3(v14);
  uint64_t v17 = v16;
  uint64_t v19 = *(void *)(v18 + 64);
  MEMORY[0x270FA5388](v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698205D8);
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v21;
  uint64_t v58 = v20;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698205E0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_2();
  uint64_t v29 = v28 - v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698205E8);
  OUTLINED_FUNCTION_0();
  uint64_t v60 = v31;
  uint64_t v61 = v30;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_1_0();
  uint64_t v59 = v32;
  sub_24CC49430(v1, (uint64_t)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v33 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v34 = swift_allocObject();
  sub_24CC49498((uint64_t)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v34 + v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698205F0);
  sub_24CC35E84(&qword_2698205F8, &qword_2698205F0);
  uint64_t v55 = v24;
  sub_24CC59800();
  sub_24CC58E10();
  uint64_t v35 = sub_24CC58C20();
  if (__swift_getEnumTagSinglePayload(v13, 1, v35) == 1)
  {
    sub_24CC34878(v13, &qword_2698200C0);
    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v36 = (void *)sub_24CC51618();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v13, v35);
  }
  sub_24CC58E60();
  uint64_t v37 = *(int *)(v25 + 36);
  uint64_t v54 = v1;
  uint64_t v38 = (uint64_t *)(v29 + v37);
  uint64_t v39 = type metadata accessor for PunchoutModifier();
  uint64_t v40 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v38 + *(int *)(v39 + 24), v9, v56);
  sub_24CC598A0();
  sub_24CC497CC((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
  id v41 = v36;
  *uint64_t v38 = sub_24CC591D0();
  v38[1] = v42;
  v38[2] = (uint64_t)v36;
  uint64_t v44 = v57;
  uint64_t v43 = v58;
  uint64_t v45 = v55;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v29, v55, v58);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v40);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v43);
  uint64_t v47 = v62;
  uint64_t v46 = v63;
  uint64_t v48 = v64;
  (*(void (**)(uint64_t, void, uint64_t))(v63 + 104))(v62, *MEMORY[0x263F39858], v64);
  sub_24CC58E80();
  uint64_t v49 = sub_24CC58C30();
  uint64_t v51 = v50;
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v48);
  uint64_t v66 = v49;
  uint64_t v67 = v51;
  sub_24CC4954C();
  uint64_t v52 = v59;
  sub_24CC595F0();
  swift_bridgeObjectRelease();
  sub_24CC34878(v29, &qword_2698205E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v65, v52, v61);
}

uint64_t sub_24CC47D88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v148 = a2;
  uint64_t v139 = sub_24CC59340();
  uint64_t v138 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v137 = (char *)&v114 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_24CC593C0();
  uint64_t v135 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  v134 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SummarizedAnswerSnippet();
  uint64_t v119 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v120 = v6;
  uint64_t v122 = (uint64_t)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_24CC587A0();
  uint64_t v121 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388](v123);
  uint64_t v142 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = type metadata accessor for AttributionView();
  MEMORY[0x270FA5388](v126);
  uint64_t v124 = (char *)&v114 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820610);
  uint64_t v129 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  v125 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820618);
  uint64_t v132 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  v130 = (char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820620);
  uint64_t v11 = MEMORY[0x270FA5388](v147);
  v128 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v127 = (uint64_t)&v114 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v141 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = sub_24CC58C20();
  uint64_t v144 = *(void *)(v152 - 8);
  MEMORY[0x270FA5388](v152);
  v143 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820628);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v146 = (uint64_t)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v145 = (uint64_t)&v114 - v20;
  uint64_t v21 = sub_24CC588C0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v114 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24CC59820();
  uint64_t v151 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v114 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820558);
  uint64_t v156 = *(void *)(v28 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  v155 = (char *)&v114 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v114 - v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820630);
  uint64_t v34 = MEMORY[0x270FA5388](v33 - 8);
  uint64_t v154 = (uint64_t)&v114 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v114 - v36;
  char v38 = sub_24CC58E70();
  uint64_t v153 = a1;
  v157 = v37;
  uint64_t v140 = v21;
  v149 = (char *)v25;
  uint64_t v150 = v28;
  if (v38)
  {
    uint64_t v39 = sub_24CC58E50();
    uint64_t v40 = sub_24CC499B0(v39);
    uint64_t v42 = v41;
    uint64_t v43 = v22;
    char v45 = v44;
    uint64_t v46 = v43;
    uint64_t v48 = v47;
    swift_bridgeObjectRelease();
    uint64_t v160 = MEMORY[0x263F1A830];
    uint64_t v161 = MEMORY[0x263F77348];
    uint64_t v49 = swift_allocObject();
    uint64_t v158 = v49;
    *(void *)(v49 + 16) = v40;
    *(void *)(v49 + 24) = v42;
    *(unsigned char *)(v49 + 32) = v45 & 1;
    *(void *)(v49 + 40) = v48;
    sub_24CC59810();
    uint64_t v50 = *MEMORY[0x263F76980];
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 104))(v24, v50, v21);
    sub_24CC497CC((unint64_t *)&qword_269820190, MEMORY[0x263F776A0]);
    uint64_t v51 = v149;
    sub_24CC595B0();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v21);
    (*(void (**)(char *, char *))(v151 + 8))(v27, v51);
    uint64_t v52 = (uint64_t)v157;
    uint64_t v53 = v150;
    (*(void (**)(char *, char *, uint64_t))(v156 + 32))(v157, v32, v150);
    uint64_t v54 = v50;
    __swift_storeEnumTagSinglePayload(v52, 0, 1, v53);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v37, 1, 1, v28);
    uint64_t v54 = *MEMORY[0x263F76980];
    uint64_t v46 = v22;
  }
  uint64_t v55 = sub_24CC58E40();
  uint64_t v56 = sub_24CC499B0(v55);
  uint64_t v58 = v57;
  char v60 = v59;
  uint64_t v62 = v61;
  swift_bridgeObjectRelease();
  uint64_t v160 = MEMORY[0x263F1A830];
  uint64_t v161 = MEMORY[0x263F77348];
  uint64_t v63 = swift_allocObject();
  uint64_t v158 = v63;
  *(void *)(v63 + 16) = v56;
  *(void *)(v63 + 24) = v58;
  *(unsigned char *)(v63 + 32) = v60 & 1;
  *(void *)(v63 + 40) = v62;
  uint64_t v64 = v153;
  sub_24CC59810();
  uint64_t v65 = *(void (**)(char *, void, uint64_t))(v46 + 104);
  unsigned int v118 = v54;
  uint64_t v66 = v54;
  uint64_t v67 = v140;
  uint64_t v117 = v46 + 104;
  uint64_t v116 = v65;
  v65(v24, v66, v140);
  sub_24CC497CC((unint64_t *)&qword_269820190, MEMORY[0x263F776A0]);
  uint64_t v68 = v149;
  sub_24CC595B0();
  uint64_t v70 = *(void (**)(char *, uint64_t))(v46 + 8);
  uint64_t v69 = v46 + 8;
  uint64_t v115 = v70;
  v70(v24, v67);
  (*(void (**)(char *, char *))(v151 + 8))(v27, v68);
  uint64_t v71 = v156;
  uint64_t v72 = v150;
  (*(void (**)(char *, char *, uint64_t))(v156 + 32))(v155, v32, v150);
  uint64_t v73 = (uint64_t)v141;
  sub_24CC58E10();
  uint64_t v74 = v152;
  if (__swift_getEnumTagSinglePayload(v73, 1, v152) == 1)
  {
    uint64_t v75 = v72;
    sub_24CC34878(v73, &qword_2698200C0);
    uint64_t v76 = 1;
    uint64_t v77 = v145;
  }
  else
  {
    v149 = v24;
    uint64_t v151 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 32))(v143, v73, v74);
    sub_24CC58C10();
    uint64_t v75 = v72;
    if (sub_24CC58E30())
    {
      uint64_t v78 = sub_24CC58E20();
      uint64_t v79 = sub_24CC499B0(v78);
      uint64_t v81 = v80;
      char v83 = v82;
      uint64_t v85 = v84;
      uint64_t v64 = v153;
      swift_bridgeObjectRelease();
      uint64_t v86 = v83 & 1;
    }
    else
    {
      uint64_t v79 = 0;
      uint64_t v81 = 0;
      uint64_t v86 = 0;
      uint64_t v85 = 0;
    }
    uint64_t v87 = v122;
    sub_24CC49430(v64, v122);
    unint64_t v88 = (*(unsigned __int8 *)(v119 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80);
    uint64_t v89 = swift_allocObject();
    sub_24CC49498(v87, v89 + v88);
    uint64_t v90 = (uint64_t)v124;
    (*(void (**)(char *, char *, uint64_t))(v121 + 32))(v124, v142, v123);
    uint64_t v91 = v126;
    uint64_t v92 = (uint64_t *)(v90 + *(int *)(v126 + 20));
    *uint64_t v92 = v79;
    v92[1] = v81;
    v92[2] = v86;
    v92[3] = v85;
    uint64_t v93 = (uint64_t (**)(uint64_t, uint64_t))(v90 + *(int *)(v91 + 24));
    *uint64_t v93 = sub_24CC4976C;
    v93[1] = (uint64_t (*)(uint64_t, uint64_t))v89;
    uint64_t v94 = v149;
    v116(v149, v118, v67);
    uint64_t v95 = sub_24CC497CC(&qword_269820188, (void (*)(uint64_t))type metadata accessor for AttributionView);
    uint64_t v96 = v125;
    sub_24CC595B0();
    v115(v94, v67);
    sub_24CC49814(v90);
    uint64_t v97 = v134;
    sub_24CC593B0();
    uint64_t v158 = v91;
    uint64_t v159 = v95;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v99 = v130;
    uint64_t v100 = v131;
    sub_24CC59690();
    (*(void (**)(char *, uint64_t))(v135 + 8))(v97, v136);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v96, v100);
    uint64_t v101 = v137;
    sub_24CC59330();
    uint64_t v158 = v100;
    uint64_t v159 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v102 = (uint64_t)v128;
    uint64_t v103 = v133;
    sub_24CC596A0();
    (*(void (**)(char *, uint64_t))(v138 + 8))(v101, v139);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v99, v103);
    (*(void (**)(char *, uint64_t))(v144 + 8))(v143, v152);
    uint64_t v104 = v127;
    sub_24CC49870(v102, v127);
    uint64_t v105 = v104;
    uint64_t v77 = v145;
    sub_24CC49870(v105, v145);
    uint64_t v76 = 0;
    uint64_t v71 = v156;
  }
  __swift_storeEnumTagSinglePayload(v77, v76, 1, v147);
  uint64_t v106 = v154;
  sub_24CC49660((uint64_t)v157, v154, &qword_269820630);
  long long v107 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  long long v108 = v155;
  v107(v32, v155, v75);
  uint64_t v109 = v146;
  sub_24CC49660(v77, v146, &qword_269820628);
  uint64_t v110 = v148;
  sub_24CC49660(v106, v148, &qword_269820630);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820638);
  v107((char *)(v110 + *(int *)(v111 + 48)), v32, v75);
  sub_24CC49660(v109, v110 + *(int *)(v111 + 64), &qword_269820628);
  sub_24CC34878(v77, &qword_269820628);
  char v112 = *(void (**)(char *, uint64_t))(v71 + 8);
  v112(v108, v75);
  sub_24CC34878((uint64_t)v157, &qword_269820630);
  sub_24CC34878(v109, &qword_269820628);
  v112(v32, v75);
  return sub_24CC34878(v154, &qword_269820630);
}

uint64_t sub_24CC48D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v63 = a1;
  uint64_t v64 = a2;
  uint64_t v62 = sub_24CC58A30();
  uint64_t v60 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  char v59 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24CC59010();
  uint64_t v5 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698200C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820020);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24CC58AE0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v52 - v19;
  sub_24CC58E10();
  uint64_t v21 = sub_24CC58C20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v21) == 1)
  {
    sub_24CC34878((uint64_t)v10, &qword_2698200C0);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
    uint64_t v22 = v64;
    uint64_t v23 = (uint64_t)v13;
    goto LABEL_22;
  }
  uint64_t v56 = v5;
  uint64_t v57 = v15;
  uint64_t v24 = v7;
  uint64_t v25 = v62;
  uint64_t v53 = v20;
  uint64_t v54 = v13;
  uint64_t v55 = a3;
  uint64_t v26 = sub_24CC58C00();
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v10, v21);
  uint64_t v27 = *(void *)(v26 + 16);
  uint64_t v58 = v26;
  if (!v27)
  {
    uint64_t v37 = 1;
    uint64_t v22 = v64;
    uint64_t v40 = (uint64_t)v59;
    uint64_t v39 = v60;
    uint64_t v23 = (uint64_t)v54;
    uint64_t v38 = v25;
    uint64_t v7 = v24;
    uint64_t v5 = v56;
    uint64_t v41 = v57;
    goto LABEL_21;
  }
  uint64_t v52 = v24;
  uint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v57 + 16);
  unint64_t v29 = v26 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
  uint64_t v30 = (void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v31 = *(void *)(v57 + 72);
  sub_24CC58A00();
  while (1)
  {
    v28(v18, v29, v14);
    uint64_t v32 = (void *)sub_24CC58A80();
    uint64_t v33 = sub_24CC498D8(v32);
    uint64_t v22 = v64;
    if (v64) {
      break;
    }
    if (!v34) {
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
LABEL_15:
    (*v30)(v18, v14);
    v29 += v31;
    if (!--v27)
    {
      swift_bridgeObjectRelease();
      uint64_t v37 = 1;
      uint64_t v5 = v56;
      uint64_t v7 = v52;
      uint64_t v22 = v64;
      uint64_t v38 = v62;
      uint64_t v40 = (uint64_t)v59;
      uint64_t v39 = v60;
      uint64_t v41 = v57;
      uint64_t v23 = (uint64_t)v54;
      goto LABEL_21;
    }
  }
  if (!v34) {
    goto LABEL_15;
  }
  uint64_t v22 = v64;
  if (v33 != v63 || v34 != v64)
  {
    char v36 = sub_24CC59AA0();
    swift_bridgeObjectRelease();
    if (v36)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = v64;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t v41 = v57;
  uint64_t v23 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v54, v18, v14);
  uint64_t v37 = 0;
  uint64_t v5 = v56;
  uint64_t v7 = v52;
  uint64_t v38 = v62;
  uint64_t v40 = (uint64_t)v59;
  uint64_t v39 = v60;
LABEL_21:
  __swift_storeEnumTagSinglePayload(v23, v37, 1, v14);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v23, 1, v14) == 1)
  {
LABEL_22:
    sub_24CC34878(v23, &qword_269820020);
    sub_24CC58FF0();
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_24CC59000();
    os_log_type_t v43 = sub_24CC599C0();
    if (os_log_type_enabled(v42, v43))
    {
      char v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)char v44 = 136315138;
      uint64_t v65 = v63;
      uint64_t v66 = v22;
      uint64_t v67 = v45;
      sub_24CC58A00();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269820198);
      uint64_t v46 = sub_24CC59900();
      uint64_t v65 = sub_24CC3AC7C(v46, v47, &v67);
      sub_24CC59A00();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC31000, v42, v43, "No attribution item found for %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25330E970](v45, -1, -1);
      MEMORY[0x25330E970](v44, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v61);
  }
  else
  {
    uint64_t v49 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v53, v23, v14);
    sub_24CC58BC0();
    sub_24CC58BB0();
    uint64_t v50 = v38;
    uint64_t v51 = (void *)sub_24CC58A80();
    sub_24CC58E60();
    sub_24CC44450(v51, v40);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v50);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v49, v14);
  }
}

uint64_t sub_24CC49430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummarizedAnswerSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC49498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummarizedAnswerSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC494FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SummarizedAnswerSnippet();
  OUTLINED_FUNCTION_4_0(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_24CC47D88(v5, a1);
}

unint64_t sub_24CC4954C()
{
  unint64_t result = qword_269820600;
  if (!qword_269820600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698205E0);
    sub_24CC35E84(&qword_269820608, &qword_2698205D8);
    sub_24CC497CC(&qword_269820100, (void (*)(uint64_t))type metadata accessor for PunchoutModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820600);
  }
  return result;
}

uint64_t sub_24CC4961C()
{
  sub_24CC38DF8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CC49660(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for SummarizedAnswerSnippet();
  OUTLINED_FUNCTION_3(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;
  sub_24CC58E80();
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v11 + 8))(v10);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_24CC4976C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SummarizedAnswerSnippet();
  OUTLINED_FUNCTION_4_0(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_24CC48D28(a1, a2, v7);
}

uint64_t sub_24CC497CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC49814(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CC49870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC498D8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_aceId);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_24CC598F0();

  return v3;
}

uint64_t sub_24CC49948()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC499B0(uint64_t a1)
{
  uint64_t v77 = sub_24CC58F70();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v76 = v5;
  uint64_t v94 = sub_24CC58F50();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v78 = v9;
  uint64_t v10 = sub_24CC58F80();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CC58FA0();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(a1 + 16);
  if (!v22) {
    return 0;
  }
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v23 = v18 + 16;
  uint64_t v25 = a1;
  uint64_t v26 = a1 + ((*(unsigned __int8 *)(v23 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 64));
  uint64_t v92 = *(void *)(v23 + 56);
  uint64_t v93 = v24;
  uint64_t v91 = v12 + 88;
  int v90 = *MEMORY[0x263F398D8];
  uint64_t v72 = v12 + 8;
  uint64_t v79 = v12 + 96;
  uint64_t v71 = (uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32);
  int v75 = *MEMORY[0x263F398E0];
  uint64_t v70 = (void (**)(uint64_t, uint64_t))(v3 + 8);
  uint64_t v74 = (uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v73 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  uint64_t v89 = (void (**)(char *, uint64_t))(v23 - 8);
  uint64_t v69 = v25;
  sub_24CC58A00();
  uint64_t v27 = 0;
  int v95 = 0;
  unint64_t v96 = 0xE000000000000000;
  char v83 = v15;
  uint64_t v84 = v10;
  uint64_t v82 = v16;
  uint64_t v81 = v23;
  uint64_t v80 = v21;
  do
  {
    v93(v21, v26, v16);
    sub_24CC58F90();
    uint64_t v28 = OUTLINED_FUNCTION_2_2();
    int v30 = v29(v28);
    if (v30 == v90)
    {
      uint64_t v31 = OUTLINED_FUNCTION_1_2();
      v32(v31);
      uint64_t v33 = v27;
      uint64_t v34 = v78;
      uint64_t v35 = (*v74)(v78, v15, v94);
      uint64_t v97 = MEMORY[0x25330D910](v35);
      uint64_t v98 = v36;
      sub_24CC42D40();
      uint64_t v37 = sub_24CC59550();
      uint64_t v39 = v38;
      char v41 = v40 & 1;
      char v42 = v95 & 1;
      uint64_t v88 = v22;
      uint64_t v43 = v33;
      uint64_t v44 = v96;
      uint64_t v45 = sub_24CC59520();
      unint64_t v86 = v46;
      uint64_t v87 = v45;
      uint64_t v85 = v47;
      int v95 = v48 & 1;
      uint64_t v49 = v39;
      uint64_t v15 = v83;
      sub_24CC38DF8(v37, v49, v41);
      uint64_t v16 = v82;
      swift_bridgeObjectRelease();
      uint64_t v50 = v43;
      uint64_t v22 = v88;
      sub_24CC38DF8(v50, v44, v42);
      swift_bridgeObjectRelease();
      (*v73)(v34, v94);
      uint64_t v21 = v80;
      uint64_t v27 = v87;
      unint64_t v96 = v86;
    }
    else if (v30 == v75)
    {
      uint64_t v51 = OUTLINED_FUNCTION_1_2();
      v52(v51);
      uint64_t v53 = (*v71)(v76, v15, v77);
      MEMORY[0x25330D930](v53);
      sub_24CC59720();
      uint64_t v54 = sub_24CC59560();
      uint64_t v56 = v55;
      char v58 = v57 & 1;
      char v59 = v95 & 1;
      uint64_t v60 = v96;
      uint64_t v61 = sub_24CC59520();
      uint64_t v87 = v62;
      uint64_t v88 = v61;
      unint64_t v86 = v63;
      int v95 = v64 & 1;
      sub_24CC38DF8(v54, v56, v58);
      swift_bridgeObjectRelease();
      char v65 = v59;
      uint64_t v15 = v83;
      sub_24CC38DF8(v27, v60, v65);
      swift_bridgeObjectRelease();
      uint64_t v16 = v82;
      (*v70)(v76, v77);
      uint64_t v21 = v80;
      uint64_t v27 = v88;
      unint64_t v96 = v87;
    }
    else
    {
      uint64_t v66 = OUTLINED_FUNCTION_2_2();
      v67(v66);
    }
    (*v89)(v21, v16);
    v26 += v92;
    --v22;
  }
  while (v22);
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

char *sub_24CC49F78(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_24CC58D30();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_24CC4A060(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CC58D30();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC4A0D8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24CC58D30();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_24CC4A16C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24CC58D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_24CC4A204(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24CC58D30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_24CC4A280(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CC58D30();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24CC4A314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC4A328);
}

uint64_t sub_24CC4A328(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24CC58D30();
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_24CC4A3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC4A3D0);
}

void *sub_24CC4A3D0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_24CC58D30();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AttributionItemListSnippet()
{
  uint64_t result = qword_269820640;
  if (!qword_269820640) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC4A498()
{
  uint64_t result = sub_24CC58D30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC4A530()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4A54C()
{
  uint64_t v1 = type metadata accessor for AttributionItemListSnippet();
  uint64_t v2 = OUTLINED_FUNCTION_3(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_24CC4B2A8(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_24CC4B310((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820650);
  sub_24CC4B3C4();
  return sub_24CC59800();
}

uint64_t sub_24CC4A644(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributionItemListSnippet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v10[3] = sub_24CC58D10();
  swift_getKeyPath();
  sub_24CC4B2A8(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24CC4B310((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820668);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820670);
  sub_24CC35E84(&qword_269820678, &qword_269820668);
  uint64_t v7 = sub_24CC59870();
  uint64_t v8 = sub_24CC4B8C4(&qword_269820660, MEMORY[0x263F778A0]);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  return sub_24CC59770();
}

uint64_t sub_24CC4A848()
{
  return sub_24CC58AB0();
}

uint64_t sub_24CC4A888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v47 = a1;
  uint64_t v66 = a3;
  uint64_t v63 = sub_24CC58AE0();
  uint64_t v62 = *(void *)(v63 - 8);
  uint64_t v65 = *(void *)(v62 + 64);
  MEMORY[0x270FA5388](v63);
  uint64_t v61 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AttributionItemListSnippet();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v59 = *(void *)(v60 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v58 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_24CC588B0();
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v50 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC588E0();
  MEMORY[0x270FA5388](v7 - 8);
  char v48 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24CC597C0();
  uint64_t v51 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820680);
  uint64_t v54 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_24CC59870();
  uint64_t v57 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v49 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_24CC58AC0();
  uint64_t v82 = v15;
  sub_24CC42D40();
  uint64_t v16 = sub_24CC59550();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v81 = v16;
  uint64_t v82 = v18;
  char v83 = v22;
  uint64_t v84 = v20;
  uint64_t v85 = KeyPath;
  uint64_t v86 = 2;
  char v87 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820688);
  sub_24CC4B658();
  uint64_t v24 = sub_24CC59570();
  sub_24CC38DF8(v16, v18, v22);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v25 = MEMORY[0x263F774B0];
  uint64_t v84 = MEMORY[0x263F1B720];
  uint64_t v85 = MEMORY[0x263F774B0];
  uint64_t v81 = v24;
  uint64_t v80 = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v26 = v47;
  uint64_t v27 = sub_24CC58AD0();
  uint64_t v76 = MEMORY[0x263F8D310];
  uint64_t v77 = MEMORY[0x263F77998];
  uint64_t v74 = v27;
  uint64_t v75 = v28;
  uint64_t v73 = 0;
  long long v72 = 0u;
  long long v71 = 0u;
  sub_24CC58A90();
  sub_24CC597E0();
  uint64_t v29 = v53;
  int v30 = v50;
  uint64_t v31 = v55;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v50, *MEMORY[0x263F76578], v55);
  uint64_t v32 = sub_24CC4B8C4(&qword_2698204E0, MEMORY[0x263F77558]);
  sub_24CC595A0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v11, v9);
  uint64_t v67 = v9;
  uint64_t v68 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v52;
  uint64_t v34 = sub_24CC59570();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v33);
  uint64_t v70 = v25;
  uint64_t v69 = MEMORY[0x263F1B720];
  uint64_t v67 = v34;
  uint64_t v35 = v49;
  sub_24CC59860();
  uint64_t v36 = v58;
  sub_24CC4B2A8(v64, v58);
  uint64_t v37 = v62;
  uint64_t v38 = v61;
  uint64_t v39 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v26, v63);
  unint64_t v40 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v41 = v37;
  unint64_t v42 = (v59 + *(unsigned __int8 *)(v37 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v43 = swift_allocObject();
  sub_24CC4B310(v36, v43 + v40);
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v43 + v42, v38, v39);
  sub_24CC4B8C4(&qword_269820660, MEMORY[0x263F778A0]);
  uint64_t v44 = v56;
  sub_24CC595C0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v35, v44);
}

uint64_t sub_24CC4B054(id *a1)
{
  uint64_t v2 = sub_24CC58A30();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AttributionItemListSnippet();
  sub_24CC58D20();
  type metadata accessor for ActionHandler();
  uint64_t v6 = swift_allocObject();
  sub_24CC58FF0();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v5, v2);
  uint64_t v7 = sub_24CC58A80();
  if (*a1)
  {
    uint64_t v8 = (void *)v7;
    id v9 = *a1;
    sub_24CC52220(v8);

    swift_setDeallocating();
    uint64_t v10 = v6 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_logger;
    uint64_t v11 = sub_24CC59010();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v2);
    return swift_deallocClassInstance();
  }
  else
  {
    sub_24CC598A0();
    sub_24CC4B8C4((unint64_t *)&qword_269820090, MEMORY[0x263F77980]);
    uint64_t result = sub_24CC591C0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CC4B2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionItemListSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC4B310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionItemListSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC4B374()
{
  uint64_t v1 = type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_4_0(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_24CC4A644(v3);
}

unint64_t sub_24CC4B3C4()
{
  unint64_t result = qword_269820658;
  if (!qword_269820658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820650);
    sub_24CC59870();
    sub_24CC4B8C4(&qword_269820660, MEMORY[0x263F778A0]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820658);
  }
  return result;
}

uint64_t sub_24CC4B498@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CC58AA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t objectdestroyTm_1()
{
  type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_1_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v1 + v7;

  uint64_t v11 = v10 + *(int *)(v0 + 28);
  sub_24CC58D30();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t))(v12 + 8))(v11);
  return MEMORY[0x270FA0238](v1, v8, v9);
}

uint64_t sub_24CC4B58C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_4_0(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_24CC4A888(a1, v7, a2);
}

uint64_t sub_24CC4B5EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24CC59280();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24CC4B624()
{
  return sub_24CC59290();
}

unint64_t sub_24CC4B658()
{
  unint64_t result = qword_269820690;
  if (!qword_269820690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820688);
    sub_24CC35E84(&qword_269820698, &qword_2698206A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820690);
  }
  return result;
}

uint64_t sub_24CC4B6F8()
{
  type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_1_3();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_24CC58AE0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v4 + v6 + v9) & ~v9;
  uint64_t v11 = v10 + *(void *)(v8 + 64);
  uint64_t v12 = v3 | v9 | 7;
  uint64_t v13 = (id *)(v1 + v4);

  uint64_t v14 = (char *)v13 + *(int *)(v0 + 28);
  sub_24CC58D30();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v15 + 8))(v14);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1 + v10, v7);
  return MEMORY[0x270FA0238](v1, v11, v12);
}

uint64_t sub_24CC4B83C()
{
  uint64_t v1 = type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_3(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = sub_24CC58AE0();
  OUTLINED_FUNCTION_4_0(v4);
  return sub_24CC4B054((id *)(v0 + v3));
}

uint64_t sub_24CC4B8C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC4B90C()
{
  return sub_24CC35E84(&qword_2698206A8, &qword_2698206B0);
}

uint64_t sub_24CC4B964@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698206F0);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698206F8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v2 = sub_24CC59310();
  *(void *)(v2 + 8) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820700);
  sub_24CC4BB08(v1, v2 + *(int *)(v13 + 44));
  char v14 = sub_24CC593F0();
  sub_24CC59080();
  OUTLINED_FUNCTION_2_3();
  sub_24CC49660(v2, (uint64_t)v12, &qword_2698206F0);
  uint64_t v15 = &v12[*(int *)(v10 + 44)];
  *uint64_t v15 = v14;
  *((void *)v15 + 1) = v3;
  *((void *)v15 + 2) = v4;
  *((void *)v15 + 3) = v5;
  *((void *)v15 + 4) = v6;
  v15[40] = 0;
  sub_24CC34878(v2, &qword_2698206F0);
  char v16 = sub_24CC59400();
  sub_24CC59080();
  OUTLINED_FUNCTION_2_3();
  sub_24CC49660((uint64_t)v12, a1, &qword_2698206F8);
  uint64_t v17 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269820708) + 36);
  *(unsigned char *)uint64_t v17 = v16;
  *(void *)(v17 + 8) = v3;
  *(void *)(v17 + 16) = v4;
  *(void *)(v17 + 24) = v5;
  *(void *)(v17 + 32) = v6;
  *(unsigned char *)(v17 + 40) = 0;
  return sub_24CC34878((uint64_t)v12, &qword_2698206F8);
}

uint64_t sub_24CC4BB08@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820710);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820718);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v22 - v13;
  sub_24CC58A00();
  *(void *)&long long v22 = sub_24CC59720();
  long long v26 = *a1;
  uint64_t v27 = *((void *)a1 + 2);
  uint64_t v15 = swift_allocObject();
  long long v16 = a1[1];
  *(_OWORD *)(v15 + 16) = *a1;
  *(_OWORD *)(v15 + 32) = v16;
  *(void *)(v15 + 48) = *((void *)a1 + 4);
  sub_24CC58A00();
  sub_24CC4C7BC((uint64_t)&v26);
  sub_24CC59610();
  swift_release();
  swift_release();
  long long v22 = v26;
  uint64_t v23 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820458);
  sub_24CC59740();
  uint64_t v17 = v24;
  uint64_t v18 = v25;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v7, v4);
  uint64_t v19 = &v12[*(int *)(v9 + 44)];
  *(void *)uint64_t v19 = v17;
  *((void *)v19 + 1) = v18;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24CC4C7E8((uint64_t)v12, (uint64_t)v14);
  sub_24CC49660((uint64_t)v14, (uint64_t)v12, &qword_269820718);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820720);
  sub_24CC49660((uint64_t)v12, a2 + *(int *)(v20 + 48), &qword_269820718);
  sub_24CC34878((uint64_t)v14, &qword_269820718);
  return sub_24CC34878((uint64_t)v12, &qword_269820718);
}

uint64_t sub_24CC4BDC0()
{
  return sub_24CC59750();
}

uint64_t sub_24CC4BE14@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC4B964(a1);
}

uint64_t sub_24CC4BE50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698206D8);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_4();
  uint64_t KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820458);
  sub_24CC59740();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698206E0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v5, a1);
  uint64_t v15 = (uint64_t *)(v5 + *(int *)(v12 + 44));
  *uint64_t v15 = KeyPath;
  v15[1] = v19;
  v15[2] = v20;
  uint64_t v16 = swift_allocObject();
  *(double *)(v16 + 16) = a4;
  *(double *)(v16 + 24) = a5;
  *(void *)(v16 + 32) = a2;
  sub_24CC49660(v5, a3, &qword_2698206D8);
  uint64_t v17 = (uint64_t (**)())(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698206E8) + 36));
  *uint64_t v17 = sub_24CC4C768;
  v17[1] = (uint64_t (*)())v16;
  swift_retain();
  return sub_24CC34878(v5, &qword_2698206D8);
}

double sub_24CC4BFD8()
{
  sub_24CC4C050();
  sub_24CC592C0();
  return v1;
}

uint64_t sub_24CC4C014()
{
  return sub_24CC592D0();
}

unint64_t sub_24CC4C050()
{
  unint64_t result = qword_2698206C8;
  if (!qword_2698206C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698206C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionSymbolSizeEnvironmentKey()
{
  return &type metadata for AttributionSymbolSizeEnvironmentKey;
}

uint64_t sub_24CC4C0AC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_24CC4C0E4()
{
  return swift_release();
}

void *sub_24CC4C0EC(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_24CC4C14C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t sub_24CC4C188(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24CC4C1DC(uint64_t result, unsigned int a2, unsigned int a3)
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

void type metadata accessor for AttributionSymbolSizeOffsetModifier()
{
}

uint64_t sub_24CC4C23C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_24CC4C270()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC4C2AC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  sub_24CC58A00();
  return a1;
}

void *sub_24CC4C2F4(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  a1[4] = a2[4];
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_24CC4C380(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24CC4C3D0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24CC4C410(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for TipAttributionView()
{
}

uint64_t sub_24CC4C464()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4C480()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4C49C()
{
  return sub_24CC59750();
}

uint64_t sub_24CC4C4F4()
{
  return sub_24CC59120();
}

uint64_t sub_24CC4C510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC4BE50(a1, *(void *)(v2 + 16), a2, *(double *)v2, *(double *)(v2 + 8));
}

void sub_24CC4C51C()
{
  xmmword_269821A40 = 0uLL;
}

long long *sub_24CC4C52C()
{
  if (qword_26981FFF0 != -1) {
    swift_once();
  }
  return &xmmword_269821A40;
}

double sub_24CC4C578(_OWORD *a1, void (*a2)(long long *__return_ptr))
{
  a2(&v4);
  double result = *(double *)&v4;
  *a1 = v4;
  return result;
}

double sub_24CC4C5B8@<D0>(_OWORD *a1@<X8>)
{
  sub_24CC4C52C();
  double result = *(double *)&xmmword_269821A40;
  *a1 = xmmword_269821A40;
  return result;
}

void sub_24CC4C5EC()
{
  qword_2698206B8 = 0;
  unk_2698206C0 = 0;
}

uint64_t *sub_24CC4C5FC()
{
  if (qword_26981FFF8 != -1) {
    swift_once();
  }
  return &qword_2698206B8;
}

__n128 sub_24CC4C648@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = (__n128 *)sub_24CC4C5FC();
  __n128 result = *v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_24CC4C674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_24CC4C6D8();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

unint64_t sub_24CC4C6D8()
{
  unint64_t result = qword_2698206D0;
  if (!qword_2698206D0)
  {
    type metadata accessor for CGSize();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698206D0);
  }
  return result;
}

uint64_t sub_24CC4C730()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CC4C768()
{
  return sub_24CC4C49C();
}

uint64_t sub_24CC4C774()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CC4C7B4()
{
  return sub_24CC4BDC0();
}

uint64_t sub_24CC4C7BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CC4C7E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for AttributionSymbolSizePreferenceKey()
{
}

unint64_t sub_24CC4C860()
{
  unint64_t result = qword_269820728;
  if (!qword_269820728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698206E8);
    sub_24CC4C900();
    sub_24CC35E84(&qword_269820750, &qword_269820758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820728);
  }
  return result;
}

unint64_t sub_24CC4C900()
{
  unint64_t result = qword_269820730;
  if (!qword_269820730)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698206D8);
    sub_24CC35E84(&qword_269820738, &qword_2698206E0);
    sub_24CC35E84(&qword_269820740, &qword_269820748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820730);
  }
  return result;
}

unint64_t sub_24CC4C9C8()
{
  unint64_t result = qword_269820760;
  if (!qword_269820760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820708);
    sub_24CC4CA44();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820760);
  }
  return result;
}

unint64_t sub_24CC4CA44()
{
  unint64_t result = qword_269820768;
  if (!qword_269820768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698206F8);
    sub_24CC35E84(&qword_269820770, &qword_2698206F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820768);
  }
  return result;
}

char *sub_24CC4CB1C(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    unint64_t v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_24CC58A30();
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    uint64_t v12 = v4;
    uint64_t v13 = v6;
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_24CC4CC08(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24CC58A30();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24CC4CC88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  a1[2] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  unint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24CC58A30();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v5;
  id v13 = v6;
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_24CC4CD28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(void **)(a1 + 16);
  uint64_t v10 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v10;
  id v11 = v10;

  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_24CC58A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t sub_24CC4CDD4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v8 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v8;

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24CC58A30();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_24CC4CE70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC4CE84);
}

uint64_t sub_24CC4CE84(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24CC58A30();
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_24CC4CF18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC4CF2C);
}

void *sub_24CC4CF2C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_24CC58A30();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 24);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PunchoutModifier()
{
  uint64_t result = qword_269820778;
  if (!qword_269820778) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC4CFF4()
{
  uint64_t result = sub_24CC58A30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC4D094()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4D0B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v38 = a2;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820788);
  uint64_t v3 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  int v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820790);
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PunchoutModifier();
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v31 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820798);
  MEMORY[0x270FA5388](v9);
  id v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698207A0);
  uint64_t v33 = *(void *)(v36 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v36);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v32 = (char *)&v30 - v15;
  uint64_t v16 = *(void **)(v2 + 16);
  if (v16 && (self, (uint64_t v17 = swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v34, v39);
    v11[*(int *)(v9 + 36)] = 0;
    sub_24CC4D8C0(v2, (uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v19 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    uint64_t v20 = swift_allocObject();
    sub_24CC4DA34((uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
    *(void *)(v20 + ((v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
    unint64_t v21 = sub_24CC4D7FC();
    id v22 = v16;
    sub_24CC59650();
    swift_release();
    sub_24CC4DB24((uint64_t)v11);
    uint64_t v24 = v32;
    uint64_t v23 = v33;
    uint64_t v25 = v36;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v32, v14, v36);
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v37, v24, v25);
    swift_storeEnumTagMultiPayload();
    uint64_t v40 = v9;
    unint64_t v41 = v21;
    swift_getOpaqueTypeConformance2();
    sub_24CC35E84(&qword_2698207B0, &qword_269820788);
    sub_24CC59370();

    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v28 = v39;
    v27(v5, v34, v39);
    v27(v37, (uint64_t)v5, v28);
    swift_storeEnumTagMultiPayload();
    unint64_t v29 = sub_24CC4D7FC();
    uint64_t v40 = v9;
    unint64_t v41 = v29;
    swift_getOpaqueTypeConformance2();
    sub_24CC35E84(&qword_2698207B0, &qword_269820788);
    sub_24CC59370();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v28);
  }
}

uint64_t sub_24CC4D5DC(id *a1, void *a2)
{
  uint64_t v4 = sub_24CC58A30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PunchoutModifier();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)a1 + *(int *)(v8 + 24), v4);
  type metadata accessor for ActionHandler();
  uint64_t v9 = swift_allocObject();
  sub_24CC58FF0();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v7, v4);
  if (*a1)
  {
    id v10 = *a1;
    sub_24CC52220(a2);

    swift_setDeallocating();
    uint64_t v11 = v9 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_logger;
    uint64_t v12 = sub_24CC59010();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v4);
    return swift_deallocClassInstance();
  }
  else
  {
    sub_24CC598A0();
    sub_24CC4DB84();
    uint64_t result = sub_24CC591C0();
    __break(1u);
  }
  return result;
}

unint64_t sub_24CC4D7FC()
{
  unint64_t result = qword_2698207A8;
  if (!qword_2698207A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820798);
    sub_24CC35E84(&qword_2698207B0, &qword_269820788);
    sub_24CC35E84(&qword_269820070, &qword_269820078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698207A8);
  }
  return result;
}

uint64_t sub_24CC4D8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchoutModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC4D924()
{
  unint64_t v1 = (int *)(type metadata accessor for PunchoutModifier() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_24CC58A30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_24CC4DA34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchoutModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC4DA98()
{
  uint64_t v1 = *(void *)(type metadata accessor for PunchoutModifier() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24CC4D5DC((id *)(v0 + v2), v3);
}

uint64_t sub_24CC4DB24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CC4DB84()
{
  unint64_t result = qword_269820090;
  if (!qword_269820090)
  {
    sub_24CC598A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820090);
  }
  return result;
}

unint64_t sub_24CC4DBD8()
{
  unint64_t result = qword_2698207B8;
  if (!qword_2698207B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698207C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820798);
    sub_24CC4D7FC();
    swift_getOpaqueTypeConformance2();
    sub_24CC35E84(&qword_2698207B0, &qword_269820788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698207B8);
  }
  return result;
}

void sub_24CC4DCAC()
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v2 = v0;
  uint64_t v30 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698207F8);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for ItemListView();
  uint64_t v9 = v8 - 8;
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CC59190();
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_3();
  sub_24CC50230();
  char v17 = sub_24CC59180();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v13);
  sub_24CC504A4(v2, (uint64_t)v12);
  unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  if (v17) {
    unint64_t v19 = sub_24CC508D8;
  }
  else {
    unint64_t v19 = sub_24CC50570;
  }
  uint64_t v20 = swift_allocObject();
  sub_24CC5050C((uint64_t)v12, v20 + v18);
  uint64_t v21 = sub_24CC4E1BC();
  uint64_t v23 = v22;
  uint64_t v24 = v2 + *(int *)(v9 + 28);
  uint64_t v25 = *(void *)v24;
  char v26 = *(unsigned char *)(v24 + 8);
  sub_24CC4F6C8(*(void *)v24, v26);
  char v27 = sub_24CC50588(v25, v26);
  sub_24CC4F798(v25, v26);
  uint64_t v28 = 0x4010000000000000;
  *(void *)uint64_t v7 = v21;
  *(void *)(v7 + 8) = v23;
  if ((v27 & 1) == 0) {
    uint64_t v28 = 0x4018000000000000;
  }
  *(void *)(v7 + 16) = v28;
  *(unsigned char *)(v7 + 24) = 0;
  *(void *)(v7 + 32) = 0x4018000000000000;
  *(unsigned char *)(v7 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820800);
  sub_24CC4E278(v2, (uint64_t)v19, v20);
  swift_release();
  sub_24CC51248(v7, v30, &qword_2698207F8);
  OUTLINED_FUNCTION_5_1();
}

uint64_t sub_24CC4DF48(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820808);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  uint64_t v14 = &v13[*(int *)(v11 + 36)];
  *(void *)uint64_t v14 = sub_24CC59360();
  *((void *)v14 + 1) = 0x4010000000000000;
  v14[16] = 0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820810);
  sub_24CC4E470(a1, a2, a3, a4 & 1, a5, &v14[*(int *)(v15 + 44)]);
  sub_24CC35E84(&qword_269820818, &qword_269820808);
  uint64_t v16 = sub_24CC59570();
  sub_24CC34878((uint64_t)v13, &qword_269820808);
  return v16;
}

uint64_t sub_24CC4E094(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698208D8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v15 = 0;
  v15[8] = 1;
  sub_24CC4EEC0(a6, a1, a2, a3, a4 & 1, a5, (uint64_t)&v15[*(int *)(v13 + 36)]);
  sub_24CC35E84(&qword_2698208E0, &qword_2698208D8);
  uint64_t v16 = sub_24CC59570();
  sub_24CC34878((uint64_t)v15, &qword_2698208D8);
  return v16;
}

uint64_t sub_24CC4E1BC()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for ItemListView() + 20);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_24CC4F6C8(*(void *)v1, v3);
  char v4 = sub_24CC50588(v2, v3);
  sub_24CC4F798(v2, v3);
  if (v4)
  {
    if (qword_269820000 != -1) {
      swift_once();
    }
    return qword_2698207C8;
  }
  else
  {
    uint64_t v5 = sub_24CC59360();
    sub_24CC592E0();
  }
  return v5;
}

uint64_t sub_24CC4E278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ItemListView();
  uint64_t v5 = sub_24CC58A00();
  sub_24CC51010(v5);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_24CC511CC;
  *(void *)(v7 + 24) = v6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698208C0);
  sub_24CC35E84(&qword_2698208C8, &qword_2698208C0);
  return sub_24CC59770();
}

uint64_t sub_24CC4E3CC(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = sub_24CC499B0(a2);
    uint64_t v7 = v6;
    uint64_t v9 = v8 & 1;
    uint64_t v11 = a3(v3, v5, v6, v9, v10);
    sub_24CC38DF8(v5, v7, v9);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t sub_24CC4E470@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X5>, char *a6@<X8>)
{
  unint64_t v27 = a3;
  uint64_t v28 = a5;
  uint64_t v26 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820820);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v26 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v26 - v20;
  sub_24CC4E694(a1, (uint64_t)&v26 - v20);
  sub_24CC4EAC8(v26, v27, a4 & 1, v28, (uint64_t)v19);
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v22(v16, v21, v9);
  v22(v13, v19, v9);
  v22(a6, v16, v9);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820828);
  v22(&a6[*(int *)(v23 + 48)], v13, v9);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v19, v9);
  v24(v21, v9);
  v24(v13, v9);
  return ((uint64_t (*)(char *, uint64_t))v24)(v16, v9);
}

uint64_t sub_24CC4E694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v42 = a2;
  uint64_t v5 = sub_24CC588C0();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v39 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_24CC59880();
  uint64_t v34 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  char v8 = (char **)((char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v33 = sub_24CC59820();
  uint64_t v35 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820830);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v37 = v11;
  uint64_t v38 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v32 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC4F110(v3, a1, (uint64_t)&v43);
  uint64_t v15 = v43;
  uint64_t v14 = v44;
  uint64_t v17 = v45;
  uint64_t v16 = v46;
  char v18 = v47;
  LODWORD(a1) = sub_24CC593A0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v43 = v15;
  uint64_t v44 = v14;
  uint64_t v45 = v17;
  uint64_t v46 = v16;
  LOBYTE(v47) = v18;
  HIDWORD(v47) = a1;
  uint64_t v48 = KeyPath;
  char v49 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820848);
  sub_24CC509FC();
  uint64_t v20 = sub_24CC59570();
  sub_24CC50C44(v15, v14, v17);
  swift_release();
  uint64_t v46 = MEMORY[0x263F1B720];
  uint64_t v47 = MEMORY[0x263F774B0];
  uint64_t v43 = v20;
  sub_24CC59810();
  *char v8 = 0;
  v8[1] = 0;
  uint64_t v21 = v34;
  uint64_t v22 = v36;
  (*(void (**)(void *, void, uint64_t))(v34 + 104))(v8, *MEMORY[0x263F77908], v36);
  unint64_t v23 = sub_24CC45754();
  uint64_t v25 = v32;
  uint64_t v24 = v33;
  sub_24CC59600();
  (*(void (**)(void *, uint64_t))(v21 + 8))(v8, v22);
  uint64_t v26 = v24;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v24);
  unint64_t v27 = v39;
  uint64_t v28 = v40;
  uint64_t v29 = v41;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, *MEMORY[0x263F76980], v41);
  uint64_t v43 = v26;
  uint64_t v44 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v30 = v37;
  sub_24CC595B0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v25, v30);
}

uint64_t sub_24CC4EAC8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a4;
  int v28 = a3;
  uint64_t v34 = a5;
  uint64_t v7 = sub_24CC588C0();
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v31 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_24CC59880();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v27[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_24CC59820();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = &v27[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820830);
  uint64_t v17 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  unint64_t v19 = &v27[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v35 = a1;
  unint64_t v36 = a2;
  char v37 = v28 & 1;
  uint64_t v38 = v29;
  LOWORD(v39) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820838);
  sub_24CC50BDC(&qword_269820840, &qword_269820838);
  uint64_t v20 = sub_24CC59570();
  uint64_t v38 = MEMORY[0x263F1B720];
  uint64_t v39 = MEMORY[0x263F774B0];
  uint64_t v35 = v20;
  sub_24CC59810();
  void *v12 = 0;
  v12[1] = 0;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F77908], v9);
  unint64_t v21 = sub_24CC45754();
  sub_24CC59600();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v22 = v31;
  uint64_t v23 = v32;
  uint64_t v24 = v33;
  (*(void (**)(unsigned char *, void, uint64_t))(v32 + 104))(v31, *MEMORY[0x263F76980], v33);
  uint64_t v35 = v13;
  unint64_t v36 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v30;
  sub_24CC595B0();
  (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v22, v24);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v17 + 8))(v19, v25);
}

uint64_t sub_24CC4EEC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v35 = a6;
  int v37 = a5;
  uint64_t v38 = a3;
  unint64_t v39 = a4;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820820);
  uint64_t v33 = *(void *)(v36 - 8);
  uint64_t v10 = v33;
  uint64_t v11 = MEMORY[0x270FA5388](v36);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  sub_24CC4F110(a1, a2, (uint64_t)v40);
  uint64_t v17 = v40[0];
  uint64_t v16 = v40[1];
  uint64_t v28 = v40[0];
  uint64_t v18 = v40[3];
  uint64_t v32 = v40[2];
  int v31 = v41;
  int v30 = sub_24CC593A0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = KeyPath;
  uint64_t v34 = v15;
  sub_24CC4EAC8(v38, v39, v37 & 1, v35, (uint64_t)v15);
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v21 = v36;
  v20(v13, v15, v36);
  *(void *)a7 = v17;
  *(void *)(a7 + 8) = v16;
  LOBYTE(v17) = v32;
  *(void *)(a7 + 16) = v32;
  *(void *)(a7 + 24) = v18;
  int v22 = v30;
  *(unsigned char *)(a7 + 32) = v31;
  *(_DWORD *)(a7 + 36) = v22;
  *(void *)(a7 + 40) = KeyPath;
  *(unsigned char *)(a7 + 48) = 1;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698208E8);
  v20((char *)(a7 + *(int *)(v23 + 48)), v13, v21);
  uint64_t v24 = v28;
  sub_24CC5120C(v28, v16, v17);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v33 + 8);
  swift_retain();
  v25(v34, v21);
  v25(v13, v21);
  sub_24CC50C44(v24, v16, v17);
  return swift_release();
}

double sub_24CC4F110@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24CC588A0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698208A8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1 + *(int *)(type metadata accessor for ItemListView() + 20);
  uint64_t v12 = *(void *)v11;
  char v13 = *(unsigned char *)(v11 + 8);
  sub_24CC4F6C8(*(void *)v11, v13);
  char v14 = sub_24CC50588(v12, v13);
  sub_24CC4F798(v12, v13);
  if (v14)
  {
    long long v19 = xmmword_24CC5ABE0;
    uint64_t v20 = 0;
    uint64_t v21 = MEMORY[0x263F8EE78];
    char v22 = 1;
  }
  else
  {
    *(void *)&long long v23 = a2;
    sub_24CC58870();
    sub_24CC50C80();
    sub_24CC587D0();
    sub_24CC35E84(&qword_2698208B8, &qword_2698208A8);
    sub_24CC59A20();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    long long v15 = v19;
    swift_bridgeObjectRelease();
    long long v23 = v15;
    sub_24CC59910();
    long long v19 = v23;
    uint64_t v20 = 0;
    uint64_t v21 = MEMORY[0x263F8EE78];
    char v22 = 0;
  }
  sub_24CC59370();
  double result = *(double *)&v23;
  long long v17 = v24;
  char v18 = v25;
  *(_OWORD *)a3 = v23;
  *(_OWORD *)(a3 + 16) = v17;
  *(unsigned char *)(a3 + 32) = v18;
  return result;
}

uint64_t sub_24CC4F384()
{
  sub_24CC4F400();
  sub_24CC592C0();
  return v1;
}

uint64_t sub_24CC4F3C0()
{
  return sub_24CC592D0();
}

unint64_t sub_24CC4F400()
{
  unint64_t result = qword_2698207D8;
  if (!qword_2698207D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698207D8);
  }
  return result;
}

ValueMetadata *_s27ItemListStyleEnvironmentKeyVMa()
{
  return &_s27ItemListStyleEnvironmentKeyVN;
}

unsigned char *storeEnumTagSinglePayload for ItemListView.ListStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC4F528);
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

ValueMetadata *type metadata accessor for ItemListView.ListStyle()
{
  return &type metadata for ItemListView.ListStyle;
}

uint64_t *sub_24CC4F560(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CC59190();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_24CC4F6C8(*(void *)v11, v13);
    *(void *)uint64_t v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (uint64_t *)((char *)a1 + v14);
    long long v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
    swift_retain();
    sub_24CC58A00();
  }
  return a1;
}

uint64_t sub_24CC4F6C8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24CC4F6D4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24CC59190();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_24CC4F798(*(void *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC4F798(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *sub_24CC4F7A4(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CC59190();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_24CC4F6C8(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  sub_24CC58A00();
  return a1;
}

void *sub_24CC4F8BC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_24CC34878((uint64_t)a1, &qword_269820158);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24CC59190();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_24CC4F6C8(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_24CC4F798(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_24CC4FA18(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CC59190();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *sub_24CC4FB10(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_24CC34878((uint64_t)a1, &qword_269820158);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CC59190();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_24CC4F798(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24CC4FC50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC4FC64);
}

uint64_t sub_24CC4FC64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202B8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_24CC4FCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC4FD08);
}

void sub_24CC4FD08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698202B8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for ItemListView()
{
  uint64_t result = qword_2698207E0;
  if (!qword_2698207E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CC4FDDC()
{
  sub_24CC4FE88();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24CC4FE88()
{
  if (!qword_269820348)
  {
    sub_24CC59190();
    unint64_t v0 = sub_24CC590C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269820348);
    }
  }
}

unint64_t sub_24CC4FEE4()
{
  unint64_t result = qword_2698207F0;
  if (!qword_2698207F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698207F0);
  }
  return result;
}

void sub_24CC4FF34(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_24CC4FF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_24CC4FEE4();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_24CC4FFA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC4FFBC()
{
  uint64_t v0 = sub_24CC59350();
  uint64_t result = sub_24CC592F0();
  qword_2698207C8 = v0;
  unk_2698207D0 = result;
  return result;
}

void sub_24CC4FFF0()
{
}

void sub_24CC5002C()
{
  OUTLINED_FUNCTION_4_3();
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_24CC592B0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  uint64_t v12 = v11 - v10;
  if ((v1 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v13 = sub_24CC599D0();
    uint64_t v14 = sub_24CC593D0();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      sub_24CC3AC7C(0x657A69534743, 0xE600000000000000, &v17);
      sub_24CC59A00();
      _os_log_impl(&dword_24CC31000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_8_1();
    }

    sub_24CC592A0();
    swift_getAtKeyPath();
    sub_24CC4049C(v5, v3, 0);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  }
  OUTLINED_FUNCTION_5_1();
}

void sub_24CC501F8()
{
}

void sub_24CC50230()
{
  OUTLINED_FUNCTION_4_3();
  unint64_t v3 = v2;
  uint64_t v24 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v11 = v10;
  uint64_t v12 = sub_24CC592B0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_7_1();
  __swift_instantiateConcreteTypeFromMangledName(v8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  sub_24CC49660(v9, v18 - v17, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6(0);
    OUTLINED_FUNCTION_4();
    (*(void (**)(uint64_t, uint64_t))(v20 + 32))(v11, v19);
  }
  else
  {
    os_log_type_t v21 = sub_24CC599D0();
    char v22 = sub_24CC593D0();
    if (os_log_type_enabled(v22, v21))
    {
      long long v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)long long v23 = 136315138;
      sub_24CC3AC7C(v24, v3, &v25);
      sub_24CC59A00();
      _os_log_impl(&dword_24CC31000, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_8_1();
    }

    sub_24CC592A0();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v12);
  }
  OUTLINED_FUNCTION_5_1();
}

void sub_24CC50478()
{
}

uint64_t sub_24CC504A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ItemListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC5050C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ItemListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC50570(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_24CC508F0(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CC4E094);
}

uint64_t sub_24CC50588(uint64_t a1, char a2)
{
  uint64_t v4 = sub_24CC592B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_24CC599D0();
  uint64_t v9 = sub_24CC593D0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_24CC3AC7C(0x6C7974537473694CLL, 0xE900000000000065, &v15);
    sub_24CC59A00();
    _os_log_impl(&dword_24CC31000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25330E970](v12, -1, -1);
    MEMORY[0x25330E970](v11, -1, -1);
  }

  sub_24CC592A0();
  swift_getAtKeyPath();
  sub_24CC4F798(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = type metadata accessor for ItemListView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820158);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24CC59190();
    OUTLINED_FUNCTION_4();
    (*(void (**)(uint64_t))(v5 + 8))(v0 + v3);
  }
  else
  {
    swift_release();
  }
  sub_24CC4F798(*(void *)(v0 + v3 + *(int *)(v1 + 20)), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 20) + 8));
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CC508D8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_24CC508F0(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CC4DF48);
}

uint64_t sub_24CC508F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = a4 & 1;
  uint64_t v12 = *(void *)(type metadata accessor for ItemListView() - 8);
  uint64_t v13 = v6 + ((*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a6(a1, a2, a3, v11, a5, v13);
}

uint64_t sub_24CC509A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CC591E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CC509D4()
{
  return sub_24CC591F0();
}

unint64_t sub_24CC509FC()
{
  unint64_t result = qword_269820850;
  if (!qword_269820850)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820848);
    sub_24CC50A9C();
    sub_24CC35E84(&qword_269820898, &qword_2698208A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820850);
  }
  return result;
}

unint64_t sub_24CC50A9C()
{
  unint64_t result = qword_269820858;
  if (!qword_269820858)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820860);
    sub_24CC50B3C();
    sub_24CC35E84(&qword_269820888, &qword_269820890);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820858);
  }
  return result;
}

unint64_t sub_24CC50B3C()
{
  unint64_t result = qword_269820868;
  if (!qword_269820868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820870);
    sub_24CC50BDC((unint64_t *)&qword_269820878, &qword_269820880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820868);
  }
  return result;
}

uint64_t sub_24CC50BDC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CC50C44(uint64_t a1, uint64_t a2, char a3)
{
  sub_24CC38DF8(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_24CC50C80()
{
  unint64_t result = qword_2698208B0;
  if (!qword_2698208B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698208B0);
  }
  return result;
}

void sub_24CC50CCC()
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698205A8);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v53 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (void *)((char *)v42 - v7);
  MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)v42 - v9;
  uint64_t v54 = v10;
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *(void *)(v1 + 16);
  sub_24CC58A00();
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  uint64_t v52 = v12;
  v42[1] = v1;
  if (v12)
  {
    uint64_t v46 = (v11 + 32) & ~v11;
    uint64_t v14 = MEMORY[0x263F8EE78] + v46;
    uint64_t v15 = 0;
    uint64_t v12 = 0;
    uint64_t v51 = sub_24CC58F30();
    OUTLINED_FUNCTION_4();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    uint64_t v49 = v16 + 16;
    uint64_t v50 = v17;
    uint64_t v18 = v1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    uint64_t v47 = *(void *)(v16 + 72);
    uint64_t v48 = (void (**)(char *, char *, uint64_t))(v16 + 32);
    uint64_t v43 = v8;
    uint64_t v44 = v11 | 7;
    uint64_t v19 = v13;
    uint64_t v20 = (uint64_t)v45;
    while (1)
    {
      os_log_type_t v21 = &v53[*(int *)(v2 + 48)];
      uint64_t v22 = v51;
      v50(v21, v18, v51);
      long long v23 = (char *)v8 + *(int *)(v2 + 48);
      *os_log_type_t v8 = v15;
      (*v48)(v23, v21, v22);
      sub_24CC51248((uint64_t)v8, v20, &qword_2698205A8);
      if (v12)
      {
        uint64_t v13 = v19;
      }
      else
      {
        unint64_t v24 = v19[3];
        if ((uint64_t)((v24 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_32;
        }
        uint64_t v25 = v2;
        int64_t v26 = v24 & 0xFFFFFFFFFFFFFFFELL;
        if (v26 <= 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v26;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698208F0);
        uint64_t v28 = *(void *)(v54 + 72);
        uint64_t v29 = v46;
        uint64_t v13 = (void *)swift_allocObject();
        size_t v30 = _swift_stdlib_malloc_size(v13);
        if (!v28) {
          goto LABEL_33;
        }
        int64_t v31 = v30 - v29;
        if (v30 - v29 == 0x8000000000000000 && v28 == -1) {
          goto LABEL_34;
        }
        uint64_t v33 = v31 / v28;
        v13[2] = v27;
        v13[3] = 2 * (v31 / v28);
        uint64_t v34 = (char *)v13 + v29;
        unint64_t v35 = v19[3];
        uint64_t v36 = (v35 >> 1) * v28;
        if (v19[2])
        {
          if (v13 < v19 || v34 >= (char *)v19 + v46 + v36)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v13 != v19)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v19[2] = 0;
        }
        uint64_t v14 = (uint64_t)&v34[v36];
        uint64_t v12 = (v33 & 0x7FFFFFFFFFFFFFFFLL) - (v35 >> 1);
        swift_release();
        uint64_t v2 = v25;
        os_log_type_t v8 = v43;
        uint64_t v20 = (uint64_t)v45;
      }
      BOOL v38 = __OFSUB__(v12--, 1);
      if (v38) {
        break;
      }
      ++v15;
      sub_24CC51248(v20, v14, &qword_2698205A8);
      v14 += *(void *)(v54 + 72);
      v18 += v47;
      uint64_t v19 = v13;
      if (v52 == v15) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  unint64_t v39 = v13[3];
  if (v39 < 2)
  {
LABEL_30:
    OUTLINED_FUNCTION_5_1();
    return;
  }
  unint64_t v40 = v39 >> 1;
  BOOL v38 = __OFSUB__(v40, v12);
  unint64_t v41 = v40 - v12;
  if (!v38)
  {
    v13[2] = v41;
    goto LABEL_30;
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_24CC51010(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = result;
    unint64_t result = sub_24CC58A00();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 4;
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        unint64_t result = sub_24CC58A00();
      }
      else
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v10 = v9 <= 1 ? 1 : v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698208D0);
        uint64_t v11 = (void *)swift_allocObject();
        uint64_t v12 = (uint64_t)(_swift_stdlib_malloc_size(v11) - 32) / 16;
        v11[2] = v10;
        v11[3] = 2 * v12;
        uint64_t v13 = v11 + 4;
        uint64_t v14 = v2[3] >> 1;
        uint64_t v6 = &v11[2 * v14 + 4];
        uint64_t v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v14;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= &v2[2 * v14 + 4]) {
            memmove(v13, v2 + 4, 16 * v14);
          }
          sub_24CC58A00();
          v2[2] = 0;
        }
        else
        {
          sub_24CC58A00();
        }
        unint64_t result = swift_release();
        uint64_t v2 = v11;
      }
      BOOL v16 = __OFSUB__(v4--, 1);
      if (v16) {
        break;
      }
      *uint64_t v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        unint64_t result = swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v4 = 0;
LABEL_23:
  unint64_t v17 = v2[3];
  if (v17 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v18 = v17 >> 1;
  BOOL v16 = __OFSUB__(v18, v4);
  uint64_t v19 = v18 - v4;
  if (!v16)
  {
    v2[2] = v19;
    return (uint64_t)v2;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_24CC51194()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC511CC(uint64_t a1, uint64_t a2)
{
  return sub_24CC4E3CC(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_24CC511D4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_24CC5120C(uint64_t a1, uint64_t a2, char a3)
{
  sub_24CC42848(a1, a2, a3 & 1);
  return sub_24CC58A00();
}

uint64_t sub_24CC51248(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_24CC512A4()
{
  return sub_24CC35E84(&qword_2698208F8, &qword_2698207F8);
}

void OUTLINED_FUNCTION_8_1()
{
  JUMPOUT(0x25330E970);
}

uint64_t sub_24CC51368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_24CC58AE0();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_24CC51410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24CC58790();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = &v16[-v7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820918);
  sub_24CC51FA0();
  sub_24CC59970();
  sub_24CC59990();
  sub_24CC51FF4(&qword_269820940, MEMORY[0x263F067E8]);
  char v9 = sub_24CC598D0();
  uint64_t v10 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  if (v9)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v12 = (void (*)(unsigned char *, void))sub_24CC599A0();
    sub_24CC5203C(v13, a1);
    v12(v16, 0);
    uint64_t v11 = 0;
  }
  v10(v8, v2);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820928);
  return __swift_storeEnumTagSinglePayload(a1, v11, 1, v14);
}

uint64_t sub_24CC51618()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820900);
  uint64_t v1 = OUTLINED_FUNCTION_3_4(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_0();
  uint64_t v62 = v2;
  uint64_t v61 = sub_24CC597A0();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v60 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v59 = (char *)&v58 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820908);
  uint64_t v9 = OUTLINED_FUNCTION_3_4(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_0();
  uint64_t v67 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820910);
  uint64_t v12 = OUTLINED_FUNCTION_3_4(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_0();
  uint64_t v66 = v13;
  sub_24CC58BF0();
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v15;
  uint64_t v65 = v14;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_0();
  uint64_t v63 = v16;
  uint64_t v17 = sub_24CC58760();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = sub_24CC587A0();
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2();
  uint64_t v30 = v29 - v28;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820918);
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_2();
  uint64_t v37 = v36 - v35;
  sub_24CC58C10();
  sub_24CC58780();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v30, v24);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_24CC51FF4(&qword_269820920, MEMORY[0x263F39818]);
  sub_24CC58770();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v17);
  if (sub_24CC51D8C() != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v37, v31);
    return 0;
  }
  uint64_t v38 = v63;
  uint64_t v39 = v64;
  uint64_t v41 = v65;
  uint64_t v40 = v66;
  uint64_t v42 = v67;
  sub_24CC51410(v67);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820928);
  if (__swift_getEnumTagSinglePayload(v42, 1, v43) == 1)
  {
    sub_24CC51F44(v67, &qword_269820908);
    __swift_storeEnumTagSinglePayload(v40, 1, 1, v41);
LABEL_6:
    uint64_t v45 = OUTLINED_FUNCTION_4_4();
    v46(v45);
    uint64_t v47 = &qword_269820910;
    uint64_t v48 = v40;
LABEL_7:
    sub_24CC51F44(v48, v47);
    return 0;
  }
  uint64_t v44 = v67 + *(int *)(v43 + 48);
  sub_24CC51EDC(v67, v40);
  sub_24CC51F44(v44, &qword_269820930);
  if (__swift_getEnumTagSinglePayload(v40, 1, v41) == 1) {
    goto LABEL_6;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v38, v40, v41);
  uint64_t v50 = v62;
  sub_24CC33B50(v62);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v41);
  uint64_t v51 = OUTLINED_FUNCTION_4_4();
  v52(v51);
  uint64_t v53 = v61;
  if (__swift_getEnumTagSinglePayload((uint64_t)v50, 1, v61) == 1)
  {
    uint64_t v47 = &qword_269820900;
    uint64_t v48 = (uint64_t)v50;
    goto LABEL_7;
  }
  uint64_t v54 = v58;
  uint64_t v55 = v59;
  uint64_t v56 = *(void (**)(char *, uint64_t *, uint64_t))(v58 + 32);
  v56(v59, v50, v53);
  uint64_t v57 = v60;
  v56(v60, (uint64_t *)v55, v53);
  if ((*(unsigned int (**)(char *, uint64_t))(v54 + 88))(v57, v53) != *MEMORY[0x263F77518])
  {
    (*(void (**)(char *, uint64_t))(v54 + 8))(v57, v53);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v54 + 96))(v57, v53);
  return *(void *)v57;
}

uint64_t sub_24CC51B7C()
{
  return sub_24CC598D0() & 1;
}

uint64_t sub_24CC51BD8()
{
  return sub_24CC598C0();
}

void sub_24CC51C20()
{
  uint64_t v0 = sub_24CC58750();
  uint64_t v1 = OUTLINED_FUNCTION_3_4(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_2();
  sub_24CC51FF4(&qword_269820920, MEMORY[0x263F39818]);
  sub_24CC587F0();
  __break(1u);
}

void sub_24CC51CB8()
{
  uint64_t v0 = sub_24CC58750();
  uint64_t v1 = OUTLINED_FUNCTION_3_4(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_0();
  sub_24CC58740();
  __break(1u);
}

uint64_t sub_24CC51D0C()
{
  return sub_24CC51FF4(&qword_269820920, MEMORY[0x263F39818]);
}

uint64_t sub_24CC51D58()
{
  return 8;
}

uint64_t sub_24CC51D64()
{
  return swift_release();
}

uint64_t sub_24CC51D6C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24CC51D80(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24CC51D8C()
{
  uint64_t v0 = sub_24CC58790();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269820918);
  sub_24CC51FA0();
  sub_24CC59970();
  sub_24CC59990();
  uint64_t v7 = sub_24CC59980();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7;
}

uint64_t sub_24CC51EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC51F44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24CC51FA0()
{
  unint64_t result = qword_269820938;
  if (!qword_269820938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820918);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820938);
  }
  return result;
}

uint64_t sub_24CC51FF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC5203C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t sub_24CC520C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CC58860();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  uint64_t v8 = v7 - v6;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_24CC58850();
  uint64_t v10 = sub_24CC58840();
  uint64_t v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  sub_24CC545DC(v10, v12, v9);
  uint64_t v13 = (void *)sub_24CC58800();
  objc_msgSend(v9, sel_setPunchOutUri_, v13);

  id v14 = v9;
  sub_24CC59890();

  sub_24CC58BC0();
  sub_24CC58BB0();
  sub_24CC44450(v14, v1 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext);

  return swift_release();
}

void sub_24CC52220(void *a1)
{
  uint64_t v3 = sub_24CC58830();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820018);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12 - v11;
  id v14 = objc_msgSend(a1, sel_punchOutUri);
  if (v14)
  {
    uint64_t v15 = v14;
    sub_24CC58810();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v13, v9, v3);
    __swift_storeEnumTagSinglePayload(v13, 0, 1, v3);
    if (__swift_getEnumTagSinglePayload(v13, 1, v3) != 1)
    {
      sub_24CC54594(v13, &qword_269820018);
      sub_24CC59890();
      sub_24CC58BC0();
      sub_24CC58BB0();
      sub_24CC44450(a1, v1 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext);
      swift_release();
      return;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v13, 1, 1, v3);
  }
  sub_24CC54594(v13, &qword_269820018);
  uint64_t v16 = sub_24CC59000();
  os_log_type_t v17 = sub_24CC599B0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_24CC31000, v16, v17, "Invalid or no punch out uri available", v18, 2u);
    OUTLINED_FUNCTION_8_1();
  }
}

uint64_t sub_24CC52440()
{
  uint64_t v0 = MEMORY[0x25330D8B0]();
  uint64_t v2 = v1;
  uint64_t v3 = MEMORY[0x25330D8A0]();
  uint64_t v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x25330D890]();
  sub_24CC52514(v0, v2, v3, v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CC58BC0();
  sub_24CC58BB0();
  sub_24CC44834();
  return swift_release();
}

uint64_t sub_24CC52514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v63 = a5;
  uint64_t v69 = a4;
  uint64_t v75 = a3;
  uint64_t v76 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698209A8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v77 = (uint64_t)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_24CC58960();
  uint64_t v67 = *(void *)(v70 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v70);
  uint64_t v65 = v9;
  uint64_t v66 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v74 = (char *)&v58 - v10;
  uint64_t v59 = sub_24CC589F0();
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v60 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698209B0);
  MEMORY[0x270FA5388](v12 - 8);
  id v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24CC58920();
  uint64_t v72 = *(void *)(v15 - 8);
  uint64_t v73 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v64 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v58 - v18;
  uint64_t v20 = sub_24CC589A0();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24CC589D0();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v28 = objc_msgSend(self, sel_defaultEnvironment);
  v78[3] = sub_24CC53F48();
  v78[4] = MEMORY[0x263F24F88];
  v78[0] = v28;
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, *MEMORY[0x263F24F28], v20);
  sub_24CC589C0();
  uint64_t v29 = sub_24CC589B0();
  uint64_t v31 = v30;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v78);
  uint64_t v32 = sub_24CC58930();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v32);
  sub_24CC58A00();
  uint64_t v33 = v19;
  uint64_t v68 = a2;
  sub_24CC58910();
  uint64_t v62 = v31;
  if (v63 && v63[2])
  {
    unint64_t v34 = v63[5];
    uint64_t v35 = HIBYTE(v34) & 0xF;
    if ((v34 & 0x2000000000000000) == 0) {
      uint64_t v35 = v63[4] & 0xFFFFFFFFFFFFLL;
    }
    if (v35)
    {
      v78[0] = v63[4];
      v78[1] = v34;
      sub_24CC58A00();
      uint64_t v36 = v60;
      sub_24CC589E0();
      uint64_t v37 = sub_24CC348CC(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v39 = *(void *)(v37 + 16);
      unint64_t v38 = *(void *)(v37 + 24);
      if (v39 >= v38 >> 1) {
        uint64_t v37 = sub_24CC348CC(v38 > 1, v39 + 1, 1, v37);
      }
      uint64_t v40 = v59;
      uint64_t v41 = v58;
      *(void *)(v37 + 16) = v39 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v37+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(void *)(v41 + 72) * v39, v36, v40);
    }
  }
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v72 + 16);
  uint64_t v61 = v33;
  v42(v64, v33, v73);
  uint64_t v43 = v69;
  sub_24CC58A00();
  uint64_t v44 = v74;
  sub_24CC58950();
  uint64_t v45 = sub_24CC59960();
  __swift_storeEnumTagSinglePayload(v77, 1, 1, v45);
  uint64_t v46 = v66;
  uint64_t v47 = v67;
  uint64_t v48 = v70;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v66, v44, v70);
  unint64_t v49 = (*(unsigned __int8 *)(v47 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
  unint64_t v50 = (v65 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v51 = (v50 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v52 = (char *)swift_allocObject();
  *((void *)v52 + 2) = 0;
  *((void *)v52 + 3) = 0;
  uint64_t v53 = v62;
  *((void *)v52 + 4) = v29;
  *((void *)v52 + 5) = v53;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v52[v49], v46, v48);
  *(void *)&v52[v50] = v71;
  uint64_t v54 = &v52[v51];
  *(void *)uint64_t v54 = v75;
  *((void *)v54 + 1) = v43;
  uint64_t v55 = &v52[(v51 + 23) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v56 = v68;
  *(void *)uint64_t v55 = v76;
  *((void *)v55 + 1) = v56;
  sub_24CC58A00();
  sub_24CC58A00();
  swift_unknownObjectRetain();
  swift_retain();
  sub_24CC5395C(v77, (uint64_t)&unk_2698209C8, (uint64_t)v52);
  swift_release();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v74, v48);
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v61, v73);
}

uint64_t sub_24CC52C50()
{
  sub_24CC59010();
  OUTLINED_FUNCTION_2_1();
  uint64_t v0 = OUTLINED_FUNCTION_3_0();
  v1(v0);
  sub_24CC58A30();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = OUTLINED_FUNCTION_3_0();
  v3(v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24CC52D0C()
{
  return type metadata accessor for ActionHandler();
}

uint64_t type metadata accessor for ActionHandler()
{
  uint64_t result = qword_269820960;
  if (!qword_269820960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC52D5C()
{
  uint64_t result = sub_24CC59010();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CC58A30();
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

uint64_t sub_24CC52E28()
{
  return sub_24CC59B30();
}

uint64_t sub_24CC52E50()
{
  return sub_24CC59B40();
}

uint64_t sub_24CC52E94()
{
  return 1;
}

uint64_t sub_24CC52EA4()
{
  return sub_24CC59B40();
}

uint64_t sub_24CC52EF4()
{
  return OUTLINED_FUNCTION_3_5((uint64_t)sub_24CC52F08);
}

uint64_t sub_24CC52F08()
{
  OUTLINED_FUNCTION_11();
  sub_24CC53EFC();
  swift_allocError();
  swift_willThrow();
  OUTLINED_FUNCTION_10_2();
  return v0(0);
}

uint64_t sub_24CC52F8C()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_3_5((uint64_t)sub_24CC52FA4);
}

uint64_t sub_24CC52FA4()
{
  OUTLINED_FUNCTION_11();
  uint64_t v0 = sub_24CC59000();
  os_log_type_t v1 = sub_24CC599C0();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_24CC31000, v0, v1, "Unexpected disambiguation encountered due to missing target parameter. Executing the root deep link.", v2, 2u);
    OUTLINED_FUNCTION_8_1();
  }

  OUTLINED_FUNCTION_10_2();
  return v3(0);
}

uint64_t sub_24CC53078()
{
  return sub_24CC58A00();
}

uint64_t sub_24CC53084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 144) = v14;
  *(_OWORD *)(v8 + 128) = v13;
  *(void *)(v8 + 112) = a7;
  *(void *)(v8 + 120) = a8;
  *(void *)(v8 + 96) = a5;
  *(void *)(v8 + 104) = a6;
  *(void *)(v8 + 88) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698209E0);
  *(void *)(v8 + 152) = swift_task_alloc();
  uint64_t v9 = sub_24CC58990();
  *(void *)(v8 + 160) = v9;
  *(void *)(v8 + 168) = *(void *)(v9 - 8);
  *(void *)(v8 + 176) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698209E8);
  *(void *)(v8 + 184) = v10;
  *(void *)(v8 + 192) = *(void *)(v10 - 8);
  *(void *)(v8 + 200) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC531F0, 0, 0);
}

uint64_t sub_24CC531F0()
{
  OUTLINED_FUNCTION_11();
  uint64_t v1 = v0[19];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_24CC58FD0();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v3);
  sub_24CC58980();
  sub_24CC58970();
  unint64_t v4 = sub_24CC54544();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[26] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CC53308;
  uint64_t v6 = v0[25];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[12];
  return MEMORY[0x270F0C930](v6, v8, v7, v9, v4, ObjectType, v10);
}

uint64_t sub_24CC53308()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4[22];
  uint64_t v6 = v4[21];
  uint64_t v7 = v4[20];
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v9 = v8;
  v3[27] = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (v0)
  {
    uint64_t v10 = sub_24CC53688;
  }
  else
  {
    (*(void (**)(void, void))(v3[24] + 8))(v3[25], v3[23]);
    uint64_t v10 = sub_24CC5346C;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_24CC5346C()
{
  uint64_t v11 = v0;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_24CC59000();
  os_log_type_t v2 = sub_24CC599B0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = v0[17];
    unint64_t v3 = v0[18];
    uint64_t v6 = v0[15];
    unint64_t v5 = v0[16];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_24CC58A00();
    v0[9] = sub_24CC3AC7C(v6, v5, &v10);
    sub_24CC59A00();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    sub_24CC58A00();
    v0[10] = sub_24CC3AC7C(v4, v3, &v10);
    sub_24CC59A00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC31000, v1, v2, "Executed app intent named %s in bundleID: %s.", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_8_1();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return v8();
}

uint64_t sub_24CC53688()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[27];
  sub_24CC58A00();
  sub_24CC58A00();
  id v2 = v1;
  sub_24CC58A00();
  sub_24CC58A00();
  id v3 = v1;
  uint64_t v4 = sub_24CC59000();
  os_log_type_t v5 = sub_24CC599C0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[27];
    unint64_t v7 = v0[18];
    uint64_t v16 = v0[17];
    uint64_t v8 = v0[15];
    unint64_t v9 = v0[16];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315650;
    sub_24CC58A00();
    v0[7] = sub_24CC3AC7C(v8, v9, &v17);
    sub_24CC59A00();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    sub_24CC58A00();
    v0[5] = sub_24CC3AC7C(v16, v7, &v17);
    sub_24CC59A00();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 22) = 2080;
    swift_getErrorValue();
    uint64_t v11 = sub_24CC59AD0();
    v0[8] = sub_24CC3AC7C(v11, v12, &v17);
    sub_24CC59A00();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24CC31000, v4, v5, "Unable to execute app intent named: %s in bundleID: %s. Error: %s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_8_1();
  }
  else
  {
    long long v13 = (void *)v0[27];

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return v14();
}

uint64_t sub_24CC5395C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC59960();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_24CC54594(a1, &qword_2698209A8);
  }
  else
  {
    sub_24CC59950();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CC59940();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CC53ACC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC547C0;
  return sub_24CC52EF4();
}

uint64_t sub_24CC53B58()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC53BE4;
  return sub_24CC52F8C();
}

uint64_t sub_24CC53BE4()
{
  OUTLINED_FUNCTION_6_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_4();
  *os_log_type_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_24CC53CB0()
{
  return sub_24CC53078();
}

uint64_t sub_24CC53CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24CC547C0;
  return MEMORY[0x270F0C8D0](a1, a2, a3);
}

uint64_t sub_24CC53D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24CC53E28;
  return MEMORY[0x270F0C8D0](a1, a2, a3);
}

uint64_t sub_24CC53E28()
{
  OUTLINED_FUNCTION_6_3();
  char v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_4();
  *os_log_type_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  if (v0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v3 & 1;
  }
  return v6(v7);
}

unint64_t sub_24CC53EFC()
{
  unint64_t result = qword_2698209A0;
  if (!qword_2698209A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698209A0);
  }
  return result;
}

unint64_t sub_24CC53F48()
{
  unint64_t result = qword_2698209B8;
  if (!qword_2698209B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2698209B8);
  }
  return result;
}

uint64_t sub_24CC53F88()
{
  uint64_t v1 = sub_24CC58960();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = (((((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v9 + 16, v8);
}

uint64_t sub_24CC54080(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_24CC58960() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v1[3];
  uint64_t v14 = v1[2];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + v4;
  uint64_t v10 = *(void *)((char *)v1 + v5);
  uint64_t v11 = *(void *)((char *)v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_24CC541F8;
  return sub_24CC53084(a1, v14, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24CC541F8()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return v3();
}

uint64_t sub_24CC542B8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_24CC54394;
  return v6(a1);
}

uint64_t sub_24CC54394()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return v3();
}

uint64_t sub_24CC54458()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC54490()
{
  OUTLINED_FUNCTION_11();
  uint64_t v3 = v2;
  unint64_t v4 = *(int **)(v0 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CC541F8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698209D0 + dword_2698209D0);
  return v6(v3, v4);
}

unint64_t sub_24CC54544()
{
  unint64_t result = qword_2698209F0;
  if (!qword_2698209F0)
  {
    type metadata accessor for ActionHandler();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698209F0);
  }
  return result;
}

uint64_t sub_24CC54594(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = OUTLINED_FUNCTION_3_0();
  v4(v3);
  return a1;
}

void sub_24CC545DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_24CC598E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);
}

uint64_t getEnumTagSinglePayload for ActionHandler.Errors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ActionHandler.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CC54730);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CC54758()
{
  return 0;
}

ValueMetadata *type metadata accessor for ActionHandler.Errors()
{
  return &type metadata for ActionHandler.Errors;
}

unint64_t sub_24CC54774()
{
  unint64_t result = qword_2698209F8;
  if (!qword_2698209F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698209F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return v0 + 8;
}

uint64_t *sub_24CC54828(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_24CC587A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    if (*(uint64_t *)((char *)a2 + v8 + 24))
    {
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *((void *)v10 + 1);
      char v13 = v10[16];
      sub_24CC42848(*(void *)v10, v12, v13);
      *(void *)uint64_t v9 = v11;
      *((void *)v9 + 1) = v12;
      v9[16] = v13;
      *((void *)v9 + 3) = *((void *)v10 + 3);
      sub_24CC58A00();
    }
    else
    {
      long long v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    if (!*(void *)v18)
    {
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      return a1;
    }
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
  }
  swift_retain();
  return a1;
}

uint64_t sub_24CC5496C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC587A0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  if (*(void *)(v6 + 24))
  {
    sub_24CC38DF8(*(void *)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + *(int *)(a2 + 24)))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC54A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC587A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (*(void *)(a2 + v7 + 24))
  {
    uint64_t v10 = *(void *)v9;
    uint64_t v11 = *(void *)(v9 + 8);
    char v12 = *(unsigned char *)(v9 + 16);
    sub_24CC42848(*(void *)v9, v11, v12);
    *(void *)uint64_t v8 = v10;
    *(void *)(v8 + 8) = v11;
    *(unsigned char *)(v8 + 16) = v12;
    *(void *)(v8 + 24) = *(void *)(v9 + 24);
    sub_24CC58A00();
  }
  else
  {
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
  }
  uint64_t v14 = *(int *)(a3 + 24);
  long long v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  if (*v16)
  {
    uint64_t v17 = v16[1];
    *long long v15 = *v16;
    v15[1] = v17;
    swift_retain();
  }
  else
  {
    *(_OWORD *)long long v15 = *(_OWORD *)v16;
  }
  return a1;
}

uint64_t sub_24CC54B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC587A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a1 + v7 + 24);
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  if (v10)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)v9;
      uint64_t v13 = *(void *)(v9 + 8);
      char v14 = *(unsigned char *)(v9 + 16);
      sub_24CC42848(*(void *)v9, v13, v14);
      uint64_t v15 = *(void *)v8;
      uint64_t v16 = *(void *)(v8 + 8);
      char v17 = *(unsigned char *)(v8 + 16);
      *(void *)uint64_t v8 = v12;
      *(void *)(v8 + 8) = v13;
      *(unsigned char *)(v8 + 16) = v14;
      sub_24CC38DF8(v15, v16, v17);
      *(void *)(v8 + 24) = *(void *)(v9 + 24);
      sub_24CC58A00();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24CC54CB0(v8);
      long long v21 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *(_OWORD *)(v8 + 16) = v21;
    }
  }
  else if (v11)
  {
    uint64_t v18 = *(void *)v9;
    uint64_t v19 = *(void *)(v9 + 8);
    char v20 = *(unsigned char *)(v9 + 16);
    sub_24CC42848(*(void *)v9, v19, v20);
    *(void *)uint64_t v8 = v18;
    *(void *)(v8 + 8) = v19;
    *(unsigned char *)(v8 + 16) = v20;
    *(void *)(v8 + 24) = *(void *)(v9 + 24);
    sub_24CC58A00();
  }
  else
  {
    long long v22 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v22;
  }
  uint64_t v23 = *(int *)(a3 + 24);
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *(void *)(a1 + v23);
  uint64_t v27 = *v25;
  if (!v26)
  {
    if (v27)
    {
      uint64_t v29 = v25[1];
      *uint64_t v24 = v27;
      v24[1] = v29;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    return a1;
  }
  if (!v27)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v28 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v28;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24CC54CB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CC54D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC587A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (uint64_t *)(a2 + v8);
  uint64_t v14 = *v13;
  if (*v13)
  {
    uint64_t v15 = v13[1];
    void *v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  return a1;
}

uint64_t sub_24CC54DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC587A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (*(void *)(a1 + v7 + 24))
  {
    if (*(void *)(v9 + 24))
    {
      char v10 = *(unsigned char *)(v9 + 16);
      uint64_t v11 = *(void *)v8;
      uint64_t v12 = *(void *)(v8 + 8);
      char v13 = *(unsigned char *)(v8 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *(unsigned char *)(v8 + 16) = v10;
      sub_24CC38DF8(v11, v12, v13);
      *(void *)(v8 + 24) = *(void *)(v9 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_24CC54CB0(v8);
  }
  long long v14 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v14;
LABEL_6:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  char v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *(void *)(a1 + v15);
  uint64_t v19 = *v17;
  if (!v18)
  {
    if (v19)
    {
      uint64_t v21 = v17[1];
      *uint64_t v16 = v19;
      v16[1] = v21;
      return a1;
    }
LABEL_12:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_12;
  }
  uint64_t v20 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v20;
  swift_release();
  return a1;
}

uint64_t sub_24CC54ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC54EE4);
}

uint64_t sub_24CC54EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24CC587A0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24CC54F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC54F94);
}

void sub_24CC54F94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_24CC587A0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  }
}

uint64_t type metadata accessor for AttributionView()
{
  uint64_t result = qword_269820A10;
  if (!qword_269820A10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC55068()
{
  uint64_t result = sub_24CC587A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC55108()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC55124(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(uint64_t *, char *), uint64_t a6)
{
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v24 = a4;
  uint64_t v25 = a2;
  int v33 = a3;
  uint64_t v26 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820928);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820908);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820918);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820A28);
  uint64_t v23 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v26;
  uint64_t v30 = v25;
  char v31 = v33 & 1;
  uint64_t v32 = v24;
  (*(void (**)(char *, void, uint64_t))(v14 + 16))(v16, v22[1], v13);
  sub_24CC35E84(&qword_269820A30, &qword_269820918);
  sub_24CC59930();
  sub_24CC35E84(&qword_269820A38, &qword_269820A28);
  sub_24CC599F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7) == 1)
  {
    uint64_t v20 = v26;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v17);
  }
  else
  {
    while (1)
    {
      sub_24CC51248((uint64_t)v12, (uint64_t)v9, &qword_269820928);
      uint64_t v20 = v28;
      v27(&v29, v9);
      if (v6) {
        break;
      }
      sub_24CC34878((uint64_t)v9, &qword_269820928);
      sub_24CC599F0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7) == 1)
      {
        uint64_t v20 = v29;
        goto LABEL_6;
      }
    }
    sub_24CC38DF8(v29, v30, v31);
    swift_bridgeObjectRelease();
    sub_24CC34878((uint64_t)v9, &qword_269820928);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v17);
  }
  return v20;
}

uint64_t sub_24CC554E0()
{
  uint64_t v1 = sub_24CC58760();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820918);
  uint64_t v5 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC58780();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_24CC56890(&qword_269820920, MEMORY[0x263F39818]);
  sub_24CC58770();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v17 = v0;
  uint64_t v8 = sub_24CC55124(0, 0xE000000000000000, 0, MEMORY[0x263F8EE78], (void (*)(uint64_t *, char *))sub_24CC5682C, (uint64_t)v16);
  uint64_t v10 = v9;
  LOBYTE(v4) = v11 & 1;
  sub_24CC59460();
  uint64_t v12 = sub_24CC594D0();
  sub_24CC38DF8(v8, v10, (char)v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v15);
  return v12;
}

uint64_t sub_24CC5576C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v82 = a3;
  uint64_t v91 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820900);
  MEMORY[0x270FA5388](v4 - 8);
  char v83 = (uint64_t *)((char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v88 = sub_24CC597A0();
  uint64_t v85 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v84 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC587E0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v81 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24CC587A0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v80 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24CC58BF0();
  uint64_t v87 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v86 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820928);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820930);
  MEMORY[0x270FA5388](v79);
  uint64_t v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820910);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  long long v22 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v75 - v23;
  uint64_t v25 = *(int *)(v14 + 56);
  uint64_t v26 = (uint64_t)&v16[v25];
  uint64_t v27 = a2;
  uint64_t v28 = a2 + v25;
  sub_24CC49660(v27, (uint64_t)v16, &qword_269820910);
  sub_24CC49660(v28, v26, &qword_269820930);
  sub_24CC51248((uint64_t)v16, (uint64_t)v24, &qword_269820910);
  sub_24CC51248(v26, (uint64_t)v18, &qword_269820930);
  sub_24CC49660((uint64_t)v24, (uint64_t)v22, &qword_269820910);
  uint64_t v89 = v11;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v11);
  uint64_t v92 = v18;
  int v90 = v24;
  if (EnumTagSinglePayload == 1)
  {
    sub_24CC34878((uint64_t)v22, &qword_269820910);
    uint64_t v30 = v91;
    uint64_t v32 = *(void *)v91;
    uint64_t v31 = *(void *)(v91 + 8);
    char v33 = *(unsigned char *)(v91 + 16);
    sub_24CC35E84(&qword_269820A40, &qword_269820930);
    sub_24CC587B0();
    sub_24CC587C0();
    uint64_t v34 = sub_24CC59540();
    uint64_t v36 = v35;
    char v38 = v37 & 1;
    uint64_t v39 = sub_24CC59520();
    uint64_t v87 = v40;
    uint64_t v88 = v39;
    LODWORD(v86) = v41;
    uint64_t v89 = v42;
    sub_24CC38DF8(v34, v36, v38);
    swift_bridgeObjectRelease();
    sub_24CC38DF8(v32, v31, v33);
    swift_bridgeObjectRelease();
    sub_24CC34878((uint64_t)v92, &qword_269820930);
    uint64_t result = sub_24CC34878((uint64_t)v90, &qword_269820910);
    uint64_t v44 = v87;
    *(void *)uint64_t v30 = v88;
    *(void *)(v30 + 8) = v44;
    *(unsigned char *)(v30 + 16) = v86 & 1;
    uint64_t v45 = v89;
LABEL_5:
    *(void *)(v30 + 24) = v45;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v87 + 32))(v86, v22, v89);
  uint64_t v93 = sub_24CC58BE0();
  uint64_t v94 = v46;
  sub_24CC42D40();
  uint64_t v47 = sub_24CC59550();
  uint64_t v82 = v48;
  char v50 = v49;
  uint64_t v52 = v51;
  uint64_t v53 = v83;
  sub_24CC33B50(v83);
  if (__swift_getEnumTagSinglePayload((uint64_t)v53, 1, v88) == 1)
  {
    sub_24CC34878((uint64_t)v53, &qword_269820900);
    uint64_t v30 = v91;
    uint64_t v54 = *(void *)v91;
    uint64_t v55 = *(void *)(v91 + 8);
    char v56 = *(unsigned char *)(v91 + 16);
    uint64_t v57 = v82;
    uint64_t v58 = sub_24CC59520();
    uint64_t v84 = v59;
    uint64_t v85 = v58;
    LODWORD(v83) = v60;
    uint64_t v88 = v61;
    sub_24CC38DF8(v54, v55, v56);
    swift_bridgeObjectRelease();
    sub_24CC38DF8(v47, v57, v50 & 1);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v89);
    sub_24CC34878((uint64_t)v92, &qword_269820930);
    uint64_t result = sub_24CC34878((uint64_t)v90, &qword_269820910);
    uint64_t v62 = v84;
    *(void *)uint64_t v30 = v85;
    *(void *)(v30 + 8) = v62;
    *(unsigned char *)(v30 + 16) = v83 & 1;
    uint64_t v45 = v88;
    goto LABEL_5;
  }
  uint64_t v77 = v52;
  (*(void (**)(char *, uint64_t *, uint64_t))(v85 + 32))(v84, v53, v88);
  uint64_t v63 = v91;
  uint64_t v78 = *(void *)v91;
  uint64_t v75 = *(void *)(v91 + 8);
  char v64 = *(unsigned char *)(v91 + 16);
  uint64_t v76 = v47;
  uint64_t v65 = sub_24CC594C0();
  uint64_t v67 = v66;
  char v69 = v68 & 1;
  uint64_t v70 = v75;
  uint64_t v81 = (char *)sub_24CC59520();
  uint64_t v80 = v71;
  LODWORD(v79) = v72;
  char v83 = v73;
  sub_24CC38DF8(v76, v82, v50 & 1);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v65, v67, v69);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v78, v70, v64);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v84, v88);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v89);
  sub_24CC34878((uint64_t)v92, &qword_269820930);
  uint64_t result = sub_24CC34878((uint64_t)v90, &qword_269820910);
  uint64_t v74 = v80;
  *(void *)uint64_t v63 = v81;
  *(void *)(v63 + 8) = v74;
  *(unsigned char *)(v63 + 16) = v79 & 1;
  *(void *)(v63 + 24) = v83;
  return result;
}

uint64_t sub_24CC55F4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AttributionView() + 20);
  if (*(void *)(v3 + 24))
  {
    uint64_t v23 = *(void *)(v3 + 8);
    uint64_t v25 = *(void *)v3;
    char v26 = *(_DWORD *)(v3 + 16) & 1;
    sub_24CC42848(*(void *)v3, v23, v26);
    sub_24CC58A00();
    uint64_t v4 = sub_24CC554E0();
    uint64_t v6 = v5;
    char v8 = v7 & 1;
    *(void *)&long long v28 = 32;
    *((void *)&v28 + 1) = 0xE100000000000000;
    uint64_t v24 = a1;
    sub_24CC58A00();
    sub_24CC59910();
    swift_bridgeObjectRelease();
    sub_24CC59910();
    uint64_t v9 = sub_24CC59520();
    uint64_t v11 = v10;
    char v13 = v12;
    swift_bridgeObjectRelease();
    sub_24CC38DF8(v4, v6, v8);
    swift_bridgeObjectRelease();
    LOBYTE(v28) = v26;
    uint64_t v14 = sub_24CC59520();
    uint64_t v16 = v15;
    LOBYTE(v6) = v17 & 1;
    uint64_t v18 = v9;
    a1 = v24;
    sub_24CC38DF8(v18, v11, v13 & 1);
    swift_bridgeObjectRelease();
    sub_24CC42848(v14, v16, v6);
    sub_24CC58A00();
    sub_24CC42848(v14, v16, v6);
    sub_24CC58A00();
    sub_24CC59370();
    char v19 = v30;
    sub_24CC38DF8(v25, v23, v26);
    swift_bridgeObjectRelease();
    sub_24CC38DF8(v14, v16, v6);
    swift_bridgeObjectRelease();
    sub_24CC38DF8(v14, v16, v6);
    uint64_t result = swift_bridgeObjectRelease();
    long long v22 = v29;
    long long v21 = v28;
  }
  else
  {
    sub_24CC554E0();
    uint64_t result = sub_24CC59370();
    long long v21 = v27;
    long long v22 = v29;
    char v19 = v30;
  }
  *(_OWORD *)a1 = v21;
  *(_OWORD *)(a1 + 16) = v22;
  *(unsigned char *)(a1 + 32) = v19;
  return result;
}

uint64_t sub_24CC561E8()
{
  uint64_t v1 = type metadata accessor for AttributionView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820A20);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC55F4C((uint64_t)&v22);
  long long v19 = v22;
  long long v20 = v23;
  LOBYTE(v21) = v24;
  sub_24CC564D8(v0, (uint64_t)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  sub_24CC56658((uint64_t)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820880);
  unint64_t v11 = sub_24CC5673C();
  sub_24CC59580();
  swift_release();
  sub_24CC50C44(v19, *((uint64_t *)&v19 + 1), v20);
  *(void *)&long long v22 = v10;
  *((void *)&v22 + 1) = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_24CC59570();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v24 = MEMORY[0x263F774B0];
  *((void *)&v23 + 1) = MEMORY[0x263F1B720];
  *(void *)&long long v22 = v12;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  return sub_24CC59850();
}

uint64_t sub_24CC56478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = type metadata accessor for AttributionView();
  char v7 = (uint64_t (**)(uint64_t, uint64_t))(a3 + *(int *)(result + 24));
  if (*v7) {
    return (*v7)(a1, a2);
  }
  return result;
}

uint64_t sub_24CC564D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC5653C()
{
  uint64_t v1 = type metadata accessor for AttributionView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_24CC587A0();
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v5 + 8))(v0 + v3);
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  if (*(void *)(v6 + 24))
  {
    sub_24CC38DF8(*(void *)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v0 + v3 + *(int *)(v1 + 24))) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CC56658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC566BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for AttributionView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_24CC56478(a1, a2, v6);
}

unint64_t sub_24CC5673C()
{
  unint64_t result = qword_269820878;
  if (!qword_269820878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820878);
  }
  return result;
}

uint64_t sub_24CC567AC()
{
  return sub_24CC56890(&qword_269820920, MEMORY[0x263F39818]);
}

uint64_t sub_24CC567F8()
{
  return 8;
}

uint64_t sub_24CC56804()
{
  return swift_release();
}

uint64_t sub_24CC5680C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24CC56820(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24CC5682C(uint64_t a1, uint64_t a2)
{
  return sub_24CC5576C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_24CC56848()
{
  return sub_24CC56890(&qword_269820A48, MEMORY[0x263F777E8]);
}

uint64_t sub_24CC56890(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC568D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_24CC56944(uint64_t a1)
{
  uint64_t v2 = sub_24CC58C90();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_24CC569A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC56A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC56A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC56AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CC56B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC56B4C);
}

uint64_t sub_24CC56B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_24CC56B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC56BA8);
}

uint64_t sub_24CC56BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC58C90();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TipCollectionBannerView()
{
  uint64_t result = qword_269820A50;
  if (!qword_269820A50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC56C3C()
{
  uint64_t result = sub_24CC58C90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC56CC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CC56CE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820A60);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_24CC58FC0();
  uint64_t v60 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_24CC591A0();
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2();
  uint64_t v15 = (_OWORD *)(v14 - v13);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820A68);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820A70);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1_0();
  char v64 = v21;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820A78);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_1_0();
  uint64_t v65 = v23;
  uint64_t v24 = sub_24CC59310();
  sub_24CC57274(v2, v73);
  v74[176] = 0;
  memcpy(&v74[7], v73, 0xA8uLL);
  char v25 = sub_24CC593E0();
  v74[184] = 1;
  v67[44] = v24;
  v67[45] = 0x4024000000000000;
  char v68 = 0;
  memcpy(v69, v74, 0xAFuLL);
  v69[175] = v25;
  long long v70 = 0u;
  long long v71 = 0u;
  char v72 = 1;
  sub_24CC59790();
  sub_24CC57714(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v67, 0.0, 1, 0.0, 1);
  sub_24CC578B4((uint64_t)v73);
  memcpy(v75, v67, 0x160uLL);
  char v26 = (char *)v15 + *(int *)(v12 + 28);
  uint64_t v27 = *MEMORY[0x263F19860];
  sub_24CC59320();
  OUTLINED_FUNCTION_4();
  (*(void (**)(char *, uint64_t))(v28 + 104))(v26, v27);
  __asm { FMOV            V0.2D, #16.0 }
  *uint64_t v15 = _Q0;
  if (qword_269820010 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v61, (uint64_t)qword_269821A50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v10, v34, v61);
  uint64_t v35 = sub_24CC59700();
  uint64_t KeyPath = swift_getKeyPath();
  sub_24CC57C64((uint64_t)v15, v19);
  char v37 = (uint64_t *)(v19 + *(int *)(v58 + 36));
  uint64_t *v37 = KeyPath;
  v37[1] = v35;
  sub_24CC57CC8((uint64_t)v15);
  uint64_t v38 = sub_24CC59790();
  uint64_t v40 = v39;
  sub_24CC49660(v19, v6, &qword_269820A68);
  int v41 = (uint64_t *)(v6 + *(int *)(v62 + 36));
  *int v41 = v38;
  v41[1] = v40;
  sub_24CC49660(v6, (uint64_t)v64 + *(int *)(v59 + 36), &qword_269820A60);
  memcpy(v64, v75, 0x160uLL);
  sub_24CC57E60((uint64_t)v75);
  sub_24CC34878(v6, &qword_269820A60);
  sub_24CC34878(v19, &qword_269820A68);
  sub_24CC57D24((uint64_t)v75);
  type metadata accessor for CGSize();
  sub_24CC59730();
  uint64_t v42 = v67[0];
  uint64_t v43 = v67[1];
  uint64_t v44 = v67[2];
  uint64_t v45 = sub_24CC596D0();
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = sub_24CC59490();
  uint64_t v48 = swift_getKeyPath();
  uint64_t v49 = sub_24CC59780();
  uint64_t v51 = v50;
  sub_24CC49660((uint64_t)v64, v65, &qword_269820A70);
  uint64_t v52 = (void *)(v65 + *(int *)(v63 + 36));
  *uint64_t v52 = v42;
  v52[1] = v43;
  v52[2] = v44;
  v52[3] = 0x6C69662E73706974;
  v52[4] = 0xE90000000000006CLL;
  v52[5] = v46;
  v52[6] = v45;
  v52[7] = v48;
  v52[8] = v47;
  v52[9] = v49;
  v52[10] = v51;
  sub_24CC34878((uint64_t)v64, &qword_269820A70);
  sub_24CC59730();
  uint64_t v53 = v67[0];
  uint64_t v54 = v67[1];
  uint64_t v55 = v67[2];
  sub_24CC49660(v65, a1, &qword_269820A78);
  char v56 = (void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269820A80) + 36));
  void *v56 = v53;
  v56[1] = v54;
  v56[2] = v55;
  return sub_24CC34878(v65, &qword_269820A78);
}

uint64_t sub_24CC57274@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_24CC58C50();
  uint64_t v27 = v4;
  uint64_t v28 = v3;
  uint64_t v5 = sub_24CC59360();
  sub_24CC57434(a1, (uint64_t)&v30);
  uint64_t v7 = v30;
  uint64_t v6 = v31;
  char v8 = v32;
  uint64_t v9 = v33;
  uint64_t v10 = v34;
  uint64_t v11 = v35;
  char v12 = v36;
  uint64_t v13 = v37;
  char v25 = sub_24CC59400();
  sub_24CC59080();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = sub_24CC596D0();
  uint64_t KeyPath = swift_getKeyPath();
  __src[0] = v5;
  __src[1] = 0;
  LOBYTE(__src[2]) = 1;
  __src[3] = v7;
  __src[4] = v6;
  LOBYTE(__src[5]) = v8;
  __src[6] = v9;
  __src[7] = v10;
  __src[8] = v11;
  LOBYTE(__src[9]) = v12;
  __src[10] = v13;
  LOBYTE(__src[11]) = v25;
  __src[12] = v15;
  __src[13] = v17;
  __src[14] = v19;
  __src[15] = v21;
  LOBYTE(__src[16]) = 0;
  __src[17] = KeyPath;
  __src[18] = v22;
  memcpy(a2 + 2, __src, 0x98uLL);
  *a2 = v28;
  a2[1] = v27;
  uint64_t v30 = v5;
  uint64_t v31 = 0;
  char v32 = 1;
  uint64_t v33 = v7;
  uint64_t v34 = v6;
  LOBYTE(v35) = v8;
  uint64_t v36 = v9;
  uint64_t v37 = v10;
  uint64_t v38 = v11;
  char v39 = v12;
  uint64_t v40 = v13;
  char v41 = v25;
  uint64_t v42 = v15;
  uint64_t v43 = v17;
  uint64_t v44 = v19;
  uint64_t v45 = v21;
  char v46 = 0;
  uint64_t v47 = KeyPath;
  uint64_t v48 = v22;
  sub_24CC58A00();
  sub_24CC57F14((uint64_t)__src);
  sub_24CC57FA4((uint64_t)&v30);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC57434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v3 = sub_24CC594A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC58C70();
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = 0xE000000000000000;
  if (v8) {
    unint64_t v10 = v8;
  }
  uint64_t v48 = v9;
  unint64_t v49 = v10;
  unint64_t v46 = sub_24CC42D40();
  uint64_t v11 = sub_24CC59550();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_24CC59420();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1A680], v3);
  sub_24CC594B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_24CC59430();
  swift_release();
  uint64_t v16 = sub_24CC59530();
  uint64_t v43 = v17;
  uint64_t v44 = v16;
  char v19 = v18;
  uint64_t v45 = v20;
  swift_release();
  HIDWORD(v42) = v19 & 1;
  sub_24CC38DF8(v11, v13, v15);
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_24CC58C80();
  if (v22) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = 0;
  }
  unint64_t v24 = 0xE000000000000000;
  if (v22) {
    unint64_t v24 = v22;
  }
  uint64_t v48 = v23;
  unint64_t v49 = v24;
  uint64_t v25 = sub_24CC59550();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  sub_24CC59410();
  uint64_t v30 = sub_24CC59530();
  uint64_t v32 = v31;
  char v34 = v33;
  uint64_t v36 = v35;
  swift_release();
  v34 &= 1u;
  sub_24CC38DF8(v25, v27, v29);
  swift_bridgeObjectRelease();
  char v37 = BYTE4(v42);
  LOBYTE(v48) = BYTE4(v42);
  uint64_t v39 = v43;
  uint64_t v38 = v44;
  *(void *)a2 = v44;
  *(void *)(a2 + 8) = v39;
  *(unsigned char *)(a2 + 16) = v37;
  *(void *)(a2 + 24) = v45;
  *(void *)(a2 + 32) = v30;
  *(void *)(a2 + 40) = v32;
  *(unsigned char *)(a2 + 48) = v34;
  *(void *)(a2 + 56) = v36;
  uint64_t v40 = v38;
  sub_24CC42848(v38, v39, v37);
  sub_24CC58A00();
  sub_24CC42848(v30, v32, v34);
  sub_24CC58A00();
  sub_24CC38DF8(v30, v32, v34);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v40, v39, v48);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC57714@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_24CC599D0();
    uint64_t v23 = (void *)sub_24CC593D0();
    sub_24CC58FE0();
  }
  sub_24CC591B0();
  memcpy((void *)a9, v13, 0xE9uLL);
  memcpy((void *)(a9 + 240), __src, 0x70uLL);
  return sub_24CC57E60((uint64_t)v13);
}

uint64_t sub_24CC578B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  char v7 = *(unsigned char *)(a1 + 88);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v5, v6, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_24CC57968@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  if (a1)
  {
    uint64_t v3 = sub_24CC59790();
    uint64_t v5 = v4;
    sub_24CC57A5C((uint64_t)&v19);
    *(void *)&long long v7 = v3;
    *((void *)&v7 + 1) = v5;
    uint64_t v8 = v19;
    char v9 = v20;
    uint64_t v10 = v21;
    char v11 = v22;
    long long v12 = v23;
    uint64_t v13 = v24;
    uint64_t v14 = v25;
    uint64_t v15 = v26;
    long long v16 = v27;
    long long v17 = v28;
    uint64_t v18 = v29;
    nullsub_1(&v7);
  }
  else
  {
    sub_24CC58490(&v7);
  }
  sub_24CC584A8((uint64_t)&v7, (uint64_t)&v19);
  return sub_24CC584A8((uint64_t)&v19, a2);
}

uint64_t sub_24CC57A5C@<X0>(uint64_t a1@<X8>)
{
  sub_24CC59790();
  sub_24CC59130();
  uint64_t v2 = sub_24CC596D0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_24CC58A00();
  uint64_t v4 = sub_24CC59720();
  uint64_t v5 = sub_24CC59440();
  uint64_t v6 = swift_getKeyPath();
  uint64_t v7 = sub_24CC596D0();
  uint64_t v8 = swift_getKeyPath();
  *(void *)a1 = v10;
  *(unsigned char *)(a1 + 8) = v11;
  *(void *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 24) = v13;
  *(void *)(a1 + 32) = v14;
  *(void *)(a1 + 40) = v15;
  *(void *)(a1 + 48) = KeyPath;
  *(void *)(a1 + 56) = v2;
  *(void *)(a1 + 64) = 0x3FD3333333333333;
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = v5;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v7;
  swift_retain();
  return swift_release();
}

uint64_t sub_24CC57B9C@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC57968(*(void *)(v1 + 8), a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24CC57BDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CC59240();
  *a1 = result;
  return result;
}

uint64_t sub_24CC57C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CC59240();
  *a1 = result;
  return result;
}

uint64_t sub_24CC57C34()
{
  return sub_24CC59250();
}

uint64_t sub_24CC57C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC591A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC57CC8(uint64_t a1)
{
  uint64_t v2 = sub_24CC591A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CC57D24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  char v7 = *(unsigned char *)(a1 + 112);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v5, v6, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_24CC57DD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CC59260();
  *a1 = result;
  return result;
}

uint64_t sub_24CC57E04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CC59260();
  *a1 = result;
  return result;
}

uint64_t sub_24CC57E30()
{
  return sub_24CC59270();
}

uint64_t sub_24CC57E60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  char v7 = *(unsigned char *)(a1 + 112);
  sub_24CC58A00();
  sub_24CC42848(v2, v3, v4);
  sub_24CC58A00();
  sub_24CC42848(v5, v6, v7);
  swift_retain();
  sub_24CC58A00();
  swift_retain();
  return a1;
}

uint64_t sub_24CC57F14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_24CC42848(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  sub_24CC58A00();
  sub_24CC42848(v2, v3, v4);
  swift_retain();
  sub_24CC58A00();
  swift_retain();
  return a1;
}

uint64_t sub_24CC57FA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_24CC38DF8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_24CC38DF8(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

void *initializeBufferWithCopyOfBuffer for TipCollectionImage(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_24CC58A00();
  return a1;
}

uint64_t destroy for TipCollectionImage()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for TipCollectionImage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_24CC58A00();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for TipCollectionImage(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipCollectionImage(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipCollectionImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for TipCollectionImage()
{
  return &type metadata for TipCollectionImage;
}

unint64_t sub_24CC5819C()
{
  unint64_t result = qword_269820A88;
  if (!qword_269820A88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820A80);
    sub_24CC58218();
    sub_24CC4272C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820A88);
  }
  return result;
}

unint64_t sub_24CC58218()
{
  unint64_t result = qword_269820A90;
  if (!qword_269820A90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820A78);
    sub_24CC582B8();
    sub_24CC35E84(&qword_2698203A8, &qword_2698203B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820A90);
  }
  return result;
}

unint64_t sub_24CC582B8()
{
  unint64_t result = qword_269820A98;
  if (!qword_269820A98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820A70);
    sub_24CC58358();
    sub_24CC35E84(&qword_269820AD0, &qword_269820A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820A98);
  }
  return result;
}

unint64_t sub_24CC58358()
{
  unint64_t result = qword_269820AA0;
  if (!qword_269820AA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820AA8);
    sub_24CC583D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820AA0);
  }
  return result;
}

unint64_t sub_24CC583D4()
{
  unint64_t result = qword_269820AB0;
  if (!qword_269820AB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820AB8);
    sub_24CC35E84(&qword_269820AC0, &qword_269820AC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820AB0);
  }
  return result;
}

uint64_t sub_24CC58474()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_24CC58490(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_24CC584A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269820AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CC58514()
{
  unint64_t result = qword_269820AE0;
  if (!qword_269820AE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269820AD8);
    sub_24CC35E84(&qword_269820AE8, &qword_269820AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269820AE0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_24CC585D4()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269820AF8 = (uint64_t)result;
  return result;
}

uint64_t sub_24CC5862C()
{
  uint64_t v0 = sub_24CC58FC0();
  __swift_allocate_value_buffer(v0, qword_269821A50);
  __swift_project_value_buffer(v0, (uint64_t)qword_269821A50);
  if (qword_269820008 != -1) {
    swift_once();
  }
  id v1 = (id)qword_269820AF8;
  return sub_24CC58FB0();
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

uint64_t sub_24CC58740()
{
  return MEMORY[0x270F25B58]();
}

uint64_t sub_24CC58750()
{
  return MEMORY[0x270F25B60]();
}

uint64_t sub_24CC58760()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_24CC58770()
{
  return MEMORY[0x270EEECD8]();
}

uint64_t sub_24CC58780()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_24CC58790()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_24CC587A0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24CC587B0()
{
  return MEMORY[0x270EEEE28]();
}

uint64_t sub_24CC587C0()
{
  return MEMORY[0x270EEEE50]();
}

uint64_t sub_24CC587D0()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_24CC587E0()
{
  return MEMORY[0x270EEF1B8]();
}

uint64_t sub_24CC587F0()
{
  return MEMORY[0x270F25B68]();
}

uint64_t sub_24CC58800()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24CC58810()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24CC58820()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24CC58830()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CC58840()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CC58850()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CC58860()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CC58870()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_24CC58880()
{
  return MEMORY[0x270EF0FF8]();
}

uint64_t sub_24CC58890()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_24CC588A0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24CC588B0()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_24CC588C0()
{
  return MEMORY[0x270F741F0]();
}

uint64_t sub_24CC588D0()
{
  return MEMORY[0x270F75640]();
}

uint64_t sub_24CC588E0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_24CC58900()
{
  return MEMORY[0x270F0C8D8]();
}

uint64_t sub_24CC58910()
{
  return MEMORY[0x270F0C8E0]();
}

uint64_t sub_24CC58920()
{
  return MEMORY[0x270F0C8E8]();
}

uint64_t sub_24CC58930()
{
  return MEMORY[0x270F0C900]();
}

uint64_t sub_24CC58950()
{
  return MEMORY[0x270F0C9B8]();
}

uint64_t sub_24CC58960()
{
  return MEMORY[0x270F0C9C0]();
}

uint64_t sub_24CC58970()
{
  return MEMORY[0x270F0C9F8]();
}

uint64_t sub_24CC58980()
{
  return MEMORY[0x270F0CA08]();
}

uint64_t sub_24CC58990()
{
  return MEMORY[0x270F0CA10]();
}

uint64_t sub_24CC589A0()
{
  return MEMORY[0x270F0CA40]();
}

uint64_t sub_24CC589B0()
{
  return MEMORY[0x270F0CA50]();
}

uint64_t sub_24CC589C0()
{
  return MEMORY[0x270F0CA58]();
}

uint64_t sub_24CC589D0()
{
  return MEMORY[0x270F0CA70]();
}

uint64_t sub_24CC589E0()
{
  return MEMORY[0x270F0CAA8]();
}

uint64_t sub_24CC589F0()
{
  return MEMORY[0x270F0CAB8]();
}

uint64_t sub_24CC58A00()
{
  return MEMORY[0x270F0CB78]();
}

uint64_t sub_24CC58A10()
{
  return MEMORY[0x270F25B70]();
}

uint64_t sub_24CC58A20()
{
  return MEMORY[0x270F25B78]();
}

uint64_t sub_24CC58A30()
{
  return MEMORY[0x270F25B80]();
}

uint64_t sub_24CC58A40()
{
  return MEMORY[0x270F25B88]();
}

uint64_t sub_24CC58A50()
{
  return MEMORY[0x270F25B90]();
}

uint64_t sub_24CC58A60()
{
  return MEMORY[0x270F25B98]();
}

uint64_t sub_24CC58A80()
{
  return MEMORY[0x270F25BA8]();
}

uint64_t sub_24CC58A90()
{
  return MEMORY[0x270F25BB0]();
}

uint64_t sub_24CC58AA0()
{
  return MEMORY[0x270F25BB8]();
}

uint64_t sub_24CC58AB0()
{
  return MEMORY[0x270F25BC0]();
}

uint64_t sub_24CC58AC0()
{
  return MEMORY[0x270F25BC8]();
}

uint64_t sub_24CC58AD0()
{
  return MEMORY[0x270F25BD0]();
}

uint64_t sub_24CC58AE0()
{
  return MEMORY[0x270F25BD8]();
}

uint64_t sub_24CC58AF0()
{
  return MEMORY[0x270F25BE0]();
}

uint64_t sub_24CC58B00()
{
  return MEMORY[0x270F25BE8]();
}

uint64_t sub_24CC58B10()
{
  return MEMORY[0x270F25BF0]();
}

uint64_t sub_24CC58B20()
{
  return MEMORY[0x270F25BF8]();
}

uint64_t sub_24CC58B30()
{
  return MEMORY[0x270F25C00]();
}

uint64_t sub_24CC58B40()
{
  return MEMORY[0x270F25C08]();
}

uint64_t sub_24CC58B50()
{
  return MEMORY[0x270F25C10]();
}

uint64_t sub_24CC58B60()
{
  return MEMORY[0x270F25C18]();
}

uint64_t sub_24CC58B70()
{
  return MEMORY[0x270F25C20]();
}

uint64_t sub_24CC58B80()
{
  return MEMORY[0x270F25C28]();
}

uint64_t sub_24CC58B90()
{
  return MEMORY[0x270F25C30]();
}

uint64_t sub_24CC58BA0()
{
  return MEMORY[0x270F25C38]();
}

uint64_t sub_24CC58BB0()
{
  return MEMORY[0x270F25C40]();
}

uint64_t sub_24CC58BC0()
{
  return MEMORY[0x270F25C48]();
}

uint64_t sub_24CC58BD0()
{
  return MEMORY[0x270F25C50]();
}

uint64_t sub_24CC58BE0()
{
  return MEMORY[0x270F25C58]();
}

uint64_t sub_24CC58BF0()
{
  return MEMORY[0x270F25C60]();
}

uint64_t sub_24CC58C00()
{
  return MEMORY[0x270F25C68]();
}

uint64_t sub_24CC58C10()
{
  return MEMORY[0x270F25C70]();
}

uint64_t sub_24CC58C20()
{
  return MEMORY[0x270F25C78]();
}

uint64_t sub_24CC58C30()
{
  return MEMORY[0x270F25C80]();
}

uint64_t sub_24CC58C40()
{
  return MEMORY[0x270F25C88]();
}

uint64_t sub_24CC58C50()
{
  return MEMORY[0x270F25C90]();
}

uint64_t sub_24CC58C60()
{
  return MEMORY[0x270F25C98]();
}

uint64_t sub_24CC58C70()
{
  return MEMORY[0x270F25CA0]();
}

uint64_t sub_24CC58C80()
{
  return MEMORY[0x270F25CA8]();
}

uint64_t sub_24CC58C90()
{
  return MEMORY[0x270F25CB0]();
}

uint64_t sub_24CC58CA0()
{
  return MEMORY[0x270F25CB8]();
}

uint64_t sub_24CC58CB0()
{
  return MEMORY[0x270F25CC0]();
}

uint64_t sub_24CC58CC0()
{
  return MEMORY[0x270F25CC8]();
}

uint64_t sub_24CC58CD0()
{
  return MEMORY[0x270F25CD0]();
}

uint64_t sub_24CC58CE0()
{
  return MEMORY[0x270F25CD8]();
}

uint64_t sub_24CC58CF0()
{
  return MEMORY[0x270F25CE0]();
}

uint64_t sub_24CC58D00()
{
  return MEMORY[0x270F25CE8]();
}

uint64_t sub_24CC58D10()
{
  return MEMORY[0x270F25CF0]();
}

uint64_t sub_24CC58D20()
{
  return MEMORY[0x270F25CF8]();
}

uint64_t sub_24CC58D30()
{
  return MEMORY[0x270F25D00]();
}

uint64_t sub_24CC58D40()
{
  return MEMORY[0x270F25D08]();
}

uint64_t sub_24CC58D50()
{
  return MEMORY[0x270F25D10]();
}

uint64_t sub_24CC58D60()
{
  return MEMORY[0x270F25D18]();
}

uint64_t sub_24CC58D70()
{
  return MEMORY[0x270F25D20]();
}

uint64_t sub_24CC58D80()
{
  return MEMORY[0x270F25D28]();
}

uint64_t sub_24CC58D90()
{
  return MEMORY[0x270F25D30]();
}

uint64_t sub_24CC58DA0()
{
  return MEMORY[0x270F25D38]();
}

uint64_t sub_24CC58DB0()
{
  return MEMORY[0x270F25D40]();
}

uint64_t sub_24CC58DC0()
{
  return MEMORY[0x270F25D48]();
}

uint64_t sub_24CC58DD0()
{
  return MEMORY[0x270F25D50]();
}

uint64_t sub_24CC58DE0()
{
  return MEMORY[0x270F25D58]();
}

uint64_t sub_24CC58DF0()
{
  return MEMORY[0x270F25D60]();
}

uint64_t sub_24CC58E00()
{
  return MEMORY[0x270F25D68]();
}

uint64_t sub_24CC58E10()
{
  return MEMORY[0x270F25D70]();
}

uint64_t sub_24CC58E20()
{
  return MEMORY[0x270F25D78]();
}

uint64_t sub_24CC58E30()
{
  return MEMORY[0x270F25D80]();
}

uint64_t sub_24CC58E40()
{
  return MEMORY[0x270F25D88]();
}

uint64_t sub_24CC58E50()
{
  return MEMORY[0x270F25D90]();
}

uint64_t sub_24CC58E60()
{
  return MEMORY[0x270F25D98]();
}

uint64_t sub_24CC58E70()
{
  return MEMORY[0x270F25DA0]();
}

uint64_t sub_24CC58E80()
{
  return MEMORY[0x270F25DA8]();
}

uint64_t sub_24CC58E90()
{
  return MEMORY[0x270F25DB0]();
}

uint64_t sub_24CC58EA0()
{
  return MEMORY[0x270F25DB8]();
}

uint64_t sub_24CC58EB0()
{
  return MEMORY[0x270F25DC0]();
}

uint64_t sub_24CC58EC0()
{
  return MEMORY[0x270F25DC8]();
}

uint64_t sub_24CC58ED0()
{
  return MEMORY[0x270F25DD0]();
}

uint64_t sub_24CC58EE0()
{
  return MEMORY[0x270F25DD8]();
}

uint64_t sub_24CC58EF0()
{
  return MEMORY[0x270F25DE0]();
}

uint64_t sub_24CC58F00()
{
  return MEMORY[0x270F25DE8]();
}

uint64_t sub_24CC58F10()
{
  return MEMORY[0x270F25DF0]();
}

uint64_t sub_24CC58F20()
{
  return MEMORY[0x270F25DF8]();
}

uint64_t sub_24CC58F30()
{
  return MEMORY[0x270F25E00]();
}

uint64_t sub_24CC58F40()
{
  return MEMORY[0x270F25E08]();
}

uint64_t sub_24CC58F50()
{
  return MEMORY[0x270F25E10]();
}

uint64_t sub_24CC58F60()
{
  return MEMORY[0x270F25E18]();
}

uint64_t sub_24CC58F70()
{
  return MEMORY[0x270F25E20]();
}

uint64_t sub_24CC58F80()
{
  return MEMORY[0x270F25E28]();
}

uint64_t sub_24CC58F90()
{
  return MEMORY[0x270F25E30]();
}

uint64_t sub_24CC58FA0()
{
  return MEMORY[0x270F25E38]();
}

uint64_t sub_24CC58FB0()
{
  return MEMORY[0x270EEB1B0]();
}

uint64_t sub_24CC58FC0()
{
  return MEMORY[0x270EEB1C0]();
}

uint64_t sub_24CC58FD0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_24CC58FE0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24CC58FF0()
{
  return MEMORY[0x270F25E40]();
}

uint64_t sub_24CC59000()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CC59010()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CC59020()
{
  return MEMORY[0x270F7EB10]();
}

uint64_t sub_24CC59030()
{
  return MEMORY[0x270F7EB18]();
}

uint64_t sub_24CC59040()
{
  return MEMORY[0x270F7EB20]();
}

uint64_t sub_24CC59050()
{
  return MEMORY[0x270F7EB28]();
}

uint64_t sub_24CC59060()
{
  return MEMORY[0x270F7EB30]();
}

uint64_t sub_24CC59070()
{
  return MEMORY[0x270F7EB38]();
}

uint64_t sub_24CC59080()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24CC59090()
{
  return MEMORY[0x270EFEDE0]();
}

uint64_t sub_24CC590A0()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_24CC590B0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24CC590C0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24CC590D0()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_24CC590E0()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_24CC590F0()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_24CC59100()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24CC59110()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24CC59120()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24CC59130()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24CC59140()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24CC59150()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_24CC59160()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_24CC59180()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_24CC59190()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24CC591A0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24CC591B0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24CC591C0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_24CC591D0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_24CC591E0()
{
  return MEMORY[0x270F75908]();
}

uint64_t sub_24CC591F0()
{
  return MEMORY[0x270F75910]();
}

uint64_t sub_24CC59200()
{
  return MEMORY[0x270F00898]();
}

uint64_t sub_24CC59210()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_24CC59220()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_24CC59230()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_24CC59240()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24CC59250()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24CC59260()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24CC59270()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24CC59280()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24CC59290()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24CC592A0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24CC592B0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24CC592C0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_24CC592D0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_24CC592E0()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_24CC592F0()
{
  return MEMORY[0x270F01040]();
}

uint64_t sub_24CC59300()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_24CC59310()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24CC59320()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24CC59330()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_24CC59340()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_24CC59350()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24CC59360()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24CC59370()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24CC59380()
{
  return MEMORY[0x270F75928]();
}

uint64_t sub_24CC59390()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24CC593A0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24CC593B0()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_24CC593C0()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_24CC593D0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24CC593E0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24CC593F0()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24CC59400()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24CC59410()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24CC59420()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24CC59430()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24CC59440()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_24CC59450()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24CC59460()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_24CC59470()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24CC59480()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24CC59490()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_24CC594A0()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24CC594B0()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24CC594C0()
{
  return MEMORY[0x270F75938]();
}

uint64_t sub_24CC594D0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_24CC594E0()
{
  return MEMORY[0x270F02F50]();
}

uint64_t sub_24CC594F0()
{
  return MEMORY[0x270F02F60]();
}

uint64_t sub_24CC59500()
{
  return MEMORY[0x270F02F68]();
}

uint64_t sub_24CC59510()
{
  return MEMORY[0x270F02F70]();
}

uint64_t sub_24CC59520()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_24CC59530()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24CC59540()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_24CC59550()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24CC59560()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_24CC59570()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_24CC59580()
{
  return MEMORY[0x270F75978]();
}

uint64_t sub_24CC59590()
{
  return MEMORY[0x270F75988]();
}

uint64_t sub_24CC595A0()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_24CC595B0()
{
  return MEMORY[0x270F759A0]();
}

uint64_t sub_24CC595C0()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_24CC595D0()
{
  return MEMORY[0x270F75A00]();
}

uint64_t sub_24CC595E0()
{
  return MEMORY[0x270F75A18]();
}

uint64_t sub_24CC595F0()
{
  return MEMORY[0x270F75A20]();
}

uint64_t sub_24CC59600()
{
  return MEMORY[0x270F75AA0]();
}

uint64_t sub_24CC59610()
{
  return MEMORY[0x270F75AB8]();
}

uint64_t sub_24CC59620()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24CC59630()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24CC59640()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24CC59650()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_24CC59660()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24CC59670()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_24CC59680()
{
  return MEMORY[0x270F03B98]();
}

uint64_t sub_24CC59690()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_24CC596A0()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_24CC596B0()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_24CC596C0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24CC596D0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24CC596E0()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_24CC596F0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24CC59700()
{
  return MEMORY[0x270F04598]();
}

uint64_t sub_24CC59710()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24CC59720()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24CC59730()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24CC59740()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24CC59750()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24CC59760()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24CC59770()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24CC59780()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_24CC59790()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24CC597A0()
{
  return MEMORY[0x270F75B00]();
}

uint64_t sub_24CC597B0()
{
  return MEMORY[0x270F75B10]();
}

uint64_t sub_24CC597C0()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_24CC597D0()
{
  return MEMORY[0x270F75B28]();
}

uint64_t sub_24CC597E0()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_24CC597F0()
{
  return MEMORY[0x270F75BF8]();
}

uint64_t sub_24CC59800()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_24CC59810()
{
  return MEMORY[0x270F75CD0]();
}

uint64_t sub_24CC59820()
{
  return MEMORY[0x270F75CE0]();
}

uint64_t sub_24CC59830()
{
  return MEMORY[0x270F75DA0]();
}

uint64_t sub_24CC59840()
{
  return MEMORY[0x270F75DA8]();
}

uint64_t sub_24CC59850()
{
  return MEMORY[0x270F75EE0]();
}

uint64_t sub_24CC59860()
{
  return MEMORY[0x270F75FC8]();
}

uint64_t sub_24CC59870()
{
  return MEMORY[0x270F75FE0]();
}

uint64_t sub_24CC59880()
{
  return MEMORY[0x270F76108]();
}

uint64_t sub_24CC59890()
{
  return MEMORY[0x270F76248]();
}

uint64_t sub_24CC598A0()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_24CC598B0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24CC598C0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24CC598D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24CC598E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CC598F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CC59900()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CC59910()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CC59920()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CC59930()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24CC59940()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CC59950()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CC59960()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CC59970()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24CC59980()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_24CC59990()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24CC599A0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24CC599B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24CC599C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CC599D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24CC599E0()
{
  return MEMORY[0x270F7EB40]();
}

uint64_t sub_24CC599F0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24CC59A00()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CC59A10()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CC59A20()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_24CC59A30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CC59A40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CC59A50()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_24CC59A60()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CC59A70()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CC59A80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CC59A90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CC59AA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CC59AB0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_24CC59AC0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CC59AD0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24CC59AE0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CC59AF0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CC59B00()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CC59B10()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CC59B20()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CC59B30()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CC59B40()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
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