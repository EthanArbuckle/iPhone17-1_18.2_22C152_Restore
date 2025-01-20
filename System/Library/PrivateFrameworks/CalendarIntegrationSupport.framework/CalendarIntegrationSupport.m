uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t IntegrationData.collections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationData.collections.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*IntegrationData.collections.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationData.sourceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationData.sourceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*IntegrationData.sourceID.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationData.sourceTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationData.sourceTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*IntegrationData.sourceTitle.modify())()
{
  return nullsub_1;
}

void __swiftcall IntegrationData.init(collections:sourceID:sourceTitle:)(CalendarIntegrationSupport::IntegrationData *__return_ptr retstr, Swift::OpaquePointer collections, Swift::String sourceID, Swift::String sourceTitle)
{
  retstr->collections = collections;
  retstr->sourceID = sourceID;
  retstr->sourceTitle = sourceTitle;
}

uint64_t initializeBufferWithCopyOfBuffer for IntegrationCollection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IntegrationData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for IntegrationData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for IntegrationData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
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

void *assignWithTake for IntegrationData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationData(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationData()
{
  return &type metadata for IntegrationData;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_26B1602E0[0])
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, qword_26B1602E0);
    }
  }
}

uint64_t IntegrationCollection.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationCollection.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntegrationCollection.identifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.collectionPersonaIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationCollection.collectionPersonaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*IntegrationCollection.collectionPersonaIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationCollection.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*IntegrationCollection.title.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.dataSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2496B637C(v1 + 48, a1);
}

uint64_t sub_2496B637C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t IntegrationCollection.dataSource.setter(long long *a1)
{
  uint64_t v3 = v1 + 48;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_2496B6424(a1, v3);
}

uint64_t sub_2496B6424(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*IntegrationCollection.dataSource.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.init(identifier:title:dataSource:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, long long *a5@<X4>, void *a6@<X8>)
{
  a6[2] = 0;
  a6[3] = 0;
  *a6 = a1;
  a6[1] = a2;
  a6[4] = a3;
  a6[5] = a4;
  return sub_2496B6424(a5, (uint64_t)(a6 + 6));
}

uint64_t destroy for IntegrationCollection(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 48);
}

uint64_t initializeWithCopy for IntegrationCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = a2 + 48;
  long long v7 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v7;
  uint64_t v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(a1 + 48, v6, v8);
  return a1;
}

void *assignWithCopy for IntegrationCollection(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
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
        v11 = *(uint64_t (**)(void))(v10 + 24);
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

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for IntegrationCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationCollection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationCollection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationCollection()
{
  return &type metadata for IntegrationCollection;
}

uint64_t IntegrationSync.__allocating_init(eventStoreProvider:integrationData:)(id (*a1)(), uint64_t a2, long long *a3)
{
  uint64_t v6 = swift_allocObject();
  long long v12 = a3[1];
  long long v13 = *a3;
  uint64_t v7 = *((void *)a3 + 4);
  uint64_t v8 = os_transaction_create();
  if (a1) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = 0;
  }
  *(void *)(v6 + 64) = v9;
  *(void *)(v6 + 72) = v8;
  if (a1) {
    uint64_t v10 = a1;
  }
  else {
    uint64_t v10 = sub_2496B6A9C;
  }
  *(_OWORD *)(v6 + 16) = v13;
  *(_OWORD *)(v6 + 32) = v12;
  *(void *)(v6 + 48) = v7;
  *(void *)(v6 + 56) = v10;
  return v6;
}

uint64_t IntegrationSync.init(eventStoreProvider:integrationData:)(id (*a1)(), uint64_t a2, long long *a3)
{
  long long v11 = a3[1];
  long long v12 = *a3;
  uint64_t v6 = *((void *)a3 + 4);
  uint64_t v7 = os_transaction_create();
  if (a1) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = 0;
  }
  *(void *)(v3 + 64) = v8;
  *(void *)(v3 + 72) = v7;
  if (a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = sub_2496B6A9C;
  }
  *(_OWORD *)(v3 + 16) = v12;
  *(_OWORD *)(v3 + 32) = v11;
  *(void *)(v3 + 48) = v6;
  *(void *)(v3 + 56) = v9;
  return v3;
}

id sub_2496B6A9C()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04B98]), sel_initWithEKOptions_, 8320);
  if (result)
  {
    id v1 = result;
    objc_msgSend(result, sel_setAllowsIntegrationModifications_, 1);
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2496B6AF4()
{
  id v1 = v0;
  uint64_t v130 = *MEMORY[0x263EF8340];
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v118 = MEMORY[0x263F8EE88];
  uint64_t v4 = (void *)v0[2];
  uint64_t v5 = v4[2];
  unint64_t v110 = v2;
  uint64_t v106 = v3;
  if (v5)
  {
    uint64_t v112 = v0[6];
    uint64_t v113 = v0[5];
    v111 = (uint64_t (*)(uint64_t))v0[7];
    uint64_t v108 = v0[8];
    uint64_t v6 = (uint64_t)(v4 + 4);
    v114 = (void *)v0[2];
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v116 = v5;
      sub_2496BAFDC(v6, (uint64_t)&v125);
      uint64_t v7 = (uint64_t)v125;
      uint64_t v8 = v126;
      swift_bridgeObjectRetain();
      sub_2496BAE2C((uint64_t *)&v119, v7, v8);
      swift_bridgeObjectRelease();
      sub_2496BAFDC((uint64_t)&v125, (uint64_t)&v119);
      uint64_t v9 = type metadata accessor for IntegrationSync.SyncDataProvider();
      uint64_t v10 = swift_allocObject();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = MEMORY[0x263F8EE78];
      *(void *)(v10 + 168) = sub_2496B85F8(MEMORY[0x263F8EE78], &qword_26B160358);
      *(void *)(v10 + 176) = sub_2496B85F8(v11, &qword_26B160360);
      *(void *)(v10 + 184) = 0;
      *(void *)(v10 + 16) = v111;
      *(void *)(v10 + 24) = v108;
      uint64_t v12 = swift_retain();
      uint64_t v13 = v111(v12);
      swift_release();
      long long v14 = v122;
      *(_OWORD *)(v10 + 72) = v121;
      *(_OWORD *)(v10 + 88) = v14;
      *(_OWORD *)(v10 + 104) = v123;
      long long v15 = v120;
      *(_OWORD *)(v10 + 40) = v119;
      *(void *)(v10 + 32) = v13;
      *(void *)(v10 + 136) = v106;
      *(void *)(v10 + 144) = v2;
      *(void *)(v10 + 152) = v113;
      *(void *)(v10 + 160) = v112;
      *(void *)(v10 + 120) = v124;
      *(void *)(v10 + 128) = v114;
      *(_OWORD *)(v10 + 56) = v15;
      type metadata accessor for IntegrationCollectionSync();
      uint64_t inited = swift_initStackObject();
      *((void *)&v120 + 1) = v9;
      *(void *)&long long v121 = &off_26FD404D8;
      *(void *)&long long v119 = v10;
      swift_retain_n();
      *(void *)(inited + 64) = sub_2496B8710(v11);
      sub_2496B637C((uint64_t)&v119, inited + 16);
      v17 = *(void **)(v10 + 32);
      *(void *)(inited + 56) = v17;
      sub_2496BAFDC(v10 + 40, inited + 72);
      id v18 = v17;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v119);
      swift_release_n();
      sub_2496D0FB8();
      sub_2496BB05C((uint64_t)&v125);
      swift_setDeallocating();
      __swift_destroy_boxed_opaque_existential_1(inited + 16);

      swift_bridgeObjectRelease();
      sub_2496BB05C(inited + 72);
      swift_release();
      uint64_t v2 = v110;
      v6 += 88;
      uint64_t v5 = v116 - 1;
    }
    while (v116 != 1);
    uint64_t v4 = v114;
    swift_bridgeObjectRelease();
    id v1 = v96;
    uint64_t v3 = v106;
  }
  v19 = v1;
  uint64_t v20 = ((uint64_t (*)(void))v1[7])();
  uint64_t v21 = v19[5];
  uint64_t v22 = v19[6];
  id v125 = v4;
  uint64_t v126 = v3;
  v23 = (void *)v20;
  uint64_t v127 = v2;
  uint64_t v128 = v21;
  uint64_t v129 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v97 = sub_2496B7D80(v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = v97;
  char v101 = 0;
  int64_t v25 = 0;
  v94 = v97 + 8;
  uint64_t v26 = 1 << *((unsigned char *)v97 + 32);
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  else {
    uint64_t v27 = -1;
  }
  unint64_t v28 = v27 & v97[8];
  int64_t v95 = (unint64_t)(v26 + 63) >> 6;
  id v105 = v23;
LABEL_14:
  if (v28)
  {
    uint64_t v99 = (v28 - 1) & v28;
    int64_t v100 = v25;
    unint64_t v30 = __clz(__rbit64(v28)) | (v25 << 6);
    goto LABEL_27;
  }
  BOOL v31 = __OFADD__(v25, 1);
  int64_t v32 = v25 + 1;
  if (v31) {
    goto LABEL_114;
  }
  if (v32 >= v95) {
    goto LABEL_102;
  }
  unint64_t v33 = v94[v32];
  if (!v33)
  {
    int64_t v34 = v32 + 1;
    if (v32 + 1 >= v95) {
      goto LABEL_102;
    }
    unint64_t v33 = v94[v34];
    if (v33) {
      goto LABEL_25;
    }
    int64_t v34 = v32 + 2;
    if (v32 + 2 >= v95) {
      goto LABEL_102;
    }
    unint64_t v33 = v94[v34];
    if (v33)
    {
LABEL_25:
      int64_t v32 = v34;
      goto LABEL_26;
    }
    int64_t v34 = v32 + 3;
    if (v32 + 3 < v95)
    {
      unint64_t v33 = v94[v34];
      if (v33) {
        goto LABEL_25;
      }
      while (1)
      {
        int64_t v32 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          __break(1u);
        }
        if (v32 >= v95) {
          break;
        }
        unint64_t v33 = v94[v32];
        ++v34;
        if (v33) {
          goto LABEL_26;
        }
      }
    }
LABEL_102:
    swift_release();
    swift_bridgeObjectRelease();
    if (v101)
    {
      id v125 = 0;
      if (!objc_msgSend(v23, sel_commitWithRollback_, &v125))
      {
        id v84 = v125;
        uint64_t v2 = sub_2496D7AC8();

        swift_willThrow();
        goto LABEL_108;
      }
      id v82 = v125;
    }

    return;
  }
LABEL_26:
  uint64_t v99 = (v33 - 1) & v33;
  int64_t v100 = v32;
  unint64_t v30 = __clz(__rbit64(v33)) + (v32 << 6);
LABEL_27:
  v35 = (uint64_t *)(v24[6] + 16 * v30);
  uint64_t v98 = *v35;
  unint64_t v104 = v35[1];
  v36 = *(void **)(v24[7] + 8 * v30);
  swift_bridgeObjectRetain();
  id v103 = v36;
  id v37 = objc_msgSend(v103, sel_calendarsForEntityType_, 0);
  sub_2496BC414(0, &qword_26B1602B8);
  sub_2496BB0B0();
  uint64_t v38 = sub_2496D7ED8();

  if ((v38 & 0xC000000000000001) != 0)
  {
    sub_2496D8008();
    sub_2496D7EF8();
    uint64_t v109 = *((void *)&v119 + 1);
    uint64_t v38 = v119;
    uint64_t v2 = *((void *)&v120 + 1);
    uint64_t v39 = v120;
    uint64_t v40 = v121;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v41 = -1 << *(unsigned char *)(v38 + 32);
    uint64_t v109 = v38 + 56;
    uint64_t v42 = ~v41;
    uint64_t v43 = -v41;
    if (v43 < 64) {
      uint64_t v44 = ~(-1 << v43);
    }
    else {
      uint64_t v44 = -1;
    }
    uint64_t v40 = v44 & *(void *)(v38 + 56);
    uint64_t v39 = v42;
  }
  char v115 = 0;
  int64_t v107 = (unint64_t)(v39 + 64) >> 6;
  while (2)
  {
    uint64_t v45 = v2;
    for (unint64_t i = v40; ; unint64_t i = v40)
    {
      if ((v38 & 0x8000000000000000) == 0)
      {
        if (i)
        {
          uint64_t v40 = (i - 1) & i;
          unint64_t v47 = __clz(__rbit64(i)) | (v45 << 6);
          uint64_t v2 = v45;
          goto LABEL_51;
        }
        uint64_t v2 = v45 + 1;
        if (!__OFADD__(v45, 1))
        {
          if (v2 >= v107) {
            goto LABEL_86;
          }
          unint64_t v49 = *(void *)(v109 + 8 * v2);
          if (v49) {
            goto LABEL_50;
          }
          uint64_t v50 = v45 + 2;
          if (v45 + 2 >= v107) {
            goto LABEL_86;
          }
          unint64_t v49 = *(void *)(v109 + 8 * v50);
          if (v49) {
            goto LABEL_49;
          }
          uint64_t v50 = v45 + 3;
          if (v45 + 3 >= v107) {
            goto LABEL_86;
          }
          unint64_t v49 = *(void *)(v109 + 8 * v50);
          if (v49)
          {
LABEL_49:
            uint64_t v2 = v50;
LABEL_50:
            uint64_t v40 = (v49 - 1) & v49;
            unint64_t v47 = __clz(__rbit64(v49)) + (v2 << 6);
LABEL_51:
            id v48 = *(id *)(*(void *)(v38 + 48) + 8 * v47);
            if (!v48) {
              goto LABEL_86;
            }
            goto LABEL_52;
          }
          uint64_t v2 = v45 + 4;
          if (v45 + 4 >= v107) {
            goto LABEL_86;
          }
          unint64_t v49 = *(void *)(v109 + 8 * v2);
          if (v49) {
            goto LABEL_50;
          }
          uint64_t v66 = v45 + 5;
          while (v107 != v66)
          {
            unint64_t v49 = *(void *)(v109 + 8 * v66++);
            if (v49)
            {
              uint64_t v2 = v66 - 1;
              goto LABEL_50;
            }
          }
LABEL_86:
          sub_2496BC3B0();
          if (v115)
          {
LABEL_13:

            swift_bridgeObjectRelease();
            v23 = v105;
            v24 = v97;
            unint64_t v28 = v99;
            int64_t v25 = v100;
            goto LABEL_14;
          }
          if (qword_26B160270 != -1) {
            swift_once();
          }
          uint64_t v73 = sub_2496D7D88();
          __swift_project_value_buffer(v73, (uint64_t)qword_26B160698);
          id v74 = v103;
          swift_bridgeObjectRetain_n();
          id v75 = v74;
          swift_retain();
          v76 = sub_2496D7D68();
          os_log_type_t v77 = sub_2496D7F48();
          if (os_log_type_enabled(v76, v77))
          {
            uint64_t v78 = swift_slowAlloc();
            uint64_t v2 = swift_slowAlloc();
            id v125 = (id)v2;
            *(_DWORD *)uint64_t v78 = 136315394;
            swift_bridgeObjectRetain();
            sub_2496BA7D4(v106, v110, (uint64_t *)&v125);
            sub_2496D7FC8();
            swift_release();
            swift_bridgeObjectRelease();
            *(_WORD *)(v78 + 12) = 2080;
            if (v104) {
              uint64_t v79 = v98;
            }
            else {
              uint64_t v79 = 0x296C6C756E28;
            }
            if (v104) {
              unint64_t v80 = v104;
            }
            else {
              unint64_t v80 = 0xE600000000000000;
            }
            swift_bridgeObjectRetain();
            sub_2496BA7D4(v79, v80, (uint64_t *)&v125);
            sub_2496D7FC8();

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2496B3000, v76, v77, "Source %s with persona %s has no calendars and will be removed.", (uint8_t *)v78, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x24C5A8E90](v2, -1, -1);
            MEMORY[0x24C5A8E90](v78, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_release();
          }
          id v125 = 0;
          v23 = v105;
          if (objc_msgSend(v105, sel_removeSource_commit_error_, v75, 0, &v125))
          {
            id v29 = v125;
            char v101 = 1;
            goto LABEL_13;
          }
          id v83 = v125;
          swift_bridgeObjectRelease();
          uint64_t v2 = sub_2496D7AC8();

          swift_willThrow();
          swift_release();
          swift_bridgeObjectRelease();

LABEL_108:
          goto LABEL_109;
        }
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        swift_once();
        goto LABEL_110;
      }
      if (!sub_2496D8028()) {
        goto LABEL_86;
      }
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v48 = v125;
      swift_unknownObjectRelease();
      uint64_t v2 = v45;
      uint64_t v40 = i;
      if (!v48) {
        goto LABEL_86;
      }
LABEL_52:
      v117 = v48;
      id v51 = objc_msgSend(v48, sel_externalID);
      if (!v51)
      {
        uint64_t v53 = 0;
        unint64_t v55 = 0;
        goto LABEL_76;
      }
      v52 = v51;
      uint64_t v53 = sub_2496D7E38();
      unint64_t v55 = v54;

      if (!*(void *)(v118 + 16)) {
        goto LABEL_76;
      }
      uint64_t v56 = v38;
      sub_2496D82D8();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496D7E48();
      uint64_t v57 = sub_2496D8308();
      uint64_t v58 = -1 << *(unsigned char *)(v118 + 32);
      unint64_t v59 = v57 & ~v58;
      if (((*(void *)(v118 + 56 + ((v59 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v59) & 1) == 0) {
        goto LABEL_75;
      }
      uint64_t v60 = *(void *)(v118 + 48);
      v61 = (void *)(v60 + 16 * v59);
      BOOL v62 = *v61 == v53 && v61[1] == v55;
      if (!v62 && (sub_2496D8258() & 1) == 0) {
        break;
      }
LABEL_35:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v56;
      swift_bridgeObjectRelease();

      char v115 = 1;
      uint64_t v45 = v2;
    }
    uint64_t v63 = ~v58;
    while (1)
    {
      unint64_t v59 = (v59 + 1) & v63;
      if (((*(void *)(v118 + 56 + ((v59 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v59) & 1) == 0) {
        break;
      }
      v64 = (void *)(v60 + 16 * v59);
      BOOL v65 = *v64 == v53 && v64[1] == v55;
      if (v65 || (sub_2496D8258() & 1) != 0) {
        goto LABEL_35;
      }
    }
LABEL_75:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = v56;
LABEL_76:
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_2496D7D88();
    __swift_project_value_buffer(v67, (uint64_t)qword_26B160698);
    swift_bridgeObjectRetain();
    v68 = sub_2496D7D68();
    os_log_type_t v69 = sub_2496D7F48();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = swift_slowAlloc();
      v102 = (void *)swift_slowAlloc();
      id v125 = v102;
      *(_DWORD *)uint64_t v70 = 136315138;
      if (v55)
      {
        unint64_t v71 = v55;
      }
      else
      {
        uint64_t v53 = 0x296C6C756E28;
        unint64_t v71 = 0xE600000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v70 + 4) = sub_2496BA7D4(v53, v71, (uint64_t *)&v125);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2496B3000, v68, v69, "Removing a calendar with an unknown identifier %s", (uint8_t *)v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A8E90](v102, -1, -1);
      MEMORY[0x24C5A8E90](v70, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v125 = 0;
    if (objc_msgSend(v105, sel_removeCalendar_commit_error_, v117, 0, &v125))
    {
      id v72 = v125;

      char v101 = 1;
      continue;
    }
    break;
  }
  id v81 = v125;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_2496D7AC8();

  swift_willThrow();
  swift_bridgeObjectRelease();

  sub_2496BC3B0();
  swift_release();
LABEL_109:
  if (qword_26B160270 != -1) {
    goto LABEL_115;
  }
LABEL_110:
  uint64_t v85 = sub_2496D7D88();
  __swift_project_value_buffer(v85, (uint64_t)qword_26B160698);
  id v86 = (id)v2;
  id v87 = (id)v2;
  v88 = sub_2496D7D68();
  os_log_type_t v89 = sub_2496D7F48();
  if (os_log_type_enabled(v88, v89))
  {
    v90 = (uint8_t *)swift_slowAlloc();
    v91 = (void *)swift_slowAlloc();
    *(_DWORD *)v90 = 138412290;
    id v92 = (id)v2;
    v93 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v125 = v93;
    sub_2496D7FC8();
    void *v91 = v93;

    _os_log_impl(&dword_2496B3000, v88, v89, "Calendar cleanup following sync failed: %@", v90, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B160670);
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v91, -1, -1);
    MEMORY[0x24C5A8E90](v90, -1, -1);
  }
  else
  {
  }
}

void *sub_2496B7D80(void *a1)
{
  v75[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = v1[1];
  id v5 = (id)v1[2];
  id v67 = (id)v1[4];
  uint64_t v68 = v1[3];
  uint64_t v73 = (void *)sub_2496B85F8(MEMORY[0x263F8EE78], &qword_26B160360);
  id v66 = a1;
  id v6 = objc_msgSend(a1, sel_sources);
  sub_2496BC414(0, (unint64_t *)&unk_26B160320);
  unint64_t v7 = sub_2496D7E98();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_3;
    }
LABEL_59:
    swift_bridgeObjectRelease();
    return v73;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_59;
  }
LABEL_3:
  char v64 = 0;
  unint64_t v10 = 0;
  unint64_t v74 = v7 & 0xC000000000000001;
  uint64_t v72 = v7 & 0xFFFFFFFFFFFFFF8;
  *(void *)&long long v8 = 138412290;
  long long v63 = v8;
  uint64_t v69 = v4;
  unint64_t v70 = v7;
  uint64_t v71 = v9;
  do
  {
    while (1)
    {
      if (v74)
      {
        id v11 = (id)MEMORY[0x24C5A85A0](v10, v7);
      }
      else
      {
        if (v10 >= *(void *)(v72 + 16)) {
          goto LABEL_56;
        }
        id v11 = *(id *)(v7 + 8 * v10 + 32);
      }
      id v2 = v11;
      unint64_t v12 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        id v61 = v6;
        swift_bridgeObjectRelease();
        sub_2496D7AC8();

        swift_willThrow();
        swift_bridgeObjectRelease();

        return v73;
      }
      id v6 = objc_msgSend(v11, sel_sourceType);
      if (v6 != (id)sub_2496D7F28()
        || (id v13 = objc_msgSend(v2, sel_externalID)) == 0)
      {

        goto LABEL_5;
      }
      long long v14 = v13;
      uint64_t v15 = sub_2496D7E38();
      id v6 = v16;

      if (v15 == v4 && v6 == v5)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v17 = sub_2496D8258();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {

          unint64_t v7 = v70;
          uint64_t v9 = v71;
          goto LABEL_5;
        }
      }
      unint64_t v18 = (unint64_t)v5;
      id v19 = objc_msgSend(v2, sel_personaIdentifier, v63);
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = sub_2496D7E38();
        uint64_t v23 = v22;
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v23 = 0;
      }
      if (v73[2])
      {
        swift_bridgeObjectRetain();
        sub_2496D50EC(v21, v23);
        char v25 = v24;
        swift_bridgeObjectRelease();
        if (v25) {
          break;
        }
      }
      swift_bridgeObjectRelease();
      id v33 = objc_msgSend(v2, sel_personaIdentifier);
      if (v33)
      {
        int64_t v34 = v33;
        uint64_t v35 = sub_2496D7E38();
        uint64_t v37 = v36;
      }
      else
      {
        uint64_t v35 = 0;
        uint64_t v37 = 0;
      }
      uint64_t v4 = v69;
      id v5 = (id)v18;
      id v2 = v2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v75[0] = v73;
      sub_2496D5C80((uint64_t)v2, v35, v37, isUniquelyReferenced_nonNull_native);
      uint64_t v73 = v75[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v39 = objc_msgSend(v2, sel_title);
      uint64_t v40 = sub_2496D7E38();
      id v6 = v41;

      unint64_t v7 = v70;
      if (v40 == v68 && v6 == v67)
      {
        id v6 = v67;

        swift_bridgeObjectRelease();
        uint64_t v9 = v71;
        goto LABEL_5;
      }
      char v42 = sub_2496D8258();
      swift_bridgeObjectRelease();
      if (v42)
      {

        uint64_t v9 = v71;
        goto LABEL_5;
      }
      uint64_t v56 = (void *)sub_2496D7E28();
      objc_msgSend(v2, sel_setTitle_, v56);

      v75[0] = 0;
      unsigned int v57 = objc_msgSend(v66, sel_saveSource_commit_error_, v2, 0, v75);
      id v6 = v75[0];
      if (!v57) {
        goto LABEL_57;
      }
      id v58 = v75[0];

      char v64 = 1;
      ++v10;
      uint64_t v9 = v71;
      if (v12 == v71)
      {
        swift_bridgeObjectRelease();
        goto LABEL_52;
      }
    }
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_2496D7D88();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B160698);
    unint64_t v27 = v18;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    unint64_t v28 = sub_2496D7D68();
    os_log_type_t v29 = sub_2496D7F48();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      BOOL v65 = (void *)swift_slowAlloc();
      v75[0] = v65;
      *(_DWORD *)uint64_t v30 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v30 + 4) = sub_2496BA7D4(v69, v27, (uint64_t *)v75);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 12) = 2080;
      if (v23) {
        uint64_t v31 = v21;
      }
      else {
        uint64_t v31 = 0x746C75616665643CLL;
      }
      if (v23) {
        unint64_t v32 = v23;
      }
      else {
        unint64_t v32 = 0xE90000000000003ELL;
      }
      swift_bridgeObjectRetain();
      *(void *)(v30 + 14) = sub_2496BA7D4(v31, v32, (uint64_t *)v75);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2496B3000, v28, v29, "Duplicate source with ID %s for persona %s. Arbitrarily removing one.", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5A8E90](v65, -1, -1);
      MEMORY[0x24C5A8E90](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v5 = (id)v27;
    uint64_t v9 = v71;
    v75[0] = 0;
    unsigned int v43 = objc_msgSend(v66, sel_removeSource_commit_error_, v2, 1, v75);
    id v6 = v75[0];
    unint64_t v7 = v70;
    if (v43)
    {
      id v44 = v75[0];

      uint64_t v4 = v69;
    }
    else
    {
      id v45 = v75[0];
      v46 = (void *)sub_2496D7AC8();

      swift_willThrow();
      id v47 = v46;
      id v48 = v46;
      unint64_t v49 = sub_2496D7D68();
      os_log_type_t v50 = sub_2496D7F48();
      id v6 = (id)v50;
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = swift_slowAlloc();
        v52 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v51 = v63;
        id v53 = v46;
        uint64_t v54 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v51 + 4) = v54;
        void *v52 = v54;

        _os_log_impl(&dword_2496B3000, v49, (os_log_type_t)v6, "Error removing source: %@", (uint8_t *)v51, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B160670);
        swift_arrayDestroy();
        unint64_t v55 = v52;
        unint64_t v7 = v70;
        MEMORY[0x24C5A8E90](v55, -1, -1);
        MEMORY[0x24C5A8E90](v51, -1, -1);
      }
      else
      {
      }
      uint64_t v4 = v69;
      uint64_t v9 = v71;
    }
LABEL_5:
    ++v10;
  }
  while (v12 != v9);
  swift_bridgeObjectRelease();
  if ((v64 & 1) == 0) {
    return v73;
  }
LABEL_52:
  v75[0] = 0;
  if (objc_msgSend(v66, sel_commitWithRollback_, v75, (void)v63))
  {
    id v59 = v75[0];
  }
  else
  {
    id v60 = v75[0];
    sub_2496D7AC8();

    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  return v73;
}

unint64_t sub_2496B85F8(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2496D81E8();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  id v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    long long v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_2496D50EC(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
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

unint64_t sub_2496B8710(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B160678);
  id v2 = (void *)sub_2496D81E8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 64);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 4);
    uint64_t v6 = (uint64_t)*(v4 - 3);
    uint64_t v7 = (uint64_t)*(v4 - 2);
    uint64_t v8 = (uint64_t)*(v4 - 1);
    id v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v10 = v9;
    unint64_t result = sub_2496D5190(v5, v6, v7, v8);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = (uint64_t *)(v2[6] + 32 * result);
    *uint64_t v13 = v5;
    v13[1] = v6;
    v13[2] = v7;
    v13[3] = v8;
    *(void *)(v2[7] + 8 * result) = v10;
    uint64_t v14 = v2[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v2[2] = v16;
    v4 += 5;
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

unint64_t sub_2496B8854(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2696CAAD0);
  id v2 = (void *)sub_2496D81E8();
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
    unint64_t result = sub_2496D5230(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    *char v11 = v5;
    v11[1] = v6;
    char v12 = (void *)(v2[7] + 16 * result);
    *char v12 = v8;
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

unint64_t sub_2496B8978(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B160368);
  id v2 = (void *)sub_2496D81E8();
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
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2496D5230(v5, v6);
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

unint64_t sub_2496B8A94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160688);
  uint64_t v2 = sub_2496D81E8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v19 = v2 + 64;
  swift_retain();
  uint64_t v5 = (unint64_t *)(a1 + 80);
  while (1)
  {
    uint64_t v6 = *(v5 - 5);
    uint64_t v7 = *(v5 - 4);
    uint64_t v8 = *(v5 - 3);
    uint64_t v9 = *(v5 - 2);
    uint64_t v10 = *(v5 - 1);
    unint64_t v11 = *v5;
    id v12 = (id)*(v5 - 6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2496BBA60(v10, v11);
    unint64_t result = sub_2496D52A8((uint64_t)v12);
    if (v14) {
      break;
    }
    *(void *)(v19 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v12;
    uint64_t v15 = (void *)(v3[7] + 48 * result);
    *uint64_t v15 = v6;
    v15[1] = v7;
    v15[2] = v8;
    v15[3] = v9;
    v15[4] = v10;
    v15[5] = v11;
    uint64_t v16 = v3[2];
    BOOL v17 = __OFADD__(v16, 1);
    uint64_t v18 = v16 + 1;
    if (v17) {
      goto LABEL_11;
    }
    v3[2] = v18;
    v5 += 7;
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

void *sub_2496B8BEC()
{
  uint64_t v2 = (void *)v0[23];
  if (v2)
  {
    swift_bridgeObjectRetain();
    return v2;
  }
  uint64_t v2 = v0;
  sub_2496BA510();
  if (v1) {
    return v2;
  }
  swift_beginAccess();
  char v42 = v0;
  uint64_t v3 = swift_bridgeObjectRetain();
  unint64_t v4 = (unint64_t)sub_2496BBAB8(v3);
  swift_bridgeObjectRelease();
  uint64_t v49 = MEMORY[0x263F8EE78];
  if ((v4 & 0x8000000000000000) != 0 || (v4 & 0x4000000000000000) != 0) {
    goto LABEL_56;
  }
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
LABEL_57:
    swift_release();
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_58;
  }
  while (1)
  {
    unint64_t v6 = 0;
    unint64_t v39 = v4 & 0xC000000000000001;
    unint64_t v36 = v4 + 32;
    uint64_t v37 = v5;
    unint64_t v38 = v4;
LABEL_9:
    if (v39)
    {
      id v7 = (id)MEMORY[0x24C5A85A0](v6, v4);
    }
    else
    {
      if (v6 >= *(void *)(v4 + 16)) {
        goto LABEL_55;
      }
      id v7 = *(id *)(v36 + 8 * v6);
    }
    id v8 = v7;
    BOOL v9 = __OFADD__(v6, 1);
    unint64_t v10 = v6 + 1;
    if (!v9) {
      break;
    }
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2496D81B8();
    swift_release();
    if (!v5) {
      goto LABEL_57;
    }
  }
  unint64_t v41 = v10;
  id v11 = objc_msgSend(v7, sel_calendarsForEntityType_, 0);
  sub_2496BC414(0, &qword_26B1602B8);
  unint64_t v4 = sub_2496BB0B0();
  uint64_t v12 = sub_2496D7ED8();

  uint64_t v40 = v8;
  if ((v12 & 0xC000000000000001) != 0)
  {
    sub_2496D8008();
    sub_2496D7EF8();
    uint64_t v12 = v44;
    uint64_t v13 = v45;
    uint64_t v14 = v46;
    uint64_t v15 = v47;
    unint64_t v16 = v48;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = -1 << *(unsigned char *)(v12 + 32);
    uint64_t v13 = v12 + 56;
    uint64_t v14 = ~v17;
    uint64_t v18 = -v17;
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    else {
      uint64_t v19 = -1;
    }
    unint64_t v16 = v19 & *(void *)(v12 + 56);
  }
  int64_t v20 = (unint64_t)(v14 + 64) >> 6;
  while (1)
  {
    uint64_t v21 = v15;
    if ((v12 & 0x8000000000000000) == 0) {
      break;
    }
    uint64_t v24 = sub_2496D8028();
    if (!v24) {
      goto LABEL_8;
    }
    unint64_t v4 = v24;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v25 = v43;
    swift_unknownObjectRelease();
    if (!v43) {
      goto LABEL_8;
    }
LABEL_43:
    id v29 = objc_msgSend(v25, sel_externalID);
    if (!v29 || (v30 = v29, v31 = sub_2496D7E38(), unint64_t v4 = v32, v30, !v4))
    {
LABEL_21:

      continue;
    }
    if (v31 == v42[5] && v4 == v42[6])
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v33 = sub_2496D8258();
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0) {
        goto LABEL_21;
      }
    }
    id v34 = v25;
    unint64_t v4 = (unint64_t)&v49;
    MEMORY[0x24C5A8390]();
    if (*(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2496D7EB8();
    }
    sub_2496D7EC8();
    sub_2496D7EA8();
  }
  if (v16)
  {
    unint64_t v22 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v23 = v22 | (v15 << 6);
    goto LABEL_42;
  }
  int64_t v26 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
    goto LABEL_54;
  }
  if (v26 >= v20) {
    goto LABEL_8;
  }
  unint64_t v27 = *(void *)(v13 + 8 * v26);
  ++v15;
  if (v27) {
    goto LABEL_41;
  }
  uint64_t v15 = v21 + 2;
  if (v21 + 2 >= v20) {
    goto LABEL_8;
  }
  unint64_t v27 = *(void *)(v13 + 8 * v15);
  if (v27) {
    goto LABEL_41;
  }
  uint64_t v15 = v21 + 3;
  if (v21 + 3 >= v20) {
    goto LABEL_8;
  }
  unint64_t v27 = *(void *)(v13 + 8 * v15);
  if (v27) {
    goto LABEL_41;
  }
  uint64_t v15 = v21 + 4;
  if (v21 + 4 >= v20) {
    goto LABEL_8;
  }
  unint64_t v27 = *(void *)(v13 + 8 * v15);
  if (v27)
  {
LABEL_41:
    unint64_t v16 = (v27 - 1) & v27;
    unint64_t v23 = __clz(__rbit64(v27)) + (v15 << 6);
LABEL_42:
    id v25 = *(id *)(*(void *)(v12 + 48) + 8 * v23);
    if (!v25) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
  uint64_t v28 = v21 + 5;
  while (v20 != v28)
  {
    unint64_t v27 = *(void *)(v13 + 8 * v28++);
    if (v27)
    {
      uint64_t v15 = v28 - 1;
      goto LABEL_41;
    }
  }
LABEL_8:
  sub_2496BC3B0();

  unint64_t v4 = v38;
  unint64_t v6 = v41;
  if (v41 != v37) {
    goto LABEL_9;
  }
  swift_release();
  uint64_t v2 = (void *)v49;
LABEL_58:
  v42[23] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2496B907C(void *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  v133[11] = *(id *)MEMORY[0x263EF8340];
  id v8 = (id *)(v2 + 168);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v2 + 168);
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_2496D50EC((uint64_t)a1, a2);
    if (v11)
    {
      id v126 = *(id *)(*(void *)(v9 + 56) + 8 * v10);
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v12 = sub_2496BA16C(a1, a2);
  if (v3) {
    return (uint64_t)v126;
  }
  v114 = v8;
  char v115 = v12;
  id v14 = objc_msgSend(v12, sel_calendarsForEntityType_, 0);
  unint64_t v15 = sub_2496BC414(0, &qword_26B1602B8);
  sub_2496BB0B0();
  unint64_t v16 = sub_2496D7ED8();

  if ((v16 & 0xC000000000000001) != 0)
  {
    sub_2496D8008();
    sub_2496D7EF8();
    unint64_t v16 = (unint64_t)v133[6];
    long long v122 = v133[7];
    id v17 = v133[8];
    int64_t v18 = (int64_t)v133[9];
    unint64_t v19 = (unint64_t)v133[10];
  }
  else
  {
    int64_t v18 = 0;
    uint64_t v20 = -1 << *(unsigned char *)(v16 + 32);
    long long v122 = (void *)(v16 + 56);
    uint64_t v21 = ~v20;
    uint64_t v22 = -v20;
    if (v22 < 64) {
      uint64_t v23 = ~(-1 << v22);
    }
    else {
      uint64_t v23 = -1;
    }
    id v17 = (id)v21;
    unint64_t v19 = v23 & *(void *)(v16 + 56);
  }
  id v126 = 0;
  int64_t v121 = ((unint64_t)v17 + 64) >> 6;
  uint64_t v24 = 0x746C75616665643CLL;
  if (a2) {
    uint64_t v24 = (uint64_t)a1;
  }
  uint64_t v117 = v24;
  unint64_t v25 = 0xE90000000000003ELL;
  if (a2) {
    unint64_t v25 = a2;
  }
  unint64_t v116 = v25;
  uint64_t v120 = v5;
  unint64_t v128 = v16;
  uint64_t v125 = a2;
  uint64_t v118 = a1;
  for (i = v15; ; unint64_t v15 = i)
  {
    while (1)
    {
      while (1)
      {
        unint64_t v129 = v19;
        if ((v16 & 0x8000000000000000) != 0)
        {
          uint64_t v28 = (void *)sub_2496D8028();
          if (!v28)
          {
            unint64_t v15 = (unint64_t)v115;
            goto LABEL_129;
          }
          v132 = v28;
          swift_unknownObjectRetain();
          swift_dynamicCast();
          int64_t v29 = v18;
          id v30 = v133[0];
          swift_unknownObjectRelease();
          int64_t v27 = v29;
          uint64_t v131 = v129;
          if (!v30) {
            goto LABEL_125;
          }
        }
        else
        {
          if (v19)
          {
            uint64_t v131 = (v19 - 1) & v19;
            unint64_t v26 = __clz(__rbit64(v19)) | (v18 << 6);
            int64_t v27 = v18;
          }
          else
          {
            int64_t v27 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              goto LABEL_151;
            }
            if (v27 >= v121)
            {
LABEL_128:
              unint64_t v15 = (unint64_t)v115;
LABEL_129:
              sub_2496BC3B0();
              if (!v126)
              {
                id v104 = objc_msgSend(self, sel_calendarForEntityType_eventStore_, 0, *(void *)(v5 + 32));
                swift_bridgeObjectRetain();
                id v105 = (void *)sub_2496D7E28();
                swift_bridgeObjectRelease();
                objc_msgSend(v104, sel_setTitle_, v105);

                swift_bridgeObjectRetain();
                uint64_t v106 = (void *)sub_2496D7E28();
                swift_bridgeObjectRelease();
                objc_msgSend(v104, sel_setExternalID_, v106);

                objc_msgSend(v104, sel_setSource_, v15);
                objc_msgSend(v104, sel_setImmutable_, 1);
                int64_t v107 = *(void **)(v5 + 32);
                v133[0] = 0;
                unsigned int v108 = objc_msgSend(v107, sel_saveCalendar_commit_error_, v104, 1, v133);
                id v109 = v133[0];
                if (v108)
                {
                  id v126 = v104;
                  if (*(void *)(v5 + 184))
                  {
                    v133[0] = *(id *)(v5 + 184);
                    id v110 = v109;
                    swift_bridgeObjectRetain();
                    unint64_t v16 = (unint64_t)v104;
                    MEMORY[0x24C5A8390]();
                    if (*(void *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                      goto LABEL_154;
                    }
                    goto LABEL_134;
                  }
                  id v113 = v133[0];

                  return (uint64_t)v126;
                }
                id v111 = v133[0];
                sub_2496D7AC8();

                swift_willThrow();
              }

              return (uint64_t)v126;
            }
            unint64_t v31 = v122[v27];
            if (!v31)
            {
              int64_t v32 = v18 + 2;
              if (v18 + 2 >= v121) {
                goto LABEL_128;
              }
              unint64_t v31 = v122[v32];
              if (v31) {
                goto LABEL_33;
              }
              int64_t v32 = v18 + 3;
              if (v18 + 3 >= v121) {
                goto LABEL_128;
              }
              unint64_t v31 = v122[v32];
              if (v31)
              {
LABEL_33:
                int64_t v27 = v32;
              }
              else
              {
                int64_t v27 = v18 + 4;
                if (v18 + 4 >= v121) {
                  goto LABEL_128;
                }
                unint64_t v31 = v122[v27];
                if (!v31)
                {
                  id v83 = (char *)(v18 + 5);
                  unint64_t v15 = (unint64_t)v115;
                  do
                  {
                    if ((char *)v121 == v83) {
                      goto LABEL_129;
                    }
                    unint64_t v31 = v122[(void)v83++];
                  }
                  while (!v31);
                  int64_t v27 = (int64_t)(v83 - 1);
                }
              }
            }
            uint64_t v131 = (v31 - 1) & v31;
            unint64_t v26 = __clz(__rbit64(v31)) + (v27 << 6);
          }
          id v30 = *(id *)(*(void *)(v16 + 48) + 8 * v26);
          if (!v30)
          {
LABEL_125:
            unint64_t v15 = (unint64_t)v115;
            goto LABEL_129;
          }
        }
        int64_t v130 = v27;
        id v33 = objc_msgSend(v30, sel_externalID);
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = sub_2496D7E38();
          uint64_t v37 = v36;

          if (v37) {
            break;
          }
        }
LABEL_19:

        int64_t v18 = v130;
        unint64_t v19 = v131;
        unint64_t v16 = v128;
        unint64_t v15 = i;
      }
      if (v35 == *(void *)(v5 + 40) && v37 == *(void *)(v5 + 48))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v38 = sub_2496D8258();
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0) {
          goto LABEL_19;
        }
      }
      if (v126) {
        break;
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v15 = (unint64_t)v30;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v85 = a2;
      char v86 = isUniquelyReferenced_nonNull_native;
      v132 = *v114;
      id v87 = v132;
      id *v114 = (id)0x8000000000000000;
      unint64_t v16 = sub_2496D50EC((uint64_t)a1, v85);
      uint64_t v89 = v87[2];
      BOOL v90 = (v88 & 1) == 0;
      uint64_t v91 = v89 + v90;
      if (__OFADD__(v89, v90)) {
        goto LABEL_153;
      }
      char v92 = v88;
      if (v87[3] >= v91)
      {
        if ((v86 & 1) == 0) {
          sub_2496D6500();
        }
        a2 = v125;
        int64_t v95 = v132;
        if (v92) {
          goto LABEL_113;
        }
      }
      else
      {
        sub_2496D52EC(v91, v86);
        a2 = v125;
        unint64_t v93 = sub_2496D50EC((uint64_t)a1, v125);
        if ((v92 & 1) != (v94 & 1)) {
          goto LABEL_159;
        }
        unint64_t v16 = v93;
        int64_t v95 = v132;
        if (v92)
        {
LABEL_113:
          uint64_t v96 = v4;
          uint64_t v97 = v95[7];
          uint64_t v98 = 8 * v16;

          *(void *)(v97 + v98) = v15;
          uint64_t v4 = v96;
          goto LABEL_119;
        }
      }
      v95[(v16 >> 6) + 8] |= 1 << v16;
      uint64_t v99 = (void *)(v95[6] + 16 * v16);
      *uint64_t v99 = a1;
      v99[1] = a2;
      *(void *)(v95[7] + 8 * v16) = v15;
      uint64_t v100 = v95[2];
      BOOL v74 = __OFADD__(v100, 1);
      uint64_t v101 = v100 + 1;
      if (v74) {
        __break(1u);
      }
      v95[2] = v101;
      swift_bridgeObjectRetain();
LABEL_119:
      unint64_t v15 = i;
      id *v114 = v95;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      id v126 = v30;
      unint64_t v16 = v128;
      int64_t v18 = v130;
      unint64_t v19 = v131;
    }
    uint64_t v124 = v4;
    uint64_t v39 = qword_26B160270;
    unint64_t v15 = (unint64_t)v126;
    if (v39 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_2496D7D88();
    __swift_project_value_buffer(v40, (uint64_t)qword_26B160698);
    swift_bridgeObjectRetain_n();
    swift_retain();
    unint64_t v41 = sub_2496D7D68();
    os_log_type_t v42 = sub_2496D7F48();
    long long v123 = (void *)v15;
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      long long v119 = (void *)swift_slowAlloc();
      v133[0] = v119;
      *(_DWORD *)uint64_t v43 = 136315650;
      uint64_t v45 = *(void *)(v5 + 40);
      unint64_t v44 = *(void *)(v5 + 48);
      swift_bridgeObjectRetain();
      v132 = (void *)sub_2496BA7D4(v45, v44, (uint64_t *)v133);
      sub_2496D7FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v46 = *(void *)(v5 + 136);
      unint64_t v47 = *(void *)(v5 + 144);
      swift_bridgeObjectRetain();
      v132 = (void *)sub_2496BA7D4(v46, v47, (uint64_t *)v133);
      sub_2496D7FC8();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2080;
      swift_bridgeObjectRetain();
      v132 = (void *)sub_2496BA7D4(v117, v116, (uint64_t *)v133);
      sub_2496D7FC8();
      a1 = v118;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2496B3000, v41, v42, "Duplicate calendar with ID %s in source %s in persona %s. Arbitrarily keeping the first one and deleting this one. Resetting mod tag on the first to cause a full sync.", (uint8_t *)v43, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C5A8E90](v119, -1, -1);
      uint64_t v48 = v43;
      unint64_t v15 = (unint64_t)v123;
      MEMORY[0x24C5A8E90](v48, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    uint64_t v4 = v124;
    id v49 = objc_msgSend(v30, sel_eventStore);
    if (!v49) {
      break;
    }
    os_log_type_t v50 = v49;
    v133[0] = 0;
    unsigned __int8 v51 = objc_msgSend(v49, sel_removeCalendar_commit_error_, v30, 0, v133);

    id v52 = v133[0];
    if ((v51 & 1) == 0) {
      goto LABEL_126;
    }
    id v53 = v133[0];
    objc_msgSend((id)v15, sel_setExternalModificationTag_, 0);
    id v54 = objc_msgSend((id)v15, sel_eventStore);
    if (!v54) {
      goto LABEL_157;
    }
    unint64_t v55 = v54;
    v133[0] = 0;
    unsigned __int8 v56 = objc_msgSend(v54, sel_saveCalendar_commit_error_, v15, 0, v133);

    id v52 = v133[0];
    if ((v56 & 1) == 0)
    {
LABEL_126:
      id v103 = v52;
      sub_2496D7AC8();

      swift_willThrow();
LABEL_137:
      sub_2496BC3B0();
      return (uint64_t)v126;
    }
    id v57 = v133[0];
    unint64_t v58 = (unint64_t)sub_2496B8BEC();
    v133[0] = (id)v58;
    id v30 = v30;
    unint64_t v59 = swift_bridgeObjectRetain();
    uint64_t v5 = sub_2496BBF90(v59, (uint64_t)v30);
    unint64_t v16 = v60;
    swift_bridgeObjectRelease();

    if (v16)
    {
      if (v58 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v5 = sub_2496D81B8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v5 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
    }
    else
    {
      unint64_t v16 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_152;
      }
      if (v58 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v102 = sub_2496D81B8();
        swift_bridgeObjectRelease();
        if (v16 != v102)
        {
LABEL_56:
          uint64_t v61 = v5 + 5;
          while (1)
          {
            unint64_t v15 = v61 - 4;
            if ((v58 & 0xC000000000000001) != 0)
            {
              id v62 = (id)MEMORY[0x24C5A85A0](v61 - 4, v58);
            }
            else
            {
              if ((v15 & 0x8000000000000000) != 0)
              {
                __break(1u);
LABEL_141:
                __break(1u);
LABEL_142:
                __break(1u);
LABEL_143:
                __break(1u);
LABEL_144:
                __break(1u);
LABEL_145:
                __break(1u);
LABEL_146:
                __break(1u);
LABEL_147:
                __break(1u);
LABEL_148:
                __break(1u);
LABEL_149:
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                sub_2496D7EB8();
LABEL_134:
                id v126 = (id)v16;
                sub_2496D7EC8();
                sub_2496D7EA8();

                *(id *)(v5 + 184) = v133[0];
LABEL_4:
                swift_bridgeObjectRelease();
                return (uint64_t)v126;
              }
              if (v15 >= *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_141;
              }
              id v62 = *(id *)(v58 + 8 * v61);
            }
            long long v63 = v62;
            unint64_t v16 = (unint64_t)objc_msgSend(v62, sel_isEqual_, v30);

            if ((v16 & 1) == 0)
            {
              if (v15 != v5)
              {
                if ((v58 & 0xC000000000000001) != 0)
                {
                  uint64_t v65 = MEMORY[0x24C5A85A0](v5, v58);
                  id v66 = (id)MEMORY[0x24C5A85A0](v61 - 4, v58);
                }
                else
                {
                  if (v5 < 0) {
                    goto LABEL_144;
                  }
                  unint64_t v16 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  if (v5 >= v16) {
                    goto LABEL_145;
                  }
                  id v64 = *(id *)(v58 + 8 * v5 + 32);
                  if ((v15 & 0x8000000000000000) != 0) {
                    goto LABEL_146;
                  }
                  if (v15 >= v16) {
                    goto LABEL_148;
                  }
                  uint64_t v65 = (uint64_t)v64;
                  id v66 = *(id *)(v58 + 8 * v61);
                }
                id v67 = v66;
                if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                  || (v58 & 0x8000000000000000) != 0
                  || (v58 & 0x4000000000000000) != 0)
                {
                  sub_2496BBF14(v58);
                  unint64_t v58 = (unint64_t)v68;
                  v133[0] = v68;
                }
                uint64_t v69 = *(void **)((v58 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20);
                *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v67;

                sub_2496D7EA8();
                unint64_t v70 = (unint64_t)v133[0];
                if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                  || (v70 & 0x8000000000000000) != 0
                  || (v70 & 0x4000000000000000) != 0)
                {
                  sub_2496BBF14(v70);
                  unint64_t v70 = (unint64_t)v71;
                  v133[0] = v71;
                }
                if ((v15 & 0x8000000000000000) != 0) {
                  goto LABEL_147;
                }
                uint64_t v72 = v70 & 0xFFFFFFFFFFFFFF8;
                if (v15 >= *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_149;
                }
                uint64_t v73 = *(void **)(v72 + 8 * v61);
                *(void *)(v72 + 8 * v61) = v65;

                sub_2496D7EA8();
              }
              BOOL v74 = __OFADD__(v5++, 1);
              if (v74) {
                goto LABEL_143;
              }
            }
            unint64_t v16 = v61 - 3;
            if (__OFADD__(v15, 1)) {
              goto LABEL_142;
            }
            unint64_t v58 = (unint64_t)v133[0];
            if ((unint64_t)v133[0] >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v75 = sub_2496D81B8();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v75 = *(void *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            ++v61;
            if (v16 == v75)
            {
              uint64_t v4 = 0;
              break;
            }
          }
        }
      }
      else if (v16 != *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_56;
      }
    }
    if (v58 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_2496D81B8();
      swift_bridgeObjectRelease();
      if ((uint64_t)v15 < v5) {
        goto LABEL_150;
      }
    }
    else
    {
      unint64_t v15 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if ((uint64_t)v15 < v5) {
        goto LABEL_150;
      }
    }
    sub_2496BC094(v5, v15);
    uint64_t v5 = v120;
    *(id *)(v120 + 184) = v133[0];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v76 = *(void **)(v120 + 56);
    uint64_t v77 = *(void *)(v120 + 64);
    if (!v125)
    {
      if (!v77) {
        goto LABEL_98;
      }
LABEL_100:
      swift_bridgeObjectRetain();
      uint64_t v78 = (void *)sub_2496B907C(v76, v77);
      swift_bridgeObjectRelease();
      objc_msgSend(v78, sel_setExternalModificationTag_, 0);
      id v79 = objc_msgSend(v78, sel_eventStore);
      if (!v79) {
        goto LABEL_158;
      }
      unint64_t v80 = v79;
      swift_bridgeObjectRelease();
      v132 = 0;
      unsigned __int8 v81 = objc_msgSend(v80, sel_saveCalendar_commit_error_, v78, 0, &v132);

      a2 = v125;
      if ((v81 & 1) == 0)
      {
        uint64_t v112 = v132;
        sub_2496D7AC8();

        swift_willThrow();
        goto LABEL_137;
      }
      id v82 = v132;

      goto LABEL_19;
    }
    if (!v77 || (v76 != a1 || v77 != v125) && (sub_2496D8258() & 1) == 0) {
      goto LABEL_100;
    }
LABEL_98:

    swift_bridgeObjectRelease();
    int64_t v18 = v130;
    unint64_t v19 = v131;
    unint64_t v16 = v128;
    a2 = v125;
  }

  __break(1u);
LABEL_157:

  __break(1u);
LABEL_158:

  __break(1u);
LABEL_159:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAAE0);
  uint64_t result = sub_2496D8288();
  __break(1u);
  return result;
}

uint64_t sub_2496BA0B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[2];
  uint64_t v3 = swift_retain();
  uint64_t v4 = v2(v3);
  swift_release();
  uint64_t v5 = (void *)v0[4];
  v0[4] = v4;

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x263F8EE80];
  v1[22] = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[21] = v6;
  swift_bridgeObjectRelease();
  v1[23] = 0;
  return swift_bridgeObjectRelease();
}

id sub_2496BA16C(id a1, uint64_t a2)
{
  uint64_t v4 = v2;
  v30[6] = *(id *)MEMORY[0x263EF8340];
  sub_2496BA510();
  if (v3) {
    return a1;
  }
  swift_beginAccess();
  uint64_t v8 = v2[22];
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_2496D50EC((uint64_t)a1, a2);
    if (v10)
    {
      a1 = *(id *)(*(void *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id result = objc_msgSend(self, sel_sourceWithEventStore_, v4[4]);
  if (result)
  {
    char v11 = result;
    uint64_t v28 = (uint64_t)a1;
    if (a2) {
      id v12 = (void *)sub_2496D7E28();
    }
    else {
      id v12 = 0;
    }
    objc_msgSend(v11, sel_setPendingPersonaIdentifierForNewSource_, v12, v4 + 22);

    uint64_t v13 = v4[19];
    uint64_t v14 = v4[20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v15 = objc_msgSend(v11, sel_title);
    uint64_t v16 = sub_2496D7E38();
    uint64_t v18 = v17;

    if (v16 == v13 && v18 == v14)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v19 = sub_2496D8258();
      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v20 = (void *)sub_2496D7E28();
        objc_msgSend(v11, sel_setTitle_, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    objc_msgSend(v11, sel_setSourceType_, sub_2496D7F28());
    swift_bridgeObjectRetain();
    uint64_t v21 = (void *)sub_2496D7E28();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setExternalID_, v21);

    uint64_t v22 = (void *)v4[4];
    v30[0] = 0;
    unsigned int v23 = objc_msgSend(v22, sel_saveSource_commit_error_, v11, 1, v30);
    a1 = v30[0];
    if (v23)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      id v24 = a1;
      a1 = v11;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v29 = *v27;
      *int64_t v27 = 0x8000000000000000;
      sub_2496D5C80((uint64_t)a1, v28, a2, isUniquelyReferenced_nonNull_native);
      *int64_t v27 = v29;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
    else
    {
      id v26 = v30[0];
      sub_2496D7AC8();

      swift_willThrow();
    }
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_2496BA510()
{
  uint64_t v2 = v1;
  uint64_t v3 = (void *)(v0 + 176);
  uint64_t result = swift_beginAccess();
  if (!*(void *)(*(void *)(v0 + 176) + 16))
  {
    uint64_t v5 = *(void **)(v0 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v6 = v5;
    id v7 = sub_2496B7D80(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v2)
    {
      *uint64_t v3 = v7;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_2496BA5F4()
{
  swift_release();

  sub_2496BB05C(v0 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 192, 7);
}

id sub_2496BA684()
{
  return *(id *)(*(void *)v0 + 32);
}

uint64_t sub_2496BA690@<X0>(uint64_t a1@<X8>)
{
  return sub_2496BAFDC(*v1 + 40, a1);
}

void *sub_2496BA6A0()
{
  return sub_2496B8BEC();
}

uint64_t sub_2496BA6C4(void *a1, uint64_t a2)
{
  return sub_2496B907C(a1, a2);
}

uint64_t sub_2496BA6E8()
{
  return sub_2496BA0B4();
}

uint64_t IntegrationSync.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t IntegrationSync.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_2496BA7D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2496BA8A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2496BC3B8((uint64_t)v12, *a3);
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
      sub_2496BC3B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2496BA8A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2496D7FD8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2496BAA64(a5, a6);
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
  uint64_t v8 = sub_2496D8098();
  if (!v8)
  {
    sub_2496D81A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2496D81F8();
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

uint64_t sub_2496BAA64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2496BAAFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2496BACDC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2496BACDC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2496BAAFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2496BAC74(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2496D8068();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2496D81A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2496D7E58();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2496D81F8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2496D81A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2496BAC74(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1603A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2496BACDC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1603A8);
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
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

uint64_t sub_2496BAE2C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2496D82D8();
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  uint64_t v8 = sub_2496D8308();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2496D8258() & 1) != 0)
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
      if (v19 || (sub_2496D8258() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2496BB460(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2496BAFDC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t type metadata accessor for IntegrationSync.SyncDataProvider()
{
  return self;
}

uint64_t sub_2496BB05C(uint64_t a1)
{
  return a1;
}

unint64_t sub_2496BB0B0()
{
  unint64_t result = qword_26B1602C0;
  if (!qword_26B1602C0)
  {
    sub_2496BC414(255, &qword_26B1602B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1602C0);
  }
  return result;
}

uint64_t type metadata accessor for IntegrationSync()
{
  return self;
}

uint64_t method lookup function for IntegrationSync(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntegrationSync);
}

uint64_t dispatch thunk of IntegrationSync.__allocating_init(eventStoreProvider:integrationData:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of IntegrationSync.sync()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t sub_2496BB180()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B160330);
  uint64_t v3 = sub_2496D8058();
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
      sub_2496D82D8();
      sub_2496D7E48();
      uint64_t result = sub_2496D8308();
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

uint64_t sub_2496BB460(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2496BB180();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2496BB5FC();
      goto LABEL_22;
    }
    sub_2496BB7B0();
  }
  uint64_t v11 = *v4;
  sub_2496D82D8();
  sub_2496D7E48();
  uint64_t result = sub_2496D8308();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2496D8258(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2496D8278();
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
          uint64_t result = sub_2496D8258();
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

void *sub_2496BB5FC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B160330);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2496D8048();
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
    void *v19 = *v17;
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

uint64_t sub_2496BB7B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B160330);
  uint64_t v3 = sub_2496D8058();
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
    sub_2496D82D8();
    swift_bridgeObjectRetain();
    sub_2496D7E48();
    uint64_t result = sub_2496D8308();
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

uint64_t sub_2496BBA60(uint64_t a1, unint64_t a2)
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

void *sub_2496BBAB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1603B8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_2496BBD18(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2496BC3B0();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2496BBBA4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = 2 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B15FC50);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 17;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

void *sub_2496BBD18(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_2496BBF14(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2496D81B8();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x24C5A85B0);
}

uint64_t sub_2496BBF90(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C5A85A0](v5, a1) : *(id *)(a1 + 8 * v5 + 32);
      uint64_t v7 = v6;
      unsigned __int8 v8 = objc_msgSend(v6, sel_isEqual_, a2);

      if (v8) {
        break;
      }
      uint64_t v9 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_12:
        swift_bridgeObjectRetain();
        uint64_t v4 = sub_2496D81B8();
        swift_bridgeObjectRelease();
        uint64_t v5 = 0;
        if (!v4) {
          return v5;
        }
      }
      else
      {
        ++v5;
        if (v9 == v4) {
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_2496BC094(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2496D81B8();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x24C5A85B0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  int64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_2496BC414(0, &qword_26B1602B8);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_2496D81B8();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_2496D81F8();
          __break(1u);
          return result;
        }
        int64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_2496D81B8();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_2496D7EA8();
}

uint64_t sub_2496BC3B0()
{
  return swift_release();
}

uint64_t sub_2496BC3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2496BC414(uint64_t a1, unint64_t *a2)
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

id IntegrationServer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *IntegrationServer.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager;
  type metadata accessor for IntegrationSyncManager();
  swift_allocObject();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_2496BCE88();
  uint64_t v3 = OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160350);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 20) = 0;
  *(_WORD *)(v4 + 16) = 0;
  *(void *)&v2[v3] = v4;
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v6 = objc_allocWithZone(MEMORY[0x263F30020]);
  aBlock[4] = sub_2496BCAD0;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2496BCAD8;
  aBlock[3] = &block_descriptor;
  uint64_t v7 = _Block_copy(aBlock);
  swift_retain();
  id v8 = objc_msgSend(v6, sel_initWithStateChangedCallback_, v7);
  _Block_release(v7);
  swift_release();
  *(void *)&v2[OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_deviceLockObserver] = v8;

  v13.receiver = v2;
  v13.super_class = (Class)type metadata accessor for IntegrationServer();
  unint64_t v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  uint64_t v10 = *(void **)&v9[OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_deviceLockObserver];
  uint64_t v11 = v9;
  if (objc_msgSend(v10, sel_hasBeenUnlockedSinceBoot)) {
    sub_2496BC960();
  }
  swift_release();

  return v11;
}

void sub_2496BC680(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C5A8F20](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_2496BC960();
  }
}

void sub_2496BC710()
{
}

uint64_t sub_2496BC72C(uint64_t result)
{
  *(unsigned char *)(result + 1) = 1;
  return result;
}

void sub_2496BC79C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0
                                        + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager)
                            + 32);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2496BCB58(v2);
  os_unfair_lock_unlock(v3);
}

void sub_2496BC878()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0
                                        + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager)
                            + 32);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2496BCB74(v2);
  os_unfair_lock_unlock(v3);
}

unsigned char *sub_2496BC954(unsigned char *result)
{
  *uint64_t result = 1;
  return result;
}

void sub_2496BC960()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_lock);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2496BCDF8(v2, &v7);
  os_unfair_lock_unlock(v3);
  if (v7 == 1)
  {
    uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v0
                                          + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager)
                              + 32);
    uint64_t v5 = v4 + 4;
    id v6 = v4 + 5;
    os_unfair_lock_lock(v4 + 5);
    sub_2496BCE6C(v5);
    os_unfair_lock_unlock(v6);
  }
}

id IntegrationServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntegrationServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2496BCA98()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2496BCAD0()
{
  sub_2496BC680(v0);
}

uint64_t sub_2496BCAD8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

uint64_t type metadata accessor for IntegrationServer()
{
  return self;
}

void sub_2496BCB58(unsigned char *a1)
{
}

void sub_2496BCB74(unsigned char *a1)
{
}

uint64_t method lookup function for IntegrationServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntegrationServer);
}

uint64_t dispatch thunk of IntegrationServer.startServer()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of IntegrationServer.requestRegularSync()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of IntegrationServer.requestCatchupSync()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationServer.StartedState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationServer.StartedState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2496BCDC0);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationServer.StartedState()
{
  return &type metadata for IntegrationServer.StartedState;
}

unsigned char *sub_2496BCDF8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  int v3 = result;
  if (*result == 1 && (result[1] & 1) != 0)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t result = (unsigned char *)(*(uint64_t (**)(unsigned char *))(v2 + 16))(result);
    char v5 = *v3 & v3[1];
  }
  *a2 = v5 & 1;
  return result;
}

void sub_2496BCE6C(unsigned char *a1)
{
}

void *sub_2496BCE88()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160348);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 20) = 0;
  *(_WORD *)(v2 + 16) = 0;
  *(unsigned char *)(v2 + 18) = 0;
  v0[4] = v2;
  sub_2496D7E38();
  id v3 = objc_allocWithZone(MEMORY[0x263F30060]);
  unsigned int v4 = (void *)sub_2496D7E28();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithDomain_, v4);

  v1[5] = v5;
  sub_2496BE2FC();
  uint64_t v6 = sub_2496D7F78();
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, void))(v8 + 104))((char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F140]);
  uint64_t v9 = sub_2496D7DA8();
  MEMORY[0x270FA5388](v9 - 8);
  sub_2496D7D98();
  uint64_t v10 = sub_2496D7F68();
  MEMORY[0x270FA5388](v10);
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2496BE33C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1602A0);
  sub_2496BE388();
  sub_2496D7FE8();
  uint64_t v11 = sub_2496D7F88();
  v1[3] = v11;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  id v13 = objc_allocWithZone(MEMORY[0x263F2FFE8]);
  aBlock[4] = sub_2496BE464;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2496BE13C;
  aBlock[3] = &block_descriptor_0;
  int64_t v14 = _Block_copy(aBlock);
  swift_retain();
  id v15 = objc_msgSend(v13, sel_initWithQueue_andBlock_, v11, v14);
  _Block_release(v14);
  swift_release();
  v1[2] = v15;
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v1;
}

uint64_t sub_2496BD210()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2496BDCEC();
    return swift_release();
  }
  return result;
}

void sub_2496BD268(unsigned char *a1)
{
  *a1 = 1;
  if (a1[1] == 1)
  {
    if (a1[2] == 1)
    {
      if (qword_26B160270 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_2496D7D88();
      __swift_project_value_buffer(v2, (uint64_t)qword_26B160698);
      id v3 = sub_2496D7D68();
      os_log_type_t v4 = sub_2496D7F38();
      if (os_log_type_enabled(v3, v4))
      {
        id v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_2496B3000, v3, v4, "Catch-up sync requested, but not required", v5, 2u);
        MEMORY[0x24C5A8E90](v5, -1, -1);
      }
    }
    else
    {
      if (qword_26B160270 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_2496D7D88();
      __swift_project_value_buffer(v6, (uint64_t)qword_26B160698);
      uint64_t v7 = sub_2496D7D68();
      os_log_type_t v8 = sub_2496D7F58();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_2496B3000, v7, v8, "Performing catch-up sync", v9, 2u);
        MEMORY[0x24C5A8E90](v9, -1, -1);
      }

      sub_2496BD818((uint64_t)a1);
    }
  }
}

void sub_2496BD434(unsigned char *a1)
{
  a1[1] = 1;
  sub_2496BD468(a1);
}

void sub_2496BD468(unsigned char *a1)
{
  if (a1[1] != 1) {
    return;
  }
  if (a1[2] == 1)
  {
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2496D7D88();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B160698);
    oslog = sub_2496D7D68();
    os_log_type_t v3 = sub_2496D7F38();
    if (!os_log_type_enabled(oslog, v3)) {
      goto LABEL_21;
    }
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    id v5 = "Catch-up sync requested, but not required";
LABEL_20:
    _os_log_impl(&dword_2496B3000, oslog, v3, v5, v4, 2u);
    MEMORY[0x24C5A8E90](v4, -1, -1);
LABEL_21:

    return;
  }
  if ((*a1 & 1) == 0)
  {
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2496D7D88();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B160698);
    oslog = sub_2496D7D68();
    os_log_type_t v3 = sub_2496D7F58();
    if (!os_log_type_enabled(oslog, v3)) {
      goto LABEL_21;
    }
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    id v5 = "Catch-up sync requested, but sync manager not yet started";
    goto LABEL_20;
  }
  if (qword_26B160270 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2496D7D88();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B160698);
  uint64_t v7 = sub_2496D7D68();
  os_log_type_t v8 = sub_2496D7F58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_2496B3000, v7, v8, "Performing catch-up sync", v9, 2u);
    MEMORY[0x24C5A8E90](v9, -1, -1);
  }

  sub_2496BD818((uint64_t)a1);
}

void sub_2496BD708(unsigned char *a1)
{
  if (*a1 == 1)
  {
    sub_2496BD818((uint64_t)a1);
  }
  else
  {
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2496D7D88();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B160698);
    os_log_type_t v3 = sub_2496D7D68();
    os_log_type_t v4 = sub_2496D7F58();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2496B3000, v3, v4, "Reminders changed prior to starting; scheduling a catch-up sync for after we're started",
        v5,
        2u);
      MEMORY[0x24C5A8E90](v5, -1, -1);
    }

    a1[1] = 1;
  }
}

uint64_t sub_2496BD818(uint64_t a1)
{
  uint64_t v3 = os_transaction_create();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1603A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2496D9E40;
  *(void *)(inited + 32) = 0x746361736E617274;
  *(void *)(inited + 40) = 0xEB000000006E6F69;
  *(void *)(inited + 48) = v3;
  swift_unknownObjectRetain();
  unint64_t v5 = sub_2496B8978(inited);
  uint64_t v6 = *(void **)(v1 + 16);
  sub_2496BD92C(v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_2496D7DD8();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_updateTagsAndExecuteBlock_withContext_, 0, v7);

  uint64_t result = swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 2) = 1;
  return result;
}

uint64_t sub_2496BD92C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B160378);
    uint64_t v2 = sub_2496D81E8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    int64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B160310);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_2496BE2EC(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_2496BE2EC(v35, v36);
    sub_2496BE2EC(v36, &v32);
    uint64_t result = sub_2496D8038();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_2496BE2EC(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2496BC3B0();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_2496BDCEC()
{
  uint64_t v1 = sub_2496D7DB8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v5 = *(void **)(v0 + 24);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F0E8], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_2496D7DC8();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v7 = *(void **)(v0 + 40);
  int64_t v8 = (void *)sub_2496D7E28();
  LODWORD(v7) = objc_msgSend(v7, sel_getBooleanPreference_defaultValue_, v8, 0);

  if (!v7)
  {
    uint64_t v13 = sub_2496BE1FC();
    type metadata accessor for IntegrationSync();
    uint64_t inited = (void *)swift_initStackObject();
    uint64_t v15 = os_transaction_create();
    inited[8] = 0;
    inited[9] = v15;
    inited[2] = v13;
    inited[3] = 0xD000000000000015;
    inited[4] = 0x80000002496D9A90;
    inited[5] = 0x7265646E696D6552;
    inited[6] = 0xE900000000000073;
    inited[7] = sub_2496B6A9C;
    sub_2496B6AF4();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  if (qword_26B160270 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v9 = sub_2496D7D88();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B160698);
  uint64_t v10 = sub_2496D7D68();
  os_log_type_t v11 = sub_2496D7F48();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v12 = 0;
    _os_log_impl(&dword_2496B3000, v10, v11, "Skipping an integration sync because the user default for disabling integration syncing is set", v12, 2u);
    MEMORY[0x24C5A8E90](v12, -1, -1);
  }
}

uint64_t sub_2496BDF98()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for IntegrationSyncManager()
{
  return self;
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationSyncManager.State(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  BOOL v5 = v4 >= 2;
  int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationSyncManager.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)uint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)uint64_t result = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationSyncManager.State()
{
  return &type metadata for IntegrationSyncManager.State;
}

uint64_t sub_2496BE13C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_2496D7E98();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = 0;
  if (a3) {
LABEL_3:
  }
    uint64_t v3 = sub_2496D7DE8();
LABEL_4:
  swift_retain();
  v4(v5, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496BE1FC()
{
  if (!MEMORY[0x263F62F70]) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v0 = type metadata accessor for ReminderIntegrationDataSource();
  uint64_t v1 = (void *)swift_allocObject();
  v1[2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62F70]), sel_init);
  v1[3] = 0;
  v1[4] = sub_2496B8854(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160398);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2496D9E40;
  *(void *)(result + 32) = 0x656C756465686373;
  *(void *)(result + 40) = 0xE900000000000064;
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0xD000000000000013;
  *(void *)(result + 72) = 0x80000002496D9AB0;
  *(void *)(result + 80) = v1;
  *(void *)(result + 104) = v0;
  *(void *)(result + 112) = &off_26FD40738;
  return result;
}

_OWORD *sub_2496BE2EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2496BE2FC()
{
  unint64_t result = qword_26B160300;
  if (!qword_26B160300)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B160300);
  }
  return result;
}

unint64_t sub_2496BE33C()
{
  unint64_t result = qword_26B1602F8;
  if (!qword_26B1602F8)
  {
    sub_2496D7F68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1602F8);
  }
  return result;
}

unint64_t sub_2496BE388()
{
  unint64_t result = qword_26B1602A8;
  if (!qword_26B1602A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1602A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1602A8);
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

uint64_t sub_2496BE42C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2496BE464()
{
  return sub_2496BD210();
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

ValueMetadata *type metadata accessor for CalendarIntegrationSupportLog()
{
  return &type metadata for CalendarIntegrationSupportLog;
}

uint64_t sub_2496BE494(uint64_t a1)
{
  return sub_2496BE4D0(a1, qword_26B160698);
}

uint64_t sub_2496BE4AC(uint64_t a1)
{
  return sub_2496BE4D0(a1, qword_26B1606B0);
}

uint64_t sub_2496BE4D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2496D7D88();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2496D7D78();
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

uint64_t sub_2496BE5AC()
{
  return 1;
}

uint64_t sub_2496BE5B4()
{
  return sub_2496D8308();
}

uint64_t sub_2496BE5F8()
{
  return sub_2496D82E8();
}

uint64_t sub_2496BE620()
{
  return sub_2496D8308();
}

uint64_t sub_2496BE670@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B15FC40);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = v6;
  uint64_t v57 = v7;
  sub_2496BFEA4((uint64_t)&v56, (uint64_t)v10);
  uint64_t v11 = sub_2496D7CF8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7C58();
  if (v3) {
    return sub_2496C5A30((uint64_t)v10, (uint64_t *)&unk_26B15FC40);
  }
  uint64_t v54 = v12;
  uint64_t v55 = v11;
  id v52 = a2;
  uint64_t v16 = sub_2496D7D28();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7CC8();
  sub_2496C0608(&v56);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v51 = v56;
  uint64_t v53 = v57;
  uint64_t v20 = sub_2496D7CE8();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  unint64_t v23 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7CD8();
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v23, v20);
  if (MEMORY[0x263F633C8] && v24 == *MEMORY[0x263F633C8])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
    uint64_t v25 = sub_2496D7CB8();
    os_log_type_t v50 = &v46;
    uint64_t v26 = *(void *)(v25 - 8);
    MEMORY[0x270FA5388](v25);
    long long v28 = (char *)&v46 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v23, v25);
    uint64_t v29 = sub_2496D7CA8();
    sub_2496C3DC4(v29);
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v55);
    uint64_t result = sub_2496C5A30((uint64_t)v10, (uint64_t *)&unk_26B15FC40);
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    char v34 = 0;
LABEL_9:
    uint64_t v45 = v52;
    uint64_t *v52 = v51;
    v45[1] = v53;
    v45[2] = v31;
    v45[3] = v32;
    v45[4] = v33;
    *((unsigned char *)v45 + 40) = v34;
    return result;
  }
  if (MEMORY[0x263F633C0] && v24 == *MEMORY[0x263F633C0])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
    uint64_t v35 = sub_2496D7C98();
    os_log_type_t v50 = &v46;
    uint64_t v48 = v35;
    uint64_t v36 = *(void *)(v35 - 8);
    MEMORY[0x270FA5388](v35);
    char v38 = (char *)&v46 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *))(v36 + 32))(v38, v23);
    uint64_t v39 = sub_2496D7C78();
    sub_2496C3DC4(v39);
    id v49 = &v46;
    uint64_t v41 = v40;
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_2496D7C88();
    sub_2496C3DC4(v42);
    uint64_t v47 = v43;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_2496D7C68();
    swift_retain();
    uint64_t v33 = sub_2496C41E4(v44, v4);
    uint64_t v31 = v41;
    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v48);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v55);
    uint64_t result = sub_2496C5A30((uint64_t)v10, (uint64_t *)&unk_26B15FC40);
    uint64_t v32 = v47;
    char v34 = 1;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  sub_2496C5C30();
  swift_allocError();
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v55);
  sub_2496C5A30((uint64_t)v10, (uint64_t *)&unk_26B15FC40);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
}

id sub_2496BEC94(uint64_t a1)
{
  uint64_t v2 = v1;
  v20[1] = *(id *)MEMORY[0x263EF8340];
  swift_retain();
  sub_2496BFD78(a1);
  uint64_t v4 = *(void **)(v1 + 16);
  sub_2496BC414(0, &qword_26B1602C8);
  uint64_t v5 = (void *)sub_2496D7E78();
  swift_bridgeObjectRelease();
  v20[0] = 0;
  id v6 = objc_msgSend(v4, sel_fetchRemindersWithObjectIDs_error_, v5, v20);

  id v7 = v20[0];
  if (v6)
  {
    sub_2496BC414(0, &qword_26B160658);
    sub_2496C5A8C();
    uint64_t v8 = sub_2496D7DE8();
    id v9 = v7;

    if ((v8 & 0xC000000000000001) != 0) {
      uint64_t v10 = sub_2496D8018();
    }
    else {
      uint64_t v10 = *(void *)(v8 + 16);
    }
    uint64_t v12 = *(void **)(a1 + 16);
    if ((void *)v10 != v12)
    {
      if (qword_26B160418 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_2496D7D88();
      __swift_project_value_buffer(v13, (uint64_t)qword_26B1606B0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v14 = sub_2496D7D68();
      os_log_type_t v15 = sub_2496D7F48();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 134218240;
        v20[0] = v12;
        sub_2496D7FC8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2048;
        if ((v8 & 0xC000000000000001) != 0) {
          uint64_t v17 = (void *)sub_2496D8018();
        }
        else {
          uint64_t v17 = *(void **)(v8 + 16);
        }
        v20[0] = v17;
        sub_2496D7FC8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2496B3000, v14, v15, "Requested reminders for %ld ids but only received %ld reminders", (uint8_t *)v16, 0x16u);
        MEMORY[0x24C5A8E90](v16, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    v20[0] = (id)sub_2496B8A94(MEMORY[0x263F8EE78]);
    MEMORY[0x270FA5388](v20[0]);
    v19[2] = v20;
    v19[3] = v2;
    id v11 = (id)sub_2496C49D0(v8, (void (*)(void))sub_2496C5AE8, (uint64_t)v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = v20[0];
    sub_2496D7AC8();

    swift_willThrow();
  }
  return v11;
}

uint64_t sub_2496BEFF8@<X0>(void *a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  id v7 = a1;
  uint64_t v91 = a4;
  sub_2496BF618(v7, a4);
  id v8 = objc_msgSend(v7, sel_list);
  id v9 = objc_msgSend(v8, sel_objectID);
  uint64_t v10 = v9;
  uint64_t v11 = *a2;
  uint64_t v12 = *(void *)(*a2 + 16);
  id v90 = v7;
  if (v12)
  {
    id v13 = v9;
    unint64_t v14 = sub_2496D52A8((uint64_t)v13);
    if (v15)
    {
      uint64_t v16 = (uint64_t *)(*(void *)(v11 + 56) + 48 * v14);
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      uint64_t v20 = v16[2];
      uint64_t v19 = v16[3];
      uint64_t v89 = a3;
      uint64_t v21 = v16[4];
      unint64_t v22 = v16[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496BBA60(v21, v22);

      unint64_t v23 = v91;
      int v24 = (char *)v91 + *(int *)(type metadata accessor for IntegrationEntry(0) + 52);
      sub_2496C5B6C(*(void *)v24, *((void *)v24 + 1), *((void *)v24 + 2), *((void *)v24 + 3), *((void *)v24 + 4), *((void *)v24 + 5));
      *(void *)int v24 = v17;
      *((void *)v24 + 1) = v18;
      *((void *)v24 + 2) = v20;
      *((void *)v24 + 3) = v19;
      *((void *)v24 + 4) = v21;
      *((void *)v24 + 5) = v22;
      goto LABEL_6;
    }
  }
  uint64_t v25 = v10;
  uint64_t v26 = sub_2496D7D58();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v30 = objc_msgSend(v8, sel_color);
  sub_2496D7D48();
  uint64_t v31 = sub_2496D7D38();
  unint64_t v85 = v32;
  char v86 = v25;
  id v84 = &v82;
  uint64_t v33 = v31;
  id v34 = objc_msgSend(v25, sel_urlRepresentation);
  uint64_t v35 = sub_2496D7B18();
  id v88 = v8;
  uint64_t v89 = a3;
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)(v35 - 8);
  id v87 = a2;
  uint64_t v38 = v37;
  MEMORY[0x270FA5388](v35);
  uint64_t v40 = (char *)&v82 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7AF8();

  uint64_t v41 = sub_2496D7AD8();
  uint64_t v83 = v41;
  uint64_t v43 = v42;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v36);
  uint64_t v44 = sub_2496D7E38();
  uint64_t v82 = v44;
  uint64_t v46 = v45;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  *(void *)&long long v93 = v44;
  *((void *)&v93 + 1) = v46;
  uint64_t v94 = v41;
  uint64_t v95 = v43;
  uint64_t v47 = v33;
  uint64_t v96 = v33;
  unint64_t v48 = v85;
  unint64_t v97 = v85;
  id v49 = (uint64_t *)((char *)v91 + *(int *)(type metadata accessor for IntegrationEntry(0) + 52));
  uint64_t v50 = *v49;
  uint64_t v51 = v49[1];
  uint64_t v52 = v49[3];
  id v84 = (uint64_t *)v49[2];
  uint64_t v53 = v49[4];
  unint64_t v54 = v49[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2496BBA60(v47, v48);
  uint64_t v55 = v53;
  uint64_t v10 = v86;
  unint64_t v56 = v54;
  id v8 = v88;
  sub_2496C5B6C(v50, v51, (uint64_t)v84, v52, v55, v56);
  *id v49 = v82;
  v49[1] = v46;
  v49[2] = v83;
  v49[3] = v43;
  v49[4] = v47;
  v49[5] = v48;
  unint64_t v57 = v48;
  id v58 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2496BBA60(v47, v48);
  unint64_t v59 = v87;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v92 = *v59;
  *unint64_t v59 = 0x8000000000000000;
  sub_2496D5E04(&v93, v58, isUniquelyReferenced_nonNull_native);
  unint64_t v23 = v91;
  *unint64_t v59 = v92;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_2496C5970(v47, v57);
LABEL_6:
  id v61 = objc_msgSend(v8, sel_account);
  id v62 = objc_msgSend(v61, sel_externalIdentifier);

  if (v62)
  {
    uint64_t v63 = sub_2496D7E38();
    unint64_t v65 = v64;
  }
  else
  {
    uint64_t v63 = 0;
    unint64_t v65 = 0;
  }
  uint64_t v66 = sub_2496C08C8(v63, v65);
  uint64_t v68 = v67;
  swift_bridgeObjectRelease();
  uint64_t v69 = type metadata accessor for IntegrationEntry(0);
  unint64_t v70 = (uint64_t *)((char *)v23 + *(int *)(v69 + 56));
  swift_bridgeObjectRelease();
  *unint64_t v70 = v66;
  v70[1] = v68;
  uint64_t v71 = (uint64_t *)((char *)v23 + *(int *)(v69 + 60));
  uint64_t v72 = v71[1];
  if (v72)
  {
    uint64_t v73 = *v71;
    swift_bridgeObjectRetain();
  }
  else
  {
    id v74 = objc_msgSend(v90, sel_objectID);
    id v75 = objc_msgSend(v74, sel_uuid);

    uint64_t v76 = sub_2496D7BD8();
    uint64_t v77 = *(void *)(v76 - 8);
    MEMORY[0x270FA5388](v76);
    id v79 = (char *)&v82 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2496D7BC8();

    uint64_t v73 = sub_2496D7BB8();
    uint64_t v72 = v80;

    (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v76);
  }
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v71 = v73;
  v71[1] = v72;
  return result;
}

uint64_t sub_2496BF618@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v44 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (int *)type metadata accessor for IntegrationEntry(0);
  uint64_t v42 = (uint64_t)a2 + v6[7];
  uint64_t v7 = v42;
  uint64_t v8 = sub_2496D7C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (uint64_t)a2 + v6[12];
  uint64_t v10 = type metadata accessor for IntegrationRecurrence(0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
  uint64_t v43 = v9;
  v11(v9, 1, 1, v10);
  uint64_t v12 = (char *)a2 + v6[13];
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *(_OWORD *)uint64_t v12 = 0u;
  id v13 = (uint64_t *)((char *)a2 + v6[14]);
  *id v13 = 0;
  v13[1] = 0;
  unint64_t v14 = (uint64_t *)((char *)a2 + v6[15]);
  *unint64_t v14 = 0;
  v14[1] = 0;
  uint64_t v45 = v14;
  id v15 = objc_msgSend(a1, sel_objectID);
  id v16 = objc_msgSend(v15, sel_urlRepresentation);

  uint64_t v17 = sub_2496D7B18();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7AF8();

  uint64_t v21 = sub_2496D7AD8();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  *a2 = v21;
  a2[1] = v23;
  REMReminder.startDate.getter((uint64_t)a2 + v6[5]);
  REMReminder.startDate.getter((uint64_t)a2 + v6[6]);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  REMReminder.timeZone.getter((uint64_t)v26);
  sub_2496C5BCC((uint64_t)v26, v42, &qword_26B1605E8);
  id v27 = objc_msgSend(a1, sel_titleAsString);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = sub_2496D7E38();
    unint64_t v31 = v30;
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v31 = 0xE000000000000000;
  }
  unint64_t v32 = (uint64_t *)((char *)a2 + v6[8]);
  *unint64_t v32 = v29;
  v32[1] = v31;
  *((unsigned char *)a2 + v6[9]) = REMReminder.allDay.getter() & 1;
  *((unsigned char *)a2 + v6[10]) = objc_msgSend(a1, sel_isCompleted);
  uint64_t v33 = v44;
  REMReminder.recurrence.getter(v44);
  sub_2496C5BCC(v33, v43, &qword_26B160628);
  uint64_t v46 = a1;
  sub_2496BC414(0, &qword_26B160658);
  sub_2496D7C48();
  *(uint64_t *)((char *)a2 + v6[11]) = REMReminderDefaultPriorityForPriorityLevel();
  sub_2496C5B6C(*(void *)v12, *((void *)v12 + 1), *((void *)v12 + 2), *((void *)v12 + 3), *((void *)v12 + 4), *((void *)v12 + 5));
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *(_OWORD *)uint64_t v12 = 0u;
  swift_bridgeObjectRelease();
  *id v13 = 0;
  v13[1] = 0;
  id v34 = objc_msgSend(a1, sel_externalIdentifier);
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = sub_2496D7E38();
    uint64_t v38 = v37;
  }
  else
  {

    uint64_t v36 = 0;
    uint64_t v38 = 0;
  }
  uint64_t v39 = v45;
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v39 = v36;
  v39[1] = v38;
  return result;
}

uint64_t sub_2496BFA34(uint64_t a1)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  swift_retain();
  sub_2496BFBB8(a1);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = sub_2496BC414(0, &qword_26B1602C8);
  uint64_t v5 = (void *)sub_2496D7E78();
  swift_bridgeObjectRelease();
  v13[0] = 0;
  id v6 = objc_msgSend(v3, sel_fetchListsWithObjectIDs_error_, v5, v13);

  id v7 = v13[0];
  if (v6)
  {
    sub_2496BC414(0, &qword_26B15FC30);
    sub_2496C5A8C();
    unint64_t v8 = sub_2496D7DE8();
    id v9 = v7;

    swift_retain();
    sub_2496C4DBC(v8);
    uint64_t v4 = v10;
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    id v11 = v13[0];
    sub_2496D7AC8();

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_2496BFBB8(uint64_t a1)
{
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1)
  {
    swift_retain();
    uint64_t v13 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v3 = (unint64_t *)(a1 + 56);
  do
  {
    uint64_t v5 = *(v3 - 3);
    uint64_t v4 = *(v3 - 2);
    uint64_t v7 = *(v3 - 1);
    unint64_t v6 = *v3;
    if (v5 == sub_2496D7E38() && v4 == v8)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      char v10 = sub_2496D8258();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_4;
      }
    }
    id v11 = sub_2496C5464(v7, v6);
    swift_bridgeObjectRelease();
    uint64_t v12 = swift_bridgeObjectRelease();
    if (v11)
    {
      MEMORY[0x24C5A8390](v12);
      if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2496D7EB8();
      }
      sub_2496D7EC8();
      sub_2496D7EA8();
    }
LABEL_4:
    v3 += 4;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  uint64_t v13 = v15;
LABEL_18:
  swift_release_n();
  return v13;
}

uint64_t sub_2496BFD78(uint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v3 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v3 - 1);
      unint64_t v4 = *v3;
      swift_bridgeObjectRetain();
      id v6 = sub_2496C5464(v5, v4);
      uint64_t v7 = swift_bridgeObjectRelease();
      if (v6)
      {
        MEMORY[0x24C5A8390](v7);
        if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2496D7EB8();
        }
        sub_2496D7EC8();
        sub_2496D7EA8();
      }
      v3 += 2;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
    uint64_t v8 = v10;
  }
  else
  {
    swift_retain();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  swift_release_n();
  return v8;
}

uint64_t sub_2496BFEA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 8))
  {
    if (qword_26B160418 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2496D7D88();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B1606B0);
    id v6 = sub_2496D7D68();
    os_log_type_t v7 = sub_2496D7F48();
    if (!os_log_type_enabled(v6, v7)) {
      goto LABEL_12;
    }
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    id v9 = "Token missing; will do a full reminder sync";
    goto LABEL_11;
  }
  uint64_t v3 = sub_2496D7B28();
  if (v4 >> 60 != 15)
  {
    uint64_t v14 = v3;
    unint64_t v15 = v4;
    sub_2496D7A88();
    swift_allocObject();
    sub_2496D7A78();
    sub_2496C59C8();
    sub_2496D7A68();
    swift_release();
    uint64_t v18 = v39;
    unint64_t v17 = v40;
    if (v38 == 1)
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B15FC40);
      MEMORY[0x270FA5388](v19 - 8);
      uint64_t v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496BBA60(v39, v40);
      sub_2496D7D18();
      uint64_t v31 = sub_2496D7D28();
      uint64_t v32 = *(void *)(v31 - 8);
      uint64_t v37 = *(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56);
      v37(v21, 0, 1, v31);
      int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v21, 1, v31);
      if (v33 != 1)
      {
        sub_2496C5A1C(v14, v15);
        sub_2496C5970(v18, v17);
        (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(a2, v21, v31);
        return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v37)(a2, 0, 1, v31);
      }
      sub_2496C5A30((uint64_t)v21, (uint64_t *)&unk_26B15FC40);
      if (qword_26B160418 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_2496D7D88();
      __swift_project_value_buffer(v34, (uint64_t)qword_26B1606B0);
      uint64_t v23 = sub_2496D7D68();
      os_log_type_t v35 = sub_2496D7F48();
      if (os_log_type_enabled(v23, v35))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        uint64_t v26 = "Token can't be decoded; will do a full reminder sync";
        id v27 = v23;
        os_log_type_t v28 = v35;
        uint64_t v29 = v25;
        uint32_t v30 = 2;
        goto LABEL_30;
      }
      sub_2496C5970(v18, v17);
      sub_2496C5A1C(v14, v15);
    }
    else
    {
      if (qword_26B160418 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_2496D7D88();
      __swift_project_value_buffer(v22, (uint64_t)qword_26B1606B0);
      sub_2496BBA60(v39, v40);
      uint64_t v23 = sub_2496D7D68();
      os_log_type_t v24 = sub_2496D7F48();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 67109376;
        sub_2496D7FC8();
        sub_2496C5970(v18, v17);
        *((_WORD *)v25 + 4) = 1024;
        int v38 = 1;
        sub_2496D7FC8();
        uint64_t v26 = "Token version has changed (have = %u; current = %u); will do a full reminder sync";
        id v27 = v23;
        os_log_type_t v28 = v24;
        uint64_t v29 = v25;
        uint32_t v30 = 14;
LABEL_30:
        _os_log_impl(&dword_2496B3000, v27, v28, v26, v29, v30);
        MEMORY[0x24C5A8E90](v25, -1, -1);
        sub_2496C5A1C(v14, v15);

        sub_2496C5970(v18, v17);
        goto LABEL_17;
      }
      sub_2496C5970(v39, v40);
      sub_2496C5A1C(v14, v15);
      sub_2496C5970(v39, v40);
    }

LABEL_17:
    uint64_t v16 = sub_2496D7D28();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
  if (qword_26B160418 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2496D7D88();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1606B0);
  id v6 = sub_2496D7D68();
  os_log_type_t v7 = sub_2496D7F48();
  if (!os_log_type_enabled(v6, v7)) {
    goto LABEL_12;
  }
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v8 = 0;
  id v9 = "Token encoding not valid; will do a full reminder sync";
LABEL_11:
  _os_log_impl(&dword_2496B3000, v6, v7, v9, v8, 2u);
  MEMORY[0x24C5A8E90](v8, -1, -1);
LABEL_12:

  uint64_t v11 = sub_2496D7D28();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  return v12(a2, 1, 1, v11);
}

uint64_t sub_2496C0608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2496D7D08();
  unint64_t v4 = v3;
  sub_2496D7AB8();
  swift_allocObject();
  sub_2496BBA60(v2, v4);
  sub_2496D7AA8();
  sub_2496C591C();
  uint64_t v5 = sub_2496D7A98();
  unint64_t v7 = v6;
  swift_release();
  uint64_t v8 = sub_2496D7B48();
  uint64_t v10 = v9;
  sub_2496C5970(v5, v7);
  sub_2496C5970(v2, v4);
  uint64_t result = sub_2496C5970(v2, v4);
  *a1 = v8;
  a1[1] = v10;
  return result;
}

uint64_t sub_2496C08C8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = v2;
    uint64_t v6 = *(void *)(v2 + 32);
    uint64_t v7 = *(void *)(v6 + 16);
    swift_bridgeObjectRetain();
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_2496D5230(a1, a2);
      if (v9)
      {
        a1 = *(void *)(*(void *)(v6 + 56) + 16 * v8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        return a1;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v10 = *(void **)(v4 + 24);
    if (v10)
    {
      id v11 = *(id *)(v4 + 24);
    }
    else
    {
      id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFB210]), sel_init);
      uint64_t v13 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = v12;
      id v11 = v12;

      uint64_t v10 = 0;
    }
    id v14 = v10;
    unint64_t v15 = (void *)sub_2496D7E28();
    id v16 = objc_msgSend(v11, sel_accountWithIdentifier_, v15);

    if (v16)
    {
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v16, sel_cal_personaIdentifier);
      if (v17)
      {
        uint64_t v18 = v17;
        a1 = sub_2496D7E38();

        return a1;
      }
    }
    else
    {
      if (qword_26B160270 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_2496D7D88();
      __swift_project_value_buffer(v19, (uint64_t)qword_26B160698);
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_2496D7D68();
      os_log_type_t v21 = sub_2496D7F48();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v25 = v23;
        *(_DWORD *)uint64_t v22 = 136315138;
        swift_bridgeObjectRetain();
        sub_2496BA7D4(a1, a2, &v25);
        sub_2496D7FC8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2496B3000, v20, v21, "Could not find account with identifier %s", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5A8E90](v23, -1, -1);
        MEMORY[0x24C5A8E90](v22, -1, -1);

        return 0;
      }

      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
  return a1;
}

uint64_t sub_2496C0BCC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2496C0C14@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2496BE670(a1, a2);
}

id sub_2496C0C38(uint64_t a1)
{
  return sub_2496BEC94(a1);
}

uint64_t sub_2496C0C5C(uint64_t a1)
{
  return sub_2496BFA34(a1);
}

uint64_t REMReminder.identifier.getter()
{
  id v1 = objc_msgSend(v0, sel_objectID);
  id v2 = objc_msgSend(v1, sel_urlRepresentation);

  uint64_t v3 = sub_2496D7B18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7AF8();

  uint64_t v7 = sub_2496D7AD8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

uint64_t REMReminder.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2496D7A58();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)v49 - v6;
  id v8 = objc_msgSend(v1, sel_effectiveDisplayDateComponents_forCalendar);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605D8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  id v12 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v8)
  {
    uint64_t v54 = a1;
    MEMORY[0x270FA5388](v10);
    sub_2496D7A28();

    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v13(v12, (char *)v49 - v6, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v12, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) != 1)
    {
      v13(v7, v12, v3);
      uint64_t v52 = sub_2496D7C18();
      uint64_t v53 = v49;
      uint64_t v14 = *(void *)(v52 - 8);
      MEMORY[0x270FA5388](v52);
      id v16 = (char *)v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = sub_2496D7BE8();
      uint64_t v18 = *(void *)(v17 - 8);
      MEMORY[0x270FA5388](v17);
      uint64_t v20 = (char *)v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F07738], v17);
      sub_2496D7BF8();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E0);
      MEMORY[0x270FA5388](v21 - 8);
      uint64_t v23 = (char *)v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496D7C08();
      uint64_t v24 = sub_2496D7BA8();
      uint64_t v25 = *(void *)(v24 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
      {
        uint64_t v50 = v16;
        uint64_t v51 = v14;
        sub_2496C5A30((uint64_t)v23, &qword_26B1605E0);
        if (qword_26B160270 != -1) {
          swift_once();
        }
        uint64_t v26 = sub_2496D7D88();
        uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_26B160698);
        v49[2] = v49;
        MEMORY[0x270FA5388](v27);
        os_log_type_t v28 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v28, v7, v3);
        uint64_t v29 = sub_2496D7D68();
        os_log_type_t v30 = sub_2496D7F48();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          uint64_t v32 = swift_slowAlloc();
          uint64_t v56 = v32;
          *(_DWORD *)uint64_t v31 = 136315138;
          v49[1] = v31 + 4;
          sub_2496C31FC();
          uint64_t v33 = sub_2496D8248();
          uint64_t v55 = sub_2496BA7D4(v33, v34, &v56);
          sub_2496D7FC8();
          swift_bridgeObjectRelease();
          os_log_type_t v35 = *(void (**)(char *, uint64_t))(v4 + 8);
          v35(v28, v3);
          _os_log_impl(&dword_2496B3000, v29, v30, "We got a reminder with a due date that couldn't be converted to a date: %s", v31, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5A8E90](v32, -1, -1);
          MEMORY[0x24C5A8E90](v31, -1, -1);
        }
        else
        {
          os_log_type_t v35 = *(void (**)(char *, uint64_t))(v4 + 8);
          v35(v28, v3);
        }

        uint64_t v48 = v52;
        sub_2496D7B68();
        (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v48);
        return ((uint64_t (*)(char *, uint64_t))v35)(v7, v3);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v52);
        (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v54, v23, v24);
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, 1, 1, v3);
  }
  sub_2496C5A30((uint64_t)v12, &qword_26B1605D8);
  if (qword_26B160270 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_2496D7D88();
  __swift_project_value_buffer(v36, (uint64_t)qword_26B160698);
  id v37 = v1;
  int v38 = sub_2496D7D68();
  os_log_type_t v39 = sub_2496D7F48();
  if (os_log_type_enabled(v38, v39))
  {
    unint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v56 = v41;
    *(_DWORD *)unint64_t v40 = 136315138;
    id v42 = objc_msgSend(v37, sel_titleAsString);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = sub_2496D7E38();
      unint64_t v46 = v45;
    }
    else
    {
      uint64_t v44 = 0;
      unint64_t v46 = 0xE000000000000000;
    }
    uint64_t v55 = sub_2496BA7D4(v44, v46, &v56);
    sub_2496D7FC8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2496B3000, v38, v39, "We ended up with a reminder without a due date: \"%s\"", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v41, -1, -1);
    MEMORY[0x24C5A8E90](v40, -1, -1);
  }
  else
  {
  }
  return sub_2496D7B68();
}

uint64_t REMReminder.title.getter()
{
  id v1 = objc_msgSend(v0, sel_titleAsString);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_2496D7E38();

  return v3;
}

uint64_t REMReminder.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = v1;
  uint64_t v4 = sub_2496D7A58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v8 = (char *)&v18 - v7;
  id v9 = objc_msgSend(v2, sel_effectiveDisplayDateComponents_forCalendar);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605D8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v9)
  {
    MEMORY[0x270FA5388](v11);
    uint64_t v14 = (char *)&v18 - v7;
    sub_2496D7A28();

    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v15(v13, v14, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) != 1)
    {
      v15(v8, v13, v4);
      sub_2496D7A48();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, 1, 1, v4);
  }
  sub_2496C5A30((uint64_t)v13, &qword_26B1605D8);
  uint64_t v17 = sub_2496D7C38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
}

uint64_t REMReminder.allDay.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_2496D7A58();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = (char *)&v17 - v5;
  id v7 = objc_msgSend(v1, sel_dueDateComponents);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605D8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v7)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, 1, 1, v2);
    goto LABEL_5;
  }
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - v5;
  sub_2496D7A28();

  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v13(v11, v12, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v11, 0, 1, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
  {
LABEL_5:
    sub_2496C5A30((uint64_t)v11, &qword_26B1605D8);
    return 0;
  }
  v13(v6, v11, v2);
  sub_2496D7A38();
  uint64_t v15 = v14 & 1;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v15;
}

id REMReminder.completed.getter()
{
  return objc_msgSend(v0, sel_isCompleted);
}

uint64_t REMReminder.priority.getter()
{
  return REMReminderDefaultPriorityForPriorityLevel();
}

void REMReminder.recurrence.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v77 - v9;
  if (objc_msgSend(v3, sel_isCompleted)) {
    goto LABEL_2;
  }
  id v11 = objc_msgSend(v3, sel_recurrenceRules);
  if (!v11) {
    goto LABEL_15;
  }
  uint64_t v12 = v11;
  sub_2496BC414(0, (unint64_t *)&unk_26B160660);
  unint64_t v13 = sub_2496D7E98();

  if (!(v13 >> 62))
  {
    if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
LABEL_45:
    swift_bridgeObjectRelease();
LABEL_2:
    id v11 = 0;
LABEL_15:
    uint64_t v32 = type metadata accessor for IntegrationRecurrence((uint64_t)v11);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
    v33(a1, 1, 1, v32);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_2496D81B8();
  swift_bridgeObjectRelease();
  if (!v53) {
    goto LABEL_45;
  }
LABEL_6:
  uint64_t v80 = v8;
  uint64_t v81 = a1;
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v14 = (id)MEMORY[0x24C5A85A0](0, v13);
  }
  else
  {
    if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_48;
    }
    id v14 = *(id *)(v13 + 32);
  }
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v15, sel_frequency);
  unint64_t v17 = 0x4030201uLL >> (8 * v16);
  if ((unint64_t)v16 >= 5) {
    LODWORD(v17) = 3;
  }
  int v78 = v17;
  id v79 = objc_msgSend(v15, sel_interval);
  id v18 = objc_msgSend(v15, sel_recurrenceEnd);
  uint64_t v82 = v15;
  uint64_t v83 = v10;
  if (!v18)
  {
    uint64_t v34 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v10, 1, 1, v34);
    goto LABEL_23;
  }
  uint64_t v19 = v18;
  uint64_t v20 = sub_2496D7BA8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 64);
  MEMORY[0x270FA5388](v20);
  unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v24 = objc_msgSend(v19, sel_endDate);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E0);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  os_log_type_t v28 = (char *)&v77 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v28, 1, 1, v20);
    goto LABEL_20;
  }
  uint64_t v77 = (uint64_t)&v77;
  MEMORY[0x270FA5388](v26);
  sub_2496D7B98();

  uint64_t v29 = *(void (**)(void))(v21 + 32);
  ((void (*)(char *, char *, uint64_t))v29)(v28, (char *)&v77 - v23, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v28, 0, 1, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v28, 1, v20) == 1)
  {
LABEL_20:
    sub_2496C5A30((uint64_t)v28, &qword_26B1605E0);
    unint64_t v35 = (unint64_t)objc_msgSend(v19, sel_occurrenceCount);

    if ((v35 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_67;
    }
    uint64_t v36 = v83;
    *uint64_t v83 = v35;
    uint64_t v37 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v36, 0, 1, v37);
    goto LABEL_22;
  }

  ((void (*)(char *, char *, uint64_t))v29)((char *)&v77 - v23, v28, v20);
  os_log_type_t v30 = v83;
  v29();
  uint64_t v31 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 0, 1, v31);
LABEL_22:
  uint64_t v15 = v82;
LABEL_23:
  id v38 = objc_msgSend(v15, sel_firstDayOfTheWeek);
  if ((unint64_t)v38 >= 8) {
    int v39 = 7;
  }
  else {
    int v39 = 0x605040302010007uLL >> (8 * v38);
  }
  id v40 = objc_msgSend(v15, sel_daysOfTheWeek);
  LODWORD(v77) = v39;
  if (v40)
  {
    uint64_t v41 = v40;
    sub_2496BC414(0, &qword_2696CAB10);
    unint64_t v2 = sub_2496D7E98();

    if (!(v2 >> 62))
    {
      uint64_t v42 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v42) {
        goto LABEL_29;
      }
      goto LABEL_49;
    }
LABEL_48:
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    if (v42)
    {
LABEL_29:
      if (v42 >= 1)
      {
        uint64_t v43 = 0;
        uint64_t v44 = (void *)MEMORY[0x263F8EE78];
        do
        {
          if ((v2 & 0xC000000000000001) != 0) {
            id v45 = (id)MEMORY[0x24C5A85A0](v43, v2);
          }
          else {
            id v45 = *(id *)(v2 + 8 * v43 + 32);
          }
          unint64_t v46 = v45;
          id v47 = objc_msgSend(v45, sel_dayOfTheWeek, v77);
          if ((unint64_t)v47 >= 8) {
            char v48 = 1;
          }
          else {
            char v48 = 0x605040302010001uLL >> (8 * v47);
          }
          id v49 = objc_msgSend(v46, sel_weekNumber);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v44 = sub_2496C30EC(0, v44[2] + 1, 1, v44);
          }
          unint64_t v51 = v44[2];
          unint64_t v50 = v44[3];
          if (v51 >= v50 >> 1) {
            uint64_t v44 = sub_2496C30EC((void *)(v50 > 1), v51 + 1, 1, v44);
          }
          ++v43;
          v44[2] = v51 + 1;
          uint64_t v52 = &v44[2 * v51];
          *((unsigned char *)v52 + 32) = v48;
          v52[5] = v49;
        }
        while (v42 != v43);
        goto LABEL_50;
      }
LABEL_67:
      __break(1u);
      return;
    }
LABEL_49:
    uint64_t v44 = (void *)MEMORY[0x263F8EE78];
LABEL_50:
    swift_bridgeObjectRelease();
    uint64_t v15 = v82;
    goto LABEL_51;
  }
  uint64_t v44 = 0;
LABEL_51:
  id v54 = objc_msgSend(v15, sel_daysOfTheMonth, v77);
  if (v54)
  {
    uint64_t v55 = v54;
    sub_2496BC414(0, &qword_2696CAB08);
    unint64_t v56 = sub_2496D7E98();

    uint64_t v57 = sub_2496C25C0(v56);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v57 = 0;
  }
  id v58 = objc_msgSend(v15, sel_daysOfTheYear);
  if (v58)
  {
    unint64_t v59 = v58;
    sub_2496BC414(0, &qword_2696CAB08);
    unint64_t v60 = sub_2496D7E98();

    uint64_t v61 = sub_2496C25C0(v60);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v61 = 0;
  }
  id v62 = objc_msgSend(v15, sel_weeksOfTheYear);
  if (v62)
  {
    uint64_t v63 = v62;
    sub_2496BC414(0, &qword_2696CAB08);
    unint64_t v64 = sub_2496D7E98();

    uint64_t v65 = sub_2496C25C0(v64);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v65 = 0;
  }
  id v66 = objc_msgSend(v15, sel_monthsOfTheYear);
  if (v66)
  {
    uint64_t v67 = v66;
    sub_2496BC414(0, &qword_2696CAB08);
    unint64_t v68 = sub_2496D7E98();

    uint64_t v69 = sub_2496C25C0(v68);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v69 = 0;
  }
  id v70 = objc_msgSend(v15, sel_setPositions);
  if (v70)
  {
    sub_2496BC414(0, &qword_2696CAB08);
    unint64_t v71 = sub_2496D7E98();

    id v70 = (id)sub_2496C25C0(v71);
    swift_bridgeObjectRelease();
  }
  char v85 = v78;
  uint64_t v72 = v83;
  uint64_t v73 = (uint64_t)v80;
  sub_2496C3248((uint64_t)v83, (uint64_t)v80);
  char v84 = v77;
  uint64_t v76 = (uint64_t)v70;
  uint64_t v74 = v81;
  IntegrationRecurrence.init(frequency:interval:recurrenceEnd:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:daysOfTheYear:weeksOfTheYear:monthsOfTheYear:setPositions:)(&v85, (uint64_t)v79, v73, &v84, (uint64_t)v44, v57, v61, v65, v81, v69, v76);

  sub_2496C5A30((uint64_t)v72, &qword_26B160608);
  uint64_t v75 = type metadata accessor for IntegrationRecurrence(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v74, 0, 1, v75);
}

uint64_t sub_2496C25C0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2496D81B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_2496C3314(0, v3 & ~(v3 >> 63), 0);
  uint64_t v4 = v9;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    if (!v6) {
      return v4;
    }
  }
  else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v4;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24C5A85A0](0, a1);
    sub_2496D7F18();
    swift_unknownObjectRelease();
  }
  else
  {
    id v7 = *(id *)(a1 + 32);
    sub_2496D7F18();
  }
  swift_release();
  return 0;
}

double REMReminder.color.getter@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t REMReminder.personaIdentifier.getter()
{
  return 0;
}

uint64_t sub_2496C2804()
{
  id v1 = objc_msgSend(*v0, sel_objectID);
  id v2 = objc_msgSend(v1, sel_urlRepresentation);

  uint64_t v3 = sub_2496D7B18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7AF8();

  uint64_t v7 = sub_2496D7AD8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

uint64_t sub_2496C2924@<X0>(uint64_t a1@<X8>)
{
  return REMReminder.startDate.getter(a1);
}

uint64_t sub_2496C2948@<X0>(uint64_t a1@<X8>)
{
  return REMReminder.timeZone.getter(a1);
}

uint64_t sub_2496C296C()
{
  id v1 = objc_msgSend(*v0, sel_titleAsString);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_2496D7E38();

  return v3;
}

uint64_t sub_2496C29D4()
{
  return REMReminder.allDay.getter() & 1;
}

id sub_2496C29FC()
{
  return objc_msgSend(*v0, sel_isCompleted);
}

uint64_t sub_2496C2A20()
{
  return REMReminderDefaultPriorityForPriorityLevel();
}

void sub_2496C2A78(uint64_t a1@<X8>)
{
}

double sub_2496C2A9C@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_2496C2AAC()
{
  return 0;
}

uint64_t sub_2496C2AB8()
{
  id v1 = objc_msgSend(*v0, sel_externalIdentifier);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_2496D7E38();

  return v3;
}

BOOL sub_2496C2B20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s26CalendarIntegrationSupport0B10RecurrenceV9FrequencyO9hashValueSivg_0()
{
  return sub_2496D8308();
}

uint64_t sub_2496C2B80()
{
  return sub_2496D82E8();
}

uint64_t sub_2496C2BAC()
{
  return sub_2496D8308();
}

uint64_t sub_2496C2BF0()
{
  if (*v0) {
    return 1635017060;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t sub_2496C2C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2496C605C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2496C2C4C()
{
  return 0;
}

void sub_2496C2C58(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2496C2C64(uint64_t a1)
{
  unint64_t v2 = sub_2496C5FC0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2496C2CA0(uint64_t a1)
{
  unint64_t v2 = sub_2496C5FC0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2496C2CDC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B160388);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496C5FC0();
  sub_2496D8328();
  LOBYTE(v14) = 0;
  sub_2496D8238();
  if (!v4)
  {
    uint64_t v14 = a3;
    uint64_t v15 = v13;
    char v16 = 1;
    sub_2496C6014();
    sub_2496D8228();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2496C2E64@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2496C6140(a1);
  if (!v2)
  {
    *(_DWORD *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_2496C2E94(void *a1)
{
  return sub_2496C2CDC(a1, *v1, *((void *)v1 + 1), *((void *)v1 + 2));
}

void *sub_2496C2EB4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B15FC50);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2496C3CD0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2496C2FC4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B15FC58);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2496C4CC4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2496C30EC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAB20);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2496C5378(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2496C31FC()
{
  unint64_t result = qword_2696CAB00;
  if (!qword_2696CAB00)
  {
    sub_2496D7A58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB00);
  }
  return result;
}

uint64_t sub_2496C3248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ReminderIntegrationDataSource()
{
  return self;
}

uint64_t sub_2496C32D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2496C3334(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2496C32F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2496C34A0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2496C3314(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2496C36E0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2496C3334(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B15FC38);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

uint64_t sub_2496C34A0(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160690);
  uint64_t v10 = *(void *)(type metadata accessor for IntegrationEntry(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for IntegrationEntry(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

uint64_t sub_2496C36E0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAB28);
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
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

void sub_2496C3840(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a1))
    {
      if (*(_DWORD *)(a4 + 36) == a2)
      {
        sub_2496D7FF8();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_2496D8138() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_2496D8148();
  sub_2496C5B60(a1, a2, 1);
  sub_2496BC414(0, &qword_26B1602C8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_2496D52A8((uint64_t)v8);
  char v7 = v6;

  if (v7)
  {
    sub_2496D8118();
    sub_2496D8168();
    sub_2496C5B54(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_2496C39E0(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_2496D80F8();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v3 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

void sub_2496C3AA4(void *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if (a4)
    {
      sub_2496D8178();
      sub_2496BC414(0, &qword_26B1602C8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_2496BC414(0, &qword_26B160658);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_10:
    if (sub_2496D8138() == *(_DWORD *)(a5 + 36))
    {
      sub_2496D8148();
      sub_2496BC414(0, &qword_26B1602C8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v6 = sub_2496D52A8((uint64_t)v13);
      char v9 = v8;

      if (v9) {
        goto LABEL_12;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  unint64_t v10 = *(void **)(*(void *)(a5 + 48) + 8 * v6);
  int64_t v11 = *(void **)(*(void *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  id v12 = v11;
}

uint64_t sub_2496C3CD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

void sub_2496C3DC4(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2496D8008();
    sub_2496BC414(0, &qword_26B1602C8);
    sub_2496C5A8C();
    sub_2496D7EF8();
    uint64_t v1 = v40;
    uint64_t v35 = v41;
    uint64_t v2 = v42;
    uint64_t v3 = v43;
    unint64_t v4 = v44;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v35 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v7 = -v5;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v4 = v8 & v6;
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  uint64_t v31 = v2;
  uint64_t v33 = v1 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v34 = (unint64_t)(v2 + 64) >> 6;
  uint64_t v37 = (void *)MEMORY[0x263F8EE78];
  uint64_t v32 = MEMORY[0x263F8EE50] + 8;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
      uint64_t v11 = v3;
      goto LABEL_29;
    }
    int64_t v15 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v15 >= v34) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v35 + 8 * v15);
    uint64_t v11 = v3 + 1;
    if (!v16)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v34) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v35 + 8 * v11);
      if (!v16)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v34) {
          goto LABEL_36;
        }
        unint64_t v16 = *(void *)(v35 + 8 * v11);
        if (!v16)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v34) {
            goto LABEL_36;
          }
          unint64_t v16 = *(void *)(v35 + 8 * v11);
          if (!v16)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v34) {
              goto LABEL_36;
            }
            unint64_t v16 = *(void *)(v35 + 8 * v11);
            if (!v16)
            {
              uint64_t v17 = v3 + 6;
              while (v34 != v17)
              {
                unint64_t v16 = *(void *)(v35 + 8 * v17++);
                if (v16)
                {
                  uint64_t v11 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_36:
              sub_2496BC3B0();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_29:
    id v14 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    uint64_t v13 = v14;
    if (!v14) {
      goto LABEL_36;
    }
    while (1)
    {
      uint64_t v36 = v11;
      id v18 = (void *)MEMORY[0x24C5A88D0](v14);
      id v19 = objc_msgSend(v13, sel_urlRepresentation, v31, v32, v33);
      uint64_t v20 = sub_2496D7B18();
      uint64_t v21 = *(void *)(v20 - 8);
      MEMORY[0x270FA5388](v20);
      unint64_t v23 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496D7AF8();

      uint64_t v24 = sub_2496D7AD8();
      uint64_t v26 = v25;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v37 = sub_2496C2EB4(0, v37[2] + 1, 1, v37);
      }
      unint64_t v28 = v37[2];
      unint64_t v27 = v37[3];
      if (v28 >= v27 >> 1) {
        uint64_t v37 = sub_2496C2EB4((void *)(v27 > 1), v28 + 1, 1, v37);
      }
      uint64_t v29 = v37;
      v37[2] = v28 + 1;
      os_log_type_t v30 = &v29[2 * v28];
      v30[4] = v24;
      v30[5] = v26;

      uint64_t v3 = v36;
      unint64_t v4 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v12 = sub_2496D8028();
      if (v12)
      {
        uint64_t v38 = v12;
        sub_2496BC414(0, &qword_26B1602C8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v13 = v39;
        id v14 = (id)swift_unknownObjectRelease();
        uint64_t v11 = v3;
        uint64_t v9 = v4;
        if (v13) {
          continue;
        }
      }
      goto LABEL_36;
    }
  }
  __break(1u);
}

uint64_t sub_2496C41E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v5 = sub_2496D8018();
  }
  else {
    uint64_t v5 = *(void *)(a1 + 16);
  }
  uint64_t v83 = MEMORY[0x263F8EE78];
  sub_2496C32D4(0, v5 & ~(v5 >> 63), 0);
  if (v4)
  {
    swift_bridgeObjectRetain();
    sub_2496D8008();
    sub_2496BC414(0, &qword_26B1602C8);
    sub_2496C5A8C();
    sub_2496D7EF8();
    uint64_t v3 = v78;
    uint64_t v69 = v79;
    uint64_t v7 = v81;
    uint64_t v65 = v80;
    unint64_t v8 = v82;
    if ((v5 & 0x8000000000000000) == 0) {
      goto LABEL_6;
    }
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v3 + 32);
  uint64_t v35 = *(void *)(v3 + 56);
  uint64_t v69 = v3 + 56;
  uint64_t v65 = ~v34;
  uint64_t v36 = -v34;
  if (v36 < 64) {
    uint64_t v37 = ~(-1 << v36);
  }
  else {
    uint64_t v37 = -1;
  }
  unint64_t v8 = v37 & v35;
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  if (v5 < 0) {
    goto LABEL_42;
  }
LABEL_6:
  uint64_t v71 = *MEMORY[0x263F30288];
  uint64_t v6 = MEMORY[0x263F8EE50];
  if (v5)
  {
    uint64_t v70 = v7;
    uint64_t v9 = 0;
    uint64_t v67 = v3 & 0x7FFFFFFFFFFFFFFFLL;
    int64_t v68 = (unint64_t)(v65 + 64) >> 6;
    uint64_t v63 = a2;
    int64_t v64 = v68 - 1;
    uint64_t v66 = MEMORY[0x263F8EE50] + 8;
    uint64_t v72 = v3;
    do
    {
      if (v9 == v5)
      {
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
LABEL_77:
        uint64_t result = swift_release();
        __break(1u);
        return result;
      }
      if (v3 < 0)
      {
        uint64_t v12 = sub_2496D8028();
        if (!v12) {
          goto LABEL_77;
        }
        uint64_t v76 = v12;
        sub_2496BC414(0, &qword_26B1602C8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v77;
        swift_unknownObjectRelease();
      }
      else
      {
        if (v8)
        {
          unint64_t v10 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          unint64_t v11 = v10 | (v70 << 6);
        }
        else
        {
          int64_t v14 = v70 + 1;
          if (__OFADD__(v70, 1)) {
            goto LABEL_75;
          }
          if (v14 >= v68) {
            goto LABEL_77;
          }
          unint64_t v15 = *(void *)(v69 + 8 * v14);
          uint64_t v16 = v70 + 1;
          if (!v15)
          {
            uint64_t v16 = v70 + 2;
            if (v70 + 2 >= v68) {
              goto LABEL_77;
            }
            unint64_t v15 = *(void *)(v69 + 8 * v16);
            if (!v15)
            {
              uint64_t v16 = v70 + 3;
              if (v70 + 3 >= v68) {
                goto LABEL_77;
              }
              unint64_t v15 = *(void *)(v69 + 8 * v16);
              if (!v15)
              {
                uint64_t v16 = v70 + 4;
                if (v70 + 4 >= v68) {
                  goto LABEL_77;
                }
                unint64_t v15 = *(void *)(v69 + 8 * v16);
                if (!v15)
                {
                  uint64_t v16 = v70 + 5;
                  if (v70 + 5 >= v68) {
                    goto LABEL_77;
                  }
                  unint64_t v15 = *(void *)(v69 + 8 * v16);
                  if (!v15)
                  {
                    uint64_t v17 = v70 + 6;
                    do
                    {
                      if (v68 == v17) {
                        goto LABEL_77;
                      }
                      unint64_t v15 = *(void *)(v69 + 8 * v17++);
                    }
                    while (!v15);
                    uint64_t v16 = v17 - 1;
                  }
                }
              }
            }
          }
          unint64_t v8 = (v15 - 1) & v15;
          unint64_t v11 = __clz(__rbit64(v15)) + (v16 << 6);
          uint64_t v70 = v16;
        }
        id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v11);
      }
      if (!v13) {
        goto LABEL_77;
      }
      unint64_t v75 = v8;
      uint64_t v18 = sub_2496D7E38();
      uint64_t v73 = v19;
      uint64_t v74 = v18;
      id v20 = objc_msgSend(v13, sel_urlRepresentation, v63);
      uint64_t v21 = sub_2496D7B18();
      uint64_t v22 = *(void *)(v21 - 8);
      MEMORY[0x270FA5388](v21);
      uint64_t v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496D7AF8();

      uint64_t v25 = sub_2496D7AD8();
      uint64_t v27 = v26;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);

      uint64_t v28 = v83;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2496C32D4(0, *(void *)(v28 + 16) + 1, 1);
        uint64_t v28 = v83;
      }
      unint64_t v30 = *(void *)(v28 + 16);
      unint64_t v29 = *(void *)(v28 + 24);
      unint64_t v8 = v75;
      if (v30 >= v29 >> 1)
      {
        sub_2496C32D4(v29 > 1, v30 + 1, 1);
        uint64_t v28 = v83;
      }
      ++v9;
      *(void *)(v28 + 16) = v30 + 1;
      uint64_t v31 = (void *)(v28 + 32 * v30);
      uint64_t v32 = v73;
      v31[4] = v74;
      v31[5] = v32;
      v31[6] = v25;
      v31[7] = v27;
      uint64_t v3 = v72;
    }
    while (v9 != v5);
    uint64_t v7 = v70;
    uint64_t v6 = MEMORY[0x263F8EE50];
    int64_t v33 = v64;
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v67 = v3 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v68 = (unint64_t)(v65 + 64) >> 6;
  int64_t v33 = v68 - 1;
LABEL_44:
  uint64_t v66 = v33 - 5;
  int64_t v64 = v69 + 48;
  uint64_t v70 = v6 + 8;
  uint64_t v72 = v3;
  if (v3 < 0) {
    goto LABEL_47;
  }
  while (1)
  {
    if (v8)
    {
      uint64_t v38 = (v8 - 1) & v8;
      unint64_t v39 = __clz(__rbit64(v8)) | (v7 << 6);
      uint64_t v40 = v7;
      goto LABEL_66;
    }
    int64_t v43 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_76;
    }
    if (v43 >= v68) {
      goto LABEL_73;
    }
    unint64_t v44 = *(void *)(v69 + 8 * v43);
    uint64_t v40 = v7 + 1;
    if (!v44)
    {
      uint64_t v40 = v7 + 2;
      if (v7 + 2 >= v68) {
        goto LABEL_73;
      }
      unint64_t v44 = *(void *)(v69 + 8 * v40);
      if (!v44)
      {
        uint64_t v40 = v7 + 3;
        if (v7 + 3 >= v68) {
          goto LABEL_73;
        }
        unint64_t v44 = *(void *)(v69 + 8 * v40);
        if (!v44)
        {
          uint64_t v40 = v7 + 4;
          if (v7 + 4 >= v68) {
            goto LABEL_73;
          }
          unint64_t v44 = *(void *)(v69 + 8 * v40);
          if (!v44)
          {
            uint64_t v40 = v7 + 5;
            if (v7 + 5 >= v68) {
              goto LABEL_73;
            }
            unint64_t v44 = *(void *)(v69 + 8 * v40);
            if (!v44) {
              break;
            }
          }
        }
      }
    }
LABEL_65:
    uint64_t v38 = (v44 - 1) & v44;
    unint64_t v39 = __clz(__rbit64(v44)) + (v40 << 6);
LABEL_66:
    id v42 = *(id *)(*(void *)(v3 + 48) + 8 * v39);
    if (!v42) {
      goto LABEL_73;
    }
    while (1)
    {
      uint64_t v73 = v38;
      uint64_t v46 = sub_2496D7E38();
      uint64_t v74 = v47;
      unint64_t v75 = v46;
      id v48 = objc_msgSend(v42, sel_urlRepresentation);
      uint64_t v49 = sub_2496D7B18();
      uint64_t v50 = *(void *)(v49 - 8);
      MEMORY[0x270FA5388](v49);
      uint64_t v52 = (char *)&v63 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496D7AF8();

      uint64_t v53 = sub_2496D7AD8();
      uint64_t v55 = v54;
      (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v49);

      uint64_t v56 = v83;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2496C32D4(0, *(void *)(v56 + 16) + 1, 1);
        uint64_t v56 = v83;
      }
      unint64_t v57 = v73;
      unint64_t v59 = *(void *)(v56 + 16);
      unint64_t v58 = *(void *)(v56 + 24);
      if (v59 >= v58 >> 1)
      {
        sub_2496C32D4(v58 > 1, v59 + 1, 1);
        uint64_t v56 = v83;
      }
      *(void *)(v56 + 16) = v59 + 1;
      unint64_t v60 = (void *)(v56 + 32 * v59);
      uint64_t v61 = v74;
      v60[4] = v75;
      v60[5] = v61;
      v60[6] = v53;
      v60[7] = v55;
      uint64_t v7 = v40;
      unint64_t v8 = v57;
      uint64_t v3 = v72;
      if ((v72 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_47:
      uint64_t v41 = sub_2496D8028();
      if (v41)
      {
        uint64_t v76 = v41;
        sub_2496BC414(0, &qword_26B1602C8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v42 = v77;
        swift_unknownObjectRelease();
        uint64_t v40 = v7;
        uint64_t v38 = v8;
        if (v42) {
          continue;
        }
      }
      goto LABEL_73;
    }
  }
  uint64_t v45 = v7;
  while (v66 != v45)
  {
    unint64_t v44 = *(void *)(v64 + 8 * v45++);
    if (v44)
    {
      uint64_t v40 = v45 + 5;
      goto LABEL_65;
    }
  }
LABEL_73:
  sub_2496BC3B0();
  return v83;
}

uint64_t sub_2496C49D0(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v4 = type metadata accessor for IntegrationEntry(0);
  uint64_t v31 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v30 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v7 = sub_2496D8018();
  }
  else {
    uint64_t v7 = *(void *)(a1 + 16);
  }
  uint64_t result = MEMORY[0x263F8EE78];
  if (v7)
  {
    uint64_t v38 = MEMORY[0x263F8EE78];
    sub_2496C32F4(0, v7 & ~(v7 >> 63), 0);
    uint64_t result = sub_2496C39E0(a1);
    uint64_t v35 = result;
    uint64_t v36 = v9;
    char v37 = v10 & 1;
    if (v7 < 0)
    {
      __break(1u);
LABEL_22:
      __break(1u);
    }
    else
    {
      uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8;
      if (a1 < 0) {
        uint64_t v11 = a1;
      }
      v29[2] = v11;
      do
      {
        while (1)
        {
          uint64_t v19 = v35;
          uint64_t v18 = v36;
          char v20 = v37;
          uint64_t v21 = a1;
          sub_2496C3AA4(v34, v35, v36, v37, a1);
          uint64_t v23 = v22;
          uint64_t v24 = (void *)v34[0];
          v32();

          uint64_t v25 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2496C32F4(0, *(void *)(v25 + 16) + 1, 1);
            uint64_t v25 = v38;
          }
          unint64_t v27 = *(void *)(v25 + 16);
          unint64_t v26 = *(void *)(v25 + 24);
          if (v27 >= v26 >> 1)
          {
            sub_2496C32F4(v26 > 1, v27 + 1, 1);
            uint64_t v25 = v38;
          }
          *(void *)(v25 + 16) = v27 + 1;
          uint64_t result = sub_2496C5AF0((uint64_t)v6, v25+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v27);
          if (v30) {
            break;
          }
          a1 = v21;
          sub_2496C3840(v19, v18, v20, v21);
          uint64_t v13 = v12;
          uint64_t v15 = v14;
          char v17 = v16;
          sub_2496C5B54(v19, v18, v20);
          uint64_t v35 = v13;
          uint64_t v36 = v15;
          char v37 = v17 & 1;
          if (!--v7) {
            goto LABEL_19;
          }
        }
        if ((v20 & 1) == 0) {
          goto LABEL_22;
        }
        a1 = v21;
        if (sub_2496D8128()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B160650);
        uint64_t v28 = (void (*)(void *, void))sub_2496D7DF8();
        sub_2496D8198();
        v28(v34, 0);
        --v7;
      }
      while (v7);
LABEL_19:
      sub_2496C5B54(v35, v36, v37);
      return v38;
    }
  }
  return result;
}

uint64_t sub_2496C4CC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2496D81F8();
  __break(1u);
  return result;
}

void sub_2496C4DBC(unint64_t a1)
{
  uint64_t v2 = v1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    unint64_t v59 = 0;
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    unint64_t v5 = sub_2496D8108() | 0x8000000000000000;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v3 = ~v6;
    uint64_t v7 = *(void *)(a1 + 64);
    unint64_t v59 = a1 + 64;
    uint64_t v8 = -v6;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v4 = v9 & v7;
    unint64_t v5 = a1;
  }
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v57 = v5 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v54 = v3;
  int64_t v58 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v52 = *MEMORY[0x263F30288];
  uint64_t v55 = (void *)MEMORY[0x263F8EE78];
  uint64_t v56 = MEMORY[0x263F8EE50] + 8;
  while ((v5 & 0x8000000000000000) != 0)
  {
    uint64_t v14 = sub_2496D8188();
    if (!v14) {
      goto LABEL_39;
    }
    uint64_t v16 = v15;
    uint64_t v62 = v14;
    sub_2496BC414(0, &qword_26B1602C8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v17 = v63;
    swift_unknownObjectRelease();
    uint64_t v62 = v16;
    sub_2496BC414(0, &qword_26B15FC30);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v18 = v63;
    swift_unknownObjectRelease();
    int64_t v13 = v10;
    uint64_t v11 = v4;
    if (!v17) {
      goto LABEL_39;
    }
LABEL_26:
    unint64_t v60 = v11;
    int64_t v61 = v13;
    uint64_t v23 = sub_2496D7D58();
    uint64_t v24 = *(void *)(v23 - 8);
    MEMORY[0x270FA5388](v23);
    unint64_t v26 = (char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v27 = v17;
    id v28 = v18;
    id v29 = objc_msgSend(v28, sel_color);
    sub_2496D7D48();
    uint64_t v30 = sub_2496D7D38();
    if (v2)
    {

      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      uint64_t v2 = 0;
      unint64_t v4 = v60;
      int64_t v10 = v61;
    }
    else
    {
      uint64_t v32 = v31;
      uint64_t v50 = v30;
      uint64_t v51 = 0;
      id v53 = objc_msgSend(v27, sel_urlRepresentation);
      uint64_t v47 = sub_2496D7B18();
      id v48 = &v45;
      uint64_t v46 = *(void *)(v47 - 8);
      MEMORY[0x270FA5388](v47);
      uint64_t v34 = (char *)&v45 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496D7AF8();

      id v53 = (id)sub_2496D7AD8();
      uint64_t v49 = v35;
      (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v47);
      uint64_t v36 = sub_2496D7E38();
      id v48 = v37;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);

      uint64_t v38 = v55;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v38 = sub_2496C2FC4(0, v38[2] + 1, 1, v38);
      }
      unint64_t v40 = v38[2];
      unint64_t v39 = v38[3];
      unint64_t v4 = v60;
      if (v40 >= v39 >> 1) {
        uint64_t v38 = sub_2496C2FC4((void *)(v39 > 1), v40 + 1, 1, v38);
      }
      v38[2] = v40 + 1;
      uint64_t v55 = v38;
      uint64_t v41 = &v38[6 * v40];
      id v42 = v48;
      v41[4] = v36;
      v41[5] = v42;
      uint64_t v43 = v49;
      v41[6] = v53;
      v41[7] = v43;
      v41[8] = v50;
      v41[9] = v32;
      uint64_t v2 = v51;
      int64_t v10 = v61;
    }
  }
  if (v4)
  {
    uint64_t v11 = (v4 - 1) & v4;
    unint64_t v12 = __clz(__rbit64(v4)) | (v10 << 6);
    int64_t v13 = v10;
LABEL_25:
    uint64_t v21 = 8 * v12;
    uint64_t v22 = *(void **)(*(void *)(v5 + 56) + v21);
    id v17 = *(id *)(*(void *)(v5 + 48) + v21);
    id v18 = v22;
    if (!v17) {
      goto LABEL_39;
    }
    goto LABEL_26;
  }
  int64_t v13 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v13 >= v58) {
      goto LABEL_39;
    }
    unint64_t v19 = *(void *)(v59 + 8 * v13);
    if (!v19)
    {
      int64_t v20 = v10 + 2;
      if (v10 + 2 >= v58) {
        goto LABEL_39;
      }
      unint64_t v19 = *(void *)(v59 + 8 * v20);
      if (v19) {
        goto LABEL_23;
      }
      int64_t v20 = v10 + 3;
      if (v10 + 3 >= v58) {
        goto LABEL_39;
      }
      unint64_t v19 = *(void *)(v59 + 8 * v20);
      if (v19) {
        goto LABEL_23;
      }
      int64_t v20 = v10 + 4;
      if (v10 + 4 >= v58) {
        goto LABEL_39;
      }
      unint64_t v19 = *(void *)(v59 + 8 * v20);
      if (v19)
      {
LABEL_23:
        int64_t v13 = v20;
      }
      else
      {
        int64_t v13 = v10 + 5;
        if (v10 + 5 >= v58) {
          goto LABEL_39;
        }
        unint64_t v19 = *(void *)(v59 + 8 * v13);
        if (!v19)
        {
          int64_t v44 = v10 + 6;
          while (v58 != v44)
          {
            unint64_t v19 = *(void *)(v59 + 8 * v44++);
            if (v19)
            {
              int64_t v13 = v44 - 1;
              goto LABEL_24;
            }
          }
LABEL_39:
          sub_2496BC3B0();
          return;
        }
      }
    }
LABEL_24:
    uint64_t v11 = (v19 - 1) & v19;
    unint64_t v12 = __clz(__rbit64(v19)) + (v13 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

char *sub_2496C5378(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2496D81F8();
  __break(1u);
  return result;
}

id sub_2496C5464(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_2496D7B18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B15FC60);
  MEMORY[0x270FA5388](v8 - 8);
  int64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D7B08();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_2496C5A30((uint64_t)v10, &qword_26B15FC60);
    if (qword_26B160418 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_2496D7D88();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B1606B0);
    swift_bridgeObjectRetain_n();
    unint64_t v12 = sub_2496D7D68();
    os_log_type_t v13 = sub_2496D7F48();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v26 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_2496BA7D4(a1, a2, &v26);
      sub_2496D7FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2496B3000, v12, v13, "Can't turn non-URL into reminder object ID %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A8E90](v15, -1, -1);
      MEMORY[0x24C5A8E90](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  uint64_t v16 = (void *)sub_2496D7AE8();
  id v17 = objc_msgSend(self, sel_objectIDWithURL_, v16);

  if (!v17)
  {
    if (qword_26B160418 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_2496D7D88();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B1606B0);
    swift_bridgeObjectRetain_n();
    unint64_t v19 = sub_2496D7D68();
    os_log_type_t v20 = sub_2496D7F48();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      v24[1] = v21 + 4;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_2496BA7D4(a1, a2, &v26);
      sub_2496D7FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2496B3000, v19, v20, "invalid object ID URL %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A8E90](v22, -1, -1);
      MEMORY[0x24C5A8E90](v21, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v17;
}

unint64_t sub_2496C591C()
{
  unint64_t result = qword_26B160290;
  if (!qword_26B160290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B160290);
  }
  return result;
}

uint64_t sub_2496C5970(uint64_t a1, unint64_t a2)
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

unint64_t sub_2496C59C8()
{
  unint64_t result = qword_26B160298;
  if (!qword_26B160298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B160298);
  }
  return result;
}

uint64_t sub_2496C5A1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2496C5970(a1, a2);
  }
  return a1;
}

uint64_t sub_2496C5A30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2496C5A8C()
{
  unint64_t result = qword_26B1602D0;
  if (!qword_26B1602D0)
  {
    sub_2496BC414(255, &qword_26B1602C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1602D0);
  }
  return result;
}

uint64_t sub_2496C5AE8@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  return sub_2496BEFF8(a1, *(uint64_t **)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_2496C5AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntegrationEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2496C5B54(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2496C5B60(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_2496C5B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2496C5970(a5, a6);
  }
}

uint64_t sub_2496C5BCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_2496C5C30()
{
  unint64_t result = qword_2696CAB18;
  if (!qword_2696CAB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB18);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReminderIntegrationDataSource.SyncError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ReminderIntegrationDataSource.SyncError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2496C5D74);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2496C5D9C()
{
  return 0;
}

ValueMetadata *type metadata accessor for ReminderIntegrationDataSource.SyncError()
{
  return &type metadata for ReminderIntegrationDataSource.SyncError;
}

uint64_t destroy for VersionTaggedData(uint64_t a1)
{
  return sub_2496C5970(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s26CalendarIntegrationSupport17VersionTaggedDataVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_2496BBA60(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for VersionTaggedData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_2496BBA60(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_2496C5970(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VersionTaggedData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_2496C5970(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for VersionTaggedData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for VersionTaggedData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VersionTaggedData()
{
  return &type metadata for VersionTaggedData;
}

unint64_t sub_2496C5F6C()
{
  unint64_t result = qword_2696CAB30;
  if (!qword_2696CAB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB30);
  }
  return result;
}

unint64_t sub_2496C5FC0()
{
  unint64_t result = qword_26B160278;
  if (!qword_26B160278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B160278);
  }
  return result;
}

unint64_t sub_2496C6014()
{
  unint64_t result = qword_26B15FC68;
  if (!qword_26B15FC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B15FC68);
  }
  return result;
}

uint64_t sub_2496C605C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_2496D8258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2496D8258();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2496C6140(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160380);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_2496C5FC0();
  sub_2496D8318();
  if (!v1)
  {
    v9[16] = 0;
    uint64_t v7 = sub_2496D8218();
    v9[15] = 1;
    sub_2496C6300();
    sub_2496D8208();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_2496C6300()
{
  unint64_t result = qword_26B15FC70;
  if (!qword_26B15FC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B15FC70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VersionTaggedData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for VersionTaggedData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2496C64A4);
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

uint64_t sub_2496C64CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2496C64D4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for VersionTaggedData.CodingKeys()
{
  return &type metadata for VersionTaggedData.CodingKeys;
}

unint64_t sub_2496C64F4()
{
  unint64_t result = qword_2696CAB38;
  if (!qword_2696CAB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB38);
  }
  return result;
}

unint64_t sub_2496C654C()
{
  unint64_t result = qword_26B160288;
  if (!qword_26B160288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B160288);
  }
  return result;
}

unint64_t sub_2496C65A4()
{
  unint64_t result = qword_26B160280;
  if (!qword_26B160280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B160280);
  }
  return result;
}

uint64_t IntegrationEntry.init<A>(entry:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  MEMORY[0x270FA5388](v8 - 8);
  *(void *)&long long v39 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = (int *)type metadata accessor for IntegrationEntry(0);
  uint64_t v37 = (uint64_t)a4 + v10[7];
  uint64_t v11 = v37;
  uint64_t v12 = sub_2496D7C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&long long v38 = (char *)a4 + v10[12];
  uint64_t v13 = v38;
  uint64_t v14 = type metadata accessor for IntegrationRecurrence(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = (char *)a4 + v10[13];
  *((_OWORD *)v15 + 1) = 0u;
  *((_OWORD *)v15 + 2) = 0u;
  *(_OWORD *)uint64_t v15 = 0u;
  uint64_t v16 = (void *)((char *)a4 + v10[14]);
  uint64_t *v16 = 0;
  v16[1] = 0;
  id v17 = (void *)((char *)a4 + v10[15]);
  uint64_t *v17 = 0;
  v17[1] = 0;
  *a4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  a4[1] = v18;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  sub_2496C5BCC((uint64_t)v21, v37, &qword_26B1605E8);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  uint64_t v23 = (void *)((char *)a4 + v10[8]);
  uint64_t *v23 = v22;
  v23[1] = v24;
  *((unsigned char *)a4 + v10[9]) = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3) & 1;
  *((unsigned char *)a4 + v10[10]) = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3) & 1;
  uint64_t v25 = v39;
  (*(void (**)(uint64_t, uint64_t))(a3 + 72))(a2, a3);
  sub_2496C5BCC(v25, v38, &qword_26B160628);
  *(void *)((char *)a4 + v10[11]) = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(a3 + 80))(v40, a2, a3);
  long long v38 = v40[1];
  long long v39 = v40[0];
  uint64_t v26 = v41;
  uint64_t v27 = v42;
  sub_2496C5B6C(*(void *)v15, *((void *)v15 + 1), *((void *)v15 + 2), *((void *)v15 + 3), *((void *)v15 + 4), *((void *)v15 + 5));
  long long v28 = v38;
  *(_OWORD *)uint64_t v15 = v39;
  *((_OWORD *)v15 + 1) = v28;
  *((void *)v15 + 4) = v26;
  *((void *)v15 + 5) = v27;
  uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 88))(a2, a3);
  uint64_t v31 = v30;
  swift_bridgeObjectRelease();
  uint64_t *v16 = v29;
  v16[1] = v31;
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 96))(a2, a3);
  uint64_t v34 = v33;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t *v17 = v32;
  v17[1] = v34;
  return result;
}

uint64_t type metadata accessor for IntegrationEntry(uint64_t a1)
{
  return sub_2496C6C10(a1, (uint64_t *)&unk_26B160640);
}

uint64_t type metadata accessor for IntegrationRecurrence(uint64_t a1)
{
  return sub_2496C6C10(a1, (uint64_t *)&unk_26B160618);
}

uint64_t IntegrationColor.init(providerIdentifier:colorIdentifier:data:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

CalendarIntegrationSupport::IntegrationColor::Identifier __swiftcall IntegrationColor.Identifier.init(providerIdentifier:colorIdentifier:)(Swift::String providerIdentifier, Swift::String colorIdentifier)
{
  *int v2 = providerIdentifier;
  v2[1] = colorIdentifier;
  result.colorIdentifier = colorIdentifier;
  result.providerIdentifier = providerIdentifier;
  return result;
}

uint64_t IntegrationRecurrence.init(frequency:interval:recurrenceEnd:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:daysOfTheYear:weeksOfTheYear:monthsOfTheYear:setPositions:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  char v12 = *a1;
  char v24 = *a4;
  *(void *)(a9 + 8) = 1;
  uint64_t v13 = (int *)type metadata accessor for IntegrationRecurrence(0);
  uint64_t v14 = a9 + v13[6];
  uint64_t v15 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = v13[7];
  *(unsigned char *)(a9 + v16) = 7;
  uint64_t v17 = v13[8];
  *(void *)(a9 + v17) = 0;
  uint64_t v18 = v13[9];
  *(void *)(a9 + v18) = 0;
  uint64_t v19 = v13[10];
  *(void *)(a9 + v19) = 0;
  uint64_t v20 = v13[11];
  *(void *)(a9 + v20) = 0;
  uint64_t v21 = v13[12];
  *(void *)(a9 + v21) = 0;
  uint64_t v22 = v13[13];
  *(void *)(a9 + v22) = 0;
  sub_2496C5BCC(a3, v14, &qword_26B160608);
  *(unsigned char *)a9 = v12;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + v16) = v24;
  swift_bridgeObjectRelease();
  *(void *)(a9 + v17) = a5;
  swift_bridgeObjectRelease();
  *(void *)(a9 + v18) = a6;
  swift_bridgeObjectRelease();
  *(void *)(a9 + v19) = a7;
  swift_bridgeObjectRelease();
  *(void *)(a9 + v20) = a8;
  swift_bridgeObjectRelease();
  *(void *)(a9 + v21) = a10;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a9 + v22) = a11;
  return result;
}

uint64_t type metadata accessor for IntegrationRecurrence.RecurrenceEnd(uint64_t a1)
{
  return sub_2496C6C10(a1, (uint64_t *)&unk_26B1605F8);
}

uint64_t sub_2496C6C10(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t IntegrationEntry.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.identifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 20);
  uint64_t v4 = sub_2496D7BA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t IntegrationEntry.startDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 20);
  uint64_t v4 = sub_2496D7BA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*IntegrationEntry.startDate.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 24);
  uint64_t v4 = sub_2496D7BA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t IntegrationEntry.endDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 24);
  uint64_t v4 = sub_2496D7BA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*IntegrationEntry.endDate.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2496CBA9C(v1 + *(int *)(v3 + 28), a1, &qword_26B1605E8);
}

uint64_t IntegrationEntry.timeZone.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2496C5BCC(a1, v1 + *(int *)(v3 + 28), &qword_26B1605E8);
}

uint64_t (*IntegrationEntry.timeZone.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.title.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for IntegrationEntry(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.title.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.allDay.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 36));
}

uint64_t IntegrationEntry.allDay.setter(char a1)
{
  uint64_t result = type metadata accessor for IntegrationEntry(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*IntegrationEntry.allDay.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.completed.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 40));
}

uint64_t IntegrationEntry.completed.setter(char a1)
{
  uint64_t result = type metadata accessor for IntegrationEntry(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*IntegrationEntry.completed.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.priority.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 44));
}

uint64_t IntegrationEntry.priority.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for IntegrationEntry(0);
  *(void *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*IntegrationEntry.priority.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.recurrence.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2496CBA9C(v1 + *(int *)(v3 + 48), a1, &qword_26B160628);
}

uint64_t IntegrationEntry.recurrence.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2496C5BCC(a1, v1 + *(int *)(v3 + 48), &qword_26B160628);
}

uint64_t (*IntegrationEntry.recurrence.modify())()
{
  return nullsub_1;
}

void IntegrationEntry.color.getter(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 52));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  unint64_t v9 = v3[5];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  sub_2496C73CC(v4, v5, v6, v7, v8, v9);
}

void sub_2496C73CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2496BBA60(a5, a6);
  }
}

__n128 IntegrationEntry.color.setter(long long *a1)
{
  __n128 v6 = (__n128)a1[1];
  long long v7 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  uint64_t v4 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 52);
  sub_2496C5B6C(*(void *)v4, *(void *)(v4 + 8), *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40));
  __n128 result = v6;
  *(_OWORD *)uint64_t v4 = v7;
  *(__n128 *)(v4 + 16) = v6;
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v3;
  return result;
}

uint64_t (*IntegrationEntry.color.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.personaIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.personaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for IntegrationEntry(0) + 56));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.personaIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.externalIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.externalIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for IntegrationEntry(0) + 60));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.externalIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.init(identifier:startDate:endDate:timeZone:title:allDay:completed:priority:recurrence:color:personaIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, char *a9@<X8>, char a10, uint64_t a11, uint64_t a12, long long *a13, uint64_t a14, uint64_t a15)
{
  long long v39 = a13[1];
  long long v40 = *a13;
  uint64_t v37 = *((void *)a13 + 5);
  uint64_t v38 = *((void *)a13 + 4);
  uint64_t v18 = (int *)type metadata accessor for IntegrationEntry(0);
  uint64_t v19 = (uint64_t)&a9[v18[7]];
  uint64_t v20 = sub_2496D7C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = (uint64_t)&a9[v18[12]];
  uint64_t v22 = type metadata accessor for IntegrationRecurrence(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = &a9[v18[13]];
  *((_OWORD *)v23 + 1) = 0u;
  *((_OWORD *)v23 + 2) = 0u;
  *(_OWORD *)uint64_t v23 = 0u;
  char v24 = &a9[v18[14]];
  *(void *)char v24 = 0;
  *((void *)v24 + 1) = 0;
  uint64_t v25 = &a9[v18[15]];
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = 0;
  *(void *)a9 = a1;
  *((void *)a9 + 1) = a2;
  uint64_t v26 = &a9[v18[5]];
  uint64_t v27 = sub_2496D7BA8();
  long long v28 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32);
  v28(v26, a3, v27);
  v28(&a9[v18[6]], a4, v27);
  sub_2496C5BCC(a5, v19, &qword_26B1605E8);
  uint64_t v29 = &a9[v18[8]];
  *(void *)uint64_t v29 = a6;
  *((void *)v29 + 1) = a7;
  a9[v18[9]] = a8;
  a9[v18[10]] = a10;
  *(void *)&a9[v18[11]] = a11;
  sub_2496C5BCC(a12, v21, &qword_26B160628);
  sub_2496C5B6C(*(void *)v23, *((void *)v23 + 1), *((void *)v23 + 2), *((void *)v23 + 3), *((void *)v23 + 4), *((void *)v23 + 5));
  *(_OWORD *)uint64_t v23 = v40;
  *((_OWORD *)v23 + 1) = v39;
  *((void *)v23 + 4) = v38;
  *((void *)v23 + 5) = v37;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)char v24 = a14;
  *((void *)v24 + 1) = a15;
  return result;
}

uint64_t IntegrationEntry.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v28 = type metadata accessor for IntegrationRecurrence(0);
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  MEMORY[0x270FA5388](v5 - 8);
  long long v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for IntegrationEntry(0);
  sub_2496D7BA8();
  sub_2496D03AC(&qword_2696CAB40, MEMORY[0x270FA92D0]);
  sub_2496D7E08();
  sub_2496D7E08();
  uint64_t v9 = v0 + v8[7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496CBA9C(v9, (uint64_t)v12, &qword_26B1605E8);
  uint64_t v13 = sub_2496D7C38();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v15 == 1)
  {
    sub_2496D82F8();
  }
  else
  {
    uint64_t v27 = (uint64_t)&v27;
    MEMORY[0x270FA5388](v15);
    uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
    sub_2496D82F8();
    sub_2496D03AC(&qword_2696CAB48, MEMORY[0x270FA99E0]);
    sub_2496D7E08();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  uint64_t v18 = v28;
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  swift_bridgeObjectRelease();
  sub_2496D82F8();
  sub_2496D82F8();
  sub_2496D82E8();
  sub_2496CBA9C(v1 + v8[12], (uint64_t)v7, &qword_26B160628);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v18) == 1)
  {
    sub_2496D82F8();
  }
  else
  {
    sub_2496CBB64((uint64_t)v7, (uint64_t)v4, type metadata accessor for IntegrationRecurrence);
    sub_2496D82F8();
    IntegrationRecurrence.hash(into:)();
    sub_2496CBBCC((uint64_t)v4, type metadata accessor for IntegrationRecurrence);
  }
  uint64_t v19 = (uint64_t *)(v1 + v8[13]);
  uint64_t v20 = v19[1];
  if (v20)
  {
    uint64_t v22 = v19[4];
    unint64_t v21 = v19[5];
    uint64_t v24 = v19[2];
    uint64_t v23 = v19[3];
    uint64_t v25 = *v19;
    sub_2496D82F8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2496BBA60(v22, v21);
    sub_2496D7E48();
    sub_2496D7E48();
    sub_2496D7B58();
    sub_2496C5B6C(v25, v20, v24, v23, v22, v21);
  }
  else
  {
    sub_2496D82F8();
  }
  if (*(void *)(v1 + v8[14] + 8))
  {
    sub_2496D82F8();
    swift_bridgeObjectRetain();
    sub_2496D7E48();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2496D82F8();
  }
  if (!*(void *)(v1 + v8[15] + 8)) {
    return sub_2496D82F8();
  }
  sub_2496D82F8();
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  return swift_bridgeObjectRelease();
}

uint64_t IntegrationEntry.hashValue.getter()
{
  return sub_2496C9608((void (*)(unsigned char *))IntegrationEntry.hash(into:));
}

uint64_t sub_2496C7E54()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2496C7E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_2496D7BA8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_2496C7EF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_2496D7BA8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_2496C7F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2496CBA9C(v2 + *(int *)(a1 + 28), a2, &qword_26B1605E8);
}

uint64_t sub_2496C7F90(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2496C7FC8(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_2496C7FD4(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 40));
}

uint64_t sub_2496C7FE0(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 44));
}

uint64_t sub_2496C7FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2496CBA9C(v2 + *(int *)(a1 + 48), a2, &qword_26B160628);
}

void sub_2496C8018(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(v2 + *(int *)(a1 + 52));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  unint64_t v9 = v3[5];
  *a2 = *v3;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  a2[5] = v9;
  sub_2496C73CC(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2496C803C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2496C8074(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2496C80AC(uint64_t a1, uint64_t a2)
{
  return sub_2496C9668(a1, a2, (void (*)(unsigned char *))IntegrationEntry.hash(into:));
}

uint64_t sub_2496C80C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2496C96CC(a1, a2, a3, (void (*)(unsigned char *))IntegrationEntry.hash(into:));
}

void IntegrationRecurrence.frequency.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *IntegrationRecurrence.frequency.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*IntegrationRecurrence.frequency.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.interval.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t IntegrationRecurrence.interval.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*IntegrationRecurrence.interval.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.recurrenceEnd.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for IntegrationRecurrence(0);
  return sub_2496CBA9C(v1 + *(int *)(v3 + 24), a1, &qword_26B160608);
}

uint64_t IntegrationRecurrence.recurrenceEnd.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for IntegrationRecurrence(0);
  return sub_2496C5BCC(a1, v1 + *(int *)(v3 + 24), &qword_26B160608);
}

uint64_t (*IntegrationRecurrence.recurrenceEnd.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.firstDayOfTheWeek.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for IntegrationRecurrence(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t IntegrationRecurrence.firstDayOfTheWeek.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for IntegrationRecurrence(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*IntegrationRecurrence.firstDayOfTheWeek.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.daysOfTheWeek.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.daysOfTheWeek.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.daysOfTheWeek.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.daysOfTheMonth.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.daysOfTheMonth.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.daysOfTheMonth.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.daysOfTheYear.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.daysOfTheYear.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.daysOfTheYear.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.weeksOfTheYear.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.weeksOfTheYear.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.weeksOfTheYear.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.monthsOfTheYear.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.monthsOfTheYear.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 48);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.monthsOfTheYear.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.setPositions.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.setPositions.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 52);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.setPositions.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.RecurrenceEnd.hash(into:)()
{
  uint64_t v1 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496CBB00(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2496D82E8();
    return sub_2496D82E8();
  }
  else
  {
    uint64_t v5 = sub_2496D7BA8();
    uint64_t v6 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v5);
    uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v3, v5);
    sub_2496D82E8();
    sub_2496D03AC(&qword_2696CAB40, MEMORY[0x270FA92D0]);
    sub_2496D7E08();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t IntegrationRecurrence.RecurrenceEnd.hashValue.getter()
{
  uint64_t v1 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D82D8();
  sub_2496CBB00(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2496D82E8();
    sub_2496D82E8();
  }
  else
  {
    uint64_t v4 = sub_2496D7BA8();
    uint64_t v5 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v4);
    uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_2496D82E8();
    sub_2496D03AC(&qword_2696CAB40, MEMORY[0x270FA92D0]);
    sub_2496D7E08();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return sub_2496D8308();
}

uint64_t sub_2496C8AA0(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496CBB00(v3, (uint64_t)v2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2496D82E8();
    return sub_2496D82E8();
  }
  else
  {
    uint64_t v5 = sub_2496D7BA8();
    uint64_t v6 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v5);
    uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v2, v5);
    sub_2496D82E8();
    sub_2496D03AC(&qword_2696CAB40, MEMORY[0x270FA92D0]);
    sub_2496D7E08();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_2496C8C44(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D82D8();
  sub_2496CBB00(v1, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2496D82E8();
    sub_2496D82E8();
  }
  else
  {
    uint64_t v4 = sub_2496D7BA8();
    uint64_t v5 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v4);
    uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_2496D82E8();
    sub_2496D03AC(&qword_2696CAB40, MEMORY[0x270FA92D0]);
    sub_2496D7E08();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return sub_2496D8308();
}

BOOL static IntegrationRecurrence.Weekday.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t IntegrationRecurrence.Weekday.hash(into:)()
{
  return sub_2496D82E8();
}

BOOL sub_2496C8E50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void IntegrationRecurrence.DayOfTheWeek.dayOfTheWeek.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *IntegrationRecurrence.DayOfTheWeek.dayOfTheWeek.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*IntegrationRecurrence.DayOfTheWeek.dayOfTheWeek.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.DayOfTheWeek.weekNumber.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t IntegrationRecurrence.DayOfTheWeek.weekNumber.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*IntegrationRecurrence.DayOfTheWeek.weekNumber.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.DayOfTheWeek.hash(into:)()
{
  return sub_2496D82E8();
}

BOOL static IntegrationRecurrence.DayOfTheWeek.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
}

uint64_t IntegrationRecurrence.DayOfTheWeek.hashValue.getter()
{
  return sub_2496D8308();
}

uint64_t sub_2496C8F98()
{
  return sub_2496D8308();
}

uint64_t sub_2496C8FF8()
{
  return sub_2496D82E8();
}

uint64_t sub_2496C9038()
{
  return sub_2496D8308();
}

BOOL sub_2496C9094(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
}

uint64_t IntegrationRecurrence.hash(into:)()
{
  uint64_t v1 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v35 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496D82E8();
  sub_2496D82E8();
  uint64_t v11 = (int *)type metadata accessor for IntegrationRecurrence(0);
  sub_2496CBA9C(v0 + v11[6], (uint64_t)v10, &qword_26B160608);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v10, 1, v1) == 1)
  {
    sub_2496D82F8();
  }
  else
  {
    sub_2496CBB64((uint64_t)v10, (uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    sub_2496D82F8();
    sub_2496CBB00((uint64_t)v7, (uint64_t)v5);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_2496D82E8();
      sub_2496D82E8();
    }
    else
    {
      uint64_t v12 = sub_2496D7BA8();
      uint64_t v13 = *(void *)(v12 - 8);
      MEMORY[0x270FA5388](v12);
      uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v5, v12);
      sub_2496D82E8();
      sub_2496D03AC(&qword_2696CAB40, MEMORY[0x270FA92D0]);
      sub_2496D7E08();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
    sub_2496CBBCC((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  }
  if (*(unsigned char *)(v0 + v11[7]) == 7)
  {
    sub_2496D82F8();
  }
  else
  {
    sub_2496D82F8();
    sub_2496D82E8();
  }
  uint64_t v16 = *(void *)(v0 + v11[8]);
  if (v16)
  {
    sub_2496D82F8();
    sub_2496D82E8();
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      uint64_t v18 = v16 + 40;
      do
      {
        v18 += 16;
        sub_2496D82E8();
        sub_2496D82E8();
        --v17;
      }
      while (v17);
    }
  }
  else
  {
    sub_2496D82F8();
  }
  uint64_t v19 = *(void *)(v0 + v11[9]);
  if (v19)
  {
    sub_2496D82F8();
    sub_2496D82E8();
    uint64_t v20 = *(void *)(v19 + 16);
    if (v20)
    {
      uint64_t v21 = v19 + 32;
      do
      {
        v21 += 8;
        sub_2496D82E8();
        --v20;
      }
      while (v20);
    }
  }
  else
  {
    sub_2496D82F8();
  }
  uint64_t v22 = *(void *)(v0 + v11[10]);
  if (v22)
  {
    sub_2496D82F8();
    sub_2496D82E8();
    uint64_t v23 = *(void *)(v22 + 16);
    if (v23)
    {
      uint64_t v24 = v22 + 32;
      do
      {
        v24 += 8;
        sub_2496D82E8();
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    sub_2496D82F8();
  }
  uint64_t v25 = *(void *)(v0 + v11[11]);
  if (v25)
  {
    sub_2496D82F8();
    sub_2496D82E8();
    uint64_t v26 = *(void *)(v25 + 16);
    if (v26)
    {
      uint64_t v27 = v25 + 32;
      do
      {
        v27 += 8;
        sub_2496D82E8();
        --v26;
      }
      while (v26);
    }
  }
  else
  {
    sub_2496D82F8();
  }
  uint64_t v28 = *(void *)(v0 + v11[12]);
  if (v28)
  {
    sub_2496D82F8();
    sub_2496D82E8();
    uint64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
      uint64_t v30 = v28 + 32;
      do
      {
        v30 += 8;
        sub_2496D82E8();
        --v29;
      }
      while (v29);
    }
  }
  else
  {
    sub_2496D82F8();
  }
  uint64_t v31 = *(void *)(v0 + v11[13]);
  if (!v31) {
    return sub_2496D82F8();
  }
  sub_2496D82F8();
  uint64_t result = sub_2496D82E8();
  uint64_t v33 = *(void *)(v31 + 16);
  if (v33)
  {
    uint64_t v34 = v31 + 32;
    do
    {
      v34 += 8;
      uint64_t result = sub_2496D82E8();
      --v33;
    }
    while (v33);
  }
  return result;
}

uint64_t IntegrationRecurrence.hashValue.getter()
{
  return sub_2496C9608((void (*)(unsigned char *))IntegrationRecurrence.hash(into:));
}

uint64_t sub_2496C9608(void (*a1)(unsigned char *))
{
  sub_2496D82D8();
  a1(v3);
  return sub_2496D8308();
}

uint64_t sub_2496C9650(uint64_t a1, uint64_t a2)
{
  return sub_2496C9668(a1, a2, (void (*)(unsigned char *))IntegrationRecurrence.hash(into:));
}

uint64_t sub_2496C9668(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *))
{
  sub_2496D82D8();
  a3(v5);
  return sub_2496D8308();
}

uint64_t sub_2496C96B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2496C96CC(a1, a2, a3, (void (*)(unsigned char *))IntegrationRecurrence.hash(into:));
}

uint64_t sub_2496C96CC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *))
{
  sub_2496D82D8();
  a4(v6);
  return sub_2496D8308();
}

uint64_t IntegrationColor.Identifier.providerIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationColor.Identifier.providerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntegrationColor.Identifier.providerIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.Identifier.colorIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationColor.Identifier.colorIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*IntegrationColor.Identifier.colorIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.Identifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  return swift_bridgeObjectRelease();
}

uint64_t IntegrationColor.Identifier.hashValue.getter()
{
  return sub_2496D8308();
}

uint64_t sub_2496C9914()
{
  return sub_2496D8308();
}

uint64_t sub_2496C997C()
{
  sub_2496D7E48();
  return sub_2496D7E48();
}

uint64_t sub_2496C99CC()
{
  return sub_2496D8308();
}

uint64_t IntegrationColor.identifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 IntegrationColor.identifier.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = v5;
  *uint64_t v1 = v5;
  v1[1].n128_u64[0] = v2;
  v1[1].n128_u64[1] = v3;
  return result;
}

uint64_t (*IntegrationColor.identifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2496BBA60(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t IntegrationColor.data.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2496C5970(*(void *)(v2 + 32), *(void *)(v2 + 40));
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*IntegrationColor.data.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.hash(into:)()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2496D7E48();
  sub_2496D7E48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2496BBA60(v2, v1);
  sub_2496D7B58();
  return sub_2496C5970(v2, v1);
}

uint64_t IntegrationColor.hashValue.getter()
{
  return sub_2496D8308();
}

uint64_t sub_2496C9CBC()
{
  return sub_2496D8308();
}

uint64_t sub_2496C9D40()
{
  return sub_2496D7B58();
}

uint64_t sub_2496C9DA0()
{
  return sub_2496D8308();
}

BOOL sub_2496C9E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = v2 - 1;
  uint64_t v4 = (void *)(a2 + 40);
  __n128 v5 = (void *)(a1 + 40);
  do
  {
    BOOL result = *((unsigned __int8 *)v5 - 8) == *((unsigned __int8 *)v4 - 8) && *v5 == *v4;
    BOOL v9 = v3-- != 0;
    if (!result) {
      break;
    }
    v4 += 2;
    v5 += 2;
  }
  while (v9);
  return result;
}

BOOL sub_2496C9E98(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  __n128 v5 = a1 + 5;
  uint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_2496C9F0C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
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
      sub_2496BBA60(a2, a3);
      uint64_t v10 = (char *)sub_2496D79F8();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_2496D7A18();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_2496D7A08();
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
        JUMPOUT(0x2496CA170);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_2496C5970(a2, a3);
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
      uint64_t v17 = (char *)sub_2496D79F8();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_2496D7A18();
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
      uint64_t v21 = sub_2496D7A08();
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

uint64_t sub_2496CA180(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_2496BBA60(a1, a2);
      char v5 = sub_2496CABBC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_2496C5970(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_2496CABBC(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_2496C5970(a3, a4);
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
      sub_2496C9F0C((uint64_t)__s1, a3, a4, &v14);
      sub_2496C5970(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t _s26CalendarIntegrationSupport0B10RecurrenceV0D3EndO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAB90);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  size_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = &v13[*(int *)(v11 + 56)];
  sub_2496CBB00(a1, (uint64_t)v13);
  sub_2496CBB00(a2, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2496CBB00((uint64_t)v13, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      char v15 = *v7 == *(void *)v14;
LABEL_8:
      sub_2496CBBCC((uint64_t)v13, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      return v15 & 1;
    }
  }
  else
  {
    sub_2496CBB00((uint64_t)v13, (uint64_t)v9);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v17 = sub_2496D7BA8();
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v17 - 8);
    if (EnumCaseMultiPayload != 1)
    {
      MEMORY[0x270FA5388](v17);
      uint64_t v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v14, v18);
      char v15 = sub_2496D7B88();
      size_t v22 = *(void (**)(char *, uint64_t))(v19 + 8);
      v22(v21, v18);
      v22(v9, v18);
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v9, v17);
  }
  sub_2496C5A30((uint64_t)v13, &qword_2696CAB90);
  char v15 = 0;
  return v15 & 1;
}

uint64_t _s26CalendarIntegrationSupport0B10RecurrenceV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAB88);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  char v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v53 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v53 - v18;
  if (*a1 != *a2 || *((void *)a1 + 1) != *((void *)a2 + 1)) {
    return 0;
  }
  id v53 = v7;
  uint64_t v20 = v5;
  uint64_t v21 = type metadata accessor for IntegrationRecurrence(0);
  uint64_t v22 = *(int *)(v21 + 24);
  uint64_t v55 = a1;
  sub_2496CBA9C((uint64_t)&a1[v22], (uint64_t)v19, &qword_26B160608);
  uint64_t v54 = (int *)v21;
  uint64_t v23 = *(int *)(v21 + 24);
  uint64_t v56 = a2;
  sub_2496CBA9C((uint64_t)&a2[v23], (uint64_t)v17, &qword_26B160608);
  uint64_t v24 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_2496CBA9C((uint64_t)v19, (uint64_t)v10, &qword_26B160608);
  sub_2496CBA9C((uint64_t)v17, v24, &qword_26B160608);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48);
  if (v25((uint64_t)v10, 1, v4) == 1)
  {
    sub_2496C5A30((uint64_t)v17, &qword_26B160608);
    sub_2496C5A30((uint64_t)v19, &qword_26B160608);
    if (v25(v24, 1, v4) == 1)
    {
      sub_2496C5A30((uint64_t)v10, &qword_26B160608);
      goto LABEL_12;
    }
LABEL_8:
    sub_2496C5A30((uint64_t)v10, &qword_2696CAB88);
    return 0;
  }
  sub_2496CBA9C((uint64_t)v10, (uint64_t)v14, &qword_26B160608);
  if (v25(v24, 1, v4) == 1)
  {
    sub_2496C5A30((uint64_t)v17, &qword_26B160608);
    sub_2496C5A30((uint64_t)v19, &qword_26B160608);
    sub_2496CBBCC((uint64_t)v14, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    goto LABEL_8;
  }
  uint64_t v27 = (uint64_t)v53;
  sub_2496CBB64(v24, (uint64_t)v53, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  char v28 = _s26CalendarIntegrationSupport0B10RecurrenceV0D3EndO2eeoiySbAE_AEtFZ_0((uint64_t)v14, v27);
  sub_2496CBBCC(v27, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  sub_2496C5A30((uint64_t)v17, &qword_26B160608);
  sub_2496C5A30((uint64_t)v19, &qword_26B160608);
  sub_2496CBBCC((uint64_t)v14, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  sub_2496C5A30((uint64_t)v10, &qword_26B160608);
  if ((v28 & 1) == 0) {
    return 0;
  }
LABEL_12:
  char v30 = v54;
  char v29 = v55;
  uint64_t v31 = v54[7];
  int v32 = v55[v31];
  uint64_t v33 = v56;
  int v34 = v56[v31];
  if (v32 == 7)
  {
    if (v34 != 7) {
      return 0;
    }
    goto LABEL_17;
  }
  uint64_t result = 0;
  if (v34 != 7 && v32 == v34)
  {
LABEL_17:
    uint64_t v35 = v54[8];
    uint64_t v36 = *(void *)&v55[v35];
    uint64_t v37 = *(void *)&v56[v35];
    if (v36)
    {
      if (!v37 || !sub_2496C9E24(v36, v37)) {
        return 0;
      }
    }
    else if (v37)
    {
      return 0;
    }
    uint64_t v38 = v30[9];
    long long v39 = *(void **)&v29[v38];
    long long v40 = *(void **)&v33[v38];
    if (v39)
    {
      if (!v40 || !sub_2496C9E98(v39, v40)) {
        return 0;
      }
    }
    else if (v40)
    {
      return 0;
    }
    uint64_t v41 = v30[10];
    uint64_t v42 = *(void **)&v29[v41];
    uint64_t v43 = *(void **)&v33[v41];
    if (v42)
    {
      if (!v43 || !sub_2496C9E98(v42, v43)) {
        return 0;
      }
    }
    else if (v43)
    {
      return 0;
    }
    uint64_t v44 = v30[11];
    uint64_t v45 = *(void **)&v29[v44];
    uint64_t v46 = *(void **)&v33[v44];
    if (v45)
    {
      if (!v46 || !sub_2496C9E98(v45, v46)) {
        return 0;
      }
    }
    else if (v46)
    {
      return 0;
    }
    uint64_t v47 = v30[12];
    id v48 = *(void **)&v29[v47];
    uint64_t v49 = *(void **)&v33[v47];
    if (v48)
    {
      if (v49 && sub_2496C9E98(v48, v49))
      {
LABEL_42:
        uint64_t v50 = v30[13];
        uint64_t v51 = *(void **)&v29[v50];
        uint64_t v52 = *(void **)&v33[v50];
        if (v51)
        {
          if (v52 && sub_2496C9E98(v51, v52)) {
            return 1;
          }
        }
        else if (!v52)
        {
          return 1;
        }
      }
    }
    else if (!v49)
    {
      goto LABEL_42;
    }
    return 0;
  }
  return result;
}

uint64_t _s26CalendarIntegrationSupport0B5ColorV10IdentifierV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_2496D8258(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_2496D8258();
    }
  }
  return result;
}

uint64_t sub_2496CABBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2496D79F8();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_2496D7A18();
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
  sub_2496D7A08();
  sub_2496C9F0C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_2496CAC74(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x2496CADB0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_2496BBA60(a3, a4);
              char v15 = sub_2496CA180(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s26CalendarIntegrationSupport0B5ColorV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  unint64_t v5 = a1[5];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  if ((*a1 != *a2 || a1[1] != a2[1]) && (sub_2496D8258() & 1) == 0
    || (v2 != v6 || v4 != v7) && (sub_2496D8258() & 1) == 0)
  {
    return 0;
  }
  return sub_2496CAC74(v3, v5, v8, v9);
}

BOOL _s26CalendarIntegrationSupport0B5EntryV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for IntegrationRecurrence(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (unsigned __int8 *)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAB98);
  MEMORY[0x270FA5388](v129);
  unint64_t v9 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (unsigned __int8 *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  unint64_t v130 = (unint64_t)&v116 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v131 = (uint64_t)&v116 - v16;
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v17 = sub_2496D8258();
    BOOL result = 0;
    if ((v17 & 1) == 0) {
      return result;
    }
  }
  unint64_t v128 = v13;
  uint64_t v19 = type metadata accessor for IntegrationEntry(0);
  if ((sub_2496D7B88() & 1) == 0 || (sub_2496D7B88() & 1) == 0) {
    return 0;
  }
  uint64_t v118 = v7;
  uint64_t v119 = v5;
  uint64_t v120 = v4;
  int64_t v121 = v9;
  uint64_t v20 = (uint64_t)a1 + *(int *)(v19 + 28);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
  id v126 = &v116;
  uint64_t v22 = *(void *)(*(void *)(v21 - 8) + 64);
  MEMORY[0x270FA5388](v21 - 8);
  unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2496CBA9C(v20, (uint64_t)&v116 - v23, &qword_26B1605E8);
  uint64_t v125 = &v116;
  long long v122 = (int *)v19;
  uint64_t v25 = MEMORY[0x270FA5388]((char *)a2 + *(int *)(v19 + 28));
  long long v123 = (char *)v23;
  __int16 v26 = (char *)&v116 - v23;
  uint64_t v24 = (uint64_t)v26;
  sub_2496CBA9C(v25, (uint64_t)v26, &qword_26B1605E8);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CABA0);
  uint64_t v124 = &v116;
  uint64_t v28 = MEMORY[0x270FA5388](v27 - 8);
  char v30 = (char *)&v116 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = (uint64_t)&v30[*(int *)(v28 + 56)];
  sub_2496CBA9C((uint64_t)v26, (uint64_t)v30, &qword_26B1605E8);
  uint64_t v127 = (char *)v31;
  sub_2496CBA9C((uint64_t)v26, v31, &qword_26B1605E8);
  uint64_t v32 = sub_2496D7C38();
  uint64_t v33 = *(void *)(v32 - 8);
  int v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  uint64_t v35 = v34(v30, 1, v32);
  if (v35 == 1)
  {
    sub_2496C5A30((uint64_t)v26, &qword_26B1605E8);
    sub_2496C5A30((uint64_t)v26, &qword_26B1605E8);
    if (v34(v127, 1, v32) == 1)
    {
      sub_2496C5A30((uint64_t)v30, &qword_26B1605E8);
      goto LABEL_13;
    }
LABEL_11:
    sub_2496C5A30((uint64_t)v30, &qword_2696CABA0);
    return 0;
  }
  uint64_t v117 = v26;
  MEMORY[0x270FA5388](v35);
  uint64_t v36 = (char *)((char *)&v116 - v123);
  sub_2496CBA9C((uint64_t)v30, (char *)&v116 - v123, &qword_26B1605E8);
  uint64_t v37 = v34(v127, 1, v32);
  if (v37 == 1)
  {
    sub_2496C5A30((uint64_t)v117, &qword_26B1605E8);
    sub_2496C5A30((uint64_t)v26, &qword_26B1605E8);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
    goto LABEL_11;
  }
  long long v123 = (char *)&v116;
  uint64_t v116 = (uint64_t)&v116;
  MEMORY[0x270FA5388](v37);
  long long v39 = v36;
  long long v40 = (char *)&v116 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v40, v127, v32);
  sub_2496D03AC(&qword_2696CABA8, MEMORY[0x270FA99E0]);
  char v41 = sub_2496D7E18();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v33 + 8);
  v42(v40, v32);
  sub_2496C5A30((uint64_t)v117, &qword_26B1605E8);
  sub_2496C5A30(v24, &qword_26B1605E8);
  v42(v39, v32);
  sub_2496C5A30((uint64_t)v30, &qword_26B1605E8);
  if ((v41 & 1) == 0) {
    return 0;
  }
LABEL_13:
  uint64_t v44 = (uint64_t)v121;
  uint64_t v43 = v122;
  uint64_t v45 = v122[8];
  uint64_t v46 = *(void *)((char *)a1 + v45);
  uint64_t v47 = *(void *)((char *)a1 + v45 + 8);
  id v48 = (void *)((char *)a2 + v45);
  uint64_t v50 = v119;
  uint64_t v49 = v120;
  uint64_t v51 = v118;
  if (v46 != *v48 || v47 != v48[1])
  {
    char v52 = sub_2496D8258();
    BOOL result = 0;
    if ((v52 & 1) == 0) {
      return result;
    }
  }
  if (*((unsigned __int8 *)a1 + v43[9]) != *((unsigned __int8 *)a2 + v43[9])
    || *((unsigned __int8 *)a1 + v43[10]) != *((unsigned __int8 *)a2 + v43[10])
    || *(void *)((char *)a1 + v43[11]) != *(void *)((char *)a2 + v43[11]))
  {
    return 0;
  }
  uint64_t v53 = v131;
  sub_2496CBA9C((uint64_t)a1 + v43[12], v131, &qword_26B160628);
  uint64_t v54 = v130;
  sub_2496CBA9C((uint64_t)a2 + v43[12], v130, &qword_26B160628);
  uint64_t v55 = v44 + *(int *)(v129 + 48);
  sub_2496CBA9C(v53, v44, &qword_26B160628);
  uint64_t v129 = v55;
  sub_2496CBA9C(v54, v55, &qword_26B160628);
  uint64_t v56 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
  if (v56(v44, 1, v49) == 1)
  {
    sub_2496C5A30(v54, &qword_26B160628);
    sub_2496C5A30(v131, &qword_26B160628);
    if (v56(v129, 1, v49) == 1)
    {
      sub_2496C5A30(v44, &qword_26B160628);
      goto LABEL_26;
    }
LABEL_24:
    sub_2496C5A30(v44, &qword_2696CAB98);
    return 0;
  }
  uint64_t v57 = v128;
  sub_2496CBA9C(v44, (uint64_t)v128, &qword_26B160628);
  uint64_t v58 = v129;
  if (v56(v129, 1, v49) == 1)
  {
    sub_2496C5A30(v130, &qword_26B160628);
    sub_2496C5A30(v131, &qword_26B160628);
    sub_2496CBBCC((uint64_t)v57, type metadata accessor for IntegrationRecurrence);
    goto LABEL_24;
  }
  sub_2496CBB64(v58, (uint64_t)v51, type metadata accessor for IntegrationRecurrence);
  char v59 = _s26CalendarIntegrationSupport0B10RecurrenceV2eeoiySbAC_ACtFZ_0(v57, v51);
  sub_2496CBBCC((uint64_t)v51, type metadata accessor for IntegrationRecurrence);
  sub_2496C5A30(v130, &qword_26B160628);
  sub_2496C5A30(v131, &qword_26B160628);
  sub_2496CBBCC((uint64_t)v57, type metadata accessor for IntegrationRecurrence);
  sub_2496C5A30(v44, &qword_26B160628);
  if ((v59 & 1) == 0) {
    return 0;
  }
LABEL_26:
  uint64_t v60 = v43[13];
  uint64_t v61 = *(void *)((char *)a1 + v60);
  uint64_t v62 = *(void *)((char *)a1 + v60 + 8);
  uint64_t v63 = *(void *)((char *)a1 + v60 + 16);
  uint64_t v64 = *(void *)((char *)a1 + v60 + 24);
  uint64_t v65 = *(void *)((char *)a1 + v60 + 32);
  unint64_t v130 = *(void *)((char *)a1 + v60 + 40);
  uint64_t v131 = v63;
  uint64_t v66 = (void *)((char *)a2 + v60);
  uint64_t v67 = *v66;
  uint64_t v68 = v66[1];
  uint64_t v69 = v66[2];
  uint64_t v70 = v66[3];
  uint64_t v72 = v66[4];
  unint64_t v71 = v66[5];
  if (v62)
  {
    uint64_t v127 = (char *)v66[5];
    unint64_t v128 = (unsigned __int8 *)v72;
    if (v68)
    {
      if (v61 == v67 && v62 == v68
        || (uint64_t v73 = v69,
            id v126 = (uint64_t *)v70,
            uint64_t v74 = v61,
            char v75 = sub_2496D8258(),
            uint64_t v69 = v73,
            uint64_t v61 = v74,
            uint64_t v70 = (uint64_t)v126,
            (v75 & 1) != 0))
      {
        if (v131 == v69 && v64 == v70
          || (uint64_t v76 = v69,
              id v126 = (uint64_t *)v70,
              uint64_t v77 = v61,
              char v78 = sub_2496D8258(),
              uint64_t v69 = v76,
              uint64_t v61 = v77,
              uint64_t v70 = (uint64_t)v126,
              (v78 & 1) != 0))
        {
          uint64_t v125 = (uint64_t *)v69;
          uint64_t v79 = v131;
          uint64_t v80 = v65;
          uint64_t v81 = v65;
          uint64_t v82 = v61;
          uint64_t v129 = v61;
          sub_2496C73CC(v61, v62, v131, v64, v81, v130);
          uint64_t v83 = v82;
          uint64_t v84 = v80;
          uint64_t v85 = v67;
          uint64_t v124 = (uint64_t *)v67;
          uint64_t v86 = v80;
          unint64_t v87 = v130;
          sub_2496C73CC(v83, v62, v79, v64, v84, v130);
          uint64_t v88 = v85;
          unint64_t v89 = (unint64_t)v127;
          uint64_t v90 = (uint64_t)v128;
          sub_2496C73CC(v88, v68, (uint64_t)v125, v70, (uint64_t)v128, (unint64_t)v127);
          LODWORD(v126) = sub_2496CAC74(v86, v87, v90, v89);
          sub_2496C5B6C((uint64_t)v124, v68, (uint64_t)v125, v70, v90, v89);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2496C5970(v86, v87);
          sub_2496C5B6C(v129, v62, v131, v64, v86, v87);
          if ((v126 & 1) == 0) {
            return 0;
          }
          goto LABEL_37;
        }
      }
      uint64_t v107 = v61;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v108 = v65;
      uint64_t v109 = v65;
      unint64_t v110 = v130;
      sub_2496BBA60(v109, v130);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496BBA60(v108, v110);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2496C5970(v108, v110);
      uint64_t v101 = v107;
      uint64_t v102 = v62;
      uint64_t v103 = v131;
      uint64_t v104 = v64;
      uint64_t v105 = v108;
      unint64_t v106 = v110;
LABEL_46:
      sub_2496C5B6C(v101, v102, v103, v104, v105, v106);
      return 0;
    }
    uint64_t v129 = v61;
    uint64_t v98 = v69;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v99 = v130;
    sub_2496BBA60(v65, v130);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2496BBA60(v65, v99);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2496C5970(v65, v99);
    uint64_t v69 = v98;
    unint64_t v71 = (unint64_t)v127;
    uint64_t v72 = (uint64_t)v128;
LABEL_44:
    uint64_t v100 = v69;
    sub_2496C73CC(v67, v68, v69, v70, v72, v71);
    sub_2496C5B6C(v129, v62, v131, v64, v65, v130);
    uint64_t v101 = v67;
    uint64_t v102 = v68;
    uint64_t v103 = v100;
    uint64_t v104 = v70;
    uint64_t v105 = v72;
    unint64_t v106 = v71;
    goto LABEL_46;
  }
  uint64_t v129 = v61;
  if (v68) {
    goto LABEL_44;
  }
LABEL_37:
  uint64_t v91 = v122;
  uint64_t v92 = v122[14];
  long long v93 = (void *)((char *)a1 + v92);
  uint64_t v94 = *(void *)((char *)a1 + v92 + 8);
  uint64_t v95 = (void *)((char *)a2 + v92);
  uint64_t v96 = v95[1];
  if (!v94)
  {
    if (v96) {
      return 0;
    }
LABEL_50:
    uint64_t v111 = v91[15];
    uint64_t v112 = (void *)((char *)a1 + v111);
    uint64_t v113 = *(void *)((char *)a1 + v111 + 8);
    v114 = (void *)((char *)a2 + v111);
    uint64_t v115 = v114[1];
    if (v113) {
      return v115 && (*v112 == *v114 && v113 == v115 || (sub_2496D8258() & 1) != 0);
    }
    return !v115;
  }
  if (!v96) {
    return 0;
  }
  if (*v93 == *v95 && v94 == v96) {
    goto LABEL_50;
  }
  char v97 = sub_2496D8258();
  BOOL result = 0;
  if (v97) {
    goto LABEL_50;
  }
  return result;
}

uint64_t sub_2496CBA9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2496CBB00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2496CBB64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2496CBBCC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2496CBC2C()
{
  return sub_2496CBCBC(&qword_2696CAB50, (void (*)(uint64_t))type metadata accessor for IntegrationEntry);
}

uint64_t sub_2496CBC74()
{
  return sub_2496CBCBC(&qword_2696CAB58, (void (*)(uint64_t))type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
}

uint64_t sub_2496CBCBC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2496CBD08()
{
  unint64_t result = qword_2696CAB60;
  if (!qword_2696CAB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB60);
  }
  return result;
}

unint64_t sub_2496CBD60()
{
  unint64_t result = qword_2696CAB68;
  if (!qword_2696CAB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB68);
  }
  return result;
}

unint64_t sub_2496CBDB8()
{
  unint64_t result = qword_2696CAB70;
  if (!qword_2696CAB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB70);
  }
  return result;
}

uint64_t sub_2496CBE0C()
{
  return sub_2496CBCBC(&qword_2696CAB78, (void (*)(uint64_t))type metadata accessor for IntegrationRecurrence);
}

unint64_t sub_2496CBE58()
{
  unint64_t result = qword_26B160638;
  if (!qword_26B160638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B160638);
  }
  return result;
}

unint64_t sub_2496CBEB0()
{
  unint64_t result = qword_2696CAB80;
  if (!qword_2696CAB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CAB80);
  }
  return result;
}

uint64_t dispatch thunk of IntegrationEntryProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.startDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.endDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.timeZone.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.allDay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.completed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.priority.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.recurrence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.color.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.personaIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.externalIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

char *initializeBufferWithCopyOfBuffer for IntegrationEntry(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = a3[5];
    unint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_2496D7BA8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = &v4[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v16 = sub_2496D7C38();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v58 = v12;
    uint64_t v57 = v11;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    uint64_t v22 = &v4[v20];
    unint64_t v23 = &a2[v20];
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)uint64_t v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    v4[v21] = a2[v21];
    uint64_t v25 = a3[11];
    v4[a3[10]] = a2[a3[10]];
    *(void *)&v4[v25] = *(void *)&a2[v25];
    uint64_t v26 = a3[12];
    uint64_t v27 = &v4[v26];
    uint64_t v28 = &a2[v26];
    uint64_t v29 = (int *)type metadata accessor for IntegrationRecurrence(0);
    uint64_t v30 = *((void *)v29 - 1);
    uint64_t v31 = *(unsigned int (**)(char *, uint64_t, int *))(v30 + 48);
    swift_bridgeObjectRetain();
    if (v31(v28, 1, v29))
    {
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
      memcpy(v27, v28, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      uint64_t v56 = v30;
      *uint64_t v27 = *v28;
      *((void *)v27 + 1) = *((void *)v28 + 1);
      uint64_t v33 = v29[6];
      int v34 = &v27[v33];
      uint64_t v35 = &v28[v33];
      uint64_t v36 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
      uint64_t v37 = *(void *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
        memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload())
        {
          memcpy(v34, v35, *(void *)(v37 + 64));
        }
        else
        {
          v58(v34, v35, v57);
          swift_storeEnumTagMultiPayload();
        }
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      v27[v29[7]] = v28[v29[7]];
      *(void *)&v27[v29[8]] = *(void *)&v28[v29[8]];
      *(void *)&v27[v29[9]] = *(void *)&v28[v29[9]];
      *(void *)&v27[v29[10]] = *(void *)&v28[v29[10]];
      *(void *)&v27[v29[11]] = *(void *)&v28[v29[11]];
      *(void *)&v27[v29[12]] = *(void *)&v28[v29[12]];
      *(void *)&v27[v29[13]] = *(void *)&v28[v29[13]];
      char v59 = *(void (**)(char *, void, uint64_t, int *))(v56 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v59(v27, 0, 1, v29);
    }
    uint64_t v39 = a3[13];
    long long v40 = &v4[v39];
    char v41 = &a2[v39];
    uint64_t v42 = *((void *)v41 + 1);
    if (v42)
    {
      *(void *)long long v40 = *(void *)v41;
      *((void *)v40 + 1) = v42;
      uint64_t v43 = *((void *)v41 + 3);
      *((void *)v40 + 2) = *((void *)v41 + 2);
      *((void *)v40 + 3) = v43;
      uint64_t v44 = *((void *)v41 + 4);
      unint64_t v45 = *((void *)v41 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496BBA60(v44, v45);
      *((void *)v40 + 4) = v44;
      *((void *)v40 + 5) = v45;
    }
    else
    {
      long long v46 = *((_OWORD *)v41 + 1);
      *(_OWORD *)long long v40 = *(_OWORD *)v41;
      *((_OWORD *)v40 + 1) = v46;
      *((_OWORD *)v40 + 2) = *((_OWORD *)v41 + 2);
    }
    uint64_t v47 = a3[14];
    uint64_t v48 = a3[15];
    uint64_t v49 = &v4[v47];
    uint64_t v50 = &a2[v47];
    uint64_t v51 = *((void *)v50 + 1);
    *(void *)uint64_t v49 = *(void *)v50;
    *((void *)v49 + 1) = v51;
    char v52 = &v4[v48];
    uint64_t v53 = &a2[v48];
    uint64_t v54 = *((void *)v53 + 1);
    *(void *)char v52 = *(void *)v53;
    *((void *)v52 + 1) = v54;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for IntegrationEntry(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_2496D7BA8();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_2496D7C38();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = a1 + a2[12];
  uint64_t v11 = type metadata accessor for IntegrationRecurrence(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    uint64_t v12 = v10 + *(int *)(v11 + 24);
    uint64_t v13 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13)
      && !swift_getEnumCaseMultiPayload())
    {
      v6(v12, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = (void *)(a1 + a2[13]);
  if (v14[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2496C5970(v14[4], v14[5]);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for IntegrationEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2496D7BA8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_2496D7C38();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v56 = v11;
  uint64_t v55 = v10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v18];
  uint64_t v21 = &a2[v18];
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  a1[v19] = a2[v19];
  uint64_t v23 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  *(void *)&a1[v23] = *(void *)&a2[v23];
  uint64_t v24 = a3[12];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = (int *)type metadata accessor for IntegrationRecurrence(0);
  uint64_t v28 = *((void *)v27 - 1);
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, int *))(v28 + 48);
  swift_bridgeObjectRetain();
  if (v29(v26, 1, v27))
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
    memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    uint64_t v54 = v28;
    *uint64_t v25 = *v26;
    *((void *)v25 + 1) = *((void *)v26 + 1);
    uint64_t v31 = v27[6];
    uint64_t v32 = &v25[v31];
    uint64_t v33 = &v26[v31];
    uint64_t v34 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
      memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v32, v33, *(void *)(v35 + 64));
      }
      else
      {
        v56(v32, v33, v55);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    v25[v27[7]] = v26[v27[7]];
    *(void *)&v25[v27[8]] = *(void *)&v26[v27[8]];
    *(void *)&v25[v27[9]] = *(void *)&v26[v27[9]];
    *(void *)&v25[v27[10]] = *(void *)&v26[v27[10]];
    *(void *)&v25[v27[11]] = *(void *)&v26[v27[11]];
    *(void *)&v25[v27[12]] = *(void *)&v26[v27[12]];
    *(void *)&v25[v27[13]] = *(void *)&v26[v27[13]];
    uint64_t v57 = *(void (**)(char *, void, uint64_t, int *))(v54 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v57(v25, 0, 1, v27);
  }
  uint64_t v37 = a3[13];
  uint64_t v38 = &a1[v37];
  uint64_t v39 = &a2[v37];
  uint64_t v40 = *((void *)v39 + 1);
  if (v40)
  {
    *(void *)uint64_t v38 = *(void *)v39;
    *((void *)v38 + 1) = v40;
    uint64_t v41 = *((void *)v39 + 3);
    *((void *)v38 + 2) = *((void *)v39 + 2);
    *((void *)v38 + 3) = v41;
    uint64_t v42 = *((void *)v39 + 4);
    unint64_t v43 = *((void *)v39 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2496BBA60(v42, v43);
    *((void *)v38 + 4) = v42;
    *((void *)v38 + 5) = v43;
  }
  else
  {
    long long v44 = *((_OWORD *)v39 + 1);
    *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
    *((_OWORD *)v38 + 1) = v44;
    *((_OWORD *)v38 + 2) = *((_OWORD *)v39 + 2);
  }
  uint64_t v45 = a3[14];
  uint64_t v46 = a3[15];
  uint64_t v47 = &a1[v45];
  uint64_t v48 = &a2[v45];
  uint64_t v49 = *((void *)v48 + 1);
  *(void *)uint64_t v47 = *(void *)v48;
  *((void *)v47 + 1) = v49;
  uint64_t v50 = &a1[v46];
  uint64_t v51 = &a2[v46];
  uint64_t v52 = *((void *)v51 + 1);
  *(void *)uint64_t v50 = *(void *)v51;
  *((void *)v50 + 1) = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for IntegrationEntry(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2496D7BA8();
  uint64_t v73 = *(void *)(v9 - 8);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v73 + 24);
  v10(v7, v8, v9);
  uint64_t v74 = v9;
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_2496D7C38();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v10) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (v10)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[9]] = a2[a3[9]];
  a1[a3[10]] = a2[a3[10]];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  uint64_t v22 = a3[12];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = (int *)type metadata accessor for IntegrationRecurrence(0);
  uint64_t v26 = (void *)*((void *)v25 - 1);
  uint64_t v27 = (uint64_t (*)(char *, uint64_t, int *))v26[6];
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (v29)
    {
      sub_2496CBBCC((uint64_t)v23, type metadata accessor for IntegrationRecurrence);
      goto LABEL_13;
    }
    char *v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v37 = v25[6];
    uint64_t v38 = &v23[v37];
    __srca = &v24[v37];
    uint64_t v39 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    uint64_t v69 = *(void *)(v39 - 8);
    uint64_t v70 = v38;
    uint64_t v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v69 + 48);
    LODWORD(v38) = v40(v38, 1, v39);
    int v41 = v40(__srca, 1, v39);
    if (v38)
    {
      if (!v41)
      {
        if (swift_getEnumCaseMultiPayload())
        {
          uint64_t v46 = v69;
          uint64_t v45 = v70;
          memcpy(v70, __srca, *(void *)(v69 + 64));
        }
        else
        {
          uint64_t v45 = v70;
          (*(void (**)(void *, char *, uint64_t))(v73 + 16))(v70, __srca, v74);
          swift_storeEnumTagMultiPayload();
          uint64_t v46 = v69;
        }
        (*(void (**)(void *, void, uint64_t, uint64_t))(v46 + 56))(v45, 0, 1, v39);
        goto LABEL_34;
      }
      size_t v42 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B160608) - 8) + 64);
      unint64_t v43 = v70;
    }
    else
    {
      if (!v41)
      {
        if (a1 == a2) {
          goto LABEL_34;
        }
        sub_2496CBBCC((uint64_t)v70, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        if (!swift_getEnumCaseMultiPayload())
        {
          (*(void (**)(void *, char *, uint64_t))(v73 + 16))(v70, __srca, v74);
          swift_storeEnumTagMultiPayload();
          goto LABEL_34;
        }
        size_t v42 = *(void *)(v69 + 64);
        unint64_t v43 = v70;
        long long v44 = __srca;
LABEL_23:
        memcpy(v43, v44, v42);
LABEL_34:
        v23[v25[7]] = v24[v25[7]];
        *(void *)&v23[v25[8]] = *(void *)&v24[v25[8]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v23[v25[9]] = *(void *)&v24[v25[9]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v23[v25[10]] = *(void *)&v24[v25[10]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v23[v25[11]] = *(void *)&v24[v25[11]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v23[v25[12]] = *(void *)&v24[v25[12]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v23[v25[13]] = *(void *)&v24[v25[13]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      sub_2496CBBCC((uint64_t)v70, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      size_t v42 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B160608) - 8) + 64);
      unint64_t v43 = v70;
    }
    long long v44 = __srca;
    goto LABEL_23;
  }
  if (v29)
  {
LABEL_13:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
    memcpy(v23, v24, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_35;
  }
  __src = v26;
  char *v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v30 = v25[6];
  uint64_t v31 = &v23[v30];
  uint64_t v32 = &v24[v30];
  uint64_t v33 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v31, v32, *(void *)(v34 + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v31, v32, v74);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  v23[v25[7]] = v24[v25[7]];
  *(void *)&v23[v25[8]] = *(void *)&v24[v25[8]];
  *(void *)&v23[v25[9]] = *(void *)&v24[v25[9]];
  *(void *)&v23[v25[10]] = *(void *)&v24[v25[10]];
  *(void *)&v23[v25[11]] = *(void *)&v24[v25[11]];
  *(void *)&v23[v25[12]] = *(void *)&v24[v25[12]];
  *(void *)&v23[v25[13]] = *(void *)&v24[v25[13]];
  char v75 = (void (*)(char *, void, uint64_t, int *))__src[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v75(v23, 0, 1, v25);
LABEL_35:
  uint64_t v47 = a3[13];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  uint64_t v50 = *(void *)&a1[v47 + 8];
  uint64_t v51 = *(void *)&a2[v47 + 8];
  if (v50)
  {
    if (v51)
    {
      *(void *)uint64_t v48 = *(void *)v49;
      *((void *)v48 + 1) = *((void *)v49 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v48 + 2) = *((void *)v49 + 2);
      *((void *)v48 + 3) = *((void *)v49 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v52 = *((void *)v49 + 4);
      unint64_t v53 = *((void *)v49 + 5);
      sub_2496BBA60(v52, v53);
      uint64_t v54 = *((void *)v48 + 4);
      unint64_t v55 = *((void *)v48 + 5);
      *((void *)v48 + 4) = v52;
      *((void *)v48 + 5) = v53;
      sub_2496C5970(v54, v55);
    }
    else
    {
      sub_2496CD594((uint64_t)v48);
      long long v59 = *((_OWORD *)v49 + 1);
      long long v58 = *((_OWORD *)v49 + 2);
      *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
      *((_OWORD *)v48 + 1) = v59;
      *((_OWORD *)v48 + 2) = v58;
    }
  }
  else if (v51)
  {
    *(void *)uint64_t v48 = *(void *)v49;
    *((void *)v48 + 1) = *((void *)v49 + 1);
    *((void *)v48 + 2) = *((void *)v49 + 2);
    *((void *)v48 + 3) = *((void *)v49 + 3);
    uint64_t v56 = *((void *)v49 + 4);
    unint64_t v57 = *((void *)v49 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2496BBA60(v56, v57);
    *((void *)v48 + 4) = v56;
    *((void *)v48 + 5) = v57;
  }
  else
  {
    long long v60 = *(_OWORD *)v49;
    long long v61 = *((_OWORD *)v49 + 2);
    *((_OWORD *)v48 + 1) = *((_OWORD *)v49 + 1);
    *((_OWORD *)v48 + 2) = v61;
    *(_OWORD *)uint64_t v48 = v60;
  }
  uint64_t v62 = a3[14];
  uint64_t v63 = &a1[v62];
  uint64_t v64 = &a2[v62];
  *(void *)uint64_t v63 = *(void *)v64;
  *((void *)v63 + 1) = *((void *)v64 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v65 = a3[15];
  uint64_t v66 = &a1[v65];
  uint64_t v67 = &a2[v65];
  *(void *)uint64_t v66 = *(void *)v67;
  *((void *)v66 + 1) = *((void *)v67 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2496CD594(uint64_t a1)
{
  return a1;
}

_OWORD *initializeWithTake for IntegrationEntry(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2496D7BA8();
  uint64_t v10 = *(void (**)(void))(*(void *)(v9 - 8) + 32);
  ((void (*)(char *, char *, uint64_t))v10)(v7, v8, v9);
  ((void (*)(char *, char *, uint64_t))v10)((char *)a1 + a3[6], (char *)a2 + a3[6], v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_2496D7C38();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
  uint64_t v18 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = (int *)type metadata accessor for IntegrationRecurrence(0);
  uint64_t v23 = *((void *)v22 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    uint64_t v38 = v10;
    *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
    v20[1] = v21[1];
    uint64_t v25 = v22[6];
    uint64_t v39 = (char *)v20 + v25;
    uint64_t v26 = (char *)v21 + v25;
    uint64_t v27 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v40 = v26;
    int v29 = v26;
    uint64_t v30 = v27;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v29, 1, v27))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
      memcpy(v39, v40, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v39, v40, *(void *)(v28 + 64));
      }
      else
      {
        v38();
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v39, 0, 1, v30);
    }
    *((unsigned char *)v20 + v22[7]) = *((unsigned char *)v21 + v22[7]);
    *(void *)((char *)v20 + v22[8]) = *(void *)((char *)v21 + v22[8]);
    *(void *)((char *)v20 + v22[9]) = *(void *)((char *)v21 + v22[9]);
    *(void *)((char *)v20 + v22[10]) = *(void *)((char *)v21 + v22[10]);
    *(void *)((char *)v20 + v22[11]) = *(void *)((char *)v21 + v22[11]);
    *(void *)((char *)v20 + v22[12]) = *(void *)((char *)v21 + v22[12]);
    *(void *)((char *)v20 + v22[13]) = *(void *)((char *)v21 + v22[13]);
    (*(void (**)(void *, void, uint64_t, int *))(v23 + 56))(v20, 0, 1, v22);
  }
  uint64_t v32 = a3[13];
  uint64_t v33 = a3[14];
  uint64_t v34 = (_OWORD *)((char *)a1 + v32);
  uint64_t v35 = (_OWORD *)((char *)a2 + v32);
  long long v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  v34[2] = v35[2];
  *(_OWORD *)((char *)a1 + v33) = *(_OWORD *)((char *)a2 + v33);
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

char *assignWithTake for IntegrationEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2496D7BA8();
  uint64_t v75 = *(void *)(v10 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v75 + 40);
  v11(v8, v9, v10);
  uint64_t v76 = v10;
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_2496D7C38();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v11) = v17(v13, 1, v15);
  int v18 = v17(v14, 1, v15);
  if (v11)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = (uint64_t *)&a2[v20];
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v25] = a2[v25];
  uint64_t v26 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  int v29 = (int *)type metadata accessor for IntegrationRecurrence(0);
  uint64_t v30 = *((void *)v29 - 1);
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t, int *))(v30 + 48);
  int v32 = v31(v27, 1, v29);
  int v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (v33)
    {
      sub_2496CBBCC((uint64_t)v27, type metadata accessor for IntegrationRecurrence);
      goto LABEL_13;
    }
    *uint64_t v27 = *v28;
    *((void *)v27 + 1) = *((void *)v28 + 1);
    uint64_t v40 = v29[6];
    int v41 = &v27[v40];
    __dsta = &v28[v40];
    uint64_t v42 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    uint64_t v71 = *(void *)(v42 - 8);
    uint64_t v72 = v41;
    unint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
    LODWORD(v41) = v43(v41, 1, v42);
    int v44 = v43(__dsta, 1, v42);
    if (v41)
    {
      if (!v44)
      {
        if (swift_getEnumCaseMultiPayload())
        {
          uint64_t v51 = v71;
          uint64_t v50 = v72;
          memcpy(v72, __dsta, *(void *)(v71 + 64));
        }
        else
        {
          uint64_t v50 = v72;
          (*(void (**)(void *, char *, uint64_t))(v75 + 32))(v72, __dsta, v76);
          swift_storeEnumTagMultiPayload();
          uint64_t v51 = v71;
        }
        (*(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56))(v50, 0, 1, v42);
        goto LABEL_34;
      }
      size_t v45 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B160608) - 8) + 64);
      uint64_t v46 = v72;
    }
    else
    {
      if (!v44)
      {
        if (a1 == a2) {
          goto LABEL_34;
        }
        sub_2496CBBCC((uint64_t)v72, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        if (!swift_getEnumCaseMultiPayload())
        {
          (*(void (**)(void *, char *, uint64_t))(v75 + 32))(v72, __dsta, v76);
          swift_storeEnumTagMultiPayload();
          goto LABEL_34;
        }
        size_t v45 = *(void *)(v71 + 64);
        uint64_t v46 = v72;
        uint64_t v49 = __dsta;
LABEL_23:
        memcpy(v46, v49, v45);
LABEL_34:
        v27[v29[7]] = v28[v29[7]];
        *(void *)&v27[v29[8]] = *(void *)&v28[v29[8]];
        swift_bridgeObjectRelease();
        *(void *)&v27[v29[9]] = *(void *)&v28[v29[9]];
        swift_bridgeObjectRelease();
        *(void *)&v27[v29[10]] = *(void *)&v28[v29[10]];
        swift_bridgeObjectRelease();
        *(void *)&v27[v29[11]] = *(void *)&v28[v29[11]];
        swift_bridgeObjectRelease();
        *(void *)&v27[v29[12]] = *(void *)&v28[v29[12]];
        swift_bridgeObjectRelease();
        *(void *)&v27[v29[13]] = *(void *)&v28[v29[13]];
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      sub_2496CBBCC((uint64_t)v72, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      size_t v45 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B160608) - 8) + 64);
      uint64_t v46 = v72;
    }
    uint64_t v49 = __dsta;
    goto LABEL_23;
  }
  if (v33)
  {
LABEL_13:
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
    memcpy(v27, v28, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_35;
  }
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  uint64_t v34 = v29[6];
  __dst = &v27[v34];
  uint64_t v35 = &v28[v34];
  uint64_t v36 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
    memcpy(__dst, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      uint64_t v47 = v35;
      uint64_t v48 = __dst;
      memcpy(__dst, v47, *(void *)(v37 + 64));
    }
    else
    {
      uint64_t v48 = __dst;
      (*(void (**)(void))(v75 + 32))();
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v48, 0, 1, v36);
  }
  v27[v29[7]] = v28[v29[7]];
  *(void *)&v27[v29[8]] = *(void *)&v28[v29[8]];
  *(void *)&v27[v29[9]] = *(void *)&v28[v29[9]];
  *(void *)&v27[v29[10]] = *(void *)&v28[v29[10]];
  *(void *)&v27[v29[11]] = *(void *)&v28[v29[11]];
  *(void *)&v27[v29[12]] = *(void *)&v28[v29[12]];
  *(void *)&v27[v29[13]] = *(void *)&v28[v29[13]];
  (*(void (**)(char *, void, uint64_t, int *))(v30 + 56))(v27, 0, 1, v29);
LABEL_35:
  uint64_t v52 = a3[13];
  uint64_t v53 = (uint64_t)&a1[v52];
  uint64_t v54 = &a2[v52];
  if (!*(void *)&a1[v52 + 8])
  {
LABEL_39:
    long long v59 = *((_OWORD *)v54 + 1);
    *(_OWORD *)uint64_t v53 = *(_OWORD *)v54;
    *(_OWORD *)(v53 + 16) = v59;
    *(_OWORD *)(v53 + 32) = *((_OWORD *)v54 + 2);
    goto LABEL_40;
  }
  uint64_t v55 = *((void *)v54 + 1);
  if (!v55)
  {
    sub_2496CD594(v53);
    goto LABEL_39;
  }
  *(void *)uint64_t v53 = *(void *)v54;
  *(void *)(v53 + 8) = v55;
  swift_bridgeObjectRelease();
  uint64_t v56 = *((void *)v54 + 3);
  *(void *)(v53 + 16) = *((void *)v54 + 2);
  *(void *)(v53 + 24) = v56;
  swift_bridgeObjectRelease();
  uint64_t v57 = *(void *)(v53 + 32);
  unint64_t v58 = *(void *)(v53 + 40);
  *(_OWORD *)(v53 + 32) = *((_OWORD *)v54 + 2);
  sub_2496C5970(v57, v58);
LABEL_40:
  uint64_t v60 = a3[14];
  long long v61 = &a1[v60];
  uint64_t v62 = (uint64_t *)&a2[v60];
  uint64_t v64 = *v62;
  uint64_t v63 = v62[1];
  *(void *)long long v61 = v64;
  *((void *)v61 + 1) = v63;
  swift_bridgeObjectRelease();
  uint64_t v65 = a3[15];
  uint64_t v66 = &a1[v65];
  uint64_t v67 = (uint64_t *)&a2[v65];
  uint64_t v69 = *v67;
  uint64_t v68 = v67[1];
  *(void *)uint64_t v66 = v69;
  *((void *)v66 + 1) = v68;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2496CE1FC);
}

uint64_t sub_2496CE1FC(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_2496D7BA8();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_9;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[12];
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for IntegrationEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2496CE390);
}

uint64_t sub_2496CE390(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_2496D7BA8();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[12];
  return v15(v17, a2, a2, v16);
}

void sub_2496CE510()
{
  sub_2496D7BA8();
  if (v0 <= 0x3F)
  {
    sub_2496CE67C(319, &qword_26B1605F0, MEMORY[0x270FA99C8]);
    if (v1 <= 0x3F)
    {
      sub_2496CE67C(319, &qword_26B160630, (void (*)(uint64_t))type metadata accessor for IntegrationRecurrence);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2496CE67C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2496D7FB8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for IntegrationRecurrence(void *a1, void *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[6];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v8, v9, *(void *)(v11 + 64));
      }
      else
      {
        uint64_t v14 = sub_2496D7BA8();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v8, v9, v14);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(void *)((char *)v4 + v15) = *(void *)((char *)a2 + v15);
    uint64_t v16 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *(void *)((char *)v4 + v16) = *(void *)((char *)a2 + v16);
    uint64_t v17 = a3[12];
    *(void *)((char *)v4 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *(void *)((char *)v4 + v17) = *(void *)((char *)a2 + v17);
    *(void *)((char *)v4 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for IntegrationRecurrence(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3)
    && !swift_getEnumCaseMultiPayload())
  {
    uint64_t v4 = sub_2496D7BA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v2, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(void *)(v10 + 64));
    }
    else
    {
      uint64_t v12 = sub_2496D7BA8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16))(v7, v8, v12);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_2496CBBCC((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v17 = sub_2496D7BA8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v7, v8, v17);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v14 = *(void *)(v10 + 64);
      goto LABEL_8;
    }
    sub_2496CBBCC((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
LABEL_7:
    size_t v14 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B160608) - 8) + 64);
LABEL_8:
    memcpy(v7, v8, v14);
    goto LABEL_14;
  }
  if (v13) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(void *)(v10 + 64));
  }
  else
  {
    uint64_t v15 = sub_2496D7BA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_14:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(void *)(v10 + 64));
    }
    else
    {
      uint64_t v12 = sub_2496D7BA8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v7, v8, v12);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_2496CBBCC((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v18 = sub_2496D7BA8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 32))(v7, v8, v18);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v14 = *(void *)(v10 + 64);
      goto LABEL_8;
    }
    sub_2496CBBCC((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
LABEL_7:
    size_t v14 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B160608) - 8) + 64);
LABEL_8:
    memcpy(v7, v8, v14);
    goto LABEL_14;
  }
  if (v13) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(void *)(v10 + 64));
  }
  else
  {
    uint64_t v15 = sub_2496D7BA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 32))(v7, v8, v15);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_14:
  uint64_t v16 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2496CF3C0);
}

uint64_t sub_2496CF3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2496CF4A8);
}

uint64_t sub_2496CF4A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = a2;
  }
  return result;
}

void sub_2496CF56C()
{
  sub_2496CE67C(319, &qword_26B160610, (void (*)(uint64_t))type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for IntegrationRecurrence.RecurrenceEnd(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_2496D7BA8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for IntegrationRecurrence.RecurrenceEnd(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (!result)
  {
    uint64_t v3 = sub_2496D7BA8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_2496D7BA8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2496CBBCC((uint64_t)a1, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_2496D7BA8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_2496D7BA8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2496CBBCC((uint64_t)a1, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_2496D7BA8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.RecurrenceEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence.RecurrenceEnd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2496CFB24()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2496CFB34()
{
  uint64_t result = sub_2496D7BA8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.Frequency(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IntegrationRecurrence.Frequency(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x2496CFD24);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationRecurrence.Frequency()
{
  return &type metadata for IntegrationRecurrence.Frequency;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.Weekday(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for IntegrationRecurrence.Weekday(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2496CFEB8);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

unsigned char *sub_2496CFEE0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntegrationRecurrence.Weekday()
{
  return &type metadata for IntegrationRecurrence.Weekday;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.DayOfTheWeek(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && a1[16]) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 7;
  int v5 = v3 - 7;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence.DayOfTheWeek(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(void *)__n128 result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 6;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationRecurrence.DayOfTheWeek()
{
  return &type metadata for IntegrationRecurrence.DayOfTheWeek;
}

uint64_t destroy for IntegrationColor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 40);
  return sub_2496C5970(v2, v3);
}

void *initializeWithCopy for IntegrationColor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[4];
  unint64_t v6 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2496BBA60(v5, v6);
  a1[4] = v5;
  a1[5] = v6;
  return a1;
}

void *assignWithCopy for IntegrationColor(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  unint64_t v4 = a2[5];
  sub_2496BBA60(v5, v4);
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  a1[4] = v5;
  a1[5] = v4;
  sub_2496C5970(v6, v7);
  return a1;
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

void *assignWithTake for IntegrationColor(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_2496C5970(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationColor(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationColor(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationColor()
{
  return &type metadata for IntegrationColor;
}

uint64_t destroy for IntegrationColor.Identifier()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for IntegrationColor.Identifier(void *a1, void *a2)
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

void *assignWithCopy for IntegrationColor.Identifier(void *a1, void *a2)
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

void *assignWithTake for IntegrationColor.Identifier(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for IntegrationColor.Identifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntegrationColor.Identifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntegrationColor.Identifier()
{
  return &type metadata for IntegrationColor.Identifier;
}

uint64_t sub_2496D03AC(unint64_t *a1, void (*a2)(uint64_t))
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

CalendarIntegrationSupport::SyncResult::FullSyncInfo __swiftcall SyncResult.FullSyncInfo.init(allIDs:)(CalendarIntegrationSupport::SyncResult::FullSyncInfo allIDs)
{
  v1->allIDs._rawValue = allIDs.allIDs._rawValue;
  return allIDs;
}

CalendarIntegrationSupport::SyncResult::IncrementalSyncInfo __swiftcall SyncResult.IncrementalSyncInfo.init(insertedAndUpdated:deleted:updatedColors:)(Swift::OpaquePointer insertedAndUpdated, Swift::OpaquePointer deleted, Swift::OpaquePointer updatedColors)
{
  v3->_rawValue = insertedAndUpdated._rawValue;
  v3[1]._rawValue = deleted._rawValue;
  v3[2]._rawValue = updatedColors._rawValue;
  result.updatedColors = updatedColors;
  result.deleted = deleted;
  result.insertedAndUpdated = insertedAndUpdated;
  return result;
}

__n128 SyncResult.init(modTag:syncType:)@<Q0>(__n128 *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *((void *)a2 + 2);
  char v4 = *((unsigned char *)a2 + 24);
  __n128 result = *a1;
  long long v6 = *a2;
  *(__n128 *)a3 = *a1;
  *(_OWORD *)(a3 + 16) = v6;
  *(void *)(a3 + 32) = v3;
  *(unsigned char *)(a3 + 40) = v4;
  return result;
}

CalendarIntegrationSupport::ModTag __swiftcall ModTag.init(stringValue:)(CalendarIntegrationSupport::ModTag stringValue)
{
  *unint64_t v1 = stringValue;
  return stringValue;
}

uint64_t ModTag.stringValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModTag.stringValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ModTag.stringValue.modify())()
{
  return nullsub_1;
}

uint64_t static ModTag.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2496D8258();
  }
}

uint64_t sub_2496D0504(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2496D8258();
  }
}

uint64_t dispatch thunk of IntegrationCollectionDataSource.sync(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of IntegrationCollectionDataSource.fetch(ids:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of IntegrationCollectionDataSource.fetch(colorIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_2496D05AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v4 = vars8;
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SyncResult(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  return sub_2496D0638(v2, v3, v4, v5);
}

uint64_t sub_2496D0638(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (a4)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for SyncResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_2496D05AC(v4, v5, v6, v7);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  return a1;
}

uint64_t assignWithCopy for SyncResult(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  LOBYTE(v2) = *((unsigned char *)v2 + 40);
  sub_2496D05AC(v4, v5, v6, (char)v2);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = (_BYTE)v2;
  sub_2496D0638(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SyncResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  char v6 = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  sub_2496D0638(v7, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 41)) {
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

uint64_t storeEnumTagSinglePayload for SyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncResult()
{
  return &type metadata for SyncResult;
}

uint64_t destroy for SyncResult.SyncType(uint64_t a1)
{
  return sub_2496D0638(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for SyncResult.SyncType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_2496D05AC(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for SyncResult.SyncType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_2496D05AC(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_2496D0638(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SyncResult.SyncType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_2496D0638(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncResult.SyncType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncResult.SyncType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2496D0AB4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_2496D0ABC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SyncResult.SyncType()
{
  return &type metadata for SyncResult.SyncType;
}

ValueMetadata *type metadata accessor for SyncResult.FullSyncInfo()
{
  return &type metadata for SyncResult.FullSyncInfo;
}

uint64_t destroy for SyncResult.IncrementalSyncInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s26CalendarIntegrationSupport10SyncResultV19IncrementalSyncInfoVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SyncResult.IncrementalSyncInfo(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SyncResult.IncrementalSyncInfo(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncResult.IncrementalSyncInfo(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncResult.IncrementalSyncInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncResult.IncrementalSyncInfo()
{
  return &type metadata for SyncResult.IncrementalSyncInfo;
}

void *initializeBufferWithCopyOfBuffer for ModTag(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ModTag()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ModTag(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ModTag(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModTag(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ModTag(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModTag()
{
  return &type metadata for ModTag;
}

uint64_t IntegrationCollectionSync.__allocating_init(syncDataProvider:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  uint64_t v6 = sub_2496D741C(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
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

uint64_t IntegrationCollectionSync.init(syncDataProvider:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = sub_2496D6A78((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

void *sub_2496D0FB8()
{
  uint64_t v2 = v0;
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v3 = v0 + 2;
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[12];
  uint64_t result = (void *)(*(uint64_t (**)(void, void, uint64_t, uint64_t))(v5 + 32))(v2[11], v2[12], v4, v5);
  if (v1) {
    return result;
  }
  uint64_t v9 = result;
  uint64_t v54 = v6;
  uint64_t v55 = v3;
  id v10 = objc_msgSend(result, sel_externalModificationTag);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v56 = sub_2496D7E38();
    uint64_t v13 = v12;

    swift_bridgeObjectRetain();
  }
  else
  {

    uint64_t v56 = 0;
    uint64_t v13 = 0;
  }
  if (qword_26B160270 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_2496D7D88();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B160698);
  swift_bridgeObjectRetain_n();
  swift_retain();
  uint64_t v15 = sub_2496D7D68();
  os_log_type_t v16 = sub_2496D7F38();
  uint64_t v53 = v7;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v51 = (void *)swift_slowAlloc();
    id v59 = v51;
    *(_DWORD *)uint64_t v17 = 136446722;
    uint64_t v18 = v2[9];
    unint64_t v19 = v2[10];
    swift_bridgeObjectRetain();
    v58[0] = sub_2496BA7D4(v18, v19, (uint64_t *)&v59);
    sub_2496D7FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v20 = v2[13];
    unint64_t v21 = v2[14];
    swift_bridgeObjectRetain();
    v58[0] = sub_2496BA7D4(v20, v21, (uint64_t *)&v59);
    sub_2496D7FC8();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2082;
    if (v13) {
      uint64_t v22 = 1752459639;
    }
    else {
      uint64_t v22 = 0x74756F68746977;
    }
    if (v13) {
      unint64_t v23 = 0xE400000000000000;
    }
    else {
      unint64_t v23 = 0xE700000000000000;
    }
    v58[0] = sub_2496BA7D4(v22, v23, (uint64_t *)&v59);
    sub_2496D7FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2496B3000, v15, v16, "Requesting a sync of %{public}s \"%s\" %{public}s a previous mod tag.", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v51, -1, -1);
    MEMORY[0x24C5A8E90](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v24 = swift_release();
  }
  uint64_t v25 = MEMORY[0x24C5A88D0](v24);
  uint64_t v26 = v2[18];
  uint64_t v27 = v2[19];
  __swift_project_boxed_opaque_existential_1(v2 + 15, v26);
  v58[0] = v56;
  v58[1] = v13;
  (*(void (**)(id *__return_ptr, void *, uint64_t, uint64_t))(v27 + 8))(&v59, v58, v26, v27);
  uint64_t v28 = v60;
  id v52 = v59;
  int v29 = v61;
  uint64_t v30 = v62;
  uint64_t v31 = v63;
  int v32 = (void *)v25;
  char v33 = v64;
  swift_bridgeObjectRelease();
  if (v33)
  {
    id v59 = v29;
    uint64_t v60 = v30;
    long long v61 = (void *)v31;
    swift_bridgeObjectRetain();
    sub_2496D05AC((uint64_t)v29, v30, v31, 1);
    sub_2496D05AC((uint64_t)v29, v30, v31, 1);
    sub_2496D1730((uint64_t)&v59);
    uint64_t v34 = (uint64_t)v29;
    uint64_t v35 = v30;
    uint64_t v36 = v31;
    char v37 = 1;
  }
  else
  {
    id v59 = v29;
    swift_bridgeObjectRetain();
    sub_2496D05AC((uint64_t)v29, v30, v31, 0);
    sub_2496D05AC((uint64_t)v29, v30, v31, 0);
    sub_2496D2BC8((uint64_t *)&v59);
    uint64_t v34 = (uint64_t)v29;
    uint64_t v35 = v30;
    uint64_t v36 = v31;
    char v37 = 0;
  }
  sub_2496D0638(v34, v35, v36, v37);
  if (!v28)
  {
    swift_bridgeObjectRelease();
    sub_2496D0638((uint64_t)v29, v30, v31, v33);
    if (!v13) {
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
    id v52 = 0;
LABEL_30:
    char v57 = v33;
    uint64_t v39 = v28;
    uint64_t v40 = v2[5];
    uint64_t v41 = v2[6];
    __swift_project_boxed_opaque_existential_1(v55, v40);
    uint64_t v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 32))(v54, v53, v40, v41);
    if (v39)
    {
      unint64_t v43 = (void *)sub_2496D7E28();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v43 = 0;
    }
    objc_msgSend(v42, sel_setExternalModificationTag_, v43, v52);

    int v44 = (void *)v2[7];
    id v59 = 0;
    if (!objc_msgSend(v44, sel_saveCalendar_commit_error_, v42, 0, &v59))
    {
      id v50 = v59;
      sub_2496D7AC8();

      swift_willThrow();
      swift_bridgeObjectRelease();
      return (void *)sub_2496D0638((uint64_t)v29, v30, v31, v57);
    }
    id v45 = v59;

    char v33 = v57;
    goto LABEL_35;
  }
  sub_2496D0638((uint64_t)v29, v30, v31, v33);
  if (!v13) {
    goto LABEL_30;
  }
  if (v52 != (id)v56 || v28 != v13)
  {
    char v38 = sub_2496D8258();
    swift_bridgeObjectRelease();
    if (v38)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_35:
  uint64_t v46 = (void *)v2[7];
  id v59 = 0;
  unsigned __int8 v47 = objc_msgSend(v46, sel_commitWithRollback_, &v59, v52);
  id v48 = v59;
  if ((v47 & 1) == 0)
  {
    uint64_t v49 = v48;
    sub_2496D7AC8();

    swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return (void *)sub_2496D0638((uint64_t)v29, v30, v31, v33);
}

void sub_2496D1730(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  v39[1] = *(id *)MEMORY[0x263EF8340];
  id v6 = *(id *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  if (qword_26B160270 != -1) {
LABEL_35:
  }
    swift_once();
  uint64_t v8 = sub_2496D7D88();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B160698);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_2496D7D68();
  os_log_type_t v10 = sub_2496D7F58();
  char v38 = v4;
  uint64_t v35 = v7;
  uint64_t v36 = (uint64_t)v6;
  if (!os_log_type_enabled(v9, v10))
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v16 = swift_bridgeObjectRelease_n();
    uint64_t v7 = *(void *)(v5 + 16);
    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_6;
  }
  os_log_type_t type = v10;
  uint64_t v11 = swift_slowAlloc();
  char v33 = (void *)swift_slowAlloc();
  v39[0] = v33;
  *(_DWORD *)uint64_t v11 = 136446978;
  uint64_t isa = (uint64_t)v4[9].isa;
  unint64_t v13 = (unint64_t)v4[10].isa;
  swift_bridgeObjectRetain();
  sub_2496BA7D4(isa, v13, (uint64_t *)v39);
  sub_2496D7FC8();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 12) = 2080;
  uint64_t v14 = (uint64_t)v38[13].isa;
  unint64_t v15 = (unint64_t)v38[14].isa;
  swift_bridgeObjectRetain();
  sub_2496BA7D4(v14, v15, (uint64_t *)v39);
  sub_2496D7FC8();
  swift_release_n();
  uint64_t v4 = v38;
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 22) = 2048;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2496D7FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 32) = 2048;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2496D7FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2496B3000, v9, type, "Performing an incremental sync for collection %{public}s \"%s\" with %ld updated or inserted items and %ld deleted items", (uint8_t *)v11, 0x2Au);
  swift_arrayDestroy();
  MEMORY[0x24C5A8E90](v33, -1, -1);
  MEMORY[0x24C5A8E90](v11, -1, -1);

  uint64_t v7 = *(void *)(v5 + 16);
  if (v7)
  {
LABEL_6:
    os_log_t log = v4 + 2;
    swift_bridgeObjectRetain();
    v5 += 40;
    while (1)
    {
      Class v17 = v4[7].isa;
      swift_bridgeObjectRetain();
      uint64_t v18 = v4;
      unint64_t v19 = v17;
      uint64_t v20 = (void *)sub_2496D7E28();
      uint64_t v22 = (uint64_t)v18[5].isa;
      Class v21 = v18[6].isa;
      __swift_project_boxed_opaque_existential_1(log, v22);
      (*((void (**)(uint64_t, Class))v21 + 3))(v22, v21);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

LABEL_33:
        return;
      }
      sub_2496BC414(0, &qword_26B1602B8);
      unint64_t v23 = (void *)sub_2496D7E78();
      swift_bridgeObjectRelease();
      id v6 = [(objc_class *)v19 eventsWithExternalIdentifier:v20 inCalendars:v23];

      if (v6)
      {
        sub_2496BC414(0, &qword_26B160318);
        unint64_t v24 = sub_2496D7E98();

        uint64_t v4 = v38;
        if (v24 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v28 = sub_2496D81B8();
          swift_bridgeObjectRelease();
          if (!v28)
          {
LABEL_19:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_8;
          }
        }
        else if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_19;
        }
        if ((v24 & 0xC000000000000001) != 0)
        {
          id v25 = (id)MEMORY[0x24C5A85A0](0, v24);
        }
        else
        {
          if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_35;
          }
          id v25 = *(id *)(v24 + 32);
        }
        uint64_t v20 = v25;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        Class v26 = v38[7].isa;
        v39[0] = 0;
        if (![(objc_class *)v26 removeEvent:v20 span:1 commit:0 error:v39])
        {
          id v32 = v39[0];
          swift_bridgeObjectRelease();
          sub_2496D7AC8();

          swift_willThrow();
          goto LABEL_33;
        }
        id v27 = v39[0];
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = v38;
      }
LABEL_8:
      v5 += 16;
      if (!--v7)
      {
        uint64_t v16 = swift_bridgeObjectRelease();
        break;
      }
    }
  }
LABEL_23:
  uint64_t v29 = *(void *)(v36 + 16);
  if (v29)
  {
    uint64_t v30 = 0;
    while (1)
    {
      uint64_t v31 = (void *)MEMORY[0x24C5A88D0](v16);
      sub_2496D456C(v30, v4, 50, v36);
      if (v3) {
        break;
      }
      if (__OFADD__(v30, 50)) {
        uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        v30 += 50;
      }
      if (v30 >= v29) {
        goto LABEL_30;
      }
    }
  }
  else
  {
LABEL_30:
    sub_2496D4ADC(v35);
  }
}

void sub_2496D1D78(uint64_t *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = (uint64_t)a1;
  v121[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = *a1;
  id v7 = (id)a1[1];
  uint64_t v8 = (void *)*((void *)v1 + 7);
  swift_bridgeObjectRetain();
  uint64_t v117 = v8;
  id v118 = (id)sub_2496D7E28();
  uint64_t v10 = *((void *)v1 + 5);
  uint64_t v9 = *((void *)v1 + 6);
  __swift_project_boxed_opaque_existential_1((void *)v1 + 2, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v10, v9);
  if (v3)
  {

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v115 = v6;
  uint64_t v116 = 0;
  sub_2496BC414(0, &qword_26B1602B8);
  uint64_t v11 = (void *)sub_2496D7E78();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v117, sel_eventsWithExternalIdentifier_inCalendars_, v118, v11);

  unint64_t v13 = v1 + 16;
  if (!v12) {
    goto LABEL_26;
  }
  sub_2496BC414(0, &qword_26B160318);
  unint64_t v14 = sub_2496D7E98();

  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_6;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v16) {
    goto LABEL_25;
  }
LABEL_6:
  if ((v14 & 0xC000000000000001) != 0) {
    goto LABEL_55;
  }
  if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_57:
    swift_once();
    goto LABEL_51;
  }
  for (id i = *(id *)(v14 + 32); ; id i = (id)MEMORY[0x24C5A85A0](0, v14, v15))
  {
    uint64_t v18 = i;
    swift_bridgeObjectRelease();
    id v19 = v18;
    id v20 = objc_msgSend(v19, sel_calendar);
    if (!v20)
    {
      __break(1u);
LABEL_59:
      __break(1u);
      return;
    }
    Class v21 = v20;
    uint64_t v22 = v5;
    id v23 = objc_msgSend(v20, sel_source);

    if (!v23) {
      goto LABEL_59;
    }
    unint64_t v24 = v13;
    id v25 = objc_msgSend(v23, sel_personaIdentifier);

    if (v25)
    {
      uint64_t v26 = sub_2496D7E38();
      uint64_t v28 = v27;

      uint64_t v29 = type metadata accessor for IntegrationEntry(0);
      uint64_t v5 = v22;
      uint64_t v30 = (void *)(v22 + *(int *)(v29 + 56));
      uint64_t v31 = v30[1];
      if (v31)
      {
        id v32 = (int *)v29;
        if (v26 == *v30 && v31 == v28)
        {
          uint64_t v117 = v4;
          id v118 = v7;
          swift_bridgeObjectRelease();
          id v112 = v19;
          goto LABEL_30;
        }
        char v34 = sub_2496D8258();
        swift_bridgeObjectRelease();
        if (v34) {
          goto LABEL_20;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v33 = type metadata accessor for IntegrationEntry(0);
      uint64_t v5 = v22;
      if (!*(void *)(v22 + *(int *)(v33 + 56) + 8))
      {
        id v32 = (int *)v33;
LABEL_20:
        uint64_t v117 = v4;
        id v118 = v7;
        id v112 = v19;
        goto LABEL_30;
      }
    }
    uint64_t v35 = (void *)*((void *)v4 + 7);
    v121[0] = 0;
    if (!objc_msgSend(v35, sel_removeEvent_span_commit_error_, v19, 1, 0, v121))
    {
      id v37 = v121[0];
      swift_bridgeObjectRelease();
      sub_2496D7AC8();

      swift_willThrow();
LABEL_28:

      return;
    }
    id v36 = v121[0];

    unint64_t v13 = v24;
LABEL_26:
    unint64_t v113 = v5;
    id v118 = v7;
    id v38 = objc_msgSend(self, sel_eventWithEventStore_, *((void *)v4 + 7));
    uint64_t v39 = *((void *)v4 + 5);
    uint64_t v40 = *((void *)v4 + 6);
    __swift_project_boxed_opaque_existential_1(v13, v39);
    v114 = (int *)type metadata accessor for IntegrationEntry(0);
    uint64_t v41 = (uint64_t *)(v5 + v114[14]);
    uint64_t v42 = *v41;
    uint64_t v43 = v41[1];
    int v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 32);
    id v19 = v38;
    uint64_t v45 = v116;
    uint64_t v46 = v44(v42, v43, v39, v40);
    if (v45)
    {
      swift_bridgeObjectRelease();

      goto LABEL_28;
    }
    unsigned __int8 v47 = (void *)v46;
    uint64_t v116 = 0;
    uint64_t v117 = v4;
    objc_msgSend(v19, sel_setCalendar_, v46);

    id v48 = (void *)sub_2496D7E28();
    objc_msgSend(v19, sel_setUniqueID_, v48);

    id v112 = 0;
    uint64_t v5 = v113;
    id v32 = v114;
LABEL_30:
    type metadata accessor for IntegrationEntry(0);
    uint64_t v49 = v32;
    uint64_t v50 = v5;
    uint64_t v51 = v5 + v32[7];
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E8);
    MEMORY[0x270FA5388](v52 - 8);
    uint64_t v54 = (char *)&v109 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2496CBA9C(v51, (uint64_t)v54, &qword_26B1605E8);
    uint64_t v55 = sub_2496D7C38();
    uint64_t v56 = *(void *)(v55 - 8);
    LODWORD(v51) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48))(v54, 1, v55);
    id v57 = v19;
    unint64_t v58 = 0;
    if (v51 != 1)
    {
      unint64_t v58 = (void *)sub_2496D7C28();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v54, v55);
    }
    objc_msgSend(v57, sel_setTimeZone_, v58);

    uint64_t v5 = v50;
    objc_msgSend(v57, sel_setAllDay_, *(unsigned __int8 *)(v50 + v32[9]));
    id v59 = (void *)sub_2496D7B78();
    objc_msgSend(v57, sel_setStartDate_, v59);

    uint64_t v60 = (void *)sub_2496D7B78();
    objc_msgSend(v57, sel_setEndDate_, v60);

    id v61 = v57;
    uint64_t v62 = (void *)sub_2496D7E28();
    objc_msgSend(v61, sel_setTitle_, v62);

    objc_msgSend(v61, sel_setCompleted_, *(unsigned __int8 *)(v50 + v32[10]));
    uint64_t v63 = v50 + v32[12];
    id v7 = v61;
    if (sub_2496D724C(v63))
    {
      sub_2496BC414(0, &qword_2696CABC0);
      char v64 = (void *)sub_2496D7E78();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v64 = 0;
    }
    uint64_t v16 = v115;
    unint64_t v13 = v117;
    objc_msgSend(v7, sel_setRecurrenceRules_, v64);

    unint64_t v14 = *(void *)(v50 + v49[15] + 8);
    id v65 = v7;
    if (v14) {
      unint64_t v14 = sub_2496D7E28();
    }
    objc_msgSend(v7, sel_setExternalID_, v14);

    uint64_t v66 = (uint64_t *)(v50 + v49[13]);
    uint64_t v67 = v66[1];
    if (v67)
    {
      uint64_t v68 = *v66;
      uint64_t v69 = v66[3];
      v114 = (int *)v66[2];
      uint64_t v70 = (uint64_t *)(v13 + 64);
      uint64_t v72 = v66[4];
      unint64_t v71 = v66[5];
      swift_beginAccess();
      unint64_t v14 = *((void *)v13 + 8);
      uint64_t v73 = *(void *)(v14 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v113 = v71;
      if (v73)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v74 = v71;
        uint64_t v75 = (uint64_t)v114;
        sub_2496C73CC(v68, v67, (uint64_t)v114, v69, v72, v74);
        swift_bridgeObjectRetain();
        unint64_t v76 = sub_2496D5190(v68, v67, v75, v69);
        if (v77)
        {
          uint64_t v5 = v68;
          id v78 = *(id *)(*(void *)(v14 + 56) + 8 * v76);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          id v79 = v78;
          objc_msgSend(v7, sel_setColor_, v79);
          sub_2496C5B6C(v5, v67, (uint64_t)v114, v69, v72, v113);

          uint64_t v16 = v115;
          goto LABEL_47;
        }
        uint64_t v110 = v72;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v110 = v72;
        sub_2496C73CC(v68, v67, (uint64_t)v114, v69, v72, v71);
      }
      uint64_t v80 = v68;
      uint64_t v117 = v13;
      id v81 = *((id *)v13 + 7);
      uint64_t v111 = v80;
      uint64_t v82 = (void *)sub_2496D7E28();
      uint64_t v83 = (uint64_t)v114;
      uint64_t v84 = (void *)sub_2496D7E28();
      id v85 = objc_msgSend(v81, sel_colorWithProviderIdentifier_externalIdentifier_, v82, v84);

      uint64_t v86 = v83;
      if (!v85)
      {
        id v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04B70]), sel_init);
        unint64_t v87 = (void *)sub_2496D7E28();
        objc_msgSend(v85, sel_setProviderIdentifier_, v87);

        uint64_t v88 = (void *)sub_2496D7E28();
        objc_msgSend(v85, sel_setExternalID_, v88);
      }
      swift_beginAccess();
      id v89 = v85;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v119 = *v70;
      *uint64_t v70 = 0x8000000000000000;
      uint64_t v91 = v111;
      sub_2496D5F94((uint64_t)v89, v111, v67, v86, v69, isUniquelyReferenced_nonNull_native);
      *uint64_t v70 = v119;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      uint64_t v5 = v86;
      uint64_t v92 = v110;
      unint64_t v14 = v113;
      long long v93 = (void *)sub_2496D7B38();
      objc_msgSend(v89, sel_setData_, v93);

      objc_msgSend(v7, sel_setColor_, v89);
      sub_2496C5B6C(v91, v67, v5, v69, v92, v14);
      uint64_t v16 = v115;
      unint64_t v13 = v117;
    }
    else
    {
      objc_msgSend(v7, sel_setColor_, 0);
    }
LABEL_47:
    uint64_t v4 = (char *)v7;
    unsigned int v94 = objc_msgSend(v4, sel_sequenceNumber);
    uint64_t v15 = v94 + 1;
    if (!__OFADD__(v94, 1)) {
      break;
    }
    __break(1u);
LABEL_55:
    ;
  }
  objc_msgSend(v4, sel_setSequenceNumber_, v15);

  uint64_t v95 = (void *)*((void *)v13 + 7);
  v120[0] = 0;
  unsigned int v96 = objc_msgSend(v95, sel_saveEvent_span_commit_error_, v4, 1, 0, v120);
  id v7 = v118;
  if (v96)
  {
    id v97 = v120[0];

    swift_bridgeObjectRelease();
    return;
  }
  id v98 = v120[0];
  unint64_t v13 = (char *)sub_2496D7AC8();

  swift_willThrow();
  if (qword_26B160270 != -1) {
    goto LABEL_57;
  }
LABEL_51:
  uint64_t v99 = sub_2496D7D88();
  __swift_project_value_buffer(v99, (uint64_t)qword_26B160698);
  uint64_t v100 = v13;
  swift_bridgeObjectRetain();
  uint64_t v101 = v13;
  uint64_t v102 = sub_2496D7D68();
  os_log_type_t v103 = sub_2496D7F48();
  if (os_log_type_enabled(v102, v103))
  {
    uint64_t v104 = swift_slowAlloc();
    uint64_t v105 = (void *)swift_slowAlloc();
    uint64_t v117 = (char *)swift_slowAlloc();
    v120[0] = v117;
    *(_DWORD *)uint64_t v104 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v119 = sub_2496BA7D4(v16, (unint64_t)v7, (uint64_t *)v120);
    sub_2496D7FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v104 + 12) = 2112;
    unint64_t v106 = v13;
    uint64_t v107 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v119 = v107;
    sub_2496D7FC8();
    *uint64_t v105 = v107;

    _os_log_impl(&dword_2496B3000, v102, v103, "Failed to save event for entry %{public}s: %@", (uint8_t *)v104, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B160670);
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v105, -1, -1);
    id v108 = v117;
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v108, -1, -1);
    MEMORY[0x24C5A8E90](v104, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2496D2B20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_2496D80C8();
    uint64_t v4 = a1 + 32;
    do
    {
      v4 += 8;
      sub_2496D7F08();
      sub_2496D80A8();
      sub_2496D80D8();
      sub_2496D80E8();
      sub_2496D80B8();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

void sub_2496D2BC8(uint64_t *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = *a1;
  if (qword_26B160270 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2496D7D88();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B160698);
  swift_retain();
  swift_bridgeObjectRetain();
  id v7 = sub_2496D7D68();
  os_log_type_t v8 = sub_2496D7F58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v10;
    *(_DWORD *)uint64_t v9 = 136446722;
    uint64_t v11 = v4[9];
    unint64_t v12 = v4[10];
    swift_bridgeObjectRetain();
    sub_2496BA7D4(v11, v12, &v18);
    sub_2496D7FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v13 = v4[13];
    unint64_t v14 = v4[14];
    swift_bridgeObjectRetain();
    sub_2496BA7D4(v13, v14, &v18);
    sub_2496D7FC8();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 2048;
    sub_2496D7FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2496B3000, v7, v8, "Performing a full sync for collection %{public}s \"%s\" with %ld IDs", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v10, -1, -1);
    MEMORY[0x24C5A8E90](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_release();
  }
  uint64_t v18 = v5;
  sub_2496D2E80();
  if (!v3)
  {
    uint64_t v15 = *(void *)(v5 + 16);
    if (v15)
    {
      uint64_t v16 = 0;
      do
      {
        Class v17 = (void *)MEMORY[0x24C5A88D0]();
        sub_2496D456C(v16, v4, 50, v5);
        if (__OFADD__(v16, 50)) {
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          v16 += 50;
        }
      }
      while (v16 < v15);
    }
  }
}

void sub_2496D2E80()
{
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_2496D6B90(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  unint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  uint64_t v7 = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v8 = v6;
    if (v6 >> 62)
    {
LABEL_29:
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2496D81B8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v36 = v3;
    if (v9)
    {
      unint64_t v39 = v8 & 0xC000000000000001;
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v3 = 4;
      uint64_t v37 = v7;
      unint64_t v38 = v8;
      while (1)
      {
        if (v39) {
          id v12 = (id)MEMORY[0x24C5A85A0](v3 - 4, v8);
        }
        else {
          id v12 = *(id *)(v8 + 8 * v3);
        }
        uint64_t v13 = v12;
        uint64_t v14 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
        {
          __break(1u);
          goto LABEL_29;
        }
        id v15 = objc_msgSend(v12, sel_persistentObject);
        if (!v15) {
          break;
        }
        uint64_t v16 = v15;
        unsigned __int8 v17 = objc_msgSend(v15, sel_isNew);

        if ((v17 & 1) == 0)
        {
          id v18 = objc_msgSend(v13, sel_calendarIdentifier);
          uint64_t v19 = sub_2496D7E38();
          uint64_t v21 = v20;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_2496C2EB4(0, v10[2] + 1, 1, v10);
          }
          uint64_t v22 = v10;
          unint64_t v23 = v10[2];
          unint64_t v24 = v22;
          unint64_t v25 = v22[3];
          if (v23 >= v25 >> 1) {
            unint64_t v24 = sub_2496C2EB4((void *)(v25 > 1), v23 + 1, 1, v24);
          }
          void v24[2] = v23 + 1;
          uint64_t v11 = &v24[2 * v23];
          uint64_t v10 = v24;
          v11[4] = v19;
          v11[5] = v21;
          uint64_t v7 = v37;
          unint64_t v8 = v38;
        }

        ++v3;
        if (v14 == v9) {
          goto LABEL_20;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
      swift_bridgeObjectRelease();
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v40 = 0;
      uint64_t v26 = v10[2];
      if (v26)
      {
        uint64_t v27 = v10 + 5;
        do
        {
          uint64_t v28 = *(v27 - 1);
          unint64_t v29 = *v27;
          uint64_t v30 = swift_bridgeObjectRetain();
          uint64_t v31 = (void *)MEMORY[0x24C5A88D0](v30);
          sub_2496D32B8(v36, v28, v29, &v40);
          v27 += 2;
          swift_bridgeObjectRelease();
          --v26;
        }
        while (v26);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26B160270 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_2496D7D88();
      __swift_project_value_buffer(v32, (uint64_t)qword_26B160698);
      uint64_t v33 = sub_2496D7D68();
      os_log_type_t v34 = sub_2496D7F58();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 134218496;
        swift_beginAccess();
        uint64_t v43 = v42;
        sub_2496D7FC8();
        *(_WORD *)(v35 + 12) = 2048;
        uint64_t v43 = v40;
        sub_2496D7FC8();
        *(_WORD *)(v35 + 22) = 2048;
        uint64_t v43 = v41;
        sub_2496D7FC8();
        _os_log_impl(&dword_2496B3000, v33, v34, "Looked at %ld and removed %ld that should not be present. (Failed to remove %ld.)", (uint8_t *)v35, 0x20u);
        MEMORY[0x24C5A8E90](v35, -1, -1);
      }
    }
  }
}

void sub_2496D32B8(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v6 = (void *)v4;
  v94[3] = *(id *)MEMORY[0x263EF8340];
  id v10 = *(id *)(v4 + 56);
  uint64_t v11 = (void *)sub_2496D7E28();
  unint64_t v12 = (unint64_t)objc_msgSend(v10, sel_calendarWithIdentifier_, v11);

  if (!v12)
  {
    if (qword_26B160270 != -1) {
      goto LABEL_78;
    }
    goto LABEL_51;
  }
  uint64_t v13 = (void *)v6[7];
  v93[0] = 0;
  v94[0] = 0;
  objc_msgSend(v13, sel_loadEventIDs_uniqueIDs_calendar_, v93, v94, v12);
  id v14 = v94[0];
  id v15 = (void *)v93[0];
  if (!v94[0] || !v93[0])
  {
    uint64_t v58 = qword_26B160270;
    id v59 = v94[0];
    id v60 = v15;
    if (v58 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_2496D7D88();
    __swift_project_value_buffer(v61, (uint64_t)qword_26B160698);
    uint64_t v62 = sub_2496D7D68();
    os_log_type_t v63 = sub_2496D7F48();
    if (os_log_type_enabled(v62, v63))
    {
      char v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v64 = 0;
      _os_log_impl(&dword_2496B3000, v62, v63, "Couldn't fetch contents of calendar to check for removed reminders", v64, 2u);
      MEMORY[0x24C5A8E90](v64, -1, -1);
      id v65 = (void *)v12;
    }
    else
    {
      id v65 = v62;
      uint64_t v62 = v12;
    }

    return;
  }
  v93[0] = 0;
  sub_2496BC414(0, &qword_2696CABB0);
  id v16 = v14;
  id v17 = v15;
  id v18 = v16;
  uint64_t v19 = v17;
  sub_2496D7E88();
  uint64_t v20 = v5;
  uint64_t v82 = v93[0];
  if (!v93[0])
  {
LABEL_66:
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v68 = sub_2496D7D88();
    __swift_project_value_buffer(v68, (uint64_t)qword_26B160698);
    uint64_t v69 = sub_2496D7D68();
    os_log_type_t v70 = sub_2496D7F48();
    if (os_log_type_enabled(v69, v70))
    {
      unint64_t v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v71 = 0;
      _os_log_impl(&dword_2496B3000, v69, v70, "Fetching contents of calendar returned unexpected results", v71, 2u);
      MEMORY[0x24C5A8E90](v71, -1, -1);
      uint64_t v72 = (void *)v12;
      uint64_t v73 = v19;
      unint64_t v12 = (unint64_t)v18;
    }
    else
    {
      uint64_t v72 = v69;
      uint64_t v69 = v19;
      uint64_t v73 = v18;
    }

    return;
  }
  v93[0] = 0;
  sub_2496D7E88();
  uint64_t v21 = v93[0];
  if (!v93[0])
  {
    swift_bridgeObjectRelease();
    goto LABEL_66;
  }

  uint64_t v22 = *(void *)(v21 + 16);
  uint64_t v23 = a4[2];
  BOOL v24 = __OFADD__(v23, v22);
  uint64_t v25 = v23 + v22;
  if (v24)
  {
    __break(1u);
    goto LABEL_80;
  }
  a4[2] = v25;
  unint64_t v12 = MEMORY[0x263F8EE78];
  unint64_t v92 = MEMORY[0x263F8EE78];
  uint64_t v26 = a1;
  if (!v22)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!(v12 >> 62))
    {
      if (*(uint64_t *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
      {
LABEL_63:
        uint64_t v66 = swift_bridgeObjectRetain();
        uint64_t v67 = (void *)MEMORY[0x24C5A88D0](v66);
        sub_2496D3D58(v12, (uint64_t)v6, a4);
        if (v20)
        {
          goto LABEL_58;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v74 = v6[5];
        uint64_t v75 = v6[6];
        __swift_project_boxed_opaque_existential_1(v6 + 2, v74);
        (*(void (**)(uint64_t, uint64_t))(v75 + 40))(v74, v75);
        uint64_t v76 = v6[5];
        uint64_t v77 = v6[6];
        __swift_project_boxed_opaque_existential_1(v6 + 2, v76);
        uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v76, v77);
        id v79 = (void *)v6[7];
        v6[7] = v78;

        swift_beginAccess();
        v6[8] = MEMORY[0x263F8EE80];
      }
LABEL_75:
      swift_bridgeObjectRelease();
      return;
    }
LABEL_80:
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2496D81B8();
    swift_bridgeObjectRelease();
    if (v80 >= 1) {
      goto LABEL_63;
    }
    goto LABEL_75;
  }
  uint64_t v88 = v22;
  a2 = (uint64_t)(v6 + 2);
  uint64_t v90 = v21 + 32;
  swift_beginAccess();
  a3 = 0;
  unint64_t v85 = v82 & 0xC000000000000001;
  uint64_t v86 = a1 + 56;
  uint64_t v83 = v6;
  id v81 = a4;
  uint64_t v89 = v21;
  uint64_t v84 = v6 + 2;
  while (a3 < *(void *)(v21 + 16))
  {
    uint64_t v27 = (uint64_t *)(v90 + 16 * a3);
    uint64_t v28 = v27[1];
    if (*(void *)(v26 + 16))
    {
      unint64_t v29 = a4;
      uint64_t v30 = v20;
      a2 = *v27;
      sub_2496D82D8();
      swift_bridgeObjectRetain();
      sub_2496D7E48();
      uint64_t v31 = sub_2496D8308();
      uint64_t v32 = v26;
      uint64_t v33 = -1 << *(unsigned char *)(v26 + 32);
      unint64_t v34 = v31 & ~v33;
      if ((*(void *)(v86 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34))
      {
        uint64_t v35 = *(void *)(v32 + 48);
        uint64_t v36 = (void *)(v35 + 16 * v34);
        BOOL v37 = *v36 == a2 && v36[1] == v28;
        if (v37 || (sub_2496D8258() & 1) != 0)
        {
LABEL_9:
          uint64_t v20 = v30;
          a4 = v29;
          unint64_t v6 = v83;
LABEL_10:
          uint64_t v26 = a1;
          goto LABEL_11;
        }
        uint64_t v87 = ~v33;
        unint64_t v38 = (v34 + 1) & ~v33;
        if ((*(void *)(v86 + ((v38 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v38))
        {
          unint64_t v39 = (void *)(v35 + 16 * v38);
          BOOL v40 = *v39 == a2 && v39[1] == v28;
          if (v40 || (sub_2496D8258() & 1) != 0) {
            goto LABEL_9;
          }
          unint64_t v41 = (v38 + 1) & v87;
          if ((*(void *)(v86 + ((v41 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v41))
          {
            uint64_t v20 = v30;
            a4 = v29;
            unint64_t v6 = v83;
            while (1)
            {
              uint64_t v42 = (void *)(v35 + 16 * v41);
              BOOL v43 = *v42 == a2 && v42[1] == v28;
              if (v43 || (sub_2496D8258() & 1) != 0) {
                goto LABEL_10;
              }
              unint64_t v41 = (v41 + 1) & v87;
              if (((*(void *)(v86 + ((v41 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v41) & 1) == 0) {
                goto LABEL_37;
              }
            }
          }
        }
      }
      uint64_t v20 = v30;
      a4 = v29;
      unint64_t v6 = v83;
      if (!v85)
      {
LABEL_38:
        if (a3 >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_77;
        }
        id v44 = *(id *)(v82 + 32 + 8 * a3);
        goto LABEL_40;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_37:
      if (!v85) {
        goto LABEL_38;
      }
    }
    MEMORY[0x24C5A85A0](a3, v82);
LABEL_40:
    MEMORY[0x24C5A8390]();
    if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2496D7EB8();
    }
    sub_2496D7EC8();
    sub_2496D7EA8();
    swift_bridgeObjectRelease();
    uint64_t v26 = a1;
    unint64_t v12 = v92;
    if (v92 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_2496D81B8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v45 = *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    a2 = (uint64_t)v84;
    if (v45 < 51) {
      goto LABEL_12;
    }
    uint64_t v46 = swift_bridgeObjectRetain();
    unsigned __int8 v47 = (void *)MEMORY[0x24C5A88D0](v46);
    sub_2496D3D58(v92, (uint64_t)v6, a4);
    if (v20)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_75;
    }
    swift_bridgeObjectRelease();
    unint64_t v92 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    uint64_t v48 = v6[5];
    uint64_t v49 = v6[6];
    __swift_project_boxed_opaque_existential_1(v84, v48);
    (*(void (**)(uint64_t, uint64_t))(v49 + 40))(v48, v49);
    a2 = v6[5];
    uint64_t v50 = v6[6];
    __swift_project_boxed_opaque_existential_1(v84, a2);
    uint64_t v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8))(a2, v50);
    uint64_t v52 = (void *)v6[7];
    v6[7] = v51;

    v6[8] = MEMORY[0x263F8EE80];
    unint64_t v12 = MEMORY[0x263F8EE78];
    a4 = v81;
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v21 = v89;
    if (++a3 == v88) {
      goto LABEL_61;
    }
  }
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  swift_once();
LABEL_51:
  uint64_t v53 = sub_2496D7D88();
  __swift_project_value_buffer(v53, (uint64_t)qword_26B160698);
  swift_bridgeObjectRetain_n();
  uint64_t v54 = sub_2496D7D68();
  os_log_type_t v55 = sub_2496D7F48();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v93[0] = v57;
    *(_DWORD *)uint64_t v56 = 136446210;
    swift_bridgeObjectRetain();
    v94[0] = (id)sub_2496BA7D4(a2, a3, v93);
    sub_2496D7FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2496B3000, v54, v55, "Couldn't find calendar with UUID %{public}s while looking for reminders to remove in a full sync; skipping it.",
      v56,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A8E90](v57, -1, -1);
    MEMORY[0x24C5A8E90](v56, -1, -1);

    return;
  }

LABEL_58:
  swift_bridgeObjectRelease_n();
}

void sub_2496D3D58(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v72 = a3;
  unint64_t v4 = a1;
  v80[1] = *(id *)MEMORY[0x263EF8340];
  if (a1 >> 62) {
    goto LABEL_32;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (id i = v72; v5; id i = v72)
  {
    uint64_t v77 = i + 1;
    unint64_t v78 = v4 & 0xC000000000000001;
    uint64_t v8 = 4;
    *(void *)&long long v6 = 136446466;
    long long v66 = v6;
    uint64_t v64 = MEMORY[0x263F8EE58] + 8;
    uint64_t v65 = a2;
    unint64_t v74 = v4;
    uint64_t v76 = v5;
    while (1)
    {
      unint64_t v12 = v78 ? MEMORY[0x24C5A85A0](v8 - 4, v4) : *(id *)(v4 + 8 * v8);
      uint64_t v13 = v12;
      uint64_t v14 = v8 - 3;
      if (__OFADD__(v8 - 4, 1)) {
        break;
      }
      id v15 = *(void **)(a2 + 56);
      id v79 = v13;
      id v16 = objc_msgSend(v15, sel_eventForObjectID_occurrenceDate_checkValid_, v13, 0, 0, v64);
      if (v16)
      {
        id v17 = v16;
        id v18 = *(void **)(a2 + 56);
        v80[0] = 0;
        if (objc_msgSend(v18, sel_removeEvent_span_commit_error_, v17, 1, 0, v80))
        {
          id v9 = v80[0];

          id v10 = v72;
          uint64_t v11 = *v72 + 1;
          if (__OFADD__(*v72, 1)) {
            goto LABEL_30;
          }
        }
        else
        {
          id v19 = v80[0];
          uint64_t v20 = (void *)sub_2496D7AC8();

          swift_willThrow();
          if (qword_26B160270 != -1) {
            swift_once();
          }
          uint64_t v21 = sub_2496D7D88();
          uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B160698);
          uint64_t v75 = &v64;
          uint64_t v23 = *(void *)(v21 - 8);
          MEMORY[0x270FA5388](v22);
          uint64_t v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *))(v23 + 16))(v25);
          id v26 = v20;
          id v27 = v17;
          id v28 = v20;
          id v29 = v27;
          uint64_t v30 = sub_2496D7D68();
          int v73 = sub_2496D7F48();
          if (os_log_type_enabled(v30, (os_log_type_t)v73))
          {
            os_log_t v68 = v30;
            uint64_t v69 = v25;
            uint64_t v70 = v23;
            uint64_t v71 = v21;
            uint64_t v31 = swift_slowAlloc();
            uint64_t v32 = (void *)swift_slowAlloc();
            uint64_t v67 = (void *)swift_slowAlloc();
            v80[0] = v67;
            *(_DWORD *)uint64_t v31 = v66;
            uint64_t v33 = v29;
            id v34 = objc_msgSend(v29, sel_uniqueID);
            if (!v34)
            {

              __break(1u);
            }
            uint64_t v35 = v34;
            uint64_t v36 = sub_2496D7E38();
            unint64_t v38 = v37;

            *(void *)(v31 + 4) = sub_2496BA7D4(v36, v38, (uint64_t *)v80);
            unint64_t v39 = v33;

            swift_bridgeObjectRelease();
            *(_WORD *)(v31 + 12) = 2112;
            id v40 = v20;
            uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v31 + 14) = v41;
            *uint64_t v32 = v41;

            os_log_t v42 = v68;
            _os_log_impl(&dword_2496B3000, v68, (os_log_type_t)v73, "Failed to remove event for entry %{public}s: %@", (uint8_t *)v31, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B160670);
            swift_arrayDestroy();
            MEMORY[0x24C5A8E90](v32, -1, -1);
            BOOL v43 = v67;
            swift_arrayDestroy();
            MEMORY[0x24C5A8E90](v43, -1, -1);
            MEMORY[0x24C5A8E90](v31, -1, -1);

            (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v71);
            a2 = v65;
          }
          else
          {

            (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v21);
          }
          unint64_t v4 = v74;
          uint64_t v5 = v76;
          id v10 = v77;
          uint64_t v11 = *v77 + 1;
          if (__OFADD__(*v77, 1)) {
            goto LABEL_31;
          }
        }
      }
      else
      {
        if (qword_26B160270 != -1) {
          swift_once();
        }
        uint64_t v44 = sub_2496D7D88();
        __swift_project_value_buffer(v44, (uint64_t)qword_26B160698);
        uint64_t v45 = sub_2496D7D68();
        os_log_type_t v46 = sub_2496D7F48();
        if (os_log_type_enabled(v45, v46))
        {
          unsigned __int8 v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unsigned __int8 v47 = 0;
          _os_log_impl(&dword_2496B3000, v45, v46, "Couldn't turn object ID into an event", v47, 2u);
          uint64_t v48 = v47;
          unint64_t v4 = v74;
          MEMORY[0x24C5A8E90](v48, -1, -1);
          uint64_t v49 = v79;
        }
        else
        {
          uint64_t v49 = v45;
          uint64_t v45 = v79;
        }
        uint64_t v5 = v76;

        id v10 = v77;
        uint64_t v11 = *v77 + 1;
        if (__OFADD__(*v77, 1)) {
          goto LABEL_29;
        }
      }
      *id v10 = v11;
      ++v8;
      if (v14 == v5) {
        goto LABEL_33;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2496D81B8();
  }
LABEL_33:
  swift_bridgeObjectRelease();
  uint64_t v50 = *(void **)(a2 + 56);
  v80[0] = 0;
  if (objc_msgSend(v50, sel_commitWithRollback_, v80))
  {
    id v51 = v80[0];
  }
  else
  {
    id v52 = v80[0];
    uint64_t v53 = (void *)sub_2496D7AC8();

    swift_willThrow();
    if (qword_26B160270 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_2496D7D88();
    __swift_project_value_buffer(v54, (uint64_t)qword_26B160698);
    id v55 = v53;
    id v56 = v53;
    uint64_t v57 = sub_2496D7D68();
    os_log_type_t v58 = sub_2496D7F48();
    if (os_log_type_enabled(v57, v58))
    {
      id v59 = (uint8_t *)swift_slowAlloc();
      id v60 = (void *)swift_slowAlloc();
      *(_DWORD *)id v59 = 138412290;
      id v61 = v53;
      uint64_t v62 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v80[0] = v62;
      sub_2496D7FC8();
      *id v60 = v62;

      _os_log_impl(&dword_2496B3000, v57, v58, "Failed to commit removals: %@", v59, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B160670);
      swift_arrayDestroy();
      MEMORY[0x24C5A8E90](v60, -1, -1);
      MEMORY[0x24C5A8E90](v59, -1, -1);
    }
    else
    {
    }
    sub_2496D7630();
    swift_allocError();
    *os_log_type_t v63 = 2;
    swift_willThrow();
  }
}

void sub_2496D456C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v49[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = type metadata accessor for IntegrationEntry(0);
  uint64_t v45 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    uint64_t v48 = (void *)a3;
    uint64_t v13 = a2[5];
    uint64_t v12 = a2[6];
    __swift_project_boxed_opaque_existential_1(a2 + 2, v13);
    (*(void (**)(uint64_t, uint64_t))(v12 + 40))(v13, v12);
    if (v4) {
      return;
    }
    uint64_t v14 = a2[5];
    uint64_t v15 = a2[6];
    __swift_project_boxed_opaque_existential_1(a2 + 2, v14);
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    id v17 = (void *)a2[7];
    a2[7] = v16;

    swift_beginAccess();
    a2[8] = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    a3 = (uint64_t)v48;
  }
  if (__OFADD__(a1, a3))
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (*(void *)(a4 + 16) >= a1 + a3) {
    a3 += a1;
  }
  else {
    a3 = *(void *)(a4 + 16);
  }
  uint64_t v18 = a2[18];
  uint64_t v19 = a2[19];
  uint64_t v20 = __swift_project_boxed_opaque_existential_1(a2 + 15, v18);
  if (a3 < a1) {
    goto LABEL_29;
  }
  if (a1 < 0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v47 = v18;
  uint64_t v48 = v20;
  uint64_t v46 = v19;
  sub_2496D8268();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v21 = swift_dynamicCastClass();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
  }
  uint64_t v22 = *(void *)(v21 + 16);
  swift_release();
  if (v22 == a3 - a1)
  {
    uint64_t v23 = swift_dynamicCastClass();
    uint64_t v25 = v46;
    uint64_t v24 = v47;
    if (!v23)
    {
      swift_bridgeObjectRelease();
      uint64_t v23 = MEMORY[0x263F8EE78];
    }
    goto LABEL_15;
  }
LABEL_31:
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_2496BBBA4(a4, a4 + 32, a1, (2 * a3) | 1);
  uint64_t v25 = v46;
  uint64_t v24 = v47;
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v23, v24, v25);
  swift_release();
  if (!v4)
  {
    uint64_t v27 = *(void *)(v26 + 16);
    if (v27)
    {
      uint64_t v28 = v26 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80));
      uint64_t v29 = *(void *)(v45 + 72);
      do
      {
        sub_2496D76E0(v28, (uint64_t)v11, type metadata accessor for IntegrationEntry);
        sub_2496D1D78(v11);
        sub_2496D7748((uint64_t)v11, type metadata accessor for IntegrationEntry);
        v28 += v29;
        --v27;
      }
      while (v27);
    }
    swift_bridgeObjectRelease();
    uint64_t v30 = (void *)a2[7];
    v49[0] = 0;
    if (objc_msgSend(v30, sel_commitWithRollback_, v49))
    {
      id v31 = v49[0];
    }
    else
    {
      id v32 = v49[0];
      uint64_t v33 = (void *)sub_2496D7AC8();

      swift_willThrow();
      if (qword_26B160270 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_2496D7D88();
      __swift_project_value_buffer(v34, (uint64_t)qword_26B160698);
      id v35 = v33;
      id v36 = v33;
      unint64_t v37 = sub_2496D7D68();
      os_log_type_t v38 = sub_2496D7F48();
      if (os_log_type_enabled(v37, v38))
      {
        unint64_t v39 = (uint8_t *)swift_slowAlloc();
        id v40 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v39 = 138412290;
        id v41 = v33;
        os_log_t v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v49[0] = v42;
        sub_2496D7FC8();
        *id v40 = v42;

        _os_log_impl(&dword_2496B3000, v37, v38, "Failed to commit changes to event store: %@", v39, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B160670);
        swift_arrayDestroy();
        MEMORY[0x24C5A8E90](v40, -1, -1);
        MEMORY[0x24C5A8E90](v39, -1, -1);
      }
      else
      {
      }
      sub_2496D7630();
      swift_allocError();
      *BOOL v43 = 2;
      swift_willThrow();
    }
  }
}

char *sub_2496D4ADC(uint64_t a1)
{
  uint64_t v3 = v1;
  v35[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(v3 + 144);
  uint64_t v6 = *(void *)(v3 + 152);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 120), v5);
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
  if (!v2)
  {
    uint64_t v8 = *((void *)result + 2);
    if (v8)
    {
      char v9 = 0;
      uint64_t v10 = 0;
      uint64_t v31 = -v8;
      id v32 = result;
      uint64_t v11 = result + 72;
      uint64_t v33 = v3;
      uint64_t v29 = result + 72;
LABEL_5:
      char v30 = v9;
      uint64_t v12 = (unint64_t *)&v11[48 * v10];
      uint64_t v13 = v10 + 1;
      do
      {
        if ((unint64_t)(v13 - 1) >= *((void *)result + 2)) {
          __break(1u);
        }
        uint64_t v15 = *(v12 - 1);
        unint64_t v14 = *v12;
        uint64_t v34 = v13;
        id v16 = *(id *)(v3 + 56);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v17 = v15;
        uint64_t v18 = v15;
        unint64_t v19 = v14;
        sub_2496BBA60(v18, v14);
        uint64_t v20 = (void *)sub_2496D7E28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v21 = (void *)sub_2496D7E28();
        swift_bridgeObjectRelease();
        id v22 = objc_msgSend(v16, sel_colorWithProviderIdentifier_externalIdentifier_, v20, v21);

        if (v22)
        {
          uint64_t v23 = (void *)sub_2496D7B38();
          objc_msgSend(v22, sel_setData_, v23);

          uint64_t v24 = *(void **)(v33 + 56);
          v35[0] = 0;
          if ((objc_msgSend(v24, sel_saveColor_commit_error_, v22, 0, v35) & 1) == 0)
          {
            id v28 = v35[0];
            swift_bridgeObjectRelease();
            sub_2496D7AC8();

            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            return (char *)sub_2496C5970(v17, v19);
          }
          uint64_t v10 = v34;
          id v25 = v35[0];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          sub_2496C5970(v17, v19);
          char v9 = 1;
          uint64_t result = v32;
          uint64_t v3 = v33;
          uint64_t v11 = v29;
          if (v31 + v34) {
            goto LABEL_5;
          }
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2496C5970(v17, v19);
        uint64_t v3 = v33;
        uint64_t v13 = v34 + 1;
        uint64_t result = v32;
        v12 += 6;
      }
      while (v31 + v34 + 1 != 1);
      uint64_t result = (char *)swift_bridgeObjectRelease();
      if (v30)
      {
LABEL_14:
        uint64_t v26 = *(void **)(v3 + 56);
        v35[0] = 0;
        if (objc_msgSend(v26, sel_commitWithRollback_, v35, v29))
        {
          return (char *)v35[0];
        }
        else
        {
          id v27 = v35[0];
          sub_2496D7AC8();

          return (char *)swift_willThrow();
        }
      }
    }
    else
    {
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t IntegrationCollectionSync.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_bridgeObjectRelease();
  sub_2496BB05C(v0 + 72);
  return v0;
}

uint64_t IntegrationCollectionSync.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_bridgeObjectRelease();
  sub_2496BB05C(v0 + 72);
  return MEMORY[0x270FA0228](v0, 160, 7);
}

id sub_2496D4EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  if (a3)
  {
    sub_2496BC414(0, &qword_2696CABC8);
    id v16 = (void *)sub_2496D7E78();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = 0;
    if (a4)
    {
LABEL_3:
      sub_2496BC414(0, &qword_2696CAB08);
      uint64_t v17 = (void *)sub_2496D7E78();
      swift_bridgeObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  uint64_t v17 = 0;
  if (a5)
  {
LABEL_4:
    sub_2496BC414(0, &qword_2696CAB08);
    uint64_t v18 = (void *)sub_2496D7E78();
    swift_bridgeObjectRelease();
    if (a6) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v18 = 0;
  if (a6)
  {
LABEL_5:
    sub_2496BC414(0, &qword_2696CAB08);
    unint64_t v19 = (void *)sub_2496D7E78();
    swift_bridgeObjectRelease();
    if (a7) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v20 = 0;
    uint64_t v21 = a9;
    if (a8) {
      goto LABEL_7;
    }
LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
LABEL_11:
  unint64_t v19 = 0;
  if (!a7) {
    goto LABEL_12;
  }
LABEL_6:
  sub_2496BC414(0, &qword_2696CAB08);
  uint64_t v20 = (void *)sub_2496D7E78();
  swift_bridgeObjectRelease();
  uint64_t v21 = a9;
  if (!a8) {
    goto LABEL_13;
  }
LABEL_7:
  sub_2496BC414(0, &qword_2696CAB08);
  id v22 = (void *)sub_2496D7E78();
  swift_bridgeObjectRelease();
LABEL_14:
  id v23 = objc_msgSend(v25, sel_initRecurrenceWithFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, v16, v17, v18, v19, v20, v22, v21);

  return v23;
}

unint64_t sub_2496D50EC(uint64_t a1, uint64_t a2)
{
  sub_2496D82D8();
  sub_2496D82F8();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2496D7E48();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = sub_2496D8308();
  return sub_2496D6134(a1, a2, v4);
}

unint64_t sub_2496D5190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2496D82D8();
  sub_2496D7E48();
  sub_2496D7E48();
  uint64_t v8 = sub_2496D8308();
  return sub_2496D6200(a1, a2, a3, a4, v8);
}

unint64_t sub_2496D5230(uint64_t a1, uint64_t a2)
{
  sub_2496D82D8();
  sub_2496D7E48();
  uint64_t v4 = sub_2496D8308();
  return sub_2496D6300(a1, a2, v4);
}

unint64_t sub_2496D52A8(uint64_t a1)
{
  uint64_t v2 = sub_2496D7F98();
  return sub_2496D63E4(a1, v2);
}

uint64_t sub_2496D52EC(uint64_t a1, char a2)
{
  return sub_2496D52F8(a1, a2, &qword_26B160358);
}

uint64_t sub_2496D52F8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v7 = sub_2496D81D8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_42;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v35 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v33 = v3;
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v18 >= v34) {
      break;
    }
    unint64_t v19 = (void *)(v6 + 64);
    unint64_t v20 = *(void *)(v35 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v34) {
        goto LABEL_35;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v34)
        {
LABEL_35:
          swift_release();
          uint64_t v4 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_42;
          }
          goto LABEL_38;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_44;
            }
            if (v14 >= v34) {
              goto LABEL_35;
            }
            unint64_t v20 = *(void *)(v35 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    id v22 = *(void **)(*(void *)(v6 + 56) + 8 * v17);
    long long v36 = *(_OWORD *)(*(void *)(v6 + 48) + 16 * v17);
    uint64_t v23 = *(void *)(*(void *)(v6 + 48) + 16 * v17 + 8);
    if ((a2 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v24 = v22;
    }
    sub_2496D82D8();
    sub_2496D82F8();
    if (v23)
    {
      swift_bridgeObjectRetain();
      sub_2496D7E48();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_2496D8308();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_OWORD *)(*(void *)(v8 + 48) + 16 * v15) = v36;
    *(void *)(*(void *)(v8 + 56) + 8 * v15) = v22;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v33;
  unint64_t v19 = (void *)(v6 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v32 = 1 << *(unsigned char *)(v6 + 32);
  if (v32 >= 64) {
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v32;
  }
  *(void *)(v6 + 16) = 0;
LABEL_42:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_2496D5624(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160688);
  char v42 = a2;
  uint64_t v6 = sub_2496D81D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v40 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  os_log_type_t v38 = v2;
  int64_t v39 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  for (i = v5; ; uint64_t v5 = i)
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
    if (v21 >= v39) {
      break;
    }
    id v22 = v40;
    unint64_t v23 = v40[v21];
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v39) {
        goto LABEL_33;
      }
      unint64_t v23 = v40[v13];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v38;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v39) {
              goto LABEL_33;
            }
            unint64_t v23 = v40[v13];
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
    unint64_t v29 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
    BOOL v30 = (uint64_t *)(*(void *)(v5 + 56) + 48 * v20);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    uint64_t v33 = v30[3];
    uint64_t v43 = v30[2];
    uint64_t v34 = v30[4];
    unint64_t v35 = v30[5];
    if ((v42 & 1) == 0)
    {
      id v36 = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496BBA60(v34, v35);
    }
    uint64_t result = sub_2496D7F98();
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
    *(void *)(*(void *)(v7 + 48) + 8 * v17) = v29;
    int64_t v18 = (void *)(*(void *)(v7 + 56) + 48 * v17);
    *int64_t v18 = v31;
    v18[1] = v32;
    v18[2] = v43;
    v18[3] = v33;
    v18[4] = v34;
    v18[5] = v35;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v38;
  id v22 = v40;
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v37;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2496D5958(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B160678);
  char v39 = a2;
  uint64_t v6 = sub_2496D81D8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v37 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v36) {
          goto LABEL_33;
        }
        unint64_t v22 = v37[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v22 = v37[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v39)
              {
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 >= 64) {
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v22 = v37[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 48) + 32 * v20);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      uint64_t v32 = v28[2];
      uint64_t v31 = v28[3];
      uint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v34 = v33;
      }
      sub_2496D82D8();
      sub_2496D7E48();
      sub_2496D7E48();
      uint64_t result = sub_2496D8308();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      int64_t v18 = (void *)(*(void *)(v7 + 48) + 32 * v17);
      *int64_t v18 = v30;
      v18[1] = v29;
      v18[2] = v32;
      v18[3] = v31;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_2496D5C80(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2496D50EC(a2, a3);
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
    sub_2496D650C(&qword_26B160360);
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2496D52F8(v15, a4 & 1, &qword_26B160360);
  unint64_t v20 = sub_2496D50EC(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CAAE0);
    sub_2496D8288();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
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

id sub_2496D5E04(long long *a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_2496D52A8((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2496D66B4();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7] + 48 * v9;
      return (id)sub_2496D7684((uint64_t)a1, v16);
    }
    goto LABEL_13;
  }
  sub_2496D5624(v12, a3 & 1);
  unint64_t v18 = sub_2496D52A8((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_19:
    sub_2496BC414(0, &qword_26B1602C8);
    id result = (id)sub_2496D8288();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_13:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  *(void *)(v15[6] + 8 * v9) = a2;
  unint64_t v20 = (_OWORD *)(v15[7] + 48 * v9);
  long long v21 = *a1;
  long long v22 = a1[2];
  v20[1] = a1[1];
  id v20[2] = v22;
  *unint64_t v20 = v21;
  uint64_t v23 = v15[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v15[2] = v25;
  return a2;
}

void sub_2496D5F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_2496D5190(a2, a3, a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_2496D68AC();
LABEL_7:
    long long v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];

      *(void *)(v23 + 8 * v16) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2496D5958(v19, a6 & 1);
  unint64_t v24 = sub_2496D5190(a2, a3, a4, a5);
  if ((v20 & 1) != (v25 & 1))
  {
LABEL_17:
    sub_2496D8288();
    __break(1u);
    return;
  }
  unint64_t v16 = v24;
  long long v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  BOOL v26 = (uint64_t *)(v22[6] + 32 * v16);
  *BOOL v26 = a2;
  v26[1] = a3;
  v26[2] = a4;
  v26[3] = a5;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v27 = v22[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

unint64_t sub_2496D6134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = ~v5;
    uint64_t v10 = *(void *)(v3 + 48);
    do
    {
      BOOL v11 = (void *)(v10 + 16 * v6);
      uint64_t v12 = v11[1];
      if (v12)
      {
        if (a2)
        {
          BOOL v13 = *v11 == a1 && v12 == a2;
          if (v13 || (sub_2496D8258() & 1) != 0) {
            return v6;
          }
        }
      }
      else if (!a2)
      {
        return v6;
      }
      unint64_t v6 = (v6 + 1) & v9;
    }
    while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

unint64_t sub_2496D6200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = a5 & ~v7;
  if ((*(void *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = *(void *)(v5 + 48);
    do
    {
      char v15 = (void *)(v14 + 32 * v8);
      uint64_t v16 = v15[2];
      uint64_t v17 = v15[3];
      BOOL v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_2496D8258() & 1) != 0)
      {
        BOOL v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_2496D8258() & 1) != 0) {
          break;
        }
      }
      unint64_t v8 = (v8 + 1) & v13;
    }
    while (((*(void *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_2496D6300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2496D8258() & 1) == 0)
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
      while (!v14 && (sub_2496D8258() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2496D63E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_2496BC414(0, &qword_26B1602C8);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_2496D7FA8();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_2496D7FA8();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_2496D6500()
{
  return sub_2496D650C(&qword_26B160358);
}

id sub_2496D650C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2496D81C8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
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
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = *(void **)(*(void *)(v3 + 56) + 8 * v16);
    *(_OWORD *)(*(void *)(v5 + 48) + 16 * v16) = *(_OWORD *)(*(void *)(v3 + 48) + 16 * v16);
    *(void *)(*(void *)(v5 + 56) + 8 * v16) = v17;
    swift_bridgeObjectRetain();
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2496D66B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160688);
  uint64_t v30 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_2496D81C8();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v30 = v3;
    return result;
  }
  id result = (void *)(v2 + 64);
  uint64_t v5 = v1 + 64;
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6) {
    id result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  }
  int64_t v8 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v12) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v5 + 8 * v27);
    ++v8;
    if (!v28)
    {
      int64_t v8 = v27 + 1;
      if (v27 + 1 >= v12) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v5 + 8 * v8);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v28 - 1) & v28;
    unint64_t v14 = __clz(__rbit64(v28)) + (v8 << 6);
LABEL_12:
    uint64_t v15 = 8 * v14;
    unint64_t v16 = *(void **)(*(void *)(v1 + 48) + 8 * v14);
    uint64_t v17 = 48 * v14;
    int64_t v18 = (uint64_t *)(*(void *)(v1 + 56) + v17);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    uint64_t v23 = v18[4];
    unint64_t v24 = v18[5];
    *(void *)(*(void *)(v3 + 48) + v15) = v16;
    char v25 = (void *)(*(void *)(v3 + 56) + v17);
    *char v25 = v19;
    v25[1] = v20;
    v25[2] = v21;
    v25[3] = v22;
    v25[4] = v23;
    v25[5] = v24;
    id v26 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)sub_2496BBA60(v23, v24);
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v12) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v5 + 8 * v29);
  if (v28)
  {
    int64_t v8 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v5 + 8 * v8);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2496D68AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B160678);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2496D81C8();
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 32 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void **)(*(void *)(v2 + 56) + v21);
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(void *)(*(void *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = v22;
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2496D6A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[3] = a3;
  v14[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(void *)(a2 + 64) = sub_2496B8710(MEMORY[0x263F8EE78]);
  sub_2496B637C((uint64_t)v14, a2 + 16);
  *(void *)(a2 + 56) = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(a4 + 16))(v12, a3, a4);
  long long v9 = v12[3];
  *(_OWORD *)(a2 + 104) = v12[2];
  *(_OWORD *)(a2 + 120) = v9;
  *(_OWORD *)(a2 + 136) = v12[4];
  *(void *)(a2 + 152) = v13;
  long long v10 = v12[1];
  *(_OWORD *)(a2 + 72) = v12[0];
  *(_OWORD *)(a2 + 88) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return a2;
}

uint64_t sub_2496D6B90(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2496D7EE8();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2496BAE2C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

id sub_2496D6C28(unsigned __int8 *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160608);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (uint64_t *)((char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  long long v10 = (char *)&v40 - v9;
  id result = (id)*a1;
  uint64_t v12 = 0;
  switch(*a1)
  {
    case 1u:
      goto LABEL_5;
    case 2u:
      uint64_t v12 = 1;
      goto LABEL_5;
    case 3u:
      uint64_t v12 = 2;
      goto LABEL_5;
    case 4u:
      uint64_t v12 = 3;
LABEL_5:
      uint64_t v43 = v8;
      uint64_t v45 = v3;
      uint64_t v13 = (int *)type metadata accessor for IntegrationRecurrence(0);
      uint64_t v14 = *(void *)&a1[v13[8]];
      if (v14)
      {
        uint64_t v15 = MEMORY[0x263F8EE78];
        uint64_t v47 = MEMORY[0x263F8EE78];
        uint64_t v16 = *(void *)(v14 + 16);
        if (v16)
        {
          uint64_t v44 = v4;
          uint64_t v46 = v7;
          id v41 = v10;
          uint64_t v42 = v12;
          swift_bridgeObjectRetain();
          uint64_t v17 = (void *)(v14 + 40);
          do
          {
            id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC0]), sel_initWithDayOfTheWeek_weekNumber_, *((unsigned __int8 *)v17 - 8) + 1, *v17);
            MEMORY[0x24C5A8390]();
            if (*(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2496D7EB8();
            }
            v17 += 2;
            sub_2496D7EC8();
            sub_2496D7EA8();

            --v16;
          }
          while (v16);
          swift_bridgeObjectRelease();
          uint64_t v7 = v46;
          uint64_t v15 = v47;
          long long v10 = v41;
          uint64_t v12 = v42;
          uint64_t v4 = v44;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      uint64_t v19 = *(void *)&a1[v13[9]];
      if (v19) {
        uint64_t v20 = sub_2496D2B20(v19);
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v21 = *(void *)&a1[v13[12]];
      if (v21) {
        uint64_t v46 = (void *)sub_2496D2B20(v21);
      }
      else {
        uint64_t v46 = 0;
      }
      uint64_t v22 = *(void *)&a1[v13[11]];
      if (v22) {
        uint64_t v44 = sub_2496D2B20(v22);
      }
      else {
        uint64_t v44 = 0;
      }
      uint64_t v23 = *(void *)&a1[v13[10]];
      if (v23) {
        uint64_t v24 = sub_2496D2B20(v23);
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v25 = *(void *)&a1[v13[13]];
      if (v25) {
        uint64_t v26 = sub_2496D2B20(v25);
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v27 = (uint64_t)&a1[v13[6]];
      uint64_t v28 = (uint64_t)v45;
      sub_2496CBA9C(v27, (uint64_t)v45, &qword_26B160608);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v43[6])(v28, 1, v4) == 1)
      {
        sub_2496C5A30(v28, &qword_26B160608);
        id v29 = 0;
      }
      else
      {
        sub_2496CBB64(v28, (uint64_t)v10, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        sub_2496D76E0((uint64_t)v10, (uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithOccurrenceCount_, *v7);
          sub_2496D7748((uint64_t)v10, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        }
        else
        {
          uint64_t v45 = (char *)v20;
          id v41 = v10;
          uint64_t v42 = v12;
          uint64_t v30 = sub_2496D7BA8();
          uint64_t v43 = &v40;
          uint64_t v31 = *(void *)(v30 - 8);
          MEMORY[0x270FA5388](v30);
          uint64_t v33 = (char *)&v40 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *, void *, uint64_t))(v31 + 32))(v33, v7, v30);
          uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1605E0);
          MEMORY[0x270FA5388](v34 - 8);
          int64_t v36 = (char *)&v40 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v36, v33, v30);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v36, 0, 1, v30);
          uint64_t v37 = 0;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v36, 1, v30) != 1)
          {
            uint64_t v37 = (void *)sub_2496D7B78();
            (*(void (**)(char *, uint64_t))(v31 + 8))(v36, v30);
          }
          id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithEndDate_, v37);

          (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
          sub_2496D7748((uint64_t)v41, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
          uint64_t v12 = v42;
          uint64_t v20 = (uint64_t)v45;
        }
      }
      uint64_t v38 = *((void *)a1 + 1);
      id v39 = objc_allocWithZone(MEMORY[0x263F04BD8]);
      id result = sub_2496D4EC0(v12, v38, v15, v20, (uint64_t)v46, v44, v24, v26, v29);
      break;
    default:
      return result;
  }
  return result;
}

id sub_2496D724C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160628);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IntegrationRecurrence(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (unsigned __int8 *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496CBA9C(a1, (uint64_t)v4, &qword_26B160628);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2496C5A30((uint64_t)v4, &qword_26B160628);
    return 0;
  }
  else
  {
    sub_2496CBB64((uint64_t)v4, (uint64_t)v8, type metadata accessor for IntegrationRecurrence);
    id v9 = sub_2496D6C28(v8);
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1603B8);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_2496DA7E0;
      *(void *)(v10 + 32) = v9;
      uint64_t v13 = (void *)v10;
      sub_2496D7EA8();
      id v9 = v13;
    }
    sub_2496D7748((uint64_t)v8, type metadata accessor for IntegrationRecurrence);
  }
  return v9;
}

uint64_t sub_2496D741C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IntegrationCollectionSync();
  uint64_t v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2496D6A78((uint64_t)v9, v10, a3, a4);
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.eventStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.collection.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.allCalendars.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.calendar(forPersona:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.refreshEventKit()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata accessor for IntegrationCollectionSync()
{
  return self;
}

uint64_t method lookup function for IntegrationCollectionSync(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntegrationCollectionSync);
}

uint64_t dispatch thunk of IntegrationCollectionSync.__allocating_init(syncDataProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of IntegrationCollectionSync.sync()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

unint64_t sub_2496D7630()
{
  unint64_t result = qword_2696CABB8;
  if (!qword_2696CABB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CABB8);
  }
  return result;
}

uint64_t sub_2496D7684(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2496D76E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2496D7748(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
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

uint64_t getEnumTagSinglePayload for IntegrationCollectionSync.SyncError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IntegrationCollectionSync.SyncError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2496D7968);
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

ValueMetadata *type metadata accessor for IntegrationCollectionSync.SyncError()
{
  return &type metadata for IntegrationCollectionSync.SyncError;
}

unint64_t sub_2496D79A4()
{
  unint64_t result = qword_2696CABD0;
  if (!qword_2696CABD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CABD0);
  }
  return result;
}

uint64_t sub_2496D79F8()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_2496D7A08()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_2496D7A18()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_2496D7A28()
{
  return MEMORY[0x270EEE758]();
}

uint64_t sub_2496D7A38()
{
  return MEMORY[0x270EEE7C0]();
}

uint64_t sub_2496D7A48()
{
  return MEMORY[0x270EEE8D0]();
}

uint64_t sub_2496D7A58()
{
  return MEMORY[0x270EEE8F0]();
}

uint64_t sub_2496D7A68()
{
  return MEMORY[0x270EEF230]();
}

uint64_t sub_2496D7A78()
{
  return MEMORY[0x270EEF258]();
}

uint64_t sub_2496D7A88()
{
  return MEMORY[0x270EEF260]();
}

uint64_t sub_2496D7A98()
{
  return MEMORY[0x270EEF280]();
}

uint64_t sub_2496D7AA8()
{
  return MEMORY[0x270EEF2B0]();
}

uint64_t sub_2496D7AB8()
{
  return MEMORY[0x270EEF2C0]();
}

uint64_t sub_2496D7AC8()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2496D7AD8()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_2496D7AE8()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_2496D7AF8()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_2496D7B08()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_2496D7B18()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_2496D7B28()
{
  return MEMORY[0x270EF0058]();
}

uint64_t sub_2496D7B38()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_2496D7B48()
{
  return MEMORY[0x270EF0138]();
}

uint64_t sub_2496D7B58()
{
  return MEMORY[0x270EF0188]();
}

uint64_t sub_2496D7B68()
{
  return MEMORY[0x270EF02B8]();
}

uint64_t sub_2496D7B78()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_2496D7B88()
{
  return MEMORY[0x270EF0B90]();
}

uint64_t sub_2496D7B98()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_2496D7BA8()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_2496D7BB8()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_2496D7BC8()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_2496D7BD8()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_2496D7BE8()
{
  return MEMORY[0x270EF10C0]();
}

uint64_t sub_2496D7BF8()
{
  return MEMORY[0x270EF10D0]();
}

uint64_t sub_2496D7C08()
{
  return MEMORY[0x270EF1370]();
}

uint64_t sub_2496D7C18()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_2496D7C28()
{
  return MEMORY[0x270EF15C0]();
}

uint64_t sub_2496D7C38()
{
  return MEMORY[0x270EF1610]();
}

uint64_t sub_2496D7C48()
{
  return MEMORY[0x270F5A5B0]();
}

uint64_t sub_2496D7C58()
{
  return MEMORY[0x270F5A0C8]();
}

uint64_t sub_2496D7C68()
{
  return MEMORY[0x270F5A0F0]();
}

uint64_t sub_2496D7C78()
{
  return MEMORY[0x270F5A0F8]();
}

uint64_t sub_2496D7C88()
{
  return MEMORY[0x270F5A100]();
}

uint64_t sub_2496D7C98()
{
  return MEMORY[0x270F5A108]();
}

uint64_t sub_2496D7CA8()
{
  return MEMORY[0x270F5A110]();
}

uint64_t sub_2496D7CB8()
{
  return MEMORY[0x270F5A118]();
}

uint64_t sub_2496D7CC8()
{
  return MEMORY[0x270F5A120]();
}

uint64_t sub_2496D7CD8()
{
  return MEMORY[0x270F5A128]();
}

uint64_t sub_2496D7CE8()
{
  return MEMORY[0x270F5A130]();
}

uint64_t sub_2496D7CF8()
{
  return MEMORY[0x270F5A138]();
}

uint64_t sub_2496D7D08()
{
  return MEMORY[0x270F5A140]();
}

uint64_t sub_2496D7D18()
{
  return MEMORY[0x270F5A148]();
}

uint64_t sub_2496D7D28()
{
  return MEMORY[0x270F5A150]();
}

uint64_t sub_2496D7D38()
{
  return MEMORY[0x270F5A268]();
}

uint64_t sub_2496D7D48()
{
  return MEMORY[0x270F5A278]();
}

uint64_t sub_2496D7D58()
{
  return MEMORY[0x270F5A280]();
}

uint64_t sub_2496D7D68()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_2496D7D78()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t sub_2496D7D88()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_2496D7D98()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_2496D7DA8()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_2496D7DB8()
{
  return MEMORY[0x270FA0BA0]();
}

uint64_t sub_2496D7DC8()
{
  return MEMORY[0x270FA0BF8]();
}

uint64_t sub_2496D7DD8()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_2496D7DE8()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_2496D7DF8()
{
  return MEMORY[0x270F9D110]();
}

uint64_t sub_2496D7E08()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2496D7E18()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2496D7E28()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_2496D7E38()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2496D7E48()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2496D7E58()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2496D7E68()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2496D7E78()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2496D7E88()
{
  return MEMORY[0x270EF1BA0]();
}

uint64_t sub_2496D7E98()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_2496D7EA8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2496D7EB8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2496D7EC8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2496D7ED8()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_2496D7EE8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2496D7EF8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2496D7F08()
{
  return MEMORY[0x270EF1CE8]();
}

uint64_t sub_2496D7F18()
{
  return MEMORY[0x270EF1D00]();
}

uint64_t sub_2496D7F28()
{
  return MEMORY[0x270EEB658]();
}

uint64_t sub_2496D7F38()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_2496D7F48()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_2496D7F58()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t sub_2496D7F68()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_2496D7F78()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_2496D7F88()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_2496D7F98()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_2496D7FA8()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_2496D7FB8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2496D7FC8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2496D7FD8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2496D7FE8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2496D7FF8()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_2496D8008()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2496D8018()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2496D8028()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2496D8038()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2496D8048()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2496D8058()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2496D8068()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2496D8078()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2496D8088()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2496D8098()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2496D80A8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2496D80B8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2496D80C8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2496D80D8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2496D80E8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2496D80F8()
{
  return MEMORY[0x270F9EF48]();
}

uint64_t sub_2496D8108()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2496D8118()
{
  return MEMORY[0x270F9EF60]();
}

uint64_t sub_2496D8128()
{
  return MEMORY[0x270F9EF68]();
}

uint64_t sub_2496D8138()
{
  return MEMORY[0x270F9EF78]();
}

uint64_t sub_2496D8148()
{
  return MEMORY[0x270F9EF80]();
}

uint64_t sub_2496D8158()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_2496D8168()
{
  return MEMORY[0x270F9EF90]();
}

uint64_t sub_2496D8178()
{
  return MEMORY[0x270F9EFA8]();
}

uint64_t sub_2496D8188()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2496D8198()
{
  return MEMORY[0x270F9EFE0]();
}

uint64_t sub_2496D81A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2496D81B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2496D81C8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2496D81D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2496D81E8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2496D81F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2496D8208()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2496D8218()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_2496D8228()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2496D8238()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_2496D8248()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2496D8258()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2496D8268()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2496D8278()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2496D8288()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2496D8298()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2496D82A8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2496D82B8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2496D82C8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2496D82D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2496D82E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2496D82F8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2496D8308()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2496D8318()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2496D8328()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t REMReminderDefaultPriorityForPriorityLevel()
{
  return MEMORY[0x270F59AE8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3B8]();
}

{
  return MEMORY[0x270F9A3D0]();
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

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA460](__s1, __s2, __n);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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