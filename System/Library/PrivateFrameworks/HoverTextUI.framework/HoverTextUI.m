id HTUILocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = a1;
  v2 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Htuitaggedcolo.isa)];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_26DA82830 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id HTUIParameterizedLocString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  v10 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Htuitaggedcolo.isa)];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 localizedStringForKey:v9 value:&stru_26DA82830 table:@"Accessibility"];
    int v13 = [v12 hasSuffix:@"%"];
    if (v13)
    {
      uint64_t v14 = objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 1);

      v12 = (void *)v14;
    }
    v15 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];

    if (v13)
    {
      uint64_t v16 = [v15 stringByAppendingString:@"%"];

      v15 = (void *)v16;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t HTDisplayIDForWindow(void *a1)
{
  v1 = [a1 screen];
  v2 = [v1 displayIdentity];
  uint64_t v3 = [v2 displayID];

  return v3;
}

void _axEventHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v8 = (void *)MEMORY[0x22A65D3F0]();
  if (a5)
  {
    id v9 = [a5 handler];
    v9[2](v9, a3, a4);
  }
  else
  {
    v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      _axEventHandler_cold_1(a3, v10);
    }
  }
}

uint64_t sub_22695FA60()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22695FB10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22695FB4C()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 112);
}

uint64_t sub_22695FBEC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 112);
  return result;
}

uint64_t sub_22695FC94()
{
  return sub_226960A94();
}

uint64_t sub_22695FCB4()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 113);
}

uint64_t sub_22695FD54@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 113);
  return result;
}

uint64_t sub_22695FDFC()
{
  return swift_release();
}

double sub_22695FECC()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 120);
}

__n128 sub_22695FF6C@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  __n128 result = *(__n128 *)(v3 + 120);
  *a2 = result;
  return result;
}

uint64_t sub_226960014()
{
  return swift_release();
}

uint64_t sub_2269600EC()
{
  return swift_retain();
}

uint64_t sub_226960190(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 136) = a2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2269601CC()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t sub_22696026C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 144);
  return result;
}

uint64_t sub_226960314()
{
  return sub_226960A94();
}

uint64_t sub_226960334()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 145);
}

uint64_t sub_2269603D4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 145);
  return result;
}

uint64_t sub_22696047C()
{
  return sub_226960A94();
}

uint64_t sub_22696049C()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v0 + 152);
}

uint64_t sub_22696053C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 152) = a2;
  return result;
}

uint64_t sub_226960544()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 160);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2269605F4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 168);
  *a2 = *(void *)(v3 + 160);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2269606A0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_226960784@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  uint64_t v4 = sub_2269B82E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_226960880(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  uint64_t v4 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

uint64_t sub_22696091C()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible);
}

uint64_t sub_2269609C4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible);
  return result;
}

uint64_t sub_226960A74()
{
  return sub_226960A94();
}

uint64_t sub_226960A94()
{
  return swift_release();
}

double sub_226960B54()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
}

__n128 sub_226960C04@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  __n128 result = *(__n128 *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
  long long v5 = *(_OWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect + 16);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_226960CB8()
{
  return swift_release();
}

uint64_t sub_226960DA0()
{
  return sub_226960E44();
}

uint64_t sub_226960DB4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_226960EFC(a1, &OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor, a2);
}

uint64_t sub_226960DC8()
{
  return sub_226960FD4();
}

uint64_t sub_226960DE8()
{
  return sub_226960E44();
}

uint64_t sub_226960DFC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_226960EFC(a1, &OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__borderColor, a2);
}

uint64_t sub_226960E10()
{
  return sub_226960FD4();
}

uint64_t sub_226960E30()
{
  return sub_226960E44();
}

uint64_t sub_226960E44()
{
  return swift_retain();
}

uint64_t sub_226960EE8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_226960EFC(a1, &OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__backgroundColor, a2);
}

uint64_t sub_226960EFC@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  *a3 = *(void *)(v5 + *a2);
  return swift_retain();
}

uint64_t sub_226960FB4()
{
  return sub_226960FD4();
}

uint64_t sub_226960FD4()
{
  return swift_release();
}

uint64_t sub_2269610AC()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
}

uint64_t sub_226961154@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
  return result;
}

uint64_t sub_226961204()
{
  return swift_release();
}

id sub_2269612D0()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);

  return v1;
}

void sub_226961388(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  *(void *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont) = a2;
  id v3 = a2;
}

uint64_t sub_2269613C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2269B95E0();
  swift_getKeyPath();
  *(void *)&long long v14 = v0;
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v6 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_2269B82C0();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2269B9590();
  swift_getKeyPath();
  *(void *)&long long v14 = v1;
  sub_2269B84A0();
  swift_release();
  if (*(void *)(v1 + 104))
  {
    swift_bridgeObjectRetain();
    sub_2269B8FC0();
    swift_bridgeObjectRelease();
    sub_2269B9590();
  }
  long long v16 = v11;
  long long v17 = v12;
  uint64_t v18 = v13;
  long long v14 = v9;
  long long v15 = v10;
  return sub_2269B95C0();
}

uint64_t sub_226961600(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = a1;
  uint64_t v70 = a2;
  uint64_t v3 = sub_2269B8550();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  MEMORY[0x270FA5388](v3);
  v71 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2269B82E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0;
  *(_WORD *)(v2 + 112) = 512;
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 136) = 0;
  *(void *)(v2 + 120) = 0;
  *(_WORD *)(v2 + 144) = 0;
  long long v9 = self;
  swift_retain();
  unint64_t v10 = 0x2647BF000uLL;
  id v11 = objc_msgSend(v9, sel_sharedInstance);
  id v12 = objc_msgSend(v11, sel_hoverTextScrollingSpeed);

  *(void *)(v2 + 152) = v12;
  sub_2269B8250();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText, v8, v5);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible) = 0;
  uint64_t v13 = (_OWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
  *uint64_t v13 = 0u;
  v13[1] = 0u;
  id v14 = objc_msgSend(v9, sel_sharedInstance);
  id v15 = objc_msgSend(v14, sel_hoverTextTextColorData);

  if (v15)
  {
    uint64_t v16 = sub_2269B83E0();
    unint64_t v18 = v17;

    v19 = (void *)sub_2269B83D0();
  }
  else
  {
    v19 = 0;
    uint64_t v16 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  v20 = self;
  id v21 = objc_msgSend(v20, sel_makeFromData_, v19);

  if (v21)
  {
    uint64_t v22 = MEMORY[0x22A65C500](objc_msgSend(v21, sel_color));
  }
  else
  {
    uint64_t v22 = sub_2269B8BB0();
  }
  sub_226967370(v16, v18);
  *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor) = v22;
  id v23 = objc_msgSend(v9, sel_sharedInstance);
  id v24 = objc_msgSend(v23, sel_hoverTextBorderColorData);

  if (v24)
  {
    uint64_t v25 = sub_2269B83E0();
    unint64_t v27 = v26;

    v28 = (void *)sub_2269B83D0();
  }
  else
  {
    v28 = 0;
    uint64_t v25 = 0;
    unint64_t v27 = 0xF000000000000000;
  }
  id v29 = objc_msgSend(v20, sel_makeFromData_, v28, v69, v70);

  if (v29)
  {
    uint64_t v30 = MEMORY[0x22A65C500](objc_msgSend(v29, sel_color));
  }
  else
  {
    uint64_t v30 = sub_2269B8BB0();
  }
  sub_226967370(v25, v27);
  *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__borderColor) = v30;
  id v31 = objc_msgSend(v9, sel_sharedInstance);
  id v32 = objc_msgSend(v31, sel_hoverTextBackgroundColorData);

  if (v32)
  {
    uint64_t v33 = sub_2269B83E0();
    unint64_t v35 = v34;

    v36 = (void *)sub_2269B83D0();
  }
  else
  {
    v36 = 0;
    uint64_t v33 = 0;
    unint64_t v35 = 0xF000000000000000;
  }
  id v37 = objc_msgSend(v20, sel_makeFromData_, v36);

  if (v37)
  {
    uint64_t v38 = MEMORY[0x22A65C500](objc_msgSend(v37, sel_color));
  }
  else
  {
    id v39 = objc_msgSend(self, sel_systemBackgroundColor);
    MEMORY[0x22A65C580](v39);
    id v40 = objc_msgSend(v9, sel_sharedInstance);
    objc_msgSend(v40, sel_hoverTextBackgroundOpacity);

    uint64_t v38 = sub_2269B8BA0();
    swift_release();
  }
  v41 = v71;
  sub_226967370(v33, v35);
  *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__backgroundColor) = v38;
  id v42 = objc_msgSend(v9, sel_sharedInstance);
  id v43 = objc_msgSend(v42, sel_hoverTextDisplayMode);

  *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode) = v43;
  id v44 = objc_msgSend(self, sel_systemFontOfSize_, 10.0);
  *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont) = v44;
  sub_2269B84D0();
  uint64_t v45 = v70;
  *(void *)(v2 + 160) = v69;
  *(void *)(v2 + 168) = v45;
  swift_release();
  uint64_t v46 = sub_22697A0B8();
  swift_retain();
  sub_2269648A8();
  uint64_t v47 = sub_2269B8530();
  swift_beginAccess();
  uint64_t v49 = v72;
  uint64_t v48 = v73;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v41, v47, v73);
  swift_retain_n();
  v50 = sub_2269B8540();
  os_log_type_t v51 = sub_2269B9160();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 134218240;
    swift_getKeyPath();
    aBlock[0] = v46;
    sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
    sub_2269B84A0();
    swift_release();
    uint64_t v53 = *(void *)(v46 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
    swift_release();
    aBlock[0] = v53;
    sub_2269B9290();
    swift_release();
    *(_WORD *)(v52 + 12) = 2048;
    swift_getKeyPath();
    aBlock[0] = v46;
    sub_2269B84A0();
    v41 = v71;
    swift_release();
    uint64_t v54 = *(void *)(v46 + 152);
    swift_release();
    aBlock[0] = v54;
    unint64_t v10 = 0x2647BF000;
    uint64_t v49 = v72;
    sub_2269B9290();
    swift_release();
    _os_log_impl(&dword_22695C000, v50, v51, "Using initial UI properties: displayMode: %ld. Scrolling speed: %ld", (uint8_t *)v52, 0x16u);
    uint64_t v55 = v52;
    uint64_t v48 = v73;
    MEMORY[0x22A65DA10](v55, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v48);
  v56 = (void *)*MEMORY[0x263F8B110];
  swift_retain();
  sub_22697A574(v56, (uint64_t)sub_2269620D0, 0);
  swift_release();
  v57 = (void *)*MEMORY[0x263F8B258];
  swift_retain();
  sub_22697A574(v57, (uint64_t)sub_2269620D0, 0);
  swift_release();
  v58 = (void *)*MEMORY[0x263F8B238];
  swift_retain();
  sub_22697A574(v58, (uint64_t)sub_2269620D8, 0);
  swift_release();
  v59 = (void *)*MEMORY[0x263F8B250];
  swift_retain();
  sub_22697A574(v59, (uint64_t)sub_2269620E0, 0);
  swift_release();
  v60 = (void *)*MEMORY[0x263F8B260];
  swift_retain();
  sub_22697A574(v60, (uint64_t)sub_2269620E8, 0);
  swift_release();
  v61 = (void *)*MEMORY[0x263F8B220];
  swift_retain();
  sub_22697A574(v61, (uint64_t)sub_2269620F0, 0);
  swift_release();
  v62 = (void *)*MEMORY[0x263F8B230];
  swift_retain();
  sub_22697A574(v62, (uint64_t)sub_2269620F8, 0);
  swift_release();
  v63 = (void *)*MEMORY[0x263F8B228];
  swift_retain();
  sub_22697A574(v63, (uint64_t)sub_226962100, 0);
  swift_release();
  v64 = (void *)*MEMORY[0x263F8B240];
  swift_retain();
  sub_22697A574(v64, (uint64_t)sub_226962108, 0);
  swift_release();
  id v65 = [v9 *(SEL *)(v10 + 2520)];
  uint64_t v66 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_2269676FC;
  aBlock[5] = v66;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226982998;
  aBlock[3] = &block_descriptor;
  v67 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v65, sel_registerUpdateBlock_forRetrieveSelector_withListener_, v67, sub_2269B8480(), v46);
  swift_release();
  _Block_release(v67);

  return v46;
}

uint64_t sub_2269620D0()
{
  return sub_226962110();
}

uint64_t sub_2269620D8()
{
  return sub_226962110();
}

uint64_t sub_2269620E0()
{
  return sub_226962110();
}

uint64_t sub_2269620E8()
{
  return sub_226962110();
}

uint64_t sub_2269620F0()
{
  return sub_226962110();
}

uint64_t sub_2269620F8()
{
  return sub_226962110();
}

uint64_t sub_226962100()
{
  return sub_226962110();
}

uint64_t sub_226962108()
{
  return sub_226962110();
}

uint64_t sub_226962110()
{
  return swift_release();
}

uint64_t sub_226962154()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    sub_2269B8560();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_2269621CC(void (*a1)(char *, uint64_t))
{
  uint64_t v2 = v1;
  uint64_t v95 = sub_2269B82E0();
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v93 = (uint64_t)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v5 = MEMORY[0x270FA5388](v96);
  uint64_t v7 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v90 - v9;
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v90 - v11;
  uint64_t v13 = sub_2269B8550();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  v92 = (char *)&v90 - v19;
  MEMORY[0x270FA5388](v18);
  id v21 = (char *)&v90 - v20;
  uint64_t v22 = sub_2269B8530();
  swift_beginAccess();
  id v23 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v100 = v22;
  uint64_t v99 = v14 + 16;
  v98 = v23;
  v23(v21, v22, v13);
  v103 = a1;
  sub_226967548((uint64_t)a1, (uint64_t)v12);
  swift_retain_n();
  id v24 = sub_2269B8540();
  int v25 = sub_2269B9130();
  BOOL v26 = os_log_type_enabled(v24, (os_log_type_t)v25);
  *(void *)&long long v104 = v14;
  v97 = v17;
  if (!v26)
  {
    swift_release_n();
    sub_2269675AC((uint64_t)v12);

    unint64_t v34 = *(void (**)(char *, uint64_t))(v14 + 8);
    v34(v21, v13);
    goto LABEL_27;
  }
  int v91 = v25;
  uint64_t v102 = (uint64_t)v7;
  uint64_t v101 = v13;
  uint64_t v27 = swift_slowAlloc();
  uint64_t v90 = swift_slowAlloc();
  v107[0] = v90;
  *(_DWORD *)uint64_t v27 = 136315394;
  swift_getKeyPath();
  v108 = v2;
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v28 = v2[20];
  unint64_t v29 = v2[21];
  swift_bridgeObjectRetain();
  v108 = (void *)sub_22697609C(v28, v29, v107);
  sub_2269B9290();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v27 + 12) = 2080;
  sub_226967548((uint64_t)v12, (uint64_t)v10);
  uint64_t v30 = *(void *)v10;
  unsigned int v31 = v10[48];
  uint64_t v32 = 0xD000000000000016;
  unint64_t v33 = 0x80000002269BD3B0;
  switch((v31 >> 5) & 3)
  {
    case 1u:
      break;
    case 2u:
      unint64_t v33 = 0xEC0000006465676ELL;
      uint64_t v32 = 0x61684365756C6156;
      break;
    case 3u:
      uint64_t v35 = *((void *)v10 + 3);
      uint64_t v36 = *((void *)v10 + 4) | *((void *)v10 + 5);
      uint64_t v37 = *((void *)v10 + 2) | *((void *)v10 + 1);
      if (v31 != 96 || v36 | v30 | v35 | v37)
      {
        uint64_t v39 = v36 | v35 | v37;
        if (v31 != 96 || v30 != 1 || v39)
        {
          BOOL v40 = v31 == 96;
          BOOL v42 = v30 == 2 && v39 == 0;
          if (v40 && v42) {
            uint64_t v32 = 0xD000000000000011;
          }
          else {
            uint64_t v32 = 0xD00000000000001DLL;
          }
          if (v40 && v42) {
            unint64_t v33 = 0x80000002269BD350;
          }
          else {
            unint64_t v33 = 0x80000002269BD330;
          }
          break;
        }
        uint64_t v38 = "ElementVisualUpdated";
      }
      else
      {
        uint64_t v38 = "PrimaryAppsDidChange";
      }
      unint64_t v33 = (unint64_t)(v38 - 32) | 0x8000000000000000;
      uint64_t v32 = 0xD000000000000014;
      break;
    default:
      unint64_t v33 = 0xEE0065676E616843;
      uint64_t v32 = 0x6469447375636F46;
      break;
  }
  sub_2269675AC((uint64_t)v10);
  v108 = (void *)sub_22697609C(v32, v33, v107);
  sub_2269B9290();
  swift_bridgeObjectRelease();
  sub_2269675AC((uint64_t)v12);
  _os_log_impl(&dword_22695C000, v24, (os_log_type_t)v91, "Store:%s - Handle event: %s", (uint8_t *)v27, 0x16u);
  uint64_t v43 = v90;
  swift_arrayDestroy();
  MEMORY[0x22A65DA10](v43, -1, -1);
  MEMORY[0x22A65DA10](v27, -1, -1);

  unint64_t v34 = *(void (**)(char *, uint64_t))(v104 + 8);
  uint64_t v13 = v101;
  v34(v21, v101);
  uint64_t v7 = (char *)v102;
LABEL_27:
  sub_226967548((uint64_t)v103, (uint64_t)v7);
  HoverTextPresentationEvent.processEvent()();
  if (!v44)
  {
    sub_22696325C();
    double v57 = v56;
    uint64_t v58 = swift_allocObject();
    swift_weakInit();
    type metadata accessor for HoverTextTimer();
    swift_allocObject();
    uint64_t v59 = sub_226967C94((uint64_t)sub_226967654, v58, v57);
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)&long long v104 = &v90;
    MEMORY[0x270FA5388](KeyPath);
    *(&v90 - 2) = (uint64_t)v2;
    *(&v90 - 1) = v59;
    v107[0] = (uint64_t)v2;
    uint64_t v61 = sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
    v62 = (void (*)(char *, uint64_t))(MEMORY[0x263F8EE60] + 8);
    sub_2269B8490();
    swift_release();
    swift_release();
    uint64_t v63 = v93;
    uint64_t v102 = (uint64_t)v7;
    sub_226963BDC((uint64_t)v7, v93);
    uint64_t v64 = swift_getKeyPath();
    MEMORY[0x270FA5388](v64);
    *(&v90 - 2) = (uint64_t)v2;
    *(&v90 - 1) = v63;
    v107[0] = (uint64_t)v2;
    uint64_t v101 = v61;
    sub_2269B8490();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v63, v95);
    char v65 = sub_226963468();
    uint64_t v66 = swift_getKeyPath();
    MEMORY[0x270FA5388](v66);
    *(&v90 - 2) = (uint64_t)v2;
    *((unsigned char *)&v90 - 8) = v65 & 1;
    v107[0] = (uint64_t)v2;
    v103 = v62;
    sub_2269B8490();
    swift_release();
    uint64_t v67 = v96;
    v68 = &v7[*(int *)(v96 + 32)];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    uint64_t v71 = swift_getKeyPath();
    MEMORY[0x270FA5388](v71);
    *(&v90 - 4) = (uint64_t)v2;
    *(&v90 - 3) = v70;
    *(&v90 - 2) = v69;
    v107[0] = (uint64_t)v2;
    swift_bridgeObjectRetain();
    sub_2269B8490();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v72 = *(int *)(v67 + 36);
    uint64_t v73 = v102;
    v74 = (long long *)(v102 + v72);
    long long v104 = *v74;
    uint64_t v75 = *((void *)v74 + 2);
    uint64_t v76 = *((void *)v74 + 3);
    uint64_t v77 = swift_getKeyPath();
    MEMORY[0x270FA5388](v77);
    *(&v90 - 6) = (uint64_t)v2;
    *(_OWORD *)(&v90 - 5) = v104;
    *(&v90 - 3) = v75;
    *(&v90 - 2) = v76;
    v107[0] = (uint64_t)v2;
    sub_2269B8490();
    swift_release();
    sub_2269675AC(v73);
    return;
  }
  sub_2269675AC((uint64_t)v7);
  id v110 = v44;
  id v45 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148B40);
  if (!swift_dynamicCast()) {
    goto LABEL_34;
  }
  if (v109 != 1)
  {
    sub_226967608((uint64_t)v108, v109);
LABEL_34:

    uint64_t v78 = v100;
    swift_beginAccess();
    v79 = v97;
    v98(v97, v78, v13);
    swift_retain();
    id v80 = v44;
    swift_retain();
    id v81 = v44;
    v82 = sub_2269B8540();
    os_log_type_t v83 = sub_2269B9120();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = swift_slowAlloc();
      uint64_t v102 = swift_slowAlloc();
      v108 = (void *)v102;
      *(_DWORD *)uint64_t v84 = 136315394;
      v103 = v34;
      swift_getKeyPath();
      id v110 = v2;
      sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
      uint64_t v101 = v13;
      sub_2269B84A0();
      swift_release();
      uint64_t v85 = v2[20];
      unint64_t v86 = v2[21];
      swift_bridgeObjectRetain();
      id v110 = (id)sub_22697609C(v85, v86, (uint64_t *)&v108);
      sub_2269B9290();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v84 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v87 = sub_2269B9520();
      id v110 = (id)sub_22697609C(v87, v88, (uint64_t *)&v108);
      sub_2269B9290();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22695C000, v82, v83, "Store:%s - Will not update display text: %s", (uint8_t *)v84, 0x16u);
      uint64_t v89 = v102;
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v89, -1, -1);
      MEMORY[0x22A65DA10](v84, -1, -1);

      v103(v79, v101);
    }
    else
    {

      swift_release_n();
      v34(v79, v13);
    }
    return;
  }

  uint64_t v46 = swift_getKeyPath();
  MEMORY[0x270FA5388](v46);
  *(&v90 - 2) = (uint64_t)v2;
  *((unsigned char *)&v90 - 8) = 0;
  v107[0] = (uint64_t)v2;
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B8490();
  swift_release();
  uint64_t v47 = v100;
  swift_beginAccess();
  uint64_t v48 = v92;
  v98(v92, v47, v13);
  swift_retain_n();
  uint64_t v49 = sub_2269B8540();
  os_log_type_t v50 = sub_2269B9120();
  if (os_log_type_enabled(v49, v50))
  {
    os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    v103 = v34;
    uint64_t v53 = v52;
    uint64_t v106 = v52;
    *(_DWORD *)os_log_type_t v51 = 136315138;
    uint64_t v102 = (uint64_t)(v51 + 4);
    swift_getKeyPath();
    uint64_t v101 = v13;
    uint64_t v105 = (uint64_t)v2;
    sub_2269B84A0();
    swift_release();
    uint64_t v54 = v2[20];
    unint64_t v55 = v2[21];
    swift_bridgeObjectRetain();
    uint64_t v105 = sub_22697609C(v54, v55, &v106);
    sub_2269B9290();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v49, v50, "Store:%s - No display text to show", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v53, -1, -1);
    MEMORY[0x22A65DA10](v51, -1, -1);

    v103(v92, v101);
  }
  else
  {

    swift_release_n();
    v34(v48, v13);
  }
}

uint64_t sub_22696325C()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v3 = objc_msgSend(v2, sel_hoverTextActivationLockEnabled);

  if (!v3
    || (swift_getKeyPath(),
        sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore),
        sub_2269B84A0(),
        uint64_t result = swift_release(),
        (*(unsigned char *)(v1 + 145) & 1) == 0))
  {
    swift_getKeyPath();
    sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
    sub_2269B84A0();
    uint64_t result = swift_release();
    if ((*(unsigned char *)(v1 + 144) & 1) == 0)
    {
      swift_getKeyPath();
      sub_2269B84A0();
      swift_release();
      swift_getKeyPath();
      sub_2269B84A0();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_226963468()
{
  uint64_t v1 = v0;
  uint64_t v45 = sub_2269B8550();
  uint64_t v37 = *(void *)(v45 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v44 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2269B8290();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  BOOL v40 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_2269B8240();
  uint64_t v42 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2269B82E0();
  uint64_t v38 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v15 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  uint64_t v50 = v1;
  uint64_t v39 = v1;
  uint64_t v46 = sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  uint64_t v43 = v15;
  sub_2269B84A0();
  swift_release();
  uint64_t v16 = v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v16, v11);
  sub_2269B81F0();
  sub_226966F70(&qword_268148B20, MEMORY[0x263F066D8]);
  sub_2269B90C0();
  unint64_t v17 = v40;
  sub_2269B90E0();
  sub_226966F70(&qword_268148B28, MEMORY[0x263F067E8]);
  LOBYTE(v16) = sub_2269B8EF0();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v41 + 8);
  v18(v17, v3);
  v18(v7, v3);
  uint64_t v19 = v39;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v38);
  if ((v16 & 1) == 0) {
    goto LABEL_23;
  }
  swift_getKeyPath();
  uint64_t v49 = v19;
  sub_2269B84A0();
  swift_release();
  if (!*(void *)(v19 + 104)) {
    goto LABEL_13;
  }
  swift_getKeyPath();
  uint64_t v49 = v19;
  sub_2269B84A0();
  uint64_t result = swift_release();
  unint64_t v21 = *(void *)(v19 + 104);
  if (!v21)
  {
    __break(1u);
    return result;
  }
  if ((v21 & 0x2000000000000000) != 0 ? HIBYTE(v21) & 0xF : *(void *)(v19 + 96) & 0xFFFFFFFFFFFFLL)
  {
LABEL_23:
    if (GSEventIsHardwareKeyboardAttached())
    {
      id v23 = objc_msgSend(self, sel_sharedInstance);
      unsigned int v24 = objc_msgSend(v23, sel_hoverTextActivationLockEnabled);

      int v25 = v44;
      uint64_t v26 = v45;
      uint64_t v27 = v37;
      if (v24 && (swift_getKeyPath(), uint64_t v49 = v19, sub_2269B84A0(), swift_release(), (*(unsigned char *)(v19 + 145) & 1) != 0))
      {
        uint64_t v28 = 1;
      }
      else
      {
        swift_getKeyPath();
        uint64_t v49 = v19;
        sub_2269B84A0();
        swift_release();
        uint64_t v28 = *(unsigned __int8 *)(v19 + 144);
      }
      goto LABEL_16;
    }
    uint64_t v28 = 1;
  }
  else
  {
LABEL_13:
    uint64_t v28 = 0;
  }
  int v25 = v44;
  uint64_t v26 = v45;
  uint64_t v27 = v37;
LABEL_16:
  uint64_t v29 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v25, v29, v26);
  swift_retain_n();
  uint64_t v30 = sub_2269B8540();
  os_log_type_t v31 = sub_2269B9130();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = v27;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v48 = v34;
    *(_DWORD *)uint64_t v33 = 136315394;
    swift_getKeyPath();
    uint64_t v47 = v19;
    sub_2269B84A0();
    swift_release();
    uint64_t v35 = *(void *)(v19 + 160);
    unint64_t v36 = *(void *)(v19 + 168);
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_22697609C(v35, v36, &v48);
    sub_2269B9290();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 1024;
    LODWORD(v47) = v28;
    sub_2269B9290();
    _os_log_impl(&dword_22695C000, v30, v31, "Store:%s - determineVisibility=%{BOOL}d", (uint8_t *)v33, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v34, -1, -1);
    MEMORY[0x22A65DA10](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v44, v45);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v26);
  }
  return v28;
}

uint64_t sub_226963BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v29 = sub_2269B8280();
  uint64_t v6 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_2269B8370();
  uint64_t v30 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  unint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 28);
  uint64_t v12 = sub_2269B82E0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  uint64_t v26 = a2;
  v13(a2, v11, v12);
  swift_getKeyPath();
  v24[0] = v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  uint64_t v33 = v3;
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor);
  swift_retain();
  sub_2269B8360();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v33 = v14;
  sub_226967448();
  swift_retain();
  sub_2269B8350();
  unsigned int v27 = *MEMORY[0x263F06720];
  int v25 = *(void (**)(char *))(v6 + 104);
  uint64_t v15 = v29;
  v25(v8);
  sub_2269B8270();
  swift_release();
  uint64_t v16 = v6 + 8;
  unint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24[1] = v16;
  v17(v8, v15);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v30 + 8);
  v30 += 8;
  uint64_t v19 = v28;
  v18(v10, v28);
  swift_getKeyPath();
  uint64_t v33 = v3;
  sub_2269B84A0();
  swift_release();
  id v20 = *(id *)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  uint64_t v21 = sub_2269B8980();
  sub_2269B8360();
  uint64_t v31 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v33 = v21;
  sub_2269674DC();
  swift_retain();
  sub_2269B8350();
  uint64_t v22 = v29;
  ((void (*)(char *, void, uint64_t))v25)(v8, v27, v29);
  sub_2269B8270();
  swift_release();
  v17(v8, v22);
  return ((uint64_t (*)(char *, uint64_t))v18)(v10, v19);
}

void sub_226963FE4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2269B8550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_2269B8540();
  os_log_type_t v10 = sub_2269B9160();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_22695C000, v9, v10, "Will update UI properties", v11, 2u);
    MEMORY[0x22A65DA10](v11, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      sub_2269648A8();
      return;
    case 3:
      id v18 = objc_msgSend(self, sel_sharedInstance);
      id v19 = objc_msgSend(v18, sel_hoverTextTextColorData);

      if (v19)
      {
        uint64_t v15 = sub_2269B83E0();
        unint64_t v17 = v20;

        id v19 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v17 = 0xF000000000000000;
      }
      id v32 = objc_msgSend(self, sel_makeFromData_, v19);

      if (v32) {
        goto LABEL_23;
      }
      uint64_t v29 = sub_22697B170(3);
      goto LABEL_26;
    case 4:
      id v21 = objc_msgSend(self, sel_sharedInstance);
      id v22 = objc_msgSend(v21, sel_hoverTextBorderColorData);

      if (v22)
      {
        uint64_t v15 = sub_2269B83E0();
        unint64_t v17 = v23;

        id v22 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v17 = 0xF000000000000000;
      }
      id v32 = objc_msgSend(self, sel_makeFromData_, v22);

      if (v32)
      {
LABEL_23:
        uint64_t v29 = MEMORY[0x22A65C500](objc_msgSend(v32, sel_color));
      }
      else
      {
        uint64_t v29 = sub_22697B170(4);
      }
      goto LABEL_26;
    case 5:
    case 6:
      uint64_t v12 = self;
      id v13 = objc_msgSend(v12, sel_sharedInstance);
      id v14 = objc_msgSend(v13, sel_hoverTextBackgroundColorData);

      if (v14)
      {
        uint64_t v15 = sub_2269B83E0();
        unint64_t v17 = v16;

        id v14 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v17 = 0xF000000000000000;
      }
      id v28 = objc_msgSend(self, sel_makeFromData_, v14);

      if (v28)
      {
        uint64_t v29 = MEMORY[0x22A65C500](objc_msgSend(v28, sel_color));
      }
      else
      {
        id v30 = objc_msgSend(self, sel_systemBackgroundColor);
        MEMORY[0x22A65C580](v30);
        id v31 = objc_msgSend(v12, sel_sharedInstance);
        objc_msgSend(v31, sel_hoverTextBackgroundOpacity);

        uint64_t v29 = sub_2269B8BA0();
        swift_release();
      }
LABEL_26:
      sub_226967370(v15, v17);
      swift_getKeyPath();
      MEMORY[0x270FA5388]();
      *(void *)&v33[-16] = v2;
      *(void *)&v33[-8] = v29;
      uint64_t v34 = v2;
      sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
      sub_2269B8490();
      swift_release();
      goto LABEL_27;
    case 7:
      id v24 = objc_msgSend(self, sel_sharedInstance);
      id v25 = objc_msgSend(v24, sel_hoverTextDisplayMode);

      swift_getKeyPath();
      MEMORY[0x270FA5388]();
      *(void *)&v33[-16] = v2;
      *(void *)&v33[-8] = v25;
      uint64_t v34 = v2;
      sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
      goto LABEL_13;
    case 9:
      id v26 = objc_msgSend(self, sel_sharedInstance);
      id v27 = objc_msgSend(v26, sel_hoverTextScrollingSpeed);

      swift_getKeyPath();
      MEMORY[0x270FA5388]();
      *(void *)&v33[-16] = v2;
      *(void *)&v33[-8] = v27;
      uint64_t v34 = v2;
      sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
LABEL_13:
      sub_2269B8490();
LABEL_27:
      swift_release();
      break;
    default:
      return;
  }
}

void sub_2269648A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2269B8550();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_sharedInstance);
  id v8 = objc_msgSend(v7, sel_hoverTextContentSize);

  sub_2269B8F30();
  if (v8) {

  }
  uint64_t v9 = (void *)sub_2269B8F00();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, v9);

  uint64_t v11 = self;
  uint64_t v12 = *MEMORY[0x263F83570];
  id v50 = v10;
  id v13 = objc_msgSend(v11, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, v12, v10);
  id v14 = objc_msgSend(v6, sel_sharedInstance);
  id v15 = objc_msgSend(v14, sel_hoverTextFontName);

  if (!v15) {
    goto LABEL_5;
  }
  sub_2269B8F30();

  objc_msgSend(v13, sel_pointSize);
  double v17 = v16;
  id v18 = (void *)sub_2269B8F00();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v11, sel_fontWithName_size_, v18, v17);

  if (!v19) {
LABEL_5:
  }
    id v19 = v13;
  id v49 = v13;
  uint64_t v20 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v20, v2);
  id v21 = v19;
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  id v24 = sub_2269B8540();
  id v25 = v5;
  os_log_type_t v26 = sub_2269B9130();
  if (os_log_type_enabled(v24, v26))
  {
    uint64_t v45 = v25;
    uint64_t v46 = v23;
    uint64_t v47 = v22;
    uint64_t v48 = v1;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v52 = v44;
    *(_DWORD *)uint64_t v27 = 136315906;
    id v28 = objc_msgSend(v6, sel_sharedInstance);
    id v29 = objc_msgSend(v28, sel_hoverTextContentSize);

    if (v29)
    {
      uint64_t v30 = sub_2269B8F30();
      unint64_t v32 = v31;
    }
    else
    {
      unint64_t v32 = 0xEB00000000646569;
      uint64_t v30 = 0x6669636570736E75;
    }
    uint64_t v51 = sub_22697609C(v30, v32, &v52);
    sub_2269B9290();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2048;
    objc_msgSend(v21, sel_pointSize);
    uint64_t v51 = v33;
    sub_2269B9290();

    *(_WORD *)(v27 + 22) = 2080;
    id v34 = objc_msgSend(v21, sel_fontName);
    uint64_t v35 = sub_2269B8F30();
    unint64_t v37 = v36;

    uint64_t v51 = sub_22697609C(v35, v37, &v52);
    sub_2269B9290();

    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 32) = 2080;
    id v38 = objc_msgSend(v21, sel_familyName);
    uint64_t v39 = sub_2269B8F30();
    unint64_t v41 = v40;

    uint64_t v51 = sub_22697609C(v39, v41, &v52);
    sub_2269B9290();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v24, v26, "Using font. ContentSize=%s PointSize=%f Name=%s Family=%s", (uint8_t *)v27, 0x2Au);
    uint64_t v42 = v44;
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v42, -1, -1);
    MEMORY[0x22A65DA10](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
    uint64_t v1 = v48;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  *(&v43 - 2) = v1;
  *(&v43 - 1) = (uint64_t)v21;
  uint64_t v52 = v1;
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B8490();

  swift_release();
}

uint64_t sub_226964F28()
{
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  swift_getKeyPath();
  sub_2269B84C0();
  swift_release();
  *(unsigned char *)(v0 + 145) = (*(unsigned char *)(v0 + 145) & 1) == 0;
  swift_getKeyPath();
  sub_2269B84B0();
  swift_release();
  sub_226963468();
  swift_getKeyPath();
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_2269650A8()
{
  return swift_release();
}

uint64_t sub_2269651F8()
{
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_226965320()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  uint64_t v2 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();

  uint64_t v3 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  uint64_t v4 = sub_2269B84E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(v3, v4);
}

uint64_t sub_226965428()
{
  sub_22697AA38();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  uint64_t v2 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();

  uint64_t v3 = v0 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  uint64_t v4 = sub_2269B84E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_226965544()
{
  sub_226965428();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_22696559C()
{
  return sub_2269613C4();
}

uint64_t sub_2269655C0()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible);
}

uint64_t sub_226965668()
{
  return sub_226965690();
}

uint64_t sub_22696567C()
{
  return sub_226965690();
}

uint64_t sub_226965690()
{
  return swift_retain();
}

uint64_t sub_226965738()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode);
}

double sub_2269657E0()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect);
}

uint64_t sub_226965890()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v0, sel_hoverTextDisplayMode);

  swift_getKeyPath();
  sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B8490();
  return swift_release();
}

void sub_226965990(char a1)
{
}

void sub_2269659B4(void (*a1)(char *, uint64_t))
{
}

uint64_t sub_2269659D8()
{
  return sub_226964F28();
}

uint64_t sub_2269659FC()
{
  return sub_2269650A8();
}

uint64_t sub_226965A20()
{
  return swift_release();
}

uint64_t sub_226965AFC()
{
  return swift_release();
}

uint64_t sub_226965BCC()
{
  return sub_2269651F8();
}

uint64_t sub_226965C04()
{
  uint64_t v0 = sub_2269B8550();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_2269B8530();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
    swift_retain_n();
    id v7 = sub_2269B8540();
    os_log_type_t v8 = sub_2269B9120();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v9 = 136315138;
      v14[1] = v9 + 4;
      swift_getKeyPath();
      uint64_t v16 = v5;
      sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
      sub_2269B84A0();
      swift_release();
      uint64_t v10 = *(void *)(v5 + 160);
      unint64_t v11 = *(void *)(v5 + 168);
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_22697609C(v10, v11, &v17);
      sub_2269B9290();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22695C000, v7, v8, "Store:%s - Idle timer fired. Hiding HoverText HUD", v9, 0xCu);
      uint64_t v12 = v15;
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v12, -1, -1);
      MEMORY[0x22A65DA10](v9, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    v14[-2] = v5;
    LOBYTE(v14[-1]) = 0;
    uint64_t v17 = v5;
    sub_226966F70(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
    sub_2269B8490();
    swift_release();
    return swift_release();
  }
  return result;
}

id variable initialization expression of HoverTextTimer.timer()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA20]);

  return objc_msgSend(v0, sel_init);
}

uint64_t variable initialization expression of HoverTextRootViewController.elementVisualUpdatedTimer()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextRootViewController.showStatusAlertForActivationLockDidChange()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.valueChangeEventType()
{
  return 12;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.displayText()
{
  return sub_2269B8250();
}

uint64_t variable initialization expression of HoverTextPresentationEvent.secondaryText()
{
  return 0;
}

double variable initialization expression of HoverTextPresentationEvent.anchorRect()
{
  return 0.0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.displayMode()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.selectedTextRange()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.paragraphIndex()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextPresentationEvent.axAttributedString()
{
  return 0;
}

double variable initialization expression of HoverTextMarqueeingContentView.feathering()
{
  return 12.0;
}

uint64_t variable initialization expression of HoverTextMarqueeingContentView._direction@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);

  return swift_storeEnumTagMultiPayload();
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

double variable initialization expression of HoverTextMarqueeingContentView._contentSize()
{
  return 0.0;
}

double variable initialization expression of HoverTextMarqueeingContentView._needsScrolling()
{
  return 0.0;
}

uint64_t variable initialization expression of HoverTextMarqueeingContentView._resetScrollingID()
{
  return 0;
}

id variable initialization expression of HoverTextCoordinator.axRuntimeClient()
{
  uint64_t v0 = sub_2269B8550();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  id v5 = objc_msgSend(self, sel_mainRunLoop);
  id v6 = objc_allocWithZone((Class)type metadata accessor for AXRuntimeClient());
  return AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)((uint64_t)v3, (uint64_t)&unk_26DA802C8, (uint64_t)v5);
}

id variable initialization expression of HoverTextCoordinator.eventHandler()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for HoverTextEventHandler());

  return objc_msgSend(v0, sel_init);
}

uint64_t variable initialization expression of HoverTextCoordinator.service()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextCoordinator.$__lazy_storage_$_displayManager()
{
  return 0;
}

unint64_t variable initialization expression of HoverTextCoordinator.externalViewControllers()
{
  return sub_226980DC4(MEMORY[0x263F8EE78]);
}

uint64_t variable initialization expression of HoverTextCoordinator.knownExternalDisplayScenes()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of HoverTextCoordinator.mainDisplayViewController()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextCoordinator.currentStatusAlertID()
{
  return 0;
}

uint64_t variable initialization expression of HoverTextCoordinator.isRunning()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.nativeFocusItemDidChange()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.valueChanged()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.elementVisualsUpdated()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.focusedApplicationsDidChange()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.didReceiveAnnouncement()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.keyboardWillHide()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.currentInputModeDidChange()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.keyboardWillChangeFrame()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.loupeStateChanged()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.updateTypingDisplayMode()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.didReceiveNotification()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient._isEnabled()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.axObserver()
{
  return 0;
}

uint64_t variable initialization expression of AXRuntimeClient.pasteOccurred()
{
  return 0;
}

uint64_t sub_226966360()
{
  return type metadata accessor for HoverTextStore();
}

uint64_t type metadata accessor for HoverTextStore()
{
  uint64_t result = qword_268148980;
  if (!qword_268148980) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2269663B4()
{
  uint64_t result = sub_2269B82E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2269B84E0();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

void type metadata accessor for AXEventKeyModifierState(uint64_t a1)
{
}

void type metadata accessor for AXSHoverTextPreferredActivatorKey(uint64_t a1)
{
}

void type metadata accessor for AXNotification(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for FocusChange(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2269665A8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2269665C8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for AXHoverTextDisplayMode(uint64_t a1)
{
}

void type metadata accessor for AXSHoverTextScrollingSpeed(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for AXError(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_2269666A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2269666C0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

BOOL sub_2269666FC(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_226966710@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_226966720(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22696672C()
{
  return sub_2269B8510();
}

uint64_t sub_226966778()
{
  return sub_2269B8500();
}

uint64_t sub_2269667D0()
{
  return sub_2269B95D0();
}

uint64_t sub_226966838(uint64_t a1, uint64_t a2)
{
  return sub_2269669A4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_226966850(uint64_t a1, id *a2)
{
  uint64_t result = sub_2269B8F10();
  *a2 = 0;
  return result;
}

uint64_t sub_2269668C8(uint64_t a1, id *a2)
{
  char v3 = sub_2269B8F20();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_226966948@<X0>(uint64_t *a1@<X8>)
{
  sub_2269B8F30();
  uint64_t v2 = sub_2269B8F00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22696698C(uint64_t a1, uint64_t a2)
{
  return sub_2269669A4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2269669A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2269B8F30();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2269669E8()
{
  sub_2269B8F30();
  sub_2269B8F50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_226966A3C()
{
  sub_2269B8F30();
  sub_2269B9580();
  sub_2269B8F50();
  uint64_t v0 = sub_2269B95D0();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_226966AB0(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_226966AB8@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_DWORD *sub_226966ACC@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_DWORD *sub_226966AE0@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_226966AF4(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_226966B24@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v3 == 0;
  return result;
}

int *sub_226966B50@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *v2 |= *result;
  int v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *sub_226966B74(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *sub_226966B88(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *sub_226966B9C(_DWORD *result)
{
  *v1 ^= *result;
  return result;
}

_DWORD *sub_226966BB0@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_226966BC4(_DWORD *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_226966BD8(_DWORD *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_226966BEC(_DWORD *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_226966C00()
{
  return *v0 == 0;
}

uint64_t sub_226966C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

_DWORD *sub_226966C28(_DWORD *result)
{
  *v1 &= ~*result;
  return result;
}

_DWORD *sub_226966C3C@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_226966C48()
{
  swift_getWitnessTable();

  return sub_2269B84F0();
}

uint64_t sub_226966CB4()
{
  uint64_t v0 = sub_2269B8F30();
  uint64_t v2 = v1;
  if (v0 == sub_2269B8F30() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2269B94F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_226966D40(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_226966D54@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3 = sub_22696725C(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_DWORD *sub_226966D94@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_226966DA4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_226966DB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2269B8F00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_226966DF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2269B8F30();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_226966E24(uint64_t a1)
{
  uint64_t v2 = sub_226966F70(&qword_268148B10, type metadata accessor for Key);
  uint64_t v3 = sub_226966F70(&qword_268148B18, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_226966EE0()
{
  return sub_226966F70(&qword_268148AC0, type metadata accessor for Key);
}

uint64_t sub_226966F28()
{
  return sub_226966F70(&qword_268148AC8, type metadata accessor for Key);
}

uint64_t sub_226966F70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226966FB8()
{
  return sub_226966F70(&qword_268148AD0, type metadata accessor for CFString);
}

uint64_t sub_226967000()
{
  return sub_226966F70(&qword_268148AD8, type metadata accessor for CFString);
}

uint64_t sub_226967048()
{
  return sub_226966F70(&qword_268148AE0, type metadata accessor for AXEventKeyModifierState);
}

uint64_t sub_226967090()
{
  return sub_226966F70(&qword_268148AE8, type metadata accessor for AXEventKeyModifierState);
}

uint64_t sub_2269670D8()
{
  return sub_226966F70(&qword_268148AF0, type metadata accessor for AXEventKeyModifierState);
}

uint64_t sub_226967120()
{
  return sub_226966F70(&qword_268148AF8, type metadata accessor for AXEventKeyModifierState);
}

uint64_t sub_226967168()
{
  return sub_226966F70(&qword_268148B00, type metadata accessor for Key);
}

void sub_2269671B0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 112) = *(unsigned char *)(v0 + 24);
}

__n128 sub_2269671C0()
{
  __n128 result = *(__n128 *)(v0 + 24);
  *(__n128 *)(*(void *)(v0 + 16) + 120) = result;
  return result;
}

void sub_2269671D0()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode) = *(void *)(v0 + 24);
}

__n128 sub_2269671E4()
{
  uint64_t v1 = *(void *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__anchorRect;
  __n128 result = *(__n128 *)(v0 + 24);
  long long v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)uint64_t v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_226967204()
{
  return sub_2269673FC(&OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__backgroundColor);
}

uint64_t sub_226967224()
{
  return sub_2269673FC(&OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__borderColor);
}

void sub_226967244()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__isVisible) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_22696725C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  long long v3 = (int *)(v2 + 32);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
    if ((v5 & ~result) == 0) {
      int v4 = 0;
    }
    __n128 result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

void sub_226967294()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 113) = *(unsigned char *)(v0 + 24);
}

void sub_2269672A4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 144) = *(unsigned char *)(v0 + 24);
}

void sub_2269672C4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 145) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2269672D4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 160) = v0[3];
  *(void *)(v1 + 168) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_22696731C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  long long v3 = *(void **)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont) = v2;
  id v4 = v2;
}

void sub_226967364()
{
  *(void *)(*(void *)(v0 + 16) + 152) = *(void *)(v0 + 24);
}

uint64_t sub_226967370(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_226967384(a1, a2);
  }
  return a1;
}

uint64_t sub_226967384(uint64_t a1, unint64_t a2)
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

uint64_t sub_2269673DC()
{
  return sub_2269673FC(&OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__textColor);
}

uint64_t sub_2269673FC(void *a1)
{
  *(void *)(*(void *)(v1 + 16) + *a1) = *(void *)(v1 + 24);
  swift_retain();
  return swift_release();
}

unint64_t sub_226967448()
{
  unint64_t result = qword_268148B30;
  if (!qword_268148B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148B30);
  }
  return result;
}

uint64_t sub_2269674A0()
{
  return 8;
}

uint64_t sub_2269674AC()
{
  return swift_release();
}

uint64_t sub_2269674B4(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_2269674C8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_2269674DC()
{
  unint64_t result = qword_268148B38;
  if (!qword_268148B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148B38);
  }
  return result;
}

uint64_t sub_226967534()
{
  return 8;
}

uint64_t sub_226967548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2269675AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226967608(uint64_t a1, unint64_t a2)
{
  if (a2 >= 4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22696761C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226967654()
{
  return sub_226965C04();
}

uint64_t sub_226967664()
{
  *(void *)(*(void *)(v0 + 16) + 136) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_2269676A0()
{
  return sub_226960880(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2269676BC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 96) = v0[3];
  *(void *)(v1 + 104) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2269676FC()
{
  return sub_226962154();
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

void type metadata accessor for AXUIElementRef(uint64_t a1)
{
}

void sub_226967730(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_226967778()
{
}

void sub_226967790()
{
}

double sub_2269677C4()
{
  *(void *)&double result = sub_2269671C0().n128_u64[0];
  return result;
}

void sub_2269677DC()
{
}

double sub_2269677F8()
{
  *(void *)&double result = sub_2269671E4().n128_u64[0];
  return result;
}

void sub_226967814()
{
}

void sub_22696782C()
{
}

uint64_t HoverTextTimer.deinit()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    if (objc_msgSend(v2, sel_isValid)) {
      objc_msgSend(v2, sel_invalidate);
    }
  }
  swift_release();
  return v0;
}

uint64_t HoverTextTimer.__deallocating_deinit()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    if (objc_msgSend(v2, sel_isValid)) {
      objc_msgSend(v2, sel_invalidate);
    }
  }
  swift_release();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for HoverTextTimer()
{
  return self;
}

uint64_t sub_226967948()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void (**)(uint64_t))(result + 24);
    swift_retain();
    uint64_t v2 = swift_release();
    v1(v2);
    return swift_release();
  }
  return result;
}

void sub_2269679C0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1 && (objc_msgSend(v1, sel_isValid) & 1) == 0)
  {
    double v2 = *(double *)(v0 + 40);
    if (v2 > 0.0)
    {
      long long v3 = self;
      uint64_t v4 = swift_allocObject();
      swift_weakInit();
      v8[4] = sub_226967C74;
      v8[5] = v4;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 1107296256;
      v8[2] = sub_22696BC4C;
      v8[3] = &block_descriptor_0;
      int v5 = _Block_copy(v8);
      swift_release();
      id v6 = objc_msgSend(v3, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v5, v2);
      _Block_release(v5);
      id v7 = *(void **)(v0 + 16);
      *(void *)(v0 + 16) = v6;
    }
  }
}

void sub_226967AF4()
{
  uint64_t v1 = sub_2269B8420();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v5 = *(void **)(v0 + 16);
  if (v5)
  {
    id v6 = v5;
    if (objc_msgSend(v6, sel_isValid))
    {
      id v7 = objc_msgSend(v6, sel_fireDate);
      sub_2269B8400();

      sub_2269B83F0();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    else
    {
    }
  }
}

uint64_t sub_226967C3C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226967C74()
{
  return sub_226967948();
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

uint64_t sub_226967C94(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA20]), sel_init);
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  id v7 = self;
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  v13[4] = sub_226967C74;
  v13[5] = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_22696BC4C;
  v13[3] = &block_descriptor_15;
  uint64_t v9 = _Block_copy(v13);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v9, a3);
  _Block_release(v9);
  unint64_t v11 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v10;

  return v3;
}

uint64_t sub_226967DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v40 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v53 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v16 = sub_2269B82E0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v55 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v39 = (char *)&v38 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v38 - v22;
  swift_bridgeObjectRetain();
  uint64_t v45 = v23;
  sub_2269B8250();
  uint64_t v54 = a3;
  sub_2269B82D0();
  unint64_t v24 = *(void *)(a2 + 16);
  uint64_t v43 = v17 + 48;
  uint64_t v44 = v17 + 16;
  id v25 = (void (**)(char *, char *, uint64_t))(v17 + 32);
  uint64_t v51 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v46 = a2;
  unint64_t v47 = v24 - 1;
  id v49 = (uint64_t (**)(char *, uint64_t))(v17 + 8);
  id v50 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v42 = 0;
  unint64_t v27 = 0;
  unint64_t v48 = v24;
  uint64_t v38 = v17;
  while (1)
  {
    if (v27 == v24)
    {
      (*v52)(v10, 1, 1, v16);
      unint64_t v27 = v24;
LABEL_7:
      sub_226968530((uint64_t)v10);
      uint64_t v28 = 1;
      goto LABEL_10;
    }
    if (v27 >= v24) {
      break;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v10, v46+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(void *)(v17 + 72) * v27++, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v10, 0, 1, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16) == 1) {
      goto LABEL_7;
    }
    unint64_t v41 = v27;
    id v29 = v53;
    uint64_t v30 = *v25;
    unint64_t v31 = v39;
    (*v25)(v39, v10, v16);
    unint64_t v32 = v25;
    uint64_t v33 = &v40[*(int *)(v5 + 48)];
    uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v30)(v33, v31, v16);
    uint64_t v34 = v42 + 1;
    if (__OFADD__(v42, 1)) {
      goto LABEL_15;
    }
    uint64_t v35 = (char *)v29 + *(int *)(v5 + 48);
    *id v29 = v42;
    v30(v35, v33, v16);
    uint64_t v28 = 0;
    uint64_t v42 = v34;
    uint64_t v17 = v38;
    id v25 = v32;
    unint64_t v27 = v41;
LABEL_10:
    uint64_t v36 = (uint64_t)v53;
    (*v51)(v53, v28, 1, v5);
    sub_226968590(v36, (uint64_t)v15);
    if ((*v50)(v15, 1, v5) == 1)
    {
      swift_bridgeObjectRelease();
      return (*v49)(v45, v16);
    }
    uint64_t v37 = *(void *)v15;
    (*v25)(v55, &v15[*(int *)(v5 + 48)], v16);
    sub_2269685F8();
    sub_2269B82A0();
    if (v37 != v47) {
      sub_2269B82A0();
    }
    uint64_t result = (*v49)(v55, v16);
    unint64_t v24 = v48;
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

void sub_226968324(void *a1)
{
  uint64_t v3 = sub_2269B82E0();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  uint64_t v6 = sub_2269B8A30();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  id v11 = a1;
  sub_2269B8980();
  uint64_t v12 = sub_2269B89D0();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  swift_release();
  sub_226968520(v6, v8, v10);
  swift_bridgeObjectRelease();
  v25[1] = v12;
  v25[2] = v14;
  char v26 = v16 & 1;
  uint64_t v27 = v18;
  id v19 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268148BB0));
  uint64_t v20 = (void *)sub_2269B88B0();
  id v21 = objc_msgSend(v20, sel_view);
  if (v21)
  {
    uint64_t v22 = v21;
    objc_msgSend(v21, sel_setNeedsLayout);

    id v23 = objc_msgSend(v20, sel_view);
    if (v23)
    {
      unint64_t v24 = v23;
      objc_msgSend(v23, sel_layoutIfNeeded);

      sub_2269B88A0();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_226968520(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_226968530(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226968590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2269685F8()
{
  unint64_t result = qword_268148BD0;
  if (!qword_268148BD0)
  {
    sub_2269B82E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148BD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTypingHUDView()
{
  return &type metadata for HoverTypingHUDView;
}

uint64_t sub_226968660()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22696867C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BD8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BE0);
  uint64_t v6 = MEMORY[0x270FA5388](v43);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v39 - v9;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BE8);
  MEMORY[0x270FA5388](v40);
  uint64_t v42 = (uint64_t)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BF0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BF8);
  uint64_t v15 = MEMORY[0x270FA5388](v41);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v39 - v18;
  swift_getKeyPath();
  *(void *)&long long v45 = a1;
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  if (*(unsigned char *)(a1 + 144) == 1)
  {
    *(void *)uint64_t v14 = sub_2269B8830();
    *((void *)v14 + 1) = 0;
    v14[16] = 1;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C88);
    sub_22696A6E8(a1, (uint64_t)&v14[*(int *)(v20 + 44)]);
    id v21 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v21, sel_bounds);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    v48.origin.x = UIEdgeInsetsInsetRect(v23, v25, v27, v29, *(double *)(a1 + 32), *(double *)(a1 + 40));
    CGRectGetWidth(v48);
    swift_getKeyPath();
    *(void *)&long long v45 = a1;
    sub_2269B84A0();
    swift_release();
    uint64_t v30 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    CTFontGetAscent(v30);
    CTFontGetDescent(v30);
    CTFontGetLeading(v30);

    sub_2269B8D50();
    sub_2269B8690();
    sub_22696B88C((uint64_t)v14, (uint64_t)v17, &qword_268148BF0);
    unint64_t v31 = &v17[*(int *)(v41 + 36)];
    long long v32 = v46;
    *(_OWORD *)unint64_t v31 = v45;
    *((_OWORD *)v31 + 1) = v32;
    *((_OWORD *)v31 + 2) = v47;
    sub_22696B8F0((uint64_t)v14, &qword_268148BF0);
    sub_22696B7FC((uint64_t)v17, (uint64_t)v19, &qword_268148BF8);
    sub_22696B88C((uint64_t)v19, v42, &qword_268148BF8);
    swift_storeEnumTagMultiPayload();
    sub_22696B650(&qword_268148C08, &qword_268148BF8, &qword_268148C10, &qword_268148BF0);
    sub_22696BA60(&qword_268148C18, &qword_268148BE0, (void (*)(void))sub_22696B474);
    sub_2269B88E0();
    uint64_t v33 = (uint64_t)v19;
    uint64_t v34 = &qword_268148BF8;
  }
  else
  {
    sub_226968CA0((double *)a1, (uint64_t)v5);
    swift_getKeyPath();
    *(void *)&long long v45 = a1;
    sub_2269B84A0();
    swift_release();
    uint64_t v35 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    CTFontGetAscent(v35);
    CTFontGetDescent(v35);
    CTFontGetLeading(v35);

    sub_2269B8D50();
    sub_2269B8690();
    sub_22696B88C((uint64_t)v5, (uint64_t)v8, &qword_268148BD8);
    uint64_t v36 = &v8[*(int *)(v43 + 36)];
    long long v37 = v46;
    *(_OWORD *)uint64_t v36 = v45;
    *((_OWORD *)v36 + 1) = v37;
    *((_OWORD *)v36 + 2) = v47;
    sub_22696B8F0((uint64_t)v5, &qword_268148BD8);
    sub_22696B7FC((uint64_t)v8, (uint64_t)v10, &qword_268148BE0);
    sub_22696B88C((uint64_t)v10, v42, &qword_268148BE0);
    swift_storeEnumTagMultiPayload();
    sub_22696B650(&qword_268148C08, &qword_268148BF8, &qword_268148C10, &qword_268148BF0);
    sub_22696BA60(&qword_268148C18, &qword_268148BE0, (void (*)(void))sub_22696B474);
    sub_2269B88E0();
    uint64_t v33 = (uint64_t)v10;
    uint64_t v34 = &qword_268148BE0;
  }
  return sub_22696B8F0(v33, v34);
}

uint64_t sub_226968CA0@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  v32[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C60);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C50);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C40);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_2269B8830();
  *((void *)v5 + 1) = 0;
  v5[16] = 0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148D00);
  sub_226968FC4(a1, &v5[*(int *)(v14 + 44)]);
  id v15 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v15, sel_bounds);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v36.origin.x = UIEdgeInsetsInsetRect(v17, v19, v21, v23, a1[4], a1[5]);
  CGRectGetWidth(v36);
  sub_226969A24((uint64_t)a1);
  sub_2269B8690();
  sub_22696B88C((uint64_t)v5, (uint64_t)v9, &qword_268148C60);
  double v24 = &v9[*(int *)(v7 + 44)];
  long long v25 = v34;
  *(_OWORD *)double v24 = v33;
  *((_OWORD *)v24 + 1) = v25;
  *((_OWORD *)v24 + 2) = v35;
  sub_22696B8F0((uint64_t)v5, &qword_268148C60);
  uint64_t v26 = sub_2269B8D50();
  uint64_t v28 = v27;
  swift_getKeyPath();
  v32[1] = (uint64_t)a1;
  sub_22696AF4C();
  swift_retain();
  sub_2269B84A0();
  swift_release();
  if (a1[17] == 0.0) {
    double v29 = 1.0;
  }
  else {
    double v29 = 0.0;
  }
  sub_22696B88C((uint64_t)v9, (uint64_t)v13, &qword_268148C50);
  uint64_t v30 = &v13[*(int *)(v11 + 44)];
  *(void *)uint64_t v30 = a1;
  *((double *)v30 + 1) = v29;
  *((void *)v30 + 2) = v26;
  *((void *)v30 + 3) = v28;
  sub_22696B8F0((uint64_t)v9, &qword_268148C50);
  sub_22696A4B8((uint64_t (*)(uint64_t))sub_22696B87C, (uint64_t)sub_22696B884, v32[0]);
  return sub_22696B8F0((uint64_t)v13, &qword_268148C40);
}

uint64_t sub_226968FC4@<X0>(double *a1@<X0>, void *a2@<X8>)
{
  uint64_t v99 = a2;
  uint64_t v94 = sub_2269B8900();
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  v92 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148D20);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v96 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int v91 = (char *)&v77 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v77 - v10;
  uint64_t v12 = sub_2269B82E0();
  uint64_t v102 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  id v15 = (char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v103 = (uint64_t)a1;
  unint64_t v101 = sub_22696AF4C();
  uint64_t v100 = v15;
  sub_2269B84A0();
  swift_release();
  uint64_t v88 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL;
  BOOL v16 = *((unsigned char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) == 1;
  uint64_t v98 = v4;
  uint64_t v97 = v5;
  uint64_t v95 = v11;
  if (!v16) {
    goto LABEL_5;
  }
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  double v17 = (char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  uint64_t v18 = v102;
  (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v14, v17, v12);
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  id v19 = *(id *)((char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_226968324(v19);
  double v21 = v20;

  (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v12);
  double v22 = v21 + 2.0;
  id v23 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v23, sel_bounds);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v125.origin.x = UIEdgeInsetsInsetRect(v25, v27, v29, v31, a1[4], a1[5]);
  if (v22 < CGRectGetWidth(v125) * 0.85)
  {
    int v90 = 0;
    long long v32 = &v117;
  }
  else
  {
LABEL_5:
    int v89 = 0;
    long long v32 = &v118;
  }
  *((_DWORD *)v32 - 64) = 1;
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  long long v33 = (char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  long long v34 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
  os_log_type_t v83 = v33;
  uint64_t v82 = v102 + 16;
  id v81 = v34;
  v34(v14, v33, v12);
  uint64_t v86 = sub_2269B8A30();
  uint64_t v85 = v35;
  int v84 = v36;
  uint64_t v87 = v37;
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  if (a1[17] == 0.0) {
    double v38 = 1.0;
  }
  else {
    double v38 = 0.0;
  }
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  uint64_t v80 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  uint64_t v39 = (const __CTFont *)*(id *)((char *)a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  CTFontGetAscent(v39);
  CTFontGetDescent(v39);
  CTFontGetLeading(v39);

  sub_2269B8D50();
  v79 = v14;
  sub_2269B8690();
  uint64_t v40 = v119;
  uint64_t v78 = v12;
  char v41 = v120;
  uint64_t v42 = v121;
  char v43 = v122;
  uint64_t v44 = v123;
  uint64_t v45 = v124;
  sub_22699964C();
  uint64_t v103 = v86;
  uint64_t v104 = v85;
  char v105 = v84 & 1;
  uint64_t v106 = v87;
  double v107 = v38;
  uint64_t v108 = v40;
  char v109 = v41;
  uint64_t v110 = v42;
  char v111 = v43;
  uint64_t v112 = v44;
  uint64_t v113 = v45;
  __int16 v114 = 1;
  uint64_t v115 = v46;
  uint64_t v116 = 0;
  long long v47 = v92;
  sub_2269B8920();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148D28);
  sub_22696BA60(&qword_268148D30, &qword_268148D28, (void (*)(void))sub_22696BA30);
  CGRect v48 = v91;
  uint64_t v49 = v94;
  sub_2269B8A70();
  swift_release();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v47, v49);
  sub_226968520(v103, v104, v105);
  swift_bridgeObjectRelease();
  uint64_t v50 = v97;
  uint64_t v51 = v95;
  uint64_t v52 = v98;
  (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v95, v48, v98);
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  if (*((unsigned char *)a1 + v88)) {
    goto LABEL_12;
  }
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  uint64_t v53 = v79;
  uint64_t v54 = v78;
  v81(v79, v83, v78);
  swift_getKeyPath();
  uint64_t v103 = (uint64_t)a1;
  sub_2269B84A0();
  swift_release();
  id v55 = *(id *)((char *)a1 + v80);
  sub_226968324(v55);
  double v57 = v56;

  (*(void (**)(char *, uint64_t))(v102 + 8))(v53, v54);
  double v58 = v57 + 2.0;
  id v59 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v59, sel_bounds);
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;

  v126.origin.x = UIEdgeInsetsInsetRect(v61, v63, v65, v67, a1[4], a1[5]);
  if (v58 >= CGRectGetWidth(v126) * 0.85)
  {
LABEL_12:
    char v69 = 0;
    char v68 = 1;
  }
  else
  {
    char v68 = 0;
    char v69 = 1;
  }
  uint64_t v70 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  uint64_t v71 = v96;
  v70(v96, v51, v52);
  uint64_t v72 = v99;
  *uint64_t v99 = 0;
  *((unsigned char *)v72 + 8) = v89;
  *((unsigned char *)v72 + 9) = v90;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148D68);
  v70((char *)v72 + *(int *)(v73 + 48), v71, v52);
  v74 = (char *)v72 + *(int *)(v73 + 64);
  *(void *)v74 = 0;
  v74[8] = v69;
  v74[9] = v68;
  uint64_t v75 = *(void (**)(char *, uint64_t))(v50 + 8);
  v75(v51, v52);
  return ((uint64_t (*)(char *, uint64_t))v75)(v71, v52);
}

uint64_t sub_226969A24(uint64_t a1)
{
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v22[1] = a1;
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  uint64_t v6 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_getKeyPath();
  v22[0] = a1;
  sub_2269B84A0();
  swift_release();
  id v7 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_226968324(v7);
  double v9 = v8;

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  CGFloat v10 = v9 + 2.0;
  id v11 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v11, sel_bounds);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v23.origin.x = UIEdgeInsetsInsetRect(v13, v15, v17, v19, *(double *)(a1 + 32), *(double *)(a1 + 40));
  CGFloat v20 = CGRectGetWidth(v23) * 0.85;
  swift_getKeyPath();
  if (v20 <= v10)
  {
    v22[0] = a1;
    sub_2269B84A0();
    swift_release();
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) == 1) {
      return sub_2269B8D60();
    }
  }
  else
  {
    v22[0] = a1;
    sub_2269B84A0();
    swift_release();
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) != 1) {
      return sub_2269B8D60();
    }
  }
  return sub_2269B8D70();
}

BOOL sub_226969CEC(uint64_t a1)
{
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v21[1] = a1;
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  uint64_t v6 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_getKeyPath();
  v21[0] = a1;
  sub_2269B84A0();
  swift_release();
  id v7 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_226968324(v7);
  double v9 = v8;

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  double v10 = v9 + 2.0;
  id v11 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v11, sel_bounds);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v22.origin.x = UIEdgeInsetsInsetRect(v13, v15, v17, v19, *(double *)(a1 + 32), *(double *)(a1 + 40));
  return CGRectGetWidth(v22) * 0.85 <= v10;
}

__n128 sub_226969F28@<Q0>(uint64_t a1@<X0>, double a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2269B8D50();
  uint64_t v8 = v7;
  sub_226969FD4(a2, (uint64_t)v15);
  __n128 v13 = (__n128)v15[1];
  long long v14 = v15[0];
  uint64_t v9 = v16;
  char v10 = v17;
  sub_22696B88C(a1, a3, &qword_268148C40);
  uint64_t v11 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268148C30) + 36);
  *(void *)uint64_t v11 = v6;
  *(void *)(v11 + 8) = v8;
  __n128 result = v13;
  *(_OWORD *)(v11 + 16) = v14;
  *(__n128 *)(v11 + 32) = v13;
  *(void *)(v11 + 48) = v9;
  *(unsigned char *)(v11 + 56) = v10;
  return result;
}

double sub_226969FD4@<D0>(double a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  *(double *)&long long v7 = a1;
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  char v4 = *(unsigned char *)(*(void *)&a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL);
  uint64_t v5 = sub_22696A168(*(uint64_t *)&a1);
  if (v4)
  {
    sub_2269B8E30();
    sub_2269B8E20();
  }
  else
  {
    sub_2269B8E20();
    sub_2269B8E30();
  }
  MEMORY[0x22A65C700](v5);
  sub_2269B8770();
  sub_22696B954();
  sub_2269B88E0();
  double result = a1;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v9;
  *(unsigned char *)(a2 + 40) = v10;
  return result;
}

uint64_t sub_22696A168(uint64_t a1)
{
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148D18);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2269BAFA0;
  *(void *)(v6 + 32) = sub_2269B8B80();
  *(void *)(v6 + 40) = sub_2269B8B70();
  *(void *)(v6 + 48) = sub_2269B8B70();
  *(void *)(v6 + 56) = sub_2269B8B70();
  *(void *)(v6 + 64) = sub_2269B8B70();
  *(void *)(v6 + 72) = sub_2269B8B70();
  *(void *)(v6 + 80) = sub_2269B8B70();
  *(void *)(v6 + 88) = sub_2269B8B70();
  *(void *)(v6 + 96) = sub_2269B8B70();
  *(void *)(v6 + 104) = sub_2269B8B70();
  uint64_t v26 = v6;
  sub_2269B9030();
  uint64_t v27 = v26;
  sub_22699964C();
  if (v7 == 0.0) {
    goto LABEL_4;
  }
  sub_2269B8B80();
  MEMORY[0x22A65C9B0]();
  if (*(void *)(v27 + 16) >= *(void *)(v27 + 24) >> 1) {
    goto LABEL_9;
  }
  while (1)
  {
    sub_2269B9050();
    sub_2269B9030();
LABEL_4:
    swift_getKeyPath();
    uint64_t v26 = a1;
    sub_22696AF4C();
    sub_2269B84A0();
    swift_release();
    uint64_t v8 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    swift_getKeyPath();
    v25[1] = a1;
    sub_2269B84A0();
    swift_release();
    id v9 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_226968324(v9);
    double v11 = v10;

    double v12 = *(void (**)(char *, uint64_t))(v3 + 8);
    v3 += 8;
    v12(v5, v2);
    sub_22699964C();
    double v14 = v11 + 2.0 - v13;
    id v15 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v15, sel_bounds);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    v28.origin.x = UIEdgeInsetsInsetRect(v17, v19, v21, v23, *(double *)(a1 + 32), *(double *)(a1 + 40));
    if (v14 > CGRectGetWidth(v28) * 0.85) {
      break;
    }
    if (*(void *)(v27 + 16))
    {
      sub_22698FC00(0, 1);
      return v27;
    }
    __break(1u);
LABEL_9:
    sub_2269B9040();
  }
  return v27;
}

uint64_t sub_22696A4B8@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[0] = a2;
  v19[1] = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C40);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148D08);
  MEMORY[0x270FA5388](v9);
  double v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C30);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  id v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1(v13))
  {
    ((void (*)(uint64_t))v19[0])(v3);
    double v16 = &qword_268148C30;
    sub_22696B88C((uint64_t)v15, (uint64_t)v11, &qword_268148C30);
    swift_storeEnumTagMultiPayload();
    sub_22696B4F0();
    sub_22696B590();
    sub_2269B88E0();
    uint64_t v17 = (uint64_t)v15;
  }
  else
  {
    double v16 = &qword_268148C40;
    sub_22696B88C(v4, (uint64_t)v8, &qword_268148C40);
    sub_22696B88C((uint64_t)v8, (uint64_t)v11, &qword_268148C40);
    swift_storeEnumTagMultiPayload();
    sub_22696B4F0();
    sub_22696B590();
    sub_2269B88E0();
    uint64_t v17 = (uint64_t)v8;
  }
  return sub_22696B8F0(v17, v16);
}

uint64_t sub_22696A6E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C90);
  MEMORY[0x270FA5388](v49);
  uint64_t v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148C98);
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148CA0);
  MEMORY[0x270FA5388](v46);
  uint64_t v42 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148CA8);
  MEMORY[0x270FA5388](v7 - 8);
  CGRect v48 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B8780();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148CB0);
  uint64_t v43 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  double v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v44 = (char *)&v41 - v17;
  swift_getKeyPath();
  uint64_t v51 = a1;
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  if (*(double *)(a1 + 136) < 0.0)
  {
    uint64_t v18 = sub_2269B8BD0();
    swift_getKeyPath();
    uint64_t v51 = a1;
    sub_2269B84A0();
    swift_release();
    uint64_t v19 = *(void *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
    uint64_t v51 = v18;
    uint64_t v52 = v19;
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F18D28], v9);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148CC0);
    sub_22696B718();
    sub_2269B8AA0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
    swift_release();
    uint64_t v20 = v43;
    double v21 = v44;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v44, v16, v13);
    double v22 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    v22(v16, v21, v13);
    uint64_t v23 = (uint64_t)v42;
    *(void *)uint64_t v42 = 0;
    *(unsigned char *)(v23 + 8) = 1;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148CF8);
    v22((char *)(v23 + *(int *)(v24 + 48)), v16, v13);
    double v25 = *(void (**)(char *, uint64_t))(v20 + 8);
    v25(v16, v13);
    sub_22696B88C(v23, v47, &qword_268148CA0);
    swift_storeEnumTagMultiPayload();
    sub_22696B7B8(&qword_268148CE8, &qword_268148CA0);
    sub_22696B7B8(&qword_268148CF0, &qword_268148C90);
    uint64_t v26 = (uint64_t)v48;
    sub_2269B88E0();
    sub_22696B8F0(v23, &qword_268148CA0);
    v25(v21, v13);
LABEL_5:
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148CB8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v26, 0, 1, v38);
    return sub_22696B7FC(v26, v50, &qword_268148CA8);
  }
  uint64_t v41 = v10;
  uint64_t v42 = v4;
  swift_getKeyPath();
  uint64_t v51 = a1;
  sub_2269B84A0();
  swift_release();
  if (*(double *)(a1 + 136) > 0.0)
  {
    uint64_t v27 = sub_2269B8BD0();
    swift_getKeyPath();
    uint64_t v51 = a1;
    sub_2269B84A0();
    swift_release();
    uint64_t v28 = *(void *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
    uint64_t v51 = v27;
    uint64_t v52 = v28;
    uint64_t v29 = v41;
    (*(void (**)(char *, void, uint64_t))(v41 + 104))(v12, *MEMORY[0x263F18D28], v9);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148CC0);
    sub_22696B718();
    double v30 = v16;
    sub_2269B8AA0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v9);
    swift_release();
    swift_release();
    uint64_t v31 = v43;
    long long v32 = v44;
    uint64_t v33 = v13;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v44, v30, v13);
    long long v34 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v34(v30, v32, v13);
    uint64_t v35 = (uint64_t)v42;
    v34(v42, v30, v33);
    uint64_t v36 = v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268148CE0) + 48);
    *(void *)uint64_t v36 = 0;
    *(unsigned char *)(v36 + 8) = 1;
    uint64_t v37 = *(void (**)(char *, uint64_t))(v31 + 8);
    v37(v30, v33);
    sub_22696B88C(v35, v47, &qword_268148C90);
    swift_storeEnumTagMultiPayload();
    sub_22696B7B8(&qword_268148CE8, &qword_268148CA0);
    sub_22696B7B8(&qword_268148CF0, &qword_268148C90);
    uint64_t v26 = (uint64_t)v48;
    sub_2269B88E0();
    sub_22696B8F0(v35, &qword_268148C90);
    v37(v32, v33);
    goto LABEL_5;
  }
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148CB8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v50, 1, 1, v40);
}

uint64_t sub_22696AF20()
{
  return sub_2269B8A90();
}

uint64_t sub_22696AF3C@<X0>(uint64_t a1@<X8>)
{
  return sub_22696867C(*v1, a1);
}

unint64_t sub_22696AF4C()
{
  unint64_t result = qword_268148C00;
  if (!qword_268148C00)
  {
    type metadata accessor for HoverTypingStore();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148C00);
  }
  return result;
}

uint64_t sub_22696AFA4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22696AF4C();
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL);
  return result;
}

uint64_t sub_22696B024()
{
  return swift_release();
}

uint64_t sub_22696B0C4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  uint64_t v5 = sub_2269B82E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_22696B190(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_2269B82E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2;
  swift_getKeyPath();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  uint64_t v13 = v8;
  sub_22696AF4C();
  sub_2269B8490();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_22696B2E8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22696AF4C();
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  *a2 = v4;

  return v4;
}

void sub_22696B37C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_22696AF4C();
  id v2 = v1;
  sub_2269B8490();
  swift_release();
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

unint64_t sub_22696B474()
{
  unint64_t result = qword_268148C20;
  if (!qword_268148C20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148BD8);
    sub_22696B4F0();
    sub_22696B590();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148C20);
  }
  return result;
}

unint64_t sub_22696B4F0()
{
  unint64_t result = qword_268148C28;
  if (!qword_268148C28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148C30);
    sub_22696B590();
    sub_22696B7B8(&qword_268148C78, &qword_268148C80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148C28);
  }
  return result;
}

unint64_t sub_22696B590()
{
  unint64_t result = qword_268148C38;
  if (!qword_268148C38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148C40);
    sub_22696B650(&qword_268148C48, &qword_268148C50, &qword_268148C58, &qword_268148C60);
    sub_22696B7B8(&qword_268148C68, &qword_268148C70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148C38);
  }
  return result;
}

uint64_t sub_22696B650(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_22696B7B8(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

unint64_t sub_22696B718()
{
  unint64_t result = qword_268148CC8;
  if (!qword_268148CC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148CC0);
    sub_22696B7B8(&qword_268148CD0, &qword_268148CD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148CC8);
  }
  return result;
}

uint64_t sub_22696B7B8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22696B7FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_22696B860()
{
  sub_22699EB24(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

BOOL sub_22696B87C()
{
  return sub_226969CEC(v0);
}

double sub_22696B884@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_226969F28(a1, v2, a2).n128_u64[0];
  return result;
}

uint64_t sub_22696B88C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22696B8F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_22696B954()
{
  unint64_t result = qword_268148D10;
  if (!qword_268148D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148D10);
  }
  return result;
}

uint64_t sub_22696B9B0()
{
  return sub_22699E9D0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22696B9CC()
{
  return sub_22699E248(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_22696B9EC(double a1)
{
  double v2 = sub_2269997A4();

  sub_226999E2C(1, 0, a1, v2);
}

uint64_t sub_22696BA30()
{
  return sub_22696BA60(&qword_268148D38, &qword_268148D40, (void (*)(void))sub_22696BADC);
}

uint64_t sub_22696BA60(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_22696BADC()
{
  return sub_22696BA60(&qword_268148D48, &qword_268148D50, (void (*)(void))sub_22696BB0C);
}

unint64_t sub_22696BB0C()
{
  unint64_t result = qword_268148D58;
  if (!qword_268148D58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148D60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148D58);
  }
  return result;
}

unint64_t sub_22696BB84()
{
  unint64_t result = qword_268148D70;
  if (!qword_268148D70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148D78);
    sub_22696B650(&qword_268148C08, &qword_268148BF8, &qword_268148C10, &qword_268148BF0);
    sub_22696BA60(&qword_268148C18, &qword_268148BE0, (void (*)(void))sub_22696B474);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148D70);
  }
  return result;
}

void sub_22696BC4C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22696BCB4(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = v3;
  *(void *)&v4[qword_268148D90] = 0;
  uint64_t v7 = &v4[direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = (uint64_t *)&v4[qword_268148D98];
  uint64_t *v8 = a1;
  v8[1] = a2;
  if (a3)
  {
    type metadata accessor for HoverTextStore();
    swift_allocObject();
    uint64_t v12 = v4;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_226961600(a1, a2);
    uint64_t v11 = &off_26DA806F0;
  }
  else
  {
    type metadata accessor for HoverTypingStore();
    swift_allocObject();
    uint64_t v9 = v4;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_22699F1A0(a1, a2);
    uint64_t v11 = &off_26DA81868;
  }
  uint64_t v13 = (uint64_t *)&v4[qword_268148D80];
  *uint64_t v13 = v10;
  v13[1] = (uint64_t)v11;

  return sub_2269B88B0();
}

void sub_22696BDB8(char *a1, uint64_t a2, void *a3)
{
  *(void *)&a1[qword_268148D90] = 0;
  id v4 = &a1[direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange];
  *(void *)id v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  sub_2269B9440();
  __break(1u);
}

Swift::Void __swiftcall HoverTextRootViewController.startHoverText()()
{
  uint64_t v1 = type metadata accessor for HoverTextPresentationEvent();
  double v2 = (int *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + qword_268148D80 + 8);
  uint64_t v6 = **(void **)(v0 + qword_268148D80);
  v11[1] = *(void *)(v0 + qword_268148D80);
  v4[50] = 12;
  swift_retain();
  sub_2269B8250();
  uint64_t v7 = &v4[v2[10]];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v4[v2[11]];
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  uint64_t v9 = &v4[v2[12]];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = &v4[v2[13]];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  *(void *)&v4[v2[14]] = 0;
  *(void *)&v4[v2[15]] = 0;
  *(void *)id v4 = 2;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *((void *)v4 + 5) = 0;
  *((_WORD *)v4 + 24) = 352;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 280))(v4, v6, v5);
  sub_2269675AC((uint64_t)v4);
  swift_release();
}

Swift::Void __swiftcall HoverTextRootViewController.showAlert(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v5 = (int *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + qword_268148D80 + 8);
  uint64_t v9 = **(void **)(v1 + qword_268148D80);
  v14[1] = *(void *)(v1 + qword_268148D80);
  v7[50] = 12;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2269B8250();
  uint64_t v10 = &v7[v5[10]];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v7[v5[11]];
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  uint64_t v12 = &v7[v5[12]];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = &v7[v5[13]];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  *(void *)&v7[v5[14]] = 0;
  *(void *)&v7[v5[15]] = 0;
  *(void *)uint64_t v7 = countAndFlagsBits;
  *((void *)v7 + 1) = object;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_WORD *)v7 + 24) = 288;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 280))(v7, v9, v8);
  sub_2269675AC((uint64_t)v7);
  swift_release();
}

uint64_t HoverTextRootViewController.showStatusAlertForActivationLockDidChange.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_22696C19C(*v1);
  return v2;
}

uint64_t sub_22696C19C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t HoverTextRootViewController.showStatusAlertForActivationLockDidChange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_22696C20C(v6);
}

uint64_t sub_22696C20C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*HoverTextRootViewController.showStatusAlertForActivationLockDidChange.modify())()
{
  return j__swift_endAccess;
}

Swift::Void __swiftcall HoverTextRootViewController.handleElementVisualsUpdated()()
{
  uint64_t v1 = qword_268148D90;
  objc_msgSend(*(id *)(v0 + qword_268148D90), sel_invalidate);
  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_22696C580;
  v7[5] = v3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_22696BC4C;
  v7[3] = &block_descriptor_1;
  uint64_t v4 = _Block_copy(v7);
  swift_release();
  id v5 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v4, 0.2);
  _Block_release(v4);
  uint64_t v6 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = v5;
}

uint64_t sub_22696C3A0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22696C3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)type metadata accessor for HoverTextPresentationEvent();
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A65DAD0](a2 + 16);
  if (result)
  {
    uint64_t v7 = (void *)result;
    uint64_t v9 = *(void **)(result + qword_268148D80);
    uint64_t v8 = *(void *)(result + qword_268148D80 + 8);
    swift_retain();

    uint64_t v10 = *v9;
    uint64_t v15 = v9;
    v5[50] = 12;
    sub_2269B8250();
    uint64_t v11 = &v5[v3[8]];
    *(void *)uint64_t v11 = 0;
    *((void *)v11 + 1) = 0;
    uint64_t v12 = &v5[v3[9]];
    *(_OWORD *)uint64_t v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    uint64_t v13 = &v5[v3[10]];
    *(void *)uint64_t v13 = 0;
    v13[8] = 1;
    uint64_t v14 = &v5[v3[11]];
    *(void *)uint64_t v14 = 0;
    *((void *)v14 + 1) = 0;
    *(void *)&v5[v3[12]] = 0;
    *(void *)&v5[v3[13]] = 0;
    *(void *)id v5 = 1;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *((void *)v5 + 5) = 0;
    *((_WORD *)v5 + 24) = 352;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 280))(v5, v10, v8);
    sub_2269675AC((uint64_t)v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_22696C580(uint64_t a1)
{
  return sub_22696C3D8(a1, v1);
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

unint64_t HoverTextRootViewController.windowDisplayID.getter()
{
  id v1 = objc_msgSend(v0, sel_viewIfLoaded);
  if (v1 && (v2 = v1, id v3 = objc_msgSend(v1, sel_window), v2, v3))
  {
    unsigned int v4 = HTDisplayIDForWindow(v3);

    unsigned __int8 v5 = 0;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned __int8 v5 = 1;
  }
  return v6 | ((unint64_t)v5 << 32);
}

id HoverTextRootViewController.viewWillTransition(to:with:)(void *a1, double a2, double a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  aBlock[4] = sub_22696C7F4;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22696C7FC;
  aBlock[3] = &block_descriptor_6;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = v3;
  swift_release();
  objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v8, 0);
  _Block_release(v8);
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  return objc_msgSendSuper2(&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, a2, a3);
}

void sub_22696C74C(uint64_t a1, void *a2)
{
  sub_22696CBC4();
  id v3 = objc_msgSend(a2, sel_view);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_setNeedsLayout);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22696C7BC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22696C7F4(uint64_t a1)
{
  sub_22696C74C(a1, *(void **)(v1 + 16));
}

uint64_t sub_22696C7FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for HoverTextRootViewController()
{
  uint64_t result = qword_268148DA0;
  if (!qword_268148DA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22696C8A8(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  aBlock[4] = sub_22696D014;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22696C7FC;
  aBlock[3] = &block_descriptor_13;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = a1;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a5, sel_animateAlongsideTransition_completion_, v10, 0);
  _Block_release(v10);
  v12.receiver = v11;
  v12.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  objc_msgSendSuper2(&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a5, a2, a3);
  swift_unknownObjectRelease();
}

Swift::Void __swiftcall HoverTextRootViewController.viewDidLoad()()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

    swift_retain();
    sub_2269B88C0();
  }
  else
  {
    __break(1u);
  }
}

void sub_22696CAA8(void *a1)
{
  id v1 = a1;
  HoverTextRootViewController.viewDidLoad()();
}

Swift::Void __swiftcall HoverTextRootViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  objc_msgSendSuper2(&v3, sel_viewDidAppear_, a1);
  sub_22696CBC4();
}

void sub_22696CB3C(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  id v4 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a3);
  sub_22696CBC4();
}

Swift::Bool __swiftcall HoverTextRootViewController._canShowWhileLocked()()
{
  return 1;
}

uint64_t sub_22696CBAC()
{
  return 1;
}

uint64_t sub_22696CBB4()
{
  return 30;
}

uint64_t HoverTextRootViewController.supportedInterfaceOrientations.getter()
{
  return 30;
}

id sub_22696CBC4()
{
  id v1 = v0;
  id result = objc_msgSend(v0, sel_isViewLoaded);
  if (result)
  {
    uint64_t v3 = *(void *)&v0[qword_268148D80];
    id result = objc_msgSend(v1, sel_view);
    if (result)
    {
      id v4 = result;
      id v5 = objc_msgSend(result, sel_window);

      if (v5)
      {
        id v6 = objc_msgSend(v5, sel_interfaceOrientation);
      }
      else
      {
        id v6 = 0;
      }
      id result = objc_msgSend(v1, sel_view);
      if (result)
      {
        uint64_t v7 = result;
        id v8 = objc_msgSend(result, sel_window);

        if (v8)
        {
          id v9 = objc_msgSend(v8, sel_screen);

          objc_msgSend(v9, sel_bounds);
          double v11 = v10;
          double v13 = v12;
        }
        else
        {
          double v13 = 0.0;
          double v11 = 0.0;
        }
        id result = objc_msgSend(v1, sel_view);
        if (result)
        {
          uint64_t v14 = result;
          objc_msgSend(result, sel_safeAreaInsets);
          uint64_t v16 = v15;
          uint64_t v18 = v17;
          uint64_t v20 = v19;
          uint64_t v22 = v21;

          v23[0] = v16;
          v23[1] = v18;
          v23[2] = v20;
          v23[3] = v22;
          char v24 = 0;
          return (id)(*(uint64_t (**)(id, void *, double, double))(*(void *)v3 + 280))(v6, v23, v11, v13);
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
  return result;
}

void HoverTextRootViewController.__allocating_init(rootView:)()
{
}

void HoverTextRootViewController.__allocating_init(coder:rootView:)()
{
}

uint64_t sub_22696CE18()
{
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);

  return sub_22696C20C(v1);
}

id HoverTextRootViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HoverTextRootViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22696CEB8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22696CF18(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);

  return sub_22696C20C(v2);
}

void sub_22696CF8C()
{
}

void sub_22696CFBC()
{
}

uint64_t sub_22696CFEC()
{
  return type metadata accessor for HoverTextRootViewController();
}

void HoverTextRootViewController.init(coder:rootView:)()
{
}

void HoverTextRootViewController.init(rootView:)()
{
}

uint64_t sub_22696D02C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22696D0A0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22696D0DC()
{
  swift_getKeyPath();
  sub_22696DAC8();
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_22696D14C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22696DAC8();
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 24);
  return result;
}

uint64_t sub_22696D1C4()
{
  return swift_release();
}

void sub_22696D264()
{
  id v0 = objc_msgSend(self, sel_primaryApp);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = objc_msgSend(v0, sel_uiElement);

    if (v2)
    {
      id v3 = objc_msgSend(v2, sel_arrayWithAXAttribute_, 3043);
      if (!v3
        || (id v4 = v3, v5 = sub_2269B9010(), v4, v6 = sub_22696D42C(v5), swift_bridgeObjectRelease(), !v6))
      {
        swift_bridgeObjectRelease();
      }
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_22696DAC8();
      sub_2269B8490();
      swift_release();
      swift_bridgeObjectRelease();
      sub_2269B8DB0();
      sub_2269B8730();
      swift_release();
    }
  }
}

uint64_t sub_22696D42C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_22696E6C8(0, v2, 0);
  uint64_t v3 = v12;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_22696DB9C(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22696E6C8(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_22696E6C8(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v12;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_22696D574()
{
  return swift_release();
}

void sub_22696D664(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(self, sel_primaryApp);
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_firstResponder);

    if (v7)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268148DD0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2269BB190;
      uint64_t v9 = v2[5];
      *(void *)(inited + 32) = v2[4];
      *(void *)(inited + 40) = v9;
      swift_bridgeObjectRetain();
      v19.location = (NSUInteger)objc_msgSend(v7, sel_selectedTextRange);
      uint64_t v10 = NSStringFromRange(v19);
      uint64_t v11 = sub_2269B8F30();
      uint64_t v13 = v12;

      uint64_t v14 = MEMORY[0x263F8D310];
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v11;
      *(void *)(inited + 56) = v13;
      uint64_t v15 = v2[7];
      *(void *)(inited + 80) = v2[6];
      *(void *)(inited + 88) = v15;
      *(void *)(inited + 120) = v14;
      *(void *)(inited + 96) = a1;
      *(void *)(inited + 104) = a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_226980B5C(inited);
      id v16 = objc_msgSend(v7, sel_uiElement);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = (void *)sub_2269B8EB0();
        swift_bridgeObjectRelease();
        objc_msgSend(v17, sel_performAXAction_withValue_, 2505, v18);

        sub_2269B8DB0();
        sub_2269B8730();

        swift_release();
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_22696D848()
{
  return swift_release();
}

uint64_t sub_22696D8F0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11HoverTextUI31HoverTypingTextReplacementModel___observationRegistrar;
  uint64_t v2 = sub_2269B84E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22696D9A8()
{
  return type metadata accessor for HoverTypingTextReplacementModel();
}

uint64_t type metadata accessor for HoverTypingTextReplacementModel()
{
  uint64_t result = qword_268148DB8;
  if (!qword_268148DB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22696D9FC()
{
  uint64_t result = sub_2269B84E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_22696DAB8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 24) = *(unsigned char *)(v0 + 24);
}

unint64_t sub_22696DAC8()
{
  unint64_t result = qword_268148DC8;
  if (!qword_268148DC8)
  {
    type metadata accessor for HoverTypingTextReplacementModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148DC8);
  }
  return result;
}

uint64_t sub_22696DB20()
{
  return sub_22696D848();
}

uint64_t sub_22696DB44()
{
  *(void *)(*(void *)(v0 + 16) + 16) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22696DB80()
{
  return sub_22696D574();
}

uint64_t sub_22696DB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_22696DBF8()
{
}

ValueMetadata *type metadata accessor for HoverTypingTextReplacementLayout()
{
  return &type metadata for HoverTypingTextReplacementLayout;
}

unint64_t sub_22696DC24()
{
  unint64_t result = qword_268148DD8;
  if (!qword_268148DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148DD8);
  }
  return result;
}

uint64_t sub_22696DC78@<X0>(uint64_t a1@<X8>)
{
  sub_2269B8760();
  sub_22696E660(&qword_268148DF0, MEMORY[0x263F18AB8]);
  sub_2269B90C0();
  sub_2269B90E0();
  if (v9[4] == v9[0])
  {
    uint64_t v2 = sub_2269B86F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    uint64_t v4 = (void (*)(void *, void))sub_2269B9100();
    uint64_t v6 = v5;
    uint64_t v7 = sub_2269B86F0();
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

uint64_t sub_22696DE14(uint64_t a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148DE8);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2269B86F0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  char v24 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22696DC78((uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1) {
    return sub_22696E420((uint64_t)v20);
  }
  CGFloat v26 = a4;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
  sub_2269B87C0();
  LOBYTE(v49) = v27 & 1;
  char v50 = v28 & 1;
  sub_2269B86D0();
  double v30 = v29;
  double v48 = v31;
  if (a2) {
    double v32 = 10.0;
  }
  else {
    double v32 = *(double *)&a1;
  }
  swift_getKeyPath();
  uint64_t v49 = a11;
  sub_22696E660((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double v33 = *(double *)(a11 + 128) + v30 * -0.5;
  if (qword_268148920 != -1) {
    swift_once();
  }
  CGFloat v34 = a5;
  double v35 = v33 + *(double *)&xmmword_26814B850 * 0.5;
  CGFloat v36 = a6;
  if (v35 >= 0.0)
  {
    if (v32 - v30 < v35) {
      double v35 = v32 - v30 - *(double *)&xmmword_26814B850 * 0.5;
    }
  }
  else
  {
    double v35 = *(double *)&xmmword_26814B850 * 0.5;
  }
  sub_2269B8DE0();
  double v47 = v35 - v30 * v37;
  v51.origin.x = a3;
  v51.origin.y = v26;
  v51.size.width = v34;
  v51.size.height = a6;
  double MinY = CGRectGetMinY(v51);
  sub_2269B8DE0();
  double v39 = v30;
  double v40 = v48;
  double v42 = MinY - v48 * v41;
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v46 - 6) = a11;
  *((double *)&v46 - 5) = v47;
  *((double *)&v46 - 4) = v42;
  *((double *)&v46 - 3) = v39;
  *((double *)&v46 - 2) = v40;
  uint64_t v49 = a11;
  sub_2269B8490();
  swift_release();
  v52.origin.x = a3;
  v52.origin.y = v26;
  v52.size.width = v34;
  v52.size.height = v36;
  CGRectGetMinY(v52);
  sub_2269B8DE0();
  sub_2269B87C0();
  LOBYTE(v49) = v44 & 1;
  char v50 = v45 & 1;
  sub_2269B86D0();
  LOBYTE(v49) = 0;
  char v50 = 0;
  sub_2269B86E0();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
}

uint64_t sub_22696E230(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_22696ED94(a1, a2 & 1, a5);
}

uint64_t sub_22696E240(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  return sub_22696DE14(a1, a2 & 1, a7, a8, a9, a10, a3, a4, a5, a6, *v10);
}

uint64_t sub_22696E254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_22696E2C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_22696E28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_22696E2C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_22696E2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_22696E30C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2269B85B0();
  return sub_22696E37C;
}

void sub_22696E37C(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_22696E3CC()
{
  unint64_t result = qword_268148DE0;
  if (!qword_268148DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148DE0);
  }
  return result;
}

uint64_t sub_22696E420(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148DE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 sub_22696E488@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22696E660((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  __n128 result = *(__n128 *)(v3 + 184);
  long long v5 = *(_OWORD *)(v3 + 200);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_22696E534()
{
  return swift_release();
}

double *sub_22696E624()
{
  return sub_22696E63C();
}

double *sub_22696E63C()
{
  return sub_22699CE68(*(double **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_22696E660(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22696E6A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22696E728(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_22696E6C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22696E968(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22696E6E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22696EAD4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22696E708(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22696EC34(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22696E728(char a1, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148E10);
  uint64_t v10 = *(void *)(sub_2269B82E0() - 8);
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
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2269B82E0() - 8);
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
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t sub_22696E968(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148E00);
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
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t sub_22696EAD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148DF8);
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t sub_22696EC34(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148E08);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t sub_22696ED94(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v39 = sub_2269B86F0();
  uint64_t v6 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2269B8760();
  sub_22696E660(&qword_268148DF0, MEMORY[0x263F18AB8]);
  uint64_t v9 = sub_2269B90D0();
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v11 = v9;
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_22696E6E8(0, v9 & ~(v9 >> 63), 0);
  uint64_t result = sub_2269B90C0();
  if ((v11 & 0x8000000000000000) == 0)
  {
    v36[1] = a1;
    int v37 = a2;
    uint64_t v13 = (void (**)(char *))(v6 + 16);
    size_t v14 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v38 = a3;
    do
    {
      uint64_t v15 = (void (*)(char *, void))sub_2269B9100();
      uint64_t v16 = v39;
      (*v13)(v8);
      v15(v41, 0);
      sub_2269B87C0();
      v41[0] = v17 & 1;
      char v40 = v18 & 1;
      sub_2269B86D0();
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      (*v14)(v8, v16);
      uint64_t v10 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22696E6E8(0, *(void *)(v10 + 16) + 1, 1);
        uint64_t v10 = v42;
      }
      unint64_t v24 = *(void *)(v10 + 16);
      unint64_t v23 = *(void *)(v10 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_22696E6E8(v23 > 1, v24 + 1, 1);
        uint64_t v10 = v42;
      }
      *(void *)(v10 + 16) = v24 + 1;
      uint64_t v25 = v10 + 16 * v24;
      *(void *)(v25 + 32) = v20;
      *(void *)(v25 + 40) = v22;
      sub_2269B90F0();
      --v11;
    }
    while (v11);
LABEL_9:
    uint64_t v26 = *(void *)(v10 + 16);
    if (v26)
    {
      if (v26 == 1)
      {
        uint64_t v27 = 0;
        double v28 = 0.0;
      }
      else
      {
        uint64_t v27 = v26 & 0x7FFFFFFFFFFFFFFELL;
        double v29 = (double *)(v10 + 56);
        double v28 = 0.0;
        uint64_t v30 = v26 & 0x7FFFFFFFFFFFFFFELL;
        do
        {
          double v31 = *(v29 - 2);
          double v32 = *v29;
          v29 += 4;
          double v28 = v28 + v31 + v32;
          v30 -= 2;
        }
        while (v30);
        if (v26 == v27) {
          return swift_bridgeObjectRelease();
        }
      }
      uint64_t v33 = v26 - v27;
      CGFloat v34 = (double *)(v10 + 16 * v27 + 40);
      do
      {
        double v35 = *v34;
        v34 += 2;
        double v28 = v28 + v35;
        --v33;
      }
      while (v33);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextPresentationEvent.processEvent()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2269B8370();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v78 = (char *)v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2269B8180();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2269B8550();
  uint64_t v79 = *(void *)(v8 - 8);
  uint64_t v80 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2269B82E0();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(void *)v1;
  uint64_t v17 = *(void *)(v1 + 8);
  uint64_t v18 = *(void *)(v1 + 16);
  uint64_t v19 = *(void *)(v1 + 24);
  uint64_t v21 = *(void *)(v1 + 32);
  uint64_t v20 = *(void *)(v1 + 40);
  unsigned int v22 = *(char *)(v1 + 48);
  switch((v22 >> 5) & 3)
  {
    case 1u:
      uint64_t v30 = v13;
      uint64_t v80 = v12;
      unint64_t v83 = v16;
      uint64_t v84 = v17;
      swift_bridgeObjectRetain();
      sub_2269B8170();
      sub_22696F93C();
      uint64_t v31 = sub_2269B92B0();
      unint64_t v33 = v32;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      if (sub_2269B8FB0())
      {
        swift_bridgeObjectRelease();
        uint64_t v31 = 0;
        unint64_t v33 = 0xE000000000000000;
      }
      uint64_t v34 = HIBYTE(v33) & 0xF;
      if ((v33 & 0x2000000000000000) == 0) {
        uint64_t v34 = v31 & 0xFFFFFFFFFFFFLL;
      }
      if (v34)
      {
        sub_2269B8360();
        sub_2269B82F0();
        double v35 = (int *)type metadata accessor for HoverTextPresentationEvent();
        (*(void (**)(uint64_t, char *, uint64_t))(v30 + 40))(v1 + v35[7], v15, v80);
        CGFloat v36 = (void *)(v1 + v35[8]);
        swift_bridgeObjectRelease();
        void *v36 = 0;
        v36[1] = 0;
        int v37 = (_OWORD *)(v1 + v35[9]);
        *int v37 = 0u;
        v37[1] = 0u;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_22696F9DC();
        swift_allocError();
        _OWORD *v67 = xmmword_2269BB3D0;
        swift_willThrow();
      }
      break;
    case 2u:
      uint64_t v38 = *(void *)v1;
      uint64_t v78 = *(char **)(v1 + 24);
      int v39 = v18;
      id v40 = (id)v19;
      swift_bridgeObjectRetain();
      if (!AXDeviceSupportsHoverTextTyping() || v39 == 12)
      {
        id v56 = v81;
        double v57 = sub_2269714D4(0);
        if (!v56)
        {
          char v69 = v57;
          sub_226971918(v57, v38, v17);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v41 = sub_2269B8530();
        swift_beginAccess();
        uint64_t v43 = v79;
        uint64_t v42 = v80;
        (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v10, v41, v80);
        char v44 = sub_2269B8540();
        os_log_type_t v45 = sub_2269B9160();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = swift_slowAlloc();
          id v77 = v40;
          double v47 = (uint8_t *)v46;
          uint64_t v48 = swift_slowAlloc();
          uint64_t v87 = v48;
          *(_DWORD *)double v47 = 136315138;
          v76[1] = v47 + 4;
          unint64_t v49 = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v39);
          uint64_t v82 = sub_22697609C(v49, v50, &v87);
          sub_2269B9290();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22695C000, v44, v45, "Received value change with event type %s", v47, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A65DA10](v48, -1, -1);
          CGRect v51 = v47;
          id v40 = v77;
          MEMORY[0x22A65DA10](v51, -1, -1);

          (*(void (**)(char *, uint64_t))(v79 + 8))(v10, v80);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v42);
        }
        sub_226972818(v39, v78);
      }
      break;
    case 3u:
      if (!(v18 | v17 | v16 | v19 | v21 | v20) && v22 == 96
        || (uint64_t v52 = v18 | v17 | v19 | v21 | v20, v22 == 96) && v16 == 1 && !v52
        || v22 == 96 && v16 == 2 && !v52)
      {
        id v53 = v81;
        uint64_t v54 = sub_2269714D4(0);
        if (!v53)
        {
          id v55 = v54;
          sub_226971918(v54, 0, 0);
        }
      }
      else
      {
        uint64_t v70 = v12;
        uint64_t v71 = v13;
        sub_2269B8250();
        uint64_t v72 = (int *)type metadata accessor for HoverTextPresentationEvent();
        (*(void (**)(uint64_t, char *, uint64_t))(v71 + 40))(v1 + v72[7], v15, v70);
        uint64_t v73 = (void *)(v1 + v72[8]);
        swift_bridgeObjectRelease();
        *uint64_t v73 = 0;
        v73[1] = 0;
        v74 = (_OWORD *)(v1 + v72[9]);
        _OWORD *v74 = 0u;
        v74[1] = 0u;
      }
      break;
    default:
      if ((v22 & 0x80000000) != 0)
      {
        v85[0] = *(void *)v1;
        v85[1] = v17;
        v85[2] = v18;
        v85[3] = v19;
        v85[4] = v21;
        v85[5] = v20;
        char v86 = v22 & 1;
        double v58 = (void *)v16;
        uint64_t v59 = v18;
        double v60 = (void *)v19;
        id v77 = (id)v20;
        sub_226976170((void *)v16, v17, v18, v19, v21, v20, v22);
        sub_226972644((uint64_t)v85);
        double v61 = v58;
        uint64_t v62 = v17;
        uint64_t v63 = v59;
        double v64 = v60;
        uint64_t v65 = v21;
        uint64_t v66 = (uint64_t)v77;
      }
      else
      {
        unint64_t v23 = *(void **)v1;
        uint64_t v24 = *(void *)(v1 + 16);
        uint64_t v25 = *(char **)(v1 + 24);
        uint64_t v26 = *(void *)(v1 + 40);
        sub_226976170(*(void **)v1, *(void *)(v1 + 8), v24, (uint64_t)v25, *(void *)(v1 + 32), v26, *(unsigned char *)(v1 + 48));
        uint64_t v78 = v25;
        sub_226976170(v23, v17, v24, (uint64_t)v25, v21, v26, v22);
        id v27 = v81;
        double v28 = sub_2269714D4(v23);
        if (v27)
        {
          double v29 = v78;
          sub_226976180(v23, v17, v24, v78, v21, v26, v22);
        }
        else
        {
          id v77 = (id)v26;
          char v68 = v78;
          id v81 = v28;
          sub_226971918(v28, 0, 0);
          double v29 = v68;
          uint64_t v75 = v68;
          uint64_t v26 = (uint64_t)v77;
          sub_226976180(v23, v17, v24, v75, v21, (uint64_t)v77, v22);
        }
        double v61 = v23;
        uint64_t v62 = v17;
        uint64_t v63 = v24;
        double v64 = v29;
        uint64_t v65 = v21;
        uint64_t v66 = v26;
      }
      sub_226976180(v61, v62, v63, v64, v65, v66, v22);
      break;
  }
}

unint64_t sub_22696F93C()
{
  unint64_t result = qword_268148E40;
  if (!qword_268148E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148E40);
  }
  return result;
}

uint64_t type metadata accessor for HoverTextPresentationEvent()
{
  uint64_t result = qword_268148E58;
  if (!qword_268148E58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_22696F9DC()
{
  unint64_t result = qword_268148E48;
  if (!qword_268148E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148E48);
  }
  return result;
}

unint64_t sub_22696FA30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v120 = a2;
  uint64_t v5 = sub_2269B8390();
  MEMORY[0x270FA5388](v5 - 8);
  v92 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E80);
  uint64_t v7 = MEMORY[0x270FA5388](v116);
  __int16 v114 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v115 = (char *)&v86 - v9;
  uint64_t v93 = sub_2269B8290();
  uint64_t v10 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  char v118 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E88);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v100 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E90);
  MEMORY[0x270FA5388](v14 - 8);
  unint64_t v16 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E98);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  int v90 = (char *)&v86 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v112 = (char *)&v86 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v111 = (uint64_t)&v86 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v86 - v25;
  uint64_t v27 = sub_2269B82E0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  int v89 = (char *)&v86 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  char v117 = (char *)&v86 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v86 - v33;
  uint64_t v121 = a1;
  uint64_t v122 = v120;
  double v35 = v26;
  uint64_t v36 = v17;
  int v37 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  uint64_t v38 = v3;
  uint64_t v39 = (uint64_t)v35;
  uint64_t v120 = v40;
  uint64_t v88 = v28 + 16;
  uint64_t v87 = v37;
  ((void (*)(char *, uint64_t))v37)((char *)&v86 - v33, v38);
  uint64_t v99 = sub_2269B8470();
  uint64_t v41 = *(void *)(v99 - 8);
  uint64_t v98 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v97 = v41 + 56;
  uint64_t v96 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t v42 = v34;
  uint64_t v108 = (void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  char v109 = (void (**)(char *, unint64_t, uint64_t))(v10 + 32);
  double v107 = (void (**)(char *, uint64_t))(v10 + 8);
  unint64_t v119 = MEMORY[0x263F8EE78];
  uint64_t v95 = v28;
  uint64_t v94 = v28 + 32;
  int v91 = v16;
  uint64_t v113 = v34;
  uint64_t v110 = v39;
  uint64_t v106 = v17;
  uint64_t v43 = v93;
  while (1)
  {
    uint64_t v44 = (uint64_t)v100;
    v98(v100, 1, 1, v99);
    sub_22697836C((unint64_t *)&qword_268148BD0, MEMORY[0x263F06828]);
    sub_22696F93C();
    sub_2269B83C0();
    sub_22696B8F0(v44, &qword_268148E88);
    if ((*v96)(v16, 1, v36) == 1) {
      break;
    }
    sub_22696B7FC((uint64_t)v16, v39, &qword_268148E98);
    unint64_t v45 = (unint64_t)v118;
    sub_2269B8200();
    uint64_t v46 = sub_22697836C(&qword_268148EA0, MEMORY[0x263F067E8]);
    if ((sub_2269B8EE0() & 1) == 0)
    {
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    uint64_t v105 = v46;
    double v47 = v115;
    uint64_t v48 = v116;
    unint64_t v49 = &v115[*(int *)(v116 + 48)];
    uint64_t v50 = v39;
    CGRect v51 = *v109;
    (*v109)(v115, v45, v43);
    uint64_t v52 = *v108;
    uint64_t v104 = v49;
    v52(v49, v50, v43);
    id v53 = v114;
    uint64_t v54 = &v114[*(int *)(v48 + 48)];
    v52(v114, (uint64_t)v47, v43);
    uint64_t v102 = v52;
    v52(v54, (uint64_t)v49, v43);
    uint64_t v55 = (uint64_t)v112;
    v51(v112, (unint64_t)v53, v43);
    id v56 = (char *)*v107;
    (*v107)(v54, v43);
    double v57 = &v53[*(int *)(v48 + 48)];
    v51(v53, (unint64_t)v47, v43);
    v51(v57, (unint64_t)v104, v43);
    double v58 = (char *)v106;
    uint64_t v59 = v55 + *(int *)(v106 + 36);
    uint64_t v103 = v51;
    v51((char *)v59, (unint64_t)v57, v43);
    uint64_t v104 = v56;
    ((void (*)(char *, uint64_t))v56)(v53, v43);
    sub_22696B7FC(v55, v111, &qword_268148E98);
    uint64_t v60 = sub_22696B7B8(&qword_268148EA8, &qword_268148E98);
    uint64_t v42 = v58;
    sub_2269B8320();
    sub_2269B8340();
    unint64_t v61 = v119;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v61 = sub_226975BC4(0, *(void *)(v61 + 16) + 1, 1, v61);
    }
    unint64_t v63 = *(void *)(v61 + 16);
    unint64_t v62 = *(void *)(v61 + 24);
    uint64_t v44 = v63 + 1;
    unint64_t v45 = (unint64_t)v118;
    uint64_t v64 = v110;
    if (v63 >= v62 >> 1) {
      unint64_t v61 = sub_226975BC4(v62 > 1, v63 + 1, 1, v61);
    }
    *(void *)(v61 + 16) = v44;
    unint64_t v65 = (*(unsigned __int8 *)(v95 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v95 + 80);
    unint64_t v119 = v61;
    (*(void (**)(unint64_t, char *, uint64_t))(v95 + 32))(v61 + v65 + *(void *)(v95 + 72) * v63, v117, v120);
    sub_2269B8200();
    uint64_t v66 = v64 + *((int *)v42 + 9);
    if ((sub_2269B8EE0() & 1) == 0) {
      goto LABEL_15;
    }
    double v67 = v115;
    uint64_t v68 = v116;
    char v69 = &v115[*(int *)(v116 + 48)];
    uint64_t v105 = v60;
    uint64_t v70 = v103;
    v103(v115, v45, v43);
    unint64_t v101 = v69;
    uint64_t v71 = (void (*)(char *, char *, uint64_t))v102;
    v102(v69, v66, v43);
    uint64_t v72 = v114;
    uint64_t v73 = &v114[*(int *)(v68 + 48)];
    v71(v114, v67, v43);
    v71(v73, v69, v43);
    v74 = v90;
    v70(v90, (unint64_t)v72, v43);
    uint64_t v75 = v104;
    ((void (*)(char *, uint64_t))v104)(v73, v43);
    uint64_t v76 = *(int *)(v68 + 48);
    uint64_t v42 = v113;
    id v77 = &v72[v76];
    v70(v72, (unint64_t)v67, v43);
    v70(v77, (unint64_t)v101, v43);
    uint64_t v78 = v106;
    v70(&v74[*(int *)(v106 + 36)], (unint64_t)v77, v43);
    ((void (*)(char *, uint64_t))v75)(v72, v43);
    uint64_t v79 = (uint64_t)v74;
    uint64_t v80 = (uint64_t)v112;
    sub_22696B7FC(v79, (uint64_t)v112, &qword_268148E98);
    sub_2269B8260();
    uint64_t v39 = v110;
    sub_22696B8F0(v80, &qword_268148E98);
    sub_22696B8F0(v111, &qword_268148E98);
    sub_22696B8F0(v39, &qword_268148E98);
    unint64_t v16 = v91;
    uint64_t v36 = v78;
  }
  sub_22696B8F0((uint64_t)v16, &qword_268148E90);
  uint64_t v44 = (uint64_t)v89;
  v87(v89, v42, v120);
  unint64_t v45 = v119;
  if (swift_isUniquelyReferenced_nonNull_native()) {
    goto LABEL_11;
  }
LABEL_16:
  unint64_t v45 = sub_226975BC4(0, *(void *)(v45 + 16) + 1, 1, v45);
LABEL_11:
  unint64_t v82 = *(void *)(v45 + 16);
  unint64_t v81 = *(void *)(v45 + 24);
  if (v82 >= v81 >> 1) {
    unint64_t v45 = sub_226975BC4(v81 > 1, v82 + 1, 1, v45);
  }
  *(void *)(v45 + 16) = v82 + 1;
  uint64_t v83 = v95;
  uint64_t v84 = v120;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v95 + 32))(v45+ ((*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80))+ *(void *)(v83 + 72) * v82, v44, v120);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v42, v84);
  return v45;
}

double static HoverTextPresentationEvent.hoverTextDidStart.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_22697141C(2, a1);
}

double static HoverTextPresentationEvent.didReceiveAnnouncement(text:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + 50) = 12;
  uint64_t v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  swift_bridgeObjectRetain();
  sub_2269B8250();
  uint64_t v7 = (void *)(a3 + v6[8]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (_OWORD *)(a3 + v6[9]);
  double result = 0.0;
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  uint64_t v10 = a3 + v6[10];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  uint64_t v11 = (void *)(a3 + v6[11]);
  void *v11 = 0;
  v11[1] = 0;
  *(void *)(a3 + v6[12]) = 0;
  *(void *)(a3 + v6[13]) = 0;
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_WORD *)(a3 + 48) = 288;
  return result;
}

double static HoverTextPresentationEvent.elementVisualUpdated.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_22697141C(1, a1);
}

unint64_t HoverTextPresentationEvent.Error.errorDescription.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = 0xD000000000000018;
  switch(a2)
  {
    case 0:
      return v2;
    case 1:
      unint64_t v2 = 0xD000000000000022;
      break;
    case 2:
      unint64_t v2 = 0xD00000000000002DLL;
      break;
    case 3:
      unint64_t v2 = 0xD000000000000029;
      break;
    default:
      sub_2269B9340();
      swift_bridgeObjectRelease();
      sub_2269B8F80();
      unint64_t v2 = 0xD00000000000001DLL;
      break;
  }
  return v2;
}

unint64_t sub_226970770()
{
  return HoverTextPresentationEvent.Error.errorDescription.getter(*v0, v0[1]);
}

unint64_t HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 2:
    case 6:
    case 7:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000016;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000026;
      break;
    case 11:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2269708C4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2269B94F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_226970950()
{
  char v1 = *v0;
  sub_2269B9580();
  HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v1);
  sub_2269B8F50();
  swift_bridgeObjectRelease();
  return sub_2269B95D0();
}

uint64_t sub_2269709B4()
{
  HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*v0);
  sub_2269B8F50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_226970A08()
{
  char v1 = *v0;
  sub_2269B9580();
  HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v1);
  sub_2269B8F50();
  swift_bridgeObjectRelease();
  return sub_2269B95D0();
}

uint64_t sub_226970A68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s11HoverTextUI0aB17PresentationEventV011ValueChangeE4TypeO03rawF0AESgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_226970A98@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t HoverTextPresentationEvent.eventType.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226976FC8(v1, a1);
}

uint64_t HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded.getter()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 49) = result;
  return result;
}

uint64_t (*HoverTextPresentationEvent.shouldFetchFocusedElementIfNeeded.modify())()
{
  return CGRectMake;
}

uint64_t HoverTextPresentationEvent.valueChangeEventType.getter()
{
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t HoverTextPresentationEvent.valueChangeEventType.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 50) = result;
  return result;
}

uint64_t (*HoverTextPresentationEvent.valueChangeEventType.modify())()
{
  return CGRectMake;
}

uint64_t HoverTextPresentationEvent.displayText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 28);
  uint64_t v4 = sub_2269B82E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t HoverTextPresentationEvent.displayText.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 28);
  uint64_t v4 = sub_2269B82E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

double (*HoverTextPresentationEvent.displayText.modify())(__n128, __n128)
{
  return CGRectMake;
}

uint64_t HoverTextPresentationEvent.secondaryText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HoverTextPresentationEvent.secondaryText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

double (*HoverTextPresentationEvent.secondaryText.modify())(__n128, __n128)
{
  return CGRectMake;
}

double HoverTextPresentationEvent.anchorRect.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 36));
}

uint64_t HoverTextPresentationEvent.anchorRect.setter(double a1, double a2, double a3, double a4)
{
  uint64_t result = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v10 = (double *)(v4 + *(int *)(result + 36));
  double *v10 = a1;
  v10[1] = a2;
  v10[2] = a3;
  v10[3] = a4;
  return result;
}

double (*HoverTextPresentationEvent.anchorRect.modify())(__n128, __n128)
{
  return CGRectMake;
}

uint64_t HoverTextPresentationEvent.displayMode.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 40));
}

uint64_t HoverTextPresentationEvent.displayMode.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v6 = v2 + *(int *)(result + 40);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

double (*HoverTextPresentationEvent.displayMode.modify())(__n128, __n128)
{
  return CGRectMake;
}

uint64_t HoverTextPresentationEvent.selectedTextRange.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 44));
}

uint64_t HoverTextPresentationEvent.selectedTextRange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v6 = (void *)(v2 + *(int *)(result + 44));
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

double (*HoverTextPresentationEvent.selectedTextRange.modify())(__n128, __n128)
{
  return CGRectMake;
}

uint64_t HoverTextPresentationEvent.paragraphIndex.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 48));
}

uint64_t HoverTextPresentationEvent.paragraphIndex.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for HoverTextPresentationEvent();
  *(void *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

double (*HoverTextPresentationEvent.paragraphIndex.modify())(__n128, __n128)
{
  return CGRectMake;
}

void *HoverTextPresentationEvent.axAttributedString.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for HoverTextPresentationEvent() + 52));
  id v2 = v1;
  return v1;
}

void HoverTextPresentationEvent.axAttributedString.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for HoverTextPresentationEvent() + 52);

  *(void *)(v1 + v3) = a1;
}

double (*HoverTextPresentationEvent.axAttributedString.modify())(__n128, __n128)
{
  return CGRectMake;
}

void sub_2269710BC()
{
  qword_268148E18 = MEMORY[0x263F8EE78];
}

double sub_2269710D0()
{
  double result = 0.0;
  xmmword_268148E20 = 0u;
  *(_OWORD *)&qword_268148E30 = 0u;
  return result;
}

uint64_t HoverTextPresentationEvent.init(_:shouldFetchFocusedElementIfNeeded:)@<X0>(long long *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + 50) = 12;
  uint64_t v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_2269B8250();
  uint64_t v7 = (void *)(a3 + v6[8]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  char v8 = (_OWORD *)(a3 + v6[9]);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  uint64_t v9 = a3 + v6[10];
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v10 = (void *)(a3 + v6[11]);
  void *v10 = 0;
  v10[1] = 0;
  *(void *)(a3 + v6[12]) = 0;
  *(void *)(a3 + v6[13]) = 0;
  uint64_t result = sub_226977000(a1, a3);
  *(unsigned char *)(a3 + 49) = a2;
  return result;
}

__n128 static HoverTextPresentationEvent.focusDidChange(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_226977020(a1, (uint64_t)v15);
  __n128 v13 = (__n128)v15[1];
  long long v14 = v15[0];
  uint64_t v4 = v16;
  uint64_t v5 = v17;
  char v6 = v18;
  *(unsigned char *)(a2 + 50) = 12;
  uint64_t v7 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_22697707C(a1);
  sub_2269B8250();
  char v8 = (void *)(a2 + v7[8]);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = (_OWORD *)(a2 + v7[9]);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  uint64_t v10 = a2 + v7[10];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  uint64_t v11 = (void *)(a2 + v7[11]);
  void *v11 = 0;
  v11[1] = 0;
  *(void *)(a2 + v7[12]) = 0;
  *(void *)(a2 + v7[13]) = 0;
  __n128 result = v13;
  *(_OWORD *)a2 = v14;
  *(__n128 *)(a2 + 16) = v13;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = v6;
  *(unsigned char *)(a2 + 49) = 1;
  return result;
}

double static HoverTextPresentationEvent.primaryAppsDidChange.getter@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 50) = 12;
  id v2 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_2269B8250();
  uint64_t v3 = (void *)(a1 + v2[8]);
  *uint64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (_OWORD *)(a1 + v2[9]);
  double result = 0.0;
  *uint64_t v4 = 0u;
  v4[1] = 0u;
  uint64_t v6 = a1 + v2[10];
  *(void *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 8) = 1;
  uint64_t v7 = (void *)(a1 + v2[11]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  *(void *)(a1 + v2[12]) = 0;
  *(void *)(a1 + v2[13]) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_WORD *)(a1 + 48) = 352;
  return result;
}

double static HoverTextPresentationEvent.valueChanged(text:eventType:keyInputDelegate:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a3;
  *(unsigned char *)(a5 + 50) = 12;
  uint64_t v10 = (int *)type metadata accessor for HoverTextPresentationEvent();
  id v11 = a4;
  swift_bridgeObjectRetain();
  sub_2269B8250();
  uint64_t v12 = (void *)(a5 + v10[8]);
  void *v12 = 0;
  v12[1] = 0;
  __n128 v13 = (_OWORD *)(a5 + v10[9]);
  double result = 0.0;
  *__n128 v13 = 0u;
  v13[1] = 0u;
  uint64_t v15 = a5 + v10[10];
  *(void *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 8) = 1;
  uint64_t v16 = (void *)(a5 + v10[11]);
  *uint64_t v16 = 0;
  v16[1] = 0;
  *(void *)(a5 + v10[12]) = 0;
  *(void *)(a5 + v10[13]) = 0;
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = v9;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = 0;
  *(_WORD *)(a5 + 48) = 320;
  return result;
}

double static HoverTextPresentationEvent.hideForInactivePointerDisplay.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_22697141C(3, a1);
}

double sub_22697141C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 + 50) = 12;
  uint64_t v4 = (int *)type metadata accessor for HoverTextPresentationEvent();
  sub_2269B8250();
  uint64_t v5 = (void *)(a2 + v4[8]);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (_OWORD *)(a2 + v4[9]);
  double result = 0.0;
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  uint64_t v8 = a2 + v4[10];
  *(void *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 8) = 1;
  uint64_t v9 = (void *)(a2 + v4[11]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  *(void *)(a2 + v4[12]) = 0;
  *(void *)(a2 + v4[13]) = 0;
  *(void *)a2 = a1;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(void *)(a2 + 40) = 0;
  *(_WORD *)(a2 + 48) = 352;
  return result;
}

void *sub_2269714D4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_2269B8550();
  uint64_t v5 = *(v4 - 1);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v37 - v9;
  uint64_t v11 = type metadata accessor for HoverTextPresentationEvent();
  MEMORY[0x270FA5388](v11 - 8);
  __n128 v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226967548(v2, (uint64_t)v13);
  if (!a1)
  {
    uint64_t v14 = v13[49];
    sub_2269675AC((uint64_t)v13);
    if (v14)
    {
      uint64_t v15 = sub_2269B8530();
      swift_beginAccess();
      uint64_t v38 = *(void (**)(char *, uint64_t, void *))(v5 + 16);
      v38(v10, v15, v4);
      uint64_t v16 = sub_2269B8540();
      os_log_type_t v17 = sub_2269B9160();
      if (os_log_type_enabled(v16, v17))
      {
        char v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = v15;
        uint64_t v19 = v18;
        *(_WORD *)char v18 = 0;
        _os_log_impl(&dword_22695C000, v16, v17, "Focus element given to us resolved to nil. reaching out to get focused element", v18, 2u);
        uint64_t v20 = v19;
        uint64_t v15 = v37;
        MEMORY[0x22A65DA10](v20, -1, -1);
      }

      uint64_t v21 = *(void (**)(char *, void *))(v5 + 8);
      v21(v10, v4);
      uint64_t v22 = (void *)AXUIElementSharedSystemApp();
      if (v22)
      {
        id v23 = v22;
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F21668]), sel_initWithAXUIElement_, v23);
        if (v24)
        {
          uint64_t v25 = v24;
          id v26 = objc_msgSend(v24, sel_currentApplications);
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = sub_2269B9010();

            if (*(void *)(v28 + 16))
            {
              sub_22696DB9C(v28 + 32, (uint64_t)&v39);
            }
            else
            {
              long long v39 = 0u;
              long long v40 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v40 + 1))
            {
              sub_226978330(0, (unint64_t *)&unk_268149930);
              int v34 = swift_dynamicCast();
              double v35 = v41;
              if (!v34) {
                double v35 = 0;
              }
LABEL_24:
              id v36 = v35;
              uint64_t v4 = objc_msgSend(v36, sel_nativeFocusPreferredElement);

              if (v4) {
                return v4;
              }
              goto LABEL_15;
            }
          }
          else
          {
            long long v39 = 0u;
            long long v40 = 0u;
          }
          sub_22696B8F0((uint64_t)&v39, &qword_2681493A0);
          double v35 = 0;
          goto LABEL_24;
        }
      }
      swift_beginAccess();
      v38(v8, v15, v4);
      uint64_t v29 = sub_2269B8540();
      os_log_type_t v30 = sub_2269B9160();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_22695C000, v29, v30, "Shared system app unexpectedly nil!", v31, 2u);
        MEMORY[0x22A65DA10](v31, -1, -1);
      }

      v21(v8, v4);
    }
LABEL_15:
    sub_22696F9DC();
    swift_allocError();
    *uint64_t v32 = 0;
    v32[1] = 0;
    swift_willThrow();
    return v4;
  }
  uint64_t v4 = a1;
  sub_2269675AC((uint64_t)v13);
  return v4;
}

uint64_t sub_226971918(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v110 = a3;
  uint64_t v97 = a2;
  uint64_t v107 = sub_2269B8290();
  uint64_t v106 = *(void *)(v107 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v107);
  uint64_t v105 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v103 = (char *)&v95 - v6;
  uint64_t v104 = sub_2269B8240();
  uint64_t v102 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  unint64_t v101 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2269B8370();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v99 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  char v117 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v96 = (uint64_t)&v95 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v109 = (uint64_t)&v95 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v108 = (uint64_t)&v95 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v95 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v111 = (uint64_t)&v95 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v26 = (char *)&v95 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v95 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v95 - v30;
  uint64_t v32 = sub_2269B82E0();
  uint64_t v33 = *(void *)(v32 - 8);
  __int16 v114 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56);
  uint64_t v115 = v33 + 56;
  v114(v31, 1, 1, v32);
  unsigned int v34 = objc_msgSend(a1, sel_isKeyboardKey);
  uint64_t v119 = 0;
  unint64_t v35 = 0;
  uint64_t v113 = v33;
  if (v34)
  {
    id v36 = a1;
    id v37 = objc_msgSend(a1, sel_application);
    if (!v37)
    {
      __break(1u);
      goto LABEL_39;
    }
    uint64_t v38 = v37;
    id v39 = objc_msgSend(v37, sel_firstResponder);

    if (v39)
    {
      uint64_t v98 = v32;
      id v40 = objc_msgSend(v39, sel_value);
      if (v40)
      {
        uint64_t v41 = v40;
        sub_2269B8F30();
      }
      sub_2269B8360();
      sub_2269B82F0();
      sub_22696B8F0((uint64_t)v31, &qword_268148BC0);
      uint64_t v32 = v98;
      v114(v29, 0, 1, v98);
      sub_22696B7FC((uint64_t)v29, (uint64_t)v31, &qword_268148BC0);
      a1 = v36;
      id v42 = objc_msgSend(v36, sel_label);
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v119 = sub_2269B8F30();
        unint64_t v35 = v44;
      }
      else
      {

        unint64_t v35 = 0xE100000000000000;
        uint64_t v119 = 32;
      }
      uint64_t v33 = v113;
    }
    else
    {
      uint64_t v119 = 0;
      a1 = v36;
      unint64_t v35 = 0;
    }
  }
  sub_2269782C8((uint64_t)v31, (uint64_t)v26);
  uint64_t v121 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  unsigned int v45 = v121(v26, 1, v32);
  sub_22696B8F0((uint64_t)v26, &qword_268148BC0);
  unint64_t v118 = v35;
  uint64_t v120 = v33 + 48;
  uint64_t v116 = a1;
  if (v45 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148E78);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2269BB3E0;
    *(void *)(inited + 32) = a1;
    unint64_t v122 = inited;
    sub_2269B9030();
    unint64_t v47 = v122;
    id v48 = objc_msgSend(a1, sel_elementsForAttribute_, 2026);
    if (v48)
    {
      unint64_t v49 = v48;
      sub_226978330(0, (unint64_t *)&unk_268149930);
      uint64_t v50 = sub_2269B9010();
    }
    else
    {
      uint64_t v50 = MEMORY[0x263F8EE78];
    }
    if (qword_268148900 != -1) {
      swift_once();
    }
    unint64_t v51 = swift_bridgeObjectRetain();
    unsigned __int8 v52 = sub_2269758D8(v51, v50);
    swift_bridgeObjectRelease();
    if ((v52 & 1) == 0)
    {
      unint64_t v122 = v50;
      swift_bridgeObjectRetain();
      sub_226976790(v47);
      unint64_t v47 = v122;
    }
    qword_268148E18 = v50;
    swift_bridgeObjectRelease();
    uint64_t v53 = v111;
    sub_226973DAC(v47, v111);
    swift_bridgeObjectRelease();
    sub_22696B8F0((uint64_t)v31, &qword_268148BC0);
    v114((char *)v53, 0, 1, v32);
    sub_22696B7FC(v53, (uint64_t)v31, &qword_268148BC0);
    a1 = v116;
    unint64_t v35 = v118;
  }
  sub_2269782C8((uint64_t)v31, (uint64_t)v21);
  uint64_t v54 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v121;
  unsigned int v55 = v121(v21, 1, v32);
  sub_22696B8F0((uint64_t)v21, &qword_268148BC0);
  uint64_t v100 = v31;
  if (v55 == 1)
  {
    if (!v110) {
      goto LABEL_27;
    }
LABEL_26:
    swift_bridgeObjectRetain();
    sub_2269B8360();
    uint64_t v64 = v111;
    sub_2269B82F0();
    sub_22696B8F0((uint64_t)v31, &qword_268148BC0);
    v114((char *)v64, 0, 1, v32);
    sub_22696B7FC(v64, (uint64_t)v31, &qword_268148BC0);
    goto LABEL_27;
  }
  uint64_t v56 = v108;
  sub_2269782C8((uint64_t)v31, v108);
  if (v54(v56, 1, v32) == 1)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_40;
  }
  double v57 = v101;
  sub_2269B81F0();
  sub_22697836C(&qword_268148B20, MEMORY[0x263F066D8]);
  double v58 = v103;
  uint64_t v59 = v104;
  sub_2269B90C0();
  uint64_t v60 = v105;
  sub_2269B90E0();
  sub_22697836C(&qword_268148B28, MEMORY[0x263F067E8]);
  uint64_t v61 = v107;
  char v62 = sub_2269B8EF0();
  unint64_t v63 = *(void (**)(char *, uint64_t))(v106 + 8);
  v63(v60, v61);
  v63(v58, v61);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v57, v59);
  uint64_t v33 = v113;
  (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v108, v32);
  uint64_t v31 = v100;
  a1 = v116;
  unint64_t v35 = v118;
  if ((v62 & 1) != 0 && v110) {
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v65 = v109;
  sub_2269782C8((uint64_t)v31, v109);
  unsigned int v66 = v121((char *)v65, 1, v32);
  sub_22696B8F0(v65, &qword_268148BC0);
  uint64_t v67 = (uint64_t)v117;
  if (v66 != 1)
  {
    uint64_t v68 = v32;
    uint64_t v69 = v96;
    sub_2269782C8((uint64_t)v31, v96);
    uint64_t v98 = v68;
    if (v121((char *)v69, 1, v68) != 1)
    {
      uint64_t v70 = v101;
      sub_2269B81F0();
      sub_22697836C(&qword_268148B20, MEMORY[0x263F066D8]);
      uint64_t v71 = v103;
      uint64_t v72 = v104;
      sub_2269B90C0();
      uint64_t v73 = v105;
      sub_2269B90E0();
      sub_22697836C(&qword_268148B28, MEMORY[0x263F067E8]);
      uint64_t v74 = v107;
      char v75 = sub_2269B8EF0();
      uint64_t v76 = *(void (**)(char *, uint64_t))(v106 + 8);
      v76(v73, v74);
      v76(v71, v74);
      (*(void (**)(char *, uint64_t))(v102 + 8))(v70, v72);
      uint64_t v33 = v113;
      uint64_t v77 = v69;
      uint64_t v32 = v98;
      (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v77, v98);
      a1 = v116;
      uint64_t v67 = (uint64_t)v117;
      uint64_t v31 = v100;
      unint64_t v35 = v118;
      if ((v75 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_41;
  }
LABEL_30:
  if (!v35) {
    goto LABEL_37;
  }
  uint64_t v78 = HIBYTE(v35) & 0xF;
  if ((v35 & 0x2000000000000000) == 0) {
    uint64_t v78 = v119 & 0xFFFFFFFFFFFFLL;
  }
  if (!v78)
  {
LABEL_37:
    sub_22696F9DC();
    swift_allocError();
    *uint64_t v94 = xmmword_2269BB3D0;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return sub_22696B8F0((uint64_t)v31, &qword_268148BC0);
  }
LABEL_34:
  sub_2269782C8((uint64_t)v31, v67);
  if (v121((char *)v67, 1, v32) != 1)
  {
    uint64_t v79 = (int *)type metadata accessor for HoverTextPresentationEvent();
    uint64_t v80 = v112;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 40))(v112 + v79[7], v67, v32);
    unint64_t v81 = (uint64_t *)(v80 + v79[8]);
    *unint64_t v81 = v119;
    v81[1] = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v82 = objc_msgSend(a1, sel_uiElement);
    if (v82)
    {
      uint64_t v83 = v82;
      objc_msgSend(v82, sel_rectWithAXAttribute_, 2057);
      uint64_t v85 = v84;
      uint64_t v87 = v86;
      uint64_t v89 = v88;
      uint64_t v91 = v90;
      swift_bridgeObjectRelease();

      uint64_t result = sub_22696B8F0((uint64_t)v31, &qword_268148BC0);
      uint64_t v93 = (void *)(v112 + v79[9]);
      *uint64_t v93 = v85;
      v93[1] = v87;
      v93[2] = v89;
      v93[3] = v91;
      return result;
    }
    goto LABEL_42;
  }
LABEL_41:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_42:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_226972644(uint64_t a1)
{
  uint64_t v3 = sub_2269B8370();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_2269B82E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = *(void *)a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    swift_bridgeObjectRetain();
    sub_2269B8360();
    sub_2269B82F0();
    uint64_t v10 = (int *)type metadata accessor for HoverTextPresentationEvent();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v1 + v10[7], v7, v4);
    uint64_t v11 = (void *)(v1 + v10[8]);
    uint64_t result = swift_bridgeObjectRelease();
    void *v11 = 0;
    v11[1] = 0;
    long long v13 = 0uLL;
    long long v14 = 0uLL;
    if ((*(unsigned char *)(a1 + 48) & 1) == 0)
    {
      long long v13 = *(_OWORD *)(a1 + 16);
      long long v14 = *(_OWORD *)(a1 + 32);
    }
    uint64_t v15 = (_OWORD *)(v1 + v10[9]);
    _OWORD *v15 = v13;
    v15[1] = v14;
  }
  else
  {
    sub_22696F9DC();
    swift_allocError();
    *uint64_t v16 = xmmword_2269BB3D0;
    return swift_willThrow();
  }
  return result;
}

void sub_226972818(int a1, void *a2)
{
  uint64_t v176 = *MEMORY[0x263EF8340];
  uint64_t v11 = sub_2269B8550();
  uint64_t v170 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v168 = (char *)v150 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v169 = (char *)v150 - v15;
  MEMORY[0x270FA5388](v14);
  v167 = (char *)v150 - v16;
  uint64_t v17 = sub_2269B8370();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v150 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (double *)sub_2269B82E0();
  double v166 = *(v20 - 1);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v150 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v23 = objc_msgSend(self, sel_primaryApp);
  if (!v23) {
    goto LABEL_10;
  }
  id v24 = v23;
  id v25 = objc_msgSend(v23, sel_uiElement);
  if (!v25)
  {

LABEL_10:
    sub_22696F9DC();
    swift_allocError();
    *unsigned int v34 = xmmword_2269BB400;
    swift_willThrow();
    return;
  }
  uint64_t v165 = v11;
  id v163 = v25;
  id v26 = a2;
  if (!a2)
  {
    id v26 = objc_msgSend(v24, sel_firstResponder);
    if (!v26) {
      goto LABEL_12;
    }
  }
  id v164 = v24;
  id v27 = a2;
  id v28 = v26;
  v161 = (double *)objc_msgSend(v28, sel_uiElement);
  if (!v161)
  {

    id v24 = v164;
LABEL_12:
    sub_22696F9DC();
    swift_allocError();
    *unint64_t v35 = xmmword_2269BB3F0;
    swift_willThrow();

    return;
  }
  id v162 = v28;
  unint64_t v29 = HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(a1);
  uint64_t v157 = v3;
  int v156 = a1;
  if (v29 == 0xD000000000000026 && v30 == 0x80000002269BD160)
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = 0;
    unint64_t v32 = 0xE000000000000000;
    id v33 = v162;
  }
  else
  {
    char v36 = sub_2269B94F0();
    swift_bridgeObjectRelease();
    id v33 = v162;
    if ((v36 & 1) != 0 || (id v37 = objc_msgSend(v162, sel_value)) == 0)
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
    }
    else
    {
      uint64_t v38 = v37;
      uint64_t v31 = sub_2269B8F30();
      unint64_t v32 = v39;
    }
  }
  id v40 = objc_msgSend(v33, sel_selectedTextRange);
  uint64_t v42 = v41;
  uint64_t v43 = (int *)type metadata accessor for HoverTextPresentationEvent();
  unint64_t v44 = &v2[v43[11]];
  *(void *)unint64_t v44 = v40;
  *((void *)v44 + 1) = v42;
  v154 = v44;
  unint64_t v160 = v32;
  sub_2269B9110();
  unint64_t v46 = (unint64_t)v2;
  v159 = v43;
  if (v47) {
    goto LABEL_49;
  }
  v152 = v45;
  v153 = v2;
  uint64_t v48 = v31;
  unint64_t v49 = v160;
  swift_bridgeObjectRetain();
  uint64_t v155 = 15;
  uint64_t v158 = v48;
  unint64_t v50 = sub_2269B8FE0();
  unint64_t v52 = v51;
  swift_bridgeObjectRelease();
  sub_226973AC4(10, 0xE100000000000000, v50, v52);
  char v54 = v53;
  swift_bridgeObjectRelease();
  if ((v54 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_2269B8FE0();
    swift_bridgeObjectRelease();
    uint64_t v155 = sub_2269B9250();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  unint64_t v55 = sub_226973A78((unint64_t)v152, v158, v49);
  unint64_t v57 = v56;
  swift_bridgeObjectRelease();
  unint64_t v58 = sub_226973C30(10, 0xE100000000000000, v55, v57);
  LOBYTE(v55) = v59;
  swift_bridgeObjectRelease();
  if (v55)
  {
    uint64_t v60 = HIBYTE(v49) & 0xF;
    if ((v49 & 0x2000000000000000) == 0) {
      uint64_t v60 = v158;
    }
    uint64_t v61 = v60 << 16;
    if ((v49 & 0x1000000000000000) == 0 || (v158 & 0x800000000000000) != 0)
    {
      uint64_t v43 = (int *)v158;
      unint64_t v58 = v61 | 7;
    }
    else
    {
      uint64_t v43 = (int *)v158;
      unint64_t v58 = v61 | 0xB;
    }
  }
  else
  {
    uint64_t v43 = (int *)v158;
  }
  unint64_t v62 = v155;
  uint64_t v63 = sub_2269B8FA0();
  if (v58 >> 14 < v62 >> 14)
  {
    __break(1u);
    goto LABEL_77;
  }
  unint64_t v49 = v63;
  uint64_t v64 = sub_2269B8FE0();
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  unint64_t v58 = v69;
  swift_bridgeObjectRetain();
  sub_2269B8360();
  uint64_t v151 = v64;
  uint64_t v158 = v66;
  v152 = v68;
  sub_2269B8300();
  uint64_t v70 = v159;
  unint64_t v62 = (unint64_t)v153;
  (*(void (**)(char *, char *, double *))(*(void *)&v166 + 40))(&v153[v159[7]], v22, v20);
  if (__OFSUB__(*v154, v49))
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  *v154 -= v49;
  *(void *)(v62 + v70[12]) = v49;
  uint64_t v71 = sub_2269B8F60();
  valuePtr[0] = 0;
  valuePtr[1] = v71;
  *(double *)&AXValueRef v72 = COERCE_DOUBLE(AXValueCreate(kAXValueTypeCFRange, valuePtr));
  id v73 = objc_msgSend(v162, sel_uiElement);
  if (!v73)
  {

    __break(1u);
    goto LABEL_81;
  }
  uint64_t v74 = v73;
  id v75 = objc_msgSend(v73, sel_objectWithAXAttribute_parameter_, 92508, v72);

  if (v75)
  {
    sub_2269B92D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v172, 0, sizeof(v172));
  }
  sub_22696B7FC((uint64_t)v172, (uint64_t)&v175, &qword_2681493A0);
  if (*(void *)&v175.size.height)
  {
    sub_226978330(0, &qword_268148E70);
    if (swift_dynamicCast())
    {
      uint64_t v76 = v173;
      goto LABEL_39;
    }
  }
  else
  {
    sub_22696B8F0((uint64_t)&v175, &qword_2681493A0);
  }
  uint64_t v76 = 0;
LABEL_39:
  uint64_t v77 = sub_2269B8FA0();
  uint64_t v78 = sub_2269B9270();
  swift_bridgeObjectRelease();
  uint64_t v79 = v165;
  if (v76)
  {
    id v80 = v76;
    if (v77 == sub_2269B8150()) {
      goto LABEL_43;
    }
    if (__OFADD__(v77, v78)) {
      __break(1u);
    }
    if ((uint64_t)objc_msgSend(v80, sel_length) < v77 + v78)
    {
LABEL_43:

      goto LABEL_44;
    }
    id v148 = objc_msgSend(v80, sel_substringWithRange_, v77, v78);

    uint64_t v43 = v159;
    uint64_t v149 = v159[13];
    unint64_t v46 = (unint64_t)v153;

    *(void *)(v46 + v149) = v148;
LABEL_49:
    id v95 = objc_msgSend(self, sel_sharedInstance);
    id v96 = objc_msgSend(v95, sel_hoverTextTypingDisplayMode);

    uint64_t v19 = (char *)(v46 + v43[10]);
    *(void *)uint64_t v19 = v96;
    v19[8] = 0;
    unint64_t v58 = (unint64_t)v163;
    objc_msgSend(v163, sel_rectWithAXAttribute_, 2057);
    unint64_t v4 = v97;
    uint64_t v20 = v161;
    objc_msgSend(v161, sel_rectWithAXAttribute_, 2057);
    double v99 = v98;
    objc_msgSend(v20, sel_rectWithAXAttribute_, 2236);
    CGFloat y = v177.origin.y;
    v180.origin.CGFloat x = 0.0;
    v180.origin.CGFloat y = 0.0;
    v180.size.CGFloat width = 0.0;
    v180.size.CGFloat height = 0.0;
    unint64_t v49 = v46;
    if (CGRectEqualToRect(v177, v180))
    {
      objc_msgSend((id)v58, sel_rectWithAXAttribute_, 2236);
      CGFloat y = v102.n128_f64[0];
    }
    v101.n128_u64[0] = v4;
    v102.n128_f64[0] = y;
    double v166 = CGRectMake(v101, v102);
    uint64_t v158 = v103;
    uint64_t v155 = v104;
    v154 = v105;
    objc_msgSend(v20, sel_rectWithAXAttribute_, 2050);
    CGFloat x = v178.origin.x;
    CGFloat v8 = v178.origin.y;
    CGFloat width = v178.size.width;
    CGFloat height = v178.size.height;
    CGRect v175 = v178;
    BOOL IsNull = CGRectIsNull(v178);
    uint64_t v107 = v170;
    if (IsNull
      || (v179.origin.CGFloat x = x,
          v179.origin.CGFloat y = v8,
          v179.size.CGFloat width = width,
          v179.size.CGFloat height = height,
          CGRectIsInfinite(v179)))
    {
      v167 = v19;
      uint64_t v110 = sub_2269B8530();
      swift_beginAccess();
      uint64_t v111 = *(void (**)(char *, uint64_t, uint64_t))(v107 + 16);
      uint64_t v112 = v169;
      v111(v169, v110, v165);
      uint64_t v113 = sub_2269B8540();
      os_log_type_t v114 = sub_2269B9140();
      BOOL v115 = os_log_type_enabled(v113, v114);
      v153 = (char *)v110;
      v152 = (void (*)(char *, char *, uint64_t))v111;
      if (v115)
      {
        uint64_t v116 = (uint8_t *)swift_slowAlloc();
        uint64_t v151 = swift_slowAlloc();
        valuePtr[0] = v151;
        *(_DWORD *)uint64_t v116 = 136315138;
        v150[1] = v116 + 4;
        swift_beginAccess();
        unint64_t v117 = v49;
        unint64_t v118 = NSStringFromCGRect(v175);
        uint64_t v119 = sub_2269B8F30();
        unint64_t v121 = v120;

        unint64_t v49 = v117;
        unint64_t v58 = (unint64_t)v163;
        uint64_t v122 = v119;
        uint64_t v123 = v170;
        uint64_t v171 = sub_22697609C(v122, v121, valuePtr);
        sub_2269B9290();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22695C000, v113, v114, "Text cursor frame had infinite coordinates. %s. Falling back to cachedTextCursorFrame.", v116, 0xCu);
        uint64_t v124 = v151;
        swift_arrayDestroy();
        MEMORY[0x22A65DA10](v124, -1, -1);
        MEMORY[0x22A65DA10](v116, -1, -1);

        CGRect v125 = *(void (**)(char *, uint64_t))(v123 + 8);
        v125(v169, v165);
      }
      else
      {

        CGRect v125 = *(void (**)(char *, uint64_t))(v107 + 8);
        v125(v112, v165);
      }
      unint64_t v62 = (unint64_t)v164;
      uint64_t v43 = v159;
      uint64_t v19 = v167;
      if (qword_268148908 != -1) {
        swift_once();
      }
      v181.origin.CGFloat x = 0.0;
      v181.origin.CGFloat y = 0.0;
      v181.size.CGFloat width = 0.0;
      v181.size.CGFloat height = 0.0;
      if (CGRectEqualToRect(*(CGRect *)ymmword_268148E20, v181))
      {
        CGRect v126 = v153;
        swift_beginAccess();
        v152(v168, v126, v165);
        v127 = sub_2269B8540();
        os_log_type_t v128 = sub_2269B9160();
        if (os_log_type_enabled(v127, v128))
        {
          v129 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v129 = 0;
          _os_log_impl(&dword_22695C000, v127, v128, "cachedTextCursorFrame is zero. Falling back to first responder frame.", v129, 2u);
          MEMORY[0x22A65DA10](v129, -1, -1);
        }

        v125(v168, v165);
        CGFloat v8 = v99;
        unint64_t v62 = (unint64_t)v164;
      }
      else
      {
        CGFloat v8 = *(double *)&ymmword_268148E20[8];
      }
      uint64_t v20 = v161;
LABEL_66:
      v108.n128_u64[0] = v4;
      v109.n128_f64[0] = v8;
      double v130 = CGRectMake(v108, v109);
      if (v19[8])
      {
        swift_bridgeObjectRelease();

        id v134 = v162;
LABEL_74:
        v147 = (void *)(v49 + v43[8]);
        swift_bridgeObjectRelease();
        void *v147 = 0;
        v147[1] = 0;
        *(unsigned char *)(v49 + 50) = v156;
        return;
      }
      double v135 = v130;
      uint64_t v136 = v131;
      uint64_t v137 = v132;
      uint64_t v138 = v133;
      uint64_t v139 = *(void *)v19;
      if (*(void *)v19 == 2)
      {
        id v140 = v162;
        unsigned int v141 = objc_msgSend(v162, sel_hoverTypingShouldAdjustDockedMode);

        swift_bridgeObjectRelease();
        if (!v141)
        {
          v144 = (double *)(v49 + v43[9]);
          uint64_t v145 = v158;
          double *v144 = v166;
          *((void *)v144 + 1) = v145;
          v146 = v154;
          *((void *)v144 + 2) = v155;
          *((void *)v144 + 3) = v146;
          goto LABEL_74;
        }
        *(void *)uint64_t v19 = 3;
        v19[8] = 0;
      }
      else
      {
        swift_bridgeObjectRelease();

        id v142 = v162;
        if (v139 != 3) {
          goto LABEL_74;
        }
      }
      v143 = (double *)(v49 + v43[9]);
      double *v143 = v135;
      *((void *)v143 + 1) = v136;
      *((void *)v143 + 2) = v137;
      *((void *)v143 + 3) = v138;
      goto LABEL_74;
    }
    unint64_t v62 = (unint64_t)v164;
    if (qword_268148908 == -1)
    {
LABEL_65:
      *(CGFloat *)ymmword_268148E20 = x;
      *(CGFloat *)&ymmword_268148E20[8] = v8;
      *(CGFloat *)&ymmword_268148E20[16] = width;
      *(CGFloat *)&ymmword_268148E20[24] = height;
      goto LABEL_66;
    }
LABEL_78:
    swift_once();
    goto LABEL_65;
  }
LABEL_44:
  uint64_t v158 = v78;
  double v166 = *(double *)&v72;
  uint64_t v81 = sub_2269B8530();
  swift_beginAccess();
  uint64_t v82 = v170;
  uint64_t v83 = v167;
  (*(void (**)(char *, uint64_t, uint64_t))(v170 + 16))(v167, v81, v79);
  uint64_t v19 = (char *)v164;
  uint64_t v84 = sub_2269B8540();
  os_log_type_t v85 = sub_2269B9140();
  if (!os_log_type_enabled(v84, v85))
  {

    (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v79);
    goto LABEL_48;
  }
  uint64_t v155 = (uint64_t)v76;
  uint64_t v86 = swift_slowAlloc();
  v154 = (void *)swift_slowAlloc();
  *(void *)&v175.origin.CGFloat x = v154;
  *(_DWORD *)uint64_t v86 = 136315394;
  uint64_t v87 = sub_2269B9230();
  *(void *)&v172[0] = sub_22697609C(v87, v88, (uint64_t *)&v175);
  sub_2269B9290();
  swift_bridgeObjectRelease();
  *(_WORD *)(v86 + 12) = 2080;
  id v89 = objc_msgSend(v19, sel_label);
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = sub_2269B8F30();
    unint64_t v93 = v92;

    *(void *)&v172[0] = sub_22697609C(v91, v93, (uint64_t *)&v175);
    sub_2269B9290();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v84, v85, "Invalid substring range %s %s", (uint8_t *)v86, 0x16u);
    uint64_t v94 = v154;
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v94, -1, -1);
    MEMORY[0x22A65DA10](v86, -1, -1);

    (*(void (**)(char *, uint64_t))(v170 + 8))(v167, v165);
LABEL_48:
    unint64_t v46 = (unint64_t)v153;
    uint64_t v43 = v159;
    goto LABEL_49;
  }
LABEL_81:

  __break(1u);
}

unint64_t sub_226973A78(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_2269B8FE0();
  }
  __break(1u);
  return result;
}

unint64_t sub_226973AC4(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = a3 >> 14;
  if (a3 >> 14 != a4 >> 14)
  {
    unint64_t v5 = sub_2269B9260();
    if (sub_2269B9280() != a1 || v8 != a2)
    {
      char v9 = sub_2269B94F0();
      swift_bridgeObjectRelease();
      if (v9) {
        return v5;
      }
      if (v4 == v5 >> 14) {
        return 0;
      }
      while (1)
      {
        unint64_t v5 = sub_2269B9260();
        if (sub_2269B9280() == a1 && v10 == a2) {
          break;
        }
        char v12 = sub_2269B94F0();
        swift_bridgeObjectRelease();
        if (v12) {
          return v5;
        }
        if (v4 == v5 >> 14) {
          return 0;
        }
      }
    }
    swift_bridgeObjectRelease();
    return v5;
  }
  return 0;
}

unint64_t sub_226973C30(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v14 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14) {
    return 0;
  }
  if (sub_2269B9280() == a1 && v8 == a2)
  {
    unint64_t v4 = a3;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_2269B94F0();
    swift_bridgeObjectRelease();
    if (v9)
    {
      return a3;
    }
    else
    {
      while (1)
      {
        unint64_t v11 = sub_2269B9250();
        if (v11 >> 14 == v14) {
          return 0;
        }
        unint64_t v4 = v11;
        if (sub_2269B9280() == a1 && v12 == a2) {
          goto LABEL_6;
        }
        char v10 = sub_2269B94F0();
        swift_bridgeObjectRelease();
        if (v10) {
          return v4;
        }
      }
    }
  }
  return v4;
}

uint64_t sub_226973DAC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = sub_2269B8290();
  unint64_t v4 = *(void *)(v60 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v60);
  char v59 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v58 = (char *)&v42 - v7;
  uint64_t v57 = sub_2269B8240();
  uint64_t v8 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  unint64_t v56 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2269B82E0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v55 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - v18;
  MEMORY[0x270FA5388](v17);
  unint64_t v21 = (unint64_t)&v42 - v20;
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v22 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    uint64_t v43 = a2;
    uint64_t v61 = v19;
    unint64_t v62 = v12;
    if (v22)
    {
      unint64_t v65 = a1;
      uint64_t v66 = MEMORY[0x263F8EE78];
      uint64_t result = sub_22696E6A8(0, v22 & ~(v22 >> 63), 0);
      if (v22 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v63 = (void (*)(char *, char *, uint64_t))v4;
      uint64_t v64 = v22;
      uint64_t v54 = v8;
      uint64_t v25 = v13;
      uint64_t v26 = 0;
      unint64_t v27 = v65;
      uint64_t v28 = v66;
      unint64_t v29 = v65 & 0xC000000000000001;
      do
      {
        if (v29) {
          id v30 = (id)MEMORY[0x22A65CD20](v26);
        }
        else {
          id v30 = *(id *)(v27 + 8 * v26 + 32);
        }
        uint64_t v31 = v30;
        sub_226974688(v21);

        uint64_t v66 = v28;
        unint64_t v33 = *(void *)(v28 + 16);
        unint64_t v32 = *(void *)(v28 + 24);
        a2 = v33 + 1;
        if (v33 >= v32 >> 1)
        {
          sub_22696E6A8(v32 > 1, v33 + 1, 1);
          uint64_t v28 = v66;
        }
        ++v26;
        *(void *)(v28 + 16) = a2;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 32))(v28+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v33, v21, v25);
        unint64_t v27 = v65;
      }
      while (v64 != v26);
      uint64_t v13 = v25;
      uint64_t v19 = v61;
      uint64_t v12 = v62;
      unint64_t v4 = (unint64_t)v63;
      uint64_t v8 = v54;
      uint64_t v23 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v28 = MEMORY[0x263F8EE78];
    }
    uint64_t v66 = v23;
    uint64_t v54 = *(void *)(v28 + 16);
    if (!v54) {
      break;
    }
    unint64_t v21 = 0;
    uint64_t v53 = v14 + 16;
    a1 = v14 + 32;
    unint64_t v50 = (void (**)(unint64_t, uint64_t))(v4 + 8);
    uint64_t v51 = v14 + 48;
    unint64_t v49 = (void (**)(char *, uint64_t))(v8 + 8);
    unint64_t v44 = (void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v52 = v14 + 56;
    unint64_t v42 = (v14 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    unint64_t v47 = v14 + 32;
    uint64_t v48 = v14;
    uint64_t v46 = v13;
    while (v21 < *(void *)(v28 + 16))
    {
      unint64_t v34 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      uint64_t v35 = *(void *)(v14 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, v28 + v34 + v35 * v21, v13);
      unsigned int v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
      v45(v12, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
        goto LABEL_28;
      }
      uint64_t v64 = v35;
      unint64_t v65 = v34;
      uint64_t v63 = *(void (**)(char *, char *, uint64_t))a1;
      v63(v19, v12, v13);
      char v36 = v56;
      sub_2269B81F0();
      sub_22697836C(&qword_268148B20, MEMORY[0x263F066D8]);
      uint64_t v38 = v57;
      id v37 = v58;
      sub_2269B90C0();
      unint64_t v4 = (unint64_t)v59;
      sub_2269B90E0();
      sub_22697836C(&qword_268148B28, MEMORY[0x263F067E8]);
      a2 = v60;
      uint64_t v8 = sub_2269B8EF0();
      unint64_t v39 = *v50;
      (*v50)(v4, a2);
      v39((unint64_t)v37, a2);
      (*v49)(v36, v38);
      if (v8)
      {
        uint64_t v19 = v61;
        uint64_t v13 = v46;
        (*v44)(v61, v46);
        a1 = v47;
        uint64_t v14 = v48;
      }
      else
      {
        uint64_t v19 = v61;
        uint64_t v13 = v46;
        a1 = v47;
        id v40 = (void (*)(unint64_t, char *, uint64_t))v63;
        v63(v55, v61, v46);
        uint64_t v8 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22696E6A8(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v66;
        }
        uint64_t v14 = v48;
        unint64_t v4 = *(void *)(v8 + 16);
        unint64_t v41 = *(void *)(v8 + 24);
        a2 = v4 + 1;
        if (v4 >= v41 >> 1)
        {
          sub_22696E6A8(v41 > 1, v4 + 1, 1);
          uint64_t v8 = v66;
        }
        *(void *)(v8 + 16) = a2;
        v40(v8 + v65 + v4 * v64, v55, v13);
        uint64_t v66 = v8;
      }
      ++v21;
      uint64_t v12 = v62;
      if (v54 == v21)
      {
        v45(v62, 1, 1, v13);
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2269B9450();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_28:
  swift_bridgeObjectRelease();
  sub_22696B8F0((uint64_t)v12, &qword_268148BC0);
  sub_226967DF0(8236, v66, v43);
  return swift_release();
}

unint64_t HoverTextPresentationEvent.description.getter()
{
  uint64_t v1 = *v0;
  unsigned int v2 = *((unsigned __int8 *)v0 + 48);
  unint64_t result = 0xD000000000000016;
  switch((v2 >> 5) & 3)
  {
    case 1u:
      return result;
    case 2u:
      unint64_t result = 0x61684365756C6156;
      break;
    case 3u:
      uint64_t v4 = v0[3];
      uint64_t v5 = v0[4] | v0[5];
      uint64_t v6 = v0[2] | v0[1];
      if (v2 == 96 && !(v5 | v1 | v4 | v6) || (uint64_t v7 = v5 | v4 | v6, v2 == 96) && v1 == 1 && !v7)
      {
        unint64_t result = 0xD000000000000014;
      }
      else
      {
        BOOL v8 = v2 == 96;
        BOOL v10 = v1 == 2 && v7 == 0;
        if (v8 && v10) {
          unint64_t result = 0xD000000000000011;
        }
        else {
          unint64_t result = 0xD00000000000001DLL;
        }
      }
      break;
    default:
      unint64_t result = 0x6469447375636F46;
      break;
  }
  return result;
}

BOOL HoverTextPresentationEvent.isTypingEvent.getter()
{
  return *(unsigned char *)(v0 + 50) != 12;
}

void sub_226974688(uint64_t a1@<X8>)
{
  uint64_t v128 = a1;
  uint64_t v141 = sub_2269B8290();
  uint64_t v132 = *(void (***)(char *, unint64_t))(v141 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v141);
  id v140 = (char *)&v123 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v139 = (char *)&v123 - v4;
  uint64_t v138 = sub_2269B8240();
  double v130 = *(void (***)(char *, uint64_t))(v138 - 8);
  MEMORY[0x270FA5388](v138);
  uint64_t v137 = (char *)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2269B8180();
  uint64_t v146 = *(void *)(v6 - 8);
  v147 = (void *)v6;
  MEMORY[0x270FA5388](v6);
  id v134 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  uint64_t v9 = *(void **)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v12 = (char *)&v123 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  v144 = (char *)&v123 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v150 = (uint64_t)&v123 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v133 = (char *)&v123 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v135 = (uint64_t)&v123 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v151 = (uint64_t)&v123 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v124 = (char *)&v123 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v131 = (uint64_t *)((char *)&v123 - v25);
  uint64_t v26 = sub_2269B82E0();
  uint64_t v152 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v136 = (char *)&v123 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v127 = (uint64_t)&v123 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  unint64_t v33 = (char *)&v123 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v149 = (char *)&v123 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  id v142 = (char *)&v123 - v37;
  MEMORY[0x270FA5388](v36);
  CGRect v125 = (char *)&v123 - v38;
  unsigned int v39 = objc_msgSend(v1, sel_hasAnyTraits_, *MEMORY[0x263F21AE8]);
  uint64_t v40 = 0;
  uint64_t v148 = 0;
  if (v39)
  {
    unint64_t v41 = (void *)sub_2269B8F00();
    id v42 = HTUILocString(v41);

    uint64_t v40 = sub_2269B8F30();
    uint64_t v148 = v43;
  }
  id v44 = objc_msgSend(v1, sel_value);
  uint64_t v45 = *MEMORY[0x263F21C30];
  id v46 = v44;
  unint64_t v47 = (unint64_t)v46;
  if (!objc_msgSend(v1, sel_hasAnyTraits_, v45))
  {
LABEL_6:

    goto LABEL_7;
  }
  if (v46)
  {
    objc_msgSend(v46, sel_intValue);
    uint64_t v48 = v9;
    unint64_t v49 = (void *)sub_2269B8F00();
    swift_bridgeObjectRelease();
    unint64_t v47 = (unint64_t)HTUILocString(v49);

    uint64_t v9 = v48;
    if (!v47)
    {
      __break(1u);
      return;
    }
    goto LABEL_6;
  }
  unint64_t v47 = 0;
LABEL_7:
  id v50 = objc_msgSend(v1, sel_uiElement);
  uint64_t v145 = v33;
  if (!v50)
  {
    long long v154 = 0u;
    long long v155 = 0u;
    uint64_t v53 = v152;
LABEL_17:
    sub_22696B8F0((uint64_t)&v154, &qword_2681493A0);
    goto LABEL_18;
  }
  uint64_t v51 = v50;
  id v52 = objc_msgSend(v50, sel_objectWithAXAttribute_, 2001);

  if (v52)
  {
    sub_2269B92D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v153, 0, sizeof(v153));
  }
  uint64_t v53 = v152;
  sub_22696B7FC((uint64_t)v153, (uint64_t)&v154, &qword_2681493A0);
  if (!*((void *)&v155 + 1)) {
    goto LABEL_17;
  }
  sub_226978330(0, &qword_268148E70);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    id v64 = objc_msgSend(v1, sel_label);
    if (!v64)
    {
      swift_bridgeObjectRelease();
      sub_2269B8250();

      return;
    }
    unint64_t v65 = v64;
    uint64_t v129 = v40;
    uint64_t v66 = v9;
    unint64_t v67 = v47;
    uint64_t v68 = sub_2269B8F30();
    uint64_t v70 = v69;

    *(void *)&long long v154 = v68;
    *((void *)&v154 + 1) = v70;
    uint64_t v71 = v134;
    sub_2269B8170();
    sub_22696F93C();
    sub_2269B92B0();
    (*(void (**)(char *, void *))(v146 + 8))(v71, v147);
    swift_bridgeObjectRelease();
    uint64_t v72 = v151;
    sub_2269B8250();
    v147 = *(void **)(v53 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v147)(v72, 0, 1, v26);
    unint64_t v73 = sub_226975E2C(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v75 = *(void *)(v73 + 16);
    unint64_t v74 = *(void *)(v73 + 24);
    if (v75 >= v74 >> 1) {
      unint64_t v73 = sub_226975E2C(v74 > 1, v75 + 1, 1, v73);
    }
    uint64_t v76 = (uint64_t)v133;
    uint64_t v63 = v66;
    *(void *)(v73 + 16) = v75 + 1;
    unint64_t v77 = v73;
    sub_22696B7FC(v151, v73 + ((*((unsigned __int8 *)v66 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v66 + 80)) + v66[9] * v75, &qword_268148BC0);
    unint64_t v47 = v67;
    goto LABEL_30;
  }
  uint64_t v54 = v9;
  unint64_t v55 = *(void **)&v153[0];
  unint64_t v56 = v134;
  sub_2269B8170();
  uint64_t v57 = (void *)sub_2269B8160();
  (*(void (**)(char *, void *))(v146 + 8))(v56, v147);
  uint64_t v151 = (uint64_t)v55;
  id v58 = objc_msgSend(v55, sel_stringByTrimmingCharactersInSet_, v57);

  uint64_t v129 = v40;
  if (v58)
  {
    id v126 = (id)v47;
    id v59 = objc_msgSend(v58, sel_attributedString);
    uint64_t v60 = (uint64_t)v131;
    sub_2269B8330();

    uint64_t v61 = *(void **)(v53 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v61)(v60, 0, 1, v26);
    int v62 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v60, 1, v26);
    uint64_t v63 = v54;
    v147 = v61;
    if (v62 != 1)
    {
      uint64_t v78 = v125;
      (*(void (**)(char *, uint64_t, uint64_t))(v53 + 32))(v125, v60, v26);
      uint64_t v79 = (uint64_t)v124;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v124, v78, v26);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v61)(v79, 0, 1, v26);
      unint64_t v80 = sub_226975E2C(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v82 = *(void *)(v80 + 16);
      unint64_t v81 = *(void *)(v80 + 24);
      if (v82 >= v81 >> 1) {
        unint64_t v80 = sub_226975E2C(v81 > 1, v82 + 1, 1, v80);
      }
      id v83 = (id)v151;
      *(void *)(v80 + 16) = v82 + 1;
      unint64_t v77 = v80;
      sub_22696B7FC(v79, v80+ ((*((unsigned __int8 *)v63 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v63 + 80))+ v63[9] * v82, &qword_268148BC0);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v125, v26);
      unint64_t v47 = (unint64_t)v126;
      goto LABEL_29;
    }
    unint64_t v47 = (unint64_t)v126;
  }
  else
  {
    uint64_t v60 = (uint64_t)v131;
    v147 = *(void **)(v53 + 56);
    ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t))v147)(v131, 1, 1, v26);
    uint64_t v63 = v54;
  }

  sub_22696B8F0(v60, &qword_268148BC0);
  unint64_t v77 = MEMORY[0x263F8EE78];
LABEL_29:
  uint64_t v76 = (uint64_t)v133;
LABEL_30:
  uint64_t v84 = v135;
  if (v47)
  {
    sub_2269B8F30();
    sub_2269B8250();
    uint64_t v85 = 0;
  }
  else
  {
    uint64_t v85 = 1;
  }
  uint64_t v146 = v53 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v147)(v84, v85, 1, v26);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_68;
  }
  while (1)
  {
    unint64_t v87 = *(void *)(v77 + 16);
    unint64_t v86 = *(void *)(v77 + 24);
    v143 = v12;
    id v126 = (id)v47;
    if (v87 >= v86 >> 1) {
      unint64_t v77 = sub_226975E2C(v86 > 1, v87 + 1, 1, v77);
    }
    *(void *)(v77 + 16) = v87 + 1;
    unint64_t v88 = (*((unsigned __int8 *)v63 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v63 + 80);
    uint64_t v151 = v63[9];
    sub_22696B7FC(v135, v77 + v88 + v151 * v87, &qword_268148BC0);
    if (v148)
    {
      sub_2269B8250();
      uint64_t v89 = 0;
    }
    else
    {
      uint64_t v89 = 1;
    }
    uint64_t v63 = v147;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v147)(v76, v89, 1, v26);
    uint64_t v90 = v77;
    unint64_t v92 = *(void *)(v77 + 16);
    unint64_t v91 = *(void *)(v77 + 24);
    if (v92 >= v91 >> 1) {
      uint64_t v90 = sub_226975E2C(v91 > 1, v92 + 1, 1, v77);
    }
    uint64_t v129 = v90;
    *(void *)(v90 + 16) = v92 + 1;
    uint64_t v93 = v90 + v88;
    sub_22696B7FC(v76, v90 + v88 + v92 * v151, &qword_268148BC0);
    uint64_t v94 = *(void *)(v129 + 16);
    uint64_t v95 = MEMORY[0x263F8EE78];
    uint64_t v148 = v26;
    if (v94)
    {
      id v96 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48);
      unint64_t v97 = (void (**)(char *, uint64_t, uint64_t))(v53 + 32);
      swift_bridgeObjectRetain();
      uint64_t v76 = MEMORY[0x263F8EE78];
      uint64_t v98 = (uint64_t)v144;
      do
      {
        unint64_t v77 = v76;
        uint64_t v99 = v150;
        sub_2269782C8(v93, v150);
        sub_22696B7FC(v99, v98, &qword_268148BC0);
        if ((*v96)(v98, 1, v26) == 1)
        {
          sub_22696B8F0(v98, &qword_268148BC0);
          uint64_t v76 = v77;
        }
        else
        {
          uint64_t v100 = v98;
          __n128 v101 = *v97;
          __n128 v102 = v142;
          (*v97)(v142, v100, v26);
          v101(v149, (uint64_t)v102, v26);
          uint64_t v76 = v77;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v76 = sub_226975BC4(0, *(void *)(v77 + 16) + 1, 1, v77);
          }
          unint64_t v104 = *(void *)(v76 + 16);
          unint64_t v103 = *(void *)(v76 + 24);
          if (v104 >= v103 >> 1) {
            uint64_t v76 = sub_226975BC4(v103 > 1, v104 + 1, 1, v76);
          }
          *(void *)(v76 + 16) = v104 + 1;
          uint64_t v53 = v152;
          unint64_t v105 = v76
               + ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))
               + *(void *)(v152 + 72) * v104;
          uint64_t v26 = v148;
          v101((char *)v105, (uint64_t)v149, v148);
          uint64_t v98 = (uint64_t)v144;
        }
        v93 += v151;
        --v94;
      }
      while (v94);
      swift_bridgeObjectRelease();
      uint64_t v63 = v147;
      uint64_t v95 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v76 = MEMORY[0x263F8EE78];
    }
    *(void *)&long long v154 = v95;
    uint64_t v106 = (uint64_t)v143;
    uint64_t v12 = v145;
    v144 = *(char **)(v76 + 16);
    if (!v144) {
      break;
    }
    unint64_t v47 = 0;
    id v142 = (char *)(v53 + 16);
    uint64_t v135 = v53 + 48;
    uint64_t v107 = (uint64_t *)(v53 + 32);
    uint64_t v133 = (char *)(v132 + 1);
    uint64_t v132 = (void (**)(char *, unint64_t))(v130 + 1);
    double v130 = (void (**)(char *, uint64_t))(v53 + 8);
    id v134 = (char *)v76;
    uint64_t v131 = (uint64_t *)(v53 + 32);
    while (v47 < *(void *)(v76 + 16))
    {
      unint64_t v108 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
      uint64_t v109 = *(void *)(v53 + 72);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v53 + 16))(v106, v76 + v108 + v109 * v47, v26);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v63)(v106, 0, 1, v26);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v106, 1, v26) == 1) {
        goto LABEL_66;
      }
      uint64_t v149 = (char *)v108;
      uint64_t v150 = v109;
      uint64_t v151 = *v107;
      ((void (*)(char *, uint64_t, uint64_t))v151)(v12, v106, v26);
      uint64_t v110 = v137;
      sub_2269B81F0();
      sub_22697836C(&qword_268148B20, MEMORY[0x263F066D8]);
      uint64_t v111 = v139;
      unint64_t v77 = v138;
      sub_2269B90C0();
      uint64_t v112 = v140;
      sub_2269B90E0();
      sub_22697836C(&qword_268148B28, MEMORY[0x263F067E8]);
      uint64_t v113 = v26;
      uint64_t v114 = v141;
      char v115 = sub_2269B8EF0();
      uint64_t v116 = *(void (**)(char *, uint64_t))v133;
      (*(void (**)(char *, uint64_t))v133)(v112, v114);
      v116(v111, v114);
      (*v132)(v110, v77);
      if (v115)
      {
        uint64_t v12 = v145;
        (*v130)(v145, v113);
        uint64_t v106 = (uint64_t)v143;
        uint64_t v26 = v113;
        uint64_t v53 = v152;
        uint64_t v76 = (uint64_t)v134;
        uint64_t v107 = v131;
      }
      else
      {
        uint64_t v12 = v145;
        uint64_t v107 = v131;
        ((void (*)(char *, char *, uint64_t))v151)(v136, v145, v113);
        uint64_t v117 = v154;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22696E6A8(0, *(void *)(v117 + 16) + 1, 1);
          uint64_t v117 = v154;
        }
        uint64_t v106 = (uint64_t)v143;
        uint64_t v53 = v152;
        uint64_t v76 = (uint64_t)v134;
        unint64_t v77 = (unint64_t)v149;
        unint64_t v119 = *(void *)(v117 + 16);
        unint64_t v118 = *(void *)(v117 + 24);
        if (v119 >= v118 >> 1)
        {
          sub_22696E6A8(v118 > 1, v119 + 1, 1);
          uint64_t v117 = v154;
        }
        *(void *)(v117 + 16) = v119 + 1;
        uint64_t v120 = v117 + v77 + v119 * v150;
        uint64_t v26 = v148;
        ((void (*)(uint64_t, char *, uint64_t))v151)(v120, v136, v148);
        *(void *)&long long v154 = v117;
      }
      ++v47;
      uint64_t v63 = v147;
      if (v144 == (char *)v47) {
        goto LABEL_65;
      }
    }
    __break(1u);
LABEL_68:
    unint64_t v77 = sub_226975E2C(0, *(void *)(v77 + 16) + 1, 1, v77);
  }
LABEL_65:
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v63)(v106, 1, 1, v26);
LABEL_66:
  swift_bridgeObjectRelease();
  sub_22696B8F0(v106, &qword_268148BC0);
  swift_bridgeObjectRelease();
  uint64_t v121 = v127;
  sub_226967DF0(8236, v154, v127);
  swift_release();
  unint64_t v122 = sub_22696FA30(10, 0xE100000000000000);
  sub_226967DF0(8238, v122, v128);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v121, v26);
}

id sub_2269758D8(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_2269B9450();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_2269B9450();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x22A65CD20](0, v3))
  {
    uint64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x22A65CD20](0, a2);
LABEL_22:
    uint64_t v13 = v12;
    sub_226978330(0, (unint64_t *)&unk_268149930);
    char v14 = sub_2269B9220();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x22A65CD20](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x22A65CD20](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = sub_2269B9220();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      uint64_t v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v27 = *v25++;
        uint64_t v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_2269B9220();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_226975BC4(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148E10);
  uint64_t v10 = *(void *)(sub_2269B82E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2269B9430();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2269B82E0() - 8);
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
    sub_226976E24(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_226975E2C(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148EB0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2269B9430();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0) - 8);
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
    sub_226976CC8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_22697609C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22697620C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22696DB9C((uint64_t)v12, *a3);
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
      sub_22696DB9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

id sub_226976170(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 < 0) {
    return (id)swift_bridgeObjectRetain();
  }
  else {
    return a1;
  }
}

void sub_226976180(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v8 = (a7 >> 5) & 3;
  switch(v8)
  {
    case 2:
      swift_bridgeObjectRelease();

      break;
    case 1:
      swift_bridgeObjectRelease();
      break;
    case 0:
      sub_2269761FC(a1, a2, a3, (uint64_t)a4, a5, a6, a7);
      break;
  }
}

void sub_2269761FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 < 0) {
    swift_bridgeObjectRelease();
  }
  else {
}
  }

uint64_t sub_22697620C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2269B92A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2269763C8(a5, a6);
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
  uint64_t v8 = sub_2269B9380();
  if (!v8)
  {
    sub_2269B9430();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2269B94A0();
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

uint64_t sub_2269763C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_226976460(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_226976640(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226976640(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226976460(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2269765D8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2269B9350();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2269B9430();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2269B8F90();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2269B94A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2269B9430();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2269765D8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148E68);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_226976640(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148E68);
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
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t sub_226976790(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2269B9450();
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
    uint64_t v5 = sub_2269B9450();
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
    unint64_t v4 = MEMORY[0x22A65CD30](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_22697695C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2269B9450();
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

  return sub_2269B9030();
}

uint64_t sub_22697695C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2269B9450();
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
    uint64_t v10 = sub_2269B9450();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22696B7B8(&qword_268148EC0, &qword_268148EB8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268148EB8);
          uint64_t v12 = sub_226976B90(v16, i, a3);
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
    sub_226978330(0, (unint64_t *)&unk_268149930);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

void (*sub_226976B90(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_226976C40(v6, a2, a3);
  return sub_226976BF8;
}

void sub_226976BF8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_226976C40(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A65CD20](a2, a3);
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
    return sub_226976CC0;
  }
  __break(1u);
  return result;
}

void sub_226976CC0(id *a1)
{
}

uint64_t sub_226976CC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0) - 8);
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
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t sub_226976E24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2269B82E0() - 8);
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
  uint64_t result = sub_2269B94A0();
  __break(1u);
  return result;
}

uint64_t _s11HoverTextUI0aB17PresentationEventV011ValueChangeE4TypeO03rawF0AESgSS_tcfC_0()
{
  unint64_t v0 = sub_2269B94C0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC) {
    return 12;
  }
  else {
    return v0;
  }
}

uint64_t sub_226976FC8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_226977000(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(unsigned char *)(a2 + 48) = *((unsigned char *)a1 + 48);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t sub_226977020(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22697707C(uint64_t a1)
{
  return a1;
}

unint64_t sub_2269770C0()
{
  unint64_t result = qword_268148E50;
  if (!qword_268148E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148E50);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for HoverTextPresentationEvent(char *a1, char **a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v33 = *a2;
    *(void *)a1 = *a2;
    a1 = &v33[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = (uint64_t)a2[1];
    uint64_t v9 = (uint64_t)a2[2];
    uint64_t v10 = a2[3];
    uint64_t v11 = (uint64_t)a2[4];
    uint64_t v12 = (uint64_t)a2[5];
    unsigned __int8 v13 = *((unsigned char *)a2 + 48);
    sub_2269772A4(*a2, v8, v9, v10, v11, v12, v13);
    *(void *)a1 = v7;
    *((void *)a1 + 1) = v8;
    *((void *)a1 + 2) = v9;
    *((void *)a1 + 3) = v10;
    *((void *)a1 + 4) = v11;
    *((void *)a1 + 5) = v12;
    a1[48] = v13;
    *(_WORD *)(a1 + 49) = *(_WORD *)((char *)a2 + 49);
    uint64_t v14 = a3[7];
    BOOL v15 = &a1[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_2269B82E0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    id v20 = &a1[v18];
    uint64_t v21 = (char **)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *(void *)id v20 = *v21;
    *((void *)v20 + 1) = v22;
    unint64_t v23 = &a1[v19];
    unint64_t v24 = (_OWORD *)((char *)a2 + v19);
    long long v25 = v24[1];
    *(_OWORD *)unint64_t v23 = *v24;
    *((_OWORD *)v23 + 1) = v25;
    uint64_t v26 = a3[10];
    uint64_t v27 = a3[11];
    uint64_t v28 = &a1[v26];
    uint64_t v29 = (uint64_t)a2 + v26;
    *(void *)uint64_t v28 = *(void *)v29;
    v28[8] = *(unsigned char *)(v29 + 8);
    *(_OWORD *)&a1[v27] = *(_OWORD *)((char *)a2 + v27);
    uint64_t v30 = a3[13];
    *(void *)&a1[a3[12]] = *(char **)((char *)a2 + a3[12]);
    uint64_t v31 = *(char **)((char *)a2 + v30);
    *(void *)&a1[v30] = v31;
    swift_bridgeObjectRetain();
    id v32 = v31;
  }
  return a1;
}

id sub_2269772A4(id result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7 = (a7 >> 5) & 3;
  switch(v7)
  {
    case 2:
      id v8 = a4;
      break;
    case 1:
      break;
    case 0:
      return sub_226976170(result, a2, a3, (uint64_t)a4, a5, a6, a7);
    default:
      return result;
  }

  return (id)swift_bridgeObjectRetain();
}

void destroy for HoverTextPresentationEvent(uint64_t a1, uint64_t a2)
{
  sub_226976180(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void **)(a1 + *(int *)(a2 + 52));
}

uint64_t initializeWithCopy for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void **)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 40);
  unsigned int v12 = *(unsigned __int8 *)(a2 + 48);
  sub_2269772A4(*(id *)a2, v7, v8, v9, v10, v11, v12);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  *(unsigned char *)(a1 + 48) = v12;
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v17);
  id v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (_OWORD *)(a1 + v18);
  unint64_t v23 = (_OWORD *)(a2 + v18);
  long long v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a3[10];
  uint64_t v26 = a3[11];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  uint64_t v29 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v30 = *(void **)(a2 + v29);
  *(void *)(a1 + v29) = v30;
  swift_bridgeObjectRetain();
  id v31 = v30;
  return a1;
}

uint64_t assignWithCopy for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void **)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 40);
  unsigned int v12 = *(unsigned __int8 *)(a2 + 48);
  sub_2269772A4(*(id *)a2, v7, v8, v9, v10, v11, v12);
  uint64_t v13 = *(void **)a1;
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = *(void **)(a1 + 24);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  unsigned int v19 = *(unsigned __int8 *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v12;
  sub_226976180(v13, v14, v15, v16, v17, v18, v19);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  uint64_t v20 = a3[7];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[8];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[9];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  void *v28 = *v29;
  v28[1] = v29[1];
  v28[2] = v29[2];
  v28[3] = v29[3];
  uint64_t v30 = a3[10];
  uint64_t v31 = a1 + v30;
  id v32 = (uint64_t *)(a2 + v30);
  uint64_t v33 = *v32;
  *(unsigned char *)(v31 + 8) = *((unsigned char *)v32 + 8);
  *(void *)uint64_t v31 = v33;
  uint64_t v34 = a3[11];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  *uint64_t v35 = *v36;
  v35[1] = v36[1];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v37 = a3[13];
  uint64_t v38 = *(void **)(a1 + v37);
  unsigned int v39 = *(void **)(a2 + v37);
  *(void *)(a1 + v37) = v39;
  id v40 = v39;

  return a1;
}

uint64_t initializeWithTake for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  unsigned int v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = (_OWORD *)(a2 + v11);
  long long v14 = v13[1];
  _OWORD *v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[10];
  uint64_t v16 = a3[11];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v19 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  return a1;
}

uint64_t assignWithTake for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(void **)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *(void **)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  unsigned int v14 = *(unsigned __int8 *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v6;
  sub_226976180(v7, v8, v9, v10, v11, v12, v14);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  void *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[9];
  uint64_t v25 = a3[10];
  uint64_t v26 = (_OWORD *)(a1 + v24);
  uint64_t v27 = (_OWORD *)(a2 + v24);
  long long v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = a1 + v25;
  uint64_t v30 = a2 + v25;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  *(void *)uint64_t v29 = *(void *)v30;
  uint64_t v31 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(void *)(a1 + v31) = *(void *)(a2 + v31);
  uint64_t v32 = a3[13];
  uint64_t v33 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = *(void *)(a2 + v32);

  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2269778F8);
}

uint64_t sub_2269778F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2269B82E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
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

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2269779E0);
}

uint64_t sub_2269779E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2269B82E0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 28);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = a2;
  }
  return result;
}

uint64_t sub_226977AA4()
{
  uint64_t result = sub_2269B82E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t destroy for HoverTextPresentationEvent.Error(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s11HoverTextUI26HoverTextPresentationEventV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for HoverTextPresentationEvent.Error(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HoverTextPresentationEvent.Error(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_226977DB0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_226977DC8(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTextPresentationEvent.Error()
{
  return &type metadata for HoverTextPresentationEvent.Error;
}

void destroy for HoverTextPresentationEvent.EventType(uint64_t a1)
{
}

uint64_t initializeWithCopy for HoverTextPresentationEvent.EventType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  unsigned int v9 = *(unsigned __int8 *)(a2 + 48);
  sub_2269772A4(*(id *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for HoverTextPresentationEvent.EventType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  unsigned int v9 = *(unsigned __int8 *)(a2 + 48);
  sub_2269772A4(*(id *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void **)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  int v13 = *(void **)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  unsigned int v16 = *(unsigned __int8 *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_226976180(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HoverTextPresentationEvent.EventType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  long long v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void **)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  unsigned int v11 = *(unsigned __int8 *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_226976180(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent.EventType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3D && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 61);
  }
  unsigned int v3 = ((2 * *(unsigned __int8 *)(a1 + 48)) & 0x3C | (*(unsigned __int8 *)(a1 + 48) >> 5) & 3) ^ 0x3F;
  if (v3 >= 0x3C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HoverTextPresentationEvent.EventType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3C)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 61;
    if (a3 >= 0x3D) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3D) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)__n128 result = 0u;
      *(unsigned char *)(result + 48) = 2 * ((((-a2 >> 2) & 0xF) - 16 * a2) & 0x3F);
    }
  }
  return result;
}

uint64_t sub_226978050(uint64_t a1)
{
  unsigned int v1 = (*(unsigned __int8 *)(a1 + 48) >> 5) & 3;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_22697806C(uint64_t result)
{
  *(unsigned char *)(result + 48) &= 0x9Fu;
  return result;
}

uint64_t sub_22697807C(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(unsigned char *)(result + 48) = *(unsigned char *)(result + 48) & 0x81 | (32 * a2);
  }
  else
  {
    *(void *)__n128 result = a2 - 3;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 40) = 0;
    *(unsigned char *)(result + 48) = 96;
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTextPresentationEvent.EventType()
{
  return &type metadata for HoverTextPresentationEvent.EventType;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HoverTextPresentationEvent.ValueChangeEventType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HoverTextPresentationEvent.ValueChangeEventType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x226978230);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

uint64_t sub_226978258(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_226978260(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HoverTextPresentationEvent.ValueChangeEventType()
{
  return &type metadata for HoverTextPresentationEvent.ValueChangeEventType;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2269782C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226978330(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22697836C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for HoverTextLayout()
{
  return swift_release();
}

uint64_t initializeWithCopy for HoverTextLayout(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for HoverTextLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = v5;
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HoverTextLayout(uint64_t a1, uint64_t a2)
{
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextLayout(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverTextLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTextLayout()
{
  return &type metadata for HoverTextLayout;
}

void sub_226978594()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = **v0;
  long long v4 = (uint64_t (*)(uint64_t, uint64_t *))v2[18];
  if (v4(v3, v2))
  {
    if (v4(v3, v2) == 1)
    {
      long long v5 = *(uint64_t (**)(void))(*v1 + 128);
      uint64_t v6 = v5();
      ((void (*)(uint64_t))v5)(v6);
      CGRectMake_0();
    }
  }
  else
  {
    (*(void (**)(void))(*v1 + 128))();
    CGRectMake_0();
  }
}

double sub_2269786DC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v44 = CGRectUnion(*(CGRect *)&a1, *(CGRect *)&a5);
  CGFloat x = v44.origin.x;
  CGFloat v43 = a8;
  CGFloat width = v44.size.width;
  CGFloat y = v44.origin.y;
  CGFloat v35 = a7;
  CGFloat rect = v44.size.height;
  CGFloat v33 = a5;
  CGFloat v34 = a6;
  v44.origin.CGFloat x = a5;
  v44.origin.CGFloat y = a6;
  v44.size.CGFloat width = a7;
  v44.size.CGFloat height = a8;
  double MinX = CGRectGetMinX(v44);
  CGFloat v39 = a1;
  CGFloat v40 = a2;
  v45.origin.CGFloat x = a1;
  v45.origin.CGFloat y = a2;
  CGFloat v17 = a3;
  v45.size.CGFloat width = a3;
  CGFloat v18 = a4;
  v45.size.CGFloat height = a4;
  if (MinX >= CGRectGetMinX(v45))
  {
    CGFloat v26 = v33;
    CGFloat v25 = v34;
    v48.origin.CGFloat x = v33;
    v48.origin.CGFloat y = v34;
    CGFloat v24 = v35;
    v48.size.CGFloat width = v35;
    v48.size.CGFloat height = v43;
    double MaxX = CGRectGetMaxX(v48);
    v49.origin.CGFloat x = v39;
    CGFloat v20 = v40;
    v49.origin.CGFloat y = v40;
    CGFloat v21 = v17;
    CGFloat v22 = v39;
    v49.size.CGFloat width = v21;
    v49.size.CGFloat height = v18;
    CGFloat v28 = CGRectGetMaxX(v49);
    double v23 = 0.0;
    if (v28 < MaxX)
    {
      v50.origin.CGFloat x = v33;
      v50.origin.CGFloat y = v34;
      v50.size.CGFloat width = v35;
      v50.size.CGFloat height = v43;
      double v29 = CGRectGetMaxX(v50);
      v51.origin.CGFloat x = v39;
      v51.origin.CGFloat y = v40;
      v51.size.CGFloat width = v21;
      v51.size.CGFloat height = v18;
      double v23 = v29 - CGRectGetMaxX(v51);
    }
  }
  else
  {
    v46.origin.CGFloat x = x;
    v46.size.CGFloat width = width;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat height = rect;
    double v19 = CGRectGetMinX(v46);
    v47.origin.CGFloat x = a1;
    CGFloat v20 = v40;
    v47.origin.CGFloat y = v40;
    CGFloat v21 = v17;
    CGFloat v22 = a1;
    v47.size.CGFloat width = v21;
    v47.size.CGFloat height = v18;
    double v23 = v19 - CGRectGetMinX(v47);
    CGFloat v25 = a6;
    CGFloat v24 = v35;
    CGFloat v26 = v33;
  }
  double v41 = v23;
  v52.origin.CGFloat x = v26;
  v52.origin.CGFloat y = v25;
  v52.size.CGFloat width = v24;
  v52.size.CGFloat height = v43;
  double MinY = CGRectGetMinY(v52);
  v53.origin.CGFloat x = v22;
  v53.origin.CGFloat y = v20;
  v53.size.CGFloat width = v21;
  v53.size.CGFloat height = v18;
  if (MinY >= CGRectGetMinY(v53))
  {
    v56.origin.CGFloat x = v26;
    v56.origin.CGFloat y = v25;
    v56.size.CGFloat width = v24;
    v56.size.CGFloat height = v43;
    double MaxY = CGRectGetMaxY(v56);
    v57.origin.CGFloat x = v22;
    v57.origin.CGFloat y = v20;
    v57.size.CGFloat width = v21;
    v57.size.CGFloat height = v18;
    if (CGRectGetMaxY(v57) < MaxY)
    {
      v58.origin.CGFloat x = v26;
      v58.origin.CGFloat y = v25;
      v58.size.CGFloat width = v24;
      v58.size.CGFloat height = v43;
      CGRectGetMaxY(v58);
      v59.origin.CGFloat x = v22;
      v59.origin.CGFloat y = v20;
      v59.size.CGFloat width = v21;
      v59.size.CGFloat height = v18;
      CGRectGetMaxY(v59);
    }
  }
  else
  {
    v54.origin.CGFloat x = x;
    v54.size.CGFloat width = width;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat height = rect;
    CGRectGetMinY(v54);
    v55.origin.CGFloat x = v22;
    v55.origin.CGFloat y = v20;
    v55.size.CGFloat width = v21;
    v55.size.CGFloat height = v18;
    CGRectGetMinY(v55);
  }
  return v41;
}

double sub_226978914(uint64_t a1, char a2)
{
  double result = *(double *)&a1;
  if (a2) {
    return 10.0;
  }
  return result;
}

uint64_t sub_226978934(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_2269789E0(a1, a2 & 1, a3, a4 & 1);
}

unint64_t sub_22697898C()
{
  unint64_t result = qword_268148EC8;
  if (!qword_268148EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148EC8);
  }
  return result;
}

uint64_t sub_2269789E0(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148DE8);
  MEMORY[0x270FA5388](v9 - 8);
  unsigned int v11 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2269B86F0();
  double v13 = *(double *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22696DC78((uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)&v13 + 48))(v11, 1, v12) == 1) {
    return sub_22696E420((uint64_t)v11);
  }
  double v115 = v13;
  uint64_t v17 = (*(uint64_t (**)(char *, char *, uint64_t))(*(void *)&v13 + 32))(v15, v11, v12);
  if (a2) {
    double v18 = 10.0;
  }
  else {
    double v18 = *(double *)&a1;
  }
  if (a4) {
    double v19 = 10.0;
  }
  else {
    double v19 = *(double *)&a3;
  }
  CGFloat v20 = *(uint64_t **)v4;
  uint64_t v21 = *(void *)(v4 + 8);
  uint64_t v22 = **(void **)v4;
  double v23 = *(uint64_t (**)(uint64_t))(v22 + 152);
  uint64_t v24 = v23(v17);
  double v26 = v25;
  double v27 = ((double (*)(uint64_t))v23)(v24);
  double v28 = UIEdgeInsetsInsetRect(v26, v27, v18, v19, 10.0, 10.0);
  CGFloat v30 = v29;
  double v32 = v31;
  double v34 = v33;
  type metadata accessor for HoverTypingStore();
  uint64_t v35 = swift_dynamicCastClass();
  uint64_t v113 = v12;
  __n128 v102 = (void (*)(void))v23;
  if (!v35)
  {
    unint64_t v118 = v20;
    uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 144);
    if (v36(v22, v21))
    {
      unint64_t v118 = v20;
      v36(v22, v21);
    }
  }
  LOBYTE(v118) = 0;
  char v117 = 0;
  sub_2269B86D0();
  double v107 = v37;
  double v39 = v38;
  sub_226978594();
  double v44 = UIEdgeInsetsInsetRect(v40, v41, v42, v43, -15.0, -15.0);
  double v47 = v44;
  double v49 = v48;
  char v50 = *(unsigned char *)(v4 + 64);
  CGFloat v112 = v34;
  CGFloat v116 = v32;
  CGFloat v51 = v28;
  if (v50)
  {
    double v52 = v46;
    double v53 = v44;
    double v54 = v45;
    sub_2269B8E00();
    double v45 = v54;
    double v47 = v53;
    double v46 = v52;
  }
  else
  {
    double v55 = *(double *)(v4 + 48);
    double v56 = *(double *)(v4 + 56);
  }
  uint64_t v57 = v113;
  double v58 = v115;
  double v108 = v46;
  CGFloat v106 = v47;
  CGFloat v105 = v45;
  double v59 = v47 + v45 * v55;
  double v60 = v49 + v46 * v56;
  double v109 = v49;
  CGFloat v110 = v28;
  double v61 = 1.0 - v55;
  double v62 = v107;
  double v63 = v59 - v107 * (1.0 - v55);
  double v114 = v60;
  double v115 = 1.0 - v56;
  double v64 = v39 * (1.0 - v56);
  v125.origin.CGFloat y = v60 - v64;
  v119.origin.CGFloat x = v51;
  CGFloat v111 = v30;
  v119.origin.CGFloat y = v30;
  v119.size.CGFloat width = v116;
  CGFloat v65 = v112;
  v119.size.CGFloat height = v112;
  v125.origin.CGFloat x = v63;
  CGFloat y = v125.origin.y;
  v125.size.CGFloat width = v107;
  v125.size.CGFloat height = v39;
  if (CGRectContainsRect(v119, v125))
  {
    double v67 = v63;
    CGFloat v111 = v39;
    double v68 = y;
  }
  else
  {
    double v103 = v64;
    CGFloat v69 = v116;
    CGFloat v104 = y;
    double v70 = sub_2269786DC(v110, v111, v116, v65, v63, y, v62, v39);
    double v99 = v71;
    CGFloat v72 = -v70;
    v120.origin.CGFloat x = v63;
    v120.origin.CGFloat y = y;
    v120.size.CGFloat width = v62;
    v120.size.CGFloat height = v39;
    CGRect v121 = CGRectOffset(v120, v72, 0.0);
    double v73 = v106;
    v126.origin.CGFloat x = v106;
    v126.size.CGFloat height = v108;
    v126.origin.CGFloat y = v109;
    double v74 = v105;
    v126.size.CGFloat width = v105;
    if (CGRectIntersectsRect(v121, v126))
    {
      double v59 = v73 + v74 * v61;
      double v61 = 1.0 - v61;
    }
    double v100 = v61;
    double v75 = v62 * v61;
    v127.origin.CGFloat x = v59 - v75;
    CGFloat v77 = v110;
    CGFloat v76 = v111;
    v122.origin.CGFloat x = v110;
    v122.origin.CGFloat y = v111;
    v122.size.CGFloat width = v69;
    v122.size.CGFloat height = v65;
    CGFloat v98 = v59 - v75;
    v127.origin.CGFloat y = v104;
    v127.size.CGFloat width = v62;
    v127.size.CGFloat height = v39;
    BOOL v78 = CGRectContainsRect(v122, v127);
    double v97 = v75;
    if (v78)
    {
      double v101 = v59;
      double v79 = v115;
      double v80 = v98;
      double v68 = v104;
    }
    else
    {
      double v101 = v59 - sub_2269786DC(v77, v76, v69, v65, v98, v104, v62, v39);
      double v80 = v101 - v75;
      double v114 = v114 + 0.0;
      double v68 = v114 - v103;
      double v79 = v115;
    }
    v123.origin.CGFloat x = v80;
    v123.origin.CGFloat y = v68;
    v123.size.CGFloat width = v62;
    v123.size.CGFloat height = v39;
    CGRect v124 = CGRectOffset(v123, 0.0, -v99);
    v128.origin.CGFloat x = v106;
    v128.size.CGFloat height = v108;
    v128.origin.CGFloat y = v109;
    v128.size.CGFloat width = v105;
    if (CGRectIntersectsRect(v124, v128))
    {
      if (swift_dynamicCastClass()) {
        v102();
      }
      else {
        double v81 = v109 + v108 * v79;
      }
      double v82 = v111;
      CGFloat v83 = v112;
      CGFloat v84 = v116;
      double v85 = v110;
      double v114 = v81;
      double v115 = 1.0 - v79;
      double v103 = v39 * (1.0 - v79);
      double v68 = v81 - v103;
    }
    else
    {
      double v82 = v111;
      CGFloat v83 = v112;
      CGFloat v84 = v116;
      double v85 = v110;
    }
    double v86 = v85;
    CGFloat v87 = v82;
    CGFloat v88 = v84;
    CGFloat v89 = v85;
    CGFloat v90 = v83;
    v129.origin.CGFloat x = v80;
    v129.origin.CGFloat y = v68;
    v129.size.CGFloat width = v62;
    v129.size.CGFloat height = v39;
    BOOL v91 = CGRectContainsRect(*(CGRect *)(&v82 - 1), v129);
    CGFloat v111 = v39;
    if (v91)
    {
      double v67 = v80;
    }
    else
    {
      sub_2269786DC(v89, v87, v84, v83, v80, v68, v62, v39);
      double v67 = v101 + 0.0 - v97;
      double v68 = v114 - v92 - v103;
    }
  }
  uint64_t v93 = swift_dynamicCastClass();
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *((void *)&v97 - 6) = v94;
    *(&v97 - 5) = v67;
    *(&v97 - 4) = v68;
    CGFloat v96 = v111;
    *(&v97 - 3) = v62;
    *(&v97 - 2) = v96;
    unint64_t v118 = (void *)v94;
    sub_2269791D0(v4);
    sub_22696AF4C();
    sub_2269B8490();
    swift_release();
    sub_2269791FC(v4);
    uint64_t v57 = v113;
  }
  LOBYTE(v118) = 0;
  char v117 = 0;
  sub_2269B86E0();
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)&v58 + 8))(v15, v57);
}

double *sub_2269791AC()
{
  return sub_22699CDB8(*(double **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_2269791D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269791FC(uint64_t a1)
{
  return a1;
}

double CGRectMake_0()
{
  return 0.0;
}

ValueMetadata *type metadata accessor for HoverTypingCursorView()
{
  return &type metadata for HoverTypingCursorView;
}

uint64_t sub_22697924C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226979268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v41 = sub_2269B8900();
  MEMORY[0x270FA5388](v41);
  v39[1] = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2269B8620();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v42 = v4;
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148ED0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  uint64_t v45 = v9;
  MEMORY[0x270FA5388](v8);
  unsigned int v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148ED8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  uint64_t v47 = v13;
  MEMORY[0x270FA5388](v12);
  double v40 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148EE0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148EE8);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148EF0);
  uint64_t v23 = v22 - 8;
  MEMORY[0x270FA5388](v22);
  double v25 = (char *)v39 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_268148EF8);
  MEMORY[0x270FA5388](v39[0]);
  double v27 = (char *)v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v17 = sub_2269B8830();
  *((void *)v17 + 1) = 0;
  v17[16] = 1;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F00);
  sub_226979960(a1, (uint64_t)&v17[*(int *)(v28 + 44)]);
  sub_22696B88C((uint64_t)v17, (uint64_t)v21, &qword_268148EE0);
  v21[*(int *)(v19 + 44)] = 0;
  sub_22696B8F0((uint64_t)v17, &qword_268148EE0);
  swift_getKeyPath();
  *(void *)&long long v49 = a1;
  sub_226979CF4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  CGRectGetHeight(*(CGRect *)(a1 + 152));
  sub_2269B8D50();
  sub_2269B8690();
  sub_22696B88C((uint64_t)v21, (uint64_t)v25, &qword_268148EE8);
  double v29 = &v25[*(int *)(v23 + 44)];
  long long v30 = v50;
  *(_OWORD *)double v29 = v49;
  *((_OWORD *)v29 + 1) = v30;
  *((_OWORD *)v29 + 2) = v51;
  sub_22696B8F0((uint64_t)v21, &qword_268148EE8);
  sub_22699B308();
  uint64_t v32 = v31;
  sub_22696B88C((uint64_t)v25, (uint64_t)v27, &qword_268148EF0);
  double v33 = &v27[*(int *)(v39[0] + 36)];
  *(void *)double v33 = v32;
  *((void *)v33 + 1) = 0;
  sub_22696B8F0((uint64_t)v25, &qword_268148EF0);
  sub_2269B8920();
  sub_2269B85F0();
  sub_226979CF4(&qword_268148F08, MEMORY[0x263F185B8]);
  sub_226979CF4(&qword_268148F10, MEMORY[0x263F18588]);
  swift_retain();
  uint64_t v34 = v42;
  sub_2269B8D30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v34);
  sub_22696B7B8(&qword_268148F18, &qword_268148ED0);
  swift_retain();
  uint64_t v35 = v40;
  uint64_t v36 = v44;
  sub_2269B8D20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v36);
  sub_2269B8640();
  sub_226979D70(&qword_268148F20, &qword_268148EF8, (void (*)(void))sub_226979D40);
  sub_22696B7B8(&qword_268148F50, &qword_268148ED8);
  uint64_t v37 = v46;
  sub_2269B8B00();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v35, v37);
  return sub_22696B8F0((uint64_t)v27, &qword_268148EF8);
}

uint64_t sub_226979960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v28[0] = a2;
  uint64_t v3 = sub_2269B8CE0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F58);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F60);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v28 - v15;
  uint64_t v17 = *MEMORY[0x263F19860];
  uint64_t v18 = sub_2269B8860();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v5, v17, v18);
  swift_getKeyPath();
  *(void *)&long long v29 = a1;
  sub_226979CF4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v19 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  CTFontGetAscent(v19);
  CTFontGetDescent(v19);
  CTFontGetLeading(v19);

  sub_2269B8D50();
  sub_2269B8690();
  sub_226979EB8((uint64_t)v5, (uint64_t)v9);
  uint64_t v20 = &v9[*(int *)(v7 + 44)];
  long long v21 = v30;
  *(_OWORD *)uint64_t v20 = v29;
  *((_OWORD *)v20 + 1) = v21;
  *((_OWORD *)v20 + 2) = v31;
  sub_226979F1C((uint64_t)v5);
  swift_getKeyPath();
  v28[1] = a1;
  sub_2269B84A0();
  swift_release();
  uint64_t v22 = *(void *)(a1 + 104);
  sub_22696B88C((uint64_t)v9, (uint64_t)v14, &qword_268148F58);
  *(void *)&v14[*(int *)(v11 + 44)] = v22;
  swift_retain();
  sub_22696B8F0((uint64_t)v9, &qword_268148F58);
  sub_226979F80((uint64_t)v14, (uint64_t)v16);
  sub_22696B88C((uint64_t)v16, (uint64_t)v14, &qword_268148F60);
  uint64_t v23 = v28[0];
  *(void *)v28[0] = 0;
  *(unsigned char *)(v23 + 8) = 1;
  uint64_t v24 = v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F68);
  sub_22696B88C((uint64_t)v14, v24 + *(int *)(v25 + 48), &qword_268148F60);
  uint64_t v26 = v24 + *(int *)(v25 + 64);
  *(void *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 8) = 1;
  sub_22696B8F0((uint64_t)v16, &qword_268148F60);
  return sub_22696B8F0((uint64_t)v14, &qword_268148F60);
}

uint64_t sub_226979CE0@<X0>(uint64_t a1@<X8>)
{
  return sub_226979268(*v1, a1);
}

uint64_t sub_226979CF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226979D40()
{
  return sub_226979D70(&qword_268148F28, &qword_268148EF0, (void (*)(void))sub_226979DEC);
}

uint64_t sub_226979D70(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_226979DEC()
{
  unint64_t result = qword_268148F30;
  if (!qword_268148F30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148EE8);
    sub_22696B7B8(&qword_268148F38, &qword_268148EE0);
    sub_22696B7B8(&qword_268148F40, &qword_268148F48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148F30);
  }
  return result;
}

uint64_t sub_226979EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2269B8CE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226979F1C(uint64_t a1)
{
  uint64_t v2 = sub_2269B8CE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226979F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226979FE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22697A0B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F88);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2269B91B0();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F90);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  uint64_t v31 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F98);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v32 = v12;
  uint64_t v33 = v13;
  MEMORY[0x270FA5388](v12);
  double v27 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  long long v15 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)(v0 + 32) = *MEMORY[0x263F834E8];
  *(_OWORD *)(v0 + 48) = v15;
  *(void *)(v0 + 64) = 1;
  *(void *)(v0 + 72) = sub_226980A3C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148FA0);
  swift_allocObject();
  uint64_t v16 = (void *)sub_2269B8570();
  *(void *)(v0 + 88) = v16;
  id v35 = v16;
  swift_retain();
  sub_2269B91A0();
  sub_22697B764();
  id v34 = (id)sub_2269B91D0();
  uint64_t v17 = sub_2269B9190();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  uint64_t v26 = v18 + 56;
  v25(v4, 1, 1, v17);
  sub_22696B7B8(&qword_268148FA8, &qword_268148FA0);
  sub_22697B7A4();
  sub_2269B8590();
  sub_22696B8F0((uint64_t)v4, &qword_268148F88);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
  swift_release();
  id v35 = (id)sub_2269B91D0();
  v25(v4, 1, 1, v17);
  sub_22696B7B8(&qword_268148FB8, &qword_268148F90);
  uint64_t v19 = v27;
  uint64_t v20 = v30;
  sub_2269B8580();
  sub_22696B8F0((uint64_t)v4, &qword_268148F88);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v20);
  swift_allocObject();
  swift_weakInit();
  sub_22696B7B8(&qword_268148FC0, &qword_268148F98);
  uint64_t v21 = v32;
  uint64_t v22 = sub_2269B85A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v21);
  *(void *)(v1 + 80) = v22;
  swift_release();
  return v1;
}

void sub_22697A574(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_2269B8550();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v30 - v13;
  long long v15 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v15)
  {
    uint64_t v16 = v15;
    if (a1)
    {
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = a2;
      *(void *)(v17 + 24) = a3;
      id v18 = a1;
      swift_beginAccess();
      uint64_t v19 = (__CFString *)v18;
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v30 = v4[9];
      v4[9] = 0x8000000000000000;
      sub_2269B6AEC((uint64_t)sub_22697B35C, v17, v19, isUniquelyReferenced_nonNull_native);
      v4[9] = v30;

      swift_bridgeObjectRelease();
      swift_endAccess();
      CFNotificationCenterAddObserver(v16, v4, (CFNotificationCallback)sub_22697AFB4, v19, 0, (CFNotificationSuspensionBehavior)HTSuspensionBehavior);
    }
    else
    {
      uint64_t v25 = sub_2269B8530();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v25, v8);
      uint64_t v26 = sub_2269B8540();
      os_log_type_t v27 = sub_2269B9160();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_22695C000, v26, v27, "Notification name nil", v28, 2u);
        MEMORY[0x22A65DA10](v28, -1, -1);
        uint64_t v29 = v16;
      }
      else
      {
        uint64_t v29 = v26;
        uint64_t v26 = v16;
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  else
  {
    uint64_t v21 = sub_2269B8530();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v21, v8);
    uint64_t v22 = sub_2269B8540();
    os_log_type_t v23 = sub_2269B9160();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_22695C000, v22, v23, "Darwin Center unavailable", v24, 2u);
      MEMORY[0x22A65DA10](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

double sub_22697A8E4()
{
  return *(double *)(v0 + 16);
}

double sub_22697A8EC()
{
  return *(double *)(v0 + 32);
}

double sub_22697A8F8(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(double *)(v4 + 16) = a3;
  *(double *)(v4 + 24) = a4;
  *(void *)(v4 + 64) = a1;
  sub_22697B2BC(a2, (uint64_t)v7);
  if ((v8 & 1) == 0)
  {
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)(v4 + 32) = v7[0];
    *(_OWORD *)(v4 + 48) = v6;
  }
  return result;
}

uint64_t sub_22697A940(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong
    && (v9[0] = Strong,
        type metadata accessor for HoverStoreCommon(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268148FD0),
        (swift_dynamicCast() & 1) != 0))
  {
    if (*((void *)&v7 + 1))
    {
      sub_22697B83C(&v6, (uint64_t)v9);
      uint64_t v3 = v10;
      uint64_t v4 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 272))(v1, v3, v4);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
    }
  }
  else
  {
    uint64_t v8 = 0;
    long long v6 = 0u;
    long long v7 = 0u;
  }
  return sub_22696B8F0((uint64_t)&v6, &qword_268148FC8);
}

void sub_22697AA38()
{
  uint64_t v1 = CFNotificationCenterGetDarwinNotifyCenter();
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v3 = v0[9];
  uint64_t v4 = v3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_6;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v8) {
      goto LABEL_22;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v8) {
        goto LABEL_22;
      }
      unint64_t v13 = *(void *)(v4 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v8) {
          goto LABEL_22;
        }
        unint64_t v13 = *(void *)(v4 + 8 * v9);
        if (!v13) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v7 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_6:
    CFNotificationCenterRemoveObserver(v2, v0, *(CFNotificationName *)(*(void *)(v3 + 48) + 8 * v11), 0);
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v8)
  {
LABEL_22:
    swift_release();

    return;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_22;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_22697ABB8()
{
  sub_22697AA38();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for HoverStoreCommon()
{
  return self;
}

uint64_t getEnumTagSinglePayload for HoverStoreCommon.Feature(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HoverStoreCommon.Feature(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x22697AD84);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_22697ADAC(unsigned char *result, char a2)
{
  *double result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HoverStoreCommon.Feature()
{
  return &type metadata for HoverStoreCommon.Feature;
}

uint64_t getEnumTagSinglePayload for HoverStoreCommon.StyleItem(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HoverStoreCommon.StyleItem(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *double result = a2 + 18;
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
        JUMPOUT(0x22697AF24);
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
          *double result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverStoreCommon.StyleItem()
{
  return &type metadata for HoverStoreCommon.StyleItem;
}

unint64_t sub_22697AF60()
{
  unint64_t result = qword_268148F70;
  if (!qword_268148F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148F70);
  }
  return result;
}

void sub_22697AFB4(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a3;
  id v10 = a5;
  sub_22697B388(a2, a3);
}

BOOL sub_22697B034(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22697B04C()
{
  return sub_2269B95D0();
}

uint64_t sub_22697B094()
{
  return sub_2269B9590();
}

uint64_t sub_22697B0C0()
{
  return sub_2269B95D0();
}

BOOL sub_22697B104(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_22697B11C()
{
  unint64_t result = qword_268148F78;
  if (!qword_268148F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148F78);
  }
  return result;
}

uint64_t sub_22697B170(char a1)
{
  switch(a1)
  {
    case 3:
    case 4:
    case 10:
    case 11:
    case 12:
      uint64_t result = sub_2269B8BB0();
      break;
    case 5:
    case 13:
      id v3 = objc_msgSend(self, sel_systemBackgroundColor);
      MEMORY[0x22A65C580](v3);
      id v4 = objc_msgSend(self, sel_sharedInstance);
      objc_msgSend(v4, sel_hoverTextBackgroundOpacity);

      uint64_t v5 = sub_2269B8BA0();
      swift_release();
      uint64_t result = v5;
      break;
    case 16:
      uint64_t result = sub_2269B8B50();
      break;
    case 17:
      uint64_t result = sub_2269B8B60();
      break;
    default:
      uint64_t result = MEMORY[0x270F04498]();
      break;
  }
  return result;
}

uint64_t sub_22697B2BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148F80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22697B324()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22697B35C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_22697B388(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2269B8550();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  unint64_t v11 = (char *)v34 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)v34 - v12;
  if (a1)
  {
    if (a2)
    {
      swift_retain();
      swift_beginAccess();
      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v15 = *(void *)(v14 + 16);
      uint64_t v16 = a2;
      if (v15)
      {
        swift_bridgeObjectRetain();
        unint64_t v17 = sub_2269B549C((uint64_t)v16);
        if (v18)
        {
          uint64_t v19 = *(void (**)(void *))(*(void *)(v14 + 56) + 16 * v17);
          swift_retain();
          swift_bridgeObjectRelease();
          v34[0] = a1;
          v19(v34);

          swift_release();
          return swift_release();
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v29 = sub_2269B8530();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v29, v4);
      uint64_t v30 = sub_2269B8540();
      os_log_type_t v31 = sub_2269B9160();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_22695C000, v30, v31, "No handler found ", v32, 2u);
        MEMORY[0x22A65DA10](v32, -1, -1);
        uint64_t v33 = v16;
      }
      else
      {
        uint64_t v33 = v30;
        uint64_t v30 = v16;
      }

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      uint64_t v25 = sub_2269B8530();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v25, v4);
      uint64_t v26 = sub_2269B8540();
      os_log_type_t v27 = sub_2269B9160();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_22695C000, v26, v27, "cfNotificationName for darwin callback handler not found", v28, 2u);
        MEMORY[0x22A65DA10](v28, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    }
  }
  else
  {
    uint64_t v21 = sub_2269B8530();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v21, v4);
    uint64_t v22 = sub_2269B8540();
    uint64_t v23 = sub_2269B9160();
    if (os_log_type_enabled(v22, (os_log_type_t)v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_22695C000, v22, (os_log_type_t)v23, "Observer for darwin callback handler not found", v24, 2u);
      MEMORY[0x22A65DA10](v24, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
}

unint64_t sub_22697B764()
{
  unint64_t result = qword_268149200;
  if (!qword_268149200)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268149200);
  }
  return result;
}

unint64_t sub_22697B7A4()
{
  unint64_t result = qword_268148FB0;
  if (!qword_268148FB0)
  {
    sub_22697B764();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268148FB0);
  }
  return result;
}

uint64_t sub_22697B7FC()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22697B834(unsigned __int8 *a1)
{
  return sub_22697A940(a1);
}

uint64_t sub_22697B83C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
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

uint64_t sub_22697B898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  char v5 = a3 & 1;
  *(unsigned char *)(a5 + 16) = v5;
  *(void *)(a5 + 24) = a4;
  sub_22697F76C(a1, a2, v5);

  return swift_bridgeObjectRetain();
}

double HoverTextMarqueeingContentView.init(delay:rate:multiplier:startingPosition:marqueeBegan:marqueeCompleted:content:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>)
{
  *(void *)a8 = 0x4028000000000000;
  uint64_t v22 = (int *)type metadata accessor for HoverTextMarqueeingContentView();
  uint64_t v23 = (uint64_t *)(a8 + v22[16]);
  *uint64_t v23 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = (void *)(a8 + v22[17]);
  uint64_t v25 = property wrapper backing initializer of HoverTextMarqueeingContentView.contentSize();
  *uint64_t v24 = v26;
  v24[1] = v27;
  void v24[2] = v25;
  uint64_t v28 = (_OWORD *)(a8 + v22[18]);
  sub_2269B8C40();
  _OWORD *v28 = v31;
  uint64_t v29 = v22[19];
  sub_2269B8C40();
  double result = *(double *)&v31;
  *(_OWORD *)(a8 + v29) = v31;
  *(double *)(a8 + 8) = a9;
  *(double *)(a8 + 16) = a10;
  *(double *)(a8 + 24) = a11;
  *(void *)(a8 + 72) = a6;
  *(void *)(a8 + 80) = a7;
  *(void *)(a8 + 32) = a1;
  *(void *)(a8 + 40) = a2;
  *(void *)(a8 + 48) = a3;
  *(void *)(a8 + 56) = a4;
  *(void *)(a8 + 64) = a5;
  return result;
}

uint64_t type metadata accessor for HoverTextMarqueeingContentView()
{
  return __swift_instantiateGenericMetadata();
}

double sub_22697BA50()
{
  uint64_t v0 = sub_2269B8820();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - v5;
  sub_2269B8810();
  sub_2269B87E0();
  double v8 = v7;
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v6, v0);
  sub_2269B8810();
  sub_2269B87E0();
  double v11 = v10;
  v9(v4, v0);
  return v8 + v11;
}

uint64_t sub_22697BB74()
{
  return sub_2269B87F0();
}

uint64_t sub_22697BB98()
{
  return sub_2269B87F0();
}

uint64_t sub_22697BBBC(uint64_t a1)
{
  uint64_t v2 = sub_2269B87A0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2269B8800();
}

uint64_t property wrapper backing initializer of HoverTextMarqueeingContentView.contentSize()
{
  type metadata accessor for CGSize(0);
  sub_2269B8C40();
  return v1;
}

uint64_t property wrapper backing initializer of HoverTextMarqueeingContentView.needsScrolling()
{
  sub_2269B8C40();
  return v1;
}

uint64_t property wrapper backing initializer of HoverTextMarqueeingContentView.resetScrollingID()
{
  sub_2269B8C40();
  return v1;
}

double sub_22697BD3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149108);
  sub_2269B8C50();
  return v1;
}

uint64_t HoverTextMarqueeingContentView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148FE8);
  uint64_t v3 = MEMORY[0x270FA5388](v65);
  double v64 = (_OWORD *)((char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v60 = *(void *)(a1 - 8);
  uint64_t v61 = *(void *)(v60 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = *(void *)(a1 + 16);
  sub_2269B87B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148FF0);
  uint64_t v7 = sub_2269B87B0();
  type metadata accessor for CGSize(255);
  uint64_t v9 = v8;
  uint64_t v68 = *(void *)(a1 + 24);
  uint64_t v84 = v68;
  uint64_t v85 = MEMORY[0x263F190E0];
  uint64_t v10 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = sub_22696B7B8(&qword_268148FF8, &qword_268148FF0);
  uint64_t v82 = WitnessTable;
  uint64_t v83 = v12;
  uint64_t v13 = v10;
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v15 = sub_22698036C(&qword_268149000, type metadata accessor for CGSize);
  uint64_t v78 = v7;
  uint64_t v79 = v9;
  uint64_t v80 = v14;
  uint64_t v81 = v15;
  uint64_t v62 = v15;
  swift_getOpaqueTypeMetadata2();
  uint64_t v16 = sub_2269B87B0();
  uint64_t v78 = v7;
  uint64_t v79 = v9;
  uint64_t v80 = v14;
  uint64_t v81 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = MEMORY[0x263F189A8];
  uint64_t v57 = v13;
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v78 = v16;
  uint64_t v79 = MEMORY[0x263F8D6C8];
  uint64_t v80 = v17;
  uint64_t v81 = MEMORY[0x263F8D6D8];
  sub_2269B8C80();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149008);
  sub_2269B87B0();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = sub_22696B7B8(&qword_268149010, &qword_268149008);
  uint64_t v74 = v18;
  uint64_t v75 = v19;
  swift_getWitnessTable();
  uint64_t v52 = sub_2269B8750();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149018);
  uint64_t v54 = sub_2269B87B0();
  uint64_t v58 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  double v67 = (char *)v50 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149020);
  uint64_t v56 = sub_2269B87B0();
  uint64_t v59 = *(void *)(v56 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v56);
  double v53 = (char *)v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  double v55 = (char *)v50 - v23;
  uint64_t v24 = v60;
  long long v51 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
  uint64_t v25 = v6;
  uint64_t v26 = v6;
  uint64_t v27 = v63;
  uint64_t v28 = a1;
  v51(v26, v63, a1);
  uint64_t v29 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v30 = (v29 + 32) & ~v29;
  v61 += v30;
  v50[1] = v29 | 7;
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = v68;
  *(void *)(v31 + 16) = v69;
  *(void *)(v31 + 24) = v32;
  uint64_t v60 = *(void *)(v24 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v60)(v31 + v30, v25, v28);
  uint64_t v78 = sub_2269B8740();
  uint64_t v79 = v33;
  id v34 = v64;
  uint64_t v35 = v28;
  sub_22697D6B8(v64);
  uint64_t v36 = swift_getWitnessTable();
  sub_22697DA48();
  sub_2269B8AE0();
  sub_22696B8F0((uint64_t)v34, &qword_268148FE8);
  swift_release();
  v51(v25, v27, v35);
  uint64_t v37 = swift_allocObject();
  uint64_t v38 = v68;
  *(void *)(v37 + 16) = v69;
  *(void *)(v37 + 24) = v38;
  ((void (*)(uint64_t, char *, uint64_t))v60)(v37 + v30, v25, v35);
  uint64_t v39 = sub_22696B7B8(&qword_268149060, &qword_268149018);
  uint64_t v72 = v36;
  uint64_t v73 = v39;
  uint64_t v40 = v54;
  uint64_t v41 = swift_getWitnessTable();
  sub_22697DC94();
  uint64_t v42 = v53;
  uint64_t v43 = v67;
  sub_2269B8AC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v43, v40);
  uint64_t v44 = sub_22696B7B8(&qword_268149070, &qword_268149020);
  uint64_t v70 = v41;
  uint64_t v71 = v44;
  uint64_t v45 = v56;
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v47 = v55;
  sub_226980470(v42, v45, v46);
  uint64_t v48 = *(void (**)(char *, uint64_t))(v59 + 8);
  v48(v42, v45);
  sub_226980470(v47, v45, v46);
  return ((uint64_t (*)(char *, uint64_t))v48)(v47, v45);
}

uint64_t sub_22697C598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v120 = a2;
  uint64_t v116 = a1;
  uint64_t v111 = a5;
  uint64_t v106 = type metadata accessor for HoverTextMarqueeingContentView();
  uint64_t v108 = *(void *)(v106 - 8);
  uint64_t v110 = *(void *)(v108 + 64);
  MEMORY[0x270FA5388](v106);
  unint64_t v118 = (char *)&v79 - v7;
  uint64_t v115 = sub_2269B86B0();
  uint64_t v93 = *(void *)(v115 - 8);
  CGRect v119 = *(void (**)(uint64_t, char *, uint64_t))(v93 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v115);
  double v114 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v8);
  double v11 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2269B87B0();
  CGFloat v98 = *(void (**)(char *, uint64_t, uint64_t))(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v81 = (char *)&v79 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148FF0);
  uint64_t v83 = v12;
  uint64_t v14 = sub_2269B87B0();
  uint64_t v107 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  char v117 = (char *)&v79 - v15;
  type metadata accessor for CGSize(255);
  uint64_t v17 = v16;
  uint64_t v131 = a4;
  uint64_t v132 = MEMORY[0x263F190E0];
  uint64_t v113 = a4;
  uint64_t v18 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v82 = WitnessTable;
  uint64_t v20 = sub_22696B7B8(&qword_268148FF8, &qword_268148FF0);
  uint64_t v129 = WitnessTable;
  uint64_t v130 = v20;
  uint64_t v109 = v18;
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = sub_22698036C(&qword_268149000, type metadata accessor for CGSize);
  *(void *)&long long v126 = v14;
  *((void *)&v126 + 1) = v17;
  uint64_t v84 = v14;
  uint64_t v87 = v17;
  uint64_t v127 = v21;
  uint64_t v128 = v22;
  uint64_t v86 = v21;
  uint64_t v85 = v22;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v100 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  BOOL v91 = (char *)&v79 - v23;
  uint64_t v24 = sub_2269B87B0();
  uint64_t v101 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  double v92 = (char *)&v79 - v25;
  *(void *)&long long v126 = v14;
  *((void *)&v126 + 1) = v17;
  uint64_t v127 = v21;
  uint64_t v128 = v22;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v124 = OpaqueTypeConformance2;
  uint64_t v125 = MEMORY[0x263F189A8];
  uint64_t v95 = v24;
  uint64_t v94 = swift_getWitnessTable();
  *(void *)&long long v126 = v24;
  *((void *)&v126 + 1) = MEMORY[0x263F8D6C8];
  uint64_t v127 = v94;
  uint64_t v128 = MEMORY[0x263F8D6D8];
  uint64_t v99 = sub_2269B8C80();
  uint64_t v104 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  CGFloat v89 = (char *)&v79 - v26;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149008);
  uint64_t v103 = sub_2269B87B0();
  uint64_t v105 = *(void *)(v103 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v103);
  uint64_t v97 = (uint64_t)&v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  __n128 v102 = (char *)&v79 - v30;
  (*(void (**)(uint64_t))(v120 + 72))(v29);
  uint64_t v31 = v81;
  uint64_t v112 = a3;
  sub_2269B8B30();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v11, a3);
  sub_2269B8C70();
  uint64_t v32 = v93;
  uint64_t v79 = *(void (**)(char *, uint64_t, uint64_t))(v93 + 16);
  uint64_t v33 = v114;
  uint64_t v34 = v115;
  uint64_t v35 = v116;
  v79(v114, v116, v115);
  uint64_t v36 = *(unsigned __int8 *)(v32 + 80);
  uint64_t v37 = swift_allocObject();
  uint64_t v80 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 32);
  v80(v37 + ((v36 + 16) & ~v36), v33, v34);
  type metadata accessor for CGRect(0);
  sub_22697DC94();
  uint64_t v38 = v83;
  sub_2269B8AB0();
  swift_release();
  swift_release();
  (*((void (**)(char *, uint64_t))v98 + 1))(v31, v38);
  uint64_t v39 = v106;
  uint64_t v40 = v120;
  uint64_t v41 = (long long *)(v120 + *(int *)(v106 + 68));
  uint64_t v42 = *((void *)v41 + 2);
  long long v126 = *v41;
  uint64_t v127 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149108);
  sub_2269B8C50();
  long long v126 = v123;
  uint64_t v43 = v108;
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v108 + 16);
  uint64_t v88 = v108 + 16;
  CGFloat v98 = v44;
  uint64_t v45 = v118;
  v44(v118, v40, v39);
  uint64_t v46 = v114;
  uint64_t v47 = v35;
  uint64_t v48 = v115;
  v79(v114, v47, v115);
  uint64_t v49 = *(unsigned __int8 *)(v43 + 80);
  uint64_t v50 = v43;
  uint64_t v51 = (v49 + 32) & ~v49;
  v110 += v51;
  uint64_t v93 = v49 | 7;
  uint64_t v52 = (v110 + v36) & ~v36;
  uint64_t v53 = swift_allocObject();
  uint64_t v54 = v113;
  *(void *)(v53 + 16) = v112;
  *(void *)(v53 + 24) = v54;
  CGRect v119 = *(void (**)(uint64_t, char *, uint64_t))(v50 + 32);
  v119(v53 + v51, v45, v39);
  v80(v53 + v52, v46, v48);
  double v55 = v91;
  uint64_t v56 = v84;
  uint64_t v57 = v117;
  sub_2269B8B20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v57, v56);
  uint64_t v58 = v120;
  sub_22697D454(v116, v39);
  uint64_t v59 = v92;
  uint64_t v60 = OpaqueTypeMetadata2;
  sub_2269B8AF0();
  (*(void (**)(char *, uint64_t))(v100 + 8))(v55, v60);
  uint64_t v61 = v58;
  long long v126 = *(_OWORD *)(v58 + *(int *)(v39 + 76));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149110);
  sub_2269B8C50();
  uint64_t v62 = v89;
  uint64_t v63 = v95;
  sub_2269B8AD0();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v59, v63);
  double v64 = (uint64_t *)(v61 + *(int *)(v39 + 72));
  uint64_t v65 = *v64;
  uint64_t v66 = v64[1];
  *(void *)&long long v126 = v65;
  *((void *)&v126 + 1) = v66;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149118);
  sub_2269B8C50();
  double v67 = v118;
  v98(v118, v61, v39);
  uint64_t v68 = swift_allocObject();
  uint64_t v69 = v113;
  *(void *)(v68 + 16) = v112;
  *(void *)(v68 + 24) = v69;
  v119(v68 + v51, v67, v39);
  uint64_t v70 = v99;
  uint64_t v71 = swift_getWitnessTable();
  sub_22697FE0C();
  uint64_t v72 = v97;
  View.onAnimationCompletion<A>(for:completion:)((uint64_t)&v123, (uint64_t)sub_22697FD9C, v68, v70, MEMORY[0x263F8EF38], v71, v97);
  swift_release();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v62, v70);
  uint64_t v73 = sub_22696B7B8(&qword_268149010, &qword_268149008);
  uint64_t v121 = v71;
  uint64_t v122 = v73;
  uint64_t v74 = v103;
  uint64_t v75 = swift_getWitnessTable();
  CGFloat v76 = v102;
  sub_226980470(v72, v74, v75);
  uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
  v77(v72, v74);
  sub_226980470(v76, v74, v75);
  return ((uint64_t (*)(char *, uint64_t))v77)(v76, v74);
}

uint64_t sub_22697D2AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for HoverTextMarqueeingContentView() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_22697C598(a1, v8, v5, v6, a2);
}

void sub_22697D348(uint64_t a1, uint64_t a2, double a3)
{
}

void sub_22697D454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2269B87A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - v9;
  double v11 = sub_22697BD3C();
  sub_2269B86A0();
  if (v12 + sub_22697BA50() <= v11)
  {
    uint64_t v13 = (uint64_t *)(v2 + *(int *)(a2 + 72));
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    v18[1] = v14;
    v18[2] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268149118);
    sub_2269B8C50();
    if (*(double *)&v18[3] == 0.0)
    {
      sub_22697FE60((uint64_t)v10);
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F18DC8], v4);
      char v16 = sub_2269B8790();
      uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
      if ((v16 & 1) == 0) {
        sub_2269B86A0();
      }
    }
    else
    {
      sub_22697BD3C();
      sub_2269B86A0();
    }
  }
  else
  {
    sub_2269B8880();
    if (sub_2269B8870() & 1) != 0 || (sub_2269B8890(), (sub_2269B8870()))
    {
      sub_2269B86A0();
      sub_22697BD3C();
    }
  }
}

uint64_t sub_22697D6B8@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149058);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = sub_2269B87A0();
  uint64_t v6 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v26 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_2269B8830();
  sub_22697DD2C((uint64_t)v28);
  *(_OWORD *)((char *)&v30[8] + 7) = v28[8];
  *(_OWORD *)((char *)&v30[9] + 7) = v28[9];
  *(_OWORD *)((char *)&v30[10] + 7) = v28[10];
  *(_OWORD *)((char *)&v30[4] + 7) = v28[4];
  *(_OWORD *)((char *)&v30[5] + 7) = v28[5];
  *(_OWORD *)((char *)&v30[6] + 7) = v28[6];
  *(_OWORD *)((char *)&v30[7] + 7) = v28[7];
  *(_OWORD *)((char *)v30 + 7) = v28[0];
  *(_OWORD *)((char *)&v30[1] + 7) = v28[1];
  *(_OWORD *)((char *)&v30[2] + 7) = v28[2];
  char v31 = 0;
  *(void *)((char *)&v30[11] + 7) = v29;
  *(_OWORD *)((char *)&v30[3] + 7) = v28[3];
  char v8 = sub_2269B8960();
  sub_2269B85E0();
  *(_OWORD *)((char *)&v33[8] + 1) = v30[8];
  *(_OWORD *)((char *)&v33[9] + 1) = v30[9];
  *(_OWORD *)((char *)&v33[10] + 1) = v30[10];
  v33[11] = *(_OWORD *)((char *)&v30[10] + 15);
  *(_OWORD *)((char *)&v33[4] + 1) = v30[4];
  *(_OWORD *)((char *)&v33[5] + 1) = v30[5];
  *(_OWORD *)((char *)&v33[6] + 1) = v30[6];
  *(_OWORD *)((char *)&v33[7] + 1) = v30[7];
  *(_OWORD *)((char *)v33 + 1) = v30[0];
  *(_OWORD *)((char *)&v33[1] + 1) = v30[1];
  *(_OWORD *)((char *)&v33[2] + 1) = v30[2];
  long long v32 = (unint64_t)v25;
  LOBYTE(v33[0]) = 0;
  *(_OWORD *)((char *)&v33[3] + 1) = v30[3];
  LOBYTE(v34) = v8;
  *((void *)&v34 + 1) = v9;
  *(void *)&v35[0] = v10;
  *((void *)&v35[0] + 1) = v11;
  *(void *)&v35[1] = v12;
  BYTE8(v35[1]) = 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v14 = v26;
  uint64_t v15 = v27;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v26, *MEMORY[0x263F18DC8], v27);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v5 + *(int *)(v3 + 36), v14, v15);
  *uint64_t v5 = KeyPath;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148FE8);
  sub_22696B88C((uint64_t)v5, (uint64_t)a1 + *(int *)(v16 + 36), &qword_268149058);
  long long v17 = v34;
  a1[12] = v33[11];
  a1[13] = v17;
  a1[14] = v35[0];
  *(_OWORD *)((char *)a1 + 233) = *(_OWORD *)((char *)v35 + 9);
  long long v18 = v33[8];
  a1[8] = v33[7];
  a1[9] = v18;
  long long v19 = v33[10];
  a1[10] = v33[9];
  a1[11] = v19;
  long long v20 = v33[4];
  a1[4] = v33[3];
  a1[5] = v20;
  long long v21 = v33[6];
  a1[6] = v33[5];
  a1[7] = v21;
  long long v22 = v33[0];
  *a1 = v32;
  a1[1] = v22;
  long long v23 = v33[2];
  a1[2] = v33[1];
  a1[3] = v23;
  sub_22697F77C((uint64_t)&v32);
  sub_22696B8F0((uint64_t)v5, &qword_268149058);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v15);
  return sub_22697F7C4((uint64_t)v28);
}

unint64_t sub_22697DA48()
{
  unint64_t result = qword_268149028;
  if (!qword_268149028)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268148FE8);
    sub_22697DAE8();
    sub_22696B7B8(&qword_268149050, &qword_268149058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149028);
  }
  return result;
}

unint64_t sub_22697DAE8()
{
  unint64_t result = qword_268149030;
  if (!qword_268149030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149038);
    sub_22696B7B8(&qword_268149040, &qword_268149048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149030);
  }
  return result;
}

uint64_t sub_22697DB88()
{
  return sub_2269B8C60();
}

uint64_t sub_22697DC08()
{
  type metadata accessor for HoverTextMarqueeingContentView();

  return sub_22697DB88();
}

unint64_t sub_22697DC94()
{
  unint64_t result = qword_268149068;
  if (!qword_268149068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149068);
  }
  return result;
}

uint64_t sub_22697DCE8()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22697DD2C@<D0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148D18);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2269BB190;
  *(void *)(v2 + 32) = sub_2269B8B80();
  *(void *)(v2 + 40) = sub_2269B8B70();
  sub_2269B9030();
  MEMORY[0x22A65C700](v2);
  sub_2269B8E20();
  sub_2269B8E30();
  sub_2269B8770();
  sub_2269B8D50();
  sub_2269B8690();
  uint64_t v3 = sub_2269B8B70();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2269BB190;
  *(void *)(v4 + 32) = sub_2269B8B70();
  *(void *)(v4 + 40) = sub_2269B8B80();
  sub_2269B9030();
  MEMORY[0x22A65C700](v4);
  sub_2269B8E20();
  sub_2269B8E30();
  sub_2269B8770();
  sub_2269B8D50();
  sub_2269B8690();
  *(void *)a1 = v6;
  *(_OWORD *)(a1 + 8) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  *(unsigned char *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v15;
  *(void *)(a1 + 88) = v3;
  *(void *)(a1 + 96) = v16;
  *(_OWORD *)(a1 + 104) = v17;
  *(void *)(a1 + 120) = v18;
  *(void *)(a1 + 128) = v19;
  *(void *)(a1 + 136) = v4;
  *(unsigned char *)(a1 + 144) = v20;
  *(void *)(a1 + 152) = v21;
  *(unsigned char *)(a1 + 160) = v22;
  double result = *(double *)&v23;
  *(_OWORD *)(a1 + 168) = v23;
  return result;
}

void sub_22697DF80(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2269B8E40();
  uint64_t v36 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v34 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_2269B8E70();
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v35);
  long long v32 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v37 = sub_2269B8E90();
  uint64_t v31 = *(void *)(v37 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v37);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v26 - v15;
  double v17 = sub_22697BD3C();
  sub_2269B86A0();
  long long v30 = *(_OWORD *)(a3 + 16);
  if (v18 + sub_22697BA50() <= v17)
  {
    sub_2269B86A0();
    sub_22697BD3C();
    sub_2269B8DA0();
    sub_2269B8D80();
    uint64_t v29 = v6;
    swift_release();
    uint64_t v27 = sub_2269B8D90();
    swift_release();
    sub_22697B764();
    uint64_t v28 = sub_2269B91D0();
    sub_2269B8E80();
    MEMORY[0x22A65C860](v14, a1);
    uint64_t v31 = *(void *)(v31 + 8);
    ((void (*)(char *, uint64_t))v31)(v14, v37);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a3);
    unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = v30;
    *(void *)(v20 + 32) = v27;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v20 + v19, (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
    aBlock[4] = sub_2269802A8;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_226982998;
    aBlock[3] = &block_descriptor_2;
    uint64_t v21 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    char v22 = v32;
    sub_2269B8E50();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22698036C(&qword_268149128, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
    sub_22696B7B8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
    long long v23 = v34;
    uint64_t v24 = v29;
    sub_2269B92F0();
    uint64_t v25 = (void *)v28;
    MEMORY[0x22A65CB40](v16, v22, v23, v21);
    _Block_release(v21);
    swift_release();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v23, v24);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v22, v35);
    ((void (*)(char *, uint64_t))v31)(v16, v37);
  }
}

uint64_t sub_22697E4E0(uint64_t a1)
{
  double v1 = *(void (**)(void))(a1 + 40);
  if (v1) {
    v1();
  }
  type metadata accessor for HoverTextMarqueeingContentView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149118);
  return sub_2269B8C60();
}

uint64_t sub_22697E588()
{
  return swift_release();
}

uint64_t sub_22697E608()
{
  return sub_2269B8C60();
}

uint64_t sub_22697E67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

void sub_22697E684()
{
  sub_22697F310();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_22697E74C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = (void *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(void *)(a1 + 32) = a2[4];
    uint64_t v8 = a2[5];
    if (v8)
    {
      uint64_t v9 = a2[6];
      v4[5] = v8;
      v4[6] = v9;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    }
    uint64_t v11 = a2[7];
    if (v11)
    {
      uint64_t v12 = a2[8];
      v4[7] = v11;
      v4[8] = v12;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(v4 + 7) = *(_OWORD *)(a2 + 7);
    }
    uint64_t v13 = a2[10];
    v4[9] = a2[9];
    v4[10] = v13;
    uint64_t v14 = a3[16];
    uint64_t v15 = (void *)((char *)v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_2269B87A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      void *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[17];
    uint64_t v19 = a3[18];
    uint64_t v20 = (char *)v4 + v18;
    uint64_t v21 = (uint64_t)a2 + v18;
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    *((void *)v20 + 2) = *(void *)(v21 + 16);
    char v22 = (void *)((char *)v4 + v19);
    long long v23 = (uint64_t *)((char *)a2 + v19);
    uint64_t v24 = v23[1];
    *char v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[19];
    uint64_t v26 = (void *)((char *)v4 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_22697E924(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40)) {
    swift_release();
  }
  if (*(void *)(a1 + 56)) {
    swift_release();
  }
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2269B87A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_22697EA20(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  uint64_t v9 = *(void *)(a2 + 56);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v11;
  uint64_t v12 = a3[16];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2269B87A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[17];
  uint64_t v17 = a3[18];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v20 = (void *)(a1 + v17);
  uint64_t v21 = (void *)(a2 + v17);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[19];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_22697EBAC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  long long v6 = a1 + 5;
  uint64_t v8 = a2 + 5;
  uint64_t v7 = a2[5];
  if (a1[5])
  {
    if (v7)
    {
      uint64_t v9 = a2[6];
      a1[5] = v7;
      a1[6] = v9;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v10 = a2[6];
    a1[5] = v7;
    a1[6] = v10;
    swift_retain();
    goto LABEL_8;
  }
  *long long v6 = *v8;
LABEL_8:
  uint64_t v11 = a2[7];
  if (a1[7])
  {
    if (v11)
    {
      uint64_t v12 = a2[8];
      a1[7] = v11;
      a1[8] = v12;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = a2[8];
    a1[7] = v11;
    a1[8] = v13;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
LABEL_15:
  uint64_t v14 = a2[10];
  a1[9] = a2[9];
  a1[10] = v14;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v15 = a3[16];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    sub_22696B8F0((uint64_t)a1 + v15, &qword_268148928);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_2269B87A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = a3[17];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  void *v20 = *v21;
  v20[1] = v21[1];
  v20[2] = v21[2];
  swift_retain();
  swift_release();
  uint64_t v22 = a3[18];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  uint64_t v25 = a3[19];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22697EE0C(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v8;
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  uint64_t v9 = *(void *)(a2 + 56);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v10;
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v11 = a3[16];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2269B87A0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[17];
  uint64_t v17 = a3[18];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  return a1;
}

uint64_t sub_22697EF78(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = (_OWORD *)(a1 + 40);
  uint64_t v9 = (_OWORD *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 48) = v10;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v11 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v11;
    goto LABEL_8;
  }
  *uint64_t v7 = *v9;
LABEL_8:
  uint64_t v12 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v12;
      *(void *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v12)
  {
    uint64_t v14 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v14;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
LABEL_15:
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v15 = a3[16];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (const void *)(a2 + v15);
    sub_22696B8F0(a1 + v15, &qword_268148928);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_2269B87A0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[17];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(void *)(v21 + 16) = *(void *)(v22 + 16);
  swift_release();
  uint64_t v23 = a3[18];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_release();
  uint64_t v26 = a3[19];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *uint64_t v27 = v30;
  v27[1] = v29;
  swift_release();
  return a1;
}

uint64_t sub_22697F188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22697F19C);
}

uint64_t sub_22697F19C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 72);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_268149078);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 64);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22697F250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22697F264);
}

uint64_t sub_22697F264(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 72) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_268149078);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 64);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_22697F310()
{
  if (!qword_268149100)
  {
    sub_2269B87A0();
    unint64_t v0 = sub_2269B8630();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268149100);
    }
  }
}

uint64_t sub_22697F368()
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for ContentSizeKey()
{
  return &type metadata for ContentSizeKey;
}

void sub_22697F6B4()
{
  xmmword_268148FD8 = 0uLL;
}

double sub_22697F6C4@<D0>(_OWORD *a1@<X8>)
{
  if (qword_268148910 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_268148FD8;
  *a1 = xmmword_268148FD8;
  return result;
}

double sub_22697F724(_OWORD *a1, void (*a2)(long long *__return_ptr))
{
  a2(&v4);
  double result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_22697F76C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_22697F77C(uint64_t a1)
{
  return a1;
}

uint64_t sub_22697F7C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22697F80C()
{
  uint64_t v1 = sub_2269B86B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

double sub_22697F89C@<D0>(_OWORD *a1@<X8>)
{
  sub_2269B86B0();
  type metadata accessor for CGRect(0);
  sub_2269B86C0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_22697F92C()
{
  uint64_t v1 = type metadata accessor for HoverTextMarqueeingContentView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v13 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = sub_2269B86B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = v0 + v3;
  if (*(void *)(v0 + v3 + 40)) {
    swift_release();
  }
  if (*(void *)(v8 + 56)) {
    swift_release();
  }
  swift_release();
  uint64_t v9 = v8 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2269B87A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = (v3 + v13 + v6) & ~v6;
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v11, v4);

  return MEMORY[0x270FA0238](v0, v11 + v7, v2 | v6 | 7);
}

void sub_22697FB40()
{
  uint64_t v1 = type metadata accessor for HoverTextMarqueeingContentView();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = *(void *)(sub_2269B86B0() - 8);
  sub_22697D348(v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v1, *(double *)(v0 + v2 + 8));
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for HoverTextMarqueeingContentView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  if (*(void *)(v0 + v3 + 40)) {
    swift_release();
  }
  if (*(void *)(v5 + 56)) {
    swift_release();
  }
  swift_release();
  uint64_t v6 = v5 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2269B87A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22697FD9C()
{
  uint64_t v1 = type metadata accessor for HoverTextMarqueeingContentView();
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = *(uint64_t (**)(void))(v0
                           + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                           + 56);
  if (v4) {
    return v4();
  }
  return result;
}

unint64_t sub_22697FE0C()
{
  unint64_t result = qword_268149120;
  if (!qword_268149120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149120);
  }
  return result;
}

uint64_t sub_22697FE60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2269B8820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22696B88C(v2, (uint64_t)v10, &qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_2269B87A0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_2269B9150();
    uint64_t v14 = sub_2269B8950();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      void v19[2] = sub_22697609C(0x694474756F79614CLL, 0xEF6E6F6974636572, &v20);
      sub_2269B9290();
      _os_log_impl(&dword_22695C000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v18, -1, -1);
      MEMORY[0x22A65DA10](v16, -1, -1);
    }

    sub_2269B8810();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_226980120()
{
  uint64_t v1 = type metadata accessor for HoverTextMarqueeingContentView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  if (*(void *)(v0 + v3 + 40)) {
    swift_release();
  }
  if (*(void *)(v5 + 56)) {
    swift_release();
  }
  swift_release();
  uint64_t v6 = v5 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2269B87A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2269802A8()
{
  return sub_2269B8730();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_22698036C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2269803B4()
{
  return sub_22697E4E0(*(void *)(v0 + 32));
}

uint64_t sub_2269803D4()
{
  return sub_22697E608();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void *Double.pixelsPerSecondPerPointSize.unsafeMutableAddressor()
{
  return &static Double.pixelsPerSecondPerPointSize;
}

double UIFont.hoverTextLineHeight.getter()
{
  double Ascent = CTFontGetAscent(v0);
  double v2 = Ascent + CTFontGetDescent(v0);
  return v2 + CTFontGetLeading(v0);
}

uint64_t sub_226980474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_2269804AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2269B88D0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_2269B88E0();
}

uint64_t sub_2269805A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2269B88D0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_2269B88E0();
}

uint64_t View.if<A>(_:transform:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v42 = a7;
  uint64_t v43 = a6;
  v35[1] = a3;
  uint64_t v36 = a2;
  uint64_t v38 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v37 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)v35 - v14;
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v13);
  uint64_t v20 = (char *)v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v35 - v21;
  uint64_t v41 = sub_2269B88F0();
  uint64_t v23 = *(void *)(v41 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v41);
  uint64_t v26 = (char *)v35 - v25;
  if (v39(v24))
  {
    v36(v40);
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v27(v22, v20, a5);
    uint64_t v40 = a8;
    uint64_t v28 = *(void (**)(char *, uint64_t))(v17 + 8);
    v28(v20, a5);
    v27(v20, v22, a5);
    sub_2269804AC((uint64_t)v20, a5);
    v28(v20, a5);
    v28(v22, a5);
    a8 = v40;
  }
  else
  {
    uint64_t v29 = v38;
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
    v30(v15, v40, a4);
    uint64_t v31 = (uint64_t)v37;
    v30(v37, (uint64_t)v15, a4);
    sub_2269805A4(v31, a5, a4);
    long long v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v32(v31, a4);
    v32((uint64_t)v15, a4);
  }
  uint64_t v33 = v41;
  uint64_t v44 = v42;
  uint64_t v45 = v43;
  swift_getWitnessTable();
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(a8, v26, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v26, v33);
}

unint64_t sub_226980A3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681491F0);
  double v2 = (void *)sub_2269B9490();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 40);
  while (1)
  {
    long long v11 = *v4;
    id v5 = *((id *)v4 - 1);
    swift_retain();
    unint64_t result = sub_2269B549C((uint64_t)v5);
    if (v7) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    *(_OWORD *)(v2[7] + 16 * result) = v11;
    uint64_t v8 = v2[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      goto LABEL_11;
    }
    v2[2] = v10;
    uint64_t v4 = (_OWORD *)((char *)v4 + 24);
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

unint64_t sub_226980B5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681491E0);
  uint64_t v2 = sub_2269B9490();
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
    sub_22696B88C(v6, (uint64_t)&v15, &qword_2681491E8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2269B5550(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_226982748(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_226980C94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149220);
  uint64_t v2 = sub_2269B9490();
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
    sub_22696B88C(v6, (uint64_t)&v13, &qword_268149228);
    uint64_t v7 = v13;
    unint64_t result = sub_2269B55C8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_226982748(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_226980DC4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149970);
  uint64_t v2 = (void *)sub_2269B9490();
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
    unint64_t result = sub_2269B565C((uint64_t)v6);
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

unint64_t sub_226980ED0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681491D8);
  uint64_t v2 = (void *)sub_2269B9490();
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
    uint64_t v6 = *((unsigned int *)v4 - 6);
    uint64_t v5 = *((unsigned int *)v4 - 5);
    uint64_t v7 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_2269B56A0(v6 | (v5 << 32), v7, v8);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = v2[6] + 24 * result;
    *(_DWORD *)uint64_t v12 = v6;
    *(_DWORD *)(v12 + 4) = v5;
    *(void *)(v12 + 8) = v7;
    *(void *)(v12 + 16) = v8;
    *(void *)(v2[7] + 8 * result) = v9;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 4;
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

uint64_t View.onAnimationCompletion<A>(for:completion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v21 = a6;
  uint64_t v19 = a7;
  uint64_t v20 = a4;
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for AnimationCompletionModifier();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v19 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, a5);
  sub_226981330((uint64_t)v13, a2, a3, a5, (uint64_t)v17);
  swift_retain();
  MEMORY[0x22A65C4D0](v17, v20, v14, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t type metadata accessor for AnimationCompletionModifier()
{
  return __swift_instantiateGenericMetadata();
}

double static Double.pixelsPerSecondPerPointSize.getter()
{
  return 2.8125;
}

CGSize __swiftcall String.size(usingFont:)(UIFont usingFont)
{
  uint64_t v2 = (void *)sub_2269B8F00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149140);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2269BBB10;
  uint64_t v4 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  *(void *)(inited + 64) = sub_226978330(0, qword_268149148);
  *(UIFont *)(inited + 40) = usingFont;
  id v5 = v4;
  uint64_t v6 = usingFont.super.isa;
  sub_226980C94(inited);
  type metadata accessor for Key(0);
  sub_2269828F4(&qword_268148B10, type metadata accessor for Key);
  uint64_t v7 = (void *)sub_2269B8EB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_sizeWithAttributes_, v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

uint64_t sub_226981330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for AnimationCompletionModifier();
  double v11 = (void *)(a5 + *(int *)(v10 + 40));
  void *v11 = a2;
  v11[1] = a3;
  uint64_t v15 = *(void *)(a4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(a5, a1, a4);
  uint64_t v12 = a5 + *(int *)(v10 + 36);
  double v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);

  return v13(v12, a1, a4);
}

uint64_t sub_226981428(uint64_t a1)
{
  uint64_t v3 = sub_2269B8E40();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2269B8E70();
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v14 = *(void *)(v12 + 24);
  uint64_t v13 = *(void *)(v12 + 32);
  uint64_t result = sub_2269B8EF0();
  if (result)
  {
    sub_226978330(0, (unint64_t *)&qword_268149200);
    uint64_t v22 = sub_2269B91D0();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
    unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v14;
    *(void *)(v17 + 24) = v13;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v17 + v16, (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    aBlock[4] = sub_22698286C;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_226982998;
    aBlock[3] = &block_descriptor_3;
    uint64_t v18 = _Block_copy(aBlock);
    swift_release();
    sub_2269B8E50();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_2269828F4(&qword_268149128, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
    sub_22698293C();
    uint64_t v19 = v26;
    sub_2269B92F0();
    uint64_t v20 = (void *)v22;
    MEMORY[0x22A65CBA0](0, v9, v5, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  }
  return result;
}

uint64_t AnimationCompletionModifier.animatableData.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t AnimationCompletionModifier.animatableData.setter(uint64_t a1, uint64_t a2)
{
  sub_226981C24(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8);

  return v4(a1);
}

uint64_t *(*AnimationCompletionModifier.animatableData.modify(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  *a1 = a2;
  a1[1] = v2;
  return sub_226981884;
}

uint64_t *sub_226981884(uint64_t *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (uint64_t *)sub_226981428(*result);
  }
  return result;
}

uint64_t AnimationCompletionModifier.body(content:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  swift_getWitnessTable();
  uint64_t v4 = sub_2269B8910();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - v6;
  swift_getWitnessTable();
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, a1, v4);
  v8(a2, (uint64_t)v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2269819F8(uint64_t a1, uint64_t a2)
{
  sub_226981C24(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8);

  return v4(a1);
}

void (*sub_226981A64(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = AnimationCompletionModifier.animatableData.modify(v4, a2);
  return sub_22696E37C;
}

uint64_t sub_226981AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F01128](a1, a2, a3, a4, a5, WitnessTable);
}

uint64_t sub_226981B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F01120](a1, a2, a3, a4, a5, WitnessTable);
}

uint64_t sub_226981BF0()
{
  return sub_2269B8680();
}

uint64_t sub_226981C0C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return AnimationCompletionModifier.body(content:)(a1, a2);
}

uint64_t sub_226981C24(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 24))(v2, a1);

  return sub_226981428(a2);
}

uint64_t sub_226981C8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_226981CA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_226981CC4(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_226981CCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226981D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_226981D18()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_226981DB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((v7 + 7 + ((v7 + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
  }
  else
  {
    uint64_t v15 = ~v8;
    unint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    uint64_t v18 = (void *)((v10 + v17) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = v18[1];
    uint64_t v20 = (void *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFFFF8);
    void *v20 = *v18;
    v20[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t sub_226981F00(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v5(a1, v3);
  v5((*(void *)(v4 + 64) + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), v3);

  return swift_release();
}

uint64_t sub_226981FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  uint64_t v12 = (uint64_t *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = (void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  void *v15 = v14;
  v15[1] = v13;
  swift_retain();
  return a1;
}

uint64_t sub_22698206C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  uint64_t v12 = (void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22698213C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_OWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2269821FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_OWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_2269822C4(_DWORD *a1, unsigned int a2, uint64_t a3)
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
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = v6 + 7;
  if (v7 < a2)
  {
    unint64_t v11 = ((v10 + (v9 & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v12 = a2 - v7;
    uint64_t v13 = v11 & 0xFFFFFFF8;
    if ((v11 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = v12 + 1;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v11);
        if (!v17) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v11);
        if (v17) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x226982428);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v11);
        if (!v17) {
          break;
        }
LABEL_22:
        int v19 = v17 - 1;
        if (v13)
        {
          int v19 = 0;
          LODWORD(v13) = *a1;
        }
        return v7 + (v13 | v19) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v20 = *(void *)((v10 + (((unint64_t)a1 + v9) & ~v8)) & 0xFFFFFFFFFFFFFFF8);
  if (v20 >= 0xFFFFFFFF) {
    LODWORD(v20) = -1;
  }
  return (v20 + 1);
}

void sub_22698243C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = v9 + v10;
  uint64_t v12 = (v9 + v10) & ~v10;
  uint64_t v13 = v9 + 7;
  size_t v14 = ((v13 + v12) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 >= a3)
  {
    int v18 = 0;
    int v19 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v18)
      {
        case 1:
          a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v14] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v23 = (void *)((v13 + ((unint64_t)&a1[v11] & ~v10)) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                uint64_t v24 = a2 ^ 0x80000000;
                v23[1] = 0;
              }
              else
              {
                uint64_t v24 = a2 - 1;
              }
              *uint64_t v23 = v24;
            }
            else
            {
              uint64_t v22 = *(void (**)(void))(v6 + 56);
              v22();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v15 = a3 - v8;
    if (((v13 + v12) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v16 = v15 + 1;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      int v17 = 4;
    }
    else {
      int v17 = 2;
    }
    if (v16 < 0x100) {
      int v17 = 1;
    }
    if (v16 >= 2) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    int v19 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (v14) {
    int v20 = 1;
  }
  else {
    int v20 = v19;
  }
  if (v14)
  {
    int v21 = ~v8 + a2;
    bzero(a1, v14);
    *(_DWORD *)a1 = v21;
  }
  switch(v18)
  {
    case 1:
      a1[v14] = v20;
      break;
    case 2:
      *(_WORD *)&a1[v14] = v20;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x226982640);
    case 4:
      *(_DWORD *)&a1[v14] = v20;
      break;
    default:
      return;
  }
}

uint64_t sub_226982668()
{
  return swift_getWitnessTable();
}

uint64_t sub_2269826C8()
{
  type metadata accessor for AnimationCompletionModifier();
  swift_getWitnessTable();
  sub_2269B8910();

  return swift_getWitnessTable();
}

_OWORD *sub_226982748(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_226982758()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v2 = (int *)(type metadata accessor for AnimationCompletionModifier() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  unsigned int v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8);
  v8(v0 + v4, v1);
  v8(v7 + v2[11], v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22698286C()
{
  uint64_t v1 = type metadata accessor for AnimationCompletionModifier();
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 40)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_2269828F4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22698293C()
{
  unint64_t result = qword_268149130;
  if (!qword_268149130)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268149210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149130);
  }
  return result;
}

uint64_t sub_226982998(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void *sub_2269829DC(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_2269B565C((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_2269B9410();

  if (!v4) {
    return 0;
  }
  type metadata accessor for HoverTextRootViewController();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t HoverTextCoordinator.__allocating_init(withService:isHoverTextTyping:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  HoverTextCoordinator.init(withService:isHoverTextTyping:)(a1, a2);
  return v4;
}

uint64_t HoverTextCoordinator.init(withService:isHoverTextTyping:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_2269B8550();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = objc_msgSend(self, sel_mainRunLoop);
  id v11 = objc_allocWithZone((Class)type metadata accessor for AXRuntimeClient());
  *(void *)(v3 + 24) = AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)((uint64_t)v8, (uint64_t)&unk_26DA80268, (uint64_t)v10);
  *(void *)(v3 + 32) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HoverTextEventHandler()), sel_init);
  swift_unknownObjectWeakInit();
  *(void *)(v3 + 48) = 0;
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)(v3 + 56) = sub_226980DC4(MEMORY[0x263F8EE78]);
  *(void *)(v3 + 64) = v12;
  *(void *)(v3 + 80) = 0;
  *(void *)(v3 + 88) = 0;
  *(void *)(v3 + 72) = 0;
  *(unsigned char *)(v3 + 96) = 0;
  swift_unknownObjectWeakAssign();
  *(unsigned char *)(v3 + 16) = a2 ^ 1;
  id v13 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_22698F000;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226982998;
  aBlock[3] = &block_descriptor_4;
  unsigned int v15 = _Block_copy(aBlock);
  swift_release();
  uint64_t v16 = sub_2269B8480();
  swift_retain();
  objc_msgSend(v13, sel_registerUpdateBlock_forRetrieveSelector_withListener_, v15, v16, v3);
  swift_release();
  swift_unknownObjectRelease();
  _Block_release(v15);

  return v3;
}

void sub_226982DB4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)*(id *)(Strong + 32);
    swift_release();
    id v2 = objc_msgSend(self, sel_sharedInstance);
    id v3 = objc_msgSend(v2, sel_hoverTextPreferredActivatorKey);

    *(void *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey] = v3;
  }
}

id sub_226982E68()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = *(id *)(v0 + 48);
LABEL_5:
    id v5 = v1;
    return v2;
  }
  id result = objc_msgSend(self, sel_sharedDisplayManager);
  if (result)
  {
    uint64_t v4 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = result;
    id v2 = result;

    uint64_t v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t HoverTextCoordinator.startHoverText()()
{
  v1[66] = v0;
  v1[67] = type metadata accessor for HoverTextPresentationEvent();
  v1[68] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  v1[69] = swift_task_alloc();
  uint64_t v2 = sub_2269B8550();
  v1[70] = v2;
  v1[71] = *(void *)(v2 - 8);
  v1[72] = swift_task_alloc();
  v1[73] = swift_task_alloc();
  v1[74] = swift_task_alloc();
  v1[75] = swift_task_alloc();
  v1[76] = sub_2269B9080();
  v1[77] = sub_2269B9070();
  uint64_t v4 = sub_2269B9060();
  v1[78] = v4;
  v1[79] = v3;
  return MEMORY[0x270FA2498](sub_226983068, v4, v3);
}

uint64_t sub_226983068()
{
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v2 = *(void *)(v0 + 568);
  uint64_t v3 = *(void *)(v0 + 560);
  uint64_t v4 = sub_2269B8530();
  *(void *)(v0 + 640) = v4;
  swift_beginAccess();
  id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(void *)(v0 + 648) = v5;
  *(void *)(v0 + 656) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v3);
  swift_retain();
  uint64_t v6 = sub_2269B8540();
  os_log_type_t v7 = sub_2269B9120();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(v0 + 528);
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109376;
    *(_DWORD *)(v0 + 492) = *(unsigned __int8 *)(v8 + 96);
    sub_2269B9290();
    *(_WORD *)(v9 + 8) = 1024;
    *(_DWORD *)(v0 + 800) = (*(unsigned char *)(v8 + 16) & 1) == 0;
    sub_2269B9290();
    swift_release();
    _os_log_impl(&dword_22695C000, v6, v7, "Coordinator asked to start HoverText. isRunning=%{BOOL}d isHoverTextTyping=%{BOOL}d", (uint8_t *)v9, 0xEu);
    MEMORY[0x22A65DA10](v9, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v10 = *(void *)(v0 + 600);
  uint64_t v11 = *(void *)(v0 + 568);
  uint64_t v12 = *(void *)(v0 + 560);
  uint64_t v13 = *(void *)(v0 + 528);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(void *)(v0 + 664) = v14;
  *(void *)(v0 + 672) = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v10, v12);
  if (*(unsigned char *)(v13 + 96))
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(v0 + 528) + 24);
    *(void *)(v0 + 680) = v15;
    uint64_t v16 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled;
    if (*(unsigned char *)(v15 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled) == 1)
    {
      int v17 = sub_2269B8540();
      os_log_type_t v18 = sub_2269B9160();
      if (os_log_type_enabled(v17, v18))
      {
        int v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v19 = 0;
        _os_log_impl(&dword_22695C000, v17, v18, "Accessibility already enabled", v19, 2u);
        MEMORY[0x22A65DA10](v19, -1, -1);
      }
    }
    else
    {
      sub_226996918();
      *(unsigned char *)(v15 + v16) = 1;
    }
    int v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 688) = v20;
    void *v20 = v0;
    v20[1] = sub_2269835C8;
    return sub_2269853EC(0, 1);
  }
}

uint64_t sub_2269835C8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 696) = a1;
  *(void *)(v4 + 704) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 632);
  uint64_t v6 = *(void *)(v3 + 624);
  if (v1) {
    os_log_type_t v7 = sub_22698513C;
  }
  else {
    os_log_type_t v7 = sub_226983710;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_226983710()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[81];
  uint64_t v2 = v0[80];
  uint64_t v3 = v0[74];
  uint64_t v4 = v0[70];
  swift_beginAccess();
  v1(v3, v2, v4);
  uint64_t v5 = sub_2269B8540();
  os_log_type_t v6 = sub_2269B9120();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_22695C000, v5, v6, "Coordinator did show HoverText UI on main screen", v7, 2u);
    MEMORY[0x22A65DA10](v7, -1, -1);
  }
  uint64_t v8 = v0[87];
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[83];
  uint64_t v10 = v0[74];
  uint64_t v11 = v0[70];
  uint64_t v12 = v0[66];

  v9(v10, v11);
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = (uint64_t *)(v8 + direct field offset for HoverTextRootViewController.showStatusAlertForActivationLockDidChange);
  swift_beginAccess();
  uint64_t v15 = *v14;
  *uint64_t v14 = (uint64_t)sub_22698F1F4;
  v14[1] = v13;
  sub_22696C20C(v15);
  HoverTextRootViewController.startHoverText()();
  if (*(unsigned char *)(v12 + 16))
  {
    uint64_t v16 = &selRef_hoverTextShowedBanner;
    int v17 = &selRef_setHoverTextShowedBanner_;
    uint64_t v18 = 0x6C62616E652E7468;
    uint64_t v19 = 0xEA00000000006465;
  }
  else
  {
    uint64_t v16 = &selRef_hoverTextTypingShowedBanner;
    int v17 = &selRef_setHoverTextTypingShowedBanner_;
    uint64_t v18 = 0x62616E652E747468;
    uint64_t v19 = 0xEB0000000064656CLL;
  }
  sub_226985AB8((SEL *)v16, v18, v19, (SEL *)v17);
  int v20 = (void *)v0[87];
  uint64_t v21 = v0[66];
  uint64_t v22 = *(void **)(v21 + 72);
  *(void *)(v21 + 72) = v20;
  id v23 = v20;

  swift_beginAccess();
  unint64_t v24 = *(void *)(v21 + 64);
  v0[89] = v24;
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2269B9450();
    v0[90] = v31;
    if (v31) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v0[90] = v25;
    if (v25)
    {
LABEL_8:
      swift_beginAccess();
      uint64_t v26 = v0[89];
      if ((v26 & 0xC000000000000001) != 0) {
        id v27 = (id)MEMORY[0x22A65CD20](0);
      }
      else {
        id v27 = *(id *)(v26 + 32);
      }
      v0[91] = v27;
      v0[92] = 1;
      id v28 = v27;
      v0[93] = sub_2269B9070();
      uint64_t v30 = sub_2269B9060();
      v0[94] = v30;
      v0[95] = v29;
      return MEMORY[0x270FA2498](sub_226984068, v30, v29);
    }
  }
  uint64_t v32 = v0[66];
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v33 = v0[85];
  uint64_t v34 = v0[66];
  if (*(unsigned char *)(v32 + 16) == 1)
  {
    uint64_t v35 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
    swift_beginAccess();
    uint64_t v36 = *v35;
    *uint64_t v35 = (uint64_t)sub_22698F494;
    v35[1] = v34;
    swift_retain();
    sub_22696C20C(v36);
    uint64_t v37 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange);
    swift_beginAccess();
    uint64_t v38 = *v37;
    *uint64_t v37 = (uint64_t)sub_22698F49C;
    v37[1] = v34;
    swift_retain();
    sub_22696C20C(v38);
    uint64_t v39 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement);
    swift_beginAccess();
    uint64_t v40 = *v39;
    *uint64_t v39 = (uint64_t)sub_22698F4D4;
    v39[1] = v34;
    swift_retain();
    sub_22696C20C(v40);
    uint64_t v41 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated);
    swift_beginAccess();
    uint64_t v42 = *v41;
    uint64_t *v41 = (uint64_t)sub_22698F4DC;
    v41[1] = v34;
  }
  else
  {
    uint64_t v43 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
    swift_beginAccess();
    uint64_t v44 = *v43;
    *uint64_t v43 = (uint64_t)sub_22698F2C8;
    v43[1] = v34;
    swift_retain();
    sub_22696C20C(v44);
    uint64_t v45 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide);
    swift_beginAccess();
    uint64_t v46 = *v45;
    *uint64_t v45 = (uint64_t)sub_22698F2D0;
    v45[1] = v34;
    swift_retain();
    sub_22696C20C(v46);
    uint64_t v47 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange);
    swift_beginAccess();
    uint64_t v48 = *v47;
    *uint64_t v47 = (uint64_t)sub_22698F308;
    v47[1] = v34;
    swift_retain();
    sub_22696C20C(v48);
    uint64_t v49 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame);
    swift_beginAccess();
    uint64_t v50 = *v49;
    *uint64_t v49 = (uint64_t)sub_22698F340;
    v49[1] = v34;
    swift_retain();
    sub_22696C20C(v50);
    uint64_t v51 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
    swift_beginAccess();
    uint64_t v52 = *v51;
    *uint64_t v51 = (uint64_t)sub_22698F378;
    v51[1] = v34;
    swift_retain();
    sub_22696C20C(v52);
    uint64_t v53 = (uint64_t *)(v33 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode);
    swift_beginAccess();
    uint64_t v42 = *v53;
    *uint64_t v53 = (uint64_t)sub_22698F380;
    v53[1] = v34;
  }
  swift_retain();
  sub_22696C20C(v42);
  uint64_t v54 = v0[66];
  double v55 = (uint64_t *)(v0[85] + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
  swift_beginAccess();
  uint64_t v56 = *v55;
  *double v55 = (uint64_t)sub_2269861D4;
  v55[1] = 0;
  sub_22696C20C(v56);
  int v57 = *(unsigned __int8 *)(v54 + 16);
  uint64_t v58 = *(void *)(v54 + 32);
  uint64_t v59 = (uint64_t (*)(void *, char))v0[66];
  if (v57 == 1)
  {
    uint64_t v60 = (uint64_t (**)(void *, char))(v58
                                                + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
    uint64_t v61 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
    char *v60 = sub_22698F3C0;
    v60[1] = v59;
    swift_retain();
    sub_22696C20C(v61);
    uint64_t v62 = (uint64_t (**)(unint64_t))(v58
                                                    + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
    uint64_t v63 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
    char *v62 = sub_22698F3C8;
    v62[1] = (uint64_t (*)(unint64_t))v59;
    swift_retain();
    sub_22696C20C(v63);
    double v64 = (uint64_t (**)())(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
    uint64_t v65 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
    uint64_t *v64 = sub_22698F3E4;
    v64[1] = (uint64_t (*)())v59;
    swift_retain();
    sub_22696C20C(v65);
    uint64_t v66 = (uint64_t (**)())(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
    uint64_t v67 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
    *uint64_t v66 = sub_22698F41C;
    v66[1] = (uint64_t (*)())v59;
    swift_retain();
    sub_22696C20C(v67);
    uint64_t v68 = (uint64_t (**)())(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
    uint64_t v69 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
    char *v68 = sub_22698F454;
    v68[1] = (uint64_t (*)())v59;
    swift_retain();
    sub_22696C20C(v69);
    uint64_t v70 = (void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
    uint64_t v71 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
    uint64_t v72 = sub_22698F48C;
  }
  else
  {
    uint64_t v70 = (void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
    uint64_t v71 = *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
    uint64_t v72 = sub_22698F3B8;
  }
  *uint64_t v70 = v72;
  v70[1] = v59;
  swift_retain();
  sub_22696C20C(v71);
  uint64_t v73 = (void *)v0[87];
  id v74 = objc_msgSend(self, sel_sharedInstance);
  id v75 = objc_msgSend(v74, sel_hoverTextPreferredActivatorKey);

  *(void *)(v58 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey) = v75;
  sub_2269B257C();

  *(unsigned char *)(v0[66] + 96) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  CGFloat v76 = (uint64_t (*)(void))v0[1];
  return v76();
}

uint64_t sub_226984068()
{
  uint64_t v1 = (void *)v0[91];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[66];
  uint64_t v4 = sub_2269B90A0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, 1, 1, v4);
  swift_retain();
  id v6 = v1;
  uint64_t v7 = sub_2269B9070();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v9;
  *(unsigned char *)(v8 + 32) = 0;
  *(void *)(v8 + 40) = v1;
  *(void *)(v8 + 48) = v3;
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4);
  uint64_t v11 = v0[69];
  if (v10 == 1)
  {
    sub_22696B8F0(v0[69], &qword_268149238);
    if (v7)
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_2269B9060();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2269B9090();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v4);
    if (*(void *)(v8 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = type metadata accessor for HoverTextRootViewController();
  if (v14 | v12)
  {
    v0[2] = 0;
    v0[3] = 0;
    v0[4] = v12;
    v0[5] = v14;
  }
  uint64_t v16 = swift_task_create();
  v0[96] = v16;
  int v17 = (void *)swift_task_alloc();
  v0[97] = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148B40);
  v0[98] = v18;
  *int v17 = v0;
  v17[1] = sub_2269842F8;
  uint64_t v19 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB8](v0 + 60, v16, v15, v18, v19);
}

uint64_t sub_2269842F8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 760);
  uint64_t v3 = *(void *)(v1 + 752);
  return MEMORY[0x270FA2498](sub_226984418, v3, v2);
}

uint64_t sub_226984418()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 480);
  *(void *)(v0 + 792) = v1;
  if (*(unsigned char *)(v0 + 488))
  {
    uint64_t v2 = *(void **)(v0 + 728);
    *(void *)(v0 + 512) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v3 = *(void *)(v0 + 632);
    uint64_t v4 = *(void *)(v0 + 624);
    uint64_t v5 = sub_226984E7C;
  }
  else
  {
    id v6 = *(void **)(v0 + 728);
    swift_release();

    uint64_t v3 = *(void *)(v0 + 632);
    uint64_t v4 = *(void *)(v0 + 624);
    uint64_t v5 = sub_2269844F8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2269844F8()
{
  uint64_t v79 = (void (*)(uint64_t, uint64_t, uint64_t))v0[81];
  uint64_t v78 = v0[80];
  uint64_t v1 = v0[73];
  uint64_t v2 = v0[70];
  uint64_t v3 = v0[68];
  uint64_t v4 = (int *)v0[67];
  uint64_t v5 = v0[99] + qword_268148D80;
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = **(void **)v5;
  v0[63] = *(void *)v5;
  *(unsigned char *)(v3 + 50) = 12;
  swift_retain();
  sub_2269B8250();
  uint64_t v8 = (void *)(v3 + v4[8]);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = (_OWORD *)(v3 + v4[9]);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  uint64_t v10 = v3 + v4[10];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  uint64_t v11 = (void *)(v3 + v4[11]);
  void *v11 = 0;
  v11[1] = 0;
  *(void *)(v3 + v4[12]) = 0;
  *(void *)(v3 + v4[13]) = 0;
  *(void *)uint64_t v3 = 2;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *(void *)(v3 + 40) = 0;
  *(_WORD *)(v3 + 48) = 352;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 280))(v3, v7, v6);
  sub_226990A70(v3, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  swift_release();
  v79(v1, v78, v2);
  swift_retain();
  uint64_t v12 = sub_2269B8540();
  os_log_type_t v13 = sub_2269B9120();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = (void *)v0[99];
  uint64_t v16 = (void *)v0[91];
  uint64_t v17 = v0[66];
  if (v14)
  {
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 67109120;
    *(_DWORD *)(v18 + 4) = *(unsigned __int8 *)(v17 + 96);
    swift_release();
    _os_log_impl(&dword_22695C000, v12, v13, "Coordinator did show HoverText UI on external screen (isRunning=%{BOOL}d)", (uint8_t *)v18, 8u);
    MEMORY[0x22A65DA10](v18, -1, -1);
    sub_22698F5E0(v15);
  }
  else
  {

    swift_release();
    sub_22698F5E0(v15);
  }
  uint64_t v19 = v0[92];
  uint64_t v20 = v0[90];
  uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[83];
  uint64_t v22 = v0[73];
  uint64_t v23 = v0[70];

  v21(v22, v23);
  if (v19 == v20)
  {
    uint64_t v24 = v0[66];
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v25 = v0[85];
    uint64_t v26 = v0[66];
    if (*(unsigned char *)(v24 + 16) == 1)
    {
      id v27 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
      swift_beginAccess();
      uint64_t v28 = *v27;
      *id v27 = (uint64_t)sub_22698F494;
      v27[1] = v26;
      swift_retain();
      sub_22696C20C(v28);
      uint64_t v29 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange);
      swift_beginAccess();
      uint64_t v30 = *v29;
      *uint64_t v29 = (uint64_t)sub_22698F49C;
      v29[1] = v26;
      swift_retain();
      sub_22696C20C(v30);
      uint64_t v31 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement);
      swift_beginAccess();
      uint64_t v32 = *v31;
      *uint64_t v31 = (uint64_t)sub_22698F4D4;
      v31[1] = v26;
      swift_retain();
      sub_22696C20C(v32);
      uint64_t v33 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated);
      swift_beginAccess();
      uint64_t v34 = *v33;
      *uint64_t v33 = (uint64_t)sub_22698F4DC;
      v33[1] = v26;
    }
    else
    {
      uint64_t v40 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
      swift_beginAccess();
      uint64_t v41 = *v40;
      *uint64_t v40 = (uint64_t)sub_22698F2C8;
      v40[1] = v26;
      swift_retain();
      sub_22696C20C(v41);
      uint64_t v42 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide);
      swift_beginAccess();
      uint64_t v43 = *v42;
      *uint64_t v42 = (uint64_t)sub_22698F2D0;
      v42[1] = v26;
      swift_retain();
      sub_22696C20C(v43);
      uint64_t v44 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange);
      swift_beginAccess();
      uint64_t v45 = *v44;
      *uint64_t v44 = (uint64_t)sub_22698F308;
      v44[1] = v26;
      swift_retain();
      sub_22696C20C(v45);
      uint64_t v46 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame);
      swift_beginAccess();
      uint64_t v47 = *v46;
      *uint64_t v46 = (uint64_t)sub_22698F340;
      v46[1] = v26;
      swift_retain();
      sub_22696C20C(v47);
      uint64_t v48 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
      swift_beginAccess();
      uint64_t v49 = *v48;
      *uint64_t v48 = (uint64_t)sub_22698F378;
      v48[1] = v26;
      swift_retain();
      sub_22696C20C(v49);
      uint64_t v50 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode);
      swift_beginAccess();
      uint64_t v34 = *v50;
      uint64_t *v50 = (uint64_t)sub_22698F380;
      v50[1] = v26;
    }
    swift_retain();
    sub_22696C20C(v34);
    uint64_t v51 = v0[66];
    uint64_t v52 = (uint64_t *)(v0[85] + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
    swift_beginAccess();
    uint64_t v53 = *v52;
    *uint64_t v52 = (uint64_t)sub_2269861D4;
    v52[1] = 0;
    sub_22696C20C(v53);
    int v54 = *(unsigned __int8 *)(v51 + 16);
    uint64_t v55 = *(void *)(v51 + 32);
    uint64_t v56 = (uint64_t (*)(void *, char))v0[66];
    if (v54 == 1)
    {
      int v57 = (uint64_t (**)(void *, char))(v55
                                                  + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
      uint64_t v58 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
      char *v57 = sub_22698F3C0;
      v57[1] = v56;
      swift_retain();
      sub_22696C20C(v58);
      uint64_t v59 = (uint64_t (**)(unint64_t))(v55
                                                      + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
      uint64_t v60 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
      char *v59 = sub_22698F3C8;
      v59[1] = (uint64_t (*)(unint64_t))v56;
      swift_retain();
      sub_22696C20C(v60);
      uint64_t v61 = (uint64_t (**)())(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
      uint64_t v62 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
      void *v61 = sub_22698F3E4;
      v61[1] = (uint64_t (*)())v56;
      swift_retain();
      sub_22696C20C(v62);
      uint64_t v63 = (uint64_t (**)())(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
      uint64_t v64 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
      void *v63 = sub_22698F41C;
      v63[1] = (uint64_t (*)())v56;
      swift_retain();
      sub_22696C20C(v64);
      uint64_t v65 = (uint64_t (**)())(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
      uint64_t v66 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
      *uint64_t v65 = sub_22698F454;
      v65[1] = (uint64_t (*)())v56;
      swift_retain();
      sub_22696C20C(v66);
      uint64_t v67 = (void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
      uint64_t v68 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved);
      uint64_t v69 = sub_22698F48C;
    }
    else
    {
      uint64_t v67 = (void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
      uint64_t v68 = *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
      uint64_t v69 = sub_22698F3B8;
    }
    void *v67 = v69;
    v67[1] = v56;
    swift_retain();
    sub_22696C20C(v68);
    uint64_t v70 = (void *)v0[87];
    id v71 = objc_msgSend(self, sel_sharedInstance);
    id v72 = objc_msgSend(v71, sel_hoverTextPreferredActivatorKey);

    *(void *)(v55 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey) = v72;
    sub_2269B257C();

    *(unsigned char *)(v0[66] + 96) = 1;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v73 = (uint64_t (*)(void))v0[1];
    return v73();
  }
  else
  {
    uint64_t v35 = v0[92];
    uint64_t v36 = v0[89];
    if ((v36 & 0xC000000000000001) != 0) {
      uint64_t v37 = (uint64_t (*)())MEMORY[0x22A65CD20](v0[92]);
    }
    else {
      uint64_t v37 = (uint64_t (*)())*(id *)(v36 + 8 * v35 + 32);
    }
    v0[91] = v37;
    v0[92] = v35 + 1;
    if (__OFADD__(v35, 1))
    {
      __break(1u);
    }
    else
    {
      id v75 = v37;
      v0[93] = sub_2269B9070();
      uint64_t v76 = sub_2269B9060();
      uint64_t v39 = v77;
      v0[94] = v76;
      v0[95] = v77;
      uint64_t v37 = sub_226984068;
      uint64_t v38 = v76;
    }
    return MEMORY[0x270FA2498](v37, v38, v39);
  }
}

uint64_t sub_226984E7C()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[91];
  uint64_t v2 = (void *)v0[87];
  swift_release();

  uint64_t v3 = (void *)v0[99];
  uint64_t v4 = (void (*)(uint64_t, uint64_t, uint64_t))v0[81];
  uint64_t v5 = v0[80];
  uint64_t v6 = v0[72];
  uint64_t v7 = v0[70];
  swift_beginAccess();
  v4(v6, v5, v7);
  id v8 = v3;
  id v9 = v3;
  uint64_t v10 = sub_2269B8540();
  os_log_type_t v11 = sub_2269B9140();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v23 = (void (*)(uint64_t, uint64_t))v0[83];
    uint64_t v22 = v0[72];
    uint64_t v21 = v0[70];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_getErrorValue();
    uint64_t v14 = sub_2269B9520();
    v0[65] = sub_22697609C(v14, v15, &v24);
    sub_2269B9290();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22695C000, v10, v11, "Coordinator could not start HoverText: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v13, -1, -1);
    MEMORY[0x22A65DA10](v12, -1, -1);

    v23(v22, v21);
  }
  else
  {
    uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[83];
    uint64_t v17 = v0[72];
    uint64_t v18 = v0[70];

    v16(v17, v18);
  }
  *(unsigned char *)(v0[66] + 96) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_22698513C()
{
  uint64_t v23 = v0;
  swift_release();
  uint64_t v1 = (void *)v0[88];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[81];
  uint64_t v3 = v0[80];
  uint64_t v4 = v0[72];
  uint64_t v5 = v0[70];
  swift_beginAccess();
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_2269B8540();
  os_log_type_t v9 = sub_2269B9140();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[83];
    uint64_t v20 = v0[72];
    uint64_t v19 = v0[70];
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_getErrorValue();
    uint64_t v12 = sub_2269B9520();
    v0[65] = sub_22697609C(v12, v13, &v22);
    sub_2269B9290();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22695C000, v8, v9, "Coordinator could not start HoverText: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v11, -1, -1);
    MEMORY[0x22A65DA10](v10, -1, -1);

    v21(v20, v19);
  }
  else
  {
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[83];
    uint64_t v15 = v0[72];
    uint64_t v16 = v0[70];

    v14(v15, v16);
  }
  *(unsigned char *)(v0[66] + 96) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_2269853EC(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 25) = a2;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  *(void *)(v3 + 56) = swift_task_alloc();
  *(void *)(v3 + 64) = sub_2269B9080();
  *(void *)(v3 + 72) = sub_2269B9070();
  uint64_t v5 = sub_2269B9060();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v4;
  return MEMORY[0x270FA2498](sub_2269854BC, v5, v4);
}

uint64_t sub_2269854BC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  char v2 = *(unsigned char *)(v0 + 25);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v5 = sub_2269B90A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 1, 1, v5);
  id v6 = v4;
  swift_retain();
  uint64_t v7 = sub_2269B9070();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v9;
  *(unsigned char *)(v8 + 32) = v2;
  *(void *)(v8 + 40) = v4;
  *(void *)(v8 + 48) = v3;
  uint64_t v10 = sub_226989FC0(v1, (uint64_t)&unk_268149410, v8);
  *(void *)(v0 + 96) = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v11;
  uint64_t v12 = type metadata accessor for HoverTextRootViewController();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148B40);
  *(void *)(v0 + 112) = v13;
  void *v11 = v0;
  v11[1] = sub_22698564C;
  uint64_t v14 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB8](v0 + 16, v10, v12, v13, v14);
}

uint64_t sub_22698564C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_22698576C, v3, v2);
}

uint64_t sub_22698576C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  if (*(unsigned char *)(v0 + 24))
  {
    *(void *)(v0 + 32) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v4(v1);
  }
}

uint64_t sub_226985864(char a1)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
  }
  sub_226985918();
  return swift_release();
}

uint64_t sub_226985918()
{
  if (*(void *)(v0 + 88))
  {
    swift_bridgeObjectRetain();
    id v1 = sub_226982E68();
    uint64_t v2 = (void *)sub_2269B8F00();
    swift_bridgeObjectRelease();
    uint64_t result = MEMORY[0x22A65DAD0](v0 + 40);
    if (!result)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    objc_msgSend(v1, sel_hideAlertWithIdentifier_forService_, v2, result);

    swift_unknownObjectRelease();
    *(void *)(v0 + 80) = 0;
    *(void *)(v0 + 88) = 0;
    swift_bridgeObjectRelease();
  }
  id v4 = sub_226982E68();
  uint64_t v5 = (void *)sub_2269B8F00();
  id v6 = HTUILocString(v5);

  if (!v6)
  {
    sub_2269B8F30();
    id v6 = (id)sub_2269B8F00();
    swift_bridgeObjectRelease();
  }
  uint64_t result = MEMORY[0x22A65DAD0](v0 + 40);
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v7 = objc_msgSend(v4, sel_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_, v6, 0, 0, 0, 20, result, 1.0);

  swift_unknownObjectRelease();
  if (v7)
  {
    uint64_t v8 = sub_2269B8F30();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  *(void *)(v0 + 80) = v8;
  *(void *)(v0 + 88) = v10;

  return swift_bridgeObjectRelease();
}

void sub_226985AB8(SEL *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v7 = self;
  id v8 = objc_msgSend(v7, sel_sharedInstance);
  LOBYTE(a1) = [v8 *a1];

  if (a1) {
    return;
  }
  if (*(void *)(v4 + 88))
  {
    swift_bridgeObjectRetain();
    id v9 = sub_226982E68();
    uint64_t v10 = (void *)sub_2269B8F00();
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x22A65DAD0](v4 + 40);
    if (!v11)
    {
LABEL_15:
      __break(1u);
      return;
    }
    objc_msgSend(v9, sel_hideAlertWithIdentifier_forService_, v10, v11);

    swift_unknownObjectRelease();
    *(void *)(v4 + 80) = 0;
    *(void *)(v4 + 88) = 0;
    swift_bridgeObjectRelease();
  }
  id v12 = sub_226982E68();
  uint64_t v13 = (void *)sub_2269B8F00();
  id v14 = HTUILocString(v13);

  if (!v14)
  {
    sub_2269B8F30();
    id v14 = (id)sub_2269B8F00();
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = MEMORY[0x22A65DAD0](v4 + 40);
  if (!v15)
  {
    __break(1u);
    goto LABEL_15;
  }
  id v16 = objc_msgSend(v12, sel_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_, v14, 0, 0, 0, 20, v15, 2.0);

  swift_unknownObjectRelease();
  if (v16)
  {
    uint64_t v17 = sub_2269B8F30();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  *(void *)(v4 + 80) = v17;
  *(void *)(v4 + 88) = v19;
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v7, sel_sharedInstance);
  objc_msgSend(v20, *a4, 1);
}

uint64_t sub_226985CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_2269B9080();
  sub_22697707C(a1);
  swift_retain();
  uint64_t v8 = sub_2269B9070();
  id v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  void v9[3] = v10;
  sub_226977020(a1, (uint64_t)(v9 + 4));
  v9[11] = a2;
  sub_226988F34((uint64_t)v6, (uint64_t)&unk_268149310, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_226985E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_2269B9080();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v10 = sub_2269B9070();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  void v11[2] = v10;
  v11[3] = v12;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  sub_226988F34((uint64_t)v8, (uint64_t)&unk_2681492F0, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_226985F68(uint64_t a1, uint64_t a2, char a3, void *a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_2269B9080();
  id v14 = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_2269B9070();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v17;
  *(void *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a2;
  *(unsigned char *)(v16 + 48) = a3;
  *(void *)(v16 + 56) = a4;
  *(void *)(v16 + 64) = a5;
  sub_226988F34((uint64_t)v12, (uint64_t)&unk_268149400, v16);
  return swift_release();
}

uint64_t sub_2269860B4(char a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_2269B9080();
  swift_retain();
  uint64_t v8 = sub_2269B9070();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v10;
  *(void *)(v9 + 32) = a2;
  *(unsigned char *)(v9 + 40) = a1;
  sub_226988F34((uint64_t)v6, (uint64_t)&unk_2681493C0, v9);
  return swift_release();
}

uint64_t sub_2269861D4(int a1, uint64_t a2)
{
  uint64_t v4 = sub_2269B8550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  sub_226991670(a2, (uint64_t)v18);
  uint64_t v9 = sub_2269B8540();
  os_log_type_t v10 = sub_2269B9130();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v12;
    *(_DWORD *)uint64_t v11 = 67109378;
    LODWORD(v16[0]) = a1;
    sub_2269B9290();
    *(_WORD *)(v11 + 8) = 2080;
    sub_226991670((uint64_t)v18, (uint64_t)v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681493A0);
    uint64_t v13 = sub_2269B8F40();
    v16[0] = sub_22697609C(v13, v14, &v17);
    sub_2269B9290();
    swift_bridgeObjectRelease();
    sub_22696B8F0((uint64_t)v18, &qword_2681493A0);
    _os_log_impl(&dword_22695C000, v9, v10, "Coordinator got AX notification: %d. data: %s", (uint8_t *)v11, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v12, -1, -1);
    MEMORY[0x22A65DA10](v11, -1, -1);
  }
  else
  {
    sub_22696B8F0((uint64_t)v18, &qword_2681493A0);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_226986444(void *a1, char a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_2269B9080();
  id v10 = a1;
  swift_retain();
  uint64_t v11 = sub_2269B9070();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  *(void *)(v12 + 32) = v10;
  *(void *)(v12 + 40) = a3;
  *(unsigned char *)(v12 + 48) = a2;
  sub_226988F34((uint64_t)v8, (uint64_t)&unk_268149388, v12);
  return swift_release();
}

uint64_t sub_22698657C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_2269B9080();
  swift_retain();
  uint64_t v8 = sub_2269B9070();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v10;
  *(void *)(v9 + 32) = a2;
  *(_DWORD *)(v9 + 40) = a1;
  *(unsigned char *)(v9 + 44) = BYTE4(a1) & 1;
  sub_2269890E0((uint64_t)v6, (uint64_t)&unk_268149360, v9);
  return swift_release();
}

uint64_t sub_2269866A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2269B9080();
  swift_retain();
  uint64_t v9 = sub_2269B9070();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = a1;
  sub_226988F34((uint64_t)v7, a3, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2269867B8(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_2269B9080();
  swift_retain();
  uint64_t v10 = sub_2269B9070();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v12;
  *(void *)(v11 + 32) = a1;
  *(double *)(v11 + 40) = a2;
  *(double *)(v11 + 48) = a3;
  sub_226988F34((uint64_t)v8, (uint64_t)&unk_268149320, v11);
  return swift_release();
}

uint64_t sub_2269868E4(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2269B90A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_2269B9080();
  swift_retain();
  id v8 = a1;
  uint64_t v9 = sub_2269B9070();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = a2;
  v10[5] = v8;
  sub_226988F34((uint64_t)v6, (uint64_t)&unk_268149398, (uint64_t)v10);
  return swift_release();
}

uint64_t HoverTextCoordinator.stopHoverText()()
{
  v1[35] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  v1[36] = swift_task_alloc();
  uint64_t v2 = sub_2269B8550();
  v1[37] = v2;
  v1[38] = *(void *)(v2 - 8);
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  v1[42] = swift_task_alloc();
  v1[43] = sub_2269B9080();
  v1[44] = sub_2269B9070();
  uint64_t v4 = sub_2269B9060();
  v1[45] = v4;
  v1[46] = v3;
  return MEMORY[0x270FA2498](sub_226986B64, v4, v3);
}

uint64_t sub_226986B64()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v4 = sub_2269B8530();
  *(void *)(v0 + 376) = v4;
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 384) = v5;
  *(void *)(v0 + 392) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  swift_retain();
  uint64_t v6 = sub_2269B8540();
  os_log_type_t v7 = sub_2269B9120();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(v0 + 280);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    *(_DWORD *)(v0 + 520) = *(unsigned __int8 *)(v8 + 96);
    sub_2269B9290();
    swift_release();
    _os_log_impl(&dword_22695C000, v6, v7, "Coordinator asked to stop HoverText. isRunning=%{BOOL}d", v9, 8u);
    MEMORY[0x22A65DA10](v9, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v10 = *(void *)(v0 + 336);
  uint64_t v11 = *(void *)(v0 + 296);
  uint64_t v12 = *(void *)(v0 + 304);
  uint64_t v13 = *(void *)(v0 + 280);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(void *)(v0 + 400) = v14;
  *(void *)(v0 + 408) = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v10, v11);
  if (*(unsigned char *)(v13 + 96) == 1)
  {
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 416) = v15;
    void *v15 = v0;
    v15[1] = sub_226986DC0;
    return sub_2269882C8(0, 1);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_226986DC0(void *a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 424) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 360);
    uint64_t v6 = *(void *)(v4 + 368);
    os_log_type_t v7 = sub_226988038;
  }
  else
  {

    uint64_t v5 = *(void *)(v4 + 360);
    uint64_t v6 = *(void *)(v4 + 368);
    os_log_type_t v7 = sub_226986EE4;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_226986EE4()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v4 = *(void *)(v0 + 296);
  swift_beginAccess();
  v1(v3, v2, v4);
  swift_retain();
  uint64_t v5 = sub_2269B8540();
  os_log_type_t v6 = sub_2269B9120();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 280);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    *(_DWORD *)(v0 + 252) = *(unsigned __int8 *)(v7 + 96);
    sub_2269B9290();
    swift_release();
    _os_log_impl(&dword_22695C000, v5, v6, "Coordinator did hide HoverText UI on main screen (isRunning=%{BOOL}d)", v8, 8u);
    MEMORY[0x22A65DA10](v8, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v9 = *(void *)(v0 + 280);
  (*(void (**)(void, void))(v0 + 400))(*(void *)(v0 + 328), *(void *)(v0 + 296));
  uint64_t v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = 0;

  if (*(unsigned char *)(v9 + 16))
  {
    uint64_t v11 = &selRef_hoverTextShowedBanner;
    uint64_t v12 = &selRef_setHoverTextShowedBanner_;
    uint64_t v13 = 0x62617369642E7468;
    uint64_t v14 = 0xEB0000000064656CLL;
  }
  else
  {
    uint64_t v11 = &selRef_hoverTextTypingShowedBanner;
    uint64_t v12 = &selRef_setHoverTextTypingShowedBanner_;
    uint64_t v13 = 0x617369642E747468;
    uint64_t v14 = 0xEC00000064656C62;
  }
  sub_22698852C((SEL *)v11, v13, v14, (SEL *)v12);
  uint64_t v15 = *(void *)(v0 + 280);
  swift_beginAccess();
  unint64_t v16 = *(void *)(v15 + 64);
  *(void *)(v0 + 432) = v16;
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_2269B9450();
    *(void *)(v0 + 440) = v23;
    if (v23) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 440) = v17;
    if (v17)
    {
LABEL_9:
      swift_beginAccess();
      uint64_t v18 = *(void *)(v0 + 432);
      if ((v18 & 0xC000000000000001) != 0) {
        id v19 = (id)MEMORY[0x22A65CD20](0);
      }
      else {
        id v19 = *(id *)(v18 + 32);
      }
      *(void *)(v0 + 448) = v19;
      *(void *)(v0 + 456) = 1;
      id v20 = v19;
      *(void *)(v0 + 464) = sub_2269B9070();
      uint64_t v22 = sub_2269B9060();
      *(void *)(v0 + 472) = v22;
      *(void *)(v0 + 480) = v21;
      return MEMORY[0x270FA2498](sub_226987488, v22, v21);
    }
  }
  uint64_t v24 = *(void *)(v0 + 280);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v25 = *(void *)(v24 + 24);
  AXRuntimeClient.disableAccessibility()();
  if (v26)
  {
    id v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
    uint64_t v28 = *(void *)(v0 + 376);
    uint64_t v29 = *(void *)(v0 + 312);
    uint64_t v30 = *(void *)(v0 + 296);
    swift_beginAccess();
    v27(v29, v28, v30);
    id v31 = v26;
    id v32 = v26;
    uint64_t v33 = sub_2269B8540();
    os_log_type_t v34 = sub_2269B9140();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v37 = *(void *)(v0 + 312);
    uint64_t v38 = *(void *)(v0 + 296);
    if (v35)
    {
      uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      uint64_t v49 = *(void *)(v0 + 312);
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v51 = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      swift_getErrorValue();
      uint64_t v41 = sub_2269B9520();
      *(void *)(v0 + 272) = sub_22697609C(v41, v42, &v51);
      sub_2269B9290();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22695C000, v33, v34, "Coordinator could not stop HoverText: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v40, -1, -1);
      MEMORY[0x22A65DA10](v39, -1, -1);

      v50(v49, v38);
    }
    else
    {

      v36(v37, v38);
    }
  }
  else
  {
    uint64_t v43 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
    swift_beginAccess();
    uint64_t v44 = *v43;
    *uint64_t v43 = 0;
    v43[1] = 0;
    sub_22696C20C(v44);
    uint64_t v45 = (uint64_t *)(v25 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
    swift_beginAccess();
    uint64_t v46 = *v45;
    *uint64_t v45 = 0;
    v45[1] = 0;
    sub_22696C20C(v46);
    sub_2269B2648();
  }
  *(unsigned char *)(*(void *)(v0 + 280) + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47();
}

uint64_t sub_226987488()
{
  uint64_t v1 = (void *)v0[56];
  uint64_t v3 = v0[35];
  uint64_t v2 = v0[36];
  uint64_t v4 = sub_2269B90A0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, 1, 1, v4);
  swift_retain();
  id v6 = v1;
  uint64_t v7 = sub_2269B9070();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v9;
  *(unsigned char *)(v8 + 32) = 0;
  *(void *)(v8 + 40) = v3;
  *(void *)(v8 + 48) = v1;
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4);
  uint64_t v11 = v0[36];
  if (v10 == 1)
  {
    sub_22696B8F0(v0[36], &qword_268149238);
    if (v7)
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_2269B9060();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2269B9090();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v4);
    if (*(void *)(v8 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149280);
  if (v14 | v12)
  {
    v0[2] = 0;
    v0[3] = 0;
    v0[4] = v12;
    v0[5] = v14;
  }
  uint64_t v16 = swift_task_create();
  v0[61] = v16;
  uint64_t v17 = (void *)swift_task_alloc();
  v0[62] = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148B40);
  v0[63] = v18;
  *uint64_t v17 = v0;
  v17[1] = sub_226987718;
  uint64_t v19 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB8](v0 + 30, v16, v15, v18, v19);
}

uint64_t sub_226987718()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 480);
  uint64_t v3 = *(void *)(v1 + 472);
  return MEMORY[0x270FA2498](sub_226987838, v3, v2);
}

uint64_t sub_226987838()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 240);
  *(void *)(v0 + 512) = v1;
  if (*(unsigned char *)(v0 + 248))
  {
    uint64_t v2 = *(void **)(v0 + 448);
    *(void *)(v0 + 256) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v3 = *(void *)(v0 + 360);
    uint64_t v4 = *(void *)(v0 + 368);
    uint64_t v5 = sub_226987DA0;
  }
  else
  {
    id v6 = *(void **)(v0 + 448);
    swift_release();
    sub_22698F5E0(v1);

    uint64_t v3 = *(void *)(v0 + 360);
    uint64_t v4 = *(void *)(v0 + 368);
    uint64_t v5 = sub_226987920;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_226987920()
{
  uint64_t v46 = v0;
  (*(void (**)(void, void, void))(v0 + 384))(*(void *)(v0 + 320), *(void *)(v0 + 376), *(void *)(v0 + 296));
  uint64_t v1 = sub_2269B8540();
  os_log_type_t v2 = sub_2269B9120();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_22695C000, v1, v2, "Coordinator did hide HoverText UI on external screen", v3, 2u);
    MEMORY[0x22A65DA10](v3, -1, -1);
    uint64_t v4 = *(NSObject **)(v0 + 448);
  }
  else
  {
    uint64_t v4 = v1;
    uint64_t v1 = *(NSObject **)(v0 + 448);
  }
  uint64_t v5 = *(void *)(v0 + 456);
  uint64_t v6 = *(void *)(v0 + 440);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  uint64_t v8 = *(void *)(v0 + 320);
  uint64_t v9 = *(void *)(v0 + 296);

  v7(v8, v9);
  if (v5 == v6)
  {
    uint64_t v10 = *(void *)(v0 + 280);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v11 = *(void *)(v10 + 24);
    AXRuntimeClient.disableAccessibility()();
    if (v12)
    {
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
      uint64_t v14 = *(void *)(v0 + 376);
      uint64_t v15 = *(void *)(v0 + 312);
      uint64_t v16 = *(void *)(v0 + 296);
      swift_beginAccess();
      v13(v15, v14, v16);
      id v17 = v12;
      id v18 = v12;
      uint64_t v19 = sub_2269B8540();
      os_log_type_t v20 = sub_2269B9140();
      BOOL v21 = os_log_type_enabled(v19, v20);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      uint64_t v23 = *(void *)(v0 + 312);
      uint64_t v24 = *(void *)(v0 + 296);
      if (v21)
      {
        uint64_t v44 = *(void *)(v0 + 312);
        uint64_t v43 = *(void *)(v0 + 296);
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        uint64_t v45 = v26;
        *(_DWORD *)uint64_t v25 = 136315138;
        swift_getErrorValue();
        uint64_t v27 = sub_2269B9520();
        *(void *)(v0 + 272) = sub_22697609C(v27, v28, &v45);
        sub_2269B9290();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_22695C000, v19, v20, "Coordinator could not stop HoverText: %s", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A65DA10](v26, -1, -1);
        MEMORY[0x22A65DA10](v25, -1, -1);

        v22(v44, v43);
      }
      else
      {

        v22(v23, v24);
      }
    }
    else
    {
      os_log_type_t v34 = (uint64_t *)(v11 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange);
      swift_beginAccess();
      uint64_t v35 = *v34;
      *os_log_type_t v34 = 0;
      v34[1] = 0;
      sub_22696C20C(v35);
      uint64_t v36 = (uint64_t *)(v11 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification);
      swift_beginAccess();
      uint64_t v37 = *v36;
      uint64_t *v36 = 0;
      v36[1] = 0;
      sub_22696C20C(v37);
      sub_2269B2648();
    }
    *(unsigned char *)(*(void *)(v0 + 280) + 96) = 0;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
  else
  {
    uint64_t v29 = *(void *)(v0 + 456);
    uint64_t v30 = *(void *)(v0 + 432);
    if ((v30 & 0xC000000000000001) != 0) {
      id v31 = (uint64_t (*)())MEMORY[0x22A65CD20](*(void *)(v0 + 456));
    }
    else {
      id v31 = (uint64_t (*)())*(id *)(v30 + 8 * v29 + 32);
    }
    *(void *)(v0 + 448) = v31;
    *(void *)(v0 + 456) = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v38 = v31;
      *(void *)(v0 + 464) = sub_2269B9070();
      uint64_t v39 = sub_2269B9060();
      uint64_t v33 = v40;
      *(void *)(v0 + 472) = v39;
      *(void *)(v0 + 480) = v40;
      id v31 = sub_226987488;
      uint64_t v32 = v39;
    }
    return MEMORY[0x270FA2498](v31, v32, v33);
  }
}

uint64_t sub_226987DA0()
{
  uint64_t v24 = v0;
  uint64_t v1 = (void *)v0[56];
  swift_release();

  os_log_type_t v2 = (void *)v0[64];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t))v0[48];
  uint64_t v4 = v0[47];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[37];
  swift_beginAccess();
  v3(v5, v4, v6);
  id v7 = v2;
  id v8 = v2;
  uint64_t v9 = sub_2269B8540();
  os_log_type_t v10 = sub_2269B9140();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v21 = v0[39];
    uint64_t v20 = v0[37];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_getErrorValue();
    uint64_t v13 = sub_2269B9520();
    v0[34] = sub_22697609C(v13, v14, &v23);
    sub_2269B9290();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22695C000, v9, v10, "Coordinator could not stop HoverText: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v12, -1, -1);
    MEMORY[0x22A65DA10](v11, -1, -1);

    v22(v21, v20);
  }
  else
  {
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v16 = v0[39];
    uint64_t v17 = v0[37];

    v15(v16, v17);
  }
  *(unsigned char *)(v0[35] + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_226988038()
{
  uint64_t v23 = v0;
  swift_release();
  uint64_t v1 = (void *)v0[53];
  os_log_type_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[48];
  uint64_t v3 = v0[47];
  uint64_t v4 = v0[39];
  uint64_t v5 = v0[37];
  swift_beginAccess();
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_2269B8540();
  os_log_type_t v9 = sub_2269B9140();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v20 = v0[39];
    uint64_t v19 = v0[37];
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    swift_getErrorValue();
    uint64_t v12 = sub_2269B9520();
    v0[34] = sub_22697609C(v12, v13, &v22);
    sub_2269B9290();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22695C000, v8, v9, "Coordinator could not stop HoverText: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v11, -1, -1);
    MEMORY[0x22A65DA10](v10, -1, -1);

    v21(v20, v19);
  }
  else
  {
    unint64_t v14 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v15 = v0[39];
    uint64_t v16 = v0[37];

    v14(v15, v16);
  }
  *(unsigned char *)(v0[35] + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_2269882C8(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 25) = a2;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  *(void *)(v3 + 56) = swift_task_alloc();
  *(void *)(v3 + 64) = sub_2269B9080();
  *(void *)(v3 + 72) = sub_2269B9070();
  uint64_t v5 = sub_2269B9060();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v4;
  return MEMORY[0x270FA2498](sub_226988398, v5, v4);
}

uint64_t sub_226988398()
{
  uint64_t v1 = *(void *)(v0 + 56);
  char v2 = *(unsigned char *)(v0 + 25);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v5 = sub_2269B90A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 1, 1, v5);
  id v6 = v4;
  swift_retain();
  uint64_t v7 = sub_2269B9070();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v9;
  *(unsigned char *)(v8 + 32) = v2;
  *(void *)(v8 + 40) = v3;
  *(void *)(v8 + 48) = v4;
  uint64_t v10 = sub_22698A144(v1, (uint64_t)&unk_2681492D0, v8);
  *(void *)(v0 + 96) = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149280);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148B40);
  *(void *)(v0 + 112) = v13;
  void *v11 = v0;
  v11[1] = sub_22698564C;
  uint64_t v14 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB8](v0 + 16, v10, v12, v13, v14);
}

void sub_22698852C(SEL *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_sharedInstance);
  LODWORD(a1) = [v8 *a1];

  if (!a1) {
    return;
  }
  if (*(void *)(v4 + 88))
  {
    swift_bridgeObjectRetain();
    id v9 = sub_226982E68();
    uint64_t v10 = (void *)sub_2269B8F00();
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x22A65DAD0](v4 + 40);
    if (!v11)
    {
LABEL_16:
      __break(1u);
      return;
    }
    objc_msgSend(v9, sel_hideAlertWithIdentifier_forService_, v10, v11);

    swift_unknownObjectRelease();
    *(void *)(v4 + 80) = 0;
    *(void *)(v4 + 88) = 0;
    swift_bridgeObjectRelease();
  }
  id v12 = sub_226982E68();
  uint64_t v13 = (void *)sub_2269B8F00();
  id v14 = HTUILocString(v13);

  if (!v14)
  {
    sub_2269B8F30();
    id v14 = (id)sub_2269B8F00();
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = MEMORY[0x22A65DAD0](v4 + 40);
  if (!v15)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v16 = objc_msgSend(v12, sel_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_, v14, 0, 0, 0, 20, v15, 2.0);

  swift_unknownObjectRelease();
  if (v16)
  {
    uint64_t v17 = sub_2269B8F30();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  *(void *)(v4 + 80) = v17;
  *(void *)(v4 + 88) = v19;
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v7, sel_sharedInstance);
  objc_msgSend(v20, *a4, 0);
}

Swift::Void __swiftcall HoverTextCoordinator.showAlert(_:)(Swift::String a1)
{
  char v2 = *(void **)(v1 + 72);
  if (v2)
  {
    object = a1._object;
    uint64_t countAndFlagsBits = a1._countAndFlagsBits;
    id v6 = v2;
    v5._uint64_t countAndFlagsBits = countAndFlagsBits;
    v5._object = object;
    HoverTextRootViewController.showAlert(_:)(v5);
  }
}

Swift::Void __swiftcall HoverTextCoordinator.addSceneForExternalDisplay(_:)(UIWindowScene a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v7 = a1.super.super.super.isa;
  MEMORY[0x22A65C9B0]();
  if (*(void *)((*(void *)(v1 + 64) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 64) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_2269B9040();
  sub_2269B9050();
  sub_2269B9030();
  swift_endAccess();
  if (*(unsigned char *)(v1 + 96) == 1)
  {
    uint64_t v8 = sub_2269B90A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
    sub_2269B9080();
    id v9 = v7;
    swift_retain();
    uint64_t v10 = sub_2269B9070();
    uint64_t v11 = (void *)swift_allocObject();
    uint64_t v12 = MEMORY[0x263F8F500];
    void v11[2] = v10;
    v11[3] = v12;
    v11[4] = v2;
    v11[5] = v9;
    sub_226988F34((uint64_t)v6, (uint64_t)&unk_268149290, (uint64_t)v11);
    swift_release();
  }
}

uint64_t sub_226988990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  uint64_t v7 = sub_2269B8550();
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = sub_2269B9080();
  v5[14] = sub_2269B9070();
  uint64_t v8 = (void *)swift_task_alloc();
  v5[15] = v8;
  void *v8 = v5;
  v8[1] = sub_226988AC0;
  return sub_2269853EC(a5, 0);
}

uint64_t sub_226988AC0(void *a1)
{
  *(void *)(*(void *)v2 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_2269B9060();
    uint64_t v6 = v5;
    uint64_t v7 = sub_226988DE0;
  }
  else
  {

    uint64_t v4 = sub_2269B9060();
    uint64_t v6 = v8;
    uint64_t v7 = sub_226988C48;
  }
  return MEMORY[0x270FA2498](v7, v4, v6);
}

uint64_t sub_226988C48()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  swift_release();
  uint64_t v4 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_retain();
  uint64_t v5 = sub_2269B8540();
  os_log_type_t v6 = sub_2269B9120();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    *(_DWORD *)(v0 + 136) = *(unsigned __int8 *)(v7 + 96);
    sub_2269B9290();
    swift_release();
    _os_log_impl(&dword_22695C000, v5, v6, "Did show HoverText UI on external screen (isRunning=%{BOOL}d)", v8, 8u);
    MEMORY[0x22A65DA10](v8, -1, -1);
  }
  else
  {
    swift_release();
  }

  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  id v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_226988DE0()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  swift_release();
  uint64_t v4 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_2269B8540();
  os_log_type_t v6 = sub_2269B9140();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22695C000, v5, v6, "Cannot attach HT view controller for external display", v7, 2u);
    MEMORY[0x22A65DA10](v7, -1, -1);
  }

  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_226988F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2269B90A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2269B9090();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22696B8F0(a1, &qword_268149238);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2269B9060();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2269890E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2269B90A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2269B9090();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22696B8F0(a1, &qword_268149238);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2269B9060();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149378);
  return swift_task_create();
}

Swift::Void __swiftcall HoverTextCoordinator.removeSceneForExternalDisplay(_:)(UIWindowScene a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v7 = a1.super.super.super.isa;
  uint64_t v8 = sub_226990060((unint64_t *)(v1 + 64), (uint64_t)v7);

  unint64_t v9 = *(void *)(v1 + 64);
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10 >= v8) {
      goto LABEL_3;
    }
LABEL_7:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_2269B9450();
  swift_bridgeObjectRelease();
  if (v10 < v8) {
    goto LABEL_7;
  }
LABEL_3:
  sub_22699037C(v8, v10);
  swift_endAccess();
  if (*(unsigned char *)(v1 + 96) == 1)
  {
    uint64_t v11 = sub_2269B90A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
    sub_2269B9080();
    uint64_t v12 = v7;
    swift_retain();
    uint64_t v13 = sub_2269B9070();
    id v14 = (void *)swift_allocObject();
    uint64_t v15 = MEMORY[0x263F8F500];
    void v14[2] = v13;
    v14[3] = v15;
    v14[4] = v2;
    v14[5] = v12;
    sub_226988F34((uint64_t)v6, (uint64_t)&unk_2681492A0, (uint64_t)v14);
    swift_release();
  }
}

uint64_t sub_226989474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  uint64_t v7 = sub_2269B8550();
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = sub_2269B9080();
  v5[14] = sub_2269B9070();
  uint64_t v8 = (void *)swift_task_alloc();
  v5[15] = v8;
  void *v8 = v5;
  v8[1] = sub_2269895A4;
  return sub_2269882C8(a5, 0);
}

uint64_t sub_2269895A4(void *a1)
{
  *(void *)(*(void *)v2 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_2269B9060();
    uint64_t v6 = v5;
    uint64_t v7 = sub_2269898C4;
  }
  else
  {

    uint64_t v4 = sub_2269B9060();
    uint64_t v6 = v8;
    uint64_t v7 = sub_22698972C;
  }
  return MEMORY[0x270FA2498](v7, v4, v6);
}

uint64_t sub_22698972C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  swift_release();
  uint64_t v4 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_retain();
  uint64_t v5 = sub_2269B8540();
  os_log_type_t v6 = sub_2269B9120();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    *(_DWORD *)(v0 + 136) = *(unsigned __int8 *)(v7 + 96);
    sub_2269B9290();
    swift_release();
    _os_log_impl(&dword_22695C000, v5, v6, "Did hide HoverText UI on external screen (isRunning=%{BOOL}d)", v8, 8u);
    MEMORY[0x22A65DA10](v8, -1, -1);
  }
  else
  {
    swift_release();
  }

  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_2269898C4()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  swift_release();
  uint64_t v4 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_2269B8540();
  os_log_type_t v6 = sub_2269B9140();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22695C000, v5, v6, "Cannot detach HT view controller for external display", v7, 2u);
    MEMORY[0x22A65DA10](v7, -1, -1);
  }

  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_226989A18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 128) = a5;
  *(void *)(v6 + 136) = a6;
  *(unsigned char *)(v6 + 193) = a4;
  *(void *)(v6 + 120) = a1;
  sub_2269B9080();
  *(void *)(v6 + 144) = sub_2269B9070();
  uint64_t v8 = sub_2269B9060();
  *(void *)(v6 + 152) = v8;
  *(void *)(v6 + 160) = v7;
  return MEMORY[0x270FA2498](sub_226989AB8, v8, v7);
}

uint64_t sub_226989AB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (_DWORD *)(v0 + 80);
  if (*(unsigned char *)(v1 + 193))
  {
    uint64_t v3 = 0xE400000000000000;
    uint64_t v4 = 1852399949;
  }
  else
  {
    uint64_t v5 = *(void **)(v1 + 128);
    if (v5) {
      LODWORD(v5) = objc_msgSend(v5, sel__accessibilityDisplayId);
    }
    _DWORD *v2 = v5;
    sub_2269B94D0();
    sub_2269B8F80();
    swift_bridgeObjectRelease();
    uint64_t v4 = 0x6C616E7265747845;
    uint64_t v3 = 0xE90000000000002DLL;
  }
  uint64_t v6 = *(void *)(v1 + 128);
  uint64_t v7 = *(void *)(v1 + 136);
  char v8 = *(unsigned char *)(v7 + 16);
  id v9 = objc_allocWithZone((Class)type metadata accessor for HoverTextRootViewController());
  uint64_t v10 = (void *)sub_22696BCB4(v4, v3, v8);
  *(void *)(v1 + 168) = v10;
  id v11 = sub_226982E68();
  *(void *)(v1 + 176) = v11;
  char v12 = *(unsigned char *)(v7 + 16);
  uint64_t v13 = MEMORY[0x22A65DAD0](v7 + 40);
  *(void *)(v1 + 184) = v13;
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 56) = v1 + 192;
  *(void *)(v1 + 24) = sub_226989CC4;
  uint64_t v14 = swift_continuation_init();
  *(void *)(v1 + 80) = MEMORY[0x263EF8330];
  *(void *)(v1 + 88) = 0x40000000;
  *(void *)(v1 + 96) = sub_226989F9C;
  *(void *)(v1 + 104) = &block_descriptor_119;
  *(void *)(v1 + 112) = v14;
  objc_msgSend(v11, sel_addContentViewController_withUserInteractionEnabled_forService_context_userInterfaceStyle_forWindowScene_completion_, v10, (v12 & 1) == 0, v13, 0, 2, v6, v2);
  return MEMORY[0x270FA23F0](v1 + 16);
}

uint64_t sub_226989CC4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return MEMORY[0x270FA2498](sub_226989DCC, v2, v1);
}

void sub_226989DCC()
{
  uint64_t v1 = *(void **)(v0 + 176);
  uint64_t v2 = *(void **)(v0 + 168);
  swift_release();
  int v3 = *(unsigned __int8 *)(v0 + 192);

  swift_unknownObjectRelease();
  if (v3 == 1)
  {
    if (*(unsigned char *)(v0 + 193) == 1)
    {
      uint64_t v4 = *(void **)(v0 + 168);
      uint64_t v5 = *(void *)(v0 + 136);
      id v6 = *(id *)(v5 + 72);
      *(void *)(v5 + 72) = v4;
      id v7 = v4;
    }
    else
    {
      id v11 = *(void **)(v0 + 128);
      if (!v11) {
        goto LABEL_15;
      }
      char v12 = *(void **)(v0 + 168);
      swift_beginAccess();
      id v13 = v12;
      id v6 = v11;
      sub_22698F6B0((uint64_t)v13, v6);
      swift_endAccess();
    }

    id v14 = objc_msgSend(*(id *)(v0 + 168), sel_view);
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = objc_msgSend(v14, sel_window);

      if (v16)
      {
        sub_2269B2868(v16);
      }
      **(void **)(v0 + 120) = *(void *)(v0 + 168);
      uint64_t v10 = *(void (**)(void))(v0 + 8);
      goto LABEL_11;
    }
    __break(1u);
LABEL_15:
    __break(1u);
    return;
  }
  char v8 = *(void **)(v0 + 168);
  sub_2269908C8();
  swift_allocError();
  *id v9 = 0xD000000000000029;
  v9[1] = 0x80000002269BDD80;
  swift_willThrow();

  uint64_t v10 = *(void (**)(void))(v0 + 8);
LABEL_11:
  v10();
}

uint64_t sub_226989F9C(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_226989FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2269B90A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2269B9090();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22696B8F0(a1, &qword_268149238);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2269B9060();
    swift_unknownObjectRelease();
  }
LABEL_5:
  type metadata accessor for HoverTextRootViewController();
  return swift_task_create();
}

uint64_t sub_22698A144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2269B90A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2269B9090();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22696B8F0(a1, &qword_268149238);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2269B9060();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149280);
  return swift_task_create();
}

uint64_t sub_22698A2CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 192) = a5;
  *(void *)(v6 + 200) = a6;
  *(unsigned char *)(v6 + 281) = a4;
  *(void *)(v6 + 184) = a1;
  sub_2269B9080();
  *(void *)(v6 + 208) = sub_2269B9070();
  uint64_t v8 = sub_2269B9060();
  *(void *)(v6 + 216) = v8;
  *(void *)(v6 + 224) = v7;
  return MEMORY[0x270FA2498](sub_22698A36C, v8, v7);
}

uint64_t sub_22698A36C(id a1)
{
  uint64_t v2 = v1 + 280;
  if (*(unsigned char *)(v1 + 281) == 1)
  {
    int v3 = *(void **)(*(void *)(v1 + 192) + 72);
    *(void *)(v1 + 232) = v3;
    if (v3)
    {
      id v4 = v3;
      a1 = objc_msgSend(v4, sel_view);
      if (a1)
      {
        uint64_t v5 = a1;
        id v6 = objc_msgSend(a1, sel_window);

        if (v6)
        {
          sub_2269B2F60(v6);
        }
        uint64_t v7 = *(void *)(v1 + 192);
        id v8 = sub_226982E68();
        *(void *)(v1 + 240) = v8;
        int v9 = *(unsigned __int8 *)(v7 + 16);
        a1 = (id)MEMORY[0x22A65DAD0](v7 + 40);
        *(void *)(v1 + 248) = a1;
        if (a1)
        {
          id v10 = a1;
          id v11 = (void *)(v1 + 16);
          uint64_t v12 = v9 ^ 1u;
          *(void *)(v1 + 16) = v1;
          *(void *)(v1 + 56) = v2;
          *(void *)(v1 + 24) = sub_22698A69C;
          *(void *)(v1 + 176) = swift_continuation_init();
          *(void *)(v1 + 144) = MEMORY[0x263EF8330];
          *(void *)(v1 + 152) = 0x40000000;
          id v13 = &block_descriptor_32;
          goto LABEL_12;
        }
        goto LABEL_22;
      }
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
  }
  else
  {
    id v14 = *(void **)(v1 + 200);
    if (!v14)
    {
      __break(1u);
      goto LABEL_21;
    }
    uint64_t v15 = *(void *)(v1 + 192);
    swift_beginAccess();
    uint64_t v16 = *(void *)(v15 + 56);
    id v17 = v14;
    id v4 = sub_2269829DC(v17, v16);
    *(void *)(v1 + 256) = v4;

    if (v4)
    {
      uint64_t v18 = *(void *)(v1 + 192);
      swift_endAccess();
      id v8 = sub_226982E68();
      *(void *)(v1 + 264) = v8;
      int v19 = *(unsigned __int8 *)(v18 + 16);
      a1 = (id)MEMORY[0x22A65DAD0](v18 + 40);
      *(void *)(v1 + 272) = a1;
      if (a1)
      {
        id v10 = a1;
        id v11 = (void *)(v1 + 80);
        uint64_t v12 = v19 ^ 1u;
        *(void *)(v1 + 80) = v1;
        *(void *)(v1 + 120) = v2;
        *(void *)(v1 + 88) = sub_22698A8A0;
        *(void *)(v1 + 176) = swift_continuation_init();
        *(void *)(v1 + 144) = MEMORY[0x263EF8330];
        *(void *)(v1 + 152) = 0x40000000;
        id v13 = &block_descriptor_30;
LABEL_12:
        *(void *)(v1 + 160) = sub_226989F9C;
        *(void *)(v1 + 168) = v13;
        objc_msgSend(v8, sel_removeContentViewController_withUserInteractionEnabled_forService_context_completion_, v4, v12, v10, 0, v1 + 144);
        a1 = v11;
        return MEMORY[0x270FA23F0](a1);
      }
LABEL_23:
      __break(1u);
      return MEMORY[0x270FA23F0](a1);
    }
    swift_endAccess();
  }
  swift_release();
  **(void **)(v1 + 184) = 0;
  id v20 = *(uint64_t (**)(void))(v1 + 8);
  return v20();
}

uint64_t sub_22698A69C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 224);
  uint64_t v2 = *(void *)(*(void *)v0 + 216);
  return MEMORY[0x270FA2498](sub_22698A7A4, v2, v1);
}

uint64_t sub_22698A7A4()
{
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v2 = *(void **)(v0 + 232);
  swift_release();
  int v3 = *(unsigned __int8 *)(v0 + 280);

  swift_unknownObjectRelease();
  if (v3 == 1)
  {
    **(void **)(v0 + 184) = *(void *)(v0 + 232);
  }
  else
  {
    sub_2269908C8();
    swift_allocError();
    *uint64_t v5 = 0xD000000000000029;
    v5[1] = 0x80000002269BDD50;
    swift_willThrow();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_22698A8A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 224);
  uint64_t v2 = *(void *)(*(void *)v0 + 216);
  return MEMORY[0x270FA2498](sub_22698A9A8, v2, v1);
}

uint64_t sub_22698A9A8()
{
  uint64_t v1 = *(void **)(v0 + 264);
  uint64_t v2 = *(void **)(v0 + 256);
  swift_release();
  int v3 = *(unsigned __int8 *)(v0 + 280);

  swift_unknownObjectRelease();
  if (v3 == 1)
  {
    **(void **)(v0 + 184) = *(void *)(v0 + 256);
  }
  else
  {
    sub_2269908C8();
    swift_allocError();
    *uint64_t v5 = 0xD000000000000029;
    v5[1] = 0x80000002269BDD50;
    swift_willThrow();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_22698AAA4()
{
  int64_t v1 = v0;
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void **)(v0 + 72);
  if (!v2) {
    goto LABEL_4;
  }
  id v3 = v2;
  MEMORY[0x22A65C9B0]();
  if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_3;
  }
  while (1)
  {
    sub_2269B9040();
LABEL_3:
    sub_2269B9050();
    sub_2269B9030();

LABEL_4:
    swift_beginAccess();
    unint64_t v4 = *(void *)(v1 + 56);
    if ((v4 & 0xC000000000000001) != 0)
    {
      id v3 = 0;
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      unint64_t v7 = sub_2269B93F0() | 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = -1 << *(unsigned char *)(v4 + 32);
      uint64_t v5 = ~v8;
      id v3 = (id)(v4 + 64);
      uint64_t v9 = -v8;
      uint64_t v10 = v9 < 64 ? ~(-1 << v9) : -1;
      unint64_t v6 = v10 & *(void *)(v4 + 64);
      unint64_t v7 = v4;
    }
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    int64_t v1 = (unint64_t)(v5 + 64) >> 6;
    if ((v7 & 0x8000000000000000) != 0) {
      break;
    }
LABEL_11:
    if (v6)
    {
      uint64_t v12 = (v6 - 1) & v6;
      unint64_t v13 = __clz(__rbit64(v6)) | (v11 << 6);
      uint64_t v14 = v11;
      goto LABEL_30;
    }
    int64_t v17 = v11 + 1;
    if (!__OFADD__(v11, 1))
    {
      if (v17 >= v1) {
        goto LABEL_35;
      }
      unint64_t v18 = *((void *)v3 + v17);
      uint64_t v14 = v11 + 1;
      if (!v18)
      {
        uint64_t v14 = v11 + 2;
        if (v11 + 2 >= v1) {
          goto LABEL_35;
        }
        unint64_t v18 = *((void *)v3 + v14);
        if (!v18)
        {
          uint64_t v14 = v11 + 3;
          if (v11 + 3 >= v1) {
            goto LABEL_35;
          }
          unint64_t v18 = *((void *)v3 + v14);
          if (!v18)
          {
            uint64_t v14 = v11 + 4;
            if (v11 + 4 >= v1) {
              goto LABEL_35;
            }
            unint64_t v18 = *((void *)v3 + v14);
            if (!v18)
            {
              uint64_t v19 = v11 + 5;
              while (v1 != v19)
              {
                unint64_t v18 = *((void *)v3 + v19++);
                if (v18)
                {
                  uint64_t v14 = v19 - 1;
                  goto LABEL_29;
                }
              }
              goto LABEL_35;
            }
          }
        }
      }
LABEL_29:
      uint64_t v12 = (v18 - 1) & v18;
      unint64_t v13 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_30:
      uint64_t v20 = 8 * v13;
      uint64_t v21 = *(void **)(*(void *)(v7 + 56) + v20);
      id v15 = *(id *)(*(void *)(v7 + 48) + v20);
      id v16 = v21;
      if (v15) {
        goto LABEL_31;
      }
      goto LABEL_35;
    }
    __break(1u);
  }
  while (sub_2269B9420())
  {
    sub_226990798();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v24;
    swift_unknownObjectRelease();
    type metadata accessor for HoverTextRootViewController();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v16 = v24;
    swift_unknownObjectRelease();
    uint64_t v14 = v11;
    uint64_t v12 = v6;
    if (!v24) {
      break;
    }
LABEL_31:

    id v22 = v16;
    MEMORY[0x22A65C9B0]();
    if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2269B9040();
    }
    sub_2269B9050();
    sub_2269B9030();

    uint64_t v11 = v14;
    unint64_t v6 = v12;
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_11;
    }
  }
LABEL_35:
  sub_226990B6C();
  return v25;
}

uint64_t sub_22698ADFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  MEMORY[0x270FA5388](updated - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226990C84(v1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1) {
    return 7105601;
  }
  sub_226990B08((uint64_t)v8, (uint64_t)v5);
  uint64_t v10 = *(void *)v5;
  unsigned int v11 = v5[48];
  unint64_t v9 = 0xD000000000000016;
  switch((v11 >> 5) & 3)
  {
    case 1u:
      break;
    case 2u:
      unint64_t v9 = 0x61684365756C6156;
      break;
    case 3u:
      uint64_t v12 = *((void *)v5 + 3);
      uint64_t v13 = *((void *)v5 + 4) | *((void *)v5 + 5);
      uint64_t v14 = *((void *)v5 + 2) | *((void *)v5 + 1);
      BOOL v15 = v11 == 96 && (v13 | v10 | v12 | v14) == 0;
      if (v15
        || ((uint64_t v16 = v13 | v12 | v14, v11 == 96) ? (v17 = v10 == 1) : (v17 = 0), v17 ? (v18 = v16 == 0) : (v18 = 0), v18))
      {
        unint64_t v9 = 0xD000000000000014;
      }
      else
      {
        BOOL v19 = v11 == 96;
        BOOL v21 = v10 == 2 && v16 == 0;
        if (v19 && v21) {
          unint64_t v9 = 0xD000000000000011;
        }
        else {
          unint64_t v9 = 0xD00000000000001DLL;
        }
      }
      break;
    default:
      unint64_t v9 = 0x6469447375636F46;
      break;
  }
  sub_226990A70((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  return v9;
}

uint64_t sub_22698B0C4(uint64_t a1)
{
  uint64_t v3 = sub_2269B8550();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  uint64_t v12 = MEMORY[0x270FA5388](updated - 8);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v61 - v15;
  sub_226990C84(a1, (uint64_t)&v61 - v15, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7);
  uint64_t v71 = v3;
  if (v17 == 1)
  {
    uint64_t v76 = sub_22698AAA4();
  }
  else
  {
    uint64_t v69 = a1;
    uint64_t v70 = v4;
    sub_226990B08((uint64_t)v16, (uint64_t)v10);
    unint64_t v19 = *(void *)v10;
    uint64_t v18 = *((void *)v10 + 1);
    uint64_t v21 = *((void *)v10 + 2);
    uint64_t v20 = *((void *)v10 + 3);
    uint64_t v22 = *((void *)v10 + 4);
    uint64_t v23 = *((void *)v10 + 5);
    unsigned int v24 = v10[48];
    switch((v24 >> 5) & 3)
    {
      case 1u:
      case 2u:
        goto LABEL_4;
      case 3u:
        if (!(v21 | v18 | v19 | v20 | v22 | v23) && v24 == 96
          || ((uint64_t v35 = v21 | v18 | v20 | v22 | v23, v24 == 96) ? (v36 = v19 == 1) : (v36 = 0),
              v36 ? (BOOL v37 = v35 == 0) : (BOOL v37 = 0),
              v37))
        {
          uint64_t v41 = sub_22698AAA4();
          sub_226990A70((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
          uint64_t v76 = v41;
LABEL_37:
          uint64_t v4 = v70;
          uint64_t v3 = v71;
          a1 = v69;
        }
        else
        {
          if (v24 != 96 || v19 != 2 || v35 != 0)
          {
            sub_226990A70((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
            return MEMORY[0x263F8EE78];
          }
LABEL_4:
          uint64_t v25 = *(void **)(v1 + 72);
          unint64_t v26 = MEMORY[0x263F8EE78];
          unint64_t v75 = MEMORY[0x263F8EE78];
          if (v25)
          {
            id v27 = v25;
            MEMORY[0x22A65C9B0]();
            uint64_t v4 = v70;
            uint64_t v3 = v71;
            if (*(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2269B9040();
            }
            sub_2269B9050();
            sub_2269B9030();
            unint64_t v26 = v75;
          }
          else
          {
            uint64_t v4 = v70;
            uint64_t v3 = v71;
          }
          a1 = v69;

          sub_226990A70((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
          uint64_t v76 = v26;
        }
        break;
      default:
        if ((v24 & 0x80000000) != 0)
        {
          unint64_t v42 = *(void **)(v1 + 72);
          unint64_t v75 = MEMORY[0x263F8EE78];
          if (v42)
          {
            uint64_t v43 = v18;
            id v67 = v42;
            uint64_t v68 = v43;
            uint64_t v65 = v22;
            uint64_t v63 = v23;
            sub_2269772A4((id)v19, v43, v21, (void *)v20, v22, v23, v24);
            id v44 = v67;
            MEMORY[0x22A65C9B0]();
            if (*(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2269B9040();
            }
            id v62 = v44;
            sub_2269B9050();
            sub_2269B9030();
            id v67 = (id)v75;
            uint64_t v22 = v65;
            uint64_t v23 = v63;
            uint64_t v45 = v68;
            uint64_t v46 = v62;
          }
          else
          {
            uint64_t v45 = v18;
            sub_226976170((void *)v19, v18, v21, v20, v22, v23, v24);
            uint64_t v46 = 0;
            id v67 = (id)MEMORY[0x263F8EE78];
          }

          sub_226976180((void *)v19, v45, v21, (void *)v20, v22, v23, v24);
          sub_226990A70((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
        }
        else
        {
          unint64_t v28 = *(void **)v10;
          uint64_t v68 = *((void *)v10 + 1);
          sub_226976170(v28, v68, v21, v20, v22, v23, v24);
          uint64_t v29 = sub_22698AAA4();
          uint64_t v30 = (void *)v20;
          uint64_t v64 = (void *)v20;
          uint64_t v65 = v29;
          unint64_t v31 = v29;
          uint64_t v32 = v68;
          sub_2269772A4((id)v19, v68, v21, v30, v22, v23, v24);
          uint64_t v66 = v21;
          id v67 = (id)sub_22698FDB0(v31, (void *)v19);
          uint64_t v33 = v32;
          os_log_type_t v34 = v64;
          sub_226976180((void *)v19, v33, v21, v64, v22, v23, v24);
          swift_bridgeObjectRelease();
          sub_226990A70((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
          sub_226976180((void *)v19, v68, v66, v34, v22, v23, v24);
        }
        uint64_t v76 = (uint64_t)v67;
        goto LABEL_37;
    }
  }
  uint64_t v47 = sub_2269B8520();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v47, v3);
  sub_226990C84(a1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  uint64_t v48 = sub_2269B8540();
  os_log_type_t v49 = sub_2269B9130();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v74[0] = v51;
    *(_DWORD *)uint64_t v50 = 136315394;
    uint64_t v52 = sub_22698ADFC();
    uint64_t v73 = sub_22697609C(v52, v53, v74);
    sub_2269B9290();
    swift_bridgeObjectRelease();
    sub_226990A70((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
    *(_WORD *)(v50 + 12) = 2080;
    swift_beginAccess();
    uint64_t v54 = type metadata accessor for HoverTextRootViewController();
    uint64_t v55 = swift_bridgeObjectRetain();
    uint64_t v56 = MEMORY[0x22A65C9E0](v55, v54);
    int v57 = v6;
    uint64_t v58 = v4;
    unint64_t v60 = v59;
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_22697609C(v56, v60, v74);
    sub_2269B9290();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v48, v49, "Will sent event=%s to view controllers: %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v51, -1, -1);
    MEMORY[0x22A65DA10](v50, -1, -1);

    (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v71);
  }
  else
  {
    sub_226990A70((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_beginAccess();
  return v76;
}

uint64_t sub_22698B8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 80) = a4;
  *(void *)(v5 + 88) = a5;
  sub_226977020(a4, v5 + 16);
  long long v6 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)(v5 + 96) = *(_OWORD *)(v5 + 16);
  *(_OWORD *)(v5 + 112) = v6;
  *(_OWORD *)(v5 + 128) = *(_OWORD *)(v5 + 48);
  *(unsigned char *)(v5 + 65) = *(unsigned char *)(v5 + 64);
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(void *)(v5 + 144) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for HoverTextPresentationEvent();
  *(void *)(v5 + 152) = v7;
  *(void *)(v5 + 160) = *(void *)(v7 - 8);
  *(void *)(v5 + 168) = swift_task_alloc();
  sub_2269B9080();
  *(void *)(v5 + 176) = sub_2269B9070();
  uint64_t v9 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698BA08, v9, v8);
}

uint64_t sub_22698BA08()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(int **)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 144);
  char v6 = *(unsigned char *)(v0 + 65);
  uint64_t v7 = *(void *)(v0 + 128);
  long long v24 = *(_OWORD *)(v0 + 96);
  long long v25 = *(_OWORD *)(v0 + 112);
  uint64_t v8 = *(void *)(v0 + 80);
  swift_release();
  *(unsigned char *)(v1 + 50) = 12;
  sub_22697707C(v8);
  sub_2269B8250();
  uint64_t v9 = (void *)(v1 + v2[8]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (_OWORD *)(v1 + v2[9]);
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  uint64_t v11 = v1 + v2[10];
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  uint64_t v12 = (void *)(v1 + v2[11]);
  void *v12 = 0;
  v12[1] = 0;
  *(void *)(v1 + v2[12]) = 0;
  *(void *)(v1 + v2[13]) = 0;
  *(_OWORD *)uint64_t v1 = v24;
  *(_OWORD *)(v1 + 16) = v25;
  *(void *)(v1 + 32) = v7;
  *(void *)(v1 + 40) = v5;
  *(unsigned char *)(v1 + 48) = v6;
  *(unsigned char *)(v1 + 49) = 1;
  sub_226990C84(v1, v4, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  unint64_t v13 = sub_22698B0C4(v4);
  sub_226990A70(v4, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v14 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v14) {
      goto LABEL_10;
    }
  }
  if (v14 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v16 = 0;
  do
  {
    if ((v13 & 0xC000000000000001) != 0) {
      int v17 = (char *)MEMORY[0x22A65CD20](v16, v13);
    }
    else {
      int v17 = (char *)*(id *)(v13 + 8 * v16 + 32);
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v0 + 168);
    ++v16;
    uint64_t v20 = *(void *)&v18[qword_268148D80 + 8];
    uint64_t v21 = **(void **)&v18[qword_268148D80];
    *(void *)(v0 + 72) = *(void *)&v18[qword_268148D80];
    (*(void (**)(uint64_t, uint64_t))(v20 + 280))(v19, v21);
  }
  while (v14 != v16);
LABEL_10:
  uint64_t v22 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease_n();
  sub_226990A70(v22, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_22698BCCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for HoverTextPresentationEvent();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  sub_2269B9080();
  v4[8] = sub_2269B9070();
  uint64_t v7 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698BDEC, v7, v6);
}

uint64_t sub_22698BDEC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (int *)v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[4];
  swift_release();
  *(unsigned char *)(v1 + 50) = 12;
  sub_2269B8250();
  uint64_t v5 = (void *)(v1 + v2[8]);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (_OWORD *)(v1 + v2[9]);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  uint64_t v7 = v1 + v2[10];
  *(void *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 8) = 1;
  uint64_t v8 = (void *)(v1 + v2[11]);
  void *v8 = 0;
  v8[1] = 0;
  *(void *)(v1 + v2[12]) = 0;
  *(void *)(v1 + v2[13]) = 0;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_WORD *)(v1 + 48) = 352;
  sub_226990C84(v1, v4, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  unint64_t v9 = sub_22698B0C4(v4);
  sub_226990A70(v4, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v10 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v10) {
      goto LABEL_10;
    }
  }
  if (v10 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      unint64_t v13 = (char *)MEMORY[0x22A65CD20](v12, v9);
    }
    else {
      unint64_t v13 = (char *)*(id *)(v9 + 8 * v12 + 32);
    }
    uint64_t v14 = v13;
    uint64_t v15 = v0[7];
    ++v12;
    uint64_t v16 = *(void *)&v14[qword_268148D80 + 8];
    uint64_t v17 = **(void **)&v14[qword_268148D80];
    v0[2] = *(void *)&v14[qword_268148D80];
    (*(void (**)(uint64_t, uint64_t))(v16 + 280))(v15, v17);
  }
  while (v10 != v12);
LABEL_10:
  swift_bridgeObjectRelease_n();
  sub_226990A70(v0[7], (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_22698C074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(unsigned char *)(v8 + 96) = a6;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(void *)(v8 + 56) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for HoverTextPresentationEvent();
  *(void *)(v8 + 64) = v9;
  *(void *)(v8 + 72) = *(void *)(v9 - 8);
  *(void *)(v8 + 80) = swift_task_alloc();
  sub_2269B9080();
  *(void *)(v8 + 88) = sub_2269B9070();
  uint64_t v11 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698C19C, v11, v10);
}

uint64_t sub_22698C19C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(int **)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void **)(v0 + 40);
  uint64_t v7 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 24);
  swift_release();
  *(unsigned char *)(v1 + 50) = 12;
  id v9 = v6;
  swift_bridgeObjectRetain();
  sub_2269B8250();
  uint64_t v10 = (void *)(v1 + v2[8]);
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (_OWORD *)(v1 + v2[9]);
  _OWORD *v11 = 0u;
  v11[1] = 0u;
  uint64_t v12 = v1 + v2[10];
  *(void *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 8) = 1;
  uint64_t v13 = (void *)(v1 + v2[11]);
  *uint64_t v13 = 0;
  v13[1] = 0;
  *(void *)(v1 + v2[12]) = 0;
  *(void *)(v1 + v2[13]) = 0;
  *(void *)uint64_t v1 = v8;
  *(void *)(v1 + 8) = v5;
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v6;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 48) = 320;
  sub_226990C84(v1, v4, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  unint64_t v14 = sub_22698B0C4(v4);
  sub_226990A70(v4, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_10;
    }
  }
  if (v15 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v17 = 0;
  do
  {
    if ((v14 & 0xC000000000000001) != 0) {
      uint64_t v18 = (char *)MEMORY[0x22A65CD20](v17, v14);
    }
    else {
      uint64_t v18 = (char *)*(id *)(v14 + 8 * v17 + 32);
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)(v0 + 80);
    ++v17;
    uint64_t v21 = *(void *)&v19[qword_268148D80 + 8];
    uint64_t v22 = **(void **)&v19[qword_268148D80];
    *(void *)(v0 + 16) = *(void *)&v19[qword_268148D80];
    (*(void (**)(uint64_t, uint64_t))(v21 + 280))(v20, v22);
  }
  while (v15 != v17);
LABEL_10:
  swift_bridgeObjectRelease_n();
  sub_226990A70(*(void *)(v0 + 80), (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_22698C454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v6[6] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for HoverTextPresentationEvent();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  sub_2269B9080();
  v6[10] = sub_2269B9070();
  uint64_t v9 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698C578, v9, v8);
}

uint64_t sub_22698C578()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = (int *)v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  swift_release();
  *(unsigned char *)(v1 + 50) = 12;
  swift_bridgeObjectRetain();
  sub_2269B8250();
  uint64_t v7 = (void *)(v1 + v2[8]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (_OWORD *)(v1 + v2[9]);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  uint64_t v9 = v1 + v2[10];
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v10 = (void *)(v1 + v2[11]);
  void *v10 = 0;
  v10[1] = 0;
  *(void *)(v1 + v2[12]) = 0;
  *(void *)(v1 + v2[13]) = 0;
  *(void *)uint64_t v1 = v6;
  *(void *)(v1 + 8) = v5;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_WORD *)(v1 + 48) = 288;
  sub_226990C84(v1, v4, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  unint64_t v11 = sub_22698B0C4(v4);
  sub_226990A70(v4, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v12 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v12) {
      goto LABEL_10;
    }
  }
  if (v12 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v14 = 0;
  do
  {
    if ((v11 & 0xC000000000000001) != 0) {
      uint64_t v15 = (char *)MEMORY[0x22A65CD20](v14, v11);
    }
    else {
      uint64_t v15 = (char *)*(id *)(v11 + 8 * v14 + 32);
    }
    uint64_t v16 = v15;
    uint64_t v17 = v0[9];
    ++v14;
    uint64_t v18 = *(void *)&v16[qword_268148D80 + 8];
    uint64_t v19 = **(void **)&v16[qword_268148D80];
    v0[2] = *(void *)&v16[qword_268148D80];
    (*(void (**)(uint64_t, uint64_t))(v18 + 280))(v17, v19);
  }
  while (v12 != v14);
LABEL_10:
  swift_bridgeObjectRelease_n();
  sub_226990A70(v0[9], (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_22698C810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[9] = swift_task_alloc();
  sub_2269B9080();
  v4[10] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698C8D4, v6, v5);
}

uint64_t sub_22698C8D4()
{
  uint64_t v1 = v0[9];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2269B9450();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  uint64_t result = self;
  id v17 = (id)result;
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  unint64_t v16 = v3 & 0xC000000000000001;
  unint64_t v7 = v3;
  do
  {
    if (v16) {
      uint64_t v8 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v8 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v9 = v8;
    ++v6;
    uint64_t v10 = qword_268148D90;
    objc_msgSend(*(id *)&v8[qword_268148D90], sel_invalidate);
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v0[6] = sub_22696C580;
    v0[7] = v11;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_22696BC4C;
    v0[5] = &block_descriptor_49;
    uint64_t v12 = _Block_copy(v0 + 2);
    swift_release();
    id v13 = objc_msgSend(v17, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v12, 0.2);
    _Block_release(v12);
    uint64_t v14 = *(void **)&v9[v10];
    *(void *)&v9[v10] = v13;

    unint64_t v3 = v7;
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_22698CB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698CC3C, v6, v5);
}

uint64_t sub_22698CC3C()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      unint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      unint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t))(v9 + 248))(v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698CE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698CEDC, v6, v5);
}

uint64_t sub_22698CEDC()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      unint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      unint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t))(v9 + 232))(v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698D0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698D17C, v6, v5);
}

uint64_t sub_22698D17C()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      unint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      unint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t))(v9 + 240))(v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698D358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 48) = a5;
  *(void *)(v5 + 24) = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(void *)(v5 + 32) = swift_task_alloc();
  sub_2269B9080();
  *(void *)(v5 + 40) = sub_2269B9070();
  uint64_t v7 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698D420, v7, v6);
}

uint64_t sub_22698D420()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(unsigned __int8 *)(v0 + 48);
    ++v6;
    uint64_t v10 = *(void *)&v8[qword_268148D80 + 8];
    uint64_t v11 = **(void **)&v8[qword_268148D80];
    *(void *)(v0 + 16) = *(void *)&v8[qword_268148D80];
    (*(void (**)(uint64_t, uint64_t))(v10 + 256))(v9, v11);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_22698D600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698D6C4, v6, v5);
}

uint64_t sub_22698D6C4()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t))(v9 + 224))(v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698D8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 96) = a6;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(void *)(v6 + 48) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for HoverTextPresentationEvent();
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  *(void *)(v6 + 80) = swift_task_alloc();
  sub_2269B9080();
  *(void *)(v6 + 88) = sub_2269B9070();
  uint64_t v9 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698D9D4, v9, v8);
}

uint64_t sub_22698D9D4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (int *)v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)v0[4];
  swift_release();
  *(unsigned char *)(v1 + 50) = 12;
  id v6 = v5;
  sub_2269B8250();
  uint64_t v7 = (void *)(v1 + v2[8]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (_OWORD *)(v1 + v2[9]);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  uint64_t v9 = v1 + v2[10];
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v10 = (void *)(v1 + v2[11]);
  void *v10 = 0;
  v10[1] = 0;
  *(void *)(v1 + v2[12]) = 0;
  *(void *)(v1 + v2[13]) = 0;
  *(void *)uint64_t v1 = v5;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 33) = 0u;
  *(unsigned char *)(v1 + 49) = 1;
  sub_226990C84(v1, v4, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  uint64_t v51 = v2;
  (*(void (**)(uint64_t, void, uint64_t, int *))(v3 + 56))(v4, 0, 1, v2);
  unint64_t v11 = sub_22698B0C4(v4);
  sub_226990A70(v4, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  unint64_t v52 = sub_22698AAA4();
  if (v52 >> 62) {
    goto LABEL_45;
  }
  for (uint64_t i = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_2269B9450())
  {
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_2269B9450();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v13 = 0;
    unint64_t v14 = v52 & 0xC000000000000001;
    unint64_t v53 = v11 & 0xC000000000000001;
    uint64_t v54 = v12;
    uint64_t v50 = *(void *)(v57 + 72);
    unint64_t v55 = v11;
    while (1)
    {
      if (v14)
      {
        long long v25 = (char *)MEMORY[0x22A65CD20](v13, v52);
      }
      else
      {
        if (v13 >= *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_43;
        }
        long long v25 = (char *)*(id *)(v52 + 32 + 8 * v13);
      }
      uint64_t v26 = v25;
      if (__OFADD__(v13++, 1))
      {
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
      uint64_t v58 = v25;
      if (!v12) {
        goto LABEL_20;
      }
      if (v53)
      {
        swift_bridgeObjectRetain();
        id v29 = (id)MEMORY[0x22A65CD20](0, v11);
      }
      else
      {
        unint64_t v28 = *(void **)(v11 + 32);
        swift_bridgeObjectRetain();
        id v29 = v28;
      }
      uint64_t v30 = v29;
      type metadata accessor for HoverTextRootViewController();
      char v31 = sub_2269B9220();

      if (v31) {
        goto LABEL_17;
      }
      if (v12 == 1) {
        goto LABEL_19;
      }
      if (!v53) {
        break;
      }
      MEMORY[0x22A65CD20](1, v11);
      char v37 = sub_2269B9220();
      swift_unknownObjectRelease();
      if ((v37 & 1) == 0)
      {
        if (v12 != 2)
        {
          uint64_t v38 = 2;
          do
          {
            MEMORY[0x22A65CD20](v38, v11);
            uint64_t v39 = v38 + 1;
            if (__OFADD__(v38, 1)) {
              goto LABEL_42;
            }
            uint64_t v40 = v26;
            char v41 = sub_2269B9220();
            swift_unknownObjectRelease();
            if (v41)
            {
              swift_bridgeObjectRelease();
              char v32 = 1;
              uint64_t v26 = v40;
              goto LABEL_21;
            }
            ++v38;
            uint64_t v26 = v40;
          }
          while (v39 != v12);
        }
LABEL_19:
        swift_bridgeObjectRelease();
LABEL_20:
        char v32 = 0;
        goto LABEL_21;
      }
LABEL_17:
      swift_bridgeObjectRelease();
      char v32 = 1;
LABEL_21:
      uint64_t v33 = &v26[qword_268148D80];
      os_log_type_t v34 = *(uint64_t **)&v26[qword_268148D80];
      uint64_t v35 = *(void *)&v26[qword_268148D80 + 8];
      uint64_t v36 = *v34;
      *(void *)(v57 + 16) = v34;
      if (v32)
      {
        sub_226990C84(*(void *)(v57 + 80), *(void *)(v57 + 72), (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
        swift_retain();
      }
      else
      {
        uint64_t v15 = *(void **)(v57 + 72);
        *(unsigned char *)(v50 + 50) = 12;
        swift_retain();
        sub_2269B8250();
        unint64_t v16 = (void *)((char *)v15 + v51[8]);
        *unint64_t v16 = 0;
        v16[1] = 0;
        id v17 = (_OWORD *)((char *)v15 + v51[9]);
        *id v17 = 0u;
        v17[1] = 0u;
        uint64_t v18 = (char *)v15 + v51[10];
        *(void *)uint64_t v18 = 0;
        v18[8] = 1;
        uint64_t v19 = (void *)((char *)v15 + v51[11]);
        void *v19 = 0;
        v19[1] = 0;
        *(void *)((char *)v15 + v51[12]) = 0;
        *(void *)((char *)v15 + v51[13]) = 0;
        void *v15 = 3;
        *(void *)(v50 + 40) = 0;
        *(_OWORD *)(v50 + 8) = 0u;
        *(_OWORD *)(v50 + 24) = 0u;
        *(_WORD *)(v50 + 48) = 352;
        unint64_t v14 = v52 & 0xC000000000000001;
      }
      uint64_t v20 = *(void *)(v57 + 72);
      uint64_t v21 = *(unsigned __int8 *)(v57 + 96);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 280))(v20, v36, v35);
      sub_226990A70(v20, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
      swift_release();
      uint64_t v22 = *((void *)v33 + 1);
      uint64_t v23 = **(void **)v33;
      *(void *)(v57 + 24) = *(void *)v33;
      uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 336);
      swift_retain();
      v24(v21, v23, v22);

      swift_release();
      unint64_t v11 = v55;
      uint64_t v12 = v54;
      if (v13 == i) {
        goto LABEL_46;
      }
    }
    id v42 = *(id *)(v11 + 40);
    char v43 = sub_2269B9220();

    if (v43) {
      goto LABEL_17;
    }
    if (v12 == 2) {
      goto LABEL_19;
    }
    uint64_t v44 = 6;
    while (1)
    {
      uint64_t v45 = v44 - 3;
      if (__OFADD__(v44 - 4, 1)) {
        break;
      }
      id v46 = *(id *)(v11 + 8 * v44);
      char v47 = sub_2269B9220();

      if (v47)
      {
        swift_bridgeObjectRelease();
        char v32 = 1;
        uint64_t v26 = v58;
        goto LABEL_21;
      }
      ++v44;
      if (v45 == v12)
      {
        swift_bridgeObjectRelease();
        char v32 = 0;
        uint64_t v26 = v58;
        goto LABEL_21;
      }
    }
LABEL_44:
    __break(1u);
LABEL_45:
    ;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_226990A70(*(void *)(v57 + 80), (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v48 = *(uint64_t (**)(void))(v57 + 8);
  return v48();
}

uint64_t sub_22698E04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[3] = a1;
  sub_2269B9080();
  v5[6] = sub_2269B9070();
  uint64_t v7 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698E0E8, v7, v6);
}

uint64_t sub_22698E0E8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  if (v2)
  {
    uint64_t v4 = *(uint64_t **)(v2 + qword_268148D80);
    uint64_t v3 = *(void *)(v2 + qword_268148D80 + 8);
    uint64_t v5 = *v4;
    *(void *)(v0 + 16) = v4;
    (*(void (**)(uint64_t, uint64_t))(v3 + 344))(*(void *)(v0 + 40) | ((HIDWORD(*(void *)(v0 + 40)) & 1) << 32), v5);
  }
  **(unsigned char **)(v0 + 24) = v2 == 0;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_22698E1D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698E298, v6, v5);
}

uint64_t sub_22698E298()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t))(v9 + 312))(v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  unint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698E474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698E538, v6, v5);
}

uint64_t sub_22698E538()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t, uint64_t))(v9 + 320))(1, v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  unint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698E718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698E7DC, v6, v5);
}

uint64_t sub_22698E7DC()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v10 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(void, uint64_t))(v9 + 320))(0, v10);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  unint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22698E9BC(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 32) = a1;
  *(double *)(v6 + 40) = a2;
  *(void *)(v6 + 24) = a6;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  *(void *)(v6 + 48) = swift_task_alloc();
  sub_2269B9080();
  *(void *)(v6 + 56) = sub_2269B9070();
  uint64_t v8 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698EA84, v8, v7);
}

uint64_t sub_22698EA84()
{
  uint64_t v1 = v0[6];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    uint64_t v10 = v7;
    v8.n128_u64[0] = v0[4];
    v9.n128_u64[0] = v0[5];
    ++v6;
    uint64_t v11 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v12 = **(void **)&v7[qword_268148D80];
    v0[2] = *(void *)&v7[qword_268148D80];
    (*(void (**)(uint64_t, __n128, __n128))(v11 + 328))(v12, v8, v9);
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_22698EC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent();
  v5[5] = swift_task_alloc();
  sub_2269B9080();
  v5[6] = sub_2269B9070();
  uint64_t v7 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_22698ED28, v7, v6);
}

uint64_t sub_22698ED28()
{
  uint64_t v1 = v0[5];
  swift_release();
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = sub_22698B0C4(v1);
  sub_226990A70(v1, (uint64_t (*)(void))type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2269B9450();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  unint64_t v15 = v3 & 0xC000000000000001;
  unint64_t v16 = v3;
  do
  {
    if (v15) {
      uint64_t v7 = (char *)MEMORY[0x22A65CD20](v6, v3);
    }
    else {
      uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
    }
    __n128 v8 = v7;
    uint64_t v9 = v0[4];
    ++v6;
    uint64_t v10 = *(uint64_t **)&v7[qword_268148D80];
    uint64_t v11 = *(void *)&v7[qword_268148D80 + 8];
    uint64_t v12 = *v10;
    v0[2] = v10;
    unint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 264);
    swift_retain();
    v13(v9, v12, v11);
    swift_release();

    unint64_t v3 = v16;
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

id *HoverTextCoordinator.deinit()
{
  sub_22699074C((uint64_t)(v0 + 5));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HoverTextCoordinator.__deallocating_deinit()
{
  HoverTextCoordinator.deinit();

  return MEMORY[0x270FA0228](v0, 97, 7);
}

uint64_t sub_22698EFC8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22698F000()
{
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22698F020(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22698F0FC;
  return v6(a1);
}

uint64_t sub_22698F0FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22698F1F4(char a1)
{
  return sub_226985864(a1);
}

uint64_t sub_22698F200(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_226992D54;
  return sub_226989A18(a1, v4, v5, v6, v8, v7);
}

uint64_t sub_22698F2C8(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  return sub_226985F68(a1, a2, a3, a4, v4);
}

uint64_t sub_22698F2D0()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA814F0, (uint64_t)&unk_2681493F0);
}

uint64_t sub_22698F308()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA814C8, (uint64_t)&unk_2681493E0);
}

uint64_t sub_22698F340()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA814A0, (uint64_t)&unk_2681493D0);
}

uint64_t sub_22698F378(char a1)
{
  return sub_2269860B4(a1, v1);
}

uint64_t sub_22698F380()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA81450, (uint64_t)&unk_2681493B0);
}

uint64_t sub_22698F3B8(void *a1)
{
  return sub_2269868E4(a1, v1);
}

uint64_t sub_22698F3C0(void *a1, char a2)
{
  return sub_226986444(a1, a2, v2);
}

uint64_t sub_22698F3C8(unint64_t a1)
{
  return sub_22698657C(a1 | ((HIDWORD(a1) & 1) << 32), v1);
}

uint64_t sub_22698F3E4()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA81388, (uint64_t)&unk_268149350);
}

uint64_t sub_22698F41C()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA81360, (uint64_t)&unk_268149340);
}

uint64_t sub_22698F454()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA81338, (uint64_t)&unk_268149330);
}

uint64_t sub_22698F48C(double a1, double a2)
{
  return sub_2269867B8(v2, a1, a2);
}

uint64_t sub_22698F494(uint64_t a1)
{
  return sub_226985CF8(a1, v1);
}

uint64_t sub_22698F49C()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA812C0, (uint64_t)&unk_268149300);
}

uint64_t sub_22698F4D4(uint64_t a1, uint64_t a2)
{
  return sub_226985E34(a1, a2, v2);
}

uint64_t sub_22698F4DC()
{
  return sub_2269866A4(v0, (uint64_t)&unk_26DA81220, (uint64_t)&unk_2681492E0);
}

uint64_t sub_22698F518(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_226992D54;
  return sub_22698A2CC(a1, v4, v5, v6, v8, v7);
}

void sub_22698F5E0(id a1)
{
}

uint64_t sub_22698F5F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_226992D54;
  return sub_226988990(a1, v4, v5, v7, v6);
}

uint64_t sub_22698F6B0(uint64_t a1, void *a2)
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
    uint64_t result = sub_2269B9400();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = sub_22698F764(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_2269B6DBC(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_22698F764(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268149970);
    uint64_t v2 = sub_2269B9480();
    uint64_t v18 = v2;
    sub_2269B93F0();
    uint64_t v3 = sub_2269B9420();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_226990798();
      do
      {
        swift_dynamicCast();
        type metadata accessor for HoverTextRootViewController();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_2269B65CC(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_2269B9210();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_2269B9420();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

void sub_22698F990(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2269B9450();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x22A65CD30);
}

uint64_t sub_22698FA0C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_22698FAEC;
  return v5(v2 + 32);
}

uint64_t sub_22698FAEC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_22698FC00(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v2 = v4;
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      v5 += v8;
    }
    swift_bridgeObjectRetain();
    uint64_t *v2 = MEMORY[0x22A65CD30](isUniquelyReferenced_nonNull_native, v5, 1, v4);
    swift_bridgeObjectRelease();
    uint64_t v4 = *v2;
  }
  uint64_t v11 = v4 + 32;
  unint64_t v12 = (char *)(v4 + 32 + 8 * a1);
  swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)(*v2 + 16);
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_27;
  }
  if (v15 < 0)
  {
LABEL_29:
    uint64_t result = sub_2269B94A0();
    __break(1u);
    return result;
  }
  uint64_t v16 = (char *)(v11 + 8 * a2);
  if (a1 != a2 || v12 >= &v16[8 * v15]) {
    memmove(v12, v16, 8 * v15);
  }
  uint64_t v17 = *(void *)(*v2 + 16);
  BOOL v14 = __OFADD__(v17, v8);
  uint64_t v18 = v17 - v7;
  if (v14)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  *(void *)(*v2 + 16) = v18;
LABEL_19:

  return sub_2269B9030();
}

uint64_t sub_22698FDB0(unint64_t a1, void *a2)
{
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x22A65CD20](v5, a1);
LABEL_9:
        uint64_t v7 = v6;
        unint64_t v8 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_20;
        }
        if (a2) {
          unsigned int v9 = objc_msgSend(a2, sel_windowDisplayId);
        }
        else {
          unsigned int v9 = 0;
        }
        id v10 = objc_msgSend(v7, sel_viewIfLoaded);
        if (v10
          && (uint64_t v11 = v10, v12 = objc_msgSend(v10, sel_window), v11, v12)
          && (int v13 = HTDisplayIDForWindow(v12), v12, v9 == v13))
        {
          sub_2269B9390();
          sub_2269B93C0();
          sub_2269B93D0();
          sub_2269B93A0();
        }
        else
        {
        }
        ++v5;
        if (v8 == v4) {
          return v15;
        }
      }
      if (v5 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v4 = sub_2269B9450();
      if (!v4) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v6 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_22698FF70(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x22A65CD20](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }
      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1)) {
        break;
      }
      if (++v5 == v4) {
        return 0;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2269B9450();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_226990060(unint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_22698FF70(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_2269B9450();
      swift_bridgeObjectRelease();
      if (v9 != v27) {
        goto LABEL_6;
      }
    }
    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        unint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0) {
          break;
        }
        if ((v11 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_45;
        }
        if (*(void *)(v12 + 8 * i) != a2) {
          goto LABEL_11;
        }
LABEL_31:
        unint64_t v9 = i - 3;
        if (__OFADD__(v11, 1)) {
          goto LABEL_46;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v23 = sub_2269B9450();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v23 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v23) {
          return v6;
        }
      }
      uint64_t v24 = MEMORY[0x22A65CD20](i - 4);
      swift_unknownObjectRelease();
      if (v24 == a2) {
        goto LABEL_31;
      }
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_31;
      }
      unint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        id v13 = (id)MEMORY[0x22A65CD20](v6, *a1);
        unint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          id v14 = *(id *)(v9 + 8 * i);
          goto LABEL_19;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        id v13 = *(id *)(v9 + 8 * v6 + 32);
        if ((v9 & 0xC000000000000001) == 0) {
          goto LABEL_16;
        }
      }
      id v14 = (id)MEMORY[0x22A65CD20](i - 4, v9);
      unint64_t v9 = *a1;
LABEL_19:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        sub_22698F990(v9);
        unint64_t v9 = v16;
        *a1 = v16;
      }
      uint64_t v17 = *(void **)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20);
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;

      sub_2269B9030();
      unint64_t v9 = *a1;
      int v18 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v18 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
      {
        sub_22698F990(v9);
        unint64_t v9 = v19;
        *a1 = v19;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      uint64_t v20 = v9 & 0xFFFFFFFFFFFFFF8;
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      uint64_t v21 = *(void **)(v20 + 8 * i);
      *(void *)(v20 + 8 * i) = v13;

      sub_2269B9030();
      goto LABEL_30;
    }
    return v6;
  }
  unint64_t v25 = *a1;
  if (!(v25 >> 62)) {
    return *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_2269B9450();
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_22699037C(uint64_t a1, uint64_t a2)
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
  uint64_t v21 = sub_2269B9450();
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
    uint64_t v7 = sub_2269B9450();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2269B9450();
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
  *uint64_t v3 = MEMORY[0x22A65CD30](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  id v14 = (char *)(v11 + 32 + 8 * v4);
  sub_226990798();
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_2269B9450();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_2269B94A0();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
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
        uint64_t v23 = sub_2269B9450();
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

  return sub_2269B9030();
}

uint64_t sub_22699068C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_226992D54;
  return sub_226989474(a1, v4, v5, v7, v6);
}

uint64_t sub_22699074C(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for HoverTextCoordinator()
{
  return self;
}

unint64_t sub_226990798()
{
  unint64_t result = qword_2681492B0;
  if (!qword_2681492B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2681492B0);
  }
  return result;
}

uint64_t sub_2269907D8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226990810(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226992D54;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2681492B8 + dword_2681492B8);
  return v6(a1, v4);
}

unint64_t sub_2269908C8()
{
  unint64_t result = qword_2681492C8;
  if (!qword_2681492C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681492C8);
  }
  return result;
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_226990968()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_226990970(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698C810(a1, v4, v5, v6);
}

uint64_t type metadata accessor for HoverTextCoordinator.ViewControllerUpdateEvent()
{
  uint64_t result = qword_268149418;
  if (!qword_268149418) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226990A70(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226990AD0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226990B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HoverTextPresentationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226990B6C()
{
  return swift_release();
}

uint64_t sub_226990B74()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_226990BBC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_226992D54;
  return sub_22698C454(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_226990C84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226990CEC()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_226990CF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698BCCC(a1, v4, v5, v6);
}

uint64_t sub_226990DA8()
{
  swift_unknownObjectRelease();
  sub_2269761FC(*(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_226990DFC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t)(v1 + 4);
  uint64_t v7 = v1[11];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_226992D54;
  return sub_22698B8C4(a1, v4, v5, v6, v7);
}

uint64_t sub_226990EC0()
{
  return objectdestroy_41Tm(56);
}

uint64_t sub_226990EC8(uint64_t a1)
{
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v5 = *((void *)v1 + 3);
  uint64_t v6 = *((void *)v1 + 4);
  double v7 = v1[5];
  double v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_226990F98;
  return sub_22698E9BC(v7, v8, a1, v4, v5, v6);
}

uint64_t sub_226990F98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22699108C()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_226991094(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  double v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *double v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698E718(a1, v4, v5, v6);
}

uint64_t sub_226991148()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_226991150(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  double v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *double v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698E474(a1, v4, v5, v6);
}

uint64_t sub_226991204()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_22699120C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  double v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *double v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698E1D4(a1, v4, v5, v6);
}

uint64_t sub_2269912C0()
{
  return objectdestroy_41Tm(45);
}

uint64_t sub_2269912C8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  unint64_t v7 = *(unsigned int *)(v1 + 40) | ((unint64_t)*(unsigned __int8 *)(v1 + 44) << 32);
  double v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_226992D54;
  return sub_22698E04C(a1, v4, v5, v6, v7);
}

uint64_t sub_22699139C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226992D54;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268149368 + dword_268149368);
  return v6(a1, v4);
}

uint64_t sub_226991454()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_22699149C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_226992D54;
  return sub_22698D8A0(a1, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2269915B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_226992D54;
  return sub_22698EC64(a1, v4, v5, v7, v6);
}

uint64_t sub_226991670(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681493A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2269916D8()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_2269916E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698D600(a1, v4, v5, v6);
}

uint64_t sub_226991794()
{
  return objectdestroy_41Tm(41);
}

uint64_t sub_22699179C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_226992D54;
  return sub_22698D358(a1, v4, v5, v6, v7);
}

uint64_t sub_226991860()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_226991868(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698D0B8(a1, v4, v5, v6);
}

uint64_t sub_22699191C()
{
  return objectdestroy_41Tm(40);
}

uint64_t sub_226991924(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698CE18(a1, v4, v5, v6);
}

uint64_t sub_2269919D8()
{
  return objectdestroy_41Tm(40);
}

uint64_t objectdestroy_41Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_226991A2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_226992D54;
  return sub_22698CB78(a1, v4, v5, v6);
}

uint64_t sub_226991AE0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_226991B30(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = *(void *)(v1 + 64);
  char v10 = *(unsigned char *)(v1 + 48);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_226992D54;
  return sub_22698C074(a1, v4, v5, v6, v7, v10, v8, v9);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_226991C58(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_226990F98;
  return sub_226989A18(a1, v4, v5, v6, v8, v7);
}

id *sub_226991D20(id *a1, id *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = (char *)*a2;
    *a1 = *a2;
    a1 = (id *)&v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = (int *)type metadata accessor for HoverTextPresentationEvent();
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(id *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v37 = v8;
      char v10 = (char *)*a2;
      uint64_t v11 = (uint64_t)a2[1];
      uint64_t v12 = (uint64_t)a2[2];
      id v13 = a2[3];
      uint64_t v14 = (uint64_t)a2[4];
      uint64_t v15 = (uint64_t)a2[5];
      unsigned __int8 v16 = *((unsigned char *)a2 + 48);
      sub_2269772A4(*a2, v11, v12, v13, v14, v15, v16);
      *a1 = v10;
      a1[1] = (id)v11;
      a1[2] = (id)v12;
      a1[3] = v13;
      a1[4] = (id)v14;
      a1[5] = (id)v15;
      *((unsigned char *)a1 + 48) = v16;
      *(_WORD *)((char *)a1 + 49) = *(_WORD *)((char *)a2 + 49);
      uint64_t v17 = v7[7];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_2269B82E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      uint64_t v21 = v7[8];
      uint64_t v22 = (id *)((char *)a1 + v21);
      uint64_t v23 = (id *)((char *)a2 + v21);
      uint64_t v24 = v23[1];
      *uint64_t v22 = *v23;
      v22[1] = v24;
      uint64_t v25 = v7[9];
      uint64_t v26 = (_OWORD *)((char *)a1 + v25);
      uint64_t v27 = (_OWORD *)((char *)a2 + v25);
      long long v28 = v27[1];
      *uint64_t v26 = *v27;
      v26[1] = v28;
      uint64_t v29 = v7[10];
      uint64_t v30 = (char *)a1 + v29;
      char v31 = (char *)a2 + v29;
      *(void *)uint64_t v30 = *(void *)v31;
      v30[8] = v31[8];
      *(_OWORD *)((char *)a1 + v7[11]) = *(_OWORD *)((char *)a2 + v7[11]);
      *(id *)((char *)a1 + v7[12]) = *(id *)((char *)a2 + v7[12]);
      uint64_t v32 = v7[13];
      uint64_t v33 = *(id *)((char *)a2 + v32);
      *(id *)((char *)a1 + v32) = v33;
      os_log_type_t v34 = *(void (**)(id *, void, uint64_t, int *))(v37 + 56);
      swift_bridgeObjectRetain();
      id v35 = v33;
      v34(a1, 0, 1, v7);
    }
  }
  return a1;
}

void sub_226991F6C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
  {
    sub_226976180(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    uint64_t v3 = a1 + *(int *)(v2 + 28);
    uint64_t v4 = sub_2269B82E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    swift_bridgeObjectRelease();
    int v5 = *(void **)(a1 + *(int *)(v2 + 52));
  }
}

void *sub_226992064(void *a1, id *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(id *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v35 = v7;
    id v8 = *a2;
    uint64_t v9 = (uint64_t)a2[1];
    uint64_t v10 = (uint64_t)a2[2];
    id v11 = a2[3];
    uint64_t v12 = (uint64_t)a2[4];
    uint64_t v13 = (uint64_t)a2[5];
    unsigned __int8 v14 = *((unsigned char *)a2 + 48);
    sub_2269772A4(*a2, v9, v10, v11, v12, v13, v14);
    *a1 = v8;
    a1[1] = v9;
    a1[2] = v10;
    a1[3] = v11;
    a1[4] = v12;
    a1[5] = v13;
    *((unsigned char *)a1 + 48) = v14;
    *(_WORD *)((char *)a1 + 49) = *(_WORD *)((char *)a2 + 49);
    uint64_t v15 = v6[7];
    unsigned __int8 v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_2269B82E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = v6[8];
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (id *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v6[9];
    uint64_t v24 = (_OWORD *)((char *)a1 + v23);
    uint64_t v25 = (_OWORD *)((char *)a2 + v23);
    long long v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = v6[10];
    long long v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    *(void *)long long v28 = *(void *)v29;
    v28[8] = v29[8];
    *(_OWORD *)((char *)a1 + v6[11]) = *(_OWORD *)((char *)a2 + v6[11]);
    *(void *)((char *)a1 + v6[12]) = *(id *)((char *)a2 + v6[12]);
    uint64_t v30 = v6[13];
    char v31 = *(id *)((char *)a2 + v30);
    *(void *)((char *)a1 + v30) = v31;
    uint64_t v32 = *(void (**)(void *, void, uint64_t, int *))(v35 + 56);
    swift_bridgeObjectRetain();
    id v33 = v31;
    v32(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_226992274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  uint64_t v7 = *((void *)v6 - 1);
  id v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      id v38 = *(id *)a2;
      uint64_t v39 = *(void *)(a2 + 8);
      uint64_t v40 = *(void *)(a2 + 16);
      char v41 = *(void **)(a2 + 24);
      uint64_t v42 = *(void *)(a2 + 32);
      uint64_t v43 = *(void *)(a2 + 40);
      unsigned __int8 v44 = *(unsigned char *)(a2 + 48);
      sub_2269772A4(*(id *)a2, v39, v40, v41, v42, v43, v44);
      uint64_t v45 = *(void **)a1;
      uint64_t v46 = *(void *)(a1 + 8);
      uint64_t v47 = *(void *)(a1 + 16);
      uint64_t v48 = *(void **)(a1 + 24);
      uint64_t v49 = *(void *)(a1 + 32);
      uint64_t v50 = *(void *)(a1 + 40);
      *(void *)a1 = v38;
      *(void *)(a1 + 8) = v39;
      *(void *)(a1 + 16) = v40;
      *(void *)(a1 + 24) = v41;
      *(void *)(a1 + 32) = v42;
      *(void *)(a1 + 40) = v43;
      unsigned int v51 = *(unsigned __int8 *)(a1 + 48);
      *(unsigned char *)(a1 + 48) = v44;
      sub_226976180(v45, v46, v47, v48, v49, v50, v51);
      *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
      *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
      uint64_t v52 = v6[7];
      uint64_t v53 = a1 + v52;
      uint64_t v54 = a2 + v52;
      uint64_t v55 = sub_2269B82E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 24))(v53, v54, v55);
      uint64_t v56 = v6[8];
      uint64_t v57 = (void *)(a1 + v56);
      uint64_t v58 = (void *)(a2 + v56);
      void *v57 = *v58;
      v57[1] = v58[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v59 = v6[9];
      unint64_t v60 = (void *)(a1 + v59);
      uint64_t v61 = (void *)(a2 + v59);
      void *v60 = *v61;
      v60[1] = v61[1];
      v60[2] = v61[2];
      v60[3] = v61[3];
      uint64_t v62 = v6[10];
      uint64_t v63 = a1 + v62;
      uint64_t v64 = (uint64_t *)(a2 + v62);
      uint64_t v65 = *v64;
      *(unsigned char *)(v63 + 8) = *((unsigned char *)v64 + 8);
      *(void *)uint64_t v63 = v65;
      uint64_t v66 = v6[11];
      id v67 = (void *)(a1 + v66);
      uint64_t v68 = (void *)(a2 + v66);
      void *v67 = *v68;
      v67[1] = v68[1];
      *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
      uint64_t v69 = v6[13];
      uint64_t v70 = *(void **)(a1 + v69);
      uint64_t v71 = *(void **)(a2 + v69);
      *(void *)(a1 + v69) = v71;
      id v72 = v71;

      return a1;
    }
    sub_226990A70(a1, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  id v11 = *(id *)a2;
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 16);
  unsigned __int8 v14 = *(void **)(a2 + 24);
  uint64_t v73 = v7;
  uint64_t v15 = *(void *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 40);
  unsigned __int8 v17 = *(unsigned char *)(a2 + 48);
  sub_2269772A4(*(id *)a2, v12, v13, v14, v15, v16, v17);
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v12;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = v15;
  *(void *)(a1 + 40) = v16;
  *(unsigned char *)(a1 + 48) = v17;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  uint64_t v18 = v6[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = v6[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  uint64_t v25 = v6[9];
  long long v26 = (_OWORD *)(a1 + v25);
  uint64_t v27 = (_OWORD *)(a2 + v25);
  long long v28 = v27[1];
  *long long v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = v6[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  char v32 = *(unsigned char *)(v31 + 8);
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = v32;
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
  uint64_t v33 = v6[13];
  os_log_type_t v34 = *(void **)(a2 + v33);
  *(void *)(a1 + v33) = v34;
  uint64_t v35 = *(void (**)(uint64_t, void, uint64_t, int *))(v73 + 56);
  swift_bridgeObjectRetain();
  id v36 = v34;
  v35(a1, 0, 1, v6);
  return a1;
}

_OWORD *sub_226992638(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    long long v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
    *(_WORD *)((char *)a1 + 49) = *(_WORD *)((char *)a2 + 49);
    uint64_t v9 = v6[7];
    int v10 = (char *)a1 + v9;
    id v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2269B82E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
    uint64_t v13 = v6[9];
    unsigned __int8 v14 = (_OWORD *)((char *)a1 + v13);
    uint64_t v15 = (_OWORD *)((char *)a2 + v13);
    long long v16 = v15[1];
    *unsigned __int8 v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v6[10];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    *(_OWORD *)((char *)a1 + v6[11]) = *(_OWORD *)((char *)a2 + v6[11]);
    *(void *)((char *)a1 + v6[12]) = *(void *)((char *)a2 + v6[12]);
    *(void *)((char *)a1 + v6[13]) = *(void *)((char *)a2 + v6[13]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_2269927F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for HoverTextPresentationEvent();
  uint64_t v7 = *((void *)v6 - 1);
  long long v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      char v24 = *(unsigned char *)(a2 + 48);
      uint64_t v25 = *(void **)a1;
      uint64_t v26 = *(void *)(a1 + 8);
      uint64_t v27 = *(void *)(a1 + 16);
      long long v28 = *(void **)(a1 + 24);
      uint64_t v29 = *(void *)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 40);
      long long v31 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v31;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      unsigned int v32 = *(unsigned __int8 *)(a1 + 48);
      *(unsigned char *)(a1 + 48) = v24;
      sub_226976180(v25, v26, v27, v28, v29, v30, v32);
      *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
      *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
      uint64_t v33 = v6[7];
      uint64_t v34 = a1 + v33;
      uint64_t v35 = a2 + v33;
      uint64_t v36 = sub_2269B82E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 40))(v34, v35, v36);
      uint64_t v37 = v6[8];
      id v38 = (void *)(a1 + v37);
      uint64_t v39 = (uint64_t *)(a2 + v37);
      uint64_t v41 = *v39;
      uint64_t v40 = v39[1];
      *id v38 = v41;
      v38[1] = v40;
      swift_bridgeObjectRelease();
      uint64_t v42 = v6[9];
      uint64_t v43 = (_OWORD *)(a1 + v42);
      unsigned __int8 v44 = (_OWORD *)(a2 + v42);
      long long v45 = v44[1];
      *uint64_t v43 = *v44;
      v43[1] = v45;
      uint64_t v46 = v6[10];
      uint64_t v47 = a1 + v46;
      uint64_t v48 = a2 + v46;
      *(unsigned char *)(v47 + 8) = *(unsigned char *)(v48 + 8);
      *(void *)uint64_t v47 = *(void *)v48;
      *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
      *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
      uint64_t v49 = v6[13];
      uint64_t v50 = *(void **)(a1 + v49);
      *(void *)(a1 + v49) = *(void *)(a2 + v49);

      return a1;
    }
    sub_226990A70(a1, (uint64_t (*)(void))type metadata accessor for HoverTextPresentationEvent);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  uint64_t v12 = v6[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  uint64_t v16 = v6[9];
  uint64_t v17 = (_OWORD *)(a1 + v16);
  uint64_t v18 = (_OWORD *)(a2 + v16);
  long long v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = v6[10];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_226992AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226992B04);
}

uint64_t sub_226992B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HoverTextPresentationEvent();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_226992B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226992B84);
}

uint64_t sub_226992B84(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_226992C04(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_226992C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t sub_226992CDC()
{
  uint64_t result = type metadata accessor for HoverTextPresentationEvent();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t initializeWithCopy for HoverTextHUDView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  return a1;
}

void *assignWithCopy for HoverTextHUDView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for HoverTextHUDView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextHUDView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverTextHUDView(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HoverTextHUDView()
{
  return &type metadata for HoverTextHUDView;
}

uint64_t sub_226992EE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226992F00@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 104);
  *a2 = *(void *)(v3 + 96);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_226992FAC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_226993090@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  *a2 = *(void *)(v3 + 136);
  return swift_retain();
}

uint64_t sub_22699313C()
{
  return swift_release();
}

uint64_t sub_22699321C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(void *)(v3 + 152);
  return result;
}

uint64_t sub_2269932C4()
{
  return swift_release();
}

uint64_t sub_226993390@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  uint64_t v5 = sub_2269B82E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_22699348C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_2269B82E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2;
  swift_getKeyPath();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  uint64_t v13 = v8;
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B8490();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_226993614@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  *a2 = v4;

  return v4;
}

void sub_2269936D4(void **a1)
{
  unint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  id v2 = v1;
  sub_2269B8490();
  swift_release();
}

double sub_2269937B0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>)
{
  *(void *)a8 = 0x4028000000000000;
  uint64_t v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2681494B0);
  uint64_t v23 = (uint64_t *)(a8 + v22[16]);
  *uint64_t v23 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148928);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = a8 + v22[17];
  type metadata accessor for CGSize(0);
  sub_2269B8C40();
  *(_OWORD *)uint64_t v24 = v28;
  *(void *)(v24 + 16) = v29;
  uint64_t v25 = (_OWORD *)(a8 + v22[18]);
  sub_2269B8C40();
  *uint64_t v25 = v28;
  uint64_t v26 = v22[19];
  sub_2269B8C40();
  double result = *(double *)&v28;
  *(_OWORD *)(a8 + v26) = v28;
  *(double *)(a8 + 8) = a9;
  *(double *)(a8 + 16) = a10;
  *(double *)(a8 + 24) = a11;
  *(void *)(a8 + 72) = a6;
  *(void *)(a8 + 80) = a7;
  *(void *)(a8 + 32) = a1;
  *(void *)(a8 + 40) = a2;
  *(void *)(a8 + 48) = a3;
  *(void *)(a8 + 56) = a4;
  *(void *)(a8 + 64) = a5;
  return result;
}

uint64_t sub_22699391C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149430);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149438);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226993B90(a1, (uint64_t)v12, a3, a4, a5);
  swift_getKeyPath();
  *(void *)&v22[0] = a1;
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v17 = (const __CTFont *)*(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  CTFontGetAscent(v17);
  CTFontGetDescent(v17);
  CTFontGetLeading(v17);

  sub_2269B8D50();
  sub_2269B8690();
  sub_22696B88C((uint64_t)v12, (uint64_t)v16, &qword_268149430);
  uint64_t v18 = &v16[*(int *)(v14 + 44)];
  long long v19 = v22[1];
  *(_OWORD *)uint64_t v18 = v22[0];
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v22[2];
  sub_22696B8F0((uint64_t)v12, &qword_268149430);
  sub_22696B88C((uint64_t)v16, a2, &qword_268149438);
  uint64_t v20 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268149440) + 36);
  *(void *)uint64_t v20 = 0x4024000000000000;
  *(void *)(v20 + 8) = a1;
  *(void *)(v20 + 16) = &off_26DA806F0;
  *(unsigned char *)(v20 + 24) = 1;
  swift_retain();
  return sub_22696B8F0((uint64_t)v16, &qword_268149438);
}

uint64_t sub_226993B90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v59 = a2;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149448);
  MEMORY[0x270FA5388](v57);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149450);
  MEMORY[0x270FA5388](v58);
  uint64_t v52 = (uint64_t)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149458);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149460);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149430);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v56 = (uint64_t)&v51 - v22;
  *(void *)uint64_t v14 = sub_2269B8830();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v23 = (uint64_t)&v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268149468) + 44)];
  double v55 = a5;
  sub_226994114(a1, v23, a3, a4, a5);
  sub_226994FB8(a1);
  sub_226995380(a1);
  uint64_t v24 = self;
  id v25 = objc_msgSend(v24, sel_mainScreen);
  objc_msgSend(v25, sel_bounds);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v63.origin.CGFloat x = v27;
  v63.origin.CGFloat y = v29;
  v63.size.CGFloat width = v31;
  v63.size.CGFloat height = v33;
  CGRectGetWidth(v63);
  sub_2269B8D50();
  sub_2269B8690();
  sub_22696B88C((uint64_t)v14, (uint64_t)v17, &qword_268149458);
  uint64_t v34 = &v17[*(int *)(v15 + 36)];
  long long v35 = v61;
  *(_OWORD *)uint64_t v34 = v60;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v62;
  sub_22696B8F0((uint64_t)v14, &qword_268149458);
  double v53 = a3;
  double v54 = a4;
  sub_226994FB8(a1);
  double v37 = v36;
  id v38 = objc_msgSend(v24, sel_mainScreen);
  objc_msgSend(v38, sel_bounds);
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;

  v64.origin.CGFloat x = v40;
  v64.origin.CGFloat y = v42;
  v64.size.CGFloat width = v44;
  v64.size.CGFloat height = v46;
  if (CGRectGetWidth(v64) * 0.1 >= v37 || (sub_226994FB8(a1), v47 >= sub_226995380(a1)))
  {
    sub_22696B88C((uint64_t)v17, (uint64_t)v10, &qword_268149460);
    swift_storeEnumTagMultiPayload();
    sub_22699555C(&qword_268149470, &qword_268149450, (void (*)(void))sub_22699552C);
    sub_22699552C();
    sub_2269B88E0();
  }
  else
  {
    uint64_t v48 = v52;
    sub_22696B88C((uint64_t)v17, v52, &qword_268149460);
    *(_WORD *)(v48 + *(int *)(v58 + 36)) = 1;
    sub_22696B88C(v48, (uint64_t)v10, &qword_268149450);
    swift_storeEnumTagMultiPayload();
    sub_22699555C(&qword_268149470, &qword_268149450, (void (*)(void))sub_22699552C);
    sub_22699552C();
    sub_2269B88E0();
    sub_22696B8F0(v48, &qword_268149450);
  }
  uint64_t v49 = v56;
  sub_22696B7FC((uint64_t)v21, v56, &qword_268149430);
  sub_22696B8F0((uint64_t)v17, &qword_268149460);
  return sub_22696B7FC(v49, v59, &qword_268149430);
}

uint64_t sub_226994114@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v114 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149488);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v101 = (uint64_t *)((char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149490);
  uint64_t v111 = *(void *)(v112 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v112);
  uint64_t v100 = (uint64_t)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v99 = (uint64_t)&v97 - v13;
  uint64_t v14 = sub_2269B8290();
  uint64_t v109 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v105 = (char *)&v97 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v104 = (char *)&v97 - v17;
  uint64_t v18 = sub_2269B8240();
  uint64_t v106 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2269B82E0();
  uint64_t v102 = v21;
  uint64_t v103 = *(void *)(v21 - 8);
  uint64_t v22 = v103;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149498);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v113 = (uint64_t)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v115 = (uint64_t)&v97 - v28;
  swift_getKeyPath();
  uint64_t v29 = a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore___observationRegistrar;
  *(void *)&long long v118 = a1;
  uint64_t v107 = sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  uint64_t v108 = v29;
  sub_2269B84A0();
  swift_release();
  uint64_t v110 = a1;
  uint64_t v30 = a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  CGFloat v31 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v98 = v30;
  uint64_t v97 = v31;
  v31(v24, v30, v21);
  sub_2269B81F0();
  sub_2269956AC(&qword_268148B20, MEMORY[0x263F066D8]);
  double v32 = v104;
  uint64_t v33 = v18;
  sub_2269B90C0();
  uint64_t v34 = v105;
  sub_2269B90E0();
  sub_2269956AC(&qword_268148B28, MEMORY[0x263F067E8]);
  LOBYTE(v29) = sub_2269B8EF0();
  long long v35 = *(void (**)(char *, uint64_t))(v109 + 8);
  v35(v34, v14);
  v35(v32, v14);
  uint64_t v36 = v102;
  (*(void (**)(char *, uint64_t))(v106 + 8))(v20, v33);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v24, v36);
  if (v29)
  {
    uint64_t v37 = 1;
    uint64_t v38 = v110;
    uint64_t v39 = v115;
    uint64_t v40 = v112;
  }
  else
  {
    swift_getKeyPath();
    uint64_t v41 = v110;
    *(void *)&long long v118 = v110;
    sub_2269B84A0();
    swift_release();
    v97(v24, v98, v36);
    uint64_t v106 = sub_2269B8A30();
    uint64_t v105 = v42;
    char v44 = v43;
    uint64_t v109 = v45;
    swift_getKeyPath();
    *(void *)&long long v118 = v41;
    sub_2269B84A0();
    swift_release();
    unint64_t v46 = *(void *)(v41 + 152);
    double v47 = 1.0;
    double v48 = 1.0;
    if (v46 <= 4) {
      double v48 = dbl_2269BBEB0[v46];
    }
    swift_getKeyPath();
    *(void *)&long long v118 = v41;
    sub_2269B84A0();
    swift_release();
    uint64_t v49 = OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont;
    objc_msgSend(*(id *)(v41 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont), sel_pointSize);
    double v51 = v50;
    swift_getKeyPath();
    *(void *)&long long v118 = v41;
    sub_2269B84A0();
    swift_release();
    uint64_t v38 = v41;
    unint64_t v52 = *(void *)(v41 + 152);
    if (v52 <= 4) {
      double v47 = dbl_2269BBEB0[v52];
    }
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = v41;
    *(double *)(v53 + 24) = a3;
    *(double *)(v53 + 32) = a4;
    *(double *)(v53 + 40) = a5;
    uint64_t v54 = swift_allocObject();
    *(void *)(v54 + 16) = v41;
    *(double *)(v54 + 24) = a3;
    *(double *)(v54 + 32) = a4;
    *(double *)(v54 + 40) = a5;
    swift_retain_n();
    uint64_t v55 = sub_2269B8880();
    uint64_t v56 = sub_2269B8880();
    uint64_t v57 = (uint64_t)v101;
    *uint64_t v101 = v56;
    *(void *)(v57 + 8) = 0;
    *(unsigned char *)(v57 + 16) = 1;
    uint64_t v58 = v57 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2681494A0) + 44);
    uint64_t v59 = swift_allocObject();
    long long v60 = v105;
    *(void *)(v59 + 16) = v106;
    *(void *)(v59 + 24) = v60;
    *(unsigned char *)(v59 + 32) = v44 & 1;
    *(void *)(v59 + 40) = v109;
    sub_2269937B0(v55, (uint64_t)sub_226995734, v53, (uint64_t)sub_226995744, v54, (uint64_t)sub_226995798, v59, v58, 2.0 / v48, v51 * 2.8125, v47);
    swift_getKeyPath();
    *(void *)&long long v118 = v38;
    sub_2269B84A0();
    swift_release();
    long long v61 = (const __CTFont *)*(id *)(v38 + v49);
    CTFontGetAscent(v61);
    CTFontGetDescent(v61);
    CTFontGetLeading(v61);

    sub_2269B8D50();
    sub_2269B8690();
    uint64_t v62 = v100;
    sub_22696B88C(v57, v100, &qword_268149488);
    uint64_t v40 = v112;
    CGRect v63 = (_OWORD *)(v62 + *(int *)(v112 + 36));
    long long v64 = v119;
    _OWORD *v63 = v118;
    v63[1] = v64;
    v63[2] = v120;
    sub_22696B8F0(v57, &qword_268149488);
    uint64_t v65 = v62;
    uint64_t v66 = v99;
    sub_22696B7FC(v65, v99, &qword_268149490);
    uint64_t v67 = v66;
    uint64_t v39 = v115;
    sub_22696B7FC(v67, v115, &qword_268149490);
    uint64_t v37 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v111 + 56))(v39, v37, 1, v40);
  swift_getKeyPath();
  uint64_t v116 = v38;
  sub_2269B84A0();
  swift_release();
  uint64_t v68 = *(void *)(v38 + 104);
  if (v68)
  {
    uint64_t v116 = *(void *)(v38 + 96);
    uint64_t v117 = v68;
    sub_22696F93C();
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_2269B8A40();
    uint64_t v71 = v70;
    char v73 = v72 & 1;
    swift_getKeyPath();
    uint64_t v116 = v38;
    sub_2269B84A0();
    swift_release();
    id v74 = *(id *)(v38 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
    sub_2269B8980();
    uint64_t v112 = sub_2269B89D0();
    uint64_t v111 = v75;
    char v77 = v76;
    uint64_t v110 = v78;
    swift_release();
    uint64_t v79 = v77 & 1;
    sub_226968520(v69, v71, v73);
    swift_bridgeObjectRelease();
    unsigned __int8 v80 = sub_2269B8970();
    sub_2269B85E0();
    uint64_t v82 = v81;
    uint64_t v84 = v83;
    uint64_t v109 = v85;
    uint64_t v108 = v86;
    uint64_t v87 = v80;
  }
  else
  {
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    uint64_t v79 = 0;
    uint64_t v110 = 0;
    uint64_t v87 = 0;
    uint64_t v82 = 0;
    uint64_t v84 = 0;
    uint64_t v109 = 0;
    uint64_t v108 = 0;
  }
  uint64_t v88 = v113;
  sub_22696B88C(v115, v113, &qword_268149498);
  uint64_t v89 = v114;
  sub_22696B88C(v88, v114, &qword_268149498);
  uint64_t v90 = v89 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2681494A8) + 48);
  uint64_t v91 = v112;
  uint64_t v92 = v111;
  *(void *)uint64_t v90 = v112;
  *(void *)(v90 + 8) = v92;
  *(void *)(v90 + 16) = v79;
  char v93 = v79;
  uint64_t v94 = v110;
  *(void *)(v90 + 24) = v110;
  *(void *)(v90 + 32) = v87;
  *(void *)(v90 + 40) = v82;
  *(void *)(v90 + 48) = v84;
  uint64_t v95 = v108;
  *(void *)(v90 + 56) = v109;
  *(void *)(v90 + 64) = v95;
  *(unsigned char *)(v90 + 72) = 0;
  sub_2269957B0(v91, v92, v93, v94);
  sub_22696B8F0(v115, &qword_268149498);
  sub_2269957F4(v91, v92, v93, v94);
  return sub_22696B8F0(v88, &qword_268149498);
}

uint64_t sub_226994D5C(uint64_t a1)
{
  uint64_t v2 = sub_2269B8420();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v11[1] = a1;
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  uint64_t v7 = *(void *)(a1 + 136);
  if (v7)
  {
    uint64_t v8 = *(void **)(v7 + 16);
    if (v8)
    {
      swift_retain();
      if ((objc_msgSend(v8, sel_isValid) & 1) == 0) {
        return swift_release();
      }
    }
    else
    {
      swift_retain();
    }
    sub_2269B8410();
    sub_226967AF4();
    uint64_t v10 = v9;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)(v7 + 40) = v10;
    objc_msgSend(*(id *)(v7 + 16), sel_invalidate);
    return swift_release();
  }
  return result;
}

uint64_t sub_226994F00(uint64_t a1)
{
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  if (*(void *)(a1 + 136))
  {
    swift_retain();
    sub_2269679C0();
    return swift_release();
  }
  return result;
}

void sub_226994FB8(uint64_t a1)
{
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v18 = a1;
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v6 = a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_getKeyPath();
  uint64_t v17 = a1;
  sub_2269B84A0();
  swift_release();
  uint64_t v7 = OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont;
  id v8 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__uiFont);
  sub_226968324(v8);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  uint64_t v17 = a1;
  sub_2269B84A0();
  swift_release();
  if (*(void *)(a1 + 104))
  {
    swift_getKeyPath();
    uint64_t v17 = a1;
    sub_2269B84A0();
    swift_release();
    if (*(void *)(a1 + 104))
    {
      swift_getKeyPath();
      uint64_t v17 = a1;
      swift_bridgeObjectRetain();
      sub_2269B84A0();
      swift_release();
      id v9 = *(id *)(a1 + v7);
      uint64_t v10 = (void *)sub_2269B8F00();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268149140);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2269BBB10;
      uint64_t v12 = (void *)*MEMORY[0x263F814F0];
      *(void *)(inited + 32) = *MEMORY[0x263F814F0];
      *(void *)(inited + 64) = sub_22699564C();
      *(void *)(inited + 40) = v9;
      id v13 = v9;
      id v14 = v12;
      sub_226980C94(inited);
      type metadata accessor for Key(0);
      sub_2269956AC(&qword_268148B10, type metadata accessor for Key);
      uint64_t v15 = (void *)sub_2269B8EB0();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_sizeWithAttributes_, v15);
      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

double sub_226995380(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v2, sel_bounds);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v15.origin.CGFloat x = v4;
  v15.origin.CGFloat y = v6;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v15);
  swift_getKeyPath();
  sub_2269956AC(&qword_268148B08, (void (*)(uint64_t))type metadata accessor for HoverTextStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v12 = OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode;
  if (*(void *)(a1 + OBJC_IVAR____TtC11HoverTextUI14HoverTextStore__displayMode)
    && (swift_getKeyPath(), sub_2269B84A0(), swift_release(), *(void *)(a1 + v12) != 1))
  {
    double v13 = 0.8;
  }
  else
  {
    double v13 = 0.95;
  }
  return Width * v13;
}

uint64_t sub_2269954F8@<X0>(uint64_t a1@<X8>)
{
  return sub_22699391C(*(void *)v1, a1, *(double *)(v1 + 8), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

void sub_226995510()
{
  sub_226961388(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_22699552C()
{
  return sub_22699555C(&qword_268149478, &qword_268149460, (void (*)(void))sub_2269955D8);
}

uint64_t sub_22699555C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2269955D8()
{
  unint64_t result = qword_268149480;
  if (!qword_268149480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149480);
  }
  return result;
}

unint64_t sub_22699564C()
{
  unint64_t result = qword_268149148[0];
  if (!qword_268149148[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_268149148);
  }
  return result;
}

uint64_t sub_22699568C()
{
  return sub_22695FB10(v0[2], v0[3], v0[4]);
}

uint64_t sub_2269956AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2269956FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_226995734()
{
  return sub_226994D5C(*(void *)(v0 + 16));
}

uint64_t sub_226995744()
{
  return sub_226994F00(*(void *)(v0 + 16));
}

uint64_t sub_226995754()
{
  sub_226968520(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_226995798@<X0>(uint64_t a1@<X8>)
{
  return sub_22697B898(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_2269957B0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22697F76C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2269957F4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_226968520(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_226995848()
{
  return sub_226960190(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_226995864()
{
  return sub_22696053C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_226995884()
{
  unint64_t result = qword_2681494B8;
  if (!qword_2681494B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149440);
    sub_22699555C(&qword_2681494C0, &qword_268149438, (void (*)(void))sub_22699592C);
    sub_2269959D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681494B8);
  }
  return result;
}

unint64_t sub_22699592C()
{
  unint64_t result = qword_2681494C8;
  if (!qword_2681494C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149430);
    sub_22699555C(&qword_268149470, &qword_268149450, (void (*)(void))sub_22699552C);
    sub_22699552C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681494C8);
  }
  return result;
}

unint64_t sub_2269959D4()
{
  unint64_t result = qword_2681494D0;
  if (!qword_2681494D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681494D0);
  }
  return result;
}

uint64_t sub_226995A2C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_22696E708(0, v2, 0);
    uint64_t result = v9;
    CGFloat v4 = (int *)(a1 + 32);
    do
    {
      int v6 = *v4++;
      int v5 = v6;
      uint64_t v10 = result;
      unint64_t v8 = *(void *)(result + 16);
      unint64_t v7 = *(void *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_22696E708(v7 > 1, v8 + 1, 1);
        uint64_t result = v10;
      }
      *(void *)(result + 16) = v8 + 1;
      *(_DWORD *)(result + 4 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

id AXRuntimeClient.__allocating_init(logger:subscribeToNotifications:runloop:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)(a1, a2, a3);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AXRuntimeClient.enableAccessibility()()
{
  uint64_t v2 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled) == 1)
  {
    double v3 = sub_2269B8540();
    os_log_type_t v4 = sub_2269B9160();
    if (os_log_type_enabled(v3, v4))
    {
      int v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_22695C000, v3, v4, "Accessibility already enabled", v5, 2u);
      MEMORY[0x22A65DA10](v5, -1, -1);
    }
  }
  else
  {
    sub_226996918();
    if (!v1) {
      *(unsigned char *)(v0 + v2) = 1;
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AXRuntimeClient.disableAccessibility()()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled;
  char v3 = *(unsigned char *)(v0 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled);
  os_log_type_t v4 = sub_2269B8540();
  os_log_type_t v5 = sub_2269B9160();
  BOOL v6 = os_log_type_enabled(v4, v5);
  if (v3)
  {
    if (v6)
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22695C000, v4, v5, "Unregistering for ax runtime notifications and removing observer", v7, 2u);
      MEMORY[0x22A65DA10](v7, -1, -1);
    }

    unint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver);
    *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver) = 0;

    sub_226996B34(0);
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_22695C000, v4, v5, "Accessibility already disabled", v9, 2u);
      MEMORY[0x22A65DA10](v9, -1, -1);
    }
  }
  *(unsigned char *)(v1 + v2) = 0;
}

unint64_t AXRuntimeClientError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 2:
    case 3:
      sub_2269B9340();
      sub_2269B8F80();
      sub_2269B94D0();
      sub_2269B8F80();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 4:
      if (a1 | a2) {
        unint64_t result = 0xD000000000000023;
      }
      else {
        unint64_t result = 0xD000000000000025;
      }
      break;
    default:
      sub_2269B9340();
LABEL_4:
      sub_2269B8F80();
      type metadata accessor for AXError(0);
      sub_2269B93E0();
      unint64_t result = 0;
      break;
  }
  return result;
}

unint64_t sub_226995F70()
{
  return AXRuntimeClientError.errorDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t FocusChangeInfo.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 FocusChangeInfo.frame.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 48);
  __n128 result = *(__n128 *)(v1 + 16);
  long long v4 = *(_OWORD *)(v1 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

id AXRuntimeClient.init(logger:subscribeToNotifications:runloop:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v8 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange];
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated];
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v11 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange];
  void *v11 = 0;
  v11[1] = 0;
  uint64_t v12 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement];
  void *v12 = 0;
  v12[1] = 0;
  double v13 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide];
  *double v13 = 0;
  v13[1] = 0;
  id v14 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange];
  *id v14 = 0;
  v14[1] = 0;
  CGRect v15 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame];
  void *v15 = 0;
  v15[1] = 0;
  uint64_t v16 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged];
  *uint64_t v16 = 0;
  v16[1] = 0;
  uint64_t v17 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode];
  *uint64_t v17 = 0;
  v17[1] = 0;
  uint64_t v18 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification];
  *uint64_t v18 = 0;
  v18[1] = 0;
  v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient__isEnabled] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver] = 0;
  v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred] = 0;
  uint64_t v19 = &v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_logger];
  uint64_t v20 = sub_2269B8550();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v19, a1, v20);
  *(void *)&v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_subscribeToNotifications] = a2;
  *(void *)&v3[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_runloop] = a3;
  v24.receiver = v3;
  v24.super_class = ObjectType;
  id v22 = objc_msgSendSuper2(&v24, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a1, v20);
  return v22;
}

uint64_t AXRuntimeClient.nativeFocusItemDidChange.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange, (void (*)(void, void))sub_22696C19C);
}

uint64_t AXRuntimeClient.nativeFocusItemDidChange.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange, (uint64_t (*)(uint64_t, uint64_t))sub_22696C20C);
}

uint64_t (*AXRuntimeClient.nativeFocusItemDidChange.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.valueChanged.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.valueChanged.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.valueChanged.modify())()
{
  return j__swift_endAccess;
}

uint64_t AXRuntimeClient.elementVisualsUpdated.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.elementVisualsUpdated.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.elementVisualsUpdated.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.focusedApplicationsDidChange.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.focusedApplicationsDidChange.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.focusedApplicationsDidChange.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.didReceiveAnnouncement.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.didReceiveAnnouncement.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.didReceiveAnnouncement.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.keyboardWillHide.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.keyboardWillHide.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.keyboardWillHide.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.currentInputModeDidChange.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.currentInputModeDidChange.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.currentInputModeDidChange.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.keyboardWillChangeFrame.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.keyboardWillChangeFrame.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.keyboardWillChangeFrame.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.loupeStateChanged.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged, (void (*)(void, void))sub_22696C19C);
}

uint64_t AXRuntimeClient.loupeStateChanged.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged, (uint64_t (*)(uint64_t, uint64_t))sub_22696C20C);
}

uint64_t (*AXRuntimeClient.loupeStateChanged.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.updateTypingDisplayMode.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode, (void (*)(void, void))sub_226999544);
}

uint64_t AXRuntimeClient.updateTypingDisplayMode.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t (*AXRuntimeClient.updateTypingDisplayMode.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXRuntimeClient.didReceiveNotification.getter()
{
  return sub_2269967D0(&OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification, (void (*)(void, void))sub_226999544);
}

uint64_t sub_2269967D0(void *a1, void (*a2)(void, void))
{
  long long v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t AXRuntimeClient.didReceiveNotification.setter(uint64_t a1, uint64_t a2)
{
  return sub_226996858(a1, a2, &OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification, (uint64_t (*)(uint64_t, uint64_t))sub_226999548);
}

uint64_t sub_226996858(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  unint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*AXRuntimeClient.didReceiveNotification.modify())()
{
  return j_j__swift_endAccess;
}

void sub_226996918()
{
  sub_226996B34(1);
  if (!v1)
  {
    uint64_t v2 = v0;
    AXUIElementRegisterSystemWideServerDeathCallback();
    id v3 = objc_msgSend(self, sel_systemWideElement);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_2269B8540();
      os_log_type_t v6 = sub_2269B9130();
      if (os_log_type_enabled(v5, v6))
      {
        id v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_22695C000, v5, v6, "Registering for ax runtime notifications and creating observer", v7, 2u);
        MEMORY[0x22A65DA10](v7, -1, -1);
      }

      id v8 = *(id *)&v2[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_runloop];
      uint64_t v9 = swift_bridgeObjectRetain();
      uint64_t v10 = sub_226995A2C(v9);
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_226997080(v10);
      swift_bridgeObjectRelease();
      uint64_t v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v13 = objc_allocWithZone((Class)AXObserverWrapper);
      id v14 = sub_226999214(v4, v8, v11, (uint64_t)sub_22699945C, v12);
      CGRect v15 = *(void **)&v2[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver];
      *(void *)&v2[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver] = v14;
    }
    else
    {
      sub_2269988FC();
      swift_allocError();
      *(void *)uint64_t v16 = 0;
      *(void *)(v16 + 8) = 0;
      *(unsigned char *)(v16 + 16) = 4;
      swift_willThrow();
    }
  }
}

uint64_t sub_226996B34(char a1)
{
  uint64_t v2 = sub_2269B8540();
  os_log_type_t v3 = sub_2269B9160();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    sub_2269B9290();
    _os_log_impl(&dword_22695C000, v2, v3, "Updating app ax. Enable? %{BOOL}d", v4, 8u);
    MEMORY[0x22A65DA10](v4, -1, -1);
  }

  uint64_t result = _AXSApplicationAccessibilityEnabled();
  if (a1)
  {
    if (result) {
      return result;
    }
    os_log_type_t v6 = sub_2269B8540();
    os_log_type_t v7 = sub_2269B9160();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22695C000, v6, v7, "Enabling app accessibility", v8, 2u);
      MEMORY[0x22A65DA10](v8, -1, -1);
    }
    goto LABEL_12;
  }
  if (!result) {
    return result;
  }
  if (_AXSCanDisableApplicationAccessibility())
  {
    os_log_type_t v6 = sub_2269B8540();
    os_log_type_t v9 = sub_2269B9160();
    if (os_log_type_enabled(v6, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_22695C000, v6, v9, "Disabling app accessibility", v10, 2u);
      MEMORY[0x22A65DA10](v10, -1, -1);
    }
LABEL_12:

    return _AXSApplicationAccessibilitySetEnabled();
  }
  sub_2269988FC();
  swift_allocError();
  *(_OWORD *)uint64_t v11 = xmmword_2269BBEE0;
  *(unsigned char *)(v11 + 16) = 4;
  return swift_willThrow();
}

void sub_226996D58(char *a1)
{
  if (a1)
  {
    uint64_t v1 = sub_2269B8540();
    os_log_type_t v2 = sub_2269B9160();
    if (os_log_type_enabled(v1, v2))
    {
      os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v3 = 0;
      _os_log_impl(&dword_22695C000, v1, v2, "AX system server died", v3, 2u);
      MEMORY[0x22A65DA10](v3, -1, -1);
    }

    uint64_t v4 = sub_2269B8540();
    os_log_type_t v5 = sub_2269B9160();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_22695C000, v4, v5, "Unregistering for ax runtime notifications and removing observer", v6, 2u);
      MEMORY[0x22A65DA10](v6, -1, -1);
    }

    os_log_type_t v7 = *(void **)&a1[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver];
    *(void *)&a1[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver] = 0;

    sub_226996B34(0);
    sub_226996918();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_226997080(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_2269B93B0();
    uint64_t v4 = a1 + 32;
    do
    {
      v4 += 4;
      sub_2269B9570();
      sub_2269B9390();
      sub_2269B93C0();
      sub_2269B93D0();
      sub_2269B93A0();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

void sub_226997128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x22A65DAD0](v5);
  if (!v6) {
    return;
  }
  os_log_type_t v7 = (unsigned char *)v6;
  switch((int)a1)
  {
    case 1005:
      sub_226991670(a2, (uint64_t)v97);
      if (*((void *)&v97[1] + 1))
      {
        sub_226978330(0, &qword_2681494F0);
        if (swift_dynamicCast())
        {
          *(void *)&v97[0] = 0xD00000000000001FLL;
          *((void *)&v97[0] + 1) = 0x80000002269BE190;
          id v8 = objc_msgSend((id)v95, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
          swift_unknownObjectRelease();

          if (v8)
          {
            sub_2269B92D0();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v95 = 0u;
            long long v96 = 0u;
          }
          sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
          if (*((void *)&v97[1] + 1))
          {
            if (swift_dynamicCast()) {
              uint64_t v28 = *((void *)&v95 + 1);
            }
            else {
              uint64_t v28 = 0;
            }
LABEL_40:
            sub_226991670(a2, (uint64_t)v97);
            if (*((void *)&v97[1] + 1))
            {
              sub_226978330(0, &qword_2681494F0);
              if (swift_dynamicCast())
              {
                uint64_t v29 = (void *)v95;
                *(void *)&v97[0] = 0xD00000000000001ELL;
                *((void *)&v97[0] + 1) = 0x80000002269BE170;
                id v30 = objc_msgSend((id)v95, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
                swift_unknownObjectRelease();

                if (v30)
                {
                  sub_2269B92D0();
                  swift_unknownObjectRelease();
                }
                else
                {
                  long long v95 = 0u;
                  long long v96 = 0u;
                }
                sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
                if (*((void *)&v97[1] + 1))
                {
                  int v39 = swift_dynamicCast();
                  if (v39) {
                    uint64_t v31 = v95;
                  }
                  else {
                    uint64_t v31 = 0;
                  }
                  if (v39) {
                    uint64_t v32 = *((void *)&v95 + 1);
                  }
                  else {
                    uint64_t v32 = 0;
                  }
LABEL_49:
                  sub_226991670(a2, (uint64_t)&v95);
                  if (*((void *)&v96 + 1))
                  {
                    sub_226978330(0, &qword_2681494F0);
                    if (swift_dynamicCast())
                    {
                      *(void *)&long long v95 = 0xD000000000000026;
                      *((void *)&v95 + 1) = 0x80000002269BD160;
                      id v33 = objc_msgSend((id)v93, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
                      swift_unknownObjectRelease();

                      if (v33)
                      {
                        sub_2269B92D0();
                        swift_unknownObjectRelease();
                      }
                      else
                      {
                        long long v95 = 0u;
                        long long v96 = 0u;
                      }
                      sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
LABEL_83:
                      sub_226991670(a2, (uint64_t)&v93);
                      if (*((void *)&v94 + 1))
                      {
                        sub_226978330(0, &qword_2681494F0);
                        if (swift_dynamicCast())
                        {
                          strcpy((char *)&v93, "notification");
                          BYTE13(v93) = 0;
                          HIWORD(v93) = -5120;
                          id v40 = objc_msgSend((id)v91, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
                          swift_unknownObjectRelease();

                          if (v40)
                          {
                            sub_2269B92D0();
                            swift_unknownObjectRelease();
                          }
                          else
                          {
                            long long v93 = 0u;
                            long long v94 = 0u;
                          }
                          sub_2269994DC((uint64_t)&v93, (uint64_t)&v95);
LABEL_95:
                          sub_226991670(a2, (uint64_t)&v91);
                          if (*((void *)&v92 + 1))
                          {
                            sub_226978330(0, &qword_2681494F0);
                            if (swift_dynamicCast())
                            {
                              *(void *)&long long v91 = 0xD000000000000025;
                              *((void *)&v91 + 1) = 0x80000002269BE140;
                              id v42 = objc_msgSend((id)v89, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
                              swift_unknownObjectRelease();

                              if (v42)
                              {
                                sub_2269B92D0();
                                swift_unknownObjectRelease();
                              }
                              else
                              {
                                long long v91 = 0u;
                                long long v92 = 0u;
                              }
                              sub_2269994DC((uint64_t)&v91, (uint64_t)&v93);
                              if (!*((void *)&v94 + 1))
                              {
                                id v43 = 0;
LABEL_114:
                                if (v32)
                                {
                                  swift_bridgeObjectRelease();
                                  unint64_t v46 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                  swift_beginAccess();
                                  double v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v46;
                                  if (!*(void *)v46)
                                  {
                                    sub_22699947C((uint64_t)&v93);
                                    sub_22699947C((uint64_t)&v95);
                                    sub_22699947C((uint64_t)v97);
                                    swift_endAccess();
                                    swift_bridgeObjectRelease();

                                    goto LABEL_127;
                                  }
                                  swift_endAccess();
                                  swift_retain();
                                  v47(v31, v32, 12, v43);
                                  swift_bridgeObjectRelease();
                                  goto LABEL_117;
                                }
                                if ((AXDeviceSupportsHoverTextTyping() & 1) == 0
                                  || (id v49 = objc_msgSend(self, sel_sharedInstance),
                                      unsigned int v50 = objc_msgSend(v49, sel_hoverTextTypingEnabled),
                                      v49,
                                      !v50))
                                {

                                  swift_bridgeObjectRelease();
                                  goto LABEL_125;
                                }
                                if (!v28)
                                {
                                  if (v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred])
                                  {
                                    v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred] = 0;
                                    uint64_t v67 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                    swift_beginAccess();
                                    double v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v67;
                                    if (!*(void *)v67) {
                                      goto LABEL_185;
                                    }
                                    swift_endAccess();
                                    swift_retain();
                                    uint64_t v68 = 9;
                                  }
                                  else if (*((void *)&v96 + 1))
                                  {
                                    uint64_t v78 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                    swift_beginAccess();
                                    double v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v78;
                                    if (!*(void *)v78) {
                                      goto LABEL_185;
                                    }
                                    swift_endAccess();
                                    swift_retain();
                                    uint64_t v68 = 0;
                                  }
                                  else
                                  {
                                    if (!*((void *)&v97[1] + 1))
                                    {

                                      goto LABEL_125;
                                    }
                                    uint64_t v87 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                    swift_beginAccess();
                                    double v47 = *(void (**)(uint64_t, uint64_t, uint64_t, id))v87;
                                    if (!*(void *)v87) {
                                      goto LABEL_185;
                                    }
                                    swift_endAccess();
                                    swift_retain();
                                    uint64_t v68 = 10;
                                  }
                                  v47(0, 0, v68, v43);
LABEL_117:

                                  uint64_t v48 = (uint64_t)v47;
LABEL_118:
                                  sub_22696C20C(v48);
LABEL_125:
                                  sub_22699947C((uint64_t)&v93);
                                  sub_22699947C((uint64_t)&v95);
LABEL_126:
                                  sub_22699947C((uint64_t)v97);
                                  goto LABEL_127;
                                }
                                uint64_t v51 = _s11HoverTextUI0aB17PresentationEventV011ValueChangeE4TypeO03rawF0AESgSS_tcfC_0();
                                if (v51 == 12)
                                {
LABEL_123:

                                  sub_22699947C((uint64_t)&v93);
                                  sub_22699947C((uint64_t)&v95);
                                  sub_22699947C((uint64_t)v97);
                                  return;
                                }
                                uint64_t v69 = v51;
                                if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v51) == 0xD000000000000017
                                  && v70 == 0x80000002269BD020)
                                {
                                  goto LABEL_157;
                                }
                                char v79 = sub_2269B94F0();
                                swift_bridgeObjectRelease();
                                if ((v79 & 1) == 0)
                                {
                                  if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v69) == 0xD000000000000017
                                    && v83 == 0x80000002269BD040)
                                  {
LABEL_157:
                                    swift_bridgeObjectRelease();
                                    goto LABEL_171;
                                  }
                                  char v84 = sub_2269B94F0();
                                  swift_bridgeObjectRelease();
                                  if ((v84 & 1) == 0)
                                  {
                                    if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v69) != 0xD00000000000001ALL
                                      || v85 != 0x80000002269BD0A0)
                                    {
                                      char v86 = sub_2269B94F0();
                                      swift_bridgeObjectRelease();
                                      if ((v86 & 1) == 0) {
                                        goto LABEL_123;
                                      }
                                      goto LABEL_171;
                                    }
                                    goto LABEL_157;
                                  }
                                }
LABEL_171:
                                unsigned __int8 v80 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged];
                                swift_beginAccess();
                                uint64_t v81 = *(void (**)(void, void, uint64_t, id))v80;
                                if (*(void *)v80)
                                {
                                  swift_endAccess();
                                  swift_retain();
                                  v81(0, 0, v69, v43);

                                  uint64_t v48 = (uint64_t)v81;
                                  goto LABEL_118;
                                }
LABEL_185:
                                sub_22699947C((uint64_t)&v93);
                                sub_22699947C((uint64_t)&v95);
                                sub_22699947C((uint64_t)v97);
                                swift_endAccess();

                                goto LABEL_127;
                              }
                              sub_226991670((uint64_t)&v93, (uint64_t)&v89);
                              if (v90)
                              {
                                sub_226982748(&v89, &v91);
                                type metadata accessor for AXUIElementRef(0);
                                swift_dynamicCast();
                                id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F21668]), sel_initWithAXUIElement_, v88);

                                goto LABEL_114;
                              }
                              goto LABEL_189;
                            }
                          }
                          else
                          {
                            sub_22699947C((uint64_t)&v91);
                          }
                          id v43 = 0;
                          long long v93 = 0u;
                          long long v94 = 0u;
                          goto LABEL_114;
                        }
                      }
                      else
                      {
                        sub_22699947C((uint64_t)&v93);
                      }
                      long long v95 = 0u;
                      long long v96 = 0u;
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    sub_22699947C((uint64_t)&v95);
                  }
                  memset(v97, 0, 32);
                  goto LABEL_83;
                }
LABEL_48:
                sub_22699947C((uint64_t)v97);
                uint64_t v31 = 0;
                uint64_t v32 = 0;
                goto LABEL_49;
              }
            }
            else
            {
              sub_22699947C((uint64_t)v97);
            }
            memset(v97, 0, 32);
            goto LABEL_48;
          }
LABEL_39:
          sub_22699947C((uint64_t)v97);
          uint64_t v28 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        sub_22699947C((uint64_t)v97);
      }
      memset(v97, 0, 32);
      goto LABEL_39;
    case 1006:
    case 1007:
    case 1009:
    case 1010:
    case 1011:
    case 1012:
    case 1013:
    case 1015:
    case 1016:
    case 1017:
    case 1018:
    case 1019:
    case 1020:
    case 1021:
    case 1022:
    case 1023:
    case 1024:
    case 1025:
    case 1026:
    case 1027:
    case 1028:
    case 1029:
    case 1030:
    case 1032:
    case 1033:
    case 1034:
    case 1035:
    case 1036:
    case 1037:
    case 1038:
    case 1039:
    case 1040:
    case 1041:
    case 1042:
    case 1043:
    case 1045:
    case 1046:
    case 1047:
    case 1048:
    case 1049:
    case 1050:
    case 1051:
    case 1055:
    case 1056:
    case 1057:
    case 1058:
    case 1059:
    case 1060:
    case 1061:
    case 1062:
    case 1063:
    case 1064:
    case 1065:
    case 1066:
    case 1067:
    case 1068:
    case 1069:
    case 1070:
    case 1071:
    case 1072:
    case 1073:
    case 1074:
    case 1075:
    case 1076:
    case 1077:
    case 1078:
    case 1079:
    case 1080:
      goto LABEL_127;
    case 1008:
      sub_226991670(a2, (uint64_t)v97);
      if (!*((void *)&v97[1] + 1)) {
        goto LABEL_126;
      }
      sub_226978330(0, &qword_2681494F0);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_127;
      }
      uint64_t v10 = (void *)v95;
      *(void *)&long long v95 = 1635017060;
      *((void *)&v95 + 1) = 0xE400000000000000;
      id v11 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
      swift_unknownObjectRelease();
      if (v11)
      {
        sub_2269B92D0();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v95 = 0u;
        long long v96 = 0u;
      }
      sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
      if (*((void *)&v97[1] + 1))
      {
        if (swift_dynamicCast())
        {
          v97[0] = v93;
          *(void *)&long long v95 = 10;
          *((void *)&v95 + 1) = 0xE100000000000000;
          *(void *)&long long v93 = 32;
          *((void *)&v93 + 1) = 0xE100000000000000;
          sub_22696F93C();
          uint64_t v34 = sub_2269B92C0();
          unint64_t v36 = v35;
          swift_bridgeObjectRelease();
          goto LABEL_91;
        }
      }
      else
      {
        sub_22699947C((uint64_t)v97);
      }
      uint64_t v34 = 0;
      unint64_t v36 = 0xE000000000000000;
LABEL_91:
      *(void *)&long long v95 = 0xD000000000000021;
      *((void *)&v95 + 1) = 0x80000002269BE110;
      id v41 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
      swift_unknownObjectRelease();
      if (v41)
      {
        sub_2269B92D0();

        swift_unknownObjectRelease();
      }
      else
      {

        long long v95 = 0u;
        long long v96 = 0u;
      }
      sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
      if (*((void *)&v97[1] + 1))
      {
        if (swift_dynamicCast() & 1) != 0 && (v93)
        {
          char v44 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement];
          swift_beginAccess();
          uint64_t v45 = *(void (**)(uint64_t, unint64_t))v44;
          if (*(void *)v44)
          {
            swift_retain();
            v45(v34, v36);
            sub_22696C20C((uint64_t)v45);
          }
        }
      }
      else
      {
        sub_22699947C((uint64_t)v97);
      }
      swift_bridgeObjectRelease();
      goto LABEL_127;
    case 1014:
      uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange;
      goto LABEL_70;
    case 1031:
      sub_226991670(a2, (uint64_t)&v95);
      if (*((void *)&v96 + 1))
      {
        sub_226978330(0, &qword_2681494F0);
        if (swift_dynamicCast())
        {
          *(void *)&long long v95 = 0x656C6269736976;
          *((void *)&v95 + 1) = 0xE700000000000000;
          id v12 = objc_msgSend((id)v93, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
          swift_unknownObjectRelease();

          if (v12)
          {
            sub_2269B92D0();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v95 = 0u;
            long long v96 = 0u;
          }
          sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
          if (*((void *)&v97[1] + 1))
          {
            if (swift_dynamicCast())
            {
              if (v95) {
LABEL_68:
              }
                uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame;
              else {
LABEL_69:
              }
                uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide;
LABEL_70:
              uint64_t v37 = (void (**)(uint64_t))&v7[v9];
              swift_beginAccess();
              id v14 = *v37;
              if (*v37)
              {
                uint64_t v38 = swift_retain();
                v14(v38);
LABEL_72:
                sub_22696C20C((uint64_t)v14);
              }
            }
            goto LABEL_127;
          }
          goto LABEL_126;
        }
      }
      else
      {
        sub_22699947C((uint64_t)&v95);
      }
      memset(v97, 0, 32);
      goto LABEL_126;
    case 1044:
      uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated;
      goto LABEL_70;
    case 1052:
      id v13 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
      swift_beginAccess();
      id v14 = *v13;
      if (!*v13) {
        goto LABEL_127;
      }
      swift_retain();
      uint64_t v15 = 11;
      goto LABEL_31;
    case 1053:
      sub_226991670(a2, (uint64_t)v97);
      if (!*((void *)&v97[1] + 1)) {
        goto LABEL_126;
      }
      sub_226978330(0, &qword_2681494F0);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_127;
      }
      if (!*MEMORY[0x263F219E0])
      {
        __break(1u);
        goto LABEL_188;
      }
      uint64_t v16 = (void *)v95;
      id v17 = (id)*MEMORY[0x263F219E0];
      uint64_t v18 = sub_2269B8F30();
      uint64_t v20 = v19;

      *(void *)&v97[0] = v18;
      *((void *)&v97[0] + 1) = v20;
      swift_bridgeObjectRetain();
      id v21 = objc_msgSend((id)v95, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
      swift_unknownObjectRelease();
      if (!v21)
      {
        swift_bridgeObjectRelease();
        goto LABEL_134;
      }
      sub_2269B92D0();
      swift_unknownObjectRelease();
      sub_226982748(v97, &v95);
      swift_bridgeObjectRelease();
      __swift_project_boxed_opaque_existential_1(&v95, *((uint64_t *)&v96 + 1));
      id v22 = (const void *)sub_2269B94E0();
      CFTypeID v23 = CFGetTypeID(v22);
      swift_unknownObjectRelease();
      if (v23 != AXUIElementGetTypeID())
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v95);
LABEL_134:
        if (*MEMORY[0x263F219F0])
        {
          id v54 = (id)*MEMORY[0x263F219F0];
          uint64_t v55 = sub_2269B8F30();
          uint64_t v57 = v56;

          *(void *)&long long v95 = v55;
          *((void *)&v95 + 1) = v57;
          swift_bridgeObjectRetain();
          id v58 = objc_msgSend(v16, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
          swift_unknownObjectRelease();
          if (v58)
          {
            sub_2269B92D0();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v95 = 0u;
            long long v96 = 0u;
          }
          sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
          if (*((void *)&v97[1] + 1))
          {
            if ((swift_dynamicCast() & 1) == 0)
            {
LABEL_166:
              swift_bridgeObjectRelease();

              goto LABEL_127;
            }
            swift_bridgeObjectRelease();
            if (!*MEMORY[0x263F219E8])
            {
LABEL_190:
              __break(1u);
              JUMPOUT(0x2269986E4);
            }
            id v59 = (id)*MEMORY[0x263F219E8];
            uint64_t v60 = sub_2269B8F30();
            uint64_t v62 = v61;

            *(void *)&long long v95 = v60;
            *((void *)&v95 + 1) = v62;
            swift_bridgeObjectRetain();
            id v63 = objc_msgSend(v16, sel___swift_objectForKeyedSubscript_, sub_2269B9500());
            swift_unknownObjectRelease();
            if (v63)
            {
              sub_2269B92D0();
              swift_unknownObjectRelease();
            }
            else
            {
              long long v95 = 0u;
              long long v96 = 0u;
            }
            sub_2269994DC((uint64_t)&v95, (uint64_t)v97);
            if (*((void *)&v97[1] + 1))
            {
              if (swift_dynamicCast())
              {
                swift_bridgeObjectRelease();
                uint64_t v71 = (NSString *)sub_2269B8F00();
                swift_bridgeObjectRelease();
                CGRect v98 = CGRectFromString(v71);
                CGFloat x = v98.origin.x;
                CGFloat y = v98.origin.y;
                CGFloat width = v98.size.width;
                CGFloat height = v98.size.height;

                char v76 = (void (**)(_OWORD *))&v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange];
                swift_beginAccess();
                char v77 = *v76;
                if (*v76)
                {
                  v97[0] = v93;
                  *(CGFloat *)&v97[1] = x;
                  *((CGFloat *)&v97[1] + 1) = y;
                  *(CGFloat *)&v97[2] = width;
                  *((CGFloat *)&v97[2] + 1) = height;
                  LOBYTE(v97[3]) = 0x80;
                  swift_retain();
                  v77(v97);
                  sub_22696C20C((uint64_t)v77);
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              goto LABEL_166;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();

          goto LABEL_126;
        }
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
        goto LABEL_190;
      }
      sub_22696DB9C((uint64_t)&v95, (uint64_t)&v93);
      type metadata accessor for AXUIElementRef(0);
      swift_dynamicCast();
      id v24 = (id)_UIAXElementForAXUIElementRef();

      if (v24)
      {
        sub_2269B92D0();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v93 = 0u;
        long long v94 = 0u;
      }
      sub_2269994DC((uint64_t)&v93, (uint64_t)v97);
      if (*((void *)&v97[1] + 1))
      {
        sub_226978330(0, (unint64_t *)&unk_268149930);
        if (swift_dynamicCast())
        {
          long long v64 = (void (**)(_OWORD *))&v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange];
          swift_beginAccess();
          uint64_t v65 = *v64;
          if (!*v64)
          {
            id v82 = (id)v91;
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v95);
            swift_endAccess();

            goto LABEL_127;
          }
          swift_endAccess();
          *(void *)&v97[0] = v91;
          memset((char *)v97 + 8, 0, 41);
          id v66 = (id)v91;
          sub_22696C19C((uint64_t)v65);
          v65(v97);

          sub_22696C20C((uint64_t)v65);
        }
      }
      else
      {
        sub_22699947C((uint64_t)v97);
      }

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v95);
LABEL_127:
      unint64_t v52 = &v7[OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification];
      swift_beginAccess();
      uint64_t v53 = *(void (**)(uint64_t, uint64_t))v52;
      if (*(void *)v52)
      {
        swift_retain();
        v53(a1, a2);
        sub_22696C20C((uint64_t)v53);
      }

      return;
    case 1054:
      *(unsigned char *)(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_pasteOccurred) = 1;
      goto LABEL_127;
    case 1081:
      uint64_t v25 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged);
      swift_beginAccess();
      id v14 = *v25;
      if (!*v25) {
        goto LABEL_127;
      }
      swift_retain();
      uint64_t v15 = 8;
LABEL_31:
      ((void (*)(void, void, uint64_t, void))v14)(0, 0, v15, 0);
      goto LABEL_72;
    case 1082:
      uint64_t v26 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
      swift_beginAccess();
      id v14 = *v26;
      if (!*v26) {
        goto LABEL_127;
      }
      swift_retain();
      v14(1);
      goto LABEL_72;
    case 1083:
      uint64_t v27 = (void (**)(uint64_t))(v6 + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged);
      swift_beginAccess();
      id v14 = *v27;
      if (!*v27) {
        goto LABEL_127;
      }
      swift_retain();
      v14(0);
      goto LABEL_72;
    case 1084:
      goto LABEL_69;
    case 1085:
      goto LABEL_68;
    case 1086:
      uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode;
      goto LABEL_70;
    default:
      if (a1 != 5001) {
        goto LABEL_127;
      }
      uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange;
      goto LABEL_70;
  }
}

id AXRuntimeClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AXRuntimeClient.init()()
{
}

id AXRuntimeClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2269988FC()
{
  unint64_t result = qword_2681494E0;
  if (!qword_2681494E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681494E0);
  }
  return result;
}

id sub_226998954(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return result;
  }
  return result;
}

void destroy for AXRuntimeClientError(uint64_t a1)
{
}

void sub_226998978(id a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
}
  }

uint64_t _s11HoverTextUI20AXRuntimeClientErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_226998954(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AXRuntimeClientError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_226998954(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_226998978(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AXRuntimeClientError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_226998978(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AXRuntimeClientError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AXRuntimeClientError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_226998B18(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_226998B30(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXRuntimeClientError()
{
  return &type metadata for AXRuntimeClientError;
}

uint64_t destroy for FocusChangeInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FocusChangeInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FocusChangeInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithTake for FocusChangeInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for FocusChangeInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FocusChangeInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FocusChangeInfo()
{
  return &type metadata for FocusChangeInfo;
}

void destroy for FocusChange(uint64_t a1)
{
}

uint64_t initializeWithCopy for FocusChange(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_226976170(*(void **)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for FocusChange(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_226976170(*(void **)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void **)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_2269761FC(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for FocusChange(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_2269761FC(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for FocusChange(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 48) & 0x7E | (*(unsigned __int8 *)(a1 + 48) >> 7)) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FocusChange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 127;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)__n128 result = 0u;
      *(unsigned char *)(result + 48) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_226998F28(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48) >> 7;
}

uint64_t sub_226998F34(uint64_t result)
{
  *(unsigned char *)(result + 48) &= ~0x80u;
  return result;
}

uint64_t sub_226998F44(uint64_t result, char a2)
{
  *(unsigned char *)(result + 48) = *(unsigned char *)(result + 48) & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for FocusChange()
{
  return &type metadata for FocusChange;
}

uint64_t sub_2269990E4()
{
  return type metadata accessor for AXRuntimeClient();
}

uint64_t type metadata accessor for AXRuntimeClient()
{
  uint64_t result = qword_26AD58F88;
  if (!qword_26AD58F88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226999138()
{
  uint64_t result = sub_2269B8550();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

id sub_226999214(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  void aBlock[6] = *MEMORY[0x263EF8340];
  sub_226978330(0, &qword_2681494E8);
  char v11 = (void *)sub_2269B9000();
  swift_bridgeObjectRelease();
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22699939C;
  aBlock[3] = &block_descriptor_5;
  uint64_t v12 = _Block_copy(aBlock);
  id v17 = 0;
  id v13 = objc_msgSend(v6, sel_initWithSystemElement_runloop_notifications_handler_error_, a1, a2, v11, v12, &v17);
  _Block_release(v12);

  if (v13)
  {
    id v14 = v17;
  }
  else
  {
    id v15 = v17;
    sub_2269B83B0();

    swift_willThrow();
  }

  swift_release();
  return v13;
}

uint64_t sub_22699939C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, long long *))(a1 + 32);
  if (a3)
  {
    *((void *)&v8 + 1) = swift_getObjectType();
    *(void *)&long long v7 = a3;
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v5(a2, &v7);
  swift_release();
  return sub_22699947C((uint64_t)&v7);
}

uint64_t sub_226999424()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22699945C(uint64_t a1, uint64_t a2)
{
  sub_226997128(a1, a2, v2);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_22699947C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681493A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2269994DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681493A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226999550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2269A6050(a1, a2, a3, &qword_2681495B8);
}

uint64_t sub_22699955C(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2681495B8);
}

void sub_226999568()
{
}

void sub_226999590()
{
}

uint64_t sub_2269995AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2269A6050(a1, a2, a3, &qword_2681495C0);
}

uint64_t sub_2269995B8(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2681495C0);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_2269B8ED0();
}

void sub_226999608()
{
}

void sub_226999630()
{
}

void sub_22699964C()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  if (*(unsigned char *)(v0 + 258) == 1)
  {
    sub_2269997A4();
    swift_getKeyPath();
    sub_2269B84A0();
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    sub_2269B84A0();
    swift_release();
    sub_2269997A4();
  }
}

double sub_2269997A4()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  char v76 = v0;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double v6 = v0[31];
  long long v7 = self;
  id v8 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v77.origin.CGFloat x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, v1[4], v1[5]);
  double v17 = 0.0;
  if (CGRectGetWidth(v77) * 0.85 * 0.5 <= v6)
  {
    swift_getKeyPath();
    char v76 = v1;
    sub_2269B84A0();
    swift_release();
    uint64_t v18 = (char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    char v73 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    id v74 = v18;
    v73(v5, v18, v2);
    swift_getKeyPath();
    uint64_t v75 = v1;
    sub_2269B84A0();
    swift_release();
    uint64_t v71 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
    id v19 = *(id *)((char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_226968324(v19);
    double v21 = v20;

    char v72 = *(void (**)(char *, uint64_t))(v3 + 8);
    v72(v5, v2);
    double v22 = v21 + 2.0;
    id v23 = objc_msgSend(v7, sel_mainScreen);
    objc_msgSend(v23, sel_bounds);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    v78.origin.CGFloat x = UIEdgeInsetsInsetRect(v25, v27, v29, v31, v1[4], v1[5]);
    if (CGRectGetWidth(v78) * 0.85 < v22)
    {
      swift_getKeyPath();
      uint64_t v75 = v1;
      sub_2269B84A0();
      swift_release();
      double v70 = v1[31];
      id v32 = objc_msgSend(v7, sel_mainScreen);
      objc_msgSend(v32, sel_bounds);
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;

      v79.origin.CGFloat x = UIEdgeInsetsInsetRect(v34, v36, v38, v40, v1[4], v1[5]);
      double Width = CGRectGetWidth(v79);
      swift_getKeyPath();
      uint64_t v75 = v1;
      sub_2269B84A0();
      swift_release();
      v73(v5, v74, v2);
      swift_getKeyPath();
      uint64_t v75 = v1;
      sub_2269B84A0();
      swift_release();
      id v42 = *(id *)((char *)v1 + v71);
      sub_226968324(v42);
      double v44 = v43;

      v72(v5, v2);
      swift_getKeyPath();
      uint64_t v75 = v1;
      sub_2269B84A0();
      swift_release();
      double v45 = v44 + 2.0 - v1[31];
      id v46 = objc_msgSend(v7, sel_mainScreen);
      objc_msgSend(v46, sel_bounds);
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;

      v80.origin.CGFloat x = UIEdgeInsetsInsetRect(v48, v50, v52, v54, v1[4], v1[5]);
      if (v45 >= CGRectGetWidth(v80) * 0.85 * 0.5)
      {
        return v70 - Width * 0.85 * 0.5;
      }
      else
      {
        swift_getKeyPath();
        uint64_t v75 = v1;
        sub_2269B84A0();
        swift_release();
        v73(v5, v74, v2);
        swift_getKeyPath();
        uint64_t v75 = v1;
        sub_2269B84A0();
        swift_release();
        id v55 = *(id *)((char *)v1 + v71);
        sub_226968324(v55);
        double v57 = v56;

        v72(v5, v2);
        double v58 = v57 + 2.0;
        id v59 = objc_msgSend(v7, sel_mainScreen);
        objc_msgSend(v59, sel_bounds);
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;

        v81.origin.CGFloat x = UIEdgeInsetsInsetRect(v61, v63, v65, v67, v1[4], v1[5]);
        return v58 + CGRectGetWidth(v81) * -0.85;
      }
    }
  }
  return v17;
}

void sub_226999E2C(int a1, int a2, double a3, double a4)
{
  uint64_t v5 = v4;
  int v168 = a2;
  int v167 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149238);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v165 = (char *)&v141 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_2269B8E40();
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  unint64_t v160 = (char *)&v141 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_2269B8E70();
  uint64_t v161 = *(void *)(v162 - 8);
  MEMORY[0x270FA5388](v162);
  v159 = (char *)&v141 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148BC0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v158 = (char *)&v141 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  double v166 = (char *)&v141 - v15;
  uint64_t v16 = sub_2269B82E0();
  uint64_t v169 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v141 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149578);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  double v22 = (char *)&v141 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  double v24 = (char *)&v141 - v23;
  swift_getKeyPath();
  uint64_t v25 = v4 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t aBlock = v5;
  uint64_t v26 = sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v170 = v5;
  uint64_t v27 = v5 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  sub_22696B88C(v27, (uint64_t)v24, &qword_268149578);
  uint64_t v28 = type metadata accessor for HoverTextPresentationEvent();
  double v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48);
  if (v29(v24, 1, v28))
  {
    uint64_t v30 = (uint64_t)v24;
LABEL_5:
    sub_22696B8F0(v30, &qword_268149578);
    return;
  }
  int v156 = v18;
  uint64_t v157 = v16;
  uint64_t v31 = *(void *)&v24[*(int *)(v28 + 48)];
  sub_22696B8F0((uint64_t)v24, &qword_268149578);
  swift_getKeyPath();
  uint64_t aBlock = v170;
  sub_2269B84A0();
  swift_release();
  sub_22696B88C(v27, (uint64_t)v22, &qword_268149578);
  if (v29(v22, 1, v28))
  {
    uint64_t v30 = (uint64_t)v22;
    goto LABEL_5;
  }
  uint64_t v153 = v31;
  uint64_t v155 = v26;
  uint64_t v154 = v25;
  uint64_t v32 = v170;
  double v33 = *(void **)&v22[*(int *)(v28 + 52)];
  id v34 = v33;
  sub_22696B8F0((uint64_t)v22, &qword_268149578);
  if (v33)
  {
    swift_getKeyPath();
    uint64_t aBlock = v32;
    sub_2269B84A0();
    swift_release();
    uint64_t v35 = v32 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    uint64_t v36 = v169;
    double v37 = *(void (**)(char *, uint64_t, uint64_t))(v169 + 16);
    double v38 = v156;
    uint64_t v146 = v35;
    uint64_t v39 = v157;
    uint64_t v145 = v169 + 16;
    v144 = v37;
    v37(v156, v35, v157);
    swift_getKeyPath();
    uint64_t aBlock = v32;
    sub_2269B84A0();
    swift_release();
    uint64_t v149 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
    id v40 = *(id *)(v32 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_226968324(v40);

    uint64_t v150 = *(__n128 (**)(char *, uint64_t))(v36 + 8);
    __n128 v41 = v150(v38, v39);
    v41.n128_f64[0] = a3 - a4;
    v42.n128_u64[0] = 0;
    double v43 = CGRectMake(v41, v42);
    sub_2269A9214(v43, v44);
    uint64_t v152 = v46;
    double v47 = (void (*)(uint64_t, void, uint64_t, uint64_t))(v153 + v45);
    if (__OFADD__(v153, v45))
    {
      __break(1u);
    }
    else
    {
      uint64_t v48 = v45;
      swift_getKeyPath();
      uint64_t aBlock = v32;
      sub_2269B84A0();
      swift_release();
      char v49 = v168;
      char v50 = v167;
      if (*(unsigned char *)(v32 + 296))
      {
        if (!v48)
        {
LABEL_38:
          if (v50)
          {
LABEL_39:
            if (v49) {
              sub_2269A2C80(v48, v152);
            }
            uint64_t v135 = sub_2269B90A0();
            uint64_t v136 = (uint64_t)v165;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v135 - 8) + 56))(v165, 1, 1, v135);
            sub_2269B9080();
            swift_retain();
            uint64_t v137 = sub_2269B9070();
            uint64_t v138 = (void *)swift_allocObject();
            uint64_t v139 = MEMORY[0x263F8F500];
            v138[2] = v137;
            v138[3] = v139;
            v138[4] = v32;
            sub_226988F34(v136, (uint64_t)&unk_268149588, (uint64_t)v138);

            swift_release();
            return;
          }
LABEL_46:

          return;
        }
      }
      else if (v48 == *(void *)(v32 + 280))
      {
        goto LABEL_38;
      }
      id v151 = v34;
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      *(&v141 - 4) = (void (*)(uint64_t, void, uint64_t, uint64_t))v32;
      *(&v141 - 3) = v47;
      v143 = v47;
      *(&v141 - 2) = 0;
      *((unsigned char *)&v141 - 8) = 0;
      uint64_t aBlock = v32;
      sub_2269B8490();
      id v142 = 0;
      swift_release();
      swift_getKeyPath();
      uint64_t aBlock = v32;
      sub_2269B84A0();
      swift_release();
      uint64_t v148 = v48;
      uint64_t v52 = v48 + v152;
      if (!__OFADD__(v48, v152))
      {
        swift_retain();
        id v34 = v151;
        id v53 = objc_msgSend(v151, sel_ax_wordFromPosition_inDirection_, v52, 1);
        uint64_t v55 = v54;
        swift_release();
        id v56 = objc_msgSend(v34, sel_substringWithRange_, v53, v55);
        unsigned __int8 v57 = objc_msgSend(v56, sel_hasAttribute_, *MEMORY[0x263F217E0]);
        char v49 = v168;
        id v147 = v56;
        if (v57)
        {
          uint64_t v58 = (uint64_t)v166;
          if (v168)
          {
LABEL_21:
            swift_getKeyPath();
            uint64_t aBlock = v32;
            sub_2269B84A0();
            swift_release();
            swift_retain();
            sub_2269B8DB0();
            sub_2269B8730();
            swift_release();
            swift_release();
            uint64_t v66 = swift_allocObject();
            *(void *)(v66 + 16) = v143;
            *(void *)(v66 + 24) = 0;
            uint64_t v176 = sub_2269A9CDC;
            uint64_t v177 = v66;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v173 = 1107296256;
            v174 = sub_226982998;
            CGRect v175 = &block_descriptor_6;
            double v67 = _Block_copy(&aBlock);
            uint64_t v68 = v159;
            sub_2269B8E50();
            uint64_t v171 = MEMORY[0x263F8EE78];
            sub_2269AC3E4(&qword_268149128, MEMORY[0x263F8F030]);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
            sub_22696B7B8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
            uint64_t v69 = v160;
            uint64_t v70 = v164;
            sub_2269B92F0();
            MEMORY[0x22A65CBA0](0, v68, v69, v67);
            uint64_t v71 = v67;
            id v34 = v151;
            _Block_release(v71);

            (*(void (**)(char *, uint64_t))(v163 + 8))(v69, v70);
            (*(void (**)(char *, uint64_t))(v161 + 8))(v68, v162);
            swift_release();
            uint64_t v48 = v148;
LABEL_37:
            char v50 = v167;
            goto LABEL_38;
          }
        }
        else
        {
          unsigned int v59 = objc_msgSend(v56, sel_hasAttribute_, *MEMORY[0x263F21850]);
          uint64_t v58 = (uint64_t)v166;
          if (!v59 || (v49 & 1) != 0) {
            goto LABEL_21;
          }
        }
        id v60 = v147;
        id v61 = objc_msgSend(v60, sel_attributedString);
        sub_2269B8330();
        id v147 = v60;

        uint64_t v62 = v169;
        double v63 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v169 + 56);
        uint64_t v64 = v157;
        v63(v58, 0, 1, v157);
        id v142 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
        LODWORD(v166) = v142(v58, 1, v64);
        uint64_t v169 = v62 + 48;
        if (v166 == 1)
        {
          sub_22696B8F0(v58, &qword_268148BC0);
          uint64_t v65 = 0;
        }
        else
        {
          swift_getKeyPath();
          uint64_t v141 = v63;
          uint64_t v72 = v58;
          uint64_t aBlock = v32;
          sub_2269B84A0();
          swift_release();
          id v73 = *(id *)(v32 + v149);
          sub_226968324(v73);
          uint64_t v65 = v74;

          uint64_t v75 = v72;
          double v63 = v141;
          v150((char *)v75, v64);
        }
        uint64_t v48 = v148;
        id v76 = objc_msgSend(v34, sel_substringWithRange_, 0, v53);
        if (v76)
        {
          CGRect v77 = v76;
          id v78 = objc_msgSend(v76, sel_attributedString);
          uint64_t v79 = (uint64_t)v158;
          sub_2269B8330();

          uint64_t v80 = v157;
          v63(v79, 0, 1, v157);
          uint64_t v81 = v80;
          if (v142(v79, 1, v80) != 1)
          {
            swift_getKeyPath();
            uint64_t v82 = v79;
            uint64_t aBlock = v32;
            sub_2269B84A0();
            swift_release();
            id v83 = *(id *)(v32 + v149);
            sub_226968324(v83);
            double v85 = v84;

            v150((char *)v82, v81);
            if (v166 != 1)
            {
              swift_getKeyPath();
              uint64_t aBlock = v32;
              sub_2269B84A0();
              swift_release();
              uint64_t v86 = v153;
              uint64_t v87 = (uint64_t)v143 - v153;
              if (!__OFSUB__(v143, v153))
              {
                swift_retain();
                id v88 = objc_msgSend(v34, sel_ax_wordFromPosition_inDirection_, v87, 1);
                BOOL v90 = __OFADD__(v88, v86);
                uint64_t v91 = (uint64_t)v88 + v86;
                uint64_t v92 = v146;
                if (!v90)
                {
                  uint64_t v93 = v89;
                  swift_release();
                  double v166 = (char *)v91;
                  uint64_t v169 = v93;
                  sub_2269A2C80(v91, v93);
                  swift_getKeyPath();
                  uint64_t aBlock = v32;
                  sub_2269B84A0();
                  swift_release();
                  long long v94 = v156;
                  v144(v156, v92, v81);
                  swift_getKeyPath();
                  uint64_t aBlock = v32;
                  sub_2269B84A0();
                  swift_release();
                  id v95 = *(id *)(v32 + v149);
                  sub_226968324(v95);
                  double v97 = v96;

                  v150(v94, v81);
                  double v98 = v97 + 2.0;
                  uint64_t v99 = self;
                  id v100 = objc_msgSend(v99, sel_mainScreen);
                  objc_msgSend(v100, sel_bounds);
                  double v102 = v101;
                  double v104 = v103;
                  double v106 = v105;
                  double v108 = v107;

                  v178.origin.CGFloat x = UIEdgeInsetsInsetRect(v102, v104, v106, v108, *(double *)(v32 + 32), *(double *)(v32 + 40));
                  if (CGRectGetWidth(v178) * 0.85 < v98)
                  {
                    id v109 = objc_msgSend(v99, sel_mainScreen);
                    objc_msgSend(v109, sel_bounds);
                    double v111 = v110;
                    double v113 = v112;
                    double v115 = v114;
                    double v117 = v116;

                    v179.origin.CGFloat x = UIEdgeInsetsInsetRect(v111, v113, v115, v117, *(double *)(v32 + 32), *(double *)(v32 + 40));
                    CGFloat v118 = CGRectGetWidth(v179) * 0.85;
                    swift_getKeyPath();
                    uint64_t aBlock = v32;
                    sub_2269B84A0();
                    swift_release();
                    uint64_t v119 = v157;
                    v144(v94, v146, v157);
                    swift_getKeyPath();
                    uint64_t aBlock = v32;
                    sub_2269B84A0();
                    swift_release();
                    id v120 = *(id *)(v32 + v149);
                    sub_226968324(v120);
                    double v122 = v121;

                    v150(v94, v119);
                    double v85 = sub_2269997A4() + v118 - (v122 + 2.0 - v85);
                  }
                  id v123 = objc_msgSend(self, sel_primaryApp);
                  if (v123)
                  {
                    uint64_t v124 = v123;
                    id v125 = objc_msgSend(v123, sel_firstResponder);

                    uint64_t v48 = v148;
                    if (v125
                      && (id v126 = objc_msgSend(v125, sel_uiElement),
                          v125,
                          v126))
                    {
                      uint64_t v127 = swift_allocObject();
                      uint64_t v128 = v166;
                      *(void *)(v127 + 16) = v126;
                      *(void *)(v127 + 24) = v128;
                      *(void *)(v127 + 32) = v169;
                      *(void *)(v127 + 40) = v32;
                      *(void *)(v127 + 48) = v65;
                      *(double *)(v127 + 56) = v85;
                      uint64_t v176 = sub_2269A9FFC;
                      uint64_t v177 = v127;
                      uint64_t aBlock = MEMORY[0x263EF8330];
                      uint64_t v173 = 1107296256;
                      v174 = sub_226982998;
                      CGRect v175 = &block_descriptor_267;
                      uint64_t v129 = _Block_copy(&aBlock);
                      id v130 = v126;
                      swift_retain();
                      uint64_t v131 = v159;
                      sub_2269B8E50();
                      uint64_t v171 = MEMORY[0x263F8EE78];
                      sub_2269AC3E4(&qword_268149128, MEMORY[0x263F8F030]);
                      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
                      sub_22696B7B8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
                      uint64_t v132 = v160;
                      uint64_t v133 = v164;
                      sub_2269B92F0();
                      MEMORY[0x22A65CBA0](0, v131, v132, v129);
                      id v134 = v129;
                      uint64_t v48 = v148;
                      _Block_release(v134);

                      id v34 = v151;
                      (*(void (**)(char *, uint64_t))(v163 + 8))(v132, v133);
                      (*(void (**)(char *, uint64_t))(v161 + 8))(v131, v162);
                      swift_release();
                    }
                    else
                    {
                    }
                    char v140 = v167;
                  }
                  else
                  {

                    char v140 = v167;
                    uint64_t v48 = v148;
                  }
                  char v49 = v168;
                  if (v140) {
                    goto LABEL_39;
                  }
                  goto LABEL_46;
                }
LABEL_50:
                __break(1u);
                return;
              }
LABEL_49:
              __break(1u);
              goto LABEL_50;
            }
LABEL_36:

            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v79 = (uint64_t)v158;
          v63((uint64_t)v158, 1, 1, v157);
        }
        sub_22696B8F0(v79, &qword_268148BC0);
        goto LABEL_36;
      }
    }
    __break(1u);
    goto LABEL_49;
  }
}

void sub_22699B308()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  if (*(unsigned char *)(v0 + 258) == 1)
  {
    sub_2269A89FC();
    swift_getKeyPath();
    sub_2269B84A0();
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    sub_2269B84A0();
    swift_release();
    sub_2269A89FC();
  }
}

void sub_22699B460()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2269B82E0();
  uint64_t v75 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v78 = v0;
  char v79 = 1;
  uint64_t aBlock = v0;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  swift_release();
  sub_2269B8600();
  uint64_t v6 = v5;
  swift_getKeyPath();
  uint64_t v76 = v0;
  uint64_t v77 = v6;
  uint64_t aBlock = v0;
  sub_2269B8490();
  uint64_t v74 = 0;
  swift_release();
  long long v7 = self;
  id v8 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v86.origin.CGFloat x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, *(double *)(v1 + 32), *(double *)(v1 + 40));
  double v17 = 35.0 - CGRectGetWidth(v86) * 0.85 * 0.5;
  id v18 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v18, sel_bounds);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  v87.origin.CGFloat x = UIEdgeInsetsInsetRect(v20, v22, v24, v26, *(double *)(v1 + 32), *(double *)(v1 + 40));
  double Width = CGRectGetWidth(v87);
  sub_2269B8610();
  if (v28 < v17)
  {
    swift_getKeyPath();
    uint64_t aBlock = v1;
    sub_2269B84A0();
    swift_release();
    uint64_t v29 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    uint64_t v30 = v2;
    uint64_t v31 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v4, v29, v30);
    swift_getKeyPath();
    uint64_t aBlock = v1;
    sub_2269B84A0();
    swift_release();
    id v32 = *(id *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_226968324(v32);
    double v34 = v33;

    uint64_t v35 = v31;
    uint64_t v2 = v30;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v4, v30);
    double v36 = v34 + 2.0;
    id v37 = objc_msgSend(v7, sel_mainScreen);
    objc_msgSend(v37, sel_bounds);
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;

    v88.origin.CGFloat x = UIEdgeInsetsInsetRect(v39, v41, v43, v45, *(double *)(v1 + 32), *(double *)(v1 + 40));
    if (CGRectGetWidth(v88) * 0.85 < v36)
    {
      swift_getKeyPath();
      uint64_t aBlock = v1;
      sub_2269B84A0();
      swift_release();
      if (*(void *)(v1 + 320)) {
        return;
      }
      uint64_t v46 = self;
      uint64_t v47 = swift_allocObject();
      swift_weakInit();
      double v84 = sub_2269AC46C;
      uint64_t v85 = v47;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v81 = 1107296256;
      uint64_t v82 = sub_22696BC4C;
      id v83 = &block_descriptor_470;
      uint64_t v48 = _Block_copy(&aBlock);
      swift_release();
      id v49 = objc_msgSend(v46, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v48, 0.025);
      _Block_release(v48);
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      *(&v74 - 2) = v1;
      *(&v74 - 1) = (uint64_t)v49;
      uint64_t aBlock = v1;
LABEL_9:
      sub_2269B8490();
      swift_release();

      return;
    }
  }
  uint64_t v51 = v75;
  sub_2269B8610();
  if (Width * 0.85 * 0.5 + -35.0 < v52)
  {
    swift_getKeyPath();
    uint64_t aBlock = v1;
    sub_2269B84A0();
    swift_release();
    uint64_t v53 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v4, v53, v2);
    swift_getKeyPath();
    uint64_t aBlock = v1;
    sub_2269B84A0();
    swift_release();
    id v54 = *(id *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_226968324(v54);
    double v56 = v55;

    (*(void (**)(char *, uint64_t))(v51 + 8))(v4, v2);
    double v57 = v56 + 2.0;
    id v58 = objc_msgSend(v7, sel_mainScreen);
    objc_msgSend(v58, sel_bounds);
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;

    v89.origin.CGFloat x = UIEdgeInsetsInsetRect(v60, v62, v64, v66, *(double *)(v1 + 32), *(double *)(v1 + 40));
    if (CGRectGetWidth(v89) * 0.85 < v57)
    {
      swift_getKeyPath();
      uint64_t aBlock = v1;
      sub_2269B84A0();
      swift_release();
      if (*(void *)(v1 + 320)) {
        return;
      }
      double v67 = self;
      uint64_t v68 = swift_allocObject();
      swift_weakInit();
      double v84 = sub_2269AC464;
      uint64_t v85 = v68;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v81 = 1107296256;
      uint64_t v82 = sub_22696BC4C;
      id v83 = &block_descriptor_465;
      uint64_t v69 = _Block_copy(&aBlock);
      swift_release();
      id v49 = objc_msgSend(v67, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v69, 0.025);
      _Block_release(v69);
      uint64_t v70 = swift_getKeyPath();
      MEMORY[0x270FA5388](v70);
      *(&v74 - 2) = v1;
      *(&v74 - 1) = (uint64_t)v49;
      uint64_t aBlock = v1;
      goto LABEL_9;
    }
  }
  swift_getKeyPath();
  uint64_t aBlock = v1;
  sub_2269B84A0();
  swift_release();
  objc_msgSend(*(id *)(v1 + 320), sel_invalidate);
  uint64_t v71 = swift_getKeyPath();
  MEMORY[0x270FA5388](v71);
  *(&v74 - 2) = v1;
  *(&v74 - 1) = 0;
  uint64_t aBlock = v1;
  sub_2269B8490();
  swift_release();
  sub_2269AA5FC();
  double v73 = v72;
  swift_getKeyPath();
  uint64_t aBlock = v1;
  sub_2269B84A0();
  swift_release();
  sub_226999E2C(0, 1, v73, *(double *)(v1 + 264));
}

uint64_t sub_22699BE88()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  swift_release();
  swift_getKeyPath();
  sub_2269B84A0();
  swift_release();
  objc_msgSend(*(id *)(v0 + 320), sel_invalidate);
  swift_getKeyPath();
  sub_2269B8490();
  swift_release();
  sub_2269AA5FC();
  double v2 = v1;
  swift_getKeyPath();
  sub_2269B84A0();
  swift_release();
  sub_226999E2C(1, 1, v2, *(double *)(v0 + 264));
  swift_getKeyPath();
  sub_2269B8490();
  swift_release();
  swift_getKeyPath();
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_22699C0F0()
{
  return swift_retain();
}

uint64_t sub_22699C194@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  *a2 = *(void *)(v3 + 96);
  return swift_retain();
}

uint64_t sub_22699C240()
{
  return sub_22699C3D0();
}

uint64_t sub_22699C260()
{
  return swift_retain();
}

uint64_t sub_22699C304@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  *a2 = *(void *)(v3 + 104);
  return swift_retain();
}

uint64_t sub_22699C3B0()
{
  return sub_22699C3D0();
}

uint64_t sub_22699C3D0()
{
  return swift_release();
}

uint64_t sub_22699C4A8()
{
  return swift_retain();
}

uint64_t sub_22699C54C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  *a2 = *(void *)(v3 + 112);
  return swift_retain();
}

uint64_t sub_22699C5F8()
{
  return swift_retain();
}

uint64_t sub_22699C69C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  *a2 = *(void *)(v3 + 120);
  return swift_retain();
}

double sub_22699C748()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 128);
}

double sub_22699C7E8@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double result = *(double *)(v3 + 128);
  *a2 = result;
  return result;
}

uint64_t sub_22699C890()
{
  return sub_22699CA18();
}

double sub_22699C8B0()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 136);
}

double sub_22699C950@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double result = *(double *)(v3 + 136);
  *a2 = result;
  return result;
}

uint64_t sub_22699C9F8()
{
  return sub_22699CA18();
}

uint64_t sub_22699CA18()
{
  return swift_release();
}

uint64_t sub_22699CAE0()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t sub_22699CB80@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 144);
  return result;
}

uint64_t sub_22699CC28()
{
  return sub_22699D32C();
}

double sub_22699CC48()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 152);
}

__n128 sub_22699CCEC@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  __n128 result = *(__n128 *)(v3 + 152);
  long long v5 = *(_OWORD *)(v3 + 168);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_22699CD98()
{
  return sub_22699CFC4();
}

double *sub_22699CDB8(double *result, double a2, double a3, double a4, double a5)
{
  result[19] = a2;
  result[20] = a3;
  result[21] = a4;
  result[22] = a5;
  return result;
}

double sub_22699CDC4()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 184);
}

double *sub_22699CE68(double *result, double a2, double a3, double a4, double a5)
{
  result[23] = a2;
  result[24] = a3;
  result[25] = a4;
  result[26] = a5;
  return result;
}

double sub_22699CE74()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 216);
}

__n128 sub_22699CF18@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  __n128 result = *(__n128 *)(v3 + 216);
  long long v5 = *(_OWORD *)(v3 + 232);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_22699CFC4()
{
  return swift_release();
}

double sub_22699D09C()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 248);
}

double sub_22699D13C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double result = *(double *)(v3 + 248);
  *a2 = result;
  return result;
}

uint64_t sub_22699D1E4()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 256);
}

uint64_t sub_22699D284@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 256);
  return result;
}

uint64_t sub_22699D32C()
{
  return swift_release();
}

uint64_t sub_22699D3EC()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 257);
}

uint64_t sub_22699D48C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 257);
  return result;
}

uint64_t sub_22699D534()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 258);
}

uint64_t sub_22699D5D4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 258);
  return result;
}

double sub_22699D67C()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 264);
}

double sub_22699D71C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double result = *(double *)(v3 + 264);
  *a2 = result;
  return result;
}

double sub_22699D7C4()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + 272);
}

double sub_22699D864@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double result = *(double *)(v3 + 272);
  *a2 = result;
  return result;
}

uint64_t sub_22699D90C()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v0 + 280);
}

__n128 sub_22699D9B4@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + 280);
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

void *sub_22699DA70()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  double v1 = *(void **)(v0 + 320);
  id v2 = v1;
  return v1;
}

id sub_22699DB18@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  unsigned __int8 v4 = *(void **)(v3 + 320);
  *a2 = v4;

  return v4;
}

void sub_22699DBD0(void **a1)
{
  double v1 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  id v2 = v1;
  sub_2269B8490();
  swift_release();
}

uint64_t sub_22699DCAC()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v0 + 344);
}

__n128 sub_22699DD54@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + 344);
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_22699DE10()
{
  return swift_release();
}

uint64_t sub_22699DEE0@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  return sub_22696B88C(v3, a1, &qword_268149578);
}

uint64_t sub_22699DFB4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  return sub_22696B88C(v4, a2, &qword_268149578);
}

uint64_t sub_22699E088(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149578);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22696B88C(a1, (uint64_t)v6, &qword_268149578);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  double v11 = v6;
  uint64_t v12 = v7;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  swift_release();
  return sub_22696B8F0((uint64_t)v6, &qword_268149578);
}

uint64_t sub_22699E1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  swift_beginAccess();
  sub_2269AB91C(a2, v3);
  return swift_endAccess();
}

uint64_t sub_22699E234()
{
  return sub_22699EE94((uint64_t)&unk_2269BC2F0, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL);
}

uint64_t sub_22699E248(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) = a2;
  return result;
}

uint64_t sub_22699E258()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22699E314@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22699E3CC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22699E4B0()
{
  return sub_22699E50C();
}

uint64_t sub_22699E4C4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_22699E5C4(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor, a2);
}

uint64_t sub_22699E4D8()
{
  return sub_22699C3D0();
}

uint64_t sub_22699E4F8()
{
  return sub_22699E50C();
}

uint64_t sub_22699E50C()
{
  return swift_retain();
}

uint64_t sub_22699E5B0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_22699E5C4(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor, a2);
}

uint64_t sub_22699E5C4@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  *a3 = *(void *)(v5 + *a2);
  return swift_retain();
}

uint64_t sub_22699E67C()
{
  return sub_22699C3D0();
}

uint64_t sub_22699E69C()
{
  return sub_22699E50C();
}

uint64_t sub_22699E6B0()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode);
}

uint64_t sub_22699E758@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode);
  return result;
}

uint64_t sub_22699E808()
{
  return swift_release();
}

uint64_t sub_22699E8D4@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  uint64_t v4 = sub_2269B82E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_22699E9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  uint64_t v4 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

id sub_22699EA6C()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);

  return v1;
}

void sub_22699EB24(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  *(void *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont) = a2;
  id v3 = a2;
}

double sub_22699EB60()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
}

__n128 sub_22699EC10@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  __n128 result = *(__n128 *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
  long long v5 = *(_OWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect + 16);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_22699ECC4(char a1)
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) & 1) == 0 && (a1)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_2269B8490();
    swift_release();
    uint64_t v5 = swift_getKeyPath();
    MEMORY[0x270FA5388](v5);
    sub_2269B8490();
    return swift_release();
  }
  return result;
}

uint64_t sub_22699EE80()
{
  return sub_22699EE94((uint64_t)&unk_2269BC250, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible);
}

uint64_t sub_22699EE94(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_22699EF34@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible);
  return result;
}

uint64_t sub_22699EFE4()
{
  uint64_t v1 = sub_2269B82E0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2269B95E0();
  swift_getKeyPath();
  *(void *)&long long v13 = v0;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v5 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_2269B82C0();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  sub_2269B9590();
  long long v15 = v10;
  long long v16 = v11;
  uint64_t v17 = v12;
  long long v13 = v8;
  long long v14 = v9;
  return sub_2269B95C0();
}

uint64_t sub_22699F1A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v89 = a1;
  uint64_t v90 = a2;
  uint64_t v4 = sub_2269B82E0();
  uint64_t v87 = *(void *)(v4 - 8);
  uint64_t v88 = v4;
  MEMORY[0x270FA5388](v4);
  CGRect v86 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_2269B91C0();
  uint64_t v83 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  double v84 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2269B9170();
  MEMORY[0x270FA5388](v7);
  uint64_t v82 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B8E70();
  MEMORY[0x270FA5388](v9 - 8);
  type metadata accessor for HoverTypingTextReplacementModel();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = 0x65676E6172;
  *(void *)(v10 + 40) = 0xE500000000000000;
  *(void *)(v10 + 48) = 0x6D6563616C706572;
  *(void *)(v10 + 56) = 0xEB00000000746E65;
  swift_retain();
  sub_2269B84D0();
  *(void *)(v2 + 96) = v10;
  long long v11 = self;
  id v12 = objc_msgSend(v11, sel_sharedInstance);
  id v13 = objc_msgSend(v12, sel_hoverTextTypingInsertionPointColorData);

  if (v13)
  {
    uint64_t v14 = sub_2269B83E0();
    unint64_t v16 = v15;

    uint64_t v17 = (void *)sub_2269B83D0();
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v14 = 0;
    unint64_t v16 = 0xF000000000000000;
  }
  id v18 = self;
  id v19 = objc_msgSend(v18, sel_makeFromData_, v17);

  if (v19)
  {
    uint64_t v20 = MEMORY[0x22A65C500](objc_msgSend(v19, sel_color));
  }
  else
  {
    uint64_t v20 = sub_2269B8BB0();
  }
  sub_226967370(v14, v16);
  *(void *)(v2 + 104) = v20;
  id v21 = objc_msgSend(v11, sel_sharedInstance);
  id v22 = objc_msgSend(v21, sel_hoverTextTypingMisspelledTextColorData);

  if (v22)
  {
    uint64_t v23 = sub_2269B83E0();
    unint64_t v25 = v24;

    id v22 = (id)sub_2269B83D0();
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v25 = 0xF000000000000000;
  }
  id v26 = objc_msgSend(v18, sel_makeFromData_, v22);

  if (v26)
  {
    uint64_t v27 = MEMORY[0x22A65C500](objc_msgSend(v26, sel_color));
  }
  else
  {
    uint64_t v27 = sub_2269B8B50();
  }
  sub_226967370(v23, v25);
  *(void *)(v2 + 112) = v27;
  id v28 = objc_msgSend(v11, sel_sharedInstance);
  id v29 = objc_msgSend(v28, sel_hoverTextTypingAutocorrectedTextColorData);

  if (v29)
  {
    uint64_t v30 = sub_2269B83E0();
    unint64_t v32 = v31;

    id v29 = (id)sub_2269B83D0();
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v32 = 0xF000000000000000;
  }
  id v33 = objc_msgSend(v18, sel_makeFromData_, v29);

  if (v33)
  {
    uint64_t v34 = MEMORY[0x22A65C500](objc_msgSend(v33, sel_color));
  }
  else
  {
    uint64_t v34 = sub_2269B8B60();
  }
  sub_226967370(v30, v32);
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 136) = 0;
  *(void *)(v2 + 120) = v34;
  *(unsigned char *)(v2 + 144) = 0;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 243) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  *(_OWORD *)(v2 + 280) = 0u;
  *(unsigned char *)(v2 + 296) = 1;
  *(_OWORD *)(v2 + 304) = xmmword_2269BC020;
  *(void *)(v2 + 320) = 0;
  *(void *)(v2 + 328) = 0x4041800000000000;
  *(void *)(v2 + 344) = 0;
  *(void *)(v2 + 352) = 0;
  *(unsigned char *)(v2 + 360) = 1;
  uint64_t v35 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent;
  *(void *)(v2 + 336) = 0x3F9999999999999ALL;
  uint64_t v36 = type metadata accessor for HoverTextPresentationEvent();
  id v37 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56);
  v37(v35, 1, 1, v36);
  v37(v35, 1, 1, v36);
  uint64_t v38 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore_elementAttributeQueue;
  sub_226978330(0, (unint64_t *)&qword_268149200);
  sub_2269B8E60();
  uint64_t v91 = MEMORY[0x263F8EE78];
  sub_2269AC3E4((unint64_t *)&unk_268149950, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681495C8);
  sub_22696B7B8((unint64_t *)&unk_268149960, &qword_2681495C8);
  sub_2269B92F0();
  (*(void (**)(char *, void, uint64_t))(v83 + 104))(v84, *MEMORY[0x263F8F130], v85);
  *(void *)(v2 + v38) = sub_2269B91F0();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) = 0;
  id v39 = objc_msgSend(v11, sel_sharedInstance);
  id v40 = objc_msgSend(v39, sel_hoverTextTypingTextColorData);

  if (v40)
  {
    uint64_t v41 = sub_2269B83E0();
    unint64_t v43 = v42;

    id v40 = (id)sub_2269B83D0();
  }
  else
  {
    uint64_t v41 = 0;
    unint64_t v43 = 0xF000000000000000;
  }
  id v44 = objc_msgSend(v18, sel_makeFromData_, v40);

  if (v44)
  {
    uint64_t v45 = MEMORY[0x22A65C500](objc_msgSend(v44, sel_color));
  }
  else
  {
    uint64_t v45 = sub_2269B8BB0();
  }
  sub_226967370(v41, v43);
  *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor) = v45;
  id v46 = objc_msgSend(v11, sel_sharedInstance);
  id v47 = objc_msgSend(v46, sel_hoverTextTypingBorderColorData);

  if (v47)
  {
    uint64_t v48 = sub_2269B83E0();
    unint64_t v50 = v49;

    id v47 = (id)sub_2269B83D0();
  }
  else
  {
    uint64_t v48 = 0;
    unint64_t v50 = 0xF000000000000000;
  }
  id v51 = objc_msgSend(v18, sel_makeFromData_, v47);

  if (v51)
  {
    uint64_t v52 = MEMORY[0x22A65C500](objc_msgSend(v51, sel_color));
  }
  else
  {
    uint64_t v52 = sub_2269B8BB0();
  }
  sub_226967370(v48, v50);
  *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor) = v52;
  id v53 = objc_msgSend(v11, sel_sharedInstance);
  id v54 = objc_msgSend(v53, sel_hoverTextTypingBackgroundColorData);

  if (v54)
  {
    uint64_t v55 = sub_2269B83E0();
    unint64_t v57 = v56;

    id v54 = (id)sub_2269B83D0();
  }
  else
  {
    uint64_t v55 = 0;
    unint64_t v57 = 0xF000000000000000;
  }
  id v58 = objc_msgSend(v18, sel_makeFromData_, v54);

  if (v58)
  {
    uint64_t v59 = MEMORY[0x22A65C500](objc_msgSend(v58, sel_color));
  }
  else
  {
    id v60 = objc_msgSend(self, sel_systemBackgroundColor);
    MEMORY[0x22A65C580](v60);
    id v61 = objc_msgSend(v11, sel_sharedInstance);
    objc_msgSend(v61, sel_hoverTextBackgroundOpacity);

    uint64_t v59 = sub_2269B8BA0();
    swift_release();
  }
  sub_226967370(v55, v57);
  *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__backgroundColor) = v59;
  id v62 = objc_msgSend(v11, sel_sharedInstance);
  id v63 = objc_msgSend(v62, sel_hoverTextTypingDisplayMode);

  *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode) = v63;
  double v64 = v86;
  sub_2269B8250();
  (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText, v64, v88);
  id v65 = objc_msgSend(self, sel_systemFontOfSize_, 10.0);
  *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont) = v65;
  double v66 = (_OWORD *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
  *double v66 = 0u;
  v66[1] = 0u;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) = 0;
  sub_2269B84D0();
  double v67 = (void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  uint64_t v68 = v90;
  void *v67 = v89;
  v67[1] = v68;
  swift_release();
  uint64_t v69 = sub_22697A0B8();
  swift_retain();
  sub_22699FF78();
  sub_2269A0860();
  sub_2269A10E0();
  uint64_t v70 = (void *)*MEMORY[0x263F8B238];
  swift_retain();
  sub_22697A574(v70, (uint64_t)sub_2269620D8, 0);
  swift_release();
  uint64_t v71 = (void *)*MEMORY[0x263F8B280];
  swift_retain();
  sub_22697A574(v71, (uint64_t)sub_22699FF28, 0);
  swift_release();
  double v72 = (void *)*MEMORY[0x263F8B290];
  swift_retain();
  sub_22697A574(v72, (uint64_t)sub_22699FF30, 0);
  swift_release();
  double v73 = (void *)*MEMORY[0x263F8B2A8];
  swift_retain();
  sub_22697A574(v73, (uint64_t)sub_22699FF38, 0);
  swift_release();
  uint64_t v74 = (void *)*MEMORY[0x263F8B270];
  swift_retain();
  sub_22697A574(v74, (uint64_t)sub_22699FF40, 0);
  swift_release();
  uint64_t v75 = (void *)*MEMORY[0x263F8B278];
  swift_retain();
  sub_22697A574(v75, (uint64_t)sub_22699FF48, 0);
  swift_release();
  uint64_t v76 = (void *)*MEMORY[0x263F8B298];
  swift_retain();
  sub_22697A574(v76, (uint64_t)sub_22699FF50, 0);
  swift_release();
  uint64_t v77 = (void *)*MEMORY[0x263F8B2B0];
  swift_retain();
  sub_22697A574(v77, (uint64_t)sub_22699FF58, 0);
  swift_release();
  uint64_t v78 = (void *)*MEMORY[0x263F8B2A0];
  swift_retain();
  sub_22697A574(v78, (uint64_t)sub_22699FF60, 0);
  swift_release();
  char v79 = (void *)*MEMORY[0x263F8B268];
  swift_retain();
  sub_22697A574(v79, (uint64_t)sub_22699FF68, 0);
  swift_release();
  uint64_t v80 = (void *)*MEMORY[0x263F8B360];
  swift_retain();
  sub_22697A574(v80, (uint64_t)sub_22699FF70, 0);
  swift_release_n();
  return v69;
}

uint64_t sub_22699FF28()
{
  return sub_226962110();
}

uint64_t sub_22699FF30()
{
  return sub_226962110();
}

uint64_t sub_22699FF38()
{
  return sub_226962110();
}

uint64_t sub_22699FF40()
{
  return sub_226962110();
}

uint64_t sub_22699FF48()
{
  return sub_226962110();
}

uint64_t sub_22699FF50()
{
  return sub_226962110();
}

uint64_t sub_22699FF58()
{
  return sub_226962110();
}

uint64_t sub_22699FF60()
{
  return sub_226962110();
}

uint64_t sub_22699FF68()
{
  return sub_226962110();
}

uint64_t sub_22699FF70()
{
  return sub_226962110();
}

uint64_t sub_22699FF78()
{
  return sub_2269A0880((uint64_t)sub_2269AC2F0, (uint64_t)&block_descriptor_438);
}

uint64_t sub_22699FF98(uint64_t a1)
{
  uint64_t v2 = sub_2269B8550();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)aBlock - v8;
  MEMORY[0x270FA5388](v7);
  long long v11 = (char *)aBlock - v10;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  id v12 = objc_msgSend(self, sel_primaryApp);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_msgSend(v12, sel_uiElement);
    if (v14)
    {
      unint64_t v15 = v14;
      id v16 = objc_msgSend(v14, sel_stringWithAXAttribute_, 3019);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = sub_2269B8F30();
        uint64_t v20 = v19;

        id v21 = (void *)swift_allocObject();
        v21[2] = v18;
        v21[3] = v20;
        void v21[4] = a1;
        aBlock[4] = sub_2269AC338;
        aBlock[5] = v21;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_226982998;
        aBlock[3] = &block_descriptor_444;
        id v22 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        AXPerformBlockOnMainThread();
        _Block_release(v22);
      }
      else
      {
        uint64_t v31 = sub_2269B8530();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v31, v2);
        unint64_t v32 = sub_2269B8540();
        os_log_type_t v33 = sub_2269B9140();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v34 = 0;
          _os_log_impl(&dword_22695C000, v32, v33, "[Hover Typing Store]: unable to find localeID for the current software keyboard.", v34, 2u);
          MEMORY[0x22A65DA10](v34, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      }
    }
    else
    {
      uint64_t v27 = sub_2269B8530();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v27, v2);
      id v28 = sub_2269B8540();
      os_log_type_t v29 = sub_2269B9140();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_22695C000, v28, v29, "[Hover Typing Store]: unable to find primary app UI element.", v30, 2u);
        MEMORY[0x22A65DA10](v30, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
  }
  else
  {
    uint64_t v23 = sub_2269B8530();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v23, v2);
    unint64_t v24 = sub_2269B8540();
    os_log_type_t v25 = sub_2269B9140();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_22695C000, v24, v25, "[Hover Typing Store]: unable to find primary app.", v26, 2u);
      MEMORY[0x22A65DA10](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  }
  return _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

uint64_t sub_2269A03EC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2269B8450();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v36 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B8470();
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2269B8550();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2269B8530();
  swift_beginAccess();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v33 = v12;
  v17(v15, v16, v12);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_2269B8540();
  os_log_type_t v19 = sub_2269B9160();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v31 = a3;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v32 = a1;
    id v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v29 = v7;
    uint64_t v23 = v22;
    uint64_t v38 = v22;
    uint64_t v30 = v6;
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_22697609C(v32, a2, &v38);
    uint64_t v6 = v30;
    a3 = v31;
    sub_2269B9290();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22695C000, v18, v19, "[Hover Typing Store]: software keyboard language set to %s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v23;
    uint64_t v7 = v29;
    MEMORY[0x22A65DA10](v24, -1, -1);
    MEMORY[0x22A65DA10](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v33);
  swift_bridgeObjectRetain();
  sub_2269B8430();
  os_log_type_t v25 = v36;
  sub_2269B8460();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
  uint64_t v26 = sub_2269B8440();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v25, v6);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v29 - 2) = a3;
  *((unsigned char *)&v29 - 8) = v26 == 2;
  uint64_t v38 = a3;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_2269A0860()
{
  return sub_2269A0880((uint64_t)sub_2269AC294, (uint64_t)&block_descriptor_427);
}

uint64_t sub_2269A0880(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2269B8E40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2269B8E70();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore_elementAttributeQueue);
  aBlock[4] = a1;
  uint64_t v17 = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226982998;
  aBlock[3] = a2;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_2269B8E50();
  v15[1] = MEMORY[0x263F8EE78];
  sub_2269AC3E4(&qword_268149128, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
  sub_22696B7B8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
  sub_2269B92F0();
  MEMORY[0x22A65CBA0](0, v12, v8, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_2269A0B1C(uint64_t a1)
{
  uint64_t v2 = sub_2269B8550();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)aBlock - v7;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  id v9 = objc_msgSend(self, sel_primaryApp);
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = v9;
  uint64_t v11 = objc_msgSend(v9, sel_uiElement);
  if (!v11)
  {

LABEL_7:
    uint64_t v21 = sub_2269B8530();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v21, v2);
    uint64_t v22 = sub_2269B8540();
    os_log_type_t v23 = sub_2269B9140();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_22695C000, v22, v23, "[Hover Typing Store]: unable to find primary app.", v24, 2u);
      MEMORY[0x22A65DA10](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(v10, sel_firstResponder);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_uiElement);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = (void *)swift_allocObject();
      v17[2] = a1;
      v17[3] = v16;
      v17[4] = v12;
      aBlock[4] = sub_2269AC2E4;
      void aBlock[5] = v17;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_226982998;
      aBlock[3] = &block_descriptor_433;
      uint64_t v18 = _Block_copy(aBlock);
      swift_retain();
      id v19 = v16;
      uint64_t v20 = v12;
      swift_release();
      AXPerformBlockOnMainThread();
      _Block_release(v18);

      return _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
    }
  }
  uint64_t v25 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v25, v2);
  uint64_t v26 = sub_2269B8540();
  os_log_type_t v27 = sub_2269B9140();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_22695C000, v26, v27, "[Hover Typing]: unable to find first responder.", v28, 2u);
    MEMORY[0x22A65DA10](v28, -1, -1);
    uint64_t v29 = v12;
  }
  else
  {
    uint64_t v29 = v26;
    uint64_t v26 = v12;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

uint64_t sub_2269A0ED0(uint64_t a1, id a2, void *a3)
{
  objc_msgSend(a2, sel_rectWithAXAttribute_, 2236);
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  swift_release();
  swift_getKeyPath();
  sub_2269B84A0();
  swift_release();
  v7.origin.CGFloat x = 0.0;
  v7.origin.CGFloat y = 0.0;
  v7.size.CGFloat width = 0.0;
  v7.size.CGFloat height = 0.0;
  uint64_t result = CGRectEqualToRect(*(CGRect *)(a1 + 216), v7);
  if (result)
  {
    objc_msgSend(a3, sel_rectWithAXAttribute_, 2236);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_2269B8490();
    return swift_release();
  }
  return result;
}

void sub_2269A10E0()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedInstance);
  id v2 = objc_msgSend(v1, sel_hoverTextContentSize);

  sub_2269B8F30();
  if (v2) {

  }
  uint64_t v3 = (void *)sub_2269B8F00();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, v3);

  uint64_t v5 = self;
  uint64_t v6 = (void *)*MEMORY[0x263F83570];
  id v7 = objc_msgSend(v5, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x263F83570], v4);
  id v8 = objc_msgSend(v0, sel_sharedInstance);
  id v9 = objc_msgSend(v8, sel_hoverTextTypingTextStyle);

  if (!v9) {
    id v9 = v6;
  }
  id v10 = v9;
  id v11 = v4;
  id v12 = objc_msgSend(v5, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, v10, v11);

  id v13 = v12;
  id v14 = objc_msgSend(v0, sel_sharedInstance);
  id v15 = objc_msgSend(v14, sel_hoverTextTypingFontName);

  uint64_t v16 = v13;
  if (v15)
  {
    sub_2269B8F30();

    objc_msgSend(v13, sel_pointSize);
    double v18 = v17;
    id v19 = (void *)sub_2269B8F00();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v5, sel_fontWithName_size_, v19, v18);

    uint64_t v16 = v13;
    if (v20)
    {

      uint64_t v16 = v20;
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();

  swift_release();
}

void sub_2269A1428(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149578);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v124 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_2269B8290();
  uint64_t v135 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  id v134 = (char *)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v132 = (char *)&v124 - v9;
  uint64_t v133 = sub_2269B8240();
  uint64_t v131 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  id v130 = (char *)&v124 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_2269B82E0();
  uint64_t v128 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  uint64_t v129 = (char *)&v124 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v137 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v148 = (void (*)(char *, uint64_t))((char *)&v124 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v124 - v15;
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)&v124 - v18;
  uint64_t v20 = sub_2269B8550();
  uint64_t v21 = *(uint64_t **)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v147 = (char *)&v124 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v127 = (char *)&v124 - v24;
  MEMORY[0x270FA5388](v25);
  os_log_type_t v27 = (char *)&v124 - v26;
  uint64_t v28 = sub_2269B8530();
  swift_beginAccess();
  uint64_t v29 = (void (*)(char *, void (*)(void, void), uint64_t))v21[2];
  id v142 = (void (*)(char *, uint64_t))v28;
  uint64_t v141 = (uint64_t)(v21 + 2);
  char v140 = v29;
  v29(v27, (void (*)(void, void))v28, v20);
  *(void *)&long long v146 = a1;
  sub_226967548(a1, (uint64_t)v19);
  swift_retain_n();
  uint64_t v30 = sub_2269B8540();
  int v31 = sub_2269B9130();
  BOOL v32 = os_log_type_enabled(v30, (os_log_type_t)v31);
  uint64_t v138 = v6;
  if (!v32)
  {
    swift_release_n();
    sub_2269675AC((uint64_t)v19);

    id v40 = (void (*)(char *, uint64_t))v21[1];
    v40(v27, v20);
    uint64_t v41 = (uint64_t)v148;
    goto LABEL_27;
  }
  int v126 = v31;
  uint64_t v145 = v21;
  uint64_t v139 = v20;
  uint64_t v144 = v12;
  uint64_t v33 = swift_slowAlloc();
  uint64_t v125 = swift_slowAlloc();
  uint64_t v151 = v125;
  *(_DWORD *)uint64_t v33 = 136315394;
  swift_getKeyPath();
  uint64_t v152 = v2;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v34 = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  unint64_t v35 = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
  swift_bridgeObjectRetain();
  uint64_t v152 = sub_22697609C(v34, v35, &v151);
  sub_2269B9290();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v33 + 12) = 2080;
  sub_226967548((uint64_t)v19, (uint64_t)v16);
  uint64_t v36 = *(void *)v16;
  unsigned int v37 = v16[48];
  uint64_t v38 = 0xD000000000000016;
  unint64_t v39 = 0x80000002269BD3B0;
  switch((v37 >> 5) & 3)
  {
    case 1u:
      break;
    case 2u:
      unint64_t v39 = 0xEC0000006465676ELL;
      uint64_t v38 = 0x61684365756C6156;
      break;
    case 3u:
      uint64_t v42 = *((void *)v16 + 3);
      uint64_t v43 = *((void *)v16 + 4) | *((void *)v16 + 5);
      uint64_t v44 = *((void *)v16 + 2) | *((void *)v16 + 1);
      uint64_t v38 = 0xD000000000000014;
      if (v37 != 96 || v43 | v36 | v42 | v44)
      {
        uint64_t v46 = v43 | v42 | v44;
        if (v37 != 96 || v36 != 1 || v46)
        {
          BOOL v47 = v37 == 96;
          BOOL v49 = v36 == 2 && v46 == 0;
          if (v47 && v49) {
            uint64_t v38 = 0xD000000000000011;
          }
          else {
            uint64_t v38 = 0xD00000000000001DLL;
          }
          if (v47 && v49) {
            unint64_t v39 = 0x80000002269BD350;
          }
          else {
            unint64_t v39 = 0x80000002269BD330;
          }
          break;
        }
        uint64_t v45 = "ElementVisualUpdated";
      }
      else
      {
        uint64_t v45 = "PrimaryAppsDidChange";
      }
      unint64_t v39 = (unint64_t)(v45 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v39 = 0xEE0065676E616843;
      uint64_t v38 = 0x6469447375636F46;
      break;
  }
  sub_2269675AC((uint64_t)v16);
  uint64_t v152 = sub_22697609C(v38, v39, &v151);
  sub_2269B9290();
  swift_bridgeObjectRelease();
  sub_2269675AC((uint64_t)v19);
  _os_log_impl(&dword_22695C000, v30, (os_log_type_t)v126, "[Hover Typing Store]: %s - Handling event: %s", (uint8_t *)v33, 0x16u);
  uint64_t v50 = v125;
  swift_arrayDestroy();
  MEMORY[0x22A65DA10](v50, -1, -1);
  MEMORY[0x22A65DA10](v33, -1, -1);

  uint64_t v21 = v145;
  id v40 = (void (*)(char *, uint64_t))v145[1];
  uint64_t v20 = v139;
  v40(v27, v139);
  uint64_t v41 = (uint64_t)v148;
  uint64_t v12 = v144;
LABEL_27:
  id v51 = v147;
  sub_226967548(v146, v41);
  HoverTextPresentationEvent.processEvent()();
  if (!v52)
  {
    uint64_t v144 = v12;
    double v64 = (uint64_t *)(v41 + *(int *)(v12 + 44));
    uint64_t v66 = *v64;
    uint64_t v65 = v64[1];
    swift_getKeyPath();
    double v67 = (char *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar);
    uint64_t v151 = v2;
    uint64_t v68 = sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
    id v147 = v67;
    sub_2269B84A0();
    swift_release();
    *(void *)&long long v146 = v2 + 257;
    if ((*(unsigned char *)(v2 + 360) & 1) == 0 && v66 == *(void *)(v2 + 344) && v65 == *(void *)(v2 + 352))
    {
      int v84 = *(unsigned __int8 *)(v41 + 50);
      if (v84 == 12)
      {
LABEL_38:
        uint64_t v85 = v41;
LABEL_47:
        sub_2269675AC(v85);
        return;
      }
      if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(*(unsigned char *)(v41 + 50)) == 0xD000000000000017
        && v120 == 0x80000002269BD020)
      {
        goto LABEL_56;
      }
      char v121 = sub_2269B94F0();
      swift_bridgeObjectRelease();
      if (v121) {
        goto LABEL_33;
      }
      if (HoverTextPresentationEvent.ValueChangeEventType.rawValue.getter(v84) == 0xD000000000000017
        && v122 == 0x80000002269BD040)
      {
LABEL_56:
        swift_bridgeObjectRelease();
      }
      else
      {
        char v123 = sub_2269B94F0();
        swift_bridgeObjectRelease();
        if ((v123 & 1) == 0) {
          goto LABEL_38;
        }
      }
    }
LABEL_33:
    uint64_t v145 = v64;
    uint64_t v69 = v129;
    sub_2269A4A70(v41, v129);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(&v124 - 2) = v2;
    *(&v124 - 1) = (uint64_t)v69;
    uint64_t v151 = v2;
    uint64_t v141 = MEMORY[0x263F8EE60] + 8;
    sub_2269B8490();
    char v140 = 0;
    swift_release();
    uint64_t v71 = v128;
    id v142 = *(void (**)(char *, uint64_t))(v128 + 8);
    uint64_t v72 = v143;
    v142(v69, v143);
    swift_getKeyPath();
    uint64_t v151 = v2;
    sub_2269B84A0();
    swift_release();
    uint64_t v73 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v69, v73, v72);
    uint64_t v139 = v68;
    uint64_t v74 = v130;
    sub_2269B81F0();
    sub_2269AC3E4(&qword_268148B20, MEMORY[0x263F066D8]);
    uint64_t v75 = v132;
    uint64_t v76 = v133;
    sub_2269B90C0();
    uint64_t v77 = v134;
    sub_2269B90E0();
    sub_2269AC3E4(&qword_268148B28, MEMORY[0x263F067E8]);
    uint64_t v78 = v136;
    char v79 = sub_2269B8EF0();
    uint64_t v128 = v2;
    char v80 = v79;
    uint64_t v81 = *(void (**)(char *, uint64_t))(v135 + 8);
    v81(v77, v78);
    v81(v75, v78);
    (*(void (**)(char *, uint64_t))(v131 + 8))(v74, v76);
    v142(v69, v143);
    if (v80)
    {
      swift_getKeyPath();
      uint64_t v82 = v128;
      uint64_t v152 = v128;
      sub_2269B84A0();
      swift_release();
      char v83 = *(unsigned char *)v146;
    }
    else
    {
      char v83 = 1;
      uint64_t v82 = v128;
    }
    uint64_t v86 = MEMORY[0x263F8EE60];
    uint64_t v87 = swift_getKeyPath();
    MEMORY[0x270FA5388](v87);
    *(&v124 - 2) = v82;
    *((unsigned char *)&v124 - 8) = v83;
    uint64_t v152 = v82;
    sub_2269B8490();
    swift_release();
    swift_getKeyPath();
    uint64_t v152 = v82;
    sub_2269B84A0();
    swift_release();
    IsEmptCGFloat y = CGRectIsEmpty(*(CGRect *)(v82 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect));
    uint64_t v89 = v144;
    if (IsEmpty
      || (swift_getKeyPath(), v152 = v82, sub_2269B84A0(), uint64_t v90 = swift_release(), *(unsigned char *)v146 != 1)
      || (uint64_t v91 = (char *)v148 + *(int *)(v89 + 40), (v91[8] & 1) != 0)
      || *(void *)v91 != 3)
    {
      uint64_t v92 = (uint64_t)v148;
      uint64_t v93 = (char *)v148 + *(int *)(v89 + 36);
      long long v146 = *(_OWORD *)v93;
      uint64_t v94 = *((void *)v93 + 2);
      uint64_t v95 = *((void *)v93 + 3);
      uint64_t v96 = swift_getKeyPath();
      MEMORY[0x270FA5388](v96);
      *(&v124 - 6) = v82;
      *(_OWORD *)(&v124 - 5) = v146;
      *(&v124 - 3) = v94;
      *(&v124 - 2) = v95;
      uint64_t v152 = v82;
      sub_2269B8490();
    }
    else
    {
      MEMORY[0x270FA5388](v90);
      *(void *)&long long v146 = &v124 - 4;
      uint64_t v92 = (uint64_t)v148;
      *(&v124 - 2) = v82;
      *(&v124 - 1) = v92;
      sub_2269B8DC0();
      sub_2269B8730();
    }
    swift_release();
    uint64_t v97 = v86;
    uint64_t v98 = (uint64_t)v138;
    sub_226967548(v92, (uint64_t)v138);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v137 + 56))(v98, 0, 1, v89);
    uint64_t v99 = swift_getKeyPath();
    MEMORY[0x270FA5388](v99);
    *(&v124 - 2) = v82;
    *(&v124 - 1) = v98;
    uint64_t v152 = v82;
    *(void *)&long long v146 = v97 + 8;
    sub_2269B8490();
    swift_release();
    sub_22696B8F0(v98, &qword_268149578);
    id v100 = v145;
    uint64_t v101 = *v145;
    uint64_t v102 = v145[1];
    sub_2269A2C80(*v145, v102);
    uint64_t v103 = swift_getKeyPath();
    MEMORY[0x270FA5388](v103);
    *(&v124 - 4) = v82;
    *(&v124 - 3) = v101;
    *(&v124 - 2) = v102;
    *((unsigned char *)&v124 - 8) = 0;
    uint64_t v152 = v82;
    sub_2269B8490();
    swift_release();
    uint64_t v104 = *v100;
    uint64_t v105 = v100[1];
    uint64_t v106 = swift_getKeyPath();
    MEMORY[0x270FA5388](v106);
    *(&v124 - 4) = v82;
    *(&v124 - 3) = v104;
    *(&v124 - 2) = v105;
    *((unsigned char *)&v124 - 8) = 0;
    uint64_t v152 = v82;
    sub_2269B8490();
    swift_release();
    uint64_t v85 = (uint64_t)v148;
    goto LABEL_47;
  }
  sub_2269675AC(v41);
  id v154 = v52;
  id v53 = v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268148B40);
  if (!swift_dynamicCast()) {
    goto LABEL_49;
  }
  if (v153 != 1)
  {
    sub_226967608(v152, v153);
LABEL_49:

    double v107 = v142;
    swift_beginAccess();
    v140(v51, (void (*)(void, void))v107, v20);
    swift_retain();
    id v108 = v52;
    swift_retain();
    id v109 = v52;
    double v110 = sub_2269B8540();
    os_log_type_t v111 = sub_2269B9120();
    if (os_log_type_enabled(v110, v111))
    {
      double v112 = (char *)v2;
      uint64_t v113 = swift_slowAlloc();
      uint64_t v114 = swift_slowAlloc();
      uint64_t v145 = v21;
      uint64_t v115 = v114;
      uint64_t v152 = v114;
      *(_DWORD *)uint64_t v113 = 136315394;
      uint64_t v139 = v20;
      swift_getKeyPath();
      id v154 = v112;
      sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
      uint64_t v148 = v40;
      sub_2269B84A0();
      swift_release();
      uint64_t v116 = *(void *)&v112[OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier];
      unint64_t v117 = *(void *)&v112[OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8];
      swift_bridgeObjectRetain();
      id v154 = (id)sub_22697609C(v116, v117, &v152);
      sub_2269B9290();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v113 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v118 = sub_2269B9520();
      id v154 = (id)sub_22697609C(v118, v119, &v152);
      sub_2269B9290();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22695C000, v110, v111, "[Hover Typing Store]: %s - Will not update display text: %s", (uint8_t *)v113, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v115, -1, -1);
      MEMORY[0x22A65DA10](v113, -1, -1);

      v148(v147, v139);
    }
    else
    {

      swift_release_n();
      v40(v51, v20);
    }
    return;
  }
  uint64_t v145 = v21;

  uint64_t v54 = swift_getKeyPath();
  MEMORY[0x270FA5388](v54);
  *(&v124 - 2) = v2;
  *((unsigned char *)&v124 - 8) = 0;
  uint64_t v151 = v2;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  swift_release();
  uint64_t v55 = v142;
  swift_beginAccess();
  unint64_t v56 = v127;
  v140(v127, (void (*)(void, void))v55, v20);
  swift_retain_n();
  unint64_t v57 = sub_2269B8540();
  os_log_type_t v58 = sub_2269B9120();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    uint64_t v139 = v20;
    uint64_t v61 = v60;
    uint64_t v150 = v60;
    *(_DWORD *)uint64_t v59 = 136315138;
    id v147 = (char *)(v59 + 4);
    swift_getKeyPath();
    uint64_t v148 = v40;
    uint64_t v149 = v2;
    sub_2269B84A0();
    swift_release();
    uint64_t v62 = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
    unint64_t v63 = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
    swift_bridgeObjectRetain();
    uint64_t v149 = sub_22697609C(v62, v63, &v150);
    sub_2269B9290();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v57, v58, "[Hover Typing Store]: %s - No display text to show", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v61, -1, -1);
    MEMORY[0x22A65DA10](v59, -1, -1);

    v148(v127, v139);
  }
  else
  {

    swift_release_n();
    v40(v56, v20);
  }
}

uint64_t sub_2269A2B78()
{
  return swift_release();
}

uint64_t sub_2269A2C80(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v3 = sub_2269B8370();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v30 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_2269B8240();
  MEMORY[0x270FA5388](v34);
  uint64_t v33 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2269B82E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v10 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v41 = v2;
  uint64_t v11 = sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v12 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  BOOL v32 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v32(v9, v12, v6);
  swift_getKeyPath();
  uint64_t v40 = v2;
  sub_2269B84A0();
  swift_release();
  uint64_t v28 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  id v13 = *(id *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_226968324(v13);
  double v15 = v14;

  uint64_t v16 = v7 + 8;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v31 = v16;
  v17(v9, v6);
  swift_getKeyPath();
  uint64_t v37 = v2;
  uint64_t v38 = v11;
  uint64_t v40 = v2;
  uint64_t v39 = v10;
  sub_2269B84A0();
  swift_release();
  v32(v9, v12, v6);
  sub_2269B81F0();
  BOOL v32 = (void (*)(char *, uint64_t, uint64_t))v6;
  uint64_t v29 = v17;
  v17(v9, v6);
  sub_2269AC3E4(&qword_268149590, MEMORY[0x263F066D8]);
  sub_2269B8FD0();
  sub_2269B9110();
  if (v18)
  {
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    uint64_t v27 = v37;
    *(&v28 - 2) = v37;
    *(&v28 - 1) = 0;
    uint64_t v40 = v27;
    sub_2269B8490();
    return swift_release();
  }
  else
  {
    sub_2269B8FE0();
    swift_bridgeObjectRelease();
    sub_2269B8360();
    id v19 = v9;
    sub_2269B8300();
    swift_getKeyPath();
    uint64_t v20 = v37;
    uint64_t v40 = v37;
    sub_2269B84A0();
    swift_release();
    id v21 = *(id *)(v20 + v28);
    sub_226968324(v21);
    double v23 = v22;

    uint64_t v24 = swift_getKeyPath();
    MEMORY[0x270FA5388](v24);
    *(&v28 - 2) = v20;
    *((double *)&v28 - 1) = v15 - v23;
    uint64_t v40 = v20;
    sub_2269B8490();
    swift_release();
    return ((uint64_t (*)(char *, void (*)(char *, uint64_t, uint64_t)))v29)(v19, v32);
  }
}

uint64_t sub_2269A31D0(char a1)
{
  uint64_t v3 = sub_2269B8940();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v11 = v1;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  if (*(unsigned char *)(v1 + 144) == 1)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(&v10 - 2) = v1;
    *((unsigned char *)&v10 - 8) = 0;
    uint64_t v11 = v1;
    sub_2269B8490();
    swift_release();
    sub_2269B8DB0();
    sub_2269B8730();
    return swift_release();
  }
  else
  {
    swift_getKeyPath();
    uint64_t v11 = v1;
    sub_2269B84A0();
    swift_release();
    swift_retain();
    sub_2269B8DB0();
    sub_2269B8730();
    swift_release();
    swift_release();
    uint64_t v9 = sub_2269B8DB0();
    MEMORY[0x270FA5388](v9);
    *(&v10 - 2) = v1;
    *((unsigned char *)&v10 - 8) = a1 & 1;
    swift_retain();
    sub_2269B8930();
    sub_2269B8720();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_2269A3540(uint64_t a1)
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  CGRectGetMaxX(*(CGRect *)(a1 + 152));
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_2269A3740()
{
  return swift_release();
}

uint64_t sub_2269A3810()
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  if (*(unsigned char *)(v0 + 144) == 1)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_2269B8490();
    swift_release();
    sub_2269B8DB0();
    sub_2269B8730();
    return swift_release();
  }
  return result;
}

uint64_t sub_2269A3994()
{
  return swift_release();
}

void sub_2269A3A64(char a1)
{
  switch(a1)
  {
    case 2:
    case 14:
    case 15:
      sub_2269A10E0();
      return;
    case 8:
      id v1 = objc_msgSend(self, sel_sharedInstance);
      objc_msgSend(v1, sel_hoverTextTypingDisplayMode);

      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
      sub_2269B8490();
      swift_release();
      return;
    case 10:
      id v3 = objc_msgSend(self, sel_sharedInstance);
      id v4 = objc_msgSend(v3, sel_hoverTextTypingInsertionPointColorData);

      if (v4)
      {
        uint64_t v5 = sub_2269B83E0();
        unint64_t v7 = v6;

        id v4 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v7 = 0xF000000000000000;
      }
      id v23 = objc_msgSend(self, sel_makeFromData_, v4);

      if (v23) {
        goto LABEL_38;
      }
      sub_22697B170(10);
      goto LABEL_45;
    case 11:
      id v8 = objc_msgSend(self, sel_sharedInstance);
      id v9 = objc_msgSend(v8, sel_hoverTextTypingTextColorData);

      if (v9)
      {
        uint64_t v5 = sub_2269B83E0();
        unint64_t v7 = v10;

        id v9 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v7 = 0xF000000000000000;
      }
      id v23 = objc_msgSend(self, sel_makeFromData_, v9);

      if (v23) {
        goto LABEL_38;
      }
      sub_22697B170(11);
      goto LABEL_45;
    case 12:
      id v11 = objc_msgSend(self, sel_sharedInstance);
      id v12 = objc_msgSend(v11, sel_hoverTextTypingBorderColorData);

      if (v12)
      {
        uint64_t v5 = sub_2269B83E0();
        unint64_t v7 = v13;

        id v12 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v7 = 0xF000000000000000;
      }
      id v23 = objc_msgSend(self, sel_makeFromData_, v12);

      if (v23) {
        goto LABEL_38;
      }
      sub_22697B170(12);
      goto LABEL_45;
    case 13:
      id v14 = objc_msgSend(self, sel_sharedInstance);
      id v15 = objc_msgSend(v14, sel_hoverTextTypingBackgroundColorData);

      if (v15)
      {
        uint64_t v5 = sub_2269B83E0();
        unint64_t v7 = v16;

        id v15 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v7 = 0xF000000000000000;
      }
      id v23 = objc_msgSend(self, sel_makeFromData_, v15);

      if (v23) {
        goto LABEL_38;
      }
      sub_22697B170(13);
      goto LABEL_45;
    case 16:
      id v17 = objc_msgSend(self, sel_sharedInstance);
      id v18 = objc_msgSend(v17, sel_hoverTextTypingMisspelledTextColorData);

      if (v18)
      {
        uint64_t v5 = sub_2269B83E0();
        unint64_t v7 = v19;

        id v18 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v7 = 0xF000000000000000;
      }
      id v23 = objc_msgSend(self, sel_makeFromData_, v18);

      if (v23) {
        goto LABEL_38;
      }
      sub_22697B170(16);
      goto LABEL_45;
    case 17:
      id v20 = objc_msgSend(self, sel_sharedInstance);
      id v21 = objc_msgSend(v20, sel_hoverTextTypingAutocorrectedTextColorData);

      if (v21)
      {
        uint64_t v5 = sub_2269B83E0();
        unint64_t v7 = v22;

        id v21 = (id)sub_2269B83D0();
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v7 = 0xF000000000000000;
      }
      id v23 = objc_msgSend(self, sel_makeFromData_, v21);

      if (v23)
      {
LABEL_38:
        MEMORY[0x22A65C500](objc_msgSend(v23, sel_color));
      }
      else
      {
        sub_22697B170(17);
      }
LABEL_45:
      sub_226967370(v5, v7);
      uint64_t v24 = swift_getKeyPath();
      MEMORY[0x270FA5388](v24);
      sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
      sub_2269B8490();
      swift_release();
      swift_release();
      break;
    case 18:
      sub_2269A45A0();
      break;
    default:
      return;
  }
}

uint64_t sub_2269A45A0()
{
  uint64_t v19 = sub_2269B8550();
  uint64_t v1 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2269A10E0();
  swift_getKeyPath();
  uint64_t v32 = v0;
  uint64_t v33 = 2;
  uint64_t v34 = v0;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  swift_release();
  uint64_t v4 = sub_2269B8BB0();
  swift_getKeyPath();
  uint64_t v30 = v0;
  uint64_t v31 = v4;
  uint64_t v34 = v0;
  sub_2269B8490();
  swift_release();
  swift_release();
  id v5 = objc_msgSend(self, sel_systemBackgroundColor);
  MEMORY[0x22A65C580](v5);
  id v6 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v6, sel_hoverTextBackgroundOpacity);

  uint64_t v7 = sub_2269B8BA0();
  swift_release();
  swift_getKeyPath();
  uint64_t v28 = v0;
  uint64_t v29 = v7;
  uint64_t v34 = v0;
  sub_2269B8490();
  swift_release();
  swift_release();
  uint64_t v8 = sub_2269B8BB0();
  swift_getKeyPath();
  uint64_t v26 = v0;
  uint64_t v27 = v8;
  uint64_t v34 = v0;
  sub_2269B8490();
  swift_release();
  swift_release();
  uint64_t v9 = sub_2269B8B50();
  swift_getKeyPath();
  uint64_t v24 = v0;
  uint64_t v25 = v9;
  uint64_t v34 = v0;
  sub_2269B8490();
  swift_release();
  swift_release();
  uint64_t v10 = sub_2269B8B60();
  swift_getKeyPath();
  uint64_t v22 = v0;
  uint64_t v23 = v10;
  uint64_t v34 = v0;
  sub_2269B8490();
  swift_release();
  swift_release();
  uint64_t v11 = sub_2269B8BB0();
  swift_getKeyPath();
  uint64_t v20 = v0;
  uint64_t v21 = v11;
  uint64_t v34 = v0;
  uint64_t v12 = v19;
  sub_2269B8490();
  swift_release();
  swift_release();
  uint64_t v13 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v12);
  id v14 = sub_2269B8540();
  os_log_type_t v15 = sub_2269B9120();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v16 = 0;
    _os_log_impl(&dword_22695C000, v14, v15, "[Hover Typing Store]: Reset Hover Typing UI settings.", v16, 2u);
    MEMORY[0x22A65DA10](v16, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v12);
}

uint64_t sub_2269A4A70@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v77 = a1;
  uint64_t v78 = a2;
  uint64_t v5 = sub_2269B82E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v79 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v7;
  MEMORY[0x270FA5388](v8);
  char v80 = (char *)&v67 - v9;
  uint64_t v74 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2269B8280();
  uint64_t v86 = (uint64_t)*(v74 - 1);
  MEMORY[0x270FA5388](v74);
  uint64_t v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_2269B8370();
  uint64_t v87 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = swift_allocBox();
  os_log_type_t v15 = v14;
  uint64_t v76 = type metadata accessor for HoverTextPresentationEvent();
  uint64_t v16 = a1 + *(int *)(v76 + 28);
  uint64_t v85 = v6;
  id v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v88 = v15;
  uint64_t v81 = v5;
  uint64_t v83 = v6 + 16;
  uint64_t v82 = v17;
  v17(v15, (char *)v16, v5);
  swift_getKeyPath();
  uint64_t v70 = v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t aBlock = v3;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v18 = *(void *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor);
  swift_retain();
  sub_2269B8360();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t aBlock = v18;
  sub_226967448();
  swift_retain();
  sub_2269B8350();
  LODWORD(v73) = *MEMORY[0x263F06720];
  uint64_t v19 = v86;
  uint64_t v72 = *(void (**)(char *))(v86 + 104);
  uint64_t v20 = v74;
  v72(v11);
  sub_2269B8270();
  swift_release();
  uint64_t v21 = *(void (**)(char *, uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(v19 + 8);
  uint64_t v86 = v19 + 8;
  uint64_t v71 = v21;
  v21(v11, v20);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v87 + 8);
  v87 += 8;
  uint64_t v23 = v75;
  v22(v13, v75);
  swift_getKeyPath();
  uint64_t aBlock = v3;
  sub_2269B84A0();
  swift_release();
  uint64_t v24 = v3;
  id v25 = *(id *)(v3 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  uint64_t v26 = sub_2269B8980();
  sub_2269B8360();
  uint64_t v89 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t aBlock = v26;
  sub_2269674DC();
  swift_retain();
  sub_2269B8350();
  ((void (*)(char *, void, uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))v72)(v11, v73, v20);
  sub_2269B8270();
  swift_release();
  v71(v11, v20);
  v22(v13, v23);
  uint64_t v27 = *(void **)(v77 + *(int *)(v76 + 52));
  if (v27)
  {
    uint64_t v28 = v80;
    uint64_t v29 = v81;
    uint64_t v30 = v82;
    v82(v80, v88, v81);
    uint64_t v31 = v30;
    uint64_t v32 = sub_2269B8F30();
    uint64_t v34 = v33;
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v84;
    *(void *)(v35 + 24) = v24;
    uint64_t v69 = v24;
    uint64_t v36 = v79;
    v31(v79, v28, v29);
    uint64_t v37 = v85;
    uint64_t v38 = *(unsigned __int8 *)(v85 + 80);
    uint64_t v86 = ((v38 + 48) & ~v38) + v68;
    uint64_t v87 = (v38 + 48) & ~v38;
    uint64_t v39 = v87;
    uint64_t v77 = v38 | 7;
    uint64_t v40 = (char *)swift_allocObject();
    *((void *)v40 + 2) = v32;
    *((void *)v40 + 3) = v34;
    *((void *)v40 + 4) = sub_2269ABC50;
    *((void *)v40 + 5) = v35;
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    uint64_t v75 = v37 + 32;
    uint64_t v76 = (uint64_t)v41;
    v41(&v40[v39], v36, v29);
    uint64_t v95 = sub_2269ABC5C;
    uint64_t v96 = v40;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v92 = 1107296256;
    uint64_t v74 = &v93;
    uint64_t v93 = sub_2269AB7BC;
    uint64_t v94 = &block_descriptor_347;
    uint64_t v42 = _Block_copy(&aBlock);
    id v43 = v27;
    id v73 = v43;
    uint64_t v44 = v84;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v43, sel_enumerateAttributesUsingBlock_, v42);
    _Block_release(v42);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v72 = *(void (**)(char *))(v37 + 8);
    uint64_t v85 = v37 + 8;
    uint64_t v45 = v80;
    ((void (*)(char *, uint64_t))v72)(v80, v29);
    uint64_t v46 = v88;
    swift_beginAccess();
    BOOL v47 = v46;
    uint64_t v48 = v82;
    v82(v45, v47, v29);
    uint64_t v49 = sub_2269B8F30();
    uint64_t v51 = v50;
    uint64_t v52 = swift_allocObject();
    uint64_t v53 = v44;
    *(void *)(v52 + 16) = v44;
    uint64_t v54 = v69;
    *(void *)(v52 + 24) = v69;
    uint64_t v55 = v79;
    v48(v79, v45, v29);
    unint64_t v56 = (char *)swift_allocObject();
    *((void *)v56 + 2) = v49;
    *((void *)v56 + 3) = v51;
    *((void *)v56 + 4) = sub_2269ABC64;
    *((void *)v56 + 5) = v52;
    ((void (*)(char *, char *, uint64_t))v76)(&v56[v87], v55, v29);
    uint64_t v95 = sub_2269ABC5C;
    uint64_t v96 = v56;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v92 = 1107296256;
    uint64_t v93 = sub_2269AB7BC;
    uint64_t v94 = &block_descriptor_357;
    unint64_t v57 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v73, sel_enumerateAttributesUsingBlock_, v57);
    _Block_release(v57);
    swift_bridgeObjectRelease();
    swift_release();
    ((void (*)(char *, uint64_t))v72)(v45, v29);
    v48(v45, v88, v29);
    uint64_t v58 = sub_2269B8F30();
    uint64_t v60 = v59;
    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 16) = v53;
    *(void *)(v61 + 24) = v54;
    v48(v55, v45, v29);
    uint64_t v62 = (char *)swift_allocObject();
    *((void *)v62 + 2) = v58;
    *((void *)v62 + 3) = v60;
    *((void *)v62 + 4) = sub_2269ABCB4;
    *((void *)v62 + 5) = v61;
    ((void (*)(char *, char *, uint64_t))v76)(&v62[v87], v55, v29);
    uint64_t v95 = sub_2269ABC5C;
    uint64_t v96 = v62;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v92 = 1107296256;
    uint64_t v93 = sub_2269AB7BC;
    uint64_t v94 = &block_descriptor_367;
    unint64_t v63 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    id v64 = v73;
    objc_msgSend(v73, sel_enumerateAttributesUsingBlock_, v63);
    _Block_release(v63);

    swift_bridgeObjectRelease();
    swift_release();
    ((void (*)(char *, uint64_t))v72)(v45, v29);
  }
  uint64_t v65 = v88;
  swift_beginAccess();
  v82(v78, v65, v81);
  return swift_release();
}

void sub_2269A55A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v70 = a3;
  uint64_t v83 = a1;
  uint64_t v3 = sub_2269B8A00();
  MEMORY[0x270FA5388](v3 - 8);
  v67[2] = (char *)v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v68 = (char *)v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E98);
  MEMORY[0x270FA5388](v84);
  uint64_t v69 = (char *)v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v72 = (uint64_t)v67 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v82 = (char *)v67 - v11;
  uint64_t v12 = sub_2269B8290();
  uint64_t v85 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v80 = (char *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v67 - v15;
  uint64_t v17 = sub_2269B82E0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2269B8240();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = swift_projectBox();
  swift_beginAccess();
  sub_2269B81F0();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v71 = v18 + 16;
  uint64_t v76 = v26;
  v26(v20, v25, v17);
  swift_endAccess();
  sub_2269B8200();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v79 = v17;
  uint64_t v78 = v18 + 8;
  id v73 = v27;
  v27(v20, v17);
  uint64_t v28 = v83;
  uint64_t v29 = sub_2269B8230();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v85 + 8);
  uint64_t v77 = v16;
  uint64_t v81 = v12;
  uint64_t v75 = v85 + 8;
  uint64_t v74 = v30;
  v30(v16, v12);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v22 + 8);
  v31(v24, v21);
  swift_beginAccess();
  sub_2269B81F0();
  swift_endAccess();
  uint64_t v32 = sub_2269B8210();
  uint64_t v33 = v24;
  uint64_t v34 = (uint64_t)v82;
  v31(v33, v21);
  sub_22696B88C(v28, v34, &qword_268148E98);
  if (v29 >= v32)
  {
    uint64_t v52 = v34;
LABEL_9:
    sub_22696B8F0(v52, &qword_268148E98);
    return;
  }
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
  uint64_t v36 = v77;
  uint64_t v37 = v81;
  v85 += 16;
  v35(v77, v34, v81);
  swift_beginAccess();
  uint64_t v38 = v79;
  v76(v20, v25, v79);
  uint64_t v39 = v80;
  sub_2269B8200();
  v73(v20, v38);
  v67[1] = sub_2269AC3E4(&qword_268148B28, MEMORY[0x263F067E8]);
  char v40 = sub_2269B8EF0();
  uint64_t v41 = v74;
  v74(v39, v37);
  v41(v36, v37);
  uint64_t v42 = v72;
  sub_22696B88C(v34, v72, &qword_268148E98);
  uint64_t v43 = v25;
  if ((v40 & 1) == 0)
  {
    sub_22696B8F0(v42, &qword_268148E98);
    sub_22696B8F0(v34, &qword_268148E98);
    uint64_t v50 = v70;
    uint64_t v51 = (uint64_t)v69;
    goto LABEL_7;
  }
  uint64_t v44 = v77;
  uint64_t v45 = v81;
  v35(v77, v42 + *(int *)(v84 + 36), v81);
  swift_beginAccess();
  uint64_t v46 = v79;
  v76(v20, v43, v79);
  BOOL v47 = v80;
  sub_2269B82B0();
  v73(v20, v46);
  char v48 = sub_2269B8EF0();
  uint64_t v49 = v74;
  v74(v47, v45);
  v49(v44, v45);
  sub_22696B8F0(v42, &qword_268148E98);
  sub_22696B8F0(v34, &qword_268148E98);
  uint64_t v50 = v70;
  uint64_t v51 = (uint64_t)v69;
  if ((v48 & 1) == 0)
  {
LABEL_7:
    sub_22696B88C(v83, v51, &qword_268148E98);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    v67[-2] = v54;
    swift_getKeyPath();
    sub_2269B89E0();
    swift_getKeyPath();
    uint64_t v55 = v50 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
    v87[0] = v50;
    sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
    uint64_t v85 = v55;
    sub_2269B84A0();
    swift_release();
    swift_retain();
    unint64_t v56 = v68;
    sub_2269B8A10();
    uint64_t v57 = sub_2269B8A20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 0, 1, v57);
    swift_beginAccess();
    sub_22696B7B8(&qword_268148EA8, &qword_268148E98);
    uint64_t v58 = (void (*)(void *, void))sub_2269B8310();
    sub_2269ABE54();
    sub_2269B8380();
    v58(v87, 0);
    swift_endAccess();
    sub_22696B8F0(v51, &qword_268148E98);
    id v59 = objc_msgSend(self, sel_sharedInstance);
    id v60 = objc_msgSend(v59, sel_hoverTextTypingMisspelledTextColorData);

    if (!v60) {
      return;
    }
    uint64_t v61 = sub_2269B83E0();
    unint64_t v63 = v62;

    sub_226967384(v61, v63);
    sub_22696B88C(v83, v51, &qword_268148E98);
    uint64_t v64 = swift_getKeyPath();
    MEMORY[0x270FA5388](v64);
    v67[-2] = v65;
    swift_getKeyPath();
    swift_getKeyPath();
    v87[0] = v50;
    sub_2269B84A0();
    swift_release();
    uint64_t v86 = *(void *)(v50 + 112);
    swift_beginAccess();
    swift_retain();
    uint64_t v66 = (void (*)(void *, void))sub_2269B8310();
    sub_226967448();
    sub_2269B8380();
    v66(v87, 0);
    swift_endAccess();
    uint64_t v52 = v51;
    goto LABEL_9;
  }
}

uint64_t sub_2269A6050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_2269B8EF0() & 1;
}

void sub_2269A60A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v56 = a3;
  uint64_t v60 = a1;
  uint64_t v4 = sub_2269B8A00();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v53 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v54 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E98);
  MEMORY[0x270FA5388](v59);
  uint64_t v55 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v57 = (uint64_t)&v46 - v10;
  uint64_t v11 = sub_2269B82E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2269B8290();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v46 - v20;
  uint64_t v22 = swift_projectBox();
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v49(v21, a1, v15);
  swift_beginAccess();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v58 = v22;
  char v48 = v23;
  v23(v14, v22, v11);
  sub_2269B8200();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v50 = v14;
  uint64_t v52 = v11;
  uint64_t v51 = v12 + 8;
  BOOL v47 = v24;
  v24(v14, v11);
  sub_2269AC3E4(&qword_268148B28, MEMORY[0x263F067E8]);
  LOBYTE(v22) = sub_2269B8EF0();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v16 + 8);
  v25(v18, v15);
  v25(v21, v15);
  uint64_t v26 = v57;
  sub_22696B88C(v60, v57, &qword_268148E98);
  if (v22)
  {
    v49(v21, v26 + *(int *)(v59 + 36), v15);
    uint64_t v27 = v58;
    swift_beginAccess();
    uint64_t v28 = v50;
    uint64_t v29 = v52;
    v48(v50, v27, v52);
    sub_2269B82B0();
    v47(v28, v29);
    char v30 = sub_2269B8EF0();
    v25(v18, v15);
    v25(v21, v15);
    sub_22696B8F0(v57, &qword_268148E98);
    uint64_t v32 = (uint64_t)v55;
    uint64_t v31 = v56;
    if (v30) {
      return;
    }
  }
  else
  {
    sub_22696B8F0(v26, &qword_268148E98);
    uint64_t v32 = (uint64_t)v55;
    uint64_t v31 = v56;
  }
  sub_22696B88C(v60, v32, &qword_268148E98);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v46 - 2) = v34;
  swift_getKeyPath();
  sub_2269B89F0();
  swift_getKeyPath();
  v62[0] = v31;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  swift_retain();
  uint64_t v35 = v54;
  sub_2269B8A10();
  uint64_t v36 = sub_2269B8A20();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
  swift_beginAccess();
  sub_22696B7B8(&qword_268148EA8, &qword_268148E98);
  uint64_t v37 = (void (*)(void *, void))sub_2269B8310();
  sub_2269ABE54();
  sub_2269B8380();
  v37(v62, 0);
  swift_endAccess();
  sub_22696B8F0(v32, &qword_268148E98);
  id v38 = objc_msgSend(self, sel_sharedInstance);
  id v39 = objc_msgSend(v38, sel_hoverTextTypingAutocorrectedTextColorData);

  if (v39)
  {
    uint64_t v40 = sub_2269B83E0();
    unint64_t v42 = v41;

    sub_226967384(v40, v42);
    sub_22696B88C(v60, v32, &qword_268148E98);
    uint64_t v43 = swift_getKeyPath();
    MEMORY[0x270FA5388](v43);
    *(&v46 - 2) = v44;
    swift_getKeyPath();
    swift_getKeyPath();
    v62[0] = v31;
    sub_2269B84A0();
    swift_release();
    uint64_t v61 = *(void *)(v31 + 120);
    swift_beginAccess();
    swift_retain();
    uint64_t v45 = (void (*)(void *, void))sub_2269B8310();
    sub_226967448();
    sub_2269B8380();
    v45(v62, 0);
    swift_endAccess();
    sub_22696B8F0(v32, &qword_268148E98);
  }
}

uint64_t sub_2269A68E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E98);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2269B82E0();
  swift_projectBox();
  sub_22696B88C(a1, (uint64_t)v7, &qword_268148E98);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  v12[0] = a3;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  swift_retain();
  uint64_t v8 = sub_2269B8BA0();
  swift_release();
  v12[7] = v8;
  swift_beginAccess();
  sub_22696B7B8(&qword_268148EA8, &qword_268148E98);
  uint64_t v9 = (void (*)(void *, void))sub_2269B8310();
  sub_226967448();
  sub_2269B8380();
  v9(v12, 0);
  swift_endAccess();
  return sub_22696B8F0((uint64_t)v7, &qword_268148E98);
}

uint64_t sub_2269A6B00()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2269B8550();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2269B8530();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  uint64_t v7 = sub_2269B8540();
  os_log_type_t v8 = sub_2269B9120();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v18 = v16;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v15 = v9 + 4;
    swift_getKeyPath();
    uint64_t v17 = v1;
    sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
    sub_2269B84A0();
    swift_release();
    uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
    unint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier + 8);
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_22697609C(v10, v11, &v18);
    sub_2269B9290();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v7, v8, "[Hover Typing Store]: %s - Keyboard will hide. Hiding Hover Typing HUD", v9, 0xCu);
    uint64_t v12 = v16;
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v12, -1, -1);
    MEMORY[0x22A65DA10](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v15 - 2) = (uint8_t *)v1;
  *((unsigned char *)&v15 - 8) = 0;
  uint64_t v18 = v1;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_2269A6E84(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2269B8290();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  uint64_t v37 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v34 = &v26[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v33 = &v26[-v8];
  uint64_t v32 = sub_2269B8240();
  uint64_t v35 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v38 = sub_2269B82E0();
  uint64_t v11 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v13 = &v26[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  uint64_t v39 = v1;
  char v40 = a1;
  uint64_t v14 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v42 = v2;
  uint64_t v15 = sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  uint64_t v31 = MEMORY[0x263F8EE60] + 8;
  uint64_t v16 = v15;
  sub_2269B8490();
  uint64_t result = swift_release();
  if ((a1 & 1) == 0)
  {
    swift_getKeyPath();
    uint64_t v42 = v2;
    uint64_t v29 = v14;
    uint64_t v30 = v16;
    sub_2269B84A0();
    swift_release();
    uint64_t v18 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    uint64_t v28 = 0;
    uint64_t v19 = v11;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v13, v18, v38);
    sub_2269B81F0();
    sub_2269AC3E4(&qword_268148B20, MEMORY[0x263F066D8]);
    uint64_t v21 = v32;
    uint64_t v20 = v33;
    sub_2269B90C0();
    uint64_t v22 = v34;
    sub_2269B90E0();
    sub_2269AC3E4(&qword_268148B28, MEMORY[0x263F067E8]);
    uint64_t v23 = v36;
    int v27 = sub_2269B8EF0();
    uint64_t v24 = *(void (**)(unsigned char *, uint64_t))(v37 + 8);
    v24(v22, v23);
    v24(v20, v23);
    (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v10, v21);
    (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v13, v38);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(void *)&v26[-16] = v2;
    v26[-8] = (v27 & 1) == 0;
    uint64_t v41 = v2;
    sub_2269B8490();
    return swift_release();
  }
  return result;
}

uint64_t sub_2269A732C(void *a1)
{
  uint64_t v2 = v1;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) == 1)
  {
    uint64_t v5 = (unsigned char *)(v1 + 256);
    swift_getKeyPath();
    sub_2269B84A0();
    uint64_t result = swift_release();
    if ((*(unsigned char *)(v1 + 257) & 1) == 0)
    {
      swift_getKeyPath();
      sub_2269B84A0();
      uint64_t result = swift_release();
      if ((*(unsigned char *)(v1 + 258) & 1) == 0)
      {
        objc_msgSend(a1, sel_location);
        unint64_t v7 = v6;
        unint64_t v9 = v8;
        swift_getKeyPath();
        sub_2269B84A0();
        swift_release();
        CGFloat v10 = *(double *)(v1 + 216);
        CGFloat v11 = *(double *)(v1 + 224);
        CGFloat v12 = *(double *)(v1 + 232);
        CGFloat v13 = *(double *)(v1 + 240);
        v14.n128_u64[0] = v7;
        v15.n128_u64[0] = v9;
        sub_2269A7B70(v14, v15);
        v53.CGFloat x = v16;
        v53.CGFloat y = v17;
        v56.origin.CGFloat x = v10;
        v56.origin.CGFloat y = v11;
        v56.size.CGFloat width = v12;
        v56.size.CGFloat height = v13;
        BOOL v52 = CGRectContainsPoint(v56, v53);
        swift_getKeyPath();
        sub_2269B84A0();
        swift_release();
        uint64_t v18 = *(void *)(v1 + 96);
        swift_getKeyPath();
        sub_2269AC3E4((unint64_t *)&qword_268148DC8, (void (*)(uint64_t))type metadata accessor for HoverTypingTextReplacementModel);
        swift_retain();
        sub_2269B84A0();
        swift_release();
        int v19 = *(unsigned __int8 *)(v18 + 24);
        swift_release();
        swift_getKeyPath();
        sub_2269B84A0();
        swift_release();
        CGFloat v20 = *(double *)(v2 + 152);
        if (v19 == 1)
        {
          swift_getKeyPath();
          sub_2269B84A0();
          swift_release();
          double v21 = *(double *)(v2 + 160);
          swift_getKeyPath();
          sub_2269B84A0();
          swift_release();
          double v22 = v21 + CGRectGetHeight(*(CGRect *)(v2 + 184));
          swift_getKeyPath();
          sub_2269B84A0();
          swift_release();
          CGRectGetWidth(*(CGRect *)(v2 + 152));
          swift_getKeyPath();
          sub_2269B84A0();
          swift_release();
          CGRectGetHeight(*(CGRect *)(v2 + 152));
          swift_getKeyPath();
          sub_2269B84A0();
          swift_release();
          CGRectGetHeight(*(CGRect *)(v2 + 184));
          v23.n128_f64[0] = v20;
          v24.n128_f64[0] = v22;
          CGFloat v20 = CGRectMake(v23, v24);
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
        }
        else
        {
          CGFloat v26 = *(double *)(v2 + 160);
          CGFloat v28 = *(double *)(v2 + 168);
          CGFloat v30 = *(double *)(v2 + 176);
        }
        swift_getKeyPath();
        sub_2269B84A0();
        swift_release();
        v57.origin.CGFloat x = v20;
        v57.origin.CGFloat y = v26;
        v57.size.CGFloat width = v28;
        v57.size.CGFloat height = v30;
        CGRect v58 = CGRectOffset(v57, *(CGFloat *)(v2 + 136), 0.0);
        CGRect v59 = CGRectInset(v58, -10.0, -10.0);
        CGFloat x = v59.origin.x;
        CGFloat y = v59.origin.y;
        CGFloat width = v59.size.width;
        CGFloat height = v59.size.height;
        *(void *)&v59.origin.CGFloat x = v7;
        *(void *)&v59.origin.CGFloat y = v9;
        sub_2269A7B70((__n128)v59.origin, *(__n128 *)&v59.origin.y);
        v54.CGFloat x = v35;
        v54.CGFloat y = v36;
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = y;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = height;
        BOOL v37 = CGRectContainsPoint(v60, v54);
        swift_getKeyPath();
        sub_2269B84A0();
        swift_release();
        CGFloat v38 = *(double *)(v2 + 184);
        CGFloat v39 = *(double *)(v2 + 192);
        CGFloat v40 = *(double *)(v2 + 200);
        CGFloat v41 = *(double *)(v2 + 208);
        v42.n128_u64[0] = v7;
        v43.n128_u64[0] = v9;
        sub_2269A7B70(v42, v43);
        v55.CGFloat x = v44;
        v55.CGFloat y = v45;
        v61.origin.CGFloat x = v38;
        v61.origin.CGFloat y = v39;
        v61.size.CGFloat width = v40;
        v61.size.CGFloat height = v41;
        BOOL v46 = CGRectContainsPoint(v61, v55);
        swift_getKeyPath();
        sub_2269B84A0();
        swift_release();
        uint64_t v47 = *(void *)(v2 + 96);
        swift_getKeyPath();
        swift_retain();
        sub_2269B84A0();
        swift_release();
        int v48 = *(unsigned __int8 *)(v47 + 24);
        uint64_t result = swift_release();
        if (v48 == 1)
        {
          uint64_t v49 = a1;
          if (v46)
          {
            if (!v37) {
              return result;
            }
          }
          else if (!v37)
          {
            swift_getKeyPath();
            sub_2269B84A0();
            swift_release();
            swift_retain();
            sub_2269B8DB0();
            sub_2269B8730();
            swift_release();
            swift_release();
          }
        }
        else
        {
          uint64_t v49 = a1;
        }
        if (objc_msgSend(v49, sel_isTouchDown))
        {
          uint64_t KeyPath = swift_getKeyPath();
          MEMORY[0x270FA5388](KeyPath);
          sub_2269B8490();
          swift_release();
        }
        swift_getKeyPath();
        sub_2269B84A0();
        uint64_t result = swift_release();
        if ((*v5 & 1) == 0)
        {
          uint64_t result = (uint64_t)objc_msgSend(v49, sel_isLift);
          if ((result & 1) != 0
            || (uint64_t result = (uint64_t)objc_msgSend(v49, sel_isInRangeLift), (result & 1) != 0)
            || (uint64_t result = (uint64_t)objc_msgSend(v49, sel_isInRange), (result & 1) != 0))
          {
            if (v52 || v37) {
              return result;
            }
          }
          else
          {
            uint64_t result = (uint64_t)objc_msgSend(v49, sel_isCancel);
            if ((result ^ 1 | v52 | v37)) {
              return result;
            }
          }
          uint64_t v51 = swift_getKeyPath();
          MEMORY[0x270FA5388](v51);
          sub_2269B8490();
          return swift_release();
        }
      }
    }
  }
  return result;
}

uint64_t sub_2269A7B70(__n128 a1, __n128 a2)
{
  uint64_t v3 = *(void *)(v2 + 64);
  switch(v3)
  {
    case 2:
      a1.n128_f64[0] = (1.0 - a1.n128_f64[0]) * *(double *)(v2 + 16);
      a2.n128_f64[0] = (1.0 - a2.n128_f64[0]) * *(double *)(v2 + 24);
      break;
    case 3:
      double v6 = *(double *)(v2 + 16) * a2.n128_f64[0];
      a2.n128_f64[0] = (1.0 - a1.n128_f64[0]) * *(double *)(v2 + 24);
      a1.n128_f64[0] = v6;
      break;
    case 4:
      double v4 = (1.0 - a2.n128_f64[0]) * *(double *)(v2 + 16);
      a2.n128_f64[0] = *(double *)(v2 + 24) * a1.n128_f64[0];
      a1.n128_f64[0] = v4;
      break;
    default:
      a1.n128_f64[0] = *(double *)(v2 + 16) * a1.n128_f64[0];
      a2.n128_f64[0] = *(double *)(v2 + 24) * a2.n128_f64[0];
      break;
  }
  return CGRectMake(a1, a2);
}

uint64_t sub_2269A7BF0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  sub_22696B8F0(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent, &qword_268149578);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  uint64_t v2 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v4 = sub_2269B84E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(v3, v4);
}

uint64_t sub_2269A7D44()
{
  sub_22697AA38();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  sub_22696B8F0(v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__previousEvent, &qword_268149578);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  uint64_t v2 = sub_2269B82E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v4 = sub_2269B84E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_2269A7EAC()
{
  sub_2269A7D44();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2269A7F04()
{
  return type metadata accessor for HoverTypingStore();
}

uint64_t type metadata accessor for HoverTypingStore()
{
  uint64_t result = qword_268149560;
  if (!qword_268149560) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2269A7F58()
{
  sub_2269A8100();
  if (v0 <= 0x3F)
  {
    sub_2269B82E0();
    if (v1 <= 0x3F)
    {
      sub_2269B84E0();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_2269A8100()
{
  if (!qword_268149570)
  {
    type metadata accessor for HoverTextPresentationEvent();
    unint64_t v0 = sub_2269B9240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268149570);
    }
  }
}

uint64_t sub_2269A8158()
{
  return sub_22699EFE4();
}

uint64_t sub_2269A817C()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible);
}

uint64_t sub_2269A8224()
{
  return sub_2269A824C();
}

uint64_t sub_2269A8238()
{
  return sub_2269A824C();
}

uint64_t sub_2269A824C()
{
  return swift_retain();
}

uint64_t sub_2269A82F4()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode);
}

double sub_2269A839C()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  return *(double *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect);
}

uint64_t sub_2269A844C()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v0, sel_hoverTextTypingDisplayMode);

  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B8490();
  return swift_release();
}

uint64_t sub_2269A854C()
{
  return sub_22699FF78();
}

uint64_t sub_2269A8570()
{
  return sub_2269A0860();
}

uint64_t sub_2269A8594()
{
  return sub_2269A6B00();
}

uint64_t sub_2269A85B8(char a1)
{
  return sub_2269A6E84(a1);
}

uint64_t sub_2269A85DC(void *a1)
{
  return sub_2269A732C(a1);
}

void sub_2269A8600(char a1)
{
}

void sub_2269A8624(uint64_t a1)
{
}

uint64_t sub_2269A8648(char a1)
{
  return sub_2269A31D0(a1 & 1);
}

uint64_t sub_2269A8670()
{
  return sub_2269A3810();
}

void sub_2269A869C()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayMode) = *(void *)(v0 + 24);
}

uint64_t sub_2269A86B4()
{
  return sub_22699CFC4();
}

__n128 sub_2269A86E8()
{
  uint64_t v1 = *(void *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__anchorRect;
  __n128 result = *(__n128 *)(v0 + 24);
  long long v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)uint64_t v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_2269A8708@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_22699E5C4(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__backgroundColor, a2);
}

uint64_t sub_2269A8730()
{
  return sub_22699C3D0();
}

uint64_t sub_2269A8764()
{
  return sub_2269673FC(&OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__backgroundColor);
}

uint64_t sub_2269A8784@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_22699E5C4(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor, a2);
}

uint64_t sub_2269A87AC()
{
  return sub_22699C3D0();
}

uint64_t sub_2269A87E0()
{
  return sub_2269673FC(&OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
}

uint64_t sub_2269A8804()
{
  return sub_22699D32C();
}

uint64_t sub_2269A8838()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t result = sub_22699ECC4(v2);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isVisible) = v2;
  return result;
}

uint64_t sub_2269A8888()
{
  return sub_22699D32C();
}

uint64_t sub_2269A88C0()
{
  return sub_22699CA18();
}

double sub_2269A88F4()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 136) = result;
  return result;
}

uint64_t sub_2269A8908()
{
  return sub_22699D32C();
}

uint64_t sub_2269A8948()
{
  return sub_22699CA18();
}

double sub_2269A897C()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 264) = result;
  return result;
}

uint64_t sub_2269A8990()
{
  return sub_22699CA18();
}

double sub_2269A89D4()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 248) = result;
  return result;
}

void sub_2269A89E4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 258) = *(unsigned char *)(v0 + 24);
}

double sub_2269A89FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2269B82E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  double v6 = (char *)v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v85 = v1;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  unint64_t v7 = (char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  uint64_t v81 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v81(v5, v7, v2);
  swift_getKeyPath();
  uint64_t v83 = v6;
  uint64_t v84 = v1;
  sub_2269B84A0();
  swift_release();
  uint64_t v8 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  id v9 = *(id *)((char *)v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_226968324(v9);
  double v11 = v10;

  CGFloat v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v82 = v3 + 8;
  v12(v5, v2);
  double v13 = v11 + 2.0;
  __n128 v14 = self;
  id v15 = objc_msgSend(v14, sel_mainScreen);
  objc_msgSend(v15, sel_bounds);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v86.origin.CGFloat x = UIEdgeInsetsInsetRect(v17, v19, v21, v23, v1[4], v1[5]);
  if (v13 >= CGRectGetWidth(v86) * 0.85)
  {
    uint64_t v77 = v8;
    uint64_t v78 = v5;
    id v38 = objc_msgSend(v14, sel_mainScreen);
    objc_msgSend(v38, sel_bounds);
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;

    v88.origin.CGFloat x = UIEdgeInsetsInsetRect(v40, v42, v44, v46, v1[4], v1[5]);
    double v47 = CGRectGetWidth(v88) * 0.85 * 0.5;
    swift_getKeyPath();
    uint64_t v84 = v1;
    sub_2269B84A0();
    swift_release();
    if (v1[31] > 0.0)
    {
      id v79 = v14;
      char v80 = v12;
      swift_getKeyPath();
      uint64_t v84 = v1;
      sub_2269B84A0();
      swift_release();
      double v47 = v47 - v1[31];
      int v48 = v78;
      if (v47 < 0.0)
      {
        swift_getKeyPath();
        uint64_t v84 = v1;
        sub_2269B84A0();
        swift_release();
        v81(v48, v7, v2);
        swift_getKeyPath();
        uint64_t v84 = v1;
        sub_2269B84A0();
        swift_release();
        id v49 = *(id *)((char *)v1 + v77);
        sub_226968324(v49);
        double v51 = v50;

        v80(v48, v2);
        swift_getKeyPath();
        uint64_t v84 = v1;
        sub_2269B84A0();
        swift_release();
        double v52 = v51 + 2.0 - v1[31];
        id v53 = [v79 (SEL)0x2647BFE7CLL];
        objc_msgSend(v53, sel_bounds);
        double v55 = v54;
        double v57 = v56;
        double v59 = v58;
        double v61 = v60;

        v89.origin.CGFloat x = UIEdgeInsetsInsetRect(v55, v57, v59, v61, v1[4], v1[5]);
        double v47 = 0.0;
        if (v52 < CGRectGetWidth(v89) * 0.85 * 0.5)
        {
          swift_getKeyPath();
          uint64_t v84 = v1;
          sub_2269B84A0();
          swift_release();
          v81(v48, v7, v2);
          swift_getKeyPath();
          uint64_t v84 = v1;
          sub_2269B84A0();
          swift_release();
          id v62 = *(id *)((char *)v1 + v77);
          sub_226968324(v62);
          double v64 = v63;

          v80(v48, v2);
          double v65 = v64 + 2.0;
          id v66 = [v79 (SEL)0x2647BFE7CLL];
          objc_msgSend(v66, sel_bounds);
          double v68 = v67;
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;

          v90.origin.CGFloat x = UIEdgeInsetsInsetRect(v68, v70, v72, v74, v1[4], v1[5]);
          double v75 = v65 + CGRectGetWidth(v90) * -0.85 * 0.5;
          swift_getKeyPath();
          uint64_t v84 = v1;
          sub_2269B84A0();
          swift_release();
          double v47 = v75 - v1[31];
        }
      }
    }
    return v47 + -1.0;
  }
  else
  {
    swift_getKeyPath();
    id v79 = v14;
    char v80 = v12;
    uint64_t v84 = v1;
    sub_2269B84A0();
    swift_release();
    v81(v5, v7, v2);
    swift_getKeyPath();
    uint64_t v84 = v1;
    sub_2269B84A0();
    swift_release();
    id v24 = *(id *)((char *)v1 + v8);
    sub_226968324(v24);
    double v26 = v25;

    v80(v5, v2);
    double v27 = v26 + 2.0;
    id v28 = objc_msgSend(v79, sel_mainScreen);
    objc_msgSend(v28, sel_bounds);
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    v87.origin.CGFloat x = UIEdgeInsetsInsetRect(v30, v32, v34, v36, v1[4], v1[5]);
    double v37 = v27 + CGRectGetWidth(v87) * -0.85 * 0.5;
    swift_getKeyPath();
    uint64_t v84 = v1;
    sub_2269B84A0();
    swift_release();
    if (v1[31] > 0.0)
    {
      swift_getKeyPath();
      uint64_t v84 = v1;
      sub_2269B84A0();
      swift_release();
      return v37 - v1[31];
    }
  }
  return v37;
}

void sub_2269A9214(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v28 = sub_2269B82E0();
  uint64_t v6 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v30 = v2;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v9 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
  double v10 = (const __CTFont *)*(id *)(v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  CTFontGetAscent(v10);
  CTFontGetDescent(v10);
  CTFontGetLeading(v10);

  v11.n128_u64[0] = 0;
  v12.n128_u64[0] = 0;
  double v13 = CGRectMake(v11, v12);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CF0]), sel_initWithFrame_, v13, v14, v15, v16);
  sub_226978330(0, &qword_268149598);
  swift_getKeyPath();
  uint64_t v30 = v2;
  sub_2269B84A0();
  swift_release();
  uint64_t v18 = v2 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v18, v28);
  double v19 = (void *)sub_2269B9200();
  objc_msgSend(v17, sel_setAttributedText_, v19);

  swift_getKeyPath();
  uint64_t v29 = v3;
  sub_2269B84A0();
  swift_release();
  objc_msgSend(v17, sel_setFont_, *(void *)(v3 + v9));
  objc_msgSend(v17, sel_setNeedsLayout);
  objc_msgSend(v17, sel_layoutIfNeeded);
  id v20 = objc_msgSend(v17, sel_characterRangeAtPoint_, a1, a2);
  if (v20)
  {
    id v21 = v20;
    id v22 = objc_msgSend(v17, sel_beginningOfDocument);
    id v23 = objc_msgSend(v21, sel_start);
    id v24 = objc_msgSend(v17, sel_offsetFromPosition_toPosition_, v22, v23);

    id v25 = objc_msgSend(v21, sel_start);
    id v26 = objc_msgSend(v21, sel_end);
    objc_msgSend(v17, sel_offsetFromPosition_toPosition_, v25, v26);

    if (__OFADD__(v24, 1))
    {
      __break(1u);
    }
    else
    {
    }
  }
  else
  {
  }
}

uint64_t sub_2269A960C()
{
  return sub_22699DE10();
}

__n128 sub_2269A9640()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 40);
  __n128 result = *(__n128 *)(v0 + 24);
  *(__n128 *)(v1 + 280) = result;
  *(unsigned char *)(v1 + 296) = v2;
  return result;
}

uint64_t sub_2269A9660()
{
  return sub_22699C3D0();
}

uint64_t sub_2269A9694(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v12 = sub_2269B8E40();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  double v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_2269B8E70();
  uint64_t v16 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_setAXAttribute_withRange_, 2005, a2, a3);
  sub_226978330(0, (unint64_t *)&qword_268149200);
  double v19 = (void *)sub_2269B91D0();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a4;
  *(double *)(v20 + 24) = a5;
  *(double *)(v20 + 32) = a6;
  aBlock[4] = sub_2269AA044;
  void aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226982998;
  aBlock[3] = &block_descriptor_273;
  id v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_2269B8E50();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2269AC3E4(&qword_268149128, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
  sub_22696B7B8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
  sub_2269B92F0();
  MEMORY[0x22A65CBA0](0, v18, v15, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v24);
}

uint64_t sub_2269A99B4(uint64_t a1)
{
  swift_getKeyPath();
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  CGRectGetMinX(*(CGRect *)(a1 + 152));
  if (qword_268148920 != -1) {
    swift_once();
  }
  if (qword_268148918 != -1) {
    swift_once();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_2269B8490();
  swift_release();
  swift_getKeyPath();
  sub_2269B84A0();
  swift_release();
  swift_retain();
  sub_22696D264();
  return swift_release();
}

void sub_2269A9BE4(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_primaryApp);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_firstResponder);

    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_uiElement);

      if (v7)
      {
        objc_msgSend(v7, sel_setAXAttribute_withRange_, 2005, a1, a2);
      }
    }
  }
}

uint64_t sub_2269A9CCC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2269A9CDC()
{
  sub_2269A9BE4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_2269A9CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = type metadata accessor for HoverTextPresentationEvent();
  v4[4] = swift_task_alloc();
  sub_2269B9080();
  v4[5] = sub_2269B9070();
  uint64_t v6 = sub_2269B9060();
  return MEMORY[0x270FA2498](sub_2269A9DC4, v6, v5);
}

uint64_t sub_2269A9DC4()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (int *)v0[3];
  swift_release();
  *(unsigned char *)(v1 + 50) = 12;
  sub_2269B8250();
  uint64_t v3 = (void *)(v1 + v2[8]);
  *uint64_t v3 = 0;
  v3[1] = 0;
  id v4 = (_OWORD *)(v1 + v2[9]);
  *id v4 = 0u;
  v4[1] = 0u;
  uint64_t v5 = v1 + v2[10];
  *(void *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 8) = 1;
  uint64_t v6 = (void *)(v1 + v2[11]);
  *uint64_t v6 = 0;
  v6[1] = 0;
  *(void *)(v1 + v2[12]) = 0;
  *(void *)(v1 + v2[13]) = 0;
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 8;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 48) = 320;
  sub_2269A1428(v1);
  sub_2269675AC(v1);
  swift_task_dealloc();
  id v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2269A9EC8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2269A9F08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_226990F98;
  return sub_2269A9CFC(a1, v4, v5, v6);
}

uint64_t sub_2269A9FBC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2269A9FFC()
{
  return sub_2269A9694(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56));
}

uint64_t sub_2269AA00C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2269AA044()
{
  return sub_2269A99B4(*(void *)(v0 + 16));
}

uint64_t sub_2269AA054()
{
  return sub_22699CFC4();
}

uint64_t sub_2269AA088()
{
  uint64_t v0 = sub_2269B82E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = (double *)result;
    sub_22699964C();
    double v7 = v6 + 10.0;
    swift_getKeyPath();
    double v45 = v5;
    sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
    sub_2269B84A0();
    swift_release();
    uint64_t v8 = (char *)v5 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    double v43 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    v43(v3, v8, v0);
    swift_getKeyPath();
    double v44 = v5;
    sub_2269B84A0();
    swift_release();
    uint64_t v41 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont;
    id v9 = *(id *)((char *)v5 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
    sub_226968324(v9);
    double v11 = v10;

    double v42 = *(void (**)(char *, uint64_t))(v1 + 8);
    v42(v3, v0);
    double v12 = v11 + 2.0;
    uint64_t v13 = self;
    id v14 = objc_msgSend(v13, sel_mainScreen);
    objc_msgSend(v14, sel_bounds);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    v46.origin.CGFloat x = UIEdgeInsetsInsetRect(v16, v18, v20, v22, v5[4], v5[5]);
    if (v7 <= v12 + CGRectGetWidth(v46) * -0.85)
    {
      swift_getKeyPath();
      double v44 = v5;
      sub_2269B84A0();
      swift_release();
      double v44 = v5;
      swift_getKeyPath();
      sub_2269B84C0();
      swift_release();
      v5[33] = v5[33] + 10.0;
      double v44 = v5;
      swift_getKeyPath();
      sub_2269B84B0();
    }
    else
    {
      swift_getKeyPath();
      double v44 = v5;
      sub_2269B84A0();
      swift_release();
      v43(v3, v8, v0);
      swift_getKeyPath();
      double v44 = v5;
      sub_2269B84A0();
      swift_release();
      id v23 = *(id *)((char *)v5 + v41);
      sub_226968324(v23);
      double v25 = v24;

      v42(v3, v0);
      double v26 = v25 + 2.0;
      id v27 = objc_msgSend(v13, sel_mainScreen);
      objc_msgSend(v27, sel_bounds);
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;

      v47.origin.CGFloat x = UIEdgeInsetsInsetRect(v29, v31, v33, v35, v5[4], v5[5]);
      double v36 = v26 + CGRectGetWidth(v47) * -0.85;
      double v37 = v36 - sub_2269997A4();
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      *(&v41 - 2) = (uint64_t)v5;
      *((double *)&v41 - 1) = v37;
      double v44 = v5;
      sub_2269B8490();
    }
    swift_release();
    sub_2269AA5FC();
    double v40 = v39;
    swift_getKeyPath();
    double v44 = v5;
    sub_2269B84A0();
    swift_release();
    sub_226999E2C(0, 1, v40, v5[33]);
    return swift_release();
  }
  return result;
}

uint64_t sub_2269AA5FC()
{
  uint64_t v1 = v0;
  double v32 = (void (*)(char *, uint64_t))sub_2269B8550();
  uint64_t v2 = *((void *)v32 - 1);
  MEMORY[0x270FA5388](v32);
  double v31 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2269B8370();
  MEMORY[0x270FA5388](v4 - 8);
  double v30 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2269B8240();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_2269B82E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  double v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v11 = v0 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore___observationRegistrar;
  uint64_t v39 = v1;
  sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 360) & 1) == 0)
  {
    uint64_t v29 = v2;
    uint64_t v13 = *(void *)(v1 + 344);
    uint64_t v27 = *(void *)(v1 + 352);
    swift_getKeyPath();
    uint64_t v39 = v1;
    uint64_t v28 = v11;
    sub_2269B84A0();
    swift_release();
    uint64_t v14 = v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__displayText;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
    sub_2269B81F0();
    double v15 = *(void (**)(char *, uint64_t))(v8 + 8);
    v15(v10, v7);
    sub_2269AC3E4(&qword_268149590, MEMORY[0x263F066D8]);
    sub_2269B8FD0();
    uint64_t result = sub_2269B8F60();
    if (result < 0)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      return result;
    }
    if ((v13 & 0x8000000000000000) == 0 && result >= v13)
    {
      sub_2269B8F70();
      sub_2269B8FE0();
      double v32 = v15;
      swift_bridgeObjectRelease();
      sub_2269B8360();
      sub_2269B8300();
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_2269B84A0();
      swift_release();
      id v16 = *(id *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
      sub_226968324(v16);

      v32(v10, v7);
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_2269B84A0();
      return swift_release();
    }
    double v30 = (char *)v13;
    uint64_t v17 = sub_2269B8530();
    swift_beginAccess();
    uint64_t v18 = v29;
    double v20 = v31;
    double v19 = v32;
    (*(void (**)(char *, uint64_t, void (*)(char *, uint64_t)))(v29 + 16))(v31, v17, v32);
    swift_bridgeObjectRetain();
    double v21 = sub_2269B8540();
    os_log_type_t v22 = sub_2269B9140();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v37 = v28;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t result = sub_2269B8F60();
      if ((result & 0x8000000000000000) == 0)
      {
        uint64_t v35 = result;
        uint64_t v36 = 0;
        uint64_t v33 = 0;
        unint64_t v34 = 0xE000000000000000;
        sub_2269B93E0();
        sub_2269B8F80();
        sub_2269B93E0();
        uint64_t v33 = sub_22697609C(v33, v34, &v37);
        sub_2269B9290();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2080;
        uint64_t v24 = sub_2269B9230();
        uint64_t v33 = sub_22697609C(v24, v25, &v37);
        sub_2269B9290();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22695C000, v21, v22, "Display string range %s does not contain selected text range %s", (uint8_t *)v23, 0x16u);
        uint64_t v26 = v28;
        swift_arrayDestroy();
        MEMORY[0x22A65DA10](v26, -1, -1);
        MEMORY[0x22A65DA10](v23, -1, -1);

        return (*(uint64_t (**)(char *, void *))(v18 + 8))(v31, v32);
      }
      goto LABEL_12;
    }

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, void *))(v18 + 8))(v20, v19);
  }
  return result;
}

uint64_t sub_2269AACB4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    sub_22699964C();
    if (v2 + -10.0 >= 0.0)
    {
      swift_getKeyPath();
      sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
      sub_2269B84A0();
      swift_release();
      swift_getKeyPath();
      sub_2269B84C0();
      swift_release();
      *(double *)(v1 + 264) = *(double *)(v1 + 264) + -10.0;
      swift_getKeyPath();
      sub_2269B84B0();
    }
    else
    {
      sub_2269997A4();
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
      sub_2269B8490();
    }
    swift_release();
    sub_2269AA5FC();
    double v5 = v4;
    swift_getKeyPath();
    sub_2269AC3E4((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
    sub_2269B84A0();
    swift_release();
    sub_226999E2C(0, 1, v5, *(double *)(v1 + 264));
    return swift_release();
  }
  return result;
}

uint64_t sub_2269AAF64(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t), uint64_t a8)
{
  uint64_t v70 = a8;
  double v65 = a3;
  uint64_t v63 = a2;
  uint64_t v12 = sub_2269B8240();
  uint64_t v64 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E80);
  MEMORY[0x270FA5388](v73);
  double v69 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v62 - v17;
  uint64_t v19 = sub_2269B8290();
  uint64_t v72 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  double v21 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v62 - v23;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E98);
  MEMORY[0x270FA5388](v66);
  double v67 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v68 = (uint64_t)&v62 - v27;
  *(void *)&long long v76 = a5;
  *((void *)&v76 + 1) = a6;
  swift_bridgeObjectRetain();
  sub_2269B9330();
  uint64_t v28 = *(void *)(a1 + 16);
  double v71 = a7;
  if (v28 && (unint64_t v29 = sub_2269B5770((uint64_t)v78), (v30 & 1) != 0))
  {
    sub_22696DB9C(*(void *)(a1 + 56) + 32 * v29, (uint64_t)&v76);
  }
  else
  {
    long long v76 = 0u;
    long long v77 = 0u;
  }
  sub_2269ABF5C((uint64_t)v78);
  uint64_t v31 = *((void *)&v77 + 1);
  uint64_t result = sub_22696B8F0((uint64_t)&v76, &qword_2681493A0);
  if (v31)
  {
    uint64_t v74 = a5;
    uint64_t v75 = a6;
    swift_bridgeObjectRetain();
    sub_2269B9330();
    if (*(void *)(a1 + 16) && (unint64_t v33 = sub_2269B5770((uint64_t)v78), (v34 & 1) != 0))
    {
      sub_22696DB9C(*(void *)(a1 + 56) + 32 * v33, (uint64_t)&v76);
    }
    else
    {
      long long v76 = 0u;
      long long v77 = 0u;
    }
    sub_2269ABF5C((uint64_t)v78);
    if (!*((void *)&v77 + 1)) {
      return sub_22696B8F0((uint64_t)&v76, &qword_2681493A0);
    }
    uint64_t result = swift_dynamicCast();
    if ((result & 1) != 0 && v74 == 1)
    {
      if (sub_2269B8F30() == a5 && v35 == a6)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        sub_2269B8200();
        sub_2269B82B0();
        sub_2269AC3E4(&qword_268148EA0, MEMORY[0x263F067E8]);
        uint64_t result = sub_2269B8EE0();
        uint64_t v37 = v72;
        if (result)
        {
          uint64_t v38 = v73;
          uint64_t v39 = &v18[*(int *)(v73 + 48)];
          double v40 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
          v40(v18, v24, v19);
          v40(v39, v21, v19);
          uint64_t v41 = *(int *)(v38 + 48);
          double v42 = v69;
          double v43 = &v69[v41];
          double v44 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
          v44(v69, v18, v19);
          v44(v43, v39, v19);
          uint64_t v45 = (uint64_t)v67;
          v40(v67, v42, v19);
          CGRect v46 = *(void (**)(char *, uint64_t))(v37 + 8);
          v46(v43, v19);
          CGRect v47 = &v42[*(int *)(v73 + 48)];
          v40(v42, v18, v19);
          v40(v47, v39, v19);
          v40((char *)(v45 + *(int *)(v66 + 36)), v47, v19);
          v46(v42, v19);
          uint64_t v48 = v68;
          sub_2269ABFB0(v45, v68);
          v71(v48);
          return sub_22696B8F0(v48, &qword_268148E98);
        }
        __break(1u);
        goto LABEL_24;
      }
      char v36 = sub_2269B94F0();
      swift_bridgeObjectRelease();
      if (v36) {
        goto LABEL_18;
      }
      sub_2269B81F0();
      sub_2269B8200();
      sub_2269B8220();
      uint64_t v49 = v72;
      double v50 = *(void (**)(char *, uint64_t))(v72 + 8);
      uint64_t v63 = v72 + 8;
      id v62 = v50;
      v50(v21, v19);
      double v51 = *(void (**)(char *, uint64_t))(v64 + 8);
      v51(v14, v12);
      sub_2269B81F0();
      sub_2269B8220();
      v51(v14, v12);
      sub_2269AC3E4(&qword_268148EA0, MEMORY[0x263F067E8]);
      uint64_t result = sub_2269B8EE0();
      if ((result & 1) == 0)
      {
LABEL_24:
        __break(1u);
        return result;
      }
      uint64_t v52 = v73;
      id v53 = &v18[*(int *)(v73 + 48)];
      double v54 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
      v54(v18, v24, v19);
      double v65 = v53;
      v54(v53, v21, v19);
      double v55 = v69;
      double v56 = &v69[*(int *)(v52 + 48)];
      v54(v69, v18, v19);
      v54(v56, v53, v19);
      double v57 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
      uint64_t v58 = (uint64_t)v67;
      v57(v67, v55, v19);
      double v59 = v62;
      v62(v56, v19);
      double v60 = &v55[*(int *)(v73 + 48)];
      v57(v55, v18, v19);
      v57(v60, v65, v19);
      v57((char *)(v58 + *(int *)(v66 + 36)), v60, v19);
      v59(v55, v19);
      uint64_t v61 = v68;
      sub_2269ABFB0(v58, v68);
      v71(v61);
      sub_22696B8F0(v61, &qword_268148E98);
      v59(v21, v19);
      return ((uint64_t (*)(char *, uint64_t))v59)(v24, v19);
    }
  }
  return result;
}

uint64_t sub_2269AB7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v9 = sub_2269B8EC0();
  swift_retain();
  v8(v9, a3, a4, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2269AB868()
{
  return sub_22699CA18();
}

double sub_2269AB89C()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 128) = result;
  return result;
}

__n128 sub_2269AB8AC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __n128 result = *(__n128 *)(v0 + 24);
  long long v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)(v1 + 152) = result;
  *(_OWORD *)(v1 + 168) = v3;
  return result;
}

uint64_t sub_2269AB8C4()
{
  *(void *)(*(void *)(v0 + 16) + 96) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_2269AB900()
{
  return sub_22699E1C8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2269AB91C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2269AB988()
{
  return sub_22699D32C();
}

uint64_t sub_2269AB9C0()
{
  return sub_22699CFC4();
}

uint64_t sub_2269ABA08()
{
  return sub_22699D32C();
}

void sub_2269ABA3C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 256) = *(unsigned char *)(v0 + 24);
}

__n128 sub_2269ABA4C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __n128 result = *(__n128 *)(v0 + 24);
  long long v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)(v1 + 216) = result;
  *(_OWORD *)(v1 + 232) = v3;
  return result;
}

void sub_2269ABA64()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 257) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2269ABA7C()
{
  uint64_t v1 = v0[4];
  double v2 = (void *)(v0[2] + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__identifier);
  void *v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2269ABAC8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_22699E5C4(a1, &OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor, a2);
}

uint64_t sub_2269ABAF0()
{
  return sub_22699C3D0();
}

void sub_2269ABB24()
{
}

void sub_2269ABB44()
{
}

uint64_t sub_2269ABB6C()
{
  return 8;
}

uint64_t sub_2269ABB78()
{
  return swift_release();
}

uint64_t sub_2269ABB80(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2269ABB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2269A6050(a1, a2, a3, &qword_2681495C0) & 1;
}

uint64_t sub_2269ABBB0(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2681495C0);
}

void *sub_2269ABBBC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_2269ABBC8()
{
}

void sub_2269ABBE8()
{
}

uint64_t sub_2269ABC10()
{
  return 8;
}

uint64_t sub_2269ABC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2269A6050(a1, a2, a3, &qword_2681495B8) & 1;
}

uint64_t sub_2269ABC40(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2681495B8);
}

void sub_2269ABC50(uint64_t a1)
{
  sub_2269A55A4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_2269ABC64(uint64_t a1)
{
  sub_2269A60A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t objectdestroy_340Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2269ABCB4(uint64_t a1)
{
  return sub_2269A68E4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t objectdestroy_343Tm()
{
  uint64_t v1 = sub_2269B82E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2269ABD94(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  sub_2269B82E0();
  return sub_2269AAF64(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void (**)(uint64_t))(v4 + 32), *(void *)(v4 + 40));
}

void sub_2269ABE34()
{
}

unint64_t sub_2269ABE54()
{
  unint64_t result = qword_2681495A8;
  if (!qword_2681495A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681495A8);
  }
  return result;
}

void sub_2269ABEA8()
{
}

uint64_t sub_2269ABED0()
{
  return 8;
}

uint64_t sub_2269ABEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2269A6050(a1, a2, a3, &qword_2681495B0) & 1;
}

uint64_t sub_2269ABF00(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_2681495B0);
}

uint64_t sub_2269ABF10()
{
  return sub_22699C3D0();
}

uint64_t sub_2269ABF44()
{
  return sub_2269AC114();
}

uint64_t sub_2269ABF5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269ABFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148E98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2269AC01C()
{
  return sub_22699C3D0();
}

uint64_t sub_2269AC050()
{
  return sub_2269AC0D8();
}

uint64_t sub_2269AC068()
{
  return sub_2269673FC(&OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__textColor);
}

uint64_t sub_2269AC08C()
{
  return sub_22699C3D0();
}

uint64_t sub_2269AC0C0()
{
  return sub_2269AC150();
}

uint64_t sub_2269AC0D8()
{
  *(void *)(*(void *)(v0 + 16) + 112) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_2269AC114()
{
  *(void *)(*(void *)(v0 + 16) + 120) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_2269AC150()
{
  *(void *)(*(void *)(v0 + 16) + 104) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_2269AC18C()
{
  return sub_2269A3994();
}

uint64_t sub_2269AC1BC()
{
  return sub_2269A3540(*(void *)(v0 + 16));
}

uint64_t sub_2269AC1DC()
{
  return sub_2269A3740();
}

uint64_t sub_2269AC1E8()
{
  return sub_22699DE10();
}

__n128 sub_2269AC21C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 40);
  __n128 result = *(__n128 *)(v0 + 24);
  *(__n128 *)(v1 + 344) = result;
  *(unsigned char *)(v1 + 360) = v2;
  return result;
}

uint64_t sub_2269AC238()
{
  return sub_2269A2B78();
}

void sub_2269AC254()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  *(void *)(v1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont) = v2;
  id v4 = v2;
}

uint64_t sub_2269AC294()
{
  return sub_2269A0B1C(v0);
}

uint64_t sub_2269AC29C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2269AC2E4()
{
  return sub_2269A0ED0(*(void *)(v0 + 16), *(id *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2269AC2F0()
{
  return sub_22699FF98(v0);
}

uint64_t sub_2269AC2F8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2269AC338()
{
  return sub_2269A03EC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_2269AC344()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__isKeyboardLanguageRTL) = *(unsigned char *)(v0 + 24);
}

void sub_2269AC364()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + 320);
  *(void *)(v1 + 320) = v2;
  id v4 = v2;
}

uint64_t sub_2269AC3A0()
{
  return sub_22699CA18();
}

double sub_2269AC3D4()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 272) = result;
  return result;
}

uint64_t sub_2269AC3E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2269AC42C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2269AC464()
{
  return sub_2269AACB4();
}

uint64_t sub_2269AC46C()
{
  return sub_2269AA088();
}

double sub_2269AC474()
{
  return sub_2269A88F4();
}

double sub_2269AC48C()
{
  return sub_2269AB89C();
}

double sub_2269AC4A4()
{
  return sub_2269A89D4();
}

double sub_2269AC4BC()
{
  return sub_2269AC3D4();
}

double sub_2269AC4D4()
{
  return sub_2269A897C();
}

uint64_t sub_2269AC4F4()
{
  return sub_2269A8838();
}

void sub_2269AC514()
{
}

double sub_2269AC560()
{
  *(void *)&double result = sub_2269A9640().n128_u64[0];
  return result;
}

double sub_2269AC578()
{
  *(void *)&double result = sub_2269AC21C().n128_u64[0];
  return result;
}

double sub_2269AC590()
{
  *(void *)&double result = sub_2269A86E8().n128_u64[0];
  return result;
}

void sub_2269AC5A8()
{
}

uint64_t sub_2269AC5EC()
{
  return sub_2269AB900();
}

double sub_2269AC604()
{
  *(void *)&double result = sub_2269ABA4C().n128_u64[0];
  return result;
}

void sub_2269AC61C()
{
}

void sub_2269AC634()
{
}

void sub_2269AC64C()
{
}

uint64_t destroy for HUDStyle()
{
  return swift_release();
}

uint64_t initializeWithCopy for HUDStyle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for HUDStyle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HUDStyle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for HUDStyle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HUDStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HUDStyle()
{
  return &type metadata for HUDStyle;
}

uint64_t sub_2269AC804()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2269AC820()
{
  qword_26814B840 = 0x4008000000000000;
}

uint64_t sub_2269AC830@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v109 = a3;
  double v110 = a2;
  uint64_t v106 = a1;
  uint64_t v105 = a5;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495D0);
  MEMORY[0x270FA5388](v108);
  uint64_t v102 = (uint64_t)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495D8);
  MEMORY[0x270FA5388](v103);
  uint64_t v104 = (uint64_t)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_2269B87D0();
  MEMORY[0x270FA5388](v107);
  uint64_t v11 = (double *)((char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495E0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495E8);
  MEMORY[0x270FA5388](v89);
  uint64_t v17 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495F0);
  MEMORY[0x270FA5388](v90);
  uint64_t v19 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681495F8);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v89 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v89 - v24;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149600);
  MEMORY[0x270FA5388](v91);
  uint64_t v27 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149608);
  MEMORY[0x270FA5388](v93);
  uint64_t v92 = (char *)&v89 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149610);
  MEMORY[0x270FA5388](v94);
  uint64_t v96 = (char *)&v89 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149618);
  MEMORY[0x270FA5388](v95);
  uint64_t v100 = (uint64_t)&v89 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149620);
  MEMORY[0x270FA5388](v97);
  uint64_t v101 = (char *)&v89 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149628);
  __n128 v32 = MEMORY[0x270FA5388](v99);
  uint64_t v98 = (uint64_t)&v89 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    char v34 = sub_2269B8970();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v19, v106, v12);
    uint64_t v35 = &v19[*(int *)(v90 + 36)];
    *uint64_t v35 = v34;
    *(_OWORD *)(v35 + 8) = 0u;
    *(_OWORD *)(v35 + 24) = 0u;
    v35[40] = 1;
    sub_22696B88C((uint64_t)v19, (uint64_t)v17, &qword_2681495F0);
    swift_storeEnumTagMultiPayload();
    sub_2269AD494();
    sub_22696B7B8(&qword_268149638, &qword_2681495E0);
    sub_2269B88E0();
    sub_22696B8F0((uint64_t)v19, &qword_2681495F0);
  }
  else
  {
    char v36 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16);
    v36(v15, v106, v12, v32);
    ((void (*)(char *, char *, uint64_t))v36)(v17, v15, v12);
    swift_storeEnumTagMultiPayload();
    sub_2269AD494();
    sub_22696B7B8(&qword_268149638, &qword_2681495E0);
    sub_2269B88E0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  sub_22696B7FC((uint64_t)v22, (uint64_t)v25, &qword_2681495F8);
  uint64_t v37 = v109;
  uint64_t v38 = *v110;
  *(void *)&long long v115 = v110;
  uint64_t v39 = *(uint64_t (**)(uint64_t, uint64_t))(v109 + 120);
  uint64_t v106 = v38;
  uint64_t v40 = v39(v38, v109);
  char v41 = sub_2269B8970();
  sub_22696B88C((uint64_t)v25, (uint64_t)v27, &qword_2681495F8);
  double v42 = &v27[*(int *)(v91 + 36)];
  *(void *)double v42 = v40;
  v42[8] = v41;
  sub_22696B8F0((uint64_t)v25, &qword_2681495F8);
  uint64_t v43 = v107;
  double v44 = (char *)v11 + *(int *)(v107 + 20);
  uint64_t v45 = *MEMORY[0x263F19860];
  uint64_t v46 = sub_2269B8860();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = (uint64_t)v27;
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 104);
  uint64_t v50 = v47 + 104;
  v49(v44, v45, v46);
  double *v11 = a6;
  v11[1] = a6;
  uint64_t v51 = (uint64_t)v92;
  uint64_t v52 = (uint64_t)&v92[*(int *)(v93 + 36)];
  sub_2269AD534((uint64_t)v11, v52);
  *(_WORD *)(v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268149640) + 36)) = 256;
  sub_22696B88C(v48, v51, &qword_268149600);
  sub_2269AD598((uint64_t)v11);
  sub_22696B8F0(v48, &qword_268149600);
  id v53 = (char *)v11 + *(int *)(v43 + 20);
  LODWORD(v93) = v45;
  uint64_t v91 = v46;
  uint64_t v90 = (uint64_t)v49;
  uint64_t v89 = v50;
  v49(v53, v45, v46);
  double *v11 = a6;
  v11[1] = a6;
  if (qword_268148918 != -1) {
    swift_once();
  }
  sub_2269B8650();
  uint64_t v54 = v102;
  sub_2269AD534((uint64_t)v11, v102);
  uint64_t v55 = v54 + *(int *)(v108 + 36);
  long long v56 = v113;
  *(_OWORD *)uint64_t v55 = v112;
  *(_OWORD *)(v55 + 16) = v56;
  *(void *)(v55 + 32) = v114;
  sub_2269AD598((uint64_t)v11);
  *(void *)&long long v115 = v110;
  uint64_t v57 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 96))(v106, v37);
  uint64_t v58 = v104;
  sub_22696B88C(v54, v104, &qword_2681495D0);
  uint64_t v59 = v103;
  *(void *)(v58 + *(int *)(v103 + 52)) = v57;
  *(_WORD *)(v58 + *(int *)(v59 + 56)) = 256;
  sub_22696B8F0(v54, &qword_2681495D0);
  uint64_t v60 = sub_2269B8D50();
  uint64_t v62 = v61;
  uint64_t v63 = (uint64_t)v96;
  uint64_t v64 = (uint64_t)&v96[*(int *)(v94 + 36)];
  sub_22696B88C(v58, v64, &qword_2681495D8);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149648);
  double v65 = (uint64_t *)(v64 + *(int *)(v94 + 36));
  *double v65 = v60;
  v65[1] = v62;
  sub_22696B88C(v51, v63, &qword_268149608);
  sub_22696B8F0(v58, &qword_2681495D8);
  sub_22696B8F0(v51, &qword_268149608);
  LOBYTE(v62) = sub_2269B8970();
  sub_2269B85E0();
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v74 = v100;
  sub_22696B88C(v63, v100, &qword_268149610);
  uint64_t v75 = v74 + *(int *)(v95 + 36);
  *(unsigned char *)uint64_t v75 = v62;
  *(void *)(v75 + 8) = v67;
  *(void *)(v75 + 16) = v69;
  *(void *)(v75 + 24) = v71;
  *(void *)(v75 + 32) = v73;
  *(unsigned char *)(v75 + 40) = 0;
  sub_22696B8F0(v63, &qword_268149610);
  double v76 = *(double *)&qword_26814B840 + a6;
  ((void (*)(char *, void, uint64_t))v90)((char *)v11 + *(int *)(v107 + 20), v93, v91);
  double *v11 = v76;
  v11[1] = v76;
  sub_2269B8650();
  sub_2269AD534((uint64_t)v11, v54);
  uint64_t v77 = v54 + *(int *)(v108 + 36);
  long long v78 = v116;
  *(_OWORD *)uint64_t v77 = v115;
  *(_OWORD *)(v77 + 16) = v78;
  *(void *)(v77 + 32) = v117;
  sub_2269AD598((uint64_t)v11);
  uint64_t v79 = sub_2269B8B70();
  sub_22696B88C(v54, v58, &qword_2681495D0);
  *(void *)(v58 + *(int *)(v59 + 52)) = v79;
  *(_WORD *)(v58 + *(int *)(v59 + 56)) = 256;
  sub_22696B8F0(v54, &qword_2681495D0);
  uint64_t v80 = sub_2269B8D50();
  uint64_t v82 = v81;
  uint64_t v83 = (uint64_t)v101;
  uint64_t v84 = (uint64_t)&v101[*(int *)(v97 + 36)];
  sub_22696B88C(v58, v84, &qword_2681495D8);
  uint64_t v85 = (uint64_t *)(v84 + *(int *)(v94 + 36));
  *uint64_t v85 = v80;
  v85[1] = v82;
  sub_22696B88C(v74, v83, &qword_268149618);
  sub_22696B8F0(v58, &qword_2681495D8);
  sub_22696B8F0(v74, &qword_268149618);
  os_log_type_t v111 = v110;
  uint64_t v86 = (*(uint64_t (**)(uint64_t))(v109 + 16))(v106);
  uint64_t v87 = v98;
  sub_22696B88C(v83, v98, &qword_268149620);
  *(void *)(v87 + *(int *)(v99 + 52)) = v86;
  sub_22696B8F0(v83, &qword_268149620);
  return sub_22696B7FC(v87, v105, &qword_268149628);
}

uint64_t sub_2269AD484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2269AC830(a1, *(void **)(v2 + 8), *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), a2, *(double *)v2);
}

unint64_t sub_2269AD494()
{
  unint64_t result = qword_268149630;
  if (!qword_268149630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681495F0);
    sub_22696B7B8(&qword_268149638, &qword_2681495E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149630);
  }
  return result;
}

uint64_t sub_2269AD534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2269B87D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2269AD598(uint64_t a1)
{
  uint64_t v2 = sub_2269B87D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2269AD5F4()
{
  return sub_22696B7B8(&qword_268149650, &qword_268149628);
}

ValueMetadata *type metadata accessor for HoverTypingCaretLayout()
{
  return &type metadata for HoverTypingCaretLayout;
}

uint64_t sub_2269AD640(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2269AD6B8(a1, a2 & 1, a5);
}

uint64_t sub_2269AD650(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2269AD9E4(a1, a2, a3, a4, a9, a10, *v10);
}

unint64_t sub_2269AD664()
{
  unint64_t result = qword_268149658;
  if (!qword_268149658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149658);
  }
  return result;
}

uint64_t sub_2269AD6B8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v39 = sub_2269B86F0();
  uint64_t v6 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2269B8760();
  sub_22696E660(&qword_268148DF0, MEMORY[0x263F18AB8]);
  uint64_t v9 = sub_2269B90D0();
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v11 = v9;
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_22696E6E8(0, v9 & ~(v9 >> 63), 0);
  uint64_t result = sub_2269B90C0();
  if ((v11 & 0x8000000000000000) == 0)
  {
    v36[1] = a1;
    int v37 = a2;
    uint64_t v13 = (void (**)(char *))(v6 + 16);
    uint64_t v14 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v38 = a3;
    do
    {
      uint64_t v15 = (void (*)(char *, void))sub_2269B9100();
      uint64_t v16 = v39;
      (*v13)(v8);
      v15(v41, 0);
      sub_2269B87C0();
      v41[0] = v17 & 1;
      char v40 = v18 & 1;
      sub_2269B86D0();
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      (*v14)(v8, v16);
      uint64_t v10 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22696E6E8(0, *(void *)(v10 + 16) + 1, 1);
        uint64_t v10 = v42;
      }
      unint64_t v24 = *(void *)(v10 + 16);
      unint64_t v23 = *(void *)(v10 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_22696E6E8(v23 > 1, v24 + 1, 1);
        uint64_t v10 = v42;
      }
      *(void *)(v10 + 16) = v24 + 1;
      uint64_t v25 = v10 + 16 * v24;
      *(void *)(v25 + 32) = v20;
      *(void *)(v25 + 40) = v22;
      sub_2269B90F0();
      --v11;
    }
    while (v11);
LABEL_9:
    uint64_t v26 = *(void *)(v10 + 16);
    if (v26)
    {
      if (v26 == 1)
      {
        uint64_t v27 = 0;
        double v28 = 0.0;
      }
      else
      {
        uint64_t v27 = v26 & 0x7FFFFFFFFFFFFFFELL;
        uint64_t v29 = (double *)(v10 + 56);
        double v28 = 0.0;
        uint64_t v30 = v26 & 0x7FFFFFFFFFFFFFFELL;
        do
        {
          double v31 = *(v29 - 2);
          double v32 = *v29;
          v29 += 4;
          double v28 = v28 + v31 + v32;
          v30 -= 2;
        }
        while (v30);
        if (v26 == v27) {
          return swift_bridgeObjectRelease();
        }
      }
      uint64_t v33 = v26 - v27;
      char v34 = (double *)(v10 + 16 * v27 + 40);
      do
      {
        double v35 = *v34;
        v34 += 2;
        double v28 = v28 + v35;
        --v33;
      }
      while (v33);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_2269AD9E4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268148DE8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_2269B86F0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v18 = &v22[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22696DC78((uint64_t)v14);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    return sub_22696E420((uint64_t)v14);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 32))(v18, v14, v15);
  swift_getKeyPath();
  uint64_t v23 = a7;
  sub_22696E660((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  v24.origin.CGFloat x = a1;
  v24.origin.CGFloat y = a2;
  v24.size.CGFloat width = a3;
  v24.size.CGFloat height = a4;
  CGRectGetMinY(v24);
  sub_2269B8DE0();
  sub_2269B87C0();
  v22[32] = v20 & 1;
  v22[24] = v21 & 1;
  sub_2269B86D0();
  v22[16] = 0;
  v22[8] = 0;
  sub_2269B86E0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t initializeBufferWithCopyOfBuffer for HoverTypingTextReplacementView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

void *assignWithCopy for HoverTypingTextReplacementView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HoverTypingTextReplacementView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for HoverTypingTextReplacementView()
{
  return &type metadata for HoverTypingTextReplacementView;
}

uint64_t sub_2269ADD60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2269ADD7C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2269AF234((unint64_t *)&qword_268148DC8, (void (*)(uint64_t))type metadata accessor for HoverTypingTextReplacementModel);
  sub_2269B84A0();
  swift_release();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2269ADE28()
{
  return swift_bridgeObjectRelease();
}

double sub_2269ADF08()
{
  double result = 20.0;
  xmmword_26814B850 = xmmword_2269BC950;
  return result;
}

uint64_t sub_2269ADF1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149668);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v23 - v12;
  uint64_t v14 = sub_2269B8880();
  sub_2269AE254(a1, (uint64_t)v24);
  *(_OWORD *)&v25[103] = v24[6];
  *(_OWORD *)&v25[119] = v24[7];
  *(_OWORD *)&v25[135] = v24[8];
  *(_OWORD *)&v25[151] = v24[9];
  *(_OWORD *)&v25[39] = v24[2];
  *(_OWORD *)&v25[55] = v24[3];
  *(_OWORD *)&v25[71] = v24[4];
  *(_OWORD *)&v25[87] = v24[5];
  *(_OWORD *)&v25[7] = v24[0];
  char v26 = 1;
  *(_OWORD *)&v25[23] = v24[1];
  *(void *)uint64_t v13 = sub_2269B8880();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149670);
  sub_2269AE4B8(a1, (uint64_t)&v13[*(int *)(v15 + 44)], a3, a4);
  sub_22696B88C((uint64_t)v13, (uint64_t)v10, &qword_268149668);
  *(_OWORD *)&v28[113] = *(_OWORD *)&v25[112];
  *(_OWORD *)&v28[129] = *(_OWORD *)&v25[128];
  *(_OWORD *)&v28[145] = *(_OWORD *)&v25[144];
  *(_OWORD *)&v28[49] = *(_OWORD *)&v25[48];
  *(_OWORD *)&v28[65] = *(_OWORD *)&v25[64];
  *(_OWORD *)&v28[81] = *(_OWORD *)&v25[80];
  *(_OWORD *)&v28[97] = *(_OWORD *)&v25[96];
  *(_OWORD *)&v28[1] = *(_OWORD *)v25;
  long long v27 = (unint64_t)v14;
  v28[0] = 1;
  *(void *)&v28[160] = *(void *)&v25[159];
  *(_OWORD *)&v28[17] = *(_OWORD *)&v25[16];
  *(_OWORD *)&v28[33] = *(_OWORD *)&v25[32];
  long long v16 = *(_OWORD *)&v28[128];
  *(_OWORD *)(a2 + 128) = *(_OWORD *)&v28[112];
  *(_OWORD *)(a2 + 144) = v16;
  *(_OWORD *)(a2 + 160) = *(_OWORD *)&v28[144];
  *(void *)(a2 + 176) = *(void *)&v28[160];
  long long v17 = *(_OWORD *)&v28[64];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v28[48];
  *(_OWORD *)(a2 + 80) = v17;
  long long v18 = *(_OWORD *)&v28[96];
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v28[80];
  *(_OWORD *)(a2 + 112) = v18;
  long long v19 = *(_OWORD *)v28;
  *(_OWORD *)a2 = v27;
  *(_OWORD *)(a2 + 16) = v19;
  long long v20 = *(_OWORD *)&v28[32];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v28[16];
  *(_OWORD *)(a2 + 48) = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149678);
  sub_22696B88C((uint64_t)v10, a2 + *(int *)(v21 + 48), &qword_268149668);
  sub_2269AF0D4((uint64_t)&v27);
  sub_22696B8F0((uint64_t)v13, &qword_268149668);
  sub_22696B8F0((uint64_t)v10, &qword_268149668);
  long long v38 = *(_OWORD *)&v25[112];
  long long v39 = *(_OWORD *)&v25[128];
  *(_OWORD *)char v40 = *(_OWORD *)&v25[144];
  long long v34 = *(_OWORD *)&v25[48];
  long long v35 = *(_OWORD *)&v25[64];
  long long v36 = *(_OWORD *)&v25[80];
  long long v37 = *(_OWORD *)&v25[96];
  long long v31 = *(_OWORD *)v25;
  long long v32 = *(_OWORD *)&v25[16];
  v29[0] = v14;
  v29[1] = 0;
  char v30 = 1;
  *(void *)&v40[15] = *(void *)&v25[159];
  long long v33 = *(_OWORD *)&v25[32];
  return sub_2269AF120((uint64_t)v29);
}

uint64_t sub_2269AE254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_retain();
  uint64_t v12 = sub_2269B8B70();
  sub_2269B8650();
  uint64_t v3 = sub_2269B8D50();
  uint64_t v5 = v4;
  if (qword_268148920 != -1) {
    swift_once();
  }
  sub_2269B8D50();
  sub_2269B8690();
  *(void *)&v21[0] = a1;
  *((void *)&v21[0] + 1) = v13;
  v21[1] = v14;
  v21[2] = v15;
  *(void *)&long long v22 = v12;
  WORD4(v22) = 256;
  *(void *)&long long v23 = v3;
  *((void *)&v23 + 1) = v5;
  *(void *)&long long v24 = v16;
  BYTE8(v24) = v17;
  *(void *)&long long v25 = v18;
  BYTE8(v25) = v19;
  long long v26 = v20;
  long long v27 = xmmword_2269BC960;
  char v29 = 1;
  *(_OWORD *)&v28[7] = v21[0];
  *(_OWORD *)&v28[71] = v23;
  *(_OWORD *)&v28[55] = v22;
  *(_OWORD *)&v28[39] = v15;
  *(_OWORD *)&v28[23] = v14;
  *(_OWORD *)&v28[135] = xmmword_2269BC960;
  *(_OWORD *)&v28[119] = v20;
  *(_OWORD *)&v28[103] = v25;
  *(_OWORD *)&v28[87] = v24;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  long long v6 = *(_OWORD *)&v28[112];
  *(_OWORD *)(a2 + 105) = *(_OWORD *)&v28[96];
  *(_OWORD *)(a2 + 121) = v6;
  *(_OWORD *)(a2 + 137) = *(_OWORD *)&v28[128];
  *(void *)(a2 + 152) = *(void *)&v28[143];
  long long v7 = *(_OWORD *)&v28[48];
  *(_OWORD *)(a2 + 41) = *(_OWORD *)&v28[32];
  *(_OWORD *)(a2 + 57) = v7;
  long long v8 = *(_OWORD *)&v28[80];
  *(_OWORD *)(a2 + 73) = *(_OWORD *)&v28[64];
  *(_OWORD *)(a2 + 89) = v8;
  long long v9 = *(_OWORD *)&v28[16];
  *(_OWORD *)(a2 + 9) = *(_OWORD *)v28;
  *(_OWORD *)(a2 + 25) = v9;
  v30[0] = a1;
  v30[1] = v13;
  long long v31 = v14;
  long long v32 = v15;
  uint64_t v33 = v12;
  __int16 v34 = 256;
  uint64_t v35 = v3;
  uint64_t v36 = v5;
  uint64_t v37 = v16;
  char v38 = v17;
  uint64_t v39 = v18;
  char v40 = v19;
  long long v41 = v20;
  long long v42 = xmmword_2269BC960;
  sub_2269AFD20((uint64_t)v21);
  return sub_2269AFD6C((uint64_t)v30);
}

uint64_t sub_2269AE4B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149680);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149688);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v28 - v16;
  *(void *)uint64_t v10 = sub_2269B8880();
  *((void *)v10 + 1) = 0;
  unsigned char v10[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149690);
  sub_2269AE9A0(a1, a3, a4);
  sub_22696B88C((uint64_t)v10, (uint64_t)v14, &qword_268149680);
  uint64_t v18 = &v14[*(int *)(v12 + 44)];
  *(void *)uint64_t v18 = 0x4024000000000000;
  *((void *)v18 + 1) = a1;
  *((void *)v18 + 2) = &off_26DA81868;
  v18[24] = 0;
  swift_retain();
  sub_22696B8F0((uint64_t)v10, &qword_268149680);
  sub_22696B7FC((uint64_t)v14, (uint64_t)v17, &qword_268149688);
  uint64_t v19 = swift_retain();
  sub_2269AE788(v19, (uint64_t)&v28);
  sub_22696B88C((uint64_t)v17, (uint64_t)v14, &qword_268149688);
  sub_22696B88C((uint64_t)v14, a2, &qword_268149688);
  uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268149698) + 48);
  *(_OWORD *)((char *)&v38[2] + 8) = v30;
  *(_OWORD *)((char *)&v38[6] + 8) = v34;
  uint64_t v21 = (_OWORD *)(a2 + v20);
  *(_OWORD *)((char *)&v38[7] + 8) = v35;
  *(_OWORD *)((char *)&v38[8] + 8) = v36;
  *(void *)&v38[0] = a1;
  *((void *)&v38[9] + 1) = v37;
  *(_OWORD *)((char *)&v38[3] + 8) = v31;
  *(_OWORD *)((char *)&v38[4] + 8) = v32;
  *(_OWORD *)((char *)&v38[5] + 8) = v33;
  *(_OWORD *)((char *)v38 + 8) = v28;
  *(_OWORD *)((char *)&v38[1] + 8) = v29;
  long long v22 = v38[7];
  v21[6] = v38[6];
  v21[7] = v22;
  long long v23 = v38[9];
  v21[8] = v38[8];
  v21[9] = v23;
  long long v24 = v38[3];
  v21[2] = v38[2];
  _OWORD v21[3] = v24;
  long long v25 = v38[5];
  void v21[4] = v38[4];
  v21[5] = v25;
  long long v26 = v38[1];
  *uint64_t v21 = v38[0];
  v21[1] = v26;
  sub_2269AF16C((uint64_t)v38);
  sub_22696B8F0((uint64_t)v17, &qword_268149688);
  long long v46 = v34;
  long long v47 = v35;
  long long v48 = v36;
  long long v42 = v30;
  long long v43 = v31;
  long long v44 = v32;
  long long v45 = v33;
  long long v40 = v28;
  uint64_t v39 = a1;
  uint64_t v49 = v37;
  long long v41 = v29;
  sub_2269AF1C4((uint64_t)&v39);
  return sub_22696B8F0((uint64_t)v14, &qword_268149688);
}

double sub_2269AE788@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_2269AF234((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor;
  uint64_t v5 = *(void *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
  swift_getKeyPath();
  uint64_t v16 = a1;
  swift_retain();
  sub_2269B84A0();
  swift_release();
  uint64_t v6 = *(void *)(a1 + v4);
  swift_retain();
  sub_2269B8650();
  uint64_t v7 = sub_2269B8D50();
  uint64_t v9 = v8;
  if (qword_268148920 != -1) {
    swift_once();
  }
  sub_2269B8D50();
  sub_2269B8690();
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v15;
  *(void *)(a2 + 40) = v6;
  *(_WORD *)(a2 + 48) = 256;
  *(void *)(a2 + 56) = v5;
  *(_WORD *)(a2 + 64) = 256;
  *(void *)(a2 + 72) = v7;
  *(void *)(a2 + 80) = v9;
  *(void *)(a2 + 88) = v16;
  *(unsigned char *)(a2 + 96) = v17;
  *(void *)(a2 + 104) = v18;
  *(unsigned char *)(a2 + 112) = v19;
  *(_OWORD *)(a2 + 120) = v20;
  double result = 0.0;
  *(_OWORD *)(a2 + 136) = xmmword_2269BC970;
  return result;
}

uint64_t sub_2269AE9A0(uint64_t a1, double a2, double a3)
{
  swift_getKeyPath();
  sub_2269AF234((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v6 = *(void *)(a1 + 96);
  swift_getKeyPath();
  sub_2269AF234((unint64_t *)&qword_268148DC8, (void (*)(uint64_t))type metadata accessor for HoverTypingTextReplacementModel);
  swift_retain();
  sub_2269B84A0();
  swift_release();
  uint64_t v7 = *(void *)(v6 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  sub_2269AFA9C(v7);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(double *)(v8 + 24) = a2;
  *(double *)(v8 + 32) = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_2269AFC8C;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681496A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681496A8);
  sub_22696B7B8(&qword_2681496B0, &qword_2681496A0);
  sub_22696B7B8(&qword_2681496B8, &qword_2681496A8);
  return sub_2269B8D10();
}

uint64_t sub_2269AEC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v39 = a1;
  long long v40 = a5;
  uint64_t v7 = sub_2269B8D00();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  MEMORY[0x270FA5388](v7);
  long long v36 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681496C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v41 = v9;
  uint64_t v42 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681496C8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v36 - v17;
  swift_getKeyPath();
  uint64_t v45 = a4;
  sub_2269AF234((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  swift_retain();
  uint64_t v44 = a3;
  swift_bridgeObjectRetain();
  sub_2269B84A0();
  swift_release();
  uint64_t v19 = *(void *)(a4 + 96);
  swift_getKeyPath();
  uint64_t v45 = v19;
  sub_2269AF234((unint64_t *)&qword_268148DC8, (void (*)(uint64_t))type metadata accessor for HoverTypingTextReplacementModel);
  swift_retain();
  sub_2269B84A0();
  swift_release();
  uint64_t v20 = *(void *)(v19 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v21 = *(void *)(v20 + 16);
  swift_bridgeObjectRelease();
  if (v21 - 1 == v39)
  {
    uint64_t v22 = 1;
    uint64_t v23 = v41;
  }
  else
  {
    long long v24 = v36;
    sub_2269B8CF0();
    swift_getKeyPath();
    uint64_t v45 = a4;
    sub_2269B84A0();
    swift_release();
    uint64_t v25 = *(void *)(a4 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__borderColor);
    swift_retain();
    char v26 = sub_2269B8970();
    uint64_t v28 = v37;
    uint64_t v27 = v38;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v12, v24, v38);
    uint64_t v29 = v41;
    long long v30 = &v12[*(int *)(v41 + 36)];
    *(void *)long long v30 = v25;
    v30[8] = v26;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v24, v27);
    sub_22696B7FC((uint64_t)v12, (uint64_t)v18, &qword_2681496C0);
    uint64_t v22 = 0;
    uint64_t v23 = v29;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v18, v22, 1, v23);
  sub_22696B88C((uint64_t)v18, (uint64_t)v15, &qword_2681496C8);
  long long v31 = v40;
  uint64_t v32 = v43;
  uint64_t v33 = v44;
  *long long v40 = a4;
  v31[1] = v32;
  v31[2] = v33;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681496D0);
  sub_22696B88C((uint64_t)v15, (uint64_t)v31 + *(int *)(v34 + 48), &qword_2681496C8);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22696B8F0((uint64_t)v18, &qword_2681496C8);
  sub_22696B8F0((uint64_t)v15, &qword_2681496C8);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2269AF070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  double v4 = *((double *)v1 + 1);
  double v5 = *((double *)v1 + 2);
  *a1 = sub_2269B8D50();
  a1[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149660);
  return sub_2269ADF1C(v3, (uint64_t)a1 + *(int *)(v7 + 44), v4, v5);
}

uint64_t sub_2269AF0D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269AF120(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269AF16C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269AF1C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269AF234(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2269AF27C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRectGetMinX(*(CGRect *)&a1);
  v9.origin.CGFloat x = a1;
  v9.origin.CGFloat y = a2;
  v9.size.CGFloat width = a3;
  v9.size.CGFloat height = a4;
  CGRectGetMinY(v9);
  sub_2269B8990();
  v10.origin.CGFloat x = a1;
  v10.origin.CGFloat y = a2;
  v10.size.CGFloat width = a3;
  v10.size.CGFloat height = a4;
  CGRectGetMidX(v10);
  v11.origin.CGFloat x = a1;
  v11.origin.CGFloat y = a2;
  v11.size.CGFloat width = a3;
  v11.size.CGFloat height = a4;
  CGRectGetMaxY(v11);
  sub_2269B89A0();
  v12.origin.CGFloat x = a1;
  v12.origin.CGFloat y = a2;
  v12.size.CGFloat width = a3;
  v12.size.CGFloat height = a4;
  CGRectGetMaxX(v12);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  CGRectGetMinY(v13);
  return sub_2269B89A0();
}

double sub_2269AF35C@<D0>(uint64_t a1@<X8>)
{
  sub_2269B89B0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_2269AF3C8()
{
  return MEMORY[0x270F047C8]();
}

uint64_t sub_2269AF3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2269B02BC();

  return MEMORY[0x270F04808](a1, a2, a3, v6);
}

uint64_t sub_2269AF444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2269B02BC();

  return MEMORY[0x270F047D0](a1, a2, a3, v6);
}

uint64_t sub_2269AF4A8(uint64_t a1)
{
  unint64_t v2 = sub_2269B02BC();

  return MEMORY[0x270F047E0](a1, v2);
}

uint64_t sub_2269AF4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = sub_2269B8830();
  sub_2269AF69C(a1, (uint64_t)&v27);
  uint64_t v5 = v27;
  char v6 = BYTE8(v27);
  long long v7 = v28;
  char v8 = v29;
  uint64_t v9 = v30;
  uint64_t v18 = *((void *)&v29 + 1);
  char v10 = BYTE8(v30);
  char v11 = sub_2269B8970();
  sub_2269B85E0();
  LOBYTE(v21) = 1;
  *((void *)&v21 + 1) = v5;
  v22[0] = v6;
  *(_OWORD *)&v22[8] = v7;
  v22[24] = v8;
  *(void *)&long long v23 = v18;
  *((void *)&v23 + 1) = v9;
  LOBYTE(v24) = v10;
  BYTE8(v24) = v11;
  *(void *)&long long v25 = v12;
  *((void *)&v25 + 1) = v13;
  *(void *)char v26 = v14;
  *(void *)&v26[8] = v15;
  v26[16] = 0;
  *(_WORD *)&v26[17] = 256;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  void v16[4] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149710);
  sub_2269B0120();
  sub_2269B8A80();
  swift_release();
  long long v33 = v25;
  v34[0] = *(_OWORD *)v26;
  *(_DWORD *)((char *)v34 + 15) = *(_DWORD *)&v26[15];
  long long v29 = *(_OWORD *)v22;
  long long v30 = *(_OWORD *)&v22[16];
  long long v31 = v23;
  long long v32 = v24;
  long long v27 = (unint64_t)v19;
  long long v28 = v21;
  return sub_2269B0260((uint64_t)&v27);
}

uint64_t sub_2269AF69C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22696F93C();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2269B8A40();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  swift_getKeyPath();
  sub_2269AF234((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  id v9 = *(id *)(a1 + OBJC_IVAR____TtC11HoverTextUI16HoverTypingStore__uiFont);
  sub_2269B8980();
  uint64_t v10 = sub_2269B89D0();
  uint64_t v23 = v11;
  uint64_t v24 = v10;
  char v13 = v12;
  swift_release();
  char v14 = v13 & 1;
  sub_226968520(v4, v6, v8);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_2269B84A0();
  swift_release();
  swift_retain();
  uint64_t v15 = sub_2269B89C0();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_226968520(v24, v23, v14);
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v17;
  *(unsigned char *)(a2 + 32) = v21;
  *(void *)(a2 + 40) = v19;
  *(void *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 56) = 1;
  sub_22697F76C(v15, v17, v21);
  swift_bridgeObjectRetain();
  sub_226968520(v15, v17, v21);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2269AF8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for HoverTextPresentationEvent();
  char v7 = (int *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v15[1] = a1;
  sub_2269AF234((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  swift_retain();
  sub_22696D664(a2, a3);
  swift_release();
  v9[50] = 12;
  sub_2269B8250();
  uint64_t v10 = &v9[v7[10]];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v9[v7[11]];
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  char v12 = &v9[v7[12]];
  *(void *)char v12 = 0;
  void v12[8] = 1;
  char v13 = &v9[v7[13]];
  *(void *)char v13 = 0;
  *((void *)v13 + 1) = 0;
  *(void *)&v9[v7[14]] = 0;
  *(void *)&v9[v7[15]] = 0;
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 8;
  *((void *)v9 + 3) = 0;
  *((void *)v9 + 4) = 0;
  *((void *)v9 + 5) = 0;
  *((_WORD *)v9 + 24) = 320;
  sub_2269A1428((uint64_t)v9);
  return sub_2269675AC((uint64_t)v9);
}

uint64_t sub_2269AFA90()
{
  return sub_2269AF4F4(*v0, v0[1], v0[2]);
}

uint64_t sub_2269AFA9C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  unint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    double result = swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = v2 + 4;
    uint64_t v6 = (uint64_t *)(result + 40);
    while (1)
    {
      uint64_t v7 = *(v6 - 1);
      uint64_t v8 = *v6;
      if (v3)
      {
        double result = swift_bridgeObjectRetain();
        BOOL v9 = __OFSUB__(v3--, 1);
        if (v9) {
          goto LABEL_28;
        }
      }
      else
      {
        unint64_t v10 = v2[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_29;
        }
        int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681496D8);
        char v13 = (void *)swift_allocObject();
        uint64_t v14 = (uint64_t)(_swift_stdlib_malloc_size(v13) - 32) / 24;
        v13[2] = v12;
        v13[3] = 2 * v14;
        uint64_t v15 = v13 + 4;
        uint64_t v16 = v2[3] >> 1;
        uint64_t v5 = &v13[3 * v16 + 4];
        uint64_t v17 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        if (v2[2])
        {
          if (v13 != v2 || v15 >= &v2[3 * v16 + 4]) {
            memmove(v15, v2 + 4, 24 * v16);
          }
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        double result = swift_release();
        unint64_t v2 = v13;
        BOOL v9 = __OFSUB__(v17, 1);
        uint64_t v3 = v17 - 1;
        if (v9)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
      }
      v6 += 2;
      *uint64_t v5 = v4;
      v5[1] = v7;
      v5[2] = v8;
      v5 += 3;
      if (v1 == ++v4)
      {
        double result = swift_bridgeObjectRelease();
        goto LABEL_24;
      }
    }
  }
  uint64_t v3 = 0;
LABEL_24:
  unint64_t v19 = v2[3];
  if (v19 >= 2)
  {
    unint64_t v20 = v19 >> 1;
    BOOL v9 = __OFSUB__(v20, v3);
    uint64_t v21 = v20 - v3;
    if (v9) {
      goto LABEL_30;
    }
    v2[2] = v21;
  }
  return (uint64_t)v2;
}

uint64_t sub_2269AFC54()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2269AFC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_2269AEC20(a1, a2, a3, *(void *)(v4 + 16), a4);
}

uint64_t sub_2269AFC98()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2269AFCD0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

uint64_t sub_2269AFD04()
{
  return sub_22696D0A0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2269AFD20(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269AFD6C(uint64_t a1)
{
  return a1;
}

uint64_t destroy for Cell()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

void *_s11HoverTextUI4CellVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Cell(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for Cell(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11HoverTextUI30HoverTypingTextReplacementViewVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_2269AFF30(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)double result = a2 ^ 0x80000000;
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
      *(void *)double result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Cell()
{
  return &type metadata for Cell;
}

ValueMetadata *type metadata accessor for LowerTriangle()
{
  return &type metadata for LowerTriangle;
}

uint64_t sub_2269AFF90()
{
  return sub_22696B7B8(&qword_2681496E0, &qword_2681496E8);
}

uint64_t sub_2269AFFCC()
{
  return sub_22696B7B8(&qword_2681496F0, &qword_2681496F8);
}

unint64_t sub_2269B000C()
{
  unint64_t result = qword_268149700;
  if (!qword_268149700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149700);
  }
  return result;
}

unint64_t sub_2269B0064()
{
  unint64_t result = qword_268149708;
  if (!qword_268149708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149708);
  }
  return result;
}

uint64_t sub_2269B00B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2269B00D4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2269B0114()
{
  return sub_2269AF8E0(v0[2], v0[3], v0[4]);
}

unint64_t sub_2269B0120()
{
  unint64_t result = qword_268149718;
  if (!qword_268149718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149710);
    sub_2269B01C0();
    sub_22696B7B8(&qword_268149740, &qword_268149748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149718);
  }
  return result;
}

unint64_t sub_2269B01C0()
{
  unint64_t result = qword_268149720;
  if (!qword_268149720)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149728);
    sub_22696B7B8(&qword_268149730, &qword_268149738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149720);
  }
  return result;
}

uint64_t sub_2269B0260(uint64_t a1)
{
  return a1;
}

uint64_t sub_2269B02B0()
{
  return sub_2269AF27C(v0[2], v0[3], v0[4], v0[5]);
}

unint64_t sub_2269B02BC()
{
  unint64_t result = qword_268149750;
  if (!qword_268149750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149750);
  }
  return result;
}

uint64_t sub_2269B0310()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t HoverTextRootView.body.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149758);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149760);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149768);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_2269B8880();
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149770);
  sub_2269B05E0(a1, a2, &v7[*(int *)(v16 + 44)]);
  uint64_t v17 = *a1;
  long long v27 = a1;
  uint64_t v25 = a2;
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
  if (v18(v17, a2)) {
    double v19 = 1.0;
  }
  else {
    double v19 = 0.0;
  }
  sub_22696B88C((uint64_t)v7, (uint64_t)v11, &qword_268149758);
  *(double *)&v11[*(int *)(v9 + 44)] = v19;
  sub_22696B8F0((uint64_t)v7, &qword_268149758);
  uint64_t v20 = sub_2269B8DD0();
  long long v27 = a1;
  char v21 = v18(v17, v25);
  sub_22696B88C((uint64_t)v11, (uint64_t)v15, &qword_268149760);
  uint64_t v22 = &v15[*(int *)(v13 + 44)];
  *(void *)uint64_t v22 = v20;
  v22[8] = v21 & 1;
  sub_22696B8F0((uint64_t)v11, &qword_268149760);
  return sub_22696B7FC((uint64_t)v15, v26, &qword_268149768);
}

uint64_t sub_2269B05E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v77 = a3;
  uint64_t v65 = sub_2269B8900();
  MEMORY[0x270FA5388](v65);
  uint64_t v61 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_2269B8620();
  uint64_t v73 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v59 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681497A0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v75 = v7;
  uint64_t v76 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v60 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681497A8);
  uint64_t v74 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v57 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681497B0);
  uint64_t v69 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v62 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v13 = MEMORY[0x270FA5388](v12);
  uint64_t v66 = (char *)&v56 - v14;
  uint64_t v15 = *a1;
  v82[0] = a1;
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 144);
  uint64_t v63 = a2 + 144;
  uint64_t v64 = v16;
  uint64_t v17 = ((uint64_t (*)(uint64_t, uint64_t, __n128))v16)(v15, a2, v13);
  BOOL v67 = v17 == 1;
  BOOL v68 = v17 != 1;
  v82[0] = a1;
  uint64_t v18 = *(double (**)(uint64_t, uint64_t))(a2 + 192);
  swift_retain();
  uint64_t v58 = v15;
  double v19 = v18(v15, a2);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v26 = sub_2269B0EC4(a1, a2);
  uint64_t v28 = v27;
  char v30 = v29;
  swift_retain();
  sub_2269B0FF0(v79);
  swift_release();
  *(_OWORD *)&v80[119] = v79[7];
  *(_OWORD *)&v80[135] = v79[8];
  *(_OWORD *)&v80[151] = v79[9];
  *(_OWORD *)&v80[167] = v79[10];
  *(_OWORD *)&v80[55] = v79[3];
  *(_OWORD *)&v80[71] = v79[4];
  *(_OWORD *)&v80[87] = v79[5];
  *(_OWORD *)&v80[103] = v79[6];
  *(_OWORD *)&v80[7] = v79[0];
  *(_OWORD *)&v80[23] = v79[1];
  char v81 = v30 & 1;
  *(_OWORD *)&v80[39] = v79[2];
  v82[0] = a1;
  char v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(v15, a2);
  v78[0] = a1;
  v78[1] = a2;
  *(double *)&v78[2] = v19;
  v78[3] = v21;
  v78[4] = v23;
  v78[5] = v25;
  v78[6] = v26;
  v78[7] = v28;
  LOBYTE(v78[8]) = v81;
  *(_OWORD *)((char *)&v78[24] + 1) = *(_OWORD *)&v80[128];
  *(_OWORD *)((char *)&v78[26] + 1) = *(_OWORD *)&v80[144];
  *(_OWORD *)((char *)&v78[28] + 1) = *(_OWORD *)&v80[160];
  *(_OWORD *)((char *)&v78[16] + 1) = *(_OWORD *)&v80[64];
  *(_OWORD *)((char *)&v78[18] + 1) = *(_OWORD *)&v80[80];
  *(_OWORD *)((char *)&v78[20] + 1) = *(_OWORD *)&v80[96];
  *(_OWORD *)((char *)&v78[22] + 1) = *(_OWORD *)&v80[112];
  *(_OWORD *)((char *)&v78[8] + 1) = *(_OWORD *)v80;
  *(_OWORD *)((char *)&v78[10] + 1) = *(_OWORD *)&v80[16];
  *(_OWORD *)((char *)&v78[12] + 1) = *(_OWORD *)&v80[32];
  *(_OWORD *)((char *)&v78[14] + 1) = *(_OWORD *)&v80[48];
  v78[30] = *(void *)&v80[175];
  v78[31] = 0;
  LOBYTE(v78[32]) = v31 & 1;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = a1;
  *(void *)(v32 + 24) = a2;
  swift_retain();
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681497B8);
  uint64_t v34 = sub_2269B16E8(&qword_2681497C0, &qword_2681497B8, (void (*)(void))sub_2269B178C);
  sub_2269B8A80();
  swift_release();
  memcpy(v82, v78, 0x101uLL);
  sub_2269B1850(v82);
  sub_2269B8920();
  long long v35 = v59;
  sub_2269B85F0();
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = a1;
  *(void *)(v36 + 24) = a2;
  sub_2269B1B00(&qword_268148F08, MEMORY[0x263F185B8]);
  swift_retain();
  uint64_t v37 = v60;
  uint64_t v38 = v70;
  sub_2269B8D20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v35, v38);
  sub_2269B8640();
  v78[0] = v33;
  v78[1] = v34;
  swift_getOpaqueTypeConformance2();
  sub_22696B7B8(&qword_2681497F8, &qword_2681497A0);
  uint64_t v39 = v62;
  long long v40 = v37;
  uint64_t v41 = v71;
  uint64_t v42 = v75;
  uint64_t v43 = v57;
  sub_2269B8B00();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v40, v42);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v43, v41);
  uint64_t v44 = v69;
  uint64_t v45 = v66;
  uint64_t v46 = v72;
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v66, v39, v72);
  v78[0] = a1;
  uint64_t v47 = v64(v58, a2);
  LODWORD(v76) = v47 != 0;
  LOBYTE(a2) = v47 == 0;
  long long v48 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v49 = v46;
  v48(v39, v45, v46);
  uint64_t v50 = v77;
  *uint64_t v77 = 0;
  *((unsigned char *)v50 + 8) = v67;
  *((unsigned char *)v50 + 9) = v68;
  uint64_t v51 = (char *)v50;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268149800);
  v48(&v51[*(int *)(v52 + 48)], v39, v49);
  id v53 = &v51[*(int *)(v52 + 64)];
  *(void *)id v53 = 0;
  v53[8] = a2;
  v53[9] = v76;
  uint64_t v54 = *(void (**)(char *, uint64_t))(v44 + 8);
  v54(v45, v49);
  return ((uint64_t (*)(char *, uint64_t))v54)(v39, v49);
}

uint64_t sub_2269B0DD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2269B0DF0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = sub_2269B8600();
  if (v6 <= 0.0) {
    return (*(uint64_t (**)(void, void, uint64_t))(a3 + 288))(0, *a2, a3);
  }
  if (v6 >= 0.0) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 288))(1, *a2, a3);
  }
  return result;
}

uint64_t sub_2269B0EC4(void *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 144);
  if (((uint64_t (*)(void))v4)(*a1) == 2 || v4(v3, a2) == 3) {
    return 0x3FE0000000000000;
  }
  if (!v4(v3, a2))
  {
    sub_2269B8E00();
    return v6;
  }
  if (v4(v3, a2) == 1)
  {
    sub_2269B8DF0();
    return v6;
  }
  return 0;
}

void *sub_2269B0FF0@<X0>(_OWORD *a1@<X8>)
{
  type metadata accessor for HoverTypingStore();
  uint64_t v2 = swift_dynamicCastClass();
  if (v2)
  {
    uint64_t v3 = v2;
    swift_retain();
    uint64_t v4 = sub_2269B8880();
    sub_2269B11EC(v3, (uint64_t)&v26);
    swift_release();
    v6.n128_u64[0] = *(void *)&v27[24];
    unint64_t v5 = *(void *)&v27[16];
    char v7 = v27[48];
    __n128 v8 = *(__n128 *)&v27[56];
    long long v9 = *(_OWORD *)&v27[72];
    long long v10 = *(_OWORD *)&v27[88];
    long long v11 = *(_OWORD *)&v27[32];
    long long v12 = v26;
    long long v13 = *(_OWORD *)v27;
    LOBYTE(v31[0]) = 1;
    long long v26 = (unint64_t)v4;
    v27[0] = 1;
    *(_OWORD *)&v27[8] = v12;
    *(_OWORD *)&v27[24] = v13;
    *(_OWORD *)&v27[40] = __PAIR128__(v6.n128_u64[0], v5);
    *(_OWORD *)&v27[56] = v11;
    v27[72] = v7;
    *(__n128 *)&v27[80] = v8;
    *(_OWORD *)&v27[96] = v9;
    long long v28 = v10;
    CGRectMake(v6, v8);
  }
  else
  {
    sub_2269B19D4(&v26);
  }
  sub_22696B7FC((uint64_t)&v26, (uint64_t)v32, &qword_268149808);
  type metadata accessor for HoverTextStore();
  uint64_t v14 = swift_dynamicCastClass();
  if (v14)
  {
    swift_retain();
    uint64_t v15 = 0x4046800000000000;
    uint64_t v16 = 0x4008000000000000;
    uint64_t v17 = 0x4024000000000000;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    uint64_t v15 = 0;
  }
  sub_22696B7FC((uint64_t)v32, (uint64_t)v24, &qword_268149808);
  sub_22696B7FC((uint64_t)v24, (uint64_t)v25, &qword_268149808);
  sub_22696B7FC((uint64_t)v25, (uint64_t)&v26, &qword_268149808);
  *(void *)&long long v29 = v14;
  *((void *)&v29 + 1) = v17;
  *(void *)&long long v30 = v16;
  *((void *)&v30 + 1) = v15;
  long long v18 = *(_OWORD *)&v27[64];
  a1[4] = *(_OWORD *)&v27[48];
  a1[5] = v18;
  long long v19 = *(_OWORD *)&v27[96];
  a1[6] = *(_OWORD *)&v27[80];
  a1[7] = v19;
  long long v20 = *(_OWORD *)v27;
  *a1 = v26;
  a1[1] = v20;
  long long v21 = *(_OWORD *)&v27[32];
  a1[2] = *(_OWORD *)&v27[16];
  a1[3] = v21;
  long long v22 = v29;
  a1[8] = v28;
  a1[9] = v22;
  a1[10] = v30;
  sub_2269B1A8C(v25, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_2269B19F0);
  sub_22696B7FC((uint64_t)v24, (uint64_t)v31, &qword_268149808);
  return sub_2269B1A8C(v31, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_2269B1930);
}

uint64_t sub_2269B11EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_2269B1B00((unint64_t *)&qword_268148C00, (void (*)(uint64_t))type metadata accessor for HoverTypingStore);
  sub_2269B84A0();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 96);
  swift_getKeyPath();
  sub_2269B1B00((unint64_t *)&qword_268148DC8, (void (*)(uint64_t))type metadata accessor for HoverTypingTextReplacementModel);
  swift_retain();
  sub_2269B84A0();
  swift_release();
  int v5 = *(unsigned __int8 *)(v4 + 24);
  swift_release();
  if (v5 == 1)
  {
    swift_retain_n();
    uint64_t v6 = 0x4008000000000000;
    uint64_t v7 = 0x401C000000000000;
    uint64_t v8 = a1;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  swift_getKeyPath();
  swift_retain_n();
  sub_2269B84A0();
  swift_release();
  uint64_t v9 = *(void *)(a1 + 136);
  sub_2269B8E10();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v6;
  *(void *)(a2 + 32) = a1;
  *(void *)(a2 + 40) = 0x4024000000000000;
  *(void *)(a2 + 48) = a1;
  *(void *)(a2 + 56) = &off_26DA81868;
  *(unsigned char *)(a2 + 64) = 1;
  *(void *)(a2 + 72) = v9;
  *(_OWORD *)(a2 + 80) = xmmword_2269BCC30;
  *(void *)(a2 + 96) = 0x3FF0000000000000;
  *(void *)(a2 + 104) = v10;
  *(void *)(a2 + 112) = v11;
  sub_2269B1A4C(v8);
  return sub_2269B198C(v8);
}

uint64_t sub_2269B1418@<X0>(uint64_t a1@<X8>)
{
  return HoverTextRootView.body.getter(*(uint64_t **)v1, *(void *)(v1 + 8), a1);
}

_OWORD *initializeBufferWithCopyOfBuffer for HoverTextRootView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

void *assignWithCopy for HoverTextRootView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = v3;
  return a1;
}

_OWORD *assignWithTake for HoverTextRootView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextRootView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HoverTextRootView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HoverTextRootView()
{
  return &type metadata for HoverTextRootView;
}

uint64_t sub_2269B1568()
{
  return sub_2269B16E8(&qword_268149778, &qword_268149768, (void (*)(void))sub_2269B15A4);
}

unint64_t sub_2269B15A4()
{
  unint64_t result = qword_268149780;
  if (!qword_268149780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268149760);
    sub_22696B7B8(&qword_268149788, &qword_268149758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149780);
  }
  return result;
}

uint64_t sub_2269B1644()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2269B167C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 296))(**(void **)(v0 + 16));
}

uint64_t sub_2269B16E8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_22696B7B8(&qword_268149790, &qword_268149798);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2269B178C()
{
  unint64_t result = qword_2681497C8;
  if (!qword_2681497C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681497D0);
    sub_22696B7B8(&qword_2681497D8, &qword_2681497E0);
    sub_22696B7B8(&qword_2681497E8, &qword_2681497F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681497C8);
  }
  return result;
}

void *sub_2269B1850(void *a1)
{
  uint64_t v2 = a1[11];
  uint64_t v9 = a1[10];
  uint64_t v10 = a1[9];
  uint64_t v3 = a1[12];
  uint64_t v4 = a1[13];
  uint64_t v5 = a1[14];
  uint64_t v6 = a1[15];
  uint64_t v7 = a1[16];
  swift_release();
  sub_2269B1930(v10, v9, v2, v3, v4, v5, v6, v7);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_2269B1930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    sub_2269B198C(a4);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2269B198C(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2269B19CC(uint64_t a1)
{
  return sub_2269B0DF0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

double sub_2269B19D4(_OWORD *a1)
{
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_2269B19F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    sub_2269B1A4C(a4);
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2269B1A4C(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

void *sub_2269B1A8C(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_2269B1B00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2269B1B58()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2269B9580();
  sub_2269B95B0();
  sub_2269B95B0();
  sub_2269B95A0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_2269B8F50();
    swift_bridgeObjectRelease();
  }
  return sub_2269B95D0();
}

uint64_t sub_2269B1BFC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2269B95B0();
  sub_2269B95B0();
  if (!v1) {
    return sub_2269B95A0();
  }
  sub_2269B95A0();
  swift_bridgeObjectRetain();
  sub_2269B8F50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2269B1C8C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2269B9580();
  sub_2269B95B0();
  sub_2269B95B0();
  sub_2269B95A0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_2269B8F50();
    swift_bridgeObjectRelease();
  }
  return sub_2269B95D0();
}

uint64_t sub_2269B1D2C(uint64_t *a1, uint64_t *a2)
{
  return sub_2269B74B0(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_2269B1D48()
{
  uint64_t v1 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor);
  id v3 = v2;
  if (v2 != (void *)1)
  {
LABEL_6:
    sub_2269B7DF4(v2);
    return (uint64_t)v3;
  }
  uint64_t v4 = *MEMORY[0x263F22BF8];
  if ((v4 & 0x80000000) == 0)
  {
    id v5 = objc_allocWithZone(MEMORY[0x263F22898]);
    uint64_t v6 = (void *)sub_2269B8F00();
    id v3 = objc_msgSend(v5, sel_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_, v6, v4, 0, 0);

    if (v3)
    {
      objc_msgSend(v3, sel_setHIDEventFilterMask_, 67);
      uint64_t v7 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_2269B7E3C;
      void aBlock[5] = v7;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2269B2520;
      aBlock[3] = &block_descriptor_78;
      uint64_t v8 = _Block_copy(aBlock);
      swift_release();
      objc_msgSend(v3, sel_setHIDEventHandler_, v8);
      _Block_release(v8);
    }
    uint64_t v9 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v10 = v3;
    sub_2269B7DE4(v9);
    goto LABEL_6;
  }
  uint64_t result = sub_2269B9430();
  __break(1u);
  return result;
}

uint64_t sub_2269B1F28(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2269B8E40();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2269B8E70();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v12 = a1;
    id v13 = objc_msgSend(v12, sel_handInfo);
    if (v13 && (uint64_t v14 = v13, v15 = objc_msgSend(v13, sel_isStylus), v14, v15))
    {
      sub_226978330(0, (unint64_t *)&qword_268149200);
      uint64_t v25 = sub_2269B91D0();
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = a2;
      *(void *)(v16 + 24) = v12;
      char v31 = sub_2269B7EA0;
      uint64_t v32 = v16;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v28 = 1107296256;
      uint64_t v17 = &block_descriptor_96;
    }
    else if (objc_msgSend(v12, sel_type) == 10 || objc_msgSend(v12, sel_type) == 11)
    {
      sub_226978330(0, (unint64_t *)&qword_268149200);
      uint64_t v25 = sub_2269B91D0();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = a2;
      *(void *)(v18 + 24) = v12;
      char v31 = sub_2269B7E54;
      uint64_t v32 = v18;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v28 = 1107296256;
      uint64_t v17 = &block_descriptor_90;
    }
    else
    {
      if (objc_msgSend(v12, sel_type) != 3001)
      {

        return 0;
      }
      sub_226978330(0, (unint64_t *)&qword_268149200);
      uint64_t v25 = sub_2269B91D0();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = a2;
      *(void *)(v24 + 24) = v12;
      char v31 = sub_2269B7E48;
      uint64_t v32 = v24;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v28 = 1107296256;
      uint64_t v17 = &block_descriptor_84;
    }
    long long v29 = sub_226982998;
    long long v30 = v17;
    long long v19 = _Block_copy(&aBlock);
    uint64_t v26 = v8;
    long long v20 = v19;
    id v21 = v12;
    swift_retain();
    swift_release();
    sub_2269B8E50();
    uint64_t aBlock = MEMORY[0x263F8EE78];
    sub_2269B7F64(&qword_268149128, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
    sub_2269B7EB8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
    sub_2269B92F0();
    long long v22 = (void *)v25;
    MEMORY[0x22A65CBA0](0, v11, v7, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v26);
  }
  return 0;
}

void sub_2269B23C4(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A65DAD0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_2269B4674(a2);
  }
}

void sub_2269B2420(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A65DAD0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_msgSend(a2, sel_type);
    sub_2269B7738(a2);
  }
}

void sub_2269B248C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A65DAD0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = *(void (**)(uint64_t))(v4 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture);
    if (v6)
    {
      swift_retain();
      v6(a2);
      sub_226999548((uint64_t)v6);
    }
  }
}

uint64_t sub_2269B2520(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(a2) = v3(a2);
  swift_release();

  return a2 & 1;
}

void sub_2269B257C()
{
  id v1 = objc_msgSend(self, sel_sharedEventManager);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_registerEventHandler_, v0);

    uint64_t v3 = sub_2269B1D48();
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = (id)sub_2269B8F00();
      objc_msgSend(v4, sel_beginHandlingHIDEventsForReason_, v5);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_2269B2648()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v7) {
      goto LABEL_21;
    }
    unint64_t v16 = *(void *)(v3 + 8 * v15);
    ++v8;
    if (!v16)
    {
      int64_t v8 = v15 + 1;
      if (v15 + 1 >= v7) {
        goto LABEL_21;
      }
      unint64_t v16 = *(void *)(v3 + 8 * v8);
      if (!v16)
      {
        int64_t v8 = v15 + 2;
        if (v15 + 2 >= v7) {
          goto LABEL_21;
        }
        unint64_t v16 = *(void *)(v3 + 8 * v8);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = (unint64_t *)(*(void *)(v2 + 48) + 24 * v10);
    uint64_t v13 = v11[1];
    uint64_t v12 = v11[2];
    unint64_t v14 = *v11;
    swift_bridgeObjectRetain();
    sub_2269B3144(v14, v13, v12);
    swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 3;
  if (v17 < v7)
  {
    unint64_t v16 = *(void *)(v3 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        int64_t v8 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          break;
        }
        if (v8 >= v7) {
          goto LABEL_21;
        }
        unint64_t v16 = *(void *)(v3 + 8 * v8);
        ++v17;
        if (v16) {
          goto LABEL_20;
        }
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    int64_t v8 = v17;
    goto LABEL_20;
  }
LABEL_21:
  swift_release();
  id v18 = objc_msgSend(self, sel_sharedEventManager);
  if (!v18) {
    goto LABEL_27;
  }
  long long v19 = v18;
  objc_msgSend(v18, sel_unregisterEventHandler_, v0);

  uint64_t v20 = sub_2269B1D48();
  if (v20)
  {
    id v21 = (void *)v20;
    long long v22 = (void *)sub_2269B8F00();
    objc_msgSend(v21, sel_endHandlingHIDEventsForReason_, v22);
  }
}

void sub_2269B2868(void *a1)
{
  uint64_t v3 = sub_2269B8550();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  int64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v41 - v8;
  unint64_t v10 = (unint64_t)objc_msgSend(a1, sel__contextId);
  uint64_t v11 = HTDisplayIDForWindow(a1);
  id v12 = objc_msgSend(a1, sel_screen);
  id v13 = objc_msgSend(v12, sel_displayConfiguration);

  if (!v13)
  {
    __break(1u);
    return;
  }
  id v14 = objc_msgSend(v13, sel_hardwareIdentifier);

  id v45 = v14;
  if (v14)
  {
    uint64_t v46 = sub_2269B8F30();
    id v14 = v15;
  }
  else
  {
    uint64_t v46 = 0;
  }
  unint64_t v16 = (uint64_t *)(v1 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  swift_beginAccess();
  if (!*(void *)(*v16 + 16))
  {
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2269B56A0(v10 | (unint64_t)(v11 << 32), v46, (uint64_t)v14);
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    uint64_t v26 = sub_2269B8520();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v26, v3);
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2269B8540();
    os_log_type_t v28 = sub_2269B9160();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v43 = v11;
    if (v29)
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v41 = v4;
      uint64_t v32 = v31;
      v48[0] = v31;
      *(_DWORD *)uint64_t v30 = 67109634;
      LODWORD(v47) = v10;
      unsigned int v44 = v10;
      sub_2269B9290();
      *(_WORD *)(v30 + 8) = 1024;
      LODWORD(v47) = v11;
      sub_2269B9290();
      *(_WORD *)(v30 + 14) = 2080;
      if (v14) {
        uint64_t v33 = v46;
      }
      else {
        uint64_t v33 = 0x3E6C696E3CLL;
      }
      uint64_t v42 = v3;
      if (v14) {
        unint64_t v34 = (unint64_t)v14;
      }
      else {
        unint64_t v34 = 0xE500000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v35 = v33;
      unint64_t v10 = v44;
      uint64_t v47 = sub_22697609C(v35, v34, v48);
      sub_2269B9290();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22695C000, v27, v28, "Begin tapping mouse events contextID=%u displayID=%u displayHardwareID=%s", (uint8_t *)v30, 0x18u);
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v32, -1, -1);
      MEMORY[0x22A65DA10](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v42);
      if (v10) {
        goto LABEL_25;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      if (v10)
      {
LABEL_25:
        id v36 = objc_msgSend(self, sel_sharedInstance);
        id v37 = v45;
        unsigned int v38 = v10;
        id v39 = objc_msgSend(v36, sel_requestGlobalMouseEventsForDisplay_targetContextID_, v45, v10);

        swift_beginAccess();
        swift_unknownObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v47 = *v16;
        *unint64_t v16 = 0x8000000000000000;
        sub_2269B6C60((uint64_t)v39, v38 | (unint64_t)(v43 << 32), v46, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
        *unint64_t v16 = v47;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_unknownObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();

    return;
  }
  unsigned int v44 = v10;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v18 = sub_2269B8520();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v18, v3);
  swift_bridgeObjectRetain();
  long long v19 = sub_2269B8540();
  os_log_type_t v20 = sub_2269B9160();
  if (os_log_type_enabled(v19, v20))
  {
    int v21 = v11;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v48[0] = v23;
    *(_DWORD *)uint64_t v22 = 67109634;
    LODWORD(v47) = v44;
    sub_2269B9290();
    *(_WORD *)(v22 + 8) = 1024;
    LODWORD(v47) = v21;
    sub_2269B9290();
    *(_WORD *)(v22 + 14) = 2080;
    if (v14) {
      uint64_t v24 = v46;
    }
    else {
      uint64_t v24 = 0x3E6C696E3CLL;
    }
    uint64_t v42 = v3;
    if (v14) {
      unint64_t v25 = (unint64_t)v14;
    }
    else {
      unint64_t v25 = 0xE500000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_22697609C(v24, v25, v48);
    sub_2269B9290();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v19, v20, "Tapping mouse events already occuring for contextID=%u displayID=%u displayHardwareID=%s", (uint8_t *)v22, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v23, -1, -1);
    MEMORY[0x22A65DA10](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v42);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t sub_2269B2F60(void *a1)
{
  unsigned int v2 = objc_msgSend(a1, sel__contextId);
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  uint64_t result = swift_beginAccess();
  int64_t v5 = 0;
  uint64_t v6 = *v3;
  uint64_t v7 = 1 << *(unsigned char *)(*v3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v9 = v6 + 64;
  unint64_t v11 = v8 & v10;
  int64_t v12 = (unint64_t)(v7 + 63) >> 6;
  while (v11)
  {
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v14 = v13 | (v5 << 6);
LABEL_5:
    uint64_t v15 = *(void *)(*v3 + 48);
    if (*(_DWORD *)(v15 + 24 * v14) == v2)
    {
      uint64_t v19 = v15 + 24 * v14;
      uint64_t v21 = *(void *)(v19 + 8);
      uint64_t v20 = *(void *)(v19 + 16);
      unint64_t v22 = v2 | ((unint64_t)*(unsigned int *)(v19 + 4) << 32);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      sub_2269B3144(v22, v21, v20);
      swift_unknownObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  int64_t v16 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v16 >= v12) {
    return result;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v16);
  ++v5;
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 1;
  if (v16 + 1 >= v12) {
    return result;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v5);
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 2;
  if (v16 + 2 >= v12) {
    return result;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v5);
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 3;
  if (v16 + 3 >= v12) {
    return result;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v5);
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 4;
  if (v16 + 4 >= v12) {
    return result;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v5);
  if (v17)
  {
LABEL_24:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v5 << 6);
    goto LABEL_5;
  }
  int64_t v18 = v16 + 5;
  if (v18 >= v12) {
    return result;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17)
  {
    int64_t v5 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v5 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v5 >= v12) {
      return result;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v5);
    ++v18;
    if (v17) {
      goto LABEL_24;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2269B3144(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_2269B8550();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2269B8520();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_bridgeObjectRetain_n();
  unint64_t v13 = sub_2269B8540();
  os_log_type_t v14 = sub_2269B9160();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v34 = a1;
  uint64_t v35 = a2;
  if (v15)
  {
    uint64_t v16 = a2;
    uint64_t v33 = v4;
    unint64_t v17 = HIDWORD(a1);
    int v18 = a1;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    v37[0] = v32;
    *(_DWORD *)uint64_t v19 = 67109634;
    LODWORD(v36) = v18;
    sub_2269B9290();
    *(_WORD *)(v19 + 8) = 1024;
    LODWORD(v36) = v17;
    sub_2269B9290();
    *(_WORD *)(v19 + 14) = 2080;
    if (a3) {
      uint64_t v20 = v16;
    }
    else {
      uint64_t v20 = 0x3E6C696E3CLL;
    }
    if (a3) {
      unint64_t v21 = a3;
    }
    else {
      unint64_t v21 = 0xE500000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_22697609C(v20, v21, v37);
    uint64_t v4 = v33;
    sub_2269B9290();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22695C000, v13, v14, "Stop tapping mouse events contextID=%u displayID=%u displayHardwareID=%s", (uint8_t *)v19, 0x18u);
    uint64_t v22 = v32;
    swift_arrayDestroy();
    MEMORY[0x22A65DA10](v22, -1, -1);
    MEMORY[0x22A65DA10](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v23 = (uint64_t *)(v4 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  uint64_t result = swift_beginAccess();
  uint64_t v25 = *v23;
  if (*(void *)(*v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v27 = v34;
    uint64_t v26 = v35;
    unint64_t v28 = sub_2269B56A0(v34, v35, a3);
    if (v29)
    {
      uint64_t v30 = *(void **)(*(void *)(v25 + 56) + 8 * v28);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v30, sel_invalidate);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_2269B5E48(v27, v26, a3);
      swift_endAccess();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_2269B34E8(void *a1)
{
  uint64_t v3 = sub_2269B8E40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2269B8E70();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange];
  if (v12 && Current - *(double *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastMouseEventTime] > 0.25)
  {
    uint64_t v38 = v8;
    uint64_t v39 = v7;
    uint64_t v40 = v4;
    uint64_t v41 = v3;
    uint64_t v13 = *(void *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange + 8];
    *(double *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastMouseEventTime] = Current;
    os_log_type_t v14 = (uint64_t *)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams];
    swift_beginAccess();
    uint64_t v15 = *v14;
    swift_bridgeObjectRetain();
    uint64_t v37 = v13;
    sub_226999544(v12);
    id v16 = a1;
    unint64_t v17 = sub_2269B7AE8(v15, a1);
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();

    if (v19)
    {
      unint64_t v20 = HIDWORD(v17);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if (a1) {
        goto LABEL_5;
      }
    }
    else
    {
      LODWORD(v20) = 0;
      if (a1)
      {
LABEL_5:
        id v21 = objc_msgSend(v16, sel_pointerControllerInfo);
        if (v21)
        {
          uint64_t v22 = v21;
          objc_msgSend(v21, sel_pointerX);
          uint64_t v24 = v23;

          id v25 = objc_msgSend(v16, sel_pointerControllerInfo);
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = swift_allocObject();
            objc_msgSend(v26, sel_pointerY);
            uint64_t v29 = v28;

            *(void *)(v27 + 16) = v24;
            *(void *)(v27 + 24) = v29;
            uint64_t v30 = *(void **)&v1[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_axHandlerQueue];
            uint64_t v31 = swift_allocObject();
            *(void *)(v31 + 16) = v27;
            *(void *)(v31 + 24) = a1;
            *(_DWORD *)(v31 + 32) = v20;
            *(void *)(v31 + 40) = v1;
            *(void *)(v31 + 48) = v12;
            *(void *)(v31 + 56) = v37;
            aBlock[4] = sub_2269B7D64;
            void aBlock[5] = v31;
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_226982998;
            aBlock[3] = &block_descriptor_7;
            uint64_t v32 = _Block_copy(aBlock);
            sub_226999544(v12);
            id v33 = v16;
            id v34 = v30;
            swift_retain();
            uint64_t v35 = v1;
            sub_2269B8E50();
            uint64_t v42 = MEMORY[0x263F8EE78];
            sub_2269B7F64(&qword_268149128, MEMORY[0x263F8F030]);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
            sub_2269B7EB8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
            uint64_t v36 = v41;
            sub_2269B92F0();
            MEMORY[0x22A65CBA0](0, v10, v6, v32);
            _Block_release(v32);

            sub_226999548(v12);
            (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v36);
            (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v39);
            swift_release();
            swift_release();
            return;
          }
LABEL_12:
          __break(1u);
          return;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

id sub_2269B3958(uint64_t a1, void *a2, unsigned int a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v80 = a4;
  uint64_t v81 = a6;
  uint64_t v79 = a5;
  unsigned int v93 = a3;
  uint64_t v8 = sub_2269B8E40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v84 = (char *)v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2269B8E70();
  uint64_t v83 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v82 = (char *)v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2269B8550();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v92 = (char *)v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v85 = (char *)v75 - v17;
  MEMORY[0x270FA5388](v18);
  unint64_t v20 = (char *)v75 - v19;
  id result = objc_msgSend(self, sel_server);
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v22 = result;
  uint64_t v77 = v11;
  uint64_t v78 = v9;
  id result = (id)swift_beginAccess();
  if (!a2)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  double v24 = *(double *)(a1 + 16);
  double v23 = *(double *)(a1 + 24);
  id v25 = objc_msgSend(a2, sel_contextId);
  objc_msgSend(v22, sel_convertPoint_fromContextId_displayId_, v25, v93, v24, v23);
  uint64_t v27 = v26;
  uint64_t v29 = v28;

  swift_beginAccess();
  *(void *)(a1 + 16) = v27;
  *(void *)(a1 + 24) = v29;
  uint64_t v30 = (void *)sub_2269B8520();
  swift_beginAccess();
  uint64_t v31 = *(void (**)(char *, id, uint64_t))(v14 + 16);
  CGRect v88 = (void *)(v14 + 16);
  id v89 = v30;
  uint64_t v87 = v31;
  v31(v20, v30, v13);
  swift_retain_n();
  uint64_t v32 = a2;
  id v33 = sub_2269B8540();
  os_log_type_t v34 = sub_2269B9130();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v86 = v13;
  uint64_t v76 = v8;
  if (v35)
  {
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 134218752;
    uint64_t v91 = v14;
    swift_beginAccess();
    v95[0] = *(void *)(a1 + 16);
    sub_2269B9290();
    *(_WORD *)(v36 + 12) = 2048;
    swift_beginAccess();
    v95[0] = *(void *)(a1 + 24);
    sub_2269B9290();
    swift_release_n();
    *(_WORD *)(v36 + 22) = 1024;
    unsigned int v37 = [v32 contextId];

    LODWORD(v95[0]) = v37;
    uint64_t v13 = v86;
    sub_2269B9290();

    *(_WORD *)(v36 + 28) = 1024;
    LODWORD(v95[0]) = v93;
    uint64_t v14 = v91;
    sub_2269B9290();
    _os_log_impl(&dword_22695C000, v33, v34, "Find element at pointer point={%f %f} contextID=%u displayID=%u", (uint8_t *)v36, 0x22u);
    MEMORY[0x22A65DA10](v36, -1, -1);
  }
  else
  {

    swift_release_n();
    id v33 = v32;
  }

  uint64_t v39 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v38 = v14 + 8;
  uint64_t v90 = v39;
  v39(v20, v13);
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v75[1] = a1 + 16;
  swift_beginAccess();
  double v40 = *(double *)(a1 + 16);
  double v41 = *(double *)(a1 + 24);
  uint64_t v42 = self;
  unsigned int v43 = v93;
  id v44 = objc_msgSend(v42, sel_elementAtCoordinate_withVisualPadding_displayID_, 0, v93, v40, v41);
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  if (v44)
  {
    uint64_t v91 = v38;
    id v45 = v89;
    swift_beginAccess();
    v87(v92, v45, v13);
    swift_retain_n();
    id v46 = v44;
    uint64_t v47 = v32;
    id v48 = v46;
    uint64_t v49 = v47;
    id v89 = v48;
    uint64_t v50 = sub_2269B8540();
    os_log_type_t v51 = sub_2269B9130();
    int v52 = v51;
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v53 = swift_slowAlloc();
      CGRect v88 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 134219010;
      swift_beginAccess();
      v95[0] = *(void *)(a1 + 16);
      LODWORD(v87) = v52;
      sub_2269B9290();
      swift_release_n();
      *(_WORD *)(v53 + 12) = 2048;
      swift_beginAccess();
      v95[0] = *(void *)(a1 + 24);
      sub_2269B9290();
      swift_release_n();
      *(_WORD *)(v53 + 22) = 1024;
      unsigned int v54 = [v49 contextId];

      LODWORD(v95[0]) = v54;
      sub_2269B9290();

      *(_WORD *)(v53 + 28) = 1024;
      LODWORD(v95[0]) = v93;
      sub_2269B9290();
      *(_WORD *)(v53 + 34) = 2112;
      id v55 = v89;
      v95[0] = v89;
      id v56 = v89;
      uint64_t v13 = v86;
      sub_2269B9290();
      uint64_t v57 = v88;
      *CGRect v88 = v44;

      _os_log_impl(&dword_22695C000, v50, (os_log_type_t)v87, "Element found at pointer point={%f %f} contextID=%u displayID=%u element=%@", (uint8_t *)v53, 0x2Cu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149940);
      swift_arrayDestroy();
      MEMORY[0x22A65DA10](v57, -1, -1);
      MEMORY[0x22A65DA10](v53, -1, -1);
    }
    else
    {

      id v55 = v89;
      swift_release_n();

      uint64_t v50 = v49;
    }

    v90(v92, v13);
    sub_226978330(0, (unint64_t *)&qword_268149200);
    uint64_t v64 = (void *)sub_2269B91D0();
    uint64_t v65 = (void *)swift_allocObject();
    uint64_t v66 = v79;
    BOOL v67 = v80;
    v65[2] = v55;
    v65[3] = v67;
    uint64_t v68 = v81;
    v65[4] = v66;
    v65[5] = v68;
    v95[4] = sub_2269B7DD8;
    v95[5] = v65;
    v95[0] = MEMORY[0x263EF8330];
    v95[1] = 1107296256;
    v95[2] = sub_226982998;
    v95[3] = &block_descriptor_72;
    uint64_t v69 = _Block_copy(v95);
    id v70 = v55;
    id v71 = v67;
    swift_retain();
    swift_release();
    uint64_t v72 = v82;
    sub_2269B8E50();
    v95[0] = MEMORY[0x263F8EE78];
    sub_2269B7F64(&qword_268149128, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268149210);
    sub_2269B7EB8((unint64_t *)&qword_268149130, (uint64_t *)&unk_268149210);
    uint64_t v73 = v84;
    uint64_t v74 = v76;
    sub_2269B92F0();
    MEMORY[0x22A65CBA0](0, v72, v73, v69);
    _Block_release(v69);

    (*(void (**)(char *, uint64_t))(v78 + 8))(v73, v74);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v72, v77);
  }
  else
  {
    id v58 = v89;
    swift_beginAccess();
    v87(v85, v58, v13);
    swift_retain_n();
    uint64_t v59 = v32;
    uint64_t v60 = sub_2269B8540();
    os_log_type_t v61 = sub_2269B9130();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = swift_slowAlloc();
      *(_DWORD *)uint64_t v62 = 134218752;
      swift_beginAccess();
      v95[6] = *(void *)(a1 + 16);
      sub_2269B9290();
      *(_WORD *)(v62 + 12) = 2048;
      swift_beginAccess();
      uint64_t v94 = *(void *)(a1 + 24);
      sub_2269B9290();
      swift_release_n();
      *(_WORD *)(v62 + 22) = 1024;
      unsigned int v63 = [v59 contextId];

      LODWORD(v94) = v63;
      uint64_t v13 = v86;
      sub_2269B9290();

      *(_WORD *)(v62 + 28) = 1024;
      LODWORD(v94) = v43;
      sub_2269B9290();
      _os_log_impl(&dword_22695C000, v60, v61, "No element found at pointer point={%f %f} contextID=%u displayID=%u", (uint8_t *)v62, 0x22u);
      MEMORY[0x22A65DA10](v62, -1, -1);
    }
    else
    {

      swift_release_n();
      uint64_t v60 = v59;
    }

    return (id)((uint64_t (*)(char *, uint64_t))v90)(v85, v13);
  }
}

void sub_2269B44F0(void *a1, uint64_t a2, void (*a3)(id, void))
{
  uint64_t v6 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement;
  uint64_t v7 = *(void **)(a2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement);
  if (v7)
  {
    sub_226978330(0, (unint64_t *)&unk_268149930);
    id v8 = a1;
    id v9 = v7;
    char v10 = sub_2269B9220();

    if (v10) {
      return;
    }
    uint64_t v11 = *(void **)(a2 + v6);
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)(a2 + v6) = a1;
  id v12 = a1;

  uint64_t v13 = a2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement;
  *(_DWORD *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 4) = 1;
  uint64_t v14 = *(void (**)(uint64_t))(a2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
  if (v14)
  {
    swift_retain();
    v14(0x100000000);
    sub_226999548((uint64_t)v14);
  }

  a3(v12, 0);
}

void sub_2269B4674(void *a1)
{
  uint64_t v2 = v1;
  if (!AXDeviceSupportsPencilHover()) {
    return;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = *(void (**)(id, uint64_t))(v2
                                          + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange);
  if (!v5) {
    return;
  }
  double v6 = Current;
  uint64_t v7 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastStylusEventTime;
  if (Current - *(double *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastStylusEventTime) <= 0.25
    || a1 == 0)
  {
    return;
  }
  swift_retain();
  id v9 = objc_msgSend(a1, sel_handInfo);
  if (!v9) {
    goto LABEL_37;
  }
  char v10 = v9;
  id v11 = objc_msgSend(v9, sel_paths);

  if (!v11) {
    goto LABEL_42;
  }
  sub_226978330(0, &qword_268149928);
  unint64_t v12 = sub_2269B9010();

  if (!(v12 >> 62))
  {
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_13;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_2269B9450();
  swift_bridgeObjectRelease();
  if (!v51) {
    goto LABEL_36;
  }
LABEL_13:
  if ((v12 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v13 = *(id *)(v12 + 32);
      goto LABEL_16;
    }
    __break(1u);
LABEL_42:
    __break(1u);
    return;
  }
  id v13 = (id)MEMORY[0x22A65CD20](0, v12);
LABEL_16:
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  *(double *)(v2 + v7) = v6;
  objc_msgSend(v14, sel_pathZValue);
  if (v15 <= 0.0)
  {

LABEL_37:
    sub_226999548((uint64_t)v5);
    return;
  }
  uint64_t v16 = (uint64_t *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams);
  swift_beginAccess();
  uint64_t v17 = *v16;
  swift_bridgeObjectRetain();
  id v18 = a1;
  unint64_t v19 = sub_2269B7524(v17, a1);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();

  if (v21)
  {
    unint64_t v22 = HIDWORD(v19);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v22 = 0;
  }
  id v23 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v23, sel__referenceBounds);
  double v25 = v24;
  double v27 = v26;

  objc_msgSend(v14, sel_pathLocation);
  double v29 = v25 * v28;
  double v31 = v27 * v30;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  id v32 = objc_msgSend(self, sel_elementAtCoordinate_withVisualPadding_displayID_, 0, v22, v29, v31);
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  if (!v32)
  {
    sub_226999548((uint64_t)v5);

    return;
  }
  uint64_t v33 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement;
  os_log_type_t v34 = *(void **)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement);
  if (v34)
  {
    sub_226978330(0, (unint64_t *)&unk_268149930);
    id v35 = v32;
    id v36 = v34;
    char v37 = sub_2269B9220();

    if (v37)
    {
      objc_msgSend(v14, sel_azimuth);
      uint64_t v39 = v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement;
      *(_DWORD *)uint64_t v39 = v38;
      *(unsigned char *)(v39 + 4) = 0;
      double v40 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
      if (v40)
      {
        uint64_t v41 = v38;
        swift_retain();
        v40(v41);
        sub_226999548((uint64_t)v40);
      }
      sub_226999548((uint64_t)v5);

      return;
    }
    unsigned int v43 = *(void **)(v2 + v33);
  }
  else
  {
    id v42 = v32;
    unsigned int v43 = 0;
  }
  *(void *)(v2 + v33) = v32;
  id v44 = v32;

  uint64_t v45 = v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement;
  *(_DWORD *)uint64_t v45 = 0;
  *(unsigned char *)(v45 + 4) = 1;
  id v46 = (void (**)(uint64_t))(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
  uint64_t v47 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange);
  if (v47)
  {
    swift_retain();
    v47(0x100000000);
    sub_226999548((uint64_t)v47);
  }

  objc_msgSend(v14, sel_azimuth);
  *(_DWORD *)uint64_t v45 = v48;
  *(unsigned char *)(v45 + 4) = 0;
  uint64_t v49 = *v46;
  if (*v46)
  {
    uint64_t v50 = v48;
    swift_retain();
    v49(v50);
    sub_226999548((uint64_t)v49);
  }
  v5(v44, 1);

  sub_226999548((uint64_t)v5);
}

void sub_2269B4B70()
{
  uint64_t v1 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer);
  if (v2) {
    goto LABEL_4;
  }
  uint64_t v3 = v0;
  sub_226978330(0, (unint64_t *)&qword_268149200);
  uint64_t v4 = (void *)sub_2269B91D0();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F21398]), sel_initWithTargetSerialQueue_, v4);

  if (v5)
  {
    objc_msgSend(v5, sel_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_, 1);
    double v6 = *(void **)(v3 + v1);
    *(void *)(v3 + v1) = v5;
    v5;

    uint64_t v2 = 0;
LABEL_4:
    id v7 = v2;
    return;
  }
  __break(1u);
}

void sub_2269B4C34(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (char *)MEMORY[0x22A65DAD0](v1);
  if (v2)
  {
    *(void *)&v2[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount] = 0;
  }
  swift_beginAccess();
  uint64_t v3 = (unsigned char *)MEMORY[0x22A65DAD0](v1);
  if (v3)
  {
    v3[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive] = 1;
  }
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A65DAD0](v1);
  if (v4)
  {
    id v5 = (void *)v4;
    double v6 = *(void (**)(void))(v4 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed);
    sub_226999544((uint64_t)v6);

    if (v6)
    {
      v6();
      sub_226999548((uint64_t)v6);
    }
  }
}

void sub_2269B4D24(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (char *)MEMORY[0x22A65DAD0](v1);
  if (v2)
  {
    *(void *)&v2[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount] = 0;
  }
}

id sub_2269B4D7C()
{
  uint64_t v20 = sub_2269B91C0();
  uint64_t v1 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2269B9170();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_2269B8E70();
  MEMORY[0x270FA5388](v5 - 8);
  double v6 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange];
  *(void *)double v6 = 0;
  *((void *)v6 + 1) = 0;
  id v7 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  id v8 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  id v9 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  char v10 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed];
  *(void *)char v10 = 0;
  *((void *)v10 + 1) = 0;
  id v11 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  unint64_t v12 = &v0[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture];
  *(void *)unint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v19 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_axHandlerQueue;
  uint64_t v18 = sub_226978330(0, (unint64_t *)&qword_268149200);
  id v13 = v0;
  sub_2269B8E50();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_2269B7F64((unint64_t *)&unk_268149950, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681495C8);
  sub_2269B7EB8((unint64_t *)&unk_268149960, &qword_2681495C8);
  sub_2269B92F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v20);
  *(void *)&v0[v19] = sub_2269B91F0();
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastMouseEventTime] = 0;
  uint64_t v14 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_pointerEventStreams;
  *(void *)&v13[v14] = sub_226980ED0(MEMORY[0x263F8EE78]);
  double v15 = &v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_currentStylusAzimuthForElement];
  *(_DWORD *)double v15 = 0;
  v15[4] = 1;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey] = 2;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_lastStylusEventTime] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousEvent] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor] = 1;
  *(_DWORD *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount] = 0;
  v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer] = 0;

  uint64_t v16 = (objc_class *)type metadata accessor for HoverTextEventHandler();
  v21.receiver = v13;
  v21.super_class = v16;
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_2269B5140()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HoverTextEventHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HoverTextEventHandler()
{
  return self;
}

uint64_t destroy for HTPointerStreamContext()
{
  return swift_bridgeObjectRelease();
}

void *_s11HoverTextUI22HTPointerStreamContextVwCP_0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTPointerStreamContext(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for HTPointerStreamContext(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTPointerStreamContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HTPointerStreamContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)id result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTPointerStreamContext()
{
  return &type metadata for HTPointerStreamContext;
}

unint64_t sub_2269B5448()
{
  unint64_t result = qword_268149918;
  if (!qword_268149918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268149918);
  }
  return result;
}

unint64_t sub_2269B549C(uint64_t a1)
{
  sub_2269B9580();
  type metadata accessor for CFString(0);
  sub_2269B7F64(&qword_268149978, type metadata accessor for CFString);
  sub_2269B8500();
  uint64_t v2 = sub_2269B95D0();

  return sub_2269B57B4(a1, v2);
}

unint64_t sub_2269B5550(uint64_t a1, uint64_t a2)
{
  sub_2269B9580();
  sub_2269B8F50();
  uint64_t v4 = sub_2269B95D0();

  return sub_2269B5910(a1, a2, v4);
}

unint64_t sub_2269B55C8(uint64_t a1)
{
  sub_2269B8F30();
  sub_2269B9580();
  sub_2269B8F50();
  uint64_t v2 = sub_2269B95D0();
  swift_bridgeObjectRelease();

  return sub_2269B59F4(a1, v2);
}

unint64_t sub_2269B565C(uint64_t a1)
{
  uint64_t v2 = sub_2269B9210();

  return sub_2269B5B6C(a1, v2);
}

unint64_t sub_2269B56A0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2269B9580();
  sub_2269B95B0();
  sub_2269B95B0();
  sub_2269B95A0();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_2269B8F50();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = sub_2269B95D0();

  return sub_2269B5C88(a1, a2, a3, v6);
}

unint64_t sub_2269B5770(uint64_t a1)
{
  uint64_t v2 = sub_2269B9310();

  return sub_2269B5D80(a1, v2);
}

unint64_t sub_2269B57B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_2269B7F64(&qword_268149978, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_2269B84F0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_2269B84F0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_2269B5910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2269B94F0() & 1) == 0)
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
      while (!v14 && (sub_2269B94F0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2269B59F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2269B8F30();
    uint64_t v8 = v7;
    if (v6 == sub_2269B8F30() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2269B94F0();
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
          uint64_t v13 = sub_2269B8F30();
          uint64_t v15 = v14;
          if (v13 == sub_2269B8F30() && v15 == v16) {
            break;
          }
          char v18 = sub_2269B94F0();
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

unint64_t sub_2269B5B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_226978330(0, (unint64_t *)&qword_2681492B0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_2269B9220();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_2269B9220();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_2269B5C88(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    int v10 = a1;
    unint64_t v11 = HIDWORD(a1);
    uint64_t v12 = ~v6;
    uint64_t v13 = *(void *)(v4 + 48);
    do
    {
      uint64_t v14 = v13 + 24 * v7;
      if (*(_DWORD *)v14 == v10 && *(_DWORD *)(v14 + 4) == v11)
      {
        uint64_t v16 = *(void *)(v14 + 16);
        if (v16)
        {
          if (a3)
          {
            BOOL v17 = *(void *)(v14 + 8) == a2 && v16 == a3;
            if (v17 || (sub_2269B94F0() & 1) != 0) {
              return v7;
            }
          }
        }
        else if (!a3)
        {
          return v7;
        }
      }
      unint64_t v7 = (v7 + 1) & v12;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_2269B5D80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2269B7F08(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A65CCE0](v9, a1);
      sub_2269ABF5C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2269B5E48(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2269B56A0(a1, a2, a3);
  LOBYTE(a3) = v9;
  swift_bridgeObjectRelease();
  if ((a3 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  uint64_t v14 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2269B7144();
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_2269B68A0(v8, v11);
  *unint64_t v4 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2269B5F2C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681491F0);
  uint64_t v6 = sub_2269B9470();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v32 = v2;
  uint64_t v33 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v33 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v32;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v33 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v33 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    double v29 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
    long long v34 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
    if ((a2 & 1) == 0)
    {
      id v30 = v29;
      swift_retain();
    }
    sub_2269B9580();
    type metadata accessor for CFString(0);
    sub_2269B7F64(&qword_268149978, type metadata accessor for CFString);
    sub_2269B8500();
    uint64_t result = sub_2269B95D0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v29;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v18) = v34;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v32;
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2269B6268(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681491D8);
  char v36 = a2;
  uint64_t v6 = sub_2269B9470();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v35 = (void *)(v5 + 64);
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
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }
      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v19 >= v34) {
          goto LABEL_35;
        }
        unint64_t v20 = v35[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v34) {
            goto LABEL_35;
          }
          unint64_t v20 = v35[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v34)
            {
LABEL_35:
              swift_release();
              uint64_t v3 = v2;
              if (v36)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v35 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v20 = v35[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v14 >= v34) {
                  goto LABEL_35;
                }
                unint64_t v20 = v35[v14];
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
        unint64_t v10 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      uint64_t v22 = (void *)(*(void *)(v5 + 48) + 24 * v18);
      *(void *)&long long v13 = *v22;
      long long v37 = v13;
      uint64_t v24 = v22[1];
      uint64_t v23 = v22[2];
      uint64_t v25 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      sub_2269B9580();
      sub_2269B95B0();
      sub_2269B95B0();
      sub_2269B95A0();
      if (v23)
      {
        swift_bridgeObjectRetain();
        sub_2269B8F50();
        swift_bridgeObjectRelease();
      }
      uint64_t result = sub_2269B95D0();
      uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
        long long v13 = v37;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        long long v13 = v37;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v11 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      unint64_t v16 = (void *)(*(void *)(v7 + 48) + 24 * v15);
      *unint64_t v16 = v13;
      v16[1] = v24;
      v16[2] = v23;
      *(void *)(*(void *)(v7 + 56) + 8 * v15) = v25;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2269B65CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149970);
  uint64_t v6 = sub_2269B9470();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    BOOL v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_2269B9210();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2269B68A0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2269B9300();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      uint64_t v25 = v4;
      do
      {
        uint64_t v9 = *(void *)(*(void *)(a2 + 48) + 24 * v6 + 16);
        sub_2269B9580();
        sub_2269B95B0();
        sub_2269B95B0();
        sub_2269B95A0();
        if (v9)
        {
          swift_bridgeObjectRetain();
          sub_2269B8F50();
        }
        uint64_t v10 = sub_2269B95D0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          uint64_t v4 = v25;
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else
        {
          uint64_t v4 = v25;
          if (v11 >= v8) {
            goto LABEL_13;
          }
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_13:
          uint64_t v12 = *(void *)(a2 + 48);
          unint64_t v13 = v12 + 24 * v3;
          int64_t v14 = (long long *)(v12 + 24 * v6);
          if (v3 != v6 || v13 >= (unint64_t)v14 + 24)
          {
            long long v15 = *v14;
            *(void *)(v13 + 16) = *((void *)v14 + 2);
            *(_OWORD *)unint64_t v13 = v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = (void *)(v16 + 8 * v3);
          unint64_t v18 = (void *)(v16 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 1))
          {
            *unint64_t v17 = *v18;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  uint64_t *v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_2269B6AEC(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_2269B549C((uint64_t)a3);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  if (v16 >= v14 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_2269B6F84();
LABEL_7:
    unint64_t v17 = (void *)*v5;
    if (v15)
    {
LABEL_8:
      unint64_t v18 = (void *)(v17[7] + 16 * v11);
      id result = (id)swift_release();
      *unint64_t v18 = a1;
      v18[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_2269B5F2C(v14, a4 & 1);
  unint64_t v20 = sub_2269B549C((uint64_t)a3);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_17:
    type metadata accessor for CFString(0);
    id result = (id)sub_2269B9510();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  unint64_t v17 = (void *)*v5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  v17[(v11 >> 6) + 8] |= 1 << v11;
  *(void *)(v17[6] + 8 * v11) = a3;
  uint64_t v22 = (void *)(v17[7] + 16 * v11);
  *uint64_t v22 = a1;
  v22[1] = a2;
  uint64_t v23 = v17[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17[2] = v25;

  return a3;
}

uint64_t sub_2269B6C60(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_2269B56A0(a2, a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2269B7144();
    goto LABEL_7;
  }
  sub_2269B6268(v17, a5 & 1);
  unint64_t v23 = sub_2269B56A0(a2, a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_15:
    uint64_t result = sub_2269B9510();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2269B6F30(v14, a2, a3, a4, a1, v20);

  return swift_bridgeObjectRetain();
}

void sub_2269B6DBC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_2269B565C((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2269B7308();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2269B65CC(v12, a3 & 1);
  unint64_t v17 = sub_2269B565C((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_226978330(0, (unint64_t *)&qword_2681492B0);
    sub_2269B9510();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v15[2] = v22;

  id v23 = a2;
}

unint64_t sub_2269B6F30(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 24 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  *(void *)(a6[7] + 8 * result) = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

void *sub_2269B6F84()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681491F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2269B9460();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    id v20 = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2269B7144()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681491D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2269B9460();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 24 * v15);
    uint64_t v19 = v17[1];
    uint64_t v18 = v17[2];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v22 = *v17;
    v22[1] = v19;
    v22[2] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2269B7308()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268149970);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2269B9460();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2269B74B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 == a4)
  {
    if (a3)
    {
      if (a6)
      {
        if (a2 == a5 && a3 == a6) {
          return 1;
        }
        if (sub_2269B94F0()) {
          return 1;
        }
      }
    }
    else if (!a6)
    {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_2269B7524(uint64_t a1, void *a2)
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v18 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    while (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      if (a2) {
        goto LABEL_22;
      }
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v18) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v17 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v18) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v17 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v18) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v17 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v18) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v17 + 8 * v8);
          if (!v12)
          {
            int64_t v13 = v11 + 4;
            if (v13 >= v18)
            {
LABEL_24:
              swift_release();
              return 0;
            }
            unint64_t v12 = *(void *)(v17 + 8 * v13);
            int64_t v8 = v13;
            if (!v12) {
              break;
            }
          }
        }
      }
    }
LABEL_21:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    if (a2)
    {
LABEL_22:
      unint64_t v14 = (unsigned int *)(*(void *)(a1 + 48) + 24 * v10);
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      if (v15 == objc_msgSend(a2, sel_contextId))
      {
        swift_release();
        return v15 | (v16 << 32);
      }
      swift_unknownObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v18) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v17 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_21;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_2269B7738(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(a1, sel_keyInfo);
  if (!v4)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_translateKeycode);

  sub_2269B4B70();
  unint64_t v7 = v6;
  objc_msgSend(v6, sel_cancel);

  id v8 = objc_msgSend(a1, sel_keyInfo);
  if (!v8)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  unint64_t v9 = v8;
  unsigned int v10 = objc_msgSend(v8, sel_modifierState);

  uint64_t v11 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey;
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKey);
  if (v12 == 1) {
    int v13 = 2;
  }
  else {
    int v13 = 4;
  }
  if (v12 == 2) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  if ((v14 & v10) != 0
    && (*(_DWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState) & v14) == 0)
  {
    uint64_t v24 = *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount);
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) = v26;
      sub_2269B4B70();
      BOOL v28 = v27;
      uint64_t v29 = swift_allocObject();
      swift_unknownObjectWeakInit();
      unsigned int v43 = sub_2269B7EB0;
      uint64_t v44 = v29;
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 1107296256;
      uint64_t v30 = &block_descriptor_104;
      goto LABEL_26;
    }
    __break(1u);
    goto LABEL_34;
  }
  id v15 = objc_msgSend(a1, sel_keyInfo);
  if (v15)
  {
    uint64_t v16 = v15;
    unsigned int v17 = objc_msgSend(v15, sel_modifierState);

    uint64_t v18 = *(void *)(v2 + v11);
    if (v18 == 1) {
      int v19 = 2;
    }
    else {
      int v19 = 4;
    }
    if (v18 == 2) {
      int v20 = 1;
    }
    else {
      int v20 = v19;
    }
    if ((v20 & v17) != 0
      || (*(_DWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState) & v20) == 0)
    {
      goto LABEL_27;
    }
    uint64_t v21 = OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive;
    if (*(unsigned char *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressIsActive) == 1)
    {
      int64_t v22 = *(void (**)(uint64_t))(v2
                                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased);
      if (v22)
      {
        uint64_t v23 = swift_retain();
        v22(v23);
        sub_226999548((uint64_t)v22);
      }
      *(unsigned char *)(v2 + v21) = 0;
      *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) = 0;
      goto LABEL_27;
    }
    if (*(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) == 3)
    {
      *(void *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationKeyPressCount) = 0;
      uint64_t v35 = *(void (**)(uint64_t))(v2
                                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred);
      if (v35)
      {
        uint64_t v36 = swift_retain();
        v35(v36);
        sub_226999548((uint64_t)v35);
      }
LABEL_27:
      id v32 = objc_msgSend(a1, sel_keyInfo);
      if (v32)
      {
        id v33 = v32;
        unsigned int v34 = objc_msgSend(v32, sel_modifierState);

        *(_DWORD *)(v2 + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousKeyModifierState) = v34;
        return;
      }
      goto LABEL_36;
    }
    sub_2269B4B70();
    BOOL v28 = v37;
    uint64_t v38 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unsigned int v43 = sub_2269B7EA8;
    uint64_t v44 = v38;
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 1107296256;
    uint64_t v30 = &block_descriptor_100;
LABEL_26:
    uint64_t v41 = sub_226982998;
    id v42 = v30;
    BOOL v31 = _Block_copy(&v39);
    swift_release();
    objc_msgSend(v28, sel_afterDelay_processBlock_, v31, 0.5, v39, v40);
    _Block_release(v31);

    goto LABEL_27;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_2269B7AE8(uint64_t a1, void *a2)
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v18 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  if (a2)
  {
    while (1)
    {
      int v14 = (unsigned int *)(*(void *)(a1 + 48) + 24 * v10);
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      if (v15 == objc_msgSend(a2, sel_contextId))
      {
        swift_release();
        return v15 | (v16 << 32);
      }
      swift_unknownObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v6) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      if (v11 >= v18) {
        goto LABEL_25;
      }
      unint64_t v12 = *(void *)(v17 + 8 * v11);
      ++v8;
      if (!v12)
      {
        int64_t v8 = v11 + 1;
        if (v11 + 1 >= v18) {
          goto LABEL_25;
        }
        unint64_t v12 = *(void *)(v17 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 2;
          if (v11 + 2 >= v18) {
            goto LABEL_25;
          }
          unint64_t v12 = *(void *)(v17 + 8 * v8);
          if (!v12)
          {
            int64_t v8 = v11 + 3;
            if (v11 + 3 >= v18) {
              goto LABEL_25;
            }
            unint64_t v12 = *(void *)(v17 + 8 * v8);
            if (!v12)
            {
              int64_t v13 = v11 + 4;
              if (v13 >= v18)
              {
LABEL_25:
                swift_release();
                return 0;
              }
              unint64_t v12 = *(void *)(v17 + 8 * v13);
              int64_t v8 = v13;
              if (!v12) {
                break;
              }
            }
          }
        }
      }
LABEL_20:
      unint64_t v6 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
      if (!a2) {
        goto LABEL_28;
      }
    }
    while (1)
    {
      int64_t v8 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        break;
      }
      if (v8 >= v18) {
        goto LABEL_25;
      }
      unint64_t v12 = *(void *)(v17 + 8 * v8);
      ++v13;
      if (v12) {
        goto LABEL_20;
      }
    }
LABEL_27:
    __break(1u);
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2269B7D04()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2269B7D14()
{
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

id sub_2269B7D64()
{
  return sub_2269B3958(*(void *)(v0 + 16), *(void **)(v0 + 24), *(_DWORD *)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_2269B7D90()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2269B7DD8()
{
  sub_2269B44F0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id, void))(v0 + 32));
}

void sub_2269B7DE4(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_2269B7DF4(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_2269B7E04()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2269B7E3C(void *a1)
{
  return sub_2269B1F28(a1, v1);
}

void sub_2269B7E48()
{
  sub_2269B248C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2269B7E54()
{
  sub_2269B2420(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t objectdestroy_80Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2269B7EA0()
{
  sub_2269B23C4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_2269B7EA8()
{
  sub_2269B4D24(v0);
}

void sub_2269B7EB0()
{
  sub_2269B4C34(v0);
}

uint64_t sub_2269B7EB8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2269B7F08(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2269B7F64(unint64_t *a1, void (*a2)(uint64_t))
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

void _axEventHandler_cold_1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22695C000, a2, OS_LOG_TYPE_ERROR, "info unexpectedly nil inside AXObserver callback! AXNotification: %ld", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_2269B8150()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_2269B8160()
{
  return MEMORY[0x270EEE158]();
}

uint64_t sub_2269B8170()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2269B8180()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2269B8190()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2269B81A0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2269B81B0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2269B81C0()
{
  return MEMORY[0x270EFEAD8]();
}

uint64_t sub_2269B81D0()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_2269B81E0()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_2269B81F0()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_2269B8200()
{
  return MEMORY[0x270EEEAA8]();
}

uint64_t sub_2269B8210()
{
  return MEMORY[0x270EEEAC0]();
}

uint64_t sub_2269B8220()
{
  return MEMORY[0x270EEEAD0]();
}

uint64_t sub_2269B8230()
{
  return MEMORY[0x270EEEAD8]();
}

uint64_t sub_2269B8240()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_2269B8250()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_2269B8260()
{
  return MEMORY[0x270EEEB50]();
}

uint64_t sub_2269B8270()
{
  return MEMORY[0x270EEEB70]();
}

uint64_t sub_2269B8280()
{
  return MEMORY[0x270EEEBF8]();
}

uint64_t sub_2269B8290()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_2269B82A0()
{
  return MEMORY[0x270EEED40]();
}

uint64_t sub_2269B82B0()
{
  return MEMORY[0x270EEED60]();
}

uint64_t sub_2269B82C0()
{
  return MEMORY[0x270EEED88]();
}

uint64_t sub_2269B82D0()
{
  return MEMORY[0x270EEEDD0]();
}

uint64_t sub_2269B82E0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_2269B82F0()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_2269B8300()
{
  return MEMORY[0x270EEEDF8]();
}

uint64_t sub_2269B8310()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_2269B8320()
{
  return MEMORY[0x270EEEE28]();
}

uint64_t sub_2269B8330()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_2269B8340()
{
  return MEMORY[0x270EEEE50]();
}

uint64_t sub_2269B8350()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_2269B8360()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_2269B8370()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_2269B8380()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_2269B8390()
{
  return MEMORY[0x270EEF1B8]();
}

uint64_t sub_2269B83A0()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_2269B83B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2269B83C0()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_2269B83D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2269B83E0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2269B83F0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2269B8400()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2269B8410()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2269B8420()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2269B8430()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2269B8440()
{
  return MEMORY[0x270EF1030]();
}

uint64_t sub_2269B8450()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_2269B8460()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_2269B8470()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2269B8480()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_2269B8490()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2269B84A0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2269B84B0()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2269B84C0()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2269B84D0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2269B84E0()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2269B84F0()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2269B8500()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2269B8510()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2269B8520()
{
  return MEMORY[0x270F3C760]();
}

uint64_t sub_2269B8530()
{
  return MEMORY[0x270F3C768]();
}

uint64_t sub_2269B8540()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2269B8550()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2269B8560()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_2269B8570()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_2269B8580()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_2269B8590()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_2269B85A0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2269B85B0()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_2269B85C0()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_2269B85D0()
{
  return MEMORY[0x270EFEBD0]();
}

uint64_t sub_2269B85E0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2269B85F0()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_2269B8600()
{
  return MEMORY[0x270EFEF68]();
}

uint64_t sub_2269B8610()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_2269B8620()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_2269B8630()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2269B8640()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_2269B8650()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_2269B8660()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2269B8670()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2269B8680()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2269B8690()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2269B86A0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2269B86B0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2269B86C0()
{
  return MEMORY[0x270EFF700]();
}

uint64_t sub_2269B86D0()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_2269B86E0()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_2269B86F0()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_2269B8700()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_2269B8710()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_2269B8720()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_2269B8730()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_2269B8740()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_2269B8750()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_2269B8760()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_2269B8770()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_2269B8780()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_2269B8790()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_2269B87A0()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_2269B87B0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2269B87C0()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_2269B87D0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2269B87E0()
{
  return MEMORY[0x270F009A8]();
}

uint64_t sub_2269B87F0()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_2269B8800()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_2269B8810()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2269B8820()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2269B8830()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2269B8860()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2269B8870()
{
  return MEMORY[0x270F014F8]();
}

uint64_t sub_2269B8880()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2269B8890()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_2269B88A0()
{
  return MEMORY[0x270F01650]();
}

uint64_t sub_2269B88B0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_2269B88C0()
{
  return MEMORY[0x270F016C8]();
}

uint64_t sub_2269B88D0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_2269B88E0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2269B88F0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2269B8900()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_2269B8910()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_2269B8920()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_2269B8930()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_2269B8940()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_2269B8950()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2269B8960()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_2269B8970()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2269B8980()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_2269B8990()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_2269B89A0()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_2269B89B0()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_2269B89C0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2269B89D0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2269B89E0()
{
  return MEMORY[0x270F031D0]();
}

uint64_t sub_2269B89F0()
{
  return MEMORY[0x270F031D8]();
}

uint64_t sub_2269B8A00()
{
  return MEMORY[0x270F031E0]();
}

uint64_t sub_2269B8A10()
{
  return MEMORY[0x270F031E8]();
}

uint64_t sub_2269B8A20()
{
  return MEMORY[0x270F031F0]();
}

uint64_t sub_2269B8A30()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_2269B8A40()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2269B8A50()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2269B8A60()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2269B8A70()
{
  return MEMORY[0x270F035D0]();
}

uint64_t sub_2269B8A80()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_2269B8A90()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2269B8AA0()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_2269B8AB0()
{
  return MEMORY[0x270F03860]();
}

uint64_t sub_2269B8AC0()
{
  return MEMORY[0x270F03A88]();
}

uint64_t sub_2269B8AD0()
{
  return MEMORY[0x270F03E80]();
}

uint64_t sub_2269B8AE0()
{
  return MEMORY[0x270F03F20]();
}

uint64_t sub_2269B8AF0()
{
  return MEMORY[0x270F04038]();
}

uint64_t sub_2269B8B00()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_2269B8B10()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2269B8B20()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2269B8B30()
{
  return MEMORY[0x270F04218]();
}

uint64_t sub_2269B8B40()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2269B8B50()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2269B8B60()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2269B8B70()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2269B8B80()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2269B8BA0()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2269B8BB0()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2269B8BC0()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_2269B8BD0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2269B8C00()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_2269B8C20()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_2269B8C40()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2269B8C50()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2269B8C60()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2269B8C70()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_2269B8C80()
{
  return MEMORY[0x270F04978]();
}

uint64_t sub_2269B8C90()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_2269B8CA0()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_2269B8CB0()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_2269B8CC0()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_2269B8CD0()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_2269B8CE0()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_2269B8CF0()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_2269B8D00()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_2269B8D10()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2269B8D20()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_2269B8D30()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_2269B8D40()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_2269B8D50()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2269B8D60()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2269B8D70()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_2269B8D80()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_2269B8D90()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_2269B8DA0()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_2269B8DB0()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_2269B8DC0()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2269B8DD0()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_2269B8DE0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_2269B8DF0()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_2269B8E00()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_2269B8E10()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2269B8E20()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_2269B8E30()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_2269B8E40()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2269B8E50()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2269B8E60()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_2269B8E70()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2269B8E80()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2269B8E90()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2269B8EA0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2269B8EB0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2269B8EC0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2269B8ED0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_2269B8EE0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_2269B8EF0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2269B8F00()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2269B8F10()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2269B8F20()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2269B8F30()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2269B8F40()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2269B8F50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2269B8F60()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2269B8F70()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2269B8F80()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2269B8F90()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2269B8FA0()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_2269B8FB0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2269B8FC0()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_2269B8FD0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2269B8FE0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2269B8FF0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2269B9000()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2269B9010()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2269B9020()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2269B9030()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2269B9040()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2269B9050()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2269B9060()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2269B9070()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2269B9080()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2269B9090()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2269B90A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2269B90C0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2269B90D0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2269B90E0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2269B90F0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2269B9100()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2269B9110()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2269B9120()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2269B9130()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2269B9140()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2269B9150()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2269B9160()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2269B9170()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2269B9180()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2269B9190()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_2269B91A0()
{
  return MEMORY[0x270FA0CE8]();
}

uint64_t sub_2269B91B0()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_2269B91C0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2269B91D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2269B91E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2269B91F0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2269B9200()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_2269B9210()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2269B9220()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2269B9230()
{
  return MEMORY[0x270EF21E8]();
}

uint64_t sub_2269B9240()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2269B9250()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_2269B9260()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t sub_2269B9270()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_2269B9280()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_2269B9290()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2269B92A0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2269B92B0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2269B92C0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2269B92D0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2269B92F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2269B9300()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2269B9310()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2269B9320()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2269B9330()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2269B9340()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2269B9350()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2269B9360()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2269B9370()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2269B9380()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2269B9390()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2269B93A0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2269B93B0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2269B93C0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2269B93D0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2269B93E0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2269B93F0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2269B9400()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_2269B9410()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_2269B9420()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2269B9430()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2269B9440()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2269B9450()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2269B9460()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2269B9470()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2269B9480()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2269B9490()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2269B94A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2269B94C0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2269B94D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2269B94E0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2269B94F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2269B9500()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2269B9510()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2269B9520()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2269B9530()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2269B9540()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2269B9550()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2269B9560()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2269B9570()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_2269B9580()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2269B9590()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2269B95A0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2269B95B0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2269B95C0()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_2269B95D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2269B95E0()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t AXDeviceSupportsHoverTextTyping()
{
  return MEMORY[0x270F0A048]();
}

uint64_t AXDeviceSupportsPencilHover()
{
  return MEMORY[0x270F0A080]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x270F09818](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x270F09820](*(void *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F09828](observer);
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  return MEMORY[0x270F09830](observer, element, notification);
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x270F098A8]();
}

uint64_t AXUIElementRegisterSystemWideServerDeathCallback()
{
  return MEMORY[0x270F098C0]();
}

uint64_t AXUIElementSharedSystemApp()
{
  return MEMORY[0x270F098D0]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x270F098E8](*(void *)&theType, valuePtr);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x270F82BA8](string);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x270EE9BE8](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x270EE9C10](font);
  return result;
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x270EE9C38](font);
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x270F30618]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x270F90580]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x270F90650]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return MEMORY[0x270F09948]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return MEMORY[0x270F09950]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAXElementForAXUIElementRef()
{
  return MEMORY[0x270F099D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}