uint64_t sub_24738206C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2473820E0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AccountsUISettings12AccountGroup__accounts;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B578);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_247382194@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountGroup(0);
  uint64_t result = sub_2473BD320();
  *a1 = result;
  return result;
}

uint64_t sub_2473821D4()
{
  uint64_t v0 = sub_2473BD310();
  __swift_allocate_value_buffer(v0, qword_26B12B518);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B12B518);
  return sub_2473BD300();
}

uint64_t static AccountsUIModel.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2473BD310();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12B518);
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

uint64_t static AccountsUIModel.logger.setter(uint64_t a1)
{
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2473BD310();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static AccountsUIModel.logger.modify())()
{
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2473BD310();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_247382520()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2473825D4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_247382628@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t sub_247382680(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_2473826EC())()
{
  return j__swift_endAccess;
}

id sub_24738274C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AccountsUIModel(0)), sel_init);
  qword_26B12B538 = (uint64_t)result;
  return result;
}

id AccountsUIModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static AccountsUIModel.shared.getter()
{
  if (qword_26B12B470 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_26B12B538;
  return v0;
}

void static AccountsUIModel.shared.setter(uint64_t a1)
{
  if (qword_26B12B470 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26B12B538;
  qword_26B12B538 = a1;
}

uint64_t (*static AccountsUIModel.shared.modify())()
{
  if (qword_26B12B470 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_247382940(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  id v3 = v17[0];
  if (!v17[0])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v5 = v1;
    sub_2473BD380();
    uint64_t v19 = 0;
    *(_OWORD *)v17 = 0u;
    long long v18 = 0u;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24738D590((uint64_t)v17, (uint64_t)v16);
    id v6 = v5;
    sub_2473BD380();
    sub_24738EAF8((uint64_t)v17, (uint64_t *)&unk_26B12B3A0);
    return;
  }
  id v4 = objc_msgSend(v17[0], sel_accountPropertyForKey_, *MEMORY[0x263EFAD68]);
  if (v4)
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)v17 = 0u;
    long long v18 = 0u;
  }
  sub_24738EAF8((uint64_t)v17, &qword_26B12B5F0);
  *((unsigned char *)v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile) = v4 != 0;
  sub_247388F54(v3);
  v8 = v7;
  swift_getKeyPath();
  swift_getKeyPath();
  v17[0] = v8;
  id v9 = v1;
  sub_2473BD380();
  id v10 = objc_msgSend(a1, sel_identifier);
  id v11 = objc_msgSend(v3, sel_identifier);
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      sub_2473911B4(0, &qword_2692495C0);
      id v13 = v10;
      char v14 = sub_2473BDC90();

      if (v14) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    v12 = v10;
  }
  else if (!v11)
  {
    goto LABEL_15;
  }

LABEL_14:
  sub_2473891C4(v3, (uint64_t)v17);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24738D590((uint64_t)v17, (uint64_t)v16);
  id v15 = v9;
  sub_2473BD380();
  sub_24738EAF8((uint64_t)v17, (uint64_t *)&unk_26B12B3A0);
LABEL_15:
}

uint64_t sub_247382C20()
{
  return sub_2473833BC();
}

void sub_247382C34(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = a1;
  id v4 = v1;
  sub_2473BD380();
  sub_247382940(v5);
}

uint64_t sub_247382D0C@<X0>(unsigned char *a1@<X8>)
{
  return sub_247389F58(a1);
}

uint64_t sub_247382D20(unsigned char *a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*a1 == 1)
  {
    sub_2473862E0();
    sub_2473BD280();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_2473BD380();
}

uint64_t sub_247382DB0()
{
  return sub_2473834DC();
}

uint64_t sub_247382DC4(char a1)
{
  if (a1)
  {
    sub_2473862E0();
    sub_2473BD280();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  return sub_2473BD380();
}

uint64_t (*sub_247382E54(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 9);
  return sub_247382EF4;
}

uint64_t sub_247382EF4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  id v3 = *(void **)a1;
  if (v2 == 1)
  {
    sub_2473862E0();
    sub_2473BD280();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(a1 + 9) = v2;
  id v4 = v3;
  return sub_2473BD380();
}

uint64_t sub_247382F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_247382FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247386AF4(a1, a2, a3, a4, &qword_269249580, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_247382FC4()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_247382FD8(uint64_t a1)
{
  return sub_247386D08(a1, &qword_269249580, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t (*sub_247382FF4(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249580);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B588);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_247383108()
{
  return sub_2473834DC();
}

uint64_t sub_24738311C@<X0>(unsigned char *a1@<X8>)
{
  return sub_247389F58(a1);
}

uint64_t sub_247383130(uint64_t a1, void **a2)
{
  return sub_247389FE8(a1, a2);
}

uint64_t sub_247383144()
{
  return sub_2473834DC();
}

uint64_t sub_247383158()
{
  return sub_24738355C();
}

uint64_t (*sub_24738316C(void *a1))()
{
  int v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473831FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_247383210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247386AF4(a1, a2, a3, a4, &qword_269249580, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_24738322C()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_247383240(uint64_t a1)
{
  return sub_247386D08(a1, &qword_269249580, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, (uint64_t *)&unk_26B12B588);
}

uint64_t (*sub_24738325C(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249580);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B588);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_24738336C()
{
  return sub_2473834DC();
}

uint64_t sub_247383380()
{
  return sub_2473834DC();
}

uint64_t sub_247383394()
{
  return sub_2473833BC();
}

uint64_t sub_2473833A8()
{
  return sub_2473833BC();
}

uint64_t sub_2473833BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_247383428()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  return swift_release();
}

uint64_t sub_2473834A0@<X0>(unsigned char *a1@<X8>)
{
  return sub_247389F58(a1);
}

uint64_t sub_2473834B4(uint64_t a1, void **a2)
{
  return sub_247389FE8(a1, a2);
}

uint64_t sub_2473834C8()
{
  return sub_2473834DC();
}

uint64_t sub_2473834DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_247383548()
{
  return sub_24738355C();
}

uint64_t sub_24738355C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_2473BD380();
}

uint64_t (*sub_2473835C4(void *a1))()
{
  int v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

void sub_247383650(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_2473836B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_2473836CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247386AF4(a1, a2, a3, a4, &qword_269249580, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_2473836E8()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, (uint64_t *)&unk_26B12B588);
}

uint64_t sub_2473836FC(uint64_t a1)
{
  return sub_247386D08(a1, &qword_269249580, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, (uint64_t *)&unk_26B12B588);
}

uint64_t (*sub_247383718(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249580);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B588);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_247383828()
{
  return sub_2473833BC();
}

void sub_24738383C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  if (!v9[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v1 = sub_2473864D0();
  int v2 = (void *)sub_2473BDA90();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_monitoredAccountWithIdentifier_, v2);

  if (!v3)
  {
LABEL_5:
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2473BD370();
    swift_release();
    swift_release();
    uint64_t v5 = v9;
    swift_getKeyPath();
    swift_getKeyPath();
    id v8 = v0;
    sub_2473BD380();
    sub_247382940(v9);
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  sub_2473BD370();
  swift_release();
  swift_release();
  uint64_t v5 = v9;
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v4;
  id v7 = v0;
  sub_2473BD380();
  sub_247382940(v9);

LABEL_6:
}

uint64_t sub_247383A74()
{
  return sub_2473833BC();
}

void sub_247383A88()
{
  uint64_t v1 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile) & 1) == 0)
  {
    if (!sub_24738D490())
    {
      uint64_t v5 = (void *)sub_2473BDA90();
      id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v5);

      if (v3)
      {
LABEL_13:
        id v6 = (void *)sub_2473BDA90();
        id v7 = (void *)sub_2473BDA90();
        id v8 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v6, v7, 0);

        sub_2473BDAD0();
        return;
      }
      goto LABEL_15;
    }
    if (*(unsigned char *)(v0 + v1) != 1) {
      return;
    }
  }
  if (!sub_24738D490())
  {
    id v4 = (void *)sub_2473BDA90();
    id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v4);

    if (v3) {
      goto LABEL_13;
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  if (*(unsigned char *)(v0 + v1) == 1 && sub_24738D490())
  {
    int v2 = (void *)sub_2473BDA90();
    id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
}

uint64_t sub_247383CE8()
{
  uint64_t result = sub_2473BDA90();
  qword_26924A148 = result;
  return result;
}

uint64_t sub_247383D20()
{
  uint64_t result = sub_2473BDA90();
  qword_26924A150 = result;
  return result;
}

id AccountsUIModel.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B578);
  uint64_t v68 = *(void *)(v1 - 8);
  uint64_t v69 = v1;
  MEMORY[0x270FA5388](v1);
  v67 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B570);
  uint64_t v65 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  MEMORY[0x270FA5388](v3);
  v64 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B568);
  uint64_t v62 = *(void *)(v5 - 8);
  uint64_t v63 = v5;
  MEMORY[0x270FA5388](v5);
  v61 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B550);
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  v58 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B548);
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  v55 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B560);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  id v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B588);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B598);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  long long v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost] = 0;
  uint64_t v19 = &v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__selectedAccount];
  *(void *)&long long aBlock = 0;
  v20 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B408);
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v18, v15);
  *(void *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_toDeleteAccount] = 0;
  v21 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown];
  LOBYTE(aBlock) = 0;
  sub_2473BD330();
  v22 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v22(v21, v14, v11);
  v23 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addOtherShown];
  LOBYTE(aBlock) = 0;
  sub_2473BD330();
  v22(v23, v14, v11);
  v24 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown];
  LOBYTE(aBlock) = 0;
  sub_2473BD330();
  v22(v24, v14, v11);
  v25 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__contactMergeAlertShown];
  LOBYTE(aBlock) = 0;
  sub_2473BD330();
  v22(v25, v14, v11);
  v26 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__detailsPaneShown];
  LOBYTE(aBlock) = 0;
  sub_2473BD330();
  v22(v26, v14, v11);
  v27 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountSetupView];
  *(void *)&long long aBlock = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3B0);
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v27, v10, v54);
  v28 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__persistentDetailModel];
  *(void *)&long long aBlock = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B0C0);
  v29 = v55;
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v28, v29, v57);
  v30 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountView];
  v72 = 0;
  long long aBlock = 0u;
  long long v71 = 0u;
  sub_24738D590((uint64_t)&aBlock, (uint64_t)v75);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B3A0);
  v31 = v58;
  sub_2473BD330();
  sub_24738EAF8((uint64_t)&aBlock, (uint64_t *)&unk_26B12B3A0);
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v30, v31, v60);
  v32 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView];
  LOBYTE(aBlock) = 1;
  sub_2473BD330();
  v22(v32, v14, v11);
  v33 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountGroups];
  uint64_t v34 = MEMORY[0x263F8EE78];
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3C0);
  v35 = v61;
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v33, v35, v63);
  v36 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountPath];
  *(void *)&long long aBlock = v34;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B3D0);
  v37 = v64;
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v36, v37, v66);
  v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile] = 0;
  v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter] = 0;
  *(void *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore] = 0;
  *(void *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore] = 0;
  v38 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accounts];
  *(void *)&long long aBlock = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3E0);
  v39 = v67;
  sub_2473BD330();
  uint64_t v40 = v69;
  v41 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
  v41(v38, v39, v69);
  v42 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts];
  *(void *)&long long aBlock = v34;
  sub_2473BD330();
  v41(v42, v39, v40);
  v43 = (uint64_t *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager];
  uint64_t *v43 = sub_24738D714();
  v43[1] = v44;

  v45 = (objc_class *)type metadata accessor for AccountsUIModel(0);
  v74.receiver = v20;
  v74.super_class = v45;
  id v46 = objc_msgSendSuper2(&v74, sel_init);
  id v47 = sub_2473864D0();
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = v46;
  v72 = sub_24738E57C;
  uint64_t v73 = v48;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v71 = sub_2473879E0;
  *((void *)&v71 + 1) = &block_descriptor;
  v49 = _Block_copy(&aBlock);
  id v50 = v46;
  swift_release();
  objc_msgSend(v47, sel_registerWithCompletion_, v49);
  _Block_release(v49);

  return v50;
}

uint64_t sub_247384724(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2473847BC(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (sub_2473BDB40())
  {
    sub_247384C1C(0);
    sub_2473862E0();
    sub_2473BD280();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v33[0]) = 1;
    id v6 = v3;
    sub_2473BD380();
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t v7 = swift_release();
  MEMORY[0x270FA5388](v7);
  unint64_t v29 = a1;
  unint64_t v30 = a2;
  uint64_t v8 = sub_247387168((uint64_t (*)(id *))sub_24738E59C, (uint64_t)v28, (unint64_t)v33[0]);
  swift_bridgeObjectRelease();
  if (v8)
  {
    id v9 = v8;
    sub_247384C1C(v8);

    return;
  }
  uint64_t v10 = sub_2473BD200();
  if (v11 >> 60 != 15)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    char v14 = self;
    uint64_t v15 = (void *)sub_2473BD210();
    v33[0] = 0;
    id v16 = objc_msgSend(v14, sel_propertyListWithData_options_format_error_, v15, 0, 0, v33);

    if (!v16)
    {
      id v21 = v33[0];
      v22 = (void *)sub_2473BD1C0();

      swift_willThrow();
      sub_24738E5BC(v12, v13);

      return;
    }
    id v17 = v33[0];
    sub_2473BDD10();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269249588);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_16:
      sub_24738E5BC(v12, v13);
      return;
    }
    uint64_t v18 = v34;
    unint64_t v31 = 0xD000000000000014;
    unint64_t v32 = 0x80000002473C3340;
    sub_2473BDD50();
    if (*(void *)(v18 + 16) && (unint64_t v19 = sub_24738A9F8((uint64_t)v33), (v20 & 1) != 0))
    {
      sub_24738E67C(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v34);
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_24738E628((uint64_t)v33);
    if (*((void *)&v35 + 1))
    {
      if (swift_dynamicCast())
      {
        unint64_t v24 = v31;
        unint64_t v23 = v32;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_2473BD370();
        swift_release();
        uint64_t v25 = swift_release();
        id v26 = v33[0];
        MEMORY[0x270FA5388](v25);
        unint64_t v29 = v24;
        unint64_t v30 = v23;
        v27 = sub_247387168((uint64_t (*)(id *))sub_247391470, (uint64_t)v28, (unint64_t)v26);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_247384C1C(v27);
        sub_24738E5BC(v12, v13);

        return;
      }
      goto LABEL_16;
    }
    sub_24738E5BC(v12, v13);
    sub_24738EAF8((uint64_t)&v34, &qword_26B12B5F0);
  }
}

void sub_247384C1C(id a1)
{
  uint64_t v3 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  uint64_t v5 = v16[2];
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_getKeyPath();
    uint64_t KeyPath = swift_getKeyPath();
    sub_2473BD370();
    swift_release();
    swift_release();
    uint64_t v7 = (uint64_t)v16;
    if (v16[2])
    {
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v8 = v16[2];
        if (v8)
        {
LABEL_5:
          *(void *)(v7 + 16) = v8 - 1;
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          swift_getKeyPath();
          id v16 = (void *)v7;
          id v9 = v3;
          sub_2473BD380();
          sub_24738383C();
          goto LABEL_6;
        }
LABEL_15:
        __break(1u);
LABEL_16:
        uint64_t v2 = sub_247392D48(0, v2[2] + 1, 1, v2);
        goto LABEL_9;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v7 = (uint64_t)sub_24738D3E4(v16);
    uint64_t v8 = *(void *)(v7 + 16);
    if (v8) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_6:
  if (!a1) {
    return;
  }
  a1 = a1;
  id v10 = objc_msgSend(a1, sel_identifier);
  if (!v10)
  {
    __break(1u);
    return;
  }
  unint64_t v11 = v10;
  uint64_t v7 = sub_2473BDAD0();
  uint64_t KeyPath = v12;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  uint64_t v2 = v16;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_16;
  }
LABEL_9:
  unint64_t v14 = v2[2];
  unint64_t v13 = v2[3];
  if (v14 >= v13 >> 1) {
    uint64_t v2 = sub_247392D48((void *)(v13 > 1), v14 + 1, 1, v2);
  }
  v2[2] = v14 + 1;
  uint64_t v15 = &v2[2 * v14];
  v15[4] = v7;
  v15[5] = KeyPath;
  swift_getKeyPath();
  swift_getKeyPath();
  v3;
  sub_2473BD380();
  sub_24738383C();
}

void sub_247384EC4(id a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2473BD310();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  id v10 = v26;
  if (!v26) {
    goto LABEL_8;
  }
  id v11 = objc_msgSend(v26, sel_identifier);

  if (!v11) {
    goto LABEL_8;
  }
  id v26 = 0;
  uint64_t v27 = 0;
  sub_2473BDAC0();

  if (!v27) {
    goto LABEL_8;
  }
  if (v26 == a1 && v27 == a2)
  {
    swift_bridgeObjectRelease();
    return;
  }
  char v12 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
LABEL_8:
    id v13 = sub_2473864D0();
    unint64_t v14 = (void *)sub_2473BDA90();
    id v15 = objc_msgSend(v13, sel_accountWithIdentifier_, v14);

    if (v15)
    {
      if (qword_26B12B530 != -1) {
        swift_once();
      }
      uint64_t v16 = __swift_project_value_buffer(v6, (uint64_t)qword_26B12B518);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
      os_log_type_t v17 = sub_2473BDC20();
      uint64_t v18 = sub_2473BD2F0();
      if (os_log_type_enabled(v18, v17))
      {
        unint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v19 = 0;
        _os_log_impl(&dword_247380000, v18, v17, "selecting added account!", v19, 2u);
        MEMORY[0x24C553A30](v19, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_getKeyPath();
      swift_getKeyPath();
      id v20 = v15;
      sub_2473BD370();
      swift_release();
      swift_release();
      id v21 = v25;
      swift_getKeyPath();
      swift_getKeyPath();
      id v25 = v15;
      id v22 = v20;
      id v23 = v3;
      sub_2473BD380();
      sub_247382940(v21);

      id v24 = v22;
      sub_247384C1C(v15);
    }
  }
}

void sub_247385260()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  uint64_t v0 = v13;
  if (v13)
  {
    id v1 = sub_2473864D0();
    id v2 = objc_msgSend(v1, sel_dataclassActionsForAccountDeletion_, v13);

    if (!v2) {
      goto LABEL_10;
    }
    type metadata accessor for Dataclass(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249598);
    sub_2473901AC((unint64_t *)&qword_2692495A0, type metadata accessor for Dataclass);
    uint64_t v3 = sub_2473BDA80();

    if (*(void *)(v3 + 16))
    {
      id v4 = (id)*MEMORY[0x263EFAC60];
      unint64_t v5 = sub_24738AA3C((uint64_t)v4);
      if (v6)
      {
        unint64_t v7 = *(void *)(*(void *)(v3 + 56) + 8 * v5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();

        id v8 = objc_msgSend(self, sel_actionWithType_, 2);
        if (!v8)
        {
          __break(1u);
          return;
        }
        id v9 = v8;
        char v10 = sub_2473854A0((uint64_t)v8, v7);

        swift_bridgeObjectRelease();
        if (v10)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          id v11 = (void (*)(void **, void))sub_2473BD360();
          BOOL *v12 = !*v12;
          v11(&v13, 0);
          swift_release();
          swift_release();
LABEL_11:

          return;
        }
LABEL_10:
        sub_247385780(0);
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
}

uint64_t sub_2473854A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_2473BDE30())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x24C553330](0, a2);
LABEL_5:
      char v6 = v5;
      sub_2473911B4(0, &qword_2692496B0);
      char v7 = sub_2473BDC90();

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
        char v14 = sub_2473BDC90();

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
      MEMORY[0x24C553330](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_2473BDC90();
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

uint64_t sub_247385628(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2473BDAD0();
  uint64_t v5 = v4;
  if (v3 == sub_2473BDAD0() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_2473BDEB0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_2473BDAD0();
    uint64_t v14 = v13;
    if (v12 == sub_2473BDAD0() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

void sub_247385780(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2473BDA00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2473BDA30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  id v12 = aBlock;
  if (aBlock)
  {
    id v13 = objc_msgSend(aBlock, sel_identifier);

    if (v13)
    {
      id aBlock = 0;
      uint64_t v35 = 0;
      sub_2473BDAC0();

      if (v35)
      {
        uint64_t v33 = a1;
        id v14 = sub_2473864D0();
        uint64_t v15 = v8;
        uint64_t v16 = v9;
        uint64_t v17 = v5;
        uint64_t v18 = (void *)sub_2473BDA90();
        swift_bridgeObjectRelease();
        id v19 = objc_msgSend(v14, sel_accountWithIdentifier_, v18);

        uint64_t v20 = v17;
        uint64_t v21 = v16;
        uint64_t v22 = v15;
        uint64_t v23 = v33;

        if (v19)
        {
          sub_2473911B4(0, &qword_26B12B5C8);
          uint64_t v32 = sub_2473BDC60();
          id v24 = (void *)swift_allocObject();
          v24[2] = v2;
          v24[3] = v19;
          v24[4] = v23;
          v38 = sub_247391238;
          v39 = v24;
          id aBlock = (id)MEMORY[0x263EF8330];
          uint64_t v35 = 1107296256;
          uint64_t v36 = sub_24739C898;
          v37 = &block_descriptor_170;
          id v25 = _Block_copy(&aBlock);
          uint64_t v31 = v22;
          id v26 = v25;
          swift_bridgeObjectRetain();
          id v27 = v2;
          id v28 = v19;
          swift_release();
          sub_2473BDA20();
          id aBlock = (id)MEMORY[0x263F8EE78];
          sub_2473901AC(&qword_26B12B5A0, MEMORY[0x263F8F030]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
          sub_247390420();
          sub_2473BDD20();
          unint64_t v29 = (void *)v32;
          MEMORY[0x24C553200](0, v11, v7, v26);
          _Block_release(v26);

          (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v4);
          (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v31);
        }
      }
    }
  }
}

void sub_247385B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_247384C1C(0);
  id v5 = sub_2473864D0();
  if (a3)
  {
    type metadata accessor for Dataclass(0);
    sub_2473911B4(0, &qword_2692496B0);
    sub_2473901AC((unint64_t *)&qword_2692495A0, type metadata accessor for Dataclass);
    uint64_t v6 = (void *)sub_2473BDA70();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v8[4] = sub_247385CC0;
  v8[5] = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_2473A8B4C;
  v8[3] = &block_descriptor_173;
  char v7 = _Block_copy(v8);
  objc_msgSend(v5, sel_removeAccount_withDataclassActions_completion_, a2, v6, v7);
  _Block_release(v7);
}

uint64_t sub_247385CC0(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_2473BD310();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = MEMORY[0x270FA5388](v3);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v8 = a2;
    if (qword_26B12B530 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)qword_26B12B518);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v9, v3);
    os_log_type_t v10 = sub_2473BDC30();
    id v11 = a2;
    id v12 = a2;
    id v13 = sub_2473BD2F0();
    os_log_type_t v14 = v10;
    if (os_log_type_enabled(v13, v10))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v21 = (uint64_t)a2;
      uint64_t v22 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v20 = v15 + 4;
      id v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249698);
      uint64_t v18 = sub_2473BDAE0();
      uint64_t v21 = sub_2473ABE34(v18, v19, &v22);
      sub_2473BDCC0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247380000, v13, v14, "Failed removal with error: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C553A30](v16, -1, -1);
      MEMORY[0x24C553A30](v15, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

BOOL static AccountsUIModel.FilterType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccountsUIModel.FilterType.hash(into:)()
{
  return sub_2473BDF00();
}

uint64_t AccountsUIModel.FilterType.hashValue.getter()
{
  return sub_2473BDF10();
}

BOOL sub_247385FF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24738600C()
{
  return sub_2473BDF10();
}

uint64_t sub_247386054()
{
  return sub_2473BDF00();
}

uint64_t sub_247386080()
{
  return sub_2473BDF10();
}

uint64_t sub_2473860C4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_247386118(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_247386168@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_2473861B8(char *a1)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t (*sub_24738620C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_247386268@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2473862E0();
  *a1 = result;
  return result;
}

uint64_t sub_247386294(void *a1, void *a2)
{
  *(void *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_2473862E0()
{
  uint64_t v1 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore;
  if (*(void *)(v0 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore);
  }
  else
  {
    uint64_t v3 = v0;
    sub_2473BD2D0();
    swift_allocObject();
    uint64_t v2 = sub_2473BD2C0();
    sub_2473BD2A0();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
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

uint64_t sub_2473863C4()
{
  return sub_24738785C();
}

uint64_t sub_2473863DC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore) = a1;
  return swift_release();
}

uint64_t (*sub_2473863F4(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = sub_2473862E0();
  return sub_24738643C;
}

uint64_t sub_24738643C(void *a1)
{
  *(void *)(a1[1] + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore) = *a1;
  return swift_release();
}

id sub_247386454@<X0>(void *a1@<X8>)
{
  id result = sub_2473864D0();
  *a1 = result;
  return result;
}

void sub_247386480(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v4 = *(id *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore);
  *(void *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore) = *a1;
  id v3 = v2;
}

id sub_2473864D0()
{
  uint64_t v1 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore];
  }
  else
  {
    if (qword_26B12AFA8 != -1) {
      swift_once();
    }
    uint64_t v4 = swift_bridgeObjectRetain();
    sub_24738D3F8(v4);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B418);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2473BE630;
    *(void *)(v5 + 32) = sub_2473BDAD0();
    *(void *)(v5 + 40) = v6;
    *(void *)(v5 + 48) = sub_2473BDAD0();
    *(void *)(v5 + 56) = v7;
    id v8 = objc_allocWithZone(MEMORY[0x263EFB248]);
    uint64_t v9 = v0;
    os_log_type_t v10 = (void *)sub_2473BDBF0();
    swift_bridgeObjectRelease();
    id v11 = (void *)sub_2473BDB70();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v8, sel_initWithAccountTypes_propertiesToPrefetch_delegate_, v10, v11, v9);

    id v13 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v12;
    id v3 = v12;

    uint64_t v2 = 0;
  }
  id v14 = v2;
  return v3;
}

uint64_t sub_247386660(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_247386674(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_2473864D0();
  return sub_2473866BC;
}

void sub_2473866BC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore);
  *(void *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore) = v2;
}

uint64_t sub_2473866D8()
{
  return sub_2473833BC();
}

uint64_t sub_2473866EC(unint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v8 = a1;
  id v3 = v1;
  sub_2473BD380();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  uint64_t v4 = (unsigned __int8 *)&v3[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter];
  swift_beginAccess();
  unsigned __int8 v7 = *v4;
  uint64_t v5 = _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(a1, &v7);
  swift_bridgeObjectRelease();
  return sub_247386848(v5);
}

uint64_t sub_2473867F4@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_247386808()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_247386848(v0);
}

uint64_t sub_247386834()
{
  return sub_2473833BC();
}

uint64_t sub_247386848(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v1;
  sub_2473BD380();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  sub_247387A84(a1);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  return sub_2473BD380();
}

uint64_t (*sub_247386958(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  *a1 = a1[1];
  return sub_2473869F8;
}

uint64_t sub_2473869F8(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_247386848(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_247386848(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247386A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, (uint64_t *)&unk_26B12B578);
}

uint64_t sub_247386A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_247386AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247386AF4(a1, a2, a3, a4, &qword_2692495B0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, (uint64_t *)&unk_26B12B578);
}

uint64_t sub_247386AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2473BD350();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_247386C70()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, (uint64_t *)&unk_26B12B578);
}

uint64_t sub_247386C84(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_247386CEC(uint64_t a1)
{
  return sub_247386D08(a1, &qword_2692495B0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, (uint64_t *)&unk_26B12B578);
}

uint64_t sub_247386D08(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2473BD350();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_247386E38(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692495B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B578);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

void sub_247386F48(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
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
    sub_2473BD350();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_2473BD350();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

id sub_2473870B8(id *a1, uint64_t a2, uint64_t a3)
{
  id result = objc_msgSend(*a1, sel_identifier);
  if (result)
  {
    size_t v6 = result;
    uint64_t v7 = sub_2473BDAD0();
    uint64_t v9 = v8;

    if (a3)
    {
      if (v7 == a2 && v9 == a3) {
        LOBYTE(a3) = 1;
      }
      else {
        LOBYTE(a3) = sub_2473BDEB0();
      }
    }
    swift_bridgeObjectRelease();
    return (id)(a3 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_247387168(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_2473BDE30())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C553330](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
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

uint64_t sub_247387290(unint64_t a1, void *a2, uint8_t *a3)
{
  v45 = a3;
  uint64_t v5 = sub_2473BDA00();
  uint64_t v44 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2473BDA30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2473BD310();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v17 = v16;
    id v18 = a2;
    if (qword_26B12B530 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v12, (uint64_t)qword_26B12B518);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v17, v19, v12);
    os_log_type_t v20 = sub_2473BDC30();
    id v21 = a2;
    id v22 = a2;
    uint64_t v23 = sub_2473BD2F0();
    os_log_type_t v24 = v20;
    if (os_log_type_enabled(v23, v20))
    {
      id v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v46 = (uint64_t)a2;
      uint64_t v47 = v26;
      *(_DWORD *)id v25 = 136315138;
      v45 = v25 + 4;
      id v27 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249698);
      uint64_t v28 = sub_2473BDAE0();
      uint64_t v46 = sub_2473ABE34(v28, v29, &v47);
      sub_2473BDCC0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247380000, v23, v24, "error retrieving accounts %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C553A30](v26, -1, -1);
      MEMORY[0x24C553A30](v25, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  else
  {
    uint64_t v30 = v45;
    v42 = v7;
    uint64_t v43 = v9;
    if (a1)
    {
      if (a1 >> 62)
      {
        unint64_t v40 = swift_bridgeObjectRetain();
        uint64_t v31 = (uint64_t)sub_247392E58(v40);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v31 = a1 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
      }
      uint64_t v32 = v8;
      aBlock[0] = v31;
      sub_24738B990(aBlock);
      uint64_t v33 = aBlock[0];
      uint64_t v34 = v5;
      sub_2473911B4(0, &qword_26B12B5C8);
      uint64_t v35 = (void *)sub_2473BDC60();
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = v30;
      *(void *)(v36 + 24) = v33;
      aBlock[4] = (uint64_t)sub_2473912E0;
      aBlock[5] = v36;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_24739C898;
      aBlock[3] = (uint64_t)&block_descriptor_179;
      v37 = _Block_copy(aBlock);
      v38 = v30;
      swift_release();
      sub_2473BDA20();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_2473901AC(&qword_26B12B5A0, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
      sub_247390420();
      v39 = v42;
      sub_2473BDD20();
      MEMORY[0x24C553200](0, v11, v39, v37);
      _Block_release(v37);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v34);
      return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v11, v32);
    }
  }
  return result;
}

uint64_t sub_24738785C()
{
  return swift_release();
}

uint64_t sub_2473878BC(void *a1, unint64_t a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v8 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = a1;
  sub_2473BD380();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  uint64_t v5 = (unsigned __int8 *)&v4[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter];
  swift_beginAccess();
  unsigned __int8 v9 = *v5;
  uint64_t v6 = _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(v8, &v9);
  swift_bridgeObjectRelease();
  return sub_247386848(v6);
}

uint64_t sub_2473879E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
    uint64_t v4 = sub_2473BDB80();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_247387A84(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2473BE640;
  *(void *)(inited + 32) = 0x616E616D5F746F6ELL;
  *(void *)(inited + 40) = 0xEB00000000646567;
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  unint64_t v6 = sub_2473A0B68(inited);
  unint64_t v28 = v6;
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v7 = sub_247392E58(v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  v26[0] = v7;
  sub_24738B990((uint64_t *)v26);
  unint64_t v8 = (unint64_t)v26[0];
  if (((unint64_t)v26[0] & 0x8000000000000000) != 0 || ((unint64_t)v26[0] & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v9 = sub_2473BDE30();
    if (v9) {
      goto LABEL_7;
    }
LABEL_16:
    swift_release_n();
    goto LABEL_17;
  }
  uint64_t v9 = *((void *)v26[0] + 2);
  swift_retain();
  if (!v9) {
    goto LABEL_16;
  }
LABEL_7:
  if (v9 < 1)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v10 = 0;
  do
  {
    if ((v8 & 0xC000000000000001) != 0) {
      id v11 = (id)MEMORY[0x24C553330](v10, v8);
    }
    else {
      id v11 = *(id *)(v8 + 8 * v10 + 32);
    }
    uint64_t v12 = v11;
    ++v10;
    v26[0] = v11;
    sub_247387DD8(v26, (uint64_t *)&v28);
  }
  while (v9 != v10);
  swift_release_n();
  unint64_t v6 = v28;
LABEL_17:
  uint64_t v27 = v5;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_27;
  }
  unint64_t v14 = sub_24738A980(0x616E616D5F746F6ELL, 0xEB00000000646567);
  if ((v15 & 1) == 0) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(*(void *)(v6 + 56) + 8 * v14);
  if (v16 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    if (v20 >= 1) {
      goto LABEL_21;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v17 < 1) {
    goto LABEL_26;
  }
LABEL_21:
  type metadata accessor for AccountGroup(0);
  id v18 = (void *)swift_allocObject();
  v18[2] = 0x616E616D5F746F6ELL;
  v18[3] = 0xEB00000000646567;
  v18[4] = 0;
  v18[5] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3E0);
  sub_2473BD330();
  swift_endAccess();
  uint64_t v19 = swift_bridgeObjectRelease();
  MEMORY[0x24C5530F0](v19);
  if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2473BDBA0();
  }
  sub_2473BDBC0();
  sub_2473BDB90();
LABEL_27:
  id v21 = v2;
  uint64_t v22 = swift_bridgeObjectRetain();
  unint64_t v23 = sub_247390B78(v22);
  swift_bridgeObjectRelease();

  sub_247388348(v23);
  uint64_t v24 = v27;
  swift_bridgeObjectRelease();
  return v24;
}

id sub_247387DD8(id *a1, uint64_t *a2)
{
  uint64_t v3 = 0xEB00000000646567;
  uint64_t v4 = 0x616E616D5F746F6ELL;
  id v5 = *a1;
  id v6 = objc_msgSend(*a1, sel_managingOwnerIdentifier);
  if (v6)
  {

    if (objc_msgSend(v5, sel_accountPropertyForKey_, *MEMORY[0x263EFADF0]))
    {
      sub_2473BDD10();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v38, 0, sizeof(v38));
    }
    sub_247391120((uint64_t)v38, (uint64_t)&v39, &qword_26B12B5F0);
    if (v41)
    {
      if (swift_dynamicCast())
      {
        uint64_t v4 = v36;
        uint64_t v3 = v37;
      }
    }
    else
    {
      sub_24738EAF8((uint64_t)&v39, &qword_26B12B5F0);
    }
  }
  id result = objc_msgSend(v5, sel_accountType);
  if (result)
  {
    unint64_t v8 = result;
    id v9 = objc_msgSend(result, sel_identifier);

    if (v9)
    {
      uint64_t v10 = sub_2473BDAD0();
      uint64_t v12 = v11;

      uint64_t v13 = sub_2473BDAD0();
      if (v12)
      {
        if (v10 == v13 && v12 == v14)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v16 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v16 & 1) == 0) {
            goto LABEL_20;
          }
        }
        id v28 = objc_msgSend(v5, sel_identifier);
        if (v28)
        {
          unint64_t v29 = v28;
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          sub_2473BDAC0();

          uint64_t v30 = v40;
          if (v40)
          {
            uint64_t v4 = v39;
            swift_bridgeObjectRelease();
            char v17 = 1;
            uint64_t v3 = v30;
LABEL_21:
            uint64_t v18 = *a2;
            if (*(void *)(*a2 + 16))
            {
              swift_bridgeObjectRetain();
              unint64_t v19 = sub_24738A980(v4, v3);
              if (v20)
              {
                unint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                uint64_t v39 = v21;
                if (v17)
                {
                  if (!(v21 >> 62))
                  {
                    id v22 = v5;
LABEL_26:
                    sub_24738C4BC(0, 0, (uint64_t)v5);
LABEL_35:
                    uint64_t v32 = v39;
                    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    *(void *)&v38[0] = *a2;
                    *a2 = 0x8000000000000000;
                    sub_24738CDF8(v32, v4, v3, isUniquelyReferenced_nonNull_native);
                    uint64_t v27 = *(void *)&v38[0];
                    goto LABEL_36;
                  }
                  swift_bridgeObjectRetain();
                  id v34 = v5;
                  uint64_t v35 = sub_2473BDE30();
                  swift_bridgeObjectRelease();
                  if ((v35 & 0x8000000000000000) == 0) {
                    goto LABEL_26;
                  }
                  __break(1u);
                }
                else
                {
                  id v31 = v5;
                  MEMORY[0x24C5530F0]();
                  if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  {
LABEL_34:
                    sub_2473BDBC0();
                    sub_2473BDB90();
                    goto LABEL_35;
                  }
                }
                sub_2473BDBA0();
                goto LABEL_34;
              }
              swift_bridgeObjectRelease();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5E8);
            uint64_t v23 = swift_allocObject();
            *(_OWORD *)(v23 + 16) = xmmword_2473BE650;
            *(void *)(v23 + 32) = v5;
            uint64_t v39 = v23;
            sub_2473BDB90();
            uint64_t v24 = v39;
            id v25 = v5;
            char v26 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v39 = *a2;
            *a2 = 0x8000000000000000;
            sub_24738CDF8(v24, v4, v3, v26);
            uint64_t v27 = v39;
LABEL_36:
            *a2 = v27;
            swift_bridgeObjectRelease();
            return (id)swift_bridgeObjectRelease();
          }
        }
LABEL_20:
        char v17 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      sub_2473BDAD0();
    }
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_2473881F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_247392D48(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

uint64_t sub_247388348(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2473BDE30();
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
    uint64_t v5 = sub_2473BDE30();
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
  *uint64_t v1 = v4;
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
    unint64_t v4 = MEMORY[0x24C553340](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_247395604(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2473BDE30();
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
  return sub_2473BDB90();
}

uint64_t sub_247388514(void *a1, char a2)
{
  uint64_t v5 = sub_2473BDA00();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2473BDA30();
  uint64_t v9 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473911B4(0, &qword_26B12B5C8);
  uint64_t v12 = (void *)sub_2473BDC60();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v2;
  *(unsigned char *)(v13 + 24) = a2;
  *(void *)(v13 + 32) = a1;
  aBlock[4] = sub_247390410;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24739C898;
  aBlock[3] = &block_descriptor_164;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v2;
  id v16 = a1;
  swift_release();
  sub_2473BDA20();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2473901AC(&qword_26B12B5A0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
  sub_247390420();
  sub_2473BDD20();
  MEMORY[0x24C553200](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v19);
}

uint64_t sub_2473887E4()
{
  return swift_release();
}

void sub_247388858(void *a1, char a2, void *a3)
{
  id v7 = sub_2473864D0();
  id v8 = objc_msgSend(v7, sel_monitoredAccounts);

  sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
  uint64_t v9 = sub_2473BDB80();

  if (v9 < 0 || (v9 & 0x4000000000000000) != 0)
  {
    unint64_t v30 = swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t)sub_247392E58(v30);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v31[0] = v10;
  sub_24738B990(v31);
  if (v3)
  {
    swift_release();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v31[0];
  swift_getKeyPath();
  swift_getKeyPath();
  v31[0] = v11;
  uint64_t v12 = a1;
  sub_2473BD380();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  unint64_t v13 = v31[0];
  uint64_t v14 = &v12[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter];
  swift_beginAccess();
  LOBYTE(v32) = *v14;
  uint64_t v15 = _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(v13, (unsigned __int8 *)&v32);
  swift_bridgeObjectRelease();
  sub_247386848(v15);
  id v16 = objc_msgSend(a3, sel_identifier);
  swift_getKeyPath();
  swift_getKeyPath();
  if ((a2 & 1) == 0)
  {
    sub_2473BD370();
    swift_release();
    swift_release();
    id v21 = v32;
    id v18 = objc_msgSend(v32, sel_identifier);

    if (v16)
    {
      if (!v18) {
        goto LABEL_14;
      }
      sub_2473911B4(0, &qword_2692495C0);
      id v22 = v16;
      char v23 = sub_2473BDC90();

      if ((v23 & 1) == 0) {
        return;
      }
    }
    else if (v18)
    {
LABEL_18:

      return;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2473BD370();
    swift_release();
    swift_release();
    id v24 = v32;
    id v25 = v12;
    char v26 = sub_247390F20((unint64_t)v24);

    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2473BD370();
    swift_release();
    swift_release();
    id v27 = v32;
    swift_getKeyPath();
    swift_getKeyPath();
    id v32 = v26;
    id v28 = v26;
    unint64_t v29 = v25;
    sub_2473BD380();
    sub_247382940(v27);

    return;
  }
  sub_2473BD370();
  swift_release();
  swift_release();
  id v17 = v32;
  id v18 = objc_msgSend(v32, sel_identifier);

  if (!v16)
  {
    if (!v18)
    {
LABEL_16:
      sub_247384C1C(0);
      return;
    }
    goto LABEL_18;
  }
  if (!v18)
  {
LABEL_14:

    return;
  }
  sub_2473911B4(0, &qword_2692495C0);
  id v19 = v16;
  char v20 = sub_2473BDC90();

  if (v20) {
    goto LABEL_16;
  }
}

uint64_t sub_247388CC8(void *a1)
{
  return sub_247388514(a1, 0);
}

uint64_t sub_247388D2C(void *a1)
{
  return sub_247388514(a1, 1);
}

uint64_t sub_247388D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = (uint64_t *)(v3 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager);
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager);
  uint64_t v6 = *(void *)(v3 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager + 8);
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_24738A980(a1, a2);
    if (v11)
    {
      sub_24738EB6C(*(void *)(v6 + 56) + 40 * v10, (uint64_t)&v13);
    }
    else
    {
      uint64_t v15 = 0;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    if (*((void *)&v14 + 1)) {
      return sub_24738EB54(&v13, (uint64_t)a3);
    }
    uint64_t v7 = *v5;
  }
  else
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  a3[3] = type metadata accessor for GenericAccountsUIPlugin();
  a3[4] = &off_26FB845E0;
  *a3 = v7;
  swift_retain();
  return sub_24738EAF8((uint64_t)&v13, &qword_2692495B8);
}

void sub_247388EA8(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_accountType);
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_identifier);

  if (!v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v6 = sub_2473BDAD0();
  uint64_t v8 = v7;

  sub_247388D90(v6, v8, a2);
  swift_bridgeObjectRelease();
}

void sub_247388F54(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  id v2 = v18[0];
  if (v18[0])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2473BD370();
    swift_release();
    swift_release();
    id v3 = objc_msgSend(v18[0], sel_identifier);

    id v4 = objc_msgSend(a1, sel_identifier);
    id v5 = v4;
    if (v3)
    {
      if (v4)
      {
        sub_2473911B4(0, &qword_2692495C0);
        id v6 = v3;
        char v7 = sub_2473BDC90();

        if ((v7 & 1) == 0) {
          goto LABEL_10;
        }
LABEL_7:
        swift_getKeyPath();
        swift_getKeyPath();
        v18[0] = a1;
        id v8 = a1;
        id v9 = v2;
        sub_2473BD380();
        return;
      }
      id v5 = v3;
    }
    else if (!v4)
    {
      goto LABEL_7;
    }

    id v2 = v5;
LABEL_10:
  }
  id v10 = objc_msgSend(a1, sel_accountType);
  if (v10)
  {
    char v11 = v10;
    id v12 = objc_msgSend(v10, sel_identifier);

    if (v12)
    {
      uint64_t v13 = sub_2473BDAD0();
      uint64_t v15 = v14;

      sub_247388D90(v13, v15, v18);
      swift_bridgeObjectRelease();
      uint64_t v16 = v19;
      uint64_t v17 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(void *, uint64_t, uint64_t))(v17 + 24))(a1, v16, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2473891C4(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  if (v30[0])
  {
    id v31 = &type metadata for AccountSettingsDetailModelView;
    unint64_t v32 = sub_247390374();
    type metadata accessor for AccountsUISettingsDetailModel(0);
    sub_2473901AC(&qword_269249690, (void (*)(uint64_t))type metadata accessor for AccountsUISettingsDetailModel);
    v30[0] = sub_2473BD440();
    v30[1] = v4;
    sub_24738EAF8(a2, (uint64_t *)&unk_26B12B3A0);
    sub_247391120((uint64_t)v30, a2, (uint64_t *)&unk_26B12B3A0);
    return;
  }
  id v5 = objc_msgSend(a1, sel_accountType);
  if (!v5)
  {
    __break(1u);
    goto LABEL_13;
  }
  id v6 = v5;
  id v7 = objc_msgSend(v5, sel_identifier);

  if (!v7)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v8 = sub_2473BDAD0();
  uint64_t v10 = v9;

  sub_247388D90(v8, v10, v30);
  swift_bridgeObjectRelease();
  char v11 = v31;
  unint64_t v12 = v32;
  __swift_project_boxed_opaque_existential_1(v30, (uint64_t)v31);
  uint64_t v13 = (*(uint64_t (**)(void *, ValueMetadata *, unint64_t))(v12 + 32))(a1, v11, v12);
  if (v13)
  {
    uint64_t v14 = v13;
    type metadata accessor for AccountsUIModel(0);
    sub_2473901AC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    id v28 = &type metadata for AccountSettingsDetailView;
    v27[0] = sub_2473BD4B0();
    v27[1] = v15;
    unint64_t v29 = sub_247390320();
    v27[2] = v14;
  }
  else
  {
    uint64_t v16 = v31;
    unint64_t v17 = v32;
    __swift_project_boxed_opaque_existential_1(v30, (uint64_t)v31);
    uint64_t v18 = (*(uint64_t (**)(void *, ValueMetadata *, unint64_t))(v17 + 40))(a1, v16, v17);
    if (v18)
    {
      id v28 = (ValueMetadata *)MEMORY[0x263F1B720];
      unint64_t v29 = MEMORY[0x263F1B718];
      v27[0] = v18;
    }
    else
    {
      sub_2473BD580();
      uint64_t v19 = sub_2473BD6C0();
      uint64_t v21 = v20;
      char v23 = v22;
      uint64_t v25 = v24;
      id v28 = (ValueMetadata *)MEMORY[0x263F1A830];
      unint64_t v29 = MEMORY[0x263F1A820];
      uint64_t v26 = swift_allocObject();
      v27[0] = v26;
      *(void *)(v26 + 16) = v19;
      *(void *)(v26 + 24) = v21;
      *(unsigned char *)(v26 + 32) = v23 & 1;
      *(void *)(v26 + 40) = v25;
    }
  }
  sub_24738EAF8(a2, (uint64_t *)&unk_26B12B3A0);
  sub_247391120((uint64_t)v27, a2, (uint64_t *)&unk_26B12B3A0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
}

void sub_247389518(uint64_t a1, void *a2, void *a3, uint64_t a4, void (*a5)(id, void (*)(void), uint64_t), uint64_t a6, void (*a7)(BOOL), uint64_t a8)
{
  uint64_t v15 = sub_2473BD310();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    goto LABEL_20;
  }
  uint64_t v41 = a4;
  v45 = a2;
  id v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249698);
  sub_2473911B4(0, &qword_2692496A0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  id v42 = v43;
  id v20 = objc_msgSend(v43, sel_domain);
  uint64_t v21 = sub_2473BDAD0();
  uint64_t v23 = v22;

  if (v21 == sub_2473BDAD0() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {

LABEL_20:
      a7(a2 == 0);
      return;
    }
  }
  id v27 = v42;
  if (objc_msgSend(v42, sel_code) != (id)3)
  {

    goto LABEL_20;
  }
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v15, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v28, v15);
  os_log_type_t v29 = sub_2473BDC30();
  unint64_t v30 = sub_2473BD2F0();
  if (os_log_type_enabled(v30, v29))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v31 = 0;
    _os_log_impl(&dword_247380000, v30, v29, "Failed to verify credential. Prompting", v31, 2u);
    unint64_t v32 = v31;
    id v27 = v42;
    MEMORY[0x24C553A30](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  id v33 = objc_msgSend(a3, sel_identifier);
  if (!v33) {
    goto LABEL_21;
  }
  id v34 = v33;
  id v43 = 0;
  uint64_t v44 = 0;
  sub_2473BDAC0();

  if (!v44) {
    goto LABEL_21;
  }
  id v35 = sub_2473864D0();
  uint64_t v36 = (void *)sub_2473BDA90();
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v35, sel_accountWithIdentifier_, v36);

  id v27 = v42;
  if (v37)
  {
    v39(v37, (void (*)(void))a7, a8);
  }
  else
  {
LABEL_21:
    a7(0);
  }
}

id AccountsUIModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountsUIModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247389CA8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  uint64_t result = sub_2473BD320();
  *a1 = result;
  return result;
}

uint64_t sub_247389CE8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_247389D68(void **a1, void **a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_2473BD380();
}

uint64_t sub_247389DDC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_247389E5C()
{
  return sub_2473BD380();
}

uint64_t sub_247389ED8@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

void sub_247389EEC(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_247382C34(v1);
}

uint64_t sub_247389F1C@<X0>(unsigned char *a1@<X8>)
{
  return sub_247389F58(a1);
}

uint64_t sub_247389F30(uint64_t a1, void **a2)
{
  return sub_247389FE8(a1, a2);
}

uint64_t sub_247389F44@<X0>(unsigned char *a1@<X8>)
{
  return sub_247389F58(a1);
}

uint64_t sub_247389F58@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_247389FD4(uint64_t a1, void **a2)
{
  return sub_247389FE8(a1, a2);
}

uint64_t sub_247389FE8(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_2473BD380();
}

uint64_t sub_24738A054@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_24738A068(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  id v3 = v2;
  return sub_2473BD380();
}

uint64_t sub_24738A0E0@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_24738A0F4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24738A170(void **a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_2473BD380();
}

uint64_t sub_24738A1E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  return swift_release();
}

uint64_t sub_24738A260(uint64_t a1, void **a2)
{
  sub_24738D590(a1, (uint64_t)v7);
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24738D590((uint64_t)v7, (uint64_t)&v6);
  id v4 = v3;
  sub_2473BD380();
  return sub_24738EAF8((uint64_t)v7, (uint64_t *)&unk_26B12B3A0);
}

uint64_t sub_24738A2F0@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_24738A304(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_2473BD380();
}

uint64_t sub_24738A37C@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

void sub_24738A390(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v2;
  sub_2473BD380();
  sub_24738383C();
}

uint64_t sub_24738A414@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_24738A428()
{
  unint64_t v0 = swift_bridgeObjectRetain();
  return sub_2473866EC(v0);
}

uint64_t sub_24738A454(uint64_t a1, uint64_t a2)
{
  return sub_24738A54C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24738A46C()
{
  sub_2473BDAD0();
  sub_2473BDB10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24738A4C0()
{
  sub_2473BDAD0();
  sub_2473BDEF0();
  sub_2473BDB10();
  uint64_t v0 = sub_2473BDF10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24738A534(uint64_t a1, uint64_t a2)
{
  return sub_24738A54C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24738A54C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2473BDAD0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24738A590(uint64_t a1, id *a2)
{
  uint64_t result = sub_2473BDAB0();
  *a2 = 0;
  return result;
}

uint64_t sub_24738A608(uint64_t a1, id *a2)
{
  char v3 = sub_2473BDAC0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24738A688@<X0>(uint64_t *a1@<X8>)
{
  sub_2473BDAD0();
  uint64_t v2 = sub_2473BDA90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_24738A6CC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24738A6D8()
{
  uint64_t v0 = sub_2473BDAD0();
  uint64_t v2 = v1;
  if (v0 == sub_2473BDAD0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2473BDEB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24738A764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2473BDA90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24738A7AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2473BDAD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_24738A7D8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_24738A7E8()
{
  return sub_2473BDF10();
}

uint64_t sub_24738A830()
{
  return sub_2473BDF00();
}

uint64_t sub_24738A85C()
{
  return sub_2473BDF10();
}

BOOL sub_24738A8A0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24738A8B4(uint64_t a1)
{
  uint64_t v2 = sub_2473901AC((unint64_t *)&qword_2692495A0, type metadata accessor for Dataclass);
  uint64_t v3 = sub_2473901AC(&qword_269249670, type metadata accessor for Dataclass);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24738A970(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_24738A980(uint64_t a1, uint64_t a2)
{
  sub_2473BDEF0();
  sub_2473BDB10();
  uint64_t v4 = sub_2473BDF10();
  return sub_24738AB3C(a1, a2, v4);
}

unint64_t sub_24738A9F8(uint64_t a1)
{
  uint64_t v2 = sub_2473BDD30();
  return sub_24738AC20(a1, v2);
}

unint64_t sub_24738AA3C(uint64_t a1)
{
  sub_2473BDAD0();
  sub_2473BDEF0();
  sub_2473BDB10();
  uint64_t v2 = sub_2473BDF10();
  swift_bridgeObjectRelease();
  return sub_24738ACE8(a1, v2);
}

unint64_t sub_24738AAD0(unsigned __int8 a1)
{
  sub_2473BDEF0();
  sub_2473BDF00();
  uint64_t v2 = sub_2473BDF10();
  return sub_24738AE60(a1, v2);
}

unint64_t sub_24738AB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2473BDEB0() & 1) == 0)
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
      while (!v14 && (sub_2473BDEB0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24738AC20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_247391244(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5532D0](v9, a1);
      sub_24738E628((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24738ACE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2473BDAD0();
    uint64_t v8 = v7;
    if (v6 == sub_2473BDAD0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2473BDAD0();
          uint64_t v15 = v14;
          if (v13 == sub_2473BDAD0() && v15 == v16) {
            break;
          }
          char v18 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_24738AE60(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_24738AF00(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2473BDEF0();
  swift_bridgeObjectRetain();
  sub_2473BDB10();
  uint64_t v8 = sub_2473BDF10();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2473BDEB0() & 1) != 0)
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
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2473BDEB0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24738B390(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24738B0B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692496A8);
  uint64_t v3 = sub_2473BDD70();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  void *v30 = -1 << v29;
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
      sub_2473BDEF0();
      sub_2473BDB10();
      uint64_t result = sub_2473BDF10();
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

uint64_t sub_24738B390(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24738B0B0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24738B52C();
      goto LABEL_22;
    }
    sub_24738B6E0();
  }
  uint64_t v11 = *v4;
  sub_2473BDEF0();
  sub_2473BDB10();
  uint64_t result = sub_2473BDF10();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2473BDEB0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2473BDED0();
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
          uint64_t result = sub_2473BDEB0();
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
  uint64_t *v21 = v8;
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

void *sub_24738B52C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692496A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2473BDD60();
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
    *BOOL v19 = *v17;
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

uint64_t sub_24738B6E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692496A8);
  uint64_t v3 = sub_2473BDD70();
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
    sub_2473BDEF0();
    swift_bridgeObjectRetain();
    sub_2473BDB10();
    uint64_t result = sub_2473BDF10();
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

uint64_t sub_24738B990(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_247395A40();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24738BA0C(v6);
  return sub_2473BDDE0();
}

void sub_24738BA0C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_2473BDEA0();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_24738C124(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  uint64_t v6 = v4;
  v103 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
    uint64_t v112 = MEMORY[0x263F8EE78];
    v111 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_98:
      if (v12 >= 2)
      {
        uint64_t v96 = *v103;
        do
        {
          unint64_t v97 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_127;
          }
          if (!v96) {
            goto LABEL_139;
          }
          uint64_t v98 = *(void *)&v9[16 * v97 + 32];
          uint64_t v99 = *(void *)&v9[16 * v12 + 24];
          sub_24738C1F8((id *)(v96 + 8 * v98), (id *)(v96 + 8 * *(void *)&v9[16 * v12 + 16]), v96 + 8 * v99, v111);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v9 = sub_2473953D0((uint64_t)v9);
          }
          if (v97 >= *((void *)v9 + 2)) {
            goto LABEL_129;
          }
          v100 = &v9[16 * v97 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v9 + 2);
          if (v12 > v101) {
            goto LABEL_130;
          }
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v101 - v12));
          *((void *)v9 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(void *)((v112 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_2473BDB90();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
    uint64_t v8 = sub_2473BDBB0();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v111 = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v112 = v8;
  }
  uint64_t v106 = v6;
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v104 = *a1 - 8;
  uint64_t v105 = *a1 + 16;
  uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  uint64_t v108 = v3;
  while (1)
  {
    uint64_t v13 = v10++;
    uint64_t v109 = v13;
    if (v10 < v3)
    {
      unint64_t v14 = v9;
      unint64_t v15 = *(void **)(v11 + 8 * v13);
      id v16 = *(id *)(v11 + 8 * v10);
      id v17 = v15;
      _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v16, v17);
      int v19 = v18;

      uint64_t v10 = v13 + 2;
      if (v13 + 2 < v3)
      {
        uint64_t v20 = (id *)(v105 + 8 * v13);
        while (1)
        {
          uint64_t v21 = *(v20 - 1);
          id v22 = *v20;
          id v23 = v21;
          _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v22, v23);
          int v25 = v24;

          if ((v19 ^ v25)) {
            break;
          }
          ++v10;
          ++v20;
          uint64_t v3 = v108;
          if (v108 == v10)
          {
            uint64_t v10 = v108;
            goto LABEL_22;
          }
        }
        uint64_t v3 = v108;
LABEL_22:
        uint64_t v13 = v109;
      }
      uint64_t v9 = v14;
      if (v19)
      {
        if (v10 < v13) {
          goto LABEL_133;
        }
        if (v13 < v10)
        {
          unint64_t v26 = (uint64_t *)(v104 + 8 * v10);
          uint64_t v27 = v10;
          uint64_t v28 = v13;
          int64_t v29 = (uint64_t *)(v11 + 8 * v13);
          do
          {
            if (v28 != --v27)
            {
              if (!v11) {
                goto LABEL_138;
              }
              uint64_t v30 = *v29;
              uint64_t *v29 = *v26;
              uint64_t *v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v13)) {
        goto LABEL_131;
      }
      if (v10 - v13 < v106) {
        break;
      }
    }
LABEL_48:
    if (v10 < v13) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_247395218(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v43 = *((void *)v9 + 2);
    unint64_t v42 = *((void *)v9 + 3);
    unint64_t v12 = v43 + 1;
    if (v43 >= v42 >> 1) {
      uint64_t v9 = sub_247395218((char *)(v42 > 1), v43 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    uint64_t v44 = v9 + 32;
    v45 = &v9[16 * v43 + 32];
    *(void *)v45 = v13;
    *((void *)v45 + 1) = v10;
    if (v43)
    {
      uint64_t v110 = v10;
      while (1)
      {
        unint64_t v46 = v12 - 1;
        if (v12 >= 4)
        {
          v51 = &v44[16 * v12];
          uint64_t v52 = *((void *)v51 - 8);
          uint64_t v53 = *((void *)v51 - 7);
          BOOL v57 = __OFSUB__(v53, v52);
          uint64_t v54 = v53 - v52;
          if (v57) {
            goto LABEL_115;
          }
          uint64_t v56 = *((void *)v51 - 6);
          uint64_t v55 = *((void *)v51 - 5);
          BOOL v57 = __OFSUB__(v55, v56);
          uint64_t v49 = v55 - v56;
          char v50 = v57;
          if (v57) {
            goto LABEL_116;
          }
          unint64_t v58 = v12 - 2;
          uint64_t v59 = &v44[16 * v12 - 32];
          uint64_t v61 = *(void *)v59;
          uint64_t v60 = *((void *)v59 + 1);
          BOOL v57 = __OFSUB__(v60, v61);
          uint64_t v62 = v60 - v61;
          if (v57) {
            goto LABEL_118;
          }
          BOOL v57 = __OFADD__(v49, v62);
          uint64_t v63 = v49 + v62;
          if (v57) {
            goto LABEL_121;
          }
          if (v63 >= v54)
          {
            v81 = &v44[16 * v46];
            uint64_t v83 = *(void *)v81;
            uint64_t v82 = *((void *)v81 + 1);
            BOOL v57 = __OFSUB__(v82, v83);
            uint64_t v84 = v82 - v83;
            if (v57) {
              goto LABEL_125;
            }
            BOOL v74 = v49 < v84;
            goto LABEL_86;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v75 = *((void *)v9 + 4);
            uint64_t v76 = *((void *)v9 + 5);
            BOOL v57 = __OFSUB__(v76, v75);
            uint64_t v68 = v76 - v75;
            char v69 = v57;
            goto LABEL_80;
          }
          uint64_t v48 = *((void *)v9 + 4);
          uint64_t v47 = *((void *)v9 + 5);
          BOOL v57 = __OFSUB__(v47, v48);
          uint64_t v49 = v47 - v48;
          char v50 = v57;
        }
        if (v50) {
          goto LABEL_117;
        }
        unint64_t v58 = v12 - 2;
        v64 = &v44[16 * v12 - 32];
        uint64_t v66 = *(void *)v64;
        uint64_t v65 = *((void *)v64 + 1);
        BOOL v67 = __OFSUB__(v65, v66);
        uint64_t v68 = v65 - v66;
        char v69 = v67;
        if (v67) {
          goto LABEL_120;
        }
        v70 = &v44[16 * v46];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v57 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v57) {
          goto LABEL_123;
        }
        if (__OFADD__(v68, v73)) {
          goto LABEL_124;
        }
        if (v68 + v73 >= v49)
        {
          BOOL v74 = v49 < v73;
LABEL_86:
          if (v74) {
            unint64_t v46 = v58;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v69) {
          goto LABEL_119;
        }
        v77 = &v44[16 * v46];
        uint64_t v79 = *(void *)v77;
        uint64_t v78 = *((void *)v77 + 1);
        BOOL v57 = __OFSUB__(v78, v79);
        uint64_t v80 = v78 - v79;
        if (v57) {
          goto LABEL_122;
        }
        if (v80 < v68) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v85 = v46 - 1;
        if (v46 - 1 >= v12)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
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
          goto LABEL_135;
        }
        uint64_t v86 = v11;
        if (!v11) {
          goto LABEL_137;
        }
        v87 = v9;
        v88 = &v44[16 * v85];
        uint64_t v89 = *(void *)v88;
        v90 = v44;
        unint64_t v91 = v46;
        v92 = &v44[16 * v46];
        uint64_t v93 = *((void *)v92 + 1);
        uint64_t v94 = v86;
        sub_24738C1F8((id *)(v86 + 8 * *(void *)v88), (id *)(v86 + 8 * *(void *)v92), v86 + 8 * v93, v111);
        if (v1) {
          goto LABEL_109;
        }
        if (v93 < v89) {
          goto LABEL_112;
        }
        if (v91 > *((void *)v87 + 2)) {
          goto LABEL_113;
        }
        *(void *)v88 = v89;
        *(void *)&v90[16 * v85 + 8] = v93;
        unint64_t v95 = *((void *)v87 + 2);
        if (v91 >= v95) {
          goto LABEL_114;
        }
        uint64_t v9 = v87;
        unint64_t v12 = v95 - 1;
        memmove(v92, v92 + 16, 16 * (v95 - 1 - v91));
        uint64_t v44 = v90;
        *((void *)v87 + 2) = v95 - 1;
        uint64_t v11 = v94;
        uint64_t v10 = v110;
        if (v95 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_14:
    uint64_t v3 = v108;
    if (v10 >= v108) {
      goto LABEL_98;
    }
  }
  if (__OFADD__(v13, v106)) {
    goto LABEL_134;
  }
  if (v13 + v106 >= v3) {
    uint64_t v31 = v3;
  }
  else {
    uint64_t v31 = v13 + v106;
  }
  if (v31 >= v13)
  {
    if (v10 != v31)
    {
      v102 = v9;
      uint64_t v32 = v104 + 8 * v10;
      uint64_t v107 = v31;
      do
      {
        id v33 = *(void **)(v11 + 8 * v10);
        uint64_t v34 = v13;
        uint64_t v35 = v32;
        do
        {
          uint64_t v36 = *(void **)v35;
          id v37 = v33;
          id v38 = v36;
          _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v37, v38);
          char v40 = v39;

          if ((v40 & 1) == 0) {
            break;
          }
          if (!v11) {
            goto LABEL_136;
          }
          uint64_t v41 = *(void **)v35;
          id v33 = *(void **)(v35 + 8);
          *(void *)uint64_t v35 = v33;
          *(void *)(v35 + 8) = v41;
          v35 -= 8;
          ++v34;
        }
        while (v10 != v34);
        ++v10;
        v32 += 8;
        uint64_t v13 = v109;
      }
      while (v10 != v107);
      uint64_t v10 = v107;
      uint64_t v9 = v102;
    }
    goto LABEL_48;
  }
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
  sub_2473BDE20();
  __break(1u);
}

void sub_24738C124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v8 = *(void **)(v6 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v10 = v7;
    while (1)
    {
      uint64_t v11 = *(void **)v10;
      id v12 = v8;
      id v13 = v11;
      _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v12, v13);
      char v15 = v14;

      if ((v15 & 1) == 0)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v6) {
        break;
      }
      id v16 = *(void **)v10;
      uint64_t v8 = *(void **)(v10 + 8);
      *(void *)uint64_t v10 = v8;
      *(void *)(v10 + 8) = v16;
      v10 -= 8;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_24738C1F8(id *a1, id *__src, unint64_t a3, char *a4)
{
  uint64_t v35 = a1;
  uint64_t v5 = __src;
  uint64_t v6 = (char *)__src - (char *)a1;
  uint64_t v7 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v7 = (char *)__src - (char *)a1;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v10 = a3 - (void)__src;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v34 = (void **)a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != (char *)__src || &__src[v11] <= (id *)a4) {
        memmove(a4, __src, 8 * v11);
      }
      uint64_t v21 = &a4[8 * v11];
      id v33 = v21;
      uint64_t v35 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        id v22 = (id *)(a3 - 8);
        id v23 = v5;
        do
        {
          int v24 = v22 + 1;
          int v25 = *--v23;
          id v26 = *((id *)v21 - 1);
          id v27 = v25;
          _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v26, v27);
          char v29 = v28;

          if (v29)
          {
            if (v24 != v5 || v22 >= v5) {
              id *v22 = *v23;
            }
            uint64_t v35 = v23;
          }
          else
          {
            id v33 = v21 - 8;
            if (v24 < (id *)v21 || v22 >= (id *)v21 || v24 != (id *)v21) {
              id *v22 = (id)*((void *)v21 - 1);
            }
            id v23 = v5;
            v21 -= 8;
          }
          if (v23 <= a1) {
            break;
          }
          --v22;
          uint64_t v5 = v23;
        }
        while (v21 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v8] <= (id *)a4) {
      memmove(a4, a1, 8 * v8);
    }
    id v12 = (void **)&a4[8 * v8];
    id v33 = (char *)v12;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      id v13 = (void **)a4;
      char v14 = a1;
      do
      {
        char v15 = *v13;
        id v16 = *v5;
        id v17 = v15;
        _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v16, v17);
        char v19 = v18;

        if (v19)
        {
          uint64_t v20 = v5 + 1;
          if (v14 < v5 || v14 >= v20 || v14 != v5) {
            *char v14 = *v5;
          }
        }
        else
        {
          if (v14 != v13) {
            *char v14 = *v13;
          }
          uint64_t v34 = ++v13;
          uint64_t v20 = v5;
        }
        ++v14;
        if (v13 >= v12) {
          break;
        }
        uint64_t v5 = v20;
      }
      while ((unint64_t)v20 < a3);
      uint64_t v35 = v14;
    }
LABEL_43:
    sub_247395314((void **)&v35, (const void **)&v34, &v33);
    return 1;
  }
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

uint64_t sub_24738C4BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v7 = a1;
    unint64_t v6 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_2473BDE30();
  swift_bridgeObjectRelease();
  if (v23 < v5) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v9 = v5 - v7;
  if (__OFSUB__(v5, v7))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v6 = *v4;
  if (*v4 >> 62) {
    goto LABEL_36;
  }
  uint64_t v10 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v6 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v6;
  uint64_t v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = MEMORY[0x24C553340](v10, v14, 1, v6);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v6;
  uint64_t v13 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  char v15 = (void *)(v13 + 32 + 8 * v7);
  sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
  swift_arrayDestroy();
  if (v8)
  {
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_2473BDE30();
      swift_bridgeObjectRelease();
      uint64_t v17 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_21:
        if (v17 < 0)
        {
LABEL_46:
          uint64_t result = sub_2473BDE70();
          __break(1u);
          return result;
        }
        char v18 = (char *)(v15 + 1);
        char v19 = (char *)(v13 + 32 + 8 * v5);
        if (v15 + 1 != (void *)v19 || v18 >= &v19[8 * v17]) {
          memmove(v18, v19, 8 * v17);
        }
        if (!(v6 >> 62))
        {
          uint64_t v20 = *(void *)(v13 + 16);
          uint64_t v21 = v20 + v8;
          if (!__OFADD__(v20, v8))
          {
LABEL_27:
            *(void *)(v13 + 16) = v21;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_2473BDE30();
        swift_bridgeObjectRelease();
        uint64_t v21 = v25 + v8;
        if (!__OFADD__(v25, v8)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v13 + 16);
      uint64_t v17 = v16 - v5;
      if (!__OFSUB__(v16, v5)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  *char v15 = v3;
  return sub_2473BDB90();
}

uint64_t sub_24738C7B8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692496B8);
  char v37 = a2;
  uint64_t v6 = sub_2473BDE50();
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
  uint64_t v34 = v2;
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
    char v19 = (void *)(v5 + 64);
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
    id v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_24738EB54(v25, (uint64_t)v38);
    }
    else
    {
      sub_24738EB6C((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_2473BDEF0();
    sub_2473BDB10();
    uint64_t result = sub_2473BDF10();
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
    uint64_t result = sub_24738EB54(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  char v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24738CAE0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B5D0);
  char v36 = a2;
  uint64_t v6 = sub_2473BDE50();
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
    id v22 = (void *)(v5 + 64);
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2473BDEF0();
    sub_2473BDB10();
    uint64_t result = sub_2473BDF10();
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
  id v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24738CDF8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24738A980(a2, a3);
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
    sub_24738D154();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24738CAE0(v15, a4 & 1);
  unint64_t v21 = sub_24738A980(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2473BDEE0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

void *sub_24738CF68()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692496B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2473BDE40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
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
    uint64_t v20 = 40 * v15;
    sub_24738EB6C(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_24738EB54(v26, *(void *)(v4 + 56) + v20);
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

void *sub_24738D154()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B5D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2473BDE40();
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
    void *v21 = *v17;
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

uint64_t sub_24738D30C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = a6;
  uint64_t v21 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v14 = (void *)(a5[6] + 16 * a1);
  *unint64_t v14 = a2;
  v14[1] = a3;
  uint64_t result = sub_24738EB54(&v19, a5[7] + 40 * a1);
  uint64_t v16 = a5[2];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    a5[2] = v18;
  }
  return result;
}

void *sub_24738D3E4(void *a1)
{
  return sub_247392D48(0, a1[2], 0, a1);
}

uint64_t sub_24738D3F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2473BDC10();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24738AF00(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

BOOL sub_24738D490()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  if (qword_269249560 != -1) {
    swift_once();
  }
  CFStringRef v0 = (const __CFString *)qword_26924A148;
  if (qword_269249568 != -1) {
    swift_once();
  }
  CFStringRef v1 = (const __CFString *)qword_26924A150;
  int IsForced = CFPreferencesAppValueIsForced(v0, (CFStringRef)qword_26924A150);
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)qword_26924A148, v1, &keyExistsAndHasValidFormat);
  if (IsForced) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return !v4 || keyExistsAndHasValidFormat == 0;
}

uint64_t sub_24738D590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24738D5F8()
{
  if (!sub_24738D490())
  {
    CFStringRef v0 = (void *)sub_2473BDA90();
    id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

    if (v1)
    {
      uint64_t v2 = (void *)sub_2473BDA90();
      uint64_t v3 = (void *)sub_2473BDA90();
      id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, 0);

      sub_2473BDAD0();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_24738D714()
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v85 = sub_2473BD310();
  uint64_t v0 = *(void *)(v85 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v85);
  uint64_t v3 = (char *)&v77 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v84 = (uint64_t *)((char *)&v77 - v5);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v80 = (char *)&v77 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v83 = (char *)&v77 - v8;
  uint64_t v96 = sub_2473BD1F0();
  uint64_t v9 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  unint64_t v95 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GenericAccountsUIPlugin();
  uint64_t v78 = swift_allocObject();
  uint64_t v11 = (void *)sub_2473A0A24(MEMORY[0x263F8EE78]);
  id v12 = objc_msgSend(self, sel_defaultManager);
  int64_t v13 = (void *)sub_2473BDA90();
  id v102 = 0;
  id v14 = objc_msgSend(v12, sel_contentsOfDirectoryAtPath_error_, v13, &v102);

  id v15 = v102;
  if (!v14)
  {
    id v70 = v102;
    uint64_t v20 = (uint64_t *)sub_2473BD1C0();

    swift_willThrow();
    if (qword_26B12B530 == -1)
    {
LABEL_54:
      uint64_t v71 = v85;
      uint64_t v72 = __swift_project_value_buffer(v85, (uint64_t)qword_26B12B518);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v0 + 16))(v3, v72, v71);
      os_log_type_t v73 = sub_2473BDC30();
      BOOL v74 = sub_2473BD2F0();
      if (os_log_type_enabled(v74, v73))
      {
        uint64_t v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v75 = 0;
        _os_log_impl(&dword_247380000, v74, v73, "caught error trying to load contents of directory at /System/Library/Accounts/SwiftUI", v75, 2u);
        MEMORY[0x24C553A30](v75, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v0 + 8))(v3, v71);
      return v78;
    }
LABEL_60:
    swift_once();
    goto LABEL_54;
  }
  uint64_t v3 = (char *)sub_2473BDB80();
  id v16 = v15;

  uint64_t v94 = *((void *)v3 + 2);
  if (!v94)
  {
LABEL_52:
    swift_bridgeObjectRelease();
    return v78;
  }
  unint64_t v18 = 0;
  uint64_t v93 = v3 + 32;
  v92 = (void (**)(uint64_t, uint64_t))(v9 + 8);
  v87 = (void (**)(char *, uint64_t, uint64_t))(v0 + 16);
  uint64_t v86 = (void (**)(char *, uint64_t))(v0 + 8);
  unint64_t v91 = (void *)0xD000000000000021;
  unint64_t v90 = 0x80000002473C39A0;
  *(void *)&long long v17 = 136315138;
  long long v81 = v17;
  uint64_t v79 = MEMORY[0x263F8EE58] + 8;
  uint64_t v19 = v85;
  uint64_t v20 = v84;
  uint64_t v89 = v3;
  while (1)
  {
    if (v18 >= *((void *)v3 + 2))
    {
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    unint64_t v97 = v18;
    id v102 = 0;
    unint64_t v103 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_2473BDD80();
    swift_bridgeObjectRelease();
    id v102 = v91;
    unint64_t v103 = v90;
    sub_2473BDB20();
    swift_bridgeObjectRelease();
    uint64_t v22 = (uint64_t)v102;
    unint64_t v21 = v103;
    uint64_t v0 = (uint64_t)v95;
    sub_2473BD1E0();
    uint64_t v23 = sub_2473BD1D0();
    uint64_t v25 = v24;
    (*v92)(v0, v96);
    if (v23 == 0x656C646E7562 && v25 == 0xE600000000000000) {
      break;
    }
    char v26 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
LABEL_5:
    unint64_t v18 = v97 + 1;
    uint64_t v3 = v89;
    if (v97 + 1 == v94) {
      goto LABEL_52;
    }
  }
  swift_bridgeObjectRelease();
LABEL_11:
  id v27 = objc_allocWithZone(MEMORY[0x263F086E0]);
  swift_bridgeObjectRetain();
  uint64_t v28 = (void *)sub_2473BDA90();
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(v27, sel_initWithPath_, v28);

  if (!v29)
  {
    if (qword_26B12B530 != -1) {
      swift_once();
    }
    uint64_t v53 = __swift_project_value_buffer(v19, (uint64_t)qword_26B12B518);
    swift_beginAccess();
    uint64_t v54 = v83;
    (*v87)(v83, v53, v19);
    LOBYTE(v53) = sub_2473BDC30();
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_2473BD2F0();
    os_log_type_t v56 = v53;
    if (os_log_type_enabled(v55, (os_log_type_t)v53))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v0 = swift_slowAlloc();
      id v102 = (id)v0;
      *(_DWORD *)uint64_t v57 = v81;
      swift_bridgeObjectRetain();
      *(void *)(v57 + 4) = sub_2473ABE34(v22, v21, (uint64_t *)&v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247380000, v55, v56, "Item at %s didn't return a bundle", (uint8_t *)v57, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C553A30](v0, -1, -1);
      MEMORY[0x24C553A30](v57, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*v86)(v54, v19);
    goto LABEL_43;
  }
  if (!objc_msgSend(v29, sel_principalClass))
  {
    unint64_t v58 = v29;
    if (qword_26B12B530 != -1) {
      swift_once();
    }
    uint64_t v59 = __swift_project_value_buffer(v19, (uint64_t)qword_26B12B518);
    swift_beginAccess();
    uint64_t v60 = v80;
    (*v87)(v80, v59, v19);
    LOBYTE(v59) = sub_2473BDC30();
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_2473BD2F0();
    uint64_t v0 = v59;
    if (os_log_type_enabled(v61, (os_log_type_t)v59))
    {
      uint64_t v62 = swift_slowAlloc();
      uint64_t v63 = (void *)swift_slowAlloc();
      id v102 = v63;
      *(_DWORD *)uint64_t v62 = v81;
      swift_bridgeObjectRetain();
      *(void *)(v62 + 4) = sub_2473ABE34(v22, v21, (uint64_t *)&v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247380000, v61, (os_log_type_t)v0, "Item at %s doesn't have a principle class", (uint8_t *)v62, 0xCu);
      swift_arrayDestroy();
      v64 = v63;
      uint64_t v19 = v85;
      MEMORY[0x24C553A30](v64, -1, -1);
      MEMORY[0x24C553A30](v62, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*v86)(v60, v19);
    goto LABEL_5;
  }
  id v88 = v29;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v31 = swift_conformsToProtocol2();
  if (v31) {
    uint64_t v0 = v31;
  }
  else {
    uint64_t v0 = 0;
  }
  if (v31) {
    uint64_t v32 = ObjCClassMetadata;
  }
  else {
    uint64_t v32 = 0;
  }
  if (!v32)
  {
    if (qword_26B12B530 != -1) {
      swift_once();
    }
    uint64_t v19 = v85;
    uint64_t v65 = __swift_project_value_buffer(v85, (uint64_t)qword_26B12B518);
    swift_beginAccess();
    (*v87)((char *)v20, v65, v19);
    LOBYTE(v65) = sub_2473BDC30();
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_2473BD2F0();
    uint64_t v0 = v65;
    if (os_log_type_enabled(v66, (os_log_type_t)v65))
    {
      uint64_t v67 = swift_slowAlloc();
      uint64_t v68 = (void *)swift_slowAlloc();
      id v102 = v68;
      *(_DWORD *)uint64_t v67 = v81;
      swift_bridgeObjectRetain();
      *(void *)(v67 + 4) = sub_2473ABE34(v22, v21, (uint64_t *)&v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247380000, v66, (os_log_type_t)v0, "Plugin %s doesn't conform to the AccountsUISettingsPlugin protocol", (uint8_t *)v67, 0xCu);
      swift_arrayDestroy();
      char v69 = v68;
      uint64_t v19 = v85;
      MEMORY[0x24C553A30](v69, -1, -1);
      MEMORY[0x24C553A30](v67, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*v86)((char *)v20, v19);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v88, sel_load);
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v104 = v32;
  uint64_t v105 = v0;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v102);
  v33(v32, v0);
  uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16))(v32, v0);
  uint64_t v35 = *(void *)(v34 + 16);
  uint64_t v82 = v34;
  if (!v35)
  {
LABEL_36:

    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v102);
    uint64_t v19 = v85;
LABEL_43:
    uint64_t v20 = v84;
    goto LABEL_5;
  }
  uint64_t v20 = (uint64_t *)(v34 + 40);
  while (1)
  {
    uint64_t v0 = *(v20 - 1);
    uint64_t v42 = *v20;
    sub_24738EB6C((uint64_t)&v102, (uint64_t)&v99);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v98 = v11;
    uint64_t v3 = (char *)v11;
    unint64_t v45 = sub_24738A980(v0, v42);
    uint64_t v46 = v11[2];
    BOOL v47 = (v44 & 1) == 0;
    uint64_t v48 = v46 + v47;
    if (__OFADD__(v46, v47))
    {
      __break(1u);
      goto LABEL_59;
    }
    char v49 = v44;
    if (v11[3] >= v48)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24738CF68();
      }
      goto LABEL_30;
    }
    sub_24738C7B8(v48, isUniquelyReferenced_nonNull_native);
    unint64_t v50 = sub_24738A980(v0, v42);
    if ((v49 & 1) != (v51 & 1)) {
      break;
    }
    unint64_t v45 = v50;
LABEL_30:
    uint64_t v11 = v98;
    if (v49)
    {
      uint64_t v52 = v98[7] + 40 * v45;
      __swift_destroy_boxed_opaque_existential_1(v52);
      sub_24738EB54(&v99, v52);
    }
    else
    {
      uint64_t v36 = v100;
      uint64_t v37 = v101;
      uint64_t v38 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v99, v100);
      MEMORY[0x270FA5388](v38);
      char v40 = (char *)&v77 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v41 + 16))(v40);
      sub_24738D30C(v45, v0, v42, (uint64_t)v40, v11, v36, v37);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v99);
      swift_bridgeObjectRetain();
    }
    v20 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v35) {
      goto LABEL_36;
    }
  }
  uint64_t result = sub_2473BDEE0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AccountsUIModel(uint64_t a1)
{
  return sub_24738ECF0(a1, (uint64_t *)&unk_26B12B088);
}

uint64_t sub_24738E544()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24738E57C(unint64_t a1, void *a2)
{
  return sub_247387290(a1, a2, *(uint8_t **)(v2 + 16));
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

unint64_t sub_24738E59C(id *a1)
{
  return (unint64_t)sub_2473870B8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_24738E5BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24738E5D0(a1, a2);
  }
  return a1;
}

uint64_t sub_24738E5D0(uint64_t a1, unint64_t a2)
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

uint64_t sub_24738E628(uint64_t a1)
{
  return a1;
}

uint64_t sub_24738E67C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for Dataclass(uint64_t a1)
{
}

uint64_t _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(unint64_t a1, unsigned __int8 *a2)
{
  int v30 = *a2;
  uint64_t v32 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_45;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      if (v3 < 1)
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        JUMPOUT(0x24738EAE0);
      }
      uint64_t v4 = 0;
      id v27 = (void *)*MEMORY[0x263EFAD08];
      char v26 = (void *)*MEMORY[0x263EFAC50];
      uint64_t v25 = (void *)*MEMORY[0x263EFAC60];
      uint64_t v24 = (void *)*MEMORY[0x263EFACE8];
      id v29 = (void *)*MEMORY[0x263EFACB8];
      uint64_t v28 = *MEMORY[0x263EFAC68];
      uint64_t v31 = v3;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v5 = (id)MEMORY[0x24C553330](v4, a1);
        }
        else {
          id v5 = *(id *)(a1 + 32 + 8 * v4);
        }
        uint64_t v6 = v5;
        if (qword_26B12AFA8 != -1) {
          swift_once();
        }
        uint64_t v7 = off_26B12B3E8;
        swift_bridgeObjectRetain();
        id v8 = objc_msgSend(v6, sel_accountType);
        if (!v8) {
          goto LABEL_48;
        }
        uint64_t v9 = v8;
        id v10 = objc_msgSend(v8, sel_identifier);

        if (!v10) {
          goto LABEL_49;
        }
        uint64_t v11 = sub_2473BDAD0();
        uint64_t v13 = v12;

        uint64_t v14 = v7[2];
        if (v14) {
          break;
        }
        swift_bridgeObjectRelease();
LABEL_32:
        swift_bridgeObjectRelease();

LABEL_6:
        if (++v4 == v3)
        {
          swift_bridgeObjectRelease();
          return v32;
        }
      }
      if (v7[4] == v11 && v7[5] == v13 || (sub_2473BDEB0() & 1) != 0)
      {
LABEL_18:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v15 = objc_msgSend(v6, sel_parentAccount);

        if (v15)
        {

          uint64_t v3 = v31;
        }
        else
        {
          id v16 = v29;
          uint64_t v3 = v31;
          switch(v30)
          {
            case 0:
              goto LABEL_41;
            case 1:
              goto LABEL_37;
            case 2:
              id v16 = v24;
              goto LABEL_37;
            case 3:
              id v16 = v25;
              goto LABEL_37;
            case 4:
              id v16 = v26;
              goto LABEL_37;
            case 5:
              id v16 = v27;
LABEL_37:
              id v21 = v16;
              break;
            default:
              id v21 = 0;
              uint64_t v3 = v31;
              break;
          }
          unsigned __int8 v22 = objc_msgSend(v6, sel_isProvisionedForDataclass_, v21);

          if ((v22 & 1) != 0
            || v30 == 3 && (objc_msgSend(v6, sel_isProvisionedForDataclass_, v28) & 1) != 0)
          {
LABEL_41:
            sub_2473BDDD0();
            sub_2473BDE00();
            sub_2473BDE10();
            sub_2473BDDE0();
          }
          else
          {
          }
        }
        goto LABEL_6;
      }
      if (v14 == 1) {
        break;
      }
      long long v17 = v7 + 7;
      uint64_t v18 = 1;
      while (1)
      {
        uint64_t v19 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          break;
        }
        BOOL v20 = *(v17 - 1) == v11 && *v17 == v13;
        if (v20 || (sub_2473BDEB0() & 1) != 0) {
          goto LABEL_18;
        }
        v17 += 2;
        ++v18;
        if (v19 == v14) {
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_45:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_2473BDE30();
      if (!v3) {
        goto LABEL_46;
      }
    }
LABEL_31:
    swift_bridgeObjectRelease();
    uint64_t v3 = v31;
    goto LABEL_32;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24738EAF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24738EB54(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24738EB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

unint64_t sub_24738EC68()
{
  unint64_t result = qword_2692495C8;
  if (!qword_2692495C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692495C8);
  }
  return result;
}

uint64_t sub_24738ECBC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_24738ECC8()
{
  return type metadata accessor for AccountGroup(0);
}

uint64_t type metadata accessor for AccountGroup(uint64_t a1)
{
  return sub_24738ECF0(a1, qword_26B12B0E0);
}

uint64_t sub_24738ECF0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24738ED28()
{
  sub_24738FD34(319, (unint64_t *)&unk_26B12B370, &qword_26B12B3E0);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
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

uint64_t sub_24738EE24()
{
  return type metadata accessor for AccountsUIModel(0);
}

void sub_24738EE2C()
{
  sub_24738FD34(319, &qword_26B12B398, (uint64_t *)&unk_26B12B408);
  if (v0 <= 0x3F)
  {
    sub_247390118(319, &qword_26B12B380, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
    if (v1 <= 0x3F)
    {
      sub_24738FD34(319, &qword_26B12B348, &qword_26B12B3B0);
      if (v2 <= 0x3F)
      {
        sub_24738FD34(319, &qword_26B12B330, (uint64_t *)&unk_26B12B0C0);
        if (v3 <= 0x3F)
        {
          sub_24738FD34(319, (unint64_t *)&unk_26B12B338, (uint64_t *)&unk_26B12B3A0);
          if (v4 <= 0x3F)
          {
            sub_24738FD34(319, &qword_26B12B350, &qword_26B12B3C0);
            if (v5 <= 0x3F)
            {
              sub_24738FD34(319, &qword_26B12B368, (uint64_t *)&unk_26B12B3D0);
              if (v6 <= 0x3F)
              {
                sub_24738FD34(319, (unint64_t *)&unk_26B12B370, &qword_26B12B3E0);
                if (v7 <= 0x3F) {
                  swift_updateClassMetadata2();
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t method lookup function for AccountsUIModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountsUIModel);
}

uint64_t dispatch thunk of AccountsUIModel.settingsHost.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AccountsUIModel.settingsHost.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AccountsUIModel.settingsHost.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AccountsUIModel.addAccountShown.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AccountsUIModel.addAccountShown.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AccountsUIModel.addAccountShown.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AccountsUIModel.$addAccountShown.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AccountsUIModel.$addAccountShown.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AccountsUIModel.$addAccountShown.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AccountsUIModel.deleteAccountShown.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of AccountsUIModel.deleteAccountShown.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of AccountsUIModel.deleteAccountShown.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of AccountsUIModel.$deleteAccountShown.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AccountsUIModel.$deleteAccountShown.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AccountsUIModel.$deleteAccountShown.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AccountsUIModel.showsAccountFooterView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of AccountsUIModel.showsAccountFooterView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of AccountsUIModel.showsAccountFooterView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of AccountsUIModel.$showsAccountFooterView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of AccountsUIModel.$showsAccountFooterView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of AccountsUIModel.$showsAccountFooterView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x300))();
}

uint64_t dispatch thunk of AccountsUIModel.allowAccountModification.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of AccountsUIModel.willSelect(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of AccountsUIModel.revealElement(forKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of AccountsUIModel.selectAddedAccount(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of AccountsUIModel.didSelect()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of AccountsUIModel.didUnselect()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of AccountsUIModel.open(url:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of AccountsUIModel.selectedDeleteAccount()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of AccountsUIModel.filter.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of AccountsUIModel.filter.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of AccountsUIModel.filter.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of AccountsUIModel.suggestionStore.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of AccountsUIModel.suggestionStore.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of AccountsUIModel.suggestionStore.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of AccountsUIModel.monitoredStore.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of AccountsUIModel.monitoredStore.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x430))();
}

uint64_t dispatch thunk of AccountsUIModel.monitoredStore.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x438))();
}

uint64_t dispatch thunk of AccountsUIModel.filteredAccounts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x470))();
}

uint64_t dispatch thunk of AccountsUIModel.filteredAccounts.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x478))();
}

uint64_t dispatch thunk of AccountsUIModel.filteredAccounts.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of AccountsUIModel.$filteredAccounts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of AccountsUIModel.$filteredAccounts.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of AccountsUIModel.$filteredAccounts.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x498))();
}

uint64_t dispatch thunk of AccountsUIModel.accountWasAdded(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4D0))();
}

uint64_t dispatch thunk of AccountsUIModel.accountWasModified(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4D8))();
}

uint64_t dispatch thunk of AccountsUIModel.accountWasRemoved(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4E0))();
}

uint64_t dispatch thunk of AccountsUIModel.accountCredentialChanged(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4E8))();
}

uint64_t dispatch thunk of AccountsUIModel.plugin(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x508))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x510))();
}

uint64_t dispatch thunk of AccountsUIModel.detailModel(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x518))();
}

void sub_24738FD34(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2473BD390();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccountsUIModel.FilterType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountsUIModel.FilterType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24738FEF0);
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

uint64_t sub_24738FF18(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24738FF20(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountsUIModel.FilterType()
{
  return &type metadata for AccountsUIModel.FilterType;
}

uint64_t destroy for AccountsUIModel.PluginManager()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void *_s18AccountsUISettings15AccountsUIModelC13PluginManagerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AccountsUIModel.PluginManager(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AccountsUIModel.PluginManager(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountsUIModel.PluginManager(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountsUIModel.PluginManager(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AccountsUIModel.PluginManager()
{
  return &type metadata for AccountsUIModel.PluginManager;
}

void type metadata accessor for ACDataclassActionType(uint64_t a1)
{
}

void sub_247390118(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_247390164()
{
  return sub_2473901AC(&qword_269249650, type metadata accessor for Dataclass);
}

uint64_t sub_2473901AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2473901F4()
{
  return sub_2473901AC(&qword_269249658, type metadata accessor for Dataclass);
}

uint64_t sub_24739023C()
{
  return sub_2473901AC(&qword_269249660, type metadata accessor for ACDataclassActionType);
}

uint64_t sub_247390284()
{
  return sub_2473901AC(&qword_269249668, type metadata accessor for Dataclass);
}

uint64_t sub_2473902CC()
{
  sub_247390310(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247390310(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_247390320()
{
  unint64_t result = qword_269249680;
  if (!qword_269249680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249680);
  }
  return result;
}

unint64_t sub_247390374()
{
  unint64_t result = qword_269249688;
  if (!qword_269249688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249688);
  }
  return result;
}

uint64_t sub_2473903D0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_247390410()
{
  return sub_2473887E4();
}

unint64_t sub_247390420()
{
  unint64_t result = qword_26B12B5B0;
  if (!qword_26B12B5B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B12B5A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12B5B0);
  }
  return result;
}

void sub_24739047C()
{
  sub_247388858(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2473904A0(uint64_t a1, uint64_t a2)
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
  uint64_t v21 = sub_2473BDE30();
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
    uint64_t v7 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2473BDE30();
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
  *uint64_t v3 = MEMORY[0x24C553340](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_2473BDE30();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_2473BDE70();
          __break(1u);
          return result;
        }
        long long v17 = (char *)(v13 + 8 * v2);
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
        uint64_t v23 = sub_2473BDE30();
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
  return sub_2473BDB90();
}

uint64_t sub_2473907BC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a3)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    unint64_t v20 = 0xEB00000000646567;
    a2 = 0x616E616D5F746F6ELL;
LABEL_30:
    type metadata accessor for AccountGroup(0);
    char v26 = (void *)swift_allocObject();
    long long v26[2] = a2;
    id v26[3] = v20;
    v26[4] = v3;
    v26[5] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3E0);
    sub_2473BD330();
    swift_endAccess();
    return (uint64_t)v26;
  }
  unint64_t v8 = a1 >> 62;
  if (!(a1 >> 62))
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_4;
    }
LABEL_26:
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  if (!sub_2473BDE30()) {
    goto LABEL_26;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v10 = *(id *)(a1 + 32);
      uint64_t v3 = ACAccount.displayUserName.getter();
      uint64_t v4 = v11;

      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v12 = *(id *)(a1 + 32);
        goto LABEL_8;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v28 = (void *)MEMORY[0x24C553330](0, a1);
  uint64_t v3 = ACAccount.displayUserName.getter();
  uint64_t v4 = v29;

  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x24C553330](0, a1);
  swift_bridgeObjectRelease();
LABEL_8:
  id v13 = objc_msgSend(v12, sel_accountType);

  if (v13)
  {
    id v14 = objc_msgSend(v13, sel_identifier);

    if (v14)
    {
      uint64_t v15 = sub_2473BDAD0();
      uint64_t v17 = v16;

      uint64_t v18 = sub_2473BDAD0();
      if (v17)
      {
        if (v15 == v18 && v17 == v19)
        {
          swift_bridgeObjectRelease_n();
LABEL_16:
          if (!v8)
          {
            if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
LABEL_21:
              if ((a1 & 0xC000000000000001) == 0)
              {
                if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  id v24 = *(id *)(a1 + 32);
                  if (!v8)
                  {
LABEL_24:
                    uint64_t v25 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    goto LABEL_37;
                  }
LABEL_36:
                  swift_bridgeObjectRetain();
                  uint64_t v25 = sub_2473BDE30();
                  swift_bridgeObjectRelease();
LABEL_37:
                  if (v25)
                  {
                    sub_2473904A0(0, 1);

                    goto LABEL_29;
                  }
                  goto LABEL_41;
                }
                __break(1u);
LABEL_40:
                __break(1u);
LABEL_41:
                __break(1u);
                goto LABEL_42;
              }
LABEL_35:
              id v24 = (id)MEMORY[0x24C553330](0, a1);
              if (!v8) {
                goto LABEL_24;
              }
              goto LABEL_36;
            }
            __break(1u);
          }
          swift_bridgeObjectRetain();
          uint64_t v22 = sub_2473BDE30();
          swift_bridgeObjectRelease();
          if (!v22) {
            goto LABEL_40;
          }
          swift_bridgeObjectRetain();
          uint64_t v23 = sub_2473BDE30();
          swift_bridgeObjectRelease();
          if (v23) {
            goto LABEL_21;
          }
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
        char v21 = sub_2473BDEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v21) {
          goto LABEL_16;
        }
LABEL_29:
        unint64_t v20 = a3;
        goto LABEL_30;
      }
LABEL_28:
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
LABEL_27:
    sub_2473BDAD0();
    goto LABEL_28;
  }
LABEL_42:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_247390B78(uint64_t a1)
{
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v21 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (v5)
  {
    unint64_t v8 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v9 = v8 | (v7 << 6);
LABEL_23:
    id v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v15 = *v13;
    unint64_t v14 = v13[1];
    if (*v13 != 0x616E616D5F746F6ELL || v14 != 0xEB00000000646567)
    {
      unint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
      uint64_t result = sub_2473BDEB0();
      if ((result & 1) == 0)
      {
        if (v17 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (sub_2473BDE30() < 1) {
            goto LABEL_4;
          }
LABEL_30:
          sub_2473907BC(v17, v15, v14);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_2473BD370();
          swift_release();
          swift_release();
          if (v22 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v19 = sub_2473BDE30();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v19 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v20 = swift_bridgeObjectRelease();
          if (v19)
          {
            MEMORY[0x24C5530F0](v20);
            if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2473BDBA0();
            }
            sub_2473BDBC0();
            uint64_t result = sub_2473BDB90();
          }
          else
          {
            uint64_t result = swift_release();
          }
        }
        else
        {
          uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v18 >= 1) {
            goto LABEL_30;
          }
LABEL_4:
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
        }
      }
    }
  }
  int64_t v10 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v10 >= v21) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v10);
  ++v7;
  if (v11) {
    goto LABEL_22;
  }
  int64_t v7 = v10 + 1;
  if (v10 + 1 >= v21) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v7);
  if (v11) {
    goto LABEL_22;
  }
  int64_t v7 = v10 + 2;
  if (v10 + 2 >= v21) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v7);
  if (v11) {
    goto LABEL_22;
  }
  int64_t v7 = v10 + 3;
  if (v10 + 3 >= v21) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v7);
  if (v11)
  {
LABEL_22:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v7 << 6);
    goto LABEL_23;
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v21)
  {
LABEL_40:
    swift_release();
    return v23;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v12);
  if (v11)
  {
    int64_t v7 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v7 >= v21) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v2 + 8 * v7);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

void *sub_247390F20(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2473BDE30();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      unint64_t v12 = v1;
      unint64_t v13 = v1 & 0xC000000000000001;
      uint64_t v3 = 4;
      while (1)
      {
        if (v13) {
          id v4 = (id)MEMORY[0x24C553330](v3 - 4, v1);
        }
        else {
          id v4 = *(id *)(v1 + 8 * v3);
        }
        unint64_t v5 = v4;
        uint64_t v6 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
        {
          __break(1u);
          goto LABEL_19;
        }
        id v7 = objc_msgSend(v4, sel_identifier);
        swift_getKeyPath();
        swift_getKeyPath();
        sub_2473BD370();
        swift_release();
        swift_release();
        id v8 = objc_msgSend(v14, sel_identifier);

        if (!v7) {
          break;
        }
        if (!v8)
        {
          id v8 = v7;
LABEL_5:

          goto LABEL_6;
        }
        sub_2473911B4(0, &qword_2692495C0);
        id v9 = v7;
        char v10 = sub_2473BDC90();

        unint64_t v1 = v12;
        if (v10)
        {
LABEL_17:
          swift_bridgeObjectRelease();
          return v5;
        }
LABEL_6:

        ++v3;
        if (v6 == v2) {
          goto LABEL_20;
        }
      }
      if (!v8) {
        goto LABEL_17;
      }
      goto LABEL_5;
    }
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_247391120(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247391184()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2473911B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2473911F0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_247391238()
{
  sub_247385B60(v0[2], v0[3], v0[4]);
}

uint64_t sub_247391244(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2473912A0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473912E0()
{
  return sub_24738785C();
}

uint64_t sub_247391310()
{
  return sub_2473878BC(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
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

unint64_t sub_247391470(id *a1)
{
  return sub_24738E59C(a1) & 1;
}

Swift::Bool __swiftcall ACAccount.appearsActive()()
{
  if (objc_getAssociatedObject(v0, "appearsActive"))
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_247391614((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_24739167C((uint64_t)v10);
LABEL_8:
    id v2 = objc_msgSend(v0, sel_enabledDataclasses);
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = objc_msgSend(v2, sel_count);

      if ((uint64_t)v4 > 0)
      {
        unsigned __int8 v1 = 1;
        goto LABEL_15;
      }
      id v2 = objc_msgSend(v0, sel_provisionedDataclasses);
      if (v2)
      {
        uint64_t v5 = v2;
        id v6 = objc_msgSend(v2, sel_count);

        if (v6) {
          unsigned __int8 v1 = 0;
        }
        else {
          unsigned __int8 v1 = objc_msgSend(v0, sel_isActive);
        }
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return (char)v2;
  }
  sub_2473911B4(0, &qword_269249720);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_8;
  }
  unsigned __int8 v1 = objc_msgSend(v8, sel_BOOLValue);

LABEL_15:
  LOBYTE(v2) = v1;
  return (char)v2;
}

uint64_t sub_247391614(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24739167C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ACAccount.displayUserName.getter()
{
  id v1 = objc_msgSend(v0, sel_username);
  if (v1)
  {

    uint64_t result = (uint64_t)objc_msgSend(v0, sel_username);
    if (!result)
    {
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v3 = (void *)result;
    uint64_t v4 = sub_2473BDAD0();
    unint64_t v6 = v5;

    swift_bridgeObjectRelease();
    uint64_t v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v7) {
      goto LABEL_17;
    }
  }
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_accountType);
  if (!result)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  id v8 = (void *)result;
  id v9 = objc_msgSend((id)result, sel_identifier);

  if (!v9)
  {
    sub_2473BDAD0();
    goto LABEL_16;
  }
  uint64_t v10 = sub_2473BDAD0();
  uint64_t v12 = v11;

  uint64_t v13 = sub_2473BDAD0();
  if (!v12)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v10 == v13 && v12 == v14)
  {
    swift_bridgeObjectRelease_n();
LABEL_23:
    id v17 = objc_msgSend(v0, sel_accountDescription);
    goto LABEL_18;
  }
  char v16 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_23;
  }
LABEL_17:
  id v17 = objc_msgSend(v0, sel_username);
LABEL_18:
  id v18 = v17;
  if (!v18) {
    return 0x4E574F4E4B4E55;
  }
  uint64_t v19 = sub_2473BDAD0();

  return v19;
}

uint64_t sub_2473918B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_2473BDEB0() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_2473BDEB0();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

id ACAccount.id.getter()
{
  id result = objc_msgSend(v0, sel_identifier);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_2473BDAD0();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ACAccount.sortedProvisionedDataclasses.getter()
{
  if (objc_msgSend(v0, sel_provisionedDataclasses))
  {
    uint64_t v2 = 0;
    type metadata accessor for Dataclass(0);
    sub_2473963D8();
    sub_2473BDC00();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_247391AF8()
{
  uint64_t v15 = sub_2473BDAD0();
  uint64_t v16 = v0;
  sub_247396A54();
  uint64_t v1 = sub_2473BDCE0();
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2473BDB00();
    unint64_t v4 = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xE700000000000000;
    uint64_t v2 = 0x4E574F4E4B4E55;
  }
  unint64_t v5 = (void *)sub_2473BDA90();
  id v6 = objc_msgSend(self, sel_bundleWithIdentifier_, v5, 46, 0xE100000000000000, v15, v16);

  if (!v6)
  {
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  sub_2473BDB20();
  BOOL v7 = (void *)sub_2473BDA90();
  swift_bridgeObjectRelease();
  sub_2473BDCF0();
  id v8 = (void *)sub_2473BDA90();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  uint64_t v10 = sub_2473BDAD0();
  unint64_t v12 = v11;

  uint64_t v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
  }
  if (!v13 || v10 == v2 && v12 == v4)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v14 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  if (v14) {
LABEL_13:
  }
    swift_bridgeObjectRelease();
}

uint64_t ACAccountDataclass.icon.getter()
{
  return 0;
}

Swift::String_optional __swiftcall ACAccount.formattedDataclassString()()
{
  uint64_t v1 = 0;
  uint64_t v2 = 0;
  if (!ACAccount.appearsActive()())
  {
    unint64_t v3 = (void *)sub_2473BDA90();
    id v4 = objc_msgSend(self, sel_bundleWithIdentifier_, v3);

    if (!v4)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v5 = (void *)sub_2473BDA90();
    id v6 = (void *)sub_2473BDA90();
    id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

    uint64_t v1 = sub_2473BDAD0();
    uint64_t v2 = v8;
  }
  id v9 = objc_msgSend(v0, sel_enabledDataclasses);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_count);

  if ((uint64_t)v11 > 0)
  {
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v0, sel_enabledDataclasses);
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = objc_msgSend(v12, sel_count);

      if (v14 == (id)1)
      {
        id v15 = objc_msgSend(v0, sel_enabledDataclasses);
        if (!v15)
        {
LABEL_40:
          __break(1u);
          uint64_t v42 = swift_release();
          __break(1u);
          goto LABEL_41;
        }
        uint64_t v16 = v15;
        id v17 = objc_msgSend(v15, sel_anyObject);

        if (v17)
        {
          sub_2473BDD10();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v49, 0, sizeof(v49));
        }
        sub_247391614((uint64_t)v49, (uint64_t)v50);
        if (v50[3])
        {
          type metadata accessor for Dataclass(0);
          if (swift_dynamicCast())
          {
            uint64_t v18 = sub_2473BDAD0();
            uint64_t v20 = v19;
            if (v18 == sub_2473BDAD0() && v20 == v21)
            {
              swift_bridgeObjectRelease_n();
LABEL_33:
              sub_247391AF8();
              uint64_t v1 = v45;
              uint64_t v2 = v46;

              goto LABEL_31;
            }
            char v44 = sub_2473BDEB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v44) {
              goto LABEL_33;
            }
          }
        }
        else
        {
          sub_24739167C((uint64_t)v50);
        }
      }
      id v22 = objc_msgSend(v0, sel_enabledDataclasses);
      if (v22)
      {
        uint64_t v23 = v22;
        v50[0] = 0;
        type metadata accessor for Dataclass(0);
        sub_2473963D8();
        sub_2473BDC00();
        if (v50[0])
        {

          uint64_t v24 = swift_bridgeObjectRetain();
          uint64_t v25 = sub_247392F50(v24);
          swift_bridgeObjectRelease();
          v50[0] = v25;
          sub_2473931C0(v50);
          swift_bridgeObjectRelease();
          char v26 = v50[0];
          uint64_t v27 = v50[0][2];
          if (v27)
          {
            swift_retain();
            uint64_t v28 = 0;
            uint64_t v29 = (void *)MEMORY[0x263F8EE78];
            do
            {
              id v31 = (id)v26[v28 + 4];
              sub_247391AF8();
              uint64_t v33 = v32;
              uint64_t v35 = v34;

              if (v35)
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v29 = sub_247392D48(0, v29[2] + 1, 1, v29);
                }
                unint64_t v37 = v29[2];
                unint64_t v36 = v29[3];
                if (v37 >= v36 >> 1) {
                  uint64_t v29 = sub_247392D48((void *)(v36 > 1), v37 + 1, 1, v29);
                }
                v29[2] = v37 + 1;
                int v30 = &v29[2 * v37];
                v30[4] = v33;
                v30[5] = v35;
              }
              ++v28;
            }
            while (v27 != v28);
            swift_release();
          }
          swift_release();
          uint64_t v38 = self;
          uint64_t v39 = (void *)sub_2473BDB70();
          swift_bridgeObjectRelease();
          id v40 = objc_msgSend(v38, sel_localizedStringByJoiningStrings_, v39);

          uint64_t v1 = sub_2473BDAD0();
          uint64_t v2 = v41;

          goto LABEL_31;
        }
        goto LABEL_38;
      }
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_31:
  uint64_t v42 = v1;
  unint64_t v43 = v2;
LABEL_41:
  result.value._object = v43;
  result.value._countAndFlagsBits = v42;
  return result;
}

uint64_t ACAccount.userFullName.getter()
{
  if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x263EFAD78]))
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_247391614((uint64_t)&v9, (uint64_t)v11);
  if (!v12) {
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x263EFADB8]))
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_247391614((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    sub_24739167C((uint64_t)v11);
    goto LABEL_15;
  }
  if (swift_dynamicCast())
  {
    id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A68]), sel_init);
    uint64_t v2 = (void *)sub_2473BDA90();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setGivenName_, v2);

    if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x263EFADD0]))
    {
      sub_2473BDD10();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }
    sub_247391614((uint64_t)&v9, (uint64_t)v11);
    if (v12)
    {
      if (swift_dynamicCast())
      {
        id v4 = (void *)sub_2473BDA90();
        swift_bridgeObjectRelease();
LABEL_30:
        objc_msgSend(v1, sel_setMiddleName_, v4);

        unint64_t v5 = (void *)sub_2473BDA90();
        swift_bridgeObjectRelease();
        objc_msgSend(v1, sel_setFamilyName_, v5);

        id v6 = objc_msgSend(self, sel_localizedStringFromPersonNameComponents_style_options_, v1, 2, 0);
        uint64_t v3 = sub_2473BDAD0();

        return v3;
      }
    }
    else
    {
      sub_24739167C((uint64_t)v11);
    }
    id v4 = 0;
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
LABEL_15:
  if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x263EFAD80]))
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_247391614((uint64_t)&v9, (uint64_t)v11);
  if (v12)
  {
    if (swift_dynamicCast()) {
      return v8;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_24739167C((uint64_t)v11);
    return 0;
  }
}

uint64_t ACAccount.enabledDataclassesLocalized()()
{
  return MEMORY[0x263F8EE78];
}

void sub_2473925BC(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_identifier);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_2473BDAD0();
    uint64_t v7 = v6;

    *a1 = v5;
    a1[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

id sub_24739261C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249728);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2473BEF10;
  id v1 = (void *)*MEMORY[0x263EFAD48];
  uint64_t v2 = (void *)*MEMORY[0x263EFACB8];
  *(void *)(v0 + 32) = *MEMORY[0x263EFAD48];
  *(void *)(v0 + 40) = v2;
  id v3 = (void *)*MEMORY[0x263EFAC60];
  id v4 = (void *)*MEMORY[0x263EFAC50];
  *(void *)(v0 + 48) = *MEMORY[0x263EFAC60];
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = (void *)*MEMORY[0x263EFAC28];
  uint64_t v6 = (void *)*MEMORY[0x263EFAD08];
  *(void *)(v0 + 64) = *MEMORY[0x263EFAC28];
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = (void *)*MEMORY[0x263EFACC8];
  uint64_t v8 = (void *)*MEMORY[0x263EFACE8];
  *(void *)(v0 + 80) = *MEMORY[0x263EFACC8];
  *(void *)(v0 + 88) = v8;
  long long v9 = (void *)*MEMORY[0x263EFACE0];
  long long v10 = (void *)*MEMORY[0x263EFAC90];
  *(void *)(v0 + 96) = *MEMORY[0x263EFACE0];
  *(void *)(v0 + 104) = v10;
  id v11 = (void *)*MEMORY[0x263EFACC0];
  uint64_t v35 = (void *)*MEMORY[0x263EFAD28];
  uint64_t v12 = *MEMORY[0x263EFAD28];
  *(void *)(v0 + 112) = *MEMORY[0x263EFACC0];
  *(void *)(v0 + 120) = v12;
  uint64_t v34 = (void *)*MEMORY[0x263EFAD30];
  unint64_t v37 = (void *)*MEMORY[0x263EFAC68];
  uint64_t v13 = *MEMORY[0x263EFAC68];
  *(void *)(v0 + 128) = *MEMORY[0x263EFAD30];
  *(void *)(v0 + 136) = v13;
  unint64_t v36 = (void *)*MEMORY[0x263EFAC78];
  uint64_t v39 = (void *)*MEMORY[0x263EFAC20];
  uint64_t v14 = *MEMORY[0x263EFAC20];
  *(void *)(v0 + 144) = *MEMORY[0x263EFAC78];
  *(void *)(v0 + 152) = v14;
  uint64_t v38 = (void *)*MEMORY[0x263EFACD8];
  id v40 = (id)*MEMORY[0x263EFAD40];
  uint64_t v15 = *MEMORY[0x263EFAD40];
  *(void *)(v0 + 160) = *MEMORY[0x263EFACD8];
  *(void *)(v0 + 168) = v15;
  qword_26924A158 = v0;
  id v16 = v1;
  id v17 = v2;
  id v18 = v3;
  id v19 = v4;
  id v20 = v5;
  id v21 = v6;
  id v22 = v7;
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v27 = v35;
  id v28 = v34;
  id v29 = v37;
  id v30 = v36;
  id v31 = v39;
  id v32 = v38;
  return v40;
}

void *sub_247392818()
{
  Swift::String_optional result = sub_247392838();
  off_26B12B3E8 = result;
  return result;
}

void *sub_247392838()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B418);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2473BEF20;
  *(void *)(v0 + 32) = sub_2473BDAD0();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_2473BDAD0();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = sub_2473BDAD0();
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = sub_2473BDAD0();
  *(void *)(v0 + 88) = v4;
  *(void *)(v0 + 96) = sub_2473BDAD0();
  *(void *)(v0 + 104) = v5;
  *(void *)(v0 + 112) = sub_2473BDAD0();
  *(void *)(v0 + 120) = v6;
  *(void *)(v0 + 128) = sub_2473BDAD0();
  *(void *)(v0 + 136) = v7;
  *(void *)(v0 + 144) = sub_2473BDAD0();
  *(void *)(v0 + 152) = v8;
  id v18 = (void *)v0;
  if (qword_26B12B3F0 != -1) {
    swift_once();
  }
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_2473881F4(v9);
  uint64_t v10 = sub_2473BDAD0();
  uint64_t v12 = v11;
  uint64_t v13 = v18;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_247392D48(0, v18[2] + 1, 1, v18);
  }
  unint64_t v15 = v13[2];
  unint64_t v14 = v13[3];
  if (v15 >= v14 >> 1) {
    uint64_t v13 = sub_247392D48((void *)(v14 > 1), v15 + 1, 1, v13);
  }
  v13[2] = v15 + 1;
  id v16 = &v13[2 * v15];
  v16[4] = v10;
  v16[5] = v12;
  return v13;
}

uint64_t static ACAccountType.internetAccountTypes.getter()
{
  if (qword_26B12AFA8 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_247392A60()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B418);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2473BEF30;
  *(void *)(v0 + 32) = sub_2473BDAD0();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_2473BDAD0();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = sub_2473BDAD0();
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = sub_2473BDAD0();
  *(void *)(v0 + 88) = v4;
  uint64_t result = sub_2473BDAD0();
  *(void *)(v0 + 96) = result;
  *(void *)(v0 + 104) = v6;
  qword_26B12B610 = v0;
  return result;
}

uint64_t sub_247392B10()
{
  objc_msgSend(v0, sel_type);
  uint64_t v1 = (void *)sub_2473BDA90();
  id v2 = objc_msgSend(self, sel_bundleWithIdentifier_, v1);

  if (!v2)
  {
    __break(1u);
    JUMPOUT(0x247392D24);
  }
  uint64_t v3 = (void *)sub_2473BDA90();
  uint64_t v4 = (void *)sub_2473BDA90();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  uint64_t v6 = sub_2473BDAD0();
  return v6;
}

void *sub_247392D48(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B418);
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
    sub_247395C64(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_247392E58(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5E8);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_2473953E4((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

void *sub_247392F50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249728);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  unint64_t v6 = sub_247395A68(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_247396B60();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_247393038(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249728);
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
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for Dataclass(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

void sub_2473931C0(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_247395A54(v2);
  }
  uint64_t v3 = v2[2];
  v4[0] = (uint64_t)(v2 + 4);
  v4[1] = v3;
  sub_24739322C(v4);
  *a1 = v2;
}

void sub_24739322C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_2473BDEA0();
  if (v4 < v3)
  {
    uint64_t v209 = v4;
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1)
    {
LABEL_291:
      sub_2473BDE20();
      __break(1u);
      return;
    }
    uint64_t v211 = v3;
    v207 = a1;
    if (v3 < 2)
    {
      uint64_t v8 = (char *)MEMORY[0x263F8EE78];
      __dst = (void **)(MEMORY[0x263F8EE78] + 32);
      uint64_t v208 = MEMORY[0x263F8EE78];
      if (v3 != 1)
      {
        unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_250:
        if (v12 >= 2)
        {
          uint64_t v200 = *v207;
          do
          {
            unint64_t v201 = v12 - 2;
            if (v12 < 2) {
              goto LABEL_278;
            }
            if (!v200) {
              goto LABEL_290;
            }
            uint64_t v202 = *(void *)&v8[16 * v201 + 32];
            uint64_t v203 = *(void *)&v8[16 * v12 + 24];
            sub_247394808((void **)(v200 + 8 * v202), (id *)(v200 + 8 * *(void *)&v8[16 * v12 + 16]), (id *)(v200 + 8 * v203), __dst);
            if (v1) {
              break;
            }
            if (v203 < v202) {
              goto LABEL_279;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v8 = sub_2473953D0((uint64_t)v8);
            }
            if (v201 >= *((void *)v8 + 2)) {
              goto LABEL_280;
            }
            v204 = &v8[16 * v201 + 32];
            *(void *)v204 = v202;
            *((void *)v204 + 1) = v203;
            unint64_t v205 = *((void *)v8 + 2);
            if (v12 > v205) {
              goto LABEL_281;
            }
            memmove(&v8[16 * v12 + 16], &v8[16 * v12 + 32], 16 * (v205 - v12));
            *((void *)v8 + 2) = v205 - 1;
            unint64_t v12 = v205 - 1;
          }
          while (v205 > 2);
        }
LABEL_261:
        swift_bridgeObjectRelease();
        *(void *)(v208 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      uint64_t v6 = v5 >> 1;
      type metadata accessor for Dataclass(0);
      uint64_t v7 = sub_2473BDBB0();
      *(void *)(v7 + 16) = v6;
      uint64_t v208 = v7;
      __dst = (void **)(v7 + 32);
    }
    uint64_t v9 = 0;
    uint64_t v10 = *a1;
    uint64_t v206 = *a1 - 8;
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    uint64_t v11 = v211;
    uint64_t v219 = *a1;
    while (1)
    {
      uint64_t v13 = v9++;
      v216 = v8;
      uint64_t v218 = v13;
      if (v9 >= v11) {
        goto LABEL_133;
      }
      unint64_t v14 = *(void **)(v10 + 8 * v13);
      uint64_t v15 = qword_269249570;
      id v222 = *(id *)(v10 + 8 * v9);
      id v16 = v14;
      if (v15 != -1) {
        swift_once();
      }
      uint64_t v17 = *(void *)(qword_26924A158 + 16);
      uint64_t v213 = v9;
      if (!v17)
      {
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_29;
      }
      uint64_t v18 = sub_2473BDAD0();
      uint64_t v20 = v19;
      if (v18 == sub_2473BDAD0() && v20 == v21)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v23 = sub_2473BDEB0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0)
        {
          uint64_t v24 = 0;
          uint64_t v33 = v17 - 1;
          while (1)
          {
            if (v33 == v24)
            {
              swift_bridgeObjectRelease();
              uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_28;
            }
            uint64_t v34 = sub_2473BDAD0();
            uint64_t v36 = v35;
            if (v34 == sub_2473BDAD0() && v36 == v37) {
              break;
            }
            char v39 = sub_2473BDEB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            ++v24;
            uint64_t v8 = v216;
            if (v39)
            {
              swift_bridgeObjectRelease();
              goto LABEL_28;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          ++v24;
          uint64_t v8 = v216;
          goto LABEL_28;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v24 = 0;
LABEL_28:
      uint64_t v9 = v213;
LABEL_29:
      uint64_t v25 = *(void *)(qword_26924A158 + 16);
      if (v25)
      {
        uint64_t v26 = sub_2473BDAD0();
        uint64_t v28 = v27;
        if (v26 == sub_2473BDAD0() && v28 == v29)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_37;
        }
        char v31 = sub_2473BDEB0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v31)
        {

          swift_bridgeObjectRelease();
LABEL_37:
          uint64_t v32 = 0;
          uint64_t v9 = v213;
          goto LABEL_68;
        }
        uint64_t v40 = 0;
        uint64_t v41 = v25 - 1;
        while (1)
        {
          if (v41 == v40)
          {
            swift_bridgeObjectRelease();
            uint64_t v8 = v216;
            uint64_t v10 = v219;
            uint64_t v9 = v213;
            goto LABEL_56;
          }
          uint64_t v42 = v40;
          uint64_t v43 = sub_2473BDAD0();
          uint64_t v45 = v44;
          if (v43 == sub_2473BDAD0() && v45 == v46) {
            break;
          }
          char v48 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v40 = v42 + 1;
          if (v48)
          {
            swift_bridgeObjectRelease();
            goto LABEL_65;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_65:
        uint64_t v9 = v213;
        uint64_t v32 = v42 + 1;
        uint64_t v8 = v216;
        uint64_t v10 = v219;
        if (v24 == 0x7FFFFFFFFFFFFFFFLL && v42 == 0x7FFFFFFFFFFFFFFELL)
        {
LABEL_57:
          uint64_t v49 = sub_2473BDAD0();
          uint64_t v51 = v50;
          if (v49 == sub_2473BDAD0() && v51 == v52) {
            int v220 = 0;
          }
          else {
            int v220 = sub_2473BDEB0();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          goto LABEL_69;
        }
      }
      else
      {
LABEL_56:
        if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_57;
        }

        uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_68:
      int v220 = v24 < v32;
LABEL_69:
      uint64_t v53 = v218 + 2;
      if (v218 + 2 < v211)
      {
        while (1)
        {
          uint64_t v54 = *(void **)(v10 + 8 * v53);
          uint64_t v55 = *(void **)(v10 + 8 * v9);
          uint64_t v56 = *(void *)(qword_26924A158 + 16);
          uint64_t v223 = v53;
          if (v56)
          {
            uint64_t v57 = sub_2473BDAD0();
            uint64_t v59 = v58;
            if (v57 == sub_2473BDAD0() && v59 == v60)
            {
              id v68 = v54;
              id v69 = v55;
              swift_bridgeObjectRelease_n();
              uint64_t v65 = 0;
            }
            else
            {
              char v62 = sub_2473BDEB0();
              id v63 = v54;
              id v64 = v55;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v62)
              {
                swift_bridgeObjectRelease();
                uint64_t v65 = 0;
              }
              else
              {
                uint64_t v65 = 0;
                while (1)
                {
                  if (v56 - 1 == v65)
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
                    goto LABEL_89;
                  }
                  uint64_t v70 = sub_2473BDAD0();
                  uint64_t v72 = v71;
                  if (v70 == sub_2473BDAD0() && v72 == v73) {
                    break;
                  }
                  char v75 = sub_2473BDEB0();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  ++v65;
                  if (v75)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_89;
                  }
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                ++v65;
LABEL_89:
                uint64_t v8 = v216;
              }
            }
          }
          else
          {
            id v66 = v54;
            id v67 = v55;
            uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
          }
          uint64_t v76 = *(void *)(qword_26924A158 + 16);
          if (v76)
          {
            uint64_t v77 = sub_2473BDAD0();
            uint64_t v79 = v78;
            if (v77 == sub_2473BDAD0() && v79 == v80)
            {

              swift_bridgeObjectRelease_n();
              uint64_t v83 = 0;
            }
            else
            {
              char v82 = sub_2473BDEB0();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v82)
              {

                swift_bridgeObjectRelease();
                uint64_t v83 = 0;
              }
              else
              {
                uint64_t v84 = 0;
                uint64_t v85 = v76 - 1;
                while (1)
                {
                  if (v85 == v84)
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v8 = v216;
                    goto LABEL_107;
                  }
                  uint64_t v86 = v84;
                  uint64_t v87 = sub_2473BDAD0();
                  uint64_t v89 = v88;
                  if (v87 == sub_2473BDAD0() && v89 == v90) {
                    break;
                  }
                  char v92 = sub_2473BDEB0();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v84 = v86 + 1;
                  if (v92)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_115;
                  }
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
LABEL_115:
                uint64_t v83 = v86 + 1;
                if (v65 == 0x7FFFFFFFFFFFFFFFLL && v86 == 0x7FFFFFFFFFFFFFFELL)
                {
                  uint64_t v8 = v216;
LABEL_108:
                  uint64_t v93 = sub_2473BDAD0();
                  uint64_t v95 = v94;
                  uint64_t v53 = v223;
                  if (v93 == sub_2473BDAD0() && v95 == v96) {
                    int v97 = 0;
                  }
                  else {
                    int v97 = sub_2473BDEB0();
                  }
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();

                  uint64_t v10 = v219;
                  goto LABEL_120;
                }

                uint64_t v8 = v216;
              }
            }
          }
          else
          {
LABEL_107:
            if (v65 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_108;
            }

            uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
          }
          int v97 = v65 < v83;
          uint64_t v10 = v219;
          uint64_t v53 = v223;
LABEL_120:
          if ((v220 ^ v97)) {
            break;
          }
          uint64_t v9 = v53++;
          if (v53 == v211)
          {
            uint64_t v53 = v211;
            break;
          }
        }
      }
      if (v220)
      {
        uint64_t v13 = v218;
        if (v53 < v218) {
          goto LABEL_284;
        }
        if (v218 < v53)
        {
          uint64_t v98 = (uint64_t *)(v206 + 8 * v53);
          uint64_t v99 = v53;
          uint64_t v100 = v218;
          uint64_t v101 = (uint64_t *)(v10 + 8 * v218);
          while (1)
          {
            if (v100 != --v99)
            {
              if (!v10) {
                goto LABEL_289;
              }
              uint64_t v102 = *v101;
              *uint64_t v101 = *v98;
              *uint64_t v98 = v102;
            }
            ++v100;
            --v98;
            ++v101;
            if (v100 >= v99) {
              goto LABEL_131;
            }
          }
        }
        uint64_t v9 = v53;
      }
      else
      {
LABEL_131:
        uint64_t v9 = v53;
        uint64_t v13 = v218;
      }
LABEL_133:
      if (v9 >= v211) {
        goto LABEL_199;
      }
      if (__OFSUB__(v9, v13)) {
        goto LABEL_282;
      }
      if (v9 - v13 >= v209) {
        goto LABEL_199;
      }
      if (__OFADD__(v218, v209)) {
        goto LABEL_285;
      }
      uint64_t v103 = v211;
      if (v218 + v209 < v211) {
        uint64_t v103 = v218 + v209;
      }
      if (v103 < v218)
      {
LABEL_286:
        __break(1u);
LABEL_287:
        __break(1u);
LABEL_288:
        __break(1u);
LABEL_289:
        __break(1u);
LABEL_290:
        __break(1u);
        goto LABEL_291;
      }
      uint64_t v210 = v103;
      if (v9 != v103)
      {
        while (1)
        {
          uint64_t v104 = *(void **)(v10 + 8 * v9);
          uint64_t v214 = v9;
LABEL_145:
          uint64_t v224 = v9;
          uint64_t v221 = v9 - 1;
          uint64_t v105 = *(void **)(v10 + 8 * (v9 - 1));
          uint64_t v106 = qword_269249570;
          id v107 = v104;
          id v108 = v105;
          if (v106 != -1) {
            swift_once();
          }
          uint64_t v109 = *(void *)(qword_26924A158 + 16);
          if (!v109)
          {
            uint64_t v116 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_157;
          }
          uint64_t v110 = sub_2473BDAD0();
          uint64_t v112 = v111;
          if (v110 == sub_2473BDAD0() && v112 == v113) {
            break;
          }
          char v115 = sub_2473BDEB0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v115)
          {
            swift_bridgeObjectRelease();
LABEL_156:
            uint64_t v116 = 0;
            goto LABEL_157;
          }
          uint64_t v116 = 0;
          uint64_t v125 = v109 - 1;
          while (1)
          {
            if (v125 == v116)
            {
              swift_bridgeObjectRelease();
              uint64_t v116 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_157;
            }
            uint64_t v126 = sub_2473BDAD0();
            uint64_t v128 = v127;
            if (v126 == sub_2473BDAD0() && v128 == v129) {
              break;
            }
            char v131 = sub_2473BDEB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            ++v116;
            if (v131)
            {
              swift_bridgeObjectRelease();
              goto LABEL_157;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          ++v116;
LABEL_157:
          uint64_t v117 = *(void *)(qword_26924A158 + 16);
          if (!v117) {
            goto LABEL_183;
          }
          uint64_t v118 = sub_2473BDAD0();
          uint64_t v120 = v119;
          if (v118 == sub_2473BDAD0() && v120 == v121)
          {

            swift_bridgeObjectRelease_n();
            uint64_t v124 = 0;
            goto LABEL_194;
          }
          char v123 = sub_2473BDEB0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v123)
          {

            swift_bridgeObjectRelease();
            uint64_t v124 = 0;
            goto LABEL_194;
          }
          uint64_t v132 = 0;
          uint64_t v133 = v117 - 1;
          while (v133 != v132)
          {
            uint64_t v134 = v132;
            uint64_t v135 = sub_2473BDAD0();
            uint64_t v137 = v136;
            if (v135 == sub_2473BDAD0() && v137 == v138)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              goto LABEL_191;
            }
            char v140 = sub_2473BDEB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v132 = v134 + 1;
            if (v140)
            {
              swift_bridgeObjectRelease();
LABEL_191:
              uint64_t v124 = v134 + 1;
              uint64_t v8 = v216;
              if (v116 == 0x7FFFFFFFFFFFFFFFLL && v134 == 0x7FFFFFFFFFFFFFFELL) {
                goto LABEL_184;
              }

LABEL_194:
              uint64_t v10 = v219;
              uint64_t v146 = v224;
              if (v116 >= v124) {
                goto LABEL_143;
              }
LABEL_195:
              if (!v10) {
                goto LABEL_287;
              }
              uint64_t v147 = 8 * v146;
              uint64_t v104 = *(void **)(v10 + 8 * v146);
              *(void *)(v10 + v147) = *(void *)(v10 + 8 * v221);
              *(void *)(v10 + 8 * v221) = v104;
              uint64_t v9 = v221;
              if (v221 == v218) {
                goto LABEL_143;
              }
              goto LABEL_145;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v8 = v216;
LABEL_183:
          if (v116 != 0x7FFFFFFFFFFFFFFFLL)
          {

            uint64_t v124 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_194;
          }
LABEL_184:
          uint64_t v141 = sub_2473BDAD0();
          uint64_t v143 = v142;
          if (v141 == sub_2473BDAD0() && v143 == v144)
          {

            swift_bridgeObjectRelease_n();
            uint64_t v10 = v219;
          }
          else
          {
            char v145 = sub_2473BDEB0();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v10 = v219;
            uint64_t v146 = v224;
            if (v145) {
              goto LABEL_195;
            }
          }
LABEL_143:
          uint64_t v9 = v214 + 1;
          if (v214 + 1 == v210)
          {
            uint64_t v9 = v210;
            goto LABEL_199;
          }
        }
        swift_bridgeObjectRelease_n();
        goto LABEL_156;
      }
LABEL_199:
      if (v9 < v218) {
        goto LABEL_277;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_247395218(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v149 = *((void *)v8 + 2);
      unint64_t v148 = *((void *)v8 + 3);
      unint64_t v12 = v149 + 1;
      uint64_t v150 = v218;
      if (v149 >= v148 >> 1)
      {
        v199 = sub_247395218((char *)(v148 > 1), v149 + 1, 1, v8);
        uint64_t v150 = v218;
        uint64_t v8 = v199;
      }
      *((void *)v8 + 2) = v12;
      v217 = v8;
      v151 = v8 + 32;
      v152 = &v8[16 * v149 + 32];
      *(void *)v152 = v150;
      *((void *)v152 + 1) = v9;
      if (v149)
      {
        uint64_t v215 = v9;
        while (1)
        {
          unint64_t v153 = v12 - 1;
          if (v12 >= 4)
          {
            v158 = &v151[16 * v12];
            uint64_t v159 = *((void *)v158 - 8);
            uint64_t v160 = *((void *)v158 - 7);
            BOOL v164 = __OFSUB__(v160, v159);
            uint64_t v161 = v160 - v159;
            if (v164) {
              goto LABEL_266;
            }
            uint64_t v163 = *((void *)v158 - 6);
            uint64_t v162 = *((void *)v158 - 5);
            BOOL v164 = __OFSUB__(v162, v163);
            uint64_t v156 = v162 - v163;
            char v157 = v164;
            if (v164) {
              goto LABEL_267;
            }
            unint64_t v165 = v12 - 2;
            v166 = &v151[16 * v12 - 32];
            uint64_t v168 = *(void *)v166;
            uint64_t v167 = *((void *)v166 + 1);
            BOOL v164 = __OFSUB__(v167, v168);
            uint64_t v169 = v167 - v168;
            if (v164) {
              goto LABEL_269;
            }
            BOOL v164 = __OFADD__(v156, v169);
            uint64_t v170 = v156 + v169;
            if (v164) {
              goto LABEL_272;
            }
            if (v170 >= v161)
            {
              v188 = &v151[16 * v153];
              uint64_t v190 = *(void *)v188;
              uint64_t v189 = *((void *)v188 + 1);
              BOOL v164 = __OFSUB__(v189, v190);
              uint64_t v191 = v189 - v190;
              if (v164) {
                goto LABEL_276;
              }
              BOOL v181 = v156 < v191;
              goto LABEL_237;
            }
          }
          else
          {
            if (v12 != 3)
            {
              uint64_t v182 = *((void *)v217 + 4);
              uint64_t v183 = *((void *)v217 + 5);
              BOOL v164 = __OFSUB__(v183, v182);
              uint64_t v175 = v183 - v182;
              char v176 = v164;
              goto LABEL_231;
            }
            uint64_t v155 = *((void *)v217 + 4);
            uint64_t v154 = *((void *)v217 + 5);
            BOOL v164 = __OFSUB__(v154, v155);
            uint64_t v156 = v154 - v155;
            char v157 = v164;
          }
          if (v157) {
            goto LABEL_268;
          }
          unint64_t v165 = v12 - 2;
          v171 = &v151[16 * v12 - 32];
          uint64_t v173 = *(void *)v171;
          uint64_t v172 = *((void *)v171 + 1);
          BOOL v174 = __OFSUB__(v172, v173);
          uint64_t v175 = v172 - v173;
          char v176 = v174;
          if (v174) {
            goto LABEL_271;
          }
          v177 = &v151[16 * v153];
          uint64_t v179 = *(void *)v177;
          uint64_t v178 = *((void *)v177 + 1);
          BOOL v164 = __OFSUB__(v178, v179);
          uint64_t v180 = v178 - v179;
          if (v164) {
            goto LABEL_274;
          }
          if (__OFADD__(v175, v180)) {
            goto LABEL_275;
          }
          if (v175 + v180 >= v156)
          {
            BOOL v181 = v156 < v180;
LABEL_237:
            if (v181) {
              unint64_t v153 = v165;
            }
            goto LABEL_239;
          }
LABEL_231:
          if (v176) {
            goto LABEL_270;
          }
          v184 = &v151[16 * v153];
          uint64_t v186 = *(void *)v184;
          uint64_t v185 = *((void *)v184 + 1);
          BOOL v164 = __OFSUB__(v185, v186);
          uint64_t v187 = v185 - v186;
          if (v164) {
            goto LABEL_273;
          }
          if (v187 < v175) {
            goto LABEL_14;
          }
LABEL_239:
          unint64_t v192 = v153 - 1;
          if (v153 - 1 >= v12)
          {
            __break(1u);
LABEL_263:
            __break(1u);
LABEL_264:
            __break(1u);
LABEL_265:
            __break(1u);
LABEL_266:
            __break(1u);
LABEL_267:
            __break(1u);
LABEL_268:
            __break(1u);
LABEL_269:
            __break(1u);
LABEL_270:
            __break(1u);
LABEL_271:
            __break(1u);
LABEL_272:
            __break(1u);
LABEL_273:
            __break(1u);
LABEL_274:
            __break(1u);
LABEL_275:
            __break(1u);
LABEL_276:
            __break(1u);
LABEL_277:
            __break(1u);
LABEL_278:
            __break(1u);
LABEL_279:
            __break(1u);
LABEL_280:
            __break(1u);
LABEL_281:
            __break(1u);
LABEL_282:
            __break(1u);
LABEL_283:
            __break(1u);
LABEL_284:
            __break(1u);
LABEL_285:
            __break(1u);
            goto LABEL_286;
          }
          if (!v10) {
            goto LABEL_288;
          }
          v193 = &v151[16 * v192];
          uint64_t v194 = *(void *)v193;
          unint64_t v195 = v153;
          v196 = &v151[16 * v153];
          uint64_t v197 = *((void *)v196 + 1);
          sub_247394808((void **)(v10 + 8 * *(void *)v193), (id *)(v10 + 8 * *(void *)v196), (id *)(v10 + 8 * v197), __dst);
          if (v1) {
            goto LABEL_261;
          }
          if (v197 < v194) {
            goto LABEL_263;
          }
          if (v195 > *((void *)v217 + 2)) {
            goto LABEL_264;
          }
          *(void *)v193 = v194;
          *(void *)&v151[16 * v192 + 8] = v197;
          unint64_t v198 = *((void *)v217 + 2);
          if (v195 >= v198) {
            goto LABEL_265;
          }
          unint64_t v12 = v198 - 1;
          memmove(v196, v196 + 16, 16 * (v198 - 1 - v195));
          *((void *)v217 + 2) = v198 - 1;
          uint64_t v9 = v215;
          if (v198 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v12 = 1;
LABEL_14:
      uint64_t v11 = v211;
      uint64_t v8 = v217;
      if (v9 >= v211) {
        goto LABEL_250;
      }
    }
  }
  if (v3 < 0) {
    goto LABEL_283;
  }
  if (v3) {
    sub_24739439C(0, v3, 1, a1);
  }
}

void sub_24739439C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a1;
    uint64_t v5 = *a4;
    uint64_t v52 = *a4;
LABEL_6:
    uint64_t v6 = *(void **)(v5 + 8 * a3);
    uint64_t v50 = a3;
    while (1)
    {
      uint64_t v53 = a3 - 1;
      uint64_t v54 = a3;
      uint64_t v7 = *(void **)(v5 + 8 * (a3 - 1));
      uint64_t v8 = qword_269249570;
      id v9 = v6;
      id v55 = v7;
      if (v8 != -1) {
        swift_once();
      }
      uint64_t v10 = *(void *)(qword_26924A158 + 16);
      if (!v10)
      {
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_19;
      }
      uint64_t v11 = sub_2473BDAD0();
      uint64_t v13 = v12;
      if (v11 == sub_2473BDAD0() && v13 == v14) {
        break;
      }
      char v16 = sub_2473BDEB0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        uint64_t v17 = 0;
        goto LABEL_19;
      }
      uint64_t v17 = 0;
      uint64_t v26 = v10 - 1;
      while (1)
      {
        if (v26 == v17)
        {
          swift_bridgeObjectRelease();
          uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_19;
        }
        uint64_t v27 = sub_2473BDAD0();
        uint64_t v29 = v28;
        if (v27 == sub_2473BDAD0() && v29 == v30) {
          break;
        }
        char v32 = sub_2473BDEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++v17;
        if (v32)
        {
          swift_bridgeObjectRelease();
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      ++v17;
LABEL_19:
      uint64_t v18 = *(void *)(qword_26924A158 + 16);
      if (v18)
      {
        uint64_t v19 = sub_2473BDAD0();
        uint64_t v21 = v20;
        if (v19 == sub_2473BDAD0() && v21 == v22)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_27;
        }
        char v24 = sub_2473BDEB0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v24)
        {

          swift_bridgeObjectRelease();
LABEL_27:
          uint64_t v25 = 0;
          uint64_t v5 = v52;
          goto LABEL_57;
        }
        uint64_t v33 = 0;
        uint64_t v34 = v18 - 1;
        uint64_t v5 = v52;
        while (1)
        {
          if (v34 == v33)
          {
            swift_bridgeObjectRelease();
            uint64_t v4 = a1;
            goto LABEL_46;
          }
          uint64_t v35 = v33;
          uint64_t v36 = sub_2473BDAD0();
          uint64_t v38 = v37;
          if (v36 == sub_2473BDAD0() && v38 == v39) {
            break;
          }
          char v41 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v33 = v35 + 1;
          if (v41)
          {
            swift_bridgeObjectRelease();
            goto LABEL_54;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_54:
        uint64_t v25 = v35 + 1;
        uint64_t v4 = a1;
        if (v17 != 0x7FFFFFFFFFFFFFFFLL || v35 != 0x7FFFFFFFFFFFFFFELL)
        {

LABEL_57:
          uint64_t v47 = v54;
          if (v17 >= v25) {
            goto LABEL_5;
          }
          goto LABEL_58;
        }
      }
      else
      {
LABEL_46:
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {

          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_57;
        }
      }
      uint64_t v42 = sub_2473BDAD0();
      uint64_t v44 = v43;
      if (v42 == sub_2473BDAD0() && v44 == v45)
      {

        swift_bridgeObjectRelease_n();
LABEL_5:
        a3 = v50 + 1;
        if (v50 + 1 == a2) {
          return;
        }
        goto LABEL_6;
      }
      char v46 = sub_2473BDEB0();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v47 = v54;
      if ((v46 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_58:
      if (!v5)
      {
        __break(1u);
        return;
      }
      uint64_t v48 = 8 * v47;
      uint64_t v6 = *(void **)(v5 + 8 * v47);
      *(void *)(v5 + v48) = *(void *)(v5 + 8 * v53);
      *(void *)(v5 + 8 * v53) = v6;
      a3 = v53;
      if (v53 == v4) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
}

uint64_t sub_247394808(void **__src, id *a2, id *a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = (char *)a3 - (char *)a2;
  uint64_t v12 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0) {
    uint64_t v12 = (char *)a3 - (char *)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v120 = __src;
  uint64_t v119 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 < -7) {
      goto LABEL_145;
    }
    if (__dst != a2 || &a2[v13] <= __dst) {
      memmove(__dst, a2, 8 * v13);
    }
    uint64_t v58 = &v4[v13];
    uint64_t v118 = v58;
    uint64_t v120 = v6;
    if (v7 >= v6 || v11 < 8)
    {
LABEL_144:
      sub_247395314((void **)&v120, (const void **)&v119, &v118);
      return 1;
    }
    uint64_t v59 = v6;
    id v107 = v4;
    uint64_t v113 = v7;
    while (1)
    {
      char v115 = v5;
      uint64_t v117 = v6;
      uint64_t v60 = *(v59 - 1);
      id v108 = v59 - 1;
      uint64_t v109 = v58 - 1;
      uint64_t v61 = qword_269249570;
      id v62 = *(v58 - 1);
      id v63 = v60;
      if (v61 != -1) {
        swift_once();
      }
      uint64_t v64 = *(void *)(qword_26924A158 + 16);
      uint64_t v111 = v58;
      if (!v64)
      {
        uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_95;
      }
      uint64_t v65 = sub_2473BDAD0();
      uint64_t v67 = v66;
      if (v65 == sub_2473BDAD0() && v67 == v68) {
        break;
      }
      char v70 = sub_2473BDEB0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v70)
      {
        swift_bridgeObjectRelease();
LABEL_94:
        uint64_t v71 = 0;
        goto LABEL_95;
      }
      uint64_t v71 = 0;
      uint64_t v80 = v64 - 1;
      while (1)
      {
        if (v80 == v71)
        {
          swift_bridgeObjectRelease();
          uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_95;
        }
        uint64_t v81 = sub_2473BDAD0();
        uint64_t v83 = v82;
        if (v81 == sub_2473BDAD0() && v83 == v84) {
          break;
        }
        char v86 = sub_2473BDEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++v71;
        if (v86)
        {
          swift_bridgeObjectRelease();
          goto LABEL_95;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      ++v71;
LABEL_95:
      uint64_t v72 = *(void *)(qword_26924A158 + 16);
      if (v72)
      {
        uint64_t v73 = sub_2473BDAD0();
        uint64_t v75 = v74;
        if (v73 == sub_2473BDAD0() && v75 == v76)
        {

          swift_bridgeObjectRelease_n();
          uint64_t v79 = 0;
          goto LABEL_138;
        }
        char v78 = sub_2473BDEB0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v78)
        {

          swift_bridgeObjectRelease();
          uint64_t v79 = 0;
          goto LABEL_138;
        }
        uint64_t v87 = 0;
        uint64_t v88 = v72 - 1;
        while (1)
        {
          if (v88 == v87)
          {
            swift_bridgeObjectRelease();
            uint64_t v4 = v107;
            goto LABEL_121;
          }
          uint64_t v89 = v87;
          uint64_t v90 = sub_2473BDAD0();
          uint64_t v92 = v91;
          if (v90 == sub_2473BDAD0() && v92 == v93) {
            break;
          }
          char v95 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v87 = v89 + 1;
          if (v95)
          {
            swift_bridgeObjectRelease();
            goto LABEL_135;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_135:
        uint64_t v79 = v89 + 1;
        uint64_t v4 = v107;
        if (v71 != 0x7FFFFFFFFFFFFFFFLL || v89 != 0x7FFFFFFFFFFFFFFELL)
        {

LABEL_138:
          unint64_t v101 = (unint64_t)v113;
          uint64_t v100 = v115;
          uint64_t v5 = v115 - 1;
          BOOL v104 = v71 < v79;
          unint64_t v102 = (unint64_t)v117;
          uint64_t v58 = v111;
          if (!v104) {
            goto LABEL_127;
          }
          goto LABEL_140;
        }
      }
      else
      {
LABEL_121:
        if (v71 != 0x7FFFFFFFFFFFFFFFLL)
        {

          uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_138;
        }
      }
      uint64_t v96 = sub_2473BDAD0();
      uint64_t v98 = v97;
      if (v96 == sub_2473BDAD0() && v98 == v99)
      {

        swift_bridgeObjectRelease_n();
        unint64_t v101 = (unint64_t)v113;
        uint64_t v100 = v115;
        uint64_t v5 = v115 - 1;
        unint64_t v102 = (unint64_t)v117;
        uint64_t v58 = v111;
LABEL_127:
        uint64_t v118 = v109;
        if (v100 < v58 || v5 >= v58 || v100 != v58) {
          *uint64_t v5 = *v109;
        }
        uint64_t v59 = (id *)v102;
        uint64_t v58 = v109;
        if (v102 <= v101) {
          goto LABEL_144;
        }
        goto LABEL_82;
      }
      char v103 = sub_2473BDEB0();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v101 = (unint64_t)v113;
      uint64_t v100 = v115;
      uint64_t v5 = v115 - 1;
      unint64_t v102 = (unint64_t)v117;
      uint64_t v58 = v111;
      if ((v103 & 1) == 0) {
        goto LABEL_127;
      }
LABEL_140:
      uint64_t v59 = v108;
      if (v100 != (void **)v102 || (unint64_t)v5 >= v102) {
        *uint64_t v5 = *v108;
      }
      uint64_t v120 = v108;
      if ((unint64_t)v108 <= v101) {
        goto LABEL_144;
      }
LABEL_82:
      uint64_t v6 = v59;
      if (v58 <= v4) {
        goto LABEL_144;
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_94;
  }
  if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v110 = &v4[v10];
    uint64_t v118 = v110;
    if (v6 < v5 && v8 >= 8)
    {
      v114 = v5;
      while (1)
      {
        uint64_t v112 = v7;
        uint64_t v116 = v6;
        uint64_t v14 = *v4;
        uint64_t v15 = qword_269249570;
        id v16 = *v6;
        id v17 = v14;
        if (v15 != -1) {
          swift_once();
        }
        uint64_t v18 = *(void *)(qword_26924A158 + 16);
        if (v18)
        {
          uint64_t v19 = sub_2473BDAD0();
          uint64_t v21 = v20;
          BOOL v23 = v19 == sub_2473BDAD0() && v21 == v22;
          if (v23)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v25 = 0;
          }
          else
          {
            char v24 = sub_2473BDEB0();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v24)
            {
              swift_bridgeObjectRelease();
              uint64_t v25 = 0;
            }
            else
            {
              uint64_t v25 = 0;
              while (1)
              {
                if (v18 - 1 == v25)
                {
                  swift_bridgeObjectRelease();
                  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_34;
                }
                uint64_t v26 = sub_2473BDAD0();
                uint64_t v28 = v27;
                if (v26 == sub_2473BDAD0() && v28 == v29) {
                  break;
                }
                char v31 = sub_2473BDEB0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                ++v25;
                if (v31)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_34;
                }
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              ++v25;
            }
          }
        }
        else
        {
          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_34:
        uint64_t v32 = *(void *)(qword_26924A158 + 16);
        if (v32)
        {
          uint64_t v33 = sub_2473BDAD0();
          uint64_t v35 = v34;
          if (v33 == sub_2473BDAD0() && v35 == v36)
          {

            swift_bridgeObjectRelease_n();
            uint64_t v39 = 0;
            goto LABEL_56;
          }
          char v38 = sub_2473BDEB0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v38)
          {

            swift_bridgeObjectRelease();
            uint64_t v39 = 0;
            goto LABEL_56;
          }
          uint64_t v106 = v4;
          uint64_t v40 = 0;
          uint64_t v41 = v32 - 1;
          while (1)
          {
            if (v41 == v40)
            {
              swift_bridgeObjectRelease();
              uint64_t v4 = v106;
              goto LABEL_51;
            }
            uint64_t v42 = v40;
            uint64_t v43 = sub_2473BDAD0();
            uint64_t v45 = v44;
            if (v43 == sub_2473BDAD0() && v45 == v46) {
              break;
            }
            char v48 = sub_2473BDEB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v40 = v42 + 1;
            if (v48)
            {
              swift_bridgeObjectRelease();
              goto LABEL_69;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
LABEL_69:
          uint64_t v39 = v42 + 1;
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {

            uint64_t v4 = v106;
LABEL_56:
            uint64_t v53 = v112;
            uint64_t v54 = v114;
            id v55 = v116;
            if (v25 >= v39) {
              goto LABEL_62;
            }
            goto LABEL_57;
          }
          BOOL v23 = v42 == 0x7FFFFFFFFFFFFFFELL;
          uint64_t v4 = v106;
          if (!v23)
          {

            goto LABEL_56;
          }
        }
        else
        {
LABEL_51:
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {

            uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_56;
          }
        }
        uint64_t v49 = sub_2473BDAD0();
        uint64_t v51 = v50;
        if (v49 == sub_2473BDAD0() && v51 == v52)
        {

          swift_bridgeObjectRelease_n();
          uint64_t v53 = v112;
          uint64_t v54 = v114;
          id v55 = v116;
LABEL_62:
          if (v53 != v4) {
            *uint64_t v53 = *v4;
          }
          uint64_t v119 = ++v4;
          uint64_t v56 = v55;
          goto LABEL_65;
        }
        char v57 = sub_2473BDEB0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v53 = v112;
        uint64_t v54 = v114;
        id v55 = v116;
        if ((v57 & 1) == 0) {
          goto LABEL_62;
        }
LABEL_57:
        uint64_t v56 = v55 + 1;
        if (v53 < v55 || v53 >= v56 || v53 != v55) {
          *uint64_t v53 = *v55;
        }
LABEL_65:
        uint64_t v7 = v53 + 1;
        if (v4 < v110)
        {
          uint64_t v6 = v56;
          if (v56 < v54) {
            continue;
          }
        }
        uint64_t v120 = v7;
        goto LABEL_144;
      }
    }
    goto LABEL_144;
  }
LABEL_145:
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

char *sub_247395218(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249730);
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

char *sub_247395314(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_2473BDE70();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_2473953D0(uint64_t a1)
{
  return sub_247395218(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2473953E4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2473BDE30();
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
    uint64_t v10 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_247396B68((unint64_t *)&unk_26B12B5B8, &qword_26B12B3E0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3E0);
          uint64_t v12 = sub_247395814(v16, i, a3);
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
    sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

uint64_t sub_247395604(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2473BDE30();
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
    uint64_t v10 = sub_2473BDE30();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_247396B68(&qword_269249738, &qword_26B12B3C0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3C0);
          uint64_t v12 = sub_247395880(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
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
    type metadata accessor for AccountGroup(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

uint64_t (*sub_247395814(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_247395930(v6, a2, a3);
  return sub_24739587C;
}

uint64_t (*sub_247395880(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2473959B8(v6, a2, a3);
  return sub_24739587C;
}

void sub_2473958E8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_247395930(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C553330](a2, a3);
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
    return destroy for DataclassTable;
  }
  __break(1u);
  return result;
}

void destroy for DataclassTable(id *a1)
{
}

uint64_t (*sub_2473959B8(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x24C553330](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_247395A38;
  }
  __break(1u);
  return result;
}

uint64_t sub_247395A38()
{
  return swift_release();
}

void sub_247395A40()
{
}

uint64_t sub_247395A54(void *a1)
{
  return sub_247393038(0, a1[2], 0, a1);
}

void *sub_247395A68(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
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
  int64_t v11 = a2;
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
    uint64_t v20 = *(void **)(*(void *)(a4 + 48) + 8 * v16);
    *int64_t v11 = v20;
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

uint64_t sub_247395C64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

void _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(void *a1, void *a2)
{
  if (ACAccount.appearsActive()() && !ACAccount.appearsActive()()
    || !ACAccount.appearsActive()() && ACAccount.appearsActive()())
  {
    return;
  }
  id v4 = objc_msgSend(a1, sel_accountType);
  if (!v4)
  {
    __break(1u);
LABEL_65:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_66;
  }
  unint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_identifier);

  if (v6)
  {
    uint64_t v7 = sub_2473BDAD0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = objc_msgSend(a2, sel_accountType);
  if (!v10) {
    goto LABEL_65;
  }
  int64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_identifier);

  if (!v12)
  {
    if (!v9) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  uint64_t v13 = sub_2473BDAD0();
  uint64_t v15 = v14;

  if (!v9)
  {
    if (!v15) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  if (!v15)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v7 == v13 && v9 == v15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  char v30 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) == 0)
  {
LABEL_21:
    if (qword_26B12AFA8 != -1) {
      swift_once();
    }
    unint64_t v16 = off_26B12B3E8;
    swift_bridgeObjectRetain();
    id v17 = objc_msgSend(a1, sel_accountType);
    if (v17)
    {
      unint64_t v18 = v17;
      id v19 = objc_msgSend(v17, sel_identifier);

      if (v19)
      {
        uint64_t v20 = sub_2473BDAD0();
        uint64_t v22 = v21;

        sub_2473918B8(v20, v22, v16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        BOOL v23 = off_26B12B3E8;
        swift_bridgeObjectRetain();
        id v24 = objc_msgSend(a2, sel_accountType);
        if (v24)
        {
          uint64_t v25 = v24;
          id v26 = objc_msgSend(v24, sel_identifier);

          if (v26)
          {
            uint64_t v27 = sub_2473BDAD0();
            uint64_t v29 = v28;

            sub_2473918B8(v27, v29, v23);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return;
          }
          goto LABEL_69;
        }
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
LABEL_29:
  id v31 = objc_msgSend(a1, sel_accountType);
  if (!v31)
  {
LABEL_70:
    __break(1u);
    return;
  }
  uint64_t v32 = v31;
  id v33 = objc_msgSend(v31, sel_identifier);

  if (!v33)
  {
    sub_2473BDAD0();
    goto LABEL_36;
  }
  uint64_t v34 = sub_2473BDAD0();
  uint64_t v36 = v35;

  uint64_t v37 = sub_2473BDAD0();
  if (!v36)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v34 == v37 && v36 == v38)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_43;
  }
  char v49 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v49)
  {
LABEL_43:
    uint64_t v50 = (void *)sub_2473BDA90();
    id v51 = objc_msgSend(a1, sel_accountPropertyForKey_, v50);

    if (v51)
    {
      sub_2473BDD10();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v57 = 0u;
      long long v58 = 0u;
    }
    sub_247391614((uint64_t)&v57, (uint64_t)v59);
    if (v60)
    {
      sub_2473911B4(0, &qword_269249720);
      if (swift_dynamicCast())
      {
        unsigned __int8 v52 = objc_msgSend(v56, sel_BOOLValue);

        goto LABEL_51;
      }
    }
    else
    {
      sub_24739167C((uint64_t)v59);
    }
    unsigned __int8 v52 = 0;
LABEL_51:
    uint64_t v53 = (void *)sub_2473BDA90();
    id v54 = objc_msgSend(a2, sel_accountPropertyForKey_, v53);

    if (v54)
    {
      sub_2473BDD10();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v57 = 0u;
      long long v58 = 0u;
    }
    sub_247391614((uint64_t)&v57, (uint64_t)v59);
    if (v60)
    {
      sub_2473911B4(0, &qword_269249720);
      if (swift_dynamicCast())
      {
        unsigned __int8 v55 = objc_msgSend(v56, sel_BOOLValue);

        if (v52)
        {
          if ((v55 & 1) == 0) {
            return;
          }
        }
        else if (v55)
        {
          return;
        }
        goto LABEL_37;
      }
    }
    else
    {
      sub_24739167C((uint64_t)v59);
    }
    if (v52) {
      return;
    }
  }
LABEL_37:
  id v39 = objc_msgSend(a1, sel_accountDescription);
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = sub_2473BDAD0();
    uint64_t v43 = v42;

    id v44 = objc_msgSend(a2, sel_accountDescription);
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = sub_2473BDAD0();
      uint64_t v48 = v47;

      v59[0] = v41;
      v59[1] = v43;
      *(void *)&long long v57 = v46;
      *((void *)&v57 + 1) = v48;
      sub_247396A54();
      sub_2473BDD00();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_2473963D8()
{
  unint64_t result = qword_2692495A0;
  if (!qword_2692495A0)
  {
    type metadata accessor for Dataclass(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692495A0);
  }
  return result;
}

id sub_247396430(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  id result = (id)MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v34 = MEMORY[0x263F8EE78];
    sub_2473BDDF0();
    for (unint64_t i = (id *)(a1 + 32); ; ++i)
    {
      uint64_t v24 = v3;
      id v7 = *i;
      id result = objc_msgSend(a2, sel_identifier);
      if (!result) {
        break;
      }
      uint64_t v8 = result;
      uint64_t v9 = sub_2473BDAD0();
      uint64_t v22 = v10;
      uint64_t v23 = v9;

      id v11 = v7;
      sub_247391AF8();
      if (v13) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = 0x4E574F4E4B4E55;
      }
      unint64_t v15 = 0xE700000000000000;
      if (v13) {
        unint64_t v15 = v13;
      }
      uint64_t v20 = (void *)v15;
      uint64_t v21 = v14;
      unint64_t v16 = (void *)swift_allocObject();
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = a2;
      v16[5] = v11;
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = 0;
      *(void *)(v17 + 24) = 0;
      id v18 = v11;
      id v19 = a2;
      sub_2473BD940();
      LOBYTE(v25) = 1;
      sub_2473BD950();
      sub_2473BD950();
      type metadata accessor for AccountUISetting.CustomDataclass(0);
      swift_allocObject();
      AccountUISetting.CustomDataclass.init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(v23, v22, v18, v21, v20, 0, v31, v32, v33, v28, v29, v30, v25, v26, v27, 0, 0, 0);

      sub_2473BDDD0();
      sub_2473BDE00();
      sub_2473BDE10();
      sub_2473BDDE0();
      uint64_t v3 = v24 - 1;
      if (v24 == 1) {
        return (id)v34;
      }
    }
    __break(1u);
  }
  return result;
}

void _sSo13ACAccountTypeC18AccountsUISettingsE09localizedB4Name3forS2SSg_tFZ_0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v7[0] = a1;
    v7[1] = a2;
    sub_247396A54();
    if (*(void *)(sub_2473BDCE0() + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_2473BDB00();
      swift_bridgeObjectRelease();
      strcpy((char *)v7, "ACCOUNT_TYPE_");
      HIWORD(v7[1]) = -4864;
      sub_2473BDB20();
      swift_bridgeObjectRelease();
      uint64_t v2 = (void *)sub_2473BDA90();
      id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2, 46, 0xE100000000000000, v7[0], v7[1]);

      if (v3)
      {
        id v4 = (void *)sub_2473BDA90();
        swift_bridgeObjectRelease();
        unint64_t v5 = (void *)sub_2473BDA90();
        id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

        sub_2473BDAD0();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_247396864()
{
  return MEMORY[0x263F8D320];
}

void sub_247396870()
{
  sub_247396A54();
  if (*(void *)(sub_2473BDCE0() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2473BDB00();
    swift_bridgeObjectRelease();
    sub_2473BDD80();
    swift_bridgeObjectRelease();
    sub_2473BDB20();
    swift_bridgeObjectRelease();
    uint64_t v0 = (void *)sub_2473BDA90();
    id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0, 46, 0xE100000000000000, 0xD000000000000012, 0x80000002473C3D00);

    if (v1)
    {
      uint64_t v2 = (void *)sub_2473BDA90();
      swift_bridgeObjectRelease();
      id v3 = (void *)sub_2473BDA90();
      id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, 0);

      sub_2473BDAD0();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_247396A54()
{
  unint64_t result = qword_26B12B3B8;
  if (!qword_26B12B3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12B3B8);
  }
  return result;
}

uint64_t sub_247396AAC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

id sub_247396AF4@<X0>(unsigned char *a1@<X8>)
{
  id result = objc_msgSend(*(id *)(v1 + 32), sel_isEnabledForDataclass_, *(void *)(v1 + 40));
  *a1 = (_BYTE)result;
  return result;
}

uint64_t sub_247396B28()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247396B60()
{
  return swift_release();
}

uint64_t sub_247396B68(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247396BB8()
{
  if (*(void *)(sub_2473BDCE0() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2473BDAF0();
  }
  swift_bridgeObjectRelease();
  sub_2473BDB20();
  swift_bridgeObjectRelease();
  sub_2473BDB20();
  swift_bridgeObjectRelease();
  return 0;
}

void sub_247396CE0(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

BOOL sub_247396D6C(id a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_2473BDE30())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C553330](v5 - 4, a2) : *(id *)(a2 + 8 * v5);
      id v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = objc_msgSend(v6, sel_type);

      BOOL v11 = v9 == a1;
      BOOL v10 = v9 == a1;
      ++v5;
      BOOL v11 = v11 || v8 == v4;
      if (v11) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  BOOL v10 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_247396E68(id a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_2473BDE30())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C553330](v5 - 4, a2) : *(id *)(a2 + 8 * v5);
      id v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v6, sel_type) == a1)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_247396F64(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692498E8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692498F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
LABEL_10:
    type metadata accessor for AccountsUIModel(0);
    sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    sub_2473BD490();
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = a1;
  sub_2473BD370();

  swift_release();
  swift_release();
  BOOL v10 = v20;
  if (v20)
  {
    id v11 = objc_msgSend(v20, sel_provisionedDataclasses);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v20 = 0;
      type metadata accessor for Dataclass(0);
      sub_24739F8C4((unint64_t *)&qword_2692495A0, type metadata accessor for Dataclass);
      sub_2473BDC00();
      if (v20)
      {

        uint64_t v13 = swift_bridgeObjectRetain();
        uint64_t v14 = sub_247392F50(v13);
        swift_bridgeObjectRelease();
        uint64_t v20 = v14;
        sub_2473931C0(&v20);
        swift_bridgeObjectRelease();
        unint64_t v15 = v20;
        unint64_t v16 = v10;
        uint64_t v17 = sub_247396430((uint64_t)v15, v16);
        swift_release();

        uint64_t v20 = v17;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249908);
        sub_2473A041C(&qword_269249910, &qword_269249908);
        sub_2473A03C8();
        sub_24739F8C4(&qword_269249918, (void (*)(uint64_t))type metadata accessor for AccountUISetting.CustomDataclass);
        sub_2473BD970();
        (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v4, v8, v5);
        swift_storeEnumTagMultiPayload();
        sub_24739D8E4(&qword_2692498F8, &qword_2692498F0, (void (*)(void))sub_2473A03C8);
        sub_2473BD5D0();

        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_10;
  }
  swift_storeEnumTagMultiPayload();
  sub_24739D8E4(&qword_2692498F8, &qword_2692498F0, (void (*)(void))sub_2473A03C8);
  return sub_2473BD5D0();
}

uint64_t sub_247397410@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  *(void *)a1 = sub_2473BD4B0();
  *(void *)(a1 + 8) = v2;
  type metadata accessor for AccountUISetting.CustomDataclass(0);
  sub_24739F8C4(&qword_2692498C0, (void (*)(uint64_t))type metadata accessor for AccountUISetting.CustomDataclass);
  *(void *)(a1 + 16) = sub_2473BD440();
  *(void *)(a1 + 24) = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B408);
  sub_2473BD870();
  *(_OWORD *)(a1 + 32) = v5;
  sub_2473BD870();
  *(unsigned char *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *((void *)&v5 + 1);
  sub_2473BD870();
  *(unsigned char *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = *((void *)&v5 + 1);
  sub_2473BD870();
  *(unsigned char *)(a1 + 80) = v5;
  *(void *)(a1 + 88) = *((void *)&v5 + 1);
  sub_2473BD870();
  *(unsigned char *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = *((void *)&v5 + 1);
  sub_2473BD870();
  *(unsigned char *)(a1 + 112) = v5;
  *(void *)(a1 + 120) = *((void *)&v5 + 1);
  sub_2473BD870();
  *(_OWORD *)(a1 + 128) = v5;
  *(void *)(a1 + 144) = v6;
  sub_2473BD870();
  *(_OWORD *)(a1 + 152) = v5;
  *(void *)(a1 + 168) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249598);
  uint64_t result = sub_2473BD870();
  *(_OWORD *)(a1 + 176) = v5;
  return result;
}

uint64_t sub_2473976AC()
{
  return sub_247396F64(*v0);
}

double sub_2473976B4@<D0>(_OWORD *a1@<X8>)
{
  swift_retain();
  sub_247397410((uint64_t)v9);
  long long v2 = v17;
  a1[8] = v16;
  a1[9] = v2;
  long long v3 = v19;
  a1[10] = v18;
  a1[11] = v3;
  long long v4 = v13;
  a1[4] = v12;
  a1[5] = v4;
  long long v5 = v15;
  a1[6] = v14;
  a1[7] = v5;
  long long v6 = v9[1];
  *a1 = v9[0];
  a1[1] = v6;
  double result = *(double *)&v10;
  long long v8 = v11;
  a1[2] = v10;
  a1[3] = v8;
  return result;
}

uint64_t sub_24739774C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  sub_2473BD370();

  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249908);
  sub_2473A041C(&qword_269249910, &qword_269249908);
  sub_2473A03C8();
  sub_24739F8C4(&qword_269249918, (void (*)(uint64_t))type metadata accessor for AccountUISetting.CustomDataclass);
  return sub_2473BD970();
}

void sub_247397890(uint64_t a1@<X2>, unsigned __int8 *a2@<X8>)
{
  long long v10 = *(_OWORD *)(a1 + 16);
  long long v4 = (void *)(*((void *)&v10 + 1)
                + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2473BD370();
    swift_release();
    swift_release();
    sub_24739FA64((uint64_t)&v10);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692498B8);
    MEMORY[0x24C552EB0](v5);
    swift_release();
    swift_release();
  }
  else
  {
    long long v6 = *(void **)a1;
    if (*(void *)a1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v7 = v6;
      sub_2473BD370();

      swift_release();
      swift_release();
      if (v9)
      {
        swift_beginAccess();
        unsigned __int8 v8 = objc_msgSend(v9, sel_isEnabledForDataclass_, *(void *)(*((void *)&v10 + 1) + 32));

        *a2 = v8;
      }
      else
      {
        *a2 = 0;
      }
    }
    else
    {
      sub_247398894(a1);
      type metadata accessor for AccountsUIModel(0);
      sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      sub_2473BD490();
      __break(1u);
    }
  }
}

uint64_t DataclassRow.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249740);
  MEMORY[0x270FA5388](v43);
  long long v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v3;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249748);
  uint64_t v47 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  id v51 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249750);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  uint64_t v49 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v53 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = v1[9];
  long long v81 = v1[8];
  long long v82 = v8;
  long long v9 = v1[11];
  long long v83 = v1[10];
  long long v84 = v9;
  long long v10 = v1[5];
  long long v77 = v1[4];
  long long v78 = v10;
  long long v11 = v1[7];
  long long v79 = v1[6];
  long long v80 = v11;
  long long v12 = v1[1];
  long long v73 = *v1;
  long long v74 = v12;
  long long v13 = v1[3];
  long long v75 = v1[2];
  long long v76 = v13;
  sub_247398158(&v73, (uint64_t)v3);
  long long v69 = v81;
  long long v70 = v82;
  long long v71 = v83;
  long long v72 = v84;
  long long v65 = v77;
  long long v66 = v78;
  long long v67 = v79;
  long long v68 = v80;
  long long v61 = v73;
  long long v62 = v74;
  long long v63 = v75;
  long long v64 = v76;
  long long v59 = v84;
  sub_247398894((uint64_t)&v73);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249758);
  sub_2473BD880();
  unint64_t v14 = (unint64_t)v60;
  long long v59 = v75;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
  sub_2473BD880();
  sub_24739898C((uint64_t)&v73);
  long long v15 = v60;
  sub_24739D1CC(v14);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();

  *(void *)&long long v61 = v17;
  *((void *)&v61 + 1) = v19;
  unint64_t v46 = sub_247396A54();
  uint64_t v20 = sub_2473BD6D0();
  uint64_t v22 = v21;
  uint64_t v42 = v23;
  char v25 = v24 & 1;
  long long v59 = v77;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
  sub_2473BD8A0();
  long long v58 = &v73;
  long long v57 = &v73;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249770);
  uint64_t v41 = sub_24739D8E4(&qword_269249778, &qword_269249740, (void (*)(void))sub_24739D6B0);
  uint64_t v26 = sub_24739D8E4(&qword_2692497D8, &qword_269249770, (void (*)(void))sub_24739D950);
  uint64_t v27 = v43;
  uint64_t v28 = (uint64_t)v45;
  sub_2473BD770();
  swift_release();
  swift_release();
  sub_247390310(v20, v22, v25);
  swift_bridgeObjectRelease();
  sub_24738EAF8(v28, &qword_269249740);
  long long v59 = v78;
  sub_2473BD8A0();
  id v56 = &v73;
  *(void *)&long long v61 = v27;
  *((void *)&v61 + 1) = v40;
  *(void *)&long long v62 = MEMORY[0x263F1A830];
  *((void *)&v62 + 1) = v41;
  *(void *)&long long v63 = v26;
  *((void *)&v63 + 1) = MEMORY[0x263F1A820];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v30 = v52;
  uint64_t v31 = v51;
  sub_2473BD760();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v31, v30);
  long long v61 = v81;
  *(void *)&long long v62 = v82;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
  sub_2473BD880();
  long long v61 = v59;
  uint64_t v32 = sub_2473BD6D0();
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  long long v59 = v79;
  sub_2473BD8A0();
  LODWORD(v51) = v62;
  unsigned __int8 v55 = &v73;
  id v54 = &v73;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249818);
  *(void *)&long long v61 = v52;
  *((void *)&v61 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_2473A041C(&qword_269249820, &qword_269249818);
  uint64_t v37 = v48;
  uint64_t v38 = v53;
  sub_2473BD770();
  swift_release();
  swift_release();
  sub_247390310(v32, v34, v36);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v38, v37);
}

uint64_t sub_247398158@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692498B0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497B8);
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  MEMORY[0x270FA5388](v6);
  id v56 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497A8);
  MEMORY[0x270FA5388](v55);
  uint64_t v60 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249798);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v59 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  long long v13 = (char *)&v50 - v12;
  long long v63 = a1[1];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2473BD370();
  swift_release();
  swift_release();
  sub_24739FA64((uint64_t)&v63);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692498B8);
  MEMORY[0x24C552EB0](&v62);
  swift_release();
  swift_release();
  if (v62 == 1)
  {
    uint64_t v52 = v5;
    uint64_t v53 = v13;
    uint64_t v51 = v9;
    uint64_t v54 = v3;
    sub_2473BDBE0();
    sub_247398894((uint64_t)a1);
    sub_247398894((uint64_t)a1);
    uint64_t v15 = sub_2473BDBD0();
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8F500];
    *(void *)(v16 + 16) = v15;
    *(void *)(v16 + 24) = v17;
    long long v18 = a1[9];
    *(_OWORD *)(v16 + 160) = a1[8];
    *(_OWORD *)(v16 + 176) = v18;
    long long v19 = a1[11];
    *(_OWORD *)(v16 + 192) = a1[10];
    *(_OWORD *)(v16 + 208) = v19;
    long long v20 = a1[5];
    *(_OWORD *)(v16 + 96) = a1[4];
    *(_OWORD *)(v16 + 112) = v20;
    long long v21 = a1[7];
    *(_OWORD *)(v16 + 128) = a1[6];
    *(_OWORD *)(v16 + 144) = v21;
    long long v22 = a1[1];
    *(_OWORD *)(v16 + 32) = *a1;
    *(_OWORD *)(v16 + 48) = v22;
    long long v23 = a1[3];
    *(_OWORD *)(v16 + 64) = a1[2];
    *(_OWORD *)(v16 + 80) = v23;
    sub_247398894((uint64_t)a1);
    uint64_t v24 = sub_2473BDBD0();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v24;
    *(void *)(v25 + 24) = v17;
    long long v26 = a1[9];
    *(_OWORD *)(v25 + 160) = a1[8];
    *(_OWORD *)(v25 + 176) = v26;
    long long v27 = a1[11];
    *(_OWORD *)(v25 + 192) = a1[10];
    *(_OWORD *)(v25 + 208) = v27;
    long long v28 = a1[5];
    *(_OWORD *)(v25 + 96) = a1[4];
    *(_OWORD *)(v25 + 112) = v28;
    long long v29 = a1[7];
    *(_OWORD *)(v25 + 128) = a1[6];
    *(_OWORD *)(v25 + 144) = v29;
    long long v30 = a1[1];
    *(_OWORD *)(v25 + 32) = *a1;
    *(_OWORD *)(v25 + 48) = v30;
    long long v31 = a1[3];
    *(_OWORD *)(v25 + 64) = a1[2];
    *(_OWORD *)(v25 + 80) = v31;
    sub_2473BD940();
    uint64_t v32 = sub_24739898C((uint64_t)a1);
    MEMORY[0x270FA5388](v32);
    *(&v50 - 2) = (uint64_t)a1;
    sub_24739D890();
    uint64_t v33 = v14;
    uint64_t v34 = v56;
    sub_2473BD8F0();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2473BD370();
    swift_release();
    swift_release();
    sub_24739FA64((uint64_t)&v63);
    MEMORY[0x24C552EB0](&v62, v33);
    swift_release();
    swift_release();
    char v35 = v62;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v37 = swift_allocObject();
    *(unsigned char *)(v37 + 16) = (v35 & 1) == 0;
    uint64_t v39 = v57;
    uint64_t v38 = v58;
    uint64_t v40 = (uint64_t)v60;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v60, v34, v58);
    uint64_t v41 = (uint64_t *)(v40 + *(int *)(v55 + 36));
    *uint64_t v41 = KeyPath;
    v41[1] = (uint64_t)sub_24739FBC8;
    v41[2] = v37;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v38);
    if (*(void *)a1)
    {
      BOOL v42 = sub_24738D490();
      uint64_t v43 = swift_getKeyPath();
      uint64_t v44 = swift_allocObject();
      *(unsigned char *)(v44 + 16) = !v42;
      uint64_t v45 = v59;
      sub_24739FBE0(v40, v59, &qword_2692497A8);
      unint64_t v46 = (uint64_t *)(v45 + *(int *)(v51 + 36));
      *unint64_t v46 = v43;
      v46[1] = (uint64_t)sub_2473A0574;
      v46[2] = v44;
      sub_24738EAF8(v40, &qword_2692497A8);
      uint64_t v47 = (uint64_t)v53;
      sub_247391120(v45, (uint64_t)v53, &qword_269249798);
      sub_24739FBE0(v47, (uint64_t)v52, &qword_269249798);
      swift_storeEnumTagMultiPayload();
      sub_24739D72C();
      sub_2473BD5D0();
      return sub_24738EAF8(v47, &qword_269249798);
    }
    else
    {
      sub_247398894((uint64_t)a1);
      type metadata accessor for AccountsUIModel(0);
      sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      uint64_t result = sub_2473BD490();
      __break(1u);
    }
  }
  else
  {
    type metadata accessor for AccountUISetting.CustomDataclass(0);
    sub_24739F8C4(&qword_2692498C0, (void (*)(uint64_t))type metadata accessor for AccountUISetting.CustomDataclass);
    swift_retain();
    *uint64_t v5 = sub_2473BD440();
    v5[1] = v49;
    swift_storeEnumTagMultiPayload();
    sub_24739D72C();
    sub_24739D890();
    return sub_2473BD5D0();
  }
  return result;
}

uint64_t sub_247398894(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 32);
  swift_retain();
  id v4 = v2;
  swift_retain();
  id v5 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24739898C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_247398A80@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountUISetting.CustomDataclass(0);
  sub_24739F8C4(&qword_2692498C0, (void (*)(uint64_t))type metadata accessor for AccountUISetting.CustomDataclass);
  swift_retain();
  uint64_t result = sub_2473BD440();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247398B08(_OWORD *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249758);
  sub_2473BD880();
  swift_getKeyPath();
  uint64_t v2 = (_OWORD *)swift_allocObject();
  long long v3 = a1[9];
  v2[9] = a1[8];
  v2[10] = v3;
  long long v4 = a1[11];
  v2[11] = a1[10];
  v2[12] = v4;
  long long v5 = a1[5];
  v2[5] = a1[4];
  v2[6] = v5;
  long long v6 = a1[7];
  v2[7] = a1[6];
  v2[8] = v6;
  long long v7 = a1[1];
  v2[1] = *a1;
  v2[2] = v7;
  long long v8 = a1[3];
  v2[3] = a1[2];
  v2[4] = v8;
  sub_247398894((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249598);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692497E8);
  sub_2473A041C(&qword_269249880, &qword_269249598);
  sub_24739F8C4(&qword_269249888, type metadata accessor for ACDataclassActionType);
  sub_24739D950();
  return sub_2473BD960();
}

uint64_t sub_247398C90@<X0>(void **a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249890);
  MEMORY[0x270FA5388](v54);
  long long v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249808);
  MEMORY[0x270FA5388](v55);
  long long v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249898);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249850);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  long long v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = *a1;
  if (objc_msgSend(v19, sel_isDestructive))
  {
    uint64_t v57 = sub_247392B10();
    uint64_t v58 = v20;
    sub_2473BD3A0();
    uint64_t v21 = sub_2473BD3C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 0, 1, v21);
    uint64_t v22 = swift_allocObject();
    long long v23 = a2[9];
    *(_OWORD *)(v22 + 144) = a2[8];
    *(_OWORD *)(v22 + 160) = v23;
    long long v24 = a2[11];
    *(_OWORD *)(v22 + 176) = a2[10];
    *(_OWORD *)(v22 + 192) = v24;
    long long v25 = a2[5];
    *(_OWORD *)(v22 + 80) = a2[4];
    *(_OWORD *)(v22 + 96) = v25;
    long long v26 = a2[7];
    *(_OWORD *)(v22 + 112) = a2[6];
    *(_OWORD *)(v22 + 128) = v26;
    long long v27 = a2[1];
    *(_OWORD *)(v22 + 16) = *a2;
    *(_OWORD *)(v22 + 32) = v27;
    long long v28 = a2[3];
    *(_OWORD *)(v22 + 48) = a2[2];
    *(_OWORD *)(v22 + 64) = v28;
    *(void *)(v22 + 208) = v19;
    sub_247398894((uint64_t)a2);
    sub_247396A54();
    id v29 = v19;
    sub_2473BD8D0();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    sub_24739D9F0();
    sub_2473BD5D0();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    uint64_t v52 = v18;
    uint64_t v53 = v9;
    id v31 = objc_msgSend(v19, sel_type);
    uint64_t v57 = sub_247392B10();
    uint64_t v58 = v32;
    if (v31)
    {
      uint64_t v33 = swift_allocObject();
      long long v34 = a2[9];
      *(_OWORD *)(v33 + 144) = a2[8];
      *(_OWORD *)(v33 + 160) = v34;
      long long v35 = a2[11];
      *(_OWORD *)(v33 + 176) = a2[10];
      *(_OWORD *)(v33 + 192) = v35;
      long long v36 = a2[5];
      *(_OWORD *)(v33 + 80) = a2[4];
      *(_OWORD *)(v33 + 96) = v36;
      long long v37 = a2[7];
      *(_OWORD *)(v33 + 112) = a2[6];
      *(_OWORD *)(v33 + 128) = v37;
      long long v38 = a2[1];
      *(_OWORD *)(v33 + 16) = *a2;
      *(_OWORD *)(v33 + 32) = v38;
      long long v39 = a2[3];
      *(_OWORD *)(v33 + 48) = a2[2];
      *(_OWORD *)(v33 + 64) = v39;
      *(void *)(v33 + 208) = v19;
      sub_247398894((uint64_t)a2);
      sub_247396A54();
      id v40 = v19;
      uint64_t v41 = v52;
      sub_2473BD8E0();
    }
    else
    {
      sub_2473BD3B0();
      uint64_t v42 = sub_2473BD3C0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v14, 0, 1, v42);
      uint64_t v43 = swift_allocObject();
      long long v44 = a2[9];
      *(_OWORD *)(v43 + 144) = a2[8];
      *(_OWORD *)(v43 + 160) = v44;
      long long v45 = a2[11];
      *(_OWORD *)(v43 + 176) = a2[10];
      *(_OWORD *)(v43 + 192) = v45;
      long long v46 = a2[5];
      *(_OWORD *)(v43 + 80) = a2[4];
      *(_OWORD *)(v43 + 96) = v46;
      long long v47 = a2[7];
      *(_OWORD *)(v43 + 112) = a2[6];
      *(_OWORD *)(v43 + 128) = v47;
      long long v48 = a2[1];
      *(_OWORD *)(v43 + 16) = *a2;
      *(_OWORD *)(v43 + 32) = v48;
      long long v49 = a2[3];
      *(_OWORD *)(v43 + 48) = a2[2];
      *(_OWORD *)(v43 + 64) = v49;
      *(void *)(v43 + 208) = v19;
      sub_247398894((uint64_t)a2);
      sub_247396A54();
      id v50 = v19;
      uint64_t v41 = v52;
      sub_2473BD8D0();
    }
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v6, v41, v15);
    swift_storeEnumTagMultiPayload();
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    sub_2473BD5D0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v41, v15);
    sub_24739FBE0((uint64_t)v8, (uint64_t)v11, &qword_269249808);
    swift_storeEnumTagMultiPayload();
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    sub_24739D9F0();
    sub_2473BD5D0();
    return sub_24738EAF8((uint64_t)v8, &qword_269249808);
  }
}

void sub_2473992F8(void *a1)
{
  uint64_t v3 = sub_2473BD310();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7 = v1[9];
  long long v54 = v1[8];
  long long v55 = v7;
  long long v8 = v1[11];
  long long v56 = v1[10];
  long long v57 = v8;
  long long v9 = v1[5];
  long long v50 = v1[4];
  long long v51 = v9;
  long long v10 = v1[7];
  long long v52 = v1[6];
  long long v53 = v10;
  long long v11 = v1[1];
  long long v46 = *v1;
  long long v47 = v11;
  long long v12 = v1[3];
  long long v48 = v1[2];
  long long v49 = v12;
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  uint64_t v14 = a1;
  uint64_t v15 = sub_2473BD2F0();
  os_log_type_t v16 = sub_2473BDC50();
  uint64_t v17 = &off_265211000;
  if (os_log_type_enabled(v15, v16))
  {
    long long v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)long long v18 = 134217984;
    *(void *)&long long v39 = [v14 type];
    sub_2473BDCC0();

    _os_log_impl(&dword_247380000, v15, v16, "taking action: %ld", v18, 0xCu);
    long long v19 = v18;
    uint64_t v17 = &off_265211000;
    MEMORY[0x24C553A30](v19, -1, -1);
  }
  else
  {

    uint64_t v15 = v14;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if ([v14 (SEL)v17[310]])
  {
    long long v39 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
    sub_2473BD880();
    uint64_t v20 = v45;
    if (v45)
    {
      if ((void)v46)
      {
        id v21 = (id)v46;
        id v22 = sub_2473864D0();

        __swift_instantiateConcreteTypeFromMangledName(&qword_2692498A0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2473BE640;
        uint64_t v24 = *((void *)&v47 + 1);
        swift_beginAccess();
        long long v25 = *(void **)(v24 + 32);
        *(void *)(inited + 32) = v25;
        *(void *)(inited + 40) = v14;
        long long v26 = v14;
        id v27 = v20;
        id v28 = v25;
        sub_2473A0C84(inited);
        type metadata accessor for Dataclass(0);
        sub_2473911B4(0, &qword_2692496B0);
        sub_24739F8C4((unint64_t *)&qword_2692495A0, type metadata accessor for Dataclass);
        id v29 = (void *)sub_2473BDA70();
        swift_bridgeObjectRelease();
        long long v39 = v49;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
        sub_2473BD880();
        uint64_t v30 = v44;
        id v31 = (_OWORD *)swift_allocObject();
        long long v32 = v55;
        v31[9] = v54;
        v31[10] = v32;
        long long v33 = v57;
        v31[11] = v56;
        v31[12] = v33;
        long long v34 = v51;
        v31[5] = v50;
        v31[6] = v34;
        long long v35 = v53;
        v31[7] = v52;
        v31[8] = v35;
        long long v36 = v47;
        v31[1] = v46;
        v31[2] = v36;
        long long v37 = v49;
        uint64_t v31[3] = v48;
        v31[4] = v37;
        uint64_t v42 = sub_24739F9FC;
        uint64_t v43 = v31;
        *(void *)&long long v39 = MEMORY[0x263EF8330];
        *((void *)&v39 + 1) = 1107296256;
        id v40 = sub_2473A8B4C;
        uint64_t v41 = &block_descriptor_0;
        long long v38 = _Block_copy(&v39);
        sub_247398894((uint64_t)&v46);
        swift_release();
        objc_msgSend(v22, sel_saveAccount_withDataclassActions_doVerify_completion_, v27, v29, v30, v38);
        _Block_release(v38);
      }
      else
      {
        sub_247398894((uint64_t)&v46);
        type metadata accessor for AccountsUIModel(0);
        sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
        sub_2473BD490();
        __break(1u);
      }
    }
    else
    {
      long long v39 = v53;
      LOBYTE(v45) = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
      sub_2473BD890();
    }
  }
  else
  {
    long long v39 = v48;
    long long v45 = 0;
    sub_247398894((uint64_t)&v46);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
    sub_2473BD890();
    long long v39 = v53;
    LOBYTE(v45) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
    sub_2473BD890();
    sub_24739898C((uint64_t)&v46);
  }
}

uint64_t sub_24739988C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_247398894(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249758);
  sub_2473BD880();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
  sub_2473BD880();
  sub_24739898C(a1);
  sub_24739E570((unint64_t)v8);
  swift_bridgeObjectRelease();

  sub_247396A54();
  uint64_t result = sub_2473BD6D0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_247399998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249860);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v30 = *(_OWORD *)(a1 + 128);
  uint64_t v31 = *(void *)(a1 + 144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
  sub_2473BD880();
  long long v30 = v32;
  sub_247396A54();
  uint64_t v6 = sub_2473BD6D0();
  uint64_t v27 = v7;
  uint64_t v28 = v6;
  int v25 = v8;
  uint64_t v26 = v9;
  long long v30 = *(_OWORD *)(a1 + 152);
  uint64_t v31 = *(void *)(a1 + 168);
  sub_2473BD880();
  long long v30 = v32;
  uint64_t v24 = sub_2473BD6D0();
  sub_2473BD580();
  uint64_t v10 = sub_2473BD6C0();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  uint64_t v15 = (_OWORD *)swift_allocObject();
  long long v16 = *(_OWORD *)(a1 + 144);
  v15[9] = *(_OWORD *)(a1 + 128);
  v15[10] = v16;
  long long v17 = *(_OWORD *)(a1 + 176);
  v15[11] = *(_OWORD *)(a1 + 160);
  v15[12] = v17;
  long long v18 = *(_OWORD *)(a1 + 80);
  v15[5] = *(_OWORD *)(a1 + 64);
  v15[6] = v18;
  long long v19 = *(_OWORD *)(a1 + 112);
  v15[7] = *(_OWORD *)(a1 + 96);
  v15[8] = v19;
  long long v20 = *(_OWORD *)(a1 + 16);
  v15[1] = *(_OWORD *)a1;
  v15[2] = v20;
  long long v21 = *(_OWORD *)(a1 + 48);
  v15[3] = *(_OWORD *)(a1 + 32);
  v15[4] = v21;
  sub_247398894(a1);
  sub_2473BD7F0();
  swift_release();
  sub_247390310(v10, v12, v14);
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_2473BD800();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 0, 1, v22);
  return sub_2473BD7E0();
}

void sub_247399C24(_OWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249850);
  MEMORY[0x270FA5388](v3 - 8);
  long long v56 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v59 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v58 = (char *)&v55 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v55 = (char *)&v55 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  long long v57 = (char *)&v55 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v17 = (char *)&v55 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v62 = (char *)&v55 - v18;
  unint64_t v61 = 0x80000002473C3690;
  long long v19 = (void *)sub_2473BDA90();
  long long v20 = self;
  id v21 = objc_msgSend(v20, sel_bundleWithIdentifier_, v19);

  if (v21)
  {
    uint64_t v22 = (void *)sub_2473BDA90();
    long long v23 = (void *)sub_2473BDA90();
    id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

    sub_2473BDAD0();
    uint64_t v25 = sub_2473BDAA0();
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    uint64_t v63 = v25;
    uint64_t v64 = v27;
    uint64_t v28 = (_OWORD *)swift_allocObject();
    long long v29 = a1[9];
    v28[9] = a1[8];
    v28[10] = v29;
    long long v30 = a1[11];
    v28[11] = a1[10];
    v28[12] = v30;
    long long v31 = a1[5];
    v28[5] = a1[4];
    v28[6] = v31;
    long long v32 = a1[7];
    v28[7] = a1[6];
    v28[8] = v32;
    long long v33 = a1[1];
    v28[1] = *a1;
    v28[2] = v33;
    long long v34 = a1[3];
    v28[3] = a1[2];
    v28[4] = v34;
    sub_247398894((uint64_t)a1);
    sub_247396A54();
    sub_2473BD8E0();
    long long v35 = (void (*)(char *, char *, uint64_t))v6[4];
    v35(v62, v17, v5);
    long long v36 = (void *)sub_2473BDA90();
    id v37 = objc_msgSend(v20, sel_bundleWithIdentifier_, v36);

    if (v37)
    {
      long long v38 = (void *)sub_2473BDA90();
      long long v39 = (void *)sub_2473BDA90();
      id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, v39, 0);

      sub_2473BDAD0();
      uint64_t v41 = sub_2473BDAA0();
      uint64_t v43 = v42;
      swift_bridgeObjectRelease();
      uint64_t v63 = v41;
      uint64_t v64 = v43;
      unsigned __int8 v44 = v56;
      sub_2473BD3B0();
      uint64_t v45 = sub_2473BD3C0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
      long long v46 = v55;
      sub_2473BD8D0();
      long long v47 = v57;
      v35(v57, v46, v5);
      long long v48 = (void (*)(char *, char *, uint64_t))v6[2];
      long long v49 = v58;
      long long v50 = v62;
      v48(v58, v62, v5);
      long long v51 = v59;
      v48(v59, v47, v5);
      long long v52 = v60;
      v48(v60, v49, v5);
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249858);
      v48(&v52[*(int *)(v53 + 48)], v51, v5);
      long long v54 = (void (*)(char *, uint64_t))v6[1];
      v54(v47, v5);
      v54(v50, v5);
      v54(v51, v5);
      v54(v49, v5);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_24739A1EC(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    sub_2473BD370();

    swift_release();
    swift_release();
    if (v3)
    {
      if (qword_26B12B470 != -1) {
        swift_once();
      }
    }
  }
  else
  {
    sub_247398894((uint64_t)a1);
    type metadata accessor for AccountsUIModel(0);
    sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    sub_2473BD490();
    __break(1u);
  }
}

uint64_t sub_24739A308@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
  sub_2473BD880();
  sub_247396A54();
  uint64_t result = sub_2473BD6D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

void sub_24739A388(char a1, uint64_t a2)
{
  long long v5 = v2[9];
  long long v95 = v2[8];
  v96[0] = v5;
  long long v6 = v2[11];
  v96[1] = v2[10];
  long long v97 = v6;
  long long v7 = v2[5];
  long long v91 = v2[4];
  long long v92 = v7;
  long long v8 = v2[7];
  long long v93 = v2[6];
  long long v94 = v8;
  long long v9 = v2[1];
  long long v87 = *v2;
  long long v88 = v9;
  long long v10 = v2[3];
  long long v89 = v2[2];
  long long v90 = v10;
  if ((a1 & 1) == 0) {
    goto LABEL_25;
  }
  if (!(void)v87)
  {
LABEL_39:
    sub_247398894((uint64_t)&v87);
    type metadata accessor for AccountsUIModel(0);
    sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    sub_2473BD490();
    __break(1u);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v11 = (id)v87;
  sub_2473BD370();

  swift_release();
  swift_release();
  id v12 = aBlock[0];
  if (!aBlock[0]) {
    goto LABEL_8;
  }
  id v13 = objc_msgSend(aBlock[0], sel_accountType);

  if (!v13)
  {
    __break(1u);
    goto LABEL_37;
  }
  id v14 = objc_msgSend(v13, sel_identifier);

  if (!v14)
  {
    id v12 = 0;
LABEL_8:
    unint64_t v16 = 0xE000000000000000;
    goto LABEL_9;
  }
  id v12 = (id)sub_2473BDAD0();
  unint64_t v16 = v15;

LABEL_9:
  if (v12 == (id)sub_2473BDAD0() && v16 == v17)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v18 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_25;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v19 = v11;
  sub_2473BD370();

  swift_release();
  swift_release();
  if (!v72[0])
  {
    *(_OWORD *)id aBlock = 0u;
    long long v76 = 0u;
LABEL_24:
    sub_24738EAF8((uint64_t)aBlock, &qword_26B12B5F0);
    goto LABEL_25;
  }
  id v20 = objc_msgSend(v72[0], sel_accountPropertyForKey_, *MEMORY[0x263EFAD88]);

  if (v20)
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)long long v72 = 0u;
    long long v73 = 0u;
  }
  sub_247391120((uint64_t)v72, (uint64_t)aBlock, &qword_26B12B5F0);
  if (!*((void *)&v76 + 1)) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692498C8);
  if (swift_dynamicCast())
  {
    id v21 = v72[0];
    uint64_t v22 = *((void *)&v88 + 1);
    swift_beginAccess();
    id v23 = *(id *)(v22 + 32);
    char v24 = sub_247385628((uint64_t)v23, (uint64_t)v21);
    swift_bridgeObjectRelease();

    if ((v24 & 1) == 0)
    {
      sub_247398894((uint64_t)&v87);
      uint64_t v25 = (void *)sub_2473BDA90();
      uint64_t v26 = self;
      id v27 = objc_msgSend(v26, sel_bundleWithIdentifier_, v25);

      if (v27)
      {
        uint64_t v28 = (void *)sub_2473BDA90();
        long long v29 = (void *)sub_2473BDA90();
        id v30 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, v29, 0);

        sub_2473BDAD0();
        long long v31 = (void *)sub_2473BDAA0();
        long long v33 = v32;
        swift_bridgeObjectRelease();
        *(_OWORD *)id aBlock = v95;
        *(void *)&long long v76 = *(void *)&v96[0];
        v72[0] = v31;
        v72[1] = v33;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
        sub_2473BD890();
        long long v34 = (void *)sub_2473BDA90();
        id v35 = objc_msgSend(v26, sel_bundleWithIdentifier_, v34);

        if (v35)
        {
          long long v36 = (void *)sub_2473BDA90();
          id v37 = (void *)sub_2473BDA90();
          id v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, v37, 0);

          sub_2473BDAD0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
          uint64_t v39 = swift_allocObject();
          *(_OWORD *)(v39 + 16) = xmmword_2473BE640;
          swift_beginAccess();
          uint64_t v41 = *(void *)(v22 + 40);
          uint64_t v40 = *(void *)(v22 + 48);
          *(void *)(v39 + 56) = MEMORY[0x263F8D310];
          *(void *)(v39 + 64) = sub_24739F7B8();
          *(void *)(v39 + 32) = v41;
          *(void *)(v39 + 40) = v40;
          swift_bridgeObjectRetain();
          uint64_t v42 = sub_2473BDAA0();
          uint64_t v44 = v43;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(_OWORD *)long long v72 = *(_OWORD *)((char *)v96 + 8);
          *(void *)&long long v73 = *((void *)&v96[1] + 1);
          *(void *)&long long v74 = v42;
          *((void *)&v74 + 1) = v44;
          sub_2473BD890();
          *(_OWORD *)long long v72 = v93;
          sub_247391120((uint64_t)&v72[1], (uint64_t)v98, &qword_2692498D0);
          long long v74 = *(_OWORD *)v72;
          sub_24739FD5C((uint64_t)v98);
          __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
          sub_2473BD880();
          long long v74 = *(_OWORD *)v72;
          sub_2473BD890();
          sub_24739FA64((uint64_t)v72);
          sub_24739898C((uint64_t)&v87);
          return;
        }
        goto LABEL_38;
      }
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
  }
LABEL_25:
  uint64_t v45 = (void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))(*((void *)&v88 + 1)
                                                                                      + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  long long v46 = *v45;
  if (*v45)
  {
    uint64_t v47 = swift_allocObject();
    long long v48 = v96[0];
    *(_OWORD *)(v47 + 144) = v95;
    *(_OWORD *)(v47 + 160) = v48;
    long long v49 = v97;
    *(_OWORD *)(v47 + 176) = v96[1];
    *(_OWORD *)(v47 + 192) = v49;
    long long v50 = v92;
    *(_OWORD *)(v47 + 80) = v91;
    *(_OWORD *)(v47 + 96) = v50;
    long long v51 = v94;
    *(_OWORD *)(v47 + 112) = v93;
    *(_OWORD *)(v47 + 128) = v51;
    long long v52 = v88;
    *(_OWORD *)(v47 + 16) = v87;
    *(_OWORD *)(v47 + 32) = v52;
    long long v53 = v90;
    *(_OWORD *)(v47 + 48) = v89;
    *(_OWORD *)(v47 + 64) = v53;
    uint64_t v54 = a1 & 1;
    *(unsigned char *)(v47 + 208) = v54;
    sub_247398894((uint64_t)&v87);
    sub_24739FD3C((uint64_t)v46);
    v46(a2, v54, sub_24739FCF8, v47);
    swift_release();
    sub_24739FD4C((uint64_t)v46);
    return;
  }
  long long v55 = (void *)v87;
  if (!(void)v87) {
    goto LABEL_39;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v56 = v55;
  sub_2473BD370();

  swift_release();
  swift_release();
  id v57 = aBlock[0];
  if (!aBlock[0])
  {
LABEL_35:
    long long v84 = v96[0];
    long long v85 = v96[1];
    long long v86 = v97;
    long long v80 = v92;
    long long v81 = v93;
    long long v82 = v94;
    long long v83 = v95;
    *(_OWORD *)id aBlock = v87;
    long long v76 = v88;
    long long v77 = v89;
    long long v78 = v90;
    long long v79 = v91;
    sub_24739AD90(a1 & 1);
    return;
  }
  if (ACAccount.appearsActive()() || (a1 & 1) == 0)
  {

    goto LABEL_35;
  }
  if (qword_26B12B470 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v58 = (void *)qword_26B12B538;
  uint64_t v59 = swift_allocObject();
  long long v60 = v96[0];
  *(_OWORD *)(v59 + 144) = v95;
  *(_OWORD *)(v59 + 160) = v60;
  long long v61 = v97;
  *(_OWORD *)(v59 + 176) = v96[1];
  *(_OWORD *)(v59 + 192) = v61;
  long long v62 = v92;
  *(_OWORD *)(v59 + 80) = v91;
  *(_OWORD *)(v59 + 96) = v62;
  long long v63 = v94;
  *(_OWORD *)(v59 + 112) = v93;
  *(_OWORD *)(v59 + 128) = v63;
  long long v64 = v88;
  *(_OWORD *)(v59 + 16) = v87;
  *(_OWORD *)(v59 + 32) = v64;
  long long v65 = v90;
  *(_OWORD *)(v59 + 48) = v89;
  *(_OWORD *)(v59 + 64) = v65;
  *(unsigned char *)(v59 + 208) = 1;
  sub_247398894((uint64_t)&v87);
  id v66 = v58;
  id v67 = sub_2473864D0();
  long long v68 = (void *)swift_allocObject();
  v68[2] = v57;
  v68[3] = v66;
  v68[4] = sub_24739B304;
  v68[5] = 0;
  v68[6] = sub_24739FC4C;
  v68[7] = v59;
  *(void *)&long long v77 = sub_24739FCE0;
  *((void *)&v77 + 1) = v68;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  *(void *)&long long v76 = sub_247396CE0;
  *((void *)&v76 + 1) = &block_descriptor_77;
  long long v69 = _Block_copy(aBlock);
  id v70 = v66;
  id v71 = v57;
  swift_retain();
  swift_release();
  objc_msgSend(v67, sel_verifyCredentialsForAccount_saveWhenAuthorized_withHandler_, v71, 0, v69);
  _Block_release(v69);

  swift_release();
}

uint64_t sub_24739AD90(int a1)
{
  int v36 = a1;
  uint64_t v2 = sub_2473BDA00();
  uint64_t v39 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2473BDA30();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v5);
  long long v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2473BDA10();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = v1[9];
  long long v54 = v1[8];
  long long v55 = v12;
  long long v13 = v1[11];
  long long v56 = v1[10];
  long long v57 = v13;
  long long v14 = v1[5];
  long long v50 = v1[4];
  long long v51 = v14;
  long long v15 = v1[7];
  long long v52 = v1[6];
  long long v53 = v15;
  long long v16 = v1[1];
  long long v46 = *v1;
  long long v47 = v16;
  long long v17 = v1[3];
  long long v48 = v1[2];
  long long v49 = v17;
  char v18 = (void *)v46;
  if ((void)v46)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v19 = v18;
    sub_2473BD370();

    swift_release();
    uint64_t result = swift_release();
    id v21 = v45;
    if (v45)
    {
      objc_msgSend(v45, sel_copy);

      sub_2473BDD10();
      swift_unknownObjectRelease();
      sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        id v22 = v45;
        long long v40 = v49;
        char v23 = v36;
        LOBYTE(v45) = (v36 & 1) == 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
        sub_2473BD890();
        sub_2473911B4(0, &qword_26B12B5C8);
        (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F060], v8);
        uint64_t v35 = sub_2473BDC80();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = v22;
        *(unsigned char *)(v24 + 24) = v23 & 1;
        long long v25 = v55;
        *(_OWORD *)(v24 + 160) = v54;
        *(_OWORD *)(v24 + 176) = v25;
        long long v26 = v57;
        *(_OWORD *)(v24 + 192) = v56;
        *(_OWORD *)(v24 + 208) = v26;
        long long v27 = v51;
        *(_OWORD *)(v24 + 96) = v50;
        *(_OWORD *)(v24 + 112) = v27;
        long long v28 = v53;
        *(_OWORD *)(v24 + 128) = v52;
        *(_OWORD *)(v24 + 144) = v28;
        long long v29 = v47;
        *(_OWORD *)(v24 + 32) = v46;
        *(_OWORD *)(v24 + 48) = v29;
        long long v30 = v49;
        *(_OWORD *)(v24 + 64) = v48;
        *(_OWORD *)(v24 + 80) = v30;
        uint64_t v43 = sub_24739FE48;
        uint64_t v44 = v24;
        *(void *)&long long v40 = MEMORY[0x263EF8330];
        *((void *)&v40 + 1) = 1107296256;
        uint64_t v41 = sub_24739C898;
        uint64_t v42 = &block_descriptor_98;
        long long v31 = _Block_copy(&v40);
        sub_247398894((uint64_t)&v46);
        id v32 = v22;
        sub_2473BDA20();
        id v45 = (id)MEMORY[0x263F8EE78];
        sub_24739F8C4(&qword_26B12B5A0, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
        sub_2473A041C((unint64_t *)&qword_26B12B5B0, &qword_26B12B5A8);
        sub_2473BDD20();
        long long v33 = (void *)v35;
        MEMORY[0x24C553200](0, v7, v4, v31);
        _Block_release(v31);

        (*(void (**)(char *, uint64_t))(v39 + 8))(v4, v2);
        (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v38);
        return swift_release();
      }
    }
  }
  else
  {
    sub_247398894((uint64_t)&v46);
    type metadata accessor for AccountsUIModel(0);
    sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

void sub_24739B304(uint64_t a1, void (*a2)(uint64_t))
{
  if (qword_26B12B470 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v3 = (id)qword_26B12B538;
  a2(1);
}

uint64_t sub_24739B3A0(char a1, long long *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_2473BDA00();
  uint64_t v36 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  long long v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2473BDA30();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    long long v19 = a2[9];
    long long v45 = a2[8];
    long long v46 = v19;
    long long v20 = a2[11];
    long long v47 = a2[10];
    long long v48 = v20;
    long long v21 = a2[5];
    long long v41 = a2[4];
    long long v42 = v21;
    long long v22 = a2[7];
    long long v43 = a2[6];
    long long v44 = v22;
    long long v23 = a2[1];
    long long aBlock = *a2;
    long long v38 = v23;
    long long v24 = a2[3];
    long long v39 = a2[2];
    long long v40 = v24;
    return sub_24739AD90(a3 & 1);
  }
  else
  {
    uint64_t v35 = v16;
    sub_2473911B4(0, &qword_26B12B5C8);
    long long v26 = (void *)sub_2473BDC60();
    long long v27 = (_OWORD *)swift_allocObject();
    long long v28 = a2[9];
    v27[9] = a2[8];
    v27[10] = v28;
    long long v29 = a2[11];
    v27[11] = a2[10];
    v27[12] = v29;
    long long v30 = a2[5];
    v27[5] = a2[4];
    v27[6] = v30;
    long long v31 = a2[7];
    v27[7] = a2[6];
    v27[8] = v31;
    long long v32 = a2[1];
    v27[1] = *a2;
    v27[2] = v32;
    long long v33 = a2[3];
    void v27[3] = a2[2];
    v27[4] = v33;
    *(void *)&long long v39 = a5;
    *((void *)&v39 + 1) = v27;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v38 = sub_24739C898;
    *((void *)&v38 + 1) = a6;
    uint64_t v34 = _Block_copy(&aBlock);
    sub_247398894((uint64_t)a2);
    swift_release();
    sub_2473BDA20();
    *(void *)&long long aBlock = MEMORY[0x263F8EE78];
    sub_24739F8C4(&qword_26B12B5A0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
    sub_2473A041C((unint64_t *)&qword_26B12B5B0, &qword_26B12B5A8);
    sub_2473BDD20();
    MEMORY[0x24C553200](0, v18, v13, v34);
    _Block_release(v34);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v35);
  }
}

void sub_24739B724(void *a1, char a2, uint64_t a3)
{
  uint64_t v6 = sub_2473BD310();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v81 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v10 = (id *)(v9 + 32);
  swift_beginAccess();
  objc_msgSend(a1, sel_setEnabled_forDataclass_, a2 & 1, *(void *)(v9 + 32));
  if (!*(void *)a3)
  {
LABEL_50:
    sub_247398894(a3);
    type metadata accessor for AccountsUIModel(0);
    sub_24739F8C4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    sub_2473BD490();
    __break(1u);
    return;
  }
  id v11 = *(id *)a3;
  id v12 = sub_2473864D0();

  id v13 = objc_msgSend(v12, sel_dataclassActionsForAccountSave_, a1);
  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v80 = v7;
  type metadata accessor for Dataclass(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249598);
  sub_24739F8C4((unint64_t *)&qword_2692495A0, type metadata accessor for Dataclass);
  uint64_t v14 = sub_2473BDA80();

  if (!*(void *)(v14 + 16)) {
    goto LABEL_11;
  }
  uint64_t v79 = v6;
  id v15 = *v10;
  unint64_t v16 = sub_24738AA3C((uint64_t)v15);
  if ((v17 & 1) == 0)
  {

    goto LABEL_11;
  }
  unint64_t v18 = *(void *)(*(void *)(v14 + 56) + 8 * v16);
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  if (!(v18 >> 62))
  {
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v19 > 0) {
      goto LABEL_7;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_2473BDE30();
  swift_bridgeObjectRelease();
  if (v19 <= 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    id v21 = v11;
    long long v22 = sub_2473864D0();

    long long aBlock = *(_OWORD *)(a3 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
    sub_2473BD880();
    uint64_t v23 = v84;
    long long v24 = (_OWORD *)swift_allocObject();
    long long v25 = *(_OWORD *)(a3 + 144);
    v24[9] = *(_OWORD *)(a3 + 128);
    v24[10] = v25;
    long long v26 = *(_OWORD *)(a3 + 176);
    v24[11] = *(_OWORD *)(a3 + 160);
    v24[12] = v26;
    long long v27 = *(_OWORD *)(a3 + 80);
    v24[5] = *(_OWORD *)(a3 + 64);
    v24[6] = v27;
    long long v28 = *(_OWORD *)(a3 + 112);
    v24[7] = *(_OWORD *)(a3 + 96);
    v24[8] = v28;
    long long v29 = *(_OWORD *)(a3 + 16);
    v24[1] = *(_OWORD *)a3;
    v24[2] = v29;
    long long v30 = *(_OWORD *)(a3 + 48);
    v24[3] = *(_OWORD *)(a3 + 32);
    v24[4] = v30;
    long long v90 = sub_24739FE60;
    long long v91 = v24;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    long long v88 = sub_2473A8B4C;
    long long v89 = &block_descriptor_104;
    long long v31 = _Block_copy(&aBlock);
    sub_247398894(a3);
    swift_release();
    objc_msgSend(v22, sel_saveAccount_withDataclassActions_doVerify_completion_, a1, 0, v23, v31);
    _Block_release(v31);
LABEL_13:

    return;
  }
LABEL_7:
  if (v19 != 1)
  {
    long long aBlock = *(_OWORD *)(a3 + 176);
    *(void *)&long long v84 = v18;
    sub_247398894(a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249758);
    sub_2473BD890();
    long long aBlock = *(_OWORD *)(a3 + 32);
    *(void *)&long long v84 = a1;
    id v32 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
    sub_2473BD890();
    long long aBlock = *(_OWORD *)(a3 + 64);
    sub_247391120((uint64_t)&aBlock + 8, (uint64_t)&v83, &qword_2692498D0);
    long long v84 = aBlock;
    sub_24739FD5C((uint64_t)&v83);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
    sub_2473BD880();
    long long v84 = aBlock;
    BOOL v86 = (v92[0] & 1) == 0;
    sub_2473BD890();
    sub_24739FA64((uint64_t)&aBlock);
LABEL_15:
    sub_24739898C(a3);
    return;
  }
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    long long v20 = (char *)sub_2473BDE30();
  }
  else
  {
    long long v20 = *(char **)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  long long v78 = v20;
  if (!v20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  long long v33 = v20 - 1;
  if (__OFSUB__(v20, 1)) {
    goto LABEL_44;
  }
  if ((v18 & 0xC000000000000001) != 0) {
    goto LABEL_45;
  }
  if (((unint64_t)v33 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_47;
  }
  if ((unint64_t)v33 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_47:
    __break(1u);
LABEL_48:
    swift_once();
    goto LABEL_32;
  }
  for (unint64_t i = (char *)*(id *)(v18 + 8 * (void)v33 + 32); ; unint64_t i = (char *)MEMORY[0x24C553330]())
  {
    long long v20 = i;
    swift_bridgeObjectRelease();
    if (!objc_msgSend(v20, sel_type)) {
      break;
    }

LABEL_26:
    id v35 = v11;
    id v36 = sub_2473864D0();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2692498A0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2473BE640;
    id v38 = *v10;
    *(void *)(inited + 32) = *v10;
    if (!v78)
    {
      id v76 = v38;
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_50;
    }
    uint64_t v39 = inited;
    if ((v18 & 0xC000000000000001) != 0)
    {
      id v75 = v38;
      id v42 = (id)MEMORY[0x24C553330](0, v18);
      goto LABEL_30;
    }
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      long long v40 = *(void **)(v18 + 32);
      id v41 = v38;
      id v42 = v40;
LABEL_30:
      id v43 = v42;
      swift_bridgeObjectRelease();
      *(void *)(v39 + 40) = v43;
      sub_2473A0C84(v39);
      sub_2473911B4(0, &qword_2692496B0);
      long long v22 = (void *)sub_2473BDA70();
      swift_bridgeObjectRelease();
      long long aBlock = *(_OWORD *)(a3 + 48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
      sub_2473BD880();
      uint64_t v44 = v84;
      long long v45 = (_OWORD *)swift_allocObject();
      long long v46 = *(_OWORD *)(a3 + 144);
      v45[9] = *(_OWORD *)(a3 + 128);
      v45[10] = v46;
      long long v47 = *(_OWORD *)(a3 + 176);
      v45[11] = *(_OWORD *)(a3 + 160);
      v45[12] = v47;
      long long v48 = *(_OWORD *)(a3 + 80);
      v45[5] = *(_OWORD *)(a3 + 64);
      v45[6] = v48;
      long long v49 = *(_OWORD *)(a3 + 112);
      v45[7] = *(_OWORD *)(a3 + 96);
      v45[8] = v49;
      long long v50 = *(_OWORD *)(a3 + 16);
      v45[1] = *(_OWORD *)a3;
      v45[2] = v50;
      long long v51 = *(_OWORD *)(a3 + 48);
      v45[3] = *(_OWORD *)(a3 + 32);
      v45[4] = v51;
      long long v90 = sub_24739FEA8;
      long long v91 = v45;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      long long v88 = sub_2473A8B4C;
      long long v89 = &block_descriptor_110;
      long long v52 = _Block_copy(&aBlock);
      sub_247398894(a3);
      swift_release();
      objc_msgSend(v36, sel_saveAccount_withDataclassActions_doVerify_completion_, a1, v22, v44, v52);
      _Block_release(v52);

      goto LABEL_13;
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    ;
  }
  uint64_t v10 = (id *)&off_265211000;
  swift_bridgeObjectRelease();
  if (qword_26B12B530 != -1) {
    goto LABEL_48;
  }
LABEL_32:
  uint64_t v53 = v79;
  uint64_t v54 = __swift_project_value_buffer(v79, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  uint64_t v55 = v80;
  long long v56 = v81;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v81, v54, v53);
  sub_247398894(a3);
  sub_247398894(a3);
  long long v57 = v20;
  uint64_t v58 = sub_2473BD2F0();
  os_log_type_t v59 = sub_2473BDC50();
  if (os_log_type_enabled(v58, v59))
  {
    long long v60 = v10;
    uint64_t v61 = swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    *(void *)&long long v84 = v62;
    *(_DWORD *)uint64_t v61 = 134218242;
    *(void *)&long long v83 = [v57 (SEL)v60 + 2200];
    sub_2473BDCC0();

    *(_WORD *)(v61 + 12) = 2080;
    *(void *)&long long v83 = v9;
    type metadata accessor for AccountUISetting.CustomDataclass(0);
    swift_retain();
    uint64_t v63 = sub_2473BDAE0();
    *(void *)&long long v83 = sub_2473ABE34(v63, v64, (uint64_t *)&v84);
    sub_2473BDCC0();
    swift_bridgeObjectRelease();
    sub_24739898C(a3);
    sub_24739898C(a3);
    _os_log_impl(&dword_247380000, v58, v59, "Setting action %ld for dataclass %s", (uint8_t *)v61, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C553A30](v62, -1, -1);
    MEMORY[0x24C553A30](v61, -1, -1);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v81, v79);
  }
  else
  {

    sub_24739898C(a3);
    sub_24739898C(a3);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v53);
  }
  id v65 = objc_msgSend(v57, sel_undoAlertTitle);
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = sub_2473BDAD0();
    uint64_t v69 = v68;

    id v70 = objc_msgSend(v57, sel_undoAlertMessage);
    if (v70)
    {
      id v71 = v70;
      uint64_t v72 = sub_2473BDAD0();
      uint64_t v74 = v73;

      long long v84 = *(_OWORD *)(a3 + 128);
      uint64_t v85 = *(void *)(a3 + 144);
      *(void *)&long long v83 = v67;
      *((void *)&v83 + 1) = v69;
      sub_247398894(a3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
      sub_2473BD890();
      long long v84 = *(_OWORD *)(a3 + 152);
      uint64_t v85 = *(void *)(a3 + 168);
      *(void *)&long long v83 = v72;
      *((void *)&v83 + 1) = v74;
      sub_2473BD890();
      long long v84 = *(_OWORD *)(a3 + 80);
      sub_247391120((uint64_t)&v84 + 8, (uint64_t)v92, &qword_2692498D0);
      long long v83 = v84;
      sub_24739FD5C((uint64_t)v92);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
      sub_2473BD880();
      long long v83 = v84;
      BOOL v82 = !v86;
      sub_2473BD890();
      sub_24739FA64((uint64_t)&v84);

      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

uint64_t sub_24739C288(int a1, void *a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v45 = a4;
  int v44 = a1;
  uint64_t v10 = sub_2473BDA00();
  uint64_t v50 = *(void *)(v10 - 8);
  uint64_t v51 = v10;
  MEMORY[0x270FA5388](v10);
  long long v48 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_2473BDA30();
  uint64_t v47 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  long long v46 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2473BD310();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v13, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  id v18 = a2;
  id v19 = a2;
  long long v20 = sub_2473BD2F0();
  os_log_type_t v21 = sub_2473BDC50();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v42 = a5;
    uint64_t v43 = a6;
    long long v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v53 = v41;
    *(_DWORD *)long long v22 = 136315138;
    if (v44)
    {
      unint64_t v23 = 0xEB00000000796C6CLL;
      uint64_t v24 = 0x7566736563637573;
    }
    else
    {
      *(void *)&long long aBlock = 0;
      *((void *)&aBlock + 1) = 0xE000000000000000;
      sub_2473BDD80();
      swift_bridgeObjectRelease();
      strcpy((char *)&aBlock, "with an error ");
      HIBYTE(aBlock) = -18;
      long long v52 = a2;
      id v25 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692498A8);
      sub_2473BDAE0();
      sub_2473BDB20();
      swift_bridgeObjectRelease();
      unint64_t v23 = *((void *)&aBlock + 1);
      uint64_t v24 = aBlock;
    }
    *(void *)&long long aBlock = sub_2473ABE34(v24, v23, &v53);
    sub_2473BDCC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247380000, v20, v21, "save completed %s", v22, 0xCu);
    uint64_t v26 = v41;
    swift_arrayDestroy();
    MEMORY[0x24C553A30](v26, -1, -1);
    MEMORY[0x24C553A30](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    a5 = v42;
    a6 = v43;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  sub_2473911B4(0, &qword_26B12B5C8);
  long long v27 = (void *)sub_2473BDC60();
  long long v28 = (_OWORD *)swift_allocObject();
  long long v29 = a3[9];
  v28[9] = a3[8];
  v28[10] = v29;
  long long v30 = a3[11];
  v28[11] = a3[10];
  v28[12] = v30;
  long long v31 = a3[5];
  v28[5] = a3[4];
  v28[6] = v31;
  long long v32 = a3[7];
  v28[7] = a3[6];
  v28[8] = v32;
  long long v33 = a3[1];
  v28[1] = *a3;
  v28[2] = v33;
  long long v34 = a3[3];
  v28[3] = a3[2];
  v28[4] = v34;
  uint64_t v57 = a5;
  uint64_t v58 = v28;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v55 = sub_24739C898;
  uint64_t v56 = a6;
  id v35 = _Block_copy(&aBlock);
  sub_247398894((uint64_t)a3);
  swift_release();
  id v36 = v46;
  sub_2473BDA20();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_24739F8C4(&qword_26B12B5A0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
  sub_2473A041C((unint64_t *)&qword_26B12B5B0, &qword_26B12B5A8);
  uint64_t v37 = v48;
  uint64_t v38 = v51;
  sub_2473BDD20();
  MEMORY[0x24C553200](0, v36, v37, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v50 + 8))(v37, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v36, v49);
}

uint64_t sub_24739C898(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_24739C8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v36 = *(_OWORD *)(v6 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
  sub_2473BD880();
  if (!v37) {
    goto LABEL_8;
  }
  id v11 = objc_msgSend(v37, sel_accountType, v36);

  if (!v11)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v12 = objc_msgSend(v11, sel_identifier);

  if (!v12)
  {
LABEL_8:
    sub_2473BDAD0();
    goto LABEL_9;
  }
  uint64_t v13 = sub_2473BDAD0();
  uint64_t v15 = v14;

  uint64_t v16 = sub_2473BDAD0();
  if (!v15)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (v13 != v16 || v15 != v17)
  {
    char v25 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_14;
    }
LABEL_10:
    id v18 = (void *)sub_2473BDA90();
    id v19 = objc_msgSend(self, sel_bundleWithIdentifier_, v18);

    if (v19)
    {
      swift_bridgeObjectRetain();
      sub_2473BDB20();
      long long v20 = (void *)sub_2473BDA90();
      swift_bridgeObjectRelease();
      id v21 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, 0);

      sub_2473BDAD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_2473BE630;
      uint64_t v23 = MEMORY[0x263F8D310];
      *(void *)(v22 + 56) = MEMORY[0x263F8D310];
      unint64_t v24 = sub_24739F7B8();
      *(void *)(v22 + 32) = a3;
      *(void *)(v22 + 40) = a4;
      *(void *)(v22 + 96) = v23;
      *(void *)(v22 + 104) = v24;
      *(void *)(v22 + 64) = v24;
      *(void *)(v22 + 72) = a5;
      *(void *)(v22 + 80) = a6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_12:
      sub_2473BDAA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease_n();
LABEL_14:
  swift_beginAccess();
  uint64_t v26 = sub_2473BDAD0();
  uint64_t v28 = v27;
  if (v26 == sub_2473BDAD0() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v30 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_18:
  long long v31 = (void *)sub_2473BDA90();
  id v32 = objc_msgSend(self, sel_bundleWithIdentifier_, v31);

  if (v32)
  {
    swift_bridgeObjectRetain();
    sub_2473BDB20();
    long long v33 = (void *)sub_2473BDA90();
    swift_bridgeObjectRelease();
    id v34 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, 0, 0);

    sub_2473BDAD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_2473BE640;
    *(void *)(v35 + 56) = MEMORY[0x263F8D310];
    *(void *)(v35 + 64) = sub_24739F7B8();
    *(void *)(v35 + 32) = a5;
    *(void *)(v35 + 40) = a6;
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
LABEL_22:
  __break(1u);
}

uint64_t sub_24739CD64()
{
  return sub_2473BD720();
}

uint64_t sub_24739CD84@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  swift_beginAccess();
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  sub_247396A54();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2473BD6D0();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2473BD370();
  swift_release();
  swift_release();
  swift_release();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v8;
  *(void *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  sub_24739E4B4(v4, v6, v10);
  swift_bridgeObjectRetain();
  sub_24739E4C4(v12, v13, v14, v15);
  sub_24739E508(v12, v13, v14, v15);
  sub_247390310(v4, v6, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24739CEE4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2473BDA40();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249848);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v12 = *(void **)(a1 + 56);
  if (v12)
  {
    id v13 = v12;
    sub_2473BD820();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F67E68], v4);
    sub_2473BD840();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v11, v8);
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a2, v14, 1, v8);
}

uint64_t sub_24739D0F8()
{
  return sub_2473BD860();
}

void sub_24739D1CC(unint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  if (sub_247396D6C((id)4, a1) || sub_247396D6C((id)5, a1) || sub_247396D6C((id)6, a1))
  {
    uint64_t v4 = (void *)sub_2473BDA90();
    id v5 = objc_msgSend(self, sel_bundleWithIdentifier_, v4);

    if (v5)
    {
LABEL_5:
      uint64_t v6 = (void *)sub_2473BDA90();
      uint64_t v7 = (void *)sub_2473BDA90();
      id v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

      sub_2473BDAD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_2473BE640;
      swift_beginAccess();
      uint64_t v11 = *(void *)(v3 + 40);
      uint64_t v10 = *(void *)(v3 + 48);
      *(void *)(v9 + 56) = MEMORY[0x263F8D310];
      *(void *)(v9 + 64) = sub_24739F7B8();
      *(void *)(v9 + 32) = v11;
      *(void *)(v9 + 40) = v10;
      swift_bridgeObjectRetain();
      sub_2473BDAA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_26;
  }
  if (!sub_247396D6C((id)3, a1) && !sub_247396D6C((id)2, a1))
  {
    if (!sub_247396D6C((id)8, a1))
    {
      swift_beginAccess();
      uint64_t v19 = sub_2473BDAD0();
      uint64_t v21 = v20;
      if (v19 == sub_2473BDAD0() && v21 == v22)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v23 = sub_2473BDEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0) {
          return;
        }
      }
    }
    unint64_t v24 = (void *)sub_2473BDA90();
    id v25 = objc_msgSend(self, sel_bundleWithIdentifier_, v24);

    if (v25)
    {
      uint64_t v26 = (void *)sub_2473BDA90();
      uint64_t v27 = (void *)sub_2473BDA90();
      id v28 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, v27, 0);

      sub_2473BDAD0();
      return;
    }
    goto LABEL_27;
  }
  if (!sub_247396D6C((id)3, a1)) {
    goto LABEL_14;
  }
  swift_beginAccess();
  uint64_t v12 = sub_2473BDAD0();
  uint64_t v14 = v13;
  if (v12 == sub_2473BDAD0() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v17 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
LABEL_14:
      id v18 = (void *)sub_2473BDA90();
      id v5 = objc_msgSend(self, sel_bundleWithIdentifier_, v18);

      if (v5) {
        goto LABEL_5;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
    }
  }
}

uint64_t sub_24739D6A0()
{
  return sub_247398B08(*(_OWORD **)(v0 + 16));
}

uint64_t sub_24739D6A8@<X0>(uint64_t a1@<X8>)
{
  return sub_24739988C(*(void *)(v1 + 16), a1);
}

unint64_t sub_24739D6B0()
{
  unint64_t result = qword_269249780;
  if (!qword_269249780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249788);
    sub_24739D72C();
    sub_24739D890();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249780);
  }
  return result;
}

unint64_t sub_24739D72C()
{
  unint64_t result = qword_269249790;
  if (!qword_269249790)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249798);
    sub_24739D7CC();
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249790);
  }
  return result;
}

unint64_t sub_24739D7CC()
{
  unint64_t result = qword_2692497A0;
  if (!qword_2692497A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692497A8);
    sub_2473A041C(&qword_2692497B0, &qword_2692497B8);
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692497A0);
  }
  return result;
}

unint64_t sub_24739D890()
{
  unint64_t result = qword_2692497D0;
  if (!qword_2692497D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692497D0);
  }
  return result;
}

uint64_t sub_24739D8E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_24739D950()
{
  unint64_t result = qword_2692497E0;
  if (!qword_2692497E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692497E8);
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    sub_24739D9F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692497E0);
  }
  return result;
}

unint64_t sub_24739D9F0()
{
  unint64_t result = qword_269249800;
  if (!qword_269249800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249808);
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249800);
  }
  return result;
}

uint64_t sub_24739DA88@<X0>(uint64_t a1@<X8>)
{
  return sub_247399998(*(void *)(v1 + 16), a1);
}

void sub_24739DA90(char *a1@<X8>)
{
  sub_247399C24(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_24739DA98@<X0>(uint64_t a1@<X8>)
{
  return sub_24739A308(a1);
}

uint64_t sub_24739DAA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for DataclassRow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DataclassRow(id *a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for DataclassRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v5 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v5;
  uint64_t v6 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  uint64_t v7 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v7;
  uint64_t v11 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v11;
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  id v8 = v3;
  swift_retain();
  id v9 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DataclassRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v8;
  id v9 = v8;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_retain();
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy192_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 128) = result;
  *(_OWORD *)(a1 + 144) = v9;
  return result;
}

uint64_t assignWithTake for DataclassRow(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  long long v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_release();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataclassRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 192)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataclassRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 192) = 1;
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
    *(unsigned char *)(result + 192) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataclassRow()
{
  return &type metadata for DataclassRow;
}

uint64_t sub_24739E0FC()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for DataclassLabelView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for DataclassLabelView()
{
  return swift_release();
}

void *assignWithCopy for DataclassLabelView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for DataclassLabelView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataclassLabelView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataclassLabelView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataclassLabelView()
{
  return &type metadata for DataclassLabelView;
}

uint64_t sub_24739E3F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24739E410@<X0>(uint64_t a1@<X8>)
{
  return sub_24739CD84(*(void *)(v1 + 24), a1);
}

uint64_t sub_24739E418@<X0>(uint64_t a1@<X8>)
{
  return sub_24739CEE4(*(void *)(v1 + 24), a1);
}

unint64_t sub_24739E420()
{
  unint64_t result = qword_269249840;
  if (!qword_269249840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249830);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249840);
  }
  return result;
}

uint64_t sub_24739E4B4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24739E4C4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24739E4B4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24739E508(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_247390310(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24739E54C()
{
  return objectdestroyTm(208);
}

void sub_24739E554()
{
  sub_24739A1EC((void **)(v0 + 16));
}

uint64_t sub_24739E564()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739E570(unint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v130 = *(void *)(v3 + 40);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249760);
  sub_2473BD880();
  uint64_t v5 = (uint64_t)v131;
  if (v131)
  {
    id v6 = objc_msgSend(v131, sel_accountType);

    if (!v6)
    {
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    id v7 = objc_msgSend(v6, sel_identifier);

    if (v7)
    {
      uint64_t v5 = sub_2473BDAD0();
      uint64_t v9 = v8;

      goto LABEL_7;
    }
    uint64_t v5 = 0;
  }
  uint64_t v9 = 0;
LABEL_7:
  _sSo13ACAccountTypeC18AccountsUISettingsE09localizedB4Name3forS2SSg_tFZ_0(v5, v9);
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_247396E68((id)8, a1);
  if (v14)
  {
    uint64_t v15 = v14;
    swift_beginAccess();
    uint64_t v16 = sub_2473BDAD0();
    uint64_t v18 = v17;
    if (v16 == sub_2473BDAD0() && v18 == v19)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_17;
    }
    char v29 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v29)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      char v30 = (void *)sub_2473BDA90();
      id v31 = objc_msgSend(self, sel_bundleWithIdentifier_, v30);

      if (v31)
      {
        id v32 = (void *)sub_2473BDA90();
        long long v33 = (void *)sub_2473BDA90();
        id v34 = objc_msgSend(v31, sel_localizedStringForKey_value_table_, v32, v33, 0);

        uint64_t v26 = sub_2473BDAD0();
        unint64_t v28 = v35;

        goto LABEL_51;
      }
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
      goto LABEL_86;
    }
    id v36 = objc_msgSend(v15, sel_affectedContainers);
    if (v36)
    {
      uint64_t v38 = v36;
      uint64_t v39 = (void *)sub_2473BDB80();
    }
    else
    {
      uint64_t v39 = (void *)MEMORY[0x263F8EE78];
    }
    switch(v39[2])
    {
      case 0:
        swift_bridgeObjectRelease();
        uint64_t v40 = (void *)sub_2473BDA90();
        id v41 = objc_msgSend(self, sel_bundleWithIdentifier_, v40);

        if (!v41) {
          goto LABEL_81;
        }
        uint64_t v42 = (void *)sub_2473BDA90();
        uint64_t v43 = (void *)sub_2473BDA90();
        id v44 = objc_msgSend(v41, sel_localizedStringForKey_value_table_, v42, v43, 0);

        sub_2473BDAD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
        uint64_t v45 = swift_allocObject();
        *(_OWORD *)(v45 + 16) = xmmword_2473BE630;
        uint64_t v46 = MEMORY[0x263F8D310];
        *(void *)(v45 + 56) = MEMORY[0x263F8D310];
        unint64_t v47 = sub_24739F7B8();
        *(void *)(v45 + 32) = v130;
        *(void *)(v45 + 40) = v4;
        *(void *)(v45 + 96) = v46;
        *(void *)(v45 + 104) = v47;
        *(void *)(v45 + 64) = v47;
        *(void *)(v45 + 72) = v11;
        *(void *)(v45 + 80) = v13;
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_2473BDAA0();
        unint64_t v28 = v48;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_51;
      case 1:
        uint64_t v69 = (void *)sub_2473BDA90();
        id v70 = objc_msgSend(self, sel_bundleWithIdentifier_, v69);

        if (!v70) {
          goto LABEL_83;
        }
        id v71 = (void *)sub_2473BDA90();
        uint64_t v72 = (void *)sub_2473BDA90();
        id v73 = objc_msgSend(v70, sel_localizedStringForKey_value_table_, v71, v72, 0);

        sub_2473BDAD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
        uint64_t v74 = swift_allocObject();
        *(_OWORD *)(v74 + 16) = xmmword_2473BEFD0;
        uint64_t v75 = MEMORY[0x263F8D310];
        *(void *)(v74 + 56) = MEMORY[0x263F8D310];
        unint64_t v76 = sub_24739F7B8();
        *(void *)(v74 + 32) = v130;
        *(void *)(v74 + 40) = v4;
        *(void *)(v74 + 96) = v75;
        *(void *)(v74 + 104) = v76;
        *(void *)(v74 + 64) = v76;
        *(void *)(v74 + 72) = v11;
        *(void *)(v74 + 80) = v13;
        *(void *)(v74 + 136) = v75;
        *(void *)(v74 + 144) = v76;
        if (!v39[2]) {
          goto LABEL_69;
        }
        uint64_t v77 = v39[4];
        uint64_t v78 = v39[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)(v74 + 112) = v77;
        *(void *)(v74 + 120) = v78;
        goto LABEL_49;
      case 2:
        uint64_t v79 = (void *)sub_2473BDA90();
        id v80 = objc_msgSend(self, sel_bundleWithIdentifier_, v79);

        if (!v80) {
          goto LABEL_84;
        }
        long long v81 = (void *)sub_2473BDA90();
        BOOL v82 = (void *)sub_2473BDA90();
        id v83 = objc_msgSend(v80, sel_localizedStringForKey_value_table_, v81, v82, 0);

        sub_2473BDAD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
        uint64_t v84 = swift_allocObject();
        *(_OWORD *)(v84 + 16) = xmmword_2473BEFC0;
        uint64_t v85 = MEMORY[0x263F8D310];
        *(void *)(v84 + 56) = MEMORY[0x263F8D310];
        unint64_t v86 = sub_24739F7B8();
        *(void *)(v84 + 32) = v130;
        *(void *)(v84 + 40) = v4;
        *(void *)(v84 + 96) = v85;
        *(void *)(v84 + 104) = v86;
        *(void *)(v84 + 64) = v86;
        *(void *)(v84 + 72) = v11;
        *(void *)(v84 + 80) = v13;
        *(void *)(v84 + 136) = v85;
        *(void *)(v84 + 144) = v86;
        uint64_t v87 = v39[2];
        if (!v87) {
          goto LABEL_70;
        }
        uint64_t v88 = v39[5];
        *(void *)(v84 + 112) = v39[4];
        *(void *)(v84 + 120) = v88;
        *(void *)(v84 + 176) = v85;
        *(void *)(v84 + 184) = v86;
        if (v87 == 1) {
          goto LABEL_73;
        }
        uint64_t v89 = v39[6];
        uint64_t v90 = v39[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)(v84 + 152) = v89;
        *(void *)(v84 + 160) = v90;
        goto LABEL_49;
      case 3:
        long long v91 = (void *)sub_2473BDA90();
        id v92 = objc_msgSend(self, sel_bundleWithIdentifier_, v91);

        if (!v92) {
          goto LABEL_85;
        }
        long long v93 = (void *)sub_2473BDA90();
        long long v94 = (void *)sub_2473BDA90();
        id v95 = objc_msgSend(v92, sel_localizedStringForKey_value_table_, v93, v94, 0);

        sub_2473BDAD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
        uint64_t v96 = swift_allocObject();
        *(_OWORD *)(v96 + 16) = xmmword_2473BEF30;
        uint64_t v97 = MEMORY[0x263F8D310];
        *(void *)(v96 + 56) = MEMORY[0x263F8D310];
        unint64_t v98 = sub_24739F7B8();
        *(void *)(v96 + 32) = v130;
        *(void *)(v96 + 40) = v4;
        *(void *)(v96 + 96) = v97;
        *(void *)(v96 + 104) = v98;
        *(void *)(v96 + 64) = v98;
        *(void *)(v96 + 72) = v11;
        *(void *)(v96 + 80) = v13;
        *(void *)(v96 + 136) = v97;
        *(void *)(v96 + 144) = v98;
        unint64_t v99 = v39[2];
        if (!v99) {
          goto LABEL_71;
        }
        uint64_t v100 = v39[5];
        *(void *)(v96 + 112) = v39[4];
        *(void *)(v96 + 120) = v100;
        *(void *)(v96 + 176) = v97;
        *(void *)(v96 + 184) = v98;
        if (v99 == 1) {
          goto LABEL_74;
        }
        uint64_t v101 = v39[7];
        *(void *)(v96 + 152) = v39[6];
        *(void *)(v96 + 160) = v101;
        *(void *)(v96 + 216) = v97;
        *(void *)(v96 + 224) = v98;
        if (v99 < 3) {
          goto LABEL_76;
        }
        uint64_t v102 = v39[8];
        uint64_t v103 = v39[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)(v96 + 192) = v102;
        *(void *)(v96 + 200) = v103;
LABEL_49:
        uint64_t v26 = sub_2473BDAA0();
        unint64_t v28 = v104;
        swift_bridgeObjectRelease();
        goto LABEL_50;
      default:
        uint64_t v129 = v37;
        uint64_t v55 = (void *)sub_2473BDA90();
        id v56 = objc_msgSend(self, sel_bundleWithIdentifier_, v55);

        if (!v56) {
          goto LABEL_82;
        }
        uint64_t v57 = (void *)sub_2473BDA90();
        uint64_t v58 = (void *)sub_2473BDA90();
        id v59 = objc_msgSend(v56, sel_localizedStringForKey_value_table_, v57, v58, 0);

        sub_2473BDAD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
        uint64_t v60 = swift_allocObject();
        *(_OWORD *)(v60 + 16) = xmmword_2473BEFE0;
        uint64_t v61 = MEMORY[0x263F8D310];
        *(void *)(v60 + 56) = MEMORY[0x263F8D310];
        unint64_t v62 = sub_24739F7B8();
        *(void *)(v60 + 32) = v130;
        *(void *)(v60 + 40) = v4;
        *(void *)(v60 + 96) = v61;
        *(void *)(v60 + 104) = v62;
        *(void *)(v60 + 64) = v62;
        *(void *)(v60 + 72) = v11;
        *(void *)(v60 + 80) = v13;
        *(void *)(v60 + 136) = v61;
        *(void *)(v60 + 144) = v62;
        unint64_t v63 = v39[2];
        if (v63)
        {
          uint64_t v64 = v39[5];
          *(void *)(v60 + 112) = v39[4];
          *(void *)(v60 + 120) = v64;
          *(void *)(v60 + 176) = v61;
          *(void *)(v60 + 184) = v62;
          if (v63 != 1)
          {
            uint64_t v65 = v39[7];
            *(void *)(v60 + 152) = v39[6];
            *(void *)(v60 + 160) = v65;
            *(void *)(v60 + 216) = v61;
            *(void *)(v60 + 224) = v62;
            if (v63 >= 3)
            {
              uint64_t v66 = v39[9];
              *(void *)(v60 + 192) = v39[8];
              *(void *)(v60 + 200) = v66;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              id v67 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v129);
              *(void *)(v60 + 256) = sub_2473911B4(0, &qword_269249720);
              *(void *)(v60 + 264) = sub_24739F80C();
              *(void *)(v60 + 232) = v67;
              uint64_t v26 = sub_2473BDAA0();
              unint64_t v28 = v68;
              swift_bridgeObjectRelease();
LABEL_50:
              swift_bridgeObjectRelease();

              goto LABEL_51;
            }
            goto LABEL_75;
          }
        }
        else
        {
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
LABEL_71:
          __break(1u);
        }
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
    }
  }
  if (!sub_247396D6C((id)4, a1) && !sub_247396D6C((id)5, a1) && !sub_247396D6C((id)6, a1))
  {
    if (sub_247396D6C((id)3, a1) && sub_247396D6C((id)2, a1))
    {
      sub_24739C8DC(0xD000000000000025, 0x80000002473C4040, v11, v13, v130, v4);
      uint64_t v26 = v49;
      unint64_t v28 = v50;
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    if (!sub_247396D6C((id)3, a1))
    {
      swift_bridgeObjectRelease();
      uint64_t v26 = 0;
      unint64_t v28 = 0xE000000000000000;
      goto LABEL_51;
    }
    uint64_t v128 = v3 + 32;
    swift_beginAccess();
    uint64_t v51 = sub_2473BDAD0();
    uint64_t v53 = v52;
    if (v51 == sub_2473BDAD0() && v53 == v54)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v113 = sub_2473BDEB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v113 & 1) == 0)
      {
        uint64_t v116 = sub_2473BDAD0();
        uint64_t v118 = v117;
        if (v116 == sub_2473BDAD0() && v118 == v119)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v120 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v120 & 1) == 0)
          {
            sub_24739C8DC(0xD00000000000001CLL, 0x80000002473C3E60, v11, v13, v130, v4);
            uint64_t v26 = v126;
            unint64_t v28 = v127;
            swift_bridgeObjectRelease();
            goto LABEL_51;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v121 = (void *)sub_2473BDA90();
        id v115 = objc_msgSend(self, sel_bundleWithIdentifier_, v121, v128);

        if (!v115)
        {
LABEL_87:
          __break(1u);
          JUMPOUT(0x24739F7A8);
        }
LABEL_66:
        v122 = (void *)sub_2473BDA90();
        char v123 = (void *)sub_2473BDA90();
        id v124 = objc_msgSend(v115, sel_localizedStringForKey_value_table_, v122, v123, 0);

        uint64_t v26 = sub_2473BDAD0();
        unint64_t v28 = v125;

        goto LABEL_51;
      }
    }
    swift_bridgeObjectRelease();
    v114 = (void *)sub_2473BDA90();
    id v115 = objc_msgSend(self, sel_bundleWithIdentifier_, v114, v128);

    if (!v115)
    {
LABEL_86:
      __break(1u);
      goto LABEL_87;
    }
    goto LABEL_66;
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)sub_2473BDA90();
  id v21 = objc_msgSend(self, sel_bundleWithIdentifier_, v20);

  if (!v21) {
    goto LABEL_80;
  }
  uint64_t v22 = (void *)sub_2473BDA90();
  char v23 = (void *)sub_2473BDA90();
  id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

  sub_2473BDAD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_2473BE640;
  *(void *)(v25 + 56) = MEMORY[0x263F8D310];
  *(void *)(v25 + 64) = sub_24739F7B8();
  *(void *)(v25 + 32) = v130;
  *(void *)(v25 + 40) = v4;
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_2473BDAA0();
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_51:
  uint64_t v105 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0) {
    uint64_t v105 = v26 & 0xFFFFFFFFFFFFLL;
  }
  if (!v105)
  {
    swift_bridgeObjectRelease();
    uint64_t v106 = (void *)sub_2473BDA90();
    id v107 = objc_msgSend(self, sel_bundleWithIdentifier_, v106);

    if (v107)
    {
      id v108 = (void *)sub_2473BDA90();
      uint64_t v109 = (void *)sub_2473BDA90();
      id v110 = objc_msgSend(v107, sel_localizedStringForKey_value_table_, v108, v109, 0);

      sub_2473BDAD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
      uint64_t v111 = swift_allocObject();
      *(_OWORD *)(v111 + 16) = xmmword_2473BE640;
      *(void *)(v111 + 56) = MEMORY[0x263F8D310];
      *(void *)(v111 + 64) = sub_24739F7B8();
      *(void *)(v111 + 32) = v130;
      *(void *)(v111 + 40) = v4;
      uint64_t v26 = sub_2473BDAA0();
      swift_bridgeObjectRelease();
      goto LABEL_56;
    }
    goto LABEL_79;
  }
LABEL_56:
  swift_bridgeObjectRelease();
  return v26;
}

unint64_t sub_24739F7B8()
{
  unint64_t result = qword_269249870;
  if (!qword_269249870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249870);
  }
  return result;
}

unint64_t sub_24739F80C()
{
  unint64_t result = qword_269249878;
  if (!qword_269249878)
  {
    sub_2473911B4(255, &qword_269249720);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249878);
  }
  return result;
}

char *keypath_get_selector_type()
{
  return sel_type;
}

id sub_24739F880@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

uint64_t sub_24739F8B4()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739F8BC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247398C90(a1, (_OWORD *)(v2 + 16), a2);
}

uint64_t sub_24739F8C4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24739F914()
{
  sub_2473992F8(*(void **)(v0 + 208));
}

uint64_t objectdestroy_23Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 216, 7);
}

uint64_t sub_24739F9F4()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739F9FC(int a1, void *a2)
{
  return sub_24739C288(a1, a2, (_OWORD *)(v2 + 16), (uint64_t)&unk_26FB83C48, (uint64_t)sub_24739E56C, (uint64_t)&block_descriptor_39);
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

uint64_t sub_24739FA54()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739FA64(uint64_t a1)
{
  return a1;
}

void sub_24739FA94(unsigned __int8 *a1@<X8>)
{
  sub_247397890(v1 + 32, a1);
}

uint64_t objectdestroy_47Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 224, 7);
}

uint64_t sub_24739FB54(char *a1)
{
  char v1 = *a1;
  memset(v3, 0, sizeof(v3));
  sub_24739A388(v1, (uint64_t)v3);
  return sub_24738EAF8((uint64_t)v3, &qword_26B12B5F0);
}

uint64_t sub_24739FBA0@<X0>(uint64_t *a1@<X8>)
{
  return sub_247398A80(a1);
}

uint64_t sub_24739FBB8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_24739FBC8(unsigned char *a1)
{
  return sub_2473B453C(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_24739FBD0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_24739FBE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24739FC44()
{
  return objectdestroyTm(209);
}

uint64_t sub_24739FC4C(char a1)
{
  return sub_24739B3A0(a1, (long long *)(v1 + 16), *(unsigned char *)(v1 + 208), (uint64_t)&unk_26FB83E28, (uint64_t)sub_24739E56C, (uint64_t)&block_descriptor_92);
}

uint64_t sub_24739FC90()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_24739FCE0(uint64_t a1, void *a2)
{
  sub_247389518(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void (**)(id, void (*)(void), uint64_t))(v2 + 32), *(void *)(v2 + 40), *(void (**)(BOOL))(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_24739FCF0()
{
  return objectdestroyTm(209);
}

uint64_t sub_24739FCF8(char a1)
{
  return sub_24739B3A0(a1, (long long *)(v1 + 16), *(unsigned char *)(v1 + 208), (uint64_t)&unk_26FB83DD8, (uint64_t)sub_24739E56C, (uint64_t)&block_descriptor_86);
}

uint64_t sub_24739FD3C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24739FD4C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24739FD5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24739FD88()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739FD90()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739FD98()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 224, 7);
}

void sub_24739FE48()
{
  sub_24739B724(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24), v0 + 32);
}

uint64_t sub_24739FE58()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739FE60(int a1, void *a2)
{
  return sub_24739C288(a1, a2, (_OWORD *)(v2 + 16), (uint64_t)&unk_26FB83FB8, (uint64_t)sub_24739E56C, (uint64_t)&block_descriptor_122);
}

uint64_t sub_24739FEA0()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739FEA8(int a1, void *a2)
{
  return sub_24739C288(a1, a2, (_OWORD *)(v2 + 16), (uint64_t)&unk_26FB83F68, (uint64_t)sub_24739E56C, (uint64_t)&block_descriptor_116);
}

uint64_t sub_24739FEE8()
{
  return objectdestroyTm(208);
}

uint64_t sub_24739FEF0()
{
  return objectdestroyTm(208);
}

uint64_t objectdestroyTm(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24739FFAC()
{
  return sub_2473BD890();
}

uint64_t sub_2473A0000()
{
  return sub_2473A041C(&qword_2692498D8, &qword_2692498E0);
}

void destroy for CustomDataclassTable(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for CustomDataclassTable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for CustomDataclassTable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v7 = *(void **)(a2 + 24);
  uint64_t v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

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

uint64_t assignWithTake for CustomDataclassTable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for CustomDataclassTable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomDataclassTable(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomDataclassTable()
{
  return &type metadata for CustomDataclassTable;
}

void *initializeBufferWithCopyOfBuffer for DataclassTable(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for DataclassTable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for DataclassTable(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for DataclassTable(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for DataclassTable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataclassTable()
{
  return &type metadata for DataclassTable;
}

uint64_t sub_2473A0390()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473A03AC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2473A03C8()
{
  unint64_t result = qword_269249900;
  if (!qword_269249900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249900);
  }
  return result;
}

uint64_t sub_2473A041C(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_2473A046C()
{
  unint64_t result = qword_269249920;
  if (!qword_269249920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249928);
    sub_24739D8E4(&qword_2692498F8, &qword_2692498F0, (void (*)(void))sub_2473A03C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249920);
  }
  return result;
}

uint64_t sub_2473A0520()
{
  return sub_24739D8E4(&qword_2692498F8, &qword_2692498F0, (void (*)(void))sub_2473A03C8);
}

uint64_t AccountSettingsRootView.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473A0610();
  uint64_t result = sub_2473BD4B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2473A0610()
{
  unint64_t result = qword_269249678;
  if (!qword_269249678)
  {
    type metadata accessor for AccountsUIModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249678);
  }
  return result;
}

uint64_t AccountSettingsRootView.body.getter@<X0>(uint64_t a1@<X8>)
{
  sub_2473BD580();
  uint64_t result = sub_2473BD6C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2473A06D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473A06F0@<X0>(uint64_t a1@<X8>)
{
  sub_2473BD580();
  uint64_t result = sub_2473BD6C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

ValueMetadata *type metadata accessor for AccountSettingsRootView()
{
  return &type metadata for AccountSettingsRootView;
}

uint64_t sub_2473A076C()
{
  return MEMORY[0x263F1A820];
}

BOOL static AccountsTypes.IconType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AccountsTypes.IconType.hash(into:)()
{
  return sub_2473BDF00();
}

uint64_t AccountsTypes.IconType.hashValue.getter()
{
  return sub_2473BDF10();
}

BOOL sub_2473A0804(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_2473A0820()
{
  unint64_t result = qword_269249930;
  if (!qword_269249930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249930);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountsTypes()
{
  return &type metadata for AccountsTypes;
}

uint64_t getEnumTagSinglePayload for AccountsTypes.IconType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountsTypes.IconType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2473A09E0);
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

unsigned char *sub_2473A0A08(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AccountsTypes.IconType()
{
  return &type metadata for AccountsTypes.IconType;
}

unint64_t sub_2473A0A24(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692496B8);
  uint64_t v2 = sub_2473BDE60();
  int v3 = (void *)v2;
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
    sub_24739FBE0(v6, (uint64_t)&v15, &qword_269249B28);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24738A980(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_24738EB54(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
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

unint64_t sub_2473A0B68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B5D0);
  uint64_t v2 = (void *)sub_2473BDE60();
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
    swift_bridgeObjectRetain();
    unint64_t result = sub_24738A980(v5, v6);
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
    v2[2] = v13;
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

unint64_t sub_2473A0C84(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249B20);
  uint64_t v2 = (void *)sub_2473BDE60();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_24738AA3C((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

uint64_t AccountAddView.init(_:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  type metadata accessor for AccountsUIModel(0);
  sub_2473A82FC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t v4 = sub_2473BD4B0();
  uint64_t v6 = v5;
  sub_2473BD2D0();
  sub_2473A82FC(&qword_269249938, MEMORY[0x263F230E0]);
  uint64_t v7 = sub_2473BD4B0();
  uint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249940);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2473BE640;
  *(unsigned char *)(inited + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B418);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2473BEFE0;
  *(void *)(v11 + 32) = sub_2473BDAD0();
  *(void *)(v11 + 40) = v12;
  *(void *)(v11 + 48) = sub_2473BDAD0();
  *(void *)(v11 + 56) = v13;
  *(void *)(v11 + 64) = sub_2473BDAD0();
  *(void *)(v11 + 72) = v14;
  *(void *)(v11 + 80) = sub_2473BDAD0();
  *(void *)(v11 + 88) = v15;
  *(void *)(v11 + 96) = sub_2473BDAD0();
  *(void *)(v11 + 104) = v16;
  *(void *)(v11 + 112) = sub_2473BDAD0();
  *(void *)(v11 + 120) = v17;
  *(void *)(inited + 40) = v11;
  unint64_t v18 = sub_2473A6568(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249948);
  swift_arrayDestroy();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2473BEFD0;
  *(void *)(v19 + 32) = sub_2473BDAD0();
  *(void *)(v19 + 40) = v20;
  *(void *)(v19 + 48) = sub_2473BDAD0();
  *(void *)(v19 + 56) = v21;
  *(void *)(v19 + 64) = sub_2473BDAD0();
  *(void *)(v19 + 72) = v22;
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_2473BEFC0;
  *(void *)(v23 + 32) = sub_2473BDAD0();
  *(void *)(v23 + 40) = v24;
  *(void *)(v23 + 48) = sub_2473BDAD0();
  *(void *)(v23 + 56) = v25;
  *(void *)(v23 + 64) = sub_2473BDAD0();
  *(void *)(v23 + 72) = v26;
  uint64_t result = sub_2473BDAD0();
  *(void *)(v23 + 80) = result;
  *(void *)(v23 + 88) = v28;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v9;
  *(unsigned char *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = v18;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v23;
  return result;
}

BOOL static AccountAddView.AddType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccountAddView.AddType.hash(into:)()
{
  return sub_2473BDF00();
}

uint64_t AccountAddView.AddType.hashValue.getter()
{
  return sub_2473BDF10();
}

void AccountAddView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249950);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249958);
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249960);
  uint64_t v29 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = v1[1];
  v39[0] = *v1;
  v39[1] = v11;
  long long v12 = v1[3];
  v39[2] = v1[2];
  v39[3] = v12;
  id v34 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249968);
  sub_2473A041C(&qword_269249970, &qword_269249968);
  sub_2473BD690();
  uint64_t v13 = (void *)sub_2473BDA90();
  id v14 = objc_msgSend(self, sel_bundleWithIdentifier_, v13);

  if (v14)
  {
    uint64_t v15 = (void *)sub_2473BDA90();
    uint64_t v16 = (void *)sub_2473BDA90();
    id v17 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, v16, 0);

    uint64_t v18 = sub_2473BDAD0();
    uint64_t v20 = v19;

    uint64_t v35 = v18;
    uint64_t v36 = v20;
    uint64_t v21 = sub_2473A041C(&qword_269249978, &qword_269249950);
    unint64_t v22 = sub_247396A54();
    uint64_t v23 = MEMORY[0x263F8D310];
    sub_2473BD730();
    swift_bridgeObjectRelease();
    uint64_t v24 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    MEMORY[0x270FA5388](v24);
    *(&v28 - 2) = (uint64_t)v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249980);
    uint64_t v35 = v2;
    uint64_t v36 = v23;
    uint64_t v37 = v21;
    unint64_t v38 = v22;
    swift_getOpaqueTypeConformance2();
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249988);
    uint64_t v26 = sub_2473A041C(&qword_269249990, &qword_269249988);
    uint64_t v35 = v25;
    uint64_t v36 = v26;
    swift_getOpaqueTypeConformance2();
    uint64_t v27 = v32;
    sub_2473BD7B0();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v33, v10, v30);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473A15B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A48);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v39 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A50);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v42 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v41 = (char *)&v39 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A58);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v39 - v19;
  id v44 = (void **)a1;
  if (*(unsigned char *)(a1 + 32)) {
    goto LABEL_7;
  }
  sub_2473BD2D0();
  if ((sub_2473BD290() & 1) == 0) {
    goto LABEL_7;
  }
  if (!v44[2]) {
    goto LABEL_10;
  }
  swift_retain();
  uint64_t v21 = sub_2473BD270();
  swift_release();
  uint64_t v22 = *(void *)(v21 + 16);
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_7:
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v20, 1, 1, v10);
    goto LABEL_8;
  }
  uint64_t v23 = (void *)sub_2473BDA90();
  id v24 = objc_msgSend(self, sel_bundleWithIdentifier_, v23);

  if (v24)
  {
    uint64_t v25 = (void *)sub_2473BDA90();
    uint64_t v40 = (uint64_t *)sub_2473BDA90();
    id v26 = objc_msgSend(v24, sel_localizedStringForKey_value_table_, v25, v40, 0);
    uint64_t v27 = v24;
    id v28 = v26;

    uint64_t v29 = sub_2473BDAD0();
    uint64_t v39 = v30;

    uint64_t v40 = &v39;
    uint64_t v45 = v29;
    uint64_t v46 = v39;
    MEMORY[0x270FA5388](v31);
    *(&v39 - 2) = (uint64_t)v44;
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A78);
    sub_2473A81CC();
    sub_247396A54();
    sub_2473BD980();
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v32(v41, v42, v10);
    v32(v20, v41, v10);
    uint64_t v33 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
LABEL_8:
    MEMORY[0x270FA5388](v33);
    *(&v39 - 2) = (uint64_t)v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249A60);
    sub_2473A041C(&qword_269249A68, &qword_269249A60);
    sub_2473BD9A0();
    sub_24739FBE0((uint64_t)v20, (uint64_t)v18, &qword_269249A58);
    id v34 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v34(v7, v9, v3);
    uint64_t v35 = v43;
    sub_24739FBE0((uint64_t)v18, v43, &qword_269249A58);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A70);
    v34((char *)(v35 + *(int *)(v36 + 48)), v7, v3);
    uint64_t v37 = *(void (**)(char *, uint64_t))(v4 + 8);
    v37(v9, v3);
    sub_24738EAF8((uint64_t)v20, &qword_269249A58);
    v37(v7, v3);
    return sub_24738EAF8((uint64_t)v18, &qword_269249A58);
  }
  __break(1u);
LABEL_10:
  sub_2473A8140(v44);
  sub_2473A82FC(&qword_269249938, MEMORY[0x263F230E0]);
  uint64_t result = sub_2473BD490();
  __break(1u);
  return result;
}

uint64_t sub_2473A1B88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A78);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    swift_retain();
    uint64_t v6 = sub_2473BD270();
    swift_release();
    uint64_t v22 = v6;
    v15[2] = swift_getKeyPath();
    uint64_t v7 = (_OWORD *)swift_allocObject();
    long long v8 = *(_OWORD *)(a1 + 16);
    v7[1] = *(_OWORD *)a1;
    void v7[2] = v8;
    long long v9 = *(_OWORD *)(a1 + 48);
    v7[3] = *(_OWORD *)(a1 + 32);
    v7[4] = v9;
    sub_2473A8140((void **)a1);
    v15[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_269249A90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249A98);
    sub_2473A041C(&qword_269249AA0, &qword_269249A90);
    sub_2473A82FC(&qword_269249AA8, MEMORY[0x263F230C8]);
    uint64_t v10 = type metadata accessor for ShowAddButton();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692497F8);
    uint64_t v12 = sub_2473A82FC(&qword_269249A88, (void (*)(uint64_t))type metadata accessor for ShowAddButton);
    uint64_t v13 = sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    uint64_t v18 = v10;
    uint64_t v19 = v11;
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    swift_getOpaqueTypeConformance2();
    sub_2473BD960();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(v17, v5, v16);
  }
  else
  {
    sub_2473A8140((void **)a1);
    sub_2473BD2D0();
    sub_2473A82FC(&qword_269249938, MEMORY[0x263F230E0]);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473A1E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2473BD260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for ShowAddButton();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_2473A2078((uint64_t)v7, (uint64_t)v10);
  uint64_t v13 = a2;
  uint64_t v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  sub_2473A82FC(&qword_269249A88, (void (*)(uint64_t))type metadata accessor for ShowAddButton);
  sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
  sub_2473BD710();
  return sub_2473A8094((uint64_t)v10);
}

uint64_t sub_2473A2078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473A82FC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  *(void *)a2 = sub_2473BD4B0();
  *(void *)(a2 + 8) = v4;
  sub_2473BD870();
  *(_OWORD *)(a2 + 16) = v11;
  *(void *)(a2 + 32) = v12;
  sub_2473BD870();
  *(_OWORD *)(a2 + 40) = v11;
  *(void *)(a2 + 56) = v12;
  sub_2473BD870();
  *(_OWORD *)(a2 + 64) = v11;
  *(void *)(a2 + 80) = v12;
  sub_2473BD870();
  *(unsigned char *)(a2 + 88) = v11;
  *(void *)(a2 + 96) = *((void *)&v11 + 1);
  uint64_t v5 = type metadata accessor for ShowAddButton();
  *(void *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = 0;
  uint64_t v6 = a2 + *(int *)(v5 + 40);
  uint64_t v7 = sub_2473BD260();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 1, 1, v7);
  *(unsigned char *)(a2 + *(int *)(v5 + 44)) = 0;
  sub_24738EAF8(v6, &qword_2692499A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, a1, v7);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v9)(v6, 0, 1, v7);
}

uint64_t sub_2473A2270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2473BD260();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249850);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473BD3A0();
  uint64_t v10 = sub_2473BD3C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  long long v13 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v12 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v12 + 2) = v13;
  long long v14 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v12 + 3) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v12 + 4) = v14;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_2473A8140((void **)a1);
  return sub_2473BD8B0();
}

uint64_t sub_2473A2488(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    swift_retain();
    sub_2473BD2B0();
    return swift_release();
  }
  else
  {
    sub_2473A8140((void **)a1);
    sub_2473BD2D0();
    sub_2473A82FC(&qword_269249938, MEMORY[0x263F230E0]);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

void sub_2473A2538(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_2473BDA90();
  id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    uint64_t v4 = (void *)sub_2473BDA90();
    uint64_t v5 = (void *)sub_2473BDA90();
    id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_2473BDAD0();
    sub_247396A54();
    *(void *)a1 = sub_2473BD6D0();
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = v8 & 1;
    *(void *)(a1 + 24) = v9;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473A267C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249AB0);
  MEMORY[0x270FA5388](v62);
  uint64_t v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_2473BD620();
  uint64_t v58 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v57 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249AB8);
  uint64_t v56 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v55 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249AC0);
  uint64_t v60 = *(void *)(v64 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v64);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v59 = (char *)&v55 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249AC8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v55 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249AD0);
  uint64_t v70 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  id v24 = (char *)&v55 - v23;
  MEMORY[0x270FA5388](v22);
  id v71 = (char *)&v55 - v25;
  uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 16);
  unint64_t v68 = v5;
  uint64_t v69 = a2;
  uint64_t v66 = v17;
  id v67 = v15;
  uint64_t v65 = v21;
  if (v26 && (sub_24738AAD0(*(unsigned char *)(a1 + 32)), (v27 & 1) != 0)) {
    uint64_t v28 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v28 = MEMORY[0x263F8EE78];
  }
  uint64_t v72 = v28;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B3D0);
  type metadata accessor for ShowAddButton();
  sub_2473A041C(&qword_269249AD8, (uint64_t *)&unk_26B12B3D0);
  sub_2473A82FC(&qword_269249A88, (void (*)(uint64_t))type metadata accessor for ShowAddButton);
  sub_2473BD960();
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v71, v24, v18);
  uint64_t v29 = *(void **)a1;
  if (*(void *)a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v30 = v29;
    sub_2473BD370();

    swift_release();
    swift_release();
    if (v72)
    {
      uint64_t v72 = *(void *)(a1 + 56);
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      uint64_t v31 = v65;
      sub_2473BD960();
      uint64_t v32 = v70;
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
      v33(v68, v31, v18);
      swift_storeEnumTagMultiPayload();
      uint64_t v34 = sub_2473A041C(&qword_269249B00, &qword_269249AB8);
      uint64_t v35 = sub_2473A82FC(&qword_269249A28, MEMORY[0x263F19CE8]);
      uint64_t v72 = v61;
      uint64_t v73 = v63;
      uint64_t v74 = v34;
      uint64_t v75 = v35;
      swift_getOpaqueTypeConformance2();
      sub_2473A859C();
      uint64_t v36 = (uint64_t)v66;
      sub_2473BD5D0();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v18);
    }
    else
    {
      uint64_t v37 = (_OWORD *)swift_allocObject();
      long long v38 = *(_OWORD *)(a1 + 16);
      v37[1] = *(_OWORD *)a1;
      v37[2] = v38;
      long long v39 = *(_OWORD *)(a1 + 48);
      v37[3] = *(_OWORD *)(a1 + 32);
      v37[4] = v39;
      sub_2473A8140((void **)a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249AE0);
      sub_2473A8500(&qword_269249AE8, &qword_269249AE0, &qword_269249AF0, &qword_269249AF8);
      uint64_t v40 = v55;
      sub_2473BD8C0();
      id v41 = v57;
      sub_2473BD610();
      uint64_t v42 = sub_2473A041C(&qword_269249B00, &qword_269249AB8);
      uint64_t v43 = sub_2473A82FC(&qword_269249A28, MEMORY[0x263F19CE8]);
      uint64_t v44 = v61;
      uint64_t v45 = v63;
      sub_2473BD700();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v45);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v40, v44);
      unint64_t v47 = v59;
      uint64_t v46 = v60;
      uint64_t v48 = v64;
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v59, v10, v64);
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v68, v47, v48);
      swift_storeEnumTagMultiPayload();
      uint64_t v72 = v44;
      uint64_t v73 = v45;
      uint64_t v74 = v42;
      uint64_t v75 = v43;
      swift_getOpaqueTypeConformance2();
      sub_2473A859C();
      uint64_t v36 = (uint64_t)v66;
      sub_2473BD5D0();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
      uint64_t v32 = v70;
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
      uint64_t v31 = v65;
    }
    uint64_t v49 = v71;
    v33(v31, v71, v18);
    uint64_t v50 = (uint64_t)v67;
    sub_24739FBE0(v36, (uint64_t)v67, &qword_269249AC8);
    uint64_t v51 = v69;
    v33(v69, v31, v18);
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249B10);
    sub_24739FBE0(v50, (uint64_t)&v51[*(int *)(v52 + 48)], &qword_269249AC8);
    sub_24738EAF8(v36, &qword_269249AC8);
    uint64_t v53 = *(void (**)(char *, uint64_t))(v32 + 8);
    v53(v49, v18);
    sub_24738EAF8(v50, &qword_269249AC8);
    return ((uint64_t (*)(char *, uint64_t))v53)(v31, v18);
  }
  else
  {
    sub_2473A8140((void **)a1);
    type metadata accessor for AccountsUIModel(0);
    sub_2473A82FC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473A3044@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2473A3C1C(a1, 0, a2);
}

uint64_t sub_2473A304C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473A82FC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  *(void *)a4 = sub_2473BD4B0();
  *(void *)(a4 + 8) = v8;
  sub_2473BD870();
  *(_OWORD *)(a4 + 16) = v14;
  *(void *)(a4 + 32) = v15;
  sub_2473BD870();
  *(_OWORD *)(a4 + 40) = v14;
  *(void *)(a4 + 56) = v15;
  sub_2473BD870();
  *(_OWORD *)(a4 + 64) = v14;
  *(void *)(a4 + 80) = v15;
  sub_2473BD870();
  *(unsigned char *)(a4 + 88) = v14;
  *(void *)(a4 + 96) = *((void *)&v14 + 1);
  uint64_t v9 = type metadata accessor for ShowAddButton();
  uint64_t v10 = a4 + *(int *)(v9 + 40);
  uint64_t v11 = sub_2473BD260();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v13 = *(int *)(v9 + 44);
  *(void *)(a4 + 104) = a1;
  *(void *)(a4 + 112) = a2;
  *(unsigned char *)(a4 + v13) = a3;
  return result;
}

uint64_t sub_2473A31E0()
{
  return swift_release();
}

uint64_t sub_2473A324C(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    return sub_2473BD380();
  }
  else
  {
    sub_2473A8140(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_2473A82FC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

__n128 sub_2473A3328@<Q0>(uint64_t a1@<X8>)
{
  sub_2473BD520();
  sub_2473A3460((uint64_t)&v12);
  __n128 v2 = v13;
  char v3 = v14;
  sub_2473BD9C0();
  sub_2473A36A8(0.0, 1, 0.0, 1, 0.0, 1, 54.0, 0, (uint64_t)&v12, 0.0, 1, 54.0, 0);
  sub_247390310(v2.n128_i64[0], v2.n128_i64[1], v3);
  swift_bridgeObjectRelease();
  long long v4 = v21;
  long long v5 = v23;
  *(_OWORD *)(a1 + 160) = v22;
  *(_OWORD *)(a1 + 176) = v5;
  long long v6 = v17;
  long long v7 = v19;
  long long v8 = v20;
  *(_OWORD *)(a1 + 96) = v18;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v4;
  long long v9 = v15;
  long long v10 = v16;
  *(_OWORD *)(a1 + 32) = v14;
  *(_OWORD *)(a1 + 48) = v9;
  *(void *)(a1 + 192) = v24;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = v13;
  *(_OWORD *)a1 = v12;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

void sub_2473A3460(uint64_t a1@<X8>)
{
  __n128 v2 = (void *)sub_2473BDA90();
  id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    long long v4 = (void *)sub_2473BDA90();
    long long v5 = (void *)sub_2473BDA90();
    id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_2473BDAD0();
    sub_247396A54();
    uint64_t v7 = sub_2473BD6D0();
    uint64_t v9 = v8;
    LOBYTE(v6) = v10 & 1;
    sub_2473BD810();
    uint64_t v11 = sub_2473BD6A0();
    uint64_t v13 = v12;
    char v15 = v14;
    swift_release();
    char v16 = v15 & 1;
    sub_247390310(v7, v9, (char)v6);
    swift_bridgeObjectRelease();
    sub_2473BD670();
    uint64_t v17 = sub_2473BD6B0();
    uint64_t v19 = v18;
    LOBYTE(v6) = v20;
    uint64_t v22 = v21;
    swift_release();
    sub_247390310(v11, v13, v16);
    swift_bridgeObjectRelease();
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = 1;
    *(void *)(a1 + 16) = v17;
    *(void *)(a1 + 24) = v19;
    *(unsigned char *)(a1 + 32) = v6 & 1;
    *(void *)(a1 + 40) = v22;
    *(void *)(a1 + 48) = 0;
    *(unsigned char *)(a1 + 56) = 1;
    sub_24739E4B4(v17, v19, v6 & 1);
    swift_bridgeObjectRetain();
    sub_247390310(v17, v19, v6 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473A36A8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_2473BDC40();
    long long v23 = (void *)sub_2473BD650();
    sub_2473BD2E0();
  }
  sub_2473BD470();
  long long v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 152) = v31;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 88) = v27;
  *(_OWORD *)(a9 + 104) = v28;
  *(unsigned char *)(a9 + 80) = *(unsigned char *)(v13 + 80);
  *(_OWORD *)(a9 + 120) = v29;
  return sub_2473A8640(v13);
}

uint64_t sub_2473A387C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20 = a16;
  uint64_t v21 = a17;
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
    sub_2473BDC40();
    long long v30 = (void *)sub_2473BD650();
    sub_2473BD2E0();

    uint64_t v20 = a16;
    uint64_t v21 = a17;
  }
  sub_2473BD470();
  *(void *)a9 = v20;
  *(void *)(a9 + 8) = v21;
  *(void *)(a9 + 16) = a18;
  *(void *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473A3A58@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
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
    sub_2473BDC40();
    long long v25 = (void *)sub_2473BD650();
    sub_2473BD2E0();
  }
  sub_2473BD470();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;
  return swift_retain();
}

uint64_t sub_2473A3C14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2473A3C1C(a1, 1, a2);
}

uint64_t sub_2473A3C1C@<X0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2473A304C(v5, v6, a2, a3);
}

uint64_t sub_2473A3C74(uint64_t a1)
{
  uint64_t v2 = sub_2473BD600();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249988);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2473BD5E0();
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
  sub_2473BD420();
  uint64_t v7 = sub_2473A041C(&qword_269249990, &qword_269249988);
  MEMORY[0x24C552BC0](v6, v3, v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_2473A3E3C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249850);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_2473BDA90();
  id v12 = objc_msgSend(self, sel_bundleWithIdentifier_, v11);

  if (v12)
  {
    uint64_t v13 = (void *)sub_2473BDA90();
    char v14 = (void *)sub_2473BDA90();
    id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, v14, 0);

    uint64_t v16 = sub_2473BDAD0();
    uint64_t v18 = v17;

    v23[0] = v16;
    v23[1] = v18;
    sub_2473BD3B0();
    uint64_t v19 = sub_2473BD3C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 0, 1, v19);
    uint64_t v20 = (_OWORD *)swift_allocObject();
    long long v21 = *(_OWORD *)(a1 + 16);
    v20[1] = *(_OWORD *)a1;
    v20[2] = v21;
    long long v22 = *(_OWORD *)(a1 + 48);
    v20[3] = *(_OWORD *)(a1 + 32);
    v20[4] = v22;
    sub_2473A8140((void **)a1);
    sub_247396A54();
    sub_2473BD8D0();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473A40E8(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    sub_2473BD380();
    swift_getKeyPath();
    swift_getKeyPath();
    id v3 = v2;
    sub_2473BD380();
    swift_getKeyPath();
    swift_getKeyPath();
    v3;
    sub_2473BD370();
    swift_release();
    swift_release();
    if ((v5 & 1) == 0)
    {
      sub_2473862E0();
      sub_2473BD280();
      swift_release();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_2473BD380();
  }
  else
  {
    sub_2473A8140(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_2473A82FC((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473A42A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v28 = a1;
  uint64_t v24 = sub_2473BD620();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ShowAddButton();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499C0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499C8);
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  long long v23 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473A7AE0(v2, (uint64_t)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = swift_allocObject();
  sub_2473A7B48((uint64_t)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  uint64_t v31 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692499D0);
  sub_2473A7BCC();
  sub_2473BD8C0();
  sub_2473BD610();
  uint64_t v15 = sub_2473A041C(&qword_269249A20, &qword_2692499C0);
  uint64_t v16 = sub_2473A82FC(&qword_269249A28, MEMORY[0x263F19CE8]);
  uint64_t v17 = v24;
  sub_2473BD700();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v18 = *(void *)(v2 + 32);
  long long v32 = *(_OWORD *)(v2 + 16);
  uint64_t v33 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
  sub_2473BD880();
  uint64_t v19 = *(void *)(v2 + 96);
  char v35 = *(unsigned char *)(v2 + 88);
  uint64_t v36 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
  sub_2473BD8A0();
  uint64_t v30 = v2;
  uint64_t v29 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249818);
  *(void *)&long long v32 = v8;
  *((void *)&v32 + 1) = v17;
  uint64_t v33 = v15;
  uint64_t v34 = v16;
  swift_getOpaqueTypeConformance2();
  sub_247396A54();
  sub_2473A041C(&qword_269249820, &qword_269249818);
  uint64_t v20 = v26;
  long long v21 = v23;
  sub_2473BD780();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v21, v20);
}

void sub_2473A47D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShowAddButton();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v65 - v9;
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 112);
  uint64_t v13 = sub_2473BDAD0();
  if (v12)
  {
    if (v11 == v13 && v12 == v14)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v16 = sub_2473BDEB0();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        sub_2473A7AE0(a1, (uint64_t)v4);
        sub_2473A8094((uint64_t)v4);
        return;
      }
    }
    sub_24739FBE0(a1 + *(int *)(v2 + 40), (uint64_t)v10, &qword_2692499A0);
    uint64_t v19 = sub_2473BD260();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) == 1)
    {
      sub_24738EAF8((uint64_t)v10, &qword_2692499A0);
      long long v21 = (void *)sub_2473BDA90();
      long long v22 = self;
      id v23 = objc_msgSend(v22, sel_bundleWithIdentifier_, v21);

      if (!v23)
      {
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      uint64_t v24 = (void *)sub_2473BDA90();
      uint64_t v25 = (void *)sub_2473BDA90();
      id v26 = objc_msgSend(v23, sel_localizedStringForKey_value_table_, v24, v25, 0);

      uint64_t v27 = sub_2473BDAD0();
      uint64_t v29 = v28;

      uint64_t v30 = *(void *)(a1 + 32);
      long long v70 = *(_OWORD *)(a1 + 16);
      uint64_t v71 = v30;
      uint64_t v68 = v27;
      uint64_t v69 = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
      sub_2473BD890();
      uint64_t v31 = (void *)sub_2473BDA90();
      id v32 = objc_msgSend(v22, sel_bundleWithIdentifier_, v31);

      if (!v32)
      {
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v33 = sub_2473BD250();
      uint64_t v66 = v34;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
      char v35 = (void *)sub_2473BDA90();
      uint64_t v36 = self;
      id v37 = objc_msgSend(v36, (SEL)&off_265211798, v35);

      if (!v37)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      long long v38 = (void *)sub_2473BDA90();
      long long v39 = (void *)sub_2473BDA90();
      id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, v39, 0);

      sub_2473BDAD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249868);
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_2473BE640;
      *(void *)(v41 + 56) = MEMORY[0x263F8D310];
      *(void *)(v41 + 64) = sub_24739F7B8();
      uint64_t v42 = v66;
      *(void *)(v41 + 32) = v33;
      *(void *)(v41 + 40) = v42;
      uint64_t v43 = sub_2473BDAA0();
      uint64_t v45 = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v46 = *(void *)(a1 + 32);
      long long v70 = *(_OWORD *)(a1 + 16);
      uint64_t v71 = v46;
      uint64_t v68 = v43;
      uint64_t v69 = v45;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
      sub_2473BD890();
      unint64_t v47 = (void *)sub_2473BDA90();
      id v32 = objc_msgSend(v36, (SEL)&off_265211798, v47);

      if (!v32)
      {
LABEL_24:
        __break(1u);
        return;
      }
    }
    uint64_t v48 = (void *)sub_2473BDA90();
    uint64_t v49 = (void *)sub_2473BDA90();
    id v50 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v48, v49, 0);

    uint64_t v51 = sub_2473BDAD0();
    uint64_t v53 = v52;

    uint64_t v54 = *(void *)(a1 + 56);
    long long v70 = *(_OWORD *)(a1 + 40);
    uint64_t v71 = v54;
    uint64_t v68 = v51;
    uint64_t v69 = v53;
    sub_2473BD890();
    uint64_t v55 = (void *)sub_2473BDA90();
    id v56 = objc_msgSend(self, sel_bundleWithIdentifier_, v55);

    if (v56)
    {
      uint64_t v57 = (void *)sub_2473BDA90();
      uint64_t v58 = (void *)sub_2473BDA90();
      id v59 = objc_msgSend(v56, sel_localizedStringForKey_value_table_, v57, v58, 0);

      uint64_t v60 = sub_2473BDAD0();
      uint64_t v62 = v61;

      uint64_t v63 = *(void *)(a1 + 80);
      long long v70 = *(_OWORD *)(a1 + 64);
      uint64_t v71 = v63;
      uint64_t v68 = v60;
      uint64_t v69 = v62;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
      sub_2473BD890();
      LOBYTE(v58) = *(unsigned char *)(a1 + 88);
      uint64_t v64 = *(void *)(a1 + 96);
      LOBYTE(v70) = (_BYTE)v58;
      *((void *)&v70 + 1) = v64;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
      sub_2473BD880();
      LOBYTE(v70) = (_BYTE)v58;
      *((void *)&v70 + 1) = v64;
      BOOL v67 = (v68 & 1) == 0;
      sub_2473BD890();
      swift_release();
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  sub_2473A7AE0(a1, (uint64_t)v4);
  sub_24739FBE0((uint64_t)&v4[*(int *)(v2 + 40)], (uint64_t)v8, &qword_2692499A0);
  uint64_t v17 = sub_2473BD260();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17) == 1)
  {
    sub_2473A8094((uint64_t)v4);
    sub_24738EAF8((uint64_t)v8, &qword_2692499A0);
  }
  else
  {
    sub_2473BD240();
    sub_2473A8094((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v17);
    swift_bridgeObjectRelease();
  }
}

__n128 sub_2473A5050@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2473BD260();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ShowAddButton();
  sub_24739FBE0(a1 + *(int *)(v11 + 40), (uint64_t)v6, &qword_2692499A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_24738EAF8((uint64_t)v6, &qword_2692499A0);
    uint64_t v12 = *(void *)(a1 + 112);
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 104);
      if (*(unsigned char *)(a1 + *(int *)(v11 + 44)))
      {
        swift_bridgeObjectRetain();
        sub_247396870();
        uint64_t v15 = v14;
        uint64_t v17 = v16;
        uint64_t v18 = sub_2473BD9C0();
        sub_2473A387C(0.0, 1, 0.0, 1, 0.0, 1, 54.0, 0, (uint64_t)&v63, 0.0, 1, 54.0, 0, v18, v19, v13, v12, v15, v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        long long v79 = v69;
        long long v80 = v70;
        v81[0] = v71;
        long long v75 = v65;
        long long v76 = v66;
        long long v77 = v67;
        long long v78 = v68;
        __n128 v73 = v63;
        long long v74 = v64;
        sub_2473A811C((uint64_t)&v73);
        sub_247391120((uint64_t)&v73, (uint64_t)&v63, &qword_269249A38);
      }
      else
      {
        v73.n128_u64[0] = *(void *)(a1 + 104);
        v73.n128_u64[1] = v12;
        sub_2473A80FC((uint64_t)&v73);
        sub_247391120((uint64_t)&v73, (uint64_t)&v63, &qword_269249A38);
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249A10);
      sub_2473A7D98();
      sub_2473A7E14();
      sub_2473BD5D0();
      long long v47 = v57;
      long long v48 = v58;
      long long v49 = v59;
      char v50 = v60;
      long long v43 = v53;
      long long v44 = v54;
      long long v45 = v55;
      long long v46 = v56;
      long long v41 = v51;
      long long v42 = v52;
      sub_2473A8108((uint64_t)&v41);
      sub_247391120((uint64_t)&v41, (uint64_t)&v73, &qword_269249A40);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249A00);
      sub_2473A7C80();
      sub_2473A7CD4();
      sub_2473BD5D0();
      long long v69 = v37;
      long long v70 = v38;
      long long v71 = v39;
      __int16 v72 = v40;
      long long v65 = v33;
      long long v66 = v34;
      long long v67 = v35;
      long long v68 = v36;
      __n128 v63 = v31;
      long long v64 = v32;
      sub_2473A8114((uint64_t)&v63);
      sub_247391120((uint64_t)&v63, (uint64_t)v61, &qword_269249A30);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692499E8);
      sub_2473A7D10(&qword_2692499E0, &qword_2692499E8, (void (*)(void))sub_2473A7C80, (void (*)(void))sub_2473A7CD4);
      sub_2473BD5D0();
    }
    else
    {
      sub_2473A80F0((uint64_t)&v63);
      sub_247391120((uint64_t)&v63, (uint64_t)v61, &qword_269249A30);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692499E8);
      sub_2473A7D10(&qword_2692499E0, &qword_2692499E8, (void (*)(void))sub_2473A7C80, (void (*)(void))sub_2473A7CD4);
      sub_2473BD5D0();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    uint64_t v20 = sub_2473BD240();
    uint64_t v22 = v21;
    uint64_t v23 = sub_2473BD250();
    *(void *)&long long v41 = v20;
    *((void *)&v41 + 1) = v22;
    *(void *)&long long v42 = v23;
    *((void *)&v42 + 1) = v24;
    sub_2473A8124((uint64_t)&v41);
    sub_247391120((uint64_t)&v41, (uint64_t)&v73, &qword_269249A40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249A00);
    sub_2473A7C80();
    sub_2473A7CD4();
    sub_2473BD5D0();
    long long v69 = v37;
    long long v70 = v38;
    long long v71 = v39;
    __int16 v72 = v40;
    long long v65 = v33;
    long long v66 = v34;
    long long v67 = v35;
    long long v68 = v36;
    __n128 v63 = v31;
    long long v64 = v32;
    sub_2473A8114((uint64_t)&v63);
    sub_247391120((uint64_t)&v63, (uint64_t)&v73, &qword_269249A30);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692499E8);
    sub_2473A7D10(&qword_2692499E0, &qword_2692499E8, (void (*)(void))sub_2473A7C80, (void (*)(void))sub_2473A7CD4);
    sub_2473BD5D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    long long v79 = v61[6];
    long long v80 = v61[7];
    v81[0] = *(_OWORD *)v62;
    *(_DWORD *)((char *)v81 + 15) = *(_DWORD *)&v62[15];
    long long v75 = v61[2];
    long long v76 = v61[3];
    long long v77 = v61[4];
    long long v78 = v61[5];
    __n128 v73 = (__n128)v61[0];
    long long v74 = v61[1];
  }
  long long v25 = v80;
  *(_OWORD *)(a2 + 96) = v79;
  *(_OWORD *)(a2 + 112) = v25;
  *(_OWORD *)(a2 + 128) = v81[0];
  *(_DWORD *)(a2 + 143) = *(_DWORD *)((char *)v81 + 15);
  long long v26 = v76;
  *(_OWORD *)(a2 + 32) = v75;
  *(_OWORD *)(a2 + 48) = v26;
  long long v27 = v78;
  *(_OWORD *)(a2 + 64) = v77;
  *(_OWORD *)(a2 + 80) = v27;
  __n128 result = v73;
  long long v29 = v74;
  *(__n128 *)a2 = v73;
  *(_OWORD *)(a2 + 16) = v29;
  return result;
}

void sub_2473A5714(uint64_t a1@<X0>, char *a2@<X8>)
{
  long long v45 = a2;
  uint64_t v3 = type metadata accessor for ShowAddButton();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  long long v44 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v43 = (char *)v40 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  long long v41 = (char *)v40 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v42 = (char *)v40 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v40 - v17;
  uint64_t v19 = *(void *)(a1 + 80);
  long long v46 = *(_OWORD *)(a1 + 64);
  uint64_t v47 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
  sub_2473BD880();
  long long v46 = v48;
  sub_2473A7AE0(a1, (uint64_t)v6);
  uint64_t v20 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v21 = (v20 + 16) & ~v20;
  v40[1] = v20 | 7;
  v40[2] = v21 + v5;
  uint64_t v22 = swift_allocObject();
  sub_2473A7B48((uint64_t)v6, v22 + v21);
  v40[3] = sub_247396A54();
  sub_2473BD8E0();
  uint64_t v23 = (void *)sub_2473BDA90();
  id v24 = objc_msgSend(self, sel_bundleWithIdentifier_, v23);

  if (v24)
  {
    long long v25 = (void *)sub_2473BDA90();
    long long v26 = (void *)sub_2473BDA90();
    id v27 = objc_msgSend(v24, sel_localizedStringForKey_value_table_, v25, v26, 0);

    uint64_t v28 = sub_2473BDAD0();
    uint64_t v30 = v29;

    *(void *)&long long v46 = v28;
    *((void *)&v46 + 1) = v30;
    sub_2473A7AE0(a1, (uint64_t)v6);
    uint64_t v31 = swift_allocObject();
    sub_2473A7B48((uint64_t)v6, v31 + v21);
    long long v32 = v41;
    sub_2473BD8E0();
    long long v33 = v42;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v42, v32, v7);
    long long v34 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    long long v35 = v43;
    v34(v43, v18, v7);
    long long v36 = v44;
    v34(v44, v33, v7);
    long long v37 = v45;
    v34(v45, v35, v7);
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249858);
    v34(&v37[*(int *)(v38 + 48)], v36, v7);
    long long v39 = *(void (**)(char *, uint64_t))(v8 + 8);
    v39(v33, v7);
    v39(v18, v7);
    v39(v36, v7);
    v39(v35, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473A5BA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for ShowAddButton();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = *(void *)(a1 + 96);
  char v15 = *(unsigned char *)(a1 + 88);
  char v8 = v15;
  uint64_t v16 = v9;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249768);
  sub_2473BD880();
  char v15 = v8;
  uint64_t v16 = v9;
  v14[7] = (v17 & 1) == 0;
  sub_2473BD890();
  swift_release();
  uint64_t v10 = *(void *)(a1 + 112);
  sub_2473A7AE0(a1, (uint64_t)v7);
  if (v10) {
    return sub_2473A8094((uint64_t)v7);
  }
  sub_24739FBE0((uint64_t)&v7[*(int *)(v5 + 40)], (uint64_t)v4, &qword_2692499A0);
  uint64_t v12 = sub_2473BD260();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v4, 1, v12) == 1)
  {
    sub_2473A8094((uint64_t)v7);
    return sub_24738EAF8((uint64_t)v4, &qword_2692499A0);
  }
  else
  {
    sub_2473BD240();
    sub_2473A8094((uint64_t)v7);
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v4, v12);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2473A5DC0()
{
  return swift_release();
}

uint64_t sub_2473A5E50@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
  sub_2473BD880();
  sub_247396A54();
  uint64_t result = sub_2473BD6D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

void sub_2473A5ED4(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2473BD520();
  sub_247396BB8();
  uint64_t v3 = (void *)sub_2473BDA90();
  id v4 = objc_msgSend(self, sel_bundleWithIdentifier_, v3);

  if (v4)
  {
    uint64_t v5 = sub_2473BD850();
    *(void *)a1 = v2;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
    *(void *)(a1 + 24) = v5;
  }
  else
  {
    __break(1u);
  }
}

void sub_2473A5FB4(uint64_t a1@<X8>)
{
}

uint64_t sub_2473A5FBC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249B30);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v8 = sub_2473BD520();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249B38);
  sub_2473A612C(a1, a2, &v8[*(int *)(v9 + 44)]);
  sub_2473BD9C0();
  sub_2473BD470();
  sub_24739FBE0((uint64_t)v8, a3, &qword_269249B30);
  uint64_t v10 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269249B40) + 36));
  long long v11 = v15[5];
  v10[4] = v15[4];
  v10[5] = v11;
  v10[6] = v15[6];
  long long v12 = v15[1];
  *uint64_t v10 = v15[0];
  v10[1] = v12;
  long long v13 = v15[3];
  v10[2] = v15[2];
  v10[3] = v13;
  return sub_24738EAF8((uint64_t)v8, &qword_269249B30);
}

void sub_2473A612C(uint64_t a1@<X2>, uint64_t a2@<X3>, char *a3@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  long long v45 = a3;
  uint64_t v3 = sub_2473BDA40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249848);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  long long v44 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v41 - v12;
  MEMORY[0x270FA5388](v11);
  long long v46 = (char *)&v41 - v14;
  LOBYTE(v47) = 0;
  sub_247396BB8();
  char v15 = (void *)sub_2473BDA90();
  id v16 = objc_msgSend(self, sel_bundleWithIdentifier_, v15);

  if (v16)
  {
    sub_2473BD850();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F67E88], v3);
    sub_2473BD840();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v46, v13, v7);
    uint64_t v47 = v42;
    uint64_t v48 = v43;
    sub_247396A54();
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_2473BD6D0();
    uint64_t v19 = v18;
    char v21 = v20 & 1;
    sub_2473BD670();
    uint64_t v22 = sub_2473BD6B0();
    uint64_t v24 = v23;
    char v26 = v25;
    uint64_t v43 = v7;
    swift_release();
    sub_247390310(v17, v19, v21);
    swift_bridgeObjectRelease();
    sub_2473BD810();
    uint64_t v27 = sub_2473BD6A0();
    uint64_t v29 = v28;
    char v31 = v30;
    uint64_t v42 = v32;
    swift_release();
    char v33 = v31 & 1;
    sub_247390310(v22, v24, v26 & 1);
    swift_bridgeObjectRelease();
    long long v34 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v35 = v43;
    long long v36 = v44;
    long long v37 = v46;
    v34(v44, v46, v43);
    uint64_t v38 = v45;
    v34(v45, v36, v35);
    long long v39 = &v38[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269249B48) + 48)];
    *(void *)long long v39 = v27;
    *((void *)v39 + 1) = v29;
    v39[16] = v33;
    *((void *)v39 + 3) = v42;
    sub_24739E4B4(v27, v29, v33);
    __int16 v40 = *(void (**)(char *, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    v40(v37, v35);
    sub_247390310(v27, v29, v33);
    swift_bridgeObjectRelease();
    v40(v36, v35);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473A655C@<X0>(uint64_t a1@<X8>)
{
  return sub_2473A5FBC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_2473A6568(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249B18);
  uint64_t v3 = (void *)sub_2473BDE60();
  unsigned __int8 v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t result = sub_24738AAD0(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = (void *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v4;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    _OWORD v3[2] = v11;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v12 = v8 + 2;
    unsigned __int8 v4 = *((unsigned char *)v8 - 8);
    uint64_t v13 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24738AAD0(v4);
    uint64_t v8 = v12;
    uint64_t v5 = v13;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2473A666C@<X0>(uint64_t a1@<X8>)
{
  return sub_2473A15B8(*(void *)(v1 + 16), a1);
}

uint64_t sub_2473A6674()
{
  return sub_2473A3C74(*(void *)(v0 + 16));
}

unint64_t sub_2473A6680()
{
  unint64_t result = qword_269249998;
  if (!qword_269249998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249998);
  }
  return result;
}

uint64_t sub_2473A66D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AccountAddView(id *a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccountAddView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  id v7 = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountAddView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AccountAddView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountAddView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountAddView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountAddView()
{
  return &type metadata for AccountAddView;
}

uint64_t getEnumTagSinglePayload for AccountAddView.AddType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountAddView.AddType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x2473A6B18);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountAddView.AddType()
{
  return &type metadata for AccountAddView.AddType;
}

uint64_t sub_2473A6B50()
{
  return swift_getOpaqueTypeConformance2();
}

char *sub_2473A6C9C(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unsigned int v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unsigned int v6 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    unsigned int v6 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    BOOL v7 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v7;
    int v8 = a2[6];
    *((void *)a1 + 5) = a2[5];
    *((void *)a1 + 6) = v8;
    uint64_t v9 = a2[8];
    *((void *)a1 + 7) = a2[7];
    *((void *)a1 + 8) = v9;
    BOOL v10 = a2[10];
    *((void *)a1 + 9) = a2[9];
    *((void *)a1 + 10) = v10;
    a1[88] = *((unsigned char *)a2 + 88);
    uint64_t v11 = a2[13];
    *((void *)a1 + 12) = a2[12];
    *((void *)a1 + 13) = v11;
    uint64_t v12 = *(int *)(a3 + 40);
    __dst = &a1[v12];
    uint64_t v18 = (char *)a2 + v12;
    *((void *)a1 + 14) = a2[14];
    uint64_t v13 = sub_2473BD260();
    uint64_t v17 = *(void *)(v13 - 8);
    uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    char v14 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v19(v18, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
      memcpy(__dst, v18, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(__dst, v18, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v13);
    }
    v6[*(int *)(a3 + 44)] = *((unsigned char *)a2 + *(int *)(a3 + 44));
  }
  return v6;
}

uint64_t sub_2473A6ED0(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  unsigned int v4 = (char *)a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_2473BD260();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    BOOL v7 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_2473A6FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v18 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v18;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  uint64_t v10 = *(int *)(a3 + 40);
  __dst = (void *)(a1 + v10);
  uint64_t v11 = (const void *)(a2 + v10);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v12 = sub_2473BD260();
  uint64_t v16 = *(void *)(v12 - 8);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  id v13 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v17(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
    memcpy(__dst, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(__dst, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v12);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_2473A71C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_2473BD260();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_2473A7454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v7 = *(int *)(a3 + 40);
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  uint64_t v10 = sub_2473BD260();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_2473A75BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_2473BD260();
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_2473A77E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2473A77FC);
}

uint64_t sub_2473A77FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2473A78B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2473A78C4);
}

uint64_t sub_2473A78C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692499A0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ShowAddButton()
{
  uint64_t result = qword_2692499A8;
  if (!qword_2692499A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2473A79BC()
{
  sub_2473A7A6C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2473A7A6C()
{
  if (!qword_2692499B8)
  {
    sub_2473BD260();
    unint64_t v0 = sub_2473BDCB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2692499B8);
    }
  }
}

uint64_t sub_2473A7AC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473A7AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShowAddButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473A7B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShowAddButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473A7BAC()
{
  return sub_2473A8020((uint64_t (*)(uint64_t))sub_2473A47D4);
}

double sub_2473A7BC4@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_2473A5050(*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

unint64_t sub_2473A7BCC()
{
  unint64_t result = qword_2692499D8;
  if (!qword_2692499D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692499D0);
    sub_2473A7D10(&qword_2692499E0, &qword_2692499E8, (void (*)(void))sub_2473A7C80, (void (*)(void))sub_2473A7CD4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692499D8);
  }
  return result;
}

unint64_t sub_2473A7C80()
{
  unint64_t result = qword_2692499F0;
  if (!qword_2692499F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692499F0);
  }
  return result;
}

uint64_t sub_2473A7CD4()
{
  return sub_2473A7D10(&qword_2692499F8, &qword_269249A00, (void (*)(void))sub_2473A7D98, (void (*)(void))sub_2473A7E14);
}

uint64_t sub_2473A7D10(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2473A7D98()
{
  unint64_t result = qword_269249A08;
  if (!qword_269249A08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249A10);
    sub_2473A7C80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249A08);
  }
  return result;
}

unint64_t sub_2473A7E14()
{
  unint64_t result = qword_269249A18;
  if (!qword_269249A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249A18);
  }
  return result;
}

void sub_2473A7E68(char *a1@<X8>)
{
  sub_2473A5714(*(void *)(v1 + 16), a1);
}

uint64_t sub_2473A7E70@<X0>(uint64_t a1@<X8>)
{
  return sub_2473A5E50(a1);
}

uint64_t sub_2473A7E7C()
{
  return sub_2473A8020(sub_2473A5BA4);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = (int *)(type metadata accessor for ShowAddButton() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[12];
  uint64_t v6 = sub_2473BD260();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2473A8008()
{
  return sub_2473A8020((uint64_t (*)(uint64_t))sub_2473A5DC0);
}

uint64_t sub_2473A8020(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ShowAddButton() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_2473A8094(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShowAddButton();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2473A80F0(uint64_t result)
{
  *(unsigned char *)(result + 146) = 1;
  return result;
}

uint64_t sub_2473A80FC(uint64_t result)
{
  *(unsigned char *)(result + 144) = 1;
  return result;
}

uint64_t sub_2473A8108(uint64_t result)
{
  *(unsigned char *)(result + 145) = 1;
  return result;
}

uint64_t sub_2473A8114(uint64_t result)
{
  *(unsigned char *)(result + 146) = 0;
  return result;
}

uint64_t sub_2473A811C(uint64_t result)
{
  *(unsigned char *)(result + 144) = 0;
  return result;
}

uint64_t sub_2473A8124(uint64_t result)
{
  *(unsigned char *)(result + 145) = 0;
  return result;
}

void sub_2473A812C(uint64_t a1@<X8>)
{
  sub_2473A3E3C(*(void *)(v1 + 16), a1);
}

uint64_t sub_2473A8138()
{
  return sub_2473A40E8((void **)(v0 + 16));
}

void **sub_2473A8140(void **a1)
{
  uint64_t v2 = *a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

uint64_t sub_2473A81BC@<X0>(char *a1@<X8>)
{
  return sub_2473A267C(*(void *)(v1 + 16), a1);
}

uint64_t sub_2473A81C4@<X0>(uint64_t a1@<X8>)
{
  return sub_2473A1B88(*(void *)(v1 + 16), a1);
}

unint64_t sub_2473A81CC()
{
  unint64_t result = qword_269249A80;
  if (!qword_269249A80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249A78);
    type metadata accessor for ShowAddButton();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692497F8);
    sub_2473A82FC(&qword_269249A88, (void (*)(uint64_t))type metadata accessor for ShowAddButton);
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249A80);
  }
  return result;
}

uint64_t sub_2473A82F4(uint64_t a1)
{
  return sub_2473A1E94(a1, v1 + 16);
}

uint64_t sub_2473A82FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2473A8344()
{
  return sub_2473A2270(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2473A834C()
{
  uint64_t v1 = sub_2473BD260();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2473A8438()
{
  sub_2473BD260();
  return sub_2473A2488(v0 + 16);
}

uint64_t objectdestroy_18Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2473A84F8()
{
  return sub_2473A31E0();
}

uint64_t sub_2473A8500(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_2473A041C(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2473A859C()
{
  unint64_t result = qword_269249B08;
  if (!qword_269249B08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249AD0);
    sub_2473A82FC(&qword_269249A88, (void (*)(uint64_t))type metadata accessor for ShowAddButton);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249B08);
  }
  return result;
}

uint64_t sub_2473A8640(uint64_t a1)
{
  return a1;
}

uint64_t sub_2473A8680()
{
  return sub_2473A324C(*(void ***)(v0 + 16));
}

void *initializeBufferWithCopyOfBuffer for BigImageAddButtonView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BigImageAddButtonView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for BigImageAddButtonView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for BigImageAddButtonView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for BigImageAddButtonView()
{
  return &type metadata for BigImageAddButtonView;
}

uint64_t destroy for AccountIconAddButtonView()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AccountIconAddButtonView(void *a1, void *a2)
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

void *assignWithCopy for AccountIconAddButtonView(void *a1, void *a2)
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

void *assignWithTake for AccountIconAddButtonView(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for AccountIconAddButtonView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AccountIconAddButtonView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for AccountIconAddButtonView()
{
  return &type metadata for AccountIconAddButtonView;
}

uint64_t sub_2473A8928()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473A8A9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473A8AB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473A8AD4()
{
  return sub_2473A8500(&qword_269249B50, &qword_269249B40, &qword_269249B58, &qword_269249B30);
}

uint64_t sub_2473A8B0C()
{
  return sub_2473A041C(&qword_269249B60, &qword_269249B68);
}

void sub_2473A8B4C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t GenericDetailsView.init(account:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t result = sub_2473BD4B0();
  *a2 = result;
  a2[1] = v5;
  a2[2] = a1;
  a2[3] = 0;
  return result;
}

uint64_t sub_2473A8C44()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2473A8C54@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GenericAccountsUIPlugin();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t GenericDetailsView.body.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249B70);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = v0[1];
  uint64_t v8 = v0[2];
  uint64_t v7 = v0[3];
  uint64_t v15 = *v0;
  uint64_t v5 = v15;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249B78);
  sub_2473A041C(&qword_269249B80, &qword_269249B78);
  sub_2473BD690();
  uint64_t v11 = v5;
  uint64_t v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249B88);
  sub_2473A041C(&qword_269249B90, &qword_269249B70);
  sub_2473A041C(&qword_269249B98, &qword_269249B88);
  sub_2473BD7B0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_2473A8E78(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BC8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  if (a1)
  {
    uint64_t v29 = (uint64_t)a3;
    uint64_t v30 = a4;
    uint64_t v17 = a2;
    uint64_t v18 = sub_24738D490();
    char v31 = a5;
    if (v18)
    {
      uint64_t v19 = 0;
      uint64_t v20 = 1;
    }
    else
    {
      type metadata accessor for AccountsUIModel(0);
      sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      uint64_t v18 = sub_2473BD4B0();
      uint64_t v20 = v18;
      uint64_t v19 = v21;
    }
    MEMORY[0x270FA5388](v18);
    *(&v28 - 4) = a1;
    *(&v28 - 3) = v17;
    uint64_t v22 = v30;
    *(&v28 - 2) = v29;
    *(&v28 - 1) = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249BD0);
    sub_2473A041C(&qword_269249BD8, &qword_269249BD0);
    sub_2473BD9A0();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v23(v14, v16, v10);
    uint64_t v24 = v31;
    uint64_t *v31 = v20;
    v24[1] = v19;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BE0);
    v23((char *)v24 + *(int *)(v25 + 48), v14, v10);
    sub_2473ACEA0((id)v20);
    char v26 = *(void (**)(char *, uint64_t))(v11 + 8);
    v26(v16, v10);
    v26(v14, v10);
    sub_2473ACEB0((id)v20);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    id v27 = a3;
    swift_retain();
    sub_2473BD490();
    __break(1u);
  }
}

void sub_2473A9178(uint64_t *a1@<X8>)
{
  sub_2473A8E78(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_2473A9184@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v143 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BE8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v144 = (uint64_t)&v128 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v155 = (uint64_t)&v128 - v12;
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BF0);
  uint64_t v150 = *(void *)(v149 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v149);
  uint64_t v136 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v157 = (char *)&v128 - v15;
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BF8);
  uint64_t v16 = MEMORY[0x270FA5388](v147);
  uint64_t v137 = (char *)&v128 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v146 = (char *)&v128 - v18;
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C00);
  uint64_t v156 = *(void *)(v158 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v158);
  uint64_t v154 = (char *)&v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v135 = (char *)&v128 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v134 = (char *)&v128 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  char v145 = (char *)&v128 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v159 = (char *)&v128 - v27;
  uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C08);
  uint64_t v142 = *(void *)(v153 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v153);
  v152 = (char *)&v128 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v160 = a1;
  uint64_t v161 = a2;
  uint64_t v148 = a2;
  uint64_t v162 = a3;
  uint64_t v163 = a4;
  v151 = (char *)&v128 - v30;
  sub_2473BD400();
  v139 = "h the account type";
  char v31 = (void *)sub_2473BDA90();
  id v138 = self;
  id v32 = objc_msgSend(v138, sel_bundleWithIdentifier_, v31);

  if (!v32)
  {
    __break(1u);
    goto LABEL_20;
  }
  char v33 = (void *)sub_2473BDA90();
  long long v34 = (void *)sub_2473BDA90();
  id v35 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, v34, 0);

  long long v36 = (void *)sub_2473BDAD0();
  char v140 = v37;

  uint64_t v38 = sub_2473BDBE0();
  swift_retain();
  id v39 = a1;
  id v40 = a3;
  uint64_t v41 = sub_2473BDBD0();
  uint64_t v42 = (void *)swift_allocObject();
  uint64_t v43 = a4;
  uint64_t v44 = MEMORY[0x263F8F500];
  v42[2] = v41;
  v42[3] = v44;
  uint64_t v45 = v148;
  v42[4] = a1;
  v42[5] = v45;
  v42[6] = v40;
  v42[7] = a4;
  id v132 = v39;
  id v46 = v40;
  swift_retain();
  uint64_t v133 = v38;
  uint64_t v47 = sub_2473BDBD0();
  uint64_t v48 = (void *)swift_allocObject();
  v48[2] = v47;
  v48[3] = v44;
  v48[4] = a1;
  v48[5] = v45;
  id v141 = v46;
  v48[6] = v46;
  v48[7] = a4;
  sub_2473BD940();
  id v164 = v36;
  unint64_t v165 = v140;
  unint64_t v49 = sub_247396A54();
  sub_2473BD9E0();
  char v140 = (char *)a1;
  if (a1)
  {
    BOOL v50 = sub_24738D490();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v52 = swift_allocObject();
    *(unsigned char *)(v52 + 16) = !v50;
    uint64_t v53 = v150;
    long long v54 = *(void (**)(char *, char *, uint64_t))(v150 + 16);
    uint64_t v55 = (uint64_t)v146;
    long long v56 = v157;
    uint64_t v57 = v149;
    uint64_t v131 = v150 + 16;
    uint64_t v130 = v54;
    v54(v146, v157, v149);
    long long v58 = (uint64_t *)(v55 + *(int *)(v147 + 36));
    uint64_t *v58 = KeyPath;
    v58[1] = (uint64_t)sub_24739FBC8;
    v58[2] = v52;
    char v60 = *(void (**)(char *, uint64_t))(v53 + 8);
    uint64_t v59 = v53 + 8;
    uint64_t v129 = v60;
    v60(v56, v57);
    sub_24738D5F8();
    *(void *)&v166[0] = v61;
    *((void *)&v166[0] + 1) = v62;
    unint64_t v63 = sub_2473ACF1C();
    long long v64 = v145;
    unint64_t v128 = v63;
    char v157 = (char *)v49;
    sub_2473BD750();
    swift_bridgeObjectRelease();
    sub_24738EAF8(v55, &qword_269249BF8);
    long long v65 = v64;
    uint64_t v66 = v158;
    uint64_t v146 = *(char **)(v156 + 32);
    ((void (*)(char *, char *, uint64_t))v146)(v159, v65, v158);
    id v67 = v141;
    *(void *)&v166[0] = v141;
    *((void *)&v166[0] + 1) = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
    sub_2473BD880();
    id v68 = v164;
    *(void *)&v166[0] = sub_2473BDAD0();
    *((void *)&v166[0] + 1) = v69;
    id v70 = objc_msgSend(v68, sel_objectForKeyedSubscript_, sub_2473BDEC0());
    swift_unknownObjectRelease();

    if (!v70)
    {
      memset(v166, 0, sizeof(v166));
      sub_24738EAF8((uint64_t)v166, &qword_26B12B5F0);
      goto LABEL_11;
    }
    sub_2473BDD10();
    swift_unknownObjectRelease();
    sub_24738EAF8((uint64_t)v166, &qword_26B12B5F0);
    *(void *)&v166[0] = v67;
    *((void *)&v166[0] + 1) = v43;
    sub_2473BD880();
    id v71 = v164;
    id v72 = objc_msgSend(v164, sel_accountType);

    if (v72)
    {
      id v73 = objc_msgSend(v72, sel_identifier);

      if (v73)
      {
        uint64_t v74 = sub_2473BDAD0();
        uint64_t v76 = v75;

        uint64_t v77 = sub_2473BDAD0();
        if (v76)
        {
          if (v74 == v77 && v76 == v78)
          {
            swift_bridgeObjectRelease_n();
LABEL_11:
            uint64_t v79 = 1;
            uint64_t v80 = v155;
LABEL_16:
            uint64_t v110 = v156;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v156 + 56))(v80, v79, 1, v66);
            uint64_t v111 = v142;
            uint64_t v112 = *(void (**)(char *, char *, uint64_t))(v142 + 16);
            v114 = v152;
            uint64_t v113 = v153;
            v112(v152, v151, v153);
            id v115 = *(void (**)(char *, char *, uint64_t))(v110 + 16);
            v115(v154, v159, v66);
            uint64_t v116 = v144;
            sub_2473ACFE0(v80, v144);
            uint64_t v117 = v143;
            v112(v143, v114, v113);
            uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C20);
            uint64_t v119 = v154;
            uint64_t v120 = v158;
            v115(&v117[*(int *)(v118 + 48)], v154, v158);
            sub_2473ACFE0(v116, (uint64_t)&v117[*(int *)(v118 + 64)]);
            sub_24738EAF8(v155, &qword_269249BE8);
            uint64_t v121 = *(void (**)(char *, uint64_t))(v110 + 8);
            v121(v159, v120);
            v122 = *(void (**)(char *, uint64_t))(v111 + 8);
            uint64_t v123 = v153;
            v122(v151, v153);
            sub_24738EAF8(v116, &qword_269249BE8);
            v121(v119, v120);
            return ((uint64_t (*)(char *, uint64_t))v122)(v152, v123);
          }
          char v125 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v125) {
            goto LABEL_11;
          }
          goto LABEL_14;
        }
      }
      else
      {
        sub_2473BDAD0();
      }
      swift_bridgeObjectRelease();
LABEL_14:
      uint64_t v150 = v59;
      long long v81 = (void *)sub_2473BDA90();
      id v82 = objc_msgSend(v138, sel_bundleWithIdentifier_, v81);

      if (v82)
      {
        id v83 = (void *)sub_2473BDA90();
        uint64_t v84 = (void *)sub_2473BDA90();
        id v85 = objc_msgSend(v82, sel_localizedStringForKey_value_table_, v83, v84, 0);

        char v145 = (char *)sub_2473BDAD0();
        v139 = v86;

        id v87 = v132;
        id v88 = v67;
        swift_retain();
        uint64_t v89 = sub_2473BDBD0();
        uint64_t v90 = (void *)swift_allocObject();
        v90[2] = v89;
        uint64_t v91 = MEMORY[0x263F8F500];
        id v92 = v140;
        v90[3] = MEMORY[0x263F8F500];
        v90[4] = v92;
        uint64_t v93 = v148;
        v90[5] = v148;
        v90[6] = v88;
        v90[7] = v43;
        id v94 = v87;
        id v95 = v88;
        swift_retain();
        uint64_t v96 = sub_2473BDBD0();
        uint64_t v97 = (void *)swift_allocObject();
        v97[2] = v96;
        v97[3] = v91;
        v97[4] = v92;
        v97[5] = v93;
        v97[6] = v95;
        v97[7] = v43;
        sub_2473BD940();
        id v164 = v145;
        unint64_t v165 = v139;
        unint64_t v98 = v136;
        sub_2473BD9E0();
        BOOL v99 = sub_24738D490();
        uint64_t v100 = swift_getKeyPath();
        uint64_t v101 = swift_allocObject();
        *(unsigned char *)(v101 + 16) = !v99;
        uint64_t v102 = (uint64_t)v137;
        uint64_t v103 = v149;
        v130(v137, v98, v149);
        unint64_t v104 = (uint64_t *)(v102 + *(int *)(v147 + 36));
        *unint64_t v104 = v100;
        v104[1] = (uint64_t)sub_2473A0574;
        v104[2] = v101;
        v129(v98, v103);
        sub_24738D5F8();
        *(void *)&v166[0] = v105;
        *((void *)&v166[0] + 1) = v106;
        id v107 = v135;
        sub_2473BD750();
        swift_bridgeObjectRelease();
        sub_24738EAF8(v102, &qword_269249BF8);
        id v108 = v134;
        uint64_t v66 = v158;
        uint64_t v109 = (void (*)(uint64_t, char *, uint64_t))v146;
        ((void (*)(char *, char *, uint64_t))v146)(v134, v107, v158);
        uint64_t v80 = v155;
        v109(v155, v108, v66);
        uint64_t v79 = 0;
        goto LABEL_16;
      }
      goto LABEL_21;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  type metadata accessor for AccountsUIModel(0);
  sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  id v126 = v132;
  id v127 = v141;
  swift_retain();
  uint64_t result = sub_2473BD490();
  __break(1u);
  return result;
}

uint64_t sub_2473AA0DC@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  id v2 = objc_msgSend(v7, sel_username);

  if (v2)
  {
    sub_2473BDAD0();
  }
  sub_247396A54();
  uint64_t result = sub_2473BD6D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

void sub_2473AA19C(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_2473BDA90();
  id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    uint64_t v4 = (void *)sub_2473BDA90();
    char v5 = (void *)sub_2473BDA90();
    id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_2473BDAD0();
    sub_247396A54();
    *(void *)a1 = sub_2473BD6D0();
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = v8 & 1;
    *(void *)(a1 + 24) = v9;
  }
  else
  {
    __break(1u);
  }
}

void sub_2473AA2E8(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  id v2 = objc_msgSend(v6, sel_accountDescription);

  if (v2)
  {
    uint64_t v3 = sub_2473BDAD0();
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  *a1 = v3;
  a1[1] = v5;
}

void sub_2473AA380()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  uint64_t v0 = (void *)sub_2473BDA90();
  objc_msgSend(v1, sel_setAccountDescription_, v0);
}

uint64_t sub_2473AA3FC@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  *(void *)&v9[0] = sub_2473BDAD0();
  *((void *)&v9[0] + 1) = v2;
  id v3 = objc_msgSend(v7, sel_objectForKeyedSubscript_, sub_2473BDEC0());
  swift_unknownObjectRelease();

  if (v3)
  {
    sub_2473BDD10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_247391614((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    uint64_t result = sub_24738EAF8((uint64_t)v10, &qword_26B12B5F0);
    goto LABEL_8;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_8:
    unint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
    goto LABEL_9;
  }
  unint64_t v5 = v7;
  unint64_t v6 = v8;
LABEL_9:
  *a1 = v5;
  a1[1] = v6;
  return result;
}

void sub_2473AA524()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  uint64_t v0 = (void *)sub_2473BDA90();
  objc_msgSend(v1, sel_setAccountProperty_forKey_, v0, *MEMORY[0x263EFAD80]);
}

uint64_t sub_2473AA5AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v26 = a5;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB0);
  MEMORY[0x270FA5388](v25);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2473BD600();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249988);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v23 - v17;
  sub_2473BD5E0();
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
  sub_2473BD420();
  sub_2473BD5F0();
  uint64_t v27 = v23;
  uint64_t v28 = v24;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  sub_2473BD420();
  uint64_t v19 = &v10[*(int *)(v25 + 48)];
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v20(v10, v18, v12);
  v20(v19, v16, v12);
  sub_2473BD5C0();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v16, v12);
  return ((uint64_t (*)(char *, uint64_t))v21)(v18, v12);
}

uint64_t sub_2473AA87C@<X0>(uint64_t a1@<X8>)
{
  return sub_2473AA5AC(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_2473AA888()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2473AA8A4(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249850);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)sub_2473BDA90();
  id v15 = objc_msgSend(self, sel_bundleWithIdentifier_, v14);

  if (v15)
  {
    uint64_t v16 = (void *)sub_2473BDA90();
    uint64_t v17 = (void *)sub_2473BDA90();
    id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, v17, 0);

    uint64_t v19 = sub_2473BDAD0();
    uint64_t v21 = v20;

    uint64_t v32 = v19;
    uint64_t v33 = v21;
    sub_2473BD3B0();
    uint64_t v22 = sub_2473BD3C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 0, 1, v22);
    uint64_t v23 = (void *)swift_allocObject();
    uint64_t v24 = v29;
    uint64_t v25 = v30;
    void v23[2] = a1;
    v23[3] = v24;
    v23[4] = a3;
    v23[5] = v25;
    sub_247396A54();
    id v26 = a1;
    id v27 = a3;
    swift_retain();
    sub_2473BD8D0();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v31, v13, v10);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473AAB60(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  v11[0] = a3;
  v11[1] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  objc_msgSend(v12, sel_reload);

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v6 = a1;
    uint64_t v7 = (void (*)(void *, void))sub_2473BD360();
    BOOL *v8 = !*v8;
    v7(v11, 0);

    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    id v10 = a3;
    swift_retain();
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

void sub_2473AACC0(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = a5;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v9 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = (void *)sub_2473BDA90();
  id v13 = objc_msgSend(self, sel_bundleWithIdentifier_, v12);

  if (v13)
  {
    uint64_t v14 = (void *)sub_2473BDA90();
    id v15 = (void *)sub_2473BDA90();
    id v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

    uint64_t v17 = sub_2473BDAD0();
    uint64_t v19 = v18;

    uint64_t v25 = v17;
    uint64_t v26 = v19;
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = a1;
    v20[3] = a2;
    v20[4] = a3;
    v20[5] = a4;
    sub_247396A54();
    id v21 = a1;
    id v22 = a3;
    swift_retain();
    sub_2473BD8E0();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v11, v23);
  }
  else
  {
    __break(1u);
  }
}

void sub_2473AAED4(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  long long aBlock = a3;
  uint64_t v21 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BB8);
  sub_2473BD880();
  unsigned int v8 = objc_msgSend(v26, sel_isDirty);

  if (v8)
  {
    if (a1)
    {
      id v9 = a1;
      id v10 = sub_2473864D0();

      sub_2473BD880();
      id v11 = v26;
      id v12 = (void *)swift_allocObject();
      v12[2] = a1;
      v12[3] = a2;
      v12[4] = a3;
      v12[5] = a4;
      uint64_t v24 = sub_2473ACDC0;
      uint64_t v25 = v12;
      long long aBlock = (void *)MEMORY[0x263EF8330];
      uint64_t v21 = 1107296256;
      id v22 = sub_2473A8B4C;
      uint64_t v23 = &block_descriptor_1;
      id v13 = _Block_copy(&aBlock);
      swift_retain();
      id v14 = v9;
      id v15 = a3;
      swift_release();
      objc_msgSend(v10, sel_saveAccount_withCompletionHandler_, v11, v13);
      _Block_release(v13);

      return;
    }
    goto LABEL_7;
  }
  if (!a1)
  {
LABEL_7:
    type metadata accessor for AccountsUIModel(0);
    sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    id v19 = a3;
    swift_retain();
    sub_2473BD490();
    __break(1u);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v16 = a1;
  uint64_t v17 = (void (*)(void **, void))sub_2473BD360();
  *uint64_t v18 = !*v18;
  v17(&aBlock, 0);

  swift_release();
  swift_release();
}

uint64_t sub_2473AB14C(int a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v40 = a4;
  uint64_t v41 = a6;
  uint64_t v42 = a3;
  int v39 = a1;
  uint64_t v8 = sub_2473BDA00();
  uint64_t v47 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v45 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_2473BDA30();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v43 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2473BD310();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12B530 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_26B12B518);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  id v16 = a2;
  id v17 = a2;
  uint64_t v18 = sub_2473BD2F0();
  os_log_type_t v19 = sub_2473BDC50();
  if (os_log_type_enabled(v18, v19))
  {
    long long v37 = a5;
    uint64_t v38 = v8;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v49 = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    if (v39)
    {
      unint64_t v22 = 0xEB00000000796C6CLL;
      uint64_t v23 = 0x7566736563637573;
    }
    else
    {
      *(void *)&long long aBlock = 0;
      *((void *)&aBlock + 1) = 0xE000000000000000;
      sub_2473BDD80();
      swift_bridgeObjectRelease();
      strcpy((char *)&aBlock, "with an error ");
      HIBYTE(aBlock) = -18;
      uint64_t v48 = a2;
      id v24 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692498A8);
      sub_2473BDAE0();
      sub_2473BDB20();
      swift_bridgeObjectRelease();
      unint64_t v22 = *((void *)&aBlock + 1);
      uint64_t v23 = aBlock;
    }
    *(void *)&long long aBlock = sub_2473ABE34(v23, v22, &v49);
    sub_2473BDCC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247380000, v18, v19, "save completed %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C553A30](v21, -1, -1);
    MEMORY[0x24C553A30](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v8 = v38;
    a5 = v37;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  sub_2473911B4(0, &qword_26B12B5C8);
  uint64_t v25 = (void *)sub_2473BDC60();
  id v26 = (void *)swift_allocObject();
  uint64_t v28 = v41;
  id v27 = v42;
  uint64_t v29 = v40;
  long long v26[2] = v42;
  id v26[3] = v29;
  v26[4] = a5;
  v26[5] = v28;
  uint64_t v53 = sub_2473ACDE8;
  long long v54 = v26;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  long long v51 = sub_24739C898;
  uint64_t v52 = &block_descriptor_17;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_retain();
  id v31 = v27;
  id v32 = a5;
  swift_release();
  uint64_t v33 = v43;
  sub_2473BDA20();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_2473ACDF4(&qword_26B12B5A0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5A8);
  sub_2473A041C((unint64_t *)&qword_26B12B5B0, &qword_26B12B5A8);
  uint64_t v34 = v45;
  sub_2473BDD20();
  MEMORY[0x24C553200](0, v33, v34, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v33, v46);
}

uint64_t sub_2473AB760(void *a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v4 = a1;
    unint64_t v5 = (void (*)(uint64_t *, void))sub_2473BD360();
    *id v6 = !*v6;
    v5(&v10, 0);

    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    id v9 = a3;
    swift_retain();
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473AB888()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249B70);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = v0[1];
  uint64_t v8 = v0[2];
  uint64_t v7 = v0[3];
  uint64_t v15 = *v0;
  uint64_t v5 = v15;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249B78);
  sub_2473A041C(&qword_269249B80, &qword_269249B78);
  sub_2473BD690();
  uint64_t v11 = v5;
  uint64_t v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249B88);
  sub_2473A041C(&qword_269249B90, &qword_269249B70);
  sub_2473A041C(&qword_269249B98, &qword_269249B88);
  sub_2473BD7B0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t type metadata accessor for GenericAccountsUIPlugin()
{
  return self;
}

uint64_t destroy for GenericDetailsView(id *a1)
{
  return swift_release();
}

void *initializeWithCopy for GenericDetailsView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  id v7 = v3;
  id v8 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GenericDetailsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  id v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GenericDetailsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GenericDetailsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GenericDetailsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenericDetailsView()
{
  return &type metadata for GenericDetailsView;
}

uint64_t sub_2473ABC90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473ABD58(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2473ABD94(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2473ABDBC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2473ABE34(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2473BDCC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2473ABE34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2473ABF08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24738E67C((uint64_t)v12, *a3);
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
      sub_24738E67C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2473ABF08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2473BDCD0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2473AC0C4(a5, a6);
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
  uint64_t v8 = sub_2473BDDC0();
  if (!v8)
  {
    sub_2473BDE20();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2473BDE70();
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

uint64_t sub_2473AC0C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2473AC15C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2473AC33C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2473AC33C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2473AC15C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2473AC2D4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2473BDD90();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2473BDE20();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2473BDB30();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2473BDE70();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2473BDE20();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2473AC2D4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BC0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2473AC33C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249BC0);
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
  uint64_t result = sub_2473BDE70();
  __break(1u);
  return result;
}

unsigned char **sub_2473AC48C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

id sub_2473AC49C(void *a1)
{
  objc_msgSend(a1, sel_copy);
  sub_2473BDD10();
  swift_unknownObjectRelease();
  sub_2473911B4(0, (unint64_t *)&qword_26B12B3F8);
  swift_dynamicCast();
  type metadata accessor for AccountsUIModel(0);
  sub_2473ACDF4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t v2 = (void *)sub_2473BD4B0();
  v33[2] = v31;
  v33[3] = 0;
  sub_2473ACB78();
  id v29 = v2;
  id v28 = v31;
  unint64_t v3 = (void *)sub_2473BD910();
  strcpy((char *)v33, "DETAILS_ROW_");
  BYTE5(v33[1]) = 0;
  HIWORD(v33[1]) = -5120;
  id v4 = objc_msgSend(a1, sel_identifier);
  if (!v4)
  {
    sub_2473911B4(0, &qword_2692495C0);
    id v4 = (id)sub_2473BDCA0();
  }
  id v5 = objc_msgSend(v4, sel_description);
  sub_2473BDAD0();

  sub_2473BDB20();
  swift_bridgeObjectRelease();
  uint64_t v6 = v33[0];
  uint64_t v7 = v33[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B5E8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2473BE650;
  strcpy((char *)v33, "ONLY_SECTION_");
  HIWORD(v33[1]) = -4864;
  swift_retain();
  id v9 = objc_msgSend(a1, sel_identifier);
  id v30 = a1;
  if (!v9)
  {
    sub_2473911B4(0, &qword_2692495C0);
    id v9 = (id)sub_2473BDCA0();
  }
  id v10 = objc_msgSend(v9, sel_description);
  sub_2473BDAD0();

  sub_2473BDB20();
  swift_bridgeObjectRelease();
  uint64_t v12 = v33[0];
  uint64_t v11 = v33[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249BA8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2473BE640;
  *(void *)(v13 + 32) = v6;
  *(void *)(v13 + 40) = v7;
  *(void *)(v13 + 48) = 0x10101010001;
  *(void *)(v13 + 56) = v3;
  *(void *)(v13 + 64) = 0;
  *(void *)(v13 + 72) = 0;
  *(unsigned char *)(v13 + 80) = 0;
  *(void *)(v13 + 88) = 0;
  *(void *)(v13 + 96) = 0xE000000000000000;
  *(unsigned char *)(v13 + 104) = 1;
  type metadata accessor for AccountUISettingSection();
  uint64_t v14 = (void *)swift_allocObject();
  v14[6] = 0;
  v14[7] = 0;
  v14[5] = 0;
  v14[2] = v12;
  v14[3] = v11;
  v14[4] = v13;
  swift_beginAccess();
  v14[5] = 0;
  v14[6] = 0;
  swift_bridgeObjectRetain();
  sub_2473ACBCC((id)0x10101010001, v3, 0, 0, 0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v14[7] = 0;
  swift_release();
  *(void *)(v8 + 32) = v14;
  sub_2473BDB90();
  uint64_t v32 = v8;
  id result = objc_msgSend(v30, sel_provisionedDataclasses);
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v17 = (uint64_t)objc_msgSend(result, sel_count);

    if (v17 < 1)
    {
      swift_bridgeObjectRelease();
      sub_2473ACCA8((void *)0x10101010001, v3, 0, 0, 0);

      swift_release();
LABEL_19:
      swift_bridgeObjectRelease();
      return (id)v32;
    }
    id result = objc_msgSend(v30, sel_accountType);
    if (result)
    {
      uint64_t v18 = result;
      id v19 = objc_msgSend(result, sel_identifier);

      if (v19)
      {
        uint64_t v20 = sub_2473BDAD0();
        uint64_t v22 = v21;

        uint64_t v23 = sub_2473BDAD0();
        if (v22)
        {
          if (v20 == v23 && v22 == v24)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
LABEL_23:
            sub_2473ACCA8((void *)0x10101010001, v3, 0, 0, 0);
            swift_release();
            swift_bridgeObjectRelease();

            return (id)v32;
          }
          char v27 = sub_2473BDEB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v27)
          {
            swift_bridgeObjectRelease();
            goto LABEL_23;
          }
          goto LABEL_16;
        }
      }
      else
      {
        sub_2473BDAD0();
      }
      swift_bridgeObjectRelease();
LABEL_16:
      uint64_t v25 = (void *)swift_allocObject();
      v25[6] = 0;
      v25[7] = 0;
      v25[5] = 0;
      v25[2] = 0xD000000000000011;
      v25[3] = 0x80000002473C4930;
      v25[4] = &unk_26FB83628;
      swift_beginAccess();
      v25[5] = 0;
      v25[6] = 0;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v25[7] = 0;
      uint64_t v26 = swift_release();
      MEMORY[0x24C5530F0](v26);
      if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2473BDBA0();
      }
      sub_2473BDBC0();
      sub_2473BDB90();
      swift_bridgeObjectRelease();
      swift_release();

      sub_2473ACCA8((void *)0x10101010001, v3, 0, 0, 0);
      goto LABEL_19;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_2473ACB78()
{
  unint64_t result = qword_269249BA0;
  if (!qword_269249BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249BA0);
  }
  return result;
}

id sub_2473ACBCC(id result, id a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 6:
      goto LABEL_6;
    case 1:
      unint64_t result = result;
      break;
    case 2:
    case 3:
      swift_retain();
      swift_retain();
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 4:
    case 5:
      swift_retain();
LABEL_6:
      unint64_t result = (id)swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_2473ACCA8(void *a1, id a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 6:
      goto LABEL_4;
    case 1:

      return;
    case 2:
    case 3:
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 4:
    case 5:
      swift_release();
LABEL_4:
      swift_release();
      break;
    default:
      return;
  }
}

void sub_2473ACD8C(uint64_t a1@<X8>)
{
  sub_2473AA8A4(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), a1);
}

void sub_2473ACD98(uint64_t a1@<X8>)
{
  sub_2473AACC0(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), a1);
}

void sub_2473ACDA8()
{
  sub_2473AAED4(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_2473ACDC0(int a1, void *a2)
{
  return sub_2473AB14C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2473ACDE8()
{
  return sub_2473AB760(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2473ACDF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm_1()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2473ACE88()
{
  return sub_2473AAB60(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_2473ACE94@<X0>(char *a1@<X8>)
{
  return sub_2473A9184(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), a1);
}

id sub_2473ACEA0(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_2473ACEB0(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_2473ACEC0@<X0>(uint64_t a1@<X8>)
{
  return sub_2473AA0DC(a1);
}

uint64_t sub_2473ACED0()
{
  return sub_2473AD064((uint64_t (*)(void, void, void, void, void, void))sub_2473AA2E8);
}

uint64_t sub_2473ACEEC(uint64_t a1)
{
  return sub_2473AD0E8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_2473AA380);
}

uint64_t sub_2473ACF0C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_2473ACF1C()
{
  unint64_t result = qword_269249C10;
  if (!qword_269249C10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249BF8);
    sub_2473A041C(&qword_269249C18, &qword_269249BF0);
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249C10);
  }
  return result;
}

uint64_t sub_2473ACFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473AD04C()
{
  return sub_2473AD064((uint64_t (*)(void, void, void, void, void, void))sub_2473AA3FC);
}

uint64_t sub_2473AD064(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2473AD0D0(uint64_t a1)
{
  return sub_2473AD0E8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_2473AA524);
}

uint64_t sub_2473AD0E8(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_2473AD100()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t AccountSettingsDetailModelView.init(detailModel:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountsUISettingsDetailModel(0);
  sub_2473B6DA4(&qword_269249690, (void (*)(uint64_t))type metadata accessor for AccountsUISettingsDetailModel);
  uint64_t result = sub_2473BD440();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AccountSettingsDetailModelView.body.getter()
{
  return sub_2473BD680();
}

uint64_t sub_2473AD278(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = a2;
  sub_2473BD370();

  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3C8);
  sub_2473A041C(&qword_269249DF0, &qword_26B12B3C8);
  sub_2473AD3CC();
  sub_2473B6DA4(&qword_269249DF8, (void (*)(uint64_t))type metadata accessor for AccountUISettingSection);
  return sub_2473BD970();
}

uint64_t sub_2473AD3BC()
{
  return sub_2473AD278(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_2473AD3CC()
{
  unint64_t result = qword_269249C38;
  if (!qword_269249C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249C38);
  }
  return result;
}

unint64_t sub_2473AD420()
{
  unint64_t result = qword_269249C40;
  if (!qword_269249C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249C40);
  }
  return result;
}

uint64_t sub_2473AD474()
{
  return sub_2473BD680();
}

uint64_t sub_2473AD54C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D70);
  MEMORY[0x270FA5388](v3);
  id v5 = (uint64_t *)((char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D98);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2473BD570();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D60);
  MEMORY[0x270FA5388](v30);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D50);
  MEMORY[0x270FA5388](v31);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D38);
  MEMORY[0x270FA5388](v33);
  uint64_t v32 = (uint64_t)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473BD560();
  sub_2473BD550();
  sub_2473BD830();
  sub_2473BD530();
  swift_release();
  sub_2473BD550();
  if (a1)
  {
    id v15 = a1;
    sub_247383A88();

    sub_2473BD540();
    swift_bridgeObjectRelease();
    sub_2473BD550();
    sub_2473BD590();
    uint64_t v16 = sub_2473BD6C0();
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    char v22 = v21 & 1;
    sub_2473BD5A0();
    uint64_t v23 = sub_2473BD5B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v8, 0, 1, v23);
    uint64_t KeyPath = swift_getKeyPath();
    sub_24739FBE0((uint64_t)v8, (uint64_t)v5 + *(int *)(v3 + 28), &qword_269249D98);
    *id v5 = KeyPath;
    sub_24739FBE0((uint64_t)v5, (uint64_t)&v11[*(int *)(v30 + 36)], &qword_269249D70);
    *(void *)uint64_t v11 = v16;
    *((void *)v11 + 1) = v18;
    v11[16] = v22;
    *((void *)v11 + 3) = v20;
    sub_24739E4B4(v16, v18, v22);
    swift_bridgeObjectRetain();
    sub_24738EAF8((uint64_t)v5, &qword_269249D70);
    sub_24738EAF8((uint64_t)v8, &qword_269249D98);
    sub_247390310(v16, v18, v22);
    swift_bridgeObjectRelease();
    LODWORD(KeyPath) = sub_2473BD640();
    sub_24739FBE0((uint64_t)v11, (uint64_t)v13, &qword_269249D60);
    *(_DWORD *)&v13[*(int *)(v31 + 36)] = KeyPath;
    sub_24738EAF8((uint64_t)v11, &qword_269249D60);
    uint64_t v25 = sub_2473BD660();
    uint64_t v26 = swift_getKeyPath();
    uint64_t v27 = v32;
    sub_24739FBE0((uint64_t)v13, v32, &qword_269249D50);
    id v28 = (uint64_t *)(v27 + *(int *)(v33 + 36));
    uint64_t *v28 = v26;
    v28[1] = v25;
    sub_24738EAF8((uint64_t)v13, &qword_269249D50);
    return sub_247391120(v27, v34, &qword_269249D38);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473ADA2C()
{
  return sub_2473BD9A0();
}

void sub_2473ADA98(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C28);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v19 - v11;
  if (a1)
  {
    if (sub_24738D490())
    {
      uint64_t v13 = 0;
      uint64_t v14 = 1;
    }
    else
    {
      type metadata accessor for AccountsUIModel(0);
      sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      uint64_t v14 = sub_2473BD4B0();
      uint64_t v13 = v15;
    }
    v19[1] = a2;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3C8);
    sub_2473A041C(&qword_269249DF0, &qword_26B12B3C8);
    sub_2473AD3CC();
    sub_2473B6DA4(&qword_269249DF8, (void (*)(uint64_t))type metadata accessor for AccountUISettingSection);
    sub_2473BD970();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v16(v10, v12, v6);
    *a3 = v14;
    a3[1] = v13;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F98);
    v16((char *)a3 + *(int *)(v17 + 48), v10, v6);
    sub_2473ACEA0((id)v14);
    uint64_t v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v12, v6);
    v18(v10, v6);
    sub_2473ACEB0((id)v14);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    sub_2473BD490();
    __break(1u);
  }
}

uint64_t sub_2473ADDA8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountUISettingSection();
  sub_2473B6DA4(&qword_269249D30, (void (*)(uint64_t))type metadata accessor for AccountUISettingSection);
  swift_retain();
  uint64_t result = sub_2473BD440();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2473ADE30@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t result = sub_2473BD4B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2473ADEA0()
{
  return sub_2473BD680();
}

uint64_t sub_2473ADF6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v4 = a1;
    sub_2473BD370();

    swift_release();
    swift_release();
    if (v10)
    {
      uint64_t v5 = sub_2473BD520();
      type metadata accessor for AccountsUIModel(0);
      sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      uint64_t result = sub_2473BD4B0();
      uint64_t v8 = 1;
      char v9 = 1;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      char v9 = 0;
      uint64_t result = 1;
    }
    *(void *)a2 = v5;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = result;
    *(void *)(a2 + 32) = v7;
    *(void *)(a2 + 40) = 0;
    *(unsigned char *)(a2 + 48) = v9;
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t DeleteButtonView.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t result = sub_2473BD4B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2473AE144@<X0>(uint64_t a1@<X8>)
{
  return sub_2473ADF6C(*v1, a1);
}

uint64_t DeleteButtonView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C48);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C50);
  uint64_t v9 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v1;
  sub_2473BD8C0();
  if (v12)
  {
    BOOL v13 = sub_24738D490();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v15 = swift_allocObject();
    *(unsigned char *)(v15 + 16) = !v13;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
    uint64_t v16 = (uint64_t *)&v8[*(int *)(v6 + 36)];
    *uint64_t v16 = KeyPath;
    v16[1] = (uint64_t)sub_2473B464C;
    v16[2] = v15;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_24738D5F8();
    uint64_t v22 = v17;
    uint64_t v23 = v18;
    sub_2473B4664();
    sub_247396A54();
    sub_2473BD750();
    swift_bridgeObjectRelease();
    sub_24738EAF8((uint64_t)v8, &qword_269249C48);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v21, v11, v20);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

void sub_2473AE484(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_2473BDA90();
  id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    uint64_t v4 = (void *)sub_2473BDA90();
    uint64_t v5 = (void *)sub_2473BDA90();
    id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_2473BDAD0();
    sub_247396A54();
    *(void *)a1 = sub_2473BD6D0();
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = v8 & 1;
    *(void *)(a1 + 24) = v9;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2473AE5D4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249CF0);
  uint64_t v3 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249CF8);
  MEMORY[0x270FA5388](v21);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D00);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_beginAccess();
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    uint64_t v20 = (uint64_t)&v20;
    MEMORY[0x270FA5388](v12);
    uint64_t v26 = v14;
    uint64_t v27 = v13;
    sub_247396A54();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_2473BD6D0();
    uint64_t v27 = v15;
    char v28 = v16 & 1;
    uint64_t v29 = v17;
    swift_beginAccess();
    if (*(void *)(a1 + 56))
    {
      uint64_t v24 = *(void *)(a1 + 56);
      char v25 = 0;
      swift_retain();
    }
    else
    {
      uint64_t v24 = 0;
      char v25 = 1;
    }
    sub_2473BD5D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249D08);
    sub_2473B4FBC();
    sub_2473B5010(&qword_269249D18, &qword_269249D08);
    sub_2473BD990();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
    swift_storeEnumTagMultiPayload();
    sub_2473B5078(&qword_269249D20, &qword_269249D00);
    sub_2473B5078(&qword_269249D28, &qword_269249CF0);
    sub_2473BD5D0();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    MEMORY[0x270FA5388](v12);
    swift_beginAccess();
    if (*(void *)(a1 + 56))
    {
      uint64_t v30 = *(void *)(a1 + 56);
      char v31 = 0;
      swift_retain();
    }
    else
    {
      uint64_t v30 = 0;
      char v31 = 1;
    }
    sub_2473BD5D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249D08);
    sub_2473B4FBC();
    sub_2473B5010(&qword_269249D18, &qword_269249D08);
    sub_2473BD9B0();
    uint64_t v19 = v23;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v7, v5, v23);
    swift_storeEnumTagMultiPayload();
    sub_2473B5078(&qword_269249D20, &qword_269249D00);
    sub_2473B5078(&qword_269249D28, &qword_269249CF0);
    sub_2473BD5D0();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v19);
  }
}

__n128 sub_2473AEB7C@<Q0>(__n128 *a1@<X8>)
{
  type metadata accessor for AccountsUIModel(0);
  sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  swift_retain();
  uint64_t v2 = sub_2473BD4B0();
  unint64_t v4 = v3;
  type metadata accessor for AccountUISettingSection();
  sub_2473B6DA4(&qword_269249D30, (void (*)(uint64_t))type metadata accessor for AccountUISettingSection);
  uint64_t v5 = sub_2473BD440();
  unint64_t v7 = v6;
  sub_2473BD870();
  __n128 result = v9;
  a1->n128_u64[0] = v2;
  a1->n128_u64[1] = v4;
  a1[1].n128_u64[0] = v5;
  a1[1].n128_u64[1] = v7;
  a1[2] = v9;
  a1[3].n128_u64[0] = v10;
  return result;
}

uint64_t sub_2473AECA4@<X0>(uint64_t a1@<X8>)
{
  return sub_2473AE5D4(*(void *)(v1 + 8), a1);
}

void sub_2473AECAC(long long *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v182 = a2;
  uint64_t v201 = a3;
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F20);
  MEMORY[0x270FA5388](v183);
  uint64_t v186 = (uint64_t *)((char *)&v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v197 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249EF0);
  MEMORY[0x270FA5388](v197);
  v188 = (char *)&v156 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F10);
  uint64_t v171 = *(void *)(v172 - 8);
  MEMORY[0x270FA5388](v172);
  uint64_t v169 = (char *)&v156 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249EF8);
  MEMORY[0x270FA5388](v181);
  uint64_t v170 = (char *)&v156 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F28);
  uint64_t v176 = *(void *)(v187 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v187);
  uint64_t v168 = (char *)&v156 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v175 = (char *)&v156 - v10;
  uint64_t v11 = sub_2473BD230();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F30);
  MEMORY[0x270FA5388](v162);
  uint64_t v161 = (char *)&v156 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BF0);
  uint64_t v165 = *(void *)(v166 - 8);
  MEMORY[0x270FA5388](v166);
  id v164 = (char *)&v156 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BF8);
  MEMORY[0x270FA5388](v184);
  uint64_t v15 = (char *)&v156 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C00);
  uint64_t v174 = *(void *)(v189 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v189);
  uint64_t v163 = (char *)&v156 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v173 = (char *)&v156 - v18;
  uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F38);
  MEMORY[0x270FA5388](v193);
  uint64_t v195 = (uint64_t)&v156 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F40);
  MEMORY[0x270FA5388](v179);
  uint64_t v21 = (char *)&v156 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249EE0);
  MEMORY[0x270FA5388](v194);
  uint64_t v185 = (char *)&v156 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249ED0);
  MEMORY[0x270FA5388](v200);
  v196 = (uint64_t *)((char *)&v156 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C08);
  uint64_t v159 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v156 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F48);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v156 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249EB0);
  MEMORY[0x270FA5388](v178);
  uint64_t v167 = (char *)&v156 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F50);
  MEMORY[0x270FA5388](v177);
  uint64_t v32 = (uint64_t *)((char *)&v156 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249E98);
  MEMORY[0x270FA5388](v192);
  uint64_t v180 = (char *)&v156 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F58);
  MEMORY[0x270FA5388](v198);
  uint64_t v199 = (uint64_t)&v156 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v191 = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_269249F60);
  MEMORY[0x270FA5388](v191);
  uint64_t v36 = (char *)&v156 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249E68);
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)&v156 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v41 = a1[3];
  long long v214 = a1[2];
  *(_OWORD *)uint64_t v215 = v41;
  *(_OWORD *)&v215[9] = *(long long *)((char *)a1 + 57);
  unsigned long long v42 = a1[1];
  long long v212 = *a1;
  unsigned long long v213 = v42;
  uint64_t v43 = (void *)*((void *)&v42 + 1);
  long long v44 = v214;
  switch((char)v41)
  {
    case 1:
      id v158 = (id)*((void *)&v213 + 1);
      uint64_t v190 = v38;
      uint64_t v105 = (void *)v42;
      uint64_t v160 = *((void *)&v214 + 1);
      uint64_t v156 = v214;
      uint64_t v106 = (uint64_t)v40;
      sub_2473ACBCC((id)v42, *((id *)&v42 + 1), v214, *((uint64_t *)&v214 + 1), 1);
      type metadata accessor for AccountsUIModel(0);
      sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      id v107 = v105;
      id v108 = (void *)sub_2473BD4B0();
      uint64_t v110 = v109;
      type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
      sub_2473B6DA4(&qword_269249F80, (void (*)(uint64_t))type metadata accessor for AccountUISetting.CustomDataclassTableConfig);
      uint64_t v111 = sub_2473BD440();
      uint64_t v113 = v112;
      void *v32 = v108;
      v32[1] = v110;
      v32[2] = v111;
      v32[3] = v112;
      swift_storeEnumTagMultiPayload();
      sub_2473B5DD8();
      sub_2473B5E2C();
      id v114 = v108;
      id v115 = v113;
      uint64_t v116 = (uint64_t)v180;
      sub_2473BD5D0();
      sub_24739FBE0(v116, (uint64_t)v36, &qword_269249E98);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249E78);
      sub_2473B5CB8();
      sub_2473B5D9C();
      sub_2473BD5D0();
      sub_24738EAF8(v116, &qword_269249E98);
      sub_24739FBE0(v106, v199, &qword_269249E68);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      sub_2473ACCA8(v105, v158, v156, v160, 1);
      sub_24738EAF8(v106, &qword_269249E68);

      return;
    case 2:
      uint64_t v197 = (uint64_t)v40;
      uint64_t v190 = v38;
      uint64_t v157 = v42;
      uint64_t v160 = *((void *)&v214 + 1);
      if (v215[24])
      {
        unsigned long long v207 = v42;
        long long v208 = v214;
        uint64_t v142 = *((void *)&v214 + 1);
        uint64_t v156 = v214;
        sub_2473ACBCC((id)v42, *((id *)&v42 + 1), v214, *((uint64_t *)&v214 + 1), 2);
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F78);
        MEMORY[0x24C552EB0](&v202, v143);
        id v158 = v43;
        uint64_t v189 = *((void *)&v202 + 1);
        uint64_t v144 = v202;
        uint64_t v145 = *(void *)&v215[16];
        v196 = *(uint64_t **)&v215[8];
        swift_bridgeObjectRetain();
        LODWORD(v193) = sub_2473BD3F0();
        uint64_t v195 = v146;
        LODWORD(v194) = v147;
        type metadata accessor for AccountsUIModel(0);
        sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
        uint64_t v148 = sub_2473BD4B0();
        uint64_t v150 = v149;
        *(void *)&long long v211 = v144;
        id v151 = v158;
        *((void *)&v211 + 1) = v189;
        sub_2473BD870();
        unsigned long long v152 = v207;
        uint64_t v153 = v208;
        *(void *)uint64_t v29 = v148;
        *((void *)v29 + 1) = v150;
        *((void *)v29 + 2) = v157;
        *((void *)v29 + 3) = v151;
        *((void *)v29 + 4) = v156;
        *((void *)v29 + 5) = v142;
        *((_OWORD *)v29 + 3) = v152;
        *((void *)v29 + 8) = v153;
        v29[72] = v193 & 1;
        *((void *)v29 + 10) = v195;
        v29[88] = v194 & 1;
        *((void *)v29 + 12) = v196;
        *((void *)v29 + 13) = v145;
        v29[112] = 0;
        swift_storeEnumTagMultiPayload();
        sub_2473B5ECC();
        sub_2473A041C(&qword_269249EC0, &qword_269249C08);
        uint64_t v78 = (uint64_t)v167;
        sub_2473BD5D0();
      }
      else
      {
        v196 = &v156;
        uint64_t v76 = MEMORY[0x270FA5388](v38);
        MEMORY[0x270FA5388](v76);
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_2473BD400();
        uint64_t v77 = v159;
        (*(void (**)(char *, char *, uint64_t))(v159 + 16))(v29, v26, v24);
        swift_storeEnumTagMultiPayload();
        sub_2473B5ECC();
        sub_2473A041C(&qword_269249EC0, &qword_269249C08);
        uint64_t v78 = (uint64_t)v167;
        sub_2473BD5D0();
        (*(void (**)(char *, uint64_t))(v77 + 8))(v26, v24);
      }
      sub_24739FBE0(v78, (uint64_t)v32, &qword_269249EB0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5DD8();
      sub_2473B5E2C();
      uint64_t v154 = (uint64_t)v180;
      sub_2473BD5D0();
      sub_24739FBE0(v154, (uint64_t)v36, &qword_269249E98);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249E78);
      sub_2473B5CB8();
      sub_2473B5D9C();
      uint64_t v155 = v197;
      sub_2473BD5D0();
      sub_24738EAF8(v154, &qword_269249E98);
      sub_24739FBE0(v155, v199, &qword_269249E68);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      sub_24738EAF8(v155, &qword_269249E68);
      sub_24738EAF8(v78, &qword_269249EB0);
      return;
    case 3:
      unsigned long long v207 = __PAIR128__(*((unint64_t *)&v42 + 1), v213);
      long long v208 = v214;
      uint64_t v190 = v38;
      uint64_t v79 = v42;
      uint64_t v160 = *((void *)&v214 + 1);
      uint64_t v80 = v214;
      sub_2473ACBCC((id)v42, *((id *)&v42 + 1), v214, *((uint64_t *)&v214 + 1), 3);
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F78);
      MEMORY[0x24C552EB0](&v202, v81);
      long long v82 = v202;
      id v158 = v43;
      id v191 = *(id *)&v215[8];
      uint64_t v192 = *(void *)&v215[16];
      swift_bridgeObjectRetain();
      char v83 = sub_2473BD3F0();
      uint64_t v85 = v84;
      LODWORD(v187) = v86;
      type metadata accessor for AccountsUIModel(0);
      sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      id v87 = (void *)sub_2473BD4B0();
      uint64_t v89 = v88;
      long long v211 = v82;
      sub_2473BD870();
      unsigned long long v90 = v207;
      uint64_t v186 = (void *)*((void *)&v207 + 1);
      uint64_t v91 = (char *)v208;
      *(void *)uint64_t v21 = v87;
      *((void *)v21 + 1) = v89;
      id v92 = v158;
      *((void *)v21 + 2) = v79;
      *((void *)v21 + 3) = v92;
      *((void *)v21 + 4) = v80;
      *((void *)v21 + 5) = v160;
      *((_OWORD *)v21 + 3) = v90;
      *((void *)v21 + 8) = v91;
      v188 = v91;
      v21[72] = v83 & 1;
      *((void *)v21 + 10) = v85;
      v21[88] = v187 & 1;
      uint64_t v93 = v192;
      *((void *)v21 + 12) = v191;
      *((void *)v21 + 13) = v93;
      v21[112] = 1;
      swift_storeEnumTagMultiPayload();
      unint64_t v187 = sub_2473B5ECC();
      unint64_t v94 = sub_2473ACF1C();
      unint64_t v95 = sub_247396A54();
      id v191 = v87;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      *(void *)&unsigned long long v207 = v184;
      *((void *)&v207 + 1) = MEMORY[0x263F8D310];
      *(void *)&long long v208 = v94;
      *((void *)&v208 + 1) = v95;
      swift_getOpaqueTypeConformance2();
      uint64_t v96 = (uint64_t)v185;
      sub_2473BD5D0();
      sub_24739FBE0(v96, v195, &qword_269249EE0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5FE4();
      sub_2473B60B0();
      uint64_t v97 = (uint64_t)v196;
      sub_2473BD5D0();
      sub_24738EAF8(v96, &qword_269249EE0);
      sub_24739FBE0(v97, v199, &qword_269249ED0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      sub_24738EAF8(v97, &qword_269249ED0);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();

      return;
    case 4:
      uint64_t v190 = v38;
      long long v202 = *(_OWORD *)&v215[8];
      long long v211 = *(_OWORD *)&v215[8];
      unsigned long long v207 = v42;
      *(void *)&long long v208 = v214;
      uint64_t v54 = v42;
      sub_2473ACBCC((id)v42, *((id *)&v42 + 1), v214, *((uint64_t *)&v214 + 1), 4);
      sub_2473B62CC((uint64_t)&v202);
      uint64_t v157 = v54;
      swift_retain();
      swift_retain();
      sub_2473BD220();
      sub_2473B6308();
      sub_2473BD1B0();
      unint64_t v55 = sub_247396A54();
      sub_2473A041C(&qword_269249F70, &qword_269249F30);
      uint64_t v56 = MEMORY[0x263F8D310];
      uint64_t v57 = v164;
      sub_2473BD9F0();
      uint64_t v58 = *v182;
      id v158 = v43;
      if (!v58) {
        goto LABEL_16;
      }
      BOOL v59 = sub_24738D490();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v61 = swift_allocObject();
      *(unsigned char *)(v61 + 16) = !v59;
      uint64_t v62 = v165;
      uint64_t v63 = v166;
      (*(void (**)(char *, char *, uint64_t))(v165 + 16))(v15, v57, v166);
      long long v64 = v57;
      uint64_t v65 = v184;
      uint64_t v66 = (uint64_t *)&v15[*(int *)(v184 + 36)];
      *uint64_t v66 = KeyPath;
      v66[1] = (uint64_t)sub_2473B7028;
      v66[2] = v61;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
      sub_24738D5F8();
      *(void *)&unsigned long long v207 = v67;
      *((void *)&v207 + 1) = v68;
      unint64_t v69 = sub_2473ACF1C();
      id v70 = v163;
      sub_2473BD750();
      swift_bridgeObjectRelease();
      sub_24738EAF8((uint64_t)v15, &qword_269249BF8);
      uint64_t v71 = v174;
      id v72 = v173;
      uint64_t v73 = v189;
      (*(void (**)(char *, char *, uint64_t))(v174 + 32))(v173, v70, v189);
      (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v21, v72, v73);
      swift_storeEnumTagMultiPayload();
      sub_2473B5ECC();
      *(void *)&unsigned long long v207 = v65;
      *((void *)&v207 + 1) = v56;
      *(void *)&long long v208 = v69;
      *((void *)&v208 + 1) = v55;
      swift_getOpaqueTypeConformance2();
      uint64_t v74 = (uint64_t)v185;
      sub_2473BD5D0();
      sub_24739FBE0(v74, v195, &qword_269249EE0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5FE4();
      sub_2473B60B0();
      uint64_t v75 = (uint64_t)v196;
      sub_2473BD5D0();
      sub_24738EAF8(v74, &qword_269249EE0);
      sub_24739FBE0(v75, v199, &qword_269249ED0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      swift_release();
      swift_release();
      sub_24738EAF8(v75, &qword_269249ED0);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
      break;
    case 5:
      uint64_t v190 = v38;
      long long v202 = *(_OWORD *)&v215[8];
      unsigned long long v207 = *(_OWORD *)&v215[8];
      uint64_t v117 = v42;
      sub_2473ACBCC((id)v42, *((id *)&v42 + 1), v214, *((uint64_t *)&v214 + 1), 5);
      sub_2473B62CC((uint64_t)&v202);
      unint64_t v118 = sub_247396A54();
      swift_retain();
      swift_retain();
      uint64_t v119 = v169;
      uint64_t v157 = v117;
      sub_2473BD900();
      if (!*v182)
      {
LABEL_16:
        type metadata accessor for AccountsUIModel(0);
        sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
        sub_2473BD490();
        __break(1u);
        JUMPOUT(0x2473B0ED4);
      }
      BOOL v120 = sub_24738D490();
      uint64_t v121 = swift_getKeyPath();
      uint64_t v122 = swift_allocObject();
      *(unsigned char *)(v122 + 16) = !v120;
      uint64_t v123 = v171;
      uint64_t v124 = (uint64_t)v170;
      uint64_t v125 = v172;
      (*(void (**)(char *, char *, uint64_t))(v171 + 16))(v170, v119, v172);
      uint64_t v126 = v181;
      id v127 = (uint64_t *)(v124 + *(int *)(v181 + 36));
      *id v127 = v121;
      v127[1] = (uint64_t)sub_2473B7028;
      v127[2] = v122;
      (*(void (**)(char *, uint64_t))(v123 + 8))(v119, v125);
      sub_24738D5F8();
      *(void *)&unsigned long long v207 = v128;
      *((void *)&v207 + 1) = v129;
      unint64_t v130 = sub_2473B617C();
      uint64_t v131 = v168;
      sub_2473BD750();
      swift_bridgeObjectRelease();
      sub_24738EAF8(v124, &qword_269249EF8);
      uint64_t v132 = v176;
      uint64_t v133 = v175;
      unint64_t v134 = v187;
      (*(void (**)(char *, char *, unint64_t))(v176 + 32))(v175, v131, v187);
      (*(void (**)(void *, char *, unint64_t))(v132 + 16))(v186, v133, v134);
      swift_storeEnumTagMultiPayload();
      *(void *)&unsigned long long v207 = v126;
      *((void *)&v207 + 1) = MEMORY[0x263F8D310];
      *(void *)&long long v208 = v130;
      *((void *)&v208 + 1) = v118;
      swift_getOpaqueTypeConformance2();
      uint64_t v135 = (uint64_t)v188;
      sub_2473BD5D0();
      sub_24739FBE0(v135, v195, &qword_269249EF0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5FE4();
      sub_2473B60B0();
      uint64_t v136 = (uint64_t)v196;
      sub_2473BD5D0();
      sub_24738EAF8(v135, &qword_269249EF0);
      sub_24739FBE0(v136, v199, &qword_269249ED0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      swift_release();
      swift_release();
      sub_24738EAF8(v136, &qword_269249ED0);
      (*(void (**)(char *, unint64_t))(v132 + 8))(v133, v134);
      break;
    case 6:
      *uint64_t v186 = v42;
      uint64_t v137 = (void *)v42;
      swift_storeEnumTagMultiPayload();
      sub_2473ACBCC(v137, v43, v44, *((uint64_t *)&v44 + 1), 6);
      unint64_t v138 = sub_2473B617C();
      unint64_t v139 = sub_247396A54();
      swift_retain();
      *(void *)&unsigned long long v207 = v181;
      *((void *)&v207 + 1) = MEMORY[0x263F8D310];
      *(void *)&long long v208 = v138;
      *((void *)&v208 + 1) = v139;
      swift_getOpaqueTypeConformance2();
      uint64_t v140 = (uint64_t)v188;
      sub_2473BD5D0();
      sub_24739FBE0(v140, v195, &qword_269249EF0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5FE4();
      sub_2473B60B0();
      uint64_t v141 = (uint64_t)v196;
      sub_2473BD5D0();
      sub_24738EAF8(v140, &qword_269249EF0);
      sub_24739FBE0(v141, v199, &qword_269249ED0);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      sub_24738EAF8(v141, &qword_269249ED0);
      sub_2473ACCA8(v137, v43, v44, *((uint64_t *)&v44 + 1), 6);
      break;
    case 7:
      uint64_t v98 = (uint64_t)v40;
      type metadata accessor for AccountsUIModel(0);
      sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      BOOL v99 = (void *)sub_2473BD4B0();
      *(void *)&long long v202 = v99;
      *((void *)&v202 + 1) = v100;
      uint64_t v205 = 0;
      uint64_t v203 = 0;
      v204 = 0;
      char v206 = 1;
      sub_2473B5CF4();
      sub_2473B5D48();
      id v101 = v99;
      sub_2473BD5D0();
      uint64_t v102 = v209;
      char v103 = v210;
      long long v104 = v208;
      *(_OWORD *)uint64_t v36 = v207;
      *((_OWORD *)v36 + 1) = v104;
      *((void *)v36 + 4) = v102;
      v36[40] = v103;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249E78);
      sub_2473B5CB8();
      sub_2473B5D9C();
      sub_2473BD5D0();
      sub_24739FBE0(v98, v199, &qword_269249E68);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      sub_24738EAF8(v98, &qword_269249E68);

      break;
    default:
      unint64_t v45 = v213;
      uint64_t v160 = *((void *)&v214 + 1);
      uint64_t v46 = (uint64_t)v40;
      uint64_t v47 = v214;
      type metadata accessor for AccountsUIModel(0);
      sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
      swift_retain_n();
      uint64_t v48 = (void *)sub_2473BD4B0();
      *(void *)&long long v202 = v45 & 0x10101010101;
      *((void *)&v202 + 1) = v43;
      uint64_t v203 = 0;
      v204 = v48;
      uint64_t v205 = v49;
      char v206 = 0;
      sub_2473B5CF4();
      sub_2473B5D48();
      swift_retain();
      id v50 = v48;
      sub_2473BD5D0();
      uint64_t v51 = v209;
      char v52 = v210;
      long long v53 = v208;
      *(_OWORD *)uint64_t v36 = v207;
      *((_OWORD *)v36 + 1) = v53;
      *((void *)v36 + 4) = v51;
      v36[40] = v52;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269249E78);
      sub_2473B5CB8();
      sub_2473B5D9C();
      sub_2473BD5D0();
      sub_24739FBE0(v46, v199, &qword_269249E68);
      swift_storeEnumTagMultiPayload();
      sub_2473B5C7C();
      sub_2473B5F20();
      sub_2473BD5D0();
      sub_2473ACCA8((void *)v45, v43, v47, v160, 0);
      sub_24738EAF8(v46, &qword_269249E68);

      swift_release();
      break;
  }
}

uint64_t DetailsHeader.init(detailsConfig:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  char v4 = a1[1];
  char v5 = a1[2];
  char v6 = a1[3];
  char v7 = a1[4];
  char v8 = a1[5];
  uint64_t v9 = *((void *)a1 + 1);
  type metadata accessor for AccountsUIModel(0);
  sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t result = sub_2473BD4B0();
  *(unsigned char *)a2 = v3;
  *(unsigned char *)(a2 + 1) = v4;
  *(unsigned char *)(a2 + 2) = v5;
  *(unsigned char *)(a2 + 3) = v6;
  *(unsigned char *)(a2 + 4) = v7;
  *(unsigned char *)(a2 + 5) = v8;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = result;
  *(void *)(a2 + 32) = v11;
  return result;
}

uint64_t sub_2473B0FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F78);
  MEMORY[0x24C552EB0](&v7, v2);
  sub_247396A54();
  uint64_t result = sub_2473BD6D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_2473B1034@<X0>(uint64_t a1@<X8>)
{
  sub_247396A54();
  swift_bridgeObjectRetain();
  uint64_t result = sub_2473BD6D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2473B10A0()
{
  long long v1 = v0[1];
  long long v5 = *v0;
  long long v6 = v1;
  long long v7 = v0[2];
  uint64_t v8 = *((void *)v0 + 6);
  swift_beginAccess();
  uint64_t v2 = swift_allocObject();
  long long v3 = v6;
  *(_OWORD *)(v2 + 16) = v5;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = v7;
  *(void *)(v2 + 64) = v8;
  swift_bridgeObjectRetain();
  sub_2473B5C2C((void **)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249E40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249E48);
  sub_2473A041C(&qword_269249E50, &qword_269249E40);
  sub_2473B5F5C(&qword_269249E58, &qword_269249E48, (void (*)(void))sub_2473B5C7C, (void (*)(void))sub_2473B5F20);
  sub_2473B6240();
  return sub_2473BD970();
}

uint64_t sub_2473B1220@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v149 = a1;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249BF0);
  uint64_t v3 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  long long v5 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FC0);
  uint64_t v132 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  long long v7 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FC8);
  uint64_t v136 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  unint64_t v134 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FD0);
  uint64_t v131 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  unint64_t v138 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FD8);
  MEMORY[0x270FA5388](v135);
  uint64_t v140 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FE0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FE8);
  uint64_t v14 = MEMORY[0x270FA5388](v148);
  uint64_t v141 = (uint64_t)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v118 - v16;
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FF0);
  MEMORY[0x270FA5388](v146);
  uint64_t v147 = (uint64_t)&v118 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2473BD460();
  uint64_t v143 = *(void *)(v19 - 8);
  uint64_t v144 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v142 = (char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249FF8);
  uint64_t v119 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v118 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A000);
  uint64_t v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  uint64_t v25 = (char *)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A008);
  uint64_t v123 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v122 = (char *)&v118 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v127 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_26924A010);
  uint64_t v126 = *((void *)v127 - 1);
  MEMORY[0x270FA5388](v127);
  uint64_t v125 = (char *)&v118 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_26924A018);
  MEMORY[0x270FA5388](v129);
  uint64_t v128 = (char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A020);
  uint64_t v29 = MEMORY[0x270FA5388](v145);
  MEMORY[0x270FA5388](v29);
  char v32 = *(unsigned char *)(v2 + 112);
  uint64_t v33 = *(void *)(v2 + 104);
  uint64_t v150 = *(void *)(v2 + 96);
  uint64_t v151 = v33;
  if (v32)
  {
    uint64_t v140 = v31;
    uint64_t v141 = (uint64_t)&v118 - v30;
    sub_2473BDBE0();
    uint64_t v80 = v151;
    swift_bridgeObjectRetain();
    sub_2473B6890((void **)v2);
    uint64_t v81 = sub_2473BDBD0();
    uint64_t v82 = swift_allocObject();
    uint64_t v83 = MEMORY[0x263F8F500];
    *(void *)(v82 + 16) = v81;
    *(void *)(v82 + 24) = v83;
    long long v84 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v82 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v82 + 112) = v84;
    *(_OWORD *)(v82 + 128) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v82 + 144) = *(unsigned char *)(v2 + 112);
    long long v85 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v82 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v82 + 48) = v85;
    long long v86 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v82 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v82 + 80) = v86;
    sub_2473B6890((void **)v2);
    uint64_t v87 = sub_2473BDBD0();
    uint64_t v88 = swift_allocObject();
    *(void *)(v88 + 16) = v87;
    *(void *)(v88 + 24) = v83;
    long long v89 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v88 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v88 + 112) = v89;
    *(_OWORD *)(v88 + 128) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v88 + 144) = *(unsigned char *)(v2 + 112);
    long long v90 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v88 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v88 + 48) = v90;
    long long v91 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v88 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v88 + 80) = v91;
    sub_2473BD940();
    *(void *)&long long v154 = v150;
    *((void *)&v154 + 1) = v80;
    sub_247396A54();
    sub_2473BD410();
    long long v157 = *(_OWORD *)(v2 + 72);
    char v158 = *(unsigned char *)(v2 + 88);
    long long v152 = *(_OWORD *)(v2 + 72);
    char v153 = *(unsigned char *)(v2 + 88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924A028);
    sub_2473BD3E0();
    uint64_t v92 = sub_2473A041C(&qword_26924A050, &qword_269249FF8);
    sub_2473BD7A0();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v119 + 8))(v23, v21);
    long long v154 = v157;
    LOBYTE(v155) = v158;
    sub_2473BD3D0();
    uint64_t v93 = swift_allocObject();
    long long v94 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v93 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v93 + 96) = v94;
    *(_OWORD *)(v93 + 112) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v93 + 128) = *(unsigned char *)(v2 + 112);
    long long v95 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v93 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v93 + 32) = v95;
    long long v96 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v93 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v93 + 64) = v96;
    sub_2473B6890((void **)v2);
    *(void *)&long long v154 = v21;
    *((void *)&v154 + 1) = v92;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v98 = MEMORY[0x263F8D4F8];
    uint64_t v99 = MEMORY[0x263F8D510];
    uint64_t v100 = v122;
    uint64_t v101 = v121;
    sub_2473BD7C0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v25, v101);
    uint64_t v102 = swift_allocObject();
    long long v103 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v102 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v102 + 96) = v103;
    *(_OWORD *)(v102 + 112) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v102 + 128) = *(unsigned char *)(v2 + 112);
    long long v104 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v102 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v102 + 32) = v104;
    long long v105 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v102 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v102 + 64) = v105;
    sub_2473B6890((void **)v2);
    uint64_t v106 = v142;
    sub_2473BD450();
    *(void *)&long long v154 = v101;
    *((void *)&v154 + 1) = v98;
    uint64_t v155 = OpaqueTypeConformance2;
    uint64_t v156 = v99;
    swift_getOpaqueTypeConformance2();
    id v107 = v125;
    uint64_t v108 = v124;
    sub_2473BD7D0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v143 + 8))(v106, v144);
    (*(void (**)(char *, uint64_t))(v123 + 8))(v100, v108);
    if (*(void *)v2)
    {
      BOOL v109 = sub_24738D490();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v111 = swift_allocObject();
      *(unsigned char *)(v111 + 16) = !v109;
      uint64_t v112 = v126;
      uint64_t v113 = (uint64_t)v128;
      uint64_t v114 = (uint64_t)v127;
      (*(void (**)(char *, char *, char *))(v126 + 16))(v128, v107, v127);
      id v115 = (uint64_t *)(v113 + *((int *)v129 + 9));
      *id v115 = KeyPath;
      v115[1] = (uint64_t)sub_2473B7028;
      v115[2] = v111;
      (*(void (**)(char *, uint64_t))(v112 + 8))(v107, v114);
      *(void *)&long long v154 = 0;
      *((void *)&v154 + 1) = 0xE000000000000000;
      sub_2473BDD80();
      swift_bridgeObjectRelease();
      *(void *)&long long v154 = 0x6554657275636553;
      *((void *)&v154 + 1) = 0xEF646C6569467478;
      swift_bridgeObjectRetain();
      sub_2473BDB20();
      swift_bridgeObjectRelease();
      sub_2473B6C20();
      uint64_t v116 = (uint64_t)v140;
      sub_2473BD740();
      swift_bridgeObjectRelease();
      sub_24738EAF8(v113, &qword_26924A018);
      uint64_t v78 = &qword_26924A020;
      uint64_t v79 = v141;
      sub_247391120(v116, v141, &qword_26924A020);
      sub_24739FBE0(v79, v147, &qword_26924A020);
      goto LABEL_6;
    }
  }
  else
  {
    id v127 = v13;
    uint64_t v128 = (char *)v11;
    uint64_t v129 = v17;
    sub_2473BDBE0();
    sub_2473B6890((void **)v2);
    uint64_t v34 = v151;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_2473BDBD0();
    uint64_t v36 = swift_allocObject();
    uint64_t v37 = MEMORY[0x263F8F500];
    *(void *)(v36 + 16) = v35;
    *(void *)(v36 + 24) = v37;
    long long v38 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v36 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v36 + 112) = v38;
    *(_OWORD *)(v36 + 128) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v36 + 144) = *(unsigned char *)(v2 + 112);
    long long v39 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v36 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v36 + 48) = v39;
    long long v40 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v36 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v36 + 80) = v40;
    sub_2473B6890((void **)v2);
    uint64_t v41 = sub_2473BDBD0();
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = v41;
    *(void *)(v42 + 24) = v37;
    long long v43 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v42 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v42 + 112) = v43;
    *(_OWORD *)(v42 + 128) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v42 + 144) = *(unsigned char *)(v2 + 112);
    long long v44 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v42 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v42 + 48) = v44;
    long long v45 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v42 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v42 + 80) = v45;
    sub_2473BD940();
    *(void *)&long long v154 = v150;
    *((void *)&v154 + 1) = v34;
    sub_247396A54();
    sub_2473BD9E0();
    long long v157 = *(_OWORD *)(v2 + 72);
    char v158 = *(unsigned char *)(v2 + 88);
    long long v152 = *(_OWORD *)(v2 + 72);
    char v153 = *(unsigned char *)(v2 + 88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924A028);
    sub_2473BD3E0();
    uint64_t v46 = sub_2473A041C(&qword_269249C18, &qword_269249BF0);
    uint64_t v47 = v130;
    sub_2473BD7A0();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v47);
    long long v154 = v157;
    LOBYTE(v155) = v158;
    sub_2473BD3D0();
    uint64_t v48 = swift_allocObject();
    long long v49 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v48 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v48 + 96) = v49;
    *(_OWORD *)(v48 + 112) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v48 + 128) = *(unsigned char *)(v2 + 112);
    long long v50 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v48 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v48 + 32) = v50;
    long long v51 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v48 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v48 + 64) = v51;
    sub_2473B6890((void **)v2);
    *(void *)&long long v154 = v47;
    *((void *)&v154 + 1) = v46;
    uint64_t v52 = swift_getOpaqueTypeConformance2();
    uint64_t v53 = MEMORY[0x263F8D4F8];
    uint64_t v54 = MEMORY[0x263F8D510];
    unint64_t v55 = v134;
    uint64_t v56 = v133;
    sub_2473BD7C0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v132 + 8))(v7, v56);
    uint64_t v57 = swift_allocObject();
    long long v58 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v57 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v57 + 96) = v58;
    *(_OWORD *)(v57 + 112) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v57 + 128) = *(unsigned char *)(v2 + 112);
    long long v59 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v57 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v57 + 32) = v59;
    long long v60 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v57 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v57 + 64) = v60;
    sub_2473B6890((void **)v2);
    uint64_t v61 = v142;
    sub_2473BD450();
    *(void *)&long long v154 = v56;
    *((void *)&v154 + 1) = v53;
    uint64_t v155 = v52;
    uint64_t v156 = v54;
    swift_getOpaqueTypeConformance2();
    uint64_t v62 = v138;
    uint64_t v63 = v137;
    sub_2473BD7D0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v143 + 8))(v61, v144);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v55, v63);
    uint64_t v64 = swift_allocObject();
    long long v65 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v64 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v64 + 96) = v65;
    *(_OWORD *)(v64 + 112) = *(_OWORD *)(v2 + 96);
    *(unsigned char *)(v64 + 128) = *(unsigned char *)(v2 + 112);
    long long v66 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v64 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v64 + 32) = v66;
    long long v67 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v64 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v64 + 64) = v67;
    uint64_t v68 = v131;
    uint64_t v69 = (uint64_t)v140;
    uint64_t v70 = v139;
    (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v140, v62, v139);
    uint64_t v71 = (void *)(v69 + *(int *)(v135 + 36));
    *uint64_t v71 = 0;
    v71[1] = 0;
    v71[2] = sub_2473B7020;
    v71[3] = v64;
    sub_2473B6890((void **)v2);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v62, v70);
    if (*(void *)v2)
    {
      BOOL v72 = sub_24738D490();
      uint64_t v73 = swift_getKeyPath();
      uint64_t v74 = swift_allocObject();
      *(unsigned char *)(v74 + 16) = !v72;
      uint64_t v75 = (uint64_t)v127;
      sub_24739FBE0(v69, (uint64_t)v127, &qword_269249FD8);
      uint64_t v76 = (uint64_t *)(v75 + *((int *)v128 + 9));
      *uint64_t v76 = v73;
      v76[1] = (uint64_t)sub_2473B7028;
      v76[2] = v74;
      sub_24738EAF8(v69, &qword_269249FD8);
      *(void *)&long long v154 = 0x6C65694674786554;
      *((void *)&v154 + 1) = 0xE900000000000064;
      swift_bridgeObjectRetain();
      sub_2473BDB20();
      swift_bridgeObjectRelease();
      sub_2473B6974();
      uint64_t v77 = v141;
      sub_2473BD740();
      swift_bridgeObjectRelease();
      sub_24738EAF8(v75, &qword_269249FE0);
      uint64_t v78 = &qword_269249FE8;
      uint64_t v79 = (uint64_t)v129;
      sub_247391120(v77, (uint64_t)v129, &qword_269249FE8);
      sub_24739FBE0(v79, v147, &qword_269249FE8);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      sub_2473B6B74();
      sub_2473B6DEC();
      sub_2473BD5D0();
      return sub_24738EAF8(v79, v78);
    }
  }
  type metadata accessor for AccountsUIModel(0);
  sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t result = sub_2473BD490();
  __break(1u);
  return result;
}

uint64_t sub_2473B2670()
{
  return sub_2473BD930();
}

uint64_t sub_2473B26EC()
{
  return sub_2473BD930();
}

void *sub_2473B2768@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924A028);
  sub_2473BD3D0();
  if (LOBYTE(v5[0]) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
    uint64_t result = (void *)sub_2473BD880();
  }
  else
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249F78);
    uint64_t result = MEMORY[0x24C552EB0](v5, v3);
  }
  uint64_t v4 = v5[1];
  *a1 = v5[0];
  a1[1] = v4;
  return result;
}

uint64_t sub_2473B2824()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924A028);
  sub_2473BD3D0();
  swift_bridgeObjectRetain();
  if (v1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249810);
    return sub_2473BD890();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249F78);
    return sub_2473BD930();
  }
}

uint64_t sub_2473B28F8@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B1220(a1);
}

uint64_t DetailsHeader.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C60);
  MEMORY[0x270FA5388](v48);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_269249C68);
  uint64_t v45 = *(v5 - 1);
  MEMORY[0x270FA5388](v5);
  long long v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C70);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  long long v44 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v46 = (char *)&v40 - v11;
  uint64_t v55 = *((void *)v1 + 4);
  long long v12 = v1[1];
  long long v53 = *v1;
  long long v54 = v12;
  uint64_t v13 = (void *)*((void *)&v12 + 1);
  if (!*((void *)&v12 + 1)) {
    goto LABEL_9;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = v13;
  sub_2473BD370();

  swift_release();
  swift_release();
  id v15 = v49;
  if (v49)
  {
    id v16 = objc_msgSend(v49, sel_accountType);

    if (v16)
    {
      id v17 = objc_msgSend(v16, sel_identifier);

      if (v17)
      {
        sub_2473BDAD0();

        uint64_t v40 = (uint64_t)&v40;
        uint64_t v19 = MEMORY[0x270FA5388](v18);
        MEMORY[0x270FA5388](v19);
        uint64_t v41 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249CB0);
        uint64_t v42 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269249CB8);
        uint64_t v43 = a1;
        sub_2473A041C(&qword_269249CC0, &qword_269249CB0);
        sub_2473B48A4();
        sub_2473BD400();
        swift_bridgeObjectRelease();
        sub_2473B4728((uint64_t)&v53);
        type metadata accessor for AccountsUIModel(0);
        sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
        uint64_t v20 = (void *)sub_2473BD480();
        sub_2473B493C((uint64_t)&v53);
        swift_getKeyPath();
        sub_2473BD4A0();
        swift_release();

        uint64_t v21 = swift_allocObject();
        long long v22 = v54;
        *(_OWORD *)(v21 + 16) = v53;
        *(_OWORD *)(v21 + 32) = v22;
        *(void *)(v21 + 48) = v55;
        sub_2473B4728((uint64_t)&v53);
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249C78);
        uint64_t v38 = sub_2473A041C(&qword_269249C80, &qword_269249C68);
        unint64_t v39 = sub_2473B4778();
        uint64_t v24 = v44;
        uint64_t v25 = v7;
        uint64_t v26 = v41;
        sub_2473BD790();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v27 = v26;
        (*(void (**)(char *, void *))(v45 + 8))(v25, v26);
        uint64_t v29 = v46;
        uint64_t v28 = v47;
        uint64_t v30 = v42;
        (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v24, v42);
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v4, v29, v30);
        swift_storeEnumTagMultiPayload();
        id v49 = v27;
        uint64_t v50 = v23;
        uint64_t v51 = v38;
        unint64_t v52 = v39;
        swift_getOpaqueTypeConformance2();
        sub_2473BD5D0();
        return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v29, v30);
      }
      goto LABEL_6;
    }
    __break(1u);
LABEL_9:
    sub_2473B4728((uint64_t)&v53);
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
    return result;
  }
LABEL_6:
  sub_2473BD580();
  *(void *)uint64_t v4 = sub_2473BD6C0();
  *((void *)v4 + 1) = v32;
  v4[16] = v33 & 1;
  *((void *)v4 + 3) = v34;
  swift_storeEnumTagMultiPayload();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249C78);
  uint64_t v36 = sub_2473A041C(&qword_269249C80, &qword_269249C68);
  unint64_t v37 = sub_2473B4778();
  id v49 = v5;
  uint64_t v50 = v35;
  uint64_t v51 = v36;
  unint64_t v52 = v37;
  swift_getOpaqueTypeConformance2();
  return sub_2473BD5D0();
}

void sub_2473B3090(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692497F8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  long long v24 = *(_OWORD *)a1;
  uint64_t v25 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249DA0);
  sub_2473BD880();
  int v11 = v26;
  swift_release();
  if (v11 != 1)
  {
    uint64_t v23 = 1;
    goto LABEL_5;
  }
  long long v12 = (void *)sub_2473BDA90();
  id v13 = objc_msgSend(self, sel_bundleWithIdentifier_, v12);

  if (v13)
  {
    id v14 = (void *)sub_2473BDA90();
    id v15 = (void *)sub_2473BDA90();
    id v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

    uint64_t v17 = sub_2473BDAD0();
    uint64_t v19 = v18;

    *(void *)&long long v24 = v17;
    *((void *)&v24 + 1) = v19;
    uint64_t v20 = swift_allocObject();
    long long v21 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v20 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v20 + 32) = v21;
    *(void *)(v20 + 48) = *(void *)(a1 + 32);
    sub_2473B4728(a1);
    sub_247396A54();
    sub_2473BD8E0();
    long long v22 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v22(v10, v8, v4);
    v22(a2, v10, v4);
    uint64_t v23 = 0;
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v23, 1, v4);
    return;
  }
  __break(1u);
}

uint64_t sub_2473B335C(uint64_t a1)
{
  char v1 = *(void **)(a1 + 24);
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    uint64_t v3 = (void (*)(uint64_t *, void))sub_2473BD360();
    *uint64_t v4 = !*v4;
    v3(&v6, 0);

    swift_release();
    return swift_release();
  }
  else
  {
    sub_2473B4728(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
  }
  return result;
}

uint64_t sub_2473B346C()
{
  return sub_2473BD860();
}

uint64_t sub_2473B3584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  long long v46 = *(_OWORD *)a1;
  *(_OWORD *)uint64_t v42 = *(_OWORD *)a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249DA0);
  sub_2473BD880();
  swift_release();
  if (v44 != 1) {
    goto LABEL_6;
  }
  uint64_t v8 = *(void **)(a1 + 24);
  if (!v8) {
    goto LABEL_22;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = v8;
  sub_2473BD370();

  swift_release();
  swift_release();
  if (v42[0])
  {
    ACAccount.userFullName.getter();
    uint64_t v11 = v10;

    if (v11)
    {
      sub_247396A54();
      uint64_t v11 = sub_2473BD6D0();
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      uint64_t v41 = v16 & 1;
      goto LABEL_8;
    }
  }
  else
  {
LABEL_6:
    uint64_t v11 = 0;
  }
  uint64_t v13 = 0;
  uint64_t v41 = 0;
  uint64_t v15 = 0;
LABEL_8:
  sub_2473BD880();
  swift_release();
  uint64_t v40 = v15;
  uint64_t v36 = a2;
  if (v45 != 1)
  {
LABEL_13:
    uint64_t v19 = a3;
    uint64_t v20 = v13;
    uint64_t v21 = v11;
    goto LABEL_14;
  }
  uint64_t v17 = *(void **)(a1 + 24);
  if (!v17)
  {
LABEL_22:
    sub_2473B4728(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
    uint64_t result = sub_2473BD490();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v18 = v17;
  sub_2473BD370();

  swift_release();
  swift_release();
  if (!(void)v46) {
    goto LABEL_13;
  }
  uint64_t v19 = a3;
  uint64_t v20 = v13;
  uint64_t v21 = v11;
  id v22 = objc_msgSend((id)v46, sel_username, v36);

  if (v22)
  {
    sub_2473BDAD0();

    sub_247396A54();
    uint64_t v23 = sub_2473BD6D0();
    uint64_t v38 = v24;
    uint64_t v39 = v23;
    uint64_t v37 = v25;
    uint64_t v27 = v26 & 1;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v27 = 0;
  uint64_t v37 = 0;
LABEL_15:
  sub_2473BD880();
  swift_release();
  if (v44 & 1) != 0 || (sub_2473BD880(), swift_release(), (v45))
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 1;
  }
  else
  {
    sub_2473BD880();
    swift_release();
    if (v43 == 1)
    {
      _sSo13ACAccountTypeC18AccountsUISettingsE09localizedB4Name3forS2SSg_tFZ_0(v36, v19);
      sub_247396A54();
      uint64_t v28 = sub_2473BD6D0();
      uint64_t v29 = v33;
      uint64_t v31 = v34;
      uint64_t v30 = v35 & 1;
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
  }
  *a4 = v21;
  a4[1] = v20;
  a4[2] = v41;
  a4[3] = v40;
  a4[4] = v39;
  a4[5] = v38;
  a4[6] = v27;
  a4[7] = v37;
  a4[8] = v28;
  a4[9] = v29;
  a4[10] = v30;
  a4[11] = v31;
  sub_24739E4C4(v21, v20, v41, v40);
  sub_24739E4C4(v39, v38, v27, v37);
  sub_2473B54F0(v28, v29, v30, v31);
  sub_2473B5500(v28, v29, v30, v31);
  sub_24739E508(v39, v38, v27, v37);
  return sub_24739E508(v21, v20, v41, v40);
}

uint64_t sub_2473B39F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v50 = a3;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249848);
  uint64_t v44 = *(void *)(v49 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v49);
  uint64_t v42 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v43 = (char *)&v40 - v9;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249DE8);
  MEMORY[0x270FA5388](v47);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2473BDA40();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2473BDA60();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249DD8);
  uint64_t v19 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v48 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v52 = *(_OWORD *)a1;
  uint64_t v53 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249DA0);
  sub_2473BD880();
  int v21 = v56[0];
  swift_release();
  if (v21 != 1)
  {
    uint64_t v23 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a4, v23, 1, v51);
  }
  uint64_t v41 = a4;
  if (sub_2473BDAD0() == a2 && v22 == v50) {
    goto LABEL_4;
  }
  char v24 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_7;
  }
  if (sub_2473BDAD0() == a2 && v27 == v50)
  {
LABEL_4:
    swift_bridgeObjectRelease();
LABEL_7:
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v14, *MEMORY[0x263F67E88], v46);
    sub_2473BDA50();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_2473B6DA4(&qword_269249DE0, MEMORY[0x263F67E98]);
    swift_getOpaqueTypeConformance2();
    uint64_t v25 = (uint64_t)v48;
    sub_2473BD5D0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    a4 = v41;
LABEL_8:
    sub_247391120(v25, a4, &qword_269249DD8);
    uint64_t v23 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a4, v23, 1, v51);
  }
  char v28 = sub_2473BDEB0();
  swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_7;
  }
  uint64_t v29 = *(void **)(a1 + 24);
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = v50;
    sub_247388D90(a2, v50, &v52);

    uint64_t v32 = v54;
    uint64_t v33 = v55;
    __swift_project_boxed_opaque_existential_1(&v52, v54);
    v56[0] = 0;
    if ((*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v33 + 48))(a2, v31, v56, v32, v33)) {
      sub_2473BD820();
    }
    else {
      sub_2473BD830();
    }
    a4 = v41;
    uint64_t v25 = (uint64_t)v48;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v52);
    uint64_t v34 = v45;
    uint64_t v35 = v46;
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v14, *MEMORY[0x263F67E88], v46);
    uint64_t v36 = v42;
    sub_2473BD840();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v35);
    uint64_t v38 = v43;
    uint64_t v37 = v44;
    uint64_t v39 = v49;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v36, v49);
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v11, v38, v39);
    swift_storeEnumTagMultiPayload();
    sub_2473B6DA4(&qword_269249DE0, MEMORY[0x263F67E98]);
    swift_getOpaqueTypeConformance2();
    sub_2473BD5D0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
    goto LABEL_8;
  }
  sub_2473B4728(a1);
  type metadata accessor for AccountsUIModel(0);
  sub_2473B6DA4((unint64_t *)&qword_269249678, (void (*)(uint64_t))type metadata accessor for AccountsUIModel);
  uint64_t result = sub_2473BD490();
  __break(1u);
  return result;
}

uint64_t sub_2473B4128@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2473B41A8(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_2473BD380();
}

double sub_2473B4218@<D0>(long long *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v29 = *a1;
  *(void *)&long long v30 = *((void *)a1 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249DA0);
  sub_2473BD880();
  if (v28)
  {
    uint64_t v3 = sub_2473BD9C0();
    sub_2473A3A58(0.0, 1, 0.0, 1, 480.0, 0, 0.0, 1, (uint64_t)&v29, 0.0, 1, 0.0, 1, v3, v4, v28);
    long long v12 = v29;
    LOBYTE(v13) = v30;
    *((void *)&v13 + 1) = *((void *)&v30 + 1);
    LOBYTE(v14) = v31;
    *((void *)&v14 + 1) = *((void *)&v31 + 1);
    LOBYTE(v15) = v32;
    *((void *)&v15 + 1) = *((void *)&v32 + 1);
    LOBYTE(v16) = v33;
    *((void *)&v16 + 1) = *((void *)&v33 + 1);
    LOBYTE(v17) = v34;
    *((void *)&v17 + 1) = *((void *)&v34 + 1);
    v18[0] = v35[0];
    *(_OWORD *)&v18[8] = *(_OWORD *)((char *)v35 + 8);
    *(_WORD *)&v18[24] = 257;
    long long v23 = v14;
    long long v24 = v15;
    long long v21 = v29;
    long long v22 = v13;
    *(_OWORD *)((char *)v27 + 10) = *(_OWORD *)&v18[10];
    long long v26 = v17;
    v27[0] = *(_OWORD *)v18;
    long long v25 = v16;
    sub_2473B53A0((uint64_t)&v21);
    sub_247391120((uint64_t)&v21, (uint64_t)&v29, &qword_269249DA8);
    swift_retain();
    sub_24739FD5C((uint64_t)&v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249C98);
    sub_2473B47F4();
    sub_2473BD5D0();
    swift_release_n();
    swift_release();
    long long v33 = v19[4];
    long long v34 = v19[5];
    v35[0] = v20[0];
    *(_OWORD *)((char *)v35 + 11) = *(_OWORD *)((char *)v20 + 11);
    long long v29 = v19[0];
    long long v30 = v19[1];
    long long v31 = v19[2];
    long long v32 = v19[3];
  }
  else
  {
    sub_2473BD580();
    *(void *)&long long v21 = sub_2473BD6C0();
    *((void *)&v21 + 1) = v5;
    LOBYTE(v22) = v6 & 1;
    *((void *)&v22 + 1) = v7;
    sub_2473B5394((uint64_t)&v21);
    sub_247391120((uint64_t)&v21, (uint64_t)v19, &qword_269249DA8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269249C98);
    sub_2473B47F4();
    sub_2473BD5D0();
  }
  long long v8 = v34;
  a2[4] = v33;
  a2[5] = v8;
  a2[6] = v35[0];
  *(_OWORD *)((char *)a2 + 107) = *(_OWORD *)((char *)v35 + 11);
  long long v9 = v30;
  *a2 = v29;
  a2[1] = v9;
  double result = *(double *)&v31;
  long long v11 = v32;
  a2[2] = v31;
  a2[3] = v11;
  return result;
}

uint64_t sub_2473B44E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2473BD500();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2473B4514()
{
  return sub_2473BD510();
}

unsigned char *sub_2473B453C(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_2473B4550(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269249D98);
  MEMORY[0x270FA5388](v2 - 8);
  sub_24739FBE0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269249D98);
  return sub_2473BD4D0();
}

uint64_t sub_2473B45E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2473BD500();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2473B4614()
{
  return sub_2473BD510();
}

uint64_t sub_2473B463C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_2473B464C(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_2473B4664()
{
  unint64_t result = qword_269249C58;
  if (!qword_269249C58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249C48);
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249C58);
  }
  return result;
}

uint64_t sub_2473B4728(uint64_t a1)
{
  id v2 = *(id *)(a1 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_2473B4778()
{
  unint64_t result = qword_269249C88;
  if (!qword_269249C88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249C78);
    sub_2473B47F4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249C88);
  }
  return result;
}

unint64_t sub_2473B47F4()
{
  unint64_t result = qword_269249C90;
  if (!qword_269249C90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249C98);
    sub_2473B5010(&qword_269249CA0, &qword_269249CA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249C90);
  }
  return result;
}

void sub_2473B4890(char *a1@<X8>)
{
  sub_2473B3090(*(void *)(v1 + 16), a1);
}

uint64_t sub_2473B4898()
{
  return sub_2473B346C();
}

unint64_t sub_2473B48A4()
{
  unint64_t result = qword_269249CC8;
  if (!qword_269249CC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249CB8);
    sub_2473A041C(&qword_2692497F0, &qword_2692497F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249CC8);
  }
  return result;
}

uint64_t sub_2473B493C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 24);
  swift_release();
  swift_release();

  return a1;
}

double sub_2473B498C@<D0>(_OWORD *a1@<X8>)
{
  return sub_2473B4218((long long *)(v1 + 16), a1);
}

uint64_t sub_2473B4994()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473B49B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473B49CC()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for AccountSettingsDetailModelView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for AccountSettingsDetailModelView(uint64_t a1)
{
}

void *assignWithCopy for AccountSettingsDetailModelView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for AccountSettingsDetailModelView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

ValueMetadata *type metadata accessor for AccountSettingsDetailModelView()
{
  return &type metadata for AccountSettingsDetailModelView;
}

ValueMetadata *type metadata accessor for DeleteButtonView()
{
  return &type metadata for DeleteButtonView;
}

void destroy for DetailsHeader(uint64_t a1)
{
  swift_release();
  swift_release();
  id v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for DetailsHeader(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  id v5 = *(void **)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for DetailsHeader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(unsigned char *)(a1 + 5) = *(unsigned char *)(a2 + 5);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
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

uint64_t assignWithTake for DetailsHeader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(unsigned char *)(a1 + 5) = *(unsigned char *)(a2 + 5);
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetailsHeader(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
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

uint64_t storeEnumTagSinglePayload for DetailsHeader(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DetailsHeader()
{
  return &type metadata for DetailsHeader;
}

uint64_t sub_2473B4D74()
{
  return sub_2473A041C(&qword_269249CD0, &qword_269249CD8);
}

uint64_t sub_2473B4DB0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2473B4E24()
{
  unint64_t result = qword_269249CE0;
  if (!qword_269249CE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249CE8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249C68);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249C78);
    sub_2473A041C(&qword_269249C80, &qword_269249C68);
    sub_2473B4778();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249CE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountFooterView()
{
  return &type metadata for AccountFooterView;
}

ValueMetadata *type metadata accessor for SettingSectionWrapperView()
{
  return &type metadata for SettingSectionWrapperView;
}

ValueMetadata *type metadata accessor for DisabledSettingsIconLabel()
{
  return &type metadata for DisabledSettingsIconLabel;
}

uint64_t sub_2473B4F4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473B4F68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473B4F84()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2473B4FA0@<D0>(__n128 *a1@<X8>)
{
  *(void *)&double result = sub_2473AEB7C(a1).n128_u64[0];
  return result;
}

unint64_t sub_2473B4FBC()
{
  unint64_t result = qword_269249D10;
  if (!qword_269249D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249D10);
  }
  return result;
}

uint64_t sub_2473B5010(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2473B5078(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_2473B4FBC();
    sub_2473B5010(&qword_269249D18, &qword_269249D08);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2473B512C@<X0>(uint64_t a1@<X8>)
{
  return sub_2473AD54C(*(void **)(v1 + 16), a1);
}

unint64_t sub_2473B5134()
{
  unint64_t result = qword_269249D40;
  if (!qword_269249D40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249D38);
    sub_2473B51D4();
    sub_2473A041C(&qword_269249D88, &qword_269249D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249D40);
  }
  return result;
}

unint64_t sub_2473B51D4()
{
  unint64_t result = qword_269249D48;
  if (!qword_269249D48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249D50);
    sub_2473B5274();
    sub_2473A041C(&qword_269249D78, &qword_269249D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249D48);
  }
  return result;
}

unint64_t sub_2473B5274()
{
  unint64_t result = qword_269249D58;
  if (!qword_269249D58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249D60);
    sub_2473A041C(&qword_269249D68, &qword_269249D70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249D58);
  }
  return result;
}

uint64_t sub_2473B5314()
{
  return sub_2473BD4C0();
}

uint64_t sub_2473B533C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2473BD4E0();
  *a1 = result;
  return result;
}

uint64_t sub_2473B5368()
{
  return sub_2473BD4F0();
}

uint64_t sub_2473B5394(uint64_t result)
{
  *(unsigned char *)(result + 122) = 1;
  return result;
}

uint64_t sub_2473B53A0(uint64_t result)
{
  *(unsigned char *)(result + 122) = 0;
  return result;
}

uint64_t sub_2473B53A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_2473B3584(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_2473B53B4@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B39F8(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_2473B53C0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2473B542C()
{
  unint64_t result = qword_269249DD0;
  if (!qword_269249DD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249DD8);
    sub_2473B6DA4(&qword_269249DE0, MEMORY[0x263F67E98]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249DD0);
  }
  return result;
}

uint64_t sub_2473B54F0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1) {
    return sub_24739E4C4(result, a2, a3, a4);
  }
  return result;
}

uint64_t sub_2473B5500(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1) {
    return sub_24739E508(result, a2, a3, a4);
  }
  return result;
}

uint64_t objectdestroy_13Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2473B555C()
{
  return sub_2473B335C(v0 + 16);
}

uint64_t destroy for AccountSettingsDetailView(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s18AccountsUISettings25AccountSettingsDetailViewVwCP_0(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountSettingsDetailView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
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

uint64_t assignWithTake for AccountSettingsDetailView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountSettingsDetailView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AccountSettingsDetailView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AccountSettingsDetailView()
{
  return &type metadata for AccountSettingsDetailView;
}

uint64_t destroy for SettingSectionView(id *a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SettingSectionView(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  id v6 = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SettingSectionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
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

uint64_t assignWithTake for SettingSectionView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingSectionView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingSectionView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingSectionView()
{
  return &type metadata for SettingSectionView;
}

unint64_t sub_2473B59D0()
{
  unint64_t result = qword_269249E00;
  if (!qword_269249E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249E08);
    sub_2473B5078(&qword_269249D20, &qword_269249D00);
    sub_2473B5078(&qword_269249D28, &qword_269249CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249E00);
  }
  return result;
}

unint64_t sub_2473B5A80()
{
  unint64_t result = qword_269249E10;
  if (!qword_269249E10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249E18);
    sub_2473A041C(&qword_269249E20, &qword_269249E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249E10);
  }
  return result;
}

unint64_t sub_2473B5B1C()
{
  unint64_t result = qword_269249E30;
  if (!qword_269249E30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249E38);
    sub_2473B5134();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249E30);
  }
  return result;
}

uint64_t sub_2473B5B9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473B5BB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473B5BD4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_2473B5C24(long long *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2473AECAC(a1, (uint64_t *)(v2 + 16), a2);
}

void **sub_2473B5C2C(void **a1)
{
  uint64_t v2 = *a1;
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2473B5C7C()
{
  return sub_2473B5F5C(&qword_269249E60, &qword_269249E68, (void (*)(void))sub_2473B5CB8, (void (*)(void))sub_2473B5D9C);
}

uint64_t sub_2473B5CB8()
{
  return sub_2473B5F5C(&qword_269249E70, &qword_269249E78, (void (*)(void))sub_2473B5CF4, (void (*)(void))sub_2473B5D48);
}

unint64_t sub_2473B5CF4()
{
  unint64_t result = qword_269249E80;
  if (!qword_269249E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249E80);
  }
  return result;
}

unint64_t sub_2473B5D48()
{
  unint64_t result = qword_269249E88;
  if (!qword_269249E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249E88);
  }
  return result;
}

uint64_t sub_2473B5D9C()
{
  return sub_2473B5F5C(&qword_269249E90, &qword_269249E98, (void (*)(void))sub_2473B5DD8, (void (*)(void))sub_2473B5E2C);
}

unint64_t sub_2473B5DD8()
{
  unint64_t result = qword_269249EA0;
  if (!qword_269249EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249EA0);
  }
  return result;
}

unint64_t sub_2473B5E2C()
{
  unint64_t result = qword_269249EA8;
  if (!qword_269249EA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249EB0);
    sub_2473B5ECC();
    sub_2473A041C(&qword_269249EC0, &qword_269249C08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249EA8);
  }
  return result;
}

unint64_t sub_2473B5ECC()
{
  unint64_t result = qword_269249EB8;
  if (!qword_269249EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249EB8);
  }
  return result;
}

uint64_t sub_2473B5F20()
{
  return sub_2473B5F5C(&qword_269249EC8, &qword_269249ED0, (void (*)(void))sub_2473B5FE4, (void (*)(void))sub_2473B60B0);
}

uint64_t sub_2473B5F5C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2473B5FE4()
{
  unint64_t result = qword_269249ED8;
  if (!qword_269249ED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249EE0);
    sub_2473B5ECC();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249BF8);
    sub_2473ACF1C();
    sub_247396A54();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249ED8);
  }
  return result;
}

unint64_t sub_2473B60B0()
{
  unint64_t result = qword_269249EE8;
  if (!qword_269249EE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249EF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249EF8);
    sub_2473B617C();
    sub_247396A54();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249EE8);
  }
  return result;
}

unint64_t sub_2473B617C()
{
  unint64_t result = qword_269249F00;
  if (!qword_269249F00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249EF8);
    sub_2473A041C(&qword_269249F08, &qword_269249F10);
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249F00);
  }
  return result;
}

unint64_t sub_2473B6240()
{
  unint64_t result = qword_269249F18;
  if (!qword_269249F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249F18);
  }
  return result;
}

uint64_t sub_2473B62CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2473B62F8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_2473B6308()
{
  unint64_t result = qword_269249F68;
  if (!qword_269249F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249F68);
  }
  return result;
}

uint64_t sub_2473B635C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2473B636C@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B0FBC(a1);
}

uint64_t sub_2473B6378@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B1034(a1);
}

void sub_2473B6380(uint64_t *a1@<X8>)
{
  sub_2473ADA98(*(void *)(v1 + 16), *(void *)(v1 + 32), a1);
}

uint64_t destroy for DelayedTextField(id *a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DelayedTextField(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  id v9 = v3;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DelayedTextField(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy113_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for DelayedTextField(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedTextField(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 113)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedTextField(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 112) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 113) = 1;
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
    *(unsigned char *)(result + 113) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedTextField()
{
  return &type metadata for DelayedTextField;
}

unint64_t sub_2473B678C()
{
  unint64_t result = qword_269249FA0;
  if (!qword_269249FA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FA8);
    sub_2473B5F5C(&qword_269249E58, &qword_269249E48, (void (*)(void))sub_2473B5C7C, (void (*)(void))sub_2473B5F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269249FA0);
  }
  return result;
}

uint64_t sub_2473B6838()
{
  return sub_2473A041C(&qword_269249FB0, &qword_269249FB8);
}

uint64_t sub_2473B6874()
{
  return swift_getOpaqueTypeConformance2();
}

void **sub_2473B6890(void **a1)
{
  unint64_t v2 = *a1;
  swift_retain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_2473B6920@<X0>(void *a1@<X8>)
{
  return sub_2473B2768(a1);
}

uint64_t sub_2473B6930()
{
  return sub_2473B2824();
}

uint64_t sub_2473B6940()
{
  return sub_2473B2670();
}

uint64_t sub_2473B6964()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_2473B6974()
{
  unint64_t result = qword_26924A030;
  if (!qword_26924A030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FE0);
    sub_2473B6A14();
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924A030);
  }
  return result;
}

unint64_t sub_2473B6A14()
{
  unint64_t result = qword_26924A038;
  if (!qword_26924A038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FD8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FC8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FC0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249BF0);
    sub_2473A041C(&qword_269249C18, &qword_269249BF0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924A038);
  }
  return result;
}

unint64_t sub_2473B6B74()
{
  unint64_t result = qword_26924A040;
  if (!qword_26924A040)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924A020);
    sub_2473B6C20();
    sub_2473B6DA4(&qword_26924A058, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924A040);
  }
  return result;
}

unint64_t sub_2473B6C20()
{
  unint64_t result = qword_26924A048;
  if (!qword_26924A048)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924A018);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924A008);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924A000);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FF8);
    sub_2473A041C(&qword_26924A050, &qword_269249FF8);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2473A041C(&qword_2692497C0, &qword_2692497C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924A048);
  }
  return result;
}

uint64_t sub_2473B6DA4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2473B6DEC()
{
  unint64_t result = qword_26924A060;
  if (!qword_26924A060)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269249FE8);
    sub_2473B6974();
    sub_2473B6DA4(&qword_26924A058, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924A060);
  }
  return result;
}

uint64_t objectdestroy_67Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 145, 7);
}

uint64_t objectdestroy_73Tm()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 129, 7);
}

uint64_t sub_2473B6F90()
{
  return sub_2473B26EC();
}

uint64_t sub_2473B6FAC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2473B6FBC()
{
  return sub_2473B5F5C(&qword_26924A068, &qword_26924A070, (void (*)(void))sub_2473B6B74, (void (*)(void))sub_2473B6DEC);
}

uint64_t AccountUISetting.CustomDataclass.__allocating_init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, unsigned __int8 a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19 = swift_allocObject();
  AccountUISetting.CustomDataclass.init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
  return v19;
}

uint64_t sub_2473B7100(uint64_t a1, unsigned __int8 *a2, uint64_t *a3, void (*a4)(uint64_t, uint64_t, uint64_t (*)(char a1), uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v8 = *a3;
  uint64_t v7 = a3[1];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v7;
  swift_retain();
  a4(a1, v6, sub_2473BD144, v9);
  return swift_release();
}

uint64_t AccountUISetting.DetailsConfiguration.init(iconShown:logoShown:serviceNameShown:fullNameShown:usernameShown:detailsButtonShown:detailsView:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(unsigned char *)a8 = result;
  *(unsigned char *)(a8 + 1) = a2;
  *(unsigned char *)(a8 + 2) = a3;
  *(unsigned char *)(a8 + 3) = a4;
  *(unsigned char *)(a8 + 4) = a5;
  *(unsigned char *)(a8 + 5) = a6;
  *(void *)(a8 + 8) = a7;
  return result;
}

__n128 AccountUISetting.init(id:type:label:editable:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  char v7 = *(unsigned char *)(a3 + 32);
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  __n128 result = *(__n128 *)a3;
  long long v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a7 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(a7 + 32) = v9;
  *(unsigned char *)(a7 + 48) = v7;
  *(void *)(a7 + 56) = a4;
  *(void *)(a7 + 64) = a5;
  *(unsigned char *)(a7 + 72) = a6;
  return result;
}

void *AccountUISettingSection.__allocating_init(id:settings:title:footer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v12 = (void *)swift_allocObject();
  v12[6] = 0;
  v12[7] = 0;
  v12[5] = 0;
  v12[2] = a1;
  uint64_t v12[3] = a2;
  v12[4] = a3;
  swift_beginAccess();
  v12[5] = a4;
  v12[6] = a5;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v12[7] = a6;
  swift_release();
  return v12;
}

uint64_t sub_2473B72BC()
{
  return MEMORY[0x263F8EE78];
}

uint64_t AccountsUISettingsPlugin.supportedAccountTypes.getter()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2473B72D4()
{
  return 0;
}

uint64_t AccountsUISettingsPlugin.detailModel(for:)()
{
  return 0;
}

uint64_t AccountsUISettingsPlugin.topLevelView(for:)()
{
  return 0;
}

UIImage_optional __swiftcall AccountsUISettingsPlugin.image(_:iconType:)(Swift::String _, AccountsUISettings::AccountsTypes::IconType iconType)
{
  _._countAndFlagsBits = 0;
  return *(UIImage_optional *)&_._countAndFlagsBits;
}

UIImage_optional __swiftcall AccountsUISettingsPlugin.dataclassImage(for:)(Swift::String a1)
{
  a1._countAndFlagsBits = 0;
  return *(UIImage_optional *)&a1._countAndFlagsBits;
}

uint64_t AccountUISetting.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountUISetting.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AccountUISetting.id.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.iconShown.getter()
{
  return *v0;
}

uint64_t AccountUISetting.DetailsConfiguration.iconShown.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.iconShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.logoShown.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t AccountUISetting.DetailsConfiguration.logoShown.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.logoShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.serviceNameShown.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t AccountUISetting.DetailsConfiguration.serviceNameShown.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.serviceNameShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.fullNameShown.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t AccountUISetting.DetailsConfiguration.fullNameShown.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.fullNameShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.usernameShown.getter()
{
  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t AccountUISetting.DetailsConfiguration.usernameShown.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 4) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.usernameShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.detailsButtonShown.getter()
{
  return *(unsigned __int8 *)(v0 + 5);
}

uint64_t AccountUISetting.DetailsConfiguration.detailsButtonShown.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 5) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.detailsButtonShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.detailsView.getter()
{
  return swift_retain();
}

uint64_t AccountUISetting.DetailsConfiguration.detailsView.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.detailsView.modify())()
{
  return nullsub_1;
}

void *AccountUISetting.CustomDataclass.init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, unsigned __int8 a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19 = (void *)v18;
  uint64_t v47 = a8;
  uint64_t v46 = a7;
  id v45 = a6;
  id v48 = a5;
  uint64_t v43 = a4;
  uint64_t v42 = a2;
  uint64_t v41 = a1;
  uint64_t v56 = a17;
  uint64_t v57 = a18;
  uint64_t v55 = a16;
  int v54 = a15;
  uint64_t v52 = a13;
  uint64_t v53 = a14;
  int v51 = a12;
  uint64_t v49 = a10;
  uint64_t v50 = a11;
  int v44 = a9;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A078);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  long long v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B560);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v18 + 56) = 0;
  long long v29 = (void **)(v18 + 56);
  long long v30 = (char *)v19 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView;
  *(void *)&long long v62 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3B0);
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v30, v28, v25);
  long long v31 = (char *)v19 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext;
  long long v62 = 0u;
  long long v63 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924A090);
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v31, v24, v21);
  long long v32 = (void *)((char *)v19
                 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  uint64_t *v32 = 0;
  v32[1] = 0;
  uint64_t v33 = v42;
  void v19[2] = v41;
  v19[3] = v33;
  uint64_t v34 = v43;
  v19[4] = a3;
  v19[5] = v34;
  _OWORD v19[6] = v48;
  swift_beginAccess();
  uint64_t v35 = *v29;
  id v36 = v45;
  void *v29 = v45;
  id v48 = a3;
  id v45 = v36;

  swift_beginAccess();
  uint64_t v58 = v46;
  uint64_t v59 = v47;
  char v60 = v44;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692498B8);
  sub_2473BD330();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v58 = v49;
  uint64_t v59 = v50;
  char v60 = v51;
  swift_retain();
  swift_retain();
  sub_2473BD330();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v58 = v52;
  uint64_t v59 = v53;
  char v60 = v54;
  swift_retain();
  swift_retain();
  sub_2473BD330();
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v61 = v55;
  swift_retain();
  sub_2473BD380();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_beginAccess();
  uint64_t v37 = *v32;
  uint64_t v38 = v57;
  uint64_t *v32 = v56;
  v32[1] = v38;
  sub_24739FD4C(v37);
  return v19;
}

uint64_t sub_2473B79A0()
{
  return sub_2473B79DC();
}

uint64_t sub_2473B79B4()
{
  return sub_2473B79DC();
}

uint64_t sub_2473B79C8()
{
  return sub_2473B79DC();
}

uint64_t sub_2473B79DC()
{
  return sub_2473BD380();
}

uint64_t sub_2473B7A5C()
{
  return sub_2473BD380();
}

uint64_t sub_2473B7ACC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_beginAccess();
  sub_2473BDAD0();
  swift_bridgeObjectRetain();
  sub_2473BDB20();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t (*sub_2473B7B70())()
{
  return j_j__swift_endAccess;
}

void sub_2473B7BC4(void **a1, uint64_t *a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  long long v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
  id v5 = v2;
}

id sub_2473B7C1C()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  return v1;
}

void sub_2473B7C60(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*sub_2473B7CA8())()
{
  return j__swift_endAccess;
}

uint64_t sub_2473B7CFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 40) = v3;
  *(void *)(v4 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473B7D5C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2473B7DA8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2473B7DFC())()
{
  return j_j__swift_endAccess;
}

void sub_2473B7E50(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
  id v5 = v2;
}

void *sub_2473B7EA8()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 56);
  id v2 = v1;
  return v1;
}

void sub_2473B7EEC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = a1;
}

uint64_t (*sub_2473B7F34())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2473B7F88@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B83AC(a1);
}

uint64_t sub_2473B7F9C()
{
  return sub_2473B8444();
}

uint64_t sub_2473B7FB0()
{
  return sub_2473B84E8();
}

uint64_t (*sub_2473B7FC4(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473B8050()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_26924A0B0);
}

uint64_t sub_2473B8064(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0B8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_26924A0B0);
}

uint64_t (*sub_2473B8080(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B0);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_2473B8190@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B83AC(a1);
}

uint64_t sub_2473B81A4()
{
  return sub_2473B8444();
}

uint64_t sub_2473B81B8()
{
  return sub_2473B84E8();
}

uint64_t (*sub_2473B81CC(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473B8258()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_26924A0B0);
}

uint64_t sub_2473B826C(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0B8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_26924A0B0);
}

uint64_t (*sub_2473B8288(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B0);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_2473B8398@<X0>(uint64_t a1@<X8>)
{
  return sub_2473B83AC(a1);
}

uint64_t sub_2473B83AC@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_2473B8430()
{
  return sub_2473B8444();
}

uint64_t sub_2473B8444()
{
  return sub_2473BD380();
}

uint64_t sub_2473B84D4()
{
  return sub_2473B84E8();
}

uint64_t sub_2473B84E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t (*sub_2473B8558(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473B85E4()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_26924A0B0);
}

uint64_t sub_2473B85F8(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0B8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_26924A0B0);
}

uint64_t (*sub_2473B8614(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B0);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_2473B8724@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2473B87A4()
{
  return sub_2473BD380();
}

uint64_t sub_2473B8820()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t (*sub_2473B8894(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473B8920()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_26B12B560);
}

uint64_t sub_2473B8934(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0C0, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_26B12B560);
}

uint64_t (*sub_2473B8950(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0C0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B560);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

double sub_2473B8A60@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2473B8AE0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24739E4C4(v1, v2, v3, v4);
  swift_retain();
  return sub_2473BD380();
}

uint64_t sub_2473B8B80()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2473B8BF8()
{
  return sub_2473BD380();
}

uint64_t (*sub_2473B8C88(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473B8D14()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_26924A078);
}

uint64_t sub_2473B8D28(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0C8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_26924A078);
}

uint64_t (*sub_2473B8D44(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0C8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A078);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_2473B8E54@<X0>(void *a1@<X0>, uint64_t (**a2)(uint64_t a1, unsigned __int8 *a2, uint64_t *a3)@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    char v7 = sub_2473BD13C;
  }
  else
  {
    char v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t, unsigned __int8 *, uint64_t *))v6;
  return sub_24739FD3C(v4);
}

uint64_t sub_2473B8EF4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2473BD108;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  char v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_24739FD3C(v3);
  return sub_24739FD4C(v8);
}

uint64_t sub_2473B8FBC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, char *, void *))
{
  char v12 = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v11[0] = sub_2473BD110;
  v11[1] = v9;
  swift_retain();
  a5(a1, &v12, v11);
  return swift_release();
}

uint64_t sub_2473B9068()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_24739FD3C(*v1);
  return v2;
}

uint64_t sub_2473B90C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_24739FD4C(v6);
}

uint64_t (*sub_2473B9124())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2473B9180()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  sub_2473BDAD0();
  id v2 = v1;
  uint64_t v3 = sub_2473BDB50();

  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2473BDB50();
  swift_bridgeObjectRelease();
  uint64_t result = v3 + v4;
  if (__OFADD__(v3, v4)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2473B923C()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2473BDB10();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  sub_2473BDAD0();
  id v2 = v1;
  sub_2473BDB10();

  return swift_bridgeObjectRelease();
}

uint64_t AccountUISetting.CustomDataclass.deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0B0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, v2);
  v3(v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B560);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A078);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  sub_24739FD4C(*(void *)(v0
                          + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock));
  return v0;
}

uint64_t AccountUISetting.CustomDataclass.__deallocating_deinit()
{
  AccountUISetting.CustomDataclass.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2473B94C0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountUISetting.CustomDataclass(0);
  uint64_t result = sub_2473BD320();
  *a1 = result;
  return result;
}

uint64_t sub_2473B9500()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 32);
  sub_2473BDAD0();
  id v3 = v2;
  uint64_t v4 = sub_2473BDB50();

  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2473BDB50();
  swift_bridgeObjectRelease();
  uint64_t result = v4 + v5;
  if (__OFADD__(v4, v5)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2473B95C0()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2473BDB10();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 32);
  sub_2473BDAD0();
  id v3 = v2;
  sub_2473BDB10();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2473B9678()
{
  sub_2473BDEF0();
  uint64_t v1 = *v0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2473BDB10();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 32);
  sub_2473BDAD0();
  id v3 = v2;
  sub_2473BDB10();

  swift_bridgeObjectRelease();
  return sub_2473BDF10();
}

uint64_t sub_2473B973C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  swift_beginAccess();
  sub_2473BDAD0();
  swift_bridgeObjectRetain();
  sub_2473BDB20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v4;
  return result;
}

uint64_t sub_2473B97E0(uint64_t *a1, uint64_t *a2)
{
  return _s18AccountsUISettings16AccountUISettingV15CustomDataclassC2eeoiySbAE_AEtFZ_0(*a1, *a2);
}

id AccountUISetting.CustomDataclassTableConfig.__allocating_init(customDataclasses:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  swift_beginAccess();
  uint64_t v7 = a1;
  id v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249908);
  sub_2473BD330();
  swift_endAccess();

  v6.receiver = v4;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id AccountUISetting.CustomDataclassTableConfig.init(customDataclasses:)(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v6 = a1;
  id v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269249908);
  sub_2473BD330();
  swift_endAccess();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_2473B9930()
{
  return sub_2473BA628();
}

uint64_t sub_2473B9944@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_2473B9958(uint64_t a1, void **a2)
{
  return sub_2473BA58C(a1, a2);
}

uint64_t sub_2473B996C()
{
  return sub_2473833BC();
}

uint64_t (*sub_2473B9980(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473B9A0C()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_26924A0D8);
}

uint64_t sub_2473B9A20(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0E0, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_26924A0D8);
}

uint64_t (*sub_2473B9A3C(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0D8);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

void AccountUISetting.CustomDataclassTableConfig.init()()
{
}

id AccountUISetting.CustomDataclassTableConfig.__deallocating_deinit()
{
  return sub_2473BAD74(type metadata accessor for AccountUISetting.CustomDataclassTableConfig);
}

uint64_t sub_2473B9C34@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
  uint64_t result = sub_2473BD320();
  *a1 = result;
  return result;
}

id AccountUISetting.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  id v3 = *(void **)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(v1 + 48);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_2473ACBCC(v2, v3, v4, v5, v6);
}

__n128 AccountUISetting.type.setter(__n128 *a1)
{
  __n128 v6 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  sub_2473ACCA8(*(void **)(v1 + 16), *(id *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
  __n128 result = v6;
  *(__n128 *)(v1 + 16) = v6;
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  *(unsigned char *)(v1 + 48) = v4;
  return result;
}

uint64_t (*AccountUISetting.type.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountUISetting.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*AccountUISetting.label.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.editable.getter()
{
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t AccountUISetting.editable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 72) = result;
  return result;
}

uint64_t (*AccountUISetting.editable.modify())()
{
  return nullsub_1;
}

uint64_t sub_2473B9DC4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *AccountUISettingSection.init(id:settings:title:footer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = 0;
  v6[7] = 0;
  v6[5] = 0;
  uint64_t v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  swift_beginAccess();
  v6[5] = a4;
  v6[6] = a5;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v6[7] = a6;
  swift_release();
  return v6;
}

uint64_t sub_2473B9E94(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473B9EF4()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2473B9F40(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473B9F94(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473B9FF4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473BA02C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2473BA074())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2473BA0C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 56) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2473BA128()
{
  return swift_retain();
}

uint64_t sub_2473BA160(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_release();
}

uint64_t AccountUISettingSection.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t AccountUISettingSection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_2473BA230@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a1 = *(void *)(v3 + 16);
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473BA27C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountUISettingSection();
  uint64_t result = sub_2473BD320();
  *a1 = result;
  return result;
}

uint64_t sub_2473BA2B8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2473BD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2473BA32C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_2473BD380();
}

uint64_t (*sub_2473BA398(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473BA424()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_26924A0E8);
}

uint64_t sub_2473BA438(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A0F0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_26924A0E8);
}

uint64_t (*sub_2473BA454(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0E8);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

uint64_t sub_2473BA564@<X0>(void *a1@<X8>)
{
  return sub_24738A0F4(a1);
}

uint64_t sub_2473BA578(uint64_t a1, void **a2)
{
  return sub_2473BA58C(a1, a2);
}

uint64_t sub_2473BA58C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_2473BD380();
}

uint64_t sub_2473BA600()
{
  return sub_2473833BC();
}

uint64_t sub_2473BA614()
{
  return sub_2473BA628();
}

uint64_t sub_2473BA628()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_2473BD380();
}

uint64_t (*sub_2473BA690(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2473BD360();
  return sub_2473831F8;
}

uint64_t sub_2473BA71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v15 = (char *)&v18 - v14;
  long long v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2473BD350();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2473BA898()
{
  return sub_247386C84((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_26924A0F8);
}

uint64_t sub_2473BA8AC(uint64_t a1)
{
  return sub_2473BA8C8(a1, &qword_26924A100, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_26924A0F8);
}

uint64_t sub_2473BA8C8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2473BD350();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_2473BA9F8(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A100);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0F8);
  sub_2473BD340();
  swift_endAccess();
  return sub_247383104;
}

id AccountsUISettingsDetailModel.__allocating_init(with:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  size_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)objc_allocWithZone(v1);
  uint64_t v8 = &v7[OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections];
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3C8);
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v8, v6, v3);
  swift_beginAccess();
  uint64_t v14 = a1;
  sub_2473BB1A4();
  id v10 = a1;
  sub_2473BD330();
  swift_endAccess();

  v13.receiver = v9;
  v13.super_class = v1;
  id v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

id AccountsUISettingsDetailModel.init(with:)(void *a1)
{
  id v2 = sub_2473BB02C(a1);

  return v2;
}

id AccountsUISettingsDetailModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AccountsUISettingsDetailModel.init()()
{
}

id AccountsUISettingsDetailModel.__deallocating_deinit()
{
  return sub_2473BAD74(type metadata accessor for AccountsUISettingsDetailModel);
}

id sub_2473BAD74(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2473BAE70@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountsUISettingsDetailModel(0);
  uint64_t result = sub_2473BD320();
  *a1 = result;
  return result;
}

Swift::OpaquePointer_optional __swiftcall AccountsUISettingsPlugin.sections(for:)(ACAccount a1)
{
  id v1 = 0;
  result.value._rawValue = v1;
  return result;
}

uint64_t _s18AccountsUISettings16AccountUISettingV15CustomDataclassC2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v4 = sub_2473BDAD0();
  uint64_t v6 = v5;
  if (v4 == sub_2473BDAD0() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v9 = sub_2473BDEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v10 = 0;
    if ((v9 & 1) == 0) {
      return v10 & 1;
    }
  }
  swift_beginAccess();
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  swift_beginAccess();
  if (v12 == *(void *)(a2 + 16) && v11 == *(void *)(a2 + 24)) {
    char v10 = 1;
  }
  else {
    char v10 = sub_2473BDEB0();
  }
  return v10 & 1;
}

uint64_t type metadata accessor for AccountUISetting.CustomDataclassTableConfig(uint64_t a1)
{
  return sub_24738ECF0(a1, (uint64_t *)&unk_26924A130);
}

id sub_2473BB02C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections];
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B3C8);
  sub_2473BD330();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);
  swift_beginAccess();
  objc_super v13 = a1;
  sub_2473BB1A4();
  id v9 = a1;
  sub_2473BD330();
  swift_endAccess();

  char v10 = (objc_class *)type metadata accessor for AccountsUISettingsDetailModel(0);
  v12.receiver = v8;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, sel_init);
}

unint64_t sub_2473BB1A4()
{
  unint64_t result = qword_26B12B3F8;
  if (!qword_26B12B3F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B12B3F8);
  }
  return result;
}

uint64_t type metadata accessor for AccountsUISettingsDetailModel(uint64_t a1)
{
  return sub_24738ECF0(a1, qword_26B12B0A8);
}

unint64_t sub_2473BB208()
{
  unint64_t result = qword_26924A108;
  if (!qword_26924A108)
  {
    type metadata accessor for AccountUISetting.CustomDataclass(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924A108);
  }
  return result;
}

uint64_t type metadata accessor for AccountUISetting.CustomDataclass(uint64_t a1)
{
  return sub_24738ECF0(a1, (uint64_t *)&unk_26924A110);
}

uint64_t sub_2473BB284(uint64_t *a1, uint64_t *a2)
{
  return sub_2473B9E94(a1, a2);
}

id sub_2473BB29C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 32);
  *a2 = v4;
  return v4;
}

uint64_t sub_2473BB2F8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 48);
  *a2 = *(void *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id sub_2473BB348@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 56);
  *a2 = v4;
  return v4;
}

uint64_t sub_2473BB3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_26924A0B0);
}

uint64_t sub_2473BB3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0B8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_26924A0B0);
}

uint64_t sub_2473BB3FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_26924A0B0);
}

uint64_t sub_2473BB424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0B8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_26924A0B0);
}

uint64_t sub_2473BB454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_26924A0B0);
}

uint64_t sub_2473BB47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0B8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_26924A0B0);
}

uint64_t sub_2473BB4AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_26B12B560);
}

uint64_t sub_2473BB4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0C0, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_26B12B560);
}

uint64_t sub_2473BB504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_26924A078);
}

uint64_t sub_2473BB52C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0C8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_26924A078);
}

uint64_t sub_2473BB564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_26924A0D8);
}

uint64_t sub_2473BB58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0E0, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_26924A0D8);
}

uint64_t keypath_get_56Tm@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473BB60C(uint64_t *a1, uint64_t *a2)
{
  return sub_2473B9E94(a1, a2);
}

uint64_t sub_2473BB624@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473BB674@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 48);
  *a2 = *(void *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2473BB6C4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 56);
  return swift_retain();
}

uint64_t sub_2473BB71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_26924A0E8);
}

uint64_t sub_2473BB744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A0F0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_26924A0E8);
}

uint64_t sub_2473BB774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247386A68(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_26924A0F8);
}

uint64_t sub_2473BB79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2473BA71C(a1, a2, a3, a4, &qword_26924A100, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_26924A0F8);
}

uint64_t destroy for AccountUISetting(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_2473ACCA8(*(void **)(a1 + 16), *(id *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccountUISetting(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_2473ACBCC(v5, v6, v7, v8, v9);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountUISetting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  char v8 = *(unsigned char *)(a2 + 48);
  sub_2473ACBCC(v4, v5, v6, v7, v8);
  char v9 = *(void **)(a1 + 16);
  uint64_t v10 = *(void **)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  char v13 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v8;
  sub_2473ACCA8(v9, v10, v11, v12, v13);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AccountUISetting(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v7 = *(void **)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v10;
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v5;
  sub_2473ACCA8(v6, v7, v8, v9, v11);
  uint64_t v12 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountUISetting(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountUISetting(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountUISetting()
{
  return &type metadata for AccountUISetting;
}

uint64_t sub_2473BBAB4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AccountUISetting.DetailsConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(unsigned char *)(a1 + 5) = *(unsigned char *)(a2 + 5);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AccountUISetting.DetailsConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(unsigned char *)(a1 + 5) = *(unsigned char *)(a2 + 5);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountUISetting.DetailsConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for AccountUISetting.DetailsConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountUISetting.DetailsConfiguration()
{
  return &type metadata for AccountUISetting.DetailsConfiguration;
}

uint64_t sub_2473BBC80()
{
  return type metadata accessor for AccountUISetting.CustomDataclass(0);
}

void sub_2473BBC88()
{
  sub_24738FD34(319, &qword_26924A120, &qword_2692498B8);
  if (v0 <= 0x3F)
  {
    sub_24738FD34(319, &qword_26B12B348, &qword_26B12B3B0);
    if (v1 <= 0x3F)
    {
      sub_24738FD34(319, &qword_26924A128, &qword_26924A090);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for AccountUISetting.CustomDataclass(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountUISetting.CustomDataclass);
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.__allocating_init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.id.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accountID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accountID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accountID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.identifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.identifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.identifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.localizedName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.localizedName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.localizedName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.icon.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.icon.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.icon.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.showsToggle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.showsToggle.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.showsToggle.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$showsToggle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$showsToggle.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$showsToggle.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.toggleEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.toggleEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.toggleEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$toggleEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$toggleEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$toggleEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accessoryView.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accessoryView.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accessoryView.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$accessoryView.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$accessoryView.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$accessoryView.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.subtext.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.subtext.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.subtext.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$subtext.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$subtext.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$subtext.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.stateChangeBlock.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.stateChangeBlock.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.stateChangeBlock.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.hashValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.hash(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t sub_2473BC640()
{
  return type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
}

void sub_2473BC648()
{
  sub_24738FD34(319, &qword_26924A140, &qword_269249908);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AccountUISetting.CustomDataclassTableConfig(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountUISetting.CustomDataclassTableConfig);
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.__allocating_init(customDataclasses:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.customDataclasses.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.customDataclasses.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.customDataclasses.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.$customDataclasses.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.$customDataclasses.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.$customDataclasses.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

void destroy for AccountUISetting.SettingType(uint64_t a1)
{
}

uint64_t initializeWithCopy for AccountUISetting.SettingType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  int v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_2473ACBCC(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for AccountUISetting.SettingType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  int v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_2473ACBCC(*(id *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_2473ACCA8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AccountUISetting.SettingType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  int v4 = *(void **)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_2473ACCA8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountUISetting.SettingType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 7) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountUISetting.SettingType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 249;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2473BCA28(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 6u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_2473BCA40(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(void *)__n128 result = a2 - 7;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 7;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountUISetting.SettingType()
{
  return &type metadata for AccountUISetting.SettingType;
}

uint64_t type metadata accessor for AccountUISettingSection()
{
  return self;
}

uint64_t method lookup function for AccountUISettingSection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountUISettingSection);
}

uint64_t dispatch thunk of AccountUISettingSection.__allocating_init(id:settings:title:footer:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AccountUISettingSection.id.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AccountUISettingSection.id.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of AccountUISettingSection.id.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of AccountUISettingSection.settings.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of AccountUISettingSection.settings.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of AccountUISettingSection.settings.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of AccountUISettingSection.title.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AccountUISettingSection.title.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AccountUISettingSection.title.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AccountUISettingSection.footer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AccountUISettingSection.footer.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AccountUISettingSection.footer.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_2473BCC6C()
{
  return type metadata accessor for AccountsUISettingsDetailModel(0);
}

void sub_2473BCC74()
{
  sub_2473BCFEC();
  if (v0 <= 0x3F)
  {
    sub_24738FD34(319, (unint64_t *)&unk_26B12B358, &qword_26B12B3C8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AccountsUISettingsDetailModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountsUISettingsDetailModel);
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.account.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.account.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.account.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$account.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$account.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$account.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.sections.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.sections.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.sections.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$sections.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$sections.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$sections.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.__allocating_init(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

void sub_2473BCFEC()
{
  if (!qword_26B12B388)
  {
    sub_2473BB1A4();
    unint64_t v0 = sub_2473BD390();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B12B388);
    }
  }
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.supportedAccountTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.detailModel(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.sections(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.topLevelView(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.image(_:iconType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.dataclassImage(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_2473BD0D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473BD108(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_2473B8FBC(a1, a2, a3, a4, *(void (**)(uint64_t, char *, void *))(v4 + 16));
}

uint64_t sub_2473BD110(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_2473BD13C(uint64_t a1, unsigned __int8 *a2, uint64_t *a3)
{
  return sub_2473B7100(a1, a2, a3, *(void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))(v3 + 16));
}

uint64_t sub_2473BD144(char a1)
{
  unint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2473BD1B0()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_2473BD1C0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2473BD1D0()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2473BD1E0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2473BD1F0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2473BD200()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_2473BD210()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2473BD220()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_2473BD230()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2473BD240()
{
  return MEMORY[0x270F0A510]();
}

uint64_t sub_2473BD250()
{
  return MEMORY[0x270F0A518]();
}

uint64_t sub_2473BD260()
{
  return MEMORY[0x270F0A520]();
}

uint64_t sub_2473BD270()
{
  return MEMORY[0x270F0A528]();
}

uint64_t sub_2473BD280()
{
  return MEMORY[0x270F0A530]();
}

uint64_t sub_2473BD290()
{
  return MEMORY[0x270F0A538]();
}

uint64_t sub_2473BD2A0()
{
  return MEMORY[0x270F0A540]();
}

uint64_t sub_2473BD2B0()
{
  return MEMORY[0x270F0A548]();
}

uint64_t sub_2473BD2C0()
{
  return MEMORY[0x270F0A550]();
}

uint64_t sub_2473BD2D0()
{
  return MEMORY[0x270F0A558]();
}

uint64_t sub_2473BD2E0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2473BD2F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2473BD300()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2473BD310()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2473BD320()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2473BD330()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2473BD340()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2473BD350()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2473BD360()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2473BD370()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2473BD380()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2473BD390()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2473BD3A0()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_2473BD3B0()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_2473BD3C0()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_2473BD3D0()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_2473BD3E0()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_2473BD3F0()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_2473BD400()
{
  return MEMORY[0x270EFF038]();
}

uint64_t sub_2473BD410()
{
  return MEMORY[0x270EFF0E0]();
}

uint64_t sub_2473BD420()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_2473BD430()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_2473BD440()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2473BD450()
{
  return MEMORY[0x270EFFC90]();
}

uint64_t sub_2473BD460()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_2473BD470()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2473BD480()
{
  return MEMORY[0x270F00820]();
}

uint64_t sub_2473BD490()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_2473BD4A0()
{
  return MEMORY[0x270F00838]();
}

uint64_t sub_2473BD4B0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_2473BD4C0()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_2473BD4D0()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_2473BD4E0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2473BD4F0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2473BD500()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_2473BD510()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_2473BD520()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2473BD530()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_2473BD540()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2473BD550()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2473BD560()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2473BD570()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2473BD580()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2473BD590()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2473BD5A0()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_2473BD5B0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_2473BD5C0()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_2473BD5D0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2473BD5E0()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_2473BD5F0()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_2473BD600()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_2473BD610()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_2473BD620()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_2473BD630()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_2473BD640()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_2473BD650()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2473BD660()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2473BD670()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_2473BD680()
{
  return MEMORY[0x270F02D60]();
}

uint64_t sub_2473BD690()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_2473BD6A0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2473BD6B0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2473BD6C0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2473BD6D0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2473BD6E0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2473BD6F0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2473BD700()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2473BD710()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_2473BD720()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2473BD730()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_2473BD740()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_2473BD750()
{
  return MEMORY[0x270F03F10]();
}

uint64_t sub_2473BD760()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_2473BD770()
{
  return MEMORY[0x270F03FA8]();
}

uint64_t sub_2473BD780()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_2473BD790()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_2473BD7A0()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_2473BD7B0()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_2473BD7C0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2473BD7D0()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_2473BD7E0()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_2473BD7F0()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_2473BD800()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_2473BD810()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2473BD820()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2473BD830()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2473BD840()
{
  return MEMORY[0x270F5D088]();
}

uint64_t sub_2473BD850()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2473BD860()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2473BD870()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2473BD880()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2473BD890()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2473BD8A0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2473BD8B0()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_2473BD8C0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2473BD8D0()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_2473BD8E0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2473BD8F0()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_2473BD900()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_2473BD910()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_2473BD920()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2473BD930()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2473BD940()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_2473BD950()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_2473BD960()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2473BD970()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2473BD980()
{
  return MEMORY[0x270F04D38]();
}

uint64_t sub_2473BD990()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_2473BD9A0()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2473BD9B0()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_2473BD9C0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2473BD9D0()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2473BD9E0()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_2473BD9F0()
{
  return MEMORY[0x270F05300]();
}

uint64_t sub_2473BDA00()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2473BDA10()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2473BDA20()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2473BDA30()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2473BDA40()
{
  return MEMORY[0x270F5D0E8]();
}

uint64_t sub_2473BDA50()
{
  return MEMORY[0x270F5D0F0]();
}

uint64_t sub_2473BDA60()
{
  return MEMORY[0x270F5D0F8]();
}

uint64_t sub_2473BDA70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2473BDA80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2473BDA90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2473BDAA0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2473BDAB0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2473BDAC0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2473BDAD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2473BDAE0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2473BDAF0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2473BDB00()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2473BDB10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2473BDB20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2473BDB30()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2473BDB40()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2473BDB50()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_2473BDB60()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2473BDB70()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2473BDB80()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2473BDB90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2473BDBA0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2473BDBB0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2473BDBC0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2473BDBD0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2473BDBE0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2473BDBF0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2473BDC00()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_2473BDC10()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2473BDC20()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2473BDC30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2473BDC40()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2473BDC50()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2473BDC60()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2473BDC70()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2473BDC80()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2473BDC90()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2473BDCA0()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_2473BDCB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2473BDCC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2473BDCD0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2473BDCE0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2473BDCF0()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_2473BDD00()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_2473BDD10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2473BDD20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2473BDD30()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2473BDD40()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2473BDD50()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2473BDD60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2473BDD70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2473BDD80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2473BDD90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2473BDDA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2473BDDB0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2473BDDC0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2473BDDD0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2473BDDE0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2473BDDF0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2473BDE00()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2473BDE10()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2473BDE20()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2473BDE30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2473BDE40()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2473BDE50()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2473BDE60()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2473BDE70()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2473BDE90()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2473BDEA0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2473BDEB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2473BDEC0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2473BDED0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2473BDEE0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2473BDEF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2473BDF00()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2473BDF10()
{
  return MEMORY[0x270F9FC90]();
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x270EE4C98](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}