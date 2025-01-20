id MatterCommandActionMap.__allocating_init(commandTemplates:enforceExecutionOrder:)(uint64_t a1, char a2)
{
  objc_class *v2;
  unsigned char *v5;
  objc_super v7;

  v5 = objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___HREMatterCommandActionMap_commandTemplates] = a1;
  v5[OBJC_IVAR___HREMatterCommandActionMap_enforceExecutionOrder] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_initWithCondition_childMaps_, 0, 0);
}

id MatterCommandActionMap.init(commandTemplates:enforceExecutionOrder:)(uint64_t a1, char a2)
{
  *(void *)&v2[OBJC_IVAR___HREMatterCommandActionMap_commandTemplates] = a1;
  v2[OBJC_IVAR___HREMatterCommandActionMap_enforceExecutionOrder] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for MatterCommandActionMap();
  return objc_msgSendSuper2(&v4, sel_initWithCondition_childMaps_, 0, 0);
}

uint64_t type metadata accessor for MatterCommandActionMap()
{
  return self;
}

uint64_t MatterCommandActionMap.__allocating_init(rawCommands:)(unint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return MatterCommandActionMap.init(rawCommands:)(a1);
}

uint64_t MatterCommandActionMap.init(rawCommands:)(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v4 = v1;
    uint64_t result = swift_bridgeObjectRetain();
    v16 = v1;
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    v7 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
    swift_bridgeObjectRelease_n();

    v13 = (objc_class *)type metadata accessor for MatterCommandActionMap();
    v14 = objc_allocWithZone(v13);
    *(void *)&v14[OBJC_IVAR___HREMatterCommandActionMap_commandTemplates] = v7;
    v14[OBJC_IVAR___HREMatterCommandActionMap_enforceExecutionOrder] = 1;
    v17.receiver = v14;
    v17.super_class = v13;
    id v15 = objc_msgSendSuper2(&v17, sel_initWithCondition_childMaps_, 0, 0);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return (uint64_t)v15;
  }
  id v12 = v1;
  swift_bridgeObjectRetain();
  uint64_t result = sub_237B92AE0();
  uint64_t v3 = result;
  v16 = v1;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v6 = 0;
    v7 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x237E2AA30](v6, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v6 + 32);
      }
      v9 = v8;
      sub_237B6F0B4((uint64_t)v8 + OBJC_IVAR___HREMatterCommandMap_template, (uint64_t)&v18);

      if (v19)
      {
        sub_237B6F15C(&v18, (uint64_t)v20);
        sub_237B6F15C(v20, (uint64_t)&v18);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v7 = sub_237B701C8(0, v7[2] + 1, 1, v7);
        }
        unint64_t v11 = v7[2];
        unint64_t v10 = v7[3];
        if (v11 >= v10 >> 1) {
          v7 = sub_237B701C8((void *)(v10 > 1), v11 + 1, 1, v7);
        }
        v7[2] = v11 + 1;
        sub_237B6F15C(&v18, (uint64_t)&v7[5 * v11 + 4]);
      }
      else
      {
        sub_237B70474((uint64_t)&v18, &qword_268943F08);
      }
      ++v6;
    }
    while (v3 != v6);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_237B6F0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_237B6F15C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_237B6F174(void *(*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = a3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      id v8 = a1(&v9, v7);
      if (v3)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      if (v9)
      {
        MEMORY[0x237E2A810](v8);
        if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_237B928A0();
        }
        sub_237B928B0();
        sub_237B92890();
      }
      v7 += 40;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

uint64_t sub_237B6F348(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268943FE0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_237B927C0();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944280);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_237B92800();
  uint64_t v11 = *(void *)(v10 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237B92930();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    v14 = &qword_268944280;
    uint64_t v15 = (uint64_t)v9;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_237B927F0();
    uint64_t v16 = v5;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    {
      uint64_t v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
      uint64_t v19 = *(void *)(v21[0] + OBJC_IVAR___HREMatterCommandActionMap_commandTemplates);
      MEMORY[0x270FA5388](v18);
      v21[-2] = a1;
      v21[-1] = v7;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_237B6F174((void *(*)(uint64_t *__return_ptr, uint64_t))sub_237B704D0, (uint64_t)&v21[-4], v19);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v4);
      return v17;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v14 = (uint64_t *)&unk_268943FE0;
    uint64_t v15 = (uint64_t)v3;
  }
  sub_237B70474(v15, v14);
  return 0;
}

id MatterCommandActionMap.__allocating_init(condition:childMaps:)(void *a1, uint64_t a2)
{
  if (a2)
  {
    sub_237B7057C(0, &qword_268943F10);
    uint64_t v4 = (void *)sub_237B92870();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithCondition_childMaps_, a1, v4);

  return v5;
}

void MatterCommandActionMap.init(condition:childMaps:)()
{
}

void MatterCommandActionMap.init()()
{
}

id MatterCommandActionMap.__deallocating_deinit()
{
  return sub_237B70180(type metadata accessor for MatterCommandActionMap);
}

id static MatterCommandMap.vacuum.getter()
{
  return sub_237B6FC40(MEMORY[0x263F48F00], MEMORY[0x263F48F08], MEMORY[0x263F48EB0]);
}

id static MatterCommandMap.mop.getter()
{
  return sub_237B6FC40(MEMORY[0x263F48EF0], MEMORY[0x263F48F08], MEMORY[0x263F48EB0]);
}

id static MatterCommandMap.vacuumAndMop.getter()
{
  return sub_237B6FC40(MEMORY[0x263F48ED8], MEMORY[0x263F48F08], MEMORY[0x263F48EB0]);
}

id static MatterCommandMap.startCleaning.getter()
{
  return sub_237B6FC40(MEMORY[0x263F48E60], MEMORY[0x263F48E70], MEMORY[0x263F48EA0]);
}

id static MatterCommandMap.pauseCleaning.getter()
{
  return sub_237B6FF74(MEMORY[0x263F48E90]);
}

id sub_237B6FA5C(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t (*a4)(void), unsigned int *a5)
{
  uint64_t v8 = sub_237B92820();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a3;
  uint64_t v13 = a4(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *a5, v8);
  v21[3] = v8;
  v21[4] = sub_237B70300();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(boxed_opaque_existential_1, v11, v8);
  uint64_t v15 = (objc_class *)type metadata accessor for MatterCommandMap();
  id v16 = objc_allocWithZone(v15);
  sub_237B6F0B4((uint64_t)v21, (uint64_t)v16 + OBJC_IVAR___HREMatterCommandMap_template);
  v20.receiver = v16;
  v20.super_class = v15;
  id v17 = objc_msgSendSuper2(&v20, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v17;
}

id static MatterCommandMap.selectAllRooms.getter()
{
  return sub_237B6FC40(MEMORY[0x263F48E38], MEMORY[0x263F48E48], MEMORY[0x263F48E88]);
}

id sub_237B6FC40(unsigned int *a1, uint64_t (*a2)(void), unsigned int *a3)
{
  uint64_t v6 = sub_237B92820();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v11 = a2(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *a3, v6);
  v19[3] = v6;
  v19[4] = sub_237B70300();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v9, v6);
  uint64_t v13 = (objc_class *)type metadata accessor for MatterCommandMap();
  id v14 = objc_allocWithZone(v13);
  sub_237B6F0B4((uint64_t)v19, (uint64_t)v14 + OBJC_IVAR___HREMatterCommandMap_template);
  v18.receiver = v14;
  v18.super_class = v13;
  id v15 = objc_msgSendSuper2(&v18, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

id sub_237B6FDF8(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4 = sub_237B92820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *a3, v4);
  v15[3] = v4;
  v15[4] = sub_237B70300();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(boxed_opaque_existential_1, v7, v4);
  uint64_t v9 = (objc_class *)type metadata accessor for MatterCommandMap();
  id v10 = objc_allocWithZone(v9);
  sub_237B6F0B4((uint64_t)v15, (uint64_t)v10 + OBJC_IVAR___HREMatterCommandMap_template);
  v14.receiver = v10;
  v14.super_class = v9;
  id v11 = objc_msgSendSuper2(&v14, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

id static MatterCommandMap.goHome.getter()
{
  return sub_237B6FF74(MEMORY[0x263F48E78]);
}

id sub_237B6FF74(unsigned int *a1)
{
  uint64_t v2 = sub_237B92820();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *a1, v2);
  v13[3] = v2;
  v13[4] = sub_237B70300();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(boxed_opaque_existential_1, v5, v2);
  uint64_t v7 = (objc_class *)type metadata accessor for MatterCommandMap();
  id v8 = objc_allocWithZone(v7);
  sub_237B6F0B4((uint64_t)v13, (uint64_t)v8 + OBJC_IVAR___HREMatterCommandMap_template);
  v12.receiver = v8;
  v12.super_class = v7;
  id v9 = objc_msgSendSuper2(&v12, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

id MatterCommandMap.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MatterCommandMap.init()()
{
}

id MatterCommandMap.__deallocating_deinit()
{
  return sub_237B70180(type metadata accessor for MatterCommandMap);
}

id sub_237B70180(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void *sub_237B701C8(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268943FF8);
    id v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268944000);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_237B70300()
{
  unint64_t result = qword_268943F18;
  if (!qword_268943F18)
  {
    sub_237B92820();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268943F18);
  }
  return result;
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

uint64_t type metadata accessor for MatterCommandMap()
{
  return self;
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

uint64_t method lookup function for MatterCommandActionMap(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MatterCommandActionMap);
}

uint64_t dispatch thunk of MatterCommandActionMap.__allocating_init(commandTemplates:enforceExecutionOrder:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for MatterCommandMap(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MatterCommandMap);
}

uint64_t sub_237B70474(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237B704D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_237B92810();
  *a2 = result;
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

uint64_t sub_237B7057C(uint64_t a1, unint64_t *a2)
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

void HRETemplateRecommendationGeneratorProcess.matterCommandActions(for:with:)(uint64_t a1, uint64_t a2)
{
  if (sub_237B927A0())
  {
    uint64_t v33 = MEMORY[0x263F8EE88];
    if ((unint64_t)a1 >> 62) {
      goto LABEL_21;
    }
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_22;
    }
LABEL_4:
    if (v4 >= 1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x237E2AA30](i, a1);
        }
        else
        {
          uint64_t v6 = *(void *)(a1 + 8 * i + 32);
          swift_unknownObjectRetain();
        }
        sub_237B709A0(v6, a2);
        if (v7) {
          sub_237B7129C(v7);
        }
        swift_unknownObjectRelease();
      }
      swift_bridgeObjectRelease();
      a1 = v33;
      unint64_t v8 = v33 & 0xC000000000000001;
      if ((v33 & 0xC000000000000001) != 0)
      {
        while (1)
        {
          a2 = a1 < 0 ? a1 : a1 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain();
          uint64_t v9 = sub_237B929D0();
          if (!v9) {
            break;
          }
          uint64_t v10 = v9;
          unint64_t v32 = MEMORY[0x263F8EE78];
          sub_237B92AB0();
          uint64_t v29 = sub_237B92970();
          uint64_t v30 = v11;
          char v31 = 1;
          if ((v10 & 0x8000000000000000) == 0) {
            goto LABEL_27;
          }
          __break(1u);
LABEL_21:
          swift_bridgeObjectRetain();
          uint64_t v4 = sub_237B92AE0();
          if (v4) {
            goto LABEL_4;
          }
LABEL_22:
          swift_bridgeObjectRelease();
          a1 = MEMORY[0x263F8EE88];
          unint64_t v8 = MEMORY[0x263F8EE88] & 0xC000000000000001;
          if ((MEMORY[0x263F8EE88] & 0xC000000000000001) == 0) {
            goto LABEL_23;
          }
        }
      }
      else
      {
LABEL_23:
        uint64_t v10 = *(void *)(a1 + 16);
        swift_bridgeObjectRetain();
        if (v10)
        {
          unint64_t v32 = MEMORY[0x263F8EE78];
          sub_237B92AB0();
          uint64_t v29 = sub_237B74E80(a1);
          uint64_t v30 = v12;
          char v31 = v13 & 1;
          do
          {
LABEL_27:
            while (1)
            {
              int64_t v19 = v29;
              uint64_t v20 = v30;
              char v21 = v31;
              sub_237B74C10(v29, v30, v31, a1, &qword_2689442A0);
              v23 = v22;
              id v24 = objc_msgSend(v22, sel_asGeneric);

              sub_237B92A90();
              sub_237B92AC0();
              sub_237B92AD0();
              sub_237B92AA0();
              if (v8) {
                break;
              }
              int64_t v14 = sub_237B74B2C(v19, v20, v21, a1);
              uint64_t v16 = v15;
              char v18 = v17;
              sub_237B75448(v19, v20, v21);
              uint64_t v29 = v14;
              uint64_t v30 = v16;
              char v31 = v18 & 1;
              if (!--v10) {
                goto LABEL_32;
              }
            }
            if ((v21 & 1) == 0) {
              goto LABEL_40;
            }
            if (sub_237B92990()) {
              swift_isUniquelyReferenced_nonNull_native();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_268944250);
            v25 = (void (*)(unsigned char *, void))sub_237B928F0();
            sub_237B92A20();
            v25(v28, 0);
            --v10;
          }
          while (v10);
LABEL_32:
          sub_237B75448(v29, v30, v31);
          unint64_t v26 = v32;
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v26 = MEMORY[0x263F8EE78];
LABEL_34:
      swift_bridgeObjectRelease();
      sub_237B74FA0(v26);
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
LABEL_40:
    __break(1u);
  }
  else if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_237B92AE0())
  {
    unint64_t v27 = MEMORY[0x263F8EE78];
    sub_237B750E8(v27);
  }
}

void sub_237B709A0(uint64_t a1, uint64_t a2)
{
  uint64_t v85 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268944280);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_237B92800();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268943FE0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v84 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v67 - v12;
  uint64_t v86 = sub_237B927C0();
  uint64_t v14 = *(void *)(v86 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v86);
  v90 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v81 = (char *)&v67 - v17;
  swift_getObjectType();
  if ((sub_237B92920() & 1) == 0) {
    return;
  }
  uint64_t v80 = v5;
  uint64_t v18 = sub_237B92910();
  uint64_t v19 = (v18 & 0xC000000000000001) != 0 ? sub_237B929D0() : *(void *)(v18 + 16);
  swift_bridgeObjectRelease();
  if (v19 != 1) {
    return;
  }
  uint64_t v20 = sub_237B92910();
  char v21 = (void *)sub_237B71630(v20);
  swift_bridgeObjectRelease();
  id v89 = v21;
  if (!v21) {
    return;
  }
  sub_237B71750((uint64_t)v13);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  uint64_t v23 = v86;
  uint64_t v76 = v14 + 48;
  v75 = v22;
  if (v22((uint64_t)v13, 1, v86) == 1)
  {

    sub_237B70474((uint64_t)v13, (uint64_t *)&unk_268943FE0);
    return;
  }
  v77 = v8;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 32);
  uint64_t v24 = v14 + 32;
  v69 = v25;
  v25(v81, (uint64_t)v13, v23);
  uint64_t v26 = sub_237B71B84();
  uint64_t v27 = v26;
  int64_t v28 = 0;
  uint64_t v29 = *(void *)(v26 + 56);
  uint64_t v30 = 1 << *(unsigned char *)(v26 + 32);
  uint64_t v93 = MEMORY[0x263F8EE88];
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  else {
    uint64_t v31 = -1;
  }
  unint64_t v32 = v31 & v29;
  int64_t v88 = (unint64_t)(v30 + 63) >> 6;
  v79 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  v74 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  v73 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v33 = v26 + 56;
  v72 = (void (**)(char *, uint64_t))(v24 - 24);
  unint64_t v34 = MEMORY[0x263F8EE78];
  uint64_t v35 = v85;
  v71 = v4;
  uint64_t v70 = v24;
  uint64_t v82 = v26 + 56;
  uint64_t v83 = v26;
  while (1)
  {
    while (v32)
    {
      unint64_t v36 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      unint64_t v37 = v36 | (v28 << 6);
      if (*(void *)(v35 + 16))
      {
LABEL_32:
        v41 = (uint64_t *)(*(void *)(v27 + 48) + 16 * v37);
        uint64_t v42 = *v41;
        uint64_t v43 = v41[1];
        swift_bridgeObjectRetain();
        unint64_t v44 = sub_237B73EAC(v42, v43);
        if (v45)
        {
          id v46 = *(id *)(*(void *)(v35 + 56) + 8 * v44);
          swift_bridgeObjectRelease();
          type metadata accessor for MatterCommandActionMap();
          uint64_t v47 = swift_dynamicCastClass();
          if (v47
            && (uint64_t v48 = v47, (v49 = objc_msgSend(v87, sel_snapshotContainer)) != 0))
          {
            v50 = v49;
            sub_237B92930();
            uint64_t v51 = v80;
            if ((*v79)(v4, 1, v80) == 1)
            {
              sub_237B70474((uint64_t)v4, &qword_268944280);
            }
            else
            {
              id v78 = v50;
              v52 = v77;
              (*v74)(v77, v4, v51);
              uint64_t v53 = (uint64_t)v84;
              sub_237B927F0();
              uint64_t v54 = v86;
              if (v75(v53, 1, v86) == 1)
              {
                (*v73)(v52, v51);
                sub_237B70474(v53, (uint64_t *)&unk_268943FE0);
              }
              else
              {
                v69(v90, v53, v54);
                uint64_t v55 = *(void *)(v48 + OBJC_IVAR___HREMatterCommandActionMap_commandTemplates);
                unint64_t v92 = v34;
                uint64_t v56 = *(void *)(v55 + 16);
                if (v56)
                {
                  uint64_t v57 = v55 + 32;
                  uint64_t v68 = v55;
                  swift_bridgeObjectRetain();
                  do
                  {
                    sub_237B6F0B4(v57, (uint64_t)v91);
                    __swift_project_boxed_opaque_existential_1(v91, (uint64_t)v91[3]);
                    uint64_t v58 = sub_237B92810();
                    uint64_t v59 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
                    if (v58)
                    {
                      MEMORY[0x237E2A810](v59);
                      if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v92 & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
                        sub_237B928A0();
                      sub_237B928B0();
                      sub_237B92890();
                    }
                    v57 += 40;
                    --v56;
                  }
                  while (v56);
                  unint64_t v60 = v92;
                  uint64_t v4 = v71;
                  uint64_t v51 = v80;
                }
                else
                {
                  unint64_t v60 = v34;
                  swift_bridgeObjectRetain();
                }
                swift_bridgeObjectRelease();
                (*v73)(v77, v51);
                (*v72)(v90, v86);
                if (v60 >> 62)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v66 = sub_237B92AE0();
                  swift_bridgeObjectRelease();
                  if (v66)
                  {
LABEL_51:
                    id v61 = objc_msgSend(v87, sel_home);
                    LODWORD(v68) = *(unsigned __int8 *)(v48 + OBJC_IVAR___HREMatterCommandActionMap_enforceExecutionOrder);
                    id v62 = objc_allocWithZone(MEMORY[0x263F47B90]);
                    sub_237B7057C(0, &qword_268943FF0);
                    id v63 = v89;
                    v64 = (void *)sub_237B92870();
                    swift_bridgeObjectRelease();
                    id v65 = objc_msgSend(v62, sel_initWithHome_commands_accessory_enforceExecutionOrder_, v61, v64, v63, v68);

                    uint64_t v4 = v71;
                    sub_237B7221C(v91, v65);

                    goto LABEL_56;
                  }
                }
                else if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  goto LABEL_51;
                }
                swift_bridgeObjectRelease();
              }
            }
LABEL_56:
            uint64_t v33 = v82;
            uint64_t v27 = v83;
            uint64_t v35 = v85;
          }
          else
          {

            uint64_t v33 = v82;
            uint64_t v27 = v83;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
    }
    int64_t v38 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
      goto LABEL_59;
    }
    if (v38 >= v88) {
      goto LABEL_57;
    }
    unint64_t v39 = *(void *)(v33 + 8 * v38);
    ++v28;
    if (!v39)
    {
      int64_t v28 = v38 + 1;
      if (v38 + 1 >= v88) {
        goto LABEL_57;
      }
      unint64_t v39 = *(void *)(v33 + 8 * v28);
      if (!v39)
      {
        int64_t v28 = v38 + 2;
        if (v38 + 2 >= v88) {
          goto LABEL_57;
        }
        unint64_t v39 = *(void *)(v33 + 8 * v28);
        if (!v39) {
          break;
        }
      }
    }
LABEL_31:
    unint64_t v32 = (v39 - 1) & v39;
    unint64_t v37 = __clz(__rbit64(v39)) + (v28 << 6);
    if (*(void *)(v35 + 16)) {
      goto LABEL_32;
    }
  }
  int64_t v40 = v38 + 3;
  if (v40 >= v88)
  {
LABEL_57:
    swift_release();

    (*v72)(v81, v86);
    return;
  }
  unint64_t v39 = *(void *)(v33 + 8 * v40);
  if (v39)
  {
    int64_t v28 = v40;
    goto LABEL_31;
  }
  while (1)
  {
    int64_t v28 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      break;
    }
    if (v28 >= v88) {
      goto LABEL_57;
    }
    unint64_t v39 = *(void *)(v33 + 8 * v28);
    ++v40;
    if (v39) {
      goto LABEL_31;
    }
  }
LABEL_59:
  __break(1u);
}

void sub_237B7129C(unint64_t a1)
{
  unint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_237B92980();
    sub_237B7057C(0, &qword_2689442A0);
    sub_237B75BE4();
    sub_237B92900();
    unint64_t v1 = (unint64_t)v17[1];
    uint64_t v16 = v17[2];
    uint64_t v2 = (uint64_t)v17[3];
    id v3 = v17[4];
    unint64_t v4 = (unint64_t)v17[5];
  }
  else
  {
    id v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = (void *)(a1 + 56);
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | ((void)v3 << 6);
      uint64_t v11 = (char *)v3;
      goto LABEL_29;
    }
    uint64_t v13 = (uint64_t)v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v13 >= v8) {
      goto LABEL_32;
    }
    unint64_t v14 = v16[v13];
    uint64_t v11 = (char *)v3 + 1;
    if (!v14)
    {
      uint64_t v11 = (char *)v3 + 2;
      if ((uint64_t)v3 + 2 >= v8) {
        goto LABEL_32;
      }
      unint64_t v14 = v16[(void)v11];
      if (!v14)
      {
        uint64_t v11 = (char *)v3 + 3;
        if ((uint64_t)v3 + 3 >= v8) {
          goto LABEL_32;
        }
        unint64_t v14 = v16[(void)v11];
        if (!v14)
        {
          uint64_t v11 = (char *)v3 + 4;
          if ((uint64_t)v3 + 4 >= v8) {
            goto LABEL_32;
          }
          unint64_t v14 = v16[(void)v11];
          if (!v14)
          {
            uint64_t v11 = (char *)v3 + 5;
            if ((uint64_t)v3 + 5 >= v8) {
              goto LABEL_32;
            }
            unint64_t v14 = v16[(void)v11];
            if (!v14)
            {
              uint64_t v15 = (char *)v3 + 6;
              while ((char *)v8 != v15)
              {
                unint64_t v14 = v16[(void)v15++];
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_237B75C4C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + ((void)v11 << 6);
LABEL_29:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_237B7221C(v17, v12);

      id v3 = v11;
      unint64_t v4 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_237B92A00())
      {
        sub_237B7057C(0, &qword_2689442A0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v12 = v17[0];
        swift_unknownObjectRelease();
        uint64_t v11 = (char *)v3;
        uint64_t v9 = v4;
        if (v12) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_237B71630(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_237B92970();
    uint64_t v5 = v4;
    uint64_t v6 = sub_237B92A10();
    char v8 = MEMORY[0x237E2A950](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_237B75448(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_237B74C10(v3, v5, v2 != 0, a1, &qword_268944298);
    uint64_t v9 = v13;
    sub_237B75448(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_237B74E80(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_237B71750@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268943FE0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268944280);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_237B92800();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  if (sub_237B92920())
  {
    unint64_t v36 = v12;
    uint64_t v13 = v8;
    uint64_t v14 = v9;
    uint64_t v15 = v5;
    uint64_t v16 = sub_237B92910();
    uint64_t v17 = (v16 & 0xC000000000000001) != 0 ? sub_237B929D0() : *(void *)(v16 + 16);
    swift_bridgeObjectRelease();
    uint64_t v18 = v10;
    uint64_t v19 = (uint64_t)v15;
    uint64_t v20 = v14;
    uint64_t v21 = (uint64_t)v13;
    v22 = v36;
    if (v17 == 1)
    {
      uint64_t v23 = sub_237B92910();
      uint64_t v24 = (void *)sub_237B71630(v23);
      swift_bridgeObjectRelease();
      if (v24)
      {
        id v25 = objc_msgSend(v1, sel_snapshotContainer);
        if (v25)
        {
          uint64_t v26 = v25;
          sub_237B92930();

          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v21, 1, v20) != 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v22, v21, v20);
            sub_237B927F0();

            (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v20);
            uint64_t v27 = sub_237B927C0();
            uint64_t v28 = *(void *)(v27 - 8);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v19, 1, v27) != 1)
            {
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(a1, v19, v27);
              return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(a1, 0, 1, v27);
            }
            uint64_t v29 = (uint64_t *)&unk_268943FE0;
            uint64_t v30 = v19;
            goto LABEL_16;
          }
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v21, 1, 1, v20);
        }

        uint64_t v29 = &qword_268944280;
        uint64_t v30 = v21;
LABEL_16:
        sub_237B70474(v30, v29);
        uint64_t v34 = sub_237B927C0();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(a1, 1, 1, v34);
      }
    }
  }
  uint64_t v31 = sub_237B927C0();
  unint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56);

  return v32(a1, 1, 1, v31);
}

uint64_t sub_237B71B84()
{
  uint64_t v32 = sub_237B927E0();
  uint64_t v0 = *(void *)(v32 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v32);
  uint64_t v31 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v30 = (char *)v26 - v3;
  uint64_t v4 = sub_237B927B0();
  int64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v37 = MEMORY[0x263F8EE78];
    sub_237B74008(0, v5, 0);
    uint64_t result = sub_237B74A8C(v4);
    int64_t v7 = result;
    int v9 = v8;
    uint64_t v28 = v0;
    uint64_t v29 = v4 + 56;
    int v11 = v10 & 1;
    v26[2] = v0 + 32;
    v26[3] = v0 + 16;
    v26[0] = 0x8000000237B954A0;
    v26[1] = v0 + 8;
    uint64_t v27 = v4;
    uint64_t v12 = v0;
    uint64_t v13 = v31;
    while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(v4 + 32))
    {
      if (((*(void *)(v29 + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_16;
      }
      if (*(_DWORD *)(v4 + 36) != v9) {
        goto LABEL_17;
      }
      int v33 = v11;
      int64_t v14 = *(void *)(v4 + 48) + *(void *)(v12 + 72) * v7;
      uint64_t v15 = v30;
      uint64_t v16 = v32;
      (*(void (**)(char *, int64_t, uint64_t))(v12 + 16))(v30, v14, v32);
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v13, v15, v16);
      unint64_t v35 = 0;
      unint64_t v36 = 0xE000000000000000;
      sub_237B92A70();
      swift_bridgeObjectRelease();
      unint64_t v35 = 0xD000000000000014;
      unint64_t v36 = v26[0];
      int v34 = sub_237B927D0();
      sub_237B92AF0();
      sub_237B92850();
      swift_bridgeObjectRelease();
      unint64_t v17 = v35;
      unint64_t v18 = v36;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v13, v16);
      uint64_t v19 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237B74008(0, *(void *)(v19 + 16) + 1, 1);
        uint64_t v19 = v37;
      }
      unint64_t v21 = *(void *)(v19 + 16);
      unint64_t v20 = *(void *)(v19 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_237B74008((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v19 = v37;
      }
      *(void *)(v19 + 16) = v21 + 1;
      uint64_t v22 = v19 + 16 * v21;
      *(void *)(v22 + 32) = v17;
      *(void *)(v22 + 40) = v18;
      uint64_t v4 = v27;
      uint64_t result = sub_237B74B2C(v7, v9, v33 & 1, v27);
      int64_t v7 = result;
      int v9 = v23;
      int v11 = v24 & 1;
      if (!--v5)
      {
        sub_237B75448(result, v23, v11);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t v25 = sub_237B74F08(v19);
    swift_bridgeObjectRelease();
    return v25;
  }
  return result;
}

uint64_t HRETemplateRecommendationGeneratorProcess.additionalIncludedObjects(in:with:)(uint64_t a1, unint64_t a2)
{
  if ((sub_237B927A0() & 1) == 0) {
    return MEMORY[0x263F8EE78];
  }
  id v4 = v2;
  swift_bridgeObjectRetain();
  unint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_237B75454(v5, v4, a2);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_237B7206C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_237B92B20();
  swift_bridgeObjectRetain();
  sub_237B92840();
  uint64_t v8 = sub_237B92B30();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_237B92B00() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_237B92B00() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_237B7314C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_237B7221C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_237B929E0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_237B7057C(0, &qword_2689442A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_237B929D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_237B72750(v7, result + 1);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_237B72E2C(v26, &qword_2689442B0);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_237B730C8((uint64_t)v8, v23);
    *uint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_237B92940();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_237B7057C(0, &qword_2689442A0);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_237B92950();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_237B92950();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_237B732E8((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_237B724C4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_237B929E0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_237B929D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_237B7295C(v7, result + 1);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_237B72E2C(v26, &qword_2689442B8);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_237B730C8((uint64_t)v8, v23);
    *uint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_237B92940();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_237B92950();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_237B92950();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_237B73490((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_237B72750(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689442B0);
    uint64_t v2 = sub_237B92A50();
    uint64_t v15 = v2;
    sub_237B92980();
    if (sub_237B92A00())
    {
      sub_237B7057C(0, &qword_2689442A0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        unint64_t v9 = *(void *)(v15 + 16);
        if (*(void *)(v15 + 24) <= v9)
        {
          sub_237B72E2C(v9 + 1, &qword_2689442B0);
          uint64_t v2 = v15;
        }
        uint64_t result = sub_237B92940();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v7 == v11;
            if (v7 == v11) {
              unint64_t v7 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v14;
        ++*(void *)(v2 + 16);
      }
      while (sub_237B92A00());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_237B7295C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689442B8);
    uint64_t v2 = sub_237B92A50();
    uint64_t v15 = v2;
    sub_237B92980();
    for (; sub_237B92A00(); ++*(void *)(v2 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
      swift_dynamicCast();
      unint64_t v9 = *(void *)(v2 + 16);
      if (*(void *)(v2 + 24) <= v9)
      {
        sub_237B72E2C(v9 + 1, &qword_2689442B8);
        uint64_t v2 = v15;
      }
      uint64_t result = sub_237B92940();
      uint64_t v4 = v2 + 56;
      uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v6 = result & ~v5;
      unint64_t v7 = v6 >> 6;
      if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
      {
        unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v10 = 0;
        unint64_t v11 = (unint64_t)(63 - v5) >> 6;
        do
        {
          if (++v7 == v11 && (v10 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          BOOL v12 = v7 == v11;
          if (v7 == v11) {
            unint64_t v7 = 0;
          }
          v10 |= v12;
          uint64_t v13 = *(void *)(v4 + 8 * v7);
        }
        while (v13 == -1);
        unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
      }
      *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
      *(void *)(*(void *)(v2 + 48) + 8 * v8) = v14;
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_237B72B4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944288);
  uint64_t v3 = sub_237B92A40();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                  *uint64_t v30 = -1 << v29;
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
      sub_237B92B20();
      sub_237B92840();
      uint64_t result = sub_237B92B30();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_237B72E2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_237B92A40();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    int64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_237B92940();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t sub_237B730C8(uint64_t a1, uint64_t a2)
{
  sub_237B92940();
  unint64_t result = sub_237B92960();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_237B7314C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_237B72B4C();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_237B7362C();
      goto LABEL_22;
    }
    sub_237B73984();
  }
  uint64_t v11 = *v4;
  sub_237B92B20();
  sub_237B92840();
  unint64_t result = sub_237B92B30();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_237B92B00(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_237B92B10();
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
          unint64_t result = sub_237B92B00();
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

void sub_237B732E8(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if (a3)
  {
    sub_237B72E2C(v8, &qword_2689442B0);
  }
  else
  {
    if (v7 > v6)
    {
      sub_237B737E0(&qword_2689442B0);
      goto LABEL_14;
    }
    sub_237B73C34(v8, &qword_2689442B0);
  }
  uint64_t v9 = *v3;
  uint64_t v10 = sub_237B92940();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_237B7057C(0, &qword_2689442A0);
    id v12 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v13 = sub_237B92950();

    if (v13)
    {
LABEL_13:
      sub_237B92B10();
      __break(1u);
    }
    else
    {
      uint64_t v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v16 = sub_237B92950();

        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
}

void sub_237B73490(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if (a3)
  {
    sub_237B72E2C(v8, &qword_2689442B8);
  }
  else
  {
    if (v7 > v6)
    {
      sub_237B737E0(&qword_2689442B8);
      goto LABEL_14;
    }
    sub_237B73C34(v8, &qword_2689442B8);
  }
  uint64_t v9 = *v3;
  uint64_t v10 = sub_237B92940();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
    id v12 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v13 = sub_237B92950();

    if (v13)
    {
LABEL_13:
      sub_237B92B10();
      __break(1u);
    }
    else
    {
      uint64_t v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v16 = sub_237B92950();

        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
}

void *sub_237B7362C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944288);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_237B92A30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_237B737E0(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_237B92A30();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_237B73984()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944288);
  uint64_t v3 = sub_237B92A40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_237B92B20();
    swift_bridgeObjectRetain();
    sub_237B92840();
    uint64_t result = sub_237B92B30();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
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

uint64_t sub_237B73C34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_237B92A40();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  int64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_237B92940();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_237B73EAC(uint64_t a1, uint64_t a2)
{
  sub_237B92B20();
  sub_237B92840();
  uint64_t v4 = sub_237B92B30();

  return sub_237B73F24(a1, a2, v4);
}

unint64_t sub_237B73F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_237B92B00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_237B92B00() & 1) == 0);
    }
  }
  return v6;
}

char *sub_237B74008(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_237B74028(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_237B74028(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268944290);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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
  swift_release();
  return v10;
}

uint64_t sub_237B7412C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_237B742B4((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_237B742B4((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x237E2B0C0](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_237B742B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_237B92B20();
        swift_bridgeObjectRetain();
        sub_237B92840();
        uint64_t v20 = sub_237B92B30();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      unint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_237B92B00() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_237B92B00() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    unint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_237B92B20();
    swift_bridgeObjectRetain();
    sub_237B92840();
    uint64_t v47 = sub_237B92B30();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_237B92B00() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_237B747F4(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_237B92B00() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_237B747F4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944288);
  uint64_t result = sub_237B92A60();
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
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_237B92B20();
    swift_bridgeObjectRetain();
    sub_237B92840();
    uint64_t result = sub_237B92B30();
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

uint64_t sub_237B74A8C(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  unint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_237B74B2C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_237B74C10(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v8 = a4;
      }
      else {
        uint64_t v8 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x237E2A9A0](a1, a2, v8);
      sub_237B7057C(0, a5);
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
  if (sub_237B929B0() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_237B929C0();
  sub_237B7057C(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v18;
  swift_unknownObjectRelease();
  uint64_t v9 = sub_237B92940();
  uint64_t v10 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v9 & ~v10;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v11 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v12 = sub_237B92950();

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = ~v10;
    do
    {
      unint64_t v7 = (v7 + 1) & v13;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_26;
      }
      id v14 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v15 = sub_237B92950();
    }
    while ((v15 & 1) == 0);
  }

LABEL_20:
  uint64_t v16 = *(void **)(*(void *)(a4 + 48) + 8 * v7);

  id v17 = v16;
}

uint64_t sub_237B74E80(uint64_t a1)
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

uint64_t sub_237B74F08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_237B928E0();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_237B7206C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_237B74FA0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_237B92AE0();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
  sub_237B75B40();
  uint64_t result = sub_237B928E0();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_237B92AE0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x237E2AA30](i, a1);
        sub_237B724C4(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_237B724C4(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

void sub_237B750E8(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_237B92AE0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689442B8);
      uint64_t v3 = sub_237B92A60();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_237B92AE0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v42 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v40 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x237E2AA30](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      uint64_t v12 = sub_237B92940();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_237B92950();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v40;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_237B92950();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v40;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v5) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    id v26 = *(id *)(v1 + 32 + 8 * v25);
    uint64_t v27 = sub_237B92940();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_237B92950();

      if (v34) {
        goto LABEL_24;
      }
      uint64_t v35 = ~v28;
      unint64_t v29 = (v29 + 1) & v35;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
          char v37 = sub_237B92950();

          if (v37) {
            break;
          }
          unint64_t v29 = (v29 + 1) & v35;
          unint64_t v30 = v29 >> 6;
          uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
          uint64_t v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v42;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v42;
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_237B75448(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_237B75454(unint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v4 = v3;
  id v64 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268943FE0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268944280);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_237B92800();
  uint64_t v13 = *(uint64_t **)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  int64_t v62 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_237B927C0();
  unint64_t ObjectType = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v58 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v57 = (char *)&v48 - v19;
  uint64_t v69 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_47:
    uint64_t v20 = sub_237B92AE0();
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20)
    {
LABEL_3:
      BOOL v55 = v9;
      unint64_t v51 = a3;
      unint64_t v59 = v4;
      unint64_t v4 = 0;
      a3 = a1 & 0xC000000000000001;
      uint64_t v9 = (char *)(a1 + 32);
      uint64_t v60 = (uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 6);
      uint64_t v61 = v15;
      uint64_t v53 = (void (**)(uint64_t *, uint64_t))(v13 + 1);
      uint64_t v54 = (void (**)(char *, unint64_t, uint64_t))(v13 + 4);
      BOOL v52 = (unsigned int (**)(unint64_t, uint64_t, uint64_t))(ObjectType + 48);
      uint64_t v50 = (char *)(ObjectType + 32);
      unint64_t v48 = a1;
      unint64_t v49 = (void (**)(unint64_t, uint64_t))(ObjectType + 8);
      uint64_t v56 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 7);
      int64_t v63 = v12;
      uint64_t v15 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v67 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v68 = a1 & 0xC000000000000001;
      uint64_t v65 = v20;
      while (1)
      {
        if (a3)
        {
          a1 = MEMORY[0x237E2AA30](v4, v48);
          BOOL v21 = __OFADD__(v4++, 1);
          if (v21)
          {
LABEL_44:
            __break(1u);
            return v69;
          }
        }
        else
        {
          if (v4 >= *(void *)(v15 + 16))
          {
            __break(1u);
            goto LABEL_47;
          }
          a1 = *(void *)&v9[8 * v4];
          swift_unknownObjectRetain();
          BOOL v21 = __OFADD__(v4++, 1);
          if (v21) {
            goto LABEL_44;
          }
        }
        unint64_t ObjectType = swift_getObjectType();
        uint64_t v13 = (uint64_t *)a1;
        if ((sub_237B92920() & 1) != 0
          && (uint64_t v13 = (uint64_t *)a1, (sub_237B92920() & 1) != 0)
          && ((v22 = sub_237B92910(), uint64_t v13 = (uint64_t *)v22, (v22 & 0xC000000000000001) == 0)
            ? (uint64_t v12 = *(char **)(v22 + 16))
            : (uint64_t v12 = (char *)sub_237B929D0()),
              swift_bridgeObjectRelease(),
              v12 == (char *)1))
        {
          uint64_t v23 = sub_237B92910();
          uint64_t v13 = (uint64_t *)v23;
          unint64_t v24 = v23 & 0xC000000000000001;
          if ((v23 & 0xC000000000000001) != 0)
          {
            uint64_t v25 = v9;
            unint64_t v26 = v23 & 0xC000000000000001;
            uint64_t v12 = (char *)sub_237B92970();
            uint64_t v28 = v27;
            uint64_t v29 = sub_237B92A10();
            char v31 = MEMORY[0x237E2A950](v12, v28, v29, v30);
            swift_bridgeObjectRelease();
            unint64_t v24 = v26;
            uint64_t v9 = v25;
            uint64_t v20 = v65;
            unint64_t ObjectType = (unint64_t)v12;
            if (v31) {
              goto LABEL_40;
            }
          }
          else
          {
            char v32 = *(unsigned char *)(v23 + 32);
            uint64_t v12 = (char *)(1 << v32);
            unint64_t v33 = *(void *)(v23 + 56);
            if (v33)
            {
              uint64_t v34 = 0;
            }
            else
            {
              if ((v32 & 0x3Fu) < 7) {
                goto LABEL_39;
              }
              unint64_t v33 = *(void *)(v23 + 64);
              if (!v33)
              {
                uint64_t v44 = 0;
                unint64_t v45 = (unint64_t)(v12 + 63) >> 6;
                if (v45 <= 2) {
                  unint64_t v45 = 2;
                }
                unint64_t v46 = v45 - 2;
                while (v46 != v44)
                {
                  unint64_t v33 = *(void *)(v23 + 72 + 8 * v44++);
                  if (v33)
                  {
                    uint64_t v34 = v44 + 1;
                    goto LABEL_20;
                  }
                }
LABEL_39:
                uint64_t v28 = *(unsigned int *)(v23 + 36);
LABEL_40:
                sub_237B75448((uint64_t)v12, v28, v24 != 0);
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease();
LABEL_41:
                uint64_t v15 = v67;
                a3 = v68;
                goto LABEL_5;
              }
              uint64_t v34 = 1;
            }
LABEL_20:
            unint64_t ObjectType = __clz(__rbit64(v33)) + (v34 << 6);
            uint64_t v28 = *(unsigned int *)(v23 + 36);
            if ((char *)ObjectType == v12) {
              goto LABEL_40;
            }
          }
          char v35 = v24 != 0;
          sub_237B74C10(ObjectType, v28, v24 != 0, (uint64_t)v13, &qword_268944298);
          uint64_t v12 = v36;
          sub_237B75448(ObjectType, v28, v35);
          swift_bridgeObjectRelease();
          char v37 = (uint64_t *)objc_msgSend(v64, sel_snapshotContainer);
          if (v37)
          {
            uint64_t v13 = v37;
            unint64_t ObjectType = (unint64_t)v63;
            sub_237B92930();

            int v38 = (*v60)(ObjectType, 1, v66);
            uint64_t v39 = v61;
            a3 = v68;
            if (v38 != 1)
            {
              uint64_t v13 = (uint64_t *)v62;
              uint64_t v40 = v66;
              (*v54)(v62, ObjectType, v66);
              unint64_t ObjectType = (unint64_t)v55;
              sub_237B927F0();

              (*v53)(v13, v40);
              if ((*v52)(ObjectType, 1, v39) == 1)
              {
                sub_237B70474(ObjectType, (uint64_t *)&unk_268943FE0);
              }
              else
              {
                uint64_t v12 = v50;
                uint64_t v41 = *(void (**)(char *, char *, uint64_t))v50;
                uint64_t v42 = v58;
                (*(void (**)(char *, unint64_t, uint64_t))v50)(v58, ObjectType, v39);
                unint64_t ObjectType = (unint64_t)v57;
                v41(v57, v42, v39);
                uint64_t v43 = sub_237B71B84();
                uint64_t v13 = *(uint64_t **)(sub_237B7412C(v51, v43) + 16);
                swift_release();
                (*v49)(ObjectType, v39);
                if (v13)
                {
                  uint64_t v13 = &v69;
                  sub_237B92A90();
                  unint64_t ObjectType = *(void *)(v69 + 16);
                  sub_237B92AC0();
                  sub_237B92AD0();
                  sub_237B92AA0();
                  goto LABEL_41;
                }
              }
              swift_unknownObjectRelease();
              goto LABEL_41;
            }
          }
          else
          {
            unint64_t ObjectType = (unint64_t)v63;
            (*v56)(v63, 1, 1, v66);
            a3 = v68;
          }

          sub_237B70474(ObjectType, &qword_268944280);
          swift_unknownObjectRelease();
          uint64_t v15 = v67;
        }
        else
        {
          swift_unknownObjectRelease();
        }
LABEL_5:
        if (v4 == v20) {
          return v69;
        }
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

unint64_t sub_237B75B40()
{
  unint64_t result = qword_268944270;
  if (!qword_268944270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268944268);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268944270);
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

unint64_t sub_237B75BE4()
{
  unint64_t result = qword_2689442A8;
  if (!qword_2689442A8)
  {
    sub_237B7057C(255, &qword_2689442A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689442A8);
  }
  return result;
}

uint64_t sub_237B75C4C()
{
  return swift_release();
}

void sub_237B82518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_237B84958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B87524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSString *HREMediaProfileContainerType()
{
  return NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
}

uint64_t HRETelevisionProfileType()
{
  uint64_t v0 = objc_opt_class();

  return [v0 description];
}

uint64_t HRECameraProfileType()
{
  uint64_t v0 = objc_opt_class();

  return [v0 description];
}

uint64_t HRELightProfileType()
{
  uint64_t v0 = objc_opt_class();

  return [v0 description];
}

uint64_t HREMatterRVCType()
{
  return objc_msgSend(NSString, "stringWithFormat:", @"HREMatterDeviceType-%u", 116);
}

uint64_t HREMatterDeviceType(uint64_t a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"HREMatterDeviceType-%u", a1);
}

id HRELocalizedString(void *a1)
{
  return _HRELocalizedStringWithDefaultValue(a1, a1, 1);
}

id _HRELocalizedStringWithDefaultValue(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = HREHomeRecommendationBundle();
  uint64_t v8 = [v7 localizedStringForKey:v5 value:@"_" table:@"HRELocalizable"];

  int v9 = [@"_" isEqualToString:v8];
  if (v9) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = v8;
  }
  if (v9 && a3)
  {
    NSLog(&cfstr_MissingLocaliz.isa, v5, @"HRELocalizable");
    uint64_t v10 = v6;
  }
  id v11 = v10;

  return v11;
}

id HREOptionalLocalizedString(void *a1)
{
  return _HRELocalizedStringWithDefaultValue(a1, 0, 0);
}

id HRELocalizedStringWithDefaultValue(void *a1, void *a2)
{
  return _HRELocalizedStringWithDefaultValue(a1, a2, 0);
}

id HREHomeRecommendationBundle()
{
  if (qword_268944C28 != -1) {
    dispatch_once(&qword_268944C28, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)_MergedGlobals_25;

  return v0;
}

uint64_t __HREHomeRecommendationBundle_block_invoke()
{
  _MergedGlobals_25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

void sub_237B8AE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_237B8B7A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_237B8D9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

uint64_t sub_237B927A0()
{
  return MEMORY[0x270F3A2B8]();
}

uint64_t sub_237B927B0()
{
  return MEMORY[0x270F3AE30]();
}

uint64_t sub_237B927C0()
{
  return MEMORY[0x270F3AEB8]();
}

uint64_t sub_237B927D0()
{
  return MEMORY[0x270F3B2A8]();
}

uint64_t sub_237B927E0()
{
  return MEMORY[0x270F3B2B8]();
}

uint64_t sub_237B927F0()
{
  return MEMORY[0x270F3B518]();
}

uint64_t sub_237B92800()
{
  return MEMORY[0x270F3B5A8]();
}

uint64_t sub_237B92810()
{
  return MEMORY[0x270F3B978]();
}

uint64_t sub_237B92820()
{
  return MEMORY[0x270F3BAD8]();
}

uint64_t sub_237B92830()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_237B92840()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_237B92850()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_237B92860()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_237B92870()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_237B92880()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_237B92890()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_237B928A0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_237B928B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_237B928C0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_237B928D0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_237B928E0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_237B928F0()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_237B92900()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_237B92910()
{
  return MEMORY[0x270F3A0D0]();
}

uint64_t sub_237B92920()
{
  return MEMORY[0x270F3A0D8]();
}

uint64_t sub_237B92930()
{
  return MEMORY[0x270F3A0E8]();
}

uint64_t sub_237B92940()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_237B92950()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_237B92960()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_237B92970()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_237B92980()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_237B92990()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_237B929A0()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_237B929B0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_237B929C0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_237B929D0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_237B929E0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_237B929F0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_237B92A00()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_237B92A10()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_237B92A20()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_237B92A30()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_237B92A40()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_237B92A50()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_237B92A60()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_237B92A70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_237B92A80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_237B92A90()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_237B92AA0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_237B92AB0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_237B92AC0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_237B92AD0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_237B92AE0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_237B92AF0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_237B92B00()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_237B92B10()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_237B92B20()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_237B92B30()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x270F3A108]();
}

uint64_t HFPrimaryStateFromBOOL()
{
  return MEMORY[0x270F3A110]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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