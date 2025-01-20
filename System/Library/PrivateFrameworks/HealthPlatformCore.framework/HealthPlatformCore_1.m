uint64_t sub_1C1E7DAA0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C1E7DAE8(uint64_t a1, uint64_t a2)
{
  sub_1C1DF318C(0, (unint64_t *)&qword_1EBB683C0, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E7DB74(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C1E7DBD4(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    unint64_t v5 = *v3;
    if (!(*v3 >> 62))
    {
      if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1C1EAF638();
  swift_bridgeObjectRelease();
  if (v19 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v7 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v6 = v4 - v2;
  if (__OFSUB__(0, v7))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1C1EAF638();
    swift_bridgeObjectRelease();
    uint64_t v9 = v8 + v6;
    if (!__OFADD__(v8, v6)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1C1EAF638();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v5 = *v3;
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v9 = v8 - v7;
  if (__OFADD__(v8, v6)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v5 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v5;
  uint64_t v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v8 = 1;
  }
  if (v5 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9) {
    uint64_t v12 = v9;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = MEMORY[0x1C874C700](v8, v12, 1, v5);
  swift_bridgeObjectRelease();
  *uint64_t v3 = v5;
  uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  sub_1C1EAE348();
  swift_arrayDestroy();
  if (v6)
  {
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_1C1EAF638();
      swift_bridgeObjectRelease();
      uint64_t v14 = v20 - v2;
      if (!__OFSUB__(v20, v2))
      {
LABEL_21:
        if (v14 < 0)
        {
LABEL_46:
          uint64_t result = sub_1C1EAF6A8();
          __break(1u);
          return result;
        }
        v15 = (const void *)(v11 + 32 + 8 * v2);
        if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v15 + 8 * v14) {
          memmove((void *)(v11 + 32 + 8 * v4), v15, 8 * v14);
        }
        if (!(v5 >> 62))
        {
          uint64_t v16 = *(void *)(v11 + 16);
          uint64_t v17 = v16 + v6;
          if (!__OFADD__(v16, v6))
          {
LABEL_27:
            *(void *)(v11 + 16) = v17;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_1C1EAF638();
        swift_bridgeObjectRelease();
        uint64_t v17 = v21 + v6;
        if (!__OFADD__(v21, v6)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v13 = *(void *)(v11 + 16);
      uint64_t v14 = v13 - v2;
      if (!__OFSUB__(v13, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_1C1EAEEB8();
}

uint64_t sub_1C1E7DEB4(unint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C1EAF638();
    swift_bridgeObjectRelease();
    if (!v4) {
      return MEMORY[0x1E4FBC860];
    }
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1C1EAF638();
    swift_bridgeObjectRelease();
    if (v14 >= 5) {
      goto LABEL_4;
    }
LABEL_34:
    swift_bridgeObjectRetain();
    return v2;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return MEMORY[0x1E4FBC860];
  }
  if (v4 < 5) {
    goto LABEL_34;
  }
LABEL_4:
  if (v4 < 0)
  {
    unint64_t v5 = 4;
    if (!v3)
    {
LABEL_9:
      uint64_t v6 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      goto LABEL_16;
    }
  }
  else
  {
    if (v4 >= 4) {
      unint64_t v5 = 4;
    }
    else {
      unint64_t v5 = v4;
    }
    if (!v3) {
      goto LABEL_9;
    }
  }
  if (v2 < 0) {
    uint64_t v6 = v2;
  }
  else {
    uint64_t v6 = v2 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  if (sub_1C1EAF638() < 0)
  {
    __break(1u);
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1C1EAF638();
  swift_bridgeObjectRelease();
LABEL_16:
  if (v6 < (uint64_t)v5)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    sub_1C1EAE348();
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7 + 1;
      sub_1C1EAF4C8();
      uint64_t v7 = v8;
    }
    while (v5 != v8);
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1C1EAF648();
    uint64_t v1 = v9;
    uint64_t v3 = v10;
    unint64_t v5 = v11;
    swift_bridgeObjectRelease_n();
    if (v5) {
      goto LABEL_25;
    }
LABEL_24:
    uint64_t v2 = sub_1C1E30D6C(v6, v1, v3, v5);
    swift_unknownObjectRelease();
    return v2;
  }
  uint64_t v6 = v2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v1 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  unint64_t v5 = (2 * v5) | 1;
  if ((v5 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_25:
  sub_1C1EAF7B8();
  swift_unknownObjectRetain_n();
  uint64_t v12 = swift_dynamicCastClass();
  if (!v12)
  {
    swift_unknownObjectRelease();
    uint64_t v12 = MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = *(void *)(v12 + 16);
  swift_release();
  if (__OFSUB__(v5 >> 1, v3)) {
    goto LABEL_38;
  }
  if (v13 != (v5 >> 1) - v3)
  {
LABEL_39:
    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  uint64_t v2 = swift_dynamicCastClass();
  swift_unknownObjectRelease();
  if (!v2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  return v2;
}

uint64_t sub_1C1E7E11C(uint64_t a1, void *a2)
{
  unint64_t v5 = sub_1C1EAE568();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v46 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = MEMORY[0x1E4FBC870];
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v40 = swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t)sub_1C1E30F14(v40);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v50 = v8;
  sub_1C1E7A7E0(&v50);
  uint64_t v9 = v50;
  uint64_t v47 = v6;
  sub_1C1E7E9BC(0, &qword_1EBB654A8, &qword_1EBB65478, MEMORY[0x1E4FBB350], MEMORY[0x1E4FBBA58]);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v9;
  sub_1C1E7E920();
  unint64_t v11 = swift_initStackObject();
  v11[2].isa = (Class)v9;
  v11[3].isa = 0;
  uint64_t v12 = ((unint64_t)v9 >> 62) & 1;
  if (v9 < 0) {
    LODWORD(v12) = 1;
  }
  int v43 = v12;
  if (v12 == 1)
  {
LABEL_54:
    swift_retain_n();
    id v39 = a2;
    uint64_t v13 = sub_1C1EAF638();
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v13 = *(void *)(v9 + 16);
    swift_retain_n();
    id v14 = a2;
    swift_retain();
  }
  uint64_t v48 = inited;
  unint64_t v45 = v5;
  v49 = (void *)MEMORY[0x1E4FBC860];
  if (!v13)
  {
    v15 = 0;
LABEL_38:
    swift_release();
    unint64_t v32 = (unint64_t)v49;
    unint64_t v33 = v49[3];
    if (v33 >= 2)
    {
      unint64_t v34 = v33 >> 1;
      BOOL v30 = __OFSUB__(v34, v15);
      unint64_t v35 = v34 - (void)v15;
      if (v30)
      {
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
      v49[2] = v35;
    }
    swift_release();
    v15 = v46;
    sub_1C1EAE508();
    swift_retain_n();
    swift_retain();
    unint64_t v11 = sub_1C1EAE558();
    LOBYTE(v13) = sub_1C1EAF0D8();
    if (!os_log_type_enabled(v11, (os_log_type_t)v13))
    {

      swift_release();
      swift_release_n();
      swift_release_n();
      unint64_t v5 = v45;
LABEL_50:
      (*(void (**)(char *, unint64_t))(v47 + 8))(v15, v5);
      swift_bridgeObjectRelease();
      return v32;
    }
    unint64_t v2 = swift_slowAlloc();
    *(_DWORD *)unint64_t v2 = 134218240;
    unint64_t v5 = v45;
    if ((v32 & 0x8000000000000000) == 0 && (v32 & 0x4000000000000000) == 0)
    {
      uint64_t v36 = *(void *)(v32 + 16);
LABEL_45:
      swift_release();
      uint64_t v50 = v36;
      sub_1C1EAF2C8();
      swift_release();
      *(_WORD *)(v2 + 12) = 2048;
      if (v43)
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_1C1EAF638();
        swift_release();
      }
      else
      {
        uint64_t v37 = *(void *)(v9 + 16);
      }
      swift_release();
      uint64_t v50 = v37;
      sub_1C1EAF2C8();
      swift_release();
      _os_log_impl(&dword_1C1DD2000, v11, (os_log_type_t)v13, "Picked ranked apps with count %ld from ranked apps count %ld", (uint8_t *)v2, 0x16u);
      MEMORY[0x1C874D2E0](v2, -1, -1);

      swift_release();
      unint64_t v32 = (unint64_t)v49;
      goto LABEL_50;
    }
LABEL_58:
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1C1EAF638();
    swift_release();
    goto LABEL_45;
  }
  uint64_t inited = 0;
  v15 = 0;
  uint64_t v16 = (void *)(MEMORY[0x1E4FBC860] + 32);
  unint64_t v5 = v9 & 0xC000000000000001;
  uint64_t v17 = 5;
  uint64_t v42 = MEMORY[0x1E4FBC838] + 8;
  while (1)
  {
    uint64_t v44 = v17;
    unint64_t v2 = inited;
    while (1)
    {
      if (v5)
      {
        id v18 = (id)MEMORY[0x1C874C6F0](v2, v9);
      }
      else
      {
        if ((v2 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        if (v2 >= *(void *)(v9 + 16)) {
          goto LABEL_53;
        }
        id v18 = *(id *)(v9 + 8 * v2 + 32);
      }
      uint64_t v19 = v18;
      uint64_t inited = v2 + 1;
      if (__OFADD__(v2, 1)) {
        goto LABEL_52;
      }
      v11[3].isa = (Class)inited;
      uint64_t v50 = (uint64_t)v18;
      if (sub_1C1E79644((void **)&v50, (uint64_t)a2, &v51)) {
        break;
      }

      ++v2;
      if (inited == v13) {
        goto LABEL_38;
      }
    }
    if (!v15) {
      break;
    }
LABEL_33:
    BOOL v30 = __OFSUB__(v15--, 1);
    uint64_t v31 = v44;
    if (v30)
    {
      __break(1u);
      goto LABEL_57;
    }
    *uint64_t v16 = v19;
    uint64_t v17 = v31 - 1;
    if (v17)
    {
      ++v16;
      if (inited != v13) {
        continue;
      }
    }
    goto LABEL_38;
  }
  unint64_t v2 = (unint64_t)v49;
  unint64_t v20 = v49[3];
  if ((uint64_t)((v20 >> 1) + 0x4000000000000000) >= 0)
  {
    int64_t v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
    if (v21 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
    sub_1C1DF318C(0, (unint64_t *)&qword_1EBB660F8, v42, MEMORY[0x1E4FBBE00]);
    v23 = (void *)swift_allocObject();
    int64_t v24 = _swift_stdlib_malloc_size(v23);
    uint64_t v25 = v24 - 32;
    if (v24 < 32) {
      uint64_t v25 = v24 - 25;
    }
    uint64_t v26 = v25 >> 3;
    v23[2] = v22;
    v23[3] = (2 * (v25 >> 3)) | 1;
    unint64_t v27 = (unint64_t)(v23 + 4);
    uint64_t v28 = *(void *)(v2 + 24) >> 1;
    if (*(void *)(v2 + 16))
    {
      v29 = (const void *)(v2 + 32);
      if (v23 != (void *)v2 || v27 >= (unint64_t)v29 + 8 * v28)
      {
        uint64_t v41 = v25 >> 3;
        memmove(v23 + 4, v29, 8 * v28);
        unint64_t v27 = (unint64_t)(v23 + 4);
        uint64_t v26 = v41;
      }
      unint64_t v2 = (unint64_t)v49;
      v49[2] = 0;
    }
    v49 = v23;
    uint64_t v16 = (void *)(v27 + 8 * v28);
    v15 = (char *)((v26 & 0x7FFFFFFFFFFFFFFFLL) - v28);
    swift_release();
    goto LABEL_33;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1C1E7E6D0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E7E708(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C1DF3128(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C1E7E778(uint64_t a1, void *a2)
{
  return sub_1C1E77EE4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(NSObject **)(v2 + 40));
}

void sub_1C1E7E784()
{
  if (!qword_1EBB661F0)
  {
    sub_1C1DF3128(255, &qword_1EBB661E8, MEMORY[0x1E4F67360], MEMORY[0x1E4FBB718]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB661F0);
    }
  }
}

uint64_t sub_1C1E7E818(uint64_t a1, uint64_t a2)
{
  sub_1C1DF3128(0, &qword_1EBB661E8, MEMORY[0x1E4F67360], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E7E8AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C1DF3128(255, &qword_1EBB65470, MEMORY[0x1E4F674F8], MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C1E7E920()
{
  if (!qword_1EBB654A0)
  {
    sub_1C1E7E9BC(255, &qword_1EBB654C0, &qword_1EBB65480, MEMORY[0x1E4FBB368], MEMORY[0x1E4FBBC18]);
    sub_1C1E7EA70();
    unint64_t v0 = sub_1C1EAF4F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB654A0);
    }
  }
}

void sub_1C1E7E9BC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1C1DF3128(255, &qword_1EBB65470, MEMORY[0x1E4F674F8], MEMORY[0x1E4FBB320]);
    uint64_t v10 = v9;
    uint64_t v11 = sub_1C1E7E8AC(a3);
    unint64_t v12 = a5(a1, v10, v11);
    if (!v13) {
      atomic_store(v12, a2);
    }
  }
}

unint64_t sub_1C1E7EA70()
{
  unint64_t result = qword_1EBB654B8;
  if (!qword_1EBB654B8)
  {
    sub_1C1E7E9BC(255, &qword_1EBB654C0, &qword_1EBB65480, MEMORY[0x1E4FBB368], MEMORY[0x1E4FBBC18]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB654B8);
  }
  return result;
}

uint64_t GeneratorPipelineManagerWrapper.init(wrapped:pluginInfo:context:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for GeneratorPipelineManagerWrapper();
  sub_1C1EAD358();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  sub_1C1DFE46C(a2, a5 + *(int *)(v10 + 28));
  uint64_t v11 = a5 + *(int *)(v10 + 32);
  uint64_t v12 = sub_1C1EADA28();
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32);
  return v13(v11, a3, v12);
}

uint64_t GeneratorPipelineManagerWrapper.subscript.getter(uint64_t a1)
{
  return MEMORY[0x1F4186550](v1, a1);
}

uint64_t GeneratorPipelineManagerWrapper.context.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_1C1EADA28();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t GeneratorPipelineManagerWrapper.uuid.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_1C1EAD368();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t _s18HealthPlatformCore31GeneratorPipelineManagerWrapperV7wrappedxvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t GeneratorPipelineProviderWrapper.init(wrapped:pluginInfo:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = a4 + *(int *)(type metadata accessor for GeneratorPipelineProviderWrapper() + 28);
  return sub_1C1DFE46C(a2, v6);
}

uint64_t type metadata accessor for GeneratorPipelineProviderWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1C1E7EDB8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C1EADA28();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_1C1EAD368();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_1C1E7EEC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v27 = sub_1C1EADA28();
  uint64_t v7 = *(void *)(v27 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = sub_1C1EAD368();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v9 + v12;
  unsigned int v14 = v12 | v8 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (((v13 + ((v8 + ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~(unint64_t)v8)) & ~v12)
     + *(void *)(v11 + 64) > 0x18
    || ((*(_DWORD *)(v11 + 80) | v8 | *(_DWORD *)(v5 + 80)) & 0x100000) != 0
    || v14 > 7)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + (((v14 | 7) + 16) & ~(unint64_t)(v14 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v25 = ~v12;
    uint64_t v26 = v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v4);
    unint64_t v18 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v19 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v20 = *(void *)(v19 + 24);
    *(void *)(v18 + 24) = v20;
    *(void *)(v18 + 32) = *(void *)(v19 + 32);
    (**(void (***)(unint64_t, unint64_t))(v20 - 8))(v18, v19);
    unint64_t v21 = v19 + v8;
    unint64_t v22 = (v18 + v8 + 40) & ~(unint64_t)v8;
    unint64_t v23 = (v21 + 40) & ~(unint64_t)v8;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v22, v23, v27);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((v22 + v13) & v25, (v23 + v13) & v25, v26);
  }
  return a1;
}

uint64_t sub_1C1E7F170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  uint64_t v7 = (uint64_t *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int v8 = (uint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  __swift_assign_boxed_opaque_existential_1(v7, v8);
  uint64_t v9 = sub_1C1EADA28();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v10 + 24;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = ((unint64_t)v7 + v12 + 40) & ~v12;
  uint64_t v14 = ((unint64_t)v8 + v12 + 40) & ~v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v13, v14, v9);
  uint64_t v15 = *(void *)(v11 + 40);
  uint64_t v16 = sub_1C1EAD368();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 24))((v15 + *(unsigned __int8 *)(v17 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), (v15 + *(unsigned __int8 *)(v17 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), v16);
  return a1;
}

uint64_t sub_1C1E7F294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v8 + 32);
  long long v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(_OWORD *)(v7 + 16) = v10;
  *(void *)(v7 + 32) = v9;
  uint64_t v11 = sub_1C1EADA28();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v12 + 32;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 40 + v7) & ~v14;
  uint64_t v16 = (v14 + 40 + v8) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v16, v11);
  uint64_t v17 = *(void *)(v13 + 32);
  uint64_t v18 = sub_1C1EAD368();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v19 + 32))((v17 + *(unsigned __int8 *)(v19 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80), (v17 + *(unsigned __int8 *)(v19 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80), v18);
  return a1;
}

uint64_t sub_1C1E7F3FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t sub_1C1E7F404()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1C1E7F49C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 40 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v12 = *(void *)(v11 + 24);
    *(void *)(v10 + 24) = v12;
    *(void *)(v10 + 32) = *(void *)(v11 + 32);
    (**(void (***)(void))(v12 - 8))();
  }
  return v4;
}

uint64_t sub_1C1E7F5D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8), (uint64_t *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8));
  return a1;
}

uint64_t sub_1C1E7F650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v8 + 32);
  long long v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(_OWORD *)(v7 + 16) = v10;
  *(void *)(v7 + 32) = v9;
  return a1;
}

uint64_t sub_1C1E7F6D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_1(v7);
  long long v9 = *(_OWORD *)v8;
  long long v10 = *(_OWORD *)(v8 + 16);
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  *(_OWORD *)unint64_t v7 = v9;
  *(_OWORD *)(v7 + 16) = v10;
  return a1;
}

uint64_t sub_1C1E7F760(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
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
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 40;
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
        JUMPOUT(0x1C1E7F8ACLL);
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
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

double sub_1C1E7F8C0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 40;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFD8) {
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
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFD8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFD8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 40);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return result;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return result;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return result;
      default:
        return result;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return result;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return result;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1C1E7FAACLL);
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
          unint64_t v19 = (unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8;
          if ((a2 & 0x80000000) != 0)
          {
            double result = 0.0;
            *(_OWORD *)(v19 + 8) = 0u;
            *(_OWORD *)(v19 + 24) = 0u;
            *(void *)unint64_t v19 = a2 ^ 0x80000000;
          }
          else
          {
            *(void *)(v19 + 24) = a2 - 1;
          }
        }
        else
        {
          uint64_t v18 = *(void (**)(void))(v6 + 56);
          v18();
        }
      }
      return result;
  }
}

id sub_1C1E7FAD4()
{
  sub_1C1E809D8();
  MEMORY[0x1F4188790](v0 - 8);
  unint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1C1EADDD8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  unsigned int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v18 - v8;
  sub_1C1EADC08();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1C1E80B20((uint64_t)v2, (uint64_t (*)(void))sub_1C1E809D8);
    return (id)MEMORY[0x1E4FBC860];
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
  sub_1C1E80C58(0, (unint64_t *)&qword_1EBB660F8, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1C1EB04A0;
  int v12 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v12(v7, v9, v3);
  unsigned int v13 = (objc_class *)type metadata accessor for DateRangeRelevanceProvider();
  uint64_t v14 = (char *)objc_allocWithZone(v13);
  v12(&v14[OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval], v7, v3);
  v20.receiver = v14;
  v20.super_class = v13;
  id result = objc_msgSendSuper2(&v20, sel_init);
  if (result)
  {
    id v16 = result;
    unint64_t v17 = *(void (**)(char *, uint64_t))(v4 + 8);
    v17(v7, v3);
    *(void *)(v11 + 32) = v16;
    uint64_t v19 = v11;
    sub_1C1EAEEB8();
    uint64_t v10 = v19;
    v17(v9, v3);
    return (id)v10;
  }
  __break(1u);
  return result;
}

id sub_1C1E7FF28(uint64_t a1)
{
  uint64_t v3 = sub_1C1EADDD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v38 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E80974();
  uint64_t v41 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E809D8();
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v40 = (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v37 - v13;
  MEMORY[0x1F4188790](v12);
  id v16 = (char *)&v37 - v15;
  id v39 = v1;
  unint64_t v17 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v17((char *)&v37 - v15, &v1[OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval], v3);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v18(v16, 0, 1, v3);
  uint64_t v42 = a1;
  sub_1C1E80A30(a1, (uint64_t)v46);
  if (v47)
  {
    type metadata accessor for DateRangeRelevanceProvider();
    if (swift_dynamicCast())
    {
      uint64_t v19 = (void *)v44[0];
      v17(v14, (char *)(v44[0] + OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval), v3);

      uint64_t v20 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    sub_1C1E60B10((uint64_t)v46);
  }
  uint64_t v20 = 1;
LABEL_6:
  v18(v14, v20, 1, v3);
  uint64_t v21 = (uint64_t)&v8[*(int *)(v41 + 48)];
  sub_1C1E80ABC((uint64_t)v16, (uint64_t)v8);
  sub_1C1E80ABC((uint64_t)v14, v21);
  unint64_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v22((uint64_t)v8, 1, v3) != 1)
  {
    uint64_t v23 = v40;
    sub_1C1E80ABC((uint64_t)v8, v40);
    if (v22(v21, 1, v3) != 1)
    {
      int64_t v24 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v38, v21, v3);
      sub_1C1E80B80();
      uint64_t v25 = v23;
      char v26 = sub_1C1EAED18();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v4 + 8);
      v27(v24, v3);
      sub_1C1E80B20((uint64_t)v14, (uint64_t (*)(void))sub_1C1E809D8);
      sub_1C1E80B20((uint64_t)v16, (uint64_t (*)(void))sub_1C1E809D8);
      v27((char *)v25, v3);
      sub_1C1E80B20((uint64_t)v8, (uint64_t (*)(void))sub_1C1E809D8);
      sub_1C1E80A30(v42, (uint64_t)v46);
      if (v26) {
        goto LABEL_13;
      }
LABEL_15:
      id v34 = 0;
      goto LABEL_18;
    }
    sub_1C1E80B20((uint64_t)v14, (uint64_t (*)(void))sub_1C1E809D8);
    sub_1C1E80B20((uint64_t)v16, (uint64_t (*)(void))sub_1C1E809D8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v23, v3);
LABEL_11:
    sub_1C1E80B20((uint64_t)v8, (uint64_t (*)(void))sub_1C1E80974);
    sub_1C1E80A30(v42, (uint64_t)v46);
    goto LABEL_15;
  }
  sub_1C1E80B20((uint64_t)v14, (uint64_t (*)(void))sub_1C1E809D8);
  sub_1C1E80B20((uint64_t)v16, (uint64_t (*)(void))sub_1C1E809D8);
  if (v22(v21, 1, v3) != 1) {
    goto LABEL_11;
  }
  sub_1C1E80B20((uint64_t)v8, (uint64_t (*)(void))sub_1C1E809D8);
  sub_1C1E80A30(v42, (uint64_t)v46);
LABEL_13:
  sub_1C1E80A30((uint64_t)v46, (uint64_t)v44);
  uint64_t v28 = v45;
  if (v45)
  {
    v29 = __swift_project_boxed_opaque_existential_1(v44, v45);
    uint64_t v30 = *(void *)(v28 - 8);
    MEMORY[0x1F4188790](v29);
    unint64_t v32 = (char *)&v37 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v30 + 16))(v32);
    uint64_t v33 = sub_1C1EAF798();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  }
  else
  {
    uint64_t v33 = 0;
  }
  unint64_t v35 = (objc_class *)type metadata accessor for DateRangeRelevanceProvider();
  v43.receiver = v39;
  v43.super_class = v35;
  id v34 = objc_msgSendSuper2(&v43, sel_isEqual_, v33);
  swift_unknownObjectRelease();
LABEL_18:
  sub_1C1E60B10((uint64_t)v46);
  return v34;
}

uint64_t sub_1C1E80654()
{
  uint64_t v1 = sub_1C1EADDD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_1C1EAF4A8();
  sub_1C1EAEDB8();
  uint64_t ObjectType = swift_getObjectType();
  sub_1C1E80938();
  sub_1C1EAED68();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  uint64_t ObjectType = v0;
  sub_1C1EAF5B8();
  sub_1C1EAEDB8();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval, v1);
  sub_1C1EAED68();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  return v8;
}

id sub_1C1E807FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DateRangeRelevanceProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C1E808A0()
{
  return type metadata accessor for DateRangeRelevanceProvider();
}

uint64_t sub_1C1E808A8()
{
  uint64_t result = sub_1C1EADDD8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_1C1E80938()
{
  unint64_t result = qword_1EBB66A20;
  if (!qword_1EBB66A20)
  {
    type metadata accessor for DateRangeRelevanceProvider();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB66A20);
  }
  return result;
}

void sub_1C1E80974()
{
  if (!qword_1EBB65DF8)
  {
    sub_1C1E809D8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB65DF8);
    }
  }
}

void sub_1C1E809D8()
{
  if (!qword_1EBB661C8)
  {
    sub_1C1EADDD8();
    unint64_t v0 = sub_1C1EAF2A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB661C8);
    }
  }
}

uint64_t sub_1C1E80A30(uint64_t a1, uint64_t a2)
{
  sub_1C1E80C58(0, (unint64_t *)&qword_1EBB683C0, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E80ABC(uint64_t a1, uint64_t a2)
{
  sub_1C1E809D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E80B20(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1C1E80B80()
{
  unint64_t result = qword_1EBB65DF0;
  if (!qword_1EBB65DF0)
  {
    sub_1C1EADDD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB65DF0);
  }
  return result;
}

void sub_1C1E80BD8()
{
  sub_1C1EADC18();
  sub_1C1EADC88();
  unint64_t v0 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_featureWithName_featureType_, v0, 2);

  qword_1EBB6ACE0 = (uint64_t)v1;
}

void sub_1C1E80C58(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C1E80CA4()
{
  if (qword_1EBB680D0 != -1) {
    swift_once();
  }
  uint64_t result = sub_1C1E865E8(5);
  qword_1EBB6ACD8 = result;
  return result;
}

uint64_t DispatchQueueGeneratorScheduler.init(context:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C1DFE46C(a1, a2);
}

uint64_t DispatchQueueOrchestrationScheduler.environment.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t DispatchQueueOrchestrationScheduler.maxConcurrentPipelines.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t DispatchQueueOrchestrationScheduler.maxConcurrentGenerators.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t DispatchQueueOrchestrationScheduler.__allocating_init(environment:maxConcurrentPipelines:maxConcurrentGenerators:)(char a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1 & 1;
  uint64_t v6 = swift_allocObject();
  DispatchQueueOrchestrationScheduler.init(environment:maxConcurrentPipelines:maxConcurrentGenerators:)(v5, a2, a3);
  return v6;
}

void sub_1C1E80D80(uint64_t a1)
{
}

id *DispatchQueueOrchestrationScheduler.deinit()
{
  return v0;
}

uint64_t DispatchQueueOrchestrationScheduler.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void *sub_1C1E80E30@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = sub_1C1EAE7C8();
  type metadata accessor for DispatchQueueOrchestrationScheduler();
  uint64_t v5 = swift_allocObject();
  uint64_t result = DispatchQueueOrchestrationScheduler.init(environment:maxConcurrentPipelines:maxConcurrentGenerators:)(v3, v4, 3);
  *a2 = v5;
  return result;
}

uint64_t DispatchQueueGeneratorScheduler.context.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1DFE408(v1, a1);
}

uint64_t DispatchQueueGeneratorScheduler.subscribeOn<A>(for:domain:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return sub_1C1E09500(a1, a2, a3, a4, MEMORY[0x1E4F1A860], MEMORY[0x1E4F1AC90], MEMORY[0x1E4F1A868]);
}

uint64_t dispatch thunk of GenerationQueueProviding.queue(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of OrchestrationScheduler.maxConcurrentPipelines.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of OrchestrationScheduler.maxConcurrentGenerators.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of OrchestrationScheduler.receiveOnForHealthPluginDelegateStream<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of OrchestrationScheduler.receiveOnForGeneratorPipelineManagerStream<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of OrchestrationScheduler.subscribeOnForGeneratorPipelineStream<A>(_:domain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of OrchestrationScheduler.subscribeOnForGeneratorStream<A>(_:domain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

uint64_t dispatch thunk of OrchestrationScheduler.init(environment:)(char a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))(a1 & 1);
}

uint64_t method lookup function for DispatchQueueOrchestrationScheduler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DispatchQueueOrchestrationScheduler);
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.__allocating_init(environment:)(char a1)
{
  return (*(uint64_t (**)(void))(v1 + 152))(a1 & 1);
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.__allocating_init(environment:maxConcurrentPipelines:maxConcurrentGenerators:)(char a1)
{
  return (*(uint64_t (**)(void))(v1 + 160))(a1 & 1);
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.receiveOnForHealthPluginDelegateStream<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.receiveOnForGeneratorPipelineManagerStream<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.subscribeOnForGeneratorPipelineStream<A>(_:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.subscribeOnForGeneratorStream<A>(_:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of DispatchQueueOrchestrationScheduler.queue(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t initializeWithCopy for DispatchQueueGeneratorScheduler(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for DispatchQueueGeneratorScheduler(uint64_t *a1, uint64_t *a2)
{
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

uint64_t assignWithTake for DispatchQueueGeneratorScheduler(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchQueueGeneratorScheduler(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DispatchQueueGeneratorScheduler(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchQueueGeneratorScheduler()
{
  return &type metadata for DispatchQueueGeneratorScheduler;
}

void sub_1C1E811F4()
{
  if (!qword_1EBB66FB8)
  {
    sub_1C1EAD668();
    sub_1C1DE9018(&qword_1EBB66160, MEMORY[0x1E4F67030]);
    unint64_t v0 = sub_1C1EAEFA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB66FB8);
    }
  }
}

void sub_1C1E81288()
{
  if (!qword_1EBB64700)
  {
    sub_1C1DF9F8C(255, (unint64_t *)&qword_1EBB67F40);
    sub_1C1DFAEA0(&qword_1EBB67F48, (unint64_t *)&qword_1EBB67F40);
    unint64_t v0 = sub_1C1EAEFA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB64700);
    }
  }
}

uint64_t sub_1C1E81330(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v19 = MEMORY[0x1E4FBC860];
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (unsigned __int8 *)(a3 + 64);
    do
    {
      uint64_t v9 = *((void *)v8 - 4);
      uint64_t v10 = *((void *)v8 - 3);
      uint64_t v11 = *((void *)v8 - 2);
      uint64_t v12 = *((void *)v8 - 1);
      unsigned __int8 v13 = *v8;
      v17[0] = v9;
      v17[1] = v10;
      v17[2] = v11;
      v17[3] = v12;
      unsigned __int8 v18 = v13;
      sub_1C1E542F8(v9, v10, v11, v12, v13);
      a1(&v16, v17);
      uint64_t v14 = sub_1C1E5441C(v9, v10, v11, v12, v13);
      if (v4)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      if (v16)
      {
        MEMORY[0x1C874C090](v14);
        if (*(void *)(v19 + 16) >= *(void *)(v19 + 24) >> 1) {
          sub_1C1EAEEE8();
        }
        sub_1C1EAEF18();
        sub_1C1EAEEB8();
      }
      v8 += 40;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

uint64_t sub_1C1E81488(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v14 = MEMORY[0x1E4FBC860];
  if (a3 >> 62) {
    goto LABEL_17;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_1C1EAF638())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C874C6F0](i - 4, a3) : *(id *)(a3 + 8 * i);
      uint64_t v8 = v7;
      uint64_t v9 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v7;
      a1(&v12, &v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }

      if (v12)
      {
        MEMORY[0x1C874C090]();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C1EAEEE8();
        }
        sub_1C1EAEF18();
        sub_1C1EAEEB8();
      }
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

unint64_t sub_1C1E81628(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  sub_1C1E828E4(0, &qword_1EBB67040, (uint64_t (*)(uint64_t))sub_1C1E1D1B8, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v25 - v8;
  sub_1C1E1D1B8();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v31 = (uint64_t)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v29 = (uint64_t)&v25 - v15;
  uint64_t v16 = *(void *)(a3 + 16);
  if (!v16) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v17 = *(void *)(type metadata accessor for ModelTrainingEvent() - 8);
  uint64_t v18 = a3 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  uint64_t v26 = v12;
  uint64_t v19 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v30 = *(void *)(v17 + 72);
  uint64_t v25 = a3;
  swift_bridgeObjectRetain();
  unint64_t v20 = MEMORY[0x1E4FBC860];
  uint64_t v27 = v11;
  uint64_t v28 = a2;
  do
  {
    a1(v18);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v20;
    }
    if ((*v19)(v9, 1, v11) == 1)
    {
      sub_1C1E82948((uint64_t)v9);
    }
    else
    {
      uint64_t v21 = v29;
      sub_1C1E829D4((uint64_t)v9, v29, (uint64_t (*)(void))sub_1C1E1D1B8);
      sub_1C1E829D4(v21, v31, (uint64_t (*)(void))sub_1C1E1D1B8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v20 = sub_1C1E1C96C(0, *(void *)(v20 + 16) + 1, 1, v20);
      }
      unint64_t v23 = *(void *)(v20 + 16);
      unint64_t v22 = *(void *)(v20 + 24);
      if (v23 >= v22 >> 1) {
        unint64_t v20 = sub_1C1E1C96C(v22 > 1, v23 + 1, 1, v20);
      }
      *(void *)(v20 + 16) = v23 + 1;
      sub_1C1E829D4(v31, v20+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v23, (uint64_t (*)(void))sub_1C1E1D1B8);
      uint64_t v11 = v27;
    }
    v18 += v30;
    --v16;
  }
  while (v16);
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_1C1E81978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(*(void *)a1 + 16))
  {
    sub_1C1DFB308();
    sub_1C1EAD9D8();
    __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    sub_1C1EAD928();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    return sub_1C1E82648(a1, a2);
  }
  else
  {
    return sub_1C1E82648(a1, a2);
  }
}

uint64_t sub_1C1E81AD4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  v46 = a2;
  sub_1C1E828E4(0, &qword_1EBB650C0, (uint64_t (*)(uint64_t))sub_1C1DFB308, MEMORY[0x1E4F1AC08]);
  uint64_t v36 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v34 = (char *)&v33 - v5;
  sub_1C1E82128();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  MEMORY[0x1F4188790](v6);
  unint64_t v35 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1DFB308();
  uint64_t v44 = v8;
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v42 + 64);
  MEMORY[0x1F4188790](v8);
  sub_1C1E82198(0);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E82280(0, &qword_1EBB64EB0, (uint64_t (*)(uint64_t))sub_1C1E82198, sub_1C1E82300, MEMORY[0x1E4F1AA28]);
  uint64_t v39 = *(void *)(v15 - 8);
  uint64_t v40 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v33 - v16;
  sub_1C1E8237C();
  uint64_t v43 = v18;
  uint64_t v41 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  unint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *a1;
  uint64_t v45 = a1;
  uint64_t v48 = a1;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1C1E81330((void (*)(uint64_t *__return_ptr, void *))sub_1C1E8262C, (uint64_t)v47, v21);
  swift_bridgeObjectRelease();
  if (*(void *)(v22 + 16))
  {
    uint64_t v49 = v22;
    sub_1C1E821E0();
    sub_1C1E828E4(0, &qword_1EBB65100, (uint64_t (*)(uint64_t))sub_1C1E821E0, MEMORY[0x1E4FBB320]);
    sub_1C1E8224C();
    sub_1C1E826AC();
    sub_1C1EAE748();
    sub_1C1E82300();
    sub_1C1EAEAB8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    sub_1C1E82648((uint64_t)v45, (uint64_t)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v23 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    uint64_t v24 = swift_allocObject();
    sub_1C1E829D4((uint64_t)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23, (uint64_t (*)(void))sub_1C1DFB308);
    sub_1C1E8243C();
    uint64_t v25 = v40;
    sub_1C1EAEA68();
    swift_release();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v25);
    sub_1C1E82334(&qword_1EBB64E68, (void (*)(uint64_t))sub_1C1E8237C);
    uint64_t v26 = v43;
    uint64_t v27 = sub_1C1EAEA38();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v20, v26);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1C1E82648((uint64_t)v45, (uint64_t)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v29 = v34;
    sub_1C1EAE8B8();
    sub_1C1E15F30();
    uint64_t v31 = v35;
    uint64_t v30 = v36;
    sub_1C1EAE888();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v29, v30);
    sub_1C1E82334(&qword_1EBB65160, (void (*)(uint64_t))sub_1C1E82128);
    uint64_t v32 = v38;
    uint64_t v27 = sub_1C1EAEA38();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v31, v32);
  }
  uint64_t *v46 = v27;
  return result;
}

void sub_1C1E82128()
{
  if (!qword_1EBB65168)
  {
    sub_1C1DFB308();
    sub_1C1E15F30();
    unint64_t v0 = sub_1C1EAF8A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB65168);
    }
  }
}

void sub_1C1E82198(uint64_t a1)
{
}

void sub_1C1E821E0()
{
  if (!qword_1EBB65090)
  {
    sub_1C1E15F30();
    unint64_t v0 = sub_1C1EAE7D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB65090);
    }
  }
}

uint64_t sub_1C1E8224C()
{
  return sub_1C1E82334(&qword_1EBB65088, (void (*)(uint64_t))sub_1C1E821E0);
}

void sub_1C1E82280(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_1C1E82300()
{
  return sub_1C1E82334(&qword_1EBB64F98, sub_1C1E82198);
}

uint64_t sub_1C1E82334(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C1E8237C()
{
  if (!qword_1EBB64E70)
  {
    sub_1C1E82280(255, &qword_1EBB64EB0, (uint64_t (*)(uint64_t))sub_1C1E82198, sub_1C1E82300, MEMORY[0x1E4F1AA28]);
    sub_1C1DFB308();
    sub_1C1E8243C();
    unint64_t v0 = sub_1C1EAE668();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB64E70);
    }
  }
}

unint64_t sub_1C1E8243C()
{
  unint64_t result = qword_1EBB64EA8;
  if (!qword_1EBB64EA8)
  {
    sub_1C1E82280(255, &qword_1EBB64EB0, (uint64_t (*)(uint64_t))sub_1C1E82198, sub_1C1E82300, MEMORY[0x1E4F1AA28]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB64EA8);
  }
  return result;
}

uint64_t sub_1C1E824D8@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unsigned int v3 = *(unsigned __int8 *)(result + 32);
  if (v3 >> 5 == 1)
  {
    sub_1C1DFB308();
    sub_1C1EAD9D8();
    __swift_project_boxed_opaque_existential_1(v7, v8);
    sub_1C1EAD8F8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    swift_getObjectType();
    uint64_t v6 = sub_1C1EADEF8();
LABEL_10:
    uint64_t v5 = v6;
    unint64_t result = swift_unknownObjectRelease();
    goto LABEL_11;
  }
  if (v3 >> 5 == 5
    && v3 == 160
    && (*(void *)(result + 24) | *(void *)(result + 16) | *(void *)(result + 8) | *(void *)result) == 0)
  {
    sub_1C1DFB308();
    sub_1C1EAD9D8();
    __swift_project_boxed_opaque_existential_1(v7, v8);
    sub_1C1EAD8F8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    swift_getObjectType();
    uint64_t v6 = sub_1C1EADF08();
    goto LABEL_10;
  }
  uint64_t v5 = 0;
LABEL_11:
  *a2 = v5;
  return result;
}

uint64_t sub_1C1E8262C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C1E824D8(a1, a2);
}

uint64_t sub_1C1E82648(uint64_t a1, uint64_t a2)
{
  sub_1C1DFB308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C1E826AC()
{
  unint64_t result = qword_1EBB65108;
  if (!qword_1EBB65108)
  {
    sub_1C1E828E4(255, &qword_1EBB65100, (uint64_t (*)(uint64_t))sub_1C1E821E0, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB65108);
  }
  return result;
}

uint64_t sub_1C1E82734()
{
  sub_1C1DFB308();
  uint64_t v2 = v1 - 8;
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = v0 + v4 + 8;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v8);
  uint64_t v9 = v7 + *(int *)(v2 + 40);
  uint64_t v10 = sub_1C1EADA28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v7 + *(int *)(v2 + 44);
  uint64_t v12 = sub_1C1EAD368();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C1E82874@<X0>(uint64_t a1@<X8>)
{
  sub_1C1DFB308();
  uint64_t v4 = v1
     + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));
  return sub_1C1E82648(v4, a1);
}

void sub_1C1E828E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1C1E82948(uint64_t a1)
{
  sub_1C1E828E4(0, &qword_1EBB67040, (uint64_t (*)(uint64_t))sub_1C1E1D1B8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C1E829D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id static SharableModelReference.predicateFor(sourceProfile:)(void *a1)
{
  if (a1)
  {
    sub_1C1DF32F0();
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1C1EB0800;
    *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v2 + 64) = sub_1C1DF2A98();
    *(void *)(v2 + 32) = 0xD000000000000011;
    *(void *)(v2 + 40) = 0x80000001C1EB6330;
    id v3 = a1;
    id result = objc_msgSend(v3, sel_identifier);
    if (result)
    {
      id v5 = result;
      sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68238);
      *(void *)(v2 + 96) = sub_1C1DF9F8C(0, &qword_1EBB68268);
      *(void *)(v2 + 104) = sub_1C1E82BA0();
      *(void *)(v2 + 72) = v5;
      uint64_t v6 = sub_1C1EAF018();

      return (id)v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v7 = objc_msgSend(self, sel_predicateWithValue_, 0);
    return v7;
  }
  return result;
}

unint64_t sub_1C1E82BA0()
{
  unint64_t result = qword_1EBB68270;
  if (!qword_1EBB68270)
  {
    sub_1C1DF9F8C(255, &qword_1EBB68268);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB68270);
  }
  return result;
}

uint64_t sub_1C1E82C08()
{
  sub_1C1EAED98();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1E82D58()
{
  return sub_1C1EAF858();
}

uint64_t AllDataSummarySection.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C1EAD318();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t AllDataSummarySection.identifier.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for AllDataSummarySection(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for AllDataSummarySection(uint64_t a1)
{
  return sub_1C1DFE484(a1, qword_1EBB65C50);
}

uint64_t AllDataSummarySection.init(date:identifier:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v5 = *a2;
  uint64_t v6 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for AllDataSummarySection(0);
  *(unsigned char *)(a3 + *(int *)(result + 20)) = v5;
  return result;
}

uint64_t AllDataSummarySection.title.getter()
{
  if (*(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AllDataSummarySection(0) + 20)) > 6u) {
    return 0;
  }
  else {
    return sub_1C1E83044();
  }
}

uint64_t sub_1C1E83044()
{
  switch(*v0)
  {
    case 1:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    case 2:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    case 3:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    case 4:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    case 5:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    case 6:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    case 7:
      if (qword_1EBB65E20 != -1) {
        goto LABEL_18;
      }
      break;
    default:
      if (qword_1EBB65E20 != -1) {
LABEL_18:
      }
        swift_once();
      break;
  }
  return sub_1C1EAD178();
}

HealthPlatformCore::AllDataSummarySection::Identifier_optional __swiftcall AllDataSummarySection.Identifier.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C1EAF6B8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 8;
  if (v3 < 8) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t AllDataSummarySection.Identifier.rawValue.getter()
{
  uint64_t result = 0x7961646F54;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x4420372074736150;
      break;
    case 2:
      uint64_t result = 0x2030332074736150;
      break;
    case 3:
      uint64_t result = 0x2032312074736150;
      break;
    case 4:
      uint64_t result = 0x5920352074736150;
      break;
    case 5:
      uint64_t result = 0x7265646C4FLL;
      break;
    case 6:
      uint64_t result = 0x65746144206F4ELL;
      break;
    case 7:
      uint64_t result = 0x61746144206F4ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C1E83694(unsigned __int8 *a1, char *a2)
{
  return sub_1C1E4C3B4(*a1, *a2);
}

uint64_t sub_1C1E836A0()
{
  return sub_1C1E82D58();
}

uint64_t sub_1C1E836AC()
{
  return sub_1C1E82C08();
}

uint64_t sub_1C1E836B4()
{
  return sub_1C1E82D58();
}

HealthPlatformCore::AllDataSummarySection::Identifier_optional sub_1C1E836BC(Swift::String *a1)
{
  return AllDataSummarySection.Identifier.init(rawValue:)(*a1);
}

void sub_1C1E836C8(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x7961646F54;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEB00000000737961;
      uint64_t v3 = 0x4420372074736150;
      goto LABEL_3;
    case 2:
      strcpy((char *)a1, "Past 30 Days");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 3:
      strcpy((char *)a1, "Past 12 Months");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    case 4:
      strcpy((char *)a1, "Past 5 Years");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 5:
      *(void *)a1 = 0x7265646C4FLL;
      *(void *)(a1 + 8) = 0xE500000000000000;
      break;
    case 6:
      *(void *)a1 = 0x65746144206F4ELL;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    case 7:
      *(void *)a1 = 0x61746144206F4ELL;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t AllDataSummarySection.DateRange.identifier.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for AllDataSummarySection.DateRange(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for AllDataSummarySection.DateRange(uint64_t a1)
{
  return sub_1C1DFE484(a1, qword_1EA2C1580);
}

uint64_t static AllDataSummarySection.DateRange.makeDefaultSections(dateRange:)(uint64_t a1)
{
  uint64_t v40 = sub_1C1EAD318();
  uint64_t v2 = *(void *)(v40 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v40);
  uint64_t v44 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v43 = (char *)&v35 - v6;
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v42 = (char *)&v35 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v45 = (char *)&v35 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v35 - v11;
  sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v35 - v14;
  sub_1C1E843D4(0, &qword_1EA2C1560, type metadata accessor for AllDataSummarySection.DateRange, MEMORY[0x1E4FBBE00]);
  uint64_t v16 = type metadata accessor for AllDataSummarySection.DateRange(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  uint64_t v19 = v16 - 8;
  uint64_t v38 = v16 - 8;
  unint64_t v20 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v41 = v21;
  *(_OWORD *)(v21 + 16) = xmmword_1C1EB24A0;
  uint64_t v22 = v21 + v20;
  unsigned __int8 v50 = 0;
  static AllDataSummarySection.DateRange.getInterval(for:sectionIdentifier:)(&v50, (uint64_t)v15);
  sub_1C1E84438((uint64_t)v15, v22);
  *(unsigned char *)(v22 + *(int *)(v19 + 28)) = 0;
  unsigned __int8 v49 = 1;
  static AllDataSummarySection.DateRange.getInterval(for:sectionIdentifier:)(&v49, (uint64_t)v15);
  sub_1C1E84438((uint64_t)v15, v22 + v18);
  *(unsigned char *)(v22 + v18 + *(int *)(v19 + 28)) = 1;
  unsigned __int8 v48 = 2;
  static AllDataSummarySection.DateRange.getInterval(for:sectionIdentifier:)(&v48, (uint64_t)v15);
  sub_1C1E84438((uint64_t)v15, v22 + 2 * v18);
  *(unsigned char *)(v22 + 2 * v18 + *(int *)(v19 + 28)) = 2;
  unsigned __int8 v47 = 3;
  uint64_t v39 = a1;
  static AllDataSummarySection.DateRange.getInterval(for:sectionIdentifier:)(&v47, (uint64_t)v15);
  sub_1C1E84438((uint64_t)v15, v22 + 3 * v18);
  *(unsigned char *)(v22 + 3 * v18 + *(int *)(v19 + 28)) = 3;
  unsigned __int8 v46 = 5;
  static AllDataSummarySection.DateRange.getInterval(for:sectionIdentifier:)(&v46, (uint64_t)v15);
  sub_1C1E84438((uint64_t)v15, v22 + 4 * v18);
  *(unsigned char *)(v22 + 4 * v18 + *(int *)(v19 + 28)) = 5;
  uint64_t v37 = v22 + 5 * v18;
  static AllDataSummarySection.DateRange.allDataSummaryDate(from:)((uint64_t)v12);
  sub_1C1EAD2B8();
  unint64_t v23 = v42;
  sub_1C1EAD2B8();
  uint64_t v24 = v43;
  sub_1C1EAD2B8();
  uint64_t v25 = v44;
  sub_1C1EAD2B8();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v27 = v40;
  v26(v25, v40);
  v26(v24, v27);
  v26(v23, v27);
  v26(v45, v27);
  v26(v12, v27);
  uint64_t v35 = sub_1C1EAD0E8();
  uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56);
  uint64_t v28 = v37;
  v36(v37, 1, 1, v35);
  uint64_t v29 = v38;
  *(unsigned char *)(v28 + *(int *)(v38 + 28)) = 6;
  uint64_t v30 = v22 + 6 * v18;
  static AllDataSummarySection.DateRange.allDataSummaryDate(from:)((uint64_t)v12);
  sub_1C1EAD2B8();
  uint64_t v31 = v42;
  sub_1C1EAD2B8();
  uint64_t v32 = v43;
  sub_1C1EAD2B8();
  uint64_t v33 = v44;
  sub_1C1EAD2B8();
  v26(v33, v27);
  v26(v32, v27);
  v26(v31, v27);
  v26(v45, v27);
  v26(v12, v27);
  v36(v30, 1, 1, v35);
  *(unsigned char *)(v30 + *(int *)(v29 + 28)) = 7;
  return v41;
}

uint64_t static AllDataSummarySection.DateRange.getInterval(for:sectionIdentifier:)@<X0>(unsigned __int8 *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_1C1EAD318();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v40 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v39 - v8;
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v39 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v39 - v20;
  MEMORY[0x1F4188790](v19);
  unint64_t v23 = (char *)&v39 - v22;
  uint64_t v24 = *a1;
  static AllDataSummarySection.DateRange.allDataSummaryDate(from:)((uint64_t)&v39 - v22);
  uint64_t v41 = v21;
  sub_1C1EAD2B8();
  sub_1C1EAD2B8();
  sub_1C1EAD2B8();
  sub_1C1EAD2B8();
  switch(v24)
  {
    case 1:
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
      uint64_t v39 = v18;
      uint64_t v29 = v41;
      v28(v9, v41, v3);
      uint64_t v30 = v40;
      uint64_t v31 = v23;
      goto LABEL_6;
    case 2:
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
      v28(v9, v18, v3);
      uint64_t v30 = v40;
      uint64_t v39 = v18;
      uint64_t v29 = v41;
      uint64_t v31 = v41;
LABEL_6:
      v28(v30, v31, v3);
      uint64_t v32 = v42;
      sub_1C1EAD0A8();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v4 + 8);
      v33(v12, v3);
      v33(v15, v3);
      v33(v39, v3);
      id v34 = v29;
      goto LABEL_13;
    case 3:
      uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
      v35(v9, v15, v3);
      uint64_t v36 = v40;
      uint64_t v37 = v18;
      goto LABEL_9;
    case 4:
      uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
      v35(v9, v12, v3);
      uint64_t v36 = v40;
      uint64_t v37 = v15;
LABEL_9:
      v35(v36, v37, v3);
      uint64_t v32 = v42;
      goto LABEL_12;
    case 5:
      sub_1C1EAD298();
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v40, v15, v3);
      goto LABEL_11;
    case 6:
    case 7:
      uint64_t v25 = *(void (**)(char *, uint64_t))(v4 + 8);
      v25(v12, v3);
      v25(v15, v3);
      v25(v18, v3);
      v25(v41, v3);
      v25(v23, v3);
      uint64_t v26 = sub_1C1EAD0E8();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v42, 1, 1, v26);
    default:
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v23, v3);
      sub_1C1EAD2A8();
LABEL_11:
      uint64_t v32 = v42;
LABEL_12:
      sub_1C1EAD0A8();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v4 + 8);
      v33(v12, v3);
      v33(v15, v3);
      v33(v18, v3);
      id v34 = v41;
LABEL_13:
      v33(v34, v3);
      v33(v23, v3);
      uint64_t v38 = sub_1C1EAD0E8();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v32, 0, 1, v38);
  }
}

void sub_1C1E843D4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1C1E84438(uint64_t a1, uint64_t a2)
{
  sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static AllDataSummarySection.DateRange.allDataSummaryDate(from:)@<X0>(uint64_t a1@<X8>)
{
  v14[1] = a1;
  v14[0] = sub_1C1EAD318();
  uint64_t v1 = *(void *)(v14[0] - 8);
  MEMORY[0x1F4188790](v14[0]);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C1EAD3C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C1EAD0E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAD078();
  char v12 = sub_1C1EAD088();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_1C1EAD3A8();
  if (v12) {
    sub_1C1EAD308();
  }
  else {
    sub_1C1EAD0C8();
  }
  sub_1C1EAD378();
  (*(void (**)(char *, void))(v1 + 8))(v3, v14[0]);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t AllDataSummarySection.DateRange.isDateInSection(_:)(uint64_t a1)
{
  uint64_t v58 = a1;
  sub_1C1E84DA4();
  uint64_t v2 = v1;
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  v59 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  v57 = (char *)&v48 - v5;
  uint64_t v6 = sub_1C1EAD318();
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v61 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  char v12 = (char *)&v48 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v48 - v13;
  sub_1C1E84E0C();
  uint64_t v62 = v15;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  v56 = (char *)&v48 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v60 = (uint64_t)&v48 - v21;
  sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v48 - v23;
  uint64_t v25 = sub_1C1EAD0E8();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)&v48 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E19CE4(v63, (uint64_t)v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
    sub_1C1E19C58((uint64_t)v24);
    char v29 = 0;
    return v29 & 1;
  }
  uint64_t v55 = v26;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v63 = v25;
  v30(v28, v24, v25);
  sub_1C1EAD0C8();
  sub_1C1EAD098();
  unint64_t v54 = sub_1C1E84E70();
  uint64_t result = sub_1C1EAED08();
  if (result)
  {
    v52 = v28;
    v53 = v18;
    uint64_t v32 = v57;
    uint64_t v33 = &v57[*(int *)(v2 + 48)];
    id v34 = (void (*)(char *, char *, uint64_t))v7[4];
    v34(v57, v14, v6);
    unsigned __int8 v49 = v33;
    v34(v33, v12, v6);
    uint64_t v35 = v59;
    uint64_t v36 = &v59[*(int *)(v2 + 48)];
    uint64_t v50 = v2;
    uint64_t v37 = (void (*)(char *, uint64_t, uint64_t))v7[2];
    uint64_t v51 = v37;
    v37(v59, (uint64_t)v32, v6);
    v37(v36, (uint64_t)v33, v6);
    uint64_t v38 = (uint64_t)v56;
    v34(v56, v35, v6);
    uint64_t v39 = (void (*)(char *, uint64_t))v7[1];
    v39(v36, v6);
    uint64_t v40 = &v35[*(int *)(v50 + 48)];
    v34(v35, v32, v6);
    v34(v40, v49, v6);
    v34((char *)(v38 + *(int *)(v62 + 36)), v40, v6);
    uint64_t v41 = v39;
    uint64_t v42 = (uint64_t)v53;
    uint64_t v43 = v61;
    v39(v35, v6);
    uint64_t v44 = v60;
    sub_1C1E84EC8(v38, v60);
    uint64_t v45 = v58;
    LOBYTE(v37) = sub_1C1EAED08();
    v51(v43, v45, v6);
    sub_1C1E84F2C(v44, v42);
    if (v37) {
      char v29 = sub_1C1EAECF8();
    }
    else {
      char v29 = 0;
    }
    uint64_t v46 = v63;
    uint64_t v47 = v55;
    sub_1C1E84F90(v42);
    v41(v43, v6);
    sub_1C1E84F90(v44);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v52, v46);
    return v29 & 1;
  }
  __break(1u);
  return result;
}

uint64_t static AllDataSummarySection.DateRange.dateIntervalCorrespondsToTodaySection(_:)()
{
  uint64_t v0 = sub_1C1EAD0E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAD078();
  char v4 = sub_1C1EAD088();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

void sub_1C1E84DA4()
{
  if (!qword_1EA2C1568)
  {
    sub_1C1EAD318();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA2C1568);
    }
  }
}

void sub_1C1E84E0C()
{
  if (!qword_1EA2C1570)
  {
    sub_1C1EAD318();
    sub_1C1E84E70();
    unint64_t v0 = sub_1C1EAF008();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C1570);
    }
  }
}

unint64_t sub_1C1E84E70()
{
  unint64_t result = qword_1EA2C1578;
  if (!qword_1EA2C1578)
  {
    sub_1C1EAD318();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C1578);
  }
  return result;
}

uint64_t sub_1C1E84EC8(uint64_t a1, uint64_t a2)
{
  sub_1C1E84E0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E84F2C(uint64_t a1, uint64_t a2)
{
  sub_1C1E84E0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E84F90(uint64_t a1)
{
  sub_1C1E84E0C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C1E84FF0()
{
  unint64_t result = qword_1EBB664A8;
  if (!qword_1EBB664A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB664A8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AllDataSummarySection(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C1EAD318();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for AllDataSummarySection(uint64_t a1)
{
  uint64_t v2 = sub_1C1EAD318();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for AllDataSummarySection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for AllDataSummarySection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for AllDataSummarySection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for AllDataSummarySection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for AllDataSummarySection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C1E85378);
}

uint64_t sub_1C1E85378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD318();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 8) {
      return v10 - 7;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for AllDataSummarySection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C1E85448);
}

uint64_t sub_1C1E85448(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1C1EAD318();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 7;
  }
  return result;
}

uint64_t sub_1C1E85504()
{
  uint64_t result = sub_1C1EAD318();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AllDataSummarySection.Identifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AllDataSummarySection.Identifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x1C1E856F4);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AllDataSummarySection.Identifier()
{
  return &type metadata for AllDataSummarySection.Identifier;
}

uint64_t *initializeBufferWithCopyOfBuffer for AllDataSummarySection.DateRange(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C1EAD0E8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for AllDataSummarySection.DateRange(uint64_t a1)
{
  uint64_t v2 = sub_1C1EAD0E8();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for AllDataSummarySection.DateRange(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithCopy for AllDataSummarySection.DateRange(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *initializeWithTake for AllDataSummarySection.DateRange(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for AllDataSummarySection.DateRange(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for AllDataSummarySection.DateRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C1E85FCC);
}

uint64_t sub_1C1E85FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 8) {
      return v10 - 7;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for AllDataSummarySection.DateRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C1E860CC);
}

void sub_1C1E860CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1C1E843D4(0, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 7;
  }
}

void sub_1C1E861B8()
{
  sub_1C1E843D4(319, &qword_1EBB68158, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t dispatch thunk of FeedItemGenerationPluginInfo.principalClass.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FeedItemGenerationPluginInfo.principalClass.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FeedItemGenerationPluginInfo.principalClass.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of FeedItemGenerationPluginInfo.makeFeedItemGenerator(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of FeedItemGenerationPluginInfo.makeHealthPluginDelegate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_1C1E862E0(uint64_t a1)
{
  sub_1C1E8633C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1C1E8633C()
{
  if (!qword_1EBB65B10)
  {
    sub_1C1E86394();
    unint64_t v0 = sub_1C1EAF2A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB65B10);
    }
  }
}

unint64_t sub_1C1E86394()
{
  unint64_t result = qword_1EBB66158;
  if (!qword_1EBB66158)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB66158);
  }
  return result;
}

uint64_t sub_1C1E863EC(uint64_t a1)
{
  int v3 = self;
  unsigned int v4 = self;
  id v5 = objc_msgSend(v4, sel_hashTransform);
  sub_1C1E4DDB8();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1C1EB04A0;
  *(void *)(v6 + 32) = v1;
  sub_1C1EAEEB8();
  sub_1C1DDA958();
  id v7 = v1;
  uint64_t v8 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v3, sel_transformedFeatureWithTransformer_features_, v5, v8);

  if (a1 < 0)
  {
    uint64_t result = sub_1C1EAF618();
    __break(1u);
  }
  else
  {
    id v10 = objc_msgSend(v4, sel_maskTransformWithWidth_, 10);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1C1EB04A0;
    *(void *)(v11 + 32) = v9;
    sub_1C1EAEEB8();
    id v12 = v9;
    uint64_t v13 = (void *)sub_1C1EAEE88();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v3, sel_transformedFeatureWithTransformer_features_, v10, v13);

    return (uint64_t)v14;
  }
  return result;
}

uint64_t sub_1C1E865E8(uint64_t a1)
{
  uint64_t v2 = v1;
  unsigned int v4 = self;
  uint64_t result = self;
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = (void *)result;
    id v7 = self;
    id v8 = objc_msgSend(v7, sel_featureValueWithDouble_, 0.0);
    id v9 = objc_msgSend(v7, sel_featureValueWithDouble_, 1.0);
    id v10 = objc_msgSend(v6, sel_bucketTransformerWithCount_minValue_maxValue_, a1, v8, v9);

    sub_1C1E4DDB8();
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1C1EB04A0;
    *(void *)(v11 + 32) = v2;
    sub_1C1EAEEB8();
    sub_1C1DDA958();
    id v12 = v2;
    uint64_t v13 = (void *)sub_1C1EAEE88();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v4, sel_transformedFeatureWithTransformer_features_, v10, v13);

    return (uint64_t)v14;
  }
  return result;
}

uint64_t MutualExclusionGroupFeatureTag.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

HealthPlatformCore::MutualExclusionGroupFeatureTag __swiftcall MutualExclusionGroupFeatureTag.init(_:)(HealthPlatformCore::MutualExclusionGroupFeatureTag result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_1C1E86790()
{
  return sub_1C1EADF98();
}

uint64_t sub_1C1E867B8()
{
  return sub_1C1EADFA8();
}

uint64_t sub_1C1E867E0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4120968](a1, a2, MEMORY[0x1E4FBB1D8], MEMORY[0x1E4FBB1A8]);
}

uint64_t sub_1C1E867F8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *sub_1C1E86804@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t MutualExclusionGroupFeatureTag.init(dataVisualizationKind:dataType:excludeWithSameCategory:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v12 = sub_1C1EADE28();
  uint64_t v13 = v8;
  if (a3)
  {
    _s14HealthPlatform7KeywordC0aB4CoreE11identifiers3forSaySSGSo12HKObjectTypeC_tFZ_0();
    sub_1C1E299A4();
    sub_1C1E22EA0();
    sub_1C1EAECE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = objc_msgSend(a2, sel_identifier);
    sub_1C1EAED38();
  }
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();

  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1C1EADE38();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  *a4 = v12;
  a4[1] = v13;
  return result;
}

void *initializeBufferWithCopyOfBuffer for MutualExclusionGroupFeatureTag(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MutualExclusionGroupFeatureTag()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for MutualExclusionGroupFeatureTag(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for MutualExclusionGroupFeatureTag(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MutualExclusionGroupFeatureTag(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MutualExclusionGroupFeatureTag(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MutualExclusionGroupFeatureTag()
{
  return &type metadata for MutualExclusionGroupFeatureTag;
}

void sub_1C1E86AD0()
{
  sub_1C1EAE048();
  sub_1C1EADC68();
  unint64_t v0 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_featureWithName_featureType_, v0, 1);

  qword_1EBB6AD38 = (uint64_t)v1;
}

uint64_t sub_1C1E86B50()
{
  if (qword_1EBB68140 != -1) {
    swift_once();
  }
  uint64_t v0 = *(void *)(sub_1C1EADE18() + 16);
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C1E863EC(v0);
  qword_1EBB6AD30 = result;
  return result;
}

uint64_t SummaryTabFeedPopulationManager.collectHighlightsInteractionAnalytics(in:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  id v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = a1;
  void v5[4] = v3;
  sub_1C1E87F78(0, &qword_1EBB66F68);
  swift_allocObject();
  id v6 = a1;
  sub_1C1EAE8F8();
  sub_1C1E87FDC(&qword_1EBB66F60, &qword_1EBB66F68);
  uint64_t v7 = sub_1C1EAEA38();
  swift_release();
  return v7;
}

uint64_t sub_1C1E86CF8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t SummaryTabFeedPopulationManager.collectModelAnalytics()()
{
  uint64_t v1 = sub_1C1EAF178();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAF168();
  id v5 = *(id *)(v0 + 104);
  uint64_t v6 = sub_1C1E6D79C((uint64_t)v4, (uint64_t)v5);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t SummaryTabFeedPopulationManager.collectModelAnalytics<A>(timeout:timeoutScheduler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = v4;
  uint64_t v61 = a1;
  uint64_t v48 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_1C1EAF2A8();
  uint64_t v59 = *(void *)(v9 - 8);
  uint64_t v60 = v9;
  MEMORY[0x1F4188790](v9);
  v57 = (char *)&v42 - v10;
  sub_1C1E87F78(255, &qword_1EBB66F78);
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C1E87FDC(&qword_1EBB66F70, &qword_1EBB66F78);
  uint64_t v63 = v12;
  uint64_t v64 = a3;
  uint64_t v51 = v13;
  uint64_t v65 = v13;
  uint64_t v66 = a4;
  uint64_t v14 = sub_1C1EAE768();
  uint64_t v55 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  unint64_t v54 = (char *)&v42 - v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v56 = v14;
  uint64_t v63 = v14;
  uint64_t v64 = a3;
  uint64_t v17 = a3;
  uint64_t v49 = WitnessTable;
  uint64_t v65 = WitnessTable;
  uint64_t v66 = a4;
  uint64_t v18 = a4;
  uint64_t v19 = sub_1C1EAE6D8();
  uint64_t v52 = *(void *)(v19 - 8);
  uint64_t v53 = v19;
  MEMORY[0x1F4188790](v19);
  uint64_t v50 = (char *)&v42 - v20;
  uint64_t v21 = sub_1C1EAE568();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE548();
  uint64_t v25 = sub_1C1EAE558();
  os_log_type_t v26 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v46 = a2;
    uint64_t v44 = v5;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v43 = v21;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v45 = v18;
    uint64_t v30 = v29;
    uint64_t v62 = v29;
    uint64_t v47 = v17;
    *(_DWORD *)uint64_t v28 = 136446210;
    uint64_t v63 = (uint64_t)v48;
    swift_getMetatypeMetadata();
    uint64_t v31 = sub_1C1EAED68();
    uint64_t v63 = sub_1C1DF8D44(v31, v32, &v62);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v25, v26, "[%{public}s]: Collecting RelevanceEngine metrics", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v30, -1, -1);
    MEMORY[0x1C874D2E0](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v43);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  uint64_t v63 = sub_1C1EAE8F8();
  uint64_t v33 = v57;
  uint64_t v34 = AssociatedTypeWitness;
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
  v48(v57, 1, 1, AssociatedTypeWitness);
  uint64_t v35 = v54;
  sub_1C1EAEAE8();
  uint64_t v36 = v60;
  uint64_t v59 = *(void *)(v59 + 8);
  ((void (*)(char *, uint64_t))v59)(v33, v60);
  swift_release();
  v48(v33, 1, 1, v34);
  uint64_t v37 = v50;
  uint64_t v38 = v56;
  sub_1C1EAEAF8();
  ((void (*)(char *, uint64_t))v59)(v33, v36);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v38);
  uint64_t v39 = v53;
  swift_getWitnessTable();
  uint64_t v40 = sub_1C1EAEA38();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v39);
  return v40;
}

uint64_t sub_1C1E87474(uint64_t (*a1)(_OWORD *), uint64_t a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v4 = (void *)sub_1C1E962EC();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    uint64_t v6 = *(void (**)(void (*)(uint64_t, uint64_t, uint64_t), uint64_t))((*MEMORY[0x1E4FBC8C8] & *v4)
                                                                                        + 0x140);
    swift_retain();
    v6(sub_1C1E891F0, v5);
    swift_release();

    return swift_release();
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    char v10 = 1;
    return a1(v8);
  }
}

void sub_1C1E875A4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v7 = sub_1C1EAE568();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  char v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE548();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1C1EAE558();
  os_log_type_t v12 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v32 = v7;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v34 = a4;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v33 = a5;
    uint64_t v16 = v15;
    v36[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    v31[1] = v14 + 4;
    sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68390);
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1C1EAEC48();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_1C1DF8D44(v17, v19, v36);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v11, v12, "RelevanceEngine analytics collected: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v16, -1, -1);
    uint64_t v20 = v14;
    a4 = v34;
    MEMORY[0x1C874D2E0](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v21 = swift_bridgeObjectRetain();
  AppSessionAnalyticsEvent.ModelAnalytics.init(relevanceEngineMetrics:)(v21, v36);
  uint64_t v22 = (void *)v36[0];
  uint64_t v23 = (void *)v36[1];
  uint64_t v24 = (void *)v36[2];
  uint64_t v25 = (void *)v36[3];
  char v37 = 0;
  id v26 = (id)v36[4];
  id v27 = v22;
  id v28 = v23;
  id v29 = v24;
  id v30 = v25;
  a4(v36);
}

uint64_t sub_1C1E878A4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_1C1EAE568();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE548();
  uint64_t v6 = sub_1C1EAE558();
  os_log_type_t v7 = sub_1C1EAF0B8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1C1DD2000, v6, v7, "RelevanceEngine analytics never returned; moving on", v8, 2u);
    MEMORY[0x1C874D2E0](v8, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = 1;
  return result;
}

uint64_t sub_1C1E879EC(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v44 = a5;
  uint64_t v45 = a4;
  uint64_t v7 = sub_1C1EAEB78();
  uint64_t v47 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C1EAEBD8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v46 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1C1EAE568();
  uint64_t v13 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  uint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v17 = Strong;
    uint64_t v38 = a1;
    uint64_t v39 = a2;
    uint64_t v40 = v11;
    uint64_t v41 = v9;
    uint64_t v42 = v10;
    sub_1C1EAE548();
    unint64_t v18 = sub_1C1EAE558();
    os_log_type_t v19 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v37 = v7;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136446210;
      v36[1] = v20 + 4;
      uint64_t v22 = v44;
      uint64_t v48 = v21;
      uint64_t aBlock = v44;
      swift_getMetatypeMetadata();
      uint64_t v23 = sub_1C1EAED68();
      uint64_t aBlock = sub_1C1DF8D44(v23, v24, &v48);
      sub_1C1EAF2C8();
      uint64_t v7 = v37;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v18, v19, "[%{public}s]: enqueuing collect highlights interaction analytics", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v21, -1, -1);
      MEMORY[0x1C874D2E0](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v43);
      id v26 = v38;
      uint64_t v25 = v39;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v43);
      id v26 = v38;
      uint64_t v25 = v39;
      uint64_t v22 = v44;
    }
    id v28 = *(void **)(v17 + 104);
    id v29 = (void *)swift_allocObject();
    id v30 = v45;
    v29[2] = v45;
    v29[3] = v17;
    v29[4] = v26;
    v29[5] = v25;
    v29[6] = v22;
    uint64_t v53 = sub_1C1E89240;
    unint64_t v54 = v29;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v50 = 1107296256;
    uint64_t v51 = sub_1C1DF5050;
    uint64_t v52 = &block_descriptor_8;
    uint64_t v31 = _Block_copy(&aBlock);
    id v32 = v28;
    id v33 = v30;
    swift_retain();
    swift_retain();
    uint64_t v34 = v46;
    sub_1C1EAEB98();
    uint64_t v48 = MEMORY[0x1E4FBC860];
    sub_1C1E89250((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
    sub_1C1E07320(0);
    sub_1C1E89250((unint64_t *)&qword_1EBB683D8, sub_1C1E07320);
    uint64_t v35 = v41;
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v34, v35, v31);
    _Block_release(v31);
    swift_release();

    (*(void (**)(char *, uint64_t))(v47 + 8))(v35, v7);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v42);
    return swift_release();
  }
  else
  {
    uint64_t aBlock = 0;
    uint64_t v50 = 0;
    LOBYTE(v51) = 1;
    return a1(&aBlock);
  }
}

uint64_t sub_1C1E87F2C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C1E87F6C(uint64_t (*a1)(void), uint64_t a2)
{
  return sub_1C1E879EC(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

void sub_1C1E87F78(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    sub_1C1E6E1A4();
    unint64_t v3 = sub_1C1EAE8E8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1C1E87FDC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C1E87F78(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C1E8802C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v8 = sub_1C1EAEB78();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v34 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1C1EAEBD8();
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  id v32 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C1EAEB88();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 24) = 0;
  *(void *)(v15 + 16) = 0;
  *(unsigned char *)(v15 + 32) = -1;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = v15 + 16;
  v16[5] = a5;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_1C1E8936C;
  *(void *)(v17 + 24) = v16;
  uint64_t v43 = sub_1C1DD885C;
  uint64_t v44 = v17;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v40 = 1107296256;
  id v29 = &v41;
  uint64_t v41 = sub_1C1DD8834;
  uint64_t v42 = &block_descriptor_22;
  unint64_t v18 = _Block_copy(&aBlock);
  id v19 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_performBlockAndWait_, v18);
  _Block_release(v18);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v18)
  {
    __break(1u);
  }
  else
  {
    swift_retain();
    sub_1C1EAE1B8();
    swift_release();
    uint64_t v21 = (void *)swift_allocObject();
    uint64_t v22 = v31;
    v21[2] = v30;
    v21[3] = v22;
    v21[4] = v15;
    sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68388);
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCB20], v11);
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v23 = (void *)sub_1C1EAF1B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_1C1E893C8;
    *(void *)(v24 + 24) = v21;
    uint64_t v43 = sub_1C1DD885C;
    uint64_t v44 = v24;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v40 = 1107296256;
    uint64_t v41 = sub_1C1DF5050;
    uint64_t v42 = &block_descriptor_31;
    uint64_t v25 = _Block_copy(&aBlock);
    swift_retain();
    id v26 = v32;
    sub_1C1EAEB98();
    uint64_t v38 = MEMORY[0x1E4FBC860];
    sub_1C1E89250((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
    sub_1C1E07320(0);
    sub_1C1E89250((unint64_t *)&qword_1EBB683D8, sub_1C1E07320);
    id v27 = v34;
    uint64_t v28 = v37;
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v26, v27, v25);
    _Block_release(v25);
    swift_release();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v28);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v35);
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1C1E885F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1C1EAE568();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE188();
  id v12 = objc_msgSend(*(id *)(a2 + 56), sel_profileIdentifier);
  uint64_t v13 = (void *)sub_1C1EAE178();

  uint64_t v14 = (void *)sub_1C1EADE58();
  if (v14)
  {
    uint64_t v48 = v9;
    swift_retain();
    sub_1C1EAE1A8();
    swift_release();
    uint64_t v15 = (uint64_t)v50;
    swift_retain();
    id v16 = a1;
    unint64_t v17 = sub_1C1E89594(v15, a2, (uint64_t)v16, a4);
    swift_bridgeObjectRelease();

    swift_release();
    id v18 = v14;
    sub_1C1E88E08(v14);
    id v47 = v18;

    AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.init(averageProbabilityOfPositiveInteractionForThisSession:interactedFeedItems:)(v17, (uint64_t *)&v50);
    uint64_t v20 = v50;
    id v19 = v51;
    sub_1C1EAE548();
    id v21 = v20;
    id v22 = v19;
    id v23 = v21;
    id v24 = v22;
    uint64_t v25 = sub_1C1EAE558();
    os_log_type_t v26 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v46 = (uint64_t)v20;
      uint64_t v28 = v27;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v49 = v44;
      uint64_t v50 = (void *)a4;
      *(_DWORD *)uint64_t v28 = 136446466;
      swift_getMetatypeMetadata();
      uint64_t v45 = v8;
      uint64_t v29 = sub_1C1EAED68();
      uint64_t v50 = (void *)sub_1C1DF8D44(v29, v30, &v49);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      uint64_t v50 = (void *)v46;
      id v51 = v24;
      id v31 = v23;
      id v32 = v24;
      uint64_t v33 = sub_1C1EAED68();
      uint64_t v50 = (void *)sub_1C1DF8D44(v33, v34, &v49);
      sub_1C1EAF2C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v25, v26, "[%{public}s]: highlights interaction analytics collected: %s", (uint8_t *)v28, 0x16u);
      uint64_t v35 = v44;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v35, -1, -1);
      uint64_t v36 = v28;
      uint64_t v20 = (void *)v46;
      MEMORY[0x1C874D2E0](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v45);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v8);
    }
    uint64_t v40 = *(void **)a3;
    uint64_t v41 = *(void **)(a3 + 8);
    *(void *)a3 = v20;
    *(void *)(a3 + 8) = v24;
    unsigned __int8 v42 = *(unsigned char *)(a3 + 16);
    *(unsigned char *)(a3 + 16) = 0;
    sub_1C1E89458(v40, v41, v42);
  }
  else
  {
    uint64_t v37 = *(void **)a3;
    uint64_t v38 = *(void **)(a3 + 8);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    unsigned __int8 v39 = *(unsigned char *)(a3 + 16);
    *(unsigned char *)(a3 + 16) = 1;
    sub_1C1E89458(v37, v38, v39);
  }
}

uint64_t sub_1C1E88A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v37 = a4;
  uint64_t v34 = type metadata accessor for ModelTrainingEvent();
  uint64_t v7 = MEMORY[0x1F4188790](v34);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t v12 = sub_1C1EAE568();
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 16), *(void *)(a2 + 40));
  sub_1C1DF9F8C(0, &qword_1EBB68248);
  uint64_t v15 = sub_1C1EAD548();
  if (v15)
  {
    id v16 = (void *)v15;
    sub_1C1EAE348();
    uint64_t v17 = swift_dynamicCastClass();
    if (v17)
    {
      id v18 = (void *)v17;
      sub_1C1E89470(a1, (uint64_t)v9);
      type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem(0);
      uint64_t v19 = swift_allocObject();
      sub_1C1E89470((uint64_t)v9, v19+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent);
      swift_retain();
      id v20 = objc_msgSend(v18, sel_sectionSortOrder);
      *(void *)(v19
                + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank) = v20;
      swift_release();
      uint64_t v21 = AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(v18);
      uint64_t result = sub_1C1E894D4((uint64_t)v9);
      goto LABEL_9;
    }
  }
  sub_1C1EAE548();
  sub_1C1E89470(a1, (uint64_t)v11);
  id v23 = sub_1C1EAE558();
  os_log_type_t v24 = sub_1C1EAF0B8();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v38 = v32;
    *(_DWORD *)uint64_t v25 = 136446466;
    uint64_t v39 = v33;
    swift_getMetatypeMetadata();
    uint64_t v33 = v4;
    uint64_t v26 = sub_1C1EAED68();
    uint64_t v39 = sub_1C1DF8D44(v26, v27, &v38);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    sub_1C1E89470((uint64_t)v11, (uint64_t)v9);
    uint64_t v28 = sub_1C1EAED68();
    uint64_t v39 = sub_1C1DF8D44(v28, v29, &v38);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    sub_1C1E894D4((uint64_t)v11);
    _os_log_impl(&dword_1C1DD2000, v23, v24, "[%{public}s]: unable to find feedItem for interaction: %s", (uint8_t *)v25, 0x16u);
    uint64_t v30 = v32;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v30, -1, -1);
    MEMORY[0x1C874D2E0](v25, -1, -1);
  }
  else
  {
    sub_1C1E894D4((uint64_t)v11);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v36);
  uint64_t v21 = 0;
LABEL_9:
  *uint64_t v37 = v21;
  return result;
}

uint64_t sub_1C1E88E08(void *a1)
{
  uint64_t v5 = type metadata accessor for ModelTrainingEvent();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v28 - v10;
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v30 = v1;
  v28[2] = OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager_trainingAnalyticsCache;
  unint64_t v29 = a1;
  swift_retain();
  sub_1C1EAE1A8();
  swift_release();
  uint64_t v12 = v34;
  uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v33 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v14 = *(void *)(v34 + 16);
  if (v14)
  {
    v28[1] = a1;
    unint64_t v15 = 0;
    uint64_t v31 = v14;
    uint64_t v32 = v6;
    while (v15 < *(void *)(v12 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v17 = *(void *)(v6 + 72);
      sub_1C1E89470(v12 + v16 + v17 * v15, (uint64_t)v11);
      if (v11[*(int *)(v5 + 24)] == 1)
      {
        uint64_t v18 = v5;
        sub_1C1E89530((uint64_t)v11, (uint64_t)v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1C1E221C4(0, v13[2] + 1, 1);
        }
        uint64_t v13 = v33;
        unint64_t v20 = v33[2];
        unint64_t v19 = v33[3];
        if (v20 >= v19 >> 1)
        {
          sub_1C1E221C4(v19 > 1, v20 + 1, 1);
          uint64_t v13 = v33;
        }
        v13[2] = v20 + 1;
        sub_1C1E89530((uint64_t)v9, (uint64_t)v13 + v16 + v20 * v17);
        uint64_t v5 = v18;
        uint64_t v14 = v31;
        uint64_t v6 = v32;
      }
      else
      {
        sub_1C1E894D4((uint64_t)v11);
      }
      if (v14 == ++v15)
      {
        uint64_t v13 = v33;
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v2 = v13[2];
    swift_release();
    uint64_t v21 = v30;
    swift_retain();
    sub_1C1EAE1A8();
    swift_release();
    uint64_t v22 = *(void *)(v34 + 16);
    swift_bridgeObjectRelease();
    double v3 = (double)v22;
    uint64_t v13 = v29;
    unint64_t v23 = sub_1C1EAE0C8();
    swift_retain();
    unint64_t v24 = sub_1C1E89714(v23, v21);
    swift_bridgeObjectRelease();
    swift_release();
    if (!(v24 >> 62))
    {
      uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_16;
    }
  }
  uint64_t v25 = sub_1C1EAF638();
LABEL_16:
  swift_bridgeObjectRelease();

  double v26 = v3 + (double)v25;
  if (v26 > 0.0)
  {
    *(double *)&uint64_t result = (double)v2 / v26;
    return result;
  }
LABEL_18:
  *(double *)&uint64_t result = 0.0;
  return result;
}

uint64_t sub_1C1E89120(void *a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = MEMORY[0x1E4FBC860];
  return result;
}

void sub_1C1E89154(void (*a1)(void *), uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  int v5 = *(unsigned __int8 *)(a3 + 32);
  if (v5 == 255)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = a3 + 16;
    uint64_t v6 = *(void **)(a3 + 16);
    uint64_t v7 = *(void **)(v8 + 8);
    v9[0] = v6;
    v9[1] = v7;
    char v10 = v5 & 1;
    sub_1C1E8940C(v6, v7, v5 & 1);
    a1(v9);
    sub_1C1E89458(v6, v7, v5);
  }
}

void sub_1C1E891F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C1E875A4(a1, a2, a3, *(void (**)(void))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1C1E891F8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C1E89240()
{
  return sub_1C1E8802C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1C1E89250(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C1E89298()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    sub_1C1E892E0(*(void **)(v0 + 16), *(void **)(v0 + 24), v1 & 1);
  }
  return MEMORY[0x1F4186498](v0, 33, 7);
}

void sub_1C1E892E0(void *a1, void *a2, char a3)
{
  if (a3)
  {
    sub_1C1E6CF54(a1);
  }
  else
  {
  }
}

uint64_t sub_1C1E8932C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C1E8936C()
{
  sub_1C1E885F4(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1C1E89378()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1E89388()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1C1E893C8()
{
  sub_1C1E89154(*(void (**)(void *))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1C1E893D4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1C1E8940C(void *a1, void *a2, char a3)
{
  if (a3)
  {
    return sub_1C1E6E878(a1);
  }
  else
  {
    id v5 = a1;
    return a2;
  }
}

void sub_1C1E89458(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    sub_1C1E892E0(a1, a2, a3 & 1);
  }
}

uint64_t sub_1C1E89470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelTrainingEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E894D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModelTrainingEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C1E89530(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelTrainingEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1E89594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v15 = MEMORY[0x1E4FBC860];
  if (v6)
  {
    uint64_t v9 = *(void *)(type metadata accessor for ModelTrainingEvent() - 8);
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v12 = sub_1C1E88A28(v10, a2, a4, &v14);
      if (v4)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      if (v14)
      {
        MEMORY[0x1C874C090](v12);
        if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C1EAEEE8();
        }
        sub_1C1EAEF18();
        sub_1C1EAEEB8();
      }
      v10 += v11;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t sub_1C1E89714(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v27 = a2;
  uint64_t v29 = sub_1C1EAD258();
  unint64_t v5 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8)
  {
    while (1)
    {
      uint64_t v21 = v3;
      unint64_t v9 = 0;
      uint64_t v25 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v26 = a1 & 0xC000000000000001;
      unint64_t v20 = a1;
      unint64_t v23 = a1 + 32;
      uint64_t v24 = OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager_trainingAnalyticsCache;
      uint64_t v10 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v22 = v8;
      while (v26)
      {
        id v11 = (id)MEMORY[0x1C874C6F0](v9, v20);
LABEL_9:
        uint64_t v12 = v11;
        if (__OFADD__(v9++, 1)) {
          goto LABEL_20;
        }
        swift_retain();
        sub_1C1EAE1A8();
        swift_release();
        a1 = v30;
        uint64_t v3 = *(uint64_t **)(v30 + 16);
        if (v3)
        {
          uint64_t v14 = *(void *)(type metadata accessor for ModelTrainingEvent() - 8);
          unint64_t v5 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
          uint64_t v15 = *(void *)(v14 + 72);
          unint64_t v28 = a1;
          swift_bridgeObjectRetain();
          do
          {
            id v16 = objc_msgSend(v12, sel_objectID);
            id v17 = objc_msgSend(v16, sel_URIRepresentation);

            sub_1C1EAD248();
            a1 = MEMORY[0x1C874A450](v5, v7);
            (*v10)(v7, v29);
            if (a1)
            {

              swift_bridgeObjectRelease_n();
              uint64_t v8 = v22;
              goto LABEL_5;
            }
            v5 += v15;
            uint64_t v3 = (uint64_t *)((char *)v3 - 1);
          }
          while (v3);
          swift_bridgeObjectRelease_n();
          uint64_t v8 = v22;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v3 = &v31;
        sub_1C1EAF518();
        unint64_t v5 = *(void *)(v31 + 16);
        sub_1C1EAF558();
        sub_1C1EAF568();
        sub_1C1EAF528();
LABEL_5:
        if (v9 == v8) {
          return v31;
        }
      }
      if (v9 < *(void *)(v25 + 16)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v8 = sub_1C1EAF638();
      if (!v8) {
        return MEMORY[0x1E4FBC860];
      }
    }
    id v11 = *(id *)(v23 + 8 * v9);
    goto LABEL_9;
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1C1E89A38(void *a1, void *a2, void *a3, int a4)
{
  LODWORD(v34) = a4;
  uint64_t v7 = sub_1C1EAD898();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  id v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v34 - v12;
  id v35 = (id)sub_1C1EAE348();
  uint64_t v14 = (void *)MEMORY[0x1C874B480]();
  id v15 = sub_1C1E8A1A0(a1, a2, a3, (char)v34);
  objc_msgSend(v14, sel_setPredicate_, v15);

  id v16 = objc_allocWithZone(MEMORY[0x1E4F29008]);
  id v17 = (void *)sub_1C1EAED28();
  id v18 = objc_msgSend(v16, sel_initWithKey_ascending_, v17, 0);

  sub_1C1DFD308(0, (unint64_t *)&qword_1EBB660F8, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1C1EB04A0;
  *(void *)(v19 + 32) = v18;
  uint64_t v37 = v19;
  sub_1C1EAEEB8();
  sub_1C1DF9F8C(0, &qword_1EBB68258);
  id v20 = v18;
  uint64_t v21 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setSortDescriptors_, v21);

  id v34 = v14;
  unint64_t v22 = sub_1C1EAF248();
  unint64_t v23 = v22;
  if (!(v22 >> 62))
  {
    uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v24) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();

    return MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_1C1EAF638();
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v37 = MEMORY[0x1E4FBC860];
  sub_1C1E220F4(0, v24 & ~(v24 >> 63), 0);
  if ((v24 & 0x8000000000000000) == 0)
  {
    id v35 = v20;
    uint64_t v25 = v37;
    if ((v23 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        MEMORY[0x1C874C6F0](i, v23);
        sub_1C1EAD838();
        uint64_t v37 = v25;
        unint64_t v28 = *(void *)(v25 + 16);
        unint64_t v27 = *(void *)(v25 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_1C1E220F4(v27 > 1, v28 + 1, 1);
          uint64_t v25 = v37;
        }
        *(void *)(v25 + 16) = v28 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v25+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v28, v13, v7);
      }
    }
    else
    {
      uint64_t v29 = (id *)(v23 + 32);
      do
      {
        id v30 = *v29;
        sub_1C1EAD838();
        uint64_t v37 = v25;
        unint64_t v32 = *(void *)(v25 + 16);
        unint64_t v31 = *(void *)(v25 + 24);
        if (v32 >= v31 >> 1)
        {
          sub_1C1E220F4(v31 > 1, v32 + 1, 1);
          uint64_t v25 = v37;
        }
        *(void *)(v25 + 16) = v32 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v25+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v32, v11, v7);
        ++v29;
        --v24;
      }
      while (v24);
    }

    swift_bridgeObjectRelease();
    return v25;
  }
  __break(1u);
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_1C1EAF4A8();
  sub_1C1EAEDB8();
  uint64_t v36 = v24;
  sub_1C1DF9148(0, (unint64_t *)&qword_1EBB68150);
  sub_1C1EAF5B8();
  uint64_t result = sub_1C1EAF628();
  __break(1u);
  return result;
}

uint64_t HealthExperienceStoreFeedItemContext.previousFeedItems(predicate:)(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v17 = MEMORY[0x1E4FBC860];
  uint64_t v10 = *(void **)(v4 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_storageContext);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &v17;
  *(void *)(v11 + 24) = v5;
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  *(void *)(v11 + 48) = a3;
  *(unsigned char *)(v11 + 56) = a4;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1C1E8A140;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_1C1DD885C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DD8834;
  aBlock[3] = &block_descriptor_9;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_1C1E543A4(a1, a2, a3, a4);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBlockAndWait_, v13);
  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = v17;
    swift_release();
    return v15;
  }
  return result;
}

uint64_t sub_1C1E8A0F8()
{
  swift_release();
  sub_1C1E544C8(*(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(unsigned char *)(v0 + 56));
  return MEMORY[0x1F4186498](v0, 57, 7);
}

uint64_t sub_1C1E8A140()
{
  int v1 = *(uint64_t **)(v0 + 16);
  *int v1 = sub_1C1E89A38(*(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(unsigned __int8 *)(v0 + 56));
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1E8A190()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1C1E8A1A0(void *a1, void *a2, void *a3, char a4)
{
  sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68238);
  sub_1C1DF32F0();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1C1EB0800;
  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  *(void *)(v7 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v9 = sub_1C1DF2A98();
  *(void *)(v7 + 64) = v9;
  strcpy((char *)(v7 + 32), "pluginPackage");
  *(_WORD *)(v7 + 46) = -4864;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo), *(void *)(v4 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo + 24));
  uint64_t v10 = sub_1C1EAD5B8();
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v9;
  *(void *)(v7 + 72) = v10;
  *(void *)(v7 + 80) = v11;
  uint64_t v12 = (void *)sub_1C1EAF018();
  sub_1C1DFD308(0, (unint64_t *)&qword_1EBB660F8, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1C1EB04A0;
  *(void *)(v13 + 32) = v12;
  uint64_t v42 = v13;
  sub_1C1EAEEB8();
  if (a4)
  {
    if (a4 == 1)
    {
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1C1EB0800;
      sub_1C1EAE348();
      uint64_t v15 = v12;
      id v16 = v12;
      swift_bridgeObjectRetain();
      sub_1C1E5440C(a3);
      uint64_t v17 = sub_1C1EAE308();
      *(void *)(v14 + 56) = v8;
      *(void *)(v14 + 64) = v9;
      *(void *)(v14 + 32) = v17;
      *(void *)(v14 + 40) = v18;
      *(void *)(v14 + 96) = v8;
      *(void *)(v14 + 104) = v9;
      *(void *)(v14 + 72) = a1;
      *(void *)(v14 + 80) = a2;
      id v19 = (id)sub_1C1EAF018();
      MEMORY[0x1C874C090]();
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C1EAEEE8();
      }
      sub_1C1EAEF18();
      sub_1C1EAEEB8();
      if (a3 == (void *)1)
      {

        uint64_t v12 = v15;
      }
      else
      {
        sub_1C1DFD308(0, (unint64_t *)&qword_1EBB68280, MEMORY[0x1E4F670C0], MEMORY[0x1E4FBBE00]);
        uint64_t v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = xmmword_1C1EB07F0;
        *(void *)(v28 + 32) = a3;
        id v29 = a3;
        MEMORY[0x1C874B550](v28);
        uint64_t v30 = swift_bridgeObjectRelease();
        MEMORY[0x1C874C090](v30);
        if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C1EAEEE8();
        }
        sub_1C1EAEF18();
        sub_1C1EAEEB8();

        sub_1C1E54530(a3);
        sub_1C1E54530(a3);
        uint64_t v12 = v15;
      }
    }
    else if (a1 == (void *)1)
    {
      id v27 = v12;
    }
    else
    {
      sub_1C1EAE348();
      sub_1C1DFD308(0, (unint64_t *)&qword_1EBB68280, MEMORY[0x1E4F670C0], MEMORY[0x1E4FBBE00]);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_1C1EB07F0;
      *(void *)(v34 + 32) = a1;
      id v35 = v12;
      sub_1C1E543A4(a1, a2, a3, 2);
      MEMORY[0x1C874B550](v34);
      uint64_t v36 = swift_bridgeObjectRelease();
      MEMORY[0x1C874C090](v36);
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C1EAEEE8();
      }
      sub_1C1EAEF18();
      sub_1C1EAEEB8();
    }
  }
  else
  {
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1C1EB0800;
    sub_1C1EAE348();
    id v21 = v12;
    swift_bridgeObjectRetain();
    sub_1C1E5440C(a2);
    uint64_t v22 = sub_1C1EAE308();
    *(void *)(v20 + 56) = v8;
    *(void *)(v20 + 64) = v9;
    *(void *)(v20 + 32) = v22;
    *(void *)(v20 + 40) = v23;
    uint64_t v24 = sub_1C1E30C64((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_1C1DFD308(0, (unint64_t *)&qword_1EBB68358, v8, MEMORY[0x1E4FBB320]);
    *(void *)(v20 + 96) = v25;
    *(void *)(v20 + 104) = sub_1C1E16EBC();
    *(void *)(v20 + 72) = v24;
    id v26 = (id)sub_1C1EAF018();
    MEMORY[0x1C874C090]();
    if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C1EAEEE8();
    }
    sub_1C1EAEF18();
    sub_1C1EAEEB8();
    if (a2 == (void *)1)
    {
    }
    else
    {
      sub_1C1DFD308(0, (unint64_t *)&qword_1EBB68280, MEMORY[0x1E4F670C0], MEMORY[0x1E4FBBE00]);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_1C1EB07F0;
      *(void *)(v31 + 32) = a2;
      id v32 = a2;
      MEMORY[0x1C874B550](v31);
      uint64_t v33 = swift_bridgeObjectRelease();
      MEMORY[0x1C874C090](v33);
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C1EAEEE8();
      }
      sub_1C1EAEF18();
      sub_1C1EAEEB8();

      sub_1C1E54530(a2);
      sub_1C1E54530(a2);
    }
  }
  uint64_t v37 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  id v38 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v37);

  return v38;
}

uint64_t RelevanceEngineCoordinator.sortedElements(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
  uint64_t v7 = sub_1C1E8C9FC(v5, v6, a2, a3);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t RelevanceEngineCoordinator.saveModelToDisk(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v58 = a1;
  uint64_t v59 = a2;
  uint64_t v7 = sub_1C1EAEB78();
  uint64_t v64 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v62 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1C1EAEBD8();
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v63);
  uint64_t v60 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v55 = v11;
  id v51 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1DFC4E4(0, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v49 - v13;
  uint64_t v15 = sub_1C1EAD258();
  uint64_t v66 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v49 - v19;
  id v21 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v57 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = (void *)v21(a3, a4);
  id v24 = objc_msgSend(v23, sel_configuration);

  id v25 = objc_msgSend(v24, sel_modelFileURL);
  if (v25)
  {
    uint64_t v65 = v7;
    sub_1C1EAD248();

    uint64_t v26 = v66;
    id v27 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
    v27(v14, v18, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v14, 0, 1, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v14, 1, v15) != 1)
    {
      uint64_t v28 = v20;
      uint64_t v53 = v20;
      id v29 = v14;
      uint64_t v30 = v15;
      uint64_t v49 = v15;
      uint64_t v50 = (void (*)(unint64_t, char *, uint64_t))v27;
      v27(v20, v29, v15);
      uint64_t v31 = v57;
      uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v57, v22);
      uint64_t v32 = v56;
      uint64_t v33 = v51;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v51, v4, v31);
      uint64_t v34 = v66;
      id v35 = v18;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v18, v28, v30);
      unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      unint64_t v37 = (v55 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v38 = (*(unsigned __int8 *)(v34 + 80) + v37 + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      uint64_t v39 = swift_allocObject();
      *(void *)(v39 + 16) = v31;
      *(void *)(v39 + 24) = v22;
      (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v39 + v36, v33, v31);
      uint64_t v40 = (void *)(v39 + v37);
      uint64_t v41 = v59;
      *uint64_t v40 = v58;
      v40[1] = v41;
      uint64_t v42 = v49;
      v50(v39 + v38, v35, v49);
      aBlock[4] = sub_1C1E8F0CC;
      aBlock[5] = v39;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1C1DF5050;
      aBlock[3] = &block_descriptor_10;
      uint64_t v43 = _Block_copy(aBlock);
      swift_retain();
      uint64_t v44 = v60;
      sub_1C1EAEB98();
      uint64_t v67 = MEMORY[0x1E4FBC860];
      sub_1C1E8F1E4();
      sub_1C1DFC4E4(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
      sub_1C1E4923C();
      uint64_t v45 = v62;
      uint64_t v46 = v65;
      sub_1C1EAF328();
      id v47 = (void *)v52;
      MEMORY[0x1C874C3B0](0, v44, v45, v43);
      _Block_release(v43);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v45, v46);
      (*(void (**)(char *, uint64_t))(v61 + 8))(v44, v63);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v53, v42);
      return swift_release();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v14, 1, 1, v15);
  }
  sub_1C1E8FDFC((uint64_t)v14, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0]);
  uint64_t result = sub_1C1EAF628();
  __break(1u);
  return result;
}

uint64_t sub_1C1E8AFC4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C1DFC4E4(0, (unint64_t *)&qword_1EBB682A8, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - v6;
  uint64_t v8 = sub_1C1EAD318();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E19BD8(a1, (uint64_t)v7, (unint64_t *)&qword_1EBB682A8, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    uint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C1E8FDFC((uint64_t)v7, (unint64_t *)&qword_1EBB682A8, MEMORY[0x1E4F27928]);
    objc_msgSend(v2, sel_setAttribute_forKey_, 0, *MEMORY[0x1E4F94A30]);
    return sub_1C1E8FDFC(a1, (unint64_t *)&qword_1EBB682A8, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v14 = (void *)sub_1C1EAD2C8();
    objc_msgSend(v2, sel_setAttribute_forKey_, v14, *MEMORY[0x1E4F94A30]);

    sub_1C1E8FDFC(a1, (unint64_t *)&qword_1EBB682A8, MEMORY[0x1E4F27928]);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t RelevanceEngineCoordinator.train(with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v55 = a5;
  uint64_t v60 = a3;
  uint64_t v58 = a2;
  uint64_t v7 = sub_1C1EAEB88();
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C1EAE568();
  uint64_t v51 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_1C1EAEB78();
  uint64_t v59 = *(void *)(v57 - 8);
  MEMORY[0x1F4188790](v57);
  uint64_t v56 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C1EAEBD8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = *(void *)(a4 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v61 = v21;
  uint64_t v62 = v19;
  if (v20)
  {
    uint64_t v22 = a1;
    uint64_t v23 = v54;
    uint64_t v24 = v55;
    id v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(a4, v55);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v23, a4);
    unint64_t v26 = (*(unsigned __int8 *)(v17 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    id v27 = (char *)swift_allocObject();
    *((void *)v27 + 2) = a4;
    *((void *)v27 + 3) = v24;
    *((void *)v27 + 4) = v22;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v27[v26], (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
    uint64_t v28 = (uint64_t *)&v27[(v18 + v26 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v29 = v58;
    uint64_t v30 = v60;
    *uint64_t v28 = v58;
    v28[1] = v30;
    v68 = sub_1C1E8F318;
    v69 = v27;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v65 = 1107296256;
    uint64_t v66 = sub_1C1DF5050;
    uint64_t v67 = &block_descriptor_6_0;
    uint64_t v31 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    sub_1C1E16DEC(v29);
    uint64_t v32 = v61;
    sub_1C1EAEB98();
    uint64_t v63 = MEMORY[0x1E4FBC860];
    sub_1C1E8F1E4();
    sub_1C1DFC4E4(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1C1E4923C();
    uint64_t v34 = v56;
    uint64_t v33 = v57;
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v32, v34, v31);
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v33);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v32, v62);
  }
  else
  {
    uint64_t v36 = v51;
    uint64_t v35 = v52;
    uint64_t v37 = v10;
    uint64_t v55 = v15;
    uint64_t v39 = v56;
    uint64_t v38 = v57;
    sub_1C1EAE508();
    uint64_t v40 = sub_1C1EAE558();
    os_log_type_t v41 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_1C1DD2000, v40, v41, "RelevanceEngineCoordinator: No training events resolved, completing without any training", v42, 2u);
      MEMORY[0x1C874D2E0](v42, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
    sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68388);
    uint64_t v43 = v53;
    (*(void (**)(char *, void, uint64_t))(v35 + 104))(v9, *MEMORY[0x1E4FBCB48], v53);
    uint64_t v44 = (void *)sub_1C1EAF1B8();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v43);
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = v58;
    uint64_t v47 = v60;
    *(void *)(v45 + 16) = v58;
    *(void *)(v45 + 24) = v47;
    v68 = sub_1C1E5B058;
    v69 = (void *)v45;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v65 = 1107296256;
    uint64_t v66 = sub_1C1DF5050;
    uint64_t v67 = &block_descriptor_12;
    uint64_t v48 = _Block_copy(&aBlock);
    sub_1C1E16DEC(v46);
    uint64_t v49 = v61;
    sub_1C1EAEB98();
    uint64_t v63 = MEMORY[0x1E4FBC860];
    sub_1C1E8F1E4();
    sub_1C1DFC4E4(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1C1E4923C();
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v49, v39, v48);
    _Block_release(v48);

    (*(void (**)(char *, uint64_t))(v59 + 8))(v39, v38);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v49, v62);
  }
  return swift_release();
}

uint64_t RelevanceEngineCoordinator.resumeEngineIfNeeded(feedKinds:completion:)(uint64_t a1, void (*a2)(uint64_t), void (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x1E4FBC860];
  if (v7)
  {
    uint64_t v18 = a4;
    uint64_t v19 = a5;
    sub_1C1DE1100(0, v7, 0);
    uint64_t v8 = v20;
    uint64_t v10 = a1 + 32;
    do
    {
      ++v10;
      uint64_t v11 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
      uint64_t v13 = v12;
      unint64_t v15 = *(void *)(v20 + 16);
      unint64_t v14 = *(void *)(v20 + 24);
      if (v15 >= v14 >> 1) {
        sub_1C1DE1100(v14 > 1, v15 + 1, 1);
      }
      *(void *)(v20 + 16) = v15 + 1;
      unint64_t v16 = v20 + 16 * v15;
      *(void *)(v16 + 32) = v11;
      *(void *)(v16 + 40) = v13;
      --v7;
    }
    while (v7);
    a5 = v19;
    a4 = v18;
  }
  RelevanceEngineCoordinator.resumeEngineIfNeeded(sectionIdentifiers:completion:)(v8, a2, a3, a4, a5);
  return swift_bridgeObjectRelease();
}

id static RERule.makeSortByValueOfFeatureRule(feature:order:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_conditionHasValueForFeature_, a1);
  id v5 = objc_msgSend(self, sel_conditionForLeftFeature_relation_rightFeature_, a1, 2, a1);
  id v6 = objc_allocWithZone(MEMORY[0x1E4F94980]);
  id v7 = v4;
  id v8 = objc_msgSend(v6, sel_initWithLeftCondition_rightCondition_comparisonCondition_order_, v7, v7, v5, a2);

  return v8;
}

id static RERule.makeRankByPreferringValueForFeatureRule(feature:value:)(void *a1)
{
  id v1 = a1;
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_conditionForFeature_hasValue_, v1, v2);

  id v5 = objc_msgSend(v3, sel_notCondition_, v4);
  id v6 = objc_msgSend(self, sel_trueCondition);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F94980]), sel_initWithLeftCondition_rightCondition_comparisonCondition_order_, v4, v5, v6, 1);

  return v7;
}

void RelevanceEngineCoordinator.resumeEngineIfNeeded(sectionIdentifiers:completion:)(uint64_t a1, void (*a2)(uint64_t), void (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  v94 = a2;
  uint64_t v95 = a4;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x1F4188790](a1);
  uint64_t v13 = &v79[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  v88 = &v79[-v15];
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  v87 = &v79[-v17];
  MEMORY[0x1F4188790](v16);
  v86 = &v79[-v18];
  uint64_t v19 = sub_1C1EAE568();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v92 = v19;
  uint64_t v93 = v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v23 = &v79[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = MEMORY[0x1F4188790](v21);
  unint64_t v26 = &v79[-v25];
  MEMORY[0x1F4188790](v24);
  uint64_t v28 = &v79[-v27];
  uint64_t v89 = a1;
  uint64_t v29 = *(void *)(a1 + 16);
  uint64_t v91 = a5;
  if (!v29)
  {
    sub_1C1EAE508();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v13, v6, v95);
    uint64_t v43 = sub_1C1EAE558();
    os_log_type_t v44 = sub_1C1EAF0D8();
    if (!os_log_type_enabled(v43, v44))
    {
      (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v13, v95);

      uint64_t v69 = (*(uint64_t (**)(unsigned char *, uint64_t))(v93 + 8))(v23, v92);
      v94(v69);
      return;
    }
    uint64_t v45 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v89 = v46;
    v90 = a3;
    *(_DWORD *)uint64_t v45 = 136315394;
    uint64_t v47 = v95;
    uint64_t v96 = v95;
    aBlock[0] = v46;
    swift_getMetatypeMetadata();
    uint64_t v48 = sub_1C1EAED68();
    uint64_t v96 = sub_1C1DF8D44(v48, v49, aBlock);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    uint64_t v50 = (*(uint64_t (**)(uint64_t))(v91 + 48))(v47);
    uint64_t v96 = sub_1C1DF8D44(v50, v51, aBlock);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v13, v47);
    _os_log_impl(&dword_1C1DD2000, v43, v44, "[%s]%s: Attempting to resume engine without any section identifiers; aborting",
      (uint8_t *)v45,
      0x16u);
    uint64_t v52 = v89;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v52, -1, -1);
    MEMORY[0x1C874D2E0](v45, -1, -1);

    uint64_t v53 = (*(uint64_t (**)(unsigned char *, uint64_t))(v93 + 8))(v23, v92);
    goto LABEL_12;
  }
  v90 = a3;
  uint64_t v30 = v95;
  v85 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 16);
  uint64_t v31 = (void *)v85(v95, a5);
  unsigned int v32 = objc_msgSend(v31, sel_isRunning);

  uint64_t v33 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16);
  if (v32)
  {
    sub_1C1EAE508();
    uint64_t v34 = v86;
    (*v33)(v86, v6, v30);
    uint64_t v35 = sub_1C1EAE558();
    os_log_type_t v36 = sub_1C1EAF0B8();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v89 = swift_slowAlloc();
      aBlock[0] = v89;
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v38 = sub_1C1EAF908();
      uint64_t v96 = sub_1C1DF8D44(v38, v39, aBlock);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      uint64_t v40 = (*(uint64_t (**)(uint64_t))(v91 + 48))(v30);
      uint64_t v96 = sub_1C1DF8D44(v40, v41, aBlock);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v34, v30);
      _os_log_impl(&dword_1C1DD2000, v35, v36, "[%s%s]: resume() called, but engine already running!", (uint8_t *)v37, 0x16u);
      uint64_t v42 = v89;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v42, -1, -1);
      MEMORY[0x1C874D2E0](v37, -1, -1);
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v34, v30);
    }

    uint64_t v53 = (*(uint64_t (**)(unsigned char *, uint64_t))(v93 + 8))(v28, v92);
LABEL_12:
    v94(v53);
    return;
  }
  sub_1C1EAE508();
  uint64_t v54 = *v33;
  uint64_t v55 = v87;
  v86 = v6;
  uint64_t v84 = v10 + 16;
  v54(v87, v6, v30);
  uint64_t v56 = sub_1C1EAE558();
  os_log_type_t v57 = sub_1C1EAF0D8();
  int v58 = v57;
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v59 = swift_slowAlloc();
    v83 = v54;
    uint64_t v60 = v59;
    uint64_t v82 = swift_slowAlloc();
    aBlock[0] = v82;
    *(_DWORD *)uint64_t v60 = 136315650;
    os_log_t v81 = v56;
    uint64_t v61 = sub_1C1EAF908();
    uint64_t v96 = sub_1C1DF8D44(v61, v62, aBlock);
    int v80 = v58;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v60 + 12) = 2080;
    uint64_t v63 = v91;
    uint64_t v64 = (*(uint64_t (**)(uint64_t, uint64_t))(v91 + 48))(v95, v91);
    uint64_t v96 = sub_1C1DF8D44(v64, v65, aBlock);
    uint64_t v30 = v95;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v55, v30);
    *(_WORD *)(v60 + 22) = 2050;
    uint64_t v96 = 0x4024000000000000;
    sub_1C1EAF2C8();
    os_log_t v66 = v81;
    _os_log_impl(&dword_1C1DD2000, v81, (os_log_type_t)v80, "[%s]%s: Resuming engine with timeout %{public}f!", (uint8_t *)v60, 0x20u);
    uint64_t v67 = v82;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v67, -1, -1);
    uint64_t v68 = v60;
    uint64_t v54 = v83;
    MEMORY[0x1C874D2E0](v68, -1, -1);

    (*(void (**)(unsigned char *, uint64_t))(v93 + 8))(v26, v92);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v55, v30);

    (*(void (**)(unsigned char *, uint64_t))(v93 + 8))(v26, v92);
    uint64_t v63 = v91;
  }
  v70 = v86;
  v71 = (void *)v85(v30, v63);
  v72 = v88;
  v54(v88, v70, v30);
  unint64_t v73 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v74 = (v11 + v73 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v75 = swift_allocObject();
  *(void *)(v75 + 16) = v30;
  *(void *)(v75 + 24) = v63;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v10 + 32))(v75 + v73, v72, v30);
  *(void *)(v75 + v74) = v89;
  v76 = (void (**)(uint64_t))(v75 + ((v74 + 15) & 0xFFFFFFFFFFFFFFF8));
  v77 = v90;
  *v76 = v94;
  v76[1] = v77;
  aBlock[4] = (uint64_t)sub_1C1E8F8DC;
  aBlock[5] = v75;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1C1DF5050;
  aBlock[3] = (uint64_t)&block_descriptor_27;
  v78 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v71, sel_resumeWithTimeout_completion_, v78, 10.0);
  _Block_release(v78);
}

uint64_t sub_1C1E8C608(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C1EAE568();
  uint64_t v40 = *(void *)(v14 - 8);
  uint64_t v41 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, a5);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_1C1EAE558();
  os_log_type_t v18 = sub_1C1EAF0D8();
  int v39 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v38 = a3;
    uint64_t v20 = v19;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v43 = v35;
    *(_DWORD *)uint64_t v20 = 136315650;
    os_log_t v34 = v17;
    uint64_t v21 = sub_1C1EAF908();
    uint64_t v37 = a4;
    uint64_t v42 = sub_1C1DF8D44(v21, v22, &v43);
    uint64_t v36 = a1;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 48))(a5, a6);
    uint64_t v42 = sub_1C1DF8D44(v23, v24, &v43);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a5);
    *(_WORD *)(v20 + 22) = 2082;
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = MEMORY[0x1C874C0C0](v25, MEMORY[0x1E4FBB1A0]);
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_1C1DF8D44(v26, v28, &v43);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v29 = v34;
    _os_log_impl(&dword_1C1DD2000, v34, (os_log_type_t)v39, "[%s]%s: Engine has completed calculations for sections %{public}s!", (uint8_t *)v20, 0x20u);
    uint64_t v30 = v35;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v30, -1, -1);
    uint64_t v31 = v20;
    a3 = v38;
    MEMORY[0x1C874D2E0](v31, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a5);

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v16, v41);
  unsigned int v32 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a5, a6);
  objc_msgSend(v32, sel_pause);

  return a3();
}

uint64_t sub_1C1E8C9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a1;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](a1);
  uint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1E4FBC860];
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v12, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a3);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v15 = (v9 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v16 + v14, v10, a3);
  uint64_t v17 = (void *)(v16 + v15);
  *uint64_t v17 = v22;
  v17[1] = a2;
  *(void *)(v16 + ((v15 + 23) & 0xFFFFFFFFFFFFFFF8)) = &v24;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_1C1E8FF14;
  *(void *)(v18 + 24) = v16;
  aBlock[4] = sub_1C1DD885C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DD8834;
  aBlock[3] = &block_descriptor_60;
  uint64_t v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v13, v19);

  _Block_release(v19);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v21 = v24;
    swift_release();
    return v21;
  }
  return result;
}

void sub_1C1E8CC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a5;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 16);
  uint64_t v23 = a1;
  uint64_t v10 = (void *)v9(a5, a6);
  uint64_t v11 = (void *)sub_1C1EAED28();
  unint64_t v12 = (unint64_t)objc_msgSend(v10, sel_numberOfElementsInSection_, v11);

  if ((v12 & 0x8000000000000000) == 0)
  {
    unint64_t v14 = MEMORY[0x1E4FBC860];
    if (!v12)
    {
LABEL_8:
      MEMORY[0x1F4188790](v13);
      v20[2] = v7;
      v20[3] = a6;
      v20[4] = v23;
      uint64_t v19 = sub_1C1E81488((void (*)(uint64_t *__return_ptr, id *))sub_1C1E8FF9C, (uint64_t)v20, v14);
      swift_bridgeObjectRelease();
      *a4 = v19;
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v21 = v7;
    uint64_t v22 = a4;
    unint64_t v24 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1C1EAF548();
    unint64_t v15 = 0;
    while ((char *)v12 != v15)
    {
      id v16 = objc_allocWithZone(MEMORY[0x1E4F949C0]);
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)sub_1C1EAED28();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(v16, sel_initWithSectionName_element_, v17, v15);

      if (!v18) {
        goto LABEL_11;
      }
      ++v15;
      sub_1C1EAF518();
      sub_1C1EAF558();
      sub_1C1EAF568();
      sub_1C1EAF528();
      if ((char *)v12 == v15)
      {
        unint64_t v14 = v24;
        uint64_t v13 = swift_bridgeObjectRelease();
        uint64_t v7 = v21;
        a4 = v22;
        goto LABEL_8;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void *RelevanceEngineCoordinator.element(for:in:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = RelevanceEngineCoordinator.sortedElements(for:)(a2, a3, a4);
  id v6 = a1;
  uint64_t v7 = sub_1C1E8F674(v5, v6);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t RelevanceEngineCoordinator.collectDiagnosticLogs(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v7 = sub_1C1EAEB78();
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C1EAEBD8();
  uint64_t v27 = *(void *)(v10 - 8);
  uint64_t v28 = v10;
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a3 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a3);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v17 + v16, (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  id v18 = (void *)(v17 + ((v15 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v19 = v25;
  *id v18 = v24;
  v18[1] = v19;
  aBlock[4] = sub_1C1E8F9F4;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DF5050;
  aBlock[3] = &block_descriptor_33_0;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  sub_1C1EAEB98();
  uint64_t v30 = MEMORY[0x1E4FBC860];
  sub_1C1E8F1E4();
  sub_1C1DFC4E4(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1E4923C();
  sub_1C1EAF328();
  uint64_t v21 = (void *)v26;
  MEMORY[0x1C874C3B0](0, v13, v9, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
  return swift_release();
}

void sub_1C1E8D270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  v10[4] = sub_1C1E8FCC4;
  v10[5] = v8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1C1E8D46C;
  v10[3] = &block_descriptor_48;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_storeDiagnosticLogsToFile_, v9);
  _Block_release(v9);
}

uint64_t sub_1C1E8D378(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v4 = sub_1C1EAD258();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAD1D8();
  a3(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1C1E8D46C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_1C1EAED38();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void RelevanceEngineCoordinator.submitTraining(trainingEvents:store:completion:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = a6;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t v34 = a1;
  uint64_t v8 = sub_1C1EAE568();
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a5 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v9);
  id v14 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v15 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  unsigned __int8 v16 = objc_msgSend(v14, sel_BOOLForKey_, v15);

  if (v16)
  {
    uint64_t v17 = v31;
    sub_1C1EAE508();
    id v18 = sub_1C1EAE558();
    os_log_type_t v19 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1C1DD2000, v18, v19, "disablePersonalizedModelTraining default detected; training will be ignored",
        v20,
        2u);
      MEMORY[0x1C874D2E0](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v8);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    uint64_t v21 = (void *)sub_1C1EAD538();
    sub_1C1DFE408((uint64_t)a2, (uint64_t)v38);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v32, a5);
    unint64_t v22 = (*(unsigned __int8 *)(v12 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v23 = (char *)swift_allocObject();
    uint64_t v24 = v33;
    uint64_t v25 = v34;
    *((void *)v23 + 2) = a5;
    *((void *)v23 + 3) = v24;
    *((void *)v23 + 4) = v25;
    sub_1C1DFE46C(v38, (uint64_t)(v23 + 40));
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v23[v22], (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
    uint64_t v26 = (uint64_t *)&v23[(v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v28 = v35;
    uint64_t v27 = v36;
    *uint64_t v26 = v35;
    v26[1] = v27;
    aBlock[4] = sub_1C1E8FB44;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C1DF5050;
    aBlock[3] = &block_descriptor_39;
    uint64_t v29 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    sub_1C1E16DEC(v28);
    swift_release();
    objc_msgSend(v21, sel_performBlock_, v29);
    _Block_release(v29);
  }
}

unint64_t static RelevanceEngineCoordinator.disableModelTrainingKey.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_1C1E8D89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[2] = a2;
  unint64_t v11 = sub_1C1E81628((void (*)(uint64_t))sub_1C1E8FC70, (uint64_t)v13, a1);
  RelevanceEngineCoordinator.train(with:completion:)(v11, a4, a5, a6, a7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1E8D930@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v5 = type metadata accessor for ModelTrainingEvent();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v29 = (uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C1EAE568();
  uint64_t v28 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v30 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v9 = (void *)sub_1C1EAD538();
  sub_1C1EAE348();
  uint64_t v10 = (void *)sub_1C1EAD548();

  if (v10)
  {
    sub_1C1E1D1B8();
    uint64_t v12 = v11;
    uint64_t v13 = v31;
    uint64_t v14 = (uint64_t)v31 + *(int *)(v11 + 48);
    id v15 = sub_1C1E1FD94();

    *uint64_t v13 = v15;
    sub_1C1E8FCCC(a1, v14, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
    return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v13, 0, 1, v12);
  }
  else
  {
    uint64_t v27 = v7;
    sub_1C1EAE508();
    sub_1C1E8FCCC(a1, v29, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
    uint64_t v17 = sub_1C1EAE558();
    os_log_type_t v18 = sub_1C1EAF0B8();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v33 = v20;
      *(_DWORD *)os_log_type_t v19 = 136315138;
      uint64_t v21 = v29;
      uint64_t v22 = sub_1C1EAD1C8();
      uint64_t v32 = sub_1C1DF8D44(v22, v23, &v33);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      sub_1C1E8FD9C(v21, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      _os_log_impl(&dword_1C1DD2000, v17, v18, "Training event received for feedItem no longer present in the database: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v20, -1, -1);
      MEMORY[0x1C874D2E0](v19, -1, -1);
    }
    else
    {
      sub_1C1E8FD9C(v29, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
    uint64_t v24 = v31;
    sub_1C1E1D1B8();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
  }
}

void sub_1C1E8DD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v163 = a6;
  uint64_t v162 = a5;
  uint64_t v161 = a2;
  uint64_t v141 = sub_1C1EAD318();
  uint64_t v9 = *(void *)(v141 - 8);
  MEMORY[0x1F4188790](v141);
  v140 = (char *)&v132 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_1C1EAE568();
  uint64_t v11 = *(void *)(v160 - 8);
  MEMORY[0x1F4188790](v160);
  uint64_t v13 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E1D1B8();
  uint64_t v15 = v14;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  v159 = (uint64_t *)((char *)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  v139 = (uint64_t *)((char *)&v132 - v19);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  unint64_t v23 = (char *)&v132 - v22;
  uint64_t v24 = MEMORY[0x1F4188790](v21);
  uint64_t v26 = (char *)&v132 - v25;
  uint64_t v27 = MEMORY[0x1F4188790](v24);
  v158 = (uint64_t *)((char *)&v132 - v28);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  uint64_t v180 = (uint64_t)&v132 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  v179 = (uint64_t *)((char *)&v132 - v32);
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  v157 = (uint64_t *)((char *)&v132 - v34);
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  MEMORY[0x1F4188790](v35);
  uint64_t v37 = MEMORY[0x1F4188790]((char *)&v132 - v36);
  v156 = (uint64_t *)((char *)&v132 - v38);
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  uint64_t v40 = MEMORY[0x1F4188790](v39);
  uint64_t v41 = MEMORY[0x1F4188790](v40);
  v155 = (uint64_t *)((char *)&v132 - v42);
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  uint64_t v45 = (uint64_t *)((char *)&v132 - v44);
  uint64_t v46 = (void *)MEMORY[0x1F4188790](v43);
  if (*(void *)(a1 + 16))
  {
    uint64_t v174 = *(void *)(a1 + 16);
    v175 = v48;
    uint64_t v176 = v47;
    v177 = v46;
    uint64_t v178 = v52;
    v168 = v51;
    uint64_t v133 = a3;
    uint64_t v134 = a4;
    uint64_t v53 = *(int *)(v15 + 48);
    v153 = (void **)((char *)&v132 - v50);
    uint64_t v152 = (uint64_t)&v132 + v53 - v50;
    v150 = *(uint64_t (**)(uint64_t, uint64_t))(v163 + 32);
    uint64_t v151 = v163 + 32;
    v148 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v163 + 40);
    uint64_t v149 = v163 + 40;
    uint64_t v54 = a1 + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80));
    uint64_t v147 = *(void *)(v49 + 72);
    v146 = (void (**)(char *, uint64_t))(v11 + 8);
    v145 = aBlock;
    v138 = (void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v137 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v132 = a1;
    swift_bridgeObjectRetain();
    *(void *)&long long v55 = 136315906;
    long long v136 = v55;
    uint64_t v135 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v56 = v13;
    v169 = v13;
    os_log_type_t v57 = v26;
    uint64_t v58 = (uint64_t)v23;
    v166 = v23;
    uint64_t v59 = (uint64_t)v57;
    v165 = v57;
    uint64_t v167 = v15;
    v154 = v45;
    do
    {
      uint64_t v173 = v54;
      uint64_t v61 = v153;
      sub_1C1E8FCCC(v54, (uint64_t)v153, (uint64_t (*)(void))sub_1C1E1D1B8);
      uint64_t v62 = (uint64_t)v45 + *(int *)(v15 + 48);
      uint64_t v63 = *v61;
      *uint64_t v45 = v63;
      sub_1C1E8FD34(v152, v62, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      id v64 = v63;
      sub_1C1EAE508();
      unint64_t v65 = v56;
      uint64_t v66 = (uint64_t)v155;
      uint64_t v67 = (uint64_t)v155 + *(int *)(v15 + 48);
      void *v155 = v64;
      sub_1C1E8FCCC(v62, v67, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      sub_1C1E8FCCC(v66, (uint64_t)v175, (uint64_t (*)(void))sub_1C1E1D1B8);
      sub_1C1E8FD34(v66, v176, (uint64_t (*)(void))sub_1C1E1D1B8);
      uint64_t v68 = (uint64_t)v156;
      uint64_t v69 = (uint64_t)v156 + *(int *)(v15 + 48);
      void *v156 = v64;
      sub_1C1E8FCCC(v62, v69, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      v70 = v177;
      sub_1C1E8FCCC(v68, (uint64_t)v177, (uint64_t (*)(void))sub_1C1E1D1B8);
      sub_1C1E8FD34(v68, v178, (uint64_t (*)(void))sub_1C1E1D1B8);
      uint64_t v71 = (uint64_t)v157;
      uint64_t v72 = (uint64_t)v157 + *(int *)(v15 + 48);
      void *v157 = v64;
      sub_1C1E8FCCC(v62, v72, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      sub_1C1E8FCCC(v71, (uint64_t)v179, (uint64_t (*)(void))sub_1C1E1D1B8);
      sub_1C1E8FD34(v71, v180, (uint64_t (*)(void))sub_1C1E1D1B8);
      uint64_t v73 = (uint64_t)v158;
      uint64_t v74 = (uint64_t)v158 + *(int *)(v15 + 48);
      void *v158 = v64;
      uint64_t v172 = v62;
      sub_1C1E8FCCC(v62, v74, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      sub_1C1E8FCCC(v73, v59, (uint64_t (*)(void))sub_1C1E1D1B8);
      sub_1C1E8FD34(v73, v58, (uint64_t (*)(void))sub_1C1E1D1B8);
      id v171 = v64;
      uint64_t v75 = sub_1C1EAE558();
      os_log_type_t v76 = sub_1C1EAF0D8();
      int v77 = v76;
      v170 = v75;
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v78 = swift_slowAlloc();
        v164 = (void *)swift_slowAlloc();
        uint64_t v144 = swift_slowAlloc();
        aBlock[0] = v144;
        *(_DWORD *)uint64_t v78 = v136;
        int v143 = v77;
        uint64_t v79 = *(int *)(v15 + 48);
        int v80 = v168;
        uint64_t v81 = (uint64_t)v168 + v79;
        uint64_t v82 = v175;
        uint64_t v83 = (uint64_t)v175 + v79;
        uint64_t v84 = (void *)*v175;
        void *v168 = *v175;
        sub_1C1E8FCCC(v83, (uint64_t)v80 + v79, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        id v85 = objc_msgSend(v84, sel_identifier);
        uint64_t v86 = sub_1C1EAED38();
        unint64_t v88 = v87;

        sub_1C1E8FD9C(v81, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        uint64_t v181 = sub_1C1DF8D44(v86, v88, aBlock);
        sub_1C1EAF2C8();
        swift_bridgeObjectRelease();
        sub_1C1E8FD9C(v176, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C((uint64_t)v82, (uint64_t (*)(void))sub_1C1E1D1B8);
        *(_WORD *)(v78 + 12) = 2114;
        uint64_t v142 = v78 + 14;
        uint64_t v89 = v167;
        uint64_t v90 = *(int *)(v167 + 48);
        uint64_t v91 = (uint64_t)v80 + v90;
        uint64_t v92 = (uint64_t)v177 + v90;
        *int v80 = *v177;
        sub_1C1E8FCCC(v92, (uint64_t)v80 + v90, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        uint64_t v93 = (int *)type metadata accessor for ModelTrainingEvent();
        v94 = v140;
        uint64_t v95 = v141;
        (*v138)(v140, v91 + v93[7], v141);
        sub_1C1E8FD9C(v91, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        uint64_t v96 = sub_1C1EAD2C8();
        v97 = v94;
        uint64_t v98 = v89;
        (*v137)(v97, v95);
        uint64_t v181 = v96;
        sub_1C1EAF2C8();
        void *v164 = v96;
        sub_1C1E8FD9C(v178, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C((uint64_t)v177, (uint64_t (*)(void))sub_1C1E1D1B8);
        *(_WORD *)(v78 + 22) = 2082;
        uint64_t v99 = *(int *)(v89 + 48);
        uint64_t v100 = (uint64_t)v80 + v99;
        v101 = v179;
        uint64_t v102 = (uint64_t)v179 + v99;
        *int v80 = *v179;
        sub_1C1E8FCCC(v102, (uint64_t)v80 + v99, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        int v103 = *(unsigned __int8 *)(v100 + v93[6]);
        sub_1C1E8FD9C(v100, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        if (v103) {
          uint64_t v104 = 1702195828;
        }
        else {
          uint64_t v104 = 0x65736C6166;
        }
        if (v103) {
          unint64_t v105 = 0xE400000000000000;
        }
        else {
          unint64_t v105 = 0xE500000000000000;
        }
        uint64_t v181 = sub_1C1DF8D44(v104, v105, aBlock);
        sub_1C1EAF2C8();
        swift_bridgeObjectRelease();
        sub_1C1E8FD9C(v180, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C((uint64_t)v101, (uint64_t (*)(void))sub_1C1E1D1B8);
        *(_WORD *)(v78 + 32) = 2082;
        uint64_t v106 = *(int *)(v98 + 48);
        uint64_t v107 = (uint64_t)v139 + v106;
        uint64_t v108 = (uint64_t)v165;
        uint64_t v109 = (uint64_t)v165 + v106;
        void *v139 = *v165;
        sub_1C1E8FCCC(v109, v107, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        int v110 = *(unsigned __int8 *)(v107 + v93[5]);
        sub_1C1E8FD9C(v107, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
        if (v110) {
          uint64_t v111 = 0x6C6C657764;
        }
        else {
          uint64_t v111 = 7364980;
        }
        if (v110) {
          unint64_t v112 = 0xE500000000000000;
        }
        else {
          unint64_t v112 = 0xE300000000000000;
        }
        uint64_t v181 = sub_1C1DF8D44(v111, v112, aBlock);
        sub_1C1EAF2C8();
        swift_bridgeObjectRelease();
        sub_1C1E8FD9C((uint64_t)v166, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C(v108, (uint64_t (*)(void))sub_1C1E1D1B8);
        v113 = v170;
        _os_log_impl(&dword_1C1DD2000, v170, (os_log_type_t)v143, "RelevanceEngineCoordinator: submitting training for feedItem %s at time %{public}@, positive: %{public}s, feedbackKind: %{public}s", (uint8_t *)v78, 0x2Au);
        sub_1C1E1699C();
        v114 = v164;
        swift_arrayDestroy();
        MEMORY[0x1C874D2E0](v114, -1, -1);
        uint64_t v115 = v144;
        swift_arrayDestroy();
        MEMORY[0x1C874D2E0](v115, -1, -1);
        MEMORY[0x1C874D2E0](v78, -1, -1);

        (*v146)(v169, v160);
      }
      else
      {
        sub_1C1E8FD9C(v176, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C((uint64_t)v175, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C(v178, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C((uint64_t)v70, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C(v180, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C((uint64_t)v179, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C(v58, (uint64_t (*)(void))sub_1C1E1D1B8);
        sub_1C1E8FD9C(v59, (uint64_t (*)(void))sub_1C1E1D1B8);

        (*v146)(v65, v160);
        uint64_t v98 = v15;
      }
      uint64_t v116 = v162;
      uint64_t v117 = v163;
      v118 = (void *)v150(v162, v163);
      uint64_t v119 = *(int *)(v98 + 48);
      v120 = v159;
      uint64_t v121 = (uint64_t)v159 + v119;
      v122 = v171;
      uint64_t v123 = v172;
      void *v159 = v171;
      sub_1C1E8FCCC(v123, (uint64_t)v120 + v119, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      uint64_t v124 = type metadata accessor for ModelTrainingEvent();
      LODWORD(v170) = *(unsigned __int8 *)(v121 + *(int *)(v124 + 24));
      sub_1C1E8FD9C(v121, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      uint64_t v125 = *(int *)(v98 + 48);
      v126 = v168;
      uint64_t v127 = (uint64_t)v168 + v125;
      void *v168 = v122;
      sub_1C1E8FCCC(v123, (uint64_t)v126 + v125, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      LOBYTE(v123) = *(unsigned char *)(v127 + *(int *)(v124 + 20));
      sub_1C1E8FD9C(v127, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
      LOBYTE(aBlock[0]) = v123;
      v128 = (void *)v148(aBlock, v116, v117);
      id v129 = objc_msgSend(v128, sel_name);

      if (!v129)
      {
        sub_1C1EAED38();
        id v129 = (id)sub_1C1EAED28();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v118, sel_trainWithUnmanagedElement_isPositiveEvent_interaction_, v122, v170, v129);

      uint64_t v45 = v154;
      sub_1C1E8FD9C((uint64_t)v154, (uint64_t (*)(void))sub_1C1E1D1B8);
      uint64_t v54 = v173 + v147;
      BOOL v60 = v174-- == 1;
      uint64_t v56 = v169;
      uint64_t v15 = v167;
      uint64_t v58 = (uint64_t)v166;
      uint64_t v59 = (uint64_t)v165;
    }
    while (!v60);
    swift_bridgeObjectRelease();
    a4 = v134;
    a3 = v133;
  }
  v130 = (void *)(*(uint64_t (**)(uint64_t))(v163 + 16))(v162);
  if (a3)
  {
    aBlock[4] = a3;
    aBlock[5] = a4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C1DF5050;
    aBlock[3] = (uint64_t)&block_descriptor_51;
    v131 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v131 = 0;
  }
  objc_msgSend(v130, sel_trainPendingEventsWithCompletion_, v131);
  _Block_release(v131);
}

id RelevanceEngineCoordinator.computeAdHocRelevancePrediction(for:referenceDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C1DFC4E4(0, (unint64_t *)&qword_1EBB682A8, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  sub_1C1E19BD8(a2, (uint64_t)v12, (unint64_t *)&qword_1EBB682A8, v9);
  sub_1C1E8AFC4((uint64_t)v12);

  id v14 = sub_1C1E1FD94();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v16 = (void *)v15(a3, a4);
  objc_msgSend(v16, sel_addElement_section_, v14, *MEMORY[0x1E4F94A10]);

  uint64_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  sub_1C1DFD2C0(0, &qword_1EBB683A8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1C1EB07F0;
  *(void *)(v18 + 32) = sub_1C1EAED38();
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  uint64_t v21 = v17;
  RelevanceEngineCoordinator.resumeEngineIfNeeded(sectionIdentifiers:completion:)(v18, (void (*)(uint64_t))sub_1C1E8FBF0, (void (*)(uint64_t))v20, a3, a4);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C1EAF138();
  uint64_t v22 = (void *)v15(a3, a4);
  id v23 = objc_msgSend(v22, sel_predictionForElement_, v14);

  uint64_t v24 = (void *)v15(a3, a4);
  objc_msgSend(v24, sel_removeElement_, v14);

  sub_1C1E8EE5C(v5, a3, a4);
  return v23;
}

void sub_1C1E8EE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C1DFC4E4(0, (unint64_t *)&qword_1EBB682A8, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  uint64_t v9 = sub_1C1EAD318();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  sub_1C1E8AFC4((uint64_t)v7);
}

uint64_t sub_1C1E8EF6C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_1C1EAD258();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x1F4186498](v0, v10, v11);
}

uint64_t sub_1C1E8F0CC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v3 = (*(void *)(*(void *)(v1 - 8) + 64)
      + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(sub_1C1EAD258() - 8);
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + v3);
  uint64_t v6 = v0 + ((v3 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  objc_msgSend(v7, sel_saveModelFile);

  return v5(v6);
}

unint64_t sub_1C1E8F1E4()
{
  unint64_t result = qword_1EBB683C8;
  if (!qword_1EBB683C8)
  {
    sub_1C1EAEB78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB683C8);
  }
  return result;
}

uint64_t sub_1C1E8F23C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  if (*(void *)(v0 + v5)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v5 + 16, v3 | 7);
}

void sub_1C1E8F318()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80);
  uint64_t v2 = (uint64_t *)((char *)v0 + ((*(void *)(*(void *)(v0[2] - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1C1E8DD04(v0[4], (uint64_t)v0 + v1, *v2, v2[1], v0[2], v0[3]);
}

uint64_t sub_1C1E8F388()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id static RERule.makeRankByPreferringPresenceOfFeatureRule(feature:)(uint64_t a1)
{
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_conditionHasValueForFeature_, a1);
  id v4 = objc_msgSend(v2, sel_notCondition_, v3);
  id v5 = objc_msgSend(self, sel_trueCondition);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F94980]), sel_initWithLeftCondition_rightCondition_comparisonCondition_order_, v3, v4, v5, 1);

  return v6;
}

id static RERule.makeExcludeIfValueIsEqualForFeature<A>(feature:value:)(void *a1)
{
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_conditionHasValueForFeature_, a1);
  id v4 = a1;
  sub_1C1EAEE48();
  id v5 = objc_msgSend(v2, sel_conditionForFeature_relation_integerValue_, v4, 0, v13);

  sub_1C1DFD2C0(0, (unint64_t *)&qword_1EBB660F8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1C1EB07E0;
  *(void *)(v6 + 32) = v3;
  *(void *)(v6 + 40) = v5;
  sub_1C1EAEEB8();
  sub_1C1DF9F8C(0, &qword_1EBB67F38);
  id v7 = v3;
  id v8 = v5;
  uint64_t v9 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v2, sel_andConditions_, v9);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F94958]), sel_initWithCondition_type_, v10, 0);
  return v11;
}

uint64_t sub_1C1E8F63C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void *sub_1C1E8F674(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C1EAF638())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C874C6F0](v4 - 4, a1) : *(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = objc_msgSend(v5, sel_identifier);
      sub_1C1EAED38();

      id v9 = objc_msgSend(a2, sel_uniqueIdentifier);
      sub_1C1EAED38();

      sub_1C1E4BB04();
      LOBYTE(v9) = sub_1C1EAF308();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v9)
      {
        swift_bridgeObjectRelease();
        return v6;
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1C1E8F824()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1C1E8F8DC()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  unint64_t v2 = (*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1C1E8C608(v0 + v1, *(void *)(v0 + v2), *(uint64_t (**)(void))(v0 + ((v2 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v2 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1C1E8F954()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

void sub_1C1E8F9F4()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  uint64_t v2 = (uint64_t *)(v0 + ((*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1C1E8D270(v0 + v1, *v2, v2[1], *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1C1E8FA60()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  if (*(void *)(v0 + v5)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v5 + 16, v3 | 7);
}

uint64_t sub_1C1E8FB44()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80);
  uint64_t v2 = (uint64_t *)((char *)v0 + ((*(void *)(*(void *)(v0[2] - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C1E8D89C(v0[4], (uint64_t)(v0 + 5), (uint64_t)v0 + v1, *v2, v2[1], v0[2], v0[3]);
}

uint64_t sub_1C1E8FBB8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C1E8FBF0()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t dispatch thunk of RelevanceEngineCoordinator.dispatchQueue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RelevanceEngineCoordinator.relevanceEngine.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RelevanceEngineCoordinator.resumeEngineIfNeeded(feedKinds:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of RelevanceEngineCoordinator.trainingContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of RelevanceEngineCoordinator.interactionDescriptor(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of RelevanceEngineCoordinator.logPrefix.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_1C1E8FC70@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1C1E8D930(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_1C1E8FC8C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1E8FCC4(uint64_t a1, uint64_t a2)
{
  return sub_1C1E8D378(a1, a2, *(void (**)(char *))(v2 + 16));
}

uint64_t sub_1C1E8FCCC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C1E8FD34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C1E8FD9C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C1E8FDFC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C1DFC4E4(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C1E8FE6C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v4);
}

void sub_1C1E8FF14()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  unint64_t v2 = (*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1C1E8CC7C(v0 + v1, *(void *)(v0 + v2), *(void *)(v0 + v2 + 8), *(uint64_t **)(v0 + ((v2 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1C1E8FF8C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C1E8FF9C(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  unint64_t v5 = (void *)(*(uint64_t (**)(void))(*(void *)(v2 + 24) + 16))(*(void *)(v2 + 16));
  id v6 = objc_msgSend(v5, sel_elementAtPath_, v4);

  *a2 = v6;
}

HealthPlatformCore::LocalizedTitleFeatureTag __swiftcall LocalizedTitleFeatureTag.init(_:)(HealthPlatformCore::LocalizedTitleFeatureTag result)
{
  *unint64_t v1 = result;
  return result;
}

uint64_t LocalizedTitleFeatureTag.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocalizedTitleFeatureTag.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LocalizedTitleFeatureTag.value.modify())()
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for LocalizedTitleFeatureTag()
{
  return &type metadata for LocalizedTitleFeatureTag;
}

uint64_t sub_1C1E90104()
{
  uint64_t v1 = sub_1C1EAD368();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_1C1EAE4C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x1F4186498](v0, v11, v10);
}

uint64_t sub_1C1E90260()
{
  uint64_t v1 = sub_1C1EAD368();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_1C1EAE4C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((v9 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x1F4186498](v0, v11, v10);
}

uint64_t sub_1C1E903B8(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_profileIdentifier);
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = sub_1C1E7410C(v4, a2);

    return v6 & 1;
  }
  if (objc_msgSend(a1, sel_direction) == (id)1)
  {
    id v8 = objc_msgSend(a1, sel_status);
    if (!objc_msgSend(a1, sel_direction))
    {
      uint64_t result = objc_msgSend(a1, sel_status) == (id)1;
      if (v8) {
        return result;
      }
      return 1;
    }
    return !v8;
  }
  if (objc_msgSend(a1, sel_direction)) {
    return 0;
  }
  return objc_msgSend(a1, sel_status) == (id)1;
}

uint64_t sub_1C1E904AC(void *a1, uint64_t a2)
{
  uint64_t v61 = (uint8_t *)a2;
  sub_1C1DEB760(0, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v52 - v4;
  uint64_t v6 = sub_1C1EAD258();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v56 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  os_log_type_t v57 = (char *)v52 - v10;
  uint64_t v11 = sub_1C1EAE568();
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v58 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v52 - v14;
  uint64_t v16 = sub_1C1EAD368();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v59 = v11;
    uint64_t v60 = v7;
    uint64_t v20 = self;
    id v21 = a1;
    id v22 = objc_msgSend(v21, sel_UUID);
    sub_1C1EAD348();

    id v23 = (void *)sub_1C1EAD338();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    id v24 = objc_msgSend(v20, sel__profileWithUUID_type_, v23, 2);

    swift_beginAccess();
    id v25 = v24;
    sub_1C1DDB910(&v64, v24);
    swift_endAccess();

    sub_1C1EAE4F8();
    id v26 = v25;
    uint64_t v27 = sub_1C1EAE558();
    os_log_type_t v28 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v55 = v6;
      uint64_t v30 = (uint8_t *)v29;
      uint64_t v54 = swift_slowAlloc();
      v63[0] = v54;
      *(_DWORD *)uint64_t v30 = 136380675;
      v52[1] = v30 + 4;
      id v31 = v26;
      id v32 = objc_msgSend(v31, sel_description);
      uint64_t v33 = sub_1C1EAED38();
      id v53 = v21;
      uint64_t v34 = v33;
      unint64_t v36 = v35;

      id v64 = (id)sub_1C1DF8D44(v34, v36, v63);
      sub_1C1EAF2C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v27, v28, "[Contact Photo] Added invitation profile to allowlist. Profile: %{private}s", v30, 0xCu);
      uint64_t v37 = v54;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v37, -1, -1);
      uint64_t v38 = v30;
      uint64_t v6 = v55;
      MEMORY[0x1C874D2E0](v38, -1, -1);
    }
    else
    {
    }
    uint64_t v11 = v59;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v15, v59);
    uint64_t v7 = v60;
  }
  sub_1C1DD490C((uint64_t)v61, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    return sub_1C1DD5EAC((uint64_t)v5);
  }
  uint64_t v40 = v57;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v57, v5, v6);
  uint64_t v41 = v58;
  sub_1C1EAE4F8();
  uint64_t v42 = v56;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v56, v40, v6);
  uint64_t v43 = sub_1C1EAE558();
  os_log_type_t v44 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v60 = v7;
    uint64_t v46 = (uint8_t *)v45;
    uint64_t v47 = swift_slowAlloc();
    v63[0] = v47;
    *(_DWORD *)uint64_t v46 = 136380675;
    uint64_t v59 = v11;
    uint64_t v61 = v46 + 4;
    sub_1C1DEB1C4(&qword_1EBB65B30, MEMORY[0x1E4F276F0]);
    uint64_t v48 = sub_1C1EAF768();
    id v64 = (id)sub_1C1DF8D44(v48, v49, v63);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    uint64_t v50 = *(void (**)(char *, uint64_t))(v60 + 8);
    v50(v42, v6);
    _os_log_impl(&dword_1C1DD2000, v43, v44, "[Contact Photo] Successfully created and saved contact photo at %{private}s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v47, -1, -1);
    MEMORY[0x1C874D2E0](v46, -1, -1);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v58, v59);
    return ((uint64_t (*)(char *, uint64_t))v50)(v40, v6);
  }
  else
  {

    unint64_t v51 = *(void (**)(char *, uint64_t))(v7 + 8);
    v51(v42, v6);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v41, v11);
    return ((uint64_t (*)(char *, uint64_t))v51)(v40, v6);
  }
}

id sub_1C1E90BFC@<X0>(id *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  v54[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C1EAE568();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v48 - v11;
  id v52 = *a1;
  uint64_t v13 = sub_1C1EAF208();
  if (v14)
  {
    uint64_t v15 = v13;
    unint64_t v16 = v14;
    sub_1C1DF9F8C(0, (unint64_t *)&unk_1EBB659F0);
    sub_1C1EAF0E8();
    uint64_t v17 = (void *)sub_1C1EAED28();
    sub_1C1E93B9C();
    uint64_t v18 = (void *)sub_1C1EAEE88();
    swift_bridgeObjectRelease();
    v54[0] = 0;
    id v19 = objc_msgSend(a2, sel_unifiedContactWithIdentifier_keysToFetch_error_, v17, v18, v54);

    id v20 = v54[0];
    if (v19)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    uint64_t v34 = v20;
    unint64_t v35 = (void *)sub_1C1EAD198();

    swift_willThrow();
    sub_1C1EAE4F8();
    id v36 = v35;
    swift_bridgeObjectRetain();
    id v37 = v35;
    uint64_t v38 = sub_1C1EAE558();
    os_log_type_t v39 = sub_1C1EAF0B8();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      uint64_t v50 = v7;
      uint64_t v42 = v41;
      v54[0] = v41;
      *(_DWORD *)uint64_t v40 = 136380931;
      unint64_t v51 = a3;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_1C1DF8D44(v15, v16, (uint64_t *)v54);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v40 + 12) = 2082;
      uint64_t v53 = (uint64_t)v35;
      id v43 = v35;
      sub_1C1E15F30();
      uint64_t v44 = sub_1C1EAED78();
      uint64_t v53 = sub_1C1DF8D44(v44, v45, (uint64_t *)v54);
      a3 = v51;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C1DD2000, v38, v39, "[Contact Photo] Could not find contact with identifier %{private}s: %{public}s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v42, -1, -1);
      MEMORY[0x1C874D2E0](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  else
  {
    sub_1C1EAE4F8();
    id v21 = v52;
    id v22 = sub_1C1EAE558();
    os_log_type_t v23 = sub_1C1EAF0B8();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v51 = a3;
      id v24 = (uint8_t *)swift_slowAlloc();
      unint64_t v49 = (void *)swift_slowAlloc();
      v54[0] = v49;
      *(_DWORD *)id v24 = 136380675;
      v48[1] = v24 + 4;
      id v25 = v21;
      id v26 = objc_msgSend(v25, sel_description);
      uint64_t v50 = v6;
      id v27 = v26;
      uint64_t v28 = sub_1C1EAED38();
      uint64_t v29 = v7;
      unint64_t v31 = v30;

      uint64_t v32 = v28;
      a3 = v51;
      uint64_t v53 = sub_1C1DF8D44(v32, v31, (uint64_t *)v54);
      sub_1C1EAF2C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v22, v23, "[Contact Photo] Could not find contact identifier for %{private}s", v24, 0xCu);
      uint64_t v33 = v49;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v33, -1, -1);
      MEMORY[0x1C874D2E0](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v50);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  id v19 = 0;
LABEL_11:
  id v46 = v52;
  *a3 = v52;
  a3[1] = v19;
  return v46;
}

uint64_t sub_1C1E91190(void *a1, uint64_t a2)
{
  uint64_t v39 = a2;
  sub_1C1DEB760(0, &qword_1EA2C15D0, MEMORY[0x1E4F66070], MEMORY[0x1E4F1AC08]);
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v37 - v4;
  sub_1C1E15EB8(0, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v42 = (char *)&v37 - v7;
  sub_1C1E93A4C();
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v44 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1C1EAE428();
  uint64_t v10 = *(void *)(v43 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v43);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_1C1EAD368();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  id v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = a1;
  id v21 = objc_msgSend(a1, sel_profileIdentifier);
  if (!v21)
  {
    id v38 = self;
    id v22 = objc_msgSend(a1, sel_UUID);
    sub_1C1EAD348();

    os_log_type_t v23 = (void *)sub_1C1EAD338();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    id v21 = objc_msgSend(v38, sel__profileWithUUID_type_, v23, 2);
  }
  id v38 = v21;
  id v24 = v15;
  sub_1C1EAE408();
  uint64_t v25 = v43;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v43);
  uint64_t v26 = sub_1C1EAE8B8();
  MEMORY[0x1F4188790](v26);
  *(&v37 - 2) = v39;
  *(&v37 - 1) = (uint64_t)v20;
  sub_1C1E16AC0();
  id v27 = v42;
  uint64_t v28 = v41;
  sub_1C1EAE898();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v5, v28);
  *(void *)(swift_allocObject() + 16) = v20;
  uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C1E15EB8(0, &qword_1EBB65948, MEMORY[0x1E4F1AAE0]);
  sub_1C1E170C0(&qword_1EA2C15C8, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
  sub_1C1E170C0((unint64_t *)&unk_1EBB65938, &qword_1EBB65948, v29);
  id v30 = v20;
  unint64_t v31 = v44;
  uint64_t v32 = v46;
  sub_1C1EAEA88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v32);
  sub_1C1DEB1C4(&qword_1EA2C15E0, (void (*)(uint64_t))sub_1C1E93A4C);
  uint64_t v33 = v48;
  uint64_t v34 = sub_1C1EAEA38();
  id v35 = v38;

  (*(void (**)(char *, uint64_t))(v47 + 8))(v31, v33);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v24, v25);
  return v34;
}

void sub_1C1E917C0(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  sub_1C1DEB760(0, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - v8;
  if (a1)
  {
    id v10 = a1;
    sub_1C1EAE418();

    if (v3) {
      return;
    }
    sub_1C1E16AC0();
    uint64_t v12 = (uint64_t)a3 + *(int *)(v11 + 48);
    *a3 = a2;
    sub_1C1E939B8((uint64_t)v9, v12);
  }
  else
  {
    sub_1C1E16AC0();
    uint64_t v14 = (char *)a3 + *(int *)(v13 + 48);
    *a3 = a2;
    uint64_t v15 = sub_1C1EAD258();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  }
  id v16 = a2;
}

uint64_t sub_1C1E91920@<X0>(void **a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v53 = a3;
  sub_1C1E16AC0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (uint8_t **)((char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C1DEB760(0, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v50 = (char *)&v42 - v10;
  sub_1C1DEB760(0, &qword_1EA2C15B8, (uint64_t (*)(uint64_t))sub_1C1E16AC0, MEMORY[0x1E4F1AC08]);
  uint64_t v12 = v11;
  uint64_t v52 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v49 = (char *)&v42 - v13;
  sub_1C1E15EB8(0, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
  uint64_t v15 = v14;
  uint64_t v51 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v48 = (char *)&v42 - v16;
  uint64_t v47 = sub_1C1EAE568();
  uint64_t v17 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  id v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = *a1;
  sub_1C1EAE4F8();
  id v21 = v20;
  id v22 = v20;
  os_log_type_t v23 = sub_1C1EAE558();
  os_log_type_t v24 = sub_1C1EAF0B8();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v43 = v15;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v46 = a2;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v44 = v8;
    uint64_t v28 = v27;
    uint64_t v54 = (uint64_t)v20;
    uint64_t v55 = v27;
    uint64_t v45 = v6;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v42 = v26 + 4;
    id v29 = v20;
    sub_1C1E15F30();
    uint64_t v30 = sub_1C1EAED78();
    uint64_t v54 = sub_1C1DF8D44(v30, v31, &v55);
    uint64_t v6 = v45;
    sub_1C1EAF2C8();
    uint64_t v15 = v43;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C1DD2000, v23, v24, "[Contact Photo] Could not save image: %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v32 = v28;
    uint64_t v8 = v44;
    MEMORY[0x1C874D2E0](v32, -1, -1);
    uint64_t v33 = v26;
    a2 = v46;
    MEMORY[0x1C874D2E0](v33, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v47);
  uint64_t v34 = sub_1C1EAD258();
  uint64_t v35 = (uint64_t)v50;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v50, 1, 1, v34);
  uint64_t v36 = (uint64_t)v8 + *(int *)(v6 + 48);
  *uint64_t v8 = a2;
  sub_1C1E939B8(v35, v36);
  id v37 = a2;
  id v38 = v49;
  sub_1C1EAE8B8();
  sub_1C1E15F30();
  uint64_t v39 = v48;
  sub_1C1EAE888();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v38, v12);
  sub_1C1E170C0(&qword_1EA2C15C8, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
  uint64_t v40 = sub_1C1EAEA38();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v39, v15);
  uint64_t *v53 = v40;
  return result;
}

uint64_t sub_1C1E91E94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C1E91190(*(void **)a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1C1E91EC4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v50 = a2;
  sub_1C1E16AC0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (void *)((char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C1DEB760(0, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v48 = (char *)v40 - v8;
  sub_1C1DEB760(0, &qword_1EA2C15B8, (uint64_t (*)(uint64_t))sub_1C1E16AC0, MEMORY[0x1E4F1AC08]);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v47 = (char *)v40 - v12;
  sub_1C1E15EB8(0, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
  uint64_t v14 = v13;
  uint64_t v49 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v46 = (char *)v40 - v15;
  uint64_t v45 = sub_1C1EAE568();
  uint64_t v16 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  uint64_t v18 = (char *)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = *a1;
  sub_1C1EAE4F8();
  id v20 = v19;
  id v21 = v19;
  id v22 = sub_1C1EAE558();
  os_log_type_t v23 = sub_1C1EAF0B8();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v42 = v14;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v41 = v11;
    uint64_t v25 = (uint8_t *)v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v43 = v6;
    uint64_t v27 = v26;
    uint64_t v51 = (uint64_t)v19;
    uint64_t v52 = v26;
    uint64_t v44 = v4;
    *(_DWORD *)uint64_t v25 = 136315138;
    v40[1] = v25 + 4;
    id v28 = v19;
    sub_1C1E15F30();
    uint64_t v29 = sub_1C1EAED78();
    uint64_t v51 = sub_1C1DF8D44(v29, v30, &v52);
    uint64_t v4 = v44;
    sub_1C1EAF2C8();
    uint64_t v14 = v42;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C1DD2000, v22, v23, "[Contact Photo] Could not process contact photo: %s", v25, 0xCu);
    swift_arrayDestroy();
    uint64_t v31 = v27;
    uint64_t v6 = v43;
    MEMORY[0x1C874D2E0](v31, -1, -1);
    uint64_t v32 = v25;
    uint64_t v11 = v41;
    MEMORY[0x1C874D2E0](v32, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v45);
  uint64_t v33 = sub_1C1EAD258();
  uint64_t v34 = (uint64_t)v48;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v48, 1, 1, v33);
  uint64_t v35 = (uint64_t)v6 + *(int *)(v4 + 48);
  *uint64_t v6 = 0;
  sub_1C1E939B8(v34, v35);
  uint64_t v36 = v47;
  sub_1C1EAE8B8();
  sub_1C1E15F30();
  id v37 = v46;
  sub_1C1EAE888();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v36, v10);
  sub_1C1E170C0(&qword_1EA2C15C8, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
  uint64_t v38 = sub_1C1EAEA38();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v37, v14);
  *uint64_t v50 = v38;
  return result;
}

uint64_t sub_1C1E9242C(uint64_t a1, void *a2)
{
  v30[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C1EAD258();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C1EAE568();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)sub_1C1EAD1F8();
  v30[0] = 0;
  unsigned int v13 = objc_msgSend(a2, sel_removeItemAtURL_error_, v12, v30);

  if (v13)
  {
    id v14 = v30[0];
    sub_1C1EAE538();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    uint64_t v15 = sub_1C1EAE558();
    os_log_type_t v16 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v26 = v2;
      uint64_t v18 = (uint8_t *)v17;
      uint64_t v25 = (void *)swift_slowAlloc();
      v30[0] = v25;
      *(_DWORD *)uint64_t v18 = 136380675;
      uint64_t v24 = v18 + 4;
      sub_1C1DEB1C4(&qword_1EBB65B30, MEMORY[0x1E4F276F0]);
      uint64_t v19 = sub_1C1EAF768();
      uint64_t v29 = sub_1C1DF8D44(v19, v20, (uint64_t *)v30);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      _os_log_impl(&dword_1C1DD2000, v15, v16, "[Contact Photo] Successfully deleted profile image %{private}s", v18, 0xCu);
      id v21 = v25;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v21, -1, -1);
      MEMORY[0x1C874D2E0](v18, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  }
  else
  {
    id v22 = v30[0];
    sub_1C1EAD198();

    return swift_willThrow();
  }
}

void sub_1C1E927B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_1C1EAE568();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  sub_1C1EAE518();
  id v13 = a3;
  id v14 = sub_1C1EAE558();
  os_log_type_t v15 = sub_1C1EAF0D8();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    int v32 = v16;
    uint64_t v18 = v17;
    uint64_t v33 = swift_slowAlloc();
    aBlock[0] = v33;
    *(_DWORD *)uint64_t v18 = 136315395;
    uint64_t v35 = v12;
    uint64_t v19 = sub_1C1EAF908();
    uint64_t v34 = v8;
    uint64_t v36 = sub_1C1DF8D44(v19, v20, aBlock);
    void v31[2] = aBlock;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2081;
    v31[1] = v18 + 14;
    id v21 = objc_msgSend(v13, sel_profileIdentifier);
    id v22 = objc_msgSend(v21, sel_description);
    uint64_t v23 = sub_1C1EAED38();
    unint64_t v25 = v24;

    uint64_t v12 = v35;
    uint64_t v36 = sub_1C1DF8D44(v23, v25, aBlock);
    sub_1C1EAF2C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v14, (os_log_type_t)v32, "[%s] Pulling shared summaries for %{private}s", (uint8_t *)v18, 0x16u);
    uint64_t v26 = v33;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v26, -1, -1);
    MEMORY[0x1C874D2E0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v34);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B4A8]), sel_initWithHealthStore_, v13);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = sub_1C1E9362C;
  void v28[3] = v12;
  v28[4] = v13;
  v28[5] = a4;
  aBlock[4] = (uint64_t)sub_1C1E936A8;
  aBlock[5] = (uint64_t)v28;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1C1E93044;
  aBlock[3] = (uint64_t)&block_descriptor_11;
  uint64_t v29 = _Block_copy(aBlock);
  id v30 = v13;
  swift_release();
  objc_msgSend(v27, sel_pullWithCompletion_, v29);
  _Block_release(v29);
}

uint64_t sub_1C1E92B5C(char a1, void *a2, uint64_t (*a3)(void), uint64_t a4, void *a5)
{
  uint64_t v9 = sub_1C1EAE568();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  id v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  os_log_type_t v15 = (char *)v46 - v14;
  if ((a1 & 1) == 0)
  {
    sub_1C1EAE518();
    id v31 = a2;
    id v32 = a2;
    uint64_t v33 = sub_1C1EAE558();
    os_log_type_t v34 = sub_1C1EAF0B8();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v49 = v9;
      uint64_t v37 = v36;
      uint64_t v52 = v36;
      *(_DWORD *)uint64_t v35 = 136315394;
      uint64_t v50 = a3;
      uint64_t v38 = sub_1C1EAF908();
      uint64_t v51 = sub_1C1DF8D44(v38, v39, &v52);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2082;
      uint64_t v51 = (uint64_t)a2;
      id v40 = a2;
      sub_1C1DEB760(0, &qword_1EA2C15A8, (uint64_t (*)(uint64_t))sub_1C1E15F30, MEMORY[0x1E4FBB718]);
      uint64_t v41 = sub_1C1EAED78();
      uint64_t v51 = sub_1C1DF8D44(v41, v42, &v52);
      a3 = v50;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C1DD2000, v33, v34, "[%s] Shared Summaries Pull Error: %{public}s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v37, -1, -1);
      MEMORY[0x1C874D2E0](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v49);
      goto LABEL_9;
    }

    uint64_t v43 = *(void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v44 = v13;
LABEL_8:
    v43(v44, v9);
    goto LABEL_9;
  }
  sub_1C1EAE518();
  id v16 = a5;
  uint64_t v17 = sub_1C1EAE558();
  os_log_type_t v18 = sub_1C1EAF0D8();
  int v19 = v18;
  if (!os_log_type_enabled(v17, v18))
  {

    uint64_t v43 = *(void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v44 = v15;
    goto LABEL_8;
  }
  uint64_t v20 = swift_slowAlloc();
  int v47 = v19;
  uint64_t v21 = v20;
  uint64_t v48 = swift_slowAlloc();
  uint64_t v52 = v48;
  *(_DWORD *)uint64_t v21 = 136315395;
  uint64_t v50 = a3;
  uint64_t v22 = sub_1C1EAF908();
  uint64_t v51 = sub_1C1DF8D44(v22, v23, &v52);
  v46[1] = &v52;
  sub_1C1EAF2C8();
  swift_bridgeObjectRelease();
  *(_WORD *)(v21 + 12) = 2081;
  id v24 = objc_msgSend(v16, sel_profileIdentifier, v21 + 14);
  id v25 = objc_msgSend(v24, sel_description);
  uint64_t v26 = sub_1C1EAED38();
  uint64_t v49 = v9;
  unint64_t v28 = v27;

  uint64_t v29 = v26;
  a3 = v50;
  uint64_t v51 = sub_1C1DF8D44(v29, v28, &v52);
  sub_1C1EAF2C8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C1DD2000, v17, (os_log_type_t)v47, "[%s] Successfully pulled shared summaries for %{private}s", (uint8_t *)v21, 0x16u);
  uint64_t v30 = v48;
  swift_arrayDestroy();
  MEMORY[0x1C874D2E0](v30, -1, -1);
  MEMORY[0x1C874D2E0](v21, -1, -1);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v49);
LABEL_9:
  sub_1C1EAF898();
  return a3(v52);
}

void sub_1C1E93044(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1C1E930BC()
{
  swift_release();

  uint64_t v1 = *(void *)(v0 + 272);
  return sub_1C1E16DFC(v1);
}

uint64_t FeedItemGeneratorPipelineManager.deinit()
{
  uint64_t v0 = sub_1C1E62D54();
  swift_release();

  sub_1C1E16DFC(*(void *)(v0 + 272));
  return v0;
}

uint64_t FeedItemGeneratorPipelineManager.__deallocating_deinit()
{
  uint64_t v0 = sub_1C1E62D54();
  swift_release();

  sub_1C1E16DFC(*(void *)(v0 + 272));
  return swift_deallocClassInstance();
}

uint64_t sub_1C1E9318C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1C1E0E230();
    uint64_t v2 = sub_1C1EAF678();
    uint64_t v18 = v2;
    sub_1C1EAF5C8();
    uint64_t v3 = sub_1C1EAF5F8();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1C1DF9F8C(0, &qword_1EBB68260);
      do
      {
        swift_dynamicCast();
        sub_1C1DF9F8C(0, &qword_1EBB66FE8);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1C1E0DF60(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_1C1EAF278();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1C1EAF5F8();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

unint64_t sub_1C1E933DC(int64_t a1, uint64_t a2)
{
  return sub_1C1DEB3F8(a1, a2, &qword_1EBB678C0, (uint64_t (*)(uint64_t))sub_1C1E02B88);
}

unint64_t sub_1C1E933FC(int64_t a1, uint64_t a2)
{
  return sub_1C1DEB3F8(a1, a2, (unint64_t *)&qword_1EBB67890, (uint64_t (*)(uint64_t))sub_1C1DFBBA4);
}

uint64_t sub_1C1E9341C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for FeedItemGeneratorPipelineManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FeedItemGeneratorPipelineManager);
}

unint64_t sub_1C1E9349C()
{
  unint64_t result = qword_1EBB67000;
  if (!qword_1EBB67000)
  {
    sub_1C1DF9F8C(255, &qword_1EBB68260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB67000);
  }
  return result;
}

uint64_t sub_1C1E93504()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E9353C()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E93574()
{
  return objectdestroy_26Tm(MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1C1E9358C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E9359C()
{
  return objectdestroy_26Tm(MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1C1E935B4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C1E935EC(uint64_t a1, uint64_t a2)
{
  sub_1C1E927B0(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1C1E935F4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1E9362C(char a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1 & 1;
  return v2(&v4);
}

uint64_t sub_1C1E93668()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C1E936A8(char a1, void *a2)
{
  return sub_1C1E92B5C(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

void sub_1C1E936B4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1C1DF9F8C(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1C1E9371C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E93754(void *a1)
{
  return sub_1C1E903B8(a1, *(void *)(v1 + 16));
}

uint64_t sub_1C1E9375C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E9376C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E937A4(void *a1, uint64_t a2)
{
  return sub_1C1E904AC(a1, a2);
}

uint64_t sub_1C1E937AC(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  sub_1C1E16AC0();
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

unint64_t sub_1C1E937F8()
{
  unint64_t result = qword_1EBB659A8;
  if (!qword_1EBB659A8)
  {
    sub_1C1E936B4(255, &qword_1EBB659A0, &qword_1EBB65A00, 0x1E4F2B5D8, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB659A8);
  }
  return result;
}

void sub_1C1E9387C()
{
  if (!qword_1EBB65A18)
  {
    sub_1C1DF9F8C(255, &qword_1EBB65A00);
    sub_1C1E936B4(255, &qword_1EBB65A30, &qword_1EBB65A28, 0x1E4F1B8F8, MEMORY[0x1E4FBB718]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB65A18);
    }
  }
}

unint64_t sub_1C1E93928()
{
  unint64_t result = qword_1EBB659C0;
  if (!qword_1EBB659C0)
  {
    sub_1C1DEB760(255, (unint64_t *)&unk_1EBB659B0, (uint64_t (*)(uint64_t))sub_1C1E9387C, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB659C0);
  }
  return result;
}

id sub_1C1E939B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return sub_1C1E90BFC(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_1C1E939B8(uint64_t a1, uint64_t a2)
{
  sub_1C1DEB760(0, (unint64_t *)&unk_1EBB68298, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1C1E93A4C()
{
  if (!qword_1EA2C15D8)
  {
    uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1ACE0];
    sub_1C1E15EB8(255, &qword_1EA2C15C0, MEMORY[0x1E4F1ACE0]);
    uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C1E15EB8(255, &qword_1EBB65948, MEMORY[0x1E4F1AAE0]);
    sub_1C1E170C0(&qword_1EA2C15C8, &qword_1EA2C15C0, v0);
    sub_1C1E170C0((unint64_t *)&unk_1EBB65938, &qword_1EBB65948, v1);
    unint64_t v2 = sub_1C1EAE678();
    if (!v3) {
      atomic_store(v2, (unint64_t *)&qword_1EA2C15D8);
    }
  }
}

void sub_1C1E93B78(void *a1@<X8>)
{
  sub_1C1E917C0(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_1C1E93B94@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C1E91920(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_1C1E93B9C()
{
  unint64_t result = qword_1EA2C15E8;
  if (!qword_1EA2C15E8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA2C15E8);
  }
  return result;
}

uint64_t sub_1C1E93BF4()
{
  return objectdestroy_26Tm(MEMORY[0x1E4FBC898]);
}

uint64_t sub_1C1E93C0C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1E93C1C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t ModelTrainingEvent.init(feedItemURL:eventKind:isPositive:date:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = *a2;
  uint64_t v10 = sub_1C1EAD258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a5, a1, v10);
  uint64_t v11 = (int *)type metadata accessor for ModelTrainingEvent();
  *(unsigned char *)(a5 + v11[5]) = v9;
  *(unsigned char *)(a5 + v11[6]) = a3;
  uint64_t v12 = a5 + v11[7];
  uint64_t v13 = sub_1C1EAD318();
  unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);
  return v14(v12, a4, v13);
}

uint64_t type metadata accessor for ModelTrainingEvent()
{
  uint64_t result = qword_1EBB682B0;
  if (!qword_1EBB682B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ModelTrainingEvent.EventKind.rawValue.getter()
{
  if (*v0) {
    return 0x6C6C657764;
  }
  else {
    return 7364980;
  }
}

HealthPlatformCore::ModelTrainingEvent::EventKind_optional __swiftcall ModelTrainingEvent.EventKind.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1C1EAF6B8();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

HealthPlatformCore::ModelTrainingEvent::EventKind_optional sub_1C1E93E74(Swift::String *a1)
{
  return ModelTrainingEvent.EventKind.init(rawValue:)(*a1);
}

void sub_1C1E93E80(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7364980;
  if (*v1) {
    uint64_t v2 = 0x6C6C657764;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1C1E93EB4()
{
  return sub_1C1EAEE68();
}

uint64_t sub_1C1E93F14()
{
  return sub_1C1EAEE58();
}

uint64_t sub_1C1E93F64()
{
  return sub_1C1EAF858();
}

uint64_t sub_1C1E93FDC()
{
  sub_1C1EAED98();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1E94040()
{
  return sub_1C1EAF858();
}

uint64_t sub_1C1E940B4(char *a1, char *a2)
{
  return sub_1C1E4C704(*a1, *a2);
}

uint64_t ModelTrainingEvent.feedItemURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C1EAD258();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t ModelTrainingEvent.eventKind.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ModelTrainingEvent();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ModelTrainingEvent.isPositive.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ModelTrainingEvent() + 24));
}

uint64_t ModelTrainingEvent.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ModelTrainingEvent() + 28);
  uint64_t v4 = sub_1C1EAD318();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ModelTrainingEvent.hash(into:)()
{
  return sub_1C1EAECC8();
}

uint64_t sub_1C1E94330()
{
  uint64_t result = 0x6D65744964656566;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E694B746E657665;
      break;
    case 2:
      uint64_t result = 0x697469736F507369;
      break;
    case 3:
      uint64_t result = 1702125924;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C1E943C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C1E960BC(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C1E943F0(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1C1E943FC(uint64_t a1)
{
  unint64_t v2 = sub_1C1E95294();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C1E94438(uint64_t a1)
{
  unint64_t v2 = sub_1C1E95294();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ModelTrainingEvent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_1C1E9533C(0, &qword_1EBB65D98, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v9 = &v11[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C1E95294();
  sub_1C1EAF8D8();
  v11[15] = 0;
  sub_1C1EAD258();
  sub_1C1E95494(&qword_1EBB65B20, MEMORY[0x1E4F276F0]);
  sub_1C1EAF738();
  if (!v2)
  {
    v11[14] = *(unsigned char *)(v3 + *(int *)(type metadata accessor for ModelTrainingEvent() + 20));
    v11[13] = 1;
    sub_1C1E952E8();
    sub_1C1EAF738();
    v11[12] = 2;
    sub_1C1EAF728();
    v11[11] = 3;
    sub_1C1EAD318();
    sub_1C1E95494(&qword_1EBB65B38, MEMORY[0x1E4F27928]);
    sub_1C1EAF738();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ModelTrainingEvent.hashValue.getter()
{
  return sub_1C1EAF858();
}

uint64_t ModelTrainingEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = sub_1C1EAD318();
  uint64_t v19 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1C1EAD258();
  uint64_t v22 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  id v24 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E9533C(0, &qword_1EBB67088, MEMORY[0x1E4FBBDC0]);
  uint64_t v23 = v7;
  uint64_t v21 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  char v9 = (char *)&v18 - v8;
  uint64_t v10 = (int *)type metadata accessor for ModelTrainingEvent();
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C1E95294();
  uint64_t v26 = v9;
  uint64_t v13 = (uint64_t)v27;
  sub_1C1EAF8C8();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v14 = (uint64_t)v12;
  unint64_t v27 = a1;
  uint64_t v15 = v22;
  char v32 = 0;
  sub_1C1E95494(&qword_1EBB66130, MEMORY[0x1E4F276F0]);
  uint64_t v16 = v23;
  sub_1C1EAF718();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v24, v25);
  char v30 = 1;
  sub_1C1E953A0();
  sub_1C1EAF718();
  *(unsigned char *)(v14 + v10[5]) = v31;
  char v29 = 2;
  *(unsigned char *)(v14 + v10[6]) = sub_1C1EAF708() & 1;
  char v28 = 3;
  sub_1C1E95494(&qword_1EBB66138, MEMORY[0x1E4F27928]);
  sub_1C1EAF718();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v14 + v10[7], v5, v3);
  sub_1C1E89470(v14, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return sub_1C1E894D4(v14);
}

uint64_t sub_1C1E94CF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ModelTrainingEvent.init(from:)(a1, a2);
}

uint64_t sub_1C1E94D08(void *a1)
{
  return ModelTrainingEvent.encode(to:)(a1);
}

uint64_t sub_1C1E94D24()
{
  return sub_1C1EAECC8();
}

uint64_t sub_1C1E94E58()
{
  return sub_1C1EAF858();
}

uint64_t ModelTrainingEvent.debugDescription.getter()
{
  BYTE8(v2) = 0;
  sub_1C1EAF4A8();
  sub_1C1EAEDB8();
  sub_1C1EAD1C8();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  *(void *)&long long v2 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ModelTrainingEvent() + 20));
  sub_1C1EAF5B8();
  sub_1C1EAEDB8();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  sub_1C1EAD318();
  sub_1C1E95494(&qword_1EBB68160, MEMORY[0x1E4F27928]);
  sub_1C1EAF768();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v2 + 1);
}

uint64_t _s18HealthPlatformCore18ModelTrainingEventV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x1C874A450]() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for ModelTrainingEvent();
  uint64_t v5 = v4[5];
  int v6 = *(unsigned __int8 *)(a1 + v5);
  int v7 = *(unsigned __int8 *)(a2 + v5);
  if (v6) {
    uint64_t v8 = 0x6C6C657764;
  }
  else {
    uint64_t v8 = 7364980;
  }
  if (v6) {
    unint64_t v9 = 0xE500000000000000;
  }
  else {
    unint64_t v9 = 0xE300000000000000;
  }
  if (v7) {
    uint64_t v10 = 0x6C6C657764;
  }
  else {
    uint64_t v10 = 7364980;
  }
  if (v7) {
    unint64_t v11 = 0xE500000000000000;
  }
  else {
    unint64_t v11 = 0xE300000000000000;
  }
  if (v8 == v10 && v9 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_1C1EAF7A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      return 0;
    }
  }
  if (*(unsigned __int8 *)(a1 + v4[6]) != *(unsigned __int8 *)(a2 + v4[6])) {
    return 0;
  }
  uint64_t v15 = v4[7];
  return MEMORY[0x1F40E52C0](a1 + v15, a2 + v15);
}

unint64_t sub_1C1E95294()
{
  unint64_t result = qword_1EBB68190;
  if (!qword_1EBB68190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB68190);
  }
  return result;
}

unint64_t sub_1C1E952E8()
{
  unint64_t result = qword_1EBB65C38;
  if (!qword_1EBB65C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB65C38);
  }
  return result;
}

void sub_1C1E9533C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C1E95294();
    unint64_t v7 = a3(a1, &type metadata for ModelTrainingEvent.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1C1E953A0()
{
  unint64_t result = qword_1EBB66498;
  if (!qword_1EBB66498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB66498);
  }
  return result;
}

unint64_t sub_1C1E953F8()
{
  unint64_t result = qword_1EA2C1650;
  if (!qword_1EA2C1650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C1650);
  }
  return result;
}

uint64_t sub_1C1E9544C()
{
  return sub_1C1E95494(&qword_1EBB65C40, (void (*)(uint64_t))type metadata accessor for ModelTrainingEvent);
}

uint64_t sub_1C1E95494(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for ModelTrainingEvent(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C1EAD258();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = (char *)a1 + v9;
    unint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1C1EAD318();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for ModelTrainingEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1EAD258();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_1C1EAD318();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C1EAD258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t assignWithCopy for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C1EAD258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C1EAD258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t assignWithTake for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C1EAD258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1C1EAD318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelTrainingEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C1E959E8);
}

uint64_t sub_1C1E959E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1EAD258();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return v10 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_1C1EAD318();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ModelTrainingEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C1E95B20);
}

uint64_t sub_1C1E95B20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1C1EAD258();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  else
  {
    uint64_t v11 = sub_1C1EAD318();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_1C1E95C48()
{
  uint64_t result = sub_1C1EAD258();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C1EAD318();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ModelTrainingEvent.EventKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C1E95DE8);
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

ValueMetadata *type metadata accessor for ModelTrainingEvent.EventKind()
{
  return &type metadata for ModelTrainingEvent.EventKind;
}

uint64_t getEnumTagSinglePayload for ModelTrainingEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModelTrainingEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1C1E95F7CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelTrainingEvent.CodingKeys()
{
  return &type metadata for ModelTrainingEvent.CodingKeys;
}

unint64_t sub_1C1E95FB8()
{
  unint64_t result = qword_1EA2C1658;
  if (!qword_1EA2C1658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C1658);
  }
  return result;
}

unint64_t sub_1C1E96010()
{
  unint64_t result = qword_1EBB681A0[0];
  if (!qword_1EBB681A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBB681A0);
  }
  return result;
}

unint64_t sub_1C1E96068()
{
  unint64_t result = qword_1EBB68198;
  if (!qword_1EBB68198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB68198);
  }
  return result;
}

uint64_t sub_1C1E960BC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D65744964656566 && a2 == 0xEB000000004C5255;
  if (v2 || (sub_1C1EAF7A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E694B746E657665 && a2 == 0xE900000000000064 || (sub_1C1EAF7A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697469736F507369 && a2 == 0xEA00000000006576 || (sub_1C1EAF7A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1C1EAF7A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_1C1E96298()
{
  unint64_t result = qword_1EBB68188;
  if (!qword_1EBB68188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB68188);
  }
  return result;
}

uint64_t sub_1C1E962EC()
{
  sub_1C1DFE408(v0 + 64, (uint64_t)v3);
  sub_1C1DF9148(0, &qword_1EBB64870);
  type metadata accessor for SummaryTabRelevanceEngineCoordinator();
  if (swift_dynamicCast()) {
    return v2;
  }
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_1C1EAF4A8();
  sub_1C1EAEDB8();
  sub_1C1EAF5B8();
  uint64_t result = sub_1C1EAF628();
  __break(1u);
  return result;
}

void sub_1C1E96400(uint64_t a1)
{
}

void sub_1C1E96434(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  char v6 = (void *)sub_1C1EAD538();
  BOOL v7 = (void *)swift_allocObject();
  v7[2] = v6;
  void v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v10[4] = sub_1C1E9B5A8;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1C1DF5050;
  v10[3] = &block_descriptor_12;
  int v8 = _Block_copy(v10);
  id v9 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_performBlock_, v8);
  _Block_release(v8);
}

uint64_t sub_1C1E9655C(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a3;
  uint64_t v6 = sub_1C1EAEB78();
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C1EAEBD8();
  uint64_t v25 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C1EAEB88();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(a2[7], sel_profileIdentifier);
  char v17 = NSManagedObjectContext.doesFeedEligibleForDisplayExist(kind:associatedProfileIdentifier:)(2, v16);

  if (v17)
  {
    sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68388);
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4FBCB20], v12);
    uint64_t v18 = (void *)sub_1C1EAF1B8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v28;
    *(void *)(v19 + 24) = a4;
    aBlock[4] = sub_1C1E9BBEC;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C1DF5050;
    aBlock[3] = &block_descriptor_53;
    uint64_t v20 = _Block_copy(aBlock);
    swift_retain();
    sub_1C1EAEB98();
    uint64_t v29 = MEMORY[0x1E4FBC860];
    sub_1C1DFFC20((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
    sub_1C1E07320(0);
    sub_1C1DFFC20((unint64_t *)&qword_1EBB683D8, sub_1C1E07320);
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v11, v8, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v26);
    return swift_release();
  }
  else
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v28;
    *(void *)(v22 + 24) = a4;
    uint64_t v23 = (void (*)(void *, uint64_t (*)(), uint64_t))*((void *)*a2 + 17);
    swift_retain();
    v23(&unk_1F1D65500, sub_1C1E9BBC0, v22);
    return swift_release();
  }
}

uint64_t sub_1C1E969E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v58 = a1;
  uint64_t v59 = a2;
  uint64_t v60 = *v5;
  uint64_t v62 = sub_1C1EAE568();
  uint64_t v10 = MEMORY[0x1F4188790](v62);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v49 - v14;
  uint64_t v57 = *(void *)(a3 + 16);
  if (v57)
  {
    uint64_t v50 = a4;
    uint64_t v51 = a5;
    uint64_t v56 = v5 + 8;
    id v16 = (void (**)(char *, uint64_t))(v13 + 8);
    swift_bridgeObjectRetain();
    uint64_t v17 = 0;
    *(void *)&long long v18 = 136315394;
    long long v53 = v18;
    uint64_t v52 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v54 = v5;
    uint64_t v55 = a3;
    uint64_t v61 = v12;
    do
    {
      uint64_t v20 = *(unsigned __int8 *)(a3 + v17 + 32);
      sub_1C1EAE508();
      uint64_t v21 = sub_1C1EAE558();
      os_log_type_t v22 = sub_1C1EAF0D8();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        uint64_t v63 = v24;
        *(_DWORD *)uint64_t v23 = v53;
        uint64_t v25 = sub_1C1EAF908();
        *(void *)(v23 + 4) = sub_1C1DF8D44(v25, v26, &v63);
        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2082;
        uint64_t v27 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        *(void *)(v23 + 14) = sub_1C1DF8D44(v27, v28, &v63);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C1DD2000, v21, v22, "******** [%s] populating feed: %{public}s *******", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C874D2E0](v24, -1, -1);
        uint64_t v29 = v23;
        uint64_t v6 = v54;
        MEMORY[0x1C874D2E0](v29, -1, -1);
      }

      char v30 = *v16;
      (*v16)(v15, v62);
      uint64_t v31 = v6[11];
      uint64_t v32 = v6[12];
      __swift_project_boxed_opaque_existential_1(v56, v31);
      unint64_t v33 = RelevanceEngineCoordinator.sortedElements(for:)(v20, v31, v32);
      sub_1C1E74768(v20, v33, v58, v59);
      swift_bridgeObjectRelease();
      os_log_type_t v34 = v61;
      sub_1C1EAE508();
      uint64_t v35 = sub_1C1EAE558();
      os_log_type_t v36 = sub_1C1EAF0D8();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        uint64_t v63 = v38;
        *(_DWORD *)uint64_t v37 = v53;
        uint64_t v39 = sub_1C1EAF908();
        *(void *)(v37 + 4) = sub_1C1DF8D44(v39, v40, &v63);
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2082;
        uint64_t v41 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        *(void *)(v37 + 14) = sub_1C1DF8D44(v41, v42, &v63);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C1DD2000, v35, v36, "******** [%s] feed population finished for %{public}s *******", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C874D2E0](v38, -1, -1);
        uint64_t v43 = v37;
        uint64_t v6 = v54;
        MEMORY[0x1C874D2E0](v43, -1, -1);

        uint64_t v19 = v61;
      }
      else
      {

        uint64_t v19 = v34;
      }
      v30(v19, v62);
      a3 = v55;
      ++v17;
    }
    while (v57 != v17);
    swift_bridgeObjectRelease();
    a4 = v50;
    a5 = v51;
  }
  uint64_t v44 = v6[11];
  uint64_t v45 = v6[12];
  __swift_project_boxed_opaque_existential_1(v6 + 8, v44);
  uint64_t v46 = (void *)swift_allocObject();
  void v46[2] = a3;
  v46[3] = a4;
  uint64_t v47 = v60;
  v46[4] = a5;
  v46[5] = v47;
  swift_bridgeObjectRetain();
  swift_retain();
  RelevanceEngineCoordinator.saveModelToDisk(completion:)((uint64_t)sub_1C1E9B5D0, (uint64_t)v46, v44, v45);
  return swift_release();
}

uint64_t sub_1C1E96E88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v6 = sub_1C1EAE568();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_1C1EAE558();
  os_log_type_t v11 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v25 = a3;
    uint64_t v13 = sub_1C1EAF908();
    uint64_t v26 = sub_1C1DF8D44(v13, v14, &v27);
    uint64_t v24 = a4;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x1C874C0C0](v15, MEMORY[0x1E4F674B8]);
    uint64_t v22 = v6;
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_1C1DF8D44(v16, v18, &v27);
    a3 = v25;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v10, v11, "[%s] Saved model and updated novelty counts after populating feeds %{public}s", (uint8_t *)v12, 0x16u);
    uint64_t v19 = v23;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v19, -1, -1);
    MEMORY[0x1C874D2E0](v12, -1, -1);

    uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return a3(v20);
}

uint64_t sub_1C1E97120@<X0>(uint64_t a1@<X8>)
{
  sub_1C1DD4C84();
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1
     + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain;
  swift_beginAccess();
  sub_1C1E9BAFC(v9, (uint64_t)v8, (uint64_t (*)(void))sub_1C1DD4C84);
  uint64_t v10 = sub_1C1EADD48();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_1C1E9B804((uint64_t)v8, (uint64_t (*)(void))sub_1C1DD4C84);
  sub_1C1E97314(v1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_1C1E2CD1C((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_1C1E97314(uint64_t a1)
{
  uint64_t v1 = *(void *)((*(uint64_t (**)(void))(*(void *)a1 + 248))() + 16);
  if (v1)
  {
    for (uint64_t i = 0; i != v1; ++i)
    {
      uint64_t v3 = sub_1C1EAE0F8();
      sub_1C1E588EC(v3);
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1EBB648A0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_1C1EADCC8();
}

uint64_t sub_1C1E97430()
{
  uint64_t v0 = sub_1C1EAE108();
  uint64_t v1 = sub_1C1E3BD24(v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1C1EAE138();
  uint64_t v3 = sub_1C1E3BD24(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1C1DFAF70(v3, v1, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_1C1E9AF7C);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_1C1E30B6C(v4);
  swift_release();
  return v5;
}

uint64_t sub_1C1E974C8(uint64_t a1)
{
  uint64_t v2 = sub_1C1EADD48();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v13 - v7;
  char v9 = sub_1C1EADD28();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, a1, v2);
  if (v9)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    char v10 = 0;
  }
  else
  {
    sub_1C1E97120((uint64_t)v6);
    char v10 = sub_1C1EADD38();
    uint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
    v11(v6, v2);
    v11(v8, v2);
  }
  return v10 & 1;
}

uint64_t sub_1C1E97638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v39 = a1;
  uint64_t v40 = a3;
  uint64_t v44 = *v4;
  uint64_t v43 = sub_1C1EAEB78();
  uint64_t v8 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  char v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C1EAEBD8();
  uint64_t v42 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v41 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1C1EAE568();
  uint64_t v13 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  uint64_t v16 = sub_1C1EAE558();
  os_log_type_t v17 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v35 = a4;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v34 = a2;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v36 = v11;
    uint64_t v21 = v20;
    *(void *)&v47[0] = v20;
    uint64_t v37 = v10;
    *(_DWORD *)uint64_t v19 = 136315138;
    v33[1] = v19 + 4;
    aBlock[0] = v44;
    swift_getMetatypeMetadata();
    uint64_t v22 = sub_1C1EAED68();
    aBlock[0] = sub_1C1DF8D44(v22, v23, (uint64_t *)v47);
    char v10 = v37;
    sub_1C1EAF2C8();
    a4 = v35;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v16, v17, "[%s]: Enqueuing submitTraining", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v21;
    uint64_t v11 = v36;
    MEMORY[0x1C874D2E0](v24, -1, -1);
    uint64_t v25 = v19;
    a2 = v34;
    MEMORY[0x1C874D2E0](v25, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v38);
  sub_1C1DFE408(a2, (uint64_t)v47);
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v27 = v39;
  v26[2] = v5;
  v26[3] = v27;
  sub_1C1DFE46C(v47, (uint64_t)(v26 + 4));
  uint64_t v28 = v40;
  v26[9] = v40;
  v26[10] = a4;
  v26[11] = v44;
  aBlock[4] = sub_1C1E9B634;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DF5050;
  aBlock[3] = &block_descriptor_9;
  uint64_t v29 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C1E16DEC(v28);
  char v30 = v41;
  sub_1C1EAEB98();
  uint64_t v45 = MEMORY[0x1E4FBC860];
  sub_1C1DFFC20((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
  sub_1C1E07320(0);
  sub_1C1DFFC20((unint64_t *)&qword_1EBB683D8, sub_1C1E07320);
  uint64_t v31 = v43;
  sub_1C1EAF328();
  MEMORY[0x1C874C3B0](0, v30, v10, v29);
  _Block_release(v29);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v31);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v30, v11);
  return swift_release();
}

uint64_t sub_1C1E97B64(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v30 = a3;
  uint64_t v31 = a6;
  uint64_t v10 = sub_1C1EAE568();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  uint64_t v14 = sub_1C1EAE558();
  os_log_type_t v15 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v29 = a5;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v27 = v10;
    uint64_t v18 = v17;
    uint64_t v32 = v17;
    uint64_t v28 = a4;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v26 = v16 + 4;
    uint64_t v33 = v31;
    swift_getMetatypeMetadata();
    uint64_t v19 = sub_1C1EAED68();
    uint64_t v33 = sub_1C1DF8D44(v19, v20, &v32);
    a4 = v28;
    sub_1C1EAF2C8();
    a5 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v14, v15, "[%s]: submitTraining dequeued and executing", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v18, -1, -1);
    MEMORY[0x1C874D2E0](v16, -1, -1);

    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v27);
  }
  else
  {

    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  MEMORY[0x1F4188790](v21);
  *(&v26 - 2) = (uint8_t *)a2;
  swift_retain();
  sub_1C1EAE1B8();
  swift_release();
  uint64_t v22 = a1[11];
  uint64_t v23 = a1[12];
  __swift_project_boxed_opaque_existential_1(a1 + 8, v22);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = a4;
  v24[3] = a5;
  v24[4] = v31;
  sub_1C1E16DEC(a4);
  RelevanceEngineCoordinator.submitTraining(trainingEvents:store:completion:)(a2, v30, (uint64_t)sub_1C1E9BAB8, (uint64_t)v24, v22, v23);
  return swift_release();
}

uint64_t sub_1C1E97E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = a3;
  uint64_t v44 = sub_1C1EAEB78();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v43 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C1EAEBD8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  uint64_t v42 = v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v40 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C1EAEB88();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1C1EAE568();
  uint64_t v14 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  uint64_t v17 = sub_1C1EAE558();
  os_log_type_t v18 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v35 = v13;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v37 = a1;
    unint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v38 = a2;
    uint64_t v22 = v21;
    uint64_t v46 = v21;
    uint64_t v36 = v11;
    *(_DWORD *)unint64_t v20 = 136315138;
    uint64_t v34 = v20 + 4;
    aBlock[0] = v39;
    swift_getMetatypeMetadata();
    uint64_t v23 = sub_1C1EAED68();
    aBlock[0] = sub_1C1DF8D44(v23, v24, &v46);
    uint64_t v11 = v36;
    sub_1C1EAF2C8();
    uint64_t v13 = v35;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v17, v18, "[%s]: submitTraining finished", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v22;
    a2 = v38;
    MEMORY[0x1C874D2E0](v25, -1, -1);
    uint64_t v26 = v20;
    a1 = v37;
    MEMORY[0x1C874D2E0](v26, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v45);
  if (a1)
  {
    sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68388);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCB20], v10);
    swift_retain();
    uint64_t v28 = (void *)sub_1C1EAF1B8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = a1;
    *(void *)(v29 + 24) = a2;
    aBlock[4] = sub_1C1DD885C;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C1DF5050;
    aBlock[3] = &block_descriptor_44;
    char v30 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v31 = v40;
    sub_1C1EAEB98();
    uint64_t v46 = MEMORY[0x1E4FBC860];
    sub_1C1DFFC20((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
    sub_1C1E07320(0);
    sub_1C1DFFC20((unint64_t *)&qword_1EBB683D8, sub_1C1E07320);
    uint64_t v33 = v43;
    uint64_t v32 = v44;
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v31, v33, v30);
    _Block_release(v30);

    sub_1C1E16DFC(a1);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v33, v32);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v41);
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1E9840C()
{
  sub_1C1E9B804(v0 + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain, (uint64_t (*)(void))sub_1C1DD4C84);
  return swift_release();
}

uint64_t SummaryTabFeedPopulationManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  sub_1C1E9B804(v0 + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain, (uint64_t (*)(void))sub_1C1DD4C84);
  swift_release();
  return v0;
}

uint64_t SummaryTabFeedPopulationManager.__deallocating_deinit()
{
  SummaryTabFeedPopulationManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C1E98534()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t sub_1C1E98558()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t sub_1C1E9857C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t SummaryTabFeedPopulationManager.collectDiagnosticLogs(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = MEMORY[0x1E4FBC860];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v5;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1C1E99014((uint64_t)sub_1C1E9B684, (uint64_t)v6);
  swift_release();
  return swift_release();
}

uint64_t sub_1C1E98670(uint64_t a1, uint8_t *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v59 = a3;
  uint64_t v60 = a5;
  uint64_t v8 = sub_1C1EAE568();
  uint64_t v57 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v56 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v53 - v11;
  uint64_t v13 = sub_1C1EAD258();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v53 - v18;
  sub_1C1E9B784();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (void **)((char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C1E9BAFC(a1, (uint64_t)v22, (uint64_t (*)(void))sub_1C1E9B784);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = *v22;
    sub_1C1EAE508();
    id v24 = v23;
    id v25 = v23;
    uint64_t v26 = sub_1C1EAE558();
    os_log_type_t v27 = sub_1C1EAF0B8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v61[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v55 = v28 + 4;
      uint64_t v62 = (uint64_t)v23;
      id v30 = v23;
      sub_1C1DF9148(0, (unint64_t *)&qword_1EBB68150);
      uint64_t v31 = sub_1C1EAED68();
      uint64_t v62 = sub_1C1DF8D44(v31, v32, v61);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C1DD2000, v26, v27, "Unable to get database diagnostics: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v29, -1, -1);
      MEMORY[0x1C874D2E0](v28, -1, -1);
    }
    else
    {
    }
    uint64_t v40 = v57;
    uint64_t v39 = v58;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v12, v58);
  }
  else
  {
    uint64_t v55 = a2;
    uint64_t v33 = (unint64_t *)(a2 + 16);
    uint64_t v34 = *(void (**)(char *, void **, uint64_t))(v14 + 32);
    v34(v19, v22, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    swift_beginAccess();
    unint64_t v35 = *v33;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v33 = v35;
    uint64_t v54 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v35 = sub_1C1E1C9B4(0, *(void *)(v35 + 16) + 1, 1, v35);
      *uint64_t v33 = v35;
    }
    unint64_t v38 = *(void *)(v35 + 16);
    unint64_t v37 = *(void *)(v35 + 24);
    if (v38 >= v37 >> 1)
    {
      unint64_t v35 = sub_1C1E1C9B4(v37 > 1, v38 + 1, 1, v35);
      *uint64_t v33 = v35;
    }
    *(void *)(v35 + 16) = v38 + 1;
    v34((char *)(v35+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v38), (void **)v17, v13);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    a4 = v54;
    a2 = v55;
    uint64_t v40 = v57;
    uint64_t v39 = v58;
  }
  uint64_t v41 = v56;
  sub_1C1EAE508();
  uint64_t v42 = sub_1C1EAE558();
  os_log_type_t v43 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_1C1DD2000, v42, v43, "Database logs collected. Now collecting RelevanceEngine logs", v44, 2u);
    MEMORY[0x1C874D2E0](v44, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
  uint64_t v45 = v59;
  uint64_t v46 = v59[11];
  uint64_t v47 = v59[12];
  __swift_project_boxed_opaque_existential_1(v59 + 8, v46);
  uint64_t v48 = sub_1C1EAE108();
  uint64_t v49 = (void *)swift_allocObject();
  v49[2] = v45;
  v49[3] = a2;
  uint64_t v50 = v60;
  v49[4] = a4;
  v49[5] = v50;
  uint64_t v51 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t, uint64_t))(v47 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  v51(v48, sub_1C1E9B9C0, v49, v46, v47);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1C1E98C6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1[11];
  uint64_t v8 = a1[12];
  __swift_project_boxed_opaque_existential_1(a1 + 8, v7);
  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  swift_retain();
  swift_retain();
  RelevanceEngineCoordinator.collectDiagnosticLogs(completion:)((uint64_t)sub_1C1E9BA3C, (uint64_t)v9, v7, v8);
  return swift_release();
}

uint64_t sub_1C1E98D30(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  v28[1] = a4;
  uint64_t v29 = a3;
  uint64_t v6 = sub_1C1EAD258();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C1EAE568();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (unint64_t *)(a2 + 16);
  sub_1C1EAE508();
  uint64_t v15 = sub_1C1EAE558();
  os_log_type_t v16 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    v28[0] = v9;
    uint64_t v18 = v6;
    uint64_t v19 = a1;
    uint64_t v20 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1C1DD2000, v15, v16, "RelevanceEngine logs collected", v17, 2u);
    uint64_t v21 = v20;
    a1 = v19;
    uint64_t v6 = v18;
    uint64_t v9 = (char *)v28[0];
    MEMORY[0x1C874D2E0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  swift_beginAccess();
  unint64_t v22 = *v14;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v14 = v22;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v22 = sub_1C1E1C9B4(0, *(void *)(v22 + 16) + 1, 1, v22);
    *uint64_t v14 = v22;
  }
  unint64_t v25 = *(void *)(v22 + 16);
  unint64_t v24 = *(void *)(v22 + 24);
  if (v25 >= v24 >> 1)
  {
    unint64_t v22 = sub_1C1E1C9B4(v24 > 1, v25 + 1, 1, v22);
    *uint64_t v14 = v22;
  }
  *(void *)(v22 + 16) = v25 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v25, v9, v6);
  swift_endAccess();
  uint64_t v26 = swift_bridgeObjectRetain();
  v29(v26);
  return swift_bridgeObjectRelease();
}

void sub_1C1E99014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(*(id *)(v2 + 56), sel_profileIdentifier);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v7 = (void *)sub_1C1EAD538();
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = v6;
  v8[3] = v3;
  v8[4] = a1;
  v8[5] = a2;
  v11[4] = sub_1C1E9B778;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C1DF5050;
  v11[3] = &block_descriptor_29;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_performBlock_, v9);

  _Block_release(v9);
}

uint64_t sub_1C1E99164(void *a1, unint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v109 = a4;
  int v110 = a3;
  sub_1C1E9B784();
  uint64_t v108 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v111 = (void **)((char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v107 = sub_1C1EAED58();
  uint64_t v106 = *(void *)(v107 - 8);
  MEMORY[0x1F4188790](v107);
  v139 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C1EAD258();
  uint64_t v138 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v115 = (char *)&v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v140 = (char *)&v102 - v12;
  uint64_t v114 = sub_1C1EAD3F8();
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x1F4188790](v114);
  unint64_t v112 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1E809D8();
  uint64_t v131 = v14;
  MEMORY[0x1F4188790](v14);
  v130 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_1C1EAD318();
  uint64_t v116 = *(void *)(v133 - 8);
  MEMORY[0x1F4188790](v133);
  uint64_t v132 = (char *)&v102 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v142 = 0;
  unint64_t v143 = 0xE000000000000000;
  sub_1C1EAF4A8();
  swift_bridgeObjectRelease();
  id v142 = (id)0xD000000000000016;
  unint64_t v143 = 0x80000001C1EB6A20;
  long long v136 = a1;
  id v17 = objc_msgSend(a1, sel_description);
  sub_1C1EAED38();

  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  id v150 = v142;
  unint64_t v151 = v143;
  uint64_t v18 = *(void *)(sub_1C1EAE118() + 16);
  uint64_t v137 = v9;
  unint64_t v141 = a2;
  if (v18)
  {
    sub_1C1EAE188();
    uint64_t v19 = 0;
    uint64_t v20 = (void *)(a2 + 16);
    unint64_t v134 = 0x80000001C1EB6A60;
    id v135 = (id)0x80000001C1EB6A40;
    do
    {
      __swift_project_boxed_opaque_existential_1(v20, *(void *)(a2 + 40));
      unint64_t v22 = (void *)sub_1C1EAD538();
      uint64_t v23 = (void *)sub_1C1EAE178();
      unint64_t v24 = (void *)sub_1C1EADE58();

      if (v24)
      {
        id v142 = (id)sub_1C1EAE0D8();
        unint64_t v143 = v21;
        swift_bridgeObjectRetain();
        sub_1C1EAEDB8();
        swift_bridgeObjectRelease();
        sub_1C1EAEDB8();
      }
      else
      {
        id v142 = 0;
        unint64_t v143 = 0xE000000000000000;
        sub_1C1EAF4A8();
        swift_bridgeObjectRelease();
        id v142 = (id)0xD000000000000010;
        unint64_t v143 = (unint64_t)v135;
        sub_1C1EAE0E8();
        sub_1C1EAEDB8();
        swift_bridgeObjectRelease();
        sub_1C1EAEDB8();
        sub_1C1EAEDB8();
      }
      ++v19;
      swift_bridgeObjectRelease();
      a2 = v141;
    }
    while (v18 != v19);
    swift_bridgeObjectRelease();
    uint64_t v9 = v137;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68238);
  sub_1C1DF32F0();
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1C1EB07F0;
  *(void *)(v25 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v25 + 64) = sub_1C1DF2A98();
  *(void *)(v25 + 32) = 0x7463655364656566;
  *(void *)(v25 + 40) = 0xEB000000006E6F69;
  uint64_t v26 = (void *)sub_1C1EAF018();
  sub_1C1EAE348();
  os_log_type_t v27 = (uint64_t (*)(void, uint64_t))MEMORY[0x1E4FBBE00];
  sub_1C1DFD308(0, (unint64_t *)&qword_1EBB68280, MEMORY[0x1E4F670C0], MEMORY[0x1E4FBBE00]);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1C1EB0800;
  uint64_t v29 = v136;
  *(void *)(v28 + 32) = v136;
  *(void *)(v28 + 40) = 0;
  id v30 = v29;
  uint64_t v31 = (void *)MEMORY[0x1C874B550](v28);
  uint64_t v32 = swift_bridgeObjectRelease();
  uint64_t v33 = (void *)MEMORY[0x1C874B480](v32);
  sub_1C1DFD308(0, (unint64_t *)&qword_1EBB660F8, MEMORY[0x1E4FBC838] + 8, v27);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1C1EB07E0;
  *(void *)(v34 + 32) = v26;
  *(void *)(v34 + 40) = v31;
  id v142 = (id)v34;
  sub_1C1EAEEB8();
  id v103 = v26;
  id v104 = v31;
  unint64_t v35 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  id v36 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v35);

  objc_msgSend(v33, sel_setPredicate_, v36);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_1C1EB04A0;
  id v38 = objc_allocWithZone(MEMORY[0x1E4F29008]);
  uint64_t v39 = (void *)sub_1C1EAED28();
  id v40 = objc_msgSend(v38, sel_initWithKey_ascending_, v39, 1);

  *(void *)(v37 + 32) = v40;
  id v142 = (id)v37;
  sub_1C1EAEEB8();
  sub_1C1DF9F8C(0, &qword_1EBB68258);
  uint64_t v41 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setSortDescriptors_, v41);

  __swift_project_boxed_opaque_existential_1((void *)(v141 + 16), *(void *)(v141 + 40));
  uint64_t v42 = (void *)sub_1C1EAD538();
  id v105 = v33;
  uint64_t v43 = sub_1C1EAF248();
  uint64_t v102 = 0;
  unint64_t v119 = v43;

  id v142 = 0;
  unint64_t v143 = 0xE000000000000000;
  sub_1C1EAF4A8();
  sub_1C1EAEDB8();
  uint64_t v44 = v119 >> 62;
  uint64_t v46 = v139;
  uint64_t v45 = v140;
  uint64_t v47 = v138;
  if (v119 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_1C1EAF638();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v48 = *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v144 = v48;
  sub_1C1EAF768();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  if (v44)
  {
    unint64_t v50 = v119;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_1C1EAF638();
    swift_bridgeObjectRelease();
    unint64_t v49 = v50;
    if (!v44) {
      goto LABEL_46;
    }
  }
  else
  {
    unint64_t v49 = v119;
    uint64_t v44 = *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v44)
    {
LABEL_46:
      swift_bridgeObjectRelease();
      uint64_t v90 = v102;
      uint64_t v91 = self;
      uint64_t v92 = v132;
      sub_1C1EAD308();
      uint64_t v93 = (void *)sub_1C1EAD2C8();
      (*(void (**)(char *, uint64_t))(v116 + 8))(v92, v133);
      v94 = v112;
      sub_1C1EAD3E8();
      uint64_t v95 = (void *)sub_1C1EAD3D8();
      (*(void (**)(char *, uint64_t))(v113 + 8))(v94, v114);
      id v96 = objc_msgSend(v91, sel_stringFromDate_timeZone_formatOptions_, v93, v95, 1907);

      sub_1C1EAED38();
      id v142 = 0;
      unint64_t v143 = 0xE000000000000000;
      sub_1C1EAF4A8();
      sub_1C1EAEDB8();
      sub_1C1EAEDB8();
      swift_bridgeObjectRelease();
      sub_1C1EAEDB8();
      sub_1C1EADA68();
      v97 = v115;
      sub_1C1EADA38();
      sub_1C1EAD228();
      swift_bridgeObjectRelease();
      uint64_t v98 = *(void (**)(char *, uint64_t))(v47 + 8);
      v98(v97, v9);
      id v142 = v150;
      unint64_t v143 = v151;
      sub_1C1EAED48();
      sub_1C1E4BB04();
      sub_1C1EAF2F8();
      (*(void (**)(char *, uint64_t))(v106 + 8))(v46, v107);
      swift_bridgeObjectRelease();
      if (v90)
      {
        v98(v45, v9);
        uint64_t v99 = (uint64_t)v111;
        *uint64_t v111 = v90;
        swift_storeEnumTagMultiPayload();
        id v100 = v90;
        v110(v99);

        return sub_1C1E9B804(v99, (uint64_t (*)(void))sub_1C1E9B784);
      }
      else
      {
        uint64_t v101 = (uint64_t)v111;
        (*(void (**)(void *, char *, uint64_t))(v47 + 16))(v111, v45, v9);
        swift_storeEnumTagMultiPayload();
        v110(v101);

        sub_1C1E9B804(v101, (uint64_t (*)(void))sub_1C1E9B784);
        return ((uint64_t (*)(char *, uint64_t))v98)(v45, v9);
      }
    }
  }
  unint64_t v51 = 0;
  unint64_t v129 = v49 & 0xC000000000000001;
  uint64_t v118 = v49 & 0xFFFFFFFFFFFFFF8;
  unint64_t v117 = v49 + 32;
  v128 = (void (**)(char *, uint64_t))(v116 + 8);
  unint64_t v127 = 0x80000001C1EB6B30;
  unint64_t v126 = 0x80000001C1EB6B50;
  unint64_t v125 = 0x80000001C1EB6B70;
  unint64_t v124 = 0x80000001C1EB6B90;
  unint64_t v123 = 0x80000001C1EB6BB0;
  unint64_t v122 = 0x80000001C1EB6BD0;
  unint64_t v120 = 0x80000001C1EB6BF0;
  uint64_t v121 = v44;
  while (1)
  {
    if (v129)
    {
      id v135 = (id)MEMORY[0x1C874C6F0](v51, v119);
      BOOL v54 = __OFADD__(v51, 1);
      unint64_t v55 = v51 + 1;
      if (v54) {
        goto LABEL_49;
      }
    }
    else
    {
      if (v51 >= *(void *)(v118 + 16)) {
        goto LABEL_51;
      }
      id v135 = *(id *)(v117 + 8 * v51);
      BOOL v54 = __OFADD__(v51, 1);
      unint64_t v55 = v51 + 1;
      if (v54)
      {
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
        goto LABEL_52;
      }
    }
    unint64_t v134 = v55;
    id v142 = 0;
    unint64_t v143 = 0xE000000000000000;
    sub_1C1EAF4A8();
    id v148 = v142;
    unint64_t v149 = v143;
    sub_1C1EAEDB8();
    id v56 = v135;
    id v57 = objc_msgSend(v135, sel_uniqueIdentifier);
    sub_1C1EAED38();

    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    id v142 = (id)sub_1C1EAE2D8();
    sub_1C1E584EC();
    sub_1C1DFFC20(&qword_1EBB65258, (void (*)(uint64_t))sub_1C1E584EC);
    uint64_t v58 = (void *)sub_1C1EAEFC8();
    swift_bridgeObjectRelease();
    sub_1C1EAD7B8();

    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    id v59 = objc_msgSend(v56, sel_dateSubmitted);
    uint64_t v60 = v132;
    sub_1C1EAD2F8();

    sub_1C1DFFC20(&qword_1EBB68160, MEMORY[0x1E4F27928]);
    uint64_t v61 = v133;
    sub_1C1EAF768();
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    (*v128)(v60, v61);
    sub_1C1EAEDB8();
    objc_msgSend(v56, sel_hideInDiscover);
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    id v142 = objc_msgSend(v56, sel_sortOrder);
    sub_1C1EAF768();
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    uint64_t v62 = (uint64_t)v130;
    sub_1C1EAE2E8();
    sub_1C1EAF298();
    sub_1C1E9B804(v62, (uint64_t (*)(void))sub_1C1E809D8);
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    uint64_t v63 = sub_1C1EAE298();
    uint64_t v44 = v63;
    unint64_t v141 = v63 & 0xC000000000000001;
    if ((v63 & 0xC000000000000001) == 0) {
      break;
    }
    uint64_t v64 = sub_1C1EAF3B8();
    if (v64) {
      goto LABEL_26;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    uint64_t v52 = (void *)MEMORY[0x1E4FBC860];
LABEL_17:
    id v142 = v52;
    sub_1C1DFD308(0, (unint64_t *)&qword_1EBB68358, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    sub_1C1E22EA0();
    sub_1C1EAECE8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    id v53 = v135;
    id v142 = (id)sub_1C1EAE2B8();
    sub_1C1E9BCAC(0, &qword_1EBB659C8, MEMORY[0x1E4FBB510]);
    sub_1C1E9B900();
    sub_1C1E4BB04();
    sub_1C1EAEE38();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    sub_1C1EAEDB8();
    sub_1C1EAEDB8();

    swift_bridgeObjectRelease();
    uint64_t v44 = v121;
    unint64_t v51 = v134;
    if (v134 == v121) {
      goto LABEL_46;
    }
  }
  uint64_t v64 = *(void *)(v63 + 16);
  if (!v64) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v147 = (void *)MEMORY[0x1E4FBC860];
  sub_1C1DE1100(0, v64 & ~(v64 >> 63), 0);
  if (v141)
  {
    uint64_t v65 = sub_1C1EAF358();
    unsigned __int8 v67 = 1;
  }
  else
  {
    uint64_t v65 = sub_1C1EA3818(v44);
    unsigned __int8 v67 = v68 & 1;
  }
  uint64_t v144 = v65;
  uint64_t v145 = v66;
  unsigned __int8 v146 = v67;
  if (v64 < 0) {
    goto LABEL_50;
  }
  uint64_t v69 = v44 & 0xFFFFFFFFFFFFFF8;
  if (v44 < 0) {
    uint64_t v69 = v44;
  }
  long long v136 = (void *)v69;
  while (1)
  {
    while (1)
    {
      uint64_t v76 = v144;
      uint64_t v75 = v145;
      uint64_t v77 = v146;
      sub_1C1EA3584(v144, v145, v146, v44);
      uint64_t v79 = v78;
      id v80 = objc_msgSend(v78, sel_identifier);
      uint64_t v81 = sub_1C1EAED38();
      uint64_t v83 = v82;

      uint64_t v84 = v147;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = sub_1C1DE1100(0, v84[2] + 1, 1);
        uint64_t v84 = v147;
      }
      unint64_t v87 = v84[2];
      unint64_t v86 = v84[3];
      if (v87 >= v86 >> 1)
      {
        uint64_t result = sub_1C1DE1100(v86 > 1, v87 + 1, 1);
        uint64_t v84 = v147;
      }
      v84[2] = v87 + 1;
      unint64_t v88 = &v84[2 * v87];
      v88[4] = v81;
      v88[5] = v83;
      if (v141) {
        break;
      }
      uint64_t v70 = sub_1C1E24590(v76, v75, v77, v44);
      uint64_t v72 = v71;
      char v74 = v73;
      sub_1C1E25D1C(v76, v75, v77);
      uint64_t v144 = v70;
      uint64_t v145 = v72;
      unsigned __int8 v146 = v74 & 1;
      uint64_t v9 = v137;
      uint64_t v47 = v138;
      uint64_t v46 = v139;
      uint64_t v45 = v140;
      if (!--v64) {
        goto LABEL_16;
      }
    }
    if ((v77 & 1) == 0) {
      break;
    }
    if (sub_1C1EAF378()) {
      swift_isUniquelyReferenced_nonNull_native();
    }
    uint64_t v9 = v137;
    uint64_t v47 = v138;
    uint64_t v46 = v139;
    uint64_t v45 = v140;
    sub_1C1E9B864(0, (unint64_t *)&qword_1EA2C12D0, MEMORY[0x1E4FBB4E0]);
    uint64_t v89 = (void (*)(id *, void))sub_1C1EAEF78();
    sub_1C1EAF418();
    v89(&v142, 0);
    if (!--v64)
    {
LABEL_16:
      sub_1C1E25D1C(v144, v145, v146);
      swift_bridgeObjectRelease();
      uint64_t v52 = v147;
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1E9A7D0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1C1E9BB64();
  uint64_t result = sub_1C1EAF488();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v4 + 48) + v14);
    sub_1C1EAF828();
    _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
    sub_1C1EAED98();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C1EAF858();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(unsigned char *)(*(void *)(v9 + 48) + v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1C1E9AA54(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1C1E9BCAC(0, (unint64_t *)&qword_1EBB67FA8, MEMORY[0x1E4FBB9A8]);
  uint64_t result = sub_1C1EAF488();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1C1EAF828();
    swift_bridgeObjectRetain();
    sub_1C1EAED98();
    uint64_t result = sub_1C1EAF858();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1C1E9AD04(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1C1E9B864(0, (unint64_t *)&qword_1EBB67060, MEMORY[0x1E4FBB9A8]);
  uint64_t result = sub_1C1EAF488();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_1C1EAF278();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1C1E9AF7C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v60 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    uint64_t v6 = 0;
    uint64_t v4 = a4 + 56;
    uint64_t v61 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v63 = (unint64_t)(v7 + 63) >> 6;
    int64_t v65 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      do
      {
LABEL_6:
        if (v9)
        {
          v9 &= v9 - 1;
        }
        else
        {
          int64_t v11 = v65 + 1;
          if (__OFADD__(v65, 1))
          {
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v11 >= v63) {
            goto LABEL_78;
          }
          uint64_t v12 = *(void *)(v61 + 8 * v11);
          int64_t v13 = v65 + 1;
          if (!v12)
          {
            int64_t v13 = v65 + 2;
            if (v65 + 2 >= v63) {
              goto LABEL_78;
            }
            uint64_t v12 = *(void *)(v61 + 8 * v13);
            if (!v12)
            {
              int64_t v13 = v65 + 3;
              if (v65 + 3 >= v63) {
                goto LABEL_78;
              }
              uint64_t v12 = *(void *)(v61 + 8 * v13);
              if (!v12)
              {
                int64_t v14 = v65 + 4;
                if (v65 + 4 >= v63)
                {
LABEL_78:
                  uint64_t v57 = a2;
LABEL_80:
                  swift_retain();
                  return sub_1C1E9A7D0(v60, v57, v6, v5);
                }
                uint64_t v12 = *(void *)(v61 + 8 * v14);
                if (!v12)
                {
                  while (1)
                  {
                    int64_t v13 = v14 + 1;
                    if (__OFADD__(v14, 1)) {
                      break;
                    }
                    if (v13 >= v63) {
                      goto LABEL_78;
                    }
                    uint64_t v12 = *(void *)(v61 + 8 * v13);
                    ++v14;
                    if (v12) {
                      goto LABEL_21;
                    }
                  }
LABEL_84:
                  __break(1u);
                  goto LABEL_85;
                }
                int64_t v13 = v65 + 4;
              }
            }
          }
LABEL_21:
          uint64_t v9 = (v12 - 1) & v12;
          int64_t v65 = v13;
        }
        sub_1C1EAF828();
        _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        sub_1C1EAED98();
        swift_bridgeObjectRelease();
        uint64_t result = sub_1C1EAF858();
        uint64_t v5 = a3;
        uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v16 = result & ~v15;
      }
      while (((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0);
      uint64_t v17 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
      uint64_t v19 = v18;
      if (v17 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v19 == v20) {
        goto LABEL_36;
      }
      uint64_t v4 = v20;
      char v22 = sub_1C1EAF7A8();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      if (v22)
      {
LABEL_38:
        *(unint64_t *)((char *)v60 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        if (__OFADD__(v6++, 1))
        {
          __break(1u);
          break;
        }
      }
      else
      {
        uint64_t v23 = ~v15;
        unint64_t v16 = (v16 + 1) & v23;
        if ((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
        {
          while (1)
          {
            uint64_t v24 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
            uint64_t v26 = v25;
            if (v24 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v26 == v27) {
              break;
            }
            uint64_t v4 = v27;
            char v29 = sub_1C1EAF7A8();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v29) {
              goto LABEL_37;
            }
            unint64_t v16 = (v16 + 1) & v23;
            uint64_t v5 = a3;
            if (((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
              goto LABEL_6;
            }
          }
LABEL_36:
          uint64_t result = swift_bridgeObjectRelease_n();
LABEL_37:
          uint64_t v5 = a3;
          goto LABEL_38;
        }
      }
    }
  }
  uint64_t v31 = 0;
  uint64_t v62 = v5 + 56;
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 < 64) {
    uint64_t v33 = ~(-1 << v32);
  }
  else {
    uint64_t v33 = -1;
  }
  unint64_t v34 = v33 & *(void *)(v5 + 56);
  int64_t v64 = (unint64_t)(v32 + 63) >> 6;
  int64_t v66 = 0;
  uint64_t v35 = v4 + 56;
LABEL_47:
  uint64_t v59 = v31;
  while (v34)
  {
    unint64_t v36 = __clz(__rbit64(v34));
    v34 &= v34 - 1;
    unint64_t v37 = v36 | (v66 << 6);
LABEL_64:
    sub_1C1EAF828();
    _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
    sub_1C1EAED98();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C1EAF858();
    uint64_t v42 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v43 = result & ~v42;
    if ((*(void *)(v35 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43))
    {
      uint64_t v44 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
      uint64_t v46 = v45;
      if (v44 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v46 == v47)
      {
LABEL_45:
        uint64_t v4 = a4;
        uint64_t result = swift_bridgeObjectRelease_n();
LABEL_46:
        *(unint64_t *)((char *)v60 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
        uint64_t v31 = v59 + 1;
        if (__OFADD__(v59, 1)) {
          goto LABEL_83;
        }
        goto LABEL_47;
      }
      char v49 = sub_1C1EAF7A8();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v4 = a4;
      if (v49) {
        goto LABEL_46;
      }
      uint64_t v50 = ~v42;
      while (1)
      {
        unint64_t v43 = (v43 + 1) & v50;
        if (((*(void *)(v35 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
          break;
        }
        uint64_t v51 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        uint64_t v53 = v52;
        if (v51 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v53 == v54) {
          goto LABEL_45;
        }
        char v56 = sub_1C1EAF7A8();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v4 = a4;
        if (v56) {
          goto LABEL_46;
        }
      }
    }
  }
  int64_t v38 = v66 + 1;
  uint64_t v5 = a3;
  if (__OFADD__(v66, 1)) {
    goto LABEL_82;
  }
  if (v38 >= v64)
  {
LABEL_79:
    uint64_t v57 = a2;
    uint64_t v6 = v59;
    goto LABEL_80;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v38);
  int64_t v40 = v66 + 1;
  if (v39) {
    goto LABEL_63;
  }
  int64_t v40 = v66 + 2;
  if (v66 + 2 >= v64) {
    goto LABEL_79;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v40);
  if (v39) {
    goto LABEL_63;
  }
  int64_t v40 = v66 + 3;
  if (v66 + 3 >= v64) {
    goto LABEL_79;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v40);
  if (v39)
  {
LABEL_63:
    unint64_t v34 = (v39 - 1) & v39;
    int64_t v66 = v40;
    unint64_t v37 = __clz(__rbit64(v39)) + (v40 << 6);
    goto LABEL_64;
  }
  int64_t v41 = v66 + 4;
  if (v66 + 4 >= v64) {
    goto LABEL_79;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v41);
  if (v39)
  {
    int64_t v40 = v66 + 4;
    goto LABEL_63;
  }
  while (1)
  {
    int64_t v40 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v40 >= v64) {
      goto LABEL_79;
    }
    unint64_t v39 = *(void *)(v62 + 8 * v40);
    ++v41;
    if (v39) {
      goto LABEL_63;
    }
  }
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_1C1E9B5A8()
{
  return sub_1C1E9655C(*(void *)(v0 + 16), *(id **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1C1E9B5B4()
{
  return objectdestroy_2Tm(MEMORY[0x1E4FBC898], 48);
}

uint64_t sub_1C1E9B5D0(uint64_t a1)
{
  return sub_1C1E96E88(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1C1E9B5DC()
{
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  if (*(void *)(v0 + 72)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1C1E9B634()
{
  return sub_1C1E97B64(*(void **)(v0 + 16), *(void *)(v0 + 24), (void *)(v0 + 32), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_1C1E9B648()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1E9B684(uint64_t a1)
{
  return sub_1C1E98670(a1, *(uint8_t **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1C1E9B690()
{
  return type metadata accessor for SummaryTabFeedPopulationManager();
}

uint64_t method lookup function for SummaryTabFeedPopulationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SummaryTabFeedPopulationManager);
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.generateHighlightsFeedIfAppropriate(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.managedFeedKinds.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.managedLiveFeedKinds.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.isChangeDomainPertinentForLiveUpdate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.submitTraining(trainingEvents:store:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t sub_1C1E9B778()
{
  return sub_1C1E99164(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32), *(void *)(v0 + 40));
}

void sub_1C1E9B784()
{
  if (!qword_1EA2C1660)
  {
    sub_1C1EAD258();
    sub_1C1DF9148(255, (unint64_t *)&qword_1EBB68150);
    unint64_t v0 = sub_1C1EAF8B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C1660);
    }
  }
}

uint64_t sub_1C1E9B804(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1C1E9B864(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_1C1DF9F8C(255, (unint64_t *)&qword_1EBB67F40);
    uint64_t v7 = sub_1C1E16A04(&qword_1EBB67F48, (unint64_t *)&qword_1EBB67F40);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1C1E9B900()
{
  unint64_t result = qword_1EA2C1668;
  if (!qword_1EA2C1668)
  {
    sub_1C1E9BCAC(255, &qword_1EBB659C8, MEMORY[0x1E4FBB510]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C1668);
  }
  return result;
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C1E9B9C0()
{
  return sub_1C1E98C6C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1C1E9B9CC()
{
  return objectdestroy_2Tm(MEMORY[0x1E4FBC8D0], 40);
}

uint64_t objectdestroy_2Tm(void (*a1)(void), uint64_t a2)
{
  a1(*(void *)(v2 + 16));
  swift_release();
  return MEMORY[0x1F4186498](v2, a2, 7);
}

uint64_t sub_1C1E9BA3C(uint64_t a1)
{
  return sub_1C1E98D30(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1C1E9BA48()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_1C1E58ECC(v0);
}

uint64_t sub_1C1E9BA78()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C1E9BAB8()
{
  return sub_1C1E97E6C(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C1E9BAC4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1E9BAFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1C1E9BB64()
{
  if (!qword_1EBB65498)
  {
    sub_1C1E3C0C0();
    unint64_t v0 = sub_1C1EAF498();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB65498);
    }
  }
}

uint64_t sub_1C1E9BBC0()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(1);
}

uint64_t sub_1C1E9BBEC()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

void sub_1C1E9BC18()
{
  if (!qword_1EBB67068)
  {
    sub_1C1DF9F8C(255, &qword_1EBB68260);
    sub_1C1E16A04((unint64_t *)&qword_1EBB67000, &qword_1EBB68260);
    unint64_t v0 = sub_1C1EAF498();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB67068);
    }
  }
}

void sub_1C1E9BCAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB1B0]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1C1E9BD30()
{
  sub_1C1EADCA8();
  sub_1C1EADC68();
  unint64_t v0 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_featureWithName_featureType_, v0, 1);

  qword_1EBB6ACF0 = (uint64_t)v1;
}

uint64_t sub_1C1E9BDB0()
{
  if (qword_1EBB680E0 != -1) {
    swift_once();
  }
  uint64_t v0 = *(void *)(sub_1C1EADA88() + 16);
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C1E863EC(v0);
  qword_1EBB6ACE8 = result;
  return result;
}

uint64_t HealthExperienceStoreFeedItemContext.fetchAllPluginStorage()()
{
  sub_1C1DFCCCC();
  sub_1C1DF32F0();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1C1EB0800;
  uint64_t v2 = MEMORY[0x1E4FBB1A0];
  *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v3 = sub_1C1DF2A98();
  *(void *)(v1 + 64) = v3;
  strcpy((char *)(v1 + 32), "plugin.package");
  *(unsigned char *)(v1 + 47) = -18;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo), *(void *)(v0 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo + 24));
  uint64_t v4 = sub_1C1EAD5B8();
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 104) = v3;
  *(void *)(v1 + 72) = v4;
  *(void *)(v1 + 80) = v5;
  uint64_t v6 = (void *)sub_1C1EAF018();
  uint64_t v7 = sub_1C1E9BF88((uint64_t)v6);

  return v7;
}

uint64_t sub_1C1E9BF30()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C1E9BF78()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1E9BF88(uint64_t a1)
{
  sub_1C1EAD5A8();
  unint64_t v3 = (void *)sub_1C1EAD588();
  objc_msgSend(v3, sel_setPredicate_, a1);
  uint64_t v12 = MEMORY[0x1E4FBC860];
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_storageContext);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = &v12;
  v5[3] = v1;
  void v5[4] = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1C1E9C520;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_1C1E9C53C;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DD8834;
  aBlock[3] = &block_descriptor_13;
  uint64_t v7 = _Block_copy(aBlock);
  swift_retain();
  id v8 = v3;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_performBlockAndWait_, v7);

  _Block_release(v7);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_1C1E9C148(void *a1)
{
  uint64_t v2 = sub_1C1EAD748();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  id v8 = (char *)&v21 - v7;
  sub_1C1EAD5A8();
  unint64_t v9 = sub_1C1EAF248();
  unint64_t v10 = v9;
  if (!(v9 >> 62))
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v12 = MEMORY[0x1E4FBC860];
LABEL_17:
    *a1 = v12;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1C1EAF638();
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v24 = MEMORY[0x1E4FBC860];
  sub_1C1E22214(0, v11 & ~(v11 >> 63), 0);
  if ((v11 & 0x8000000000000000) == 0)
  {
    char v22 = a1;
    uint64_t v12 = v24;
    if ((v10 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        MEMORY[0x1C874C6F0](i, v10);
        sub_1C1EAD758();
        uint64_t v24 = v12;
        unint64_t v15 = *(void *)(v12 + 16);
        unint64_t v14 = *(void *)(v12 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_1C1E22214(v14 > 1, v15 + 1, 1);
          uint64_t v12 = v24;
        }
        *(void *)(v12 + 16) = v15 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v15, v8, v2);
      }
    }
    else
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        id v17 = *(id *)(v10 + 8 * j + 32);
        sub_1C1EAD758();
        uint64_t v24 = v12;
        unint64_t v19 = *(void *)(v12 + 16);
        unint64_t v18 = *(void *)(v12 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_1C1E22214(v18 > 1, v19 + 1, 1);
          uint64_t v12 = v24;
        }
        *(void *)(v12 + 16) = v19 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v19, v6, v2);
      }
    }
    swift_bridgeObjectRelease();
    a1 = v22;
    goto LABEL_17;
  }
  __break(1u);
  uint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_1C1EAF4A8();
  sub_1C1EAEDB8();
  uint64_t v23 = v11;
  sub_1C1DF9148(0, (unint64_t *)&qword_1EBB68150);
  sub_1C1EAF5B8();
  uint64_t result = sub_1C1EAF628();
  __break(1u);
  return result;
}

uint64_t sub_1C1E9C4E0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C1E9C520()
{
  return sub_1C1E9C148(*(void **)(v0 + 16));
}

uint64_t sub_1C1E9C52C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:)(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_queue) = a1;
  uint64_t v9 = v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  uint64_t v10 = sub_1C1EAD9C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
  uint64_t v11 = v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  uint64_t v12 = sub_1C1EADA28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a4, v12);
  sub_1C1DFE46C(a2, v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  return v8;
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  uint64_t v4 = sub_1C1EAD9C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_1C1E9C6C0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1C1EAD9C8();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v7 = sub_1C1EAD828();
  uint64_t v8 = MEMORY[0x1E4F670D8];
  a2[3] = v7;
  a2[4] = v8;
  __swift_allocate_boxed_opaque_existential_0(a2);
  swift_bridgeObjectRetain();
  return sub_1C1EAD808();
}

uint64_t sub_1C1E9C7BC()
{
  uint64_t v1 = sub_1C1EAD9C8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C1E9C84C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_1C1EAD9C8() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_1C1E9C6C0(v4, a1);
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  uint64_t v2 = sub_1C1EAD9C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  uint64_t v4 = sub_1C1EADA28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  uint64_t v2 = sub_1C1EAD9C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  uint64_t v4 = sub_1C1EADA28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_1C1E9CA98()
{
  return type metadata accessor for GenerationOperationToGeneratorPipelineAdaptor();
}

uint64_t sub_1C1E9CAA0()
{
  uint64_t result = sub_1C1EAD9C8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C1EADA28();
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

uint64_t method lookup function for GenerationOperationToGeneratorPipelineAdaptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GenerationOperationToGeneratorPipelineAdaptor);
}

uint64_t dispatch thunk of GenerationOperationToGeneratorPipelineAdaptor.publisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of GenerationOperationToGeneratorPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1C1E9CBD4(uint64_t a1)
{
  uint64_t v20 = MEMORY[0x1E4FBC860];
  uint64_t v18 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v19 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      unint64_t v7 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v8 = v7 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v19) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v18 + 8 * v15);
    ++v6;
    if (!v16)
    {
      int64_t v6 = v15 + 1;
      if (v15 + 1 >= v19) {
        goto LABEL_23;
      }
      unint64_t v16 = *(void *)(v18 + 8 * v6);
      if (!v16)
      {
        int64_t v6 = v15 + 2;
        if (v15 + 2 >= v19) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v18 + 8 * v6);
        if (!v16)
        {
          int64_t v6 = v15 + 3;
          if (v15 + 3 >= v19) {
            goto LABEL_23;
          }
          unint64_t v16 = *(void *)(v18 + 8 * v6);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v4 = (v16 - 1) & v16;
    unint64_t v8 = __clz(__rbit64(v16)) + (v6 << 6);
LABEL_5:
    uint64_t v9 = *(void **)(*(void *)(a1 + 48) + 8 * v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 16 * v8 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 24);
    id v13 = v9;
    swift_unknownObjectRetain();
    uint64_t v14 = v12(ObjectType, v10);
    swift_unknownObjectRelease();

    uint64_t result = sub_1C1E58EF8(v14);
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v19)
  {
LABEL_23:
    swift_release();
    return v20;
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16)
  {
    int64_t v6 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v6 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v6 >= v19) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v18 + 8 * v6);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *ProfileDashboardsFeedPopulationListener.__allocating_init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_allocObject();
  uint64_t v10 = sub_1C1E9FA90(a1, a2, a3, a4, a5);
  uint64_t v11 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a3, v11);
  return v10;
}

void *ProfileDashboardsFeedPopulationListener.init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int64_t v6 = sub_1C1E9FA90(a1, a2, a3, a4, a5);
  uint64_t v7 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a3, v7);
  return v6;
}

uint64_t sub_1C1E9CF08(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    sub_1C1EAD5D8();
    swift_release();
    sub_1C1E9E72C(a1);
    swift_retain();
    sub_1C1EAD5E8();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1E9CFA4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(*(void *)result + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v6 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v9 = *(void **)(v3 + 8 * v5 + 32);
      if (v9)
      {
        id v10 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1C1DE1428(0, *(void *)(v6 + 16) + 1, 1);
        }
        unint64_t v8 = *(void *)(v6 + 16);
        unint64_t v7 = *(void *)(v6 + 24);
        if (v8 >= v7 >> 1) {
          sub_1C1DE1428(v7 > 1, v8 + 1, 1);
        }
        *(void *)(v6 + 16) = v8 + 1;
        *(void *)(v6 + 8 * v8 + 32) = v9;
      }
      ++v5;
    }
    while (v4 != v5);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4FBC860];
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1C1E9D0A8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1C1EAE568();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    sub_1C1EAD5D8();
    swift_release();
    sub_1C1EAE508();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_1C1EAE558();
    os_log_type_t v12 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v24 = v6;
      uint64_t v14 = v13;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v25 = v22;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v26 = a3;
      swift_getMetatypeMetadata();
      uint64_t v23 = v5;
      uint64_t v15 = sub_1C1EAED68();
      uint64_t v26 = sub_1C1DF8D44(v15, v16, &v25);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v17 = swift_bridgeObjectRetain();
      uint64_t v18 = MEMORY[0x1C874C0C0](v17, MEMORY[0x1E4F670C0]);
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      uint64_t v26 = sub_1C1DF8D44(v18, v20, &v25);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v11, v12, "[%s]: Received new source profiles, creating new feed population managers for %s", (uint8_t *)v14, 0x16u);
      uint64_t v21 = v22;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v21, -1, -1);
      MEMORY[0x1C874D2E0](v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v23);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    sub_1C1E9DF10(v9);
    swift_retain();
    sub_1C1EAD5E8();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1E9D3B4()
{
  *(void *)(v0 + 64) = 0;
  return swift_release();
}

uint64_t sub_1C1E9D3C0()
{
  sub_1C1EAD5D8();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  sub_1C1EAD5E8();
  uint64_t v2 = sub_1C1E9CBD4(v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1C1E9D438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v4 = *v3;
  uint64_t v24 = a1;
  uint64_t v25 = v4;
  uint64_t v5 = sub_1C1EAEB78();
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1C1EAEBD8();
  uint64_t v8 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C1EAEB88();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAD5D8();
  swift_beginAccess();
  uint64_t v15 = v3[12];
  swift_bridgeObjectRetain();
  sub_1C1EAD5E8();
  uint64_t v16 = sub_1C1E31030(v15);
  swift_bridgeObjectRelease();
  sub_1C1DF9F8C(0, (unint64_t *)&qword_1EBB68388);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCB20], v11);
  uint64_t v17 = (void *)sub_1C1EAF1B8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  uint64_t v19 = v26;
  uint64_t v20 = v27;
  v18[3] = v24;
  v18[4] = v19;
  uint64_t v21 = v25;
  v18[5] = v20;
  v18[6] = v21;
  aBlock[4] = sub_1C1E9FEC0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DF5050;
  aBlock[3] = &block_descriptor_14;
  uint64_t v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C1EAEB98();
  uint64_t v30 = MEMORY[0x1E4FBC860];
  sub_1C1DFFC68((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
  sub_1C1E07320(0);
  sub_1C1DFFC68((unint64_t *)&qword_1EBB683D8, sub_1C1E07320);
  sub_1C1EAF328();
  MEMORY[0x1C874C3B0](0, v10, v7, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v28);
  return swift_release();
}

void sub_1C1E9D868(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v66 = a5;
  uint64_t v59 = a4;
  uint64_t v65 = sub_1C1EAD368();
  uint64_t v8 = *(void *)(v65 - 8);
  MEMORY[0x1F4188790](v65);
  int64_t v64 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1C1EAE568();
  uint64_t v10 = *(void *)(v71 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v71);
  char v73 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v56 - v13;
  dispatch_group_t v72 = dispatch_group_create();
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v60 = v14;
  if (v15)
  {
    uint64_t v57 = v10;
    uint64_t v58 = a3;
    uint64_t v70 = (void (**)(char *, uint64_t))(v10 + 8);
    int64_t v63 = (void (**)(char *, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    uint64_t v56 = a1;
    uint64_t v16 = (uint64_t *)(a1 + 40);
    *(void *)&long long v17 = 136315650;
    long long v62 = v17;
    uint64_t v61 = MEMORY[0x1E4FBC840] + 8;
    do
    {
      uint64_t v23 = *v16;
      swift_unknownObjectRetain();
      sub_1C1EAE508();
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v24 = sub_1C1EAE558();
      uint64_t v25 = a2;
      os_log_type_t v26 = sub_1C1EAF0D8();
      if (os_log_type_enabled(v24, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v68 = swift_slowAlloc();
        uint64_t v74 = v68;
        *(_DWORD *)uint64_t v27 = v62;
        uint64_t v75 = v66;
        swift_getMetatypeMetadata();
        uint64_t v28 = sub_1C1EAED68();
        os_log_t v67 = v24;
        *(void *)(v27 + 4) = sub_1C1DF8D44(v28, v29, &v74);
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2080;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v31 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(ObjectType, v23);
        id v32 = objc_msgSend(v31, sel_profileIdentifier, v56);
        uint64_t v69 = v23;
        id v33 = v32;

        id v34 = objc_msgSend(v33, sel_identifier);
        uint64_t v35 = v64;
        sub_1C1EAD348();

        sub_1C1DFFC68((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
        uint64_t v36 = v65;
        uint64_t v37 = sub_1C1EAF768();
        unint64_t v39 = v38;
        int64_t v40 = v35;
        LOBYTE(v35) = v26;
        int64_t v41 = v73;
        (*v63)(v40, v36);
        *(void *)(v27 + 14) = sub_1C1DF8D44(v37, v39, &v74);
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 22) = 2080;
        uint64_t v42 = swift_bridgeObjectRetain();
        uint64_t v43 = MEMORY[0x1C874C0C0](v42, MEMORY[0x1E4F674B8]);
        unint64_t v45 = v44;
        swift_bridgeObjectRelease();
        *(void *)(v27 + 24) = sub_1C1DF8D44(v43, v45, &v74);
        swift_bridgeObjectRelease_n();
        uint64_t v23 = v69;
        swift_bridgeObjectRelease();
        os_log_t v46 = v67;
        _os_log_impl(&dword_1C1DD2000, v67, (os_log_type_t)v35, "[%s]: Sending population request to populationManager for profile %s and kinds: %s", (uint8_t *)v27, 0x20u);
        uint64_t v47 = v68;
        swift_arrayDestroy();
        MEMORY[0x1C874D2E0](v47, -1, -1);
        MEMORY[0x1C874D2E0](v27, -1, -1);

        (*v70)(v41, v71);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease_n();
        (*v70)(v73, v71);
      }
      a2 = v25;
      dispatch_group_t v18 = v72;
      dispatch_group_enter(v72);
      uint64_t v19 = swift_getObjectType();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v18;
      uint64_t v21 = *(void (**)(uint64_t, void (*)(), uint64_t, uint64_t, uint64_t))(v23 + 40);
      uint64_t v22 = v18;
      v21(a2, sub_1C1E8FBF0, v20, v19, v23);
      swift_unknownObjectRelease();
      swift_release();
      v16 += 2;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    uint64_t v10 = v57;
    a3 = v58;
    uint64_t v14 = v60;
  }
  sub_1C1EAF138();
  sub_1C1EAE538();
  uint64_t v48 = sub_1C1EAE558();
  os_log_type_t v49 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = v10;
    uint64_t v52 = swift_slowAlloc();
    uint64_t v74 = v52;
    *(_DWORD *)uint64_t v50 = 136315138;
    uint64_t v75 = v66;
    swift_getMetatypeMetadata();
    uint64_t v53 = sub_1C1EAED68();
    uint64_t v75 = sub_1C1DF8D44(v53, v54, &v74);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v48, v49, "[%s]: All population complete!", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v52, -1, -1);
    MEMORY[0x1C874D2E0](v50, -1, -1);

    uint64_t v55 = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v60, v71);
  }
  else
  {

    uint64_t v55 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v14, v71);
  }
  a3(v55);
}

uint64_t sub_1C1E9DF10(uint64_t a1)
{
  uint64_t v92 = *v1;
  uint64_t v98 = sub_1C1EAE568();
  uint64_t v3 = *(void *)(v98 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v98);
  uint64_t v99 = (char *)v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v88 - v6;
  uint64_t v102 = v1 + 12;
  swift_beginAccess();
  uint64_t v8 = v1[12];
  v94 = v1;
  v1[12] = MEMORY[0x1E4FBC868];
  uint64_t v100 = a1;
  uint64_t v97 = *(void *)(a1 + 16);
  if (!v97) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v89 = v7;
  id v96 = (void (**)(char *, uint64_t))(v3 + 8);
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  *(void *)&long long v10 = 136315394;
  long long v91 = v10;
  uint64_t v90 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v95 = v8;
  while (1)
  {
    uint64_t v12 = *(void **)(v100 + 8 * v9 + 32);
    uint64_t v13 = *(void *)(v8 + 16);
    id v14 = v12;
    uint64_t v15 = v14;
    if (v13)
    {
      id v16 = v14;
      unint64_t v17 = sub_1C1E60C44((uint64_t)v12);
      if (v18)
      {
        long long v93 = *(_OWORD *)(*(void *)(v8 + 56) + 16 * v17);
        uint64_t v19 = v93;
        swift_unknownObjectRetain();

        uint64_t v20 = v89;
        sub_1C1EAE508();
        id v21 = v16;
        uint64_t v22 = sub_1C1EAE558();
        os_log_type_t v23 = sub_1C1EAF0D8();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          v88[1] = v19;
          v88[0] = v25;
          id v103 = (void *)v25;
          *(_DWORD *)uint64_t v24 = v91;
          uint64_t v104 = v92;
          swift_getMetatypeMetadata();
          uint64_t v26 = sub_1C1EAED68();
          uint64_t v101 = v15;
          *(void *)(v24 + 4) = sub_1C1DF8D44(v26, v27, (uint64_t *)&v103);
          swift_bridgeObjectRelease();
          *(_WORD *)(v24 + 12) = 2080;
          id v28 = v21;
          uint64_t v29 = sub_1C1EAD798();
          id v30 = v21;
          unint64_t v32 = v31;

          uint64_t v33 = v29;
          uint64_t v8 = v95;
          *(void *)(v24 + 14) = sub_1C1DF8D44(v33, v32, (uint64_t *)&v103);

          uint64_t v15 = v101;
          id v21 = v30;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C1DD2000, v22, v23, "[%s]: Reusing existing population manager for sourceProfile %s", (uint8_t *)v24, 0x16u);
          uint64_t v34 = v88[0];
          swift_arrayDestroy();
          MEMORY[0x1C874D2E0](v34, -1, -1);
          MEMORY[0x1C874D2E0](v24, -1, -1);
        }
        else
        {
        }
        (*v96)(v20, v98);
        uint64_t v70 = v102;
        swift_beginAccess();
        id v71 = v21;
        swift_unknownObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        id v103 = (void *)*v70;
        uint64_t v73 = (uint64_t)v103;
        uint64_t *v70 = 0x8000000000000000;
        unint64_t v75 = sub_1C1E60C44((uint64_t)v12);
        uint64_t v76 = *(void *)(v73 + 16);
        BOOL v77 = (v74 & 1) == 0;
        uint64_t v78 = v76 + v77;
        if (__OFADD__(v76, v77)) {
          goto LABEL_40;
        }
        char v79 = v74;
        if (*(void *)(v73 + 24) < v78)
        {
          sub_1C1E9F248(v78, isUniquelyReferenced_nonNull_native);
          unint64_t v80 = sub_1C1E60C44((uint64_t)v12);
          if ((v79 & 1) != (v81 & 1)) {
            goto LABEL_42;
          }
          unint64_t v75 = v80;
          uint64_t v82 = v103;
          if ((v79 & 1) == 0) {
            goto LABEL_33;
          }
LABEL_31:
          uint64_t v83 = v82[7];
          swift_unknownObjectRelease();
          *(_OWORD *)(v83 + 16 * v75) = v93;
LABEL_35:
          *uint64_t v102 = (uint64_t)v82;

          swift_bridgeObjectRelease();
          swift_endAccess();
          swift_unknownObjectRelease();
          goto LABEL_5;
        }
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v82 = v103;
          if (v74) {
            goto LABEL_31;
          }
        }
        else
        {
          sub_1C1E9F8D4();
          uint64_t v82 = v103;
          if (v79) {
            goto LABEL_31;
          }
        }
LABEL_33:
        v82[(v75 >> 6) + 8] |= 1 << v75;
        *(void *)(v82[6] + 8 * v75) = v12;
        *(_OWORD *)(v82[7] + 16 * v75) = v93;
        uint64_t v84 = v82[2];
        BOOL v67 = __OFADD__(v84, 1);
        uint64_t v85 = v84 + 1;
        if (v67) {
          goto LABEL_41;
        }
        v82[2] = v85;
        id v86 = v71;
        goto LABEL_35;
      }
    }
    uint64_t v35 = v99;
    sub_1C1EAE508();
    id v36 = v15;
    uint64_t v37 = sub_1C1EAE558();
    os_log_type_t v38 = sub_1C1EAF0D8();
    BOOL v39 = os_log_type_enabled(v37, v38);
    uint64_t v101 = v15;
    if (v39)
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      id v103 = (void *)v41;
      *(_DWORD *)uint64_t v40 = v91;
      uint64_t v104 = v92;
      swift_getMetatypeMetadata();
      uint64_t v42 = sub_1C1EAED68();
      *(void *)(v40 + 4) = sub_1C1DF8D44(v42, v43, (uint64_t *)&v103);
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      id v44 = v36;
      uint64_t v45 = sub_1C1EAD798();
      unint64_t v47 = v46;

      *(void *)(v40 + 14) = sub_1C1DF8D44(v45, v47, (uint64_t *)&v103);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v37, v38, "[%s]: Creating new population manager for sourceProfile %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v41, -1, -1);
      MEMORY[0x1C874D2E0](v40, -1, -1);

      (*v96)(v99, v98);
    }
    else
    {

      (*v96)(v35, v98);
    }
    uint64_t v48 = v94;
    os_log_type_t v49 = *(uint64_t (**)(void *))(*v94 + 288);
    id v50 = v36;
    uint64_t v51 = v49(v12);
    uint64_t v53 = v52;
    swift_beginAccess();
    char v54 = swift_isUniquelyReferenced_nonNull_native();
    id v103 = (void *)v48[12];
    uint64_t v55 = (uint64_t)v103;
    v48[12] = 0x8000000000000000;
    unint64_t v57 = sub_1C1E60C44((uint64_t)v12);
    uint64_t v58 = *(void *)(v55 + 16);
    BOOL v59 = (v56 & 1) == 0;
    uint64_t v60 = v58 + v59;
    if (__OFADD__(v58, v59)) {
      break;
    }
    char v61 = v56;
    if (*(void *)(v55 + 24) >= v60)
    {
      if ((v54 & 1) == 0) {
        sub_1C1E9F8D4();
      }
    }
    else
    {
      sub_1C1E9F248(v60, v54);
      unint64_t v62 = sub_1C1E60C44((uint64_t)v12);
      if ((v61 & 1) != (v63 & 1)) {
        goto LABEL_42;
      }
      unint64_t v57 = v62;
    }
    uint64_t v15 = v101;
    int64_t v64 = v103;
    if (v61)
    {
      uint64_t v11 = (uint64_t *)(v103[7] + 16 * v57);
      swift_unknownObjectRelease();
      *uint64_t v11 = v51;
      v11[1] = v53;
    }
    else
    {
      v103[(v57 >> 6) + 8] |= 1 << v57;
      *(void *)(v64[6] + 8 * v57) = v12;
      uint64_t v65 = (uint64_t *)(v64[7] + 16 * v57);
      *uint64_t v65 = v51;
      v65[1] = v53;
      uint64_t v66 = v64[2];
      BOOL v67 = __OFADD__(v66, 1);
      uint64_t v68 = v66 + 1;
      if (v67) {
        goto LABEL_39;
      }
      v64[2] = v68;
      id v69 = v50;
    }
    *uint64_t v102 = (uint64_t)v64;

    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v8 = v95;
LABEL_5:
    ++v9;

    if (v97 == v9)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = sub_1C1EAF7D8();
  __break(1u);
  return result;
}

uint64_t sub_1C1E9E72C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v2 + 12;
  uint64_t v54 = *v2;
  uint64_t v5 = sub_1C1EAE568();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51[0] = a1;
  uint64_t v9 = sub_1C1EADD08();
  uint64_t v10 = *(void *)(v9 + 56);
  uint64_t v57 = v9 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t result = swift_beginAccess();
  int64_t v15 = 0;
  uint64_t v58 = (uint64_t (**)(char *, uint64_t))(v6 + 8);
  int64_t v59 = (unint64_t)(v11 + 63) >> 6;
  *(void *)&long long v16 = 136315650;
  long long v52 = v16;
  v51[1] = MEMORY[0x1E4FBC840] + 8;
  uint64_t v53 = v5;
  while (1)
  {
    if (v13)
    {
      uint64_t v60 = (v13 - 1) & v13;
      int64_t v61 = v15;
      unint64_t v17 = __clz(__rbit64(v13)) | (v15 << 6);
      goto LABEL_23;
    }
    int64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v18 >= v59) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v57 + 8 * v18);
    int64_t v20 = v15 + 1;
    if (!v19)
    {
      int64_t v20 = v15 + 2;
      if (v15 + 2 >= v59) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v57 + 8 * v20);
      if (!v19)
      {
        int64_t v20 = v15 + 3;
        if (v15 + 3 >= v59) {
          return swift_release();
        }
        unint64_t v19 = *(void *)(v57 + 8 * v20);
        if (!v19) {
          break;
        }
      }
    }
LABEL_22:
    uint64_t v60 = (v19 - 1) & v19;
    int64_t v61 = v20;
    unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
LABEL_23:
    uint64_t v22 = *(void **)(*(void *)(v9 + 48) + 8 * v17);
    uint64_t v23 = *v4;
    uint64_t v24 = *(void *)(*v4 + 16);
    id v25 = v22;
    if (v24)
    {
      swift_bridgeObjectRetain();
      unint64_t v26 = sub_1C1E60C44((uint64_t)v22);
      if (v27)
      {
        uint64_t v28 = *(void *)(*(void *)(v23 + 56) + 16 * v26 + 8);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(void, uint64_t, uint64_t))(v28 + 48))(v51[0], ObjectType, v28);

        uint64_t result = swift_unknownObjectRelease();
        goto LABEL_6;
      }
      swift_bridgeObjectRelease();
    }
    sub_1C1EAE538();
    id v30 = v25;
    swift_retain_n();
    id v31 = v30;
    unint64_t v32 = sub_1C1EAE558();
    os_log_type_t v33 = sub_1C1EAF0B8();
    int v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      v62[0] = v56;
      *(_DWORD *)uint64_t v35 = v52;
      v62[4] = v54;
      swift_getMetatypeMetadata();
      uint64_t v36 = sub_1C1EAED68();
      *(void *)(v35 + 4) = sub_1C1DF8D44(v36, v37, v62);
      swift_bridgeObjectRelease();
      int v55 = v34;
      *(_WORD *)(v35 + 12) = 2080;
      id v38 = v31;
      uint64_t v39 = sub_1C1EAD798();
      unint64_t v41 = v40;

      *(void *)(v35 + 14) = sub_1C1DF8D44(v39, v41, v62);
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2080;
      sub_1C1E3C06C();
      sub_1C1E19B1C();
      uint64_t v42 = v9;
      unint64_t v43 = v8;
      id v44 = v4;
      uint64_t v45 = v2;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_1C1EAEC48();
      unint64_t v48 = v47;
      swift_bridgeObjectRelease();
      *(void *)(v35 + 24) = sub_1C1DF8D44(v46, v48, v62);
      swift_release_n();
      uint64_t v2 = v45;
      uint64_t v4 = v44;
      uint64_t v8 = v43;
      uint64_t v9 = v42;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v32, (os_log_type_t)v55, "[%s]: Population manager missing for sourceProfile %s: populationManagers %s", (uint8_t *)v35, 0x20u);
      uint64_t v49 = v56;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v49, -1, -1);
      uint64_t v50 = v35;
      uint64_t v5 = v53;
      MEMORY[0x1C874D2E0](v50, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t result = (*v58)(v8, v5);
LABEL_6:
    unint64_t v13 = v60;
    int64_t v15 = v61;
  }
  uint64_t v21 = v15 + 4;
  if (v15 + 4 >= v59) {
    return swift_release();
  }
  unint64_t v19 = *(void *)(v57 + 8 * v21);
  if (v19)
  {
    int64_t v20 = v15 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v20 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v20 >= v59) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v57 + 8 * v20);
    ++v21;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1C1E9EC40(void *a1)
{
  if (a1)
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F2B0B8]);
    id v4 = a1;
    id v5 = objc_msgSend(v3, sel_init);
    objc_msgSend(v5, sel_setProfileIdentifier_, v4);
    objc_msgSend(v5, sel_resume);
    sub_1C1DFE408(v1 + 16, (uint64_t)&v14);
    type metadata accessor for ProfileDashboardFeedPopulationManager();
    uint64_t v6 = (uint64_t *)swift_allocObject();
    uint64_t v7 = (char *)v6
       + OBJC_IVAR____TtC18HealthPlatformCore37ProfileDashboardFeedPopulationManager____lazy_storage___pertinentChangeDomain;
    uint64_t v8 = sub_1C1EADD48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
    sub_1C1DFE408((uint64_t)&v14, (uint64_t)v13);
    type metadata accessor for ProfileDashboardRelevanceEngineCoordinator();
    swift_allocObject();
    id v9 = v5;
    uint64_t v10 = sub_1C1E5ED58((uint64_t)v13, v9);

    sub_1C1DFE408((uint64_t)&v14, (uint64_t)v13);
    uint64_t v11 = sub_1C1E2BF28((uint64_t)v13, v9, (uint64_t)v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);

    return (uint64_t)v11;
  }
  else
  {
    sub_1C1EAF4A8();
    sub_1C1EAEDB8();
    sub_1C1EAD798();
    sub_1C1EAEDB8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C1EAF628();
    __break(1u);
  }
  return result;
}

uint64_t ProfileDashboardsFeedPopulationListener.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  sub_1C1E16DFC(*(void *)(v0 + 72));
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ProfileDashboardsFeedPopulationListener.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  sub_1C1E16DFC(*(void *)(v0 + 72));
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1C1E9EEE4()
{
  *(void *)(*(void *)v0 + 64) = 0;
  return swift_release();
}

uint64_t sub_1C1E9EEF4(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  sub_1C1E6F5F4();
  char v38 = a2;
  uint64_t v6 = sub_1C1EAF668();
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
  uint64_t v35 = v2;
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
          id v3 = v35;
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
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1C1EAF828();
    sub_1C1EAED98();
    uint64_t result = sub_1C1EAF858();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v3 = v35;
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
  *id v3 = v7;
  return result;
}

uint64_t sub_1C1E9F200(uint64_t a1, int a2)
{
  return sub_1C1DFEF28(a1, a2, (uint64_t (*)(void))sub_1C1DFB68C, &qword_1EBB67D90, (void (*)(uint64_t))sub_1C1DFB68C, (uint64_t (*)(void))sub_1C1DFB68C);
}

uint64_t sub_1C1E9F248(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  sub_1C1E9FFC8();
  uint64_t v6 = sub_1C1EAF668();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v32 = v2;
  uint64_t v33 = v5 + 64;
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
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v33 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          id v3 = v32;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v33 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v33 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    uint64_t v29 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
    long long v34 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
    if ((a2 & 1) == 0)
    {
      id v30 = v29;
      swift_unknownObjectRetain();
    }
    sub_1C1EAF828();
    sub_1C1EAD7D8();
    uint64_t result = sub_1C1EAF858();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v29;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v18) = v34;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v3 = v32;
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

id sub_1C1E9F538()
{
  uint64_t v1 = v0;
  sub_1C1E0E230();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C1EAF658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    unint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
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

id sub_1C1E9F6DC()
{
  uint64_t v1 = v0;
  sub_1C1E6F5F4();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C1EAF658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    int64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
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

void *sub_1C1E9F88C()
{
  return sub_1C1DFBBC4((uint64_t (*)(void))sub_1C1DFB68C, &qword_1EBB67D90, (void (*)(uint64_t))sub_1C1DFB68C, (uint64_t (*)(void))sub_1C1DFB68C);
}

void *sub_1C1E9F8D4()
{
  uint64_t v1 = v0;
  sub_1C1E9FFC8();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C1EAF658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    id v20 = v17;
    id result = (void *)swift_unknownObjectRetain();
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

void *sub_1C1E9FA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v36 = a2;
  uint64_t v33 = *v5;
  uint64_t v34 = a1;
  sub_1C1E0C15C();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v37 = v11;
  uint64_t v38 = v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v35 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v32 - v17;
  sub_1C1EAD608();
  *(_OWORD *)(v5 + 7) = 0u;
  *(_OWORD *)(v5 + 9) = 0u;
  swift_allocObject();
  uint64_t v19 = sub_1C1EAD5F8();
  uint64_t v20 = MEMORY[0x1E4FBC868];
  v5[11] = v19;
  v5[12] = v20;
  sub_1C1DFE408(a2, (uint64_t)(v5 + 2));
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  unint64_t v21 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v22 = (v16 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a4;
  *(void *)(v23 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v23 + v21, v18, v14);
  *(void *)(v23 + v22) = v6;
  uint64_t v24 = v33;
  *(void *)(v23 + ((v22 + 15) & 0xFFFFFFFFFFFFFFF8)) = v33;
  uint64_t v25 = v6[9];
  v6[9] = sub_1C1E17DEC;
  v6[10] = v23;
  swift_retain();
  sub_1C1E16DFC(v25);
  uint64_t v39 = v34;
  sub_1C1E0C010(0, (unint64_t *)&qword_1EBB66F20, &qword_1EBB66F98, MEMORY[0x1E4F670C0], MEMORY[0x1E4F1AAE0]);
  sub_1C1E10020(0, &qword_1EBB66F98);
  sub_1C1E0C088();
  unint64_t v26 = v35;
  sub_1C1EAEA68();
  uint64_t v27 = swift_allocObject();
  swift_weakInit();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v27;
  *(void *)(v28 + 24) = v24;
  sub_1C1DFFC68(&qword_1EBB64E08, (void (*)(uint64_t))sub_1C1E0C15C);
  uint64_t v29 = v37;
  uint64_t v30 = sub_1C1EAEB48();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v36);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v29);
  v6[7] = v30;
  swift_release();
  return v6;
}

uint64_t sub_1C1E9FE78()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1C1E9FEC0()
{
  sub_1C1E9D868(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t method lookup function for ProfileDashboardsFeedPopulationListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ProfileDashboardsFeedPopulationListener);
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.__allocating_init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.startListening()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.stopListening()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.managedFeedKinds.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.populateAllFeeds(feedKinds:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.makePopulationManager(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

void sub_1C1E9FFC8()
{
  if (!qword_1EBB65158)
  {
    sub_1C1E3C06C();
    sub_1C1E19B1C();
    unint64_t v0 = sub_1C1EAF698();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB65158);
    }
  }
}

uint64_t sub_1C1EA0034()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1EA006C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for FeedPopulationListenerSchedulerConfiguration() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v11 = *(void *)(*(void *)v2 + 64);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
  uint64_t v5 = v0 + v4 + v2[11];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v5, AssociatedTypeWitness);
  uint64_t v7 = v0 + v4 + v2[12];
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_release();
  return MEMORY[0x1F4186498](v0, ((((v11 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_1C1EA02BC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1EA02F4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1EA032C(uint64_t *a1)
{
  return sub_1C1E9D0A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1C1EA0334(uint64_t a1)
{
  return sub_1C1E9CF08(a1);
}

HealthPlatformCore::AppSessionAnalyticsEvent::DemographicAnalytics __swiftcall AppSessionAnalyticsEvent.DemographicAnalytics.init()()
{
  uint64_t v1 = v0;
  result.hasPairedWatch.super.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, objc_msgSend(self, sel_hasPairedWatch));
  v1->hasPairedWatch.super.super.isa = result.hasPairedWatch.super.super.isa;
  return result;
}

HealthPlatformCore::AppSessionAnalyticsEvent::ImproveHealthAnalytics __swiftcall AppSessionAnalyticsEvent.ImproveHealthAnalytics.init()()
{
  uint64_t v1 = v0;
  result.isImproveHealthAndActivityAllowed.super.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, HKImproveHealthAndActivityAnalyticsAllowed());
  v1->isImproveHealthAndActivityAllowed.super.super.isa = result.isImproveHealthAndActivityAllowed.super.super.isa;
  return result;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(feedItem:)(uint64_t a1)
{
  return sub_1C1EA0410(a1, (void (*)(uint64_t))AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(feedItem:));
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(feedItem:)(uint64_t a1)
{
  return sub_1C1EA0410(a1, (void (*)(uint64_t))AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:));
}

uint64_t sub_1C1EA0410(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = swift_allocObject();
  a2(a1);
  return v4;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.init(ageOfFeed:feedItemsGeneratedTypes:feedItemsShownTypes:feedType:minutesElapsed:spinnerDisplayed:)@<X0>(char a1@<W1>, unint64_t a2@<X2>, unint64_t a3@<X3>, char a4@<W6>, char a5@<W7>, void *a6@<X8>)
{
  LOBYTE(v7) = a4;
  unint64_t v9 = 0x1E4F28000uLL;
  uint64_t v10 = &off_1E6443000;
  if (a1)
  {
    id v36 = 0;
    if ((a4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  uint64_t v6 = &off_1E6443000;
  if (qword_1EBB67740 != -1) {
    goto LABEL_45;
  }
  while (1)
  {
    sub_1C1EA2920();
    uint64_t v10 = v6;
    id v36 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 3792)), (SEL)v6 + 2091, sub_1C1EAE3A8());
    if (v7)
    {
LABEL_4:
      uint64_t v7 = 0;
    }
    else
    {
LABEL_6:
      if (qword_1EBB64720 != -1) {
        swift_once();
      }
      sub_1C1EA2920();
      uint64_t v7 = (uint64_t)objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 3792)), (SEL)v10[336], sub_1C1EAE3A8());
    }
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_1C1EAF638();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (qword_1EBB67748 != -1) {
      swift_once();
    }
    sub_1C1EA2920();
    id v34 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 3792)), (SEL)v10[336], sub_1C1EAE3A8());
    uint64_t v35 = v7;
    if (v11)
    {
      uint64_t v40 = MEMORY[0x1E4FBC860];
      sub_1C1DE1100(0, v11 & ~(v11 >> 63), 0);
      if (v11 < 0)
      {
        __break(1u);
        goto LABEL_44;
      }
      uint64_t v12 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0)
        {
          uint64_t v13 = MEMORY[0x1C874C6F0](v12, a2);
        }
        else
        {
          uint64_t v13 = *(void *)(a2 + 8 * v12 + 32);
          swift_retain();
        }
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)v13 + 120))();
        uint64_t v16 = v15;
        swift_release();
        unint64_t v18 = *(void *)(v40 + 16);
        unint64_t v17 = *(void *)(v40 + 24);
        if (v18 >= v17 >> 1) {
          sub_1C1DE1100(v17 > 1, v18 + 1, 1);
        }
        ++v12;
        *(void *)(v40 + 16) = v18 + 1;
        uint64_t v19 = v40 + 16 * v18;
        *(void *)(v19 + 32) = v14;
        *(void *)(v19 + 40) = v16;
      }
      while (v11 != v12);
      swift_bridgeObjectRelease();
      unint64_t v9 = 0x1E4F28000;
      uint64_t v10 = &off_1E6443000;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v20 = sub_1C1EAE3E8();
    swift_bridgeObjectRelease();
    uint64_t v6 = (_UNKNOWN **)a3;
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_1C1EAF638();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v7 >= 9) {
      uint64_t v21 = 9;
    }
    else {
      uint64_t v21 = v7;
    }
    id v22 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 3792)), (SEL)v10[336], v21);
    if (!v7)
    {
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
    uint64_t v41 = MEMORY[0x1E4FBC860];
    sub_1C1DE1100(0, v7 & ~(v7 >> 63), 0);
    if ((v7 & 0x8000000000000000) == 0) {
      break;
    }
LABEL_44:
    __break(1u);
LABEL_45:
    swift_once();
  }
  id v33 = v22;
  uint64_t v23 = 0;
  do
  {
    if ((a3 & 0xC000000000000001) != 0) {
      MEMORY[0x1C874C6F0](v23, v6);
    }
    else {
      swift_retain();
    }
    uint64_t v24 = sub_1C1EA2974();
    uint64_t v26 = v25;
    swift_release();
    unint64_t v28 = *(void *)(v41 + 16);
    unint64_t v27 = *(void *)(v41 + 24);
    if (v28 >= v27 >> 1) {
      sub_1C1DE1100(v27 > 1, v28 + 1, 1);
    }
    ++v23;
    *(void *)(v41 + 16) = v28 + 1;
    uint64_t v29 = v41 + 16 * v28;
    *(void *)(v29 + 32) = v24;
    *(void *)(v29 + 40) = v26;
    uint64_t v6 = (_UNKNOWN **)a3;
  }
  while (v7 != v23);
  swift_bridgeObjectRelease();
  id v22 = v33;
LABEL_40:
  uint64_t v30 = sub_1C1EAE3E8();
  swift_bridgeObjectRelease();
  _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
  uint64_t v31 = sub_1C1EAED28();
  swift_bridgeObjectRelease();
  id result = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 3792)), sel_initWithBool_, a5 & 1);
  *a6 = v36;
  a6[1] = v34;
  a6[2] = v20;
  a6[3] = v22;
  a6[4] = v30;
  a6[5] = v31;
  a6[6] = v35;
  a6[7] = result;
  return result;
}

void AppSessionAnalyticsEvent.ModelAnalytics.init(relevanceEngineMetrics:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1C1EAED38();
  if (*(void *)(a1 + 16) && (unint64_t v6 = sub_1C1DE7C10(v4, v5), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 56) + 8 * v6);
    id v9 = v8;
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  sub_1C1EA3530();
  uint64_t v10 = sub_1C1EAE3B8();

  uint64_t v11 = sub_1C1EAED38();
  if (*(void *)(a1 + 16) && (unint64_t v13 = sub_1C1DE7C10(v11, v12), (v14 & 1) != 0))
  {
    uint64_t v15 = *(void **)(*(void *)(a1 + 56) + 8 * v13);
    id v16 = v15;
  }
  else
  {
    uint64_t v15 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_1C1EAE3B8();

  uint64_t v18 = sub_1C1EAED38();
  if (*(void *)(a1 + 16) && (unint64_t v20 = sub_1C1DE7C10(v18, v19), (v21 & 1) != 0))
  {
    id v22 = *(void **)(*(void *)(a1 + 56) + 8 * v20);
    id v23 = v22;
  }
  else
  {
    id v22 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_1C1EAE3B8();

  uint64_t v25 = sub_1C1EAED38();
  if (*(void *)(a1 + 16) && (unint64_t v27 = sub_1C1DE7C10(v25, v26), (v28 & 1) != 0))
  {
    uint64_t v29 = *(void **)(*(void *)(a1 + 56) + 8 * v27);
    id v30 = v29;
  }
  else
  {
    uint64_t v29 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_1C1EAE3B8();

  uint64_t v32 = sub_1C1EAED38();
  if (*(void *)(a1 + 16) && (unint64_t v34 = sub_1C1DE7C10(v32, v33), (v35 & 1) != 0))
  {
    id v36 = *(void **)(*(void *)(a1 + 56) + 8 * v34);
    id v37 = v36;
  }
  else
  {
    id v36 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_1C1EAE3B8();

  *a2 = v10;
  a2[1] = v17;
  a2[2] = v24;
  a2[3] = v31;
  a2[4] = v38;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(feedItem:modelTrainingEvent:)(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1C1E89470(a2, v4+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent);
  swift_retain();
  id v5 = objc_msgSend(a1, sel_sectionSortOrder);
  *(void *)(v4
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank) = v5;
  swift_release();
  AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(a1);
  sub_1C1EA3B70(a2, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
  return v4;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.init(averageProbabilityOfPositiveInteractionForThisSession:interactedFeedItems:)@<X0>(unint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  sub_1C1EA3980();
  uint64_t v4 = sub_1C1EAE3C8();
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_1C1EAE3E8();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v4;
    a2[1] = v13;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1C1EAF638();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v17 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1C1DE1100(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = 0;
    unint64_t v14 = a1 & 0xC000000000000001;
    unint64_t v8 = a1;
    do
    {
      if (v14) {
        MEMORY[0x1C874C6F0](v7, a1);
      }
      else {
        swift_retain();
      }
      sub_1C1EA1B08();
      sub_1C1EAF768();
      sub_1C1EAEDB8();
      swift_bridgeObjectRelease();
      sub_1C1EAEDB8();
      type metadata accessor for ModelTrainingEvent();
      sub_1C1EAEDB8();
      swift_bridgeObjectRelease();
      sub_1C1EAEDB8();
      sub_1C1EAEDB8();
      swift_bridgeObjectRelease();
      sub_1C1EAEDB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_1C1EAEDD8();
      uint64_t v16 = v9;
      sub_1C1EAEDA8();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v11 = *(void *)(v17 + 16);
      unint64_t v10 = *(void *)(v17 + 24);
      if (v11 >= v10 >> 1) {
        sub_1C1DE1100(v10 > 1, v11 + 1, 1);
      }
      ++v7;
      *(void *)(v17 + 16) = v11 + 1;
      uint64_t v12 = v17 + 16 * v11;
      *(void *)(v12 + 32) = v15;
      *(void *)(v12 + 40) = v16;
      a1 = v8;
    }
    while (v5 != v7);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id AppSessionAnalyticsEvent.ModelAnalytics.averageModelPrediction.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.averageModelEntropy.getter()
{
  id v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.cumulativeAverageProbabilityOfPositiveInteraction.getter()
{
  id v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.modelTotalTrainingEvents.getter()
{
  id v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.normalizedAverageModelEntropy.getter()
{
  id v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

uint64_t AppSessionAnalyticsEvent.ModelAnalytics.init(averageModelPrediction:averageModelEntropy:cumulativeAverageProbabilityOfPositiveInteraction:modelTotalTrainingEvents:normalizedAverageModelEntropy:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

void sub_1C1EA1118()
{
  qword_1EBB6AC68 = (uint64_t)&unk_1F1D651B8;
}

void sub_1C1EA112C()
{
  qword_1EBB6AC80 = (uint64_t)&unk_1F1D652B8;
}

void sub_1C1EA1140()
{
  qword_1EBB6AB70 = (uint64_t)&unk_1F1D65248;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ageOfFeed.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedCount.getter()
{
  return *(id *)(v0 + 8);
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedTypes.getter()
{
  return *(id *)(v0 + 16);
}

void AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedTypes.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t (*AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedTypes.modify())()
{
  return nullsub_1;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsShownCount.getter()
{
  return *(id *)(v0 + 24);
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsShownTypes.getter()
{
  return *(id *)(v0 + 32);
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedType.getter()
{
  return *(id *)(v0 + 40);
}

void *AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.minutesElapsed.getter()
{
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  return v1;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.spinnerDisplayed.getter()
{
  return *(id *)(v0 + 56);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.init(ageOfFeed:feedItemsGeneratedCount:feedItemsGeneratedTypes:feedItemsShownCount:feedItemsShownTypes:feedType:minutesElapsed:spinnerDisplayed:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.dataTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.dataVisualizationKind.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1EA39D4(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, a1, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.timeScope.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1EA39D4(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, a1, &qword_1EBB66190, MEMORY[0x1E4F67200]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  sub_1C1EA3A40(a2, v6+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3A40(a3, v6+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  return v6;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(dataTypes:dataVisualizationKind:timeScope:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  sub_1C1EA3A40(a2, v3+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3A40(a3, v3+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  return v3;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(void *a1)
{
  sub_1C1EA3BD0(0, &qword_1EBB661B8, MEMORY[0x1E4F672A8]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v53 = (char *)&v50 - v3;
  sub_1C1EA3BD0(0, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  MEMORY[0x1F4188790](v4 - 8);
  int v55 = (char *)&v50 - v5;
  sub_1C1EA3BD0(0, &qword_1EBB66208, MEMORY[0x1E4F674A0]);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v51 = (char *)&v50 - v7;
  sub_1C1EA3BD0(0, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  MEMORY[0x1F4188790](v8 - 8);
  long long v52 = (char *)&v50 - v9;
  uint64_t v54 = a1;
  uint64_t v10 = sub_1C1EAE298();
  uint64_t v11 = v10;
  unint64_t v12 = v10 & 0xC000000000000001;
  if ((v10 & 0xC000000000000001) != 0)
  {
    uint64_t v13 = sub_1C1EAF3B8();
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x1E4FBC860];
LABEL_23:
    uint64_t v35 = v56;
    *(void *)(v56 + 16) = v17;
    uint64_t v36 = sub_1C1EAE048();
    uint64_t v37 = (uint64_t)v51;
    uint64_t v38 = v54;
    sub_1C1EAE248();
    uint64_t v39 = *(void *)(v36 - 8);
    int v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v37, 1, v36);
    uint64_t v41 = (uint64_t)v55;
    uint64_t v43 = (uint64_t)v52;
    uint64_t v42 = (uint64_t)v53;
    if (v40 == 1)
    {
      sub_1C1EA3AAC(v37, &qword_1EBB66208, MEMORY[0x1E4F674A0]);
      uint64_t v44 = sub_1C1EADE38();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v43, 1, 1, v44);
    }
    else
    {
      sub_1C1EAE038();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v36);
      uint64_t v45 = sub_1C1EADE38();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v43, 0, 1, v45);
    }
    sub_1C1EA3A40(v43, v35+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
    uint64_t v46 = sub_1C1EADCA8();
    sub_1C1EAE248();
    uint64_t v47 = *(void *)(v46 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v42, 1, v46) == 1)
    {

      sub_1C1EA3AAC(v42, &qword_1EBB661B8, MEMORY[0x1E4F672A8]);
      uint64_t v48 = sub_1C1EADAA8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v41, 1, 1, v48);
    }
    else
    {
      sub_1C1EADC98();

      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v42, v46);
      uint64_t v49 = sub_1C1EADAA8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v41, 0, 1, v49);
    }
    sub_1C1EA3A40(v41, v35+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
    return v35;
  }
  uint64_t v13 = *(void *)(v10 + 16);
  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v62 = MEMORY[0x1E4FBC860];
  sub_1C1E22184(0, v13 & ~(v13 >> 63), 0);
  if (v12)
  {
    uint64_t result = sub_1C1EAF358();
    unsigned __int8 v16 = 1;
  }
  else
  {
    uint64_t result = sub_1C1EA381C(v11);
    unsigned __int8 v16 = v18 & 1;
  }
  uint64_t v59 = result;
  uint64_t v60 = v15;
  unsigned __int8 v61 = v16;
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v11 < 0) {
      uint64_t v19 = v11;
    }
    uint64_t v57 = v19;
    do
    {
      while (1)
      {
        uint64_t v25 = v59;
        uint64_t v26 = v60;
        uint64_t v27 = v61;
        sub_1C1EA35B4(v59, v60, v61, v11, (void (*)(void))sub_1C1E29964);
        uint64_t v29 = v28;
        id v30 = objc_msgSend(v28, sel_code);

        uint64_t v31 = v62;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_1C1E22184(0, *(void *)(v31 + 16) + 1, 1);
          uint64_t v31 = v62;
        }
        unint64_t v33 = *(void *)(v31 + 16);
        unint64_t v32 = *(void *)(v31 + 24);
        if (v33 >= v32 >> 1)
        {
          uint64_t result = sub_1C1E22184(v32 > 1, v33 + 1, 1);
          uint64_t v31 = v62;
        }
        *(void *)(v31 + 16) = v33 + 1;
        *(void *)(v31 + 8 * v33 + 32) = v30;
        if (v12) {
          break;
        }
        uint64_t v20 = sub_1C1E24590(v25, v26, v27, v11);
        uint64_t v22 = v21;
        char v24 = v23;
        sub_1C1E25D1C(v25, v26, v27);
        uint64_t v59 = v20;
        uint64_t v60 = v22;
        unsigned __int8 v61 = v24 & 1;
        if (!--v13) {
          goto LABEL_22;
        }
      }
      if ((v27 & 1) == 0) {
        goto LABEL_31;
      }
      if (sub_1C1EAF378()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_1C1E298D0();
      unint64_t v34 = (void (*)(char *, void))sub_1C1EAEF78();
      sub_1C1EAF418();
      v34(v58, 0);
      --v13;
    }
    while (v13);
LABEL_22:
    sub_1C1E25D1C(v59, v60, v61);
    swift_bridgeObjectRelease();
    uint64_t v17 = v62;
    goto LABEL_23;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1C1EA1B08()
{
  uint64_t v1 = *v0;
  sub_1C1EA3BD0(0, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v26 - v3;
  sub_1C1EA3BD0(0, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v26 - v6;
  uint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  uint64_t v8 = v0[2];
  int64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (v9)
  {
    v26[0] = v4;
    v26[1] = v1;
    *(void *)&long long v27 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1C1E22014(0, v9, 0);
    uint64_t v11 = 0;
    uint64_t v10 = v27;
    unint64_t v12 = *(void *)(v27 + 16);
    do
    {
      uint64_t v13 = *(void *)(v8 + 8 * v11 + 32);
      *(void *)&long long v27 = v10;
      unint64_t v14 = *(void *)(v10 + 24);
      if (v12 >= v14 >> 1)
      {
        sub_1C1E22014(v14 > 1, v12 + 1, 1);
        uint64_t v10 = v27;
      }
      ++v11;
      *(void *)(v10 + 16) = v12 + 1;
      *(void *)(v10 + 8 * v12++ + 32) = v13;
    }
    while (v9 != v11);
    swift_bridgeObjectRelease();
    uint64_t v4 = (char *)v26[0];
  }
  MEMORY[0x1C874C0C0](v10, MEMORY[0x1E4FBB550]);
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  sub_1C1EA39D4((uint64_t)v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, (uint64_t)v7, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  uint64_t v15 = sub_1C1EADE38();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15);
  uint64_t v18 = MEMORY[0x1E4FBB1A0];
  if (v17 == 1)
  {
    sub_1C1EA3AAC((uint64_t)v7, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
    long long v27 = 0u;
    long long v28 = 0u;
  }
  else
  {
    uint64_t v19 = sub_1C1EADE28();
    *((void *)&v28 + 1) = v18;
    *(void *)&long long v27 = v19;
    *((void *)&v27 + 1) = v20;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v15);
  }
  sub_1C1EA3B08(&qword_1EBB666B8, (void (*)(uint64_t))type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem);
  sub_1C1EAE3D8();
  sub_1C1EA3B70((uint64_t)&v27, (uint64_t (*)(void))sub_1C1E1F794);
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  sub_1C1EA39D4((uint64_t)v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, (uint64_t)v4, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  uint64_t v21 = sub_1C1EADAA8();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v4, 1, v21) == 1)
  {
    sub_1C1EA3AAC((uint64_t)v4, &qword_1EBB66190, MEMORY[0x1E4F67200]);
    long long v27 = 0u;
    long long v28 = 0u;
  }
  else
  {
    uint64_t v23 = sub_1C1EADA98();
    *((void *)&v28 + 1) = v18;
    *(void *)&long long v27 = v23;
    *((void *)&v27 + 1) = v24;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v21);
  }
  sub_1C1EAE3D8();
  sub_1C1EA3B70((uint64_t)&v27, (uint64_t (*)(void))sub_1C1E1F794);
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.deinit()
{
  swift_bridgeObjectRelease();
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  return v0;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  return swift_deallocClassInstance();
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.rank.getter()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.magnitude.getter()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.completeness.getter()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.prominence.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1EA39D4(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, a1, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:rank:magnitude:completeness:prominence:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t v17 = swift_allocObject();
  *(void *)(v17
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank) = a4;
  uint64_t v18 = v17
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude;
  *(void *)uint64_t v18 = a5;
  *(unsigned char *)(v18 + 8) = a6 & 1;
  uint64_t v19 = v17
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness;
  *(void *)uint64_t v19 = a7;
  *(unsigned char *)(v19 + 8) = a8 & 1;
  sub_1C1EA3A40(a9, v17+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  *(void *)(v17 + 16) = a1;
  sub_1C1EA3A40(a2, v17+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3A40(a3, v17+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  return v17;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(dataTypes:dataVisualizationKind:timeScope:rank:magnitude:completeness:prominence:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8, uint64_t a9)
{
  *(void *)(v9
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank) = a4;
  uint64_t v13 = v9
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude;
  *(void *)uint64_t v13 = a5;
  *(unsigned char *)(v13 + 8) = a6 & 1;
  uint64_t v14 = v9
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness;
  *(void *)uint64_t v14 = a7;
  *(unsigned char *)(v14 + 8) = a8 & 1;
  sub_1C1EA3A40(a9, v9+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  *(void *)(v9 + 16) = a1;
  sub_1C1EA3A40(a2, v9+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3A40(a3, v9+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  return v9;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(feedItem:)(void *a1)
{
  sub_1C1EA3BD0(0, &qword_1EBB661C0, MEMORY[0x1E4F672E0]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v33 - v4;
  sub_1C1EA3BD0(0, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v33 - v7;
  sub_1C1EA3BD0(0, &qword_1EBB66200, MEMORY[0x1E4F67470]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v33 - v10;
  sub_1C1EA3BD0(0, &qword_1EBB661F8, MEMORY[0x1E4F67438]);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v33 - v13;
  swift_retain();
  id v15 = objc_msgSend(a1, sel_sectionSortOrder);
  *(void *)(v1
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank) = v15;
  uint64_t v16 = sub_1C1EADF38();
  sub_1C1EAE248();
  uint64_t v17 = *(void *)(v16 - 8);
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16);
  if (v18 == 1)
  {
    sub_1C1EA3AAC((uint64_t)v14, &qword_1EBB661F8, MEMORY[0x1E4F67438]);
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C1EADF28();
    uint64_t v19 = v20;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
  }
  uint64_t v21 = v1
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude;
  *(void *)uint64_t v21 = v19;
  *(unsigned char *)(v21 + 8) = v18 == 1;
  uint64_t v22 = sub_1C1EADFD8();
  sub_1C1EAE248();
  uint64_t v23 = *(void *)(v22 - 8);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v11, 1, v22);
  if (v24 == 1)
  {
    sub_1C1EA3AAC((uint64_t)v11, &qword_1EBB66200, MEMORY[0x1E4F67470]);
    uint64_t v25 = 0;
  }
  else
  {
    sub_1C1EADFC8();
    uint64_t v25 = v26;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v22);
  }
  uint64_t v27 = v1
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness;
  *(void *)uint64_t v27 = v25;
  *(unsigned char *)(v27 + 8) = v24 == 1;
  uint64_t v28 = sub_1C1EADD68();
  sub_1C1EAE248();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v5, 1, v28) == 1)
  {
    sub_1C1EA3AAC((uint64_t)v5, &qword_1EBB661C0, MEMORY[0x1E4F672E0]);
    uint64_t v30 = sub_1C1EADBB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v8, 1, 1, v30);
  }
  else
  {
    sub_1C1EADD58();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v28);
    uint64_t v31 = sub_1C1EADBB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, 0, 1, v31);
  }
  sub_1C1EA3A40((uint64_t)v8, v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  swift_release();
  AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(a1);
  return v1;
}

unint64_t sub_1C1EA2920()
{
  unint64_t result = qword_1EBB66790;
  if (!qword_1EBB66790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB66790);
  }
  return result;
}

uint64_t sub_1C1EA2974()
{
  sub_1C1EA3BD0(0, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v15 - v2;
  uint64_t v4 = sub_1C1EA1B08();
  uint64_t v6 = v5;
  *(void *)&long long v15 = 0;
  *((void *)&v15 + 1) = 0xE000000000000000;
  sub_1C1EAF4A8();
  swift_bridgeObjectRelease();
  *(void *)&long long v17 = 8236;
  *((void *)&v17 + 1) = 0xE200000000000000;
  *(void *)&long long v15 = *(void *)(v0
                              + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank);
  sub_1C1EAF768();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  uint64_t v7 = MEMORY[0x1E4FBB3D0];
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude
                 + 8) & 1) != 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  else
  {
    uint64_t v8 = *(void *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude);
    *((void *)&v16 + 1) = MEMORY[0x1E4FBB3D0];
    *(void *)&long long v15 = v8;
  }
  sub_1C1EA3B08(&qword_1EBB665B8, (void (*)(uint64_t))type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem);
  sub_1C1EAE3D8();
  sub_1C1EA3B70((uint64_t)&v15, (uint64_t (*)(void))sub_1C1E1F794);
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness
                 + 8) & 1) != 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  else
  {
    uint64_t v9 = *(void *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness);
    *((void *)&v16 + 1) = v7;
    *(void *)&long long v15 = v9;
  }
  sub_1C1EAE3D8();
  sub_1C1EA3B70((uint64_t)&v15, (uint64_t (*)(void))sub_1C1E1F794);
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  sub_1C1EA39D4(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, (uint64_t)v3, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  uint64_t v10 = sub_1C1EADBB8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v3, 1, v10) == 1)
  {
    sub_1C1EA3AAC((uint64_t)v3, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
    long long v15 = 0u;
    long long v16 = 0u;
  }
  else
  {
    *((void *)&v16 + 1) = v10;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v15);
    (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 32))(boxed_opaque_existential_0, v3, v10);
  }
  sub_1C1EAE3D8();
  sub_1C1EA3B70((uint64_t)&v15, (uint64_t (*)(void))sub_1C1E1F794);
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  long long v15 = v17;
  *(void *)&long long v17 = v4;
  *((void *)&v17 + 1) = v6;
  swift_bridgeObjectRetain();
  *(void *)&long long v17 = sub_1C1EAEDD8();
  *((void *)&v17 + 1) = v13;
  sub_1C1EAEDA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

void AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)()
{
}

void AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(dataTypes:dataVisualizationKind:timeScope:)()
{
}

uint64_t sub_1C1EA2DD8()
{
  return sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.deinit()
{
  swift_bridgeObjectRelease();
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  return v0;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  return swift_deallocClassInstance();
}

id AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.averageProbabilityOfPositiveInteractionForThisSession.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.averageProbabilityOfPositiveInteractionForThisSession.setter(void *a1)
{
  *id v1 = a1;
}

uint64_t (*AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.averageProbabilityOfPositiveInteractionForThisSession.modify())()
{
  return nullsub_1;
}

id AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.feedItemsInteractionKind.getter()
{
  return *(id *)(v0 + 8);
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.feedItemsInteractionKind.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.feedItemsInteractionKind.modify())()
{
  return nullsub_1;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.init(averageProbabilityOfPositiveInteractionForThisSession:feedItemsInteractionKind:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.modelTrainingEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1E89470(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, a1);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.rank.getter()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.init(feedItem:modelTrainingEvent:)(void *a1, uint64_t a2)
{
  sub_1C1E89470(a2, v2+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent);
  swift_retain();
  id v5 = objc_msgSend(a1, sel_sectionSortOrder);
  *(void *)(v2
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank) = v5;
  swift_release();
  AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(a1);
  sub_1C1EA3B70(a2, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
  return v2;
}

uint64_t sub_1C1EA3124()
{
  sub_1C1EA1B08();
  sub_1C1EAF768();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  sub_1C1EAEDB8();
  sub_1C1EA38A4();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1C1EAEDD8();
  sub_1C1EAEDA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)()
{
}

void sub_1C1EA3268()
{
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.init(dataTypes:dataVisualizationKind:timeScope:)()
{
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(feedItem:)()
{
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.init(feedItem:)()
{
}

uint64_t sub_1C1EA3310()
{
  return sub_1C1EA3B70(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.deinit()
{
  swift_bridgeObjectRelease();
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  sub_1C1EA3B70(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
  return v0;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  sub_1C1EA3AAC(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1EBB66190, MEMORY[0x1E4F67200]);
  sub_1C1EA3B70(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, (uint64_t (*)(void))type metadata accessor for ModelTrainingEvent);
  return swift_deallocClassInstance();
}

id AppSessionAnalyticsEvent.DemographicAnalytics.hasPairedWatch.getter()
{
  return *v0;
}

void AppSessionAnalyticsEvent.DemographicAnalytics.hasPairedWatch.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*AppSessionAnalyticsEvent.DemographicAnalytics.hasPairedWatch.modify())()
{
  return nullsub_1;
}

uint64_t (*AppSessionAnalyticsEvent.ImproveHealthAnalytics.isImproveHealthAndActivityAllowed.modify())()
{
  return nullsub_1;
}

unint64_t sub_1C1EA3530()
{
  unint64_t result = qword_1EBB667A0;
  if (!qword_1EBB667A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB667A0);
  }
  return result;
}

void sub_1C1EA3584(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1C1EA359C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1C1EA35B4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(void))
{
  unint64_t v8 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v9 = a4;
      }
      else {
        uint64_t v9 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x1C874C5F0](a1, a2, v9);
      a5(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_1C1EAF398() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_1C1EAF3A8();
  a5(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v5 = v19;
  swift_unknownObjectRelease();
  uint64_t v10 = sub_1C1EAF278();
  uint64_t v11 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v8 = v10 & ~v11;
  if (((*(void *)(a4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v8);
  char v13 = sub_1C1EAF288();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v11;
    do
    {
      unint64_t v8 = (v8 + 1) & v14;
      if (((*(void *)(a4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_26;
      }
      id v15 = *(id *)(*(void *)(a4 + 48) + 8 * v8);
      char v16 = sub_1C1EAF288();
    }
    while ((v16 & 1) == 0);
  }

LABEL_20:
  long long v17 = *(void **)(*(void *)(a4 + 48) + 8 * v8);
  id v18 = v17;
}

uint64_t sub_1C1EA381C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
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
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_1C1EA38A4()
{
  return 0;
}

unint64_t sub_1C1EA3980()
{
  unint64_t result = qword_1EBB665A8;
  if (!qword_1EBB665A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB665A8);
  }
  return result;
}

uint64_t sub_1C1EA39D4(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1C1EA3BD0(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1C1EA3A40(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1C1EA3BD0(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_1C1EA3AAC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1C1EA3BD0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C1EA3B08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem(uint64_t a1)
{
  return sub_1C1DFE484(a1, (uint64_t *)&unk_1EBB666C0);
}

uint64_t sub_1C1EA3B70(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1C1EA3BD0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C1EAF2A8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem(uint64_t a1)
{
  return sub_1C1DFE484(a1, (uint64_t *)&unk_1EBB665C0);
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent()
{
  return &type metadata for AppSessionAnalyticsEvent;
}

void destroy for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for AppSessionAnalyticsEvent.ModelAnalytics(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  unint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  unint64_t v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  unint64_t v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  id v10 = *(void **)(a1 + 16);
  id v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  char v13 = *(void **)(a1 + 24);
  uint64_t v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  char v16 = *(void **)(a1 + 32);
  long long v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

  return a1;
}

uint64_t assignWithTake for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40)) {
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

uint64_t storeEnumTagSinglePayload for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.ModelAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.ModelAnalytics;
}

void destroy for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
}

void *initializeWithCopy for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  int v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  id v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  unint64_t v7 = *(void **)(a2 + 32);
  id v8 = *(void **)(a2 + 40);
  a1[4] = v7;
  a1[5] = v8;
  id v9 = *(void **)(a2 + 48);
  id v10 = *(void **)(a2 + 56);
  a1[6] = v9;
  a1[7] = v10;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  return a1;
}

uint64_t assignWithCopy for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  unint64_t v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  id v13 = *(void **)(a2 + 24);
  id v14 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v13;
  id v15 = v13;

  id v16 = *(void **)(a2 + 32);
  id v17 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v16;
  id v18 = v16;

  uint64_t v19 = *(void **)(a2 + 40);
  uint64_t v20 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v19;
  id v21 = v19;

  uint64_t v22 = *(void **)(a1 + 48);
  uint64_t v23 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v23;
  id v24 = v23;

  uint64_t v25 = *(void **)(a2 + 56);
  uint64_t v26 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v25;
  id v27 = v25;

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

uint64_t assignWithTake for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1, _OWORD *a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  id v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  unint64_t v7 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics;
}

uint64_t sub_1C1EA41C8()
{
  return type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem(0);
}

void sub_1C1EA41D0()
{
  sub_1C1EA3BD0(319, &qword_1EBB661E8, MEMORY[0x1E4F67360]);
  if (v0 <= 0x3F)
  {
    sub_1C1EA3BD0(319, &qword_1EBB66190, MEMORY[0x1E4F67200]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem);
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(feedItem:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.stringRepresentation.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t sub_1C1EA4344()
{
  return type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem(0);
}

void sub_1C1EA434C()
{
  sub_1C1EA3BD0(319, &qword_1EBB661B0, MEMORY[0x1E4F67258]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem);
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:rank:magnitude:completeness:prominence:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, void))(v8 + 160))(a1, a2, a3, a4, a5, a6 & 1, a7, a8 & 1);
}

void *initializeBufferWithCopyOfBuffer for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  long long v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  unint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(uint64_t a1, _OWORD *a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics;
}

uint64_t sub_1C1EA4568()
{
  return type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem(0);
}

uint64_t type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem(uint64_t a1)
{
  return sub_1C1DFE484(a1, (uint64_t *)&unk_1EBB664B8);
}

uint64_t sub_1C1EA4590()
{
  uint64_t result = type metadata accessor for ModelTrainingEvent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem);
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(feedItem:modelTrainingEvent:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.DemographicAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.DemographicAnalytics;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.ImproveHealthAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.ImproveHealthAnalytics;
}

void *initializeBufferWithCopyOfBuffer for AppSessionAnalyticsEvent.Failure(void *a1, void **a2)
{
  long long v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for AppSessionAnalyticsEvent.Failure(void **a1)
{
  unint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for AppSessionAnalyticsEvent.Failure(void **a1, void **a2)
{
  long long v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF) {
      id v7 = v4;
    }
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    id v5 = v4;
    id v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for AppSessionAnalyticsEvent.Failure(void **a1, unint64_t *a2)
{
  long long v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSessionAnalyticsEvent.Failure(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppSessionAnalyticsEvent.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1C1EA4880(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1C1EA4898(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.Failure()
{
  return &type metadata for AppSessionAnalyticsEvent.Failure;
}

uint64_t *BaseFeedPopulationManager.init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(a3 + 32);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  MEMORY[0x1F4188790](v9);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  id v13 = sub_1C1DE2C78(a1, a2, (uint64_t)v11, v3, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v13;
}

uint64_t BaseFeedPopulationManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1C1EA4A2C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1EA4A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v54 = a2;
  uint64_t v61 = *v3;
  uint64_t v7 = sub_1C1EAEB78();
  uint64_t v59 = *(void *)(v7 - 8);
  uint64_t v60 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v58 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C1EAEBD8();
  uint64_t v56 = *(void *)(v9 - 8);
  uint64_t v57 = v9;
  MEMORY[0x1F4188790](v9);
  int v55 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C1EAD368();
  uint64_t v51 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C1EAE568();
  uint64_t v52 = *(void *)(v14 - 8);
  uint64_t v53 = v14;
  MEMORY[0x1F4188790](v14);
  id v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v3 + 2, v3[5]);
  id v17 = (void *)sub_1C1EAD538();
  sub_1C1EAE508();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  id v18 = sub_1C1EAE558();
  os_log_type_t v19 = sub_1C1EAF0D8();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v49 = v17;
    uint64_t v22 = v21;
    uint64_t v48 = swift_slowAlloc();
    uint64_t v62 = v48;
    *(_DWORD *)uint64_t v22 = 136315650;
    aBlock[0] = v61;
    swift_getMetatypeMetadata();
    uint64_t v50 = a3;
    uint64_t v23 = sub_1C1EAED68();
    int v47 = v20;
    aBlock[0] = sub_1C1DF8D44(v23, v24, &v62);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v46 = v22 + 14;
    id v25 = objc_msgSend((id)v3[7], sel_profileIdentifier, v22 + 14);
    id v26 = objc_msgSend(v25, sel_identifier);

    sub_1C1EAD348();
    sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
    uint64_t v27 = sub_1C1EAF768();
    unint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v11);
    aBlock[0] = sub_1C1DF8D44(v27, v29, &v62);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 22) = 2080;
    uint64_t v30 = swift_bridgeObjectRetain();
    uint64_t v31 = MEMORY[0x1C874C0C0](v30, MEMORY[0x1E4F674B8]);
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    aBlock[0] = sub_1C1DF8D44(v31, v33, &v62);
    a3 = v50;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v18, (os_log_type_t)v47, "[%s]_%s: Enqueuing deleteFeed of kinds: %s", (uint8_t *)v22, 0x20u);
    uint64_t v34 = v48;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v34, -1, -1);
    uint64_t v35 = v22;
    id v17 = v49;
    MEMORY[0x1C874D2E0](v35, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v16, v53);
  uint64_t v36 = (void *)swift_allocObject();
  void v36[2] = v4;
  v36[3] = a1;
  uint64_t v37 = v54;
  v36[4] = v17;
  uint64_t v36[5] = v37;
  uint64_t v38 = v61;
  v36[6] = a3;
  v36[7] = v38;
  aBlock[4] = sub_1C1EAA6FC;
  aBlock[5] = v36;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DF5050;
  aBlock[3] = &block_descriptor_15;
  uint64_t v39 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  id v40 = v17;
  swift_retain();
  uint64_t v41 = v55;
  sub_1C1EAEB98();
  uint64_t v62 = MEMORY[0x1E4FBC860];
  sub_1C1DFFCB0((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
  uint64_t v42 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1C1DE38AC(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1E16E0C((unint64_t *)&qword_1EBB683D8, &qword_1EBB683D0, v42);
  uint64_t v43 = v58;
  uint64_t v44 = v60;
  sub_1C1EAF328();
  MEMORY[0x1C874C3B0](0, v41, v43, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v59 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v57);
  return swift_release();
}

uint64_t BaseFeedPopulationManager.healthExperienceStore.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1DFE408(v1 + 16, a1);
}

id BaseFeedPopulationManager.healthStore.getter()
{
  return *(id *)(v0 + 56);
}

uint64_t FeedPopulationManaging<>.handleUpdatedFeedItems(_:)(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t v7 = sub_1C1EAD368();
  uint64_t v137 = *(void *)(v7 - 8);
  uint64_t v138 = v7;
  MEMORY[0x1F4188790](v7);
  long long v136 = (char *)&v129 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_1C1EADD48();
  uint64_t v9 = *(void *)(v141 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v141);
  id v135 = (uint64_t (**)(uint64_t *))((char *)&v129 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v10);
  os_log_t v140 = (os_log_t)((char *)&v129 - v12);
  uint64_t v13 = sub_1C1EAE568();
  uint64_t v143 = *(void *)(v13 - 8);
  uint64_t v144 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  id v16 = (char *)&v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  os_log_type_t v19 = (char *)&v129 - v18;
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  uint64_t v22 = (char *)&v129 - v21;
  MEMORY[0x1F4188790](v20);
  unint64_t v24 = (char *)&v129 - v23;
  id v25 = (uint64_t (*)(uint64_t, uint64_t *, char *))*((void *)a3 + 8);
  id v26 = v3;
  id v142 = a2;
  char v27 = v25(a1, a2, a3);
  uint64_t v139 = v9;
  unint64_t v28 = (void (**)(os_log_t, uint64_t, uint64_t))(v9 + 16);
  if (v27)
  {
    uint64_t v133 = v19;
    unint64_t v134 = v22;
    id v135 = (uint64_t (**)(uint64_t *))a3;
    sub_1C1EAE508();
    uint64_t v29 = v141;
    (*v28)(v140, a1, v141);
    swift_retain_n();
    uint64_t v30 = sub_1C1EAE558();
    os_log_type_t v31 = sub_1C1EAF0D8();
    int v32 = v31;
    unint64_t v33 = v26;
    uint64_t v34 = a1;
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v35 = swift_slowAlloc();
      LODWORD(v131) = v32;
      uint64_t v36 = v26;
      uint64_t v37 = v35;
      uint64_t v132 = (uint64_t *)swift_slowAlloc();
      v146[0] = (uint64_t)v132;
      *(_DWORD *)uint64_t v37 = 136446722;
      os_log_t v130 = v30;
      uint64_t v145 = (uint64_t)v142;
      swift_getMetatypeMetadata();
      uint64_t v38 = sub_1C1EAED68();
      uint64_t v145 = sub_1C1DF8D44(v38, v39, v146);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      uint64_t v129 = v37 + 14;
      id v40 = objc_msgSend(v26[7], sel_profileIdentifier, v37 + 14);
      id v41 = objc_msgSend(v40, sel_identifier);

      uint64_t v42 = v136;
      sub_1C1EAD348();
      swift_release();

      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v43 = v138;
      uint64_t v44 = sub_1C1EAF768();
      unint64_t v46 = v45;
      uint64_t v47 = v43;
      uint64_t v34 = a1;
      (*(void (**)(char *, uint64_t))(v137 + 8))(v42, v47);
      uint64_t v145 = sub_1C1DF8D44(v44, v46, v146);
      sub_1C1EAF2C8();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 22) = 2080;
      sub_1C1DFFCB0(&qword_1EBB65328, MEMORY[0x1E4F672B0]);
      os_log_t v48 = v140;
      uint64_t v49 = sub_1C1EAF768();
      uint64_t v145 = sub_1C1DF8D44(v49, v50, v146);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      (*(void (**)(os_log_t, uint64_t))(v139 + 8))(v48, v29);
      os_log_t v51 = v130;
      _os_log_impl(&dword_1C1DD2000, v130, (os_log_type_t)v131, "[%{public}s]_%s: received notice of change domain: %s", (uint8_t *)v37, 0x20u);
      uint64_t v52 = v132;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v52, -1, -1);
      uint64_t v53 = v37;
      unint64_t v33 = v36;
      MEMORY[0x1C874D2E0](v53, -1, -1);

      uint64_t v54 = v142;
      int v55 = *(void (**)(char *, uint64_t))(v143 + 8);
      v55(v24, v144);
    }
    else
    {
      swift_release_n();
      (*(void (**)(os_log_t, uint64_t))(v139 + 8))(v140, v29);

      int v55 = *(void (**)(char *, uint64_t))(v143 + 8);
      v55(v24, v144);
      uint64_t v54 = v142;
    }
    uint64_t v76 = v134;
    uint64_t v77 = v135[4](v54);
    MEMORY[0x1F4188790](v77);
    *(&v129 - 2) = v34;
    uint64_t v79 = sub_1C1EA62AC((uint64_t)sub_1C1EAA714, (uint64_t)(&v129 - 4), v78);
    sub_1C1EAE508();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v80 = sub_1C1EAE558();
    os_log_type_t v81 = sub_1C1EAF0D8();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = swift_slowAlloc();
      uint64_t v141 = swift_slowAlloc();
      uint64_t v145 = (uint64_t)v54;
      v146[0] = v141;
      *(_DWORD *)uint64_t v82 = 136446722;
      swift_getMetatypeMetadata();
      uint64_t v83 = sub_1C1EAED68();
      uint64_t v84 = v33;
      uint64_t v145 = sub_1C1DF8D44(v83, v85, v146);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v82 + 12) = 2080;
      os_log_t v140 = (os_log_t)(v82 + 14);
      id v86 = objc_msgSend(v33[7], sel_profileIdentifier);
      id v87 = objc_msgSend(v86, sel_identifier);

      unint64_t v88 = v136;
      sub_1C1EAD348();
      swift_release();

      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v89 = v138;
      uint64_t v90 = sub_1C1EAF768();
      unint64_t v92 = v91;
      (*(void (**)(char *, uint64_t))(v137 + 8))(v88, v89);
      uint64_t v145 = sub_1C1DF8D44(v90, v92, v146);
      sub_1C1EAF2C8();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v82 + 22) = 2080;
      uint64_t v93 = swift_bridgeObjectRetain();
      uint64_t v94 = MEMORY[0x1C874C0C0](v93, MEMORY[0x1E4F674B8]);
      unint64_t v96 = v95;
      swift_bridgeObjectRelease();
      uint64_t v97 = v94;
      unint64_t v33 = v84;
      uint64_t v145 = sub_1C1DF8D44(v97, v96, v146);
      uint64_t v54 = v142;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1DD2000, v80, v81, "[%{public}s]_%s: Mapped contentKinds to these FeedKinds: %s", (uint8_t *)v82, 0x20u);
      uint64_t v98 = v141;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v98, -1, -1);
      MEMORY[0x1C874D2E0](v82, -1, -1);

      int v55 = *(void (**)(char *, uint64_t))(v143 + 8);
      v55(v134, v144);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      v55(v76, v144);
    }
    uint64_t v100 = v133;
    if (*(void *)(v79 + 16))
    {
      sub_1C1EAE508();
      swift_retain_n();
      uint64_t v101 = sub_1C1EAE558();
      os_log_type_t v102 = sub_1C1EAF0D8();
      int v103 = v102;
      if (os_log_type_enabled(v101, v102))
      {
        uint64_t v104 = swift_slowAlloc();
        uint64_t v141 = swift_slowAlloc();
        uint64_t v145 = (uint64_t)v54;
        v146[0] = v141;
        *(_DWORD *)uint64_t v104 = 136446978;
        os_log_t v140 = v101;
        swift_getMetatypeMetadata();
        uint64_t v105 = sub_1C1EAED68();
        uint64_t v145 = sub_1C1DF8D44(v105, v106, v146);
        uint64_t v132 = v146;
        sub_1C1EAF2C8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v104 + 12) = 2080;
        uint64_t v131 = v104 + 14;
        unint64_t v134 = (char *)v33[7];
        id v107 = objc_msgSend(v134, sel_profileIdentifier);
        id v108 = objc_msgSend(v107, sel_identifier);

        LODWORD(v139) = v103;
        uint64_t v109 = v33;
        int v110 = v136;
        sub_1C1EAD348();
        swift_release();

        os_log_t v130 = (os_log_t)sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
        uint64_t v111 = v138;
        uint64_t v112 = sub_1C1EAF768();
        unint64_t v114 = v113;
        uint64_t v115 = *(void (**)(char *, uint64_t))(v137 + 8);
        v115(v110, v111);
        uint64_t v145 = sub_1C1DF8D44(v112, v114, v146);
        sub_1C1EAF2C8();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v104 + 22) = 2080;
        uint64_t v137 = v104 + 24;
        id v116 = objc_msgSend(v134, sel_profileIdentifier);
        id v117 = objc_msgSend(v116, sel_identifier);

        sub_1C1EAD348();
        swift_release();

        uint64_t v118 = sub_1C1EAF768();
        unint64_t v120 = v119;
        uint64_t v121 = v110;
        unint64_t v33 = v109;
        v115(v121, v111);
        uint64_t v145 = sub_1C1DF8D44(v118, v120, v146);
        uint64_t v54 = v142;
        sub_1C1EAF2C8();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v104 + 32) = 2082;
        uint64_t v145 = (uint64_t)v109;
        swift_retain();
        uint64_t v122 = sub_1C1EAED68();
        uint64_t v145 = sub_1C1DF8D44(v122, v123, v146);
        sub_1C1EAF2C8();
        swift_release_n();
        swift_bridgeObjectRelease();
        os_log_t v124 = v140;
        _os_log_impl(&dword_1C1DD2000, v140, (os_log_type_t)v139, "[%{public}s]_%s: Beginning repopulation of live feeds for profile %s; %{public}s",
          (uint8_t *)v104,
          0x2Au);
        uint64_t v125 = v141;
        swift_arrayDestroy();
        MEMORY[0x1C874D2E0](v125, -1, -1);
        MEMORY[0x1C874D2E0](v104, -1, -1);

        (*(void (**)(char *, uint64_t))(v143 + 8))(v133, v144);
      }
      else
      {

        swift_release_n();
        v55(v100, v144);
      }
      unint64_t v126 = (void *)swift_allocObject();
      unint64_t v127 = v135;
      v126[2] = v54;
      v126[3] = v127;
      v126[4] = v33;
      v128 = (void (*)(uint64_t, uint64_t (*)(), void *))*((void *)*v33 + 17);
      swift_retain();
      v128(v79, sub_1C1EAA76C, v126);
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v56 = v16;
    sub_1C1EAE508();
    uint64_t v57 = (char *)v135;
    uint64_t v58 = v141;
    (*v28)((os_log_t)v135, a1, v141);
    swift_retain_n();
    uint64_t v59 = sub_1C1EAE558();
    os_log_type_t v60 = sub_1C1EAF098();
    int v61 = v60;
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v62 = swift_slowAlloc();
      os_log_t v140 = (os_log_t)swift_slowAlloc();
      v146[0] = (uint64_t)v140;
      *(_DWORD *)uint64_t v62 = 136446722;
      uint64_t v145 = (uint64_t)v142;
      swift_getMetatypeMetadata();
      uint64_t v63 = sub_1C1EAED68();
      uint64_t v145 = sub_1C1DF8D44(v63, v64, v146);
      id v142 = v146;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2080;
      uint64_t v133 = (char *)(v62 + 14);
      id v65 = objc_msgSend(v26[7], sel_profileIdentifier);
      id v66 = objc_msgSend(v65, sel_identifier);

      BOOL v67 = v136;
      sub_1C1EAD348();
      swift_release();

      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v68 = v138;
      uint64_t v69 = sub_1C1EAF768();
      LODWORD(v134) = v61;
      uint64_t v70 = v69;
      unint64_t v72 = v71;
      (*(void (**)(char *, uint64_t))(v137 + 8))(v67, v68);
      uint64_t v145 = sub_1C1DF8D44(v70, v72, v146);
      sub_1C1EAF2C8();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 22) = 2080;
      sub_1C1DFFCB0(&qword_1EBB65328, MEMORY[0x1E4F672B0]);
      uint64_t v73 = sub_1C1EAF768();
      uint64_t v145 = sub_1C1DF8D44(v73, v74, v146);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v139 + 8))(v57, v58);
      _os_log_impl(&dword_1C1DD2000, v59, (os_log_type_t)v134, "[%{public}s]_%s: change domain does not contain pertinent changes; ignoring: %s",
        (uint8_t *)v62,
        0x20u);
      os_log_t v75 = v140;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v75, -1, -1);
      MEMORY[0x1C874D2E0](v62, -1, -1);
    }
    else
    {
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v139 + 8))(v57, v58);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v143 + 8))(v56, v144);
  }
}

uint64_t sub_1C1EA62AC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    id v6 = (uint64_t (*)(char *))result;
    unint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x1E4FBC860];
    uint64_t v12 = (uint64_t (*)(char *))result;
    while (v7 < *(void *)(a3 + 16))
    {
      char v11 = *(unsigned char *)(a3 + v7 + 32);
      char v13 = v11;
      uint64_t result = v6(&v13);
      if (v3)
      {
        swift_release();
        goto LABEL_14;
      }
      if (result)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v14 = v8;
        if ((result & 1) == 0)
        {
          uint64_t result = sub_1C1E22034(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v14;
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          uint64_t result = sub_1C1E22034(v9 > 1, v10 + 1, 1);
          uint64_t v8 = v14;
        }
        *(void *)(v8 + 16) = v10 + 1;
        *(unsigned char *)(v8 + v10 + 32) = v11;
        id v6 = v12;
      }
      if (v5 == ++v7) {
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
LABEL_14:
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t sub_1C1EA63F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1C1DFE408(v1 + 16, a1);
}

id sub_1C1EA6414()
{
  return *(id *)(v0 + 56);
}

uint64_t sub_1C1EA641C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t *BaseFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = (uint64_t *)swift_allocObject();
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(a3 + 32);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  MEMORY[0x1F4188790](v9);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  char v13 = sub_1C1DE2C78(a1, a2, (uint64_t)v11, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v13;
}

uint64_t sub_1C1EA655C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, char *a4@<X3>, uint64_t *a5@<X8>)
{
  unint64_t v64 = a4;
  uint64_t v9 = sub_1C1EAD368();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C1EAE568();
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a1;
  uint64_t v20 = *a2;
  uint64_t v19 = a2[1];
  uint64_t v21 = a2[2];
  if (*a1)
  {
    uint64_t v59 = v10;
    uint64_t v60 = v15;
    uint64_t v61 = v14;
    uint64_t v63 = v19;
    uint64_t v22 = a1[2];
    uint64_t v65 = a1[1];
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1C1EAE508();
    id v23 = a3;
    swift_bridgeObjectRetain_n();
    uint64_t v62 = v22;
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    id v24 = v23;
    id v25 = sub_1C1EAE558();
    os_log_type_t v26 = sub_1C1EAF0D8();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v58 = a5;
      uint64_t v29 = v28;
      uint64_t v57 = swift_slowAlloc();
      uint64_t v69 = v57;
      *(_DWORD *)uint64_t v29 = 136315906;
      os_log_t v56 = v25;
      uint64_t v66 = (uint64_t)v64;
      swift_getMetatypeMetadata();
      uint64_t v30 = sub_1C1EAED68();
      unint64_t v64 = v17;
      uint64_t v66 = sub_1C1DF8D44(v30, v31, &v69);
      v55[1] = &v67;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      id v32 = objc_msgSend(v24, sel_profileIdentifier, v29 + 14);
      id v33 = objc_msgSend(v32, sel_identifier);

      sub_1C1EAD348();
      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v34 = sub_1C1EAF768();
      unint64_t v36 = v35;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v12, v9);
      uint64_t v66 = sub_1C1DF8D44(v34, v36, &v69);
      sub_1C1EAF2C8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 22) = 2080;
      LODWORD(v59) = v27;
      uint64_t v66 = v18;
      uint64_t v67 = v65;
      uint64_t v37 = v62;
      uint64_t v68 = v62;
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v38 = sub_1C1EAED68();
      uint64_t v66 = sub_1C1DF8D44(v38, v39, &v69);
      sub_1C1EAF2C8();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 32) = 2080;
      uint64_t v40 = v63;
      uint64_t v66 = v20;
      uint64_t v67 = v63;
      uint64_t v68 = v21;
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v41 = sub_1C1EAED68();
      uint64_t v66 = sub_1C1DF8D44(v41, v42, &v69);
      sub_1C1EAF2C8();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v43 = v56;
      _os_log_impl(&dword_1C1DD2000, v56, (os_log_type_t)v59, "[%s]_%s: Consolidating requests to populate %s with %s", (uint8_t *)v29, 0x2Au);
      uint64_t v44 = v57;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v44, -1, -1);
      uint64_t v45 = v29;
      a5 = v58;
      MEMORY[0x1C874D2E0](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v60 + 8))(v64, v61);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      uint64_t v37 = v62;
      swift_release_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v60 + 8))(v17, v61);
      uint64_t v40 = v63;
    }
    uint64_t v47 = v65;
    uint64_t v48 = swift_bridgeObjectRetain();
    uint64_t v49 = sub_1C1E3BD24(v48);
    swift_bridgeObjectRelease();
    uint64_t v50 = swift_bridgeObjectRetain();
    uint64_t v51 = sub_1C1E3BD24(v50);
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_1C1EA8D9C(v51, v49);
    uint64_t v53 = sub_1C1E30B6C(v52);
    swift_bridgeObjectRelease();
    uint64_t v54 = (void *)swift_allocObject();
    id v54[2] = v18;
    v54[3] = v47;
    v54[4] = v37;
    v54[5] = v20;
    v54[6] = v40;
    v54[7] = v21;
    *a5 = v53;
    a5[1] = (uint64_t)sub_1C1EAB1AC;
    a5[2] = (uint64_t)v54;
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  else
  {
    *a5 = v20;
    a5[1] = v19;
    a5[2] = v21;
    swift_bridgeObjectRetain();
    return swift_retain();
  }
}

uint64_t sub_1C1EA6B8C@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, void, void)@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  id v50 = a6;
  uint64_t v43 = a4;
  unint64_t v46 = a3;
  os_log_t v56 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBD318];
  uint64_t v57 = a7;
  sub_1C1DE38AC(0, &qword_1EBB65778, MEMORY[0x1E4FBD318], MEMORY[0x1E4FBB718]);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v53 = (uint64_t)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v52 = (char *)&v42 - v13;
  uint64_t v14 = sub_1C1EAD6A8();
  uint64_t v48 = *(void *)(v14 - 8);
  uint64_t v49 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v47 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAACE0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v54 = v16;
  uint64_t v55 = v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v51 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1C1EAD368();
  uint64_t v19 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *a1;
  uint64_t v44 = a1[1];
  uint64_t v23 = v44;
  uint64_t v24 = a1[2];
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  id v25 = (void *)sub_1C1EAD538();
  sub_1C1DFE408((uint64_t)v46, (uint64_t)&v60);
  os_log_type_t v26 = (void *)swift_allocObject();
  sub_1C1DFE46C(&v60, (uint64_t)(v26 + 2));
  v26[7] = v22;
  v26[8] = v23;
  v26[9] = v24;
  v26[10] = v25;
  v26[11] = v43;
  v26[12] = a5;
  v26[13] = v50;
  unint64_t v46 = (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1E4F1AC28];
  sub_1C1EAAD94(0, &qword_1EBB65438, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  id v50 = v25;
  swift_retain();
  id v27 = a5;
  uint64_t v28 = sub_1C1EAE8F8();
  *(void *)&long long v60 = 0;
  *((void *)&v60 + 1) = 0xE000000000000000;
  sub_1C1EAF4A8();
  swift_bridgeObjectRelease();
  uint64_t v58 = 0x3A656C69666F7270;
  unint64_t v59 = 0xE900000000000020;
  id v29 = objc_msgSend(v27, sel_profileIdentifier);
  id v30 = objc_msgSend(v29, sel_identifier);

  sub_1C1EAD348();
  sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
  uint64_t v31 = v45;
  sub_1C1EAF768();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v31);
  sub_1C1EAEDB8();
  *(void *)&long long v60 = v22;
  *((void *)&v60 + 1) = v44;
  uint64_t v61 = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C1EAED68();
  sub_1C1EAEDB8();
  swift_bridgeObjectRelease();
  id v33 = v47;
  uint64_t v32 = v48;
  uint64_t v34 = v49;
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, *MEMORY[0x1E4F67070], v49);
  sub_1C1EAD698();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  uint64_t v35 = sub_1C1EAE4C8();
  uint64_t v36 = (uint64_t)v52;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v52, 1, 1, v35);
  *(void *)&long long v60 = v28;
  sub_1C1E4AA58(v36, v53);
  sub_1C1EAABDC(&qword_1EBB65430, &qword_1EBB65438, v46);
  swift_retain();
  uint64_t v37 = v51;
  sub_1C1EAE5F8();
  sub_1C1E16BCC(v36, &qword_1EBB65778, v56);
  sub_1C1DFFCB0(&qword_1EBB65398, (void (*)(uint64_t))sub_1C1EAACE0);
  uint64_t v38 = v54;
  uint64_t v39 = sub_1C1EAEA38();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v38);
  *(void *)&long long v60 = v39;
  uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1E4F1AAE0];
  sub_1C1EAAD94(0, (unint64_t *)&qword_1EBB65420, MEMORY[0x1E4F1AAE0]);
  sub_1C1EAABDC(&qword_1EBB65418, (unint64_t *)&qword_1EBB65420, v40);
  sub_1C1EAE9E8();
  swift_release();

  return swift_release();
}

uint64_t sub_1C1EA7290(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  uint64_t v18 = a3[3];
  uint64_t v19 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v18);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a7;
  v20[3] = a8;
  v20[4] = a9;
  v20[5] = a4;
  v20[6] = a5;
  void v20[7] = a6;
  v20[8] = sub_1C1EAAE9C;
  v20[9] = v17;
  v20[10] = a10;
  id v25 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t, uint64_t))(v19 + 24);
  swift_retain();
  id v21 = a7;
  swift_retain();
  id v22 = a9;
  swift_bridgeObjectRetain();
  swift_retain();
  v25(a4, sub_1C1EAAF3C, v20, v18, v19);
  return swift_release();
}

void sub_1C1EA73F0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a2;
  v17[3] = a3;
  void v17[4] = a4;
  v17[5] = a5;
  v17[6] = a6;
  v17[7] = a7;
  v17[8] = a8;
  v17[9] = a1;
  v17[10] = a9;
  v21[4] = sub_1C1EAAFB4;
  v21[5] = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 1107296256;
  v21[2] = sub_1C1DF5050;
  v21[3] = &block_descriptor_49;
  uint64_t v18 = _Block_copy(v21);
  swift_retain();
  id v19 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v20 = a1;
  swift_release();
  objc_msgSend(v20, sel_performBlock_, v18);
  _Block_release(v18);
}

uint64_t sub_1C1EA7538(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8, void *a9)
{
  uint64_t v93 = a8;
  uint64_t v100 = a4;
  uint64_t v101 = a7;
  uint64_t v98 = a3;
  uint64_t v99 = a6;
  id v96 = a2;
  uint64_t v97 = a5;
  unint64_t v95 = a9;
  uint64_t v9 = sub_1C1EAEB78();
  uint64_t v92 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v89 = (char *)v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_1C1EAEBD8();
  uint64_t v91 = *(v11 - 1);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C1EAEB88();
  uint64_t v90 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C1EAD368();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  id v20 = (char *)v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1C1EAE568();
  uint64_t v88 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v94 = (char *)v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v24 = Strong;
    id v25 = (void *)swift_allocObject();
    os_log_type_t v26 = v93;
    id v27 = v96;
    uint64_t v28 = v97;
    v25[2] = v93;
    v25[3] = v27;
    uint64_t v29 = v98;
    uint64_t v30 = v100;
    uint64_t v31 = v101;
    v25[4] = v98;
    v25[5] = v30;
    uint64_t v32 = v99;
    v25[6] = v28;
    v25[7] = v32;
    id v33 = v95;
    v25[8] = v31;
    v25[9] = v33;
    uint64_t v34 = *(void (**)(id, id, uint64_t, uint64_t (*)(), void *))(*(void *)v24 + 168);
    id v35 = v27;
    id v36 = v26;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v34(v36, v35, v29, sub_1C1EAB018, v25);
    swift_release();
  }
  else
  {
    uint64_t v82 = v20;
    uint64_t v37 = v95;
    uint64_t v83 = v18;
    uint64_t v84 = v17;
    unint64_t v85 = v16;
    uint64_t v86 = v14;
    uint64_t v93 = v13;
    uint64_t v87 = v9;
    sub_1C1EAE538();
    id v38 = v96;
    uint64_t v39 = sub_1C1EAE558();
    os_log_type_t v40 = sub_1C1EAF0B8();
    BOOL v41 = os_log_type_enabled(v39, v40);
    id v96 = v11;
    uint64_t v43 = v97;
    uint64_t v42 = v98;
    uint64_t v44 = v88;
    if (v41)
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v81 = v21;
      uint64_t v46 = v45;
      uint64_t v80 = swift_slowAlloc();
      uint64_t v102 = v80;
      uint64_t aBlock = (uint64_t)v37;
      *(_DWORD *)uint64_t v46 = 136315394;
      os_log_t v79 = v39;
      swift_getMetatypeMetadata();
      uint64_t v47 = sub_1C1EAED68();
      uint64_t aBlock = sub_1C1DF8D44(v47, v48, &v102);
      unint64_t v95 = v104;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      v78[1] = v46 + 14;
      id v49 = objc_msgSend(v38, sel_profileIdentifier);
      id v50 = objc_msgSend(v49, sel_identifier);

      uint64_t v51 = v82;
      sub_1C1EAD348();

      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v52 = v42;
      uint64_t v53 = v43;
      os_log_type_t v54 = v40;
      uint64_t v55 = v38;
      uint64_t v56 = v84;
      uint64_t v57 = sub_1C1EAF768();
      unint64_t v59 = v58;
      (*(void (**)(char *, uint64_t))(v83 + 8))(v51, v56);
      uint64_t aBlock = sub_1C1DF8D44(v57, v59, &v102);
      sub_1C1EAF2C8();

      swift_bridgeObjectRelease();
      os_log_t v60 = v79;
      os_log_type_t v61 = v54;
      uint64_t v43 = v53;
      uint64_t v42 = v52;
      _os_log_impl(&dword_1C1DD2000, v79, v61, "[%s]_%s: Self deallocated during picking", (uint8_t *)v46, 0x16u);
      uint64_t v62 = v80;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v62, -1, -1);
      MEMORY[0x1C874D2E0](v46, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v94, v81);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v44 + 8))(v94, v21);
    }
    uint64_t v63 = v87;
    unint64_t v64 = v93;
    uint64_t v65 = v100;
    uint64_t v66 = v101;
    uint64_t v67 = v99;
    uint64_t v68 = (void *)swift_allocObject();
    v68[2] = v42;
    v68[3] = v65;
    v68[4] = v43;
    v68[5] = v67;
    v68[6] = v66;
    sub_1C1E16B8C();
    uint64_t v69 = v90;
    uint64_t v70 = v85;
    uint64_t v71 = v86;
    (*(void (**)(char *, void, uint64_t))(v90 + 104))(v85, *MEMORY[0x1E4FBCB20], v86);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    unint64_t v72 = (void *)sub_1C1EAF1B8();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
    uint64_t v73 = swift_allocObject();
    *(void *)(v73 + 16) = sub_1C1EAB010;
    *(void *)(v73 + 24) = v68;
    v104[3] = sub_1C1E15AD4;
    v104[4] = v73;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    v104[0] = 1107296256;
    v104[1] = sub_1C1DF5050;
    v104[2] = &block_descriptor_59;
    unint64_t v74 = _Block_copy(&aBlock);
    swift_retain();
    sub_1C1EAEB98();
    uint64_t v102 = MEMORY[0x1E4FBC860];
    sub_1C1DFFCB0((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
    os_log_t v75 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
    sub_1C1DE38AC(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1C1E16E0C((unint64_t *)&qword_1EBB683D8, &qword_1EBB683D0, v75);
    uint64_t v76 = v89;
    sub_1C1EAF328();
    MEMORY[0x1C874C3B0](0, v64, v76, v74);
    _Block_release(v74);
    swift_release();

    (*(void (**)(char *, uint64_t))(v92 + 8))(v76, v63);
    (*(void (**)(char *, id))(v91 + 8))(v64, v96);
    swift_release();
  }
  return swift_release();
}

void sub_1C1EA7E7C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a6;
  v16[8] = a7;
  v16[9] = a8;
  v20[4] = sub_1C1EAB08C;
  v20[5] = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 1107296256;
  v20[2] = sub_1C1DF5050;
  v20[3] = &block_descriptor_68;
  uint64_t v17 = _Block_copy(v20);
  id v18 = a1;
  id v19 = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
}

uint64_t sub_1C1EA7FAC(void *a1, void *a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t a1), uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v71 = a8;
  uint64_t v79 = a6;
  uint64_t v84 = a4;
  v91[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = sub_1C1EAE568();
  uint64_t v75 = *(void *)(v13 - 8);
  uint64_t v76 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v78 = (char *)v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_1C1EAD368();
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x1F4188790](v73);
  uint64_t v16 = (char *)v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C1EAEB78();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v83 = (char *)v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C1EAEBD8();
  uint64_t v81 = *(void *)(v20 - 8);
  uint64_t v82 = v20;
  MEMORY[0x1F4188790](v20);
  uint64_t v80 = (char *)v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_1C1EAEB88();
  uint64_t v22 = *(void *)(v77 - 8);
  MEMORY[0x1F4188790](v77);
  uint64_t v24 = (char *)v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  id aBlock = 0;
  if (objc_msgSend(a1, sel_save_, &aBlock))
  {
    id v25 = aBlock;
    os_log_type_t v26 = a5;
  }
  else
  {
    uint64_t v68 = a7;
    uint64_t v69 = v18;
    uint64_t v70 = v17;
    id v27 = aBlock;
    uint64_t v28 = (void *)sub_1C1EAD198();

    swift_willThrow();
    sub_1C1EAE538();
    swift_bridgeObjectRetain();
    swift_retain();
    id v29 = v28;
    id v30 = a2;
    swift_bridgeObjectRetain();
    swift_retain();
    id v31 = v28;
    id v32 = v30;
    id v33 = sub_1C1EAE558();
    os_log_type_t v34 = sub_1C1EAF0B8();
    int v35 = v34;
    os_log_type_t v26 = a5;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v36 = swift_slowAlloc();
      unint64_t v74 = a5;
      uint64_t v37 = v36;
      uint64_t v67 = swift_slowAlloc();
      v91[0] = v67;
      *(_DWORD *)uint64_t v37 = 136315906;
      os_log_t v66 = v33;
      id aBlock = v71;
      swift_getMetatypeMetadata();
      uint64_t v38 = sub_1C1EAED68();
      LODWORD(v71) = v35;
      id aBlock = (id)sub_1C1DF8D44(v38, v39, v91);
      v65[2] = &v86;
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      v65[1] = v37 + 14;
      id v40 = objc_msgSend(v32, sel_profileIdentifier);
      id v41 = objc_msgSend(v40, sel_identifier);

      sub_1C1EAD348();
      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v42 = v73;
      uint64_t v43 = sub_1C1EAF768();
      unint64_t v45 = v44;
      (*(void (**)(char *, uint64_t))(v72 + 8))(v16, v42);
      id aBlock = (id)sub_1C1DF8D44(v43, v45, v91);
      sub_1C1EAF2C8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 22) = 2080;
      id aBlock = a3;
      uint64_t v86 = v84;
      uint64_t v87 = v74;
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v46 = sub_1C1EAED68();
      id aBlock = (id)sub_1C1DF8D44(v46, v47, v91);
      sub_1C1EAF2C8();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 32) = 2080;
      id aBlock = v28;
      id v48 = v28;
      sub_1C1E15F30();
      uint64_t v49 = sub_1C1EAED68();
      id aBlock = (id)sub_1C1DF8D44(v49, v50, v91);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();

      os_log_t v51 = v66;
      _os_log_impl(&dword_1C1DD2000, v66, (os_log_type_t)v71, "[%s]_%s: Unable to save after picking feeds of kinds %s: %s", (uint8_t *)v37, 0x2Au);
      uint64_t v52 = v67;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v52, -1, -1);
      uint64_t v53 = v37;
      os_log_type_t v26 = v74;
      MEMORY[0x1C874D2E0](v53, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v78, v76);
    uint64_t v17 = v70;
    uint64_t v18 = v69;
    a7 = v68;
  }
  os_log_type_t v54 = (void *)swift_allocObject();
  uint64_t v55 = v84;
  id v54[2] = a3;
  v54[3] = v55;
  uint64_t v56 = v79;
  v54[4] = v26;
  v54[5] = v56;
  v54[6] = a7;
  sub_1C1E16B8C();
  uint64_t v57 = v77;
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v24, *MEMORY[0x1E4FBCB20], v77);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v58 = (void *)sub_1C1EAF1B8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v57);
  uint64_t v59 = swift_allocObject();
  *(void *)(v59 + 16) = sub_1C1EAB010;
  *(void *)(v59 + 24) = v54;
  uint64_t v89 = sub_1C1E15AD4;
  uint64_t v90 = v59;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v86 = 1107296256;
  uint64_t v87 = sub_1C1DF5050;
  uint64_t v88 = &block_descriptor_78;
  os_log_t v60 = _Block_copy(&aBlock);
  swift_retain();
  os_log_type_t v61 = v80;
  sub_1C1EAEB98();
  v91[0] = MEMORY[0x1E4FBC860];
  sub_1C1DFFCB0((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
  uint64_t v62 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1C1DE38AC(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1E16E0C((unint64_t *)&qword_1EBB683D8, &qword_1EBB683D0, v62);
  uint64_t v63 = v83;
  sub_1C1EAF328();
  MEMORY[0x1C874C3B0](0, v61, v63, v60);
  _Block_release(v60);
  swift_release();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v63, v17);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v61, v82);
  swift_release();
  return swift_release();
}

uint64_t sub_1C1EA8974(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_1C1EAD368();
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C1EAE568();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  id v12 = a2;
  swift_bridgeObjectRetain_n();
  id v13 = v12;
  uint64_t v14 = sub_1C1EAE558();
  os_log_type_t v15 = sub_1C1EAF0D8();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v36 = v8;
    uint64_t v18 = v17;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v38 = v34;
    uint64_t v39 = a3;
    *(_DWORD *)uint64_t v18 = 136315650;
    int v33 = v16;
    swift_getMetatypeMetadata();
    uint64_t v19 = sub_1C1EAED68();
    uint64_t v35 = v9;
    uint64_t v39 = sub_1C1DF8D44(v19, v20, &v38);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    id v21 = objc_msgSend(v13, sel_profileIdentifier, v18 + 14);
    id v22 = objc_msgSend(v21, sel_identifier);

    sub_1C1EAD348();
    sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
    uint64_t v23 = sub_1C1EAF768();
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v5);
    uint64_t v39 = sub_1C1DF8D44(v23, v25, &v38);
    sub_1C1EAF2C8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2080;
    uint64_t v26 = swift_bridgeObjectRetain();
    uint64_t v27 = MEMORY[0x1C874C0C0](v26, MEMORY[0x1E4F674B8]);
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v39 = sub_1C1DF8D44(v27, v29, &v38);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v14, (os_log_type_t)v33, "[%s]_%s: Population complete for kinds %s", (uint8_t *)v18, 0x20u);
    uint64_t v30 = v34;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v30, -1, -1);
    MEMORY[0x1C874D2E0](v18, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v11, v36);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1C1EA8D9C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v15 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_1C1E31144(&v14, *(unsigned __int8 *)(*(void *)(v2 + 48) + v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C1EA8EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_1C1EA8F20(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v52 = a4;
  uint64_t v11 = sub_1C1EAD368();
  uint64_t v49 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  int64_t v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C1EAE568();
  uint64_t v50 = *(void *)(v14 - 8);
  uint64_t v51 = v14;
  MEMORY[0x1F4188790](v14);
  int v16 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_1C1EAE558();
  os_log_type_t v18 = sub_1C1EAF0D8();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v48 = a5;
    uint64_t v21 = v20;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v53 = v46;
    aBlock[0] = a6;
    *(_DWORD *)uint64_t v21 = 136315650;
    int v45 = v19;
    swift_getMetatypeMetadata();
    unint64_t v47 = a3;
    uint64_t v22 = sub_1C1EAED68();
    uint64_t v44 = a6;
    aBlock[0] = sub_1C1DF8D44(v22, v23, &v53);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    v43[1] = v21 + 14;
    id v24 = objc_msgSend(*(id *)(a1 + 56), sel_profileIdentifier);
    id v25 = objc_msgSend(v24, sel_identifier);

    sub_1C1EAD348();
    sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
    uint64_t v26 = sub_1C1EAF768();
    unint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v11);
    aBlock[0] = sub_1C1DF8D44(v26, v28, &v53);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2080;
    uint64_t v29 = swift_bridgeObjectRetain();
    uint64_t v30 = MEMORY[0x1C874C0C0](v29, MEMORY[0x1E4F674B8]);
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v33 = v30;
    uint64_t v34 = v44;
    aBlock[0] = sub_1C1DF8D44(v33, v32, &v53);
    a3 = v47;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v17, (os_log_type_t)v45, "[%s]_%s: Deleting feeds of kinds: %s", (uint8_t *)v21, 0x20u);
    uint64_t v35 = v46;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v35, -1, -1);
    uint64_t v36 = v21;
    a5 = v48;
    MEMORY[0x1C874D2E0](v36, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v51);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v51);
    uint64_t v34 = a6;
  }
  uint64_t v37 = (void *)swift_allocObject();
  v37[2] = a2;
  v37[3] = a3;
  uint64_t v38 = v52;
  v37[4] = a1;
  v37[5] = v38;
  v37[6] = a5;
  v37[7] = v34;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = sub_1C1EAA9B0;
  *(void *)(v39 + 24) = v37;
  aBlock[4] = sub_1C1DD885C;
  aBlock[5] = v39;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DD8834;
  aBlock[3] = &block_descriptor_16;
  id v40 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  id v41 = a3;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v41, sel_performBlockAndWait_, v40);
  _Block_release(v40);
  LOBYTE(v40) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v40) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C1EA94A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v63 = a6;
  uint64_t v78 = a5;
  uint64_t v71 = a4;
  v80[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = sub_1C1EAE568();
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v68 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_1C1EAD368();
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x1F4188790](v66);
  unint64_t v64 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C1EAEB78();
  uint64_t v76 = *(void *)(v13 - 8);
  uint64_t v77 = v13;
  MEMORY[0x1F4188790](v13);
  unint64_t v74 = (char *)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_1C1EAEBD8();
  uint64_t v73 = *(void *)(v75 - 8);
  MEMORY[0x1F4188790](v75);
  uint64_t v72 = (char *)v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C1EAEB88();
  uint64_t v69 = *(void *)(v16 - 8);
  uint64_t v70 = v16;
  MEMORY[0x1F4188790](v16);
  os_log_type_t v18 = (char *)v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a2;
  swift_retain();
  unint64_t v20 = sub_1C1EAA9F0(a1, (uint64_t)v19, a3);

  swift_release();
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1C1EAF638();
    if (!v21) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v21) {
      goto LABEL_10;
    }
  }
  if (v21 < 1) {
    __break(1u);
  }
  for (uint64_t i = 0; i != v21; ++i)
  {
    if ((v20 & 0xC000000000000001) != 0) {
      id v23 = (id)MEMORY[0x1C874C6F0](i, v20);
    }
    else {
      id v23 = *(id *)(v20 + 8 * i + 32);
    }
    id v24 = v23;
    objc_msgSend(v19, sel_deleteObject_, v23);
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  aBlock[0] = 0;
  if (objc_msgSend(v19, sel_save_, aBlock))
  {
    id v25 = aBlock[0];
  }
  else
  {
    id v26 = aBlock[0];
    unint64_t v27 = (void *)sub_1C1EAD198();

    swift_willThrow();
    unint64_t v28 = v11;
    sub_1C1EAE508();
    swift_retain();
    id v29 = v27;
    swift_retain();
    id v30 = v27;
    unint64_t v31 = sub_1C1EAE558();
    os_log_type_t v32 = sub_1C1EAF0B8();
    int v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      v80[0] = v62;
      *(_DWORD *)uint64_t v34 = 136315650;
      os_log_t v61 = v31;
      aBlock[0] = v63;
      swift_getMetatypeMetadata();
      uint64_t v35 = sub_1C1EAED68();
      LODWORD(v63) = v33;
      aBlock[0] = (id)sub_1C1DF8D44(v35, v36, v80);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      v60[1] = v34 + 14;
      id v37 = objc_msgSend(*(id *)(a3 + 56), sel_profileIdentifier);
      id v38 = objc_msgSend(v37, sel_identifier);

      uint64_t v39 = v64;
      sub_1C1EAD348();

      sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
      uint64_t v40 = v66;
      uint64_t v41 = sub_1C1EAF768();
      unint64_t v43 = v42;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v39, v40);
      aBlock[0] = (id)sub_1C1DF8D44(v41, v43, v80);
      sub_1C1EAF2C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 2080;
      aBlock[0] = v27;
      id v44 = v27;
      sub_1C1E15F30();
      uint64_t v45 = sub_1C1EAED68();
      aBlock[0] = (id)sub_1C1DF8D44(v45, v46, v80);
      sub_1C1EAF2C8();
      swift_bridgeObjectRelease();

      os_log_t v47 = v61;
      _os_log_impl(&dword_1C1DD2000, v61, (os_log_type_t)v63, "[%s]_%s: Failed to save MOC with error: %s", (uint8_t *)v34, 0x20u);
      uint64_t v48 = v62;
      swift_arrayDestroy();
      MEMORY[0x1C874D2E0](v48, -1, -1);
      MEMORY[0x1C874D2E0](v34, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v28, v68);
  }
  sub_1C1E16B8C();
  uint64_t v50 = v69;
  uint64_t v49 = v70;
  (*(void (**)(char *, void, uint64_t))(v69 + 104))(v18, *MEMORY[0x1E4FBCB20], v70);
  uint64_t v51 = v78;
  swift_retain();
  uint64_t v52 = (void *)sub_1C1EAF1B8();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v49);
  uint64_t v53 = (void *)swift_allocObject();
  v53[2] = v71;
  v53[3] = v51;
  aBlock[4] = sub_1C1DD6C18;
  aBlock[5] = v53;
  aBlock[0] = (id)MEMORY[0x1E4F143A8];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1C1DF5050;
  aBlock[3] = &block_descriptor_22_0;
  os_log_type_t v54 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v55 = v72;
  sub_1C1EAEB98();
  v80[0] = MEMORY[0x1E4FBC860];
  sub_1C1DFFCB0((unint64_t *)&qword_1EBB683C8, MEMORY[0x1E4FBCB00]);
  uint64_t v56 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1C1DE38AC(0, &qword_1EBB683D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1E16E0C((unint64_t *)&qword_1EBB683D8, &qword_1EBB683D0, v56);
  uint64_t v57 = v74;
  uint64_t v58 = v77;
  sub_1C1EAF328();
  MEMORY[0x1C874C3B0](0, v55, v57, v54);
  _Block_release(v54);
  swift_release();

  (*(void (**)(char *, uint64_t))(v76 + 8))(v57, v58);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v55, v75);
  return swift_release();
}

uint64_t BaseFeedPopulationManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

BOOL sub_1C1EA9E78()
{
  uint64_t v0 = sub_1C1EADCE8();
  uint64_t v1 = sub_1C1EAE0F8();
  char v2 = sub_1C1EAA3B4(v1, v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

uint64_t sub_1C1EA9EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1EAD368();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C1EAE568();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EAE508();
  swift_retain_n();
  uint64_t v12 = sub_1C1EAE558();
  os_log_type_t v13 = sub_1C1EAF0D8();
  int v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = swift_slowAlloc();
    int v40 = v14;
    uint64_t v16 = v15;
    uint64_t v41 = swift_slowAlloc();
    uint64_t v44 = a2;
    uint64_t v45 = v41;
    *(_DWORD *)uint64_t v16 = 136446978;
    uint64_t v43 = v8;
    swift_getMetatypeMetadata();
    uint64_t v42 = v9;
    uint64_t v17 = sub_1C1EAED68();
    os_log_t v39 = v12;
    uint64_t v44 = sub_1C1DF8D44(v17, v18, &v45);
    v37[2] = &v45;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    v37[1] = v16 + 14;
    id v19 = *(void **)(a1 + 56);
    id v20 = objc_msgSend(v19, sel_profileIdentifier);
    id v21 = objc_msgSend(v20, sel_identifier);

    sub_1C1EAD348();
    uint64_t v22 = sub_1C1DFFCB0((unint64_t *)&qword_1EBB66150, MEMORY[0x1E4F27990]);
    id v38 = v11;
    v37[0] = v22;
    uint64_t v23 = sub_1C1EAF768();
    unint64_t v25 = v24;
    v37[3] = a2;
    id v26 = *(void (**)(char *, uint64_t))(v5 + 8);
    v26(v7, v4);
    uint64_t v44 = sub_1C1DF8D44(v23, v25, &v45);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 22) = 2080;
    id v27 = objc_msgSend(v19, sel_profileIdentifier);
    id v28 = objc_msgSend(v27, sel_identifier);

    sub_1C1EAD348();
    uint64_t v29 = sub_1C1EAF768();
    unint64_t v31 = v30;
    v26(v7, v4);
    uint64_t v44 = sub_1C1DF8D44(v29, v31, &v45);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 32) = 2082;
    uint64_t v44 = a1;
    swift_retain();
    uint64_t v32 = sub_1C1EAED68();
    uint64_t v44 = sub_1C1DF8D44(v32, v33, &v45);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v34 = v39;
    _os_log_impl(&dword_1C1DD2000, v39, (os_log_type_t)v40, "[%{public}s]_%s: Live feeds for profile %s repopulated after save detected; %{public}s",
      (uint8_t *)v16,
      0x2Au);
    uint64_t v35 = v41;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v35, -1, -1);
    MEMORY[0x1C874D2E0](v16, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v38, v43);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1C1EAA3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1EAD668();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)v23 - v9;
  if (!*(void *)(a2 + 16)) {
    return 1;
  }
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24) {
    return 1;
  }
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v11 = v8 + 16;
  uint64_t v25 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
  uint64_t v28 = *(void *)(v11 + 56);
  uint64_t v29 = v12;
  uint64_t v27 = a2 + 56;
  os_log_type_t v13 = (void (**)(char *, uint64_t))(v11 - 8);
  v23[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  while (1)
  {
    uint64_t v26 = v14;
    v29(v10, v25 + v28 * v14, v4);
    if (*(void *)(a2 + 16))
    {
      sub_1C1DFFCB0(&qword_1EBB66160, MEMORY[0x1E4F67030]);
      uint64_t v15 = sub_1C1EAECB8();
      uint64_t v16 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v17 = v15 & ~v16;
      if ((*(void *)(v27 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17)) {
        break;
      }
    }
LABEL_4:
    uint64_t v14 = v26 + 1;
    (*v13)(v10, v4);
    if (v14 == v24)
    {
      uint64_t v21 = 1;
      goto LABEL_13;
    }
  }
  uint64_t v18 = ~v16;
  while (1)
  {
    v29(v7, *(void *)(a2 + 48) + v17 * v28, v4);
    sub_1C1DFFCB0(&qword_1EBB66168, MEMORY[0x1E4F67030]);
    char v19 = sub_1C1EAED18();
    id v20 = *v13;
    (*v13)(v7, v4);
    if (v19) {
      break;
    }
    unint64_t v17 = (v17 + 1) & v18;
    if (((*(void *)(v27 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
      goto LABEL_4;
    }
  }
  v20(v10, v4);
  uint64_t v21 = 0;
LABEL_13:
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_1C1EAA6AC()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C1EAA6FC()
{
  return sub_1C1EAA9C8((uint64_t (*)(void, void, void, void, void, void))sub_1C1EA8F20);
}

BOOL sub_1C1EAA714()
{
  return sub_1C1EA9E78();
}

uint64_t sub_1C1EAA734()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C1EAA76C()
{
  return sub_1C1EA9EE4(*(void *)(v0 + 32), *(void *)(v0 + 16));
}

uint64_t method lookup function for BaseFeedPopulationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BaseFeedPopulationManager);
}

uint64_t dispatch thunk of BaseFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.populateFeed(feedKinds:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.moc_queue_executeFeedPopulation(managedObjectContext:healthStore:feedKinds:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.deleteFeed(feedKinds:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t destroy for BaseFeedPopulationManager.Request()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t _s18HealthPlatformCore25BaseFeedPopulationManagerC7RequestVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for BaseFeedPopulationManager.Request(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
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

uint64_t assignWithTake for BaseFeedPopulationManager.Request(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for BaseFeedPopulationManager.Request()
{
  return &type metadata for BaseFeedPopulationManager.Request;
}

uint64_t sub_1C1EAA960()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C1EAA9B0()
{
  return sub_1C1EAA9C8((uint64_t (*)(void, void, void, void, void, void))sub_1C1EA94A8);
}

uint64_t sub_1C1EAA9C8(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C1EAA9E0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1EAA9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v12 = MEMORY[0x1E4FBC860];
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    sub_1C1EAE188();
    unint64_t v7 = *(void **)(a3 + 56);
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v9 = objc_msgSend(v7, sel_profileIdentifier);
      uint64_t v10 = (void *)sub_1C1EAE178();

      uint64_t v11 = sub_1C1EADE58();
      if (v11)
      {
        MEMORY[0x1C874C090]();
        if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C1EAEEE8();
        }
        sub_1C1EAEF18();
        sub_1C1EAEEB8();
      }
    }
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_1C1EAAB4C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C1EAAB84()
{
  if (!qword_1EBB651E0)
  {
    unint64_t v0 = sub_1C1EAEF28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB651E0);
    }
  }
}

uint64_t sub_1C1EAABDC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void, void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C1EAAD94(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C1EAAC20()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1EAAC58()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1EAAC90()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();

  return MEMORY[0x1F4186498](v0, 120, 7);
}

void sub_1C1EAACE0()
{
  if (!qword_1EBB653A0)
  {
    uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1E4F1AC28];
    sub_1C1EAAD94(255, &qword_1EBB65438, MEMORY[0x1E4F1AC28]);
    sub_1C1EAABDC(&qword_1EBB65430, &qword_1EBB65438, v0);
    unint64_t v1 = sub_1C1EAE5E8();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EBB653A0);
    }
  }
}

void sub_1C1EAAD94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void, void))
{
  if (!*a2)
  {
    sub_1C1EAAB84();
    unint64_t v7 = a3(a1, v6, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC278]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1C1EAAE04()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 112, 7);
}

uint64_t sub_1C1EAAE64(uint64_t a1, uint64_t a2)
{
  return sub_1C1EA7290(a1, a2, (void *)(v2 + 16), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 72), *(void **)(v2 + 80), *(void *)(v2 + 88), *(void **)(v2 + 96), *(void *)(v2 + 104));
}

uint64_t sub_1C1EAAE9C(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1C1EAAEDC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1C1EAAF3C()
{
  return sub_1C1EAAFCC((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_1C1EA73F0);
}

uint64_t sub_1C1EAAF54()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1C1EAAFB4()
{
  return sub_1C1EAAFCC((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_1C1EA7538);
}

uint64_t sub_1C1EAAFCC(uint64_t (*a1)(void, void, void, void, void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]);
}

uint64_t sub_1C1EAB018()
{
  return sub_1C1EAB0A4((uint64_t (*)(void, void, void, void, void, void, void, void))sub_1C1EA7E7C);
}

uint64_t objectdestroy_61Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1C1EAB08C()
{
  return sub_1C1EAB0A4((uint64_t (*)(void, void, void, void, void, void, void, void))sub_1C1EA7FAC);
}

uint64_t sub_1C1EAB0A4(uint64_t (*a1)(void, void, void, void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t objectdestroy_51Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C1EAB10C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t, void))(v0 + 40);
  (*(void (**)(void))(v0 + 24))();
  return v2(v1, 0);
}

uint64_t sub_1C1EAB15C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C1EAB1AC()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 48);
  uint64_t v2 = (*(uint64_t (**)(void))(v0 + 24))();
  return v1(v2);
}

uint64_t InteractiveGeneratorToPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:commitImmediately:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10 = swift_allocObject();
  InteractiveGeneratorToPipelineAdaptor.init(queue:pluginInfo:domain:context:commitImmediately:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t InteractiveGeneratorToPipelineAdaptor.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  uint64_t v4 = sub_1C1EAD9C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_1C1EAB31C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1C1EAB388()
{
  return swift_retain();
}

uint64_t sub_1C1EAB3D4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_1C1EAB428())()
{
  return j__swift_endAccess;
}

void **InteractiveGeneratorToPipelineAdaptor.init(queue:pluginInfo:domain:context:commitImmediately:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v52 = a5;
  uint64_t v55 = a4;
  uint64_t v56 = a2;
  uint64_t v8 = *v5;
  uint64_t v44 = (uint64_t)a1;
  id v45 = v8;
  uint64_t v9 = sub_1C1EAE568();
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v49 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C1EADA28();
  uint64_t v53 = *(void *)(v11 - 8);
  uint64_t v12 = v53;
  MEMORY[0x1F4188790](v11);
  uint64_t v48 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C1EAD9C8();
  uint64_t v54 = *(void *)(v14 - 8);
  uint64_t v15 = v54;
  MEMORY[0x1F4188790](v14);
  unint64_t v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void **)((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_finishObservation) = 0;
  *(void **)((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_queue) = a1;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v19 = a3;
  v18((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain, a3, v14);
  id v20 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v21 = v55;
  v20((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_context, v55, v11);
  sub_1C1DFE408(v56, (uint64_t)v58);
  uint64_t v47 = v19;
  v18(v17, v19, v14);
  uint64_t v22 = v48;
  v20(v48, v21, v11);
  type metadata accessor for GenerationOperationToGeneratorAdaptor();
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = (void *)v44;
  *(void *)(v23 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_queue) = v44;
  uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v54 + 32);
  uint64_t v46 = v14;
  v25(v23 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_domain, v17, v14);
  uint64_t v26 = v5;
  uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v53 + 32);
  uint64_t v48 = (char *)v11;
  v27(v23 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v22, v11);
  sub_1C1DFE46C(v58, v23 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo);
  *(void **)((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_adaptor) = (void *)v23;
  id v28 = v24;
  swift_retain();
  if (v52)
  {
    id v29 = v45;
    uint64_t v30 = sub_1C1EABA98(v23);
  }
  else
  {
    uint64_t v30 = sub_1C1EAC910(v23);
    id v29 = v45;
  }
  swift_release();
  *(void **)((char *)v26 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher) = (void *)v30;
  unint64_t v31 = v49;
  sub_1C1EAE4F8();
  swift_retain_n();
  uint64_t v32 = sub_1C1EAE558();
  os_log_type_t v33 = sub_1C1EAF0D8();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    id v45 = v28;
    uint64_t v35 = v34;
    uint64_t v44 = swift_slowAlloc();
    uint64_t v57 = v44;
    *(void *)&v58[0] = v29;
    *(_DWORD *)uint64_t v35 = 136446722;
    swift_getMetatypeMetadata();
    uint64_t v36 = sub_1C1EAED68();
    *(void *)&v58[0] = sub_1C1DF8D44(v36, v37, &v57);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2082;
    __swift_project_boxed_opaque_existential_1(*(char **)((char *)v26 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_adaptor)+ OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo, *(void *)(*(char **)((char *)v26+ OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_adaptor)+ OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo+ 24));
    uint64_t v38 = sub_1C1EAD5B8();
    *(void *)&v58[0] = sub_1C1DF8D44(v38, v39, &v57);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 2082;
    if (v52) {
      uint64_t v40 = 1702195828;
    }
    else {
      uint64_t v40 = 0x65736C6166;
    }
    if (v52) {
      unint64_t v41 = 0xE400000000000000;
    }
    else {
      unint64_t v41 = 0xE500000000000000;
    }
    *(void *)&v58[0] = sub_1C1DF8D44(v40, v41, &v57);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v32, v33, "[%{public}s]: Initialized for plugin %{public}s with commitImmediately=%{public}s", (uint8_t *)v35, 0x20u);
    uint64_t v42 = v44;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v42, -1, -1);
    MEMORY[0x1C874D2E0](v35, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  (*(void (**)(uint64_t, char *))(v53 + 8))(v55, v48);
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v47, v46);
  __swift_destroy_boxed_opaque_existential_1(v56);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v31, v51);
  return v26;
}

uint64_t sub_1C1EABA98(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C1EADA28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EACE3C();
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v4);
  sub_1C1EAD9D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1C1DFE408(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo, (uint64_t)v21);
  uint64_t v13 = *(void **)(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_queue);
  sub_1C1DFE46C(v19, (uint64_t)v20);
  v21[5] = v13;
  sub_1C1E18074();
  id v14 = v13;
  uint64_t v15 = sub_1C1EAEA38();
  sub_1C1DD5CF0((uint64_t)v20);
  v20[0] = v15;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = v2;
  sub_1C1EACEF8();
  sub_1C1DF9148(0, (unint64_t *)&qword_1EBB66218);
  sub_1C1EAD000(&qword_1EBB66F28, (void (*)(uint64_t))sub_1C1EACEF8);
  swift_retain();
  sub_1C1EAEA68();
  swift_release();
  swift_release();
  sub_1C1EAD000(&qword_1EBB66E48, (void (*)(uint64_t))sub_1C1EACE3C);
  uint64_t v17 = sub_1C1EAEA38();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

uint64_t sub_1C1EABDB0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v38 = a4;
  uint64_t v37 = sub_1C1EAE568();
  uint64_t v7 = *(void *)(v37 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v37);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = &v34[-v9];
  uint64_t v11 = sub_1C1EADA28();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  id v14 = &v34[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = *a1;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v14, a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v11);
  sub_1C1EAD9D8();
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  __swift_project_boxed_opaque_existential_1(v40, v40[3]);
  sub_1C1EAD928();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  sub_1C1EAE4F8();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v16 = sub_1C1EAE558();
  os_log_type_t v17 = sub_1C1EAF0D8();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v39[0] = v36;
    *(_DWORD *)uint64_t v19 = 136446978;
    int v35 = v18;
    v40[0] = a3;
    swift_getMetatypeMetadata();
    uint64_t v20 = sub_1C1EAED68();
    v40[0] = sub_1C1DF8D44(v20, v21, v39);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2050;
    uint64_t v22 = *(void *)(v15 + 16);
    swift_bridgeObjectRelease();
    v40[0] = v22;
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2082;
    __swift_project_boxed_opaque_existential_1((void *)(a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo), *(void *)(a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo + 24));
    uint64_t v23 = sub_1C1EAD5B8();
    v40[0] = sub_1C1DF8D44(v23, v24, v39);
    sub_1C1EAF2C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 32) = 2080;
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = MEMORY[0x1C874C0C0](v25, MEMORY[0x1E4F67380]);
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    v40[0] = sub_1C1DF8D44(v26, v28, v39);
    sub_1C1EAF2C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1DD2000, v16, (os_log_type_t)v35, "[%{public}s]: %{public}ld changes for plugin %{public}s have been committed immediately; emitting empty generator. Changes: %s",
      (uint8_t *)v19,
      0x2Au);
    uint64_t v29 = v36;
    swift_arrayDestroy();
    MEMORY[0x1C874D2E0](v29, -1, -1);
    MEMORY[0x1C874D2E0](v19, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v37);
  uint64_t v30 = sub_1C1EAD828();
  uint64_t v31 = MEMORY[0x1E4F670D8];
  uint64_t v32 = v38;
  v38[3] = v30;
  v32[4] = v31;
  __swift_allocate_boxed_opaque_existential_0(v32);
  return sub_1C1EAD7F8();
}

uint64_t sub_1C1EAC404@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_1C1EAD9C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EACFA8();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  id v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *a1;
  sub_1C1E1A804();
  swift_bridgeObjectRetain();
  sub_1C1EAE8B8();
  sub_1C1EAD000(&qword_1EBB65E28, (void (*)(uint64_t))sub_1C1EACFA8);
  uint64_t v15 = sub_1C1EAEA38();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_domain;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  uint64_t v17 = sub_1C1EAD828();
  uint64_t v18 = MEMORY[0x1E4F670D8];
  a3[3] = v17;
  a3[4] = v18;
  __swift_allocate_boxed_opaque_existential_0(a3);
  return MEMORY[0x1C874AA30](v15, v9);
}

uint64_t InteractiveGeneratorToPipelineAdaptor.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  uint64_t v2 = sub_1C1EAD9C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_context;
  uint64_t v4 = sub_1C1EADA28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  return v0;
}

uint64_t InteractiveGeneratorToPipelineAdaptor.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  uint64_t v2 = sub_1C1EAD9C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_context;
  uint64_t v4 = sub_1C1EADA28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1C1EAC848()
{
  return swift_retain();
}

uint64_t sub_1C1EAC898@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  uint64_t v4 = sub_1C1EAD9C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_1C1EAC910(uint64_t a1)
{
  uint64_t v2 = sub_1C1EADA28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EACE3C();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v2);
  sub_1C1EAD9D8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1C1DFE408(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo, (uint64_t)v18);
  uint64_t v11 = *(void **)(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_queue);
  sub_1C1DFE46C(v16, (uint64_t)v17);
  v18[5] = v11;
  sub_1C1E18074();
  id v12 = v11;
  uint64_t v13 = sub_1C1EAEA38();
  sub_1C1DD5CF0((uint64_t)v17);
  v17[0] = v13;
  sub_1C1EACEF8();
  sub_1C1DF9148(0, (unint64_t *)&qword_1EBB66218);
  sub_1C1EAD000(&qword_1EBB66F28, (void (*)(uint64_t))sub_1C1EACEF8);
  swift_retain();
  sub_1C1EAEA68();
  swift_release();
  swift_release();
  sub_1C1EAD000(&qword_1EBB66E48, (void (*)(uint64_t))sub_1C1EACE3C);
  uint64_t v14 = sub_1C1EAEA38();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

uint64_t sub_1C1EACC00@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_1C1EACC5C()
{
  return type metadata accessor for InteractiveGeneratorToPipelineAdaptor();
}

uint64_t type metadata accessor for InteractiveGeneratorToPipelineAdaptor()
{
  uint64_t result = qword_1EBB66C78;
  if (!qword_1EBB66C78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C1EACCB0()
{
  uint64_t result = sub_1C1EAD9C8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C1EADA28();
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

uint64_t method lookup function for InteractiveGeneratorToPipelineAdaptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InteractiveGeneratorToPipelineAdaptor);
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.publisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.publisher.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.publisher.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:commitImmediately:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

void sub_1C1EACE3C()
{
  if (!qword_1EBB66E50)
  {
    sub_1C1EACEF8();
    sub_1C1DF9148(255, (unint64_t *)&qword_1EBB66218);
    sub_1C1EAD000(&qword_1EBB66F28, (void (*)(uint64_t))sub_1C1EACEF8);
    unint64_t v0 = sub_1C1EAE668();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB66E50);
    }
  }
}

void sub_1C1EACEF8()
{
  if (!qword_1EBB66F30)
  {
    sub_1C1E1A804();
    unint64_t v0 = sub_1C1EAE7D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB66F30);
    }
  }
}

uint64_t sub_1C1EACF60()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1EACF98@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C1EABDB0(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1C1EACFA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C1EAC404(a1, v2, a2);
}

void sub_1C1EACFA8()
{
  if (!qword_1EBB65E30)
  {
    sub_1C1E1A804();
    unint64_t v0 = sub_1C1EAE8A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB65E30);
    }
  }
}

uint64_t sub_1C1EAD000(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C1EAD048()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C1EAD058()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C1EAD068()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C1EAD078()
{
  return MEMORY[0x1F411D688]();
}

uint64_t sub_1C1EAD088()
{
  return MEMORY[0x1F40E34B0]();
}

uint64_t sub_1C1EAD098()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1C1EAD0A8()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1C1EAD0B8()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1C1EAD0C8()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1C1EAD0D8()
{
  return MEMORY[0x1F40E3508]();
}

uint64_t sub_1C1EAD0E8()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1C1EAD0F8()
{
  return MEMORY[0x1F40E3540]();
}

uint64_t sub_1C1EAD108()
{
  return MEMORY[0x1F40E3560]();
}

uint64_t sub_1C1EAD118()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1C1EAD128()
{
  return MEMORY[0x1F40E3598]();
}

uint64_t sub_1C1EAD138()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C1EAD148()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1C1EAD158()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1C1EAD168()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1C1EAD178()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1C1EAD188()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C1EAD198()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C1EAD1A8()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1C1EAD1B8()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1C1EAD1C8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C1EAD1D8()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1C1EAD1E8()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1C1EAD1F8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C1EAD208()
{
  return MEMORY[0x1F40E49D0]();
}

uint64_t sub_1C1EAD218()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1C1EAD228()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1C1EAD238()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1C1EAD248()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C1EAD258()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C1EAD268()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C1EAD278()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C1EAD288()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1C1EAD298()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1C1EAD2A8()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1C1EAD2B8()
{
  return MEMORY[0x1F411D698]();
}

uint64_t sub_1C1EAD2C8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C1EAD2D8()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C1EAD2F8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1C1EAD308()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C1EAD318()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C1EAD328()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C1EAD338()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C1EAD348()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C1EAD358()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C1EAD368()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C1EAD378()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1C1EAD388()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1C1EAD398()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1C1EAD3A8()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1C1EAD3B8()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1C1EAD3C8()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C1EAD3D8()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1C1EAD3E8()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1C1EAD3F8()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1C1EAD408()
{
  return MEMORY[0x1F411FDA8]();
}

uint64_t sub_1C1EAD418()
{
  return MEMORY[0x1F411FDB0]();
}

uint64_t sub_1C1EAD428()
{
  return MEMORY[0x1F411FDB8]();
}

uint64_t sub_1C1EAD438()
{
  return MEMORY[0x1F411FDC0]();
}

uint64_t sub_1C1EAD448()
{
  return MEMORY[0x1F411FDC8]();
}

uint64_t sub_1C1EAD458()
{
  return MEMORY[0x1F411FDD0]();
}

uint64_t sub_1C1EAD468()
{
  return MEMORY[0x1F411FDD8]();
}

uint64_t sub_1C1EAD478()
{
  return MEMORY[0x1F411FDE0]();
}

uint64_t sub_1C1EAD488()
{
  return MEMORY[0x1F411FDE8]();
}

uint64_t sub_1C1EAD498()
{
  return MEMORY[0x1F411FDF0]();
}

uint64_t sub_1C1EAD4A8()
{
  return MEMORY[0x1F411FDF8]();
}

uint64_t sub_1C1EAD4B8()
{
  return MEMORY[0x1F411FE00]();
}

uint64_t sub_1C1EAD4C8()
{
  return MEMORY[0x1F411FE08]();
}

uint64_t sub_1C1EAD4D8()
{
  return MEMORY[0x1F411FE10]();
}

uint64_t sub_1C1EAD4E8()
{
  return MEMORY[0x1F411FE20]();
}

uint64_t sub_1C1EAD4F8()
{
  return MEMORY[0x1F411FE28]();
}

uint64_t sub_1C1EAD508()
{
  return MEMORY[0x1F411FE30]();
}

uint64_t sub_1C1EAD518()
{
  return MEMORY[0x1F411FE38]();
}

uint64_t sub_1C1EAD528()
{
  return MEMORY[0x1F411FE48]();
}

uint64_t sub_1C1EAD538()
{
  return MEMORY[0x1F411FE50]();
}

uint64_t sub_1C1EAD548()
{
  return MEMORY[0x1F411FE60]();
}

uint64_t sub_1C1EAD558()
{
  return MEMORY[0x1F411FE98]();
}

uint64_t sub_1C1EAD568()
{
  return MEMORY[0x1F411FEB0]();
}

uint64_t sub_1C1EAD578()
{
  return MEMORY[0x1F411FEB8]();
}

uint64_t sub_1C1EAD588()
{
  return MEMORY[0x1F411FEE0]();
}

uint64_t sub_1C1EAD598()
{
  return MEMORY[0x1F411FEE8]();
}

uint64_t sub_1C1EAD5A8()
{
  return MEMORY[0x1F411FEF0]();
}

uint64_t sub_1C1EAD5B8()
{
  return MEMORY[0x1F411FEF8]();
}

uint64_t sub_1C1EAD5C8()
{
  return MEMORY[0x1F411FF00]();
}

uint64_t sub_1C1EAD5D8()
{
  return MEMORY[0x1F411FF10]();
}

uint64_t sub_1C1EAD5E8()
{
  return MEMORY[0x1F411FF18]();
}

uint64_t sub_1C1EAD5F8()
{
  return MEMORY[0x1F411FF20]();
}

uint64_t sub_1C1EAD608()
{
  return MEMORY[0x1F411FF28]();
}

uint64_t sub_1C1EAD618()
{
  return MEMORY[0x1F411FF38]();
}

uint64_t sub_1C1EAD628()
{
  return MEMORY[0x1F411FF48]();
}

uint64_t sub_1C1EAD638()
{
  return MEMORY[0x1F411FF50]();
}

uint64_t sub_1C1EAD648()
{
  return MEMORY[0x1F411FF58]();
}

uint64_t sub_1C1EAD658()
{
  return MEMORY[0x1F411FF60]();
}

uint64_t sub_1C1EAD668()
{
  return MEMORY[0x1F411FF68]();
}

uint64_t sub_1C1EAD678()
{
  return MEMORY[0x1F411FF70]();
}

uint64_t sub_1C1EAD688()
{
  return MEMORY[0x1F411FF78]();
}

uint64_t sub_1C1EAD698()
{
  return MEMORY[0x1F411FF80]();
}

uint64_t sub_1C1EAD6A8()
{
  return MEMORY[0x1F411FF88]();
}

uint64_t sub_1C1EAD6B8()
{
  return MEMORY[0x1F411FF90]();
}

uint64_t sub_1C1EAD6C8()
{
  return MEMORY[0x1F411FF98]();
}

uint64_t sub_1C1EAD6D8()
{
  return MEMORY[0x1F411FFA0]();
}

uint64_t sub_1C1EAD6E8()
{
  return MEMORY[0x1F411FFA8]();
}

uint64_t sub_1C1EAD6F8()
{
  return MEMORY[0x1F411FFB8]();
}

uint64_t sub_1C1EAD708()
{
  return MEMORY[0x1F411FFC8]();
}

uint64_t sub_1C1EAD718()
{
  return MEMORY[0x1F411FFD0]();
}

uint64_t sub_1C1EAD728()
{
  return MEMORY[0x1F411FFD8]();
}

uint64_t sub_1C1EAD738()
{
  return MEMORY[0x1F411FFE0]();
}

uint64_t sub_1C1EAD748()
{
  return MEMORY[0x1F411FFE8]();
}

uint64_t sub_1C1EAD758()
{
  return MEMORY[0x1F411FFF0]();
}

uint64_t sub_1C1EAD768()
{
  return MEMORY[0x1F411FFF8]();
}

uint64_t sub_1C1EAD778()
{
  return MEMORY[0x1F4120000]();
}

uint64_t sub_1C1EAD788()
{
  return MEMORY[0x1F4120008]();
}

uint64_t sub_1C1EAD798()
{
  return MEMORY[0x1F4120010]();
}

uint64_t sub_1C1EAD7A8()
{
  return MEMORY[0x1F4120018]();
}

uint64_t sub_1C1EAD7B8()
{
  return MEMORY[0x1F4120020]();
}

uint64_t sub_1C1EAD7C8()
{
  return MEMORY[0x1F4120028]();
}

uint64_t sub_1C1EAD7D8()
{
  return MEMORY[0x1F4120030]();
}

uint64_t sub_1C1EAD7E8()
{
  return MEMORY[0x1F4120038]();
}

uint64_t sub_1C1EAD7F8()
{
  return MEMORY[0x1F4120060]();
}

uint64_t sub_1C1EAD808()
{
  return MEMORY[0x1F4120068]();
}

uint64_t sub_1C1EAD818()
{
  return MEMORY[0x1F4120070]();
}

uint64_t sub_1C1EAD828()
{
  return MEMORY[0x1F4120078]();
}

uint64_t sub_1C1EAD838()
{
  return MEMORY[0x1F4120080]();
}

uint64_t sub_1C1EAD848()
{
  return MEMORY[0x1F4120098]();
}

uint64_t sub_1C1EAD858()
{
  return MEMORY[0x1F41200A0]();
}

uint64_t sub_1C1EAD868()
{
  return MEMORY[0x1F41200C8]();
}

uint64_t sub_1C1EAD878()
{
  return MEMORY[0x1F4120108]();
}

uint64_t sub_1C1EAD888()
{
  return MEMORY[0x1F4120150]();
}

uint64_t sub_1C1EAD898()
{
  return MEMORY[0x1F41201B8]();
}

uint64_t sub_1C1EAD8A8()
{
  return MEMORY[0x1F41201C8]();
}

uint64_t sub_1C1EAD8B8()
{
  return MEMORY[0x1F411D6C8]();
}

uint64_t sub_1C1EAD8C8()
{
  return MEMORY[0x1F41201D0]();
}

uint64_t sub_1C1EAD8D8()
{
  return MEMORY[0x1F41201E0]();
}

uint64_t sub_1C1EAD8E8()
{
  return MEMORY[0x1F41201E8]();
}

uint64_t sub_1C1EAD8F8()
{
  return MEMORY[0x1F41201F0]();
}

uint64_t sub_1C1EAD908()
{
  return MEMORY[0x1F41201F8]();
}

uint64_t sub_1C1EAD918()
{
  return MEMORY[0x1F4120200]();
}

uint64_t sub_1C1EAD928()
{
  return MEMORY[0x1F4120208]();
}

uint64_t sub_1C1EAD938()
{
  return MEMORY[0x1F4120238]();
}

uint64_t sub_1C1EAD948()
{
  return MEMORY[0x1F4120248]();
}

uint64_t sub_1C1EAD958()
{
  return MEMORY[0x1F4120250]();
}

uint64_t sub_1C1EAD968()
{
  return MEMORY[0x1F4120258]();
}

uint64_t sub_1C1EAD978()
{
  return MEMORY[0x1F4120260]();
}

uint64_t sub_1C1EAD988()
{
  return MEMORY[0x1F4120268]();
}

uint64_t sub_1C1EAD998()
{
  return MEMORY[0x1F4120270]();
}

uint64_t sub_1C1EAD9A8()
{
  return MEMORY[0x1F4120278]();
}

uint64_t sub_1C1EAD9B8()
{
  return MEMORY[0x1F4120280]();
}

uint64_t sub_1C1EAD9C8()
{
  return MEMORY[0x1F4120288]();
}

uint64_t sub_1C1EAD9D8()
{
  return MEMORY[0x1F4120298]();
}

uint64_t sub_1C1EAD9E8()
{
  return MEMORY[0x1F41202A8]();
}

uint64_t sub_1C1EAD9F8()
{
  return MEMORY[0x1F41202B0]();
}

uint64_t sub_1C1EADA08()
{
  return MEMORY[0x1F41202B8]();
}

uint64_t sub_1C1EADA18()
{
  return MEMORY[0x1F41202C0]();
}

uint64_t sub_1C1EADA28()
{
  return MEMORY[0x1F41202D0]();
}

uint64_t sub_1C1EADA38()
{
  return MEMORY[0x1F411D6D0]();
}

uint64_t sub_1C1EADA48()
{
  return MEMORY[0x1F411D6D8]();
}

uint64_t sub_1C1EADA58()
{
  return MEMORY[0x1F41202E0]();
}

uint64_t sub_1C1EADA68()
{
  return MEMORY[0x1F41202F0]();
}

uint64_t sub_1C1EADA78()
{
  return MEMORY[0x1F4120340]();
}

uint64_t sub_1C1EADA88()
{
  return MEMORY[0x1F4120348]();
}

uint64_t sub_1C1EADA98()
{
  return MEMORY[0x1F4120350]();
}

uint64_t sub_1C1EADAA8()
{
  return MEMORY[0x1F4120358]();
}

uint64_t sub_1C1EADAB8()
{
  return MEMORY[0x1F4120360]();
}

uint64_t sub_1C1EADAC8()
{
  return MEMORY[0x1F4120368]();
}

uint64_t sub_1C1EADAD8()
{
  return MEMORY[0x1F4120370]();
}

uint64_t sub_1C1EADAE8()
{
  return MEMORY[0x1F4120378]();
}

uint64_t sub_1C1EADAF8()
{
  return MEMORY[0x1F4120380]();
}

uint64_t sub_1C1EADB08()
{
  return MEMORY[0x1F4120388]();
}

uint64_t sub_1C1EADB18()
{
  return MEMORY[0x1F4120390]();
}

uint64_t _s14HealthPlatform7KeywordC0aB4CoreE11identifiers3forSaySSGSo12HKObjectTypeC_tFZ_0()
{
  return MEMORY[0x1F411D6E0]();
}

uint64_t sub_1C1EADB38()
{
  return MEMORY[0x1F41203F8]();
}

uint64_t sub_1C1EADB48()
{
  return MEMORY[0x1F4120418]();
}

uint64_t sub_1C1EADB58()
{
  return MEMORY[0x1F4120460]();
}

uint64_t sub_1C1EADB68()
{
  return MEMORY[0x1F4120470]();
}

uint64_t sub_1C1EADB78()
{
  return MEMORY[0x1F41205B8]();
}

uint64_t sub_1C1EADB88()
{
  return MEMORY[0x1F41205C0]();
}

uint64_t sub_1C1EADB98()
{
  return MEMORY[0x1F41205C8]();
}

uint64_t sub_1C1EADBA8()
{
  return MEMORY[0x1F41205D0]();
}

uint64_t sub_1C1EADBB8()
{
  return MEMORY[0x1F41205D8]();
}

uint64_t sub_1C1EADBC8()
{
  return MEMORY[0x1F41205E0]();
}

uint64_t sub_1C1EADBD8()
{
  return MEMORY[0x1F41205E8]();
}

uint64_t sub_1C1EADBE8()
{
  return MEMORY[0x1F41205F8]();
}

uint64_t sub_1C1EADBF8()
{
  return MEMORY[0x1F4120600]();
}

uint64_t sub_1C1EADC08()
{
  return MEMORY[0x1F4120608]();
}

uint64_t sub_1C1EADC18()
{
  return MEMORY[0x1F4120610]();
}

uint64_t sub_1C1EADC28()
{
  return MEMORY[0x1F4120668]();
}

uint64_t sub_1C1EADC38()
{
  return MEMORY[0x1F4120670]();
}

uint64_t sub_1C1EADC48()
{
  return MEMORY[0x1F4120678]();
}

uint64_t sub_1C1EADC58()
{
  return MEMORY[0x1F4120680]();
}

uint64_t sub_1C1EADC68()
{
  return MEMORY[0x1F4120688]();
}

uint64_t sub_1C1EADC78()
{
  return MEMORY[0x1F4120690]();
}

uint64_t sub_1C1EADC88()
{
  return MEMORY[0x1F4120698]();
}

uint64_t sub_1C1EADC98()
{
  return MEMORY[0x1F41206A0]();
}

uint64_t sub_1C1EADCA8()
{
  return MEMORY[0x1F41206A8]();
}

uint64_t sub_1C1EADCB8()
{
  return MEMORY[0x1F41206B0]();
}

uint64_t sub_1C1EADCC8()
{
  return MEMORY[0x1F41206B8]();
}

uint64_t sub_1C1EADCD8()
{
  return MEMORY[0x1F41206C0]();
}

uint64_t sub_1C1EADCE8()
{
  return MEMORY[0x1F41206C8]();
}

uint64_t sub_1C1EADCF8()
{
  return MEMORY[0x1F41206D0]();
}

uint64_t sub_1C1EADD08()
{
  return MEMORY[0x1F41206D8]();
}

uint64_t sub_1C1EADD18()
{
  return MEMORY[0x1F41206E0]();
}

uint64_t sub_1C1EADD28()
{
  return MEMORY[0x1F41206E8]();
}

uint64_t sub_1C1EADD38()
{
  return MEMORY[0x1F41206F0]();
}

uint64_t sub_1C1EADD48()
{
  return MEMORY[0x1F41206F8]();
}

uint64_t sub_1C1EADD58()
{
  return MEMORY[0x1F4120718]();
}

uint64_t sub_1C1EADD68()
{
  return MEMORY[0x1F4120720]();
}

uint64_t sub_1C1EADD78()
{
  return MEMORY[0x1F4120728]();
}

uint64_t sub_1C1EADD88()
{
  return MEMORY[0x1F4120740]();
}

uint64_t sub_1C1EADD98()
{
  return MEMORY[0x1F4120748]();
}

uint64_t sub_1C1EADDA8()
{
  return MEMORY[0x1F4120750]();
}

uint64_t sub_1C1EADDB8()
{
  return MEMORY[0x1F4120758]();
}

uint64_t sub_1C1EADDC8()
{
  return MEMORY[0x1F4120760]();
}

uint64_t sub_1C1EADDD8()
{
  return MEMORY[0x1F4120768]();
}

uint64_t sub_1C1EADDE8()
{
  return MEMORY[0x1F41207E8]();
}

uint64_t sub_1C1EADDF8()
{
  return MEMORY[0x1F41207F0]();
}

uint64_t sub_1C1EADE08()
{
  return MEMORY[0x1F41207F8]();
}

uint64_t sub_1C1EADE18()
{
  return MEMORY[0x1F4120800]();
}

uint64_t sub_1C1EADE28()
{
  return MEMORY[0x1F4120808]();
}

uint64_t sub_1C1EADE38()
{
  return MEMORY[0x1F4120810]();
}

uint64_t sub_1C1EADE48()
{
  return MEMORY[0x1F4120818]();
}

uint64_t sub_1C1EADE58()
{
  return MEMORY[0x1F4120820]();
}

uint64_t sub_1C1EADE68()
{
  return MEMORY[0x1F4120858]();
}

uint64_t sub_1C1EADE78()
{
  return MEMORY[0x1F4120860]();
}

uint64_t sub_1C1EADE88()
{
  return MEMORY[0x1F4120868]();
}

uint64_t sub_1C1EADE98()
{
  return MEMORY[0x1F4120870]();
}

uint64_t sub_1C1EADEA8()
{
  return MEMORY[0x1F4120878]();
}

uint64_t sub_1C1EADEB8()
{
  return MEMORY[0x1F4120880]();
}

uint64_t sub_1C1EADEC8()
{
  return MEMORY[0x1F41208A0]();
}

uint64_t sub_1C1EADED8()
{
  return MEMORY[0x1F41208A8]();
}

uint64_t sub_1C1EADEE8()
{
  return MEMORY[0x1F41208B0]();
}

uint64_t sub_1C1EADEF8()
{
  return MEMORY[0x1F41208F0]();
}

uint64_t sub_1C1EADF08()
{
  return MEMORY[0x1F41208F8]();
}

uint64_t sub_1C1EADF18()
{
  return MEMORY[0x1F4120900]();
}

uint64_t sub_1C1EADF28()
{
  return MEMORY[0x1F4120908]();
}

uint64_t sub_1C1EADF38()
{
  return MEMORY[0x1F4120910]();
}

uint64_t sub_1C1EADF48()
{
  return MEMORY[0x1F4120918]();
}

uint64_t sub_1C1EADF58()
{
  return MEMORY[0x1F4120920]();
}

uint64_t sub_1C1EADF68()
{
  return MEMORY[0x1F4120928]();
}

uint64_t sub_1C1EADF78()
{
  return MEMORY[0x1F4120930]();
}

uint64_t sub_1C1EADF88()
{
  return MEMORY[0x1F4120950]();
}

uint64_t sub_1C1EADF98()
{
  return MEMORY[0x1F4120958]();
}

uint64_t sub_1C1EADFA8()
{
  return MEMORY[0x1F4120960]();
}

uint64_t sub_1C1EADFC8()
{
  return MEMORY[0x1F4120970]();
}

uint64_t sub_1C1EADFD8()
{
  return MEMORY[0x1F4120978]();
}

uint64_t sub_1C1EADFE8()
{
  return MEMORY[0x1F4120980]();
}

uint64_t sub_1C1EADFF8()
{
  return MEMORY[0x1F41209A8]();
}

uint64_t sub_1C1EAE008()
{
  return MEMORY[0x1F41209B0]();
}

uint64_t sub_1C1EAE018()
{
  return MEMORY[0x1F41209C0]();
}

uint64_t sub_1C1EAE028()
{
  return MEMORY[0x1F41209C8]();
}

uint64_t sub_1C1EAE038()
{
  return MEMORY[0x1F41209D0]();
}

uint64_t sub_1C1EAE048()
{
  return MEMORY[0x1F41209D8]();
}

uint64_t sub_1C1EAE058()
{
  return MEMORY[0x1F41209E0]();
}

uint64_t sub_1C1EAE068()
{
  return MEMORY[0x1F41209E8]();
}

uint64_t sub_1C1EAE078()
{
  return MEMORY[0x1F41209F0]();
}

uint64_t sub_1C1EAE088()
{
  return MEMORY[0x1F41209F8]();
}

uint64_t sub_1C1EAE098()
{
  return MEMORY[0x1F4120A00]();
}

uint64_t sub_1C1EAE0A8()
{
  return MEMORY[0x1F4120A08]();
}

uint64_t sub_1C1EAE0B8()
{
  return MEMORY[0x1F4120A20]();
}

uint64_t sub_1C1EAE0C8()
{
  return MEMORY[0x1F4120A28]();
}

uint64_t sub_1C1EAE0D8()
{
  return MEMORY[0x1F4120A30]();
}

uint64_t sub_1C1EAE0E8()
{
  return MEMORY[0x1F4120A38]();
}

uint64_t sub_1C1EAE0F8()
{
  return MEMORY[0x1F4120A40]();
}

uint64_t sub_1C1EAE108()
{
  return MEMORY[0x1F4120A48]();
}

uint64_t sub_1C1EAE118()
{
  return MEMORY[0x1F4120A50]();
}

uint64_t _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0()
{
  return MEMORY[0x1F4120A58]();
}

uint64_t sub_1C1EAE138()
{
  return MEMORY[0x1F4120A60]();
}

uint64_t sub_1C1EAE148()
{
  return MEMORY[0x1F4120A68]();
}

uint64_t sub_1C1EAE158()
{
  return MEMORY[0x1F4120A70]();
}

uint64_t sub_1C1EAE168()
{
  return MEMORY[0x1F4120A78]();
}

uint64_t sub_1C1EAE178()
{
  return MEMORY[0x1F4120A80]();
}

uint64_t sub_1C1EAE188()
{
  return MEMORY[0x1F4120A88]();
}

uint64_t sub_1C1EAE198()
{
  return MEMORY[0x1F4120A90]();
}

uint64_t sub_1C1EAE1A8()
{
  return MEMORY[0x1F4120A98]();
}

uint64_t sub_1C1EAE1B8()
{
  return MEMORY[0x1F4120AA0]();
}

uint64_t sub_1C1EAE1C8()
{
  return MEMORY[0x1F4120AA8]();
}

uint64_t sub_1C1EAE1D8()
{
  return MEMORY[0x1F4120AB8]();
}

uint64_t sub_1C1EAE1E8()
{
  return MEMORY[0x1F4120AC0]();
}

uint64_t sub_1C1EAE1F8()
{
  return MEMORY[0x1F4120AC8]();
}

uint64_t sub_1C1EAE208()
{
  return MEMORY[0x1F4120AD0]();
}

uint64_t sub_1C1EAE218()
{
  return MEMORY[0x1F4120AD8]();
}

uint64_t sub_1C1EAE228()
{
  return MEMORY[0x1F4120AE0]();
}

uint64_t sub_1C1EAE238()
{
  return MEMORY[0x1F4120B08]();
}

uint64_t sub_1C1EAE248()
{
  return MEMORY[0x1F4120B20]();
}

uint64_t sub_1C1EAE258()
{
  return MEMORY[0x1F4120B28]();
}

uint64_t sub_1C1EAE268()
{
  return MEMORY[0x1F4120B38]();
}

uint64_t sub_1C1EAE278()
{
  return MEMORY[0x1F4120B40]();
}

uint64_t sub_1C1EAE288()
{
  return MEMORY[0x1F4120B80]();
}

uint64_t sub_1C1EAE298()
{
  return MEMORY[0x1F4120B88]();
}

uint64_t sub_1C1EAE2A8()
{
  return MEMORY[0x1F4120B90]();
}

uint64_t sub_1C1EAE2B8()
{
  return MEMORY[0x1F4120B98]();
}

uint64_t sub_1C1EAE2C8()
{
  return MEMORY[0x1F4120BA0]();
}

uint64_t sub_1C1EAE2D8()
{
  return MEMORY[0x1F4120BA8]();
}

uint64_t sub_1C1EAE2E8()
{
  return MEMORY[0x1F4120BB0]();
}

uint64_t sub_1C1EAE2F8()
{
  return MEMORY[0x1F4120BB8]();
}

uint64_t sub_1C1EAE308()
{
  return MEMORY[0x1F4120BC0]();
}

uint64_t sub_1C1EAE318()
{
  return MEMORY[0x1F4120BC8]();
}

uint64_t sub_1C1EAE328()
{
  return MEMORY[0x1F4120BD0]();
}

uint64_t sub_1C1EAE338()
{
  return MEMORY[0x1F4120BD8]();
}

uint64_t sub_1C1EAE348()
{
  return MEMORY[0x1F4120BE0]();
}

uint64_t sub_1C1EAE358()
{
  return MEMORY[0x1F4120BE8]();
}

uint64_t sub_1C1EAE368()
{
  return MEMORY[0x1F411D880]();
}

uint64_t sub_1C1EAE378()
{
  return MEMORY[0x1F411D888]();
}

uint64_t sub_1C1EAE388()
{
  return MEMORY[0x1F411D898]();
}

uint64_t sub_1C1EAE398()
{
  return MEMORY[0x1F411D8A0]();
}

uint64_t sub_1C1EAE3A8()
{
  return MEMORY[0x1F411D9B0]();
}

uint64_t sub_1C1EAE3B8()
{
  return MEMORY[0x1F411D9D0]();
}

uint64_t sub_1C1EAE3C8()
{
  return MEMORY[0x1F411D9D8]();
}

uint64_t sub_1C1EAE3D8()
{
  return MEMORY[0x1F411D9E0]();
}

uint64_t sub_1C1EAE3E8()
{
  return MEMORY[0x1F411D9E8]();
}

uint64_t sub_1C1EAE3F8()
{
  return MEMORY[0x1F411DA28]();
}

uint64_t sub_1C1EAE408()
{
  return MEMORY[0x1F411DB90]();
}

uint64_t sub_1C1EAE418()
{
  return MEMORY[0x1F411DB98]();
}

uint64_t sub_1C1EAE428()
{
  return MEMORY[0x1F411DBA8]();
}

uint64_t sub_1C1EAE438()
{
  return MEMORY[0x1F411DCB0]();
}

uint64_t sub_1C1EAE448()
{
  return MEMORY[0x1F411DCB8]();
}

uint64_t sub_1C1EAE458()
{
  return MEMORY[0x1F411F030]();
}

uint64_t sub_1C1EAE468()
{
  return MEMORY[0x1F411F088]();
}

uint64_t sub_1C1EAE478()
{
  return MEMORY[0x1F411F098]();
}

uint64_t sub_1C1EAE488()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1C1EAE498()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1C1EAE4A8()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_1C1EAE4B8()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1C1EAE4C8()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C1EAE4D8()
{
  return MEMORY[0x1F4188588]();
}

uint64_t sub_1C1EAE4E8()
{
  return MEMORY[0x1F4120BF0]();
}

uint64_t sub_1C1EAE4F8()
{
  return MEMORY[0x1F4120BF8]();
}

uint64_t sub_1C1EAE508()
{
  return MEMORY[0x1F4120C20]();
}

uint64_t sub_1C1EAE518()
{
  return MEMORY[0x1F4120C50]();
}

uint64_t sub_1C1EAE528()
{
  return MEMORY[0x1F4120C58]();
}

uint64_t sub_1C1EAE538()
{
  return MEMORY[0x1F4120C68]();
}

uint64_t sub_1C1EAE548()
{
  return MEMORY[0x1F4120C80]();
}

uint64_t sub_1C1EAE558()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C1EAE568()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C1EAE578()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1C1EAE588()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1C1EAE598()
{
  return MEMORY[0x1F40D6670]();
}

uint64_t sub_1C1EAE5A8()
{
  return MEMORY[0x1F40D6688]();
}

uint64_t sub_1C1EAE5B8()
{
  return MEMORY[0x1F40D6698]();
}

uint64_t sub_1C1EAE5C8()
{
  return MEMORY[0x1F40D66B0]();
}

uint64_t sub_1C1EAE5D8()
{
  return MEMORY[0x1F4120C90]();
}

uint64_t sub_1C1EAE5E8()
{
  return MEMORY[0x1F4120C98]();
}

uint64_t sub_1C1EAE5F8()
{
  return MEMORY[0x1F4120CA0]();
}

uint64_t sub_1C1EAE608()
{
  return MEMORY[0x1F40D66C8]();
}

uint64_t sub_1C1EAE618()
{
  return MEMORY[0x1F40D66D8]();
}

uint64_t sub_1C1EAE628()
{
  return MEMORY[0x1F411DEC0]();
}

uint64_t sub_1C1EAE638()
{
  return MEMORY[0x1F411DEC8]();
}

uint64_t sub_1C1EAE648()
{
  return MEMORY[0x1F411DED0]();
}

uint64_t sub_1C1EAE658()
{
  return MEMORY[0x1F40D6708]();
}

uint64_t sub_1C1EAE668()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1C1EAE678()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1C1EAE688()
{
  return MEMORY[0x1F40D6778]();
}

uint64_t sub_1C1EAE698()
{
  return MEMORY[0x1F40D6788]();
}

uint64_t sub_1C1EAE6A8()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1C1EAE6B8()
{
  return MEMORY[0x1F40D67C0]();
}

uint64_t sub_1C1EAE6C8()
{
  return MEMORY[0x1F40D67F8]();
}

uint64_t sub_1C1EAE6D8()
{
  return MEMORY[0x1F40D6800]();
}

uint64_t sub_1C1EAE6E8()
{
  return MEMORY[0x1F40D6818]();
}

uint64_t sub_1C1EAE6F8()
{
  return MEMORY[0x1F40D6820]();
}

uint64_t sub_1C1EAE708()
{
  return MEMORY[0x1F40D6828]();
}

uint64_t sub_1C1EAE718()
{
  return MEMORY[0x1F40D6850]();
}

uint64_t sub_1C1EAE728()
{
  return MEMORY[0x1F40D6858]();
}

uint64_t sub_1C1EAE738()
{
  return MEMORY[0x1F40D6878]();
}

uint64_t sub_1C1EAE748()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t sub_1C1EAE758()
{
  return MEMORY[0x1F40D6890]();
}

uint64_t sub_1C1EAE768()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1C1EAE778()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1C1EAE788()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1C1EAE798()
{
  return MEMORY[0x1F40D68E0]();
}

uint64_t sub_1C1EAE7A8()
{
  return MEMORY[0x1F40D68F8]();
}

uint64_t sub_1C1EAE7B8()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t sub_1C1EAE7C8()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1C1EAE7D8()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1C1EAE7E8()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1C1EAE7F8()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1C1EAE808()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1C1EAE818()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1C1EAE828()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1C1EAE838()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1C1EAE848()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1C1EAE858()
{
  return MEMORY[0x1F40D6A70]();
}

uint64_t sub_1C1EAE868()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1C1EAE878()
{
  return MEMORY[0x1F40D6AD8]();
}

uint64_t sub_1C1EAE888()
{
  return MEMORY[0x1F40D6AF0]();
}

uint64_t sub_1C1EAE898()
{
  return MEMORY[0x1F40D6B08]();
}

uint64_t sub_1C1EAE8A8()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1C1EAE8B8()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1C1EAE8C8()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1C1EAE8D8()
{
  return MEMORY[0x1F40D6B28]();
}

uint64_t sub_1C1EAE8E8()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1C1EAE8F8()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1C1EAE908()
{
  return MEMORY[0x1F4120CB8]();
}

uint64_t sub_1C1EAE918()
{
  return MEMORY[0x1F4120CC0]();
}

uint64_t sub_1C1EAE928()
{
  return MEMORY[0x1F4120CD0]();
}

uint64_t sub_1C1EAE938()
{
  return MEMORY[0x1F4120CD8]();
}

uint64_t sub_1C1EAE948()
{
  return MEMORY[0x1F4120CE0]();
}

uint64_t sub_1C1EAE958()
{
  return MEMORY[0x1F4120CE8]();
}

uint64_t sub_1C1EAE968()
{
  return MEMORY[0x1F4120CF0]();
}

uint64_t sub_1C1EAE978()
{
  return MEMORY[0x1F4120CF8]();
}

uint64_t sub_1C1EAE988()
{
  return MEMORY[0x1F4120D00]();
}

uint64_t sub_1C1EAE998()
{
  return MEMORY[0x1F4120D08]();
}

uint64_t sub_1C1EAE9A8()
{
  return MEMORY[0x1F4120D10]();
}

uint64_t sub_1C1EAE9B8()
{
  return MEMORY[0x1F4120D18]();
}

uint64_t sub_1C1EAE9C8()
{
  return MEMORY[0x1F4120D20]();
}

uint64_t sub_1C1EAE9D8()
{
  return MEMORY[0x1F4120D28]();
}

uint64_t sub_1C1EAE9E8()
{
  return MEMORY[0x1F411DEE0]();
}

uint64_t sub_1C1EAE9F8()
{
  return MEMORY[0x1F411DEE8]();
}

uint64_t sub_1C1EAEA08()
{
  return MEMORY[0x1F411DEF0]();
}

uint64_t sub_1C1EAEA18()
{
  return MEMORY[0x1F411DEF8]();
}

uint64_t sub_1C1EAEA28()
{
  return MEMORY[0x1F40D6BD0]();
}

uint64_t sub_1C1EAEA38()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C1EAEA48()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1C1EAEA58()
{
  return MEMORY[0x1F40D6BE8]();
}

uint64_t sub_1C1EAEA68()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1C1EAEA78()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1C1EAEA88()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1C1EAEA98()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1C1EAEAA8()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1C1EAEAB8()
{
  return MEMORY[0x1F40D6D40]();
}

uint64_t sub_1C1EAEAC8()
{
  return MEMORY[0x1F40D6D48]();
}

uint64_t sub_1C1EAEAD8()
{
  return MEMORY[0x1F40D6D60]();
}

uint64_t sub_1C1EAEAE8()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1C1EAEAF8()
{
  return MEMORY[0x1F40D6D88]();
}

uint64_t sub_1C1EAEB08()
{
  return MEMORY[0x1F40D6D98]();
}

uint64_t sub_1C1EAEB18()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1C1EAEB28()
{
  return MEMORY[0x1F40D6DD0]();
}

uint64_t sub_1C1EAEB38()
{
  return MEMORY[0x1F40D6E08]();
}

uint64_t sub_1C1EAEB48()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C1EAEB58()
{
  return MEMORY[0x1F40D6E38]();
}

uint64_t sub_1C1EAEB68()
{
  return MEMORY[0x1F40D6E40]();
}

uint64_t sub_1C1EAEB78()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C1EAEB88()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C1EAEB98()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C1EAEBA8()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C1EAEBB8()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1C1EAEBC8()
{
  return MEMORY[0x1F4186D48]();
}

uint64_t sub_1C1EAEBD8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C1EAEBE8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C1EAEBF8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C1EAEC08()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1C1EAEC18()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1C1EAEC28()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C1EAEC38()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C1EAEC48()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C1EAEC58()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C1EAEC68()
{
  return MEMORY[0x1F4183360]();
}

uint64_t sub_1C1EAEC78()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1C1EAEC88()
{
  return MEMORY[0x1F41833E8]();
}

uint64_t sub_1C1EAEC98()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C1EAECA8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1C1EAECB8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C1EAECC8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C1EAECD8()
{
  return MEMORY[0x1F4188420]();
}

uint64_t sub_1C1EAECE8()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C1EAECF8()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1C1EAED08()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1C1EAED18()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C1EAED28()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C1EAED38()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C1EAED48()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C1EAED58()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C1EAED68()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C1EAED78()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C1EAED88()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C1EAED98()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C1EAEDA8()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1C1EAEDB8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C1EAEDC8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C1EAEDD8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C1EAEDE8()
{
  return MEMORY[0x1F4120D40]();
}

uint64_t sub_1C1EAEDF8()
{
  return MEMORY[0x1F40D6E68]();
}

uint64_t sub_1C1EAEE08()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1C1EAEE18()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1C1EAEE28()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1C1EAEE38()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1C1EAEE48()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C1EAEE58()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1C1EAEE68()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1C1EAEE78()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C1EAEE88()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C1EAEE98()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C1EAEEA8()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C1EAEEB8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C1EAEEC8()
{
  return MEMORY[0x1F4120D48]();
}

uint64_t sub_1C1EAEED8()
{
  return MEMORY[0x1F4120D50]();
}

uint64_t sub_1C1EAEEE8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C1EAEEF8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C1EAEF08()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C1EAEF18()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C1EAEF28()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C1EAEF38()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C1EAEF48()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C1EAEF58()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C1EAEF68()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C1EAEF78()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1C1EAEF88()
{
  return MEMORY[0x1F4184180]();
}

uint64_t sub_1C1EAEF98()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C1EAEFA8()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1C1EAEFB8()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C1EAEFC8()
{
  return MEMORY[0x1F4120D60]();
}

uint64_t sub_1C1EAEFD8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C1EAEFE8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C1EAEFF8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C1EAF008()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1C1EAF018()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1C1EAF028()
{
  return MEMORY[0x1F40E65D0]();
}

uint64_t sub_1C1EAF038()
{
  return MEMORY[0x1F4120D68]();
}

uint64_t sub_1C1EAF048()
{
  return MEMORY[0x1F4120D70]();
}

uint64_t sub_1C1EAF058()
{
  return MEMORY[0x1F4120D78]();
}

uint64_t sub_1C1EAF068()
{
  return MEMORY[0x1F411F1F0]();
}

uint64_t sub_1C1EAF078()
{
  return MEMORY[0x1F411F218]();
}

uint64_t sub_1C1EAF088()
{
  return MEMORY[0x1F411DF50]();
}

uint64_t sub_1C1EAF098()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C1EAF0A8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C1EAF0B8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C1EAF0C8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C1EAF0D8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C1EAF0E8()
{
  return MEMORY[0x1F411DF60]();
}

uint64_t sub_1C1EAF0F8()
{
  return MEMORY[0x1F411DFA8]();
}

uint64_t sub_1C1EAF108()
{
  return MEMORY[0x1F4120D80]();
}

uint64_t sub_1C1EAF118()
{
  return MEMORY[0x1F4120DA8]();
}

uint64_t sub_1C1EAF128()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1C1EAF138()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1C1EAF148()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C1EAF158()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1C1EAF168()
{
  return MEMORY[0x1F4187078]();
}

uint64_t sub_1C1EAF178()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1C1EAF188()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C1EAF198()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C1EAF1A8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C1EAF1B8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1C1EAF1C8()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1C1EAF1D8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1C1EAF1E8()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1C1EAF1F8()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1C1EAF208()
{
  return MEMORY[0x1F411E028]();
}

uint64_t sub_1C1EAF218()
{
  return MEMORY[0x1F4120DC0]();
}

uint64_t sub_1C1EAF228()
{
  return MEMORY[0x1F4120DC8]();
}

uint64_t sub_1C1EAF238()
{
  return MEMORY[0x1F4120DD0]();
}

uint64_t sub_1C1EAF248()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1C1EAF258()
{
  return MEMORY[0x1F411E050]();
}

uint64_t sub_1C1EAF268()
{
  return MEMORY[0x1F411E060]();
}

uint64_t sub_1C1EAF278()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C1EAF288()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C1EAF298()
{
  return MEMORY[0x1F4120DE0]();
}

uint64_t sub_1C1EAF2A8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C1EAF2B8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1C1EAF2C8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C1EAF2D8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C1EAF2E8()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C1EAF2F8()
{
  return MEMORY[0x1F40E6D40]();
}

uint64_t sub_1C1EAF308()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1C1EAF318()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C1EAF328()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C1EAF338()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C1EAF348()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C1EAF358()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1C1EAF368()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C1EAF378()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1C1EAF388()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1C1EAF398()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1C1EAF3A8()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1C1EAF3B8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C1EAF3C8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C1EAF3D8()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1C1EAF3E8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C1EAF3F8()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C1EAF408()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1C1EAF418()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1C1EAF428()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C1EAF438()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C1EAF448()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C1EAF458()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C1EAF468()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C1EAF478()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C1EAF488()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C1EAF498()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1C1EAF4A8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C1EAF4B8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C1EAF4C8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1C1EAF4D8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C1EAF4E8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C1EAF4F8()
{
  return MEMORY[0x1F4184DA0]();
}

uint64_t sub_1C1EAF508()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C1EAF518()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C1EAF528()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C1EAF538()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C1EAF548()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C1EAF558()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C1EAF568()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C1EAF578()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C1EAF588()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C1EAF598()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C1EAF5A8()
{
  return MEMORY[0x1F4184FB8]();
}

uint64_t sub_1C1EAF5B8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C1EAF5C8()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1C1EAF5D8()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1C1EAF5E8()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1C1EAF5F8()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1C1EAF608()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1C1EAF618()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C1EAF628()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C1EAF638()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C1EAF648()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1C1EAF658()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C1EAF668()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C1EAF678()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1C1EAF688()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C1EAF698()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1C1EAF6A8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C1EAF6B8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C1EAF6C8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1C1EAF6D8()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1C1EAF6E8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C1EAF6F8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C1EAF708()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C1EAF718()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C1EAF728()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C1EAF738()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C1EAF748()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1C1EAF758()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C1EAF768()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C1EAF778()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C1EAF788()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1C1EAF798()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C1EAF7A8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C1EAF7B8()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C1EAF7C8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C1EAF7D8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C1EAF7E8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C1EAF7F8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C1EAF808()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C1EAF818()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C1EAF828()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C1EAF838()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C1EAF848()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C1EAF858()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C1EAF868()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1C1EAF878()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1C1EAF888()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1C1EAF898()
{
  return MEMORY[0x1F411F360]();
}

uint64_t sub_1C1EAF8A8()
{
  return MEMORY[0x1F40D6E78]();
}

uint64_t sub_1C1EAF8B8()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1C1EAF8C8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C1EAF8D8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C1EAF908()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t HKDisplayCategoryIdentifierFromString()
{
  return MEMORY[0x1F4121540]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1F40E7D50]();
}

uint64_t REPercentThroughRange()
{
  return MEMORY[0x1F4148028]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x1F40E81D0]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x1F40E81D8]();
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t health_dispatch_workloop_create()
{
  return MEMORY[0x1F411E0C0]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x1F4186720]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}