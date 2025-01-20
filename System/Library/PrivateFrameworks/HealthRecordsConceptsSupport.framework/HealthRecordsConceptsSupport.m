uint64_t getEnumTagSinglePayload for ListConceptManagerState(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t destroy for UserDomainConceptChange()
{
  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for UserDomainConceptChange(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ListConceptManagerState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void sub_1C1EFCD04(uint64_t a1, uint64_t a2)
{
  sub_1C1F00A18(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

void sub_1C1EFCD0C(uint64_t a1, uint64_t a2)
{
  sub_1C1F00690(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t storeEnumTagSinglePayload for UserDomainConceptChange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t UserDomainConceptChangeProvider.udcChangesSubject.getter()
{
  return swift_retain();
}

uint64_t sub_1C1EFCD68(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserDomainConceptChange()
{
  return &type metadata for UserDomainConceptChange;
}

BOOL sub_1C1EFCD90(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 56) & 1) == 0;
}

uint64_t sub_1C1EFCDA0()
{
  return sub_1C1EFD49C();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1C1EFCDB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1C1F087B8() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1C1F08C28();
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ListConceptManagerState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t ListConceptManager.__deallocating_deinit()
{
  ListConceptManager.deinit();
  return MEMORY[0x1F4186488](v0, 136, 7);
}

uint64_t HKHealthStore.makeUDCListsPublisher(for:)(uint64_t a1)
{
  sub_1C1F00ED4();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = v1;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C1EFFE2C(0, &qword_1EBB7F768, MEMORY[0x1E4F1AAE0]);
  sub_1C1EFFED0(&qword_1EBB7F760, &qword_1EBB7F768, v9);
  id v10 = v1;
  sub_1C1F088C8();
  sub_1C1F00078(&qword_1EBB7F4B0, (void (*)(uint64_t))sub_1C1F00ED4);
  uint64_t v11 = sub_1C1F088E8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

uint64_t sub_1C1EFD180(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for UserDomainConceptChange(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

BOOL sub_1C1EFD200()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

uint64_t sub_1C1EFD278()
{
  return sub_1C1EFD294();
}

uint64_t sub_1C1EFD294()
{
  return sub_1C1F08A08();
}

uint64_t HKListUserDomainConcept.linkElements<A>(from:)()
{
  id v1 = objc_msgSend(v0, sel_linkCollection);
  if (!v1) {
    return sub_1C1F08A88();
  }
  char v2 = v1;
  id v3 = objc_msgSend(v1, sel_links);

  sub_1C1F00D44(0, &qword_1EBB7F838);
  sub_1C1F08A48();

  MEMORY[0x1F4188790](v4);
  sub_1C1F00E6C(0, &qword_1EBB7F4C0, &qword_1EBB7F838, 0x1E4F2B640, MEMORY[0x1E4FBB320]);
  sub_1C1F00DE8();
  uint64_t v5 = sub_1C1F089F8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C1EFD49C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1C1EFF128();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1EFD4F4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v5 = objc_msgSend(self, sel_predicateForListUserDomainConceptWithListType_, a1);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = a2;
  v7 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AC28];
  sub_1C1EFFE2C(0, &qword_1EBB7F798, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  id v8 = v5;
  id v9 = a2;
  sub_1C1F088B8();
  sub_1C1EFFED0(&qword_1EBB7F790, &qword_1EBB7F798, v7);
  uint64_t v10 = sub_1C1F088E8();

  uint64_t result = swift_release();
  *a3 = v10;
  return result;
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void *static ListConceptManager.pinnedLabs(for:udcChangeProvider:)(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (id)HKStringFromListUserDomainType();
  uint64_t v5 = sub_1C1F089B8();
  uint64_t v7 = v6;

  type metadata accessor for ListConceptManager();
  id v8 = (void *)swift_allocObject();
  id v9 = a2;
  return sub_1C1EFE8DC(v3, 1, v5, v7, v9, 0, v8);
}

uint64_t type metadata accessor for ListConceptManager()
{
  return self;
}

uint64_t sub_1C1EFD74C(id *a1)
{
  return sub_1C1EFD76C(a1, *(void **)(v1 + 24)) & 1;
}

uint64_t sub_1C1EFD76C(id *a1, void *a2)
{
  uint64_t v4 = sub_1C1F087B8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  id v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v15 - v9;
  id v11 = objc_msgSend(*a1, sel_UUID);
  sub_1C1F087A8();

  id v12 = objc_msgSend(a2, sel_targetUUID);
  sub_1C1F087A8();

  LOBYTE(v12) = sub_1C1F08798();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, v4);
  v13(v10, v4);
  return v12 & 1;
}

uint64_t destroy for ListConceptManagerState(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ListConceptManagerState(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *UserDomainConceptChangeProvider.__allocating_init(with:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B688]), sel_initWithHealthStore_, a1);
  id v3 = objc_allocWithZone((Class)type metadata accessor for UserDomainConceptChangeProvider());
  uint64_t v4 = UserDomainConceptChangeProvider.init(conceptStore:)(v2);

  return v4;
}

char *UserDomainConceptChangeProvider.init(conceptStore:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcChangesSubject;
  uint64_t v12 = 0;
  char v13 = 3;
  sub_1C1EFDB1C();
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_1C1F08888();
  *(void *)&v4[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcStore] = a1;
  id v5 = a1;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for UserDomainConceptChangeProvider();
  id v6 = (char *)objc_msgSendSuper2(&v11, sel_init);
  uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcStore];
  id v8 = v6;
  id v9 = v7;
  objc_msgSend(v9, sel_setDelegate_, v8);

  return v8;
}

uint64_t type metadata accessor for UserDomainConceptChangeProvider()
{
  return self;
}

void sub_1C1EFDB1C()
{
  if (!qword_1EBB7F858)
  {
    unint64_t v0 = sub_1C1F08878();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB7F858);
    }
  }
}

uint64_t HKListUserDomainConcept.nonlinkElements<A>(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v66 = a2;
  sub_1C1EFF780(0, &qword_1EBB7F4A8, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  v75 = (char *)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)v61 - v8;
  uint64_t v10 = sub_1C1F087B8();
  uint64_t v64 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  v71 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v76 = (char *)v61 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v74 = (char *)v61 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  v73 = (char *)v61 - v18;
  MEMORY[0x1F4188790](v17);
  v67 = (char *)v61 - v19;
  id v20 = objc_msgSend(v3, sel_linkCollection);
  uint64_t v65 = a1;
  if (v20)
  {
    v21 = v20;
    id v22 = objc_msgSend(v20, sel_links);

    sub_1C1F00D44(0, &qword_1EBB7F838);
    unint64_t v23 = sub_1C1F08A48();

    unint64_t v68 = v23;
    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_1C1F08C08();
      uint64_t v24 = result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v24)
      {
LABEL_4:
        unint64_t v26 = v68;
        if (v24 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v27 = 0;
        v72 = (unsigned int (**)(char *, uint64_t, uint64_t))(v68 & 0xC000000000000001);
        v28 = (void (**)(char *, char *, uint64_t))(v64 + 32);
        v70 = (void (**)(char *, char *, uint64_t))(v64 + 56);
        v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48);
        unint64_t v69 = MEMORY[0x1E4FBC860];
        v30 = v73;
        do
        {
          if (v72) {
            id v31 = (id)MEMORY[0x1C874F020](v27, v26);
          }
          else {
            id v31 = *(id *)(v26 + 8 * v27 + 32);
          }
          v32 = v31;
          id v33 = objc_msgSend(v31, sel_targetUUID);
          sub_1C1F087A8();

          v34 = *v28;
          (*v28)(v9, v30, v10);
          ((void (*)(char *, void, uint64_t, uint64_t))*v70)(v9, 0, 1, v10);

          if ((*v29)(v9, 1, v10) == 1)
          {
            sub_1C1EFF710((uint64_t)v9, &qword_1EBB7F4A8, MEMORY[0x1E4F27990]);
          }
          else
          {
            v35 = v67;
            v34(v67, v9, v10);
            v34(v74, v35, v10);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v69 = sub_1C1EFE3C8(0, *(void *)(v69 + 16) + 1, 1, v69);
            }
            unint64_t v37 = *(void *)(v69 + 16);
            unint64_t v36 = *(void *)(v69 + 24);
            if (v37 >= v36 >> 1) {
              unint64_t v69 = sub_1C1EFE3C8(v36 > 1, v37 + 1, 1, v69);
            }
            unint64_t v38 = v69;
            *(void *)(v69 + 16) = v37 + 1;
            v34((char *)(v38+ ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))+ *(void *)(v64 + 72) * v37), v74, v10);
            unint64_t v26 = v68;
          }
          ++v27;
        }
        while (v24 != v27);
        goto LABEL_20;
      }
    }
    unint64_t v69 = MEMORY[0x1E4FBC860];
LABEL_20:
    swift_bridgeObjectRelease_n();
    a1 = v65;
    goto LABEL_21;
  }
  unint64_t v69 = MEMORY[0x1E4FBC860];
LABEL_21:
  uint64_t v39 = v66;
  uint64_t v79 = sub_1C1F08988();
  uint64_t v40 = swift_bridgeObjectRetain();
  if (!MEMORY[0x1C874EF30](v40, v39)) {
    goto LABEL_42;
  }
  v41 = 0;
  uint64_t v42 = *(void *)(v69 + 16);
  v73 = (char *)(v64 + 16);
  v72 = (unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48);
  v70 = (void (**)(char *, char *, uint64_t))(v64 + 32);
  v43 = (void (**)(char *, uint64_t))(v64 + 8);
  v74 = (char *)(v64 + 56);
  v61[1] = (v64 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v61[2] = (v64 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v62 = v42;
  uint64_t v63 = a1 + 32;
  while (1)
  {
    char v45 = sub_1C1F08A98();
    sub_1C1F08A68();
    if ((v45 & 1) == 0) {
      break;
    }
    id v46 = *(id *)(v63 + 8 * (void)v41);
    BOOL v47 = __OFADD__(v41, 1);
    v48 = v41 + 1;
    if (v47) {
      goto LABEL_41;
    }
LABEL_27:
    v67 = v48;
    unint64_t v68 = (unint64_t)v46;
    id v49 = objc_msgSend(v46, sel_UUID);
    sub_1C1F087A8();

    if (v42)
    {
      uint64_t v50 = v69 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
      uint64_t v51 = *(void *)(v64 + 72);
      v52 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
      swift_bridgeObjectRetain();
      uint64_t v53 = v42;
      v54 = v75;
      while (1)
      {
        v52(v54, v50, v10);
        v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v74;
        (*(void (**)(char *, void, uint64_t, uint64_t))v74)(v54, 0, 1, v10);
        if ((*v72)(v54, 1, v10) == 1) {
          break;
        }
        v56 = v71;
        (*v70)(v71, v54, v10);
        sub_1C1EFF5D0(&qword_1EBB7F4A0, MEMORY[0x1E4F27990]);
        char v57 = sub_1C1F08998();
        v58 = *v43;
        (*v43)(v56, v10);
        if (v57)
        {

          swift_bridgeObjectRelease();
          uint64_t v44 = v65;
          uint64_t v60 = v66;
          goto LABEL_38;
        }
        v50 += v51;
        --v53;
        v54 = v75;
        if (!v53) {
          goto LABEL_34;
        }
      }
    }
    else
    {
      v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v74;
      swift_bridgeObjectRetain();
      v54 = v75;
LABEL_34:
      v55(v54, 1, 1, v10);
    }
    swift_bridgeObjectRelease();
    id v59 = (id)v68;
    unint64_t v77 = v68;
    uint64_t v78 = v79;
    uint64_t v60 = v66;
    sub_1C1F08AD8();
    swift_getWitnessTable();
    swift_getWitnessTable();
    if (sub_1C1F08A18())
    {

      v58 = *v43;
      uint64_t v44 = v65;
LABEL_38:
      v41 = v67;
      uint64_t v42 = v62;
      v58(v76, v10);
    }
    else
    {
      uint64_t v78 = (uint64_t)v59;
      sub_1C1F08AB8();
      (*v43)(v76, v10);
      uint64_t v44 = v65;
      v41 = v67;
      uint64_t v42 = v62;
    }
    if (v41 == (char *)MEMORY[0x1C874EF30](v44, v60)) {
      goto LABEL_42;
    }
  }
  id v46 = (id)sub_1C1F08BA8();
  BOOL v47 = __OFADD__(v41, 1);
  v48 = v41 + 1;
  if (!v47) {
    goto LABEL_27;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v79;
}

uint64_t sub_1C1EFE3C8(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  sub_1C1EFF780(0, &qword_1EBB7F4D8, MEMORY[0x1E4F27990], MEMORY[0x1E4FBBE00]);
  uint64_t v10 = *(void *)(sub_1C1F087B8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1C1F08BE8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1C1F087B8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C1EFCDB8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1C1EFE660()
{
  sub_1C1EFE848();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = *(void *)(v0 + 40);
  sub_1C1EFF0CC(0, &qword_1EBB7F770);
  sub_1C1EFE7F8(&qword_1EBB7F828, &qword_1EBB7F770);
  swift_retain();
  sub_1C1F08908();
  swift_release();
  sub_1C1EFF5D0(&qword_1EBB7F818, (void (*)(uint64_t))sub_1C1EFE848);
  uint64_t v6 = sub_1C1F088E8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_1C1EFE7F8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C1EFF0CC(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C1EFE848()
{
  if (!qword_1EBB7F820)
  {
    sub_1C1EFF0CC(255, &qword_1EBB7F770);
    sub_1C1EFE7F8(&qword_1EBB7F828, &qword_1EBB7F770);
    unint64_t v0 = sub_1C1F08818();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB7F820);
    }
  }
}

void *sub_1C1EFE8DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, int a6, void *a7)
{
  int v46 = a6;
  char v45 = a5;
  uint64_t v41 = sub_1C1F08938();
  uint64_t v40 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  unint64_t v38 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_1C1F08958();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39);
  unint64_t v36 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EFF780(0, &qword_1EBB7F7D8, MEMORY[0x1E4FBCC28], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v36 - v15;
  sub_1C1F00148();
  uint64_t v43 = *(void *)(v17 - 8);
  uint64_t v44 = v17;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55[3] = &type metadata for LabsListDataProvider;
  v55[4] = &off_1F1D6F2B8;
  v55[0] = a2;
  v55[1] = a3;
  v55[2] = a4;
  LOBYTE(aBlock) = 0;
  sub_1C1EFF0CC(0, &qword_1EBB7F778);
  swift_allocObject();
  uint64_t v20 = sub_1C1F08888();
  a7[3] = 0;
  a7[4] = 0;
  a7[2] = v20;
  if (qword_1EBB7F718 != -1) {
    swift_once();
  }
  long long v42 = xmmword_1EBB7F6D0;
  long long aBlock = xmmword_1EBB7F6D0;
  id v49 = (uint64_t (*)(uint64_t))qword_1EBB7F6E0;
  uint64_t v50 = (void *)unk_1EBB7F6E8;
  uint64_t v51 = (uint64_t (*)())qword_1EBB7F6F0;
  v52 = (void *)unk_1EBB7F6F8;
  uint64_t v53 = qword_1EBB7F700;
  char v54 = byte_1EBB7F708;
  sub_1C1EFF0CC(0, &qword_1EBB7F770);
  swift_allocObject();
  v21 = (void *)v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v22 = v21;
  a7[5] = sub_1C1F08888();
  a7[6] = 0;
  a7[15] = 0;
  a7[16] = 0;
  a7[14] = 0;
  a7[7] = a1;
  id v23 = objc_allocWithZone(MEMORY[0x1E4F2B688]);
  id v24 = a1;
  a7[8] = objc_msgSend(v23, sel_initWithHealthStore_, v24);
  sub_1C1F00214((uint64_t)v55, (uint64_t)(a7 + 9));
  v25 = v45;
  *(void *)&long long aBlock = *(void *)&v45[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcChangesSubject];
  swift_retain();
  id v47 = sub_1C1EFF618();
  uint64_t v26 = sub_1C1F08B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v16, 1, 1, v26);
  sub_1C1EFF0CC(0, (unint64_t *)&qword_1EBB7F858);
  sub_1C1F00D44(0, (unint64_t *)&unk_1EBB7F7E8);
  sub_1C1EFE7F8(&qword_1EBB7F850, (unint64_t *)&qword_1EBB7F858);
  sub_1C1EFF6A8();
  sub_1C1F08918();
  sub_1C1EFF710((uint64_t)v16, &qword_1EBB7F7D8, MEMORY[0x1E4FBCC28]);

  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_1C1EFF5D0(&qword_1EBB7F840, (void (*)(uint64_t))sub_1C1F00148);
  uint64_t v27 = v44;
  uint64_t v28 = sub_1C1F08928();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v19, v27);
  a7[15] = v28;
  swift_release();
  sub_1C1F087D8();
  sub_1C1EFF618();
  swift_allocObject();
  swift_weakInit();
  a7[14] = sub_1C1F087C8();
  swift_release();
  v29 = v25;
  if (v46)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
  }
  else
  {
    id v30 = sub_1C1EFF618();
    uint64_t v51 = sub_1C1EFD1C4;
    v52 = a7;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    id v49 = sub_1C1EFD180;
    uint64_t v50 = &block_descriptor_55;
    id v31 = _Block_copy(&aBlock);
    swift_retain();
    v32 = v36;
    sub_1C1F08948();
    id v47 = (id)MEMORY[0x1E4FBC860];
    sub_1C1EFF5D0(&qword_1EBB7F7A0, MEMORY[0x1E4FBCB00]);
    sub_1C1EFF780(0, &qword_1EBB7F7A8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1C1F000C0();
    id v33 = v38;
    uint64_t v34 = v41;
    sub_1C1F08B68();
    MEMORY[0x1C874EF80](0, v32, v33, v31);
    _Block_release(v31);

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v33, v34);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v39);
    swift_release();
  }
  return a7;
}

void sub_1C1EFF0CC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1C1F08878();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1C1EFF128()
{
  uint64_t v1 = v0;
  sub_1C1EFF780(0, &qword_1EBB7F7D8, MEMORY[0x1E4FBCC28], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v25 - v3;
  sub_1C1EFF8A8();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C1F08968();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (id *)((char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v13 = sub_1C1EFF618();
  (*(void (**)(id *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCBF0], v10);
  char v14 = sub_1C1F08978();
  uint64_t result = (*(uint64_t (**)(id *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    uint64_t v16 = *v1;
    uint64_t v17 = v1[12];
    uint64_t v18 = v1[13];
    __swift_project_boxed_opaque_existential_1(v1 + 9, v17);
    v25[1] = (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 24))(v1[7], v17, v18);
    v25[0] = sub_1C1EFF618();
    uint64_t v19 = sub_1C1F08B08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 1, 1, v19);
    sub_1C1EFF828();
    sub_1C1F00D44(0, (unint64_t *)&unk_1EBB7F7E8);
    sub_1C1EFF5D0(&qword_1EBB7F740, (void (*)(uint64_t))sub_1C1EFF828);
    sub_1C1EFF6A8();
    sub_1C1F08918();
    sub_1C1EFF710((uint64_t)v4, &qword_1EBB7F7D8, MEMORY[0x1E4FBCC28]);

    swift_release();
    uint64_t v20 = swift_allocObject();
    swift_weakInit();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = v16;
    uint64_t v22 = swift_allocObject();
    swift_weakInit();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_1C1F079D0;
    *(void *)(v23 + 24) = v22;
    sub_1C1EFF5D0(&qword_1EBB7F730, (void (*)(uint64_t))sub_1C1EFF8A8);
    uint64_t v24 = sub_1C1F088F8();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v1[16] = v24;
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C1EFF5D0(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_1C1EFF618()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = *(id *)(v0 + 48);
  }
  else
  {
    uint64_t v3 = (void *)sub_1C1F089A8();
    id v4 = (id)HKCreateSerialDispatchQueue();

    uint64_t v5 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v4;
    id v2 = v4;

    uint64_t v1 = 0;
  }
  id v6 = v1;
  return v2;
}

unint64_t sub_1C1EFF6A8()
{
  unint64_t result = qword_1EBB7F7E0;
  if (!qword_1EBB7F7E0)
  {
    sub_1C1F00D44(255, (unint64_t *)&unk_1EBB7F7E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB7F7E0);
  }
  return result;
}

uint64_t sub_1C1EFF710(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C1EFF780(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1C1EFF780(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_1C1EFF828()
{
  if (!qword_1EBB7F748)
  {
    sub_1C1F078CC();
    sub_1C1F07758(255, (unint64_t *)&qword_1EBB7F810);
    unint64_t v0 = sub_1C1F08838();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB7F748);
    }
  }
}

void sub_1C1EFF8A8()
{
  if (!qword_1EBB7F738)
  {
    sub_1C1EFF828();
    sub_1C1F00D44(255, (unint64_t *)&unk_1EBB7F7E8);
    sub_1C1EFF5D0(&qword_1EBB7F740, (void (*)(uint64_t))sub_1C1EFF828);
    sub_1C1EFF6A8();
    unint64_t v0 = sub_1C1F08828();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB7F738);
    }
  }
}

uint64_t sub_1C1EFF978(void *a1)
{
  sub_1C1EFFF58();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  uint64_t v27 = v3;
  MEMORY[0x1F4188790](v2);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_predicateForMedicalUserDomainConceptWithCategoryType_, 2);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = a1;
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AC28];
  sub_1C1EFFD88(0, &qword_1EBB7F788, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  id v9 = v6;
  id v10 = a1;
  uint64_t v29 = sub_1C1F088B8();
  sub_1C1EFFF14(&qword_1EBB7F780, &qword_1EBB7F788, v8);
  uint64_t v11 = sub_1C1F088E8();

  swift_release();
  id v12 = objc_msgSend(v5, sel_predicateForListUserDomainConceptWithListType_, 1);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v10;
  char v14 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AC28];
  sub_1C1EFFE2C(0, &qword_1EBB7F798, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  id v15 = v10;
  id v16 = v12;
  uint64_t v29 = sub_1C1F088B8();
  sub_1C1EFFED0(&qword_1EBB7F790, &qword_1EBB7F798, v14);
  uint64_t v17 = sub_1C1F088E8();

  swift_release();
  uint64_t v28 = v17;
  uint64_t v29 = v11;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C1EFFD88(0, &qword_1EBB7F758, MEMORY[0x1E4F1AAE0]);
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C1EFFE2C(0, &qword_1EBB7F768, MEMORY[0x1E4F1AAE0]);
  sub_1C1EFFF14(&qword_1EBB7F750, &qword_1EBB7F758, v18);
  sub_1C1EFFED0(&qword_1EBB7F760, &qword_1EBB7F768, v19);
  swift_retain();
  swift_retain();
  uint64_t v20 = v25;
  sub_1C1F08808();
  sub_1C1F00078(&qword_1EBB7F720, (void (*)(uint64_t))sub_1C1EFFF58);
  uint64_t v21 = v26;
  uint64_t v22 = sub_1C1F088E8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v21);
  return v22;
}

void sub_1C1EFFD88(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  if (!*a2)
  {
    sub_1C1F08560(255, &qword_1EBB7F7B8, (unint64_t *)&qword_1EBB7F7F8, 0x1E4F2B630, MEMORY[0x1E4FBB320]);
    uint64_t v7 = v6;
    unint64_t v8 = sub_1C1F07C5C();
    unint64_t v9 = a3(a1, v7, v8, MEMORY[0x1E4FBC0F0]);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1C1EFFE2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  if (!*a2)
  {
    sub_1C1F08560(255, &qword_1EBB7F7C8, &qword_1EBB7F800, 0x1E4F2B148, MEMORY[0x1E4FBB320]);
    uint64_t v7 = v6;
    unint64_t v8 = sub_1C1F07C5C();
    unint64_t v9 = a3(a1, v7, v8, MEMORY[0x1E4FBC0F0]);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1C1EFFED0(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C1EFFE2C(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C1EFFF14(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C1EFFD88(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C1EFFF58()
{
  if (!qword_1EBB7F728)
  {
    unint64_t v0 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C1EFFD88(255, &qword_1EBB7F758, MEMORY[0x1E4F1AAE0]);
    uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C1EFFE2C(255, &qword_1EBB7F768, MEMORY[0x1E4F1AAE0]);
    sub_1C1EFFF14(&qword_1EBB7F750, &qword_1EBB7F758, v0);
    sub_1C1EFFED0(&qword_1EBB7F760, &qword_1EBB7F768, v1);
    unint64_t v2 = sub_1C1F087F8();
    if (!v3) {
      atomic_store(v2, (unint64_t *)&qword_1EBB7F728);
    }
  }
}

uint64_t sub_1C1F00078(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C1F000C0()
{
  unint64_t result = qword_1EBB7F7B0;
  if (!qword_1EBB7F7B0)
  {
    sub_1C1EFF780(255, &qword_1EBB7F7A8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB7F7B0);
  }
  return result;
}

void sub_1C1F00148()
{
  if (!qword_1EBB7F848)
  {
    sub_1C1EFF0CC(255, (unint64_t *)&qword_1EBB7F858);
    sub_1C1F00D44(255, (unint64_t *)&unk_1EBB7F7E8);
    sub_1C1EFE7F8(&qword_1EBB7F850, (unint64_t *)&qword_1EBB7F858);
    sub_1C1EFF6A8();
    unint64_t v0 = sub_1C1F08828();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB7F848);
    }
  }
}

uint64_t sub_1C1F00214(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for LabsListDataProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t ListConceptManager.deinit()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 24);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_1C1F003AC((uint64_t)v1);
  }
  swift_release();
  sub_1C1F003AC(*(void *)(v0 + 24));
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  swift_release();
  swift_release();
  swift_release();
  return v0;
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

uint64_t destroy for LabsListDataProvider()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1F003AC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_1C1F003BC(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v11 = *(void (**)(id, void *, void *, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v15 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v11(v15, a3, a4, a5, a6);
  swift_release();
}

uint64_t sub_1C1F00488(uint64_t a1, void *a2, int a3, char a4, uint64_t a5)
{
  return sub_1C1F004BC(a1, a2, a3, a4, a5, *(id *)(v5 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40), 0x1E4F2B148);
}

uint64_t sub_1C1F004BC(uint64_t a1, void *a2, int a3, char a4, uint64_t a5, id a6, uint64_t (*a7)(uint64_t, uint64_t), int a8, uint64_t a9, uint64_t a10)
{
  if (a5)
  {
    objc_msgSend(a6, sel_stopQuery_, a1);
    return a7(a5, 1);
  }
  else
  {
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (result)
    {
      swift_beginAccess();
      MEMORY[0x1C874EE90](a2);
      if (*(void *)((*(void *)(a9 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a9 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
        sub_1C1F08A78();
      sub_1C1F08AA8();
      sub_1C1F08A58();
      uint64_t result = swift_endAccess();
    }
    if (a4)
    {
      objc_msgSend(a6, sel_stopQuery_, a1);
      swift_beginAccess();
      uint64_t v17 = swift_bridgeObjectRetain();
      a7(v17, 0);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1C1F00618(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1C1F0065C(uint64_t a1, void *a2, int a3, char a4, uint64_t a5)
{
  return sub_1C1F004BC(a1, a2, a3, a4, a5, *(id *)(v5 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40), 0x1E4F2B630);
}

void sub_1C1F00690(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = MEMORY[0x1E4FBC860];
  sub_1C1F009BC();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1C1F09400;
  sub_1C1F089B8();
  id v11 = objc_allocWithZone(MEMORY[0x1E4F29008]);
  swift_retain();
  id v12 = (void *)sub_1C1F089A8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithKey_ascending_, v12, 0);

  *(void *)(v10 + 32) = v13;
  sub_1C1F08A58();
  id v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = sub_1C1F00658;
  v14[4] = v8;
  v14[5] = v9;
  id v15 = objc_allocWithZone(MEMORY[0x1E4F2B670]);
  sub_1C1F00D44(0, &qword_1EBB7F7D0);
  id v16 = a4;
  swift_retain();
  id v17 = a3;
  uint64_t v18 = (void *)sub_1C1F08A38();
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_1C1F0065C;
  uint64_t v28 = v14;
  unint64_t v23 = MEMORY[0x1E4F143A8];
  unint64_t v24 = 1107296256;
  v25 = sub_1C1F003BC;
  uint64_t v26 = &block_descriptor_46;
  uint64_t v19 = _Block_copy(&v23);
  id v20 = objc_msgSend(v15, sel_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler_, v17, 0, 0, v18, v19);

  _Block_release(v19);
  swift_release();
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  id v21 = v20;
  sub_1C1F08B78();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD000000000000011;
  unint64_t v24 = 0x80000001C1F09A90;
  sub_1C1F00D44(0, (unint64_t *)&qword_1EBB7F7F8);
  sub_1C1F08C68();
  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  uint64_t v22 = (void *)sub_1C1F089A8();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setDebugIdentifier_, v22);

  objc_msgSend(v16, sel_executeQuery_, v21);
  swift_release();
}

void sub_1C1F009BC()
{
  if (!qword_1EBB7F808)
  {
    unint64_t v0 = sub_1C1F08C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB7F808);
    }
  }
}

void sub_1C1F00A18(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = MEMORY[0x1E4FBC860];
  sub_1C1F009BC();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1C1F09400;
  sub_1C1F089B8();
  id v11 = objc_allocWithZone(MEMORY[0x1E4F29008]);
  swift_retain();
  id v12 = (void *)sub_1C1F089A8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithKey_ascending_, v12, 0);

  *(void *)(v10 + 32) = v13;
  sub_1C1F08A58();
  id v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = sub_1C1F00658;
  v14[4] = v8;
  v14[5] = v9;
  id v15 = objc_allocWithZone(MEMORY[0x1E4F2B670]);
  sub_1C1F00D44(0, &qword_1EBB7F7D0);
  id v16 = a4;
  swift_retain();
  id v17 = a3;
  uint64_t v18 = (void *)sub_1C1F08A38();
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_1C1F00488;
  uint64_t v28 = v14;
  unint64_t v23 = MEMORY[0x1E4F143A8];
  unint64_t v24 = 1107296256;
  v25 = sub_1C1F003BC;
  uint64_t v26 = &block_descriptor_0;
  uint64_t v19 = _Block_copy(&v23);
  id v20 = objc_msgSend(v15, sel_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler_, v17, 0, 0, v18, v19);

  _Block_release(v19);
  swift_release();
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  id v21 = v20;
  sub_1C1F08B78();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD000000000000011;
  unint64_t v24 = 0x80000001C1F09A90;
  sub_1C1F00D44(0, &qword_1EBB7F800);
  sub_1C1F08C68();
  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  uint64_t v22 = (void *)sub_1C1F089A8();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setDebugIdentifier_, v22);

  objc_msgSend(v16, sel_executeQuery_, v21);
  swift_release();
}

uint64_t sub_1C1F00D44(uint64_t a1, unint64_t *a2)
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t sub_1C1F00DE0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C1EFD4F4(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_1C1F00DE8()
{
  unint64_t result = qword_1EBB7F4C8;
  if (!qword_1EBB7F4C8)
  {
    sub_1C1F00E6C(255, &qword_1EBB7F4C0, &qword_1EBB7F838, 0x1E4F2B640, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB7F4C8);
  }
  return result;
}

void sub_1C1F00E6C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1C1F00D44(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1C1F00ED4()
{
  if (!qword_1EBB7F4B8)
  {
    unint64_t v0 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C1EFFE2C(255, &qword_1EBB7F768, MEMORY[0x1E4F1AAE0]);
    sub_1C1EFFED0(&qword_1EBB7F760, &qword_1EBB7F768, v0);
    unint64_t v1 = sub_1C1F088D8();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EBB7F4B8);
    }
  }
}

uint64_t ListConceptManagerState.listItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ListConceptManagerState.nonlistItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of ListConceptManager.publisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ListConceptManager.hasLoadedData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

char *UserDomainConceptChangeProvider.__allocating_init(conceptStore:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UserDomainConceptChangeProvider.init(conceptStore:)(a1);
}

uint64_t sub_1C1F01014()
{
  return sub_1C1F0103C();
}

uint64_t sub_1C1F01024()
{
  return sub_1C1F0103C();
}

uint64_t sub_1C1F01034()
{
  return sub_1C1F0103C();
}

uint64_t sub_1C1F0103C()
{
  return sub_1C1F08868();
}

uint64_t sub_1C1F0108C(void *a1, uint64_t a2, void *a3)
{
  sub_1C1F013B0();
  sub_1C1F08A48();
  id v5 = a3;
  id v6 = a1;
  swift_bridgeObjectRetain();
  sub_1C1F08868();

  return swift_bridgeObjectRelease();
}

id UserDomainConceptChangeProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void UserDomainConceptChangeProvider.init()()
{
}

id UserDomainConceptChangeProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserDomainConceptChangeProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t assignWithCopy for UserDomainConceptChange(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserDomainConceptChange(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C1F01274(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t method lookup function for UserDomainConceptChangeProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UserDomainConceptChangeProvider);
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.__allocating_init(conceptStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.userDomainConceptStore(_:didAdd:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.userDomainConceptStore(_:didUpdate:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.userDomainConceptStore(_:didDelete:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

void type metadata accessor for HKListUserDomainType()
{
  if (!qword_1EBB7F4D0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EBB7F4D0);
    }
  }
}

unint64_t sub_1C1F013B0()
{
  unint64_t result = qword_1EBB7F7F8;
  if (!qword_1EBB7F7F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB7F7F8);
  }
  return result;
}

id ListConceptManagerState.listUDC.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

uint64_t ListConceptManagerState.listType.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ListConceptManagerState.listName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ListConceptManagerState.concepts.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 ListConceptManagerState.init(concepts:list:)@<Q0>(id a1@<X1>, unint64_t a2@<X0>, uint64_t a3@<X8>)
{
  id v6 = objc_msgSend(a1, sel_listType);
  id v7 = objc_msgSend(a1, sel_listName);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_1C1F089B8();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  sub_1C1F01530(a2, a1, (uint64_t)v6, v9, v11, 0, (uint64_t)v16);
  uint64_t v12 = v17;
  char v13 = v18;
  long long v15 = v16[1];
  __n128 result = (__n128)v16[2];
  *(_OWORD *)a3 = v16[0];
  *(_OWORD *)(a3 + 16) = v15;
  *(__n128 *)(a3 + 32) = result;
  *(void *)(a3 + 48) = v12;
  *(unsigned char *)(a3 + 56) = v13;
  return result;
}

void sub_1C1F01530(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  if (a2)
  {
    id v14 = a2;
    id v15 = objc_msgSend(v14, sel_linkCollection);
    if (v15)
    {
      id v16 = v15;
      uint64_t v25 = a3;
      uint64_t v17 = a4;
      uint64_t v18 = a5;
      char v19 = a6;
      id v20 = objc_msgSend(v15, sel_links);

      sub_1C1F00D44(0, &qword_1EBB7F838);
      unint64_t v21 = sub_1C1F08A48();

      a6 = v19;
      a5 = v18;
      a4 = v17;
      a3 = v25;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1C1F06CA4(v21, a1);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {

      uint64_t v22 = MEMORY[0x1E4FBC860];
    }
    id v23 = v14;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1C1F01770(a1);
    swift_bridgeObjectRelease();

    a1 = v24;
  }
  else
  {
    uint64_t v22 = MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C1F05D5C(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *(void *)a7 = a2;
  *(void *)(a7 + 8) = a3;
  *(void *)(a7 + 16) = a4;
  *(void *)(a7 + 24) = a5;
  *(void *)(a7 + 32) = v22;
  *(void *)(a7 + 40) = v22;
  *(void *)(a7 + 48) = a1;
  *(unsigned char *)(a7 + 56) = a6 & 1;
}

uint64_t ListConceptManagerState.init(concepts:listType:listName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = MEMORY[0x1E4FBC860];
  uint64_t v13 = MEMORY[0x1E4FBC860];
  unint64_t v11 = swift_bridgeObjectRetain();
  uint64_t result = sub_1C1F05D5C(v11);
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = v13;
  *(void *)(a5 + 40) = v10;
  *(void *)(a5 + 48) = a1;
  *(unsigned char *)(a5 + 56) = 0;
  return result;
}

uint64_t sub_1C1F01770(unint64_t a1)
{
  sub_1C1EFF780(0, &qword_1EBB7F4A8, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  id v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v69 - v7;
  uint64_t v9 = sub_1C1F087B8();
  uint64_t v76 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  v85 = (void (**)(char *, uint64_t))((char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  id v14 = (char *)&v69 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  v80 = (void (**)(char *, char *, uint64_t))((char *)&v69 - v16);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  v81 = (char *)&v69 - v18;
  MEMORY[0x1F4188790](v17);
  v86 = (char *)&v69 - v19;
  id v20 = objc_msgSend(v1, sel_linkCollection);
  unint64_t v21 = MEMORY[0x1E4FBC860];
  unint64_t v72 = a1;
  if (v20)
  {
    uint64_t v22 = v20;
    id v23 = objc_msgSend(v20, sel_links);

    sub_1C1F00D44(0, &qword_1EBB7F838);
    unint64_t v24 = sub_1C1F08A48();

    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_1C1F08C08();
      uint64_t v25 = result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v25)
      {
LABEL_4:
        if (v25 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v27 = 0;
        uint64_t v28 = (void (**)(char *, char *, uint64_t))(v76 + 32);
        v82 = (unsigned int (**)(char *, uint64_t, uint64_t))(v76 + 56);
        unint64_t v83 = v24 & 0xC000000000000001;
        uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v76 + 48);
        uint64_t v78 = v14;
        unint64_t v79 = MEMORY[0x1E4FBC860];
        v84 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v24;
        do
        {
          if (v83) {
            id v30 = (id)MEMORY[0x1C874F020](v27, v24);
          }
          else {
            id v30 = *(id *)(v24 + 8 * v27 + 32);
          }
          id v31 = v30;
          id v32 = objc_msgSend(v30, sel_targetUUID);
          sub_1C1F087A8();

          id v33 = *v28;
          (*v28)(v6, v14, v9);
          ((void (*)(char *, void, uint64_t, uint64_t))*v82)(v6, 0, 1, v9);

          if ((*v29)(v6, 1, v9) == 1)
          {
            sub_1C1EFF710((uint64_t)v6, &qword_1EBB7F4A8, MEMORY[0x1E4F27990]);
          }
          else
          {
            uint64_t v34 = v80;
            v33((char *)v80, v6, v9);
            v33((char *)v85, (char *)v34, v9);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v79 = sub_1C1EFE3C8(0, *(void *)(v79 + 16) + 1, 1, v79);
            }
            unint64_t v36 = *(void *)(v79 + 16);
            unint64_t v35 = *(void *)(v79 + 24);
            if (v36 >= v35 >> 1) {
              unint64_t v79 = sub_1C1EFE3C8(v35 > 1, v36 + 1, 1, v79);
            }
            unint64_t v37 = v79;
            *(void *)(v79 + 16) = v36 + 1;
            v33((char *)(v37+ ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))+ *(void *)(v76 + 72) * v36), (char *)v85, v9);
            id v14 = v78;
          }
          ++v27;
          unint64_t v24 = (unint64_t)v84;
        }
        while (v25 != v27);
        goto LABEL_20;
      }
    }
    unint64_t v79 = MEMORY[0x1E4FBC860];
LABEL_20:
    swift_bridgeObjectRelease_n();
    a1 = v72;
    unint64_t v21 = MEMORY[0x1E4FBC860];
    goto LABEL_21;
  }
  unint64_t v79 = MEMORY[0x1E4FBC860];
LABEL_21:
  unint64_t v87 = v21;
  if (a1 >> 62) {
    goto LABEL_74;
  }
  uint64_t v38 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v38)
  {
    while (1)
    {
      unint64_t v39 = 0;
      uint64_t v40 = *(void *)(v79 + 16);
      uint64_t v69 = v72 + 32;
      uint64_t v70 = v72 & 0xFFFFFFFFFFFFFF8;
      unint64_t v83 = v76 + 16;
      v82 = (unsigned int (**)(char *, uint64_t, uint64_t))(v76 + 48);
      v80 = (void (**)(char *, char *, uint64_t))(v76 + 32);
      v84 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56);
      v85 = (void (**)(char *, uint64_t))(v76 + 8);
      unint64_t v71 = (v76 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v74 = v40;
      unint64_t v75 = v72 & 0xC000000000000001;
      uint64_t v73 = v38;
      while (1)
      {
        if (v75)
        {
          long long v42 = (char *)MEMORY[0x1C874F020](v39, v72);
          BOOL v43 = __OFADD__(v39, 1);
          unint64_t v44 = v39 + 1;
          if (v43) {
            goto LABEL_70;
          }
        }
        else
        {
          if (v39 >= *(void *)(v70 + 16)) {
            goto LABEL_71;
          }
          long long v42 = (char *)*(id *)(v69 + 8 * v39);
          BOOL v43 = __OFADD__(v39, 1);
          unint64_t v44 = v39 + 1;
          if (v43)
          {
LABEL_70:
            __break(1u);
LABEL_71:
            __break(1u);
LABEL_72:
            __break(1u);
            goto LABEL_73;
          }
        }
        unint64_t v77 = v44;
        uint64_t v78 = v42;
        id v45 = objc_msgSend(v42, sel_UUID, v69);
        sub_1C1F087A8();

        if (v40)
        {
          uint64_t v46 = v79 + ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80));
          uint64_t v47 = *(void *)(v76 + 72);
          v48 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 16);
          swift_bridgeObjectRetain();
          while (1)
          {
            v48(v8, v46, v9);
            id v49 = *v84;
            (*v84)(v8, 0, 1, v9);
            if ((*v82)(v8, 1, v9) == 1) {
              break;
            }
            uint64_t v50 = v81;
            (*v80)(v81, v8, v9);
            sub_1C1EFF5D0(&qword_1EBB7F4A0, MEMORY[0x1E4F27990]);
            char v51 = sub_1C1F08998();
            (*v85)(v50, v9);
            if (v51)
            {

              swift_bridgeObjectRelease();
              uint64_t v41 = v73;
              uint64_t v40 = v74;
              goto LABEL_26;
            }
            v46 += v47;
            if (!--v40) {
              goto LABEL_40;
            }
          }
        }
        else
        {
          id v49 = *v84;
          swift_bridgeObjectRetain();
LABEL_40:
          v49(v8, 1, 1, v9);
        }
        swift_bridgeObjectRelease();
        unint64_t v52 = v87;
        if (v87 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v53 = (char *)sub_1C1F08C08();
          id v54 = v78;
          if (!v53)
          {
LABEL_65:
            uint64_t v58 = swift_bridgeObjectRelease();
            uint64_t v40 = v74;
            goto LABEL_66;
          }
        }
        else
        {
          uint64_t v53 = *(char **)((v87 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          id v54 = v78;
          if (!v53) {
            goto LABEL_65;
          }
        }
        uint64_t v40 = v74;
        if ((v52 & 0xC000000000000001) != 0) {
          id v55 = (id)MEMORY[0x1C874F020](0, v52);
        }
        else {
          id v55 = *(id *)(v52 + 32);
        }
        v56 = v55;
        sub_1C1F00D44(0, (unint64_t *)&qword_1EBB7F7F8);
        char v57 = sub_1C1F08B28();

        if (v57)
        {
LABEL_24:

          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        if (v53 != (char *)1) {
          break;
        }
LABEL_47:
        uint64_t v58 = swift_bridgeObjectRelease();
LABEL_66:
        MEMORY[0x1C874EE90](v58);
        if (*(void *)((v87 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v87 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C1F08A78();
        }
        sub_1C1F08AA8();
        sub_1C1F08A58();
LABEL_25:
        uint64_t v41 = v73;
LABEL_26:
        unint64_t v39 = v77;
        (*v85)(v86, v9);
        if (v39 == v41) {
          goto LABEL_75;
        }
      }
      uint64_t v78 = v53;
      if ((v52 & 0xC000000000000001) != 0) {
        break;
      }
      id v63 = *(id *)(v52 + 40);
      char v64 = sub_1C1F08B28();

      if (v64) {
        goto LABEL_24;
      }
      if (v53 == (char *)2) {
        goto LABEL_47;
      }
      uint64_t v65 = 6;
      while (1)
      {
        uint64_t v66 = (char *)(v65 - 3);
        if (__OFADD__(v65 - 4, 1)) {
          break;
        }
        id v67 = *(id *)(v52 + 8 * v65);
        char v68 = sub_1C1F08B28();

        if (v68) {
          goto LABEL_24;
        }
        ++v65;
        if (v66 == v78) {
          goto LABEL_47;
        }
      }
LABEL_73:
      __break(1u);
LABEL_74:
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_1C1F08C08();
      if (!v38) {
        goto LABEL_75;
      }
    }
    MEMORY[0x1C874F020](1, v52);
    char v59 = sub_1C1F08B28();
    swift_unknownObjectRelease();
    if (v59) {
      goto LABEL_24;
    }
    if (v53 != (char *)2)
    {
      uint64_t v60 = 2;
      while (1)
      {
        MEMORY[0x1C874F020](v60, v52);
        v61 = (char *)(v60 + 1);
        if (__OFADD__(v60, 1)) {
          goto LABEL_72;
        }
        char v62 = sub_1C1F08B28();
        swift_unknownObjectRelease();
        if (v62) {
          goto LABEL_24;
        }
        ++v60;
        if (v61 == v78) {
          goto LABEL_47;
        }
      }
    }
    goto LABEL_47;
  }
LABEL_75:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v87;
}

double sub_1C1F02104()
{
  uint64_t v0 = MEMORY[0x1E4FBC860];
  uint64_t v2 = MEMORY[0x1E4FBC860];
  sub_1C1F05D5C(MEMORY[0x1E4FBC860]);
  double result = 0.0;
  xmmword_1EA2C25B0 = 0u;
  *(_OWORD *)&qword_1EA2C25C0 = 0u;
  qword_1EA2C25D0 = v2;
  unk_1EA2C25D8 = v0;
  qword_1EA2C25E0 = v0;
  byte_1EA2C25E8 = 0;
  return result;
}

id static ListConceptManagerState.empty.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EA2C24C0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EA2C25C0;
  uint64_t v2 = unk_1EA2C25C8;
  uint64_t v4 = qword_1EA2C25D0;
  uint64_t v5 = unk_1EA2C25D8;
  uint64_t v6 = qword_1EA2C25E0;
  char v7 = byte_1EA2C25E8;
  uint64_t v8 = (void *)xmmword_1EA2C25B0;
  *(_OWORD *)a1 = xmmword_1EA2C25B0;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(unsigned char *)(a1 + 56) = v7;
  id v10 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v10;
}

double sub_1C1F02228()
{
  uint64_t v0 = MEMORY[0x1E4FBC860];
  uint64_t v2 = MEMORY[0x1E4FBC860];
  sub_1C1F05D5C(MEMORY[0x1E4FBC860]);
  double result = 0.0;
  xmmword_1EBB7F6D0 = 0u;
  *(_OWORD *)&qword_1EBB7F6E0 = 0u;
  qword_1EBB7F6F0 = v2;
  unk_1EBB7F6F8 = v0;
  qword_1EBB7F700 = v0;
  byte_1EBB7F708 = 1;
  return result;
}

uint64_t sub_1C1F02288@<X0>(uint64_t a1@<X8>)
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    id v2 = objc_msgSend(v6, sel_UUID);

    sub_1C1F087A8();
    uint64_t v3 = sub_1C1F087B8();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(a1, 0, 1, v3);
  }
  else
  {
    uint64_t v5 = sub_1C1F087B8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
}

uint64_t sub_1C1F0239C()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1C1F02400()
{
  return sub_1C1F08858();
}

uint64_t sub_1C1F02424()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  __swift_project_boxed_opaque_existential_1(v0 + 9, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1C1F02478()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  __swift_project_boxed_opaque_existential_1(v0 + 9, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_1C1F024CC()
{
  uint64_t v1 = v0;
  sub_1C1F08C68();
  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  sub_1C1F089D8();
  uint64_t v2 = v0 + 9;
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  __swift_project_boxed_opaque_existential_1(v1 + 9, v1[12]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  id v5 = (id)HKStringFromListUserDomainType();
  sub_1C1F089B8();

  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  sub_1C1F089D8();
  uint64_t v7 = v1[12];
  uint64_t v6 = v1[13];
  __swift_project_boxed_opaque_existential_1(v2, v7);
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v7, v6);
  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  sub_1C1F089D8();
  return 91;
}

void *ListConceptManager.__allocating_init(healthStore:provider:udcChangeProvider:test_skipInitialLoad:)(void *a1, uint64_t a2, char *a3, int a4)
{
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1(a2, v9);
  uint64_t v12 = sub_1C1F07030(a1, v11, a3, a4, v4, v9, v10);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v12;
}

void *ListConceptManager.init(healthStore:provider:udcChangeProvider:test_skipInitialLoad:)(void *a1, uint64_t a2, char *a3, int a4)
{
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1(a2, v9);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v13);
  uint64_t v15 = sub_1C1F06490(a1, (uint64_t)v13, a3, a4, v4, v9, v10);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v15;
}

uint64_t sub_1C1F027CC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1C1EFF128();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1F02824(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1C1F02884()
{
  return swift_retain();
}

uint64_t sub_1C1F028BC(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_1C1F02904())()
{
  return j__swift_endAccess;
}

uint64_t sub_1C1F0295C()
{
  uint64_t v1 = sub_1C1F08938();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C1F08958();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = sub_1C1EFF618();
  aBlock[4] = sub_1C1F07B58;
  uint64_t v14 = v0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1EFD180;
  aBlock[3] = &block_descriptor;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  sub_1C1F08948();
  v12[1] = MEMORY[0x1E4FBC860];
  sub_1C1EFF5D0(&qword_1EBB7F7A0, MEMORY[0x1E4FBCB00]);
  sub_1C1EFF780(0, &qword_1EBB7F7A8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1F000C0();
  sub_1C1F08B68();
  MEMORY[0x1C874EF80](0, v8, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_1C1F02C0C(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1C1F08968();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (id *)((char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = sub_1C1EFF618();
  (*(void (**)(id *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  char v12 = sub_1C1F08978();
  (*(void (**)(id *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    if (a2)
    {
      swift_bridgeObjectRetain();
      id v13 = a2;
      id v14 = objc_msgSend(v13, sel_listType);
      id v15 = objc_msgSend(v13, sel_listName);
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = sub_1C1F089B8();
        uint64_t v19 = v18;
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v19 = 0;
      }
      unint64_t v30 = a1;
      id v31 = a2;
      uint64_t v32 = (uint64_t)v14;
      uint64_t v27 = v17;
      uint64_t v29 = v19;
    }
    else
    {
      id v20 = v4 + 9;
      uint64_t v21 = v4[12];
      uint64_t v22 = v4[13];
      __swift_project_boxed_opaque_existential_1(v4 + 9, v21);
      id v23 = *(uint64_t (**)(uint64_t, uint64_t))(v22 + 8);
      swift_bridgeObjectRetain();
      uint64_t v24 = v23(v21, v22);
      uint64_t v26 = v4[12];
      uint64_t v25 = v4[13];
      __swift_project_boxed_opaque_existential_1(v20, v26);
      uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(v26, v25);
      uint64_t v29 = v28;
      unint64_t v30 = a1;
      id v31 = 0;
      uint64_t v32 = v24;
    }
    sub_1C1F01530(v30, v31, v32, v27, v29, 0, (uint64_t)v37);
    long long v33 = v37[1];
    long long v34 = v37[2];
    uint64_t v35 = v38;
    char v36 = v39;
    *(_OWORD *)a3 = v37[0];
    *(_OWORD *)(a3 + 16) = v33;
    *(_OWORD *)(a3 + 32) = v34;
    *(void *)(a3 + 48) = v35;
    *(unsigned char *)(a3 + 56) = v36;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C1F02E60(void **a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1C1F08968();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (id *)((char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = (void *)result;
    if (v9)
    {
      id v12 = v9;
      int v35 = sub_1C1F08AE8();
      id v34 = (id)HKLogHealthOntology();
      sub_1C1F076F0(0, &qword_1EA2C25F0, &qword_1EA2C25F8, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1C1F09340;
      char v36 = a3;
      sub_1C1F07664();
      uint64_t v14 = sub_1C1F089C8();
      uint64_t v16 = v15;
      uint64_t v17 = MEMORY[0x1E4FBB1A0];
      *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v18 = sub_1C1F0769C();
      *(void *)(v13 + 64) = v18;
      *(void *)(v13 + 32) = v14;
      *(void *)(v13 + 40) = v16;
      char v36 = v9;
      id v19 = v9;
      sub_1C1F07758(0, (unint64_t *)&qword_1EBB7F810);
      uint64_t v20 = sub_1C1F089C8();
      *(void *)(v13 + 96) = v17;
      *(void *)(v13 + 104) = v18;
      *(void *)(v13 + 72) = v20;
      *(void *)(v13 + 80) = v21;
      uint64_t v22 = v34;
      sub_1C1F087E8();

      swift_bridgeObjectRelease();
      *uint64_t v8 = sub_1C1EFF618();
      (*(void (**)(id *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FBCBF0], v5);
      LOBYTE(v22) = sub_1C1F08978();
      uint64_t result = (*(uint64_t (**)(id *, uint64_t))(v6 + 8))(v8, v5);
      if (v22)
      {
        uint64_t v23 = v11[12];
        uint64_t v24 = v11[13];
        __swift_project_boxed_opaque_existential_1(v11 + 9, v23);
        uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
        uint64_t v26 = v11[12];
        uint64_t v27 = v11[13];
        __swift_project_boxed_opaque_existential_1(v11 + 9, v26);
        uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 16))(v26, v27);
        uint64_t v30 = v29;
        uint64_t v31 = MEMORY[0x1E4FBC860];
        char v36 = (void *)MEMORY[0x1E4FBC860];
        sub_1C1F05D5C(MEMORY[0x1E4FBC860]);
        uint64_t v32 = v36;
        char v36 = 0;
        uint64_t v37 = v25;
        uint64_t v38 = v28;
        uint64_t v39 = v30;
        uint64_t v40 = v32;
        uint64_t v41 = v31;
        uint64_t v42 = v31;
        char v43 = 0;
        sub_1C1F08848();

        swift_release();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1C1F031BC(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1F08968();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (id *)((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = (void *)result;
    uint64_t v10 = sub_1C1F03490(a2);
    if (v10)
    {
      uint64_t v11 = v10;
      sub_1C1F02C0C(a1, v10, (uint64_t)&v28);
      v21[0] = v28;
      v21[1] = v28;
      uint64_t v22 = v29;
      uint64_t v23 = v30;
      uint64_t v24 = v31;
      uint64_t v25 = v32;
      uint64_t v26 = v33;
      char v27 = v34;
      sub_1C1F08848();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      id *v7 = sub_1C1EFF618();
      (*(void (**)(id *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCBF0], v4);
      char v12 = sub_1C1F08978();
      uint64_t result = (*(uint64_t (**)(id *, uint64_t))(v5 + 8))(v7, v4);
      if ((v12 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v13 = v9[12];
      uint64_t v14 = v9[13];
      __swift_project_boxed_opaque_existential_1(v9 + 9, v13);
      uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
      swift_bridgeObjectRetain();
      uint64_t v16 = v15(v13, v14);
      uint64_t v17 = v9[12];
      uint64_t v18 = v9[13];
      __swift_project_boxed_opaque_existential_1(v9 + 9, v17);
      uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
      sub_1C1F01530(a1, 0, v16, v19, v20, 0, (uint64_t)&v28);
      v21[0] = v28;
      sub_1C1F08848();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }

    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1C1F03490(uint64_t a1)
{
  int64_t v2 = a1;
  uint64_t v3 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    int64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (a1 < 0) {
    uint64_t v1 = (void *)a1;
  }
  else {
    uint64_t v1 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  }
  swift_bridgeObjectRetain();
  int64_t v4 = sub_1C1F08C08();
  if (!v4) {
    goto LABEL_39;
  }
LABEL_3:
  unint64_t v5 = v2 & 0xC000000000000001;
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x1C874F020](0, v2);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    id v6 = *(id *)(v2 + 32);
  }
  uint64_t v1 = v6;
  swift_bridgeObjectRelease();
  if (v4 < 1)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!v3)
  {
    uint64_t v7 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (v2 < 0) {
    uint64_t v7 = v2;
  }
  else {
    uint64_t v7 = v2 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  if (sub_1C1F08C08() < 1) {
    goto LABEL_48;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1C1F08C08();
  swift_bridgeObjectRelease();
LABEL_15:
  if (v7 < v4)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v5 && v4 != 1)
  {
    sub_1C1F00D44(0, &qword_1EBB7F800);
    uint64_t v8 = 1;
    do
    {
      uint64_t v9 = v8 + 1;
      sub_1C1F08B98();
      uint64_t v8 = v9;
    }
    while (v4 != v9);
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C1F08C18();
    uint64_t v3 = v10;
    unint64_t v5 = v11;
    int64_t v4 = v12;
    swift_bridgeObjectRelease_n();
    if (v4) {
      goto LABEL_25;
    }
LABEL_24:
    int64_t v2 = sub_1C1F062EC(v7, v3, v5, v4);
    goto LABEL_31;
  }
  uint64_t v7 = v2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v3 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  unint64_t v5 = 1;
  int64_t v4 = (2 * v4) | 1;
  if ((v4 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_25:
  sub_1C1F08C58();
  swift_unknownObjectRetain_n();
  uint64_t v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    uint64_t v13 = MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = *(void *)(v13 + 16);
  swift_release();
  if (__OFSUB__((unint64_t)v4 >> 1, v5)) {
    goto LABEL_49;
  }
  if (v14 != ((unint64_t)v4 >> 1) - v5)
  {
LABEL_50:
    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  int64_t v2 = swift_dynamicCastClass();
  if (!v2)
  {
    swift_unknownObjectRelease();
    int64_t v2 = MEMORY[0x1E4FBC860];
  }
LABEL_31:
  swift_unknownObjectRelease();
  if (v2 < 0 || (v2 & 0x4000000000000000) != 0)
  {
LABEL_44:
    if (sub_1C1F08C08()) {
      goto LABEL_34;
    }
LABEL_45:
    swift_release();
    return v1;
  }
  if (!*(void *)(v2 + 16)) {
    goto LABEL_45;
  }
LABEL_34:
  uint64_t v15 = sub_1C1F03760(v1, v2);

  swift_release();
  return (void *)v15;
}

uint64_t sub_1C1F03760(void *a1, unint64_t a2)
{
  os_log_type_t v5 = sub_1C1F08AF8();
  id v6 = (id)HKLogHealthOntology();
  unint64_t v7 = a2 >> 62;
  uint64_t v35 = v2;
  if (os_log_type_enabled(v6, v5))
  {
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    id v8 = a1;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t aBlock = v33;
    *(_DWORD *)uint64_t v9 = 136446722;
    uint64_t v10 = sub_1C1F024CC();
    sub_1C1F056EC(v10, v11, &aBlock);
    sub_1C1F08B48();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2050;
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_1C1F08C08();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1C1F08B48();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 2114;
    id v12 = v8;
    sub_1C1F08B48();
    void *v32 = v8;

    _os_log_impl(&dword_1C1EFB000, v6, v5, "%{public}s merge %{public}ld duplicate lists into %{public}@", (uint8_t *)v9, 0x20u);
    sub_1C1F00E6C(0, &qword_1EA2C2610, &qword_1EA2C2618, 0x1E4FBA8A8, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1C874F5C0](v32, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1C874F5C0](v33, -1, -1);
    MEMORY[0x1C874F5C0](v9, -1, -1);

    unint64_t v7 = a2 >> 62;
  }
  else
  {
  }
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = a1;
  if (!v7)
  {
    uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    id v14 = a1;
    if (v13) {
      goto LABEL_8;
    }
LABEL_18:
    uint64_t v22 = a1;
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void **)(v35 + 64);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v35;
    *(void *)(v25 + 24) = v34;
    uint64_t v40 = sub_1C1F07820;
    uint64_t v41 = v25;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    unint64_t v37 = 1107296256;
    uint64_t v38 = sub_1C1F040B0;
    uint64_t v39 = &block_descriptor_42;
    uint64_t v26 = _Block_copy(&aBlock);
    swift_retain();
    id v27 = v22;
    swift_retain();
    swift_release();
    objc_msgSend(v24, sel_saveOrUpdateUserDomainConcept_completion_, v27, v26);
    _Block_release(v26);

    swift_beginAccess();
    id v28 = *(id *)(v34 + 16);
    swift_release();
    return (uint64_t)v28;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  id v23 = a1;
  uint64_t v13 = sub_1C1F08C08();
  if (!v13) {
    goto LABEL_18;
  }
LABEL_8:
  unint64_t v15 = a2;
  unint64_t v16 = a2 & 0xC000000000000001;
  uint64_t v17 = 4;
  while (1)
  {
    if (v16) {
      id v18 = (id)MEMORY[0x1C874F020](v17 - 4, v15);
    }
    else {
      id v18 = *(id *)(v15 + 8 * v17);
    }
    uint64_t v19 = v18;
    uint64_t v20 = v17 - 3;
    if (__OFADD__(v17 - 4, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    a2 = (unint64_t)objc_msgSend(a1, sel_copyUserDomainConceptByMergingInConcept_, v18);
    self;
    uint64_t v21 = swift_dynamicCastObjCClass();
    if (!v21) {
      break;
    }
    uint64_t v22 = (void *)v21;

    *(void *)(v34 + 16) = v22;
    ++v17;
    a1 = v22;
    if (v20 == v13) {
      goto LABEL_19;
    }
  }

  uint64_t aBlock = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_1C1F08B78();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0x7420656C62616E55;
  unint64_t v37 = 0xEF2074736163206FLL;
  id v30 = a1;
  id v31 = objc_msgSend(v30, sel_description);
  sub_1C1F089B8();

  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  sub_1C1F089D8();
  uint64_t result = sub_1C1F08BF8();
  __break(1u);
  return result;
}

uint64_t sub_1C1F03CDC(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1C1F087B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    os_log_type_t v11 = sub_1C1F08AE8();
    id v12 = (id)HKLogHealthOntology();
    if (os_log_type_enabled(v12, v11))
    {
      swift_retain();
      swift_retain();
      id v13 = a2;
      swift_retain();
      swift_retain();
      id v14 = a2;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v33[0] = v30;
      *(_DWORD *)uint64_t v15 = 136446722;
      int v29 = v11;
      uint64_t v16 = sub_1C1F024CC();
      uint64_t v32 = sub_1C1F056EC(v16, v17, v33);
      sub_1C1F08B48();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      swift_beginAccess();
      id v18 = objc_msgSend(*(id *)(a4 + 16), sel_UUID);
      sub_1C1F087A8();

      sub_1C1EFF5D0(&qword_1EA2C2628, MEMORY[0x1E4F27990]);
      uint64_t v19 = sub_1C1F08C38();
      os_log_t v28 = v12;
      unint64_t v21 = v20;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t v31 = sub_1C1F056EC(v19, v21, v33);
      sub_1C1F08B48();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2082;
      uint64_t v31 = (uint64_t)a2;
      id v22 = a2;
      sub_1C1F076F0(0, &qword_1EBB7F860, (unint64_t *)&qword_1EBB7F810, MEMORY[0x1E4FBC0E8], MEMORY[0x1E4FBB718]);
      uint64_t v23 = sub_1C1F089C8();
      uint64_t v31 = sub_1C1F056EC(v23, v24, v33);
      sub_1C1F08B48();
      swift_bridgeObjectRelease();

      os_log_t v25 = v28;
      _os_log_impl(&dword_1C1EFB000, v28, (os_log_type_t)v29, "%{public}s error persisting merged list %{public}s: %{public}s", (uint8_t *)v15, 0x20u);
      uint64_t v26 = v30;
      swift_arrayDestroy();
      MEMORY[0x1C874F5C0](v26, -1, -1);
      MEMORY[0x1C874F5C0](v15, -1, -1);
    }
    else
    {
    }
  }
  swift_beginAccess();
  LOBYTE(v31) = 1;
  swift_retain();
  sub_1C1F08848();
  return swift_release();
}

void sub_1C1F040B0(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1C1F04128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = v3;
  uint64_t v8 = *v3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v4;
  uint64_t v10 = (void *)v4[8];
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  id v12 = (void *)swift_allocObject();
  void v12[2] = v8;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = v9;
  v12[6] = v11;
  v15[4] = sub_1C1F07654;
  v15[5] = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  void v15[2] = sub_1C1F040B0;
  v15[3] = &block_descriptor_30;
  id v13 = _Block_copy(v15);
  swift_retain();
  sub_1C1F07228(a2);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_saveOrUpdateUserDomainConcept_completion_, a1, v13);
  _Block_release(v13);
  return swift_release();
}

uint64_t sub_1C1F042B4(char a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  id v35 = a2;
  uint64_t v10 = sub_1C1F08938();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unint64_t v37 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1C1F08958();
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  id v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    int v32 = sub_1C1F08AE8();
    id v31 = (id)HKLogHealthOntology();
    sub_1C1F076F0(0, &qword_1EA2C25F0, &qword_1EA2C25F8, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v15 = swift_allocObject();
    uint64_t v34 = v11;
    uint64_t v16 = (void *)v15;
    *(_OWORD *)(v15 + 16) = xmmword_1C1F09340;
    aBlock[0] = a3;
    sub_1C1F07664();
    uint64_t v17 = sub_1C1F089C8();
    uint64_t v19 = v18;
    v16[7] = MEMORY[0x1E4FBB1A0];
    unint64_t v20 = sub_1C1F0769C();
    uint64_t v33 = v10;
    unint64_t v21 = v20;
    v16[8] = v20;
    v16[4] = v17;
    v16[5] = v19;
    aBlock[0] = v35;
    id v22 = v35;
    sub_1C1F076F0(0, &qword_1EBB7F860, (unint64_t *)&qword_1EBB7F810, MEMORY[0x1E4FBC0E8], MEMORY[0x1E4FBB718]);
    uint64_t v23 = sub_1C1F089C8();
    v16[12] = MEMORY[0x1E4FBB1A0];
    v16[13] = v21;
    uint64_t v10 = v33;
    v16[9] = v23;
    v16[10] = v24;
    os_log_t v25 = v31;
    sub_1C1F087E8();

    uint64_t v11 = v34;
    swift_bridgeObjectRelease();
  }
  if (a4) {
    a4(a1 & 1);
  }
  swift_beginAccess();
  *(void *)(a6 + 16) = 0;
  swift_release();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v27 = result;
    id v28 = sub_1C1EFF618();
    aBlock[4] = sub_1C1F07B58;
    void aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C1EFD180;
    aBlock[3] = &block_descriptor_33;
    int v29 = _Block_copy(aBlock);
    swift_retain();
    sub_1C1F08948();
    uint64_t v39 = MEMORY[0x1E4FBC860];
    sub_1C1EFF5D0(&qword_1EBB7F7A0, MEMORY[0x1E4FBCB00]);
    sub_1C1EFF780(0, &qword_1EBB7F7A8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1C1F000C0();
    uint64_t v30 = v37;
    sub_1C1F08B68();
    MEMORY[0x1C874EF80](0, v14, v30, v29);
    _Block_release(v29);
    swift_release();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v30, v10);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v38);
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1F04774(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1C1F08938();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = sub_1C1F08958();
  uint64_t v11 = *(void *)(v20[0] - 8);
  MEMORY[0x1F4188790](v20[0]);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v14 = a1[1];
  v22[0] = *a1;
  v22[1] = v14;
  v23[0] = a1[2];
  *(_OWORD *)((char *)v23 + 9) = *(_OWORD *)((char *)a1 + 41);
  id v15 = sub_1C1EFF618();
  uint64_t v16 = swift_allocObject();
  long long v17 = a1[1];
  *(_OWORD *)(v16 + 24) = *a1;
  *(void *)(v16 + 16) = v3;
  *(_OWORD *)(v16 + 40) = v17;
  *(_OWORD *)(v16 + 56) = a1[2];
  *(_OWORD *)(v16 + 65) = *(_OWORD *)((char *)a1 + 41);
  *(void *)(v16 + 88) = a2;
  *(void *)(v16 + 96) = a3;
  aBlock[4] = sub_1C1F071B4;
  void aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1EFD180;
  aBlock[3] = &block_descriptor_3;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  sub_1C1F071C4((void **)v22);
  sub_1C1F07228(a2);
  sub_1C1F08948();
  v20[1] = MEMORY[0x1E4FBC860];
  sub_1C1EFF5D0(&qword_1EBB7F7A0, MEMORY[0x1E4FBCB00]);
  sub_1C1EFF780(0, &qword_1EBB7F7A8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1F000C0();
  sub_1C1F08B68();
  MEMORY[0x1C874EF80](0, v13, v10, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, void))(v11 + 8))(v13, v20[0]);
  return swift_release();
}

void sub_1C1F04A94(uint64_t a1, void **a2, void (*a3)(uint64_t), uint64_t a4)
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *a2;
  if (v19)
  {
    if (!v7)
    {
LABEL_13:
      if (a3) {
        a3(1);
      }

      return;
    }
    id v8 = v7;
    id v9 = objc_msgSend(v8, sel_linkCollection);
    id v10 = objc_msgSend(v19, sel_linkCollection);
    uint64_t v11 = v10;
    if (v9)
    {
      if (v10)
      {
        sub_1C1F00D44(0, &qword_1EA2C2630);
        id v12 = v9;
        char v13 = sub_1C1F08B28();

        if ((v13 & 1) == 0) {
          goto LABEL_21;
        }
        goto LABEL_12;
      }
      uint64_t v11 = v9;
    }
    else if (!v10)
    {
LABEL_12:

      goto LABEL_13;
    }

LABEL_21:
    id v18 = objc_msgSend(v19, sel_copyUserDomainConceptByMergingInConcept_, v8);
    sub_1C1F04128((uint64_t)v18, (uint64_t)a3, a4);

    return;
  }
  if (v7)
  {
    id v14 = v7;
    id v15 = objc_msgSend(v14, sel_linkCollection);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = (uint64_t)objc_msgSend(v15, sel_count);

      if (v17 >= 1)
      {
        sub_1C1F04128((uint64_t)v14, (uint64_t)a3, a4);

        return;
      }
    }
  }
  if (a3) {
    a3(1);
  }
}

uint64_t ListConceptManager.contains(_:)(uint64_t a1)
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  LOBYTE(a1) = sub_1C1F04D10(a1, v4);
  swift_bridgeObjectRelease();
  return a1 & 1;
}

uint64_t sub_1C1F04D10(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C1F08C08())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x1C874F020](0, a2);
LABEL_5:
      id v6 = v5;
      sub_1C1F00D44(0, (unint64_t *)&qword_1EBB7F7F8);
      char v7 = sub_1C1F08B28();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_1C1F08B28();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x1C874F020](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_1C1F08B28();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

BOOL ListConceptManager.isListItemsEmpty.getter()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v0 == 0;
}

BOOL ListConceptManager.isNonlistItemsEmpty.getter()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v0 == 0;
}

BOOL ListConceptManager.hasNoItems.getter()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v0) {
    return 0;
  }
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v2 == 0;
}

uint64_t ListConceptManager.listElements.getter()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v2;
}

uint64_t ListConceptManager.nonListElements.getter()
{
  sub_1C1F08858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v2;
}

__n128 ListConceptManagerState.state(byMoving:to:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v5 = *v3;
  uint64_t v7 = *((void *)v3 + 2);
  uint64_t v6 = *((void *)v3 + 3);
  unint64_t v9 = *((void *)v3 + 4);
  uint64_t v8 = *((void *)v3 + 5);
  uint64_t v10 = *((void *)v3 + 6);
  char v11 = *((unsigned char *)v3 + 56);
  id v26 = (id)v5;
  if (a1 != a2
    && (void)v5
    && (long long v25 = v5,
        id v12 = objc_msgSend((id)v5, sel_listByMovingUserDomainConceptFromIndex_toIndex_),
        long long v5 = v25,
        v12))
  {
    id v13 = v12;
    swift_bridgeObjectRetain();
    id v14 = objc_msgSend(v13, sel_listType);
    id v15 = objc_msgSend(v13, sel_listName);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = sub_1C1F089B8();
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    sub_1C1F01530(v9, v13, (uint64_t)v14, v17, v19, 0, (uint64_t)v27);
    uint64_t v22 = v28;
    char v23 = v29;
    long long v24 = v27[1];
    __n128 result = (__n128)v27[2];
    *(_OWORD *)a3 = v27[0];
    *(_OWORD *)(a3 + 16) = v24;
    *(__n128 *)(a3 + 32) = result;
    *(void *)(a3 + 48) = v22;
    *(unsigned char *)(a3 + 56) = v23;
  }
  else
  {
    *(_OWORD *)a3 = v5;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = v6;
    *(void *)(a3 + 32) = v9;
    *(void *)(a3 + 40) = v8;
    *(void *)(a3 + 48) = v10;
    *(unsigned char *)(a3 + 56) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v20 = v26;
  }
  return result;
}

double ListConceptManagerState.state(byRemoving:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_1C1F05380(a1, (SEL *)&selRef_listByRemovingUserDomainConcept_, a2).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = sub_1C1F05380(a1, (SEL *)&selRef_listByRemovingUserDomainConceptAtIndex_, a2).n128_u64[0];
  return result;
}

__n128 sub_1C1F05380@<Q0>(uint64_t a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  long long v5 = *v3;
  uint64_t v7 = *((void *)v3 + 2);
  uint64_t v6 = *((void *)v3 + 3);
  unint64_t v9 = *((void *)v3 + 4);
  uint64_t v8 = *((void *)v3 + 5);
  uint64_t v10 = *((void *)v3 + 6);
  char v11 = *((unsigned char *)v3 + 56);
  id v26 = (id)v5;
  if ((void)v5 && (v25 = v5, id v12 = objc_msgSend((id)v5, *a2, a1), v5 = v25, v12))
  {
    id v13 = v12;
    swift_bridgeObjectRetain();
    id v14 = objc_msgSend(v13, sel_listType);
    id v15 = objc_msgSend(v13, sel_listName);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = sub_1C1F089B8();
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    sub_1C1F01530(v9, v13, (uint64_t)v14, v17, v19, 0, (uint64_t)v27);
    uint64_t v22 = v28;
    char v23 = v29;
    long long v24 = v27[1];
    __n128 result = (__n128)v27[2];
    *(_OWORD *)a3 = v27[0];
    *(_OWORD *)(a3 + 16) = v24;
    *(__n128 *)(a3 + 32) = result;
    *(void *)(a3 + 48) = v22;
    *(unsigned char *)(a3 + 56) = v23;
  }
  else
  {
    *(_OWORD *)a3 = v5;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = v6;
    *(void *)(a3 + 32) = v9;
    *(void *)(a3 + 40) = v8;
    *(void *)(a3 + 48) = v10;
    *(unsigned char *)(a3 + 56) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v20 = v26;
  }
  return result;
}

__n128 ListConceptManagerState.state(byAdding:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 8);
  uint64_t v6 = *(void *)(v2 + 24);
  unint64_t v7 = *(void *)(v2 + 32);
  if (!*(void *)v2
    || (id v8 = objc_msgSend(*(id *)v2, sel_listByAddingUserDomainConcept_, a1)) == 0)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      unint64_t v9 = (void *)sub_1C1F089A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v9 = 0;
    }
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B148]), sel_initWithListType_listName_, v5, v9);

    id v8 = objc_msgSend(v10, sel_listByAddingUserDomainConcept_, a1);
  }
  unint64_t v25 = v7;
  swift_bridgeObjectRetain();
  id v11 = a1;
  MEMORY[0x1C874EE90]();
  if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1C1F08A78();
  }
  sub_1C1F08AA8();
  sub_1C1F08A58();
  id v12 = objc_msgSend(v8, sel_listType);
  id v13 = objc_msgSend(v8, sel_listName);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = sub_1C1F089B8();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  sub_1C1F01530(v25, v8, (uint64_t)v12, v15, v17, 0, (uint64_t)v22);
  uint64_t v18 = v23;
  char v19 = v24;
  long long v21 = v22[1];
  __n128 result = (__n128)v22[2];
  *(_OWORD *)a2 = v22[0];
  *(_OWORD *)(a2 + 16) = v21;
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = v18;
  *(unsigned char *)(a2 + 56) = v19;
  return result;
}

uint64_t sub_1C1F056EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C1F057C0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C1F07828((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C1F07828((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1C1F057C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C1F08B58();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C1F0597C(a5, a6);
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
  uint64_t v8 = sub_1C1F08BD8();
  if (!v8)
  {
    sub_1C1F08BE8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C1F08C28();
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

uint64_t sub_1C1F0597C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C1F05A14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C1F05C00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C1F05C00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C1F05A14(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C1F05B8C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C1F08B88();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C1F08BE8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C1F089E8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C1F08C28();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C1F08BE8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C1F05B8C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1C1F07884(0, &qword_1EA2C2620);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C1F05C00(char a1, int64_t a2, char a3, char *a4)
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
    sub_1C1F07884(0, &qword_1EA2C2620);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_1C1F08C28();
  __break(1u);
  return result;
}

uint64_t sub_1C1F05D5C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1C874F030](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1C1F05F28(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1C1F08A58();
}

uint64_t sub_1C1F05F28(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C1F08C08();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1C1F00E6C(0, &qword_1EBB7F7B8, (unint64_t *)&qword_1EBB7F7F8, 0x1E4F2B630, MEMORY[0x1E4FBB320]);
        sub_1C1F07AAC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          uint64_t v12 = sub_1C1F06164(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1C1F00D44(0, (unint64_t *)&qword_1EBB7F7F8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1C1F08C28();
  __break(1u);
  return result;
}

void (*sub_1C1F06164(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1C1F06214(v6, a2, a3);
  return sub_1C1F061CC;
}

void sub_1C1F061CC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1C1F06214(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1C874F020](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1C1F06294;
  }
  __break(1u);
  return result;
}

void sub_1C1F06294(id *a1)
{
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

uint64_t sub_1C1F062EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4FBC860];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        sub_1C1F00D44(0, &qword_1EBB7F800);
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      sub_1C1F07884(0, (unint64_t *)&qword_1EBB7F808);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_1C1F08C28();
  __break(1u);
  return result;
}

void *sub_1C1F06490(void *a1, uint64_t a2, char *a3, int a4, void *a5, uint64_t a6, uint64_t a7)
{
  int v48 = a4;
  uint64_t v47 = a3;
  id v45 = a1;
  uint64_t v43 = sub_1C1F08938();
  uint64_t v42 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  uint64_t v40 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_1C1F08958();
  uint64_t v39 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v38 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1EFF780(0, &qword_1EBB7F7D8, MEMORY[0x1E4FBCC28], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v38 - v14;
  sub_1C1F00148();
  uint64_t v46 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  char v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57[3] = a6;
  v57[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v57);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a2, a6);
  LOBYTE(aBlock) = 0;
  sub_1C1EFF0CC(0, &qword_1EBB7F778);
  swift_allocObject();
  uint64_t v21 = sub_1C1F08888();
  a5[3] = 0;
  a5[4] = 0;
  a5[2] = v21;
  if (qword_1EBB7F718 != -1) {
    swift_once();
  }
  long long v44 = xmmword_1EBB7F6D0;
  long long aBlock = xmmword_1EBB7F6D0;
  char v51 = (uint64_t (*)(uint64_t))qword_1EBB7F6E0;
  unint64_t v52 = (void *)unk_1EBB7F6E8;
  uint64_t v53 = (uint64_t (*)())qword_1EBB7F6F0;
  id v54 = (void *)unk_1EBB7F6F8;
  uint64_t v55 = qword_1EBB7F700;
  char v56 = byte_1EBB7F708;
  sub_1C1EFF0CC(0, &qword_1EBB7F770);
  swift_allocObject();
  uint64_t v22 = (void *)v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = v22;
  a5[5] = sub_1C1F08888();
  a5[6] = 0;
  a5[15] = 0;
  a5[16] = 0;
  a5[14] = 0;
  char v24 = v45;
  a5[7] = v45;
  id v25 = objc_allocWithZone(MEMORY[0x1E4F2B688]);
  id v26 = v24;
  a5[8] = objc_msgSend(v25, sel_initWithHealthStore_, v26);
  sub_1C1F00214((uint64_t)v57, (uint64_t)(a5 + 9));
  uint64_t v27 = v47;
  *(void *)&long long aBlock = *(void *)&v47[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcChangesSubject];
  swift_retain();
  id v49 = sub_1C1EFF618();
  uint64_t v28 = sub_1C1F08B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v15, 1, 1, v28);
  sub_1C1EFF0CC(0, (unint64_t *)&qword_1EBB7F858);
  sub_1C1F00D44(0, (unint64_t *)&unk_1EBB7F7E8);
  sub_1C1EFE7F8(&qword_1EBB7F850, (unint64_t *)&qword_1EBB7F858);
  sub_1C1EFF6A8();
  sub_1C1F08918();
  sub_1C1EFF710((uint64_t)v15, &qword_1EBB7F7D8, MEMORY[0x1E4FBCC28]);

  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_1C1EFF5D0(&qword_1EBB7F840, (void (*)(uint64_t))sub_1C1F00148);
  uint64_t v29 = v46;
  uint64_t v30 = sub_1C1F08928();
  swift_release();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v29);
  a5[15] = v30;
  swift_release();
  sub_1C1F087D8();
  sub_1C1EFF618();
  swift_allocObject();
  swift_weakInit();
  a5[14] = sub_1C1F087C8();
  swift_release();
  id v31 = v27;
  if (v48)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
  }
  else
  {
    id v32 = sub_1C1EFF618();
    uint64_t v53 = sub_1C1F07B58;
    id v54 = a5;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    char v51 = sub_1C1EFD180;
    unint64_t v52 = &block_descriptor_63;
    uint64_t v33 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v34 = v38;
    sub_1C1F08948();
    id v49 = (id)MEMORY[0x1E4FBC860];
    sub_1C1EFF5D0(&qword_1EBB7F7A0, MEMORY[0x1E4FBCB00]);
    sub_1C1EFF780(0, &qword_1EBB7F7A8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1C1F000C0();
    id v35 = v40;
    uint64_t v36 = v43;
    sub_1C1F08B68();
    MEMORY[0x1C874EF80](0, v34, v35, v33);
    _Block_release(v33);

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v41);
    swift_release();
  }
  return a5;
}

uint64_t sub_1C1F06CA4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = a2;
  uint64_t v40 = sub_1C1F087B8();
  uint64_t v5 = *(void (***)(char *, uint64_t))(v40 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v40);
  uint64_t v39 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v43 = MEMORY[0x1E4FBC860];
  if (a1 >> 62)
  {
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C1F08C08();
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_3:
      uint64_t v29 = v3;
      uint64_t v11 = 0;
      uint64_t v12 = v41 & 0xFFFFFFFFFFFFFF8;
      uint64_t v32 = v41 & 0xFFFFFFFFFFFFFF8;
      unint64_t v33 = a1;
      if (v41 < 0) {
        uint64_t v12 = v41;
      }
      uint64_t v30 = (char *)(a1 + 32);
      uint64_t v31 = v12;
      unint64_t v38 = v41 & 0xC000000000000001;
      uint64_t v13 = v5 + 1;
      unint64_t v35 = (unint64_t)v41 >> 62;
      unint64_t v36 = a1 & 0xC000000000000001;
      uint64_t v34 = v10;
      while (1)
      {
        if (v36) {
          uint64_t v14 = (char *)MEMORY[0x1C874F020](v11, v33);
        }
        else {
          uint64_t v14 = (char *)*(id *)&v30[8 * (void)v11];
        }
        uint64_t v42 = v14;
        BOOL v15 = __OFADD__(v11, 1);
        uint64_t v3 = (void (*)(char *, uint64_t))(v11 + 1);
        if (v15)
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        unint64_t v37 = (char *)v3;
        if (v35)
        {
          uint64_t v18 = v42;
          swift_bridgeObjectRetain();
          uint64_t v16 = sub_1C1F08C08();
          if (v16)
          {
LABEL_16:
            uint64_t v19 = 4;
            while (1)
            {
              if (v38) {
                id v20 = (id)MEMORY[0x1C874F020](v19 - 4, v41);
              }
              else {
                id v20 = *(id *)(v41 + 8 * v19);
              }
              a1 = (unint64_t)v20;
              uint64_t v21 = v19 - 3;
              if (__OFADD__(v19 - 4, 1))
              {
                __break(1u);
                goto LABEL_29;
              }
              id v22 = objc_msgSend(v20, sel_UUID);
              sub_1C1F087A8();

              id v23 = objc_msgSend(v42, sel_targetUUID);
              char v24 = v39;
              sub_1C1F087A8();

              LOBYTE(v23) = sub_1C1F08798();
              uint64_t v3 = *v13;
              id v25 = v24;
              uint64_t v5 = (void (**)(char *, uint64_t))v40;
              (*v13)(v25, v40);
              v3(v9, (uint64_t)v5);
              if (v23) {
                break;
              }

              ++v19;
              if (v21 == v16) {
                goto LABEL_6;
              }
            }
            id v26 = v42;

            uint64_t v27 = swift_bridgeObjectRelease();
            MEMORY[0x1C874EE90](v27);
            uint64_t v5 = *(void (***)(char *, uint64_t))((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if ((unint64_t)v5 >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1C1F08A78();
            }
            sub_1C1F08AA8();
            sub_1C1F08A58();
            goto LABEL_7;
          }
        }
        else
        {
          uint64_t v16 = *(void *)(v32 + 16);
          uint64_t v17 = v42;
          swift_bridgeObjectRetain();
          if (v16) {
            goto LABEL_16;
          }
        }
LABEL_6:
        uint64_t v5 = (void (**)(char *, uint64_t))v42;

        swift_bridgeObjectRelease();
LABEL_7:
        uint64_t v11 = v37;
        if (v37 == (char *)v34)
        {
          swift_bridgeObjectRelease();
          return v43;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

void *sub_1C1F07030(void *a1, uint64_t a2, char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = *(void *)(a6 - 8);
  MEMORY[0x1F4188790](a1);
  BOOL v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ListConceptManager();
  uint64_t v16 = (void *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, a6);
  return sub_1C1F06490(a1, (uint64_t)v15, a3, a4, v16, a6, a7);
}

uint64_t sub_1C1F07144()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 88)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 104, 7);
}

void sub_1C1F071B4()
{
  sub_1C1F04A94(*(void *)(v0 + 16), (void **)(v0 + 24), *(void (**)(uint64_t))(v0 + 88), *(void *)(v0 + 96));
}

void **sub_1C1F071C4(void **a1)
{
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

uint64_t sub_1C1F07228(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1C1F07238@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_retain();
}

uint64_t assignWithCopy for ListConceptManagerState(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for ListConceptManagerState(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

ValueMetadata *type metadata accessor for ListConceptManagerState()
{
  return &type metadata for ListConceptManagerState;
}

uint64_t method lookup function for ListConceptManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ListConceptManager);
}

uint64_t dispatch thunk of ListConceptManager.UUID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of ListConceptManager.listUDC.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ListConceptManager.currentState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of ListConceptManager.listName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of ListConceptManager.listType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of ListConceptManager.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of ListConceptManager.__allocating_init(healthStore:provider:udcChangeProvider:test_skipInitialLoad:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of ListConceptManager.test_hasPersistedMerge.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of ListConceptManager.test_hasPersistedMerge.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of ListConceptManager.test_hasPersistedMerge.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of ListConceptManager.test_forceReload()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of ListConceptManager.commit(state:onCommitHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t sub_1C1F07594()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1F075CC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1F07604()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C1F07654(char a1, void *a2)
{
  return sub_1C1F042B4(a1, a2, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

unint64_t sub_1C1F07664()
{
  unint64_t result = qword_1EA2C2600;
  if (!qword_1EA2C2600)
  {
    type metadata accessor for ListConceptManager();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA2C2600);
  }
  return result;
}

unint64_t sub_1C1F0769C()
{
  unint64_t result = qword_1EA2C2608;
  if (!qword_1EA2C2608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C2608);
  }
  return result;
}

void sub_1C1F076F0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1C1F07758(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1C1F07758(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1C1F077A8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1F077E0()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1F07820(char a1, void *a2)
{
  return sub_1C1F03CDC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1C1F07828(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1C1F07884(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1C1F08C48();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_1C1F078CC()
{
  if (!qword_1EBB7F7C0)
  {
    uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB320];
    sub_1C1F00E6C(255, &qword_1EBB7F7B8, (unint64_t *)&qword_1EBB7F7F8, 0x1E4F2B630, MEMORY[0x1E4FBB320]);
    sub_1C1F00E6C(255, &qword_1EBB7F7C8, &qword_1EBB7F800, 0x1E4F2B148, v0);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v2) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB7F7C0);
    }
  }
}

uint64_t sub_1C1F07990()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1F079C8(void **a1)
{
  return sub_1C1F02E60(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1C1F079D0(unint64_t a1, uint64_t a2)
{
  return sub_1C1F031BC(a1, a2);
}

uint64_t sub_1C1F079D8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1F07A10(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_1C1F07A40()
{
  return sub_1C1F027CC();
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

unint64_t sub_1C1F07AAC()
{
  unint64_t result = qword_1EA2C2638;
  if (!qword_1EA2C2638)
  {
    sub_1C1F00E6C(255, &qword_1EBB7F7B8, (unint64_t *)&qword_1EBB7F7F8, 0x1E4F2B630, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C2638);
  }
  return result;
}

uint64_t static HKHealthStore.makeConceptPublisher<A>(with:entity:predicate:)(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_1C1F08AD8();
  sub_1C1F07C5C();
  sub_1C1F08898();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a4;
  v7[3] = a3;
  v7[4] = a1;
  id v8 = a3;
  id v9 = a1;
  sub_1C1F088A8();
  swift_getWitnessTable();
  uint64_t v10 = sub_1C1F088E8();
  swift_release();
  return v10;
}

unint64_t sub_1C1F07C5C()
{
  unint64_t result = qword_1EBB7F810;
  if (!qword_1EBB7F810)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB7F810);
  }
  return result;
}

void sub_1C1F07CB4(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a5;
  v10[3] = a1;
  v10[4] = a2;
  uint64_t v11 = swift_allocObject();
  swift_retain();
  *(void *)(v11 + 16) = sub_1C1F08988();
  sub_1C1F009BC();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C1F09400;
  sub_1C1F089B8();
  id v13 = objc_allocWithZone(MEMORY[0x1E4F29008]);
  uint64_t v14 = (void *)sub_1C1F089A8();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithKey_ascending_, v14, 0);

  *(void *)(v12 + 32) = v15;
  sub_1C1F08A58();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a5;
  _OWORD v16[3] = a4;
  v16[4] = sub_1C1F084A8;
  v16[5] = v10;
  v16[6] = v11;
  id v17 = objc_allocWithZone(MEMORY[0x1E4F2B670]);
  sub_1C1F00D44(0, &qword_1EBB7F7D0);
  id v18 = a4;
  swift_retain();
  id v19 = a3;
  id v20 = (void *)sub_1C1F08A38();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_1C1F08530;
  uint64_t v30 = v16;
  unint64_t v25 = MEMORY[0x1E4F143A8];
  unint64_t v26 = 1107296256;
  uint64_t v27 = sub_1C1F003BC;
  uint64_t v28 = &block_descriptor_27;
  uint64_t v21 = _Block_copy(&v25);
  id v22 = objc_msgSend(v17, sel_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler_, v19, 0, 0, v20, v21);

  _Block_release(v21);
  swift_release();
  unint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  id v23 = v22;
  sub_1C1F08B78();
  swift_bridgeObjectRelease();
  unint64_t v25 = 0xD000000000000011;
  unint64_t v26 = 0x80000001C1F09A90;
  sub_1C1F08C68();
  sub_1C1F089D8();
  swift_bridgeObjectRelease();
  char v24 = (void *)sub_1C1F089A8();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setDebugIdentifier_, v24);

  objc_msgSend(v18, sel_executeQuery_, v23);
  swift_release();
}

uint64_t sub_1C1F07FD8()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1C1F08018(uint64_t a1, uint64_t a2)
{
  sub_1C1F07CB4(a1, a2, *(void **)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 16));
}

uint64_t sub_1C1F08024(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, void *a6, uint64_t (*a7)(uint64_t, uint64_t), uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v39 = a6;
  int v38 = a4;
  uint64_t v15 = sub_1C1F08B38();
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  id v18 = (char *)&v35 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  unint64_t v25 = (char *)&v35 - v24;
  if (a5)
  {
    objc_msgSend(v39, sel_stopQuery_, a1);
    return a7(a5, 1);
  }
  uint64_t v35 = v23;
  unint64_t v36 = a7;
  uint64_t v37 = a8;
  uint64_t v40 = a2;
  uint64_t v27 = v22;
  sub_1C1F08560(0, &qword_1EBB7F830, (unint64_t *)&qword_1EBB7F7F8, 0x1E4F2B630, MEMORY[0x1E4FBB718]);
  id v28 = a2;
  char v29 = swift_dynamicCast();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
  id v31 = v39;
  char v32 = v38;
  if ((v29 & 1) == 0)
  {
    v30(v18, 1, 1, a10);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v18, v15);
    unint64_t v33 = v36;
    if ((v32 & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
  v30(v18, 0, 1, a10);
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v25, v18, a10);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v21, v25, a10);
  swift_beginAccess();
  sub_1C1F08AD8();
  sub_1C1F08AB8();
  swift_endAccess();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v25, a10);
  unint64_t v33 = v36;
  if (v32)
  {
LABEL_7:
    objc_msgSend(v31, sel_stopQuery_, a1);
    swift_beginAccess();
    uint64_t v34 = swift_bridgeObjectRetain();
    v33(v34, 0);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C1F08388()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t dispatch thunk of ListConceptManagerDataProvider.listType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ListConceptManagerDataProvider.listName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ListConceptManagerDataProvider.makeAllConceptsPublisher(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_1C1F083FC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1F08438()
{
  return *(void *)v0;
}

uint64_t sub_1C1F08440()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C1F08470()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C1F084A8(uint64_t a1, char a2)
{
  unint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 24);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1C1F084E8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C1F08530(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1C1F08024(a1, a2, a3, a4, a5, *(void **)(v5 + 24), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32), *(void *)(v5 + 40), *(void *)(v5 + 48), *(void *)(v5 + 16));
}

void sub_1C1F08560(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1C1F00D44(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void *assignWithCopy for LabsListDataProvider(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LabsListDataProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LabsListDataProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LabsListDataProvider(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LabsListDataProvider()
{
  return &type metadata for LabsListDataProvider;
}

uint64_t sub_1C1F086FC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1F0873C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1F08798()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C1F087A8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C1F087B8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C1F087C8()
{
  return MEMORY[0x1F411F0E0]();
}

uint64_t sub_1C1F087D8()
{
  return MEMORY[0x1F411F0F8]();
}

uint64_t sub_1C1F087E8()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1C1F087F8()
{
  return MEMORY[0x1F40D6610]();
}

uint64_t sub_1C1F08808()
{
  return MEMORY[0x1F40D6618]();
}

uint64_t sub_1C1F08818()
{
  return MEMORY[0x1F40D67C0]();
}

uint64_t sub_1C1F08828()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1C1F08838()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1C1F08848()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1C1F08858()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1C1F08868()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1C1F08878()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1C1F08888()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1C1F08898()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1C1F088A8()
{
  return MEMORY[0x1F40D6B38]();
}

uint64_t sub_1C1F088B8()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1C1F088C8()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1C1F088D8()
{
  return MEMORY[0x1F40D6B78]();
}

uint64_t sub_1C1F088E8()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C1F088F8()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1C1F08908()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1C1F08918()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1C1F08928()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C1F08938()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C1F08948()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C1F08958()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C1F08968()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1C1F08978()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1C1F08988()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1C1F08998()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C1F089A8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C1F089B8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C1F089C8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C1F089D8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C1F089E8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C1F089F8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1C1F08A08()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1C1F08A18()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1C1F08A28()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C1F08A38()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C1F08A48()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C1F08A58()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C1F08A68()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1C1F08A78()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C1F08A88()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C1F08A98()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1C1F08AA8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C1F08AB8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1C1F08AC8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1C1F08AD8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C1F08AE8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C1F08AF8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C1F08B08()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1C1F08B18()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C1F08B28()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C1F08B38()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C1F08B48()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C1F08B58()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C1F08B68()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C1F08B78()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C1F08B88()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C1F08B98()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1C1F08BA8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1C1F08BB8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C1F08BC8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C1F08BD8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C1F08BE8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C1F08BF8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C1F08C08()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C1F08C18()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1C1F08C28()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C1F08C38()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C1F08C48()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C1F08C58()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C1F08C68()
{
  return MEMORY[0x1F4186318]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1F40E7BA0]();
}

uint64_t HKLogHealthOntology()
{
  return MEMORY[0x1F40E7DC8]();
}

uint64_t HKStringFromListUserDomainType()
{
  return MEMORY[0x1F40E7FE8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void free(void *a1)
{
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

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}