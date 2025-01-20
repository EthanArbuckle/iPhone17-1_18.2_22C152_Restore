uint64_t static HMCDModel.fetch(withModelID:in:)()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v0 = sub_236DB9830();
  MEMORY[0x270FA5388](v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688D3DA0);
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entityName);
  sub_236DB9A10();

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = sub_236DB6828();
  sub_236D291DC(0, (unint64_t *)&qword_2688D2C00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688D3DA8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_236DBE190;
  v5 = sub_236DB97F0();
  *(void *)(v4 + 56) = sub_236D291DC(0, &qword_2688D3DB0);
  *(void *)(v4 + 64) = sub_236DB63B8();
  *(void *)(v4 + 32) = v5;
  v6 = (void *)sub_236DB9F20();
  objc_msgSend(v3, sel_setPredicate_, v6);

  objc_msgSend(v3, sel_setFetchBatchSize_, 1);
  sub_236DB9FF0();
  sub_236DB9C10();
  swift_getWitnessTable();
  sub_236DB9ED0();
  swift_bridgeObjectRelease();

  return v8;
}

unint64_t sub_236DB63B8()
{
  unint64_t result = qword_2688D3DB8;
  if (!qword_2688D3DB8)
  {
    sub_236D291DC(255, &qword_2688D3DB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688D3DB8);
  }
  return result;
}

uint64_t static HMCDModel.fetch(in:)()
{
  id v0 = static HMCDModel.fetchRequest()();
  uint64_t v1 = sub_236DB9FF0();

  return v1;
}

void HMCDModel.updateProperty<A>(at:newValue:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*MEMORY[0x263F8E100] + *a1 + 8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  v7 = (char *)&v11 - v6;
  id v12 = v2;
  id v8 = v2;
  swift_getAtKeyPath();

  char v9 = sub_236DB99F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v9 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    id v12 = v8;
    id v10 = v8;
    swift_setAtReferenceWritableKeyPath();
  }
}

id sub_236DB6828()
{
  uint64_t v1 = (void *)sub_236DB9A00();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_236DB6880(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_236DB6954(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_236D1900C((uint64_t)v12, *a3);
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
      sub_236D1900C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_236DB6954(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_236DBA0C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_236DB6B10(a5, a6);
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
  uint64_t v8 = sub_236DBA310();
  if (!v8)
  {
    sub_236DBA440();
    __break(1u);
LABEL_17:
    uint64_t result = sub_236DBA4A0();
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

uint64_t sub_236DB6B10(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_236DB6BA8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_236DB6D88(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_236DB6D88(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_236DB6BA8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_236DB6D20(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_236DBA270();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_236DBA440();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_236DB9A80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_236DBA4A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_236DBA440();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_236DB6D20(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688D3DC0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_236DB6D88(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688D3DC0);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_236DBA4A0();
  __break(1u);
  return result;
}

unint64_t sub_236DB6ED8()
{
  unint64_t result = qword_2688D1900;
  if (!qword_2688D1900)
  {
    sub_236DB9830();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688D1900);
  }
  return result;
}

uint64_t dispatch thunk of HMCDModel.modelID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HMCDModel.modelID.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of HMCDModel.modelID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of static HMCDModel.entityName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_236DB6F80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void))
{
  v15 = a5;
  v12[0] = a1;
  v12[1] = a2;
  v12[2] = a4;
  char v13 = 1;
  uint64_t v14 = 0;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  int64_t v8 = *(void (**)(void *, uint64_t, uint64_t))(AssociatedConformanceWitness + 32);
  id v9 = a4;
  swift_bridgeObjectRetain();
  uint64_t v10 = swift_checkMetadataState();
  v8(v12, v10, AssociatedConformanceWitness);
  if (v5)
  {
  }
  else
  {
    v15();

    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_236DB7160(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_236DB9960();
  uint64_t v7 = a1;
  uint64_t v21 = v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    v17 = a3;
    uint64_t v9 = v7;
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    size_t v11 = *(void (**)(void *, uint64_t, uint64_t))(AssociatedConformanceWitness + 32);
    swift_bridgeObjectRetain();
    uint64_t v12 = (uint64_t *)(v9 + 40);
    while (1)
    {
      uint64_t v13 = *v12;
      v18[0] = *(v12 - 1);
      v18[1] = v13;
      v18[2] = 0;
      char v19 = 1;
      uint64_t v20 = 0;
      swift_bridgeObjectRetain();
      uint64_t v14 = swift_checkMetadataState();
      v11(v18, v14, AssociatedConformanceWitness);
      if (v3) {
        break;
      }
      v12 += 2;
      sub_236DB9BB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        uint64_t v15 = v21;
        a3 = v17;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = v6;
LABEL_7:
    a3(v15);
  }
  return swift_bridgeObjectRelease();
}

unsigned char *storeEnumTagSinglePayload for CoreDataDataSourceError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x236DB746CLL);
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

ValueMetadata *type metadata accessor for CoreDataDataSourceError()
{
  return &type metadata for CoreDataDataSourceError;
}

unint64_t sub_236DB74A8()
{
  unint64_t result = qword_2688D3DC8[0];
  if (!qword_2688D3DC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2688D3DC8);
  }
  return result;
}

uint64_t sub_236DB74FC(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a5;
  uint64_t v30 = a8;
  uint64_t v10 = v9;
  v38 = a1;
  uint64_t v39 = a2;
  uint64_t v28 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  v40 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v36 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v26 - v14;
  MEMORY[0x270FA5388](v13);
  v33 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v31 = *(void *)(v17 - 8);
  uint64_t v32 = v17;
  MEMORY[0x270FA5388](v17);
  char v19 = (char *)&v26 - v18;
  uint64_t v34 = v8;
  uint64_t v20 = sub_236DB9EB0();
  if (!v20) {
    return sub_236DB9B90();
  }
  uint64_t v21 = v20;
  v27 = v15;
  uint64_t v43 = sub_236DB9960();
  uint64_t v35 = sub_236DBA3C0();
  sub_236DBA360();
  v41 = v19;
  uint64_t result = sub_236DB9EA0();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    v23 = (void (**)(char *))(v36 + 2);
    ++v36;
    v37 = v23;
    v24 = v27;
    while (1)
    {
      v25 = (void (*)(char *, void))sub_236DB9EF0();
      (*v37)(v24);
      v25(v42, 0);
      v38(v24, v40);
      if (v10) {
        break;
      }
      uint64_t v10 = 0;
      (*v36)(v24, AssociatedTypeWitness);
      sub_236DBA3A0();
      sub_236DB9EC0();
      if (!--v21)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
        return v43;
      }
    }
    (*v36)(v24, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(v30, v40, v29);
  }
  return result;
}

uint64_t RelationshipResolver.model<A>(at:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v27 = a4;
  uint64_t v8 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = *(void *)(v8 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v10);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v27 - v18;
  swift_getAtKeyPath();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v20 = *(void *)(a2 + 24);
    uint64_t v28 = *(void *)(a2 + 16);
    uint64_t v29 = v13;
    uint64_t v30 = v20;
    uint64_t v31 = a3;
    uint64_t v21 = type metadata accessor for RelationshipResolver.ModelProxy();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v27, 1, 1, v21);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    sub_236D1B32C(v5 + *(int *)(a2 + 36), (uint64_t)&v28);
    uint64_t v24 = *(void *)(a2 + 16);
    uint64_t v23 = *(void *)(a2 + 24);
    uint64_t v25 = v27;
    sub_236DA948C((uint64_t)v17, &v28, v24, v13, v23, a3, v27);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    uint64_t v28 = v24;
    uint64_t v29 = v13;
    uint64_t v30 = v23;
    uint64_t v31 = a3;
    uint64_t v26 = type metadata accessor for RelationshipResolver.ModelProxy();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
  }
}

uint64_t RelationshipResolver.models<A>(at:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236DB8018(a1, a2, a3, (void (*)(char *, char *))sub_236DB7E38);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t WitnessTable;
  uint64_t v13;
  uint64_t v14;
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

  uint64_t v4 = v3;
  uint64_t v7 = *a1;
  uint64_t v8 = swift_getAtKeyPath();
  if (!v22) {
    return 0;
  }
  uint64_t v26 = v22;
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v17 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(*(void *)(*MEMORY[0x263F8EA20] + v7 + 8) + 16);
  uint64_t v18 = *(void *)(v10 + 16);
  char v19 = v9;
  uint64_t v20 = a3;
  uint64_t v21 = v4;
  v22 = v17;
  uint64_t v23 = v18;
  uint64_t v24 = v9;
  uint64_t v25 = a3;
  uint64_t v11 = type metadata accessor for RelationshipResolver.ModelProxy();
  WitnessTable = swift_getWitnessTable();
  uint64_t v14 = sub_236DB74FC((void (*)(char *, char *))sub_236DB7E38, (uint64_t)&v16, v10, v11, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v13);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_236DB7D74@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = a4 + *(int *)(type metadata accessor for RelationshipResolver() + 36);
  return sub_236D1B1E4(a2, v6);
}

uint64_t RelationshipResolver.model.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_236DB7E38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236DB7E50(a1, a2);
}

uint64_t sub_236DB7E50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236DB8134(a1, v2[6], v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t _s11HomeKitCore20RelationshipResolverV5model2atAC10ModelProxyVyx_qd__Gs7KeyPathCyxqd__G_tAA0H10DescriptorRd__lF_0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v9 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v18[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18[-1] - v14;
  swift_getAtKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  sub_236D1B32C(v5 + *(int *)(a2 + 36), (uint64_t)v18);
  sub_236DA948C((uint64_t)v13, v18, *(void *)(a2 + 16), v9, *(void *)(a2 + 24), a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t RelationshipResolver.subscript.getter(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236DB8018(a1, a2, a3, (void (*)(char *, char *))sub_236DB7E38);
}

uint64_t sub_236DB8018(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(char *, char *))
{
  uint64_t v8 = *a1;
  swift_getAtKeyPath();
  uint64_t v26 = v22;
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v17 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(*MEMORY[0x263F8EA20] + v8 + 8);
  uint64_t v18 = *(void *)(v10 + 16);
  uint64_t v19 = v9;
  uint64_t v20 = a3;
  uint64_t v21 = v4;
  uint64_t v22 = v17;
  uint64_t v23 = v18;
  uint64_t v24 = v9;
  uint64_t v25 = a3;
  uint64_t v11 = type metadata accessor for RelationshipResolver.ModelProxy();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = sub_236DB74FC(a4, (uint64_t)&v16, v10, v11, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v13);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_236DB8134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v19[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  uint64_t v16 = type metadata accessor for RelationshipResolver();
  sub_236D1B32C(a2 + *(int *)(v16 + 36), (uint64_t)v19);
  return sub_236DA948C((uint64_t)v14, v19, a3, a4, a5, a6, a7);
}

uint64_t sub_236DB8258()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236DB82F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_236DB842C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  return __swift_destroy_boxed_opaque_existential_0(v4);
}

uint64_t sub_236DB8498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v8 + 24);
  *(void *)(v7 + 24) = v9;
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  (**(void (***)(void))(v9 - 8))();
  return a1;
}

uint64_t sub_236DB8558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8), (uint64_t *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8));
  return a1;
}

uint64_t sub_236DB85D0(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_236DB8654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_0(v7);
  long long v9 = *(_OWORD *)v8;
  long long v10 = *(_OWORD *)(v8 + 16);
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  *(_OWORD *)unint64_t v7 = v9;
  *(_OWORD *)(v7 + 16) = v10;
  return a1;
}

uint64_t sub_236DB86E0(_DWORD *a1, unsigned int a2, uint64_t a3)
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
        JUMPOUT(0x236DB882CLL);
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

double sub_236DB8840(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x236DB8A2CLL);
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

uint64_t type metadata accessor for RelationshipResolver()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236DB8A6C(uint64_t a1)
{
  uint64_t result = sub_236DB9830();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_236DB8B10(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = sub_236DB9830();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_236DB8BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236DB9830();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_236DB8C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_236DB9830();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, a2, a3, v6);
}

uint64_t type metadata accessor for RelationshipResolver.Error()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for HomesStore.CoreData()
{
  return &type metadata for HomesStore.CoreData;
}

uint64_t ModelRelationshipDescriptor.predicate(for:)()
{
  sub_236D291DC(0, (unint64_t *)&qword_2688D2C00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688D3DA8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_236DBE190;
  uint64_t v1 = sub_236DB97F0();
  *(void *)(v0 + 56) = sub_236D291DC(0, &qword_2688D3DB0);
  *(void *)(v0 + 64) = sub_236DB63B8();
  *(void *)(v0 + 32) = v1;
  return sub_236DB9F20();
}

uint64_t PartialModelRelationshipDescriptor.deinit()
{
  return v0;
}

uint64_t PartialModelRelationshipDescriptor.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_236DB8DA8()
{
  return swift_bridgeObjectRelease();
}

uint64_t ModelRelationshipDescriptor.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ModelRelationshipDescriptor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for PartialModelRelationshipDescriptor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PartialModelRelationshipDescriptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PartialModelRelationshipDescriptor);
}

uint64_t sub_236DB8E38()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ModelRelationshipDescriptor()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for ModelRelationshipDescriptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ModelRelationshipDescriptor);
}

uint64_t sub_236DB8EAC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_236DB8F3C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_236DB9098(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x236DB92B0);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        int v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for UncheckedSendable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236DB92F0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_236DB9300()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_236DB9310()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_236DB9320()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_236DB9330()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_236DB9340()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_236DB9350()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_236DB9360()
{
  return MEMORY[0x270EEEEC8]();
}

uint64_t sub_236DB9370()
{
  return MEMORY[0x270EEEED0]();
}

uint64_t sub_236DB9380()
{
  return MEMORY[0x270EEF218]();
}

uint64_t sub_236DB9390()
{
  return MEMORY[0x270EEF478]();
}

uint64_t sub_236DB93A0()
{
  return MEMORY[0x270EEF480]();
}

uint64_t sub_236DB93B0()
{
  return MEMORY[0x270EEF488]();
}

uint64_t sub_236DB93C0()
{
  return MEMORY[0x270EEF490]();
}

uint64_t sub_236DB93D0()
{
  return MEMORY[0x270EEF498]();
}

uint64_t sub_236DB93E0()
{
  return MEMORY[0x270EEF4A0]();
}

uint64_t sub_236DB93F0()
{
  return MEMORY[0x270EEF4B0]();
}

uint64_t sub_236DB9400()
{
  return MEMORY[0x270EEF4B8]();
}

uint64_t sub_236DB9410()
{
  return MEMORY[0x270EEF4C0]();
}

uint64_t sub_236DB9420()
{
  return MEMORY[0x270EEF4C8]();
}

uint64_t sub_236DB9430()
{
  return MEMORY[0x270EEF4D0]();
}

uint64_t sub_236DB9440()
{
  return MEMORY[0x270EEF4D8]();
}

uint64_t sub_236DB9450()
{
  return MEMORY[0x270EEF4E0]();
}

uint64_t sub_236DB9460()
{
  return MEMORY[0x270EEF4E8]();
}

uint64_t sub_236DB9470()
{
  return MEMORY[0x270EEF4F0]();
}

uint64_t sub_236DB9480()
{
  return MEMORY[0x270EEF508]();
}

uint64_t sub_236DB9490()
{
  return MEMORY[0x270EEF510]();
}

uint64_t sub_236DB94A0()
{
  return MEMORY[0x270EEF530]();
}

uint64_t sub_236DB94B0()
{
  return MEMORY[0x270EEF538]();
}

uint64_t sub_236DB94C0()
{
  return MEMORY[0x270EEF588]();
}

uint64_t sub_236DB94D0()
{
  return MEMORY[0x270EEF590]();
}

uint64_t sub_236DB94E0()
{
  return MEMORY[0x270EEF598]();
}

uint64_t sub_236DB94F0()
{
  return MEMORY[0x270EEF5B0]();
}

uint64_t sub_236DB9500()
{
  return MEMORY[0x270EEF5B8]();
}

uint64_t sub_236DB9510()
{
  return MEMORY[0x270EEF5F8]();
}

uint64_t sub_236DB9520()
{
  return MEMORY[0x270EEF600]();
}

uint64_t sub_236DB9530()
{
  return MEMORY[0x270EEF618]();
}

uint64_t sub_236DB9540()
{
  return MEMORY[0x270EEF620]();
}

uint64_t sub_236DB9550()
{
  return MEMORY[0x270EEF628]();
}

uint64_t sub_236DB9560()
{
  return MEMORY[0x270EEF630]();
}

uint64_t sub_236DB9570()
{
  return MEMORY[0x270EEF638]();
}

uint64_t sub_236DB9580()
{
  return MEMORY[0x270EEF640]();
}

uint64_t sub_236DB9590()
{
  return MEMORY[0x270EEF648]();
}

uint64_t sub_236DB95A0()
{
  return MEMORY[0x270EEF650]();
}

uint64_t sub_236DB95B0()
{
  return MEMORY[0x270EEF658]();
}

uint64_t sub_236DB95C0()
{
  return MEMORY[0x270EEF660]();
}

uint64_t sub_236DB95D0()
{
  return MEMORY[0x270EEF668]();
}

uint64_t sub_236DB95E0()
{
  return MEMORY[0x270EEF670]();
}

uint64_t sub_236DB95F0()
{
  return MEMORY[0x270EEF678]();
}

uint64_t sub_236DB9600()
{
  return MEMORY[0x270EEF680]();
}

uint64_t sub_236DB9610()
{
  return MEMORY[0x270EEF690]();
}

uint64_t sub_236DB9620()
{
  return MEMORY[0x270EEF698]();
}

uint64_t sub_236DB9630()
{
  return MEMORY[0x270EEF6A8]();
}

uint64_t sub_236DB9640()
{
  return MEMORY[0x270EEF6B0]();
}

uint64_t sub_236DB9650()
{
  return MEMORY[0x270EEF6B8]();
}

uint64_t sub_236DB9660()
{
  return MEMORY[0x270EEF6C8]();
}

uint64_t sub_236DB9670()
{
  return MEMORY[0x270EEF6D0]();
}

uint64_t sub_236DB9680()
{
  return MEMORY[0x270EEF6D8]();
}

uint64_t sub_236DB9690()
{
  return MEMORY[0x270EEF6E0]();
}

uint64_t sub_236DB96A0()
{
  return MEMORY[0x270EEF6E8]();
}

uint64_t sub_236DB96B0()
{
  return MEMORY[0x270EEF6F0]();
}

uint64_t sub_236DB96C0()
{
  return MEMORY[0x270EEF700]();
}

uint64_t sub_236DB96D0()
{
  return MEMORY[0x270EEF710]();
}

uint64_t sub_236DB96E0()
{
  return MEMORY[0x270EEF718]();
}

uint64_t sub_236DB96F0()
{
  return MEMORY[0x270EEF720]();
}

uint64_t sub_236DB9700()
{
  return MEMORY[0x270EEF728]();
}

uint64_t sub_236DB9710()
{
  return MEMORY[0x270EEF738]();
}

uint64_t sub_236DB9720()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_236DB9730()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_236DB9740()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_236DB9750()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_236DB9760()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_236DB9770()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_236DB9780()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_236DB9790()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_236DB97A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_236DB97B0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_236DB97C0()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_236DB97D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_236DB97E0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_236DB97F0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t _s11HomeKitCore25ModelIdentifierDescriptorV2eeoiySbACyxG_AEtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_236DB9810()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_236DB9820()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_236DB9830()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_236DB9840()
{
  return MEMORY[0x270EF1748]();
}

uint64_t sub_236DB9850()
{
  return MEMORY[0x270EF1758]();
}

uint64_t sub_236DB9860()
{
  return MEMORY[0x270EF1760]();
}

uint64_t sub_236DB9870()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_236DB9880()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_236DB9890()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_236DB98A0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_236DB98B0()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_236DB98C0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_236DB98D0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_236DB98E0()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_236DB98F0()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_236DB9900()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_236DB9910()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_236DB9920()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_236DB9930()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_236DB9940()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_236DB9950()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_236DB9960()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_236DB9970()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_236DB9980()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_236DB9990()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_236DB99A0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_236DB99B0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_236DB99C0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_236DB99D0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_236DB99E0()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_236DB99F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_236DB9A00()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_236DB9A10()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_236DB9A20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_236DB9A30()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_236DB9A40()
{
  return MEMORY[0x270F9D650]();
}

uint64_t sub_236DB9A50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_236DB9A60()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_236DB9A70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_236DB9A80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_236DB9A90()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_236DB9AA0()
{
  return MEMORY[0x270EF1B38]();
}

uint64_t sub_236DB9AB0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_236DB9AC0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_236DB9AD0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_236DB9AE0()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_236DB9AF0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_236DB9B00()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_236DB9B10()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_236DB9B20()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_236DB9B30()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_236DB9B40()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_236DB9B50()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_236DB9B60()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_236DB9B70()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_236DB9B80()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_236DB9B90()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_236DB9BA0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_236DB9BB0()
{
  return MEMORY[0x270F9DC38]();
}

uint64_t sub_236DB9BC0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_236DB9BD0()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_236DB9BE0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_236DB9BF0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_236DB9C00()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_236DB9C10()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_236DB9C20()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_236DB9C30()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_236DB9C40()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_236DB9C50()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_236DB9C80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_236DB9C90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_236DB9CA0()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_236DB9CB0()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_236DB9CC0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_236DB9CD0()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_236DB9CE0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_236DB9CF0()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_236DB9D00()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_236DB9D30()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_236DB9D40()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_236DB9D50()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_236DB9D60()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_236DB9D70()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_236DB9D80()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_236DB9D90()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_236DB9DA0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_236DB9DD0()
{
  return MEMORY[0x270FA2110]();
}

uint64_t sub_236DB9DE0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_236DB9DF0()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_236DB9E00()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_236DB9E10()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_236DB9E20()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_236DB9E30()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_236DB9E40()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_236DB9E50()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_236DB9E60()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_236DB9E70()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_236DB9E80()
{
  return MEMORY[0x270F9DFB8]();
}

uint64_t sub_236DB9E90()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_236DB9EA0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_236DB9EB0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_236DB9EC0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_236DB9ED0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_236DB9EE0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_236DB9EF0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_236DB9F00()
{
  return MEMORY[0x270F9E2F0]();
}

uint64_t sub_236DB9F10()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_236DB9F20()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_236DB9F30()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_236DB9F40()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_236DB9F50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_236DB9F60()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_236DB9F70()
{
  return MEMORY[0x270EF1F18]();
}

uint64_t sub_236DB9F80()
{
  return MEMORY[0x270EF1F90]();
}

uint64_t sub_236DB9F90()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_236DB9FA0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_236DB9FB0()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_236DB9FC0()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_236DB9FD0()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_236DB9FE0()
{
  return MEMORY[0x270EE4220]();
}

uint64_t sub_236DB9FF0()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_236DBA010()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_236DBA020()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_236DBA030()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_236DBA040()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_236DBA050()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_236DBA060()
{
  return MEMORY[0x270EF22F0]();
}

uint64_t sub_236DBA070()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_236DBA080()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_236DBA090()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_236DBA0A0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_236DBA0B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_236DBA0C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_236DBA0D0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_236DBA0E0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_236DBA0F0()
{
  return MEMORY[0x270F9E680]();
}

uint64_t sub_236DBA100()
{
  return MEMORY[0x270F9E6B0]();
}

uint64_t sub_236DBA120()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_236DBA130()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_236DBA140()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_236DBA150()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_236DBA160()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_236DBA170()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_236DBA180()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_236DBA190()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_236DBA1A0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_236DBA1B0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_236DBA1C0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_236DBA1D0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_236DBA1E0()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_236DBA1F0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_236DBA200()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_236DBA210()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_236DBA220()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_236DBA230()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_236DBA240()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_236DBA250()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_236DBA260()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_236DBA270()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_236DBA280()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_236DBA290()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_236DBA2A0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_236DBA2B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_236DBA2C0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_236DBA2D0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_236DBA2E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_236DBA2F0()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_236DBA300()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_236DBA310()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_236DBA320()
{
  return MEMORY[0x270F9EB50]();
}

uint64_t sub_236DBA330()
{
  return MEMORY[0x270F9EB78]();
}

uint64_t sub_236DBA340()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_236DBA350()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_236DBA360()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_236DBA370()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_236DBA380()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_236DBA390()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_236DBA3A0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_236DBA3B0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_236DBA3C0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_236DBA3D0()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_236DBA3E0()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_236DBA3F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_236DBA400()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t sub_236DBA410()
{
  return MEMORY[0x270F9EDB0]();
}

uint64_t sub_236DBA420()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_236DBA430()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_236DBA440()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_236DBA450()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_236DBA460()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_236DBA470()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_236DBA480()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_236DBA490()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_236DBA4A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_236DBA4B0()
{
  return MEMORY[0x270F9F0C8]();
}

uint64_t sub_236DBA4C0()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_236DBA4D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_236DBA4E0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_236DBA4F0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_236DBA500()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_236DBA510()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_236DBA520()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_236DBA530()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_236DBA540()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_236DBA550()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_236DBA560()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_236DBA570()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_236DBA580()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_236DBA590()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_236DBA5A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_236DBA5B0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_236DBA5C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_236DBA5E0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_236DBA5F0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_236DBA600()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_236DBA630()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_236DBA640()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_236DBA650()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_236DBA660()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_236DBA670()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_236DBA680()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_236DBA690()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_236DBA6A0()
{
  return MEMORY[0x270EF2690]();
}

uint64_t sub_236DBA6B0()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_236DBA6C0()
{
  return MEMORY[0x270EF26E0]();
}

uint64_t sub_236DBA6D0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_236DBA6E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_236DBA6F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_236DBA700()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_236DBA710()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_236DBA720()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_236DBA730()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_236DBA740()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_236DBA750()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_236DBA760()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_236DBA770()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t sub_236DBA7A0()
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA0540]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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