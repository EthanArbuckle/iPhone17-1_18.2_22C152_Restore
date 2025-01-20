id MapKitBrandDataSourceObjcShim.opaqueWrapper.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___BSUIMapKitBrandDataSourceObjcShim_opaqueWrapper);
}

id MapKitBrandDataSourceObjcShim.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id MapKitBrandDataSourceObjcShim.init()()
{
  uint64_t v1 = sub_23F9A6220();
  v2 = v0;
  uint64_t v3 = sub_23F9A6210();
  v9[3] = v1;
  v9[4] = MEMORY[0x263F2BD80];
  v9[0] = v3;
  id v4 = objc_allocWithZone(MEMORY[0x263F2BD88]);
  sub_23F99861C((uint64_t)v9, (uint64_t)v8);
  id v5 = objc_msgSend(v4, sel_initWithThing_, sub_23F9A69E0());
  swift_unknownObjectRelease();
  sub_23F998678((uint64_t)v9);
  *(void *)&v2[OBJC_IVAR___BSUIMapKitBrandDataSourceObjcShim_opaqueWrapper] = v5;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for MapKitBrandDataSourceObjcShim();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_23F99861C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23F998678(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for MapKitBrandDataSourceObjcShim()
{
  return self;
}

id MapKitBrandDataSourceObjcShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapKitBrandDataSourceObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id BrandPlacecardViewControllerObjcShim.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id BrandPlacecardViewControllerObjcShim.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandPlacecardViewControllerObjcShim();
  return objc_msgSendSuper2(&v2, sel_init);
}

id BrandPlacecardViewControllerObjcShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandPlacecardViewControllerObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s18BusinessServicesUI36BrandPlacecardViewControllerObjcShimC04makedefG005brandhI13OpaqueWrapperSo06UIViewG0CSo08BSOpaqueM0C_tFZ_0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_wrappedThing);
  sub_23F9A6950();
  swift_unknownObjectRelease();
  sub_23F9A61F0();
  if (swift_dynamicCast())
  {
    sub_23F9A61E0();
    sub_23F9A6260();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD58);
    if (swift_dynamicCast())
    {
      swift_release();
      objc_super v2 = -[BSUIMapItem makePlacecardViewController](v4);

      return (uint64_t)v2;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id _s18BusinessServicesUI36BrandPlacecardViewControllerObjcShimC18hoursConfiguration3foryXlSgSo15BSOpaqueWrapperC_tFZ_0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD50);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23F9A6180();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v10 = (char *)v26 - v9;
  id v11 = objc_msgSend(a1, sel_wrappedThing);
  sub_23F9A6950();
  swift_unknownObjectRelease();
  sub_23F9A61F0();
  if (!swift_dynamicCast()) {
    return 0;
  }
  v12 = v27;
  sub_23F9A61E0();
  sub_23F9A6260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD58);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_release();
    return 0;
  }
  v13 = (id *)v27;
  swift_release();
  v14 = -[BSUIMapItem messageBusinessHours](v13);
  if (!v14)
  {

    return 0;
  }
  v15 = v14;
  id v16 = -[BSUIMapItem timeZone]((uint64_t)v13);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_10;
  }
  v17 = v16;
  sub_23F9A6170();

  v18 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v18(v3, v8, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_10:

    sub_23F998DE0((uint64_t)v3);
    return 0;
  }
  v18(v10, v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C0E0);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_23F9A7900;
  *(void *)(v19 + 32) = v15;
  v26[0] = v19;
  sub_23F9A6890();
  id v20 = objc_allocWithZone(MEMORY[0x263F53F98]);
  sub_23F998E40();
  v21 = v15;
  v22 = (void *)sub_23F9A6870();
  swift_bridgeObjectRelease();
  v23 = (void *)sub_23F9A6160();
  id v24 = objc_msgSend(v20, sel_initWithBusinessHours_timeZone_, v22, v23);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v24;
}

uint64_t type metadata accessor for BrandPlacecardViewControllerObjcShim()
{
  return self;
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

uint64_t sub_23F998DE0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23F998E40()
{
  unint64_t result = qword_268C5BD60;
  if (!qword_268C5BD60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C5BD60);
  }
  return result;
}

id Brand.primaryBrandColor.getter()
{
  return sub_23F998F44(MEMORY[0x263F2BD38]);
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

id Brand.secondaryBrandColor.getter()
{
  return sub_23F998F44(MEMORY[0x263F2BD40]);
}

id sub_23F998F44(void (*a1)(uint64_t, uint64_t))
{
  sub_23F9A6250();
  uint64_t v2 = v10;
  uint64_t v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  a1(v2, v3);
  id v5 = v4;
  if (v4)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    id v6 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v7 = (void *)sub_23F9A67E0();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v6, sel_initWithHexString_, v7);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  return v5;
}

void __swiftcall Brand.makeBrandPlacecardViewController()(UIViewController *__return_ptr retstr)
{
  sub_23F9A6260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD58);
  if (swift_dynamicCast())
  {
    -[BSUIMapItem makePlacecardViewController](v1);
  }
  else
  {
    __break(1u);
  }
}

ValueMetadata *type metadata accessor for BSUIMapItemWrapper()
{
  return &type metadata for BSUIMapItemWrapper;
}

uint64_t initializeBufferWithCopyOfBuffer for MapKitBrandDataSource(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MapKitBrandDataSource(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for MapKitBrandDataSource(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for MapKitBrandDataSource(uint64_t *a1, uint64_t *a2)
{
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MapKitBrandDataSource(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapKitBrandDataSource(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MapKitBrandDataSource(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MapKitBrandDataSource()
{
  return &type metadata for MapKitBrandDataSource;
}

uint64_t sub_23F999480(uint64_t a1, unint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (qword_268C5BD40 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_23F9A62A0();
  __swift_project_value_buffer(v12, (uint64_t)qword_268C5C950);
  swift_bridgeObjectRetain_n();
  v13 = sub_23F9A6280();
  os_log_type_t v14 = sub_23F9A68D0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v6;
    uint64_t v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v27[0] = sub_23F99ACAC(a1, a2, aBlock);
    sub_23F9A6910();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23F996000, v13, v14, "Fetching brand with URI: %s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v6 = v25;
    MEMORY[0x2455D7B80](v17, -1, -1);
    MEMORY[0x2455D7B80](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  self;
  id v18 = +[BSUIMapService sharedService]();
  uint64_t v19 = (void *)sub_23F9A67E0();
  id v20 = -[BSUIMapService ticketForBrandLookupWithIMessageUid:]((uint64_t)v18, (uint64_t)v19);

  sub_23F99861C(v6, (uint64_t)v27);
  uint64_t v21 = swift_allocObject();
  long long v22 = v27[1];
  *(_OWORD *)(v21 + 56) = v27[0];
  *(void *)(v21 + 16) = a1;
  *(void *)(v21 + 24) = a2;
  *(unsigned char *)(v21 + 32) = a3 & 1;
  *(void *)(v21 + 40) = a4;
  *(void *)(v21 + 48) = a5;
  *(_OWORD *)(v21 + 72) = v22;
  *(void *)(v21 + 88) = v28;
  aBlock[4] = (uint64_t)sub_23F99AC80;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23F99AA60;
  aBlock[3] = (uint64_t)&block_descriptor;
  v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [(_BSUIMapServiceTicket *)v20 submitWithHandler:v23];
  _Block_release(v23);
  return swift_unknownObjectRelease();
}

uint64_t sub_23F999794(unint64_t a1, void *a2, void (*a3)(char *, uint64_t, uint64_t), unint64_t a4, int a5, void (*a6)(uint64_t *), uint64_t a7, uint64_t a8)
{
  uint64_t v152 = a8;
  v156 = a6;
  uint64_t v157 = a7;
  LODWORD(v154) = a5;
  v155 = a3;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD78);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  os_log_type_t v14 = (char *)&v139 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v139 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v139 - v18;
  uint64_t v20 = sub_23F9A61D0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  id v24 = (char *)&v139 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v26 = (char *)&v139 - v25;
  uint64_t v27 = sub_23F9A61B0();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  v31 = (char *)&v139 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    v151 = v24;
    uint64_t v152 = v21;
    uint64_t v154 = (uint64_t)v26;
    if (a1)
    {
      v46 = v19;
      uint64_t v47 = v20;
      unint64_t v153 = a4;
      uint64_t v48 = a1 & 0xFFFFFFFFFFFFFF8;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v49 = sub_23F9A69A0();
      }
      else
      {
        uint64_t v49 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      uint64_t v50 = v47;
      v51 = v14;
      if (v49)
      {
        v52 = v17;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v54 = (id *)MEMORY[0x2455D75F0](0, a1);
          unint64_t v55 = v153;
          v53 = v46;
        }
        else
        {
          if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_76:
            swift_once();
LABEL_66:
            uint64_t v120 = sub_23F9A62A0();
            __swift_project_value_buffer(v120, (uint64_t)qword_268C5C950);
            uint64_t v121 = v152;
            v122 = v151;
            v155 = *(void (**)(char *, uint64_t, uint64_t))(v152 + 16);
            v155(v151, v48, v50);
            v123 = sub_23F9A6280();
            os_log_type_t v124 = sub_23F9A68B0();
            if (os_log_type_enabled(v123, v124))
            {
              v125 = (uint8_t *)swift_slowAlloc();
              uint64_t v126 = swift_slowAlloc();
              unint64_t v153 = v50;
              v127 = v122;
              uint64_t v128 = v126;
              v160[0] = v126;
              *(_DWORD *)v125 = 136315138;
              sub_23F99B4BC(&qword_268C5BDA0, MEMORY[0x263F2BD50]);
              uint64_t v129 = sub_23F9A69C0();
              *(void *)&v158[0] = sub_23F99ACAC(v129, v130, v160);
              sub_23F9A6910();
              swift_bridgeObjectRelease();
              v131 = *(void (**)(char *, unint64_t))(v121 + 8);
              v132 = v127;
              uint64_t v50 = v153;
              v131(v132, v153);
              _os_log_impl(&dword_23F996000, v123, v124, "Fetched brand with model: %s", v125, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2455D7B80](v128, -1, -1);
              v133 = v125;
              uint64_t v48 = v154;
              MEMORY[0x2455D7B80](v133, -1, -1);
            }
            else
            {
              v131 = *(void (**)(char *, unint64_t))(v121 + 8);
              v131(v122, v50);
            }

            uint64_t v161 = v50;
            uint64_t v162 = v144;
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v160);
            v155((char *)boxed_opaque_existential_1, v48, v50);
            v164 = &type metadata for BSUIMapItemWrapper;
            unint64_t v165 = sub_23F99B468();
            v163 = v150;
            char v166 = 0;
            v135 = v150;
            v156(v160);

            v131((char *)v48, v50);
            return sub_23F99B3A4((uint64_t)v160);
          }
          v53 = v46;
          v54 = (id *)*(id *)(a1 + 32);
          unint64_t v55 = v153;
        }
        swift_bridgeObjectRelease();
        v56 = -[BSUIMapItem name](v54);
        if (!v56)
        {
          if (qword_268C5BD40 != -1) {
            swift_once();
          }
          uint64_t v94 = sub_23F9A62A0();
          __swift_project_value_buffer(v94, (uint64_t)qword_268C5C950);
          swift_bridgeObjectRetain_n();
          v95 = sub_23F9A6280();
          os_log_type_t v96 = sub_23F9A68D0();
          if (os_log_type_enabled(v95, v96))
          {
            v97 = (uint8_t *)swift_slowAlloc();
            unint64_t v98 = v55;
            uint64_t v99 = swift_slowAlloc();
            v160[0] = v99;
            *(_DWORD *)v97 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)&v158[0] = sub_23F99ACAC((uint64_t)v155, v98, v160);
            sub_23F9A6910();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23F996000, v95, v96, "Found a brand with URI: %s but it was missing the name", v97, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2455D7B80](v99, -1, -1);
            MEMORY[0x2455D7B80](v97, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v136 = sub_23F9A6200();
          sub_23F99B4BC(&qword_268C5BD80, MEMORY[0x263F2BD70]);
          uint64_t v137 = swift_allocError();
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v136 - 8) + 104))(v138, *MEMORY[0x263F2BD60], v136);
          v160[0] = v137;
          char v166 = 1;
          v156(v160);

          return sub_23F99B3A4((uint64_t)v160);
        }
        v57 = v56;
        sub_23F9A67F0();
        uint64_t v149 = v58;

        v59 = -[BSUIMapItem phoneNumber](v54);
        if (v59)
        {
          v60 = v59;
          uint64_t v148 = sub_23F9A67F0();
          uint64_t v147 = v61;
        }
        else
        {
          uint64_t v148 = 0;
          uint64_t v147 = 0;
        }
        v107 = -[BSUIMapItem _navBackgroundbrandColor](v54);
        if (v107)
        {
          v108 = v107;
          uint64_t v146 = sub_23F99B658();
          uint64_t v145 = v109;
        }
        else
        {
          uint64_t v146 = 0;
          uint64_t v145 = 0;
        }
        v110 = -[BSUIMapItem _navTintBrandColor](v54);
        if (v110)
        {
          v111 = v110;
          uint64_t v143 = sub_23F99B658();
          uint64_t v142 = v112;
        }
        else
        {
          uint64_t v143 = 0;
          uint64_t v142 = 0;
        }
        int isMessage = -[BSUIMapItem _isMessageIDVerified]((uint64_t)v54);
        v113 = -[BSUIMapItem url](v54);
        v150 = v54;
        if (v113)
        {
          v114 = v113;
          sub_23F9A60B0();

          uint64_t v115 = sub_23F9A60E0();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v115 - 8) + 56))(v53, 0, 1, v115);
        }
        else
        {
          uint64_t v115 = sub_23F9A60E0();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v115 - 8) + 56))(v53, 1, 1, v115);
        }
        sub_23F9A60E0();
        v116 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v115 - 8) + 56);
        v116(v52, 1, 1, v115);
        v117 = -[BSUIMapItem _localizedResponseTime](v150);
        if (v117)
        {
          v118 = v117;
          uint64_t v140 = sub_23F9A67F0();
        }
        else
        {
          uint64_t v140 = 0;
        }
        v116(v51, 1, 1, v115);
        uint64_t v119 = sub_23F99B4BC(&qword_268C5BD90, MEMORY[0x263F2BD50]);
        swift_bridgeObjectRetain();
        uint64_t v144 = v119;
        uint64_t v48 = v154;
        sub_23F9A61C0();
        if (qword_268C5BD40 == -1) {
          goto LABEL_66;
        }
        goto LABEL_76;
      }
      swift_bridgeObjectRelease();
      a4 = v153;
    }
    if (qword_268C5BD40 != -1) {
      swift_once();
    }
    uint64_t v85 = sub_23F9A62A0();
    __swift_project_value_buffer(v85, (uint64_t)qword_268C5C950);
    swift_bridgeObjectRetain_n();
    v86 = sub_23F9A6280();
    os_log_type_t v87 = sub_23F9A68D0();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc();
      unint64_t v89 = a4;
      uint64_t v90 = swift_slowAlloc();
      v160[0] = v90;
      *(_DWORD *)v88 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v158[0] = sub_23F99ACAC((uint64_t)v155, v89, v160);
      sub_23F9A6910();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23F996000, v86, v87, "Failed to find a brand with URI: %s - no results returned", v88, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455D7B80](v90, -1, -1);
      MEMORY[0x2455D7B80](v88, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v91 = sub_23F9A6200();
    sub_23F99B4BC(&qword_268C5BD80, MEMORY[0x263F2BD70]);
    uint64_t v92 = swift_allocError();
    void *v93 = 0;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v91 - 8) + 104))(v93, *MEMORY[0x263F2BD68], v91);
    v160[0] = v92;
    char v166 = 1;
    v156(v160);
    return sub_23F99B3A4((uint64_t)v160);
  }
  v32 = v31;
  uint64_t v33 = v29;
  v151 = (char *)v28;
  id v34 = a2;
  if (qword_268C5BD40 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_23F9A62A0();
  __swift_project_value_buffer(v35, (uint64_t)qword_268C5C950);
  id v36 = a2;
  swift_bridgeObjectRetain();
  id v37 = a2;
  swift_bridgeObjectRetain();
  v38 = sub_23F9A6280();
  os_log_type_t v39 = sub_23F9A68D0();
  BOOL v40 = os_log_type_enabled(v38, v39);
  unint64_t v153 = a4;
  if (v40)
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v160[0] = v42;
    *(_DWORD *)uint64_t v41 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)&v158[0] = sub_23F99ACAC((uint64_t)v155, a4, v160);
    sub_23F9A6910();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v41 + 12) = 2080;
    *(void *)&v158[0] = a2;
    id v43 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDA8);
    uint64_t v44 = sub_23F9A6810();
    *(void *)&v158[0] = sub_23F99ACAC(v44, v45, v160);
    sub_23F9A6910();
    swift_bridgeObjectRelease();

    *(_WORD *)(v41 + 22) = 1024;
    LODWORD(v158[0]) = v154 & 1;
    sub_23F9A6910();
    _os_log_impl(&dword_23F996000, v38, v39, "Failed to fetch brand with URI: %s error: %s isNetworkRetry: %{BOOL}d", (uint8_t *)v41, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2455D7B80](v42, -1, -1);
    MEMORY[0x2455D7B80](v41, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  v62 = (void *)sub_23F9A60A0();
  id v63 = objc_msgSend(v62, sel_domain);
  uint64_t v64 = sub_23F9A67F0();
  uint64_t v66 = v65;

  id v67 = objc_msgSend(v62, sel_code);
  if (sub_23F9A67F0() == v64 && v68 == v66)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v69 = sub_23F9A69D0();
    swift_bridgeObjectRelease();
    if ((v69 & 1) == 0) {
      goto LABEL_22;
    }
  }
  if (v67 != (id)4)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    id v70 = (id)GEOErrorDomain();
    if (v70)
    {
      v71 = v70;
      uint64_t v72 = sub_23F9A67F0();
      uint64_t v74 = v73;

      if (v72 == v64 && v74 == v66)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v75 = sub_23F9A69D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v75 & 1) == 0) {
          goto LABEL_31;
        }
      }
      if (v67 == (id)-8) {
        goto LABEL_29;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
LABEL_31:
    if (sub_23F9A67F0() == v64 && v80 == v66)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v81 = sub_23F9A69D0();
      swift_bridgeObjectRelease();
      if ((v81 & 1) == 0) {
        goto LABEL_38;
      }
    }
    sub_23F9A6190();
    uint64_t v82 = sub_23F9A61A0();
    (*(void (**)(char *, char *))(v33 + 8))(v32, v151);
    if ((id)v82 == v67)
    {
      if ((v154 & 1) == 0)
      {
        uint64_t v100 = v152;
        sub_23F99B504(v152, (uint64_t)v160);
        __swift_project_boxed_opaque_existential_1(v160, v161);
        sub_23F99861C(v100, (uint64_t)v158);
        uint64_t v101 = swift_allocObject();
        long long v102 = v158[1];
        *(_OWORD *)(v101 + 16) = v158[0];
        *(_OWORD *)(v101 + 32) = v102;
        v103 = v155;
        *(void *)(v101 + 48) = v159;
        *(void *)(v101 + 56) = v103;
        v104 = v156;
        uint64_t v105 = v157;
        *(void *)(v101 + 64) = v153;
        *(void *)(v101 + 72) = v104;
        *(void *)(v101 + 80) = v105;
        swift_bridgeObjectRetain();
        swift_retain();
        sub_23F9A6240();

        swift_release();
        swift_bridgeObjectRelease();

        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
      }
      v160[0] = (uint64_t)a2;
      char v166 = 1;
      id v83 = a2;
      v156(v160);

      goto LABEL_30;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    v160[0] = (uint64_t)a2;
    char v166 = 1;
    id v84 = a2;
    v156(v160);

    goto LABEL_39;
  }
LABEL_29:
  uint64_t v76 = sub_23F9A6200();
  sub_23F99B4BC(&qword_268C5BD80, MEMORY[0x263F2BD70]);
  uint64_t v77 = swift_allocError();
  void *v78 = v62;
  (*(void (**)(void *, void, uint64_t))(*(void *)(v76 - 8) + 104))(v78, *MEMORY[0x263F2BD68], v76);
  v160[0] = v77;
  char v166 = 1;
  id v79 = v62;
  v156(v160);

LABEL_30:
  swift_bridgeObjectRelease();
LABEL_39:

  return sub_23F99B3A4((uint64_t)v160);
}

uint64_t sub_23F99AA60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_23F99B364();
    uint64_t v4 = sub_23F9A6880();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23F99AAF4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23F999480(a1, a2, 0, a3, a4);
}

uint64_t sub_23F99AB08@<X0>(uint64_t a1@<X8>)
{
  return sub_23F99AB38((uint64_t (*)(void, uint64_t))-[BSUIMapItem _bestBrandIconURLForSize:allowSmaller:], a1);
}

uint64_t sub_23F99AB20@<X0>(uint64_t a1@<X8>)
{
  return sub_23F99AB38((uint64_t (*)(void, uint64_t))-[BSUIMapItem _bestNavbarBrandIconURLForSize:allowSmaller:], a1);
}

uint64_t sub_23F99AB38@<X0>(uint64_t (*a1)(void, uint64_t)@<X2>, uint64_t a2@<X8>)
{
  id v4 = (id)a1(*v2, 1);
  if (v4)
  {
    uint64_t v5 = v4;
    sub_23F9A60B0();

    uint64_t v6 = sub_23F9A60E0();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
    uint64_t v8 = v6;
    uint64_t v9 = a2;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = sub_23F9A60E0();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v8 = v11;
    uint64_t v9 = a2;
    uint64_t v10 = 1;
  }

  return v7(v9, v10, 1, v8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23F99AC38()
{
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_23F99AC80(unint64_t a1, void *a2)
{
  return sub_23F999794(a1, a2, *(void (**)(char *, uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void (**)(uint64_t *))(v2 + 40), *(void *)(v2 + 48), v2 + 56);
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

uint64_t sub_23F99ACAC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23F99AD80(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23F99B304((uint64_t)v12, *a3);
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
      sub_23F99B304((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23F99AD80(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23F9A6920();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23F99AF3C(a5, a6);
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
  uint64_t v8 = sub_23F9A6980();
  if (!v8)
  {
    sub_23F9A6990();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23F9A69B0();
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

uint64_t sub_23F99AF3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23F99AFD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23F99B1B4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23F99B1B4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23F99AFD4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23F99B14C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23F9A6960();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23F9A6990();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23F9A6860();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23F9A69B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23F9A6990();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23F99B14C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD68);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23F99B1B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD68);
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
  uint64_t result = sub_23F9A69B0();
  __break(1u);
  return result;
}

uint64_t sub_23F99B304(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23F99B364()
{
  unint64_t result = qword_268C5BD70;
  if (!qword_268C5BD70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C5BD70);
  }
  return result;
}

uint64_t sub_23F99B3A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD88);
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

unint64_t sub_23F99B468()
{
  unint64_t result = qword_268C5BD98;
  if (!qword_268C5BD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BD98);
  }
  return result;
}

uint64_t sub_23F99B4BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23F99B504(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23F99B568()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_23F99B5B0()
{
  return sub_23F999480(v0[7], v0[8], 1, v0[9], v0[10]);
}

UIColor_optional __swiftcall UIColor.init(hexString:)(Swift::String hexString)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v2 = (void *)sub_23F9A67E0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (objc_class *)objc_msgSend(v1, sel_initWithHexString_, v2);

  size_t v5 = v3;
  result.value.super.isa = v5;
  result.is_nil = v4;
  return result;
}

uint64_t sub_23F99B658()
{
  id v1 = objc_msgSend(v0, sel_CGColor);
  uint64_t v2 = sub_23F9A68A0();

  if (!v2) {
    return 0;
  }
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 < 3)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  float v5 = *(double *)(v2 + 32);
  float v6 = *(double *)(v2 + 40);
  float v7 = *(double *)(v2 + 48);
  if (v3 == 3)
  {
    swift_bridgeObjectRelease();
    float v8 = 255.0;
  }
  else
  {
    double v9 = *(double *)(v2 + 56);
    swift_bridgeObjectRelease();
    float v10 = v9;
    float v8 = v10 * 255.0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDB8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23F9A7A10;
  uint64_t v12 = lroundf(v5 * 255.0);
  uint64_t v13 = MEMORY[0x263F8D6C8];
  uint64_t v14 = MEMORY[0x263F8D750];
  *(void *)(v11 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v11 + 64) = v14;
  *(void *)(v11 + 32) = v12;
  uint64_t v15 = lroundf(v6 * 255.0);
  *(void *)(v11 + 96) = v13;
  *(void *)(v11 + 104) = v14;
  *(void *)(v11 + 72) = v15;
  uint64_t v16 = lroundf(v7 * 255.0);
  *(void *)(v11 + 136) = v13;
  *(void *)(v11 + 144) = v14;
  *(void *)(v11 + 112) = v16;
  uint64_t v17 = lroundf(v8);
  *(void *)(v11 + 176) = v13;
  *(void *)(v11 + 184) = v14;
  *(void *)(v11 + 152) = v17;
  return sub_23F9A6800();
}

id UIColor.init(hexString:)(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_23F9A6080();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v23 = a1;
  uint64_t v24 = a2;
  sub_23F9A6070();
  sub_23F99BAA0();
  uint64_t v10 = sub_23F9A6930();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  unint64_t v23 = v10;
  uint64_t v24 = v12;
  v22[3] = 35;
  v22[4] = 0xE100000000000000;
  v22[1] = 0;
  v22[2] = 0xE000000000000000;
  sub_23F9A6940();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0;
  uint64_t v13 = sub_23F9A6830();
  id v14 = objc_allocWithZone(MEMORY[0x263F08B08]);
  uint64_t v15 = (void *)sub_23F9A67E0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v14, sel_initWithString_, v15);

  LODWORD(v15) = objc_msgSend(v16, sel_scanHexLongLong_, &v23);
  if (!v15) {
    goto LABEL_5;
  }
  if (v13 == 8)
  {
    unint64_t v18 = v23 >> 24;
    unint64_t v19 = v23 >> 16;
    unint64_t v17 = v23 >> 8;
    double v20 = (double)v23 / 255.0;
    return objc_msgSend(v3, sel_initWithRed_green_blue_alpha_, (double)v18 / 255.0, (double)v19 / 255.0, (double)v17 / 255.0, v20);
  }
  if (v13 != 6)
  {
LABEL_5:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  LOBYTE(v17) = v23;
  unint64_t v18 = v23 >> 16;
  unint64_t v19 = v23 >> 8;
  double v20 = 1.0;
  return objc_msgSend(v3, sel_initWithRed_green_blue_alpha_, (double)v18 / 255.0, (double)v19 / 255.0, (double)v17 / 255.0, v20);
}

unint64_t sub_23F99BAA0()
{
  unint64_t result = qword_268C5BDB0;
  if (!qword_268C5BDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BDB0);
  }
  return result;
}

id sub_23F99BAF4()
{
  unint64_t v0 = sub_23F9A67F0();
  return UIColor.init(hexString:)(v0, v1);
}

uint64_t BrandCardContentView.init(brand:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t BrandCardContentView.body.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDC0);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (void *)((char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDC8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = *v0;
  if (*v0)
  {
    MEMORY[0x270FA5388](v6);
    v13[-2] = v9;
    v13[1] = 0;
    id v10 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDE8);
    sub_23F9A6710();
    long long v11 = v14;
    uint64_t v15 = 0;
    long long v14 = (unint64_t)v9;
    long long v16 = v11;
    sub_23F99BE7C();
    sub_23F99BED0();
    sub_23F9A6760();
    (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(v3, v8, v4);
    swift_storeEnumTagMultiPayload();
    sub_23F99BDAC();
    sub_23F9A64F0();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    *unint64_t v3 = sub_23F9A6690();
    swift_storeEnumTagMultiPayload();
    sub_23F99BDAC();
    return sub_23F9A64F0();
  }
}

unint64_t sub_23F99BDAC()
{
  unint64_t result = qword_268C5BDD0;
  if (!qword_268C5BDD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BDC8);
    sub_23F99BE7C();
    sub_23F99BED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BDD0);
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

unint64_t sub_23F99BE7C()
{
  unint64_t result = qword_268C5BDD8;
  if (!qword_268C5BDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BDD8);
  }
  return result;
}

unint64_t sub_23F99BED0()
{
  unint64_t result = qword_268C5BDE0;
  if (!qword_268C5BDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BDE0);
  }
  return result;
}

id sub_23F99BF24@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_23F99BF30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F99BF54()
{
  return sub_23F9A6650();
}

void **initializeBufferWithCopyOfBuffer for BrandCardContentView(void **a1, void **a2)
{
  unint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for BrandCardContentView(id *a1)
{
}

void **assignWithCopy for BrandCardContentView(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for BrandCardContentView(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for BrandCardContentView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
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

uint64_t storeEnumTagSinglePayload for BrandCardContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandCardContentView()
{
  return &type metadata for BrandCardContentView;
}

unint64_t sub_23F99C0E4()
{
  unint64_t result = qword_268C5BDF0;
  if (!qword_268C5BDF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BDF8);
    sub_23F99BDAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BDF0);
  }
  return result;
}

__n128 BrandHeaderView.init(brand:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDE8);
  sub_23F9A6710();
  __n128 result = v5;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = a1;
  *(__n128 *)(a2 + 24) = v5;
  return result;
}

__n128 BrandHeaderView.init(brand:fallbackHandle:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDE8);
  sub_23F9A6710();
  __n128 result = v9;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  *(__n128 *)(a4 + 24) = v9;
  return result;
}

uint64_t sub_23F99C22C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  if (!*(void *)v0)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    if (!v2) {
      goto LABEL_34;
    }
    goto LABEL_21;
  }
  id v3 = *(id *)v0;
  id v4 = objc_msgSend(v3, sel_name);
  uint64_t v5 = sub_23F9A67F0();
  unint64_t v7 = v6;

  swift_bridgeObjectRelease();
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v8) {
    goto LABEL_5;
  }
  uint64_t v9 = (uint64_t)objc_msgSend(v3, sel_primaryPhoneNumber);
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v18 = sub_23F9A67F0();
  unint64_t v20 = v19;

  swift_bridgeObjectRelease();
  uint64_t v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
  }
  if (!v21 || (id v22 = objc_msgSend(v3, sel_primaryPhoneNumber)) == 0)
  {
LABEL_5:
    uint64_t v9 = 0;
LABEL_6:
    unint64_t v10 = 0;
    goto LABEL_7;
  }
  unint64_t v23 = v22;
  uint64_t v9 = sub_23F9A67F0();
  unint64_t v10 = v24;

LABEL_7:
  id v11 = objc_msgSend(v3, sel_name);
  uint64_t v12 = sub_23F9A67F0();
  unint64_t v14 = v13;

  swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (v15)
  {
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v3, sel_name);
    uint64_t v9 = sub_23F9A67F0();
    unint64_t v10 = v17;

    if (!v2) {
      goto LABEL_34;
    }
  }
  else
  {

    if (!v2) {
      goto LABEL_34;
    }
  }
LABEL_21:
  uint64_t v25 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v25 = v1 & 0xFFFFFFFFFFFFLL;
  }
  if (v25)
  {
    uint64_t v26 = v9 & 0xFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v10) {
      unint64_t v27 = v10;
    }
    else {
      unint64_t v27 = 0xE000000000000000;
    }
    if (!v10) {
      uint64_t v26 = 0;
    }
    swift_bridgeObjectRelease();
    if ((v27 & 0x2000000000000000) != 0) {
      uint64_t v28 = HIBYTE(v27) & 0xF;
    }
    else {
      uint64_t v28 = v26;
    }
    if (!v28)
    {
      swift_bridgeObjectRelease();
      return v1;
    }
    swift_bridgeObjectRelease();
  }
LABEL_34:
  if (!v10)
  {
    id v29 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v31 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

    uint64_t v9 = sub_23F9A6090();
  }
  return v9;
}

uint64_t sub_23F99C500()
{
  uint64_t v1 = sub_23F9A63E0();
  MEMORY[0x270FA5388](v1 - 8);
  if (!*v0) {
    goto LABEL_10;
  }
  id v2 = *v0;
  if (!objc_msgSend(v2, sel_isRCSChatBot)
    || !objc_msgSend(v2, sel_isVerified)
    || (id v3 = objc_msgSend(v2, sel_verifiedBy)) == 0)
  {
    if (objc_msgSend(v2, sel_isVerified))
    {
      id v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
      swift_getObjectType();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

      sub_23F9A6090();
      sub_23F9A63D0();
      sub_23F9A63C0();
      sub_23F9A66E0();
      sub_23F9A63A0();
      swift_release();
      sub_23F9A63C0();
      sub_23F9A63B0();
      swift_bridgeObjectRelease();
      sub_23F9A63C0();
      sub_23F9A63F0();
      uint64_t v12 = sub_23F9A6600();
      goto LABEL_8;
    }

LABEL_10:
    id v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    uint64_t v18 = swift_getObjCClassFromMetadata();
    id v19 = objc_msgSend(self, sel_bundleForClass_, v18);

    sub_23F9A6090();
    sub_23F99BAA0();
    return sub_23F9A6610();
  }
  id v4 = v3;
  uint64_t v5 = sub_23F9A67F0();
  uint64_t v7 = v6;

  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t v9 = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, v9);

  sub_23F9A6090();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BDB8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23F9A7AA0;
  *(void *)(v11 + 56) = MEMORY[0x263F8D310];
  *(void *)(v11 + 64) = sub_23F9A03F0();
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v7;
  sub_23F9A6800();
  swift_bridgeObjectRelease();
  sub_23F99BAA0();
  uint64_t v12 = sub_23F9A6610();
LABEL_8:
  uint64_t v16 = v12;

  return v16;
}

uint64_t BrandHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = v1;
  uint64_t v68 = a1;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE00);
  MEMORY[0x270FA5388](v63);
  v59 = (uint64_t *)((char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE08);
  MEMORY[0x270FA5388](v57);
  uint64_t v5 = (_OWORD *)((char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE10);
  uint64_t v6 = MEMORY[0x270FA5388](v67);
  uint64_t v58 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v60 = (char *)&v56 - v8;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE18);
  MEMORY[0x270FA5388](v65);
  uint64_t v66 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE20);
  MEMORY[0x270FA5388](v10 - 8);
  v62 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE28);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE30);
  MEMORY[0x270FA5388](v15 - 8);
  id v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE38);
  MEMORY[0x270FA5388](v18);
  unint64_t v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE40);
  MEMORY[0x270FA5388](v61);
  id v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE48);
  uint64_t v23 = MEMORY[0x270FA5388](v64);
  uint64_t v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  unint64_t v27 = (char *)&v56 - v26;
  long long v28 = v2[1];
  long long v75 = *v2;
  long long v76 = v28;
  uint64_t v77 = *((void *)v2 + 4);
  if ((void)v75)
  {
    id v29 = (char *)(id)v75;
    v60 = v29;
    *(void *)unint64_t v14 = sub_23F9A6410();
    *((void *)v14 + 1) = 0;
    v14[16] = 0;
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BEB0);
    sub_23F99D294((uint64_t)&v75, v29, (uint64_t)&v14[*(int *)(v30 + 44)]);
    sub_23F9A6780();
    sub_23F99E0AC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, 0.0, 1);
    sub_23F9A0394((uint64_t)v14, &qword_268C5BE28);
    uint64_t v31 = sub_23F9A65E0();
    uint64_t v32 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v62, 1, 1, v31);
    uint64_t KeyPath = swift_getKeyPath();
    id v34 = (uint64_t *)&v20[*(int *)(v18 + 36)];
    sub_23F9A0330(v32, (uint64_t)v34 + *(int *)(v63 + 28), &qword_268C5BE20);
    *id v34 = KeyPath;
    sub_23F9A0330((uint64_t)v17, (uint64_t)v20, &qword_268C5BE30);
    sub_23F9A0394(v32, &qword_268C5BE20);
    sub_23F9A0394((uint64_t)v17, &qword_268C5BE30);
    LODWORD(KeyPath) = sub_23F9A6500();
    sub_23F9A0330((uint64_t)v20, (uint64_t)v22, &qword_268C5BE38);
    *(_DWORD *)&v22[*(int *)(v61 + 36)] = KeyPath;
    sub_23F9A0394((uint64_t)v20, &qword_268C5BE38);
    uint64_t v35 = swift_allocObject();
    id v36 = v60;
    *(void *)(v35 + 16) = v60;
    long long v37 = v76;
    *(_OWORD *)(v35 + 24) = v75;
    *(_OWORD *)(v35 + 40) = v37;
    *(void *)(v35 + 56) = v77;
    sub_23F9A0330((uint64_t)v22, (uint64_t)v25, &qword_268C5BE40);
    v38 = (void (**)())&v25[*(int *)(v64 + 36)];
    NSObject *v38 = sub_23F99F668;
    v38[1] = (void (*)())v35;
    v38[2] = 0;
    v38[3] = 0;
    id v39 = v36;
    sub_23F99F674((uint64_t)&v75);
    sub_23F9A0394((uint64_t)v22, &qword_268C5BE40);
    sub_23F9A02CC((uint64_t)v25, (uint64_t)v27, &qword_268C5BE48);
    sub_23F9A0330((uint64_t)v27, v66, &qword_268C5BE48);
    swift_storeEnumTagMultiPayload();
    sub_23F99FFB4(&qword_268C5BE50, &qword_268C5BE48, (void (*)(void))sub_23F99F2CC);
    sub_23F99F4AC();
    sub_23F9A64F0();

    uint64_t v40 = (uint64_t)v27;
    uint64_t v41 = &qword_268C5BE48;
  }
  else
  {
    uint64_t v42 = sub_23F9A6410();
    sub_23F99E6B8((uint64_t)&v75, (uint64_t)v69);
    *(_OWORD *)&v71[151] = v69[9];
    *(_OWORD *)&v71[167] = v69[10];
    *(_OWORD *)&v71[183] = v69[11];
    v71[199] = v70;
    *(_OWORD *)&v71[87] = v69[5];
    *(_OWORD *)&v71[103] = v69[6];
    *(_OWORD *)&v71[119] = v69[7];
    *(_OWORD *)&v71[135] = v69[8];
    *(_OWORD *)&v71[23] = v69[1];
    *(_OWORD *)&v71[39] = v69[2];
    *(_OWORD *)&v71[55] = v69[3];
    *(_OWORD *)&v71[71] = v69[4];
    *(_OWORD *)&v71[7] = v69[0];
    *(_OWORD *)((char *)&v74[9] + 1) = *(_OWORD *)&v71[144];
    *(_OWORD *)((char *)&v74[10] + 1) = *(_OWORD *)&v71[160];
    *(_OWORD *)((char *)&v74[11] + 1) = *(_OWORD *)&v71[176];
    *(_OWORD *)((char *)&v74[5] + 1) = *(_OWORD *)&v71[80];
    *(_OWORD *)((char *)&v74[6] + 1) = *(_OWORD *)&v71[96];
    *(_OWORD *)((char *)&v74[7] + 1) = *(_OWORD *)&v71[112];
    *(_OWORD *)((char *)&v74[8] + 1) = *(_OWORD *)&v71[128];
    *(_OWORD *)((char *)&v74[1] + 1) = *(_OWORD *)&v71[16];
    *(_OWORD *)((char *)&v74[2] + 1) = *(_OWORD *)&v71[32];
    *(_OWORD *)((char *)&v74[3] + 1) = *(_OWORD *)&v71[48];
    *(_OWORD *)((char *)&v74[4] + 1) = *(_OWORD *)&v71[64];
    char v72 = 0;
    long long v73 = (unint64_t)v42;
    LOBYTE(v74[0]) = 0;
    *(void *)((char *)&v74[12] + 1) = *(void *)&v71[192];
    *(_OWORD *)((char *)v74 + 1) = *(_OWORD *)v71;
    uint64_t v43 = sub_23F9A65E0();
    uint64_t v44 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v62, 1, 1, v43);
    uint64_t v45 = swift_getKeyPath();
    v46 = v59;
    sub_23F9A0330(v44, (uint64_t)v59 + *(int *)(v63 + 28), &qword_268C5BE20);
    uint64_t *v46 = v45;
    sub_23F9A0330((uint64_t)v46, (uint64_t)v5 + *(int *)(v57 + 36), &qword_268C5BE00);
    long long v47 = v74[10];
    v5[10] = v74[9];
    v5[11] = v47;
    v5[12] = v74[11];
    *(_OWORD *)((char *)v5 + 201) = *(_OWORD *)((char *)&v74[11] + 9);
    long long v48 = v74[6];
    v5[6] = v74[5];
    v5[7] = v48;
    long long v49 = v74[8];
    v5[8] = v74[7];
    v5[9] = v49;
    long long v50 = v74[2];
    v5[2] = v74[1];
    v5[3] = v50;
    long long v51 = v74[4];
    v5[4] = v74[3];
    v5[5] = v51;
    long long v52 = v74[0];
    *uint64_t v5 = v73;
    v5[1] = v52;
    sub_23F99F238((uint64_t)&v73);
    sub_23F9A0394((uint64_t)v46, &qword_268C5BE00);
    sub_23F9A0394(v44, &qword_268C5BE20);
    sub_23F99F284((uint64_t)v69);
    LODWORD(v45) = sub_23F9A6500();
    uint64_t v53 = v58;
    sub_23F9A0330((uint64_t)v5, v58, &qword_268C5BE08);
    *(_DWORD *)(v53 + *(int *)(v67 + 36)) = v45;
    sub_23F9A0394((uint64_t)v5, &qword_268C5BE08);
    uint64_t v54 = (uint64_t)v60;
    sub_23F9A02CC(v53, (uint64_t)v60, &qword_268C5BE10);
    sub_23F9A0330(v54, v66, &qword_268C5BE10);
    swift_storeEnumTagMultiPayload();
    sub_23F99FFB4(&qword_268C5BE50, &qword_268C5BE48, (void (*)(void))sub_23F99F2CC);
    sub_23F99F4AC();
    sub_23F9A64F0();
    uint64_t v40 = v54;
    uint64_t v41 = &qword_268C5BE10;
  }
  return sub_23F9A0394(v40, v41);
}

uint64_t sub_23F99D294@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v146 = a3;
  uint64_t v5 = sub_23F9A65A0();
  uint64_t v162 = *(void *)(v5 - 8);
  uint64_t v163 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v161 = (char *)&v135 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BED0);
  MEMORY[0x270FA5388](v164);
  uint64_t v168 = (uint64_t)&v135 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_23F9A6300();
  MEMORY[0x270FA5388](v159);
  uint64_t v9 = (_OWORD *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_23F9A66F0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v135 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF08);
  MEMORY[0x270FA5388](v158);
  uint64_t v15 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF10);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v160 = (uint64_t)&v135 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v169 = (uint64_t)&v135 - v19;
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF18);
  MEMORY[0x270FA5388](v170);
  uint64_t v171 = (uint64_t)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF20);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v166 = (uint64_t)&v135 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v135 - v24;
  uint64_t v165 = a1;
  long long v191 = *(_OWORD *)(a1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF00);
  sub_23F9A6720();
  v167 = v25;
  if ((void)v180)
  {
    id v156 = (id)v180;
    sub_23F9A66D0();
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
    uint64_t v26 = sub_23F9A6700();
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    sub_23F9A6780();
    sub_23F9A62D0();
    uint64_t v27 = v211;
    char v28 = v212;
    uint64_t v154 = v213;
    uint64_t v155 = v16;
    int v153 = v214;
    uint64_t v157 = a2;
    uint64_t v29 = v215;
    uint64_t v152 = v216;
    uint64_t v30 = (char *)v9 + *(int *)(v159 + 20);
    uint64_t v31 = *MEMORY[0x263F19860];
    uint64_t v32 = sub_23F9A6400();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
    __asm { FMOV            V0.2D, #18.0 }
    *uint64_t v9 = _Q0;
    uint64_t v38 = v168;
    sub_23F99FCD8((uint64_t)v9, v168);
    *(_WORD *)(v38 + *(int *)(v164 + 36)) = 256;
    sub_23F9A0330(v38, (uint64_t)&v15[*(int *)(v158 + 36)], &qword_268C5BED0);
    *(void *)uint64_t v15 = v26;
    *((void *)v15 + 1) = 0;
    *((_WORD *)v15 + 8) = 1;
    *((void *)v15 + 3) = v27;
    v15[32] = v28;
    *((void *)v15 + 5) = v154;
    v15[48] = v153;
    *((void *)v15 + 7) = v29;
    a2 = v157;
    *((void *)v15 + 8) = v152;
    swift_retain();
    sub_23F9A0394(v38, &qword_268C5BED0);
    sub_23F99FD3C((uint64_t)v9);
    swift_release();
    LOBYTE(v26) = sub_23F9A6530();
    sub_23F9A62B0();
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v47 = v160;
    sub_23F9A0330((uint64_t)v15, v160, &qword_268C5BF08);
    uint64_t v48 = v47 + *(int *)(v155 + 36);
    *(unsigned char *)uint64_t v48 = v26;
    *(void *)(v48 + 8) = v40;
    *(void *)(v48 + 16) = v42;
    *(void *)(v48 + 24) = v44;
    *(void *)(v48 + 32) = v46;
    *(unsigned char *)(v48 + 40) = 0;
    sub_23F9A0394((uint64_t)v15, &qword_268C5BF08);
    uint64_t v49 = v169;
    sub_23F9A02CC(v47, v169, &qword_268C5BF10);
    sub_23F9A0330(v49, v171, &qword_268C5BF10);
    swift_storeEnumTagMultiPayload();
    sub_23F99FFB4(&qword_268C5BF28, &qword_268C5BF10, (void (*)(void))sub_23F9A0030);
    sub_23F9A0170();
    sub_23F9A64F0();

    sub_23F9A0394(v49, &qword_268C5BF10);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_23F99FFB4(&qword_268C5BF28, &qword_268C5BF10, (void (*)(void))sub_23F9A0030);
    sub_23F9A0170();
    sub_23F9A64F0();
  }
  uint64_t v50 = sub_23F99C22C();
  uint64_t v52 = v51;
  if (objc_msgSend(a2, sel_isRCSChatBot))
  {
    id v53 = objc_msgSend(a2, sel_brandURI);
    uint64_t v144 = sub_23F9A67F0();
    uint64_t v55 = v54;
  }
  else
  {
    uint64_t v144 = 0;
    uint64_t v55 = 0;
  }
  id v56 = objc_msgSend(a2, sel_categories);
  uint64_t v57 = (unsigned int *)MEMORY[0x263F1A680];
  uint64_t v171 = v52;
  uint64_t v164 = v55;
  uint64_t v145 = v50;
  if (!v56)
  {
    char v69 = (unsigned int *)MEMORY[0x263F1A680];
LABEL_17:
    uint64_t v150 = 0;
    uint64_t v151 = 0;
    uint64_t v169 = 0;
    uint64_t v170 = 0;
    uint64_t KeyPath = 0;
    uint64_t v149 = 0;
    uint64_t v147 = 0;
    uint64_t v168 = 0;
    goto LABEL_18;
  }
  uint64_t v58 = v56;
  v59 = (void *)sub_23F9A6880();

  if (!v59[2])
  {
    char v69 = v57;
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v61 = v59[4];
  unint64_t v60 = v59[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v62 = HIBYTE(v60) & 0xF;
  if ((v60 & 0x2000000000000000) == 0) {
    uint64_t v62 = v61 & 0xFFFFFFFFFFFFLL;
  }
  if (!v62)
  {
    char v69 = v57;
    goto LABEL_16;
  }
  *(void *)&long long v191 = v61;
  *((void *)&v191 + 1) = v60;
  sub_23F99BAA0();
  uint64_t v63 = sub_23F9A6610();
  uint64_t v65 = v64;
  uint64_t v169 = v66;
  char v68 = v67 & 1;
  sub_23F9A6550();
  char v69 = v57;
  uint64_t v70 = *v57;
  v71 = v161;
  uint64_t v72 = v162;
  uint64_t v73 = v163;
  (*(void (**)(char *, uint64_t, uint64_t))(v162 + 104))(v161, v70, v163);
  sub_23F9A65B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v74 = sub_23F9A65F0();
  uint64_t v150 = v75;
  uint64_t v151 = v74;
  char v77 = v76;
  uint64_t v149 = v78;
  swift_release();
  uint64_t v170 = v77 & 1;
  sub_23F99FC10(v63, v65, v68);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v147) = sub_23F9A6520();
  uint64_t v147 = v147;
  uint64_t v168 = 0x4000000000000000;
  uint64_t v169 = 1;
LABEL_18:
  uint64_t v79 = sub_23F99C500();
  uint64_t v81 = v80;
  char v83 = v82 & 1;
  sub_23F9A6540();
  uint64_t v84 = *v69;
  v86 = v161;
  uint64_t v85 = v162;
  uint64_t v87 = v163;
  (*(void (**)(char *, uint64_t, uint64_t))(v162 + 104))(v161, v84, v163);
  sub_23F9A65B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v87);
  uint64_t v88 = sub_23F9A65F0();
  uint64_t v141 = v89;
  uint64_t v142 = v88;
  LOBYTE(v87) = v90;
  id v156 = v91;
  swift_release();
  int v92 = v87 & 1;
  sub_23F99FC10(v79, v81, v83);
  swift_bridgeObjectRelease();
  int v140 = sub_23F9A6520();
  uint64_t v143 = sub_23F9A6690();
  sub_23F9A6780();
  sub_23F9A6310();
  unsigned __int8 v93 = v218;
  uint64_t v157 = v219;
  uint64_t v158 = v217;
  LOBYTE(v81) = v220;
  unsigned __int8 v94 = v222;
  uint64_t v155 = v223;
  LOBYTE(v85) = v224;
  uint64_t v159 = v225;
  uint64_t v160 = v221;
  LOBYTE(v86) = v226;
  uint64_t v165 = v227;
  unsigned __int8 v95 = v228;
  uint64_t v162 = v230;
  uint64_t v163 = v229;
  LODWORD(v161) = sub_23F9A6520();
  sub_23F9A62B0();
  uint64_t v97 = v96;
  uint64_t v99 = v98;
  uint64_t v101 = v100;
  uint64_t v103 = v102;
  unsigned __int8 v179 = v93;
  unsigned __int8 v178 = v81;
  unsigned __int8 v177 = v94;
  unsigned __int8 v176 = v85;
  unsigned __int8 v175 = v86;
  unsigned __int8 v174 = v95;
  unsigned __int8 v173 = 0;
  uint64_t v104 = v166;
  sub_23F9A0330((uint64_t)v167, v166, &qword_268C5BF20);
  LOBYTE(v85) = v87 & 1;
  char v172 = v87 & 1;
  LOBYTE(v87) = v179;
  int v135 = v92;
  int v136 = v179;
  LOBYTE(v86) = v178;
  LOBYTE(v92) = v177;
  int v137 = v178;
  int v138 = v177;
  unsigned __int8 v105 = v176;
  int v139 = v176;
  int v153 = v175;
  LODWORD(v154) = v174;
  LODWORD(v152) = v173;
  uint64_t v106 = v104;
  uint64_t v107 = v146;
  sub_23F9A0330(v106, v146, &qword_268C5BF20);
  v108 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF68);
  uint64_t v109 = (uint64_t *)(v107 + v108[12]);
  uint64_t v110 = v171;
  *uint64_t v109 = v145;
  v109[1] = v110;
  uint64_t v111 = v164;
  v109[2] = v144;
  v109[3] = v111;
  uint64_t v112 = v107 + v108[16];
  uint64_t v113 = v150;
  *(void *)uint64_t v112 = v151;
  *(void *)(v112 + 8) = v113;
  uint64_t v114 = v149;
  *(void *)(v112 + 16) = v170;
  *(void *)(v112 + 24) = v114;
  uint64_t v116 = v168;
  uint64_t v115 = v169;
  *(void *)(v112 + 32) = KeyPath;
  *(void *)(v112 + 40) = v115;
  uint64_t v117 = v147;
  *(void *)(v112 + 48) = 0;
  *(void *)(v112 + 56) = v117;
  *(void *)(v112 + 64) = v116;
  *(void *)(v112 + 72) = 0;
  uint64_t v168 = v116;
  *(void *)(v112 + 80) = 0;
  *(void *)(v112 + 88) = 0;
  *(unsigned char *)(v112 + 96) = 0;
  uint64_t v118 = v107 + v108[20];
  *(unsigned char *)(v118 + 32) = v140;
  *(void *)(v118 + 40) = 0x4010000000000000;
  *(void *)(v118 + 48) = 0;
  uint64_t v120 = v141;
  uint64_t v119 = v142;
  *(void *)uint64_t v118 = v142;
  *(void *)(v118 + 8) = v120;
  *(unsigned char *)(v118 + 16) = v85;
  *(void *)(v118 + 24) = v156;
  *(void *)(v118 + 56) = 0;
  *(void *)(v118 + 64) = 0;
  *(unsigned char *)(v118 + 72) = 0;
  uint64_t v121 = v107 + v108[24];
  *((void *)&v180 + 1) = v158;
  LOBYTE(v181) = v87;
  *((void *)&v181 + 1) = v157;
  LOBYTE(v182) = (_BYTE)v86;
  *((void *)&v182 + 1) = v160;
  LOBYTE(v183) = v92;
  *((void *)&v183 + 1) = v155;
  LOBYTE(v184) = v105;
  *((void *)&v184 + 1) = v159;
  LOBYTE(v185) = v153;
  *((void *)&v185 + 1) = v165;
  LOBYTE(v186) = v154;
  *((void *)&v186 + 1) = v163;
  *(void *)&long long v187 = v162;
  BYTE8(v187) = (_BYTE)v161;
  *(void *)&long long v188 = v97;
  *((void *)&v188 + 1) = v99;
  *(void *)&long long v189 = v101;
  *((void *)&v189 + 1) = v103;
  long long v122 = v185;
  long long v123 = v186;
  long long v124 = v187;
  long long v125 = v188;
  long long v126 = v189;
  uint64_t v127 = v143;
  *(void *)&long long v180 = v143;
  *(_OWORD *)(v121 + 64) = v184;
  *(_OWORD *)(v121 + 80) = v122;
  LOBYTE(v117) = v152;
  *(unsigned char *)(v121 + 160) = v152;
  *(_OWORD *)(v121 + 128) = v125;
  *(_OWORD *)(v121 + 144) = v126;
  *(_OWORD *)(v121 + 96) = v123;
  *(_OWORD *)(v121 + 112) = v124;
  long long v128 = v180;
  long long v129 = v181;
  long long v130 = v183;
  *(_OWORD *)(v121 + 32) = v182;
  *(_OWORD *)(v121 + 48) = v130;
  *(_OWORD *)uint64_t v121 = v128;
  *(_OWORD *)(v121 + 16) = v129;
  char v190 = v117;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v132 = v150;
  uint64_t v131 = v151;
  uint64_t v133 = v149;
  sub_23F9A01C4(v151, v150, v170, v149);
  sub_23F9A0214(v119, v120, v135);
  swift_bridgeObjectRetain();
  sub_23F9A0224((uint64_t)&v180);
  sub_23F9A0394((uint64_t)v167, &qword_268C5BF20);
  *(void *)&long long v191 = v127;
  *((void *)&v191 + 1) = v158;
  char v192 = v136;
  v193 = v157;
  char v194 = v137;
  uint64_t v195 = v160;
  char v196 = v138;
  uint64_t v197 = v155;
  char v198 = v139;
  uint64_t v199 = v159;
  char v200 = v153;
  uint64_t v201 = v165;
  char v202 = v154;
  uint64_t v203 = v163;
  uint64_t v204 = v162;
  char v205 = (char)v161;
  uint64_t v206 = v97;
  uint64_t v207 = v99;
  uint64_t v208 = v101;
  uint64_t v209 = v103;
  char v210 = v152;
  sub_23F9A0250((uint64_t)&v191);
  sub_23F99FC10(v119, v120, v172);
  swift_bridgeObjectRelease();
  sub_23F9A027C(v131, v132, v170, v133);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_23F9A0394(v166, &qword_268C5BF20);
}

__n128 sub_23F99E0AC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_23F9A68C0();
    uint64_t v23 = (void *)sub_23F9A6510();
    sub_23F9A6270();
  }
  sub_23F9A6310();
  sub_23F9A0330(v13, a9, &qword_268C5BE28);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE30) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

id sub_23F99E26C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void *a16)
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
    sub_23F9A68C0();
    uint64_t v25 = (void *)sub_23F9A6510();
    sub_23F9A6270();
  }
  sub_23F9A6310();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;

  return a16;
}

void sub_23F99E434(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 48) = *(void *)(a2 + 32);
  v7[4] = sub_23F99FE6C;
  v7[5] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_23F99E60C;
  v7[3] = &block_descriptor_0;
  uint64_t v6 = _Block_copy(v7);
  sub_23F99F674(a2);
  swift_release();
  objc_msgSend(a1, sel_squareLogoDataForDesiredSize_completion_, v6, 86.0, 86.0);
  _Block_release(v6);
}

uint64_t sub_23F99E530(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    uint64_t v6 = result;
    id v7 = objc_allocWithZone(MEMORY[0x263F827E8]);
    sub_23F99FEF8(v6, a2);
    sub_23F99F674(a4);
    uint64_t v8 = (void *)sub_23F9A60F0();
    objc_msgSend(v7, sel_initWithData_, v8);

    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BF00);
    sub_23F9A6730();
    sub_23F99FE8C(v6, a2);
    return sub_23F99FF64(a4);
  }
  return result;
}

uint64_t sub_23F99E60C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  long long v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_23F9A6100();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_23F99FE8C((uint64_t)v4, v8);

  return swift_release();
}

uint64_t sub_23F99E6B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23F99C22C();
  uint64_t v30 = *(void *)(a1 + 8);
  uint64_t v31 = v4;
  uint64_t v28 = *(void *)(a1 + 16);
  uint64_t v29 = v5;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_23F9A6690();
  sub_23F9A6780();
  sub_23F9A6310();
  uint64_t v6 = v69;
  uint64_t v7 = v73;
  uint64_t v25 = v75;
  uint64_t v26 = v71;
  uint64_t v23 = v79;
  uint64_t v24 = v77;
  uint64_t v21 = v82;
  uint64_t v22 = v81;
  LOBYTE(a1) = sub_23F9A6520();
  sub_23F9A62B0();
  char v37 = v70;
  char v36 = v72;
  char v35 = v74;
  char v34 = v76;
  char v33 = v78;
  char v32 = v80;
  *(void *)&long long v38 = v27;
  *((void *)&v38 + 1) = v69;
  LOBYTE(v39) = v70;
  *((void *)&v39 + 1) = v71;
  LOBYTE(v40) = v72;
  *((void *)&v40 + 1) = v73;
  LOBYTE(v41) = v74;
  *((void *)&v41 + 1) = v75;
  LOBYTE(v42) = v76;
  *((void *)&v42 + 1) = v77;
  LOBYTE(v43) = v78;
  *((void *)&v43 + 1) = v79;
  LOBYTE(v44) = v80;
  *((void *)&v44 + 1) = v81;
  *(void *)&long long v45 = v82;
  BYTE8(v45) = a1;
  *(void *)&long long v46 = v8;
  *((void *)&v46 + 1) = v9;
  *(void *)&long long v47 = v10;
  *((void *)&v47 + 1) = v11;
  char v48 = 0;
  long long v12 = v43;
  long long v13 = v44;
  *(_OWORD *)(a2 + 96) = v42;
  *(_OWORD *)(a2 + 112) = v12;
  long long v14 = v45;
  long long v15 = v46;
  long long v16 = v47;
  *(unsigned char *)(a2 + 192) = 0;
  *(_OWORD *)(a2 + 160) = v15;
  *(_OWORD *)(a2 + 176) = v16;
  *(_OWORD *)(a2 + 128) = v13;
  *(_OWORD *)(a2 + 144) = v14;
  long long v17 = v38;
  long long v18 = v39;
  long long v19 = v41;
  *(_OWORD *)(a2 + 64) = v40;
  *(_OWORD *)(a2 + 80) = v19;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v18;
  *(void *)a2 = v31;
  *(void *)(a2 + 8) = v29;
  *(void *)(a2 + 16) = v30;
  *(void *)(a2 + 24) = v28;
  v49[0] = v27;
  v49[1] = v6;
  char v50 = v37;
  uint64_t v51 = v26;
  char v52 = v36;
  uint64_t v53 = v7;
  char v54 = v35;
  uint64_t v55 = v25;
  char v56 = v34;
  uint64_t v57 = v24;
  char v58 = v33;
  uint64_t v59 = v23;
  char v60 = v32;
  uint64_t v61 = v22;
  uint64_t v62 = v21;
  char v63 = a1;
  uint64_t v64 = v8;
  uint64_t v65 = v9;
  uint64_t v66 = v10;
  uint64_t v67 = v11;
  char v68 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23F9A0224((uint64_t)&v38);
  sub_23F9A0250((uint64_t)v49);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F99E900@<X0>(uint64_t a1@<X8>)
{
  uint64_t v67 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BEC8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v66 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BED0) - 8;
  MEMORY[0x270FA5388](v63);
  uint64_t v62 = (uint64_t)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23F9A6300();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (long long *)((char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_23F9A6680();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BED8);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BEE0) - 8;
  MEMORY[0x270FA5388](v61);
  uint64_t v60 = (uint64_t)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BEE8) - 8;
  MEMORY[0x270FA5388](v65);
  uint64_t v64 = (uint64_t)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BEF0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23F9A7AB0;
  uint64_t v19 = *MEMORY[0x263F1B388];
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v20(v11, v19, v8);
  *(void *)(v18 + 32) = MEMORY[0x2455D7340](v11, 0.6392, 0.6627, 0.7176, 1.0);
  v20(v11, v19, v8);
  *(void *)(v18 + 40) = MEMORY[0x2455D7340](v11, 0.5215, 0.5411, 0.5843, 1.0);
  *(void *)&long long v72 = v18;
  sub_23F9A6890();
  sub_23F9A67B0();
  sub_23F9A67C0();
  uint64_t v21 = swift_bridgeObjectRetain();
  MEMORY[0x2455D73F0](v21);
  sub_23F9A62E0();
  uint64_t v22 = v68;
  long long v59 = v69;
  uint64_t v23 = v70;
  uint64_t v24 = v71;
  swift_bridgeObjectRelease();
  uint64_t v25 = (char *)v7 + *(int *)(v5 + 28);
  uint64_t v26 = *MEMORY[0x263F19860];
  uint64_t v27 = sub_23F9A6400();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
  __asm { FMOV            V0.2D, #18.0 }
  *uint64_t v7 = _Q0;
  uint64_t v33 = v62;
  sub_23F99FCD8((uint64_t)v7, v62);
  *(_WORD *)(v33 + *(int *)(v63 + 44)) = 256;
  sub_23F9A0330(v33, (uint64_t)&v15[*(int *)(v13 + 44)], &qword_268C5BED0);
  *(void *)long long v15 = v22;
  *(_OWORD *)(v15 + 8) = v59;
  *((void *)v15 + 3) = v23;
  *((void *)v15 + 4) = v24;
  swift_bridgeObjectRetain();
  sub_23F9A0394(v33, &qword_268C5BED0);
  sub_23F99FD3C((uint64_t)v7);
  sub_23F99FD98((uint64_t)&v68);
  sub_23F9A6780();
  sub_23F9A62D0();
  uint64_t v34 = v60;
  sub_23F9A0330((uint64_t)v15, v60, &qword_268C5BED8);
  char v35 = (_OWORD *)(v34 + *(int *)(v61 + 44));
  long long v36 = v73;
  *char v35 = v72;
  v35[1] = v36;
  v35[2] = v74;
  sub_23F9A0394((uint64_t)v15, &qword_268C5BED8);
  uint64_t v37 = sub_23F9A6780();
  uint64_t v39 = v38;
  uint64_t v40 = sub_23F9A66E0();
  uint64_t v41 = sub_23F9A66A0();
  uint64_t v42 = sub_23F9A6580();
  uint64_t v43 = (uint64_t)v66;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v66, 1, 1, v42);
  uint64_t v44 = sub_23F9A6590();
  sub_23F9A0394(v43, &qword_268C5BEC8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v46 = v64;
  sub_23F9A0330(v34, v64, &qword_268C5BEE0);
  long long v47 = (uint64_t *)(v46 + *(int *)(v65 + 44));
  *long long v47 = v40;
  v47[1] = v41;
  v47[2] = KeyPath;
  v47[3] = v44;
  v47[4] = v37;
  v47[5] = v39;
  sub_23F9A0394(v34, &qword_268C5BEE0);
  LOBYTE(v37) = sub_23F9A6530();
  sub_23F9A62B0();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v56 = v67;
  sub_23F9A0330(v46, v67, &qword_268C5BEE8);
  uint64_t v57 = v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C5BEF8) + 36);
  *(unsigned char *)uint64_t v57 = v37;
  *(void *)(v57 + 8) = v49;
  *(void *)(v57 + 16) = v51;
  *(void *)(v57 + 24) = v53;
  *(void *)(v57 + 32) = v55;
  *(unsigned char *)(v57 + 40) = 0;
  return sub_23F9A0394(v46, &qword_268C5BEE8);
}

uint64_t sub_23F99EF7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_23F99BAA0();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_23F9A6610();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_23F9A6570();
  sub_23F9A6560();
  swift_release();
  uint64_t v14 = sub_23F9A65F0();
  uint64_t v38 = v15;
  uint64_t v39 = v14;
  char v36 = v16;
  uint64_t v37 = v17;
  swift_release();
  sub_23F99FC10(v9, v11, v13);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = swift_getKeyPath();
  char v20 = sub_23F9A6520();
  sub_23F9A62B0();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t result = sub_23F9A6780();
  uint64_t v30 = result;
  uint64_t v32 = v31;
  if (a4)
  {
    uint64_t v33 = HIBYTE(a4) & 0xF;
    uint64_t v34 = a3;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v33 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (v33)
    {
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRetain();
    }
    else
    {
      a1 = 0;
      a2 = 0;
      uint64_t v34 = 0;
      a4 = 0;
    }
  }
  else
  {
    a1 = 0;
    a2 = 0;
    uint64_t v34 = 0;
  }
  *(void *)a5 = v39;
  *(void *)(a5 + 8) = v38;
  *(unsigned char *)(a5 + 16) = v36 & 1;
  *(void *)(a5 + 24) = v37;
  *(void *)(a5 + 32) = KeyPath;
  *(void *)(a5 + 40) = 0;
  *(unsigned char *)(a5 + 48) = 1;
  *(void *)(a5 + 56) = v19;
  *(_WORD *)(a5 + 64) = 1;
  *(unsigned char *)(a5 + 66) = 1;
  *(unsigned char *)(a5 + 72) = v20;
  *(void *)(a5 + 80) = v22;
  *(void *)(a5 + 88) = v24;
  *(void *)(a5 + 96) = v26;
  *(void *)(a5 + 104) = v28;
  *(unsigned char *)(a5 + 112) = 0;
  *(void *)(a5 + 120) = a1;
  *(void *)(a5 + 128) = a2;
  *(void *)(a5 + 136) = v34;
  *(void *)(a5 + 144) = a4;
  *(void *)(a5 + 152) = v30;
  *(void *)(a5 + 160) = v32;
  return result;
}

uint64_t sub_23F99F170@<X0>(uint64_t a1@<X8>)
{
  return sub_23F99EF7C(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_23F99F17C()
{
  return sub_23F9A6360();
}

uint64_t sub_23F99F1A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BE20);
  MEMORY[0x270FA5388](v2 - 8);
  sub_23F9A0330(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_268C5BE20);
  return sub_23F9A6370();
}

uint64_t sub_23F99F238(uint64_t a1)
{
  return a1;
}

uint64_t sub_23F99F284(uint64_t a1)
{
  return a1;
}

unint64_t sub_23F99F2CC()
{
  unint64_t result = qword_268C5BE58;
  if (!qword_268C5BE58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BE40);
    sub_23F99F36C();
    sub_23F9A0928(&qword_268C5BE80, &qword_268C5BE88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BE58);
  }
  return result;
}

unint64_t sub_23F99F36C()
{
  unint64_t result = qword_268C5BE60;
  if (!qword_268C5BE60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BE38);
    sub_23F99F40C();
    sub_23F9A0928(&qword_268C5BE78, &qword_268C5BE00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BE60);
  }
  return result;
}

unint64_t sub_23F99F40C()
{
  unint64_t result = qword_268C5BE68;
  if (!qword_268C5BE68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BE30);
    sub_23F9A0928(&qword_268C5BE70, &qword_268C5BE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BE68);
  }
  return result;
}

unint64_t sub_23F99F4AC()
{
  unint64_t result = qword_268C5BE90;
  if (!qword_268C5BE90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BE10);
    sub_23F99F54C();
    sub_23F9A0928(&qword_268C5BE80, &qword_268C5BE88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BE90);
  }
  return result;
}

unint64_t sub_23F99F54C()
{
  unint64_t result = qword_268C5BE98;
  if (!qword_268C5BE98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BE08);
    sub_23F9A0928(&qword_268C5BEA0, &qword_268C5BEA8);
    sub_23F9A0928(&qword_268C5BE78, &qword_268C5BE00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BE98);
  }
  return result;
}

uint64_t sub_23F99F610()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_23F99F668()
{
  sub_23F99E434(*(void **)(v0 + 16), v0 + 24);
}

uint64_t sub_23F99F674(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 24);
  swift_retain();
  id v4 = v2;
  swift_bridgeObjectRetain();
  id v5 = v3;
  return a1;
}

uint64_t sub_23F99F6C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for BrandHeaderView(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for BrandHeaderView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = *(void **)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  a1[4] = *(void *)(a2 + 32);
  id v6 = v3;
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BrandHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a1 + 24);
  uint64_t v8 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v8;
  id v9 = v8;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BrandHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BrandHeaderView(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BrandHeaderView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandHeaderView()
{
  return &type metadata for BrandHeaderView;
}

unint64_t sub_23F99F948()
{
  unint64_t result = qword_268C5BEB8;
  if (!qword_268C5BEB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BEC0);
    sub_23F99FFB4(&qword_268C5BE50, &qword_268C5BE48, (void (*)(void))sub_23F99F2CC);
    sub_23F99F4AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BEB8);
  }
  return result;
}

uint64_t destroy for CopyableTitle()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CopyableTitle(void *a1, void *a2)
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

void *assignWithCopy for CopyableTitle(void *a1, void *a2)
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

void *assignWithTake for CopyableTitle(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for CopyableTitle(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CopyableTitle(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CopyableTitle()
{
  return &type metadata for CopyableTitle;
}

ValueMetadata *type metadata accessor for PlaceholderLogo()
{
  return &type metadata for PlaceholderLogo;
}

uint64_t sub_23F99FBD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F99FBF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F99FC10(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23F99FC20@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_23F9A6380();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23F99FC54()
{
  return sub_23F9A6390();
}

uint64_t sub_23F99FC84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23F9A6320();
  *a1 = result;
  return result;
}

uint64_t sub_23F99FCB0()
{
  return sub_23F9A6330();
}

uint64_t sub_23F99FCD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23F9A6300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F99FD3C(uint64_t a1)
{
  uint64_t v2 = sub_23F9A6300();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23F99FD98(uint64_t a1)
{
  return a1;
}

uint64_t sub_23F99FDC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23F9A6340();
  *a1 = result;
  return result;
}

uint64_t sub_23F99FDF0()
{
  return sub_23F9A6350();
}

uint64_t sub_23F99FE1C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23F99FE6C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_23F99E530(a1, a2, a3, v3 + 16);
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

uint64_t sub_23F99FE8C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_23F99FEA0(a1, a2);
  }
  return a1;
}

uint64_t sub_23F99FEA0(uint64_t a1, unint64_t a2)
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

uint64_t sub_23F99FEF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_23F99FF0C(a1, a2);
  }
  return a1;
}

uint64_t sub_23F99FF0C(uint64_t a1, unint64_t a2)
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

uint64_t sub_23F99FF64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_23F99FFB4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23F9A0030()
{
  unint64_t result = qword_268C5BF30;
  if (!qword_268C5BF30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BF08);
    sub_23F99FFB4(&qword_268C5BF38, &qword_268C5BF40, (void (*)(void))sub_23F9A00FC);
    sub_23F9A0928(&qword_268C5BF58, &qword_268C5BED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BF30);
  }
  return result;
}

unint64_t sub_23F9A00FC()
{
  unint64_t result = qword_268C5BF48;
  if (!qword_268C5BF48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BF50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BF48);
  }
  return result;
}

unint64_t sub_23F9A0170()
{
  unint64_t result = qword_268C5BF60;
  if (!qword_268C5BF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BF60);
  }
  return result;
}

uint64_t sub_23F9A01C4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23F9A0214(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_23F9A0214(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_23F9A0224(uint64_t a1)
{
  return a1;
}

uint64_t sub_23F9A0250(uint64_t a1)
{
  return a1;
}

uint64_t sub_23F9A027C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23F99FC10(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23F9A02CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23F9A0330(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23F9A0394(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23F9A03F0()
{
  unint64_t result = qword_268C5BF70;
  if (!qword_268C5BF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BF70);
  }
  return result;
}

unint64_t sub_23F9A0448()
{
  unint64_t result = qword_268C5BF78;
  if (!qword_268C5BF78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BF80);
    sub_23F99FFB4(&qword_268C5BF88, &qword_268C5BF90, (void (*)(void))sub_23F9A0514);
    sub_23F9A0928(&qword_268C5BFE8, &qword_268C5BFF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BF78);
  }
  return result;
}

uint64_t sub_23F9A0514()
{
  return sub_23F99FFB4(&qword_268C5BF98, &qword_268C5BFA0, (void (*)(void))sub_23F9A0544);
}

unint64_t sub_23F9A0544()
{
  unint64_t result = qword_268C5BFA8;
  if (!qword_268C5BFA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BFB0);
    sub_23F9A05E4();
    sub_23F9A0928(&qword_268C5BFD8, &qword_268C5BFE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BFA8);
  }
  return result;
}

unint64_t sub_23F9A05E4()
{
  unint64_t result = qword_268C5BFB8;
  if (!qword_268C5BFB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BFC0);
    sub_23F9A0928(&qword_268C5BFC8, &qword_268C5BFD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5BFB8);
  }
  return result;
}

uint64_t sub_23F9A0684()
{
  return sub_23F99FFB4(&qword_268C5BFF8, &qword_268C5BEF8, (void (*)(void))sub_23F9A06C8);
}

unint64_t sub_23F9A06C8()
{
  unint64_t result = qword_268C5C000;
  if (!qword_268C5C000)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BEE8);
    sub_23F99FFB4(&qword_268C5C008, &qword_268C5BEE0, (void (*)(void))sub_23F9A0794);
    sub_23F9A0928(&qword_268C5C040, &qword_268C5C048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C000);
  }
  return result;
}

unint64_t sub_23F9A0794()
{
  unint64_t result = qword_268C5C010;
  if (!qword_268C5C010)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5BED8);
    sub_23F9A0834();
    sub_23F9A0928(&qword_268C5BF58, &qword_268C5BED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C010);
  }
  return result;
}

unint64_t sub_23F9A0834()
{
  unint64_t result = qword_268C5C018;
  if (!qword_268C5C018)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5C020);
    sub_23F9A08D4();
    sub_23F9A0928(&qword_268C5C030, &qword_268C5C038);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C018);
  }
  return result;
}

unint64_t sub_23F9A08D4()
{
  unint64_t result = qword_268C5C028;
  if (!qword_268C5C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C028);
  }
  return result;
}

uint64_t sub_23F9A0928(unint64_t *a1, uint64_t *a2)
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

void sub_23F9A0974(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip];
  uint64_t v5 = (objc_class *)type metadata accessor for BrandCardCopyMenu();
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  v13.receiver = v1;
  v13.super_class = v5;
  id v6 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);
  if (!v6) {
    goto LABEL_4;
  }
  id v7 = objc_allocWithZone(MEMORY[0x263F82718]);
  uint64_t v8 = (char *)v6;
  id v9 = objc_msgSend(v7, sel_initWithDelegate_, v8);
  uint64_t v10 = OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction;
  uint64_t v11 = *(void **)&v8[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction];
  *(void *)&v8[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction] = v9;

  if (*(void *)&v8[v10])
  {
    objc_msgSend(v8, sel_addInteraction_);
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_initWithTarget_action_, v8, sel_handleLongPress_);
    objc_msgSend(v12, sel_setMinimumPressDuration_, 0.3);
    objc_msgSend(v8, sel_addGestureRecognizer_, v12);

    a1 = v12;
LABEL_4:

    return;
  }
  __break(1u);
}

void sub_23F9A0B98()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82718]), sel_initWithDelegate_, v0);
  uint64_t v2 = OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction];
  *(void *)&v0[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction] = v1;

  if (*(void *)&v0[v2])
  {
    objc_msgSend(v0, sel_addInteraction_);
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_initWithTarget_action_, v0, sel_handleLongPress_);
    objc_msgSend(v4, sel_setMinimumPressDuration_, 0.3);
    objc_msgSend(v0, sel_addGestureRecognizer_, v4);
  }
  else
  {
    __break(1u);
  }
}

void sub_23F9A0CD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = objc_msgSend(self, sel_generalPasteboard);
  if (*(void *)(a2 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    id v6 = (id)sub_23F9A67E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  objc_msgSend(v5, sel_setString_, v6);
}

id sub_23F9A0E00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandCardCopyMenu();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BrandCardCopyMenu()
{
  return self;
}

char *sub_23F9A0EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for BrandCardCopyMenu();
  id v9 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v10 = &v9[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name];
  *(void *)uint64_t v10 = a2;
  *((void *)v10 + 1) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = &v9[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip];
  *(void *)uint64_t v11 = a4;
  *((void *)v11 + 1) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v9;
}

char *sub_23F9A0F60(uint64_t a1)
{
  return sub_23F9A0EBC(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_23F9A0F80()
{
  return sub_23F9A6450();
}

uint64_t sub_23F9A0FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23F9A15A4();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23F9A1028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23F9A15A4();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23F9A108C()
{
}

void sub_23F9A10B4()
{
  objc_msgSend(v0, sel_bounds);
  double MidX = CGRectGetMidX(v6);
  objc_msgSend(v0, sel_bounds);
  double MinY = CGRectGetMinY(v7);
  CGPointMake(MidX, MinY);
  sub_23F9A14F4(0, &qword_268C5C0E8);
  id v4 = (id)sub_23F9A68E0();
  id v3 = *(id *)&v0[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction];
  objc_msgSend(v3, sel_presentEditMenuWithConfiguration_, v4);
}

uint64_t sub_23F9A1198()
{
  sub_23F9A14F4(0, &qword_268C5C0D0);
  id v1 = (objc_class *)type metadata accessor for FrameworkBundleAnchor();
  id v2 = objc_msgSend(objc_allocWithZone(v1), sel_init);
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = self;
  id v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);

  sub_23F9A6090();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v0;
  id v7 = v0;
  uint64_t v8 = sub_23F9A6900();
  id v9 = objc_msgSend(objc_allocWithZone(v1), sel_init, 0, 0, 0, sub_23F9A14AC, v6);
  swift_getObjectType();
  id v10 = objc_msgSend(v4, sel_bundleForClass_, swift_getObjCClassFromMetadata());

  sub_23F9A6090();
  *(void *)(swift_allocObject() + 16) = v7;
  id v11 = v7;
  uint64_t v12 = sub_23F9A6900();
  sub_23F9A14F4(0, &qword_268C5C0D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C0E0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23F9A7CF0;
  *(void *)(v13 + 32) = v8;
  *(void *)(v13 + 40) = v12;
  sub_23F9A6890();
  return sub_23F9A68F0();
}

uint64_t sub_23F9A1474()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23F9A14AC(uint64_t a1)
{
  sub_23F9A0CD4(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name);
}

void sub_23F9A14D0(uint64_t a1)
{
  sub_23F9A0CD4(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip);
}

uint64_t sub_23F9A14F4(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for BrandCardCopyMenuViewRepresentable()
{
  return &type metadata for BrandCardCopyMenuViewRepresentable;
}

uint64_t sub_23F9A1540()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_23F9A1550()
{
  unint64_t result = qword_268C5C0F0;
  if (!qword_268C5C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C0F0);
  }
  return result;
}

unint64_t sub_23F9A15A4()
{
  unint64_t result = qword_268C5C0F8;
  if (!qword_268C5C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C0F8);
  }
  return result;
}

id sub_23F9A163C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FrameworkBundleAnchor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FrameworkBundleAnchor()
{
  return self;
}

uint64_t sub_23F9A1694(uint64_t a1)
{
  uint64_t v2 = sub_23F9A6150();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C160);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F9A6140();
  sub_23F9A6130();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = sub_23F9A6120();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23F9A191C((uint64_t)v8);
  }
  else
  {
    sub_23F9A6110();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    sub_23F9A6820();
    swift_bridgeObjectRelease();
  }
  id v11 = (void *)sub_23F9A67E0();
  uint64_t v12 = (void *)sub_23F9A67E0();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)CFPhoneNumberCreate();

  if (!v13) {
    goto LABEL_8;
  }
  id v14 = v13;
  uint64_t String = CFPhoneNumberCreateString();
  if (!String)
  {

LABEL_8:
    swift_bridgeObjectRetain();
    return a1;
  }
  char v16 = (void *)String;
  a1 = sub_23F9A67F0();

  return a1;
}

uint64_t sub_23F9A191C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C160);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_23F9A197C()
{
  swift_bridgeObjectRetain();
  do
  {
    sub_23F9A6850();
    uint64_t v1 = v0;
    if (!v0) {
      break;
    }
    char v2 = sub_23F9A67D0();
    swift_bridgeObjectRelease();
  }
  while ((v2 & 1) != 0);
  swift_bridgeObjectRelease();
  return v1 == 0;
}

uint64_t sub_23F9A19FC()
{
  uint64_t v0 = sub_23F9A62A0();
  __swift_allocate_value_buffer(v0, qword_268C5C950);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C5C950);
  return sub_23F9A6290();
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

uint64_t BrandCardDetailView.init(brand:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_23F9A1AEC(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  id v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      id v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *id v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        char v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)char v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  char v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_23F9A67A0();
}

id sub_23F9A1CB0(int a1, id a2)
{
  id result = objc_msgSend(a2, sel_hoursConfig);
  if (result)
  {
    sub_23F9A6950();
    swift_unknownObjectRelease();
    sub_23F9A51A0(&v6, &v7);
    sub_23F9A51B0();
    swift_dynamicCast();
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53FA0]), sel_initWithBusinessHoursConfiguration_, v5);

    LODWORD(v4) = 1144750080;
    objc_msgSend(v3, sel_setContentHuggingPriority_forAxis_, 1, v4);
    objc_msgSend(v3, sel_setDirectionalLayoutMargins_, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
    objc_msgSend(v3, sel_setBottomHairlineHidden_, 1);
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23F9A1DBC(int a1)
{
  return sub_23F9A1CB0(a1, *v1);
}

uint64_t sub_23F9A1DC4(uint64_t a1, char a2, int a3, int a4, id a5)
{
  if (a2)
  {
    objc_msgSend(a5, sel_intrinsicContentSize);
    a1 = v7;
  }
  objc_msgSend(a5, sel_intrinsicContentSize);
  return a1;
}

uint64_t sub_23F9A1E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23F9A51F0();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23F9A1E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23F9A51F0();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23F9A1EE8()
{
}

uint64_t BrandCardRowView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v31 = a2;
  uint64_t v26 = *(void *)(a1 + 16);
  swift_getTupleTypeMetadata2();
  v25[1] = sub_23F9A6790();
  v25[0] = swift_getWitnessTable();
  uint64_t v3 = sub_23F9A6750();
  uint64_t v29 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)v25 - v4;
  uint64_t v6 = sub_23F9A62F0();
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v25 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5C168);
  uint64_t v9 = sub_23F9A62F0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v27 = (char *)v25 - v14;
  uint64_t v15 = *v2;
  uint64_t v16 = v2[3];
  sub_23F9A6420();
  uint64_t v17 = *(void *)(v28 + 24);
  uint64_t v32 = v26;
  uint64_t v33 = v17;
  uint64_t v34 = v15;
  long long v35 = *(_OWORD *)(v2 + 1);
  uint64_t v36 = v16;
  sub_23F9A6740();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_23F9A6670();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v3);
  long long v41 = xmmword_23F9A7E50;
  long long v42 = xmmword_23F9A7E50;
  char v43 = 0;
  uint64_t v39 = WitnessTable;
  uint64_t v40 = MEMORY[0x263F18C10];
  uint64_t v19 = swift_getWitnessTable();
  sub_23F9A6640();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  uint64_t v20 = sub_23F9A0928(&qword_268C5C170, &qword_268C5C168);
  uint64_t v37 = v19;
  uint64_t v38 = v20;
  swift_getWitnessTable();
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  unint64_t v22 = v27;
  v21(v27, v13, v9);
  int v23 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23(v13, v9);
  v21(v31, v22, v9);
  return ((uint64_t (*)(char *, uint64_t))v23)(v22, v9);
}

uint64_t sub_23F9A2348@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v44 = a4;
  uint64_t v45 = a5;
  uint64_t v42 = a3;
  char v43 = a2;
  uint64_t v46 = a6;
  uint64_t v41 = *(void *)(a4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v39 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v38 - v9;
  uint64_t v50 = v8;
  uint64_t v51 = v10;
  sub_23F99BAA0();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_23F9A6610();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_23F9A66B0();
  uint64_t v16 = sub_23F9A65D0();
  uint64_t v18 = v17;
  char v20 = v19;
  swift_release();
  char v21 = v20 & 1;
  sub_23F99FC10(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_23F9A6540();
  uint64_t v22 = sub_23F9A65F0();
  uint64_t v38 = v23;
  char v25 = v24;
  uint64_t v27 = v26;
  swift_release();
  char v28 = v25 & 1;
  sub_23F99FC10(v16, v18, v21);
  uint64_t v29 = swift_bridgeObjectRelease();
  uint64_t v30 = v39;
  v43(v29);
  uint64_t v32 = v40;
  uint64_t v31 = v41;
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  uint64_t v34 = v44;
  v33(v40, v30, v44);
  char v43 = *(void (**)(uint64_t))(v31 + 8);
  ((void (*)(char *, uint64_t))v43)(v30, v34);
  uint64_t v35 = v38;
  uint64_t v50 = v22;
  uint64_t v51 = v38;
  char v52 = v28;
  uint64_t v53 = v27;
  v54[0] = &v50;
  v33(v30, v32, v34);
  v54[1] = v30;
  sub_23F9A0214(v22, v35, v28);
  swift_bridgeObjectRetain();
  v49[0] = MEMORY[0x263F1A830];
  v49[1] = v34;
  uint64_t v47 = MEMORY[0x263F1A820];
  uint64_t v48 = v45;
  sub_23F9A1AEC((uint64_t)v54, 2uLL, (uint64_t)v49);
  uint64_t v36 = v43;
  ((void (*)(char *, uint64_t))v43)(v32, v34);
  sub_23F99FC10(v22, v35, v28);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v36)(v30, v34);
  sub_23F99FC10(v50, v51, v52);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F9A2638@<X0>(uint64_t a1@<X8>)
{
  return sub_23F9A2348(*(void *)(v1 + 32), *(void (**)(uint64_t))(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t BrandCardDetailView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C178);
  MEMORY[0x270FA5388](v3);
  id v5 = (uint64_t *)((char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C180);
  MEMORY[0x270FA5388](v6);
  uint64_t v54 = (uint64_t)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C5C188);
  MEMORY[0x270FA5388](v51);
  uint64_t v49 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C190);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v52 = v9;
  uint64_t v53 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v50 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v43 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C198);
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1A0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  char v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v43 - v20;
  uint64_t v22 = *v1;
  if (*v1)
  {
    uint64_t v45 = v3;
    uint64_t v46 = v6;
    uint64_t v47 = v5;
    uint64_t v48 = a1;
    id v23 = v22;
    id v24 = objc_msgSend(v23, sel_localizedDescription);
    if (v24)
    {
      char v25 = v24;
      uint64_t v26 = sub_23F9A67F0();
      uint64_t v28 = v27;

      uint64_t v43 = (uint64_t)&v43;
      MEMORY[0x270FA5388](v29);
      *(&v43 - 2) = v26;
      *(&v43 - 1) = v28;
      sub_23F9A2D9C();
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1D8);
      unint64_t v31 = sub_23F9A4CD4();
      uint64_t v55 = v30;
      unint64_t v56 = v31;
      swift_getOpaqueTypeConformance2();
      sub_23F9A6760();
      swift_bridgeObjectRelease();
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1B0);
      uint64_t v33 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v21, 0, 1, v32);
    }
    else
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1B0);
      uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v21, 1, 1, v35);
    }
    MEMORY[0x270FA5388](v33);
    id v44 = v23;
    *(&v43 - 2) = (uint64_t)v23;
    sub_23F9A491C(v49);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1B8);
    sub_23F9A4BFC();
    sub_23F9A0928(&qword_268C5C1C8, &qword_268C5C1B8);
    sub_23F9A6760();
    uint64_t v51 = v21;
    sub_23F9A0330((uint64_t)v21, (uint64_t)v19, &qword_268C5C1A0);
    uint64_t v36 = v52;
    uint64_t v37 = v53;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
    uint64_t v39 = v50;
    v38(v50, v14, v52);
    uint64_t v40 = v54;
    sub_23F9A0330((uint64_t)v19, v54, &qword_268C5C1A0);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1D0);
    v38((char *)(v40 + *(int *)(v41 + 48)), v39, v36);
    uint64_t v42 = *(void (**)(char *, uint64_t))(v37 + 8);
    v42(v39, v36);
    sub_23F9A0394((uint64_t)v19, &qword_268C5C1A0);
    sub_23F9A0330(v40, (uint64_t)v47, &qword_268C5C180);
    swift_storeEnumTagMultiPayload();
    sub_23F9A0928(&qword_268C5C1A8, &qword_268C5C180);
    sub_23F9A64F0();

    sub_23F9A0394(v40, &qword_268C5C180);
    v42(v14, v36);
    return sub_23F9A0394((uint64_t)v51, &qword_268C5C1A0);
  }
  else
  {
    *id v5 = sub_23F9A6690();
    swift_storeEnumTagMultiPayload();
    sub_23F9A0928(&qword_268C5C1A8, &qword_268C5C180);
    return sub_23F9A64F0();
  }
}

__n128 sub_23F9A2CB0@<Q0>(__n128 *a1@<X8>)
{
  sub_23F99BAA0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_23F9A6610();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_23F9A6550();
  uint64_t v7 = sub_23F9A65F0();
  unint64_t v9 = v8;
  char v11 = v10;
  unint64_t v13 = v12;
  swift_release();
  sub_23F99FC10(v2, v4, v6);
  swift_bridgeObjectRelease();
  a1->n128_u64[0] = v7;
  a1->n128_u64[1] = v9;
  a1[1].n128_u8[0] = v11 & 1;
  a1[1].n128_u64[1] = v13;
  __asm { FMOV            V0.2D, #16.0 }
  a1[2] = result;
  a1[3] = result;
  a1[4].n128_u8[0] = 0;
  return result;
}

uint64_t sub_23F9A2D9C()
{
  uint64_t v0 = sub_23F9A62C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  uint64_t v7 = sub_23F9A6090();
  uint64_t v9 = v8;

  uint64_t v15 = v7;
  uint64_t v16 = v9;
  sub_23F99BAA0();
  uint64_t v15 = sub_23F9A6610();
  uint64_t v16 = v10;
  char v17 = v11 & 1;
  uint64_t v18 = v12;
  long long v19 = xmmword_23F9A7E60;
  long long v20 = xmmword_23F9A7E70;
  char v21 = 0;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F18440], v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C1D8);
  sub_23F9A4CD4();
  sub_23F9A6660();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_23F99FC10(v15, v16, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F9A2FC0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v162 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5BD78);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v182 = (uint64_t)&v159 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v187 = (uint64_t)&v159 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v189 = (uint64_t)&v159 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v159 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v159 - v13;
  uint64_t v15 = sub_23F9A60E0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  v167 = (char *)&v159 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  long long v185 = (char *)&v159 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v186 = (uint64_t)&v159 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v188 = (uint64_t)&v159 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v159 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v159 - v28;
  id v184 = a1;
  id v30 = objc_msgSend(a1, sel_website);
  if (!v30)
  {
    long long v181 = *(uint64_t (**)())(v16 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v181)(v14, 1, 1, v15);
    id v35 = v184;
    goto LABEL_5;
  }
  unint64_t v31 = v30;
  sub_23F9A60B0();

  uint64_t v32 = v27;
  uint64_t v33 = v16;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  v34(v14, v32, v15);
  long long v181 = *(uint64_t (**)())(v33 + 56);
  ((void (*)(char *, void, uint64_t, uint64_t))v181)(v14, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v14, 1, v15) == 1)
  {
    id v35 = v184;
    uint64_t v16 = v33;
    uint64_t v27 = v32;
LABEL_5:
    sub_23F9A0394((uint64_t)v14, &qword_268C5BD78);
    uint64_t v179 = 0;
    uint64_t v180 = 0;
    unsigned __int8 v177 = 0;
    uint64_t v178 = 0;
    goto LABEL_7;
  }
  v34(v29, v14, v15);
  id v36 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v38 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  uint64_t v39 = sub_23F9A6090();
  uint64_t v179 = v40;
  uint64_t v180 = v39;

  v34(v32, v29, v15);
  unint64_t v41 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v178 = swift_allocObject();
  v34((char *)(v178 + v41), v32, v15);
  unsigned __int8 v177 = sub_23F9A5358;
  id v35 = v184;
  uint64_t v16 = v33;
  uint64_t v27 = v32;
LABEL_7:
  id v42 = objc_msgSend(v35, sel_primaryPhoneNumber);
  if (!v42)
  {
LABEL_10:
    uint64_t v176 = 0;
    unsigned __int8 v174 = 0;
    uint64_t v175 = 0;
    uint64_t v190 = 1;
    goto LABEL_11;
  }
  uint64_t v43 = v42;
  uint64_t v44 = sub_23F9A67F0();
  uint64_t v46 = v45;

  if (sub_23F9A197C())
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  long long v183 = v27;
  *(void *)&v195[0] = v44;
  *((void *)&v195[0] + 1) = v46;
  uint64_t v193 = 980182388;
  unint64_t v194 = 0xE400000000000000;
  uint64_t v191 = 0;
  unint64_t v192 = 0xE000000000000000;
  sub_23F99BAA0();
  uint64_t v53 = sub_23F9A6940();
  swift_bridgeObjectRelease();
  uint64_t v175 = sub_23F9A1694(v53);
  uint64_t v55 = v54;
  *(void *)&v195[0] = 980182388;
  *((void *)&v195[0] + 1) = 0xE400000000000000;
  sub_23F9A6840();
  swift_bridgeObjectRelease();
  sub_23F9A60D0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) == 1)
  {
    swift_bridgeObjectRelease();
    sub_23F9A0394((uint64_t)v12, &qword_268C5BD78);
    uint64_t v176 = 0;
    uint64_t v190 = 0;
    unsigned __int8 v174 = 0;
    uint64_t v175 = 0;
    uint64_t v27 = v183;
  }
  else
  {
    long long v129 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 32);
    unsigned __int8 v174 = v55;
    uint64_t v130 = v188;
    v129(v188, v12, v15);
    id v131 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    uint64_t v132 = swift_getObjCClassFromMetadata();
    id v133 = objc_msgSend(self, sel_bundleForClass_, v132);

    uint64_t v176 = sub_23F9A6090();
    uint64_t v190 = v134;

    uint64_t v135 = (uint64_t)v183;
    v129((uint64_t)v183, (char *)v130, v15);
    unint64_t v136 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v137 = swift_allocObject();
    int v138 = v174;
    *(void *)(v137 + 16) = v175;
    *(void *)(v137 + 24) = v138;
    uint64_t v175 = v137;
    v129(v137 + v136, (char *)v135, v15);
    uint64_t v27 = (char *)v135;
    unsigned __int8 v174 = sub_23F9A53B4;
  }
LABEL_11:
  id v47 = v184;
  id v48 = objc_msgSend(v184, sel_messageNumber);
  if (!v48)
  {
LABEL_18:
    uint64_t v188 = 0;
    uint64_t v189 = 0;
    char v172 = 0;
    uint64_t v173 = 0;
    goto LABEL_19;
  }
  uint64_t v49 = v48;
  uint64_t v50 = sub_23F9A67F0();
  uint64_t v52 = v51;

  if (sub_23F9A197C())
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v56 = v189;
  sub_23F9A60D0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v56, 1, v15) == 1)
  {
    swift_bridgeObjectRelease();
    sub_23F9A0394(v56, &qword_268C5BD78);
    goto LABEL_18;
  }
  int v139 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  v139(v186, v56, v15);
  *(void *)&v195[0] = v50;
  *((void *)&v195[0] + 1) = v52;
  uint64_t v193 = 980643187;
  unint64_t v194 = 0xE400000000000000;
  long long v183 = v27;
  uint64_t v191 = 0;
  unint64_t v192 = 0xE000000000000000;
  sub_23F99BAA0();
  uint64_t v140 = sub_23F9A6940();
  swift_bridgeObjectRelease();
  uint64_t v141 = sub_23F9A1694(v140);
  uint64_t v143 = v142;
  swift_bridgeObjectRelease();
  id v144 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t v145 = swift_getObjCClassFromMetadata();
  id v146 = objc_msgSend(self, sel_bundleForClass_, v145);

  uint64_t v27 = v183;
  uint64_t v147 = sub_23F9A6090();
  uint64_t v188 = v148;
  uint64_t v189 = v147;

  v139((uint64_t)v27, v186, v15);
  unint64_t v149 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v150 = swift_allocObject();
  *(void *)(v150 + 16) = v141;
  *(void *)(v150 + 24) = v143;
  uint64_t v173 = v150;
  v139(v150 + v149, (uint64_t)v27, v15);
  id v47 = v184;
  char v172 = sub_23F9A53B4;
LABEL_19:
  id v57 = objc_msgSend(v47, sel_emailAddress);
  if (!v57)
  {
LABEL_22:
    uint64_t v187 = 0;
    uint64_t v171 = 0;
    long long v185 = 0;
    uint64_t v186 = 1;
    goto LABEL_23;
  }
  char v58 = v57;
  uint64_t v59 = sub_23F9A67F0();
  uint64_t v61 = v60;

  if (sub_23F9A197C())
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  *(void *)&v195[0] = v59;
  *((void *)&v195[0] + 1) = v61;
  uint64_t v193 = 0x3A6F746C69616DLL;
  unint64_t v194 = 0xE700000000000000;
  uint64_t v191 = 0;
  unint64_t v192 = 0xE000000000000000;
  sub_23F99BAA0();
  sub_23F9A6940();
  *(void *)&v195[0] = 0x3A6F746C69616DLL;
  *((void *)&v195[0] + 1) = 0xE700000000000000;
  sub_23F9A6840();
  swift_bridgeObjectRelease();
  uint64_t v68 = v187;
  sub_23F9A60D0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v68, 1, v15) == 1)
  {
    swift_bridgeObjectRelease();
    sub_23F9A0394(v68, &qword_268C5BD78);
    uint64_t v186 = 0;
    uint64_t v187 = 0;
    uint64_t v171 = 0;
    long long v185 = 0;
  }
  else
  {
    uint64_t v151 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
    v151(v185, v68, v15);
    id v152 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    uint64_t v153 = swift_getObjCClassFromMetadata();
    id v154 = objc_msgSend(self, sel_bundleForClass_, v153);

    uint64_t v155 = sub_23F9A6090();
    uint64_t v186 = v156;
    uint64_t v187 = v155;

    v151(v27, (uint64_t)v185, v15);
    unint64_t v157 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v158 = swift_allocObject();
    *(void *)(v158 + 16) = v59;
    *(void *)(v158 + 24) = v61;
    long long v185 = (char *)v158;
    v151((char *)(v158 + v157), (uint64_t)v27, v15);
    uint64_t v171 = sub_23F9A53B4;
  }
  id v47 = v184;
LABEL_23:
  id v62 = objc_msgSend(v47, sel_address);
  uint64_t v166 = v17;
  if (!v62)
  {
LABEL_26:
    long long v183 = 0;
    id v184 = 0;
    uint64_t v67 = 0;
    uint64_t v170 = 0;
    goto LABEL_31;
  }
  uint64_t v63 = v62;
  uint64_t v64 = sub_23F9A67F0();
  uint64_t v66 = v65;

  if (sub_23F9A197C())
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  id v69 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t v70 = swift_getObjCClassFromMetadata();
  id v71 = objc_msgSend(self, sel_bundleForClass_, v70);

  long long v72 = (void *)sub_23F9A6090();
  long long v183 = (char *)v73;
  id v184 = v72;

  uint64_t v74 = swift_allocObject();
  *(void *)(v74 + 16) = v64;
  *(void *)(v74 + 24) = v66;
  uint64_t v170 = v74;
  uint64_t v67 = sub_23F9A5394;
LABEL_31:
  id v75 = objc_msgSend(v47, sel_termsAndConditionsURL);
  uint64_t v169 = v67;
  if (v75)
  {
    char v76 = v75;
    sub_23F9A60B0();

    uint64_t v77 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 32);
    uint64_t v78 = v182;
    v77(v182, v27, v15);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v181)(v78, 0, 1, v15);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v78, 1, v15) != 1)
    {
      uint64_t v79 = v27;
      char v80 = v167;
      v77((uint64_t)v167, (char *)v78, v15);
      id v81 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
      swift_getObjectType();
      uint64_t v82 = swift_getObjCClassFromMetadata();
      id v83 = objc_msgSend(self, sel_bundleForClass_, v82);

      uint64_t v168 = sub_23F9A6090();
      uint64_t v182 = v84;

      v77((uint64_t)v79, v80, v15);
      unint64_t v85 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      v167 = (char *)swift_allocObject();
      uint64_t v67 = v169;
      v77((uint64_t)&v167[v85], v79, v15);
      long long v181 = sub_23F9A5358;
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v78 = v182;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v181)(v182, 1, 1, v15);
  }
  sub_23F9A0394(v78, &qword_268C5BD78);
  uint64_t v168 = 0;
  long long v181 = 0;
  uint64_t v182 = 0;
  v167 = 0;
LABEL_36:
  id v86 = objc_msgSend(v47, sel_localizedResponseTime);
  if (!v86)
  {
LABEL_39:
    uint64_t v166 = 0;
    uint64_t v161 = 0;
    uint64_t v164 = 0;
    uint64_t v165 = 0;
    goto LABEL_41;
  }
  uint64_t v87 = v86;
  uint64_t v88 = sub_23F9A67F0();
  uint64_t v90 = v89;

  if (sub_23F9A197C())
  {
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  id v91 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t v92 = swift_getObjCClassFromMetadata();
  id v93 = objc_msgSend(self, sel_bundleForClass_, v92);

  uint64_t v166 = sub_23F9A6090();
  uint64_t v161 = v94;

  uint64_t v95 = swift_allocObject();
  *(void *)(v95 + 16) = v88;
  *(void *)(v95 + 24) = v90;
  uint64_t v165 = v95;
  uint64_t v164 = sub_23F9A5620;
LABEL_41:
  if (objc_msgSend(v47, sel_hoursConfig))
  {
    sub_23F9A6950();
    swift_unknownObjectRelease();
    sub_23F9A0394((uint64_t)v195, &qword_268C5C298);
    id v96 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    uint64_t v97 = swift_getObjCClassFromMetadata();
    id v98 = objc_msgSend(self, sel_bundleForClass_, v97);

    uint64_t v160 = sub_23F9A6090();
    uint64_t v163 = v99;

    uint64_t v100 = swift_allocObject();
    *(void *)(v100 + 16) = v47;
    id v101 = v47;
    uint64_t v102 = sub_23F9A534C;
  }
  else
  {
    memset(v195, 0, sizeof(v195));
    sub_23F9A0394((uint64_t)v195, &qword_268C5C298);
    uint64_t v160 = 0;
    uint64_t v163 = 0;
    uint64_t v102 = 0;
    uint64_t v100 = 0;
  }
  uint64_t v103 = v180;
  uint64_t v104 = v162;
  *uint64_t v162 = v180;
  uint64_t v105 = v103;
  uint64_t v180 = v103;
  uint64_t v106 = v179;
  v104[1] = v179;
  uint64_t v107 = v106;
  uint64_t v179 = v106;
  v108 = v177;
  v104[2] = v177;
  unsigned __int8 v177 = v108;
  uint64_t v109 = v178;
  v104[3] = v178;
  uint64_t v178 = v109;
  uint64_t v110 = v176;
  uint64_t v111 = v190;
  v104[4] = v176;
  v104[5] = v111;
  uint64_t v112 = v175;
  v104[6] = v174;
  v104[7] = v112;
  uint64_t v175 = v112;
  uint64_t v113 = v188;
  v104[8] = v189;
  v104[9] = v113;
  uint64_t v114 = v173;
  v104[10] = v172;
  v104[11] = v114;
  uint64_t v173 = v114;
  uint64_t v115 = v186;
  v104[12] = v187;
  v104[13] = v115;
  uint64_t v116 = v185;
  v104[14] = v171;
  v104[15] = v116;
  uint64_t v117 = (uint64_t)v183;
  v104[16] = v184;
  v104[17] = v117;
  uint64_t v118 = v170;
  v104[18] = v67;
  v104[19] = v118;
  uint64_t v170 = v118;
  uint64_t v119 = v182;
  v104[20] = v168;
  v104[21] = v119;
  uint64_t v120 = v167;
  v104[22] = v181;
  v104[23] = v120;
  uint64_t v121 = v161;
  v104[24] = v166;
  v104[25] = v121;
  uint64_t v122 = v165;
  v104[26] = v164;
  v104[27] = v122;
  uint64_t v123 = v160;
  uint64_t v124 = v163;
  v104[28] = v160;
  v104[29] = v124;
  v104[30] = v102;
  v104[31] = v100;
  uint64_t v159 = v100;
  sub_23F9A5268(v105, v107);
  sub_23F9A5244(v110, v190);
  sub_23F9A5268(v189, v188);
  sub_23F9A5244(v187, v186);
  sub_23F9A5268((uint64_t)v184, (uint64_t)v183);
  uint64_t v125 = v168;
  sub_23F9A5268(v168, v182);
  uint64_t v126 = v166;
  sub_23F9A5268(v166, v121);
  uint64_t v127 = v163;
  sub_23F9A5268(v123, v163);
  sub_23F9A52AC(v123, v127);
  sub_23F9A52AC(v126, v121);
  sub_23F9A52AC(v125, v182);
  sub_23F9A52AC((uint64_t)v184, (uint64_t)v183);
  sub_23F9A52F0(v187, v186);
  sub_23F9A52AC(v189, v188);
  sub_23F9A52F0(v176, v190);
  return sub_23F9A52AC(v180, v179);
}

uint64_t sub_23F9A4514@<X0>(void *a1@<X8>)
{
  return sub_23F9A2FC0(*(void **)(v1 + 16), a1);
}

uint64_t sub_23F9A451C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F9A60E0();
  MEMORY[0x270FA5388](v6);
  v10[0] = a1;
  v10[1] = a2;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  sub_23F99BAA0();
  swift_bridgeObjectRetain();
  return sub_23F9A65C0();
}

uint64_t sub_23F9A4620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23F9A60E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C2A0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23F9A60C0();
  if (v13) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = 0xE000000000000000;
  if (v13) {
    unint64_t v15 = v13;
  }
  v17[0] = v14;
  v17[1] = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_23F99BAA0();
  sub_23F9A65C0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v11, v8);
}

uint64_t sub_23F9A47CC@<X0>(uint64_t a1@<X8>)
{
  sub_23F99BAA0();
  swift_bridgeObjectRetain();
  uint64_t result = sub_23F9A6610();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

__n128 sub_23F9A4838@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  uint64_t v4 = sub_23F9A6780();
  sub_23F99E26C(0.0, 0, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v19, 0.0, 1, 0.0, 1, v4, v5, v3);

  uint64_t v6 = v19[1];
  char v7 = v20;
  uint64_t v8 = v21;
  char v9 = v22;
  uint64_t v10 = v23;
  char v11 = v24;
  uint64_t v12 = v25;
  char v13 = v26;
  uint64_t v14 = v27;
  char v15 = v28;
  uint64_t v16 = v29;
  char v17 = v30;
  __n128 result = v31;
  *(void *)a2 = v19[0];
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v8;
  *(unsigned char *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(unsigned char *)(a2 + 48) = v11;
  *(void *)(a2 + 56) = v12;
  *(unsigned char *)(a2 + 64) = v13;
  *(void *)(a2 + 72) = v14;
  *(unsigned char *)(a2 + 80) = v15;
  *(void *)(a2 + 88) = v16;
  *(unsigned char *)(a2 + 96) = v17;
  *(__n128 *)(a2 + 104) = result;
  return result;
}

uint64_t sub_23F9A491C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23F9A62C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5C290);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  uint64_t v13 = sub_23F9A6090();
  uint64_t v15 = v14;

  uint64_t v21 = v13;
  uint64_t v22 = v15;
  sub_23F99BAA0();
  uint64_t v21 = sub_23F9A6610();
  uint64_t v22 = v16;
  char v23 = v17 & 1;
  uint64_t v24 = v18;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F18440], v2);
  sub_23F9A6660();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23F99FC10(v21, v22, v23);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  uint64_t v19 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C5C188) + 36);
  *(_OWORD *)uint64_t v19 = xmmword_23F9A7E60;
  *(_OWORD *)(v19 + 16) = xmmword_23F9A7E70;
  *(unsigned char *)(v19 + 32) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_23F9A4BFC()
{
  unint64_t result = qword_268C5C1C0;
  if (!qword_268C5C1C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5C188);
    swift_getOpaqueTypeConformance2();
    sub_23F9A0928(&qword_268C5C170, &qword_268C5C168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C1C0);
  }
  return result;
}

double sub_23F9A4CCC@<D0>(__n128 *a1@<X8>)
{
  *(void *)&double result = sub_23F9A2CB0(a1).n128_u64[0];
  return result;
}

unint64_t sub_23F9A4CD4()
{
  unint64_t result = qword_268C5C1E0[0];
  if (!qword_268C5C1E0[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5C1D8);
    sub_23F9A0928(&qword_268C5C170, &qword_268C5C168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268C5C1E0);
  }
  return result;
}

uint64_t sub_23F9A4D74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F9A4DB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F9A4DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_23F9A4DE0()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_23F9A4E1C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_23F9A4E68(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23F9A4ED0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for BrandCardRowView()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for BrandCardDetailView()
{
  return &type metadata for BrandCardDetailView;
}

uint64_t sub_23F9A4F48()
{
  return swift_getWitnessTable();
}

unint64_t sub_23F9A5098()
{
  unint64_t result = qword_268C5C268;
  if (!qword_268C5C268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C5C270);
    sub_23F9A0928(&qword_268C5C1A8, &qword_268C5C180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C268);
  }
  return result;
}

ValueMetadata *type metadata accessor for HoursView()
{
  return &type metadata for HoursView;
}

unint64_t sub_23F9A514C()
{
  unint64_t result = qword_268C5C278;
  if (!qword_268C5C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C278);
  }
  return result;
}

_OWORD *sub_23F9A51A0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_23F9A51B0()
{
  unint64_t result = qword_268C5C280;
  if (!qword_268C5C280)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C5C280);
  }
  return result;
}

unint64_t sub_23F9A51F0()
{
  unint64_t result = qword_268C5C288;
  if (!qword_268C5C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5C288);
  }
  return result;
}

uint64_t sub_23F9A5244(uint64_t result, uint64_t a2)
{
  if (a2 != 1) {
    return sub_23F9A5268(result, a2);
  }
  return result;
}

uint64_t sub_23F9A5268(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_23F9A52AC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_23F9A52F0(uint64_t result, uint64_t a2)
{
  if (a2 != 1) {
    return sub_23F9A52AC(result, a2);
  }
  return result;
}

uint64_t sub_23F9A5314()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double sub_23F9A534C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_23F9A4838((void *)*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_23F9A535C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23F9A5394@<X0>(uint64_t a1@<X8>)
{
  return sub_23F9A47CC(a1);
}

uint64_t sub_23F9A53BC()
{
  uint64_t v1 = *(void *)(sub_23F9A60E0() - 8);
  return sub_23F9A451C(*(void *)(v0 + 16), *(void *)(v0 + 24), v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v1 = sub_23F9A60E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v1 = sub_23F9A60E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_23F9A5588@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_23F9A60E0() - 8);
  return sub_23F9A4620(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_23F9A6070()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_23F9A6080()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23F9A6090()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23F9A60A0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23F9A60B0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23F9A60C0()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_23F9A60D0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23F9A60E0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23F9A60F0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23F9A6100()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23F9A6110()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_23F9A6120()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_23F9A6130()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_23F9A6140()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23F9A6150()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23F9A6160()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_23F9A6170()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_23F9A6180()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_23F9A6190()
{
  return MEMORY[0x270EF1628]();
}

uint64_t sub_23F9A61A0()
{
  return MEMORY[0x270EF1688]();
}

uint64_t sub_23F9A61B0()
{
  return MEMORY[0x270EF16A8]();
}

uint64_t sub_23F9A61C0()
{
  return MEMORY[0x270F12920]();
}

uint64_t sub_23F9A61D0()
{
  return MEMORY[0x270F12928]();
}

uint64_t sub_23F9A61E0()
{
  return MEMORY[0x270F12930]();
}

uint64_t sub_23F9A61F0()
{
  return MEMORY[0x270F12938]();
}

uint64_t sub_23F9A6200()
{
  return MEMORY[0x270F12940]();
}

uint64_t sub_23F9A6210()
{
  return MEMORY[0x270F12948]();
}

uint64_t sub_23F9A6220()
{
  return MEMORY[0x270F12950]();
}

uint64_t sub_23F9A6230()
{
  return MEMORY[0x270F12958]();
}

uint64_t sub_23F9A6240()
{
  return MEMORY[0x270F12960]();
}

uint64_t sub_23F9A6250()
{
  return MEMORY[0x270F12968]();
}

uint64_t sub_23F9A6260()
{
  return MEMORY[0x270F12970]();
}

uint64_t sub_23F9A6270()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_23F9A6280()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23F9A6290()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23F9A62A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23F9A62B0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_23F9A62C0()
{
  return MEMORY[0x270EFEDC8]();
}

uint64_t sub_23F9A62D0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_23F9A62E0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_23F9A62F0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23F9A6300()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_23F9A6310()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_23F9A6320()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_23F9A6330()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_23F9A6340()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_23F9A6350()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_23F9A6360()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_23F9A6370()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_23F9A6380()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_23F9A6390()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_23F9A63A0()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_23F9A63B0()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_23F9A63C0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_23F9A63D0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_23F9A63E0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_23F9A63F0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_23F9A6400()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_23F9A6410()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_23F9A6420()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_23F9A6430()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_23F9A6440()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_23F9A6450()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_23F9A6470()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_23F9A6480()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_23F9A6490()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_23F9A64A0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_23F9A64B0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_23F9A64C0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_23F9A64E0()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_23F9A64F0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23F9A6500()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_23F9A6510()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23F9A6520()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_23F9A6530()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_23F9A6540()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_23F9A6550()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_23F9A6560()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_23F9A6570()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_23F9A6580()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_23F9A6590()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_23F9A65A0()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_23F9A65B0()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_23F9A65C0()
{
  return MEMORY[0x270F02DA8]();
}

uint64_t sub_23F9A65D0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_23F9A65E0()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_23F9A65F0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_23F9A6600()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_23F9A6610()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_23F9A6620()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23F9A6630()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23F9A6640()
{
  return MEMORY[0x270F03670]();
}

uint64_t sub_23F9A6650()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23F9A6660()
{
  return MEMORY[0x270F03870]();
}

uint64_t sub_23F9A6670()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_23F9A6680()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_23F9A6690()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_23F9A66A0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_23F9A66B0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_23F9A66C0()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_23F9A66D0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_23F9A66E0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_23F9A66F0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_23F9A6700()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_23F9A6710()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23F9A6720()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23F9A6730()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23F9A6740()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_23F9A6750()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_23F9A6760()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_23F9A6770()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_23F9A6780()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_23F9A6790()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_23F9A67A0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_23F9A67B0()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_23F9A67C0()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_23F9A67D0()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_23F9A67E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23F9A67F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23F9A6800()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23F9A6810()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23F9A6820()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_23F9A6830()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23F9A6840()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23F9A6850()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_23F9A6860()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23F9A6870()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23F9A6880()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23F9A6890()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23F9A68A0()
{
  return MEMORY[0x270EE5820]();
}

uint64_t sub_23F9A68B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23F9A68C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23F9A68D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23F9A68E0()
{
  return MEMORY[0x270F826C8]();
}

uint64_t sub_23F9A68F0()
{
  return MEMORY[0x270F828A8]();
}

uint64_t sub_23F9A6900()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_23F9A6910()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23F9A6920()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23F9A6930()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_23F9A6940()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23F9A6950()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23F9A6960()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23F9A6970()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23F9A6980()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23F9A6990()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23F9A69A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23F9A69B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23F9A69C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23F9A69D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23F9A69E0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x270F1B718]();
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x270F30140]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}