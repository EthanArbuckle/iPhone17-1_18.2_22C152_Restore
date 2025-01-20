void sub_24735FFA8()
{
  qword_26B12A6A8 = 0x5F454349564544;
  unk_26B12A6B0 = 0xE700000000000000;
}

void sub_24735FFCC()
{
  *(_WORD *)&algn_26B12A6F8[6] = -4864;
}

void sub_24735FFFC()
{
  *(_WORD *)&algn_26B12A6E8[6] = -4864;
}

uint64_t sub_24736002C@<X0>(void *a1@<X8>)
{
  return sub_2473602A8(a1);
}

uint64_t sub_247360040()
{
  return sub_247360338();
}

uint64_t sub_247360054()
{
  return sub_2473603C4();
}

uint64_t sub_247360068()
{
  return sub_247360444();
}

uint64_t (*sub_24736007C(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24737CEB0();
  return sub_247360108;
}

uint64_t sub_24736010C()
{
  return sub_2473605B0();
}

uint64_t sub_247360118(uint64_t a1)
{
  return sub_247360620(a1);
}

uint64_t sub_247360124()
{
  return sub_2473607A8();
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

uint64_t sub_247360174(uint64_t a1)
{
  return sub_247360814(a1);
}

uint64_t (*sub_247360180(void *a1))()
{
  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249050);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__allSuggestions;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A568);
  sub_24737CE90();
  swift_endAccess();
  return sub_247360290;
}

uint64_t sub_247360294@<X0>(void *a1@<X8>)
{
  return sub_2473602A8(a1);
}

uint64_t sub_2473602A8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24737CEC0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_247360324()
{
  return sub_247360338();
}

uint64_t sub_247360338()
{
  return sub_24737CED0();
}

uint64_t sub_2473603B0()
{
  return sub_2473603C4();
}

uint64_t sub_2473603C4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24737CEC0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_247360430()
{
  return sub_247360444();
}

uint64_t sub_247360444()
{
  return sub_24737CED0();
}

uint64_t (*sub_2473604B0(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24737CEB0();
  return sub_247360108;
}

void sub_24736053C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_2473605A4()
{
  return sub_2473605B0();
}

uint64_t sub_2473605B0()
{
  return swift_endAccess();
}

uint64_t sub_247360614(uint64_t a1)
{
  return sub_247360620(a1);
}

uint64_t sub_247360620(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249050);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  size_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A568);
  sub_24737CEA0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_24736079C()
{
  return sub_2473607A8();
}

uint64_t sub_2473607A8()
{
  return swift_endAccess();
}

uint64_t sub_247360808(uint64_t a1)
{
  return sub_247360814(a1);
}

uint64_t sub_247360814(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249050);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A568);
  sub_24737CEA0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_247360940(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249050);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__filteredSuggestions;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A568);
  sub_24737CE90();
  swift_endAccess();
  return sub_247360290;
}

void sub_247360A50(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_24737CEA0();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_24737CEA0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

unint64_t sub_247360BC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A668);
  uint64_t v6 = sub_24737D230();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_247375164(v12, (uint64_t)v5, &qword_26B12A5B0);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_247378620(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for AccountSuggestion();
    unint64_t result = sub_247368D54(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_247360DA8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5A8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F0);
  uint64_t v6 = sub_24737D230();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_247375164(v12, (uint64_t)v5, &qword_26B12A5A8);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_247378620(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_24737CDE0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_247360FA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249088);
  uint64_t v2 = sub_24737D230();
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
    sub_247375164(v6, (uint64_t)&v15, &qword_269249090);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_247378620(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_247374C74(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2473610E0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_247361178(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID, a2);
}

uint64_t sub_2473610EC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_2473611D8(a1, a2, a3, a4, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
}

uint64_t sub_2473610F8()
{
  return sub_24736124C();
}

uint64_t sub_247361104(uint64_t a1)
{
  return sub_2473612A0(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
}

uint64_t (*sub_247361110())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24736116C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_247361178(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates, a2);
}

uint64_t sub_247361178@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473611CC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_2473611D8(a1, a2, a3, a4, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
}

uint64_t sub_2473611D8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247361240()
{
  return sub_24736124C();
}

uint64_t sub_24736124C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_247361294(uint64_t a1)
{
  return sub_2473612A0(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
}

uint64_t sub_2473612A0(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2473612F0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24736134C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2473613A0(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = v2;
  return result;
}

uint64_t sub_2473613F0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_247361438(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_247361484())()
{
  return j__swift_endAccess;
}

uint64_t sub_2473614E4()
{
  uint64_t v0 = sub_24737CE50();
  __swift_allocate_value_buffer(v0, qword_26B12A4E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B12A4E8);
  return sub_24737CE40();
}

uint64_t static AccountSuggestionManager.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24737CE50();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static AccountSuggestionManager.logger.setter(uint64_t a1)
{
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24737CE50();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static AccountSuggestionManager.logger.modify())()
{
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24737CE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2473617E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24737CE10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults);
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = qword_26B12A550;
  id v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  char v10 = (void *)sub_24737CFD0();
  id v11 = objc_msgSend(v9, sel_stringForKey_, v10);

  if (v11)
  {
    uint64_t v12 = sub_24737CFE0();

    return v12;
  }
  else
  {
LABEL_6:
    sub_24737CE00();
    uint64_t v14 = sub_24737CDF0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v15 = *(void **)(v1 + v6);
    if (v15)
    {
      id v16 = v15;
      long long v17 = (void *)sub_24737CFD0();
      if (qword_26B12A550 != -1) {
        swift_once();
      }
      unint64_t v18 = (void *)sub_24737CFD0();
      objc_msgSend(v16, sel_setObject_forKey_, v17, v18);
    }
    return v14;
  }
}

uint64_t sub_2473619F8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_247374F90;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_247361C50(v4);
}

uint64_t sub_247361A98(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_247374F78;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_247361C50(v3);
  return sub_247361CC0(v8);
}

uint64_t sub_247361B60(uint64_t a1, uint64_t a2, void (*a3)(void *))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v8[0] = sub_247368A60;
  v8[1] = v6;
  a3(v8);
  return swift_release();
}

uint64_t sub_247361BF4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_247361C50(*v1);
  return v2;
}

uint64_t sub_247361C50(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_247361C60(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_247361CC0(v6);
}

uint64_t sub_247361CC0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_247361CD0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_247361D2C()
{
  return 1;
}

uint64_t sub_247361D34()
{
  return sub_24737D2E0();
}

uint64_t sub_247361D78()
{
  return sub_24737D2D0();
}

uint64_t sub_247361DA0()
{
  return sub_24737D2E0();
}

const char *sub_247361DE0()
{
  return "AccountsUI";
}

const char *sub_247361DF4()
{
  return "Sync";
}

uint64_t sub_247361E08()
{
  uint64_t v3 = &type metadata for AccountSuggestionManager.Flags;
  unint64_t v4 = sub_247361E58();
  char v0 = sub_24737CE20();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_247361E58()
{
  unint64_t result = qword_26B12A538;
  if (!qword_26B12A538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12A538);
  }
  return result;
}

uint64_t AccountSuggestionManager.__allocating_init(uiMode:)(int a1)
{
  uint64_t v2 = swift_allocObject();
  AccountSuggestionManager.init(uiMode:)(a1);
  return v2;
}

uint64_t AccountSuggestionManager.init(uiMode:)(int a1)
{
  uint64_t v2 = v1;
  int v64 = a1;
  uint64_t v3 = sub_24737D0E0();
  uint64_t v62 = *(void *)(v3 - 8);
  uint64_t v63 = v3;
  MEMORY[0x270FA5388](v3);
  v61 = (char *)v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24737D0C0();
  MEMORY[0x270FA5388](v5);
  v60[1] = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24737CF20();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A568);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__allSuggestions;
  uint64_t v13 = MEMORY[0x263F8EE78];
  aBlock[0] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5B8);
  sub_24737CE80();
  uint64_t v14 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v14(v12, v11, v8);
  uint64_t v15 = v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__filteredSuggestions;
  aBlock[0] = v13;
  sub_24737CE80();
  v14(v15, v11, v8);
  uint64_t v16 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID;
  *(void *)(v1 + v16) = sub_247360BC0(v13);
  uint64_t v17 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates;
  *(void *)(v1 + v17) = sub_247360DA8(v13);
  uint64_t v18 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue;
  sub_247374D7C(0, &qword_26B12A5E8);
  sub_24737CF10();
  aBlock[0] = v13;
  sub_247368AA8(&qword_26B12A5E0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5D0);
  sub_247368AF0(&qword_26B12A5D8, &qword_26B12A5D0);
  sub_24737D160();
  (*(void (**)(char *, void, uint64_t))(v62 + 104))(v61, *MEMORY[0x263F8F138], v63);
  *(void *)(v1 + v18) = sub_24737D110();
  uint64_t v19 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
  id v20 = objc_allocWithZone(MEMORY[0x263F08C40]);
  uint64_t v21 = (void *)sub_24737CFD0();
  id v22 = objc_msgSend(v20, sel_initWithStoreIdentifier_type_, v21, 1);

  *(void *)(v2 + v19) = v22;
  *(void *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvsSubscriber) = 0;
  uint64_t v23 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  id v24 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  v25 = (void *)sub_24737CFD0();
  id v26 = objc_msgSend(v24, sel_initWithSuiteName_, v25);

  *(void *)(v2 + v23) = v26;
  v27 = (void *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  void *v27 = 0;
  v27[1] = 0;
  *(void *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem) = 0;
  uint64_t v28 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_accountTypesThatNeedProperties;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_24737D8B0;
  *(void *)(v29 + 32) = sub_24737CFE0();
  *(void *)(v29 + 40) = v30;
  *(void *)(v29 + 48) = sub_24737CFE0();
  *(void *)(v29 + 56) = v31;
  *(void *)(v29 + 64) = sub_24737CFE0();
  *(void *)(v29 + 72) = v32;
  *(void *)(v29 + 80) = sub_24737CFE0();
  *(void *)(v29 + 88) = v33;
  *(void *)(v29 + 96) = sub_24737CFE0();
  *(void *)(v29 + 104) = v34;
  *(void *)(v29 + 112) = sub_24737CFE0();
  *(void *)(v29 + 120) = v35;
  *(void *)(v2 + v28) = v29;
  uint64_t v36 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_supportedAccountTypes;
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_24737D8C0;
  *(void *)(v37 + 32) = sub_24737CFE0();
  *(void *)(v37 + 40) = v38;
  *(void *)(v37 + 48) = sub_24737CFE0();
  *(void *)(v37 + 56) = v39;
  *(void *)(v37 + 64) = sub_24737CFE0();
  *(void *)(v37 + 72) = v40;
  *(void *)(v37 + 80) = sub_24737CFE0();
  *(void *)(v37 + 88) = v41;
  *(void *)(v37 + 96) = sub_24737CFE0();
  *(void *)(v37 + 104) = v42;
  *(void *)(v37 + 112) = sub_24737CFE0();
  *(void *)(v37 + 120) = v43;
  *(void *)(v37 + 128) = sub_24737CFE0();
  *(void *)(v37 + 136) = v44;
  *(void *)(v37 + 144) = sub_24737CFE0();
  *(void *)(v37 + 152) = v45;
  *(void *)(v37 + 160) = sub_24737CFE0();
  *(void *)(v37 + 168) = v46;
  *(void *)(v37 + 176) = sub_24737CFE0();
  *(void *)(v37 + 184) = v47;
  *(void *)(v37 + 192) = sub_24737CFE0();
  *(void *)(v37 + 200) = v48;
  *(void *)(v37 + 208) = sub_24737CFE0();
  *(void *)(v37 + 216) = v49;
  *(void *)(v37 + 224) = sub_24737CFE0();
  *(void *)(v37 + 232) = v50;
  *(void *)(v37 + 240) = sub_24737CFE0();
  *(void *)(v37 + 248) = v51;
  *(void *)(v37 + 256) = sub_24737CFE0();
  *(void *)(v37 + 264) = v52;
  *(void *)(v2 + v36) = v37;
  uint64_t v53 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_locallySupportedAccountTypes;
  *(void *)(v2 + v53) = sub_24736887C();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode) = v64;
  v54 = *(void **)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = sub_2473752B0;
  *(void *)(v55 + 24) = v2;
  aBlock[4] = sub_247368A60;
  aBlock[5] = v55;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362730;
  aBlock[3] = &block_descriptor;
  v56 = _Block_copy(aBlock);
  v57 = v54;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v57, v56);

  _Block_release(v56);
  LOBYTE(v56) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v56)
  {
    __break(1u);
  }
  else
  {
    id v59 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v59, sel_addObserver_selector_name_object_, v2, sel_reloadDelay_, *MEMORY[0x263F085E8], 0);

    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs), sel_synchronize);
    swift_release();
    return v2;
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

uint64_t sub_247362730(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_247362758()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_reloadDelay_, *MEMORY[0x263F085E8], 0);

  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
  return objc_msgSend(v2, sel_synchronize);
}

uint64_t sub_2473627E8()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v2, sel_removeObserver_name_object_, v1, *MEMORY[0x263F085E8], 0);

  uint64_t v3 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvsSubscriber;
  if (*(void *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvsSubscriber))
  {
    swift_retain();
    sub_24737CE60();
    swift_release();
  }
  *(void *)(v1 + v3) = 0;
  return swift_release();
}

uint64_t sub_24736289C(uint64_t a1)
{
  uint64_t v2 = sub_24737CF40();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = sub_24737CEF0();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem;
  if (*(void *)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem))
  {
    swift_retain();
    sub_24737CF60();
    swift_release();
  }
  aBlock[4] = sub_247374F38;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = &block_descriptor_108;
  _Block_copy(aBlock);
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  sub_24737CF70();
  swift_allocObject();
  uint64_t v10 = sub_24737CF50();
  swift_release();
  *(void *)(a1 + v9) = v10;
  uint64_t result = swift_release();
  if (*(void *)(a1 + v9))
  {
    uint64_t v12 = *(void **)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
    swift_retain();
    id v13 = v12;
    sub_24737CF30();
    uint32_t v14 = arc4random();
    double v15 = fmod((double)v14, 5.0);
    MEMORY[0x24C551E80](v5, v15);
    uint64_t v16 = *(void (**)(char *, uint64_t))(v20 + 8);
    uint64_t v17 = v5;
    uint64_t v18 = v21;
    v16(v17, v21);
    sub_24737D0D0();
    swift_release();

    return ((uint64_t (*)(char *, uint64_t))v16)(v7, v18);
  }
  return result;
}

uint64_t sub_247362BAC(uint64_t a1)
{
  uint64_t v2 = sub_24737CE50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_24737CE30();
  os_log_type_t v8 = sub_24737D0B0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24735E000, v7, v8, "reloading after delay", v9, 2u);
    MEMORY[0x24C5526D0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_247364B64();
  *(void *)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem) = 0;
  return swift_release();
}

uint64_t sub_247362D7C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_247362E0C()
{
  return sub_247364898((uint64_t)sub_247368AA0, (uint64_t)&block_descriptor_11);
}

void sub_247362E2C(uint64_t a1)
{
  uint64_t v2 = sub_24737CEF0();
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v34 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24737CF20();
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v32 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
  uint64_t v6 = *(void **)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
  if (v6)
  {
    id v7 = objc_msgSend(v6, sel_dictionaryRepresentation);
    unint64_t v8 = sub_24737CFB0();
  }
  else
  {
    unint64_t v8 = sub_247360FA8(MEMORY[0x263F8EE78]);
  }
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(v8 + 64);
  unint64_t v38 = v8 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v39 = (unint64_t)(v11 + 63) >> 6;
  int64_t v31 = v39 - 1;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v9 << 6);
LABEL_11:
      uint64_t v18 = *(void *)(v8 + 56);
      uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v17);
      uint64_t v20 = v19[1];
      *(void *)&long long v40 = *v19;
      *((void *)&v40 + 1) = v20;
      sub_24736F860(v18 + 32 * v17, (uint64_t)v41);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 < v39)
    {
      unint64_t v22 = *(void *)(v38 + 8 * v21);
      if (v22) {
        goto LABEL_15;
      }
      int64_t v23 = v9 + 2;
      ++v9;
      if (v21 + 1 < v39)
      {
        unint64_t v22 = *(void *)(v38 + 8 * v23);
        if (v22) {
          goto LABEL_18;
        }
        int64_t v9 = v21 + 1;
        if (v21 + 2 < v39)
        {
          unint64_t v22 = *(void *)(v38 + 8 * (v21 + 2));
          if (v22)
          {
            v21 += 2;
            goto LABEL_15;
          }
          int64_t v23 = v21 + 3;
          int64_t v9 = v21 + 2;
          if (v21 + 3 < v39) {
            break;
          }
        }
      }
    }
LABEL_29:
    unint64_t v13 = 0;
    memset(v41, 0, sizeof(v41));
    long long v40 = 0u;
LABEL_30:
    sub_247374ECC((uint64_t)&v40, (uint64_t)&aBlock, &qword_26B12A5A0);
    if (!v43)
    {
      swift_release();
      objc_msgSend(*(id *)(a1 + v5), sel_synchronize);
      sub_247367AD4();
      sub_247374D7C(0, &qword_26B12A5E8);
      v25 = (void *)sub_24737D0F0();
      v44[2] = sub_247375160;
      v44[3] = a1;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v43 = 1107296256;
      v44[0] = sub_247362D78;
      v44[1] = &block_descriptor_126;
      id v26 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      v27 = v32;
      sub_24737CF00();
      uint64_t aBlock = MEMORY[0x263F8EE78];
      sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
      sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
      uint64_t v28 = v34;
      uint64_t v29 = v37;
      sub_24737D160();
      MEMORY[0x24C552000](0, v27, v28, v26);
      _Block_release(v26);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v29);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v35);
      return;
    }
    id v24 = *(void **)(a1 + v5);
    if (v24)
    {
      id v14 = v24;
      double v15 = (void *)sub_24737CFD0();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_removeObjectForKey_, v15);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  }
  unint64_t v22 = *(void *)(v38 + 8 * v23);
  if (v22)
  {
LABEL_18:
    int64_t v21 = v23;
LABEL_15:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v21 << 6);
    int64_t v9 = v21;
    goto LABEL_11;
  }
  while (1)
  {
    int64_t v21 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v21 >= v39)
    {
      int64_t v9 = v31;
      goto LABEL_29;
    }
    unint64_t v22 = *(void *)(v38 + 8 * v21);
    ++v23;
    if (v22) {
      goto LABEL_15;
    }
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_247363388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a5;
  uint64_t v24 = sub_24737CEF0();
  uint64_t v27 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  unint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24737CF20();
  uint64_t v25 = *(void *)(v14 - 8);
  uint64_t v26 = v14;
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = *(void **)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a1;
  v18[5] = a2;
  v18[6] = v23;
  v18[7] = a6;
  v18[8] = v6;
  aBlock[4] = sub_247368B98;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = &block_descriptor_17;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24737CF00();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  uint64_t v21 = v24;
  sub_24737D160();
  MEMORY[0x24C552000](0, v16, v13, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v21);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v26);
  return swift_release();
}

uint64_t sub_24736368C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v84 = a6;
  uint64_t v85 = a7;
  uint64_t v80 = a5;
  uint64_t v77 = a3;
  uint64_t v78 = a4;
  uint64_t v74 = a1;
  uint64_t v75 = a2;
  uint64_t v7 = sub_24737CEF0();
  uint64_t v72 = *(void *)(v7 - 8);
  uint64_t v73 = v7;
  MEMORY[0x270FA5388](v7);
  v70 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_24737CF20();
  uint64_t v69 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  v68 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v66 = (uint64_t)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v82 = (uint64_t)&v65 - v13;
  uint64_t v83 = type metadata accessor for AccountSuggestion();
  uint64_t v81 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v67 = (uint64_t)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_24737CDE0();
  uint64_t v15 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  unint64_t v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24737CE10();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24737CE00();
  uint64_t v22 = sub_24737CDF0();
  uint64_t v24 = v23;
  uint64_t v25 = *(void (**)(char *, uint64_t))(v19 + 8);
  v25(v21, v18);
  sub_24737CE00();
  uint64_t v79 = sub_24737CDF0();
  uint64_t v27 = v26;
  v25(v21, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249098);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24737D8D0;
  if (qword_26B12A630 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_26B12A760;
  *(void *)(inited + 32) = qword_26B12A758;
  *(void *)(inited + 40) = v29;
  uint64_t v30 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v22;
  *(void *)(inited + 56) = v24;
  *(void *)(inited + 72) = v30;
  *(void *)(inited + 80) = 0xD000000000000015;
  *(void *)(inited + 120) = v30;
  uint64_t v31 = v74;
  uint64_t v32 = v75;
  *(void *)(inited + 88) = 0x800000024737E4D0;
  *(void *)(inited + 96) = v31;
  *(void *)(inited + 104) = v32;
  uint64_t v33 = qword_26B12A638;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v33 != -1) {
    swift_once();
  }
  uint64_t v34 = qword_26B12A770;
  *(void *)(inited + 128) = qword_26B12A768;
  *(void *)(inited + 136) = v34;
  *(void *)(inited + 168) = v30;
  uint64_t v35 = v78;
  *(void *)(inited + 144) = v77;
  *(void *)(inited + 152) = v35;
  uint64_t v36 = qword_26B12A618;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v36 != -1) {
    swift_once();
  }
  uint64_t v37 = qword_26B12A730;
  *(void *)(inited + 176) = qword_26B12A728;
  *(void *)(inited + 184) = v37;
  *(void *)(inited + 216) = v30;
  *(void *)(inited + 192) = 1953719668;
  *(void *)(inited + 200) = 0xE400000000000000;
  uint64_t v38 = qword_26B12A620;
  swift_bridgeObjectRetain();
  uint64_t v39 = v85;
  if (v38 != -1) {
    swift_once();
  }
  uint64_t v40 = qword_26B12A740;
  *(void *)(inited + 224) = qword_26B12A738;
  *(void *)(inited + 232) = v40;
  swift_bridgeObjectRetain();
  sub_24737CDD0();
  sub_24737CDC0();
  uint64_t v42 = v41;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v76);
  *(void *)(inited + 264) = MEMORY[0x263F8D538];
  *(void *)(inited + 240) = v42;
  if (qword_26B12A628 != -1) {
    swift_once();
  }
  uint64_t v78 = v22;
  uint64_t v43 = v24;
  uint64_t v44 = qword_26B12A750;
  *(void *)(inited + 272) = qword_26B12A748;
  *(void *)(inited + 280) = v44;
  uint64_t v45 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 288) = 0;
  *(void *)(inited + 312) = v45;
  *(void *)(inited + 320) = 0xD000000000000014;
  *(void *)(inited + 328) = 0x800000024737E4F0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_24737D8E0;
  uint64_t v47 = v79;
  *(void *)(v46 + 32) = v79;
  *(void *)(v46 + 40) = v27;
  *(void *)(inited + 360) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A650);
  *(void *)(inited + 336) = v46;
  uint64_t v48 = qword_26B12A610;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v48 != -1) {
    swift_once();
  }
  uint64_t v49 = qword_26B12A720;
  *(void *)(inited + 368) = qword_26B12A718;
  *(void *)(inited + 376) = v49;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A648);
  *(void *)(inited + 408) = v50;
  *(void *)(inited + 384) = v80;
  uint64_t v51 = qword_26B12A608;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v51 != -1) {
    swift_once();
  }
  uint64_t v52 = qword_26B12A710;
  *(void *)(inited + 416) = qword_26B12A708;
  *(void *)(inited + 424) = v52;
  *(void *)(inited + 456) = v50;
  *(void *)(inited + 432) = v84;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v53 = sub_247360FA8(inited);
  sub_24736B4FC(v47, v27);
  swift_bridgeObjectRelease();
  uint64_t v54 = v82;
  AccountSuggestion.init(with:)(v53, v82);
  uint64_t v55 = v81;
  uint64_t v56 = v83;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v54, 1, v83) == 1)
  {
    swift_bridgeObjectRelease();
    return sub_247374C8C(v54, &qword_26B12A518);
  }
  else
  {
    uint64_t v58 = v67;
    sub_247368D54(v54, v67);
    uint64_t v59 = v66;
    sub_247368BAC(v58, v66);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v59, 0, 1, v56);
    sub_247369004(v59, v78, v43, 1, 0);
    swift_bridgeObjectRelease();
    sub_247374C8C(v59, &qword_26B12A518);
    sub_247374D7C(0, &qword_26B12A5E8);
    v60 = (void *)sub_24737D0F0();
    v86[4] = sub_2473752B4;
    v86[5] = v39;
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 1107296256;
    v86[2] = sub_247362D78;
    v86[3] = &block_descriptor_123;
    v61 = _Block_copy(v86);
    swift_retain();
    swift_release();
    uint64_t v62 = v68;
    sub_24737CF00();
    v86[0] = MEMORY[0x263F8EE78];
    sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
    sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
    uint64_t v63 = v70;
    uint64_t v64 = v73;
    sub_24737D160();
    MEMORY[0x24C552000](0, v62, v63, v61);
    _Block_release(v61);

    (*(void (**)(char *, uint64_t))(v72 + 8))(v63, v64);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v62, v71);
    return sub_24736F48C(v58);
  }
}

uint64_t sub_247364018(uint64_t a1)
{
  uint64_t v3 = sub_24737CEF0();
  uint64_t v20 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24737CF20();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AccountSuggestion();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  sub_247368BAC(a1, (uint64_t)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v1;
  sub_247368D54((uint64_t)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  aBlock[4] = sub_247368DB8;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = &block_descriptor_23;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v12;
  swift_retain();
  sub_24737CF00();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  MEMORY[0x24C552000](0, v8, v5, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  return swift_release();
}

uint64_t sub_247364370(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v32 = sub_24737CEF0();
  uint64_t v35 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v31 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24737CF20();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v30 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AccountSuggestion();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_24737CE10();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24737CE00();
  uint64_t v17 = sub_24737CDF0();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_bridgeObjectRetain();
  sub_24736B4FC(v17, v19);
  swift_bridgeObjectRelease();
  sub_247368BAC(v29, (uint64_t)v12);
  swift_bridgeObjectRetain();
  sub_24736F8BC(aBlock, v17, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247368BAC((uint64_t)v12, (uint64_t)v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  uint64_t v20 = *v12;
  uint64_t v21 = v12[1];
  swift_bridgeObjectRetain();
  sub_247369004((uint64_t)v8, v20, v21, 1, 0);
  swift_bridgeObjectRelease();
  sub_247374C8C((uint64_t)v8, &qword_26B12A518);
  sub_247374D7C(0, &qword_26B12A5E8);
  uint64_t v22 = (void *)sub_24737D0F0();
  aBlock[4] = (uint64_t)sub_2473752B4;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_247362D78;
  aBlock[3] = (uint64_t)&block_descriptor_120;
  uint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v24 = v30;
  sub_24737CF00();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  uint64_t v25 = v31;
  uint64_t v26 = v32;
  sub_24737D160();
  MEMORY[0x24C552000](0, v24, v25, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v34);
  return sub_24736F48C((uint64_t)v12);
}

uint64_t sub_247364878()
{
  return sub_247364898((uint64_t)sub_247368E1C, (uint64_t)&block_descriptor_26);
}

uint64_t sub_247364898(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24737CEF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = sub_24737CF20();
  uint64_t v9 = *(void *)(v16[0] - 8);
  MEMORY[0x270FA5388](v16[0]);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  aBlock[4] = a1;
  uint64_t v18 = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = a2;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v12;
  swift_retain();
  sub_24737CF00();
  v16[1] = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  MEMORY[0x24C552000](0, v11, v8, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void))(v9 + 8))(v11, v16[0]);
  return swift_release();
}

uint64_t sub_247364B64()
{
  int64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A588);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v276 = (char *)&v252 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t)&v252 - v5;
  int64_t v295 = sub_24737CE10();
  uint64_t v258 = *(void *)(v295 - 8);
  MEMORY[0x270FA5388](v295);
  v291 = (char *)&v252 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A598);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v297 = (char *)&v252 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v252 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  isa = (char *)&v252 - v15;
  MEMORY[0x270FA5388](v14);
  v303 = (char *)&v252 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A500);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v252 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v264 = (char *)&v252 - v22;
  uint64_t v289 = sub_24737CDE0();
  uint64_t v280 = *(void *)(v289 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v289);
  v286 = ((char *)&v252 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v260 = (char *)&v252 - v26;
  MEMORY[0x270FA5388](v25);
  v292 = (char *)&v252 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v293 = (uint64_t)&v252 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  v288 = (char *)&v252 - v31;
  uint64_t v307 = type metadata accessor for AccountSuggestion();
  uint64_t v301 = *(void *)(v307 - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v307);
  v299 = (uint64_t *)((char *)&v252 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v305 = (uint64_t *)((char *)&v252 - v35);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v263 = (uint64_t)&v252 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v287 = (uint64_t)&v252 - v38;
  uint64_t v39 = sub_24737CE50();
  unint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v256 = (char *)&v252 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v281 = (char *)&v252 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  uint64_t v47 = (char *)&v252 - v46;
  MEMORY[0x270FA5388](v45);
  uint64_t v49 = ((char *)&v252 - v48);
  uint64_t v266 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs), sel_synchronize);
  if (qword_26B12A540 != -1) {
    goto LABEL_222;
  }
LABEL_2:
  uint64_t v50 = __swift_project_value_buffer(v39, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
  uint64_t v272 = v50;
  uint64_t v275 = v39;
  v271 = (uint64_t *)(v40 + 16);
  v270 = v51;
  v51((char *)v49, v50, v39);
  uint64_t v52 = sub_24737CE30();
  os_log_type_t v53 = sub_24737D0B0();
  BOOL v54 = os_log_type_enabled(v52, v53);
  v285 = (char *)v6;
  v259 = v21;
  if (v54)
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v55 = 0;
    _os_log_impl(&dword_24735E000, v52, v53, "reloading account suggestions", v55, 2u);
    MEMORY[0x24C5526D0](v55, -1, -1);
  }

  v273 = *(void (**)(NSObject *, uint64_t))(v40 + 8);
  v273(v49, v275);
  uint64_t v56 = *(void **)(v1 + v266);
  v274 = (uint64_t *)(v40 + 8);
  if (v56)
  {
    id v57 = objc_msgSend(v56, sel_dictionaryRepresentation);
    unint64_t v58 = sub_24737CFB0();
  }
  else
  {
    unint64_t v58 = sub_247360FA8(MEMORY[0x263F8EE78]);
  }
  uint64_t v59 = (uint64_t)v47;
  uint64_t v60 = v275;
  v270(v47, v272, v275);
  swift_bridgeObjectRetain_n();
  v61 = sub_24737CE30();
  os_log_type_t v62 = sub_24737D0B0();
  BOOL v63 = os_log_type_enabled(v61, v62);
  v300 = v13;
  uint64_t v290 = (uint64_t)isa;
  if (v63)
  {
    uint64_t v47 = (char *)v58;
    uint64_t v64 = swift_slowAlloc();
    v306 = (char *)v59;
    uint64_t v65 = (uint8_t *)v64;
    uint64_t v66 = swift_slowAlloc();
    v310 = (char *)v66;
    *(_DWORD *)uint64_t v65 = 136315138;
    unint64_t v302 = (unint64_t)(v65 + 4);
    swift_bridgeObjectRetain();
    uint64_t v13 = (char *)MEMORY[0x263F8EE58];
    uint64_t v304 = MEMORY[0x263F8EE58] + 8;
    uint64_t v67 = sub_24737CFC0();
    int64_t v68 = v1;
    unint64_t v70 = v69;
    swift_bridgeObjectRelease();
    *(void *)&long long v313 = sub_247377ED8(v67, v70, (uint64_t *)&v310);
    sub_24737D120();
    swift_bridgeObjectRelease_n();
    int64_t v1 = v68;
    isa = (char *)v290;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24735E000, v61, v62, "loaded suggestion dict: %s", v65, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5526D0](v66, -1, -1);
    MEMORY[0x24C5526D0](v65, -1, -1);

    v273(v306, v275);
    uint64_t v71 = (uint64_t)v305;
    uint64_t v39 = (uint64_t)v288;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v273(v47, v60);
    uint64_t v71 = (uint64_t)v305;
    uint64_t v39 = (uint64_t)v288;
    uint64_t v13 = (char *)MEMORY[0x263F8EE58];
    uint64_t v47 = (char *)v58;
  }
  uint64_t v49 = (v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
  swift_beginAccess();
  uint64_t v72 = MEMORY[0x263F8EE80];
  v277 = (uint64_t *)v49;
  v49->isa = (Class)MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  int64_t v294 = v1;
  uint64_t v21 = (char *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
  swift_beginAccess();
  *(void *)uint64_t v21 = v72;
  swift_bridgeObjectRelease();
  uint64_t v73 = 0;
  uint64_t v74 = 1 << v47[32];
  uint64_t v75 = -1;
  if (v74 < 64) {
    uint64_t v75 = ~(-1 << v74);
  }
  unint64_t v40 = v75 & *((void *)v47 + 8);
  int64_t v1 = (unint64_t)(v74 + 63) >> 6;
  v298 = (char *)v314;
  uint64_t v304 = (uint64_t)&v312;
  v279 = (void (**)(char *, char *, uint64_t))(v280 + 16);
  v268 = (char **)(v280 + 56);
  v262 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v280 + 48);
  v283 = (char **)(v280 + 32);
  uint64_t v257 = v280 + 40;
  v282 = (void (**)(char *, uint64_t))(v280 + 8);
  uint64_t v284 = v301 + 48;
  uint64_t v253 = v1 - 1;
  int64_t v255 = v1 - 5;
  v278 = v47 + 64;
  v254 = v47 + 104;
  v261 = "ize with negative count";
  unint64_t v302 = 0x800000024737E3F0;
  v296 = v13 + 8;
  uint64_t v6 = (uint64_t)v47;
  v269 = v47;
  int64_t v267 = v1;
  v265 = (NSObject **)v21;
  while (1)
  {
    if (v40)
    {
      unint64_t v76 = __clz(__rbit64(v40));
      v40 &= v40 - 1;
      v306 = (char *)v73;
      unint64_t v77 = v76 | (v73 << 6);
LABEL_17:
      uint64_t v78 = *(void *)(v6 + 56);
      uint64_t v79 = (void *)(*(void *)(v6 + 48) + 16 * v77);
      uint64_t v49 = v79[1];
      *(void *)&long long v313 = *v79;
      *((void *)&v313 + 1) = v49;
      sub_24736F860(v78 + 32 * v77, (uint64_t)v298);
      swift_bridgeObjectRetain();
      goto LABEL_24;
    }
    uint64_t v80 = v73 + 1;
    if (__OFADD__(v73, 1))
    {
LABEL_217:
      __break(1u);
LABEL_218:
      __break(1u);
LABEL_219:
      __break(1u);
      goto LABEL_220;
    }
    if (v80 >= v1)
    {
      uint64_t v82 = v73;
    }
    else
    {
      unint64_t v81 = *(void *)&v278[8 * v80];
      if (v81) {
        goto LABEL_21;
      }
      uint64_t v82 = v73 + 1;
      if (v73 + 2 < v1)
      {
        unint64_t v81 = *(void *)&v278[8 * v73 + 16];
        if (v81)
        {
          uint64_t v80 = v73 + 2;
LABEL_21:
          unint64_t v40 = (v81 - 1) & v81;
          unint64_t v77 = __clz(__rbit64(v81)) + (v80 << 6);
          v306 = (char *)v80;
          goto LABEL_17;
        }
        uint64_t v82 = v73 + 2;
        if (v73 + 3 < v1)
        {
          unint64_t v81 = *(void *)&v278[8 * v73 + 24];
          if (v81)
          {
            uint64_t v80 = v73 + 3;
            goto LABEL_21;
          }
          uint64_t v80 = v73 + 4;
          uint64_t v82 = v73 + 3;
          if (v73 + 4 < v1)
          {
            unint64_t v81 = *(void *)&v278[8 * v80];
            if (v81) {
              goto LABEL_21;
            }
            while (v255 != v73)
            {
              unint64_t v81 = *(void *)&v254[8 * v73++];
              if (v81)
              {
                uint64_t v80 = v73 + 4;
                goto LABEL_21;
              }
            }
            uint64_t v82 = v253;
          }
        }
      }
    }
    unint64_t v40 = 0;
    memset(v314, 0, sizeof(v314));
    v306 = (char *)v82;
    long long v313 = 0u;
LABEL_24:
    sub_247374ECC((uint64_t)&v313, (uint64_t)&v310, &qword_26B12A5A0);
    uint64_t v47 = (char *)v311;
    if (!v311)
    {
      swift_release();
      unint64_t v130 = *v277;
      uint64_t v131 = *(void *)(*v277 + 64);
      uint64_t v287 = *v277 + 64;
      uint64_t v132 = 1 << *(unsigned char *)(v130 + 32);
      uint64_t v133 = -1;
      if (v132 < 64) {
        uint64_t v133 = ~(-1 << v132);
      }
      uint64_t v6 = v133 & v131;
      v288 = (char *)OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
      v296 = (char *)(v258 + 8);
      v292 = (char *)(v301 + 56);
      v298 = (char *)((unint64_t)(v132 + 63) >> 6);
      uint64_t v284 = (uint64_t)(v298 - 1);
      unint64_t v302 = v130;
      swift_bridgeObjectRetain();
      uint64_t v304 = 0;
      unint64_t v40 = (unint64_t)&unk_26B12A590;
      uint64_t v21 = v285;
      uint64_t v47 = v300;
      while (!v6)
      {
        uint64_t v148 = v304 + 1;
        if (__OFADD__(v304, 1)) {
          goto LABEL_218;
        }
        uint64_t v142 = (uint64_t)v303;
        if (v148 < (uint64_t)v298)
        {
          unint64_t v149 = *(void *)(v287 + 8 * v148);
          if (v149) {
            goto LABEL_82;
          }
          uint64_t v150 = v304 + 2;
          ++v304;
          if (v148 + 1 < (uint64_t)v298)
          {
            unint64_t v149 = *(void *)(v287 + 8 * v150);
            if (v149) {
              goto LABEL_85;
            }
            uint64_t v304 = v148 + 1;
            if (v148 + 2 < (uint64_t)v298)
            {
              unint64_t v149 = *(void *)(v287 + 8 * (v148 + 2));
              if (v149)
              {
                v148 += 2;
LABEL_82:
                v306 = (char *)((v149 - 1) & v149);
                unint64_t v141 = __clz(__rbit64(v149)) + (v148 << 6);
                uint64_t v304 = v148;
LABEL_78:
                uint64_t v143 = *(void *)(v302 + 56);
                v144 = (void *)(*(void *)(v302 + 48) + 16 * v141);
                uint64_t v145 = v144[1];
                *(void *)isa = *v144;
                *((void *)isa + 1) = v145;
                uint64_t v146 = v143 + *(void *)(v301 + 72) * v141;
                uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)v40);
                sub_247368BAC(v146, (uint64_t)&isa[*(int *)(v147 + 48)]);
                (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v147 - 8) + 56))(isa, 0, 1, v147);
                swift_bridgeObjectRetain();
                uint64_t v71 = (uint64_t)v305;
                goto LABEL_97;
              }
              uint64_t v150 = v148 + 3;
              uint64_t v304 = v148 + 2;
              if (v148 + 3 < (uint64_t)v298)
              {
                unint64_t v149 = *(void *)(v287 + 8 * v150);
                if (v149)
                {
LABEL_85:
                  uint64_t v148 = v150;
                  goto LABEL_82;
                }
                while (1)
                {
                  uint64_t v148 = v150 + 1;
                  if (__OFADD__(v150, 1)) {
                    goto LABEL_224;
                  }
                  if (v148 >= (uint64_t)v298) {
                    break;
                  }
                  unint64_t v149 = *(void *)(v287 + 8 * v148);
                  ++v150;
                  if (v149) {
                    goto LABEL_82;
                  }
                }
                uint64_t v304 = v284;
              }
            }
          }
        }
        uint64_t v151 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)v40);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v151 - 8) + 56))(isa, 1, 1, v151);
        v306 = 0;
LABEL_97:
        int64_t v1 = (int64_t)isa;
        sub_247374ECC((uint64_t)isa, v142, &qword_26B12A598);
        uint64_t v13 = (char *)v40;
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)v40);
        v152 = *(NSObject **)(v39 - 8);
        uint64_t v49 = v152 + 6;
        isa = (char *)v152[6].isa;
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))isa)(v142, 1, v39) == 1)
        {
          v298 = (char *)v39;
          swift_release();
          v179 = (char *)*v265;
          Class v180 = (*v265)[8].isa;
          v264 = (char *)&(*v265)[8];
          uint64_t v6 = 1 << v179[32];
          if (v6 < 64) {
            uint64_t v181 = ~(-1 << v6);
          }
          else {
            uint64_t v181 = -1;
          }
          uint64_t v287 = v181 & (unint64_t)v180;
          v182 = (uint64_t *)v294;
          v183 = (unsigned char *)(v294 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
          v278 = v179;
          swift_bridgeObjectRetain();
          v269 = v183;
          swift_beginAccess();
          uint64_t v284 = 0;
          uint64_t v304 = (uint64_t)&v152[7];
          unint64_t v40 = (unint64_t)v182;
          v268 = (char **)((unint64_t)(v6 + 63) >> 6);
          uint64_t v263 = (uint64_t)v268 - 1;
          uint64_t v13 = v297;
          v305 = (uint64_t *)v49;
          v303 = isa;
          uint64_t v39 = (uint64_t)v276;
          while (2)
          {
            while (2)
            {
              if (v287)
              {
                isa = v21;
                v184 = (uint64_t *)v40;
                unint64_t v185 = __clz(__rbit64(v287));
                v287 &= v287 - 1;
                unint64_t v186 = v185 | (v284 << 6);
                goto LABEL_125;
              }
              uint64_t v192 = v284 + 1;
              if (__OFADD__(v284, 1)) {
                goto LABEL_219;
              }
              if (v192 >= (uint64_t)v268) {
                goto LABEL_143;
              }
              unint64_t v193 = *(void *)&v264[8 * v192];
              if (!v193)
              {
                uint64_t v194 = v284 + 2;
                ++v284;
                if (v192 + 1 < (uint64_t)v268)
                {
                  unint64_t v193 = *(void *)&v264[8 * v194];
                  if (v193)
                  {
LABEL_132:
                    uint64_t v192 = v194;
                    goto LABEL_129;
                  }
                  uint64_t v284 = v192 + 1;
                  if (v192 + 2 < (uint64_t)v268)
                  {
                    unint64_t v193 = *(void *)&v264[8 * v192 + 16];
                    if (v193)
                    {
                      v192 += 2;
                      goto LABEL_129;
                    }
                    uint64_t v194 = v192 + 3;
                    uint64_t v284 = v192 + 2;
                    if (v192 + 3 < (uint64_t)v268)
                    {
                      unint64_t v193 = *(void *)&v264[8 * v194];
                      if (v193) {
                        goto LABEL_132;
                      }
                      while (1)
                      {
                        uint64_t v192 = v194 + 1;
                        if (__OFADD__(v194, 1)) {
                          goto LABEL_225;
                        }
                        if (v192 >= (uint64_t)v268) {
                          break;
                        }
                        unint64_t v193 = *(void *)&v264[8 * v192];
                        ++v194;
                        if (v193) {
                          goto LABEL_129;
                        }
                      }
                      uint64_t v284 = v263;
                    }
                  }
                }
LABEL_143:
                uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A580);
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v195 - 8) + 56))(v39, 1, 1, v195);
                uint64_t v287 = 0;
                goto LABEL_144;
              }
LABEL_129:
              isa = v21;
              v184 = (uint64_t *)v40;
              uint64_t v287 = (v193 - 1) & v193;
              unint64_t v186 = __clz(__rbit64(v193)) + (v192 << 6);
              uint64_t v284 = v192;
LABEL_125:
              uint64_t v187 = *((void *)v278 + 7);
              v188 = (void *)(*((void *)v278 + 6) + 16 * v186);
              uint64_t v6 = v188[1];
              *(void *)uint64_t v39 = *v188;
              *(void *)(v39 + 8) = v6;
              uint64_t v189 = v280;
              uint64_t v190 = v187 + *(void *)(v280 + 72) * v186;
              uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A580);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v189 + 16))(v39 + *(int *)(v191 + 48), v190, v289);
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v191 - 8) + 56))(v39, 0, 1, v191);
              swift_bridgeObjectRetain();
              unint64_t v40 = (unint64_t)v184;
              uint64_t v21 = isa;
LABEL_144:
              sub_247374ECC(v39, (uint64_t)v21, &qword_26B12A588);
              uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A580);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v196 - 8) + 48))(v21, 1, v196) == 1)
              {
                swift_release();
                sub_247367AD4();
                v246 = v256;
                uint64_t v247 = v275;
                v270(v256, v272, v275);
                swift_retain();
                v248 = sub_24737CE30();
                os_log_type_t v249 = sub_24737D0B0();
                if (os_log_type_enabled(v248, v249))
                {
                  uint64_t v250 = swift_slowAlloc();
                  *(_DWORD *)uint64_t v250 = 134218240;
                  v310 = *(char **)(*v277 + 16);
                  sub_24737D120();
                  *(_WORD *)(v250 + 12) = 2048;
                  v310 = (char *)(*v265)[2].isa;
                  sub_24737D120();
                  swift_release();
                  _os_log_impl(&dword_24735E000, v248, v249, "reloading account suggestions finished, loaded %ld suggestions, loaded %ld devices", (uint8_t *)v250, 0x16u);
                  MEMORY[0x24C5526D0](v250, -1, -1);
                }
                else
                {

                  swift_release();
                }
                return ((uint64_t (*)(char *, uint64_t))v273)(v246, v247);
              }
              v296 = *(char **)v21;
              v306 = (char *)*((void *)v21 + 1);
              v197 = &v21[*(int *)(v196 + 48)];
              uint64_t v49 = v286;
              ((void (*)(NSObject *, char *, uint64_t))*v283)(v286, v197, v289);
              sub_24737CDA0();
              double v199 = fabs(v198);
              v200 = *(void **)&v288[v40];
              int64_t v1 = (int64_t)v305;
              if (v200)
              {
                uint64_t v6 = qword_26B12A548;
                uint64_t v49 = v200;
                if (v6 != -1) {
                  swift_once();
                }
                v201 = (void *)sub_24737CFD0();
                [v49 doubleForKey:v201];
                double v203 = v202;

                if (v203 > 0.0)
                {
                  if (v203 < v199) {
                    break;
                  }
                  goto LABEL_122;
                }
              }
              if (v199 <= 7776000.0)
              {
LABEL_122:
                (*v282)((char *)v286, v289);
                swift_bridgeObjectRelease();
                continue;
              }
              break;
            }
            uint64_t v204 = v275;
            v270(v281, v272, v275);
            uint64_t v49 = sub_24737CE30();
            os_log_type_t v205 = sub_24737D0B0();
            if (os_log_type_enabled(v49, v205))
            {
              v206 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v206 = 0;
              _os_log_impl(&dword_24735E000, v49, v205, "device too old, removing it from all suggestions and the device list", v206, 2u);
              MEMORY[0x24C5526D0](v206, -1, -1);
            }

            v273(v281, v204);
            unint64_t v207 = *v277;
            uint64_t v208 = *(void *)(*v277 + 64);
            v291 = (char *)(*v277 + 64);
            uint64_t v209 = 1 << *(unsigned char *)(v207 + 32);
            if (v209 < 64) {
              uint64_t v210 = ~(-1 << v209);
            }
            else {
              uint64_t v210 = -1;
            }
            unint64_t v40 = v210 & v208;
            int64_t v295 = (unint64_t)(v209 + 63) >> 6;
            int64_t v267 = v295 - 1;
            unint64_t v302 = v207;
            swift_bridgeObjectRetain();
            uint64_t v39 = 0;
            uint64_t v6 = (uint64_t)v299;
            isa = v296;
            uint64_t v21 = v298;
LABEL_161:
            if (v40)
            {
              unint64_t v217 = __clz(__rbit64(v40));
              v40 &= v40 - 1;
              unint64_t v218 = v217 | (v39 << 6);
              goto LABEL_163;
            }
            int64_t v221 = v39 + 1;
            if (__OFADD__(v39, 1))
            {
              __break(1u);
              goto LABEL_217;
            }
            if (v221 >= v295) {
              goto LABEL_181;
            }
            unint64_t v222 = *(void *)&v291[8 * v221];
            if (v222)
            {
LABEL_167:
              unint64_t v40 = (v222 - 1) & v222;
              unint64_t v218 = __clz(__rbit64(v222)) + (v221 << 6);
              uint64_t v39 = v221;
LABEL_163:
              uint64_t v219 = *(void *)(v302 + 56);
              v220 = (void *)(*(void *)(v302 + 48) + 16 * v218);
              uint64_t v49 = v220[1];
              *(void *)uint64_t v13 = *v220;
              *((void *)v13 + 1) = v49;
              sub_247368BAC(v219 + *(void *)(v301 + 72) * v218, (uint64_t)&v13[*((int *)v21 + 12)]);
              (*(void (**)(char *, void, uint64_t, char *))v304)(v13, 0, 1, v21);
              swift_bridgeObjectRetain();
LABEL_182:
              sub_247374ECC((uint64_t)v13, (uint64_t)v47, &qword_26B12A598);
              if (((unsigned int (*)(char *, uint64_t, char *))v303)(v47, 1, v21) == 1)
              {
                swift_bridgeObjectRelease();
                swift_release();
                if (*v269)
                {
                  (*v282)((char *)v286, v289);
                  unint64_t v40 = v294;
                  uint64_t v39 = (uint64_t)v276;
                  uint64_t v21 = v285;
                }
                else
                {
                  unint64_t v40 = v294;
                  v242 = *(void **)(v294 + v266);
                  uint64_t v39 = (uint64_t)v276;
                  uint64_t v21 = v285;
                  if (v242)
                  {
                    uint64_t v243 = qword_26B12A530;
                    uint64_t v6 = v242;
                    if (v243 != -1) {
                      swift_once();
                    }
                    isa = (char *)qword_26B12A6A8;
                    v244 = unk_26B12A6B0;
                    sub_2473617E4();
                    v310 = isa;
                    v311 = v244;
                    swift_bridgeObjectRetain();
                    sub_24737D030();
                    swift_bridgeObjectRelease();
                    uint64_t v49 = v311;
                    v245 = (void *)sub_24737CFD0();
                    swift_bridgeObjectRelease();
                    objc_msgSend((id)v6, sel_removeObjectForKey_, v245);

                    (*v282)((char *)v286, v289);
                    uint64_t v39 = (uint64_t)v276;
                    uint64_t v21 = v285;
                    uint64_t v47 = v300;
                  }
                  else
                  {
                    (*v282)((char *)v286, v289);
                  }
                }
                continue;
              }
              swift_bridgeObjectRelease();
              sub_247368D54((uint64_t)&v47[*((int *)v21 + 12)], v6);
              uint64_t v224 = v6 + *(int *)(v307 + 40);
              uint64_t v225 = *(void *)v224;
              if (*(void *)(*(void *)v224 + 16))
              {
                sub_24737D2C0();
                swift_bridgeObjectRetain();
                v226 = isa;
                uint64_t v227 = (uint64_t)v306;
                sub_24737D000();
                uint64_t v228 = sub_24737D2E0();
                uint64_t v229 = -1 << *(unsigned char *)(v225 + 32);
                unint64_t v230 = v228 & ~v229;
                uint64_t v49 = (v225 + 56);
                if (((*(void *)(v225 + 56 + ((v230 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v230) & 1) == 0) {
                  goto LABEL_204;
                }
                uint64_t v231 = *(void *)(v225 + 48);
                v232 = (char **)(v231 + 16 * v230);
                BOOL v233 = *v232 == v226 && v232[1] == (char *)v227;
                if (v233 || (sub_24737D270() & 1) != 0) {
                  goto LABEL_158;
                }
                uint64_t v290 = ~v229;
                unint64_t v234 = (v230 + 1) & ~v229;
                uint64_t v235 = (uint64_t)v306;
                v226 = v296;
                if (((*(unint64_t *)((char *)&v49->isa + ((v234 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v234) & 1) == 0) {
                  goto LABEL_204;
                }
                v236 = (char **)(v231 + 16 * v234);
                BOOL v237 = *v236 == v296 && v236[1] == v306;
                if (v237 || (sub_24737D270() & 1) != 0)
                {
LABEL_158:
                  swift_bridgeObjectRelease();
                  uint64_t v13 = v297;
                  isa = v296;
                  sub_24737034C((uint64_t)v296, (uint64_t)v306);
                  swift_bridgeObjectRelease();
                  v211 = v299;
                  uint64_t v212 = v293;
                  sub_247368BAC((uint64_t)v299, v293);
                  (*(void (**)(uint64_t, void, uint64_t, uint64_t))v292)(v212, 0, 1, v307);
                  uint64_t v213 = *v211;
                  uint64_t v214 = v211[1];
                  swift_bridgeObjectRetain();
                  uint64_t v215 = v213;
                  uint64_t v49 = v294;
                  sub_247369004(v212, v215, v214, 0, 0);
                  swift_bridgeObjectRelease();
                  uint64_t v216 = v212;
                  uint64_t v6 = (uint64_t)v211;
                  sub_247374C8C(v216, &qword_26B12A518);
                  uint64_t v47 = v300;
                }
                else
                {
                  for (unint64_t i = v234 + 1; ; unint64_t i = v239 + 1)
                  {
                    unint64_t v239 = i & v290;
                    if (((*(unint64_t *)((char *)&v49->isa + (((i & v290) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v290)) & 1) == 0) {
                      break;
                    }
                    v240 = (char **)(v231 + 16 * v239);
                    BOOL v241 = *v240 == v226 && v240[1] == (char *)v235;
                    if (v241 || (sub_24737D270() & 1) != 0) {
                      goto LABEL_158;
                    }
                  }
LABEL_204:
                  swift_bridgeObjectRelease();
                  uint64_t v13 = v297;
                  uint64_t v47 = v300;
                  uint64_t v6 = (uint64_t)v299;
                  isa = v226;
                }
                uint64_t v21 = v298;
              }
              sub_24736F48C(v6);
              int64_t v1 = (int64_t)v305;
              goto LABEL_161;
            }
            break;
          }
          uint64_t v223 = v39 + 2;
          ++v39;
          if (v221 + 1 >= v295) {
            goto LABEL_181;
          }
          unint64_t v222 = *(void *)&v291[8 * v223];
          if (v222)
          {
LABEL_170:
            int64_t v221 = v223;
            goto LABEL_167;
          }
          uint64_t v39 = v221 + 1;
          if (v221 + 2 >= v295) {
            goto LABEL_181;
          }
          unint64_t v222 = *(void *)&v291[8 * v221 + 16];
          if (v222)
          {
            v221 += 2;
            goto LABEL_167;
          }
          uint64_t v223 = v221 + 3;
          uint64_t v39 = v221 + 2;
          if (v221 + 3 >= v295)
          {
LABEL_181:
            (*(void (**)(char *, uint64_t, uint64_t, char *))v304)(v13, 1, 1, v21);
            unint64_t v40 = 0;
            goto LABEL_182;
          }
          unint64_t v222 = *(void *)&v291[8 * v223];
          if (v222) {
            goto LABEL_170;
          }
          while (1)
          {
            int64_t v221 = v223 + 1;
            if (__OFADD__(v223, 1)) {
              break;
            }
            if (v221 >= v295)
            {
              uint64_t v39 = v267;
              goto LABEL_181;
            }
            unint64_t v222 = *(void *)&v291[8 * v221];
            ++v223;
            if (v222) {
              goto LABEL_167;
            }
          }
LABEL_220:
          __break(1u);
LABEL_221:
          __break(1u);
LABEL_222:
          swift_once();
          goto LABEL_2;
        }
        swift_bridgeObjectRelease();
        sub_247368D54(v142 + *(int *)(v39 + 48), v71);
        int64_t v153 = v294;
        isa = (char *)v1;
        if (*(unsigned char *)(v71 + *(int *)(v307 + 56)) == 1)
        {
          uint64_t v39 = v71 + *(int *)(v307 + 40);
          uint64_t v154 = *(void *)v39;
          v155 = *(void **)&v288[v294];
          if (v155)
          {
            uint64_t v156 = qword_26B12A550;
            swift_bridgeObjectRetain();
            id v157 = v155;
            if (v156 != -1) {
              swift_once();
            }
            v158 = (void *)sub_24737CFD0();
            id v159 = objc_msgSend(v157, sel_stringForKey_, v158);

            if (v159)
            {
              uint64_t v160 = sub_24737CFE0();
              uint64_t v49 = v161;

LABEL_109:
              char v167 = sub_24736799C(v160, (uint64_t)v49, v154);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v21 = v285;
              uint64_t v47 = v300;
              uint64_t v71 = (uint64_t)v305;
              if ((v167 & 1) == 0)
              {
                v168 = *(void **)&v288[v153];
                if (!v168) {
                  goto LABEL_114;
                }
                uint64_t v169 = qword_26B12A550;
                id v170 = v168;
                if (v169 != -1) {
                  swift_once();
                }
                v171 = (void *)sub_24737CFD0();
                id v172 = objc_msgSend(v170, sel_stringForKey_, v171);

                if (v172)
                {
                  uint64_t v134 = sub_24737CFE0();
                  uint64_t v136 = v135;
                }
                else
                {
LABEL_114:
                  v173 = v291;
                  sub_24737CE00();
                  uint64_t v134 = sub_24737CDF0();
                  uint64_t v136 = v174;
                  (*(void (**)(char *, int64_t))v296)(v173, v295);
                  v175 = *(void **)&v288[v153];
                  if (v175)
                  {
                    id v176 = v175;
                    v177 = (void *)sub_24737CFD0();
                    if (qword_26B12A550 != -1) {
                      swift_once();
                    }
                    v178 = (void *)sub_24737CFD0();
                    objc_msgSend(v176, sel_setObject_forKey_, v177, v178);

                    uint64_t v47 = v300;
                  }
                }
                swift_bridgeObjectRetain();
                sub_24736F8BC((uint64_t *)&v310, v134, v136);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v137 = v305;
                uint64_t v138 = v293;
                sub_247368BAC((uint64_t)v305, v293);
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))v292)(v138, 0, 1, v307);
                uint64_t v139 = *v137;
                uint64_t v39 = v137[1];
                swift_bridgeObjectRetain();
                uint64_t v49 = v153;
                sub_247369004(v138, v139, v39, 0, 0);
                swift_bridgeObjectRelease();
                uint64_t v140 = v138;
                uint64_t v71 = (uint64_t)v137;
                sub_247374C8C(v140, &qword_26B12A518);
                uint64_t v21 = v285;
              }
              goto LABEL_75;
            }
          }
          else
          {
            swift_bridgeObjectRetain();
          }
          v162 = v291;
          sub_24737CE00();
          uint64_t v160 = sub_24737CDF0();
          uint64_t v49 = v163;
          (*(void (**)(char *, int64_t))v296)(v162, v295);
          v164 = *(void **)&v288[v153];
          if (v164)
          {
            int64_t v1 = v164;
            v165 = (void *)sub_24737CFD0();
            if (qword_26B12A550 != -1) {
              swift_once();
            }
            v166 = (void *)sub_24737CFD0();
            objc_msgSend((id)v1, sel_setObject_forKey_, v165, v166);

            isa = (char *)v290;
          }
          goto LABEL_109;
        }
LABEL_75:
        sub_24736F48C(v71);
        unint64_t v40 = (unint64_t)v13;
        uint64_t v6 = (uint64_t)v306;
      }
      v306 = (char *)((v6 - 1) & v6);
      unint64_t v141 = __clz(__rbit64(v6)) | (v304 << 6);
      uint64_t v142 = (uint64_t)v303;
      goto LABEL_78;
    }
    uint64_t v21 = v310;
    sub_247374C74((_OWORD *)v304, &v313);
    if ((sub_24737D050() & 1) == 0) {
      break;
    }
    sub_24736F860((uint64_t)&v313, (uint64_t)v309);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A648);
    if (!swift_dynamicCast()) {
      goto LABEL_13;
    }
    AccountSuggestion.init(with:)((uint64_t)v308, v39);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v284)(v39, 1, v307) == 1)
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v313);
      swift_bridgeObjectRelease();
      sub_247374C8C(v39, &qword_26B12A518);
    }
    else
    {
      sub_247368D54(v39, v287);
      if (sub_24737D050())
      {
        swift_bridgeObjectRetain();
        uint64_t v102 = sub_24737D010();
        uint64_t v103 = sub_247373DDC(v102, (uint64_t)v21, (unint64_t)v47);
        uint64_t v105 = v104;
        uint64_t v107 = v106;
        uint64_t v109 = v108;
        swift_bridgeObjectRelease();
        uint64_t v110 = v107;
        uint64_t v71 = (uint64_t)v305;
        uint64_t v21 = (char *)MEMORY[0x24C551EF0](v103, v105, v110, v109);
        v112 = v111;
        swift_bridgeObjectRelease();
        int64_t v1 = v267;
        isa = (char *)v290;
        swift_bridgeObjectRelease();
        uint64_t v47 = v112;
      }
      v113 = v277;
      swift_beginAccess();
      uint64_t v114 = v287;
      uint64_t v115 = v263;
      sub_247368BAC(v287, v263);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v308 = *v113;
      uint64_t *v113 = 0x8000000000000000;
      sub_24737A120(v115, (uint64_t)v21, (uint64_t)v47, isUniquelyReferenced_nonNull_native);
      uint64_t v49 = *v113;
      uint64_t *v113 = (uint64_t)v308;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_24736F48C(v114);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v313);
      uint64_t v39 = (uint64_t)v288;
      uint64_t v13 = (char *)MEMORY[0x263F8EE58];
      uint64_t v6 = (uint64_t)v269;
    }
LABEL_14:
    uint64_t v73 = (uint64_t)v306;
  }
  if (qword_26B12A530 != -1) {
    swift_once();
  }
  if ((sub_24737D050() & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v313);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_24736F860((uint64_t)&v313, (uint64_t)v309);
  if (!swift_dynamicCast())
  {
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v313);
    goto LABEL_14;
  }
  sub_24737CDB0();
  if (sub_24737D050())
  {
    swift_bridgeObjectRetain();
    uint64_t v83 = sub_24737D010();
    uint64_t v84 = sub_247373DDC(v83, (uint64_t)v21, (unint64_t)v47);
    uint64_t v86 = v85;
    uint64_t v88 = v87;
    uint64_t v90 = v89;
    swift_bridgeObjectRelease();
    uint64_t v21 = (char *)MEMORY[0x24C551EF0](v84, v86, v88, v90);
    v92 = v91;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v47 = v92;
  }
  uint64_t v93 = v289;
  uint64_t v39 = (uint64_t)v264;
  (*v279)(v264, v292, v289);
  uint64_t v13 = *v268;
  ((void (*)(uint64_t, void, uint64_t, uint64_t))*v268)(v39, 0, 1, v93);
  v94 = v265;
  swift_beginAccess();
  if ((*v262)(v39, 1, v93) == 1)
  {
    sub_247374C8C(v39, &qword_26B12A500);
    uint64_t v49 = *v94;
    swift_bridgeObjectRetain();
    unint64_t v95 = sub_247378620((uint64_t)v21, (uint64_t)v47);
    char v97 = v96;
    swift_bridgeObjectRelease();
    if (v97)
    {
      int v98 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v49 = *v94;
      v308 = *v94;
      *v94 = 0x8000000000000000;
      uint64_t v21 = (char *)v94;
      if (!v98)
      {
        sub_24737AA54();
        uint64_t v49 = v308;
      }
      swift_bridgeObjectRelease();
      uint64_t v99 = (uint64_t)v259;
      uint64_t v100 = v289;
      (*(void (**)(char *, char *, uint64_t))(v280 + 32))(v259, (char *)v49[7].isa + *(void *)(v280 + 72) * v95, v289);
      sub_247379BBC(v95, (uint64_t)v49);
      *v94 = v49;
      swift_bridgeObjectRelease();
      uint64_t v101 = 0;
      isa = (char *)v290;
    }
    else
    {
      uint64_t v101 = 1;
      uint64_t v100 = v289;
      isa = (char *)v290;
      uint64_t v99 = (uint64_t)v259;
    }
    int64_t v1 = v267;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v13)(v99, v101, 1, v100);
    swift_bridgeObjectRelease();
    sub_247374C8C(v99, &qword_26B12A500);
    uint64_t v39 = (uint64_t)v288;
    uint64_t v6 = (uint64_t)v269;
    uint64_t v13 = (char *)MEMORY[0x263F8EE58];
    goto LABEL_60;
  }
  isa = *v283;
  ((void (*)(char *, uint64_t, uint64_t))*v283)(v260, v39, v93);
  int v117 = swift_isUniquelyReferenced_nonNull_native();
  v308 = *v94;
  uint64_t v49 = v308;
  *v94 = 0x8000000000000000;
  int64_t v1 = sub_247378620((uint64_t)v21, (uint64_t)v47);
  Class v119 = v49[2].isa;
  BOOL v120 = (v118 & 1) == 0;
  uint64_t v121 = (uint64_t)v119 + v120;
  if (__OFADD__(v119, v120)) {
    goto LABEL_221;
  }
  char v122 = v118;
  if ((uint64_t)v49[3].isa >= v121)
  {
    uint64_t v13 = (char *)MEMORY[0x263F8EE58];
    if ((v117 & 1) == 0) {
      sub_24737AA54();
    }
  }
  else
  {
    sub_2473792E4(v121, v117);
    unint64_t v123 = sub_247378620((uint64_t)v21, (uint64_t)v47);
    uint64_t v13 = (char *)MEMORY[0x263F8EE58];
    if ((v122 & 1) != (v124 & 1)) {
      goto LABEL_226;
    }
    int64_t v1 = v123;
  }
  v125 = v308;
  if (v122)
  {
    (*(void (**)(int64_t, char *, uint64_t))(v280 + 40))((int64_t)v308[7].isa + *(void *)(v280 + 72) * v1, v260, v289);
LABEL_59:
    uint64_t v21 = (char *)v265;
    uint64_t v49 = *v265;
    *v265 = v308;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v100 = v289;
    isa = (char *)v290;
    uint64_t v39 = (uint64_t)v288;
    int64_t v1 = v267;
LABEL_60:
    swift_endAccess();
    (*v282)(v292, v100);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v313);
    uint64_t v71 = (uint64_t)v305;
    goto LABEL_14;
  }
  v308[((unint64_t)v1 >> 6) + 8].isa = (Class)((uint64_t)v308[((unint64_t)v1 >> 6) + 8].isa | (1 << v1));
  v126 = (char **)((char *)v125[6].isa + 16 * v1);
  *v126 = v21;
  v126[1] = v47;
  ((void (*)(char *, char *, uint64_t))isa)((char *)v125[7].isa + *(void *)(v280 + 72) * v1, v260, v289);
  Class v127 = v125[2].isa;
  BOOL v128 = __OFADD__(v127, 1);
  v129 = (Class)((char *)v127 + 1);
  if (!v128)
  {
    v125[2].isa = v129;
    swift_bridgeObjectRetain();
    goto LABEL_59;
  }
  __break(1u);
LABEL_224:
  __break(1u);
LABEL_225:
  __break(1u);
LABEL_226:
  uint64_t result = sub_24737D2B0();
  __break(1u);
  return result;
}

uint64_t sub_247367604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AccountSuggestion();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_247374C8C(a1, &qword_26B12A518);
    sub_2473788E0(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_247374C8C((uint64_t)v10, &qword_26B12A518);
  }
  else
  {
    sub_247368D54(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_24737A120((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2473677C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A500);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24737CDE0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_247374C8C(a1, &qword_26B12A500);
    sub_247378A84(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_247374C8C((uint64_t)v10, &qword_26B12A500);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_24737A284((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24736799C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24737D2C0();
    sub_24737D000();
    uint64_t v6 = sub_24737D2E0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24737D270() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24737D270() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_247367AD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24737CEF0();
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24737CF20();
  uint64_t v5 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = swift_bridgeObjectRetain();
  size_t v9 = sub_24737AED0(v8);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_247373F80(v10, v0);
  swift_release();
  aBlock[0] = v11;
  swift_bridgeObjectRetain();
  sub_2473706A4(aBlock, sub_24737075C);
  swift_bridgeObjectRelease();
  BOOL v12 = aBlock[0];
  sub_247374D7C(0, &qword_26B12A5E8);
  uint64_t v13 = (void *)sub_24737D0F0();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v1;
  v14[3] = v9;
  v14[4] = v12;
  aBlock[4] = sub_247374DBC;
  void aBlock[5] = v14;
  aBlock[0] = (void *)MEMORY[0x263EF8330];
  aBlock[1] = (void *)1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = &block_descriptor_99;
  unint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_24737CF00();
  aBlock[0] = (void *)MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  MEMORY[0x24C552000](0, v7, v4, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v17);
}

uint64_t sub_247367E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  uint64_t v7 = (void (**)(uint64_t (*)(), void *))(a1
                                                     + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (*v7)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_247361C50((uint64_t)v8);
    v8(sub_247374E14, v6);
    sub_247361CC0((uint64_t)v8);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_bridgeObjectRetain();
    sub_24737CED0();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_24737CED0();
  }
  return swift_release();
}

uint64_t sub_247367FE4()
{
  return sub_24737CED0();
}

uint64_t sub_2473680B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24737D270();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  size_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24737D270() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_24736817C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24737CE50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v29 - v7;
  uint64_t v9 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults);
  if (!v10
    || (id v11 = v10,
        BOOL v12 = (void *)sub_24737CFD0(),
        unsigned __int8 v13 = objc_msgSend(v11, sel_BOOLForKey_, v12),
        v11,
        v12,
        (v13 & 1) == 0))
  {
    uint64_t v31 = v9;
    if (qword_26B12A540 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12A4E8);
    swift_beginAccess();
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v30(v8, v14, v2);
    unint64_t v15 = sub_24737CE30();
    os_log_type_t v16 = sub_24737D0B0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = v3;
      uint64_t v18 = v1;
      uint64_t v19 = v6;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_24735E000, v15, v16, "Not locally migrated! Running now", v20, 2u);
      uint64_t v21 = v20;
      uint64_t v6 = v19;
      uint64_t v1 = v18;
      uint64_t v3 = v17;
      MEMORY[0x24C5526D0](v21, -1, -1);
    }

    uint64_t v22 = *(void (**)(char *, uint64_t))(v3 + 8);
    v22(v8, v2);
    uint64_t v23 = *(void **)(v1 + v31);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = (void *)sub_24737CFD0();
      objc_msgSend(v24, sel_setBool_forKey_, 1, v25);
    }
    sub_247368E30();
    v30(v6, v14, v2);
    uint64_t v26 = sub_24737CE30();
    os_log_type_t v27 = sub_24737D0B0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_24735E000, v26, v27, "Local migration is now complete, you are free to get up and move about the cabin", v28, 2u);
      MEMORY[0x24C5526D0](v28, -1, -1);
    }

    v22(v6, v2);
  }
}

void sub_2473684CC(void *a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_supportedAccountTypes);
  swift_bridgeObjectRetain();
  id v4 = objc_msgSend(a1, sel_accountType);
  if (!v4)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_identifier);

  if (!v6)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = sub_24737CFE0();
  uint64_t v9 = v8;

  LOBYTE(v7) = sub_2473680B4(v7, v9, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    return;
  }

  id v10 = objc_msgSend(a1, sel_personaIdentifier);
  if (v10) {

  }
  else {
    objc_msgSend(a1, sel_isDataSeparatedAccount);
  }
  if (objc_msgSend(a1, sel_accountPropertyForKey_, *MEMORY[0x263EFAD68]))
  {
    sub_24737D150();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  sub_247374C8C((uint64_t)&v20, &qword_269249060);
  id v11 = objc_msgSend(a1, sel_accountType);
  if (!v11)
  {
LABEL_24:
    __break(1u);
    return;
  }
  BOOL v12 = v11;
  id v13 = objc_msgSend(v11, sel_identifier);

  if (!v13)
  {
    sub_24737CFE0();
    goto LABEL_18;
  }
  uint64_t v14 = sub_24737CFE0();
  uint64_t v16 = v15;

  uint64_t v17 = sub_24737CFE0();
  if (!v16)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  if (v14 == v17 && v16 == v18)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    objc_msgSend(a1, sel_aa_isAccountClass_, *MEMORY[0x263F25618], v20, v21);
    return;
  }
  char v19 = sub_24737D270();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19) {
    goto LABEL_21;
  }
}

id sub_247368794(void *a1)
{
  sub_2473684CC(a1);
  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_accountTypesThatNeedProperties);
  swift_bridgeObjectRetain();
  id result = objc_msgSend(a1, sel_accountType);
  if (result)
  {
    id v6 = result;
    id v7 = objc_msgSend(result, sel_identifier);

    if (v7)
    {
      uint64_t v8 = sub_24737CFE0();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0xE000000000000000;
    }
    char v11 = sub_2473680B4(v8, v10, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)(v11 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AccountSuggestionManager.supportedAccountTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void *sub_24736887C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24737D8F0;
  *(void *)(inited + 32) = sub_24737CFE0();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = sub_24737CFE0();
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 64) = sub_24737CFE0();
  *(void *)(inited + 72) = v3;
  *(void *)(inited + 80) = sub_24737CFE0();
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 96) = sub_24737CFE0();
  *(void *)(inited + 104) = v5;
  *(void *)(inited + 112) = sub_24737CFE0();
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 128) = sub_24737CFE0();
  *(void *)(inited + 136) = v7;
  *(void *)(inited + 144) = sub_24737CFE0();
  *(void *)(inited + 152) = v8;
  *(void *)(inited + 160) = sub_24737CFE0();
  *(void *)(inited + 168) = v9;
  *(void *)(inited + 176) = sub_24737CFE0();
  *(void *)(inited + 184) = v10;
  *(void *)(inited + 192) = sub_24737CFE0();
  *(void *)(inited + 200) = v11;
  *(void *)(inited + 208) = sub_24737CFE0();
  *(void *)(inited + 216) = v12;
  *(void *)(inited + 224) = sub_24737CFE0();
  *(void *)(inited + 232) = v13;
  *(void *)(inited + 240) = sub_24737CFE0();
  *(void *)(inited + 248) = v14;
  uint64_t v15 = sub_24737CFE0();
  uint64_t v17 = v16;
  id result = sub_24736F4E8((void *)1, 15, 1, (void *)inited);
  result[2] = 15;
  result[32] = v15;
  result[33] = v17;
  return result;
}

uint64_t sub_247368A50()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247368A60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

void sub_247368AA0()
{
  sub_247362E2C(v0);
}

uint64_t sub_247368AA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247368AF0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247368B40()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_247368B98()
{
  return sub_24736368C(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8]);
}

uint64_t sub_247368BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247368C10()
{
  uint64_t v1 = (int *)(type metadata accessor for AccountSuggestion() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[10];
  uint64_t v7 = sub_24737CDE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_247368D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247368DB8()
{
  uint64_t v1 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_247364370(v2, v3);
}

uint64_t AccountSuggestionManager.locallySupportedAccountTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void sub_247368E30()
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultStore);
  if (!v0) {
    goto LABEL_16;
  }
  uint64_t v1 = v0;
  uint64_t v2 = (void *)sub_24737D070();
  v13[0] = 0;
  id v3 = objc_msgSend(v1, sel_accountsWithAccountTypeIdentifiers_error_, v2, v13);

  id v4 = v13[0];
  if (!v3)
  {
    id v11 = v13[0];
    uint64_t v12 = (void *)sub_24737CD80();

    swift_willThrow();
    return;
  }
  sub_247374D7C(0, &qword_26B12A660);
  unint64_t v5 = sub_24737D080();
  id v6 = v4;

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24737D200();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_5:
      if (v7 >= 1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if ((v5 & 0xC000000000000001) != 0) {
            id v9 = (id)MEMORY[0x24C5520D0](i, v5);
          }
          else {
            id v9 = *(id *)(v5 + 8 * i + 32);
          }
          uint64_t v10 = v9;
          sub_24736BF40(v9);
        }
        goto LABEL_13;
      }
      __break(1u);
LABEL_16:
      __break(1u);
    }
  }
LABEL_13:
  swift_bridgeObjectRelease();
}

void sub_247369004(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5)
{
  uint64_t v6 = v5;
  int v58 = a4;
  uint64_t v62 = a2;
  uint64_t v63 = a3;
  uint64_t v59 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v57 = (uint64_t)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v55 - v11;
  uint64_t v13 = type metadata accessor for AccountSuggestion();
  uint64_t v60 = *(void *)(v13 - 8);
  uint64_t v61 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (uint64_t *)((char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_24737CE50();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  char v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v16, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v20, v16);
  long long v21 = sub_24737CE30();
  os_log_type_t v22 = sub_24737D0B0();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_24735E000, v21, v22, "updating KVS with latest local!", v23, 2u);
    MEMORY[0x24C5526D0](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v24 = v6;
  uint64_t v25 = (unsigned char *)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  swift_beginAccess();
  if (*v25 != 1 || (a5 & 1) != 0)
  {
    unint64_t v64 = 0xD000000000000013;
    unint64_t v65 = 0x800000024737E3F0;
    sub_24737D030();
    unint64_t v26 = v64;
    os_log_type_t v27 = *(void **)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
    uint64_t v56 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = (void *)sub_24737CFD0();
      id v30 = objc_msgSend(v28, sel_dictionaryForKey_, v29);

      uint64_t v31 = v15;
      if (v30)
      {
        uint64_t v32 = sub_24737CFB0();
      }
      else
      {
        uint64_t v32 = 0;
      }
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v31 = v15;
    }
    uint64_t v34 = v60;
    uint64_t v33 = v61;
    sub_247375164(v59, (uint64_t)v12, &qword_26B12A518);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v12, 1, v33) == 1)
    {
      sub_247374C8C((uint64_t)v12, &qword_26B12A518);
      if (v32)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = v57;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v57, 1, 1, v33);
        swift_beginAccess();
        uint64_t v36 = v63;
        swift_bridgeObjectRetain();
        sub_247367604(v35, v62, v36);
        swift_endAccess();
        uint64_t v37 = *(void **)(v24 + v56);
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = (void *)sub_24737CFD0();
          swift_bridgeObjectRelease();
          objc_msgSend(v38, sel_removeObjectForKey_, v39);

          goto LABEL_24;
        }
      }
      goto LABEL_23;
    }
    uint64_t v63 = v26;
    sub_247368D54((uint64_t)v12, (uint64_t)v31);
    if (v32)
    {
      uint64_t v40 = AccountSuggestion.dictionaryRepresentation()();
      sub_2473697CC(v32);
      swift_bridgeObjectRelease();
      id v41 = objc_allocWithZone(NSDictionary);
      uint64_t v42 = (void *)sub_24737CF90();
      swift_bridgeObjectRelease();
      id v43 = objc_msgSend(v41, sel_initWithDictionary_, v42);

      sub_2473697CC(v40);
      swift_bridgeObjectRelease();
      uint64_t v44 = (void *)sub_24737CF90();
      swift_bridgeObjectRelease();
      LOBYTE(v41) = objc_msgSend(v43, sel_isEqualToDictionary_, v44);

      if (v41) {
        goto LABEL_22;
      }
      uint64_t v45 = *v31;
      uint64_t v46 = v31[1];
      uint64_t v47 = v57;
      sub_247368BAC((uint64_t)v31, v57);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v47, 0, 1, v61);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_247367604(v47, v45, v46);
      swift_endAccess();
      uint64_t v48 = *(void **)(v24 + v56);
      if (!v48) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v49 = *v31;
      uint64_t v50 = v31[1];
      uint64_t v51 = v57;
      sub_247368BAC((uint64_t)v31, v57);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v51, 0, 1, v33);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_247367604(v51, v49, v50);
      swift_endAccess();
      uint64_t v48 = *(void **)(v24 + v56);
      if (!v48)
      {
LABEL_22:
        sub_24736F48C((uint64_t)v31);
LABEL_23:
        swift_bridgeObjectRelease();
LABEL_24:
        if ((v58 & 1) == 0) {
          return;
        }
        goto LABEL_25;
      }
    }
    id v52 = v48;
    AccountSuggestion.dictionaryRepresentation()();
    os_log_type_t v53 = (void *)sub_24737CF90();
    swift_bridgeObjectRelease();
    BOOL v54 = (void *)sub_24737CFD0();
    swift_bridgeObjectRelease();
    objc_msgSend(v52, sel_setDictionary_forKey_, v53, v54);

    sub_24736F48C((uint64_t)v31);
    goto LABEL_24;
  }
LABEL_25:
  sub_247367AD4();
}

uint64_t sub_2473697CC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249068);
    uint64_t v2 = sub_24737D230();
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
    sub_24736F860(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_247374C74(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_247374C74(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_247374C74(v36, v37);
    sub_247374C74(v37, &v33);
    uint64_t result = sub_24737D180();
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
    uint64_t result = (uint64_t)sub_247374C74(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_247374C84();
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

uint64_t sub_247369B94(uint64_t a1, int a2)
{
  int v20 = a2;
  uint64_t v4 = sub_24737CEF0();
  uint64_t v22 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = sub_24737CF20();
  uint64_t v7 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  unint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for AccountSuggestion();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  int64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  sub_247368BAC(a1, (uint64_t)&v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v2;
  sub_247368D54((uint64_t)&v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)], v15 + v14);
  *(unsigned char *)(v15 + v14 + v12) = v20;
  aBlock[4] = sub_24736A130;
  void aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = &block_descriptor_32;
  int64_t v16 = _Block_copy(aBlock);
  id v17 = v13;
  swift_retain();
  sub_24737CF00();
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  MEMORY[0x24C552000](0, v9, v6, v16);
  _Block_release(v16);

  (*(void (**)(unsigned char *, uint64_t))(v22 + 8))(v6, v4);
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v21);
  return swift_release();
}

uint64_t sub_247369EFC(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AccountSuggestion();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_247369004((uint64_t)v7, *a2, a2[1], 1, a3);
  return sub_247374C8C((uint64_t)v7, &qword_26B12A518);
}

uint64_t sub_247369FE8()
{
  uint64_t v1 = (int *)(type metadata accessor for AccountSuggestion() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  uint64_t v5 = *(void *)(*(void *)v1 + 64) + v3 + 1;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[10];
  uint64_t v7 = sub_24737CDE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_24736A130()
{
  uint64_t v1 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + v2 + *(void *)(v1 + 64));
  return sub_247369EFC(v3, (uint64_t *)(v0 + v2), v4);
}

uint64_t sub_24736A1B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24737CE50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_24737CE30();
  os_log_type_t v8 = sub_24737D0B0();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_24735E000, v7, v8, "Deduplicating all", v9, 2u);
    MEMORY[0x24C5526D0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_24736ACC0;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_24737522C;
  void aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362730;
  aBlock[3] = &block_descriptor_39;
  uint64_t v12 = _Block_copy(aBlock);
  int64_t v13 = v10;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v13, v12);

  _Block_release(v12);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v12) {
    __break(1u);
  }
  return result;
}

uint64_t sub_24736A47C(uint64_t a1)
{
  uint64_t v2 = sub_24737CE50();
  uint64_t v79 = *(void *)(v2 - 8);
  uint64_t v80 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v78 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AccountSuggestion();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v82 = (uint64_t)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v77 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v87 = (uint64_t)&v77 - v11;
  v91 = (void *)MEMORY[0x263F8EE80];
  uint64_t v81 = a1;
  uint64_t v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
  swift_beginAccess();
  uint64_t v13 = *v12;
  uint64_t v14 = *(void *)(*v12 + 64);
  uint64_t v83 = *v12 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  int64_t v84 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v88 = v13;
  swift_bridgeObjectRetain();
  int64_t v18 = 0;
  long long v85 = xmmword_24737D8E0;
  uint64_t v86 = v5;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v21 = v20 | (v18 << 6);
      goto LABEL_25;
    }
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_74;
    }
    if (v22 >= v84) {
      break;
    }
    unint64_t v23 = *(void *)(v83 + 8 * v22);
    ++v18;
    if (!v23)
    {
      int64_t v18 = v22 + 1;
      if (v22 + 1 >= v84) {
        break;
      }
      unint64_t v23 = *(void *)(v83 + 8 * v18);
      if (!v23)
      {
        int64_t v18 = v22 + 2;
        if (v22 + 2 >= v84) {
          break;
        }
        unint64_t v23 = *(void *)(v83 + 8 * v18);
        if (!v23)
        {
          int64_t v18 = v22 + 3;
          if (v22 + 3 >= v84) {
            break;
          }
          unint64_t v23 = *(void *)(v83 + 8 * v18);
          if (!v23)
          {
            int64_t v24 = v22 + 4;
            if (v24 >= v84) {
              break;
            }
            unint64_t v23 = *(void *)(v83 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_78;
                }
                if (v18 >= v84) {
                  goto LABEL_45;
                }
                unint64_t v23 = *(void *)(v83 + 8 * v18);
                ++v24;
                if (v23) {
                  goto LABEL_24;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
      }
    }
LABEL_24:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
LABEL_25:
    uint64_t v25 = v87;
    uint64_t v26 = *(void *)(v5 + 72);
    sub_247368BAC(*(void *)(v88 + 56) + v26 * v21, v87);
    sub_247368D54(v25, (uint64_t)v10);
    uint64_t v27 = *((void *)v10 + 3);
    uint64_t v89 = (void *)*((void *)v10 + 2);
    uint64_t v90 = v27;
    swift_bridgeObjectRetain();
    sub_24737D030();
    swift_bridgeObjectRetain();
    sub_24737D030();
    swift_bridgeObjectRelease();
    uint64_t v29 = (uint64_t)v89;
    uint64_t v28 = v90;
    uint64_t v30 = (uint64_t)v91;
    if (!v91[2] || (sub_247378620((uint64_t)v89, v90), (v31 & 1) == 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A670);
      unint64_t v39 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v85;
      sub_247368BAC((uint64_t)v10, v40 + v39);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v89 = (void *)v30;
      unint64_t v43 = sub_247378620(v29, v28);
      uint64_t v44 = *(void *)(v30 + 16);
      BOOL v45 = (v42 & 1) == 0;
      uint64_t v46 = v44 + v45;
      if (!__OFADD__(v44, v45))
      {
        char v47 = v42;
        if (*(void *)(v30 + 24) < v46)
        {
          sub_2473796CC(v46, isUniquelyReferenced_nonNull_native);
          unint64_t v48 = sub_247378620(v29, v28);
          if ((v47 & 1) != (v49 & 1))
          {
            uint64_t result = sub_24737D2B0();
            __break(1u);
            return result;
          }
          unint64_t v43 = v48;
          uint64_t v50 = v89;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
LABEL_4:
          uint64_t v19 = v50[7];
          swift_bridgeObjectRelease();
          *(void *)(v19 + 8 * v43) = v40;
LABEL_5:
          v91 = v50;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v5 = v86;
          goto LABEL_6;
        }
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v50 = v89;
          if (v42) {
            goto LABEL_4;
          }
        }
        else
        {
          sub_24737AD18();
          uint64_t v50 = v89;
          if (v47) {
            goto LABEL_4;
          }
        }
LABEL_41:
        v50[(v43 >> 6) + 8] |= 1 << v43;
        uint64_t v51 = (uint64_t *)(v50[6] + 16 * v43);
        *uint64_t v51 = v29;
        v51[1] = v28;
        *(void *)(v50[7] + 8 * v43) = v40;
        uint64_t v52 = v50[2];
        BOOL v53 = __OFADD__(v52, 1);
        uint64_t v54 = v52 + 1;
        if (v53) {
          goto LABEL_76;
        }
        v50[2] = v54;
        swift_bridgeObjectRetain();
        goto LABEL_5;
      }
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      swift_once();
      goto LABEL_69;
    }
    long long v33 = sub_24736ACD8(&v89, v29, v28);
    if (*v32)
    {
      long long v34 = v32;
      sub_247368BAC((uint64_t)v10, v82);
      unint64_t v35 = *v34;
      char v36 = swift_isUniquelyReferenced_nonNull_native();
      *long long v34 = v35;
      if ((v36 & 1) == 0)
      {
        unint64_t v35 = sub_24736F5F8(0, *(void *)(v35 + 16) + 1, 1, v35);
        *long long v34 = v35;
      }
      unint64_t v38 = *(void *)(v35 + 16);
      unint64_t v37 = *(void *)(v35 + 24);
      if (v38 >= v37 >> 1)
      {
        unint64_t v35 = sub_24736F5F8(v37 > 1, v38 + 1, 1, v35);
        *long long v34 = v35;
      }
      *(void *)(v35 + 16) = v38 + 1;
      uint64_t v5 = v86;
      sub_247368D54(v82, v35 + ((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80)) + v38 * v26);
    }
    ((void (*)(void **, void))v33)(&v89, 0);
    swift_bridgeObjectRelease();
LABEL_6:
    sub_24736F48C((uint64_t)v10);
  }
LABEL_45:
  swift_release();
  uint64_t v55 = v91;
  uint64_t v56 = v91 + 8;
  uint64_t v57 = 1 << *((unsigned char *)v91 + 32);
  uint64_t v58 = -1;
  if (v57 < 64) {
    uint64_t v58 = ~(-1 << v57);
  }
  unint64_t v59 = v58 & v91[8];
  int64_t v60 = (unint64_t)(v57 + 63) >> 6;
  swift_bridgeObjectRetain();
  char v61 = 0;
  int64_t v62 = 0;
  if (!v59) {
    goto LABEL_51;
  }
LABEL_48:
  unint64_t v63 = __clz(__rbit64(v59));
  v59 &= v59 - 1;
  for (unint64_t i = v63 | (v62 << 6); ; unint64_t i = __clz(__rbit64(v66)) + (v62 << 6))
  {
    if (*(void *)(*(void *)(v55[7] + 8 * i) + 16) > 1uLL)
    {
      int64_t v68 = (void *)swift_bridgeObjectRetain();
      char v61 = 1;
      sub_24736ADAC(v68, 0, 0, 0, 1);
      swift_bridgeObjectRelease();
      if (v59) {
        goto LABEL_48;
      }
    }
    else if (v59)
    {
      goto LABEL_48;
    }
LABEL_51:
    int64_t v65 = v62 + 1;
    if (__OFADD__(v62, 1)) {
      goto LABEL_75;
    }
    if (v65 >= v60) {
      break;
    }
    unint64_t v66 = v56[v65];
    ++v62;
    if (!v66)
    {
      int64_t v62 = v65 + 1;
      if (v65 + 1 >= v60) {
        break;
      }
      unint64_t v66 = v56[v62];
      if (!v66)
      {
        int64_t v62 = v65 + 2;
        if (v65 + 2 >= v60) {
          break;
        }
        unint64_t v66 = v56[v62];
        if (!v66)
        {
          int64_t v67 = v65 + 3;
          if (v67 >= v60) {
            break;
          }
          unint64_t v66 = v56[v67];
          if (!v66)
          {
            while (1)
            {
              int64_t v62 = v67 + 1;
              if (__OFADD__(v67, 1)) {
                goto LABEL_77;
              }
              if (v62 >= v60) {
                goto LABEL_67;
              }
              unint64_t v66 = v56[v62];
              ++v67;
              if (v66) {
                goto LABEL_64;
              }
            }
          }
          int64_t v62 = v67;
        }
      }
    }
LABEL_64:
    unint64_t v59 = (v66 - 1) & v66;
  }
LABEL_67:
  swift_release();
  if ((v61 & 1) == 0) {
    goto LABEL_72;
  }
  if (qword_26B12A540 != -1) {
    goto LABEL_79;
  }
LABEL_69:
  uint64_t v69 = v80;
  uint64_t v70 = __swift_project_value_buffer(v80, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  uint64_t v72 = v78;
  uint64_t v71 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v70, v69);
  uint64_t v73 = sub_24737CE30();
  os_log_type_t v74 = sub_24737D0B0();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v75 = 0;
    _os_log_impl(&dword_24735E000, v73, v74, "Duplicates found and removed", v75, 2u);
    MEMORY[0x24C5526D0](v75, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v69);
LABEL_72:
  sub_247367AD4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24736ACC0()
{
  return sub_24736A47C(v0);
}

uint64_t sub_24736ACC8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void (*sub_24736ACD8(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_247373A10(v6, a2, a3);
  return sub_24736AD58;
}

void sub_24736AD58(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_24736ADAC(void *a1, int a2, int a3, int a4, int a5)
{
  int v49 = a2;
  int v50 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v56 = (uint64_t)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v52 = (uint64_t)&v47 - v12;
  uint64_t v13 = type metadata accessor for AccountSuggestion();
  uint64_t v53 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  int64_t v18 = (uint64_t *)((char *)&v47 - v17);
  uint64_t v19 = sub_24737CE50();
  uint64_t v54 = *(void (***)(char *, uint64_t, uint64_t))(v19 - 8);
  uint64_t result = MEMORY[0x270FA5388](v19);
  int64_t v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v23 = a1[2];
  if (v23 >= 2)
  {
    uint64_t v51 = a1;
    int v47 = a3;
    int v48 = a4;
    uint64_t v55 = v5;
    if (qword_26B12A540 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v19, (uint64_t)qword_26B12A4E8);
    swift_beginAccess();
    v54[2](v22, v24, v19);
    uint64_t v25 = sub_24737CE30();
    os_log_type_t v26 = sub_24737D0B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_24735E000, v25, v26, "We have duplicates, lets merge everything together", v27, 2u);
      MEMORY[0x24C5526D0](v27, -1, -1);
    }

    ((void (*)(char *, uint64_t))v54[1])(v22, v19);
    uint64_t v28 = v51;
    uint64_t v57 = v51;
    swift_bridgeObjectRetain();
    sub_2473706A4(&v57, sub_2473713CC);
    uint64_t v29 = v53;
    if (v57[2])
    {
      uint64_t v30 = v52;
      sub_247368BAC((uint64_t)v57 + ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80)), v52);
      char v31 = *(void (***)(char *, uint64_t, uint64_t))(v29 + 56);
      uint64_t v32 = v30;
      uint64_t v33 = 0;
    }
    else
    {
      char v31 = *(void (***)(char *, uint64_t, uint64_t))(v53 + 56);
      uint64_t v30 = v52;
      uint64_t v32 = v52;
      uint64_t v33 = 1;
    }
    uint64_t v54 = v31;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v31)(v32, v33, 1, v13);
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v30, 1, v13) == 1)
    {
      return sub_247374C8C(v30, &qword_26B12A518);
    }
    else
    {
      sub_247368D54(v30, (uint64_t)v18);
      if (v49)
      {
        uint64_t v34 = sub_2473617E4();
        uint64_t v36 = v35;
        swift_bridgeObjectRetain();
        sub_24736F8BC((uint64_t *)&v57, v34, v36);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v37 = (uint64_t)v28 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
      uint64_t v38 = *(void *)(v29 + 72);
      uint64_t v53 = v29 + 56;
      swift_bridgeObjectRetain();
      LODWORD(v52) = v50 & 1;
      uint64_t v39 = v56;
      do
      {
        sub_247368BAC(v37, (uint64_t)v16);
        uint64_t v40 = swift_bridgeObjectRetain();
        sub_24736B37C(v40);
        uint64_t v41 = *v16;
        uint64_t v42 = v16[1];
        BOOL v43 = *v16 == *v18 && v42 == v18[1];
        if (!v43 && (sub_24737D270() & 1) == 0)
        {
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v54)(v39, 1, 1, v13);
          sub_247369004(v39, v41, v42, 0, v52);
          sub_247374C8C(v39, &qword_26B12A518);
        }
        sub_24736F48C((uint64_t)v16);
        v37 += v38;
        --v23;
      }
      while (v23);
      swift_bridgeObjectRelease();
      if (v47)
      {
        uint64_t v44 = sub_2473617E4();
        sub_24737034C(v44, v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v46 = v56;
      sub_247368BAC((uint64_t)v18, v56);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v54)(v46, 0, 1, v13);
      sub_247369004(v46, *v18, v18[1], 0, 0);
      sub_247374C8C(v46, &qword_26B12A518);
      if (v48) {
        sub_247367AD4();
      }
      return sub_24736F48C((uint64_t)v18);
    }
  }
  return result;
}

uint64_t sub_24736B37C(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_24736F8BC(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_24736B4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v80 = a1;
  uint64_t v75 = sub_24737CE50();
  uint64_t v76 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v79 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24737CDE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v73 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A500);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v71 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  int64_t v15 = (char *)&v71 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v71 - v16;
  uint64_t v72 = v18;
  if (a2)
  {
    uint64_t v19 = a2;
  }
  else
  {
    uint64_t v80 = sub_2473617E4();
    uint64_t v19 = v20;
  }
  uint64_t v77 = v2;
  uint64_t v21 = (uint64_t *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
  swift_beginAccess();
  uint64_t v22 = *v21;
  if (*(void *)(*v21 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v23 = sub_247378620(v80, v19);
    if (v24)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v17, *(void *)(v22 + 56) + *(void *)(v6 + 72) * v23, v5);
      uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      os_log_type_t v26 = v17;
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      os_log_type_t v26 = v17;
      uint64_t v27 = 1;
    }
    uint64_t v78 = v25;
    v25(v26, v27, 1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v78 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v78(v17, 1, 1, v5);
    swift_bridgeObjectRetain();
  }
  os_log_type_t v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  int v28 = v74(v17, 1, v5);
  sub_247374C8C((uint64_t)v17, &qword_26B12A500);
  uint64_t v29 = v75;
  if (v28 != 1)
  {
    uint64_t v30 = *v21;
    if (*(void *)(*v21 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v31 = sub_247378620(v80, v19);
      if (v32)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v15, *(void *)(v30 + 56) + *(void *)(v6 + 72) * v31, v5);
        uint64_t v33 = v15;
        uint64_t v34 = 0;
      }
      else
      {
        uint64_t v33 = v15;
        uint64_t v34 = 1;
      }
      v78(v33, v34, 1, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v78(v15, 1, 1, v5);
    }
    if (v74(v15, 1, v5))
    {
      sub_247374C8C((uint64_t)v15, &qword_26B12A500);
      double v35 = 0.0;
    }
    else
    {
      uint64_t v36 = v73;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v73, v15, v5);
      sub_247374C8C((uint64_t)v15, &qword_26B12A500);
      sub_24737CDA0();
      double v35 = v37;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v36, v5);
    }
    uint64_t v38 = *(void **)(v77 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults);
    if (v38
      && (id v39 = v38,
          uint64_t v40 = (void *)sub_24737CFD0(),
          objc_msgSend(v39, sel_doubleForKey_, v40),
          double v42 = v41,
          v39,
          v40,
          v42 > 0.0))
    {
      if (v42 >= -v35)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    else if (v35 >= -604800.0)
    {
      goto LABEL_23;
    }
  }
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v44 = __swift_project_value_buffer(v29, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  uint64_t v45 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v79, v44, v29);
  uint64_t v46 = sub_24737CE30();
  os_log_type_t v47 = sub_24737D0B0();
  if (os_log_type_enabled(v46, v47))
  {
    int v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v48 = 0;
    _os_log_impl(&dword_24735E000, v46, v47, "Updating device with date now", v48, 2u);
    int v49 = v48;
    uint64_t v45 = v76;
    MEMORY[0x24C5526D0](v49, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v79, v29);
  swift_bridgeObjectRetain();
  sub_24737CDD0();
  v78(v12, 0, 1, v5);
  swift_beginAccess();
  sub_2473677C0((uint64_t)v12, v80, v19);
  swift_endAccess();
  uint64_t v50 = v77;
  uint64_t v51 = (unsigned char *)(v77 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  swift_beginAccess();
  if ((*v51 & 1) == 0)
  {
    uint64_t v52 = *(void **)(v50 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
    if (v52)
    {
      uint64_t v53 = *v21;
      if (*(void *)(*v21 + 16))
      {
        swift_bridgeObjectRetain();
        id v54 = v52;
        swift_bridgeObjectRetain();
        unint64_t v55 = sub_247378620(v80, v19);
        uint64_t v56 = v72;
        if (v57)
        {
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))(v72, *(void *)(v53 + 56) + *(void *)(v6 + 72) * v55, v5);
          uint64_t v58 = v56;
          uint64_t v59 = 0;
        }
        else
        {
          uint64_t v58 = v72;
          uint64_t v59 = 1;
        }
        v78((char *)v58, v59, 1, v5);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v56 = v72;
        v78((char *)v72, 1, 1, v5);
        id v60 = v52;
      }
      if (v74((char *)v56, 1, v5))
      {
        sub_247374C8C(v56, &qword_26B12A500);
        uint64_t v61 = MEMORY[0x263F8D6C8];
        uint64_t v84 = MEMORY[0x263F8D6C8];
        *(void *)&long long v83 = 0;
      }
      else
      {
        int64_t v62 = v73;
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v73, v56, v5);
        sub_247374C8C(v56, &qword_26B12A500);
        sub_24737CDC0();
        uint64_t v64 = v63;
        (*(void (**)(char *, uint64_t))(v6 + 8))(v62, v5);
        uint64_t v82 = MEMORY[0x263F8D538];
        *(void *)&long long v81 = v64;
        sub_247374C74(&v81, &v83);
        uint64_t v61 = v84;
        if (!v84)
        {
          uint64_t v69 = 0;
          goto LABEL_42;
        }
      }
      int64_t v65 = __swift_project_boxed_opaque_existential_0(&v83, v61);
      uint64_t v66 = *(void *)(v61 - 8);
      MEMORY[0x270FA5388](v65);
      int64_t v68 = (char *)&v71 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v66 + 16))(v68);
      uint64_t v69 = sub_24737D260();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v68, v61);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v83);
LABEL_42:
      if (qword_26B12A530 != -1) {
        swift_once();
      }
      long long v83 = xmmword_26B12A6A8;
      swift_bridgeObjectRetain();
      sub_24737D030();
      swift_bridgeObjectRelease();
      uint64_t v70 = (void *)sub_24737CFD0();
      swift_bridgeObjectRelease();
      objc_msgSend(v52, sel_setObject_forKey_, v69, v70);

      swift_unknownObjectRelease();
      return 1;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

void sub_24736BF40(void *a1)
{
  uint64_t v2 = sub_24737CE50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v72 = (char *)&v65 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v65 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v65 - v15;
  uint64_t v17 = type metadata accessor for AccountSuggestion();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v71 = (uint64_t *)((char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  uint64_t v73 = (uint64_t *)((char *)&v65 - v21);
  sub_2473684CC(a1);
  if ((v22 & 1) == 0) {
    return;
  }
  uint64_t v67 = v3;
  uint64_t v68 = v2;
  id v23 = objc_msgSend(a1, sel_accountType);
  if (!v23)
  {
    __break(1u);
    goto LABEL_28;
  }
  char v24 = v23;
  uint64_t v70 = v17;
  id v25 = objc_msgSend(v23, sel_identifier);

  if (!v25)
  {
LABEL_28:
    __break(1u);
    return;
  }
  uint64_t v69 = v6;
  uint64_t v66 = v14;
  uint64_t v26 = sub_24737CFE0();
  uint64_t v28 = v27;

  id v29 = objc_msgSend(a1, sel_username);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = sub_24737CFE0();
    uint64_t v32 = v18;
    uint64_t v34 = v33;

    swift_beginAccess();
    uint64_t v35 = swift_bridgeObjectRetain();
    uint64_t v36 = (void *)sub_247374888(v35, v26, v28, v31, v34);
    swift_bridgeObjectRelease();
    uint64_t v18 = v32;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v37 = v36[2];
  if (v37 >= 2)
  {
    sub_24736ADAC(v36, 1, 0, 1, 0);
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v65 = v18;
  if (v37)
  {
    sub_247368BAC((uint64_t)v36 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), (uint64_t)v16);
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    id v39 = v16;
    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    id v39 = v16;
    uint64_t v40 = 1;
  }
  uint64_t v41 = v70;
  v38(v39, v40, 1, v70);
  double v42 = v69;
  swift_bridgeObjectRelease();
  BOOL v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v43(v16, 1, v41) == 1)
  {
    sub_247374C8C((uint64_t)v16, &qword_26B12A518);
    id v44 = a1;
    uint64_t v45 = sub_2473617E4();
    v75[0] = 0;
    AccountSuggestion.init(with:computerID:source:)(v44, v45, v46, v75, (uint64_t)v11);
    if (v43(v11, 1, v41) == 1)
    {
      sub_247374C8C((uint64_t)v11, &qword_26B12A518);
      return;
    }
    os_log_type_t v47 = v71;
    sub_247368D54((uint64_t)v11, (uint64_t)v71);
    if (qword_26B12A540 != -1) {
      swift_once();
    }
    uint64_t v58 = v68;
    uint64_t v59 = __swift_project_value_buffer(v68, (uint64_t)qword_26B12A4E8);
    swift_beginAccess();
    uint64_t v60 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v42, v59, v58);
    uint64_t v61 = sub_24737CE30();
    os_log_type_t v62 = sub_24737D0B0();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v63 = 0;
      _os_log_impl(&dword_24735E000, v61, v62, "Existing suggestion not found, creating a new one", v63, 2u);
      MEMORY[0x24C5526D0](v63, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v60 + 8))(v42, v58);
  }
  else
  {
    os_log_type_t v47 = v73;
    sub_247368D54((uint64_t)v16, (uint64_t)v73);
    if (qword_26B12A540 != -1) {
      swift_once();
    }
    uint64_t v48 = v68;
    uint64_t v49 = __swift_project_value_buffer(v68, (uint64_t)qword_26B12A4E8);
    swift_beginAccess();
    uint64_t v50 = v67;
    uint64_t v51 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v72, v49, v48);
    uint64_t v52 = sub_24737CE30();
    os_log_type_t v53 = sub_24737D0B0();
    if (os_log_type_enabled(v52, v53))
    {
      id v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v54 = 0;
      _os_log_impl(&dword_24735E000, v52, v53, "Existing suggestion found, adding the computer", v54, 2u);
      MEMORY[0x24C5526D0](v54, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v48);
    uint64_t v55 = sub_2473617E4();
    uint64_t v57 = v56;
    swift_bridgeObjectRetain();
    sub_24736F8BC(&v74, v55, v57);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v64 = (uint64_t)v66;
  sub_247368BAC((uint64_t)v47, (uint64_t)v66);
  v38((char *)v64, 0, 1, v41);
  sub_247369004(v64, *v47, v47[1], 1, 0);
  sub_247374C8C(v64, &qword_26B12A518);
  sub_24736F48C((uint64_t)v47);
}

void sub_24736C680(id a1)
{
  uint64_t v133 = 0;
  uint64_t v3 = sub_24737CE50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v133 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v137 = (uint64_t *)((char *)&v133 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t)&v133 - v10;
  uint64_t v12 = type metadata accessor for AccountSuggestion();
  uint64_t v145 = *(void *)(v12 - 8);
  uint64_t v146 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v144 = (uint64_t)&v133 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (uint64_t *)((char *)&v133 - v18);
  uint64_t v138 = v1;
  unint64_t v20 = 0x265210000uLL;
  if (sub_247368794(a1))
  {
    id v21 = objc_msgSend(a1, sel_accountType);
    if (!v21) {
      goto LABEL_127;
    }
    char v22 = v21;
    id v23 = objc_msgSend(v21, sel_identifier);

    if (v23)
    {
      uint64_t v141 = v3;
      uint64_t v142 = v19;
      uint64_t v24 = sub_24737CFE0();
      uint64_t v26 = v25;

      id v143 = a1;
      id v27 = objc_msgSend(a1, sel_username);
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = sub_24737CFE0();
        uint64_t v31 = v30;

        swift_beginAccess();
        uint64_t v32 = swift_bridgeObjectRetain();
        uint64_t v33 = v24;
        uint64_t v34 = v29;
        unint64_t v20 = 0x265210000uLL;
        uint64_t v35 = v133;
        uint64_t v3 = sub_247374888(v32, v33, v26, v34, v31);
        uint64_t v133 = v35;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = MEMORY[0x263F8EE78];
      }
      if (*(void *)(v3 + 16) != 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_50;
      }
      uint64_t v36 = v145;
      sub_247368BAC(v3 + ((*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80)), v11);
      unint64_t v37 = *(void **)(v36 + 56);
      uint64_t v38 = v146;
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v37)(v11, 0, 1, v146);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v11, 1, v38) == 1)
      {
        sub_247374C8C(v11, &qword_26B12A518);
LABEL_50:
        a1 = v143;
        goto LABEL_51;
      }
      uint64_t v140 = v37;
      uint64_t v3 = 0x265210000uLL;
      sub_247368D54(v11, (uint64_t)v142);
      unint64_t v20 = *(int *)(v38 + 44);
      uint64_t v39 = swift_bridgeObjectRetain();
      sub_2473697CC(v39);
      swift_bridgeObjectRelease();
      id v40 = objc_allocWithZone(NSDictionary);
      uint64_t v41 = sub_24737CF90();
      swift_bridgeObjectRelease();
      id v42 = objc_msgSend(v40, sel_initWithDictionary_, v41);

      id v43 = objc_msgSend(v143, sel_accountProperties);
      LOBYTE(v41) = objc_msgSend(v42, sel_isEqual_, v43);

      LOBYTE(v11) = v41;
      if ((v41 & 1) == 0)
      {
        if (qword_26B12A540 != -1) {
LABEL_124:
        }
          swift_once();
        uint64_t v44 = v141;
        uint64_t v45 = __swift_project_value_buffer(v141, (uint64_t)qword_26B12A4E8);
        swift_beginAccess();
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 16))(v6, v45, v44);
        uint64_t v46 = sub_24737CE30();
        os_log_type_t v47 = sub_24737D0B0();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v48 = 0;
          _os_log_impl(&dword_24735E000, v46, v47, "Existing suggestion found, account properties dictionary differs, saving off local account properties", v48, 2u);
          MEMORY[0x24C5526D0](v48, -1, -1);
        }

        (*(void (**)(uint64_t *, uint64_t))(v4 + 8))(v6, v141);
        id v49 = objc_msgSend(v143, sel_accountProperties);
        if (!v49 || (uint64_t v50 = v49, *(void *)&v150 = 0, sub_24737CFA0(), v50, (v51 = v150) == 0))
        {
          unint64_t v51 = sub_247360FA8(MEMORY[0x263F8EE78]);
          swift_bridgeObjectRelease();
        }
        uint64_t v52 = (uint64_t)v142;
        swift_bridgeObjectRelease();
        *(void *)(v52 + v20) = v51;
      }
      unint64_t v20 = v3;
      id v53 = objc_msgSend(v143, (SEL)(v3 + 1193), v133);
      if (v53)
      {
        id v54 = v53;
        id v55 = objc_msgSend(v53, sel_identifier);

        if (v55)
        {
          uint64_t v56 = sub_24737CFE0();
          uint64_t v58 = v57;

          uint64_t v59 = sub_24737CFE0();
          if (v58)
          {
            if (v56 == v59 && v58 == v60) {
              goto LABEL_33;
            }
            char v61 = sub_24737D270();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v61) {
              goto LABEL_34;
            }
LABEL_28:
            id v62 = [v143 (SEL)(v3 + 1193)];
            if (v62)
            {
              uint64_t v63 = v62;
              id v64 = objc_msgSend(v62, sel_identifier);

              if (v64)
              {
                uint64_t v65 = sub_24737CFE0();
                uint64_t v67 = v66;

                uint64_t v68 = sub_24737CFE0();
                if (v67)
                {
                  if (v65 != v68 || v67 != v69)
                  {
                    char v81 = sub_24737D270();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if ((v81 & 1) == 0) {
                      goto LABEL_47;
                    }
LABEL_34:
                    *(void *)&v147[0] = sub_24737CFE0();
                    *((void *)&v147[0] + 1) = v70;
                    id v71 = objc_msgSend(v143, sel_objectForKeyedSubscript_, sub_24737D290());
                    swift_unknownObjectRelease();
                    if (v71)
                    {
                      sub_24737D150();
                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      memset(v147, 0, sizeof(v147));
                    }
                    sub_247374ECC((uint64_t)v147, (uint64_t)&v150, &qword_269249060);
                    if (!*((void *)&v151 + 1))
                    {
                      sub_247374C8C((uint64_t)&v150, &qword_269249060);
                      goto LABEL_47;
                    }
                    if ((swift_dynamicCast() & 1) == 0) {
                      goto LABEL_47;
                    }
                    id v72 = objc_msgSend(self, sel_defaultStore);
                    if (v72)
                    {
                      uint64_t v73 = v72;
                      uint64_t v74 = (void *)sub_24737CFD0();
                      swift_bridgeObjectRelease();
                      id v75 = objc_msgSend(v73, sel_accountWithIdentifier_, v74);

                      if (v75)
                      {
                        uint64_t v141 = *(int *)(v146 + 48);
                        uint64_t v76 = swift_bridgeObjectRetain();
                        sub_2473697CC(v76);
                        swift_bridgeObjectRelease();
                        id v77 = objc_allocWithZone(NSDictionary);
                        uint64_t v78 = sub_24737CF90();
                        swift_bridgeObjectRelease();
                        id v79 = objc_msgSend(v77, sel_initWithDictionary_, v78);

                        id v80 = objc_msgSend(v75, sel_accountProperties);
                        LOBYTE(v78) = objc_msgSend(v79, sel_isEqual_, v80);

                        if ((v78 & 1) == 0)
                        {
                          id v130 = objc_msgSend(v75, sel_accountProperties);
                          if (!v130
                            || (uint64_t v131 = v130,
                                *(void *)&long long v150 = 0,
                                sub_24737CFA0(),
                                v131,
                                (unint64_t v132 = v150) == 0))
                          {
                            unint64_t v132 = sub_247360FA8(MEMORY[0x263F8EE78]);
                            swift_bridgeObjectRelease();
                          }
                          swift_bridgeObjectRelease();

                          uint64_t v6 = v142;
                          *(uint64_t *)((char *)v142 + v141) = v132;
                          goto LABEL_48;
                        }

                        unint64_t v20 = v3;
                      }
LABEL_47:
                      uint64_t v6 = v142;
                      if (v11)
                      {
LABEL_49:
                        sub_24736F48C((uint64_t)v6);
                        goto LABEL_50;
                      }
LABEL_48:
                      uint64_t v82 = (uint64_t)v137;
                      sub_247368BAC((uint64_t)v6, (uint64_t)v137);
                      ((void (*)(uint64_t, void, uint64_t, uint64_t))v140)(v82, 0, 1, v146);
                      uint64_t v83 = *v6;
                      uint64_t v84 = v6[1];
                      swift_bridgeObjectRetain();
                      sub_247369004(v82, v83, v84, 1, 0);
                      swift_bridgeObjectRelease();
                      uint64_t v85 = v82;
                      unint64_t v20 = v3;
                      sub_247374C8C(v85, &qword_26B12A518);
                      goto LABEL_49;
                    }
LABEL_131:
                    __break(1u);
                    return;
                  }
LABEL_33:
                  swift_bridgeObjectRelease_n();
                  goto LABEL_34;
                }
              }
              else
              {
                sub_24737CFE0();
              }
              swift_bridgeObjectRelease();
              goto LABEL_47;
            }
LABEL_130:
            __break(1u);
            goto LABEL_131;
          }
        }
        else
        {
          sub_24737CFE0();
        }
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
    }
    else
    {
LABEL_128:
      __break(1u);
    }
    __break(1u);
    goto LABEL_130;
  }
LABEL_51:
  uint64_t v11 = (uint64_t)a1;
  id v86 = objc_msgSend(a1, *(SEL *)(v20 + 3832), v133);
  if (!v86) {
    goto LABEL_126;
  }
  uint64_t v87 = v86;
  id v88 = objc_msgSend(v86, sel_identifier);

  if (!v88)
  {
    sub_24737CFE0();
    goto LABEL_58;
  }
  uint64_t v89 = sub_24737CFE0();
  uint64_t v91 = v90;

  uint64_t v92 = sub_24737CFE0();
  if (!v91)
  {
LABEL_58:
    swift_bridgeObjectRelease();
    return;
  }
  if (v89 == v92 && v91 == v93)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v94 = sub_24737D270();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v94 & 1) == 0) {
      return;
    }
  }
  unint64_t v95 = (uint64_t *)(v138 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
  swift_beginAccess();
  uint64_t v96 = *v95;
  uint64_t v97 = *(void *)(v96 + 64);
  uint64_t v140 = (void *)(v96 + 64);
  uint64_t v98 = 1 << *(unsigned char *)(v96 + 32);
  uint64_t v99 = -1;
  if (v98 < 64) {
    uint64_t v99 = ~(-1 << v98);
  }
  unint64_t v100 = v99 & v97;
  uint64_t v141 = (unint64_t)(v98 + 63) >> 6;
  id v143 = (id)*MEMORY[0x263EFAF08];
  uint64_t v136 = *MEMORY[0x263EFAF78];
  uint64_t v142 = (uint64_t *)*MEMORY[0x263EFAE18];
  uint64_t v134 = (void (**)(uint64_t *, void, uint64_t, uint64_t))(v145 + 56);
  swift_bridgeObjectRetain();
  int v135 = 0;
  uint64_t v4 = 0;
  uint64_t v139 = MEMORY[0x263F8EE58] + 8;
  while (v100)
  {
    unint64_t v101 = __clz(__rbit64(v100));
    v100 &= v100 - 1;
    unint64_t v102 = v101 | (v4 << 6);
LABEL_81:
    uint64_t v106 = v144;
    sub_247368BAC(*(void *)(v96 + 56) + *(void *)(v145 + 72) * v102, v144);
    sub_247368D54(v106, (uint64_t)v15);
    uint64_t v3 = v15[2];
    uint64_t v107 = v15[3];
    if (v3 != sub_24737CFE0() || v107 != v108)
    {
      unint64_t v20 = sub_24737D270();
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_87;
      }
      uint64_t v109 = sub_24737CFE0();
      uint64_t v6 = v110;
      if (v3 != v109 || (uint64_t *)v107 != v110)
      {
        char v129 = sub_24737D270();
        swift_bridgeObjectRelease();
        if ((v129 & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_87;
      }
    }
    swift_bridgeObjectRelease();
LABEL_87:
    uint64_t v111 = sub_24737CFE0();
    uint64_t v113 = *(uint64_t *)((char *)v15 + *(int *)(v146 + 44));
    if (*(void *)(v113 + 16) && (unint64_t v114 = sub_247378620(v111, v112), (v115 & 1) != 0))
    {
      sub_24736F860(*(void *)(v113 + 56) + 32 * v114, (uint64_t)&v150);
    }
    else
    {
      long long v150 = 0u;
      long long v151 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v151 + 1))
    {
      int v116 = swift_dynamicCast();
      if (v116) {
        uint64_t v3 = v148;
      }
      else {
        uint64_t v3 = 0;
      }
      if (v116) {
        int v117 = v149;
      }
      else {
        int v117 = 0;
      }
    }
    else
    {
      sub_247374C8C((uint64_t)&v150, &qword_269249060);
      uint64_t v3 = 0;
      int v117 = 0;
    }
    id v118 = objc_msgSend((id)v11, sel_identifier);
    if (!v118)
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
      goto LABEL_128;
    }
    unint64_t v20 = (unint64_t)v118;
    uint64_t v119 = sub_24737CFE0();
    uint64_t v6 = v120;

    if (!v117)
    {
      swift_bridgeObjectRelease();
      goto LABEL_65;
    }
    if (v3 == v119 && v117 == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v20 = sub_24737D270();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_65;
      }
    }
    uint64_t v3 = *(int *)(v146 + 48);
    uint64_t v121 = swift_bridgeObjectRetain();
    sub_2473697CC(v121);
    swift_bridgeObjectRelease();
    id v122 = objc_allocWithZone(NSDictionary);
    uint64_t v123 = sub_24737CF90();
    swift_bridgeObjectRelease();
    unint64_t v20 = (unint64_t)objc_msgSend(v122, sel_initWithDictionary_, v123);

    uint64_t v6 = (uint64_t *)objc_msgSend((id)v11, sel_accountProperties);
    LOBYTE(v123) = objc_msgSend((id)v20, sel_isEqual_, v6);

    if ((v123 & 1) == 0)
    {
      id v124 = objc_msgSend((id)v11, sel_accountProperties);
      if (!v124 || (v125 = v124, *(void *)&long long v150 = 0, sub_24737CFA0(), v125, (v126 = v150) == 0))
      {
        unint64_t v126 = sub_247360FA8(MEMORY[0x263F8EE78]);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      *(uint64_t *)((char *)v15 + v3) = v126;
      uint64_t v6 = v137;
      sub_247368BAC((uint64_t)v15, (uint64_t)v137);
      Class v127 = *v134;
      int v135 = 1;
      v127(v6, 0, 1, v146);
      uint64_t v128 = *v15;
      unint64_t v20 = v15[1];
      swift_bridgeObjectRetain();
      sub_247369004((uint64_t)v6, v128, v20, 0, 0);
      swift_bridgeObjectRelease();
      sub_247374C8C((uint64_t)v6, &qword_26B12A518);
    }
LABEL_65:
    sub_24736F48C((uint64_t)v15);
  }
  if (__OFADD__(v4++, 1))
  {
    __break(1u);
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  if (v4 >= v141) {
    goto LABEL_116;
  }
  unint64_t v104 = v140[v4];
  if (v104)
  {
LABEL_80:
    unint64_t v100 = (v104 - 1) & v104;
    unint64_t v102 = __clz(__rbit64(v104)) + (v4 << 6);
    goto LABEL_81;
  }
  uint64_t v105 = v4 + 1;
  if (v4 + 1 >= v141) {
    goto LABEL_116;
  }
  unint64_t v104 = v140[v105];
  if (v104) {
    goto LABEL_79;
  }
  uint64_t v105 = v4 + 2;
  if (v4 + 2 >= v141) {
    goto LABEL_116;
  }
  unint64_t v104 = v140[v105];
  if (v104) {
    goto LABEL_79;
  }
  uint64_t v105 = v4 + 3;
  if (v4 + 3 >= v141) {
    goto LABEL_116;
  }
  unint64_t v104 = v140[v105];
  if (v104)
  {
LABEL_79:
    uint64_t v4 = v105;
    goto LABEL_80;
  }
  uint64_t v105 = v4 + 4;
  if (v4 + 4 < v141)
  {
    unint64_t v104 = v140[v105];
    if (!v104)
    {
      while (1)
      {
        uint64_t v4 = v105 + 1;
        if (__OFADD__(v105, 1)) {
          goto LABEL_123;
        }
        if (v4 >= v141) {
          goto LABEL_116;
        }
        unint64_t v104 = v140[v4];
        ++v105;
        if (v104) {
          goto LABEL_80;
        }
      }
    }
    goto LABEL_79;
  }
LABEL_116:
  swift_release();
  if (v135) {
    sub_247367AD4();
  }
}

uint64_t sub_24736D8B0(void *a1)
{
  return sub_24736DBA4(a1, (uint64_t)&unk_26FB82140, (uint64_t)sub_24736EADC, (uint64_t)&block_descriptor_45);
}

uint64_t sub_24736D8D8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_24737CE50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24736817C();
  sub_24736B4FC(0, 0);
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = a2;
  uint64_t v10 = sub_24737CE30();
  os_log_type_t v11 = sub_24737D0B0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v23 = a1;
    uint64_t v12 = swift_slowAlloc();
    id v21 = v7;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    uint64_t v24 = v9;
    uint64_t v15 = v9;
    uint64_t v22 = v5;
    uint64_t v16 = v4;
    uint64_t v17 = v15;
    sub_24737D120();
    *uint64_t v14 = v9;

    uint64_t v4 = v16;
    uint64_t v5 = v22;
    _os_log_impl(&dword_24735E000, v10, v11, "added: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249080);
    swift_arrayDestroy();
    MEMORY[0x24C5526D0](v14, -1, -1);
    uint64_t v18 = v13;
    uint64_t v7 = v21;
    MEMORY[0x24C5526D0](v18, -1, -1);
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24736BF40(v9);
  return sub_247364B64();
}

uint64_t sub_24736DB7C(void *a1)
{
  return sub_24736DBA4(a1, (uint64_t)&unk_26FB82190, (uint64_t)sub_24736EAE8, (uint64_t)&block_descriptor_51);
}

uint64_t sub_24736DBA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  uint64_t v6 = v4;
  uint64_t v8 = sub_24737CEF0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24737CF20();
  uint64_t v12 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v6;
  *(void *)(v16 + 24) = a1;
  aBlock[4] = a3;
  void aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = v22;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = v15;
  swift_retain();
  id v19 = a1;
  sub_24737CF00();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  MEMORY[0x24C552000](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v23);
  return swift_release();
}

void sub_24736DE5C(uint64_t a1, void *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A518);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v75 = (uint64_t)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v76 = (uint64_t)&v65 - v6;
  uint64_t v7 = type metadata accessor for AccountSuggestion();
  uint64_t v77 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_24737CE50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v69 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v74 = (char *)&v65 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v65 - v16;
  sub_24736817C();
  sub_24736B4FC(0, 0);
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v10, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v72 = v11 + 16;
  uint64_t v73 = v18;
  id v71 = v19;
  v19(v17, v18, v10);
  uint64_t v20 = a2;
  uint64_t v21 = sub_24737CE30();
  os_log_type_t v22 = sub_24737D0B0();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v78 = v10;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v70 = v9;
    uint64_t v25 = (uint8_t *)v24;
    uint64_t v26 = (void *)swift_slowAlloc();
    uint64_t v66 = v25;
    uint64_t v67 = v17;
    *(_DWORD *)uint64_t v25 = 138412290;
    id v79 = v20;
    id v27 = v20;
    uint64_t v68 = v7;
    uint64_t v28 = v27;
    uint64_t v10 = v78;
    uint64_t v17 = v67;
    sub_24737D120();
    *uint64_t v26 = v20;

    uint64_t v7 = v68;
    uint64_t v29 = v66;
    _os_log_impl(&dword_24735E000, v21, v22, "removed: %@", v66, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249080);
    swift_arrayDestroy();
    MEMORY[0x24C5526D0](v26, -1, -1);
    uint64_t v30 = v29;
    uint64_t v9 = v70;
    MEMORY[0x24C5526D0](v30, -1, -1);
  }
  else
  {

    uint64_t v21 = v20;
  }

  uint64_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v31 = (uint64_t *)(v11 + 8);
  uint64_t v32 = v33;
  v33(v17, v10);
  id v34 = [v20 accountType];
  if (!v34)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v35 = v34;
  uint64_t v70 = v31;
  id v36 = objc_msgSend(v34, sel_identifier);

  if (!v36)
  {
LABEL_28:
    __break(1u);
    return;
  }
  uint64_t v37 = sub_24737CFE0();
  uint64_t v39 = v38;

  id v40 = [v20 username];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = sub_24737CFE0();
    uint64_t v44 = v43;

    swift_beginAccess();
    uint64_t v45 = swift_bridgeObjectRetain();
    uint64_t v46 = (void *)sub_247374888(v45, v37, v39, v42, v44);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  unint64_t v47 = v46[2];
  if (v47 < 2)
  {
    uint64_t v49 = v76;
    uint64_t v48 = v77;
    if (v47)
    {
      sub_247368BAC((uint64_t)v46 + ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80)), v76);
      uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56);
      v50(v49, 0, 1, v7);
    }
    else
    {
      uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v77 + 56);
      v50(v76, 1, 1, v7);
    }
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v49, 1, v7) == 1)
    {
      sub_247374C8C(v49, &qword_26B12A518);
    }
    else
    {
      sub_247368D54(v49, (uint64_t)v9);
      unint64_t v51 = v74;
      uint64_t v52 = v78;
      v71(v74, v73, v78);
      id v53 = sub_24737CE30();
      os_log_type_t v54 = sub_24737D0B0();
      if (os_log_type_enabled(v53, v54))
      {
        id v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v55 = 0;
        _os_log_impl(&dword_24735E000, v53, v54, "Existing suggestion found, removing this computer", v55, 2u);
        uint64_t v56 = v55;
        unint64_t v51 = v74;
        uint64_t v52 = v78;
        MEMORY[0x24C5526D0](v56, -1, -1);
      }

      v32(v51, v52);
      uint64_t v57 = sub_2473617E4();
      uint64_t v58 = (char *)v9 + *(int *)(v7 + 40);
      sub_24737034C(v57, v59);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(*(void *)v58 + 16))
      {
        sub_247368BAC((uint64_t)v9, v75);
        uint64_t v60 = 0;
      }
      else
      {
        v71(v69, v73, v52);
        char v61 = sub_24737CE30();
        os_log_type_t v62 = sub_24737D0B0();
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v63 = 0;
          _os_log_impl(&dword_24735E000, v61, v62, "Existing suggestion has no remaining devices, removing it", v63, 2u);
          uint64_t v52 = v78;
          MEMORY[0x24C5526D0](v63, -1, -1);
        }

        v32(v69, v52);
        uint64_t v60 = 1;
      }
      uint64_t v64 = v75;
      v50(v75, v60, 1, v7);
      sub_247369004(v64, *v9, v9[1], 1, 0);
      sub_247374C8C(v64, &qword_26B12A518);
      sub_24736F48C((uint64_t)v9);
    }
  }
  else
  {
    sub_24736ADAC(v46, 0, 1, 1, 0);
    swift_bridgeObjectRelease();
  }
  sub_247364B64();
}

uint64_t sub_24736E610(void *a1)
{
  return sub_24736DBA4(a1, (uint64_t)&unk_26FB821E0, (uint64_t)sub_24736EB34, (uint64_t)&block_descriptor_57);
}

void sub_24736E638(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_24737CE50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24736817C();
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = a2;
  uint64_t v10 = sub_24737CE30();
  os_log_type_t v11 = sub_24737D0B0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = a1;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v7;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    BOOL v23 = v9;
    uint64_t v15 = v9;
    uint64_t v21 = v5;
    uint64_t v16 = v4;
    uint64_t v17 = v15;
    sub_24737D120();
    *uint64_t v14 = v9;

    uint64_t v4 = v16;
    uint64_t v5 = v21;
    _os_log_impl(&dword_24735E000, v10, v11, "updated: %@ checking if we need to update this computer", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249080);
    swift_arrayDestroy();
    MEMORY[0x24C5526D0](v14, -1, -1);
    uint64_t v18 = v13;
    uint64_t v7 = v20;
    MEMORY[0x24C5526D0](v18, -1, -1);
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24736B4FC(0, 0);
  sub_24736C680(v9);
}

uint64_t AccountSuggestionManager.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__allSuggestions;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A568);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__filteredSuggestions, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  sub_247361CC0(*(void *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AccountSuggestionManager.__deallocating_deinit()
{
  AccountSuggestionManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24736EA7C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountSuggestionManager();
  uint64_t result = sub_24737CE70();
  *a1 = result;
  return result;
}

void *sub_24736EABC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24736EACC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24736EADC()
{
  return sub_24736D8D8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24736EAE8()
{
  sub_24736DE5C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t objectdestroy_41Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24736EB34()
{
  sub_24736E638(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24736EB3C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_24736EB48()
{
  return type metadata accessor for AccountSuggestionManager();
}

uint64_t type metadata accessor for AccountSuggestionManager()
{
  uint64_t result = qword_26B12A558;
  if (!qword_26B12A558) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24736EB9C()
{
  sub_24736F2A0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AccountSuggestionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountSuggestionManager);
}

uint64_t dispatch thunk of AccountSuggestionManager.allSuggestions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AccountSuggestionManager.allSuggestions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AccountSuggestionManager.allSuggestions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$allSuggestions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$allSuggestions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$allSuggestions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AccountSuggestionManager.filteredSuggestions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AccountSuggestionManager.filteredSuggestions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of AccountSuggestionManager.filteredSuggestions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$filteredSuggestions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$filteredSuggestions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$filteredSuggestions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AccountSuggestionManager.suggestionsByID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AccountSuggestionManager.suggestionsByID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AccountSuggestionManager.suggestionsByID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceLastUsedDates.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceLastUsedDates.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceLastUsedDates.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AccountSuggestionManager.nonUpdatingMode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AccountSuggestionManager.nonUpdatingMode.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AccountSuggestionManager.nonUpdatingMode.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of AccountSuggestionManager.animationWrapperBlock.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of AccountSuggestionManager.animationWrapperBlock.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of AccountSuggestionManager.animationWrapperBlock.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of static AccountSuggestionManager.featureEnabled()()
{
  return (*(uint64_t (**)(void))(v0 + 528))();
}

uint64_t dispatch thunk of AccountSuggestionManager.__allocating_init(uiMode:)()
{
  return (*(uint64_t (**)(void))(v0 + 536))();
}

uint64_t dispatch thunk of AccountSuggestionManager.startMonitoring()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of AccountSuggestionManager.stopMonitoring()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of AccountSuggestionManager._resetSyncInfo()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of AccountSuggestionManager._insertTestData(username:type:properties:outgoingProperties:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of AccountSuggestionManager._insertTestComputer(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of AccountSuggestionManager.reloadAccounts()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of AccountSuggestionManager.remove(_:forceFromUI:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 744))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deduplicateAll()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 760))();
}

uint64_t dispatch thunk of AccountSuggestionManager.added(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 808))();
}

uint64_t dispatch thunk of AccountSuggestionManager.removed(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 816))();
}

uint64_t dispatch thunk of AccountSuggestionManager.updated(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 824))();
}

void sub_24736F2A0()
{
  if (!qword_26B12A570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B12A5B8);
    unint64_t v0 = sub_24737CEE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B12A570);
    }
  }
}

uint64_t getEnumTagSinglePayload for AccountSuggestionManager.Flags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountSuggestionManager.Flags(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24736F3F0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24736F418()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountSuggestionManager.Flags()
{
  return &type metadata for AccountSuggestionManager.Flags;
}

unint64_t sub_24736F438()
{
  unint64_t result = qword_269249058;
  if (!qword_269249058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249058);
  }
  return result;
}

uint64_t sub_24736F48C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_24736F4E8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
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
    sub_247373E8C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24736F5F8(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A670);
  uint64_t v10 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24737D1F0();
    __break(1u);
    return result;
  }
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
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
    sub_247375008(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24736F860(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24736F8BC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24737D2C0();
  swift_bridgeObjectRetain();
  sub_24737D000();
  uint64_t v8 = sub_24737D2E0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24737D270() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_24737D270() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24736FD4C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24736FA6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249070);
  uint64_t v3 = sub_24737D1A0();
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
      sub_24737D2C0();
      sub_24737D000();
      uint64_t result = sub_24737D2E0();
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

uint64_t sub_24736FD4C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24736FA6C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24736FEE8();
      goto LABEL_22;
    }
    sub_24737009C();
  }
  uint64_t v11 = *v4;
  sub_24737D2C0();
  sub_24737D000();
  uint64_t result = sub_24737D2E0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24737D270(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24737D2A0();
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
          uint64_t result = sub_24737D270();
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

void *sub_24736FEE8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249070);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24737D190();
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

uint64_t sub_24737009C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249070);
  uint64_t v3 = sub_24737D1A0();
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
    sub_24737D2C0();
    swift_bridgeObjectRetain();
    sub_24737D000();
    uint64_t result = sub_24737D2E0();
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

uint64_t sub_24737034C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_24737D2C0();
  swift_bridgeObjectRetain();
  sub_24737D000();
  uint64_t v6 = sub_24737D2E0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_24737D270() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_24737D270() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24736FEE8();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_2473704DC(v8);
  uint64_t *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_2473704DC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_24737D170();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_24737D2C0();
        swift_bridgeObjectRetain();
        sub_24737D000();
        uint64_t v10 = sub_24737D2E0();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2473706A4(void **a1, uint64_t (*a2)(void *))
{
  uint64_t v4 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
  uint64_t v5 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)sub_247373DB4(v5);
  }
  uint64_t v6 = v5[2];
  v8[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  uint64_t result = a2(v8);
  *a1 = v5;
  return result;
}

uint64_t sub_24737075C(uint64_t *a1)
{
  uint64_t v153 = type metadata accessor for AccountSuggestion();
  uint64_t v3 = *(void *)(v153 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v153);
  uint64_t v147 = (uint64_t)v139 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v160 = (uint64_t)v139 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v139 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v154 = (uint64_t)v139 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v151 = (uint64_t)v139 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v150 = (uint64_t)v139 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v145 = (uint64_t)v139 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v144 = (uint64_t)v139 - v19;
  v165 = a1;
  uint64_t v20 = a1[1];
  uint64_t result = sub_24737D250();
  if (result >= v20)
  {
    if (v20 < 0) {
      goto LABEL_156;
    }
    if (v20) {
      return sub_247371DB4(0, v20, 1, v165);
    }
    return result;
  }
  if (v20 >= 0) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v20 + 1;
  }
  if (v20 < -1) {
    goto LABEL_168;
  }
  uint64_t v143 = v3;
  id v159 = v10;
  uint64_t v141 = result;
  uint64_t v152 = v1;
  if (v20 < 2)
  {
    uint64_t v25 = MEMORY[0x263F8EE78];
    unint64_t v149 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v140 = MEMORY[0x263F8EE78];
    if (v20 != 1)
    {
      unint64_t v27 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_122:
      if (v27 >= 2)
      {
        uint64_t v132 = *v165;
        do
        {
          unint64_t v133 = v27 - 2;
          if (v27 < 2) {
            goto LABEL_151;
          }
          if (!v132) {
            goto LABEL_163;
          }
          uint64_t v134 = *(void *)(v25 + 32 + 16 * v133);
          uint64_t v135 = *(void *)(v25 + 32 + 16 * (v27 - 1) + 8);
          uint64_t v136 = v152;
          uint64_t result = sub_24737232C(v132 + *(void *)(v143 + 72) * v134, v132 + *(void *)(v143 + 72) * *(void *)(v25 + 32 + 16 * (v27 - 1)), v132 + *(void *)(v143 + 72) * v135, v149);
          uint64_t v152 = v136;
          if (v136) {
            break;
          }
          if (v135 < v134) {
            goto LABEL_152;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_2473730AC(v25);
            uint64_t v25 = result;
          }
          if (v133 >= *(void *)(v25 + 16)) {
            goto LABEL_153;
          }
          v137 = (void *)(v25 + 32 + 16 * v133);
          void *v137 = v134;
          v137[1] = v135;
          unint64_t v138 = *(void *)(v25 + 16);
          if (v27 > v138) {
            goto LABEL_154;
          }
          uint64_t result = (uint64_t)memmove((void *)(v25 + 32 + 16 * (v27 - 1)), (const void *)(v25 + 32 + 16 * v27), 16 * (v138 - v27));
          *(void *)(v25 + 16) = v138 - 1;
          unint64_t v27 = v138 - 1;
        }
        while (v138 > 2);
      }
LABEL_133:
      swift_bridgeObjectRelease();
      *(void *)(v140 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v23 = v22 >> 1;
    uint64_t result = sub_24737D090();
    *(void *)(result + 16) = v23;
    unint64_t v24 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v140 = result;
    unint64_t v149 = result + v24;
  }
  uint64_t v26 = 0;
  uint64_t v25 = MEMORY[0x263F8EE78];
LABEL_15:
  uint64_t v28 = v26;
  uint64_t v29 = v26 + 1;
  if (v26 + 1 >= v20)
  {
    uint64_t v40 = v26 + 1;
    goto LABEL_74;
  }
  uint64_t v158 = v20;
  uint64_t v30 = *v165;
  uint64_t v31 = *(void *)(v3 + 72);
  uint64_t v32 = v144;
  sub_247368BAC(*v165 + v31 * v29, v144);
  uint64_t v156 = v30;
  uint64_t v33 = v30 + v31 * v28;
  uint64_t v34 = v145;
  sub_247368BAC(v33, v145);
  uint64_t v35 = *(void *)(v32 + 24);
  uint64_t v163 = *(void *)(v32 + 16);
  uint64_t v164 = v35;
  uint64_t v36 = *(void *)(v34 + 24);
  uint64_t v161 = *(void *)(v34 + 16);
  uint64_t v162 = v36;
  sub_247374E78();
  uint64_t v37 = sub_24737D140();
  type metadata accessor for ComparisonResult();
  uint64_t v157 = v38;
  if (v37 == -1)
  {
    int v39 = 0;
  }
  else if (v37 == 1)
  {
    int v39 = 1;
  }
  else
  {
    if (v37)
    {
      uint64_t v163 = v37;
      goto LABEL_167;
    }
    uint64_t v41 = *(void *)(v144 + 40);
    uint64_t v163 = *(void *)(v144 + 32);
    uint64_t v164 = v41;
    uint64_t v42 = *(void *)(v145 + 40);
    uint64_t v161 = *(void *)(v145 + 32);
    uint64_t v162 = v42;
    int v39 = sub_24737D140() == 1;
  }
  sub_24736F48C(v145);
  uint64_t result = sub_24736F48C(v144);
  uint64_t v40 = v28 + 2;
  if (v28 + 2 < v158)
  {
    uint64_t v148 = v28;
    uint64_t v142 = v25;
    uint64_t v43 = v31 * v29;
    uint64_t v44 = v156;
    uint64_t v45 = v31 * v40;
    while (1)
    {
      uint64_t v46 = v40;
      uint64_t v47 = v150;
      sub_247368BAC(v44 + v45, v150);
      uint64_t v48 = v151;
      sub_247368BAC(v44 + v43, v151);
      uint64_t v49 = *(void *)(v47 + 24);
      uint64_t v163 = *(void *)(v47 + 16);
      uint64_t v164 = v49;
      uint64_t v50 = *(void *)(v48 + 24);
      uint64_t v161 = *(void *)(v48 + 16);
      uint64_t v162 = v50;
      uint64_t result = sub_24737D140();
      if (result == -1)
      {
        int v51 = 0;
      }
      else if (result == 1)
      {
        int v51 = 1;
      }
      else
      {
        if (result) {
          goto LABEL_164;
        }
        uint64_t v52 = *(void *)(v150 + 40);
        uint64_t v163 = *(void *)(v150 + 32);
        uint64_t v164 = v52;
        uint64_t v53 = *(void *)(v151 + 40);
        uint64_t v161 = *(void *)(v151 + 32);
        uint64_t v162 = v53;
        int v51 = sub_24737D140() == 1;
      }
      sub_24736F48C(v151);
      uint64_t result = sub_24736F48C(v150);
      if (v39 != v51) {
        break;
      }
      uint64_t v40 = v46 + 1;
      v44 += v31;
      if (v158 == v46 + 1)
      {
        uint64_t v40 = v158;
        uint64_t v25 = v142;
        goto LABEL_35;
      }
    }
    uint64_t v25 = v142;
    uint64_t v40 = v46;
LABEL_35:
    uint64_t v3 = v143;
    uint64_t v28 = v148;
  }
  if (!v39) {
    goto LABEL_49;
  }
  if (v40 < v28) {
    goto LABEL_157;
  }
  if (v28 < v40)
  {
    uint64_t v142 = v25;
    uint64_t v54 = 0;
    uint64_t v55 = v31 * (v40 - 1);
    uint64_t v56 = v40 * v31;
    uint64_t v148 = v28;
    uint64_t v57 = v28 * v31;
    do
    {
      if (v28 != v40 + v54 - 1)
      {
        uint64_t v59 = v156;
        if (!v156) {
          goto LABEL_162;
        }
        unint64_t v60 = v156 + v57;
        uint64_t v157 = v156 + v55;
        sub_247368D54(v156 + v57, v147);
        if (v57 < v55 || v60 >= v59 + v56)
        {
          uint64_t v58 = v157;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v58 = v157;
          if (v57 != v55) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        uint64_t result = sub_247368D54(v147, v58);
      }
      ++v28;
      --v54;
      v55 -= v31;
      v56 -= v31;
      v57 += v31;
    }
    while (v28 < v40 + v54);
    uint64_t v3 = v143;
    uint64_t v25 = v142;
    uint64_t v61 = v154;
    uint64_t v28 = v148;
  }
  else
  {
LABEL_49:
    uint64_t v61 = v154;
  }
  if (v40 >= v158) {
    goto LABEL_74;
  }
  if (__OFSUB__(v40, v28)) {
    goto LABEL_155;
  }
  if (v40 - v28 >= v141) {
    goto LABEL_74;
  }
  if (__OFADD__(v28, v141)) {
    goto LABEL_158;
  }
  if (v28 + v141 >= v158) {
    uint64_t v62 = v158;
  }
  else {
    uint64_t v62 = v28 + v141;
  }
  if (v62 >= v28)
  {
    if (v40 == v62) {
      goto LABEL_74;
    }
    uint64_t v148 = v28;
    uint64_t v142 = v25;
    type metadata accessor for ComparisonResult();
    v139[1] = v63;
    uint64_t v64 = *(void *)(v3 + 72);
    uint64_t v65 = v64 * (v40 - 1);
    uint64_t v155 = v64;
    uint64_t v66 = v40 * v64;
    uint64_t v146 = v62;
LABEL_63:
    uint64_t v68 = 0;
    uint64_t v69 = v148;
    uint64_t v157 = v65;
    uint64_t v158 = v40;
    uint64_t v156 = v66;
    while (1)
    {
      uint64_t v70 = *v165;
      sub_247368BAC(v66 + v68 + *v165, v61);
      id v71 = (void *)v61;
      uint64_t v72 = v159;
      sub_247368BAC(v65 + v68 + v70, (uint64_t)v159);
      uint64_t v73 = v71[3];
      uint64_t v163 = v71[2];
      uint64_t v164 = v73;
      uint64_t v74 = v72[3];
      uint64_t v161 = v72[2];
      uint64_t v162 = v74;
      sub_247374E78();
      uint64_t v75 = sub_24737D140();
      if (v75)
      {
        if (v75 != 1)
        {
          uint64_t v61 = v154;
          uint64_t v65 = v157;
          uint64_t v67 = v158;
          uint64_t v66 = v156;
          if (v75 != -1)
          {
            uint64_t v163 = v75;
            goto LABEL_167;
          }
          sub_24736F48C((uint64_t)v159);
          uint64_t result = sub_24736F48C(v61);
LABEL_62:
          uint64_t v40 = v67 + 1;
          v65 += v155;
          v66 += v155;
          if (v40 != v146) {
            goto LABEL_63;
          }
          uint64_t v40 = v146;
          uint64_t v3 = v143;
          uint64_t v25 = v142;
          uint64_t v28 = v148;
LABEL_74:
          if (v40 < v28) {
            goto LABEL_150;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v158 = v40;
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_247372DB4(0, *(void *)(v25 + 16) + 1, 1, (char *)v25);
            uint64_t v25 = result;
          }
          unint64_t v82 = *(void *)(v25 + 16);
          unint64_t v81 = *(void *)(v25 + 24);
          unint64_t v27 = v82 + 1;
          if (v82 >= v81 >> 1)
          {
            uint64_t result = (uint64_t)sub_247372DB4((char *)(v81 > 1), v82 + 1, 1, (char *)v25);
            uint64_t v25 = result;
          }
          *(void *)(v25 + 16) = v27;
          uint64_t v83 = v25 + 32;
          uint64_t v84 = (uint64_t *)(v25 + 32 + 16 * v82);
          uint64_t v85 = v158;
          *uint64_t v84 = v28;
          v84[1] = v85;
          if (v82)
          {
LABEL_80:
            unint64_t v86 = v27 - 1;
            if (v27 >= 4)
            {
              unint64_t v91 = v83 + 16 * v27;
              uint64_t v92 = *(void *)(v91 - 64);
              uint64_t v93 = *(void *)(v91 - 56);
              BOOL v97 = __OFSUB__(v93, v92);
              uint64_t v94 = v93 - v92;
              if (v97) {
                goto LABEL_139;
              }
              uint64_t v96 = *(void *)(v91 - 48);
              uint64_t v95 = *(void *)(v91 - 40);
              BOOL v97 = __OFSUB__(v95, v96);
              uint64_t v89 = v95 - v96;
              char v90 = v97;
              if (v97) {
                goto LABEL_140;
              }
              unint64_t v98 = v27 - 2;
              uint64_t v99 = (uint64_t *)(v83 + 16 * (v27 - 2));
              uint64_t v101 = *v99;
              uint64_t v100 = v99[1];
              BOOL v97 = __OFSUB__(v100, v101);
              uint64_t v102 = v100 - v101;
              if (v97) {
                goto LABEL_142;
              }
              BOOL v97 = __OFADD__(v89, v102);
              uint64_t v103 = v89 + v102;
              if (v97) {
                goto LABEL_145;
              }
              if (v103 >= v94)
              {
                uint64_t v121 = (uint64_t *)(v83 + 16 * v86);
                uint64_t v123 = *v121;
                uint64_t v122 = v121[1];
                BOOL v97 = __OFSUB__(v122, v123);
                uint64_t v124 = v122 - v123;
                if (v97) {
                  goto LABEL_149;
                }
                BOOL v114 = v89 < v124;
              }
              else
              {
LABEL_93:
                if (v90) {
                  goto LABEL_141;
                }
                unint64_t v98 = v27 - 2;
                unint64_t v104 = (uint64_t *)(v83 + 16 * (v27 - 2));
                uint64_t v106 = *v104;
                uint64_t v105 = v104[1];
                BOOL v107 = __OFSUB__(v105, v106);
                uint64_t v108 = v105 - v106;
                char v109 = v107;
                if (v107) {
                  goto LABEL_144;
                }
                uint64_t v110 = (uint64_t *)(v83 + 16 * v86);
                uint64_t v112 = *v110;
                uint64_t v111 = v110[1];
                BOOL v97 = __OFSUB__(v111, v112);
                uint64_t v113 = v111 - v112;
                if (v97) {
                  goto LABEL_147;
                }
                if (__OFADD__(v108, v113)) {
                  goto LABEL_148;
                }
                if (v108 + v113 < v89) {
                  goto LABEL_105;
                }
                BOOL v114 = v89 < v113;
              }
              if (v114) {
                unint64_t v86 = v98;
              }
            }
            else
            {
              if (v27 == 3)
              {
                uint64_t v88 = *(void *)(v25 + 32);
                uint64_t v87 = *(void *)(v25 + 40);
                BOOL v97 = __OFSUB__(v87, v88);
                uint64_t v89 = v87 - v88;
                char v90 = v97;
                goto LABEL_93;
              }
              uint64_t v115 = *(void *)(v25 + 32);
              uint64_t v116 = *(void *)(v25 + 40);
              BOOL v97 = __OFSUB__(v116, v115);
              uint64_t v108 = v116 - v115;
              char v109 = v97;
LABEL_105:
              if (v109) {
                goto LABEL_143;
              }
              int v117 = (uint64_t *)(v83 + 16 * v86);
              uint64_t v119 = *v117;
              uint64_t v118 = v117[1];
              BOOL v97 = __OFSUB__(v118, v119);
              uint64_t v120 = v118 - v119;
              if (v97) {
                goto LABEL_146;
              }
              if (v120 < v108) {
                goto LABEL_14;
              }
            }
            unint64_t v125 = v86 - 1;
            if (v86 - 1 >= v27)
            {
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
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
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
              break;
            }
            if (!*v165) {
              goto LABEL_161;
            }
            unint64_t v126 = (uint64_t *)(v83 + 16 * v125);
            uint64_t v127 = *v126;
            uint64_t v128 = (void *)(v83 + 16 * v86);
            uint64_t v129 = v128[1];
            uint64_t v130 = v152;
            uint64_t result = sub_24737232C(*v165 + *(void *)(v3 + 72) * *v126, *v165 + *(void *)(v3 + 72) * *v128, *v165 + *(void *)(v3 + 72) * v129, v149);
            uint64_t v152 = v130;
            if (v130) {
              goto LABEL_133;
            }
            if (v129 < v127) {
              goto LABEL_136;
            }
            if (v86 > *(void *)(v25 + 16)) {
              goto LABEL_137;
            }
            *unint64_t v126 = v127;
            *(void *)(v83 + 16 * v125 + 8) = v129;
            unint64_t v131 = *(void *)(v25 + 16);
            if (v86 >= v131) {
              goto LABEL_138;
            }
            unint64_t v27 = v131 - 1;
            uint64_t result = (uint64_t)memmove((void *)(v83 + 16 * v86), v128 + 2, 16 * (v131 - 1 - v86));
            *(void *)(v25 + 16) = v131 - 1;
            if (v131 <= 2) {
              goto LABEL_14;
            }
            goto LABEL_80;
          }
          unint64_t v27 = 1;
LABEL_14:
          uint64_t v20 = v165[1];
          uint64_t v26 = v158;
          if (v158 >= v20) {
            goto LABEL_122;
          }
          goto LABEL_15;
        }
        sub_24736F48C((uint64_t)v159);
        uint64_t v61 = v154;
        uint64_t result = sub_24736F48C(v154);
        uint64_t v66 = v156;
        uint64_t v65 = v157;
      }
      else
      {
        uint64_t v76 = v71[5];
        uint64_t v163 = v71[4];
        uint64_t v164 = v76;
        uint64_t v77 = v72[5];
        uint64_t v161 = v72[4];
        uint64_t v162 = v77;
        uint64_t v78 = sub_24737D140();
        sub_24736F48C((uint64_t)v72);
        uint64_t result = sub_24736F48C((uint64_t)v71);
        uint64_t v61 = (uint64_t)v71;
        uint64_t v66 = v156;
        uint64_t v65 = v157;
        if (v78 != 1)
        {
          uint64_t v67 = v158;
          goto LABEL_62;
        }
      }
      uint64_t v79 = *v165;
      if (!*v165) {
        goto LABEL_160;
      }
      uint64_t v80 = v79 + v65 + v68;
      sub_247368D54(v79 + v66 + v68, v160);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_247368D54(v160, v80);
      v68 -= v155;
      ++v69;
      uint64_t v67 = v158;
      if (v158 == v69) {
        goto LABEL_62;
      }
    }
  }
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  uint64_t v163 = result;
LABEL_167:
  sub_24737D280();
  __break(1u);
LABEL_168:
  uint64_t result = sub_24737D1F0();
  __break(1u);
  return result;
}

uint64_t sub_2473713CC(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v137 = type metadata accessor for AccountSuggestion();
  uint64_t v131 = *(void *)(v137 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v137);
  uint64_t v128 = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v138 = (uint64_t)&v123 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v134 = (uint64_t)&v123 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (uint64_t)&v123 - v10;
  uint64_t v11 = a1[1];
  uint64_t result = sub_24737D250();
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_140;
    }
    if (v11) {
      return sub_2473720D4(0, v11, 1, a1);
    }
    return result;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_148;
  }
  uint64_t v125 = result;
  if (v11 < 2)
  {
    uint64_t v17 = (char *)MEMORY[0x263F8EE78];
    unint64_t v130 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    uint64_t v124 = MEMORY[0x263F8EE78];
    if (v11 != 1)
    {
      unint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      if (v19 >= 2)
      {
        uint64_t v116 = *a1;
        do
        {
          unint64_t v117 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_135;
          }
          if (!v116) {
            goto LABEL_147;
          }
          uint64_t v118 = v17;
          uint64_t v119 = *(void *)&v17[16 * v117 + 32];
          uint64_t v120 = *(void *)&v17[16 * v19 + 24];
          sub_247372934(v116 + *(void *)(v131 + 72) * v119, v116 + *(void *)(v131 + 72) * *(void *)&v17[16 * v19 + 16], v116 + *(void *)(v131 + 72) * v120, v130);
          if (v2) {
            break;
          }
          if (v120 < v119) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v118 = sub_2473730AC((uint64_t)v17);
          }
          if (v117 >= *((void *)v118 + 2)) {
            goto LABEL_137;
          }
          uint64_t v121 = &v118[16 * v117 + 32];
          *(void *)uint64_t v121 = v119;
          *((void *)v121 + 1) = v120;
          unint64_t v122 = *((void *)v118 + 2);
          if (v19 > v122) {
            goto LABEL_138;
          }
          memmove(&v118[16 * v19 + 16], &v118[16 * v19 + 32], 16 * (v122 - v19));
          *((void *)v118 + 2) = v122 - 1;
          unint64_t v19 = v122 - 1;
          uint64_t v17 = v118;
        }
        while (v122 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t v15 = sub_24737D090();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(unsigned __int8 *)(v131 + 80);
    uint64_t v124 = v15;
    unint64_t v130 = v15 + ((v16 + 32) & ~v16);
  }
  uint64_t v18 = 0;
  uint64_t v17 = (char *)MEMORY[0x263F8EE78];
  uint64_t v136 = a1;
  while (1)
  {
    uint64_t v20 = v18;
    uint64_t v21 = v18 + 1;
    if (v18 + 1 >= v11)
    {
      uint64_t v38 = v18 + 1;
      goto LABEL_58;
    }
    uint64_t v126 = v2;
    uint64_t v22 = *a1;
    uint64_t v23 = *(void *)(v131 + 72);
    uint64_t v24 = v133;
    sub_247368BAC(*a1 + v23 * v21, v133);
    uint64_t v25 = v22 + v23 * v20;
    uint64_t v129 = v20;
    uint64_t v26 = v134;
    sub_247368BAC(v25, v134);
    LODWORD(v135) = sub_24737CD90();
    uint64_t v27 = v26;
    uint64_t v20 = v129;
    sub_24736F48C(v27);
    sub_24736F48C(v24);
    uint64_t v28 = v20 + 2;
    uint64_t v139 = v23;
    uint64_t v132 = v22;
    if (v20 + 2 >= v11)
    {
      uint64_t v31 = v20 + 2;
      uint64_t v37 = v23;
      if ((v135 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v29 = v23 * v21;
      uint64_t v30 = v22;
      uint64_t v31 = v28;
      uint64_t v32 = v23 * v28;
      do
      {
        uint64_t v33 = v11;
        uint64_t v34 = v133;
        sub_247368BAC(v30 + v32, v133);
        uint64_t v35 = v134;
        sub_247368BAC(v30 + v29, v134);
        int v36 = sub_24737CD90();
        sub_24736F48C(v35);
        sub_24736F48C(v34);
        if ((v135 ^ v36))
        {
          a1 = v136;
          uint64_t v20 = v129;
          uint64_t v11 = v33;
          uint64_t v37 = v139;
          if ((v135 & 1) == 0) {
            goto LABEL_37;
          }
          goto LABEL_24;
        }
        uint64_t v37 = v139;
        v30 += v139;
        ++v31;
        uint64_t v11 = v33;
      }
      while (v33 != v31);
      uint64_t v31 = v33;
      a1 = v136;
      uint64_t v20 = v129;
      if ((v135 & 1) == 0)
      {
LABEL_37:
        uint64_t v38 = v31;
        break;
      }
    }
LABEL_24:
    if (v31 < v20) {
      goto LABEL_141;
    }
    uint64_t v38 = v31;
    if (v20 >= v31) {
      break;
    }
    uint64_t v135 = v11;
    uint64_t v123 = v17;
    uint64_t v39 = 0;
    uint64_t v40 = v20;
    uint64_t v41 = v37 * (v31 - 1);
    uint64_t v42 = v31 * v37;
    uint64_t v43 = v40;
    uint64_t v44 = v40 * v37;
    uint64_t v45 = v132;
    do
    {
      if (v43 != v38 + v39 - 1)
      {
        if (!v45) {
          goto LABEL_146;
        }
        sub_247368D54(v45 + v44, v128);
        if (v44 < v41 || v45 + v44 >= (unint64_t)(v45 + v42))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v44 != v41)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_247368D54(v128, v45 + v41);
        a1 = v136;
        uint64_t v38 = v31;
        uint64_t v37 = v139;
      }
      ++v43;
      --v39;
      v41 -= v37;
      v42 -= v37;
      v44 += v37;
    }
    while (v43 < v38 + v39);
    uint64_t v17 = v123;
    uint64_t v2 = v126;
    uint64_t v20 = v129;
    uint64_t v11 = v135;
    if (v38 < v135) {
      goto LABEL_41;
    }
LABEL_58:
    if (v38 < v20) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v135 = v38;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v17 = sub_247372DB4(0, *((void *)v17 + 2) + 1, 1, v17);
    }
    unint64_t v65 = *((void *)v17 + 2);
    unint64_t v64 = *((void *)v17 + 3);
    unint64_t v19 = v65 + 1;
    if (v65 >= v64 >> 1) {
      uint64_t v17 = sub_247372DB4((char *)(v64 > 1), v65 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v19;
    uint64_t v66 = v17 + 32;
    uint64_t v67 = &v17[16 * v65 + 32];
    uint64_t v68 = v135;
    *(void *)uint64_t v67 = v20;
    *((void *)v67 + 1) = v68;
    if (v65)
    {
      while (1)
      {
        unint64_t v69 = v19 - 1;
        if (v19 >= 4)
        {
          uint64_t v74 = &v66[16 * v19];
          uint64_t v75 = *((void *)v74 - 8);
          uint64_t v76 = *((void *)v74 - 7);
          BOOL v80 = __OFSUB__(v76, v75);
          uint64_t v77 = v76 - v75;
          if (v80) {
            goto LABEL_123;
          }
          uint64_t v79 = *((void *)v74 - 6);
          uint64_t v78 = *((void *)v74 - 5);
          BOOL v80 = __OFSUB__(v78, v79);
          uint64_t v72 = v78 - v79;
          char v73 = v80;
          if (v80) {
            goto LABEL_124;
          }
          unint64_t v81 = v19 - 2;
          unint64_t v82 = &v66[16 * v19 - 32];
          uint64_t v84 = *(void *)v82;
          uint64_t v83 = *((void *)v82 + 1);
          BOOL v80 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          if (v80) {
            goto LABEL_126;
          }
          BOOL v80 = __OFADD__(v72, v85);
          uint64_t v86 = v72 + v85;
          if (v80) {
            goto LABEL_129;
          }
          if (v86 >= v77)
          {
            unint64_t v104 = &v66[16 * v69];
            uint64_t v106 = *(void *)v104;
            uint64_t v105 = *((void *)v104 + 1);
            BOOL v80 = __OFSUB__(v105, v106);
            uint64_t v107 = v105 - v106;
            if (v80) {
              goto LABEL_133;
            }
            BOOL v97 = v72 < v107;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v98 = *((void *)v17 + 4);
            uint64_t v99 = *((void *)v17 + 5);
            BOOL v80 = __OFSUB__(v99, v98);
            uint64_t v91 = v99 - v98;
            char v92 = v80;
            goto LABEL_89;
          }
          uint64_t v71 = *((void *)v17 + 4);
          uint64_t v70 = *((void *)v17 + 5);
          BOOL v80 = __OFSUB__(v70, v71);
          uint64_t v72 = v70 - v71;
          char v73 = v80;
        }
        if (v73) {
          goto LABEL_125;
        }
        unint64_t v81 = v19 - 2;
        uint64_t v87 = &v66[16 * v19 - 32];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v90 = __OFSUB__(v88, v89);
        uint64_t v91 = v88 - v89;
        char v92 = v90;
        if (v90) {
          goto LABEL_128;
        }
        uint64_t v93 = &v66[16 * v69];
        uint64_t v95 = *(void *)v93;
        uint64_t v94 = *((void *)v93 + 1);
        BOOL v80 = __OFSUB__(v94, v95);
        uint64_t v96 = v94 - v95;
        if (v80) {
          goto LABEL_131;
        }
        if (__OFADD__(v91, v96)) {
          goto LABEL_132;
        }
        if (v91 + v96 >= v72)
        {
          BOOL v97 = v72 < v96;
LABEL_95:
          if (v97) {
            unint64_t v69 = v81;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v92) {
          goto LABEL_127;
        }
        uint64_t v100 = &v66[16 * v69];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v80 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v80) {
          goto LABEL_130;
        }
        if (v103 < v91) {
          goto LABEL_14;
        }
LABEL_97:
        unint64_t v108 = v69 - 1;
        if (v69 - 1 >= v19)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        uint64_t v109 = *a1;
        if (!*a1) {
          goto LABEL_145;
        }
        uint64_t v110 = v17;
        uint64_t v111 = &v66[16 * v108];
        uint64_t v112 = *(void *)v111;
        uint64_t v113 = &v66[16 * v69];
        uint64_t v114 = *((void *)v113 + 1);
        sub_247372934(v109 + *(void *)(v131 + 72) * *(void *)v111, v109 + *(void *)(v131 + 72) * *(void *)v113, v109 + *(void *)(v131 + 72) * v114, v130);
        if (v2) {
          goto LABEL_117;
        }
        if (v114 < v112) {
          goto LABEL_120;
        }
        if (v69 > *((void *)v110 + 2)) {
          goto LABEL_121;
        }
        *(void *)uint64_t v111 = v112;
        *(void *)&v66[16 * v108 + 8] = v114;
        unint64_t v115 = *((void *)v110 + 2);
        if (v69 >= v115) {
          goto LABEL_122;
        }
        uint64_t v17 = v110;
        unint64_t v19 = v115 - 1;
        memmove(&v66[16 * v69], v113 + 16, 16 * (v115 - 1 - v69));
        *((void *)v110 + 2) = v115 - 1;
        a1 = v136;
        if (v115 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v19 = 1;
LABEL_14:
    uint64_t v11 = a1[1];
    uint64_t v18 = v135;
    if (v135 >= v11) {
      goto LABEL_106;
    }
  }
  uint64_t v2 = v126;
  if (v38 >= v11) {
    goto LABEL_58;
  }
LABEL_41:
  if (__OFSUB__(v38, v20)) {
    goto LABEL_139;
  }
  if (v38 - v20 >= v125) {
    goto LABEL_58;
  }
  if (__OFADD__(v20, v125)) {
    goto LABEL_142;
  }
  if (v20 + v125 >= v11) {
    uint64_t v46 = v11;
  }
  else {
    uint64_t v46 = v20 + v125;
  }
  if (v46 >= v20)
  {
    if (v38 != v46)
    {
      uint64_t v129 = v20;
      uint64_t v123 = v17;
      uint64_t v126 = v2;
      uint64_t v127 = v46;
      uint64_t v47 = *(void *)(v131 + 72);
      uint64_t v48 = v47 * (v38 - 1);
      uint64_t v132 = v47;
      uint64_t v49 = v38 * v47;
      do
      {
        uint64_t v51 = 0;
        uint64_t v52 = v129;
        uint64_t v135 = v38;
        while (1)
        {
          uint64_t v139 = v52;
          uint64_t v53 = *a1;
          uint64_t v54 = v49;
          uint64_t v55 = v49 + v51 + *a1;
          uint64_t v56 = a1;
          uint64_t v57 = v133;
          sub_247368BAC(v55, v133);
          uint64_t v58 = v48;
          uint64_t v59 = v48 + v51 + v53;
          uint64_t v60 = v134;
          sub_247368BAC(v59, v134);
          LOBYTE(v53) = sub_24737CD90();
          sub_24736F48C(v60);
          sub_24736F48C(v57);
          if ((v53 & 1) == 0) {
            break;
          }
          uint64_t v61 = *v56;
          if (!*v56) {
            goto LABEL_144;
          }
          uint64_t v49 = v54;
          uint64_t v48 = v58;
          uint64_t v62 = v61 + v58 + v51;
          sub_247368D54(v61 + v54 + v51, v138);
          swift_arrayInitWithTakeFrontToBack();
          sub_247368D54(v138, v62);
          v51 -= v132;
          uint64_t v52 = v139 + 1;
          uint64_t v50 = v135;
          a1 = v136;
          if (v135 == v139 + 1) {
            goto LABEL_51;
          }
        }
        uint64_t v50 = v135;
        a1 = v56;
        uint64_t v48 = v58;
        uint64_t v49 = v54;
LABEL_51:
        uint64_t v38 = v50 + 1;
        v48 += v132;
        v49 += v132;
      }
      while (v38 != v127);
      uint64_t v38 = v127;
      uint64_t v2 = v126;
      uint64_t v17 = v123;
      uint64_t v20 = v129;
    }
    goto LABEL_58;
  }
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
  uint64_t result = sub_24737D1F0();
  __break(1u);
  return result;
}

uint64_t sub_247371DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  int v36 = a4;
  uint64_t v30 = a1;
  uint64_t v31 = type metadata accessor for AccountSuggestion();
  uint64_t v6 = *(void *)(v31 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (uint64_t)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v28 - v10);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (uint64_t *)((char *)&v28 - v13);
  uint64_t v34 = a3;
  uint64_t v29 = a2;
  if (a3 != a2)
  {
    type metadata accessor for ComparisonResult();
    uint64_t v28 = v15;
    uint64_t v16 = *(void *)(v6 + 72);
    uint64_t v41 = v16 * (v34 - 1);
    uint64_t v32 = v16;
    uint64_t v17 = v16 * v34;
LABEL_5:
    uint64_t v18 = 0;
    uint64_t v19 = v30;
    uint64_t v33 = v17;
    while (1)
    {
      uint64_t v20 = *v36;
      sub_247368BAC(v17 + v18 + *v36, (uint64_t)v14);
      sub_247368BAC(v41 + v18 + v20, (uint64_t)v11);
      uint64_t v21 = v14[3];
      uint64_t v39 = v14[2];
      uint64_t v40 = v21;
      uint64_t v22 = v11[3];
      uint64_t v37 = v11[2];
      uint64_t v38 = v22;
      sub_247374E78();
      uint64_t result = sub_24737D140();
      if (result)
      {
        if (result != 1)
        {
          uint64_t v17 = v33;
          if (result != -1) {
            goto LABEL_16;
          }
          sub_24736F48C((uint64_t)v11);
          uint64_t result = sub_24736F48C((uint64_t)v14);
LABEL_4:
          v41 += v32;
          v17 += v32;
          if (++v34 == v29) {
            return result;
          }
          goto LABEL_5;
        }
        sub_24736F48C((uint64_t)v11);
        uint64_t result = sub_24736F48C((uint64_t)v14);
        uint64_t v17 = v33;
      }
      else
      {
        uint64_t v23 = v14[5];
        uint64_t v39 = v14[4];
        uint64_t v40 = v23;
        uint64_t v24 = v11[5];
        uint64_t v37 = v11[4];
        uint64_t v38 = v24;
        uint64_t v25 = sub_24737D140();
        sub_24736F48C((uint64_t)v11);
        uint64_t result = sub_24736F48C((uint64_t)v14);
        uint64_t v17 = v33;
        if (v25 != 1) {
          goto LABEL_4;
        }
      }
      uint64_t v26 = *v36;
      if (!*v36) {
        break;
      }
      uint64_t v27 = v26 + v41 + v18;
      sub_247368D54(v26 + v17 + v18, v35);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_247368D54(v35, v27);
      v18 -= v32;
      if (v34 == ++v19) {
        goto LABEL_4;
      }
    }
    __break(1u);
LABEL_16:
    uint64_t v39 = result;
    uint64_t result = sub_24737D280();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473720D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v27 = type metadata accessor for AccountSuggestion();
  uint64_t v7 = MEMORY[0x270FA5388](v27);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v26 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v26 - 1);
    uint64_t v25 = v16;
    uint64_t v29 = v16 * v26;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v24;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_247368BAC(v29 + v17 + *a4, (uint64_t)v15);
      sub_247368BAC(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_24737CD90();
      sub_24736F48C((uint64_t)v11);
      uint64_t result = sub_24736F48C((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v25;
        v29 += v25;
        if (++v26 == v23) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = v20 + v30 + v17;
      sub_247368D54(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_247368D54(v28, v21);
      v17 -= v25;
      if (v26 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24737232C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v54 = type metadata accessor for AccountSuggestion();
  uint64_t v8 = MEMORY[0x270FA5388](v54);
  uint64_t v10 = (uint64_t *)((char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (uint64_t *)((char *)&v52 - v12);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (uint64_t *)((char *)&v52 - v15);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (uint64_t *)((char *)&v52 - v18);
  uint64_t v21 = *(void *)(v20 + 72);
  if (!v21)
  {
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  unint64_t v22 = a1;
  if (a2 - a1 == 0x8000000000000000 && v21 == -1) {
    goto LABEL_73;
  }
  int64_t v23 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v21 == -1)
  {
LABEL_74:
    __break(1u);
LABEL_75:
    uint64_t v57 = v17;
    sub_24737D280();
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v24 = (uint64_t)(a2 - a1) / v21;
  unint64_t v61 = a1;
  unint64_t v60 = a4;
  uint64_t v25 = v23 / v21;
  if (v24 >= v23 / v21)
  {
    if ((v25 & 0x8000000000000000) == 0)
    {
      unint64_t v53 = a1;
      uint64_t v27 = v25 * v21;
      if (a4 < a2 || a2 + v27 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v39 = a4 + v27;
      unint64_t v59 = a4 + v27;
      unint64_t v61 = a2;
      if (v27 >= 1 && v53 < a2)
      {
        type metadata accessor for ComparisonResult();
        uint64_t v52 = v41;
        uint64_t v42 = -v21;
        do
        {
          sub_247368BAC(v39 + v42, (uint64_t)v13);
          unint64_t v43 = a2 + v42;
          sub_247368BAC(a2 + v42, (uint64_t)v10);
          uint64_t v44 = v13[3];
          uint64_t v57 = v13[2];
          uint64_t v58 = v44;
          uint64_t v45 = v10[3];
          uint64_t v55 = v10[2];
          uint64_t v56 = v45;
          sub_247374E78();
          uint64_t v17 = sub_24737D140();
          if (v17 == -1)
          {
            BOOL v46 = 0;
          }
          else if (v17 == 1)
          {
            BOOL v46 = 1;
          }
          else
          {
            if (v17) {
              goto LABEL_75;
            }
            uint64_t v47 = v13[5];
            uint64_t v57 = v13[4];
            uint64_t v58 = v47;
            uint64_t v48 = v10[5];
            uint64_t v55 = v10[4];
            uint64_t v56 = v48;
            BOOL v46 = sub_24737D140() == 1;
          }
          unint64_t v49 = a3 + v42;
          sub_24736F48C((uint64_t)v10);
          sub_24736F48C((uint64_t)v13);
          if (v46)
          {
            if (a3 < a2 || v49 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v61 += v42;
          }
          else
          {
            unint64_t v50 = v59;
            v59 += v42;
            if (a3 < v50 || v49 >= v50)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v50)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v43 = a2;
          }
          unint64_t v39 = v59;
          if (v59 <= a4) {
            break;
          }
          a2 = v43;
          a3 += v42;
        }
        while (v43 > v53);
      }
LABEL_71:
      sub_247372EB0(&v61, &v60, (uint64_t *)&v59);
      return 1;
    }
  }
  else if ((v24 & 0x8000000000000000) == 0)
  {
    uint64_t v26 = v24 * v21;
    if (a4 < v22 || v22 + v26 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v22)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v28 = a4 + v26;
    unint64_t v59 = a4 + v26;
    unint64_t v53 = a3;
    if (v26 >= 1 && a2 < a3)
    {
      type metadata accessor for ComparisonResult();
      uint64_t v52 = v30;
      while (1)
      {
        sub_247368BAC(a2, (uint64_t)v19);
        sub_247368BAC(a4, (uint64_t)v16);
        uint64_t v31 = v19[3];
        uint64_t v57 = v19[2];
        uint64_t v58 = v31;
        uint64_t v32 = v16[3];
        uint64_t v55 = v16[2];
        uint64_t v56 = v32;
        sub_247374E78();
        uint64_t v17 = sub_24737D140();
        if (v17 == -1) {
          break;
        }
        if (v17 == 1)
        {
          sub_24736F48C((uint64_t)v16);
          sub_24736F48C((uint64_t)v19);
        }
        else
        {
          if (v17) {
            goto LABEL_75;
          }
          uint64_t v33 = v19[5];
          uint64_t v57 = v19[4];
          uint64_t v58 = v33;
          uint64_t v34 = v16[5];
          uint64_t v55 = v16[4];
          uint64_t v56 = v34;
          uint64_t v35 = sub_24737D140();
          sub_24736F48C((uint64_t)v16);
          sub_24736F48C((uint64_t)v19);
          if (v35 != 1) {
            goto LABEL_33;
          }
        }
        unint64_t v36 = v61;
        unint64_t v37 = a2 + v21;
        if (v61 < a2 || v61 >= v37)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v61 == a2)
        {
          unint64_t v36 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_40:
        unint64_t v61 = v36 + v21;
        a4 = v60;
        if (v60 < v28)
        {
          a2 = v37;
          if (v37 < v53) {
            continue;
          }
        }
        goto LABEL_71;
      }
      sub_24736F48C((uint64_t)v16);
      sub_24736F48C((uint64_t)v19);
LABEL_33:
      unint64_t v36 = v61;
      unint64_t v38 = v60 + v21;
      if (v61 < v60 || v61 >= v38)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v61 != v60)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v60 = v38;
      unint64_t v37 = a2;
      goto LABEL_40;
    }
    goto LABEL_71;
  }
LABEL_76:
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

uint64_t sub_247372934(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v36 = type metadata accessor for AccountSuggestion();
  uint64_t v8 = MEMORY[0x270FA5388](v36);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_61;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_62;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v39 = a1;
  unint64_t v38 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v26 = a4 + v19;
      unint64_t v37 = a4 + v19;
      unint64_t v39 = a2;
      unint64_t v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        uint64_t v28 = -v14;
        do
        {
          unint64_t v29 = a3 + v28;
          sub_247368BAC(v26 + v28, (uint64_t)v12);
          unint64_t v30 = a2 + v28;
          sub_247368BAC(a2 + v28, (uint64_t)v10);
          char v31 = sub_24737CD90();
          sub_24736F48C((uint64_t)v10);
          sub_24736F48C((uint64_t)v12);
          if (v31)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            unint64_t v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v30 = a2;
          }
          unint64_t v26 = v37;
          if (v37 <= a4) {
            break;
          }
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_247368BAC(a2, (uint64_t)v12);
        sub_247368BAC(a4, (uint64_t)v10);
        char v22 = sub_24737CD90();
        sub_24736F48C((uint64_t)v10);
        sub_24736F48C((uint64_t)v12);
        unint64_t v23 = v39;
        if (v22)
        {
          unint64_t v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v38 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_247372EB0(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

char *sub_247372DB4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249078);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_247372EB0(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for AccountSuggestion();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_24737D240();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_247372FF0(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_24737D240();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_2473730AC(uint64_t a1)
{
  return sub_247372DB4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2473730C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2473730E0(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2473730E0(char a1, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A670);
  uint64_t v10 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
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
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

uint64_t sub_247373320(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

uint64_t sub_24737348C(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_2473735F0((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    int64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_2473735F0((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x24C5526D0](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_2473735F0(uint64_t result, uint64_t a2, uint64_t a3)
{
  size_t v5 = (unint64_t *)result;
  uint64_t v6 = 0;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v14 = v13 | (v7 << 6);
LABEL_5:
    int64_t v15 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v14);
    uint64_t v17 = *v15;
    unint64_t v16 = v15[1];
    uint64_t v18 = v17 & 0xFFFFFFFFFFFFLL;
    if ((v16 & 0x2000000000000000) != 0) {
      uint64_t v19 = HIBYTE(v16) & 0xF;
    }
    else {
      uint64_t v19 = v18;
    }
    if (v19)
    {
      *(void *)(result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v6++, 1))
      {
        __break(1u);
LABEL_27:
        swift_retain();
        return sub_247373778(v5, a2, v6, a3);
      }
    }
  }
  int64_t v20 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v20 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v20);
  ++v7;
  if (v21) {
    goto LABEL_23;
  }
  int64_t v7 = v20 + 1;
  if (v20 + 1 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v7);
  if (v21) {
    goto LABEL_23;
  }
  int64_t v7 = v20 + 2;
  if (v20 + 2 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v7);
  if (v21)
  {
LABEL_23:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v14 = __clz(__rbit64(v21)) + (v7 << 6);
    goto LABEL_5;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v22);
  if (v21)
  {
    int64_t v7 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v7 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_27;
    }
    unint64_t v21 = *(void *)(v8 + 8 * v7);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_247373778(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249070);
  uint64_t result = sub_24737D1B0();
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
    sub_24737D2C0();
    swift_bridgeObjectRetain();
    sub_24737D000();
    uint64_t result = sub_24737D2E0();
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

void (*sub_247373A10(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_247373CC8(v6);
  v6[10] = sub_247373B30(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_247373ABC;
}

void sub_247373ABC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_247373B30(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_247378620(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_247373C78;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24737AD18();
      goto LABEL_7;
    }
    sub_2473796CC(v16, a4 & 1);
    unint64_t v20 = sub_247378620(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_24737D2B0();
  __break(1u);
  return result;
}

void sub_247373C78(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_247373D04(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_247373CC8(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_247373CF8;
}

uint64_t sub_247373CF8(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_247373D04(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v8;
    }
    else
    {
      sub_24737A5B8(a4, a5, a6, v8, (void *)*a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_247379DF4(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_247373DB4(void *a1)
{
  return sub_2473730E0(0, a1[2], 0, a1);
}

uint64_t sub_247373DC8(uint64_t a1)
{
  return sub_247373320(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247373DDC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0]();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = sub_24737D020();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_247373E8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

uint64_t sub_247373F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v54 = a2;
  uint64_t v5 = type metadata accessor for AccountSuggestion();
  uint64_t v63 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v50 = (uint64_t)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v49 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v62 = (char *)&v49 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v61 = (uint64_t)&v49 - v14;
  uint64_t result = MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v49 - v16;
  int64_t v18 = 0;
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v58 = a1 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  uint64_t v51 = MEMORY[0x263F8EE78];
  uint64_t v52 = a1;
  uint64_t v65 = MEMORY[0x263F8EE78];
  unint64_t v22 = v21 & v19;
  uint64_t v53 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_locallySupportedAccountTypes;
  int64_t v59 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v60 = result;
  uint64_t v57 = v10;
  while (1)
  {
    if (v22)
    {
      unint64_t v23 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      int64_t v64 = v18;
      unint64_t v24 = v23 | (v18 << 6);
      uint64_t v25 = (uint64_t)v62;
    }
    else
    {
      BOOL v26 = __OFADD__(v18, 1);
      int64_t v27 = v18 + 1;
      uint64_t v25 = (uint64_t)v62;
      if (v26) {
        goto LABEL_50;
      }
      if (v27 >= v59)
      {
LABEL_48:
        swift_release();
        return v51;
      }
      unint64_t v28 = *(void *)(v58 + 8 * v27);
      if (!v28)
      {
        int64_t v29 = v27 + 1;
        if (v27 + 1 >= v59) {
          goto LABEL_48;
        }
        unint64_t v28 = *(void *)(v58 + 8 * v29);
        if (v28) {
          goto LABEL_18;
        }
        int64_t v29 = v27 + 2;
        if (v27 + 2 >= v59) {
          goto LABEL_48;
        }
        unint64_t v28 = *(void *)(v58 + 8 * v29);
        if (v28) {
          goto LABEL_18;
        }
        int64_t v29 = v27 + 3;
        if (v27 + 3 >= v59) {
          goto LABEL_48;
        }
        unint64_t v28 = *(void *)(v58 + 8 * v29);
        if (v28)
        {
LABEL_18:
          int64_t v27 = v29;
        }
        else
        {
          int64_t v48 = v27 + 4;
          if (v27 + 4 >= v59) {
            goto LABEL_48;
          }
          unint64_t v28 = *(void *)(v58 + 8 * v48);
          for (v27 += 4; !v28; ++v48)
          {
            int64_t v27 = v48 + 1;
            if (__OFADD__(v48, 1)) {
              goto LABEL_51;
            }
            if (v27 >= v59) {
              goto LABEL_48;
            }
            unint64_t v28 = *(void *)(v58 + 8 * v27);
          }
        }
      }
      unint64_t v22 = (v28 - 1) & v28;
      int64_t v64 = v27;
      unint64_t v24 = __clz(__rbit64(v28)) + (v27 << 6);
    }
    uint64_t v30 = *(void *)(v63 + 72);
    uint64_t v31 = v61;
    sub_247368BAC(*(void *)(a1 + 56) + v30 * v24, v61);
    sub_247368D54(v31, (uint64_t)v17);
    LOBYTE(v31) = v17[*(int *)(v5 + 56)];
    sub_247368BAC((uint64_t)v17, v25);
    if (v31)
    {
      sub_24736F48C(v25);
      sub_247368BAC((uint64_t)v17, (uint64_t)v10);
LABEL_5:
      sub_24736F48C((uint64_t)v10);
      uint64_t result = sub_24736F48C((uint64_t)v17);
      goto LABEL_6;
    }
    uint64_t v32 = swift_bridgeObjectRetain();
    uint64_t v33 = *(void *)(sub_24737348C(v32) + 16);
    swift_release();
    sub_24736F48C(v25);
    sub_247368BAC((uint64_t)v17, (uint64_t)v10);
    if (!v33) {
      goto LABEL_5;
    }
    uint64_t v55 = v30;
    uint64_t v34 = *(void **)(v54 + v53);
    uint64_t v35 = v34[2];
    if (!v35)
    {
      uint64_t v10 = v57;
      goto LABEL_5;
    }
    uint64_t v56 = v3;
    uint64_t v37 = *((void *)v57 + 2);
    uint64_t v36 = *((void *)v57 + 3);
    if (v34[4] != v37 || v34[5] != v36)
    {
      uint64_t result = sub_24737D270();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_37:
    uint64_t v10 = v57;
    sub_24736F48C((uint64_t)v57);
    sub_247368D54((uint64_t)v17, v50);
    uint64_t v42 = v51;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_2473730C0(0, *(void *)(v42 + 16) + 1, 1);
    }
    uint64_t v43 = v65;
    unint64_t v45 = *(void *)(v65 + 16);
    unint64_t v44 = *(void *)(v65 + 24);
    a1 = v52;
    uint64_t v46 = v55;
    if (v45 >= v44 >> 1)
    {
      sub_2473730C0(v44 > 1, v45 + 1, 1);
      uint64_t v43 = v65;
    }
    *(void *)(v43 + 16) = v45 + 1;
    uint64_t v47 = *(unsigned __int8 *)(v63 + 80);
    uint64_t v51 = v43;
    uint64_t result = sub_247368D54(v50, v43 + ((v47 + 32) & ~v47) + v45 * v46);
    uint64_t v3 = v56;
LABEL_6:
    uint64_t v5 = v60;
    int64_t v18 = v64;
  }
  uint64_t v3 = v56;
  uint64_t v10 = v57;
  a1 = v52;
  if (v35 == 1) {
    goto LABEL_5;
  }
  unint64_t v38 = v34 + 7;
  uint64_t v39 = 1;
  while (1)
  {
    uint64_t v40 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      break;
    }
    if (*(v38 - 1) == v37 && *v38 == v36) {
      goto LABEL_37;
    }
    uint64_t result = sub_24737D270();
    if (result) {
      goto LABEL_37;
    }
    v38 += 2;
    ++v39;
    if (v40 == v35)
    {
      uint64_t v3 = v56;
      uint64_t v10 = v57;
      a1 = v52;
      goto LABEL_5;
    }
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_247374450()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24737CEF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24737CF20();
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24737CE50();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v14 = sub_24737CE30();
  os_log_type_t v15 = sub_24737D0B0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    unint64_t v28 = v8;
    char v17 = v5;
    uint64_t v18 = v1;
    uint64_t v19 = v2;
    uint64_t v20 = v3;
    uint64_t v21 = v16;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_24735E000, v14, v15, "reload delay", v16, 2u);
    unint64_t v22 = v21;
    uint64_t v3 = v20;
    uint64_t v2 = v19;
    uint64_t v1 = v18;
    uint64_t v5 = v17;
    uint64_t v8 = v28;
    MEMORY[0x24C5526D0](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  unint64_t v23 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  aBlock[4] = sub_247374F30;
  void aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247362D78;
  aBlock[3] = &block_descriptor_105;
  unint64_t v24 = _Block_copy(aBlock);
  id v25 = v23;
  swift_retain();
  sub_24737CF00();
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_247368AA8(&qword_26B12A578, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5C0);
  sub_247368AF0(&qword_26B12A5C8, &qword_26B12A5C0);
  sub_24737D160();
  MEMORY[0x24C552000](0, v8, v5, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v30);
  return swift_release();
}

uint64_t sub_247374888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v47 = a5;
  uint64_t v48 = a4;
  uint64_t v8 = type metadata accessor for AccountSuggestion();
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v41 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t result = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v40 - v18;
  int64_t v20 = 0;
  uint64_t v45 = a1;
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v43 = a1 + 64;
  uint64_t v22 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v23 = -1;
  if (v22 < 64) {
    uint64_t v23 = ~(-1 << v22);
  }
  unint64_t v42 = MEMORY[0x263F8EE78];
  unint64_t v49 = MEMORY[0x263F8EE78];
  unint64_t v24 = v23 & v21;
  int64_t v44 = (unint64_t)(v22 + 63) >> 6;
  if ((v23 & v21) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v28 = v20 + 1;
  if (!__OFADD__(v20, 1))
  {
    if (v28 < v44)
    {
      unint64_t v29 = *(void *)(v43 + 8 * v28);
      ++v20;
      if (v29) {
        goto LABEL_23;
      }
      int64_t v20 = v28 + 1;
      if (v28 + 1 >= v44) {
        goto LABEL_40;
      }
      unint64_t v29 = *(void *)(v43 + 8 * v20);
      if (v29) {
        goto LABEL_23;
      }
      int64_t v20 = v28 + 2;
      if (v28 + 2 >= v44) {
        goto LABEL_40;
      }
      unint64_t v29 = *(void *)(v43 + 8 * v20);
      if (v29) {
        goto LABEL_23;
      }
      int64_t v20 = v28 + 3;
      if (v28 + 3 >= v44) {
        goto LABEL_40;
      }
      unint64_t v29 = *(void *)(v43 + 8 * v20);
      if (v29)
      {
LABEL_23:
        unint64_t v24 = (v29 - 1) & v29;
        for (unint64_t i = __clz(__rbit64(v29)) + (v20 << 6); ; unint64_t i = v26 | (v20 << 6))
        {
          uint64_t v31 = *(void *)(v46 + 72);
          sub_247368BAC(*(void *)(v45 + 56) + v31 * i, (uint64_t)v16);
          sub_247368D54((uint64_t)v16, (uint64_t)v19);
          if (*((void *)v19 + 2) == a2 && *((void *)v19 + 3) == a3)
          {
            sub_247368BAC((uint64_t)v19, (uint64_t)v13);
          }
          else
          {
            char v33 = sub_24737D270();
            sub_247368BAC((uint64_t)v19, (uint64_t)v13);
            if ((v33 & 1) == 0)
            {
              sub_24736F48C((uint64_t)v13);
LABEL_6:
              uint64_t result = sub_24736F48C((uint64_t)v19);
              if (!v24) {
                goto LABEL_8;
              }
              goto LABEL_7;
            }
          }
          if (*((void *)v13 + 4) == v48 && *((void *)v13 + 5) == v47)
          {
            sub_24736F48C((uint64_t)v13);
          }
          else
          {
            char v25 = sub_24737D270();
            sub_24736F48C((uint64_t)v13);
            if ((v25 & 1) == 0) {
              goto LABEL_6;
            }
          }
          sub_247368D54((uint64_t)v19, v41);
          unint64_t v34 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_2473730C0(0, *(void *)(v34 + 16) + 1, 1);
          }
          unint64_t v35 = v49;
          unint64_t v37 = *(void *)(v49 + 16);
          unint64_t v36 = *(void *)(v49 + 24);
          unint64_t v38 = v37 + 1;
          if (v37 >= v36 >> 1)
          {
            unint64_t v42 = v37 + 1;
            unint64_t v40 = v37;
            sub_2473730C0(v36 > 1, v37 + 1, 1);
            unint64_t v38 = v42;
            unint64_t v37 = v40;
            unint64_t v35 = v49;
          }
          *(void *)(v35 + 16) = v38;
          uint64_t v39 = *(unsigned __int8 *)(v46 + 80);
          unint64_t v42 = v35;
          uint64_t result = sub_247368D54(v41, v35 + ((v39 + 32) & ~v39) + v37 * v31);
          if (!v24) {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v26 = __clz(__rbit64(v24));
          v24 &= v24 - 1;
        }
      }
      int64_t v30 = v28 + 4;
      if (v30 < v44)
      {
        unint64_t v29 = *(void *)(v43 + 8 * v30);
        if (v29)
        {
          int64_t v20 = v30;
          goto LABEL_23;
        }
        while (1)
        {
          int64_t v20 = v30 + 1;
          if (__OFADD__(v30, 1)) {
            goto LABEL_42;
          }
          if (v20 >= v44) {
            break;
          }
          unint64_t v29 = *(void *)(v43 + 8 * v20);
          ++v30;
          if (v29) {
            goto LABEL_23;
          }
        }
      }
    }
LABEL_40:
    swift_release();
    return v42;
  }
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

_OWORD *sub_247374C74(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_247374C84()
{
  return swift_release();
}

uint64_t sub_247374C8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_247374D7C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_247374DBC()
{
  return sub_247367E58(v0[2], v0[3], v0[4]);
}

uint64_t objectdestroy_95Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_247374E14()
{
  return sub_247367FE4();
}

void type metadata accessor for ComparisonResult()
{
  if (!qword_26B12A658)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26B12A658);
    }
  }
}

unint64_t sub_247374E78()
{
  unint64_t result = qword_26B12A640;
  if (!qword_26B12A640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12A640);
  }
  return result;
}

uint64_t sub_247374ECC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247374F30()
{
  return sub_24736289C(v0);
}

uint64_t sub_247374F38()
{
  return sub_247362BAC(v0);
}

uint64_t sub_247374F40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247374F78(uint64_t a1, uint64_t a2)
{
  return sub_247361B60(a1, a2, *(void (**)(void *))(v2 + 16));
}

uint64_t sub_247374F80()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247374F90(_OWORD *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t (*)(), _OWORD *))(v1 + 16);
  v4[1] = *a1;
  return v2(sub_247374FE0, v4);
}

uint64_t sub_247374FE0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_247375008(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
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
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

uint64_t sub_247375164(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t AccountSuggestion.Source.rawValue.getter()
{
  return *v0;
}

uint64_t AccountSuggestion.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v3 = sub_24737CE50();
  unint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for AccountSuggestion();
  uint64_t v8 = (char *)*((void *)v7 - 1);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (void *)((char *)v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(int *)(v9 + 52);
  *(unint64_t *)((char *)v11 + v12) = sub_247360FA8(MEMORY[0x263F8EE78]);
  uint64_t v13 = (int *)v7[14];
  *((unsigned char *)v13 + (void)v11) = 0;
  if (qword_26B12A630 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_3;
    }
LABEL_29:
    long long v89 = 0u;
    long long v90 = 0u;
    goto LABEL_30;
  }
  swift_once();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_29;
  }
LABEL_3:
  uint64_t v14 = v6;
  uint64_t v83 = v13;
  uint64_t v15 = qword_26B12A760;
  uint64_t v16 = qword_26B12A758;
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_247378620(v16, v15);
  if ((v18 & 1) == 0)
  {
    long long v89 = 0u;
    long long v90 = 0u;
    swift_bridgeObjectRelease();
    uint64_t v6 = v14;
    goto LABEL_30;
  }
  sub_24736F860(*(void *)(a1 + 56) + 32 * v17, (uint64_t)&v89);
  swift_bridgeObjectRelease();
  uint64_t v6 = v14;
  if (!*((void *)&v90 + 1))
  {
LABEL_30:
    sub_247378698((uint64_t)&v89);
    goto LABEL_31;
  }
  if (swift_dynamicCast())
  {
    uint64_t v84 = v12;
    unint64_t v19 = v87;
    if (*(void *)(a1 + 16))
    {
      unint64_t v82 = v86;
      unint64_t v20 = sub_247378620(0xD000000000000015, 0x800000024737E4D0);
      if (v21)
      {
        sub_24736F860(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v89);
        if (swift_dynamicCast())
        {
          unint64_t v81 = v8;
          unint64_t v22 = v86;
          unint64_t v23 = v87;
          if (qword_26B12A638 == -1)
          {
            if (*(void *)(a1 + 16)) {
              goto LABEL_11;
            }
          }
          else
          {
            swift_once();
            if (*(void *)(a1 + 16))
            {
LABEL_11:
              unint64_t v79 = v22;
              unint64_t v80 = v23;
              uint64_t v24 = qword_26B12A770;
              uint64_t v25 = qword_26B12A768;
              swift_bridgeObjectRetain();
              unint64_t v26 = sub_247378620(v25, v24);
              if (v27)
              {
                sub_24736F860(*(void *)(a1 + 56) + 32 * v26, (uint64_t)&v89);
              }
              else
              {
                long long v89 = 0u;
                long long v90 = 0u;
              }
              uint64_t v6 = v14;
              unint64_t v28 = v80;
              swift_bridgeObjectRelease();
              if (*((void *)&v90 + 1))
              {
                if (swift_dynamicCast())
                {
                  unint64_t v29 = v86;
                  unint64_t v30 = v87;
                  *unint64_t v11 = v82;
                  v11[1] = v19;
                  uint64_t v31 = (uint64_t)v11;
                  v11[2] = v79;
                  v11[3] = v28;
                  v11[4] = v29;
                  v11[5] = v30;
                  if (qword_26B12A618 == -1)
                  {
                    if (*(void *)(a1 + 16)) {
                      goto LABEL_21;
                    }
                  }
                  else
                  {
                    swift_once();
                    if (*(void *)(a1 + 16))
                    {
LABEL_21:
                      uint64_t v32 = qword_26B12A730;
                      uint64_t v33 = qword_26B12A728;
                      swift_bridgeObjectRetain();
                      unint64_t v34 = sub_247378620(v33, v32);
                      if (v35)
                      {
                        sub_24736F860(*(void *)(a1 + 56) + 32 * v34, (uint64_t)&v89);
                      }
                      else
                      {
                        long long v89 = 0u;
                        long long v90 = 0u;
                      }
                      unint64_t v36 = v81;
                      swift_bridgeObjectRelease();
                      if (*((void *)&v90 + 1))
                      {
                        int v37 = swift_dynamicCast();
                        unint64_t v38 = v86;
                        unint64_t v39 = v87;
                        if (!v37)
                        {
                          unint64_t v38 = 0;
                          unint64_t v39 = 0;
                        }
LABEL_44:
                        *(void *)(v31 + 48) = v38;
                        *(void *)(v31 + 56) = v39;
                        if (qword_26B12A620 == -1)
                        {
                          if (*(void *)(a1 + 16)) {
                            goto LABEL_46;
                          }
                        }
                        else
                        {
                          swift_once();
                          if (*(void *)(a1 + 16))
                          {
LABEL_46:
                            uint64_t v53 = qword_26B12A740;
                            uint64_t v54 = qword_26B12A738;
                            swift_bridgeObjectRetain();
                            unint64_t v55 = sub_247378620(v54, v53);
                            if (v56)
                            {
                              sub_24736F860(*(void *)(a1 + 56) + 32 * v55, (uint64_t)&v89);
                            }
                            else
                            {
                              long long v89 = 0u;
                              long long v90 = 0u;
                            }
                            swift_bridgeObjectRelease();
                            if (*((void *)&v90 + 1))
                            {
                              if (swift_dynamicCast())
                              {
                                sub_24737CDB0();
                                goto LABEL_56;
                              }
LABEL_55:
                              sub_24737CDD0();
LABEL_56:
                              if (qword_26B12A628 == -1)
                              {
                                if (*(void *)(a1 + 16)) {
                                  goto LABEL_58;
                                }
                              }
                              else
                              {
                                swift_once();
                                if (*(void *)(a1 + 16))
                                {
LABEL_58:
                                  uint64_t v57 = qword_26B12A750;
                                  uint64_t v58 = qword_26B12A748;
                                  swift_bridgeObjectRetain();
                                  unint64_t v59 = sub_247378620(v58, v57);
                                  if (v60)
                                  {
                                    sub_24736F860(*(void *)(a1 + 56) + 32 * v59, (uint64_t)&v89);
                                  }
                                  else
                                  {
                                    long long v89 = 0u;
                                    long long v90 = 0u;
                                  }
                                  swift_bridgeObjectRelease();
                                  if (*((void *)&v90 + 1))
                                  {
                                    if (swift_dynamicCast())
                                    {
                                      char v61 = v86;
                                      if (v86 >= 3) {
                                        char v61 = 2;
                                      }
LABEL_69:
                                      *(unsigned char *)(v31 + v7[9]) = v61;
                                      if (*(void *)(a1 + 16)
                                        && (unint64_t v62 = sub_247378620(0xD000000000000014, 0x800000024737E4F0),
                                            (v63 & 1) != 0)
                                        && (sub_24736F860(*(void *)(a1 + 56) + 32 * v62, (uint64_t)&v89),
                                            __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A650),
                                            swift_dynamicCast()))
                                      {
                                        uint64_t v64 = v86;
                                      }
                                      else
                                      {
                                        uint64_t v64 = MEMORY[0x263F8EE78];
                                      }
                                      uint64_t v65 = sub_24737C09C(v64);
                                      swift_bridgeObjectRelease();
                                      *(void *)(v31 + v7[10]) = v65;
                                      if (qword_26B12A610 == -1)
                                      {
                                        if (*(void *)(a1 + 16)) {
                                          goto LABEL_76;
                                        }
                                      }
                                      else
                                      {
                                        swift_once();
                                        if (*(void *)(a1 + 16))
                                        {
LABEL_76:
                                          uint64_t v66 = qword_26B12A720;
                                          uint64_t v67 = qword_26B12A718;
                                          swift_bridgeObjectRetain();
                                          unint64_t v68 = sub_247378620(v67, v66);
                                          if (v69)
                                          {
                                            sub_24736F860(*(void *)(a1 + 56) + 32 * v68, (uint64_t)&v89);
                                          }
                                          else
                                          {
                                            long long v89 = 0u;
                                            long long v90 = 0u;
                                          }
                                          swift_bridgeObjectRelease();
                                          if (*((void *)&v90 + 1))
                                          {
                                            __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A648);
                                            if (swift_dynamicCast())
                                            {
                                              unint64_t v70 = v86;
                                              goto LABEL_86;
                                            }
LABEL_85:
                                            unint64_t v70 = sub_247360FA8(MEMORY[0x263F8EE78]);
LABEL_86:
                                            *(void *)(v31 + v7[11]) = v70;
                                            if (qword_26B12A608 == -1)
                                            {
                                              if (*(void *)(a1 + 16)) {
                                                goto LABEL_88;
                                              }
                                            }
                                            else
                                            {
                                              swift_once();
                                              if (*(void *)(a1 + 16))
                                              {
LABEL_88:
                                                uint64_t v71 = qword_26B12A710;
                                                uint64_t v72 = qword_26B12A708;
                                                swift_bridgeObjectRetain();
                                                unint64_t v73 = sub_247378620(v72, v71);
                                                if (v74)
                                                {
                                                  sub_24736F860(*(void *)(a1 + 56) + 32 * v73, (uint64_t)&v89);
                                                }
                                                else
                                                {
                                                  long long v89 = 0u;
                                                  long long v90 = 0u;
                                                }
                                                swift_bridgeObjectRelease();
                                                if (*((void *)&v90 + 1))
                                                {
                                                  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A648);
                                                  if (swift_dynamicCast())
                                                  {
                                                    unint64_t v75 = v86;
LABEL_98:
                                                    *(void *)(v31 + v7[12]) = v75;
                                                    uint64_t v76 = v84;
                                                    swift_bridgeObjectRelease();
                                                    *(void *)(v31 + v76) = a1;
                                                    *((unsigned char *)v83 + v31) = sub_247377770() & 1;
                                                    uint64_t v77 = v85;
                                                    sub_247368BAC(v31, v85);
                                                    (*((void (**)(uint64_t, void, uint64_t, int *))v36 + 7))(v77, 0, 1, v7);
                                                    return sub_24736F48C(v31);
                                                  }
LABEL_97:
                                                  unint64_t v75 = sub_247360FA8(MEMORY[0x263F8EE78]);
                                                  goto LABEL_98;
                                                }
LABEL_96:
                                                sub_247378698((uint64_t)&v89);
                                                goto LABEL_97;
                                              }
                                            }
                                            long long v89 = 0u;
                                            long long v90 = 0u;
                                            goto LABEL_96;
                                          }
LABEL_84:
                                          sub_247378698((uint64_t)&v89);
                                          goto LABEL_85;
                                        }
                                      }
                                      long long v89 = 0u;
                                      long long v90 = 0u;
                                      goto LABEL_84;
                                    }
LABEL_68:
                                    char v61 = 2;
                                    goto LABEL_69;
                                  }
LABEL_67:
                                  sub_247378698((uint64_t)&v89);
                                  goto LABEL_68;
                                }
                              }
                              long long v89 = 0u;
                              long long v90 = 0u;
                              goto LABEL_67;
                            }
LABEL_54:
                            sub_247378698((uint64_t)&v89);
                            goto LABEL_55;
                          }
                        }
                        long long v89 = 0u;
                        long long v90 = 0u;
                        goto LABEL_54;
                      }
LABEL_43:
                      sub_247378698((uint64_t)&v89);
                      unint64_t v38 = 0;
                      unint64_t v39 = 0;
                      goto LABEL_44;
                    }
                  }
                  long long v89 = 0u;
                  long long v90 = 0u;
                  unint64_t v36 = v81;
                  goto LABEL_43;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_40;
              }
LABEL_39:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_247378698((uint64_t)&v89);
LABEL_40:
              uint64_t v8 = v81;
              uint64_t v12 = v84;
              goto LABEL_31;
            }
          }
          long long v89 = 0u;
          long long v90 = 0u;
          uint64_t v6 = v14;
          goto LABEL_39;
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = v84;
    uint64_t v6 = v14;
  }
LABEL_31:
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v40 = __swift_project_value_buffer(v3, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v40, v3);
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_24737CE30();
  uint64_t v42 = v3;
  os_log_type_t v43 = sub_24737D0B0();
  if (os_log_type_enabled(v41, v43))
  {
    unint64_t v81 = v6;
    uint64_t v44 = swift_slowAlloc();
    unint64_t v80 = v4;
    uint64_t v45 = (uint8_t *)v44;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v83 = v7;
    unint64_t v79 = v42;
    uint64_t v47 = v46;
    unint64_t v86 = v46;
    unint64_t v82 = (unint64_t)v11;
    uint64_t v84 = v12;
    *(_DWORD *)uint64_t v45 = 136315138;
    v78[1] = v45 + 4;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_24737CFC0();
    unint64_t v49 = v8;
    unint64_t v51 = v50;
    swift_bridgeObjectRelease();
    uint64_t v88 = sub_247377ED8(v48, v51, (uint64_t *)&v86);
    sub_24737D120();
    swift_bridgeObjectRelease_n();
    uint64_t v8 = v49;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24735E000, v41, v43, "unable to initialize with dictionary: %s", v45, 0xCu);
    swift_arrayDestroy();
    uint64_t v7 = v83;
    MEMORY[0x24C5526D0](v47, -1, -1);
    MEMORY[0x24C5526D0](v45, -1, -1);

    (*(void (**)(char *, unint64_t))(v80 + 8))(v81, v79);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v42);
  }
  swift_bridgeObjectRelease();
  return (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))v8 + 7))(v85, 1, 1, v7);
}

uint64_t AccountSuggestion.dictionaryRepresentation()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for AccountSuggestion();
  uint64_t v3 = *(uint64_t *)((char *)v0 + v2[13]);
  uint64_t v4 = qword_26B12A630;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26B12A758;
  uint64_t v6 = qword_26B12A760;
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v9 = MEMORY[0x263F8D310];
  uint64_t v49 = MEMORY[0x263F8D310];
  *(void *)&long long v48 = v7;
  *((void *)&v48 + 1) = v8;
  sub_247374C74(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, v5, v6, isUniquelyReferenced_nonNull_native);
  uint64_t v50 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v49 = v9;
  *(void *)&long long v48 = v11;
  *((void *)&v48 + 1) = v12;
  sub_247374C74(&v48, v47);
  swift_bridgeObjectRetain();
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, 0xD000000000000015, 0x800000024737E4D0, v13);
  swift_bridgeObjectRelease();
  if (qword_26B12A638 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_26B12A768;
  uint64_t v15 = qword_26B12A770;
  uint64_t v16 = v1[4];
  uint64_t v17 = v1[5];
  uint64_t v49 = v9;
  *(void *)&long long v48 = v16;
  *((void *)&v48 + 1) = v17;
  sub_247374C74(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v18 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, v14, v15, v18);
  uint64_t v50 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B12A618 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_26B12A728;
  uint64_t v19 = qword_26B12A730;
  uint64_t v21 = v1[7];
  if (v21)
  {
    uint64_t v22 = v1[6];
    uint64_t v49 = v9;
    *(void *)&long long v48 = v22;
    *((void *)&v48 + 1) = v21;
    sub_247374C74(&v48, v47);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    sub_247379FCC(v47, v20, v19, v23);
    uint64_t v50 = v3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2473787DC(v20, v19, &v48);
    swift_bridgeObjectRelease();
    sub_247378698((uint64_t)&v48);
  }
  if (qword_26B12A620 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_26B12A738;
  uint64_t v25 = qword_26B12A740;
  swift_bridgeObjectRetain();
  sub_24737CDC0();
  uint64_t v49 = MEMORY[0x263F8D538];
  *(void *)&long long v48 = v26;
  sub_247374C74(&v48, v47);
  uint64_t v27 = v50;
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, v24, v25, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B12A628 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_26B12A748;
  uint64_t v30 = qword_26B12A750;
  uint64_t v31 = *((unsigned __int8 *)v1 + v2[9]);
  uint64_t v49 = MEMORY[0x263F8D6C8];
  *(void *)&long long v48 = v31;
  sub_247374C74(&v48, v47);
  swift_bridgeObjectRetain();
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, v29, v30, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = *(uint64_t *)((char *)v1 + v2[10]);
  swift_bridgeObjectRetain_n();
  unint64_t v34 = sub_24737B024(v33);
  swift_bridgeObjectRelease();
  *(void *)&long long v48 = v34;
  sub_24737B10C((uint64_t *)&v48);
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_24737D070();
  swift_release();
  uint64_t v49 = sub_247374D7C(0, &qword_2692490A0);
  *(void *)&long long v48 = v35;
  sub_247374C74(&v48, v47);
  char v36 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, 0xD000000000000014, 0x800000024737E4F0, v36);
  swift_bridgeObjectRelease();
  if (qword_26B12A610 != -1) {
    swift_once();
  }
  uint64_t v37 = qword_26B12A718;
  uint64_t v38 = qword_26B12A720;
  uint64_t v39 = *(uint64_t *)((char *)v1 + v2[11]);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A648);
  uint64_t v49 = v40;
  *(void *)&long long v48 = v39;
  sub_247374C74(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, v37, v38, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B12A608 != -1) {
    swift_once();
  }
  uint64_t v42 = qword_26B12A708;
  uint64_t v43 = qword_26B12A710;
  uint64_t v44 = *(uint64_t *)((char *)v1 + v2[12]);
  uint64_t v49 = v40;
  *(void *)&long long v48 = v44;
  sub_247374C74(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v45 = swift_isUniquelyReferenced_nonNull_native();
  sub_247379FCC(v47, v42, v43, v45);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v27;
}

id AccountSuggestion.init(with:computerID:source:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v79 = a3;
  uint64_t v76 = a2;
  uint64_t v77 = sub_24737CE50();
  id v81 = *(id *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  unint64_t v80 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24737CE10();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AccountSuggestion();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v75 = *a4;
  uint64_t v18 = *(int *)(v15 + 52);
  unint64_t v19 = sub_247360FA8(MEMORY[0x263F8EE78]);
  uint64_t v78 = v18;
  *(void *)&v17[v18] = v19;
  unint64_t v82 = (int *)v13;
  uint64_t v20 = *(int *)(v13 + 56);
  uint64_t v21 = a1;
  uint64_t v74 = v20;
  v17[v20] = 0;
  id result = objc_msgSend(a1, sel_accountType);
  if (!result)
  {
    __break(1u);
LABEL_38:
    __break(1u);
    return result;
  }
  char v23 = result;
  id v24 = objc_msgSend(result, sel_identifier);

  uint64_t v25 = a5;
  if (v24)
  {
    uint64_t v26 = sub_24737CFE0();
    uint64_t v28 = v27;

    id v29 = objc_msgSend(v21, sel_username);
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v72 = v14;
      uint64_t v73 = v25;
      uint64_t v31 = sub_24737CFE0();
      id v81 = v21;
      uint64_t v33 = v32;

      sub_24737CE00();
      uint64_t v34 = sub_24737CDF0();
      uint64_t v36 = v35;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      *(void *)uint64_t v17 = v34;
      *((void *)v17 + 1) = v36;
      *((void *)v17 + 2) = v26;
      *((void *)v17 + 3) = v28;
      *((void *)v17 + 4) = v31;
      *((void *)v17 + 5) = v33;
      id v38 = v81;
      uint64_t v37 = v82;
      v17[v82[9]] = v75;
      *((_OWORD *)v17 + 3) = xmmword_24737DBB0;
      swift_bridgeObjectRetain();
      sub_24737CDD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24737D8E0;
      *(void *)(inited + 32) = v76;
      *(void *)(inited + 40) = v79;
      uint64_t v40 = sub_24737C09C(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      *(void *)&v17[v37[10]] = v40;
      id v41 = objc_msgSend(v38, sel_accountProperties);
      if (!v41 || (uint64_t v42 = v41, v84[0] = 0, sub_24737CFA0(), v42, (v43 = v84[0]) == 0))
      {
        unint64_t v43 = sub_247360FA8(MEMORY[0x263F8EE78]);
        swift_bridgeObjectRelease();
      }
      *(void *)&v17[v82[11]] = v43;
      if (v26 != sub_24737CFE0() || v28 != v44)
      {
        char v45 = sub_24737D270();
        swift_bridgeObjectRelease();
        if (v45)
        {
LABEL_13:
          swift_bridgeObjectRelease();
LABEL_14:
          *(void *)&v83[0] = sub_24737CFE0();
          *((void *)&v83[0] + 1) = v47;
          id v48 = objc_msgSend(v38, sel_objectForKeyedSubscript_, sub_24737D290());
          swift_unknownObjectRelease();
          if (v48)
          {
            sub_24737D150();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v83, 0, sizeof(v83));
          }
          sub_247374ECC((uint64_t)v83, (uint64_t)v84, &qword_269249060);
          if (!v84[3])
          {
            sub_247378698((uint64_t)v84);
            goto LABEL_32;
          }
          if ((swift_dynamicCast() & 1) == 0)
          {
LABEL_32:
            unint64_t v63 = sub_247360FA8(MEMORY[0x263F8EE78]);
LABEL_33:
            uint64_t v64 = v73;
            uint64_t v65 = v72;
            uint64_t v66 = v74;
            uint64_t v67 = v82;
            *(void *)&v17[v82[12]] = v63;
            uint64_t v68 = AccountSuggestion.dictionaryRepresentation()();

            uint64_t v69 = v78;
            swift_bridgeObjectRelease();
            *(void *)&v17[v69] = v68;
            v17[v66] = 1;
            sub_247368BAC((uint64_t)v17, v64);
            (*(void (**)(uint64_t, void, uint64_t, int *))(v65 + 56))(v64, 0, 1, v67);
            return (id)sub_24736F48C((uint64_t)v17);
          }
          id result = objc_msgSend(self, sel_defaultStore);
          if (result)
          {
            uint64_t v58 = result;
            unint64_t v59 = (void *)sub_24737CFD0();
            swift_bridgeObjectRelease();
            id v60 = objc_msgSend(v58, sel_accountWithIdentifier_, v59);

            if (v60)
            {
              id v61 = [v60 (SEL)0x265210B79];
              if (v61 && (unint64_t v62 = v61, v84[0] = 0, sub_24737CFA0(), v62, (v63 = v84[0]) != 0))
              {
              }
              else
              {
                unint64_t v63 = sub_247360FA8(MEMORY[0x263F8EE78]);
                swift_bridgeObjectRelease();
              }
              goto LABEL_33;
            }
            goto LABEL_32;
          }
          goto LABEL_38;
        }
        if (v26 != sub_24737CFE0() || v28 != v46)
        {
          char v70 = sub_24737D270();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v70 & 1) == 0) {
            goto LABEL_32;
          }
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_26B12A540 != -1) {
    swift_once();
  }
  uint64_t v49 = v77;
  uint64_t v50 = __swift_project_value_buffer(v77, (uint64_t)qword_26B12A4E8);
  swift_beginAccess();
  (*((void (**)(char *, uint64_t, uint64_t))v81 + 2))(v80, v50, v49);
  unint64_t v51 = v21;
  uint64_t v52 = sub_24737CE30();
  os_log_type_t v53 = sub_24737D0B0();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    unint64_t v55 = (void *)swift_slowAlloc();
    uint64_t v73 = v25;
    uint64_t v72 = v14;
    *(_DWORD *)uint64_t v54 = 138412290;
    *(void *)&v83[0] = v51;
    char v56 = v51;
    uint64_t v14 = v72;
    uint64_t v25 = v73;
    sub_24737D120();
    *unint64_t v55 = v51;

    _os_log_impl(&dword_24735E000, v52, v53, "unable to initialize with the acount: %@", v54, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249080);
    swift_arrayDestroy();
    MEMORY[0x24C5526D0](v55, -1, -1);
    uint64_t v57 = v54;
    uint64_t v49 = v77;
    MEMORY[0x24C5526D0](v57, -1, -1);
  }
  else
  {

    uint64_t v52 = v51;
  }

  (*((void (**)(char *, uint64_t))v81 + 1))(v80, v49);
  swift_bridgeObjectRelease();
  return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v14 + 56))(v25, 1, 1, v82);
}

void ACAccount.init(accountType:suggestion:)(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAccountType_, a1);
  if (!v3) {
    goto LABEL_31;
  }
  id v4 = v3;
  uint64_t v5 = (void *)sub_24737CFD0();
  objc_msgSend(v4, sel_setUsername_, v5);

  uint64_t v21 = a2;
  uint64_t v6 = *(void *)(a2 + *(int *)(type metadata accessor for AccountSuggestion() + 44));
  uint64_t v23 = v6 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v6 + 64);
  int64_t v24 = (unint64_t)(v7 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v14 = v13 | (v10 << 6);
  while (2)
  {
    uint64_t v15 = *(void *)(v6 + 56);
    uint64_t v16 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    uint64_t v17 = v16[1];
    *(void *)&long long v25 = *v16;
    *((void *)&v25 + 1) = v17;
    sub_24736F860(v15 + 32 * v14, (uint64_t)v26);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_247374ECC((uint64_t)&v25, (uint64_t)v27, &qword_26B12A5A0);
      if (!v27[1])
      {
        swift_release();

        sub_24736F48C(v21);
        return;
      }
      sub_247374C74(&v28, &v25);
      __swift_project_boxed_opaque_existential_0(&v25, *((uint64_t *)&v26[0] + 1));
      uint64_t v11 = sub_24737D260();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v25);
      uint64_t v12 = (void *)sub_24737CFD0();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setAccountProperty_forKey_, v11, v12);
      swift_unknownObjectRelease();

      if (v9) {
        goto LABEL_7;
      }
LABEL_9:
      int64_t v18 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v18 < v24)
      {
        unint64_t v19 = *(void *)(v23 + 8 * v18);
        if (v19) {
          goto LABEL_12;
        }
        int64_t v20 = v10 + 2;
        ++v10;
        if (v18 + 1 < v24)
        {
          unint64_t v19 = *(void *)(v23 + 8 * v20);
          if (v19) {
            goto LABEL_15;
          }
          int64_t v10 = v18 + 1;
          if (v18 + 2 < v24)
          {
            unint64_t v19 = *(void *)(v23 + 8 * (v18 + 2));
            if (v19)
            {
              v18 += 2;
              goto LABEL_12;
            }
            int64_t v20 = v18 + 3;
            int64_t v10 = v18 + 2;
            if (v18 + 3 < v24) {
              break;
            }
          }
        }
      }
LABEL_26:
      unint64_t v9 = 0;
      memset(v26, 0, sizeof(v26));
      long long v25 = 0u;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v20);
    if (v19)
    {
LABEL_15:
      int64_t v18 = v20;
LABEL_12:
      unint64_t v9 = (v19 - 1) & v19;
      unint64_t v14 = __clz(__rbit64(v19)) + (v18 << 6);
      int64_t v10 = v18;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v18 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v18 >= v24)
    {
      int64_t v10 = v24 - 1;
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v20;
    if (v19) {
      goto LABEL_12;
    }
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
}

uint64_t static AccountSuggestion.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24737D270();
  }
}

AccountSuggestions::AccountSuggestion::Source_optional __swiftcall AccountSuggestion.Source.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (AccountSuggestions::AccountSuggestion::Source_optional)rawValue;
}

uint64_t type metadata accessor for AccountSuggestion()
{
  uint64_t result = qword_26B12A508;
  if (!qword_26B12A508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL sub_2473771A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2473771B4()
{
  return sub_24737D2E0();
}

uint64_t sub_2473771FC()
{
  return sub_24737D2D0();
}

uint64_t sub_247377228()
{
  return sub_24737D2E0();
}

AccountSuggestions::AccountSuggestion::Source_optional sub_24737726C(Swift::Int *a1)
{
  return AccountSuggestion.Source.init(rawValue:)(*a1);
}

void sub_247377274(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_247377280()
{
  qword_26B12A758 = 0x4449657571696E75;
  qword_26B12A760 = 0xE800000000000000;
}

void sub_2473772A4()
{
  qword_26B12A768 = 0x656D616E72657375;
  qword_26B12A770 = 0xE800000000000000;
}

void sub_2473772C8()
{
  qword_26B12A728 = 0x4E79616C70736964;
  qword_26B12A730 = 0xEB00000000656D61;
}

void sub_2473772F4()
{
  BYTE5(qword_26B12A740) = 0;
  HIWORD(qword_26B12A740) = -5120;
}

void sub_247377320()
{
  qword_26B12A748 = 0x656372756F73;
  qword_26B12A750 = 0xE600000000000000;
}

void sub_247377340()
{
  qword_26B12A718 = 0x69747265706F7270;
  qword_26B12A720 = 0xEA00000000007365;
}

void sub_247377368()
{
  qword_26B12A708 = 0x676E696F6774756FLL;
  qword_26B12A710 = 0xEF746E756F636341;
}

uint64_t AccountSuggestion.accountTypeIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.username.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AccountSuggestion() + 32);
  uint64_t v4 = sub_24737CDE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AccountSuggestion.computersWithAccount.getter()
{
  type metadata accessor for AccountSuggestion();
  return swift_bridgeObjectRetain();
}

uint64_t AccountSuggestion.computersWithAccount.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AccountSuggestion() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AccountSuggestion.computersWithAccount.modify())()
{
  return nullsub_1;
}

uint64_t AccountSuggestion.propertiesDictionary.getter()
{
  type metadata accessor for AccountSuggestion();
  return swift_bridgeObjectRetain();
}

uint64_t AccountSuggestion.propertiesDictionary.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AccountSuggestion() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AccountSuggestion.propertiesDictionary.modify())()
{
  return nullsub_1;
}

uint64_t AccountSuggestion.outgoingAccountProperties.getter()
{
  type metadata accessor for AccountSuggestion();
  return swift_bridgeObjectRetain();
}

uint64_t AccountSuggestion.outgoingAccountProperties.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AccountSuggestion() + 48);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AccountSuggestion.outgoingAccountProperties.modify())()
{
  return nullsub_1;
}

uint64_t AccountSuggestion.hasAccountLocally.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AccountSuggestion() + 56));
}

uint64_t AccountSuggestion.hasAccountLocally.setter(char a1)
{
  uint64_t result = type metadata accessor for AccountSuggestion();
  *(unsigned char *)(v1 + *(int *)(result + 56)) = a1;
  return result;
}

uint64_t (*AccountSuggestion.hasAccountLocally.modify())()
{
  return nullsub_1;
}

uint64_t sub_247377770()
{
  v16[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(self, sel_defaultStore);
  if (!v1) {
    __break(1u);
  }
  char v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24737D8E0;
  uint64_t v4 = *(void *)(v0 + 24);
  *(void *)(v3 + 32) = *(void *)(v0 + 16);
  *(void *)(v3 + 40) = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_24737D070();
  swift_bridgeObjectRelease();
  v16[0] = 0;
  id v6 = objc_msgSend(v2, sel_accountsWithAccountTypeIdentifiers_error_, v5, v16);

  id v7 = v16[0];
  if (v6)
  {
    sub_247374D7C(0, &qword_26B12A660);
    unint64_t v8 = sub_24737D080();
    id v9 = v7;

    MEMORY[0x270FA5388](v10);
    v15[2] = v0;
    uint64_t v11 = sub_2473779F0(sub_24737CD60, (uint64_t)v15, v8);
    swift_bridgeObjectRelease();
    if (v11)
    {

      return 1;
    }
  }
  else
  {
    id v13 = v16[0];
    unint64_t v14 = (void *)sub_24737CD80();

    swift_willThrow();
  }
  return 0;
}

uint64_t sub_247377948(id *a1, uint64_t a2)
{
  id v3 = objc_msgSend(*a1, sel_username);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_24737CFE0();
    uint64_t v7 = v6;

    if (v5 == *(void *)(a2 + 32) && v7 == *(void *)(a2 + 40)) {
      char v9 = 1;
    }
    else {
      char v9 = sub_24737D270();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

void *sub_2473779F0(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_24737D200())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C5520D0](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      char v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

NSArray __swiftcall AccountSuggestion.sortedComputers()()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AccountSuggestion() + 40));
  swift_bridgeObjectRetain_n();
  char v2 = sub_24737B024(v1);
  swift_bridgeObjectRelease();
  uint64_t v5 = v2;
  sub_24737B10C((uint64_t *)&v5);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_24737D070();
  swift_release();
  return (NSArray)v3;
}

uint64_t AccountSuggestion.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24737D000();
  return swift_bridgeObjectRelease();
}

uint64_t AccountSuggestion.hashValue.getter()
{
  return sub_24737D2E0();
}

uint64_t sub_247377CA4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_247377CB0()
{
  return sub_24737D2E0();
}

uint64_t sub_247377D0C()
{
  swift_bridgeObjectRetain();
  sub_24737D000();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247377D64()
{
  return sub_24737D2E0();
}

uint64_t sub_247377DBC(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24737D270();
  }
}

uint64_t sub_247377DEC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_247377DFC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_247377E38(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247377E60(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_247377ED8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24737D120();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_247377ED8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247377FAC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24736F860((uint64_t)v12, *a3);
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
      sub_24736F860((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_247377FAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24737D130();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247378168(a5, a6);
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
  uint64_t v8 = sub_24737D1E0();
  if (!v8)
  {
    sub_24737D1F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24737D240();
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

uint64_t sub_247378168(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247378200(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2473783E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2473783E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247378200(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247378378(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24737D1C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24737D1F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24737D040();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24737D240();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24737D1F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247378378(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A600);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2473783E0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A600);
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
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

unsigned char **sub_247378530(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_247378540(uint64_t (*a1)(void))
{
  return a1();
}

void sub_247378568(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24737D120();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_247378620(uint64_t a1, uint64_t a2)
{
  sub_24737D2C0();
  sub_24737D000();
  uint64_t v4 = sub_24737D2E0();
  return sub_2473786F8(a1, a2, v4);
}

uint64_t sub_247378698(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249060);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2473786F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24737D270() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24737D270() & 1) == 0);
    }
  }
  return v6;
}

double sub_2473787DC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_247378620(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24737A600();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_247374C74((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_2473799E4(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_2473788E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_247378620(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24737A7E8();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for AccountSuggestion();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_247368D54(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_247379BD4(v8, v11, (uint64_t (*)(void))type metadata accessor for AccountSuggestion);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for AccountSuggestion();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_247378A84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_247378620(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24737AA54();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_24737CDE0();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_247379BD4(v8, v11, MEMORY[0x263F07490]);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_24737CDE0();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_247378C40(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249088);
  uint64_t v6 = sub_24737D220();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_247374C74(v24, v35);
      }
      else
      {
        sub_24736F860((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24737D2C0();
      sub_24737D000();
      uint64_t result = sub_24737D2E0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_247374C74(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_247378F40(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for AccountSuggestion();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A668);
  int v43 = a2;
  uint64_t v9 = sub_24737D220();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  id v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_247368D54(v30, (uint64_t)v7);
    }
    else
    {
      sub_247368BAC(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_24737D2C0();
    sub_24737D000();
    uint64_t result = sub_24737D2E0();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_247368D54((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_2473792E4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_24737CDE0();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  id v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F0);
  int v47 = a2;
  uint64_t v8 = sub_24737D220();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  char v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  unint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_24737D2C0();
    sub_24737D000();
    uint64_t result = sub_24737D2E0();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

uint64_t sub_2473796CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692490B8);
  char v36 = a2;
  uint64_t v6 = sub_24737D220();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24737D2C0();
    sub_24737D000();
    uint64_t result = sub_24737D2E0();
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
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_2473799E4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24737D170();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24737D2C0();
        swift_bridgeObjectRetain();
        sub_24737D000();
        uint64_t v10 = sub_24737D2E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_247379BBC(unint64_t a1, uint64_t a2)
{
  return sub_247379BD4(a1, a2, MEMORY[0x263F07490]);
}

unint64_t sub_247379BD4(unint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v9 = ~v6;
    uint64_t result = sub_24737D170();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v10 = (result + 1) & v9;
      while (1)
      {
        sub_24737D2C0();
        swift_bridgeObjectRetain();
        sub_24737D000();
        uint64_t v11 = sub_24737D2E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v9;
        if (v4 >= (uint64_t)v10) {
          break;
        }
        if (v12 < v10) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (_OWORD *)(v13 + 16 * v4);
        uint64_t v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1) {
          *uint64_t v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(a3(0) - 8) + 72);
        int64_t v18 = v17 * v4;
        uint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v9;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v10) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    BOOL v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    BOOL v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *BOOL v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_247379DF4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24737D170();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24737D2C0();
        swift_bridgeObjectRetain();
        sub_24737D000();
        uint64_t v9 = sub_24737D2E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_247379FCC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_247378620(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24737A600();
      goto LABEL_7;
    }
    sub_247378C40(v15, a4 & 1);
    unint64_t v21 = sub_247378620(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_24737D2B0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return sub_247374C74(a1, v19);
  }
LABEL_13:
  sub_24737A404(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_24737A120(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_247378620(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24737A7E8();
      goto LABEL_7;
    }
    sub_247378F40(v15, a4 & 1);
    unint64_t v22 = sub_247378620(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24737D2B0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for AccountSuggestion() - 8) + 72) * v12;
    return sub_24737CCFC(a1, v20);
  }
LABEL_13:
  sub_24737A470(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24737A284(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_247378620(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24737AA54();
      goto LABEL_7;
    }
    sub_2473792E4(v15, a4 & 1);
    unint64_t v26 = sub_247378620(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24737D2B0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_24737CDE0();
    uint64_t v21 = *(void *)(v20 - 8);
    unint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_24737A508(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

_OWORD *sub_24737A404(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_247374C74(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_24737A470(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for AccountSuggestion();
  uint64_t result = sub_247368D54(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_24737A508(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_24737CDE0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_24737A5B8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

void *sub_24737A600()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249088);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24737D210();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_24736F860(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_247374C74(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

void *sub_24737A7E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AccountSuggestion();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A668);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24737D210();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  char v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_247368BAC(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    int64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *int64_t v22 = v19;
    v22[1] = v20;
    sub_247368D54((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24737AA54()
{
  uint64_t v35 = sub_24737CDE0();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F0);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_24737D210();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    int64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *int64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24737AD18()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692490B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24737D210();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

size_t sub_24737AED0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A670);
  uint64_t v3 = *(void *)(type metadata accessor for AccountSuggestion() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_24737BBD0(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_247374C84();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_24737B024(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12A5F8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_24737BE9C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_247374C84();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_24737B10C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247373DC8(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_24737B178(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_24737B178(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_24737D250();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_24737B864(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          BOOL v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_24737B934((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            BOOL v97 = sub_2473730AC((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_24737D090();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    unint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_24737D270();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    unint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      unint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_24737D270()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_247372DB4(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_247372DB4((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    int64_t v43 = &v11[16 * v41 + 32];
    *(void *)int64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        unint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        int v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        unint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        long long v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_24737B934((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)unint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        BOOL v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_24737D270() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)BOOL v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_24737D1F0();
  __break(1u);
  return result;
}

uint64_t sub_24737B864(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_24737D270(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24737B934(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_24737D270() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_24737D270() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_247372FF0((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_24737D240();
  __break(1u);
  return result;
}

uint64_t sub_24737BBD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for AccountSuggestion();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  BOOL v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 64);
  uint64_t v17 = a4 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 32);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 32);
  uint64_t v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    sub_247368BAC(*(void *)(v35 + 56) + v29 * v25, (uint64_t)v12);
    sub_247368D54((uint64_t)v12, (uint64_t)v15);
    uint64_t result = sub_247368D54((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24737BE9C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_24737C09C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24737D0A0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24736F8BC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_24737C138()
{
  unint64_t result = qword_2692490A8;
  if (!qword_2692490A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692490A8);
  }
  return result;
}

uint64_t sub_24737C18C()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_24737C19C()
{
  unint64_t result = qword_2692490B0;
  if (!qword_2692490B0)
  {
    type metadata accessor for AccountSuggestion();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692490B0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AccountSuggestion(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    uint64_t v11 = a3[8];
    int64_t v19 = (char *)a2 + v11;
    uint64_t v20 = (char *)a1 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v12 = sub_24737CDE0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v20, v19, v12);
    uint64_t v14 = a3[10];
    *((unsigned char *)v4 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *(void *)((char *)v4 + v14) = *(void *)((char *)a2 + v14);
    uint64_t v15 = a3[12];
    *(void *)((char *)v4 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *(void *)((char *)v4 + v15) = *(void *)((char *)a2 + v15);
    uint64_t v16 = a3[14];
    *(void *)((char *)v4 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AccountSuggestion(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_24737CDE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AccountSuggestion(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  uint64_t v10 = a3[8];
  uint64_t v17 = (char *)a2 + v10;
  unint64_t v18 = (char *)a1 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v11 = sub_24737CDE0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v18, v17, v11);
  uint64_t v13 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AccountSuggestion(void *a1, void *a2, int *a3)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24737CDE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[14]) = *((unsigned char *)a2 + a3[14]);
  return a1;
}

_OWORD *initializeWithTake for AccountSuggestion(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[8];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24737CDE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *((unsigned char *)a1 + v14) = *((unsigned char *)a2 + v14);
  return a1;
}

void *assignWithTake for AccountSuggestion(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24737CDE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[14]) = *((unsigned char *)a2 + a3[14]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24737C914);
}

uint64_t sub_24737C914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24737CDE0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AccountSuggestion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24737C9D8);
}

uint64_t sub_24737C9D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24737CDE0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24737CA80()
{
  uint64_t result = sub_24737CDE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccountSuggestion.Source(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountSuggestion.Source(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x24737CCB4);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_24737CCDC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24737CCE4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountSuggestion.Source()
{
  return &type metadata for AccountSuggestion.Source;
}

uint64_t sub_24737CCFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24737CD60(id *a1)
{
  return sub_247377948(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_24737CD80()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24737CD90()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24737CDA0()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_24737CDB0()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_24737CDC0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24737CDD0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24737CDE0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24737CDF0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24737CE00()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24737CE10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24737CE20()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24737CE30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24737CE40()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24737CE50()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24737CE60()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_24737CE70()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24737CE80()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24737CE90()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24737CEA0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_24737CEB0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_24737CEC0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24737CED0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24737CEE0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24737CEF0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24737CF00()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24737CF10()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_24737CF20()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24737CF30()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24737CF40()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24737CF50()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_24737CF60()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t sub_24737CF70()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_24737CF80()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24737CF90()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24737CFA0()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_24737CFB0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24737CFC0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24737CFD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24737CFE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24737CFF0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24737D000()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24737D010()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24737D020()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24737D030()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24737D040()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24737D050()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24737D070()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24737D080()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24737D090()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24737D0A0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24737D0B0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24737D0C0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24737D0D0()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_24737D0E0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24737D0F0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24737D100()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24737D110()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24737D120()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24737D130()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24737D140()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_24737D150()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24737D160()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24737D170()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24737D180()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24737D190()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24737D1A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24737D1B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24737D1C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24737D1D0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24737D1E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24737D1F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24737D200()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24737D210()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24737D220()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24737D230()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24737D240()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24737D250()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24737D260()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24737D270()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24737D280()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_24737D290()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_24737D2A0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24737D2B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24737D2C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24737D2D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24737D2E0()
{
  return MEMORY[0x270F9FC90]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}