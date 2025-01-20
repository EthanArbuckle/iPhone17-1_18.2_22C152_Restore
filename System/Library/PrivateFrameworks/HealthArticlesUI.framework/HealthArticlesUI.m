id static NSNotificationName.articleWasReadByUser.getter()
{
  void *v0;
  uint64_t vars8;

  if (qword_1EBB6BD00 != -1) {
    swift_once();
  }
  v0 = (void *)qword_1EBB6BCF8;
  return v0;
}

id sub_1C28FA610()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setAdjustsFontForContentSizeCategory_, 1);
    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    objc_msgSend(v4, sel_setText_, 0);
    v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void *sub_1C28FA6E4(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label] = 0;
  v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text];
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes] = 7;
  v24.receiver = v4;
  v24.super_class = (Class)type metadata accessor for DynamicHeightLabelView();
  v10 = objc_msgSendSuper2(&v24, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v10, sel_setPreservesSuperviewLayoutMargins_, 1);
  v11 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v10) + 0xC8);
  v12 = v10;
  v11();
  objc_msgSend(v12, sel_setLayoutMargins_);

  v13 = v12;
  id v14 = sub_1C28FA610();
  objc_msgSend(v13, sel_addSubview_, v14);

  v15 = self;
  id v16 = sub_1C28FA610();
  v17 = v13;
  sub_1C290D96C(v16, v17, 0, 1);

  sub_1C28FBAF4();
  v18 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_activateConstraints_, v18);

  sub_1C28FBB34();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1C2921D10;
  uint64_t v20 = sub_1C2920730();
  uint64_t v21 = MEMORY[0x1E4FB1138];
  *(void *)(v19 + 32) = v20;
  *(void *)(v19 + 40) = v21;
  v22 = v17;
  MEMORY[0x1C8761660](v19, sel_preferredContentSizeCategoryDidChange);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v22;
}

unint64_t sub_1C28FA9BC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text + 8);
  if (v1)
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes);
    if (v2 != 7)
    {
      uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text);
      unint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes);
      swift_bridgeObjectRetain();
      sub_1C28FBAE4(v2);
      sub_1C28FAA94(v3, v1, 0, &v5);
      swift_bridgeObjectRelease();
      return sub_1C28FB7C8(v2);
    }
  }
  return result;
}

void sub_1C28FAA94(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  unint64_t v5 = v4;
  unint64_t v9 = *a4;
  v10 = (uint64_t *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text];
  uint64_t *v10 = a1;
  v10[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v11 = *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes];
  *(void *)&v5[OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes] = v9;
  sub_1C28FB7B8(v9);
  sub_1C28FB7C8(v11);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_init);
  if (!*(void *)(HealthArticleTextAttributes.textAttributes.getter() + 16)) {
    goto LABEL_6;
  }
  id v12 = (id)*MEMORY[0x1E4FB06F8];
  sub_1C2908400((uint64_t)v12);
  if ((v13 & 1) == 0)
  {

LABEL_6:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_unknownObjectRetain();

  swift_bridgeObjectRelease();
  self;
  id v14 = (id)swift_dynamicCastObjCClass();
  if (v14) {
    goto LABEL_8;
  }
  swift_unknownObjectRelease();
LABEL_7:
  id v15 = sub_1C28FA610();
  id v14 = objc_msgSend(v15, sel_font);

  if (!v14)
  {
    __break(1u);
    return;
  }
LABEL_8:
  sub_1C28FAD28(a1, a2, a3, v14, objc_msgSend(v5, sel_effectiveUserInterfaceLayoutDirection, v19, v9) == (id)1);

  unint64_t v16 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1C29100E8(v16);
  type metadata accessor for Key(0);
  sub_1C28FB728((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
  v17 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_addAttributes_range_, v17, 0, objc_msgSend(v20, sel_length));
  swift_bridgeObjectRelease();

  id v18 = sub_1C28FA610();
  objc_msgSend(v18, sel_setAttributedText_, v20);

  objc_msgSend(v5, sel_setNeedsLayout);
}

void sub_1C28FAD28(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5)
{
  v7 = a4;
  if (a5)
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v9, (SEL)&selRef_setLineBreakStrategy_, v10);

    objc_msgSend(v5, sel_appendAttributedString_, v11);
    if (!a3) {
      return;
    }
    id v12 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    id v32 = a3;
    char v13 = (void *)sub_1C2920BB0();
    id v14 = objc_msgSend(v12, (SEL)&selRef_setLineBreakStrategy_, v13);

    objc_msgSend(v5, sel_appendAttributedString_, v14);
    v7 = a4;
  }
  else
  {
    if (!a3)
    {
LABEL_11:
      id v29 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
      swift_bridgeObjectRetain();
      v30 = (void *)sub_1C2920BB0();
      swift_bridgeObjectRelease();
      id v32 = objc_msgSend(v29, sel_initWithString_, v30);

      objc_msgSend(v5, sel_appendAttributedString_, v32);
      goto LABEL_12;
    }
    id v32 = a3;
  }
  id v15 = objc_msgSend(self, sel_textAttachmentWithImage_, v32);
  objc_msgSend(v15, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  id v16 = objc_msgSend(v15, sel_image);
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v7, sel_capHeight);
    double v19 = v18;
    objc_msgSend(v17, sel_size);
    double v21 = round(v19 - v20) * 0.5;
    objc_msgSend(v17, sel_size);
    double v23 = v22;
    objc_msgSend(v17, sel_size);
    objc_msgSend(v15, sel_setBounds_, 0.0, v21, v23, v24);
  }
  id v25 = objc_msgSend(self, sel_attributedStringWithAttachment_, v15);
  objc_msgSend(v5, byte_1E645899B, v25);

  if ((a5 & 1) == 0)
  {
    id v26 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    v27 = (void *)sub_1C2920BB0();
    id v28 = objc_msgSend(v26, sel_initWithString_, v27);

    objc_msgSend(v5, byte_1E645899B, v28);
    goto LABEL_11;
  }

LABEL_12:
}

id sub_1C28FB070()
{
  return objc_msgSend(v0, sel_layoutMargins);
}

id sub_1C28FB080()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicHeightLabelView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DynamicHeightLabelView()
{
  return self;
}

void type metadata accessor for TimeControlStatus(uint64_t a1)
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

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_1C28FB184(uint64_t a1, uint64_t a2)
{
  return sub_1C28FB304(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1C28FB1A8(uint64_t a1, uint64_t a2)
{
  return sub_1C28FB304(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1C28FB1C8(uint64_t a1, id *a2)
{
  uint64_t result = sub_1C2920BC0();
  *a2 = 0;
  return result;
}

uint64_t sub_1C28FB240(uint64_t a1, id *a2)
{
  char v3 = sub_1C2920BD0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1C28FB2C0@<X0>(uint64_t *a1@<X8>)
{
  sub_1C2920BE0();
  uint64_t v2 = sub_1C2920BB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C28FB304(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1C2920BE0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C28FB348()
{
  sub_1C2920BE0();
  sub_1C2920C30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C28FB39C()
{
  sub_1C2920BE0();
  sub_1C2921150();
  sub_1C2920C30();
  uint64_t v0 = sub_1C2921180();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C28FB410()
{
  return MEMORY[0x1F40E63F0](*v0);
}

uint64_t sub_1C28FB418(uint64_t a1, uint64_t a2)
{
  int v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x1C8761550](a1, &v6);
  char v4 = v7;
  int v5 = v6;
  if (v7) {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_1C28FB46C(uint64_t a1, uint64_t a2)
{
  int v7 = 0;
  char v8 = 1;
  char v3 = MEMORY[0x1C8761560](a1, &v7);
  char v4 = v8;
  int v5 = v7;
  if (v8) {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_1C28FB4C4(float *a1@<X8>)
{
  *a1 = MEMORY[0x1C8761570]();
}

BOOL sub_1C28FB4EC(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1C28FB500@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1C28FB510(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1C28FB520()
{
  uint64_t v0 = sub_1C2920BE0();
  uint64_t v2 = v1;
  if (v0 == sub_1C2920BE0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1C2921110();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C28FB5B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C2920BE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C28FB5DC()
{
  sub_1C28FB728((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
  sub_1C28FB728(&qword_1EA31C328, type metadata accessor for Key);
  return sub_1C29210D0();
}

uint64_t sub_1C28FB698()
{
  return sub_1C28FB728(&qword_1EA31C310, type metadata accessor for Key);
}

uint64_t sub_1C28FB6E0()
{
  return sub_1C28FB728(&qword_1EA31C318, type metadata accessor for Key);
}

uint64_t sub_1C28FB728(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C28FB770()
{
  return sub_1C28FB728(&qword_1EA31C320, type metadata accessor for Key);
}

unint64_t sub_1C28FB7B8(unint64_t result)
{
  if (result >= 7) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_1C28FB7C8(unint64_t result)
{
  if (result != 7) {
    return sub_1C28FB7D8(result);
  }
  return result;
}

unint64_t sub_1C28FB7D8(unint64_t result)
{
  if (result >= 7) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C28FB7E8()
{
  sub_1C28FB728(&qword_1EA31C3B8, type metadata accessor for FeatureKey);
  sub_1C28FB728(&qword_1EA31C3C0, type metadata accessor for FeatureKey);
  return sub_1C29210D0();
}

uint64_t sub_1C28FB8A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1C2920BB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C28FB8EC()
{
  sub_1C28FB728(&qword_1EA31C3A8, type metadata accessor for AttributeName);
  sub_1C28FB728(&qword_1EA31C3B0, type metadata accessor for AttributeName);
  return sub_1C29210D0();
}

_DWORD *sub_1C28FB9A8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

float sub_1C28FB9B8@<S0>(_DWORD *a1@<X8>)
{
  float result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_1C28FB9C4()
{
  return sub_1C29210D0();
}

uint64_t sub_1C28FBA80()
{
  return MEMORY[0x1F41840D0](*v0);
}

uint64_t sub_1C28FBA88()
{
  return sub_1C2921170();
}

void sub_1C28FBABC()
{
}

BOOL sub_1C28FBAD0(float *a1, float *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1C28FBAE4(unint64_t result)
{
  if (result != 7) {
    return sub_1C28FB7B8(result);
  }
  return result;
}

unint64_t sub_1C28FBAF4()
{
  unint64_t result = qword_1EBB6BB08;
  if (!qword_1EBB6BB08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB6BB08);
  }
  return result;
}

void sub_1C28FBB34()
{
  if (!qword_1EA31C330)
  {
    sub_1C28FBB8C();
    unint64_t v0 = sub_1C2921100();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C330);
    }
  }
}

unint64_t sub_1C28FBB8C()
{
  unint64_t result = qword_1EA31C690;
  if (!qword_1EA31C690)
  {
    sub_1C28FBBC8();
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C690);
  }
  return result;
}

unint64_t sub_1C28FBBC8()
{
  unint64_t result = qword_1EA31C338;
  if (!qword_1EA31C338)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C338);
  }
  return result;
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

void type metadata accessor for FeatureKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for LinkedTextView.LinkFormat(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_1C28FBC90(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C28FBCB0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

uint64_t sub_1C28FBCFC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C28FBD1C(uint64_t result, int a2, int a3)
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

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
}

void sub_1C28FBD6C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1C28FBDB4()
{
  return sub_1C28FB728(&qword_1EA31C360, type metadata accessor for UILayoutPriority);
}

uint64_t sub_1C28FBDFC()
{
  return sub_1C28FB728(&qword_1EA31C368, type metadata accessor for UILayoutPriority);
}

uint64_t sub_1C28FBE44()
{
  return sub_1C28FB728(&qword_1EA31C370, type metadata accessor for UILayoutPriority);
}

uint64_t sub_1C28FBE8C()
{
  return sub_1C28FB728(&qword_1EA31C378, type metadata accessor for FeatureKey);
}

uint64_t sub_1C28FBED4()
{
  return sub_1C28FB728(&qword_1EA31C380, type metadata accessor for FeatureKey);
}

uint64_t sub_1C28FBF1C()
{
  return sub_1C28FB728(&qword_1EA31C388, type metadata accessor for AttributeName);
}

uint64_t sub_1C28FBF64()
{
  return sub_1C28FB728(&qword_1EA31C390, type metadata accessor for AttributeName);
}

uint64_t sub_1C28FBFAC()
{
  return sub_1C28FB728(&qword_1EA31C398, type metadata accessor for AttributeName);
}

uint64_t sub_1C28FBFF4()
{
  return sub_1C28FB728(&qword_1EA31C3A0, type metadata accessor for FeatureKey);
}

id sub_1C28FC04C(double a1, double a2, double a3, double a4)
{
  id v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat];
  *(_OWORD *)id v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = -1;
  v10 = &v4[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent];
  uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  id v12 = &v4[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_rangeOfLink];
  *(void *)id v12 = 0;
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for LinkedTextView();
  id v13 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  id v14 = sub_1C290ECF8();

  objc_msgSend(v14, sel_setDelegate_, v13);
  id v15 = v13;
  id v16 = sub_1C290ECF8();

  objc_msgSend(v16, sel_setUserInteractionEnabled_, 1);
  return v15;
}

void sub_1C28FC2C0(long long *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v62 = a5;
  uint64_t v58 = a4;
  uint64_t v54 = a3;
  int v7 = a1;
  sub_1C28FD914(a1, (uint64_t)v63);
  uint64_t v8 = v63[1];
  uint64_t v59 = v63[0];
  uint64_t v57 = v63[2];
  uint64_t v56 = v63[3];
  LODWORD(v61) = v64;
  uint64_t v53 = sub_1C2920470();
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  v51 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v60 = (uint64_t)v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C28FDA50(0, &qword_1EBB6B6D0, type metadata accessor for HealthArticleComponent.LinkContent, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)v50 - v14;
  uint64_t v55 = *a2;
  id v16 = &v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat];
  uint64_t v17 = *(void *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat];
  uint64_t v18 = *(void *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 8];
  uint64_t v19 = *(void *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 16];
  uint64_t v20 = *(void *)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 24];
  *(void *)id v16 = v59;
  *((void *)v16 + 1) = v8;
  v50[1] = v8;
  uint64_t v21 = v56;
  *((void *)v16 + 2) = v57;
  *((void *)v16 + 3) = v21;
  double v22 = v5;
  double v23 = v7;
  LOBYTE(v7) = v16[32];
  v16[32] = (char)v61;
  v61 = v23;
  sub_1C28FD92C((uint64_t)v23);
  sub_1C28FD900(v17, v18, v19, v20, v7);
  sub_1C28FD840(v62, (uint64_t)v15);
  double v24 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  uint64_t v59 = v10;
  v24(v15, 0, 1, v10);
  uint64_t v25 = (uint64_t)&v5[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent];
  swift_beginAccess();
  sub_1C28FD964((uint64_t)v15, v25);
  swift_endAccess();
  if (v58) {
    id v26 = (void *)sub_1C2920BB0();
  }
  else {
    id v26 = 0;
  }
  objc_msgSend(v5, sel_setAccessibilityIdentifier_, v26);

  sub_1C28FD914(v61, (uint64_t)v67);
  if (v68)
  {
    if (v68 == 1)
    {
      sub_1C28FD098(v67[0], v67[1], (uint64_t)v65);
      uint64_t v27 = v65[2];
      uint64_t v28 = v65[3];
      char v29 = v66;
      goto LABEL_10;
    }
    v65[0] = v67[2];
    v65[1] = v67[3];
    swift_bridgeObjectRetain();
    sub_1C2920C50();
    swift_bridgeObjectRetain();
    sub_1C2920C50();
    uint64_t v27 = sub_1C2920C70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_1C2920C70();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_1C2920C70();
    uint64_t v27 = 0;
  }
  char v29 = 0;
LABEL_10:
  uint64_t v30 = v55;
  v31 = &v22[OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_rangeOfLink];
  *(void *)v31 = v27;
  *((void *)v31 + 1) = v28;
  v31[16] = v29;
  id v32 = (void *)sub_1C2920BB0();
  objc_msgSend(v22, sel_setAccessibilityLabel_, v32);

  v65[0] = v30;
  unint64_t v33 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1C29100E8(v33);
  swift_bridgeObjectRelease();
  id v34 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  v35 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1C28FD9F8();
  v36 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v34, sel_initWithString_attributes_, v35, v36);

  uint64_t v38 = v60;
  sub_1C28FD840(v62, v60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
  }
  else
  {
    uint64_t v39 = v52;
    v40 = v51;
    uint64_t v41 = v38;
    uint64_t v42 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v51, v41, v53);
    sub_1C2920440();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v42);
  }
  if (v31[16] == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v44 = *(void *)v31;
    uint64_t v43 = *((void *)v31 + 1);
    uint64_t v45 = *MEMORY[0x1E4FB0720];
    v46 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_addAttribute_value_range_, v45, v46, v44, v43);

    sub_1C28FD914(v61, (uint64_t)v65);
    if (v66 != 1)
    {
      uint64_t v47 = *MEMORY[0x1E4FB06C8];
      v48 = (void *)sub_1C2920DC0();
      objc_msgSend(v37, sel_addAttribute_value_range_, v47, v48, v44, v43);
    }
  }
  id v49 = sub_1C290ECF8();
  objc_msgSend(v49, sel_setAttributedText_, v37);

  objc_msgSend(v22, sel_setNeedsLayout);
}

double sub_1C28FC910()
{
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return 6.0;
}

unint64_t sub_1C28FC958(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v14 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14) {
    return 0;
  }
  if (sub_1C2920F00() == a1 && v8 == a2)
  {
    unint64_t v4 = a3;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_1C2921110();
    swift_bridgeObjectRelease();
    if (v9)
    {
      return a3;
    }
    else
    {
      while (1)
      {
        unint64_t v11 = sub_1C2920EE0();
        if (v11 >> 14 == v14) {
          return 0;
        }
        unint64_t v4 = v11;
        if (sub_1C2920F00() == a1 && v12 == a2) {
          goto LABEL_6;
        }
        char v10 = sub_1C2921110();
        swift_bridgeObjectRelease();
        if (v10) {
          return v4;
        }
      }
    }
  }
  return v4;
}

uint64_t sub_1C28FCAD4()
{
  sub_1C28FD900(*(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 8), *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 16), *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 24), *(unsigned char *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat + 32));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent;
  return sub_1C28FD750(v1);
}

id sub_1C28FCB20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkedTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C28FCBB0()
{
  return type metadata accessor for LinkedTextView();
}

uint64_t type metadata accessor for LinkedTextView()
{
  uint64_t result = qword_1EBB6B750;
  if (!qword_1EBB6B750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C28FCC04()
{
  sub_1C28FDA50(319, &qword_1EBB6B6D0, type metadata accessor for HealthArticleComponent.LinkContent, MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1C28FCDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for LinkedTextView.LinkFormat(uint64_t a1)
{
  return sub_1C28FCE4C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_1C28FCE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LinkedTextView.LinkFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_1C28FCDD8(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for LinkedTextView.LinkFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_1C28FCDD8(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1C28FCE4C(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for LinkedTextView.LinkFormat(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_1C28FCE4C(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkedTextView.LinkFormat(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkedTextView.LinkFormat(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1C28FD074(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1C28FD080(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkedTextView.LinkFormat()
{
  return &type metadata for LinkedTextView.LinkFormat;
}

unint64_t sub_1C28FD098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1C28FDA50(0, &qword_1EA31C450, (uint64_t (*)(uint64_t))sub_1C28FDAB4, MEMORY[0x1E4FBD2D0]);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v30 - v9;
  sub_1C28FDAB4();
  sub_1C2920540();
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  sub_1C28FDB1C();
  sub_1C28FDB70();
  uint64_t v11 = sub_1C2920B90();
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    char v29 = 1;
    goto LABEL_7;
  }
  v30[3] = v12;
  v30[4] = v11;
  uint64_t v31 = a1;
  unint64_t v14 = sub_1C2920C90();
  unint64_t v16 = sub_1C28FC958(93, 0xE100000000000000, v14, v15);
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    char v29 = 1;
    a1 = v31;
    goto LABEL_7;
  }
  unint64_t v18 = v16;
  unint64_t result = sub_1C2920EF0();
  if (v18 >> 14 >= result >> 14)
  {
    uint64_t v20 = sub_1C2920F10();
    v30[1] = v21;
    v30[2] = v20;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    v30[0] = v23;
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t v36 = v31;
    uint64_t v37 = a2;
    uint64_t v32 = v20;
    uint64_t v33 = v22;
    uint64_t v34 = v24;
    uint64_t v35 = v26;
    sub_1C28FDBF8();
    swift_bridgeObjectRetain();
    sub_1C2920C20();
    swift_bridgeObjectRetain();
    sub_1C2920C90();
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_1C2920C80();
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_1C2920C80();
    swift_bridgeObjectRelease();
    unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    char v29 = 0;
    a1 = v36;
    a2 = v37;
LABEL_7:
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(void *)(a3 + 16) = v27;
    *(void *)(a3 + 24) = v28;
    *(unsigned char *)(a3 + 32) = v29;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C28FD3E8()
{
  sub_1C28FDA50(0, &qword_1EBB6B6D0, type metadata accessor for HealthArticleComponent.LinkContent, MEMORY[0x1E4FBB718]);
  ((void (*)(void))MEMORY[0x1F4188790])();
  objc_super v2 = (char *)&v19 - v1;
  uint64_t v3 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v7 = (void (**)(void))((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v10 = (uint64_t)v0 + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent;
  swift_beginAccess();
  sub_1C28FD6BC(v10, (uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1C28FD750((uint64_t)v2);
  }
  else
  {
    sub_1C28FD7DC((uint64_t)v2, (uint64_t)v9);
    sub_1C28FD840((uint64_t)v9, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = *v7;
      id v12 = objc_msgSend(v0, sel_viewController);
      if (v12)
      {
        char v13 = v12;
        v11();

        swift_release();
        sub_1C28FD8A4((uint64_t)v9);
      }
      else
      {
        sub_1C28FD8A4((uint64_t)v9);
        swift_release();
      }
    }
    else
    {
      id v14 = objc_msgSend(self, sel_defaultWorkspace);
      if (v14)
      {
        unint64_t v15 = v14;
        unint64_t v16 = (void *)sub_1C2920450();
        sub_1C2910D2C(MEMORY[0x1E4FBC860]);
        char v17 = (void *)sub_1C2920B70();
        swift_bridgeObjectRelease();
        objc_msgSend(v15, sel_openSensitiveURL_withOptions_, v16, v17);
      }
      sub_1C28FD8A4((uint64_t)v9);
      sub_1C28FD8A4((uint64_t)v7);
    }
  }
  return 0;
}

uint64_t sub_1C28FD6BC(uint64_t a1, uint64_t a2)
{
  sub_1C28FDA50(0, &qword_1EBB6B6D0, type metadata accessor for HealthArticleComponent.LinkContent, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C28FD750(uint64_t a1)
{
  sub_1C28FDA50(0, &qword_1EBB6B6D0, type metadata accessor for HealthArticleComponent.LinkContent, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C28FD7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C28FD840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C28FD8A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C28FD900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_1C28FCE4C(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1C28FD914(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1C28FD92C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C28FD964(uint64_t a1, uint64_t a2)
{
  sub_1C28FDA50(0, &qword_1EBB6B6D0, type metadata accessor for HealthArticleComponent.LinkContent, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C28FD9F8()
{
  unint64_t result = qword_1EA31C750;
  if (!qword_1EA31C750)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C750);
  }
  return result;
}

void sub_1C28FDA50(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1C28FDAB4()
{
  if (!qword_1EA31C458)
  {
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EA31C458);
    }
  }
}

unint64_t sub_1C28FDB1C()
{
  unint64_t result = qword_1EA31C460;
  if (!qword_1EA31C460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C460);
  }
  return result;
}

unint64_t sub_1C28FDB70()
{
  unint64_t result = qword_1EA31C468;
  if (!qword_1EA31C468)
  {
    sub_1C28FDA50(255, &qword_1EA31C450, (uint64_t (*)(uint64_t))sub_1C28FDAB4, MEMORY[0x1E4FBD2D0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C468);
  }
  return result;
}

unint64_t sub_1C28FDBF8()
{
  unint64_t result = qword_1EA31C470;
  if (!qword_1EA31C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C470);
  }
  return result;
}

double sub_1C28FDC4C()
{
  objc_msgSend(v0, sel_layoutMargins);
  return 20.0;
}

id sub_1C28FDD30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TitleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TitleView()
{
  return self;
}

double sub_1C28FDD88()
{
  return 0.25;
}

double HealthArticleHighlightProviding.highlightedAnimationDuration.getter()
{
  return 0.25;
}

double sub_1C28FDD98()
{
  return 0.1;
}

double HealthArticleHighlightProviding.highlightedOverlayAlpha.getter()
{
  return 0.1;
}

double sub_1C28FDDB0()
{
  return 1.0;
}

double HealthArticleHighlightProviding.highlightedUnderlayAlpha.getter()
{
  return 1.0;
}

Swift::Void __swiftcall HealthArticleHighlightProviding.setHighlighted(_:animated:)(Swift::Bool _, Swift::Bool animated)
{
  uint64_t v4 = v3;
  uint64_t v41 = v3;
  uint64_t v5 = v2;
  BOOL v45 = _;
  LODWORD(v46) = animated;
  uint64_t v6 = *(void *)(v2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x1F4188790](_);
  v48 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v44 = (char *)&v39 - v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  char v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v11);
  unint64_t v15 = (char *)&v39 - v14;
  unint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 16);
  v16((char *)&v39 - v14, v17);
  uint64_t v39 = v13;
  ((void (*)(char *, char *, uint64_t))v16)(v13, v15, v5);
  uint64_t v18 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v20 = v19 + v7;
  uint64_t v43 = v18 | 7;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v5;
  *(void *)(v21 + 24) = v4;
  uint64_t v40 = v6;
  uint64_t v42 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v42(v21 + v19, v15, v5);
  BOOL v22 = v45;
  *(unsigned char *)(v21 + v20) = v45;
  uint64_t v23 = v44;
  ((void (*)(char *, uint64_t, uint64_t))v16)(v44, v47, v5);
  ((void (*)(char *, char *, uint64_t))v16)(v48, v23, v5);
  uint64_t v24 = v41;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v5;
  *(void *)(v25 + 24) = v24;
  v42(v25 + v19, v23, v5);
  *(unsigned char *)(v25 + v20) = v22;
  if (v46)
  {
    uint64_t v46 = v25;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v40 + 8);
    v26(v39, v5);
    uint64_t v27 = (uint64_t)v48;
    if (v22)
    {
      sub_1C28FE464((uint64_t)v48, 1, v5, v24);
      v26((char *)v27, v5);
      uint64_t v28 = self;
      double v29 = (*(double (**)(uint64_t, uint64_t))(v24 + 24))(v5, v24);
      uint64_t v53 = sub_1C28FE44C;
      uint64_t v54 = v21;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v50 = 1107296256;
      v51 = sub_1C28FE634;
      uint64_t v52 = &block_descriptor_12;
      uint64_t v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v28, sel_animateWithDuration_animations_, v30, v29);
      swift_release();
      swift_release();
    }
    else
    {
      v26(v48, v5);
      uint64_t v34 = self;
      double v35 = (*(double (**)(uint64_t, uint64_t))(v24 + 24))(v5, v24);
      uint64_t v53 = sub_1C28FE44C;
      uint64_t v54 = v21;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v50 = 1107296256;
      v51 = sub_1C28FE634;
      uint64_t v52 = &block_descriptor;
      uint64_t v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      uint64_t v36 = swift_allocObject();
      uint64_t v37 = v46;
      *(void *)(v36 + 16) = sub_1C28FE5B4;
      *(void *)(v36 + 24) = v37;
      uint64_t v53 = sub_1C28FE6C8;
      uint64_t v54 = v36;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v50 = 1107296256;
      v51 = sub_1C28FE6F0;
      uint64_t v52 = &block_descriptor_9;
      uint64_t v38 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v34, sel_animateWithDuration_animations_completion_, v30, v38, v35);
      swift_release();
      swift_release();
      _Block_release(v38);
    }
    _Block_release(v30);
  }
  else
  {
    uint64_t v31 = (uint64_t)v48;
    sub_1C28FE464((uint64_t)v48, v22, v5, v24);
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v32(v31, v5);
    uint64_t v33 = (uint64_t)v39;
    sub_1C28FE338((uint64_t)v39, v22, v5, v24);
    swift_release();
    swift_release();
    v32(v33, v5);
  }
}

void sub_1C28FE338(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  double v8 = 0.0;
  double v9 = 0.0;
  if (a2) {
    (*(void (**)(uint64_t, uint64_t, double))(a4 + 32))(a3, a4, 0.0);
  }
  objc_msgSend(v7, sel_setAlpha_, v9);

  id v10 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if (a2) {
    double v8 = (*(double (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  }
  objc_msgSend(v10, sel_setAlpha_, v8);
}

uint64_t sub_1C28FE44C()
{
  return sub_1C28FE5CC((uint64_t (*)(unint64_t, void))sub_1C28FE338);
}

void sub_1C28FE464(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  BOOL v8 = (a2 & 1) == 0;
  objc_msgSend(v7, sel_setHidden_, v8);

  id v9 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  objc_msgSend(v9, sel_setHidden_, v8);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  uint64_t v5 = *(void *)(v1 + 64) + v3 + 1;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1C28FE5B4()
{
  return sub_1C28FE5CC((uint64_t (*)(unint64_t, void))sub_1C28FE464);
}

uint64_t sub_1C28FE5CC(uint64_t (*a1)(unint64_t, void))
{
  uint64_t v2 = *(void *)(*(void *)(v1 + 16) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return a1(v1 + v3, *(unsigned __int8 *)(v1 + v3 + *(void *)(v2 + 64)));
}

uint64_t sub_1C28FE634(uint64_t a1)
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

uint64_t sub_1C28FE690()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C28FE6C8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C28FE6F0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void __swiftcall HealthArticleHighlightProviding.makeHighlightedImageOverlay()(UIView *__return_ptr retstr)
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1C28FE844();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_systemBlackColor);
  id v4 = objc_msgSend(v2, sel_systemWhiteColor);
  uint64_t v5 = (void *)sub_1C2920E90();

  objc_msgSend(v1, sel_setBackgroundColor_, v5);
  objc_msgSend(v1, sel_setHidden_, 1);
}

unint64_t sub_1C28FE844()
{
  unint64_t result = qword_1EBB6BB18;
  if (!qword_1EBB6BB18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB6BB18);
  }
  return result;
}

void __swiftcall HealthArticleHighlightProviding.makeHighlightedSashUnderlay(highlightColor:)(UIView *__return_ptr retstr, UIColor highlightColor)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setBackgroundColor_, highlightColor.super.isa);
  objc_msgSend(v3, sel_setHidden_, 1);
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedImageOverlay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedSashUnderlay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedAnimationDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedOverlayAlpha.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.highlightedUnderlayAlpha.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of HealthArticleHighlightProviding.setHighlighted(_:animated:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

void *initializeBufferWithCopyOfBuffer for HealthArticleComponent(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (void *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        uint64_t v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        id v9 = (void *)a2[2];
        a1[2] = v9;
        swift_bridgeObjectRetain();
        id v10 = v9;
        break;
      case 3u:
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        swift_bridgeObjectRetain();
        break;
      case 4u:
      case 5u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        break;
      case 6u:
      case 7u:
        uint64_t v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 8u:
      case 0xAu:
        char v13 = (void *)*a2;
        *a1 = *a2;
        *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
        id v14 = v13;
        break;
      case 9u:
        *a1 = *a2;
        uint64_t v15 = a2[3];
        *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
        a1[3] = v15;
        swift_bridgeObjectRetain();
        swift_retain();
        break;
      case 0xBu:
        unint64_t v16 = (void *)*a2;
        *a1 = *a2;
        id v17 = v16;
        break;
      case 0xDu:
        uint64_t v18 = a2[1];
        *a1 = *a2;
        a1[1] = v18;
        uint64_t v19 = a2[3];
        a1[2] = a2[2];
        a1[3] = v19;
        sub_1C28FF160();
        uint64_t v21 = *(int *)(v20 + 64);
        BOOL v22 = (void *)((char *)a1 + v21);
        uint64_t v23 = (void *)((char *)a2 + v21);
        type metadata accessor for HealthArticleComponent.LinkContent(0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_22;
        }
        goto LABEL_17;
      case 0xEu:
        uint64_t v24 = a2[1];
        *a1 = *a2;
        a1[1] = v24;
        uint64_t v25 = a2[3];
        a1[2] = a2[2];
        a1[3] = v25;
        sub_1C28FF214();
        uint64_t v27 = *(int *)(v26 + 64);
        BOOL v22 = (void *)((char *)a1 + v27);
        uint64_t v23 = (void *)((char *)a2 + v27);
        type metadata accessor for HealthArticleComponent.LinkContent(0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (swift_getEnumCaseMultiPayload() == 1) {
          goto LABEL_17;
        }
        goto LABEL_22;
      case 0xFu:
        uint64_t v28 = a2[1];
        *a1 = *a2;
        a1[1] = v28;
        sub_1C28FF284();
        uint64_t v30 = *(int *)(v29 + 48);
        BOOL v22 = (void *)((char *)a1 + v30);
        uint64_t v23 = (void *)((char *)a2 + v30);
        type metadata accessor for HealthArticleComponent.LinkContent(0);
        swift_bridgeObjectRetain();
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_17:
          uint64_t v31 = v23[1];
          void *v22 = *v23;
          v22[1] = v31;
          swift_retain();
        }
        else
        {
LABEL_22:
          uint64_t v44 = sub_1C2920470();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v44 - 8) + 16))(v22, v23, v44);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 0x10u:
        uint64_t v32 = a2[1];
        *a1 = *a2;
        a1[1] = v32;
        sub_1C28FF2F0();
        uint64_t v34 = *(int *)(v33 + 48);
        double v35 = (char *)a1 + v34;
        uint64_t v36 = (char *)a2 + v34;
        uint64_t v37 = sub_1C29203E0();
        uint64_t v38 = *(void *)(v37 - 8);
        uint64_t v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
        swift_bridgeObjectRetain();
        if (v39(v36, 1, v37))
        {
          sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
          memcpy(v35, v36, *(void *)(*(void *)(v40 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
        }
        break;
      case 0x11u:
        uint64_t v41 = sub_1C2920470();
        uint64_t v42 = *(void *)(v41 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v42 + 48))(a2, 1, v41))
        {
          sub_1C2903C50(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
          memcpy(a1, a2, *(void *)(*(void *)(v43 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v42 + 16))(a1, a2, v41);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(a1, 0, 1, v41);
        }
        sub_1C28FF38C();
        *(void *)((char *)a1 + v45[12]) = *(void *)((char *)a2 + v45[12]);
        uint64_t v46 = v45[16];
        uint64_t v47 = (void *)((char *)a1 + v46);
        v48 = (void *)((char *)a2 + v46);
        uint64_t v50 = *v48;
        uint64_t v49 = v48[1];
        *uint64_t v47 = v50;
        v47[1] = v49;
        uint64_t v51 = v45[20];
        uint64_t v52 = (void *)((char *)a1 + v51);
        uint64_t v53 = (void *)((char *)a2 + v51);
        uint64_t v54 = v53[1];
        *uint64_t v52 = *v53;
        v52[1] = v54;
        uint64_t v55 = v45[24];
        uint64_t v56 = (char *)a1 + v55;
        uint64_t v57 = (char *)a2 + v55;
        v56[8] = v57[8];
        *(void *)uint64_t v56 = *(void *)v57;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_1C28FF160()
{
  if (!qword_1EA31C540)
  {
    sub_1C28FF4E0(255, &qword_1EA31C548);
    type metadata accessor for HealthArticleComponent.LinkContent(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EA31C540);
    }
  }
}

uint64_t type metadata accessor for HealthArticleComponent.LinkContent(uint64_t a1)
{
  return sub_1C2900834(a1, qword_1EBB6B698);
}

void sub_1C28FF214()
{
  if (!qword_1EA31C550)
  {
    type metadata accessor for HealthArticleComponent.LinkContent(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EA31C550);
    }
  }
}

void sub_1C28FF284()
{
  if (!qword_1EA31C558)
  {
    type metadata accessor for HealthArticleComponent.LinkContent(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA31C558);
    }
  }
}

void sub_1C28FF2F0()
{
  if (!qword_1EA31C560)
  {
    sub_1C2903C50(255, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA31C560);
    }
  }
}

void sub_1C28FF38C()
{
  if (!qword_1EA31C578)
  {
    MEMORY[0x1F4188790](0);
    sub_1C2903C50(255, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
    sub_1C28FF4E0(255, &qword_1EA31C548);
    sub_1C28FF4E0(255, &qword_1EA31C580);
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_1EA31C578);
    }
  }
}

void sub_1C28FF4E0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1C2920ED0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void destroy for HealthArticleComponent(uint64_t a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 3u:
    case 4u:
    case 5u:
    case 0xCu:
      goto LABEL_23;
    case 2u:
      swift_bridgeObjectRelease();
      uint64_t v2 = *(void **)(a1 + 16);
      goto LABEL_5;
    case 6u:
    case 7u:
      swift_bridgeObjectRelease();
      goto LABEL_23;
    case 8u:
    case 0xAu:
    case 0xBu:
      uint64_t v2 = *(void **)a1;
LABEL_5:

      return;
    case 9u:
      swift_bridgeObjectRelease();
      goto LABEL_14;
    case 0xDu:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C28FF160();
      goto LABEL_11;
    case 0xEu:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C28FF214();
LABEL_11:
      uint64_t v4 = *(int *)(v3 + 64);
      goto LABEL_13;
    case 0xFu:
      swift_bridgeObjectRelease();
      sub_1C28FF284();
      uint64_t v4 = *(int *)(v5 + 48);
LABEL_13:
      uint64_t v6 = a1 + v4;
      type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_14:
        swift_release();
      }
      else
      {
        uint64_t v7 = sub_1C2920470();
        uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
        uint64_t v9 = v7;
        uint64_t v10 = v6;
LABEL_27:
        v8(v10, v9);
      }
      return;
    case 0x10u:
      swift_bridgeObjectRelease();
      sub_1C28FF2F0();
      uint64_t v12 = a1 + *(int *)(v11 + 48);
      uint64_t v13 = sub_1C29203E0();
      uint64_t v16 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v12, 1, v13)) {
        return;
      }
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      uint64_t v10 = v12;
      uint64_t v9 = v13;
      goto LABEL_27;
    case 0x11u:
      uint64_t v14 = sub_1C2920470();
      uint64_t v15 = *(void *)(v14 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a1, 1, v14)) {
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v14);
      }
      sub_1C28FF38C();
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      return;
    default:
      return;
  }
}

void *initializeWithCopy for HealthArticleComponent(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v5 = a2[1];
      *a1 = *a2;
      a1[1] = v5;
      uint64_t v6 = (void *)a2[2];
      a1[2] = v6;
      swift_bridgeObjectRetain();
      id v7 = v6;
      break;
    case 3u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
      swift_bridgeObjectRetain();
      break;
    case 4u:
    case 5u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
      break;
    case 6u:
    case 7u:
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 8u:
    case 0xAu:
      uint64_t v10 = (void *)*a2;
      *a1 = *a2;
      *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
      id v11 = v10;
      break;
    case 9u:
      *a1 = *a2;
      uint64_t v12 = a2[3];
      *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
      a1[3] = v12;
      swift_bridgeObjectRetain();
      swift_retain();
      break;
    case 0xBu:
      uint64_t v13 = (void *)*a2;
      *a1 = *a2;
      id v14 = v13;
      break;
    case 0xDu:
      uint64_t v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      uint64_t v16 = a2[3];
      a1[2] = a2[2];
      a1[3] = v16;
      sub_1C28FF160();
      uint64_t v18 = *(int *)(v17 + 64);
      uint64_t v19 = (void *)((char *)a1 + v18);
      uint64_t v20 = (void *)((char *)a2 + v18);
      type metadata accessor for HealthArticleComponent.LinkContent(0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_20;
      }
      goto LABEL_15;
    case 0xEu:
      uint64_t v21 = a2[1];
      *a1 = *a2;
      a1[1] = v21;
      uint64_t v22 = a2[3];
      a1[2] = a2[2];
      a1[3] = v22;
      sub_1C28FF214();
      uint64_t v24 = *(int *)(v23 + 64);
      uint64_t v19 = (void *)((char *)a1 + v24);
      uint64_t v20 = (void *)((char *)a2 + v24);
      type metadata accessor for HealthArticleComponent.LinkContent(0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (swift_getEnumCaseMultiPayload() == 1) {
        goto LABEL_15;
      }
      goto LABEL_20;
    case 0xFu:
      uint64_t v25 = a2[1];
      *a1 = *a2;
      a1[1] = v25;
      sub_1C28FF284();
      uint64_t v27 = *(int *)(v26 + 48);
      uint64_t v19 = (void *)((char *)a1 + v27);
      uint64_t v20 = (void *)((char *)a2 + v27);
      type metadata accessor for HealthArticleComponent.LinkContent(0);
      swift_bridgeObjectRetain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_15:
        uint64_t v28 = v20[1];
        *uint64_t v19 = *v20;
        v19[1] = v28;
        swift_retain();
      }
      else
      {
LABEL_20:
        uint64_t v41 = sub_1C2920470();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v41 - 8) + 16))(v19, v20, v41);
      }
      swift_storeEnumTagMultiPayload();
      break;
    case 0x10u:
      uint64_t v29 = a2[1];
      *a1 = *a2;
      a1[1] = v29;
      sub_1C28FF2F0();
      uint64_t v31 = *(int *)(v30 + 48);
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      uint64_t v34 = sub_1C29203E0();
      uint64_t v35 = *(void *)(v34 - 8);
      uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
      swift_bridgeObjectRetain();
      if (v36(v33, 1, v34))
      {
        sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
        memcpy(v32, v33, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      }
      break;
    case 0x11u:
      uint64_t v38 = sub_1C2920470();
      uint64_t v39 = *(void *)(v38 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v39 + 48))(a2, 1, v38))
      {
        sub_1C2903C50(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
        memcpy(a1, a2, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v39 + 16))(a1, a2, v38);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56))(a1, 0, 1, v38);
      }
      sub_1C28FF38C();
      *(void *)((char *)a1 + v42[12]) = *(void *)((char *)a2 + v42[12]);
      uint64_t v43 = v42[16];
      uint64_t v44 = (void *)((char *)a1 + v43);
      BOOL v45 = (void *)((char *)a2 + v43);
      uint64_t v47 = *v45;
      uint64_t v46 = v45[1];
      *uint64_t v44 = v47;
      v44[1] = v46;
      uint64_t v48 = v42[20];
      uint64_t v49 = (void *)((char *)a1 + v48);
      uint64_t v50 = (void *)((char *)a2 + v48);
      uint64_t v51 = v50[1];
      *uint64_t v49 = *v50;
      v49[1] = v51;
      uint64_t v52 = v42[24];
      uint64_t v53 = (char *)a1 + v52;
      uint64_t v54 = (char *)a2 + v52;
      v53[8] = v54[8];
      *(void *)uint64_t v53 = *(void *)v54;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = a2[1];
      *a1 = *a2;
      a1[1] = v4;
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for HealthArticleComponent(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1C29018EC((uint64_t)a1, type metadata accessor for HealthArticleComponent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v4 = (void *)a2[2];
        a1[2] = v4;
        swift_bridgeObjectRetain();
        id v5 = v4;
        break;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        swift_bridgeObjectRetain();
        break;
      case 4u:
      case 5u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        break;
      case 6u:
      case 7u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 8u:
      case 0xAu:
        uint64_t v6 = (void *)*a2;
        *a1 = *a2;
        *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
        id v7 = v6;
        break;
      case 9u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v8 = a2[2];
        uint64_t v9 = a2[3];
        a1[2] = v8;
        a1[3] = v9;
        swift_bridgeObjectRetain();
        swift_retain();
        break;
      case 0xBu:
        uint64_t v10 = (void *)*a2;
        *a1 = *a2;
        id v11 = v10;
        break;
      case 0xDu:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        sub_1C28FF160();
        uint64_t v13 = *(int *)(v12 + 64);
        id v14 = (void *)((char *)a1 + v13);
        uint64_t v15 = (void *)((char *)a2 + v13);
        type metadata accessor for HealthArticleComponent.LinkContent(0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_21;
        }
        goto LABEL_16;
      case 0xEu:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        sub_1C28FF214();
        uint64_t v17 = *(int *)(v16 + 64);
        id v14 = (void *)((char *)a1 + v17);
        uint64_t v15 = (void *)((char *)a2 + v17);
        type metadata accessor for HealthArticleComponent.LinkContent(0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (swift_getEnumCaseMultiPayload() == 1) {
          goto LABEL_16;
        }
        goto LABEL_21;
      case 0xFu:
        *a1 = *a2;
        a1[1] = a2[1];
        sub_1C28FF284();
        uint64_t v19 = *(int *)(v18 + 48);
        id v14 = (void *)((char *)a1 + v19);
        uint64_t v15 = (void *)((char *)a2 + v19);
        type metadata accessor for HealthArticleComponent.LinkContent(0);
        swift_bridgeObjectRetain();
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_16:
          uint64_t v20 = v15[1];
          *id v14 = *v15;
          v14[1] = v20;
          swift_retain();
        }
        else
        {
LABEL_21:
          uint64_t v32 = sub_1C2920470();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v14, v15, v32);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 0x10u:
        *a1 = *a2;
        a1[1] = a2[1];
        sub_1C28FF2F0();
        uint64_t v22 = *(int *)(v21 + 48);
        uint64_t v23 = (char *)a1 + v22;
        uint64_t v24 = (char *)a2 + v22;
        uint64_t v25 = sub_1C29203E0();
        uint64_t v26 = *(void *)(v25 - 8);
        uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
        swift_bridgeObjectRetain();
        if (v27(v24, 1, v25))
        {
          sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
          memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
        }
        break;
      case 0x11u:
        uint64_t v29 = sub_1C2920470();
        uint64_t v30 = *(void *)(v29 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v30 + 48))(a2, 1, v29))
        {
          sub_1C2903C50(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
          memcpy(a1, a2, *(void *)(*(void *)(v31 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v30 + 16))(a1, a2, v29);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(a1, 0, 1, v29);
        }
        sub_1C28FF38C();
        *(void *)((char *)a1 + v33[12]) = *(void *)((char *)a2 + v33[12]);
        uint64_t v34 = v33[16];
        uint64_t v35 = (void *)((char *)a1 + v34);
        uint64_t v36 = (void *)((char *)a2 + v34);
        void *v35 = *v36;
        v35[1] = v36[1];
        uint64_t v37 = v33[20];
        uint64_t v38 = (void *)((char *)a1 + v37);
        uint64_t v39 = (void *)((char *)a2 + v37);
        *uint64_t v38 = *v39;
        v38[1] = v39[1];
        uint64_t v40 = v33[24];
        uint64_t v41 = (char *)a1 + v40;
        uint64_t v42 = (char *)a2 + v40;
        char v43 = v42[8];
        *(void *)uint64_t v41 = *(void *)v42;
        v41[8] = v43;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for HealthArticleComponent(uint64_t a1)
{
  return sub_1C2900834(a1, (uint64_t *)&unk_1EA31C588);
}

uint64_t sub_1C2900834(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

_OWORD *initializeWithTake for HealthArticleComponent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0xDu:
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      sub_1C28FF160();
      uint64_t v8 = *(int *)(v7 + 64);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (!swift_getEnumCaseMultiPayload()) {
        goto LABEL_13;
      }
      goto LABEL_8;
    case 0xEu:
      long long v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      sub_1C28FF214();
      uint64_t v14 = *(int *)(v13 + 64);
      uint64_t v9 = (char *)a1 + v14;
      uint64_t v10 = (char *)a2 + v14;
      uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_8;
      }
      goto LABEL_13;
    case 0xFu:
      *a1 = *a2;
      sub_1C28FF284();
      uint64_t v16 = *(int *)(v15 + 48);
      uint64_t v9 = (char *)a1 + v16;
      uint64_t v10 = (char *)a2 + v16;
      uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_8:
        memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
LABEL_13:
        uint64_t v27 = sub_1C2920470();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v9, v10, v27);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_17;
    case 0x10u:
      *a1 = *a2;
      sub_1C28FF2F0();
      uint64_t v18 = *(int *)(v17 + 48);
      uint64_t v19 = (char *)a1 + v18;
      uint64_t v20 = (char *)a2 + v18;
      uint64_t v21 = sub_1C29203E0();
      uint64_t v22 = *(void *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
        memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
      goto LABEL_17;
    case 0x11u:
      uint64_t v24 = sub_1C2920470();
      uint64_t v25 = *(void *)(v24 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v25 + 48))(a2, 1, v24))
      {
        sub_1C2903C50(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
        memcpy(a1, a2, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v25 + 32))(a1, a2, v24);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v25 + 56))(a1, 0, 1, v24);
      }
      sub_1C28FF38C();
      *(void *)((char *)a1 + v28[12]) = *(void *)((char *)a2 + v28[12]);
      *(_OWORD *)((char *)a1 + v28[16]) = *(_OWORD *)((char *)a2 + v28[16]);
      *(_OWORD *)((char *)a1 + v28[20]) = *(_OWORD *)((char *)a2 + v28[20]);
      uint64_t v29 = v28[24];
      uint64_t v30 = (char *)a1 + v29;
      uint64_t v31 = (char *)a2 + v29;
      *(void *)uint64_t v30 = *(void *)v31;
      v30[8] = v31[8];
LABEL_17:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *assignWithTake for HealthArticleComponent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1C29018EC((uint64_t)a1, type metadata accessor for HealthArticleComponent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0xDu:
        long long v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        sub_1C28FF160();
        uint64_t v8 = *(int *)(v7 + 64);
        uint64_t v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
        if (!swift_getEnumCaseMultiPayload()) {
          goto LABEL_14;
        }
        goto LABEL_9;
      case 0xEu:
        long long v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        sub_1C28FF214();
        uint64_t v14 = *(int *)(v13 + 64);
        uint64_t v9 = (char *)a1 + v14;
        uint64_t v10 = (char *)a2 + v14;
        uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
        if (swift_getEnumCaseMultiPayload()) {
          goto LABEL_9;
        }
        goto LABEL_14;
      case 0xFu:
        *a1 = *a2;
        sub_1C28FF284();
        uint64_t v16 = *(int *)(v15 + 48);
        uint64_t v9 = (char *)a1 + v16;
        uint64_t v10 = (char *)a2 + v16;
        uint64_t v11 = type metadata accessor for HealthArticleComponent.LinkContent(0);
        if (swift_getEnumCaseMultiPayload())
        {
LABEL_9:
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
LABEL_14:
          uint64_t v27 = sub_1C2920470();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v9, v10, v27);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_18;
      case 0x10u:
        *a1 = *a2;
        sub_1C28FF2F0();
        uint64_t v18 = *(int *)(v17 + 48);
        uint64_t v19 = (char *)a1 + v18;
        uint64_t v20 = (char *)a2 + v18;
        uint64_t v21 = sub_1C29203E0();
        uint64_t v22 = *(void *)(v21 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
        {
          sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
          memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
        }
        goto LABEL_18;
      case 0x11u:
        uint64_t v24 = sub_1C2920470();
        uint64_t v25 = *(void *)(v24 - 8);
        if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v25 + 48))(a2, 1, v24))
        {
          sub_1C2903C50(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
          memcpy(a1, a2, *(void *)(*(void *)(v26 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v25 + 32))(a1, a2, v24);
          (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v25 + 56))(a1, 0, 1, v24);
        }
        sub_1C28FF38C();
        *(void *)((char *)a1 + v28[12]) = *(void *)((char *)a2 + v28[12]);
        *(_OWORD *)((char *)a1 + v28[16]) = *(_OWORD *)((char *)a2 + v28[16]);
        *(_OWORD *)((char *)a1 + v28[20]) = *(_OWORD *)((char *)a2 + v28[20]);
        uint64_t v29 = v28[24];
        uint64_t v30 = (char *)a1 + v29;
        uint64_t v31 = (char *)a2 + v29;
        *(void *)uint64_t v30 = *(void *)v31;
        v30[8] = v31[8];
LABEL_18:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1C2901354()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1C2901364()
{
  uint64_t v10 = &unk_1C2922570;
  uint64_t v11 = &unk_1C2922588;
  uint64_t v8 = &unk_1C2922558;
  uint64_t v9 = &unk_1C2922558;
  uint64_t v12 = MEMORY[0x1E4FBAD80] + 64;
  uint64_t v13 = MEMORY[0x1E4FBAD80] + 64;
  uint64_t v14 = &unk_1C2922570;
  uint64_t v15 = &unk_1C2922570;
  uint64_t v16 = &unk_1C29225A0;
  uint64_t v17 = &unk_1C29225B8;
  uint64_t v18 = &unk_1C29225A0;
  uint64_t v19 = MEMORY[0x1E4FBAD78] + 64;
  uint64_t v20 = &unk_1C2922558;
  type metadata accessor for HealthArticleComponent.LinkContent(319);
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    uint64_t v21 = &v7;
    swift_getTupleTypeLayout3();
    uint64_t v22 = &v6;
    swift_getTupleTypeLayout2();
    uint64_t v23 = &v5;
    sub_1C2903C50(319, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
    if (v1 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v24 = &v4;
      sub_1C2903C50(319, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
      if (v2 <= 0x3F)
      {
        swift_getTupleTypeLayout();
        uint64_t v25 = &v3;
        swift_initEnumMetadataMultiPayload();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for HealthArticleComponent.LinkContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_retain();
    }
    else
    {
      uint64_t v8 = sub_1C2920470();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HealthArticleComponent.LinkContent(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_release();
  }
  else
  {
    uint64_t v3 = sub_1C2920470();
    char v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
}

void *initializeWithCopy for HealthArticleComponent.LinkContent(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    uint64_t v5 = sub_1C2920470();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for HealthArticleComponent.LinkContent(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1C29018EC((uint64_t)a1, type metadata accessor for HealthArticleComponent.LinkContent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = a2[1];
      *a1 = *a2;
      a1[1] = v4;
      swift_retain();
    }
    else
    {
      uint64_t v5 = sub_1C2920470();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1C29018EC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeWithTake for HealthArticleComponent.LinkContent(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_1C2920470();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for HealthArticleComponent.LinkContent(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1C29018EC((uint64_t)a1, type metadata accessor for HealthArticleComponent.LinkContent);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_1C2920470();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s16HealthArticlesUI22HealthArticleComponentOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t _s16HealthArticlesUI22HealthArticleComponentOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1C2901B28()
{
  uint64_t result = sub_1C2920470();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

id sub_1C2901BBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HealthArticleComponent(0);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2903980(v1, (uint64_t)v4);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      swift_bridgeObjectRelease();
      type metadata accessor for TitleView();
      goto LABEL_20;
    case 2u:
      uint64_t v5 = (void *)*((void *)v4 + 2);
      swift_bridgeObjectRelease();

      type metadata accessor for SectionHeaderView();
      goto LABEL_20;
    case 3u:
      int v16 = v4[16];
      swift_bridgeObjectRelease();
      if (v16 != 1) {
        goto LABEL_7;
      }
      type metadata accessor for LastParagraphInSectionView();
      goto LABEL_20;
    case 4u:
    case 5u:
    case 0xCu:
      goto LABEL_6;
    case 6u:
    case 7u:
      swift_bridgeObjectRelease();
LABEL_6:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 8u:

      type metadata accessor for ImageView();
      goto LABEL_20;
    case 9u:
      swift_release();
      swift_bridgeObjectRelease();
      type metadata accessor for ButtonView();
      goto LABEL_20;
    case 0xAu:

      type metadata accessor for CustomContentView();
      goto LABEL_20;
    case 0xBu:

      type metadata accessor for CustomContentViewControllerView();
      goto LABEL_20;
    case 0xDu:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C28FF160();
      goto LABEL_18;
    case 0xEu:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C28FF214();
LABEL_18:
      uint64_t v8 = (int *)(v6 + 64);
      goto LABEL_19;
    case 0xFu:
      swift_bridgeObjectRelease();
      sub_1C28FF284();
      uint64_t v8 = (int *)(v7 + 48);
LABEL_19:
      sub_1C29018EC((uint64_t)&v4[*v8], type metadata accessor for HealthArticleComponent.LinkContent);
      type metadata accessor for LinkedTextView();
      goto LABEL_20;
    case 0x10u:
      swift_bridgeObjectRelease();
      sub_1C28FF2F0();
      sub_1C29039E4((uint64_t)&v4[*(int *)(v9 + 48)], &qword_1EA31C568, MEMORY[0x1E4F27318]);
LABEL_7:
      type metadata accessor for ParagraphView();
LABEL_20:
      id v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      break;
    case 0x11u:
      sub_1C28FF38C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for VideoView();
      id v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      sub_1C29039E4((uint64_t)v4, &qword_1EA31C570, MEMORY[0x1E4F276F0]);
      break;
    default:
      swift_bridgeObjectRelease();
      type metadata accessor for TitleView();
      id v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      uint64_t v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      id v11 = v10;
      sub_1C2920FC0();
      uint64_t v12 = sub_1C2920BE0();
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      uint64_t v18 = v12;
      unint64_t v19 = v14;
      sub_1C2920C50();
      uint64_t v15 = (void *)sub_1C2920BB0();
      swift_bridgeObjectRelease();
      objc_msgSend(v11, sel_setAccessibilityIdentifier_, v15);

      break;
  }
  return v11;
}

void sub_1C2901FF8(uint64_t a1)
{
  uint64_t v181 = a1;
  uint64_t v173 = sub_1C29206F0();
  uint64_t v172 = *(void *)(v173 - 8);
  MEMORY[0x1F4188790](v173);
  v178 = (char *)&v152 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_1C29203A0();
  uint64_t v155 = *(void *)(v156 - 8);
  MEMORY[0x1F4188790](v156);
  v154 = (char *)&v152 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1C2903C50(0, &qword_1EA31C598, MEMORY[0x1E4F27410], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v158 = (uint64_t)&v152 - v5;
  uint64_t v160 = sub_1C2920420();
  uint64_t v159 = *(void *)(v160 - 8);
  MEMORY[0x1F4188790](v160);
  v153 = (char *)&v152 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_1C29203B0();
  uint64_t v167 = *(void *)(v169 - 8);
  MEMORY[0x1F4188790](v169);
  v168 = (char *)&v152 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = sub_1C29203C0();
  uint64_t v164 = *(void *)(v165 - 8);
  MEMORY[0x1F4188790](v165);
  v166 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2903C50(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], v3);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v177 = (uint64_t)&v152 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  v163 = (char *)&v152 - v13;
  MEMORY[0x1F4188790](v12);
  v162 = (char *)&v152 - v14;
  uint64_t v176 = sub_1C29203E0();
  uint64_t v175 = *(void *)(v176 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v176);
  v161 = (char *)&v152 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  unint64_t v19 = (char *)&v152 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v152 - v20;
  uint64_t v170 = sub_1C2920400();
  uint64_t v174 = *(void *)(v170 - 8);
  uint64_t v22 = MEMORY[0x1F4188790](v170);
  v157 = (char *)&v152 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v152 - v25;
  uint64_t v27 = MEMORY[0x1F4188790](v24);
  uint64_t v29 = (char *)&v152 - v28;
  MEMORY[0x1F4188790](v27);
  v171 = (char *)&v152 - v30;
  sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], v3);
  uint64_t v32 = MEMORY[0x1F4188790](v31 - 8);
  uint64_t v34 = (char *)&v152 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v32);
  uint64_t v179 = (uint64_t)&v152 - v35;
  uint64_t v36 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  uint64_t v37 = MEMORY[0x1F4188790](v36 - 8);
  uint64_t v39 = (char *)&v152 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x1F4188790](v37);
  uint64_t v42 = (char *)&v152 - v41;
  MEMORY[0x1F4188790](v40);
  uint64_t v44 = (char *)&v152 - v43;
  uint64_t v45 = type metadata accessor for HealthArticleComponent(0);
  MEMORY[0x1F4188790](v45);
  uint64_t v47 = (char *)&v152 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2903980(v180, (uint64_t)v47);
  uint64_t v180 = v45;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v48 = *((void *)v47 + 1);
      type metadata accessor for TitleView();
      if (!swift_dynamicCastClass()) {
        goto LABEL_57;
      }
      uint64_t v49 = *(void *)v47;
      *(void *)&long long v183 = 1;
      goto LABEL_6;
    case 2u:
      uint64_t v51 = *((void *)v47 + 1);
      uint64_t v50 = (void *)*((void *)v47 + 2);
      type metadata accessor for SectionHeaderView();
      if (swift_dynamicCastClass())
      {
        uint64_t v52 = *(void *)v47;
        *(void *)&long long v183 = 2;
        sub_1C28FAA94(v52, v51, v50, (unint64_t *)&v183);
      }
      swift_bridgeObjectRelease();

      return;
    case 3u:
      uint64_t v53 = *((void *)v47 + 1);
      type metadata accessor for ParagraphView();
      if (!swift_dynamicCastClass()) {
        goto LABEL_57;
      }
      uint64_t v54 = *(void *)v47;
      uint64_t v55 = 3;
      goto LABEL_37;
    case 4u:
      uint64_t v56 = *(void *)v47;
      type metadata accessor for ParagraphView();
      uint64_t v57 = swift_dynamicCastClass();
      if (!v57) {
        goto LABEL_57;
      }
      uint64_t v58 = (void *)v57;
      unint64_t v59 = sub_1C2903BFC();
      id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_init);
      *(void *)&long long v183 = v60;
      uint64_t v61 = *(void *)(v56 + 16);
      if (v61)
      {
        swift_bridgeObjectRetain();
        uint64_t v62 = 0;
        v63 = (uint64_t *)(v56 + 40);
        do
        {
          uint64_t v64 = *(v63 - 1);
          uint64_t v65 = *v63;
          swift_bridgeObjectRetain();
          sub_1C29041C0(v62, v64, v65, v59, v56, (id *)&v183);
          swift_bridgeObjectRelease();
          v63 += 2;
          ++v62;
        }
        while (v61 != v62);
        swift_bridgeObjectRelease();
      }
      goto LABEL_19;
    case 5u:
      uint64_t v66 = *(void *)v47;
      type metadata accessor for ParagraphView();
      uint64_t v67 = swift_dynamicCastClass();
      if (!v67) {
        goto LABEL_57;
      }
      uint64_t v58 = (void *)v67;
      id v60 = sub_1C29057F0(0, 0, v66);
LABEL_19:
      swift_bridgeObjectRelease();
      id v68 = sub_1C290ECF8();
      objc_msgSend(v68, sel_setAttributedText_, v60);

      objc_msgSend(v58, sel_setNeedsLayout);
      return;
    case 6u:
      uint64_t v69 = *((void *)v47 + 1);
      uint64_t v70 = *((void *)v47 + 2);
      type metadata accessor for ParagraphView();
      uint64_t v71 = swift_dynamicCastClass();
      if (!v71) {
        goto LABEL_56;
      }
      v72 = (void *)v71;
      uint64_t v73 = *(void *)v47;
      sub_1C2903BFC();
      id v74 = sub_1C2903FC8(v73, v69, v70);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v75 = sub_1C290ECF8();
      objc_msgSend(v75, sel_setAttributedText_, v74);

      objc_msgSend(v72, sel_setNeedsLayout);
      goto LABEL_24;
    case 7u:
      uint64_t v76 = *((void *)v47 + 1);
      uint64_t v77 = *((void *)v47 + 2);
      type metadata accessor for ParagraphView();
      uint64_t v78 = swift_dynamicCastClass();
      if (!v78) {
        goto LABEL_56;
      }
      v79 = (void *)v78;
      id v74 = sub_1C29057F0(*(void *)v47, v76, v77);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v80 = sub_1C290ECF8();
      objc_msgSend(v80, sel_setAttributedText_, v74);

      objc_msgSend(v79, sel_setNeedsLayout);
      goto LABEL_24;
    case 8u:
      v81 = *(void **)v47;
      type metadata accessor for ImageView();
      if (swift_dynamicCastClass()) {
        sub_1C290E938((uint64_t)v81, v47[8]);
      }
      goto LABEL_31;
    case 9u:
      uint64_t v82 = *((void *)v47 + 3);
      type metadata accessor for ButtonView();
      uint64_t v83 = swift_dynamicCastClass();
      if (v83)
      {
        v84 = (char *)v83;
        v85 = (void *)(v83 + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
        uint64_t v86 = *(void *)(v83 + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
        void *v85 = *((void *)v47 + 2);
        v85[1] = v82;
        swift_retain();
        sub_1C2903C40(v86);
        sub_1C2903C50(0, (unint64_t *)&qword_1EA31C5C0, (uint64_t (*)(uint64_t))sub_1C2903CB4, MEMORY[0x1E4FBBE00]);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1C2922520;
        v88 = (void *)*MEMORY[0x1E4FB06F8];
        *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
        v89 = self;
        uint64_t v90 = *MEMORY[0x1E4FB28C8];
        swift_bridgeObjectRetain();
        id v91 = v88;
        id v92 = objc_msgSend(v89, sel_preferredFontForTextStyle_, v90);
        v93 = (void *)*MEMORY[0x1E4FB0700];
        *(void *)(inited + 40) = v92;
        *(void *)(inited + 48) = v93;
        v94 = self;
        id v95 = v93;
        *(void *)(inited + 56) = objc_msgSend(v94, sel_whiteColor);
        unint64_t v96 = sub_1C2910C10(inited);
        sub_1C29100E8(v96);
        swift_bridgeObjectRelease();
        id v97 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
        v98 = (void *)sub_1C2920BB0();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_1C2903D20((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
        v99 = (void *)sub_1C2920B70();
        swift_bridgeObjectRelease();
        id v100 = objc_msgSend(v97, sel_initWithString_attributes_, v98, v99);

        objc_msgSend(*(id *)&v84[OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button], sel_setAttributedTitle_forState_, v100, 0);
        objc_msgSend(v84, sel_setNeedsLayout);
        swift_bridgeObjectRelease();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_release();
      }
      return;
    case 0xAu:
      v81 = *(void **)v47;
      type metadata accessor for CustomContentView();
      if (swift_dynamicCastClass()) {
        sub_1C2919B38(v81, v47[8]);
      }
LABEL_31:

      return;
    case 0xBu:
      id v74 = *(id *)v47;
      type metadata accessor for CustomContentViewControllerView();
      if (swift_dynamicCastClass()) {
        sub_1C2919E64(v74);
      }
LABEL_24:

      return;
    case 0xCu:
      uint64_t v53 = *((void *)v47 + 1);
      type metadata accessor for ParagraphView();
      if (swift_dynamicCastClass())
      {
        uint64_t v54 = *(void *)v47;
        uint64_t v55 = 5;
LABEL_37:
        *(void *)&long long v183 = v55;
        sub_1C290EDE8(v54, v53, (unint64_t *)&v183);
      }
      goto LABEL_57;
    case 0xDu:
      uint64_t v102 = *(void *)v47;
      uint64_t v101 = *((void *)v47 + 1);
      uint64_t v103 = *((void *)v47 + 2);
      uint64_t v104 = *((void *)v47 + 3);
      sub_1C28FF160();
      sub_1C28FD7DC((uint64_t)&v47[*(int *)(v105 + 64)], (uint64_t)v44);
      type metadata accessor for LinkedTextView();
      if (swift_dynamicCastClass())
      {
        *(void *)&long long v183 = v102;
        *((void *)&v183 + 1) = v101;
        uint64_t v184 = 0;
        uint64_t v185 = 0;
        char v186 = 0;
        uint64_t v182 = 3;
        sub_1C28FC2C0(&v183, &v182, v103, v104, (uint64_t)v44);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C29018EC((uint64_t)v44, type metadata accessor for HealthArticleComponent.LinkContent);
        return;
      }
      sub_1C29018EC((uint64_t)v44, type metadata accessor for HealthArticleComponent.LinkContent);
      goto LABEL_56;
    case 0xEu:
      uint64_t v107 = *(void *)v47;
      uint64_t v106 = *((void *)v47 + 1);
      uint64_t v109 = *((void *)v47 + 2);
      uint64_t v108 = *((void *)v47 + 3);
      sub_1C28FF214();
      sub_1C28FD7DC((uint64_t)&v47[*(int *)(v110 + 64)], (uint64_t)v42);
      type metadata accessor for LinkedTextView();
      if (swift_dynamicCastClass())
      {
        *(void *)&long long v183 = v109;
        *((void *)&v183 + 1) = v108;
        uint64_t v184 = v107;
        uint64_t v185 = v106;
        char v186 = 2;
        uint64_t v182 = 3;
        sub_1C28FC2C0(&v183, &v182, 0, 0, (uint64_t)v42);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C29018EC((uint64_t)v42, type metadata accessor for HealthArticleComponent.LinkContent);
        return;
      }
      sub_1C29018EC((uint64_t)v42, type metadata accessor for HealthArticleComponent.LinkContent);
      goto LABEL_56;
    case 0xFu:
      uint64_t v112 = *(void *)v47;
      uint64_t v111 = *((void *)v47 + 1);
      sub_1C28FF284();
      sub_1C28FD7DC((uint64_t)&v47[*(int *)(v113 + 48)], (uint64_t)v39);
      type metadata accessor for LinkedTextView();
      if (swift_dynamicCastClass())
      {
        *(void *)&long long v183 = v112;
        *((void *)&v183 + 1) = v111;
        uint64_t v184 = 0;
        uint64_t v185 = 0;
        char v186 = 1;
        uint64_t v182 = 3;
        sub_1C28FC2C0(&v183, &v182, 0, 0, (uint64_t)v39);
        swift_bridgeObjectRelease();
        sub_1C29018EC((uint64_t)v39, type metadata accessor for HealthArticleComponent.LinkContent);
        return;
      }
      sub_1C29018EC((uint64_t)v39, type metadata accessor for HealthArticleComponent.LinkContent);
      goto LABEL_57;
    case 0x10u:
      uint64_t v114 = *(void *)v47;
      sub_1C28FF2F0();
      uint64_t v116 = (uint64_t)&v47[*(int *)(v115 + 48)];
      uint64_t v117 = v179;
      sub_1C2903A54(v116, v179, &qword_1EA31C568, MEMORY[0x1E4F27318]);
      sub_1C2903AD4(v117, (uint64_t)v34);
      uint64_t v118 = v175;
      uint64_t v119 = v176;
      int v120 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v175 + 48))(v34, 1, v176);
      uint64_t v177 = v114;
      if (v120 == 1)
      {
        sub_1C29039E4((uint64_t)v34, &qword_1EA31C568, MEMORY[0x1E4F27318]);
        uint64_t v121 = sub_1C2920470();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56))(v163, 1, 1, v121);
        (*(void (**)(char *, void, uint64_t))(v164 + 104))(v166, *MEMORY[0x1E4F27310], v165);
        (*(void (**)(char *, void, uint64_t))(v167 + 104))(v168, *MEMORY[0x1E4F272E8], v169);
        swift_bridgeObjectRetain();
        sub_1C29203D0();
        sub_1C29203F0();
        uint64_t v122 = v174;
        uint64_t v29 = v26;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v118 + 32))(v21, v34, v119);
        (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v19, v21, v119);
        uint64_t v136 = sub_1C2920470();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v136 - 8) + 56))(v162, 1, 1, v136);
        swift_bridgeObjectRetain();
        sub_1C29203F0();
        (*(void (**)(char *, uint64_t))(v118 + 8))(v21, v119);
        uint64_t v122 = v174;
      }
      uint64_t v137 = v170;
      (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v171, v29, v170);
      *(void *)&long long v183 = 3;
      uint64_t v138 = v158;
      HealthArticleTextAttributes.attributeContainer.getter(v158);
      uint64_t v139 = v159;
      uint64_t v140 = v160;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v138, 1, v160) == 1)
      {
        sub_1C29039E4(v138, &qword_1EA31C598, MEMORY[0x1E4F27410]);
      }
      else
      {
        v141 = v153;
        (*(void (**)(char *, uint64_t, uint64_t))(v139 + 32))(v153, v138, v140);
        uint64_t v142 = v155;
        v143 = v154;
        uint64_t v144 = v139;
        uint64_t v145 = v156;
        (*(void (**)(char *, void, uint64_t))(v155 + 104))(v154, *MEMORY[0x1E4F272C8], v156);
        sub_1C2920390();
        (*(void (**)(char *, uint64_t))(v142 + 8))(v143, v145);
        v146 = v141;
        uint64_t v137 = v170;
        (*(void (**)(char *, uint64_t))(v144 + 8))(v146, v140);
        uint64_t v122 = v174;
      }
      type metadata accessor for ParagraphView();
      uint64_t v147 = swift_dynamicCastClass();
      if (v147)
      {
        v148 = (void *)v147;
        sub_1C2903BFC();
        v149 = v171;
        (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v157, v171, v137);
        swift_getKeyPath();
        sub_1C2920370();
        sub_1C2903D20(&qword_1EA31C5B8, MEMORY[0x1E4FB0D88]);
        v150 = (void *)sub_1C2920E50();
        swift_bridgeObjectRelease();
        id v151 = sub_1C290ECF8();
        objc_msgSend(v151, sel_setAttributedText_, v150);

        objc_msgSend(v148, sel_setNeedsLayout);
      }
      else
      {
        swift_bridgeObjectRelease();
        v149 = v171;
      }
      (*(void (**)(char *, uint64_t))(v122 + 8))(v149, v137);
      sub_1C29039E4(v179, &qword_1EA31C568, MEMORY[0x1E4F27318]);
      return;
    case 0x11u:
      sub_1C28FF38C();
      uint64_t v124 = *(void *)&v47[v123[12]];
      v125 = (uint64_t *)&v47[v123[16]];
      uint64_t v126 = *v125;
      uint64_t v127 = v125[1];
      v128 = (uint64_t *)&v47[v123[20]];
      uint64_t v130 = *v128;
      uint64_t v129 = v128[1];
      v131 = &v47[v123[24]];
      uint64_t v132 = *(void *)v131;
      int v133 = v131[8];
      uint64_t v134 = (uint64_t)v47;
      uint64_t v135 = v177;
      sub_1C2903A54(v134, v177, &qword_1EA31C570, MEMORY[0x1E4F276F0]);
      type metadata accessor for VideoView();
      if (swift_dynamicCastClass())
      {
        *(void *)&long long v183 = v124;
        sub_1C291A644(v135, (uint64_t *)&v183, v126, v127, v130, v129, v132, v133);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C29039E4(v135, &qword_1EA31C570, MEMORY[0x1E4F276F0]);
      }
      else
      {
        sub_1C29039E4(v135, &qword_1EA31C570, MEMORY[0x1E4F276F0]);
LABEL_56:
        swift_bridgeObjectRelease();
LABEL_57:
        swift_bridgeObjectRelease();
      }
      return;
    default:
      uint64_t v48 = *((void *)v47 + 1);
      type metadata accessor for TitleView();
      if (swift_dynamicCastClass())
      {
        uint64_t v49 = *(void *)v47;
        *(void *)&long long v183 = 0;
LABEL_6:
        sub_1C28FAA94(v49, v48, 0, (unint64_t *)&v183);
      }
      goto LABEL_57;
  }
}

uint64_t sub_1C2903980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HealthArticleComponent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C29039E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C2903C50(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C2903A54(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1C2903C50(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_1C2903AD4(uint64_t a1, uint64_t a2)
{
  sub_1C2903C50(0, &qword_1EA31C568, MEMORY[0x1E4F27318], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C2903B68()
{
  unint64_t result = qword_1EA31C5A0;
  if (!qword_1EA31C5A0)
  {
    type metadata accessor for HealthArticleComponent(255);
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C5A0);
  }
  return result;
}

unint64_t sub_1C2903BA4()
{
  unint64_t result = qword_1EA31C5A8;
  if (!qword_1EA31C5A8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C5A8);
  }
  return result;
}

unint64_t sub_1C2903BFC()
{
  unint64_t result = qword_1EA31C5B0;
  if (!qword_1EA31C5B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C5B0);
  }
  return result;
}

uint64_t sub_1C2903C40(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_1C2903C50(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1C2903CB4()
{
  if (!qword_1EA31C5C8)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA31C5C8);
    }
  }
}

uint64_t sub_1C2903D20(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_1C2903D68()
{
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return 6.0;
}

id sub_1C2903DE0()
{
  return sub_1C2903F6C(type metadata accessor for ParagraphView);
}

uint64_t type metadata accessor for ParagraphView()
{
  return self;
}

double sub_1C2903E1C()
{
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return 6.0;
}

id sub_1C2903E7C(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t (*a7)(void))
{
  v12.receiver = a1;
  v12.super_class = (Class)a7();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, a2, a3, a4, a5);
}

id sub_1C2903F08(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithCoder_, a3);
}

id sub_1C2903F54()
{
  return sub_1C2903F6C(type metadata accessor for LastParagraphInSectionView);
}

id sub_1C2903F6C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for LastParagraphInSectionView()
{
  return self;
}

id sub_1C2903FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_init);
  id v19 = v7;
  uint64_t v8 = *(void *)(a3 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = 0;
    uint64_t v10 = (uint64_t *)(a3 + 40);
    do
    {
      uint64_t v11 = *(v10 - 1);
      uint64_t v12 = *v10;
      swift_bridgeObjectRetain();
      sub_1C29041C0(v9, v11, v12, v4, a3, &v19);
      swift_bridgeObjectRelease();
      v10 += 2;
      ++v9;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1C2920C50();
    unint64_t v13 = sub_1C290530C(0);
    sub_1C29100E8(v13);
    swift_bridgeObjectRelease();
    id v14 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    uint64_t v15 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1C2906094((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
    uint64_t v16 = (void *)sub_1C2920B70();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v14, sel_initWithString_attributes_, v15, v16);

    objc_msgSend(v17, sel_appendAttributedString_, v7);
    return v17;
  }
  return v7;
}

void sub_1C29041C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, id *a6)
{
  uint64_t v35 = a6;
  uint64_t v36 = a5;
  uint64_t v37 = a4;
  uint64_t v9 = MEMORY[0x1E4F27A78];
  uint64_t v10 = MEMORY[0x1E4FBB718];
  sub_1C2905F94(0, &qword_1EA31C5D0, MEMORY[0x1E4F27A78], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v11 - 8);
  unint64_t v13 = (char *)&v34 - v12;
  uint64_t v14 = sub_1C2905038(a1, a2, a3);
  uint64_t v16 = v15;
  uint64_t v46 = v14;
  uint64_t v47 = v15;
  uint64_t aBlock = v14;
  uint64_t v39 = v15;
  uint64_t v44 = a2;
  uint64_t v45 = a3;
  uint64_t v17 = sub_1C29204A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
  sub_1C2905214();
  swift_bridgeObjectRetain();
  sub_1C2920F50();
  LOBYTE(a3) = v18;
  sub_1C2905268((uint64_t)v13, (uint64_t)&qword_1EA31C5D0, v9, v10, (uint64_t (*)(void))sub_1C2905F94);
  if (a3)
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = 0;
    unint64_t v19 = 0xE000000000000000;
  }
  else
  {
    uint64_t aBlock = v14;
    uint64_t v39 = v16;
    sub_1C2920C10();
    uint64_t v20 = aBlock;
    unint64_t v19 = v39;
  }
  uint64_t v21 = (void *)swift_allocObject();
  uint64_t v22 = v37;
  v21[2] = v37;
  v21[3] = v20;
  v21[4] = v19;
  swift_bridgeObjectRetain();
  unint64_t v23 = sub_1C290530C((double (*)(unint64_t))sub_1C2905300);
  swift_release();
  if (*(void *)(v36 + 16) - 1 > a1) {
    sub_1C2920C50();
  }
  sub_1C29100E8(v23);
  swift_bridgeObjectRelease();
  id v24 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  uint64_t v25 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1C2906094((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
  uint64_t v26 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  uint64_t v28 = sub_1C2920C40();
  swift_bridgeObjectRelease();
  uint64_t v29 = *MEMORY[0x1E4FB06F8];
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v22;
  *(void *)(v30 + 24) = v27;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_1C2905554;
  *(void *)(v31 + 24) = v30;
  uint64_t v42 = sub_1C290556C;
  uint64_t v43 = v31;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v39 = 1107296256;
  uint64_t v40 = sub_1C2904844;
  uint64_t v41 = &block_descriptor_0;
  uint64_t v32 = _Block_copy(&aBlock);
  id v33 = v27;
  swift_retain();
  swift_release();
  objc_msgSend(v33, sel_enumerateAttribute_inRange_options_usingBlock_, v29, 0, v28, 0, v32);
  _Block_release(v32);
  LOBYTE(v29) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v29)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(*v35, sel_appendAttributedString_, v33);
    swift_release();
  }
}

void sub_1C2904654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  sub_1C29055AC(a1, (uint64_t)v17);
  if (v18)
  {
    uint64_t v9 = sub_1C29061E8(0, &qword_1EBB6BB10);
    if (swift_dynamicCast())
    {
      id v10 = sub_1C2905CBC(v16);
      sub_1C2905F38(0, &qword_1EA31C5E0, &qword_1EA31C5E8, type metadata accessor for Key);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1C2921D10;
      uint64_t v12 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 64) = v9;
      *(void *)(inited + 32) = v12;
      *(void *)(inited + 40) = v10;
      id v13 = v12;
      id v14 = v10;
      sub_1C291107C(inited);
      type metadata accessor for Key(0);
      sub_1C2906094((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
      uint64_t v15 = (void *)sub_1C2920B70();
      swift_bridgeObjectRelease();
      objc_msgSend(a6, sel_addAttributes_range_, v15, a2, a3);
    }
  }
  else
  {
    sub_1C2905268((uint64_t)v17, (uint64_t)&qword_1EA31C5D8, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C290638C);
  }
}

uint64_t sub_1C2904844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(long long *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((void *)&v12 + 1) = swift_getObjectType();
    *(void *)&long long v11 = a2;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return sub_1C2905268((uint64_t)&v11, (uint64_t)&unk_1EA31C5D8, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C290638C);
}

double sub_1C2904910(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    id v3 = (id)*MEMORY[0x1E4FB06F8];
    sub_1C2908400((uint64_t)v3);
    if (v4)
    {
      swift_unknownObjectRetain();

      self;
      uint64_t v5 = swift_dynamicCastObjCClass();
      if (v5)
      {
        objc_super v6 = (void *)v5;
        id v7 = v3;
        id v8 = sub_1C2905CBC(v6);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_1C2904B9C((uint64_t)v8, v7, isUniquelyReferenced_nonNull_native);
        swift_unknownObjectRelease();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    else
    {
    }
  }
  id v10 = (void *)sub_1C2920BB0();
  sub_1C29100E8(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1C2906094((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
  long long v11 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_sizeWithAttributes_, v11);
  double v13 = v12;

  return v13;
}

double sub_1C2904AC4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_1C2920BB0();
  sub_1C29100E8(a1);
  type metadata accessor for Key(0);
  sub_1C2906094((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
  id v3 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_sizeWithAttributes_, v3);
  double v5 = v4;

  return v5;
}

id sub_1C2904B9C(uint64_t a1, void *a2, char a3)
{
  double v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1C2908400((uint64_t)a2);
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
    sub_1C2908F44();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_unknownObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1C290895C(v12, a3 & 1);
  unint64_t v18 = sub_1C2908400((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    type metadata accessor for Key(0);
    id result = (id)sub_1C2921120();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

uint64_t sub_1C2904D00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C2904D20(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1C2904D20(char a1, int64_t a2, char a3, char *a4)
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
    sub_1C290638C(0, (unint64_t *)&unk_1EA31C650, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  char v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_1C29210C0();
  __break(1u);
  return result;
}

void sub_1C2904EAC(uint64_t a1)
{
  uint64_t v2 = sub_1C29204A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  double v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  sub_1C2920490();
  int64_t v7 = (void *)sub_1C2920480();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v6, sel_setLocale_, v7);

  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else
  {
    id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a1 + 1);
    id v9 = objc_msgSend(v6, sel_stringFromNumber_, v8);

    if (v9)
    {
      sub_1C2920BE0();
    }
    else
    {
    }
  }
}

uint64_t sub_1C2905038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for HealthArticleViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1C2920410();

  sub_1C2904EAC(a1);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_1C29061E8(0, &qword_1EA31C628);
  uint64_t v12 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  sub_1C2905F94(0, &qword_1EA31C630, (uint64_t (*)(uint64_t))sub_1C2906224, MEMORY[0x1E4FBBE00]);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1C2922520;
  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v15 = sub_1C290627C();
  *(void *)(v13 + 32) = v9;
  *(void *)(v13 + 40) = v11;
  *(void *)(v13 + 96) = v14;
  *(void *)(v13 + 104) = v15;
  *(void *)(v13 + 64) = v15;
  *(void *)(v13 + 72) = a2;
  *(void *)(v13 + 80) = a3;
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_1C2920EC0();

  uint64_t v17 = sub_1C2920BE0();
  return v17;
}

unint64_t sub_1C2905214()
{
  unint64_t result = qword_1EBB6BAF0;
  if (!qword_1EBB6BAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BAF0);
  }
  return result;
}

uint64_t sub_1C2905268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_1C29052C8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

double sub_1C2905300(uint64_t a1)
{
  return sub_1C2904910(a1);
}

unint64_t sub_1C290530C(double (*a1)(unint64_t))
{
  sub_1C2905F38(0, (unint64_t *)&qword_1EA31C5C0, (unint64_t *)&qword_1EA31C5C8, type metadata accessor for Key);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2922520;
  uint64_t v3 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v4 = self;
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  id v6 = v3;
  id v7 = objc_msgSend(v4, sel_preferredFontForTextStyle_, v5);
  uint64_t v8 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 48) = v8;
  uint64_t v9 = self;
  id v10 = v8;
  *(void *)(inited + 56) = objc_msgSend(v9, sel_labelColor);
  unint64_t v11 = sub_1C2910C10(inited);
  id v12 = objc_allocWithZone(MEMORY[0x1E4FB0848]);
  swift_bridgeObjectRetain();
  id v13 = objc_msgSend(v12, sel_init);
  if (a1)
  {
    swift_retain();
    double v14 = a1(v11);
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setHeadIndent_, v14);
    sub_1C2903C40((uint64_t)a1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v13, sel_setParagraphSpacing_, 12.0);
  id v15 = (id)*MEMORY[0x1E4FB0738];
  id v16 = v13;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1C2904B9C((uint64_t)v16, v15, isUniquelyReferenced_nonNull_native);

  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1C290551C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C2905554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C2904654(a1, a2, a3, a4, *(void *)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_1C290555C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C290556C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_1C29055AC(uint64_t a1, uint64_t a2)
{
  sub_1C290638C(0, &qword_1EA31C5D8, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2905638(uint64_t a1, uint64_t a2)
{
  type metadata accessor for HealthArticleViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1C2920410();

  sub_1C29061E8(0, &qword_1EA31C628);
  id v6 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  sub_1C2905F94(0, &qword_1EA31C630, (uint64_t (*)(uint64_t))sub_1C2906224, MEMORY[0x1E4FBBE00]);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1C2921D10;
  *(void *)(v7 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v7 + 64) = sub_1C290627C();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_1C2920EC0();

  uint64_t v9 = sub_1C2920BE0();
  return v9;
}

id sub_1C29057F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int64_t v4 = *(void *)(a3 + 16);
  if (v4)
  {
    uint64_t v37 = MEMORY[0x1E4FBC860];
    sub_1C2904D00(0, v4, 0);
    type metadata accessor for HealthArticleViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v35 = self;
    id v6 = (uint64_t *)(a3 + 40);
    sub_1C29061E8(0, &qword_1EA31C628);
    do
    {
      uint64_t v8 = *(v6 - 1);
      uint64_t v7 = *v6;
      swift_bridgeObjectRetain();
      id v9 = objc_msgSend(v35, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1C2920410();

      id v10 = (void *)sub_1C2920BB0();
      swift_bridgeObjectRelease();
      sub_1C2905F94(0, &qword_1EA31C630, (uint64_t (*)(uint64_t))sub_1C2906224, MEMORY[0x1E4FBBE00]);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_1C2921D10;
      *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v11 + 64) = sub_1C290627C();
      *(void *)(v11 + 32) = v8;
      *(void *)(v11 + 40) = v7;
      swift_bridgeObjectRetain();
      id v12 = (void *)sub_1C2920EC0();

      uint64_t v13 = sub_1C2920BE0();
      uint64_t v15 = v14;
      swift_bridgeObjectRelease();

      unint64_t v17 = *(void *)(v37 + 16);
      unint64_t v16 = *(void *)(v37 + 24);
      if (v17 >= v16 >> 1) {
        sub_1C2904D00(v16 > 1, v17 + 1, 1);
      }
      v6 += 2;
      *(void *)(v37 + 16) = v17 + 1;
      uint64_t v18 = v37 + 16 * v17;
      *(void *)(v18 + 32) = v13;
      *(void *)(v18 + 40) = v15;
      --v4;
    }
    while (v4);
    uint64_t v3 = a2;
  }
  sub_1C290638C(0, &qword_1EA31C640, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
  sub_1C29062D0();
  sub_1C2920BA0();
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_1C2905638(0, 0xE000000000000000);
  uint64_t v21 = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v19;
  *(void *)(v22 + 24) = v21;
  unint64_t v23 = sub_1C290530C((double (*)(unint64_t))sub_1C2906384);
  swift_release();
  sub_1C29100E8(v23);
  swift_bridgeObjectRelease();
  id v24 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v25 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1C2906094((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
  uint64_t v26 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_1C2920C50();
    unint64_t v28 = sub_1C290530C(0);
    sub_1C29100E8(v28);
    swift_bridgeObjectRelease();
    id v29 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    uint64_t v30 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
    uint64_t v31 = (void *)sub_1C2920B70();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v29, sel_initWithString_attributes_, v30, v31);

    objc_msgSend(v32, sel_appendAttributedString_, v27);
    return v32;
  }
  return v27;
}

id sub_1C2905CBC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_fontDescriptor);
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBBE00];
  sub_1C2905F94(0, &qword_1EA31C5F0, (uint64_t (*)(uint64_t))sub_1C2905FF8, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C2921D10;
  sub_1C2905F38(0, &qword_1EA31C600, &qword_1EA31C608, type metadata accessor for FeatureKey);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2922520;
  id v6 = (void *)*MEMORY[0x1E4FB28A0];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB28A0];
  *(void *)(inited + 40) = 6;
  uint64_t v7 = (void *)*MEMORY[0x1E4FB2890];
  *(void *)(inited + 48) = *MEMORY[0x1E4FB2890];
  *(void *)(inited + 56) = 0;
  id v8 = v6;
  id v9 = v7;
  *(void *)(v4 + 32) = sub_1C2910E78(inited);
  sub_1C2905F94(0, &qword_1EA31C610, (uint64_t (*)(uint64_t))sub_1C29060DC, v3);
  uint64_t v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_1C2921D10;
  uint64_t v11 = (void *)*MEMORY[0x1E4FB0910];
  *(void *)(v10 + 32) = *MEMORY[0x1E4FB0910];
  *(void *)(v10 + 40) = v4;
  id v12 = v11;
  unint64_t v13 = sub_1C2910F74(v10);
  sub_1C2910494(v13);
  swift_bridgeObjectRelease();
  type metadata accessor for AttributeName(0);
  sub_1C2906094(&qword_1EA31C3A8, type metadata accessor for AttributeName);
  uint64_t v14 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v2, sel_fontDescriptorByAddingAttributes_, v14);

  objc_msgSend(a1, sel_pointSize);
  id v17 = objc_msgSend(self, sel_fontWithDescriptor_size_, v15, v16);

  return v17;
}

void sub_1C2905F38(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_1C290617C(255, a3, a4);
    unint64_t v5 = sub_1C2921100();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1C2905F94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1C2905FF8()
{
  if (!qword_1EA31C5F8)
  {
    type metadata accessor for FeatureKey(255);
    sub_1C2906094(&qword_1EA31C3B8, type metadata accessor for FeatureKey);
    unint64_t v0 = sub_1C2920B80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C5F8);
    }
  }
}

uint64_t sub_1C2906094(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C29060DC()
{
  if (!qword_1EA31C618)
  {
    type metadata accessor for AttributeName(255);
    sub_1C2905F94(255, (unint64_t *)&qword_1EA31C620, (uint64_t (*)(uint64_t))sub_1C2905FF8, MEMORY[0x1E4FBB320]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA31C618);
    }
  }
}

void sub_1C290617C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t sub_1C29061E8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1C2906224()
{
  unint64_t result = qword_1EA31C638;
  if (!qword_1EA31C638)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C638);
  }
  return result;
}

unint64_t sub_1C290627C()
{
  unint64_t result = qword_1EBB6B690;
  if (!qword_1EBB6B690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6B690);
  }
  return result;
}

unint64_t sub_1C29062D0()
{
  unint64_t result = qword_1EA31C648;
  if (!qword_1EA31C648)
  {
    sub_1C290638C(255, &qword_1EA31C640, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C648);
  }
  return result;
}

uint64_t sub_1C290634C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

double sub_1C2906384(uint64_t a1)
{
  return sub_1C2904AC4(a1);
}

void sub_1C290638C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t HealthArticleViewController.components.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C29063EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HealthArticleComponent(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews;
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews);
  if (v7)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components);
    uint64_t v9 = *(void *)(v8 + 16);
    uint64_t v7 = MEMORY[0x1E4FBC860];
    if (v9)
    {
      uint64_t v15 = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRetain();
      sub_1C2921020();
      uint64_t v10 = v8 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
      uint64_t v11 = *(void *)(v3 + 72);
      do
      {
        sub_1C2903980(v10, (uint64_t)v5);
        id v12 = sub_1C2901BBC();
        sub_1C2901FF8((uint64_t)v12);
        sub_1C290960C((uint64_t)v5, type metadata accessor for HealthArticleComponent);
        sub_1C2921000();
        sub_1C2921030();
        sub_1C2921040();
        sub_1C2921010();
        v10 += v11;
        --v9;
      }
      while (v9);
      uint64_t v7 = v15;
      swift_bridgeObjectRelease();
    }
    *(void *)(v1 + v6) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return v7;
}

id sub_1C29065A4()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView);
  }
  else
  {
    uint64_t v4 = (void *)sub_1C2906608();
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_1C2906608()
{
  sub_1C29063EC();
  id v0 = objc_allocWithZone(MEMORY[0x1E4FB1C60]);
  sub_1C29061E8(0, &qword_1EA31C710);
  uint64_t v1 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithArrangedSubviews_, v1);

  unint64_t v3 = sub_1C29063EC();
  unint64_t v4 = v3;
  if (!(v3 >> 62))
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v2, sel_setAxis_, 1);
    objc_msgSend(v2, sel_setAlignment_, 1);
    objc_msgSend(v2, sel_setDistribution_, 0);
    objc_msgSend(v2, sel_setSpacing_, 0.0);
    return (uint64_t)v2;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1C2921070();
  uint64_t v5 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x1C87617C0](v7, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * v7 + 32);
      }
      uint64_t v9 = v8;
      ++v7;
      id v10 = objc_msgSend(v8, sel_widthAnchor);
      id v11 = objc_msgSend(v2, sel_widthAnchor);
      id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

      objc_msgSend(v12, sel_setActive_, 1);
    }
    while (v5 != v7);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2906824()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState);
  }
  else
  {
    uint64_t v2 = sub_1C290688C();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C290688C()
{
  uint64_t v0 = (void *)sub_1C29111A8(MEMORY[0x1E4FBC860]);
  unint64_t v1 = sub_1C29063EC();
  uint64_t v2 = v1;
  if (v1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C2921070();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    return (uint64_t)v0;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_27;
  }
LABEL_3:
  unint64_t v4 = v2 & 0xC000000000000001;
  uint64_t v5 = 4;
  unint64_t v26 = v2 & 0xC000000000000001;
  uint64_t v27 = v2;
  while (1)
  {
    if (v4) {
      id v6 = (id)MEMORY[0x1C87617C0](v5 - 4, v2);
    }
    else {
      id v6 = *(id *)(v2 + 8 * v5);
    }
    uint64_t v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    id v30 = v6;
    sub_1C29061E8(0, &qword_1EA31C710);
    sub_1C29095BC(0, &qword_1EA31C718);
    id v9 = v7;
    if (swift_dynamicCast()) {
      break;
    }
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));

    sub_1C290960C((uint64_t)v28, (uint64_t (*)(void))sub_1C290966C);
LABEL_5:
    ++v5;
    if (v8 == v3) {
      goto LABEL_27;
    }
  }
  uint64_t v2 = v3;
  sub_1C290960C((uint64_t)v28, (uint64_t (*)(void))sub_1C290966C);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v28[0] = v0;
  unint64_t v13 = sub_1C29085A0((uint64_t)v10);
  uint64_t v14 = v0[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15)) {
    goto LABEL_24;
  }
  char v17 = v12;
  if (v0[3] >= v16)
  {
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v0 = *(void **)&v28[0];
      if (v12) {
        goto LABEL_18;
      }
    }
    else
    {
      sub_1C29090EC();
      uint64_t v0 = *(void **)&v28[0];
      if (v17) {
        goto LABEL_18;
      }
    }
LABEL_20:
    v0[(v13 >> 6) + 8] |= 1 << v13;
    uint64_t v20 = 8 * v13;
    *(void *)(v0[6] + v20) = v10;
    *(void *)(v0[7] + v20) = 0;
    uint64_t v21 = v0[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_25;
    }
    v0[2] = v23;
    id v24 = v10;
    goto LABEL_22;
  }
  sub_1C2908C78(v16, isUniquelyReferenced_nonNull_native);
  unint64_t v18 = sub_1C29085A0((uint64_t)v10);
  if ((v17 & 1) == (v19 & 1))
  {
    unint64_t v13 = v18;
    uint64_t v0 = *(void **)&v28[0];
    if ((v17 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_18:
    *(void *)(v0[7] + 8 * v13) = 0;
LABEL_22:

    swift_bridgeObjectRelease();
    uint64_t v3 = v2;
    unint64_t v4 = v26;
    uint64_t v2 = v27;
    goto LABEL_5;
  }
  uint64_t result = sub_1C2921120();
  __break(1u);
  return result;
}

void sub_1C2906B5C(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

void *sub_1C2906BC0()
{
  unint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

char *HealthArticleViewController.__allocating_init(title:components:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return HealthArticleViewController.init(title:components:)(a1, a2, a3);
}

char *HealthArticleViewController.init(title:components:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for HealthArticleComponent(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (id *)((char *)&v20.receiver - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components] = a3;
  id v9 = (objc_class *)type metadata accessor for HealthArticleViewController();
  v20.receiver = v3;
  v20.super_class = v9;
  id v10 = (char *)objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, 0, 0);
  id v11 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setTitle_, v11);

  uint64_t result = (char *)objc_msgSend(v10, sel_view);
  if (result)
  {
    unint64_t v13 = result;
    id v14 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

    objc_msgSend(v10, sel_setModalPresentationStyle_, 1);
    uint64_t v15 = *(void *)&v10[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_components];
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v17 = v15 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      uint64_t v18 = *(void *)(v6 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_1C2903980(v17, (uint64_t)v8);
        if (swift_getEnumCaseMultiPayload() == 11)
        {
          char v19 = (void *)*v8;
          objc_msgSend(v10, sel_addChildViewController_, *v8);
          objc_msgSend(v19, sel_didMoveToParentViewController_, v10);
        }
        else
        {
          sub_1C290960C((uint64_t)v8, type metadata accessor for HealthArticleComponent);
        }
        v17 += v18;
        --v16;
      }
      while (v16);

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for HealthArticleViewController()
{
  return self;
}

id HealthArticleViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void HealthArticleViewController.init(coder:)()
{
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView] = 0;

  sub_1C2921060();
  __break(1u);
}

uint64_t sub_1C2907090()
{
  swift_getObjectType();
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for HealthArticleViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  sub_1C2907388();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_dismissArticleModal);
  id v2 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v2, sel_setRightBarButtonItem_, v1);

  sub_1C28FBB34();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1C2921D10;
  uint64_t v4 = sub_1C2920B60();
  uint64_t v5 = sub_1C2909960((unint64_t *)&unk_1EA31C6A0, MEMORY[0x1E4F678F8]);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  sub_1C2920E10();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C2907388()
{
  id v1 = v0;
  sub_1C29061E8(0, &qword_1EA31C738);
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_setPreservesSuperviewLayoutMargins_, 1);
  id v3 = objc_msgSend(v0, sel_title);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_1C2920BE0();

    unint64_t v65 = sub_1C2905214();
    uint64_t v64 = MEMORY[0x1E4FBB1A0];
    sub_1C2920F40();
    swift_bridgeObjectRelease();
    id v5 = v2;
    sub_1C2920FC0();
    sub_1C2920BE0();
    swift_bridgeObjectRelease();
    sub_1C2920C50();
    sub_1C2920C50();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setAccessibilityIdentifier_, v6, v64, v65, v65, v65);
  }
  objc_super v7 = (void **)&v1[OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView];
  swift_beginAccess();
  uint64_t v8 = *v7;
  void *v7 = v2;
  id v9 = v2;

  id v10 = objc_msgSend(v1, sel_view);
  if (!v10)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v11 = v10;
  objc_msgSend(v10, sel_addSubview_, v9);

  id v12 = sub_1C29065A4();
  objc_msgSend(v9, sel_addSubview_, v12);

  sub_1C2909864();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1C29226C0;
  id v14 = objc_msgSend(v9, sel_frameLayoutGuide);
  id v15 = objc_msgSend(v14, sel_topAnchor);

  id v16 = objc_msgSend(v1, sel_view);
  if (!v16)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v17 = v16;
  id v18 = objc_msgSend(v16, sel_topAnchor);

  id v19 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v18);
  *(void *)(v13 + 32) = v19;
  id v20 = objc_msgSend(v9, sel_frameLayoutGuide);
  id v21 = objc_msgSend(v20, sel_leadingAnchor);

  id v22 = objc_msgSend(v1, sel_view);
  if (!v22)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v23 = v22;
  id v24 = objc_msgSend(v22, sel_leadingAnchor);

  id v25 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v24);
  *(void *)(v13 + 40) = v25;
  id v26 = objc_msgSend(v9, sel_frameLayoutGuide);
  id v27 = objc_msgSend(v26, sel_trailingAnchor);

  id v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v29 = v28;
  uint64_t v67 = v7;
  id v30 = objc_msgSend(v28, sel_trailingAnchor);

  id v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
  *(void *)(v13 + 48) = v31;
  id v32 = objc_msgSend(v9, sel_frameLayoutGuide);
  id v33 = objc_msgSend(v32, sel_bottomAnchor);

  id v34 = objc_msgSend(v1, sel_view);
  if (!v34)
  {
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v35 = v34;
  id v66 = self;
  id v36 = objc_msgSend(v35, sel_bottomAnchor);

  id v37 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v36);
  *(void *)(v13 + 56) = v37;
  id v38 = objc_msgSend(v9, sel_contentLayoutGuide);
  id v39 = objc_msgSend(v38, sel_topAnchor);

  id v40 = sub_1C29065A4();
  id v41 = objc_msgSend(v40, sel_topAnchor);

  id v42 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v41);
  *(void *)(v13 + 64) = v42;
  id v43 = objc_msgSend(v9, sel_contentLayoutGuide);
  id v44 = objc_msgSend(v43, sel_leadingAnchor);

  id v45 = sub_1C29065A4();
  id v46 = objc_msgSend(v45, sel_leadingAnchor);

  id v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v46);
  *(void *)(v13 + 72) = v47;
  id v48 = objc_msgSend(v9, sel_contentLayoutGuide);
  id v49 = objc_msgSend(v48, sel_trailingAnchor);

  id v50 = sub_1C29065A4();
  id v51 = objc_msgSend(v50, sel_trailingAnchor);

  id v52 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v51);
  *(void *)(v13 + 80) = v52;
  id v53 = objc_msgSend(v9, sel_contentLayoutGuide);
  id v54 = objc_msgSend(v53, sel_bottomAnchor);

  id v55 = sub_1C29065A4();
  id v56 = objc_msgSend(v55, sel_bottomAnchor);

  id v57 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v56);
  *(void *)(v13 + 88) = v57;
  id v58 = objc_msgSend(v9, sel_frameLayoutGuide);
  id v59 = objc_msgSend(v58, sel_widthAnchor);

  id v60 = sub_1C29065A4();
  id v61 = objc_msgSend(v60, sel_widthAnchor);

  id v62 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v61);
  *(void *)(v13 + 96) = v62;
  sub_1C2920CD0();
  sub_1C29061E8(0, (unint64_t *)&qword_1EBB6BB08);
  v63 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v66, sel_activateConstraints_, v63);

  if (*v67) {
    objc_msgSend(*v67, sel_setDelegate_, v1);
  }
  sub_1C2907BB8(0);
}

uint64_t sub_1C2907BB8(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C2906824();
  uint64_t v76 = v4 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v4 + 64);
  uint64_t v74 = OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState;
  v79 = (id *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  int64_t v8 = 0;
  int64_t v77 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v78 = a1 & 1;
  uint64_t v75 = v4;
  unint64_t v9 = 0x1E6458000uLL;
  if (v7) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v12 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v12 < v77)
    {
      unint64_t v13 = *(void *)(v76 + 8 * v12);
      int64_t v14 = v8 + 1;
      if (v13) {
        goto LABEL_20;
      }
      int64_t v14 = v8 + 2;
      if (v8 + 2 >= v77) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v76 + 8 * v14);
      if (v13) {
        goto LABEL_20;
      }
      int64_t v14 = v8 + 3;
      if (v8 + 3 >= v77) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v76 + 8 * v14);
      if (v13)
      {
LABEL_20:
        unint64_t v7 = (v13 - 1) & v13;
        int64_t v80 = v14;
        for (unint64_t i = __clz(__rbit64(v13)) + (v14 << 6); ; unint64_t i = v10 | (v8 << 6))
        {
          uint64_t v16 = 8 * i;
          uint64_t v17 = *(void **)(*(void *)(v4 + 48) + v16);
          uint64_t v18 = *(void *)(*(void *)(v4 + 56) + v16);
          id v19 = *v79;
          if (*v79)
          {
            id v20 = v17;
            objc_msgSend(v19, sel_bounds);
            CGFloat v22 = v21;
            CGFloat v24 = v23;
            CGFloat v26 = v25;
            CGFloat v28 = v27;
            [v20 *(SEL *)(v9 + 3392)];
            v90.origin.x = v29;
            v90.origin.y = v30;
            v90.size.width = v31;
            v90.size.height = v32;
            v87.origin.x = v22;
            v87.origin.y = v24;
            v87.size.width = v26;
            v87.size.height = v28;
            if (CGRectContainsRect(v87, v90)) {
              uint64_t v33 = v78 | 2;
            }
            else {
              uint64_t v33 = v78;
            }
          }
          else
          {
            id v34 = v17;
            uint64_t v33 = v78;
          }
          uint64_t v83 = v17;
          sub_1C29061E8(0, &qword_1EA31C710);
          sub_1C29095BC(0, &qword_1EA31C718);
          id v35 = v17;
          if (swift_dynamicCast())
          {
            sub_1C29097B8(v81, (uint64_t)v84);
            if (v18 != v33)
            {
              uint64_t v36 = v85;
              uint64_t v37 = v86;
              __swift_project_boxed_opaque_existential_1(v84, v85);
              *(void *)&v81[0] = v33;
              (*(void (**)(long long *, uint64_t, uint64_t))(v37 + 8))(v81, v36, v37);
              id v38 = v35;
              uint64_t v39 = v2;
              uint64_t v40 = sub_1C2906824();
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&v81[0] = v40;
              unint64_t v43 = sub_1C29085A0((uint64_t)v38);
              uint64_t v44 = *(void *)(v40 + 16);
              BOOL v45 = (v42 & 1) == 0;
              uint64_t v46 = v44 + v45;
              if (__OFADD__(v44, v45)) {
                goto LABEL_48;
              }
              char v47 = v42;
              if (*(void *)(v40 + 24) >= v46)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  sub_1C29090EC();
                }
              }
              else
              {
                sub_1C2908C78(v46, isUniquelyReferenced_nonNull_native);
                unint64_t v48 = sub_1C29085A0((uint64_t)v38);
                if ((v47 & 1) != (v49 & 1)) {
                  goto LABEL_51;
                }
                unint64_t v43 = v48;
              }
              uint64_t v2 = v39;
              id v50 = *(void **)&v81[0];
              uint64_t v4 = v75;
              if (v47)
              {
                *(void *)(*(void *)(*(void *)&v81[0] + 56) + 8 * v43) = v33;
              }
              else
              {
                *(void *)(*(void *)&v81[0] + 8 * (v43 >> 6) + 64) |= 1 << v43;
                uint64_t v51 = 8 * v43;
                *(void *)(v50[6] + v51) = v38;
                *(void *)(v50[7] + v51) = v33;
                uint64_t v52 = v50[2];
                BOOL v53 = __OFADD__(v52, 1);
                uint64_t v54 = v52 + 1;
                if (v53) {
                  goto LABEL_49;
                }
                void v50[2] = v54;
                id v55 = v38;
              }

              swift_bridgeObjectRelease();
              *(void *)(v2 + v74) = v50;
              swift_bridgeObjectRelease();
            }
            unint64_t v9 = 0x1E6458000uLL;
            if ((v33 & 1) == 0)
            {
              if (*v79)
              {
                objc_msgSend(*v79, sel_bounds);
                CGFloat v57 = v56;
                CGFloat v59 = v58;
                CGFloat v61 = v60;
                CGFloat v63 = v62;
                objc_msgSend(v35, sel_frame);
                v91.origin.x = v64;
                v91.origin.y = v65;
                v91.size.width = v66;
                v91.size.height = v67;
                v88.origin.x = v57;
                v88.origin.y = v59;
                v88.size.width = v61;
                v88.size.height = v63;
                CGRect v89 = CGRectIntersection(v88, v91);
              }
              else
              {
                v89.size.width = 0.0;
                v89.size.height = 0.0;
                v89.origin.x = 0.0;
                v89.origin.y = 0.0;
              }
              double Height = CGRectGetHeight(v89);
              objc_msgSend(v35, sel_frame);
              uint64_t v69 = v85;
              uint64_t v70 = v86;
              double v72 = Height / v71;
              __swift_project_boxed_opaque_existential_1(v84, v85);
              (*(void (**)(uint64_t, uint64_t, double))(v70 + 16))(v69, v70, v72);
            }

            __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
            int64_t v8 = v80;
            if (!v7) {
              goto LABEL_7;
            }
          }
          else
          {
            uint64_t v82 = 0;
            memset(v81, 0, sizeof(v81));

            sub_1C290960C((uint64_t)v81, (uint64_t (*)(void))sub_1C290966C);
            unint64_t v9 = 0x1E6458000;
            int64_t v8 = v80;
            if (!v7) {
              goto LABEL_7;
            }
          }
LABEL_6:
          unint64_t v10 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          int64_t v80 = v8;
        }
      }
      uint64_t v15 = v8 + 4;
      if (v8 + 4 < v77)
      {
        unint64_t v13 = *(void *)(v76 + 8 * v15);
        if (v13)
        {
          int64_t v14 = v8 + 4;
          goto LABEL_20;
        }
        while (1)
        {
          int64_t v14 = v15 + 1;
          if (__OFADD__(v15, 1)) {
            goto LABEL_50;
          }
          if (v14 >= v77) {
            return swift_release();
          }
          unint64_t v13 = *(void *)(v76 + 8 * v14);
          ++v15;
          if (v13) {
            goto LABEL_20;
          }
        }
      }
    }
    return swift_release();
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  uint64_t result = sub_1C2921120();
  __break(1u);
  return result;
}

uint64_t sub_1C29080F8()
{
  return sub_1C2907BB8(1);
}

uint64_t sub_1C2908168()
{
  return sub_1C2907BB8(0);
}

uint64_t sub_1C29081D8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_1C2907BB8(0);
  }
  return result;
}

id HealthArticleViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void HealthArticleViewController.init(nibName:bundle:)()
{
}

id HealthArticleViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthArticleViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

UIInterfaceOrientationMask __swiftcall HealthArticleViewController.navigationControllerSupportedInterfaceOrientations(_:)(UINavigationController *a1)
{
  return (UIInterfaceOrientationMask)objc_msgSend(v1, sel_supportedInterfaceOrientations);
}

unint64_t sub_1C2908400(uint64_t a1)
{
  sub_1C2920BE0();
  sub_1C2921150();
  sub_1C2920C30();
  uint64_t v2 = sub_1C2921180();
  swift_bridgeObjectRelease();
  return sub_1C29085E4(a1, v2);
}

unint64_t sub_1C2908494(uint64_t a1, uint64_t a2)
{
  sub_1C2921150();
  sub_1C2920C30();
  uint64_t v4 = sub_1C2921180();
  return sub_1C290875C(a1, a2, v4);
}

unint64_t sub_1C2908510(uint64_t a1)
{
  sub_1C2920BE0();
  sub_1C2921150();
  sub_1C2920C30();
  uint64_t v2 = sub_1C2921180();
  swift_bridgeObjectRelease();
  return sub_1C29085E4(a1, v2);
}

unint64_t sub_1C29085A0(uint64_t a1)
{
  uint64_t v2 = sub_1C2920EA0();
  return sub_1C2908840(a1, v2);
}

unint64_t sub_1C29085E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1C2920BE0();
    uint64_t v8 = v7;
    if (v6 == sub_1C2920BE0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1C2921110();
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
          uint64_t v13 = sub_1C2920BE0();
          uint64_t v15 = v14;
          if (v13 == sub_1C2920BE0() && v15 == v16) {
            break;
          }
          char v18 = sub_1C2921110();
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

unint64_t sub_1C290875C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C2921110() & 1) == 0)
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
      while (!v14 && (sub_1C2921110() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C2908840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1C29061E8(0, &qword_1EA31C710);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1C2920EB0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1C2920EB0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_1C290895C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1C29098C0();
  char v37 = a2;
  uint64_t v6 = sub_1C2921090();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    id v34 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_33;
        }
        unint64_t v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v23 = v36[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v34;
              if (v37)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v36 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v23 = v36[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = 8 * v21;
      CGFloat v30 = *(void **)(*(void *)(v5 + 48) + v29);
      uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        id v32 = v30;
        swift_unknownObjectRetain();
      }
      sub_1C2920BE0();
      sub_1C2921150();
      sub_1C2920C30();
      uint64_t v14 = sub_1C2921180();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = v14 & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v7 + 48) + v19) = v30;
      *(void *)(*(void *)(v7 + 56) + v19) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C2908C78(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1C29096D4();
  uint64_t v6 = sub_1C2921090();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v35 = v2;
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
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
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
            unint64_t v24 = *(void *)(v36 + 8 * v14);
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
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0) {
      id v33 = v31;
    }
    uint64_t result = sub_1C2920EA0();
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
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_1C2908F44()
{
  uint64_t v1 = v0;
  sub_1C29098C0();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C2921080();
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
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_unknownObjectRetain();
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

id sub_1C29090EC()
{
  uint64_t v1 = v0;
  sub_1C29096D4();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C2921080();
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1C290928C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_traitCollection);
  uint64_t v2 = sub_1C2920E40();

  objc_msgSend(self, sel_edgeInsetsForWidthDesignation_, v2);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = sub_1C29065A4();
  objc_msgSend(v11, sel_setDirectionalLayoutMargins_, v4, v6, v8, v10);
}

uint64_t sub_1C2909358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C29063EC();
  *a1 = result;
  return result;
}

uint64_t sub_1C2909384(void *a1, void *a2)
{
  *(void *)(*a2 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

id sub_1C29093D0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  double v3 = (void **)(*a1 + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
  swift_beginAccess();
  double v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for HealthArticleViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthArticleViewController);
}

uint64_t dispatch thunk of HealthArticleViewController.componentViews.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HealthArticleViewController.__allocating_init(title:components:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewDidScroll(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewWillBeginDragging(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewDidEndDecelerating(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of HealthArticleViewController.scrollViewDidEndDragging(_:willDecelerate:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t sub_1C29095BC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1C290960C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1C290966C()
{
  if (!qword_1EA31C720)
  {
    sub_1C29095BC(255, &qword_1EA31C718);
    unint64_t v0 = sub_1C2920ED0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C720);
    }
  }
}

void sub_1C29096D4()
{
  if (!qword_1EA31C728)
  {
    sub_1C29061E8(255, &qword_1EA31C710);
    sub_1C2909750();
    unint64_t v0 = sub_1C29210B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C728);
    }
  }
}

unint64_t sub_1C2909750()
{
  unint64_t result = qword_1EA31C730;
  if (!qword_1EA31C730)
  {
    sub_1C29061E8(255, &qword_1EA31C710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C730);
  }
  return result;
}

uint64_t sub_1C29097B8(long long *a1, uint64_t a2)
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

void sub_1C2909864()
{
  if (!qword_1EA31C740)
  {
    unint64_t v0 = sub_1C2921100();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C740);
    }
  }
}

void sub_1C29098C0()
{
  if (!qword_1EA31C748)
  {
    type metadata accessor for Key(255);
    sub_1C2909960((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
    unint64_t v0 = sub_1C29210B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C748);
    }
  }
}

uint64_t sub_1C2909960(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C29099B0()
{
  uint64_t result = sub_1C2920BB0();
  qword_1EBB6BCF8 = result;
  return result;
}

unint64_t static Notification.UserInfoKey.readArticleIdentifier.getter()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for Notification.UserInfoKey()
{
  return &type metadata for Notification.UserInfoKey;
}

HealthArticlesUI::ArticleContentConfigurationProviderViewModel __swiftcall ArticleContentConfigurationProviderViewModel.init(articleIdentifier:)(HealthArticlesUI::ArticleContentConfigurationProviderViewModel articleIdentifier)
{
  *uint64_t v1 = articleIdentifier;
  return articleIdentifier;
}

uint64_t sub_1C2909A1C()
{
  return 1;
}

uint64_t sub_1C2909A24()
{
  return sub_1C2921180();
}

uint64_t sub_1C2909A68()
{
  return sub_1C2921160();
}

uint64_t sub_1C2909A90()
{
  return sub_1C2921180();
}

unint64_t sub_1C2909AD0()
{
  return 0xD000000000000011;
}

uint64_t sub_1C2909AEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C290C5B8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1C2909B18()
{
  return 0;
}

void sub_1C2909B24(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C2909B30(uint64_t a1)
{
  unint64_t v2 = sub_1C2909CF4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2909B6C(uint64_t a1)
{
  unint64_t v2 = sub_1C2909CF4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ArticleContentConfigurationProviderViewModel.encode(to:)(void *a1)
{
  sub_1C2909ECC(0, &qword_1EBB6B838, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  double v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2909CF4();
  sub_1C29211A0();
  sub_1C29210F0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1C2909CF4()
{
  unint64_t result = qword_1EBB6BCC0;
  if (!qword_1EBB6BCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCC0);
  }
  return result;
}

uint64_t ArticleContentConfigurationProviderViewModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1C2909ECC(0, qword_1EBB6B840, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v9 = (char *)&v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2909CF4();
  sub_1C2921190();
  if (!v2)
  {
    uint64_t v10 = sub_1C29210E0();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1C2909ECC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C2909CF4();
    unint64_t v7 = a3(a1, &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1C2909F30@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ArticleContentConfigurationProviderViewModel.init(from:)(a1, a2);
}

uint64_t sub_1C2909F48(void *a1)
{
  sub_1C2909ECC(0, &qword_1EBB6B838, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2909CF4();
  sub_1C29211A0();
  sub_1C29210F0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1C290A094()
{
  return sub_1C29205D0();
}

uint64_t sub_1C290A0F4()
{
  return sub_1C29205C0();
}

uint64_t sub_1C290A12C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1C290A158(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1C290A1AC())()
{
  return j__swift_endAccess;
}

uint64_t ArticleContentConfigurationProvider.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t ArticleContentConfigurationProvider.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  return result;
}

uint64_t sub_1C290A238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v83 = a3;
  CGRect v89 = a4;
  uint64_t v72 = *v4;
  uint64_t v7 = v72;
  sub_1C290C674();
  uint64_t v9 = v8;
  uint64_t v86 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v85 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_1C29206F0();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x1F4188790](v75);
  CGRect v88 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C290C6CC();
  uint64_t v84 = v12;
  uint64_t v82 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  int64_t v80 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  v81 = (char *)&v71 - v15;
  uint64_t v79 = sub_1C2920550();
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x1F4188790](v79);
  uint64_t v76 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for ArticleTileView.ViewModel(0);
  uint64_t v17 = MEMORY[0x1F4188790](v77);
  int64_t v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v7 + 80);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v17);
  unint64_t v23 = (char *)&v71 - v22;
  uint64_t v24 = *(void *)(v7 + 88);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v20, v24);
  uint64_t v87 = v9;
  uint64_t v73 = a1;
  sub_1C2920560();
  uint64_t v25 = a2;
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(&v92, v90, v91, a2, v20, v24);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  if (v93)
  {
    sub_1C290C8DC(&v92, &v94);
    uint64_t v26 = v95;
    uint64_t v27 = v96;
    __swift_project_boxed_opaque_existential_1(&v94, v95);
    uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 24))(v26, v27);
    uint64_t v87 = v29;
    CGRect v88 = (char *)v28;
    uint64_t v30 = v95;
    uint64_t v31 = v96;
    __swift_project_boxed_opaque_existential_1(&v94, v95);
    uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 32))(v30, v31);
    uint64_t v85 = v33;
    uint64_t v86 = v32;
    uint64_t v34 = v95;
    uint64_t v35 = v96;
    __swift_project_boxed_opaque_existential_1(&v94, v95);
    uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 40))(v34, v35);
    char v37 = v76;
    uint64_t v71 = v25;
    sub_1C29205B0();
    uint64_t v38 = v95;
    uint64_t v39 = v96;
    __swift_project_boxed_opaque_existential_1(&v94, v95);
    uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t))(v39 + 72);
    uint64_t v41 = v83;
    swift_retain();
    uint64_t v42 = v40(v38, v39);
    uint64_t v44 = v43;
    uint64_t v45 = v87;
    *(void *)int64_t v19 = v88;
    *((void *)v19 + 1) = v45;
    uint64_t v46 = v85;
    *((void *)v19 + 2) = v86;
    *((void *)v19 + 3) = v46;
    *((void *)v19 + 4) = v36;
    uint64_t v47 = v77;
    uint64_t v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v78 + 32))(&v19[*(int *)(v77 + 28)], v37, v79);
    *(void *)&v19[*(int *)(v47 + 32)] = v41;
    char v49 = (uint64_t *)&v19[*(int *)(v47 + 36)];
    *char v49 = v42;
    v49[1] = v44;
    MEMORY[0x1F4188790](v48);
    *(&v71 - 2) = (uint64_t)v19;
    *(&v71 - 1) = v41;
    type metadata accessor for ArticleTileView(0);
    sub_1C290D4A0(&qword_1EBB6B970, (void (*)(uint64_t))type metadata accessor for ArticleTileView);
    id v50 = v80;
    sub_1C2920880();
    sub_1C2920980();
    uint64_t v51 = v81;
    uint64_t v52 = v84;
    sub_1C2920870();
    BOOL v53 = *(uint64_t (**)(char *, uint64_t))(v82 + 8);
    uint64_t v54 = v53(v50, v52);
    CGRect v88 = (char *)&v71;
    MEMORY[0x1F4188790](v54);
    *(&v71 - 2) = v71;
    *(&v71 - 1) = v41;
    sub_1C290C954();
    id v55 = v89;
    v89[3] = v56;
    v55[4] = sub_1C290D4A0(&qword_1EBB6BA40, (void (*)(uint64_t))sub_1C290C954);
    __swift_allocate_boxed_opaque_existential_1(v55);
    sub_1C29205F0();
    sub_1C290D4A0(&qword_1EBB6B990, MEMORY[0x1E4F66568]);
    sub_1C2920860();
    v53(v51, v52);
    sub_1C290CA40((uint64_t)v19, type metadata accessor for ArticleTileView.ViewModel);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v94);
  }
  else
  {
    uint64_t v58 = v72;
    sub_1C290CA40((uint64_t)&v92, (uint64_t (*)(void))sub_1C290C77C);
    sub_1C29206C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v85, v73, v87);
    CGFloat v59 = sub_1C29206E0();
    os_log_type_t v60 = sub_1C2920DD0();
    BOOL v61 = os_log_type_enabled(v59, v60);
    double v62 = v89;
    uint64_t v63 = v75;
    if (v61)
    {
      uint64_t v64 = swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(void *)&long long v92 = v65;
      *(_DWORD *)uint64_t v64 = 136446466;
      *(void *)&long long v94 = v58;
      swift_getMetatypeMetadata();
      uint64_t v66 = sub_1C2920BF0();
      *(void *)&long long v94 = sub_1C2911820(v66, v67, (uint64_t *)&v92);
      sub_1C2920F20();
      swift_bridgeObjectRelease();
      *(_WORD *)(v64 + 12) = 2080;
      uint64_t v68 = v87;
      uint64_t v69 = v85;
      sub_1C2920560();
      *(void *)&long long v94 = sub_1C2911820(v94, *((unint64_t *)&v94 + 1), (uint64_t *)&v92);
      sub_1C2920F20();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v86 + 8))(v69, v68);
      _os_log_impl(&dword_1C28F8000, v59, v60, "[%{public}s] No article data provider was found in updateLayout using identifier %s", (uint8_t *)v64, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C8762070](v65, -1, -1);
      MEMORY[0x1C8762070](v64, -1, -1);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v88, v75);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v87);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v88, v63);
    }
    sub_1C290C810();
    v62[3] = v70;
    v62[4] = sub_1C290D4A0(&qword_1EA31C780, (void (*)(uint64_t))sub_1C290C810);
    __swift_allocate_boxed_opaque_existential_1(v62);
    return sub_1C2920880();
  }
}

uint64_t sub_1C290ACAC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ArticleTileView.ViewModel(0);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C290D3F8(a1, (uint64_t)v6);
  *a2 = swift_getKeyPath();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
  sub_1C290D33C(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (int *)type metadata accessor for ArticleTileView(0);
  uint64_t v9 = (uint64_t *)((char *)a2 + v8[5]);
  uint64_t *v9 = swift_getKeyPath();
  sub_1C290D33C(0, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], v7);
  swift_storeEnumTagMultiPayload();
  sub_1C290D3F8((uint64_t)v6, (uint64_t)a2 + v8[6]);
  uint64_t v10 = (uint64_t *)((char *)a2 + v8[7]);
  sub_1C29205A0();
  sub_1C290D4A0(&qword_1EBB6B988, MEMORY[0x1E4F66418]);
  swift_retain();
  uint64_t v11 = sub_1C2920780();
  uint64_t v13 = v12;
  uint64_t result = sub_1C290CA40((uint64_t)v6, type metadata accessor for ArticleTileView.ViewModel);
  uint64_t *v10 = v11;
  v10[1] = v13;
  return result;
}

uint64_t sub_1C290AE88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1C2920720();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

uint64_t sub_1C290AEF4()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t ArticleContentConfigurationProvider.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t ArticleContentConfigurationProvider.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1C290AF58()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1C290AF6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1C290A238(a1, a2, a3, a4);
}

uint64_t sub_1C290AF84@<X0>(uint64_t a1@<X8>)
{
  return sub_1C290AE88(a1);
}

uint64_t sub_1C290AF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for ArticleContentConfigurationProvider();
  return MEMORY[0x1F411E9F8](a1, v5, a3);
}

void (*sub_1C290AFF8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1C290A1AC();
  return sub_1C290B050;
}

void sub_1C290B050(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1C290B098@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_1C2920670();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2920610();
  sub_1C2920660();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v10)
  {
    sub_1C29097B8(&v9, (uint64_t)v11);
    sub_1C29097B8(v11, (uint64_t)&v9);
    sub_1C290D3A0();
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      uint64_t v7 = v8[1];
      *a1 = v8[0];
      a1[1] = v7;
      return result;
    }
  }
  else
  {
    uint64_t result = sub_1C290CA40((uint64_t)&v9, (uint64_t (*)(void))sub_1C290D308);
  }
  *a1 = 0;
  a1[1] = 0;
  return result;
}

uint64_t sub_1C290B1E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)v0;
  uint64_t v3 = sub_1C29206F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v54 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  BOOL v53 = (char *)&v47 - v7;
  uint64_t v8 = sub_1C2920670();
  uint64_t v56 = *(char **)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = v2;
  uint64_t v12 = *(void *)(v2 + class metadata base offset for ArticleContentConfigurationProvider.ActionHandler);
  uint64_t v55 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)&v47 - v13;
  sub_1C290B098(v60);
  uint64_t v15 = *((void *)&v60[0] + 1);
  if (*((void *)&v60[0] + 1))
  {
    uint64_t v51 = v4;
    uint64_t v52 = v3;
    uint64_t v16 = v1;
    uint64_t v17 = *(void *)&v60[0];
    uint64_t v18 = *(void *)(class metadata base offset for ArticleContentConfigurationProvider.ActionHandler + v57 + 8);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v12, v18);
    uint64_t v54 = v16;
    sub_1C2920610();
    uint64_t v19 = sub_1C2920640();
    uint64_t v56 = (char *)*((void *)v56 + 1);
    ((void (*)(char *, uint64_t))v56)(v11, v8);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(&v58, v17, v15, v19, v12, v18);
    swift_release();
    swift_bridgeObjectRelease();
    if (v59)
    {
      sub_1C290C8DC(&v58, v60);
      sub_1C290BEB8((uint64_t)v60);
      sub_1C2920610();
      uint64_t v20 = (void *)sub_1C2920650();
      ((void (*)(char *, uint64_t))v56)(v11, v8);
      sub_1C290B948(v60, v20);

      (*(void (**)(_OWORD *, uint64_t, uint64_t))(v18 + 32))(v60, v12, v18);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
      return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v14, v12);
    }
    else
    {
      uint64_t v56 = v14;
      sub_1C290CA40((uint64_t)&v58, (uint64_t (*)(void))sub_1C290C77C);
      uint64_t v32 = v53;
      sub_1C29206C0();
      swift_retain_n();
      id v33 = sub_1C29206E0();
      os_log_type_t v34 = sub_1C2920DD0();
      int v50 = v34;
      BOOL v35 = os_log_type_enabled(v33, v34);
      uint64_t v36 = v52;
      uint64_t v37 = v55;
      if (v35)
      {
        uint64_t v38 = swift_slowAlloc();
        uint64_t v49 = v12;
        uint64_t v39 = v38;
        uint64_t v40 = swift_slowAlloc();
        os_log_t v48 = v33;
        uint64_t v41 = v40;
        *(void *)&v60[0] = v40;
        *(_DWORD *)uint64_t v39 = 136315394;
        uint64_t v42 = sub_1C29211D0();
        *(void *)&long long v58 = sub_1C2911820(v42, v43, (uint64_t *)v60);
        sub_1C2920F20();
        swift_bridgeObjectRelease();
        *(_WORD *)(v39 + 12) = 2080;
        sub_1C2920610();
        uint64_t v44 = sub_1C2920BF0();
        *(void *)&long long v58 = sub_1C2911820(v44, v45, (uint64_t *)v60);
        sub_1C2920F20();
        swift_release_n();
        swift_bridgeObjectRelease();
        os_log_t v46 = v48;
        _os_log_impl(&dword_1C28F8000, v48, (os_log_type_t)v50, "[%s]: Received tap for article without underlying article: %s", (uint8_t *)v39, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C8762070](v41, -1, -1);
        MEMORY[0x1C8762070](v39, -1, -1);

        (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v52);
        return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v56, v49);
      }
      else
      {
        swift_release_n();

        (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v36);
        return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v56, v12);
      }
    }
  }
  else
  {
    uint64_t v56 = (char *)v8;
    uint64_t v22 = v54;
    sub_1C29206C0();
    swift_retain_n();
    unint64_t v23 = sub_1C29206E0();
    uint64_t v24 = sub_1C2920DD0();
    if (os_log_type_enabled(v23, (os_log_type_t)v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v51 = v4;
      uint64_t v52 = v3;
      uint64_t v26 = v25;
      uint64_t v27 = swift_slowAlloc();
      *(void *)&v60[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315394;
      uint64_t v28 = sub_1C29211D0();
      *(void *)&long long v58 = sub_1C2911820(v28, v29, (uint64_t *)v60);
      sub_1C2920F20();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      sub_1C2920610();
      uint64_t v30 = sub_1C2920BF0();
      *(void *)&long long v58 = sub_1C2911820(v30, v31, (uint64_t *)v60);
      sub_1C2920F20();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C28F8000, v23, (os_log_type_t)v24, "[%s]: Received tap for article without identifier: %s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C8762070](v27, -1, -1);
      MEMORY[0x1C8762070](v26, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v22, v52);
    }
    else
    {

      swift_release_n();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v22, v3);
    }
  }
}

void sub_1C290B948(void *a1, void *a2)
{
  id v51 = a2;
  uint64_t v4 = *v2;
  uint64_t v5 = sub_1C29206F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  uint64_t v50 = v6;
  MEMORY[0x1F4188790](v5);
  uint64_t v52 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1C2920670();
  uint64_t v8 = *(void *)(v54 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v54);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = v4;
  uint64_t v12 = *(void *)(v4 + class metadata base offset for ArticleContentConfigurationProvider.ActionHandler);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v15 = (char *)&v48 - v14;
  uint64_t v17 = *(void *)(v16 + 8);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v12, v17);
  uint64_t v18 = a1[3];
  uint64_t v19 = a1[5];
  BOOL v53 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
  uint64_t v22 = v21;
  sub_1C2920610();
  uint64_t v23 = sub_1C2920640();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v54);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 24))(v20, v22, v23, v12, v17);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (v24)
  {
    uint64_t v25 = v53[3];
    uint64_t v26 = v53[5];
    __swift_project_boxed_opaque_existential_1(v53, v25);
    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 16))(v25, v26);
    uint64_t v29 = v28;
    id v30 = objc_allocWithZone((Class)type metadata accessor for HealthArticleViewController());
    unint64_t v31 = HealthArticleViewController.init(title:components:)(v27, v29, v24);
    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B70]), sel_initWithRootViewController_, v31);
    objc_msgSend(v32, sel_setDelegate_, v31);
    id v33 = objc_msgSend(v51, sel_navigationController);
    if (v33)
    {
      os_log_type_t v34 = v33;
      objc_msgSend(v33, sel_presentViewController_animated_completion_, v32, 1, 0);
    }
  }
  else
  {
    uint64_t v35 = v48;
    sub_1C29206C0();
    sub_1C290D250((uint64_t)v53, (uint64_t)v56);
    uint64_t v36 = sub_1C29206E0();
    os_log_type_t v37 = sub_1C2920DD0();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = v49;
    if (v38)
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v55 = v41;
      *(_DWORD *)uint64_t v40 = 136446466;
      uint64_t v59 = v35;
      swift_getMetatypeMetadata();
      uint64_t v42 = sub_1C2920BF0();
      uint64_t v59 = sub_1C2911820(v42, v43, &v55);
      sub_1C2920F20();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      uint64_t v44 = v57;
      uint64_t v45 = v58;
      __swift_project_boxed_opaque_existential_1(v56, v57);
      uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v45 + 8))(v44, v45);
      uint64_t v59 = sub_1C2911820(v46, v47, &v55);
      sub_1C2920F20();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
      _os_log_impl(&dword_1C28F8000, v36, v37, "[%{public}s] No article components were found in presentArticle using identifier %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C8762070](v41, -1, -1);
      MEMORY[0x1C8762070](v40, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v39);
  }
}

void sub_1C290BEB8(uint64_t a1)
{
  uint64_t v46 = *v1;
  uint64_t v47 = sub_1C29206F0();
  uint64_t v49 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  uint64_t v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C2920550();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = sub_1C2920670();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C290D250(a1, (uint64_t)&v51);
  sub_1C2920610();
  sub_1C2920640();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_1C29205B0();
  swift_release();
  uint64_t v16 = v54;
  uint64_t v17 = v55;
  __swift_project_boxed_opaque_existential_1(&v51, v54);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 48))(v16, v17);
  unint64_t v19 = sub_1C29195D8(v18);
  swift_bridgeObjectRelease();
  uint64_t v20 = v54;
  uint64_t v21 = v55;
  __swift_project_boxed_opaque_existential_1(&v51, v54);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  ArticleTapAnalyticsEvent.init(didTapArticle:associatedHKTypes:articleTitle:articleLocation:)(1, v19, (uint64_t)v9, v50);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  uint64_t v22 = (void *)v50[0];
  uint64_t v23 = v50[1];
  uint64_t v24 = (void *)v50[2];
  uint64_t v25 = (void *)v50[3];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
  sub_1C29206D0();
  id v26 = v22;
  swift_bridgeObjectRetain_n();
  id v27 = v24;
  id v28 = v25;
  id v29 = v26;
  id v30 = v27;
  id v31 = v28;
  uint64_t v48 = v4;
  id v32 = sub_1C29206E0();
  os_log_type_t v33 = sub_1C2920DF0();
  int v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v50[0] = v45;
    *(_DWORD *)uint64_t v35 = 136446466;
    uint64_t v51 = v46;
    swift_getMetatypeMetadata();
    LODWORD(v46) = v34;
    uint64_t v36 = sub_1C2920BF0();
    uint64_t v51 = sub_1C2911820(v36, v37, v50);
    sub_1C2920F20();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v44 = v35 + 14;
    uint64_t v51 = (uint64_t)v29;
    uint64_t v52 = v23;
    id v53 = v30;
    uint64_t v54 = (uint64_t)v31;
    id v38 = v29;
    swift_bridgeObjectRetain();
    id v39 = v30;
    id v40 = v31;
    uint64_t v41 = sub_1C2920BF0();
    uint64_t v51 = sub_1C2911820(v41, v42, v50);
    sub_1C2920F20();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C28F8000, v32, (os_log_type_t)v46, "[%{public}s]: Submitting article tap analytics for: %s", (uint8_t *)v35, 0x16u);
    uint64_t v43 = v45;
    swift_arrayDestroy();
    MEMORY[0x1C8762070](v43, -1, -1);
    MEMORY[0x1C8762070](v35, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v47);
  uint64_t v51 = (uint64_t)v29;
  uint64_t v52 = v23;
  id v53 = v30;
  uint64_t v54 = (uint64_t)v31;
  sub_1C290D2B4();
  sub_1C29204F0();

  swift_bridgeObjectRelease();
}

uint64_t ArticleContentConfigurationProvider.ActionHandler.__allocating_init(content:)(uint64_t a1)
{
  return ArticleContentConfigurationProvider.ActionHandler.init(content:)(a1);
}

uint64_t ArticleContentConfigurationProvider.ActionHandler.init(content:)(uint64_t a1)
{
  uint64_t v2 = sub_1C2920670();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  uint64_t v5 = sub_1C2920620();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v5;
}

uint64_t ArticleContentConfigurationProvider.ActionHandler.__deallocating_deinit()
{
  uint64_t v0 = _s16HealthArticlesUI35ArticleContentConfigurationProviderC13ActionHandlerCfd_0();
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1C290C5B8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000001C2923BB0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1C2921110();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1C290C640()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

void sub_1C290C674()
{
  if (!qword_1EA31C760)
  {
    unint64_t v0 = sub_1C2920570();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C760);
    }
  }
}

void sub_1C290C6CC()
{
  if (!qword_1EBB6BA50)
  {
    type metadata accessor for ArticleTileView(255);
    sub_1C290D4A0(&qword_1EBB6B970, (void (*)(uint64_t))type metadata accessor for ArticleTileView);
    unint64_t v0 = sub_1C2920890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6BA50);
    }
  }
}

void sub_1C290C77C(uint64_t a1)
{
}

unint64_t sub_1C290C7B0()
{
  unint64_t result = qword_1EA31C770;
  if (!qword_1EA31C770)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C770);
  }
  return result;
}

void sub_1C290C810()
{
  if (!qword_1EA31C778)
  {
    unint64_t v0 = sub_1C2920890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C778);
    }
  }
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

_OWORD *sub_1C290C8DC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_1C290C8F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C290ACAC(*(void *)(v1 + 16), a1);
}

uint64_t sub_1C290C8FC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  swift_retain();
  return MEMORY[0x1F411E960](v2, v1);
}

void sub_1C290C954()
{
  if (!qword_1EBB6BA48)
  {
    type metadata accessor for ArticleTileView(255);
    sub_1C29205F0();
    sub_1C290D4A0(&qword_1EBB6B970, (void (*)(uint64_t))type metadata accessor for ArticleTileView);
    sub_1C290D4A0(&qword_1EBB6B990, MEMORY[0x1E4F66568]);
    unint64_t v0 = sub_1C2920890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6BA48);
    }
  }
}

uint64_t sub_1C290CA40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1C290CAA4()
{
  unint64_t result = qword_1EBB6BCE0;
  if (!qword_1EBB6BCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCE0);
  }
  return result;
}

unint64_t sub_1C290CAFC()
{
  unint64_t result = qword_1EBB6BCF0;
  if (!qword_1EBB6BCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCF0);
  }
  return result;
}

unint64_t sub_1C290CB54()
{
  unint64_t result = qword_1EBB6BCE8;
  if (!qword_1EBB6BCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCE8);
  }
  return result;
}

uint64_t sub_1C290CBA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1C290CBC4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1C290C640();
  a1[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_1C290CC00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = swift_unknownObjectRetain();
  return sub_1C290A158(v2, v1);
}

uint64_t sub_1C290CC3C()
{
  return 16;
}

__n128 sub_1C290CC48(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void *initializeBufferWithCopyOfBuffer for ArticleContentConfigurationProviderViewModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ArticleContentConfigurationProviderViewModel()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ArticleContentConfigurationProviderViewModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ArticleContentConfigurationProviderViewModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ArticleContentConfigurationProviderViewModel()
{
  return &type metadata for ArticleContentConfigurationProviderViewModel;
}

uint64_t sub_1C290CD9C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ArticleContentConfigurationProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ArticleContentConfigurationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticleContentConfigurationProvider);
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.makeContentConfiguration(viewModelState:viewContext:cellState:actionHandlerContent:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.makeBackgroundConfiguration(cellState:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.makeAccessories()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t sub_1C290CF10()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ArticleContentConfigurationProvider.ActionHandler()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ArticleContentConfigurationProvider.ActionHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticleContentConfigurationProvider.ActionHandler);
}

uint64_t dispatch thunk of ArticleContentConfigurationProvider.ActionHandler.didSelect()()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ArticleContentConfigurationProvider.ActionHandler
                              + *v0
                              + 24))();
}

uint64_t getEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ArticleContentConfigurationProviderViewModel.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1C290D0B4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C290D0DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ArticleContentConfigurationProviderViewModel.CodingKeys()
{
  return &type metadata for ArticleContentConfigurationProviderViewModel.CodingKeys;
}

unint64_t sub_1C290D0F8()
{
  unint64_t result = qword_1EA31C788;
  if (!qword_1EA31C788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C788);
  }
  return result;
}

unint64_t sub_1C290D150()
{
  unint64_t result = qword_1EBB6BCD0;
  if (!qword_1EBB6BCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCD0);
  }
  return result;
}

unint64_t sub_1C290D1A8()
{
  unint64_t result = qword_1EBB6BCC8;
  if (!qword_1EBB6BCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCC8);
  }
  return result;
}

unint64_t sub_1C290D1FC()
{
  unint64_t result = qword_1EBB6BCD8;
  if (!qword_1EBB6BCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BCD8);
  }
  return result;
}

uint64_t sub_1C290D250(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1C290D2B4()
{
  unint64_t result = qword_1EA31C790;
  if (!qword_1EA31C790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C790);
  }
  return result;
}

void sub_1C290D308(uint64_t a1)
{
}

void sub_1C290D33C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1C290D3A0()
{
  unint64_t result = qword_1EA31C7A0;
  if (!qword_1EA31C7A0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C7A0);
  }
  return result;
}

uint64_t sub_1C290D3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ArticleTileView.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C290D464(uint64_t a1)
{
}

uint64_t sub_1C290D4A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_1C290D51C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v3, sel_constraints);
  sub_1C28FBAF4();
  unint64_t v7 = sub_1C2920CC0();

  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C290D768(v7, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    objc_msgSend(v8, sel_setActive_, 0);
  }
  id v9 = objc_msgSend(v3, sel_image);
  if (v9)
  {
    id v21 = v9;
    objc_msgSend(v9, sel_size);
    if (v11 == 0.0 && v10 == 0.0)
    {
    }
    else
    {
      objc_msgSend(v21, sel_size);
      double v13 = v12;
      objc_msgSend(v21, sel_size);
      double v15 = v13 / v14;
      id v16 = objc_msgSend(v3, sel_widthAnchor);
      id v17 = objc_msgSend(v3, sel_heightAnchor);
      id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_multiplier_, v17, v15);

      unint64_t v19 = (void *)sub_1C2920BB0();
      objc_msgSend(v18, sel_setIdentifier_, v19);

      type metadata accessor for UILayoutPriority(0);
      sub_1C290D8FC();
      sub_1C2920710();
      LODWORD(v20) = v22;
      objc_msgSend(v18, sel_setPriority_, v20);
      objc_msgSend(v18, sel_setActive_, 1);
    }
  }
}

void *sub_1C290D768(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_1C2921070())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C87617C0](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      unint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_identifier);
      if (v10)
      {
        double v11 = v10;
        uint64_t v12 = sub_1C2920BE0();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_1C2921110();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1C290D8FC()
{
  unint64_t result = qword_1EBB6BAF8;
  if (!qword_1EBB6BAF8)
  {
    type metadata accessor for UILayoutPriority(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BAF8);
  }
  return result;
}

uint64_t static NSLayoutConstraint.constraintsPinning(_:toMarginsOf:withHeight:)(void *a1, void *a2, uint64_t a3, char a4)
{
  return sub_1C290D96C(a1, a2, a3, a4 & 1);
}

uint64_t static NSLayoutConstraint.constraintsPinning(_:toEdgesOf:withHeight:)(void *a1, void *a2, uint64_t a3, char a4)
{
  return sub_1C290DF7C(a1, a2, a3, a4 & 1);
}

uint64_t static NSLayoutConstraint.constraintsPinning(_:toHorizontalMarginsOf:withHeight:)(void *a1, void *a2, uint64_t a3, char a4)
{
  return sub_1C290DC8C(a1, a2, a3, a4 & 1);
}

uint64_t sub_1C290D96C(void *a1, void *a2, uint64_t a3, char a4)
{
  sub_1C2909864();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2922AF0;
  id v9 = objc_msgSend(a1, sel_topAnchor);
  id v10 = objc_msgSend(a2, sel_layoutMarginsGuide);
  id v11 = objc_msgSend(v10, sel_topAnchor);

  id v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
  *(void *)(v8 + 32) = v12;
  id v13 = objc_msgSend(a1, sel_leftAnchor);
  id v14 = objc_msgSend(a2, sel_layoutMarginsGuide);
  id v15 = objc_msgSend(v14, sel_leftAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(void *)(v8 + 40) = v16;
  id v17 = objc_msgSend(a1, sel_bottomAnchor);
  id v18 = objc_msgSend(a2, sel_layoutMarginsGuide);
  id v19 = objc_msgSend(v18, sel_bottomAnchor);

  id v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(void *)(v8 + 48) = v20;
  id v21 = objc_msgSend(a1, sel_rightAnchor);
  id v22 = objc_msgSend(a2, sel_layoutMarginsGuide);
  id v23 = objc_msgSend(v22, sel_rightAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(void *)(v8 + 56) = v24;
  uint64_t v29 = v8;
  sub_1C2920CD0();
  uint64_t result = v8;
  if ((a4 & 1) == 0)
  {
    id v26 = objc_msgSend(a1, sel_heightAnchor);
    id v27 = objc_msgSend(v26, sel_constraintEqualToConstant_, *(double *)&a3);

    LODWORD(v28) = 1144750080;
    MEMORY[0x1C8761480](objc_msgSend(v27, sel_setPriority_, v28));
    if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C2920CE0();
    }
    sub_1C2920CF0();
    sub_1C2920CD0();
    return v29;
  }
  return result;
}

uint64_t sub_1C290DC8C(void *a1, void *a2, uint64_t a3, char a4)
{
  sub_1C2909864();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2922AF0;
  id v9 = objc_msgSend(a1, sel_topAnchor);
  id v10 = objc_msgSend(a2, sel_topAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v8 + 32) = v11;
  id v12 = objc_msgSend(a1, sel_leftAnchor);
  id v13 = objc_msgSend(a2, sel_layoutMarginsGuide);
  id v14 = objc_msgSend(v13, sel_leftAnchor);

  id v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(void *)(v8 + 40) = v15;
  id v16 = objc_msgSend(a1, sel_bottomAnchor);
  id v17 = objc_msgSend(a2, sel_bottomAnchor);
  id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

  *(void *)(v8 + 48) = v18;
  id v19 = objc_msgSend(a1, sel_rightAnchor);
  id v20 = objc_msgSend(a2, sel_layoutMarginsGuide);
  id v21 = objc_msgSend(v20, sel_rightAnchor);

  id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v21);
  *(void *)(v8 + 56) = v22;
  uint64_t v27 = v8;
  sub_1C2920CD0();
  uint64_t result = v8;
  if ((a4 & 1) == 0)
  {
    id v24 = objc_msgSend(a1, sel_heightAnchor);
    id v25 = objc_msgSend(v24, sel_constraintEqualToConstant_, *(double *)&a3);

    LODWORD(v26) = 1144750080;
    MEMORY[0x1C8761480](objc_msgSend(v25, sel_setPriority_, v26));
    if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C2920CE0();
    }
    sub_1C2920CF0();
    sub_1C2920CD0();
    return v27;
  }
  return result;
}

uint64_t sub_1C290DF7C(void *a1, void *a2, uint64_t a3, char a4)
{
  sub_1C2909864();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2922AF0;
  id v9 = objc_msgSend(a1, sel_topAnchor);
  id v10 = objc_msgSend(a2, sel_topAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v8 + 32) = v11;
  id v12 = objc_msgSend(a1, sel_leftAnchor);
  id v13 = objc_msgSend(a2, sel_leftAnchor);
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v8 + 40) = v14;
  id v15 = objc_msgSend(a1, sel_bottomAnchor);
  id v16 = objc_msgSend(a2, sel_bottomAnchor);
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v8 + 48) = v17;
  id v18 = objc_msgSend(a1, sel_rightAnchor);
  id v19 = objc_msgSend(a2, sel_rightAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(void *)(v8 + 56) = v20;
  uint64_t v25 = v8;
  sub_1C2920CD0();
  uint64_t result = v8;
  if ((a4 & 1) == 0)
  {
    id v22 = objc_msgSend(a1, sel_heightAnchor);
    id v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, *(double *)&a3);

    LODWORD(v24) = 1144750080;
    MEMORY[0x1C8761480](objc_msgSend(v23, sel_setPriority_, v24));
    if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C2920CE0();
    }
    sub_1C2920CF0();
    sub_1C2920CD0();
    return v25;
  }
  return result;
}

uint64_t MovementVisibilityState.rawValue.getter()
{
  return *(void *)v0;
}

HealthArticlesUI::MovementVisibilityState __swiftcall MovementVisibilityState.init(rawValue:)(HealthArticlesUI::MovementVisibilityState rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static MovementVisibilityState.viewIsMoving.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static MovementVisibilityState.viewIsVisible.getter(void *a1@<X8>)
{
  *a1 = 2;
}

unint64_t sub_1C290E264()
{
  unint64_t result = qword_1EA31C7A8;
  if (!qword_1EA31C7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C7A8);
  }
  return result;
}

unint64_t sub_1C290E2BC()
{
  unint64_t result = qword_1EA31C7B0;
  if (!qword_1EA31C7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C7B0);
  }
  return result;
}

void *sub_1C290E310@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_1C290E320()
{
  unint64_t result = qword_1EA31C7B8;
  if (!qword_1EA31C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C7B8);
  }
  return result;
}

unint64_t sub_1C290E378()
{
  unint64_t result = qword_1EA31C7C0;
  if (!qword_1EA31C7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C7C0);
  }
  return result;
}

void sub_1C290E3CC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1C290E3D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1C290E3E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1C290E3FC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1C290E410(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1C290E440@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1C290E46C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1C290E490(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1C290E4A4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1C290E4B8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1C290E4CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1C290E4E0(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1C290E4F4(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1C290E508(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1C290E51C()
{
  return *v0 == 0;
}

uint64_t sub_1C290E52C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1C290E544(void *result)
{
  *v1 &= ~*result;
  return result;
}

ValueMetadata *type metadata accessor for MovementVisibilityState()
{
  return &type metadata for MovementVisibilityState;
}

uint64_t dispatch thunk of MovementVisibilityTracking.viewStateChanged(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MovementVisibilityTracking.viewVisibilityChanged(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id sub_1C290E650()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SectionHeaderView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SectionHeaderView()
{
  return self;
}

char *sub_1C290E6A8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_insetConstraints] = MEMORY[0x1E4FBC860];
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_edgeToEdgeConstraints] = v9;
  uint64_t v10 = OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView;
  id v11 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v12 = v4;
  id v13 = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setContentMode_, 1);
  objc_msgSend(v13, sel_setClipsToBounds_, 1);
  objc_msgSend(v13, sel_setImage_, 0);
  *(void *)&v4[v10] = v13;

  v27.receiver = v12;
  v27.super_class = (Class)type metadata accessor for ImageView();
  id v14 = (char *)objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v14, sel_setPreservesSuperviewLayoutMargins_, 1);
  uint64_t v15 = OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView;
  id v16 = *(void **)&v14[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView];
  objc_msgSend(v14, sel_addSubview_, v16);
  id v17 = v14;
  id v18 = v16;
  uint64_t v19 = sub_1C290D96C(v18, v17, 0, 1);

  *(void *)&v17[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_insetConstraints] = v19;
  swift_bridgeObjectRelease();
  id v20 = *(void **)&v14[v15];
  id v21 = v17;
  id v22 = v20;
  uint64_t v23 = sub_1C290DF7C(v22, v21, 0, 1);

  *(void *)&v21[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_edgeToEdgeConstraints] = v23;
  swift_bridgeObjectRelease();
  double v24 = self;
  sub_1C28FBAF4();
  swift_bridgeObjectRetain();
  uint64_t v25 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_activateConstraints_, v25);

  return v21;
}

void sub_1C290E938(uint64_t a1, char a2)
{
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView);
  objc_msgSend(v4, sel_setImage_, a1);
  sub_1C290D51C(0xD000000000000043, 0x80000001C2923C70);
  uint64_t v5 = self;
  sub_1C28FBAF4();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_deactivateConstraints_, v6);

  swift_bridgeObjectRetain();
  id v7 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_activateConstraints_, v7);

  id v8 = objc_msgSend(v4, sel_layer);
  if (a2) {
    double v9 = 3.0;
  }
  else {
    double v9 = 0.0;
  }
  id v10 = v8;
  objc_msgSend(v8, sel_setCornerRadius_, v9);
}

id sub_1C290EB38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ImageView()
{
  return self;
}

void sub_1C290EBEC()
{
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_insetConstraints] = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9ImageView_edgeToEdgeConstraints] = v1;
  uint64_t v2 = OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setContentMode_, 1);
  objc_msgSend(v3, sel_setClipsToBounds_, 1);
  objc_msgSend(v3, sel_setImage_, 0);
  *(void *)&v0[v2] = v3;

  sub_1C2921060();
  __break(1u);
}

id sub_1C290ECF8()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView];
  }
  else
  {
    id v4 = sub_1C290EFB0(v0);
    uint64_t v5 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

unint64_t sub_1C290ED5C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text + 8);
  if (v1)
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes);
    if (v2 != 7)
    {
      uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text);
      unint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes);
      swift_bridgeObjectRetain();
      sub_1C28FBAE4(v2);
      sub_1C290EDE8(v3, v1, &v5);
      swift_bridgeObjectRelease();
      return sub_1C28FB7C8(v2);
    }
  }
  return result;
}

void sub_1C290EDE8(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  id v4 = v3;
  unint64_t v5 = *a3;
  id v6 = &v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text];
  *(void *)id v6 = a1;
  *((void *)v6 + 1) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes];
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes] = v5;
  sub_1C28FB7B8(v5);
  sub_1C28FB7C8(v7);
  swift_bridgeObjectRetain();
  unint64_t v8 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1C29100E8(v8);
  swift_bridgeObjectRelease();
  id v9 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  id v10 = (void *)sub_1C2920BB0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1C28FD9F8();
  id v11 = (void *)sub_1C2920B70();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v9, sel_initWithString_attributes_, v10, v11);

  id v12 = sub_1C290ECF8();
  objc_msgSend(v12, sel_setAttributedText_, v13);

  objc_msgSend(v4, sel_setNeedsLayout);
}

double sub_1C290EF60()
{
  objc_msgSend(v0, sel_layoutMargins);
  double v2 = v1;
  objc_msgSend(v0, sel_layoutMargins);
  return v2;
}

id sub_1C290EFB0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1DD8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v2, sel_setBackgroundColor_, 0);
  objc_msgSend(v2, sel_setScrollEnabled_, 0);
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v2, sel_setEditable_, 0);
  id v3 = objc_msgSend(a1, sel_effectiveUserInterfaceLayoutDirection);
  if (v3 == (id)1) {
    double v4 = 5.0;
  }
  else {
    double v4 = -5.0;
  }
  if (v3 == (id)1) {
    double v5 = -5.0;
  }
  else {
    double v5 = 5.0;
  }
  objc_msgSend(v2, sel_setContentInset_, 0.0, v4, 0.0, v5);
  objc_msgSend(v2, sel_setTextContainerInset_, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  objc_msgSend(v2, sel_setAccessibilityTraits_, *MEMORY[0x1E4FB25A0]);
  return v2;
}

void *sub_1C290F0EC(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView] = 0;
  id v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes] = 7;
  v24.receiver = v4;
  v24.super_class = (Class)type metadata accessor for DynamicHeightTextView();
  id v10 = objc_msgSendSuper2(&v24, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v10, sel_setPreservesSuperviewLayoutMargins_, 1);
  id v11 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v10) + 0xC8);
  id v12 = v10;
  v11();
  objc_msgSend(v12, sel_setLayoutMargins_);

  id v13 = v12;
  id v14 = sub_1C290ECF8();
  objc_msgSend(v13, sel_addSubview_, v14);

  uint64_t v15 = self;
  id v16 = sub_1C290ECF8();
  id v17 = v13;
  sub_1C290D96C(v16, v17, 0, 1);

  sub_1C28FBAF4();
  id v18 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_activateConstraints_, v18);

  sub_1C28FBB34();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1C2921D10;
  uint64_t v20 = sub_1C2920730();
  uint64_t v21 = MEMORY[0x1E4FB1138];
  *(void *)(v19 + 32) = v20;
  *(void *)(v19 + 40) = v21;
  id v22 = v17;
  MEMORY[0x1C8761660](v19, sel_preferredContentSizeCategoryDidChange);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v22;
}

id sub_1C290F40C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicHeightTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DynamicHeightTextView()
{
  return self;
}

HealthArticlesUI::HealthArticleView __swiftcall HealthArticleView.init(title:components:)(Swift::String title, Swift::OpaquePointer components)
{
  *(Swift::String *)uint64_t v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = components;
  result.title = title;
  result.components = components;
  return result;
}

uint64_t HealthArticleView.init(articleProvider:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  uint64_t v8 = v7;
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v11;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

id HealthArticleView.makeUIViewController(context:)()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  id v4 = objc_allocWithZone((Class)type metadata accessor for HealthArticleViewController());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = HealthArticleViewController.init(title:components:)(v1, v2, v3);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B70]), sel_initWithRootViewController_, v5);

  return v6;
}

unint64_t sub_1C290F624()
{
  unint64_t result = qword_1EA31C7F8;
  if (!qword_1EA31C7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C7F8);
  }
  return result;
}

id sub_1C290F678()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  id v4 = objc_allocWithZone((Class)type metadata accessor for HealthArticleViewController());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = HealthArticleViewController.init(title:components:)(v1, v2, v3);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B70]), sel_initWithRootViewController_, v5);

  return v6;
}

uint64_t sub_1C290F710()
{
  return sub_1C29208F0();
}

uint64_t sub_1C290F74C()
{
  return MEMORY[0x1E4F3F158];
}

uint64_t sub_1C290F758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1C290FA40();
  return MEMORY[0x1F40FAB70](a1, a2, a3, v6);
}

uint64_t sub_1C290F7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1C290FA40();
  return MEMORY[0x1F40FAB28](a1, a2, a3, v6);
}

uint64_t sub_1C290F820()
{
  return sub_1C2920A40();
}

void sub_1C290F83C()
{
}

uint64_t destroy for HealthArticleView()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16HealthArticlesUI17HealthArticleViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HealthArticleView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for HealthArticleView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthArticleView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthArticleView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthArticleView()
{
  return &type metadata for HealthArticleView;
}

unint64_t sub_1C290FA40()
{
  unint64_t result = qword_1EA31C800;
  if (!qword_1EA31C800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C800);
  }
  return result;
}

unint64_t HealthArticleTextAttributes.textAttributes.getter()
{
  unint64_t v1 = *v0;
  switch(*v0)
  {
    case 0uLL:
      id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
      LODWORD(v3) = 1045220557;
      objc_msgSend(v2, sel_setHyphenationFactor_, v3);
      objc_msgSend(v2, sel_setLineBreakStrategy_, 2);
      sub_1C291007C();
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1C2922E20;
      uint64_t v5 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
      sub_1C29061E8(0, &qword_1EBB6BB10);
      id v6 = v5;
      uint64_t v7 = sub_1C2920E70();
      uint64_t v8 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(inited + 40) = v7;
      *(void *)(inited + 48) = v8;
      uint64_t v9 = self;
      id v10 = v8;
      id v11 = objc_msgSend(v9, sel_labelColor);
      id v12 = (void *)*MEMORY[0x1E4FB0738];
      *(void *)(inited + 56) = v11;
      *(void *)(inited + 64) = v12;
      *(void *)(inited + 72) = v2;
      id v13 = v12;
      uint64_t v14 = inited;
      goto LABEL_10;
    case 1uLL:
    case 2uLL:
      sub_1C291007C();
      uint64_t v16 = swift_initStackObject();
      *(_OWORD *)(v16 + 16) = xmmword_1C2922520;
      id v17 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(v16 + 32) = *MEMORY[0x1E4FB06F8];
      sub_1C29061E8(0, &qword_1EBB6BB10);
      id v18 = v17;
      uint64_t v19 = sub_1C2920E70();
      uint64_t v20 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(v16 + 40) = v19;
      *(void *)(v16 + 48) = v20;
      uint64_t v21 = self;
      id v22 = v20;
      *(void *)(v16 + 56) = objc_msgSend(v21, sel_labelColor);
      uint64_t v14 = v16;
      goto LABEL_10;
    case 3uLL:
      sub_1C291007C();
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1C2922520;
      objc_super v24 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(v23 + 32) = *MEMORY[0x1E4FB06F8];
      uint64_t v25 = self;
      uint64_t v26 = *MEMORY[0x1E4FB28C8];
      id v27 = v24;
      id v28 = objc_msgSend(v25, sel_preferredFontForTextStyle_, v26);
      uint64_t v29 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(v23 + 40) = v28;
      *(void *)(v23 + 48) = v29;
      id v30 = self;
      id v31 = v29;
      id v32 = objc_msgSend(v30, sel_labelColor);
      goto LABEL_9;
    case 4uLL:
      sub_1C291007C();
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1C2922520;
      os_log_type_t v33 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(v23 + 32) = *MEMORY[0x1E4FB06F8];
      int v34 = self;
      uint64_t v35 = *MEMORY[0x1E4FB28C8];
      id v36 = v33;
      id v37 = objc_msgSend(v34, sel_preferredFontForTextStyle_, v35);
      id v38 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(v23 + 40) = v37;
      *(void *)(v23 + 48) = v38;
      id v39 = self;
      id v40 = v38;
      id v32 = objc_msgSend(v39, sel_whiteColor);
      goto LABEL_9;
    case 5uLL:
      sub_1C291007C();
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1C2922520;
      uint64_t v41 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(v23 + 32) = *MEMORY[0x1E4FB06F8];
      unint64_t v42 = self;
      uint64_t v43 = *MEMORY[0x1E4FB28D8];
      id v44 = v41;
      id v45 = objc_msgSend(v42, sel_preferredFontForTextStyle_, v43);
      uint64_t v46 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(v23 + 40) = v45;
      *(void *)(v23 + 48) = v46;
      uint64_t v47 = self;
      id v48 = v46;
      id v32 = objc_msgSend(v47, sel_secondaryLabelColor);
      goto LABEL_9;
    case 6uLL:
      sub_1C291007C();
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_1C2922520;
      uint64_t v49 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(v23 + 32) = *MEMORY[0x1E4FB06F8];
      uint64_t v50 = self;
      uint64_t v51 = *MEMORY[0x1E4FB28C8];
      id v52 = v49;
      id v53 = objc_msgSend(v50, sel_preferredFontForTextStyle_, v51);
      uint64_t v54 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(v23 + 40) = v53;
      *(void *)(v23 + 48) = v54;
      uint64_t v55 = self;
      id v56 = v54;
      id v32 = objc_msgSend(v55, sel_systemBlueColor);
LABEL_9:
      *(void *)(v23 + 56) = v32;
      uint64_t v14 = v23;
LABEL_10:
      unint64_t v15 = sub_1C2910C10(v14);
      break;
    default:
      unint64_t v15 = *v0;
      break;
  }
  sub_1C28FB7B8(v1);
  return v15;
}

void sub_1C291007C()
{
  if (!qword_1EA31C5C0)
  {
    sub_1C2912380(255, (unint64_t *)&qword_1EA31C5C8);
    unint64_t v0 = sub_1C2921100();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C5C0);
    }
  }
}

uint64_t sub_1C29100E8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1C2912224(0, &qword_1EA31C830);
    uint64_t v2 = sub_1C29210A0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
  int64_t v28 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v28 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v26) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v28 + 1;
    if (!v12)
    {
      int64_t v13 = v28 + 2;
      if (v28 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v28 + 3;
        if (v28 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v28 + 4;
          if (v28 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v28 = v13;
LABEL_28:
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v31[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    *(void *)&v30[0] = v15;
    id v16 = *(id *)&v31[0];
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v17 = *(void *)&v31[0];
    sub_1C29121BC((_OWORD *)((char *)v31 + 8), v29);
    sub_1C29121BC(v29, v31);
    sub_1C29121BC(v31, v30);
    sub_1C2920BE0();
    sub_1C2921150();
    sub_1C2920C30();
    uint64_t v18 = sub_1C2921180();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
      unint64_t v8 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v17;
    uint64_t result = (uint64_t)sub_1C29121BC(v30, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v28 + 5;
  if (v28 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1C29121CC();
    return v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v28 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1C2910494(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1C29123E8();
    uint64_t v2 = sub_1C29210A0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
  int64_t v29 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v29 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v27) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v29 + 1;
    if (!v12)
    {
      int64_t v13 = v29 + 2;
      if (v29 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v29 + 3;
        if (v29 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v29 + 4;
          if (v29 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v29 = v13;
LABEL_28:
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v32[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    uint64_t v15 = *(void **)&v32[0];
    *(void *)&v31[0] = v16;
    sub_1C2912488();
    id v17 = v15;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t v18 = *(void *)&v32[0];
    sub_1C29121BC((_OWORD *)((char *)v32 + 8), v30);
    sub_1C29121BC(v30, v32);
    sub_1C29121BC(v32, v31);
    sub_1C2920BE0();
    sub_1C2921150();
    sub_1C2920C30();
    uint64_t v19 = sub_1C2921180();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
      unint64_t v8 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v18;
    uint64_t result = (uint64_t)sub_1C29121BC(v31, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v29 + 5;
  if (v29 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1C29121CC();
    return v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v29 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1C2910838(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1C29121D4(0, &qword_1EA31C820);
    uint64_t v2 = sub_1C29210A0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
    id v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_1C29121BC(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_1C29121BC(v35, v36);
    sub_1C29121BC(v36, &v32);
    uint64_t result = sub_1C2920FB0();
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
    uint64_t result = (uint64_t)sub_1C29121BC(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1C29121CC();
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

unint64_t sub_1C2910C10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C2912224(0, (unint64_t *)&qword_1EA31C748);
  uint64_t v2 = (void *)sub_1C29210A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    unint64_t result = sub_1C2908400((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

unint64_t sub_1C2910D2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C29121D4(0, &qword_1EA31C810);
  uint64_t v2 = sub_1C29210A0();
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
    sub_1C29120EC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1C2908494(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1C29121BC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1C2910E78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C291258C();
  uint64_t v2 = (void *)sub_1C29210A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_1C290850C();
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
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

unint64_t sub_1C2910F74(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C29124E0();
  uint64_t v2 = (void *)sub_1C29210A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_1C290850C(v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

unint64_t sub_1C291107C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C2912224(0, &qword_1EA31C830);
  uint64_t v2 = sub_1C29210A0();
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
    sub_1C2912308(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1C2908400(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1C29121BC(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1C29111A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C29096D4();
  uint64_t v2 = (void *)sub_1C29210A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_1C29085A0((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
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

unint64_t sub_1C29112A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1C29121D4(0, &qword_1EA31C828);
  uint64_t v2 = (void *)sub_1C29210A0();
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
    unint64_t result = sub_1C2908494(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
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

uint64_t HealthArticleTextAttributes.attributeContainer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1C29206F0();
  MEMORY[0x1F4188790](v2);
  unint64_t v3 = HealthArticleTextAttributes.textAttributes.getter();
  sub_1C29100E8(v3);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_1C2920370();
  sub_1C29122C0(&qword_1EA31C5B8, MEMORY[0x1E4FB0D88]);
  sub_1C2920430();
  uint64_t v4 = sub_1C2920420();
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, 0, 1, v4);
}

uint64_t sub_1C29117C0@<X0>(uint64_t *a1@<X8>)
{
  sub_1C2920380();
  uint64_t result = sub_1C2920370();
  *a1 = result;
  return result;
}

uint64_t sub_1C29117F0@<X0>(uint64_t *a1@<X8>)
{
  sub_1C2920380();
  uint64_t result = sub_1C2920370();
  *a1 = result;
  return result;
}

uint64_t sub_1C2911820(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C29118F4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C2912628((uint64_t)v12, *a3);
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
      sub_1C2912628((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C29118F4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C2920F30();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C2911AB0(a5, a6);
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
  uint64_t v8 = sub_1C2920FF0();
  if (!v8)
  {
    sub_1C2921050();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C29210C0();
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

uint64_t sub_1C2911AB0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C2911B48(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C2911D24(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C2911D24(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C2911B48(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C2911CC0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C2920FD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C2921050();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C2920C60();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C29210C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C2921050();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C2911CC0(uint64_t a1, uint64_t a2)
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
  sub_1C2912684();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C2911D24(char a1, int64_t a2, char a3, char *a4)
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
    sub_1C2912684();
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
  uint64_t result = sub_1C29210C0();
  __break(1u);
  return result;
}

unint64_t sub_1C2911E70()
{
  unint64_t result = qword_1EA31C808;
  if (!qword_1EA31C808)
  {
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C808);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for HealthArticleTextAttributes(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for HealthArticleTextAttributes(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for HealthArticleTextAttributes(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for HealthArticleTextAttributes(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthArticleTextAttributes(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFF9 && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483641);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 6;
  if (v4 >= 8) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HealthArticleTextAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 6;
    }
  }
  return result;
}

uint64_t sub_1C29120A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1C29120BC(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for HealthArticleTextAttributes()
{
  return &type metadata for HealthArticleTextAttributes;
}

uint64_t sub_1C29120EC(uint64_t a1, uint64_t a2)
{
  sub_1C2912150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C2912150()
{
  if (!qword_1EA31C818)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA31C818);
    }
  }
}

_OWORD *sub_1C29121BC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C29121CC()
{
  return swift_release();
}

void sub_1C29121D4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1C29210B0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_1C2912224(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    type metadata accessor for Key(255);
    sub_1C29122C0((unint64_t *)&qword_1EA31C750, type metadata accessor for Key);
    unint64_t v3 = sub_1C29210B0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1C29122C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C2912308(uint64_t a1, uint64_t a2)
{
  sub_1C2912380(0, &qword_1EA31C5E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C2912380(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_1C29123E8()
{
  if (!qword_1EA31C838)
  {
    type metadata accessor for AttributeName(255);
    sub_1C29122C0(&qword_1EA31C3A8, type metadata accessor for AttributeName);
    unint64_t v0 = sub_1C29210B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C838);
    }
  }
}

void sub_1C2912488()
{
  if (!qword_1EA31C620)
  {
    sub_1C2905FF8();
    unint64_t v0 = sub_1C2920D00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C620);
    }
  }
}

void sub_1C29124E0()
{
  if (!qword_1EA31C840)
  {
    type metadata accessor for AttributeName(255);
    sub_1C2912488();
    sub_1C29122C0(&qword_1EA31C3A8, type metadata accessor for AttributeName);
    unint64_t v0 = sub_1C29210B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C840);
    }
  }
}

void sub_1C291258C()
{
  if (!qword_1EA31C848)
  {
    type metadata accessor for FeatureKey(255);
    sub_1C29122C0(&qword_1EA31C3B8, type metadata accessor for FeatureKey);
    unint64_t v0 = sub_1C29210B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C848);
    }
  }
}

uint64_t sub_1C2912628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1C2912684()
{
  if (!qword_1EA31C850)
  {
    unint64_t v0 = sub_1C2921100();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C850);
    }
  }
}

void __swiftcall UIView.init(frame:useAutoLayout:)(UIView *__return_ptr retstr, CGRect frame, Swift::Bool useAutoLayout)
{
}

Swift::Void __swiftcall UIView.addSubviews(_:)(Swift::OpaquePointer a1)
{
  long long v2 = v1;
  if ((unint64_t)a1._rawValue >> 62)
  {
    id v9 = v1;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C2921070();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v5 = v2;
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if (((unint64_t)a1._rawValue & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x1C87617C0](i, a1._rawValue);
    }
    else {
      id v7 = *((id *)a1._rawValue + i + 4);
    }
    int64_t v8 = v7;
    objc_msgSend(v10, sel_addSubview_, v7);
  }
LABEL_10:
  swift_bridgeObjectRelease();
}

uint64_t static ArticleMutualExclusionPolicy.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!a2) {
    return !a4;
  }
  if (a2 == 1) {
    return a4 == 1;
  }
  if (a4 < 2) {
    return 0;
  }
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1C2921110();
  }
}

uint64_t sub_1C29128D0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = a2[1];
  if (!v3) {
    return !v4;
  }
  if (v3 == 1) {
    return v4 == 1;
  }
  if (v4 < 2) {
    return 0;
  }
  if (*a1 != *a2 || v3 != v4) {
    return sub_1C2921110();
  }
  return 1;
}

uint64_t HealthArticleInformationProviding.mutualExclusionPolicy.getter()
{
  return 0;
}

double sub_1C291293C()
{
  return 1209600.0;
}

double HealthArticleInformationProviding.rampDownDurationAfterFirstRead.getter()
{
  return 1209600.0;
}

uint64_t HealthArticleInformationProviding.articleAutomationIdentifier.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1C2920BE0();
  sub_1C2920C50();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_1C2920C50();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t HealthArticleInformationProviding.feedItemIdentifier(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  sub_1C2920C50();
  sub_1C29204E0();
  sub_1C2920C50();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t destroy for ArticleMutualExclusionPolicy(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16HealthArticlesUI28ArticleMutualExclusionPolicyOwCP_0(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for ArticleMutualExclusionPolicy(void *a1, void *a2)
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

uint64_t assignWithTake for ArticleMutualExclusionPolicy(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for ArticleMutualExclusionPolicy(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ArticleMutualExclusionPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1C2912C9C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1C2912CB4(void *result, int a2)
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

ValueMetadata *type metadata accessor for ArticleMutualExclusionPolicy()
{
  return &type metadata for ArticleMutualExclusionPolicy;
}

uint64_t dispatch thunk of HealthArticleInformationProviding.uniqueIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.viewTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleHeroImage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.associatedHKTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.mutualExclusionPolicy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.rampDownDurationAfterFirstRead.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of HealthArticleInformationProviding.articleAutomationIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of HealthArticleComponentsProviding.articleComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t ArticleTileView.ViewModel.init(title:description:backgroundImage:presentation:cellState:automationIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  BOOL v14 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  uint64_t v15 = (char *)a9 + v14[7];
  uint64_t v16 = sub_1C2920550();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, a6, v16);
  *(void *)((char *)a9 + v14[8]) = a7;
  uint64_t v18 = (void *)((char *)a9 + v14[9]);
  void *v18 = a8;
  v18[1] = a10;
  return result;
}

uint64_t type metadata accessor for ArticleTileView.ViewModel(uint64_t a1)
{
  return sub_1C2900834(a1, (uint64_t *)&unk_1EBB6B960);
}

uint64_t ArticleTileView.init(_:cellState:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  unsigned int v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
  sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
  swift_storeEnumTagMultiPayload();
  unsigned int v5 = (int *)type metadata accessor for ArticleTileView(0);
  unint64_t v6 = (uint64_t *)((char *)a2 + v5[5]);
  *unint64_t v6 = swift_getKeyPath();
  sub_1C2914D48(0, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], v4);
  swift_storeEnumTagMultiPayload();
  sub_1C2917C90(a1, (uint64_t)a2 + v5[6], type metadata accessor for ArticleTileView.ViewModel);
  id v7 = (uint64_t *)((char *)a2 + v5[7]);
  sub_1C29205A0();
  sub_1C29157A4(&qword_1EBB6B988, MEMORY[0x1E4F66418]);
  uint64_t v8 = sub_1C2920780();
  uint64_t v10 = v9;
  uint64_t result = sub_1C2917CF8(a1, type metadata accessor for ArticleTileView.ViewModel);
  uint64_t *v7 = v8;
  v7[1] = v10;
  return result;
}

uint64_t ArticleTileView.ViewModel.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArticleTileView.ViewModel.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

id ArticleTileView.ViewModel.backgroundImage.getter()
{
  return *(id *)(v0 + 32);
}

uint64_t ArticleTileView.ViewModel.presentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 28);
  uint64_t v4 = sub_1C2920550();
  unsigned int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ArticleTileView.ViewModel.cellState.getter()
{
  type metadata accessor for ArticleTileView.ViewModel(0);
  return swift_retain();
}

uint64_t ArticleTileView.ViewModel.baseIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArticleTileView.ViewModel.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = (void *)(v2 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ArticleTileView.ViewModel.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t ArticleTileView.viewModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ArticleTileView(0);
  return sub_1C2917C90(v1 + *(int *)(v3 + 24), a1, type metadata accessor for ArticleTileView.ViewModel);
}

double sub_1C2913248()
{
  type metadata accessor for ArticleTileView(0);
  sub_1C29205A0();
  sub_1C29157A4(&qword_1EBB6B988, MEMORY[0x1E4F66418]);
  sub_1C2920790();
  swift_getKeyPath();
  sub_1C29207A0();
  swift_release();
  swift_release();
  sub_1C2917C44(0, &qword_1EBB6BAB0, MEMORY[0x1E4FBC958], MEMORY[0x1E4F3EE18]);
  MEMORY[0x1C87612B0](&v1);
  swift_release();
  swift_release();
  double result = v1 * 0.6;
  if (v1 * 0.6 > 319.0) {
    return 319.0;
  }
  return result;
}

uint64_t ArticleTileView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v17 = sub_1C29208C0();
  uint64_t v1 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C291532C(0, &qword_1EBB6BAA8, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0, &qword_1EBB6BAD0);
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)v16 - v6;
  sub_1C29158B4();
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v7 = sub_1C2920850();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  sub_1C2917E84(0, &qword_1EBB6B9C0, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0);
  sub_1C291362C(v16[1], (uint64_t)&v7[*(int *)(v13 + 44)]);
  unint64_t v14 = sub_1C2915964();
  sub_1C2920A10();
  sub_1C29159E8((uint64_t)v7, &qword_1EBB6BAA8, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0, &qword_1EBB6BAD0);
  sub_1C29208B0();
  uint64_t v19 = v5;
  unint64_t v20 = v14;
  swift_getOpaqueTypeConformance2();
  sub_1C2920A50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1C291362C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v94 = a2;
  uint64_t v87 = sub_1C29153CC;
  sub_1C291532C(0, &qword_1EBB6BA90, &qword_1EBB6BAC8, (uint64_t (*)(uint64_t))sub_1C29153CC, &qword_1EBB6BAC0);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v86 = (uint64_t)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v81 = (uint64_t *)((char *)&v80 - v6);
  sub_1C29151E4();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v85 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2915168(0);
  uint64_t v88 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v91 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2915148(0);
  uint64_t v89 = v11;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v93 = (uint64_t)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v90 = (uint64_t)&v80 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v92 = (uint64_t)&v80 - v16;
  uint64_t v83 = sub_1C2915038;
  uint64_t v82 = (void (*)(uint64_t))MEMORY[0x1E4F3DF60];
  sub_1C2914FC4(0, &qword_1EBB6BA10, (void (*)(uint64_t))sub_1C2915038, MEMORY[0x1E4F3DF60]);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v80 - v18;
  sub_1C2914F88(0);
  uint64_t v21 = v20 - 8;
  MEMORY[0x1F4188790](v20);
  unint64_t v23 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2914FC4(0, &qword_1EBB6BA30, sub_1C2914F88, (void (*)(uint64_t))sub_1C2915098);
  uint64_t v25 = v24 - 8;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  int64_t v80 = (char *)&v80 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  long long v29 = (char *)&v80 - v28;
  uint64_t v84 = (void *)(a1 + *(int *)(type metadata accessor for ArticleTileView(0) + 24));
  sub_1C2913FEC((uint64_t)v84, (uint64_t)v19);
  sub_1C29205A0();
  sub_1C29157A4(&qword_1EBB6B988, MEMORY[0x1E4F66418]);
  sub_1C2920790();
  swift_getKeyPath();
  sub_1C29207A0();
  swift_release();
  swift_release();
  long long v98 = v96;
  *(void *)&long long v99 = v97;
  sub_1C2917C44(0, &qword_1EBB6BAB0, MEMORY[0x1E4FBC958], MEMORY[0x1E4F3EE18]);
  MEMORY[0x1C87612B0](&v95);
  uint64_t v30 = (uint64_t)v85;
  swift_release();
  swift_release();
  sub_1C2913248();
  sub_1C2920AF0();
  sub_1C2920760();
  long long v31 = (void (*)(uint64_t))v83;
  long long v32 = v82;
  sub_1C29180C0((uint64_t)v19, (uint64_t)v23, &qword_1EBB6BA10, (void (*)(uint64_t))v83, v82);
  long long v33 = &v23[*(int *)(v21 + 44)];
  long long v34 = v99;
  *(_OWORD *)long long v33 = v98;
  *((_OWORD *)v33 + 1) = v34;
  *((_OWORD *)v33 + 2) = v100;
  uint64_t v35 = (uint64_t)v32;
  uint64_t v36 = (uint64_t)v80;
  sub_1C2917FF8((uint64_t)v19, (uint64_t)&qword_1EBB6BA10, (uint64_t)v31, v35, (uint64_t (*)(void))sub_1C2914FC4);
  sub_1C2917C90((uint64_t)v23, v36, (uint64_t (*)(void))sub_1C2914F88);
  *(_WORD *)(v36 + *(int *)(v25 + 44)) = 0;
  sub_1C2917CF8((uint64_t)v23, (uint64_t (*)(void))sub_1C2914F88);
  uint64_t v37 = (uint64_t)v29;
  sub_1C2917D58(v36, (uint64_t)v29);
  *(void *)uint64_t v30 = sub_1C2920840();
  *(void *)(v30 + 8) = 0;
  *(unsigned char *)(v30 + 16) = 1;
  sub_1C2917DEC();
  uint64_t v39 = v30 + *(int *)(v38 + 44);
  uint64_t v40 = sub_1C2920850();
  uint64_t v41 = (uint64_t)v81;
  uint64_t *v81 = v40;
  *(void *)(v41 + 8) = 0;
  *(unsigned char *)(v41 + 16) = 0;
  unint64_t v42 = (uint64_t (*)(uint64_t))v87;
  sub_1C2917E84(0, &qword_1EBB6B9B8, &qword_1EBB6BAC8, (uint64_t (*)(uint64_t))v87);
  sub_1C2914278(v84, a1, v41 + *(int *)(v43 + 44));
  uint64_t v44 = v86;
  sub_1C2917F00(v41, v86);
  sub_1C2917F00(v44, v39);
  sub_1C2915298();
  uint64_t v46 = v39 + *(int *)(v45 + 48);
  *(void *)uint64_t v46 = 0;
  *(unsigned char *)(v46 + 8) = 1;
  sub_1C29159E8(v41, &qword_1EBB6BA90, &qword_1EBB6BAC8, v42, &qword_1EBB6BAC0);
  sub_1C29159E8(v44, &qword_1EBB6BA90, &qword_1EBB6BAC8, v42, &qword_1EBB6BAC0);
  LOBYTE(v31) = sub_1C2920990();
  unsigned __int8 v47 = sub_1C29209A0();
  char v48 = sub_1C29209C0();
  sub_1C29209C0();
  if (sub_1C29209C0() != v31) {
    char v48 = sub_1C29209C0();
  }
  sub_1C29209C0();
  if (sub_1C29209C0() != v47) {
    char v48 = sub_1C29209C0();
  }
  uint64_t v49 = (uint64_t)v91;
  sub_1C2920740();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  sub_1C2917C90(v30, v49, (uint64_t (*)(void))sub_1C29151E4);
  uint64_t v58 = v49 + *(int *)(v88 + 36);
  *(unsigned char *)uint64_t v58 = v48;
  *(void *)(v58 + 8) = v51;
  *(void *)(v58 + 16) = v53;
  *(void *)(v58 + 24) = v55;
  *(void *)(v58 + 32) = v57;
  *(unsigned char *)(v58 + 40) = 0;
  sub_1C2917CF8(v30, (uint64_t (*)(void))sub_1C29151E4);
  unsigned __int8 v59 = sub_1C29209B0();
  unsigned __int8 v60 = sub_1C29209D0();
  char v61 = sub_1C29209C0();
  sub_1C29209C0();
  if (sub_1C29209C0() != v59) {
    char v61 = sub_1C29209C0();
  }
  sub_1C29209C0();
  if (sub_1C29209C0() != v60) {
    char v61 = sub_1C29209C0();
  }
  sub_1C2920740();
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v70 = v90;
  sub_1C2917C90(v49, v90, (uint64_t (*)(void))sub_1C2915168);
  uint64_t v71 = v70 + *(int *)(v89 + 36);
  *(unsigned char *)uint64_t v71 = v61;
  *(void *)(v71 + 8) = v63;
  *(void *)(v71 + 16) = v65;
  *(void *)(v71 + 24) = v67;
  *(void *)(v71 + 32) = v69;
  *(unsigned char *)(v71 + 40) = 0;
  sub_1C2917CF8(v49, (uint64_t (*)(void))sub_1C2915168);
  uint64_t v72 = v92;
  sub_1C2918058(v70, v92, (uint64_t (*)(void))sub_1C2915148);
  uint64_t v73 = v37;
  sub_1C29180C0(v37, v36, &qword_1EBB6BA30, sub_1C2914F88, (void (*)(uint64_t))sub_1C2915098);
  uint64_t v74 = v93;
  sub_1C2917C90(v72, v93, (uint64_t (*)(void))sub_1C2915148);
  uint64_t v75 = v94;
  sub_1C29180C0(v36, v94, &qword_1EBB6BA30, sub_1C2914F88, (void (*)(uint64_t))sub_1C2915098);
  sub_1C2914EE0();
  uint64_t v77 = v76;
  sub_1C2917C90(v74, v75 + *(int *)(v76 + 48), (uint64_t (*)(void))sub_1C2915148);
  uint64_t v78 = v75 + *(int *)(v77 + 64);
  *(void *)uint64_t v78 = 0;
  *(unsigned char *)(v78 + 8) = 1;
  sub_1C2917CF8(v72, (uint64_t (*)(void))sub_1C2915148);
  sub_1C2917FF8(v73, (uint64_t)&qword_1EBB6BA30, (uint64_t)sub_1C2914F88, (uint64_t)sub_1C2915098, (uint64_t (*)(void))sub_1C2914FC4);
  sub_1C2917CF8(v74, (uint64_t (*)(void))sub_1C2915148);
  return sub_1C2917FF8(v36, (uint64_t)&qword_1EBB6BA30, (uint64_t)sub_1C2914F88, (uint64_t)sub_1C2915098, (uint64_t (*)(void))sub_1C2914FC4);
}

uint64_t sub_1C2913FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[0] = a2;
  uint64_t v4 = sub_1C2920A90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1E4F3DF60];
  sub_1C2914FC4(0, &qword_1EBB6BA10, (void (*)(uint64_t))sub_1C2915038, MEMORY[0x1E4F3DF60]);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v18 - v10;
  id v12 = *(id *)(a1 + 32);
  sub_1C2920A80();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F3EBF8], v4);
  uint64_t v13 = sub_1C2920AA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v18[3] = v13;
  v18[4] = 0;
  __int16 v19 = 257;
  uint64_t v14 = v2 + *(int *)(type metadata accessor for ArticleTileView(0) + 24);
  uint64_t v15 = (void *)(v14 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  uint64_t v16 = v15[1];
  v18[1] = *v15;
  v18[2] = v16;
  swift_bridgeObjectRetain();
  sub_1C2920C50();
  sub_1C2915038();
  sub_1C29182FC();
  sub_1C2920A60();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C29207C0();
  return sub_1C2917FF8((uint64_t)v11, (uint64_t)&qword_1EBB6BA10, (uint64_t)sub_1C2915038, v8, (uint64_t (*)(void))sub_1C2914FC4);
}

uint64_t sub_1C2914278@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v84 = a3;
  uint64_t v87 = sub_1C29155A8;
  uint64_t v88 = sub_1C2915548;
  sub_1C29157EC(0, &qword_1EBB6BA20, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
  uint64_t v82 = v5 - 8;
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v81 = (uint64_t)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v83 = (uint64_t)&v70 - v8;
  sub_1C2915548();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v71 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2914FC4(0, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
  uint64_t v85 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v70 - v12;
  sub_1C2915494();
  uint64_t v80 = v14;
  uint64_t v79 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2915474(0);
  uint64_t v17 = v16 - 8;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v75 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v86 = (uint64_t)&v70 - v20;
  uint64_t v78 = a1;
  uint64_t v21 = a1[1];
  *(void *)&long long v91 = *a1;
  *((void *)&v91 + 1) = v21;
  unint64_t v77 = sub_1C2905214();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1C2920A00();
  uint64_t v24 = v23;
  *(void *)&long long v91 = v22;
  *((void *)&v91 + 1) = v23;
  char v26 = v25 & 1;
  LOBYTE(v92) = v25 & 1;
  *((void *)&v92 + 1) = v27;
  uint64_t v28 = a2 + *(int *)(type metadata accessor for ArticleTileView(0) + 24);
  long long v29 = (uint64_t *)(v28 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 36));
  uint64_t v30 = v29[1];
  uint64_t v89 = *v29;
  uint64_t v90 = v30;
  swift_bridgeObjectRetain();
  sub_1C2920C50();
  uint64_t v31 = (uint64_t)v71;
  sub_1C2920A60();
  swift_bridgeObjectRelease();
  sub_1C2917F90(v22, v24, v26);
  swift_bridgeObjectRelease();
  uint64_t v32 = sub_1C29209F0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v74 = sub_1C2915548;
  sub_1C2917C90(v31, (uint64_t)v13, (uint64_t (*)(void))sub_1C2915548);
  long long v34 = (uint64_t *)&v13[*(int *)(v85 + 36)];
  *long long v34 = KeyPath;
  v34[1] = v32;
  uint64_t v73 = sub_1C2915548;
  sub_1C2917CF8(v31, (uint64_t (*)(void))sub_1C2915548);
  sub_1C2915624();
  uint64_t v35 = v72;
  sub_1C2920A70();
  uint64_t v76 = sub_1C2914FC4;
  sub_1C2917FF8((uint64_t)v13, (uint64_t)&qword_1EBB6BA08, (uint64_t)v88, (uint64_t)v87, (uint64_t (*)(void))sub_1C2914FC4);
  LOBYTE(v32) = sub_1C29209A0();
  sub_1C2920740();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v44 = v79;
  uint64_t v45 = (uint64_t)v75;
  uint64_t v46 = v35;
  unsigned __int8 v47 = v35;
  uint64_t v48 = v80;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v75, v46, v80);
  uint64_t v49 = v45 + *(int *)(v17 + 44);
  *(unsigned char *)uint64_t v49 = v32;
  *(void *)(v49 + 8) = v37;
  *(void *)(v49 + 16) = v39;
  *(void *)(v49 + 24) = v41;
  *(void *)(v49 + 32) = v43;
  *(unsigned char *)(v49 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v48);
  sub_1C2918058(v45, v86, (uint64_t (*)(void))sub_1C2915474);
  uint64_t v50 = v78[3];
  *(void *)&long long v91 = v78[2];
  *((void *)&v91 + 1) = v50;
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_1C2920A00();
  uint64_t v53 = v52;
  LOBYTE(v44) = v54 & 1;
  *(void *)&long long v91 = v51;
  *((void *)&v91 + 1) = v52;
  LOBYTE(v92) = v54 & 1;
  *((void *)&v92 + 1) = v55;
  uint64_t v56 = v29[1];
  uint64_t v89 = *v29;
  uint64_t v90 = v56;
  swift_bridgeObjectRetain();
  sub_1C2920C50();
  sub_1C2920A60();
  swift_bridgeObjectRelease();
  sub_1C2917F90(v51, v53, v44);
  swift_bridgeObjectRelease();
  uint64_t v57 = sub_1C29209E0();
  uint64_t v58 = swift_getKeyPath();
  sub_1C2917C90(v31, (uint64_t)v13, (uint64_t (*)(void))v74);
  unsigned __int8 v59 = (uint64_t *)&v13[*(int *)(v85 + 36)];
  *unsigned __int8 v59 = v58;
  v59[1] = v57;
  sub_1C2917CF8(v31, (uint64_t (*)(void))v73);
  sub_1C2920AE0();
  sub_1C2920760();
  uint64_t v60 = v81;
  uint64_t v62 = (void (*)(uint64_t))v87;
  char v61 = (void (*)(uint64_t))v88;
  sub_1C29180C0((uint64_t)v13, v81, &qword_1EBB6BA08, (void (*)(uint64_t))v88, (void (*)(uint64_t))v87);
  uint64_t v63 = (_OWORD *)(v60 + *(int *)(v82 + 44));
  long long v64 = v92;
  _OWORD *v63 = v91;
  v63[1] = v64;
  v63[2] = v93;
  sub_1C2917FF8((uint64_t)v13, (uint64_t)&qword_1EBB6BA08, (uint64_t)v61, (uint64_t)v62, (uint64_t (*)(void))v76);
  uint64_t v65 = v83;
  sub_1C2918130(v60, v83);
  uint64_t v66 = v86;
  sub_1C2917C90(v86, v45, (uint64_t (*)(void))sub_1C2915474);
  sub_1C29181CC(v65, v60);
  uint64_t v67 = v84;
  sub_1C2917C90(v45, v84, (uint64_t (*)(void))sub_1C2915474);
  sub_1C29153CC();
  sub_1C29181CC(v60, v67 + *(int *)(v68 + 48));
  sub_1C2918268(v65);
  sub_1C2917CF8(v66, (uint64_t (*)(void))sub_1C2915474);
  sub_1C2918268(v60);
  return sub_1C2917CF8(v45, (uint64_t (*)(void))sub_1C2915474);
}

uint64_t sub_1C29149C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v17 = sub_1C29208C0();
  uint64_t v1 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C291532C(0, &qword_1EBB6BAA8, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0, &qword_1EBB6BAD0);
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v16 - v6;
  sub_1C29158B4();
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_1C2920850();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  sub_1C2917E84(0, &qword_1EBB6B9C0, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0);
  sub_1C291362C(v16[1], (uint64_t)&v7[*(int *)(v13 + 44)]);
  unint64_t v14 = sub_1C2915964();
  sub_1C2920A10();
  sub_1C29159E8((uint64_t)v7, &qword_1EBB6BAA8, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0, &qword_1EBB6BAD0);
  sub_1C29208B0();
  uint64_t v19 = v5;
  unint64_t v20 = v14;
  swift_getOpaqueTypeConformance2();
  sub_1C2920A50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1C2914C60()
{
  return sub_1C2920800();
}

uint64_t sub_1C2914C84()
{
  return sub_1C2920800();
}

uint64_t sub_1C2914CA8(uint64_t a1)
{
  sub_1C290D464(0);
  MEMORY[0x1F4188790](v2 - 8);
  sub_1C2917C90(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))sub_1C290D464);
  return sub_1C2920810();
}

void sub_1C2914D48(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t type metadata accessor for ArticleTileView(uint64_t a1)
{
  return sub_1C2900834(a1, (uint64_t *)&unk_1EBB6B978);
}

uint64_t sub_1C2914DCC()
{
  return sub_1C29207E0();
}

uint64_t sub_1C2914DF0()
{
  return sub_1C29207E0();
}

uint64_t sub_1C2914E14(uint64_t a1)
{
  uint64_t v2 = sub_1C29207B0();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1C29207F0();
}

void sub_1C2914EE0()
{
  if (!qword_1EBB6BA38)
  {
    sub_1C2914FC4(255, &qword_1EBB6BA30, sub_1C2914F88, (void (*)(uint64_t))sub_1C2915098);
    sub_1C2915148(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EBB6BA38);
    }
  }
}

void sub_1C2914F88(uint64_t a1)
{
}

void sub_1C2914FC4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    a4(255);
    unint64_t v6 = sub_1C29207D0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_1C2915038()
{
  if (!qword_1EBB6B9F0)
  {
    unint64_t v0 = sub_1C29207D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6B9F0);
    }
  }
}

void sub_1C2915098()
{
  if (!qword_1EBB6B9A8)
  {
    sub_1C29150F4();
    unint64_t v0 = sub_1C2920750();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6B9A8);
    }
  }
}

unint64_t sub_1C29150F4()
{
  unint64_t result = qword_1EBB6BAB8;
  if (!qword_1EBB6BAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BAB8);
  }
  return result;
}

void sub_1C2915148(uint64_t a1)
{
}

void sub_1C2915168(uint64_t a1)
{
}

void sub_1C2915188(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C29207D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1C29151E4()
{
  if (!qword_1EBB6BA88)
  {
    sub_1C2914D48(255, &qword_1EBB6BAE8, (uint64_t (*)(uint64_t))sub_1C2915298, MEMORY[0x1E4F3F108]);
    sub_1C2915850(&qword_1EBB6BAE0, &qword_1EBB6BAE8, (uint64_t (*)(uint64_t))sub_1C2915298);
    unint64_t v0 = sub_1C2920AB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6BA88);
    }
  }
}

void sub_1C2915298()
{
  if (!qword_1EBB6BA98)
  {
    sub_1C291532C(255, &qword_1EBB6BA90, &qword_1EBB6BAC8, (uint64_t (*)(uint64_t))sub_1C29153CC, &qword_1EBB6BAC0);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB6BA98);
    }
  }
}

void sub_1C291532C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  if (!*a2)
  {
    sub_1C2914D48(255, a3, a4, MEMORY[0x1E4F3F108]);
    sub_1C2915850(a5, a3, a4);
    unint64_t v9 = sub_1C2920AC0();
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1C29153CC()
{
  if (!qword_1EBB6B9E0)
  {
    sub_1C2915474(255);
    sub_1C29157EC(255, &qword_1EBB6BA20, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB6B9E0);
    }
  }
}

void sub_1C2915474(uint64_t a1)
{
}

void sub_1C2915494()
{
  if (!qword_1EBB6BA80)
  {
    sub_1C2914FC4(255, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
    sub_1C2915624();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1EBB6BA80);
    }
  }
}

void sub_1C2915548()
{
  if (!qword_1EBB6B9D0)
  {
    sub_1C2920970();
    unint64_t v0 = sub_1C29207D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6B9D0);
    }
  }
}

void sub_1C29155A8()
{
  if (!qword_1EBB6BA68)
  {
    sub_1C2917C44(255, &qword_1EBB6BA70, MEMORY[0x1E4F3E1B0], MEMORY[0x1E4FBB718]);
    unint64_t v0 = sub_1C2920960();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6BA68);
    }
  }
}

unint64_t sub_1C2915624()
{
  unint64_t result = qword_1EBB6BA00;
  if (!qword_1EBB6BA00)
  {
    sub_1C2914FC4(255, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
    sub_1C29156FC();
    sub_1C29157A4(&qword_1EBB6BA60, (void (*)(uint64_t))sub_1C29155A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BA00);
  }
  return result;
}

unint64_t sub_1C29156FC()
{
  unint64_t result = qword_1EBB6B9C8;
  if (!qword_1EBB6B9C8)
  {
    sub_1C2915548();
    sub_1C29157A4(&qword_1EA31C858, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6B9C8);
  }
  return result;
}

uint64_t sub_1C29157A4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C29157EC(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t), void (*a5)(uint64_t))
{
  if (!*a2)
  {
    sub_1C2914FC4(255, a3, a4, a5);
    unint64_t v6 = sub_1C29207D0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1C2915850(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C2914D48(255, a2, a3, MEMORY[0x1E4F3F108]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C29158B4()
{
  if (!qword_1EBB6BA78)
  {
    sub_1C291532C(255, &qword_1EBB6BAA8, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0, &qword_1EBB6BAD0);
    sub_1C2915964();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1EBB6BA78);
    }
  }
}

unint64_t sub_1C2915964()
{
  unint64_t result = qword_1EBB6BAA0;
  if (!qword_1EBB6BAA0)
  {
    sub_1C291532C(255, &qword_1EBB6BAA8, &qword_1EBB6BAD8, (uint64_t (*)(uint64_t))sub_1C2914EE0, &qword_1EBB6BAD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6BAA0);
  }
  return result;
}

uint64_t sub_1C29159E8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  sub_1C291532C(0, a2, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_1C2915A44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ArticleTileView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    unint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1C29208A0();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        sub_1C290D464(0);
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
      *unint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (uint64_t *)((char *)v4 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    sub_1C2914D48(0, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_1C29207B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      void *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (uint64_t *)((char *)v4 + v15);
    uint64_t v37 = a2;
    uint64_t v38 = a3;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15 + 8);
    *uint64_t v16 = *(uint64_t *)((char *)a2 + v15);
    v16[1] = v18;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v15 + 24);
    uint64_t v16[2] = *(uint64_t *)((char *)a2 + v15 + 16);
    v16[3] = v19;
    unint64_t v20 = *(void **)((char *)a2 + v15 + 32);
    v16[4] = v20;
    uint64_t v21 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
    uint64_t v22 = v21[7];
    uint64_t v35 = &v17[v22];
    uint64_t v36 = (char *)v16 + v22;
    uint64_t v23 = sub_1C2920550();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v25 = v20;
    v24(v36, v35, v23);
    *(void *)((char *)v16 + v21[8]) = *(void *)&v17[v21[8]];
    uint64_t v26 = v21[9];
    uint64_t v27 = (void *)((char *)v16 + v26);
    uint64_t v28 = &v17[v26];
    uint64_t v29 = *((void *)v28 + 1);
    void *v27 = *(void *)v28;
    v27[1] = v29;
    uint64_t v30 = *(int *)(v38 + 28);
    uint64_t v31 = (uint64_t *)((char *)v4 + v30);
    uint64_t v32 = (uint64_t *)((char *)v37 + v30);
    uint64_t v33 = v32[1];
    void *v31 = *v32;
    v31[1] = v33;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for ArticleTileView(uint64_t a1, uint64_t a2)
{
  sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1C29208A0();
    uint64_t v5 = *(void *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  sub_1C2914D48(0, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1C29207B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v9 = v8 + *(int *)(type metadata accessor for ArticleTileView.ViewModel(0) + 28);
  uint64_t v10 = sub_1C2920550();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for ArticleTileView(void *a1, void *a2, uint64_t a3)
{
  sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1C29208A0();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      sub_1C290D464(0);
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
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  sub_1C2914D48(0, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_1C29207B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    void *v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)((char *)a2 + v13 + 8);
  *uint64_t v14 = *(void *)((char *)a2 + v13);
  v14[1] = v16;
  uint64_t v17 = *(void *)((char *)a2 + v13 + 24);
  v14[2] = *(void *)((char *)a2 + v13 + 16);
  v14[3] = v17;
  uint64_t v18 = *(void **)((char *)a2 + v13 + 32);
  v14[4] = v18;
  uint64_t v19 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  uint64_t v20 = v19[7];
  uint64_t v33 = &v15[v20];
  long long v34 = (char *)v14 + v20;
  uint64_t v21 = sub_1C2920550();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = v18;
  v22(v34, v33, v21);
  *(void *)((char *)v14 + v19[8]) = *(void *)&v15[v19[8]];
  uint64_t v24 = v19[9];
  id v25 = (void *)((char *)v14 + v24);
  uint64_t v26 = &v15[v24];
  uint64_t v27 = *((void *)v26 + 1);
  *id v25 = *(void *)v26;
  v25[1] = v27;
  uint64_t v28 = *(int *)(v36 + 28);
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (void *)((char *)v35 + v28);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ArticleTileView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
    sub_1C2917FF8((uint64_t)a1, (uint64_t)&qword_1EBB6B9A0, (uint64_t)sub_1C290D464, MEMORY[0x1E4F3C648], (uint64_t (*)(void))sub_1C2914D48);
    sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, v6);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1C29208A0();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        sub_1C290D464(0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3CB98];
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
    sub_1C2917FF8((uint64_t)a1 + v10, (uint64_t)&qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648], (uint64_t (*)(void))sub_1C2914D48);
    sub_1C2914D48(0, &qword_1EBB6B998, v13, v14);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_1C29207B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v11, v12, v15);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  void *v17 = *(void *)((char *)a2 + v16);
  v17[1] = *(void *)((char *)a2 + v16 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17[2] = v18[2];
  v17[3] = v18[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)v18[4];
  uint64_t v20 = (void *)v17[4];
  v17[4] = v19;
  id v21 = v19;

  uint64_t v22 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  uint64_t v23 = v22[7];
  uint64_t v24 = (char *)v17 + v23;
  id v25 = (char *)v18 + v23;
  uint64_t v26 = sub_1C2920550();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  *(void *)((char *)v17 + v22[8]) = *(void *)((char *)v18 + v22[8]);
  swift_retain();
  swift_release();
  uint64_t v27 = v22[9];
  uint64_t v28 = (void *)((char *)v17 + v27);
  uint64_t v29 = (void *)((char *)v18 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[7];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  void *v31 = *v32;
  v31[1] = v32[1];
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for ArticleTileView(char *a1, char *a2, int *a3)
{
  sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_1C29208A0();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      sub_1C290D464(0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  sub_1C2914D48(0, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  uint64_t v15 = v14;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_1C29207B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v12, v13, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  uint64_t v17 = a3[6];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  long long v20 = *(_OWORD *)&a2[v17 + 16];
  *(_OWORD *)uint64_t v18 = *(_OWORD *)&a2[v17];
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v18 + 4) = *(void *)&a2[v17 + 32];
  id v21 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  uint64_t v22 = v21[7];
  uint64_t v23 = &v18[v22];
  uint64_t v24 = &v19[v22];
  uint64_t v25 = sub_1C2920550();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
  *(void *)&v18[v21[8]] = *(void *)&v19[v21[8]];
  *(_OWORD *)&v18[v21[9]] = *(_OWORD *)&v19[v21[9]];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *assignWithTake for ArticleTileView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
    sub_1C2917FF8((uint64_t)a1, (uint64_t)&qword_1EBB6B9A0, (uint64_t)sub_1C290D464, MEMORY[0x1E4F3C648], (uint64_t (*)(void))sub_1C2914D48);
    sub_1C2914D48(0, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, v6);
    uint64_t v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1C29208A0();
      uint64_t v10 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
      {
        sub_1C290D464(0);
        memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v10 + 32))(a1, a2, v9);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    uint64_t v12 = a3[5];
    uint64_t v13 = &a1[v12];
    uint64_t v14 = &a2[v12];
    uint64_t v15 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3CB98];
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
    sub_1C2917FF8((uint64_t)&a1[v12], (uint64_t)&qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648], (uint64_t (*)(void))sub_1C2914D48);
    sub_1C2914D48(0, &qword_1EBB6B998, v15, v16);
    uint64_t v18 = v17;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_1C29207B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v13, v14, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[6];
  id v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = *(void *)&a2[v20 + 8];
  *(void *)id v21 = *(void *)&a2[v20];
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *((void *)v22 + 3);
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)*((void *)v21 + 4);
  *((void *)v21 + 4) = *((void *)v22 + 4);

  uint64_t v26 = (int *)type metadata accessor for ArticleTileView.ViewModel(0);
  uint64_t v27 = v26[7];
  uint64_t v28 = &v21[v27];
  uint64_t v29 = &v22[v27];
  uint64_t v30 = sub_1C2920550();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  *(void *)&v21[v26[8]] = *(void *)&v22[v26[8]];
  swift_release();
  uint64_t v31 = v26[9];
  uint64_t v32 = &v21[v31];
  uint64_t v33 = &v22[v31];
  uint64_t v35 = *(void *)v33;
  uint64_t v34 = *((void *)v33 + 1);
  *(void *)uint64_t v32 = v35;
  *((void *)v32 + 1) = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[7];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v40 = *(void *)v38;
  uint64_t v39 = *((void *)v38 + 1);
  *(void *)uint64_t v37 = v40;
  *((void *)v37 + 1) = v39;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleTileView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2916E68);
}

uint64_t sub_1C2916E68(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1C2914D48(0, &qword_1EA31C860, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C658]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  sub_1C2914D48(0, &qword_1EA31C868, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C658]);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = type metadata accessor for ArticleTileView.ViewModel(0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7] + 8);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticleTileView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2917040);
}

uint64_t sub_1C2917040(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1C2914D48(0, &qword_1EA31C860, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C658]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    sub_1C2914D48(0, &qword_1EA31C868, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C658]);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = type metadata accessor for ArticleTileView.ViewModel(0);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7] + 8) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1C2917200()
{
  sub_1C2914D48(319, &qword_1EBB6B9A0, (uint64_t (*)(uint64_t))sub_1C290D464, MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1C2914D48(319, &qword_1EBB6B998, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for ArticleTileView.ViewModel(319);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ArticleTileView.ViewModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = (void *)a2[4];
    uint64_t v10 = a3[7];
    id v21 = (char *)a1 + v10;
    uint64_t v11 = (char *)a2 + v10;
    a1[4] = (uint64_t)v9;
    uint64_t v12 = sub_1C2920550();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v14 = v9;
    v13(v21, v11, v12);
    uint64_t v15 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    unint64_t v16 = (uint64_t *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *unint64_t v16 = *v17;
    v16[1] = v18;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ArticleTileView.ViewModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1C2920550();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ArticleTileView.ViewModel(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = (void *)a2[4];
  a1[4] = v8;
  uint64_t v9 = a3[7];
  uint64_t v19 = (char *)a1 + v9;
  uint64_t v10 = (char *)a2 + v9;
  uint64_t v11 = sub_1C2920550();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = v8;
  v12(v19, v10, v11);
  uint64_t v14 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  uint64_t v15 = (void *)((char *)a1 + v14);
  unint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ArticleTileView.ViewModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[4];
  uint64_t v7 = (void *)a1[4];
  a1[4] = v6;
  id v8 = v6;

  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1C2920550();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ArticleTileView.ViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C2920550();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

void *assignWithTake for ArticleTileView.ViewModel(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)a1[4];
  a1[4] = a2[4];

  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1C2920550();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_release();
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleTileView.ViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2917918);
}

uint64_t sub_1C2917918(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1C2920550();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ArticleTileView.ViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C29179DC);
}

uint64_t sub_1C29179DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C2920550();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1C2917A84()
{
  uint64_t result = sub_1C2920550();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C2917B3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1C2917BF0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1C2920580();
  *a1 = v3;
  return result;
}

uint64_t sub_1C2917C1C()
{
  return sub_1C2920590();
}

void sub_1C2917C44(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C2917C90(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2917CF8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C2917D58(uint64_t a1, uint64_t a2)
{
  sub_1C2914FC4(0, &qword_1EBB6BA30, sub_1C2914F88, (void (*)(uint64_t))sub_1C2915098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1C2917DEC()
{
  if (!qword_1EBB6B9B0)
  {
    sub_1C2914D48(255, &qword_1EBB6BAE8, (uint64_t (*)(uint64_t))sub_1C2915298, MEMORY[0x1E4F3F108]);
    unint64_t v0 = sub_1C2920770();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB6B9B0);
    }
  }
}

void sub_1C2917E84(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_1C2914D48(255, a3, a4, MEMORY[0x1E4F3F108]);
    unint64_t v5 = sub_1C2920770();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C2917F00(uint64_t a1, uint64_t a2)
{
  sub_1C291532C(0, &qword_1EBB6BA90, &qword_1EBB6BAC8, (uint64_t (*)(uint64_t))sub_1C29153CC, &qword_1EBB6BAC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2917F90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C2917FA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C2920820();
  *a1 = result;
  return result;
}

uint64_t sub_1C2917FCC()
{
  return sub_1C2920830();
}

uint64_t sub_1C2917FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_1C2918058(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C29180C0(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t), void (*a5)(uint64_t))
{
  sub_1C2914FC4(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_1C2918130(uint64_t a1, uint64_t a2)
{
  sub_1C29157EC(0, &qword_1EBB6BA20, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C29181CC(uint64_t a1, uint64_t a2)
{
  sub_1C29157EC(0, &qword_1EBB6BA20, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2918268(uint64_t a1)
{
  sub_1C29157EC(0, &qword_1EBB6BA20, &qword_1EBB6BA08, (void (*)(uint64_t))sub_1C2915548, (void (*)(uint64_t))sub_1C29155A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C29182FC()
{
  unint64_t result = qword_1EBB6B9E8;
  if (!qword_1EBB6B9E8)
  {
    sub_1C2915038();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB6B9E8);
  }
  return result;
}

uint64_t PluginArticleTileDataController.makeArticleComponents(articleIdentifier:viewContext:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_1C29206F0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(long long *__return_ptr, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(&v26, a1, a2, a3, a4, a5);
  if (v27)
  {
    sub_1C290C8DC(&v26, v28);
    uint64_t v14 = v29;
    uint64_t v15 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  else
  {
    sub_1C2918660((uint64_t)&v26);
    sub_1C29206B0();
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_1C29206E0();
    os_log_type_t v18 = sub_1C2920DD0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(void *)&long long v26 = a4;
      v28[0] = v25;
      *(_DWORD *)uint64_t v19 = 136446466;
      uint64_t v24 = v19 + 4;
      swift_getMetatypeMetadata();
      uint64_t v20 = sub_1C2920BF0();
      *(void *)&long long v26 = sub_1C2911820(v20, v21, v28);
      sub_1C2920F20();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v26 = sub_1C2911820(a1, a2, v28);
      sub_1C2920F20();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C28F8000, v17, v18, "[%{public}s] Unable to find data provider for article with identifier %s.", (uint8_t *)v19, 0x16u);
      uint64_t v22 = v25;
      swift_arrayDestroy();
      MEMORY[0x1C8762070](v22, -1, -1);
      MEMORY[0x1C8762070](v19, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return 0;
  }
  return v16;
}

uint64_t sub_1C2918660(uint64_t a1)
{
  sub_1C29188D0(0, &qword_1EA31C768, (uint64_t (*)(uint64_t))sub_1C290C7B0, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1C29186F4(void *a1)
{
  sub_1C29188D0(0, &qword_1EA31C870, (uint64_t (*)(uint64_t))sub_1C2918934, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2921D10;
  *(void *)(inited + 32) = 0xD000000000000015;
  *(void *)(inited + 40) = 0x80000001C2923B60;
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  *(void *)(inited + 48) = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  *(void *)(inited + 56) = v5;
  unint64_t v6 = sub_1C29112A4(inited);
  if (qword_1EBB6BD00 != -1) {
    swift_once();
  }
  id v7 = (id)qword_1EBB6BCF8;
  sub_1C2910838(v6);
  swift_bridgeObjectRelease();
  id v8 = objc_allocWithZone((Class)sub_1C2920530());
  uint64_t v9 = (void *)sub_1C2920520();
  sub_1C2918998();
  uint64_t v10 = (void *)sub_1C2920E00();
  objc_msgSend(v10, sel_addOperation_, v9);
}

uint64_t dispatch thunk of PluginArticleTileDataController.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PluginArticleTileDataController.makeArticleDataProvider(articleIdentifier:viewContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of PluginArticleTileDataController.makeArticleComponents(articleIdentifier:viewContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of PluginArticleTileDataController.notifyPluginThatUserStartedReadingArticle(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void sub_1C29188D0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1C2918934()
{
  if (!qword_1EA31C878)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA31C878);
    }
  }
}

unint64_t sub_1C2918998()
{
  unint64_t result = qword_1EA31C880;
  if (!qword_1EA31C880)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C880);
  }
  return result;
}

id sub_1C29189D8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14D0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_systemBlueColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v3);

  id v4 = objc_msgSend(v2, sel_titleLabel);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_setAdjustsFontForContentSizeCategory_, 1);
  }
  id v6 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v6, sel_setCornerRadius_, 14.0);

  id v7 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v7, sel_setMasksToBounds_, 1);

  return v2;
}

char *sub_1C2918B1C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button;
  uint64_t v10 = v4;
  *(void *)&v4[v9] = sub_1C29189D8();
  uint64_t v11 = &v10[OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;

  v21.receiver = v10;
  v21.super_class = (Class)type metadata accessor for ButtonView();
  uint64_t v12 = (char *)objc_msgSendSuper2(&v21, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_setPreservesSuperviewLayoutMargins_, 1);
  uint64_t v13 = OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button;
  uint64_t v14 = *(void **)&v12[OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button];
  objc_msgSend(v12, sel_addSubview_, v14);
  uint64_t v15 = self;
  uint64_t v16 = v12;
  id v17 = v14;
  sub_1C290D96C(v17, v16, 0x4049000000000000, 0);

  sub_1C28FBAF4();
  os_log_type_t v18 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_activateConstraints_, v18);

  id v19 = *(id *)&v12[v13];
  objc_msgSend(v19, sel_addTarget_action_forControlEvents_, v16, sel_performActionWithSender_, 64);

  return v16;
}

id sub_1C2918DFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ButtonView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ButtonView()
{
  return self;
}

uint64_t sub_1C2918EA4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t ArticleTapAnalyticsEvent.init(article:articleLocation:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = sub_1C2920550();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 48))(v10, v11);
  unint64_t v13 = sub_1C29195D8(v12);
  swift_bridgeObjectRelease();
  uint64_t v14 = a1[3];
  uint64_t v15 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  ArticleTapAnalyticsEvent.init(didTapArticle:associatedHKTypes:articleTitle:articleLocation:)(1, v13, (uint64_t)v9, v18);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  long long v16 = v18[1];
  *a3 = v18[0];
  a3[1] = v16;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t static ArticleTapAnalyticsEvent.eventName.getter()
{
  return 0xD000000000000026;
}

id ArticleTapAnalyticsEvent.articleDidClick.getter()
{
  return *v0;
}

uint64_t ArticleTapAnalyticsEvent.articleHKDataTypes.getter()
{
  return swift_bridgeObjectRetain();
}

id ArticleTapAnalyticsEvent.articleTitle.getter()
{
  return *(id *)(v0 + 16);
}

id ArticleTapAnalyticsEvent.articleLocation.getter()
{
  return *(id *)(v0 + 24);
}

HealthArticlesUI::ArticleTapAnalyticsEvent __swiftcall ArticleTapAnalyticsEvent.init(articleDidClick:articleHKDataTypes:articleTitle:articleLocation:)(NSNumber articleDidClick, Swift::OpaquePointer articleHKDataTypes, NSString articleTitle, NSString articleLocation)
{
  *(NSNumber *)uint64_t v4 = articleDidClick;
  *(Swift::OpaquePointer *)(v4 + 8) = articleHKDataTypes;
  *(void *)(v4 + 16) = articleTitle;
  *(void *)(v4 + 24) = articleLocation;
  result.articleLocation = articleLocation;
  result.articleTitle = articleTitle;
  result.articleHKDataTypes = articleHKDataTypes;
  result.articleDidClick = articleDidClick;
  return result;
}

id ArticleTapAnalyticsEvent.init(didTapArticle:associatedHKTypes:articleTitle:articleLocation:)@<X0>(char a1@<W0>, unint64_t a2@<X1>, uint64_t a3@<X4>, void *a4@<X8>)
{
  LOBYTE(v6) = a1;
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8)
  {
    while (1)
    {
      uint64_t v19 = MEMORY[0x1E4FBC860];
      id result = (id)sub_1C2921020();
      if (v8 < 0) {
        break;
      }
      char v17 = v6;
      uint64_t v18 = a3;
      a3 = 0;
      while (v8 != a3)
      {
        if ((a2 & 0xC000000000000001) != 0) {
          id v10 = (id)MEMORY[0x1C87617C0](a3, a2);
        }
        else {
          id v10 = *(id *)(a2 + 8 * a3 + 32);
        }
        uint64_t v11 = v10;
        id result = objc_msgSend(v10, sel_identifier);
        if (!result) {
          goto LABEL_17;
        }
        ++a3;

        sub_1C2921000();
        uint64_t v6 = *(void *)(v19 + 16);
        sub_1C2921030();
        sub_1C2921040();
        sub_1C2921010();
        if (v8 == a3)
        {
          uint64_t v12 = v19;
          swift_bridgeObjectRelease();
          a3 = v18;
          LOBYTE(v6) = v17;
          goto LABEL_15;
        }
      }
      __break(1u);
LABEL_13:
      uint64_t v8 = sub_1C2921070();
      if (!v8) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v12 = MEMORY[0x1E4FBC860];
LABEL_15:
    id v13 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v6 & 1);
    uint64_t v14 = sub_1C2920BB0();
    swift_bridgeObjectRelease();
    sub_1C29196D0();
    sub_1C2920500();
    uint64_t v15 = sub_1C2920BB0();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1C2920550();
    id result = (id)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a3, v16);
    *a4 = v13;
    a4[1] = v12;
    a4[2] = v14;
    a4[3] = v15;
  }
  return result;
}

unint64_t sub_1C29192D0()
{
  return 0xD000000000000026;
}

void *sub_1C29192EC(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_1C2920F80();
    sub_1C29199F0();
    sub_1C2919A30();
    id result = (void *)sub_1C2920DB0();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_1C2920FA0()) {
        goto LABEL_45;
      }
      sub_1C29199F0();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v15 = v26;
      id result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    id result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1C29195D8(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_1C2920F90();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_3:
  if (v2 <= 0)
  {
    id v3 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    sub_1C2909864();
    id v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1C29192EC(&v8, v3 + 4, v2, a1);
  uint64_t result = sub_1C29121CC();
  if (v6 == (void *)v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

unint64_t sub_1C29196D0()
{
  unint64_t result = qword_1EA31C898;
  if (!qword_1EA31C898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C898);
  }
  return result;
}

unint64_t sub_1C2919728()
{
  unint64_t result = qword_1EA31C8A0;
  if (!qword_1EA31C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C8A0);
  }
  return result;
}

unint64_t sub_1C2919780()
{
  unint64_t result = qword_1EA31C8A8;
  if (!qword_1EA31C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C8A8);
  }
  return result;
}

void destroy for ArticleTapAnalyticsEvent(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for ArticleTapAnalyticsEvent(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  id v8 = v5;
  id v9 = v6;
  return a1;
}

uint64_t assignWithCopy for ArticleTapAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  int64_t v10 = *(void **)(a2 + 24);
  unint64_t v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  id v12 = v10;

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

uint64_t assignWithTake for ArticleTapAnalyticsEvent(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();

  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleTapAnalyticsEvent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleTapAnalyticsEvent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleTapAnalyticsEvent()
{
  return &type metadata for ArticleTapAnalyticsEvent;
}

unint64_t sub_1C29199F0()
{
  unint64_t result = qword_1EA31C8B0;
  if (!qword_1EA31C8B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA31C8B0);
  }
  return result;
}

unint64_t sub_1C2919A30()
{
  unint64_t result = qword_1EA31C8B8;
  if (!qword_1EA31C8B8)
  {
    sub_1C29199F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C8B8);
  }
  return result;
}

void sub_1C2919B38(void *a1, char a2)
{
  uint64_t v4 = *(void **)&v2[OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView];
  *(void *)&v2[OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView] = a1;
  id v5 = a1;

  objc_msgSend(v2, sel_setPreservesSuperviewLayoutMargins_, 1);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_addSubview_, v5);
  id v6 = self;
  uint64_t v7 = OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_currentConstraints;
  sub_1C28FBAF4();
  swift_bridgeObjectRetain();
  id v8 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_deactivateConstraints_, v8);

  if (a2) {
    uint64_t v9 = sub_1C290DC8C(v5, v2, 0, 1);
  }
  else {
    uint64_t v9 = sub_1C290DF7C(v5, v2, 0, 1);
  }
  *(void *)&v2[v7] = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v10 = (id)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_activateConstraints_, v10);
}

id sub_1C2919CA4()
{
  return sub_1C2919FAC(type metadata accessor for CustomContentView);
}

uint64_t type metadata accessor for CustomContentView()
{
  return self;
}

void sub_1C2919DE8(char *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  *(void *)&a1[*a4] = 0;
  *(void *)&a1[*a5] = a6;
  id v7 = a3;

  sub_1C2921060();
  __break(1u);
}

void sub_1C2919E64(void *a1)
{
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController];
  *(void *)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController] = a1;
  id v3 = a1;

  id v4 = objc_msgSend(v3, sel_view);
  if (v4)
  {
    id v5 = *(void **)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView];
    *(void *)&v1[OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView] = v4;
    id v6 = v4;

    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v1, sel_addSubview_, v6);
    id v7 = self;
    sub_1C290DC8C(v6, v1, 0, 1);
    sub_1C28FBAF4();
    id v8 = (id)sub_1C2920CB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_activateConstraints_, v8);
  }
}

id sub_1C2919F94()
{
  return sub_1C2919FAC(type metadata accessor for CustomContentViewControllerView);
}

id sub_1C2919FAC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for CustomContentViewControllerView()
{
  return self;
}

uint64_t sub_1C291A058@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    id v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t VideoViewOptions.rawValue.getter()
{
  return *(void *)v0;
}

HealthArticlesUI::VideoViewOptions __swiftcall VideoViewOptions.init(rawValue:)(HealthArticlesUI::VideoViewOptions rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static VideoViewOptions.noControls.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static VideoViewOptions.noLooping.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static VideoViewOptions.noAutoplay.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static VideoViewOptions.noMargins.getter(void *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_1C291A0F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1C291A058(a1, a2);
}

uint64_t sub_1C291A194()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C291A268(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C291A2C8(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C291A334())()
{
  return j__swift_endAccess;
}

id sub_1C291A390()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel);
  }
  else
  {
    id v4 = sub_1C291A3F0();
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1C291A3F0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  id v1 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28D8]);
  objc_msgSend(v0, sel_setFont_, v1);

  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v2 = objc_msgSend(self, sel_secondaryLabelColor);
  objc_msgSend(v0, sel_setTextColor_, v2);

  return v0;
}

id sub_1C291A4F8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = &v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  id v10 = &v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode];
  *(void *)id v10 = 0;
  v10[8] = 1;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper] = 0;
  unint64_t v11 = &v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription];
  *unint64_t v11 = 0;
  v11[1] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel] = 0;
  v4[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible] = 1;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for VideoView();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_setPreservesSuperviewLayoutMargins_, 1);
  return v12;
}

uint64_t sub_1C291A644(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v60 = a8;
  uint64_t v58 = a5;
  uint64_t v59 = a7;
  uint64_t v61 = a4;
  uint64_t v62 = a6;
  uint64_t v57 = a3;
  uint64_t v10 = sub_1C2920B00();
  uint64_t v63 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v66 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_1C2920B20();
  uint64_t v65 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790](v67);
  long long v64 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C2920B40();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v70 = v13;
  uint64_t v71 = v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  unint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v68 = (char *)&v49 - v18;
  sub_1C291B2B0(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v21 = (char *)&v49 - v20;
  uint64_t v22 = sub_1C2920470();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  uint64_t v25 = MEMORY[0x1F4188790](v22);
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v49 - v26;
  uint64_t v56 = *a2;
  sub_1C291AD18(a1, (uint64_t)v21);
  uint64_t v28 = v23;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1) {
    return sub_1C291F4DC((uint64_t)v21, (uint64_t)&qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C291B2B0);
  }
  uint64_t v55 = v10;
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  uint64_t v53 = v27;
  uint64_t v30 = v22;
  v50(v27, v21, v22);
  sub_1C29061E8(0, &qword_1EA31C8E8);
  uint64_t v51 = sub_1C2920E30();
  sub_1C2920B30();
  MEMORY[0x1C8761330](v17, 0.1);
  unint64_t v31 = *(void (**)(char *, uint64_t))(v71 + 8);
  v71 += 8;
  char v54 = v31;
  v31(v17, v70);
  uint64_t v52 = v28;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v22);
  unint64_t v32 = (*(unsigned __int8 *)(v28 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v49 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v33 = (v24 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v61;
  uint64_t v38 = v62;
  *(void *)(v36 + 16) = v69;
  v50((char *)(v36 + v32), v49, v30);
  *(void *)(v36 + v33) = v56;
  uint64_t v39 = (void *)(v36 + v34);
  *uint64_t v39 = v57;
  v39[1] = v37;
  uint64_t v40 = (void *)(v36 + v35);
  void *v40 = v58;
  v40[1] = v38;
  unint64_t v41 = v36 + ((v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v41 = v59;
  *(unsigned char *)(v41 + 8) = v60 & 1;
  aBlock[4] = sub_1C291B17C;
  aBlock[5] = v36;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C28FE634;
  aBlock[3] = &block_descriptor_1;
  uint64_t v42 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v43 = v69;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v44 = v64;
  sub_1C2920B10();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1C291B258();
  sub_1C291B2B0(0, &qword_1EA31C8F8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C291B314();
  uint64_t v45 = v66;
  uint64_t v46 = v55;
  sub_1C2920F70();
  unsigned __int8 v47 = v68;
  uint64_t v48 = (void *)v51;
  MEMORY[0x1C8761600](v68, v44, v45, v42);
  _Block_release(v42);

  (*(void (**)(char *, uint64_t))(v63 + 8))(v45, v46);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v44, v67);
  v54(v47, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v53, v30);
}

uint64_t sub_1C291AD18(uint64_t a1, uint64_t a2)
{
  sub_1C291B2B0(0, &qword_1EA31C570, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C291ADAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v41 = a6;
  uint64_t v42 = a8;
  uint64_t v36 = a7;
  uint64_t v34 = a5;
  uint64_t v38 = a3;
  uint64_t v39 = a4;
  int v40 = a9;
  uint64_t v11 = sub_1C2920470();
  uint64_t v35 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C291B2B0(0, &qword_1EA31C9B0, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = sub_1C2920D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v11);
  sub_1C2920D30();
  swift_bridgeObjectRetain();
  id v18 = a1;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1C2920D20();
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = (char *)swift_allocObject();
  uint64_t v25 = MEMORY[0x1E4FBCFD8];
  *((void *)v24 + 2) = v19;
  *((void *)v24 + 3) = v25;
  *((void *)v24 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v24[v20], v37, v35);
  uint64_t v26 = v39;
  *(void *)&v24[v21] = v38;
  uint64_t v27 = &v24[v22];
  uint64_t v28 = v34;
  *(void *)uint64_t v27 = v26;
  *((void *)v27 + 1) = v28;
  uint64_t v29 = &v24[v23];
  uint64_t v30 = v36;
  *(void *)uint64_t v29 = v41;
  *((void *)v29 + 1) = v30;
  unint64_t v31 = &v24[(v23 + 23) & 0xFFFFFFFFFFFFFFF8];
  *(void *)unint64_t v31 = v42;
  v31[8] = v40 & 1;
  sub_1C291B650((uint64_t)v16, (uint64_t)&unk_1EA31C9C0, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_1C291B06C()
{
  uint64_t v1 = sub_1C2920470();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, ((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 9, v5);
}

uint64_t sub_1C291B17C()
{
  uint64_t v1 = *(void *)(sub_1C2920470() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_1C291ADAC(*(void **)(v0 + 16), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v5), *(void *)(v0 + v5 + 8), *(void *)(v0 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(unsigned char *)(v0 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
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

unint64_t sub_1C291B258()
{
  unint64_t result = qword_1EA31C8F0;
  if (!qword_1EA31C8F0)
  {
    sub_1C2920B00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C8F0);
  }
  return result;
}

void sub_1C291B2B0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1C291B314()
{
  unint64_t result = qword_1EA31C900;
  if (!qword_1EA31C900)
  {
    sub_1C291B2B0(255, &qword_1EA31C8F8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C900);
  }
  return result;
}

uint64_t sub_1C291B39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = sub_1C2920D30();
  v8[4] = sub_1C2920D20();
  void v8[2] = a6;
  uint64_t v13 = (void *)swift_task_alloc();
  v8[5] = (uint64_t)v13;
  void *v13 = v8;
  v13[1] = sub_1C291B4B4;
  return sub_1C291B838(a5, v8 + 2, a7, a8, v16, v17, v18, v19 & 1);
}

uint64_t sub_1C291B4B4()
{
  swift_task_dealloc();
  uint64_t v1 = sub_1C2920D10();
  return MEMORY[0x1F4188298](sub_1C291B5F0, v1, v0);
}

uint64_t sub_1C291B5F0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C291B650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2920D50();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1C2920D40();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1C291F4DC(a1, (uint64_t)&unk_1EA31C9B0, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C291B2B0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2920D10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C291B838(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(v9 + 272) = a8;
  *(void *)(v9 + 200) = a6;
  *(void *)(v9 + 208) = a7;
  *(void *)(v9 + 184) = a4;
  *(void *)(v9 + 192) = a5;
  *(void *)(v9 + 168) = a1;
  *(void *)(v9 + 176) = a3;
  uint64_t v10 = *a2;
  *(void *)(v9 + 216) = v8;
  *(void *)(v9 + 224) = v10;
  sub_1C2920D30();
  *(void *)(v9 + 232) = sub_1C2920D20();
  uint64_t v12 = sub_1C2920D10();
  *(void *)(v9 + 240) = v12;
  *(void *)(v9 + 248) = v11;
  return MEMORY[0x1F4188298](sub_1C291B8E4, v12, v11);
}

uint64_t sub_1C291B8E4()
{
  uint64_t v30 = v0;
  uint64_t v1 = *(void **)(v0 + 184);
  id v2 = sub_1C291A390();
  if (v1) {
    uint64_t v1 = (void *)sub_1C2920BB0();
  }
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 224);
  char v5 = *(unsigned char *)(v0 + 272);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 200);
  objc_msgSend(v2, sel_setText_, v1);

  uint64_t v8 = (void *)(v3 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  char v9 = 1;
  swift_beginAccess();
  *uint64_t v8 = v7;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible) = (v4 & 5) != 4;
  if (v5)
  {
    double v13 = 0.0;
  }
  else
  {
    double v10 = *(double *)(v0 + 208);
    double v11 = 1.0;
    if (v10 <= 1.0) {
      double v11 = *(double *)(v0 + 208);
    }
    BOOL v12 = v10 <= 0.0;
    if (v10 > 0.0) {
      double v13 = v11;
    }
    else {
      double v13 = 0.0;
    }
    char v9 = v12;
  }
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 216) + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode;
  *(double *)uint64_t v15 = v13;
  *(unsigned char *)(v15 + 8) = v9;
  if (v4)
  {
    BOOL v20 = (v14 & 2) == 0;
    uint64_t v21 = *(void *)(v0 + 224);
    uint64_t v22 = *(void *)(v0 + 216);
    swift_release();
    unint64_t v23 = (void *)sub_1C2920450();
    id v24 = objc_msgSend(self, sel_playerViewWithURL_looping_, v23, v20);

    id v25 = sub_1C291A390();
    uint64_t v29 = v21;
    sub_1C291BE24(v24, v25, &v29);

    *(void *)(v0 + 80) = sub_1C29061E8(0, &qword_1EA31C9A8);
    *(void *)(v0 + 88) = &off_1F1DE5DC0;
    *(void *)(v0 + 56) = v24;
    uint64_t v26 = v22 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    id v27 = v24;
    sub_1C291F010(v0 + 56, v26);
    swift_endAccess();
    if ((v4 & 4) == 0) {
      objc_msgSend(v27, sel_play);
    }

    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
  else
  {
    char v16 = (v14 & 2) == 0;
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v17;
    void *v17 = v0;
    v17[1] = sub_1C291BBD0;
    uint64_t v18 = *(void *)(v0 + 168);
    return sub_1C291C364(v18, v16);
  }
}

uint64_t sub_1C291BBD0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 264) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 248);
  uint64_t v4 = *(void *)(v2 + 240);
  return MEMORY[0x1F4188298](sub_1C291BCF8, v4, v3);
}

id sub_1C291BCF8()
{
  BOOL v12 = v0;
  uint64_t v1 = (void *)v0[33];
  swift_release();
  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)v0[33];
    uint64_t v5 = v0[27];
    uint64_t v6 = v0[28];
    id v7 = sub_1C291A390();
    uint64_t v11 = v6;
    sub_1C291BE24(v3, v7, &v11);

    v0[5] = type metadata accessor for HKAVPlayerViewController();
    v0[6] = &off_1F1DE5E98;
    v0[2] = v4;
    uint64_t v8 = v5 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    id v9 = v4;
    sub_1C291F010((uint64_t)(v0 + 2), v8);
    swift_endAccess();

    double v10 = (uint64_t (*)(void))v0[1];
    return (id)v10();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C291BE24(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = v3;
  if ((*a3 & 8) != 0)
  {
    id v37 = objc_msgSend(v4, sel_leftAnchor);
    id v35 = objc_msgSend(v4, sel_rightAnchor);
    id v34 = objc_msgSend(v4, sel_leadingAnchor);
    id v36 = objc_msgSend(v4, sel_trailingAnchor);
  }
  else
  {
    id v7 = objc_msgSend(v4, sel_layoutMarginsGuide);
    id v37 = objc_msgSend(v7, sel_leftAnchor);

    id v8 = objc_msgSend(v4, sel_layoutMarginsGuide);
    id v35 = objc_msgSend(v8, (SEL)&off_1E64589D8 + 4);

    id v9 = objc_msgSend(v4, sel_layoutMarginsGuide);
    id v34 = objc_msgSend(v9, sel_leadingAnchor);

    id v10 = objc_msgSend(v4, sel_layoutMarginsGuide);
    id v36 = objc_msgSend(v10, sel_trailingAnchor);
  }
  objc_msgSend(v4, sel_addSubview_, a2);
  objc_msgSend(v4, sel_addSubview_, a1);
  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(a1, sel_hk_maskAllCornersWithRadius_, 4.0);
  id v33 = self;
  sub_1C291ED0C(0, (unint64_t *)&qword_1EA31C740, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1C2923220;
  id v12 = objc_msgSend(a1, sel_topAnchor);
  id v13 = objc_msgSend(v4, sel_layoutMarginsGuide);
  id v14 = objc_msgSend(v13, sel_topAnchor);

  id v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(void *)(v11 + 32) = v15;
  id v16 = objc_msgSend(a1, sel_leftAnchor);
  id v17 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v37);

  *(void *)(v11 + 40) = v17;
  id v18 = objc_msgSend(a1, sel_rightAnchor);
  id v19 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v35);

  *(void *)(v11 + 48) = v19;
  id v20 = objc_msgSend(a2, sel_topAnchor);
  id v21 = objc_msgSend(a1, sel_bottomAnchor);
  id v22 = objc_msgSend(v20, sel_constraintEqualToSystemSpacingBelowAnchor_multiplier_, v21, 1.0);

  *(void *)(v11 + 56) = v22;
  id v23 = objc_msgSend(a2, sel_leadingAnchor);
  id v24 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v34);

  *(void *)(v11 + 64) = v24;
  id v25 = objc_msgSend(a2, sel_trailingAnchor);
  id v26 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v36);

  *(void *)(v11 + 72) = v26;
  id v27 = objc_msgSend(a2, sel_bottomAnchor);
  id v28 = objc_msgSend(v4, sel_layoutMarginsGuide);
  id v29 = objc_msgSend(v28, sel_bottomAnchor);

  id v30 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v29);
  *(void *)(v11 + 80) = v30;
  sub_1C2920CD0();
  sub_1C29061E8(0, (unint64_t *)&qword_1EBB6BB08);
  uint64_t v31 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_activateConstraints_, v31);

  LODWORD(v32) = 1148846080;
  objc_msgSend(a2, sel_setContentCompressionResistancePriority_forAxis_, 1, v32);
  objc_msgSend(v4, sel_setLayoutMargins_, 8.0, 20.0, 8.0, 16.0);
}

uint64_t sub_1C291C364(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 512) = a2;
  *(void *)(v3 + 288) = a1;
  *(void *)(v3 + 296) = v2;
  *(void *)(v3 + 304) = swift_getObjectType();
  uint64_t v4 = sub_1C29206F0();
  *(void *)(v3 + 312) = v4;
  *(void *)(v3 + 320) = *(void *)(v4 - 8);
  *(void *)(v3 + 328) = swift_task_alloc();
  *(void *)(v3 + 336) = sub_1C2920D30();
  *(void *)(v3 + 344) = sub_1C2920D20();
  uint64_t v6 = sub_1C2920D10();
  *(void *)(v3 + 352) = v6;
  *(void *)(v3 + 360) = v5;
  return MEMORY[0x1F4188298](sub_1C291C46C, v6, v5);
}

uint64_t sub_1C291C46C()
{
  int v1 = *(unsigned __int8 *)(v0 + 512);
  uint64_t v2 = *(void *)(v0 + 296);
  id v3 = objc_allocWithZone(MEMORY[0x1E4F166C8]);
  uint64_t v4 = (void *)sub_1C2920450();
  id v5 = objc_msgSend(v3, sel_initWithURL_options_, v4, 0);
  *(void *)(v0 + 368) = v5;

  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset);
  *(void *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset) = v5;
  id v7 = v5;

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F16620]), sel_initWithAsset_, v7);
  *(void *)(v0 + 376) = v8;
  id v9 = *(void **)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem);
  *(void *)(v2 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem) = v8;
  id v10 = v8;

  sub_1C291ED0C(0, (unint64_t *)&qword_1EA31C740, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1C2923230;
  *(void *)(v11 + 32) = v10;
  sub_1C2920CD0();
  id v12 = objc_allocWithZone(MEMORY[0x1E4F16670]);
  sub_1C29061E8(0, &qword_1EA31C988);
  id v13 = v10;
  id v14 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_initWithItems_, v14);
  *(void *)(v0 + 384) = v15;

  objc_msgSend(v15, sel_setPreventsDisplaySleepDuringVideoPlayback_, 0);
  uint64_t v16 = *(void *)(v0 + 296);
  if (v1 == 1)
  {
    id v17 = objc_msgSend(self, sel_playerLooperWithPlayer_templateItem_, v15, v13);
    id v18 = *(void **)(v16 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper);
    *(void *)(v16 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper) = v17;
  }
  else
  {
    id v19 = objc_msgSend(self, sel_defaultCenter);
    id v18 = (void *)sub_1C2920BB0();
    objc_msgSend(v19, sel_addObserver_selector_name_object_, v16, sel_nonLoopingEndOfPlay_, v18, 0);
  }
  id v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HKAVPlayerViewController()), sel_init);
  *(void *)(v0 + 392) = v20;
  objc_msgSend(v20, sel_setPlayer_, v15);
  objc_msgSend(v20, sel_setShowsMinimalPlaybackControlsWhenEmbeddedInline_, 1);
  id v21 = v7;
  *(void *)(v0 + 400) = sub_1C2920D20();
  uint64_t v23 = sub_1C2920D10();
  *(void *)(v0 + 408) = v23;
  *(void *)(v0 + 416) = v22;
  return MEMORY[0x1F4188298](sub_1C291C78C, v23, v22);
}

uint64_t sub_1C291C78C()
{
  int v1 = (void *)v0[46];
  uint64_t v2 = *MEMORY[0x1E4F15C18];
  v0[2] = v0;
  v0[7] = v0 + 35;
  v0[3] = sub_1C291C898;
  uint64_t v3 = swift_continuation_init();
  v0[22] = MEMORY[0x1E4F143A8];
  v0[23] = 0x40000000;
  v0[24] = sub_1C291D93C;
  v0[25] = &block_descriptor_36;
  v0[26] = v3;
  objc_msgSend(v1, sel_loadTracksWithMediaType_completionHandler_, v2, v0 + 22);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1C291C898()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 424) = v2;
  uint64_t v3 = *(void *)(v1 + 416);
  uint64_t v4 = *(void *)(v1 + 408);
  if (v2) {
    uint64_t v5 = sub_1C291CC10;
  }
  else {
    uint64_t v5 = sub_1C291C9C8;
  }
  return MEMORY[0x1F4188298](v5, v4, v3);
}

uint64_t sub_1C291C9C8()
{
  swift_release();
  v0[54] = v0[35];
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[45];
  return MEMORY[0x1F4188298](sub_1C291CA34, v1, v2);
}

uint64_t sub_1C291CA34(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2[54];
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C2921070();
    a1 = swift_bridgeObjectRelease();
    if (v7)
    {
LABEL_3:
      if ((v3 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1C87617C0](0, v2[54]);
      }
      else
      {
        if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return MEMORY[0x1F4182DC0](a1, a2);
        }
        id v4 = *(id *)(v2[54] + 32);
      }
      v2[55] = v4;
      swift_bridgeObjectRelease();
      sub_1C291EF90(0, &qword_1EA31C990, type metadata accessor for CGSize);
      uint64_t v5 = sub_1C29204C0();
      v2[56] = v5;
      uint64_t v6 = (void *)swift_task_alloc();
      v2[57] = v6;
      *uint64_t v6 = v2;
      v6[1] = sub_1C291CF4C;
      a1 = (uint64_t)(v2 + 30);
      a2 = v5;
      return MEMORY[0x1F4182DC0](a1, a2);
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  id v9 = (void *)v2[47];
  id v8 = (void *)v2[48];
  id v10 = (void *)v2[46];
  swift_bridgeObjectRelease();

  swift_release();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t))v2[1];
  uint64_t v12 = v2[49];
  return v11(v12);
}

uint64_t sub_1C291CC10()
{
  swift_release();
  swift_willThrow();
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v2 = *(void *)(v0 + 360);
  return MEMORY[0x1F4188298](sub_1C291CC84, v1, v2);
}

uint64_t sub_1C291CC84()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 368);
  swift_release();

  uint64_t v2 = *(void **)(v0 + 424);
  sub_1C29206C0();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_1C29206E0();
  os_log_type_t v6 = sub_1C2920DD0();
  if (os_log_type_enabled(v5, v6))
  {
    id v21 = *(void **)(v0 + 384);
    uint64_t v22 = *(void **)(v0 + 376);
    uint64_t v23 = *(void **)(v0 + 368);
    uint64_t v24 = *(void *)(v0 + 320);
    uint64_t v25 = *(void *)(v0 + 312);
    uint64_t v26 = *(void *)(v0 + 328);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v27 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_1C29211D0();
    *(void *)(v0 + 272) = sub_1C2911820(v9, v10, &v27);
    sub_1C2920F20();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v11 = sub_1C2921130();
    *(void *)(v0 + 264) = sub_1C2911820(v11, v12, &v27);
    sub_1C2920F20();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C28F8000, v5, v6, "[%s]: Did receive error when loading track from AVAsset: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C8762070](v8, -1, -1);
    MEMORY[0x1C8762070](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 376);
    id v13 = *(void **)(v0 + 384);
    uint64_t v16 = *(void *)(v0 + 320);
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v17 = *(void *)(v0 + 312);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  id v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v19 = *(void *)(v0 + 392);
  return v18(v19);
}

uint64_t sub_1C291CF4C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 352);
    uint64_t v4 = *(void *)(v2 + 360);
    uint64_t v5 = sub_1C291D380;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 352);
    uint64_t v4 = *(void *)(v2 + 360);
    uint64_t v5 = sub_1C291D068;
  }
  return MEMORY[0x1F4188298](v5, v3, v4);
}

uint64_t sub_1C291D068()
{
  *(_OWORD *)(v0 + 472) = *(_OWORD *)(v0 + 240);
  sub_1C291EF90(0, &qword_1EA31C9A0, type metadata accessor for CGAffineTransform);
  uint64_t v1 = sub_1C29204D0();
  *(void *)(v0 + 488) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 496) = v2;
  void *v2 = v0;
  v2[1] = sub_1C291D154;
  return MEMORY[0x1F4182DC0](v0 + 128, v1);
}

uint64_t sub_1C291D154()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 504) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 352);
    uint64_t v4 = *(void *)(v2 + 360);
    uint64_t v5 = sub_1C291D65C;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 352);
    uint64_t v4 = *(void *)(v2 + 360);
    uint64_t v5 = sub_1C291D270;
  }
  return MEMORY[0x1F4188298](v5, v3, v4);
}

id sub_1C291D270()
{
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v3 = *(void **)(v0 + 392);
  swift_release();
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 128);
  long long v4 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 112) = v4;
  uint64_t v5 = v2;
  *(void *)&long long v4 = v1;
  CGSize v6 = CGSizeApplyAffineTransform(*(CGSize *)((char *)&v4 - 8), (CGAffineTransform *)(v0 + 80));
  id result = objc_msgSend(v3, sel_view);
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void **)(v0 + 440);
    uint64_t v11 = *(void **)(v0 + 376);
    unint64_t v10 = *(void **)(v0 + 384);
    unint64_t v12 = *(void **)(v0 + 368);
    objc_msgSend(result, sel_hk_constraintAspectRatioFromSize_, v6.width, v6.height);

    swift_task_dealloc();
    id v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v14 = *(void *)(v0 + 392);
    return (id)v13(v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C291D380()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 368);

  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 464);
  sub_1C29206C0();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_1C29206E0();
  os_log_type_t v6 = sub_1C2920DD0();
  if (os_log_type_enabled(v5, v6))
  {
    id v21 = *(void **)(v0 + 384);
    uint64_t v22 = *(void **)(v0 + 376);
    uint64_t v23 = *(void **)(v0 + 368);
    uint64_t v24 = *(void *)(v0 + 320);
    uint64_t v25 = *(void *)(v0 + 312);
    uint64_t v26 = *(void *)(v0 + 328);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v27 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_1C29211D0();
    *(void *)(v0 + 272) = sub_1C2911820(v9, v10, &v27);
    sub_1C2920F20();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v11 = sub_1C2921130();
    *(void *)(v0 + 264) = sub_1C2911820(v11, v12, &v27);
    sub_1C2920F20();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C28F8000, v5, v6, "[%s]: Did receive error when loading track from AVAsset: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C8762070](v8, -1, -1);
    MEMORY[0x1C8762070](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 376);
    id v13 = *(void **)(v0 + 384);
    uint64_t v16 = *(void *)(v0 + 320);
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v17 = *(void *)(v0 + 312);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  id v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v19 = *(void *)(v0 + 392);
  return v18(v19);
}

uint64_t sub_1C291D65C()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 368);

  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 504);
  sub_1C29206C0();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_1C29206E0();
  os_log_type_t v6 = sub_1C2920DD0();
  if (os_log_type_enabled(v5, v6))
  {
    id v21 = *(void **)(v0 + 384);
    uint64_t v22 = *(void **)(v0 + 376);
    uint64_t v23 = *(void **)(v0 + 368);
    uint64_t v24 = *(void *)(v0 + 320);
    uint64_t v25 = *(void *)(v0 + 312);
    uint64_t v26 = *(void *)(v0 + 328);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v27 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_1C29211D0();
    *(void *)(v0 + 272) = sub_1C2911820(v9, v10, &v27);
    sub_1C2920F20();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v11 = sub_1C2921130();
    *(void *)(v0 + 264) = sub_1C2911820(v11, v12, &v27);
    sub_1C2920F20();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C28F8000, v5, v6, "[%s]: Did receive error when loading track from AVAsset: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C8762070](v8, -1, -1);
    MEMORY[0x1C8762070](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 376);
    id v13 = *(void **)(v0 + 384);
    uint64_t v16 = *(void *)(v0 + 320);
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v17 = *(void *)(v0 + 312);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  id v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v19 = *(void *)(v0 + 392);
  return v18(v19);
}

uint64_t sub_1C291D93C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_1C29095BC(0, (unint64_t *)&qword_1EA31C5A8);
    uint64_t v5 = swift_allocError();
    *os_log_type_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    sub_1C29061E8(0, &qword_1EA31C998);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_1C2920CC0();
    return MEMORY[0x1F4188200](v3);
  }
}

void sub_1C291DA24()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset);
  if (v2)
  {
    id v3 = v2;
    sub_1C2920350();
    if (v26)
    {
      sub_1C29061E8(0, &qword_1EA31C988);
      if (swift_dynamicCast())
      {
        uint64_t v4 = OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem;
        uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem);
        if (v5)
        {
          id v6 = v22[0];
          id v7 = v5;
          char v8 = sub_1C2920EB0();

          if (v8)
          {
            id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F16620]), sel_initWithAsset_, v3);
            unint64_t v10 = *(void **)(v1 + v4);
            *(void *)(v1 + v4) = v9;
            id v11 = v9;

            sub_1C291ED0C(0, (unint64_t *)&qword_1EA31C740, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
            uint64_t v12 = swift_allocObject();
            *(_OWORD *)(v12 + 16) = xmmword_1C2923230;
            *(void *)(v12 + 32) = v11;
            v25[0] = v12;
            sub_1C2920CD0();
            id v13 = objc_allocWithZone(MEMORY[0x1E4F16670]);
            id v14 = v11;
            uint64_t v15 = (void *)sub_1C2920CB0();
            swift_bridgeObjectRelease();
            id v16 = objc_msgSend(v13, sel_initWithItems_, v15);

            objc_msgSend(v16, sel_setPreventsDisplaySleepDuringVideoPlayback_, 0);
            uint64_t v17 = v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
            swift_beginAccess();
            sub_1C291E05C(v17, (uint64_t)v25);
            if (v26)
            {
              sub_1C291ED58((uint64_t)v25, (uint64_t)v22);
              sub_1C291E128((uint64_t)v25);
              uint64_t v18 = v23;
              uint64_t v19 = v24;
              __swift_project_boxed_opaque_existential_1(v22, v23);
              (*(void (**)(id, uint64_t, uint64_t))(v19 + 24))(v16, v18, v19);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
            }
            else
            {
              sub_1C291E128((uint64_t)v25);
            }
            id v20 = objc_msgSend(self, sel_defaultCenter);
            id v21 = (void *)sub_1C2920BB0();
            objc_msgSend(v20, sel_addObserver_selector_name_object_, v1, sel_nonLoopingEndOfPlay_, v21, 0);
          }
          else
          {
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
    else
    {

      sub_1C291F4DC((uint64_t)v25, (uint64_t)&qword_1EA31C5D8, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C291ED0C);
    }
  }
}

id VideoView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoView()
{
  return self;
}

Swift::Void __swiftcall VideoView.viewStateChanged(_:)(HealthArticlesUI::MovementVisibilityState a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode + 8) == 1
    && *(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible) == 1)
  {
    uint64_t v2 = *(void *)a1.rawValue;
    uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    sub_1C291E05C(v3, (uint64_t)&v7);
    if (v8)
    {
      sub_1C29097B8(&v7, (uint64_t)v9);
      uint64_t v4 = v2 & 3;
      uint64_t v5 = v10;
      uint64_t v6 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      if (v4 == 2) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      }
      else {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    else
    {
      sub_1C291E128((uint64_t)&v7);
    }
  }
}

uint64_t sub_1C291E05C(uint64_t a1, uint64_t a2)
{
  sub_1C291E0C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C291E0C0()
{
  if (!qword_1EA31C920)
  {
    sub_1C29095BC(255, &qword_1EA31C928);
    unint64_t v0 = sub_1C2920ED0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA31C920);
    }
  }
}

uint64_t sub_1C291E128(uint64_t a1)
{
  sub_1C291E0C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall VideoView.viewVisibilityChanged(_:)(Swift::Double a1)
{
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode + 8) & 1) == 0
    && *(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playWhenVisible) == 1)
  {
    double v3 = *(double *)(v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode);
    uint64_t v4 = v1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer;
    swift_beginAccess();
    sub_1C291E05C(v4, (uint64_t)&v7);
    if (v8)
    {
      sub_1C29097B8(&v7, (uint64_t)v9);
      uint64_t v5 = v10;
      uint64_t v6 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      if (v3 <= a1) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      }
      else {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    else
    {
      sub_1C291E128((uint64_t)&v7);
    }
  }
}

unint64_t sub_1C291E298()
{
  unint64_t result = qword_1EA31C930;
  if (!qword_1EA31C930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C930);
  }
  return result;
}

unint64_t sub_1C291E2F0()
{
  unint64_t result = qword_1EA31C938;
  if (!qword_1EA31C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C938);
  }
  return result;
}

unint64_t sub_1C291E348()
{
  unint64_t result = qword_1EA31C940;
  if (!qword_1EA31C940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C940);
  }
  return result;
}

unint64_t sub_1C291E3A0()
{
  unint64_t result = qword_1EA31C948;
  if (!qword_1EA31C948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA31C948);
  }
  return result;
}

void sub_1C291E3F4(HealthArticlesUI::MovementVisibilityState a1)
{
}

void sub_1C291E418(Swift::Double a1)
{
}

id sub_1C291E43C()
{
  return objc_msgSend(*v0, sel_play);
}

id sub_1C291E44C()
{
  return objc_msgSend(*v0, sel_pause);
}

uint64_t sub_1C291E45C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  double v3 = (void *)(*a1 + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for VideoViewOptions()
{
  return &type metadata for VideoViewOptions;
}

uint64_t method lookup function for VideoView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for VideoView);
}

uint64_t dispatch thunk of VideoView.accessibilityVideoDescription.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of VideoView.accessibilityVideoDescription.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of VideoView.accessibilityVideoDescription.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of VideoView.update(maybeURL:options:caption:accessibilityDescription:playVisibilityPercentage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))((*MEMORY[0x1E4FBC8C8] & *v8) + 0x150))(a1, a2, a3, a4, a5, a6, a7, a8 & 1);
}

id sub_1C291E778()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for HKAVPlayerViewController();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_1C291E87C()
{
  id v1 = &v0[OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground];
  if ((v0[OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground
         + 8] & 1) == 0)
  {
    if (*(void *)v1 == 2)
    {
      id v2 = objc_msgSend(v0, sel_player);
      objc_msgSend(v2, sel_play);
    }
    *(void *)id v1 = 0;
    v1[8] = 1;
  }
}

void sub_1C291E940()
{
  id v1 = objc_msgSend(v0, sel_player);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_timeControlStatus);

    uint64_t v4 = &v0[OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground];
    *(void *)uint64_t v4 = v3;
    v4[8] = 0;
    if (v3 == (id)2)
    {
      id v5 = objc_msgSend(v0, sel_player);
      objc_msgSend(v5, sel_pause);
    }
  }
}

uint64_t type metadata accessor for HKAVPlayerViewController()
{
  return self;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VideoView.PlayMode(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for VideoView.PlayMode(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1C291EB40(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C291EB5C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoView.PlayMode()
{
  return &type metadata for VideoView.PlayMode;
}

void sub_1C291EB8C()
{
  id v1 = *v0;
  id v2 = objc_msgSend(*v0, sel_player);
  if (!v2 || (char v3 = v2, v4 = objc_msgSend(v2, sel_timeControlStatus), v3, v4 != (id)2))
  {
    id v5 = objc_msgSend(v1, sel_player);
    objc_msgSend(v5, sel_play);
  }
}

void sub_1C291EC44()
{
  id v1 = *v0;
  id v2 = objc_msgSend(*v0, sel_player);
  if (!v2 || (char v3 = v2, v4 = objc_msgSend(v2, sel_timeControlStatus), v3, v4))
  {
    id v5 = objc_msgSend(v1, sel_player);
    objc_msgSend(v5, sel_pause);
  }
}

id sub_1C291ECF8(uint64_t a1)
{
  return objc_msgSend(*v1, sel_setPlayer_, a1);
}

void sub_1C291ED0C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C291ED58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C291EDBC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_1C291EE98;
  return v6(a1);
}

uint64_t sub_1C291EE98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_1C291EF90(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    sub_1C29061E8(255, &qword_1EA31C998);
    a3(255);
    unint64_t v5 = sub_1C29204B0();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C291F010(uint64_t a1, uint64_t a2)
{
  sub_1C291E0C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1C291F074()
{
  id v1 = &v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer];
  *(_OWORD *)id v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playMode];
  *(void *)uint64_t v2 = 0;
  v2[8] = 1;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_playerLooper] = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel] = 0;

  sub_1C2921060();
  __break(1u);
}

uint64_t sub_1C291F144()
{
  uint64_t v1 = sub_1C2920470();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 9;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1C291F25C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1C2920470() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[4];
  uint64_t v14 = v1[3];
  uint64_t v15 = v1[2];
  uint64_t v8 = *(void *)((char *)v1 + v5);
  uint64_t v9 = (uint64_t)v1 + v4;
  uint64_t v10 = *(void *)((char *)v1 + v6);
  uint64_t v11 = *(void *)((char *)v1 + v6 + 8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_1C291F3E8;
  return sub_1C291B39C(a1, v15, v14, v7, v9, v8, v10, v11);
}

uint64_t sub_1C291F3E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1C291F4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_1C291F53C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C291F574(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1C291F3E8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA31C9C8 + dword_1EA31C9C8);
  return v6(a1, v4);
}

id sub_1C291F62C()
{
  return sub_1C291F644(&OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel);
}

id sub_1C291F638()
{
  return sub_1C291F644(&OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel);
}

id sub_1C291F644(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(v1 + *a1);
  if (v3)
  {
    id v4 = *(id *)(v1 + *a1);
  }
  else
  {
    sub_1C29061E8(0, &qword_1EBB6BB20);
    id v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_setNumberOfLines_, 0);
    id v6 = objc_msgSend(self, sel_labelColor);
    objc_msgSend(v5, sel_setTextColor_, v6);

    uint64_t v7 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v5;
    id v4 = v5;

    uint64_t v3 = 0;
  }
  id v8 = v3;
  return v4;
}

id sub_1C291F73C(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel] = 0;
  v22.receiver = v4;
  v22.super_class = (Class)type metadata accessor for TileSashView();
  id v9 = objc_msgSendSuper2(&v22, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setPreservesSuperviewLayoutMargins_, 1);
  id v10 = sub_1C291F62C();
  id v11 = sub_1C291F638();
  id v12 = v9;
  objc_msgSend(v12, sel_addSubview_, v10);
  objc_msgSend(v12, sel_addSubview_, v11);

  sub_1C291FE44();
  id v13 = sub_1C291F62C();
  sub_1C29061E8(0, &qword_1EBB6BB10);
  uint64_t v14 = (void *)sub_1C2920E70();
  objc_msgSend(v13, sel_setFont_, v14);

  id v15 = sub_1C291F638();
  id v16 = (void *)sub_1C2920E70();
  objc_msgSend(v15, sel_setFont_, v16);

  sub_1C28FBB34();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1C2921D10;
  uint64_t v18 = sub_1C2920730();
  uint64_t v19 = MEMORY[0x1E4FB1138];
  *(void *)(v17 + 32) = v18;
  *(void *)(v17 + 40) = v19;
  id v20 = v12;
  MEMORY[0x1C8761660](v17, sel_preferredContentSizeCategoryDidChange);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v20;
}

id sub_1C291F994(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel] = 0;
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for TileSashView();
  id v3 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = sub_1C291F62C();
    id v7 = sub_1C291F638();
    id v8 = v5;
    objc_msgSend(v8, sel_addSubview_, v6);
    objc_msgSend(v8, sel_addSubview_, v7);

    sub_1C291FE44();
    id v9 = sub_1C291F62C();
    sub_1C29061E8(0, &qword_1EBB6BB10);
    id v10 = (void *)sub_1C2920E70();
    objc_msgSend(v9, sel_setFont_, v10);

    id v11 = sub_1C291F638();
    uint64_t v12 = sub_1C2920E70();
    objc_msgSend(v11, sel_setFont_, v12);

    a1 = (void *)v12;
  }

  return v4;
}

uint64_t type metadata accessor for TileSashView()
{
  return self;
}

void sub_1C291FC50()
{
  id v0 = sub_1C291F62C();
  sub_1C29061E8(0, &qword_1EBB6BB10);
  uint64_t v1 = (void *)sub_1C2920E70();
  objc_msgSend(v0, sel_setFont_, v1);

  id v2 = sub_1C291F638();
  id v3 = (id)sub_1C2920E70();
  objc_msgSend(v2, sel_setFont_, v3);
}

id TileSashView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TileSashView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TileSashView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TileSashView);
}

void sub_1C291FE44()
{
  uint64_t v1 = v0;
  id v43 = self;
  sub_1C2909864();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1C2923220;
  id v3 = sub_1C291F62C();
  id v4 = objc_msgSend(v3, sel_topAnchor);

  id v5 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v6 = objc_msgSend(v5, sel_topAnchor);

  id v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v6);
  *(void *)(v2 + 32) = v7;
  id v8 = sub_1C291F62C();
  id v9 = objc_msgSend(v8, sel_leadingAnchor);

  id v10 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v11 = objc_msgSend(v10, sel_leadingAnchor);

  id v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
  *(void *)(v2 + 40) = v12;
  id v13 = sub_1C291F62C();
  id v14 = objc_msgSend(v13, sel_trailingAnchor);

  id v15 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v16 = objc_msgSend(v15, sel_trailingAnchor);

  id v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(void *)(v2 + 48) = v17;
  id v18 = sub_1C291F638();
  id v19 = objc_msgSend(v18, sel_topAnchor);

  id v20 = sub_1C291F62C();
  id v21 = objc_msgSend(v20, sel_bottomAnchor);

  id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v21, 4.0);
  *(void *)(v2 + 56) = v22;
  id v23 = sub_1C291F638();
  id v24 = objc_msgSend(v23, sel_leadingAnchor);

  id v25 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v26 = objc_msgSend(v25, sel_leadingAnchor);

  id v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v26);
  *(void *)(v2 + 64) = v27;
  id v28 = sub_1C291F638();
  id v29 = objc_msgSend(v28, sel_trailingAnchor);

  id v30 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v31 = objc_msgSend(v30, sel_trailingAnchor);

  id v32 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v31);
  *(void *)(v2 + 72) = v32;
  id v33 = sub_1C291F638();
  id v34 = objc_msgSend(v33, sel_bottomAnchor);

  id v35 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v36 = objc_msgSend(v35, sel_bottomAnchor);

  id v37 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v36);
  *(void *)(v2 + 80) = v37;
  sub_1C2920CD0();
  sub_1C29061E8(0, (unint64_t *)&qword_1EBB6BB08);
  uint64_t v38 = (void *)sub_1C2920CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v43, sel_activateConstraints_, v38);

  type metadata accessor for UILayoutPriority(0);
  sub_1C290D8FC();
  sub_1C2920710();
  sub_1C2920700();
  id v39 = sub_1C291F62C();
  LODWORD(v40) = v2;
  objc_msgSend(v39, sel_setContentHuggingPriority_forAxis_, 1, v40);

  id v41 = sub_1C291F62C();
  LODWORD(v42) = v2;
  objc_msgSend(v41, sel_setContentCompressionResistancePriority_forAxis_, 1, v42);
}

uint64_t sub_1C2920340()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C2920350()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1C2920360()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C2920370()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1C2920380()
{
  return MEMORY[0x1F41656E0]();
}

uint64_t sub_1C2920390()
{
  return MEMORY[0x1F40E3C50]();
}

uint64_t sub_1C29203A0()
{
  return MEMORY[0x1F40E3CB0]();
}

uint64_t sub_1C29203B0()
{
  return MEMORY[0x1F40E3CD0]();
}

uint64_t sub_1C29203C0()
{
  return MEMORY[0x1F40E3CE8]();
}

uint64_t sub_1C29203D0()
{
  return MEMORY[0x1F40E3CF8]();
}

uint64_t sub_1C29203E0()
{
  return MEMORY[0x1F40E3D08]();
}

uint64_t sub_1C29203F0()
{
  return MEMORY[0x1F40E3E40]();
}

uint64_t sub_1C2920400()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1C2920410()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1C2920420()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1C2920430()
{
  return MEMORY[0x1F40E40A8]();
}

uint64_t sub_1C2920440()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C2920450()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C2920460()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C2920470()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C2920480()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1C2920490()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C29204A0()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C29204B0()
{
  return MEMORY[0x1F4182D38]();
}

uint64_t sub_1C29204C0()
{
  return MEMORY[0x1F4182D40]();
}

uint64_t sub_1C29204D0()
{
  return MEMORY[0x1F4182D50]();
}

uint64_t sub_1C29204E0()
{
  return MEMORY[0x1F4120008]();
}

uint64_t sub_1C29204F0()
{
  return MEMORY[0x1F411D918]();
}

uint64_t sub_1C2920500()
{
  return MEMORY[0x1F411E118]();
}

uint64_t sub_1C2920510()
{
  return MEMORY[0x1F411DCB8]();
}

uint64_t sub_1C2920520()
{
  return MEMORY[0x1F4121098]();
}

uint64_t sub_1C2920530()
{
  return MEMORY[0x1F41210A0]();
}

uint64_t sub_1C2920540()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_1C2920550()
{
  return MEMORY[0x1F411E210]();
}

uint64_t sub_1C2920560()
{
  return MEMORY[0x1F411E290]();
}

uint64_t sub_1C2920570()
{
  return MEMORY[0x1F411E2B0]();
}

uint64_t sub_1C2920580()
{
  return MEMORY[0x1F411E570]();
}

uint64_t sub_1C2920590()
{
  return MEMORY[0x1F411E578]();
}

uint64_t sub_1C29205A0()
{
  return MEMORY[0x1F411E580]();
}

uint64_t sub_1C29205B0()
{
  return MEMORY[0x1F411E598]();
}

uint64_t sub_1C29205C0()
{
  return MEMORY[0x1F411E6E8]();
}

uint64_t sub_1C29205D0()
{
  return MEMORY[0x1F411E6F0]();
}

uint64_t sub_1C29205F0()
{
  return MEMORY[0x1F411E968]();
}

uint64_t sub_1C2920610()
{
  return MEMORY[0x1F411EA58]();
}

uint64_t sub_1C2920620()
{
  return MEMORY[0x1F411EA60]();
}

uint64_t _s16HealthArticlesUI35ArticleContentConfigurationProviderC13ActionHandlerCfd_0()
{
  return MEMORY[0x1F411EA68]();
}

uint64_t sub_1C2920640()
{
  return MEMORY[0x1F411EBF8]();
}

uint64_t sub_1C2920650()
{
  return MEMORY[0x1F411EC08]();
}

uint64_t sub_1C2920660()
{
  return MEMORY[0x1F411EC10]();
}

uint64_t sub_1C2920670()
{
  return MEMORY[0x1F411EC18]();
}

uint64_t sub_1C2920680()
{
  return MEMORY[0x1F411ECA8]();
}

uint64_t sub_1C2920690()
{
  return MEMORY[0x1F411ECB0]();
}

uint64_t sub_1C29206A0()
{
  return MEMORY[0x1F411ECB8]();
}

uint64_t sub_1C29206B0()
{
  return MEMORY[0x1F4120BF8]();
}

uint64_t sub_1C29206C0()
{
  return MEMORY[0x1F4120C38]();
}

uint64_t sub_1C29206D0()
{
  return MEMORY[0x1F4120C80]();
}

uint64_t sub_1C29206E0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C29206F0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C2920700()
{
  return MEMORY[0x1F4165770]();
}

uint64_t sub_1C2920710()
{
  return MEMORY[0x1F4165778]();
}

uint64_t sub_1C2920720()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1C2920730()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1C2920740()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1C2920750()
{
  return MEMORY[0x1F40F81D8]();
}

uint64_t sub_1C2920760()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1C2920770()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1C2920780()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1C2920790()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_1C29207A0()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_1C29207B0()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1C29207C0()
{
  return MEMORY[0x1F40F8B98]();
}

uint64_t sub_1C29207D0()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1C29207E0()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1C29207F0()
{
  return MEMORY[0x1F40F9278]();
}

uint64_t sub_1C2920800()
{
  return MEMORY[0x1F40F93E8]();
}

uint64_t sub_1C2920810()
{
  return MEMORY[0x1F40F93F0]();
}

uint64_t sub_1C2920820()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1C2920830()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1C2920840()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1C2920850()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1C2920860()
{
  return MEMORY[0x1F40FA430]();
}

uint64_t sub_1C2920870()
{
  return MEMORY[0x1F40FA448]();
}

uint64_t sub_1C2920880()
{
  return MEMORY[0x1F40FA450]();
}

uint64_t sub_1C2920890()
{
  return MEMORY[0x1F40FA458]();
}

uint64_t sub_1C29208A0()
{
  return MEMORY[0x1F40FA470]();
}

uint64_t sub_1C29208B0()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1C29208C0()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1C29208D0()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1C29208E0()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1C29208F0()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_1C2920910()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1C2920920()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1C2920930()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1C2920950()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_1C2920960()
{
  return MEMORY[0x1F40FABE0]();
}

uint64_t sub_1C2920970()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1C2920980()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1C2920990()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1C29209A0()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1C29209B0()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1C29209C0()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1C29209D0()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1C29209E0()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1C29209F0()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1C2920A00()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1C2920A10()
{
  return MEMORY[0x1F411EE08]();
}

uint64_t sub_1C2920A20()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1C2920A30()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1C2920A40()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1C2920A50()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1C2920A60()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1C2920A70()
{
  return MEMORY[0x1F40FBF70]();
}

uint64_t sub_1C2920A80()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_1C2920A90()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1C2920AA0()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1C2920AB0()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_1C2920AC0()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1C2920AD0()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1C2920AE0()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_1C2920AF0()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1C2920B00()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C2920B10()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C2920B20()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C2920B30()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C2920B40()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C2920B50()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1C2920B60()
{
  return MEMORY[0x1F4121480]();
}

uint64_t sub_1C2920B70()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C2920B80()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C2920B90()
{
  return MEMORY[0x1F41883F8]();
}

uint64_t sub_1C2920BA0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C2920BB0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C2920BC0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C2920BD0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C2920BE0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C2920BF0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C2920C00()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C2920C10()
{
  return MEMORY[0x1F41838E8]();
}

uint64_t sub_1C2920C20()
{
  return MEMORY[0x1F4183900]();
}

uint64_t sub_1C2920C30()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C2920C40()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C2920C50()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C2920C60()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C2920C70()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1C2920C80()
{
  return MEMORY[0x1F4183B20]();
}

uint64_t sub_1C2920C90()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C2920CA0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C2920CB0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C2920CC0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C2920CD0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C2920CE0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C2920CF0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C2920D00()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C2920D10()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C2920D20()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1C2920D30()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1C2920D40()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C2920D50()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C2920D70()
{
  return MEMORY[0x1F40E6408]();
}

uint64_t sub_1C2920D80()
{
  return MEMORY[0x1F40E6410]();
}

uint64_t sub_1C2920D90()
{
  return MEMORY[0x1F40E6428]();
}

uint64_t sub_1C2920DB0()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C2920DC0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C2920DD0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C2920DE0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C2920DF0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C2920E00()
{
  return MEMORY[0x1F4120DA0]();
}

uint64_t sub_1C2920E10()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1C2920E20()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1C2920E30()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1C2920E40()
{
  return MEMORY[0x1F41214B0]();
}

uint64_t sub_1C2920E50()
{
  return MEMORY[0x1F40E6720]();
}

uint64_t sub_1C2920E70()
{
  return MEMORY[0x1F411EF18]();
}

uint64_t sub_1C2920E80()
{
  return MEMORY[0x1F41667D8]();
}

uint64_t sub_1C2920E90()
{
  return MEMORY[0x1F411EF48]();
}

uint64_t sub_1C2920EA0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C2920EB0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C2920EC0()
{
  return MEMORY[0x1F40E6938]();
}

uint64_t sub_1C2920ED0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C2920EE0()
{
  return MEMORY[0x1F4184720]();
}

uint64_t sub_1C2920EF0()
{
  return MEMORY[0x1F4184738]();
}

uint64_t sub_1C2920F00()
{
  return MEMORY[0x1F4184780]();
}

uint64_t sub_1C2920F10()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1C2920F20()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C2920F30()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C2920F40()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1C2920F50()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1C2920F70()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C2920F80()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C2920F90()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C2920FA0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C2920FB0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C2920FC0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C2920FD0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C2920FE0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C2920FF0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C2921000()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C2921010()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C2921020()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C2921030()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C2921040()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C2921050()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C2921060()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C2921070()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C2921080()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C2921090()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C29210A0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C29210B0()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1C29210C0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C29210D0()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1C29210E0()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C29210F0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C2921100()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C2921110()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C2921120()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C2921130()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C2921140()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1C2921150()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C2921160()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C2921170()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1C2921180()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C2921190()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C29211A0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C29211D0()
{
  return MEMORY[0x1F4186318]();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  MEMORY[0x1F40DB4C0](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
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

void bzero(void *a1, size_t a2)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}