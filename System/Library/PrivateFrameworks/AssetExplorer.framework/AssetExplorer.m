id sub_22B528F1C()
{
  void *v0;
  id v1;
  id result;
  void *v3;
  id v4;

  sub_22B52B1A8(0, &qword_268404478);
  if (qword_2684043D0 != -1) {
    swift_once();
  }
  v0 = (void *)qword_2684043D8;
  v1 = (id)qword_2684043D8;
  result = sub_22B528FE0(0x6B726170735F5047, 0xEA0000000000656CLL, v0);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, sel_imageWithRenderingMode_, 2);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_22B528FE0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    v4 = (void *)sub_22B545850();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_, v4, a3);

  return v5;
}

uint64_t sub_22B529060(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView) = a1;
  return MEMORY[0x270F9A758]();
}

id sub_22B529074(double a1, double a2, double a3, double a4)
{
  OUTLINED_FUNCTION_0(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_defaultImageOpacity);
  OUTLINED_FUNCTION_3(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeImageOpacity);
  uint64_t v9 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage;
  v10 = v4;
  *(void *)&v4[v9] = sub_22B528F1C();
  *(void *)&v10[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView] = 0;
  uint64_t v11 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonBGColor;
  *(void *)&v10[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 0.4, 0.9);
  uint64_t v12 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonTintColor;
  *(void *)&v10[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 1.0, 0.84);
  uint64_t v13 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonBGColor;
  *(void *)&v10[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.05, 0.64, 1.0, 0.9);
  uint64_t v14 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonTintColor;
  *(void *)&v10[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 1.0, 0.98);
  v10[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance] = 0;

  v17.receiver = v10;
  v17.super_class = (Class)type metadata accessor for AEGenerativePlaygroundButton();
  id v15 = objc_msgSendSuper2(&v17, sel_initWithFrame_, a1, a2, a3, a4);
  sub_22B529698();

  return v15;
}

id sub_22B529234(void *a1)
{
  OUTLINED_FUNCTION_0(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_defaultImageOpacity);
  OUTLINED_FUNCTION_3(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeImageOpacity);
  uint64_t v3 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage;
  v4 = v1;
  *(void *)&v1[v3] = sub_22B528F1C();
  *(void *)&v4[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView] = 0;
  uint64_t v5 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonBGColor;
  *(void *)&v4[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 0.4, 0.9);
  uint64_t v6 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonTintColor;
  *(void *)&v4[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 1.0, 0.84);
  uint64_t v7 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonBGColor;
  *(void *)&v4[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.05, 0.64, 1.0, 0.9);
  uint64_t v8 = OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonTintColor;
  *(void *)&v4[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 1.0, 0.98);
  v4[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance] = 0;

  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for AEGenerativePlaygroundButton();
  id v9 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    sub_22B529698();
  }
  return v10;
}

uint64_t sub_22B52940C()
{
  OUTLINED_FUNCTION_2();
  return *v0;
}

void sub_22B529494(char a1)
{
  uint64_t v3 = (char *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance);
  swift_beginAccess();
  char v4 = *v3;
  *uint64_t v3 = a1;
  sub_22B529548(v4);
}

uint64_t sub_22B5294F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22B52940C();
  *a1 = result & 1;
  return result;
}

void sub_22B529520(char *a1)
{
}

void sub_22B529548(char a1)
{
  uint64_t v2 = v1;
  int v3 = a1 & 1;
  char v4 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance);
  swift_beginAccess();
  int v5 = *v4;
  if (v5 != v3)
  {
    uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView);
    if (v6)
    {
      id v7 = v6;
      sub_22B529F00(v5);
    }
    sub_22B529ACC();
  }
}

void (*sub_22B5295D8(void *a1))(uint64_t a1)
{
  int v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  char v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_isGenerativeAssetAppearance);
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *v4;
  return sub_22B529658;
}

void sub_22B529658(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  sub_22B529494(*(unsigned char *)(*(void *)a1 + 32));
  free(v1);
}

uint64_t sub_22B529698()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268404480);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2 - v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268404488);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_22B545900();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10 - v9;
  objc_msgSend(v0, sel_setUserInteractionEnabled_, 1);
  objc_msgSend(v0, sel_bounds);
  id v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ButtonBackground()), sel_initWithFrame_, v12, v13, v14, v15);
  sub_22B5458F0();
  id v17 = objc_msgSend(self, sel_whiteColor);
  sub_22B5458C0();
  id v23 = v16;
  v18 = (void (*)(unsigned char *, void))sub_22B5458B0();
  sub_22B545820();
  v18(v24, 0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_22B545840();
  uint64_t v19 = sub_22B545830();
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v19);
  sub_22B5458D0();
  id v20 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage];
  sub_22B5458E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v11, v7);
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v7);
  sub_22B545910();
  id v21 = v23;
  sub_22B529060((uint64_t)v16);
  sub_22B529ACC();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

id sub_22B5299A4(void *a1, uint64_t a2)
{
  v10[4] = *(double *)MEMORY[0x263EF8340];
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x230F4AA00](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    v10[0] = 0.0;
    objc_msgSend(a1, sel_getRed_green_blue_alpha_, 0, 0, 0, v10);
    unsigned int v5 = objc_msgSend(v4, sel_isHighlighted);
    double v6 = v10[0];
    if (v5) {
      double v6 = v10[0] * 0.4;
    }
    id v7 = objc_msgSend(a1, sel_colorWithAlphaComponent_, v6, a1);

    return v7;
  }
  else
  {
    return a1;
  }
}

void sub_22B529ACC()
{
  OUTLINED_FUNCTION_2();
  if (*v0) {
    double v2 = 0.98;
  }
  else {
    double v2 = 0.54;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 1.0, v2);
  objc_msgSend(v1, sel_setTintColor_, v3);
}

void sub_22B529B5C()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AEGenerativePlaygroundButton();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView];
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v2, sel_setFrame_);
  }
}

uint64_t type metadata accessor for AEGenerativePlaygroundButton()
{
  return self;
}

BOOL sub_22B529C40(CGFloat a1, CGFloat a2)
{
  objc_msgSend(v2, sel_bounds);
  CGRect v8 = CGRectInset(v7, -18.0, -18.0);
  v6.x = a1;
  v6.y = a2;
  return CGRectContainsPoint(v8, v6);
}

id AEGenerativePlaygroundButton.__deallocating_deinit(uint64_t a1)
{
  return sub_22B52AE58(a1, type metadata accessor for AEGenerativePlaygroundButton);
}

uint64_t method lookup function for AEGenerativePlaygroundButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AEGenerativePlaygroundButton);
}

uint64_t dispatch thunk of AEGenerativePlaygroundButton.isGenerativeAssetAppearance.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AEGenerativePlaygroundButton.isGenerativeAssetAppearance.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AEGenerativePlaygroundButton.isGenerativeAssetAppearance.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

void sub_22B529E48()
{
  qword_268404398 = (uint64_t)&unk_26DEB7538;
}

void sub_22B529E5C()
{
  qword_2684043A8 = (uint64_t)&unk_26DEB7568;
}

CGColorRef sub_22B529E70()
{
  CGColorRef result = CGColorCreateGenericRGB(0.0509803922, 0.639215686, 1.0, 1.0);
  qword_2684043B8 = (uint64_t)result;
  return result;
}

CGColorRef sub_22B529EA8()
{
  CGColorRef result = CGColorCreateGenericRGB(0.125490196, 0.647058824, 1.0, 1.0);
  qword_2684043C8 = (uint64_t)result;
  return result;
}

id sub_22B529EE0(id result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated) != (result & 1)) {
    return sub_22B52A930();
  }
  return result;
}

id sub_22B529F00(char a1)
{
  id v2 = (void *)*(unsigned __int8 *)(v1
                                  + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated) = a1;
  return sub_22B529EE0(v2);
}

uint64_t sub_22B529F18()
{
  sub_22B52B1A8(0, &qword_268404460);
  sub_22B545860();
  id v0 = sub_22B52A1EC();
  if (qword_268404390 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)sub_22B545870();
  objc_msgSend(v0, sel_setValue_forKey_, v1, *MEMORY[0x263F15CB0]);

  id v2 = (void *)sub_22B5458A0();
  uint64_t v3 = *MEMORY[0x263F15BF8];
  objc_msgSend(v0, sel_setValue_forKey_, v2, *MEMORY[0x263F15BF8]);

  sub_22B545860();
  id v4 = sub_22B52A1EC();
  unsigned int v5 = (void *)sub_22B5458A0();
  objc_msgSend(v4, sel_setValue_forKey_, v5, v3);

  sub_22B545860();
  id v6 = sub_22B52A1EC();
  CGRect v7 = (void *)sub_22B5458A0();
  objc_msgSend(v6, sel_setValue_forKey_, v7, v3);

  sub_22B545860();
  id v8 = sub_22B52A1EC();
  uint64_t v9 = (void *)sub_22B5458A0();
  objc_msgSend(v8, sel_setValue_forKey_, v9, *MEMORY[0x263F15C80]);

  uint64_t v10 = (void *)sub_22B545890();
  objc_msgSend(v8, sel_setValue_forKey_, v10, *MEMORY[0x263F15C68]);

  uint64_t v11 = (void *)sub_22B545890();
  objc_msgSend(v8, sel_setValue_forKey_, v11, *MEMORY[0x263F15C58]);

  double v12 = (void *)sub_22B545850();
  objc_msgSend(v8, sel_setValue_forKey_, v12, *MEMORY[0x263F15C78]);

  double v13 = (void *)sub_22B545890();
  objc_msgSend(v8, sel_setValue_forKey_, v13, *MEMORY[0x263F15C38]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_268404470);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_22B547FA0;
  *(void *)(v14 + 32) = v0;
  *(void *)(v14 + 40) = v4;
  *(void *)(v14 + 48) = v6;
  *(void *)(v14 + 56) = v8;
  uint64_t v16 = v14;
  sub_22B545880();
  return v16;
}

id sub_22B52A1EC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_22B545850();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithType_, v1);

  return v2;
}

uint64_t sub_22B52A260()
{
  sub_22B52B1A8(0, &qword_268404460);
  sub_22B545860();
  id v0 = sub_22B52A1EC();
  if (qword_2684043A0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)sub_22B545870();
  objc_msgSend(v0, sel_setValue_forKey_, v1, *MEMORY[0x263F15CB0]);

  id v2 = (void *)sub_22B5458A0();
  objc_msgSend(v0, sel_setValue_forKey_, v2, *MEMORY[0x263F15BF8]);

  sub_22B545860();
  id v3 = sub_22B52A1EC();
  id v4 = (void *)sub_22B5458A0();
  objc_msgSend(v3, sel_setValue_forKey_, v4, *MEMORY[0x263F15C80]);

  unsigned int v5 = (void *)sub_22B545890();
  objc_msgSend(v3, sel_setValue_forKey_, v5, *MEMORY[0x263F15C68]);

  id v6 = (void *)sub_22B545890();
  objc_msgSend(v3, sel_setValue_forKey_, v6, *MEMORY[0x263F15C58]);

  CGRect v7 = (void *)sub_22B545850();
  objc_msgSend(v3, sel_setValue_forKey_, v7, *MEMORY[0x263F15C78]);

  id v8 = (void *)sub_22B545890();
  objc_msgSend(v3, sel_setValue_forKey_, v8, *MEMORY[0x263F15C38]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_268404470);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_22B547FB0;
  *(void *)(v9 + 32) = v0;
  *(void *)(v9 + 40) = v3;
  uint64_t v11 = v9;
  sub_22B545880();
  return v11;
}

id sub_22B52A494(void *a1, void *a2, void *a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
  if (*a1 != -1) {
    swift_once();
  }
  objc_msgSend(v6, sel_setBackgroundColor_, *a2);
  objc_msgSend(v6, sel_setCompositingFilter_, *a3);
  return v6;
}

char *sub_22B52A534(double a1, double a2, double a3, double a4)
{
  v4[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated] = 0;
  uint64_t v9 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_defaultBackdropFilters;
  uint64_t v10 = v4;
  *(void *)&v4[v9] = sub_22B529F18();
  uint64_t v11 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedBackdropFilters;
  *(void *)&v10[v11] = sub_22B52A260();
  uint64_t v12 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer;
  *(void *)&v10[v12] = sub_22B52A494(&qword_2684043B0, &qword_2684043B8, MEMORY[0x263F15D58]);
  uint64_t v13 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer;
  *(void *)&v10[v13] = sub_22B52A494(&qword_2684043C0, &qword_2684043C8, MEMORY[0x263F15D50]);
  sub_22B52B1A8(0, &qword_268404478);
  if (qword_2684043D0 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)qword_2684043D8;
  id v15 = (id)qword_2684043D8;
  CGColorRef result = (char *)sub_22B528FE0(0x62726F5F5047, 0xE600000000000000, v14);
  if (result)
  {
    id v17 = result;
    id v18 = objc_msgSend(result, sel_imageWithRenderingMode_, 2);

    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15758]), sel_init);
    *(void *)&v10[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer] = v19;
    id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    *(void *)&v10[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer] = v20;
    id v21 = v20;
    id v22 = objc_msgSend(v18, sel_CGImage);
    objc_msgSend(v21, sel_setContents_, v22);

    v38.receiver = v10;
    v38.super_class = (Class)type metadata accessor for ButtonBackground();
    id v23 = (char *)objc_msgSendSuper2(&v38, sel_initWithFrame_, a1, a2, a3, a4);
    uint64_t v24 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer;
    v25 = *(void **)&v23[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer];
    v26 = v23;
    id v27 = v25;
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v27, sel_setFrame_);

    uint64_t v28 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer;
    id v29 = *(id *)&v26[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer];
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v29, sel_setFrame_);

    uint64_t v30 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer;
    id v31 = *(id *)&v26[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer];
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v31, sel_setFrame_);

    uint64_t v32 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer;
    id v33 = *(id *)&v26[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer];
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v33, sel_setFrame_);

    id v34 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v34, sel_addSublayer_, *(void *)&v23[v24]);

    id v35 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v35, sel_addSublayer_, *(void *)&v26[v30]);

    id v36 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v36, sel_addSublayer_, *(void *)&v26[v32]);

    id v37 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v37, sel_setMask_, *(void *)&v26[v28]);

    sub_22B52A930();
    return v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_22B52A930()
{
  uint64_t v1 = v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated] ^ 1u;
  id v2 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer];
  unint64_t v3 = swift_bridgeObjectRetain();
  id v4 = sub_22B52AA18(v3);
  swift_bridgeObjectRelease();
  sub_22B52B0E0((uint64_t)v4, v2);

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer], sel_setHidden_, v1);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer], sel_setHidden_, v1);
  return objc_msgSend(v0, sel_setNeedsLayout);
}

char *sub_22B52AA18(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22B545940();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  CGColorRef result = sub_22B52AFBC(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x230F4A0E0](i, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      sub_22B52B1A8(0, &qword_268404460);
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22B52AFBC(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v7 = *(void *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_22B52AFBC((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      *(void *)(v3 + 16) = v8 + 1;
      sub_22B52B150(&v9, (_OWORD *)(v3 + 32 * v8 + 32));
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

void sub_22B52ABBC()
{
  v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminated] = 0;
  uint64_t v1 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_defaultBackdropFilters;
  *(void *)&v0[v1] = sub_22B529F18();
  uint64_t v2 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedBackdropFilters;
  *(void *)&v0[v2] = sub_22B52A260();
  uint64_t v3 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer;
  *(void *)&v0[v3] = sub_22B52A494(&qword_2684043B0, &qword_2684043B8, MEMORY[0x263F15D58]);
  uint64_t v4 = OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer;
  *(void *)&v0[v4] = sub_22B52A494(&qword_2684043C0, &qword_2684043C8, MEMORY[0x263F15D50]);

  sub_22B545930();
  __break(1u);
}

void sub_22B52ACE4()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ButtonBackground();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  id v1 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  id v2 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  id v3 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);

  id v4 = *(id *)&v0[OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

id sub_22B52AE3C()
{
  return sub_22B52AE58(0, type metadata accessor for ButtonBackground);
}

id sub_22B52AE58(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ButtonBackground()
{
  return self;
}

void sub_22B52AF40()
{
  id v0 = (NSString *)sub_22B545850();
  Class v1 = NSClassFromString(v0);

  if (v1) {
    qword_2684043D8 = (uint64_t)objc_msgSend(self, sel_bundleForClass_, v1);
  }
  else {
    __break(1u);
  }
}

char *sub_22B52AFBC(char *a1, int64_t a2, char a3)
{
  CGColorRef result = sub_22B52AFDC(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
}

char *sub_22B52AFDC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268404468);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
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

void sub_22B52B0E0(uint64_t a1, void *a2)
{
  id v3 = (id)sub_22B545870();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setFilters_, v3);
}

_OWORD *sub_22B52B150(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
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

uint64_t sub_22B52B1A8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22B52B1E4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_22B52B21C(void *a1)
{
  return sub_22B5299A4(a1, v1);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void OUTLINED_FUNCTION_0(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = 0x3FE147AE147AE148;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = 0x3FEF5C28F5C28F5CLL;
}

uint64_t sub_22B52B2B0()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_22B52D1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_22B52D4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B52D674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B52D7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B52DB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UnsuppressedURLs(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = [v2 allKeys];
  objc_super v4 = [MEMORY[0x263EFF9C0] set];
  char v5 = (void *)[v2 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        size_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          if ([v12 hasPrefix:@"com.apple.asset-explorer-package.suppressed."])
          {
            uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"com.apple.asset-explorer-package.suppressed." withString:&stru_26DEB7A80];

            -[NSMutableDictionary ae_moveObjectFromKey:toKey:](v5, v12, v13);
            [v4 addObject:v13];
            id v12 = v13;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if (a2) {
    *a2 = v4;
  }

  return v5;
}

void sub_22B52E770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B52F494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B5303EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B533980(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

id AssetExplorerBundle()
{
  if (AssetExplorerBundle_onceToken != -1) {
    dispatch_once(&AssetExplorerBundle_onceToken, &__block_literal_global_772);
  }
  uint64_t v0 = (void *)__AssetExplorerBundle;
  return v0;
}

uint64_t __AssetExplorerBundle_block_invoke()
{
  __AssetExplorerBundle = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Aeexplorerview.isa)];
  return MEMORY[0x270F9A758]();
}

void __AEIsModernAspectScreen_block_invoke()
{
  id v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 _referenceBounds];
  AEIsModernAspectScreen_isModernScreen = v1 / v0 >= 2.16;
}

void AEChatKitSendAnalyticsEventAssetSentFromSource(unint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  if (a1 > 6) {
    double v1 = 0;
  }
  else {
    double v1 = off_26489B740[a1];
  }
  id v3 = @"sendSource";
  v4[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  AnalyticsSendEvent();
}

void AEChatKitSendAnalyticsEventAssetsSentCount(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"itemsCount";
  double v1 = [NSNumber numberWithUnsignedInteger:a1];
  v4[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  AnalyticsSendEvent();
}

void sub_22B53BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__933(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__934(uint64_t a1)
{
}

void sub_22B53CA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_22B53D088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22B53E98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B53EE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1034(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1035(uint64_t a1)
{
}

void sub_22B53F5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_22B542E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__1229(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1230(uint64_t a1)
{
}

void sub_22B543EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22B545820()
{
  return MEMORY[0x270F81C98]();
}

uint64_t sub_22B545830()
{
  return MEMORY[0x270F821D0]();
}

uint64_t sub_22B545840()
{
  return MEMORY[0x270F821D8]();
}

uint64_t sub_22B545850()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22B545860()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22B545870()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22B545880()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22B545890()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_22B5458A0()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_22B5458B0()
{
  return MEMORY[0x270F82980]();
}

uint64_t sub_22B5458C0()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_22B5458D0()
{
  return MEMORY[0x270F82A80]();
}

uint64_t sub_22B5458E0()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_22B5458F0()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_22B545900()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_22B545910()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_22B545920()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22B545930()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22B545940()
{
  return MEMORY[0x270F9F080]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FF8](isrc, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

uint64_t DCIM_MakeUniqueDirectoryWithPath()
{
  return MEMORY[0x270F537B8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PFSharedFigDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x270F53B78]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x270F536C0]();
}

uint64_t PLAssetExplorerGetLog()
{
  return MEMORY[0x270F537D8]();
}

uint64_t PLIsLockdownMode()
{
  return MEMORY[0x270F53848]();
}

uint64_t PLPickerGetLog()
{
  return MEMORY[0x270F53898]();
}

uint64_t PUActivityItemSharingPreferencesMake()
{
  return MEMORY[0x270F54100]();
}

uint64_t PULocalizedString()
{
  return MEMORY[0x270F54108]();
}

uint64_t PXAssertGetLog()
{
  return MEMORY[0x270F53CB8]();
}

uint64_t PXEdgeInsetsEqualToEdgeInsets()
{
  return MEMORY[0x270F53CD0]();
}

uint64_t PXFloatGreaterThanFloat()
{
  return MEMORY[0x270F53CE0]();
}

uint64_t PXIndexPathFromSimpleIndexPath()
{
  return MEMORY[0x270F53CF0]();
}

uint64_t PXLocalizedString()
{
  return MEMORY[0x270F53CF8]();
}

uint64_t PXLocalizedVideoDuration()
{
  return MEMORY[0x270F53D00]();
}

uint64_t PXRectGetCenter()
{
  return MEMORY[0x270F53D10]();
}

uint64_t PXSimpleIndexPathFromIndexPath()
{
  return MEMORY[0x270F53D18]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t px_dispatch_queue_create_serial()
{
  return MEMORY[0x270F53D20]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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