uint64_t sub_244507878(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  unsigned char v12[40];
  long long v13;
  uint64_t v14;

  v3 = *(void *)(a2 + 16);
  v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    v14 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_244514D40(0, v3, 0);
    v7 = a2 + 32;
    v4 = v14;
    do
    {
      sub_24451A0A8(v7, (uint64_t)v12);
      sub_24451A0A8((uint64_t)v12, (uint64_t)&v11);
      __swift_instantiateConcreteTypeFromMangledName(a3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
      swift_dynamicCast();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244514D40(0, *(void *)(v4 + 16) + 1, 1);
        v4 = v14;
      }
      v9 = *(void *)(v4 + 16);
      v8 = *(void *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_244514D40((void *)(v8 > 1), v9 + 1, 1);
        v4 = v14;
      }
      *(void *)(v4 + 16) = v9 + 1;
      sub_244516C78(&v13, v4 + 40 * v9 + 32);
      v7 += 40;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  return v4;
}

void *sub_2445079DC(void (*a1)(uint64_t *__return_ptr, uint64_t *, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    if (!v6) {
      return (void *)v7;
    }
    uint64_t v18 = MEMORY[0x263F8EE78];
    result = sub_244514D70(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      break;
    }
    uint64_t v9 = 0;
    uint64_t v7 = v18;
    while (v6 != v9)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v10 = MEMORY[0x245691320](v9, a3);
      }
      else
      {
        uint64_t v10 = *(void *)(a3 + 8 * v9 + 32);
        swift_retain();
      }
      uint64_t v16 = v10;
      a1(&v17, &v16, &v15);
      if (v4)
      {
        swift_release();
        swift_release();
        return (void *)v7;
      }
      uint64_t v4 = 0;
      swift_release();
      uint64_t v11 = v17;
      uint64_t v18 = v7;
      unint64_t v13 = *(void *)(v7 + 16);
      unint64_t v12 = *(void *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_244514D70((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v7 = v18;
      }
      ++v9;
      *(void *)(v7 + 16) = v13 + 1;
      *(void *)(v7 + 8 * v13 + 32) = v11;
      if (v6 == v9) {
        return (void *)v7;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24453A630();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_244507B7C(void (*a1)(uint64_t *__return_ptr, __int16 *, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_244514D70(0, v5, 0);
    uint64_t v6 = v19;
    for (i = (__int16 *)(a3 + 32); ; i += 8)
    {
      uint64_t v10 = *((void *)i + 1);
      __int16 v16 = *i;
      uint64_t v17 = v10;
      swift_bridgeObjectRetain();
      a1(&v18, &v16, &v15);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      uint64_t v11 = v18;
      uint64_t v19 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_244514D70((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v6 = v19;
      }
      *(void *)(v6 + 16) = v13 + 1;
      *(void *)(v6 + 8 * v13 + 32) = v11;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

void *sub_244507CB4(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_24451A0A8(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x245691280](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24453A590();
    }
    sub_24453A5A0();
    sub_24453A570();
    return (void *)swift_release();
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_244507878((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_268E79F60);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_24451A0A8(v18, (uint64_t)v28);
          sub_244507CB4(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17) {
            goto LABEL_26;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000;
      sub_244515170((uint64_t)a2, (uint64_t)sub_24451511C, 0, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  uint64_t v19 = sub_244507878(v26, *((uint64_t *)&v26 + 1), &qword_268E79F60);
  if (*(void *)(v19 + 16) == 1)
  {
    sub_24451A0A8(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_244516C78(&v26, (uint64_t)v28);
    sub_244507CB4(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_244531808(0, *((void *)a1 + 2) + 1, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_244531808((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

void *sub_2445080BC(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_24451A0A8(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x245691280](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24453A590();
    }
    sub_24453A5A0();
    sub_24453A570();
    return (void *)swift_release();
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_244507878((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_268E79F60);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_24451A0A8(v18, (uint64_t)v28);
          sub_2445080BC(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17) {
            goto LABEL_26;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000;
      sub_244515170((uint64_t)a2, (uint64_t)sub_24451511C, 0, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  uint64_t v19 = sub_244507878(v26, *((uint64_t *)&v26 + 1), &qword_268E79F60);
  if (*(void *)(v19 + 16) == 1)
  {
    sub_24451A0A8(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_244516C78(&v26, (uint64_t)v28);
    sub_2445080BC(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_2445317F4(0, *((void *)a1 + 2) + 1, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_2445317F4((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

void *sub_2445084C4(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_24451A0A8(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x245691280](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24453A590();
    }
    sub_24453A5A0();
    sub_24453A570();
    return (void *)swift_release();
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_244507878((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_268E79F78);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_24451A0A8(v18, (uint64_t)v28);
          sub_2445084C4(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17) {
            goto LABEL_26;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000;
      sub_244515170((uint64_t)a2, (uint64_t)sub_24451511C, 0, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  uint64_t v19 = sub_244507878(v26, *((uint64_t *)&v26 + 1), &qword_268E79F78);
  if (*(void *)(v19 + 16) == 1)
  {
    sub_24451A0A8(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_244516C78(&v26, (uint64_t)v28);
    sub_2445084C4(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_244531830(0, *((void *)a1 + 2) + 1, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_244531830((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

void *sub_2445088CC(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_24451A0A8(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x245691280](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24453A590();
    }
    sub_24453A5A0();
    sub_24453A570();
    return (void *)swift_release();
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_244507878((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_268E79F78);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_24451A0A8(v18, (uint64_t)v28);
          sub_2445088CC(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17) {
            goto LABEL_26;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000;
      sub_244515170((uint64_t)a2, (uint64_t)sub_24451511C, 0, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  uint64_t v19 = sub_244507878(v26, *((uint64_t *)&v26 + 1), &qword_268E79F78);
  if (*(void *)(v19 + 16) == 1)
  {
    sub_24451A0A8(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_244516C78(&v26, (uint64_t)v28);
    sub_2445088CC(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_24453181C(0, *((void *)a1 + 2) + 1, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_24453181C((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

void *sub_244508CD4(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_24451A0A8(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x245691280](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24453A590();
    }
    sub_24453A5A0();
    sub_24453A570();
    return (void *)swift_release();
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_244507878((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_268E79F70);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_24451A0A8(v18, (uint64_t)v28);
          sub_244508CD4(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17) {
            goto LABEL_26;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000;
      sub_244515170((uint64_t)a2, (uint64_t)sub_24451511C, 0, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  uint64_t v19 = sub_244507878(v26, *((uint64_t *)&v26 + 1), &qword_268E79F70);
  if (*(void *)(v19 + 16) == 1)
  {
    sub_24451A0A8(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_244516C78(&v26, (uint64_t)v28);
    sub_244508CD4(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_244531858(0, *((void *)a1 + 2) + 1, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_244531858((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

void *sub_2445090DC(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_24451A0A8(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F58);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x245691280](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24453A590();
    }
    sub_24453A5A0();
    sub_24453A570();
    return (void *)swift_release();
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_244507878((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_268E79F70);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_24451A0A8(v18, (uint64_t)v28);
          sub_2445090DC(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17) {
            goto LABEL_26;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }
  sub_24451A0A8((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000;
      sub_244515170((uint64_t)a2, (uint64_t)sub_24451511C, 0, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  uint64_t v19 = sub_244507878(v26, *((uint64_t *)&v26 + 1), &qword_268E79F70);
  if (*(void *)(v19 + 16) == 1)
  {
    sub_24451A0A8(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_244516C78(&v26, (uint64_t)v28);
    sub_2445090DC(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_244531844(0, *((void *)a1 + 2) + 1, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_244531844((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

uint64_t sub_2445094E4@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_24450A2A4(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_244507CB4, (uint64_t)sub_24451A010, &qword_268E79F60, (void (*)(void *__return_ptr))sub_244509570, (uint64_t)sub_24451A07C, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_24451A07C);
}

uint64_t sub_244509570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  int64_t v5 = a3;
  uint64_t v6 = a2;
  v103 = a4;
  __int16 v101 = a2;
  LODWORD(v8) = a2 >> 8;
  v102 = a3;
  uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  unint64_t v10 = sub_24450ADAC(MEMORY[0x263F8EE78]);
  v99 = v9;
  unint64_t v100 = v10;
  v98 = v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v12 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_2445080BC((char *)&v100, &v99, &v98, v12, v6, (uint64_t)v5);
      if (v4) {
        break;
      }
      v12 += 40;
      if (!--v11)
      {
        unint64_t v10 = swift_bridgeObjectRelease();
        unint64_t v13 = (unint64_t)v98;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  unint64_t v13 = (unint64_t)v9;
LABEL_7:
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_24453A630();
    unint64_t v10 = swift_bridgeObjectRelease();
    if (v80 > 1)
    {
LABEL_9:
      MEMORY[0x270FA5388](v10);
      v83 = (unint64_t *)&v101;
      int64_t v5 = sub_2445079DC((void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))sub_24451A010, (uint64_t)v82, v13);
      swift_bridgeObjectRelease();
      if (v4)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      *(void *)&long long v92 = v5;
      unint64_t v26 = v100;
      if (!*(void *)(v100 + 16))
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_24453AD50;
      unint64_t v27 = sub_2445388B0(SHIBYTE(v101));
      *(void *)(v6 + 56) = MEMORY[0x263F8D310];
      *(void *)(v6 + 64) = &off_26F92F298;
      *(void *)(v6 + 32) = v27;
      *(void *)(v6 + 40) = v28;
      *(void *)(v6 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
      *(void *)(v6 + 104) = &off_26F92F340;
      *(void *)(v6 + 72) = v26;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_22:
        unint64_t v31 = v5[2];
        unint64_t v30 = v5[3];
        if (v31 >= v30 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_2445317E0((void *)(v30 > 1), v31 + 1, 1, v5);
          int64_t v5 = (void *)isUniquelyReferenced_nonNull_native;
        }
        v5[2] = v31 + 1;
        v5[v31 + 4] = v6;
        *(void *)&long long v92 = v5;
LABEL_36:
        v43 = v99;
        LOWORD(v95) = v101;
        v96 = v102;
        MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
        v83 = &v95;
        uint64_t v44 = sub_244507B7C((void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_244519FE4, (uint64_t)v82, (uint64_t)v43);
        if (!v4)
        {
          v45 = (void *)v44;
          swift_bridgeObjectRelease();
          v46 = v45;
LABEL_43:
          sub_24450B4C8(v46);
          uint64_t v49 = v92;
          uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE0);
          v50 = v103;
          v103[3] = result;
          v50[4] = &off_26F92F348;
          void *v50 = v49;
          return result;
        }
LABEL_40:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
LABEL_93:
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_2445317E0(0, v5[2] + 1, 1, v5);
      int64_t v5 = (void *)isUniquelyReferenced_nonNull_native;
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_24453A630();
    swift_bridgeObjectRelease();
    if (v81 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
    if (!sub_24453A630())
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
      goto LABEL_90;
    }
  }
  else
  {
    unint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14 > 1) {
      goto LABEL_9;
    }
    if (v14 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
  }
  LODWORD(v90) = v8;
  if ((v13 & 0xC000000000000001) != 0)
  {
LABEL_90:
    uint64_t v16 = MEMORY[0x245691320](0, v13);
    goto LABEL_16;
  }
  if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t v16 = *(void *)(v13 + 32);
  swift_retain();
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F10);
  uint64_t inited = swift_initStackObject();
  long long v89 = xmmword_24453AD40;
  *(_OWORD *)(inited + 16) = xmmword_24453AD40;
  *(void *)(inited + 32) = sub_2445388B0(*(unsigned char *)(v16 + 16));
  *(void *)(inited + 40) = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F18);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = v89;
  *(void *)(v19 + 32) = sub_2445388B0(*(unsigned char *)(v16 + 17));
  *(void *)(v19 + 40) = v20;
  *(void *)(v19 + 48) = *(void *)(v16 + 24);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_24450B3B0(v19, &qword_268E79F50);
  unint64_t v21 = sub_24450B3B0(inited, &qword_268E79F48);
  v97[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F20);
  v97[2] = &off_26F92F340;
  unint64_t v95 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  swift_dynamicCast();
  uint64_t v22 = v92;
  uint64_t v23 = *(void *)(v92 + 16);
  swift_release();
  if (v23 != 1)
  {
    __break(1u);
    goto LABEL_92;
  }
  unint64_t v24 = v100;
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v95 = v24;
  sub_244515170(v22, (uint64_t)sub_24451511C, 0, v25, &v95);
  LODWORD(v8) = v90;
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_34:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  unint64_t v100 = v95;
  swift_bridgeObjectRelease();
LABEL_26:
  v32 = v99;
  unint64_t v33 = *((void *)v99 + 2);
  if (v33 > 1)
  {
    swift_bridgeObjectRelease();
    *(void *)&long long v92 = v9;
    unint64_t v34 = v100;
    if (*(void *)(v100 + 16))
    {
      LODWORD(v90) = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_24453AD50;
      unint64_t v36 = sub_2445388B0(SBYTE1(v6));
      *(void *)(v35 + 56) = MEMORY[0x263F8D310];
      *(void *)(v35 + 64) = &off_26F92F298;
      *(void *)(v35 + 32) = v36;
      *(void *)(v35 + 40) = v37;
      *(void *)(v35 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
      *(void *)(v35 + 104) = &off_26F92F340;
      *(void *)(v35 + 72) = v34;
      v38 = sub_2445317E0(0, 1, 1, MEMORY[0x263F8EE78]);
      v39 = v38;
      unint64_t v8 = v38[2];
      unint64_t v40 = v38[3];
      if (v8 >= v40 >> 1)
      {
        v38 = sub_2445317E0((void *)(v40 > 1), v8 + 1, 1, v38);
        v39 = v38;
      }
      v39[2] = v8 + 1;
      v39[v8 + 4] = v35;
      *(void *)&long long v92 = v39;
      LOBYTE(v8) = v90;
    }
    else
    {
      v38 = (void *)swift_bridgeObjectRelease();
    }
    LOBYTE(v95) = v6;
    BYTE1(v95) = v8;
    v96 = v5;
    MEMORY[0x270FA5388](v38);
    v83 = &v95;
    uint64_t v47 = sub_244507B7C((void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_244519FE4, (uint64_t)v82, (uint64_t)v32);
    if (!v4)
    {
      v48 = (void *)v47;
      swift_bridgeObjectRelease();
      v46 = v48;
      goto LABEL_43;
    }
    goto LABEL_40;
  }
  if (v33 == 1)
  {
    uint64_t v41 = *((void *)v99 + 5);
    uint64_t v42 = *((unsigned __int16 *)v99 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24450B62C(v42, v41, &qword_268E79F60, (void (*)(void *__return_ptr))sub_2445094E4, &v95);
    if (v4) {
      goto LABEL_34;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    unint64_t v13 = (unint64_t)&v92;
    uint64_t v9 = (char *)&v95;
    swift_dynamicCast();
    uint64_t v51 = v92;
    uint64_t v52 = *(void *)(v92 + 16);
    swift_bridgeObjectRelease();
    if (v52 != 1)
    {
LABEL_95:
      __break(1u);
LABEL_96:
      uint64_t result = sub_24453A850();
      __break(1u);
      return result;
    }
    int64_t v90 = 0;
    uint64_t v88 = v51;
    uint64_t v53 = *(void *)(v51 + 64);
    uint64_t v85 = v51 + 64;
    uint64_t v54 = 1 << *(unsigned char *)(v51 + 32);
    uint64_t v55 = -1;
    if (v54 < 64) {
      uint64_t v55 = ~(-1 << v54);
    }
    uint64_t v6 = v55 & v53;
    int64_t v5 = (void *)v100;
    int64_t v86 = (unint64_t)(v54 + 63) >> 6;
    v87 = v93;
    *(void *)&long long v89 = v97;
    int64_t v84 = v86 - 1;
    while (!v6)
    {
      int64_t v62 = v90 + 1;
      if (__OFADD__(v90, 1)) {
        goto LABEL_89;
      }
      if (v62 < v86)
      {
        unint64_t v63 = *(void *)(v85 + 8 * v62);
        if (v63) {
          goto LABEL_56;
        }
        int64_t v64 = v90 + 2;
        ++v90;
        if (v62 + 1 < v86)
        {
          unint64_t v63 = *(void *)(v85 + 8 * v64);
          if (v63)
          {
            ++v62;
            goto LABEL_56;
          }
          int64_t v65 = v62 + 2;
          int64_t v90 = v62 + 1;
          if (v62 + 2 < v86)
          {
            unint64_t v63 = *(void *)(v85 + 8 * v65);
            if (!v63)
            {
              while (1)
              {
                int64_t v62 = v65 + 1;
                if (__OFADD__(v65, 1)) {
                  break;
                }
                if (v62 >= v86)
                {
                  int64_t v90 = v84;
                  goto LABEL_68;
                }
                unint64_t v63 = *(void *)(v85 + 8 * v62);
                ++v65;
                if (v63) {
                  goto LABEL_56;
                }
              }
              __break(1u);
              goto LABEL_95;
            }
            v62 += 2;
LABEL_56:
            uint64_t v6 = (v63 - 1) & v63;
            unint64_t v58 = __clz(__rbit64(v63)) + (v62 << 6);
            int64_t v90 = v62;
LABEL_52:
            uint64_t v59 = *(void *)(v88 + 56);
            v60 = (void *)(*(void *)(v88 + 48) + 16 * v58);
            uint64_t v61 = v60[1];
            *(void *)&long long v92 = *v60;
            *((void *)&v92 + 1) = v61;
            sub_24451A0A8(v59 + 40 * v58, (uint64_t)v87);
            swift_bridgeObjectRetain();
            goto LABEL_69;
          }
        }
      }
LABEL_68:
      uint64_t v6 = 0;
      uint64_t v94 = 0;
      memset(v93, 0, sizeof(v93));
      long long v92 = 0u;
LABEL_69:
      sub_244519F7C((uint64_t)&v92, (uint64_t)&v95);
      uint64_t v66 = (uint64_t)v96;
      if (!v96)
      {
        swift_release();
        goto LABEL_82;
      }
      uint64_t v67 = v95;
      sub_244516C78((long long *)v89, (uint64_t)&v92);
      unint64_t v13 = swift_isUniquelyReferenced_nonNull_native();
      v91 = v5;
      unint64_t v69 = sub_2445158CC(v67, v66);
      uint64_t v70 = v5[2];
      BOOL v71 = (v68 & 1) == 0;
      uint64_t v72 = v70 + v71;
      if (__OFADD__(v70, v71)) {
        goto LABEL_87;
      }
      uint64_t v9 = v68;
      if (v5[3] >= v72)
      {
        if (v13)
        {
          int64_t v5 = v91;
          if (v68) {
            goto LABEL_48;
          }
        }
        else
        {
          sub_244515944();
          int64_t v5 = v91;
          if (v9) {
            goto LABEL_48;
          }
        }
      }
      else
      {
        sub_2445155A4(v72, v13);
        unint64_t v73 = sub_2445158CC(v67, v66);
        if ((v9 & 1) != (v74 & 1)) {
          goto LABEL_96;
        }
        unint64_t v69 = v73;
        int64_t v5 = v91;
        if (v9)
        {
LABEL_48:
          uint64_t v56 = v5[7] + 40 * v69;
          __swift_destroy_boxed_opaque_existential_1(v56);
          sub_244516C78(&v92, v56);
          goto LABEL_49;
        }
      }
      v5[(v69 >> 6) + 8] |= 1 << v69;
      v75 = (uint64_t *)(v5[6] + 16 * v69);
      uint64_t *v75 = v67;
      v75[1] = v66;
      sub_244516C78(&v92, v5[7] + 40 * v69);
      uint64_t v76 = v5[2];
      BOOL v77 = __OFADD__(v76, 1);
      uint64_t v78 = v76 + 1;
      if (v77) {
        goto LABEL_88;
      }
      v5[2] = v78;
      swift_bridgeObjectRetain();
LABEL_49:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    unint64_t v57 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v58 = v57 | (v90 << 6);
    goto LABEL_52;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v5 = (void *)v100;
LABEL_82:
  v79 = v103;
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  v79[3] = result;
  v79[4] = &off_26F92F340;
  void *v79 = v5;
  return result;
}

uint64_t sub_24450A074@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_24450A2A4(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_2445084C4, (uint64_t)sub_24451A010, &qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A100, (uint64_t)sub_24451A190, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_24451A190);
}

uint64_t sub_24450A100@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_24450A2A4(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_2445088CC, (uint64_t)sub_24451A010, &qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A074, (uint64_t)sub_24451A164, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_24451A164);
}

uint64_t sub_24450A18C@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_24450A2A4(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_244508CD4, (uint64_t)sub_24451A010, &qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A218, (uint64_t)sub_24451A138, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_24451A138);
}

uint64_t sub_24450A218@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_24450A2A4(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_2445090DC, (uint64_t)sub_24451A010, &qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A18C, (uint64_t)sub_24451A10C, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_24451A10C);
}

uint64_t sub_24450A2A4@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void (*a4)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, void (*a7)(void *__return_ptr)@<X6>, uint64_t a8@<X7>, void *a9@<X8>, void (*a10)(uint64_t *__return_ptr, __int16 *, uint64_t *))
{
  void (*v16)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  unint64_t v17;
  void (*v18)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void (*v55)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  uint64_t v56;
  void *v57;
  _UNKNOWN **v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  char v79;
  unint64_t v80;
  char v81;
  uint64_t *v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  unsigned char v88[16];
  unint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  long long v92;
  uint64_t *v93;
  void (*v94)(void *__return_ptr);
  long long *v95;
  uint64_t v96;
  void *v97;
  long long v98;
  unsigned char v99[32];
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  void v103[5];
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  __int16 v107;
  unint64_t v108;
  void *v109;

  v96 = a8;
  v93 = a6;
  uint64_t v94 = a7;
  unint64_t v13 = a3;
  unint64_t v14 = a2;
  v109 = a9;
  v107 = (__int16)a2;
  LODWORD(v95) = a2 >> 8;
  v108 = a3;
  uint64_t v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x263F8EE78];
  uint64_t v17 = sub_24450ADAC(MEMORY[0x263F8EE78]);
  v105 = (uint64_t)v16;
  v106 = v17;
  v104 = (unint64_t)v16;
  uint64_t v18 = *(void (**)(uint64_t *__return_ptr, __int16 *, uint64_t *))(a1 + 16);
  if (v18)
  {
    uint64_t v19 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      a4(&v106, &v105, &v104, v19, v14, v13);
      if (v10) {
        break;
      }
      v19 += 40;
      uint64_t v18 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))((char *)v18 - 1);
      if (!v18)
      {
        uint64_t v17 = swift_bridgeObjectRelease();
        uint64_t v20 = v104;
        uint64_t v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x263F8EE78];
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v20 = (unint64_t)v16;
LABEL_7:
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = v16;
    v87 = sub_24453A630();
    uint64_t v17 = swift_bridgeObjectRelease();
    if (v87 > 1)
    {
LABEL_9:
      MEMORY[0x270FA5388](v17);
      long long v89 = (unint64_t *)&v107;
      a5 = (uint64_t)sub_2445079DC((void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))a5, (uint64_t)v88, v20);
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      uint64_t v18 = a10;
      *(void *)&v98 = a5;
      unint64_t v31 = v106;
      if (!*(void *)(v106 + 16))
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
      unint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_24453AD50;
      v32 = sub_2445388B0(SHIBYTE(v107));
      *(void *)(v13 + 56) = MEMORY[0x263F8D310];
      *(void *)(v13 + 64) = &off_26F92F298;
      *(void *)(v13 + 32) = v32;
      *(void *)(v13 + 40) = v33;
      *(void *)(v13 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
      *(void *)(v13 + 104) = &off_26F92F340;
      *(void *)(v13 + 72) = v31;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_22:
        unint64_t v36 = *(void *)(a5 + 16);
        uint64_t v35 = *(void *)(a5 + 24);
        if (v36 >= v35 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_2445317E0((void *)(v35 > 1), v36 + 1, 1, (void *)a5);
          a5 = isUniquelyReferenced_nonNull_native;
        }
        *(void *)(a5 + 16) = v36 + 1;
        *(void *)(a5 + 8 * v36 + 32) = v13;
        *(void *)&v98 = a5;
LABEL_36:
        uint64_t v51 = v105;
        LOWORD(v101) = v107;
        v102 = v108;
        MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
        long long v89 = &v101;
        uint64_t v52 = sub_244507B7C(v18, (uint64_t)v88, v51);
        if (!v10)
        {
          uint64_t v53 = (void *)v52;
          swift_bridgeObjectRelease();
          uint64_t v54 = v53;
LABEL_43:
          sub_24450B4C8(v54);
          v50 = (void *)v98;
          uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE0);
          unint64_t v58 = &off_26F92F348;
LABEL_85:
          int64_t v86 = v109;
          v109[3] = result;
          v86[4] = v58;
          *int64_t v86 = v50;
          return result;
        }
LABEL_40:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
LABEL_96:
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_2445317E0(0, *(void *)(a5 + 16) + 1, 1, (void *)a5);
      a5 = isUniquelyReferenced_nonNull_native;
      goto LABEL_22;
    }
    uint64_t v16 = v18;
    swift_bridgeObjectRetain();
    a5 = sub_24453A630();
    swift_bridgeObjectRelease();
    if (a5 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
    if (!sub_24453A630())
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
  }
  else
  {
    unint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21 > 1) {
      goto LABEL_9;
    }
    if (v21 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
  }
  if ((v20 & 0xC000000000000001) != 0)
  {
LABEL_93:
    a5 = MEMORY[0x245691320](0, v20);
    goto LABEL_16;
  }
  if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  a5 = *(void *)(v20 + 32);
  swift_retain();
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F10);
  uint64_t inited = swift_initStackObject();
  long long v92 = xmmword_24453AD40;
  *(_OWORD *)(inited + 16) = xmmword_24453AD40;
  *(void *)(inited + 32) = sub_2445388B0(*(unsigned char *)(a5 + 16));
  *(void *)(inited + 40) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F18);
  char v25 = swift_initStackObject();
  *(_OWORD *)(v25 + 16) = v92;
  *(void *)(v25 + 32) = sub_2445388B0(*(unsigned char *)(a5 + 17));
  *(void *)(v25 + 40) = v26;
  *(void *)(v25 + 48) = *(void *)(a5 + 24);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_24450B3B0(v25, &qword_268E79F50);
  unint64_t v27 = sub_24450B3B0(inited, &qword_268E79F48);
  v103[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F20);
  v103[2] = &off_26F92F340;
  __int16 v101 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  swift_dynamicCast();
  uint64_t v28 = v98;
  uint64_t v18 = *(void (**)(uint64_t *__return_ptr, __int16 *, uint64_t *))(v98 + 16);
  swift_release();
  if (v18 != (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))1)
  {
    __break(1u);
    goto LABEL_95;
  }
  v29 = v106;
  unint64_t v30 = swift_isUniquelyReferenced_nonNull_native();
  __int16 v101 = v29;
  sub_244515170(v28, (uint64_t)sub_24451511C, 0, v30, &v101);
  uint64_t v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x263F8EE78];
  if (v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v106 = v101;
  swift_bridgeObjectRelease();
LABEL_26:
  uint64_t v37 = v105;
  v38 = *(void *)(v105 + 16);
  if (v38 > 1)
  {
    swift_bridgeObjectRelease();
    *(void *)&v98 = v16;
    v39 = v106;
    if (*(void *)(v106 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
      unint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = xmmword_24453AD50;
      uint64_t v41 = sub_2445388B0(SBYTE1(v14));
      *(void *)(v40 + 56) = MEMORY[0x263F8D310];
      *(void *)(v40 + 64) = &off_26F92F298;
      *(void *)(v40 + 32) = v41;
      *(void *)(v40 + 40) = v42;
      *(void *)(v40 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
      *(void *)(v40 + 104) = &off_26F92F340;
      *(void *)(v40 + 72) = v39;
      v43 = sub_2445317E0(0, 1, 1, MEMORY[0x263F8EE78]);
      v45 = v43[2];
      uint64_t v44 = v43[3];
      if (v45 >= v44 >> 1) {
        v43 = sub_2445317E0((void *)(v44 > 1), v45 + 1, 1, v43);
      }
      v46 = v96;
      uint64_t v47 = (char)v95;
      v43[2] = v45 + 1;
      v43[v45 + 4] = v40;
      *(void *)&v98 = v43;
    }
    else
    {
      swift_bridgeObjectRelease();
      v46 = v96;
      uint64_t v47 = (char)v95;
    }
    LOBYTE(v101) = (_BYTE)v14;
    BYTE1(v101) = v47;
    v102 = v13;
    uint64_t v55 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x270FA5388](v46);
    long long v89 = &v101;
    uint64_t v56 = sub_244507B7C(v55, (uint64_t)v88, v37);
    if (!v10)
    {
      unint64_t v57 = (void *)v56;
      swift_bridgeObjectRelease();
      uint64_t v54 = v57;
      goto LABEL_43;
    }
    goto LABEL_40;
  }
  if (v38 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = (void *)v106;
LABEL_84:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    unint64_t v58 = &off_26F92F340;
    goto LABEL_85;
  }
  v48 = *(void *)(v105 + 40);
  uint64_t v49 = *(unsigned __int16 *)(v105 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24450B62C(v49, v48, v93, v94, &v101);
  if (v10)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  unint64_t v14 = &v101;
  swift_dynamicCast();
  uint64_t v59 = v98;
  v60 = *(void *)(v98 + 16);
  swift_bridgeObjectRelease();
  if (v60 == 1)
  {
    uint64_t v94 = (void (*)(void *__return_ptr))v59;
    uint64_t v61 = *(void *)(v59 + 64);
    v91 = v59 + 64;
    int64_t v62 = 1 << *(unsigned char *)(v59 + 32);
    unint64_t v63 = -1;
    if (v62 < 64) {
      unint64_t v63 = ~(-1 << v62);
    }
    unint64_t v13 = v63 & v61;
    v50 = (void *)v106;
    v93 = (uint64_t *)v99;
    unint64_t v95 = (long long *)v103;
    v96 = 0;
    *(void *)&long long v92 = (unint64_t)(v62 + 63) >> 6;
    int64_t v90 = v92 - 1;
    while (!v13)
    {
      uint64_t v70 = v96 + 1;
      if (__OFADD__(v96, 1)) {
        goto LABEL_92;
      }
      if (v70 < (uint64_t)v92)
      {
        BOOL v71 = *(void *)(v91 + 8 * v70);
        if (v71) {
          goto LABEL_56;
        }
        uint64_t v72 = v96 + 2;
        ++v96;
        if (v70 + 1 < (uint64_t)v92)
        {
          BOOL v71 = *(void *)(v91 + 8 * v72);
          if (v71) {
            goto LABEL_59;
          }
          v96 = v70 + 1;
          if (v70 + 2 < (uint64_t)v92)
          {
            BOOL v71 = *(void *)(v91 + 8 * (v70 + 2));
            if (v71)
            {
              v70 += 2;
              goto LABEL_56;
            }
            uint64_t v72 = v70 + 3;
            v96 = v70 + 2;
            if (v70 + 3 < (uint64_t)v92)
            {
              BOOL v71 = *(void *)(v91 + 8 * v72);
              if (!v71)
              {
                while (1)
                {
                  uint64_t v70 = v72 + 1;
                  if (__OFADD__(v72, 1)) {
                    goto LABEL_98;
                  }
                  if (v70 >= (uint64_t)v92)
                  {
                    v96 = v90;
                    goto LABEL_70;
                  }
                  BOOL v71 = *(void *)(v91 + 8 * v70);
                  ++v72;
                  if (v71) {
                    goto LABEL_56;
                  }
                }
              }
LABEL_59:
              uint64_t v70 = v72;
LABEL_56:
              unint64_t v13 = (v71 - 1) & v71;
              uint64_t v66 = __clz(__rbit64(v71)) + (v70 << 6);
              v96 = v70;
LABEL_52:
              uint64_t v67 = *((void *)v94 + 7);
              v68 = (void *)(*((void *)v94 + 6) + 16 * v66);
              unint64_t v69 = v68[1];
              *(void *)&v98 = *v68;
              *((void *)&v98 + 1) = v69;
              sub_24451A0A8(v67 + 40 * v66, (uint64_t)v93);
              swift_bridgeObjectRetain();
              goto LABEL_71;
            }
          }
        }
      }
LABEL_70:
      unint64_t v13 = 0;
      unint64_t v100 = 0;
      memset(v99, 0, sizeof(v99));
      v98 = 0u;
LABEL_71:
      sub_244519F7C((uint64_t)&v98, (uint64_t)&v101);
      unint64_t v73 = v102;
      if (!v102)
      {
        swift_release();
        goto LABEL_84;
      }
      char v74 = v101;
      sub_244516C78(v95, (uint64_t)&v98);
      LOWORD(v14) = swift_isUniquelyReferenced_nonNull_native();
      v97 = v50;
      uint64_t v20 = sub_2445158CC(v74, v73);
      uint64_t v76 = v50[2];
      BOOL v77 = (v75 & 1) == 0;
      uint64_t v78 = v76 + v77;
      if (__OFADD__(v76, v77)) {
        goto LABEL_90;
      }
      v79 = v75;
      if (v50[3] >= v78)
      {
        if (v14)
        {
          v50 = v97;
          if (v75) {
            goto LABEL_48;
          }
        }
        else
        {
          sub_244515944();
          v50 = v97;
          if (v79) {
            goto LABEL_48;
          }
        }
      }
      else
      {
        sub_2445155A4(v78, (char)v14);
        uint64_t v80 = sub_2445158CC(v74, v73);
        if ((v79 & 1) != (v81 & 1)) {
          goto LABEL_99;
        }
        uint64_t v20 = v80;
        v50 = v97;
        if (v79)
        {
LABEL_48:
          int64_t v64 = v50[7] + 40 * v20;
          __swift_destroy_boxed_opaque_existential_1(v64);
          sub_244516C78(&v98, v64);
          goto LABEL_49;
        }
      }
      v50[(v20 >> 6) + 8] |= 1 << v20;
      v82 = (uint64_t *)(v50[6] + 16 * v20);
      *v82 = v74;
      v82[1] = v73;
      sub_244516C78(&v98, v50[7] + 40 * v20);
      v83 = v50[2];
      int64_t v84 = __OFADD__(v83, 1);
      uint64_t v85 = v83 + 1;
      if (v84) {
        goto LABEL_91;
      }
      v50[2] = v85;
      swift_bridgeObjectRetain();
LABEL_49:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    int64_t v65 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    uint64_t v66 = v65 | (v96 << 6);
    goto LABEL_52;
  }
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  uint64_t result = sub_24453A850();
  __break(1u);
  return result;
}

unint64_t sub_24450ADAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF0);
  uint64_t v2 = sub_24453A660();
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
    sub_244519F14(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2445158CC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_244516C78(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_24450AEDC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F80);
  uint64_t v2 = (void *)sub_24453A660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2445158CC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_24450AFF0(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79F88);
}

unint64_t sub_24450AFFC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79FB0);
  uint64_t v2 = (void *)sub_24453A660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_24451A204(v7, v8);
    unint64_t result = sub_2445158CC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (uint64_t *)(v2[7] + 16 * result);
    *BOOL v12 = v7;
    v12[1] = v8;
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

unint64_t sub_24450B124(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79FB8);
}

unint64_t sub_24450B130(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F98);
  uint64_t v2 = (void *)sub_24453A660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2445158CC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_24450B244(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79FA0);
  uint64_t v2 = (void *)sub_24453A660();
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
    unint64_t result = sub_2445158CC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
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

unint64_t sub_24450B368(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79FA8);
}

unint64_t sub_24450B374(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79F50);
}

unint64_t sub_24450B380(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79F48);
}

unint64_t sub_24450B38C(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79FC0);
}

unint64_t sub_24450B398(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79FC8);
}

unint64_t sub_24450B3A4(uint64_t a1)
{
  return sub_24450B3B0(a1, &qword_268E79FD8);
}

unint64_t sub_24450B3B0(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_24453A660();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2445158CC(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

void *sub_24450B4C8(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  unint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  unint64_t result = sub_2445317E0(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F30);
  unint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    unint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_24450B5C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(a1, a2, &qword_268E79F60, (void (*)(void *__return_ptr))sub_2445094E4, a3);
}

uint64_t sub_24450B5F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(a1, a2, &qword_268E79F60, (void (*)(void *__return_ptr))sub_244509570, a3);
}

uint64_t sub_24450B62C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void (*a4)(void *__return_ptr)@<X3>, unint64_t *a5@<X8>)
{
  __int16 v7 = a1;
  sub_244507878(a1, a2, a3);
  a4(v15);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5)
  {
    sub_24451A0A8((uint64_t)v15, (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    if (swift_dynamicCast())
    {
      LOBYTE(v7) = HIBYTE(v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24451A0A8((uint64_t)v15, (uint64_t)v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE0);
      uint64_t result = swift_dynamicCast();
      if ((result & 1) == 0)
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(v7);
    *(void *)(inited + 40) = v12;
    sub_24451A0A8((uint64_t)v15, inited + 48);
    unint64_t v13 = sub_24450ADAC(inited);
    a5[3] = v10;
    a5[4] = (unint64_t)&off_26F92F340;
    *a5 = v13;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  return result;
}

uint64_t sub_24450B7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(a1, a2, &qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A074, a3);
}

uint64_t sub_24450B7E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(a1, a2, &qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A100, a3);
}

uint64_t sub_24450B818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(a1, a2, &qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A18C, a3);
}

uint64_t sub_24450B84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(a1, a2, &qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A218, a3);
}

_OWORD *sub_24450B880@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_244516C90();
  sub_24453A7B0();
  if (v2)
  {
    MEMORY[0x2456918D0](v2);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    sub_24451A25C((uint64_t)&v7, &qword_268E79B90);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_244516CE4();
    sub_24453A7B0();
    long long v10 = v7;
    long long v11 = v8;
    long long v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_244517780();
  }
  else
  {
    long long v10 = v7;
    long long v11 = v8;
    long long v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_2445177D4();
  }
  uint64_t result = (_OWORD *)swift_allocObject();
  *a2 = result;
  long long v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

_OWORD *sub_24450C4A4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_244516C90();
  sub_24453A7B0();
  if (v2)
  {
    MEMORY[0x2456918D0](v2);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    sub_24451A25C((uint64_t)&v7, &qword_268E79B90);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_244516CE4();
    sub_24453A7B0();
    long long v10 = v7;
    long long v11 = v8;
    long long v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_244518D34();
  }
  else
  {
    long long v10 = v7;
    long long v11 = v8;
    long long v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_244518D88();
  }
  uint64_t result = (_OWORD *)swift_allocObject();
  *a2 = result;
  long long v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

_OWORD *sub_24450D0C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_244516C90();
  sub_24453A7B0();
  if (v2)
  {
    MEMORY[0x2456918D0](v2);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    sub_24451A25C((uint64_t)&v7, &qword_268E79B90);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_244516CE4();
    sub_24453A7B0();
    long long v10 = v7;
    long long v11 = v8;
    long long v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_244519918();
  }
  else
  {
    long long v10 = v7;
    long long v11 = v8;
    long long v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_24451996C();
  }
  uint64_t result = (_OWORD *)swift_allocObject();
  *a2 = result;
  long long v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

uint64_t sub_24450DC58(uint64_t a1, uint64_t a2)
{
  int64_t v62 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v49[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v61);
      sub_24451A0A8((uint64_t)v61, (uint64_t)&v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v61, (uint64_t)&v56);
      uint64_t v23 = swift_dynamicCast();
      if (v23)
      {
        unsigned int v24 = sub_24450E26C(v23, v53);
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        uint64_t v59 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v29 = sub_244513DD4();
        char v56 = v26;
        char v57 = v28;
        unint64_t v60 = v29;
        uint64_t v58 = v27;
        unint64_t v30 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_244531974(0, v30[2] + 1, 1, v30);
          int64_t v62 = v30;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          int64_t v62 = sub_244531974((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        unint64_t v33 = v59;
        uint64_t v5 = v60;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
        MEMORY[0x270FA5388](v34);
        unint64_t v36 = (char *)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v61, (uint64_t)v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v51 = 0;
        memset(v50, 0, sizeof(v50));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24451A25C((uint64_t)v50, &qword_268E79FE8);
        sub_244516BC0();
        swift_allocError();
        unsigned char *v48 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      }
      sub_244516C78(v50, (uint64_t)&v56);
      sub_24451A0A8((uint64_t)&v56, (uint64_t)v52);
      v38 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v38 = sub_244531974(0, v38[2] + 1, 1, v38);
        int64_t v62 = v38;
      }
      unint64_t v40 = v38[2];
      unint64_t v39 = v38[3];
      if (v40 >= v39 >> 1) {
        int64_t v62 = sub_244531974((void *)(v39 > 1), v40 + 1, 1, v38);
      }
      uint64_t v41 = v54;
      uint64_t v42 = v55;
      uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v54);
      MEMORY[0x270FA5388](v43);
      v45 = (char *)v49 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v46 + 16))(v45);
      sub_244515E28(v40, (uint64_t)v45, (uint64_t *)&v62, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    unsigned int v14 = sub_24450DC58();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v59 = &type metadata for ProcessConstraintConjunction;
    unint64_t v19 = sub_244513C60();
    char v56 = v16;
    char v57 = v18;
    unint64_t v60 = v19;
    uint64_t v58 = v17;
    uint64_t v20 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531974(0, v20[2] + 1, 1, v20);
      int64_t v62 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      int64_t v62 = sub_244531974((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v59;
    uint64_t v5 = v60;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v62, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_24450E26C(uint64_t a1, uint64_t a2)
{
  unint64_t v60 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v48[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v59);
      sub_24451A0A8((uint64_t)v59, (uint64_t)&v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v59, (uint64_t)&v54);
      if (swift_dynamicCast())
      {
        unsigned int v23 = sub_24450E26C();
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        char v57 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v28 = sub_244513DD4();
        char v54 = v25;
        char v55 = v27;
        unint64_t v58 = v28;
        uint64_t v56 = v26;
        unint64_t v29 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_244531974(0, v29[2] + 1, 1, v29);
          unint64_t v60 = v29;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v60 = sub_244531974((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v57;
        uint64_t v5 = v58;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
        MEMORY[0x270FA5388](v33);
        uint64_t v35 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v59, (uint64_t)v51);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v50 = 0;
        memset(v49, 0, sizeof(v49));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24451A25C((uint64_t)v49, &qword_268E79FE8);
        sub_244516BC0();
        swift_allocError();
        *uint64_t v47 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      }
      sub_244516C78(v49, (uint64_t)&v54);
      sub_24451A0A8((uint64_t)&v54, (uint64_t)v51);
      uint64_t v37 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v37 = sub_244531974(0, v37[2] + 1, 1, v37);
        unint64_t v60 = v37;
      }
      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1) {
        unint64_t v60 = sub_244531974((void *)(v38 > 1), v39 + 1, 1, v37);
      }
      uint64_t v40 = v52;
      uint64_t v41 = v53;
      uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
      MEMORY[0x270FA5388](v42);
      uint64_t v44 = (char *)v48 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v45 + 16))(v44);
      sub_244515E28(v39, (uint64_t)v44, (uint64_t *)&v60, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    unsigned int v14 = sub_24450DC58();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    char v57 = &type metadata for ProcessConstraintConjunction;
    unint64_t v19 = sub_244513C60();
    char v54 = v16;
    char v55 = v18;
    unint64_t v58 = v19;
    uint64_t v56 = v17;
    uint64_t v20 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531974(0, v20[2] + 1, 1, v20);
      unint64_t v60 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v60 = sub_244531974((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v57;
    uint64_t v5 = v58;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v60, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_24450E880(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v65);
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if (v23)
      {
        unsigned int v24 = sub_24450EFA0(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v29 = sub_244513DD4();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_244531974(0, v30[2] + 1, 1, v30);
          uint64_t v66 = v30;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_244531974((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x270FA5388](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if (swift_dynamicCast())
      {
        sub_244516C78(v55, (uint64_t)&v62);
        sub_24451A0A8((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_244531974(0, v38[2] + 1, 1, v38);
          uint64_t v66 = v38;
        }
        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_244531974((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x270FA5388](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_244515E28(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        uint64_t v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_24451A25C((uint64_t)v55, &qword_268E79FE8);
        sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if (v60)
        {
          __break(1u);
          return result;
        }
        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        uint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v49 = sub_244531974(0, v49[2] + 1, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          uint64_t v49 = sub_244531974((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v64 = sub_2445176F4();
        uint64_t v52 = swift_allocObject();
        *(void *)&long long v62 = v52;
        *(unsigned char *)(v52 + 16) = 2;
        *(unsigned char *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(unsigned char *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0;
        long long v49[2] = v51 + 1;
        sub_244516C78(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    unsigned int v14 = sub_24450E880();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    unint64_t v63 = &type metadata for ProcessConstraintConjunction;
    unint64_t v19 = sub_244513C60();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    unint64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531974(0, v20[2] + 1, 1, v20);
      uint64_t v66 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_244531974((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v63;
    uint64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_24450EFA0(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v63);
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      if (swift_dynamicCast())
      {
        unsigned int v23 = sub_24450EFA0();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v28 = sub_244513DD4();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_244531974(0, v29[2] + 1, 1, v29);
          unint64_t v64 = v29;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_244531974((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x270FA5388](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if (swift_dynamicCast())
      {
        sub_244516C78(v54, (uint64_t)&v60);
        sub_24451A0A8((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_244531974(0, v37[2] + 1, 1, v37);
          unint64_t v64 = v37;
        }
        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_244531974((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x270FA5388](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_244515E28(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        uint64_t v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_24451A25C((uint64_t)v54, &qword_268E79FE8);
        sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if (v58)
        {
          __break(1u);
          return result;
        }
        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_244531974(0, v48[2] + 1, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_244531974((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v62 = sub_2445176F4();
        uint64_t v51 = swift_allocObject();
        *(void *)&long long v60 = v51;
        *(unsigned char *)(v51 + 16) = 2;
        *(unsigned char *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(unsigned char *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0;
        void v48[2] = v50 + 1;
        sub_244516C78(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    unsigned int v14 = sub_24450E880();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v61 = &type metadata for ProcessConstraintConjunction;
    unint64_t v19 = sub_244513C60();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    unint64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531974(0, v20[2] + 1, 1, v20);
      unint64_t v64 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v64 = sub_244531974((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v61;
    uint64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_24450F6C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2445237A4(*a1, *a2);
}

uint64_t sub_24450F6D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_24450F710@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_24450F740()
{
  return 0;
}

void sub_24450F74C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24450F758(uint64_t a1)
{
  unint64_t v2 = sub_244514CCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24450F794(uint64_t a1)
{
  unint64_t v2 = sub_244514CCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24450F7D0@<X0>(unint64_t *a1@<X8>)
{
  return sub_244513B74(&qword_268E79F60, (void (*)(void *__return_ptr))sub_244509570, a1);
}

uint64_t sub_24450F804@<X0>(uint64_t a1@<X8>)
{
  return sub_244513BC0((uint64_t (*)(void))sub_244516660, a1);
}

uint64_t sub_24450F830(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2445114F4(a1, a2, a3, &qword_268E79B60, (void (*)(void))sub_244514CCC);
}

uint64_t sub_24450F86C(uint64_t a1, uint64_t a2)
{
  unint64_t v62 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v49[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v61);
      sub_24451A0A8((uint64_t)v61, (uint64_t)&v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v61, (uint64_t)&v56);
      uint64_t v23 = swift_dynamicCast();
      if (v23)
      {
        unsigned int v24 = sub_24450FE80(v23, v53);
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        uint64_t v59 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v29 = sub_244513E50();
        char v56 = v26;
        char v57 = v28;
        unint64_t v60 = v29;
        uint64_t v58 = v27;
        unint64_t v30 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_244531A80(0, v30[2] + 1, 1, v30);
          unint64_t v62 = v30;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          unint64_t v62 = sub_244531A80((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v59;
        uint64_t v5 = v60;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
        MEMORY[0x270FA5388](v34);
        uint64_t v36 = (char *)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v61, (uint64_t)v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v51 = 0;
        memset(v50, 0, sizeof(v50));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24451A25C((uint64_t)v50, &qword_268E79FE0);
        sub_244516BC0();
        swift_allocError();
        unsigned char *v48 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      }
      sub_244516C78(v50, (uint64_t)&v56);
      sub_24451A0A8((uint64_t)&v56, (uint64_t)v52);
      unint64_t v38 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        unint64_t v38 = sub_244531A80(0, v38[2] + 1, 1, v38);
        unint64_t v62 = v38;
      }
      unint64_t v40 = v38[2];
      unint64_t v39 = v38[3];
      if (v40 >= v39 >> 1) {
        unint64_t v62 = sub_244531A80((void *)(v39 > 1), v40 + 1, 1, v38);
      }
      uint64_t v41 = v54;
      uint64_t v42 = v55;
      uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v54);
      MEMORY[0x270FA5388](v43);
      uint64_t v45 = (char *)v49 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v46 + 16))(v45);
      sub_244515E28(v40, (uint64_t)v45, (uint64_t *)&v62, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    unsigned int v14 = sub_24450F86C();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v59 = &type metadata for LaunchConstraintConjunction;
    unint64_t v19 = sub_244513CDC();
    char v56 = v16;
    char v57 = v18;
    unint64_t v60 = v19;
    uint64_t v58 = v17;
    uint64_t v20 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A80(0, v20[2] + 1, 1, v20);
      unint64_t v62 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v62 = sub_244531A80((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v59;
    uint64_t v5 = v60;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v62, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_24450FE80(uint64_t a1, uint64_t a2)
{
  unint64_t v60 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v48[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v59);
      sub_24451A0A8((uint64_t)v59, (uint64_t)&v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v59, (uint64_t)&v54);
      if (swift_dynamicCast())
      {
        unsigned int v23 = sub_24450FE80();
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        char v57 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v28 = sub_244513E50();
        char v54 = v25;
        char v55 = v27;
        unint64_t v58 = v28;
        uint64_t v56 = v26;
        unint64_t v29 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_244531A80(0, v29[2] + 1, 1, v29);
          unint64_t v60 = v29;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v60 = sub_244531A80((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v57;
        uint64_t v5 = v58;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
        MEMORY[0x270FA5388](v33);
        uint64_t v35 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v59, (uint64_t)v51);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v50 = 0;
        memset(v49, 0, sizeof(v49));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24451A25C((uint64_t)v49, &qword_268E79FE0);
        sub_244516BC0();
        swift_allocError();
        *uint64_t v47 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      }
      sub_244516C78(v49, (uint64_t)&v54);
      sub_24451A0A8((uint64_t)&v54, (uint64_t)v51);
      uint64_t v37 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v37 = sub_244531A80(0, v37[2] + 1, 1, v37);
        unint64_t v60 = v37;
      }
      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1) {
        unint64_t v60 = sub_244531A80((void *)(v38 > 1), v39 + 1, 1, v37);
      }
      uint64_t v40 = v52;
      uint64_t v41 = v53;
      uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
      MEMORY[0x270FA5388](v42);
      uint64_t v44 = (char *)v48 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v45 + 16))(v44);
      sub_244515E28(v39, (uint64_t)v44, (uint64_t *)&v60, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    unsigned int v14 = sub_24450F86C();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    char v57 = &type metadata for LaunchConstraintConjunction;
    unint64_t v19 = sub_244513CDC();
    char v54 = v16;
    char v55 = v18;
    unint64_t v58 = v19;
    uint64_t v56 = v17;
    uint64_t v20 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A80(0, v20[2] + 1, 1, v20);
      unint64_t v60 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v60 = sub_244531A80((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v57;
    uint64_t v5 = v58;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v60, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_244510494(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v65);
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if (v23)
      {
        unsigned int v24 = sub_244510BB4(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v29 = sub_244513E50();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_244531A80(0, v30[2] + 1, 1, v30);
          uint64_t v66 = v30;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_244531A80((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x270FA5388](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if (swift_dynamicCast())
      {
        sub_244516C78(v55, (uint64_t)&v62);
        sub_24451A0A8((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_244531A80(0, v38[2] + 1, 1, v38);
          uint64_t v66 = v38;
        }
        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_244531A80((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x270FA5388](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_244515E28(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        uint64_t v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_24451A25C((uint64_t)v55, &qword_268E79FE0);
        sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if (v60)
        {
          __break(1u);
          return result;
        }
        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        unint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_244531A80(0, v49[2] + 1, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          unint64_t v49 = sub_244531A80((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v64 = sub_244518CE0();
        uint64_t v52 = swift_allocObject();
        *(void *)&long long v62 = v52;
        *(unsigned char *)(v52 + 16) = 2;
        *(unsigned char *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(unsigned char *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0;
        long long v49[2] = v51 + 1;
        sub_244516C78(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    unsigned int v14 = sub_244510494();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    unint64_t v63 = &type metadata for LaunchConstraintConjunction;
    unint64_t v19 = sub_244513CDC();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    unint64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A80(0, v20[2] + 1, 1, v20);
      uint64_t v66 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_244531A80((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v63;
    uint64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_244510BB4(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v63);
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      if (swift_dynamicCast())
      {
        unsigned int v23 = sub_244510BB4();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v28 = sub_244513E50();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_244531A80(0, v29[2] + 1, 1, v29);
          unint64_t v64 = v29;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_244531A80((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x270FA5388](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if (swift_dynamicCast())
      {
        sub_244516C78(v54, (uint64_t)&v60);
        sub_24451A0A8((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_244531A80(0, v37[2] + 1, 1, v37);
          unint64_t v64 = v37;
        }
        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_244531A80((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x270FA5388](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_244515E28(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        uint64_t v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_24451A25C((uint64_t)v54, &qword_268E79FE0);
        sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if (v58)
        {
          __break(1u);
          return result;
        }
        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_244531A80(0, v48[2] + 1, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_244531A80((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v62 = sub_244518CE0();
        uint64_t v51 = swift_allocObject();
        *(void *)&long long v60 = v51;
        *(unsigned char *)(v51 + 16) = 2;
        *(unsigned char *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(unsigned char *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0;
        void v48[2] = v50 + 1;
        sub_244516C78(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    unsigned int v14 = sub_244510494();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v61 = &type metadata for LaunchConstraintConjunction;
    unint64_t v19 = sub_244513CDC();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    unint64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A80(0, v20[2] + 1, 1, v20);
      unint64_t v64 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v64 = sub_244531A80((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    long long v6 = v61;
    uint64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_2445112D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

void sub_24451130C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x79654B7961727261;
  if (v2 != 1)
  {
    uint64_t v5 = 0x65756C6176;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 7955819;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_244511360()
{
  uint64_t v1 = 0x79654B7961727261;
  if (*v0 != 1) {
    uint64_t v1 = 0x65756C6176;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7955819;
  }
}

uint64_t sub_2445113B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_2445113E0(uint64_t a1)
{
  unint64_t v2 = sub_2445187A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24451141C(uint64_t a1)
{
  unint64_t v2 = sub_2445187A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244511458@<X0>(unint64_t *a1@<X8>)
{
  return sub_244513B74(&qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A218, a1);
}

uint64_t sub_24451148C@<X0>(uint64_t a1@<X8>)
{
  return sub_244513BC0((uint64_t (*)(void))sub_244517828, a1);
}

uint64_t sub_2445114B8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2445114F4(a1, a2, a3, &qword_268E79D40, (void (*)(void))sub_2445187A0);
}

uint64_t sub_2445114F4(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  return sub_244513898(a1, *v5, *((void *)v5 + 1), a4, a5);
}

uint64_t sub_244511514(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v65);
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if (v23)
      {
        unsigned int v24 = sub_244511C34(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v29 = sub_244513F38();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_244531A94(0, v30[2] + 1, 1, v30);
          uint64_t v66 = v30;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_244531A94((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x270FA5388](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast())
      {
        sub_244516C78(v55, (uint64_t)&v62);
        sub_24451A0A8((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_244531A94(0, v38[2] + 1, 1, v38);
          uint64_t v66 = v38;
        }
        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_244531A94((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x270FA5388](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_244515E28(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        uint64_t v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_24451A25C((uint64_t)v55, &qword_268E79FD0);
        sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if (v60)
        {
          __break(1u);
          return result;
        }
        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        unint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_244531A94(0, v49[2] + 1, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          unint64_t v49 = sub_244531A94((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v64 = sub_2445198C4();
        uint64_t v52 = swift_allocObject();
        *(void *)&long long v62 = v52;
        *(unsigned char *)(v52 + 16) = 2;
        *(unsigned char *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(unsigned char *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0;
        long long v49[2] = v51 + 1;
        sub_244516C78(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    unsigned int v14 = sub_244511514();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    unint64_t v63 = &type metadata for OnDiskConstraintConjunction;
    unint64_t v19 = sub_244513D58();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    unint64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A94(0, v20[2] + 1, 1, v20);
      uint64_t v66 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_244531A94((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    BOOL v6 = v63;
    uint64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_244511C34(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v63);
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      if (swift_dynamicCast())
      {
        unsigned int v23 = sub_244511C34();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v28 = sub_244513F38();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_244531A94(0, v29[2] + 1, 1, v29);
          unint64_t v64 = v29;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_244531A94((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x270FA5388](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast())
      {
        sub_244516C78(v54, (uint64_t)&v60);
        sub_24451A0A8((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_244531A94(0, v37[2] + 1, 1, v37);
          unint64_t v64 = v37;
        }
        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_244531A94((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x270FA5388](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_244515E28(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        uint64_t v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_24451A25C((uint64_t)v54, &qword_268E79FD0);
        sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if (v58)
        {
          __break(1u);
          return result;
        }
        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_244531A94(0, v48[2] + 1, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_244531A94((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v62 = sub_2445198C4();
        uint64_t v51 = swift_allocObject();
        *(void *)&long long v60 = v51;
        *(unsigned char *)(v51 + 16) = 2;
        *(unsigned char *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(unsigned char *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0;
        void v48[2] = v50 + 1;
        sub_244516C78(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    unsigned int v14 = sub_244511514();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v61 = &type metadata for OnDiskConstraintConjunction;
    unint64_t v19 = sub_244513D58();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    unint64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A94(0, v20[2] + 1, 1, v20);
      unint64_t v64 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v64 = sub_244531A94((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    BOOL v6 = v61;
    uint64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_244512354(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v65);
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if (v23)
      {
        unsigned int v24 = sub_244512A74(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v29 = sub_244513F38();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_244531A94(0, v30[2] + 1, 1, v30);
          uint64_t v66 = v30;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_244531A94((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x270FA5388](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast())
      {
        sub_244516C78(v55, (uint64_t)&v62);
        sub_24451A0A8((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_244531A94(0, v38[2] + 1, 1, v38);
          uint64_t v66 = v38;
        }
        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_244531A94((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x270FA5388](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_244515E28(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        uint64_t v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_24451A25C((uint64_t)v55, &qword_268E79FD0);
        sub_24451A0A8((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if (v60)
        {
          __break(1u);
          return result;
        }
        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        unint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_244531A94(0, v49[2] + 1, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          unint64_t v49 = sub_244531A94((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v64 = sub_2445198C4();
        uint64_t v52 = swift_allocObject();
        *(void *)&long long v62 = v52;
        *(unsigned char *)(v52 + 16) = 2;
        *(unsigned char *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(unsigned char *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0;
        long long v49[2] = v51 + 1;
        sub_244516C78(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    unsigned int v14 = sub_244512354();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    unint64_t v63 = &type metadata for OnDiskConstraintConjunction;
    unint64_t v19 = sub_244513D58();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    unint64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A94(0, v20[2] + 1, 1, v20);
      uint64_t v66 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_244531A94((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    BOOL v6 = v63;
    uint64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_244512A74(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40)
    {
      sub_24451A0A8(i, (uint64_t)v63);
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
      if (swift_dynamicCast()) {
        break;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
      if (swift_dynamicCast())
      {
        unsigned int v23 = sub_244512A74();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v28 = sub_244513F38();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_244531A94(0, v29[2] + 1, 1, v29);
          unint64_t v64 = v29;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_244531A94((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x270FA5388](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_24451A0A8((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
      if (swift_dynamicCast())
      {
        sub_244516C78(v54, (uint64_t)&v60);
        sub_24451A0A8((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_244531A94(0, v37[2] + 1, 1, v37);
          unint64_t v64 = v37;
        }
        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_244531A94((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x270FA5388](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_244515E28(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        uint64_t v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_24451A25C((uint64_t)v54, &qword_268E79FD0);
        sub_24451A0A8((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if (v58)
        {
          __break(1u);
          return result;
        }
        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_244531A94(0, v48[2] + 1, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_244531A94((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v62 = sub_2445198C4();
        uint64_t v51 = swift_allocObject();
        *(void *)&long long v60 = v51;
        *(unsigned char *)(v51 + 16) = 2;
        *(unsigned char *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(unsigned char *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0;
        void v48[2] = v50 + 1;
        sub_244516C78(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    unsigned int v14 = sub_244512354();
    if (v2) {
      goto LABEL_35;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v61 = &type metadata for OnDiskConstraintConjunction;
    unint64_t v19 = sub_244513D58();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    unint64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_244531A94(0, v20[2] + 1, 1, v20);
      unint64_t v64 = v20;
    }
    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v64 = sub_244531A94((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    BOOL v6 = v61;
    uint64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x270FA5388](v7);
    long long v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_244515E28(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_244513194@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_2445131CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_2445131FC(uint64_t a1)
{
  unint64_t v2 = sub_24451933C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244513238(uint64_t a1)
{
  unint64_t v2 = sub_24451933C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244513274@<X0>(unint64_t *a1@<X8>)
{
  return sub_244513B74(&qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A100, a1);
}

uint64_t sub_2445132A8@<X0>(uint64_t a1@<X8>)
{
  return sub_244513BC0((uint64_t (*)(void))sub_244517D34, a1);
}

uint64_t sub_2445132D4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2445114F4(a1, a2, a3, &qword_268E79E10, (void (*)(void))sub_24451933C);
}

uint64_t sub_244513310@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_244513348@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_244513378(uint64_t a1)
{
  unint64_t v2 = sub_244514B84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2445133B4(uint64_t a1)
{
  unint64_t v2 = sub_244514B84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2445133F0@<X0>(unint64_t *a1@<X8>)
{
  return sub_244513B74(&qword_268E79F60, (void (*)(void *__return_ptr))sub_2445094E4, a1);
}

uint64_t sub_244513424@<X0>(uint64_t a1@<X8>)
{
  return sub_244513BC0((uint64_t (*)(void))sub_244518240, a1);
}

uint64_t sub_244513450(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2445114F4(a1, a2, a3, &qword_268E79B48, (void (*)(void))sub_244514B84);
}

uint64_t sub_24451348C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_2445134C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_2445134F4(uint64_t a1)
{
  unint64_t v2 = sub_24451874C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244513530(uint64_t a1)
{
  unint64_t v2 = sub_24451874C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24451356C@<X0>(unint64_t *a1@<X8>)
{
  return sub_244513B74(&qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A18C, a1);
}

uint64_t sub_2445135A0@<X0>(uint64_t a1@<X8>)
{
  return sub_244513BC0((uint64_t (*)(void))sub_244518DDC, a1);
}

uint64_t sub_2445135CC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2445114F4(a1, a2, a3, &qword_268E79D30, (void (*)(void))sub_24451874C);
}

uint64_t sub_244513608()
{
  return sub_24453A8D0();
}

uint64_t sub_2445136A0()
{
  sub_24453A500();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244513724()
{
  return sub_24453A8D0();
}

uint64_t sub_2445137B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_2445137F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445199C0();
  *a1 = result;
  return result;
}

uint64_t sub_244513820(uint64_t a1)
{
  unint64_t v2 = sub_2445192E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24451385C(uint64_t a1)
{
  unint64_t v2 = sub_2445192E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244513898(void *a1, unsigned int a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v16 = a3;
  LODWORD(v17) = a2;
  unsigned int v7 = a2 >> 8;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a5();
  sub_24453A8F0();
  v19[0] = v7;
  char v21 = 0;
  sub_244514BD8();
  uint64_t v12 = v18;
  sub_24453A730();
  if (v12) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v18 = v9;
  v19[0] = v17;
  char v21 = 1;
  sub_24453A730();
  char v21 = 2;
  sub_24453A6F0();
  uint64_t v14 = *(void *)(v16 + 16);
  if (v14)
  {
    uint64_t v17 = v8;
    uint64_t v15 = (void *)(v16 + 32);
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v15, v15[3]);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
      sub_24453A810();
      v15 += 5;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    uint64_t v8 = v17;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_244513B40@<X0>(unint64_t *a1@<X8>)
{
  return sub_244513B74(&qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A074, a1);
}

uint64_t sub_244513B74@<X0>(uint64_t *a1@<X2>, void (*a2)(void *__return_ptr)@<X3>, unint64_t *a3@<X8>)
{
  return sub_24450B62C(*v3, *((void *)v3 + 1), a1, a2, a3);
}

uint64_t sub_244513B94@<X0>(uint64_t a1@<X8>)
{
  return sub_244513BC0((uint64_t (*)(void))sub_244519A08, a1);
}

uint64_t sub_244513BC0@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_244513BFC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2445114F4(a1, a2, a3, &qword_268E79E00, (void (*)(void))sub_2445192E8);
}

uint64_t allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  return sub_244513ECC(a1, (uint64_t)&type metadata for ProcessConstraintConjunction, (uint64_t (*)(void))sub_244513C60, 21, 20, a2);
}

{
  return sub_244513ECC(a1, (uint64_t)&type metadata for LaunchConstraintConjunction, (uint64_t (*)(void))sub_244513CDC, 21, 20, a2);
}

{
  return sub_244513ECC(a1, (uint64_t)&type metadata for OnDiskConstraintConjunction, (uint64_t (*)(void))sub_244513D58, 21, 20, a2);
}

unint64_t sub_244513C60()
{
  unint64_t result = qword_268E79A70;
  if (!qword_268E79A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79A70);
  }
  return result;
}

unint64_t sub_244513CDC()
{
  unint64_t result = qword_268E79A78;
  if (!qword_268E79A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79A78);
  }
  return result;
}

unint64_t sub_244513D58()
{
  unint64_t result = qword_268E79A80;
  if (!qword_268E79A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79A80);
  }
  return result;
}

uint64_t anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  return sub_244513ECC(a1, (uint64_t)&type metadata for ProcessConstraintDisjunction, (uint64_t (*)(void))sub_244513DD4, 29, 28, a2);
}

{
  return sub_244513ECC(a1, (uint64_t)&type metadata for LaunchConstraintDisjunction, (uint64_t (*)(void))sub_244513E50, 29, 28, a2);
}

{
  return sub_244513ECC(a1, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (uint64_t (*)(void))sub_244513F38, 29, 28, a2);
}

unint64_t sub_244513DD4()
{
  unint64_t result = qword_268E79A88;
  if (!qword_268E79A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79A88);
  }
  return result;
}

unint64_t sub_244513E50()
{
  unint64_t result = qword_268E79A90;
  if (!qword_268E79A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79A90);
  }
  return result;
}

uint64_t sub_244513ECC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, char a4@<W4>, char a5@<W5>, uint64_t a6@<X8>)
{
  uint64_t v11 = a1();
  *(void *)(a6 + 24) = a2;
  uint64_t result = a3();
  *(void *)(a6 + 32) = result;
  *(unsigned char *)a6 = a4;
  *(unsigned char *)(a6 + 1) = a5;
  *(void *)(a6 + 8) = v11;
  return result;
}

unint64_t sub_244513F38()
{
  unint64_t result = qword_268E79A98;
  if (!qword_268E79A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79A98);
  }
  return result;
}

void type metadata accessor for CFString()
{
  if (!qword_268E79AA0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268E79AA0);
    }
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for OnDiskConstraintDisjunction()
{
  return &type metadata for OnDiskConstraintDisjunction;
}

ValueMetadata *type metadata accessor for LaunchConstraintDisjunction()
{
  return &type metadata for LaunchConstraintDisjunction;
}

ValueMetadata *type metadata accessor for ProcessConstraintDisjunction()
{
  return &type metadata for ProcessConstraintDisjunction;
}

ValueMetadata *type metadata accessor for OnDiskConstraintConjunction()
{
  return &type metadata for OnDiskConstraintConjunction;
}

uint64_t destroy for LaunchConstraintConjunction()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for LaunchConstraintConjunction()
{
  return &type metadata for LaunchConstraintConjunction;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwta_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwet_0(uint64_t a1, int a2)
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

uint64_t sub_244514164(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ProcessConstraintConjunction()
{
  return &type metadata for ProcessConstraintConjunction;
}

unint64_t sub_2445141B4()
{
  unint64_t result = qword_268E79AA8;
  if (!qword_268E79AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AA8);
  }
  return result;
}

unint64_t sub_24451420C()
{
  unint64_t result = qword_268E79AB0;
  if (!qword_268E79AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AB0);
  }
  return result;
}

uint64_t sub_244514260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244514AC0(a1, a2, a3, (uint64_t (*)(void))sub_24451428C, (uint64_t (*)(void))sub_2445142E0);
}

unint64_t sub_24451428C()
{
  unint64_t result = qword_268E79AB8;
  if (!qword_268E79AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AB8);
  }
  return result;
}

unint64_t sub_2445142E0()
{
  unint64_t result = qword_268E79AC0;
  if (!qword_268E79AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AC0);
  }
  return result;
}

unint64_t sub_244514338()
{
  unint64_t result = qword_268E79AC8;
  if (!qword_268E79AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AC8);
  }
  return result;
}

unint64_t sub_244514390()
{
  unint64_t result = qword_268E79AD0;
  if (!qword_268E79AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AD0);
  }
  return result;
}

uint64_t sub_2445143E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244514AC0(a1, a2, a3, (uint64_t (*)(void))sub_244514410, (uint64_t (*)(void))sub_244514464);
}

unint64_t sub_244514410()
{
  unint64_t result = qword_268E79AD8;
  if (!qword_268E79AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AD8);
  }
  return result;
}

unint64_t sub_244514464()
{
  unint64_t result = qword_268E79AE0;
  if (!qword_268E79AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AE0);
  }
  return result;
}

unint64_t sub_2445144BC()
{
  unint64_t result = qword_268E79AE8;
  if (!qword_268E79AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AE8);
  }
  return result;
}

unint64_t sub_244514514()
{
  unint64_t result = qword_268E79AF0;
  if (!qword_268E79AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AF0);
  }
  return result;
}

uint64_t sub_244514568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244514AC0(a1, a2, a3, (uint64_t (*)(void))sub_244514594, (uint64_t (*)(void))sub_2445145E8);
}

unint64_t sub_244514594()
{
  unint64_t result = qword_268E79AF8;
  if (!qword_268E79AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79AF8);
  }
  return result;
}

unint64_t sub_2445145E8()
{
  unint64_t result = qword_268E79B00;
  if (!qword_268E79B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B00);
  }
  return result;
}

uint64_t sub_24451463C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244514AC0(a1, a2, a3, (uint64_t (*)(void))sub_244514668, (uint64_t (*)(void))sub_2445146BC);
}

unint64_t sub_244514668()
{
  unint64_t result = qword_268E79B08;
  if (!qword_268E79B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B08);
  }
  return result;
}

unint64_t sub_2445146BC()
{
  unint64_t result = qword_268E79B10;
  if (!qword_268E79B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B10);
  }
  return result;
}

uint64_t sub_244514710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244514AC0(a1, a2, a3, (uint64_t (*)(void))sub_24451473C, (uint64_t (*)(void))sub_244514790);
}

unint64_t sub_24451473C()
{
  unint64_t result = qword_268E79B18;
  if (!qword_268E79B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B18);
  }
  return result;
}

unint64_t sub_244514790()
{
  unint64_t result = qword_268E79B20;
  if (!qword_268E79B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B20);
  }
  return result;
}

uint64_t sub_2445147E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244514AC0(a1, a2, a3, (uint64_t (*)(void))sub_244514810, (uint64_t (*)(void))sub_244514864);
}

unint64_t sub_244514810()
{
  unint64_t result = qword_268E79B28;
  if (!qword_268E79B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B28);
  }
  return result;
}

unint64_t sub_244514864()
{
  unint64_t result = qword_268E79B30;
  if (!qword_268E79B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B30);
  }
  return result;
}

uint64_t sub_2445148B8()
{
  swift_getWitnessTable();

  return sub_24453A480();
}

uint64_t sub_244514924()
{
  return sub_244519828(&qword_268E79B38, (void (*)(uint64_t))type metadata accessor for CFString);
}

uint64_t sub_24451496C()
{
  return sub_24453A4A0();
}

uint64_t sub_2445149B8()
{
  return sub_24453A490();
}

uint64_t sub_244514A10()
{
  return sub_24453A8D0();
}

uint64_t sub_244514A78()
{
  return sub_244519828(&qword_268E79B40, (void (*)(uint64_t))type metadata accessor for CFString);
}

uint64_t sub_244514AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
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

unint64_t sub_244514B84()
{
  unint64_t result = qword_268E79B50;
  if (!qword_268E79B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B50);
  }
  return result;
}

unint64_t sub_244514BD8()
{
  unint64_t result = qword_268E79B58;
  if (!qword_268E79B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B58);
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

unint64_t sub_244514CCC()
{
  unint64_t result = qword_268E79B68;
  if (!qword_268E79B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B68);
  }
  return result;
}

char *sub_244514D20(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_244514DC0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_244514D40(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_244514FE0(a1, a2, a3, *v3, &qword_268E79F68, &qword_268E79F58);
  *uint64_t v3 = result;
  return result;
}

void *sub_244514D70(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_244514EBC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_244514D90(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_244514FE0(a1, a2, a3, *v3, &qword_268E79F08, &qword_268E79ED0);
  *uint64_t v3 = result;
  return result;
}

char *sub_244514DC0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F90);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void *sub_244514EBC(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F28);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F30);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_244514FE0(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_24451511C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_24451A0A8((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;

  return swift_bridgeObjectRetain();
}

uint64_t sub_244515170(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v51 = a1;
  uint64_t v52 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v53 = v8;
  uint64_t v54 = 0;
  uint64_t v55 = v11 & v9;
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_244515C14((uint64_t)&v48);
  uint64_t v12 = v49;
  if (!v49) {
    goto LABEL_23;
  }
  uint64_t v13 = v48;
  uint64_t v46 = v48;
  uint64_t v47 = v49;
  sub_244516C78(v50, (uint64_t)v45);
  size_t v14 = (void *)*a5;
  unint64_t v16 = sub_2445158CC(v13, v12);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if (a4)
    {
      if ((v15 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      sub_244515944();
      if ((v20 & 1) == 0) {
        goto LABEL_15;
      }
    }
LABEL_12:
    sub_244516BC0();
    uint64_t v23 = swift_allocError();
    *uint64_t v24 = 0;
    swift_willThrow();
    uint64_t v58 = v23;
    MEMORY[0x2456918E0](v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F38);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_24451A074();
      swift_release();
      return MEMORY[0x2456918D0](v58);
    }
    goto LABEL_28;
  }
  sub_2445155A4(v19, a4 & 1);
  unint64_t v21 = sub_2445158CC(v13, v12);
  if ((v20 & 1) != (v22 & 1))
  {
LABEL_27:
    sub_24453A850();
    __break(1u);
LABEL_28:
    sub_24453A5F0();
    sub_24453A510();
    sub_24453A610();
    sub_24453A510();
    uint64_t result = sub_24453A620();
    __break(1u);
    return result;
  }
  unint64_t v16 = v21;
  if (v20) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v26 = (void *)*a5;
  *(void *)(*a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
  unsigned int v27 = (uint64_t *)(v26[6] + 16 * v16);
  *unsigned int v27 = v13;
  v27[1] = v12;
  sub_244516C78(v45, v26[7] + 40 * v16);
  uint64_t v28 = v26[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v26[2] = v30;
  sub_244515C14((uint64_t)&v48);
  for (uint64_t i = v49; v49; uint64_t i = v49)
  {
    uint64_t v32 = v48;
    uint64_t v46 = v48;
    uint64_t v47 = i;
    sub_244516C78(v50, (uint64_t)v45);
    uint64_t v33 = (void *)*a5;
    unint64_t v34 = sub_2445158CC(v32, i);
    uint64_t v36 = v33[2];
    BOOL v37 = (v35 & 1) == 0;
    BOOL v29 = __OFADD__(v36, v37);
    uint64_t v38 = v36 + v37;
    if (v29) {
      goto LABEL_25;
    }
    char v39 = v35;
    if (v33[3] < v38)
    {
      sub_2445155A4(v38, 1);
      unint64_t v34 = sub_2445158CC(v32, i);
      if ((v39 & 1) != (v40 & 1)) {
        goto LABEL_27;
      }
    }
    if (v39) {
      goto LABEL_12;
    }
    uint64_t v41 = (void *)*a5;
    *(void *)(*a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
    uint64_t v42 = (uint64_t *)(v41[6] + 16 * v34);
    *uint64_t v42 = v32;
    v42[1] = i;
    sub_244516C78(v45, v41[7] + 40 * v34);
    uint64_t v43 = v41[2];
    BOOL v29 = __OFADD__(v43, 1);
    uint64_t v44 = v43 + 1;
    if (v29) {
      goto LABEL_26;
    }
    v41[2] = v44;
    sub_244515C14((uint64_t)&v48);
  }
LABEL_23:
  swift_release();
  swift_bridgeObjectRelease();
  sub_24451A074();
  return swift_release();
}

uint64_t sub_2445155A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF0);
  char v37 = a2;
  uint64_t v6 = sub_24453A650();
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
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    char v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    char v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_244516C78(v25, (uint64_t)v38);
    }
    else
    {
      sub_24451A0A8((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_24453A8A0();
    sub_24453A500();
    uint64_t result = sub_24453A8D0();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    char v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *char v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_244516C78(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2445158CC(uint64_t a1, uint64_t a2)
{
  sub_24453A8A0();
  sub_24453A500();
  uint64_t v4 = sub_24453A8D0();

  return sub_244515B30(a1, a2, v4);
}

void *sub_244515944()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24453A640();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  char v25 = v1;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_24451A0A8(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_244516C78(v26, *(void *)(v4 + 56) + v20);
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

unint64_t sub_244515B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24453A830() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24453A830() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_244515C14@<X0>(uint64_t a1@<X8>)
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
    BOOL v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_24451A0A8(*(void *)(v3 + 56) + 40 * v10, (uint64_t)v26);
    *(void *)&long long v25 = v13;
    *((void *)&v25 + 1) = v12;
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
  uint64_t v27 = 0;
  memset(v26, 0, sizeof(v26));
  long long v25 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_244519F7C((uint64_t)&v25, (uint64_t)v23);
  if (*((void *)&v23[0] + 1))
  {
    v21[0] = v23[0];
    v21[1] = v23[1];
    v21[2] = v23[2];
    uint64_t v22 = v24;
    v19(v21);
    return sub_24451A25C((uint64_t)v21, &qword_268E79F40);
  }
  else
  {
    *(void *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t sub_244515E10(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  return sub_244515E28(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
}

uint64_t sub_244515E28(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *, uint64_t))
{
  v14[3] = a4;
  v14[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v12 = *a3;
  *(void *)(v12 + 16) = a1 + 1;
  return a6(v14, v12 + 40 * a1 + 32);
}

uint64_t sub_244515ED0(uint64_t a1, uint64_t a2)
{
  return sub_244515F28(a1, a2, (void (*)(void *__return_ptr))sub_244509570);
}

uint64_t sub_244515EFC(uint64_t a1, uint64_t a2)
{
  return sub_244515F28(a1, a2, (void (*)(void *__return_ptr))sub_2445094E4);
}

uint64_t sub_244515F28(uint64_t a1, uint64_t a2, void (*a3)(void *__return_ptr))
{
  swift_bridgeObjectRetain();
  sub_24450B62C(a1, a2, &qword_268E79F60, a3, &v30);
  if (v3)
  {
    swift_bridgeObjectRelease();
    return a2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  swift_dynamicCast();
  uint64_t v7 = *(void *)(v27 + 16);
  swift_bridgeObjectRelease();
  if (v7 != 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  char v8 = *(unsigned char *)(v27 + 32);
  uint64_t v9 = 1 << v8;
  uint64_t v10 = -1;
  if (1 << v8 < 64) {
    uint64_t v10 = ~(-1 << (1 << v8));
  }
  unint64_t v11 = v10 & *(void *)(v27 + 64);
  if (v11)
  {
    unint64_t v12 = __clz(__rbit64(v11));
LABEL_8:
    uint64_t v13 = *(void *)(v27 + 56);
    int64_t v14 = (void *)(*(void *)(v27 + 48) + 16 * v12);
    uint64_t v15 = v14[1];
    *(void *)&long long v27 = *v14;
    *((void *)&v27 + 1) = v15;
    sub_24451A0A8(v13 + 40 * v12, (uint64_t)v28);
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
  unsigned int v16 = v8 & 0x3F;
  if (v16 > 6)
  {
    unint64_t v17 = *(void *)(v27 + 72);
    if (v17)
    {
      uint64_t v18 = 64;
LABEL_12:
      unint64_t v12 = __clz(__rbit64(v17)) + v18;
      goto LABEL_8;
    }
    if (v16 >= 8)
    {
      unint64_t v17 = *(void *)(v27 + 80);
      if (v17)
      {
        uint64_t v18 = 128;
        goto LABEL_12;
      }
      unint64_t v17 = *(void *)(v27 + 88);
      if (v17)
      {
        uint64_t v18 = 192;
        goto LABEL_12;
      }
      int64_t v19 = (unint64_t)(v9 + 63) >> 6;
      if (v19 <= 4) {
        int64_t v19 = 4;
      }
      int64_t v20 = v19 - 4;
      int64_t v21 = (unint64_t *)(v27 + 96);
      uint64_t v18 = 192;
      while (v20)
      {
        unint64_t v22 = *v21++;
        unint64_t v17 = v22;
        --v20;
        v18 += 64;
        if (v22) {
          goto LABEL_12;
        }
      }
    }
  }
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  long long v27 = 0u;
LABEL_25:
  sub_244519F7C((uint64_t)&v27, (uint64_t)&v30);
  uint64_t v23 = v31;
  if (v31)
  {
    unint64_t v24 = v30;
    sub_244516C78(&v32, (uint64_t)&v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
    a2 = swift_allocObject();
    uint64_t v25 = MEMORY[0x263F8D310];
    *(_OWORD *)(a2 + 16) = xmmword_24453AD50;
    *(void *)(a2 + 56) = v25;
    *(void *)(a2 + 64) = &off_26F92F298;
    *(void *)(a2 + 32) = v24;
    *(void *)(a2 + 40) = v23;
    sub_244516C78(&v27, a2 + 72);
    swift_bridgeObjectRelease();
    return a2;
  }
LABEL_29:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_244516178(uint64_t a1, uint64_t a2)
{
  return sub_244516248(a1, a2, &qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A100);
}

uint64_t sub_2445161AC(uint64_t a1, uint64_t a2)
{
  return sub_244516248(a1, a2, &qword_268E79F78, (void (*)(void *__return_ptr))sub_24450A074);
}

uint64_t sub_2445161E0(uint64_t a1, uint64_t a2)
{
  return sub_244516248(a1, a2, &qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A218);
}

uint64_t sub_244516214(uint64_t a1, uint64_t a2)
{
  return sub_244516248(a1, a2, &qword_268E79F70, (void (*)(void *__return_ptr))sub_24450A18C);
}

uint64_t sub_244516248(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void *__return_ptr))
{
  swift_bridgeObjectRetain();
  sub_24450B62C(a1, a2, a3, a4, &v32);
  if (v4)
  {
    swift_bridgeObjectRelease();
    return a2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  swift_dynamicCast();
  uint64_t v9 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v9 != 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  char v10 = *(unsigned char *)(v29 + 32);
  uint64_t v11 = 1 << v10;
  uint64_t v12 = -1;
  if (1 << v10 < 64) {
    uint64_t v12 = ~(-1 << (1 << v10));
  }
  unint64_t v13 = v12 & *(void *)(v29 + 64);
  if (v13)
  {
    unint64_t v14 = __clz(__rbit64(v13));
LABEL_8:
    uint64_t v15 = *(void *)(v29 + 56);
    unsigned int v16 = (void *)(*(void *)(v29 + 48) + 16 * v14);
    uint64_t v17 = v16[1];
    *(void *)&long long v29 = *v16;
    *((void *)&v29 + 1) = v17;
    sub_24451A0A8(v15 + 40 * v14, (uint64_t)v30);
    swift_bridgeObjectRetain();
    goto LABEL_28;
  }
  unsigned int v18 = v10 & 0x3F;
  if (v18 > 6)
  {
    unint64_t v19 = *(void *)(v29 + 72);
    if (v19)
    {
      uint64_t v20 = 64;
LABEL_12:
      unint64_t v14 = __clz(__rbit64(v19)) + v20;
      goto LABEL_8;
    }
    if (v18 >= 8)
    {
      unint64_t v19 = *(void *)(v29 + 80);
      if (v19)
      {
        uint64_t v20 = 128;
        goto LABEL_12;
      }
      unint64_t v19 = *(void *)(v29 + 88);
      if (v19)
      {
        uint64_t v20 = 192;
        goto LABEL_12;
      }
      if (v18 >= 9)
      {
        unint64_t v19 = *(void *)(v29 + 96);
        if (v19)
        {
          uint64_t v20 = 256;
          goto LABEL_12;
        }
        int64_t v21 = (unint64_t)(v11 + 63) >> 6;
        if (v21 <= 5) {
          int64_t v21 = 5;
        }
        int64_t v22 = v21 - 5;
        uint64_t v23 = (unint64_t *)(v29 + 104);
        uint64_t v20 = 256;
        while (v22)
        {
          unint64_t v24 = *v23++;
          unint64_t v19 = v24;
          --v22;
          v20 += 64;
          if (v24) {
            goto LABEL_12;
          }
        }
      }
    }
  }
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  long long v29 = 0u;
LABEL_28:
  sub_244519F7C((uint64_t)&v29, (uint64_t)&v32);
  uint64_t v25 = v33;
  if (v33)
  {
    unint64_t v26 = v32;
    sub_244516C78(&v34, (uint64_t)&v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
    a2 = swift_allocObject();
    uint64_t v27 = MEMORY[0x263F8D310];
    *(_OWORD *)(a2 + 16) = xmmword_24453AD50;
    *(void *)(a2 + 56) = v27;
    *(void *)(a2 + 64) = &off_26F92F298;
    *(void *)(a2 + 32) = v26;
    *(void *)(a2 + 40) = v25;
    sub_244516C78(&v29, a2 + 72);
    swift_bridgeObjectRelease();
    return a2;
  }
LABEL_32:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2445164B0(uint64_t a1, char a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24453AD40;
  *(void *)(inited + 32) = sub_2445388B0(*(unsigned char *)(a1 + 16));
  *(void *)(inited + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F18);
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_24453AD40;
  *(void *)(v6 + 32) = sub_2445388B0(*(unsigned char *)(a1 + 17));
  *(void *)(v6 + 40) = v7;
  *(void *)(v6 + 48) = *(void *)(a1 + 24);
  swift_retain();
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_24450B3B0(v6, &qword_268E79F50);
  sub_24450B3B0(inited, &qword_268E79F48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  swift_dynamicCast();
  uint64_t v9 = *(void *)(v14 + 16);
  uint64_t result = swift_release();
  if (v9 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F08);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_24453AD50;
    unint64_t v12 = sub_2445388B0(a2);
    *(void *)(v11 + 56) = MEMORY[0x263F8D310];
    *(void *)(v11 + 64) = &off_26F92F298;
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v13;
    *(void *)(v11 + 96) = v8;
    *(void *)(v11 + 104) = &off_26F92F340;
    *(void *)(v11 + 72) = v14;
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_244516660(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79B70);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244514CCC();
  sub_24453A8E0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  int v24 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) == 1684955428 && v7 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_24453A6C0();
  int v23 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) != 0x7272612D646E6124 || v9 != 0xEA00000000007961)
  {
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x263F8EE78];
  LOBYTE(v29[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_24453A7D0() & 1) == 0)
  {
    sub_24450B880((uint64_t)v30, v29);
    sub_24451A0A8((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_244531974(0, v11[2] + 1, 1, v11);
      unint64_t v32 = v11;
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_244531974((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x270FA5388](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_244515E28(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_244516B6C()
{
  unint64_t result = qword_268E79B78;
  if (!qword_268E79B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B78);
  }
  return result;
}

unint64_t sub_244516BC0()
{
  unint64_t result = qword_268E79B80;
  if (!qword_268E79B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B80);
  }
  return result;
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

uint64_t sub_244516C78(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_244516C90()
{
  unint64_t result = qword_268E79B88;
  if (!qword_268E79B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B88);
  }
  return result;
}

unint64_t sub_244516CE4()
{
  unint64_t result = qword_268E79B98;
  if (!qword_268E79B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79B98);
  }
  return result;
}

unint64_t sub_244516D38()
{
  unint64_t result = qword_268E79BA8;
  if (!qword_268E79BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79BA8);
  }
  return result;
}

unint64_t sub_244516D8C()
{
  unint64_t result = qword_268E79BB0;
  if (!qword_268E79BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79BB0);
  }
  return result;
}

unint64_t sub_244516DE0()
{
  unint64_t result = qword_268E79BC8;
  if (!qword_268E79BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79BC8);
  }
  return result;
}

unint64_t sub_244516E34()
{
  unint64_t result = qword_268E79BD8;
  if (!qword_268E79BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79BD8);
  }
  return result;
}

unint64_t sub_244516E88()
{
  unint64_t result = qword_268E79BE8;
  if (!qword_268E79BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79BE8);
  }
  return result;
}

unint64_t sub_244516EDC()
{
  unint64_t result = qword_268E79BF8;
  if (!qword_268E79BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79BF8);
  }
  return result;
}

unint64_t sub_244516F30()
{
  unint64_t result = qword_268E79C08;
  if (!qword_268E79C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C08);
  }
  return result;
}

unint64_t sub_244516F84()
{
  unint64_t result = qword_268E79C18;
  if (!qword_268E79C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C18);
  }
  return result;
}

unint64_t sub_244516FD8()
{
  unint64_t result = qword_268E79C28;
  if (!qword_268E79C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C28);
  }
  return result;
}

unint64_t sub_24451702C()
{
  unint64_t result = qword_268E79C38;
  if (!qword_268E79C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C38);
  }
  return result;
}

unint64_t sub_244517080()
{
  unint64_t result = qword_268E79C48;
  if (!qword_268E79C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C48);
  }
  return result;
}

unint64_t sub_2445170D4()
{
  unint64_t result = qword_268E79C58;
  if (!qword_268E79C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C58);
  }
  return result;
}

unint64_t sub_244517128()
{
  unint64_t result = qword_268E79C68;
  if (!qword_268E79C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C68);
  }
  return result;
}

unint64_t sub_24451717C()
{
  unint64_t result = qword_268E79C78;
  if (!qword_268E79C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C78);
  }
  return result;
}

unint64_t sub_2445171D0()
{
  unint64_t result = qword_268E79C88;
  if (!qword_268E79C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C88);
  }
  return result;
}

unint64_t sub_244517224()
{
  unint64_t result = qword_268E79C98;
  if (!qword_268E79C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79C98);
  }
  return result;
}

uint64_t sub_244517278()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

unint64_t sub_2445172B0()
{
  unint64_t result = qword_268E79CA0;
  if (!qword_268E79CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CA0);
  }
  return result;
}

unint64_t sub_244517304()
{
  unint64_t result = qword_268E79CA8;
  if (!qword_268E79CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CA8);
  }
  return result;
}

unint64_t sub_244517358()
{
  unint64_t result = qword_268E79CB0;
  if (!qword_268E79CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CB0);
  }
  return result;
}

unint64_t sub_2445173AC()
{
  unint64_t result = qword_268E79CB8;
  if (!qword_268E79CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CB8);
  }
  return result;
}

unint64_t sub_244517400()
{
  unint64_t result = qword_268E79CC0;
  if (!qword_268E79CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CC0);
  }
  return result;
}

unint64_t sub_244517454()
{
  unint64_t result = qword_268E79CC8;
  if (!qword_268E79CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CC8);
  }
  return result;
}

unint64_t sub_2445174A8()
{
  unint64_t result = qword_268E79CD0;
  if (!qword_268E79CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CD0);
  }
  return result;
}

unint64_t sub_2445174FC()
{
  unint64_t result = qword_268E79CD8;
  if (!qword_268E79CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CD8);
  }
  return result;
}

unint64_t sub_244517550()
{
  unint64_t result = qword_268E79CE0;
  if (!qword_268E79CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CE0);
  }
  return result;
}

unint64_t sub_2445175A4()
{
  unint64_t result = qword_268E79CE8;
  if (!qword_268E79CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CE8);
  }
  return result;
}

unint64_t sub_2445175F8()
{
  unint64_t result = qword_268E79CF0;
  if (!qword_268E79CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CF0);
  }
  return result;
}

unint64_t sub_24451764C()
{
  unint64_t result = qword_268E79CF8;
  if (!qword_268E79CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79CF8);
  }
  return result;
}

unint64_t sub_2445176A0()
{
  unint64_t result = qword_268E79D08;
  if (!qword_268E79D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D08);
  }
  return result;
}

unint64_t sub_2445176F4()
{
  unint64_t result = qword_268E79D10;
  if (!qword_268E79D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D10);
  }
  return result;
}

uint64_t sub_244517748()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

unint64_t sub_244517780()
{
  unint64_t result = qword_268E79D18;
  if (!qword_268E79D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D18);
  }
  return result;
}

unint64_t sub_2445177D4()
{
  unint64_t result = qword_268E79D20;
  if (!qword_268E79D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D20);
  }
  return result;
}

uint64_t sub_244517828(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79D50);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445187A0();
  sub_24453A8E0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  int v24 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) == 1684955428 && v7 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_24453A6C0();
  int v23 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) != 0x7272612D646E6124 || v9 != 0xEA00000000007961)
  {
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x263F8EE78];
  LOBYTE(v29[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_24453A7D0() & 1) == 0)
  {
    sub_24450C4A4((uint64_t)v30, v29);
    sub_24451A0A8((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_244531A80(0, v11[2] + 1, 1, v11);
      unint64_t v32 = v11;
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_244531A80((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x270FA5388](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_244515E28(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_244517D34(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79E20);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24451933C();
  sub_24453A8E0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  int v24 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) == 1684955428 && v7 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_24453A6C0();
  int v23 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) != 0x7272612D646E6124 || v9 != 0xEA00000000007961)
  {
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x263F8EE78];
  LOBYTE(v29[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_24453A7D0() & 1) == 0)
  {
    sub_24450D0C8((uint64_t)v30, v29);
    sub_24451A0A8((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_244531A94(0, v11[2] + 1, 1, v11);
      unint64_t v32 = v11;
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_244531A94((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x270FA5388](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_244515E28(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_244518240(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79D28);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244514B84();
  sub_24453A8E0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  int v24 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) == 7499556 && v7 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_24453A6C0();
  int v23 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) != 0x617272612D726F24 || v9 != 0xE900000000000079)
  {
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x263F8EE78];
  LOBYTE(v29[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_24453A7D0() & 1) == 0)
  {
    sub_24450B880((uint64_t)v30, v29);
    sub_24451A0A8((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_244531974(0, v11[2] + 1, 1, v11);
      unint64_t v32 = v11;
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_244531974((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x270FA5388](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_244515E28(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_24451874C()
{
  unint64_t result = qword_268E79D38;
  if (!qword_268E79D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D38);
  }
  return result;
}

unint64_t sub_2445187A0()
{
  unint64_t result = qword_268E79D48;
  if (!qword_268E79D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D48);
  }
  return result;
}

unint64_t sub_2445187F4()
{
  unint64_t result = qword_268E79D58;
  if (!qword_268E79D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D58);
  }
  return result;
}

unint64_t sub_244518848()
{
  unint64_t result = qword_268E79D68;
  if (!qword_268E79D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D68);
  }
  return result;
}

unint64_t sub_24451889C()
{
  unint64_t result = qword_268E79D70;
  if (!qword_268E79D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D70);
  }
  return result;
}

unint64_t sub_2445188F0()
{
  unint64_t result = qword_268E79D78;
  if (!qword_268E79D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D78);
  }
  return result;
}

unint64_t sub_244518944()
{
  unint64_t result = qword_268E79D80;
  if (!qword_268E79D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D80);
  }
  return result;
}

unint64_t sub_244518998()
{
  unint64_t result = qword_268E79D88;
  if (!qword_268E79D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D88);
  }
  return result;
}

unint64_t sub_2445189EC()
{
  unint64_t result = qword_268E79D90;
  if (!qword_268E79D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D90);
  }
  return result;
}

unint64_t sub_244518A40()
{
  unint64_t result = qword_268E79D98;
  if (!qword_268E79D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79D98);
  }
  return result;
}

unint64_t sub_244518A94()
{
  unint64_t result = qword_268E79DA0;
  if (!qword_268E79DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DA0);
  }
  return result;
}

unint64_t sub_244518AE8()
{
  unint64_t result = qword_268E79DA8;
  if (!qword_268E79DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DA8);
  }
  return result;
}

unint64_t sub_244518B3C()
{
  unint64_t result = qword_268E79DB0;
  if (!qword_268E79DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DB0);
  }
  return result;
}

unint64_t sub_244518B90()
{
  unint64_t result = qword_268E79DB8;
  if (!qword_268E79DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DB8);
  }
  return result;
}

unint64_t sub_244518BE4()
{
  unint64_t result = qword_268E79DC0;
  if (!qword_268E79DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DC0);
  }
  return result;
}

unint64_t sub_244518C38()
{
  unint64_t result = qword_268E79DC8;
  if (!qword_268E79DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DC8);
  }
  return result;
}

unint64_t sub_244518C8C()
{
  unint64_t result = qword_268E79DD8;
  if (!qword_268E79DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DD8);
  }
  return result;
}

unint64_t sub_244518CE0()
{
  unint64_t result = qword_268E79DE0;
  if (!qword_268E79DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DE0);
  }
  return result;
}

unint64_t sub_244518D34()
{
  unint64_t result = qword_268E79DE8;
  if (!qword_268E79DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DE8);
  }
  return result;
}

unint64_t sub_244518D88()
{
  unint64_t result = qword_268E79DF0;
  if (!qword_268E79DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79DF0);
  }
  return result;
}

uint64_t sub_244518DDC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79DF8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24451874C();
  sub_24453A8E0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  int v24 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) == 7499556 && v7 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_24453A6C0();
  int v23 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) != 0x617272612D726F24 || v9 != 0xE900000000000079)
  {
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x263F8EE78];
  LOBYTE(v29[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_24453A7D0() & 1) == 0)
  {
    sub_24450C4A4((uint64_t)v30, v29);
    sub_24451A0A8((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_244531A80(0, v11[2] + 1, 1, v11);
      unint64_t v32 = v11;
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_244531A80((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x270FA5388](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_244515E28(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_2445192E8()
{
  unint64_t result = qword_268E79E08;
  if (!qword_268E79E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E08);
  }
  return result;
}

unint64_t sub_24451933C()
{
  unint64_t result = qword_268E79E18;
  if (!qword_268E79E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E18);
  }
  return result;
}

unint64_t sub_244519390()
{
  unint64_t result = qword_268E79E28;
  if (!qword_268E79E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E28);
  }
  return result;
}

unint64_t sub_2445193E4()
{
  unint64_t result = qword_268E79E30;
  if (!qword_268E79E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E30);
  }
  return result;
}

unint64_t sub_244519438()
{
  unint64_t result = qword_268E79E40;
  if (!qword_268E79E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E40);
  }
  return result;
}

unint64_t sub_24451948C()
{
  unint64_t result = qword_268E79E48;
  if (!qword_268E79E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E48);
  }
  return result;
}

unint64_t sub_2445194E0()
{
  unint64_t result = qword_268E79E50;
  if (!qword_268E79E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E50);
  }
  return result;
}

unint64_t sub_244519534()
{
  unint64_t result = qword_268E79E58;
  if (!qword_268E79E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E58);
  }
  return result;
}

unint64_t sub_244519588()
{
  unint64_t result = qword_268E79E60;
  if (!qword_268E79E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E60);
  }
  return result;
}

unint64_t sub_2445195DC()
{
  unint64_t result = qword_268E79E68;
  if (!qword_268E79E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E68);
  }
  return result;
}

unint64_t sub_244519630()
{
  unint64_t result = qword_268E79E70;
  if (!qword_268E79E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E70);
  }
  return result;
}

unint64_t sub_244519684()
{
  unint64_t result = qword_268E79E78;
  if (!qword_268E79E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E78);
  }
  return result;
}

unint64_t sub_2445196D8()
{
  unint64_t result = qword_268E79E80;
  if (!qword_268E79E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E80);
  }
  return result;
}

unint64_t sub_24451972C()
{
  unint64_t result = qword_268E79E88;
  if (!qword_268E79E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E88);
  }
  return result;
}

unint64_t sub_244519780()
{
  unint64_t result = qword_268E79E90;
  if (!qword_268E79E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E90);
  }
  return result;
}

unint64_t sub_2445197D4()
{
  unint64_t result = qword_268E79E98;
  if (!qword_268E79E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79E98);
  }
  return result;
}

uint64_t sub_244519828(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_244519870()
{
  unint64_t result = qword_268E79EA8;
  if (!qword_268E79EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79EA8);
  }
  return result;
}

unint64_t sub_2445198C4()
{
  unint64_t result = qword_268E79EB0;
  if (!qword_268E79EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79EB0);
  }
  return result;
}

unint64_t sub_244519918()
{
  unint64_t result = qword_268E79EB8;
  if (!qword_268E79EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79EB8);
  }
  return result;
}

unint64_t sub_24451996C()
{
  unint64_t result = qword_268E79EC0;
  if (!qword_268E79EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79EC0);
  }
  return result;
}

uint64_t sub_2445199C0()
{
  unint64_t v0 = sub_24453A670();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_244519A08(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445192E8();
  sub_24453A8E0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  int v24 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) == 7499556 && v7 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_24453A6C0();
  int v23 = LOBYTE(v30[0]);
  if (sub_2445388B0(v30[0]) != 0x617272612D726F24 || v9 != 0xE900000000000079)
  {
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x263F8EE78];
  LOBYTE(v29[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_24453A7D0() & 1) == 0)
  {
    sub_24450D0C8((uint64_t)v30, v29);
    sub_24451A0A8((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_244531A94(0, v11[2] + 1, 1, v11);
      unint64_t v32 = v11;
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_244531A94((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x270FA5388](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_244515E28(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_244516C78);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_244519F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244519F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244519FE4@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A028(a1, a2, sub_244515EFC, a3);
}

uint64_t sub_24451A010@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A1BC(a1, a2, a3);
}

uint64_t sub_24451A028@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t (*a3)(void, void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = a3(*a1, *((void *)a1 + 1));
  if (v4) {
    *a2 = v4;
  }
  else {
    *a4 = result;
  }
  return result;
}

uint64_t sub_24451A074()
{
  return swift_release();
}

uint64_t sub_24451A07C@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A028(a1, a2, sub_244515ED0, a3);
}

uint64_t sub_24451A0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24451A10C@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A028(a1, a2, sub_244516214, a3);
}

uint64_t sub_24451A138@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A028(a1, a2, sub_2445161E0, a3);
}

uint64_t sub_24451A164@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A028(a1, a2, sub_2445161AC, a3);
}

uint64_t sub_24451A190@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_24451A028(a1, a2, sub_244516178, a3);
}

uint64_t sub_24451A1BC@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_2445164B0(*a1, *(unsigned char *)(*(void *)(v3 + 16) + 1));
  if (v4) {
    *a2 = v4;
  }
  else {
    *a3 = result;
  }
  return result;
}

uint64_t sub_24451A204(uint64_t a1, unint64_t a2)
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

uint64_t sub_24451A25C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for OnDiskConstraintConjunction.CodingKeys()
{
  return &type metadata for OnDiskConstraintConjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for OnDiskConstraintDisjunction.CodingKeys()
{
  return &type metadata for OnDiskConstraintDisjunction.CodingKeys;
}

uint64_t sub_24451A2F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24451A2FC(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LaunchConstraintConjunction.CodingKeys()
{
  return &type metadata for LaunchConstraintConjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for LaunchConstraintDisjunction.CodingKeys()
{
  return &type metadata for LaunchConstraintDisjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for ProcessConstraintConjunction.CodingKeys()
{
  return &type metadata for ProcessConstraintConjunction.CodingKeys;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintConjunctionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s27LightweightCodeRequirements27OnDiskConstraintConjunctionV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x24451A490);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessConstraintDisjunction.CodingKeys()
{
  return &type metadata for ProcessConstraintDisjunction.CodingKeys;
}

unint64_t sub_24451A4CC()
{
  unint64_t result = qword_268E79FF0;
  if (!qword_268E79FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79FF0);
  }
  return result;
}

unint64_t sub_24451A524()
{
  unint64_t result = qword_268E79FF8;
  if (!qword_268E79FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E79FF8);
  }
  return result;
}

unint64_t sub_24451A57C()
{
  unint64_t result = qword_268E7A000;
  if (!qword_268E7A000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A000);
  }
  return result;
}

unint64_t sub_24451A5D4()
{
  unint64_t result = qword_268E7A008;
  if (!qword_268E7A008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A008);
  }
  return result;
}

unint64_t sub_24451A62C()
{
  unint64_t result = qword_268E7A010;
  if (!qword_268E7A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A010);
  }
  return result;
}

unint64_t sub_24451A684()
{
  unint64_t result = qword_268E7A018;
  if (!qword_268E7A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A018);
  }
  return result;
}

unint64_t sub_24451A6DC()
{
  unint64_t result = qword_268E7A020;
  if (!qword_268E7A020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A020);
  }
  return result;
}

unint64_t sub_24451A734()
{
  unint64_t result = qword_268E7A028;
  if (!qword_268E7A028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A028);
  }
  return result;
}

unint64_t sub_24451A78C()
{
  unint64_t result = qword_268E7A030;
  if (!qword_268E7A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A030);
  }
  return result;
}

unint64_t sub_24451A7E4()
{
  unint64_t result = qword_268E7A038;
  if (!qword_268E7A038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A038);
  }
  return result;
}

unint64_t sub_24451A83C()
{
  unint64_t result = qword_268E7A040;
  if (!qword_268E7A040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A040);
  }
  return result;
}

unint64_t sub_24451A894()
{
  unint64_t result = qword_268E7A048;
  if (!qword_268E7A048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A048);
  }
  return result;
}

unint64_t sub_24451A8EC()
{
  unint64_t result = qword_268E7A050;
  if (!qword_268E7A050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A050);
  }
  return result;
}

unint64_t sub_24451A944()
{
  unint64_t result = qword_268E7A058;
  if (!qword_268E7A058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A058);
  }
  return result;
}

unint64_t sub_24451A99C()
{
  unint64_t result = qword_268E7A060;
  if (!qword_268E7A060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A060);
  }
  return result;
}

unint64_t sub_24451A9F4()
{
  unint64_t result = qword_268E7A068;
  if (!qword_268E7A068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A068);
  }
  return result;
}

unint64_t sub_24451AA4C()
{
  unint64_t result = qword_268E7A070;
  if (!qword_268E7A070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A070);
  }
  return result;
}

unint64_t sub_24451AAA4()
{
  unint64_t result = qword_268E7A078;
  if (!qword_268E7A078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A078);
  }
  return result;
}

uint64_t sub_24451AB54()
{
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = sub_24453A4C0();

    uint64_t v4 = sub_244538C74(v3);
    swift_bridgeObjectRelease();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_2445158CC(1936811378, 0xE400000000000000), (v6 & 1) != 0))
    {
      sub_24451A0A8(*(void *)(v4 + 56) + 40 * v5, (uint64_t)&v9);
      swift_bridgeObjectRelease();
      if (*((void *)&v10 + 1))
      {
        sub_244516C78(&v9, (uint64_t)v12);
        sub_244516C78(v12, (uint64_t)&v9);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
        swift_dynamicCast();
        return v8;
      }
    }
    else
    {
      uint64_t v11 = 0;
      long long v9 = 0u;
      long long v10 = 0u;
      swift_bridgeObjectRelease();
    }
    sub_24451A25C((uint64_t)&v9, &qword_268E7A168);
  }
  return MEMORY[0x263F8EE80];
}

uint64_t sub_24451ACB0(uint64_t a1, uint64_t a2, void (*a3)(_OWORD *__return_ptr, void, void), uint64_t a4, void (*a5)(_OWORD *__return_ptr, void, void))
{
  sub_244521710(a1, (uint64_t)v17);
  if (swift_dynamicCast())
  {
    a3(v17, (unsigned __int16)v15, *((void *)&v15 + 1));
    if (v5)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)a5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A158);
    swift_dynamicCast();
    a5 = (void (*)(_OWORD *__return_ptr, void, void))v15;
    if (!*(void *)(v15 + 16) || (unint64_t v10 = sub_2445158CC(1684955428, 0xE400000000000000), (v11 & 1) == 0))
    {
      memset(v17, 0, 32);
      sub_24451A25C((uint64_t)v17, &qword_268E7A160);
      swift_bridgeObjectRelease();
      return (uint64_t)a5;
    }
    sub_244521710(*(void *)(v15 + 56) + 32 * v10, (uint64_t)v17);
    sub_24451A25C((uint64_t)v17, &qword_268E7A160);
    if (*(void *)(v15 + 16) && (unint64_t v12 = sub_2445158CC(1684955428, 0xE400000000000000), (v13 & 1) != 0))
    {
      sub_244521710(*(void *)(v15 + 56) + 32 * v12, (uint64_t)&v15);
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (*((void *)&v16 + 1))
    {
      swift_bridgeObjectRelease();
      sub_24452176C(&v15, v17);
      swift_dynamicCast();
      return v14;
    }
  }
  else
  {
    sub_244521710(a1, (uint64_t)v17);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      a5(v17, (unsigned __int16)v15, *((void *)&v15 + 1));
      swift_bridgeObjectRelease();
      if (!v5)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A158);
        swift_dynamicCast();
        return v15;
      }
      return (uint64_t)a5;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24451AF1C(uint64_t a1, uint64_t a2)
{
  long long v12[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = self;
  sub_24451B154(a2);
  uint64_t v5 = (void *)sub_24453A4B0();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  id v6 = objc_msgSend(v4, sel_withVersion_withConstraintCategory_withRequirements_withError_, 1, a1, v5, v12);

  if (v6)
  {
    id v7 = v12[0];
    id v8 = objc_msgSend(v6, sel_externalRepresentation);
    uint64_t v9 = sub_24453A470();

    return v9;
  }
  else
  {
    id v11 = v12[0];
    sub_24453A450();

    swift_willThrow();
    v12[0] = 0;
    v12[1] = (id)0xE000000000000000;
    sub_24453A5F0();
    sub_24453A510();
    sub_24453A760();
    sub_24453A510();
    swift_bridgeObjectRelease();
    sub_24453A510();
    sub_24453A4D0();
    sub_24453A510();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24453A620();
    __break(1u);
  }
  return result;
}

uint64_t sub_24451B154(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A150);
    uint64_t v2 = sub_24453A660();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_244521710(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24452176C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24452176C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24452176C(v36, v37);
    sub_24452176C(v37, &v33);
    uint64_t result = sub_24453A5E0();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_24452176C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24451A074();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t ProcessCodeRequirement.dictionaryEncoding.getter()
{
  id v1 = v0;
  uint64_t v2 = v0[3];
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  uint64_t v5 = sub_24451ACB0((uint64_t)v7, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t ProcessCodeRequirement.dataEncoding.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_24451A204(v1, *(void *)(v0 + 48));
  return v1;
}

uint64_t static ProcessCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 24) = &type metadata for ProcessConstraintConjunction;
  *(void *)(a2 + 32) = sub_244513C60();
  *(_WORD *)a2 = 5141;
  *(void *)(a2 + 8) = v4;
  __int16 v10 = 5141;
  unint64_t v12 = &type metadata for ProcessConstraintConjunction;
  uint64_t v11 = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24451ACB0((uint64_t)&v10, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  uint64_t v7 = sub_24451AF1C(0, v5);
  uint64_t v9 = v8;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v9;
  return result;
}

uint64_t static ProcessCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 24) = &type metadata for ProcessConstraintDisjunction;
  *(void *)(a2 + 32) = sub_244513DD4();
  *(_WORD *)a2 = 7197;
  *(void *)(a2 + 8) = v4;
  __int16 v10 = 7197;
  unint64_t v12 = &type metadata for ProcessConstraintDisjunction;
  uint64_t v11 = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24451ACB0((uint64_t)&v10, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  uint64_t v7 = sub_24451AF1C(0, v5);
  uint64_t v9 = v8;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v9;
  return result;
}

uint64_t ProcessCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_244516BC0();
    swift_allocError();
    *uint64_t v5 = 2;
    swift_willThrow();
    return sub_24451BAC4(a1);
  }
  sub_24451A0A8(a1 + 24, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
  if (swift_dynamicCast())
  {
    unsigned int v7 = sub_24450DC58(v24, v25);
    if (v2) {
      return sub_24451BAC4(a1);
    }
    char v9 = v7;
    uint64_t v10 = v8;
    unsigned int v11 = v7 >> 8;
    *((void *)&v28 + 1) = &type metadata for ProcessConstraintConjunction;
    unint64_t v12 = sub_244513C60();
    LOBYTE(v27) = v9;
    BYTE1(v27) = v11;
    *(void *)&long long v29 = v12;
    *((void *)&v27 + 1) = v10;
    LOBYTE(v24) = v9;
    HIBYTE(v24) = v11;
    uint64_t v26 = &type metadata for ProcessConstraintConjunction;
    uint64_t v25 = v10;
    swift_bridgeObjectRetain();
LABEL_10:
    uint64_t v19 = sub_24451ACB0((uint64_t)&v24, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
    uint64_t v20 = sub_24451AF1C(0, v19);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *((void *)&v29 + 1) = v20;
    *(void *)(a2 + 48) = v22;
    long long v23 = v28;
    *(_OWORD *)a2 = v27;
    *(_OWORD *)(a2 + 16) = v23;
    *(_OWORD *)(a2 + 32) = v29;
    return sub_24451BAC4(a1);
  }
  sub_24451A0A8(a1 + 24, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    unsigned int v13 = sub_24450E26C(v24, v25);
    if (v2) {
      return sub_24451BAC4(a1);
    }
    char v15 = v13;
    uint64_t v16 = v14;
    unsigned int v17 = v13 >> 8;
    *((void *)&v28 + 1) = &type metadata for ProcessConstraintDisjunction;
    unint64_t v18 = sub_244513DD4();
    LOBYTE(v27) = v15;
    BYTE1(v27) = v17;
    *(void *)&long long v29 = v18;
    *((void *)&v27 + 1) = v16;
    LOBYTE(v24) = v15;
    HIBYTE(v24) = v17;
    uint64_t v26 = &type metadata for ProcessConstraintDisjunction;
    uint64_t v25 = v16;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  long long v23;
  unsigned __int16 v24;
  uint64_t v25;
  ValueMetadata *v26;
  long long v27;
  long long v28;
  long long v29;

  uint64_t v5 = a1 + 16;
  sub_24451A0A8(a1 + 16, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
  if (swift_dynamicCast())
  {
    uint64_t v6 = sub_24450E880(v24, v25);
    if (!v2)
    {
      uint64_t v8 = v6;
      char v9 = v7;
      uint64_t v10 = v6 >> 8;
      *((void *)&v28 + 1) = &type metadata for ProcessConstraintConjunction;
      unsigned int v11 = sub_244513C60();
      LOBYTE(v27) = v8;
      BYTE1(v27) = v10;
      *(void *)&long long v29 = v11;
      *((void *)&v27 + 1) = v9;
      LOBYTE(v24) = v8;
      HIBYTE(v24) = v10;
      uint64_t v26 = &type metadata for ProcessConstraintConjunction;
      uint64_t v25 = v9;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v19 = sub_24451ACB0((uint64_t)&v24, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      uint64_t v20 = sub_24451AF1C(0, v19);
      uint64_t v22 = v21;
      swift_bridgeObjectRelease();
      *((void *)&v29 + 1) = v20;
      *(void *)(a2 + 48) = v22;
      long long v23 = v28;
      *(_OWORD *)a2 = v27;
      *(_OWORD *)(a2 + 16) = v23;
      *(_OWORD *)(a2 + 32) = v29;
      return sub_24451BD50(a1);
    }
    return sub_24451BD50(a1);
  }
  sub_24451A0A8(v5, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    unsigned int v13 = sub_24450EFA0(v24, v25);
    if (!v2)
    {
      char v15 = v13;
      uint64_t v16 = v14;
      unsigned int v17 = v13 >> 8;
      *((void *)&v28 + 1) = &type metadata for ProcessConstraintDisjunction;
      unint64_t v18 = sub_244513DD4();
      LOBYTE(v27) = v15;
      BYTE1(v27) = v17;
      *(void *)&long long v29 = v18;
      *((void *)&v27 + 1) = v16;
      LOBYTE(v24) = v15;
      HIBYTE(v24) = v17;
      uint64_t v26 = &type metadata for ProcessConstraintDisjunction;
      uint64_t v25 = v16;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_24451BD50(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;
  __int16 v15;
  uint64_t v16;
  ValueMetadata *v17;
  long long v18;
  long long v19;
  long long v20;
  void v21[5];

  uint64_t v4 = sub_244538C74(a1);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  sub_244523B30(v5, v21);
  swift_bridgeObjectRelease();
  sub_24451A0A8((uint64_t)v21, (uint64_t)&v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
  if (swift_dynamicCast())
  {
    *((void *)&v19 + 1) = &type metadata for ProcessConstraintConjunction;
    unsigned int v7 = sub_244513C60();
    LOWORD(v18) = v15;
    *(void *)&uint64_t v20 = v7;
    *((void *)&v18 + 1) = v16;
    unsigned int v17 = &type metadata for ProcessConstraintConjunction;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_24451A0A8((uint64_t)v21, (uint64_t)&v18);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_244516BC0();
      swift_allocError();
      *uint64_t v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    }
    *((void *)&v19 + 1) = &type metadata for ProcessConstraintDisjunction;
    uint64_t v8 = sub_244513DD4();
    LOWORD(v18) = v15;
    *(void *)&uint64_t v20 = v8;
    *((void *)&v18 + 1) = v16;
    unsigned int v17 = &type metadata for ProcessConstraintDisjunction;
    swift_bridgeObjectRetain();
  }
  char v9 = sub_24451ACB0((uint64_t)&v15, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  unsigned int v11 = sub_24451AF1C(0, v9);
  unsigned int v13 = v12;
  swift_bridgeObjectRelease();
  *((void *)&v20 + 1) = v11;
  *(void *)(a2 + 48) = v13;
  uint64_t v14 = v19;
  *(_OWORD *)a2 = v18;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v20;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_24451BAC4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24451BD50(uint64_t a1)
{
  return a1;
}

uint64_t sub_24451BD88()
{
  return 1;
}

uint64_t sub_24451BD94()
{
  return sub_24453A500();
}

uint64_t sub_24451BDAC@<X0>(BOOL *a1@<X8>)
{
  return sub_24451EDFC(a1);
}

uint64_t sub_24451BDB8()
{
  return 0x65756C6176;
}

uint64_t sub_24451BDCC@<X0>(BOOL *a1@<X8>)
{
  return sub_24451EE70(a1);
}

void sub_24451BDD8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24451BDE4(uint64_t a1)
{
  unint64_t v2 = sub_24451C044();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24451BE20(uint64_t a1)
{
  unint64_t v2 = sub_24451C044();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProcessCodeRequirement.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A080);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24451C044();
  sub_24453A8F0();
  sub_24451A0A8(v2, (uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
  if (swift_dynamicCast())
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_2445142E0();
LABEL_5:
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  sub_24451A0A8(v2, (uint64_t)&v12);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_2445146BC();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

unint64_t sub_24451C044()
{
  unint64_t result = qword_268E7A088;
  if (!qword_268E7A088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A088);
  }
  return result;
}

uint64_t ProcessCodeRequirement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A090);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24451C044();
  sub_24453A8E0();
  if (!v2)
  {
    sub_24451428C();
    sub_24453A6C0();
    uint64_t v31 = a2;
    char v9 = v24;
    char v10 = BYTE1(v24);
    uint64_t v11 = *((void *)&v24 + 1);
    *((void *)&v25 + 1) = &type metadata for ProcessConstraintConjunction;
    unint64_t v12 = sub_244513C60();
    LOBYTE(v24) = v9;
    BYTE1(v24) = v10;
    *(void *)&long long v26 = v12;
    *((void *)&v24 + 1) = v11;
    v21[0] = v9;
    v21[1] = v10;
    long long v23 = &type metadata for ProcessConstraintConjunction;
    uint64_t v22 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_24451ACB0((uint64_t)v21, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    uint64_t v14 = sub_24451AF1C(0, v13);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *((void *)&v26 + 1) = v14;
    uint64_t v30 = v16;
    long long v27 = v24;
    long long v28 = v25;
    long long v29 = v26;
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    long long v17 = v28;
    unint64_t v18 = v31;
    *uint64_t v31 = v27;
    v18[1] = v17;
    v18[2] = v29;
    *((void *)v18 + 6) = v30;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void ProcessCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void v29[5] = *MEMORY[0x263EF8340];
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_24453A460();
  *(void *)&long long v25 = 0;
  id v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v25);

  if (!v9)
  {
    id v12 = (id)v25;
    sub_24453A450();

    swift_willThrow();
    sub_24451C7D8(a1, a2);
    return;
  }
  id v10 = (id)v25;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    sub_24451C7D8(a1, a2);

    return;
  }
  uint64_t v11 = sub_24451AB54();
  sub_244523B30(v11, v29);
  if (v3)
  {
    sub_24451C7D8(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRelease();
  sub_24451A0A8((uint64_t)v29, (uint64_t)&v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
  if (swift_dynamicCast())
  {
    *((void *)&v26 + 1) = &type metadata for ProcessConstraintConjunction;
    unint64_t v14 = sub_244513C60();
    LOWORD(v25) = v22;
    *(void *)&long long v27 = v14;
    *((void *)&v25 + 1) = v23;
    long long v24 = &type metadata for ProcessConstraintConjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24451ACB0((uint64_t)&v22, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
LABEL_12:
    uint64_t v18 = sub_24451AF1C(0, v15);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *((void *)&v27 + 1) = v18;
    uint64_t v28 = v20;
    *(void *)(a3 + 48) = v20;
    long long v21 = v26;
    *(_OWORD *)a3 = v25;
    *(_OWORD *)(a3 + 16) = v21;
    *(_OWORD *)(a3 + 32) = v27;
    goto LABEL_13;
  }
  sub_24451A0A8((uint64_t)v29, (uint64_t)&v25);
  if (swift_dynamicCast())
  {
    *((void *)&v26 + 1) = &type metadata for ProcessConstraintDisjunction;
    unint64_t v16 = sub_244513DD4();
    LOWORD(v25) = v22;
    *(void *)&long long v27 = v16;
    *((void *)&v25 + 1) = v23;
    long long v24 = &type metadata for ProcessConstraintDisjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24451ACB0((uint64_t)&v22, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5F8, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B5C4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_12;
  }
  sub_244516BC0();
  swift_allocError();
  *long long v17 = 1;
  swift_willThrow();
LABEL_13:

  sub_24451C7D8(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_24451C7D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24451CAB0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return ProcessCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_24451CAC8(void *a1)
{
  return ProcessCodeRequirement.encode(to:)(a1);
}

uint64_t LaunchCodeRequirement.dictionaryEncoding.getter()
{
  uint64_t v1 = (void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  uint64_t v5 = sub_24451ACB0((uint64_t)v7, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t LaunchCodeRequirement.dataEncoding.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24451A204(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

void LaunchCodeRequirement.constraintCategory.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

uint64_t static LaunchCodeRequirement.allOf(constraintCategory:requirement:)@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2();
  *(void *)(a3 + 16) = v5;
  *(void *)(a3 + 48) = &type metadata for LaunchConstraintConjunction;
  unint64_t v7 = sub_244513CDC();
  *(_WORD *)(a3 + 24) = 5141;
  *(void *)(a3 + 56) = v7;
  *(void *)(a3 + 32) = v6;
  __int16 v13 = 5141;
  uint64_t v15 = &type metadata for LaunchConstraintConjunction;
  uint64_t v14 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24451ACB0((uint64_t)&v13, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1(a3 + 24);
  }
  uint64_t v10 = sub_24451AF1C(v5, v8);
  uint64_t v12 = v11;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v12;
  return result;
}

uint64_t static LaunchCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 48) = &type metadata for LaunchConstraintConjunction;
  unint64_t v5 = sub_244513CDC();
  *(_WORD *)(a2 + 24) = 5141;
  *(void *)(a2 + 56) = v5;
  *(void *)(a2 + 32) = v4;
  __int16 v11 = 5141;
  __int16 v13 = &type metadata for LaunchConstraintConjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24451ACB0((uint64_t)&v11, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 24);
  }
  uint64_t v8 = sub_24451AF1C(0, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t static LaunchCodeRequirement.anyOf(constraintCategory:requirement:)@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2();
  *(void *)(a3 + 16) = v5;
  *(void *)(a3 + 48) = &type metadata for LaunchConstraintDisjunction;
  unint64_t v7 = sub_244513E50();
  *(_WORD *)(a3 + 24) = 7197;
  *(void *)(a3 + 56) = v7;
  *(void *)(a3 + 32) = v6;
  __int16 v13 = 7197;
  uint64_t v15 = &type metadata for LaunchConstraintDisjunction;
  uint64_t v14 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24451ACB0((uint64_t)&v13, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1(a3 + 24);
  }
  uint64_t v10 = sub_24451AF1C(v5, v8);
  uint64_t v12 = v11;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v12;
  return result;
}

uint64_t static LaunchCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 48) = &type metadata for LaunchConstraintDisjunction;
  unint64_t v5 = sub_244513E50();
  *(_WORD *)(a2 + 24) = 7197;
  *(void *)(a2 + 56) = v5;
  *(void *)(a2 + 32) = v4;
  __int16 v11 = 7197;
  __int16 v13 = &type metadata for LaunchConstraintDisjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24451ACB0((uint64_t)&v11, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 24);
  }
  uint64_t v8 = sub_24451AF1C(0, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t LaunchCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
  if (swift_dynamicCast())
  {
    unsigned int v5 = sub_24450F86C(v24, v25);
    if (!v2)
    {
      char v7 = v5;
      uint64_t v8 = v6;
      unsigned int v9 = v5 >> 8;
      *(void *)&long long v28 = 0;
      *(void *)&long long v30 = &type metadata for LaunchConstraintConjunction;
      unint64_t v10 = sub_244513CDC();
      BYTE8(v28) = v7;
      BYTE9(v28) = v9;
      *((void *)&v30 + 1) = v10;
      *(void *)&long long v29 = v8;
      LOBYTE(v24) = v7;
      HIBYTE(v24) = v9;
      long long v26 = &type metadata for LaunchConstraintConjunction;
      uint64_t v25 = v8;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v18 = sub_24451ACB0((uint64_t)&v24, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      uint64_t v19 = sub_24451AF1C(0, v18);
      uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      *(void *)&long long v27 = v19;
      *((void *)&v27 + 1) = v21;
      long long v22 = v30;
      a2[2] = v29;
      a2[3] = v22;
      long long v23 = v28;
      *a2 = v27;
      a2[1] = v23;
      return sub_2445204A8(a1);
    }
    return sub_2445204A8(a1);
  }
  sub_24451A0A8(a1, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    unsigned int v12 = sub_24450FE80(v24, v25);
    if (!v2)
    {
      char v14 = v12;
      uint64_t v15 = v13;
      unsigned int v16 = v12 >> 8;
      *(void *)&long long v28 = 0;
      *(void *)&long long v30 = &type metadata for LaunchConstraintDisjunction;
      unint64_t v17 = sub_244513E50();
      BYTE8(v28) = v14;
      BYTE9(v28) = v16;
      *((void *)&v30 + 1) = v17;
      *(void *)&long long v29 = v15;
      LOBYTE(v24) = v14;
      HIBYTE(v24) = v16;
      long long v26 = &type metadata for LaunchConstraintDisjunction;
      uint64_t v25 = v15;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_2445204A8(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  long long v23;
  long long v24;
  unsigned __int16 v25;
  uint64_t v26;
  ValueMetadata *v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;

  unsigned int v5 = a1 + 16;
  sub_24451A0A8(a1 + 16, (uint64_t)&v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
  if (swift_dynamicCast())
  {
    uint64_t v6 = sub_244510494(v25, v26);
    if (!v2)
    {
      uint64_t v8 = v6;
      unsigned int v9 = v7;
      unint64_t v10 = v6 >> 8;
      *(void *)&long long v29 = 0;
      *(void *)&uint64_t v31 = &type metadata for LaunchConstraintConjunction;
      __int16 v11 = sub_244513CDC();
      BYTE8(v29) = v8;
      BYTE9(v29) = v10;
      *((void *)&v31 + 1) = v11;
      *(void *)&long long v30 = v9;
      LOBYTE(v25) = v8;
      HIBYTE(v25) = v10;
      long long v27 = &type metadata for LaunchConstraintConjunction;
      long long v26 = v9;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v19 = sub_24451ACB0((uint64_t)&v25, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      uint64_t v20 = sub_24451AF1C(0, v19);
      long long v22 = v21;
      swift_bridgeObjectRelease();
      *(void *)&long long v28 = v20;
      *((void *)&v28 + 1) = v22;
      long long v23 = v31;
      a2[2] = v30;
      a2[3] = v23;
      unsigned __int16 v24 = v29;
      *a2 = v28;
      a2[1] = v24;
      return sub_24451BD50(a1);
    }
    return sub_24451BD50(a1);
  }
  sub_24451A0A8(v5, (uint64_t)&v28);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v13 = sub_244510BB4(v25, v26);
    if (!v2)
    {
      uint64_t v15 = v13;
      unsigned int v16 = v14;
      unint64_t v17 = v13 >> 8;
      *(void *)&long long v29 = 0;
      *(void *)&uint64_t v31 = &type metadata for LaunchConstraintDisjunction;
      uint64_t v18 = sub_244513E50();
      BYTE8(v29) = v15;
      BYTE9(v29) = v17;
      *((void *)&v31 + 1) = v18;
      *(void *)&long long v30 = v16;
      LOBYTE(v25) = v15;
      HIBYTE(v25) = v17;
      long long v27 = &type metadata for LaunchConstraintDisjunction;
      long long v26 = v16;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_24451BD50(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;
  long long v15;
  __int16 v16;
  uint64_t v17;
  ValueMetadata *v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  void v23[5];

  uint64_t v4 = sub_244538C74(a1);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  unsigned int v5 = v4;
  swift_bridgeObjectRelease();
  sub_244523D2C(v5, v23);
  swift_bridgeObjectRelease();
  sub_24451A0A8((uint64_t)v23, (uint64_t)&v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
  if (swift_dynamicCast())
  {
    *(void *)&uint64_t v20 = 0;
    *(void *)&long long v22 = &type metadata for LaunchConstraintConjunction;
    char v7 = sub_244513CDC();
    WORD4(v20) = v16;
    *((void *)&v22 + 1) = v7;
    *(void *)&uint64_t v21 = v17;
    uint64_t v18 = &type metadata for LaunchConstraintConjunction;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_24451A0A8((uint64_t)v23, (uint64_t)&v19);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_244516BC0();
      swift_allocError();
      *unint64_t v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }
    *(void *)&uint64_t v20 = 0;
    *(void *)&long long v22 = &type metadata for LaunchConstraintDisjunction;
    uint64_t v8 = sub_244513E50();
    WORD4(v20) = v16;
    *((void *)&v22 + 1) = v8;
    *(void *)&uint64_t v21 = v17;
    uint64_t v18 = &type metadata for LaunchConstraintDisjunction;
    swift_bridgeObjectRetain();
  }
  unsigned int v9 = sub_24451ACB0((uint64_t)&v16, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  __int16 v11 = sub_24451AF1C(0, v9);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  *(void *)&uint64_t v19 = v11;
  *((void *)&v19 + 1) = v13;
  char v14 = v22;
  a2[2] = v21;
  a2[3] = v14;
  uint64_t v15 = v20;
  *a2 = v19;
  a2[1] = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_24451D4E4(char *a1, char *a2)
{
  return sub_244523A5C(*a1, *a2);
}

uint64_t sub_24451D4F0()
{
  return sub_24453A8D0();
}

uint64_t sub_24451D574()
{
  sub_24453A500();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24451D5E4()
{
  return sub_24453A8D0();
}

uint64_t sub_24451D664@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24453A670();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24451D6C4(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x65756C6176;
  if (*v1) {
    unint64_t v2 = 0xD000000000000012;
  }
  unint64_t v3 = 0x8000000244540300;
  if (!*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_24451D704()
{
  if (*v0) {
    return 0xD000000000000012;
  }
  else {
    return 0x65756C6176;
  }
}

uint64_t sub_24451D740@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24453A670();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24451D7A4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24451D7B0(uint64_t a1)
{
  unint64_t v2 = sub_2445204D8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24451D7EC(uint64_t a1)
{
  unint64_t v2 = sub_2445204D8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LaunchCodeRequirement.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A098);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445204D8();
  sub_24453A8F0();
  uint64_t v13 = *(void *)(v3 + 16);
  LOBYTE(v11) = 1;
  sub_24452052C();
  sub_24453A730();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8(v3 + 24, (uint64_t)&v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
  if (swift_dynamicCast())
  {
    LOWORD(v13) = v11;
    uint64_t v14 = v12;
    LOBYTE(v11) = 0;
    sub_244514464();
LABEL_7:
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  sub_24451A0A8(v3 + 24, (uint64_t)&v13);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    LOWORD(v13) = v11;
    uint64_t v14 = v12;
    LOBYTE(v11) = 0;
    sub_244514790();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t LaunchCodeRequirement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A0B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445204D8();
  sub_24453A8E0();
  if (!v2)
  {
    v24[0] = 1;
    sub_244520580();
    sub_24453A6C0();
    uint64_t v10 = v27;
    v24[0] = 0;
    sub_244514410();
    sub_24453A6C0();
    uint64_t v35 = a2;
    uint64_t v11 = v10;
    LOBYTE(v10) = v27;
    char v12 = BYTE1(v27);
    uint64_t v13 = *((void *)&v27 + 1);
    uint64_t v23 = v11;
    *(void *)&long long v28 = v11;
    *(void *)&long long v30 = &type metadata for LaunchConstraintConjunction;
    unint64_t v14 = sub_244513CDC();
    BYTE8(v28) = v10;
    BYTE9(v28) = v12;
    *((void *)&v30 + 1) = v14;
    *(void *)&long long v29 = v13;
    v24[0] = v10;
    v24[1] = v12;
    long long v26 = &type metadata for LaunchConstraintConjunction;
    uint64_t v25 = v13;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24451ACB0((uint64_t)v24, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    uint64_t v16 = sub_24451AF1C(v23, v15);
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *(void *)&long long v27 = v16;
    *((void *)&v27 + 1) = v18;
    long long v33 = v29;
    long long v34 = v30;
    long long v31 = v27;
    long long v32 = v28;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v19 = v32;
    uint64_t v20 = v35;
    *uint64_t v35 = v31;
    v20[1] = v19;
    long long v21 = v34;
    v20[2] = v33;
    v20[3] = v21;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void LaunchCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  v33[5] = *MEMORY[0x263EF8340];
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_24453A460();
  *(void *)&long long v29 = 0;
  id v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v29);

  if (!v9)
  {
    id v12 = (id)v29;
    sub_24453A450();

    swift_willThrow();
    sub_24451C7D8(a1, a2);
    return;
  }
  id v10 = (id)v29;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    sub_24451C7D8(a1, a2);

    return;
  }
  uint64_t v11 = sub_24451AB54();
  sub_244523D2C(v11, v33);
  if (v3)
  {
    sub_24451C7D8(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v9, sel_constraintCategory);
  uint64_t v15 = (uint64_t)v14;
  if (v14 && v14 != (id)17 && v14 != (id)255) {
    __break(1u);
  }
  sub_24451A0A8((uint64_t)v33, (uint64_t)&v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
  if (swift_dynamicCast())
  {
    uint64_t v25 = v15;
    *(void *)&long long v30 = v15;
    *(void *)&long long v32 = &type metadata for LaunchConstraintConjunction;
    unint64_t v16 = sub_244513CDC();
    WORD4(v30) = v26;
    *((void *)&v32 + 1) = v16;
    *(void *)&long long v31 = v27;
    long long v28 = &type metadata for LaunchConstraintConjunction;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24451ACB0((uint64_t)&v26, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
LABEL_15:
    uint64_t v20 = sub_24451AF1C(v25, v17);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&long long v29 = v20;
    *((void *)&v29 + 1) = v22;
    long long v23 = v32;
    a3[2] = v31;
    a3[3] = v23;
    long long v24 = v30;
    *a3 = v29;
    a3[1] = v24;
    goto LABEL_16;
  }
  sub_24451A0A8((uint64_t)v33, (uint64_t)&v29);
  if (swift_dynamicCast())
  {
    uint64_t v25 = v15;
    *(void *)&long long v30 = v15;
    *(void *)&long long v32 = &type metadata for LaunchConstraintDisjunction;
    unint64_t v18 = sub_244513E50();
    WORD4(v30) = v26;
    *((void *)&v32 + 1) = v18;
    *(void *)&long long v31 = v27;
    long long v28 = &type metadata for LaunchConstraintDisjunction;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24451ACB0((uint64_t)&v26, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B84C, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B818);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
    goto LABEL_15;
  }
  sub_244516BC0();
  swift_allocError();
  *long long v19 = 1;
  swift_willThrow();
LABEL_16:

  sub_24451C7D8(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

uint64_t sub_24451E510@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return LaunchCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_24451E528(void *a1)
{
  return LaunchCodeRequirement.encode(to:)(a1);
}

uint64_t OnDiskCodeRequirement.dictionaryEncoding.getter()
{
  uint64_t v1 = (void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  uint64_t v5 = sub_24451ACB0((uint64_t)v7, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t OnDiskCodeRequirement.dataEncoding.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24451A204(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t static OnDiskCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 40) = &type metadata for OnDiskConstraintConjunction;
  unint64_t v5 = sub_244513D58();
  *(_WORD *)(a2 + 16) = 5141;
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + 24) = v4;
  __int16 v11 = 5141;
  uint64_t v13 = &type metadata for OnDiskConstraintConjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24451ACB0((uint64_t)&v11, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 16);
  }
  uint64_t v8 = sub_24451AF1C(0, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t static OnDiskCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 40) = &type metadata for OnDiskConstraintDisjunction;
  unint64_t v5 = sub_244513F38();
  *(_WORD *)(a2 + 16) = 7197;
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + 24) = v4;
  __int16 v11 = 7197;
  uint64_t v13 = &type metadata for OnDiskConstraintDisjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24451ACB0((uint64_t)&v11, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 16);
  }
  uint64_t v8 = sub_24451AF1C(0, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t OnDiskCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F60);
  if (swift_dynamicCast())
  {
    unsigned int v5 = sub_244512354(v24, v25);
    if (!v2)
    {
      char v7 = v5;
      uint64_t v8 = v6;
      unsigned int v9 = v5 >> 8;
      *((void *)&v29 + 1) = &type metadata for OnDiskConstraintConjunction;
      unint64_t v10 = sub_244513D58();
      LOBYTE(v28) = v7;
      BYTE1(v28) = v9;
      unint64_t v30 = v10;
      *((void *)&v28 + 1) = v8;
      LOBYTE(v24) = v7;
      HIBYTE(v24) = v9;
      __int16 v26 = &type metadata for OnDiskConstraintConjunction;
      uint64_t v25 = v8;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v18 = sub_24451ACB0((uint64_t)&v24, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      uint64_t v19 = sub_24451AF1C(0, v18);
      uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      *(void *)&long long v27 = v19;
      *((void *)&v27 + 1) = v21;
      long long v22 = v29;
      *(void *)(a2 + 48) = v30;
      long long v23 = v27;
      *(_OWORD *)(a2 + 16) = v28;
      *(_OWORD *)(a2 + 32) = v22;
      *(_OWORD *)a2 = v23;
      return sub_2445204A8(a1);
    }
    return sub_2445204A8(a1);
  }
  sub_24451A0A8(a1, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    unsigned int v12 = sub_244512A74(v24, v25);
    if (!v2)
    {
      char v14 = v12;
      uint64_t v15 = v13;
      unsigned int v16 = v12 >> 8;
      *((void *)&v29 + 1) = &type metadata for OnDiskConstraintDisjunction;
      unint64_t v17 = sub_244513F38();
      LOBYTE(v28) = v14;
      BYTE1(v28) = v16;
      unint64_t v30 = v17;
      *((void *)&v28 + 1) = v15;
      LOBYTE(v24) = v14;
      HIBYTE(v24) = v16;
      __int16 v26 = &type metadata for OnDiskConstraintDisjunction;
      uint64_t v25 = v15;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_2445204A8(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  unsigned char *v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  long long v23;
  long long v24;
  unsigned __int16 v25;
  uint64_t v26;
  ValueMetadata *v27;
  long long v28;
  long long v29;
  long long v30;
  unint64_t v31;

  if (*(void *)(a1 + 16))
  {
    sub_244516BC0();
    swift_allocError();
    *unsigned int v5 = 2;
    swift_willThrow();
    return sub_24451BAC4(a1);
  }
  sub_24451A0A8(a1 + 24, (uint64_t)&v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F70);
  if (swift_dynamicCast())
  {
    char v7 = sub_244511514(v25, v26);
    if (v2) {
      return sub_24451BAC4(a1);
    }
    unsigned int v9 = v7;
    unint64_t v10 = v8;
    __int16 v11 = v7 >> 8;
    *((void *)&v30 + 1) = &type metadata for OnDiskConstraintConjunction;
    unsigned int v12 = sub_244513D58();
    LOBYTE(v29) = v9;
    BYTE1(v29) = v11;
    long long v31 = v12;
    *((void *)&v29 + 1) = v10;
    LOBYTE(v25) = v9;
    HIBYTE(v25) = v11;
    long long v27 = &type metadata for OnDiskConstraintConjunction;
    __int16 v26 = v10;
    swift_bridgeObjectRetain();
LABEL_10:
    uint64_t v19 = sub_24451ACB0((uint64_t)&v25, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    uint64_t v20 = sub_24451AF1C(0, v19);
    long long v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&long long v28 = v20;
    *((void *)&v28 + 1) = v22;
    long long v23 = v30;
    *(void *)(a2 + 48) = v31;
    unsigned __int16 v24 = v28;
    *(_OWORD *)(a2 + 16) = v29;
    *(_OWORD *)(a2 + 32) = v23;
    *(_OWORD *)a2 = v24;
    return sub_24451BAC4(a1);
  }
  sub_24451A0A8(a1 + 24, (uint64_t)&v28);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v13 = sub_244511C34(v25, v26);
    if (v2) {
      return sub_24451BAC4(a1);
    }
    uint64_t v15 = v13;
    unsigned int v16 = v14;
    unint64_t v17 = v13 >> 8;
    *((void *)&v30 + 1) = &type metadata for OnDiskConstraintDisjunction;
    uint64_t v18 = sub_244513F38();
    LOBYTE(v29) = v15;
    BYTE1(v29) = v17;
    long long v31 = v18;
    *((void *)&v29 + 1) = v16;
    LOBYTE(v25) = v15;
    HIBYTE(v25) = v17;
    long long v27 = &type metadata for OnDiskConstraintDisjunction;
    __int16 v26 = v16;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;
  long long v15;
  __int16 v16;
  uint64_t v17;
  ValueMetadata *v18;
  long long v19;
  long long v20;
  long long v21;
  unint64_t v22;
  void v23[5];

  uint64_t v4 = sub_244538C74(a1);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  unsigned int v5 = v4;
  swift_bridgeObjectRelease();
  sub_244523F28(v5, v23);
  swift_bridgeObjectRelease();
  sub_24451A0A8((uint64_t)v23, (uint64_t)&v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
  if (swift_dynamicCast())
  {
    *((void *)&v21 + 1) = &type metadata for OnDiskConstraintConjunction;
    char v7 = sub_244513D58();
    LOWORD(v20) = v16;
    long long v22 = v7;
    *((void *)&v20 + 1) = v17;
    uint64_t v18 = &type metadata for OnDiskConstraintConjunction;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_24451A0A8((uint64_t)v23, (uint64_t)&v19);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_244516BC0();
      swift_allocError();
      *unint64_t v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }
    *((void *)&v21 + 1) = &type metadata for OnDiskConstraintDisjunction;
    uint64_t v8 = sub_244513F38();
    LOWORD(v20) = v16;
    long long v22 = v8;
    *((void *)&v20 + 1) = v17;
    uint64_t v18 = &type metadata for OnDiskConstraintDisjunction;
    swift_bridgeObjectRetain();
  }
  unsigned int v9 = sub_24451ACB0((uint64_t)&v16, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  __int16 v11 = sub_24451AF1C(0, v9);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  *(void *)&uint64_t v19 = v11;
  *((void *)&v19 + 1) = v13;
  char v14 = v21;
  *(void *)(a2 + 48) = v22;
  uint64_t v15 = v19;
  *(_OWORD *)(a2 + 16) = v20;
  *(_OWORD *)(a2 + 32) = v14;
  *(_OWORD *)a2 = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_24451ED54()
{
  return sub_24453A8D0();
}

uint64_t sub_24451EDA4()
{
  return sub_24453A8D0();
}

uint64_t sub_24451EDF0@<X0>(BOOL *a1@<X8>)
{
  return sub_24451EDFC(a1);
}

uint64_t sub_24451EDFC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_24453A670();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_24451EE4C(void *a1@<X8>)
{
  *a1 = 0x65756C6176;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_24451EE64@<X0>(BOOL *a1@<X8>)
{
  return sub_24451EE70(a1);
}

uint64_t sub_24451EE70@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_24453A670();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_24451EEC4(uint64_t a1)
{
  unint64_t v2 = sub_2445205D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24451EF00(uint64_t a1)
{
  unint64_t v2 = sub_2445205D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnDiskCodeRequirement.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A0C0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445205D4();
  sub_24453A8F0();
  sub_24451A0A8(v2 + 16, (uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
  if (swift_dynamicCast())
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_2445145E8();
LABEL_5:
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  sub_24451A0A8(v2 + 16, (uint64_t)&v12);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_244514864();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t OnDiskCodeRequirement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A0D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445205D4();
  sub_24453A8E0();
  if (!v2)
  {
    sub_244514594();
    sub_24453A6C0();
    long long v32 = a2;
    char v9 = v24;
    char v10 = BYTE1(v24);
    uint64_t v11 = *((void *)&v24 + 1);
    *((void *)&v26 + 1) = &type metadata for OnDiskConstraintConjunction;
    unint64_t v12 = sub_244513D58();
    LOBYTE(v25) = v9;
    BYTE1(v25) = v10;
    unint64_t v27 = v12;
    *((void *)&v25 + 1) = v11;
    v21[0] = v9;
    v21[1] = v10;
    long long v23 = &type metadata for OnDiskConstraintConjunction;
    uint64_t v22 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_24451ACB0((uint64_t)v21, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    uint64_t v14 = sub_24451AF1C(0, v13);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *(void *)&long long v24 = v14;
    *((void *)&v24 + 1) = v16;
    unint64_t v31 = v27;
    long long v29 = v25;
    long long v30 = v26;
    long long v28 = v24;
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    long long v17 = v29;
    uint64_t v18 = v32;
    _OWORD *v32 = v28;
    v18[1] = v17;
    v18[2] = v30;
    *((void *)v18 + 6) = v31;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void OnDiskCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v30[5] = *MEMORY[0x263EF8340];
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_24453A460();
  *(void *)&long long v26 = 0;
  id v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v26);

  if (!v9)
  {
    id v12 = (id)v26;
    sub_24453A450();

    swift_willThrow();
    sub_24451C7D8(a1, a2);
    return;
  }
  id v10 = (id)v26;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    sub_24451C7D8(a1, a2);

    return;
  }
  uint64_t v11 = sub_24451AB54();
  sub_244523F28(v11, v30);
  if (v3)
  {
    sub_24451C7D8(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRelease();
  sub_24451A0A8((uint64_t)v30, (uint64_t)&v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F78);
  if (swift_dynamicCast())
  {
    *((void *)&v28 + 1) = &type metadata for OnDiskConstraintConjunction;
    unint64_t v14 = sub_244513D58();
    LOWORD(v27) = v23;
    unint64_t v29 = v14;
    *((void *)&v27 + 1) = v24;
    long long v25 = &type metadata for OnDiskConstraintConjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24451ACB0((uint64_t)&v23, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
LABEL_12:
    uint64_t v18 = sub_24451AF1C(0, v15);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *(void *)&long long v26 = v18;
    *((void *)&v26 + 1) = v20;
    long long v21 = v28;
    *(void *)(a3 + 48) = v29;
    long long v22 = v26;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = v21;
    *(_OWORD *)a3 = v22;
    goto LABEL_13;
  }
  sub_24451A0A8((uint64_t)v30, (uint64_t)&v26);
  if (swift_dynamicCast())
  {
    *((void *)&v28 + 1) = &type metadata for OnDiskConstraintDisjunction;
    unint64_t v16 = sub_244513F38();
    LOWORD(v27) = v23;
    unint64_t v29 = v16;
    *((void *)&v27 + 1) = v24;
    long long v25 = &type metadata for OnDiskConstraintDisjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24451ACB0((uint64_t)&v23, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7E4, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, void, void))sub_24450B7B0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    goto LABEL_12;
  }
  sub_244516BC0();
  swift_allocError();
  *long long v17 = 1;
  swift_willThrow();
LABEL_13:

  sub_24451C7D8(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
}

uint64_t sub_24451FB18@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnDiskCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_24451FB30(void *a1)
{
  return OnDiskCodeRequirement.encode(to:)(a1);
}

uint64_t sub_24451FB50@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_24451A204(a2, a3);
      id v10 = (char *)sub_24453A420();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_24453A440();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_24453A430();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x24451FDB4);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_24451C7D8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      long long v17 = (char *)sub_24453A420();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_24453A440();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_24453A430();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_24451FDC4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_24451A204(a1, a2);
      char v5 = sub_24451FFF4((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_24451C7D8(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_24451FFF4(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_24451C7D8(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_24451FB50((uint64_t)__s1, a3, a4, &v14);
      sub_24451C7D8(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_24451FFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_24453A420();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_24453A440();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_24453A430();
  sub_24451FB50(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t _s27LightweightCodeRequirements06LaunchB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x2445201E0);
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      switch(v5 >> 62)
      {
        case 1uLL:
          LODWORD(v10) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4)) {
            goto LABEL_20;
          }
          uint64_t v10 = (int)v10;
LABEL_11:
          if (v6 == v10)
          {
            if (v6 < 1)
            {
              char v13 = 1;
            }
            else
            {
              sub_24451A204(*(void *)a2, *(void *)(a2 + 8));
              char v13 = sub_24451FDC4(v2, v3, v4, v5);
            }
          }
          else
          {
            char v13 = 0;
          }
          return v13 & 1;
        case 2uLL:
          uint64_t v12 = *(void *)(v4 + 16);
          uint64_t v11 = *(void *)(v4 + 24);
          BOOL v9 = __OFSUB__(v11, v12);
          uint64_t v10 = v11 - v12;
          if (!v9) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v13 = v6 == 0;
          return v13 & 1;
        default:
          uint64_t v10 = BYTE6(v5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v8 = *(void *)(v2 + 16);
      uint64_t v7 = *(void *)(v2 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v6 = BYTE6(v3);
      goto LABEL_6;
  }
}

uint64_t _s27LightweightCodeRequirements06OnDiskB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x244520334);
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      switch(v5 >> 62)
      {
        case 1uLL:
          LODWORD(v10) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4)) {
            goto LABEL_20;
          }
          uint64_t v10 = (int)v10;
LABEL_11:
          if (v6 == v10)
          {
            if (v6 < 1)
            {
              char v13 = 1;
            }
            else
            {
              sub_24451A204(*(void *)a2, *(void *)(a2 + 8));
              char v13 = sub_24451FDC4(v2, v3, v4, v5);
            }
          }
          else
          {
            char v13 = 0;
          }
          return v13 & 1;
        case 2uLL:
          uint64_t v12 = *(void *)(v4 + 16);
          uint64_t v11 = *(void *)(v4 + 24);
          BOOL v9 = __OFSUB__(v11, v12);
          uint64_t v10 = v11 - v12;
          if (!v9) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v13 = v6 == 0;
          return v13 & 1;
        default:
          uint64_t v10 = BYTE6(v5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v8 = *(void *)(v2 + 16);
      uint64_t v7 = *(void *)(v2 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v6 = BYTE6(v3);
      goto LABEL_6;
  }
}

uint64_t _s27LightweightCodeRequirements07ProcessB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a2 + 40);
  unint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x244520488);
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      switch(v5 >> 62)
      {
        case 1uLL:
          LODWORD(v10) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4)) {
            goto LABEL_20;
          }
          uint64_t v10 = (int)v10;
LABEL_11:
          if (v6 == v10)
          {
            if (v6 < 1)
            {
              char v13 = 1;
            }
            else
            {
              sub_24451A204(*(void *)(a2 + 40), *(void *)(a2 + 48));
              char v13 = sub_24451FDC4(v2, v3, v4, v5);
            }
          }
          else
          {
            char v13 = 0;
          }
          return v13 & 1;
        case 2uLL:
          uint64_t v12 = *(void *)(v4 + 16);
          uint64_t v11 = *(void *)(v4 + 24);
          BOOL v9 = __OFSUB__(v11, v12);
          uint64_t v10 = v11 - v12;
          if (!v9) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v13 = v6 == 0;
          return v13 & 1;
        default:
          uint64_t v10 = BYTE6(v5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v8 = *(void *)(v2 + 16);
      uint64_t v7 = *(void *)(v2 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v6 = BYTE6(v3);
      goto LABEL_6;
  }
}

uint64_t sub_2445204A8(uint64_t a1)
{
  return a1;
}

unint64_t sub_2445204D8()
{
  unint64_t result = qword_268E7A0A0;
  if (!qword_268E7A0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0A0);
  }
  return result;
}

unint64_t sub_24452052C()
{
  unint64_t result = qword_268E7A0A8;
  if (!qword_268E7A0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0A8);
  }
  return result;
}

unint64_t sub_244520580()
{
  unint64_t result = qword_268E7A0B8;
  if (!qword_268E7A0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0B8);
  }
  return result;
}

unint64_t sub_2445205D4()
{
  unint64_t result = qword_268E7A0C8;
  if (!qword_268E7A0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0C8);
  }
  return result;
}

unint64_t sub_24452062C()
{
  unint64_t result = qword_268E7A0D8;
  if (!qword_268E7A0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0D8);
  }
  return result;
}

unint64_t sub_244520684()
{
  unint64_t result = qword_268E7A0E0;
  if (!qword_268E7A0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0E0);
  }
  return result;
}

unint64_t sub_2445206DC()
{
  unint64_t result = qword_268E7A0E8;
  if (!qword_268E7A0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0E8);
  }
  return result;
}

unint64_t sub_244520734()
{
  unint64_t result = qword_268E7A0F0;
  if (!qword_268E7A0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0F0);
  }
  return result;
}

unint64_t sub_24452078C()
{
  unint64_t result = qword_268E7A0F8;
  if (!qword_268E7A0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A0F8);
  }
  return result;
}

unint64_t sub_2445207E4()
{
  unint64_t result = qword_268E7A100;
  if (!qword_268E7A100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A100);
  }
  return result;
}

uint64_t destroy for ProcessCodeRequirement(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(a1 + 48);

  return sub_24451C7D8(v2, v3);
}

uint64_t initializeWithCopy for ProcessCodeRequirement(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v6 = *(void *)(a2 + 40);
  unint64_t v5 = *(void *)(a2 + 48);
  sub_24451A204(v6, v5);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v5;
  return a1;
}

uint64_t *assignWithCopy for ProcessCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v5 = a2[5];
  unint64_t v4 = a2[6];
  sub_24451A204(v5, v4);
  uint64_t v6 = a1[5];
  unint64_t v7 = a1[6];
  a1[5] = v5;
  a1[6] = v4;
  sub_24451C7D8(v6, v7);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
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
        *unint64_t v3 = v12;
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
          void *result = *a2;
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
          *unint64_t v3 = *a2;
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

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ProcessCodeRequirement(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v6 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_24451C7D8(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessCodeRequirement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeRequirement()
{
  return &type metadata for ProcessCodeRequirement;
}

uint64_t initializeBufferWithCopyOfBuffer for LaunchCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LaunchCodeRequirement(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
}

uint64_t initializeWithCopy for LaunchCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_24451A204(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 24, a2 + 24);
  return a1;
}

uint64_t *assignWithCopy for LaunchCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24451A204(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_24451C7D8(v6, v7);
  a1[2] = a2[2];
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  return a1;
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

uint64_t assignWithTake for LaunchCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_24451C7D8(v4, v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchCodeRequirement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeRequirement()
{
  return &type metadata for LaunchCodeRequirement;
}

uint64_t destroy for OnDiskCodeRequirement(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for OnDiskCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_24451A204(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  return a1;
}

uint64_t *assignWithCopy for OnDiskCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24451A204(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_24451C7D8(v6, v7);
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t assignWithTake for OnDiskCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_24451C7D8(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnDiskCodeRequirement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OnDiskCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnDiskCodeRequirement()
{
  return &type metadata for OnDiskCodeRequirement;
}

uint64_t sub_24452111C()
{
  return 0;
}

ValueMetadata *type metadata accessor for OnDiskCodeRequirement.CodingKeys()
{
  return &type metadata for OnDiskCodeRequirement.CodingKeys;
}

uint64_t getEnumTagSinglePayload for LaunchCodeRequirement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LaunchCodeRequirement.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x244521290);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_2445212B8(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeRequirement.CodingKeys()
{
  return &type metadata for LaunchCodeRequirement.CodingKeys;
}

uint64_t _s27LightweightCodeRequirements21OnDiskCodeRequirementV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s27LightweightCodeRequirements21OnDiskCodeRequirementV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2445213C0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeRequirement.CodingKeys()
{
  return &type metadata for ProcessCodeRequirement.CodingKeys;
}

unint64_t sub_2445213FC()
{
  unint64_t result = qword_268E7A108;
  if (!qword_268E7A108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A108);
  }
  return result;
}

unint64_t sub_244521454()
{
  unint64_t result = qword_268E7A110;
  if (!qword_268E7A110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A110);
  }
  return result;
}

unint64_t sub_2445214AC()
{
  unint64_t result = qword_268E7A118;
  if (!qword_268E7A118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A118);
  }
  return result;
}

unint64_t sub_244521504()
{
  unint64_t result = qword_268E7A120;
  if (!qword_268E7A120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A120);
  }
  return result;
}

unint64_t sub_24452155C()
{
  unint64_t result = qword_268E7A128;
  if (!qword_268E7A128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A128);
  }
  return result;
}

unint64_t sub_2445215B4()
{
  unint64_t result = qword_268E7A130;
  if (!qword_268E7A130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A130);
  }
  return result;
}

unint64_t sub_24452160C()
{
  unint64_t result = qword_268E7A138;
  if (!qword_268E7A138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A138);
  }
  return result;
}

unint64_t sub_244521664()
{
  unint64_t result = qword_268E7A140;
  if (!qword_268E7A140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A140);
  }
  return result;
}

unint64_t sub_2445216BC()
{
  unint64_t result = qword_268E7A148;
  if (!qword_268E7A148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A148);
  }
  return result;
}

uint64_t sub_244521710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_24452176C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_244521784@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_244537D7C(a1);
  if (v6) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    *(void *)(a2 + 48) = 0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  else
  {
    v8[0] = sub_244537E04((uint64_t)v9, result, v5, 0, a1);
    v8[1] = v7;
    *(void *)a2 = v8[0];
    *(void *)(a2 + 8) = v7;
    sub_24451A0A8((uint64_t)v9, a2 + 16);
    swift_bridgeObjectRetain();
    return sub_2445382BC((uint64_t)v8);
  }
  return result;
}

void *sub_24452184C(uint64_t a1)
{
  uint64_t result = (void *)sub_244537D7C(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_244537E94(&v5, (uint64_t)result, v3, 0, a1);
  }
}

uint64_t sub_2445218D8(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *), uint64_t *a3, uint64_t *a4, void (*a5)(unint64_t, char *, void **, uint64_t, uint64_t))
{
  void (*v56)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *);
  void v57[3];
  uint64_t v58;
  uint64_t v59;
  long long v60;
  _OWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;

  uint64_t v55 = a5;
  unint64_t v50 = a3;
  uint64_t v56 = a2;
  v68 = (void *)MEMORY[0x263F8EE78];
  sub_24451A0A8(a1, (uint64_t)&v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
    sub_24451A0A8(a1, (uint64_t)&v63);
    uint64_t v54 = (long long *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E79F30);
    if (swift_dynamicCast())
    {
      uint64_t v49 = a4;
      uint64_t v34 = *(void *)(v60 + 16);
      if (v34)
      {
        uint64_t v53 = (_OWORD *)v60;
        uint64_t v35 = v60 + 32;
        while (1)
        {
          sub_24451A0A8(v35, (uint64_t)&v63);
          if (!swift_dynamicCast()) {
            goto LABEL_54;
          }
          uint64_t v36 = v60;
          if (*(void *)(v60 + 16) != 2
            || (sub_24451A0A8(v60 + 32, (uint64_t)&v63), uint64_t result = swift_dynamicCast(), (result & 1) == 0))
          {
            swift_bridgeObjectRelease();
LABEL_54:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_244516BC0();
            swift_allocError();
            *uint64_t v47 = 1;
            return swift_willThrow();
          }
          if (*(void *)(v36 + 16) < 2uLL) {
            goto LABEL_59;
          }
          long long v37 = v60;
          sub_24451A0A8(v36 + 72, (uint64_t)&v60);
          swift_bridgeObjectRelease();
          v56(&v63, v37, *((void *)&v37 + 1), &v60);
          if (v5) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
          swift_bridgeObjectRelease();
          uint64_t v38 = v68;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            uint64_t v38 = sub_244531FE8(0, v38[2] + 1, 1, v38, v50, v49);
            v68 = v38;
          }
          unint64_t v40 = v38[2];
          unint64_t v39 = v38[3];
          if (v40 >= v39 >> 1) {
            v68 = sub_244531FE8((void *)(v39 > 1), v40 + 1, 1, v38, v50, v49);
          }
          uint64_t v41 = v66;
          uint64_t v42 = v67;
          uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v63, v66);
          MEMORY[0x270FA5388](v43);
          uint64_t v45 = (char *)&v48 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *))(v46 + 16))(v45);
          v55(v40, v45, &v68, v41, v42);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v63);
          v35 += 40;
          if (!--v34) {
            goto LABEL_56;
          }
        }
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
LABEL_56:
      swift_bridgeObjectRelease();
    }
    return (uint64_t)v68;
  }
  uint64_t v49 = a4;
  int64_t v9 = 0;
  uint64_t v10 = v60;
  uint64_t v11 = *(void *)(v60 + 64);
  uint64_t v51 = v60 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v60 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  uint64_t v53 = v61;
  uint64_t v54 = (long long *)&v65;
  int64_t v52 = (unint64_t)(v12 + 63) >> 6;
  int64_t v48 = v52 - 1;
  if ((v13 & v11) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v15 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  unint64_t v16 = v15 | (v9 << 6);
LABEL_6:
  uint64_t v17 = *(void *)(v10 + 56);
  uint64_t v18 = (void *)(*(void *)(v10 + 48) + 16 * v16);
  uint64_t v19 = v18[1];
  *(void *)&long long v60 = *v18;
  *((void *)&v60 + 1) = v19;
  sub_24451A0A8(v17 + 40 * v16, (uint64_t)v53);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_244519F7C((uint64_t)&v60, (uint64_t)&v63);
    uint64_t v22 = v64;
    if (!v64)
    {
      swift_release();
      return (uint64_t)v68;
    }
    uint64_t v23 = v63;
    sub_244516C78(v54, (uint64_t)&v60);
    v56(v57, v23, v22, &v60);
    swift_bridgeObjectRelease();
    if (v5)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    char v24 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v24 = sub_244531FE8(0, v24[2] + 1, 1, v24, v50, v49);
      v68 = v24;
    }
    unint64_t v26 = v24[2];
    unint64_t v25 = v24[3];
    if (v26 >= v25 >> 1) {
      v68 = sub_244531FE8((void *)(v25 > 1), v26 + 1, 1, v24, v50, v49);
    }
    uint64_t v27 = v58;
    uint64_t v28 = v59;
    uint64_t v29 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v58);
    MEMORY[0x270FA5388](v29);
    uint64_t v31 = (char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v32 + 16))(v31);
    v55(v26, v31, &v68, v27, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    if (v14) {
      goto LABEL_5;
    }
LABEL_7:
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v20 < v52)
    {
      unint64_t v21 = *(void *)(v51 + 8 * v20);
      if (v21) {
        goto LABEL_10;
      }
      v9 += 2;
      if (v20 + 1 >= v52)
      {
        int64_t v9 = v20;
      }
      else
      {
        unint64_t v21 = *(void *)(v51 + 8 * v9);
        if (v21)
        {
          ++v20;
          goto LABEL_10;
        }
        if (v20 + 2 < v52)
        {
          unint64_t v21 = *(void *)(v51 + 8 * (v20 + 2));
          if (v21)
          {
            v20 += 2;
            goto LABEL_10;
          }
          int64_t v33 = v20 + 3;
          if (v20 + 3 < v52)
          {
            unint64_t v21 = *(void *)(v51 + 8 * v33);
            if (!v21)
            {
              while (1)
              {
                int64_t v20 = v33 + 1;
                if (__OFADD__(v33, 1)) {
                  goto LABEL_60;
                }
                if (v20 >= v52)
                {
                  int64_t v9 = v48;
                  goto LABEL_15;
                }
                unint64_t v21 = *(void *)(v51 + 8 * v20);
                ++v33;
                if (v21) {
                  goto LABEL_10;
                }
              }
            }
            v20 += 3;
LABEL_10:
            unint64_t v14 = (v21 - 1) & v21;
            unint64_t v16 = __clz(__rbit64(v21)) + (v20 << 6);
            int64_t v9 = v20;
            goto LABEL_6;
          }
          int64_t v9 = v20 + 2;
        }
      }
    }
LABEL_15:
    unint64_t v14 = 0;
    unint64_t v62 = 0;
    memset(v61, 0, sizeof(v61));
    long long v60 = 0u;
  }
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_244522064@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  switch(sub_244539F98())
  {
    case 0u:
      unint64_t result = sub_2445316F8(a1);
      if (!v2)
      {
        char v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_2445177D4();
        unint64_t result = swift_allocObject();
        *a2 = result;
        *(unsigned char *)(result + 16) = 0;
        goto LABEL_35;
      }
      return result;
    case 1u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_244517780();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = v12 + 16;
      *a2 = v12;
      char v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for ProcessCodeSigningFlags;
      a2[4] = sub_2445176F4();
      uint64_t v15 = swift_allocObject();
      *a2 = v15;
      unint64_t result = sub_244527A90((uint64_t)v25, v15 + 16);
      goto LABEL_37;
    case 3u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_2445176A0();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 3;
      goto LABEL_34;
    case 4u:
      sub_24451A0A8(a1, (uint64_t)v25);
      unint64_t result = sub_244537F28((uint64_t)v25);
      if (!v2)
      {
        unint64_t v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        unint64_t result = sub_24453831C(&qword_268E79D00);
        a2[4] = result;
        *a2 = v17;
      }
      return result;
    case 5u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_24451764C();
      uint64_t v18 = swift_allocObject();
      uint64_t v13 = v18 + 16;
      *a2 = v18;
      char v14 = 5;
LABEL_16:
      unint64_t result = sub_24452A874((uint64_t)v25, v14, v13);
      goto LABEL_37;
    case 6u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_2445175F8();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 6;
      goto LABEL_34;
    case 7u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsInitProcess;
      a2[4] = sub_2445175A4();
      unint64_t result = swift_allocObject();
      *a2 = result;
      *(unsigned char *)(result + 16) = 7;
      goto LABEL_35;
    case 9u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_244517550();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 9;
      goto LABEL_34;
    case 0xBu:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_2445174FC();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 11;
      goto LABEL_34;
    case 0xCu:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_2445174A8();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 12;
      goto LABEL_34;
    case 0xDu:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_244517454();
      uint64_t v19 = swift_allocObject();
      *a2 = v19;
      unint64_t result = sub_24452FD58((uint64_t)v25, 13, v19 + 16);
      goto LABEL_37;
    case 0xEu:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_2445173AC();
      uint64_t v20 = swift_allocObject();
      *a2 = v20;
      unint64_t result = sub_24452EC84((uint64_t)v25, v20 + 16);
      goto LABEL_37;
    case 0xFu:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_244517400();
      uint64_t v21 = swift_allocObject();
      *a2 = v21;
      unint64_t result = sub_24452DE94((uint64_t)v25, v21 + 16);
      goto LABEL_37;
    case 0x10u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_244517358();
      uint64_t v22 = swift_allocObject();
      *a2 = v22;
      unint64_t result = sub_24452FD58((uint64_t)v25, 16, v22 + 16);
      goto LABEL_37;
    case 0x11u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_244517304();
      uint64_t v23 = swift_allocObject();
      *a2 = v23;
      unint64_t result = sub_24452FD58((uint64_t)v25, 17, v23 + 16);
      goto LABEL_37;
    case 0x12u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for TeamIdentifierMatchesCurrentProcess;
      a2[4] = sub_2445172B0();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 18;
LABEL_34:
      *(unsigned char *)(result + 16) = v16;
LABEL_35:
      *(void *)(result + 48) = MEMORY[0x263F8D4F8];
      *(void *)(result + 56) = &off_26F92CAE0;
      *(unsigned char *)(result + 24) = v11 & 1;
      return result;
    case 0x13u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_244517224();
      uint64_t v24 = swift_allocObject();
      *a2 = v24;
      unint64_t result = sub_244531264((uint64_t)v25, v24 + 16);
LABEL_37:
      if (v2) {
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      }
      return result;
    case 0x14u:
    case 0x15u:
      sub_24451A0A8(a1, (uint64_t)v25);
      uint64_t v5 = sub_2445218D8((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_244522064, &qword_268E7A170, &qword_268E79F60, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for ProcessConstraintConjunction;
      unint64_t result = sub_244513C60();
      a2[4] = result;
      __int16 v8 = 5141;
      goto LABEL_40;
    case 0x1Cu:
    case 0x1Du:
      sub_24451A0A8(a1, (uint64_t)v25);
      uint64_t v9 = sub_2445218D8((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_244522064, &qword_268E7A170, &qword_268E79F60, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for ProcessConstraintDisjunction;
      unint64_t result = sub_244513DD4();
      a2[4] = result;
      __int16 v8 = 7197;
LABEL_40:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v10 = 1;
      return swift_willThrow();
  }
}

unint64_t sub_244522858@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  switch(sub_244539F98())
  {
    case 0u:
      unint64_t result = sub_2445316F8(a1);
      if (!v2)
      {
        char v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_244518D88();
        unint64_t result = swift_allocObject();
        *a2 = result;
        *(unsigned char *)(result + 16) = 0;
        goto LABEL_29;
      }
      return result;
    case 1u:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_244518D34();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = v12 + 16;
      *a2 = v12;
      char v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for ProcessCodeSigningFlags;
      a2[4] = sub_244518CE0();
      uint64_t v15 = swift_allocObject();
      *a2 = v15;
      unint64_t result = sub_244527A90((uint64_t)v26, v15 + 16);
      goto LABEL_36;
    case 3u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_244518C8C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 3;
      goto LABEL_28;
    case 4u:
      sub_24451A0A8(a1, (uint64_t)v26);
      unint64_t result = sub_244537F28((uint64_t)v26);
      if (!v2)
      {
        unint64_t v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        unint64_t result = sub_24453831C(&qword_268E79DD0);
        a2[4] = result;
        *a2 = v17;
      }
      return result;
    case 5u:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_244518C38();
      uint64_t v18 = swift_allocObject();
      uint64_t v13 = v18 + 16;
      *a2 = v18;
      char v14 = 5;
LABEL_16:
      unint64_t result = sub_24452A874((uint64_t)v26, v14, v13);
      goto LABEL_36;
    case 6u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_244518BE4();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 6;
      goto LABEL_28;
    case 7u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsInitProcess;
      a2[4] = sub_244518B90();
      unint64_t result = swift_allocObject();
      *a2 = result;
      *(unsigned char *)(result + 16) = 7;
      goto LABEL_29;
    case 9u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_244518B3C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 9;
      goto LABEL_28;
    case 0xAu:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for LaunchType;
      a2[4] = sub_244518AE8();
      uint64_t v19 = swift_allocObject();
      *a2 = v19;
      unint64_t result = sub_24452C4B8((uint64_t)v26, v19 + 16);
      goto LABEL_36;
    case 0xBu:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_244518A94();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 11;
      goto LABEL_28;
    case 0xCu:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_244518A40();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 12;
LABEL_28:
      *(unsigned char *)(result + 16) = v16;
LABEL_29:
      *(void *)(result + 48) = MEMORY[0x263F8D4F8];
      *(void *)(result + 56) = &off_26F92CAE0;
      *(unsigned char *)(result + 24) = v11 & 1;
      return result;
    case 0xDu:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_2445189EC();
      uint64_t v20 = swift_allocObject();
      *a2 = v20;
      unint64_t result = sub_24452FD58((uint64_t)v26, 13, v20 + 16);
      goto LABEL_36;
    case 0xEu:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_244518944();
      uint64_t v21 = swift_allocObject();
      *a2 = v21;
      unint64_t result = sub_24452EC84((uint64_t)v26, v21 + 16);
      goto LABEL_36;
    case 0xFu:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_244518998();
      uint64_t v22 = swift_allocObject();
      *a2 = v22;
      unint64_t result = sub_24452DE94((uint64_t)v26, v22 + 16);
      goto LABEL_36;
    case 0x10u:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_2445188F0();
      uint64_t v23 = swift_allocObject();
      *a2 = v23;
      unint64_t result = sub_24452FD58((uint64_t)v26, 16, v23 + 16);
      goto LABEL_36;
    case 0x11u:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_24451889C();
      uint64_t v24 = swift_allocObject();
      *a2 = v24;
      unint64_t result = sub_24452FD58((uint64_t)v26, 17, v24 + 16);
      goto LABEL_36;
    case 0x13u:
      sub_24451A0A8(a1, (uint64_t)v26);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_244518848();
      uint64_t v25 = swift_allocObject();
      *a2 = v25;
      unint64_t result = sub_244531264((uint64_t)v26, v25 + 16);
LABEL_36:
      if (v2) {
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      }
      return result;
    case 0x14u:
    case 0x15u:
      sub_24451A0A8(a1, (uint64_t)v26);
      uint64_t v5 = sub_2445218D8((uint64_t)v26, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_244522858, &qword_268E7A178, &qword_268E79F70, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      uint64_t v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      a2[3] = &type metadata for LaunchConstraintConjunction;
      unint64_t result = sub_244513CDC();
      a2[4] = result;
      __int16 v8 = 5141;
      goto LABEL_40;
    case 0x1Cu:
    case 0x1Du:
      sub_24451A0A8(a1, (uint64_t)v26);
      uint64_t v9 = sub_2445218D8((uint64_t)v26, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_244522858, &qword_268E7A178, &qword_268E79F70, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      uint64_t v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      a2[3] = &type metadata for LaunchConstraintDisjunction;
      unint64_t result = sub_244513E50();
      a2[4] = result;
      __int16 v8 = 7197;
LABEL_40:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v10 = 1;
      return swift_willThrow();
  }
}

unint64_t sub_24452304C@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  switch(sub_244539F98())
  {
    case 0u:
      unint64_t result = sub_2445316F8(a1);
      if (!v2)
      {
        char v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_24451996C();
        unint64_t result = swift_allocObject();
        *a2 = result;
        *(unsigned char *)(result + 16) = 0;
        goto LABEL_26;
      }
      return result;
    case 1u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_244519918();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = v12 + 16;
      *a2 = v12;
      char v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for OnDiskCodeSigningFlags;
      a2[4] = sub_2445198C4();
      uint64_t v15 = swift_allocObject();
      *a2 = v15;
      unint64_t result = sub_244527A90((uint64_t)v25, v15 + 16);
      goto LABEL_33;
    case 3u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_244519870();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 3;
      goto LABEL_25;
    case 4u:
      sub_24451A0A8(a1, (uint64_t)v25);
      unint64_t result = sub_244537F28((uint64_t)v25);
      if (!v2)
      {
        unint64_t v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        unint64_t result = sub_24453831C(&qword_268E79EA0);
        a2[4] = result;
        *a2 = v17;
      }
      return result;
    case 5u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_2445197D4();
      uint64_t v18 = swift_allocObject();
      uint64_t v13 = v18 + 16;
      *a2 = v18;
      char v14 = 5;
LABEL_16:
      unint64_t result = sub_24452A874((uint64_t)v25, v14, v13);
      goto LABEL_33;
    case 6u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_244519780();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 6;
      goto LABEL_25;
    case 9u:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_2445196D8();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 9;
      goto LABEL_25;
    case 0xBu:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_244519684();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 11;
      goto LABEL_25;
    case 0xCu:
      unint64_t result = sub_2445316F8(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_244519630();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 12;
LABEL_25:
      *(unsigned char *)(result + 16) = v16;
LABEL_26:
      *(void *)(result + 48) = MEMORY[0x263F8D4F8];
      *(void *)(result + 56) = &off_26F92CAE0;
      *(unsigned char *)(result + 24) = v11 & 1;
      return result;
    case 0xDu:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_2445195DC();
      uint64_t v19 = swift_allocObject();
      *a2 = v19;
      unint64_t result = sub_24452FD58((uint64_t)v25, 13, v19 + 16);
      goto LABEL_33;
    case 0xEu:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_244519534();
      uint64_t v20 = swift_allocObject();
      *a2 = v20;
      unint64_t result = sub_24452EC84((uint64_t)v25, v20 + 16);
      goto LABEL_33;
    case 0xFu:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_244519588();
      uint64_t v21 = swift_allocObject();
      *a2 = v21;
      unint64_t result = sub_24452DE94((uint64_t)v25, v21 + 16);
      goto LABEL_33;
    case 0x10u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_2445194E0();
      uint64_t v22 = swift_allocObject();
      *a2 = v22;
      unint64_t result = sub_24452FD58((uint64_t)v25, 16, v22 + 16);
      goto LABEL_33;
    case 0x11u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_24451948C();
      uint64_t v23 = swift_allocObject();
      *a2 = v23;
      unint64_t result = sub_24452FD58((uint64_t)v25, 17, v23 + 16);
      goto LABEL_33;
    case 0x13u:
      sub_24451A0A8(a1, (uint64_t)v25);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_244519438();
      uint64_t v24 = swift_allocObject();
      *a2 = v24;
      unint64_t result = sub_244531264((uint64_t)v25, v24 + 16);
LABEL_33:
      if (v2) {
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      }
      return result;
    case 0x14u:
    case 0x15u:
      sub_24451A0A8(a1, (uint64_t)v25);
      uint64_t v5 = sub_2445218D8((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_24452304C, &qword_268E7A180, &qword_268E79F78, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for OnDiskConstraintConjunction;
      unint64_t result = sub_244513D58();
      a2[4] = result;
      __int16 v8 = 5141;
      goto LABEL_36;
    case 0x1Cu:
    case 0x1Du:
      sub_24451A0A8(a1, (uint64_t)v25);
      uint64_t v9 = sub_2445218D8((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_24452304C, &qword_268E7A180, &qword_268E79F78, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for OnDiskConstraintDisjunction;
      unint64_t result = sub_244513F38();
      a2[4] = result;
      __int16 v8 = 7197;
LABEL_36:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v10 = 1;
      return swift_willThrow();
  }
}

uint64_t sub_2445237A8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x79654B7961727261;
    }
    else {
      uint64_t v3 = 0x65756C6176;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x79654B7961727261;
      }
      else {
        uint64_t v6 = 0x65756C6176;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE300000000000000;
    uint64_t v3 = 7955819;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE300000000000000;
  if (v3 != 7955819)
  {
LABEL_21:
    char v8 = sub_24453A830();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2445238AC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x726F74617265706FLL;
    }
    else {
      uint64_t v3 = 0x65756C6176;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEB0000000079654BLL;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x726F74617265706FLL;
      }
      else {
        uint64_t v6 = 0x65756C6176;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEB0000000079654BLL;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE300000000000000;
    uint64_t v3 = 7955819;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE300000000000000;
  if (v3 != 7955819)
  {
LABEL_21:
    char v8 = sub_24453A830();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2445239C0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65756C6176;
  }
  else {
    uint64_t v3 = 7955819;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x65756C6176;
  }
  else {
    uint64_t v5 = 7955819;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24453A830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_244523A5C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000012;
  }
  else {
    unint64_t v3 = 0x65756C6176;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0x8000000244540300;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000012;
  }
  else {
    unint64_t v5 = 0x65756C6176;
  }
  if (a2) {
    unint64_t v6 = 0x8000000244540300;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24453A830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t OnDiskCodeSigningFlags.ValueSet.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t *static OnDiskCodeSigningFlags.isSuperset(of:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  *(unsigned char *)a2 = 2;
  *(unsigned char *)(a2 + 8) = 23;
  *(void *)(a2 + 16) = v2;
  *(unsigned char *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_244523B30@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16) == 1)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_244521784(v5, (uint64_t)&v10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = v10;
    sub_244516C78(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000
      || (sub_24453A830() & 1) != 0
      || v8 == 0x617272612D726F24 && v7 == 0xE900000000000079
      || (sub_24453A830() & 1) != 0)
    {
      sub_244522064((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  *((void *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  uint64_t v13 = &off_26F92F340;
  uint64_t v10 = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2445218D8((uint64_t)&v10, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_244522064, &qword_268E7A170, &qword_268E79F60, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for ProcessConstraintConjunction;
    uint64_t result = sub_244513C60();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }
  return result;
}

uint64_t sub_244523D2C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16) == 1)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_244521784(v5, (uint64_t)&v10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = v10;
    sub_244516C78(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000
      || (sub_24453A830() & 1) != 0
      || v8 == 0x617272612D726F24 && v7 == 0xE900000000000079
      || (sub_24453A830() & 1) != 0)
    {
      sub_244522858((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  *((void *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  uint64_t v13 = &off_26F92F340;
  uint64_t v10 = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2445218D8((uint64_t)&v10, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_244522858, &qword_268E7A178, &qword_268E79F70, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for LaunchConstraintConjunction;
    uint64_t result = sub_244513CDC();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }
  return result;
}

uint64_t sub_244523F28@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16) == 1)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_244521784(v5, (uint64_t)&v10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = v10;
    sub_244516C78(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000
      || (sub_24453A830() & 1) != 0
      || v8 == 0x617272612D726F24 && v7 == 0xE900000000000079
      || (sub_24453A830() & 1) != 0)
    {
      sub_24452304C((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  *((void *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  uint64_t v13 = &off_26F92F340;
  uint64_t v10 = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2445218D8((uint64_t)&v10, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, long long *))sub_24452304C, &qword_268E7A180, &qword_268E79F78, (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_244515E10);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for OnDiskConstraintConjunction;
    uint64_t result = sub_244513D58();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }
  return result;
}

void *static ProcessConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_244524158(a1, &qword_268E7A170, &qword_268E79F60);
}

uint64_t static ProcessConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_2445242CC(a1, &qword_268E7A170);
}

void *static LaunchConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_244524158(a1, &qword_268E7A178, &qword_268E79F70);
}

void *sub_244524158(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t result = (void *)swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v10 = *(void *)(a1 + 8 * v8 + 32);
    uint64_t v11 = *(void *)(v10 + 16);
    int64_t v12 = v9[2];
    int64_t v13 = v12 + v11;
    if (__OFADD__(v12, v11)) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v13 <= v9[3] >> 1)
    {
      if (*(void *)(v10 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v12 <= v13) {
        int64_t v14 = v12 + v11;
      }
      else {
        int64_t v14 = v12;
      }
      uint64_t result = sub_244531FE8(result, v14, 1, v9, a2, a3);
      uint64_t v9 = result;
      if (*(void *)(v10 + 16))
      {
LABEL_14:
        if ((v9[3] >> 1) - v9[2] < v11) {
          goto LABEL_23;
        }
        __swift_instantiateConcreteTypeFromMangledName(a3);
        uint64_t result = (void *)swift_arrayInitWithCopy();
        if (v11)
        {
          uint64_t v15 = v9[2];
          BOOL v16 = __OFADD__(v15, v11);
          uint64_t v17 = v15 + v11;
          if (v16) {
            goto LABEL_24;
          }
          v9[2] = v17;
        }
        goto LABEL_4;
      }
    }
    if (v11) {
      goto LABEL_22;
    }
LABEL_4:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    if (v3 == ++v8)
    {
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t static LaunchConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_2445242CC(a1, &qword_268E7A178);
}

uint64_t sub_2445242CC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24453AD40;
  sub_24451A0A8(a1, v3 + 32);
  return v3;
}

uint64_t static LaunchConstraintBuilder.buildOptional(_:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *static OnDiskConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_244524158(a1, &qword_268E7A180, &qword_268E79F78);
}

uint64_t static OnDiskConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_2445242CC(a1, &qword_268E7A180);
}

uint64_t sub_244524378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if (!swift_dynamicCast()) {
    goto LABEL_8;
  }
  if (*(void *)(v15[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_244516BC0();
    swift_allocError();
    *uint64_t v9 = 1;
    swift_willThrow();
    uint64_t v10 = (uint64_t *)a1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  sub_244521784(v15[0], (uint64_t)v13);
  uint64_t result = swift_bridgeObjectRelease();
  if (v13[1])
  {
    sub_244516C78(&v14, (uint64_t)v15);
    char v5 = sub_244539F98();
    if (v5 != 31)
    {
      char v6 = v5;
      sub_24451A0A8((uint64_t)v15, (uint64_t)v13);
      if (swift_dynamicCast())
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
        uint64_t v7 = 0;
        long long v8 = v12;
LABEL_12:
        *(unsigned char *)a2 = v6;
        *(_OWORD *)(a2 + 8) = v8;
        *(void *)(a2 + 24) = v7;
        return result;
      }
      sub_24451A0A8((uint64_t)v15, (uint64_t)v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA70);
      if (swift_dynamicCast())
      {
        uint64_t v7 = v12;
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
        long long v8 = xmmword_24453C110;
        goto LABEL_12;
      }
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v11 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    uint64_t v10 = v15;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  __break(1u);
  return result;
}

uint64_t sub_24452458C(uint64_t a1)
{
  sub_24451A0A8(a1, (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if (!swift_dynamicCast()) {
    goto LABEL_8;
  }
  uint64_t v1 = v11[0];
  if (*(void *)(v11[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_244516BC0();
    swift_allocError();
    *char v5 = 1;
    swift_willThrow();
    char v6 = (uint64_t *)a1;
    goto LABEL_9;
  }
  sub_244521784(v11[0], (uint64_t)&v8);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v1 = v9;
  if (v9)
  {
    sub_244516C78(&v10, (uint64_t)v11);
    uint64_t v4 = sub_244539F98();
    if (v4 != 31)
    {
      uint64_t v1 = v4;
      sub_24451A0A8((uint64_t)v11, (uint64_t)&v8);
      if ((swift_dynamicCast() & 1) != 0
        || (sub_24451A0A8((uint64_t)v11, (uint64_t)&v8),
            __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA78),
            (swift_dynamicCast() & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        return v1;
      }
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v7 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    char v6 = v11;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_244524798(uint64_t a1)
{
  sub_24451A0A8(a1, (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if (!swift_dynamicCast()) {
    goto LABEL_8;
  }
  uint64_t v1 = v11[0];
  if (*(void *)(v11[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_244516BC0();
    swift_allocError();
    *char v5 = 1;
    swift_willThrow();
    char v6 = (uint64_t *)a1;
    goto LABEL_9;
  }
  sub_244521784(v11[0], (uint64_t)&v8);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v1 = v9;
  if (v9)
  {
    sub_244516C78(&v10, (uint64_t)v11);
    uint64_t v4 = sub_244539F98();
    if (v4 != 31)
    {
      uint64_t v1 = v4;
      sub_24451A0A8((uint64_t)v11, (uint64_t)&v8);
      if ((swift_dynamicCast() & 1) != 0
        || (sub_24451A0A8((uint64_t)v11, (uint64_t)&v8),
            __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA88),
            (swift_dynamicCast() & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        return v1;
      }
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v7 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    char v6 = v11;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_24452499C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if (!swift_dynamicCast()) {
    goto LABEL_8;
  }
  if (*(void *)(v18[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_244516BC0();
    swift_allocError();
    *long long v12 = 1;
    swift_willThrow();
    int64_t v13 = (uint64_t *)a1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  sub_244521784(v18[0], (uint64_t)v16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v16[1])
  {
    sub_244516C78(&v17, (uint64_t)v18);
    char v7 = sub_244539F98();
    if (v7 != 31)
    {
      char v8 = v7;
      sub_24451A0A8((uint64_t)v18, (uint64_t)v16);
      char v9 = swift_dynamicCast();
      if (v9)
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        uint64_t v10 = 0;
        uint64_t v11 = v15;
LABEL_12:
        *(unsigned char *)a3 = v8;
        *(void *)(a3 + 8) = v11;
        *(unsigned char *)(a3 + 16) = v9 ^ 1;
        *(void *)(a3 + 24) = v10;
        return result;
      }
      sub_24451A0A8((uint64_t)v18, (uint64_t)v16);
      __swift_instantiateConcreteTypeFromMangledName(a2);
      if (swift_dynamicCast())
      {
        uint64_t v10 = v15;
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        uint64_t v11 = 0;
        goto LABEL_12;
      }
    }
    sub_244516BC0();
    swift_allocError();
    *long long v14 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    int64_t v13 = v18;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  __break(1u);
  return result;
}

BOOL sub_244524BC4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_244524BD4()
{
  return sub_24453A8B0();
}

uint64_t sub_244524BFC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_24453A830() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E695365756C6176 && a2 == 0xEB00000000656C67 || (sub_24453A830() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72724165756C6176 && a2 == 0xEA00000000007961)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_244524D68()
{
  return sub_24453A8D0();
}

uint64_t sub_244524DB0(char a1)
{
  if (!a1) {
    return 7955819;
  }
  if (a1 == 1) {
    return 0x6E695365756C6176;
  }
  return 0x72724165756C6176;
}

BOOL sub_244524E0C(char *a1, char *a2)
{
  return sub_244524BC4(*a1, *a2);
}

uint64_t sub_244524E24()
{
  return sub_244524D68();
}

uint64_t sub_244524E34()
{
  return sub_244524BD4();
}

uint64_t sub_244524E44()
{
  return sub_24453A8D0();
}

uint64_t sub_244524E90(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 16);
  uint64_t v14 = v4;
  type metadata accessor for ContainerConstraint.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_24453A750();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v13 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v9 = v15;
  sub_24453A8F0();
  LOBYTE(v18) = *v9;
  char v19 = 0;
  sub_244514BD8();
  uint64_t v10 = v16;
  sub_24453A730();
  if (!v10)
  {
    LOBYTE(v18) = 1;
    uint64_t v11 = v14;
    sub_24453A700();
    uint64_t v18 = *(void *)&v9[*(int *)(a2 + 48)];
    char v19 = 2;
    sub_24453A5B0();
    uint64_t v17 = v11;
    swift_getWitnessTable();
    sub_24453A700();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2445250C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a4;
  uint64_t v7 = sub_24453A5C0();
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v30 = (char *)v23 - v8;
  type metadata accessor for ContainerConstraint.CodingKeys();
  swift_getWitnessTable();
  uint64_t v33 = sub_24453A6E0();
  uint64_t v29 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v10 = (char *)v23 - v9;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v11 = type metadata accessor for ContainerConstraint();
  uint64_t v25 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v23 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v34 = v10;
  uint64_t v14 = v35;
  sub_24453A8E0();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v15 = v13;
  uint64_t v35 = v11;
  uint64_t v16 = v32;
  uint64_t v17 = v29;
  char v38 = 0;
  sub_244516B6C();
  sub_24453A6C0();
  uint64_t v24 = v15;
  *uint64_t v15 = v37;
  LOBYTE(v37) = 1;
  sub_24453A690();
  uint64_t v18 = v24;
  char v19 = *(void (**)(void))(v27 + 32);
  v23[1] = &v24[*(int *)(v35 + 44)];
  v19();
  sub_24453A5B0();
  char v38 = 2;
  uint64_t v36 = v16;
  swift_getWitnessTable();
  sub_24453A690();
  uint64_t v20 = v35;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v34, v33);
  *(void *)&v18[*(int *)(v20 + 48)] = v37;
  uint64_t v21 = v25;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v25 + 16))(v26, v18, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v21 + 8))(v18, v20);
}

uint64_t sub_2445254FC()
{
  return sub_244524DB0(*v0);
}

uint64_t sub_24452550C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_244524BFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244525540@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445380C4();
  *a1 = result;
  return result;
}

uint64_t sub_244525574(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2445255C8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24452561C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2445250C4(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_244525640(void *a1, uint64_t a2)
{
  return sub_244524E90(a1, a2);
}

uint64_t sub_244525658@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2445259AC(a1, a2);
}

uint64_t sub_244525670@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  char v5 = result;
  if ((a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A9F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(v5);
    *(void *)(inited + 40) = v9;
    *(void *)(inited + 48) = a2;
    unint64_t v10 = sub_24450AEDC(inited);
    uint64_t v11 = (uint64_t *)&unk_268E7AA00;
LABEL_5:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_26F92F340;
    *a5 = v10;
    return result;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA08);
    uint64_t v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_24453AD40;
    *(void *)(v13 + 32) = sub_2445388B0(v5);
    *(void *)(v13 + 40) = v14;
    *(void *)(v13 + 48) = a4;
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_24450AFF0(v13);
    uint64_t v11 = (uint64_t *)&unk_268E7AA10;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_244525778@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  char v5 = result;
  if (a3 >> 60 != 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA48);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(v5);
    *(void *)(inited + 40) = v15;
    *(void *)(inited + 48) = a2;
    *(void *)(inited + 56) = a3;
    sub_24451A204(a2, a3);
    unint64_t v10 = sub_24450AFFC(inited);
    uint64_t v11 = (uint64_t *)&unk_268E7AA50;
    goto LABEL_5;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA58);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_24453AD40;
    *(void *)(v8 + 32) = sub_2445388B0(v5);
    *(void *)(v8 + 40) = v9;
    *(void *)(v8 + 48) = a4;
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_24450B124(v8);
    uint64_t v11 = (uint64_t *)&unk_268E7AA60;
LABEL_5:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_26F92F340;
    *a5 = v10;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_244525898@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  char v5 = result;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA28);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(v5);
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 48) = a2;
    *(void *)(inited + 56) = a3;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_24450B244(inited);
    uint64_t v12 = (uint64_t *)&unk_268E7AA30;
LABEL_5:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v12);
    a5[3] = result;
    a5[4] = (unint64_t)&off_26F92F340;
    *a5 = v11;
    return result;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA38);
    uint64_t v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_24453AD40;
    *(void *)(v14 + 32) = sub_2445388B0(v5);
    *(void *)(v14 + 40) = v15;
    *(void *)(v14 + 48) = a4;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_24450B368(v14);
    uint64_t v12 = (uint64_t *)&unk_268E7AA40;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2445259AC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_24453A5C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v31 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = *(int *)(a1 + 44);
  uint64_t v33 = v2;
  uint64_t v29 = *(void (**)(char *))(v6 + 16);
  uint64_t v30 = &v2[v11];
  v29((char *)&v27 - v9);
  uint64_t v12 = *(void *)(v4 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v13 = v28(v10, 1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  if (v13 == 1)
  {
    uint64_t v15 = v33;
    unint64_t v16 = *(void *)&v33[*(int *)(a1 + 48)];
    if (v16)
    {
      sub_24453A5B0();
      swift_getTupleTypeMetadata2();
      sub_24453A770();
      swift_initStackObject();
      sub_24453A580();
      uint64_t v18 = v17;
      *uint64_t v17 = sub_2445388B0(*v15);
      v18[1] = v19;
      v18[2] = v16;
      sub_24453A5B0();
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_24453A4E0();
LABEL_6:
      uint64_t result = sub_24453A4F0();
      uint64_t v26 = v32;
      v32[3] = result;
      v26[4] = (uint64_t)&off_26F92F340;
      *uint64_t v26 = v20;
      return result;
    }
    __break(1u);
  }
  else
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    sub_24453A770();
    swift_allocObject();
    sub_24453A580();
    uint64_t v23 = v22;
    *uint64_t v22 = sub_2445388B0(*v33);
    v23[1] = v24;
    uint64_t v25 = v31;
    ((void (*)(char *, char *, uint64_t))v29)(v31, v30, v5);
    uint64_t result = v28(v25, 1, v4);
    if (result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v23 + *(int *)(TupleTypeMetadata2 + 48), v25, v4);
      sub_24453A5B0();
      uint64_t v20 = sub_24453A4E0();
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_244525D68@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  char v5 = result;
  if ((a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A9F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(v5);
    *(void *)(inited + 40) = v9;
    *(void *)(inited + 48) = a2;
    unint64_t v10 = sub_24450AEDC(inited);
    uint64_t v11 = (uint64_t *)&unk_268E7AA00;
LABEL_11:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_26F92F340;
    *a5 = v10;
    return result;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA08);
    uint64_t v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_24453AD40;
    *(void *)(v13 + 32) = sub_2445388B0(v5);
    *(void *)(v13 + 40) = v14;
    int64_t v15 = *(void *)(a4 + 16);
    uint64_t v16 = MEMORY[0x263F8EE78];
    if (v15)
    {
      uint64_t v21 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_244514D20(0, v15, 0);
      uint64_t v17 = 0;
      uint64_t v16 = v21;
      unint64_t v18 = *(void *)(v21 + 16);
      do
      {
        uint64_t v19 = *(void *)(a4 + 8 * v17 + 32);
        unint64_t v20 = *(void *)(v21 + 24);
        if (v18 >= v20 >> 1) {
          sub_244514D20((char *)(v20 > 1), v18 + 1, 1);
        }
        ++v17;
        *(void *)(v21 + 16) = v18 + 1;
        *(void *)(v21 + 8 * v18++ + 32) = v19;
      }
      while (v15 != v17);
      swift_bridgeObjectRelease();
    }
    *(void *)(v13 + 48) = v16;
    unint64_t v10 = sub_24450AFF0(v13);
    uint64_t v11 = (uint64_t *)&unk_268E7AA10;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_244525F20@<X0>(unint64_t *a1@<X8>)
{
  sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A398);
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA28);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(*v1);
    *(void *)(inited + 40) = v5;
    sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v15);
    swift_dynamicCast();
    unint64_t v6 = sub_24450B244(inited);
    uint64_t v7 = (uint64_t *)&unk_268E7AA30;
  }
  else
  {
    sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A378);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_24453AD40;
    *(void *)(v8 + 32) = sub_2445388B0(*v1);
    *(void *)(v8 + 40) = v9;
    sub_244525898(v11, v12, v13, v14, (unint64_t *)(v8 + 48));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF8);
      return swift_arrayDestroy();
    }
    unint64_t v6 = sub_24450ADAC(v8);
    uint64_t v7 = &qword_268E79ED8;
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v7);
  a1[3] = result;
  a1[4] = (unint64_t)&off_26F92F340;
  *a1 = v6;
  return result;
}

uint64_t sub_24452612C@<X0>(unint64_t *a1@<X8>)
{
  sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1D0);
  if (swift_dynamicCast())
  {
    sub_24451C7D8(v10, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA48);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(*v1);
    *(void *)(inited + 40) = v5;
    sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v14);
    swift_dynamicCast();
    unint64_t v6 = sub_24450AFFC(inited);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA50);
    a1[3] = result;
    a1[4] = (unint64_t)&off_26F92F340;
  }
  else
  {
    sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1B0);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_24453AD40;
    *(void *)(v8 + 32) = sub_2445388B0(*v1);
    *(void *)(v8 + 40) = v9;
    sub_244525778(v10, v11, v12, v13, (unint64_t *)(v8 + 48));
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF8);
      swift_arrayDestroy();
      sub_244531C3C(v11, v12);
      return swift_bridgeObjectRelease();
    }
    unint64_t v6 = sub_24450ADAC(v8);
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    a1[4] = (unint64_t)&off_26F92F340;
    sub_244531C3C(v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  *a1 = v6;
  return result;
}

uint64_t sub_244526360@<X0>(unint64_t *a1@<X8>)
{
  sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A328);
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A9F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(*v1);
    *(void *)(inited + 40) = v5;
    sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v15);
    swift_dynamicCast();
    unint64_t v6 = sub_24450AEDC(inited);
    uint64_t v7 = &qword_268E7AA00;
  }
  else
  {
    sub_24451A0A8((uint64_t)(v1 + 8), (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_24453AD40;
    *(void *)(v8 + 32) = sub_2445388B0(*v1);
    *(void *)(v8 + 40) = v9;
    sub_244525670(v11, v12, v13, v14, (unint64_t *)(v8 + 48));
    swift_bridgeObjectRelease();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF8);
      return swift_arrayDestroy();
    }
    unint64_t v6 = sub_24450ADAC(v8);
    uint64_t v7 = &qword_268E79ED8;
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v7);
  a1[3] = result;
  a1[4] = (unint64_t)&off_26F92F340;
  *a1 = v6;
  return result;
}

uint64_t sub_244526560@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  sub_24451A0A8((uint64_t)(v2 + 8), (uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A328);
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A9F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24453AD40;
    *(void *)(inited + 32) = sub_2445388B0(*v2);
    *(void *)(inited + 40) = v7;
    sub_24451A0A8((uint64_t)(v2 + 8), (uint64_t)v17);
    swift_dynamicCast();
    unint64_t v8 = sub_24450AEDC(inited);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA00);
    a2[3] = result;
    a2[4] = (unint64_t)&off_26F92F340;
    *a2 = v8;
  }
  else
  {
    sub_24451A0A8((uint64_t)(v2 + 8), (uint64_t)v17);
    __swift_instantiateConcreteTypeFromMangledName(a1);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE8);
    uint64_t v10 = swift_initStackObject();
    *(_OWORD *)(v10 + 16) = xmmword_24453AD40;
    *(void *)(v10 + 32) = sub_2445388B0(*v2);
    *(void *)(v10 + 40) = v11;
    sub_244525D68(v13, v14, v15, v16, (unint64_t *)(v10 + 48));
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF8);
      swift_arrayDestroy();
    }
    else
    {
      unint64_t v12 = sub_24450ADAC(v10);
      a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
      a2[4] = (unint64_t)&off_26F92F340;
      *a2 = v12;
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24452675C@<X0>(void (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X1>, unint64_t *a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EE8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24453AD40;
  *(void *)(inited + 32) = sub_2445388B0(*(unsigned char *)v3);
  *(void *)(inited + 40) = v6;
  uint64_t v7 = *(void *)(v3 + 16);
  char v8 = *(unsigned char *)(v3 + 24);
  uint64_t v9 = *(void *)(v3 + 32);
  uint64_t v10 = *(unsigned __int8 *)(v3 + 8);
  a1(v3);
  sub_244525670(v10, v7, v8, v9, (unint64_t *)(inited + 48));
  a2(v3);
  if (v14)
  {
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E79EF8);
    return swift_arrayDestroy();
  }
  else
  {
    unint64_t v12 = sub_24450ADAC(inited);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    a3[3] = result;
    a3[4] = (unint64_t)&off_26F92F340;
    *a3 = v12;
  }
  return result;
}

void AppleInternal.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t AppleInternal.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_2445268EC@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_2445268F8@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_244526904(uint64_t a1)
{
  unint64_t v2 = sub_244531AA8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244526940(uint64_t a1)
{
  unint64_t v2 = sub_244531AA8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppleInternal.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A188);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244531AA8();
  sub_24453A8F0();
  sub_2445388B0(*v3);
  v11[0] = 0;
  sub_24453A710();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A198);
    swift_dynamicCast();
    v11[0] = 1;
    sub_24453A720();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t AppleInternal.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244531AA8();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0x6E692D656C707061 && v9 == 0xEE006C616E726574)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      unint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *unsigned __int8 v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_244526DF0@<X0>(unint64_t *a1@<X8>)
{
  return sub_24452866C(a1);
}

uint64_t sub_244526E08@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return AppleInternal.init(from:)(a1, a2);
}

uint64_t sub_244526E20(void *a1)
{
  return AppleInternal.encode(to:)(a1);
}

unint64_t CodeDirectoryHash.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24452A0C8(a1, a2, 1, a3);
}

uint64_t static CodeDirectoryHash.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244526E50(a1, 1, a2);
}

{
  return sub_244526E50(a1, 1, a2);
}

uint64_t sub_244526E50@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = a2;
  *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1B0);
  *(void *)(a3 + 40) = sub_244532688(&qword_268E7A1B8, &qword_268E7A1B0);
  uint64_t v5 = swift_allocObject();
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(v5 + 16) = 22;
  *(_OWORD *)(v5 + 24) = xmmword_24453C110;
  *(void *)(v5 + 40) = a1;

  return swift_bridgeObjectRetain();
}

uint64_t sub_244526F00(char *a1, char *a2)
{
  return sub_2445239C0(*a1, *a2) & 1;
}

uint64_t sub_244526F24@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

void sub_244526F30(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7955819;
  if (*v1) {
    uint64_t v2 = 0x65756C6176;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_244526F64()
{
  if (*v0) {
    return 0x65756C6176;
  }
  else {
    return 7955819;
  }
}

uint64_t sub_244526F94@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_244526FA0(uint64_t a1)
{
  unint64_t v2 = sub_244531BE8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244526FDC(uint64_t a1)
{
  unint64_t v2 = sub_244531BE8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CodeDirectoryHash.encode(to:)(void *a1)
{
  return sub_24452A1F0(a1, &qword_268E7A1C0, (void (*)(void))sub_244531BE8);
}

uint64_t CodeDirectoryHash.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244531BE8();
  sub_24453A8E0();
  if (!v2)
  {
    char v21 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v20[0]) = v17;
    if (sub_2445388B0(v17) == 0x687361686463 && v10 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *unsigned __int8 v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    char v21 = 1;
    sub_244531CA4();
    uint64_t v12 = MEMORY[0x263F06F78];
    sub_24453A6C0();
    long long v14 = v17;
    uint64_t v18 = v12;
    unint64_t v19 = sub_244531AFC();
    long long v17 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v17, (uint64_t)v20 + 8);
    long long v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2445273C8@<X0>(unint64_t *a1@<X8>)
{
  return sub_24452612C(a1);
}

uint64_t sub_2445273E0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return CodeDirectoryHash.init(from:)(a1, a2);
}

uint64_t sub_2445273F8(void *a1)
{
  return CodeDirectoryHash.encode(to:)(a1);
}

uint64_t ProcessCodeSigningFlags.ValueSet.rawValue.getter()
{
  return *(void *)v0;
}

void static ProcessCodeSigningFlags.ValueSet.isDynamicallyValid.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static ProcessCodeSigningFlags.ValueSet.isDebuggable.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static ProcessCodeSigningFlags.ValueSet.canInstallFilesToSIPProtectedLocations.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static ProcessCodeSigningFlags.ValueSet.hasLibraryValidationBecauseOfHardenedRuntime.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static ProcessCodeSigningFlags.ValueSet.invalidAllowed.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static ProcessCodeSigningFlags.ValueSet.isEntitlementSetValidated.getter(void *a1@<X8>)
{
  *a1 = 0x4000;
}

void static ProcessCodeSigningFlags.ValueSet.isAccessToNVRAMUnrestricted.getter(void *a1@<X8>)
{
  *a1 = 0x8000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesWillBusErrorOnCodeSigningFailure.getter(void *a1@<X8>)
{
  *a1 = 0x100000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesWillTerminateOnCodeSigningFailure.getter(void *a1@<X8>)
{
  *a1 = 0x200000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesRequireCodeSignaturesForAllExecutableCode.getter(void *a1@<X8>)
{
  *a1 = 0x400000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesCanInstallFilesToSIPProtectedLocations.getter(void *a1@<X8>)
{
  *a1 = 0x800000;
}

void static ProcessCodeSigningFlags.ValueSet.noUntrustedHelper.getter(void *a1@<X8>)
{
  *a1 = 0x2000000;
}

void static ProcessCodeSigningFlags.ValueSet.isPlatformSigned.getter(void *a1@<X8>)
{
  *a1 = 0x4000000;
}

void static ProcessCodeSigningFlags.ValueSet.platformPath.getter(void *a1@<X8>)
{
  *a1 = 0x8000000;
}

void static ProcessCodeSigningFlags.ValueSet.isDebugged.getter(void *a1@<X8>)
{
  *a1 = 0x10000000;
}

void static ProcessCodeSigningFlags.ValueSet.isSigned.getter(void *a1@<X8>)
{
  *a1 = 0x20000000;
}

void static ProcessCodeSigningFlags.ValueSet.isDevelopmentSigned.getter(void *a1@<X8>)
{
  *a1 = 0x40000000;
}

void static ProcessCodeSigningFlags.ValueSet.dataVaultController.getter(void *a1@<X8>)
{
  *a1 = 0x80000000;
}

uint64_t sub_2445274F0()
{
  return sub_24453A550();
}

uint64_t sub_244527550()
{
  return sub_24453A530();
}

uint64_t sub_2445275A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_2445275C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2445275D8(a1, a2);
}

uint64_t sub_2445275D8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_244527638(uint64_t a1)
{
  unint64_t v2 = sub_244531D4C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244527674(uint64_t a1)
{
  unint64_t v2 = sub_244531D4C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProcessCodeSigningFlags.encode(to:)(void *a1)
{
  return sub_244527DA8(a1, &qword_268E7A200, (void (*)(void))sub_244531D4C);
}

uint64_t ProcessCodeSigningFlags.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244527FE8(a1, &qword_268E7A220, (void (*)(void))sub_244531D4C, a2);
}

uint64_t sub_244527728@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProcessCodeSigningFlags.init(from:)(a1, a2);
}

uint64_t sub_244527740(void *a1)
{
  return ProcessCodeSigningFlags.encode(to:)(a1);
}

uint64_t sub_244527758@<X0>(unint64_t *a1@<X8>)
{
  return sub_24452675C((void (*)(uint64_t))sub_2445385A4, (void (*)(uint64_t))sub_2445385A8, a1);
}

uint64_t OnDiskCodeSigningFlags.ValueSet.rawValue.getter()
{
  return *(void *)v0;
}

void static OnDiskCodeSigningFlags.ValueSet.isAdhocSigned.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static OnDiskCodeSigningFlags.ValueSet.signalsBusErrorOnCodeSigningFailure.getter(void *a1@<X8>)
{
  *a1 = 256;
}

void static OnDiskCodeSigningFlags.ValueSet.terminatesOnCodeSigningFailure.getter(void *a1@<X8>)
{
  *a1 = 512;
}

void static OnDiskCodeSigningFlags.ValueSet.isCertificateExpirationEnforced.getter(void *a1@<X8>)
{
  *a1 = 1024;
}

void static OnDiskCodeSigningFlags.ValueSet.isDynamicLinkerPolicyHardened.getter(void *a1@<X8>)
{
  *a1 = 2048;
}

void static OnDiskCodeSigningFlags.ValueSet.isCodeSignatureRequiredForAllExecutableCode.getter(void *a1@<X8>)
{
  *a1 = 4096;
}

void static OnDiskCodeSigningFlags.ValueSet.isLibraryValidationRequired.getter(void *a1@<X8>)
{
  *a1 = 0x2000;
}

void static OnDiskCodeSigningFlags.ValueSet.isHardenedRuntimeEnforced.getter(void *a1@<X8>)
{
  *a1 = 0x10000;
}

void static OnDiskCodeSigningFlags.ValueSet.isSignedByLinker.getter(void *a1@<X8>)
{
  *a1 = 0x20000;
}

uint64_t sub_244527830()
{
  return sub_24453A550();
}

uint64_t sub_244527890()
{
  return sub_24453A530();
}

void *sub_2445278E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2445278EC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2445278F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_244527908@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_24452791C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_244527930(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_244527960@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24452798C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2445279B0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2445279C4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2445279D8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2445279EC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_244527A00(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_244527A14(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_244527A28(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_244527A3C()
{
  return *v0 == 0;
}

void *sub_244527A4C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_244527A60@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_244527A70(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_244527A7C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244527A90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)v17);
  char v5 = sub_24452458C((uint64_t)v17);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  char v10 = v5;
  uint64_t v11 = v6;
  char v12 = v7;
  uint64_t v13 = v8;
  if (sub_2445388B0(v5) == 0x68632D67616C6624 && v14 == 0xEB000000006B6365)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_24453A830();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_244516BC0();
      swift_allocError();
      *uint64_t v16 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1(a1);
    }
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  *(unsigned char *)a2 = 2;
  *(unsigned char *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 24) = v12 & 1;
  *(void *)(a2 + 32) = v13;
  return result;
}

BOOL sub_244527BFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_244527C14()
{
  return sub_24453A8D0();
}

uint64_t sub_244527C5C()
{
  return sub_24453A8B0();
}

uint64_t sub_244527C88()
{
  return sub_24453A8D0();
}

uint64_t sub_244527CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2445380CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244527CF4(uint64_t a1)
{
  unint64_t v2 = sub_244531DA0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244527D30(uint64_t a1)
{
  unint64_t v2 = sub_244531DA0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnDiskCodeSigningFlags.encode(to:)(void *a1)
{
  return sub_244527DA8(a1, &qword_268E7A230, (void (*)(void))sub_244531DA0);
}

uint64_t sub_244527DA8(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v17 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *v3;
  int v22 = v3[8];
  uint64_t v15 = *((void *)v3 + 2);
  int v14 = v3[24];
  uint64_t v13 = *((void *)v3 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24453A8F0();
  char v18 = v9;
  char v23 = 0;
  sub_244514BD8();
  uint64_t v10 = v16;
  sub_24453A730();
  if (!v10)
  {
    char v18 = v22;
    uint64_t v19 = v15;
    char v20 = v14;
    uint64_t v21 = v13;
    char v23 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
    sub_244532688(&qword_268E7A218, &qword_268E7A210);
    sub_24453A730();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v6);
}

uint64_t OnDiskCodeSigningFlags.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244527FE8(a1, &qword_268E7A240, (void (*)(void))sub_244531DA0, a2);
}

uint64_t sub_244527FE8@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  char v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24453A8E0();
  if (!v4)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v19;
    char v25 = 0;
    sub_244516B6C();
    uint64_t v12 = v20;
    sub_24453A6C0();
    char v13 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
    char v25 = 1;
    sub_244532688(&qword_268E7A228, &qword_268E7A210);
    sub_24453A6C0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v12);
    char v14 = v21;
    uint64_t v15 = v22;
    char v16 = v23;
    uint64_t v17 = v24;
    *(unsigned char *)uint64_t v11 = v13;
    *(unsigned char *)(v11 + 8) = v14;
    *(void *)(v11 + 16) = v15;
    *(unsigned char *)(v11 + 24) = v16;
    *(void *)(v11 + 32) = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_244528214@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return OnDiskCodeSigningFlags.init(from:)(a1, a2);
}

uint64_t sub_24452822C(void *a1)
{
  return OnDiskCodeSigningFlags.encode(to:)(a1);
}

uint64_t sub_244528244@<X0>(unint64_t *a1@<X8>)
{
  return sub_24452675C((void (*)(uint64_t))sub_2445381F4, (void (*)(uint64_t))sub_244538220, a1);
}

void DeveloperMode.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t DeveloperMode.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 3;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_2445282F4@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_244528300@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452830C(uint64_t a1)
{
  unint64_t v2 = sub_244531DF4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244528348(uint64_t a1)
{
  unint64_t v2 = sub_244531DF4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DeveloperMode.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A248, (void (*)(void))sub_244531DF4);
}

uint64_t DeveloperMode.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A258);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244531DF4();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0x65706F6C65766564 && v9 == 0xEE0065646F6D2D72)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      char v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *char v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452866C@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24453AD40;
  *(void *)(inited + 32) = sub_2445388B0(*v2);
  *(void *)(inited + 40) = v5;
  sub_24451A0A8((uint64_t)(v2 + 8), (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A198);
  swift_dynamicCast();
  unint64_t v6 = sub_24450B130(inited);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA20);
  a1[3] = result;
  a1[4] = (unint64_t)&off_26F92F340;
  *a1 = v6;
  return result;
}

uint64_t sub_244528740@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return DeveloperMode.init(from:)(a1, a2);
}

uint64_t sub_244528758(void *a1)
{
  return DeveloperMode.encode(to:)(a1);
}

LightweightCodeRequirements::EntitlementsQuery::DataType_optional __swiftcall EntitlementsQuery.DataType.init(rawValue:)(Swift::Int64 rawValue)
{
  unint64_t v2 = 0x40302010005uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 6) {
    LOBYTE(v2) = 5;
  }
  *uint64_t v1 = v2;
  return (LightweightCodeRequirements::EntitlementsQuery::DataType_optional)rawValue;
}

uint64_t EntitlementsQuery.DataType.rawValue.getter()
{
  return *v0 + 1;
}

BOOL sub_2445287A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2445287B8()
{
  return sub_24453A8D0();
}

uint64_t sub_244528800()
{
  return sub_24453A8C0();
}

uint64_t sub_244528830()
{
  return sub_24453A8D0();
}

LightweightCodeRequirements::EntitlementsQuery::DataType_optional sub_244528874(Swift::Int64 *a1)
{
  return EntitlementsQuery.DataType.init(rawValue:)(*a1);
}

void sub_24452887C(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t static EntitlementsQuery.key(_:)(uint64_t a1, uint64_t a2)
{
  return sub_244528C78(a1, a2, 1);
}

uint64_t sub_244528894(uint64_t a1, uint64_t a2)
{
  return sub_2445288AC(a1, a2, 1);
}

uint64_t sub_24452889C(uint64_t a1)
{
  return sub_244528B40(a1, 2);
}

uint64_t sub_2445288A4(uint64_t a1, uint64_t a2)
{
  return sub_2445288AC(a1, a2, 3);
}

uint64_t sub_2445288AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A260);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 56) = MEMORY[0x263F8E5C0];
  *(void *)(v7 + 64) = &off_26F92F388;
  *(void *)(v7 + 32) = a3;
  uint64_t v8 = MEMORY[0x263F8D310];
  *(_OWORD *)(v7 + 16) = xmmword_24453AD50;
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = &off_26F92F3A0;
  *(void *)(v7 + 72) = a1;
  *(void *)(v7 + 80) = a2;
  uint64_t v9 = *(void **)(v3 + 24);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 24) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v9 = sub_244531E6C(0, v9[2] + 1, 1, v9, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v3 + 24) = v9;
  }
  unint64_t v12 = v9[2];
  unint64_t v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    uint64_t v9 = sub_244531E6C((void *)(v11 > 1), v12 + 1, 1, v9, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v3 + 24) = v9;
  }
  v9[2] = v12 + 1;
  v9[v12 + 4] = v7;

  return swift_retain();
}

uint64_t sub_2445289F0(uint64_t a1, uint64_t a2)
{
  return sub_2445288AC(a1, a2, 4);
}

uint64_t sub_2445289F8(char a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A260);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24453AD50;
  *(void *)(v3 + 56) = MEMORY[0x263F8E5C0];
  *(void *)(v3 + 64) = &off_26F92F388;
  *(void *)(v3 + 32) = 5;
  *(void *)(v3 + 96) = MEMORY[0x263F8D4F8];
  *(void *)(v3 + 104) = &off_26F92F3B8;
  *(unsigned char *)(v3 + 72) = a1;
  uint64_t v4 = *(void **)(v1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 24) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_244531E6C(0, v4[2] + 1, 1, v4, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v1 + 24) = v4;
  }
  unint64_t v7 = v4[2];
  unint64_t v6 = v4[3];
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = sub_244531E6C((void *)(v6 > 1), v7 + 1, 1, v4, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v1 + 24) = v4;
  }
  v4[2] = v7 + 1;
  v4[v7 + 4] = v3;

  return swift_retain();
}

uint64_t sub_244528B30(uint64_t a1, uint64_t a2)
{
  return sub_2445288AC(a1, a2, 6);
}

uint64_t sub_244528B38(uint64_t a1)
{
  return sub_244528B40(a1, 7);
}

uint64_t sub_244528B40(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A260);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24453AD50;
  uint64_t v6 = MEMORY[0x263F8E5C0];
  *(void *)(v5 + 56) = MEMORY[0x263F8E5C0];
  *(void *)(v5 + 64) = &off_26F92F388;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 96) = v6;
  *(void *)(v5 + 104) = &off_26F92F388;
  *(void *)(v5 + 72) = a1;
  unint64_t v7 = *(void **)(v2 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v2 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v7 = sub_244531E6C(0, v7[2] + 1, 1, v7, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v2 + 24) = v7;
  }
  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    unint64_t v7 = sub_244531E6C((void *)(v9 > 1), v10 + 1, 1, v7, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v2 + 24) = v7;
  }
  v7[2] = v10 + 1;
  v7[v10 + 4] = v5;

  return swift_retain();
}

uint64_t sub_244528C68(uint64_t a1, uint64_t a2)
{
  return sub_2445288AC(a1, a2, 8);
}

uint64_t static EntitlementsQuery.keyPrefix(_:)(uint64_t a1, uint64_t a2)
{
  return sub_244528C78(a1, a2, 9);
}

uint64_t sub_244528C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A260);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = MEMORY[0x263F8E5C0];
  *(_OWORD *)(v6 + 16) = xmmword_24453AD50;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = &off_26F92F388;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 96) = MEMORY[0x263F8D310];
  *(void *)(v6 + 104) = &off_26F92F3A0;
  *(void *)(v6 + 72) = a1;
  *(void *)(v6 + 80) = a2;
  type metadata accessor for EntitlementsQuery();
  uint64_t v8 = swift_allocObject();
  *(_WORD *)(v8 + 16) = 7684;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A268);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24453AD40;
  *(void *)(v9 + 32) = v6;
  *(void *)(v8 + 24) = v9;
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t sub_244528D54(uint64_t a1, uint64_t a2)
{
  return sub_2445288AC(a1, a2, 9);
}

uint64_t sub_244528D5C(uint64_t a1)
{
  return sub_244528B40(a1, 10);
}

uint64_t sub_244528D64(unsigned __int8 *a1)
{
  uint64_t v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A260);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8E5C0];
  *(_OWORD *)(v3 + 16) = xmmword_24453AD50;
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = &off_26F92F388;
  *(void *)(v3 + 32) = 11;
  *(void *)(v3 + 96) = v4;
  *(void *)(v3 + 104) = &off_26F92F388;
  *(void *)(v3 + 72) = v2 + 1;
  uint64_t v5 = *(void **)(v1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 24) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = sub_244531E6C(0, v5[2] + 1, 1, v5, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v1 + 24) = v5;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = sub_244531E6C((void *)(v7 > 1), v8 + 1, 1, v5, &qword_268E7A268, &qword_268E7AA68);
    *(void *)(v1 + 24) = v5;
  }
  v5[2] = v8 + 1;
  v5[v8 + 4] = v3;

  return swift_retain();
}

uint64_t sub_244528E90@<X0>(unint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24453AD40;
  *(void *)(inited + 32) = sub_2445388B0(*(unsigned char *)(v1 + 16));
  *(void *)(inited + 40) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F18);
  uint64_t v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_24453AD40;
  *(void *)(v5 + 32) = sub_2445388B0(*(unsigned char *)(v1 + 17));
  *(void *)(v5 + 40) = v6;
  *(void *)(v5 + 48) = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_24450B374(v5);
  unint64_t v7 = sub_24450B380(inited);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F20);
  a1[3] = result;
  a1[4] = (unint64_t)&off_26F92F340;
  *a1 = v7;
  return result;
}

uint64_t sub_244528F70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2445238AC(*a1, *a2);
}

uint64_t sub_244528F7C()
{
  return sub_24453A8D0();
}

uint64_t sub_24452901C()
{
  sub_24453A500();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2445290A8()
{
  return sub_24453A8D0();
}

uint64_t sub_244529144@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445381A8();
  *a1 = result;
  return result;
}

void sub_244529174(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000;
  unint64_t v4 = 0xEB0000000079654BLL;
  uint64_t v5 = 0x726F74617265706FLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x65756C6176;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 7955819;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2445291D0()
{
  uint64_t v1 = 0x726F74617265706FLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x65756C6176;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7955819;
  }
}

uint64_t sub_244529228@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2445381A8();
  *a1 = result;
  return result;
}

uint64_t sub_244529250(uint64_t a1)
{
  unint64_t v2 = sub_244531F94();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452928C(uint64_t a1)
{
  unint64_t v2 = sub_244531F94();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2445292C8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A270);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244531F94();
  sub_24453A8F0();
  v23[0] = *(unsigned char *)(v3 + 16);
  v21[0] = 0;
  sub_244514BD8();
  sub_24453A730();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v23[0] = *(unsigned char *)(v3 + 17);
  v21[0] = 1;
  sub_24453A730();
  v21[0] = 2;
  sub_24453A6F0();
  uint64_t v10 = *(void *)(v3 + 24);
  v15[0] = *(void *)(v10 + 16);
  if (v15[0])
  {
    uint64_t v18 = v10 + 32;
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v11 = 0;
    uint64_t v17 = v6;
    uint64_t v16 = result;
    while (v11 < *(void *)(result + 16))
    {
      unint64_t v25 = v11;
      uint64_t v12 = *(void *)(v18 + 8 * v11);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
      swift_bridgeObjectRetain();
      sub_24453A7E0();
      uint64_t v13 = *(void *)(v12 + 16);
      if (v13)
      {
        v15[1] = v12;
        uint64_t v14 = v12 + 32;
        do
        {
          sub_24451A0A8(v14, (uint64_t)v20);
          sub_24451A0A8((uint64_t)v20, (uint64_t)v19);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A280);
          if (swift_dynamicCast())
          {
            __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
            sub_24453A820();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
          }
          else
          {
            sub_24451A0A8((uint64_t)v20, (uint64_t)v19);
            if (swift_dynamicCast())
            {
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              sub_24453A7F0();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
              swift_bridgeObjectRelease();
            }
            else
            {
              sub_24451A0A8((uint64_t)v20, (uint64_t)v19);
              uint64_t result = swift_dynamicCast();
              if (!result) {
                goto LABEL_20;
              }
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              sub_24453A800();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
            }
          }
          v14 += 40;
          --v13;
        }
        while (v13);
      }
      swift_bridgeObjectRelease();
      unint64_t v11 = v25 + 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      uint64_t v6 = v17;
      uint64_t result = v16;
      if (v11 == v15[0])
      {
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  else
  {
LABEL_18:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  return result;
}

uint64_t EntitlementsQuery.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  EntitlementsQuery.init(from:)(a1);
  return v2;
}

uint64_t EntitlementsQuery.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A288);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244531F94();
  sub_24453A8E0();
  if (v2) {
    goto LABEL_14;
  }
  LOBYTE(v31[0]) = 0;
  sub_244516B6C();
  sub_24453A6C0();
  uint64_t v35 = v6;
  char v9 = v33[0];
  *(unsigned char *)(v1 + 16) = v33[0];
  if (sub_2445388B0(v9) == 0x6D656C7469746E65 && v10 == 0xEC00000073746E65)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v35;
  }
  else
  {
    char v12 = sub_24453A830();
    swift_bridgeObjectRelease();
    uint64_t v11 = v35;
    if ((v12 & 1) == 0)
    {
LABEL_13:
      sub_244516BC0();
      swift_allocError();
      *uint64_t v16 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v5);
LABEL_14:
      type metadata accessor for EntitlementsQuery();
      swift_deallocPartialClassInstance();
      goto LABEL_15;
    }
  }
  LOBYTE(v31[0]) = 1;
  sub_24453A6C0();
  char v13 = v33[0];
  *(unsigned char *)(v1 + 17) = v33[0];
  if (sub_2445388B0(v13) != 0x797265757124 || v14 != 0xE600000000000000)
  {
    char v15 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  LOBYTE(v31[0]) = 2;
  sub_24453A680();
  __swift_project_boxed_opaque_existential_1(v33, v34);
  if (sub_24453A7D0())
  {
    uint64_t v27 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x263F8EE78];
    do
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v34);
      sub_24453A780();
      __swift_project_boxed_opaque_existential_1(v31, v32);
      char v18 = sub_24453A7D0();
      uint64_t v19 = (void *)MEMORY[0x263F8EE78];
      if ((v18 & 1) == 0)
      {
        do
        {
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
          uint64_t v23 = sub_24453A7C0();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v19 = sub_244531FE8(0, v19[2] + 1, 1, v19, &qword_268E7A260, &qword_268E7A280);
          }
          unint64_t v25 = v19[2];
          unint64_t v24 = v19[3];
          if (v25 >= v24 >> 1) {
            uint64_t v19 = sub_244531FE8((void *)(v24 > 1), v25 + 1, 1, v19, &qword_268E7A260, &qword_268E7A280);
          }
          uint64_t v30 = &off_26F92F388;
          uint64_t v29 = MEMORY[0x263F8E5C0];
          *(void *)&long long v28 = v23;
          v19[2] = v25 + 1;
          sub_244516C78(&v28, (uint64_t)&v19[5 * v25 + 4]);
          __swift_project_boxed_opaque_existential_1(v31, v32);
        }
        while ((sub_24453A7D0() & 1) == 0);
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v27 = sub_244531E6C(0, v27[2] + 1, 1, v27, &qword_268E7A268, &qword_268E7AA68);
      }
      unint64_t v21 = v27[2];
      unint64_t v20 = v27[3];
      uint64_t v11 = v35;
      if (v21 >= v20 >> 1) {
        uint64_t v27 = sub_244531E6C((void *)(v20 > 1), v21 + 1, 1, v27, &qword_268E7A268, &qword_268E7AA68);
      }
      uint64_t v22 = v27;
      v27[2] = v21 + 1;
      v22[v21 + 4] = v19;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      __swift_project_boxed_opaque_existential_1(v33, v34);
    }
    while ((sub_24453A7D0() & 1) == 0);
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v5);
  *(void *)(v3 + 24) = v27;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_15:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t EntitlementsQuery.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EntitlementsQuery.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24452A020@<X0>(unint64_t *a1@<X8>)
{
  return sub_244528E90(a1);
}

uint64_t sub_24452A044@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for EntitlementsQuery();
  uint64_t v5 = swift_allocObject();
  uint64_t result = EntitlementsQuery.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_24452A09C(void *a1)
{
  return sub_2445292C8(a1);
}

unint64_t InfoPlistHash.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24452A0C8(a1, a2, 5, a3);
}

unint64_t sub_24452A0C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(unsigned char *)a4 = a3;
  *(void *)(a4 + 32) = MEMORY[0x263F06F78];
  unint64_t result = sub_244531AFC();
  *(void *)(a4 + 40) = result;
  *(void *)(a4 + 8) = a1;
  *(void *)(a4 + 16) = a2;
  return result;
}

uint64_t static InfoPlistHash.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244526E50(a1, 5, a2);
}

{
  return sub_244526E50(a1, 5, a2);
}

uint64_t sub_24452A124@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452A130@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452A13C(uint64_t a1)
{
  unint64_t v2 = sub_244532124();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452A178(uint64_t a1)
{
  unint64_t v2 = sub_244532124();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InfoPlistHash.encode(to:)(void *a1)
{
  return sub_24452A1F0(a1, &qword_268E7A290, (void (*)(void))sub_244532124);
}

uint64_t sub_24452A1F0(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24453A8F0();
  LOBYTE(v22) = *v5;
  LOBYTE(v18) = 0;
  sub_244514BD8();
  uint64_t v11 = v26;
  sub_24453A730();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_24451A0A8((uint64_t)(v5 + 8), (uint64_t)&v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1D0);
  if (swift_dynamicCast())
  {
    uint64_t v13 = v18;
    unint64_t v14 = v19;
    uint64_t v22 = v18;
    unint64_t v23 = v19;
    LOBYTE(v18) = 1;
    sub_244531C50();
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return sub_24451C7D8(v13, v14);
  }
  else
  {
    sub_24451A0A8((uint64_t)(v5 + 8), (uint64_t)&v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1B0);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      uint64_t v15 = v19;
      unint64_t v16 = v20;
      LOBYTE(v22) = v18;
      unint64_t v23 = v19;
      unint64_t v24 = v20;
      uint64_t v25 = v21;
      LOBYTE(v18) = 1;
      sub_244532688(&qword_268E7A1D8, &qword_268E7A1B0);
      sub_24453A730();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      sub_244531C3C(v15, v16);
      return swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t InfoPlistHash.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A2A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532124();
  sub_24453A8E0();
  if (!v2)
  {
    char v21 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v20[0]) = v17;
    if (sub_2445388B0(v17) == 0x696C702D6F666E69 && v10 == 0xEF687361682D7473)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *uint64_t v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    char v21 = 1;
    sub_244531CA4();
    uint64_t v12 = MEMORY[0x263F06F78];
    sub_24453A6C0();
    long long v14 = v17;
    uint64_t v18 = v12;
    unint64_t v19 = sub_244531AFC();
    long long v17 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v17, (uint64_t)v20 + 8);
    long long v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452A874@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v7 = MEMORY[0x263F06F78];
  if (swift_dynamicCast())
  {
    uint64_t v8 = v18;
    uint64_t v9 = v19;
    *(unsigned char *)a3 = a2;
    *(void *)(a3 + 32) = v7;
    *(void *)(a3 + 40) = sub_244531AFC();
    *(void *)(a3 + 8) = v8;
    *(void *)(a3 + 16) = v9;
  }
  else
  {
    sub_24451A0A8(a1, (uint64_t)v22);
    sub_244524378((uint64_t)v22, (uint64_t)&v18);
    if (!v3)
    {
      char v10 = v18;
      uint64_t v12 = v19;
      unint64_t v11 = v20;
      uint64_t v23 = v21;
      if (sub_2445388B0(v18) == 7235876 && v13 == 0xE300000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v14 = sub_24453A830();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {
          sub_244516BC0();
          swift_allocError();
          *uint64_t v16 = 1;
          swift_willThrow();
          sub_244531C3C(v12, v11);
          swift_bridgeObjectRelease();
          return __swift_destroy_boxed_opaque_existential_1(a1);
        }
      }
      *(unsigned char *)a3 = a2;
      *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A1B0);
      *(void *)(a3 + 40) = sub_244532688(&qword_268E7A1B8, &qword_268E7A1B0);
      uint64_t v15 = swift_allocObject();
      *(void *)(a3 + 8) = v15;
      *(unsigned char *)(v15 + 16) = v10;
      *(void *)(v15 + 24) = v12;
      *(void *)(v15 + 32) = v11;
      *(void *)(v15 + 40) = v23;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24452AA68@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return InfoPlistHash.init(from:)(a1, a2);
}

uint64_t sub_24452AA80(void *a1)
{
  return InfoPlistHash.encode(to:)(a1);
}

void InTrustCacheWithConstraintCategory.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 6;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t InTrustCacheWithConstraintCategory.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 6;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24452AAE4@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452AAF0@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452AAFC(uint64_t a1)
{
  unint64_t v2 = sub_244532178();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452AB38(uint64_t a1)
{
  unint64_t v2 = sub_244532178();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InTrustCacheWithConstraintCategory.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A2A8, (void (*)(void))sub_244532178);
}

uint64_t sub_24452ABB0(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = &v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24453A8F0();
  v14[0] = *v5;
  v14[55] = 0;
  sub_244514BD8();
  uint64_t v11 = v13;
  sub_24453A730();
  if (!v11)
  {
    sub_24451A0A8((uint64_t)(v5 + 8), (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A198);
    swift_dynamicCast();
    v14[0] = 1;
    sub_24453A720();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t InTrustCacheWithConstraintCategory.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A2B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532178();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD00000000000001ELL && v9 == 0x8000000244540170)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452AFF4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return InTrustCacheWithConstraintCategory.init(from:)(a1, a2);
}

uint64_t sub_24452B00C(void *a1)
{
  return InTrustCacheWithConstraintCategory.encode(to:)(a1);
}

void IsInitProcess.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 7;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t IsInitProcess.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 7;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24452B070@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452B07C@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452B088(uint64_t a1)
{
  unint64_t v2 = sub_2445321CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452B0C4(uint64_t a1)
{
  unint64_t v2 = sub_2445321CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IsInitProcess.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A2C0, (void (*)(void))sub_2445321CC);
}

uint64_t IsInitProcess.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A2D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445321CC();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0x2D74696E692D7369 && v9 == 0xEC000000636F7270)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452B3DC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsInitProcess.init(from:)(a1, a2);
}

uint64_t sub_24452B3F4(void *a1)
{
  return IsInitProcess.encode(to:)(a1);
}

void IsMainBinary.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 8;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t IsMainBinary.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 8;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24452B458@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452B464@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452B470(uint64_t a1)
{
  unint64_t v2 = sub_244532220();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452B4AC(uint64_t a1)
{
  unint64_t v2 = sub_244532220();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IsMainBinary.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A2D8, (void (*)(void))sub_244532220);
}

uint64_t IsMainBinary.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A2E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532220();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0x2D6E69616D2D7369 && v9 == 0xEE007972616E6962)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452B7D0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsMainBinary.init(from:)(a1, a2);
}

uint64_t sub_24452B7E8(void *a1)
{
  return IsMainBinary.encode(to:)(a1);
}

void IsSIPProtected.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 9;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t IsSIPProtected.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 9;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24452B84C@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452B858@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452B864(uint64_t a1)
{
  unint64_t v2 = sub_244532274();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452B8A0(uint64_t a1)
{
  unint64_t v2 = sub_244532274();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IsSIPProtected.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A2F0, (void (*)(void))sub_244532274);
}

uint64_t IsSIPProtected.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A300);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532274();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD000000000000010 && v9 == 0x80000002445401B0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452BBA0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsSIPProtected.init(from:)(a1, a2);
}

uint64_t sub_24452BBB8(void *a1)
{
  return IsSIPProtected.encode(to:)(a1);
}

uint64_t LaunchType.Value.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t LaunchType.Value.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result <= 3) {
    unint64_t v2 = result;
  }
  else {
    unint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = result > 3;
  return result;
}

void static LaunchType.Value.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static LaunchType.Value.application.getter(void *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24452BC04()
{
  return sub_24453A550();
}

uint64_t sub_24452BC64()
{
  return sub_24453A530();
}

uint64_t sub_24452BCB8()
{
  return sub_24453A8C0();
}

uint64_t *sub_24452BCE8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 3;
  if ((unint64_t)*result > 3) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t *LaunchType.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = MEMORY[0x263F8E5C0];
  *(unsigned char *)a2 = 10;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = &off_26F92CAF8;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t static LaunchType.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452BD6C(a1, 10, &qword_268E7A308, &qword_268E7A310, a2);
}

{
  return sub_24452BD6C(a1, 10, &qword_268E7A308, &qword_268E7A310, a2);
}

uint64_t sub_24452BD6C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = a2;
  *(void *)(a5 + 32) = __swift_instantiateConcreteTypeFromMangledName(a3);
  *(void *)(a5 + 40) = sub_244532688(a4, a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(v9 + 16) = 22;
  *(void *)(v9 + 24) = 0;
  *(unsigned char *)(v9 + 32) = 1;
  *(void *)(v9 + 40) = a1;

  return swift_bridgeObjectRetain();
}

uint64_t sub_24452BE20@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452BE2C@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452BE38(uint64_t a1)
{
  unint64_t v2 = sub_2445322C8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452BE74(uint64_t a1)
{
  unint64_t v2 = sub_2445322C8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LaunchType.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A318);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445322C8();
  sub_24453A8F0();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_244514BD8();
  sub_24453A730();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A328);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_24453A740();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A308);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_244532688(&qword_268E7A330, &qword_268E7A308);
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LaunchType.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A338);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445322C8();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0x742D68636E75616CLL && v10 == 0xEB00000000657079)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    uint64_t v12 = sub_24453A6D0();
    uint64_t v17 = MEMORY[0x263F8E5C0];
    uint64_t v18 = &off_26F92CAF8;
    *(void *)&long long v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v16, (uint64_t)v19 + 8);
    long long v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452C4B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v5 = MEMORY[0x263F8E5C0];
  if (swift_dynamicCast())
  {
    uint64_t v6 = v38[0];
    if (v38[0] < 4uLL)
    {
      *(unsigned char *)a2 = 10;
      *(void *)(a2 + 32) = v5;
      *(void *)(a2 + 40) = &off_26F92CAF8;
      *(void *)(a2 + 8) = v6;
LABEL_19:
      uint64_t v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
LABEL_18:
    sub_244516BC0();
    swift_allocError();
    *uint64_t v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  sub_24451A0A8(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (*(void *)(v38[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_244521784(v38[0], (uint64_t)&v34);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = v35;
  if (v35)
  {
    unint64_t v9 = v34;
    sub_244516C78(&v36, (uint64_t)v38);
    sub_24451A0A8((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA78);
    if (swift_dynamicCast())
    {
      uint64_t v30 = a2;
      uint64_t v10 = v31[0];
      uint64_t v11 = *(void *)(v31[0] + 16);
      if (v11)
      {
        uint64_t v39 = v8;
        swift_bridgeObjectRetain();
        uint64_t v12 = 0;
        char v13 = (char *)MEMORY[0x263F8EE78];
        do
        {
          unint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
          if (v14 <= 3)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              char v13 = sub_244531988(0, *((void *)v13 + 2) + 1, 1, v13, qword_268E7AAE8);
            }
            unint64_t v16 = *((void *)v13 + 2);
            unint64_t v15 = *((void *)v13 + 3);
            if (v16 >= v15 >> 1) {
              char v13 = sub_244531988((char *)(v15 > 1), v16 + 1, 1, v13, qword_268E7AAE8);
            }
            *((void *)v13 + 2) = v16 + 1;
            *(void *)&v13[8 * v16 + 32] = v14;
          }
          ++v12;
        }
        while (v11 != v12);
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v10 + 16);
        uint64_t v8 = v39;
      }
      else
      {
        uint64_t v19 = 0;
        char v13 = (char *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      if (v19 == *((void *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AAD0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24453AD40;
        *(void *)(inited + 32) = v9;
        *(void *)(inited + 40) = v8;
        *(void *)(inited + 48) = v13;
        unint64_t v21 = sub_24450B3A4(inited);
        *((void *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AAD8);
        uint64_t v37 = &off_26F92F340;
        unint64_t v34 = v21;
        sub_24452499C((uint64_t)&v34, &qword_268E7AAE0, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          uint64_t v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        char v22 = v31[0];
        uint64_t v23 = v31[1];
        char v24 = v32;
        uint64_t v25 = v33;
        if (sub_2445388B0(v31[0]) == 7235876 && v26 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(unsigned char *)uint64_t v30 = 10;
          *(void *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A308);
          *(void *)(v30 + 40) = sub_244532688(&qword_268E7A310, &qword_268E7A308);
          uint64_t v29 = swift_allocObject();
          *(void *)(v30 + 8) = v29;
          *(unsigned char *)(v29 + 16) = v22;
          *(void *)(v29 + 24) = v23;
          *(unsigned char *)(v29 + 32) = v24;
          *(void *)(v29 + 40) = v25;
          goto LABEL_30;
        }
        char v28 = sub_24453A830();
        swift_bridgeObjectRelease();
        if (v28) {
          goto LABEL_32;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_244516BC0();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_24452C8FC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return LaunchType.init(from:)(a1, a2);
}

uint64_t sub_24452C914(void *a1)
{
  return LaunchType.encode(to:)(a1);
}

uint64_t sub_24452C92C@<X0>(unint64_t *a1@<X8>)
{
  return sub_244526560(&qword_268E7A308, a1);
}

void OnAuthorizedAuthAPFSVolume.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 11;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t OnAuthorizedAuthAPFSVolume.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 11;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24452C998@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452C9A4@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452C9B0(uint64_t a1)
{
  unint64_t v2 = sub_24453231C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452C9EC(uint64_t a1)
{
  unint64_t v2 = sub_24453231C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnAuthorizedAuthAPFSVolume.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A348, (void (*)(void))sub_24453231C);
}

uint64_t OnAuthorizedAuthAPFSVolume.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A358);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24453231C();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD00000000000001DLL && v9 == 0x80000002445401D0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *char v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452CCEC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnAuthorizedAuthAPFSVolume.init(from:)(a1, a2);
}

uint64_t sub_24452CD04(void *a1)
{
  return OnAuthorizedAuthAPFSVolume.encode(to:)(a1);
}

void OnSystemVolume.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 12;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t OnSystemVolume.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 12;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24452CD68@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452CD74@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452CD80(uint64_t a1)
{
  unint64_t v2 = sub_244532370();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452CDBC(uint64_t a1)
{
  unint64_t v2 = sub_244532370();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnSystemVolume.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A360, (void (*)(void))sub_244532370);
}

uint64_t OnSystemVolume.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A370);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532370();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD000000000000010 && v9 == 0x80000002445401F0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *char v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452D0BC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnSystemVolume.init(from:)(a1, a2);
}

uint64_t sub_24452D0D4(void *a1)
{
  return OnSystemVolume.encode(to:)(a1);
}

uint64_t OSEnvironment.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = 13;
  *(void *)(a3 + 32) = MEMORY[0x263F8D310];
  *(void *)(a3 + 40) = &off_26F92CAB0;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t static OSEnvironment.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452D120(a1, 13, a2);
}

{
  return sub_24452D120(a1, 13, a2);
}

uint64_t sub_24452D120@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = a2;
  *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A378);
  *(void *)(a3 + 40) = sub_244532688(&qword_268E7A380, &qword_268E7A378);
  uint64_t v5 = swift_allocObject();
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(v5 + 16) = 22;
  *(void *)(v5 + 24) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = a1;

  return swift_bridgeObjectRetain();
}

uint64_t sub_24452D1C8@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452D1D4@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452D1E0(uint64_t a1)
{
  unint64_t v2 = sub_244532404();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452D21C(uint64_t a1)
{
  unint64_t v2 = sub_244532404();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OSEnvironment.encode(to:)(void *a1)
{
  return sub_24452F738(a1, &qword_268E7A388, (void (*)(void))sub_244532404);
}

uint64_t OSEnvironment.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A3A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532404();
  sub_24453A8E0();
  if (!v2)
  {
    char v21 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v20[0]) = v17;
    if (sub_2445388B0(v17) == 0x7269766E652D736FLL && v10 == 0xEE00746E656D6E6FLL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v17) = 1;
    uint64_t v12 = sub_24453A6A0();
    uint64_t v18 = MEMORY[0x263F8D310];
    uint64_t v19 = &off_26F92CAB0;
    *(void *)&long long v17 = v12;
    *((void *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v17, (uint64_t)v20 + 8);
    long long v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452D61C@<X0>(unint64_t *a1@<X8>)
{
  return sub_244525F20(a1);
}

uint64_t sub_24452D634@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OSEnvironment.init(from:)(a1, a2);
}

uint64_t sub_24452D64C(void *a1)
{
  return OSEnvironment.encode(to:)(a1);
}

uint64_t PlatformType.Value.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t PlatformType.Value.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((unint64_t)(result - 13) >= 0xFFFFFFFFFFFFFFF4) {
    uint64_t v2 = result;
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = (unint64_t)(result - 13) < 0xFFFFFFFFFFFFFFF4;
  return result;
}

void static PlatformType.Value.bridgeOS.getter(void *a1@<X8>)
{
  *a1 = 5;
}

void static PlatformType.Value.macCatalyst.getter(void *a1@<X8>)
{
  *a1 = 6;
}

void static PlatformType.Value.iOSSimulator.getter(void *a1@<X8>)
{
  *a1 = 7;
}

void static PlatformType.Value.watchOSSimulator.getter(void *a1@<X8>)
{
  *a1 = 9;
}

void static PlatformType.Value.driverKit.getter(void *a1@<X8>)
{
  *a1 = 10;
}

void static PlatformType.Value.visionOS.getter(void *a1@<X8>)
{
  *a1 = 11;
}

void static PlatformType.Value.visionOSSimulator.getter(void *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_24452D6DC()
{
  return sub_24453A550();
}

uint64_t sub_24452D73C()
{
  return sub_24453A530();
}

uint64_t *sub_24452D78C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  unint64_t v3 = *result - 13;
  BOOL v4 = __CFADD__(v3, 12);
  BOOL v5 = v3 < 0xFFFFFFFFFFFFFFF4;
  if (!v4) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t *PlatformType.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = MEMORY[0x263F8E5C0];
  *(unsigned char *)a2 = 15;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = &off_26F92CAF8;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t static PlatformType.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452BD6C(a1, 15, &qword_268E7A3B8, &qword_268E7A3C0, a2);
}

{
  return sub_24452BD6C(a1, 15, &qword_268E7A3B8, &qword_268E7A3C0, a2);
}

uint64_t sub_24452D814@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452D820@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452D82C(uint64_t a1)
{
  unint64_t v2 = sub_244532490();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452D868(uint64_t a1)
{
  unint64_t v2 = sub_244532490();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlatformType.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A3C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532490();
  sub_24453A8F0();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_244514BD8();
  sub_24453A730();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A328);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_24453A740();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A3B8);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_244532688(&qword_268E7A3D8, &qword_268E7A3B8);
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PlatformType.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A3E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532490();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0x6D726F6674616C70 && v10 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    uint64_t v12 = sub_24453A6D0();
    uint64_t v17 = MEMORY[0x263F8E5C0];
    uint64_t v18 = &off_26F92CAF8;
    *(void *)&long long v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v16, (uint64_t)v19 + 8);
    long long v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452DE94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v5 = MEMORY[0x263F8E5C0];
  if (swift_dynamicCast())
  {
    uint64_t v6 = v38[0];
    if ((unint64_t)(v38[0] - 13) > 0xFFFFFFFFFFFFFFF3)
    {
      *(unsigned char *)a2 = 15;
      *(void *)(a2 + 32) = v5;
      *(void *)(a2 + 40) = &off_26F92CAF8;
      *(void *)(a2 + 8) = v6;
LABEL_19:
      uint64_t v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
LABEL_18:
    sub_244516BC0();
    swift_allocError();
    *uint64_t v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  sub_24451A0A8(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (*(void *)(v38[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_244521784(v38[0], (uint64_t)&v34);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = v35;
  if (v35)
  {
    unint64_t v9 = v34;
    sub_244516C78(&v36, (uint64_t)v38);
    sub_24451A0A8((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA78);
    if (swift_dynamicCast())
    {
      uint64_t v30 = a2;
      uint64_t v10 = v31[0];
      uint64_t v11 = *(void *)(v31[0] + 16);
      if (v11)
      {
        uint64_t v39 = v8;
        swift_bridgeObjectRetain();
        uint64_t v12 = 0;
        char v13 = (char *)MEMORY[0x263F8EE78];
        do
        {
          uint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
          if ((unint64_t)(v14 - 13) >= 0xFFFFFFFFFFFFFFF4)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              char v13 = sub_244531988(0, *((void *)v13 + 2) + 1, 1, v13, &qword_268E7AAA8);
            }
            unint64_t v16 = *((void *)v13 + 2);
            unint64_t v15 = *((void *)v13 + 3);
            if (v16 >= v15 >> 1) {
              char v13 = sub_244531988((char *)(v15 > 1), v16 + 1, 1, v13, &qword_268E7AAA8);
            }
            *((void *)v13 + 2) = v16 + 1;
            *(void *)&v13[8 * v16 + 32] = v14;
          }
          ++v12;
        }
        while (v11 != v12);
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v10 + 16);
        uint64_t v8 = v39;
      }
      else
      {
        uint64_t v19 = 0;
        char v13 = (char *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      if (v19 == *((void *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA90);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24453AD40;
        *(void *)(inited + 32) = v9;
        *(void *)(inited + 40) = v8;
        *(void *)(inited + 48) = v13;
        unint64_t v21 = sub_24450B38C(inited);
        *((void *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA98);
        uint64_t v37 = &off_26F92F340;
        unint64_t v34 = v21;
        sub_24452499C((uint64_t)&v34, &qword_268E7AAA0, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          uint64_t v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        char v22 = v31[0];
        uint64_t v23 = v31[1];
        char v24 = v32;
        uint64_t v25 = v33;
        if (sub_2445388B0(v31[0]) == 7235876 && v26 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(unsigned char *)uint64_t v30 = 15;
          *(void *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A3B8);
          *(void *)(v30 + 40) = sub_244532688(&qword_268E7A3C0, &qword_268E7A3B8);
          uint64_t v29 = swift_allocObject();
          *(void *)(v30 + 8) = v29;
          *(unsigned char *)(v29 + 16) = v22;
          *(void *)(v29 + 24) = v23;
          *(unsigned char *)(v29 + 32) = v24;
          *(void *)(v29 + 40) = v25;
          goto LABEL_30;
        }
        char v28 = sub_24453A830();
        swift_bridgeObjectRelease();
        if (v28) {
          goto LABEL_32;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_244516BC0();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_24452E2E0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PlatformType.init(from:)(a1, a2);
}

uint64_t sub_24452E2F8(void *a1)
{
  return PlatformType.encode(to:)(a1);
}

uint64_t sub_24452E310@<X0>(unint64_t *a1@<X8>)
{
  return sub_244526560(&qword_268E7A3B8, a1);
}

uint64_t PlatformIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8E5C0];
  *(unsigned char *)a2 = 14;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAF8;
  *(void *)(a2 + 8) = result;
  return result;
}

uint64_t static PlatformIdentifier.greaterThan(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
  *(void *)(a2 + 40) = sub_244532688(&qword_268E7A3F0, &qword_268E7A210);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(result + 16) = 24;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.greaterThanOrEqual(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
  *(void *)(a2 + 40) = sub_244532688(&qword_268E7A3F0, &qword_268E7A210);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(result + 16) = 25;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.lessThan(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
  *(void *)(a2 + 40) = sub_244532688(&qword_268E7A3F0, &qword_268E7A210);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(result + 16) = 26;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.lessThanOrEqual(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
  *(void *)(a2 + 40) = sub_244532688(&qword_268E7A3F0, &qword_268E7A210);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(result + 16) = 27;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452BD6C(a1, 14, &qword_268E7A210, &qword_268E7A3F0, a2);
}

{
  return sub_24452BD6C(a1, 14, &qword_268E7A210, &qword_268E7A3F0, a2);
}

uint64_t sub_24452E604@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452E610@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452E61C(uint64_t a1)
{
  unint64_t v2 = sub_2445324E4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452E658(uint64_t a1)
{
  unint64_t v2 = sub_2445324E4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlatformIdentifier.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A3F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445324E4();
  sub_24453A8F0();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_244514BD8();
  sub_24453A730();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A328);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_24453A740();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_244532688(&qword_268E7A218, &qword_268E7A210);
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PlatformIdentifier.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A408);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445324E4();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD000000000000013 && v10 == 0x8000000244540210)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    uint64_t v12 = sub_24453A6D0();
    uint64_t v17 = MEMORY[0x263F8E5C0];
    uint64_t v18 = &off_26F92CAF8;
    *(void *)&long long v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v16, (uint64_t)v19 + 8);
    long long v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452EC84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v5 = MEMORY[0x263F8E5C0];
  if (swift_dynamicCast())
  {
    *(unsigned char *)a2 = 14;
    *(void *)(a2 + 32) = v5;
    *(void *)(a2 + 40) = &off_26F92CAF8;
    *(void *)(a2 + 8) = v17;
  }
  else
  {
    sub_24451A0A8(a1, (uint64_t)v18);
    char v6 = sub_24452458C((uint64_t)v18);
    if (!v2)
    {
      char v10 = v6;
      uint64_t v11 = v7;
      char v12 = v8;
      uint64_t v13 = v9;
      if (sub_24452EE1C(v6, (uint64_t)&unk_26F92B158))
      {
        *(unsigned char *)a2 = 14;
        *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A210);
        *(void *)(a2 + 40) = sub_244532688(&qword_268E7A3F0, &qword_268E7A210);
        uint64_t v14 = swift_allocObject();
        *(void *)(a2 + 8) = v14;
        *(unsigned char *)(v14 + 16) = v10;
        *(void *)(v14 + 24) = v11;
        *(unsigned char *)(v14 + 32) = v12 & 1;
        *(void *)(v14 + 40) = v13;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_244516BC0();
        swift_allocError();
        *uint64_t v15 = 1;
        swift_willThrow();
      }
    }
  }
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24452EE1C(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = a2 + v5++;
    unint64_t v7 = 0xEE006C616E726574;
    unint64_t v8 = 0x6E692D656C707061;
    switch(*(unsigned char *)(v6 + 32))
    {
      case 1:
        unint64_t v7 = 0xE600000000000000;
        unint64_t v8 = 0x687361686463;
        break;
      case 2:
        unint64_t v8 = 0xD000000000000012;
        uint64_t v9 = "code-signing-flags";
        goto LABEL_24;
      case 3:
        unint64_t v8 = 0x65706F6C65766564;
        unint64_t v7 = 0xEE0065646F6D2D72;
        break;
      case 4:
        unint64_t v8 = 0x6D656C7469746E65;
        unint64_t v7 = 0xEC00000073746E65;
        break;
      case 5:
        unint64_t v8 = 0x696C702D6F666E69;
        unint64_t v7 = 0xEF687361682D7473;
        break;
      case 6:
        unint64_t v8 = 0xD00000000000001ELL;
        uint64_t v9 = "in-tc-with-constraint-category";
        goto LABEL_24;
      case 7:
        unint64_t v8 = 0x2D74696E692D7369;
        unint64_t v7 = 0xEC000000636F7270;
        break;
      case 8:
        unint64_t v8 = 0x2D6E69616D2D7369;
        unint64_t v7 = 0xEE007972616E6962;
        break;
      case 9:
        char v10 = "is-sip-protected";
        goto LABEL_16;
      case 0xA:
        unint64_t v8 = 0x742D68636E75616CLL;
        unint64_t v7 = 0xEB00000000657079;
        break;
      case 0xB:
        unint64_t v8 = 0xD00000000000001DLL;
        uint64_t v9 = "on-authorized-authapfs-volume";
        goto LABEL_24;
      case 0xC:
        char v10 = "on-system-volume";
LABEL_16:
        unint64_t v7 = (unint64_t)(v10 - 32) | 0x8000000000000000;
        unint64_t v8 = 0xD000000000000010;
        break;
      case 0xD:
        unint64_t v8 = 0x7269766E652D736FLL;
        unint64_t v7 = 0xEE00746E656D6E6FLL;
        break;
      case 0xE:
        unint64_t v8 = 0xD000000000000013;
        uint64_t v9 = "platform-identifier";
        goto LABEL_24;
      case 0xF:
        unint64_t v7 = 0xE800000000000000;
        unint64_t v8 = 0x6D726F6674616C70;
        break;
      case 0x10:
        unint64_t v8 = 0xD000000000000012;
        uint64_t v9 = "signing-identifier";
        goto LABEL_24;
      case 0x11:
        unint64_t v8 = 0x6564692D6D616574;
        unint64_t v7 = 0xEF7265696669746ELL;
        break;
      case 0x12:
        unint64_t v8 = 0xD000000000000023;
        uint64_t v9 = "team-identifier-for-current-process";
        goto LABEL_24;
      case 0x13:
        unint64_t v8 = 0xD000000000000013;
        uint64_t v9 = "validation-category";
LABEL_24:
        unint64_t v7 = (unint64_t)(v9 - 32) | 0x8000000000000000;
        break;
      case 0x14:
        unint64_t v7 = 0xE400000000000000;
        unint64_t v8 = 1684955428;
        break;
      case 0x15:
        unint64_t v8 = 0x7272612D646E6124;
        unint64_t v7 = 0xEA00000000007961;
        break;
      case 0x16:
        unint64_t v7 = 0xE300000000000000;
        unint64_t v8 = 7235876;
        break;
      case 0x17:
        unint64_t v8 = 0x68632D67616C6624;
        unint64_t v7 = 0xEB000000006B6365;
        break;
      case 0x18:
        unint64_t v7 = 0xE300000000000000;
        unint64_t v8 = 7628580;
        break;
      case 0x19:
        unint64_t v7 = 0xE400000000000000;
        unint64_t v8 = 1702127396;
        break;
      case 0x1A:
        unint64_t v8 = 7629860;
        unint64_t v7 = 0xE300000000000000;
        break;
      case 0x1B:
        unint64_t v8 = 1702128676;
        unint64_t v7 = 0xE400000000000000;
        break;
      case 0x1C:
        unint64_t v7 = 0xE300000000000000;
        unint64_t v8 = 7499556;
        break;
      case 0x1D:
        unint64_t v8 = 0x617272612D726F24;
        unint64_t v7 = 0xE900000000000079;
        break;
      case 0x1E:
        unint64_t v7 = 0xE600000000000000;
        unint64_t v8 = 0x797265757124;
        break;
      default:
        break;
    }
    unint64_t v11 = 0x6E692D656C707061;
    unint64_t v12 = 0xEE006C616E726574;
    switch(a1)
    {
      case 1:
        unint64_t v12 = 0xE600000000000000;
        unint64_t v11 = 0x687361686463;
        break;
      case 2:
        unint64_t v11 = 0xD000000000000012;
        uint64_t v13 = "code-signing-flags";
        goto LABEL_57;
      case 3:
        unint64_t v11 = 0x65706F6C65766564;
        unint64_t v12 = 0xEE0065646F6D2D72;
        break;
      case 4:
        unint64_t v11 = 0x6D656C7469746E65;
        unint64_t v12 = 0xEC00000073746E65;
        break;
      case 5:
        unint64_t v11 = 0x696C702D6F666E69;
        unint64_t v12 = 0xEF687361682D7473;
        break;
      case 6:
        unint64_t v11 = 0xD00000000000001ELL;
        uint64_t v13 = "in-tc-with-constraint-category";
        goto LABEL_57;
      case 7:
        unint64_t v11 = 0x2D74696E692D7369;
        unint64_t v12 = 0xEC000000636F7270;
        break;
      case 8:
        unint64_t v11 = 0x2D6E69616D2D7369;
        unint64_t v12 = 0xEE007972616E6962;
        break;
      case 9:
        uint64_t v14 = "is-sip-protected";
        goto LABEL_49;
      case 10:
        unint64_t v11 = 0x742D68636E75616CLL;
        unint64_t v12 = 0xEB00000000657079;
        break;
      case 11:
        unint64_t v11 = 0xD00000000000001DLL;
        uint64_t v13 = "on-authorized-authapfs-volume";
        goto LABEL_57;
      case 12:
        uint64_t v14 = "on-system-volume";
LABEL_49:
        unint64_t v12 = (unint64_t)(v14 - 32) | 0x8000000000000000;
        unint64_t v11 = 0xD000000000000010;
        break;
      case 13:
        unint64_t v11 = 0x7269766E652D736FLL;
        unint64_t v12 = 0xEE00746E656D6E6FLL;
        break;
      case 14:
        unint64_t v11 = 0xD000000000000013;
        uint64_t v13 = "platform-identifier";
        goto LABEL_57;
      case 15:
        unint64_t v12 = 0xE800000000000000;
        unint64_t v11 = 0x6D726F6674616C70;
        break;
      case 16:
        unint64_t v11 = 0xD000000000000012;
        uint64_t v13 = "signing-identifier";
        goto LABEL_57;
      case 17:
        unint64_t v11 = 0x6564692D6D616574;
        unint64_t v12 = 0xEF7265696669746ELL;
        break;
      case 18:
        unint64_t v11 = 0xD000000000000023;
        uint64_t v13 = "team-identifier-for-current-process";
        goto LABEL_57;
      case 19:
        unint64_t v11 = 0xD000000000000013;
        uint64_t v13 = "validation-category";
LABEL_57:
        unint64_t v12 = (unint64_t)(v13 - 32) | 0x8000000000000000;
        break;
      case 20:
        unint64_t v12 = 0xE400000000000000;
        unint64_t v11 = 1684955428;
        break;
      case 21:
        unint64_t v11 = 0x7272612D646E6124;
        unint64_t v12 = 0xEA00000000007961;
        break;
      case 22:
        unint64_t v12 = 0xE300000000000000;
        unint64_t v11 = 7235876;
        break;
      case 23:
        unint64_t v11 = 0x68632D67616C6624;
        unint64_t v12 = 0xEB000000006B6365;
        break;
      case 24:
        unint64_t v12 = 0xE300000000000000;
        unint64_t v11 = 7628580;
        break;
      case 25:
        unint64_t v12 = 0xE400000000000000;
        unint64_t v11 = 1702127396;
        break;
      case 26:
        unint64_t v11 = 7629860;
        unint64_t v12 = 0xE300000000000000;
        break;
      case 27:
        unint64_t v11 = 1702128676;
        unint64_t v12 = 0xE400000000000000;
        break;
      case 28:
        unint64_t v12 = 0xE300000000000000;
        unint64_t v11 = 7499556;
        break;
      case 29:
        unint64_t v11 = 0x617272612D726F24;
        unint64_t v12 = 0xE900000000000079;
        break;
      case 30:
        unint64_t v12 = 0xE600000000000000;
        unint64_t v11 = 0x797265757124;
        break;
      default:
        break;
    }
    if (v8 == v11 && v7 == v12)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return 1;
    }
    char v15 = sub_24453A830();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v15) {
      break;
    }
    if (v2 == v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_24452F5F0@<X0>(unint64_t *a1@<X8>)
{
  return sub_244526360(a1);
}

uint64_t sub_24452F608@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PlatformIdentifier.init(from:)(a1, a2);
}

uint64_t sub_24452F620(void *a1)
{
  return PlatformIdentifier.encode(to:)(a1);
}

uint64_t SigningIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = 16;
  *(void *)(a3 + 32) = MEMORY[0x263F8D310];
  *(void *)(a3 + 40) = &off_26F92CAB0;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t static SigningIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452D120(a1, 16, a2);
}

{
  return sub_24452D120(a1, 16, a2);
}

uint64_t sub_24452F66C@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452F678@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452F684(uint64_t a1)
{
  unint64_t v2 = sub_244532538();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452F6C0(uint64_t a1)
{
  unint64_t v2 = sub_244532538();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SigningIdentifier.encode(to:)(void *a1)
{
  return sub_24452F738(a1, &qword_268E7A410, (void (*)(void))sub_244532538);
}

uint64_t sub_24452F738(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24453A8F0();
  v18[0] = *v5;
  LOBYTE(v14) = 0;
  sub_244514BD8();
  uint64_t v11 = v22;
  sub_24453A730();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_24451A0A8((uint64_t)(v5 + 8), (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A398);
  if (swift_dynamicCast())
  {
    v18[0] = 1;
    sub_24453A710();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_24451A0A8((uint64_t)(v5 + 8), (uint64_t)v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A378);
    uint64_t result = swift_dynamicCast();
    if (!result)
    {
      __break(1u);
      return result;
    }
    v18[0] = v14;
    uint64_t v19 = v15;
    uint64_t v20 = v16;
    uint64_t v21 = v17;
    LOBYTE(v14) = 1;
    sub_244532688(&qword_268E7A3A0, &qword_268E7A378);
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t SigningIdentifier.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A420);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532538();
  sub_24453A8E0();
  if (!v2)
  {
    char v21 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v20[0]) = v17;
    if (sub_2445388B0(v17) == 0xD000000000000012 && v10 == 0x8000000244540230)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *uint64_t v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v17) = 1;
    uint64_t v12 = sub_24453A6A0();
    uint64_t v18 = MEMORY[0x263F8D310];
    uint64_t v19 = &off_26F92CAB0;
    *(void *)&long long v17 = v12;
    *((void *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v17, (uint64_t)v20 + 8);
    long long v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24452FD58@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v7 = MEMORY[0x263F8D310];
  if (swift_dynamicCast())
  {
    *(unsigned char *)a3 = a2;
    *(void *)(a3 + 32) = v7;
    *(void *)(a3 + 40) = &off_26F92CAB0;
    *(void *)(a3 + 8) = v20;
    *(void *)(a3 + 16) = v21;
  }
  else
  {
    sub_24451A0A8(a1, (uint64_t)v22);
    char v8 = sub_244524798((uint64_t)v22);
    if (!v3)
    {
      char v12 = v8;
      uint64_t v13 = v10;
      uint64_t v14 = v11;
      uint64_t v23 = v9;
      if (sub_2445388B0(v8) == 7235876 && v15 == 0xE300000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v16 = sub_24453A830();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244516BC0();
          swift_allocError();
          *uint64_t v18 = 1;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1(a1);
        }
      }
      *(unsigned char *)a3 = a2;
      *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A378);
      *(void *)(a3 + 40) = sub_244532688(&qword_268E7A380, &qword_268E7A378);
      uint64_t v17 = swift_allocObject();
      *(void *)(a3 + 8) = v17;
      *(unsigned char *)(v17 + 16) = v12;
      *(void *)(v17 + 24) = v23;
      *(void *)(v17 + 32) = v13;
      *(void *)(v17 + 40) = v14;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24452FF40@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return SigningIdentifier.init(from:)(a1, a2);
}

uint64_t sub_24452FF58(void *a1)
{
  return SigningIdentifier.encode(to:)(a1);
}

uint64_t TeamIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = 17;
  *(void *)(a3 + 32) = MEMORY[0x263F8D310];
  *(void *)(a3 + 40) = &off_26F92CAB0;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t static TeamIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452D120(a1, 17, a2);
}

{
  return sub_24452D120(a1, 17, a2);
}

uint64_t sub_24452FFA4@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_24452FFB0@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24452FFBC(uint64_t a1)
{
  unint64_t v2 = sub_24453258C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24452FFF8(uint64_t a1)
{
  unint64_t v2 = sub_24453258C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TeamIdentifier.encode(to:)(void *a1)
{
  return sub_24452F738(a1, &qword_268E7A428, (void (*)(void))sub_24453258C);
}

uint64_t TeamIdentifier.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A438);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24453258C();
  sub_24453A8E0();
  if (!v2)
  {
    char v21 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v20[0]) = v17;
    if (sub_2445388B0(v17) == 0x6564692D6D616574 && v10 == 0xEF7265696669746ELL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *uint64_t v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v17) = 1;
    uint64_t v12 = sub_24453A6A0();
    uint64_t v18 = MEMORY[0x263F8D310];
    uint64_t v19 = &off_26F92CAB0;
    *(void *)&long long v17 = v12;
    *((void *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v17, (uint64_t)v20 + 8);
    long long v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2445303F8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return TeamIdentifier.init(from:)(a1, a2);
}

uint64_t sub_244530410(void *a1)
{
  return TeamIdentifier.encode(to:)(a1);
}

void TeamIdentifierMatchesCurrentProcess.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 18;
  *(void *)(a1 + 32) = MEMORY[0x263F8D4F8];
  *(void *)(a1 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t TeamIdentifierMatchesCurrentProcess.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(unsigned char *)a2 = 18;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_26F92CAE0;
  *(unsigned char *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244530474@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_244530480@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_24453048C(uint64_t a1)
{
  unint64_t v2 = sub_2445325E0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2445304C8(uint64_t a1)
{
  unint64_t v2 = sub_2445325E0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TeamIdentifierMatchesCurrentProcess.encode(to:)(void *a1)
{
  return sub_24452ABB0(a1, &qword_268E7A440, (void (*)(void))sub_2445325E0);
}

uint64_t TeamIdentifierMatchesCurrentProcess.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A450);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445325E0();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD000000000000023 && v9 == 0x8000000244540260)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v10 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_24453A6B0();
      uint64_t v17 = MEMORY[0x263F8D4F8];
      uint64_t v18 = &off_26F92CAE0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_244516C78(&v16, (uint64_t)v19 + 8);
      long long v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_244516BC0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2445307C8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return TeamIdentifierMatchesCurrentProcess.init(from:)(a1, a2);
}

uint64_t sub_2445307E0(void *a1)
{
  return TeamIdentifierMatchesCurrentProcess.encode(to:)(a1);
}

uint64_t ValidationCategory.Value.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t ValidationCategory.Value.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result <= 0xA) {
    unint64_t v2 = result;
  }
  else {
    unint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = result > 0xA;
  return result;
}

uint64_t sub_244530818()
{
  return sub_24453A550();
}

uint64_t sub_244530878()
{
  return sub_24453A530();
}

uint64_t sub_2445308C8()
{
  return sub_24453A8D0();
}

uint64_t sub_244530910()
{
  return sub_24453A8D0();
}

uint64_t *sub_244530954@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 0xA;
  if ((unint64_t)*result > 0xA) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t *ValidationCategory.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = MEMORY[0x263F8E5C0];
  *(unsigned char *)a2 = 19;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = &off_26F92CAF8;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t static ValidationCategory.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24452BD6C(a1, 19, &qword_268E7A458, &qword_268E7A460, a2);
}

{
  return sub_24452BD6C(a1, 19, &qword_268E7A458, &qword_268E7A460, a2);
}

uint64_t sub_2445309D8()
{
  return sub_24453A8D0();
}

uint64_t sub_244530A50()
{
  sub_24453A500();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244530AB4()
{
  return sub_24453A8D0();
}

uint64_t sub_244530B28@<X0>(char *a1@<X8>)
{
  return sub_244530B34(a1);
}

uint64_t sub_244530B34@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24453A670();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_244530B90@<X0>(char *a1@<X8>)
{
  return sub_244530B9C(a1);
}

uint64_t sub_244530B9C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24453A670();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_244530BFC(uint64_t a1)
{
  unint64_t v2 = sub_244532634();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244530C38(uint64_t a1)
{
  unint64_t v2 = sub_244532634();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ValidationCategory.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A468);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532634();
  sub_24453A8F0();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_244514BD8();
  sub_24453A730();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A328);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_24453A740();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_24451A0A8((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A458);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_244532688(&qword_268E7A478, &qword_268E7A458);
    sub_24453A730();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ValidationCategory.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A480);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244532634();
  sub_24453A8E0();
  if (!v2)
  {
    char v20 = 0;
    sub_244516B6C();
    sub_24453A6C0();
    LOBYTE(v19[0]) = v16;
    if (sub_2445388B0(v16) == 0xD000000000000013 && v10 == 0x8000000244540290)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24453A830();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_244516BC0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    uint64_t v12 = sub_24453A6D0();
    uint64_t v17 = MEMORY[0x263F8E5C0];
    uint64_t v18 = &off_26F92CAF8;
    *(void *)&long long v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244516C78(&v16, (uint64_t)v19 + 8);
    long long v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_244531264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24451A0A8(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  uint64_t v5 = MEMORY[0x263F8E5C0];
  if (swift_dynamicCast())
  {
    uint64_t v6 = v38[0];
    if (v38[0] < 0xBuLL)
    {
      *(unsigned char *)a2 = 19;
      *(void *)(a2 + 32) = v5;
      *(void *)(a2 + 40) = &off_26F92CAF8;
      *(void *)(a2 + 8) = v6;
LABEL_19:
      uint64_t v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
LABEL_18:
    sub_244516BC0();
    swift_allocError();
    *uint64_t v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  sub_24451A0A8(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (*(void *)(v38[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_244521784(v38[0], (uint64_t)&v34);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = v35;
  if (v35)
  {
    unint64_t v9 = v34;
    sub_244516C78(&v36, (uint64_t)v38);
    sub_24451A0A8((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA78);
    if (swift_dynamicCast())
    {
      uint64_t v30 = a2;
      uint64_t v10 = v31[0];
      uint64_t v11 = *(void *)(v31[0] + 16);
      if (v11)
      {
        uint64_t v39 = v8;
        swift_bridgeObjectRetain();
        uint64_t v12 = 0;
        char v13 = (char *)MEMORY[0x263F8EE78];
        do
        {
          unint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
          if (v14 <= 0xA)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              char v13 = sub_244531988(0, *((void *)v13 + 2) + 1, 1, v13, &qword_268E7AAC8);
            }
            unint64_t v16 = *((void *)v13 + 2);
            unint64_t v15 = *((void *)v13 + 3);
            if (v16 >= v15 >> 1) {
              char v13 = sub_244531988((char *)(v15 > 1), v16 + 1, 1, v13, &qword_268E7AAC8);
            }
            *((void *)v13 + 2) = v16 + 1;
            *(void *)&v13[8 * v16 + 32] = v14;
          }
          ++v12;
        }
        while (v11 != v12);
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v10 + 16);
        uint64_t v8 = v39;
      }
      else
      {
        uint64_t v19 = 0;
        char v13 = (char *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      if (v19 == *((void *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AAB0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24453AD40;
        *(void *)(inited + 32) = v9;
        *(void *)(inited + 40) = v8;
        *(void *)(inited + 48) = v13;
        unint64_t v21 = sub_24450B398(inited);
        *((void *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AAB8);
        uint64_t v37 = &off_26F92F340;
        unint64_t v34 = v21;
        sub_24452499C((uint64_t)&v34, &qword_268E7AAC0, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          uint64_t v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        char v22 = v31[0];
        uint64_t v23 = v31[1];
        char v24 = v32;
        uint64_t v25 = v33;
        if (sub_2445388B0(v31[0]) == 7235876 && v26 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(unsigned char *)uint64_t v30 = 19;
          *(void *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7A458);
          *(void *)(v30 + 40) = sub_244532688(&qword_268E7A460, &qword_268E7A458);
          uint64_t v29 = swift_allocObject();
          *(void *)(v30 + 8) = v29;
          *(unsigned char *)(v29 + 16) = v22;
          *(void *)(v29 + 24) = v23;
          *(unsigned char *)(v29 + 32) = v24;
          *(void *)(v29 + 40) = v25;
          goto LABEL_30;
        }
        char v28 = sub_24453A830();
        swift_bridgeObjectRelease();
        if (v28) {
          goto LABEL_32;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_244516BC0();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_2445316A8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return ValidationCategory.init(from:)(a1, a2);
}

uint64_t sub_2445316C0(void *a1)
{
  return ValidationCategory.encode(to:)(a1);
}

uint64_t sub_2445316D8@<X0>(unint64_t *a1@<X8>)
{
  return sub_244526560(&qword_268E7A458, a1);
}

uint64_t sub_2445316F8(uint64_t a1)
{
  sub_24451A0A8(a1, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  if (swift_dynamicCast())
  {
    char v2 = v6;
  }
  else
  {
    sub_24451A0A8(a1, (uint64_t)v5);
    if ((swift_dynamicCast() & 1) == 0 || (char v2 = v6, v6 >= 2))
    {
      sub_244516BC0();
      swift_allocError();
      *uint64_t v3 = 1;
      swift_willThrow();
    }
  }
  return v2 & 1;
}

void *sub_2445317E0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_244531E6C(a1, a2, a3, a4, &qword_268E79F28, &qword_268E79F30);
}

char *sub_2445317F4(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_24453186C(a1, a2, a3, a4, &qword_268E7A9D0);
}

char *sub_244531808(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_24453186C(a1, a2, a3, a4, &qword_268E7A9C8);
}

char *sub_24453181C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_24453186C(a1, a2, a3, a4, &qword_268E7A9F0);
}

char *sub_244531830(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_24453186C(a1, a2, a3, a4, &qword_268E7A9E8);
}

char *sub_244531844(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_24453186C(a1, a2, a3, a4, &qword_268E7A9E0);
}

char *sub_244531858(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_24453186C(a1, a2, a3, a4, &qword_268E7A9D8);
}

char *sub_24453186C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_244531974(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_244531FE8(a1, a2, a3, a4, &qword_268E7A170, &qword_268E79F60);
}

char *sub_244531988(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_244531A80(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_244531FE8(a1, a2, a3, a4, &qword_268E7A178, &qword_268E79F70);
}

void *sub_244531A94(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_244531FE8(a1, a2, a3, a4, &qword_268E7A180, &qword_268E79F78);
}

unint64_t sub_244531AA8()
{
  unint64_t result = qword_268E7A190;
  if (!qword_268E7A190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A190);
  }
  return result;
}

unint64_t sub_244531AFC()
{
  unint64_t result = qword_268E7A1A8;
  if (!qword_268E7A1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A1A8);
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

uint64_t sub_244531B98()
{
  unint64_t v1 = *(void *)(v0 + 32);
  if (v1 >> 60 != 15) {
    sub_24451C7D8(*(void *)(v0 + 24), v1);
  }
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_244531BE8()
{
  unint64_t result = qword_268E7A1C8;
  if (!qword_268E7A1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A1C8);
  }
  return result;
}

uint64_t sub_244531C3C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24451C7D8(a1, a2);
  }
  return a1;
}

unint64_t sub_244531C50()
{
  unint64_t result = qword_268E7A1E0;
  if (!qword_268E7A1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A1E0);
  }
  return result;
}

unint64_t sub_244531CA4()
{
  unint64_t result = qword_268E7A1F0;
  if (!qword_268E7A1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A1F0);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x2456919D0);
  }
  return result;
}

unint64_t sub_244531D4C()
{
  unint64_t result = qword_268E7A208;
  if (!qword_268E7A208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A208);
  }
  return result;
}

unint64_t sub_244531DA0()
{
  unint64_t result = qword_268E7A238;
  if (!qword_268E7A238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A238);
  }
  return result;
}

unint64_t sub_244531DF4()
{
  unint64_t result = qword_268E7A250;
  if (!qword_268E7A250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A250);
  }
  return result;
}

uint64_t type metadata accessor for EntitlementsQuery()
{
  return self;
}

void *sub_244531E6C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    void v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_244531F94()
{
  unint64_t result = qword_268E7A278;
  if (!qword_268E7A278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A278);
  }
  return result;
}

void *sub_244531FE8(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    void v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_244532124()
{
  unint64_t result = qword_268E7A298;
  if (!qword_268E7A298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A298);
  }
  return result;
}

unint64_t sub_244532178()
{
  unint64_t result = qword_268E7A2B0;
  if (!qword_268E7A2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A2B0);
  }
  return result;
}

unint64_t sub_2445321CC()
{
  unint64_t result = qword_268E7A2C8;
  if (!qword_268E7A2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A2C8);
  }
  return result;
}

unint64_t sub_244532220()
{
  unint64_t result = qword_268E7A2E0;
  if (!qword_268E7A2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A2E0);
  }
  return result;
}

unint64_t sub_244532274()
{
  unint64_t result = qword_268E7A2F8;
  if (!qword_268E7A2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A2F8);
  }
  return result;
}

unint64_t sub_2445322C8()
{
  unint64_t result = qword_268E7A320;
  if (!qword_268E7A320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A320);
  }
  return result;
}

unint64_t sub_24453231C()
{
  unint64_t result = qword_268E7A350;
  if (!qword_268E7A350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A350);
  }
  return result;
}

unint64_t sub_244532370()
{
  unint64_t result = qword_268E7A368;
  if (!qword_268E7A368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A368);
  }
  return result;
}

uint64_t sub_2445323C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_244532404()
{
  unint64_t result = qword_268E7A390;
  if (!qword_268E7A390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A390);
  }
  return result;
}

uint64_t sub_244532458()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_244532490()
{
  unint64_t result = qword_268E7A3D0;
  if (!qword_268E7A3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A3D0);
  }
  return result;
}

unint64_t sub_2445324E4()
{
  unint64_t result = qword_268E7A400;
  if (!qword_268E7A400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A400);
  }
  return result;
}

unint64_t sub_244532538()
{
  unint64_t result = qword_268E7A418;
  if (!qword_268E7A418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A418);
  }
  return result;
}

unint64_t sub_24453258C()
{
  unint64_t result = qword_268E7A430;
  if (!qword_268E7A430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A430);
  }
  return result;
}

unint64_t sub_2445325E0()
{
  unint64_t result = qword_268E7A448;
  if (!qword_268E7A448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A448);
  }
  return result;
}

unint64_t sub_244532634()
{
  unint64_t result = qword_268E7A470;
  if (!qword_268E7A470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A470);
  }
  return result;
}

uint64_t sub_244532688(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2445326CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244531CA4, (uint64_t (*)(void))sub_244531C50);
}

unint64_t sub_2445326F8(uint64_t a1)
{
  unint64_t result = sub_244532720();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244532720()
{
  unint64_t result = qword_268E7A490;
  if (!qword_268E7A490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A490);
  }
  return result;
}

uint64_t sub_244532774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516C90, (uint64_t (*)(void))sub_2445327DC);
}

uint64_t sub_2445327A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2445327DC()
{
  unint64_t result = qword_268E7A498;
  if (!qword_268E7A498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A498);
  }
  return result;
}

uint64_t sub_244532830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_24453285C, (uint64_t (*)(void))sub_2445328B0);
}

unint64_t sub_24453285C()
{
  unint64_t result = qword_268E7A4A0;
  if (!qword_268E7A4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4A0);
  }
  return result;
}

unint64_t sub_2445328B0()
{
  unint64_t result = qword_268E7A4A8;
  if (!qword_268E7A4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4A8);
  }
  return result;
}

uint64_t sub_244532904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516CE4, (uint64_t (*)(void))sub_244532930);
}

unint64_t sub_244532930()
{
  unint64_t result = qword_268E7A4B0;
  if (!qword_268E7A4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4B0);
  }
  return result;
}

_UNKNOWN **sub_244532984()
{
  return &off_26F92F338;
}

uint64_t sub_244532994(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_244534440(a1, a2, a3, (uint64_t (*)(void))sub_2445329D4, (uint64_t (*)(void))sub_244532A28, (uint64_t (*)(void))sub_244532A7C);
}

unint64_t sub_2445329D4()
{
  unint64_t result = qword_268E7A4B8;
  if (!qword_268E7A4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4B8);
  }
  return result;
}

unint64_t sub_244532A28()
{
  unint64_t result = qword_268E7A4C0;
  if (!qword_268E7A4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4C0);
  }
  return result;
}

unint64_t sub_244532A7C()
{
  unint64_t result = qword_268E7A4C8;
  if (!qword_268E7A4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4C8);
  }
  return result;
}

unint64_t sub_244532AD4()
{
  unint64_t result = qword_268E7A4D0;
  if (!qword_268E7A4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4D0);
  }
  return result;
}

unint64_t sub_244532B2C()
{
  unint64_t result = qword_268E7A4D8;
  if (!qword_268E7A4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4D8);
  }
  return result;
}

unint64_t sub_244532B84()
{
  unint64_t result = qword_268E7A4E0;
  if (!qword_268E7A4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4E0);
  }
  return result;
}

unint64_t sub_244532BDC()
{
  unint64_t result = qword_268E7A4E8;
  if (!qword_268E7A4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4E8);
  }
  return result;
}

uint64_t sub_244532C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244532C5C, (uint64_t (*)(void))sub_244532CB0);
}

unint64_t sub_244532C5C()
{
  unint64_t result = qword_268E7A4F0;
  if (!qword_268E7A4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4F0);
  }
  return result;
}

unint64_t sub_244532CB0()
{
  unint64_t result = qword_268E7A4F8;
  if (!qword_268E7A4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A4F8);
  }
  return result;
}

uint64_t sub_244532D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516D38, (uint64_t (*)(void))sub_244532D30);
}

unint64_t sub_244532D30()
{
  unint64_t result = qword_268E7A500;
  if (!qword_268E7A500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A500);
  }
  return result;
}

unint64_t sub_244532D88()
{
  unint64_t result = qword_268E7A508;
  if (!qword_268E7A508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A508);
  }
  return result;
}

uint64_t sub_244532DE0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_244534440(a1, a2, a3, (uint64_t (*)(void))sub_244532E20, (uint64_t (*)(void))sub_244532E74, (uint64_t (*)(void))sub_244532EC8);
}

unint64_t sub_244532E20()
{
  unint64_t result = qword_268E7A510;
  if (!qword_268E7A510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A510);
  }
  return result;
}

unint64_t sub_244532E74()
{
  unint64_t result = qword_268E7A518;
  if (!qword_268E7A518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A518);
  }
  return result;
}

unint64_t sub_244532EC8()
{
  unint64_t result = qword_268E7A520;
  if (!qword_268E7A520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A520);
  }
  return result;
}

unint64_t sub_244532F20()
{
  unint64_t result = qword_268E7A528;
  if (!qword_268E7A528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A528);
  }
  return result;
}

unint64_t sub_244532F78()
{
  unint64_t result = qword_268E7A530;
  if (!qword_268E7A530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A530);
  }
  return result;
}

unint64_t sub_244532FD0()
{
  unint64_t result = qword_268E7A538;
  if (!qword_268E7A538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A538);
  }
  return result;
}

unint64_t sub_244533028()
{
  unint64_t result = qword_268E7A540;
  if (!qword_268E7A540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A540);
  }
  return result;
}

uint64_t sub_24453307C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445330A8, (uint64_t (*)(void))sub_2445330FC);
}

unint64_t sub_2445330A8()
{
  unint64_t result = qword_268E7A548;
  if (!qword_268E7A548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A548);
  }
  return result;
}

unint64_t sub_2445330FC()
{
  unint64_t result = qword_268E7A550;
  if (!qword_268E7A550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A550);
  }
  return result;
}

uint64_t sub_244533150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244519390, (uint64_t (*)(void))sub_24453317C);
}

unint64_t sub_24453317C()
{
  unint64_t result = qword_268E7A558;
  if (!qword_268E7A558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A558);
  }
  return result;
}

unint64_t sub_2445331D4()
{
  unint64_t result = qword_268E7A560;
  if (!qword_268E7A560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A560);
  }
  return result;
}

unint64_t sub_24453322C(uint64_t a1)
{
  unint64_t result = sub_244533254();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244533254()
{
  unint64_t result = qword_268E7A568;
  if (!qword_268E7A568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A568);
  }
  return result;
}

uint64_t sub_2445332A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516D8C, (uint64_t (*)(void))sub_2445332D4);
}

unint64_t sub_2445332D4()
{
  unint64_t result = qword_268E7A570;
  if (!qword_268E7A570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A570);
  }
  return result;
}

unint64_t sub_24453332C()
{
  unint64_t result = qword_268E7A578;
  if (!qword_268E7A578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A578);
  }
  return result;
}

uint64_t sub_244533384(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_24453831C(&qword_268E79BC0);
  uint64_t result = sub_24453831C(&qword_268E7A580);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2445333EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244533418, (uint64_t (*)(void))sub_24453346C);
}

unint64_t sub_244533418()
{
  unint64_t result = qword_268E7A588;
  if (!qword_268E7A588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A588);
  }
  return result;
}

unint64_t sub_24453346C()
{
  unint64_t result = qword_268E7A590;
  if (!qword_268E7A590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A590);
  }
  return result;
}

uint64_t sub_2445334C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516DE0, (uint64_t (*)(void))sub_2445334EC);
}

unint64_t sub_2445334EC()
{
  unint64_t result = qword_268E7A598;
  if (!qword_268E7A598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A598);
  }
  return result;
}

unint64_t sub_244533544(uint64_t a1)
{
  unint64_t result = sub_24453356C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24453356C()
{
  unint64_t result = qword_268E7A5A0;
  if (!qword_268E7A5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5A0);
  }
  return result;
}

uint64_t sub_2445335C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516E34, (uint64_t (*)(void))sub_2445335EC);
}

unint64_t sub_2445335EC()
{
  unint64_t result = qword_268E7A5A8;
  if (!qword_268E7A5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5A8);
  }
  return result;
}

unint64_t sub_244533640(uint64_t a1)
{
  unint64_t result = sub_244533668();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244533668()
{
  unint64_t result = qword_268E7A5B0;
  if (!qword_268E7A5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5B0);
  }
  return result;
}

uint64_t sub_2445336BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516E88, (uint64_t (*)(void))sub_2445336E8);
}

unint64_t sub_2445336E8()
{
  unint64_t result = qword_268E7A5B8;
  if (!qword_268E7A5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5B8);
  }
  return result;
}

unint64_t sub_24453373C(uint64_t a1)
{
  unint64_t result = sub_244533764();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244533764()
{
  unint64_t result = qword_268E7A5C0;
  if (!qword_268E7A5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5C0);
  }
  return result;
}

uint64_t sub_2445337B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445193E4, (uint64_t (*)(void))sub_2445337E4);
}

unint64_t sub_2445337E4()
{
  unint64_t result = qword_268E7A5C8;
  if (!qword_268E7A5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5C8);
  }
  return result;
}

unint64_t sub_244533838(uint64_t a1)
{
  unint64_t result = sub_244533860();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244533860()
{
  unint64_t result = qword_268E7A5D0;
  if (!qword_268E7A5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5D0);
  }
  return result;
}

uint64_t sub_2445338B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516EDC, (uint64_t (*)(void))sub_2445338E0);
}

unint64_t sub_2445338E0()
{
  unint64_t result = qword_268E7A5D8;
  if (!qword_268E7A5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5D8);
  }
  return result;
}

uint64_t sub_244533934(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_244534A2C(a1, a2, a3, (uint64_t (*)(void))sub_244533988, (uint64_t (*)(void))sub_2445339DC, (uint64_t (*)(void))sub_244533A30, (uint64_t (*)(void))sub_244533A84);
}

unint64_t sub_244533988()
{
  unint64_t result = qword_268E7A5E0;
  if (!qword_268E7A5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5E0);
  }
  return result;
}

unint64_t sub_2445339DC()
{
  unint64_t result = qword_268E7A5E8;
  if (!qword_268E7A5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5E8);
  }
  return result;
}

unint64_t sub_244533A30()
{
  unint64_t result = qword_268E7A5F0;
  if (!qword_268E7A5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5F0);
  }
  return result;
}

unint64_t sub_244533A84()
{
  unint64_t result = qword_268E7A5F8;
  if (!qword_268E7A5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A5F8);
  }
  return result;
}

unint64_t sub_244533ADC()
{
  unint64_t result = qword_268E7A600;
  if (!qword_268E7A600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A600);
  }
  return result;
}

unint64_t sub_244533B34()
{
  unint64_t result = qword_268E7A608;
  if (!qword_268E7A608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A608);
  }
  return result;
}

uint64_t sub_244533B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244533BB4, (uint64_t (*)(void))sub_244533C08);
}

unint64_t sub_244533BB4()
{
  unint64_t result = qword_268E7A610;
  if (!qword_268E7A610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A610);
  }
  return result;
}

unint64_t sub_244533C08()
{
  unint64_t result = qword_268E7A618;
  if (!qword_268E7A618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A618);
  }
  return result;
}

uint64_t sub_244533C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445187F4, (uint64_t (*)(void))sub_244533C88);
}

unint64_t sub_244533C88()
{
  unint64_t result = qword_268E7A620;
  if (!qword_268E7A620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A620);
  }
  return result;
}

_UNKNOWN **sub_244533CDC()
{
  return &off_26F92D110;
}

unint64_t sub_244533CEC(uint64_t a1)
{
  unint64_t result = sub_244533D14();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244533D14()
{
  unint64_t result = qword_268E7A628;
  if (!qword_268E7A628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A628);
  }
  return result;
}

uint64_t sub_244533D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516F30, (uint64_t (*)(void))sub_244533D94);
}

unint64_t sub_244533D94()
{
  unint64_t result = qword_268E7A630;
  if (!qword_268E7A630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A630);
  }
  return result;
}

unint64_t sub_244533DE8(uint64_t a1)
{
  unint64_t result = sub_244533E10();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244533E10()
{
  unint64_t result = qword_268E7A638;
  if (!qword_268E7A638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A638);
  }
  return result;
}

uint64_t sub_244533E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516F84, (uint64_t (*)(void))sub_244533E90);
}

unint64_t sub_244533E90()
{
  unint64_t result = qword_268E7A640;
  if (!qword_268E7A640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A640);
  }
  return result;
}

uint64_t sub_244533EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244533F10, (uint64_t (*)(void))sub_244533F64);
}

unint64_t sub_244533F10()
{
  unint64_t result = qword_268E7A648;
  if (!qword_268E7A648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A648);
  }
  return result;
}

unint64_t sub_244533F64()
{
  unint64_t result = qword_268E7A650;
  if (!qword_268E7A650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A650);
  }
  return result;
}

uint64_t sub_244533FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244516FD8, (uint64_t (*)(void))sub_244533FE4);
}

unint64_t sub_244533FE4()
{
  unint64_t result = qword_268E7A658;
  if (!qword_268E7A658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A658);
  }
  return result;
}

_UNKNOWN **sub_244534038()
{
  return &off_26F92F2A8;
}

uint64_t sub_244534048(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_244534A2C(a1, a2, a3, (uint64_t (*)(void))sub_24453409C, (uint64_t (*)(void))sub_2445340F0, (uint64_t (*)(void))sub_244534144, (uint64_t (*)(void))sub_244534198);
}

unint64_t sub_24453409C()
{
  unint64_t result = qword_268E7A660;
  if (!qword_268E7A660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A660);
  }
  return result;
}

unint64_t sub_2445340F0()
{
  unint64_t result = qword_268E7A668;
  if (!qword_268E7A668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A668);
  }
  return result;
}

unint64_t sub_244534144()
{
  unint64_t result = qword_268E7A670;
  if (!qword_268E7A670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A670);
  }
  return result;
}

unint64_t sub_244534198()
{
  unint64_t result = qword_268E7A678;
  if (!qword_268E7A678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A678);
  }
  return result;
}

unint64_t sub_2445341F0()
{
  unint64_t result = qword_268E7A680;
  if (!qword_268E7A680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A680);
  }
  return result;
}

unint64_t sub_244534248()
{
  unint64_t result = qword_268E7A688;
  if (!qword_268E7A688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A688);
  }
  return result;
}

uint64_t sub_24453429C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445342C8, (uint64_t (*)(void))sub_24453431C);
}

unint64_t sub_2445342C8()
{
  unint64_t result = qword_268E7A690;
  if (!qword_268E7A690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A690);
  }
  return result;
}

unint64_t sub_24453431C()
{
  unint64_t result = qword_268E7A698;
  if (!qword_268E7A698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A698);
  }
  return result;
}

uint64_t sub_244534370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_24451702C, (uint64_t (*)(void))sub_24453439C);
}

unint64_t sub_24453439C()
{
  unint64_t result = qword_268E7A6A0;
  if (!qword_268E7A6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6A0);
  }
  return result;
}

_UNKNOWN **sub_2445343F0()
{
  return &off_26F92D358;
}

uint64_t sub_244534400(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_244534440(a1, a2, a3, (uint64_t (*)(void))sub_244534494, (uint64_t (*)(void))sub_2445344E8, (uint64_t (*)(void))sub_24453453C);
}

uint64_t sub_244534440(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

unint64_t sub_244534494()
{
  unint64_t result = qword_268E7A6A8;
  if (!qword_268E7A6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6A8);
  }
  return result;
}

unint64_t sub_2445344E8()
{
  unint64_t result = qword_268E7A6B0;
  if (!qword_268E7A6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6B0);
  }
  return result;
}

unint64_t sub_24453453C()
{
  unint64_t result = qword_268E7A6B8;
  if (!qword_268E7A6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6B8);
  }
  return result;
}

uint64_t sub_244534590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244517080, (uint64_t (*)(void))sub_2445345BC);
}

unint64_t sub_2445345BC()
{
  unint64_t result = qword_268E7A6C0;
  if (!qword_268E7A6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6C0);
  }
  return result;
}

_UNKNOWN **sub_244534610()
{
  return &off_26F92F2D8;
}

_UNKNOWN **sub_244534620()
{
  return &off_26F92F2B0;
}

uint64_t sub_24453462C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244534658, (uint64_t (*)(void))sub_2445346AC);
}

unint64_t sub_244534658()
{
  unint64_t result = qword_268E7A6C8;
  if (!qword_268E7A6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6C8);
  }
  return result;
}

unint64_t sub_2445346AC()
{
  unint64_t result = qword_268E7A6D0;
  if (!qword_268E7A6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6D0);
  }
  return result;
}

uint64_t sub_244534700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445170D4, (uint64_t (*)(void))sub_24453472C);
}

unint64_t sub_24453472C()
{
  unint64_t result = qword_268E7A6D8;
  if (!qword_268E7A6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6D8);
  }
  return result;
}

uint64_t sub_244534784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445347B0, (uint64_t (*)(void))sub_244534804);
}

unint64_t sub_2445347B0()
{
  unint64_t result = qword_268E7A6E0;
  if (!qword_268E7A6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6E0);
  }
  return result;
}

unint64_t sub_244534804()
{
  unint64_t result = qword_268E7A6E8;
  if (!qword_268E7A6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6E8);
  }
  return result;
}

uint64_t sub_244534858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244517128, (uint64_t (*)(void))sub_244534884);
}

unint64_t sub_244534884()
{
  unint64_t result = qword_268E7A6F0;
  if (!qword_268E7A6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6F0);
  }
  return result;
}

unint64_t sub_2445348DC(uint64_t a1)
{
  unint64_t result = sub_244534904();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244534904()
{
  unint64_t result = qword_268E7A6F8;
  if (!qword_268E7A6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A6F8);
  }
  return result;
}

uint64_t sub_244534958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_24451717C, (uint64_t (*)(void))sub_244534984);
}

unint64_t sub_244534984()
{
  unint64_t result = qword_268E7A700;
  if (!qword_268E7A700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A700);
  }
  return result;
}

uint64_t sub_2445349D8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_244534A2C(a1, a2, a3, (uint64_t (*)(void))sub_244534A90, (uint64_t (*)(void))sub_244534AE4, (uint64_t (*)(void))sub_244534B38, (uint64_t (*)(void))sub_244534B8C);
}

uint64_t sub_244534A2C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  a1[2] = a4();
  a1[3] = a5();
  a1[4] = a6();
  uint64_t result = a7();
  a1[5] = result;
  return result;
}

unint64_t sub_244534A90()
{
  unint64_t result = qword_268E7A708;
  if (!qword_268E7A708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A708);
  }
  return result;
}

unint64_t sub_244534AE4()
{
  unint64_t result = qword_268E7A710;
  if (!qword_268E7A710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A710);
  }
  return result;
}

unint64_t sub_244534B38()
{
  unint64_t result = qword_268E7A718;
  if (!qword_268E7A718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A718);
  }
  return result;
}

unint64_t sub_244534B8C()
{
  unint64_t result = qword_268E7A720;
  if (!qword_268E7A720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A720);
  }
  return result;
}

unint64_t sub_244534BE4()
{
  unint64_t result = qword_268E7A728;
  if (!qword_268E7A728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A728);
  }
  return result;
}

unint64_t sub_244534C3C()
{
  unint64_t result = qword_268E7A730;
  if (!qword_268E7A730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A730);
  }
  return result;
}

uint64_t sub_244534C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_244534CBC, (uint64_t (*)(void))sub_244534D10);
}

unint64_t sub_244534CBC()
{
  unint64_t result = qword_268E7A738;
  if (!qword_268E7A738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A738);
  }
  return result;
}

unint64_t sub_244534D10()
{
  unint64_t result = qword_268E7A740;
  if (!qword_268E7A740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A740);
  }
  return result;
}

uint64_t sub_244534D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2445327A0(a1, a2, a3, (uint64_t (*)(void))sub_2445171D0, (uint64_t (*)(void))sub_244534D90);
}

unint64_t sub_244534D90()
{
  unint64_t result = qword_268E7A748[0];
  if (!qword_268E7A748[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268E7A748);
  }
  return result;
}

_UNKNOWN **sub_244534DE4()
{
  return &off_26F92D650;
}

ValueMetadata *type metadata accessor for ProcessConstraintBuilder()
{
  return &type metadata for ProcessConstraintBuilder;
}

ValueMetadata *type metadata accessor for LaunchConstraintBuilder()
{
  return &type metadata for LaunchConstraintBuilder;
}

ValueMetadata *type metadata accessor for OnDiskConstraintBuilder()
{
  return &type metadata for OnDiskConstraintBuilder;
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

ValueMetadata *type metadata accessor for AppleInternal()
{
  return &type metadata for AppleInternal;
}

uint64_t destroy for CodeDirectoryHash(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 8);
}

uint64_t assignWithCopy for CodeDirectoryHash(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  return a1;
}

uint64_t assignWithTake for CodeDirectoryHash(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for CodeDirectoryHash()
{
  return &type metadata for CodeDirectoryHash;
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

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags()
{
  return &type metadata for ProcessCodeSigningFlags;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags.ValueSet()
{
  return &type metadata for ProcessCodeSigningFlags.ValueSet;
}

uint64_t destroy for OnDiskCodeSigningFlags()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwcp_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwta_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags()
{
  return &type metadata for OnDiskCodeSigningFlags;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags.ValueSet()
{
  return &type metadata for OnDiskCodeSigningFlags.ValueSet;
}

ValueMetadata *type metadata accessor for DeveloperMode()
{
  return &type metadata for DeveloperMode;
}

uint64_t method lookup function for EntitlementsQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EntitlementsQuery);
}

uint64_t dispatch thunk of EntitlementsQuery.key(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of EntitlementsQuery.elementAtIndex(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchSingle(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchPrefixSingle(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of EntitlementsQuery.match(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchPrefix(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of EntitlementsQuery.keyPrefix(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchType(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of EntitlementsQuery.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of EntitlementsQuery.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for EntitlementsQuery.DataType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EntitlementsQuery.DataType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    void *result = a2 + 4;
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
        JUMPOUT(0x244535480);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EntitlementsQuery.DataType()
{
  return &type metadata for EntitlementsQuery.DataType;
}

ValueMetadata *type metadata accessor for InfoPlistHash()
{
  return &type metadata for InfoPlistHash;
}

ValueMetadata *type metadata accessor for InTrustCacheWithConstraintCategory()
{
  return &type metadata for InTrustCacheWithConstraintCategory;
}

ValueMetadata *type metadata accessor for IsInitProcess()
{
  return &type metadata for IsInitProcess;
}

ValueMetadata *type metadata accessor for IsMainBinary()
{
  return &type metadata for IsMainBinary;
}

ValueMetadata *type metadata accessor for IsSIPProtected()
{
  return &type metadata for IsSIPProtected;
}

ValueMetadata *type metadata accessor for LaunchType()
{
  return &type metadata for LaunchType;
}

ValueMetadata *type metadata accessor for LaunchType.Value()
{
  return &type metadata for LaunchType.Value;
}

ValueMetadata *type metadata accessor for OnAuthorizedAuthAPFSVolume()
{
  return &type metadata for OnAuthorizedAuthAPFSVolume;
}

ValueMetadata *type metadata accessor for OnSystemVolume()
{
  return &type metadata for OnSystemVolume;
}

ValueMetadata *type metadata accessor for OSEnvironment()
{
  return &type metadata for OSEnvironment;
}

ValueMetadata *type metadata accessor for PlatformType()
{
  return &type metadata for PlatformType;
}

ValueMetadata *type metadata accessor for PlatformType.Value()
{
  return &type metadata for PlatformType.Value;
}

ValueMetadata *type metadata accessor for PlatformIdentifier()
{
  return &type metadata for PlatformIdentifier;
}

ValueMetadata *type metadata accessor for SigningIdentifier()
{
  return &type metadata for SigningIdentifier;
}

ValueMetadata *type metadata accessor for TeamIdentifier()
{
  return &type metadata for TeamIdentifier;
}

ValueMetadata *type metadata accessor for TeamIdentifierMatchesCurrentProcess()
{
  return &type metadata for TeamIdentifierMatchesCurrentProcess;
}

uint64_t _s27LightweightCodeRequirements13AppleInternalVwcp_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

uint64_t _s27LightweightCodeRequirements13AppleInternalVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_244535668(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationCategory()
{
  return &type metadata for ValidationCategory;
}

ValueMetadata *type metadata accessor for ValidationCategory.Value()
{
  return &type metadata for ValidationCategory.Value;
}

ValueMetadata *type metadata accessor for ValidationCategory.CodingKeys()
{
  return &type metadata for ValidationCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for TeamIdentifierMatchesCurrentProcess.CodingKeys()
{
  return &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys;
}

ValueMetadata *type metadata accessor for TeamIdentifier.CodingKeys()
{
  return &type metadata for TeamIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for SigningIdentifier.CodingKeys()
{
  return &type metadata for SigningIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for PlatformIdentifier.CodingKeys()
{
  return &type metadata for PlatformIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for PlatformType.CodingKeys()
{
  return &type metadata for PlatformType.CodingKeys;
}

ValueMetadata *type metadata accessor for OSEnvironment.CodingKeys()
{
  return &type metadata for OSEnvironment.CodingKeys;
}

ValueMetadata *type metadata accessor for OnSystemVolume.CodingKeys()
{
  return &type metadata for OnSystemVolume.CodingKeys;
}

ValueMetadata *type metadata accessor for OnAuthorizedAuthAPFSVolume.CodingKeys()
{
  return &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys;
}

ValueMetadata *type metadata accessor for LaunchType.CodingKeys()
{
  return &type metadata for LaunchType.CodingKeys;
}

ValueMetadata *type metadata accessor for IsSIPProtected.CodingKeys()
{
  return &type metadata for IsSIPProtected.CodingKeys;
}

ValueMetadata *type metadata accessor for IsMainBinary.CodingKeys()
{
  return &type metadata for IsMainBinary.CodingKeys;
}

ValueMetadata *type metadata accessor for IsInitProcess.CodingKeys()
{
  return &type metadata for IsInitProcess.CodingKeys;
}

ValueMetadata *type metadata accessor for InTrustCacheWithConstraintCategory.CodingKeys()
{
  return &type metadata for InTrustCacheWithConstraintCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for InfoPlistHash.CodingKeys()
{
  return &type metadata for InfoPlistHash.CodingKeys;
}

ValueMetadata *type metadata accessor for EntitlementsQuery.CodingKeys()
{
  return &type metadata for EntitlementsQuery.CodingKeys;
}

ValueMetadata *type metadata accessor for DeveloperMode.CodingKeys()
{
  return &type metadata for DeveloperMode.CodingKeys;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags.CodingKeys()
{
  return &type metadata for OnDiskCodeSigningFlags.CodingKeys;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags.CodingKeys()
{
  return &type metadata for ProcessCodeSigningFlags.CodingKeys;
}

ValueMetadata *type metadata accessor for CodeDirectoryHash.CodingKeys()
{
  return &type metadata for CodeDirectoryHash.CodingKeys;
}

uint64_t sub_244535820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_244535828()
{
  uint64_t result = sub_24453A5C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2445358CC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v9 = *(void *)(v5 + 64);
  }
  else {
    size_t v9 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v10 = ((v9 + 7 + ((v7 + 1) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8) + 8;
  int v11 = v7 & 0x100000;
  if (v8 > 7 || v11 != 0 || v10 > 0x18)
  {
    uint64_t v14 = *a2;
    *long long v3 = *a2;
    long long v3 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v15 = (void *)(((unint64_t)a1 + v8 + 1) & ~v8);
    unint64_t v16 = (const void *)(((unint64_t)a2 + v8 + 1) & ~v8);
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(((unint64_t)a2 + v8 + 1) & ~v8, 1, v4))
    {
      memcpy(v15, v16, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v15, v16, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v4);
    }
    *(void *)(((unint64_t)v15 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v16 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_244535A68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2)) {
    (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  }

  return swift_bridgeObjectRelease();
}

unsigned char *sub_244535B50(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    uint64_t v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  *(void *)(((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_244535CA0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1, v4);
  int v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy(v7, v8, v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  *(void *)(((unint64_t)v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_244535E78(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    size_t v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  *(void *)(((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

unsigned char *sub_244535FC4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1, v4);
  int v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy(v7, v8, v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  *(void *)(((unint64_t)v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244536194(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v10 + 7;
  if (v8 < a2)
  {
    unint64_t v12 = ((v11 + ((v9 + 1) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v13 = a2 - v8;
    uint64_t v14 = v12 & 0xFFFFFFF8;
    if ((v12 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = v13 + 1;
    }
    if (v15 >= 0x10000) {
      LODWORD(v16) = 4;
    }
    else {
      LODWORD(v16) = 2;
    }
    if (v15 < 0x100) {
      LODWORD(v16) = 1;
    }
    if (v15 >= 2) {
      uint64_t v16 = v16;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v12);
        if (!v17) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v12);
        if (v17) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x244536340);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v12);
        if (!v17) {
          break;
        }
LABEL_27:
        int v19 = v17 - 1;
        if (v14)
        {
          int v19 = 0;
          LODWORD(v14) = *a1;
        }
        return v8 + (v14 | v19) + 1;
      default:
        break;
    }
  }
  uint64_t v20 = ((unint64_t)a1 + v9 + 1) & ~v9;
  if (v7 < 0x7FFFFFFE)
  {
    unint64_t v22 = *(void *)((v11 + v20) & 0xFFFFFFFFFFFFFFF8);
    if (v22 >= 0xFFFFFFFF) {
      LODWORD(v22) = -1;
    }
    if ((v22 + 1) >= 2) {
      return v22;
    }
    else {
      return 0;
    }
  }
  else
  {
    unsigned int v21 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v20);
    if (v21 >= 2) {
      return v21 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_244536354(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v10 < a3)
  {
    unsigned int v14 = a3 - v10;
    if (((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v15 = v14 + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    if (v15 < 0x100) {
      int v16 = 1;
    }
    if (v15 >= 2) {
      int v6 = v16;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v17 = a2 - v10;
    }
    else {
      int v17 = 1;
    }
    if (((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v18 = ~v10 + a2;
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v17;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v13] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x244536604);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        unint64_t v19 = (unint64_t)&a1[v11 + 1] & ~v11;
        if (v9 < 0x7FFFFFFE)
        {
          uint64_t v23 = (void *)((v12 + 7 + v19) & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *uint64_t v23 = 0;
            *(_DWORD *)uint64_t v23 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *uint64_t v23 = a2;
          }
        }
        else if (v9 >= a2)
        {
          uint64_t v24 = a2 + 1;
          uint64_t v25 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
          unint64_t v26 = (unint64_t)&a1[v11 + 1] & ~v11;
          v25(v26, v24);
        }
        else
        {
          if (v12 <= 3) {
            int v20 = ~(-1 << (8 * v12));
          }
          else {
            int v20 = -1;
          }
          if (v12)
          {
            int v21 = v20 & (~v9 + a2);
            if (v12 <= 3) {
              int v22 = v12;
            }
            else {
              int v22 = 4;
            }
            bzero((void *)((unint64_t)&a1[v11 + 1] & ~v11), v12);
            switch(v22)
            {
              case 2:
                *(_WORD *)unint64_t v19 = v21;
                break;
              case 3:
                *(_WORD *)unint64_t v19 = v21;
                *(unsigned char *)(v19 + 2) = BYTE2(v21);
                break;
              case 4:
                *(_DWORD *)unint64_t v19 = v21;
                break;
              default:
                *(unsigned char *)unint64_t v19 = v21;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for ContainerConstraint()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *_s27LightweightCodeRequirements18ValidationCategoryV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x244536720);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleInternal.CodingKeys()
{
  return &type metadata for AppleInternal.CodingKeys;
}

unint64_t sub_24453675C()
{
  unint64_t result = qword_268E7A7D0;
  if (!qword_268E7A7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A7D0);
  }
  return result;
}

unint64_t sub_2445367B8()
{
  unint64_t result = qword_268E7A7D8;
  if (!qword_268E7A7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A7D8);
  }
  return result;
}

unint64_t sub_244536810()
{
  unint64_t result = qword_268E7A7E0;
  if (!qword_268E7A7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A7E0);
  }
  return result;
}

unint64_t sub_244536868()
{
  unint64_t result = qword_268E7A7E8;
  if (!qword_268E7A7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A7E8);
  }
  return result;
}

unint64_t sub_2445368C0()
{
  unint64_t result = qword_268E7A7F0;
  if (!qword_268E7A7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A7F0);
  }
  return result;
}

unint64_t sub_244536918()
{
  unint64_t result = qword_268E7A7F8;
  if (!qword_268E7A7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A7F8);
  }
  return result;
}

unint64_t sub_244536970()
{
  unint64_t result = qword_268E7A800;
  if (!qword_268E7A800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A800);
  }
  return result;
}

unint64_t sub_2445369C8()
{
  unint64_t result = qword_268E7A808;
  if (!qword_268E7A808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A808);
  }
  return result;
}

unint64_t sub_244536A20()
{
  unint64_t result = qword_268E7A810;
  if (!qword_268E7A810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A810);
  }
  return result;
}

unint64_t sub_244536A78()
{
  unint64_t result = qword_268E7A818;
  if (!qword_268E7A818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A818);
  }
  return result;
}

unint64_t sub_244536AD0()
{
  unint64_t result = qword_268E7A820;
  if (!qword_268E7A820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A820);
  }
  return result;
}

unint64_t sub_244536B28()
{
  unint64_t result = qword_268E7A828;
  if (!qword_268E7A828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A828);
  }
  return result;
}

unint64_t sub_244536B80()
{
  unint64_t result = qword_268E7A830;
  if (!qword_268E7A830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A830);
  }
  return result;
}

unint64_t sub_244536BD8()
{
  unint64_t result = qword_268E7A838;
  if (!qword_268E7A838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A838);
  }
  return result;
}

unint64_t sub_244536C30()
{
  unint64_t result = qword_268E7A840;
  if (!qword_268E7A840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A840);
  }
  return result;
}

unint64_t sub_244536C88()
{
  unint64_t result = qword_268E7A848;
  if (!qword_268E7A848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A848);
  }
  return result;
}

unint64_t sub_244536CE0()
{
  unint64_t result = qword_268E7A850;
  if (!qword_268E7A850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A850);
  }
  return result;
}

unint64_t sub_244536D38()
{
  unint64_t result = qword_268E7A858;
  if (!qword_268E7A858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A858);
  }
  return result;
}

unint64_t sub_244536D90()
{
  unint64_t result = qword_268E7A860;
  if (!qword_268E7A860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A860);
  }
  return result;
}

unint64_t sub_244536DE8()
{
  unint64_t result = qword_268E7A868;
  if (!qword_268E7A868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A868);
  }
  return result;
}

unint64_t sub_244536E40()
{
  unint64_t result = qword_268E7A870;
  if (!qword_268E7A870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A870);
  }
  return result;
}

unint64_t sub_244536E98()
{
  unint64_t result = qword_268E7A878;
  if (!qword_268E7A878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A878);
  }
  return result;
}

unint64_t sub_244536EF0()
{
  unint64_t result = qword_268E7A880;
  if (!qword_268E7A880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A880);
  }
  return result;
}

unint64_t sub_244536F48()
{
  unint64_t result = qword_268E7A888;
  if (!qword_268E7A888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A888);
  }
  return result;
}

unint64_t sub_244536FA0()
{
  unint64_t result = qword_268E7A890;
  if (!qword_268E7A890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A890);
  }
  return result;
}

unint64_t sub_244536FF8()
{
  unint64_t result = qword_268E7A898;
  if (!qword_268E7A898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A898);
  }
  return result;
}

unint64_t sub_244537050()
{
  unint64_t result = qword_268E7A8A0;
  if (!qword_268E7A8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8A0);
  }
  return result;
}

unint64_t sub_2445370A8()
{
  unint64_t result = qword_268E7A8A8;
  if (!qword_268E7A8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8A8);
  }
  return result;
}

unint64_t sub_244537100()
{
  unint64_t result = qword_268E7A8B0;
  if (!qword_268E7A8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8B0);
  }
  return result;
}

unint64_t sub_244537158()
{
  unint64_t result = qword_268E7A8B8;
  if (!qword_268E7A8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8B8);
  }
  return result;
}

unint64_t sub_2445371B0()
{
  unint64_t result = qword_268E7A8C0;
  if (!qword_268E7A8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8C0);
  }
  return result;
}

unint64_t sub_244537208()
{
  unint64_t result = qword_268E7A8C8;
  if (!qword_268E7A8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8C8);
  }
  return result;
}

unint64_t sub_244537260()
{
  unint64_t result = qword_268E7A8D0;
  if (!qword_268E7A8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8D0);
  }
  return result;
}

unint64_t sub_2445372B8()
{
  unint64_t result = qword_268E7A8D8;
  if (!qword_268E7A8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8D8);
  }
  return result;
}

unint64_t sub_244537310()
{
  unint64_t result = qword_268E7A8E0;
  if (!qword_268E7A8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8E0);
  }
  return result;
}

unint64_t sub_244537368()
{
  unint64_t result = qword_268E7A8E8;
  if (!qword_268E7A8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8E8);
  }
  return result;
}

unint64_t sub_2445373C0()
{
  unint64_t result = qword_268E7A8F0;
  if (!qword_268E7A8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8F0);
  }
  return result;
}

unint64_t sub_244537418()
{
  unint64_t result = qword_268E7A8F8;
  if (!qword_268E7A8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A8F8);
  }
  return result;
}

unint64_t sub_244537470()
{
  unint64_t result = qword_268E7A900;
  if (!qword_268E7A900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A900);
  }
  return result;
}

unint64_t sub_2445374C8()
{
  unint64_t result = qword_268E7A908;
  if (!qword_268E7A908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A908);
  }
  return result;
}

unint64_t sub_244537520()
{
  unint64_t result = qword_268E7A910;
  if (!qword_268E7A910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A910);
  }
  return result;
}

unint64_t sub_244537578()
{
  unint64_t result = qword_268E7A918;
  if (!qword_268E7A918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A918);
  }
  return result;
}

unint64_t sub_2445375D0()
{
  unint64_t result = qword_268E7A920;
  if (!qword_268E7A920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A920);
  }
  return result;
}

unint64_t sub_244537628()
{
  unint64_t result = qword_268E7A928;
  if (!qword_268E7A928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A928);
  }
  return result;
}

unint64_t sub_244537680()
{
  unint64_t result = qword_268E7A930;
  if (!qword_268E7A930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A930);
  }
  return result;
}

unint64_t sub_2445376D8()
{
  unint64_t result = qword_268E7A938;
  if (!qword_268E7A938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A938);
  }
  return result;
}

unint64_t sub_244537730()
{
  unint64_t result = qword_268E7A940;
  if (!qword_268E7A940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A940);
  }
  return result;
}

unint64_t sub_244537788()
{
  unint64_t result = qword_268E7A948;
  if (!qword_268E7A948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A948);
  }
  return result;
}

unint64_t sub_2445377E0()
{
  unint64_t result = qword_268E7A950;
  if (!qword_268E7A950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A950);
  }
  return result;
}

unint64_t sub_244537838()
{
  unint64_t result = qword_268E7A958;
  if (!qword_268E7A958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A958);
  }
  return result;
}

unint64_t sub_244537890()
{
  unint64_t result = qword_268E7A960;
  if (!qword_268E7A960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A960);
  }
  return result;
}

unint64_t sub_2445378E8()
{
  unint64_t result = qword_268E7A968;
  if (!qword_268E7A968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A968);
  }
  return result;
}

unint64_t sub_244537940()
{
  unint64_t result = qword_268E7A970;
  if (!qword_268E7A970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A970);
  }
  return result;
}

unint64_t sub_244537998()
{
  unint64_t result = qword_268E7A978;
  if (!qword_268E7A978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A978);
  }
  return result;
}

unint64_t sub_2445379F0()
{
  unint64_t result = qword_268E7A980;
  if (!qword_268E7A980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A980);
  }
  return result;
}

unint64_t sub_244537A48()
{
  unint64_t result = qword_268E7A988;
  if (!qword_268E7A988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A988);
  }
  return result;
}

unint64_t sub_244537AA0()
{
  unint64_t result = qword_268E7A990;
  if (!qword_268E7A990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A990);
  }
  return result;
}

unint64_t sub_244537AF8()
{
  unint64_t result = qword_268E7A998;
  if (!qword_268E7A998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A998);
  }
  return result;
}

unint64_t sub_244537B50()
{
  unint64_t result = qword_268E7A9A0;
  if (!qword_268E7A9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A9A0);
  }
  return result;
}

unint64_t sub_244537BA8()
{
  unint64_t result = qword_268E7A9A8;
  if (!qword_268E7A9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A9A8);
  }
  return result;
}

unint64_t sub_244537C00()
{
  unint64_t result = qword_268E7A9B0;
  if (!qword_268E7A9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A9B0);
  }
  return result;
}

uint64_t sub_244537C54(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_244537CB8()
{
  unint64_t result = qword_268E7A9B8;
  if (!qword_268E7A9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A9B8);
  }
  return result;
}

unint64_t sub_244537D10()
{
  unint64_t result = qword_268E7A9C0;
  if (!qword_268E7A9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7A9C0);
  }
  return result;
}

uint64_t type metadata accessor for ContainerConstraint.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_244537D7C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  unsigned int v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_244537E04(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
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
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    sub_24451A0A8(*(void *)(a5 + 56) + 40 * a2, result);
    swift_bridgeObjectRetain();
    return v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

void *sub_244537E94(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
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
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    void *result = *(void *)(*(void *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_244537F28(uint64_t a1)
{
  sub_24451A0A8(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7AA80);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  if (*(void *)(v11 + 16) != 1)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    sub_244516BC0();
    swift_allocError();
    *unint64_t v10 = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  sub_24452184C(v11);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t result = swift_bridgeObjectRelease();
  if (v3)
  {
    char v7 = sub_244539F98();
    if (v7 != 31)
    {
      if (sub_2445388B0(v7) == 0x797265757124 && v8 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
LABEL_10:
        __swift_destroy_boxed_opaque_existential_1(a1);
        type metadata accessor for EntitlementsQuery();
        uint64_t result = swift_allocObject();
        *(_WORD *)(result + 16) = 7684;
        *(void *)(result + 24) = v5;
        return result;
      }
      char v9 = sub_24453A830();
      swift_bridgeObjectRelease();
      if (v9) {
        goto LABEL_10;
      }
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2445380C4()
{
  return 3;
}

uint64_t sub_2445380CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_24453A830() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24453A830();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2445381A8()
{
  unint64_t v0 = sub_24453A670();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_2445381F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_244538220(uint64_t a1)
{
  return a1;
}

uint64_t sub_24453824C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_244538284()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2445382BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24453831C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for EntitlementsQuery();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24453838C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

unsigned char *_s27LightweightCodeRequirements17EntitlementsQueryC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x244538460);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_244538488()
{
  return swift_getWitnessTable();
}

uint64_t sub_2445384A4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2445384C0()
{
  return swift_getWitnessTable();
}

void SecTaskValidateForRequirement(task:requirement:)()
{
  uint64_t v0 = (void *)sub_24453A460();
  char v1 = SecTaskValidateForLightweightCodeRequirementData();

  if ((v1 & 1) == 0) {
    __break(1u);
  }
}

unint64_t sub_244538858()
{
  unint64_t result = qword_268E7AB70;
  if (!qword_268E7AB70)
  {
    type metadata accessor for CFString();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7AB70);
  }
  return result;
}

unint64_t sub_2445388B0(char a1)
{
  unint64_t result = 0x6E692D656C707061;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x687361686463;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x65706F6C65766564;
      break;
    case 4:
      unint64_t result = 0x6D656C7469746E65;
      break;
    case 5:
      unint64_t result = 0x696C702D6F666E69;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 7:
      unint64_t result = 0x2D74696E692D7369;
      break;
    case 8:
      unint64_t result = 0x2D6E69616D2D7369;
      break;
    case 9:
    case 12:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x742D68636E75616CLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 13:
      unint64_t result = 0x7269766E652D736FLL;
      break;
    case 14:
      unint64_t result = 0xD000000000000013;
      break;
    case 15:
      unint64_t result = 0x6D726F6674616C70;
      break;
    case 16:
      unint64_t result = 0xD000000000000012;
      break;
    case 17:
      unint64_t result = 0x6564692D6D616574;
      break;
    case 18:
      unint64_t result = 0xD000000000000023;
      break;
    case 19:
      unint64_t result = 0xD000000000000013;
      break;
    case 20:
      unint64_t result = 1684955428;
      break;
    case 21:
      unint64_t result = 0x7272612D646E6124;
      break;
    case 22:
      unint64_t result = 7235876;
      break;
    case 23:
      unint64_t result = 0x68632D67616C6624;
      break;
    case 24:
      unint64_t result = 7628580;
      break;
    case 25:
      unint64_t result = 1702127396;
      break;
    case 26:
      unint64_t result = 7629860;
      break;
    case 27:
      unint64_t result = 1702128676;
      break;
    case 28:
      unint64_t result = 7499556;
      break;
    case 29:
      unint64_t result = 0x617272612D726F24;
      break;
    case 30:
      unint64_t result = 0x797265757124;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_244538C74(uint64_t a1)
{
  uint64_t v28 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  uint64_t v41 = &v40;
  int64_t v29 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v5 = 0;
  unsigned int v6 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v4)
    {
      unint64_t v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v9 = v8 | (v5 << 6);
LABEL_8:
      sub_244539FEC(*(void *)(a1 + 48) + 40 * v9, (uint64_t)&v33);
      sub_244521710(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v35 + 8);
      goto LABEL_18;
    }
    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_49;
    }
    if (v10 < v29)
    {
      unint64_t v11 = *(void *)(v28 + 8 * v10);
      if (v11) {
        goto LABEL_12;
      }
      v5 += 2;
      if (v10 + 1 >= v29)
      {
        int64_t v5 = v10;
      }
      else
      {
        unint64_t v11 = *(void *)(v28 + 8 * v5);
        if (v11)
        {
          ++v10;
LABEL_12:
          unint64_t v4 = (v11 - 1) & v11;
          unint64_t v9 = __clz(__rbit64(v11)) + (v10 << 6);
          int64_t v5 = v10;
          goto LABEL_8;
        }
        if (v10 + 2 < v29)
        {
          unint64_t v11 = *(void *)(v28 + 8 * (v10 + 2));
          if (v11)
          {
            v10 += 2;
            goto LABEL_12;
          }
          int64_t v25 = v10 + 3;
          if (v10 + 3 < v29)
          {
            unint64_t v11 = *(void *)(v28 + 8 * v25);
            if (!v11)
            {
              while (1)
              {
                int64_t v10 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_50;
                }
                if (v10 >= v29)
                {
                  int64_t v5 = v29 - 1;
                  goto LABEL_17;
                }
                unint64_t v11 = *(void *)(v28 + 8 * v10);
                ++v25;
                if (v11) {
                  goto LABEL_12;
                }
              }
            }
            v10 += 3;
            goto LABEL_12;
          }
          int64_t v5 = v10 + 2;
        }
      }
    }
LABEL_17:
    unint64_t v4 = 0;
    uint64_t v36 = 0;
    memset(v35, 0, sizeof(v35));
    long long v33 = 0u;
    long long v34 = 0u;
LABEL_18:
    sub_24453A048((uint64_t)&v33, (uint64_t)&v37);
    if (!*((void *)&v38 + 1)) {
      goto LABEL_46;
    }
    sub_24452176C(v41, v32);
    long long v33 = v37;
    long long v34 = v38;
    *(void *)&v35[0] = v39;
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_244516BC0();
      swift_allocError();
      *unint64_t v26 = 1;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
LABEL_46:
      swift_release();
      return (uint64_t)v6;
    }
    long long v12 = v31[0];
    sub_2445390E0((uint64_t)v32, (uint64_t *)&v33);
    if (v1)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    sub_24451A0A8((uint64_t)&v33, (uint64_t)v31);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v15 = sub_2445158CC(v12, *((uint64_t *)&v12 + 1));
    uint64_t v16 = v6[2];
    BOOL v17 = (v14 & 1) == 0;
    uint64_t v18 = v16 + v17;
    if (__OFADD__(v16, v17)) {
      break;
    }
    char v19 = v14;
    if (v6[3] >= v18)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v14) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_244515944();
        if (v19) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_2445155A4(v18, isUniquelyReferenced_nonNull_native);
      unint64_t v20 = sub_2445158CC(v12, *((uint64_t *)&v12 + 1));
      if ((v19 & 1) != (v21 & 1)) {
        goto LABEL_51;
      }
      unint64_t v15 = v20;
      if (v19)
      {
LABEL_4:
        uint64_t v7 = v6[7] + 40 * v15;
        __swift_destroy_boxed_opaque_existential_1(v7);
        sub_244516C78(v31, v7);
        goto LABEL_5;
      }
    }
    v6[(v15 >> 6) + 8] |= 1 << v15;
    *(_OWORD *)(v6[6] + 16 * v15) = v12;
    sub_244516C78(v31, v6[7] + 40 * v15);
    uint64_t v22 = v6[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_48;
    }
    v6[2] = v24;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  uint64_t result = sub_24453A850();
  __break(1u);
  return result;
}

uint64_t ConstraintCategory.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result == 255) {
    uint64_t v2 = 255;
  }
  else {
    uint64_t v2 = 0;
  }
  BOOL v3 = result != 255;
  if (result == 17)
  {
    uint64_t v2 = 17;
    BOOL v3 = 0;
  }
  if (!result)
  {
    uint64_t v2 = 0;
    BOOL v3 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_2445390E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_244521710(a1, (uint64_t)v26);
  uint64_t v5 = MEMORY[0x263F8D310];
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    sub_244521710(a1, (uint64_t)v24);
    unsigned int v6 = &off_26F92F298;
LABEL_3:
    a2[3] = v5;
    a2[4] = (uint64_t)v6;
LABEL_7:
    swift_dynamicCast();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  uint64_t v7 = MEMORY[0x263F06F78];
  if (swift_dynamicCast())
  {
    sub_24451C7D8(v23[0], v23[1]);
    sub_244521710(a1, (uint64_t)v24);
    unint64_t v8 = &off_26F92F328;
LABEL_6:
    a2[3] = v7;
    a2[4] = (uint64_t)v8;
    goto LABEL_7;
  }
  if (swift_dynamicCast())
  {
    sub_244521710(a1, (uint64_t)v24);
    swift_dynamicCast();
    a2[3] = MEMORY[0x263F8E5C0];
    a2[4] = (uint64_t)&off_26F92F2C8;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  if (swift_dynamicCast())
  {
    sub_244521710(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v10 = MEMORY[0x263F8E5C0];
    uint64_t v11 = (char)v27;
LABEL_17:
    a2[3] = v10;
    a2[4] = (uint64_t)&off_26F92F2C8;
    *a2 = v11;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  if (swift_dynamicCast())
  {
    sub_244521710(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v10 = MEMORY[0x263F8E5C0];
    uint64_t v11 = (__int16)v27;
    goto LABEL_17;
  }
  if (swift_dynamicCast())
  {
    sub_244521710(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v10 = MEMORY[0x263F8E5C0];
    uint64_t v11 = (int)v27;
    goto LABEL_17;
  }
  uint64_t v5 = MEMORY[0x263F8E5C0];
  if (swift_dynamicCast())
  {
    sub_244521710(a1, (uint64_t)v24);
    unsigned int v6 = &off_26F92F2C8;
    goto LABEL_3;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E7ABB0);
  if (!swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E7ABB8);
    if (!swift_dynamicCast())
    {
      uint64_t v7 = MEMORY[0x263F8D4F8];
      if (!swift_dynamicCast())
      {
        sub_244516BC0();
        swift_allocError();
        *unint64_t v20 = 1;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      sub_244521710(a1, (uint64_t)v24);
      unint64_t v8 = &off_26F92F2F8;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    sub_244521710(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v14 = sub_244538C74(v27);
    swift_bridgeObjectRelease();
    if (v2) {
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    }
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79ED8);
    char v19 = &off_26F92F340;
LABEL_37:
    a2[3] = v18;
    a2[4] = (uint64_t)v19;
    *a2 = v14;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  swift_bridgeObjectRelease();
  sub_244521710(a1, (uint64_t)v24);
  swift_dynamicCast();
  int64_t v12 = *(void *)(v23[0] + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_36:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E79F30);
    char v19 = &off_26F92F348;
    goto LABEL_37;
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  sub_244514D90(0, v12, 0);
  uint64_t v13 = v23[0] + 32;
  while (1)
  {
    sub_244521710(v13, (uint64_t)v23);
    sub_2445390E0(v24, v23);
    if (v2) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    uint64_t v14 = v25;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_244514D90(0, *(void *)(v14 + 16) + 1, 1);
      uint64_t v14 = v25;
    }
    unint64_t v15 = *(void *)(v14 + 16);
    unint64_t v16 = *(void *)(v14 + 24);
    unint64_t v17 = v15 + 1;
    if (v15 >= v16 >> 1)
    {
      unint64_t v21 = *(void *)(v14 + 16);
      unint64_t v22 = v15 + 1;
      sub_244514D90((void *)(v16 > 1), v15 + 1, 1);
      unint64_t v15 = v21;
      unint64_t v17 = v22;
      uint64_t v14 = v25;
    }
    *(void *)(v14 + 16) = v17;
    sub_244516C78(v24, v14 + 40 * v15 + 32);
    v13 += 32;
    if (!--v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t ConstraintCategory.rawValue.getter()
{
  return *(void *)v0;
}

void static ConstraintCategory.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static ConstraintCategory.sysdiagnoseNewTool.getter(void *a1@<X8>)
{
  *a1 = 17;
}

void static ConstraintCategory.logOnly.getter(void *a1@<X8>)
{
  *a1 = 255;
}

uint64_t sub_244539684()
{
  return sub_24453A550();
}

uint64_t sub_2445396E4()
{
  return sub_24453A530();
}

uint64_t *sub_244539734@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  if (!*result || (v2 != 255 ? (BOOL v3 = v2 == 17) : (BOOL v3 = 1), v3))
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    char v4 = 1;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

BOOL static ConstraintError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ConstraintError.hash(into:)()
{
  return sub_24453A8B0();
}

uint64_t ConstraintError.hashValue.getter()
{
  return sub_24453A8D0();
}

unint64_t sub_2445397EC(void *a1)
{
  a1[2] = sub_244520580();
  a1[3] = sub_24452052C();
  a1[4] = sub_24453982C();
  unint64_t result = sub_244539880();
  a1[5] = result;
  return result;
}

unint64_t sub_24453982C()
{
  unint64_t result = qword_268E7AB78;
  if (!qword_268E7AB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7AB78);
  }
  return result;
}

unint64_t sub_244539880()
{
  unint64_t result = qword_268E7AB80;
  if (!qword_268E7AB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7AB80);
  }
  return result;
}

unint64_t sub_2445398D8()
{
  unint64_t result = qword_268E7AB88;
  if (!qword_268E7AB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7AB88);
  }
  return result;
}

unint64_t sub_244539930()
{
  unint64_t result = qword_268E7AB90;
  if (!qword_268E7AB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7AB90);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintCategory()
{
  return &type metadata for ConstraintCategory;
}

unsigned char *storeEnumTagSinglePayload for ConstraintError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    void *result = a2 + 4;
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
        JUMPOUT(0x244539A70);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintError()
{
  return &type metadata for ConstraintError;
}

uint64_t getEnumTagSinglePayload for ConstraintKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE2) {
    goto LABEL_17;
  }
  if (a2 + 30 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 30) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 30;
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
      return (*a1 | (v4 << 8)) - 30;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 30;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v8 = v6 - 31;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ConstraintKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    void *result = a2 + 30;
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
        JUMPOUT(0x244539C04);
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
          void *result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintKeys()
{
  return &type metadata for ConstraintKeys;
}

uint64_t sub_244539C3C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_2445388B0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_2445388B0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24453A830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_244539CC8()
{
  char v1 = *v0;
  sub_24453A8A0();
  sub_2445388B0(v1);
  sub_24453A500();
  swift_bridgeObjectRelease();
  return sub_24453A8D0();
}

uint64_t sub_244539D2C()
{
  sub_2445388B0(*v0);
  sub_24453A500();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244539D80()
{
  char v1 = *v0;
  sub_24453A8A0();
  sub_2445388B0(v1);
  sub_24453A500();
  swift_bridgeObjectRelease();
  return sub_24453A8D0();
}

uint64_t sub_244539DE0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_244539F98();
  *a1 = result;
  return result;
}

unint64_t sub_244539E10@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2445388B0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_244539E40()
{
  unint64_t result = qword_268E7AB98;
  if (!qword_268E7AB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7AB98);
  }
  return result;
}

uint64_t sub_244539E94()
{
  return sub_24453A540();
}

uint64_t sub_244539EF4()
{
  return sub_24453A520();
}

unint64_t sub_244539F44()
{
  unint64_t result = qword_268E7ABA0;
  if (!qword_268E7ABA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E7ABA0);
  }
  return result;
}

uint64_t sub_244539F98()
{
  unint64_t v0 = sub_24453A840();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1F) {
    return 31;
  }
  else {
    return v0;
  }
}

uint64_t sub_244539FEC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24453A048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E7ABA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ValidationResult.signatureIsValid.getter()
{
  return *v0;
}

uint64_t ValidationResult.requirementMatched.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ValidationResult.failureReason.getter()
{
  return *(unsigned int *)(v0 + 4);
}

void sub_24453A0C8()
{
  uint64_t v0 = (void *)sub_24453A460();
  int v1 = SecRequirementCreateWithLightweightCodeRequirementData();

  if (!v1) {
    __break(1u);
  }
}

void SecStaticCodeCheckValidityWithOnDiskRequirement(code:flags:requirement:)(const __SecCode *a1@<X0>, SecCSFlags a2@<W1>, uint64_t a3@<X8>)
{
  sub_24453A0C8();
  if (v7)
  {
    char v8 = v7;
    OSStatus v9 = SecStaticCodeCheckValidity(a1, a2, v7);

    BOOL v10 = v9 == -67050;
    if (v9 == -66996) {
      BOOL v10 = 0;
    }
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if (v9) {
      BOOL v12 = v9 == -66996;
    }
    else {
      BOOL v12 = 1;
    }
  }
  else
  {
    OSStatus v9 = v6;
    char v11 = 0;
    BOOL v12 = 0;
  }
  *(unsigned char *)a3 = v11;
  *(unsigned char *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void SecCodeCheckValidityWithOnDiskRequirement(code:flags:requirement:)(__SecCode *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24453A0C8();
  if (v7)
  {
    char v8 = v7;
    OSStatus v9 = SecCodeCheckValidity(a1, a2 & 0xFF7FFFFF, v7);

    BOOL v10 = v9 == -67050;
    if (v9 == -66996) {
      BOOL v10 = 0;
    }
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if (v9) {
      BOOL v12 = v9 == -66996;
    }
    else {
      BOOL v12 = 1;
    }
  }
  else
  {
    OSStatus v9 = v6;
    char v11 = 0;
    BOOL v12 = 0;
  }
  *(unsigned char *)a3 = v11;
  *(unsigned char *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void SecCodeCheckValidityWithProcessRequirement(code:flags:requirement:)(__SecCode *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24453A0C8();
  if (v7)
  {
    char v8 = v7;
    OSStatus v9 = SecCodeCheckValidity(a1, a2 | 0x800000, v7);

    BOOL v10 = v9 == -67050;
    if (v9 == -66996) {
      BOOL v10 = 0;
    }
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if (v9) {
      BOOL v12 = v9 == -66996;
    }
    else {
      BOOL v12 = 1;
    }
  }
  else
  {
    OSStatus v9 = v6;
    char v11 = 0;
    BOOL v12 = 0;
  }
  *(unsigned char *)a3 = v11;
  *(unsigned char *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValidationResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[8]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationResult()
{
  return &type metadata for ValidationResult;
}

uint64_t sub_24453A420()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24453A430()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24453A440()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24453A450()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24453A460()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24453A470()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24453A480()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_24453A490()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_24453A4A0()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_24453A4B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24453A4C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24453A4D0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24453A4E0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24453A4F0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24453A500()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24453A510()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24453A520()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24453A530()
{
  return MEMORY[0x270F9DAC0]();
}

uint64_t sub_24453A540()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24453A550()
{
  return MEMORY[0x270F9DB40]();
}

uint64_t sub_24453A560()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24453A570()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24453A580()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24453A590()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24453A5A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24453A5B0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24453A5C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24453A5E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24453A5F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24453A600()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24453A610()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24453A620()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24453A630()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24453A640()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24453A650()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24453A660()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24453A670()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24453A680()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_24453A690()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24453A6A0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24453A6B0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24453A6C0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24453A6D0()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_24453A6E0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24453A6F0()
{
  return MEMORY[0x270F9F388]();
}

uint64_t sub_24453A700()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24453A710()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24453A720()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24453A730()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24453A740()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_24453A750()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24453A760()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24453A770()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24453A780()
{
  return MEMORY[0x270F9F510]();
}

uint64_t sub_24453A790()
{
  return MEMORY[0x270F9F558]();
}

uint64_t sub_24453A7A0()
{
  return MEMORY[0x270F9F560]();
}

uint64_t sub_24453A7B0()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_24453A7C0()
{
  return MEMORY[0x270F9F580]();
}

uint64_t sub_24453A7D0()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_24453A7E0()
{
  return MEMORY[0x270F9F608]();
}

uint64_t sub_24453A7F0()
{
  return MEMORY[0x270F9F630]();
}

uint64_t sub_24453A800()
{
  return MEMORY[0x270F9F638]();
}

uint64_t sub_24453A810()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_24453A820()
{
  return MEMORY[0x270F9F660]();
}

uint64_t sub_24453A830()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24453A840()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_24453A850()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24453A860()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24453A870()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24453A880()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24453A890()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24453A8A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24453A8B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24453A8C0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24453A8D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24453A8E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24453A8F0()
{
  return MEMORY[0x270F9FD98]();
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

OSStatus SecCodeCheckValidity(SecCodeRef code, SecCSFlags flags, SecRequirementRef requirement)
{
  return MEMORY[0x270EFD8C8](code, *(void *)&flags, requirement);
}

uint64_t SecRequirementCreateWithLightweightCodeRequirementData()
{
  return MEMORY[0x270EFDC30]();
}

OSStatus SecStaticCodeCheckValidity(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement)
{
  return MEMORY[0x270EFDC78](staticCode, *(void *)&flags, requirement);
}

uint64_t SecTaskValidateForLightweightCodeRequirementData()
{
  return MEMORY[0x270EFDCF0]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}