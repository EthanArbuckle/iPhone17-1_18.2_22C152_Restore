uint64_t isInternal()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t seedFeedbackPromptingEnabled()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  if (result)
  {
    return MEMORY[0x270ED8070]("OSAnalytics", "forceSeedFeedbackPrompting");
  }
  return result;
}

BOOL sub_22B55EB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a3;
  v19[1] = a2;
  uint64_t v20 = sub_22B5710D0();
  uint64_t v3 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22B570EF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B5710B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053C0);
  uint64_t v10 = sub_22B5710C0();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_22B571DA0;
  (*(void (**)(unint64_t, void, uint64_t))(v11 + 104))(v13 + v12, *MEMORY[0x263F07890], v10);
  sub_22B55F138(v13);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_22B5710A0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  uint64_t v14 = sub_22B570EE0();
  char v16 = v15;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v16) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v14;
  }
  return v17 < v21;
}

BOOL sub_22B55EDA8()
{
  sub_22B565828();
  v1[2] = 24;
  return sub_22B565A64(0xD000000000000012, 0x800000022B572690, 2, (uint64_t)sub_22B55F4BC, (uint64_t)v1);
}

void sub_22B55EE28(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_22B55EE30()
{
  return sub_22B571100();
}

uint64_t sub_22B55EE7C()
{
  return sub_22B5710F0();
}

uint64_t sub_22B55EED4()
{
  return sub_22B5715A0();
}

void *sub_22B55EF3C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for CriticalPolicy()
{
  return &type metadata for CriticalPolicy;
}

void type metadata accessor for CFString()
{
  if (!qword_2684053A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2684053A8);
    }
  }
}

uint64_t sub_22B55EFB0()
{
  swift_getWitnessTable();

  return sub_22B5710E0();
}

uint64_t sub_22B55F01C()
{
  return sub_22B55F508(&qword_2684053B0, (void (*)(uint64_t))type metadata accessor for CFString);
}

uint64_t sub_22B55F064()
{
  return sub_22B55F508(&qword_2684053B8, (void (*)(uint64_t))type metadata accessor for CFString);
}

unint64_t sub_22B55F0AC(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x230F4B790](&v3, 8);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x230F4B790](&v3, 8);
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

uint64_t sub_22B55F138(uint64_t a1)
{
  uint64_t v2 = sub_22B5710C0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684053C8);
    uint64_t v9 = sub_22B571420();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    char v15 = (void (**)(char *, uint64_t))(v11 - 8);
    v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_22B55F508(&qword_2684053D0, MEMORY[0x263F07908]);
      uint64_t v16 = sub_22B571190();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_22B55F508(&qword_2684053D8, MEMORY[0x263F07908]);
          char v23 = sub_22B5711A0();
          v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_22B55F450()
{
  uint64_t result = sub_22B565DD4(0xD000000000000023, 0x800000022B572660);
  if (v1) {
    uint64_t v2 = 10;
  }
  else {
    uint64_t v2 = result;
  }
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = sub_22B55F0AC(0x64uLL);
    return v3 < 0x7FFFFFFFFFFFFFFFLL && v2 >= (uint64_t)(v3 + 1);
  }
  return result;
}

BOOL sub_22B55F4BC(uint64_t a1, uint64_t a2)
{
  return sub_22B55EB04(a1, a2, *(void *)(v2 + 16));
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

uint64_t sub_22B55F508(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22B55F550(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6572756C696166;
      break;
    case 2:
      unint64_t result = 0x2D6572756C696166;
      break;
    case 3:
    case 4:
      return result;
    case 5:
      unint64_t result = 0x2D64656C706D6173;
      break;
    case 6:
      unint64_t result = 0x662D6C65636E6163;
      break;
    case 7:
      unint64_t result = 0x642D6C65636E6163;
      break;
    default:
      unint64_t result = 0x73736563637573;
      break;
  }
  return result;
}

uint64_t sub_22B55F670(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  swift_bridgeObjectRetain();
  id v8 = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *a4;
  *a4 = 0x8000000000000000;
  sub_22B55FA2C((uint64_t)v8, a1, a2, isUniquelyReferenced_nonNull_native);
  *a4 = v11;
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22B55F71C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053F8);
  char v38 = a2;
  uint64_t v6 = sub_22B571490();
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
  v35 = v2;
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
    uint64_t v22 = (void *)(v5 + 64);
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
          unint64_t v3 = v35;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_22B571580();
    sub_22B571250();
    uint64_t result = sub_22B5715A0();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

void sub_22B55FA2C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_22B56A020(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_22B55FB9C();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_22B55F71C(v15, a4 & 1);
  unint64_t v20 = sub_22B56A020(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_22B571520();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_22B55FB9C()
{
  char v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22B571480();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *char v1 = v4;
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
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

uint64_t sub_22B55FD50(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v20 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v20 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v20 + 8 * v9);
        if (!v18)
        {
          int64_t v9 = v17 + 3;
          if (v17 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v20 + 8 * v9);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    unint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    unint64_t v15 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v16 = v15;
    a2(v13, v14, v16);

    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v7) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v20 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_22B55FF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B571DA0;
  *(void *)(inited + 32) = 0x737574617473;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v6 = inited;
  uint64_t v7 = sub_22B5711E0();
  swift_bridgeObjectRelease();
  *(void *)(v6 + 48) = v7;
  unint64_t v8 = sub_22B568B5C(v6);
  unint64_t v18 = v8;
  if (*(void *)(a2 + 24))
  {
    sub_22B56029C(a2, (uint64_t)v15);
    uint64_t v9 = v16;
    if (!v16)
    {
      __break(1u);
      JUMPOUT(0x22B560220);
    }
    uint64_t v10 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 56))(v9, v10);
    uint64_t v12 = MEMORY[0x270FA5388](v11);
    sub_22B55FD50(v12, (void (*)(uint64_t, uint64_t, id))sub_22B560398);
    swift_bridgeObjectRelease();
    unint64_t v8 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  MEMORY[0x270FA5388](v8);
  sub_22B55FD50(a3, (void (*)(uint64_t, uint64_t, id))sub_22B560240);
  uint64_t v13 = (void *)sub_22B5711E0();
  sub_22B56025C();
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_22B571180();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
  swift_bridgeObjectRelease();
}

uint64_t sub_22B560240(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22B55F670(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

unint64_t sub_22B56025C()
{
  unint64_t result = qword_2684053E8;
  if (!qword_2684053E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684053E8);
  }
  return result;
}

uint64_t sub_22B56029C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684053F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

BOOL sub_22B56039C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22B5603B0()
{
  return sub_22B5715A0();
}

uint64_t sub_22B5603F8()
{
  return sub_22B571590();
}

uint64_t sub_22B560424()
{
  return sub_22B5715A0();
}

uint64_t sub_22B560468@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = a1;
  uint64_t v46 = a3;
  int v5 = a1;
  uint64_t v6 = sub_22B570FF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v41 = &v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = (int *)type metadata accessor for CrashLog();
  uint64_t v45 = *((void *)v9 - 1);
  uint64_t v10 = (int *)MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = &v12[v10[6]];
  *(void *)uint64_t v13 = 0x6873617243;
  *((void *)v13 + 1) = 0xE500000000000000;
  uint64_t v14 = &v12[v10[10]];
  if (v5 == 4) {
    char v4 = 3;
  }
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  v40 = v14;
  *uint64_t v12 = v4;
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v15(&v12[v10[5]], a2, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405400);
  uint64_t v42 = v7;
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_22B571DA0;
  uint64_t v44 = v6;
  v15((char *)(v17 + v16), a2, v6);
  *(void *)&v12[v9[7]] = v17;
  unint64_t v18 = sub_22B568C78(MEMORY[0x263F8EE78]);
  uint64_t v19 = v9[8];
  *(void *)&v12[v19] = v18;
  uint64_t v20 = &type metadata for DefaultPolicy;
  if ((v4 & 0xFE) != 0)
  {
    char v21 = &off_26DEBEC30;
  }
  else
  {
    uint64_t v20 = &type metadata for CriticalPolicy;
    char v21 = &off_26DEBE770;
  }
  *((void *)&v50 + 1) = v20;
  v51 = v21;
  v43 = v9;
  sub_22B560BCC(&v49, (uint64_t)&v12[v9[9]]);
  int64_t v22 = sub_22B56B7F4(a2);
  unint64_t v23 = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v12[v19] = v22;
  uint64_t v24 = sub_22B571200();
  uint64_t v26 = v25;
  sub_22B570EC0();
  swift_allocObject();
  uint64_t v27 = sub_22B570EB0();
  long long v49 = 0uLL;
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  *(void *)&v39[-48] = a2;
  *(void *)&v39[-40] = v24;
  *(void *)&v39[-32] = v26;
  *(void *)&v39[-24] = 128;
  *(void *)&v39[-16] = v29;
  uint64_t v47 = 0;
  uint64_t v48 = v28;
  sub_22B562F0C((uint64_t (*)(uint64_t, uint64_t))sub_22B5612A4);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v30 = *((void *)&v49 + 1);
  if (!*((void *)&v49 + 1))
  {
    uint64_t v33 = v44;
    uint64_t v32 = v23;
    if (v22[2] && (unint64_t v34 = sub_22B56A020(1701667182, 0xE400000000000000), (v35 & 1) != 0))
    {
      sub_22B56177C(v22[7] + 32 * v34, (uint64_t)&v49);
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
    }
    uint64_t v36 = v42;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(a2, v33);
    if (*((void *)&v50 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v31 = v47;
        uint64_t v30 = v48;
        goto LABEL_17;
      }
    }
    else
    {
      sub_22B5616B8((uint64_t)&v49);
    }
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    goto LABEL_17;
  }
  uint64_t v31 = v49;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(a2, v44);
  uint64_t v47 = v31;
  uint64_t v48 = v30;
  uint64_t v32 = v23;
LABEL_17:
  swift_bridgeObjectRelease();
  *(void *)uint64_t v32 = v31;
  *((void *)v32 + 1) = v30;
  uint64_t v37 = v46;
  sub_22B561718((uint64_t)v12, v46);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v45 + 56))(v37, 0, 1, v43);
  return sub_22B561248((uint64_t)v12);
}

uint64_t type metadata accessor for CrashLog()
{
  uint64_t result = qword_268405410;
  if (!qword_268405410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22B560BCC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22B560BE4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_22B5612E8(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22B5612E8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_22B5612E8(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_22B5626FC(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_22B560D0C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B571EC0;
  *(void *)(inited + 32) = 0x737365636F7270;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v3 = *(int *)(type metadata accessor for CrashLog() + 32);
  uint64_t v4 = *(void *)(v0 + v3);
  if (*(void *)(v4 + 16)
    && (unint64_t v5 = sub_22B56A020(1701667182, 0xE400000000000000), (v6 & 1) != 0)
    && (sub_22B56177C(*(void *)(v4 + 56) + 32 * v5, (uint64_t)v14), sub_22B562710(), swift_dynamicCast()))
  {
    uint64_t v7 = v13;
  }
  else
  {
    sub_22B562710();
    uint64_t v7 = sub_22B5713A0();
  }
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = 0x746E656469636E69;
  *(void *)(inited + 64) = 0xEB0000000064695FLL;
  uint64_t v8 = *(void *)(v1 + v3);
  if (*(void *)(v8 + 16)
    && (unint64_t v9 = sub_22B56A020(0x746E656469636E69, 0xEB0000000064695FLL), (v10 & 1) != 0)
    && (sub_22B56177C(*(void *)(v8 + 56) + 32 * v9, (uint64_t)v14), sub_22B562710(), swift_dynamicCast()))
  {
    uint64_t v11 = v13;
  }
  else
  {
    sub_22B562710();
    uint64_t v11 = sub_22B5713A0();
  }
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = 1701869940;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = sub_22B5711E0();
  return sub_22B568B5C(inited);
}

unint64_t sub_22B560EFC()
{
  int v1 = *v0;
  uint64_t v2 = 0x61576D6574737953;
  uint64_t v3 = 0x647261646E617453;
  if (!*v0) {
    uint64_t v3 = 4541505;
  }
  if (v1 != 1) {
    uint64_t v2 = v3;
  }
  if (v1 == 2) {
    return 0xD000000000000014;
  }
  else {
    return v2;
  }
}

uint64_t sub_22B560F80()
{
  uint64_t v1 = type metadata accessor for CrashLog();
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)v23 - v6;
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)v23 - v8;
  int v10 = *v0;
  sub_22B561718((uint64_t)v0, (uint64_t)v23 - v8);
  if (!v10)
  {
    unsigned __int8 v12 = 1;
    uint64_t v4 = v9;
    goto LABEL_19;
  }
  int v11 = *v9;
  sub_22B561248((uint64_t)v9);
  if (v11 != 1)
  {
    char v13 = sub_22B5623C8(*(void *)&v0[*(int *)(v1 + 32)]);
    sub_22B561718((uint64_t)v0, (uint64_t)v7);
    if (v13)
    {
      sub_22B561248((uint64_t)v7);
      sub_22B561718((uint64_t)v0, (uint64_t)v4);
    }
    else
    {
      char v14 = sub_22B562330(*(void *)&v7[*(int *)(v1 + 32)]);
      sub_22B561248((uint64_t)v7);
      sub_22B561718((uint64_t)v0, (uint64_t)v4);
      if ((v14 & 1) == 0)
      {
        uint64_t v15 = *(void *)&v4[*(int *)(v1 + 32)];
        if (*(void *)(v15 + 16) && (unint64_t v16 = sub_22B56A020(0x4449656C646E7562, 0xE800000000000000), (v17 & 1) != 0))
        {
          sub_22B56177C(*(void *)(v15 + 56) + 32 * v16, (uint64_t)v24);
          int v18 = swift_dynamicCast();
          BOOL v19 = v18 == 0;
          if (v18) {
            uint64_t v20 = v23[0];
          }
          else {
            uint64_t v20 = 0;
          }
          if (v19) {
            char v21 = 0;
          }
          else {
            char v21 = (void *)v23[1];
          }
        }
        else
        {
          uint64_t v20 = 0;
          char v21 = 0;
        }
        unsigned __int8 v12 = sub_22B5625E0(v20, v21);
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    unsigned __int8 v12 = 0;
LABEL_19:
    sub_22B561248((uint64_t)v4);
    return v12 & 1;
  }
  unsigned __int8 v12 = 1;
  return v12 & 1;
}

uint64_t sub_22B561180(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22B5611B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22B562750(v2 + *(int *)(a1 + 36), a2);
}

uint64_t sub_22B5611D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 40));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_22B561248(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CrashLog();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22B5612A4(uint64_t a1)
{
  return sub_22B562ACC(a1);
}

uint64_t sub_22B5612C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22B561308(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_22B5612E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22B561548(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22B561308(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405430);
  uint64_t v10 = *(void *)(sub_22B571070() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_22B571070() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  int v18 = (char *)v13 + v17;
  BOOL v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  char v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_22B5714B0();
  __break(1u);
  return result;
}

uint64_t sub_22B561548(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268405420);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22B5714B0();
  __break(1u);
  return result;
}

uint64_t sub_22B5616B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405408);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22B561718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CrashLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B56177C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_22B5617D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_22B570FF0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    char v13 = (uint64_t *)((char *)v4 + v11);
    size_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *char v13 = *v14;
    v13[1] = v15;
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    uint64_t v16 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    unint64_t v17 = (char *)v4 + v16;
    int v18 = (char *)a2 + v16;
    long long v19 = *(_OWORD *)((char *)a2 + v16 + 24);
    *(_OWORD *)((char *)v4 + v16 + 24) = v19;
    uint64_t v20 = v19;
    char v21 = **(void (***)(char *, char *, uint64_t))(v19 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v17, v18, v20);
    uint64_t v22 = a3[10];
    unint64_t v23 = (uint64_t *)((char *)v4 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *unint64_t v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_22B561974(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_22B570FF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 36));

  return swift_bridgeObjectRelease();
}

unsigned char *sub_22B561A30(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_22B570FF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  char v13 = &a2[v10];
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(void *)&a1[v11] = *(void *)&a2[v11];
  uint64_t v15 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v16 = &a1[v15];
  unint64_t v17 = &a2[v15];
  long long v18 = *(_OWORD *)&a2[v15 + 24];
  *(_OWORD *)&a1[v15 + 24] = v18;
  uint64_t v19 = v18;
  uint64_t v20 = **(void (***)(unsigned char *, unsigned char *, uint64_t))(v18 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v16, v17, v19);
  uint64_t v21 = a3[10];
  uint64_t v22 = &a1[v21];
  unint64_t v23 = &a2[v21];
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_22B561B7C(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_22B570FF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[a3[9]], (uint64_t *)&a2[a3[9]]);
  uint64_t v13 = a3[10];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
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
          *uint64_t result = *a2;
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
          *uint64_t v3 = *a2;
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

unsigned char *sub_22B561ED8(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_22B570FF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  uint64_t v11 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  return a1;
}

unsigned char *sub_22B561FA8(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_22B570FF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[9];
  uint64_t v16 = &a1[v15];
  unint64_t v17 = &a2[v15];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v15]);
  long long v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((void *)v16 + 4) = *((void *)v17 + 4);
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = (uint64_t *)&a2[v19];
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22B5620B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22B5620CC);
}

uint64_t sub_22B5620CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22B570FF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_22B562194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22B5621A8);
}

uint64_t sub_22B5621A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22B570FF0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_22B56226C()
{
  uint64_t result = sub_22B570FF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22B562330(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_22B56A020(0x617465625F7369, 0xE700000000000000);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_22B56177C(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v5 == 1;
  }
  return result;
}

uint64_t sub_22B5623C8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v2 = sub_22B56A020(0x4449656C646E7562, 0xE800000000000000);
    if (v3)
    {
      sub_22B56177C(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v13);
      swift_dynamicCast();
    }
  }
  unsigned __int8 v4 = sub_22B5712E0();
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 16)
    || (unint64_t v5 = sub_22B56A020(0x74737269665F7369, 0xEE0079747261705FLL), (v6 & 1) == 0)
    || (sub_22B56177C(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v13), (swift_dynamicCast() & 1) == 0))
  {
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    return 0;
  }
  if ((v4 & (v12 != 0)) != 0) {
    return 0;
  }
LABEL_8:
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_22B571130();
  __swift_project_value_buffer(v7, (uint64_t)qword_268405FA8);
  uint64_t v8 = sub_22B571110();
  os_log_type_t v9 = sub_22B571370();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_22B55C000, v8, v9, "3rd party app crash report.", v10, 2u);
    MEMORY[0x230F4B780](v10, -1, -1);
  }

  return 1;
}

id sub_22B5625E0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (a2)
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F793B0]), sel_init);
    id v4 = objc_msgSend(v3, sel_allHomeScreenApplicationBundleIdentifiers);

    uint64_t v5 = sub_22B571330();
    sub_22B560BE4(v5);
    swift_bridgeObjectRelease();
    id v6 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    uint64_t v7 = (void *)sub_22B571320();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v6, sel_initWithArray_, v7);

    os_log_type_t v9 = (void *)sub_22B5711E0();
    id v2 = objc_msgSend(v8, sel_containsObject_, v9);
  }
  return v2;
}

_OWORD *sub_22B5626FC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_22B562710()
{
  unint64_t result = qword_268405428;
  if (!qword_268405428)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268405428);
  }
  return result;
}

uint64_t sub_22B562750(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CrashLog.Type(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CrashLog.Type(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B562920);
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

uint64_t sub_22B562948(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22B562950(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrashLog.Type()
{
  return &type metadata for CrashLog.Type;
}

unint64_t sub_22B56296C()
{
  unint64_t result = qword_268405438;
  if (!qword_268405438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405438);
  }
  return result;
}

Swift::String_optional __swiftcall URL.extendedAttribute(_:)(Swift::String a1)
{
  sub_22B570EC0();
  swift_allocObject();
  sub_22B570EB0();
  sub_22B562F0C((uint64_t (*)(uint64_t, uint64_t))sub_22B5612A4);
  swift_release();
  uint64_t v1 = 0;
  int v2 = 0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.setExtendedAttribute(name:value:)()
{
  return sub_22B570FD0();
}

uint64_t sub_22B562ACC(uint64_t result)
{
  if (result)
  {
    MEMORY[0x270FA5388](result);
    return sub_22B570FD0();
  }
  return result;
}

uint64_t sub_22B562B50(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, void *a6)
{
  uint64_t v10 = sub_22B571220();
  ssize_t v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  uint64_t result = swift_release();
  if (v11 >= 1)
  {
    *a6 = MEMORY[0x230F4AE20](a4);
    a6[1] = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22B562BEC(const char *a1, uint64_t a2, unint64_t a3)
{
  value[2] = *MEMORY[0x263EF8340];
  switch(a3 >> 62)
  {
    case 1uLL:
      if ((int)a2 > a2 >> 32)
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      sub_22B5630A0(a2, a3);
      os_log_type_t v9 = (char *)sub_22B570E70();
      if (v9)
      {
        uint64_t v10 = sub_22B570EA0();
        if (__OFSUB__((int)a2, v10))
        {
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
        }
        v9 += (int)a2 - v10;
      }
      sub_22B570E90();
      if (__OFSUB__(HIDWORD(a2), a2))
      {
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
      uint64_t v11 = sub_22B571220();
      int v7 = setxattr(a1, (const char *)(v11 + 32), v9, HIDWORD(a2) - (int)a2, 0, 0);
      swift_release();
      uint64_t result = sub_22B5630F8(a2, a3);
      if (v7 < 0)
      {
LABEL_18:
        sub_22B56304C();
        swift_allocError();
        *uint64_t v20 = v7;
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a2 + 16);
      swift_retain();
      swift_retain();
      uint64_t v13 = (char *)sub_22B570E70();
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v14 = sub_22B570EA0();
      if (__OFSUB__(v12, v14)) {
        goto LABEL_24;
      }
      v13 += v12 - v14;
LABEL_14:
      sub_22B570E90();
      uint64_t v16 = *(void *)(a2 + 16);
      uint64_t v15 = *(void *)(a2 + 24);
      size_t v17 = v15 - v16;
      if (__OFSUB__(v15, v16)) {
        goto LABEL_21;
      }
      uint64_t v18 = sub_22B571220();
      int v7 = setxattr(a1, (const char *)(v18 + 32), v13, v17, 0, 0);
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      if (v7 < 0) {
        goto LABEL_18;
      }
      return result;
    case 3uLL:
      memset(value, 0, 14);
      uint64_t v19 = sub_22B571220();
      int v7 = setxattr(a1, (const char *)(v19 + 32), value, 0, 0, 0);
      uint64_t result = swift_release();
      if (v7 < 0) {
        goto LABEL_18;
      }
      return result;
    default:
      value[0] = a2;
      LOWORD(value[1]) = a3;
      BYTE2(value[1]) = BYTE2(a3);
      BYTE3(value[1]) = BYTE3(a3);
      BYTE4(value[1]) = BYTE4(a3);
      BYTE5(value[1]) = BYTE5(a3);
      uint64_t v6 = sub_22B571220();
      int v7 = setxattr(a1, (const char *)(v6 + 32), value, BYTE6(a3), 0, 0);
      uint64_t result = swift_release();
      if (v7 < 0) {
        goto LABEL_18;
      }
      return result;
  }
}

uint64_t sub_22B562F0C(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t result = sub_22B571010();
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_22B570E70();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = sub_22B570EA0();
  uint64_t v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = v5 - v4;
  uint64_t v9 = sub_22B570E90();
  if (v9 >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  return a1(v6 + v7, v6 + v7 + v10);
}

uint64_t sub_22B562FBC(const char *a1)
{
  return sub_22B562BEC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t _s22ExtendedAttributeErrorOwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s22ExtendedAttributeErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t sub_22B563034()
{
  return 0;
}

ValueMetadata *type metadata accessor for URL.ExtendedAttributeError()
{
  return &type metadata for URL.ExtendedAttributeError;
}

unint64_t sub_22B56304C()
{
  unint64_t result = qword_268405440;
  if (!qword_268405440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405440);
  }
  return result;
}

uint64_t sub_22B5630A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_22B5630F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_22B563150(const char *a1)
{
  return sub_22B562B50(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

void sub_22B563174(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 0x63696E6150 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  char v6 = sub_22B571510();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_21:
    uint64_t v22 = (void *)sub_22B5711E0();
    id v23 = objc_msgSend(self, sel_bundleWithIdentifier_, v22);

    if (v23)
    {
      sub_22B570F10();

      __swift_instantiateConcreteTypeFromMangledName(&qword_268405448);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_22B571DA0;
      uint64_t v25 = (void *)sub_22B5711E0();
      uint64_t v26 = (void *)MGGetStringAnswer();

      if (v26)
      {
        uint64_t v27 = sub_22B571200();
        uint64_t v29 = v28;

        *(void *)(v24 + 56) = MEMORY[0x263F8D310];
        *(void *)(v24 + 64) = sub_22B563AE8();
        *(void *)(v24 + 32) = v27;
        *(void *)(v24 + 40) = v29;
        sub_22B5711F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8) == 0x6873617243 && v9 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    sub_22B562750((uint64_t)a1, (uint64_t)v43);
  }
  else
  {
    char v11 = sub_22B571510();
    swift_bridgeObjectRelease();
    sub_22B562750((uint64_t)a1, (uint64_t)v43);
    if ((v11 & 1) == 0)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      goto LABEL_12;
    }
  }
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v31 + 64))(v30, v31) == 4541505 && v32 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    sub_22B562750((uint64_t)v43, (uint64_t)v40);
LABEL_32:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    goto LABEL_33;
  }
  char v33 = sub_22B571510();
  swift_bridgeObjectRelease();
  sub_22B562750((uint64_t)v43, (uint64_t)v40);
  if (v33) {
    goto LABEL_32;
  }
  uint64_t v34 = v41;
  uint64_t v35 = v42;
  __swift_project_boxed_opaque_existential_1(v40, v41);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 64))(v34, v35) == 0x61576D6574737953
    && v36 == 0xEE00676F64686374)
  {
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  char v39 = sub_22B571510();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  if ((v39 & 1) == 0)
  {
LABEL_12:
    uint64_t v12 = a1[3];
    uint64_t v13 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v12);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 72))(v12, v13);
    unint64_t v16 = v15;
    size_t v17 = (void *)sub_22B5711E0();
    id v18 = objc_msgSend(self, sel_bundleWithIdentifier_, v17);

    if (v18)
    {
      if (v16) {
        unint64_t v19 = v16;
      }
      else {
        unint64_t v19 = 0xE700000000000000;
      }
      if (v16) {
        uint64_t v20 = v14;
      }
      else {
        uint64_t v20 = 0x6E776F6E6B6E55;
      }
      sub_22B570F10();

      __swift_instantiateConcreteTypeFromMangledName(&qword_268405448);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_22B571DA0;
      *(void *)(v21 + 56) = MEMORY[0x263F8D310];
      *(void *)(v21 + 64) = sub_22B563AE8();
      *(void *)(v21 + 32) = v20;
      *(void *)(v21 + 40) = v19;
      sub_22B5711F0();
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
LABEL_42:
    __break(1u);
    return;
  }
LABEL_33:
  uint64_t v37 = (void *)sub_22B5711E0();
  id v38 = objc_msgSend(self, sel_bundleWithIdentifier_, v37);

  if (!v38)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  sub_22B570F10();

  sub_22B5711F0();
LABEL_35:
  swift_bridgeObjectRelease();
}

void sub_22B563800(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_22B571090();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_22B5711D0();
  MEMORY[0x270FA5388](v5 - 8);
  char v6 = (void *)sub_22B5711E0();
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleWithIdentifier_, v6);

  if (v8)
  {
    sub_22B570F10();

    uint64_t v9 = sub_22B5711F0();
    uint64_t v24 = v10;
    uint64_t v25 = v9;
    swift_bridgeObjectRelease();
    sub_22B563174(a1);
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    sub_22B5711C0();
    unint64_t v15 = (void *)sub_22B5711E0();
    id v16 = objc_msgSend(v7, sel_bundleWithIdentifier_, v15);

    sub_22B571080();
    uint64_t v17 = sub_22B571210();
    uint64_t v19 = v18;
    sub_22B5711C0();
    uint64_t v20 = (void *)sub_22B5711E0();
    id v21 = objc_msgSend(v7, sel_bundleWithIdentifier_, v20);

    sub_22B571080();
    uint64_t v22 = sub_22B571210();
    *a2 = v12;
    a2[1] = v14;
    a2[2] = v25;
    a2[3] = v24;
    a2[4] = v17;
    a2[5] = v19;
    a2[6] = v22;
    a2[7] = v23;
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_22B563AE8()
{
  unint64_t result = qword_268405450;
  if (!qword_268405450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405450);
  }
  return result;
}

uint64_t sub_22B563B3C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405468);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22B570FF0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v41 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v39 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v39 - v14;
  id v42 = objc_msgSend(self, sel_defaultManager);
  if (sub_22B570FB0())
  {
    sub_22B570FA0();
    sub_22B570FE0();
    id v16 = (void *)sub_22B5711E0();
    swift_bridgeObjectRelease();
    id v17 = v42;
    unsigned __int8 v18 = objc_msgSend(v42, sel_fileExistsAtPath_, v16);

    if (v18)
    {
      sub_22B570FE0();
      uint64_t v19 = (void *)sub_22B5711E0();
      swift_bridgeObjectRelease();
      unsigned __int8 v20 = objc_msgSend(v17, sel_isReadableFileAtPath_, v19);

      if (v20)
      {

        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a2, v15, v7);
LABEL_15:
        uint64_t v37 = 0;
        return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v37, 1, v7);
      }
      uint64_t v43 = 0;
      unint64_t v44 = 0xE000000000000000;
      sub_22B571430();
      swift_bridgeObjectRelease();
      unint64_t v22 = 0xD000000000000018;
      uint64_t v23 = "File is not readable at ";
    }
    else
    {
      uint64_t v43 = 0;
      unint64_t v44 = 0xE000000000000000;
      sub_22B571430();
      swift_bridgeObjectRelease();
      unint64_t v22 = 0xD000000000000016;
      uint64_t v23 = "File doesn't exist at ";
    }
    uint64_t v43 = v22;
    unint64_t v44 = (unint64_t)(v23 - 32) | 0x8000000000000000;
    sub_22B570FE0();
    sub_22B571270();
    swift_bridgeObjectRelease();
    id v21 = sub_22B5663F4(v43, v44);
    swift_bridgeObjectRelease();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  else
  {
    id v21 = sub_22B5663F4(0xD000000000000018, 0x800000022B5728E0);
    swift_willThrow();
  }
  sub_22B564A0C((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {

    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v36(v13, v6, v7);
    v36(a2, v13, v7);
    goto LABEL_15;
  }
  sub_22B566F14((uint64_t)v6, &qword_268405468);
  if (qword_268405390 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_22B571130();
  __swift_project_value_buffer(v24, (uint64_t)qword_268405F90);
  uint64_t v25 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v41, a1, v7);
  id v26 = v21;
  id v27 = v21;
  uint64_t v28 = sub_22B571110();
  os_log_type_t v29 = sub_22B571360();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v43 = v39;
    *(_DWORD *)uint64_t v30 = 136446466;
    sub_22B566DB0();
    uint64_t v31 = sub_22B571500();
    uint64_t v45 = sub_22B570404(v31, v32, &v43);
    v40 = a2;
    sub_22B5713D0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v7);
    *(_WORD *)(v30 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v33 = sub_22B571530();
    uint64_t v45 = sub_22B570404(v33, v34, &v43);
    a2 = v40;
    sub_22B5713D0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22B55C000, v28, v29, "Error accessing %{public}s. %{public}s", (uint8_t *)v30, 0x16u);
    uint64_t v35 = v39;
    swift_arrayDestroy();
    MEMORY[0x230F4B780](v35, -1, -1);
    MEMORY[0x230F4B780](v30, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v7);
  }
  uint64_t v37 = 1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v37, 1, v7);
}

void sub_22B564178(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v66 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405458);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v63 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v62 = (char *)&v61 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v61 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v61 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405460);
  MEMORY[0x270FA5388](v14 - 8);
  id v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405468);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_22B570FF0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v65 = (char *)&v61 - v25;
  id v26 = &a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess();
  if (!*((void *)v26 + 1))
  {
LABEL_4:
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_22B571130();
    __swift_project_value_buffer(v28, (uint64_t)qword_268405FA8);
    os_log_type_t v29 = sub_22B571110();
    os_log_type_t v30 = sub_22B571360();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_22B55C000, v29, v30, "Invalid log_path.", v31, 2u);
      MEMORY[0x230F4B780](v31, -1, -1);
    }

LABEL_9:
    unint64_t v32 = (_OWORD *)v66;
    *(void *)(v66 + 32) = 0;
    *unint64_t v32 = 0u;
    v32[1] = 0u;
    return;
  }
  swift_bridgeObjectRetain();
  sub_22B570F50();
  swift_bridgeObjectRelease();
  sub_22B563B3C((uint64_t)v24, v19);
  id v27 = *(void (**)(char *, uint64_t))(v21 + 8);
  v27(v24, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_22B566F14((uint64_t)v19, &qword_268405468);
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v65, v19, v20);
  uint64_t v33 = v64;
  switch(v64)
  {
    case 0:
      sub_22B56BA8C(0, a2, (uint64_t)v16);
      uint64_t v34 = type metadata accessor for PanicLog();
      int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 48))(v16, 1, v34);
      uint64_t v36 = v65;
      if (v35 == 1)
      {
        v27(v65, v20);
        uint64_t v37 = &qword_268405460;
        uint64_t v38 = (uint64_t)v16;
        goto LABEL_26;
      }
      v56 = (uint64_t *)v66;
      *(void *)(v66 + 24) = v34;
      v56[4] = (uint64_t)&off_26DEBEB10;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v56);
      sub_22B566D48((uint64_t)v16, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for PanicLog);
      v58 = v36;
      goto LABEL_32;
    case 1:
      uint64_t v45 = v65;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v65, v20);
      sub_22B560468(3u, (uint64_t)v24, (uint64_t)v11);
      uint64_t v46 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v11, 1, v46) == 1)
      {
        v27(v45, v20);
        uint64_t v37 = &qword_268405458;
        uint64_t v38 = (uint64_t)v11;
        goto LABEL_26;
      }
      v59 = (uint64_t *)v66;
      *(void *)(v66 + 24) = v46;
      v59[4] = (uint64_t)&off_26DEBE788;
      v54 = __swift_allocate_boxed_opaque_existential_1(v59);
      uint64_t v55 = (uint64_t)v11;
      goto LABEL_31;
    case 2:
      uint64_t v45 = v65;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v65, v20);
      sub_22B560468(0, (uint64_t)v24, (uint64_t)v13);
      uint64_t v47 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 48))(v13, 1, v47) == 1)
      {
        v27(v45, v20);
        uint64_t v37 = &qword_268405458;
        uint64_t v38 = (uint64_t)v13;
        goto LABEL_26;
      }
      v60 = (uint64_t *)v66;
      *(void *)(v66 + 24) = v47;
      v60[4] = (uint64_t)&off_26DEBE788;
      v54 = __swift_allocate_boxed_opaque_existential_1(v60);
      uint64_t v55 = (uint64_t)v13;
      goto LABEL_31;
    case 3:
      uint64_t v45 = v65;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v65, v20);
      uint64_t v48 = v62;
      uint64_t v49 = (uint64_t)v62;
      unsigned __int8 v50 = 1;
      goto LABEL_24;
    case 4:
      uint64_t v45 = v65;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v65, v20);
      uint64_t v48 = v63;
      uint64_t v49 = (uint64_t)v63;
      unsigned __int8 v50 = 2;
LABEL_24:
      sub_22B560468(v50, (uint64_t)v24, v49);
      uint64_t v51 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v48, 1, v51) == 1)
      {
        v27(v45, v20);
        uint64_t v37 = &qword_268405458;
        uint64_t v38 = (uint64_t)v48;
LABEL_26:
        sub_22B566F14(v38, v37);
        uint64_t v52 = v66;
        *(_OWORD *)uint64_t v66 = 0u;
        *(_OWORD *)(v52 + 16) = 0u;
        *(void *)(v52 + 32) = 0;
      }
      else
      {
        v53 = (uint64_t *)v66;
        *(void *)(v66 + 24) = v51;
        v53[4] = (uint64_t)&off_26DEBE788;
        v54 = __swift_allocate_boxed_opaque_existential_1(v53);
        uint64_t v55 = (uint64_t)v48;
LABEL_31:
        sub_22B566D48(v55, (uint64_t)v54, (uint64_t (*)(void))type metadata accessor for CrashLog);
        v58 = v45;
LABEL_32:
        v27(v58, v20);
      }
      break;
    default:
      if (qword_268405398 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_22B571130();
      __swift_project_value_buffer(v39, (uint64_t)qword_268405FA8);
      v40 = sub_22B571110();
      os_log_type_t v41 = sub_22B571360();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = v20;
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v43 = 134217984;
        uint64_t v67 = v33;
        sub_22B5713D0();
        _os_log_impl(&dword_22B55C000, v40, v41, "Invalid Log Type %ld", v43, 0xCu);
        unint64_t v44 = v43;
        uint64_t v20 = v42;
        MEMORY[0x230F4B780](v44, -1, -1);
      }

      v27(v65, v20);
      goto LABEL_9;
  }
}

uint64_t sub_22B564A0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22B570FF0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v18 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  sub_22B570FC0();
  sub_22B570F80();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  sub_22B570F60();
  sub_22B570F90();
  swift_bridgeObjectRelease();
  v12(v9, v2);
  id v13 = objc_msgSend(self, sel_defaultManager);
  sub_22B570FE0();
  uint64_t v14 = (void *)sub_22B5711E0();
  swift_bridgeObjectRelease();
  unsigned int v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if (v15)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v11, v2);
    uint64_t v16 = 0;
  }
  else
  {
    v12(v11, v2);
    uint64_t v16 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, v16, 1, v2);
}

uint64_t sub_22B564C4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405480);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22B571070();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v28 = (char *)&v24 - v10;
  int64_t v11 = *(void *)(a1 + 16);
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_22B5612C8(0, v11, 0);
  if (!v11) {
    return v30;
  }
  uint64_t v12 = a1 + 32;
  id v13 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v14 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v26 = v6;
  uint64_t v27 = MEMORY[0x263F8EE58] + 8;
  uint64_t v25 = v9;
  while (1)
  {
    sub_22B56177C(v12, (uint64_t)v29);
    int v15 = swift_dynamicCast();
    uint64_t v16 = *v13;
    if (!v15) {
      break;
    }
    v16(v4, 0, 1, v5);
    uint64_t v17 = *v14;
    uint64_t v18 = v28;
    (*v14)(v28, v4, v5);
    v17(v9, v18, v5);
    uint64_t v19 = v30;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22B5612C8(0, *(void *)(v19 + 16) + 1, 1);
      uint64_t v19 = v30;
    }
    unint64_t v21 = *(void *)(v19 + 16);
    unint64_t v20 = *(void *)(v19 + 24);
    if (v21 >= v20 >> 1)
    {
      sub_22B5612C8(v20 > 1, v21 + 1, 1);
      uint64_t v19 = v30;
    }
    *(void *)(v19 + 16) = v21 + 1;
    unint64_t v22 = v19
        + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))
        + *(void *)(v26 + 72) * v21;
    uint64_t v9 = v25;
    v17((char *)v22, v25, v5);
    uint64_t v30 = v19;
    v12 += 32;
    if (!--v11) {
      return v19;
    }
  }
  v16(v4, 1, 1, v5);
  swift_release();
  sub_22B566F14((uint64_t)v4, &qword_268405480);
  return 0;
}

uint64_t sub_22B564F2C(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405480);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22B571070();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v37 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v45 = (char *)&v30 - v14;
  uint64_t v46 = MEMORY[0x263F8EE78];
  uint64_t v38 = *(void *)(a3 + 16);
  if (v38)
  {
    unint64_t v15 = 0;
    uint64_t v39 = v10 + 48;
    unint64_t v44 = (void (**)(char *))(v10 + 32);
    uint64_t v40 = v10 + 56;
    uint64_t v41 = v10 + 16;
    unint64_t v32 = (v10 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v33 = (void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v36 = v10;
    while (v15 < *(void *)(a3 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      uint64_t v17 = *(void *)(v10 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, a3 + v16 + v17 * v15, v9);
      uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v18(v8, 0, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
        goto LABEL_17;
      }
      int v35 = v18;
      uint64_t v19 = a3;
      unint64_t v20 = v8;
      unint64_t v21 = v45;
      unint64_t v22 = *v44;
      uint64_t v23 = v20;
      (*v44)(v45);
      char v24 = v42(v21);
      if (v4)
      {
        (*v33)(v45, v9);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      if (v24)
      {
        ((void (*)(char *, char *, uint64_t))v22)(v37, v45, v9);
        uint64_t v25 = v46;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v34 = 0;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_22B5612C8(0, *(void *)(v25 + 16) + 1, 1);
          uint64_t v25 = v46;
        }
        unint64_t v28 = *(void *)(v25 + 16);
        unint64_t v27 = *(void *)(v25 + 24);
        unint64_t v29 = v28 + 1;
        if (v28 >= v27 >> 1)
        {
          unint64_t v31 = v28 + 1;
          sub_22B5612C8(v27 > 1, v28 + 1, 1);
          unint64_t v29 = v31;
          uint64_t v25 = v46;
        }
        *(void *)(v25 + 16) = v29;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v22)(v25 + v16 + v28 * v17, v37, v9);
        uint64_t v46 = v25;
        uint64_t v4 = v34;
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v33)(v45, v9);
      }
      a3 = v19;
      ++v15;
      uint64_t v8 = v23;
      uint64_t v10 = v36;
      if (v38 == v15)
      {
        v35(v23, 1, 1, v9);
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_17:
    swift_bridgeObjectRelease();
    sub_22B566F14((uint64_t)v8, &qword_268405480);
    return v46;
  }
  return result;
}

unsigned __int8 *sub_22B5652EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22B571300();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22B565650();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_22B571450();
  }
LABEL_7:
  uint64_t v11 = sub_22B5653D4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_22B5653D4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (i = result + 1; ; ++i)
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

uint64_t sub_22B565650()
{
  unint64_t v0 = sub_22B571310();
  uint64_t v4 = sub_22B5656D0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22B5656D0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_22B56E41C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22B5708A4(v9, 0);
      unint64_t v12 = sub_22B56E51C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22B571450();
LABEL_4:
        JUMPOUT(0x230F4AE30);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230F4AE30](v11 + 4, v11[2]);
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
    return MEMORY[0x230F4AE30]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

void sub_22B565828()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_operatingSystemVersionString);

  unint64_t v2 = v1;
  if (!v1)
  {
    sub_22B571200();
    unint64_t v2 = (void *)sub_22B5711E0();
    swift_bridgeObjectRelease();
  }
  uint64_t v3 = sub_22B571200();
  uint64_t v5 = v4;
  if (qword_2684053A0 != -1) {
    swift_once();
  }
  unsigned __int8 v6 = (void *)qword_268405FC0;
  unsigned __int8 v7 = (void *)sub_22B5711E0();
  id v8 = objc_msgSend(v6, sel_stringForKey_, v7);

  if (v8)
  {
    uint64_t v9 = sub_22B571200();
    uint64_t v11 = v10;

    if (v9 == v3 && v11 == v5)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v13 = sub_22B571510();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        uint64_t v14 = (void *)qword_268405FC0;
        unsigned __int8 v15 = (void *)sub_22B5711E0();
        objc_msgSend(v14, sel_removeObjectForKey_, v15);
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unsigned __int8 v16 = (void *)qword_268405FC0;
  id v17 = (id)sub_22B5711E0();
  objc_msgSend(v16, sel_setValue_forKey_, v2, v17);
}

BOOL sub_22B565A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = a5;
  uint64_t v8 = sub_22B571070();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v30 - v13;
  if (qword_2684053A0 != -1) {
    swift_once();
  }
  unsigned __int8 v15 = (void *)qword_268405FC0;
  unsigned __int8 v16 = (void *)sub_22B5711E0();
  id v17 = objc_msgSend(v15, sel_arrayForKey_, v16);

  if (!v17 || (uint64_t v18 = sub_22B571330(), v17, v19 = sub_22B564C4C(v18), swift_bridgeObjectRelease(), !v19))
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
  uint64_t v20 = sub_22B571060();
  uint64_t v21 = *(void *)(v19 + 16);
  uint64_t v32 = a1;
  if (v21 >= a3)
  {
    MEMORY[0x270FA5388](v20);
    uint64_t v22 = v31;
    *(&v30 - 4) = a4;
    *(&v30 - 3) = v22;
    *(&v30 - 2) = (uint64_t)v14;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_22B564F2C((uint64_t (*)(char *))sub_22B566ED8, (uint64_t)(&v30 - 6), v19);
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void *)(v23 + 16);
    uint64_t v19 = v23;
  }
  if (v21 < a3)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v19 = sub_22B56DFA8(0, v21 + 1, 1, v19);
    }
    unint64_t v25 = *(void *)(v19 + 16);
    unint64_t v24 = *(void *)(v19 + 24);
    if (v25 >= v24 >> 1) {
      uint64_t v19 = sub_22B56DFA8(v24 > 1, v25 + 1, 1, v19);
    }
    *(void *)(v19 + 16) = v25 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v25, v12, v8);
    unsigned int v26 = (void *)qword_268405FC0;
    char v27 = (void *)sub_22B571320();
    swift_bridgeObjectRelease();
    uint64_t v28 = (void *)sub_22B5711E0();
    objc_msgSend(v26, sel_setValue_forKey_, v27, v28);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v21 >= a3;
}

uint64_t sub_22B565DD4(uint64_t a1, unint64_t a2)
{
  if (qword_2684053A0 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_268405FC0;
  uint64_t v5 = (void *)sub_22B5711E0();
  id v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_22B5713F0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  sub_22B566E08((uint64_t)&v40, (uint64_t)v42);
  sub_22B566E70((uint64_t)v42, (uint64_t)&v40);
  uint64_t v7 = *((void *)&v41 + 1);
  sub_22B566F14((uint64_t)&v40, &qword_268405408);
  if (v7)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_22B571130();
    __swift_project_value_buffer(v8, (uint64_t)qword_268405FA8);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_22B571110();
    os_log_type_t v10 = sub_22B571370();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(void *)&long long v40 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_22B570404(a1, a2, (uint64_t *)&v40);
      sub_22B5713D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22B55C000, v9, v10, "Using defaults value for %s.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F4B780](v12, -1, -1);
      MEMORY[0x230F4B780](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    id v13 = objc_msgSend(self, sel_sharedInstance);
    uint64_t v14 = (void *)sub_22B5711E0();
    id v15 = objc_msgSend(v13, sel_getTaskingKey_, v14);

    if (v15)
    {
      sub_22B5713F0();
      swift_unknownObjectRelease();
      sub_22B566F14((uint64_t)v42, &qword_268405408);
    }
    else
    {
      sub_22B566F14((uint64_t)v42, &qword_268405408);
      long long v40 = 0u;
      long long v41 = 0u;
    }
    sub_22B566E08((uint64_t)&v40, (uint64_t)v42);
  }
  sub_22B566E70((uint64_t)v42, (uint64_t)&v40);
  if (!*((void *)&v41 + 1))
  {
    sub_22B566F14((uint64_t)&v40, &qword_268405408);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    uint64_t v24 = 0;
LABEL_66:
    sub_22B566F14((uint64_t)v42, &qword_268405408);
    return v24;
  }
  uint64_t result = v38;
  uint64_t v17 = HIBYTE(v39) & 0xF;
  uint64_t v18 = v38 & 0xFFFFFFFFFFFFLL;
  if ((v39 & 0x2000000000000000) != 0) {
    uint64_t v19 = HIBYTE(v39) & 0xF;
  }
  else {
    uint64_t v19 = v38 & 0xFFFFFFFFFFFFLL;
  }
  if (!v19)
  {
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  if ((v39 & 0x1000000000000000) != 0)
  {
    uint64_t v21 = (uint64_t)sub_22B5652EC(v38, v39, 10);
    char v23 = v37;
LABEL_63:
    swift_bridgeObjectRelease();
    if (v23) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = v21;
    }
    goto LABEL_66;
  }
  if ((v39 & 0x2000000000000000) == 0)
  {
    if ((v38 & 0x1000000000000000) != 0) {
      uint64_t v20 = (unsigned __int8 *)((v39 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v20 = (unsigned __int8 *)sub_22B571450();
    }
    uint64_t v21 = (uint64_t)sub_22B5653D4(v20, v18, 10);
    char v23 = v22 & 1;
    goto LABEL_63;
  }
  *(void *)&long long v40 = v38;
  *((void *)&v40 + 1) = v39 & 0xFFFFFFFFFFFFFFLL;
  if (v38 == 43)
  {
    if (!v17) {
      goto LABEL_77;
    }
    if (v17 == 1 || (BYTE1(v38) - 48) > 9u) {
      goto LABEL_50;
    }
    uint64_t v21 = (BYTE1(v38) - 48);
    if (v17 != 2)
    {
      if ((BYTE2(v38) - 48) > 9u) {
        goto LABEL_50;
      }
      uint64_t v21 = 10 * (BYTE1(v38) - 48) + (BYTE2(v38) - 48);
      uint64_t v25 = v17 - 3;
      if (v25)
      {
        unsigned int v26 = (unsigned __int8 *)&v40 + 3;
        while (1)
        {
          unsigned int v27 = *v26 - 48;
          if (v27 > 9) {
            goto LABEL_50;
          }
          uint64_t v28 = 10 * v21;
          if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63) {
            goto LABEL_50;
          }
          uint64_t v21 = v28 + v27;
          if (__OFADD__(v28, v27)) {
            goto LABEL_50;
          }
          char v23 = 0;
          ++v26;
          if (!--v25) {
            goto LABEL_63;
          }
        }
      }
    }
LABEL_62:
    char v23 = 0;
    goto LABEL_63;
  }
  if (v38 != 45)
  {
    if (!v17 || (v38 - 48) > 9u) {
      goto LABEL_50;
    }
    uint64_t v21 = (v38 - 48);
    if (v17 != 1)
    {
      if ((BYTE1(v38) - 48) > 9u) {
        goto LABEL_50;
      }
      uint64_t v21 = 10 * (v38 - 48) + (BYTE1(v38) - 48);
      uint64_t v29 = v17 - 2;
      if (v29)
      {
        uint64_t v30 = (unsigned __int8 *)&v40 + 2;
        while (1)
        {
          unsigned int v31 = *v30 - 48;
          if (v31 > 9) {
            goto LABEL_50;
          }
          uint64_t v32 = 10 * v21;
          if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63) {
            goto LABEL_50;
          }
          uint64_t v21 = v32 + v31;
          if (__OFADD__(v32, v31)) {
            goto LABEL_50;
          }
          char v23 = 0;
          ++v30;
          if (!--v29) {
            goto LABEL_63;
          }
        }
      }
    }
    goto LABEL_62;
  }
  if (v17)
  {
    if (v17 != 1 && (BYTE1(v38) - 48) <= 9u)
    {
      if (v17 == 2)
      {
        char v23 = 0;
        uint64_t v21 = -(uint64_t)(BYTE1(v38) - 48);
        goto LABEL_63;
      }
      if ((BYTE2(v38) - 48) <= 9u)
      {
        uint64_t v21 = -10 * (BYTE1(v38) - 48) - (BYTE2(v38) - 48);
        uint64_t v33 = v17 - 3;
        if (!v33) {
          goto LABEL_62;
        }
        uint64_t v34 = (unsigned __int8 *)&v40 + 3;
        while (1)
        {
          unsigned int v35 = *v34 - 48;
          if (v35 > 9) {
            break;
          }
          uint64_t v36 = 10 * v21;
          if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63) {
            break;
          }
          uint64_t v21 = v36 - v35;
          if (__OFSUB__(v36, v35)) {
            break;
          }
          char v23 = 0;
          ++v34;
          if (!--v33) {
            goto LABEL_63;
          }
        }
      }
    }
LABEL_50:
    uint64_t v21 = 0;
    char v23 = 1;
    goto LABEL_63;
  }
  __break(1u);
LABEL_77:
  __break(1u);
  return result;
}

id sub_22B5663F4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405478);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B571DA0;
  *(void *)(inited + 32) = sub_22B571200();
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  sub_22B568C78(inited);
  id v6 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v7 = (void *)sub_22B5711E0();
  uint64_t v8 = (void *)sub_22B571180();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_initWithDomain_code_userInfo_, v7, 1, v8);

  return v9;
}

uint64_t sub_22B56650C(void *a1)
{
  if ((seedFeedbackPromptingEnabled() & 1) == 0)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_22B571130();
    __swift_project_value_buffer(v21, (uint64_t)qword_268405FA8);
    char v22 = sub_22B571110();
    os_log_type_t v23 = sub_22B571360();
    if (!os_log_type_enabled(v22, v23)) {
      goto LABEL_19;
    }
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v40[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v43 = sub_22B570404(0xD00000000000001ALL, 0x800000022B5728C0, v40);
    sub_22B5713D0();
    unsigned int v26 = "%s Not running on a seed build and feedback prompting is disabled.";
    goto LABEL_18;
  }
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v2, v3) & 1) == 0)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_22B571130();
    __swift_project_value_buffer(v27, (uint64_t)qword_268405FA8);
    char v22 = sub_22B571110();
    os_log_type_t v23 = sub_22B571360();
    if (!os_log_type_enabled(v22, v23)) {
      goto LABEL_19;
    }
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v40[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v43 = sub_22B570404(0xD00000000000001ALL, 0x800000022B5728C0, v40);
    sub_22B5713D0();
    unsigned int v26 = "%s Failed isUseful check.";
LABEL_18:
    _os_log_impl(&dword_22B55C000, v22, v23, v26, v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F4B780](v25, -1, -1);
    MEMORY[0x230F4B780](v24, -1, -1);
LABEL_19:

    return 0;
  }
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 48))(v40, v4, v5);
  uint64_t v6 = v41;
  uint64_t v7 = v42;
  __swift_project_boxed_opaque_existential_1(v40, v41);
  char v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  if ((v8 & 1) == 0)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_22B571130();
    __swift_project_value_buffer(v28, (uint64_t)qword_268405FA8);
    uint64_t v29 = sub_22B571110();
    os_log_type_t v30 = sub_22B571360();
    if (os_log_type_enabled(v29, v30))
    {
      unsigned int v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      v40[0] = v32;
      *(_DWORD *)unsigned int v31 = 136315138;
      uint64_t v43 = sub_22B570404(0xD00000000000001ALL, 0x800000022B5728C0, v40);
      sub_22B5713D0();
      _os_log_impl(&dword_22B55C000, v29, v30, "%s Sampled out.", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F4B780](v32, -1, -1);
      MEMORY[0x230F4B780](v31, -1, -1);
    }

    sub_22B562750((uint64_t)a1, (uint64_t)v40);
    unint64_t v19 = sub_22B568B5C(MEMORY[0x263F8EE78]);
    uint64_t v20 = 5;
    goto LABEL_25;
  }
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v10 + 48))(v40, v9, v10);
  uint64_t v11 = v41;
  uint64_t v12 = v42;
  __swift_project_boxed_opaque_existential_1(v40, v41);
  char v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  if (v13)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_22B571130();
    __swift_project_value_buffer(v14, (uint64_t)qword_268405FA8);
    id v15 = sub_22B571110();
    os_log_type_t v16 = sub_22B571360();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v40[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v43 = sub_22B570404(0xD00000000000001ALL, 0x800000022B5728C0, v40);
      sub_22B5713D0();
      _os_log_impl(&dword_22B55C000, v15, v16, "%s Exceeded show limit.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F4B780](v18, -1, -1);
      MEMORY[0x230F4B780](v17, -1, -1);
    }

    sub_22B562750((uint64_t)a1, (uint64_t)v40);
    unint64_t v19 = sub_22B568B5C(MEMORY[0x263F8EE78]);
    uint64_t v20 = 4;
LABEL_25:
    sub_22B55FF08(v20, (uint64_t)v40, v19);
    swift_bridgeObjectRelease();
    sub_22B566F14((uint64_t)v40, &qword_2684053F0);
    return 0;
  }
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_22B571130();
  __swift_project_value_buffer(v35, (uint64_t)qword_268405FA8);
  uint64_t v36 = sub_22B571110();
  os_log_type_t v37 = sub_22B571370();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v40[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v43 = sub_22B570404(0xD00000000000001ALL, 0x800000022B5728C0, v40);
    sub_22B5713D0();
    _os_log_impl(&dword_22B55C000, v36, v37, "%s Success.", v38, 0xCu);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x230F4B780](v39, -1, -1);
    MEMORY[0x230F4B780](v38, -1, -1);
  }
  else
  {

    return 1;
  }
  return v33;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22B566D48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_22B566DB0()
{
  unint64_t result = qword_268405470;
  if (!qword_268405470)
  {
    sub_22B570FF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405470);
  }
  return result;
}

uint64_t sub_22B566E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B566E70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B566ED8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(v1 + 32)) & 1;
}

uint64_t sub_22B566F14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22B566F70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_22B566F84(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_22B566F98(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_22B566FAC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_22B566FC0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_22B566FD4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_22B566FE8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_22B566FFC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_22B567010(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_22B567024(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_22B567038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t sub_22B567060(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_22B567074(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_22B567088(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_22B56709C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_22B56712C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22B5671E0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B567234(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22B5672A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22B567308()
{
  return sub_22B567428(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t sub_22B567320(uint64_t a1, uint64_t a2)
{
  return sub_22B567510(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t (*sub_22B56732C())()
{
  return j_j__swift_endAccess;
}

id sub_22B567394(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_22B5711E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_22B56741C()
{
  return sub_22B567428(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_22B567428(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_22B567488(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_22B571200();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  uint64_t *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B567504(uint64_t a1, uint64_t a2)
{
  return sub_22B567510(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_22B567510(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B56756C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22B5675D4())()
{
  return j__swift_endAccess;
}

id DiagnosticsReporterLaunchOptions.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DiagnosticsReporterLaunchOptions.init()()
{
  *(void *)&v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = MEMORY[0x263F8EE78];
  id v1 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  uint64_t v3 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  v5.receiver = v0;
  v5.super_class = v3;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for DiagnosticsReporterLaunchOptions()
{
  return self;
}

uint64_t sub_22B567770(char a1)
{
  return qword_22B5722B0[a1];
}

uint64_t sub_22B567790()
{
  return sub_22B567770(*v0);
}

uint64_t sub_22B567798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22B5686C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22B5677C0()
{
  return 0;
}

void sub_22B5677CC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_22B5677D8(uint64_t a1)
{
  unint64_t v2 = sub_22B567B84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22B567814(uint64_t a1)
{
  unint64_t v2 = sub_22B567B84();

  return MEMORY[0x270FA00B8](a1, v2);
}

id DiagnosticsReporterLaunchOptions.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporterLaunchOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22B5678E8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684054A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22B567B84();
  sub_22B5715C0();
  uint64_t v9 = (uint64_t *)(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  uint64_t v13 = *v9;
  char v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684054B0);
  sub_22B567FE4(&qword_2684054B8);
  sub_22B5714F0();
  if (v2) {
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_beginAccess();
  char v12 = 1;
  swift_bridgeObjectRetain();
  sub_22B5714E0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v11[7] = 2;
  swift_bridgeObjectRetain();
  sub_22B5714E0();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_bridgeObjectRelease();
}

unint64_t sub_22B567B84()
{
  unint64_t result = qword_2684054A8;
  if (!qword_2684054A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684054A8);
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

id DiagnosticsReporterLaunchOptions.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DiagnosticsReporterLaunchOptions.init(from:)(a1);
}

id DiagnosticsReporterLaunchOptions.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684054C0);
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  os_log_type_t v30 = a1;
  *(void *)&v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = MEMORY[0x263F8EE78];
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v36 = (uint64_t *)v8;
  id v9 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v9);
  sub_22B567B84();
  unsigned int v31 = v1;
  sub_22B5715B0();
  if (v2)
  {
    uint64_t v13 = v31;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for DiagnosticsReporterLaunchOptions();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684054B0);
    char v35 = 0;
    sub_22B567FE4(&qword_2684054C8);
    uint64_t v11 = v28;
    char v12 = v6;
    sub_22B5714D0();
    uint64_t v15 = v34;
    os_log_type_t v16 = v29;
    swift_beginAccess();
    *(void *)os_log_type_t v16 = v15;
    swift_bridgeObjectRelease();
    LOBYTE(v34) = 1;
    uint64_t v17 = sub_22B5714C0();
    uint64_t v19 = v18;
    swift_beginAccess();
    *uint64_t v7 = v17;
    v7[1] = v19;
    swift_bridgeObjectRelease();
    char v33 = 2;
    uint64_t v20 = sub_22B5714C0();
    uint64_t v21 = v36;
    uint64_t v22 = v20;
    uint64_t v24 = v23;
    swift_beginAccess();
    *uint64_t v21 = v22;
    v21[1] = v24;
    uint64_t v25 = v31;

    swift_bridgeObjectRelease();
    unsigned int v26 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
    v32.receiver = v25;
    v32.super_class = v26;
    id v9 = objc_msgSendSuper2(&v32, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  return v9;
}

uint64_t sub_22B567FE4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684054B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_22B568048@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for DiagnosticsReporterLaunchOptions());
  id result = DiagnosticsReporterLaunchOptions.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_22B56809C(void *a1)
{
  return sub_22B5678E8(a1);
}

uint64_t sub_22B5680C0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22B56811C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_2Tm(a1, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path, a2);
}

uint64_t sub_22B568128(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22B56756C(a1, a2, a3, a4, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t sub_22B568148@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_2Tm(a1, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string, a2);
}

uint64_t keypath_get_2Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22B5681A8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22B56756C(a1, a2, a3, a4, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t method lookup function for DiagnosticsReporterLaunchOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DiagnosticsReporterLaunchOptions);
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.files_to_attach.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.files_to_attach.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.files_to_attach.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.log_path.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.log_path.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.log_path.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.panic_string.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.panic_string.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.panic_string.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t getEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 2;
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
        JUMPOUT(0x22B568580);
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
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticsReporterLaunchOptions.CodingKeys()
{
  return &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys;
}

unint64_t sub_22B5685BC()
{
  unint64_t result = qword_2684054D0;
  if (!qword_2684054D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684054D0);
  }
  return result;
}

unint64_t sub_22B568614()
{
  unint64_t result = qword_2684054D8;
  if (!qword_2684054D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684054D8);
  }
  return result;
}

unint64_t sub_22B56866C()
{
  unint64_t result = qword_2684054E0;
  if (!qword_2684054E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684054E0);
  }
  return result;
}

uint64_t sub_22B5686C0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F745F73656C6966 && a2 == 0xEF6863617474615FLL;
  if (v3 || (sub_22B571510() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x687461705F676F6CLL && a2 == 0xE800000000000000 || (sub_22B571510() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74735F63696E6170 && a2 == 0xEC000000676E6972)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_22B571510();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_22B568834(uint64_t a1)
{
  return sub_22B5688CC(a1, qword_268405F90);
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

uint64_t sub_22B5688B0(uint64_t a1)
{
  return sub_22B5688CC(a1, qword_268405FA8);
}

uint64_t sub_22B5688CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22B571130();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22B571120();
}

uint64_t Array.appendIfNotNil(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = sub_22B5713B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v6);
  char v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v8, v3);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v3);
  sub_22B571340();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v3);
}

unint64_t sub_22B568B5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053F8);
  int v2 = (void *)sub_22B5714A0();
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
    unint64_t result = sub_22B56A020(v5, v6);
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

unint64_t sub_22B568C78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405528);
  uint64_t v2 = sub_22B5714A0();
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
    sub_22B56B668(v6, (uint64_t)&v15, &qword_268405530);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22B56A020(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_22B5626FC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_22B568DB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405540);
  uint64_t v2 = sub_22B5714A0();
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
    sub_22B56B668(v6, (uint64_t)&v13, &qword_268405548);
    uint64_t v7 = v13;
    unint64_t result = sub_22B56A098(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_22B5626FC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_22B568EE0(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v56 = a4;
  uint64_t v7 = sub_22B571140();
  uint64_t v54 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22B571170();
  uint64_t v55 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v53 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22B571150();
  uint64_t v50 = *(void *)(v12 - 8);
  uint64_t v51 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v49 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_22B571130();
  __swift_project_value_buffer(v14, (uint64_t)qword_268405FA8);
  id v15 = a2;
  uint64_t v16 = sub_22B571110();
  os_log_type_t v17 = sub_22B571370();
  BOOL v18 = os_log_type_enabled(v16, v17);
  id v57 = v15;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v46 = a3;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v48 = v7;
    uint64_t v45 = (void *)v21;
    *(_DWORD *)uint64_t v20 = 138412290;
    v59[0] = v57;
    id v22 = v57;
    uint64_t v47 = v9;
    uint64_t v23 = a1;
    id v24 = v22;
    id v15 = v57;
    sub_22B5713D0();
    uint64_t v25 = v45;
    *uint64_t v45 = v15;

    a1 = v23;
    char v9 = v47;
    _os_log_impl(&dword_22B55C000, v16, v17, "Launching app with options: %@", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268405510);
    swift_arrayDestroy();
    uint64_t v7 = v48;
    MEMORY[0x230F4B780](v25, -1, -1);
    unsigned int v26 = v20;
    a3 = v46;
    MEMORY[0x230F4B780](v26, -1, -1);
  }
  else
  {
  }
  sub_22B564178(a1, (char *)v15, (uint64_t)v67);
  sub_22B56B668((uint64_t)v67, (uint64_t)v66, &qword_2684053F0);
  sub_22B56B668((uint64_t)v66, (uint64_t)v65, &qword_2684053F0);
  uint64_t v27 = swift_allocObject();
  sub_22B5696A8((uint64_t)v66, v27 + 16);
  uint64_t v28 = v56;
  *(void *)(v27 + 56) = a3;
  *(void *)(v27 + 64) = v28;
  uint64_t v29 = v68;
  sub_22B56B668((uint64_t)v67, (uint64_t)v64, &qword_2684053F0);
  if (v29)
  {
    sub_22B56B668((uint64_t)v64, (uint64_t)v59, &qword_2684053F0);
    os_log_type_t v30 = v60;
    swift_retain();
    if (!v30)
    {
      uint64_t result = sub_22B56971C((uint64_t)v65);
      __break(1u);
      return result;
    }
    char v31 = sub_22B56650C(v59);
    sub_22B56971C((uint64_t)v64);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
    if (v31)
    {
      sub_22B56971C((uint64_t)v65);
      sub_22B56A4A8();
      char v33 = v49;
      uint64_t v32 = v50;
      uint64_t v34 = v51;
      (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, *MEMORY[0x263F8F080], v51);
      uint64_t v56 = sub_22B571390();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
      sub_22B56B668((uint64_t)v67, (uint64_t)v63, &qword_2684053F0);
      char v35 = (void *)swift_allocObject();
      v35[2] = v52;
      sub_22B5696A8((uint64_t)v63, (uint64_t)(v35 + 3));
      v35[8] = sub_22B569710;
      v35[9] = v27;
      id v36 = v57;
      v35[10] = a1;
      v35[11] = v36;
      uint64_t v61 = sub_22B56A4EC;
      v62 = v35;
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 1107296256;
      v59[2] = sub_22B56999C;
      v60 = &block_descriptor;
      os_log_type_t v37 = _Block_copy(v59);
      id v38 = v36;
      swift_retain();
      uint64_t v39 = v53;
      sub_22B571160();
      uint64_t v58 = MEMORY[0x263F8EE78];
      sub_22B56B6CC(&qword_2684054F8, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268405500);
      sub_22B56A508();
      sub_22B571400();
      long long v40 = (void *)v56;
      MEMORY[0x230F4AF70](0, v39, v9, v37);
      _Block_release(v37);
      swift_release();

      (*(void (**)(char *, uint64_t))(v54 + 8))(v9, v7);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v39, v10);
      sub_22B56971C((uint64_t)v67);
      return swift_release();
    }
  }
  else
  {
    swift_retain();
    sub_22B56971C((uint64_t)v64);
  }
  id v42 = sub_22B56A38C();
  if ((isInternal() & 1) == 0)
  {
    sub_22B56B668((uint64_t)v65, (uint64_t)v59, &qword_2684053F0);
    uint64_t v43 = v60;
    if (v60)
    {
      unint64_t v44 = v61;
      __swift_project_boxed_opaque_existential_1(v59, (uint64_t)v60);
      (*((void (**)(void *, uint64_t (*)()))v44 + 13))(v43, v44);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
    }
    else
    {
      sub_22B56971C((uint64_t)v59);
    }
  }
  a3(v42);
  swift_release();

  sub_22B56971C((uint64_t)v65);
  return sub_22B56971C((uint64_t)v67);
}

uint64_t sub_22B5695E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  if ((isInternal() & 1) == 0)
  {
    sub_22B56B668(a2, (uint64_t)v9, &qword_2684053F0);
    uint64_t v6 = v10;
    if (v10)
    {
      uint64_t v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(uint64_t, uint64_t))(v7 + 104))(v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    else
    {
      sub_22B56971C((uint64_t)v9);
    }
  }
  return a3(a1);
}

uint64_t sub_22B5696A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684053F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B569710(uint64_t a1)
{
  return sub_22B5695E8(a1, v1 + 16, *(uint64_t (**)(uint64_t))(v1 + 56));
}

uint64_t sub_22B56971C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684053F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_22B56977C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  sub_22B56B668(a2, (uint64_t)v19, &qword_2684053F0);
  if (!v20) {
    __break(1u);
  }
  uint64_t v11 = sub_22B56AE0C(v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  if (!v11)
  {
    uint64_t v12 = (__CFUserNotification *)sub_22B56A38C();
    uint64_t v11 = v12;
    goto LABEL_7;
  }
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
  if (responseFlags)
  {
    if (responseFlags != 1)
    {
      id v17 = sub_22B56A38C();
      a3();

      goto LABEL_15;
    }
    CFUserNotificationCancel(v11);
    uint64_t v12 = 0;
LABEL_7:
    ((void (*)(__CFUserNotification *))a3)(v12);
LABEL_15:

    return;
  }
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_22B571130();
  __swift_project_value_buffer(v13, (uint64_t)qword_268405FA8);
  uint64_t v14 = sub_22B571110();
  os_log_type_t v15 = sub_22B571350();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_22B55C000, v14, v15, "Chose default response. Showing app.", v16, 2u);
    MEMORY[0x230F4B780](v16, -1, -1);
  }

  sub_22B56B668(a2, (uint64_t)v19, &qword_2684053F0);
  if (v20)
  {
    sub_22B56B160((uint64_t)v19, a5, a6, (uint64_t)a3, a4);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22B56999C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_22B569A78(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268405520);
    uint64_t v2 = sub_22B5714A0();
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
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_22B56177C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_22B5626FC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_22B5626FC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_22B5626FC(v36, v37);
    sub_22B5626FC(v37, &v33);
    uint64_t result = sub_22B571410();
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
    uint64_t result = (uint64_t)sub_22B5626FC(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_22B56B660();
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

id DiagnosticsReporter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DiagnosticsReporter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporter();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiagnosticsReporter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22B569F20(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22B569F30(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_22B569F6C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_22B569F7C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_22B5714B0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unint64_t sub_22B56A020(uint64_t a1, uint64_t a2)
{
  sub_22B571580();
  sub_22B571250();
  uint64_t v4 = sub_22B5715A0();

  return sub_22B56A14C(a1, a2, v4);
}

unint64_t sub_22B56A098(uint64_t a1)
{
  sub_22B571580();
  type metadata accessor for CFString();
  sub_22B56B6CC(&qword_268405550, (void (*)(uint64_t))type metadata accessor for CFString);
  sub_22B5710F0();
  uint64_t v2 = sub_22B5715A0();

  return sub_22B56A230(a1, v2);
}

unint64_t sub_22B56A14C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22B571510() & 1) == 0)
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
      while (!v14 && (sub_22B571510() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22B56A230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString();
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_22B56B6CC(&qword_268405550, (void (*)(uint64_t))type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_22B5710E0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_22B5710E0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_22B56A38C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405478);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B571DA0;
  *(void *)(inited + 32) = sub_22B571200();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000017;
  *(void *)(inited + 56) = 0x800000022B572B80;
  sub_22B568C78(inited);
  id v2 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v3 = (void *)sub_22B5711E0();
  uint64_t v4 = (void *)sub_22B571180();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, 1, v4);

  return v5;
}

unint64_t sub_22B56A4A8()
{
  unint64_t result = qword_2684054F0;
  if (!qword_2684054F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684054F0);
  }
  return result;
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

unint64_t sub_22B56A508()
{
  unint64_t result = qword_268405508;
  if (!qword_268405508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268405500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405508);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticsReporter()
{
  return self;
}

uint64_t method lookup function for DiagnosticsReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DiagnosticsReporter);
}

uint64_t dispatch thunk of static DiagnosticsReporter.launchApp(with:options:completion:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_22B56A5B4(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v51 = a3;
  uint64_t v7 = sub_22B571140();
  uint64_t v55 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v54 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22B571170();
  uint64_t v53 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v52 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B571150();
  uint64_t v49 = *(void *)(v11 - 8);
  uint64_t v50 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v48 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a4;
  _Block_copy(a4);
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_22B571130();
  __swift_project_value_buffer(v14, (uint64_t)qword_268405FA8);
  id v15 = a2;
  int64_t v16 = sub_22B571110();
  os_log_type_t v17 = sub_22B571370();
  BOOL v18 = os_log_type_enabled(v16, v17);
  id v56 = v15;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v46 = v9;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v47 = v13;
    unint64_t v44 = (void *)v21;
    *(_DWORD *)uint64_t v20 = 138412290;
    v58[0] = v56;
    id v22 = v56;
    uint64_t v45 = a4;
    id v23 = v22;
    id v15 = v56;
    sub_22B5713D0();
    unint64_t v24 = v44;
    *unint64_t v44 = v15;

    a4 = v45;
    _os_log_impl(&dword_22B55C000, v16, v17, "Launching app with options: %@", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268405510);
    swift_arrayDestroy();
    uint64_t v13 = v47;
    MEMORY[0x230F4B780](v24, -1, -1);
    BOOL v25 = v20;
    uint64_t v9 = v46;
    MEMORY[0x230F4B780](v25, -1, -1);
  }
  else
  {
  }
  sub_22B564178(a1, (char *)v15, (uint64_t)v66);
  sub_22B56B668((uint64_t)v66, (uint64_t)v65, &qword_2684053F0);
  sub_22B56B668((uint64_t)v65, (uint64_t)v64, &qword_2684053F0);
  uint64_t v26 = swift_allocObject();
  sub_22B5696A8((uint64_t)v65, v26 + 16);
  *(void *)(v26 + 56) = sub_22B56AD44;
  *(void *)(v26 + 64) = v13;
  uint64_t v27 = v67;
  sub_22B56B668((uint64_t)v66, (uint64_t)v63, &qword_2684053F0);
  if (!v27)
  {
    swift_retain();
    sub_22B56971C((uint64_t)v63);
    goto LABEL_11;
  }
  sub_22B56B668((uint64_t)v63, (uint64_t)v58, &qword_2684053F0);
  uint64_t v28 = v59;
  swift_retain();
  if (v28)
  {
    char v29 = sub_22B56650C(v58);
    sub_22B56971C((uint64_t)v63);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    if (v29)
    {
      sub_22B56971C((uint64_t)v64);
      sub_22B56A4A8();
      long long v30 = v48;
      uint64_t v31 = v49;
      uint64_t v32 = v50;
      (*(void (**)(char *, void, uint64_t))(v49 + 104))(v48, *MEMORY[0x263F8F080], v50);
      uint64_t v47 = sub_22B571390();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v32);
      sub_22B56B668((uint64_t)v66, (uint64_t)v62, &qword_2684053F0);
      long long v33 = (void *)swift_allocObject();
      v33[2] = v51;
      sub_22B5696A8((uint64_t)v62, (uint64_t)(v33 + 3));
      v33[8] = sub_22B56B714;
      v33[9] = v26;
      v33[10] = a1;
      id v34 = v56;
      v33[11] = v56;
      v60 = sub_22B56A4EC;
      uint64_t v61 = v33;
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 1107296256;
      v58[2] = sub_22B56999C;
      v59 = &block_descriptor_21;
      uint64_t v35 = _Block_copy(v58);
      id v36 = v34;
      swift_retain();
      os_log_type_t v37 = v52;
      sub_22B571160();
      uint64_t v57 = MEMORY[0x263F8EE78];
      sub_22B56B6CC(&qword_2684054F8, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268405500);
      sub_22B56A508();
      id v38 = v54;
      sub_22B571400();
      long long v39 = (void *)v47;
      MEMORY[0x230F4AF70](0, v37, v38, v35);
      _Block_release(v35);
      swift_release();

      (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v7);
      (*(void (**)(char *, uint64_t))(v53 + 8))(v37, v9);
      sub_22B56971C((uint64_t)v66);
      swift_release();
      return swift_release();
    }
LABEL_11:
    id v40 = sub_22B56A38C();
    if ((isInternal() & 1) == 0)
    {
      sub_22B56B668((uint64_t)v64, (uint64_t)v58, &qword_2684053F0);
      uint64_t v41 = v59;
      if (v59)
      {
        id v42 = v60;
        __swift_project_boxed_opaque_existential_1(v58, (uint64_t)v59);
        (*((void (**)(void *, uint64_t (*)()))v42 + 13))(v41, v42);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
      }
      else
      {
        sub_22B56971C((uint64_t)v58);
      }
    }
    ((void (**)(void, id))a4)[2](a4, v40);
    swift_release();

    sub_22B56971C((uint64_t)v64);
    sub_22B56971C((uint64_t)v66);
    return swift_release();
  }
  _Block_release(a4);
  uint64_t result = sub_22B56971C((uint64_t)v64);
  __break(1u);
  return result;
}

uint64_t sub_22B56AD0C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22B56AD44()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t objectdestroyTm()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t objectdestroy_2Tm()
{
  if (*(void *)(v0 + 48)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_22B56ADF8()
{
  sub_22B56977C(*(void *)(v0 + 16), v0 + 24, *(void (**)(void))(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

CFUserNotificationRef sub_22B56AE0C(void *a1)
{
  v28[8] = *MEMORY[0x263EF8340];
  sub_22B563800(a1, v28);
  uint64_t v2 = v28[0];
  uint64_t v1 = v28[1];
  uint64_t v4 = v28[2];
  uint64_t v3 = v28[3];
  uint64_t v6 = v28[4];
  uint64_t v5 = v28[5];
  uint64_t v7 = v28[6];
  uint64_t v8 = v28[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405538);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B572300;
  uint64_t v10 = (void *)*MEMORY[0x263EFFFC8];
  if (!*MEMORY[0x263EFFFC8])
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v11 = (void *)inited;
  *(void *)(inited + 32) = v10;
  id v12 = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = MEMORY[0x263F8D310];
  unsigned char v11[8] = MEMORY[0x263F8D310];
  v11[5] = v2;
  v11[6] = v1;
  uint64_t v14 = (void *)*MEMORY[0x263EFFFD8];
  if (!*MEMORY[0x263EFFFD8])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v11[9] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11[13] = v13;
  v11[10] = v4;
  v11[11] = v3;
  int64_t v16 = (void *)*MEMORY[0x263F00000];
  if (!*MEMORY[0x263F00000])
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  v11[14] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11[18] = v13;
  v11[15] = v6;
  v11[16] = v5;
  BOOL v18 = (void *)*MEMORY[0x263EFFFE8];
  if (!*MEMORY[0x263EFFFE8]) {
    goto LABEL_15;
  }
  v11[19] = v18;
  id v19 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11[23] = v13;
  v11[20] = v7;
  v11[21] = v8;
  sub_22B568DB0((uint64_t)v11);
  SInt32 error = 0;
  type metadata accessor for CFString();
  sub_22B56B6CC(&qword_2684053B0, (void (*)(uint64_t))type metadata accessor for CFString);
  CFDictionaryRef v20 = (const __CFDictionary *)sub_22B571180();
  swift_bridgeObjectRelease();
  CFUserNotificationRef v21 = CFUserNotificationCreate(0, 0.0, 2uLL, &error, v20);

  if (!v21)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_22B571130();
    __swift_project_value_buffer(v22, (uint64_t)qword_268405FA8);
    id v23 = sub_22B571110();
    os_log_type_t v24 = sub_22B571360();
    if (os_log_type_enabled(v23, v24))
    {
      BOOL v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v25 = 67109120;
      swift_beginAccess();
      sub_22B5713D0();
      _os_log_impl(&dword_22B55C000, v23, v24, "Failed to show CFUserNotification. Error: %d", v25, 8u);
      MEMORY[0x230F4B780](v25, -1, -1);
    }

    return 0;
  }
  return v21;
}

void sub_22B56B160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_22B570E40();
  swift_allocObject();
  sub_22B570E30();
  uint64_t v31 = a3;
  type metadata accessor for DiagnosticsReporterLaunchOptions();
  sub_22B56B6CC(&qword_268405518, (void (*)(uint64_t))type metadata accessor for DiagnosticsReporterLaunchOptions);
  uint64_t v9 = sub_22B570E20();
  unint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405478);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B572310;
  uint64_t v13 = MEMORY[0x263F06F78];
  *(void *)(inited + 32) = 0x736E6F6974706FLL;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v11;
  *(void *)(inited + 72) = v13;
  *(void *)(inited + 80) = 1701869940;
  *(void *)(inited + 120) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = a2;
  sub_22B5630A0(v9, v11);
  unint64_t v14 = sub_22B568C78(inited);
  id v15 = objc_allocWithZone(MEMORY[0x263F79410]);
  int64_t v16 = (void *)sub_22B5711E0();
  uint64_t v29 = a4;
  id v17 = (void *)sub_22B5711E0();
  id v18 = objc_msgSend(v15, sel_initWithServiceName_viewControllerClassName_, v16, v17);

  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F79408]), sel_init);
  sub_22B569A78(v14);
  swift_bridgeObjectRelease();
  CFDictionaryRef v20 = (void *)sub_22B571180();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setUserInfo_, v20);

  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F793F8]), sel_init);
  id v22 = objc_msgSend(self, sel_newHandleWithDefinition_configurationContext_, v18, v19);
  id v23 = (objc_class *)type metadata accessor for RemoteAlertDeactivationHandler();
  os_log_type_t v24 = (char *)objc_allocWithZone(v23);
  BOOL v25 = &v24[OBJC_IVAR____TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler_completion];
  *(void *)BOOL v25 = v29;
  *((void *)v25 + 1) = a5;
  v30.receiver = v24;
  v30.super_class = v23;
  swift_retain();
  id v26 = objc_msgSendSuper2(&v30, sel_init);
  uint64_t v27 = (void *)qword_2684054E8;
  qword_2684054E8 = (uint64_t)v26;

  if (qword_2684054E8)
  {
    objc_msgSend(v22, sel_registerObserver_);
    id v28 = v21;
    objc_msgSend(v22, sel_activateWithContext_, v28);
    sub_22B5630F8(v9, v11);
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22B56B660()
{
  return swift_release();
}

uint64_t sub_22B56B668(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22B56B6CC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_22B56B720()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_22B5711E0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    qword_268405FC0 = (uint64_t)v2;
  }
  else
  {
    sub_22B571470();
    __break(1u);
  }
}

id sub_22B56B7F4(uint64_t a1)
{
  return sub_22B56B854(a1, sub_22B56F510);
}

id sub_22B56B854(uint64_t a1, uint64_t (*a2)(void *))
{
  v24[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_22B5711B0();
  if (!v2)
  {
    uint64_t v7 = v5;
    unint64_t v8 = v6;
    v24[0] = 10;
    v24[1] = 0xE100000000000000;
    MEMORY[0x270FA5388](v5);
    v22[2] = v24;
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)sub_22B56D9A8(0x7FFFFFFFFFFFFFFFLL, 1, a2, (uint64_t)v22, v7, v8);
    swift_bridgeObjectRelease();
    if (!v9[2]) {
      __break(1u);
    }
    unint64_t v10 = v9[4];
    unint64_t v11 = v9[5];
    unint64_t v12 = v9[6];
    unint64_t v13 = v9[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_22B56CA80(v10, v11, v12, v13);
    unint64_t v16 = v15;
    id v17 = self;
    id v18 = (void *)sub_22B571050();
    v23[0] = 0;
    id v3 = objc_msgSend(v17, sel_JSONObjectWithData_options_error_, v18, 0, v23);

    id v19 = v23[0];
    if (v3)
    {
      sub_22B5713F0();
      swift_unknownObjectRelease();
      sub_22B56177C((uint64_t)v24, (uint64_t)v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268405558);
      if (swift_dynamicCast()) {
        id v3 = (id)v22[4];
      }
      else {
        id v3 = (id)sub_22B568C78(MEMORY[0x263F8EE78]);
      }
      sub_22B5630F8(v14, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    }
    else
    {
      CFDictionaryRef v20 = v19;
      sub_22B570F30();

      swift_willThrow();
      sub_22B5630F8(v14, v16);
    }
  }
  return v3;
}

void sub_22B56BA8C(char a1@<W0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v94 = a3;
  uint64_t v5 = sub_22B571130();
  uint64_t v89 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  v105 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v96 = (char *)&v84 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405468);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v100 = (uint64_t)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B570FF0();
  uint64_t v102 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v98 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v104 = (char *)&v84 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v86 = (char *)&v84 - v17;
  MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v84 - v18;
  CFDictionaryRef v20 = (int *)type metadata accessor for PanicLog();
  uint64_t v93 = *((void *)v20 - 1);
  id v21 = (int *)MEMORY[0x270FA5388](v20);
  id v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v22) = a1 & 1;
  os_log_type_t v24 = &v23[v21[6]];
  *os_log_type_t v24 = 0x63696E6150;
  v24[1] = 0xE500000000000000;
  v90 = v24;
  uint64_t v25 = (uint64_t)&v23[v21[9]];
  *(void *)(v25 + 24) = &type metadata for CriticalPolicy;
  *(void *)(v25 + 32) = &off_26DEBE770;
  id v26 = &v23[v21[10]];
  *id v26 = 0;
  v26[1] = 0;
  *id v23 = v22;
  uint64_t v27 = MEMORY[0x263F8EE78];
  unint64_t v28 = sub_22B568C78(MEMORY[0x263F8EE78]);
  uint64_t v29 = v20[8];
  *(void *)&v23[v29] = v28;
  uint64_t v101 = v20[7];
  *(void *)&v23[v101] = v27;
  v95 = a2;
  objc_super v30 = (uint64_t *)&a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess();
  uint64_t v31 = v30;
  uint64_t v32 = v30[1];
  v91 = v26;
  if (!v32)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_268405FA8);
    long long v39 = sub_22B571110();
    os_log_type_t v40 = sub_22B571360();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v42 = v93;
    uint64_t v37 = v94;
    if (v41)
    {
      uint64_t v43 = v20;
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v44 = 0;
      _os_log_impl(&dword_22B55C000, v39, v40, "Invalid log path", v44, 2u);
      uint64_t v45 = v44;
      CFDictionaryRef v20 = v43;
      MEMORY[0x230F4B780](v45, -1, -1);
    }

    goto LABEL_42;
  }
  uint64_t v88 = v5;
  uint64_t v87 = v29;
  uint64_t v85 = v25;
  v99 = v31;
  swift_bridgeObjectRetain();
  v92 = v19;
  sub_22B570F50();
  swift_bridgeObjectRelease();
  id v103 = self;
  id v33 = objc_msgSend(v103, sel_defaultManager);
  if (!v99[1])
  {
    __break(1u);

    __break(1u);
    goto LABEL_44;
  }
  id v34 = v33;
  swift_bridgeObjectRetain();
  uint64_t v35 = (void *)sub_22B5711E0();
  swift_bridgeObjectRelease();
  unsigned int v36 = objc_msgSend(v34, sel_fileExistsAtPath_, v35);

  uint64_t v37 = v94;
  if (!v36)
  {
    uint64_t v46 = v100;
    sub_22B564A0C(v100);
    uint64_t v47 = v102;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v46, 1, v11) != 1)
    {
      v62 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 32);
      v63 = v86;
      v62(v86, v46, v11);
      v62(&v23[v20[5]], (uint64_t)v63, v11);
      uint64_t v38 = v47;
      goto LABEL_17;
    }
    sub_22B566F14(v46, &qword_268405468);
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v48 = v88;
    uint64_t v49 = __swift_project_value_buffer(v88, (uint64_t)qword_268405FA8);
    uint64_t v50 = v89;
    uint64_t v51 = v96;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v96, v49, v48);
    uint64_t v52 = v95;
    uint64_t v53 = sub_22B571110();
    os_log_type_t v54 = sub_22B571360();
    if (!os_log_type_enabled(v53, v54))
    {

      (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v48);
      (*(void (**)(char *, uint64_t))(v102 + 8))(v92, v11);
      uint64_t v42 = v93;
      goto LABEL_41;
    }
    v105 = v52;
    id v103 = v23;
    uint64_t v55 = v20;
    id v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v106[0] = v57;
    *(_DWORD *)id v56 = 136446210;
    unint64_t v58 = v99[1];
    if (v58)
    {
      uint64_t v59 = v57;
      uint64_t v60 = *v99;
      swift_bridgeObjectRetain();
      v106[3] = sub_22B570404(v60, v58, v106);
      sub_22B5713D0();
      uint64_t v61 = v105;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22B55C000, v53, v54, "Failed reading from URL: %{public}s and retired path.", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F4B780](v59, -1, -1);
      MEMORY[0x230F4B780](v56, -1, -1);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v96, v88);
      (*(void (**)(char *, uint64_t))(v102 + 8))(v92, v11);
      CFDictionaryRef v20 = v55;
      uint64_t v42 = v93;
LABEL_41:
      uint64_t v25 = v85;
LABEL_42:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v25);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v42 + 56))(v37, 1, 1, v20);
      return;
    }
LABEL_44:

    __break(1u);
    return;
  }
  uint64_t v38 = v102;
  (*(void (**)(unsigned char *, char *, uint64_t))(v102 + 16))(&v23[v20[5]], v92, v11);
LABEL_17:
  uint64_t v64 = &v95[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  swift_beginAccess();
  uint64_t v65 = *(void *)(*(void *)v64 + 16);
  v97 = v20;
  if (!v65) {
    goto LABEL_39;
  }
  v96 = (char *)(v38 + 16);
  uint64_t v100 = v38 + 32;
  v86 = (char *)swift_bridgeObjectRetain();
  uint64_t v66 = (uint64_t *)(v86 + 40);
  unint64_t v67 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v68 = v11;
    v69 = v23;
    uint64_t v71 = *(v66 - 1);
    uint64_t v70 = *v66;
    swift_bridgeObjectRetain();
    id v72 = objc_msgSend(v103, sel_defaultManager);
    v73 = (void *)sub_22B5711E0();
    unsigned __int8 v74 = objc_msgSend(v72, sel_fileExistsAtPath_, v73);

    if (v74)
    {
      sub_22B570F50();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v67 = sub_22B56E0DC(0, *(void *)(v67 + 16) + 1, 1, v67, &qword_268405400, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
      }
      id v23 = v69;
      unint64_t v76 = *(void *)(v67 + 16);
      unint64_t v75 = *(void *)(v67 + 24);
      uint64_t v11 = v68;
      if (v76 >= v75 >> 1) {
        unint64_t v67 = sub_22B56E0DC(v75 > 1, v76 + 1, 1, v67, &qword_268405400, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
      }
      *(void *)(v67 + 16) = v76 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v102 + 32))(v67+ ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80))+ *(void *)(v102 + 72) * v76, v104, v68);
      goto LABEL_20;
    }
    uint64_t v77 = v99[1];
    if (v77)
    {
      id v23 = v69;
      if (v71 == *v99 && v77 == v70)
      {
        swift_bridgeObjectRelease();
        uint64_t v11 = v68;
LABEL_33:
        (*(void (**)(char *, unsigned char *, uint64_t))v96)(v98, &v23[v97[5]], v11);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v67 = sub_22B56E0DC(0, *(void *)(v67 + 16) + 1, 1, v67, &qword_268405400, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
        }
        unint64_t v80 = *(void *)(v67 + 16);
        unint64_t v79 = *(void *)(v67 + 24);
        if (v80 >= v79 >> 1) {
          unint64_t v67 = sub_22B56E0DC(v79 > 1, v80 + 1, 1, v67, &qword_268405400, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
        }
        *(void *)(v67 + 16) = v80 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v102 + 32))(v67+ ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80))+ *(void *)(v102 + 72) * v80, v98, v11);
LABEL_20:
        *(void *)&v23[v101] = v67;
        goto LABEL_21;
      }
      char v78 = sub_22B571510();
      swift_bridgeObjectRelease();
      uint64_t v11 = v68;
      if (v78) {
        goto LABEL_33;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      id v23 = v69;
      uint64_t v11 = v68;
    }
LABEL_21:
    v66 += 2;
    --v65;
  }
  while (v65);
  swift_bridgeObjectRelease();
  CFDictionaryRef v20 = v97;
  uint64_t v38 = v102;
LABEL_39:
  id v81 = sub_22B56B854((uint64_t)&v23[v20[5]], sub_22B56F510);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v92, v11);
  uint64_t v82 = v87;
  swift_bridgeObjectRelease();
  *(void *)&v23[v82] = v81;
  uint64_t v83 = v94;
  sub_22B56E35C((uint64_t)v23, v94);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v93 + 56))(v83, 0, 1, v20);
  sub_22B56E3C0((uint64_t)v23);
}

uint64_t sub_22B56CA80(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  *(void *)&long long v37 = a1;
  *((void *)&v37 + 1) = a2;
  unint64_t v38 = a3;
  unint64_t v39 = a4;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268405560);
  if (swift_dynamicCast())
  {
    sub_22B560BCC(v35, (uint64_t)&v30);
    __swift_project_boxed_opaque_existential_1(&v30, v32);
    sub_22B570F00();
    swift_bridgeObjectRelease();
    v35[0] = v37;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
    return *(void *)&v35[0];
  }
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  sub_22B566F14((uint64_t)v35, &qword_268405568);
  sub_22B56ECF4(a1, a2, a3, a4, &v30);
  unint64_t v4 = *((void *)&v30 + 1);
  uint64_t v5 = v30;
  if (*((void *)&v30 + 1) >> 60 != 15)
  {
    swift_bridgeObjectRelease();
    v35[0] = __PAIR128__(v4, v5);
    return *(void *)&v35[0];
  }
  unint64_t v6 = sub_22B56E41C(a1, a2, a3, a4);
  *(void *)&v35[0] = sub_22B56F214(v6);
  *((void *)&v35[0] + 1) = v7;
  MEMORY[0x270FA5388](*(void *)&v35[0]);
  sub_22B56E7FC((void *(*)(long long *__return_ptr, char *, char *))sub_22B56F52C, (uint64_t)&v30);
  unint64_t v8 = *((void *)&v30 + 1);
  uint64_t v10 = v31;
  uint64_t v9 = v32;
  unint64_t v11 = v33;
  uint64_t v12 = *((void *)&v35[0] + 1) >> 62;
  switch(*((void *)&v35[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v13) = DWORD1(v35[0]) - LODWORD(v35[0]);
      if (__OFSUB__(DWORD1(v35[0]), v35[0])) {
        goto LABEL_44;
      }
      uint64_t v13 = (int)v13;
LABEL_10:
      if (v34 == v13)
      {
LABEL_16:
        uint64_t v18 = *((void *)&v30 + 1) >> 14;
        *(void *)((char *)&v30 + 7) = 0;
        *(void *)&long long v30 = 0;
        if (v8 >> 14 == v33 >> 14) {
          goto LABEL_37;
        }
        unint64_t v24 = v4;
        LOBYTE(v4) = 0;
        uint64_t v19 = (v31 >> 59) & 1;
        if ((v32 & 0x1000000000000000) == 0) {
          LOBYTE(v19) = 1;
        }
        uint64_t v20 = 4 << v19;
        unint64_t v21 = HIBYTE(v32) & 0xF;
        if ((v32 & 0x2000000000000000) == 0) {
          unint64_t v21 = v31 & 0xFFFFFFFFFFFFLL;
        }
        unint64_t v25 = v21;
        while (1)
        {
          char v22 = sub_22B5713C0();
          if ((v11 & 0xC) == v20)
          {
            unint64_t v11 = sub_22B57090C(v11, v10, v9);
            if ((v9 & 0x1000000000000000) != 0)
            {
LABEL_27:
              if (v25 <= v11 >> 16) {
                goto LABEL_42;
              }
              unint64_t v11 = sub_22B571290();
              goto LABEL_29;
            }
          }
          else if ((v9 & 0x1000000000000000) != 0)
          {
            goto LABEL_27;
          }
          unint64_t v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_29:
          *((unsigned char *)&v30 + v4) = v22;
          LOWORD(v4) = v4 + 1;
          if ((v4 & 0x100) != 0)
          {
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
          }
          if (v4 == 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            sub_22B571040();
            LOBYTE(v4) = 0;
            if (v18 == v11 >> 14)
            {
              swift_bridgeObjectRelease();
              sub_22B56F548(v5, v24);
              goto LABEL_38;
            }
          }
          else if (v18 == v11 >> 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            sub_22B571040();
            sub_22B56F548(v5, v24);
            goto LABEL_37;
          }
        }
      }
      if (v12)
      {
        if (v12 == 1) {
          uint64_t v17 = *(uint64_t *)&v35[0] >> 32;
        }
        else {
          uint64_t v17 = *(void *)(*(void *)&v35[0] + 24);
        }
      }
      else
      {
        uint64_t v17 = BYTE14(v35[0]);
      }
LABEL_35:
      if (v17 < v34) {
        goto LABEL_43;
      }
      sub_22B571030();
LABEL_37:
      swift_bridgeObjectRelease();
LABEL_38:
      swift_bridgeObjectRelease();
      return *(void *)&v35[0];
    case 2:
      uint64_t v15 = *(void *)(*(void *)&v35[0] + 16);
      uint64_t v14 = *(void *)(*(void *)&v35[0] + 24);
      BOOL v16 = __OFSUB__(v14, v15);
      uint64_t v13 = v14 - v15;
      if (!v16) {
        goto LABEL_10;
      }
      goto LABEL_45;
    case 3:
      if (!v34) {
        goto LABEL_16;
      }
      uint64_t v17 = 0;
      goto LABEL_35;
    default:
      uint64_t v13 = BYTE14(v35[0]);
      goto LABEL_10;
  }
}

uint64_t type metadata accessor for PanicLog()
{
  uint64_t result = qword_268405578;
  if (!qword_268405578) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL sub_22B56CF48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_22B56CF60()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22B572310;
  *(void *)(inited + 32) = 0x746E656469636E69;
  *(void *)(inited + 40) = 0xEB0000000064695FLL;
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for PanicLog() + 32));
  if (*(void *)(v2 + 16)
    && (unint64_t v3 = sub_22B56A020(0x746E656469636E69, 0xEB0000000064695FLL), (v4 & 1) != 0)
    && (sub_22B56177C(*(void *)(v2 + 56) + 32 * v3, (uint64_t)v8), sub_22B562710(), swift_dynamicCast()))
  {
    uint64_t v5 = v7;
  }
  else
  {
    sub_22B562710();
    uint64_t v5 = sub_22B5713A0();
  }
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = 1701869940;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(void *)(inited + 72) = sub_22B5711E0();
  return sub_22B568B5C(inited);
}

uint64_t sub_22B56D0A8()
{
  if (*v0) {
    return 0x79616C70736944;
  }
  else {
    return 1953722184;
  }
}

uint64_t sub_22B56D0DC()
{
  uint64_t v1 = sub_22B570FF0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268405468);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(int *)(type metadata accessor for PanicLog() + 28);
  uint64_t v22 = v0;
  uint64_t v9 = *(void *)(v0 + v8);
  uint64_t v10 = *(void *)(v9 + 16);
  v17[1] = v9;
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v11 = v2 + 16;
    uint64_t v13 = v9 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v19 = *(void *)(v11 + 56);
    uint64_t v20 = v12;
    uint64_t v14 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 40);
    uint64_t v21 = v11;
    uint64_t v18 = (void (**)(char *, uint64_t))(v11 - 8);
    swift_bridgeObjectRetain_n();
    v17[0] = (v11 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      v20(v7, v13, v1);
      uint64_t v15 = *v14;
      (*v14)(v7, 0, 1, v1);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32))(v7, 1, v1) == 1) {
        break;
      }
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v4, v7, v1);
      sub_22B56D364(v4, v22);
      (*v18)(v4, v1);
      v13 += v19;
      if (!--v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    swift_bridgeObjectRetain_n();
LABEL_7:
    v15(v7, 1, 1, v1);
  }
  return swift_bridgeObjectRelease_n();
}

void sub_22B56D364(void *a1, uint64_t a2)
{
  v51[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_22B570FF0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v42 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v42 - v13;
  uint64_t v15 = a2 + *(int *)(type metadata accessor for PanicLog() + 20);
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v47(v14, v15, v5);
  sub_22B56F894(&qword_268405588);
  uint64_t v49 = a1;
  LOBYTE(a2) = sub_22B5711A0();
  uint64_t v48 = *(void (**)(char *, uint64_t))(v6 + 8);
  v48(v14, v5);
  if ((a2 & 1) == 0)
  {
    if (qword_268405398 != -1) {
      swift_once();
    }
    uint64_t v46 = v2;
    uint64_t v16 = sub_22B571130();
    uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_268405FA8);
    v47(v12, (uint64_t)v49, v5);
    uint64_t v45 = v17;
    uint64_t v18 = sub_22B571110();
    os_log_type_t v19 = sub_22B571350();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      v51[0] = v43;
      unint64_t v44 = v9;
      *(_DWORD *)uint64_t v20 = 136315138;
      v42[1] = v20 + 4;
      sub_22B56F894((unint64_t *)&qword_268405470);
      uint64_t v21 = sub_22B571500();
      uint64_t v50 = sub_22B570404(v21, v22, (uint64_t *)v51);
      uint64_t v9 = v44;
      sub_22B5713D0();
      swift_bridgeObjectRelease();
      v48(v12, v5);
      _os_log_impl(&dword_22B55C000, v18, v19, "Removing file at %s", v20, 0xCu);
      id v23 = v43;
      swift_arrayDestroy();
      MEMORY[0x230F4B780](v23, -1, -1);
      MEMORY[0x230F4B780](v20, -1, -1);
    }
    else
    {
      v48(v12, v5);
    }

    id v24 = objc_msgSend(self, sel_defaultManager);
    uint64_t v25 = (uint64_t)v49;
    id v26 = (void *)sub_22B570F70();
    v51[0] = 0;
    unsigned int v27 = objc_msgSend(v24, sel_removeItemAtURL_error_, v26, v51);

    if (v27)
    {
      id v28 = v51[0];
    }
    else
    {
      id v29 = v51[0];
      long long v30 = (void *)sub_22B570F30();

      swift_willThrow();
      v47(v9, v25, v5);
      id v31 = v30;
      id v32 = v30;
      unint64_t v33 = sub_22B571110();
      os_log_type_t v34 = sub_22B571360();
      int v35 = v34;
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v36 = swift_slowAlloc();
        uint64_t v49 = (void *)swift_slowAlloc();
        v51[0] = v49;
        *(_DWORD *)uint64_t v36 = 136446466;
        LODWORD(v47) = v35;
        uint64_t v37 = sub_22B570F40();
        uint64_t v50 = sub_22B570404(v37, v38, (uint64_t *)v51);
        uint64_t v46 = 0;
        sub_22B5713D0();
        swift_bridgeObjectRelease();
        v48(v9, v5);
        *(_WORD *)(v36 + 12) = 2082;
        swift_getErrorValue();
        uint64_t v39 = sub_22B571530();
        uint64_t v50 = sub_22B570404(v39, v40, (uint64_t *)v51);
        sub_22B5713D0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_22B55C000, v33, (os_log_type_t)v47, "Failed to remove panic file url: %{public}s. Error: %{public}s", (uint8_t *)v36, 0x16u);
        BOOL v41 = v49;
        swift_arrayDestroy();
        MEMORY[0x230F4B780](v41, -1, -1);
        MEMORY[0x230F4B780](v36, -1, -1);
      }
      else
      {

        v48(v9, v5);
      }
    }
  }
}

BOOL sub_22B56D994()
{
  return (*v0 & 1) == 0;
}

uint64_t sub_22B56D9A8(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_22B56DE4C(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_22B5712F0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_22B571260();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_22B571260();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_22B571310();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_22B56DFCC(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_22B56DFCC((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  id v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_22B571260();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_22B571310();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_22B56DFCC(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_22B56DFCC((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    unint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_22B571460();
  __break(1u);
LABEL_42:
  uint64_t result = sub_22B571460();
  __break(1u);
  return result;
}

uint64_t sub_22B56DE4C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_22B571310();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_22B56DFCC(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_22B56DFCC((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_22B571460();
  __break(1u);
  return result;
}

uint64_t sub_22B56DFA8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22B56E0DC(a1, a2, a3, a4, &qword_268405430, MEMORY[0x263F07490], MEMORY[0x263F07490]);
}

void *sub_22B56DFCC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268405570);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22B56F05C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22B56E0DC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
        goto LABEL_29;
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
    char v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  char v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_22B571460();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_22B56F3B4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_22B56E35C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PanicLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B56E3C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PanicLog();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22B56E41C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_22B57090C(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_22B57090C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return sub_22B5712B0();
}

unint64_t sub_22B56E51C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    v9[2] = a6;
    void v9[3] = a7;
    v9[4] = v12;
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
      uint64_t result = sub_22B57090C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_22B5712C0();
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
          uint64_t result = sub_22B571450();
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
    uint64_t result = sub_22B57090C(v12, a6, a7);
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
    unint64_t v12 = sub_22B571290();
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

uint64_t sub_22B56E730@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (!__src) {
    goto LABEL_7;
  }
  if (!a2)
  {
    __src = 0;
LABEL_7:
    unint64_t v6 = 0xC000000000000000;
    goto LABEL_10;
  }
  if (a2 <= 14)
  {
    __src = sub_22B56F150((unsigned char *)__src, (unsigned char *)(__src + a2));
    unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    sub_22B570EC0();
    swift_allocObject();
    uint64_t v5 = sub_22B570E60();
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      sub_22B571020();
      __src = swift_allocObject();
      *(void *)(__src + 16) = 0;
      *(void *)(__src + 24) = a2;
      unint64_t v6 = v5 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      unint64_t v6 = v5 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v6;
  return __src;
}

char *sub_22B56E7FC@<X0>(void *(*a1)(long long *__return_ptr, char *, char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = *v2;
  unint64_t v5 = v2[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      uint64_t v20 = a2;
      uint64_t v10 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v2 = xmmword_22B572370;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = v6 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_15;
      }
      if (v12 < (int)v6) {
        goto LABEL_20;
      }
      if (sub_22B570E70() && __OFSUB__((int)v6, sub_22B570EA0())) {
        goto LABEL_21;
      }
      sub_22B570EC0();
      swift_allocObject();
      uint64_t v19 = sub_22B570E50();
      swift_release();
      uint64_t v10 = v19;
      uint64_t v12 = v6 >> 32;
LABEL_15:
      if (v12 < (int)v6)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
      uint64_t result = sub_22B56EC28((int)v6, v12, a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      *uint64_t v2 = v6;
      v2[1] = v10 | 0x4000000000000000;
      a2 = v20;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 2uLL:
      *(void *)&long long v25 = *v2;
      *((void *)&v25 + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      sub_22B571000();
      long long v13 = v25;
      uint64_t result = sub_22B56EC28(*(void *)(v25 + 16), *(void *)(v25 + 24), a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      *uint64_t v2 = v13;
      v2[1] = *((void *)&v13 + 1) | 0x8000000000000000;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 3uLL:
      *(void *)((char *)&v25 + 7) = 0;
      *(void *)&long long v25 = 0;
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25);
      if (v3) {
        return result;
      }
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      goto LABEL_17;
    default:
      *(void *)&long long v25 = *v2;
      WORD4(v25) = v5;
      BYTE10(v25) = BYTE2(v5);
      BYTE11(v25) = BYTE3(v5);
      BYTE12(v25) = BYTE4(v5);
      BYTE13(v25) = BYTE5(v5);
      BYTE14(v25) = BYTE6(v5);
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25 + BYTE6(v5));
      if (v3)
      {
        unint64_t v9 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        *uint64_t v2 = v25;
        v2[1] = v9;
      }
      else
      {
        long long v14 = v21;
        uint64_t v15 = v22;
        uint64_t v16 = v23;
        long long v17 = v24;
        unint64_t v18 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        *uint64_t v2 = v25;
        v2[1] = v18;
LABEL_17:
        *(_OWORD *)a2 = v14;
        *(void *)(a2 + 16) = v15;
        *(void *)(a2 + 24) = v16;
        *(_OWORD *)(a2 + 32) = v17;
      }
      return result;
  }
}

unsigned char *sub_22B56EB2C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_22B56F150(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_22B56F2B4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_22B56F330((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

double sub_22B56EBA4@<D0>(void (*a1)(long long *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4) {
      return result;
    }
LABEL_5:
    uint64_t v7 = v11;
    uint64_t v8 = v12;
    double result = *(double *)&v10;
    long long v9 = v13;
    *(_OWORD *)a4 = v10;
    *(void *)(a4 + 16) = v7;
    *(void *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4) {
    goto LABEL_5;
  }
  return result;
}

char *sub_22B56EC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *(*a3)(long long *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  double result = (char *)sub_22B570E70();
  if (!result) {
    goto LABEL_12;
  }
  long long v10 = result;
  double result = (char *)sub_22B570EA0();
  uint64_t v11 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v14 = sub_22B570E90();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  double result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    uint64_t v16 = v20;
    uint64_t v17 = v21;
    long long v18 = v22;
    *(_OWORD *)a4 = v19;
    *(void *)(a4 + 16) = v16;
    *(void *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

uint64_t sub_22B56ECF4@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_22B572380;
  }
  else
  {
    unint64_t v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      long long v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      long long v10 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      long long v10 = (void *)sub_22B571450();
    }
    return sub_22B56EDB0((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_22B56EDB0@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, void *a6@<X8>)
{
  unint64_t v9 = a2;
  uint64_t v10 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  unint64_t v15 = a2;
  if (v14 == 4 << v12)
  {
    double result = sub_22B57090C(a2, a4, a5);
    unint64_t v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v16 = v15 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v17 = HIBYTE(a5) & 0xF;
  }
  if (v17 < v15 >> 16) {
    goto LABEL_31;
  }
  double result = sub_22B5712B0();
  int64_t v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    double result = sub_22B57090C(v9, a4, a5);
    unint64_t v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    double result = sub_22B57090C(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    double result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  unint64_t v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v18 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v18 < v9 >> 16) {
    goto LABEL_29;
  }
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  double result = sub_22B5712B0();
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10) {
    uint64_t v20 = v10 + v16;
  }
  else {
    uint64_t v20 = 0;
  }
  return sub_22B56E730(v20, v19, a6);
}

double sub_22B56EF64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *((void *)a3 + 2);
  uint64_t v6 = *((void *)a3 + 3);
  long long v15 = *a3;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_22B56EBA4((void (*)(long long *__return_ptr, uint64_t, uint64_t))sub_22B56F55C, a1, a2, (uint64_t)&v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  double result = *(double *)&v11;
  long long v10 = v14;
  *(_OWORD *)a4 = v11;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_22B56EFEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = sub_22B56E51C((unint64_t)v9, a1, a2, *a3, a3[1], a3[2], a3[3]);
  uint64_t v6 = v10;
  long long v7 = v9[1];
  *(_OWORD *)a4 = v9[0];
  *(_OWORD *)(a4 + 16) = v7;
  *(void *)(a4 + 32) = v6;
  *(void *)(a4 + 40) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22B56F05C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22B5714B0();
  __break(1u);
  return result;
}

uint64_t sub_22B56F150(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_22B56F214(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_22B570EC0();
      swift_allocObject();
      sub_22B570E80();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_22B571020();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_22B56F2B4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_22B570EC0();
  swift_allocObject();
  uint64_t result = sub_22B570E60();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_22B571020();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_22B56F330(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_22B570EC0();
  swift_allocObject();
  uint64_t result = sub_22B570E60();
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

uint64_t sub_22B56F3B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_22B5714B0();
  __break(1u);
  return result;
}

uint64_t sub_22B56F510(void *a1)
{
  return sub_22B56F5C4(a1) & 1;
}

double sub_22B56F52C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22B56EF64(a1, a2, *(long long **)(v3 + 16), a3);
}

uint64_t sub_22B56F548(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_22B5630F8(a1, a2);
  }
  return a1;
}

uint64_t sub_22B56F55C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22B56EFEC(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

uint64_t sub_22B56F57C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22B56F5B4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22B56F5C4(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_22B571510() & 1;
  }
}

uint64_t sub_22B56F61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22B56F630);
}

uint64_t sub_22B56F630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22B570FF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_22B56F6F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22B56F70C);
}

uint64_t sub_22B56F70C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22B570FF0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_22B56F7D0()
{
  uint64_t result = sub_22B570FF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22B56F894(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22B570FF0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PanicLog.Type(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PanicLog.Type(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B56FA34);
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

unsigned char *sub_22B56FA5C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PanicLog.Type()
{
  return &type metadata for PanicLog.Type;
}

unint64_t sub_22B56FA7C()
{
  unint64_t result = qword_268405590;
  if (!qword_268405590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405590);
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultPolicy()
{
  return &type metadata for DefaultPolicy;
}

uint64_t sub_22B56FAE0(uint64_t a1, uint64_t a2)
{
  v17[1] = a2;
  uint64_t v2 = sub_22B5710D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_22B570EF0();
  uint64_t v6 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  int v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B5710B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684053C0);
  uint64_t v9 = sub_22B5710C0();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22B571DA0;
  (*(void (**)(unint64_t, void, uint64_t))(v10 + 104))(v12 + v11, *MEMORY[0x263F07870], v9);
  sub_22B55F138(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_22B5710A0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v13 = sub_22B570ED0();
  char v15 = v14;
  (*(void (**)(char *, void))(v6 + 8))(v8, v17[0]);
  return v15 & 1 | (v13 < 7);
}

BOOL sub_22B56FD7C()
{
  sub_22B565828();

  return sub_22B565A64(0xD000000000000011, 0x800000022B572D80, 1, (uint64_t)sub_22B56FAE0, 0);
}

uint64_t sub_22B56FDF4()
{
  uint64_t result = sub_22B565DD4(0xD000000000000022, 0x800000022B572D50);
  if (v1) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = result;
  }
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = sub_22B55F0AC(0x64uLL);
    return v3 < 0x7FFFFFFFFFFFFFFFLL && v2 >= (uint64_t)(v3 + 1);
  }
  return result;
}

uint64_t sub_22B56FE64(void *a1)
{
  uint64_t v2 = v1;
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22B571130();
  __swift_project_value_buffer(v4, (uint64_t)qword_268405FA8);
  uint64_t v5 = sub_22B571110();
  os_log_type_t v6 = sub_22B571370();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_22B570404(0xD000000000000022, 0x800000022B573020, &v10);
    sub_22B5713D0();
    _os_log_impl(&dword_22B55C000, v5, v6, "%s Going to run completion handler...", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F4B780](v8, -1, -1);
    MEMORY[0x230F4B780](v7, -1, -1);
  }

  objc_msgSend(a1, sel_unregisterObserver_, v2);
  return (*(uint64_t (**)(void))(v2
                                           + OBJC_IVAR____TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler_completion))(0);
}

void sub_22B570080(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_22B571130();
  __swift_project_value_buffer(v6, (uint64_t)qword_268405FA8);
  uint64_t v7 = sub_22B571110();
  os_log_type_t v8 = sub_22B571370();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_22B570404(0xD00000000000002CLL, 0x800000022B572E10, &v12);
    sub_22B5713D0();
    _os_log_impl(&dword_22B55C000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F4B780](v10, -1, -1);
    MEMORY[0x230F4B780](v9, -1, -1);
  }

  objc_msgSend(a1, sel_unregisterObserver_, v3);
  unint64_t v11 = *(void (**)(void *))(v3
                                      + OBJC_IVAR____TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler_completion);
  if (a2) {
    a2 = (void *)sub_22B570F20();
  }
  v11(a2);
}

id sub_22B5702F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertDeactivationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RemoteAlertDeactivationHandler()
{
  return self;
}

uint64_t sub_22B570364(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22B57038C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_22B570404(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_22B5713D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22B570404(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22B5704D8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22B56177C((uint64_t)v12, *a3);
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
      sub_22B56177C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22B5704D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22B5713E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22B570694(a5, a6);
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
  uint64_t v8 = sub_22B571450();
  if (!v8)
  {
    sub_22B571460();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22B5714B0();
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

uint64_t sub_22B570694(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22B57072C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22B570988(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22B570988(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22B57072C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22B5708A4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22B571440();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22B571460();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22B571280();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22B5714B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22B571460();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22B5708A4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268405610);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22B57090C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22B5712D0();
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
    uint64_t v5 = MEMORY[0x230F4AE90](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_22B570988(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268405610);
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
  uint64_t result = sub_22B5714B0();
  __break(1u);
  return result;
}

unint64_t DiagnosticLogType.init(rawValue:)(unint64_t a1)
{
  return sub_22B570DA8(a1);
}

BOOL sub_22B570C9C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22B570CB0()
{
  return sub_22B5715A0();
}

uint64_t sub_22B570CF8()
{
  return sub_22B571590();
}

uint64_t sub_22B570D24()
{
  return sub_22B5715A0();
}

unint64_t sub_22B570D68@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22B570DA8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_22B570D9C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_22B570DA8(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

unint64_t sub_22B570DBC()
{
  unint64_t result = qword_268405680;
  if (!qword_268405680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268405680);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticLogType()
{
  return &type metadata for DiagnosticLogType;
}

uint64_t sub_22B570E20()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_22B570E30()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_22B570E40()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_22B570E50()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_22B570E60()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_22B570E70()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_22B570E80()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_22B570E90()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_22B570EA0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_22B570EB0()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_22B570EC0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_22B570ED0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_22B570EE0()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_22B570EF0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22B570F00()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_22B570F10()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_22B570F20()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22B570F30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22B570F40()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_22B570F50()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_22B570F60()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_22B570F70()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22B570F80()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_22B570F90()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_22B570FA0()
{
  return MEMORY[0x270EEFDA8]();
}

uint64_t sub_22B570FB0()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_22B570FC0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_22B570FD0()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_22B570FE0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_22B570FF0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22B571000()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_22B571010()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_22B571020()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_22B571030()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_22B571040()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_22B571050()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22B571060()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22B571070()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22B571080()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22B571090()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22B5710A0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_22B5710B0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22B5710C0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22B5710D0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22B5710E0()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_22B5710F0()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_22B571100()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_22B571110()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22B571120()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22B571130()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22B571140()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22B571150()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_22B571160()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22B571170()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22B571180()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22B571190()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22B5711A0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22B5711B0()
{
  return MEMORY[0x270EF1888]();
}

uint64_t sub_22B5711C0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_22B5711D0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_22B5711E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22B5711F0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22B571200()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22B571210()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_22B571220()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_22B571230()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_22B571240()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22B571250()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22B571260()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_22B571270()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22B571280()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22B571290()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22B5712A0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22B5712B0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_22B5712C0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22B5712D0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22B5712E0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_22B5712F0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_22B571300()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22B571310()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22B571320()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22B571330()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22B571340()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22B571350()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22B571360()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22B571370()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22B571380()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22B571390()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_22B5713A0()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_22B5713B0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22B5713C0()
{
  return MEMORY[0x270F9E4E0]();
}

uint64_t sub_22B5713D0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22B5713E0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22B5713F0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22B571400()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22B571410()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22B571420()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22B571430()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22B571440()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22B571450()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22B571460()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22B571470()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22B571480()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22B571490()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22B5714A0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22B5714B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22B5714C0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_22B5714D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22B5714E0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_22B5714F0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22B571500()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22B571510()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22B571520()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22B571530()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22B571540()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22B571550()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22B571560()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22B571570()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22B571580()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22B571590()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22B5715A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22B5715B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22B5715C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
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

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}