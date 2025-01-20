uint64_t property wrapper backing initializer of DefaultAppsSettingsView.model()
{
  uint64_t v1;

  sub_249C8();
  return v1;
}

uint64_t variable initialization expression of DefaultAppsSettingsView._model()
{
  return sub_165E0();
}

uint64_t property wrapper backing initializer of DefaultAppsSettingsView.navigationItem()
{
  sub_B5A4(0, &qword_31580);
  sub_249C8();
  return v1;
}

uint64_t variable initialization expression of DefaultAppsSettingsView._appendSettingsNavigationPath@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_82C8(&qword_31588);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_45D4()
{
  return sub_24808();
}

uint64_t DefaultAppsSettingsView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v60 = sub_82C8(&qword_31590);
  __chkstk_darwin(v60);
  v59 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for DefaultAppsSettingsView();
  uint64_t v53 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v54 = v3;
  uint64_t v56 = (uint64_t)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24878();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  __chkstk_darwin(v4);
  v49 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_82C8(&qword_31598);
  uint64_t v41 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_82C8(&qword_315A0);
  uint64_t v42 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_82C8(&qword_315A8);
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_82C8(&qword_315B0);
  uint64_t v47 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  v46 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_82C8(&qword_315B8);
  __chkstk_darwin(v61);
  v52 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = v1;
  uint64_t v62 = v1;
  sub_82C8(&qword_315C0);
  sub_B88C(&qword_315C8, &qword_315C0);
  sub_248C8();
  sub_24888();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v15 = (id)qword_33240;
  uint64_t v16 = sub_248D8();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t v21 = sub_B88C(&qword_315D0, &qword_31598);
  sub_24968();
  sub_8860(v16, v18, v20);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
  v23 = v49;
  uint64_t v22 = v50;
  uint64_t v24 = v51;
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v51);
  uint64_t v63 = v6;
  uint64_t v64 = v21;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = v45;
  sub_24988();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v26);
  uint64_t v63 = v26;
  uint64_t v64 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v27 = v46;
  uint64_t v28 = v44;
  sub_248F8();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v28);
  uint64_t v30 = v56;
  uint64_t v29 = v57;
  sub_8870(v57, v56);
  unint64_t v31 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  uint64_t v32 = swift_allocObject();
  sub_88D8(v30, v32 + v31);
  uint64_t v33 = v47;
  uint64_t v34 = (uint64_t)v52;
  uint64_t v35 = v48;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v52, v27, v48);
  v36 = (uint64_t (**)())(v34 + *(int *)(v61 + 36));
  *v36 = sub_893C;
  v36[1] = (uint64_t (*)())v32;
  v36[2] = 0;
  v36[3] = 0;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v35);
  sub_82C8(&qword_315D8);
  uint64_t v37 = (uint64_t)v59;
  sub_24A48();
  sub_8870(v29, v30);
  uint64_t v38 = swift_allocObject();
  sub_88D8(v30, v38 + v31);
  sub_8A20();
  sub_8B6C();
  sub_249A8();
  swift_release();
  sub_B1F8(v37, &qword_31590);
  return sub_B1F8(v34, &qword_315B8);
}

uint64_t sub_4E30@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  v39 = a2;
  uint64_t v3 = type metadata accessor for DefaultAppsSettingsView();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v35 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v38 = sub_82C8(&qword_316E0);
  uint64_t v40 = *(void *)(v38 - 8);
  uint64_t v5 = __chkstk_darwin(v38);
  uint64_t v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v31 - v7;
  uint64_t v36 = sub_82C8(&qword_316E8);
  uint64_t v34 = *(void *)(v36 - 8);
  uint64_t v9 = v34;
  uint64_t v10 = __chkstk_darwin(v36);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - v13;
  uint64_t v41 = a1;
  sub_82C8(&qword_316F0);
  sub_B88C(&qword_316F8, &qword_316F0);
  uint64_t v33 = v14;
  sub_24AC8();
  uint64_t v15 = a1[1];
  uint64_t v42 = *a1;
  uint64_t v43 = v15;
  sub_82C8(&qword_316B0);
  sub_249D8();
  uint64_t v16 = v44;
  swift_getKeyPath();
  uint64_t v42 = v16;
  sub_A928(&qword_31700, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_245E8();
  swift_release();
  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v42 = v17;
  sub_8870((uint64_t)a1, (uint64_t)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v18 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  uint64_t v19 = swift_allocObject();
  sub_88D8((uint64_t)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  sub_82C8(&qword_31708);
  sub_245A8();
  sub_82C8(&qword_31710);
  sub_B88C(&qword_31718, &qword_31708);
  sub_AB5C(&qword_31720, &qword_31710, (void (*)(void))sub_AAA4);
  sub_A928(&qword_31798, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24AB8();
  char v20 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v32 = v12;
  uint64_t v21 = v14;
  uint64_t v22 = v36;
  v20(v12, v21, v36);
  v23 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  uint64_t v24 = v37;
  uint64_t v25 = v38;
  v23(v37, v8, v38);
  uint64_t v26 = v39;
  v20(v39, v12, v22);
  uint64_t v27 = sub_82C8(&qword_317A0);
  v23(&v26[*(int *)(v27 + 48)], v24, v25);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v40 + 8);
  v28(v8, v25);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v34 + 8);
  v29(v33, v22);
  v28(v24, v25);
  return ((uint64_t (*)(char *, uint64_t))v29)(v32, v22);
}

uint64_t sub_5378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[1] = a2;
  uint64_t v3 = type metadata accessor for DefaultAppsSettingsView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  if (qword_31570 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_33240;
  NSString v7 = sub_24BB8();
  id v8 = [v6 localizedStringForKey:v7 value:0 table:0];

  uint64_t v9 = sub_24BE8();
  uint64_t v11 = v10;

  v12 = (void *)qword_33240;
  NSString v13 = sub_24BB8();
  id v14 = [v12 localizedStringForKey:v13 value:0 table:0];

  sub_24BE8();
  sub_8870(a1, (uint64_t)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v9;
  *(void *)(v16 + 24) = v11;
  sub_88D8((uint64_t)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  swift_bridgeObjectRetain();
  return sub_24B18();
}

uint64_t sub_55CC(uint64_t a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a4;
  v32[1] = a1;
  uint64_t v35 = sub_24AE8();
  uint64_t v38 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24B08();
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v37 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DefaultAppsSettingsView();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v33 + 64);
  __chkstk_darwin(v10 - 8);
  id v12 = [objc_allocWithZone((Class)UILabel) init];
  NSString v13 = self;
  NSString v14 = sub_24BB8();
  id v15 = [v13 preferredFontForTextStyle:v14];

  [v12 setFont:v15];
  sub_82C8(&qword_31800);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_257B0;
  *(void *)(inited + 32) = NSForegroundColorAttributeName;
  uint64_t v17 = self;
  swift_bridgeObjectRetain();
  unint64_t v18 = NSForegroundColorAttributeName;
  id v19 = [v17 labelColor];
  id v20 = [v19 colorWithAlphaComponent:a2];

  *(void *)(inited + 64) = sub_B5A4(0, &qword_31808);
  *(void *)(inited + 40) = v20;
  sub_185E8(inited);
  id v21 = objc_allocWithZone((Class)NSAttributedString);
  NSString v22 = sub_24BB8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_A928(&qword_31810, type metadata accessor for Key);
  Class isa = sub_24B28().super.isa;
  swift_bridgeObjectRelease();
  id v24 = [v21 initWithString:v22 attributes:isa];

  [v12 setAttributedText:v24];
  sub_B5A4(0, &qword_31818);
  uint64_t v25 = (void *)sub_24D28();
  sub_8870(v34, (uint64_t)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v26 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v27 = swift_allocObject();
  sub_88D8((uint64_t)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
  *(void *)(v27 + ((v11 + v26 + 7) & 0xFFFFFFFFFFFFFFF8)) = v12;
  aBlock[4] = sub_B7E8;
  aBlock[5] = v27;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A45C;
  aBlock[3] = &unk_2D2B0;
  uint64_t v28 = _Block_copy(aBlock);
  id v29 = v12;
  swift_release();
  sub_24AF8();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_A928(&qword_31820, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_82C8(&qword_31828);
  sub_B88C(&qword_31830, &qword_31828);
  uint64_t v30 = v35;
  sub_24D98();
  sub_24D38();
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v9, v37);
}

void sub_5B98(uint64_t a1, uint64_t a2)
{
  type metadata accessor for DefaultAppsSettingsView();
  sub_82C8(&qword_31838);
  sub_249D8();
  [v3 setTitleView:a2];
}

uint64_t sub_5C10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_A928(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_245E8();
  uint64_t v4 = swift_release();
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible) == 1)
  {
    __chkstk_darwin(v4);
    sub_82C8(&qword_31740);
    sub_AB5C(&qword_31738, &qword_31740, (void (*)(void))sub_ABC8);
    sub_24AC8();
    uint64_t v5 = sub_82C8(&qword_31730);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a2, 0, 1, v5);
  }
  else
  {
    uint64_t v7 = sub_82C8(&qword_31730);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a2, 1, 1, v7);
  }
}

uint64_t sub_5DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultAppsSettingsView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  swift_getKeyPath();
  v11[1] = a1;
  sub_A928(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_245E8();
  swift_release();
  uint64_t v7 = (void *)(a1 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  v11[0] = *v7;
  swift_getKeyPath();
  sub_8870(a2, (uint64_t)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  sub_88D8((uint64_t)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  swift_bridgeObjectRetain();
  sub_82C8(&qword_317B0);
  sub_82C8(&qword_31750);
  sub_B88C(&qword_317B8, &qword_317B0);
  sub_ABC8();
  return sub_24A98();
}

uint64_t sub_6020@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_A970(a1, a1[3]);
  uint64_t result = sub_246C8();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_6068@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v3 = sub_82C8(&qword_317C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v42 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_82C8(&qword_31790);
  uint64_t v44 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v43 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_82C8(&qword_317C8);
  __chkstk_darwin(v49);
  uint64_t v51 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_82C8(&qword_317D0);
  __chkstk_darwin(v45);
  v46 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_82C8(&qword_31770);
  __chkstk_darwin(v50);
  uint64_t v48 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_82C8(&qword_316C0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_82C8(&qword_31780);
  uint64_t v47 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  NSString v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_82C8(&qword_31760);
  uint64_t v54 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A970(a1, *((void *)a1 + 3));
  if (sub_246E8())
  {
    uint64_t v38 = v14;
    uint64_t v39 = v12;
    uint64_t v41 = v17;
    uint64_t v40 = v15;
    uint64_t v18 = v53;
    sub_A820((uint64_t)a1, (uint64_t)v59);
    sub_82C8(&qword_316D0);
    type metadata accessor for DefaultLSAppsSettingsProvider();
    if (swift_dynamicCast()
      || (type metadata accessor for DefaultContactlessPaymentSettingsProvider(), uint64_t v22 = swift_dynamicCast(), v22))
    {
      uint64_t v23 = swift_release();
      __chkstk_darwin(v23);
      *(&v38 - 2) = a1;
      sub_7E64(a1, (uint64_t)v11);
      sub_82C8(&qword_317D8);
      sub_B014();
      unint64_t v24 = sub_A8D4();
      uint64_t v55 = &type metadata for AnyView;
      uint64_t v56 = &type metadata for String;
      uint64_t v57 = &protocol witness table for AnyView;
      unint64_t v58 = v24;
      swift_getOpaqueTypeConformance2();
      uint64_t v25 = v38;
      sub_247E8();
      uint64_t v26 = v47;
      uint64_t v27 = v39;
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v46, v25, v39);
      swift_storeEnumTagMultiPayload();
      sub_B88C(&qword_31778, &qword_31780);
      uint64_t v28 = (uint64_t)v48;
      sub_248A8();
      sub_B194(v28, v51, &qword_31770);
      swift_storeEnumTagMultiPayload();
      sub_ACA4();
      sub_B88C(&qword_31788, &qword_31790);
      uint64_t v29 = (uint64_t)v41;
      sub_248A8();
      sub_B1F8(v28, &qword_31770);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
    }
    else
    {
      __chkstk_darwin(v22);
      *(&v38 - 2) = a1;
      unint64_t v30 = sub_A8D4();
      uint64_t v55 = &type metadata for AnyView;
      uint64_t v56 = &type metadata for String;
      uint64_t v57 = &protocol witness table for AnyView;
      unint64_t v58 = v30;
      swift_getOpaqueTypeConformance2();
      uint64_t v31 = v42;
      sub_246F8();
      uint64_t v32 = sub_24708();
      uint64_t v33 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 0, 1, v32);
      __chkstk_darwin(v33);
      *(&v38 - 2) = a1;
      sub_82C8(&qword_317D8);
      sub_B014();
      sub_A928(&qword_316C8, (void (*)(uint64_t))&type metadata accessor for SettingsAnyViewRecipe);
      uint64_t v34 = v43;
      sub_247F8();
      uint64_t v35 = v44;
      uint64_t v36 = v52;
      (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v51, v34, v52);
      swift_storeEnumTagMultiPayload();
      sub_ACA4();
      sub_B88C(&qword_31788, &qword_31790);
      uint64_t v29 = (uint64_t)v41;
      sub_248A8();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
    }
    uint64_t v37 = v40;
    sub_A884((uint64_t)v59);
    sub_B12C(v29, v18);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v18, 0, 1, v37);
  }
  else
  {
    uint64_t v19 = v53;
    id v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
    return v20(v19, 1, 1, v15);
  }
}

uint64_t sub_6A64(void *a1)
{
  uint64_t v2 = sub_82C8(&qword_317F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = a1;
  uint64_t v8 = a1;
  sub_247D8();
  sub_A970(a1, a1[3]);
  sub_246C8();
  sub_B0C0();
  sub_24948();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_6BCC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_A970(a1, a1[3]);
  sub_246A8();
  sub_A8D4();
  uint64_t result = sub_248E8();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_6C54@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_A970(a1, a1[3]);
  sub_24698();
  sub_A8D4();
  uint64_t result = sub_248E8();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_6CCC(uint64_t a1)
{
  uint64_t v2 = sub_82C8(&qword_31590);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24568();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v22 - v10;
  type metadata accessor for DefaultAppsSettingsView();
  sub_82C8(&qword_315D8);
  sub_24A48();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_B1F8((uint64_t)v4, &qword_31590);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    if (qword_31578 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24788();
    sub_A7D0(v12, (uint64_t)qword_33250);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    uint64_t v13 = sub_24768();
    os_log_type_t v14 = sub_24D18();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      v22[1] = a1;
      uint64_t v16 = (uint8_t *)v15;
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136380675;
      v22[0] = v16 + 4;
      sub_A928(&qword_316D8, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v17 = sub_24F18();
      v22[2] = sub_13014(v17, v18, &v23);
      sub_24D58();
      swift_bridgeObjectRelease();
      uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
      v19(v9, v5);
      _os_log_impl(&dword_0, v13, v14, "Received deep link request on appear with URL: %{private}s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v19(v11, v5);
    }
    else
    {

      id v20 = *(void (**)(char *, uint64_t))(v6 + 8);
      v20(v9, v5);
      v20(v11, v5);
    }
  }
  return sub_706C();
}

uint64_t sub_706C()
{
  uint64_t v1 = v0;
  uint64_t v65 = sub_24728();
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v63 = (uint64_t)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24708();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v62 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v67 = (char *)&v56 - v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v56 - v9;
  uint64_t v11 = sub_82C8(&qword_31590);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v70 = (uint64_t)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v69 = (char *)&v56 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v56 - v16;
  uint64_t v18 = sub_24568();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = (char *)v0 + *(int *)(type metadata accessor for DefaultAppsSettingsView() + 20);
  uint64_t v66 = sub_82C8(&qword_315D8);
  v68 = v22;
  sub_24A48();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    uint64_t v23 = &qword_31590;
    unint64_t v24 = (long long *)v17;
    return sub_B1F8((uint64_t)v24, v23);
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  uint64_t v25 = v1[1];
  v71[0] = *v1;
  v71[1] = v25;
  sub_82C8(&qword_316B0);
  sub_249D8();
  sub_157C8((uint64_t)v21, (uint64_t)&v73);
  swift_release();
  if (!v75)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    uint64_t v23 = &qword_316B8;
    unint64_t v24 = &v73;
    return sub_B1F8((uint64_t)v24, v23);
  }
  uint64_t v58 = v18;
  v59 = v21;
  uint64_t v60 = v4;
  sub_A808(&v73, (uint64_t)v76);
  if (qword_31578 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_24788();
  uint64_t v27 = sub_A7D0(v26, (uint64_t)qword_33250);
  sub_A820((uint64_t)v76, (uint64_t)&v73);
  uint64_t v28 = sub_24768();
  os_log_type_t v29 = sub_24D18();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v61 = v10;
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v57 = (uint8_t *)v3;
    uint64_t v32 = (uint8_t *)v31;
    uint64_t v72 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136446210;
    uint64_t v56 = v32 + 4;
    sub_A820((uint64_t)&v73, (uint64_t)v71);
    sub_82C8(&qword_316D0);
    uint64_t v33 = sub_24C08();
    v71[0] = sub_13014(v33, v34, &v72);
    sub_24D58();
    uint64_t v10 = v61;
    swift_bridgeObjectRelease();
    sub_A884((uint64_t)&v73);
    _os_log_impl(&dword_0, v28, v29, "Resolved provider is %{public}s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = (uint64_t)v57;
    swift_slowDealloc();
  }
  else
  {
    sub_A884((uint64_t)&v73);
  }

  __chkstk_darwin(v36);
  *(&v56 - 2) = v76;
  sub_82C8(&qword_316C0);
  unint64_t v37 = sub_A8D4();
  *(void *)&long long v73 = &type metadata for AnyView;
  *((void *)&v73 + 1) = &type metadata for String;
  v74 = &protocol witness table for AnyView;
  unint64_t v75 = v37;
  swift_getOpaqueTypeConformance2();
  sub_246F8();
  uint64_t v38 = v63;
  sub_A0C8(v63);
  sub_A928(&qword_316C8, (void (*)(uint64_t))&type metadata accessor for SettingsAnyViewRecipe);
  sub_24718();
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v38, v65);
  uint64_t v39 = v60;
  uint64_t v40 = v3;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  uint64_t v42 = v67;
  v41(v67, v10, v40);
  uint64_t v65 = v27;
  uint64_t v43 = sub_24768();
  os_log_type_t v44 = sub_24D18();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v63 = v19;
    v46 = (uint8_t *)v45;
    uint64_t v64 = swift_slowAlloc();
    *(void *)&long long v73 = v64;
    *(_DWORD *)v46 = 136446210;
    uint64_t v57 = v46 + 4;
    v41(v62, v42, v40);
    uint64_t v47 = sub_24C08();
    v71[0] = sub_13014(v47, v48, (uint64_t *)&v73);
    sub_24D58();
    swift_bridgeObjectRelease();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v39 + 8);
    v49(v42, v40);
    _os_log_impl(&dword_0, v43, v44, "Appended recipe %{public}s", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v19 = v63;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v49 = *(void (**)(char *, uint64_t))(v39 + 8);
    v49(v42, v40);
  }

  uint64_t v50 = v59;
  uint64_t v51 = (uint64_t)v69;
  uint64_t v52 = v58;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v69, 1, 1, v58);
  sub_B194(v51, v70, &qword_31590);
  sub_24A58();
  sub_B1F8(v51, &qword_31590);
  uint64_t v53 = sub_24768();
  os_log_type_t v54 = sub_24D18();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v55 = 0;
    _os_log_impl(&dword_0, v53, v54, "Reset URL to nil.", v55, 2u);
    swift_slowDealloc();
  }

  v49(v61, v40);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v50, v52);
  return sub_A884((uint64_t)v76);
}

uint64_t sub_79D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_82C8(&qword_31590);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v27 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - v13;
  if (qword_31578 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24788();
  sub_A7D0(v15, (uint64_t)qword_33250);
  uint64_t v30 = a1;
  sub_B194(a1, (uint64_t)v14, &qword_31590);
  sub_B194(a2, (uint64_t)v12, &qword_31590);
  uint64_t v16 = sub_24768();
  os_log_type_t v17 = sub_24D18();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v28 = a2;
    uint64_t v19 = v18;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v32 = v27;
    *(_DWORD *)uint64_t v19 = 136380931;
    uint64_t v29 = a3;
    sub_B194((uint64_t)v14, (uint64_t)v9, &qword_31590);
    uint64_t v20 = sub_24C08();
    uint64_t v31 = sub_13014(v20, v21, &v32);
    sub_24D58();
    swift_bridgeObjectRelease();
    sub_B1F8((uint64_t)v14, &qword_31590);
    *(_WORD *)(v19 + 12) = 2081;
    sub_B194((uint64_t)v12, (uint64_t)v9, &qword_31590);
    uint64_t v22 = sub_24C08();
    uint64_t v31 = sub_13014(v22, v23, &v32);
    sub_24D58();
    swift_bridgeObjectRelease();
    sub_B1F8((uint64_t)v12, &qword_31590);
    _os_log_impl(&dword_0, v16, v17, "Deep link URL changed from %{private}s to %{private}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v28;
    swift_slowDealloc();
  }
  else
  {
    sub_B1F8((uint64_t)v14, &qword_31590);
    sub_B1F8((uint64_t)v12, &qword_31590);
  }

  uint64_t v24 = sub_24568();
  uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48);
  uint64_t result = v25(v30, 1, v24);
  if (result == 1)
  {
    uint64_t result = v25(a2, 1, v24);
    if (result != 1) {
      return sub_706C();
    }
  }
  return result;
}

uint64_t DefaultAppsSettingsView.init(deepLinkURL:navigationItem:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for DefaultAppsSettingsModel();
  swift_allocObject();
  sub_165E0();
  sub_249C8();
  *a2 = v8;
  a2[1] = v9;
  uint64_t v4 = (int *)type metadata accessor for DefaultAppsSettingsView();
  uint64_t v5 = (void *)((char *)a2 + v4[7]);
  *uint64_t v5 = swift_getKeyPath();
  sub_82C8(&qword_31588);
  swift_storeEnumTagMultiPayload();
  sub_B194(a1, (uint64_t)a2 + v4[5], &qword_315D8);
  sub_B5A4(0, &qword_31580);
  sub_249C8();
  uint64_t result = sub_B1F8(a1, &qword_315D8);
  uint64_t v7 = (void *)((char *)a2 + v4[6]);
  *uint64_t v7 = v8;
  v7[1] = v9;
  return result;
}

uint64_t sub_7E64@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v3 = sub_82C8(&qword_316C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A970(a1, a1[3]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19[3] = AssociatedTypeWitness;
  v19[4] = swift_getAssociatedConformanceWitness();
  uint64_t v8 = sub_A9B4(v19);
  uint64_t v9 = sub_246D8();
  __chkstk_darwin(v9);
  (*(void (**)(char *, uint64_t *, uint64_t))(v11 + 16))((char *)&v18[-1] - v10, v8, AssociatedTypeWitness);
  v18[5] = sub_24A38();
  sub_A970(a1, a1[3]);
  uint64_t v12 = sub_246B8();
  uint64_t v14 = v13;
  sub_A820((uint64_t)a1, (uint64_t)v18);
  if (!v14)
  {
    sub_A970(v18, v18[3]);
    uint64_t v12 = sub_24698();
    uint64_t v14 = v15;
  }
  sub_A884((uint64_t)v18);
  v18[0] = v12;
  v18[1] = v14;
  sub_A8D4();
  sub_24978();
  swift_bridgeObjectRelease();
  swift_release();
  sub_A884((uint64_t)v19);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v17, v6, v3);
}

uint64_t sub_811C()
{
  return sub_24958();
}

uint64_t sub_813C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_A928(&qword_31700, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_81E8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_82C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for DefaultAppsSettingsView()
{
  uint64_t result = qword_31658;
  if (!qword_31658) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_8358@<X0>(char *a1@<X8>)
{
  return sub_4E30(*(void **)(v1 + 16), a1);
}

uint64_t sub_8360(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_83A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_A928(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_245E8();
  swift_release();
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_8474()
{
  return swift_bridgeObjectRelease();
}

unint64_t variable initialization expression of DefaultContactlessPaymentSettingsProvider.id()
{
  return 0xD00000000000002CLL;
}

uint64_t variable initialization expression of DefaultContactlessPaymentSettingsProvider.available()
{
  return 0;
}

uint64_t variable initialization expression of DefaultContactlessPaymentSettingsProvider.localizedTitle()
{
  uint64_t v0 = sub_245C8();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_24BA8();
  __chkstk_darwin(v1 - 8);
  sub_24B48();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v2 = (id)qword_33240;
  sub_245B8();
  return sub_24BF8();
}

uint64_t variable initialization expression of AppRecord._bundleIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of DefaultContactlessPaymentSettingsProvider.localizedNavigationTitle()
{
  uint64_t v0 = sub_245C8();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_24BA8();
  __chkstk_darwin(v1 - 8);
  sub_24B48();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v2 = (id)qword_33240;
  sub_245B8();
  return sub_24BF8();
}

uint64_t variable initialization expression of AppRecord._record()
{
  return 0;
}

uint64_t variable initialization expression of DefaultContactlessPaymentSettingsProvider.selection()
{
  return sub_21ED8(0);
}

void *variable initialization expression of DefaultContactlessPaymentSettingsProvider.candidateApps()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_8860(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_8870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultAppsSettingsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_88D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultAppsSettingsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_893C()
{
  uint64_t v1 = *(void *)(type metadata accessor for DefaultAppsSettingsView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_6CCC(v2);
}

uint64_t sub_89A0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for DefaultAppsSettingsView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_79D4(a1, a2, v6);
}

unint64_t sub_8A20()
{
  unint64_t result = qword_315E0;
  if (!qword_315E0)
  {
    sub_8360(&qword_315B8);
    sub_8360(&qword_315A8);
    sub_8360(&qword_315A0);
    sub_8360(&qword_31598);
    sub_B88C(&qword_315D0, &qword_31598);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_315E0);
  }
  return result;
}

unint64_t sub_8B6C()
{
  unint64_t result = qword_315E8;
  if (!qword_315E8)
  {
    sub_8360(&qword_31590);
    sub_A928(&qword_315F0, (void (*)(uint64_t))&type metadata accessor for URL);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_315E8);
  }
  return result;
}

uint64_t variable initialization expression of AppRecord.name()
{
  return 0;
}

uint64_t variable initialization expression of AppRecord.uuid()
{
  uint64_t v0 = sub_245A8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24598();
  uint64_t v4 = sub_24578();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t variable initialization expression of AppRecord._relayCallingOption()
{
  return 3;
}

uint64_t sub_8D00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for DefaultAppsSettingsView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
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
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v12 = *(int *)(sub_82C8(&qword_315D8) + 32);
    uint64_t v13 = (char *)v9 + v12;
    uint64_t v14 = &v10[v12];
    uint64_t v15 = sub_24568();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = sub_82C8(&qword_31590);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    uint64_t v18 = a3[6];
    uint64_t v19 = a3[7];
    uint64_t v20 = (uint64_t *)((char *)a1 + v18);
    unint64_t v21 = (char *)a2 + v18;
    uint64_t v22 = *(void **)v21;
    uint64_t v23 = *((void *)v21 + 1);
    *uint64_t v20 = *(void *)v21;
    v20[1] = v23;
    uint64_t v24 = (uint64_t *)((char *)a1 + v19);
    uint64_t v25 = (uint64_t *)((char *)a2 + v19);
    id v26 = v22;
    swift_retain();
    sub_82C8(&qword_31588);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_24728();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v24, v25, v27);
    }
    else
    {
      *uint64_t v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for DefaultAppsSettingsView(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[5];
  swift_release();
  swift_release();
  uint64_t v5 = v4 + *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v6 = sub_24568();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  swift_release();
  uint64_t v8 = a1 + a2[7];
  sub_82C8(&qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24728();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

void *initializeWithCopy for DefaultAppsSettingsView(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
  void *v8 = *(void *)((char *)a2 + v7);
  v8[1] = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v11 = *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = &v9[v11];
  uint64_t v14 = sub_24568();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_82C8(&qword_31590);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[6];
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (char *)a2 + v17;
  unint64_t v21 = *(void **)v20;
  uint64_t v22 = *((void *)v20 + 1);
  *uint64_t v19 = *(void *)v20;
  v19[1] = v22;
  uint64_t v23 = (void *)((char *)a1 + v18);
  uint64_t v24 = (void *)((char *)a2 + v18);
  id v25 = v21;
  swift_retain();
  sub_82C8(&qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = sub_24728();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v23, v24, v26);
  }
  else
  {
    void *v23 = *v24;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for DefaultAppsSettingsView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_24568();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
LABEL_6:
    uint64_t v17 = sub_82C8(&qword_31590);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
LABEL_7:
  uint64_t v18 = a3[6];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  unint64_t v21 = *(void **)((char *)a2 + v18);
  uint64_t v22 = *(void **)v19;
  *(void *)uint64_t v19 = v21;
  id v23 = v21;

  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v24 = a3[7];
    id v25 = (void *)((char *)a1 + v24);
    uint64_t v26 = (void *)((char *)a2 + v24);
    sub_B1F8((uint64_t)a1 + v24, &qword_31588);
    sub_82C8(&qword_31588);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_24728();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *id v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for DefaultAppsSettingsView(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  uint64_t v10 = *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_24568();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = sub_82C8(&qword_31590);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v16 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_82C8(&qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_24728();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for DefaultAppsSettingsView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  swift_release();
  uint64_t v9 = *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_24568();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
LABEL_6:
    uint64_t v17 = sub_82C8(&qword_31590);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_7:
  uint64_t v18 = a3[6];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  unint64_t v21 = *(void **)((char *)a1 + v18);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);

  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v22 = a3[7];
    id v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    sub_B1F8((uint64_t)a1 + v22, &qword_31588);
    uint64_t v25 = sub_82C8(&qword_31588);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_24728();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultAppsSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9AB0);
}

uint64_t sub_9AB0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_82C8(&qword_315D8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_82C8(&qword_315F8);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      int v16 = (char *)a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for DefaultAppsSettingsView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9BF8);
}

void *sub_9BF8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_82C8(&qword_315D8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_82C8(&qword_315F8);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      int v16 = (char *)v5 + *(int *)(a4 + 28);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_9D2C()
{
  sub_9E00();
  if (v0 <= 0x3F)
  {
    sub_9E5C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_9E00()
{
  if (!qword_31668)
  {
    sub_8360(&qword_31590);
    unint64_t v0 = sub_24A88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_31668);
    }
  }
}

void sub_9E5C()
{
  if (!qword_31670)
  {
    sub_24728();
    unint64_t v0 = sub_247B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_31670);
    }
  }
}

uint64_t sub_9EB4()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for LSDefaultAppCategory(uint64_t a1)
{
}

uint64_t sub_9F48@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_A928(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_245E8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible);
  return result;
}

uint64_t sub_9FF8()
{
  return swift_release();
}

uint64_t sub_A0C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24848();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_82C8(&qword_31588);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B194(v2, (uint64_t)v10, &qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24728();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_24D08();
    uint64_t v14 = sub_248B8();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      int v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)int v16 = 136315138;
      void v18[2] = sub_13014(0xD000000000000022, 0x8000000000026950, &v19);
      sub_24D58();
      _os_log_impl(&dword_0, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_24838();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_A380(uint64_t a1, uint64_t a2)
{
  return sub_A4EC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_A398(uint64_t a1, id *a2)
{
  uint64_t result = sub_24BC8();
  *a2 = 0;
  return result;
}

uint64_t sub_A410(uint64_t a1, id *a2)
{
  char v3 = sub_24BD8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_A490@<X0>(void *a1@<X8>)
{
  sub_24BE8();
  NSString v2 = sub_24BB8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_A4D4(uint64_t a1, uint64_t a2)
{
  return sub_A4EC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_A4EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24BE8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_A530()
{
  sub_24BE8();
  sub_24C18();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_A584()
{
  sub_24BE8();
  sub_24F48();
  sub_24C18();
  Swift::Int v0 = sub_24F58();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_A5F8(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_A604@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_A614()
{
  uint64_t v0 = sub_24BE8();
  uint64_t v2 = v1;
  if (v0 == sub_24BE8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24F28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_A6A0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_24BB8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_A6E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24BE8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_A714(uint64_t a1)
{
  uint64_t v2 = sub_A928(&qword_31810, type metadata accessor for Key);
  uint64_t v3 = sub_A928(&qword_31868, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_A7D0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_A808(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_A820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_A884(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_A8D4()
{
  unint64_t result = qword_31A90;
  if (!qword_31A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31A90);
  }
  return result;
}

uint64_t sub_A928(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_A970(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *sub_A9B4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_AA18@<X0>(uint64_t a1@<X8>)
{
  return sub_5378(*(void *)(v1 + 16), a1);
}

uint64_t sub_AA24@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for DefaultAppsSettingsView();

  return sub_5C10(a1, a2);
}

unint64_t sub_AAA4()
{
  unint64_t result = qword_31728;
  if (!qword_31728)
  {
    sub_8360(&qword_31730);
    sub_AB5C(&qword_31738, &qword_31740, (void (*)(void))sub_ABC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31728);
  }
  return result;
}

uint64_t sub_AB5C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8360(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_ABC8()
{
  return sub_AB5C(&qword_31748, &qword_31750, (void (*)(void))sub_AC04);
}

unint64_t sub_AC04()
{
  unint64_t result = qword_31758;
  if (!qword_31758)
  {
    sub_8360(&qword_31760);
    sub_ACA4();
    sub_B88C(&qword_31788, &qword_31790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31758);
  }
  return result;
}

unint64_t sub_ACA4()
{
  unint64_t result = qword_31768;
  if (!qword_31768)
  {
    sub_8360(&qword_31770);
    sub_B88C(&qword_31778, &qword_31780);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31768);
  }
  return result;
}

uint64_t sub_AD3C()
{
  return sub_5DEC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_AD48()
{
  uint64_t v1 = (int *)type metadata accessor for DefaultAppsSettingsView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[5];
  swift_release();
  swift_release();
  uint64_t v7 = v6 + *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v8 = sub_24568();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  swift_release();
  uint64_t v10 = v5 + v1[7];
  sub_82C8(&qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24728();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_AF34@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for DefaultAppsSettingsView();

  return sub_6068(a1, a2);
}

uint64_t sub_AFB4@<X0>(uint64_t a1@<X8>)
{
  return sub_7E64(*(void **)(v1 + 16), a1);
}

uint64_t sub_AFD0()
{
  return sub_6A64(*(void **)(v0 + 16));
}

unint64_t sub_B014()
{
  unint64_t result = qword_317E0;
  if (!qword_317E0)
  {
    sub_8360(&qword_317D8);
    sub_B0C0();
    sub_A928(&qword_317F8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_317E0);
  }
  return result;
}

unint64_t sub_B0C0()
{
  unint64_t result = qword_317E8;
  if (!qword_317E8)
  {
    sub_8360(&qword_317F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_317E8);
  }
  return result;
}

uint64_t sub_B12C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82C8(&qword_31760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_B194(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_82C8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_B1F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_82C8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_B254()
{
  return sub_6A64(*(void **)(v0 + 16));
}

uint64_t sub_B298@<X0>(uint64_t a1@<X8>)
{
  return sub_6BCC(*(void **)(v1 + 16), a1);
}

uint64_t sub_B2B4@<X0>(uint64_t a1@<X8>)
{
  return sub_6C54(*(void **)(v1 + 16), a1);
}

uint64_t sub_B2D0()
{
  return sub_237C0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_B2EC()
{
  return sub_23830(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_B30C()
{
  return sub_160B4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_B328()
{
  uint64_t v1 = (int *)type metadata accessor for DefaultAppsSettingsView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[5];
  swift_release();
  swift_release();
  uint64_t v7 = v6 + *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v8 = sub_24568();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  swift_release();
  uint64_t v10 = v5 + v1[7];
  sub_82C8(&qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24728();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_B51C(double a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for DefaultAppsSettingsView() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_55CC(v4, a1, v5, v6);
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_B5A4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_B5E0()
{
  uint64_t v1 = (int *)type metadata accessor for DefaultAppsSettingsView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[5];
  swift_release();
  swift_release();
  uint64_t v7 = v6 + *(int *)(sub_82C8(&qword_315D8) + 32);
  uint64_t v8 = sub_24568();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  swift_release();
  uint64_t v10 = v5 + v1[7];
  sub_82C8(&qword_31588);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24728();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  unint64_t v12 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = v12 + 8;

  return _swift_deallocObject(v0, v13, v2 | 7);
}

void sub_B7E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for DefaultAppsSettingsView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_5B98(v0 + v2, v3);
}

uint64_t sub_B874(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_B884()
{
  return swift_release();
}

uint64_t sub_B88C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8360(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_B8E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_B92C()
{
  return sub_A928(&qword_31850, type metadata accessor for Key);
}

uint64_t sub_B974()
{
  return sub_A928(&qword_31858, type metadata accessor for Key);
}

uint64_t sub_B9BC()
{
  return sub_A928(&qword_31860, type metadata accessor for Key);
}

uint64_t sub_BA14()
{
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_BAB4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 32);
  return result;
}

uint64_t sub_BB5C()
{
  return swift_release();
}

uint64_t sub_BC2C()
{
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_BCDC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 64);
  *a2 = *(void *)(v3 + 56);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_BD88()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_BE6C()
{
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_BF1C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 104);
  *a2 = *(void *)(v3 + 96);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_BFC8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_C0AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_245C8();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_24BA8();
  __chkstk_darwin(v3 - 8);
  swift_getKeyPath();
  uint64_t v16 = v0;
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 112);
  swift_getKeyPath();
  uint64_t v16 = v4;
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  swift_retain();
  sub_245E8();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 32);
  unint64_t v6 = *(void *)(v4 + 40);
  swift_release();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    swift_getKeyPath();
    uint64_t v16 = v1;
    sub_245E8();
    swift_release();
    uint64_t v8 = *(void *)(v1 + 112);
    swift_getKeyPath();
    uint64_t v16 = v8;
    swift_retain();
    sub_245E8();
    swift_release();
    uint64_t v9 = *(void *)(v8 + 32);
    uint64_t v10 = *(void *)(v8 + 40);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
    sub_24B48();
    if (qword_31570 != -1) {
      swift_once();
    }
    id v11 = (id)qword_33240;
    sub_245B8();
    uint64_t v9 = sub_24BF8();
    uint64_t v10 = v12;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(void *)&v15[-32] = v1;
  *(void *)&v15[-24] = v9;
  *(void *)&v15[-16] = v10;
  uint64_t v16 = v1;
  sub_245D8();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_C4D4();
}

uint64_t sub_C430()
{
  return swift_retain();
}

uint64_t sub_C4D4()
{
  uint64_t v1 = v0;
  sub_24B88();
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v2);
  uint64_t v3 = sub_245C8();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_24BA8();
  __chkstk_darwin(v4 - 8);
  swift_getKeyPath();
  uint64_t v36 = v0;
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v0 + 128) & 1) == 0)
  {
    switch(*(void *)(v0 + 88))
    {
      case 1:
        swift_getKeyPath();
        uint64_t v36 = v0;
        sub_245E8();
        swift_release();
        uint64_t v6 = *(void *)(v0 + 112);
        swift_getKeyPath();
        uint64_t v36 = v6;
        sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
        swift_retain();
        sub_245E8();
        swift_release();
        uint64_t v7 = *(void *)(v6 + 64);
        swift_release();
        if (v7)
        {
          sub_24B78();
          v37._countAndFlagsBits = 0;
          v37._object = (void *)0xE000000000000000;
          sub_24B68(v37);
          swift_getKeyPath();
          uint64_t v36 = v1;
          sub_245E8();
          swift_release();
          uint64_t v8 = *(void *)(v1 + 112);
          swift_getKeyPath();
          uint64_t v36 = v8;
          swift_retain();
          sub_245E8();
          swift_release();
          uint64_t v9 = *(void *)(v8 + 32);
          uint64_t v10 = *(void **)(v8 + 40);
          swift_bridgeObjectRetain();
          swift_release();
          v38._countAndFlagsBits = v9;
          v38._object = v10;
          sub_24B58(v38);
          swift_bridgeObjectRelease();
          v39._countAndFlagsBits = 0xD00000000000006ELL;
          v39._object = (void *)0x80000000000270B0;
          sub_24B68(v39);
          sub_24B98();
          if (qword_31570 != -1) {
            goto LABEL_25;
          }
        }
        else
        {
          sub_24B48();
          if (qword_31570 != -1) {
            goto LABEL_25;
          }
        }
        goto LABEL_23;
      case 2:
        swift_getKeyPath();
        uint64_t v36 = v0;
        sub_245E8();
        swift_release();
        uint64_t v20 = *(void *)(v0 + 112);
        swift_getKeyPath();
        uint64_t v36 = v20;
        sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
        swift_retain();
        sub_245E8();
        swift_release();
        uint64_t v21 = *(void *)(v20 + 64);
        swift_release();
        if (v21)
        {
          sub_24B78();
          v43._countAndFlagsBits = 0;
          v43._object = (void *)0xE000000000000000;
          sub_24B68(v43);
          swift_getKeyPath();
          uint64_t v36 = v1;
          sub_245E8();
          swift_release();
          uint64_t v22 = *(void *)(v1 + 112);
          swift_getKeyPath();
          uint64_t v36 = v22;
          swift_retain();
          sub_245E8();
          swift_release();
          uint64_t v23 = *(void *)(v22 + 32);
          uint64_t v24 = *(void **)(v22 + 40);
          swift_bridgeObjectRetain();
          swift_release();
          v44._countAndFlagsBits = v23;
          v44._object = v24;
          sub_24B58(v44);
          swift_bridgeObjectRelease();
          v45._countAndFlagsBits = 0xD000000000000061;
          v45._object = (void *)0x8000000000027010;
          sub_24B68(v45);
          sub_24B98();
          if (qword_31570 != -1) {
            goto LABEL_25;
          }
        }
        else
        {
          sub_24B48();
          if (qword_31570 != -1) {
            goto LABEL_25;
          }
        }
        goto LABEL_23;
      case 3:
        swift_getKeyPath();
        uint64_t v36 = v0;
        sub_245E8();
        swift_release();
        uint64_t v11 = *(void *)(v0 + 112);
        swift_getKeyPath();
        uint64_t v36 = v11;
        sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
        swift_retain();
        sub_245E8();
        swift_release();
        uint64_t v12 = *(void *)(v11 + 64);
        swift_release();
        if (v12)
        {
          sub_24B78();
          v40._countAndFlagsBits = 0;
          v40._object = (void *)0xE000000000000000;
          sub_24B68(v40);
          swift_getKeyPath();
          uint64_t v36 = v1;
          sub_245E8();
          swift_release();
          uint64_t v13 = *(void *)(v1 + 112);
          swift_getKeyPath();
          uint64_t v36 = v13;
          swift_retain();
          sub_245E8();
          swift_release();
          uint64_t v14 = *(void *)(v13 + 32);
          os_log_type_t v15 = *(void **)(v13 + 40);
          swift_bridgeObjectRetain();
          swift_release();
          v41._countAndFlagsBits = v14;
          v41._object = v15;
          sub_24B58(v41);
          swift_bridgeObjectRelease();
          v42._countAndFlagsBits = 0xD000000000000067;
          v42._object = (void *)0x8000000000026F60;
          sub_24B68(v42);
          sub_24B98();
          if (qword_31570 != -1) {
            goto LABEL_25;
          }
        }
        else
        {
          sub_24B48();
          if (qword_31570 != -1) {
            goto LABEL_25;
          }
        }
        goto LABEL_23;
      case 4:
        swift_getKeyPath();
        uint64_t v36 = v0;
        sub_245E8();
        swift_release();
        uint64_t v16 = *(void *)(v0 + 112);
        swift_getKeyPath();
        uint64_t v36 = v16;
        sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
        swift_retain();
        sub_245E8();
        swift_release();
        uint64_t v17 = *(void *)(v16 + 64);
        swift_release();
        if (v17) {
          goto LABEL_16;
        }
        swift_getKeyPath();
        uint64_t v36 = v1;
        sub_245E8();
        swift_release();
        uint64_t v18 = *(void *)(v1 + 112);
        swift_getKeyPath();
        uint64_t v36 = v18;
        swift_retain();
        sub_245E8();
        swift_release();
        int v19 = *(unsigned __int8 *)(v18 + 80);
        swift_release();
        if (v19 != 3)
        {
LABEL_16:
          sub_24B78();
          v46._countAndFlagsBits = 0;
          v46._object = (void *)0xE000000000000000;
          sub_24B68(v46);
          swift_getKeyPath();
          uint64_t v36 = v1;
          sub_245E8();
          swift_release();
          uint64_t v25 = *(void *)(v1 + 112);
          swift_getKeyPath();
          uint64_t v36 = v25;
          swift_retain();
          sub_245E8();
          swift_release();
          uint64_t v26 = *(void *)(v25 + 32);
          uint64_t v27 = *(void **)(v25 + 40);
          swift_bridgeObjectRetain();
          swift_release();
          v47._countAndFlagsBits = v26;
          v47._object = v27;
          sub_24B58(v47);
          swift_bridgeObjectRelease();
          v48._countAndFlagsBits = 0x676E696C6C614320;
          v48._object = (void *)0xEF7265746F6F4620;
          sub_24B68(v48);
          sub_24B98();
          if (qword_31570 == -1) {
            goto LABEL_23;
          }
        }
        else
        {
          sub_24B48();
          if (qword_31570 == -1) {
            goto LABEL_23;
          }
        }
LABEL_25:
        swift_once();
LABEL_23:
        id v28 = (id)qword_33240;
        sub_245B8();
        uint64_t v29 = sub_24BF8();
        uint64_t v31 = v30;
        uint64_t KeyPath = swift_getKeyPath();
        __chkstk_darwin(KeyPath);
        *(void *)&v35[-32] = v1;
        *(void *)&v35[-24] = v29;
        uint64_t v33 = v31;
        uint64_t v36 = v1;
        sub_245D8();
        swift_release();
        uint64_t result = swift_bridgeObjectRelease();
        break;
      default:
        int v34 = 0;
        uint64_t v33 = 186;
        sub_24E88();
        __break(1u);
        JUMPOUT(0xD3ECLL);
    }
  }
  return result;
}

uint64_t sub_D3FC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 112);
  return swift_retain();
}

uint64_t sub_D4A8()
{
  return swift_release();
}

uint64_t sub_D588(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 112) = a2;
  swift_retain_n();
  swift_release();
  sub_C0AC();
  return swift_release();
}

uint64_t sub_D5E4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_D688@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 120);
  return swift_bridgeObjectRetain();
}

uint64_t sub_D734()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_D814()
{
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t sub_D8B4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 128);
  return result;
}

uint64_t sub_D95C()
{
  return swift_release();
}

uint64_t sub_DA2C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_DAD0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 136);
  return swift_unknownObjectRetain();
}

uint64_t sub_DB7C()
{
  return swift_unknownObjectRelease();
}

unsigned char *sub_DC5C(uint64_t a1)
{
  uint64_t v2 = (unsigned char *)v1;
  uint64_t v4 = sub_245C8();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_24BA8();
  __chkstk_darwin(v5 - 8);
  *(unsigned char *)(v1 + 32) = 0;
  type metadata accessor for AppRecord();
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 96) = 0;
  *(void *)(v1 + 104) = 0;
  swift_allocObject();
  *(void *)(v1 + 112) = sub_21ED8(0);
  *(void *)(v1 + 120) = _swiftEmptyArrayStorage;
  *(unsigned char *)(v1 + 128) = 0;
  *(void *)(v1 + 136) = 0;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  *(void *)(v1 + 88) = a1;
  switch(a1)
  {
    case 1:
      *(void *)(v1 + 16) = 0xD000000000000021;
      *(void *)(v1 + 24) = 0x80000000000272E0;
      sub_24B48();
      if (qword_31570 != -1) {
        swift_once();
      }
      id v6 = (id)qword_33240;
      sub_245B8();
      *(void *)(v1 + 40) = sub_24BF8();
      *(void *)(v1 + 48) = v7;
      sub_24B48();
      id v8 = v6;
      sub_245B8();
      *(void *)(v1 + 72) = sub_24BF8();
      *(void *)(v1 + 80) = v9;
      id v10 = [self sharedConnection];
      if (!v10)
      {
        __break(1u);
LABEL_19:
        LODWORD(v40) = 0;
        uint64_t v39 = 81;
        sub_24E88();
        __break(1u);
        JUMPOUT(0xE684);
      }
      uint64_t v11 = v10;
      unsigned __int8 v12 = [v10 isDefaultBrowserModificationAllowed];

      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      uint64_t v39 = (uint64_t)v2;
      LOBYTE(v40) = v12 ^ 1;
      sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
      sub_245D8();
      swift_release();
      swift_getKeyPath();
      Swift::String v42 = v2;
      sub_245E8();
      swift_release();
      if (v2[128])
      {
        sub_24B48();
        id v14 = (id)qword_33240;
        sub_245B8();
        uint64_t v15 = sub_24BF8();
        uint64_t v17 = v16;
        uint64_t v18 = swift_getKeyPath();
        __chkstk_darwin(v18);
        *(void *)&v41[-32] = v2;
        *(void *)&v41[-24] = v15;
        uint64_t v39 = v17;
        Swift::String v42 = v2;
        sub_245D8();
        swift_release();
        swift_bridgeObjectRelease();
      }
LABEL_16:
      sub_F2E8();
      sub_ED18();
      sub_E694();
      sub_C4D4();
      uint64_t v37 = swift_allocObject();
      swift_weakInit();
      swift_retain();
      swift_retain();
      sub_1A194((uint64_t)v2, (uint64_t)sub_155B0, v37);
      swift_release();
      swift_release_n();
      return v2;
    case 2:
      *(void *)(v1 + 16) = 0xD00000000000001FLL;
      *(void *)(v1 + 24) = 0x80000000000272A0;
      sub_24B48();
      if (qword_31570 == -1) {
        goto LABEL_15;
      }
      goto LABEL_17;
    case 3:
      *(void *)(v1 + 16) = 0xD000000000000023;
      *(void *)(v1 + 24) = 0x8000000000027250;
      sub_24B48();
      if (qword_31570 == -1) {
        goto LABEL_15;
      }
LABEL_17:
      swift_once();
LABEL_15:
      id v33 = (id)qword_33240;
      sub_245B8();
      *(void *)(v1 + 40) = sub_24BF8();
      *(void *)(v1 + 48) = v34;
      sub_24B48();
      id v35 = v33;
      sub_245B8();
      *(void *)(v1 + 72) = sub_24BF8();
      *(void *)(v1 + 80) = v36;
      goto LABEL_16;
    case 4:
      *(void *)(v1 + 16) = 0xD000000000000024;
      *(void *)(v1 + 24) = 0x8000000000027200;
      sub_24B48();
      if (qword_31570 != -1) {
        swift_once();
      }
      id v19 = (id)qword_33240;
      sub_245B8();
      *(void *)(v1 + 40) = sub_24BF8();
      *(void *)(v1 + 48) = v20;
      sub_24B48();
      id v21 = v19;
      sub_245B8();
      *(void *)(v1 + 72) = sub_24BF8();
      *(void *)(v1 + 80) = v22;
      uint64_t v23 = CFNotificationCenterGetDarwinNotifyCenter();
      if (qword_31550 != -1) {
        swift_once();
      }
      CFNotificationCenterAddObserver(v23, v2, (CFNotificationCallback)sub_EBE8, (CFStringRef)qword_31870, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      uint64_t v24 = swift_allocObject();
      swift_weakInit();
      uint64_t v25 = (objc_class *)type metadata accessor for DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor();
      uint64_t v26 = (char *)objc_allocWithZone(v25);
      uint64_t v27 = (uint64_t (**)())&v26[OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProviderP33_40EE96E35A8AC8EA956464E45E3106DB23CallCapabilitiesMonitor_notify];
      void *v27 = sub_15588;
      v27[1] = (uint64_t (*)())v24;
      v43.receiver = v26;
      v43.super_class = v25;
      swift_retain_n();
      id v28 = objc_msgSendSuper2(&v43, "init");
      uint64_t v29 = self;
      sub_B5A4(0, &qword_31818);
      id v30 = v28;
      uint64_t v31 = (void *)sub_24D28();
      [v29 addDelegate:v30 queue:v31];

      swift_release_n();
      uint64_t v32 = swift_getKeyPath();
      __chkstk_darwin(v32);
      uint64_t v39 = (uint64_t)v2;
      id v40 = v28;
      Swift::String v42 = v2;
      sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
      sub_245D8();
      swift_release();

      goto LABEL_16;
    default:
      goto LABEL_19;
  }
}

void sub_E694()
{
  uint64_t v1 = v0;
  id v2 = [self defaultWorkspace];
  if (!v2) {
    __break(1u);
  }
  uint64_t v3 = v2;
  uint64_t v4 = v1[11];
  id v24 = 0;
  id v5 = [v2 defaultApplicationForCategory:v4 error:&v24];

  id v6 = v24;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    id v8 = v6;
    sub_24528();

    swift_willThrow();
    if (qword_31578 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24788();
    sub_A7D0(v9, (uint64_t)qword_33250);
    swift_retain();
    swift_errorRetain();
    swift_retain();
    swift_errorRetain();
    id v10 = sub_24768();
    os_log_type_t v11 = sub_24CF8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v22 = (void *)swift_slowAlloc();
      id v24 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136446466;
      type metadata accessor for LSDefaultAppCategory(0);
      uint64_t v13 = sub_24C08();
      sub_13014(v13, v14, (uint64_t *)&v24);
      sub_24D58();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2112;
      swift_errorRetain();
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      sub_24D58();
      *uint64_t v22 = v23;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v10, v11, "Could not fetch default app for category %{public}s. Error: %@", (uint8_t *)v12, 0x16u);
      sub_82C8((uint64_t *)&unk_31BC0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_release_n();
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v7 = 0;
  }
  type metadata accessor for AppRecord();
  swift_allocObject();
  id v15 = v5;
  sub_21ED8(v7);
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  id v24 = v1;
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245D8();
  swift_release();
  swift_release();
  if (v4 == 4
    && (id v17 = [self currentDevice],
        uint64_t v18 = (char *)[v17 userInterfaceIdiom],
        v17,
        v18 == (unsigned char *)&dword_0 + 1)
    && (unint64_t v19 = defaultAppRelayTelephonySetting(), v19 < 3)
    && (unsigned __int8 v20 = v19, swift_allocObject(), sub_226A8(v20)))
  {
    uint64_t v21 = swift_getKeyPath();
    __chkstk_darwin(v21);
    id v24 = v1;
    sub_245D8();

    swift_release();
    swift_release();
  }
  else
  {
  }
}

uint64_t sub_EBE8(uint64_t result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    uint64_t v7 = (void *)result;
    type metadata accessor for DefaultLSAppsSettingsProvider();
    swift_unknownObjectRetain();
    id v8 = v7;
    id v9 = a3;
    id v10 = a5;
    if (swift_dynamicCastClass()) {
      sub_E694();
    }

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_EC90()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_ED18();
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_E694();
    return swift_release();
  }
  return result;
}

unint64_t sub_ED18()
{
  uint64_t v28 = sub_245A8();
  uint64_t v1 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24548();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  __chkstk_darwin(v4);
  id v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v34 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v7 = self;
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v23 = v0;
  uint64_t v24 = v8;
  id v9 = objc_msgSend(v7, "enumeratorForViableDefaultAppsForCategory:options:");
  sub_24CE8();

  uint64_t v29 = v6;
  sub_24538();
  if (v33)
  {
    uint64_t v27 = (char *)&type metadata for Any + 8;
    do
    {
      sub_15634(&v32, &v31);
      sub_B5A4(0, &qword_31BD0);
      if (swift_dynamicCast()) {
        id v10 = v30;
      }
      else {
        id v10 = 0;
      }
      type metadata accessor for AppRecord();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0;
      *(void *)(v11 + 24) = 0;
      *(void *)(v11 + 32) = 0;
      *(void *)(v11 + 40) = 0xE000000000000000;
      sub_24598();
      uint64_t v12 = sub_24578();
      uint64_t v14 = v13;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v28);
      *(void *)(v11 + 48) = v12;
      *(void *)(v11 + 56) = v14;
      *(void *)(v11 + 64) = 0;
      *(void *)(v11 + 72) = 0;
      *(unsigned char *)(v11 + 80) = 3;
      _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      *(&v23 - 2) = v11;
      *(&v23 - 1) = (uint64_t)v10;
      id v30 = (void *)v11;
      sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_245D8();
      swift_release();

      sub_24C38();
      if (*(void *)((char *)&dword_10 + (v34 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v34 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_24C68();
      sub_24C88();
      sub_24C58();
      sub_24538();
    }
    while (v33);
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v26);
  sub_F874(&v34);
  if (v24 != 4) {
    goto LABEL_21;
  }
  id v16 = [self currentDevice];
  id v17 = (char *)[v16 userInterfaceIdiom];

  if (v17 != (unsigned char *)&dword_0 + 1) {
    goto LABEL_21;
  }
  uint64_t v18 = self;
  if (([v18 isThumperCallingEnabled] & 1) != 0
    || [v18 isRelayCallingEnabled])
  {
    type metadata accessor for AppRecord();
    swift_allocObject();
    unint64_t result = sub_226A8(2u);
    if (!result) {
      goto LABEL_23;
    }
    sub_24C38();
    if (*(void *)((char *)&dword_10 + (v34 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v34 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_24C68();
    sub_24C88();
    sub_24C58();
    sub_F874(&v34);
  }
  type metadata accessor for AppRecord();
  swift_allocObject();
  unint64_t result = sub_226A8(1u);
  if (result)
  {
    sub_24C38();
    if (*(void *)((char *)&dword_10 + (v34 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v34 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_24C68();
    sub_24C88();
    sub_24C58();
LABEL_21:
    unint64_t v20 = v34;
    uint64_t v21 = swift_getKeyPath();
    __chkstk_darwin(v21);
    uint64_t v22 = v23;
    *(&v23 - 2) = v23;
    *(&v23 - 1) = v20;
    *(void *)&long long v32 = v22;
    sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
    sub_245D8();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

id sub_F2E8()
{
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v2 = result;
    [result canChangeDefaultAppForCategory:*(void *)(v0 + 88)];

    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
    sub_245D8();
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_F418()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_F2E8();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_ED18();
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_E694();
    return swift_release();
  }
  return result;
}

char *sub_F4D0()
{
  sub_19F90((uint64_t)v0);
  uint64_t v1 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_31558 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v1, v0, (CFNotificationName)qword_31878, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v2 = &v0[OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProvider___observationRegistrar];
  uint64_t v3 = sub_24628();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t sub_F5D8()
{
  sub_F4D0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_F630()
{
  return type metadata accessor for DefaultLSAppsSettingsProvider();
}

uint64_t type metadata accessor for DefaultLSAppsSettingsProvider()
{
  uint64_t result = qword_318B0;
  if (!qword_318B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_F684()
{
  uint64_t result = sub_24628();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_F770(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0x8000000000026850;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0xD000000000000010;
    }
    else {
      unint64_t v4 = 0xD000000000000016;
    }
    if (v3 == 1) {
      unint64_t v5 = 0x8000000000026870;
    }
    else {
      unint64_t v5 = 0x8000000000026890;
    }
    int v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1) {
        unint64_t v7 = 0xD000000000000010;
      }
      else {
        unint64_t v7 = 0xD000000000000016;
      }
      if (v6 == 1) {
        unint64_t v2 = 0x8000000000026870;
      }
      else {
        unint64_t v2 = 0x8000000000026890;
      }
      if (v4 != v7) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xD000000000000019;
    unint64_t v5 = 0x8000000000026850;
    int v6 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  if (v4 != 0xD000000000000019)
  {
LABEL_21:
    char v8 = sub_24F28();
    goto LABEL_22;
  }
LABEL_19:
  if (v5 != v2) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_F874(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    unint64_t v2 = sub_14D24(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  v6[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v6[1] = v4;
  sub_1366C(v6);
  return sub_24C58();
}

uint64_t sub_F8FC(uint64_t a1)
{
  uint64_t v3 = sub_82C8(&qword_31B60);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  uint64_t v17 = v1;
  uint64_t v18 = a1;
  uint64_t v19 = v1;
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  swift_retain();
  sub_245D8();
  swift_release();
  swift_release();
  uint64_t v6 = *(void *)(v1 + 88);
  if (v6 == 4)
  {
    id v7 = [self currentDevice];
    char v8 = (char *)[v7 userInterfaceIdiom];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      swift_getKeyPath();
      uint64_t v19 = a1;
      sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_245E8();
      swift_release();
      switch(*(unsigned char *)(a1 + 80))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_7;
        case 3:
          break;
        default:
          char v9 = sub_24F28();
          swift_bridgeObjectRelease();
          if (v9)
          {
LABEL_7:
            id v10 = self;
            if (([v10 isThumperCallingEnabled] & 1) == 0) {
              [v10 isRelayCallingEnabled];
            }
          }
          break;
      }
      setDefaultAppRelayTelephonySetting();
    }
  }
  uint64_t v11 = sub_24CD8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  sub_24CB8();
  swift_retain();
  swift_retain();
  uint64_t v13 = sub_24CA8();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v6;
  v14[5] = a1;
  v14[6] = v12;
  swift_release();
  sub_10640((uint64_t)v5, (uint64_t)&unk_31B70, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_FCD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  sub_82C8(&qword_31B60);
  v6[23] = swift_task_alloc();
  v6[24] = sub_24CB8();
  v6[25] = sub_24CA8();
  uint64_t v8 = sub_24C98();
  v6[26] = v8;
  v6[27] = v7;
  return _swift_task_switch(sub_FDA0, v8, v7);
}

uint64_t sub_FDA0()
{
  id v1 = [self defaultWorkspace];
  v0[28] = v1;
  if (v1)
  {
    unint64_t v2 = v1;
    uint64_t v3 = v0[20];
    uint64_t v4 = v0[21];
    swift_getKeyPath();
    v0[15] = v4;
    sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
    sub_245E8();
    swift_release();
    unint64_t v5 = *(void **)(v4 + 64);
    v0[29] = v5;
    v0[2] = v0;
    v0[7] = v0 + 31;
    v0[3] = sub_FF68;
    uint64_t v6 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_1044C;
    v0[13] = &unk_2D418;
    v0[14] = v6;
    [v2 setDefaultApplicationForCategory:v3 toApplicationRecord:v5 completionHandler:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_FF68()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 240) = v2;
  uint64_t v3 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 208);
  if (v2) {
    unint64_t v5 = sub_1010C;
  }
  else {
    unint64_t v5 = sub_10098;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10098()
{
  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = (void *)v0[29];
  swift_release();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1010C()
{
  uint64_t v22 = v0;
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = (void *)v0[28];
  swift_release();
  swift_willThrow();

  if (qword_31578 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24788();
  sub_A7D0(v3, (uint64_t)qword_33250);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = sub_24768();
  os_log_type_t v5 = sub_24CF8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[30];
  if (v6)
  {
    uint64_t v8 = v0[20];
    uint64_t v9 = swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446466;
    v0[16] = v8;
    type metadata accessor for LSDefaultAppCategory(0);
    uint64_t v10 = sub_24C08();
    v0[18] = sub_13014(v10, v11, v21);
    sub_24D58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v0[19] = v7;
    swift_errorRetain();
    sub_82C8(&qword_31B98);
    uint64_t v12 = sub_24C08();
    v0[17] = sub_13014(v12, v13, v21);
    sub_24D58();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v4, v5, "Could not change default app for category %{public}s. Error: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v14 = v0[23];
  uint64_t v15 = v0[22];
  uint64_t v16 = sub_24CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  swift_retain();
  uint64_t v17 = sub_24CA8();
  uint64_t v18 = (void *)swift_allocObject();
  void v18[2] = v17;
  void v18[3] = &protocol witness table for MainActor;
  v18[4] = v15;
  sub_107EC(v14, (uint64_t)&unk_31B90, (uint64_t)v18);
  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_1044C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_82C8(&qword_31B98);
    uint64_t v5 = swift_allocError();
    *BOOL v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  sub_24CB8();
  v4[7] = sub_24CA8();
  uint64_t v6 = sub_24C98();
  return _swift_task_switch(sub_10598, v6, v5);
}

uint64_t sub_10598()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_E694();
    swift_release();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_B1F8(a1, &qword_31B60);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24C98();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_107EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_B1F8(a1, &qword_31B60);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24C98();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_82C8(&qword_31BB8);
  return swift_task_create();
}

uint64_t sub_109A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = sub_82C8(&qword_31A40);
  uint64_t v3 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v31 = a1;
  v24[1] = sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v6 = *(void *)(a1 + 104);
  if (v6)
  {
    uint64_t v31 = *(void *)(a1 + 96);
    uint64_t v32 = v6;
    sub_A8D4();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_248E8();
    uint64_t v11 = v10 & 1;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v11 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v31 = v7;
  uint64_t v32 = v8;
  uint64_t v33 = v11;
  uint64_t v34 = v9;
  sub_82C8(&qword_31A88);
  sub_82C8(&qword_31A68);
  uint64_t v12 = sub_8360(&qword_31A48);
  uint64_t v13 = sub_24868();
  uint64_t v14 = sub_8360(&qword_31A50);
  uint64_t v15 = sub_B88C(&qword_31A58, &qword_31A50);
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v27 = v12;
  uint64_t v28 = v13;
  uint64_t v29 = OpaqueTypeConformance2;
  id v30 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  sub_12884();
  sub_24AD8();
  swift_getKeyPath();
  uint64_t v31 = a1;
  sub_245E8();
  swift_release();
  char v17 = *(unsigned char *)(a1 + 128);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = v17;
  uint64_t v21 = v25;
  uint64_t v20 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v25, v5, v26);
  uint64_t v22 = (uint64_t *)(v21 + *(int *)(sub_82C8(&qword_31A28) + 36));
  *uint64_t v22 = KeyPath;
  v22[1] = (uint64_t)sub_14894;
  v22[2] = v19;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v20);
}

uint64_t sub_10CF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_24868();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  uint64_t v34 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_82C8(&qword_31A50);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_82C8(&qword_31A48);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24888();
  uint64_t v29 = v16;
  uint64_t v30 = v15;
  v27[3] = v17;
  uint64_t v28 = v18;
  sub_24CB8();
  swift_retain();
  uint64_t v19 = sub_24CA8();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = a1;
  swift_retain();
  uint64_t v21 = sub_24CA8();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v21;
  void v22[3] = &protocol witness table for MainActor;
  v22[4] = a1;
  type metadata accessor for AppRecord();
  sub_24A68();
  uint64_t v36 = v38;
  long long v37 = v39;
  sub_82C8(&qword_31A98);
  sub_14C04(&qword_31AA0, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_148FC();
  sub_24A28();
  uint64_t v23 = sub_B88C(&qword_31A58, &qword_31A50);
  sub_24938();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_24858();
  uint64_t v38 = v7;
  *(void *)&long long v39 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v24 = v31;
  uint64_t v25 = v33;
  sub_24928();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v24);
}

uint64_t sub_11108@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 112);
  return swift_retain();
}

uint64_t sub_111B4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v2 = swift_retain();
  char v3 = _s27DefaultAppsSettingsUIPlugin9AppRecordC2eeoiySbAC_ACtFZ_0(v2, v1);
  uint64_t result = swift_release();
  if ((v3 & 1) == 0) {
    return sub_F8FC(v1);
  }
  return result;
}

uint64_t sub_11284()
{
  return sub_24AA8();
}

uint64_t sub_11440()
{
  return sub_247C8();
}

uint64_t sub_1153C()
{
  return sub_249B8();
}

uint64_t sub_11610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 40);
  *(void *)a2 = *(void *)(a1 + 32);
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = _swiftEmptyArrayStorage;
  return swift_bridgeObjectRetain();
}

uint64_t sub_116CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v61 = a3;
  uint64_t v58 = sub_82C8(&qword_31B40);
  __chkstk_darwin(v58);
  v59 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_82C8(&qword_31B48);
  __chkstk_darwin(v53);
  uint64_t v56 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_82C8(&qword_31B30);
  uint64_t v6 = __chkstk_darwin(v55);
  uint64_t v52 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v54 = (uint64_t)&v47 - v8;
  uint64_t v57 = sub_82C8(&qword_31B20);
  __chkstk_darwin(v57);
  char v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_82C8(&qword_31B50);
  __chkstk_darwin(v62);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_82C8(&qword_31B00);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_82C8(&qword_31B10);
  __chkstk_darwin(v63);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v64 = a1;
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    id v19 = objc_allocWithZone((Class)ISIcon);
    swift_bridgeObjectRetain();
    NSString v20 = sub_24BB8();
    swift_bridgeObjectRelease();
    [v19 initWithBundleIdentifier:v20];

    id v21 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
    sub_24758();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v12, v16, v13);
    swift_storeEnumTagMultiPayload();
    sub_B88C(&qword_31AF8, &qword_31B00);
    sub_14A5C();
    sub_248A8();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  else
  {
    Swift::String v48 = v10;
    uint64_t v49 = v12;
    uint64_t v50 = v14;
    uint64_t v51 = v18;
    if (*(void *)(v60 + 88) == 4
      && (id v23 = [self currentDevice],
          uint64_t v24 = (char *)[v23 userInterfaceIdiom],
          v23,
          v24 == (unsigned char *)&dword_0 + 1))
    {
      swift_getKeyPath();
      uint64_t v64 = a1;
      sub_245E8();
      swift_release();
      uint64_t v25 = v50;
      uint64_t v26 = v16;
      switch(*(unsigned char *)(a1 + 80))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_10;
        case 3:
          goto LABEL_7;
        default:
          char v27 = sub_24F28();
          swift_bridgeObjectRelease();
          if (v27)
          {
LABEL_10:
            id v40 = objc_allocWithZone((Class)ISIcon);
            NSString v41 = sub_24BB8();
            [v40 initWithBundleIdentifier:v41];

            id v42 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
            sub_24758();
            objc_super v43 = v52;
            (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v52, v26, v13);
            (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v13);
            uint64_t v44 = (uint64_t)v43;
            uint64_t v32 = v54;
            sub_14C54(v44, v54);
            sub_B194(v32, v56, &qword_31B30);
          }
          else
          {
LABEL_7:
            id v28 = [self genericApplicationIcon];
            id v29 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
            sub_24758();
            uint64_t v30 = v52;
            (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v52, v26, v13);
            (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v13);
            uint64_t v31 = (uint64_t)v30;
            uint64_t v32 = v54;
            sub_14C54(v31, v54);
            sub_B194(v32, v56, &qword_31B30);
          }
          swift_storeEnumTagMultiPayload();
          sub_149BC(&qword_31B28, &qword_31B30, (void (*)(void))sub_14BA8);
          uint64_t v45 = (uint64_t)v48;
          sub_248A8();
          uint64_t v46 = (uint64_t)v59;
          uint64_t v39 = (uint64_t)v49;
          uint64_t v38 = (uint64_t)v51;
          sub_B1F8(v32, &qword_31B30);
          sub_B194(v45, v46, &qword_31B20);
          swift_storeEnumTagMultiPayload();
          sub_14AFC();
          sub_B88C(&qword_31AF8, &qword_31B00);
          sub_248A8();
          sub_B1F8(v45, &qword_31B20);
          break;
      }
    }
    else
    {
      id v33 = [self genericApplicationIcon];
      id v34 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
      uint64_t v35 = v16;
      sub_24758();
      uint64_t v36 = v50;
      uint64_t v37 = v13;
      (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v59, v35, v13);
      swift_storeEnumTagMultiPayload();
      sub_14AFC();
      sub_B88C(&qword_31AF8, &qword_31B00);
      uint64_t v38 = (uint64_t)v51;
      sub_248A8();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
      uint64_t v39 = (uint64_t)v49;
    }
    sub_B194(v38, v39, &qword_31B10);
    swift_storeEnumTagMultiPayload();
    sub_B88C(&qword_31AF8, &qword_31B00);
    sub_14A5C();
    sub_248A8();
    return sub_B1F8(v38, &qword_31B10);
  }
}

id sub_12100()
{
  ObjectType = (objc_class *)swift_getObjectType();
  [self removeDelegate:v0];
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor()
{
  return self;
}

void *sub_123C0()
{
  return &protocol witness table for String;
}

uint64_t sub_123CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_12400()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v1 + 32);
}

uint64_t sub_124A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_124D4()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_14C04(&qword_31A80, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_12584()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_125B8()
{
  sub_82C8(&qword_31A28);
  sub_126A8();

  return sub_248C8();
}

uint64_t sub_1262C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1263C()
{
  return sub_14C04(&qword_31A20, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
}

uint64_t sub_12684()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_126A0@<X0>(uint64_t a1@<X8>)
{
  return sub_109A0(v1, a1);
}

unint64_t sub_126A8()
{
  unint64_t result = qword_31A30;
  if (!qword_31A30)
  {
    sub_8360(&qword_31A28);
    sub_12748();
    sub_B88C(&qword_31A70, &qword_31A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31A30);
  }
  return result;
}

unint64_t sub_12748()
{
  unint64_t result = qword_31A38;
  if (!qword_31A38)
  {
    sub_8360(&qword_31A40);
    sub_8360(&qword_31A48);
    sub_24868();
    sub_8360(&qword_31A50);
    sub_B88C(&qword_31A58, &qword_31A50);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_12884();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31A38);
  }
  return result;
}

unint64_t sub_12884()
{
  unint64_t result = qword_31A60;
  if (!qword_31A60)
  {
    sub_8360(&qword_31A68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31A60);
  }
  return result;
}

uint64_t sub_128F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10CF4(v1, a1);
}

NSString sub_12908()
{
  NSString result = sub_24BB8();
  qword_31870 = (uint64_t)result;
  return result;
}

id sub_12940()
{
  if (qword_31550 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_31870;
  qword_31878 = qword_31870;

  return v0;
}

uint64_t sub_129A4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_12A50()
{
  return swift_bridgeObjectRelease();
}

id sub_12B34@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 64);
  *a2 = v4;

  return v4;
}

void sub_12BEC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  id v2 = v1;
  sub_245D8();
  swift_release();
}

uint64_t sub_12CC8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 80);
  return result;
}

uint64_t sub_12D70()
{
  return swift_release();
}

uint64_t sub_12E40(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_12F1C;
  return v6(a1);
}

uint64_t sub_12F1C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_13014(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_130E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_153DC((uint64_t)v12, *a3);
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
      sub_153DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_A884((uint64_t)v12);
  return v7;
}

uint64_t sub_130E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24D68();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_132A4(a5, a6);
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
  uint64_t v8 = sub_24E18();
  if (!v8)
  {
    sub_24E78();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24ED8();
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

uint64_t sub_132A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1333C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1351C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1351C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1333C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_134B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24DE8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_24E78();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C28();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_24ED8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_24E78();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_134B4(uint64_t a1, uint64_t a2)
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
  sub_82C8(&qword_31BA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1351C(char a1, int64_t a2, char a3, char *a4)
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
    sub_82C8(&qword_31BA0);
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
  uint64_t result = sub_24ED8();
  __break(1u);
  return result;
}

Swift::Int sub_1366C(uint64_t *a1)
{
  Swift::Int v2 = a1[1];
  Swift::Int result = sub_24F08(v2);
  Swift::Int v93 = v2;
  if (result >= v2)
  {
    if (v2 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v2 >= 2)
    {
      int64_t v8 = (void *)*a1;
      uint64_t v9 = -1;
      uint64_t v10 = 1;
      v101 = (void *)*a1;
      do
      {
        uint64_t v96 = v10;
        uint64_t v99 = v9;
        v94 = v8;
        do
        {
          swift_getKeyPath();
          sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
          swift_retain();
          swift_retain();
          sub_245E8();
          swift_release();
          swift_getKeyPath();
          swift_bridgeObjectRetain();
          sub_245E8();
          swift_release();
          sub_A8D4();
          uint64_t v11 = sub_24D88();
          swift_release();
          swift_release();
          Swift::Int result = swift_bridgeObjectRelease();
          if (v11 != -1) {
            break;
          }
          if (!v101) {
            goto LABEL_140;
          }
          uint64_t v12 = *v8;
          void *v8 = v8[1];
          v8[1] = v12;
          --v8;
        }
        while (!__CFADD__(v9++, 1));
        uint64_t v10 = v96 + 1;
        int64_t v8 = v94 + 1;
        uint64_t v9 = v99 - 1;
      }
      while (v96 + 1 != v93);
    }
    return result;
  }
  if (v2 >= 0) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v2 + 1;
  }
  if (v2 < -1) {
    goto LABEL_146;
  }
  Swift::Int v5 = result;
  v86 = a1;
  if (v2 < 2)
  {
    uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v103 = (uint64_t)&_swiftEmptyArrayStorage;
    v98 = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v2 != 1)
    {
      unint64_t v16 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_103:
      if (v16 >= 2)
      {
        uint64_t v80 = *v86;
        do
        {
          unint64_t v81 = v16 - 2;
          if (v16 < 2) {
            goto LABEL_132;
          }
          if (!v80) {
            goto LABEL_145;
          }
          uint64_t v82 = *(void *)&v14[16 * v81 + 32];
          uint64_t v83 = *(void *)&v14[16 * v16 + 24];
          sub_14164((char *)(v80 + 8 * v82), (char *)(v80 + 8 * *(void *)&v14[16 * v16 + 16]), v80 + 8 * v83, v98);
          if (v100) {
            break;
          }
          if (v83 < v82) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v14 = sub_14818((uint64_t)v14);
          }
          if (v81 >= *((void *)v14 + 2)) {
            goto LABEL_134;
          }
          v84 = &v14[16 * v81 + 32];
          *(void *)v84 = v82;
          *((void *)v84 + 1) = v83;
          unint64_t v85 = *((void *)v14 + 2);
          if (v16 > v85) {
            goto LABEL_135;
          }
          memmove(&v14[16 * v16 + 16], &v14[16 * v16 + 32], 16 * (v85 - v16));
          *((void *)v14 + 2) = v85 - 1;
          unint64_t v16 = v85 - 1;
        }
        while (v85 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)((char *)&dword_10 + (v103 & 0xFFFFFFFFFFFFFF8)) = 0;
      sub_24C58();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v6 = v4 >> 1;
    type metadata accessor for AppRecord();
    uint64_t v7 = sub_24C78();
    *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)) = v6;
    v98 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v103 = v7;
  }
  Swift::Int v90 = v5;
  Swift::Int v15 = 0;
  uint64_t v88 = *a1 + 16;
  uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v87 = *a1 - 8;
  uint64_t v102 = *a1;
  while (1)
  {
    Swift::Int v17 = v15++;
    Swift::Int v95 = v17;
    if (v15 < v2)
    {
      swift_getKeyPath();
      sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
      swift_retain();
      swift_retain();
      sub_245E8();
      swift_release();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      sub_245E8();
      swift_release();
      sub_A8D4();
      uint64_t v91 = sub_24D88();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      Swift::Int v15 = v17 + 2;
      if (v17 + 2 < v2)
      {
        uint64_t v18 = v88 + 8 * v17;
        while (1)
        {
          swift_getKeyPath();
          swift_retain();
          swift_retain();
          sub_245E8();
          swift_release();
          swift_getKeyPath();
          swift_bridgeObjectRetain();
          sub_245E8();
          swift_release();
          uint64_t v19 = sub_24D88();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          if ((v91 == -1) == (v19 != -1)) {
            break;
          }
          ++v15;
          v18 += 8;
          Swift::Int v2 = v93;
          if (v93 == v15)
          {
            Swift::Int v15 = v93;
            goto LABEL_29;
          }
        }
        Swift::Int v2 = v93;
LABEL_29:
        Swift::Int v17 = v95;
      }
      if (v91 == -1)
      {
        if (v15 < v17) {
          goto LABEL_141;
        }
        if (v17 < v15)
        {
          NSString v20 = (uint64_t *)(v87 + 8 * v15);
          Swift::Int v21 = v15;
          Swift::Int v22 = v17;
          id v23 = (uint64_t *)(v102 + 8 * v17);
          do
          {
            if (v22 != --v21)
            {
              if (!v102) {
                goto LABEL_144;
              }
              uint64_t v24 = *v23;
              uint64_t *v23 = *v20;
              *NSString v20 = v24;
            }
            ++v22;
            --v20;
            ++v23;
          }
          while (v22 < v21);
        }
      }
    }
    if (v15 < v2)
    {
      if (__OFSUB__(v15, v17)) {
        goto LABEL_136;
      }
      if (v15 - v17 < v90) {
        break;
      }
    }
LABEL_55:
    if (v15 < v17) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_14660(0, *((void *)v14 + 2) + 1, 1, v14);
    }
    unint64_t v30 = *((void *)v14 + 2);
    unint64_t v29 = *((void *)v14 + 3);
    unint64_t v16 = v30 + 1;
    uint64_t v31 = v102;
    if (v30 >= v29 >> 1)
    {
      v79 = sub_14660((char *)(v29 > 1), v30 + 1, 1, v14);
      uint64_t v31 = v102;
      uint64_t v14 = v79;
    }
    *((void *)v14 + 2) = v16;
    uint64_t v32 = v14 + 32;
    id v33 = &v14[16 * v30 + 32];
    *(void *)id v33 = v17;
    *((void *)v33 + 1) = v15;
    if (v30)
    {
      while (1)
      {
        unint64_t v34 = v16 - 1;
        if (v16 >= 4)
        {
          uint64_t v39 = &v32[16 * v16];
          uint64_t v40 = *((void *)v39 - 8);
          uint64_t v41 = *((void *)v39 - 7);
          BOOL v45 = __OFSUB__(v41, v40);
          uint64_t v42 = v41 - v40;
          if (v45) {
            goto LABEL_120;
          }
          uint64_t v44 = *((void *)v39 - 6);
          uint64_t v43 = *((void *)v39 - 5);
          BOOL v45 = __OFSUB__(v43, v44);
          uint64_t v37 = v43 - v44;
          char v38 = v45;
          if (v45) {
            goto LABEL_121;
          }
          unint64_t v46 = v16 - 2;
          uint64_t v47 = &v32[16 * v16 - 32];
          uint64_t v49 = *(void *)v47;
          uint64_t v48 = *((void *)v47 + 1);
          BOOL v45 = __OFSUB__(v48, v49);
          uint64_t v50 = v48 - v49;
          if (v45) {
            goto LABEL_123;
          }
          BOOL v45 = __OFADD__(v37, v50);
          uint64_t v51 = v37 + v50;
          if (v45) {
            goto LABEL_126;
          }
          if (v51 >= v42)
          {
            v69 = &v32[16 * v34];
            uint64_t v71 = *(void *)v69;
            uint64_t v70 = *((void *)v69 + 1);
            BOOL v45 = __OFSUB__(v70, v71);
            uint64_t v72 = v70 - v71;
            if (v45) {
              goto LABEL_130;
            }
            BOOL v62 = v37 < v72;
            goto LABEL_92;
          }
        }
        else
        {
          if (v16 != 3)
          {
            uint64_t v63 = *((void *)v14 + 4);
            uint64_t v64 = *((void *)v14 + 5);
            BOOL v45 = __OFSUB__(v64, v63);
            uint64_t v56 = v64 - v63;
            char v57 = v45;
            goto LABEL_86;
          }
          uint64_t v36 = *((void *)v14 + 4);
          uint64_t v35 = *((void *)v14 + 5);
          BOOL v45 = __OFSUB__(v35, v36);
          uint64_t v37 = v35 - v36;
          char v38 = v45;
        }
        if (v38) {
          goto LABEL_122;
        }
        unint64_t v46 = v16 - 2;
        uint64_t v52 = &v32[16 * v16 - 32];
        uint64_t v54 = *(void *)v52;
        uint64_t v53 = *((void *)v52 + 1);
        BOOL v55 = __OFSUB__(v53, v54);
        uint64_t v56 = v53 - v54;
        char v57 = v55;
        if (v55) {
          goto LABEL_125;
        }
        uint64_t v58 = &v32[16 * v34];
        uint64_t v60 = *(void *)v58;
        uint64_t v59 = *((void *)v58 + 1);
        BOOL v45 = __OFSUB__(v59, v60);
        uint64_t v61 = v59 - v60;
        if (v45) {
          goto LABEL_128;
        }
        if (__OFADD__(v56, v61)) {
          goto LABEL_129;
        }
        if (v56 + v61 >= v37)
        {
          BOOL v62 = v37 < v61;
LABEL_92:
          if (v62) {
            unint64_t v34 = v46;
          }
          goto LABEL_94;
        }
LABEL_86:
        if (v57) {
          goto LABEL_124;
        }
        uint64_t v65 = &v32[16 * v34];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v45 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v45) {
          goto LABEL_127;
        }
        if (v68 < v56) {
          goto LABEL_21;
        }
LABEL_94:
        unint64_t v73 = v34 - 1;
        if (v34 - 1 >= v16)
        {
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
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v31) {
          goto LABEL_143;
        }
        v74 = &v32[16 * v73];
        uint64_t v75 = *(void *)v74;
        v76 = &v32[16 * v34];
        uint64_t v77 = *((void *)v76 + 1);
        sub_14164((char *)(v31 + 8 * *(void *)v74), (char *)(v31 + 8 * *(void *)v76), v31 + 8 * v77, v98);
        if (v100) {
          goto LABEL_114;
        }
        if (v77 < v75) {
          goto LABEL_117;
        }
        if (v34 > *((void *)v14 + 2)) {
          goto LABEL_118;
        }
        *(void *)v74 = v75;
        *(void *)&v32[16 * v73 + 8] = v77;
        unint64_t v78 = *((void *)v14 + 2);
        if (v34 >= v78) {
          goto LABEL_119;
        }
        unint64_t v16 = v78 - 1;
        memmove(&v32[16 * v34], v76 + 16, 16 * (v78 - 1 - v34));
        *((void *)v14 + 2) = v78 - 1;
        uint64_t v31 = v102;
        if (v78 <= 2) {
          goto LABEL_21;
        }
      }
    }
    unint64_t v16 = 1;
LABEL_21:
    Swift::Int v2 = v93;
    if (v15 >= v93) {
      goto LABEL_103;
    }
  }
  if (__OFADD__(v17, v90)) {
    goto LABEL_138;
  }
  if (v17 + v90 >= v2) {
    Swift::Int v25 = v2;
  }
  else {
    Swift::Int v25 = v17 + v90;
  }
  if (v25 >= v17)
  {
    if (v15 != v25)
    {
      v89 = v14;
      uint64_t v26 = (void *)(v87 + 8 * v15);
      Swift::Int v92 = v25;
      do
      {
        v97 = v26;
        do
        {
          swift_getKeyPath();
          sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
          swift_retain();
          swift_retain();
          sub_245E8();
          swift_release();
          swift_getKeyPath();
          swift_bridgeObjectRetain();
          sub_245E8();
          swift_release();
          sub_A8D4();
          uint64_t v27 = sub_24D88();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          if (v27 != -1) {
            break;
          }
          if (!v102) {
            goto LABEL_142;
          }
          uint64_t v28 = *v26;
          *uint64_t v26 = v26[1];
          v26[1] = v28;
          --v26;
          ++v17;
        }
        while (v15 != v17);
        ++v15;
        Swift::Int v17 = v95;
        uint64_t v26 = v97 + 1;
      }
      while (v15 != v92);
      Swift::Int v15 = v92;
      uint64_t v14 = v89;
    }
    goto LABEL_55;
  }
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
  Swift::Int result = sub_24E78();
  __break(1u);
  return result;
}

uint64_t sub_14164(char *__src, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a2;
  Swift::Int v5 = __src;
  int64_t v6 = a2 - __src;
  int64_t v7 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v7 = a2 - __src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v27 = __src;
  uint64_t v26 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 < -7) {
      goto LABEL_45;
    }
    if (a4 != a2 || &a2[8 * v11] <= a4) {
      memmove(a4, a2, 8 * v11);
    }
    Swift::Int v15 = &a4[8 * v11];
    Swift::Int v25 = v15;
    uint64_t v27 = v4;
    if (v5 >= v4 || v9 < 8) {
      goto LABEL_44;
    }
    unint64_t v16 = (char *)(a3 - 8);
    Swift::Int v17 = v4;
    while (1)
    {
      Swift::Int v22 = v15;
      id v23 = v16 + 8;
      v15 -= 8;
      v17 -= 8;
      swift_getKeyPath();
      sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
      swift_retain();
      swift_retain();
      sub_245E8();
      swift_release();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      sub_245E8();
      swift_release();
      sub_A8D4();
      uint64_t v19 = sub_24D88();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      if (v19 == -1) {
        break;
      }
      Swift::Int v25 = v15;
      Swift::Int v17 = v4;
      if (v23 < v22 || v16 >= v22)
      {
        *(void *)unint64_t v16 = *(void *)v15;
        goto LABEL_31;
      }
      if (v23 != v22) {
        *(void *)unint64_t v16 = *(void *)v15;
      }
      uint64_t v18 = a4;
      if (v4 <= v5) {
        goto LABEL_44;
      }
LABEL_32:
      v16 -= 8;
      uint64_t v4 = v17;
      if (v15 <= v18) {
        goto LABEL_44;
      }
    }
    Swift::Int v15 = v22;
    if (v23 != v4 || v16 >= v4) {
      *(void *)unint64_t v16 = *(void *)v17;
    }
    uint64_t v27 = v17;
LABEL_31:
    uint64_t v18 = a4;
    if (v17 <= v5) {
      goto LABEL_44;
    }
    goto LABEL_32;
  }
  if (v6 >= -7)
  {
    uint64_t v12 = a4;
    if (a4 != __src || &__src[8 * v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    Swift::Int v25 = &a4[8 * v8];
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      do
      {
        swift_getKeyPath();
        sub_14C04(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
        swift_retain();
        swift_retain();
        sub_245E8();
        swift_release();
        swift_getKeyPath();
        swift_bridgeObjectRetain();
        sub_245E8();
        swift_release();
        sub_A8D4();
        uint64_t v13 = sub_24D88();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        if (v13 == -1)
        {
          uint64_t v14 = v4 + 8;
          if (v5 < v4 || v5 >= v14 || v5 != v4) {
            *(void *)Swift::Int v5 = *(void *)v4;
          }
        }
        else
        {
          if (v5 != v12) {
            *(void *)Swift::Int v5 = *(void *)v12;
          }
          v12 += 8;
          uint64_t v26 = v12;
          uint64_t v14 = v4;
        }
        v5 += 8;
        uint64_t v27 = v5;
        if (v12 >= &a4[8 * v8]) {
          break;
        }
        uint64_t v4 = v14;
      }
      while ((unint64_t)v14 < a3);
    }
LABEL_44:
    sub_1475C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
LABEL_45:
  uint64_t result = sub_24ED8();
  __break(1u);
  return result;
}

char *sub_14660(char *result, int64_t a2, char a3, char *a4)
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
    sub_82C8(&qword_31BD8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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

char *sub_1475C(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24ED8();
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

char *sub_14818(uint64_t a1)
{
  return sub_14660(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1482C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24818();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1485C()
{
  return sub_24828();
}

uint64_t sub_14884()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_14894(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

void sub_148AC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 128) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_148BC()
{
  return sub_155B8();
}

uint64_t sub_148D8@<X0>(void *a1@<X8>)
{
  return sub_11108(*(void *)(v1 + 32), a1);
}

uint64_t sub_148E8(uint64_t *a1)
{
  return sub_111B4(a1);
}

uint64_t sub_148F4()
{
  return sub_11284();
}

unint64_t sub_148FC()
{
  unint64_t result = qword_31AA8;
  if (!qword_31AA8)
  {
    sub_8360(&qword_31A98);
    sub_B88C(&qword_31AB0, &qword_31AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31AA8);
  }
  return result;
}

uint64_t sub_1499C()
{
  return sub_11440();
}

uint64_t sub_149A4()
{
  return sub_1153C();
}

uint64_t sub_149AC@<X0>(uint64_t a1@<X8>)
{
  return sub_11610(v1, a1);
}

uint64_t sub_149B4@<X0>(uint64_t a1@<X8>)
{
  return sub_116CC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_149BC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8360(a2);
    sub_B88C(&qword_31AF8, &qword_31B00);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_14A5C()
{
  unint64_t result = qword_31B08;
  if (!qword_31B08)
  {
    sub_8360(&qword_31B10);
    sub_14AFC();
    sub_B88C(&qword_31AF8, &qword_31B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31B08);
  }
  return result;
}

unint64_t sub_14AFC()
{
  unint64_t result = qword_31B18;
  if (!qword_31B18)
  {
    sub_8360(&qword_31B20);
    sub_149BC(&qword_31B28, &qword_31B30, (void (*)(void))sub_14BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31B18);
  }
  return result;
}

unint64_t sub_14BA8()
{
  unint64_t result = qword_31B38;
  if (!qword_31B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31B38);
  }
  return result;
}

uint64_t sub_14C04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_14C54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82C8(&qword_31B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_14CBC()
{
  return sub_226A0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_14CE4()
{
  return sub_21A04(v0[2], v0[3], v0[4]);
}

uint64_t sub_14D04()
{
  return sub_155F8();
}

uint64_t sub_14D24(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24E98();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_14DA0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_14E80;
  return v5(v2 + 32);
}

uint64_t sub_14E80()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_14F94()
{
  return sub_D588(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_14FB0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_14FE8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_15030(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_150F8;
  return sub_FCD0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_150F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_151EC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_15224(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_156BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_31B78 + dword_31B78);
  return v6(a1, v4);
}

uint64_t sub_152E8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_15328(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_156BC;
  return sub_10500(a1, v4, v5, v6);
}

uint64_t sub_153DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1543C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_150F8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_31BA8 + dword_31BA8);
  return v6(a1, v4);
}

void sub_154F4()
{
  sub_21E88(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_15518()
{
  return sub_15530();
}

uint64_t sub_15530()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 56) = v0[3];
  *(void *)(v1 + 64) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_15578()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 32) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_15588()
{
  return sub_EC90();
}

uint64_t sub_15598()
{
  return sub_15644();
}

uint64_t sub_155B0()
{
  return sub_F418();
}

uint64_t sub_155B8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 96) = v0[3];
  *(void *)(v1 + 104) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_155F8()
{
  *(void *)(*(void *)(v0 + 16) + 120) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

_OWORD *sub_15634(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_15644()
{
  *(void *)(*(void *)(v0 + 16) + 136) = *(void *)(v0 + 24);
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_15680()
{
  return sub_B88C(&qword_31BE0, &qword_31BE8);
}

void sub_156C4()
{
}

void sub_156DC()
{
}

uint64_t sub_156F4()
{
  return sub_14F94();
}

void sub_1570C()
{
}

uint64_t sub_15724()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_157C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v3 = sub_82C8(&qword_31DC8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  BOOL v55 = (char *)v52 - v7;
  uint64_t v8 = sub_24568();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31578 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24788();
  uint64_t v13 = sub_A7D0(v12, (uint64_t)qword_33250);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v52[3] = v13;
  uint64_t v14 = sub_24768();
  os_log_type_t v15 = sub_24CF8();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v52[2] = a1;
    *(void *)&long long v62 = v17;
    *(_DWORD *)unint64_t v16 = 136380675;
    v52[1] = v16 + 4;
    sub_181C0(&qword_316D8, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v18 = sub_24F18();
    v60[0] = sub_13014(v18, v19, (uint64_t *)&v62);
    sub_24D58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_0, v14, v15, "Handling deep link url: %{private}s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  uint64_t v20 = (uint64_t)v55;
  sub_244F8();
  sub_B194(v20, (uint64_t)v6, &qword_31DC8);
  uint64_t v21 = sub_24518();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v6, 1, v21) == 1)
  {
    sub_B1F8((uint64_t)v6, &qword_31DC8);
    uint64_t v23 = v20;
LABEL_19:
    uint64_t result = sub_B1F8(v23, &qword_31DC8);
    uint64_t v33 = v54;
    *(_OWORD *)uint64_t v54 = 0u;
    *(_OWORD *)(v33 + 16) = 0u;
    *(void *)(v33 + 32) = 0;
    return result;
  }
  uint64_t v24 = sub_24508();
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v21);
  *(void *)&long long v62 = v24;
  *((void *)&v62 + 1) = v26;
  v60[0] = 47;
  v60[1] = 0xE100000000000000;
  sub_A8D4();
  uint64_t v27 = sub_24D78();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v29 = *(void *)(v27 + 16);
  unint64_t v30 = v29 != 0;
  if (v29 == v30)
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v29 <= v30)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    return result;
  }
  if (v29) {
    unint64_t v31 = 2;
  }
  else {
    unint64_t v31 = 1;
  }
  if (v29 < v31) {
    goto LABEL_42;
  }
  uint64_t v32 = (uint64_t *)(v27 + 32 + 16 * v30);
  uint64_t result = *v32;
  if ((*v32 != 0xD000000000000023 || v32[1] != 0x8000000000027640) && (uint64_t result = sub_24F28(), (result & 1) == 0)
    || v31 == v29)
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = v20;
    goto LABEL_19;
  }
  if (v31 >= v29) {
    goto LABEL_43;
  }
  unint64_t v34 = (uint64_t *)(v27 + 32 + 16 * v31);
  uint64_t v35 = *v34;
  uint64_t v36 = v34[1];
  swift_getKeyPath();
  uint64_t v37 = v53;
  v60[0] = v53;
  sub_181C0(&qword_31700, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  swift_bridgeObjectRetain();
  sub_245E8();
  swift_release();
  swift_beginAccess();
  uint64_t v38 = *(void *)(v37 + 96);
  if (*(void *)(v38 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_205C4(v35, v36);
    if (v40)
    {
      sub_A820(*(void *)(v38 + 56) + 40 * v39, (uint64_t)&v62);
    }
    else
    {
      uint64_t v64 = 0;
      long long v63 = 0u;
      long long v62 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v64 = 0;
    long long v63 = 0u;
    long long v62 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_B194((uint64_t)&v62, (uint64_t)&v58, &qword_316B8);
  if (v59)
  {
    sub_A808(&v58, (uint64_t)v60);
    sub_A820((uint64_t)v60, (uint64_t)&v58);
    uint64_t v41 = sub_24768();
    os_log_type_t v42 = sub_24D18();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136446210;
      sub_A970(&v58, v59);
      swift_getDynamicType();
      uint64_t v44 = sub_24F68();
      uint64_t v56 = sub_13014(v44, v45, &v57);
      sub_24D58();
      swift_bridgeObjectRelease();
      sub_A884((uint64_t)&v58);
      _os_log_impl(&dword_0, v41, v42, "Found non-nil provider: %{public}s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_A884((uint64_t)&v58);
    }

    sub_A970(v60, v61);
    if ((sub_246E8() & 1) == 0)
    {
      uint64_t v47 = sub_24768();
      os_log_type_t v48 = sub_24D18();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v49 = 0;
        _os_log_impl(&dword_0, v47, v48, "Provider is not available for the current config. Ignoring..", v49, 2u);
        swift_slowDealloc();
      }
    }
    sub_A970(v60, v61);
    char v50 = sub_246E8();
    sub_B1F8((uint64_t)&v62, &qword_316B8);
    swift_bridgeObjectRelease();
    sub_B1F8(v20, &qword_31DC8);
    if (v50)
    {
      sub_A820((uint64_t)v60, v54);
    }
    else
    {
      uint64_t v51 = (_OWORD *)v54;
      *(void *)(v54 + 32) = 0;
      *uint64_t v51 = 0u;
      v51[1] = 0u;
    }
    return sub_A884((uint64_t)v60);
  }
  else
  {
    sub_B1F8((uint64_t)&v62, &qword_316B8);
    swift_bridgeObjectRelease();
    sub_B1F8(v20, &qword_31DC8);
    uint64_t result = sub_B1F8((uint64_t)&v58, &qword_316B8);
    unint64_t v46 = (_OWORD *)v54;
    *(void *)(v54 + 32) = 0;
    _OWORD *v46 = 0u;
    v46[1] = 0u;
  }
  return result;
}

uint64_t sub_160B4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_160F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_161A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_181C0(&qword_31700, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_245E8();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 96);
  return swift_bridgeObjectRetain();
}

uint64_t sub_16268()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_16348(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_163B0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_16454@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_181C0(&qword_31700, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 104);
  return swift_bridgeObjectRetain();
}

uint64_t sub_16500()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_165E0()
{
  uint64_t v1 = v0;
  v0[2] = _swiftEmptyArrayStorage;
  uint64_t v57 = sub_24668();
  swift_allocObject();
  v0[3] = sub_24658();
  uint64_t v2 = type metadata accessor for DefaultLSAppsSettingsProvider();
  swift_allocObject();
  v0[4] = sub_DC5C(2);
  swift_allocObject();
  v0[5] = sub_DC5C(3);
  swift_allocObject();
  v0[6] = sub_DC5C(4);
  uint64_t v58 = sub_24748();
  swift_allocObject();
  v0[7] = sub_24738();
  swift_allocObject();
  v0[8] = sub_DC5C(1);
  uint64_t v60 = type metadata accessor for DefaultContactlessPaymentSettingsProvider();
  swift_allocObject();
  v0[9] = DefaultContactlessPaymentSettingsProvider.init(for:)(0, 0);
  uint64_t v59 = sub_24688();
  swift_allocObject();
  v0[10] = sub_24678();
  uint64_t v61 = sub_24648();
  swift_allocObject();
  v0[11] = sub_24638();
  v0[12] = sub_184A4((uint64_t)_swiftEmptyArrayStorage);
  v0[13] = sub_184A4((uint64_t)_swiftEmptyArrayStorage);
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  type metadata accessor for DefaultAppsSettingsGroup();
  uint64_t v3 = swift_allocObject();
  sub_24598();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible) = 0;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  *(void *)(v3 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers) = _swiftEmptyArrayStorage;
  sub_23840();
  uint64_t v4 = swift_retain();
  sub_17F6C(v4, v3, (uint64_t (*)(void))&type metadata accessor for DefaultMarketplaceViewProvider, &qword_31DE8, (void (*)(uint64_t))&type metadata accessor for DefaultMarketplaceViewProvider);
  swift_release();
  sub_82C8(&qword_31DD0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25F20;
  uint64_t v6 = v1[4];
  *(void *)(v5 + 56) = v2;
  uint64_t v62 = v2;
  uint64_t v63 = sub_181C0(&qword_31DD8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  *(void *)(v5 + 32) = v6;
  uint64_t v7 = v2;
  *(void *)(v5 + 96) = v2;
  *(void *)(v5 + 104) = v63;
  uint64_t v9 = v1[5];
  uint64_t v8 = v1[6];
  *(void *)(v5 + 64) = v63;
  *(void *)(v5 + 72) = v9;
  *(void *)(v5 + 136) = v7;
  *(void *)(v5 + 144) = v63;
  *(void *)(v5 + 112) = v8;
  uint64_t v10 = swift_allocObject();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24598();
  *(unsigned char *)(v10 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible) = 0;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  *(void *)(v10 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers) = v5;
  sub_23840();
  uint64_t v11 = swift_retain();
  sub_17F6C(v11, v10, (uint64_t (*)(void))&type metadata accessor for DefaultSpamFilterSettingsProvider, &qword_31DF0, (void (*)(uint64_t))&type metadata accessor for DefaultSpamFilterSettingsProvider);
  swift_release();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_257B0;
  uint64_t v13 = v1[8];
  *(void *)(v12 + 56) = v62;
  *(void *)(v12 + 64) = v63;
  *(void *)(v12 + 32) = v13;
  uint64_t v14 = swift_allocObject();
  swift_retain();
  sub_24598();
  *(unsigned char *)(v14 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible) = 0;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  *(void *)(v14 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers) = v12;
  sub_23840();
  uint64_t v15 = swift_retain();
  sub_17F6C(v15, v14, (uint64_t (*)(void))&type metadata accessor for PMPasswordOptionsDefaultAppsProvider, &qword_31DF8, (void (*)(uint64_t))&type metadata accessor for PMPasswordOptionsDefaultAppsProvider);
  swift_release();
  uint64_t v16 = swift_retain();
  sub_17F6C(v16, v14, (uint64_t (*)(void))type metadata accessor for DefaultContactlessPaymentSettingsProvider, &qword_31E00, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  swift_release();
  uint64_t v17 = swift_retain();
  sub_17F6C(v17, v14, (uint64_t (*)(void))&type metadata accessor for DefaultKeyboardSettingsProvider, &qword_31E08, (void (*)(uint64_t))&type metadata accessor for DefaultKeyboardSettingsProvider);
  swift_release();
  sub_82C8(&qword_31DE0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_25F30;
  *(void *)(v18 + 32) = v3;
  *(void *)(v18 + 40) = v10;
  *(void *)(v18 + 48) = v14;
  sub_24C58();
  swift_getKeyPath();
  uint64_t v66 = v1;
  sub_181C0(&qword_31700, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_245D8();
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v19 = (void *)v1[3];
  uint64_t v67 = v57;
  uint64_t v68 = sub_181C0(&qword_31DE8, (void (*)(uint64_t))&type metadata accessor for DefaultMarketplaceViewProvider);
  uint64_t v66 = v19;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x6174736E49707041, 0xEF6E6F6974616C6CLL);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v20 = (void *)v1[4];
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v66 = v20;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x6C69616D45, 0xE500000000000000);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v21 = (void *)v1[5];
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v66 = v21;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x6E6967617373654DLL, 0xE900000000000067);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v22 = (void *)v1[6];
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v66 = v22;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x676E696C6C6143, 0xE700000000000000);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v23 = (void *)v1[7];
  uint64_t v67 = v58;
  uint64_t v68 = sub_181C0(&qword_31DF0, (void (*)(uint64_t))&type metadata accessor for DefaultSpamFilterSettingsProvider);
  uint64_t v66 = v23;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x746C69466C6C6143, 0xED0000676E697265);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v24 = (void *)v1[8];
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v66 = v24;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x41726573776F7242, 0xEA00000000007070);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v25 = (void *)v1[10];
  uint64_t v67 = v59;
  uint64_t v68 = sub_181C0(&qword_31DF8, (void (*)(uint64_t))&type metadata accessor for PMPasswordOptionsDefaultAppsProvider);
  uint64_t v66 = v25;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0xD000000000000011, 0x8000000000027670);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v26 = (void *)v1[9];
  uint64_t v67 = v60;
  uint64_t v68 = sub_181C0(&qword_31E00, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  uint64_t v66 = v26;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x6C746361746E6F43, 0xEE00707041737365);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  uint64_t v27 = (void *)v1[11];
  uint64_t v67 = v61;
  uint64_t v68 = sub_181C0(&qword_31E08, (void (*)(uint64_t))&type metadata accessor for DefaultKeyboardSettingsProvider);
  uint64_t v66 = v27;
  swift_getKeyPath();
  swift_retain();
  sub_245E8();
  swift_release();
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  sub_179A8((uint64_t)&v66, 0x6472616F6279654BLL, 0xE900000000000073);
  swift_endAccess();
  *(void *)&v65[0] = v1;
  swift_getKeyPath();
  sub_245F8();
  swift_release();
  swift_getKeyPath();
  uint64_t v66 = v1;
  sub_245E8();
  swift_release();
  uint64_t v64 = v1;
  unint64_t v28 = v1[2];
  uint64_t v66 = _swiftEmptyArrayStorage;
  if (v28 >> 62) {
    goto LABEL_29;
  }
  uint64_t v29 = *(void *)((char *)&dword_10 + (v28 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain_n();
  if (!v29)
  {
LABEL_30:
    swift_bridgeObjectRelease_n();
    uint64_t v36 = _swiftEmptyArrayStorage;
    uint64_t v37 = _swiftEmptyArrayStorage[2];
    if (!v37) {
      goto LABEL_31;
    }
LABEL_11:
    uint64_t v38 = (uint64_t)(v36 + 4);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_A820(v38, (uint64_t)&v66);
      sub_A970(&v66, v67);
      uint64_t v40 = sub_246C8();
      uint64_t v42 = v41;
      sub_A820((uint64_t)&v66, (uint64_t)v65);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v28 = sub_205C4(v40, v42);
      uint64_t v45 = _swiftEmptyDictionarySingleton[2];
      BOOL v46 = (v44 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_27;
      }
      char v48 = v44;
      if (_swiftEmptyDictionarySingleton[3] >= v47)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if ((v44 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else
        {
          sub_19CC4();
          if ((v48 & 1) == 0) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        sub_190B8(v47, isUniquelyReferenced_nonNull_native);
        unint64_t v49 = sub_205C4(v40, v42);
        if ((v48 & 1) != (v50 & 1))
        {
          uint64_t result = sub_24F38();
          __break(1u);
          return result;
        }
        unint64_t v28 = v49;
        if ((v48 & 1) == 0)
        {
LABEL_21:
          _swiftEmptyDictionarySingleton[(v28 >> 6) + 8] |= 1 << v28;
          uint64_t v51 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v28);
          *uint64_t v51 = v40;
          v51[1] = v42;
          sub_A808(v65, _swiftEmptyDictionarySingleton[7] + 40 * v28);
          uint64_t v52 = _swiftEmptyDictionarySingleton[2];
          BOOL v53 = __OFADD__(v52, 1);
          uint64_t v54 = v52 + 1;
          if (v53) {
            goto LABEL_28;
          }
          _swiftEmptyDictionarySingleton[2] = v54;
          swift_bridgeObjectRetain();
          goto LABEL_13;
        }
      }
      uint64_t v39 = _swiftEmptyDictionarySingleton[7] + 40 * v28;
      sub_A884(v39);
      sub_A808(v65, v39);
LABEL_13:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_A884((uint64_t)&v66);
      v38 += 40;
      if (!--v37)
      {
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
    }
  }
LABEL_3:
  uint64_t v30 = 4;
  do
  {
    uint64_t v31 = v30 - 4;
    if ((v28 & 0xC000000000000001) != 0)
    {
      uint64_t v32 = sub_24DF8();
      uint64_t v33 = v30 - 3;
      if (__OFADD__(v31, 1)) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v32 = *(void *)(v28 + 8 * v30);
      swift_retain();
      uint64_t v33 = v30 - 3;
      if (__OFADD__(v31, 1))
      {
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        swift_bridgeObjectRetain_n();
        uint64_t v29 = sub_24E98();
        if (!v29) {
          goto LABEL_30;
        }
        goto LABEL_3;
      }
    }
    swift_getKeyPath();
    *(void *)&v65[0] = v32;
    sub_181C0(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
    sub_245E8();
    swift_release();
    unint64_t v34 = (uint64_t *)(v32 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers);
    swift_beginAccess();
    uint64_t v35 = *v34;
    swift_bridgeObjectRetain();
    swift_release();
    sub_17E00(v35);
    ++v30;
  }
  while (v33 != v29);
  swift_bridgeObjectRelease_n();
  uint64_t v36 = v66;
  uint64_t v37 = v66[2];
  if (v37) {
    goto LABEL_11;
  }
LABEL_31:
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  uint64_t v66 = v64;
  sub_245D8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (uint64_t)v64;
}

uint64_t sub_179A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_A808((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_198C0(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_B1F8(a1, &qword_316B8);
    sub_18C98(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_B1F8((uint64_t)v9, &qword_316B8);
  }
}

uint64_t sub_17A80()
{
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsModel___observationRegistrar;
  uint64_t v2 = sub_24628();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_17B44()
{
  sub_17A80();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_17B9C()
{
  return type metadata accessor for DefaultAppsSettingsModel();
}

uint64_t type metadata accessor for DefaultAppsSettingsModel()
{
  uint64_t result = qword_31CE0;
  if (!qword_31CE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_17BF0()
{
  uint64_t result = sub_24628();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_17CB8(void *result, int64_t a2, char a3, void *a4)
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
      sub_82C8(&qword_31DD0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_18264(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_17DDC()
{
  return sub_16348(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_17E00(uint64_t a1)
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
  uint64_t v3 = sub_17CB8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  unint64_t v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2) {
    goto LABEL_24;
  }
  sub_82C8(&qword_316D0);
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
  uint64_t result = sub_24ED8();
  __break(1u);
  return result;
}

uint64_t sub_17F6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  swift_getKeyPath();
  sub_181C0(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  swift_retain();
  sub_245E8();
  swift_release();
  *(void *)&long long v16 = a2;
  swift_getKeyPath();
  sub_24608();
  swift_release();
  unint64_t v9 = (void **)(a2 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  uint64_t v10 = *v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v9 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = sub_17CB8(0, v10[2] + 1, 1, v10);
    *unint64_t v9 = v10;
  }
  unint64_t v13 = v10[2];
  unint64_t v12 = v10[3];
  if (v13 >= v12 >> 1)
  {
    uint64_t v10 = sub_17CB8((void *)(v12 > 1), v13 + 1, 1, v10);
    *unint64_t v9 = v10;
  }
  uint64_t v17 = a3(0);
  uint64_t v18 = sub_181C0(a4, a5);
  *(void *)&long long v16 = a1;
  v10[2] = v13 + 1;
  sub_A808(&v16, (uint64_t)&v10[5 * v13 + 4]);
  swift_endAccess();
  *(void *)&long long v16 = a2;
  swift_getKeyPath();
  swift_retain();
  sub_245F8();
  swift_release();
  sub_23840();
  return swift_release();
}

uint64_t sub_1817C()
{
  *(void *)(*(void *)(v0 + 16) + 16) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_181C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_18210()
{
  return sub_18228();
}

uint64_t sub_18228()
{
  *(void *)(*(void *)(v0 + 16) + 104) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18264(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_82C8(&qword_316D0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24ED8();
  __break(1u);
  return result;
}

unint64_t sub_18374(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_82C8(&qword_31F58);
  uint64_t v2 = (void *)sub_24EC8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_B194(v4, (uint64_t)v13, &qword_31F60);
    unint64_t result = sub_20518((uint64_t)v13);
    if (v6) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v7 = v2[6] + 40 * result;
    long long v8 = v13[0];
    long long v9 = v13[1];
    *(void *)(v7 + 32) = v14;
    *(_OWORD *)uint64_t v7 = v8;
    *(_OWORD *)(v7 + 16) = v9;
    *(_OWORD *)(v2[7] + 16 * result) = v15;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 56;
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

unint64_t sub_184A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_82C8(&qword_31F88);
  uint64_t v2 = sub_24EC8();
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
    sub_B194(v6, (uint64_t)&v15, (uint64_t *)&unk_31F90);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_205C4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_A808(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
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

unint64_t sub_185E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_82C8(&qword_31F78);
  uint64_t v2 = sub_24EC8();
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
    sub_B194(v6, (uint64_t)&v13, &qword_31F80);
    uint64_t v7 = v13;
    unint64_t result = sub_2063C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_15634(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_18718()
{
  sub_82C8(&qword_31F68);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_31E10 = result;
  return result;
}

int *sub_18750()
{
  uint64_t result = (int *)sub_18374((uint64_t)_swiftEmptyArrayStorage);
  off_31E18 = result;
  return result;
}

uint64_t sub_18778(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v6) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          return swift_release();
        }
        unint64_t v13 = *(void *)(v2 + 8 * v8);
        if (!v13)
        {
          int64_t v8 = v12 + 3;
          if (v12 + 3 >= v6) {
            return swift_release();
          }
          unint64_t v13 = *(void *)(v2 + 8 * v8);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_5:
    sub_1A138(*(void *)(a1 + 48) + 40 * v10, (uint64_t)v16);
    long long v17 = *(_OWORD *)(*(void *)(a1 + 56) + 16 * v10);
    uint64_t v15 = (void (*)(uint64_t))v17;
    uint64_t v11 = swift_retain_n();
    v15(v11);
    swift_release();
    uint64_t result = sub_1A3FC((uint64_t)v16);
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v6) {
    return swift_release();
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v2 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_18920(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer_notify];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  id v4 = objc_allocWithZone((Class)LSObserver);
  unint64_t v5 = v2;
  swift_retain();
  id v6 = [v4 init];
  id v7 = [self mainQueue];
  [v6 setQueue:v7];

  *(void *)&v5[OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer_lsObserver] = v6;
  id v8 = v6;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for LSChangeObserver.Observer();
  id v9 = objc_msgSendSuper2(&v11, "init");
  [v8 setDelegate:v9];

  swift_release();
  return v9;
}

id sub_18ADC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LSChangeObserver.Observer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_18B64()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for LSChangeObserver()
{
  return self;
}

uint64_t type metadata accessor for LSChangeObserver.Observer()
{
  return self;
}

uint64_t sub_18BBC(uint64_t a1)
{
  objc_super v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_20518(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *objc_super v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_19AE4();
    uint64_t v7 = v10;
  }
  sub_1A0D4(*(void *)(v7 + 48) + 40 * v4);
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_193E0(v4, v7);
  *objc_super v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

double sub_18C98@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_205C4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_19CC4();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_A808((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_195AC(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_18DA4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_82C8(&qword_31F58);
  uint64_t v6 = sub_24EB8();
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
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
    }
    else
    {
      sub_1A138(v25, (uint64_t)&v38);
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
      swift_retain();
    }
    uint64_t result = sub_24DB8(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v15) = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_190B8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_82C8(&qword_31F88);
  char v37 = a2;
  uint64_t v6 = sub_24EB8();
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
    unint64_t v19 = (void *)(v5 + 64);
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
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_A808(v25, (uint64_t)v38);
    }
    else
    {
      sub_A820((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_24F48();
    sub_24C18();
    uint64_t result = sub_24F58();
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
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_A808(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_193E0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24DA8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A138(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v27);
        Swift::Int v9 = sub_24DB8(*(void *)(a2 + 40));
        uint64_t result = sub_1A0D4((uint64_t)v27);
        Swift::Int v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 >= v8 && v3 >= v10)
          {
LABEL_16:
            uint64_t v13 = *(void *)(a2 + 48);
            unint64_t v14 = v13 + 40 * v3;
            unint64_t v15 = (long long *)(v13 + 40 * v6);
            if (v3 != v6 || v14 >= (unint64_t)v15 + 40)
            {
              long long v16 = *v15;
              long long v17 = v15[1];
              *(void *)(v14 + 32) = *((void *)v15 + 4);
              *(_OWORD *)unint64_t v14 = v16;
              *(_OWORD *)(v14 + 16) = v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            unint64_t v19 = (_OWORD *)(v18 + 16 * v3);
            unint64_t v20 = (_OWORD *)(v18 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *unint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v10 >= v8 || v3 >= v10)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *int64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_195AC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24DA8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24F48();
        swift_bridgeObjectRetain();
        sub_24C18();
        Swift::Int v11 = sub_24F58();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *unint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
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

unint64_t sub_19798(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_20518(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      unint64_t v19 = (uint64_t *)(v18[7] + 16 * v12);
      unint64_t result = swift_release();
      *unint64_t v19 = a1;
      v19[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_19AE4();
    goto LABEL_7;
  }
  sub_18DA4(v15, a4 & 1);
  unint64_t v21 = sub_20518(a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    unint64_t result = sub_24F38();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_1A138(a3, (uint64_t)v23);
  return sub_19A18(v12, (uint64_t)v23, a1, a2, v18);
}

uint64_t sub_198C0(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_205C4(a2, a3);
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
      sub_19CC4();
      goto LABEL_7;
    }
    sub_190B8(v15, a4 & 1);
    unint64_t v21 = sub_205C4(a2, a3);
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
    uint64_t result = sub_24F38();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    sub_A884(v19);
    return sub_A808(a1, v19);
  }
LABEL_13:
  sub_19A74(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

unint64_t sub_19A18(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 40 * result;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = (void *)(a5[7] + 16 * result);
  *uint64_t v7 = a3;
  v7[1] = a4;
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

uint64_t sub_19A74(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  long long v6 = (void *)(a5[6] + 16 * a1);
  *long long v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_A808(a4, a5[7] + 40 * a1);
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

void *sub_19AE4()
{
  uint64_t v1 = v0;
  sub_82C8(&qword_31F58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EA8();
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
    sub_1A138(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    long long v16 = *(_OWORD *)(*(void *)(v2 + 56) + 16 * v15);
    uint64_t v17 = *(void *)(v4 + 48) + 40 * v15;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    *(_OWORD *)(*(void *)(v4 + 56) + 16 * v15) = v16;
    uint64_t result = (void *)swift_retain();
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

void *sub_19CC4()
{
  uint64_t v1 = v0;
  sub_82C8(&qword_31F88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EA8();
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
    sub_A820(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_A808(v26, *(void *)(v4 + 56) + v20);
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

void sub_19EB0()
{
  if (qword_31560 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_31E10 + 16));
  if (qword_31568 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_18778(v0);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_31E10 + 16));
}

void sub_19F90(uint64_t a1)
{
  if (qword_31560 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_31E10 + 16));
  if (qword_31568 != -1) {
    swift_once();
  }
  uint64_t v3 = a1;
  sub_24DD8();
  swift_beginAccess();
  uint64_t v2 = sub_18BBC((uint64_t)v4);
  sub_1A0D4((uint64_t)v4);
  swift_endAccess();
  sub_1A128(v2);
  if (!*(void *)((char *)&dword_10 + (void)off_31E18) && qword_31E20) {
    objc_msgSend(*(id *)(qword_31E20+ OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer_lsObserver), "stopObserving", v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_31E10 + 16));
}

uint64_t sub_1A0D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A128(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1A138(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1A194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_31560 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_31E10 + 16));
  if (!qword_31E20)
  {
    id v5 = objc_allocWithZone((Class)type metadata accessor for LSChangeObserver.Observer());
    id v6 = sub_18920((uint64_t)sub_19EB0, 0);
    unint64_t v7 = (void *)qword_31E20;
    qword_31E20 = (uint64_t)v6;
  }
  if (qword_31568 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!*(void *)((char *)&dword_10 + (void)off_31E18) && qword_31E20) {
    [*(id *)(qword_31E20+ OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer_lsObserver) startObserving];
  }
  sub_24DD8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = off_31E18;
  off_31E18 = (int *)0x8000000000000000;
  sub_19798((uint64_t)sub_1A3D4, v8, (uint64_t)v11, isUniquelyReferenced_nonNull_native);
  off_31E18 = v10;
  swift_bridgeObjectRelease();
  sub_1A0D4((uint64_t)v11);
  swift_endAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_31E10 + 16));
}

uint64_t sub_1A39C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1A3D4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A3FC(uint64_t a1)
{
  uint64_t v2 = sub_82C8(&qword_31F70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A45C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t DefaultContactlessPaymentSettingsProvider.__allocating_init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  DefaultContactlessPaymentSettingsProvider.init(for:)(a1, a2);
  return v4;
}

uint64_t DefaultContactlessPaymentSettingsProvider.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DefaultContactlessPaymentSettingsProvider.available.getter()
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_1A5C0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 32);
  return result;
}

uint64_t sub_1A668()
{
  return swift_release();
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedDetail.getter()
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A82C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 64);
  *a2 = *(void *)(v3 + 56);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A8EC()
{
  return swift_release();
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedDetail.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*DefaultContactlessPaymentSettingsProvider.localizedDetail.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin41DefaultContactlessPaymentSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_24608();
  swift_release();
  swift_beginAccess();
  return sub_1AC40;
}

void sub_1AC40(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_245F8();
  swift_release();

  free(v1);
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedNavigationTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1ACEC()
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1AD9C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 96);
  *a2 = *(void *)(v3 + 88);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AE48()
{
  return swift_release();
}

uint64_t sub_1AF2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_245C8();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_24BA8();
  __chkstk_darwin(v3 - 8);
  swift_getKeyPath();
  uint64_t v16 = v0;
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 112);
  swift_getKeyPath();
  uint64_t v16 = v4;
  sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  swift_retain();
  sub_245E8();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 32);
  unint64_t v6 = *(void *)(v4 + 40);
  swift_release();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    swift_getKeyPath();
    uint64_t v16 = v1;
    sub_245E8();
    swift_release();
    uint64_t v8 = *(void *)(v1 + 112);
    swift_getKeyPath();
    uint64_t v16 = v8;
    swift_retain();
    sub_245E8();
    swift_release();
    uint64_t v9 = *(void *)(v8 + 32);
    uint64_t v10 = *(void *)(v8 + 40);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
    sub_24B48();
    if (qword_31570 != -1) {
      swift_once();
    }
    id v11 = (id)qword_33240;
    sub_245B8();
    uint64_t v9 = sub_24BF8();
    uint64_t v10 = v12;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(void *)&v15[-32] = v1;
  *(void *)&v15[-24] = v9;
  *(void *)&v15[-16] = v10;
  uint64_t v16 = v1;
  sub_245D8();
  swift_bridgeObjectRelease();
  swift_release();
  return sub_1B354();
}

uint64_t sub_1B2B0()
{
  return swift_retain();
}

uint64_t sub_1B354()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_245C8();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_24BA8();
  __chkstk_darwin(v3 - 8);
  swift_getKeyPath();
  uint64_t v15 = v0;
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  unint64_t v4 = *(void *)(v0 + 120);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24E98();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
  }
  if (!v5)
  {
    swift_getKeyPath();
    uint64_t v15 = v1;
    sub_245E8();
    swift_release();
    uint64_t v6 = *(void *)(v1 + 112);
    swift_getKeyPath();
    uint64_t v15 = v6;
    sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
    swift_retain();
    sub_245E8();
    swift_release();
    uint64_t v7 = *(void *)(v6 + 64);
    swift_release();
    if (!v7)
    {
      sub_24B48();
      if (qword_31570 == -1) {
        goto LABEL_6;
      }
      goto LABEL_10;
    }
  }
  sub_24B48();
  if (qword_31570 != -1) {
LABEL_10:
  }
    swift_once();
LABEL_6:
  id v8 = (id)qword_33240;
  sub_245B8();
  uint64_t v9 = sub_24BF8();
  uint64_t v11 = v10;
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(void *)&v14[-32] = v1;
  *(void *)&v14[-24] = v9;
  *(void *)&v14[-16] = v11;
  uint64_t v15 = v1;
  sub_245D8();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1B744@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 112);
  return swift_retain();
}

uint64_t sub_1B7F0()
{
  return swift_release();
}

uint64_t sub_1B8D0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 112) = a2;
  swift_retain_n();
  swift_release();
  sub_1AF2C();
  return swift_release();
}

uint64_t sub_1B92C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B9D0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  *a2 = *(void *)(v3 + 120);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA7C()
{
  return swift_release();
}

uint64_t sub_1BB5C()
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BC0C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 136);
  *a2 = *(void *)(v3 + 128);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCB8()
{
  return swift_bridgeObjectRelease();
}

uint64_t DefaultContactlessPaymentSettingsProvider.init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_245C8();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_24BA8();
  __chkstk_darwin(v6 - 8);
  *(void *)(v2 + 16) = 0xD00000000000002CLL;
  *(void *)(v2 + 24) = 0x80000000000268D0;
  *(unsigned char *)(v2 + 32) = 0;
  sub_24B48();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v7 = (id)qword_33240;
  sub_245B8();
  *(void *)(v2 + 40) = sub_24BF8();
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  sub_24B48();
  id v9 = v7;
  sub_245B8();
  *(void *)(v2 + 72) = sub_24BF8();
  *(void *)(v2 + 80) = v10;
  type metadata accessor for AppRecord();
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 88) = 0;
  swift_allocObject();
  *(void *)(v2 + 112) = sub_21ED8(0);
  *(void *)(v2 + 120) = _swiftEmptyArrayStorage;
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 136) = 0;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  if (a2)
  {
    NSString v12 = sub_24BB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  aBlock[4] = sub_1F1BC;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A45C;
  aBlock[3] = &unk_2D4D0;
  int64_t v13 = _Block_copy(aBlock);
  id v14 = [self contextWithBundleId:v12 onChange:v13];

  _Block_release(v13);
  swift_release();
  swift_release();
  uint64_t v15 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v14;

  uint64_t v16 = *(void **)(v3 + 104);
  if (v16) {
    unsigned __int8 v17 = [v16 shouldShowDefaultNFCAppPicker];
  }
  else {
    unsigned __int8 v17 = 0;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(&v26 - 2) = v3;
  *((unsigned char *)&v26 - 8) = v17;
  aBlock[0] = v3;
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245D8();
  swift_release();
  sub_1C854();
  uint64_t v19 = *(void **)(v3 + 104);
  if (v19) {
    id v20 = [v19 getDefaultNFCApplication];
  }
  else {
    id v20 = 0;
  }
  swift_allocObject();
  id v21 = v20;
  uint64_t v22 = sub_22508(v20);
  uint64_t v23 = swift_getKeyPath();
  __chkstk_darwin(v23);
  *(&v26 - 2) = v3;
  *(&v26 - 1) = v22;
  aBlock[0] = v3;
  sub_245D8();
  swift_release();
  swift_release();

  sub_1B354();
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_1A194(v3, (uint64_t)sub_1F200, v24);
  swift_release_n();
  swift_release();
  return v3;
}

uint64_t type metadata accessor for DefaultContactlessPaymentSettingsProvider()
{
  uint64_t result = qword_32028;
  if (!qword_32028) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C37C()
{
  return sub_1AAAC(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C39C(uint64_t a1)
{
  uint64_t v2 = sub_82C8(&qword_31B60);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_24CB8();
  swift_retain();
  uint64_t v6 = sub_24CA8();
  id v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = &protocol witness table for MainActor;
  v7[4] = a1;
  sub_10640((uint64_t)v4, (uint64_t)&unk_32178, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_1C4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 96) = a4;
  sub_24CB8();
  *(void *)(v4 + 104) = sub_24CA8();
  uint64_t v6 = sub_24C98();
  return _swift_task_switch(sub_1C54C, v6, v5);
}

uint64_t sub_1C54C()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    uint64_t v3 = *(void **)(Strong + 104);
    if (v3) {
      unsigned __int8 v4 = [v3 shouldShowDefaultNFCAppPicker];
    }
    else {
      unsigned __int8 v4 = 0;
    }
    swift_getKeyPath();
    uint64_t v5 = swift_task_alloc();
    *(void *)(v5 + 16) = v2;
    *(unsigned char *)(v5 + 24) = v4;
    v0[5] = v2;
    sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    sub_245D8();
    swift_release();
    swift_release();
    swift_task_dealloc();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_1C854();
    swift_release();
  }
  swift_beginAccess();
  uint64_t v6 = swift_weakLoadStrong();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void **)(v6 + 104);
    if (v8) {
      id v9 = [v8 getDefaultNFCApplication];
    }
    else {
      id v9 = 0;
    }
    type metadata accessor for AppRecord();
    swift_allocObject();
    id v10 = v9;
    uint64_t v11 = sub_22508(v9);
    swift_getKeyPath();
    uint64_t v12 = swift_task_alloc();
    *(void *)(v12 + 16) = v7;
    *(void *)(v12 + 24) = v11;
    v0[11] = v7;
    sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    sub_245D8();
    swift_release();

    swift_release();
    swift_release();
    swift_task_dealloc();
  }
  int64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1C854()
{
  uint64_t v1 = v0;
  uint64_t v27 = sub_245A8();
  uint64_t v2 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  unsigned __int8 v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)v0[13];
  uint64_t v6 = _swiftEmptyArrayStorage;
  if (!v5) {
    goto LABEL_13;
  }
  id v7 = [v5 defaultAppCandidates];
  sub_1F850();
  unint64_t v8 = sub_24C48();

  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24E98();
  swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(&v21 - 2) = (uint64_t)v1;
    *(&v21 - 1) = (uint64_t)v6;
    char v29 = v1;
    sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    sub_245D8();
    swift_bridgeObjectRelease();
    return swift_release();
  }
LABEL_4:
  char v29 = _swiftEmptyArrayStorage;
  uint64_t result = sub_24E48();
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v22 = v1;
    uint64_t v11 = 0;
    uint64_t v12 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v23 = (char *)&type metadata for () + 8;
    unint64_t v24 = v8 & 0xC000000000000001;
    uint64_t v25 = v9;
    unint64_t v26 = v8;
    do
    {
      if (v24) {
        id v13 = (id)sub_24DF8();
      }
      else {
        id v13 = *(id *)(v8 + 8 * v11 + 32);
      }
      id v14 = v13;
      ++v11;
      type metadata accessor for AppRecord();
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = 0;
      *(void *)(v15 + 24) = 0;
      *(void *)(v15 + 32) = 0;
      *(void *)(v15 + 40) = 0xE000000000000000;
      sub_24598();
      uint64_t v16 = sub_24578();
      uint64_t v18 = v17;
      (*v12)(v4, v27);
      *(void *)(v15 + 48) = v16;
      *(void *)(v15 + 56) = v18;
      *(void *)(v15 + 64) = 0;
      *(void *)(v15 + 72) = 0;
      *(unsigned char *)(v15 + 80) = 3;
      _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
      uint64_t v19 = swift_getKeyPath();
      __chkstk_darwin(v19);
      *(&v21 - 2) = v15;
      *(&v21 - 1) = (uint64_t)v14;
      uint64_t v28 = v15;
      sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_245D8();

      swift_release();
      sub_24E28();
      sub_24E58();
      sub_24E68();
      sub_24E38();
      unint64_t v8 = v26;
    }
    while (v25 != v11);
    uint64_t v6 = v29;
    swift_bridgeObjectRelease();
    uint64_t v1 = v22;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CC44()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)(Strong + 104);
    if (v1) {
      [v1 shouldShowDefaultNFCAppPicker];
    }
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    sub_245D8();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_1C854();
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    unsigned __int8 v4 = *(void **)(result + 104);
    if (v4) {
      id v5 = [v4 getDefaultNFCApplication];
    }
    else {
      id v5 = 0;
    }
    type metadata accessor for AppRecord();
    swift_allocObject();
    id v6 = v5;
    sub_22508(v5);
    uint64_t v7 = swift_getKeyPath();
    __chkstk_darwin(v7);
    sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    sub_245D8();
    swift_release();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t DefaultContactlessPaymentSettingsProvider.deinit()
{
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1)
  {
    [v1 invalidate];
    uint64_t v2 = *(void **)(v0 + 104);
  }
  else
  {
    uint64_t v2 = 0;
  }
  *(void *)(v0 + 104) = 0;

  sub_19F90(v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0
     + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin41DefaultContactlessPaymentSettingsProvider___observationRegistrar;
  uint64_t v4 = sub_24628();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t DefaultContactlessPaymentSettingsProvider.__deallocating_deinit()
{
  DefaultContactlessPaymentSettingsProvider.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t DefaultContactlessPaymentSettingsProvider.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v22 = a1;
  uint64_t v3 = sub_82C8(&qword_31FB0);
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  __chkstk_darwin(v3);
  id v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_82C8(&qword_31FB8);
  sub_1F210();
  sub_248C8();
  sub_24888();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v6 = (id)qword_33240;
  uint64_t v20 = sub_248D8();
  uint64_t v21 = v7;
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_24CB8();
  swift_retain();
  uint64_t v12 = sub_24CA8();
  id v13 = (void *)swift_allocObject();
  _OWORD v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v1;
  swift_retain();
  uint64_t v14 = sub_24CA8();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v2;
  sub_24A78();
  sub_82C8(&qword_31FE0);
  sub_B88C(&qword_31FE8, &qword_31FB0);
  sub_B88C(&qword_31FF0, &qword_31FE0);
  uint64_t v16 = v24;
  uint64_t v17 = v20;
  sub_24998();
  swift_release();
  swift_release();
  sub_8860(v17, v9, v11);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v5, v16);
}

uint64_t sub_1D3D4(uint64_t a1)
{
  if (*(void *)(a1 + 96))
  {
    sub_A8D4();
    swift_bridgeObjectRetain();
    sub_248E8();
  }
  sub_82C8(&qword_32118);
  sub_82C8(&qword_31A68);
  sub_8360(&qword_31FC8);
  sub_24868();
  sub_8360(&qword_31FD0);
  sub_B88C(&qword_31FD8, &qword_31FD0);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_12884();
  return sub_24AD8();
}

uint64_t sub_1D5DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_24868();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  uint64_t v34 = v4;
  __chkstk_darwin(v3);
  id v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_82C8(&qword_31FD0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_82C8(&qword_31FC8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24888();
  uint64_t v29 = v16;
  uint64_t v30 = v15;
  v27[3] = v17;
  uint64_t v28 = v18;
  sub_24CB8();
  swift_retain();
  uint64_t v19 = sub_24CA8();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = a1;
  swift_retain();
  uint64_t v21 = sub_24CA8();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v21;
  void v22[3] = &protocol witness table for MainActor;
  v22[4] = a1;
  type metadata accessor for AppRecord();
  sub_24A68();
  uint64_t v36 = v38;
  long long v37 = v39;
  sub_82C8(&qword_32120);
  sub_1F6C8(&qword_31AA0, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_1F628();
  sub_24A28();
  uint64_t v23 = sub_B88C(&qword_31FD8, &qword_31FD0);
  sub_24938();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_24858();
  uint64_t v38 = v7;
  *(void *)&long long v39 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v24 = v31;
  uint64_t v25 = v33;
  sub_24928();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v24);
}

uint64_t sub_1D9F0@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 112);
  return swift_retain();
}

void sub_1DA9C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v7 = swift_retain();
  char v8 = _s27DefaultAppsSettingsUIPlugin9AppRecordC2eeoiySbAC_ACtFZ_0(v7, v6);
  swift_release();
  if ((v8 & 1) == 0)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    swift_retain();
    sub_245D8();
    swift_release();
    swift_release();
    swift_getKeyPath();
    sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
    sub_245E8();
    swift_release();
    if (*(void *)(v6 + 24))
    {
      char v10 = *(void **)(a5 + 104);
      if (v10
        && (id v11 = v10,
            swift_bridgeObjectRetain(),
            NSString v12 = sub_24BB8(),
            swift_bridgeObjectRelease(),
            id v13 = [v11 alertMessageForDefaultAppChangeTo:v12],
            v11,
            v12,
            v13))
      {
        sub_24BE8();

        uint64_t v14 = swift_getKeyPath();
        __chkstk_darwin(v14);
        sub_245D8();
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1DD8C(v6);
      }
    }
  }
}

void sub_1DD8C(uint64_t a1)
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_245D8();
    swift_release();
    swift_release();
    uint64_t v4 = *(void **)(v1 + 104);
    if (v4)
    {
      id v5 = v4;
      NSString v6 = sub_24BB8();
      swift_bridgeObjectRelease();
      [v5 setDefaultNFCApplication:v6];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1DF7C()
{
  return sub_24AA8();
}

uint64_t sub_1E128()
{
  return sub_247C8();
}

uint64_t sub_1E220()
{
  sub_82C8(&qword_32150);
  sub_1F728();

  return sub_249B8();
}

uint64_t sub_1E2BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 40);
  *(void *)a2 = *(void *)(a1 + 32);
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = _swiftEmptyArrayStorage;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E378(uint64_t a1)
{
  uint64_t v2 = sub_82C8(&qword_32160);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_82C8(&qword_31B00);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v14[1] = a1;
  sub_1F6C8(&qword_31B58, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_245E8();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    id v9 = objc_allocWithZone((Class)ISIcon);
    swift_bridgeObjectRetain();
    NSString v10 = sub_24BB8();
    swift_bridgeObjectRelease();
    [v9 initWithBundleIdentifier:v10];

    id v11 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
  }
  else
  {
    id v12 = [self genericApplicationIcon];
  }
  sub_24758();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v4, v8, v5);
  swift_storeEnumTagMultiPayload();
  sub_B88C(&qword_31AF8, &qword_31B00);
  sub_248A8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1E67C@<X0>(uint64_t a1@<X2>, BOOL *a2@<X8>)
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  uint64_t result = swift_release();
  *a2 = *(void *)(a1 + 136) != 0;
  return result;
}

uint64_t sub_1E72C()
{
  return swift_release();
}

uint64_t sub_1E7F8@<X0>(char *a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_82C8(&qword_32100);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_82C8(&qword_32108);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)&v23 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v23 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v23 - v15;
  swift_retain();
  sub_24A18();
  sub_24798();
  uint64_t v17 = sub_247A8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 0, 1, v17);
  swift_retain();
  sub_24A08();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v18(v11, v16, v4);
  v18(v8, v14, v4);
  uint64_t v19 = v24;
  v18(v24, v11, v4);
  uint64_t v20 = sub_82C8(&qword_32110);
  v18(&v19[*(int *)(v20 + 48)], v8, v4);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v14, v4);
  v21(v16, v4);
  v21(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v21)(v11, v4);
}

uint64_t sub_1EB24()
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  uint64_t v0 = swift_retain();
  sub_1DD8C(v0);
  swift_release();
  swift_getKeyPath();
  sub_245D8();
  return swift_release();
}

uint64_t sub_1EC4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1EE58(a1);
}

uint64_t sub_1EC64(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 104);
  if (v1) {
    id v2 = [v1 getDefaultNFCApplication];
  }
  else {
    id v2 = 0;
  }
  type metadata accessor for AppRecord();
  swift_allocObject();
  id v3 = v2;
  sub_22508(v2);
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245D8();

  swift_release();
  swift_release();
  uint64_t v5 = swift_getKeyPath();
  __chkstk_darwin(v5);
  sub_245D8();
  return swift_release();
}

uint64_t sub_1EE44@<X0>(uint64_t a1@<X8>)
{
  return sub_1EE58(a1);
}

uint64_t sub_1EE58@<X0>(uint64_t a1@<X8>)
{
  sub_24888();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v2 = (id)qword_33240;
  uint64_t result = sub_248D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1EF28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  if (*(void *)(a1 + 136))
  {
    uint64_t v4 = *(void *)(a1 + 128);
    unint64_t v5 = *(void *)(a1 + 136);
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = _swiftEmptyArrayStorage;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1EFFC()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v1 + 32);
}

uint64_t sub_1F09C()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1F6C8(&qword_31FA8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_245E8();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1F160@<X0>(uint64_t a1@<X8>)
{
  return DefaultContactlessPaymentSettingsProvider.content.getter(a1);
}

uint64_t sub_1F184()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1F1BC()
{
  return sub_1C39C(v0);
}

uint64_t sub_1F1C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1F1D4()
{
  return swift_release();
}

uint64_t sub_1F1E4()
{
  return sub_1B8D0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1F200()
{
  return sub_1CC44();
}

uint64_t sub_1F208()
{
  return sub_1D3D4(v0);
}

unint64_t sub_1F210()
{
  unint64_t result = qword_31FC0;
  if (!qword_31FC0)
  {
    sub_8360(&qword_31FB8);
    sub_8360(&qword_31FC8);
    sub_24868();
    sub_8360(&qword_31FD0);
    sub_B88C(&qword_31FD8, &qword_31FD0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_12884();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31FC0);
  }
  return result;
}

uint64_t sub_1F350@<X0>(BOOL *a1@<X8>)
{
  return sub_1E67C(*(void *)(v1 + 32), a1);
}

uint64_t sub_1F360()
{
  return sub_1E72C();
}

uint64_t sub_1F36C@<X0>(char *a1@<X8>)
{
  return sub_1E7F8(a1);
}

uint64_t sub_1F374@<X0>(uint64_t a1@<X8>)
{
  return sub_1EF28(v1, a1);
}

uint64_t sub_1F37C()
{
  return sub_1F6C8(&qword_31FF8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
}

uint64_t sub_1F3C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1F3E0()
{
  return type metadata accessor for DefaultContactlessPaymentSettingsProvider();
}

uint64_t sub_1F3E8()
{
  uint64_t result = sub_24628();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1F4C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1F5A8()
{
  return sub_1F7C8();
}

uint64_t sub_1F5C0()
{
  return sub_1EB24();
}

uint64_t sub_1F5C8()
{
  return sub_1EC64(v0);
}

uint64_t sub_1F5D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1D5DC(v1, a1);
}

uint64_t sub_1F5E8()
{
  return sub_1F808();
}

uint64_t sub_1F604@<X0>(void *a1@<X8>)
{
  return sub_1D9F0(*(void *)(v1 + 32), a1);
}

void sub_1F614(uint64_t *a1, uint64_t a2)
{
  sub_1DA9C(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_1F620()
{
  return sub_1DF7C();
}

unint64_t sub_1F628()
{
  unint64_t result = qword_32128;
  if (!qword_32128)
  {
    sub_8360(&qword_32120);
    sub_B88C(&qword_32130, &qword_32138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32128);
  }
  return result;
}

uint64_t sub_1F6C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1F710()
{
  return sub_1E220();
}

uint64_t sub_1F718@<X0>(uint64_t a1@<X8>)
{
  return sub_1E2BC(v1, a1);
}

uint64_t sub_1F720()
{
  return sub_1E378(v0);
}

unint64_t sub_1F728()
{
  unint64_t result = qword_32158;
  if (!qword_32158)
  {
    sub_8360(&qword_32150);
    sub_B88C(&qword_31AF8, &qword_31B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32158);
  }
  return result;
}

uint64_t sub_1F7C8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 128) = v0[3];
  *(void *)(v1 + 136) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1F808()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 88) = v0[3];
  *(void *)(v1 + 96) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_1F850()
{
  unint64_t result = qword_32168;
  if (!qword_32168)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_32168);
  }
  return result;
}

void sub_1F898()
{
  sub_224B8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1F8B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_150F8;
  return sub_1C4B4(a1, v4, v5, v6);
}

uint64_t sub_1F96C()
{
  return sub_1F1E4();
}

uint64_t sub_1F984()
{
  return sub_1C37C();
}

id sub_1F99C()
{
  type metadata accessor for DefaultAppsSettingsModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_33240 = (uint64_t)result;
  return result;
}

void sub_1F9F4()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_82C8(&qword_31590);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v8 = (char *)&v27 - v7;
  uint64_t v9 = type metadata accessor for DefaultAppsSettingsViewWrapper(0);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28.receiver = v0;
  v28.super_class = ObjectType;
  objc_msgSendSuper2(&v28, "viewDidLoad");
  uint64_t v13 = (uint64_t)v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin27DefaultAppsSettingsUIPlugin_deepLinkURL;
  swift_beginAccess();
  sub_207F0(v13, (uint64_t)v8);
  id v14 = [v0 navigationItem];
  sub_207F0((uint64_t)v8, (uint64_t)v6);
  sub_249C8();
  sub_B1F8((uint64_t)v8, &qword_31590);
  *(void *)&v12[*(int *)(v10 + 28)] = v14;
  id v15 = objc_allocWithZone((Class)sub_82C8(&qword_321D0));
  uint64_t v16 = (void *)sub_24898();
  id v17 = [v16 view];
  if (!v17)
  {
    uint64_t v18 = v16;
    goto LABEL_6;
  }
  uint64_t v18 = v17;
  id v19 = [v1 view];
  if (v19)
  {
    uint64_t v20 = v19;
    [v19 addSubview:v18];

    id v21 = [v1 view];
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 bounds];
      double v24 = v23;
      double v26 = v25;

      objc_msgSend(v18, "setFrame:", 0.0, 0.0, v24, v26);
      [v18 setAutoresizingMask:18];
      [v1 addChildViewController:v16];
      [v16 didMoveToParentViewController:v1];

LABEL_6:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1FCEC(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_82C8(&qword_31590);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v23 - v10;
  uint64_t v12 = sub_24568();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    long long v25 = 0u;
    long long v26 = 0u;
LABEL_11:
    id v19 = (uint64_t *)&unk_321C8;
    uint64_t v20 = (char *)&v25;
    return sub_B1F8((uint64_t)v20, v19);
  }
  v23[1] = 1752457584;
  _OWORD v23[2] = 0xE400000000000000;
  sub_24DD8();
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_20518((uint64_t)&v24), (v17 & 1) != 0))
  {
    sub_153DC(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v25);
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  sub_1A0D4((uint64_t)&v24);
  if (!*((void *)&v26 + 1)) {
    goto LABEL_11;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return result;
  }
  sub_24558();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    id v19 = &qword_31590;
    uint64_t v20 = v11;
    return sub_B1F8((uint64_t)v20, v19);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
  uint64_t v21 = v3 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin27DefaultAppsSettingsUIPlugin_deepLinkURL;
  swift_beginAccess();
  sub_2055C((uint64_t)v9, v21);
  uint64_t v22 = swift_endAccess();
  if (a2) {
    a2(v22);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

id sub_202B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_20318()
{
  return type metadata accessor for DefaultAppsSettingsUIPlugin(0);
}

uint64_t type metadata accessor for DefaultAppsSettingsUIPlugin(uint64_t a1)
{
  return sub_207B8(a1, (uint64_t *)&unk_321B0);
}

void sub_20340()
{
  sub_203D0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_203D0()
{
  if (!qword_321C0)
  {
    sub_24568();
    unint64_t v0 = sub_24D48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_321C0);
    }
  }
}

uint64_t sub_20428()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_20460()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_20470@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_82C8(&qword_315D8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_82C8(&qword_321D8);
  sub_249E8();
  id v8 = *(id *)(v2 + *(int *)(a1 + 20));
  return DefaultAppsSettingsView.init(deepLinkURL:navigationItem:)((uint64_t)v7, a2);
}

unint64_t sub_20518(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_24DB8(*(void *)(v2 + 40));

  return sub_206D0(a1, v4);
}

uint64_t sub_2055C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82C8(&qword_31590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_205C4(uint64_t a1, uint64_t a2)
{
  sub_24F48();
  sub_24C18();
  Swift::Int v4 = sub_24F58();

  return sub_20858(a1, a2, v4);
}

unint64_t sub_2063C(uint64_t a1)
{
  sub_24BE8();
  sub_24F48();
  sub_24C18();
  Swift::Int v2 = sub_24F58();
  swift_bridgeObjectRelease();

  return sub_2093C(a1, v2);
}

unint64_t sub_206D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1A138(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_24DC8();
      sub_1A0D4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t type metadata accessor for DefaultAppsSettingsViewWrapper(uint64_t a1)
{
  return sub_207B8(a1, (uint64_t *)&unk_32238);
}

uint64_t sub_207B8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_207F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82C8(&qword_31590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_20858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24F28() & 1) == 0)
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
      while (!v14 && (sub_24F28() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2093C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24BE8();
    uint64_t v8 = v7;
    if (v6 == sub_24BE8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24F28();
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
          uint64_t v13 = sub_24BE8();
          uint64_t v15 = v14;
          if (v13 == sub_24BE8() && v15 == v16) {
            break;
          }
          char v18 = sub_24F28();
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

uint64_t *sub_20AB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24568();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_82C8(&qword_31590);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = sub_82C8(&qword_321D8);
    *(uint64_t *)((char *)a1 + *(int *)(v11 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v11 + 28));
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
    swift_retain();
    id v14 = v13;
  }
  return a1;
}

void sub_20C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24568();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  sub_82C8(&qword_321D8);
  swift_release();
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 20));
}

char *sub_20D30(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24568();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_82C8(&qword_31590);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = sub_82C8(&qword_321D8);
  *(void *)&a1[*(int *)(v9 + 28)] = *(void *)&a2[*(int *)(v9 + 28)];
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = *(void **)&a2[v10];
  *(void *)&a1[v10] = v11;
  swift_retain();
  id v12 = v11;
  return a1;
}

char *sub_20E78(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24568();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_82C8(&qword_31590);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = sub_82C8(&qword_321D8);
  *(void *)&a1[*(int *)(v12 + 28)] = *(void *)&a2[*(int *)(v12 + 28)];
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(a3 + 20);
  id v14 = *(void **)&a2[v13];
  uint64_t v15 = *(void **)&a1[v13];
  *(void *)&a1[v13] = v14;
  id v16 = v14;

  return a1;
}

char *sub_21038(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24568();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_82C8(&qword_31590);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = sub_82C8(&qword_321D8);
  *(void *)&a1[*(int *)(v9 + 28)] = *(void *)&a2[*(int *)(v9 + 28)];
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_21178(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24568();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_82C8(&qword_31590);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = sub_82C8(&qword_321D8);
  *(void *)&a1[*(int *)(v12 + 28)] = *(void *)&a2[*(int *)(v12 + 28)];
  swift_release();
  uint64_t v13 = *(int *)(a3 + 20);
  id v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  return a1;
}

uint64_t sub_2132C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_21340);
}

uint64_t sub_21340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_82C8(&qword_321D8);
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

uint64_t sub_21404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_21418);
}

uint64_t sub_21418(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_82C8(&qword_321D8);
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

void sub_214D8()
{
  sub_21570();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21570()
{
  if (!qword_32248)
  {
    sub_8360(&qword_31590);
    unint64_t v0 = sub_249F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_32248);
    }
  }
}

uint64_t sub_215CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_215EC()
{
  unint64_t result = qword_32278;
  if (!qword_32278)
  {
    type metadata accessor for DefaultAppsSettingsView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32278);
  }
  return result;
}

uint64_t sub_21644()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_216E0()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 80);
}

void *sub_2176C()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 64);
  id v2 = v1;
  return v1;
}

uint64_t sub_21800()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2189C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21934()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A40()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21ADC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21B74()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C44()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 64);
  if (v1)
  {
    id v2 = [v1 bundleIdentifier];
    if (v2)
    {
      uint64_t v3 = v2;
      sub_24BE8();
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_245D8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_245E8();
  swift_release();
  uint64_t v5 = *(void **)(v0 + 64);
  if (v5)
  {
    id v6 = [v5 localizedName];
    sub_24BE8();
  }
  uint64_t v7 = swift_getKeyPath();
  __chkstk_darwin(v7);
  sub_245D8();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_21E88(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = a2;
  id v3 = a2;

  sub_21C44();
}

uint64_t sub_21ED8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_245A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_24598();
  uint64_t v8 = sub_24578();
  uint64_t v10 = v9;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 3;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  swift_getKeyPath();
  uint64_t v13 = v2;
  id v14 = a1;
  uint64_t v15 = v2;
  sub_233FC(&qword_31B58);
  sub_245D8();
  swift_release();

  return v2;
}

uint64_t sub_22070()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 72);
  if (v1)
  {
    id v2 = [v1 bundleId];
    if (v2)
    {
      id v3 = v2;
      sub_24BE8();
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_245D8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_245E8();
  swift_release();
  uint64_t v5 = *(void **)(v0 + 72);
  if (v5)
  {
    id v6 = [v5 localizedDisplayName];
    if (v6)
    {
      uint64_t v7 = v6;
      sub_24BE8();
    }
  }
  uint64_t v8 = swift_getKeyPath();
  __chkstk_darwin(v8);
  sub_245D8();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_222B8()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 72);
  id v2 = v1;
  return v1;
}

id sub_2234C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 72);
  *a2 = v4;

  return v4;
}

void sub_223F0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  id v2 = v1;
  sub_245D8();
  swift_release();
}

void sub_224B8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = a2;
  id v3 = a2;

  sub_22070();
}

uint64_t sub_22508(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_245A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_24598();
  uint64_t v8 = sub_24578();
  uint64_t v10 = v9;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 3;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  swift_getKeyPath();
  uint64_t v13 = v2;
  id v14 = a1;
  uint64_t v15 = v2;
  sub_233FC(&qword_31B58);
  sub_245D8();
  swift_release();

  return v2;
}

uint64_t sub_226A0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

unint64_t sub_226A8(unsigned __int8 a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_245A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_24598();
  uint64_t v8 = sub_24578();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 3;
  _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D5111Observation0qH0Vvpfi_0();
  if (a1)
  {
    char v11 = sub_24F28();
    swift_bridgeObjectRelease();
    if (v11)
    {
      swift_release();
      return 0;
    }
    else
    {
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      *(&v21 - 2) = v2;
      *((unsigned char *)&v21 - 8) = a1;
      int v22 = a1;
      unint64_t v23 = v2;
      sub_233FC(&qword_31B58);
      unint64_t v21 = (unint64_t)"RelayCallingNotApplicable";
      sub_245D8();
      swift_release();
      uint64_t v13 = sub_23FFC();
      uint64_t v15 = v14;
      uint64_t v16 = swift_getKeyPath();
      __chkstk_darwin(v16);
      *(&v21 - 4) = v2;
      *(&v21 - 3) = v13;
      *(&v21 - 2) = (unint64_t)v15;
      unint64_t v23 = v2;
      sub_245D8();
      swift_release();
      swift_bridgeObjectRelease();
      if (v22 == 2) {
        unint64_t v17 = 0xD000000000000016;
      }
      else {
        unint64_t v17 = 0xD000000000000010;
      }
      if (v22 == 2) {
        unint64_t v18 = 0x8000000000026890;
      }
      else {
        unint64_t v18 = v21 | 0x8000000000000000;
      }
      uint64_t v19 = swift_getKeyPath();
      __chkstk_darwin(v19);
      *(&v21 - 4) = v2;
      *(&v21 - 3) = v17;
      *(&v21 - 2) = v18;
      unint64_t v23 = v2;
      sub_245D8();
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v2;
}

uint64_t AppRecord.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin9AppRecord___observationRegistrar;
  uint64_t v2 = sub_24628();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AppRecord.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin9AppRecord___observationRegistrar;
  uint64_t v2 = sub_24628();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t AppRecord.id.getter()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  if (v0[3])
  {
    uint64_t v1 = v0[2];
  }
  else
  {
    swift_getKeyPath();
    sub_245E8();
    swift_release();
    uint64_t v1 = v0[6];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for AppRecord()
{
  uint64_t result = qword_322B8;
  if (!qword_322B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22CF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AppRecord.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22D20(uint64_t *a1, uint64_t *a2)
{
  return _s27DefaultAppsSettingsUIPlugin9AppRecordC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t AppRecord.hash(into:)()
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  if (!*(void *)(v0 + 24))
  {
    swift_getKeyPath();
    sub_245E8();
    swift_release();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_24C18();
  return swift_bridgeObjectRelease();
}

Swift::Int AppRecord.hashValue.getter()
{
  sub_24F48();
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  if (!*(void *)(v0 + 24))
  {
    swift_getKeyPath();
    sub_245E8();
    swift_release();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_24C18();
  swift_bridgeObjectRelease();
  return sub_24F58();
}

Swift::Int sub_22F3C()
{
  return AppRecord.hashValue.getter();
}

uint64_t sub_22F60()
{
  return AppRecord.hash(into:)();
}

Swift::Int sub_22F84()
{
  uint64_t v1 = *v0;
  sub_24F48();
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  if (!*(void *)(v1 + 24))
  {
    swift_getKeyPath();
    sub_245E8();
    swift_release();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_24C18();
  swift_bridgeObjectRelease();
  return sub_24F58();
}

uint64_t _s27DefaultAppsSettingsUIPlugin9AppRecordC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  sub_233FC(&qword_31B58);
  sub_245E8();
  swift_release();
  if (*(unsigned char *)(a1 + 80) != 3)
  {
    swift_getKeyPath();
    sub_245E8();
    swift_release();
    if (*(unsigned char *)(a2 + 80) != 3)
    {
      swift_getKeyPath();
      sub_245E8();
      swift_release();
      int v8 = *(unsigned __int8 *)(a1 + 80);
      swift_getKeyPath();
      sub_245E8();
      swift_release();
      int v9 = *(unsigned __int8 *)(a2 + 80);
      char v7 = v9 == 3 && v8 == 3;
      if (v8 == 3 || v9 == 3) {
        return v7 & 1;
      }
      unint64_t v10 = 0xD000000000000010;
      unint64_t v11 = 0x8000000000026850;
      if (v8)
      {
        if (v8 == 1)
        {
          unint64_t v12 = 0x8000000000026870;
          unint64_t v13 = 0xD000000000000010;
          if (v9) {
            goto LABEL_16;
          }
LABEL_23:
          if (v13 == 0xD000000000000019) {
            goto LABEL_27;
          }
          goto LABEL_30;
        }
        unint64_t v13 = 0xD000000000000016;
        unint64_t v12 = 0x8000000000026890;
        if (!v9) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t v13 = 0xD000000000000019;
        unint64_t v12 = 0x8000000000026850;
        if (!v9) {
          goto LABEL_23;
        }
      }
LABEL_16:
      if (v9 == 1)
      {
        id v14 = "RelayCallingNone";
      }
      else
      {
        unint64_t v10 = 0xD000000000000016;
        id v14 = "RelayCallingFromiPhone";
      }
      unint64_t v11 = (unint64_t)(v14 - 32) | 0x8000000000000000;
      if (v13 == v10)
      {
LABEL_27:
        if (v12 == v11)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_29;
        }
      }
LABEL_30:
      char v7 = sub_24F28();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
  }
  swift_getKeyPath();
  sub_245E8();
  swift_release();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_245E8();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = v6 == 0;
  if (v4)
  {
    if (v6)
    {
      if (v5 == *(void *)(a2 + 16) && v4 == v6)
      {
        swift_bridgeObjectRelease();
LABEL_29:
        char v7 = 1;
        return v7 & 1;
      }
      char v7 = sub_24F28();
LABEL_31:
      swift_bridgeObjectRelease();
      return v7 & 1;
    }
    swift_bridgeObjectRelease();
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_233C8()
{
  return sub_233FC(&qword_32288);
}

uint64_t sub_233FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppRecord();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23440()
{
  return type metadata accessor for AppRecord();
}

uint64_t sub_23448()
{
  uint64_t result = sub_24628();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_23514()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 80) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_23524()
{
  return sub_235FC();
}

uint64_t sub_2353C()
{
  return sub_23574();
}

uint64_t sub_2355C()
{
  return sub_235BC();
}

uint64_t sub_23574()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 48) = v0[3];
  *(void *)(v1 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235BC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 16) = v0[3];
  *(void *)(v1 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235FC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 32) = v0[3];
  *(void *)(v1 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_2363C()
{
}

uint64_t sub_23654()
{
  swift_getKeyPath();
  sub_23D0C(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_245E8();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible);
}

uint64_t sub_236FC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  *uint64_t v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23830(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible) = a2;
  return result;
}

uint64_t sub_23840()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  v7[0] = v0;
  sub_23D0C(&qword_317A8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_245E8();
  swift_release();
  uint64_t v2 = v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__providers;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)v2 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_A820(v4, (uint64_t)v7);
      sub_A970(v7, v7[3]);
      if (sub_246E8()) {
        break;
      }
      sub_A884((uint64_t)v7);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    sub_A884((uint64_t)v7);
  }
LABEL_8:
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  v7[0] = v1;
  sub_245D8();
  return swift_release();
}

uint64_t sub_23A18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup_id;
  uint64_t v2 = sub_245A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup___observationRegistrar;
  uint64_t v4 = sub_24628();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_23B0C()
{
  return type metadata accessor for DefaultAppsSettingsGroup();
}

uint64_t type metadata accessor for DefaultAppsSettingsGroup()
{
  uint64_t result = qword_323C0;
  if (!qword_323C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23B60()
{
  uint64_t result = sub_245A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24628();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_23C44()
{
  return sub_23D0C(&qword_32460, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_23C8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup_id;
  uint64_t v4 = sub_245A8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_23D0C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_23D5C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC27DefaultAppsSettingsUIPlugin24DefaultAppsSettingsGroup__isVisible) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_23D74()
{
  uint64_t v0 = sub_24788();
  sub_23DE0(v0, qword_33250);
  sub_A7D0(v0, (uint64_t)qword_33250);
  return sub_24778();
}

uint64_t *sub_23DE0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for RelayCallingOption(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RelayCallingOption(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RelayCallingOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23FB0);
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

uint64_t sub_23FD8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23FE4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RelayCallingOption()
{
  return &type metadata for RelayCallingOption;
}

uint64_t sub_23FFC()
{
  uint64_t v0 = sub_245C8();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_24BA8();
  __chkstk_darwin(v1 - 8);
  sub_24B48();
  if (qword_31570 != -1) {
    swift_once();
  }
  id v2 = (id)qword_33240;
  sub_245B8();
  return sub_24BF8();
}

unint64_t sub_2418C(char a1)
{
  if (!a1) {
    return 0xD000000000000019;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0xD000000000000016;
}

uint64_t sub_241EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_F770(*a1, *a2);
}

Swift::Int sub_241F8()
{
  return sub_24200();
}

Swift::Int sub_24200()
{
  return sub_24F58();
}

uint64_t sub_242AC()
{
  return sub_242B4();
}

uint64_t sub_242B4()
{
  sub_24C18();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_24348()
{
  return sub_24350();
}

Swift::Int sub_24350()
{
  return sub_24F58();
}

uint64_t sub_243F8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_244AC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_24428@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2418C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24458()
{
  unint64_t result = qword_32468;
  if (!qword_32468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32468);
  }
  return result;
}

uint64_t sub_244AC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_2D138;
  v6._object = a2;
  unint64_t v4 = sub_24EF8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_244F8()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_24508()
{
  return URLComponents.path.getter();
}

uint64_t sub_24518()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_24528()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_24538()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_24548()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_24558()
{
  return URL.init(string:)();
}

uint64_t sub_24568()
{
  return type metadata accessor for URL();
}

uint64_t sub_24578()
{
  return UUID.uuidString.getter();
}

uint64_t sub_24588()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24598()
{
  return UUID.init()();
}

uint64_t sub_245A8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_245B8()
{
  return static Locale.current.getter();
}

uint64_t sub_245C8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_245D8()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_245E8()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_245F8()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t sub_24608()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t _s27DefaultAppsSettingsUIPlugin9AppRecordC22__observationRegistrar33_25F41E39A39BC45BDD335863E62D4D51LL11Observation0qH0Vvpfi_0()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_24628()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_24638()
{
  return DefaultKeyboardSettingsProvider.init()();
}

uint64_t sub_24648()
{
  return type metadata accessor for DefaultKeyboardSettingsProvider();
}

uint64_t sub_24658()
{
  return DefaultMarketplaceViewProvider.init()();
}

uint64_t sub_24668()
{
  return type metadata accessor for DefaultMarketplaceViewProvider();
}

uint64_t sub_24678()
{
  return PMPasswordOptionsDefaultAppsProvider.init()();
}

uint64_t sub_24688()
{
  return type metadata accessor for PMPasswordOptionsDefaultAppsProvider();
}

uint64_t sub_24698()
{
  return dispatch thunk of DefaultAppsSettingsProvider.localizedTitle.getter();
}

uint64_t sub_246A8()
{
  return dispatch thunk of DefaultAppsSettingsProvider.localizedDetail.getter();
}

uint64_t sub_246B8()
{
  return dispatch thunk of DefaultAppsSettingsProvider.localizedNavigationTitle.getter();
}

uint64_t sub_246C8()
{
  return dispatch thunk of DefaultAppsSettingsProvider.id.getter();
}

uint64_t sub_246D8()
{
  return dispatch thunk of DefaultAppsSettingsProvider.content.getter();
}

uint64_t sub_246E8()
{
  return dispatch thunk of DefaultAppsSettingsProvider.available.getter();
}

uint64_t sub_246F8()
{
  return SettingsAnyViewRecipe.init<A>(content:)();
}

uint64_t sub_24708()
{
  return type metadata accessor for SettingsAnyViewRecipe();
}

uint64_t sub_24718()
{
  return AppendSettingsNavigationPathAction.callAsFunction<A>(_:)();
}

uint64_t sub_24728()
{
  return type metadata accessor for AppendSettingsNavigationPathAction();
}

uint64_t sub_24738()
{
  return DefaultSpamFilterSettingsProvider.init()();
}

uint64_t sub_24748()
{
  return type metadata accessor for DefaultSpamFilterSettingsProvider();
}

uint64_t sub_24758()
{
  return AsyncIconImage.init<>(icon:descriptor:)();
}

uint64_t sub_24768()
{
  return Logger.logObject.getter();
}

uint64_t sub_24778()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_24788()
{
  return type metadata accessor for Logger();
}

uint64_t sub_24798()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_247A8()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_247B8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_247C8()
{
  return PickerOption.init(value:content:)();
}

uint64_t sub_247D8()
{
  return LabeledContent<>.init(content:label:)();
}

uint64_t sub_247E8()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_247F8()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t sub_24808()
{
  return EnvironmentValues.appendSettingsNavigationPath.getter();
}

uint64_t sub_24818()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_24828()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_24838()
{
  return EnvironmentValues.init()();
}

uint64_t sub_24848()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_24858()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_24868()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_24878()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_24888()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_24898()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_248A8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_248B8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_248C8()
{
  return List<>.init(content:)();
}

uint64_t sub_248D8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_248E8()
{
  return Text.init<A>(_:)();
}

uint64_t sub_248F8()
{
  return View.settingsListAppearance()();
}

uint64_t sub_24908()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_24918()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_24928()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_24938()
{
  return View.labelsHidden()();
}

uint64_t sub_24948()
{
  return View.accessibility(identifier:)();
}

uint64_t sub_24958()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_24968()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_24978()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_24988()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_24998()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t sub_249A8()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_249B8()
{
  return Label.init(title:icon:)();
}

uint64_t sub_249C8()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_249D8()
{
  return State.wrappedValue.getter();
}

uint64_t sub_249E8()
{
  return State.projectedValue.getter();
}

uint64_t sub_249F8()
{
  return type metadata accessor for State();
}

uint64_t sub_24A08()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_24A18()
{
  return Button.init(action:label:)();
}

uint64_t sub_24A28()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_24A38()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_24A48()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_24A58()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_24A68()
{
  return Binding.init(get:set:)();
}

uint64_t sub_24A78()
{
  return Binding.init(get:set:)();
}

uint64_t sub_24A88()
{
  return type metadata accessor for Binding();
}

uint64_t sub_24A98()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_24AA8()
{
  return ForEach<>.init<A>(_:content:)();
}

uint64_t sub_24AB8()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_24AC8()
{
  return Section<>.init(content:)();
}

uint64_t sub_24AD8()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_24AE8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_24AF8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_24B08()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_24B18()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:graphicIconTypeIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

NSDictionary sub_24B28()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_24B38()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24B48()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_24B58(Swift::String a1)
{
}

void sub_24B68(Swift::String a1)
{
}

uint64_t sub_24B78()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_24B88()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_24B98()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_24BA8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_24BB8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_24BC8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_24BD8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_24BE8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24BF8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_24C08()
{
  return String.init<A>(describing:)();
}

uint64_t sub_24C18()
{
  return String.hash(into:)();
}

Swift::Int sub_24C28()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_24C38()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_24C48()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24C58()
{
  return specialized Array._endMutation()();
}

uint64_t sub_24C68()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_24C78()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_24C88()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_24C98()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_24CA8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_24CB8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_24CC8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_24CD8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_24CE8()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_24CF8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_24D08()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_24D18()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_24D28()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_24D38()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_24D48()
{
  return type metadata accessor for Optional();
}

uint64_t sub_24D58()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_24D68()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_24D78()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_24D88()
{
  return StringProtocol.localizedStandardCompare<A>(_:)();
}

uint64_t sub_24D98()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_24DA8()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_24DB8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_24DC8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_24DD8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_24DE8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_24DF8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_24E18()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_24E28()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_24E38()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_24E48()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_24E58()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_24E68()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_24E78()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_24E88()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_24E98()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_24EA8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_24EB8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_24EC8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_24ED8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_24EF8(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_24F08(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_24F18()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_24F28()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_24F38()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_24F48()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_24F58()
{
  return Hasher._finalize()();
}

uint64_t sub_24F68()
{
  return _typeName(_:qualified:)();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t defaultAppRelayTelephonySetting()
{
  return _defaultAppRelayTelephonySetting();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t setDefaultAppRelayTelephonySetting()
{
  return _setDefaultAppRelayTelephonySetting();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}