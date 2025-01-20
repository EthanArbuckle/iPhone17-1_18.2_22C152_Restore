uint64_t variable initialization expression of AsyncSelectionConfirmingPicker._confirmationConfiguration@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  void v9[5];

  v9[0] = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a5;
  v7 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(0, (uint64_t)v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a6, 1, 1, v7);
}

uint64_t variable initialization expression of AsyncSelectionConfirmingPicker._isPresentingConfirmation()
{
  return 0;
}

uint64_t variable initialization expression of AsyncSelectionConfirmingPicker._showConfirmationTask()
{
  return 0;
}

void type metadata accessor for MTPodcastCellularDownloadLimit(uint64_t a1)
{
}

BOOL sub_2560(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_2574(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for MTPodcastSkipDuration(uint64_t a1)
{
}

void sub_2594(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for SettingsSpecifierToggleCell(void *a1, void *a2)
{
  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for SettingsSpecifierToggleCell(uint64_t a1)
{
}

void *assignWithCopy for SettingsSpecifierToggleCell(void *a1, void *a2)
{
  *a1 = *a2;
  v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

__n128 initializeWithTake for SettingsSpecifierToggleCell(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SettingsSpecifierToggleCell(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsSpecifierToggleCell(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsSpecifierToggleCell(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingsSpecifierToggleCell()
{
  return &type metadata for SettingsSpecifierToggleCell;
}

uint64_t sub_2728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_274C()
{
  return sub_20EC8();
}

id sub_2768()
{
  v1 = *(void **)(v0 + 8);
  id result = [v1 name];
  if (result)
  {
    uint64_t v3 = result;
    sub_21198();

    id v4 = v1;
    sub_1EEC0();

    sub_2820();
    return (id)sub_21088();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2820()
{
  unint64_t result = qword_306C0;
  if (!qword_306C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_306C0);
  }
  return result;
}

unint64_t sub_2878()
{
  unint64_t result = qword_306C8;
  if (!qword_306C8)
  {
    sub_28D4((uint64_t *)&unk_30BF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_306C8);
  }
  return result;
}

uint64_t sub_28D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SettingsDestinationViewController(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for SettingsDestinationViewController(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for SettingsDestinationViewController(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for SettingsDestinationViewController(uint64_t a1, _OWORD *a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsDestinationViewController(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsDestinationViewController(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsDestinationViewController()
{
  return &type metadata for SettingsDestinationViewController;
}

unint64_t sub_2AC0()
{
  unint64_t result = qword_30730;
  if (!qword_30730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30730);
  }
  return result;
}

id sub_2B14()
{
  id v2 = *(id *)v0;
  uint64_t v1 = *(void *)(v0 + 8);
  if ([*(id *)v0 detailControllerClass]
    && (id v3 = (id)CreateDetailControllerInstanceWithClass()) != 0)
  {
    id v4 = v3;
    [v3 setSpecifier:v2];
    [v4 setParentViewController:v1];
    return v4;
  }
  else
  {
    id v6 = objc_allocWithZone((Class)UIViewController);
    return [v6 init];
  }
}

uint64_t sub_2BD0()
{
  return sub_20D48();
}

void *sub_2C0C()
{
  return &protocol witness table for Never;
}

uint64_t sub_2C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2D08();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_2C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2D08();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_2CE0()
{
}

unint64_t sub_2D08()
{
  unint64_t result = qword_30738;
  if (!qword_30738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30738);
  }
  return result;
}

uint64_t destroy for SettingsSpecifierSection(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s22PodcastsSettingsPlugin24SettingsSpecifierSectionVwCP_0(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SettingsSpecifierSection(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SettingsSpecifierSection(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SettingsSpecifierSection(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsSpecifierSection(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsSpecifierSection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingsSpecifierSection()
{
  return &type metadata for SettingsSpecifierSection;
}

uint64_t sub_2F60()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_2F7C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_3238((uint64_t *)&unk_30740);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [a2 name];
  if (result)
  {
    v13 = result;
    uint64_t v14 = sub_21198();
    uint64_t v16 = v15;

    uint64_t v20 = v14;
    uint64_t v21 = v16;
    sub_2820();
    uint64_t v20 = sub_20E38();
    uint64_t v21 = v17;
    char v22 = v18 & 1;
    uint64_t v23 = v19;
    __chkstk_darwin(v20);
    *(&v20 - 4) = a1;
    *(&v20 - 3) = (uint64_t)a2;
    *(&v20 - 2) = a3;
    sub_3238(&qword_30750);
    sub_3288();
    sub_21108();
    return (id)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_3148(void *a1, void *a2, uint64_t a3)
{
  id v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  swift_bridgeObjectRetain_n();
  id v7 = a1;
  id v8 = a2;
  sub_3238(&qword_30768);
  sub_33DC();
  sub_32FC();
  sub_3438();
  return sub_210F8();
}

id sub_322C@<X0>(uint64_t a1@<X8>)
{
  return sub_2F7C(*(void *)v1, *(void **)(v1 + 8), *(void *)(v1 + 16), a1);
}

uint64_t sub_3238(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_327C()
{
  return sub_3148(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_3288()
{
  unint64_t result = qword_30758;
  if (!qword_30758)
  {
    sub_28D4(&qword_30750);
    sub_32FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30758);
  }
  return result;
}

unint64_t sub_32FC()
{
  unint64_t result = qword_30760;
  if (!qword_30760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30760);
  }
  return result;
}

uint64_t sub_3350()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

id sub_3398@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  id v6 = *(id *)(v2 + 16);
  id v3 = *a1;
  *a2 = *a1;
  a2[1] = v6;
  id v4 = v3;

  return v6;
}

unint64_t sub_33DC()
{
  unint64_t result = qword_30770;
  if (!qword_30770)
  {
    sub_28D4(&qword_30768);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30770);
  }
  return result;
}

unint64_t sub_3438()
{
  unint64_t result = qword_30778;
  if (!qword_30778)
  {
    sub_3490();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30778);
  }
  return result;
}

unint64_t sub_3490()
{
  unint64_t result = qword_30780;
  if (!qword_30780)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_30780);
  }
  return result;
}

unint64_t sub_34D4()
{
  unint64_t result = qword_30788;
  if (!qword_30788)
  {
    sub_28D4((uint64_t *)&unk_30740);
    sub_3288();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30788);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsSpecifierView()
{
  return &type metadata for SettingsSpecifierView;
}

uint64_t sub_356C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_3588(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a1;
  id v6 = (char *)[v5 cellType];
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (v6 == (unsigned char *)&dword_4 + 2)
    {
      sub_3490();
      sub_3A98();
      id v13 = v5;
      sub_20B98();
      uint64_t v15 = v14;
      sub_3958();
      sub_39AC();
      id v16 = v15;
      sub_20CD8();
      sub_3238(&qword_30790);
      sub_38DC();
      sub_20CD8();
    }
    else
    {
      sub_3238(&qword_30790);
      sub_38DC();
      sub_20CD8();
    }
  }
  else
  {
    sub_3490();
    sub_3A98();
    id v7 = v5;
    id v8 = a2;
    sub_20B98();
    uint64_t v10 = v9;
    sub_3958();
    sub_39AC();
    id v11 = v8;
    id v12 = v10;
    sub_20CD8();
    sub_3238(&qword_30790);
    sub_38DC();
    sub_20CD8();
  }
  *(void *)a3 = v5;
  *(_OWORD *)(a3 + 8) = v18;
  *(void *)(a3 + 24) = v19;
  *(unsigned char *)(a3 + 32) = v20;
  *(unsigned char *)(a3 + 33) = v21;
  id v17 = v5;
  sub_3A00((id)v18, *((void **)&v18 + 1), v19, v20, v21);
  sub_3A4C((void *)v18, *((uint64_t *)&v18 + 1), (uint64_t)v19, v20, v21);
}

__n128 sub_385C@<Q0>(__n128 *a1@<X8>)
{
  id v4 = *(void **)v1;
  id v3 = *(void **)(v1 + 8);
  uint64_t v5 = sub_20C88();
  sub_3588(v4, v3, (uint64_t)&v11);
  unint64_t v6 = v11;
  unint64_t v7 = v13;
  unsigned __int8 v8 = v14;
  unsigned __int8 v9 = v15;
  __n128 result = v12;
  a1->n128_u64[0] = v5;
  a1->n128_u64[1] = 0;
  a1[1].n128_u8[0] = 1;
  a1[1].n128_u64[1] = v6;
  a1[2] = result;
  a1[3].n128_u64[0] = v7;
  a1[3].n128_u8[8] = v8;
  a1[3].n128_u8[9] = v9;
  return result;
}

unint64_t sub_38DC()
{
  unint64_t result = qword_30798;
  if (!qword_30798)
  {
    sub_28D4(&qword_30790);
    sub_3958();
    sub_39AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30798);
  }
  return result;
}

unint64_t sub_3958()
{
  unint64_t result = qword_307A0;
  if (!qword_307A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_307A0);
  }
  return result;
}

unint64_t sub_39AC()
{
  unint64_t result = qword_307A8;
  if (!qword_307A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_307A8);
  }
  return result;
}

id sub_3A00(id result, void *a2, void *a3, char a4, char a5)
{
  if ((a5 & 1) == 0) {
    return sub_3A10(result, a2, a3, a4 & 1);
  }
  return result;
}

id sub_3A10(void *a1, void *a2, void *a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    id v6 = a1;
    a2 = a3;
    uint64_t v4 = vars8;
  }
  return a2;
}

void *sub_3A4C(void *result, uint64_t a2, uint64_t a3, char a4, char a5)
{
  if ((a5 & 1) == 0) {
    return (void *)sub_3A5C(result, a2, a3, a4 & 1);
  }
  return result;
}

uint64_t sub_3A5C(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0)
  {

    uint64_t v4 = vars8;
  }
  return _objc_release_x1();
}

unint64_t sub_3A98()
{
  unint64_t result = qword_307B8;
  if (!qword_307B8)
  {
    sub_3490();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_307B8);
  }
  return result;
}

unint64_t sub_3AF4()
{
  unint64_t result = qword_307C0;
  if (!qword_307C0)
  {
    sub_28D4(&qword_307C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_307C0);
  }
  return result;
}

id sub_3B50()
{
  uint64_t v1 = OBJC_IVAR____TtC22PodcastsSettingsPlugin28GlobalSettingsViewController____lazy_storage___hostingController;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC22PodcastsSettingsPlugin28GlobalSettingsViewController____lazy_storage___hostingController];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC22PodcastsSettingsPlugin28GlobalSettingsViewController____lazy_storage___hostingController];
  }
  else
  {
    uint64_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for GlobalSettingsHostingController());
    uint64_t v5 = (void *)sub_417C(v0, v4);
    id v6 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

uint64_t sub_3C80(uint64_t result, uint64_t (*a2)(uint64_t))
{
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v3 = result;
  sub_21418();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_4070((uint64_t)v9), (v5 & 1) != 0))
  {
    sub_4448(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_4394((uint64_t)v9);
  if (!*((void *)&v11 + 1))
  {
    unint64_t result = sub_43E8((uint64_t)&v10);
    goto LABEL_14;
  }
  unint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_14;
  }
  if (sub_20948() == 1752457584 && v6 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v7 = sub_21508();
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
    if ((v7 & 1) == 0) {
      goto LABEL_14;
    }
  }
  id v8 = sub_3B50();
  swift_retain();

  sub_20938();
  unint64_t result = swift_release();
LABEL_14:
  if (a2) {
    return a2(result);
  }
LABEL_17:
  __break(1u);
  return result;
}

id sub_4008()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GlobalSettingsViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GlobalSettingsViewController()
{
  return self;
}

unint64_t sub_4070(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_213F8(*(void *)(v2 + 40));

  return sub_40B4(a1, v4);
}

unint64_t sub_40B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_44A4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_21408();
      sub_4394((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_417C(void *a1, char *a2)
{
  uint64_t v4 = qword_30AF8;
  sub_20968();
  swift_allocObject();
  uint64_t v5 = a2;
  *(void *)&a2[v4] = sub_20958();
  id v6 = a1;
  swift_retain();
  sub_21358();
  sub_21368();
  sub_42E4();
  sub_20B98();
  sub_21198();
  id v7 = [self _applePodcastsFoundationSharedUserDefaults];
  sub_20AC8();

  swift_retain();
  swift_retain();
  uint64_t v8 = sub_20CB8();
  swift_release();
  swift_release();

  return v8;
}

unint64_t sub_42E4()
{
  unint64_t result = qword_30D80;
  if (!qword_30D80)
  {
    sub_20968();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30D80);
  }
  return result;
}

uint64_t sub_433C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_434C()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_4384()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_4394(uint64_t a1)
{
  return a1;
}

uint64_t sub_43E8(uint64_t a1)
{
  uint64_t v2 = sub_3238(&qword_30800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_4448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_44A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ! prefix(_:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  *(unsigned char *)(v6 + 48) = a3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  *(unsigned char *)(v7 + 48) = a3;
  swift_retain_n();
  swift_retain_n();
  sub_210B8();
  return v9;
}

uint64_t sub_45EC@<X0>(BOOL *a1@<X8>)
{
  sub_3238(&qword_30808);
  uint64_t result = sub_21098();
  *a1 = (v3 & 1) == 0;
  return result;
}

uint64_t sub_4650()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_4698()
{
  return sub_210A8();
}

ValueMetadata *type metadata accessor for SettingsSpecifierImage()
{
  return &type metadata for SettingsSpecifierImage;
}

uint64_t sub_4708()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_4724()
{
  id v0 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
  id v1 = [self mainScreen];
  [v1 scale];
  double v3 = v2;

  [v0 setScale:v3];
  id result = [v0 setDrawBorder:1];
  qword_321B0 = (uint64_t)v0;
  return result;
}

uint64_t sub_47E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  id v53 = (id)sub_3238(&qword_30810);
  __chkstk_darwin(v53);
  v51 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_3238(&qword_30818);
  __chkstk_darwin(v59);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_3238(&qword_30820);
  uint64_t v52 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_3238(&qword_30828);
  __chkstk_darwin(v56);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_3238(&qword_30830);
  __chkstk_darwin(v54);
  long long v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_3238(&qword_30838);
  __chkstk_darwin(v58);
  unint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3238(&qword_30840);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_3238(&qword_30848);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v20 = (void *)sub_505C(a1);
  if (v20)
  {
    id v53 = v20;
    sub_20FA8();
    uint64_t v21 = enum case for Image.TemplateRenderingMode.original(_:);
    uint64_t v22 = sub_20FC8();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v16, v21, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v16, 0, 1, v22);
    uint64_t v24 = sub_20FB8();
    swift_release();
    sub_54BC((uint64_t)v16, &qword_30840);
    uint64_t v60 = v24;
    sub_20EB8();
    swift_release();
    sub_53F0((uint64_t)v19, (uint64_t)v11, &qword_30848);
    swift_storeEnumTagMultiPayload();
    sub_52A0();
    sub_5208();
    sub_20CD8();
    sub_53F0((uint64_t)v13, (uint64_t)v9, &qword_30838);
    swift_storeEnumTagMultiPayload();
    sub_5264();
    sub_5374();
    sub_20CD8();

    sub_54BC((uint64_t)v13, &qword_30838);
    uint64_t v25 = (uint64_t)v19;
    v26 = &qword_30848;
    return sub_54BC(v25, v26);
  }
  uint64_t v47 = v17;
  v48 = v13;
  v46 = v5;
  uint64_t v28 = v52;
  v49 = v7;
  v50 = v9;
  uint64_t v29 = v55;
  sub_513C(a1, &PSIconUTTypeIdentifierKey);
  if (v30)
  {
    id v31 = objc_allocWithZone((Class)ISIcon);
    NSString v32 = sub_21178();
    swift_bridgeObjectRelease();
    [v31 initWithType:v32];

    if (qword_305E0 != -1) {
      swift_once();
    }
    id v33 = (id)qword_321B0;
    v34 = v49;
    sub_20A18();
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v11, v34, v29);
    swift_storeEnumTagMultiPayload();
    sub_52A0();
    sub_5208();
    uint64_t v35 = (uint64_t)v48;
    sub_20CD8();
    sub_53F0(v35, (uint64_t)v50, &qword_30838);
    swift_storeEnumTagMultiPayload();
    sub_5264();
    sub_5374();
    sub_20CD8();
    sub_54BC(v35, &qword_30838);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v34, v29);
  }
  else
  {
    sub_513C(a1, &PSLazyIconAppID);
    if (!v36)
    {
      swift_storeEnumTagMultiPayload();
      sub_5208();
      uint64_t v44 = (uint64_t)v46;
      sub_20CD8();
      sub_53F0(v44, (uint64_t)v50, &qword_30818);
      swift_storeEnumTagMultiPayload();
      sub_5264();
      sub_5374();
      sub_20CD8();
      uint64_t v25 = v44;
      v26 = &qword_30818;
      return sub_54BC(v25, v26);
    }
    uint64_t v37 = v28;
    id v38 = objc_allocWithZone((Class)ISIcon);
    NSString v39 = sub_21178();
    swift_bridgeObjectRelease();
    [v38 initWithBundleIdentifier:v39];

    uint64_t v40 = (uint64_t)v50;
    uint64_t v41 = (uint64_t)v46;
    if (qword_305E0 != -1) {
      swift_once();
    }
    id v42 = (id)qword_321B0;
    v43 = v49;
    sub_20A18();
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v51, v43, v29);
    swift_storeEnumTagMultiPayload();
    sub_5208();
    sub_20CD8();
    sub_53F0(v41, v40, &qword_30818);
    swift_storeEnumTagMultiPayload();
    sub_5264();
    sub_5374();
    sub_20CD8();
    sub_54BC(v41, &qword_30818);
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v43, v29);
  }
}

uint64_t sub_505C(void *a1)
{
  if ([a1 propertyForKey:PSIconImageKey])
  {
    sub_213D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_5454((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_5518();
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_54BC((uint64_t)v4, &qword_30800);
    return 0;
  }
}

uint64_t sub_5124(void *a1)
{
  return sub_513C(a1, &PSIconUTTypeIdentifierKey);
}

uint64_t sub_5130(void *a1)
{
  return sub_513C(a1, &PSLazyIconAppID);
}

uint64_t sub_513C(void *a1, void *a2)
{
  if ([a1 propertyForKey:*a2])
  {
    sub_213D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_5454((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_54BC((uint64_t)v5, &qword_30800);
    return 0;
  }
}

uint64_t sub_5200@<X0>(uint64_t a1@<X8>)
{
  return sub_47E4(*v1, a1);
}

unint64_t sub_5208()
{
  unint64_t result = qword_30850;
  if (!qword_30850)
  {
    sub_28D4(&qword_30820);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30850);
  }
  return result;
}

uint64_t sub_5264()
{
  return sub_55A8(&qword_30858, &qword_30838, (void (*)(void))sub_52A0, (void (*)(void))sub_5208);
}

unint64_t sub_52A0()
{
  unint64_t result = qword_30860;
  if (!qword_30860)
  {
    sub_28D4(&qword_30848);
    sub_531C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30860);
  }
  return result;
}

unint64_t sub_531C()
{
  unint64_t result = qword_30868;
  if (!qword_30868)
  {
    sub_20DB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30868);
  }
  return result;
}

unint64_t sub_5374()
{
  unint64_t result = qword_30870;
  if (!qword_30870)
  {
    sub_28D4(&qword_30818);
    sub_5208();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30870);
  }
  return result;
}

uint64_t sub_53F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3238(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_5454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238(&qword_30800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_54BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3238(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_5518()
{
  unint64_t result = qword_30878;
  if (!qword_30878)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_30878);
  }
  return result;
}

uint64_t sub_5558()
{
  return sub_55A8(&qword_30880, &qword_30888, (void (*)(void))sub_5264, (void (*)(void))sub_5374);
}

uint64_t sub_55A8(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_28D4(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SettingsSpecifierLinkCell(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  id v7 = v5;
  return a1;
}

void destroy for SettingsSpecifierLinkCell(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t assignWithCopy for SettingsSpecifierLinkCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  id v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for SettingsSpecifierLinkCell(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  id v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;

  return a1;
}

ValueMetadata *type metadata accessor for SettingsSpecifierLinkCell()
{
  return &type metadata for SettingsSpecifierLinkCell;
}

uint64_t sub_5760()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_577C@<X0>(void *a1@<X0>, void *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v20 = a3;
  uint64_t v5 = sub_3238(&qword_308E0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3238(&qword_30890);
  __chkstk_darwin(v9);
  long long v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a2;
  uint64_t v24 = a1;
  id v12 = a2;
  id v13 = a1;
  id result = [v12 name];
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v16 = sub_21198();
    uint64_t v18 = v17;

    uint64_t v21 = v16;
    uint64_t v22 = v18;
    sub_2AC0();
    sub_2820();
    sub_20EE8();

    swift_bridgeObjectRelease();
    LOBYTE(v15) = sub_20DD8();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v5);
    v11[*(int *)(v9 + 36)] = (char)v15;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (id)sub_66A0((uint64_t)v11, v20);
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_597C@<D0>(id a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)[a1 cellType];
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v11 = sub_20C88();
    sub_602C(a1, (uint64_t)v29);
    long long v12 = *(_OWORD *)v29;
    uint64_t v13 = v29[16];
    char v27 = v29[16];
    uint64_t v14 = *(void *)&v29[24];
    long long v15 = *(_OWORD *)&v29[32];
    long long v16 = *(_OWORD *)v30;
    long long v17 = *(_OWORD *)&v30[16];
    *(_OWORD *)&v29[8] = xmmword_21FD0;
    *(void *)uint64_t v29 = v11;
    *(_OWORD *)&v29[24] = v12;
    *(void *)&v29[40] = v13;
    *(void *)uint64_t v30 = v14;
    char v28 = v30[16];
    *(_OWORD *)&v30[8] = v15;
    *(_OWORD *)&v30[24] = v16;
    *(_OWORD *)&v30[40] = v17;
    char v31 = 1;
    sub_6558(v12, *((uint64_t *)&v12 + 1), v13);
    swift_bridgeObjectRetain();
    sub_6568(v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1));
    sub_3238(&qword_308C0);
    sub_3238(&qword_308D0);
    sub_6744(&qword_308B8, &qword_308C0);
    sub_6744(&qword_308C8, &qword_308D0);
    sub_20CD8();
    sub_3238(&qword_308B0);
    sub_63D8();
    sub_20CD8();
    sub_65B8(v12, *((uint64_t *)&v12 + 1), v27);
    swift_bridgeObjectRelease();
    sub_65C8(v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v28, *((uint64_t *)&v17 + 1));
  }
  else if (v4 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v5 = sub_20CA8();
    sub_5DF8(a1, (uint64_t)v29);
    long long v6 = *(_OWORD *)v29;
    uint64_t v7 = v29[16];
    uint64_t v8 = *(void *)&v29[24];
    long long v9 = *(_OWORD *)&v29[32];
    long long v10 = *(_OWORD *)v30;
    *(_OWORD *)&v29[8] = xmmword_21FD0;
    *(void *)uint64_t v29 = v5;
    *(_OWORD *)&v29[24] = v6;
    *(void *)&v29[40] = v7;
    *(void *)uint64_t v30 = v8;
    *(_OWORD *)&v30[8] = v9;
    *(_OWORD *)&v30[24] = v10;
    *(void *)&v30[40] = 0;
    *(void *)&v30[48] = 0;
    char v31 = 0;
    sub_6558(v6, *((uint64_t *)&v6 + 1), v7);
    swift_bridgeObjectRetain();
    sub_6618(v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
    sub_3238(&qword_308C0);
    sub_3238(&qword_308D0);
    sub_6744(&qword_308B8, &qword_308C0);
    sub_6744(&qword_308C8, &qword_308D0);
    sub_20CD8();
    sub_3238(&qword_308B0);
    sub_63D8();
    sub_20CD8();
    sub_65B8(v6, *((uint64_t *)&v6 + 1), v7);
    swift_bridgeObjectRelease();
    sub_665C(v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
  }
  else
  {
    sub_3238(&qword_308B0);
    sub_63D8();
    sub_20CD8();
  }
  double result = *(double *)v29;
  long long v19 = *(_OWORD *)&v29[16];
  long long v20 = *(_OWORD *)&v29[32];
  long long v21 = *(_OWORD *)v30;
  long long v22 = *(_OWORD *)&v30[16];
  long long v23 = *(_OWORD *)&v30[32];
  uint64_t v24 = *(void *)&v30[48];
  char v25 = v31;
  char v26 = v32;
  *(_OWORD *)a2 = *(_OWORD *)v29;
  *(_OWORD *)(a2 + 16) = v19;
  *(_OWORD *)(a2 + 32) = v20;
  *(_OWORD *)(a2 + 48) = v21;
  *(_OWORD *)(a2 + 64) = v22;
  *(_OWORD *)(a2 + 80) = v23;
  *(void *)(a2 + 96) = v24;
  *(unsigned char *)(a2 + 104) = v25;
  *(unsigned char *)(a2 + 105) = v26;
  return result;
}

id sub_5DF8@<X0>(id a1@<X2>, uint64_t a2@<X8>)
{
  id result = [a1 name];
  if (result)
  {
    uint64_t v5 = result;
    sub_21198();

    sub_2820();
    uint64_t v6 = sub_20E38();
    uint64_t v8 = v7;
    char v10 = v9;
    uint64_t v12 = v11;
    id v13 = a1;
    sub_1F014();
    uint64_t v15 = v14;

    if (v15)
    {
      uint64_t v16 = sub_20E38();
      uint64_t v18 = v17;
      char v20 = v19 & 1;
      sub_20F78();
      uint64_t v38 = v8;
      uint64_t v21 = sub_20E08();
      char v37 = v10;
      uint64_t v23 = v22;
      uint64_t v39 = v12;
      char v25 = v24;
      swift_release();
      sub_65B8(v16, v18, v20);
      swift_bridgeObjectRelease();
      sub_20DE8();
      uint64_t v26 = sub_20E28();
      uint64_t v28 = v27;
      char v30 = v29;
      uint64_t v15 = v31;
      swift_release();
      uint64_t v32 = v30 & 1;
      uint64_t v33 = v21;
      uint64_t v8 = v38;
      uint64_t v34 = v23;
      char v10 = v37;
      char v35 = v25 & 1;
      uint64_t v12 = v39;
      sub_65B8(v33, v34, v35);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v28 = 0;
      uint64_t v32 = 0;
    }
    char v36 = v10 & 1;
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v8;
    *(unsigned char *)(a2 + 16) = v36;
    *(void *)(a2 + 24) = v12;
    *(void *)(a2 + 32) = v26;
    *(void *)(a2 + 40) = v28;
    *(void *)(a2 + 48) = v32;
    *(void *)(a2 + 56) = v15;
    sub_6558(v6, v8, v36);
    swift_bridgeObjectRetain();
    sub_6618(v26, v28, v32, v15);
    sub_665C(v26, v28, v32, v15);
    sub_65B8(v6, v8, v36);
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_602C@<X0>(id a1@<X2>, uint64_t a2@<X8>)
{
  id result = [a1 name];
  if (result)
  {
    uint64_t v5 = result;
    sub_21198();

    sub_2820();
    uint64_t v6 = sub_20E38();
    uint64_t v8 = v7;
    char v10 = v9;
    uint64_t v12 = v11;
    id v13 = a1;
    sub_1F014();
    uint64_t v15 = v14;

    if (v15)
    {
      uint64_t v16 = sub_20E38();
      uint64_t v33 = v8;
      uint64_t v32 = v17;
      uint64_t v34 = v12;
      char v19 = v18 & 1;
      sub_20F78();
      uint64_t v20 = sub_20E08();
      uint64_t v22 = v21;
      char v23 = v10;
      uint64_t v24 = v6;
      char v26 = v25;
      uint64_t v15 = v27;
      swift_release();
      uint64_t v28 = v26 & 1;
      uint64_t v6 = v24;
      char v10 = v23;
      char v29 = v19;
      uint64_t v8 = v33;
      uint64_t v12 = v34;
      sub_65B8(v16, v32, v29);
      swift_bridgeObjectRelease();
      sub_6558(v20, v22, v28);
      swift_bridgeObjectRetain();
      sub_65B8(v20, v22, v28);
      swift_bridgeObjectRelease();
      uint64_t v30 = 1;
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      uint64_t v28 = 0;
    }
    char v31 = v10 & 1;
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v8;
    *(unsigned char *)(a2 + 16) = v31;
    *(void *)(a2 + 24) = v12;
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = v30;
    *(void *)(a2 + 48) = v20;
    *(void *)(a2 + 56) = v22;
    *(void *)(a2 + 64) = v28;
    *(void *)(a2 + 72) = v15;
    sub_6558(v6, v8, v31);
    swift_bridgeObjectRetain();
    sub_6568(0, v30, v20, v22, v28, v15);
    sub_65C8(0, v30, v20, v22, v28, v15);
    sub_65B8(v6, v8, v31);
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_6260()
{
  uint64_t v1 = sub_3238(&qword_30890);
  __chkstk_darwin(v1);
  uint64_t v3 = *(void *)(v0 + 8);
  uint64_t v4 = *(void **)(v0 + 16);
  uint64_t v7 = *(void **)v0;
  uint64_t v8 = v3;
  char v9 = v4;
  sub_577C(v7, v4, (uint64_t)&v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  sub_3238(&qword_30898);
  sub_635C();
  sub_649C();
  return sub_20B88();
}

double sub_6350@<D0>(uint64_t a1@<X8>)
{
  return sub_597C(*(id *)(v1 + 32), a1);
}

unint64_t sub_635C()
{
  unint64_t result = qword_308A0;
  if (!qword_308A0)
  {
    sub_28D4(&qword_30898);
    sub_63D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_308A0);
  }
  return result;
}

unint64_t sub_63D8()
{
  unint64_t result = qword_308A8;
  if (!qword_308A8)
  {
    sub_28D4(&qword_308B0);
    sub_6744(&qword_308B8, &qword_308C0);
    sub_6744(&qword_308C8, &qword_308D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_308A8);
  }
  return result;
}

unint64_t sub_649C()
{
  unint64_t result = qword_308D8;
  if (!qword_308D8)
  {
    sub_28D4(&qword_30890);
    sub_2AC0();
    sub_2820();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_308D8);
  }
  return result;
}

uint64_t sub_6558(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_6568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  if (a6)
  {
    sub_6558(a3, a4, a5 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_65B8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_65C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  if (a6)
  {
    sub_65B8(a3, a4, a5 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_6618(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_6558(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_665C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_65B8(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_66A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238(&qword_30890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_6708()
{
  return sub_6744(&qword_308E8, (uint64_t *)&unk_308F0);
}

uint64_t sub_6744(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_28D4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_678C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20A88();
  swift_release();
  swift_release();
  return v1;
}

char *sub_6800()
{
  uint64_t v1 = sub_3238((uint64_t *)&unk_309C0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = &v0[OBJC_IVAR____TtC22PodcastsSettingsPlugin14SpecifierState__specifierSections];
  uint64_t v20 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v6 = v0;
  sub_3238(&qword_30E00);
  sub_20A78();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  uint64_t v7 = OBJC_IVAR____TtC22PodcastsSettingsPlugin14SpecifierState_systemPolicy;
  sub_21198();
  id v8 = objc_allocWithZone((Class)PSSystemPolicyForApp);
  NSString v9 = sub_21178();
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithBundleIdentifier:v9];

  *(void *)&v6[v7] = v10;
  uint64_t v11 = (objc_class *)type metadata accessor for SpecifierState();
  v19.receiver = v6;
  v19.super_class = v11;
  id v12 = objc_msgSendSuper2(&v19, "init");
  id v13 = sub_6A34();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v20 = v13;
  uint64_t v14 = (char *)v12;
  sub_20A98();
  uint64_t v15 = *(void **)&v14[OBJC_IVAR____TtC22PodcastsSettingsPlugin14SpecifierState_systemPolicy];
  if (v15)
  {
    id v16 = v15;
    [v16 setDelegate:v14];
  }
  return v14;
}

char *sub_6A34()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22PodcastsSettingsPlugin14SpecifierState_systemPolicy];
  if (!v1
    || (id v2 = [v1 specifiers]) == 0
    || (uint64_t v3 = v2, v0 = (char *)sub_21208(),
                 v3,
                 id v4 = sub_6D7C((uint64_t)v0),
                 swift_bridgeObjectRelease(),
                 !v4))
  {
    swift_bridgeObjectRelease();
    id v4 = &_swiftEmptyArrayStorage;
  }
  if (!((unint64_t)v4 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + ((unint64_t)v4 & 0xFFFFFFFFFFFFFF8));
    if (v5) {
      goto LABEL_7;
    }
LABEL_32:
    swift_bridgeObjectRelease();
    uint64_t v22 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_33;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_214E8();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_32;
  }
LABEL_7:
  if (v5 < 1)
  {
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v22 = (char *)&_swiftEmptyArrayStorage;
  id v8 = (SEL *)&unk_30000;
  do
  {
    if (((unint64_t)v4 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_21458();
    }
    else {
      id v9 = *((id *)v4 + v7 + 4);
    }
    id v10 = v9;
    objc_msgSend(v9, "loadValuesAndTitlesFromDataSource", v22);
    sub_1F38C();
    if ([v10 v8[68]])
    {
      id v11 = v10;
      sub_211F8();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_21228();
      }
      sub_21238();
      sub_21218();
    }
    else if (v6)
    {
      id v12 = v6;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        id v13 = v22;
      }
      else {
        id v13 = sub_7358(0, *((void *)v22 + 2) + 1, 1, v22);
      }
      unint64_t v15 = *((void *)v13 + 2);
      unint64_t v14 = *((void *)v13 + 3);
      if (v15 >= v14 >> 1) {
        id v13 = sub_7358((char *)(v14 > 1), v15 + 1, 1, v13);
      }
      *((void *)v13 + 2) = v15 + 1;
      uint64_t v22 = v13;
      id v16 = &v13[16 * v15];
      *((void *)v16 + 4) = v12;
      *((void *)v16 + 5) = &_swiftEmptyArrayStorage;

      uint64_t v6 = v10;
      id v8 = (SEL *)&unk_30000;
    }
    else
    {
      uint64_t v6 = v10;
    }
    ++v7;
  }
  while (v5 != v7);
  swift_bridgeObjectRelease();
  uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
  if (!v6)
  {
LABEL_33:
    swift_bridgeObjectRelease();
    return v22;
  }
  id v4 = v6;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
LABEL_36:
    uint64_t v17 = sub_7358(0, *((void *)v22 + 2) + 1, 1, v22);
    goto LABEL_28;
  }
  uint64_t v17 = v22;
LABEL_28:
  unint64_t v19 = *((void *)v17 + 2);
  unint64_t v18 = *((void *)v17 + 3);
  if (v19 >= v18 >> 1) {
    uint64_t v17 = sub_7358((char *)(v18 > 1), v19 + 1, 1, v17);
  }
  *((void *)v17 + 2) = v19 + 1;
  uint64_t v20 = &v17[16 * v19];
  *((void *)v20 + 4) = v4;
  *((void *)v20 + 5) = v0;

  return v17;
}

void *sub_6D7C(uint64_t a1)
{
  uint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_21498();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_4448(i, (uint64_t)v5);
    sub_3490();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_21478();
    sub_214A8();
    sub_214B8();
    sub_21488();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

id sub_6E78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpecifierState();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_6F34()
{
  return type metadata accessor for SpecifierState();
}

uint64_t type metadata accessor for SpecifierState()
{
  uint64_t result = qword_30930;
  if (!qword_30930) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_6F88()
{
  sub_7020();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_7020()
{
  if (!qword_30940)
  {
    sub_28D4(&qword_30E00);
    unint64_t v0 = sub_20AA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_30940);
    }
  }
}

uint64_t sub_707C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SpecifierState();
  uint64_t result = sub_20A68();
  *a1 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for GlobalSettingsSpecifierSection(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GlobalSettingsSpecifierSection(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for GlobalSettingsSpecifierSection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for GlobalSettingsSpecifierSection(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for GlobalSettingsSpecifierSection()
{
  return &type metadata for GlobalSettingsSpecifierSection;
}

void *sub_724C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_7258@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20A88();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_72DC(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_20A98();
}

char *sub_7358(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_3238(&qword_309B8);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      id v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      id v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_7468(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_7468(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_214F8();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ExternalControlsPickerSection()
{
  return &type metadata for ExternalControlsPickerSection;
}

uint64_t sub_7574()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_7590()
{
  v1._object = (void *)0x8000000000026980;
  v1._countAndFlagsBits = 0xD000000000000011;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  sub_209B8(v1, v3);
  v2._countAndFlagsBits = 0xD000000000000015;
  v2._object = (void *)0x80000000000269A0;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_209B8(v2, v4);
  sub_3238(&qword_309D0);
  sub_28D4(&qword_309D8);
  sub_28D4(&qword_309E0);
  sub_20C78();
  sub_6744(&qword_309E8, &qword_309E0);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return sub_21118();
}

uint64_t sub_773C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_20C78();
  uint64_t v18 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::String v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3238(&qword_309E0);
  uint64_t v15 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3238(&qword_309D8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  __chkstk_darwin(v7);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_20C98();
  sub_20AF8();
  sub_3238(&qword_309F0);
  sub_6744(&qword_309F8, &qword_309F0);
  sub_21048();
  sub_20C68();
  uint64_t v11 = sub_6744(&qword_309E8, &qword_309E0);
  sub_20E88();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v4);
  uint64_t v20 = v4;
  uint64_t v21 = v1;
  uint64_t v22 = v11;
  char v23 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = v16;
  sub_20E98();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v10, v12);
}

uint64_t sub_7AAC@<X0>(uint64_t a1@<X8>)
{
  v10._countAndFlagsBits = 0x4552505F5458454ELL;
  v10._object = (void *)0xE900000000000056;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_209B8(v10, v12);
  uint64_t v4 = v3;
  v11._countAndFlagsBits = 0x5F44524157524F46;
  v11._object = (void *)0xEC0000004B434142;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  uint64_t v5 = sub_209B8(v11, v13);
  uint64_t v7 = v6;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  *(_WORD *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = &_swiftEmptyArrayStorage;
  *(_WORD *)(a1 + 72) = 257;
  sub_6558(v2, v4, 0);
  swift_bridgeObjectRetain();
  sub_6558(v5, v7, 0);
  swift_bridgeObjectRetain();
  sub_65B8(v5, v7, 0);
  swift_bridgeObjectRelease();
  sub_65B8(v2, v4, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_7BD0()
{
  return sub_7590();
}

uint64_t sub_7BD8@<X0>(uint64_t a1@<X8>)
{
  return sub_773C(a1);
}

unint64_t sub_7BE4()
{
  unint64_t result = qword_30A00;
  if (!qword_30A00)
  {
    sub_28D4(&qword_30A08);
    sub_28D4(&qword_309D8);
    sub_28D4(&qword_309E0);
    sub_20C78();
    sub_6744(&qword_309E8, &qword_309E0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30A00);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ConfirmationStyle(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ConfirmationStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConfirmationStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x7E84);
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

uint64_t sub_7EAC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_7EB4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationStyle()
{
  return &type metadata for ConfirmationStyle;
}

unint64_t sub_7ED4()
{
  unint64_t result = qword_30A10;
  if (!qword_30A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30A10);
  }
  return result;
}

BOOL sub_7F28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_7F40()
{
  Swift::UInt v1 = *v0;
  sub_21528();
  sub_21538(v1);
  return sub_21548();
}

void sub_7F88()
{
  sub_21538(*v0);
}

Swift::Int sub_7FB4()
{
  Swift::UInt v1 = *v0;
  sub_21528();
  sub_21538(v1);
  return sub_21548();
}

uint64_t *sub_7FF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    BOOL v7 = (uint64_t *)((char *)a1 + v6);
    int v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    sub_3238(&qword_30A18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_209E8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_8110(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_209E8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_81C8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  swift_retain();
  sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_209E8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    *uint64_t v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_8290(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    int v8 = (void *)((char *)a2 + v6);
    sub_54BC((uint64_t)a1 + v6, &qword_30A18);
    sub_3238(&qword_30A18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_209E8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_8384(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_209E8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_8458(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_54BC((uint64_t)a1 + v6, &qword_30A18);
    uint64_t v9 = sub_3238(&qword_30A18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_209E8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_8554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8568);
}

uint64_t sub_8568(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_3238(&qword_30A20);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    Swift::String v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_861C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8630);
}

void *sub_8630(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3238(&qword_30A20);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AutomaticDownloadsSettingsSection()
{
  uint64_t result = qword_30A80;
  if (!qword_30A80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_8728()
{
  sub_87C4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_87C4()
{
  if (!qword_30A90)
  {
    sub_209E8();
    unint64_t v0 = sub_20B58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_30A90);
    }
  }
}

uint64_t sub_881C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_8838()
{
  v1._countAndFlagsBits = 0xD000000000000013;
  v1._object = (void *)0x80000000000269C0;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  sub_209B8(v1, v3);
  v2._object = (void *)0x80000000000269E0;
  v2._countAndFlagsBits = 0xD000000000000011;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_209B8(v2, v4);
  sub_3238(&qword_30AC0);
  sub_8E88();
  return sub_21118();
}

uint64_t sub_8930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_20988();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v45 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v42 - v6;
  uint64_t v7 = type metadata accessor for AutomaticDownloadsSettingsSection();
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v42 + 64);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_209E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = sub_3238(&qword_30AD0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v43 = (uint64_t)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v42 - v20;
  sub_1DA9C((uint64_t)v16);
  sub_209D8();
  sub_8EE4();
  char v22 = sub_213E8();
  char v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  v23(v14, v10);
  v23(v16, v10);
  if (v22)
  {
    v51._object = (void *)0x8000000000026A00;
    v51._countAndFlagsBits = 0xD000000000000018;
    v52._countAndFlagsBits = 0;
    v52._object = (void *)0xE000000000000000;
    uint64_t v49 = sub_209B8(v51, v52);
    uint64_t v50 = v24;
    sub_8FA4(a1, (uint64_t)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_21268();
    uint64_t v25 = sub_21258();
    unint64_t v26 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v25;
    *(void *)(v27 + 24) = &protocol witness table for MainActor;
    sub_900C((uint64_t)v9, v27 + v26);
    sub_8FA4(a1, (uint64_t)v9);
    uint64_t v28 = sub_21258();
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v28;
    *(void *)(v29 + 24) = &protocol witness table for MainActor;
    sub_900C((uint64_t)v9, v29 + v26);
    sub_210B8();
    sub_2820();
    sub_21088();
    uint64_t v30 = sub_3238((uint64_t *)&unk_30BF0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v21, 0, 1, v30);
  }
  else
  {
    uint64_t v31 = sub_3238((uint64_t *)&unk_30BF0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v21, 1, 1, v31);
  }
  uint64_t v32 = v44;
  sub_20978();
  uint64_t v33 = v43;
  sub_8F3C((uint64_t)v21, v43);
  uint64_t v35 = v47;
  uint64_t v34 = v48;
  char v36 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
  char v37 = v45;
  v36(v45, v32, v48);
  uint64_t v38 = v46;
  sub_8F3C(v33, v46);
  uint64_t v39 = sub_3238(&qword_30AE0);
  v36((char *)(v38 + *(int *)(v39 + 48)), v37, v34);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v35 + 8);
  v40(v32, v34);
  sub_54BC((uint64_t)v21, &qword_30AD0);
  v40(v37, v34);
  return sub_54BC(v33, &qword_30AD0);
}

uint64_t sub_8E80@<X0>(uint64_t a1@<X8>)
{
  return sub_8930(*(void *)(v1 + 16), a1);
}

unint64_t sub_8E88()
{
  unint64_t result = qword_30AC8;
  if (!qword_30AC8)
  {
    sub_28D4(&qword_30AC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30AC8);
  }
  return result;
}

unint64_t sub_8EE4()
{
  unint64_t result = qword_30AD8;
  if (!qword_30AD8)
  {
    sub_209E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30AD8);
  }
  return result;
}

uint64_t sub_8F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238(&qword_30AD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutomaticDownloadsSettingsSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_900C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutomaticDownloadsSettingsSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_9070@<X0>(BOOL *a1@<X8>)
{
  type metadata accessor for AutomaticDownloadsSettingsSection();
  uint64_t result = sub_20AD8();
  *a1 = (v3 & 1) == 0;
  return result;
}

uint64_t sub_90F8()
{
  uint64_t v1 = (int *)(type metadata accessor for AutomaticDownloadsSettingsSection() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  swift_unknownObjectRelease();
  swift_release();
  unint64_t v3 = v0 + v2 + v1[7];
  sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_209E8();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_9218()
{
  return sub_20AE8();
}

unint64_t sub_92A0()
{
  unint64_t result = qword_30AE8;
  if (!qword_30AE8)
  {
    sub_28D4(&qword_30AF0);
    sub_8E88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30AE8);
  }
  return result;
}

uint64_t type metadata accessor for GlobalSettingsHostingController()
{
  uint64_t result = qword_30B00;
  if (!qword_30B00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_936C()
{
  return swift_initClassMetadata2();
}

void sub_93BC(char *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = qword_30AF8;
  sub_20968();
  swift_allocObject();
  id v6 = a3;
  *(void *)&a1[v5] = sub_20958();

  sub_214D8();
  __break(1u);
}

uint64_t sub_9458()
{
  return swift_release();
}

id sub_9468()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GlobalSettingsHostingController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_94A0()
{
  return swift_release();
}

void sub_94B0()
{
}

void sub_94E0()
{
}

uint64_t sub_9510()
{
  return type metadata accessor for GlobalSettingsHostingController();
}

uint64_t sub_9518@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v2 = sub_209A8();
  uint64_t v56 = *(void *)(v2 - 8);
  uint64_t v57 = v2;
  __chkstk_darwin(v2);
  uint64_t v54 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3238(&qword_30B50);
  __chkstk_darwin(v4 - 8);
  uint64_t v55 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_208C8();
  uint64_t v52 = *(void *)(v6 - 8);
  uint64_t v53 = v6;
  __chkstk_darwin(v6);
  uint64_t v45 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_20888();
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v49 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_208E8();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_21168();
  __chkstk_darwin(v10 - 8);
  uint64_t v44 = sub_20898();
  uint64_t v47 = *(void *)(v44 - 8);
  uint64_t v48 = v44 - 8;
  uint64_t v58 = v47;
  __chkstk_darwin(v44 - 8);
  uint64_t v59 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_3238(&qword_30B58);
  uint64_t v42 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_3238(&qword_30B60);
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v38 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70._countAndFlagsBits = 0x59434156495250;
  v70._object = (void *)0xE700000000000000;
  v71._countAndFlagsBits = 0;
  v71._object = (void *)0xE000000000000000;
  uint64_t v66 = sub_209B8(v70, v71);
  uint64_t v67 = v15;
  char v68 = 0;
  v69 = &_swiftEmptyArrayStorage;
  id v65 = *(id *)(v1 + 32);
  uint64_t v60 = v1;
  id v16 = v65;
  sub_3238(&qword_30B68);
  uint64_t v17 = sub_28D4(&qword_30B70);
  uint64_t v18 = sub_28D4(&qword_30B78);
  unint64_t v19 = sub_ACA8();
  uint64_t v20 = sub_6744(&qword_30BA8, &qword_30B78);
  uint64_t v61 = v17;
  uint64_t v62 = v18;
  unint64_t v63 = v19;
  uint64_t v64 = v20;
  swift_getOpaqueTypeConformance2();
  sub_AD6C();
  uint64_t v40 = v13;
  sub_21118();
  sub_21158();
  sub_208D8();
  uint64_t v21 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  char v22 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 104);
  char v23 = v49;
  uint64_t v24 = v51;
  v22(v49, enum case for LocalizedStringResource.BundleDescription.main(_:), v51);
  sub_208A8();
  sub_3238(&qword_30BB8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22390;
  sub_21158();
  sub_208D8();
  v22(v23, v21, v24);
  sub_208A8();
  sub_21158();
  sub_208D8();
  v22(v23, v21, v24);
  uint64_t v25 = v52;
  sub_208A8();
  uint64_t v27 = v56;
  uint64_t v26 = v57;
  uint64_t v28 = v54;
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v54, enum case for PodcastsSettingsDeepLinkURLs.podcastsAndPrivacyURL(_:), v57);
  sub_20998();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v26);
  uint64_t v29 = v55;
  uint64_t v30 = v53;
  sub_208B8();
  uint64_t v31 = v29;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v29, 1, v30);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v33 = v45;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v45, v31, v30);
    sub_ADC0();
    uint64_t v34 = v38;
    uint64_t v35 = v59;
    uint64_t v36 = v43;
    char v37 = v40;
    sub_20E58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v33, v30);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v44);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v37, v36);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v46, v34, v41);
  }
  return result;
}

uint64_t sub_9DF4@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  v19[3] = a2;
  uint64_t v3 = sub_3238(&qword_30B90);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3238(&qword_30B70);
  v19[2] = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = *a1;
  long long v22 = a1[1];
  long long v23 = v10;
  uint64_t v11 = (void *)*((void *)a1 + 4);
  uint64_t v12 = swift_allocObject();
  long long v13 = a1[1];
  *(_OWORD *)(v12 + 16) = *a1;
  *(_OWORD *)(v12 + 32) = v13;
  *(void *)(v12 + 48) = *((void *)a1 + 4);
  sub_AED8((uint64_t)&v23);
  sub_AED8((uint64_t)&v22);
  id v14 = v11;
  sub_21038();
  long long v21 = v22;
  sub_3238(&qword_30BC8);
  sub_20FE8();
  LOBYTE(v11) = v20;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = (_BYTE)v11;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  uint64_t v17 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  *uint64_t v17 = KeyPath;
  v17[1] = (uint64_t)sub_AF6C;
  v17[2] = v16;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v19[1] = sub_20C98();
  long long v20 = v23;
  sub_21008();
  v19[6] = a1;
  sub_3238(&qword_30B78);
  sub_ACA8();
  sub_6744(&qword_30BA8, &qword_30B78);
  sub_20ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return sub_AF8C((uint64_t)v9);
}

uint64_t sub_A150@<X0>(uint64_t a1@<X8>)
{
  v1._object = (void *)0x8000000000026B80;
  v1._countAndFlagsBits = 0xD000000000000010;
  return sub_A640(v1, a1);
}

uint64_t sub_A16C@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = sub_3238(&qword_30BD0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3238(&qword_30B90);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  char v37 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v36 = (char *)&v35 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v35 = (char *)&v35 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v35 - v14;
  sub_20B08();
  uint64_t v16 = sub_20B38();
  uint64_t v17 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v5, 0, 1, v16);
  long long v18 = *a1;
  long long v39 = a1[1];
  long long v40 = v18;
  unint64_t v19 = (void *)*((void *)a1 + 4);
  uint64_t v20 = swift_allocObject();
  long long v21 = a1[1];
  *(_OWORD *)(v20 + 16) = *a1;
  *(_OWORD *)(v20 + 32) = v21;
  *(void *)(v20 + 48) = *((void *)a1 + 4);
  sub_AED8((uint64_t)&v40);
  sub_AED8((uint64_t)&v39);
  id v22 = v19;
  sub_21028();
  sub_20B28();
  v17(v5, 0, 1, v16);
  uint64_t v23 = swift_allocObject();
  long long v24 = a1[1];
  *(_OWORD *)(v23 + 16) = *a1;
  *(_OWORD *)(v23 + 32) = v24;
  *(void *)(v23 + 48) = *((void *)a1 + 4);
  sub_AED8((uint64_t)&v40);
  sub_AED8((uint64_t)&v39);
  id v25 = v22;
  uint64_t v26 = v35;
  sub_21028();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v28 = v36;
  v27(v36, v15, v6);
  uint64_t v29 = v37;
  uint64_t v30 = v26;
  v27(v37, v26, v6);
  uint64_t v31 = v38;
  v27(v38, v28, v6);
  uint64_t v32 = sub_3238(&qword_30BD8);
  v27(&v31[*(int *)(v32 + 48)], v29, v6);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v7 + 8);
  v33(v30, v6);
  v33(v15, v6);
  v33(v29, v6);
  return ((uint64_t (*)(char *, uint64_t))v33)(v28, v6);
}

uint64_t sub_A558()
{
  id v0 = [self _applePodcastsFoundationSharedUserDefaults];
  sub_20A08();
  sub_209F8();
  NSString v1 = sub_21178();
  swift_bridgeObjectRelease();
  [v0 setBool:1 forKey:v1];

  sub_3238(&qword_30BC8);
  return sub_20FF8();
}

uint64_t sub_A61C@<X0>(uint64_t a1@<X8>)
{
  v1._countAndFlagsBits = 0x415F4C45434E4143;
  v1._object = (void *)0xED00004E4F495443;
  return sub_A640(v1, a1);
}

uint64_t sub_A640@<X0>(Swift::String a1@<X1:X0>, uint64_t a2@<X8>)
{
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  uint64_t result = sub_209B8(a1, v5);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_A680@<X0>(uint64_t a1@<X8>)
{
  return sub_9518(a1);
}

void sub_A6BC(uint64_t a1)
{
  sub_21198();
  NSString v2 = sub_21178();
  swift_bridgeObjectRelease();
  id v3 = [self presenterForPrivacySplashWithIdentifier:v2];

  if (v3) {
    [v3 setPresentingViewController:a1];
  }
  [v3 present];
}

uint64_t sub_A77C()
{
  Swift::String v1 = *v0;
  *(void *)(swift_allocObject() + 16) = v1;
  sub_B160();
  id v2 = v1;
  sub_20EA8();

  return swift_release();
}

uint64_t sub_A814@<X0>(uint64_t a1@<X8>)
{
  v16._countAndFlagsBits = 0xD000000000000014;
  v16._object = (void *)0x8000000000026BA0;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  sub_209B8(v16, v19);
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = 32;
  v17._object = (void *)0xE100000000000000;
  sub_211D8(v17);
  swift_bridgeObjectRelease();
  v18._object = (void *)0x8000000000026BC0;
  v18._countAndFlagsBits = 0xD000000000000011;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  sub_209B8(v18, v20);
  sub_20F68();
  uint64_t v2 = sub_20E08();
  uint64_t v4 = v3;
  char v6 = v5;
  swift_bridgeObjectRelease();
  swift_release();
  char v7 = v6 & 1;
  uint64_t v8 = sub_20E18();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  sub_65B8(v2, v4, v7);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v12 & 1;
  *(void *)(a1 + 24) = v14;
  return result;
}

uint64_t sub_A98C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_20FD8();
  uint64_t result = sub_20FD8();
  *(unsigned char *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(void *)(a2 + 32) = a1;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GlobalSettingsView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for SettingsPrivacySection(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for SettingsPrivacySection(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_retain();
  swift_retain();
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for SettingsPrivacySection(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  id v4 = *(void **)(a2 + 32);
  char v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for SettingsPrivacySection(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SettingsPrivacySection(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  id v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsPrivacySection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsPrivacySection(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsPrivacySection()
{
  return &type metadata for SettingsPrivacySection;
}

uint64_t sub_AC84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_ACA0@<X0>(uint64_t a1@<X8>)
{
  return sub_9DF4(*(long long **)(v1 + 16), a1);
}

unint64_t sub_ACA8()
{
  unint64_t result = qword_30B80;
  if (!qword_30B80)
  {
    sub_28D4(&qword_30B70);
    sub_6744(&qword_30B88, &qword_30B90);
    sub_6744(&qword_30B98, &qword_30BA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30B80);
  }
  return result;
}

unint64_t sub_AD6C()
{
  unint64_t result = qword_30BB0;
  if (!qword_30BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30BB0);
  }
  return result;
}

unint64_t sub_ADC0()
{
  unint64_t result = qword_30BC0;
  if (!qword_30BC0)
  {
    sub_28D4(&qword_30B58);
    sub_28D4(&qword_30B70);
    sub_28D4(&qword_30B78);
    sub_ACA8();
    sub_6744(&qword_30BA8, &qword_30B78);
    swift_getOpaqueTypeConformance2();
    sub_AD6C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30BC0);
  }
  return result;
}

uint64_t sub_AED0()
{
  return sub_B04C();
}

uint64_t sub_AED8(uint64_t a1)
{
  return a1;
}

uint64_t sub_AF04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20C28();
  *a1 = result & 1;
  return result;
}

uint64_t sub_AF34()
{
  return sub_20C38();
}

uint64_t sub_AF5C()
{
  return swift_deallocObject();
}

unsigned char *sub_AF6C(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_AF84@<X0>(char *a1@<X8>)
{
  return sub_A16C(*(long long **)(v1 + 16), a1);
}

uint64_t sub_AF8C(uint64_t a1)
{
  uint64_t v2 = sub_3238(&qword_30B70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_AFF0()
{
  return sub_A558();
}

uint64_t sub_AFFC()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_B044()
{
  return sub_B04C();
}

uint64_t sub_B04C()
{
  return sub_20FF8();
}

ValueMetadata *type metadata accessor for SettingsPrivacyFooterView()
{
  return &type metadata for SettingsPrivacyFooterView;
}

uint64_t sub_B0A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B104()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B120()
{
  return swift_deallocObject();
}

void sub_B158()
{
  sub_A6BC(*(void *)(v0 + 16));
}

unint64_t sub_B160()
{
  unint64_t result = qword_30BE0;
  if (!qword_30BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30BE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsPrivacyLinkView()
{
  return &type metadata for SettingsPrivacyLinkView;
}

uint64_t sub_B1C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B210()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_B22C()
{
  return &protocol witness table for Text;
}

void *initializeBufferWithCopyOfBuffer for SyncLibrarySection(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SyncLibrarySection(id *a1)
{
  return swift_release();
}

uint64_t assignWithCopy for SyncLibrarySection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

id *assignWithTake for SyncLibrarySection(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SyncLibrarySection()
{
  return &type metadata for SyncLibrarySection;
}

uint64_t sub_B35C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B378(void *a1)
{
  v4._countAndFlagsBits = 0x5952415242494CLL;
  v4._object = (void *)0xE700000000000000;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  sub_209B8(v4, v5);
  id v2 = a1;
  sub_3238((uint64_t *)&unk_30BF0);
  sub_2878();
  sub_B538();
  return sub_21118();
}

uint64_t sub_B45C()
{
  return sub_21078();
}

uint64_t sub_B4D0@<X0>(uint64_t a1@<X8>)
{
  v4._object = (void *)0x8000000000026BE0;
  v4._countAndFlagsBits = 0xD000000000000013;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  uint64_t result = sub_209B8(v4, v5);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_B528()
{
  return sub_B378(*v0);
}

uint64_t sub_B530()
{
  return sub_B45C();
}

unint64_t sub_B538()
{
  unint64_t result = qword_30C00;
  if (!qword_30C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30C00);
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncLibraryFooterView()
{
  return &type metadata for SyncLibraryFooterView;
}

unint64_t sub_B5A0()
{
  unint64_t result = qword_30C08;
  if (!qword_30C08)
  {
    sub_28D4(&qword_30C10);
    sub_2878();
    sub_B538();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30C08);
  }
  return result;
}

uint64_t sub_B628()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B644()
{
  uint64_t v1 = *v0;
  *(void *)(swift_allocObject() + 16) = v1;
  sub_B714();
  id v2 = v1;
  sub_20EA8();

  return swift_release();
}

uint64_t sub_B6DC()
{
  return swift_deallocObject();
}

unint64_t sub_B714()
{
  unint64_t result = qword_30C18;
  if (!qword_30C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30C18);
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncLibraryLinkView()
{
  return &type metadata for SyncLibraryLinkView;
}

uint64_t sub_B778()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B7C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B7E0@<X0>(uint64_t a1@<X8>)
{
  v16._countAndFlagsBits = 0x5F5952415242494CLL;
  v16._object = (void *)0xEE005245544F4F46;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  sub_209B8(v16, v19);
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = 32;
  v17._object = (void *)0xE100000000000000;
  sub_211D8(v17);
  swift_bridgeObjectRelease();
  v18._object = (void *)0x8000000000026BC0;
  v18._countAndFlagsBits = 0xD000000000000011;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  sub_209B8(v18, v20);
  sub_20F68();
  uint64_t v2 = sub_20E08();
  uint64_t v4 = v3;
  char v6 = v5;
  swift_bridgeObjectRelease();
  swift_release();
  char v7 = v6 & 1;
  uint64_t v8 = sub_20E18();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  sub_65B8(v2, v4, v7);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v12 & 1;
  *(void *)(a1 + 24) = v14;
  return result;
}

void *sub_B95C()
{
  return &protocol witness table for Text;
}

uint64_t sub_B96C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v75 = a1;
  uint64_t v1 = sub_209A8();
  uint64_t v88 = *(void *)(v1 - 8);
  uint64_t v89 = v1;
  __chkstk_darwin(v1);
  v87 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3238(&qword_30B50);
  __chkstk_darwin(v3 - 8);
  v90 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_208C8();
  uint64_t v91 = *(void *)(v5 - 8);
  uint64_t v92 = v5;
  __chkstk_darwin(v5);
  v73 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_20898();
  uint64_t v80 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  v96 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20888();
  uint64_t v85 = *(void *)(v8 - 8);
  uint64_t v86 = v8;
  __chkstk_darwin(v8);
  v84 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_208E8();
  __chkstk_darwin(v10 - 8);
  v83 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21168();
  __chkstk_darwin(v12 - 8);
  v82 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_20CF8();
  uint64_t v81 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v66 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_3238(&qword_30CD0);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  Swift::String v19 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_3238((uint64_t *)&unk_30DF0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v67 = (uint64_t)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  id v25 = (char *)&v65 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v65 - v26;
  uint64_t v95 = sub_20D18();
  uint64_t v76 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  v79 = (char *)&v65 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_3238(&qword_30CD8);
  uint64_t v78 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v30 = (char *)&v65 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_3238(&qword_30CE0);
  uint64_t v71 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  v94 = (char *)&v65 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_3238(&qword_30CE8);
  uint64_t v69 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  char v68 = (char *)&v65 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103._object = (void *)0x8000000000026C00;
  v103._countAndFlagsBits = 0xD000000000000012;
  v104._countAndFlagsBits = 0;
  v104._object = (void *)0xE000000000000000;
  uint64_t v101 = sub_209B8(v103, v104);
  uint64_t v102 = v33;
  type metadata accessor for CellularDownloadsPicker();
  sub_20AF8();
  sub_3238(&qword_30CF0);
  sub_D5FC();
  sub_2820();
  v77 = v30;
  uint64_t v34 = v81;
  sub_21058();
  sub_1DD54((uint64_t)v27);
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v25, enum case for UserInterfaceSizeClass.compact(_:), v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v25, 0, 1, v14);
  uint64_t v35 = (uint64_t)&v19[*(int *)(v17 + 56)];
  sub_D668((uint64_t)v27, (uint64_t)v19);
  sub_D668((uint64_t)v25, v35);
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48);
  if (v36((uint64_t)v19, 1, v14) == 1)
  {
    sub_54BC((uint64_t)v25, (uint64_t *)&unk_30DF0);
    sub_54BC((uint64_t)v27, (uint64_t *)&unk_30DF0);
    int v37 = v36(v35, 1, v14);
    uint64_t v38 = v80;
    uint64_t v39 = v95;
    long long v40 = v79;
    if (v37 == 1)
    {
      sub_54BC((uint64_t)v19, (uint64_t *)&unk_30DF0);
      uint64_t v41 = v93;
      uint64_t v42 = v76;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v43 = v67;
  sub_D668((uint64_t)v19, v67);
  if (v36(v35, 1, v14) == 1)
  {
    sub_54BC((uint64_t)v25, (uint64_t *)&unk_30DF0);
    sub_54BC((uint64_t)v27, (uint64_t *)&unk_30DF0);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v43, v14);
    uint64_t v38 = v80;
    uint64_t v39 = v95;
    long long v40 = v79;
LABEL_6:
    sub_54BC((uint64_t)v19, &qword_30CD0);
    uint64_t v41 = v93;
    uint64_t v42 = v76;
    goto LABEL_7;
  }
  unint64_t v63 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v66, v35, v14);
  sub_D6D0(&qword_30D08, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
  sub_21148();
  uint64_t v64 = *(void (**)(char *, uint64_t))(v34 + 8);
  v64(v63, v14);
  sub_54BC((uint64_t)v25, (uint64_t *)&unk_30DF0);
  sub_54BC((uint64_t)v27, (uint64_t *)&unk_30DF0);
  v64((char *)v43, v14);
  sub_54BC((uint64_t)v19, (uint64_t *)&unk_30DF0);
  uint64_t v38 = v80;
  uint64_t v39 = v95;
  uint64_t v41 = v93;
  uint64_t v42 = v76;
  long long v40 = v79;
LABEL_7:
  uint64_t v44 = v78;
  uint64_t v45 = v77;
  sub_20D08();
  uint64_t v81 = sub_6744(&qword_30D00, &qword_30CD8);
  sub_20E88();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v39);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v41);
  sub_21158();
  sub_208D8();
  uint64_t v46 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v47 = v86;
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 104);
  uint64_t v49 = v84;
  v48(v84, enum case for LocalizedStringResource.BundleDescription.main(_:), v86);
  sub_208A8();
  sub_3238(&qword_30BB8);
  uint64_t v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_22390;
  uint64_t v85 = v50;
  sub_21158();
  sub_208D8();
  v48(v49, v46, v47);
  sub_208A8();
  sub_21158();
  sub_208D8();
  v48(v49, v46, v47);
  sub_208A8();
  uint64_t v51 = v87;
  uint64_t v52 = v88;
  uint64_t v53 = v89;
  (*(void (**)(char *, void, uint64_t))(v88 + 104))(v87, enum case for PodcastsSettingsDeepLinkURLs.cellularDownloadsURL(_:), v89);
  sub_20998();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
  uint64_t v54 = v90;
  sub_208B8();
  swift_bridgeObjectRelease();
  uint64_t v56 = v91;
  uint64_t v55 = v92;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 48))(v54, 1, v92);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v58 = v73;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v73, v54, v55);
    uint64_t v97 = v93;
    uint64_t v98 = v95;
    uint64_t v99 = v81;
    v100 = &protocol witness table for NavigationLinkPickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v59 = v68;
    uint64_t v60 = v96;
    uint64_t v61 = v72;
    uint64_t v62 = v94;
    sub_20E58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v55);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v60, v74);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v62, v61);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v69 + 32))(v75, v59, v70);
  }
  return result;
}

uint64_t sub_C794()
{
  return sub_210F8();
}

_UNKNOWN **static MTPodcastCellularDownloadLimit.allCases.getter()
{
  return &off_29390;
}

uint64_t sub_C894@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_C8D4(*a1);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_C8D4(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      v1._countAndFlagsBits = 0xD00000000000001ELL;
      uint64_t v2 = "CELLULAR_DOWNLOADS_ASK_IF_OVER";
LABEL_7:
      v1._object = (void *)((unint64_t)(v2 - 32) | 0x8000000000000000);
      goto LABEL_8;
    case 1:
      v1._object = (void *)0x8000000000026C40;
      v1._countAndFlagsBits = 0xD00000000000001DLL;
LABEL_8:
      v4._countAndFlagsBits = 0;
      v4._object = (void *)0xE000000000000000;
      return sub_209B8(v1, v4);
    case 0:
      v1._countAndFlagsBits = 0xD00000000000001FLL;
      uint64_t v2 = "CELLULAR_DOWNLOADS_ALWAYS_ALLOW";
      goto LABEL_7;
  }
  type metadata accessor for MTPodcastCellularDownloadLimit(0);
  uint64_t result = sub_21518();
  __break(1u);
  return result;
}

void sub_C9A0(void *a1@<X8>)
{
  *a1 = &off_293C8;
}

uint64_t sub_C9B0()
{
  return sub_6744(&qword_30C20, &qword_30C28);
}

void *sub_C9EC()
{
  return &protocol witness table for Int;
}

uint64_t *sub_C9F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_3238(&qword_30DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_20CF8();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_3238((uint64_t *)&unk_30DF0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_CBC0(uint64_t a1)
{
  sub_3238(&qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_20CF8();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_CCB8(void *a1, void *a2, uint64_t a3)
{
  sub_3238(&qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_20CF8();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = sub_3238((uint64_t *)&unk_30DF0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

void *sub_CE34(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_54BC((uint64_t)a1, &qword_30DE0);
    sub_3238(&qword_30DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_20CF8();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = sub_3238((uint64_t *)&unk_30DF0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

char *sub_CFD4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_3238(&qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_20CF8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_3238((uint64_t *)&unk_30DF0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_D154(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_54BC((uint64_t)a1, &qword_30DE0);
    uint64_t v6 = sub_3238(&qword_30DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_20CF8();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_3238((uint64_t *)&unk_30DF0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t sub_D2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D308);
}

uint64_t sub_D308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3238(&qword_30C30);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_D3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D3E0);
}

uint64_t sub_D3E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3238(&qword_30C30);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for CellularDownloadsPicker()
{
  uint64_t result = qword_30C90;
  if (!qword_30C90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_D4EC()
{
  sub_D584();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_D584()
{
  if (!qword_30CA0)
  {
    sub_28D4((uint64_t *)&unk_30DF0);
    unint64_t v0 = sub_20B58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_30CA0);
    }
  }
}

uint64_t sub_D5E0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_D5FC()
{
  unint64_t result = qword_30CF8;
  if (!qword_30CF8)
  {
    sub_28D4(&qword_30CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30CF8);
  }
  return result;
}

uint64_t sub_D668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238((uint64_t *)&unk_30DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_D6D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_D718()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for EpisodeDisplayStateSettingsSection()
{
  return &type metadata for EpisodeDisplayStateSettingsSection;
}

uint64_t sub_D7FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D818()
{
  v1._countAndFlagsBits = 0x445F454453495045;
  v1._object = (void *)0xEE0059414C505349;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  sub_209B8(v1, v3);
  v2._object = (void *)0x8000000000026CA0;
  v2._countAndFlagsBits = 0xD000000000000013;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_209B8(v2, v4);
  sub_3238((uint64_t *)&unk_30BF0);
  sub_2878();
  return sub_21118();
}

uint64_t sub_D914()
{
  v1._object = (void *)0x8000000000026CC0;
  v1._countAndFlagsBits = 0xD000000000000014;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  sub_209B8(v1, v2);
  sub_20AF8();
  sub_2820();
  return sub_21088();
}

uint64_t sub_D9B4()
{
  return sub_D818();
}

uint64_t sub_D9BC()
{
  return sub_D914();
}

unint64_t sub_D9C8()
{
  unint64_t result = qword_30D20;
  if (!qword_30D20)
  {
    sub_28D4((uint64_t *)&unk_30D28);
    sub_2878();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30D20);
  }
  return result;
}

id sub_DA48(uint64_t a1, void *a2, char a3)
{
  if (a3) {
    return a2;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t destroy for GlobalSettingsView(uint64_t a1)
{
  swift_release();
  sub_DAA8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));

  return swift_release();
}

uint64_t sub_DAA8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_release_x1();
  }
  else {
    return swift_release();
  }
}

uint64_t initializeWithCopy for GlobalSettingsView(uint64_t a1, uint64_t a2)
{
  Swift::String v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = *(void **)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  id v9 = v4;
  swift_retain();
  sub_DA48(v6, v7, v8);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GlobalSettingsView(uint64_t a1, uint64_t a2)
{
  Swift::String v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(void **)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_DA48(v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_DAA8(v10, v11, v12);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for GlobalSettingsView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for GlobalSettingsView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_release();
  char v6 = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v6;
  sub_DAA8(v7, v8, v9);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GlobalSettingsView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GlobalSettingsView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GlobalSettingsView()
{
  return &type metadata for GlobalSettingsView;
}

uint64_t sub_DD1C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_DD38()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for SpecifierState());

  return [v0 init];
}

uint64_t sub_DD70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v71 = a1;
  uint64_t v3 = sub_209A8();
  uint64_t v99 = *(void *)(v3 - 8);
  uint64_t v100 = v3;
  __chkstk_darwin(v3);
  uint64_t v97 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_3238(&qword_30B50);
  __chkstk_darwin(v5 - 8);
  uint64_t v98 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_208C8();
  uint64_t v91 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v70 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20888();
  uint64_t v94 = *(void *)(v8 - 8);
  uint64_t v95 = v8;
  __chkstk_darwin(v8);
  uint64_t v93 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_208E8();
  __chkstk_darwin(v10 - 8);
  uint64_t v92 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21168();
  __chkstk_darwin(v12 - 8);
  v90 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_20898();
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v86 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_209E8();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  v87 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_3238(&qword_30D38);
  uint64_t v78 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_3238(&qword_30D40);
  uint64_t v81 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v74 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_3238(&qword_30D48);
  uint64_t v82 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  uint64_t v75 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_3238(&qword_30D50) - 8;
  __chkstk_darwin(v80);
  v77 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_3238(&qword_30D58) - 8;
  __chkstk_darwin(v85);
  v83 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_3238(&qword_30D60);
  __chkstk_darwin(v73);
  uint64_t v23 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_3238(&qword_30D68);
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v65 = (char *)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = v2;
  sub_3238(&qword_30D70);
  sub_6744(&qword_30D78, &qword_30D70);
  sub_20DF8();
  uint64_t v72 = *(void *)(v2 + 16);
  sub_20968();
  sub_FA2C((unint64_t *)&qword_30D80, (void (*)(uint64_t))&type metadata accessor for GlobalSettingsDeepLinkState);
  sub_20BA8();
  swift_getKeyPath();
  sub_20BB8();
  swift_release();
  swift_release();
  uint64_t v101 = v2;
  uint64_t v25 = sub_20918();
  uint64_t v26 = sub_6744(&qword_30D88, &qword_30D38);
  uint64_t v64 = sub_FA2C(&qword_30D90, (void (*)(uint64_t))&type metadata accessor for AutoDownloadPickerView);
  uint64_t v27 = v74;
  uint64_t v28 = v76;
  sub_20EF8();
  uint64_t v29 = (uint64_t)v23;
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v17, v28);
  *(void *)&long long v103 = v28;
  *((void *)&v103 + 1) = v25;
  uint64_t v104 = v26;
  uint64_t v105 = v64;
  uint64_t v30 = v73;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v75;
  uint64_t v32 = v79;
  sub_20E48();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v27, v32);
  uint64_t v33 = *(void **)v2;
  long long v103 = *(_OWORD *)(v2 + 24);
  LOBYTE(v104) = *(unsigned char *)(v2 + 40);
  uint64_t v106 = *(void *)(v2 + 48);
  uint64_t v34 = swift_allocObject();
  long long v35 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v34 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v34 + 32) = v35;
  *(_OWORD *)(v34 + 48) = *(_OWORD *)(v2 + 32);
  *(void *)(v34 + 64) = *(void *)(v2 + 48);
  uint64_t v36 = v82;
  uint64_t v37 = (uint64_t)v77;
  uint64_t v38 = v31;
  uint64_t v39 = v31;
  uint64_t v40 = v84;
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v77, v38, v84);
  uint64_t v41 = (void (**)())(v37 + *(int *)(v80 + 44));
  *uint64_t v41 = sub_F6A4;
  v41[1] = (void (*)())v34;
  v41[2] = 0;
  v41[3] = 0;
  id v42 = v33;
  uint64_t v43 = v72;
  swift_retain();
  sub_F6AC((uint64_t)&v103);
  sub_F6E0((uint64_t)&v106);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v45 = v87;
  sub_209C8();
  uint64_t v46 = (uint64_t)v83;
  uint64_t v47 = (uint64_t *)&v83[*(int *)(v85 + 44)];
  uint64_t v48 = sub_3238(&qword_30D98);
  uint64_t v49 = v88;
  uint64_t v50 = v89;
  (*(void (**)(char *, char *, uint64_t))(v88 + 16))((char *)v47 + *(int *)(v48 + 28), v45, v89);
  *uint64_t v47 = KeyPath;
  uint64_t v51 = v91;
  sub_53F0(v37, v46, &qword_30D50);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v45, v50);
  sub_54BC(v37, &qword_30D50);
  uint64_t v52 = swift_getKeyPath();
  sub_53F0(v46, v29, &qword_30D58);
  uint64_t v53 = (uint64_t *)(v29 + *(int *)(v30 + 36));
  *uint64_t v53 = v52;
  v53[1] = v43;
  swift_retain();
  sub_54BC(v46, &qword_30D58);
  sub_21158();
  sub_208D8();
  (*(void (**)(char *, void, uint64_t))(v94 + 104))(v93, enum case for LocalizedStringResource.BundleDescription.main(_:), v95);
  uint64_t v54 = v86;
  sub_208A8();
  uint64_t v56 = v99;
  uint64_t v55 = v100;
  uint64_t v57 = v97;
  (*(void (**)(char *, void, uint64_t))(v99 + 104))(v97, enum case for PodcastsSettingsDeepLinkURLs.rootURL(_:), v100);
  sub_20998();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v55);
  uint64_t v58 = v98;
  uint64_t v59 = v96;
  sub_208B8();
  uint64_t v60 = v58;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 48))(v58, 1, v59);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v62 = v70;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v70, v60, v59);
    sub_F78C();
    unint64_t v63 = v65;
    sub_20E58();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v62, v59);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v54, v69);
    sub_54BC(v29, &qword_30D60);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v66 + 32))(v71, v63, v67);
  }
  return result;
}

void sub_EAE4(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v67 = type metadata accessor for SkipButtonsPickersSection() - 8;
  uint64_t v3 = __chkstk_darwin(v67);
  uint64_t v74 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v70 = (uint64_t *)((char *)&v56 - v5);
  uint64_t v6 = type metadata accessor for AutomaticDownloadsSettingsSection();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (uint64_t *)((char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  uint64_t v69 = (uint64_t)&v56 - v11;
  uint64_t v12 = type metadata accessor for DownloadsSettingsSection();
  uint64_t v13 = v12 - 8;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v73 = (uint64_t)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v56 - v16);
  uint64_t v18 = *a1;
  type metadata accessor for SpecifierState();
  sub_FA2C((unint64_t *)&unk_30DD0, (void (*)(uint64_t))type metadata accessor for SpecifierState);
  id v19 = v18;
  sub_20B68();
  uint64_t v65 = sub_20B98();
  id v71 = v20;
  sub_21198();
  uint64_t v21 = self;
  id v64 = v19;
  id v22 = [v21 _applePodcastsFoundationSharedUserDefaults];
  uint64_t v72 = sub_20AB8();
  sub_21198();
  id v23 = [v21 _applePodcastsFoundationSharedUserDefaults];
  *uint64_t v17 = sub_20AB8();
  sub_21198();
  id v24 = [v21 _applePodcastsFoundationSharedUserDefaults];
  v17[1] = sub_20AB8();
  uint64_t v25 = (uint64_t *)((char *)v17 + *(int *)(v13 + 32));
  uint64_t v61 = v17;
  *uint64_t v25 = swift_getKeyPath();
  sub_3238(&qword_30A18);
  swift_storeEnumTagMultiPayload();
  sub_21198();
  id v26 = [v21 _applePodcastsFoundationSharedUserDefaults];
  *uint64_t v10 = sub_20AB8();
  uint64_t v27 = (uint64_t *)((char *)v10 + *(int *)(v7 + 28));
  uint64_t v68 = v10;
  *uint64_t v27 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v28 = (uint64_t)v10;
  uint64_t v29 = v69;
  sub_900C(v28, v69);
  sub_21198();
  id v30 = [v21 _applePodcastsFoundationSharedUserDefaults];
  uint64_t v63 = sub_20AB8();
  sub_21198();
  id v31 = [v21 _applePodcastsFoundationSharedUserDefaults];
  uint64_t v62 = sub_20AB8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v70;
  *uint64_t v70 = KeyPath;
  sub_3238(&qword_30DE0);
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = v67;
  uint64_t v35 = *(int *)(v67 + 28);
  sub_21398();
  sub_21198();
  id v36 = [v21 _applePodcastsFoundationSharedUserDefaults];
  *(uint64_t *)((char *)v33 + v35) = sub_20AC8();
  uint64_t v37 = *(int *)(v34 + 32);
  sub_21398();
  sub_21198();
  id v38 = [v21 _applePodcastsFoundationSharedUserDefaults];
  *(uint64_t *)((char *)v33 + v37) = sub_20AC8();
  sub_21198();
  id v39 = [v21 _applePodcastsFoundationSharedUserDefaults];
  uint64_t v60 = sub_20AB8();
  uint64_t v40 = v64;
  swift_getObjectType();
  id v41 = v40;
  sub_A98C((uint64_t)v41, (uint64_t)v75);
  uint64_t v42 = v73;
  sub_FB54((uint64_t)v17, v73, (uint64_t (*)(void))type metadata accessor for DownloadsSettingsSection);
  uint64_t v43 = (uint64_t)v68;
  sub_FB54(v29, (uint64_t)v68, (uint64_t (*)(void))type metadata accessor for AutomaticDownloadsSettingsSection);
  uint64_t v44 = v74;
  sub_FB54((uint64_t)v33, v74, (uint64_t (*)(void))type metadata accessor for SkipButtonsPickersSection);
  int v58 = v75[0];
  id v64 = v76;
  int v57 = v77;
  uint64_t v67 = v78;
  uint64_t v59 = v79;
  uint64_t v45 = v65;
  uint64_t v46 = v66;
  *uint64_t v66 = v41;
  v46[1] = v45;
  v46[2] = v71;
  v46[3] = v41;
  v46[4] = v72;
  uint64_t v47 = (int *)sub_3238(&qword_30DE8);
  sub_FB54(v42, (uint64_t)v46 + v47[16], (uint64_t (*)(void))type metadata accessor for DownloadsSettingsSection);
  sub_FB54(v43, (uint64_t)v46 + v47[20], (uint64_t (*)(void))type metadata accessor for AutomaticDownloadsSettingsSection);
  uint64_t v48 = v62;
  *(void *)((char *)v46 + v47[24]) = v63;
  *(void *)((char *)v46 + v47[28]) = v48;
  sub_FB54(v44, (uint64_t)v46 + v47[32], (uint64_t (*)(void))type metadata accessor for SkipButtonsPickersSection);
  uint64_t v49 = v59;
  *(void *)((char *)v46 + v47[36]) = v60;
  uint64_t v50 = (char *)v46 + v47[40];
  char v51 = v57 & 1;
  char *v50 = v58 & 1;
  *((void *)v50 + 1) = v64;
  v50[16] = v51;
  *((void *)v50 + 3) = v67;
  *((void *)v50 + 4) = v49;
  swift_retain();
  uint64_t v66 = v49;
  id v52 = v71;
  swift_retain_n();
  id v53 = v41;
  id v54 = v52;
  id v55 = v53;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_FBBC((uint64_t)v70, (uint64_t (*)(void))type metadata accessor for SkipButtonsPickersSection);
  sub_FBBC(v69, (uint64_t (*)(void))type metadata accessor for AutomaticDownloadsSettingsSection);
  sub_FBBC((uint64_t)v61, (uint64_t (*)(void))type metadata accessor for DownloadsSettingsSection);
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  sub_FBBC(v74, (uint64_t (*)(void))type metadata accessor for SkipButtonsPickersSection);
  swift_release();
  swift_release();
  sub_FBBC((uint64_t)v68, (uint64_t (*)(void))type metadata accessor for AutomaticDownloadsSettingsSection);
  sub_FBBC(v73, (uint64_t (*)(void))type metadata accessor for DownloadsSettingsSection);

  swift_release();
}

uint64_t sub_F318()
{
  uint64_t v0 = sub_208F8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AF8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for AutoDownloadPicker.PickerType.iOSGlobalSettings(_:), v0);
  return sub_20908();
}

void sub_F42C()
{
  type metadata accessor for SpecifierState();
  sub_FA2C((unint64_t *)&unk_30DD0, (void (*)(uint64_t))type metadata accessor for SpecifierState);
  id v0 = (id)sub_20B68();
  [v0 reloadSpecifiers];
}

uint64_t sub_F4DC(uint64_t a1)
{
  uint64_t v2 = sub_209E8();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_20BD8();
}

uint64_t sub_F5A4@<X0>(uint64_t a1@<X8>)
{
  return sub_DD70(a1);
}

void sub_F5E8(void *a1@<X8>)
{
  sub_EAE4(*(void ***)(v1 + 16), a1);
}

uint64_t sub_F5F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20928();
  *a1 = result & 1;
  return result;
}

uint64_t sub_F620()
{
  return sub_20938();
}

uint64_t sub_F648()
{
  return sub_F318();
}

uint64_t sub_F650()
{
  swift_release();
  sub_DAA8(*(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  swift_release();

  return swift_deallocObject();
}

void sub_F6A4()
{
}

uint64_t sub_F6AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_F6E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_F70C()
{
  return sub_20BC8();
}

uint64_t sub_F734@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20BE8();
  *a1 = result;
  return result;
}

uint64_t sub_F760()
{
  return sub_20BF8();
}

unint64_t sub_F78C()
{
  unint64_t result = qword_30DA0;
  if (!qword_30DA0)
  {
    sub_28D4(&qword_30D60);
    sub_F82C();
    sub_6744(&qword_30DC0, &qword_30DC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30DA0);
  }
  return result;
}

unint64_t sub_F82C()
{
  unint64_t result = qword_30DA8;
  if (!qword_30DA8)
  {
    sub_28D4(&qword_30D58);
    sub_F8CC();
    sub_6744(&qword_30DB8, &qword_30D98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30DA8);
  }
  return result;
}

unint64_t sub_F8CC()
{
  unint64_t result = qword_30DB0;
  if (!qword_30DB0)
  {
    sub_28D4(&qword_30D50);
    sub_28D4(&qword_30D40);
    sub_28D4(&qword_30D38);
    sub_20918();
    sub_6744(&qword_30D88, &qword_30D38);
    sub_FA2C(&qword_30D90, (void (*)(uint64_t))&type metadata accessor for AutoDownloadPickerView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30DB0);
  }
  return result;
}

uint64_t sub_FA2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_FA74()
{
  return sub_20C08();
}

uint64_t sub_FA98()
{
  return sub_20C08();
}

uint64_t sub_FABC(uint64_t a1)
{
  uint64_t v2 = sub_3238((uint64_t *)&unk_30DF0);
  __chkstk_darwin(v2 - 8);
  sub_53F0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_30DF0);
  return sub_20C18();
}

uint64_t sub_FB54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_FBBC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_FC1C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for SettingsSpecifierSections()
{
  return &type metadata for SettingsSpecifierSections;
}

uint64_t sub_FC88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_FCA4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  *a3 = a2;
  a3[1] = v4;
  a3[2] = v3;
  id v5 = a2;
  id v6 = v4;

  return swift_bridgeObjectRetain();
}

uint64_t sub_FCE8()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void **)(v0 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  sub_20A88();

  swift_release();
  swift_release();
  swift_getKeyPath();
  id v5 = (void *)swift_allocObject();
  v5[2] = v1;
  v5[3] = v2;
  v5[4] = v4;
  id v6 = v4;
  id v7 = v1;
  sub_3238(&qword_30E00);
  sub_FE6C();
  sub_FEC8();
  sub_FF20();
  return sub_210E8();
}

uint64_t sub_FE20()
{
  return swift_deallocObject();
}

uint64_t sub_FE60@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_FCA4(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_FE6C()
{
  unint64_t result = qword_30E08;
  if (!qword_30E08)
  {
    sub_28D4(&qword_30E00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30E08);
  }
  return result;
}

unint64_t sub_FEC8()
{
  unint64_t result = qword_30E10;
  if (!qword_30E10)
  {
    sub_3490();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30E10);
  }
  return result;
}

unint64_t sub_FF20()
{
  unint64_t result = qword_30E20;
  if (!qword_30E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30E20);
  }
  return result;
}

unint64_t sub_FF78()
{
  unint64_t result = qword_30E28;
  if (!qword_30E28)
  {
    sub_28D4((uint64_t *)&unk_30E30);
    sub_FF20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30E28);
  }
  return result;
}

uint64_t sub_FFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_20CC8();
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_20CD8();
}

uint64_t sub_100E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CC8();
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_20CD8();
}

uint64_t property wrapper backing initializer of AsyncSelectionConfirmingPicker.unconfirmedSelection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_20FD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
}

uint64_t sub_102C8(uint64_t a1)
{
  return sub_102F8(a1, (uint64_t (*)(uint64_t))&State.wrappedValue.getter);
}

uint64_t sub_102E0(uint64_t a1)
{
  return sub_102F8(a1, (uint64_t (*)(uint64_t))&State.projectedValue.getter);
}

uint64_t sub_102F8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_21018();
  return a2(v3);
}

uint64_t property wrapper backing initializer of AsyncSelectionConfirmingPicker.confirmationConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)v12);
  uint64_t v7 = sub_213A8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v12[-1] - v9, a1, v7);
  sub_20FD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration);
}

uint64_t sub_10470(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  long long v2 = *(_OWORD *)(a1 + 32);
  v4[0] = *(_OWORD *)(a1 + 16);
  v4[1] = v2;
  uint64_t v5 = v1;
  type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)v4);
  sub_213A8();
  sub_21018();
  return sub_20FE8();
}

uint64_t sub_104E0()
{
  sub_20FD8();
  return v1;
}

uint64_t sub_1051C()
{
  return sub_20FF8();
}

uint64_t sub_10578()
{
  sub_3238(&qword_30BC8);
  sub_21008();
  return v1;
}

uint64_t sub_105D8()
{
  sub_3238(qword_30E40);
  sub_20FD8();
  return v1;
}

uint64_t AsyncSelectionConfirmingPicker.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v78 = a2;
  uint64_t v76 = *(void *)(a1 - 8);
  uint64_t v77 = *(void *)(v76 + 64);
  uint64_t v2 = __chkstk_darwin(a1);
  uint64_t v85 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v87 = *(void *)(v4 - 8);
  uint64_t v5 = (void *)__chkstk_darwin(v2);
  uint64_t v75 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = v5;
  uint64_t v7 = v5[5];
  uint64_t v82 = v5[4];
  uint64_t v86 = v7;
  uint64_t v81 = v5[6];
  uint64_t v101 = &type metadata for Text;
  uint64_t v102 = v4;
  uint64_t v103 = v82;
  uint64_t v104 = &protocol witness table for Text;
  uint64_t v105 = v7;
  uint64_t v106 = v81;
  uint64_t v8 = sub_21068();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v101 = (void *)v8;
  uint64_t v102 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  sub_20CE8();
  uint64_t v101 = (void *)v8;
  uint64_t v102 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  sub_20CE8();
  sub_20CE8();
  uint64_t v10 = sub_20F98();
  uint64_t v74 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v60 = (char *)&v58 - v11;
  uint64_t v101 = (void *)v8;
  uint64_t v102 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v100 = WitnessTable;
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v101 = (void *)v8;
  uint64_t v102 = WitnessTable;
  uint64_t v97 = swift_getOpaqueTypeConformance2();
  uint64_t v98 = WitnessTable;
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v95 = v12;
  uint64_t v96 = v13;
  uint64_t v94 = swift_getWitnessTable();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v15 = v86;
  uint64_t v16 = *(void **)(v86 + 8);
  uint64_t v101 = (void *)v10;
  uint64_t v102 = v4;
  uint64_t v17 = (void *)v10;
  uint64_t v65 = v10;
  uint64_t v103 = v14;
  uint64_t v104 = v16;
  uint64_t v18 = v14;
  uint64_t v66 = v14;
  id v19 = v16;
  id v64 = v16;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v69 = OpaqueTypeMetadata2;
  uint64_t v73 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v80 = (char *)&v58 - v21;
  uint64_t v101 = v17;
  uint64_t v102 = v4;
  uint64_t v103 = v18;
  uint64_t v104 = v19;
  uint64_t v70 = swift_getOpaqueTypeConformance2();
  uint64_t v101 = (void *)OpaqueTypeMetadata2;
  uint64_t v102 = v4;
  uint64_t v103 = v70;
  uint64_t v104 = v19;
  uint64_t v72 = swift_getOpaqueTypeMetadata2();
  uint64_t v71 = *(void *)(v72 - 8);
  uint64_t v22 = __chkstk_darwin(v72);
  uint64_t v67 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v68 = (char *)&v58 - v24;
  uint64_t v25 = v83;
  uint64_t v79 = v83[2];
  uint64_t v88 = v79;
  uint64_t v89 = v4;
  uint64_t v59 = v4;
  uint64_t v26 = v82;
  uint64_t v90 = v82;
  uint64_t v91 = v15;
  uint64_t v27 = v81;
  uint64_t v28 = v84;
  uint64_t v92 = v81;
  uint64_t v93 = v84;
  sub_20F88();
  uint64_t v29 = v28;
  sub_21018();
  id v30 = v75;
  sub_20FE8();
  uint64_t v31 = v76;
  uint64_t v63 = *(void (**)(char *, uint64_t, void *))(v76 + 16);
  uint64_t v32 = v85;
  v63(v85, v29, v25);
  uint64_t v33 = *(unsigned __int8 *)(v31 + 80);
  uint64_t v34 = v31;
  v77 += (v33 + 56) & ~v33;
  uint64_t v35 = (v33 + 56) & ~v33;
  uint64_t v62 = v35;
  uint64_t v61 = v33 | 7;
  id v36 = (void *)swift_allocObject();
  uint64_t v37 = v59;
  v36[2] = v79;
  v36[3] = v37;
  uint64_t v38 = v86;
  v36[4] = v26;
  v36[5] = v38;
  v36[6] = v27;
  uint64_t v76 = *(void *)(v34 + 32);
  ((void (*)(char *, char *, void *))v76)((char *)v36 + v35, v32, v25);
  uint64_t v39 = v65;
  uint64_t v40 = v37;
  id v41 = v60;
  sub_20F08();
  swift_release();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v87 + 8);
  v87 += 8;
  v42(v30, v37);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v41, v39);
  sub_210D8();
  uint64_t v43 = v84;
  sub_21098();
  uint64_t v44 = v85;
  uint64_t v45 = v83;
  v63(v85, v43, v83);
  uint64_t v46 = (void *)swift_allocObject();
  v46[2] = v79;
  v46[3] = v40;
  uint64_t v47 = v86;
  v46[4] = v82;
  v46[5] = v47;
  uint64_t v48 = (char *)v46 + v62;
  v46[6] = v81;
  ((void (*)(char *, char *, void *))v76)(v48, v44, v45);
  uint64_t v49 = v67;
  uint64_t v50 = v69;
  char v51 = v80;
  sub_20F08();
  swift_release();
  v42(v30, v40);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v51, v50);
  uint64_t v52 = v71;
  id v53 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  id v54 = v68;
  uint64_t v55 = v72;
  v53(v68, v49, v72);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v52 + 8);
  v56(v49, v55);
  v53(v78, v54, v55);
  return ((uint64_t (*)(char *, uint64_t))v56)(v54, v55);
}

uint64_t sub_10F4C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v42 = a6;
  id v41 = a5;
  uint64_t v43 = a2;
  uint64_t v44 = a1;
  uint64_t v47 = a7;
  uint64_t v65 = a4;
  uint64_t v66 = &protocol witness table for Text;
  uint64_t v67 = a5;
  uint64_t v68 = a6;
  uint64_t v9 = sub_21068();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v63 = v9;
  uint64_t v64 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  uint64_t v11 = sub_20CE8();
  uint64_t v39 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v40 = (char *)&v38 - v15;
  uint64_t v63 = v9;
  uint64_t v64 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  uint64_t v16 = sub_20CE8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v38 - v21;
  uint64_t v46 = sub_20CE8();
  uint64_t v45 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v48 = (char *)&v38 - v23;
  uint64_t v63 = (uint64_t)v43;
  uint64_t v64 = a3;
  uint64_t v65 = a4;
  uint64_t v24 = v44;
  uint64_t v66 = v41;
  uint64_t v67 = v42;
  uint64_t v25 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)&v63);
  if (*(unsigned char *)(v24 + *(int *)(v25 + 96)))
  {
    sub_11654((void *)v25, (uint64_t)&opaque type descriptor for <<opaque return type of View.actionSheet(isPresented:content:)>>, (uint64_t)sub_1B374, (void (*)(uint64_t))&View.actionSheet(isPresented:content:), (uint64_t)v14);
    uint64_t v63 = v9;
    uint64_t v64 = WitnessTable;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v62 = WitnessTable;
    uint64_t v43 = &protocol conformance descriptor for <> _ConditionalContent<A, B>;
    uint64_t v44 = swift_getWitnessTable();
    uint64_t v26 = v39;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
    uint64_t v28 = v40;
    v27(v40, v14, v11);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v26 + 8);
    v29(v14, v11);
    v27(v14, v28, v11);
    uint64_t v63 = v9;
    uint64_t v64 = WitnessTable;
    uint64_t v59 = swift_getOpaqueTypeConformance2();
    uint64_t v60 = WitnessTable;
    swift_getWitnessTable();
    sub_FFEC((uint64_t)v14, v16, v11);
    v29(v14, v11);
    v29(v28, v11);
  }
  else
  {
    sub_11654((void *)v25, (uint64_t)&opaque type descriptor for <<opaque return type of View.alert(isPresented:content:)>>, (uint64_t)sub_1AF54, (void (*)(uint64_t))&View.alert(isPresented:content:), (uint64_t)v20);
    uint64_t v63 = v9;
    uint64_t v64 = WitnessTable;
    uint64_t v51 = swift_getOpaqueTypeConformance2();
    uint64_t v52 = WitnessTable;
    uint64_t v43 = &protocol conformance descriptor for <> _ConditionalContent<A, B>;
    uint64_t v44 = swift_getWitnessTable();
    id v30 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v30(v22, v20, v16);
    uint64_t v31 = *(void (**)(char *, uint64_t))(v17 + 8);
    v31(v20, v16);
    v30(v20, v22, v16);
    uint64_t v63 = v9;
    uint64_t v64 = WitnessTable;
    uint64_t v49 = swift_getOpaqueTypeConformance2();
    uint64_t v50 = WitnessTable;
    swift_getWitnessTable();
    sub_100E4((uint64_t)v20, v16);
    v31(v20, v16);
    v31(v22, v16);
  }
  uint64_t v63 = v9;
  uint64_t v64 = WitnessTable;
  uint64_t v57 = swift_getOpaqueTypeConformance2();
  uint64_t v58 = WitnessTable;
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v63 = v9;
  uint64_t v64 = WitnessTable;
  uint64_t v55 = swift_getOpaqueTypeConformance2();
  uint64_t v56 = WitnessTable;
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v53 = v32;
  uint64_t v54 = v33;
  uint64_t v34 = v46;
  swift_getWitnessTable();
  uint64_t v35 = v45;
  id v36 = v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v45 + 16))(v47, v48, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v36, v34);
}

uint64_t sub_11644@<X0>(uint64_t a1@<X8>)
{
  return sub_10F4C(*(void *)(v1 + 56), *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48), a1);
}

uint64_t sub_11654@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v62 = a3;
  uint64_t v63 = a4;
  uint64_t v72 = a5;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = (void *)a1[5];
  uint64_t v11 = (void *)a1[6];
  uint64_t v76 = &type metadata for Text;
  uint64_t v77 = v8;
  uint64_t v78 = v9;
  uint64_t v79 = &protocol witness table for Text;
  uint64_t v80 = v10;
  uint64_t v81 = v11;
  uint64_t v12 = sub_21068();
  uint64_t v69 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t OpaqueTypeConformance2 = (char *)&v53 - v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v76 = (void *)v12;
  uint64_t v77 = WitnessTable;
  uint64_t v70 = WitnessTable;
  uint64_t v71 = a2;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v61 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v19 = __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v56 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v55 = (char *)&v53 - v21;
  uint64_t v54 = (void *)a1[2];
  uint64_t v76 = v54;
  uint64_t v77 = v8;
  uint64_t v60 = v8;
  uint64_t v59 = v9;
  uint64_t v78 = v9;
  uint64_t v79 = v10;
  uint64_t v58 = (uint64_t)v10;
  uint64_t v57 = (uint64_t)v11;
  uint64_t v80 = v11;
  uint64_t v22 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)&v76);
  uint64_t v23 = sub_213A8();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v53 - v26;
  uint64_t v28 = *(void *)(v22 - 8);
  __chkstk_darwin(v25);
  uint64_t v64 = (char *)&v53 - v29;
  uint64_t v65 = OpaqueTypeMetadata2;
  uint64_t v30 = sub_20CE8();
  uint64_t v66 = *(void *)(v30 - 8);
  uint64_t v67 = v30;
  __chkstk_darwin(v30);
  uint64_t v73 = (char *)&v53 - v31;
  sub_10470((uint64_t)a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v27, 1, v22) == 1)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
    sub_12DC0(a1, v15);
    uint64_t v33 = OpaqueTypeConformance2;
    uint64_t v32 = v69;
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
    v34(OpaqueTypeConformance2, v15, v12);
    uint64_t v35 = *(void (**)(char *, uint64_t))(v32 + 8);
    v35(v15, v12);
    v34(v15, v33, v12);
    uint64_t v36 = v70;
    uint64_t v76 = (void *)v12;
    uint64_t v77 = v70;
    swift_getOpaqueTypeConformance2();
    sub_FFEC((uint64_t)v15, v65, v12);
    v35(v15, v12);
    v35(v33, v12);
  }
  else
  {
    uint64_t v37 = v64;
    (*(void (**)(void))(v28 + 32))();
    uint64_t v38 = OpaqueTypeConformance2;
    sub_12DC0(a1, OpaqueTypeConformance2);
    uint64_t v39 = sub_10578();
    uint64_t v40 = __chkstk_darwin(v39);
    uint64_t v41 = v60;
    *(&v53 - 8) = (uint64_t)v54;
    *(&v53 - 7) = v41;
    uint64_t v42 = v58;
    *(&v53 - 6) = v59;
    *(&v53 - 5) = v42;
    *(&v53 - 4) = v57;
    *(&v53 - 3) = v5;
    *(&v53 - 2) = (uint64_t)v37;
    uint64_t v60 = v28;
    uint64_t v43 = (uint64_t)v56;
    uint64_t v36 = v70;
    v63(v40);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v38, v12);
    uint64_t v76 = (void *)v12;
    uint64_t v77 = v36;
    uint64_t OpaqueTypeConformance2 = (char *)swift_getOpaqueTypeConformance2();
    uint64_t v44 = v61;
    uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 16);
    uint64_t v46 = v55;
    uint64_t v69 = v22;
    uint64_t v47 = v65;
    v45(v55, v43, v65);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v48(v43, v47);
    v45((char *)v43, (uint64_t)v46, v47);
    sub_100E4(v43, v47);
    v48(v43, v47);
    v48((uint64_t)v46, v47);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v64, v69);
  }
  uint64_t v76 = (void *)v12;
  uint64_t v77 = v36;
  uint64_t v74 = swift_getOpaqueTypeConformance2();
  uint64_t v75 = v36;
  uint64_t v49 = v67;
  swift_getWitnessTable();
  uint64_t v50 = v66;
  uint64_t v51 = v73;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v72, v73, v49);
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v51, v49);
}

uint64_t sub_11D58(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v26 = a8;
  uint64_t v27 = a1;
  uint64_t v24 = a4;
  uint64_t v25 = a6;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v31 = a6;
  uint64_t v32 = a7;
  uint64_t v33 = a8;
  uint64_t v11 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)&v29);
  uint64_t v23 = sub_213A8();
  uint64_t v12 = *(void *)(v23 - 8);
  uint64_t v13 = __chkstk_darwin(v23);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(a5 - 8);
  __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_210D8();
  sub_21098();
  uint64_t v28 = a2;
  char v19 = sub_21148();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, a5);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v15, 1, 1, v11);
    uint64_t v29 = v24;
    uint64_t v30 = a5;
    uint64_t v31 = v25;
    uint64_t v32 = a7;
    uint64_t v33 = v26;
    uint64_t v21 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)&v29);
    sub_19EC0((uint64_t)v15, v21);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v23);
    sub_11FD8(v21);
    return sub_12250(v27, v28, v21);
  }
  return result;
}

uint64_t type metadata accessor for AsyncSelectionConfirmingPicker(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for AsyncSelectionConfirmingPicker);
}

uint64_t sub_11FC0(uint64_t a1, uint64_t a2)
{
  return sub_12A88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_11D58);
}

uint64_t sub_11FD8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1 - 8;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(a1);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3238(&qword_30FE0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(int *)(v4 + 112);
  long long v19 = *(_OWORD *)(v2 + v11);
  sub_3238(&qword_30FD0);
  sub_20FE8();
  if (v20)
  {
    sub_3238(&qword_30FD8);
    sub_212A8();
    swift_release();
  }
  sub_21278();
  uint64_t v12 = sub_21298();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  sub_21268();
  uint64_t v13 = sub_21258();
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = &protocol witness table for MainActor;
  long long v16 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v15 + 32) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v15 + 48) = v16;
  *(void *)(v15 + 64) = *(void *)(a1 + 48);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v7, a1);
  uint64_t v17 = sub_17E88((uint64_t)v10, (uint64_t)&unk_31008, v15);
  long long v19 = *(_OWORD *)(v2 + v11);
  uint64_t v20 = v17;
  return sub_20FF8();
}

uint64_t sub_12250(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v35 + 64);
  uint64_t v8 = __chkstk_darwin(a1);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t v13 = v12 - 8;
  uint64_t v14 = *(void *)(v12 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v9);
  uint64_t v38 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_3238(&qword_30FE0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = *(int *)(v13 + 116);
  long long v39 = *(_OWORD *)(v4 + v37);
  uint64_t v36 = sub_3238(&qword_30FD0);
  sub_20FE8();
  if (v40)
  {
    sub_3238(&qword_30FD8);
    sub_212A8();
    swift_release();
  }
  uint64_t v32 = v18;
  sub_21278();
  uint64_t v19 = sub_21298();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 0, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v38, v4, a3);
  uint64_t v20 = v35;
  uint64_t v31 = v4;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v21(v11, v33, v6);
  v21((char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v34, v6);
  sub_21268();
  uint64_t v22 = sub_21258();
  unint64_t v23 = (*(unsigned __int8 *)(v14 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v24 = *(unsigned __int8 *)(v20 + 80);
  unint64_t v25 = (v15 + v23 + v24) & ~v24;
  uint64_t v34 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v26 = (v7 + v24 + v25) & ~v24;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v22;
  *(void *)(v27 + 24) = &protocol witness table for MainActor;
  *(void *)(v27 + 32) = *(void *)(a3 + 16);
  *(void *)(v27 + 40) = v6;
  *(_OWORD *)(v27 + 48) = *(_OWORD *)(a3 + 32);
  *(void *)(v27 + 64) = *(void *)(a3 + 48);
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v27 + v23, v38, a3);
  uint64_t v28 = *(void (**)(unint64_t, char *, uint64_t))(v20 + 32);
  v28(v27 + v25, v11, v6);
  v28(v27 + v26, v34, v6);
  uint64_t v29 = sub_17E88((uint64_t)v32, (uint64_t)&unk_30FF0, v27);
  long long v39 = *(_OWORD *)(v31 + v37);
  uint64_t v40 = v29;
  return sub_20FF8();
}

uint64_t sub_12610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v51 = a8;
  uint64_t v52 = a7;
  uint64_t v49 = a4;
  uint64_t v50 = a6;
  uint64_t v54 = a3;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = __chkstk_darwin(a1);
  uint64_t v14 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)v41 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)v41 - v18;
  uint64_t v20 = sub_20A58();
  uint64_t v47 = *(void *)(v20 - 8);
  uint64_t v48 = v20;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A38();
  unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v23(v19, a1, a5);
  uint64_t v46 = v17;
  uint64_t v53 = a2;
  v23(v17, a2, a5);
  uint64_t v45 = v22;
  uint64_t v24 = sub_20A48();
  os_log_type_t v25 = sub_212F8();
  int v26 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v27 = swift_slowAlloc();
    os_log_t v43 = v24;
    uint64_t v28 = v27;
    uint64_t v44 = swift_slowAlloc();
    v56[0] = v44;
    *(_DWORD *)uint64_t v28 = 136315394;
    v23(v14, (uint64_t)v19, a5);
    uint64_t v29 = sub_211A8();
    uint64_t v55 = sub_19714(v29, v30, v56);
    v41[1] = v56;
    sub_213B8();
    swift_bridgeObjectRelease();
    int v42 = v26;
    uint64_t v31 = *(void (**)(char *, uint64_t))(v11 + 8);
    v31(v19, a5);
    *(_WORD *)(v28 + 12) = 2080;
    v41[0] = v28 + 14;
    uint64_t v32 = v46;
    v23(v14, (uint64_t)v46, a5);
    uint64_t v33 = v31;
    uint64_t v34 = sub_211A8();
    uint64_t v55 = sub_19714(v34, v35, v56);
    sub_213B8();
    swift_bridgeObjectRelease();
    v31(v32, a5);
    os_log_t v36 = v43;
    _os_log_impl(&dword_0, v43, (os_log_type_t)v42, "Picker is displayed, but autodownloads options changed from somewhere else: %s -> %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
    v33(v19, a5);
    v33(v46, a5);
  }
  (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v48);
  v56[0] = v49;
  v56[1] = a5;
  v56[2] = v50;
  v56[3] = v52;
  v56[4] = v51;
  uint64_t v37 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)v56);
  sub_21018();
  sub_20FE8();
  uint64_t v38 = v53;
  char v39 = sub_21148();
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v14, a5);
  if ((v39 & 1) == 0) {
    return sub_12BA4(v38, v37);
  }
  return result;
}

uint64_t sub_12A70(uint64_t a1, uint64_t a2)
{
  return sub_12A88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_12610);
}

uint64_t sub_12A88(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  v15[0] = v3[2];
  uint64_t v6 = v15[0];
  v15[1] = v7;
  v15[2] = v8;
  v15[3] = v9;
  v15[4] = v10;
  uint64_t v11 = *(void *)(type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)v15) - 8);
  uint64_t v12 = (char *)v3 + ((*(unsigned __int8 *)(v11 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));

  return a3(a1, a2, v12, v6, v7, v8, v9, v10);
}

uint64_t sub_12B58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_12BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(a1);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v16 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)v16 - v11, a1, v6);
  v13(v10, (uint64_t)v12, v6);
  sub_210D8();
  sub_210A8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  sub_19DCC(a1, a2);
  v16[1] = *(_OWORD *)(v3 + *(int *)(a2 + 104));
  sub_3238(&qword_30FD0);
  uint64_t v14 = sub_20FE8();
  if (v17)
  {
    sub_3238(&qword_30FD8);
    sub_212A8();
    uint64_t v14 = swift_release();
  }
  __chkstk_darwin(v14);
  *(void *)&v16[-3] = *(void *)(a2 + 16);
  *((void *)&v16[-3] + 1) = v6;
  v16[-2] = *(_OWORD *)(a2 + 32);
  *(void *)&v16[-1] = *(void *)(a2 + 48);
  *((void *)&v16[-1] + 1) = v3;
  return sub_20B78();
}

uint64_t sub_12DC0@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  unint64_t v23 = a2;
  uint64_t v3 = a1[3];
  uint64_t v4 = sub_210D8();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = a1[4];
  uint64_t v21 = a1[5];
  uint64_t v22 = v5;
  uint64_t v20 = a1[6];
  uint64_t v24 = &type metadata for Text;
  uint64_t v25 = v3;
  uint64_t v26 = v5;
  uint64_t v27 = &protocol witness table for Text;
  uint64_t v28 = v21;
  uint64_t v29 = v20;
  uint64_t v6 = sub_21068();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v19 - v11;
  uint64_t v13 = sub_20C98();
  v19[2] = v14;
  v19[3] = v13;
  v19[1] = v15;
  sub_21018();
  sub_21008();
  sub_21048();
  swift_getWitnessTable();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v16(v12, v10, v6);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  v16(v23, v12, v6);
  return ((uint64_t (*)(char *, uint64_t))v17)(v12, v6);
}

uint64_t sub_1301C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v15[4] = a3;
  uint64_t v5 = sub_20F58();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v15 - v7;
  uint64_t v9 = a1[1];
  uint64_t v16 = *a1;
  uint64_t v17 = v9;
  sub_2820();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_20E38();
  v15[2] = v11;
  v15[3] = v10;
  v15[1] = v12;
  uint64_t v13 = a1[5];
  if (v13)
  {
    uint64_t v16 = a1[4];
    uint64_t v17 = v13;
    swift_bridgeObjectRetain();
    sub_20E38();
  }
  sub_16A24((uint64_t)a1, a2, (uint64_t)v8);
  sub_16D18(a2);
  return sub_20F18();
}

uint64_t sub_13198(uint64_t a1, uint64_t a2)
{
  sub_2820();
  swift_bridgeObjectRetain();
  sub_20E38();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRetain();
    sub_20E38();
  }
  sub_3238(&qword_31010);
  uint64_t v4 = *(void *)(sub_20F58() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22390;
  sub_16A24(a1, a2, v6 + v5);
  sub_16D18(a2);
  return sub_20B48();
}

uint64_t sub_1333C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 96);
}

uint64_t sub_13344(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t result = sub_210D8();
  if (v4 <= 0x3F)
  {
    uint64_t v12 = *(void *)(result - 8) + 64;
    uint64_t v13 = &unk_22B70;
    uint64_t result = sub_21018();
    if (v5 <= 0x3F)
    {
      uint64_t v14 = *(void *)(result - 8) + 64;
      uint64_t v6 = *(void *)(a1 + 48);
      v9[0] = *(void *)(a1 + 16);
      v9[1] = v2;
      long long v10 = *(_OWORD *)(a1 + 32);
      uint64_t v11 = v6;
      type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)v9);
      sub_213A8();
      uint64_t result = sub_21018();
      if (v7 <= 0x3F)
      {
        uint64_t v15 = *(void *)(result - 8) + 64;
        uint64_t v16 = &unk_22B88;
        uint64_t v17 = &unk_22B88;
        uint64_t v18 = (char *)&value witness table for () + 64;
        uint64_t v19 = (char *)&value witness table for () + 64;
        uint64_t result = sub_20B38();
        if (v8 <= 0x3F)
        {
          uint64_t v20 = *(void *)(result - 8) + 64;
          uint64_t v21 = (char *)&value witness table for () + 64;
          uint64_t v22 = &unk_22BA0;
          unint64_t v23 = (char *)&value witness table for Builtin.Int64 + 64;
          uint64_t v24 = &unk_22B88;
          uint64_t v25 = &unk_22B88;
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_1350C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v11 = v7 | 7;
  uint64_t v12 = sub_20B38();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(_DWORD *)(v13 + 80);
  uint64_t v15 = *(void *)(v13 + 64);
  int v16 = (*(_DWORD *)(v13 + 80) | v7) & 0x100000;
  uint64_t v17 = *a2;
  *a1 = *a2;
  if ((v11 | v14) != 7 || v16 != 0) {
    goto LABEL_11;
  }
  uint64_t v19 = ((v7 + 16) & ~(unint64_t)v7) + v10;
  uint64_t v20 = v10 + 7;
  unint64_t v21 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + v11;
  uint64_t v78 = v9 + 48;
  uint64_t v22 = v10 + v9;
  size_t v23 = ((v10 + v9 + ((v9 + 48) & ~v9)) & ~v9) + v10;
  uint64_t v24 = v11 + 17;
  unint64_t v25 = v21 + 8;
  if (((((((v15
           + ((v14
             + 16
             + ((((((((v23 + 7) & 0xFFFFFFFFFFFFFFF8)
                   + ((v21 + 8 + ((v11 + 17 + ((v19 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v11)) & ~v11)
                   + 31) & 0xFFFFFFFFFFFFFFF8)
                 + 23) & 0xFFFFFFFFFFFFFFF8)
               + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v14)
           + 31) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16 <= 0x18)
  {
    unint64_t v75 = (v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v71 = v22;
    size_t __n = v23;
    uint64_t v77 = v14;
    size_t v79 = v23 + 7;
    uint64_t v80 = v14 + 16;
    uint64_t v81 = v15;
    uint64_t v82 = v13;
    uint64_t v83 = v12;
    unsigned int v76 = v8;
    uint64_t v26 = ~v11;
    uint64_t v27 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v28 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v27 = *v28;
    uint64_t v84 = v5;
    uint64_t v85 = a1;
    uint64_t v29 = ((unint64_t)v27 + v9 + 8) & ~v9;
    unint64_t v74 = v25;
    uint64_t v30 = ((unint64_t)v28 + v9 + 8) & ~v9;
    uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    uint64_t v73 = v20;
    swift_retain();
    swift_retain();
    uint64_t v32 = v29;
    uint64_t v33 = v85;
    v31(v32, v30, v84);
    unint64_t v34 = ((unint64_t)v85 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v35 = ((unint64_t)a2 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(void *)unint64_t v34 = *(void *)v35;
    *(void *)(v34 + 8) = *(void *)(v35 + 8);
    *(unsigned char *)(v34 + 16) = *(unsigned char *)(v35 + 16);
    unint64_t v36 = (v24 + v34) & ~v11;
    unint64_t v37 = (v24 + v35) & ~v11;
    swift_retain();
    swift_retain();
    uint64_t v70 = (void (*)(unint64_t, unint64_t, uint64_t))v31;
    v31(v36, v37, v84);
    *(void *)((v73 + v36) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v73 + v37) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v38 = (void *)((v74 + v36) & v26);
    char v39 = (void *)((v74 + v37) & v26);
    swift_retain();
    if ((v76 & 0x80000000) != 0)
    {
      uint64_t v42 = ~v9;
      int v41 = (*(uint64_t (**)(unint64_t, void, uint64_t))(v6 + 48))(((unint64_t)v39 + v78) & ~v9, v76, v84);
    }
    else
    {
      unint64_t v40 = *(void *)((char *)&dword_8 + ((v74 + v37) & v26));
      if (v40 >= 0xFFFFFFFF) {
        LODWORD(v40) = -1;
      }
      int v41 = v40 + 1;
      uint64_t v42 = ~v9;
    }
    unint64_t v43 = v75 + 8;
    uint64_t v44 = ~v77;
    if (v41)
    {
      memcpy(v38, v39, __n);
    }
    else
    {
      *uint64_t v38 = *v39;
      v38[1] = *(void *)((char *)&dword_8 + ((v74 + v37) & v26));
      v38[2] = *(void *)((char *)&dword_10 + ((v74 + v37) & v26));
      v38[3] = *(void *)((char *)&dword_18 + ((v74 + v37) & v26));
      v38[4] = *(void *)((char *)&stru_20.cmd + ((v74 + v37) & v26));
      v38[5] = *(void *)&stru_20.segname[(v74 + v37) & v26];
      unint64_t v45 = ((unint64_t)v38 + v78) & v42;
      unint64_t v46 = ((unint64_t)v39 + v78) & v42;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v70(v45, v46, v84);
      uint64_t v47 = v71 + v46;
      uint64_t v33 = v85;
      v70((v71 + v45) & v42, v47 & v42, v84);
    }
    *(void *)(((unint64_t)v38 + v79) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v39 + v79) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v48 = (char *)v38 + v43;
    char *v48 = *((unsigned char *)v39 + v43);
    *((void *)v48 + 1) = *(void *)((char *)v39 + v43 + 8);
    unint64_t v49 = ((unint64_t)v38 + v43 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v50 = ((unint64_t)v39 + v43 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v49 = *(unsigned char *)v50;
    *(void *)(v49 + 8) = *(void *)(v50 + 8);
    uint64_t v51 = (void *)((v49 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v52 = (void *)((v50 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v53 = v52[1];
    void *v51 = *v52;
    v51[1] = v53;
    uint64_t v54 = (void *)(((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v55 = (void *)(((unint64_t)v52 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    unint64_t v57 = ((unint64_t)v54 + v80) & v44;
    unint64_t v58 = ((unint64_t)v55 + v80) & v44;
    uint64_t v59 = *(void (**)(unint64_t, unint64_t, uint64_t))(v82 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v59(v57, v58, v83);
    unint64_t v60 = (v57 + v81 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v61 = (v58 + v81 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v62 = *(void *)(v61 + 8);
    *(void *)unint64_t v60 = *(void *)v61;
    *(void *)(v60 + 8) = v62;
    *(unsigned char *)(v60 + 16) = *(unsigned char *)(v61 + 16);
    uint64_t v63 = (void *)((v57 + v81 + 31) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v64 = (void *)((v58 + v81 + 31) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v63 = *v64;
    uint64_t v65 = (void *)(((unint64_t)v63 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v66 = (void *)(((unint64_t)v64 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v65 = *v66;
    v65[1] = v66[1];
    uint64_t v67 = (void *)(((unint64_t)v65 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v68 = (void *)(((unint64_t)v66 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v67 = *v68;
    v67[1] = v68[1];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
LABEL_11:
    uint64_t v33 = (uint64_t *)(v17 + (((v9 | 7 | v14) + 16) & ~(v9 | 7 | v14)));
  }
  swift_retain();
  return v33;
}

uint64_t sub_13AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 15;
  swift_release();
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = v5 + v9 + 8;
  uint64_t v11 = ~v9;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v12(v10 & ~v9, v6);
  uint64_t v13 = *(void *)(v7 + 64);
  swift_release();
  swift_release();
  unint64_t v14 = ((v9 | 7) + ((v13 + 7 + a1 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 17) & ~(v9 | 7);
  v12(v14, v6);
  swift_release();
  unint64_t v15 = v9 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + v14 + 8;
  uint64_t v16 = v15 & ~(v9 | 7);
  if ((*(_DWORD *)(v8 + 84) & 0x80000000) != 0)
  {
    if ((*(unsigned int (**)(uint64_t))(v8 + 48))((v9 + v16 + 48) & v11))
    {
LABEL_5:
      uint64_t v18 = v9 + 48;
      uint64_t v19 = v13 + v9;
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v17 = *(void *)((char *)&dword_8 + (v15 & ~(v9 | 7)));
    if (v17 >= 0xFFFFFFFF) {
      LODWORD(v17) = -1;
    }
    if (v17 != -1) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = v9 + 48;
  uint64_t v20 = (v9 + 48 + v16) & v11;
  v12(v20, v6);
  uint64_t v19 = v13 + v9;
  v12((v19 + v20) & v11, v6);
LABEL_8:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v21 = sub_20B38();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v21 - 8) + 8))((((((((((((v19 + (v18 & v11)) & v11) + v13 + 7) & 0xFFFFFFFFFFFFFFF8) + v16 + 31) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ *(unsigned __int8 *)(*(void *)(v21 - 8) + 80)+ 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80), v21);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_13D94(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v5 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v68 = v7;
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = ((unint64_t)v4 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)v5 + v8 + 8) & ~v8;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v70 = v11;
  swift_retain();
  swift_retain();
  v11(v9, v10, v6);
  uint64_t v12 = *(void *)(v7 + 64);
  uint64_t v13 = v12 + 7 + ((v8 + 16) & ~v8);
  uint64_t v69 = a1;
  unint64_t v14 = ((unint64_t)a1 + v13) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = ((unint64_t)a2 + v13) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v14 = *(void *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  uint64_t v16 = (v8 | 7) + 17;
  uint64_t v17 = (v16 + v14) & ~(v8 | 7);
  uint64_t v18 = (v16 + v15) & ~(v8 | 7);
  swift_retain();
  swift_retain();
  uint64_t v19 = v6;
  uint64_t v20 = v6;
  uint64_t v21 = v12;
  v70(v17, v18, v20);
  *(void *)((v12 + 7 + v17) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v12 + 7 + v18) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = ((v12 + 7) & 0xFFFFFFFFFFFFFFF8) + (v8 | 7) + 8;
  size_t v23 = (void *)((v22 + v17) & ~(v8 | 7));
  uint64_t v24 = (void *)((v22 + v18) & ~(v8 | 7));
  uint64_t v25 = *(unsigned int *)(v68 + 84);
  uint64_t v26 = v8 + 48;
  uint64_t v27 = v12 + v8;
  uint64_t v28 = (v12 + v8 + ((v8 + 48) & ~v8)) & ~v8;
  swift_retain();
  if ((v25 & 0x80000000) == 0)
  {
    unint64_t v29 = v24[1];
    if (v29 >= 0xFFFFFFFF) {
      LODWORD(v29) = -1;
    }
    uint64_t v30 = v19;
    uint64_t v31 = ~v8;
    size_t v32 = v28 + v21;
    if (v29 != -1) {
      goto LABEL_5;
    }
LABEL_7:
    *size_t v23 = *v24;
    v23[1] = v24[1];
    v23[2] = v24[2];
    v23[3] = v24[3];
    v23[4] = v24[4];
    v23[5] = v24[5];
    unint64_t v34 = ((unint64_t)v23 + v26) & v31;
    unint64_t v35 = ((unint64_t)v24 + v26) & v31;
    uint64_t v36 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v70(v34, v35, v36);
    v70((v27 + v34) & v31, (v27 + v35) & v31, v36);
    goto LABEL_8;
  }
  int v33 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v68 + 48))(((unint64_t)v24 + v26) & ~v8, v25, v19);
  uint64_t v30 = v19;
  uint64_t v31 = ~v8;
  size_t v32 = v28 + v21;
  if (!v33) {
    goto LABEL_7;
  }
LABEL_5:
  memcpy(v23, v24, v32);
LABEL_8:
  *(void *)(((unint64_t)v23 + v32 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v24 + v32 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v37 = ((v32 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v38 = (char *)v23 + v37;
  char v39 = (char *)v24 + v37;
  *uint64_t v38 = *v39;
  *((void *)v38 + 1) = *((void *)v39 + 1);
  unint64_t v40 = (unint64_t)(v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (unint64_t)(v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v40 = *(unsigned char *)v41;
  *(void *)(v40 + 8) = *(void *)(v41 + 8);
  uint64_t v42 = (void *)((v40 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v43 = (void *)((v41 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v44 = v43[1];
  *uint64_t v42 = *v43;
  v42[1] = v44;
  unint64_t v45 = (void *)(((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v46 = (void *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v47 = v46[1];
  *unint64_t v45 = *v46;
  v45[1] = v47;
  uint64_t v48 = sub_20B38();
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  uint64_t v50 = v49 + 16;
  uint64_t v51 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v52 = ((unint64_t)v45 + v51 + 16) & ~v51;
  uint64_t v53 = ((unint64_t)v46 + v51 + 16) & ~v51;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v71(v52, v53, v48);
  uint64_t v54 = *(void *)(v50 + 48);
  uint64_t v55 = v54 + v52;
  uint64_t v56 = v54 + v53;
  unint64_t v57 = (v55 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v58 = (v56 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v59 = *(void *)(v58 + 8);
  *(void *)unint64_t v57 = *(void *)v58;
  *(void *)(v57 + 8) = v59;
  *(unsigned char *)(v57 + 16) = *(unsigned char *)(v58 + 16);
  unint64_t v60 = (void *)((v55 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v61 = (void *)((v56 + 31) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v60 = *v61;
  uint64_t v62 = (void *)(((unint64_t)v60 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v63 = (void *)(((unint64_t)v61 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v62 = *v63;
  v62[1] = v63[1];
  uint64_t v64 = (void *)(((unint64_t)v62 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v65 = (void *)(((unint64_t)v63 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v64 = *v65;
  v64[1] = v65[1];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v69;
}

void *sub_14258(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *(void *)(v6 & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a3 + 24);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v69 = v9;
  uint64_t v70 = ~v10;
  uint64_t v11 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 24);
  v11(((unint64_t)v7 + v10 + 8) & ~v10, (v10 + 8 + (v6 & 0xFFFFFFFFFFFFFFF8)) & ~v10, v8);
  uint64_t v12 = *(void *)(v9 + 64);
  uint64_t v13 = v12 + 7 + ((v10 + 16) & ~v10);
  uint64_t v68 = a1;
  unint64_t v14 = ((unint64_t)a1 + v13) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = ((unint64_t)a2 + v13) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v14 = *(void *)v15;
  swift_retain();
  swift_release();
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  uint64_t v16 = (v10 | 7) + 17;
  uint64_t v17 = (v16 + v14) & ~(v10 | 7);
  uint64_t v18 = (v16 + v15) & ~(v10 | 7);
  v11(v17, v18, v8);
  *(void *)((v12 + 7 + v17) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v12 + 7 + v18) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  unint64_t v19 = ((v12 + 7) & 0xFFFFFFFFFFFFFFF8) + (v10 | 7) + 8;
  uint64_t v20 = (void *)((v19 + v17) & ~(v10 | 7));
  uint64_t v21 = (void *)((v19 + v18) & ~(v10 | 7));
  uint64_t v22 = *(unsigned int *)(v69 + 84);
  uint64_t v23 = v10 + 48;
  uint64_t v24 = v12 + v10;
  size_t v25 = ((v12 + v10 + ((v10 + 48) & ~v10)) & ~v10) + v12;
  uint64_t v67 = v24;
  if ((v22 & 0x80000000) != 0)
  {
    unint64_t v29 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v69 + 48);
    int v30 = v29(((unint64_t)v20 + v23) & v70, v22, v8);
    int v27 = v29(((unint64_t)v21 + v23) & v70, v22, v8);
    if (!v30)
    {
LABEL_5:
      if (!v27)
      {
        *uint64_t v20 = *v21;
        v20[1] = v21[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v20[2] = v21[2];
        v20[3] = v21[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v20[4] = v21[4];
        v20[5] = v21[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v11(((unint64_t)v20 + v23) & v70, ((unint64_t)v21 + v23) & v70, v8);
        v11((v67 + (((unint64_t)v20 + v23) & v70)) & v70, (v67 + (((unint64_t)v21 + v23) & v70)) & v70, v8);
        goto LABEL_12;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v28 = *(void (**)(unint64_t, uint64_t))(v69 + 8);
      v28(((unint64_t)v20 + v23) & v70, v8);
      v28((v67 + (((unint64_t)v20 + v23) & v70)) & v70, v8);
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v26 = v21[1];
    if (v26 >= 0xFFFFFFFF) {
      LODWORD(v26) = -1;
    }
    int v27 = v26 + 1;
    if (v20[1] > 0xFFFFFFFEuLL) {
      goto LABEL_5;
    }
  }
  if (!v27)
  {
    *uint64_t v20 = *v21;
    v20[1] = v21[1];
    v20[2] = v21[2];
    v20[3] = v21[3];
    v20[4] = v21[4];
    v20[5] = v21[5];
    unint64_t v31 = ((unint64_t)v20 + v23) & v70;
    unint64_t v32 = (unint64_t)v21 + v23;
    size_t v33 = v25;
    unint64_t v34 = v32 & v70;
    unint64_t v35 = *(void (**)(unint64_t, unint64_t, uint64_t))(v69 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35(v31, v34, v8);
    uint64_t v36 = v67 + v34;
    size_t v25 = v33;
    v35((v67 + v31) & v70, v36 & v70, v8);
    goto LABEL_12;
  }
LABEL_9:
  memcpy(v20, v21, v25);
LABEL_12:
  *(void *)(((unint64_t)v20 + v25 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v21 + v25 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  unint64_t v37 = ((v25 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v38 = (char *)v20 + v37;
  char v39 = (char *)v21 + v37;
  *uint64_t v38 = *((unsigned char *)v21 + v37);
  *((void *)v38 + 1) = *(void *)((char *)v21 + v37 + 8);
  swift_retain();
  swift_release();
  unint64_t v40 = (unint64_t)(v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (unint64_t)(v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v40 = *(unsigned char *)v41;
  *(void *)(v40 + 8) = *(void *)(v41 + 8);
  swift_retain();
  swift_release();
  uint64_t v42 = (void *)((v40 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v43 = (void *)((v41 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v44 = v43[1];
  *uint64_t v42 = *v43;
  v42[1] = v44;
  swift_retain();
  swift_release();
  unint64_t v45 = (void *)(((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v46 = (void *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v47 = v46[1];
  *unint64_t v45 = *v46;
  v45[1] = v47;
  swift_retain();
  swift_release();
  uint64_t v48 = sub_20B38();
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = v49 + 24;
  uint64_t v51 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v52 = ((unint64_t)v45 + v51 + 16) & ~v51;
  uint64_t v53 = ((unint64_t)v46 + v51 + 16) & ~v51;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 24))(v52, v53, v48);
  uint64_t v54 = *(void *)(v50 + 40);
  uint64_t v55 = v54 + v52;
  uint64_t v56 = v54 + v53;
  unint64_t v57 = (v54 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v58 = (v56 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v59 = *(void *)(v58 + 8);
  *(void *)unint64_t v57 = *(void *)v58;
  *(void *)(v57 + 8) = v59;
  swift_retain();
  swift_release();
  *(unsigned char *)(v57 + 16) = *(unsigned char *)(v58 + 16);
  unint64_t v60 = (void *)((v55 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v61 = (void *)((v56 + 31) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v60 = *v61;
  uint64_t v62 = (void *)(((unint64_t)v60 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v63 = (void *)(((unint64_t)v61 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v62 = *v63;
  swift_retain();
  swift_release();
  v62[1] = v63[1];
  swift_retain();
  swift_release();
  uint64_t v64 = (void *)(((unint64_t)v62 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v65 = (void *)(((unint64_t)v63 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v64 = *v65;
  swift_retain();
  swift_release();
  v64[1] = v65[1];
  swift_retain();
  swift_release();
  return v68;
}

void *sub_148C0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  unint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v5 = *v6;
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v56 = ~v10;
  uint64_t v11 = *(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32);
  v11(((unint64_t)v5 + v10 + 8) & ~v10, ((unint64_t)v6 + v10 + 8) & ~v10, v7);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v13 = v12 + 7 + ((v10 + 16) & ~v10);
  unint64_t v57 = a1;
  unint64_t v14 = ((unint64_t)a1 + v13) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = ((unint64_t)a2 + v13) & 0xFFFFFFFFFFFFFFF8;
  char v16 = *(unsigned char *)(v15 + 16);
  *(_OWORD *)unint64_t v14 = *(_OWORD *)v15;
  *(unsigned char *)(v14 + 16) = v16;
  uint64_t v17 = (v10 | 7) + 17;
  uint64_t v18 = (v17 + v14) & ~(v10 | 7);
  uint64_t v19 = (v17 + v15) & ~(v10 | 7);
  v11(v18, v19, v7);
  *(void *)((v12 + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v12 + 7 + v19) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v20 = ((v12 + 7) & 0xFFFFFFFFFFFFFFF8) + (v10 | 7) + 8;
  uint64_t v21 = (_OWORD *)((v20 + v18) & ~(v10 | 7));
  uint64_t v22 = (void *)((v20 + v19) & ~(v10 | 7));
  uint64_t v23 = v10 + 48;
  uint64_t v24 = v12 + v10;
  uint64_t v25 = (v12 + v10 + ((v10 + 48) & ~v10)) & ~v10;
  if ((*(_DWORD *)(v9 + 84) & 0x80000000) == 0)
  {
    unint64_t v26 = v22[1];
    if (v26 >= 0xFFFFFFFF) {
      LODWORD(v26) = -1;
    }
    size_t v27 = v25 + v12;
    if (v26 != -1) {
      goto LABEL_5;
    }
LABEL_7:
    long long v29 = *(_OWORD *)v22;
    long long v30 = *((_OWORD *)v22 + 2);
    v21[1] = *((_OWORD *)v22 + 1);
    v21[2] = v30;
    *uint64_t v21 = v29;
    v11(((unint64_t)v21 + v23) & v56, ((unint64_t)v22 + v23) & v56, v7);
    v11((v24 + (((unint64_t)v21 + v23) & v56)) & v56, (v24 + (((unint64_t)v22 + v23) & v56)) & v56, v7);
    goto LABEL_8;
  }
  int v28 = (*(uint64_t (**)(unint64_t))(v9 + 48))(((unint64_t)v22 + v23) & v56);
  size_t v27 = v25 + v12;
  if (!v28) {
    goto LABEL_7;
  }
LABEL_5:
  memcpy(v21, v22, v27);
LABEL_8:
  *(void *)(((unint64_t)v21 + v27 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v22 + v27 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v31 = ((v27 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v32 = (_OWORD *)((char *)v21 + v31);
  size_t v33 = (_OWORD *)((char *)v22 + v31);
  *unint64_t v32 = *v33;
  unint64_t v34 = (_OWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v35 = (_OWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v34 = *v35;
  uint64_t v36 = (_OWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v37 = (_OWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v36 = *v37;
  uint64_t v38 = (_OWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  char v39 = (_OWORD *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v38 = *v39;
  uint64_t v40 = sub_20B38();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v41 + 32;
  uint64_t v43 = *(unsigned __int8 *)(v41 + 80);
  uint64_t v44 = ((unint64_t)v38 + v43 + 16) & ~v43;
  uint64_t v45 = ((unint64_t)v39 + v43 + 16) & ~v43;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v44, v45, v40);
  uint64_t v46 = *(void *)(v42 + 32);
  uint64_t v47 = v46 + v44;
  uint64_t v48 = v46 + v45;
  unint64_t v49 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v50 = (v48 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)unint64_t v49 = *(_OWORD *)v50;
  *(unsigned char *)(v49 + 16) = *(unsigned char *)(v50 + 16);
  uint64_t v51 = (void *)((v47 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v52 = (void *)((v48 + 31) & 0xFFFFFFFFFFFFFFF8);
  void *v51 = *v52;
  uint64_t v53 = (_OWORD *)(((unint64_t)v51 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v54 = (_OWORD *)(((unint64_t)v52 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v53 = *v54;
  *(_OWORD *)(((unint64_t)v53 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8);
  return v57;
}

void *sub_14C4C(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  unint64_t v7 = (unint64_t)a1 + 15;
  swift_release();
  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFF8;
  v6 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v7 & 0xFFFFFFFFFFFFFFF8) = *(void *)v6;
  swift_release();
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v66 = v10;
  uint64_t v67 = ~v11;
  uint64_t v12 = *(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 40);
  v12((v11 + 8 + v8) & ~v11, (v11 + 8 + v6) & ~v11, v9);
  uint64_t v13 = *(void *)(v10 + 64);
  uint64_t v14 = v13 + 7 + ((v11 + 16) & ~v11);
  uint64_t v65 = a1;
  unint64_t v15 = ((unint64_t)a1 + v14) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)a2 + v14) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v15 = *(void *)v16;
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_release();
  *(unsigned char *)(v15 + 16) = *(unsigned char *)(v16 + 16);
  uint64_t v17 = (v11 | 7) + 17;
  uint64_t v18 = (v17 + v15) & ~(v11 | 7);
  uint64_t v19 = (v17 + v16) & ~(v11 | 7);
  v12(v18, v19, v9);
  *(void *)((v13 + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v13 + 7 + v19) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  unint64_t v20 = ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + (v11 | 7) + 8;
  uint64_t v21 = (_OWORD *)((v20 + v18) & ~(v11 | 7));
  uint64_t v22 = (char *)((v20 + v19) & ~(v11 | 7));
  uint64_t v23 = *(unsigned int *)(v66 + 84);
  uint64_t v24 = v11 + 48;
  size_t __n = ((v13 + v11 + ((v11 + 48) & ~v11)) & ~v11) + v13;
  uint64_t v63 = v13 + v11;
  if ((v23 & 0x80000000) != 0)
  {
    long long v29 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v66 + 48);
    int v30 = v29(((unint64_t)v21 + v24) & v67, v23, v9);
    int v26 = v29((unint64_t)&v22[v24] & v67, v23, v9);
    if (!v30) {
      goto LABEL_5;
    }
LABEL_8:
    size_t v27 = v65;
    if (v26) {
      goto LABEL_9;
    }
    long long v32 = *(_OWORD *)v22;
    long long v33 = *((_OWORD *)v22 + 2);
    v21[1] = *((_OWORD *)v22 + 1);
    v21[2] = v33;
    *uint64_t v21 = v32;
    unint64_t v34 = *(void (**)(unint64_t, unint64_t, uint64_t))(v66 + 32);
    v34(((unint64_t)v21 + v24) & v67, (unint64_t)&v22[v24] & v67, v9);
    v34((v63 + (((unint64_t)v21 + v24) & v67)) & v67, (v63 + ((unint64_t)&v22[v24] & v67)) & v67, v9);
LABEL_12:
    uint64_t v31 = ((v13 + v11 + ((v11 + 48) & ~v11)) & ~v11) + v13;
    goto LABEL_13;
  }
  unint64_t v25 = *((void *)v22 + 1);
  if (v25 >= 0xFFFFFFFF) {
    LODWORD(v25) = -1;
  }
  int v26 = v25 + 1;
  if (*((void *)v21 + 1) <= 0xFFFFFFFEuLL) {
    goto LABEL_8;
  }
LABEL_5:
  size_t v27 = v65;
  if (!v26)
  {
    *(void *)uint64_t v21 = *(void *)v22;
    *((void *)v21 + 1) = *((void *)v22 + 1);
    swift_bridgeObjectRelease();
    *((void *)v21 + 2) = *((void *)v22 + 2);
    *((void *)v21 + 3) = *((void *)v22 + 3);
    swift_bridgeObjectRelease();
    *((void *)v21 + 4) = *((void *)v22 + 4);
    *((void *)v21 + 5) = *((void *)v22 + 5);
    swift_bridgeObjectRelease();
    v12(((unint64_t)v21 + v24) & v67, (unint64_t)&v22[v24] & v67, v9);
    v12((v63 + (((unint64_t)v21 + v24) & v67)) & v67, (v63 + ((unint64_t)&v22[v24] & v67)) & v67, v9);
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v28 = *(void (**)(unint64_t, uint64_t))(v66 + 8);
  v28(((unint64_t)v21 + v24) & v67, v9);
  v28((v63 + (((unint64_t)v21 + v24) & v67)) & v67, v9);
LABEL_9:
  uint64_t v31 = ((v13 + v11 + ((v11 + 48) & ~v11)) & ~v11) + v13;
  memcpy(v21, v22, __n);
LABEL_13:
  uint64_t v35 = v31 + 7;
  *(void *)(((unint64_t)v21 + v35) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v22[v35] & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  unint64_t v36 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v37 = (char *)v21 + v36;
  uint64_t v38 = &v22[v36];
  *unint64_t v37 = v22[v36];
  *((void *)v37 + 1) = *(void *)&v22[v36 + 8];
  swift_release();
  unint64_t v39 = (unint64_t)(v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v40 = (unint64_t)(v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v39 = *(unsigned char *)v40;
  *(void *)(v39 + 8) = *(void *)(v40 + 8);
  swift_release();
  uint64_t v41 = (_OWORD *)((v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v42 = (_OWORD *)((v40 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v41 = *v42;
  swift_release();
  uint64_t v43 = (_OWORD *)(((unint64_t)v41 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v44 = (_OWORD *)(((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v43 = *v44;
  swift_release();
  uint64_t v45 = sub_20B38();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = v46 + 40;
  uint64_t v48 = *(unsigned __int8 *)(v46 + 80);
  uint64_t v49 = ((unint64_t)v43 + v48 + 16) & ~v48;
  uint64_t v50 = ((unint64_t)v44 + v48 + 16) & ~v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 40))(v49, v50, v45);
  uint64_t v51 = *(void *)(v47 + 24);
  uint64_t v52 = v51 + v49;
  uint64_t v53 = v51 + v50;
  unint64_t v54 = (v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v55 = (v53 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)unint64_t v54 = *(_OWORD *)v55;
  swift_release();
  *(unsigned char *)(v54 + 16) = *(unsigned char *)(v55 + 16);
  uint64_t v56 = (void *)((v52 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v57 = (void *)((v53 + 31) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v56 = *v57;
  unint64_t v58 = (void *)(((unint64_t)v56 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v59 = (void *)(((unint64_t)v57 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v58 = *v59;
  swift_release();
  v58[1] = v59[1];
  swift_release();
  unint64_t v60 = (void *)(((unint64_t)v58 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v61 = (void *)(((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v60 = *v61;
  swift_release();
  v60[1] = v61[1];
  swift_release();
  return v27;
}

uint64_t sub_151F4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  if (v7 <= 0x7FFFFFFE) {
    int v9 = 2147483646;
  }
  else {
    int v9 = *(_DWORD *)(v6 + 84);
  }
  if (v8 - 1 < v8) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = v8 - 1;
  }
  uint64_t v11 = *(void *)(sub_20B38() - 8);
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = *(void *)(v6 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  if (v10 <= *(_DWORD *)(v11 + 84)) {
    unsigned int v15 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v15 = v10;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v16 = ((v12 + 16) & ~v12) + v13;
  uint64_t v17 = v12 | 7;
  uint64_t v18 = v13 + 7;
  uint64_t v19 = v12 + 48;
  uint64_t v20 = (v12 | 7) + 17;
  unint64_t v21 = ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + (v12 | 7) + 8;
  unint64_t v22 = ((v13 + 7 + ((v13 + v12 + ((v12 + 48) & ~v12)) & ~v12)) & 0xFFFFFFFFFFFFFFF8) + 31;
  uint64_t v23 = v14 + 16;
  if (v15 < a2)
  {
    unint64_t v24 = ((((((*(void *)(v11 + 64)
              + ((v23
                + ((((((v22 + ((v21 + ((v20 + ((v16 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v17)) & ~v17)) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v14)
              + 31) & 0xFFFFFFFFFFFFFFF8)
            + 15) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    if ((v24 & 0xFFFFFFF8) != 0) {
      unsigned int v25 = 2;
    }
    else {
      unsigned int v25 = a2 - v15 + 1;
    }
    if (v25 >= 0x10000) {
      unsigned int v26 = 4;
    }
    else {
      unsigned int v26 = 2;
    }
    if (v25 < 0x100) {
      unsigned int v26 = 1;
    }
    if (v25 >= 2) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    switch(v27)
    {
      case 1:
        int v28 = *((unsigned __int8 *)a1 + v24);
        if (!*((unsigned char *)a1 + v24)) {
          break;
        }
        goto LABEL_31;
      case 2:
        int v28 = *(unsigned __int16 *)((char *)a1 + v24);
        if (*(_WORD *)((char *)a1 + v24)) {
          goto LABEL_31;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x15604);
      case 4:
        int v28 = *(_DWORD *)((char *)a1 + v24);
        if (!v28) {
          break;
        }
LABEL_31:
        int v30 = v28 - 1;
        if ((v24 & 0xFFFFFFF8) != 0)
        {
          int v30 = 0;
          int v31 = *a1;
        }
        else
        {
          int v31 = 0;
        }
        return v15 + (v31 | v30) + 1;
      default:
        break;
    }
  }
  uint64_t v32 = ~v12;
  if (v8 == v15)
  {
    long long v33 = (unint64_t *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    if ((v7 & 0x80000000) == 0)
    {
      unint64_t v34 = *v33;
LABEL_39:
      if (v34 >= 0xFFFFFFFF) {
        LODWORD(v34) = -1;
      }
      return (v34 + 1);
    }
    uint64_t v36 = ((unint64_t)v33 + v12 + 8) & v32;
    goto LABEL_43;
  }
  unint64_t v35 = ((unint64_t)a1 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  if ((v15 & 0x80000000) == 0)
  {
    unint64_t v34 = *(void *)(v35 + 8);
    goto LABEL_39;
  }
  uint64_t v38 = ~v17;
  uint64_t v36 = (v20 + v35) & ~v17;
  if (v9 == v15)
  {
    if (v7 >= 0x7FFFFFFE)
    {
LABEL_43:
      unint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
      return v37(v36, v7, v5);
    }
    unint64_t v39 = *(void *)((v18 + v36) & 0xFFFFFFFFFFFFFFF8);
    if (v39 >= 0xFFFFFFFF) {
      LODWORD(v39) = -1;
    }
    if ((v39 + 1) >= 2) {
      return v39;
    }
    else {
      return 0;
    }
  }
  else
  {
    unint64_t v40 = (v21 + v36) & v38;
    if (v8 - 1 == v15)
    {
      if ((v7 & 0x80000000) != 0)
      {
        unsigned int v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))((v19 + v40) & v32, v7, v5);
      }
      else
      {
        unint64_t v41 = *(void *)((char *)&dword_8 + ((v21 + v36) & v38));
        if (v41 >= 0xFFFFFFFF) {
          LODWORD(v41) = -1;
        }
        unsigned int v42 = v41 + 1;
      }
      if (v42 >= 2) {
        return v42 - 1;
      }
      else {
        return 0;
      }
    }
    else
    {
      uint64_t v43 = *(uint64_t (**)(unint64_t))(v11 + 48);
      return v43((v23
                + ((((((v22 + v40) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v14);
    }
  }
}

void sub_15618(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v44 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  if (v9 <= 0x7FFFFFFE) {
    int v11 = 2147483646;
  }
  else {
    int v11 = *(_DWORD *)(v8 + 84);
  }
  int v43 = v11;
  if (v10 - 1 < v10) {
    unsigned int v12 = v10;
  }
  else {
    unsigned int v12 = v10 - 1;
  }
  uint64_t v13 = *(void *)(sub_20B38() - 8);
  uint64_t v14 = v13;
  if (v12 <= *(_DWORD *)(v13 + 84)) {
    unsigned int v15 = *(_DWORD *)(v13 + 84);
  }
  else {
    unsigned int v15 = v12;
  }
  uint64_t v16 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = *(void *)(v8 + 64);
  uint64_t v18 = ((v16 + 16) & ~v16) + v17;
  uint64_t v19 = v17 + 7;
  unint64_t v20 = ((v17 + 7) & 0xFFFFFFFFFFFFFFF8) + (v16 | 7);
  uint64_t v21 = ((v17 + v16 + ((v16 + 48) & ~v16)) & ~v16) + v17;
  uint64_t v22 = (v16 | 7) + 17;
  unint64_t v23 = v20 + 8;
  unint64_t v24 = (v20 + 8 + ((v22 + ((v18 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~(v16 | 7))) & ~(v16 | 7);
  unint64_t v25 = ((v21 + 7) & 0xFFFFFFFFFFFFFFF8) + 31;
  uint64_t v26 = *(unsigned __int8 *)(v13 + 80);
  size_t v27 = ((((((*(void *)(v13 + 64)
            + ((v26
              + 16
              + ((((((v25 + v24) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v26)
            + 31) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v15 >= a3)
  {
    int v30 = 0;
    int v31 = a2 - v15;
    if (a2 <= v15) {
      goto LABEL_26;
    }
LABEL_30:
    if (v27) {
      int v33 = 1;
    }
    else {
      int v33 = v31;
    }
    if (v27)
    {
      int v34 = ~v15 + a2;
      bzero(a1, v27);
      *a1 = v34;
    }
    switch(v30)
    {
      case 1:
        *((unsigned char *)a1 + v27) = v33;
        break;
      case 2:
        *(_WORD *)((char *)a1 + v27) = v33;
        break;
      case 3:
LABEL_69:
        __break(1u);
        JUMPOUT(0x15A74);
      case 4:
        *(_DWORD *)((char *)a1 + v27) = v33;
        break;
      default:
        return;
    }
    return;
  }
  if (((((((*(_DWORD *)(v13 + 64)
           + ((v26 + 16 + ((((((v25 + v24) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)) & ~v26)
           + 31) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
    unsigned int v28 = a3 - v15 + 1;
  else {
    unsigned int v28 = 2;
  }
  if (v28 >= 0x10000) {
    int v29 = 4;
  }
  else {
    int v29 = 2;
  }
  if (v28 < 0x100) {
    int v29 = 1;
  }
  if (v28 >= 2) {
    int v30 = v29;
  }
  else {
    int v30 = 0;
  }
  int v31 = a2 - v15;
  if (a2 > v15) {
    goto LABEL_30;
  }
LABEL_26:
  uint64_t v32 = ~(v16 | 7);
  switch(v30)
  {
    case 1:
      *((unsigned char *)a1 + v27) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 2:
      *(_WORD *)((char *)a1 + v27) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 3:
      goto LABEL_69;
    case 4:
      *(_DWORD *)((char *)a1 + v27) = 0;
      goto LABEL_38;
    default:
LABEL_38:
      if (!a2) {
        return;
      }
LABEL_39:
      if (v10 == v15)
      {
        unint64_t v35 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v9 & 0x80000000) == 0)
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v36 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v36 = (a2 - 1);
          }
          goto LABEL_59;
        }
        uint64_t v38 = ((unint64_t)v35 + v16 + 8) & ~v16;
        goto LABEL_51;
      }
      unint64_t v37 = ((unint64_t)a1 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
      if ((v15 & 0x80000000) == 0)
      {
        if ((a2 & 0x80000000) != 0)
        {
          *(unsigned char *)(v37 + 16) = 0;
          *(void *)unint64_t v37 = a2 ^ 0x80000000;
          *(void *)(v37 + 8) = 0;
        }
        else
        {
          *(void *)(v37 + 8) = (a2 - 1);
        }
        return;
      }
      uint64_t v38 = (v22 + v37) & v32;
      if (v43 == v15)
      {
        if (v9 >= 0x7FFFFFFE)
        {
LABEL_51:
          unint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56);
          v39(v38, a2, v9, v7);
          return;
        }
        unint64_t v35 = (void *)((v19 + v38) & 0xFFFFFFFFFFFFFFF8);
        if (a2 <= 0x7FFFFFFE)
        {
          uint64_t v36 = a2;
LABEL_59:
          *unint64_t v35 = v36;
          return;
        }
        *unint64_t v35 = 0;
        *(_DWORD *)unint64_t v35 = a2 - 0x7FFFFFFF;
      }
      else
      {
        unint64_t v40 = (_DWORD *)((v23 + v38) & v32);
        if (v10 - 1 == v15)
        {
          int v41 = (v21 + 7) & 0xFFFFFFF8;
          if (v41 != -8)
          {
            bzero((void *)((v23 + v38) & v32), (v41 + 8));
            *unint64_t v40 = a2 - v10;
          }
        }
        else
        {
          unsigned int v42 = *(void (**)(unint64_t, uint64_t))(v14 + 56);
          v42((v26+ 16+ (((((((unint64_t)v40 + v25) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v26, a2);
        }
      }
      break;
  }
}

uint64_t sub_15A9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_15D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 56);
}

uint64_t sub_15D10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_15D54(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_15DAC(void *a1, void *a2)
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
  return a1;
}

__n128 sub_15E3C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *sub_15E50(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_15EA8(uint64_t a1, int a2)
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

uint64_t sub_15EF0(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationText(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for AsyncSelectionConfirmingPicker.ConfirmationText);
}

uint64_t sub_15F54()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_15FF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = v7 + v6;
  unint64_t v9 = ((v7 + v6 + ((v6 + 48) & ~v6)) & ~v6) + v7;
  if (v6 > 7 || (*(_DWORD *)(v5 + 80) & 0x100000) != 0 || v9 > 0x18)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v13 = ~v6;
    uint64_t v14 = a2[1];
    *a1 = *a2;
    a1[1] = v14;
    uint64_t v15 = a2[3];
    a1[2] = a2[2];
    a1[3] = v15;
    uint64_t v16 = a2[5];
    a1[4] = a2[4];
    a1[5] = v16;
    uint64_t v17 = ((unint64_t)a1 + v6 + 48) & ~v6;
    uint64_t v18 = ((unint64_t)a2 + v6 + 48) & ~v6;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v17, v18, v4);
    v19((v8 + v17) & v13, (v8 + v18) & v13, v4);
  }
  return a1;
}

uint64_t sub_16158(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v10 = v5 + 8;
  int v11 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (a1 + v6 + 48) & ~v6;
  v11(v7, v4);
  uint64_t v8 = (*(void *)(v10 + 56) + v6 + v7) & ~v6;

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v8, v4);
}

void *sub_16220(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  uint64_t v9 = *(void *)(v7 - 8) + 16;
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v11 = ((unint64_t)a2 + v10 + 48) & ~v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(((unint64_t)a1 + v10 + 48) & ~v10, v11, v7);
  v8((*(void *)(v9 + 48) + v10 + (((unint64_t)a1 + v10 + 48) & ~v10)) & ~v10, (*(void *)(v9 + 48) + v10 + v11) & ~v10, v7);
  return a1;
}

void *sub_16308(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 24);
  uint64_t v9 = v7 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = ((unint64_t)a2 + v10 + 48) & ~v10;
  v8(((unint64_t)a1 + v10 + 48) & ~v10, v11, v6);
  v8((*(void *)(v9 + 40) + v10 + (((unint64_t)a1 + v10 + 48) & ~v10)) & ~v10, (*(void *)(v9 + 40) + v10 + v11) & ~v10, v6);
  return a1;
}

_OWORD *sub_16424(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v8 = v6 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 48) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 48) & ~v9;
  v7(v10, v11, v5);
  v7((*(void *)(v8 + 32) + v9 + v10) & ~v9, (*(void *)(v8 + 32) + v9 + v11) & ~v9, v5);
  return a1;
}

void *sub_164E8(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 40);
  uint64_t v12 = v10 + 40;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = ((unint64_t)a2 + v13 + 48) & ~v13;
  v11(((unint64_t)a1 + v13 + 48) & ~v13, v14, v9);
  v11((*(void *)(v12 + 24) + v13 + (((unint64_t)a1 + v13 + 48) & ~v13)) & ~v13, (*(void *)(v12 + 24) + v13 + v14) & ~v13, v9);
  return a1;
}

uint64_t sub_165D4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  uint64_t v10 = ((v7 + v6 + ((v6 + 48) & ~v6)) & ~v6) + v7;
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 48) & ~v6);
      }
      unint64_t v16 = *((void *)a1 + 1);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_16780(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + v9 + ((v9 + 48) & ~v9)) & ~v9)
      + *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x169FCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 48] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *((void *)a1 + 5) = 0;
          *(_OWORD *)(a1 + 24) = 0u;
          *(_OWORD *)(a1 + 8) = 0u;
          *(void *)a1 = a2 ^ 0x80000000;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t sub_16A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v25[1] = a3;
  uint64_t v7 = sub_20B38();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  BOOL v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a2);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v15 + 32) = v16;
  *(void *)(v15 + 48) = *(void *)(a2 + 48);
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  sub_20B08();
  LOBYTE(v4) = sub_20B18();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v18 = *(void *)(a1 + 24);
  v25[4] = v17;
  v25[5] = v18;
  sub_2820();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_20E38();
  if (v4)
  {
    uint64_t v22 = v19;
    char v23 = v20 & 1;
    swift_retain();
    sub_20F28();
  }
  else
  {
    uint64_t v22 = v19;
    char v23 = v20 & 1;
    swift_retain();
    sub_20F48();
  }
  swift_release();
  sub_65B8(v21, v22, v23);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_16D18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  long long v6 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 48) = *(void *)(a1 + 48);
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v5 + v4, (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_20F38();
  return swift_release();
}

uint64_t sub_16E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v7 = (char *)&v20[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20[-1] - v8;
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v12;
  v20[3] = v13;
  v20[4] = v14;
  uint64_t v15 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)v20);
  sub_21018();
  sub_20FE8();
  sub_210D8();
  sub_21098();
  char v16 = sub_21148();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v4 + 8);
  v17(v7, a3);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v17)(v9, a3);
  if ((v16 & 1) == 0)
  {
    sub_20FE8();
    sub_12BA4((uint64_t)v9, v15);
    return ((uint64_t (*)(char *, uint64_t))v17)(v9, a3);
  }
  return result;
}

uint64_t sub_17008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v13 = (char *)&v17[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_210D8();
  sub_21098();
  v17[0] = a2;
  v17[1] = a3;
  v17[2] = a4;
  v17[3] = a5;
  v17[4] = a6;
  uint64_t v14 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)v17);
  sub_19DCC((uint64_t)v13, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a3);
}

uint64_t sub_17118@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  long long v13 = a1[1];
  *(_OWORD *)a9 = *a1;
  *((_OWORD *)a9 + 1) = v13;
  *((_OWORD *)a9 + 2) = a1[2];
  v17[0] = a4;
  v17[1] = a5;
  v17[2] = a6;
  v17[3] = a7;
  v17[4] = a8;
  uint64_t v14 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(0, (uint64_t)v17);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32);
  v15(&a9[*(int *)(v14 + 60)], a2, a5);
  return ((uint64_t (*)(char *, uint64_t, uint64_t))v15)(&a9[*(int *)(v14 + 64)], a3, a5);
}

uint64_t sub_171E4(uint64_t a1, void *a2)
{
  uint64_t v28 = a1;
  uint64_t v3 = sub_20A58();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v11 = a2[6];
  v33[0] = v8;
  v33[1] = v7;
  uint64_t v30 = v9;
  uint64_t v31 = v7;
  v33[2] = v10;
  v33[3] = v9;
  uint64_t v29 = v11;
  v33[4] = v11;
  uint64_t v12 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)v33);
  uint64_t v13 = sub_213A8();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  char v16 = (char *)&v27 - v15;
  if (sub_212B8())
  {
    uint64_t v17 = v4;
    sub_20A28();
    uint64_t v18 = sub_20A48();
    os_log_type_t v19 = sub_212F8();
    if (os_log_type_enabled(v18, v19))
    {
      char v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v20 = 0;
      _os_log_impl(&dword_0, v18, v19, "Confirmation task was completed before computation finished, won't show confirmation", v20, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v6, v3);
  }
  else
  {
    uint64_t v22 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v28, v13);
    uint64_t v23 = v32;
    sub_19EC0((uint64_t)v16, (uint64_t)a2);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v22, 1, v12);
    uint64_t v24 = sub_1051C();
    __chkstk_darwin(v24);
    uint64_t v25 = v31;
    *(&v27 - 6) = v8;
    *(&v27 - 5) = v25;
    uint64_t v26 = v30;
    *(&v27 - 4) = v10;
    *(&v27 - 3) = v26;
    *(&v27 - 2) = v29;
    *(&v27 - 1) = v23;
    return sub_20B78();
  }
}

uint64_t sub_174F4(void *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v16 = a1[2];
  v17[0] = v16;
  v17[1] = v3;
  v17[2] = v4;
  v17[3] = v5;
  v17[4] = v6;
  uint64_t v7 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)v17);
  uint64_t v8 = sub_213A8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - v10;
  uint64_t result = sub_212B8();
  if ((result & 1) == 0)
  {
    sub_10470((uint64_t)a1);
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v11, 1, v7);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (v13 == 1)
    {
      uint64_t v14 = sub_21128();
      __chkstk_darwin(v14);
      *(&v15 - 6) = v16;
      *(&v15 - 5) = v3;
      *(&v15 - 4) = v4;
      *(&v15 - 3) = v5;
      *(&v15 - 2) = v6;
      *(&v15 - 1) = v1;
      sub_20B78();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_176BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v16 = a6;
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)&v12) + 60));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  LOBYTE(v8) = *((unsigned char *)v8 + 16);
  uint64_t v12 = v9;
  uint64_t v13 = v10;
  LOBYTE(v14) = (_BYTE)v8;
  char v17 = a7;
  sub_3238(&qword_30808);
  return sub_210A8();
}

uint64_t sub_17744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a4;
  v8[2] = a5;
  v8[3] = a6;
  v8[4] = a7;
  v8[5] = a8;
  v8[6] = v15;
  uint64_t v9 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)(v8 + 2));
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  uint64_t v10 = sub_20A58();
  v8[12] = v10;
  v8[13] = *(void *)(v10 - 8);
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  sub_21268();
  v8[17] = sub_21258();
  uint64_t v12 = sub_21248();
  v8[18] = v12;
  v8[19] = v11;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_178C8, v12, v11);
}

uint64_t sub_178C8()
{
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[9];
  sub_20A28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  uint64_t v5 = sub_20A48();
  os_log_type_t v6 = sub_212F8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = v0[10];
    uint64_t v7 = v0[11];
    uint64_t v9 = v0[9];
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    uint64_t v11 = *(void *)(v7 + *(int *)(v9 + 100));
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v0[7] = v11;
    sub_213B8();
    _os_log_impl(&dword_0, v5, v6, "Delaying confirmation UI by %lluns...", v10, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  }
  uint64_t v12 = v0[16];
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[13];
  uint64_t v16 = v0[8];
  uint64_t v15 = v0[9];

  char v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v0[20] = v17;
  v0[21] = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v12, v13);
  uint64_t v18 = *(void *)(v16 + *(int *)(v15 + 100));
  os_log_type_t v19 = (void *)swift_task_alloc();
  v0[22] = v19;
  *os_log_type_t v19 = v0;
  v19[1] = sub_17AD0;
  return static Task<>.sleep(nanoseconds:)(v18);
}

uint64_t sub_17AD0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 144);
  if (v0) {
    uint64_t v5 = sub_17DF4;
  }
  else {
    uint64_t v5 = sub_17C0C;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_17C0C()
{
  uint64_t v1 = v0[23];
  swift_release();
  sub_212C8();
  if (v1)
  {
    sub_20A28();
    uint64_t v2 = sub_20A48();
    os_log_type_t v3 = sub_212F8();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, v3, "Task cancelled, skipping confirmation display", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[20];
    uint64_t v6 = v0[14];
    uint64_t v7 = v0[12];
    swift_errorRelease();

    v5(v6, v7);
  }
  else
  {
    sub_20A28();
    uint64_t v8 = sub_20A48();
    os_log_type_t v9 = sub_212F8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "Showing confirmation sheet.", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[20];
    uint64_t v12 = v0[15];
    uint64_t v13 = v0[12];
    uint64_t v14 = (void *)v0[9];

    v11(v12, v13);
    sub_174F4(v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_17DF4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_17E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21298();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21288();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1A638(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21248();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_18008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[26] = v19;
  v8[27] = v20;
  v8[24] = a8;
  v8[25] = v18;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[8] = a7;
  v8[9] = a8;
  v8[10] = v18;
  v8[11] = v19;
  v8[12] = v20;
  uint64_t v11 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)(v8 + 8));
  v8[28] = v11;
  uint64_t v12 = sub_213A8();
  v8[29] = v12;
  v8[30] = *(void *)(v12 - 8);
  v8[31] = swift_task_alloc();
  v8[32] = *(void *)(a8 - 8);
  v8[33] = swift_task_alloc();
  v8[34] = swift_task_alloc();
  v8[35] = *(void *)(v11 - 8);
  v8[36] = swift_task_alloc();
  v8[37] = *(void *)(a7 - 8);
  v8[38] = swift_task_alloc();
  v8[39] = swift_task_alloc();
  unsigned char v8[40] = swift_task_alloc();
  v8[41] = swift_task_alloc();
  uint64_t v13 = sub_213A8();
  v8[42] = v13;
  v8[43] = *(void *)(v13 - 8);
  v8[44] = swift_task_alloc();
  v8[45] = swift_task_alloc();
  uint64_t v14 = sub_20A58();
  v8[46] = v14;
  v8[47] = *(void *)(v14 - 8);
  v8[48] = swift_task_alloc();
  v8[49] = swift_task_alloc();
  v8[50] = swift_task_alloc();
  v8[51] = swift_task_alloc();
  v8[52] = swift_task_alloc();
  v8[53] = swift_task_alloc();
  v8[54] = sub_21268();
  v8[55] = sub_21258();
  uint64_t v15 = (void *)swift_task_alloc();
  v8[56] = v15;
  *uint64_t v15 = v8;
  v15[1] = sub_18390;
  return sub_1A698();
}

uint64_t sub_18390()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 456) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_21248();
  if (v0)
  {
    uint64_t v5 = sub_186C4;
  }
  else
  {
    *(void *)(v2 + 464) = v3;
    *(void *)(v2 + 472) = v4;
    uint64_t v5 = sub_184F4;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v3, v4);
}

uint64_t sub_184F4()
{
  sub_20A28();
  uint64_t v1 = sub_20A48();
  os_log_type_t v2 = sub_212F8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "Starting task to compute confirmation state...", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v6 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 160);
  long long v16 = *(_OWORD *)(v0 + 200);
  long long v17 = *(_OWORD *)(v0 + 184);

  os_log_type_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v0 + 480) = v9;
  *(void *)(v0 + 488) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v4, v5);
  *(_OWORD *)(v0 + 104) = v17;
  *(_OWORD *)(v0 + 120) = v16;
  *(void *)(v0 + 136) = v7;
  uint64_t v10 = type metadata accessor for AsyncSelectionConfirmingPicker(0, v0 + 104);
  *(void *)(v0 + 496) = v10;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + *(int *)(v10 + 80))
                                                          + **(int **)(v8 + *(int *)(v10 + 80)));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 504) = v11;
  void *v11 = v0;
  v11[1] = sub_18804;
  uint64_t v12 = *(void *)(v0 + 360);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v14 = *(void *)(v0 + 176);
  return v18(v12, v13, v14);
}

uint64_t sub_186C4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_18804()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 472);
  uint64_t v3 = *(void *)(v1 + 464);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_18924, v3, v2);
}

uint64_t sub_18924()
{
  unsigned int v42 = v0;
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[23];
  (*(void (**)(uint64_t, void, void))(v0[43] + 16))(v1, v0[45], v0[42]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    uint64_t v5 = v0[43];
    uint64_t v4 = v0[44];
    uint64_t v6 = v0[42];
    swift_release();
    unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v39(v4, v6);
    sub_20A28();
    uint64_t v7 = sub_20A48();
    os_log_type_t v8 = sub_212F8();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "This change does not require confirmation - applying.", v9, 2u);
      swift_slowDealloc();
    }
    uint64_t v10 = v0[62];
    uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[60];
    uint64_t v12 = v0[52];
    uint64_t v13 = v0[46];
    uint64_t v14 = v0[22];

    v11(v12, v13);
    sub_12BA4(v14, v10);
    v39(v0[45], v0[42]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  else
  {
    uint64_t v18 = v0[40];
    uint64_t v17 = v0[41];
    uint64_t v19 = v0[37];
    uint64_t v20 = v0[23];
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 32))(v17, v0[44], v20);
    sub_20A28();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
    v0[64] = v21;
    v0[65] = (v19 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v21(v18, v17, v20);
    uint64_t v22 = sub_20A48();
    os_log_type_t v23 = sub_212F8();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v25 = (void (*)(uint64_t, uint64_t))v0[60];
    uint64_t v26 = v0[51];
    uint64_t v27 = v0[46];
    uint64_t v28 = v0[40];
    if (v24)
    {
      os_log_type_t type = v23;
      uint64_t v29 = v0[39];
      uint64_t v38 = v0[46];
      unint64_t v40 = (void (*)(uint64_t, uint64_t))v0[60];
      uint64_t v30 = v0[37];
      uint64_t v31 = v0[23];
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      v21(v29, v28, v31);
      uint64_t v33 = sub_211A8();
      v0[19] = sub_19714(v33, v34, &v41);
      sub_213B8();
      swift_bridgeObjectRelease();
      unint64_t v35 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v35(v28, v31);
      _os_log_impl(&dword_0, v22, type, "Determined confirmation state - yielding for other tasks. State: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v40(v26, v38);
    }
    else
    {
      unint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0[37] + 8);
      v35(v0[40], v0[23]);

      v25(v26, v27);
    }
    v0[66] = v35;
    uint64_t v36 = (void *)swift_task_alloc();
    v0[67] = v36;
    *uint64_t v36 = v0;
    v36[1] = sub_18E10;
    return static Task<>.yield()();
  }
}

uint64_t sub_18E10()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 472);
  uint64_t v3 = *(void *)(v1 + 464);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_18F30, v3, v2);
}

uint64_t sub_18F30()
{
  uint64_t v68 = v0;
  uint64_t v1 = *(void *)(v0 + 456);
  swift_release();
  sub_212C8();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 360);
    uint64_t v3 = *(void *)(v0 + 336);
    uint64_t v4 = *(void *)(v0 + 344);
    (*(void (**)(void, void))(v0 + 528))(*(void *)(v0 + 328), *(void *)(v0 + 184));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 512);
    uint64_t v7 = *(void *)(v0 + 328);
    uint64_t v8 = *(void *)(v0 + 304);
    uint64_t v9 = *(void *)(v0 + 184);
    sub_20A28();
    v6(v8, v7, v9);
    uint64_t v10 = sub_20A48();
    os_log_type_t v11 = sub_212F8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 512);
      unint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
      uint64_t v58 = *(void *)(v0 + 400);
      uint64_t v56 = *(void *)(v0 + 368);
      uint64_t v13 = *(void *)(v0 + 304);
      uint64_t v12 = *(void *)(v0 + 312);
      unint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
      uint64_t v14 = *(void *)(v0 + 184);
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      v53(v12, v13, v14);
      uint64_t v16 = sub_211A8();
      *(void *)(v0 + 144) = sub_19714(v16, v17, &v67);
      sub_213B8();
      swift_bridgeObjectRelease();
      v54(v13, v14);
      _os_log_impl(&dword_0, v10, v11, "Computing titles from configuration state. State: %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v60(v58, v56);
    }
    else
    {
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
      uint64_t v19 = *(void *)(v0 + 400);
      uint64_t v20 = *(void *)(v0 + 368);
      (*(void (**)(void, void))(v0 + 528))(*(void *)(v0 + 304), *(void *)(v0 + 184));

      v18(v19, v20);
    }
    uint64_t v22 = *(void *)(v0 + 264);
    uint64_t v21 = *(void *)(v0 + 272);
    uint64_t v23 = *(void *)(v0 + 256);
    uint64_t v63 = *(void *)(v0 + 216);
    uint64_t v59 = *(char **)(v0 + 288);
    uint64_t v61 = *(void *)(v0 + 208);
    uint64_t v24 = *(void *)(v0 + 192);
    uint64_t v25 = *(void *)(v0 + 176);
    uint64_t v55 = *(void *)(v0 + 184);
    uint64_t v57 = *(void *)(v0 + 200);
    uint64_t v26 = *(void *)(v0 + 168);
    (*(void (**)(void))(*(void *)(v0 + 160) + *(int *)(*(void *)(v0 + 496) + 84)))(*(void *)(v0 + 328));
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
    v27(v21, v26, v24);
    v27(v22, v25, v24);
    sub_17118((_OWORD *)(v0 + 16), v21, v22, v55, v24, v57, v61, v63, v59);
    sub_20A28();
    uint64_t v28 = sub_20A48();
    os_log_type_t v29 = sub_212F8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "Updating confirmation UI for titles...", v30, 2u);
      swift_slowDealloc();
    }
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    uint64_t v32 = *(void *)(v0 + 392);
    uint64_t v64 = *(void **)(v0 + 496);
    uint64_t v33 = *(void *)(v0 + 368);
    unint64_t v34 = v28;
    uint64_t v36 = *(void *)(v0 + 280);
    uint64_t v35 = *(void *)(v0 + 288);
    uint64_t v37 = *(void *)(v0 + 240);
    uint64_t v38 = *(void *)(v0 + 248);
    uint64_t v39 = *(void *)(v0 + 224);
    uint64_t v62 = *(void *)(v0 + 232);

    v31(v32, v33);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v38, v35, v39);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v38, 0, 1, v39);
    sub_171E4(v38, v64);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v62);
    sub_20A28();
    unint64_t v40 = sub_20A48();
    os_log_type_t v41 = sub_212F8();
    if (os_log_type_enabled(v40, v41))
    {
      unsigned int v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "Confirmation state computation complete.", v42, 2u);
      swift_slowDealloc();
    }
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    uint64_t v44 = *(void *)(v0 + 384);
    uint64_t v45 = *(void *)(v0 + 368);
    uint64_t v46 = *(void *)(v0 + 344);
    uint64_t v65 = *(void *)(v0 + 328);
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    uint64_t v47 = *(void *)(v0 + 288);
    uint64_t v48 = v40;
    uint64_t v49 = *(void *)(v0 + 280);
    uint64_t v50 = *(void *)(v0 + 224);
    uint64_t v51 = *(void *)(v0 + 184);

    v43(v44, v45);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v50);
    v66(v65, v51);
    (*(void (**)(void, void))(v46 + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v5();
}

uint64_t sub_19628(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_19638(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_19674(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1969C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_19714(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_213B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_19714(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_197E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_4448((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_4448((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_19D7C((uint64_t)v12);
  return v7;
}

uint64_t sub_197E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_213C8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_199A4(a5, a6);
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
  uint64_t v8 = sub_21468();
  if (!v8)
  {
    sub_214C8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_214F8();
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

uint64_t sub_199A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_19A3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_19C1C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_19C1C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_19A3C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_19BB4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21438();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_214C8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_211E8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_214F8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_214C8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_19BB4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_3238(&qword_30FC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19C1C(char a1, int64_t a2, char a3, char *a4)
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
    sub_3238(&qword_30FC8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_214F8();
  __break(1u);
  return result;
}

unsigned char **sub_19D6C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_19D7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_19DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24);
  __chkstk_darwin(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v2);
  sub_21018();
  return sub_20FF8();
}

uint64_t sub_19EA4()
{
  return sub_1AAB4(0);
}

uint64_t sub_19EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 48);
  long long v4 = *(_OWORD *)(a2 + 32);
  v9[0] = *(_OWORD *)(a2 + 16);
  v9[1] = v4;
  uint64_t v10 = v3;
  type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(255, (uint64_t)v9);
  uint64_t v5 = sub_213A8();
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v9 - v6, a1, v5);
  sub_21018();
  return sub_20FF8();
}

uint64_t sub_19FCC()
{
  uint64_t v1 = *((void *)v0 + 5);
  uint64_t v2 = *((void *)v0 + 6);
  uint64_t v15 = *((void *)v0 + 7);
  uint64_t v14 = *((void *)v0 + 8);
  uint64_t v21 = *((void *)v0 + 4);
  uint64_t v16 = v21;
  uint64_t v22 = v1;
  uint64_t v23 = v2;
  uint64_t v24 = v15;
  uint64_t v25 = v14;
  uint64_t v3 = (int *)type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)&v21);
  uint64_t v20 = *(unsigned __int8 *)(*((void *)v3 - 1) + 80);
  uint64_t v18 = *(void *)(*((void *)v3 - 1) + 64);
  uint64_t v4 = *(void *)(v1 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = *(void *)(v4 + 64);
  swift_unknownObjectRelease();
  uint64_t v19 = (v20 + 72) & ~v20;
  swift_release();
  swift_release();
  uint64_t v6 = sub_210D8();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v4 + 8);
  v7(&v0[v19 + *(int *)(v6 + 32)], v1);
  swift_release();
  swift_release();
  v7(&v0[v19 + v3[16]], v1);
  sub_21018();
  swift_release();
  int64_t v8 = &v0[v19 + v3[17]];
  uint64_t v21 = v16;
  uint64_t v22 = v1;
  uint64_t v23 = v2;
  uint64_t v24 = v15;
  uint64_t v25 = v14;
  uint64_t v9 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(0, (uint64_t)&v21);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7(&v8[*(int *)(v9 + 60)], v1);
    v7(&v8[*(int *)(v9 + 64)], v1);
  }
  uint64_t v10 = (v19 + v18 + v5) & ~v5;
  sub_213A8();
  sub_21018();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  size_t v11 = &v0[v19 + v3[22]];
  uint64_t v12 = sub_20B38();
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v7(&v0[v10], v1);
  v7(&v0[(v17 + v5 + v10) & ~v5], v1);
  return swift_deallocObject();
}

uint64_t sub_1A380(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1[5];
  uint64_t v19 = v1[4];
  uint64_t v6 = v1[6];
  uint64_t v5 = v1[7];
  uint64_t v7 = v1[8];
  _OWORD v3[2] = v19;
  v3[3] = v4;
  v3[4] = v6;
  v3[5] = v5;
  v3[6] = v7;
  uint64_t v8 = *(void *)(type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)(v3 + 2)) - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  unint64_t v11 = (v9 + *(void *)(v8 + 64) + v10) & ~v10;
  uint64_t v12 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = (uint64_t)v1 + v9;
  uint64_t v15 = (uint64_t)v1 + v11;
  uint64_t v16 = (uint64_t)v1 + ((*(void *)(*(void *)(v4 - 8) + 64) + v10 + v11) & ~v10);
  uint64_t v17 = (void *)swift_task_alloc();
  v3[7] = v17;
  *uint64_t v17 = v3;
  v17[1] = sub_1A544;
  return sub_18008(a1, v12, v13, v14, v15, v16, v19, v4);
}

uint64_t sub_1A544()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A638(uint64_t a1)
{
  uint64_t v2 = sub_3238(&qword_30FE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A698()
{
  sub_21268();
  v0[2] = sub_21258();
  uint64_t v2 = sub_21248();
  v0[3] = v2;
  v0[4] = v1;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_1A72C, v2, v1);
}

uint64_t sub_1A72C()
{
  id v1 = [self _applePodcastsFoundationSharedUserDefaults];
  v0[5] = v1;
  NSString v2 = sub_21178();
  int64_t v3 = (int64_t)[v1 integerForKey:v2];

  if (v3 < 1)
  {

    swift_release();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    if (is_mul_ok(v3, 0x3B9ACA00uLL))
    {
      uint64_t v5 = (void *)swift_task_alloc();
      v0[6] = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_1A898;
      uint64_t v4 = 1000000000 * v3;
    }
    else
    {
      __break(1u);
    }
    return static Task<>.sleep(nanoseconds:)(v4);
  }
}

uint64_t sub_1A898()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 56) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 24);
  if (v0) {
    uint64_t v5 = sub_1AA44;
  }
  else {
    uint64_t v5 = sub_1A9D4;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_1A9D4()
{
  swift_release();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1AA44()
{
  swift_release();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1AAB4(char a1)
{
  return sub_176BC(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_1AADC()
{
  uint64_t v1 = v0[5];
  uint64_t v14 = v0[7];
  uint64_t v15 = v0[6];
  uint64_t v13 = v0[8];
  uint64_t v16 = v0[4];
  uint64_t v2 = v16;
  uint64_t v17 = v1;
  uint64_t v18 = v15;
  uint64_t v19 = v14;
  uint64_t v20 = v13;
  uint64_t v3 = (int *)type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)&v16);
  uint64_t v4 = *(unsigned __int8 *)(*((void *)v3 - 1) + 80);
  swift_unknownObjectRelease();
  uint64_t v5 = (char *)v0 + ((v4 + 72) & ~v4);
  swift_release();
  swift_release();
  uint64_t v6 = sub_210D8();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 8);
  v7(&v5[*(int *)(v6 + 32)], v1);
  swift_release();
  swift_release();
  v7(&v5[v3[16]], v1);
  sub_21018();
  swift_release();
  uint64_t v8 = &v5[v3[17]];
  uint64_t v16 = v2;
  uint64_t v17 = v1;
  uint64_t v18 = v15;
  uint64_t v19 = v14;
  uint64_t v20 = v13;
  uint64_t v9 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(0, (uint64_t)&v16);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7(&v8[*(int *)(v9 + 60)], v1);
    v7(&v8[*(int *)(v9 + 64)], v1);
  }
  sub_213A8();
  sub_21018();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = &v5[v3[22]];
  uint64_t v11 = sub_20B38();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AE00(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = v1[8];
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  v2[6] = v8;
  uint64_t v9 = *(void *)(type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = (uint64_t)v1 + ((*(unsigned __int8 *)(v9 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v13 = (void *)swift_task_alloc();
  v2[7] = v13;
  void *v13 = v2;
  v13[1] = sub_1B400;
  return sub_17744(a1, v10, v11, v12, v4, v5, v6, v7);
}

uint64_t sub_1AF38()
{
  return sub_1AAB4(1);
}

uint64_t sub_1AF54()
{
  return sub_1B38C((uint64_t (*)(uint64_t, uint64_t))sub_1301C);
}

uint64_t sub_1AF70()
{
  return sub_1B2BC((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_17008);
}

uint64_t sub_1AF8C()
{
  uint64_t v1 = v0[3];
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[4];
  uint64_t v12 = v0[6];
  uint64_t v15 = v0[2];
  uint64_t v2 = v15;
  uint64_t v16 = v1;
  uint64_t v17 = v14;
  uint64_t v18 = v13;
  uint64_t v19 = v12;
  uint64_t v3 = (int *)type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)&v15);
  uint64_t v4 = (char *)v0
     + ((*(unsigned __int8 *)(*((void *)v3 - 1) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v3 - 1) + 80));
  swift_release();
  swift_release();
  uint64_t v5 = sub_210D8();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 8);
  v6(&v4[*(int *)(v5 + 32)], v1);
  swift_release();
  swift_release();
  v6(&v4[v3[16]], v1);
  sub_21018();
  swift_release();
  uint64_t v7 = &v4[v3[17]];
  uint64_t v15 = v2;
  uint64_t v16 = v1;
  uint64_t v17 = v14;
  uint64_t v18 = v13;
  uint64_t v19 = v12;
  uint64_t v8 = type metadata accessor for AsyncSelectionConfirmingPicker.ConfirmationConfiguration(0, (uint64_t)&v15);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6(&v7[*(int *)(v8 + 60)], v1);
    v6(&v7[*(int *)(v8 + 64)], v1);
  }
  sub_213A8();
  sub_21018();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = &v4[v3[22]];
  uint64_t v10 = sub_20B38();
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B2A4()
{
  return sub_1B2BC((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_16E54);
}

uint64_t sub_1B2BC(uint64_t (*a1)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  v11[0] = v1[2];
  uint64_t v2 = v11[0];
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  uint64_t v7 = *(void *)(type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)v11) - 8);
  uint64_t v8 = (char *)v1 + ((*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a1(v8, v2, v3, v4, v5, v6);
}

uint64_t sub_1B374()
{
  return sub_1B38C(sub_13198);
}

uint64_t sub_1B38C(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = *(void *)(v1 + 64);
  long long v5 = *(_OWORD *)(v1 + 32);
  v8[0] = *(_OWORD *)(v1 + 16);
  v8[1] = v5;
  uint64_t v9 = v3;
  uint64_t v6 = type metadata accessor for AsyncSelectionConfirmingPicker(0, (uint64_t)v8);
  return a1(v4, v6);
}

ValueMetadata *type metadata accessor for PlaybackSettingsSection()
{
  return &type metadata for PlaybackSettingsSection;
}

uint64_t sub_1B414()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B430()
{
  v1._countAndFlagsBits = 0x4B43414259414C50;
  v1._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  sub_209B8(v1, v3);
  v2._countAndFlagsBits = 0x4B43414259414C50;
  v2._object = (void *)0xEC0000005049545FLL;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_209B8(v2, v4);
  sub_3238((uint64_t *)&unk_30BF0);
  sub_2878();
  return sub_21118();
}

uint64_t sub_1B524()
{
  v1._object = (void *)0x8000000000026EF0;
  v1._countAndFlagsBits = 0xD00000000000001ALL;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  sub_209B8(v1, v2);
  sub_20AF8();
  sub_2820();
  return sub_21088();
}

uint64_t sub_1B5C4()
{
  return sub_1B430();
}

uint64_t sub_1B5CC()
{
  return sub_1B524();
}

uint64_t *sub_1B5D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    swift_retain();
    sub_3238(&qword_30A18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_209E8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1B700(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_209E8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1B7C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  swift_retain();
  sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_209E8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1B890(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_54BC((uint64_t)a1 + v6, &qword_30A18);
    sub_3238(&qword_30A18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_209E8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1B99C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3238(&qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_209E8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_1BA70(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_54BC((uint64_t)a1 + v6, &qword_30A18);
    uint64_t v9 = sub_3238(&qword_30A18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_209E8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1BB7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1BB90);
}

uint64_t sub_1BB90(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_3238(&qword_30A20);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1BC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1BC58);
}

void *sub_1BC58(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3238(&qword_30A20);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for DownloadsSettingsSection()
{
  uint64_t result = qword_31070;
  if (!qword_31070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BD50()
{
  sub_87C4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1BDEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1BE08()
{
  v1._countAndFlagsBits = 0x44414F4C4E574F44;
  v1._object = (void *)0xE900000000000053;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  sub_209B8(v1, v3);
  v2._object = (void *)0x8000000000026F10;
  v2._countAndFlagsBits = 0xD000000000000015;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_209B8(v2, v4);
  sub_3238(&qword_310B0);
  sub_1C4E8();
  return sub_21118();
}

uint64_t sub_1BF04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v1 = sub_3238((uint64_t *)&unk_30BF0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v48 = v1;
  uint64_t v49 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v53 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v52 = (char *)&v44 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v50 = (char *)&v44 - v8;
  __chkstk_darwin(v7);
  unint64_t v54 = (char *)&v44 - v9;
  uint64_t v10 = type metadata accessor for CellularDownloadsPicker();
  uint64_t v46 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_209E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v44 - v18;
  uint64_t v20 = sub_3238(&qword_310C0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v47 = (uint64_t)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v44 - v23;
  type metadata accessor for DownloadsSettingsSection();
  sub_1DA9C((uint64_t)v19);
  sub_209D8();
  sub_8EE4();
  char v25 = sub_213E8();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v17, v13);
  v26(v19, v13);
  if (v25)
  {
    *uint64_t v12 = swift_getKeyPath();
    sub_3238(&qword_30DE0);
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = *(int *)(v10 + 20);
    sub_21198();
    id v28 = [self _applePodcastsFoundationSharedUserDefaults];
    *(uint64_t *)((char *)v12 + v27) = sub_20AC8();
    sub_1C5B4((uint64_t)v12, (uint64_t)v24);
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v24, v29, 1, v10);
  v57._object = (void *)0x8000000000026F30;
  v57._countAndFlagsBits = 0xD000000000000014;
  v59._countAndFlagsBits = 0;
  v59._object = (void *)0xE000000000000000;
  uint64_t v55 = sub_209B8(v57, v59);
  uint64_t v56 = v30;
  uint64_t v45 = v24;
  sub_20AF8();
  sub_2820();
  uint64_t v31 = v54;
  sub_21088();
  v58._countAndFlagsBits = 0xD00000000000001ELL;
  v58._object = (void *)0x8000000000026F50;
  v60._countAndFlagsBits = 0;
  v60._object = (void *)0xE000000000000000;
  uint64_t v55 = sub_209B8(v58, v60);
  uint64_t v56 = v32;
  sub_20AF8();
  uint64_t v33 = v50;
  sub_21088();
  uint64_t v34 = v47;
  sub_1C544((uint64_t)v24, v47);
  uint64_t v35 = v48;
  uint64_t v36 = v49;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  uint64_t v38 = v52;
  v37(v52, v31, v48);
  uint64_t v39 = v53;
  v37(v53, v33, v35);
  uint64_t v40 = v51;
  sub_1C544(v34, v51);
  uint64_t v41 = sub_3238(&qword_310C8);
  v37((char *)(v40 + *(int *)(v41 + 48)), v38, v35);
  v37((char *)(v40 + *(int *)(v41 + 64)), v39, v35);
  unsigned int v42 = *(void (**)(char *, uint64_t))(v36 + 8);
  v42(v33, v35);
  v42(v54, v35);
  sub_54BC((uint64_t)v45, &qword_310C0);
  v42(v39, v35);
  v42(v38, v35);
  return sub_54BC(v34, &qword_310C0);
}

uint64_t sub_1C4E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1BF04(a1);
}

unint64_t sub_1C4E8()
{
  unint64_t result = qword_310B8;
  if (!qword_310B8)
  {
    sub_28D4(&qword_310B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_310B8);
  }
  return result;
}

uint64_t sub_1C544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238(&qword_310C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CellularDownloadsPicker();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C61C()
{
  unint64_t result = qword_310D0;
  if (!qword_310D0)
  {
    sub_28D4(&qword_310D8);
    sub_1C4E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_310D0);
  }
  return result;
}

uint64_t sub_1C69C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_3238(&qword_30DE0);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = type metadata accessor for SkipButtonsPickersSection();
  uint64_t v3 = *(int *)(v2 + 20);
  sub_21398();
  sub_21198();
  uint64_t v4 = self;
  id v5 = [v4 _applePodcastsFoundationSharedUserDefaults];
  *(uint64_t *)((char *)a1 + v3) = sub_20AC8();
  uint64_t v6 = *(int *)(v2 + 24);
  sub_21398();
  sub_21198();
  id v7 = [v4 _applePodcastsFoundationSharedUserDefaults];
  uint64_t result = sub_20AC8();
  *(uint64_t *)((char *)a1 + v6) = result;
  return result;
}

uint64_t sub_1C7C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v2 = sub_20CF8();
  uint64_t v40 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v38 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3238(&qword_30CD0);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  id v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3238((uint64_t *)&unk_30DF0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v39 = (uint64_t)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v37 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_20D18();
  uint64_t v48 = *(void *)(v16 - 8);
  uint64_t v49 = v16;
  __chkstk_darwin(v16);
  uint64_t v47 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_3238(&qword_31178);
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_3238(&qword_31180);
  uint64_t v42 = *(void *)(v21 - 8);
  uint64_t v43 = v21;
  __chkstk_darwin(v21);
  uint64_t v41 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60._countAndFlagsBits = 0x5455425F50494B53;
  v60._object = (void *)0xEC000000534E4F54;
  v62._countAndFlagsBits = 0;
  v62._object = (void *)0xE000000000000000;
  uint64_t v56 = sub_209B8(v60, v62);
  uint64_t v57 = v23;
  char v58 = 0;
  Swift::String v59 = &_swiftEmptyArrayStorage;
  v61._object = (void *)0x8000000000026F70;
  v61._countAndFlagsBits = 0xD000000000000010;
  v63._countAndFlagsBits = 0;
  v63._object = (void *)0xE000000000000000;
  uint64_t v52 = sub_209B8(v61, v63);
  uint64_t v53 = v24;
  char v54 = 0;
  uint64_t v55 = &_swiftEmptyArrayStorage;
  uint64_t v51 = v1;
  sub_3238(&qword_31188);
  sub_6744(&qword_31190, &qword_31188);
  uint64_t v44 = v20;
  uint64_t v25 = v40;
  sub_21118();
  sub_1DD54((uint64_t)v15);
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v13, enum case for UserInterfaceSizeClass.compact(_:), v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v13, 0, 1, v2);
  uint64_t v26 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_53F0((uint64_t)v15, (uint64_t)v7, (uint64_t *)&unk_30DF0);
  sub_53F0((uint64_t)v13, v26, (uint64_t *)&unk_30DF0);
  uint64_t v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
  if (v27((uint64_t)v7, 1, v2) != 1)
  {
    uint64_t v28 = v39;
    sub_53F0((uint64_t)v7, v39, (uint64_t *)&unk_30DF0);
    if (v27(v26, 1, v2) != 1)
    {
      uint64_t v29 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v38, v26, v2);
      sub_1EE04(&qword_30D08, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      sub_21148();
      uint64_t v30 = *(void (**)(char *, uint64_t))(v25 + 8);
      v30(v29, v2);
      sub_54BC((uint64_t)v13, (uint64_t *)&unk_30DF0);
      sub_54BC((uint64_t)v15, (uint64_t *)&unk_30DF0);
      v30((char *)v28, v2);
      sub_54BC((uint64_t)v7, (uint64_t *)&unk_30DF0);
      goto LABEL_8;
    }
    sub_54BC((uint64_t)v13, (uint64_t *)&unk_30DF0);
    sub_54BC((uint64_t)v15, (uint64_t *)&unk_30DF0);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v28, v2);
    goto LABEL_6;
  }
  sub_54BC((uint64_t)v13, (uint64_t *)&unk_30DF0);
  sub_54BC((uint64_t)v15, (uint64_t *)&unk_30DF0);
  if (v27(v26, 1, v2) != 1)
  {
LABEL_6:
    sub_54BC((uint64_t)v7, &qword_30CD0);
    goto LABEL_8;
  }
  sub_54BC((uint64_t)v7, (uint64_t *)&unk_30DF0);
LABEL_8:
  uint64_t v31 = v47;
  sub_20D08();
  sub_1EBFC();
  uint64_t v32 = v41;
  uint64_t v33 = v46;
  uint64_t v34 = v49;
  uint64_t v35 = v44;
  sub_20E88();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v31, v34);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v35, v33);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v50, v32, v43);
}

uint64_t sub_1CED0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = sub_3238(&qword_311A0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v27 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v26 = (char *)&v25 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  v35._countAndFlagsBits = 0xD000000000000013;
  v35._object = (void *)0x8000000000026FC0;
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  uint64_t v33 = sub_209B8(v35, v37);
  uint64_t v34 = v14;
  type metadata accessor for SkipButtonsPickersSection();
  sub_20AF8();
  uint64_t v30 = a1;
  sub_3238(&qword_311A8);
  uint64_t v15 = sub_28D4(&qword_311B0);
  unint64_t v16 = sub_1ED54();
  uint64_t v31 = v15;
  unint64_t v32 = v16;
  swift_getOpaqueTypeConformance2();
  sub_2820();
  sub_21058();
  v36._object = (void *)0x8000000000026FE0;
  v36._countAndFlagsBits = 0xD000000000000010;
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  uint64_t v33 = sub_209B8(v36, v38);
  uint64_t v34 = v17;
  sub_20AF8();
  uint64_t v29 = a1;
  sub_21058();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v19 = v26;
  v18(v26, v13, v3);
  uint64_t v20 = v27;
  v18(v27, v11, v3);
  uint64_t v21 = v28;
  v18(v28, v19, v3);
  uint64_t v22 = sub_3238(&qword_311C0);
  v18(&v21[*(int *)(v22 + 48)], v20, v3);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v4 + 8);
  v23(v11, v3);
  v23(v13, v3);
  v23(v20, v3);
  return ((uint64_t (*)(char *, uint64_t))v23)(v19, v3);
}

uint64_t sub_1D278@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, unsigned int *a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v49 = a1;
  uint64_t v50 = a2;
  uint64_t v45 = a4;
  uint64_t v4 = sub_209A8();
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  __chkstk_darwin(v4);
  uint64_t v53 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3238(&qword_30B50);
  __chkstk_darwin(v6 - 8);
  uint64_t v52 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_208C8();
  uint64_t v51 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v44 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_20888();
  uint64_t v9 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_208E8();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_21168();
  __chkstk_darwin(v13 - 8);
  uint64_t v43 = sub_20898();
  uint64_t v46 = *(void *)(v43 - 8);
  uint64_t v57 = v46;
  __chkstk_darwin(v43);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_3238(&qword_311B0);
  uint64_t v40 = *(void *)(v16 - 8);
  uint64_t v41 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_3238(&qword_311A8);
  uint64_t v37 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  Swift::String v36 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_21388();
  sub_3238(&qword_311C8);
  sub_6744(&qword_311D0, &qword_311C8);
  sub_1EE04(&qword_311D8, type metadata accessor for MTPodcastSkipDuration);
  Swift::String v38 = v18;
  sub_210F8();
  sub_21158();
  sub_208D8();
  uint64_t v20 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  uint64_t v22 = v47;
  v21(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v47);
  uint64_t v42 = v15;
  sub_208A8();
  sub_3238(&qword_30BB8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22390;
  sub_21158();
  sub_208D8();
  v21(v11, v20, v22);
  sub_208A8();
  uint64_t v23 = v48;
  sub_21158();
  sub_208D8();
  v21(v11, v20, v22);
  sub_208A8();
  uint64_t v24 = v55;
  uint64_t v26 = v53;
  uint64_t v25 = v54;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v53, *v56, v55);
  sub_20998();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v24);
  uint64_t v27 = v52;
  sub_208B8();
  uint64_t v28 = v51;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v27, 1, v23);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v30 = v44;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v44, v27, v23);
    sub_1ED54();
    uint64_t v31 = v36;
    uint64_t v33 = v41;
    unint64_t v32 = v42;
    uint64_t v34 = v38;
    sub_20E58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v23);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v32, v43);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v33);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v45, v31, v39);
  }
  return result;
}

uint64_t sub_1DA60@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_21378();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1DA9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_20C58();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3238(&qword_30A18);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_53F0(v2, (uint64_t)v10, &qword_30A18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_209E8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_21308();
    uint64_t v14 = sub_20DC8();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[2] = sub_19714(0xD000000000000012, 0x8000000000027000, &v19);
      sub_213B8();
      _os_log_impl(&dword_0, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_20C48();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1DD54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_20C58();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3238(&qword_30DE0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_53F0(v2, (uint64_t)v10, &qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_1ECA0((uint64_t)v10, a1);
  }
  os_log_type_t v12 = sub_21308();
  os_log_type_t v13 = sub_20DC8();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v17[1] = a1;
    uint64_t v18 = v16;
    *(_DWORD *)os_log_type_t v15 = 136315138;
    v17[2] = sub_19714(0xD000000000000020, 0x8000000000026F90, &v18);
    sub_213B8();
    _os_log_impl(&dword_0, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_20C48();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t type metadata accessor for SkipButtonsPickersSection()
{
  uint64_t result = qword_31138;
  if (!qword_31138) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_1E030(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_3238(&qword_30DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_20CF8();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_3238((uint64_t *)&unk_30DF0);
        memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1E208(uint64_t a1)
{
  sub_3238(&qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_20CF8();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

void *sub_1E30C(void *a1, void *a2, uint64_t a3)
{
  sub_3238(&qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_20CF8();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = sub_3238((uint64_t *)&unk_30DF0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1E498(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_54BC((uint64_t)a1, &qword_30DE0);
    sub_3238(&qword_30DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_20CF8();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = sub_3238((uint64_t *)&unk_30DF0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1E654(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_3238(&qword_30DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_20CF8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_3238((uint64_t *)&unk_30DF0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  return a1;
}

char *sub_1E7DC(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_54BC((uint64_t)a1, &qword_30DE0);
    uint64_t v6 = sub_3238(&qword_30DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_20CF8();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_3238((uint64_t *)&unk_30DF0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_release();
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_1E990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1E9A4);
}

uint64_t sub_1E9A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3238(&qword_30C30);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1EA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1EA7C);
}

uint64_t sub_1EA7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3238(&qword_30C30);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_1EB3C()
{
  sub_D584();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1EBD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1EBF4@<X0>(char *a1@<X8>)
{
  return sub_1CED0(*(void *)(v1 + 16), a1);
}

unint64_t sub_1EBFC()
{
  unint64_t result = qword_31198;
  if (!qword_31198)
  {
    sub_28D4(&qword_31178);
    sub_6744(&qword_31190, &qword_31188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31198);
  }
  return result;
}

uint64_t sub_1ECA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238((uint64_t *)&unk_30DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1ED08@<X0>(uint64_t a1@<X8>)
{
  return sub_1D278(0x64726177726F46, 0xE700000000000000, &enum case for PodcastsSettingsDeepLinkURLs.forwardURL(_:), a1);
}

unint64_t sub_1ED54()
{
  unint64_t result = qword_311B8;
  if (!qword_311B8)
  {
    sub_28D4(&qword_311B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_311B8);
  }
  return result;
}

uint64_t sub_1EDC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1D278(1801675074, 0xE400000000000000, &enum case for PodcastsSettingsDeepLinkURLs.backURL(_:), a1);
}

uint64_t sub_1EE04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1EE4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1EEC0()
{
  if ([v0 cellType] == (char *)&dword_4 + 2
    && [v0 hasValidGetter]
    && [v0 hasValidSetter])
  {
    uint64_t v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v2 = (void *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v4 = (void *)swift_allocObject();
    _OWORD v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_210B8();
  }
  else
  {
    sub_210C8();
  }
  return v6;
}

uint64_t sub_1F014()
{
  uint64_t v1 = v0;
  memset(v17, 0, sizeof(v17));
  if ([v0 hasValidGetter])
  {
    if ([v0 performGetter])
    {
      sub_213D8();
      swift_unknownObjectRelease();
      sub_54BC((uint64_t)v17, &qword_30800);
    }
    else
    {
      sub_54BC((uint64_t)v17, &qword_30800);
      long long v14 = 0u;
      long long v15 = 0u;
    }
    sub_5454((uint64_t)&v14, (uint64_t)v17);
  }
  sub_205A8((uint64_t)v17, (uint64_t)&v14);
  uint64_t v2 = *((void *)&v15 + 1);
  sub_54BC((uint64_t)&v14, &qword_30800);
  if (v2 && [v1 cellType] != (char *)&dword_8 + 1)
  {
    if ([v1 cellType] == (char *)&dword_0 + 2 || objc_msgSend(v1, "cellType") == &dword_4) {
      id v3 = [v1 shortTitleDictionary];
    }
    else {
      id v3 = [v1 titleDictionary];
    }
    id v4 = v3;
    if (v4)
    {
      uint64_t v5 = sub_21138();
    }
    else
    {
      uint64_t v5 = 0;
    }
    sub_205A8((uint64_t)v17, (uint64_t)v10);
    if (v10[3])
    {
      if (swift_dynamicCast())
      {
        if (*((void *)&v12 + 1))
        {
          long long v14 = v11;
          long long v15 = v12;
          uint64_t v16 = v13;
          if (v5)
          {
            if (*(void *)(v5 + 16) && (unint64_t v6 = sub_4070((uint64_t)&v14), (v7 & 1) != 0))
            {
              sub_4448(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v11);
            }
            else
            {
              long long v11 = 0u;
              long long v12 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_4394((uint64_t)&v14);
            sub_54BC((uint64_t)v17, &qword_30800);
            sub_5454((uint64_t)&v11, (uint64_t)v17);
          }
          else
          {
            sub_4394((uint64_t)&v14);
          }
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
      }
    }
    else
    {
      sub_54BC((uint64_t)v10, &qword_30800);
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v13 = 0;
    }
    swift_bridgeObjectRelease();
    sub_54BC((uint64_t)&v11, &qword_31200);
  }
LABEL_25:
  sub_205A8((uint64_t)v17, (uint64_t)&v14);
  uint64_t v8 = *((void *)&v15 + 1);
  sub_54BC((uint64_t)&v14, &qword_30800);
  if (!v8)
  {
    if ([v1 propertyForKey:PSValueKey])
    {
      sub_213D8();
      swift_unknownObjectRelease();
      sub_54BC((uint64_t)v17, &qword_30800);
    }
    else
    {
      sub_54BC((uint64_t)v17, &qword_30800);
      long long v14 = 0u;
      long long v15 = 0u;
    }
    sub_5454((uint64_t)&v14, (uint64_t)v17);
  }
  sub_5454((uint64_t)v17, (uint64_t)&v14);
  if (*((void *)&v15 + 1))
  {
    if (swift_dynamicCast()) {
      return v11;
    }
  }
  else
  {
    sub_54BC((uint64_t)&v14, &qword_30800);
  }
  return 0;
}

void sub_1F38C()
{
  id v1 = [v0 identifier];
  if (!v1 || (v2 = v1, v3 = sub_21198(), uint64_t v5 = v4, v2, !v5))
  {
LABEL_8:
    uint64_t v8 = sub_1F5C4();
    if (!v9) {
      return;
    }
    if (v8 != 0xD00000000000002BLL || v9 != 0x8000000000027020)
    {
      char v10 = sub_21508();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        return;
      }
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 0x4143494649544F4ELL || v5 != 0xED0000534E4F4954)
  {
    char v7 = sub_21508();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
LABEL_11:
  swift_bridgeObjectRelease();
LABEL_13:
  id v11 = sub_1F6C8();
  if (v11)
  {
    id v19 = v11;
    self;
    long long v12 = (void *)swift_dynamicCastObjCClass();
    if (v12
      && (uint64_t v13 = v12,
          [v12 refreshCellContentsWithSpecifier:v0],
          (id v14 = [v13 detailTextLabel]) != 0)
      && (long long v15 = v14, v16 = [v14 text], v15, v16))
    {
      sub_21198();

      NSString v17 = sub_21178();
      swift_bridgeObjectRelease();
      [v0 setProperty:v17 forKey:PSValueKey];

      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v18 = v19;
    }
  }
}

uint64_t sub_1F5C4()
{
  if ([v0 propertyForKey:PSCellClassKey])
  {
    sub_213D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_5454((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_54BC((uint64_t)v6, &qword_30800);
    return 0;
  }
  sub_3238(&qword_311F8);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v2 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v3 = sub_21198();

  return v3;
}

id sub_1F6C8()
{
  if (![self cellClassForSpecifier:v0]) {
    return 0;
  }
  swift_getObjCClassMetadata();
  sub_206A8(0, &qword_311E8);
  id v1 = (id)swift_dynamicCastMetatype();
  if (!v1) {
    return v1;
  }
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  sub_206A8(0, &qword_311F0);
  if (!-[objc_class isSubclassOfClass:](ObjCClassFromMetadata, "isSubclassOfClass:", swift_getObjCClassFromMetadata()))return [objc_allocWithZone(ObjCClassFromMetadata) initWithStyle:1 reuseIdentifier:0]; {
  if (!swift_dynamicCastMetatype())
  }
    return 0;
  uint64_t v3 = (void *)swift_getObjCClassFromMetadata();
  id v4 = [v3 cellStyle];
  NSString v5 = [v3 reuseIdentifierForSpecifier:v0];
  if (v5)
  {
    sub_21198();

    id v6 = v0;
    NSString v5 = sub_21178();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = v0;
  }
  id v1 = [objc_allocWithZone((Class)v3) initWithStyle:v4 reuseIdentifier:v5 specifier:v0];

  return v1;
}

void sub_1F86C(uint8_t *a1@<X8>)
{
  uint64_t v57 = sub_20A58();
  uint64_t v2 = *(void *)(v57 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  NSString v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v55 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)&v55 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v55 - v12;
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    long long v60 = 0u;
    long long v61 = 0u;
LABEL_13:
    sub_54BC((uint64_t)&v60, &qword_30800);
LABEL_14:
    swift_beginAccess();
    uint64_t v30 = swift_unknownObjectWeakLoadStrong();
    if (v30)
    {
      uint64_t v31 = (void *)v30;
      NSString v32 = sub_21178();
      id v33 = [v31 propertyForKey:v32];

      if (v33)
      {
        sub_213D8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v59 = 0u;
        long long v58 = 0u;
      }
      sub_5454((uint64_t)&v58, (uint64_t)&v60);
      if (*((void *)&v61 + 1))
      {
        if (swift_dynamicCast())
        {
          long long v34 = v58;
          uint64_t v35 = HIBYTE(*((void *)&v58 + 1)) & 0xFLL;
          if ((*((void *)&v58 + 1) & 0x2000000000000000) == 0) {
            uint64_t v35 = v58 & 0xFFFFFFFFFFFFLL;
          }
          if (v35)
          {
            sub_20A28();
            swift_bridgeObjectRetain();
            Swift::String v36 = sub_20A48();
            os_log_type_t v37 = sub_21318();
            if (os_log_type_enabled(v36, v37))
            {
              Swift::String v38 = (uint8_t *)swift_slowAlloc();
              uint64_t v39 = swift_slowAlloc();
              uint64_t v56 = a1;
              *(void *)&long long v60 = v39;
              *(_DWORD *)Swift::String v38 = 136315138;
              uint64_t v55 = v38 + 4;
              swift_bridgeObjectRetain();
              *(void *)&long long v58 = sub_19714(v34, *((unint64_t *)&v34 + 1), (uint64_t *)&v60);
              sub_213B8();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_0, v36, v37, "No value returned from some getter of specifier for bundleIdentifier '%s.", v38, 0xCu);
              swift_arrayDestroy();
              a1 = v56;
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            uint64_t v43 = *(void (**)(char *, uint64_t))(v2 + 8);
            uint64_t v44 = v8;
LABEL_30:
            v43(v44, v57);
LABEL_31:
            unsigned __int8 v29 = 0;
            goto LABEL_32;
          }
          swift_bridgeObjectRelease();
        }
LABEL_27:
        sub_20A28();
        uint64_t v40 = sub_20A48();
        os_log_type_t v41 = sub_21318();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_0, v40, v41, "No value returned from getter of specifier (no bundleIdentifier found).", v42, 2u);
          swift_slowDealloc();
        }

        uint64_t v43 = *(void (**)(char *, uint64_t))(v2 + 8);
        uint64_t v44 = v5;
        goto LABEL_30;
      }
    }
    else
    {
      long long v60 = 0u;
      long long v61 = 0u;
    }
    sub_54BC((uint64_t)&v60, &qword_30800);
    goto LABEL_27;
  }
  long long v15 = Strong;
  id v16 = a1;
  id v17 = [Strong performGetter];

  if (v17)
  {
    sub_213D8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v59 = 0u;
    long long v58 = 0u;
  }
  a1 = v16;
  sub_5454((uint64_t)&v58, (uint64_t)&v60);
  if (!*((void *)&v61 + 1)) {
    goto LABEL_13;
  }
  sub_206A8(0, &qword_31208);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v18 = (void *)v58;
  self;
  if (!swift_dynamicCastObjCClass()
    || (v60 = 0uLL, id v19 = v18, sub_21188(), v19, (v20 = *((void *)&v60 + 1)) == 0))
  {
    self;
    uint64_t v45 = (void *)swift_dynamicCastObjCClass();
    if (v45)
    {
      unsigned __int8 v29 = [v45 BOOLValue];

      goto LABEL_32;
    }
    sub_20A28();
    uint64_t v46 = v18;
    uint64_t v47 = sub_20A48();
    os_log_type_t v48 = sub_21318();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = (void *)swift_slowAlloc();
      uint64_t v56 = v49;
      *(_DWORD *)uint64_t v49 = 138543362;
      *(void *)&long long v60 = v46;
      uint64_t v50 = v46;
      a1 = v16;
      sub_213B8();
      *uint64_t v55 = v46;

      _os_log_impl(&dword_0, v47, v48, "Could not resolve value of type '%{public}@' to a BOOLean.", v56, 0xCu);
      sub_3238(&qword_31210);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v47 = v46;
    }
    uint64_t v51 = v57;

    (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v51);
    goto LABEL_31;
  }
  uint64_t v21 = v60;
  sub_3238(&qword_31218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22E70;
  *(void *)(inited + 32) = 1702195828;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(void *)(inited + 48) = 7562617;
  *(void *)(inited + 56) = 0xE300000000000000;
  *(void *)(inited + 64) = 49;
  *(void *)(inited + 72) = 0xE100000000000000;
  *(void *)(inited + 80) = 121;
  *(void *)(inited + 88) = 0xE100000000000000;
  uint64_t v23 = sub_206E4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v24 = sub_211B8();
  char v26 = sub_2019C(v24, v25, (uint64_t)v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0
    || (v27 = sub_21178(), id v28 = [v27 integerValue], v27, (uint64_t)v28 >= 1))
  {
    swift_bridgeObjectRelease();

    unsigned __int8 v29 = 1;
    a1 = v16;
  }
  else
  {
    sub_20A28();
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_20A48();
    os_log_type_t v53 = sub_21318();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v60 = v56;
      *(_DWORD *)uint64_t v54 = 136446210;
      uint64_t v55 = v54 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v58 = sub_19714(v21, v20, (uint64_t *)&v60);
      sub_213B8();
      swift_bridgeObjectRelease_n();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v13, v57);
    unsigned __int8 v29 = 0;
    a1 = v16;
  }
LABEL_32:
  *a1 = v29;
}

uint64_t sub_2019C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_21528();
    sub_211C8();
    Swift::Int v6 = sub_21548();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_21508() & 1) != 0) {
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
          if (v17 || (sub_21508() & 1) != 0) {
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

void sub_202D4(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = [objc_allocWithZone((Class)NSNumber) initWithBool:v1];
    [v3 performSetterWithValue:v4];
  }
  id v5 = [self defaultCenter];
  if (qword_305E8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_321D0;
  swift_beginAccess();
  uint64_t v7 = (void *)swift_unknownObjectWeakLoadStrong();
  [v5 postNotificationName:v6 object:v7];
}

NSString sub_20404()
{
  NSString result = sub_21178();
  qword_321D0 = (uint64_t)result;
  return result;
}

void PSSpecifier.objectWillChange.getter()
{
  id v0 = [self defaultCenter];
  if (qword_305E8 != -1) {
    swift_once();
  }
  sub_21348();
}

unint64_t sub_204F0()
{
  unint64_t result = qword_311E0;
  if (!qword_311E0)
  {
    sub_21338();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_311E0);
  }
  return result;
}

void *sub_20548()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_20554@<X0>(uint64_t *a1@<X8>)
{
  sub_206A8(0, (unint64_t *)&qword_30780);
  uint64_t result = sub_21448();
  *a1 = result;
  return result;
}

uint64_t sub_205A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3238(&qword_30800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20610()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

void sub_2064C(uint8_t *a1@<X8>)
{
}

uint64_t sub_2065C()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

void sub_2069C(unsigned __int8 *a1)
{
}

uint64_t sub_206A8(uint64_t a1, unint64_t *a2)
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

void *sub_206E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_3238(&qword_31220);
    uint64_t v3 = sub_21428();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v26 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v26 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_21528();
      swift_bridgeObjectRetain();
      sub_211C8();
      Swift::Int v9 = sub_21548();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v9 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        id v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (sub_21508() & 1) != 0)
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          id v19 = (void *)(v15 + 16 * v11);
          BOOL v20 = *v19 == v8 && v19[1] == v7;
          if (v20 || (sub_21508() & 1) != 0) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return (void *)sub_20888();
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_20888()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_20898()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_208A8()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_208B8()
{
  return URL.init(string:)();
}

uint64_t sub_208C8()
{
  return type metadata accessor for URL();
}

uint64_t sub_208D8()
{
  return static Locale.current.getter();
}

uint64_t sub_208E8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_208F8()
{
  return type metadata accessor for AutoDownloadPicker.PickerType();
}

uint64_t sub_20908()
{
  return AutoDownloadPickerView.init(autoDownloadOption:pickerType:)();
}

uint64_t sub_20918()
{
  return type metadata accessor for AutoDownloadPickerView();
}

uint64_t sub_20928()
{
  return dispatch thunk of GlobalSettingsDeepLinkState.deepLinkToAutomaticDownloadPicker.getter();
}

uint64_t sub_20938()
{
  return dispatch thunk of GlobalSettingsDeepLinkState.deepLinkToAutomaticDownloadPicker.setter();
}

uint64_t sub_20948()
{
  return GlobalSettingsDeepLinkState.Destination.rawValue.getter();
}

uint64_t sub_20958()
{
  return GlobalSettingsDeepLinkState.init()();
}

uint64_t sub_20968()
{
  return type metadata accessor for GlobalSettingsDeepLinkState();
}

uint64_t sub_20978()
{
  return GlobalSettingsAutoDownloadPickerLink.init()();
}

uint64_t sub_20988()
{
  return type metadata accessor for GlobalSettingsAutoDownloadPickerLink();
}

uint64_t sub_20998()
{
  return PodcastsSettingsDeepLinkURLs.rawValue.getter();
}

uint64_t sub_209A8()
{
  return type metadata accessor for PodcastsSettingsDeepLinkURLs();
}

uint64_t sub_209B8(Swift::String _, Swift::String comment)
{
  return PFLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_209C8()
{
  return static DeviceCapabilities.mobileGestaltCapabilities()();
}

uint64_t sub_209D8()
{
  return static DeviceCapabilities.cellularRadio.getter();
}

uint64_t sub_209E8()
{
  return type metadata accessor for DeviceCapabilities();
}

uint64_t sub_209F8()
{
  return static AnalyticsIdentifierManager.kMTResetIdentifierKey.getter();
}

uint64_t sub_20A08()
{
  return type metadata accessor for AnalyticsIdentifierManager();
}

uint64_t sub_20A18()
{
  return AsyncIconImage.init<>(icon:descriptor:)();
}

uint64_t sub_20A28()
{
  return static Logger.settings.getter();
}

uint64_t sub_20A38()
{
  return static Logger.downloads.getter();
}

uint64_t sub_20A48()
{
  return Logger.logObject.getter();
}

uint64_t sub_20A58()
{
  return type metadata accessor for Logger();
}

uint64_t sub_20A68()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_20A78()
{
  return Published.init(initialValue:)();
}

uint64_t sub_20A88()
{
  return static Published.subscript.getter();
}

uint64_t sub_20A98()
{
  return static Published.subscript.setter();
}

uint64_t sub_20AA8()
{
  return type metadata accessor for Published();
}

uint64_t sub_20AB8()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_20AC8()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_20AD8()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t sub_20AE8()
{
  return AppStorage.wrappedValue.setter();
}

uint64_t sub_20AF8()
{
  return AppStorage.projectedValue.getter();
}

uint64_t sub_20B08()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_20B18()
{
  return static ButtonRole.== infix(_:_:)();
}

uint64_t sub_20B28()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_20B38()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_20B48()
{
  return ActionSheet.init(title:message:buttons:)();
}

uint64_t sub_20B58()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_20B68()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_20B78()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_20B88()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_20B98()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_20BA8()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_20BB8()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_20BC8()
{
  return EnvironmentValues.deviceCapabilities.getter();
}

uint64_t sub_20BD8()
{
  return EnvironmentValues.deviceCapabilities.setter();
}

uint64_t sub_20BE8()
{
  return EnvironmentValues.settingsDeepLinkState.getter();
}

uint64_t sub_20BF8()
{
  return EnvironmentValues.settingsDeepLinkState.setter();
}

uint64_t sub_20C08()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_20C18()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t sub_20C28()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_20C38()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_20C48()
{
  return EnvironmentValues.init()();
}

uint64_t sub_20C58()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_20C68()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_20C78()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_20C88()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_20C98()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_20CA8()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_20CB8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_20CC8()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_20CD8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_20CE8()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_20CF8()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t sub_20D08()
{
  return NavigationLinkPickerStyle.init(labelAxis:)();
}

uint64_t sub_20D18()
{
  return type metadata accessor for NavigationLinkPickerStyle();
}

uint64_t sub_20D28()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_20D38()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_20D48()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_20D68()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_20D78()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_20D88()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_20DA8()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_20DB8()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_20DC8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_20DD8()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_20DE8()
{
  return static Font.caption.getter();
}

uint64_t sub_20DF8()
{
  return List<>.init(content:)();
}

uint64_t sub_20E08()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_20E18()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_20E28()
{
  return Text.font(_:)();
}

uint64_t sub_20E38()
{
  return Text.init<A>(_:)();
}

uint64_t sub_20E48()
{
  return View.settingsListAppearance()();
}

uint64_t sub_20E58()
{
  return View.emitNavigationEventOnAppearForApplicationSetting(associatedApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_20E68()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_20E78()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_20E88()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_20E98()
{
  return View.labelsHidden()();
}

uint64_t sub_20EA8()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_20EB8()
{
  return View.accessibility(hidden:)();
}

uint64_t sub_20EC8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_20ED8()
{
  return View.confirmationDialog<A>(_:isPresented:titleVisibility:actions:)();
}

uint64_t sub_20EE8()
{
  return View.navigationBarTitle<A>(_:)();
}

uint64_t sub_20EF8()
{
  return View.navigationDestination<A>(isPresented:destination:)();
}

uint64_t sub_20F08()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_20F18()
{
  return Alert.init(title:message:primaryButton:secondaryButton:)();
}

uint64_t sub_20F28()
{
  return static Alert.Button.destructive(_:action:)();
}

uint64_t sub_20F38()
{
  return static Alert.Button.cancel(_:)();
}

uint64_t sub_20F48()
{
  return static Alert.Button.default(_:action:)();
}

uint64_t sub_20F58()
{
  return type metadata accessor for Alert.Button();
}

uint64_t sub_20F68()
{
  return static Color.blue.getter();
}

uint64_t sub_20F78()
{
  return static Color.secondary.getter();
}

uint64_t sub_20F88()
{
  return Group<A>.init(content:)();
}

uint64_t sub_20F98()
{
  return type metadata accessor for Group();
}

uint64_t sub_20FA8()
{
  return Image.init(uiImage:)();
}

uint64_t sub_20FB8()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_20FC8()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_20FD8()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_20FE8()
{
  return State.wrappedValue.getter();
}

uint64_t sub_20FF8()
{
  return State.wrappedValue.setter();
}

uint64_t sub_21008()
{
  return State.projectedValue.getter();
}

uint64_t sub_21018()
{
  return type metadata accessor for State();
}

uint64_t sub_21028()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_21038()
{
  return Button.init(action:label:)();
}

uint64_t sub_21048()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t sub_21058()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_21068()
{
  return type metadata accessor for Picker();
}

uint64_t sub_21078()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_21088()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t sub_21098()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_210A8()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_210B8()
{
  return Binding.init(get:set:)();
}

uint64_t sub_210C8()
{
  return static Binding.constant(_:)();
}

uint64_t sub_210D8()
{
  return type metadata accessor for Binding();
}

uint64_t sub_210E8()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_210F8()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_21108()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_21118()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_21128()
{
  return static Animation.easeInOut.getter();
}

uint64_t sub_21138()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_21148()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_21158()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_21168()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_21178()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_21188()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_21198()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_211A8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_211B8()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_211C8()
{
  return String.hash(into:)();
}

void sub_211D8(Swift::String a1)
{
}

Swift::Int sub_211E8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_211F8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_21208()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_21218()
{
  return specialized Array._endMutation()();
}

uint64_t sub_21228()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_21238()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_21248()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_21258()
{
  return static MainActor.shared.getter();
}

uint64_t sub_21268()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_21278()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_21288()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_21298()
{
  return type metadata accessor for TaskPriority();
}

void sub_212A8()
{
}

uint64_t sub_212B8()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_212C8()
{
  return static Task<>.checkCancellation()();
}

uint64_t sub_212F8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_21308()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_21318()
{
  return static os_log_type_t.default.getter();
}

void sub_21328(UIViewController _, Swift::Bool useLayoutMargins)
{
}

uint64_t sub_21338()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_21348()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_21358()
{
  return static MTPodcastEpisodeLimit.defaultOption.getter();
}

uint64_t sub_21368()
{
  return MTPodcastEpisodeLimit.intValue.getter();
}

uint64_t sub_21378()
{
  return MTPodcastSkipDuration.text.getter();
}

uint64_t sub_21388()
{
  return static MTPodcastSkipDuration.allCases.getter();
}

uint64_t sub_21398()
{
  return MTPodcastSkipDuration.intValue.getter();
}

uint64_t sub_213A8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_213B8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_213C8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_213D8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_213E8()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

Swift::Int sub_213F8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_21408()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_21418()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_21428()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_21438()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_21448()
{
  return Identifiable<>.id.getter();
}

uint64_t sub_21458()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_21468()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_21478()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_21488()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_21498()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_214A8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_214B8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_214C8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_214D8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_214E8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_214F8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_21508()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_21518()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_21528()
{
  return Hasher.init(_seed:)();
}

void sub_21538(Swift::UInt a1)
{
}

Swift::Int sub_21548()
{
  return Hasher._finalize()();
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return _CreateDetailControllerInstanceWithClass();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}