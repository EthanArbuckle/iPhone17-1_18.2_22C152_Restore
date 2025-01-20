id sub_22AF8065C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62BB8]), sel_init);
  qword_2683E3AE8 = (uint64_t)result;
  return result;
}

void sub_22AF80690()
{
  v2 = v0;
  if (qword_26AF40FA8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_22AF887E8();
  sub_22AF81D64(v3, (uint64_t)qword_26AF41020);
  v4 = sub_22AF887C8();
  os_log_type_t v5 = sub_22AF888F8();
  if (os_log_type_enabled(v4, v5))
  {
    v1 = (_WORD *)swift_slowAlloc();
    _WORD *v1 = 0;
    sub_22AF82634(&dword_22AF7E000, v6, v7, "Starting PeopleHarvester");
    sub_22AF825F8();
  }

  if (qword_2683E3AE0 != -1) {
    swift_once();
  }
  v8 = (void *)qword_2683E3AE8;
  objc_msgSend((id)qword_2683E3AE8, sel_setDiscoveryFlags_, 1180);
  objc_msgSend(v8, sel_setChangeFlags_, 0xFFFFFFFFLL);
  uint64_t v9 = v2[2];
  v24 = (void (*)(void *))v2[1];
  uint64_t v25 = v9;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_22AF80A20;
  v23 = &unk_26DE44D50;
  _Block_copy(&v20);
  sub_22AF825DC();
  swift_release();
  objc_msgSend(v8, sel_setInvalidationHandler_, v1);
  _Block_release(v1);
  v10 = (void *)qword_2683E3AE8;
  uint64_t v11 = v2[4];
  v24 = (void (*)(void *))v2[3];
  uint64_t v25 = v11;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_22AF80A64;
  v23 = &unk_26DE44D78;
  _Block_copy(&v20);
  sub_22AF825DC();
  swift_release();
  objc_msgSend(v10, sel_setPersonFoundHandler_, v1);
  _Block_release(v1);
  v12 = (void *)qword_2683E3AE8;
  uint64_t v13 = v2[6];
  v24 = (void (*)(void *))v2[5];
  uint64_t v25 = v13;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_22AF80A64;
  v23 = &unk_26DE44DA0;
  _Block_copy(&v20);
  sub_22AF825DC();
  swift_release();
  objc_msgSend(v12, sel_setPersonLostHandler_, v1);
  _Block_release(v1);
  v14 = (void *)qword_2683E3AE8;
  v15 = (void (*)(void *))v2[7];
  uint64_t v16 = v2[8];
  v24 = v15;
  uint64_t v25 = v16;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_22AF80ACC;
  v23 = &unk_26DE44DC8;
  v17 = _Block_copy(&v20);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setPersonChangedHandler_, v17);
  _Block_release(v17);
  v18 = (void *)qword_2683E3AE8;
  v24 = sub_22AF80B40;
  uint64_t v25 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_22AF80DE4;
  v23 = &unk_26DE44DF0;
  v19 = _Block_copy(&v20);
  objc_msgSend(v18, sel_activateWithCompletion_, v19);
  _Block_release(v19);
}

uint64_t sub_22AF80A20(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_22AF80A64(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_22AF80ACC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_22AF80B40(void *a1)
{
  if (a1)
  {
    if (qword_26AF40FA8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_22AF887E8();
    sub_22AF81D64(v2, (uint64_t)qword_26AF41020);
    id v3 = a1;
    id v4 = a1;
    oslog = sub_22AF887C8();
    os_log_type_t v5 = sub_22AF888F8();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v14 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_getErrorValue();
      uint64_t v8 = sub_22AF88A38();
      sub_22AF87D5C(v8, v9, &v14);
      sub_22AF88958();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22AF7E000, oslog, v5, "PeopleHarvester: Error in activating peopleDiscovery:%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F38300](v7, -1, -1);
      MEMORY[0x230F38300](v6, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_26AF40FA8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_22AF887E8();
    sub_22AF81D64(v10, (uint64_t)qword_26AF41020);
    oslog = sub_22AF887C8();
    os_log_type_t v11 = sub_22AF888F8();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22AF7E000, oslog, v11, "PeopleHarvester: Successfully activated peopleDiscovery", v12, 2u);
      MEMORY[0x230F38300](v12, -1, -1);
    }
  }
}

void sub_22AF80DE4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_22AF80E50(void *a1, uint64_t a2, unint64_t a3)
{
  if (qword_26AF40FA8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_22AF887E8();
  sub_22AF81D64(v6, (uint64_t)qword_26AF41020);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_22AF887C8();
  os_log_type_t v8 = sub_22AF888F8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v21 = a1;
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_22AF87D5C(a2, a3, &v22);
    sub_22AF88958();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22AF7E000, v7, v8, "%s called", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F38300](v10, -1, -1);
    os_log_type_t v11 = v9;
    a1 = v21;
    MEMORY[0x230F38300](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v12 = a1;
  uint64_t v13 = sub_22AF887C8();
  os_log_type_t v14 = sub_22AF888F8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = v16;
    *(_DWORD *)v15 = 136315138;
    id v17 = objc_msgSend(v12, sel_description);
    uint64_t v18 = sub_22AF88848();
    unint64_t v20 = v19;

    sub_22AF87D5C(v18, v20, &v22);
    sub_22AF88958();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AF7E000, v13, v14, "Person = %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F38300](v16, -1, -1);
    MEMORY[0x230F38300](v15, -1, -1);
  }
  else
  {
  }
}

void sub_22AF8114C()
{
  if (qword_26AF40FA8 != -1) {
LABEL_20:
  }
    swift_once();
  uint64_t v0 = sub_22AF887E8();
  sub_22AF81D64(v0, (uint64_t)qword_26AF41020);
  v1 = sub_22AF887C8();
  os_log_type_t v2 = sub_22AF888F8();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22AF7E000, v1, v2, "Ingesting event into the PeopleDiscoveryBiomeStream", v3, 2u);
    MEMORY[0x230F38300](v3, -1, -1);
  }

  id v25 = objc_msgSend(objc_msgSend((id)BiomeLibrary(), sel_ContextualUnderstanding), sel_PeopleDiscovery);
  swift_unknownObjectRelease();
  uint64_t v31 = MEMORY[0x263F8EE78];
  if (qword_2683E3AE0 != -1) {
    swift_once();
  }
  id v4 = objc_msgSend((id)qword_2683E3AE8, sel_discoveredPeople);
  sub_22AF82094(0, &qword_2683E3BE0);
  unint64_t v5 = sub_22AF888A8();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_8;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    sub_22AF82094(0, &qword_2683E3BE8);
    id v23 = sub_22AF815DC();
    id v24 = objc_msgSend(v25, sel_source);
    objc_msgSend(v24, sel_sendEvent_, v23);

    swift_unknownObjectRelease();

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_22AF889F8();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_22;
  }
LABEL_8:
  unint64_t v27 = v5;
  unint64_t v28 = v5 & 0xC000000000000001;
  uint64_t v7 = 4;
  uint64_t v26 = v6;
  while (1)
  {
    if (v28) {
      id v8 = (id)MEMORY[0x230F37E20](v7 - 4, v5);
    }
    else {
      id v8 = *(id *)(v5 + 8 * v7);
    }
    unint64_t v9 = v8;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_20;
    }
    uint64_t v30 = v7 - 3;
    uint64_t v10 = sub_22AF82034(v8, (SEL *)&selRef_contactID);
    uint64_t v29 = v11;
    id v12 = objc_msgSend(v9, sel_identifier);
    uint64_t v13 = sub_22AF88848();
    uint64_t v15 = v14;

    uint64_t v16 = sub_22AF82034(v9, (SEL *)&selRef_name);
    uint64_t v18 = v17;
    objc_msgSend(v9, sel_flags);
    unint64_t v19 = (void *)sub_22AF88A68();
    if ((objc_msgSend(v9, sel_activityLevel) & 0x80000000) != 0) {
      break;
    }
    unint64_t v20 = (void *)sub_22AF88A68();
    if ((objc_msgSend(v9, sel_proximity) & 0x80000000) != 0) {
      break;
    }
    uint64_t v21 = (void *)sub_22AF88A68();
    id v22 = objc_allocWithZone(MEMORY[0x263F2A010]);
    sub_22AF81E94(v10, v29, v13, v15, v16, v18, v19, v20, v21);
    MEMORY[0x230F37CF0]();
    if (*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_22AF888C8();
    }
    sub_22AF888D8();
    sub_22AF888B8();

    ++v7;
    unint64_t v5 = v27;
    if (v30 == v26) {
      goto LABEL_22;
    }
  }
  sub_22AF889E8();
  __break(1u);
}

id sub_22AF815DC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_22AF82094(0, &qword_2683E3BF0);
  v1 = (void *)sub_22AF88898();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithDiscoveredPersons_, v1);

  return v2;
}

void sub_22AF81664()
{
  if (qword_26AF40FA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22AF887E8();
  sub_22AF81D64(v0, (uint64_t)qword_26AF41020);
  v1 = sub_22AF887C8();
  os_log_type_t v2 = sub_22AF888F8();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22AF7E000, v1, v2, "PeopleHarvester: Invalidation handler called", v3, 2u);
    MEMORY[0x230F38300](v3, -1, -1);
  }

  sub_22AF8114C();
}

void sub_22AF8174C(void *a1)
{
  sub_22AF80E50(a1, 0xD000000000000012, 0x800000022AF89D80);
  sub_22AF8114C();
}

void sub_22AF8178C(void *a1)
{
  sub_22AF80E50(a1, 0xD000000000000011, 0x800000022AF89D60);
  sub_22AF8114C();
}

void sub_22AF817CC(void *a1)
{
  sub_22AF80E50(a1, 0xD000000000000014, 0x800000022AF89CF0);
  sub_22AF8114C();
}

uint64_t sub_22AF8180C()
{
  return *v0;
}

uint64_t sub_22AF81818()
{
  if (qword_26AF40FA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22AF887E8();
  sub_22AF81D64(v0, (uint64_t)qword_26AF41020);
  v1 = sub_22AF887C8();
  os_log_type_t v2 = sub_22AF888F8();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22AF7E000, v1, v2, "Starting AmbientLightHarvester", v3, 2u);
    sub_22AF825F8();
  }

  sub_22AF887B8();
  sub_22AF887A8();
  return swift_release();
}

uint64_t sub_22AF81908()
{
  return sub_22AF81818();
}

uint64_t sub_22AF81910()
{
  sub_22AF81FA0(&qword_26AF40FC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22AF88FC0;
  *(void *)(v0 + 56) = &type metadata for PeopleHarvester;
  *(void *)(v0 + 64) = &off_26DE44D38;
  uint64_t result = swift_allocObject();
  *(void *)(v0 + 32) = result;
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = sub_22AF81664;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = sub_22AF8174C;
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = sub_22AF8178C;
  *(void *)(result + 64) = 0;
  *(void *)(result + 72) = sub_22AF817CC;
  *(void *)(result + 80) = 0;
  *(void *)(v0 + 96) = &type metadata for AmbientLightHarvester;
  *(void *)(v0 + 104) = &off_26DE44D20;
  *(unsigned char *)(v0 + 72) = 0;
  qword_26AF41038 = v0;
  return result;
}

uint64_t sub_22AF819F8()
{
  if (qword_26AF40FA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22AF887E8();
  sub_22AF81D64(v0, (uint64_t)qword_26AF41020);
  v1 = sub_22AF887C8();
  os_log_type_t v2 = sub_22AF888F8();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_22AF82634(&dword_22AF7E000, v3, v4, "Starting to harvest evidence");
    sub_22AF825F8();
  }

  if (qword_26AF40FC0 != -1) {
    swift_once();
  }
  uint64_t result = qword_26AF41038;
  uint64_t v6 = *(void *)(qword_26AF41038 + 16);
  if (v6)
  {
    uint64_t v7 = qword_26AF41038 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_22AF81D9C(v7, (uint64_t)v35);
      uint64_t v8 = v36;
      uint64_t v9 = v37;
      sub_22AF81E00(v35, v36);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9) & 1) == 0) {
        break;
      }
      sub_22AF88798();
      if (sub_22AF88788())
      {
        sub_22AF81D9C((uint64_t)v35, (uint64_t)v34);
        uint64_t v10 = sub_22AF887C8();
        os_log_type_t v11 = sub_22AF888F8();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = swift_slowAlloc();
          uint64_t v13 = swift_slowAlloc();
          sub_22AF82610(v13, v14, v15, v16, v17, v18);
          sub_22AF81FA0((uint64_t *)&unk_26AF40FB0);
          uint64_t v19 = sub_22AF88858();
          *(void *)(v12 + 4) = sub_22AF87D5C(v19, v20, &v33);
          swift_bridgeObjectRelease();
          sub_22AF81E44((uint64_t)v34);
          sub_22AF825B4();
          swift_arrayDestroy();
          goto LABEL_15;
        }
LABEL_16:
        sub_22AF81E44((uint64_t)v34);
        goto LABEL_17;
      }
LABEL_18:
      sub_22AF81E44((uint64_t)v35);
      v7 += 40;
      if (!--v6) {
        return swift_bridgeObjectRelease();
      }
    }
    sub_22AF81D9C((uint64_t)v35, (uint64_t)v34);
    uint64_t v10 = sub_22AF887C8();
    os_log_type_t v21 = sub_22AF888F8();
    if (!os_log_type_enabled(v10, v21)) {
      goto LABEL_16;
    }
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    sub_22AF82610(v23, v24, v25, v26, v27, v28);
    sub_22AF81FA0((uint64_t *)&unk_26AF40FB0);
    uint64_t v29 = sub_22AF88858();
    *(void *)(v22 + 4) = sub_22AF87D5C(v29, v30, &v33);
    swift_bridgeObjectRelease();
    sub_22AF81E44((uint64_t)v34);
    sub_22AF825B4();
    swift_arrayDestroy();
LABEL_15:
    sub_22AF825F8();
    sub_22AF825F8();
LABEL_17:

    uint64_t v31 = v36;
    uint64_t v32 = v37;
    sub_22AF81E00(v35, v36);
    (*(void (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
    goto LABEL_18;
  }
  return result;
}

uint64_t sub_22AF81D64(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_22AF81D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_22AF81E00(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_22AF81E44(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_22AF81E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  uint64_t v10 = v9;
  if (a2)
  {
    uint64_t v15 = (void *)sub_22AF88838();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (!a4)
  {
    int v16 = 0;
    if (a6) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v17 = 0;
    goto LABEL_9;
  }
  int v16 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v17 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
LABEL_9:
  id v18 = objc_msgSend(v10, sel_initWithContactID_identifier_name_flags_activityLevel_proximity_, v15, v16, v17, a7, a8, a9);

  return v18;
}

uint64_t sub_22AF81FA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_22AF81FE4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_22AF82034(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_22AF88848();

  return v4;
}

uint64_t sub_22AF82094(uint64_t a1, unint64_t *a2)
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

unsigned char *initializeBufferWithCopyOfBuffer for AmbientLightHarvester(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AmbientLightHarvester(unsigned __int8 *a1, unsigned int a2)
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
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AmbientLightHarvester(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22AF82244);
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

ValueMetadata *type metadata accessor for AmbientLightHarvester()
{
  return &type metadata for AmbientLightHarvester;
}

uint64_t initializeBufferWithCopyOfBuffer for PeopleHarvester(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PeopleHarvester()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PeopleHarvester(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PeopleHarvester(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for PeopleHarvester(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for PeopleHarvester(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleHarvester(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for PeopleHarvester(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleHarvester()
{
  return &type metadata for PeopleHarvester;
}

uint64_t sub_22AF82530(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_22AF82540()
{
  return swift_release();
}

void type metadata accessor for RPPersonChangeFlags()
{
  if (!qword_2683E3BF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2683E3BF8);
    }
  }
}

void sub_22AF825B4()
{
  _os_log_impl(v1, v0, v4, v2, v3, 0xCu);
}

uint64_t sub_22AF825DC()
{
  return swift_retain();
}

void sub_22AF825F8()
{
  JUMPOUT(0x230F38300);
}

uint64_t sub_22AF82610(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_arg(va1, void);
  uint64_t v15 = a1;
  *uint64_t v6 = a4;
  return sub_22AF81D9C((uint64_t)va1, (uint64_t)va);
}

void sub_22AF82634(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t static EvidenceSystem.start()()
{
  if (qword_26AF40FA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22AF887E8();
  sub_22AF81D64(v0, (uint64_t)qword_26AF41020);
  uint64_t v1 = sub_22AF887C8();
  os_log_type_t v2 = sub_22AF888F8();
  if (os_log_type_enabled(v1, v2))
  {
    long long v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_22AF7E000, v1, v2, "Starting ContextualUnderstandingEvidence System", v3, 2u);
    MEMORY[0x230F38300](v3, -1, -1);
  }

  return sub_22AF819F8();
}

id EvidenceSystem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id EvidenceSystem.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EvidenceSystem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EvidenceSystem()
{
  return self;
}

id sub_22AF82840()
{
  sub_22AF81FA0(&qword_2683E3D80);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22AF890A0;
  type metadata accessor for ContactStoreManager();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
  id result = (id)BiomeLibrary();
  *(void *)(v0 + 56) = &type metadata for SocialContextInference;
  *(void *)(v0 + 64) = &off_26DE45170;
  *(void *)(v0 + 32) = result;
  *(void *)(v0 + 40) = v1;
  qword_2683E3E20 = v0;
  return result;
}

uint64_t static InferenceEngine.start()()
{
  sub_22AF88798();
  uint64_t result = sub_22AF88778();
  if (result)
  {
    if (qword_2683E3B10 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_22AF887E8();
    sub_22AF81D64(v1, (uint64_t)qword_2683E3E38);
    objc_super v2 = sub_22AF887C8();
    os_log_type_t v3 = sub_22AF888F8();
    if (os_log_type_enabled(v2, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v4 = 0;
      _os_log_impl(&dword_22AF7E000, v2, v3, "Started contextual understanding inference engine", v4, 2u);
      MEMORY[0x230F38300](v4, -1, -1);
    }

    if (qword_2683E3AF8 != -1) {
      swift_once();
    }
    uint64_t result = qword_2683E3E20;
    uint64_t v5 = *(void *)(qword_2683E3E20 + 16);
    if (v5)
    {
      uint64_t v6 = (void *)(qword_2683E3E20 + 32);
      swift_bridgeObjectRetain();
      do
      {
        uint64_t v7 = sub_22AF81E00(v6, v6[3]);
        uint64_t v8 = *v7;
        uint64_t v9 = v7[1];
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = v8;
        *(void *)(v10 + 24) = v9;
        swift_unknownObjectRetain();
        swift_retain();
        sub_22AF82CF8((uint64_t)sub_22AF82C58, v10, 0xD000000000000047);
        swift_release();
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = v8;
        *(void *)(v11 + 24) = v9;
        swift_unknownObjectRetain();
        swift_retain();
        sub_22AF83228((uint64_t)sub_22AF82CA4, v11, 0xD000000000000045);
        swift_release();
        v6 += 5;
        --v5;
      }
      while (v5);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

id InferenceEngine.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id InferenceEngine.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id InferenceEngine.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22AF82C58(uint64_t a1, uint64_t a2)
{
  return sub_22AF866EC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_22AF82C64()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22AF82CA4(uint64_t a1, uint64_t a2)
{
  return sub_22AF84408(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t type metadata accessor for InferenceEngine()
{
  return self;
}

id sub_22AF82CD0()
{
  id result = (id)BiomeLibrary();
  qword_2683E3E28 = (uint64_t)result;
  return result;
}

void sub_22AF82CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22AF83A00(a1, a2, a3);
  sub_22AF838D8();
  MEMORY[0x270FA5388]();
  sub_22AF8394C();
  sub_22AF839CC();
  MEMORY[0x270FA5388]();
  sub_22AF83924();
  MEMORY[0x270FA5388]();
  sub_22AF839B4();
  if (qword_2683E3B10 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22AF887E8();
  sub_22AF81D64(v4, (uint64_t)qword_2683E3E38);
  uint64_t v5 = sub_22AF887C8();
  os_log_type_t v6 = sub_22AF888F8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (_WORD *)swift_slowAlloc();
    *uint64_t v7 = 0;
    sub_22AF839E0(&dword_22AF7E000, v8, v9, "Registering for PeopleDiscoveryStreamSubscription");
    MEMORY[0x230F38300](v7, -1, -1);
  }

  sub_22AF836CC();
  sub_22AF887F8();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_22AF8370C();
  sub_22AF81FA0(&qword_2683E3D98);
  unint64_t v10 = sub_22AF8375C();
  sub_22AF838F8(v10);
  uint64_t v11 = sub_22AF8399C();
  v12(v11);
  uint64_t v13 = (void *)sub_22AF83974(82, 0x800000022AF89F90);
  id v14 = objc_allocWithZone(MEMORY[0x263F2A758]);
  swift_bridgeObjectRetain();
  id v15 = sub_22AF83A20(v13);
  if (qword_2683E3B00 != -1) {
    swift_once();
  }
  id v16 = objc_msgSend(objc_msgSend((id)qword_2683E3E28, sel_ContextualUnderstanding), sel_PeopleDiscovery);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v16, sel_DSLPublisher);
  id v18 = objc_msgSend(v17, sel_subscribeOn_, v15);

  uint64_t v29 = (void (*)(void *))nullsub_1;
  uint64_t v30 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_22AF80A64;
  uint64_t v28 = &unk_26DE44F08;
  uint64_t v19 = _Block_copy(&aBlock);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v23;
  *(void *)(v20 + 24) = v24;
  uint64_t v29 = sub_22AF838B4;
  uint64_t v30 = v20;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_22AF831A0;
  uint64_t v28 = &unk_26DE44F58;
  os_log_type_t v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v22 = objc_msgSend(v18, sel_sinkWithCompletion_receiveInput_, v19, v21);
  _Block_release(v21);
  _Block_release(v19);
}

void sub_22AF830E8(void *a1, void (*a2)(id, void))
{
  if (objc_msgSend(a1, sel_respondsToSelector_, sel_eventBody))
  {
    id v4 = objc_msgSend(a1, sel_eventBody);
    if (v4)
    {
      id v5 = v4;
      id v6 = v4;
      a2(v5, 0);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22AF831A0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_22AF83200()
{
  id result = (id)BiomeLibrary();
  qword_2683E3E30 = (uint64_t)result;
  return result;
}

void sub_22AF83228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22AF83A00(a1, a2, a3);
  sub_22AF838D8();
  MEMORY[0x270FA5388]();
  sub_22AF8394C();
  sub_22AF839CC();
  MEMORY[0x270FA5388]();
  sub_22AF83924();
  MEMORY[0x270FA5388]();
  sub_22AF839B4();
  if (qword_2683E3B10 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22AF887E8();
  sub_22AF81D64(v4, (uint64_t)qword_2683E3E38);
  id v5 = sub_22AF887C8();
  os_log_type_t v6 = sub_22AF888F8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (_WORD *)swift_slowAlloc();
    *uint64_t v7 = 0;
    sub_22AF839E0(&dword_22AF7E000, v8, v9, "Registering for SoundAnalysisStreamSubscription");
    MEMORY[0x230F38300](v7, -1, -1);
  }

  sub_22AF836CC();
  sub_22AF887F8();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_22AF8370C();
  sub_22AF81FA0(&qword_2683E3D98);
  unint64_t v10 = sub_22AF8375C();
  sub_22AF838F8(v10);
  uint64_t v11 = sub_22AF8399C();
  v12(v11);
  uint64_t v13 = (void *)sub_22AF83974(80, 0x800000022AF89F00);
  id v14 = objc_allocWithZone(MEMORY[0x263F2A758]);
  swift_bridgeObjectRetain();
  id v15 = sub_22AF83A20(v13);
  if (qword_2683E3B08 != -1) {
    swift_once();
  }
  id v16 = objc_msgSend(objc_msgSend((id)qword_2683E3E30, sel_ContextualUnderstanding), sel_SoundAnalysis);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v16, sel_DSLPublisher);
  id v18 = objc_msgSend(v17, sel_subscribeOn_, v15);

  uint64_t v29 = (void (*)(void *))nullsub_1;
  uint64_t v30 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_22AF80A64;
  uint64_t v28 = &unk_26DE44E90;
  uint64_t v19 = _Block_copy(&aBlock);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v23;
  *(void *)(v20 + 24) = v24;
  uint64_t v29 = sub_22AF838AC;
  uint64_t v30 = v20;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_22AF831A0;
  uint64_t v28 = &unk_26DE44EE0;
  os_log_type_t v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v22 = objc_msgSend(v18, sel_sinkWithCompletion_receiveInput_, v19, v21);
  _Block_release(v21);
  _Block_release(v19);
}

void sub_22AF83614(void *a1, void (*a2)(void, id))
{
  if (objc_msgSend(a1, sel_respondsToSelector_, sel_eventBody))
  {
    id v4 = objc_msgSend(a1, sel_eventBody);
    if (v4)
    {
      id v5 = v4;
      id v6 = v4;
      a2(0, v5);
    }
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_22AF836CC()
{
  unint64_t result = qword_2683E3D88;
  if (!qword_2683E3D88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2683E3D88);
  }
  return result;
}

unint64_t sub_22AF8370C()
{
  unint64_t result = qword_2683E3D90;
  if (!qword_2683E3D90)
  {
    sub_22AF88908();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E3D90);
  }
  return result;
}

unint64_t sub_22AF8375C()
{
  unint64_t result = qword_2683E3DA0;
  if (!qword_2683E3DA0)
  {
    sub_22AF837B0(&qword_2683E3D98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E3DA0);
  }
  return result;
}

uint64_t sub_22AF837B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_22AF837F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithIdentifier_targetQueue_, v5, a3);

  return v6;
}

uint64_t sub_22AF8385C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_22AF8386C()
{
  return swift_release();
}

uint64_t sub_22AF83874()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22AF838AC(void *a1)
{
  sub_22AF83614(a1, *(void (**)(void, id))(v1 + 16));
}

void sub_22AF838B4(void *a1)
{
  sub_22AF830E8(a1, *(void (**)(id, void))(v1 + 16));
}

uint64_t sub_22AF838F8(uint64_t a1)
{
  return MEMORY[0x270F9E7E8](v4 - 144, v1, a1, v3, v2);
}

uint64_t sub_22AF83924()
{
  return MEMORY[0x270FA0A48](0);
}

uint64_t sub_22AF8394C()
{
  return sub_22AF88908();
}

uint64_t sub_22AF83974(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  return MEMORY[0x270FA0DB8](v6, a2, v4, v3, v2, 0);
}

uint64_t sub_22AF8399C()
{
  return v0;
}

void sub_22AF839E0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t sub_22AF83A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 - 168) = a3;
  *(void *)(v3 - 160) = a1;
  *(void *)(v3 - 152) = a2;
  return MEMORY[0x270FA0D50](0);
}

id sub_22AF83A20(void *a1)
{
  uint64_t v5 = *(void *)(v2 - 168);
  return sub_22AF837F8(v5, v1, a1);
}

uint64_t sub_22AF83A40(uint64_t a1)
{
  return sub_22AF83AE8(a1, qword_2683E3E38);
}

uint64_t *sub_22AF83A64(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_22AF83AC8(uint64_t a1)
{
  return sub_22AF83AE8(a1, qword_26AF41020);
}

uint64_t sub_22AF83AE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22AF887E8();
  sub_22AF83A64(v3, a2);
  sub_22AF81D64(v3, (uint64_t)a2);
  return sub_22AF887D8();
}

void sub_22AF83B60(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_22AF88768();
  uint64_t v72 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v71 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = 0x264886000uLL;
  id v9 = a1;
  if (!a1)
  {
    id v10 = objc_msgSend(objc_msgSend(a3, sel_ContextualUnderstanding), sel_PeopleDiscovery);
    swift_unknownObjectRelease();
    id v9 = sub_22AF8440C(v10);
  }
  id v11 = a1;
  id v12 = a2;
  if (!a2)
  {
    id v13 = objc_msgSend(objc_msgSend(a3, sel_ContextualUnderstanding), sel_SoundAnalysis);
    swift_unknownObjectRelease();
    id v12 = sub_22AF845F4(v13);
  }
  id v14 = a2;
  unint64_t v15 = sub_22AF86894(v9);
  if (qword_2683E3B10 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_22AF887E8();
  uint64_t v17 = sub_22AF81D64(v16, (uint64_t)qword_2683E3E38);
  swift_bridgeObjectRetain_n();
  id v18 = sub_22AF887C8();
  os_log_type_t v19 = sub_22AF888F8();
  BOOL v20 = os_log_type_enabled(v18, v19);
  id v75 = v9;
  uint64_t v73 = v6;
  if (v20)
  {
    uint64_t v21 = v17;
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v22 = 134217984;
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_22AF889F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    unint64_t v76 = v23;
    sub_22AF86828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AF7E000, v18, v19, "Number of newly discovered people through Airdrop = %ld", v22, 0xCu);
    sub_22AF825F8();

    uint64_t v17 = v21;
    unint64_t v8 = 0x264886000;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v24 = sub_22AF878BC((uint64_t)v12);
  swift_bridgeObjectRetain_n();
  uint64_t v25 = sub_22AF887C8();
  os_log_type_t v26 = sub_22AF888F8();
  BOOL v27 = os_log_type_enabled(v25, v26);
  id v74 = v12;
  if (v27)
  {
    uint64_t v28 = v17;
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134217984;
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_22AF889F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v30 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    unint64_t v76 = v30;
    sub_22AF86828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AF7E000, v25, v26, "Number of newly discovered people through Sound Analysis = %ld", v29, 0xCu);
    sub_22AF825F8();

    uint64_t v17 = v28;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v76 = v15;
  sub_22AF85404(v24);
  unint64_t v31 = v76;
  id v32 = objc_msgSend(objc_msgSend(a3, *(SEL *)(v8 + 3024)), sel_PhysicalSocial);
  swift_unknownObjectRelease();
  id v33 = sub_22AF847DC(v32);
  v34 = v33;
  if (v33)
  {
    id v35 = objc_msgSend(v33, sel_discoveredPeople);
    sub_22AF82094(0, &qword_2683E3DB0);
    unint64_t v36 = sub_22AF888A8();

    uint64_t v68 = sub_22AF86070(v34);
    uint64_t v38 = v37;
  }
  else
  {
    uint64_t v68 = 0;
    uint64_t v38 = 0;
    unint64_t v36 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain_n();
  v70 = (void *)v17;
  v39 = sub_22AF887C8();
  os_log_type_t v40 = sub_22AF888F8();
  unint64_t v41 = v36 >> 62;
  if (os_log_type_enabled(v39, v40))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v42 = 134217984;
    if (v41)
    {
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_22AF889F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v43 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    unint64_t v76 = v43;
    sub_22AF86828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AF7E000, v39, v40, "Number of last discovered people = %ld", v42, 0xCu);
    sub_22AF825F8();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_22AF889F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v44 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v41)
  {
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_22AF889F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v45 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v44 == v45)
  {
    uint64_t v46 = sub_22AF849C4(v31);
    uint64_t v47 = sub_22AF849C4(v36);
    char v48 = sub_22AF84B90(v46, v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v48)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v49 = sub_22AF887C8();
      os_log_type_t v50 = sub_22AF888F8();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_22AF7E000, v49, v50, "Newly discovered people same as last discovered people", v51, 2u);
        sub_22AF825F8();
        v52 = v74;
        v53 = v75;
LABEL_39:

        return;
      }
      v52 = v34;
LABEL_38:
      v53 = v74;
      v34 = v75;
      goto LABEL_39;
    }
  }
  unint64_t v69 = v31;
  v70 = v34;
  if (!v34)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v38)
  {
    sub_22AF82094(0, &qword_2683E3DA8);
    v54 = (void *)sub_22AF88948();
    sub_22AF88718();
    v55 = (void *)sub_22AF888E8();
    id v56 = objc_allocWithZone(MEMORY[0x263F2A018]);
    id v57 = sub_22AF850F8(v68, v38, v36, v54, v55);
    objc_msgSend(v57, sel_setHasStartTimeInSecondsSinceReferenceDate_, 0);
    objc_msgSend(v57, sel_setHasEndTimeInSecondsSinceReferenceDate_, 1);
    id v58 = objc_msgSend(v32, sel_source);
    objc_msgSend(v58, sel_sendEvent_, v57);

LABEL_37:
    v59 = v71;
    sub_22AF88758();
    uint64_t v60 = sub_22AF88748();
    uint64_t v62 = v61;
    (*(void (**)(char *, uint64_t))(v72 + 8))(v59, v73);
    sub_22AF88718();
    v63 = (void *)sub_22AF888E8();
    sub_22AF82094(0, &qword_2683E3DA8);
    v64 = (void *)sub_22AF88948();
    id v65 = objc_allocWithZone(MEMORY[0x263F2A018]);
    v49 = sub_22AF850F8(v60, v62, v69, v63, v64);
    [v49 setHasStartTimeInSecondsSinceReferenceDate:1];
    [v49 setHasEndTimeInSecondsSinceReferenceDate:0];
    id v66 = objc_msgSend(v32, sel_source);
    objc_msgSend(v66, (SEL)&selRef_unifiedContactsMatchingPredicate_keysToFetch_error_, v49);

    id v32 = v66;
    v52 = v70;
    goto LABEL_38;
  }
  __break(1u);
}

id sub_22AF8440C(void *a1)
{
  sub_22AF81FA0(&qword_2683E3DC0);
  MEMORY[0x270FA5388]();
  sub_22AF86764();
  MEMORY[0x270FA5388]();
  sub_22AF86844();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = sub_22AF867B4(v4);
  sub_22AF866F0(v5);
  id v6 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v7 = sub_22AF86738();
  id v8 = objc_msgSend(a1, sel_publisherWithOptions_, v7);

  os_log_type_t v19 = (void (*)(void *))nullsub_1;
  uint64_t v20 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_22AF80A64;
  id v18 = &unk_26DE45098;
  id v9 = _Block_copy(&aBlock);
  os_log_type_t v19 = sub_22AF864D8;
  uint64_t v20 = v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_22AF84ED8;
  id v18 = &unk_26DE450C0;
  _Block_copy(&aBlock);
  sub_22AF8680C();
  uint64_t v10 = swift_release();
  id v11 = sub_22AF867F0(v10, sel_sinkWithCompletion_receiveInput_);

  _Block_release(&aBlock);
  _Block_release(v9);

  sub_22AF86794();
  id v12 = *v2;
  id v13 = *v2;
  swift_release();
  return v12;
}

id sub_22AF845F4(void *a1)
{
  sub_22AF81FA0(&qword_2683E3DC0);
  MEMORY[0x270FA5388]();
  sub_22AF86764();
  MEMORY[0x270FA5388]();
  sub_22AF86844();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = sub_22AF867B4(v4);
  sub_22AF866F0(v5);
  id v6 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v7 = sub_22AF86738();
  id v8 = objc_msgSend(a1, sel_publisherWithOptions_, v7);

  os_log_type_t v19 = (void (*)(void *))nullsub_1;
  uint64_t v20 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_22AF80A64;
  id v18 = &unk_26DE45020;
  id v9 = _Block_copy(&aBlock);
  os_log_type_t v19 = sub_22AF864A4;
  uint64_t v20 = v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_22AF84ED8;
  id v18 = &unk_26DE45048;
  _Block_copy(&aBlock);
  sub_22AF8680C();
  uint64_t v10 = swift_release();
  id v11 = sub_22AF867F0(v10, sel_sinkWithCompletion_receiveInput_);

  _Block_release(&aBlock);
  _Block_release(v9);

  sub_22AF86794();
  id v12 = *v2;
  id v13 = *v2;
  swift_release();
  return v12;
}

id sub_22AF847DC(void *a1)
{
  sub_22AF81FA0(&qword_2683E3DC0);
  MEMORY[0x270FA5388]();
  sub_22AF86764();
  MEMORY[0x270FA5388]();
  sub_22AF86844();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = sub_22AF867B4(v4);
  sub_22AF866F0(v5);
  id v6 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v7 = sub_22AF86738();
  id v8 = objc_msgSend(a1, sel_publisherWithOptions_, v7);

  os_log_type_t v19 = (void (*)(void *))nullsub_1;
  uint64_t v20 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_22AF80A64;
  id v18 = &unk_26DE44FA8;
  id v9 = _Block_copy(&aBlock);
  os_log_type_t v19 = sub_22AF86420;
  uint64_t v20 = v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_22AF84ED8;
  id v18 = &unk_26DE44FD0;
  _Block_copy(&aBlock);
  sub_22AF8680C();
  uint64_t v10 = swift_release();
  id v11 = sub_22AF867F0(v10, sel_sinkWithCompletion_receiveInput_);

  _Block_release(&aBlock);
  _Block_release(v9);

  sub_22AF86794();
  id v12 = *v2;
  id v13 = *v2;
  swift_release();
  return v12;
}

uint64_t sub_22AF849C4(unint64_t a1)
{
  uint64_t v22 = MEMORY[0x263F8EE88];
  if (a1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22AF889F8();
    if (v2) {
      goto LABEL_3;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_27;
  }
LABEL_3:
  for (uint64_t i = 4; ; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v4 = (id)MEMORY[0x230F37E20](i - 4, a1);
    }
    else {
      id v4 = *(id *)(a1 + 8 * i);
    }
    uint64_t v5 = v4;
    uint64_t v6 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    sub_22AF8686C();
    if (v7)
    {
      sub_22AF867D4();
      sub_22AF86780();
      if (!v8)
      {
        sub_22AF86854();
        if (v19)
        {
          sub_22AF867D4();
          sub_22AF86780();
          if (!v20)
          {
LABEL_22:

            goto LABEL_23;
          }
        }
      }
    }
    sub_22AF8686C();
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (v10)
    {
      sub_22AF8686C();
      if (v11)
      {
        sub_22AF867D4();
        sub_22AF86780();
        if (v12) {
          break;
        }
      }
    }
    sub_22AF86854();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    if (!v16) {
      goto LABEL_22;
    }
    sub_22AF86854();
    if (!v17) {
      goto LABEL_22;
    }
    sub_22AF867D4();
    sub_22AF86780();
    if (!v18) {
      goto LABEL_22;
    }
    uint64_t result = sub_22AF86854();
    if (!v14) {
      goto LABEL_29;
    }
LABEL_19:
    sub_22AF855CC(&v21, result, v14);

    swift_bridgeObjectRelease();
LABEL_23:
    if (v6 == v2)
    {
      swift_bridgeObjectRelease();
      return v22;
    }
  }
  uint64_t result = sub_22AF8686C();
  if (v14) {
    goto LABEL_19;
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_22AF84B90(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v30 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = a2 + 56;
  if ((v6 & v4) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v32 = v3;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    uint64_t v15 = result;
    uint64_t v16 = (uint64_t *)(*(void *)(result + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_22AF88A48();
    swift_bridgeObjectRetain();
    sub_22AF88868();
    uint64_t v19 = sub_22AF88A58();
    uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v21 = v19 & ~v20;
    if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v22 = *(void *)(a2 + 48);
    uint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (!v24 && (sub_22AF88A18() & 1) == 0)
    {
      uint64_t v25 = ~v20;
      for (unint64_t j = v21 + 1; ; unint64_t j = v27 + 1)
      {
        uint64_t v27 = j & v25;
        if (((*(void *)(v8 + (((j & v25) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v25)) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v22 + 16 * v27);
        BOOL v29 = *v28 == v18 && v28[1] == v17;
        if (v29 || (sub_22AF88A18() & 1) != 0) {
          goto LABEL_30;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t result = v15;
    int64_t v3 = v32;
    if (v7) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v11 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v11);
    int64_t v13 = v3 + 1;
    if (!v12)
    {
      int64_t v13 = v3 + 2;
      if (v3 + 2 >= v31) {
        return 1;
      }
      unint64_t v12 = *(void *)(v30 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v3 + 3;
        if (v3 + 3 >= v31) {
          return 1;
        }
        unint64_t v12 = *(void *)(v30 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v3 + 4;
          if (v3 + 4 >= v31) {
            return 1;
          }
          unint64_t v12 = *(void *)(v30 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v32 = v13;
  }
  uint64_t v14 = v3 + 5;
  if (v3 + 5 >= v31) {
    return 1;
  }
  unint64_t v12 = *(void *)(v30 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v3 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_22AF84E38(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel_eventBody);
  if (v3)
  {
    id v6 = v3;
    if (objc_msgSend(v3, sel_hasStartTimeInSecondsSinceReferenceDate))
    {
      uint64_t v4 = (void **)(a2 + 16);
      swift_beginAccess();
      uint64_t v5 = *v4;
      uint8_t *v4 = v6;
    }
    else
    {
    }
  }
}

void sub_22AF84EDC(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v7 = objc_msgSend(a1, sel_eventBody);
  if (v7)
  {
    id v8 = v7;
    swift_beginAccess();
    unint64_t v9 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v8;
  }
  else
  {
    if (qword_2683E3B10 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_22AF887E8();
    sub_22AF81D64(v10, (uint64_t)qword_2683E3E38);
    oslog = sub_22AF887C8();
    os_log_type_t v11 = sub_22AF888F8();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      v14[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      uint64_t v15 = sub_22AF87D5C(0xD000000000000091, 0x800000022AF8A0C0, v14);
      sub_22AF88958();
      *(_WORD *)(v12 + 12) = 2080;
      uint64_t v15 = sub_22AF87D5C(a3, a4, v14);
      sub_22AF88958();
      _os_log_impl(&dword_22AF7E000, oslog, v11, "%s:%s: Exception: No eventBody retreived from event", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      sub_22AF825F8();
      sub_22AF825F8();
    }
    else
    {
    }
  }
}

id sub_22AF850F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v6 = v5;
  if (a2)
  {
    unint64_t v9 = (void *)sub_22AF88838();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }
  sub_22AF82094(0, &qword_2683E3DB0);
  uint64_t v10 = (void *)sub_22AF88898();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v6, sel_initWithLocalIdentifier_discoveredPeople_startTimeInSecondsSinceReferenceDate_endTimeInSecondsSinceReferenceDate_, v9, v10, a4, a5);

  return v11;
}

id sub_22AF851BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v6 = v5;
  uint64_t v12 = sub_22AF88738();
  int64_t v13 = 0;
  if (sub_22AF86428(a1, 1, v12) != 1)
  {
    int64_t v13 = (void *)sub_22AF88728();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  if (sub_22AF86428(a2, 1, v12) == 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = (void *)sub_22AF88728();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
  }
  id v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_22AF852F8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v6 = a1 + 8 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_22AF88A08();
    __break(1u);
  }
  else
  {
    uint64_t v7 = sub_22AF82094(0, &qword_2683E3DB0);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return MEMORY[0x270FA01C8](v8, v9, v10, v7);
}

uint64_t sub_22AF85404(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22AF889F8();
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
    uint64_t v5 = sub_22AF889F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
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
    unint64_t v4 = MEMORY[0x230F37E30](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_22AF860E0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_22AF889F8();
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
  return sub_22AF888B8();
}

uint64_t sub_22AF855CC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_22AF88A48();
  swift_bridgeObjectRetain();
  sub_22AF88868();
  uint64_t v8 = sub_22AF88A58();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_22AF88A18() & 1) != 0)
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
      if (v19 || (sub_22AF88A18() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_22AF85A58(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_22AF8577C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22AF81FA0(&qword_2683E3DB8);
  uint64_t v3 = sub_22AF88998();
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_22AF88A48();
      sub_22AF88868();
      uint64_t result = sub_22AF88A58();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_22AF85BF4(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_22AF85A58(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_22AF8577C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_22AF85C10();
      goto LABEL_22;
    }
    sub_22AF85DC4();
  }
  uint64_t v11 = *v4;
  sub_22AF88A48();
  sub_22AF88868();
  uint64_t result = sub_22AF88A58();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_22AF88A18(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_22AF88A28();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_22AF88A18();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

uint64_t sub_22AF85BF4(uint64_t result, uint64_t a2, void *a3)
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

void *sub_22AF85C10()
{
  uint64_t v1 = v0;
  sub_22AF81FA0(&qword_2683E3DB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22AF88988();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    void *v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22AF85DC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22AF81FA0(&qword_2683E3DB8);
  uint64_t v3 = sub_22AF88998();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_22AF88A48();
    swift_bridgeObjectRetain();
    sub_22AF88868();
    uint64_t result = sub_22AF88A58();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22AF86070(void *a1)
{
  id v2 = objc_msgSend(a1, sel_localIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_22AF88848();

  return v3;
}

uint64_t sub_22AF860E0(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22AF889F8();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_22AF889F8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_22AF86450();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_22AF81FA0(&qword_2683E3DC8);
            uint64_t v10 = sub_22AF86270(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_22AF852F8((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_22AF86270(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_22AF86320(v6, a2, a3);
  return sub_22AF862D8;
}

void sub_22AF862D8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_22AF86320(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_22AF87830(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x230F37E20](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_22AF863A0;
}

void sub_22AF863A0(id *a1)
{
}

uint64_t sub_22AF863A8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22AF863E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_22AF86408(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_22AF86418()
{
  return swift_release();
}

void sub_22AF86420(void *a1)
{
  sub_22AF84E38(a1, v1);
}

uint64_t sub_22AF86428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t sub_22AF86450()
{
  unint64_t result = qword_2683E3DD0;
  if (!qword_2683E3DD0)
  {
    sub_22AF837B0(&qword_2683E3DC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E3DD0);
  }
  return result;
}

void sub_22AF864A4(void *a1)
{
  sub_22AF84EDC(a1, v1, 0xD000000000000020, 0x800000022AF8A160);
}

void sub_22AF864D8(void *a1)
{
  sub_22AF84EDC(a1, v1, 0xD000000000000022, 0x800000022AF8A190);
}

uint64_t destroy for SocialContextInference()
{
  swift_unknownObjectRelease();
  return swift_release();
}

void *_s23ContextualUnderstanding22SocialContextInferenceVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SocialContextInference(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SocialContextInference(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SocialContextInference(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SocialContextInference(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for SocialContextInference(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SocialContextInference()
{
  return &type metadata for SocialContextInference;
}

uint64_t sub_22AF866F0(uint64_t a1)
{
  sub_22AF863E0(v2, 1, 1, a1);
  return sub_22AF863E0(v1, 1, 1, a1);
}

id sub_22AF86738()
{
  return sub_22AF851BC(v1, v0, 1, 1, 0);
}

uint64_t sub_22AF86794()
{
  return swift_beginAccess();
}

uint64_t sub_22AF867B4(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  return sub_22AF88738();
}

uint64_t sub_22AF867D4()
{
  return swift_bridgeObjectRelease();
}

id sub_22AF867F0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3, v4);
}

uint64_t sub_22AF8680C()
{
  return swift_retain();
}

uint64_t sub_22AF86828()
{
  return sub_22AF88958();
}

uint64_t sub_22AF86854()
{
  return sub_22AF82034(v1, v0);
}

uint64_t sub_22AF8686C()
{
  return sub_22AF82034(v1, v0);
}

ValueMetadata *type metadata accessor for SocialContextStreamUtil()
{
  return &type metadata for SocialContextStreamUtil;
}

uint64_t sub_22AF86894(void *a1)
{
  unint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v34 = MEMORY[0x263F8EE78];
  if (a1)
  {
    id v3 = objc_msgSend(a1, sel_discoveredPersons);
    sub_22AF82094(0, &qword_2683E3BF0);
    unint64_t v2 = sub_22AF888A8();
  }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22AF889F8();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_5:
      if (v4 >= 1)
      {
        uint64_t v5 = 0;
        unint64_t v6 = v2 & 0xC000000000000001;
        while (1)
        {
          if (v6) {
            id v7 = (id)MEMORY[0x230F37E20](v5, v2);
          }
          else {
            id v7 = *(id *)(v2 + 8 * v5 + 32);
          }
          uint64_t v8 = v7;
          sub_22AF82034(v7, (SEL *)&selRef_identifier);
          uint64_t v10 = v9;
          swift_bridgeObjectRelease();
          if (v10 || (sub_22AF82034(v8, (SEL *)&selRef_contactID), uint64_t v12 = v11, swift_bridgeObjectRelease(), v12))
          {
            if (objc_msgSend(v8, sel_flags) == 256)
            {
              uint64_t v33 = sub_22AF82034(v8, (SEL *)&selRef_name);
              uint64_t v14 = v13;
              uint64_t v15 = sub_22AF82034(v8, (SEL *)&selRef_contactID);
              uint64_t v17 = v16;
              unint64_t v18 = v2;
              uint64_t v19 = v4;
              unint64_t v20 = v6;
              uint64_t v21 = sub_22AF82034(v8, (SEL *)&selRef_identifier);
              uint64_t v23 = v22;
              id v24 = objc_allocWithZone(MEMORY[0x263F2A020]);
              uint64_t v32 = v21;
              unint64_t v6 = v20;
              uint64_t v4 = v19;
              unint64_t v2 = v18;
              id v25 = sub_22AF87C14(v33, v14, 0, 0, 0, 0, v15, v17, v32, v23);
              if (v25) {
                goto LABEL_14;
              }
            }
            else
            {
              sub_22AF82034(v8, (SEL *)&selRef_identifier);
              id v27 = sub_22AF86BE0();
              swift_bridgeObjectRelease();
              if (v27)
              {
                sub_22AF8751C(v27);
                id v25 = v28;

                if (v25)
                {
LABEL_14:
                  id v26 = v25;
                  MEMORY[0x230F37CF0]();
                  if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_22AF87864();
                  }
                  sub_22AF888D8();
                  sub_22AF888B8();

                  uint64_t v8 = v26;
                }
              }
            }
          }
          ++v5;

          if (v4 == v5) {
            goto LABEL_22;
          }
        }
      }
      __break(1u);
      goto LABEL_30;
    }
  }
LABEL_22:
  swift_bridgeObjectRelease();
  id v29 = sub_22AF87134();
  if (v29)
  {
    uint64_t v1 = v29;
    sub_22AF8751C(v29);
    if (!v30)
    {
      unint64_t v2 = (unint64_t)v1;
      goto LABEL_27;
    }
    unint64_t v2 = v30;
    MEMORY[0x230F37CF0]();
    if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_25:
      sub_22AF888D8();
      sub_22AF888B8();

LABEL_27:
      return v34;
    }
LABEL_30:
    sub_22AF87864();
    goto LABEL_25;
  }
  return v34;
}

id sub_22AF86BE0()
{
  v42[1] = *(id *)MEMORY[0x263EF8340];
  sub_22AF81FA0(&qword_2683E3DE0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22AF89160;
  unint64_t v2 = (void *)*MEMORY[0x263EFDFE0];
  id v3 = (void *)*MEMORY[0x263EFDFC8];
  *(void *)(v1 + 32) = *MEMORY[0x263EFDFE0];
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = (void *)*MEMORY[0x263EFDF80];
  uint64_t v5 = (void *)*MEMORY[0x263EFE070];
  *(void *)(v1 + 48) = *MEMORY[0x263EFDF80];
  *(void *)(v1 + 56) = v5;
  v42[0] = (id)v1;
  sub_22AF888B8();
  unint64_t v6 = *(void **)(v0 + 16);
  id v7 = self;
  id v8 = v2;
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  uint64_t v12 = (void *)sub_22AF88838();
  id v13 = objc_msgSend(v7, sel_predicateForContactsMatchingEmailAddress_, v12);

  sub_22AF81FA0(&qword_2683E3DE8);
  uint64_t v14 = (void *)sub_22AF88898();
  v42[0] = 0;
  id v15 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v13, v14, v42);

  id v16 = v42[0];
  if (!v15)
  {
    id v19 = v42[0];
    swift_bridgeObjectRelease();
LABEL_6:
    unint64_t v20 = (void *)sub_22AF88708();

    swift_willThrow();
    if (qword_2683E3B10 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_22AF887E8();
    sub_22AF81D64(v21, (uint64_t)qword_2683E3E38);
    uint64_t v22 = sub_22AF887C8();
    os_log_type_t v23 = sub_22AF888F8();
    if (os_log_type_enabled(v22, v23))
    {
      *(_WORD *)sub_22AF87884() = 0;
      sub_22AF82634(&dword_22AF7E000, v24, v25, "Exception: Couldn't obtain new contact");
      sub_22AF825F8();
    }

    return 0;
  }
  sub_22AF82094(0, &qword_2683E3DF0);
  unint64_t v17 = sub_22AF888A8();
  id v18 = v16;

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_22AF889F8();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_4;
    }
  }
  else if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_4:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_22AF82094(0, (unint64_t *)&unk_2683E3DF8);
  swift_bridgeObjectRetain();
  id v27 = sub_22AF870C0();
  id v28 = objc_msgSend(v7, sel_predicateForContactsMatchingPhoneNumber_, v27);

  id v29 = (void *)sub_22AF88898();
  swift_bridgeObjectRelease();
  v42[0] = 0;
  id v30 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v28, v29, v42);

  id v31 = v42[0];
  if (!v30)
  {
    id v19 = v42[0];
    goto LABEL_6;
  }
  unint64_t v17 = sub_22AF888A8();
  id v32 = v31;

LABEL_14:
  if (!(v17 >> 62))
  {
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_16;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    if (qword_2683E3B10 == -1)
    {
LABEL_23:
      uint64_t v36 = sub_22AF887E8();
      sub_22AF81D64(v36, (uint64_t)qword_2683E3E38);
      uint64_t v37 = sub_22AF887C8();
      os_log_type_t v38 = sub_22AF888F8();
      if (os_log_type_enabled(v37, v38))
      {
        *(_WORD *)sub_22AF87884() = 0;
        sub_22AF8789C(&dword_22AF7E000, v39, v40, "Exception: No new contact returned");
        sub_22AF825F8();
      }

      return 0;
    }
LABEL_30:
    swift_once();
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_22AF889F8();
  swift_bridgeObjectRelease();
  if (!v35) {
    goto LABEL_22;
  }
LABEL_16:
  if ((v17 & 0xC000000000000001) != 0)
  {
    id v33 = (id)MEMORY[0x230F37E20](0, v17);
    goto LABEL_19;
  }
  if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_30;
  }
  id v33 = *(id *)(v17 + 32);
LABEL_19:
  id v34 = v33;
  swift_bridgeObjectRelease();
  return v34;
}

id sub_22AF870C0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

id sub_22AF87134()
{
  v33[1] = *(id *)MEMORY[0x263EF8340];
  sub_22AF81FA0(&qword_2683E3DE0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22AF89160;
  id v2 = (void *)*MEMORY[0x263EFDFE0];
  id v3 = (void *)*MEMORY[0x263EFDFC8];
  *(void *)(v1 + 32) = *MEMORY[0x263EFDFE0];
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = (void *)*MEMORY[0x263EFDF80];
  uint64_t v5 = (void *)*MEMORY[0x263EFE070];
  *(void *)(v1 + 48) = *MEMORY[0x263EFDF80];
  *(void *)(v1 + 56) = v5;
  v33[0] = (id)v1;
  sub_22AF888B8();
  unint64_t v6 = *(void **)(v0 + 16);
  id v7 = self;
  id v8 = v2;
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  id v12 = objc_msgSend(v7, sel_nm_predicateForMeContact);
  sub_22AF81FA0(&qword_2683E3DE8);
  id v13 = (void *)sub_22AF88898();
  swift_bridgeObjectRelease();
  v33[0] = 0;
  id v14 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v12, v13, v33);

  id v15 = v33[0];
  if (!v14)
  {
    id v20 = v33[0];
    unint64_t v16 = sub_22AF88708();

    swift_willThrow();
    if (qword_2683E3B10 == -1)
    {
LABEL_9:
      uint64_t v21 = sub_22AF887E8();
      sub_22AF81D64(v21, (uint64_t)qword_2683E3E38);
      uint64_t v22 = sub_22AF887C8();
      os_log_type_t v23 = sub_22AF888F8();
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)sub_22AF87884() = 0;
        sub_22AF82634(&dword_22AF7E000, v24, v25, "Exception: Couldn't obtain me contact");
        sub_22AF825F8();
      }

      return 0;
    }
LABEL_22:
    swift_once();
    goto LABEL_9;
  }
  sub_22AF82094(0, &qword_2683E3DF0);
  unint64_t v16 = sub_22AF888A8();
  id v17 = v15;

  if (!(v16 >> 62))
  {
    if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    if (qword_2683E3B10 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_22AF887E8();
    sub_22AF81D64(v27, (uint64_t)qword_2683E3E38);
    id v28 = sub_22AF887C8();
    os_log_type_t v29 = sub_22AF888F8();
    if (os_log_type_enabled(v28, v29))
    {
      *(_WORD *)sub_22AF87884() = 0;
      sub_22AF8789C(&dword_22AF7E000, v30, v31, "Exception: No me contact returned");
      sub_22AF825F8();
    }

    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_22AF889F8();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_13;
  }
LABEL_4:
  if ((v16 & 0xC000000000000001) != 0)
  {
    id v18 = (id)MEMORY[0x230F37E20](0, v16);
    goto LABEL_7;
  }
  if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_22;
  }
  id v18 = *(id *)(v16 + 32);
LABEL_7:
  id v19 = v18;
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_22AF874C0()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ContactStoreManager()
{
  return self;
}

void sub_22AF8751C(void *a1)
{
  id v3 = objc_msgSend(a1, sel_phoneNumbers);
  unint64_t v4 = sub_22AF81FA0(&qword_2683E3E08);
  unint64_t v5 = sub_22AF888A8();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_22AF889F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6)
  {
    if ((v5 & 0xC000000000000001) != 0)
    {
      id v7 = (id)MEMORY[0x230F37E20](0, v5);
    }
    else
    {
      if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_26:
        id v14 = (id)MEMORY[0x230F37E20](0, v4);
LABEL_17:
        id v15 = v14;
        swift_bridgeObjectRelease();
        id v16 = objc_msgSend(v15, sel_value);

        if (v16)
        {
          uint64_t v13 = sub_22AF88848();
          uint64_t v18 = v17;
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v18 = 0;
        }
        goto LABEL_21;
      }
      id v7 = *(id *)(v5 + 32);
    }
    id v8 = v7;
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v8, sel_value);

    if (v9)
    {
      id v10 = objc_msgSend(v9, sel_stringValue);
      uint64_t v1 = sub_22AF88848();
      uint64_t v6 = v11;
    }
    else
    {
      uint64_t v1 = 0;
      uint64_t v6 = 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = 0;
    id v9 = 0;
  }
  id v12 = objc_msgSend(a1, sel_emailAddresses);
  unint64_t v4 = sub_22AF888A8();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_22AF889F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v28 = v9;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
    id v16 = 0;
LABEL_21:
    id v19 = objc_msgSend(a1, sel_givenName);
    uint64_t v20 = sub_22AF88848();
    uint64_t v22 = v21;

    id v23 = objc_msgSend(a1, sel_identifier);
    uint64_t v24 = sub_22AF88848();
    uint64_t v26 = v25;

    id v27 = objc_allocWithZone(MEMORY[0x263F2A020]);
    sub_22AF87C14(v20, v22, v1, v6, v13, v18, v24, v26, 0, 0);

    return;
  }
  if ((v4 & 0xC000000000000001) != 0) {
    goto LABEL_26;
  }
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v14 = *(id *)(v4 + 32);
    goto LABEL_17;
  }
  __break(1u);
}

unint64_t sub_22AF87830(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for SocialContextUsingAirdrop()
{
  return &type metadata for SocialContextUsingAirdrop;
}

uint64_t sub_22AF87864()
{
  return sub_22AF888C8();
}

uint64_t sub_22AF87884()
{
  return swift_slowAlloc();
}

void sub_22AF8789C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_22AF878BC(uint64_t a1)
{
  if ((sub_22AF87980(a1) & 1) == 0) {
    return MEMORY[0x263F8EE78];
  }
  sub_22AF81FA0(&qword_2683E3DE0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22AF891C0;
  id v2 = objc_allocWithZone(MEMORY[0x263F2A020]);
  *(void *)(v1 + 32) = sub_22AF87C14(0, 0, 0, 0, 0, 0, 0, 0, 0xD000000000000017, 0x800000022AF8A210);
  sub_22AF888B8();
  return v1;
}

uint64_t sub_22AF87980(uint64_t a1)
{
  if (*(void *)(sub_22AF879E8(a1) + 16))
  {
    sub_22AF88514(0xD000000000000015, 0x800000022AF8A230);
    char v2 = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_22AF879E8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = sub_22AF88938();
  }
  else
  {
    sub_22AF81FA0(&qword_2683E3E10);
    uint64_t v1 = sub_22AF88828();
  }
  uint64_t v2 = v1;
  if (qword_2683E3B10 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_22AF887E8();
  sub_22AF81D64(v3, (uint64_t)qword_2683E3E38);
  swift_bridgeObjectRetain_n();
  unint64_t v4 = sub_22AF887C8();
  os_log_type_t v5 = sub_22AF888F8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_22AF81FA0(&qword_2683E3E10);
    uint64_t v8 = sub_22AF88818();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_22AF87D5C(v8, v10, &v12);
    sub_22AF88958();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AF7E000, v4, v5, "Sounds detected = %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F38300](v7, -1, -1);
    MEMORY[0x230F38300](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v2;
}

id sub_22AF87C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a2)
  {
    id v14 = (void *)sub_22AF88838();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v15 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v14 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  id v15 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
  if (a6)
  {
LABEL_4:
    id v16 = (void *)sub_22AF88838();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  id v16 = 0;
LABEL_8:
  if (!a8)
  {
    uint64_t v17 = 0;
    if (a10) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  uint64_t v17 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
  if (!a10) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v18 = (void *)sub_22AF88838();
  swift_bridgeObjectRelease();
LABEL_13:
  id v19 = objc_msgSend(v10, sel_initWithName_phoneNumber_emailAddress_cnContactID_unknownPersonID_, v14, v15, v16, v17, v18);

  return v19;
}

uint64_t sub_22AF87D5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22AF87E30(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22AF88670((uint64_t)v12, *a3);
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
      sub_22AF88670((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_22AF81E44((uint64_t)v12);
  return v7;
}

uint64_t sub_22AF87E30(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_22AF87F88((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22AF88968();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_22AF88060(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_22AF889D8();
    if (!v8)
    {
      uint64_t result = sub_22AF889E8();
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

void *sub_22AF87F88(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22AF88A08();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_22AF88060(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22AF880F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_22AF882D4(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_22AF882D4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22AF880F8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_22AF88878();
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
  unint64_t v3 = sub_22AF8826C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_22AF889A8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_22AF88A08();
  __break(1u);
LABEL_14:
  uint64_t result = sub_22AF889E8();
  __break(1u);
  return result;
}

void *sub_22AF8826C(uint64_t a1, uint64_t a2)
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
  sub_22AF81FA0(&qword_2683E3E18);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22AF882D4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_22AF81FA0(&qword_2683E3E18);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
    sub_22AF88484(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_22AF883AC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22AF883AC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22AF88A08();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_22AF88484(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22AF88A08();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_22AF88514(uint64_t a1, uint64_t a2)
{
  sub_22AF88A48();
  sub_22AF88868();
  uint64_t v4 = sub_22AF88A58();
  return sub_22AF8858C(a1, a2, v4);
}

unint64_t sub_22AF8858C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22AF88A18() & 1) == 0)
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
      while (!v14 && (sub_22AF88A18() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22AF88670(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for SocialContextUsingSound()
{
  return &type metadata for SocialContextUsingSound;
}

uint64_t sub_22AF88708()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22AF88718()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_22AF88728()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22AF88738()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22AF88748()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22AF88758()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22AF88768()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22AF88778()
{
  return MEMORY[0x270F3C928]();
}

uint64_t sub_22AF88788()
{
  return MEMORY[0x270F3C930]();
}

uint64_t sub_22AF88798()
{
  return MEMORY[0x270F3C938]();
}

uint64_t sub_22AF887A8()
{
  return MEMORY[0x270F3C940]();
}

uint64_t sub_22AF887B8()
{
  return MEMORY[0x270F3C948]();
}

uint64_t sub_22AF887C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22AF887D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22AF887E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22AF887F8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22AF88818()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_22AF88828()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22AF88838()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22AF88848()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22AF88858()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22AF88868()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22AF88878()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22AF88888()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22AF88898()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22AF888A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22AF888B8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22AF888C8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22AF888D8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22AF888E8()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_22AF888F8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22AF88908()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22AF88938()
{
  return MEMORY[0x270F3C950]();
}

uint64_t sub_22AF88948()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_22AF88958()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22AF88968()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22AF88988()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22AF88998()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22AF889A8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22AF889B8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22AF889C8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22AF889D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22AF889E8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22AF889F8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22AF88A08()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22AF88A18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22AF88A28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22AF88A38()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22AF88A48()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22AF88A58()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22AF88A68()
{
  return MEMORY[0x270EF2760]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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