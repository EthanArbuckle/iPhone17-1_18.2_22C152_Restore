id static DRPDropletPrototypeSettingsDomain.rootSettings()()
{
  id result;
  objc_super v1;

  v1.receiver = (id)swift_getObjCClassFromMetadata();
  v1.super_class = (Class)&OBJC_METACLASS___DRPDropletPrototypeSettingsDomain;
  result = objc_msgSendSuper2(&v1, sel_rootSettings);
  if (result)
  {
    self;
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static DRPDropletPrototypeSettingsDomain.domainGroupName()()
{
  return 0x6F42676E69727053;
}

uint64_t static DRPDropletPrototypeSettingsDomain.domainName()()
{
  return 0x5574656C706F7244;
}

uint64_t static DRPDropletPrototypeSettingsDomain.rootSettingsClass()()
{
  return type metadata accessor for DRPDropletPrototypeSettings(0);
}

unint64_t type metadata accessor for DRPDropletPrototypeSettingsDomain()
{
  unint64_t result = qword_269857EB8;
  if (!qword_269857EB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269857EB8);
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 __swift_memcpy80_4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_24D113A68(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D113A88(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
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
  *(unsigned char *)(result + 80) = v3;
  return result;
}

void type metadata accessor for CAColorMatrix(uint64_t a1)
{
}

void type metadata accessor for UIRectEdge(uint64_t a1)
{
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for DropletParticipantTrackingView.ParticipantGeometry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_24D113B38(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D113B58(uint64_t result, int a2, int a3)
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

void *sub_24D113B98@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24D113BA8(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_24D113BB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_24D113BC0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_24D113BD4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24D113BDC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_24D113BF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_24D113C04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24D113C18(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24D113C48@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24D113C74@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_24D113C98(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24D113CAC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24D113CC0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_24D113CD4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24D113CE8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_24D113CFC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_24D113D10(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_24D113D24()
{
  return *v0 == 0;
}

uint64_t sub_24D113D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_24D113D4C(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_24D113D60()
{
  swift_getWitnessTable();
  return sub_24D1491C8();
}

uint64_t sub_24D113DCC()
{
  return sub_24D113FA8(&qword_26B189258, type metadata accessor for CGColor);
}

uint64_t sub_24D113E14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_24D114110(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_24D113E54()
{
  return sub_24D1491E8();
}

uint64_t sub_24D113EA0()
{
  return sub_24D1491D8();
}

uint64_t sub_24D113EF8()
{
  return sub_24D149528();
}

uint64_t sub_24D113F60()
{
  return sub_24D113FA8(&qword_26B189250, type metadata accessor for CGColor);
}

uint64_t sub_24D113FA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D113FF0()
{
  return sub_24D113FA8(&qword_269857ED8, type metadata accessor for UIRectEdge);
}

uint64_t sub_24D114038()
{
  return sub_24D113FA8(&qword_269857EE0, type metadata accessor for UIRectEdge);
}

uint64_t sub_24D114080()
{
  return sub_24D113FA8(&qword_269857EE8, type metadata accessor for UIRectEdge);
}

uint64_t sub_24D1140C8()
{
  return sub_24D113FA8((unint64_t *)&unk_269857EF0, type metadata accessor for UIRectEdge);
}

uint64_t sub_24D114110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_24D11416C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D11418C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
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
  *(unsigned char *)(result + 128) = v3;
  return result;
}

void type metadata accessor for CATransform3D(uint64_t a1)
{
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

uint64_t sub_24D114200(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D114220(uint64_t result, int a2, int a3)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for KeylineWidth(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for KeylineWidth(uint64_t result, int a2, int a3)
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

void sub_24D1142E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_24D114348(double a1)
{
  double v2 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius];
  *(double *)&v1[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius] = a1;
  if (v2 != a1)
  {
    if (a1 > 0.0 == v2 <= 0.0)
    {
      if (a1 <= 0.0 || (double v3 = 1.0, v1[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] == 1)) {
        double v3 = 0.0;
      }
      objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty], sel_setValue_, v3);
    }
    id v4 = objc_msgSend(v1, sel_layer);
    uint64_t v5 = (void *)sub_24D1491B8();
    if (qword_26B189110 != -1) {
      swift_once();
    }
    id v6 = (id)sub_24D149258();
    objc_msgSend(v4, sel_setValue_forKeyPath_, v5, v6);
  }
}

char *sub_24D114494(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = swift_getObjectType();
  v4[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = 0;
  uint64_t v10 = OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty;
  id v11 = objc_allocWithZone(MEMORY[0x263F82E28]);
  v12 = v4;
  *(void *)&v4[v10] = objc_msgSend(v11, sel_init);
  *(void *)&v12[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius] = 0;

  v40.receiver = v12;
  v40.super_class = (Class)type metadata accessor for BlurredView();
  id v13 = objc_msgSendSuper2(&v40, sel_initWithFrame_, a1, a2, a3, a4);
  sub_24D149268();
  id v14 = objc_allocWithZone(MEMORY[0x263F157C8]);
  v15 = (char *)v13;
  v16 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v14, sel_initWithType_, v16);

  v18 = (void *)sub_24D149328();
  objc_msgSend(v17, sel_setValue_forKeyPath_, v18, *MEMORY[0x263F15C80]);

  objc_msgSend(v17, sel_setEnabled_, 0);
  id v19 = objc_msgSend(v15, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_24D14B240;
  *(void *)(v20 + 56) = sub_24D114FEC(0, (unint64_t *)&qword_26B189510);
  *(void *)(v20 + 32) = v17;
  id v21 = v17;
  v22 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setFilters_, v22);

  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v24 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_24D14B250;
  v26 = *(void **)&v15[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty];
  *(void *)(v25 + 32) = v26;
  sub_24D1492D8();
  sub_24D114FEC(0, (unint64_t *)&unk_26B189790);
  id v27 = v26;
  v28 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v23;
  *(void *)(v29 + 24) = ObjectType;
  v38 = sub_24D115028;
  uint64_t v39 = v29;
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 1107296256;
  v36 = sub_24D142914;
  v37 = &block_descriptor;
  v30 = _Block_copy(&v34);
  swift_retain();
  swift_release();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v23;
  *(void *)(v31 + 24) = ObjectType;
  v38 = sub_24D115080;
  uint64_t v39 = v31;
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 1107296256;
  v36 = sub_24D142914;
  v37 = &block_descriptor_14;
  v32 = _Block_copy(&v34);
  swift_retain();
  swift_release();
  objc_msgSend(v24, sel__createTransformerWithInputAnimatableProperties_modelValueSetter_presentationValueSetter_, v28, v30, v32);

  _Block_release(v32);
  _Block_release(v30);

  swift_release();
  return v15;
}

void sub_24D1148D0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  double v2 = (char *)MEMORY[0x25331EC50](v1);
  if (v2)
  {
    double v3 = v2;
    id v4 = objc_msgSend(v2, sel_layer);
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty], sel_value);
    uint64_t v5 = (void *)sub_24D149308();
    if (qword_26B189108 != -1) {
      swift_once();
    }
    id v6 = (void *)sub_24D149258();
    objc_msgSend(v4, sel_setValue_forKeyPath_, v5, v6);
  }
}

void sub_24D1149D4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25331EC50](v1);
  if (v2)
  {
    double v3 = (void *)v2;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty), sel_presentationValue);
    id v4 = (void *)sub_24D149308();
    if (qword_26B189108 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)sub_24D149258();
    objc_msgSend(v3, sel__setPresentationValue_forKey_, v4, v5);
  }
}

id sub_24D114B98()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlurredView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D114C54(uint64_t a1, void *a2)
{
  double v3 = a2;
  if (qword_26B189110 == -1)
  {
    if (!a2) {
      goto LABEL_8;
    }
  }
  else
  {
    swift_once();
    if (!v3) {
      goto LABEL_8;
    }
  }
  BOOL v5 = qword_26B189BE0 == a1 && *(void *)algn_26B189BE8 == (void)v3;
  if (v5 || (sub_24D1494C8() & 1) != 0) {
    return 1;
  }
LABEL_8:
  if (qword_26B189108 == -1)
  {
    if (!v3)
    {
LABEL_17:
      v9.receiver = v2;
      v9.super_class = (Class)type metadata accessor for BlurredView();
      id v7 = objc_msgSendSuper2(&v9, sel__shouldAnimatePropertyWithKey_, v3);

      return (uint64_t)v7;
    }
  }
  else
  {
    swift_once();
    if (!v3) {
      goto LABEL_17;
    }
  }
  BOOL v6 = qword_26B189BD0 == a1 && *(void *)algn_26B189BD8 == (void)v3;
  if (!v6 && (sub_24D1494C8() & 1) == 0)
  {
    double v3 = (void *)sub_24D149258();
    goto LABEL_17;
  }
  return 1;
}

uint64_t type metadata accessor for BlurredView()
{
  return self;
}

uint64_t sub_24D114E24()
{
  sub_24D149268();
  sub_24D149298();
  swift_bridgeObjectRelease();
  sub_24D149298();
  sub_24D149268();
  sub_24D149298();
  uint64_t result = swift_bridgeObjectRelease();
  qword_26B189BE0 = 0x2E737265746C6966;
  *(void *)algn_26B189BE8 = 0xE800000000000000;
  return result;
}

uint64_t sub_24D114EC8()
{
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  sub_24D149268();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24D149298();
  qword_26B189BD0 = 0x2E737265746C6966;
  *(void *)algn_26B189BD8 = 0xE800000000000000;
  return result;
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

uint64_t sub_24D114FB4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D114FEC(uint64_t a1, unint64_t *a2)
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

void sub_24D115028()
{
  sub_24D1148D0(*(void *)(v0 + 16));
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

uint64_t sub_24D115048()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24D115080()
{
  sub_24D1149D4(*(void *)(v0 + 16));
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FrameRateReason(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FrameRateReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D1151FCLL);
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

uint64_t sub_24D115224(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D115230(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FrameRateReason()
{
  return &type metadata for FrameRateReason;
}

BOOL sub_24D11524C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24D115264()
{
  return sub_24D149528();
}

uint64_t sub_24D1152AC()
{
  return sub_24D149518();
}

uint64_t sub_24D1152D8()
{
  return sub_24D149528();
}

_DWORD *sub_24D11531C@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_24D11533C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_24D11534C()
{
  unint64_t result = qword_269857F98;
  if (!qword_269857F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269857F98);
  }
  return result;
}

unint64_t sub_24D1153A4()
{
  unint64_t result = qword_26B1892E0;
  if (!qword_26B1892E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1892E0);
  }
  return result;
}

uint64_t sub_24D1153F8()
{
  return 47;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterMultiply.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterMultiply.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterDestOut.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterDestOut.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.suppressDropletEffectFilters.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.suppressDropletEffectFilters.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.rightEdgeHintSize.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.rightEdgeHintSize.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.rightEdgeHintDropletRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.rightEdgeHintDropletRadius.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.edgeHintKeylineInnerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeHintKeylineInnerWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.edgeHintKeylineOuterWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeHintKeylineOuterWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

id DRPDropletPrototypeSettings.edgeHintKeylineAdaptiveColorMatrix.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeHintKeylineAdaptiveColorMatrix.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeHintCenterXAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeHintCenterXAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeHintCenterYAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeHintCenterYAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeHintContainerWidthAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeHintContainerWidthAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeHintContainerHeightAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeHintContainerHeightAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeHintKeylineStyleAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeHintKeylineStyleAnimationSettings.setter(void *a1)
{
}

double DRPDropletPrototypeSettings.edgeContentPresentedKeylineInnerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeContentPresentedKeylineInnerWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.edgeContentPresentedKeylineOuterWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeContentPresentedKeylineOuterWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

id DRPDropletPrototypeSettings.edgeContentPresentedKeylineAdaptiveColorMatrix.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeContentPresentedKeylineAdaptiveColorMatrix.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeContentPresentedCenterXAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeContentPresentedCenterXAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeContentPresentedCenterYAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeContentPresentedCenterYAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeContentPresentedContainerWidthAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeContentPresentedContainerWidthAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeContentPresentedContainerHeightAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeContentPresentedContainerHeightAnimationSettings.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.edgeContentPresentedKeylineStyleAnimationSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.edgeContentPresentedKeylineStyleAnimationSettings.setter(void *a1)
{
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftScreenBlendMode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftScreenBlendMode);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftScreenBlendMode.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftScreenBlendMode);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftAlpha.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftAlpha;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftAlpha.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftAlpha);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeBlurRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeBlurRadius.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeAmount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeAmount.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeAmount);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeStart.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeStart;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeStart.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeStart);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeEnd.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeEnd;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeEnd.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeEnd);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftRimIsSoft.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftRimIsSoft);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftRimIsSoft.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftRimIsSoft);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftSmallWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftSmallWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardScreenBlendMode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardScreenBlendMode);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardScreenBlendMode.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardScreenBlendMode);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardAlpha.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardAlpha;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardAlpha.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardAlpha);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeBlurRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeBlurRadius.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeAmount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeAmount.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeAmount);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeStart.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeStart;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeStart.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeStart);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeEnd.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeEnd;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeEnd.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeEnd);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardRimIsSoft.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardRimIsSoft);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardRimIsSoft.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardRimIsSoft);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardSmallWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardSmallWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightEDRGainAmount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightEDRGainAmount.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

id DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleColorMatrix.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleColorMatrix.setter(void *a1)
{
}

id DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleDefaultBehaviorSettings.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  swift_beginAccess();
  char v2 = *v1;
  return v2;
}

void sub_24D117D7C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  unsigned int v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
}

void DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleDefaultBehaviorSettings.setter(void *a1)
{
}

void sub_24D117DE4(void *a1, void *a2)
{
  unsigned int v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *unsigned int v4 = a1;
}

Swift::Void __swiftcall DRPDropletPrototypeSettings.setDefaultValues()()
{
  uint64_t v1 = v0;
  v16.super_class = (Class)DRPDropletPrototypeSettings;
  objc_msgSendSuper2(&v16, sel_setDefaultValues);
  objc_msgSend(v0, sel_setSuppressCompositingFilterMultiply_, 0);
  objc_msgSend(v0, sel_setSuppressCompositingFilterDestOut_, 0);
  objc_msgSend(v0, sel_setRightEdgeHintSize_, 53.3333333);
  objc_msgSend(v0, sel_setRightEdgeHintDropletRadius_, 25.0);
  objc_msgSend(v0, sel_setEdgeHintKeylineInnerWidth_, 0.0);
  objc_msgSend(v0, sel_setEdgeHintKeylineOuterWidth_, 2.5);
  id v2 = objc_msgSend(v0, sel_edgeHintKeylineAdaptiveColorMatrix);
  sub_24D118398();

  id v3 = objc_msgSend(v1, sel_edgeHintCenterXAnimationSettings);
  sub_24D118578();

  id v4 = objc_msgSend(v1, sel_edgeHintCenterYAnimationSettings);
  sub_24D118578();

  id v5 = objc_msgSend(v1, sel_edgeHintContainerWidthAnimationSettings);
  sub_24D118578();

  id v6 = objc_msgSend(v1, sel_edgeHintContainerHeightAnimationSettings);
  sub_24D118578();

  id v7 = objc_msgSend(v1, sel_edgeHintKeylineStyleAnimationSettings);
  sub_24D118798();

  objc_msgSend(v1, sel_setEdgeContentPresentedKeylineInnerWidth_, 0.0);
  objc_msgSend(v1, sel_setEdgeContentPresentedKeylineOuterWidth_, 2.5);
  id v8 = objc_msgSend(v1, sel_edgeContentPresentedKeylineAdaptiveColorMatrix);
  sub_24D118398();

  id v9 = objc_msgSend(v1, sel_edgeContentPresentedCenterXAnimationSettings);
  sub_24D118578();

  id v10 = objc_msgSend(v1, sel_edgeContentPresentedCenterYAnimationSettings);
  sub_24D118578();

  id v11 = objc_msgSend(v1, sel_edgeContentPresentedContainerWidthAnimationSettings);
  sub_24D118578();

  id v12 = objc_msgSend(v1, sel_edgeContentPresentedContainerHeightAnimationSettings);
  sub_24D118578();

  id v13 = objc_msgSend(v1, sel_edgeContentPresentedKeylineStyleAnimationSettings);
  sub_24D118798();

  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftScreenBlendMode_, 1);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftRimIsSoft_, 0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftAlpha_, 0.36);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius_, 0.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftLargeAmount_, 0.87);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftLargeStart_, 0.34);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftLargeEnd_, 0.81);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftSmallWidth_, 2.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardScreenBlendMode_, 1);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardRimIsSoft_, 1);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardAlpha_, 0.7);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius_, 0.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardLargeAmount_, 0.4);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardLargeStart_, 0.29);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardLargeEnd_, 0.65);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardSmallWidth_, 4.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightEDRGainAmount_, 2.0);
  id v14 = objc_msgSend(v1, sel_intelligentEdgeLightKeylineStyleColorMatrix);
  CAColorMatrixMakeMultiplyColor();
  sub_24D13EF5C((float *)&v17);

  id v15 = objc_msgSend(v1, sel_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  sub_24D118798();
}

id sub_24D118398()
{
  objc_msgSend(v0, sel_setDefaultValues);
  objc_msgSend(v0, sel_setM11_, 0.0);
  objc_msgSend(v0, sel_setM12_, 0.0);
  objc_msgSend(v0, sel_setM13_, 0.0);
  objc_msgSend(v0, sel_setM14_, 0.0);
  objc_msgSend(v0, sel_setM15_, 0.943);
  objc_msgSend(v0, sel_setM21_, 0.0);
  objc_msgSend(v0, sel_setM22_, 0.0);
  objc_msgSend(v0, sel_setM23_, 0.0);
  objc_msgSend(v0, sel_setM24_, 0.0);
  objc_msgSend(v0, sel_setM25_, 0.943);
  objc_msgSend(v0, sel_setM31_, 0.0);
  objc_msgSend(v0, sel_setM32_, 0.0);
  objc_msgSend(v0, sel_setM33_, 0.0);
  objc_msgSend(v0, sel_setM34_, 0.0);
  objc_msgSend(v0, sel_setM35_, 0.943);
  objc_msgSend(v0, sel_setM41_, -0.213);
  objc_msgSend(v0, sel_setM42_, -0.715);
  objc_msgSend(v0, sel_setM43_, -0.072);
  objc_msgSend(v0, sel_setM44_, 0.14);
  return objc_msgSend(v0, sel_setM45_, 0.0);
}

void sub_24D118578()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D149208();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setDefaultValues);
  objc_msgSend(v1, sel_setDampingRatio_, 0.7);
  objc_msgSend(v1, sel_setResponse_, 0.6);
  objc_msgSend(v1, sel_setBehaviorType_, 1);
  id v6 = (void *)sub_24D149258();
  objc_msgSend(v1, sel_setName_, v6);

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F622D0]), sel_initWithDefaultValues);
  if (v7)
  {
    id v8 = v7;
    (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F7C468], v2);
    sub_24D1491F8();
    int v10 = v9;
    int v12 = v11;
    int v14 = v13;
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    v19[15] = 1;
    sub_24D11C130();
    uint64_t v15 = sub_24D149218();
    LODWORD(v16) = v10;
    LODWORD(v17) = v12;
    LODWORD(v18) = v14;
    objc_msgSend(v8, sel_setFrameRateRange_highFrameRateReason_, v15, v16, v17, v18);
    objc_msgSend(v1, sel_setPreferredFrameRateRange_, v8);
  }
  else
  {
    __break(1u);
  }
}

void sub_24D118798()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D149208();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setDefaultValues);
  objc_msgSend(v1, sel_setDampingRatio_, 0.95);
  objc_msgSend(v1, sel_setResponse_, 0.2);
  objc_msgSend(v1, sel_setTrackingDampingRatio_, 1.0);
  objc_msgSend(v1, sel_setTrackingResponse_, 0.15);
  objc_msgSend(v1, sel_setBehaviorType_, 1);
  id v6 = (void *)sub_24D149258();
  objc_msgSend(v1, sel_setName_, v6);

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F622D0]), sel_initWithDefaultValues);
  if (v7)
  {
    id v8 = v7;
    (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F7C468], v2);
    sub_24D1491F8();
    int v10 = v9;
    int v12 = v11;
    int v14 = v13;
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    v19[15] = 1;
    sub_24D11C130();
    uint64_t v15 = sub_24D149218();
    LODWORD(v16) = v10;
    LODWORD(v17) = v12;
    LODWORD(v18) = v14;
    objc_msgSend(v8, sel_setFrameRateRange_highFrameRateReason_, v15, v16, v17, v18);
    objc_msgSend(v1, sel_setPreferredFrameRateRange_, v8);
  }
  else
  {
    __break(1u);
  }
}

void sub_24D118A34(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24D14B3D0;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  id v5 = (void *)sub_24D149258();
  id v6 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v7 = self;
  id v8 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v5, v6);

  if (!v8)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v9 = sub_24D114FEC(0, &qword_2698580E8);
  *(void *)(v4 + 56) = v9;
  *(void *)(v4 + 32) = v8;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  int v10 = (void *)sub_24D149258();
  int v11 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v10, v11);

  if (!v12)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  *(void *)(v4 + 88) = v9;
  *(void *)(v4 + 64) = v12;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  int v13 = (void *)sub_24D149258();
  int v14 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v56 = self;
  id v15 = objc_msgSend(v56, sel_rowWithTitle_valueKeyPath_, v13, v14);

  if (!v15)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (!objc_msgSend(v15, sel_between_and_, 0.0, 1.0))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  uint64_t v16 = sub_24D114FEC(0, &qword_2698580F0);
  swift_dynamicCast();

  *(void *)(v4 + 120) = v16;
  *(void *)(v4 + 96) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  uint64_t v57 = a1;
  sub_24D149298();
  sub_24D149298();
  double v17 = (void *)sub_24D149258();
  double v18 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v55 = self;
  id v19 = objc_msgSend(v55, sel_rowWithTitle_valueKeyPath_, v17, v18);

  if (!v19)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (!objc_msgSend(v19, sel_minValue_maxValue_, 0.0, 1.0))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  uint64_t v20 = sub_24D114FEC(0, (unint64_t *)&unk_269858108);
  swift_dynamicCast();

  *(void *)(v4 + 152) = v20;
  *(void *)(v4 + 128) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  id v21 = (void *)sub_24D149258();
  v22 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v56, sel_rowWithTitle_valueKeyPath_, v21, v22);

  if (!v23)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (!objc_msgSend(v23, sel_between_and_, 0.0, 60.0))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 184) = v16;
  *(void *)(v4 + 160) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v24 = (void *)sub_24D149258();
  uint64_t v25 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v55, sel_rowWithTitle_valueKeyPath_, v24, v25);

  if (!v26)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (!objc_msgSend(v26, sel_minValue_maxValue_, 0.0, 60.0))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 216) = v20;
  *(void *)(v4 + 192) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  id v27 = (void *)sub_24D149258();
  v28 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(v56, sel_rowWithTitle_valueKeyPath_, v27, v28);

  if (!v29)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (!objc_msgSend(v29, sel_between_and_, 0.0, 1.0))
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 248) = v16;
  *(void *)(v4 + 224) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v30 = (void *)sub_24D149258();
  uint64_t v31 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v32 = objc_msgSend(v55, sel_rowWithTitle_valueKeyPath_, v30, v31);

  if (!v32)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (!objc_msgSend(v32, sel_minValue_maxValue_, 0.0, 1.0))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 280) = v20;
  *(void *)(v4 + 256) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v33 = (void *)sub_24D149258();
  uint64_t v34 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v56, sel_rowWithTitle_valueKeyPath_, v33, v34);

  if (!v35)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (!objc_msgSend(v35, sel_between_and_, 0.0, 1.0))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 312) = v16;
  *(void *)(v4 + 288) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v36 = (void *)sub_24D149258();
  v37 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v38 = objc_msgSend(v55, sel_rowWithTitle_valueKeyPath_, v36, v37);

  if (!v38)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (!objc_msgSend(v38, sel_minValue_maxValue_, 0.0, 1.0))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 344) = v20;
  *(void *)(v4 + 320) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  uint64_t v39 = (void *)sub_24D149258();
  objc_super v40 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v41 = objc_msgSend(v56, sel_rowWithTitle_valueKeyPath_, v39, v40);

  if (!v41)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (!objc_msgSend(v41, sel_between_and_, 0.0, 1.0))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 376) = v16;
  *(void *)(v4 + 352) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v42 = (void *)sub_24D149258();
  v43 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v44 = objc_msgSend(v55, sel_rowWithTitle_valueKeyPath_, v42, v43);

  if (!v44)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (!objc_msgSend(v44, sel_minValue_maxValue_, 0.0, 1.0))
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 408) = v20;
  *(void *)(v4 + 384) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v45 = (void *)sub_24D149258();
  v46 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v47 = objc_msgSend(v56, sel_rowWithTitle_valueKeyPath_, v45, v46);

  if (!v47)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (!objc_msgSend(v47, sel_between_and_, 0.0, 40.0))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 440) = v16;
  *(void *)(v4 + 416) = v58;
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = 0xD000000000000020;
  *((void *)&v60[0] + 1) = 0x800000024D14D180;
  sub_24D149298();
  sub_24D149298();
  v48 = (void *)sub_24D149258();
  v49 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v50 = objc_msgSend(v55, sel_rowWithTitle_valueKeyPath_, v48, v49);

  if (!v50)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (!objc_msgSend(v50, sel_minValue_maxValue_, 0.0, 40.0))
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  v51 = self;
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v59, v60);
  swift_dynamicCast();

  *(void *)(v4 + 472) = v20;
  *(void *)(v4 + 448) = v58;
  v52 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  *(void *)&v60[0] = v57;
  *((void *)&v60[0] + 1) = a2;
  swift_bridgeObjectRetain();
  sub_24D149298();
  v53 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v54 = objc_msgSend(v51, sel_sectionWithRows_title_, v52, v53);

  if (!v54) {
LABEL_55:
  }
    __break(1u);
}

void _sSo27DRPDropletPrototypeSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24D14B240;
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_actionWithSettingsKeyPath_, 0);
  uint64_t v3 = (void *)sub_24D149258();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_rowWithTitle_action_, v3, v2);

  if (!v5)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v137 = v1;
  id v6 = self;
  uint64_t v134 = sub_24D114FEC(0, &qword_2698580E0);
  *(void *)(v0 + 56) = v134;
  *(void *)(v0 + 32) = v5;
  id v7 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_sectionWithRows_, v7);

  if (!v8)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v131 = v8;
  id v140 = v6;
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24D14B3E0;
  int v10 = (void *)sub_24D149258();
  int v11 = (void *)sub_24D149258();
  id v12 = self;
  id v13 = objc_msgSend(v12, sel_rowWithTitle_valueKeyPath_, v10, v11);

  if (!v13)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v14 = sub_24D114FEC(0, &qword_2698580E8);
  *(void *)(v9 + 56) = v14;
  *(void *)(v9 + 32) = v13;
  id v15 = (void *)sub_24D149258();
  uint64_t v16 = (void *)sub_24D149258();
  id v17 = objc_msgSend(v12, sel_rowWithTitle_valueKeyPath_, v15, v16);

  if (!v17)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  *(void *)(v9 + 88) = v14;
  *(void *)(v9 + 64) = v17;
  double v18 = (void *)sub_24D149258();
  id v19 = (void *)sub_24D149258();
  id v20 = objc_msgSend(v12, sel_rowWithTitle_valueKeyPath_, v18, v19);

  if (!v20)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  *(void *)(v9 + 120) = v14;
  *(void *)(v9 + 96) = v20;
  id v21 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  v22 = (void *)sub_24D149258();
  id v23 = objc_msgSend(v140, sel_sectionWithRows_title_, v21, v22);

  if (!v23)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_24D14B3F0;
  uint64_t v25 = (void *)sub_24D149258();
  id v26 = (void *)sub_24D149258();
  v142 = self;
  id v27 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v25, v26);

  if (!v27)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (!objc_msgSend(v27, sel_precision_, 3))
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v145, &v146);
  uint64_t v28 = sub_24D114FEC(0, &qword_2698580F0);
  swift_dynamicCast();

  *(void *)(v24 + 56) = v28;
  *(void *)(v24 + 32) = v144;
  id v29 = (void *)sub_24D149258();
  v30 = (void *)sub_24D149258();
  id v31 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v29, v30);

  if (!v31)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  if (!objc_msgSend(v31, sel_precision_, 3))
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  v130 = v23;
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v145, &v146);
  swift_dynamicCast();

  *(void *)(v24 + 88) = v28;
  *(void *)(v24 + 64) = v144;
  id v32 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  v33 = (void *)sub_24D149258();
  id v34 = objc_msgSend(v140, sel_sectionWithRows_title_, v32, v33);

  if (!v34)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_24D14B400;
  v36 = (void *)sub_24D149258();
  v37 = (void *)sub_24D149258();
  id v38 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v36, v37);

  if (!v38)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (!objc_msgSend(v38, sel_precision_, 3))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v145, &v146);
  swift_dynamicCast();

  *(void *)(v35 + 56) = v28;
  *(void *)(v35 + 32) = v144;
  uint64_t v39 = (void *)sub_24D149258();
  objc_super v40 = (void *)sub_24D149258();
  id v41 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v39, v40);

  if (!v41)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  if (!objc_msgSend(v41, sel_precision_, 3))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v129 = v34;
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v145, &v146);
  swift_dynamicCast();

  *(void *)(v35 + 88) = v28;
  *(void *)(v35 + 64) = v144;
  v42 = (void *)sub_24D149258();
  v43 = (void *)sub_24D149258();
  id v44 = self;
  id v45 = objc_msgSend(v44, sel_rowWithTitle_childSettingsKeyPath_, v42, v43);

  if (!v45)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  uint64_t v46 = sub_24D114FEC(0, &qword_2698580F8);
  *(void *)(v35 + 120) = v46;
  *(void *)(v35 + 96) = v45;
  id v47 = (void *)sub_24D149258();
  v48 = (void *)sub_24D149258();
  id v49 = objc_msgSend(v44, sel_rowWithTitle_childSettingsKeyPath_, v47, v48);

  if (!v49)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  *(void *)(v35 + 152) = v46;
  *(void *)(v35 + 128) = v49;
  id v50 = (void *)sub_24D149258();
  v51 = (void *)sub_24D149258();
  id v52 = objc_msgSend(v44, sel_rowWithTitle_childSettingsKeyPath_, v50, v51);

  if (!v52)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  *(void *)(v35 + 184) = v46;
  *(void *)(v35 + 160) = v52;
  v53 = (void *)sub_24D149258();
  id v54 = (void *)sub_24D149258();
  id v55 = objc_msgSend(v44, sel_rowWithTitle_childSettingsKeyPath_, v53, v54);

  if (!v55)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  *(void *)(v35 + 216) = v46;
  *(void *)(v35 + 192) = v55;
  id v56 = (void *)sub_24D149258();
  uint64_t v57 = (void *)sub_24D149258();
  id v58 = objc_msgSend(v44, sel_rowWithTitle_childSettingsKeyPath_, v56, v57);

  if (!v58)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  *(void *)(v35 + 248) = v46;
  *(void *)(v35 + 224) = v58;
  v59 = (void *)sub_24D149258();
  v60 = (void *)sub_24D149258();
  id v138 = v44;
  id v61 = objc_msgSend(v44, sel_rowWithTitle_childSettingsKeyPath_, v59, v60);

  if (!v61)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  *(void *)(v35 + 280) = v46;
  *(void *)(v35 + 256) = v61;
  v62 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  v63 = (void *)sub_24D149258();
  id v64 = objc_msgSend(v140, sel_sectionWithRows_title_, v62, v63);

  if (!v64)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = xmmword_24D14B400;
  v66 = (void *)sub_24D149258();
  v67 = (void *)sub_24D149258();
  id v68 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v66, v67);

  if (!v68)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if (!objc_msgSend(v68, sel_precision_, 3))
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  v136 = v64;
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v145, &v146);
  swift_dynamicCast();

  *(void *)(v65 + 56) = v28;
  *(void *)(v65 + 32) = v144;
  v69 = (void *)sub_24D149258();
  v70 = (void *)sub_24D149258();
  id v71 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v69, v70);

  if (!v71)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  if (!objc_msgSend(v71, sel_precision_, 3))
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v145, &v146);
  swift_dynamicCast();

  *(void *)(v65 + 88) = v28;
  *(void *)(v65 + 64) = v144;
  v72 = (void *)sub_24D149258();
  v73 = (void *)sub_24D149258();
  id v74 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v72, v73);

  if (!v74)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  *(void *)(v65 + 120) = v46;
  *(void *)(v65 + 96) = v74;
  v75 = (void *)sub_24D149258();
  v76 = (void *)sub_24D149258();
  id v77 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v75, v76);

  if (!v77)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  *(void *)(v65 + 152) = v46;
  *(void *)(v65 + 128) = v77;
  v78 = (void *)sub_24D149258();
  v79 = (void *)sub_24D149258();
  id v80 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v78, v79);

  if (!v80)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  *(void *)(v65 + 184) = v46;
  *(void *)(v65 + 160) = v80;
  v81 = (void *)sub_24D149258();
  v82 = (void *)sub_24D149258();
  id v83 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v81, v82);

  if (!v83)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  *(void *)(v65 + 216) = v46;
  *(void *)(v65 + 192) = v83;
  v84 = (void *)sub_24D149258();
  v85 = (void *)sub_24D149258();
  id v86 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v84, v85);

  if (!v86)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  *(void *)(v65 + 248) = v46;
  *(void *)(v65 + 224) = v86;
  v87 = (void *)sub_24D149258();
  v88 = (void *)sub_24D149258();
  id v89 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v87, v88);

  if (!v89)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  *(void *)(v65 + 280) = v46;
  *(void *)(v65 + 256) = v89;
  v90 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  v91 = (void *)sub_24D149258();
  id v92 = objc_msgSend(v140, sel_sectionWithRows_title_, v90, v91);

  if (!v92)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v135 = v92;
  sub_24D118A34(1952870227, 0xE400000000000000);
  v133 = v93;
  sub_24D118A34(1685217608, 0xE400000000000000);
  v132 = v94;
  uint64_t v95 = swift_allocObject();
  *(_OWORD *)(v95 + 16) = xmmword_24D14B3E0;
  v96 = (void *)sub_24D149258();
  v97 = (void *)sub_24D149258();
  id v98 = objc_msgSend(v142, sel_rowWithTitle_valueKeyPath_, v96, v97);

  if (!v98)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  *(void *)(v95 + 56) = v28;
  *(void *)(v95 + 32) = v98;
  v99 = (void *)sub_24D149258();
  v100 = (void *)sub_24D149258();
  id v101 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v99, v100);

  if (!v101)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  *(void *)(v95 + 88) = v46;
  *(void *)(v95 + 64) = v101;
  v102 = (void *)sub_24D149258();
  v103 = (void *)sub_24D149258();
  id v104 = objc_msgSend(v138, sel_rowWithTitle_childSettingsKeyPath_, v102, v103);

  if (!v104)
  {
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
    return;
  }
  *(void *)(v95 + 120) = v46;
  *(void *)(v95 + 96) = v104;
  v105 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  v106 = (void *)sub_24D149258();
  id v107 = objc_msgSend(v140, sel_sectionWithRows_title_, v105, v106);

  v143 = v107;
  if (!v107) {
    goto LABEL_82;
  }
  *(void *)&v145[0] = MEMORY[0x263F8EE78];
  uint64_t v108 = 50;
  sub_24D1283D8(0, 50, 0);
  uint64_t v109 = *(void *)&v145[0];
  do
  {
    id v110 = objc_msgSend(v137, sel_actionWithSettingsKeyPath_, 0, v129);
    v111 = (void *)sub_24D149258();
    id v112 = objc_msgSend(v4, sel_rowWithTitle_action_, v111, v110);

    if (!v112)
    {
      __break(1u);
      goto LABEL_46;
    }
    uint64_t v147 = v134;
    *(void *)&long long v146 = v112;
    *(void *)&v145[0] = v109;
    unint64_t v114 = *(void *)(v109 + 16);
    unint64_t v113 = *(void *)(v109 + 24);
    if (v114 >= v113 >> 1)
    {
      sub_24D1283D8((char *)(v113 > 1), v114 + 1, 1);
      uint64_t v109 = *(void *)&v145[0];
    }
    *(void *)(v109 + 16) = v114 + 1;
    sub_24D11C120(&v146, (_OWORD *)(v109 + 32 * v114 + 32));
    --v108;
  }
  while (v108);
  v115 = (void *)sub_24D1492B8();
  swift_release();
  v116 = (void *)sub_24D149258();
  id v117 = objc_msgSend(v140, sel_sectionWithRows_title_, v115, v116);

  if (!v117) {
    goto LABEL_83;
  }
  uint64_t v118 = swift_allocObject();
  *(_OWORD *)(v118 + 16) = xmmword_24D14B410;
  uint64_t v119 = sub_24D114FEC(0, &qword_269858100);
  *(void *)(v118 + 32) = v131;
  *(void *)(v118 + 56) = v119;
  *(void *)(v118 + 64) = v130;
  *(void *)(v118 + 88) = v119;
  *(void *)(v118 + 96) = v133;
  *(void *)(v118 + 120) = v119;
  *(void *)(v118 + 128) = v132;
  *(void *)(v118 + 152) = v119;
  *(void *)(v118 + 160) = v143;
  *(void *)(v118 + 184) = v119;
  *(void *)(v118 + 192) = v129;
  *(void *)(v118 + 216) = v119;
  *(void *)(v118 + 224) = v136;
  *(void *)(v118 + 248) = v119;
  *(void *)(v118 + 256) = v135;
  *(void *)(v118 + 312) = v119;
  *(void *)(v118 + 280) = v119;
  *(void *)(v118 + 288) = v117;
  id v139 = v131;
  id v120 = v130;
  id v141 = v133;
  id v121 = v132;
  id v122 = v143;
  id v123 = v129;
  id v124 = v136;
  id v125 = v135;
  id v126 = v117;
  v127 = (void *)sub_24D149258();
  v128 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v140, sel_moduleWithTitle_contents_, v127, v128);
}

char *keypath_get_selector_suppressCompositingFilterMultiply()
{
  return sel_suppressCompositingFilterMultiply;
}

id sub_24D11B388@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_suppressCompositingFilterMultiply);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11B3BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuppressCompositingFilterMultiply_, *a1);
}

char *keypath_get_selector_suppressCompositingFilterDestOut()
{
  return sel_suppressCompositingFilterDestOut;
}

id sub_24D11B3DC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_suppressCompositingFilterDestOut);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11B410(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuppressCompositingFilterDestOut_, *a1);
}

char *keypath_get_selector_suppressDropletEffectFilters()
{
  return sel_suppressDropletEffectFilters;
}

id sub_24D11B430@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_suppressDropletEffectFilters);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11B464(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuppressDropletEffectFilters_, *a1);
}

char *keypath_get_selector_rightEdgeHintSize()
{
  return sel_rightEdgeHintSize;
}

id sub_24D11B484@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_rightEdgeHintSize);
  *a2 = v4;
  return result;
}

id sub_24D11B4B8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRightEdgeHintSize_, *a1);
}

char *keypath_get_selector_rightEdgeHintDropletRadius()
{
  return sel_rightEdgeHintDropletRadius;
}

id sub_24D11B4D8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_rightEdgeHintDropletRadius);
  *a2 = v4;
  return result;
}

id sub_24D11B50C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRightEdgeHintDropletRadius_, *a1);
}

char *keypath_get_selector_edgeHintKeylineInnerWidth()
{
  return sel_edgeHintKeylineInnerWidth;
}

id sub_24D11B52C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintKeylineInnerWidth);
  *a2 = v4;
  return result;
}

id sub_24D11B560(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineInnerWidth_, *a1);
}

char *keypath_get_selector_edgeHintKeylineOuterWidth()
{
  return sel_edgeHintKeylineOuterWidth;
}

id sub_24D11B580@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintKeylineOuterWidth);
  *a2 = v4;
  return result;
}

id sub_24D11B5B4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineOuterWidth_, *a1);
}

char *keypath_get_selector_edgeHintKeylineAdaptiveColorMatrix()
{
  return sel_edgeHintKeylineAdaptiveColorMatrix;
}

id sub_24D11B5D4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintKeylineAdaptiveColorMatrix);
  *a2 = result;
  return result;
}

id sub_24D11B610(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineAdaptiveColorMatrix_, *a1);
}

char *keypath_get_selector_edgeHintCenterXAnimationSettings()
{
  return sel_edgeHintCenterXAnimationSettings;
}

id sub_24D11B630@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintCenterXAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B66C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintCenterXAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintCenterYAnimationSettings()
{
  return sel_edgeHintCenterYAnimationSettings;
}

id sub_24D11B68C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintCenterYAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B6C8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintCenterYAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintContainerWidthAnimationSettings()
{
  return sel_edgeHintContainerWidthAnimationSettings;
}

id sub_24D11B6E8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintContainerWidthAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B724(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintContainerWidthAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintContainerHeightAnimationSettings()
{
  return sel_edgeHintContainerHeightAnimationSettings;
}

id sub_24D11B744@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintContainerHeightAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B780(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintContainerHeightAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintKeylineStyleAnimationSettings()
{
  return sel_edgeHintKeylineStyleAnimationSettings;
}

id sub_24D11B7A0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeHintKeylineStyleAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B7DC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineStyleAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineInnerWidth()
{
  return sel_edgeContentPresentedKeylineInnerWidth;
}

id sub_24D11B7FC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineInnerWidth);
  *a2 = v4;
  return result;
}

id sub_24D11B830(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineInnerWidth_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineOuterWidth()
{
  return sel_edgeContentPresentedKeylineOuterWidth;
}

id sub_24D11B850@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineOuterWidth);
  *a2 = v4;
  return result;
}

id sub_24D11B884(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineOuterWidth_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineAdaptiveColorMatrix()
{
  return sel_edgeContentPresentedKeylineAdaptiveColorMatrix;
}

id sub_24D11B8A4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineAdaptiveColorMatrix);
  *a2 = result;
  return result;
}

id sub_24D11B8E0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineAdaptiveColorMatrix_, *a1);
}

char *keypath_get_selector_edgeContentPresentedCenterXAnimationSettings()
{
  return sel_edgeContentPresentedCenterXAnimationSettings;
}

id sub_24D11B900@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedCenterXAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B93C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedCenterXAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedCenterYAnimationSettings()
{
  return sel_edgeContentPresentedCenterYAnimationSettings;
}

id sub_24D11B95C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedCenterYAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B998(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedCenterYAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedContainerWidthAnimationSettings()
{
  return sel_edgeContentPresentedContainerWidthAnimationSettings;
}

id sub_24D11B9B8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedContainerWidthAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11B9F4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedContainerWidthAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedContainerHeightAnimationSettings()
{
  return sel_edgeContentPresentedContainerHeightAnimationSettings;
}

id sub_24D11BA14@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedContainerHeightAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11BA50(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedContainerHeightAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineStyleAnimationSettings()
{
  return sel_edgeContentPresentedKeylineStyleAnimationSettings;
}

id sub_24D11BA70@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineStyleAnimationSettings);
  *a2 = result;
  return result;
}

id sub_24D11BAAC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineStyleAnimationSettings_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftScreenBlendMode()
{
  return sel_intelligentEdgeLightKeylineStyleSoftScreenBlendMode;
}

id sub_24D11BACC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftScreenBlendMode);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11BB00(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftScreenBlendMode_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftAlpha()
{
  return sel_intelligentEdgeLightKeylineStyleSoftAlpha;
}

id sub_24D11BB20@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftAlpha);
  *a2 = v4;
  return result;
}

id sub_24D11BB54(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftAlpha_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius()
{
  return sel_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
}

id sub_24D11BB74@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  *a2 = v4;
  return result;
}

id sub_24D11BBA8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftLargeAmount()
{
  return sel_intelligentEdgeLightKeylineStyleSoftLargeAmount;
}

id sub_24D11BBC8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftLargeAmount);
  *a2 = v4;
  return result;
}

id sub_24D11BBFC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftLargeAmount_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftLargeStart()
{
  return sel_intelligentEdgeLightKeylineStyleSoftLargeStart;
}

id sub_24D11BC1C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftLargeStart);
  *a2 = v4;
  return result;
}

id sub_24D11BC50(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftLargeStart_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftLargeEnd()
{
  return sel_intelligentEdgeLightKeylineStyleSoftLargeEnd;
}

id sub_24D11BC70@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftLargeEnd);
  *a2 = v4;
  return result;
}

id sub_24D11BCA4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftLargeEnd_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftRimIsSoft()
{
  return sel_intelligentEdgeLightKeylineStyleSoftRimIsSoft;
}

id sub_24D11BCC4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftRimIsSoft);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11BCF8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftRimIsSoft_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftSmallWidth()
{
  return sel_intelligentEdgeLightKeylineStyleSoftSmallWidth;
}

id sub_24D11BD18@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  *a2 = v4;
  return result;
}

id sub_24D11BD4C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftSmallWidth_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardScreenBlendMode()
{
  return sel_intelligentEdgeLightKeylineStyleHardScreenBlendMode;
}

id sub_24D11BD6C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardScreenBlendMode);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11BDA0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardScreenBlendMode_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardAlpha()
{
  return sel_intelligentEdgeLightKeylineStyleHardAlpha;
}

id sub_24D11BDC0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardAlpha);
  *a2 = v4;
  return result;
}

id sub_24D11BDF4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardAlpha_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardLargeBlurRadius()
{
  return sel_intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
}

id sub_24D11BE14@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  *a2 = v4;
  return result;
}

id sub_24D11BE48(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardLargeAmount()
{
  return sel_intelligentEdgeLightKeylineStyleHardLargeAmount;
}

id sub_24D11BE68@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardLargeAmount);
  *a2 = v4;
  return result;
}

id sub_24D11BE9C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardLargeAmount_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardLargeStart()
{
  return sel_intelligentEdgeLightKeylineStyleHardLargeStart;
}

id sub_24D11BEBC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardLargeStart);
  *a2 = v4;
  return result;
}

id sub_24D11BEF0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardLargeStart_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardLargeEnd()
{
  return sel_intelligentEdgeLightKeylineStyleHardLargeEnd;
}

id sub_24D11BF10@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardLargeEnd);
  *a2 = v4;
  return result;
}

id sub_24D11BF44(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardLargeEnd_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardRimIsSoft()
{
  return sel_intelligentEdgeLightKeylineStyleHardRimIsSoft;
}

id sub_24D11BF64@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardRimIsSoft);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D11BF98(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardRimIsSoft_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardSmallWidth()
{
  return sel_intelligentEdgeLightKeylineStyleHardSmallWidth;
}

id sub_24D11BFB8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardSmallWidth);
  *a2 = v4;
  return result;
}

id sub_24D11BFEC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardSmallWidth_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightEDRGainAmount()
{
  return sel_intelligentEdgeLightEDRGainAmount;
}

id sub_24D11C00C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightEDRGainAmount);
  *a2 = v4;
  return result;
}

id sub_24D11C040(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightEDRGainAmount_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleColorMatrix()
{
  return sel_intelligentEdgeLightKeylineStyleColorMatrix;
}

id sub_24D11C060@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleColorMatrix);
  *a2 = result;
  return result;
}

id sub_24D11C09C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleColorMatrix_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings()
{
  return sel_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings;
}

id sub_24D11C0BC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  *a2 = result;
  return result;
}

id sub_24D11C0F8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleDefaultBehaviorSettings_, *a1);
}

uint64_t type metadata accessor for DRPDropletPrototypeSettings(uint64_t a1)
{
  return sub_24D114FEC(a1, &qword_26B1894D0);
}

_OWORD *sub_24D11C120(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_24D11C130()
{
  unint64_t result = qword_26B1892D0;
  if (!qword_26B1892D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1892D0);
  }
  return result;
}

double DRPDropletViewConfiguration.centerX.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_centerX;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.centerX.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_centerX);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.centerY.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_centerY;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.centerY.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_centerY);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t DRPDropletViewConfiguration.boundaryEdges.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t DRPDropletViewConfiguration.boundaryEdges.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.containerCornerRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.containerCornerRadius.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.containerHeight.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.containerHeight.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.containerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.containerWidth.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

__n128 DRPDropletViewConfiguration.containerTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  long long v5 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  __n128 result = *(__n128 *)(v3 + 32);
  long long v8 = *(_OWORD *)(v3 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v8;
  return result;
}

__n128 DRPDropletViewConfiguration.containerTransform.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 80) = v4;
  long long v5 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 112) = v5;
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 16) = v6;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(v3 + 32) = result;
  *(_OWORD *)(v3 + 48) = v8;
  return result;
}

double sub_24D11CAA8@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  objc_msgSend(*a1, sel_containerTransform);
  double result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  a2[5] = v9;
  a2[6] = v10;
  a2[7] = v11;
  return result;
}

id sub_24D11CB04(_OWORD *a1, void **a2)
{
  long long v2 = *a2;
  long long v3 = a1[1];
  v8[0] = *a1;
  v8[1] = v3;
  long long v4 = a1[3];
  v8[2] = a1[2];
  v8[3] = v4;
  long long v5 = a1[5];
  v8[4] = a1[4];
  v8[5] = v5;
  long long v6 = a1[7];
  v8[6] = a1[6];
  v8[7] = v6;
  return objc_msgSend(v2, sel_setContainerTransform_, v8);
}

void *DRPDropletViewConfiguration.dropletColor.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  long long v2 = *v1;
  id v3 = v2;
  return v2;
}

void DRPDropletViewConfiguration.dropletColor.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  long long v4 = *v3;
  *id v3 = a1;
}

double DRPDropletViewConfiguration.dropletRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.dropletRadius.setter(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t DRPDropletViewConfiguration.disableDropletEffectFilters.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration_disableDropletEffectFilters);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletViewConfiguration.disableDropletEffectFilters.setter(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_disableDropletEffectFilters);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.boundaryOutsets.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.boundaryOutsets.setter(double a1, double a2, double a3, double a4)
{
  long long v9 = (double *)(v4 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets);
  uint64_t result = swift_beginAccess();
  *long long v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t DRPDropletViewConfiguration.keylineStyle.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t DRPDropletViewConfiguration.keylineStyle.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t DRPDropletViewConfiguration.anyAnimationCompletionBlock()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  sub_24D123500(v1);
  return v1;
}

uint64_t sub_24D11D2E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v7 = sub_24D149268();
  uint64_t v9 = v8;
  swift_retain();
  v6(v7, v9, a3, a4);
  swift_release();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall DRPDropletViewConfiguration.removeAnyAnimationCompletionBlocks()()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  void *v1 = 0;
  v1[1] = 0;
  sub_24D124CB4(v2);
}

uint64_t DRPDropletViewConfiguration.addAnyAnimationCompletionBlock(_:)(uint64_t a1, uint64_t a2)
{
  long long v5 = (uint64_t (**)(uint64_t, uint64_t, char, char))(v2
                                                             + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock + 8);
  if (v6)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    *(void *)(v8 + 24) = v7;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a1;
    *(void *)(v9 + 24) = a2;
    long long v10 = (void *)swift_allocObject();
    v10[2] = sub_24D11D538;
    v10[3] = v8;
    v10[4] = sub_24D11D538;
    v10[5] = v9;
    long long v11 = sub_24D123258;
  }
  else
  {
    long long v10 = (void *)swift_allocObject();
    v10[2] = a1;
    v10[3] = a2;
    long long v11 = sub_24D11D538;
  }
  id v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v10;
  *long long v5 = sub_24D11D53C;
  v5[1] = (uint64_t (*)(uint64_t, uint64_t, char, char))v13;
  swift_retain();
  sub_24D123500(v6);
  return sub_24D124CB4(v6);
}

uint64_t sub_24D11D500()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D11D53C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  long long v5 = *(uint64_t (**)(void *, char *, char *))(v4 + 16);
  v9[0] = a1;
  v9[1] = a2;
  char v8 = a3;
  char v7 = a4;
  return v5(v9, &v8, &v7);
}

uint64_t sub_24D11D584(void *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void, void, void))(v3 + 16))(*a1, a1[1], *a2, *a3);
}

uint64_t (*DRPDropletViewConfiguration.animationBlock(forKeyPath:)(uint64_t a1, uint64_t a2))(uint64_t a1)
{
  long long v5 = (uint64_t *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_24D121ADC(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  long long v11 = *(_OWORD *)(*(void *)(v6 + 56) + 16 * v7);
  swift_retain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(swift_allocObject() + 16) = v11;
  uint64_t v9 = sub_24D1232D4;
LABEL_6:
  swift_endAccess();
  return v9;
}

void sub_24D11D81C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t DRPDropletViewConfiguration.addAlongsideAnimationBlock(forKeyPath:animationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if (!*(void *)(*v9 + 16)) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_24D121ADC(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_endAccess();
    if (a3)
    {
      id v15 = (void *)swift_allocObject();
      v15[2] = a3;
      v15[3] = a4;
      uint64_t v16 = sub_24D123394;
      goto LABEL_8;
    }
    sub_24D123500(0);
LABEL_11:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_24D121DE8(a1, a2, (void (*)(unint64_t, uint64_t))sub_24D12B8E0, &qword_269858248);
    swift_bridgeObjectRelease();
    sub_24D124CB4(v20);
    return swift_endAccess();
  }
  long long v22 = *(_OWORD *)(*(void *)(v10 + 56) + 16 * v11);
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v22;
  swift_endAccess();
  if (!a3)
  {
    sub_24D123500(0);
    sub_24D124CB4((uint64_t)sub_24D1233C0);
    goto LABEL_11;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  id v15 = (void *)swift_allocObject();
  v15[2] = sub_24D1233C0;
  v15[3] = v13;
  v15[4] = sub_24D123394;
  v15[5] = v14;
  uint64_t v16 = sub_24D123310;
LABEL_8:
  id v17 = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v15;
  sub_24D123500(a3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v9;
  *uint64_t v9 = 0x8000000000000000;
  sub_24D1229C0((uint64_t)sub_24D12336C, v18, a1, a2, isUniquelyReferenced_nonNull_native, &qword_269858248);
  *uint64_t v9 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_24D11DC30(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t DRPDropletViewConfiguration.behaviorSettings(forKeyPath:)(uint64_t a1, uint64_t a2)
{
  long long v5 = (uint64_t *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_24D121ADC(a1, a2);
    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  swift_endAccess();
  return v9;
}

uint64_t DRPDropletViewConfiguration.setBehaviorSettingsForKeyPath(_:behaviorSettings:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  if (a3)
  {
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v7;
    *unint64_t v7 = 0x8000000000000000;
    sub_24D122850(a3, a1, a2, isUniquelyReferenced_nonNull_native);
    *unint64_t v7 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24D121D18(a1, a2);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  return swift_endAccess();
}

uint64_t (*DRPDropletViewConfiguration.animationCompletionBlock(forKeyPath:)(uint64_t a1, uint64_t a2))(char a1, char a2)
{
  long long v5 = (uint64_t *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_24D121ADC(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  long long v11 = *(_OWORD *)(*(void *)(v6 + 56) + 16 * v7);
  swift_retain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(swift_allocObject() + 16) = v11;
  uint64_t v9 = sub_24D1233E8;
LABEL_6:
  swift_endAccess();
  return v9;
}

uint64_t sub_24D11E0A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t DRPDropletViewConfiguration.addAnimationCompletionBlock(forKeyPath:animationCompletionBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if (!*(void *)(*v9 + 16)) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_24D121ADC(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_endAccess();
    if (a3)
    {
      id v15 = (void *)swift_allocObject();
      v15[2] = a3;
      v15[3] = a4;
      uint64_t v16 = sub_24D123510;
      goto LABEL_8;
    }
    sub_24D123500(0);
LABEL_11:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_24D121DE8(a1, a2, (void (*)(unint64_t, uint64_t))sub_24D12B8E0, &qword_269858240);
    swift_bridgeObjectRelease();
    sub_24D124CB4(v20);
    return swift_endAccess();
  }
  long long v22 = *(_OWORD *)(*(void *)(v10 + 56) + 16 * v11);
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v22;
  swift_endAccess();
  if (!a3)
  {
    sub_24D123500(0);
    sub_24D124CB4((uint64_t)sub_24D123540);
    goto LABEL_11;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  id v15 = (void *)swift_allocObject();
  v15[2] = sub_24D123540;
  v15[3] = v13;
  v15[4] = sub_24D123510;
  v15[5] = v14;
  uint64_t v16 = sub_24D12346C;
LABEL_8:
  id v17 = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v15;
  sub_24D123500(a3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v9;
  *uint64_t v9 = 0x8000000000000000;
  sub_24D1229C0((uint64_t)sub_24D1234D8, v18, a1, a2, isUniquelyReferenced_nonNull_native, &qword_269858240);
  *uint64_t v9 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

id DRPDropletViewConfiguration.init(centerX:centerY:boundaryEdges:containerCornerRadius:containerHeight:containerWidth:containerTransform:dropletColor:dropletRadius:disableDropletEffectFilters:boundaryOutsets:keylineStyle:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  long long v28 = *(_OWORD *)(a2 + 16);
  long long v27 = *(_OWORD *)(a2 + 32);
  long long v26 = *(_OWORD *)(a2 + 48);
  long long v25 = *(_OWORD *)(a2 + 64);
  long long v24 = *(_OWORD *)(a2 + 80);
  long long v23 = *(_OWORD *)(a2 + 96);
  uint64_t v19 = *(void *)(a2 + 112);
  uint64_t v20 = *(void *)(a2 + 120);
  v29[0] = *(_OWORD *)a2;
  v29[1] = v28;
  v29[2] = v27;
  v29[3] = v26;
  v29[4] = v25;
  v29[5] = v24;
  v29[6] = v23;
  uint64_t v30 = v19;
  uint64_t v31 = v20;
  id v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_disableDropletEffectFilters_boundaryOutsets_keylineStyle_, a1, v29, a3, a4 & 1, a5, a6, a7, a8, a9, a10, a11, *(void *)&a12, *(void *)&a13, a17, a18);

  swift_unknownObjectRelease();
  return v21;
}

id DRPDropletViewConfiguration.init(centerX:centerY:boundaryEdges:containerCornerRadius:containerHeight:containerWidth:containerTransform:dropletColor:dropletRadius:disableDropletEffectFilters:boundaryOutsets:keylineStyle:)(uint64_t a1, _OWORD *a2, void *a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18)
{
  id v19 = sub_24D123568(a1, a2, a3, a4, a5, a9, a10, a11, a12, a13, a14, a15, a16, a6, a7, a8, a17, a18);
  swift_unknownObjectRelease();

  return v19;
}

void __swiftcall DRPDropletViewConfiguration.init(viewConfiguration:)(DRPDropletViewConfiguration *__return_ptr retstr, DRPDropletViewConfiguration *viewConfiguration)
{
}

uint64_t DRPDropletViewConfiguration.init(viewConfiguration:)(char *a1)
{
  objc_msgSend(a1, sel_centerX);
  double v130 = v3;
  objc_msgSend(a1, sel_centerY);
  double v126 = v4;
  id v5 = objc_msgSend(a1, sel_boundaryEdges);
  objc_msgSend(a1, sel_containerCornerRadius);
  double v123 = v6;
  objc_msgSend(a1, sel_containerHeight);
  double v122 = v7;
  objc_msgSend(a1, sel_containerWidth);
  double v121 = v8;
  objc_msgSend(a1, sel_containerTransform);
  id v9 = objc_msgSend(a1, sel_dropletColor);
  objc_msgSend(a1, sel_dropletRadius);
  double v11 = v10;
  id v12 = objc_msgSend(a1, sel_disableDropletEffectFilters);
  objc_msgSend(a1, sel_boundaryOutsets);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  id v125 = a1;
  if (objc_msgSend(a1, sel_keylineStyle))
  {
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_copy);
    sub_24D149388();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1894E8);
    swift_dynamicCast();
    uint64_t v21 = v134;
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = objc_msgSend(v1, sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_disableDropletEffectFilters_boundaryOutsets_keylineStyle_, v5, &v135, v9, v12, v21, v130, v126, v123, v122, v121, v11, v14, v16, v18, v20);
  swift_unknownObjectRelease();

  long long v23 = &a1[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  uint64_t v24 = *(void *)v23;
  id v124 = (char *)v22;
  swift_bridgeObjectRetain();
  long long v25 = (void *)sub_24D11F460(MEMORY[0x263F8EE78], &qword_269858248);
  uint64_t v127 = v24 + 64;
  uint64_t v26 = 1 << *(unsigned char *)(v24 + 32);
  uint64_t v27 = -1;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  unint64_t v28 = v27 & *(void *)(v24 + 64);
  int64_t v29 = (unint64_t)(v26 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v30 = 0;
  while (1)
  {
    if (v28)
    {
      unint64_t v32 = __clz(__rbit64(v28));
      v28 &= v28 - 1;
      unint64_t v33 = v32 | (v30 << 6);
      goto LABEL_29;
    }
    int64_t v34 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      goto LABEL_119;
    }
    if (v34 >= v29) {
      break;
    }
    unint64_t v35 = *(void *)(v127 + 8 * v34);
    ++v30;
    if (!v35)
    {
      int64_t v30 = v34 + 1;
      if (v34 + 1 >= v29) {
        break;
      }
      unint64_t v35 = *(void *)(v127 + 8 * v30);
      if (!v35)
      {
        int64_t v30 = v34 + 2;
        if (v34 + 2 >= v29) {
          break;
        }
        unint64_t v35 = *(void *)(v127 + 8 * v30);
        if (!v35)
        {
          int64_t v30 = v34 + 3;
          if (v34 + 3 >= v29) {
            break;
          }
          unint64_t v35 = *(void *)(v127 + 8 * v30);
          if (!v35)
          {
            int64_t v30 = v34 + 4;
            if (v34 + 4 >= v29) {
              break;
            }
            unint64_t v35 = *(void *)(v127 + 8 * v30);
            if (!v35)
            {
              int64_t v36 = v34 + 5;
              if (v36 >= v29) {
                break;
              }
              unint64_t v35 = *(void *)(v127 + 8 * v36);
              if (!v35)
              {
                while (1)
                {
                  int64_t v30 = v36 + 1;
                  if (__OFADD__(v36, 1)) {
                    goto LABEL_122;
                  }
                  if (v30 >= v29) {
                    goto LABEL_40;
                  }
                  unint64_t v35 = *(void *)(v127 + 8 * v30);
                  ++v36;
                  if (v35) {
                    goto LABEL_28;
                  }
                }
              }
              int64_t v30 = v36;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v28 = (v35 - 1) & v35;
    unint64_t v33 = __clz(__rbit64(v35)) + (v30 << 6);
LABEL_29:
    uint64_t v37 = 16 * v33;
    id v38 = (uint64_t *)(*(void *)(v24 + 48) + v37);
    uint64_t v40 = *v38;
    uint64_t v39 = v38[1];
    long long v131 = *(_OWORD *)(*(void *)(v24 + 56) + v37);
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v43 = sub_24D121ADC(v40, v39);
    uint64_t v44 = v25[2];
    BOOL v45 = (v42 & 1) == 0;
    uint64_t v46 = v44 + v45;
    if (__OFADD__(v44, v45))
    {
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
      goto LABEL_123;
    }
    char v47 = v42;
    if (v25[3] >= v46)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v42) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_24D122EAC(&qword_269858248);
        if (v47) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      sub_24D1221F8(v46, isUniquelyReferenced_nonNull_native, &qword_269858248);
      unint64_t v48 = sub_24D121ADC(v40, v39);
      if ((v47 & 1) != (v49 & 1)) {
        goto LABEL_125;
      }
      unint64_t v43 = v48;
      if (v47)
      {
LABEL_7:
        uint64_t v31 = (_OWORD *)(v25[7] + 16 * v43);
        swift_release();
        *uint64_t v31 = v131;
        goto LABEL_8;
      }
    }
    v25[(v43 >> 6) + 8] |= 1 << v43;
    id v50 = (uint64_t *)(v25[6] + 16 * v43);
    *id v50 = v40;
    v50[1] = v39;
    *(_OWORD *)(v25[7] + 16 * v43) = v131;
    uint64_t v51 = v25[2];
    BOOL v52 = __OFADD__(v51, 1);
    uint64_t v53 = v51 + 1;
    if (v52) {
      goto LABEL_116;
    }
    v25[2] = v53;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_40:
  swift_release();
  swift_bridgeObjectRelease();
  id v54 = &v124[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  *(void *)id v54 = v25;
  swift_bridgeObjectRelease();
  id v55 = &v125[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  uint64_t v56 = *(void *)v55;
  swift_bridgeObjectRetain();
  uint64_t v57 = (void *)sub_24D11F460(MEMORY[0x263F8EE78], &qword_269858240);
  uint64_t v58 = v56 + 64;
  uint64_t v59 = 1 << *(unsigned char *)(v56 + 32);
  uint64_t v60 = -1;
  if (v59 < 64) {
    uint64_t v60 = ~(-1 << v59);
  }
  unint64_t v61 = v60 & *(void *)(v56 + 64);
  int64_t v128 = (unint64_t)(v59 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v62 = 0;
  while (2)
  {
    if (v61)
    {
      unint64_t v64 = __clz(__rbit64(v61));
      v61 &= v61 - 1;
      unint64_t v65 = v64 | (v62 << 6);
      goto LABEL_65;
    }
    int64_t v66 = v62 + 1;
    if (__OFADD__(v62, 1)) {
      goto LABEL_120;
    }
    if (v66 < v128)
    {
      unint64_t v67 = *(void *)(v58 + 8 * v66);
      ++v62;
      if (!v67)
      {
        int64_t v62 = v66 + 1;
        if (v66 + 1 >= v128) {
          break;
        }
        unint64_t v67 = *(void *)(v58 + 8 * v62);
        if (!v67)
        {
          int64_t v62 = v66 + 2;
          if (v66 + 2 >= v128) {
            break;
          }
          unint64_t v67 = *(void *)(v58 + 8 * v62);
          if (!v67)
          {
            int64_t v62 = v66 + 3;
            if (v66 + 3 >= v128) {
              break;
            }
            unint64_t v67 = *(void *)(v58 + 8 * v62);
            if (!v67)
            {
              int64_t v62 = v66 + 4;
              if (v66 + 4 >= v128) {
                break;
              }
              unint64_t v67 = *(void *)(v58 + 8 * v62);
              if (!v67)
              {
                int64_t v68 = v66 + 5;
                if (v68 >= v128) {
                  break;
                }
                unint64_t v67 = *(void *)(v58 + 8 * v68);
                if (!v67)
                {
                  while (1)
                  {
                    int64_t v62 = v68 + 1;
                    if (__OFADD__(v68, 1)) {
                      break;
                    }
                    if (v62 >= v128) {
                      goto LABEL_76;
                    }
                    unint64_t v67 = *(void *)(v58 + 8 * v62);
                    ++v68;
                    if (v67) {
                      goto LABEL_64;
                    }
                  }
LABEL_123:
                  __break(1u);
                  goto LABEL_124;
                }
                int64_t v62 = v68;
              }
            }
          }
        }
      }
LABEL_64:
      unint64_t v61 = (v67 - 1) & v67;
      unint64_t v65 = __clz(__rbit64(v67)) + (v62 << 6);
LABEL_65:
      uint64_t v69 = 16 * v65;
      v70 = (uint64_t *)(*(void *)(v56 + 48) + v69);
      uint64_t v72 = *v70;
      uint64_t v71 = v70[1];
      long long v132 = *(_OWORD *)(*(void *)(v56 + 56) + v69);
      swift_bridgeObjectRetain();
      swift_retain();
      char v73 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v75 = sub_24D121ADC(v72, v71);
      uint64_t v76 = v57[2];
      BOOL v77 = (v74 & 1) == 0;
      uint64_t v78 = v76 + v77;
      if (__OFADD__(v76, v77)) {
        goto LABEL_114;
      }
      char v79 = v74;
      if (v57[3] >= v78)
      {
        if (v73)
        {
          if ((v74 & 1) == 0) {
            goto LABEL_72;
          }
        }
        else
        {
          sub_24D122EAC(&qword_269858240);
          if ((v79 & 1) == 0) {
            goto LABEL_72;
          }
        }
      }
      else
      {
        sub_24D1221F8(v78, v73, &qword_269858240);
        unint64_t v80 = sub_24D121ADC(v72, v71);
        if ((v79 & 1) != (v81 & 1)) {
          goto LABEL_125;
        }
        unint64_t v75 = v80;
        if ((v79 & 1) == 0)
        {
LABEL_72:
          v57[(v75 >> 6) + 8] |= 1 << v75;
          v82 = (uint64_t *)(v57[6] + 16 * v75);
          uint64_t *v82 = v72;
          v82[1] = v71;
          *(_OWORD *)(v57[7] + 16 * v75) = v132;
          uint64_t v83 = v57[2];
          BOOL v52 = __OFADD__(v83, 1);
          uint64_t v84 = v83 + 1;
          if (v52) {
            goto LABEL_117;
          }
          v57[2] = v84;
          swift_bridgeObjectRetain();
          goto LABEL_44;
        }
      }
      v63 = (_OWORD *)(v57[7] + 16 * v75);
      swift_release();
      _OWORD *v63 = v132;
LABEL_44:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
LABEL_76:
  swift_release();
  swift_bridgeObjectRelease();
  v85 = &v124[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  *(void *)v85 = v57;
  swift_bridgeObjectRelease();
  id v86 = &v125[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
  swift_beginAccess();
  uint64_t v87 = *(void *)v86;
  swift_bridgeObjectRetain();
  v88 = (void *)sub_24D11F588(MEMORY[0x263F8EE78]);
  uint64_t v129 = v87 + 64;
  uint64_t v89 = 1 << *(unsigned char *)(v87 + 32);
  uint64_t v90 = -1;
  if (v89 < 64) {
    uint64_t v90 = ~(-1 << v89);
  }
  unint64_t v91 = v90 & *(void *)(v87 + 64);
  int64_t v133 = (unint64_t)(v89 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v92 = 0;
  while (2)
  {
    if (v91)
    {
      unint64_t v94 = __clz(__rbit64(v91));
      v91 &= v91 - 1;
      unint64_t v95 = v94 | (v92 << 6);
      goto LABEL_101;
    }
    int64_t v96 = v92 + 1;
    if (__OFADD__(v92, 1)) {
      goto LABEL_121;
    }
    if (v96 >= v133)
    {
LABEL_112:
      swift_release();
      swift_bridgeObjectRelease();
      v115 = &v124[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
      swift_beginAccess();
      *(void *)v115 = v88;
      swift_bridgeObjectRelease();
      uint64_t v116 = *(void *)&v125[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
      uint64_t v117 = *(void *)&v125[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock + 8];
      sub_24D123500(v116);

      uint64_t v118 = (uint64_t *)&v124[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
      uint64_t v119 = *(void *)&v124[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
      *uint64_t v118 = v116;
      v118[1] = v117;
      sub_24D124CB4(v119);

      return (uint64_t)v124;
    }
    unint64_t v97 = *(void *)(v129 + 8 * v96);
    ++v92;
    if (v97) {
      goto LABEL_100;
    }
    int64_t v92 = v96 + 1;
    if (v96 + 1 >= v133) {
      goto LABEL_112;
    }
    unint64_t v97 = *(void *)(v129 + 8 * v92);
    if (v97) {
      goto LABEL_100;
    }
    int64_t v92 = v96 + 2;
    if (v96 + 2 >= v133) {
      goto LABEL_112;
    }
    unint64_t v97 = *(void *)(v129 + 8 * v92);
    if (v97) {
      goto LABEL_100;
    }
    int64_t v92 = v96 + 3;
    if (v96 + 3 >= v133) {
      goto LABEL_112;
    }
    unint64_t v97 = *(void *)(v129 + 8 * v92);
    if (v97) {
      goto LABEL_100;
    }
    int64_t v92 = v96 + 4;
    if (v96 + 4 >= v133) {
      goto LABEL_112;
    }
    unint64_t v97 = *(void *)(v129 + 8 * v92);
    if (v97)
    {
LABEL_100:
      unint64_t v91 = (v97 - 1) & v97;
      unint64_t v95 = __clz(__rbit64(v97)) + (v92 << 6);
LABEL_101:
      v99 = (uint64_t *)(*(void *)(v87 + 48) + 16 * v95);
      uint64_t v101 = *v99;
      uint64_t v100 = v99[1];
      uint64_t v102 = *(void *)(*(void *)(v87 + 56) + 8 * v95);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      char v103 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v105 = sub_24D121ADC(v101, v100);
      uint64_t v106 = v88[2];
      BOOL v107 = (v104 & 1) == 0;
      uint64_t v108 = v106 + v107;
      if (__OFADD__(v106, v107)) {
        goto LABEL_115;
      }
      char v109 = v104;
      if (v88[3] < v108)
      {
        sub_24D121EE0(v108, v103);
        unint64_t v110 = sub_24D121ADC(v101, v100);
        if ((v109 & 1) != (v111 & 1)) {
          goto LABEL_125;
        }
        unint64_t v105 = v110;
        if ((v109 & 1) == 0) {
          goto LABEL_108;
        }
LABEL_79:
        uint64_t v93 = v88[7];
        swift_unknownObjectRelease();
        *(void *)(v93 + 8 * v105) = v102;
LABEL_80:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        continue;
      }
      if (v103)
      {
        if (v104) {
          goto LABEL_79;
        }
      }
      else
      {
        sub_24D122CF4();
        if (v109) {
          goto LABEL_79;
        }
      }
LABEL_108:
      v88[(v105 >> 6) + 8] |= 1 << v105;
      id v112 = (uint64_t *)(v88[6] + 16 * v105);
      *id v112 = v101;
      v112[1] = v100;
      *(void *)(v88[7] + 8 * v105) = v102;
      uint64_t v113 = v88[2];
      BOOL v52 = __OFADD__(v113, 1);
      uint64_t v114 = v113 + 1;
      if (v52) {
        goto LABEL_118;
      }
      v88[2] = v114;
      swift_bridgeObjectRetain();
      goto LABEL_80;
    }
    break;
  }
  int64_t v98 = v96 + 5;
  if (v98 >= v133) {
    goto LABEL_112;
  }
  unint64_t v97 = *(void *)(v129 + 8 * v98);
  if (v97)
  {
    int64_t v92 = v98;
    goto LABEL_100;
  }
  while (1)
  {
    int64_t v92 = v98 + 1;
    if (__OFADD__(v98, 1)) {
      break;
    }
    if (v92 >= v133) {
      goto LABEL_112;
    }
    unint64_t v97 = *(void *)(v129 + 8 * v92);
    ++v98;
    if (v97) {
      goto LABEL_100;
    }
  }
LABEL_124:
  __break(1u);
LABEL_125:
  uint64_t result = sub_24D1494E8();
  __break(1u);
  return result;
}

unint64_t sub_24D11F460(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    double v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  double v3 = (void *)sub_24D149498();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  id v5 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *((void *)v5 - 2);
    uint64_t v7 = *((void *)v5 - 1);
    long long v14 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_24D121ADC(v6, v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v10 = (uint64_t *)(v3[6] + 16 * result);
    *double v10 = v6;
    v10[1] = v7;
    *(_OWORD *)(v3[7] + 16 * result) = v14;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v3[2] = v13;
    v5 += 2;
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

unint64_t sub_24D11F588(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189528);
  uint64_t v2 = (void *)sub_24D149498();
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
    swift_unknownObjectRetain();
    unint64_t result = sub_24D121ADC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v10 = (uint64_t *)(v2[6] + 16 * result);
    *double v10 = v5;
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

uint64_t DRPDropletViewConfiguration.copy()@<X0>(void *a1@<X8>)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)DRPDropletViewConfiguration), sel_initWithViewConfiguration_, v1);
  uint64_t result = type metadata accessor for DRPDropletViewConfiguration((uint64_t)v3);
  a1[3] = result;
  *a1 = v3;
  return result;
}

uint64_t DRPDropletViewConfiguration.description.getter()
{
  sub_24D11F8DC(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698581A0);
  sub_24D123808((unint64_t *)&qword_2698583A0, (uint64_t *)&unk_2698581A0);
  uint64_t v0 = sub_24D149248();
  swift_bridgeObjectRelease();
  return v0;
}

char *sub_24D11F8DC(char a1)
{
  uint64_t v2 = v1;
  uint64_t v44 = *MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24D14B420;
  v37.receiver = v1;
  v37.super_class = (Class)DRPDropletViewConfiguration;
  id v4 = objc_msgSendSuper2(&v37, sel_description);
  uint64_t v5 = sub_24D149268();
  uint64_t v7 = v6;

  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v7;
  *(void *)&long long v41 = 0x3A587265746E6563;
  *((void *)&v41 + 1) = 0xE900000000000020;
  objc_msgSend(v2, sel_centerX);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)&v41 + 1);
  *(void *)(v3 + 48) = v41;
  *(void *)(v3 + 56) = v8;
  *(void *)&long long v41 = 0x3A597265746E6563;
  *((void *)&v41 + 1) = 0xE900000000000020;
  objc_msgSend(v2, sel_centerY);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&v41 + 1);
  *(void *)(v3 + 64) = v41;
  *(void *)(v3 + 72) = v9;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  sub_24D149298();
  *(void *)&long long v40 = objc_msgSend(v2, sel_boundaryEdges);
  type metadata accessor for UIRectEdge(0);
  sub_24D149438();
  uint64_t v10 = *((void *)&v41 + 1);
  *(void *)(v3 + 80) = v41;
  *(void *)(v3 + 88) = v10;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v41 = 0xD000000000000017;
  *((void *)&v41 + 1) = 0x800000024D14D990;
  objc_msgSend(v2, sel_containerCornerRadius);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v11 = *((void *)&v41 + 1);
  *(void *)(v3 + 96) = v41;
  *(void *)(v3 + 104) = v11;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v41 = 0xD000000000000011;
  *((void *)&v41 + 1) = 0x800000024D14D9B0;
  objc_msgSend(v2, sel_containerHeight);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v12 = *((void *)&v41 + 1);
  *(void *)(v3 + 112) = v41;
  *(void *)(v3 + 120) = v12;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v41 = 0xD000000000000010;
  *((void *)&v41 + 1) = 0x800000024D14D9D0;
  objc_msgSend(v2, sel_containerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v13 = *((void *)&v41 + 1);
  *(void *)(v3 + 128) = v41;
  *(void *)(v3 + 136) = v13;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  long long v40 = v41;
  sub_24D149298();
  objc_msgSend(v2, sel_containerTransform);
  type metadata accessor for CATransform3D(0);
  sub_24D149438();
  uint64_t v14 = *((void *)&v40 + 1);
  *(void *)(v3 + 144) = v40;
  *(void *)(v3 + 152) = v14;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  strcpy((char *)&v41, "dropletColor: ");
  HIBYTE(v41) = -18;
  id v15 = objc_msgSend(v2, sel_dropletColor);
  sub_24D14907C(v15);

  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v16 = *((void *)&v41 + 1);
  *(void *)(v3 + 160) = v41;
  *(void *)(v3 + 168) = v16;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  long long v40 = v41;
  sub_24D149298();
  objc_msgSend(v2, sel_boundaryOutsets);
  *(void *)&long long v41 = v17;
  *((void *)&v41 + 1) = v18;
  uint64_t v42 = v19;
  uint64_t v43 = v20;
  type metadata accessor for UIEdgeInsets(0);
  sub_24D149438();
  uint64_t v21 = *((void *)&v40 + 1);
  *(void *)(v3 + 176) = v40;
  *(void *)(v3 + 184) = v21;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v41 = 0x5274656C706F7264;
  *((void *)&v41 + 1) = 0xEF203A7375696461;
  objc_msgSend(v2, sel_dropletRadius);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v22 = *((void *)&v41 + 1);
  *(void *)(v3 + 192) = v41;
  *(void *)(v3 + 200) = v22;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v41 = 0xD00000000000001DLL;
  *((void *)&v41 + 1) = 0x800000024D14DA30;
  objc_msgSend(v2, sel_disableDropletEffectFilters);
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v23 = *((void *)&v41 + 1);
  *(void *)(v3 + 208) = v41;
  *(void *)(v3 + 216) = v23;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v40 = 0xD000000000000010;
  *((void *)&v40 + 1) = 0x800000024D14DA50;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698581C0);
  sub_24D149238();
  swift_bridgeObjectRelease();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v24 = *((void *)&v40 + 1);
  *(void *)(v3 + 224) = v40;
  *(void *)(v3 + 232) = v24;
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  unint64_t v38 = 0xD00000000000001ALL;
  unint64_t v39 = 0x800000024D14DA70;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698581C8);
  sub_24D149238();
  swift_bridgeObjectRelease();
  sub_24D149298();
  swift_bridgeObjectRelease();
  unint64_t v25 = v39;
  *(void *)(v3 + 240) = v38;
  *(void *)(v3 + 248) = v25;
  unint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  unint64_t v38 = 0xD00000000000001DLL;
  unint64_t v39 = 0x800000024D14DA90;
  sub_24D149298();
  swift_bridgeObjectRelease();
  unint64_t v26 = v39;
  *(void *)(v3 + 256) = v38;
  *(void *)(v3 + 264) = v26;
  unint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  v36[1] = 0x800000024D14DAB0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269858230);
  sub_24D149238();
  swift_bridgeObjectRelease();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 272) = 0xD000000000000012;
  *(void *)(v3 + 280) = v36[1];
  if (a1)
  {
    id v27 = objc_msgSend(v2, sel_keylineStyle);
    if (v27)
    {
      unint64_t v28 = v27;
      if (objc_msgSend(v27, sel_respondsToSelector_, sel_debugDescription))
      {
        id v29 = objc_msgSend(v28, sel_debugDescription);
        swift_unknownObjectRelease();
        sub_24D149268();

        sub_24D1493B8();
        swift_bridgeObjectRelease();
        strcpy((char *)v36, "keylineStyle: ");
        HIBYTE(v36[1]) = -18;
        sub_24D149298();
        goto LABEL_9;
      }
      swift_unknownObjectRelease();
    }
  }
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  strcpy((char *)v36, "keylineStyle: ");
  HIBYTE(v36[1]) = -18;
  id v30 = objc_msgSend(v2, sel_keylineStyle);
  if (v30)
  {
    id v31 = objc_msgSend(v30, sel_description);
    swift_unknownObjectRelease();
    sub_24D149268();
  }
  sub_24D149298();
LABEL_9:
  swift_bridgeObjectRelease();
  uint64_t v32 = v36[0];
  uint64_t v33 = v36[1];
  uint64_t result = sub_24D148364((char *)1, 17, 1, (char *)v3);
  *((void *)result + 2) = 17;
  *((void *)result + 36) = v32;
  *((void *)result + 37) = v33;
  return result;
}

uint64_t DRPDropletViewConfiguration.debugDescription.getter()
{
  sub_24D11F8DC(1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698581B0);
  sub_24D123808(&qword_2698581B8, &qword_2698581B0);
  uint64_t v0 = sub_24D149248();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL DRPDropletViewConfiguration.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_24D12384C(a1, (uint64_t)v65);
  if (!v66)
  {
    sub_24D1238B4((uint64_t)v65);
    return 0;
  }
  type metadata accessor for DRPDropletViewConfiguration(v3);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  char v4 = sub_24D1208E0(v1, v64);
  objc_msgSend(v1, sel_centerX);
  double v6 = v5;
  objc_msgSend(v64, sel_centerX);
  if (v6 != v7) {
    goto LABEL_28;
  }
  objc_msgSend(v1, sel_centerY);
  double v9 = v8;
  objc_msgSend(v64, sel_centerY);
  if (v9 != v10) {
    goto LABEL_28;
  }
  id v11 = objc_msgSend(v1, sel_boundaryEdges);
  if (v11 != objc_msgSend(v64, sel_boundaryEdges)) {
    goto LABEL_28;
  }
  objc_msgSend(v2, sel_containerCornerRadius);
  double v13 = v12;
  objc_msgSend(v64, sel_containerCornerRadius);
  if (v13 != v14) {
    goto LABEL_28;
  }
  objc_msgSend(v2, sel_containerHeight);
  double v16 = v15;
  objc_msgSend(v64, sel_containerHeight);
  if (v16 != v17) {
    goto LABEL_28;
  }
  objc_msgSend(v2, sel_containerWidth);
  double v19 = v18;
  objc_msgSend(v64, sel_containerWidth);
  if (v19 != v20) {
    goto LABEL_28;
  }
  id v21 = objc_msgSend(v2, sel_dropletColor);
  id v22 = objc_msgSend(v64, sel_dropletColor);
  uint64_t v23 = v22;
  if (!v21)
  {
    if (!v22) {
      goto LABEL_16;
    }

    return 0;
  }
  if (!v22)
  {

    return 0;
  }
  sub_24D114FEC(0, (unint64_t *)&qword_269858310);
  id v24 = v21;
  char v25 = sub_24D149378();

  if ((v25 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_16:
  objc_msgSend(v2, sel_dropletRadius);
  double v27 = v26;
  objc_msgSend(v64, sel_dropletRadius);
  if (v27 != v28) {
    goto LABEL_28;
  }
  unsigned int v29 = objc_msgSend(v2, sel_disableDropletEffectFilters);
  if (v29 != objc_msgSend(v64, sel_disableDropletEffectFilters)) {
    goto LABEL_28;
  }
  objc_msgSend(v2, sel_boundaryOutsets);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  objc_msgSend(v64, sel_boundaryOutsets);
  if (v31 != v41) {
    goto LABEL_28;
  }
  if (v33 != v38) {
    goto LABEL_28;
  }
  if (v35 != v39) {
    goto LABEL_28;
  }
  if (v37 != v40) {
    goto LABEL_28;
  }
  if ((v4 & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v42 = (uint64_t *)&v2[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  uint64_t v43 = *v42;
  uint64_t v44 = (uint64_t *)&v64[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  uint64_t v45 = *v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v46 = sub_24D12098C(v43, v45);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v46 & 1) == 0) {
    goto LABEL_28;
  }
  char v47 = (uint64_t *)&v2[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
  swift_beginAccess();
  uint64_t v48 = *v47;
  char v49 = (uint64_t *)&v64[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
  swift_beginAccess();
  uint64_t v50 = *v49;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v51 = sub_24D12098C(v48, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v51 & 1) == 0) {
    goto LABEL_28;
  }
  BOOL v52 = (uint64_t *)&v2[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  uint64_t v53 = *v52;
  id v54 = (uint64_t *)&v64[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  uint64_t v55 = *v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v56 = sub_24D12098C(v53, v55);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v56 & 1) == 0)
  {
LABEL_28:

    return 0;
  }
  uint64_t v57 = *(void *)&v2[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  uint64_t v58 = *(void *)&v2[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock + 8];
  if (v57)
  {
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = v57;
    *(void *)(v59 + 24) = v58;
    uint64_t v60 = sub_24D11D584;
  }
  else
  {
    uint64_t v60 = 0;
  }
  sub_24D123500(v57);
  sub_24D124CB4((uint64_t)v60);
  uint64_t v63 = *(void *)&v64[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  sub_24D123500(v63);

  if (!v63) {
    return v57 == 0;
  }
  BOOL v61 = v57 != 0;
  sub_24D124CB4(v63);
  return v61;
}

uint64_t sub_24D1208E0(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_keylineStyle);
  id v4 = objc_msgSend(a2, sel_keylineStyle);
  if (v3)
  {
    if (v4)
    {
      id v5 = objc_msgSend(v3, sel_isEqual_, v4);
      swift_unknownObjectRelease();
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    if (!v4) {
      return 1;
    }
    id v5 = 0;
  }
  swift_unknownObjectRelease();
  return (uint64_t)v5;
}

uint64_t sub_24D12098C(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = a1 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(63 - v6) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    int64_t v17 = v10;
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      if (!*(void *)(a2 + 16)) {
        goto LABEL_27;
      }
      goto LABEL_7;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v18 >= v8) {
      goto LABEL_30;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v17 + 2;
      if (v17 + 2 >= v8) {
        goto LABEL_30;
      }
      unint64_t v19 = *(void *)(v4 + 8 * v10);
      if (!v19)
      {
        int64_t v10 = v17 + 3;
        if (v17 + 3 >= v8) {
          goto LABEL_30;
        }
        unint64_t v19 = *(void *)(v4 + 8 * v10);
        if (!v19)
        {
          int64_t v10 = v17 + 4;
          if (v17 + 4 >= v8) {
            goto LABEL_30;
          }
          unint64_t v19 = *(void *)(v4 + 8 * v10);
          if (!v19)
          {
            int64_t v10 = v17 + 5;
            if (v17 + 5 >= v8) {
              goto LABEL_30;
            }
            unint64_t v19 = *(void *)(v4 + 8 * v10);
            if (!v19) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    unint64_t v7 = (v19 - 1) & v19;
    unint64_t v12 = __clz(__rbit64(v19)) + (v10 << 6);
    if (!*(void *)(a2 + 16))
    {
LABEL_27:
      uint64_t v21 = 0;
LABEL_31:
      sub_24D124DB8();
      return v21;
    }
LABEL_7:
    double v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    swift_bridgeObjectRetain();
    sub_24D121ADC(v15, v14);
    LOBYTE(v15) = v16;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_27;
    }
  }
  int64_t v20 = v17 + 6;
  if (v17 + 6 >= v8)
  {
LABEL_30:
    uint64_t v21 = 1;
    goto LABEL_31;
  }
  unint64_t v19 = *(void *)(v4 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v17 + 6;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_30;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

void __swiftcall DRPDropletViewConfiguration.init()(DRPDropletViewConfiguration *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void DRPDropletViewConfiguration.init()()
{
}

id DRPDropletViewConfiguration.change(to:preferAudioReactivity:canvasSize:)(uint64_t a1, char a2, double a3, double a4)
{
  id v7 = objc_msgSend(objc_allocWithZone((Class)DRPDropletContextIntelligentEdgeLightKeylineStyle), sel_initWithPreferringAudioReactivity_style_, a2 & 1, a1);
  objc_msgSend(v4, sel_setKeylineStyle_, v7);

  return objc_msgSend(v4, sel_defaultResetKeylineForCanvasSize_, a3, a4);
}

Swift::Void __swiftcall DRPDropletViewConfiguration.defaultResetKeyline(forCanvasSize:)(CGSize forCanvasSize)
{
  id v2 = objc_msgSend(v1, sel_keylineStyle);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v1, sel_containerWidth);
    objc_msgSend(v1, sel_containerHeight);
    BSRectWithSize();
    objc_msgSend(v1, sel_containerTransform);
    CA_CGRectApplyTransform();
    BSRectWithSize();
    objc_msgSend(v1, sel_centerX);
    objc_msgSend(v1, sel_centerY);
    UIRectCenteredAboutPoint();
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    double v11 = v10;
    BSRectWithSize();
    v36.origin.x = v5;
    v36.origin.y = v7;
    v36.size.double width = v9;
    v36.size.double height = v11;
    CGRect v35 = CGRectIntersection(v34, v36);
    double width = v35.size.width;
    double height = v35.size.height;
    unint64_t v14 = (unint64_t)objc_msgSend(v1, sel_boundaryEdges, v35.origin.x, v35.origin.y);
    if ((unk_26FF70478 & ~v14) == 0 || (qword_26FF70470 & ~v14) == 0) {
      double v16 = height;
    }
    else {
      double v16 = width;
    }
    if (v16 < 0.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = v16;
    }
    self;
    int64_t v18 = (void *)swift_dynamicCastObjCClass();
    if (v18) {
      swift_unknownObjectRetain();
    }
    id v19 = objc_msgSend(v1, sel_boundaryEdges);
    objc_msgSend(v3, sel_innerWidth);
    double v21 = v20;
    objc_msgSend(v3, sel_outerWidth);
    double v23 = v22;
    objc_msgSend(v1, sel_dropletRadius);
    double v25 = v24;
    if (v18)
    {
      objc_msgSend(v18, sel_keylineInputStart);
      double v27 = v26;
      objc_msgSend(v18, sel_keylineInputEnd);
      if (v27 > v28)
      {
        __break(1u);
        return;
      }
      double v29 = v28;
    }
    else
    {
      double v29 = 0.0;
    }
    sub_24D123A70((uint64_t)v19, v29, v18 == 0, (uint64_t)v33, v17, v9, v11, v21, v23, v25);
    long long v30 = v33[4];
    long long v31 = v33[5];
    long long v32 = v33[6];
    objc_msgSend(v3, sel_setKeylineOutsets_, v33[2], v33[3]);
    objc_msgSend(v3, sel_setKeylineFadeLengths_, v30, v31);
    objc_msgSend(v3, sel_setNormalizedStartLocation_, *(double *)&v32);
    objc_msgSend(v3, sel_setNormalizedStopLocation_, *((double *)&v32 + 1));
    swift_unknownObjectRelease();
  }
}

BOOL sub_24D121338(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (qword_26B1894B0 != -1) {
      goto LABEL_20;
    }
    while (1)
    {
      uint64_t v2 = *((void *)off_26B1894A0 + 2);
      if (!v2) {
        break;
      }
      if (*((void *)off_26B1894A0 + 4) == v1) {
        return 1;
      }
      if (v2 == 1) {
        break;
      }
      if (*((void *)off_26B1894A0 + 5) == v1) {
        return 1;
      }
      if (v2 == 2) {
        break;
      }
      for (uint64_t i = 6; ; ++i)
      {
        uint64_t v4 = i - 3;
        if (__OFADD__(i - 4, 1)) {
          break;
        }
        uint64_t v5 = *((void *)off_26B1894A0 + i);
        uint64_t result = v5 == v1;
        if (v5 == v1 || v4 == v2) {
          return result;
        }
      }
      __break(1u);
LABEL_20:
      swift_once();
    }
    return 0;
  }
  return result;
}

id sub_24D121524(BOOL a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (sub_24D121338(a1))
  {
    double v16 = a7 * 20.0 + a5;
    double v17 = v16;
    switch(a1)
    {
      case 1:
      case 4:
        goto LABEL_4;
      case 2:
      case 8:
        double v17 = a4;
        a4 = v16;
LABEL_4:
        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
        long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
        v25[0] = *MEMORY[0x263F15740];
        v25[1] = v19;
        long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
        v25[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
        v25[3] = v20;
        long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
        v25[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
        v25[5] = v21;
        long long v22 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
        v25[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
        v25[7] = v22;
        id v23 = objc_msgSend(ObjCClassFromMetadata, sel_edgeAdaptiveKeylineWithCanvasSize_edge_protrusionFromEdge_centerAlongEdge_containerSize_containerCornerRadius_transform3D_dropletRadius_, a1, v25, a2, a3, v16, a6, a4, v17, 0.0, a8);
        sub_24D1216C0(a5 == 0.0);
        return v23;
      default:
        break;
    }
  }
  else
  {
    __break(1u);
  }
  sub_24D149448();
  __break(1u);
  JUMPOUT(0x24D1216A0);
}

id sub_24D1216C0(char a1)
{
  id result = objc_msgSend(v1, sel_keylineStyle);
  if (result)
  {
    uint64_t v4 = result;
    switch((unint64_t)objc_msgSend(v1, sel_boundaryEdges))
    {
      case 1uLL:
        if (a1) {
          goto LABEL_15;
        }
        objc_msgSend(v4, sel_keylineFadeLengths);
        objc_msgSend(v4, sel_setKeylineFadeLengths_, 0.0);
        goto LABEL_14;
      case 2uLL:
        if ((a1 & 1) == 0)
        {
          objc_msgSend(v4, sel_keylineFadeLengths);
          objc_msgSend(v4, sel_setKeylineFadeLengths_);
          objc_msgSend(v4, sel_setNormalizedStartLocation_, 0.0);
          objc_msgSend(v4, sel_setNormalizedStopLocation_, 1.0);
        }
        goto LABEL_11;
      case 4uLL:
        if (a1) {
          goto LABEL_15;
        }
        objc_msgSend(v4, sel_keylineFadeLengths);
        objc_msgSend(v4, sel_setKeylineFadeLengths_, v7);
LABEL_14:
        objc_msgSend(v4, sel_setNormalizedStartLocation_, 0.0);
        objc_msgSend(v4, sel_setNormalizedStopLocation_, 1.0);
LABEL_15:
        objc_msgSend(v1, sel_boundaryOutsets);
        objc_msgSend(v4, sel_keylineFadeLengths);
        objc_msgSend(v4, sel_setKeylineFadeLengths_);
        objc_msgSend(v1, sel_boundaryOutsets);
        objc_msgSend(v4, sel_keylineFadeLengths);
        break;
      case 8uLL:
        if ((a1 & 1) == 0)
        {
          objc_msgSend(v4, sel_keylineFadeLengths);
          objc_msgSend(v4, sel_setKeylineFadeLengths_);
          objc_msgSend(v4, sel_setNormalizedStartLocation_, 0.0);
          objc_msgSend(v4, sel_setNormalizedStopLocation_, 1.0);
        }
LABEL_11:
        objc_msgSend(v1, sel_boundaryOutsets);
        double v6 = v5;
        objc_msgSend(v4, sel_keylineFadeLengths);
        objc_msgSend(v4, sel_setKeylineFadeLengths_, v6);
        objc_msgSend(v1, sel_boundaryOutsets);
        objc_msgSend(v4, sel_keylineFadeLengths);
        break;
      default:
        sub_24D149448();
        __break(1u);
        JUMPOUT(0x24D1219B8);
    }
    objc_msgSend(v4, sel_setKeylineFadeLengths_);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_24D121AC8()
{
  off_26B1894A0 = &unk_26FF70480;
}

unint64_t sub_24D121ADC(uint64_t a1, uint64_t a2)
{
  sub_24D149508();
  sub_24D149288();
  uint64_t v4 = sub_24D149528();
  return sub_24D121B98(a1, a2, v4);
}

unint64_t sub_24D121B54(uint64_t a1)
{
  uint64_t v2 = sub_24D1494F8();
  return sub_24D121C7C(a1, v2);
}

unint64_t sub_24D121B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    double v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D1494C8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        double v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24D1494C8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24D121C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_24D121D18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24D121ADC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24D122CF4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_24D12B8E4(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24D121DE8(uint64_t a1, uint64_t a2, void (*a3)(unint64_t, uint64_t), uint64_t *a4)
{
  char v7 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_24D121ADC(a1, a2);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v7;
  uint64_t v16 = *v7;
  *char v7 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24D122EAC(a4);
    uint64_t v13 = v16;
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 16 * v10);
  a3(v10, v13);
  *char v7 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_24D121EE0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189528);
  char v36 = a2;
  uint64_t v6 = sub_24D149488();
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
    long long v22 = (void *)(v5 + 64);
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
    double v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_24D149508();
    sub_24D149288();
    uint64_t result = sub_24D149528();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  long long v22 = (void *)(v5 + 64);
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

uint64_t sub_24D1221F8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v7 = a2;
  uint64_t v8 = sub_24D149488();
  uint64_t v9 = v8;
  if (*(void *)(v6 + 16))
  {
    uint64_t v10 = 1 << *(unsigned char *)(v6 + 32);
    double v37 = (void *)(v6 + 64);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v6 + 64);
    int64_t v36 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = v8 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v12)
      {
        unint64_t v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v23 = v22 | (v15 << 6);
      }
      else
      {
        int64_t v24 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v24 >= v36) {
          goto LABEL_33;
        }
        unint64_t v25 = v37[v24];
        ++v15;
        if (!v25)
        {
          int64_t v15 = v24 + 1;
          if (v24 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v25 = v37[v15];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v36)
            {
LABEL_33:
              swift_release();
              uint64_t v4 = v3;
              if (v7)
              {
                uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
                if (v35 >= 64) {
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v35;
                }
                *(void *)(v6 + 16) = 0;
              }
              break;
            }
            unint64_t v25 = v37[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v15 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_40;
                }
                if (v15 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v25 = v37[v15];
                ++v26;
                if (v25) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v15 = v26;
          }
        }
LABEL_30:
        unint64_t v12 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      uint64_t v31 = 16 * v23;
      uint64_t v32 = (uint64_t *)(*(void *)(v6 + 48) + v31);
      uint64_t v34 = *v32;
      uint64_t v33 = v32[1];
      long long v38 = *(_OWORD *)(*(void *)(v6 + 56) + v31);
      if ((v7 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_24D149508();
      sub_24D149288();
      uint64_t result = sub_24D149528();
      uint64_t v16 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v18 == v28;
          if (v18 == v28) {
            unint64_t v18 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v13 + 8 * v18);
        }
        while (v30 == -1);
        unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = 16 * v19;
      int64_t v21 = (void *)(*(void *)(v9 + 48) + v20);
      *int64_t v21 = v34;
      v21[1] = v33;
      *(_OWORD *)(*(void *)(v9 + 56) + v20) = v38;
      ++*(void *)(v9 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v4 = v9;
  return result;
}

uint64_t sub_24D122500(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1892A0);
  char v43 = a2;
  uint64_t result = sub_24D149488();
  uint64_t v6 = result;
  if (*(void *)(v4 + 16))
  {
    int64_t v7 = 0;
    double v41 = (uint64_t *)(v4 + 64);
    uint64_t v42 = v4;
    uint64_t v8 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v37 = -1 << v8;
    uint64_t v38 = v8;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 64);
    int64_t v40 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = result + 64;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v44 = v7;
        unint64_t v18 = v17 | (v7 << 6);
      }
      else
      {
        int64_t v19 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v41;
        if (v19 >= v40) {
          goto LABEL_33;
        }
        unint64_t v20 = v41[v19];
        int64_t v21 = v7 + 1;
        if (!v20)
        {
          int64_t v21 = v19 + 1;
          if (v19 + 1 >= v40) {
            goto LABEL_33;
          }
          unint64_t v20 = v41[v21];
          if (!v20)
          {
            int64_t v22 = v19 + 2;
            if (v22 >= v40)
            {
LABEL_33:
              if ((v43 & 1) == 0) {
                break;
              }
              if (v38 >= 64) {
                bzero(v41, 8 * v40);
              }
              else {
                *double v41 = v37;
              }
              int64_t v36 = v39;
              *(void *)(v4 + 16) = 0;
              uint64_t result = swift_release();
              goto LABEL_39;
            }
            unint64_t v20 = v41[v22];
            if (!v20)
            {
              while (1)
              {
                int64_t v21 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v21 >= v40) {
                  goto LABEL_33;
                }
                unint64_t v20 = v41[v21];
                ++v22;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v21 = v22;
          }
        }
LABEL_30:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v44 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v27 = *(void *)(v4 + 56);
      uint64_t v28 = *(void *)(*(void *)(v4 + 48) + 8 * v18);
      uint64_t v29 = v27 + 88 * v18;
      uint64_t v30 = *(void **)v29;
      uint64_t v31 = *(void *)(v29 + 8);
      uint64_t v32 = *(void *)(v29 + 16);
      uint64_t v33 = *(void *)(v29 + 24);
      uint64_t v34 = *(void *)(v29 + 32);
      uint64_t v35 = *(void *)(v29 + 48);
      uint64_t v48 = *(void *)(v29 + 56);
      uint64_t v49 = *(void *)(v29 + 40);
      uint64_t v46 = *(void *)(v29 + 72);
      uint64_t v47 = *(void *)(v29 + 64);
      char v45 = *(unsigned char *)(v29 + 80);
      if ((v43 & 1) == 0) {
        sub_24D123FFC(v30, v31, v32, v33, v34, v49, v35, v48, v47, v46, v45);
      }
      uint64_t result = sub_24D1494F8();
      uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v13 = result & ~v12;
      unint64_t v14 = v13 >> 6;
      if (((-1 << v13) & ~*(void *)(v11 + 8 * (v13 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v13) & ~*(void *)(v11 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v12) >> 6;
        do
        {
          if (++v14 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v14 == v24;
          if (v14 == v24) {
            unint64_t v14 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v11 + 8 * v14);
        }
        while (v26 == -1);
        unint64_t v15 = __clz(__rbit64(~v26)) + (v14 << 6);
      }
      *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v28;
      uint64_t v16 = *(void *)(v6 + 56) + 88 * v15;
      *(void *)uint64_t v16 = v30;
      *(void *)(v16 + 8) = v31;
      *(void *)(v16 + 16) = v32;
      *(void *)(v16 + 24) = v33;
      *(void *)(v16 + 32) = v34;
      *(void *)(v16 + 40) = v49;
      *(void *)(v16 + 48) = v35;
      *(void *)(v16 + 56) = v48;
      *(void *)(v16 + 64) = v47;
      *(void *)(v16 + 72) = v46;
      *(unsigned char *)(v16 + 80) = v45;
      ++*(void *)(v6 + 16);
      uint64_t v4 = v42;
      int64_t v7 = v44;
    }
  }
  uint64_t result = swift_release();
  int64_t v36 = v39;
LABEL_39:
  uint64_t *v36 = v6;
  return result;
}

uint64_t sub_24D122850(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24D121ADC(a2, a3);
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
    sub_24D122CF4();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24D121EE0(v15, a4 & 1);
  unint64_t v21 = sub_24D121ADC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24D1494E8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  *char v23 = a2;
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

uint64_t sub_24D1229C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t *a6)
{
  uint64_t v8 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_24D121ADC(a3, a4);
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
  if (v21 >= v19 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a5 & 1) == 0)
  {
    sub_24D122EAC(a6);
LABEL_7:
    char v22 = (void *)*v8;
    if (v20)
    {
LABEL_8:
      char v23 = (void *)(v22[7] + 16 * v16);
      uint64_t result = swift_release();
      *char v23 = a1;
      v23[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_24D1221F8(v19, a5 & 1, a6);
  unint64_t v25 = sub_24D121ADC(a3, a4);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_24D1494E8();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  char v22 = (void *)*v8;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 16 * v16);
  *uint64_t v27 = a3;
  v27[1] = a4;
  uint64_t v28 = (void *)(v22[7] + 16 * v16);
  void *v28 = a1;
  v28[1] = a2;
  uint64_t v29 = v22[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v31;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D122B54(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24D121B54(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_24D123068();
      goto LABEL_7;
    }
    sub_24D122500(v13, a3 & 1);
    unint64_t v19 = sub_24D121B54(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24D1494E8();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 88 * v10;
    return sub_24D124010(a1, v17);
  }
LABEL_13:
  return sub_24D122C88(v10, a2, a1, v16);
}

uint64_t sub_24D122C88(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_24D12406C(a3, a4[7] + 88 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void *sub_24D122CF4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189528);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D149478();
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
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
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

void *sub_24D122EAC(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24D149478();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
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
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 48) + v17);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    long long v21 = *(_OWORD *)(*(void *)(v3 + 56) + v17);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = v20;
    v22[1] = v19;
    *(_OWORD *)(*(void *)(v5 + 56) + v17) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24D123068()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1892A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D149478();
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
    int64_t v31 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v31 >= v13) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v6 + 8 * v31);
    ++v9;
    if (!v32)
    {
      int64_t v9 = v31 + 1;
      if (v31 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v32 = *(void *)(v6 + 8 * v9);
      if (!v32) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v32 - 1) & v32;
    unint64_t v15 = __clz(__rbit64(v32)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 88 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    uint64_t v20 = *(void **)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    uint64_t v22 = *(void *)(v19 + 16);
    uint64_t v23 = *(void *)(v19 + 24);
    uint64_t v24 = *(void *)(v19 + 32);
    uint64_t v25 = *(void *)(v19 + 40);
    uint64_t v26 = *(void *)(v19 + 48);
    uint64_t v27 = *(void *)(v19 + 56);
    uint64_t v28 = *(void *)(v19 + 64);
    uint64_t v29 = *(void *)(v19 + 72);
    LOBYTE(v19) = *(unsigned char *)(v19 + 80);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v30 = *(void *)(v4 + 56) + v18;
    *(void *)uint64_t v30 = v20;
    *(void *)(v30 + 8) = v21;
    *(void *)(v30 + 16) = v22;
    *(void *)(v30 + 24) = v23;
    *(void *)(v30 + 32) = v24;
    *(void *)(v30 + 40) = v25;
    *(void *)(v30 + 48) = v26;
    *(void *)(v30 + 56) = v27;
    *(void *)(v30 + 64) = v28;
    *(void *)(v30 + 72) = v29;
    *(unsigned char *)(v30 + 80) = v19;
    uint64_t result = sub_24D123FFC(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v19);
  }
  int64_t v33 = v31 + 2;
  if (v33 >= v13) {
    goto LABEL_26;
  }
  unint64_t v32 = *(void *)(v6 + 8 * v33);
  if (v32)
  {
    int64_t v9 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v6 + 8 * v9);
    ++v33;
    if (v32) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24D123258(void *a1, char *a2, char *a3)
{
  uint64_t v4 = *(void (**)(void *, char *, char *))(v3 + 16);
  uint64_t v5 = *(uint64_t (**)(void *, char *, char *))(v3 + 32);
  uint64_t v6 = a1[1];
  char v7 = *a2;
  char v8 = *a3;
  v12[0] = *a1;
  v12[1] = v6;
  char v11 = v7;
  char v10 = v8;
  v4(v12, &v11, &v10);
  return v5(v12, &v11, &v10);
}

uint64_t sub_24D1232D4(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_24D123310(uint64_t *a1)
{
  uint64_t v2 = *(void (**)(uint64_t *))(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  uint64_t v5 = *a1;
  v2(&v5);
  return v3(&v5);
}

uint64_t sub_24D12336C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24D123394(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_24D1233C0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24D1233E8(char a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(char *, char *))(v2 + 16);
  char v6 = a1;
  char v5 = a2;
  return v3(&v6, &v5);
}

uint64_t objectdestroy_13Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D12346C(char *a1, char *a2)
{
  uint64_t v3 = *(void (**)(char *, char *))(v2 + 16);
  uint64_t v4 = *(uint64_t (**)(char *, char *))(v2 + 32);
  char v5 = *a2;
  char v8 = *a1;
  char v7 = v5;
  v3(&v8, &v7);
  return v4(&v8, &v7);
}

uint64_t sub_24D1234D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24D123500(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24D123510(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_24D123540()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_24D123568(uint64_t a1, _OWORD *a2, void *a3, char a4, uint64_t a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v29 = (void **)&v18[OBJC_IVAR___DRPDropletViewConfiguration_dropletColor];
  *(void *)&v18[OBJC_IVAR___DRPDropletViewConfiguration_dropletColor] = 0;
  uint64_t v30 = &v18[OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle];
  *(void *)&v18[OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle] = 0;
  int64_t v31 = &v18[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  *(void *)int64_t v31 = 0;
  *((void *)v31 + 1) = 0;
  uint64_t v32 = OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap;
  int64_t v33 = v18;
  uint64_t v34 = MEMORY[0x263F8EE78];
  *(void *)&v18[v32] = sub_24D11F460(MEMORY[0x263F8EE78], &qword_269858248);
  uint64_t v35 = OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap;
  *(void *)&v33[v35] = sub_24D11F460(v34, &qword_269858240);
  uint64_t v36 = OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap;
  *(void *)&v33[v36] = sub_24D11F588(v34);
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_centerX] = a6;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_centerY] = a7;
  *(void *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges] = a1;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius] = a8;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_containerHeight] = a9;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_containerWidth] = a10;
  uint64_t v37 = &v33[OBJC_IVAR___DRPDropletViewConfiguration_containerTransform];
  long long v38 = a2[5];
  *((_OWORD *)v37 + 4) = a2[4];
  *((_OWORD *)v37 + 5) = v38;
  long long v39 = a2[7];
  *((_OWORD *)v37 + 6) = a2[6];
  *((_OWORD *)v37 + 7) = v39;
  long long v40 = a2[1];
  *(_OWORD *)uint64_t v37 = *a2;
  *((_OWORD *)v37 + 1) = v40;
  long long v41 = a2[3];
  *((_OWORD *)v37 + 2) = a2[2];
  *((_OWORD *)v37 + 3) = v41;
  swift_beginAccess();
  uint64_t v42 = *v29;
  *uint64_t v29 = a3;
  id v43 = a3;

  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius] = a11;
  v33[OBJC_IVAR___DRPDropletViewConfiguration_disableDropletEffectFilters] = a4;
  int64_t v44 = (double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets];
  *int64_t v44 = a12;
  v44[1] = a13;
  *((void *)v44 + 2) = a17;
  *((void *)v44 + 3) = a18;
  swift_beginAccess();
  *(void *)uint64_t v30 = a5;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  v49.receiver = v33;
  v49.super_class = (Class)DRPDropletViewConfiguration;
  return objc_msgSendSuper2(&v49, sel_init);
}

uint64_t type metadata accessor for DRPDropletViewConfiguration(uint64_t a1)
{
  return sub_24D114FEC(a1, (unint64_t *)&unk_26B1894D8);
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

uint64_t sub_24D123808(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24D12384C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B189550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1238B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B189550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24D123914(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1892A0);
    uint64_t v3 = (void *)sub_24D149498();
    uint64_t v4 = a1 + 64;
    while (1)
    {
      uint64_t v19 = v1;
      uint64_t v5 = *(void *)(v4 - 32);
      char v6 = *(void **)(v4 - 24);
      uint64_t v7 = *(void *)(v4 - 16);
      uint64_t v8 = *(void *)(v4 - 8);
      uint64_t v10 = *(void *)v4;
      uint64_t v9 = *(void *)(v4 + 8);
      uint64_t v22 = *(void *)(v4 + 24);
      uint64_t v23 = *(void *)(v4 + 16);
      uint64_t v11 = *(void *)(v4 + 48);
      uint64_t v20 = *(void *)(v4 + 40);
      uint64_t v21 = *(void *)(v4 + 32);
      char v12 = *(unsigned char *)(v4 + 56);
      unint64_t result = sub_24D121B54(v5);
      if (v14) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      uint64_t v15 = v3[7] + 88 * result;
      *(void *)uint64_t v15 = v6;
      *(void *)(v15 + 8) = v7;
      *(void *)(v15 + 16) = v8;
      *(void *)(v15 + 24) = v10;
      *(void *)(v15 + 32) = v9;
      *(void *)(v15 + 40) = v23;
      *(void *)(v15 + 48) = v22;
      *(void *)(v15 + 56) = v21;
      *(void *)(v15 + 64) = v20;
      *(void *)(v15 + 72) = v11;
      *(unsigned char *)(v15 + 80) = v12;
      uint64_t v16 = v3[2];
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17) {
        goto LABEL_10;
      }
      v4 += 96;
      v3[2] = v18;
      sub_24D123FFC(v6, v7, v8, v10, v9, v23, v22, v21, v20, v11, v12);
      uint64_t v1 = v19 - 1;
      if (v19 == 1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

double sub_24D123A70@<D0>(uint64_t a1@<X0>, double a2@<X2>, char a3@<W3>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>)
{
  double v10 = a10 * 2.8 * 1.5;
  double v11 = 0.0;
  if (a5 < 0.0) {
    double v12 = 0.0;
  }
  else {
    double v12 = a5;
  }
  double v13 = a8 + a9 + 1.0 + a8 + a9 + 1.0;
  if ((a3 & 1) == 0) {
    double v13 = 2.0;
  }
  if (v12 != 0.0)
  {
    if (a3) {
      a2 = 0.0;
    }
    double v11 = a9 + 1.0 + v10 * a2;
  }
  switch(a1)
  {
    case 1:
      double v15 = v11;
      double v11 = a8 - a7 + a5;
      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      goto LABEL_16;
    case 2:
      double v20 = a8 - a6 + a5;
      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = v13;
      double v13 = 0.0;
      double v19 = v11;
      double v15 = v10;
      goto LABEL_14;
    case 4:
      double v15 = a8 - a7 + a5;
      double v16 = 0.0;
      double v17 = v13;
      double v18 = 0.0;
      double v13 = 0.0;
LABEL_16:
      double v19 = v10;
      double v20 = v10;
      break;
    case 8:
      double v19 = a8 - a6 + a5;
      double v17 = 0.0;
      double v16 = v13;
      double v18 = 0.0;
      double v13 = 0.0;
      double v15 = v10;
      double v20 = v11;
LABEL_14:
      double v11 = v10;
      break;
    default:
      sub_24D149448();
      __break(1u);
      JUMPOUT(0x24D123C14);
  }
  *(double *)a4 = v10;
  *(double *)(a4 + 8) = v10;
  *(double *)(a4 + 16) = v10;
  *(double *)(a4 + 24) = v10;
  *(double *)(a4 + 32) = v11;
  *(double *)(a4 + 40) = v20;
  *(double *)(a4 + 48) = v15;
  *(double *)(a4 + 56) = v19;
  *(double *)(a4 + 64) = v13;
  *(double *)(a4 + 72) = v18;
  *(double *)(a4 + 80) = v17;
  *(double *)(a4 + 88) = v16;
  double result = 0.0;
  *(_OWORD *)(a4 + 96) = xmmword_24D14B430;
  return result;
}

char *keypath_get_selector_centerX()
{
  return sel_centerX;
}

id sub_24D123C40@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_centerX);
  *a2 = v4;
  return result;
}

id sub_24D123C74(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterX_, *a1);
}

char *keypath_get_selector_centerY()
{
  return sel_centerY;
}

id sub_24D123C94@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_centerY);
  *a2 = v4;
  return result;
}

id sub_24D123CC8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterY_, *a1);
}

char *keypath_get_selector_boundaryEdges()
{
  return sel_boundaryEdges;
}

id sub_24D123CE8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_24D123D1C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

char *keypath_get_selector_containerCornerRadius()
{
  return sel_containerCornerRadius;
}

id sub_24D123D3C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_containerCornerRadius);
  *a2 = v4;
  return result;
}

id sub_24D123D70(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerCornerRadius_, *a1);
}

char *keypath_get_selector_containerHeight()
{
  return sel_containerHeight;
}

id sub_24D123D90@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_containerHeight);
  *a2 = v4;
  return result;
}

id sub_24D123DC4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerHeight_, *a1);
}

char *keypath_get_selector_containerWidth()
{
  return sel_containerWidth;
}

id sub_24D123DE4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_containerWidth);
  *a2 = v4;
  return result;
}

id sub_24D123E18(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerWidth_, *a1);
}

char *keypath_get_selector_containerTransform()
{
  return sel_containerTransform;
}

char *keypath_get_selector_dropletColor()
{
  return sel_dropletColor;
}

id sub_24D123E4C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dropletColor);
  *a2 = result;
  return result;
}

id sub_24D123E88(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletColor_, *a1);
}

char *keypath_get_selector_dropletRadius()
{
  return sel_dropletRadius;
}

id sub_24D123EA8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dropletRadius);
  *a2 = v4;
  return result;
}

id sub_24D123EDC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletRadius_, *a1);
}

char *keypath_get_selector_disableDropletEffectFilters()
{
  return sel_disableDropletEffectFilters;
}

id sub_24D123EFC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_disableDropletEffectFilters);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D123F30(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDisableDropletEffectFilters_, *a1);
}

char *keypath_get_selector_boundaryOutsets()
{
  return sel_boundaryOutsets;
}

id sub_24D123F50@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryOutsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_24D123F88(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryOutsets_, *a1, a1[1], a1[2], a1[3]);
}

char *keypath_get_selector_keylineStyle()
{
  return sel_keylineStyle;
}

id sub_24D123FAC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineStyle);
  *a2 = result;
  return result;
}

id sub_24D123FE8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineStyle_, *a1);
}

id sub_24D123FFC(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11 == 1) {
    return result;
  }
  return result;
}

uint64_t sub_24D124010(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24D12406C(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_24D1240C8(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (sub_24D121338(a1))
  {
    id v14 = objc_msgSend(self, sel_rootSettings);
    double v15 = 0.0;
    if (a6 != 0.0) {
      double v15 = 2.0;
    }
    double v16 = v14;
    double v17 = a4 * 0.5;
    double v18 = a6 * 0.2 + v15;
    switch(a1)
    {
      case 1:
        double v19 = v18 - v17;
        goto LABEL_10;
      case 2:
        double v67 = a5;
        double v20 = v18 - v17;
        goto LABEL_8;
      case 4:
        double v19 = v17 + a3 - v18;
LABEL_10:
        double v66 = a5;
        double v67 = v19;
        goto LABEL_11;
      case 8:
        double v67 = a5;
        double v20 = v17 + a2 - v18;
LABEL_8:
        double v66 = v20;
LABEL_11:
        objc_msgSend(v14, sel_edgeHintKeylineInnerWidth);
        double v22 = v21;
        objc_msgSend(v16, sel_edgeHintKeylineOuterWidth);
        double v24 = v23;
        sub_24D123A70(a1, 0.0, 1, (uint64_t)v68, v18, a4, a4, v22, v23, a7);
        double v64 = a7;
        uint64_t v65 = *(void *)v68;
        long long v63 = *(_OWORD *)&v68[8];
        uint64_t v62 = *(void *)&v68[24];
        double v25 = *((double *)&v69 + 1);
        double v60 = *(double *)&v69;
        long long v26 = v70;
        uint64_t v27 = *(void *)v72;
        long long v56 = *(_OWORD *)&v72[8];
        long long v58 = v71;
        uint64_t v28 = *(void *)&v72[24];
        id v29 = objc_msgSend(v16, sel_edgeHintKeylineAdaptiveColorMatrix);
        objc_msgSend(v29, sel_caColorMatrix);
        long long v52 = *(_OWORD *)&v68[16];
        long long v54 = *(_OWORD *)v68;
        long long v48 = v70;
        long long v50 = v69;
        long long v47 = v71;

        id v30 = objc_allocWithZone((Class)DRPDropletContextAdaptiveKeylineStyle);
        *(_OWORD *)int64_t v68 = v54;
        *(_OWORD *)&v68[16] = v52;
        long long v69 = v50;
        long long v70 = v48;
        long long v71 = v47;
        id v31 = objc_msgSend(v30, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v68, v22, v24, v60, v25, v26, v58, v27, v56, v28);
        long long v49 = *MEMORY[0x263F15740];
        long long v51 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
        long long v53 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
        long long v55 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
        long long v59 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
        long long v61 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
        long long v57 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
        uint64_t v32 = *(void *)(MEMORY[0x263F15740] + 112);
        uint64_t v33 = *(void *)(MEMORY[0x263F15740] + 120);
        id v34 = objc_allocWithZone((Class)DRPDropletViewConfiguration);
        *(_OWORD *)int64_t v68 = v49;
        *(_OWORD *)&v68[16] = v51;
        long long v69 = v53;
        long long v70 = v55;
        long long v71 = v61;
        *(_OWORD *)uint64_t v72 = v59;
        *(_OWORD *)&v72[16] = v57;
        uint64_t v73 = v32;
        uint64_t v74 = v33;
        id v35 = objc_msgSend(v34, sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_disableDropletEffectFilters_boundaryOutsets_keylineStyle_, a1, v68, 0, 0, v31, v66, v67, 0.0, a4, a4, v64, v65, v63, v62);
        uint64_t v36 = (void *)sub_24D149258();
        id v37 = objc_msgSend(v16, sel_edgeHintCenterXAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v36, v37);

        long long v38 = (void *)sub_24D149258();
        id v39 = objc_msgSend(v16, sel_edgeHintCenterYAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v38, v39);

        long long v40 = (void *)sub_24D149258();
        id v41 = objc_msgSend(v16, sel_edgeHintContainerWidthAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v40, v41);

        uint64_t v42 = (void *)sub_24D149258();
        id v43 = objc_msgSend(v16, sel_edgeHintContainerHeightAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v42, v43);

        int64_t v44 = (void *)sub_24D149258();
        id v45 = objc_msgSend(v16, sel_edgeHintKeylineStyleAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v44, v45);

        return v35;
      default:
        break;
    }
  }
  else
  {
    __break(1u);
  }
  sub_24D149448();
  __break(1u);
  JUMPOUT(0x24D12462CLL);
}

id sub_24D12464C(uint64_t a1, uint64_t *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  uint64_t v67 = *a2;
  uint64_t v82 = a2[1];
  uint64_t v81 = a2[2];
  uint64_t v80 = a2[3];
  uint64_t v79 = a2[4];
  uint64_t v78 = a2[5];
  uint64_t v77 = a2[6];
  uint64_t v76 = a2[7];
  uint64_t v75 = a2[8];
  uint64_t v74 = a2[9];
  uint64_t v73 = a2[10];
  uint64_t v72 = a2[11];
  uint64_t v71 = a2[12];
  uint64_t v70 = a2[13];
  uint64_t v69 = a2[14];
  uint64_t v68 = a2[15];
  if (sub_24D121338(a1))
  {
    double v66 = a9;
    switch(a1)
    {
      case 1:
        double v19 = a5 + a8 * -0.5;
        goto LABEL_8;
      case 2:
        double v65 = a6;
        double v20 = a5 + a7 * -0.5;
        goto LABEL_6;
      case 4:
        double v19 = a8 * 0.5 + a4 - a5;
LABEL_8:
        double v64 = a6;
        double v65 = v19;
        goto LABEL_9;
      case 8:
        double v65 = a6;
        double v20 = a7 * 0.5 + a3 - a5;
LABEL_6:
        double v64 = v20;
LABEL_9:
        id v21 = objc_msgSend(self, sel_rootSettings);
        objc_msgSend(v21, sel_edgeContentPresentedKeylineInnerWidth);
        double v23 = v22;
        double v57 = v22;
        objc_msgSend(v21, sel_edgeContentPresentedKeylineOuterWidth);
        double v25 = v24;
        BSRectWithSize();
        *(void *)uint64_t v83 = v67;
        *(void *)&v83[8] = v82;
        *(void *)&v83[16] = v81;
        *(void *)&v83[24] = v80;
        *(void *)&long long v84 = v79;
        *((void *)&v84 + 1) = v78;
        *(void *)&long long v85 = v77;
        *((void *)&v85 + 1) = v76;
        *(void *)&long long v86 = v75;
        *((void *)&v86 + 1) = v74;
        uint64_t v87 = v73;
        *(void *)&long long v88 = v72;
        *((void *)&v88 + 1) = v71;
        uint64_t v89 = v70;
        uint64_t v90 = v69;
        uint64_t v91 = v68;
        CA_CGRectApplyTransform();
        sub_24D123A70(a1, 0.0, 1, (uint64_t)v83, a5, v26, v27, v23, v25, a10);
        double v62 = a7;
        uint64_t v63 = *(void *)v83;
        long long v59 = *(_OWORD *)&v83[8];
        double v28 = *(double *)&v84;
        uint64_t v58 = *(void *)&v83[24];
        double v30 = *((double *)&v84 + 1);
        double v29 = *(double *)&v85;
        double v60 = a10;
        double v61 = a8;
        double v31 = *((double *)&v85 + 1);
        uint64_t v32 = v87;
        long long v55 = v88;
        long long v56 = v86;
        uint64_t v33 = v89;
        id v34 = objc_msgSend(v21, sel_edgeContentPresentedKeylineAdaptiveColorMatrix);
        objc_msgSend(v34, sel_caColorMatrix);
        long long v53 = *(_OWORD *)&v83[16];
        long long v54 = *(_OWORD *)v83;
        long long v51 = v85;
        long long v52 = v84;
        long long v50 = v86;

        id v35 = objc_allocWithZone((Class)DRPDropletContextAdaptiveKeylineStyle);
        *(_OWORD *)uint64_t v83 = v54;
        *(_OWORD *)&v83[16] = v53;
        long long v84 = v52;
        long long v85 = v51;
        long long v86 = v50;
        id v36 = objc_msgSend(v35, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v83, v57, v25, v28, v30, v29, v31, v56, v32, v55, v33);
        id v37 = objc_allocWithZone((Class)DRPDropletViewConfiguration);
        *(void *)uint64_t v83 = v67;
        *(void *)&v83[8] = v82;
        *(void *)&v83[16] = v81;
        *(void *)&v83[24] = v80;
        *(void *)&long long v84 = v79;
        *((void *)&v84 + 1) = v78;
        *(void *)&long long v85 = v77;
        *((void *)&v85 + 1) = v76;
        *(void *)&long long v86 = v75;
        *((void *)&v86 + 1) = v74;
        uint64_t v87 = v73;
        *(void *)&long long v88 = v72;
        *((void *)&v88 + 1) = v71;
        uint64_t v89 = v70;
        uint64_t v90 = v69;
        uint64_t v91 = v68;
        id v38 = objc_msgSend(v37, sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_disableDropletEffectFilters_boundaryOutsets_keylineStyle_, a1, v83, 0, 0, v36, v64, v65, v66, v61, v62, v60, v63, v59, v58);
        id v39 = (void *)sub_24D149258();
        id v40 = objc_msgSend(v21, sel_edgeContentPresentedCenterXAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v39, v40);

        id v41 = (void *)sub_24D149258();
        id v42 = objc_msgSend(v21, sel_edgeContentPresentedCenterYAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v41, v42);

        id v43 = (void *)sub_24D149258();
        id v44 = objc_msgSend(v21, sel_edgeContentPresentedContainerWidthAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v43, v44);

        id v45 = (void *)sub_24D149258();
        id v46 = objc_msgSend(v21, sel_edgeContentPresentedContainerHeightAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v45, v46);

        long long v47 = (void *)sub_24D149258();
        id v48 = objc_msgSend(v21, sel_edgeContentPresentedKeylineStyleAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v47, v48);

        return v38;
      default:
        break;
    }
  }
  else
  {
    __break(1u);
  }
  sub_24D149448();
  __break(1u);
  JUMPOUT(0x24D124C94);
}

uint64_t sub_24D124CB4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24D124CC4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D124CFC(char a1, char a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(v2 + 16) + 16))(*(void *)(v2 + 16), a1 & 1, a2 & 1);
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

uint64_t sub_24D124D34()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_24D124D48(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v7 = *(void *)(v4 + 16);
  id v8 = (id)sub_24D149258();
  (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, a3 & 1, a4 & 1);
}

uint64_t sub_24D124DB8()
{
  return swift_release();
}

char *sub_24D124E08(id a1, uint64_t a2)
{
  if (a1)
  {
    objc_msgSend(a1, sel_bounds);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = 0.0;
    double v11 = 0.0;
    double v5 = 0.0;
    double v7 = 0.0;
  }
  double v12 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, v5, v7, v9, v11);
  double v13 = (void *)sub_24D149258();
  objc_msgSend(v12, sel_setAccessibilityIdentifier_, v13);

  id v14 = (void **)&v12[OBJC_IVAR___DRPDropletContainerView_contentView];
  swift_beginAccess();
  double v15 = *v14;
  *id v14 = a1;
  id v16 = a1;

  double v17 = &v12[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  *(void *)double v17 = a2;
  swift_bridgeObjectRelease();
  id v18 = v12;
  if (a1)
  {
    id v18 = v16;
    double v19 = (char *)objc_msgSend(v18, sel_superview);
    if (!v19 || (double v20 = v19, v19, v20 != v12)) {
      objc_msgSend(v12, sel_addSubview_, v18);
    }
  }
  return v12;
}

void __swiftcall DRPDropletContainerView.init(coder:)(DRPDropletContainerView_optional *__return_ptr retstr, NSCoder coder)
{
}

void DRPDropletContainerView.init(coder:)()
{
  *(void *)&v0[OBJC_IVAR___DRPDropletContainerView_contentView] = 0;
  *(void *)&v0[OBJC_IVAR___DRPDropletContainerView_boundaryEdges] = 0;
  uint64_t v1 = &v0[OBJC_IVAR___DRPDropletContainerView_boundaryOutsets];
  long long v2 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)uint64_t v1 = *MEMORY[0x263F834E8];
  *((_OWORD *)v1 + 1) = v2;
  *(void *)&v0[OBJC_IVAR___DRPDropletContainerView_participantViews] = MEMORY[0x263F8EE78];

  sub_24D149448();
  __break(1u);
}

void *DRPDropletContainerView.contentView.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  long long v2 = *v1;
  id v3 = v2;
  return v2;
}

void DRPDropletContainerView.contentView.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  double v4 = *v3;
  *id v3 = a1;
  id v5 = a1;
  sub_24D125370(v4);
}

void sub_24D125370(id a1)
{
  id v3 = (id *)&v1[OBJC_IVAR___DRPDropletContainerView_contentView];
  swift_beginAccess();
  if (*v3)
  {
    if (a1 && *v3 == a1) {
      return;
    }
  }
  else if (!a1)
  {
    return;
  }
  objc_msgSend(a1, sel_removeFromSuperview);
  if (*v3)
  {
    id v4 = *v3;
    id v5 = (char *)objc_msgSend(v4, sel_superview);
    if (!v5 || (double v6 = v5, v5, v6 != v1)) {
      objc_msgSend(v1, sel_addSubview_, v4);
    }
  }
}

id DRPDropletContainerView.continuousCornerRadius.getter()
{
  return objc_msgSend(v0, sel__continuousCornerRadius);
}

id DRPDropletContainerView.continuousCornerRadius.setter()
{
  return objc_msgSend(v0, sel__setContinuousCornerRadius_);
}

id DRPDropletContainerView._continuousCornerRadius.getter()
{
  v1.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v1, sel__continuousCornerRadius);
}

uint64_t DRPDropletContainerView._continuousCornerRadius.setter()
{
  v8.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v8, sel__setContinuousCornerRadius_);
  objc_super v1 = &v0[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v2 = *(void *)v1;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24D149468();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x25331E4B0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      double v7 = v6;
      ++v5;
      objc_msgSend(v0, sel__continuousCornerRadius);
      objc_msgSend(v7, sel__setContinuousCornerRadius_);
    }
    while (v3 != v5);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t DRPDropletContainerView.boundaryEdges.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContainerView_boundaryEdges;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t DRPDropletContainerView.boundaryEdges.setter(uint64_t a1)
{
  unint64_t v2 = v1;
  id v4 = &v2[OBJC_IVAR___DRPDropletContainerView_boundaryEdges];
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *(void *)v4;
  *(void *)id v4 = a1;
  if (v6 != a1)
  {
    double v7 = &v2[OBJC_IVAR___DRPDropletContainerView_participantViews];
    swift_beginAccess();
    uint64_t v8 = *(void *)v7;
    if (*(void *)v7 >> 62) {
      goto LABEL_21;
    }
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v9; uint64_t v9 = sub_24D149468())
    {
      uint64_t v10 = 0;
      unint64_t v11 = v8 & 0xC000000000000001;
      uint64_t v27 = v8 + 32;
      double v12 = (SEL *)&unk_2652FF000;
      double v13 = (void *)MEMORY[0x263F8EED0];
      uint64_t v26 = v8;
      unint64_t v28 = v8 & 0xC000000000000001;
      uint64_t v29 = v9;
      while (1)
      {
        id v14 = v11 ? (char *)MEMORY[0x25331E4B0](v10, v8) : (char *)*(id *)(v27 + 8 * v10);
        double v15 = v14;
        if (__OFADD__(v10++, 1)) {
          break;
        }
        id v17 = [v2 v12[368]];
        uint64_t v18 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges;
        id v19 = *(id *)&v15[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
        *(void *)&v15[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = v17;
        if (v17 == v19)
        {
        }
        else
        {
          double v20 = &v15[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          uint64_t v21 = *(void *)(*(void *)v20 + 16);
          if (v21)
          {
            double v22 = v2;
            uint64_t v23 = *(void *)v20 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_24D12742C(v23, (uint64_t)v30, &qword_26B189230);
              double v24 = (void *)MEMORY[0x25331EC50](v30);
              if (v24)
              {
                double v25 = v24;
                (*(void (**)(char *, void))((*v13 & *v24) + 0xC8))(v15, *(void *)&v15[v18]);
              }
              sub_24D1276AC((uint64_t)v30, &qword_26B189230);
              v23 += 8;
              --v21;
            }
            while (v21);

            swift_bridgeObjectRelease_n();
            unint64_t v2 = v22;
            uint64_t v8 = v26;
          }
          else
          {
          }
          unint64_t v11 = v28;
          uint64_t v9 = v29;
          double v12 = (SEL *)&unk_2652FF000;
        }
        if (v10 == v9) {
          return swift_bridgeObjectRelease_n();
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain_n();
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

double DRPDropletContainerView.boundaryOutsets.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContainerView.boundaryOutsets.setter(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = (double *)&v4[OBJC_IVAR___DRPDropletContainerView_boundaryOutsets];
  uint64_t result = swift_beginAccess();
  double v12 = *v10;
  double v13 = v10[1];
  double v14 = v10[2];
  double v15 = v10[3];
  *uint64_t v10 = a1;
  v10[1] = a2;
  v10[2] = a3;
  v10[3] = a4;
  if (v12 != a1 || v13 != a2 || v14 != a3 || v15 != a4)
  {
    id v19 = &v5[OBJC_IVAR___DRPDropletContainerView_participantViews];
    swift_beginAccess();
    uint64_t v20 = *(void *)v19;
    if (*(void *)v19 >> 62) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v21; uint64_t v21 = sub_24D149468())
    {
      uint64_t v22 = 0;
      unint64_t v23 = v20 & 0xC000000000000001;
      uint64_t v48 = v20 + 32;
      double v24 = (SEL *)&unk_2652FF000;
      double v25 = (void *)MEMORY[0x263F8EED0];
      uint64_t v47 = v20;
      unint64_t v49 = v20 & 0xC000000000000001;
      uint64_t v50 = v21;
      while (1)
      {
        uint64_t v26 = v23 ? (char *)MEMORY[0x25331E4B0](v22, v20) : (char *)*(id *)(v48 + 8 * v22);
        uint64_t v27 = v26;
        if (__OFADD__(v22++, 1)) {
          break;
        }
        [v5 v24[376]];
        uint64_t v32 = (double *)&v27[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
        double v33 = *(double *)&v27[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
        double v34 = *(double *)&v27[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 8];
        double v35 = *(double *)&v27[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 16];
        double v36 = *(double *)&v27[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 24];
        double *v32 = v37;
        v32[1] = v29;
        v32[2] = v30;
        v32[3] = v31;
        if (v37 == v33 && v29 == v34 && v30 == v35 && v31 == v36)
        {
        }
        else
        {
          id v41 = &v27[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          uint64_t v42 = *(void *)(*(void *)v41 + 16);
          if (v42)
          {
            id v43 = v5;
            uint64_t v44 = *(void *)v41 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_24D12742C(v44, (uint64_t)v51, &qword_26B189230);
              id v45 = (void *)MEMORY[0x25331EC50](v51);
              if (v45)
              {
                id v46 = v45;
                (*(void (**)(char *, double, double, double, double))((*v25 & *v45) + 0xD8))(v27, *v32, v32[1], v32[2], v32[3]);
              }
              sub_24D1276AC((uint64_t)v51, &qword_26B189230);
              v44 += 8;
              --v42;
            }
            while (v42);

            swift_bridgeObjectRelease_n();
            uint64_t v5 = v43;
            uint64_t v20 = v47;
          }
          else
          {
          }
          unint64_t v23 = v49;
          uint64_t v21 = v50;
          double v24 = (SEL *)&unk_2652FF000;
        }
        if (v22 == v21) {
          return swift_bridgeObjectRelease_n();
        }
      }
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain_n();
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

id DRPDropletContainerView.frame.getter()
{
  return sub_24D125EA8((SEL *)&selRef_frame);
}

uint64_t DRPDropletContainerView.frame.setter()
{
  return sub_24D125F68((SEL *)&selRef_setFrame_, (SEL *)&selRef_frame);
}

id DRPDropletContainerView.bounds.getter()
{
  return sub_24D125EA8((SEL *)&selRef_bounds);
}

id sub_24D125EA8(SEL *a1)
{
  v2.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v2, *a1);
}

uint64_t DRPDropletContainerView.bounds.setter()
{
  return sub_24D125F68((SEL *)&selRef_setBounds_, (SEL *)&selRef_bounds);
}

uint64_t sub_24D125F68(SEL *a1, SEL *a2)
{
  v12.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v12, *a1);
  uint64_t v5 = &v2[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v6 = *(void *)v5;
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v7) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24D149468();
  uint64_t v7 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x25331E4B0](v9, v6);
      }
      else {
        id v10 = *(id *)(v6 + 8 * v9 + 32);
      }
      unint64_t v11 = v10;
      ++v9;
      [v2 *a2];
      [v11 *a1];
    }
    while (v7 != v9);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

id DRPDropletContainerView.center.getter()
{
  v1.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v1, sel_center);
}

uint64_t DRPDropletContainerView.center.setter()
{
  v8.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v8, sel_setCenter_);
  objc_super v1 = &v0[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v2 = *(void *)v1;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24D149468();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x25331E4B0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      ++v5;
      objc_msgSend(v0, sel_center);
      objc_msgSend(v7, sel_setCenter_);
    }
    while (v3 != v5);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

double DRPDropletContainerView.transform.getter@<D0>(_OWORD *a1@<X8>)
{
  v6.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v6, sel_transform);
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t DRPDropletContainerView.transform.setter(_OWORD *a1)
{
  v11.super_class = (Class)DRPDropletContainerView;
  long long v2 = a1[1];
  v10[0] = *a1;
  v10[1] = v2;
  v10[2] = a1[2];
  objc_msgSendSuper2(&v11, sel_setTransform_, v10);
  long long v3 = &v1[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v4 = *(void *)v3;
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v5) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24D149468();
  uint64_t v5 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x25331E4B0](v7, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * v7 + 32);
      }
      uint64_t v9 = v8;
      ++v7;
      objc_msgSend(v1, sel_transform);
      objc_msgSend(v9, sel_setTransform_, v10);
    }
    while (v5 != v7);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

id DRPDropletContainerView.isHidden.getter()
{
  v1.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v1, sel_isHidden);
}

uint64_t DRPDropletContainerView.isHidden.setter(char a1)
{
  v9.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v9, sel_setHidden_, a1 & 1);
  long long v2 = &v1[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v3 = *(void *)v2;
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v4) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24D149468();
  uint64_t v4 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x25331E4B0](i, v3);
      }
      else {
        id v7 = *(id *)(v3 + 8 * i + 32);
      }
      id v8 = v7;
      objc_msgSend(v7, sel_setHidden_, objc_msgSend(v1, sel_isHidden));
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

double DRPDropletContainerView.transform3D.getter@<D0>(_OWORD *a1@<X8>)
{
  v11.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v11, sel_transform3D);
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  return result;
}

uint64_t DRPDropletContainerView.transform3D.setter(_OWORD *a1)
{
  long long v2 = a1[1];
  v13[0] = *a1;
  v13[1] = v2;
  long long v3 = a1[3];
  v13[2] = a1[2];
  v13[3] = v3;
  long long v4 = a1[5];
  v13[4] = a1[4];
  v13[5] = v4;
  long long v5 = a1[7];
  v13[6] = a1[6];
  v14.super_class = (Class)DRPDropletContainerView;
  v13[7] = v5;
  objc_msgSendSuper2(&v14, sel_setTransform3D_, v13);
  long long v6 = &v1[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v7 = *(void *)v6;
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v8) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24D149468();
  uint64_t v8 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x25331E4B0](v10, v7);
      }
      else {
        id v11 = *(id *)(v7 + 8 * v10 + 32);
      }
      objc_super v12 = v11;
      ++v10;
      objc_msgSend(v1, sel_transform3D);
      objc_msgSend(v12, sel_setTransform3D_, v13);
    }
    while (v8 != v10);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t DRPDropletContainerView._setVelocity(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v29 = a1;
  sub_24D12742C(a1, (uint64_t)v31, &qword_26B189550);
  uint64_t v5 = v32;
  if (v32)
  {
    long long v6 = __swift_project_boxed_opaque_existential_0(v31, v32);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6, v6);
    long long v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_24D1494B8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
    if (a3)
    {
LABEL_3:
      id v11 = (void *)sub_24D149258();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  id v11 = 0;
LABEL_6:
  v30.receiver = v3;
  v30.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v30, sel__setVelocity_forKey_, v10, v11, v27);
  swift_unknownObjectRelease();

  objc_super v12 = &v3[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  uint64_t v13 = *(void *)v12;
  if (*(void *)v12 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_24D149468();
    uint64_t v14 = result;
    if (result) {
      goto LABEL_8;
    }
    return swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain_n();
  if (!v14) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_8:
  if (v14 >= 1)
  {
    uint64_t v16 = 0;
    unint64_t v28 = v13 & 0xC000000000000001;
    while (1)
    {
      if (v28) {
        id v18 = (id)MEMORY[0x25331E4B0](v16, v13);
      }
      else {
        id v18 = *(id *)(v13 + 8 * v16 + 32);
      }
      id v19 = v18;
      sub_24D12742C(v29, (uint64_t)v31, &qword_26B189550);
      uint64_t v20 = v32;
      if (v32)
      {
        uint64_t v21 = __swift_project_boxed_opaque_existential_0(v31, v32);
        uint64_t v22 = a3;
        uint64_t v23 = *(void *)(v20 - 8);
        MEMORY[0x270FA5388](v21, v21);
        double v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v23 + 16))(v25);
        uint64_t v26 = sub_24D1494B8();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v20);
        a3 = v22;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
        if (!v22) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v26 = 0;
        if (!a3)
        {
LABEL_19:
          id v17 = 0;
          goto LABEL_11;
        }
      }
      id v17 = (void *)sub_24D149258();
LABEL_11:
      ++v16;
      objc_msgSend(v19, sel__setVelocity_forKey_, v26, v17);

      swift_unknownObjectRelease();
      if (v14 == v16) {
        return swift_bridgeObjectRelease_n();
      }
    }
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall DRPDropletContainerView._removeAllRetargetableAnimations(_:)(Swift::Bool a1)
{
  v10.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v10, sel__removeAllRetargetableAnimations_, a1);
  long long v3 = (unint64_t *)(v1 + OBJC_IVAR___DRPDropletContainerView_participantViews);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    return;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D149468();
  if (!v5) {
    goto LABEL_10;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    BOOL v7 = a1;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x25331E4B0](v6, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * v6 + 32);
      }
      long long v9 = v8;
      ++v6;
      objc_msgSend(v8, sel__removeAllRetargetableAnimations_, v7);
    }
    while (v5 != v6);
    goto LABEL_10;
  }
  __break(1u);
}

Swift::Void __swiftcall DRPDropletContainerView.layoutSubviews()()
{
  v18.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v18, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  long long v9 = &v0[OBJC_IVAR___DRPDropletContainerView_participantViews];
  swift_beginAccess();
  unint64_t v10 = *(void *)v9;
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_24D149468();
    if (!v11) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v11) {
      goto LABEL_10;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v12 = 0;
  do
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x25331E4B0](v12, v10);
    }
    else {
      id v13 = *(id *)(v10 + 8 * v12 + 32);
    }
    uint64_t v14 = v13;
    ++v12;
    objc_msgSend(v13, sel_setBounds_, v2, v4, v6, v8);
    objc_msgSend(v0, sel_center);
    objc_msgSend(v14, sel_setCenter_);
    objc_msgSend(v0, sel_transform);
    objc_msgSend(v14, sel_setTransform_, &v17);
  }
  while (v11 != v12);
LABEL_10:
  swift_bridgeObjectRelease_n();
  id v15 = objc_msgSend(v0, sel_contentView);
  if (v15)
  {
    uint64_t v16 = v15;
    UIRectGetCenter();
    objc_msgSend(v16, sel_setCenter_);
  }
}

void (*sub_24D127288(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *)
{
  double v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24D1273A4(v6, a2, a3);
  return sub_24D1272F0;
}

void (*sub_24D1272F4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *)
{
  double v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24D127708(v6, a2, a3);
  return sub_24D1272F0;
}

void sub_24D12735C(void *a1)
{
  double v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_24D1273A4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  double v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25331E4B0](a2, a3);
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
    *(void *)double v3 = v4;
    return sub_24D127424;
  }
  __break(1u);
  return result;
}

void sub_24D127424(id *a1)
{
}

uint64_t sub_24D12742C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

char *keypath_get_selector_contentView()
{
  return sel_contentView;
}

id sub_24D127530@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_contentView);
  *a2 = result;
  return result;
}

id sub_24D12756C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContentView_, *a1);
}

char *keypath_get_selector_continuousCornerRadius()
{
  return sel_continuousCornerRadius;
}

id sub_24D12758C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_continuousCornerRadius);
  *a2 = v4;
  return result;
}

id sub_24D1275C0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContinuousCornerRadius_, *a1);
}

id sub_24D1275D4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_24D127608(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

id sub_24D12761C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryOutsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_24D127654(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryOutsets_, *a1, a1[1], a1[2], a1[3]);
}

unint64_t type metadata accessor for DRPDropletContainerView()
{
  unint64_t result = qword_26B1894C8;
  if (!qword_26B1894C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1894C8);
  }
  return result;
}

uint64_t sub_24D1276AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t (*sub_24D127708(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25331E4B0](a2, a3);
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
    return sub_24D127788;
  }
  __break(1u);
  return result;
}

void sub_24D1277C8()
{
  id v9 = objc_msgSend(v0, sel_layer);
  self;
  uint64_t v1 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_24D114FEC(0, (unint64_t *)&unk_26B189518);
  uint64_t v2 = sub_24D149368();
  id v3 = objc_msgSend(v1, sel_locations);
  if (!v3) {
    goto LABEL_14;
  }
  id v4 = v3;
  unint64_t v5 = sub_24D1492C8();

  unint64_t v11 = v5;
  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
    || (v5 & 0x8000000000000000) != 0
    || (v5 & 0x4000000000000000) != 0)
  {
    sub_24D1486D0(v5);
    unint64_t v5 = v6;
    unint64_t v11 = v6;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  uint64_t v7 = *(void **)((v5 & 0xFFFFFFFFFFFFFF8) + 0x20);
  *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x20) = v2;

  sub_24D1492D8();
  if (v11)
  {
    double v8 = (void *)sub_24D1492B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v8 = 0;
  }
  objc_msgSend(v1, sel_setLocations_, v8, v9);
}

void sub_24D12794C()
{
  id v9 = objc_msgSend(v0, sel_layer);
  self;
  uint64_t v1 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_24D114FEC(0, (unint64_t *)&unk_26B189518);
  uint64_t v2 = sub_24D149368();
  id v3 = objc_msgSend(v1, sel_locations);
  if (!v3) {
    goto LABEL_14;
  }
  id v4 = v3;
  unint64_t v5 = sub_24D1492C8();

  unint64_t v11 = v5;
  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
    || (v5 & 0x8000000000000000) != 0
    || (v5 & 0x4000000000000000) != 0)
  {
    sub_24D1486D0(v5);
    unint64_t v5 = v6;
    unint64_t v11 = v6;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  uint64_t v7 = *(void **)((v5 & 0xFFFFFFFFFFFFFF8) + 0x28);
  *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x28) = v2;

  sub_24D1492D8();
  if (v11)
  {
    double v8 = (void *)sub_24D1492B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v8 = 0;
  }
  objc_msgSend(v1, sel_setLocations_, v8, v9);
}

id sub_24D127AD4(uint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  v35.receiver = v10;
  v35.super_class = (Class)type metadata accessor for GradientView();
  id v21 = objc_msgSendSuper2(&v35, sel_initWithFrame_, a3, a4, a5, a6);
  id v22 = objc_msgSend(v21, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setType_, *MEMORY[0x263F15DD0]);

  id v23 = objc_msgSend(v21, sel_layer);
  self;
  uint64_t v24 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_24D127E5C(a2);
  swift_bridgeObjectRelease();
  double v25 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setColors_, v25);

  id v26 = objc_msgSend(v21, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setStartPoint_, a7, a8);

  id v27 = objc_msgSend(v21, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setEndPoint_, a9, a10);

  id v28 = objc_msgSend(v21, sel_layer);
  self;
  uint64_t v29 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v30 = *(void *)(a1 + 16);
  if (v30)
  {
    sub_24D149408();
    sub_24D114FEC(0, (unint64_t *)&unk_26B189518);
    uint64_t v31 = 0;
    do
    {
      uint64_t v32 = v31 + 1;
      sub_24D149368();
      sub_24D1493E8();
      sub_24D149418();
      sub_24D149428();
      sub_24D1493F8();
      uint64_t v31 = v32;
    }
    while (v30 != v32);
  }
  swift_bridgeObjectRelease();
  sub_24D114FEC(0, (unint64_t *)&unk_26B189518);
  double v33 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setLocations_, v33);

  return v21;
}

char *sub_24D127E5C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24D149468();
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
  uint64_t v13 = MEMORY[0x263F8EE78];
  unint64_t result = sub_24D1283D8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x25331E4B0](i, a1);
        type metadata accessor for CGColor(0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24D1283D8(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_24D1283D8((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_24D11C120(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      double v8 = (id *)(a1 + 32);
      type metadata accessor for CGColor(0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24D1283D8(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_24D1283D8((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_24D11C120(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

char *sub_24D128090(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24D149468();
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
  uint64_t v13 = MEMORY[0x263F8EE78];
  unint64_t result = sub_24D1283D8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x25331E4B0](i, a1);
        sub_24D114FEC(0, &qword_2698580F0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24D1283D8(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_24D1283D8((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_24D11C120(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      double v8 = (id *)(a1 + 32);
      sub_24D114FEC(0, &qword_2698580F0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24D1283D8(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_24D1283D8((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_24D11C120(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

id sub_24D128380()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GradientView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GradientView()
{
  return self;
}

char *sub_24D1283D8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_24D1283F8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_24D1283F8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

id sub_24D128500(char a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a1) {
    double v11 = a7;
  }
  else {
    double v11 = 0.0;
  }
  if (a1) {
    double v12 = 0.0;
  }
  else {
    double v12 = a7;
  }
  if (a1) {
    double v13 = 0.0;
  }
  else {
    double v13 = a6;
  }
  if (a1) {
    double v14 = a6;
  }
  else {
    double v14 = 0.0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1892A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D14B3F0;
  *(_OWORD *)(inited + 32) = xmmword_24D14B450;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  unint64_t v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_24D14B460;
  long long v17 = self;
  id v18 = objc_msgSend(v17, sel_whiteColor);
  id v19 = objc_msgSend(v18, sel_CGColor);

  *(void *)(v16 + 32) = v19;
  id v20 = objc_msgSend(v17, sel_whiteColor);
  id v21 = objc_msgSend(v20, sel_colorWithAlphaComponent_, 0.0);

  id v22 = objc_msgSend(v21, sel_CGColor);
  *(void *)(v16 + 40) = v22;
  sub_24D1492D8();
  id v23 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  return sub_24D127AD4(inited, v16, a2, a3, a4, a5, v13, v14, v12, v11);
}

uint64_t sub_24D1286C4(void *a1)
{
  objc_super v2 = sub_24D12A19C();
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor];
  *(void *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor] = a1;
  id v4 = a1;
  sub_24D12C308();

  char v5 = sub_24D12A1A8();
  unint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor];
  *(void *)&v5[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor] = v4;
  id v7 = v4;
  sub_24D12C308();

  unint64_t v8 = sub_24D1289D4();
  unint64_t v9 = v8;
  if (!(v8 >> 62))
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:

    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24D149468();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x25331E4B0](v12, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * v12 + 32);
      }
      double v14 = v13;
      ++v12;
      id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithCGColor_, v7);
      objc_msgSend(v14, sel_setBackgroundColor_, v15);
    }
    while (v10 != v12);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24D12885C()
{
  unint64_t v0 = sub_24D1289D4();
  unint64_t v1 = v0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24D149468();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x25331E4B0](i, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      unint64_t v6 = v5;
      type metadata accessor for DropletParticipantView();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x25331E390]();
        if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24D1492E8();
        }
        sub_24D1492F8();
        sub_24D1492D8();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v8;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_24D1289D4()
{
  unint64_t v0 = sub_24D12A19C();
  id v1 = objc_msgSend(v0, sel_subviews);

  sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
  uint64_t v2 = sub_24D1492C8();

  uint64_t v3 = sub_24D12A36C();
  id v4 = objc_msgSend(v3, sel_subviews);

  unint64_t v5 = sub_24D1492C8();
  sub_24D13E7D0(v5);
  unint64_t v6 = sub_24D12A1A8();
  id v7 = objc_msgSend(v6, sel_subviews);

  unint64_t v8 = sub_24D1492C8();
  sub_24D13E7D0(v8);
  return v2;
}

unsigned char *sub_24D128B00(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v7 = a2 & 1;
  unint64_t v8 = sub_24D12A19C();
  unint64_t v9 = sub_24D129D60(v8, a1, v7, a3, a4);

  uint64_t v10 = sub_24D12A1A8();
  sub_24D129628(v10, a1, v7);

  double v11 = sub_24D12A36C();
  uint64_t v12 = sub_24D129628(v11, a1, v7);

  uint64_t v13 = swift_unknownObjectWeakAssign();
  uint64_t v14 = MEMORY[0x25331EC50](v13);
  if (v14)
  {
    id v15 = (void *)v14;
    if (v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80] == 2) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.0;
    }
    long long v17 = v12;
    objc_msgSend(v15, sel_setAlpha_, v16);
  }
  return v9;
}

void sub_24D128C28(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence;
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence) = a1;
  if (v3 != a1)
  {
    uint64_t v4 = v1;
    sub_24D12C03C(v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v31, &qword_26B189100);
    sub_24D12C03C((uint64_t)v31, (uint64_t)v32, &qword_26B189100);
    sub_24D12C02C(v32);
    unint64_t v5 = sub_24D12885C();
    unint64_t v6 = v5;
    if (v5 >> 62) {
      goto LABEL_21;
    }
    uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = sub_24D149468())
    {
      uint64_t v8 = 0;
      unint64_t v9 = v6 & 0xC000000000000001;
      unint64_t v30 = v6 + 32;
      uint64_t v10 = (void *)MEMORY[0x263F8EED0];
      uint64_t v26 = v2;
      unint64_t v27 = v6 & 0xC000000000000001;
      uint64_t v28 = v7;
      uint64_t v29 = v4;
      while (1)
      {
        double v11 = v9 ? (char *)MEMORY[0x25331E4B0](v8, v6) : (char *)*(id *)(v30 + 8 * v8);
        uint64_t v12 = v11;
        if (__OFADD__(v8++, 1)) {
          break;
        }
        double v14 = *(double *)(v4 + v2);
        uint64_t v15 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence;
        double v16 = *(double *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
        *(double *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v14;
        if (v14 == v16)
        {
        }
        else
        {
          unint64_t v17 = v6;
          id v18 = &v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          uint64_t v19 = *(void *)(*(void *)v18 + 16);
          if (v19)
          {
            uint64_t v20 = *(void *)v18 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_24D12C2A0(v20, (uint64_t)v31);
              id v21 = (void *)MEMORY[0x25331EC50](v31);
              if (v21)
              {
                id v22 = v21;
                (*(void (**)(double))((*v10 & *v21) + 0x68))(*(double *)&v12[v15]);
              }
              sub_24D1276AC((uint64_t)v31, &qword_26B189230);
              v20 += 8;
              --v19;
            }
            while (v19);

            swift_bridgeObjectRelease_n();
            uint64_t v2 = v26;
          }
          else
          {
          }
          unint64_t v6 = v17;
          uint64_t v7 = v28;
          uint64_t v4 = v29;
          unint64_t v9 = v27;
        }
        if (v8 == v7) {
          goto LABEL_22;
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
    }
LABEL_22:
    swift_bridgeObjectRelease_n();
    id v23 = sub_24D12A19C();
    sub_24D114348(*(double *)(v4 + v2));

    uint64_t v24 = sub_24D12A36C();
    sub_24D114348(*(double *)(v4 + v2));

    double v25 = sub_24D12A1A8();
    sub_24D114348(*(double *)(v4 + v2));
  }
}

id sub_24D128ED0(void *a1, double a2, double a3, double a4, double a5, double a6)
{
  swift_getObjectType();
  uint64_t v13 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters;
  double v14 = self;
  uint64_t v15 = v6;
  id v16 = objc_msgSend(v14, sel_rootSettings);
  unsigned __int8 v17 = objc_msgSend(v16, sel_suppressDropletEffectFilters);

  *((unsigned char *)v6 + v13) = v17;
  id v18 = &v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth];
  *(void *)id v18 = 0;
  *((void *)v18 + 1) = 0;
  *(void *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView] = 0;
  uint64_t v19 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  *(void *)&v15[v19] = sub_24D123914(MEMORY[0x263F8EE78]);

  uint64_t v20 = (uint64_t)&v15[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry];
  sub_24D12BE48((uint64_t)v42);
  sub_24D12C03C((uint64_t)v42, v20, &qword_26B189100);
  *(double *)&v15[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence] = a6;
  v41.receiver = v15;
  v41.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  id v21 = objc_msgSendSuper2(&v41, sel_initWithFrame_, a2, a3, a4, a5);
  id v22 = objc_msgSend(v14, sel_rootSettings);
  objc_msgSend(v22, sel_addKeyObserver_, v21);

  id v23 = sub_24D12A1A8();
  objc_msgSend(a1, sel_addSubview_, v23);

  id v24 = sub_24D12A2B8();
  double v25 = sub_24D12A36C();
  objc_msgSend(v24, sel_addSubview_, v25);

  id v26 = v21;
  id v27 = sub_24D12A2B8();
  objc_msgSend(v26, sel_addSubview_, v27);

  id v28 = v26;
  uint64_t v29 = sub_24D12A19C();
  objc_msgSend(v28, sel_addSubview_, v29);

  id v30 = objc_msgSend(v28, sel_traitCollection);
  objc_msgSend(v30, sel_displayScale);
  double v32 = v31;

  id v33 = objc_msgSend(v28, sel_layer);
  objc_msgSend(v33, sel_setRasterizationScale_, v32);

  double v34 = sub_24D12A1A8();
  id v35 = objc_msgSend(v34, sel_layer);

  objc_msgSend(v35, sel_setRasterizationScale_, v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1892B8);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_24D14B240;
  uint64_t v37 = sub_24D149228();
  uint64_t v38 = MEMORY[0x263F81E90];
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v38;
  id v39 = v28;
  sub_24D149358();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_24D12A484();
  sub_24D12ABB0();
  sub_24D12ADB4();

  return v39;
}

uint64_t sub_24D129280(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  sub_24D12BFB0(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24D122B54(a2, a1, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v3 + v6);
  *(void *)(v3 + v6) = v7;
  uint64_t v10 = swift_bridgeObjectRetain();
  sub_24D12B140(v10, v9);
  LOBYTE(a1) = v11;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    sub_24D12A484();
    sub_24D12ABB0();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D129360(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  unint64_t v5 = sub_24D121B54(a1);
  char v7 = v6;
  swift_bridgeObjectRetain();
  if (v7)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_24D123068();
    }
    uint64_t v8 = *(void *)(v4 + 56) + 88 * v5;
    uint64_t v23 = *(void *)(v8 + 8);
    id v24 = *(void **)v8;
    uint64_t v9 = *(void *)(v8 + 32);
    uint64_t v21 = *(void *)(v8 + 24);
    uint64_t v22 = *(void *)(v8 + 16);
    uint64_t v10 = *(void *)(v8 + 40);
    uint64_t v11 = *(void *)(v8 + 48);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v20 = *(void *)(v8 + 56);
    uint64_t v13 = *(void *)(v8 + 72);
    char v14 = *(unsigned char *)(v8 + 80);
    sub_24D12BC94(v5, v4);
    swift_bridgeObjectRelease();
    sub_24D12BF7C(v24, v23, v22, v21, v9, v10, v11, v20, v12, v13, v14);
  }
  uint64_t v15 = *(void *)(v2 + v3);
  *(void *)(v2 + v3) = v4;
  uint64_t v16 = swift_bridgeObjectRetain();
  sub_24D12B140(v16, v15);
  char v18 = v17;
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    sub_24D12A484();
    sub_24D12ABB0();
  }
  return swift_bridgeObjectRelease();
}

void sub_24D129528()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for DropletGroupView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  id v1 = sub_24D12A2B8();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  uint64_t v2 = sub_24D12A36C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  uint64_t v3 = sub_24D12A19C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);
}

void *sub_24D129628(void *a1, uint64_t a2, char a3)
{
  uint64_t v65 = a2;
  uint64_t v5 = OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence;
  uint64_t v6 = *(void *)(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  char v7 = (objc_class *)type metadata accessor for DropletParticipantView();
  uint64_t v8 = objc_allocWithZone(v7);
  swift_unknownObjectWeakInit();
  v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden] = 1;
  *(void *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = 0;
  uint64_t v9 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
  uint64_t v10 = *MEMORY[0x263F834E8];
  uint64_t v11 = *(void *)(MEMORY[0x263F834E8] + 8);
  uint64_t v12 = *(void *)(MEMORY[0x263F834E8] + 16);
  uint64_t v13 = *(void *)(MEMORY[0x263F834E8] + 24);
  *uint64_t v9 = *MEMORY[0x263F834E8];
  v9[1] = v11;
  void v9[2] = v12;
  v9[3] = v13;
  char v14 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
  *char v14 = v10;
  v14[1] = v11;
  v14[2] = v12;
  v14[3] = v13;
  uint64_t v15 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets];
  void *v15 = v10;
  v15[1] = v11;
  v15[2] = v12;
  v15[3] = v13;
  uint64_t v16 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  *((_OWORD *)v16 + 3) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *(_OWORD *)uint64_t v16 = 0u;
  v16[80] = 1;
  *(void *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineEDRGain] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation] = 0x3FF0000000000000;
  *(void *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews] = MEMORY[0x263F8EE78];
  *(void *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v6;
  v76.receiver = v8;
  v76.super_class = v7;
  char v17 = (char *)objc_msgSendSuper2(&v76, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  char v18 = v17;
  double v19 = *(double *)(v3 + v5);
  uint64_t v20 = (char *)OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence;
  double v21 = *(double *)&v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
  *(double *)&v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v19;
  if (v19 != v21)
  {
    uint64_t v22 = &v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
    swift_beginAccess();
    uint64_t v23 = *(void *)(*(void *)v22 + 16);
    if (v23)
    {
      uint64_t v24 = *(void *)v22 + 32;
      swift_bridgeObjectRetain();
      double v25 = (void *)MEMORY[0x263F8EED0];
      do
      {
        id v26 = (void *)MEMORY[0x25331EC50](v24);
        if (v26)
        {
          id v27 = v26;
          (*(void (**)(double))((*v25 & *v26) + 0x68))(*(double *)&v20[(void)v18]);
        }
        v24 += 8;
        --v23;
      }
      while (v23);
      swift_bridgeObjectRelease();
    }
  }
  id v28 = (objc_class *)type metadata accessor for DropletBoundaryView();
  id v29 = objc_allocWithZone(v28);
  id v30 = v18;
  double v31 = sub_24D148DB8(v30, 1);
  id v32 = objc_allocWithZone(v28);
  id v33 = v30;
  double v34 = sub_24D148DB8(v33, 2);
  id v35 = objc_allocWithZone(v28);
  uint64_t v36 = v33;
  uint64_t v37 = sub_24D148DB8(v36, 4);
  id v38 = objc_allocWithZone(v28);
  uint64_t v70 = v36;
  id v39 = sub_24D148DB8(v70, 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D14B480;
  *(void *)(inited + 32) = v31;
  *(void *)(inited + 40) = v34;
  *(void *)(inited + 48) = v37;
  *(void *)(inited + 56) = v39;
  *(void *)&v77[0] = inited;
  objc_super v41 = v77;
  sub_24D1492D8();
  uint64_t v42 = *(void *)&v77[0];
  unint64_t v43 = *(void *)&v77[0] & 0xC000000000000001;
  if ((*(void *)&v77[0] & 0xC000000000000001) == 0
    && *(void *)((*(void *)&v77[0] & 0xFFFFFFFFFFFFFF8) + 0x10) < 4uLL)
  {
    __break(1u);
LABEL_31:
    objc_super v41 = sub_24D148570(0, v41[2] + 1, 1, v41);
    *(void *)uint64_t v20 = v41;
    goto LABEL_27;
  }
  uint64_t v69 = v31;
  uint64_t v68 = v34;
  uint64_t v67 = v37;
  double v66 = v39;
  uint64_t v44 = 0;
  do
  {
    if (v43) {
      uint64_t v48 = (char *)MEMORY[0x25331E4B0](v44, v42);
    }
    else {
      uint64_t v48 = (char *)*(id *)(v42 + 8 * v44 + 32);
    }
    unint64_t v49 = v48;
    objc_msgSend(a1, sel_bounds, v65);
    CGRect v80 = *(CGRect *)&v49[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds];
    *(CGRect *)&v49[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds] = v79;
    if (!CGRectEqualToRect(v79, v80))
    {
      sub_24D12C03C((uint64_t)&v49[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry], (uint64_t)v73, &qword_26B189100);
      sub_24D12C03C((uint64_t)v73, (uint64_t)v74, &qword_26B189100);
      if (!sub_24D12C02C(v74))
      {
        v77[10] = v74[10];
        v77[11] = v74[11];
        v77[12] = v74[12];
        uint64_t v78 = v75;
        v77[6] = v74[6];
        v77[7] = v74[7];
        v77[8] = v74[8];
        v77[9] = v74[9];
        v77[2] = v74[2];
        v77[3] = v74[3];
        v77[4] = v74[4];
        v77[5] = v74[5];
        v77[0] = v74[0];
        v77[1] = v74[1];
        sub_24D148A58((double *)v77);
      }
    }
    ++v44;
    id v45 = sub_24D12A19C();
    id v46 = *(id *)&v45[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor];

    id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithCGColor_, v46);
    objc_msgSend(v49, sel_setBackgroundColor_, v47);

    objc_msgSend(a1, sel_addSubview_, v49);
  }
  while (v44 != 4);
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_24D12A19C();
  id v51 = *(id *)&v50[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor];

  id v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithCGColor_, v51);
  uint64_t v37 = v70;
  objc_msgSend(v70, sel_setBackgroundColor_, v52);

  objc_msgSend(a1, sel_addSubview_, v70);
  if ((a3 & 1) == 0)
  {
    uint64_t v53 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges;
    uint64_t v54 = *(void *)&v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
    *(void *)&v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = v65;
    if (v54 != v65)
    {
      long long v55 = &v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
      swift_beginAccess();
      uint64_t v56 = *(void *)(*(void *)v55 + 16);
      if (v56)
      {
        uint64_t v57 = *(void *)v55 + 32;
        swift_bridgeObjectRetain();
        uint64_t v58 = (void *)MEMORY[0x263F8EED0];
        do
        {
          long long v59 = (void *)MEMORY[0x25331EC50](v57);
          if (v59)
          {
            double v60 = v59;
            (*(void (**)(char *, void))((*v58 & *v59) + 0xC8))(v70, *(void *)&v70[v53]);
          }
          v57 += 8;
          --v56;
        }
        while (v56);
        swift_bridgeObjectRelease();
      }
    }
  }
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  sub_24D12C03C((uint64_t)v74, (uint64_t)v72, &qword_26B189230);
  uint64_t v20 = &v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
  swift_beginAccess();
  objc_super v41 = *(void **)v20;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v20 = v41;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  unint64_t v63 = v41[2];
  unint64_t v62 = v41[3];
  if (v63 >= v62 >> 1)
  {
    objc_super v41 = sub_24D148570((void *)(v62 > 1), v63 + 1, 1, v41);
    *(void *)uint64_t v20 = v41;
  }
  v41[2] = v63 + 1;
  sub_24D12C03C((uint64_t)v72, (uint64_t)&v41[v63 + 4], &qword_26B189230);

  return v37;
}

unsigned char *sub_24D129D60(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  char v7 = sub_24D129628(a1, a2, a3 & 1);
  objc_allocWithZone((Class)type metadata accessor for DropletBackgroundView());
  uint64_t v8 = v7;
  sub_24D1433B4(v8);
  sub_24D12C03C(a4, (uint64_t)v48, &qword_26B189280);
  if ((v49 & 1) == 0)
  {
    uint64_t v9 = (float64x2_t *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
    float64x2_t v10 = v48[1];
    float64x2_t v11 = v48[0];
    float64x2_t v12 = *(float64x2_t *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
    float64x2_t v13 = *(float64x2_t *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
    *uint64_t v9 = v48[0];
    v9[1] = v10;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v11, v12), (int32x4_t)vceqq_f64(v10, v13))), 0xFuLL))) & 1) == 0)
    {
      char v14 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
      swift_beginAccess();
      uint64_t v15 = *(void *)(*(void *)v14 + 16);
      if (v15)
      {
        uint64_t v16 = *(void *)v14 + 32;
        swift_bridgeObjectRetain();
        char v17 = (void *)MEMORY[0x263F8EED0];
        do
        {
          char v18 = (void *)MEMORY[0x25331EC50](v16);
          if (v18)
          {
            double v19 = v18;
            (*(void (**)(unsigned char *, float64_t, float64_t, float64_t, float64_t))((*v17 & *v18) + 0xE0))(v8, v9->f64[0], v9->f64[1], v9[1].f64[0], v9[1].f64[1]);
          }
          v16 += 8;
          --v15;
        }
        while (v15);
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_24D12C03C(a5, (uint64_t)v46, &qword_26B1890F8);
  if (v46[80] != 255)
  {
    sub_24D12406C((uint64_t)v46, (uint64_t)v47);
    uint64_t v20 = (uint64_t)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
    sub_24D12406C((uint64_t)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType], (uint64_t)v52);
    uint64_t v21 = *(void *)(v20 + 16);
    uint64_t v43 = *(void *)(v20 + 8);
    uint64_t v44 = *(void **)v20;
    uint64_t v22 = *(void *)(v20 + 32);
    uint64_t v23 = *(void *)(v20 + 40);
    uint64_t v41 = *(void *)(v20 + 48);
    uint64_t v42 = *(void *)(v20 + 24);
    uint64_t v24 = *(void *)(v20 + 64);
    uint64_t v40 = *(void *)(v20 + 56);
    uint64_t v25 = *(void *)(v20 + 72);
    char v26 = *(unsigned char *)(v20 + 80);
    sub_24D12406C((uint64_t)v47, v20);
    sub_24D12BFB0(a5, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF90);
    uint64_t v45 = a5;
    sub_24D12BFB0(a5, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF90);
    sub_24D12BFB0((uint64_t)v52, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
    sub_24D12BF7C(v44, v43, v21, v42, v22, v23, v41, v40, v24, v25, v26);
    sub_24D12406C(v20, (uint64_t)v51);
    sub_24D12BFB0((uint64_t)v51, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
    char v27 = sub_24D144E40((uint64_t)v51, (uint64_t)v52);
    sub_24D12BFB0((uint64_t)v51, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
    if ((v27 & 1) == 0)
    {
      id v28 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
      swift_beginAccess();
      uint64_t v29 = *(void *)v28;
      uint64_t v30 = *(void *)(*(void *)v28 + 16);
      if (v30)
      {
        uint64_t v31 = v29 + 32;
        swift_bridgeObjectRetain();
        id v32 = (void *)MEMORY[0x263F8EED0];
        do
        {
          uint64_t v33 = MEMORY[0x25331EC50](v31);
          if (v33)
          {
            double v34 = (void *)v33;
            sub_24D12406C(v20, (uint64_t)v50);
            id v35 = *(void (**)(unsigned char *, unsigned char *))((*v32 & *v34) + 0xF0);
            sub_24D12BFB0((uint64_t)v50, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
            v35(v8, v50);
            sub_24D12BFB0((uint64_t)v50, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
          }
          v31 += 8;
          --v30;
        }
        while (v30);
        swift_bridgeObjectRelease();
      }
      uint64_t v36 = (void *)MEMORY[0x25331EC50](&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineParticipantView]);
      if (v36)
      {
        uint64_t v37 = v36;
        double v38 = 0.0;
        if (*(unsigned char *)(v20 + 80) == 2) {
          double v38 = 1.0;
        }
        objc_msgSend(v36, sel_setAlpha_, v38);
      }
    }
    sub_24D12BFB0(v45, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12C00C);
    sub_24D12BFB0((uint64_t)v52, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
  }
  return v8;
}

char *sub_24D12A19C()
{
  return sub_24D12A1B4(&OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView);
}

char *sub_24D12A1A8()
{
  return sub_24D12A1B4(&OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView);
}

char *sub_24D12A1B4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)&v1[*a1];
  if (v3)
  {
    objc_super v4 = *(char **)&v1[*a1];
  }
  else
  {
    uint64_t v5 = v1;
    objc_msgSend(v1, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_msgSend(self, sel_blackColor);
    id v15 = objc_msgSend(v14, sel_CGColor);

    id v16 = objc_allocWithZone((Class)type metadata accessor for DropletEffectView());
    char v17 = sub_24D12C6DC(0x3FE0000000000000, 0, 0, 0, v15, v7, v9, v11, v13);
    char v18 = *(void **)&v5[v2];
    *(void *)&v5[v2] = v17;
    objc_super v4 = v17;

    uint64_t v3 = 0;
  }
  id v19 = v3;
  return v4;
}

id sub_24D12A2B8()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BlurredView()), sel_initWithFrame_, v4, v5, v6, v7);
    double v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v10 = v2;
  return v3;
}

char *sub_24D12A36C()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView];
  if (v2)
  {
    id v3 = *(char **)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView];
  }
  else
  {
    double v4 = v0;
    if (qword_26B1890D8 != -1) {
      swift_once();
    }
    id v5 = (id)qword_26B189BA0;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_allocWithZone((Class)type metadata accessor for DropletEffectView());
    id v15 = sub_24D12C6DC(0x3FE0000000000000, 0x3FE0000000000000, 0x3FDF5C28F5C28F5CLL, 1, v5, v7, v9, v11, v13);
    id v16 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v15;
    id v3 = v15;

    uint64_t v2 = 0;
  }
  id v17 = v2;
  return v3;
}

void sub_24D12A484()
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  uint64_t v2 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(v1 + 64);
  int64_t v53 = (unint64_t)(v2 + 63) >> 6;
  uint64_t v59 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  swift_bridgeObjectRetain_n();
  int64_t v7 = 0;
  while (v4)
  {
    unint64_t v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v9 = v8 | (v7 << 6);
LABEL_26:
    uint64_t v13 = *(void *)(v59 + 56) + 88 * v9;
    if (*(unsigned char *)(v13 + 80) != 1)
    {
LABEL_31:
      swift_release();
      swift_bridgeObjectRelease();
      char v28 = 1;
      goto LABEL_33;
    }
    id v14 = *(void **)v13;
    if (*(void *)v13)
    {
      uint64_t v15 = *(void *)(v13 + 8);
      uint64_t v16 = *(void *)(v13 + 16);
      uint64_t v18 = *(void *)(v13 + 24);
      uint64_t v17 = *(void *)(v13 + 32);
      uint64_t v19 = *(void *)(v13 + 48);
      uint64_t v57 = *(void *)(v13 + 40);
      int64_t v58 = v7;
      uint64_t v20 = *(void *)(v13 + 64);
      uint64_t v56 = *(void *)(v13 + 56);
      uint64_t v21 = *(void *)(v13 + 72);
      uint64_t v22 = self;
      id v61 = v14;
      id v23 = objc_msgSend(v22, sel_clearColor);
      if (v23)
      {
        uint64_t v24 = v23;
        sub_24D114FEC(0, (unint64_t *)&qword_269858310);
        uint64_t v54 = v17;
        uint64_t v25 = v17;
        uint64_t v26 = v21;
        sub_24D123FFC(v14, v15, v16, v18, v25, v57, v19, v56, v20, v21, 1);
        id v27 = v24;
        char v55 = sub_24D149378();
        sub_24D12BF7C(v14, v15, v16, v18, v54, v57, v19, v56, v20, v26, 1);

        sub_24D12BF7C(v14, v15, v16, v18, v54, v57, v19, v56, v20, v26, 1);
        int64_t v7 = v58;
        if ((v55 & 1) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_24D12BF7C(v14, v15, v16, v18, v17, v57, v19, v56, v20, v21, 1);
        int64_t v7 = v58;
LABEL_5:
        *(void *)&long long v66 = 0;
        objc_msgSend(v61, sel_getRed_green_blue_alpha_, 0, 0, 0, &v66);
        double v5 = *(double *)&v66;
        if (*(double *)&v66 != 0.0) {
          goto LABEL_31;
        }
      }
    }
  }
  int64_t v10 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_62;
  }
  if (v10 >= v53) {
    goto LABEL_32;
  }
  unint64_t v11 = *(void *)(v52 + 8 * v10);
  ++v7;
  if (v11) {
    goto LABEL_25;
  }
  int64_t v7 = v10 + 1;
  if (v10 + 1 >= v53) {
    goto LABEL_32;
  }
  unint64_t v11 = *(void *)(v52 + 8 * v7);
  if (v11) {
    goto LABEL_25;
  }
  int64_t v7 = v10 + 2;
  if (v10 + 2 >= v53) {
    goto LABEL_32;
  }
  unint64_t v11 = *(void *)(v52 + 8 * v7);
  if (v11) {
    goto LABEL_25;
  }
  int64_t v7 = v10 + 3;
  if (v10 + 3 >= v53) {
    goto LABEL_32;
  }
  unint64_t v11 = *(void *)(v52 + 8 * v7);
  if (v11) {
    goto LABEL_25;
  }
  int64_t v7 = v10 + 4;
  if (v10 + 4 >= v53) {
    goto LABEL_32;
  }
  unint64_t v11 = *(void *)(v52 + 8 * v7);
  if (v11) {
    goto LABEL_25;
  }
  int64_t v12 = v10 + 5;
  if (v12 >= v53) {
    goto LABEL_32;
  }
  unint64_t v11 = *(void *)(v52 + 8 * v12);
  if (v11)
  {
    int64_t v7 = v12;
LABEL_25:
    unint64_t v4 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v7 << 6);
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v7 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      __break(1u);
    }
    if (v7 >= v53) {
      break;
    }
    unint64_t v11 = *(void *)(v52 + 8 * v7);
    ++v12;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_32:
  swift_release();
  swift_bridgeObjectRelease();
  char v28 = 0;
LABEL_33:
  id v29 = objc_msgSend(self, sel_rootSettings);
  unsigned __int8 v30 = objc_msgSend(v29, sel_suppressCompositingFilterMultiply);

  if ((v30 & 1) == 0)
  {
    if (v28) {
      goto LABEL_44;
    }
    double v6 = *(double *)&v51[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth];
    double v5 = *(double *)&v51[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth + 8];
    if (qword_26B188F60 == -1)
    {
LABEL_40:
      if (v6 == *(double *)&xmmword_26B189C00 && v5 == *((double *)&xmmword_26B189C00 + 1)) {
        goto LABEL_34;
      }
LABEL_44:
      double v38 = sub_24D12A1A8();
      unsigned int v39 = objc_msgSend(v38, sel_isHidden);

      if (v39)
      {
        uint64_t v40 = sub_24D12A1A8();
        objc_msgSend(v40, sel_setHidden_, 0);
      }
      uint64_t v41 = (void *)*MEMORY[0x263F15D10];
      uint64_t v42 = sub_24D149268();
      uint64_t v44 = v43;
      id v45 = v41;
      id v46 = objc_msgSend(v51, sel_layer);
      id v47 = objc_msgSend(v46, sel_compositingFilter);

      if (v47)
      {
        sub_24D149388();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v65, 0, sizeof(v65));
      }
      sub_24D12C03C((uint64_t)v65, (uint64_t)&v66, &qword_26B189550);
      if (*((void *)&v67 + 1))
      {
        if (swift_dynamicCast())
        {
          if (v63 == v42 && v64 == v44)
          {

            swift_bridgeObjectRelease_n();
            return;
          }
          char v50 = sub_24D1494C8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v48 = v51;
          if (v50) {
            goto LABEL_58;
          }
          goto LABEL_57;
        }
      }
      else
      {
        sub_24D1276AC((uint64_t)&v66, &qword_26B189550);
      }
      swift_bridgeObjectRelease();
      uint64_t v48 = v51;
LABEL_57:
      id v49 = objc_msgSend(v48, sel_layer);
      objc_msgSend(v49, sel_setCompositingFilter_, v45);

LABEL_58:
      return;
    }
LABEL_62:
    double v60 = v5;
    double v62 = v6;
    swift_once();
    double v5 = v60;
    double v6 = v62;
    goto LABEL_40;
  }
LABEL_34:
  uint64_t v31 = sub_24D12A1A8();
  unsigned __int8 v32 = objc_msgSend(v31, sel_isHidden);

  if ((v32 & 1) == 0)
  {
    uint64_t v33 = sub_24D12A1A8();
    objc_msgSend(v33, sel_setHidden_, 1);
  }
  id v34 = objc_msgSend(v51, sel_layer);
  id v35 = objc_msgSend(v34, sel_compositingFilter);

  if (v35)
  {
    sub_24D149388();
    swift_unknownObjectRelease();
    sub_24D1276AC((uint64_t)&v66, &qword_26B189550);
    id v36 = objc_msgSend(v51, sel_layer);
    objc_msgSend(v36, sel_setCompositingFilter_, 0);
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
    sub_24D1276AC((uint64_t)&v66, &qword_26B189550);
  }
}

void sub_24D12ABB0()
{
  int64_t v1 = 0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  uint64_t v3 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v2 + 64;
  unint64_t v6 = v4 & *(void *)(v2 + 64);
  int64_t v7 = (unint64_t)(v3 + 63) >> 6;
  while (v6)
  {
    unint64_t v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v9 = v8 | (v1 << 6);
LABEL_5:
    if (*(unsigned char *)(*(void *)(v2 + 56) + 88 * v9 + 80) == 2)
    {
      uint64_t v13 = sub_24D12A36C();
      objc_msgSend(v13, sel_alpha);
      double v15 = v14;

      if (v15 != 0.0) {
        return;
      }
      uint64_t v16 = sub_24D12A36C();
      double v17 = 1.0;
      goto LABEL_29;
    }
  }
  int64_t v10 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
LABEL_34:
    __break(1u);
    return;
  }
  if (v10 >= v7) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v5 + 8 * v10);
  ++v1;
  if (v11) {
    goto LABEL_24;
  }
  int64_t v1 = v10 + 1;
  if (v10 + 1 >= v7) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v5 + 8 * v1);
  if (v11) {
    goto LABEL_24;
  }
  int64_t v1 = v10 + 2;
  if (v10 + 2 >= v7) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v5 + 8 * v1);
  if (v11) {
    goto LABEL_24;
  }
  int64_t v1 = v10 + 3;
  if (v10 + 3 >= v7) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v5 + 8 * v1);
  if (v11) {
    goto LABEL_24;
  }
  int64_t v1 = v10 + 4;
  if (v10 + 4 >= v7) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v5 + 8 * v1);
  if (v11)
  {
LABEL_24:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v1 << 6);
    goto LABEL_5;
  }
  int64_t v12 = v10 + 5;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v5 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v1 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_34;
        }
        if (v1 >= v7) {
          goto LABEL_27;
        }
        unint64_t v11 = *(void *)(v5 + 8 * v1);
        ++v12;
        if (v11) {
          goto LABEL_24;
        }
      }
    }
    int64_t v1 = v12;
    goto LABEL_24;
  }
LABEL_27:
  uint64_t v18 = sub_24D12A36C();
  objc_msgSend(v18, sel_alpha);
  double v20 = v19;

  if (v20 != 1.0) {
    return;
  }
  uint64_t v16 = sub_24D12A36C();
  double v17 = 0.0;
LABEL_29:
  uint64_t v21 = v16;
  objc_msgSend(v16, sel_setAlpha_, v17);
}

void sub_24D12ADB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D12A19C();
  uint64_t v3 = v2;
  uint64_t v4 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters;
  int v5 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);
  int v6 = v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride];
  v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = v5;
  if (v5 != v6) {
    sub_24D12D6C4(*(void *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect], *(void *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 8], *(void **)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 16], v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24]);
  }

  int64_t v7 = sub_24D12A1A8();
  unint64_t v8 = v7;
  int v9 = *(unsigned __int8 *)(v1 + v4);
  int v10 = v7[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride];
  v7[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = v9;
  if (v9 != v10) {
    sub_24D12D6C4(*(void *)&v7[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect], *(void *)&v7[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 8], *(void **)&v7[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 16], v7[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24]);
  }

  unint64_t v11 = sub_24D12A36C();
  int64_t v12 = v11;
  int v13 = *(unsigned __int8 *)(v1 + v4);
  int v14 = v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride];
  v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = v13;
  if (v13 != v14) {
    sub_24D12D6C4(*(void *)&v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect], *(void *)&v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 8], *(void **)&v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 16], v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24]);
  }

  double v15 = sub_24D12A19C();
  uint64_t v16 = v15;
  int v17 = *(unsigned __int8 *)(v1 + v4);
  int v18 = v15[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride];
  v15[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = v17;
  if (v17 != v18)
  {
    double v19 = *(double *)&v15[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius];
    double v20 = *(void **)&v15[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty];
    if (v19 <= 0.0) {
      int v17 = 1;
    }
    double v21 = 1.0;
    if (v17) {
      double v21 = 0.0;
    }
    objc_msgSend(v20, sel_setValue_, v21);
  }

  uint64_t v22 = sub_24D12A1A8();
  id v23 = v22;
  int v24 = *(unsigned __int8 *)(v1 + v4);
  int v25 = v22[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride];
  v22[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = v24;
  if (v24 != v25)
  {
    double v26 = *(double *)&v22[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius];
    id v27 = *(void **)&v22[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty];
    if (v26 <= 0.0) {
      int v24 = 1;
    }
    double v28 = 1.0;
    if (v24) {
      double v28 = 0.0;
    }
    objc_msgSend(v27, sel_setValue_, v28);
  }

  id v29 = sub_24D12A36C();
  int v30 = *(unsigned __int8 *)(v1 + v4);
  int v31 = v29[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride];
  v29[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = v30;
  if (v30 != v31)
  {
    double v32 = *(double *)&v29[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius];
    id v35 = v29;
    uint64_t v33 = *(void **)&v29[OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty];
    if (v32 <= 0.0) {
      int v30 = 1;
    }
    double v34 = 1.0;
    if (v30) {
      double v34 = 0.0;
    }
    objc_msgSend(v33, sel_setValue_, v34);
    id v29 = v35;
  }
}

uint64_t sub_24D12AFFC()
{
  return swift_bridgeObjectRelease();
}

id sub_24D12B06C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletGroupView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletGroupView()
{
  return self;
}

void sub_24D12B140(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = a1;
    if (*(void *)(a1 + 16) == *(void *)(a2 + 16))
    {
      int64_t v4 = 0;
      uint64_t v93 = a1 + 64;
      uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
      uint64_t v6 = -1;
      if (v5 < 64) {
        uint64_t v6 = ~(-1 << v5);
      }
      unint64_t v7 = v6 & *(void *)(a1 + 64);
      int64_t v94 = (unint64_t)(v5 + 63) >> 6;
      if (v7) {
        goto LABEL_11;
      }
LABEL_12:
      while (2)
      {
        int64_t v11 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
        }
        else
        {
          if (v11 >= v94) {
            return;
          }
          unint64_t v12 = *(void *)(v93 + 8 * v11);
          int64_t v13 = v4 + 1;
          if (v12) {
            goto LABEL_27;
          }
          int64_t v13 = v4 + 2;
          if (v4 + 2 >= v94) {
            return;
          }
          unint64_t v12 = *(void *)(v93 + 8 * v13);
          if (v12) {
            goto LABEL_27;
          }
          int64_t v13 = v4 + 3;
          if (v4 + 3 >= v94) {
            return;
          }
          unint64_t v12 = *(void *)(v93 + 8 * v13);
          if (v12) {
            goto LABEL_27;
          }
          int64_t v13 = v4 + 4;
          if (v4 + 4 >= v94) {
            return;
          }
          unint64_t v12 = *(void *)(v93 + 8 * v13);
          if (v12) {
            goto LABEL_27;
          }
          uint64_t v14 = v4 + 5;
          if (v4 + 5 >= v94) {
            return;
          }
          unint64_t v12 = *(void *)(v93 + 8 * v14);
          if (v12)
          {
            int64_t v13 = v4 + 5;
LABEL_27:
            uint64_t v97 = (v12 - 1) & v12;
            int64_t v98 = v13;
            for (unint64_t i = __clz(__rbit64(v12)) + (v13 << 6); ; unint64_t i = __clz(__rbit64(v7)) | (v4 << 6))
            {
              uint64_t v15 = *(void *)(*(void *)(v3 + 48) + 8 * i);
              uint64_t v16 = *(void *)(v3 + 56) + 88 * i;
              unint64_t v18 = *(void *)v16;
              uint64_t v17 = *(void *)(v16 + 8);
              uint64_t v19 = *(void *)(v16 + 16);
              uint64_t v99 = *(void *)(v16 + 24);
              uint64_t v100 = *(void *)(v16 + 40);
              uint64_t v20 = *(void *)(v16 + 56);
              uint64_t v101 = *(void *)(v16 + 32);
              uint64_t v102 = *(void *)(v16 + 48);
              uint64_t v22 = *(void *)(v16 + 64);
              uint64_t v21 = *(void *)(v16 + 72);
              int v23 = *(unsigned __int8 *)(v16 + 80);
              unint64_t v24 = sub_24D121B54(v15);
              if ((v25 & 1) == 0)
              {
LABEL_48:
                uint64_t v77 = v22;
                uint64_t v56 = v22;
                uint64_t v57 = v17;
                uint64_t v58 = v17;
                uint64_t v59 = v100;
                uint64_t v60 = v102;
                sub_24D123FFC((id)v18, v58, v19, v99, v101, v100, v102, v20, v77, v21, v23);
                char v85 = v23;
                uint64_t v78 = v56;
                uint64_t v82 = v21;
                id v61 = (void *)v18;
                uint64_t v62 = v57;
                uint64_t v63 = v19;
                uint64_t v64 = v99;
                uint64_t v65 = v101;
                goto LABEL_49;
              }
              uint64_t v26 = *(void *)(v2 + 56) + 88 * v24;
              double v28 = *(void **)v26;
              double v27 = *(double *)(v26 + 8);
              uint64_t v30 = *(void *)(v26 + 16);
              uint64_t v29 = *(void *)(v26 + 24);
              uint64_t v31 = *(void *)(v26 + 32);
              uint64_t v32 = *(void *)(v26 + 40);
              uint64_t v34 = *(void *)(v26 + 48);
              uint64_t v33 = *(void *)(v26 + 56);
              uint64_t v36 = *(void *)(v26 + 64);
              uint64_t v35 = *(void *)(v26 + 72);
              int v37 = *(unsigned __int8 *)(v26 + 80);
              if (!v37) {
                break;
              }
              if (v37 != 1)
              {
                if (v23 != 2) {
                  goto LABEL_48;
                }
                if ((v18 & 1) == ((v28 & 1) == 0)
                  || ((v18 >> 8) & 1) == (((unsigned __int16)v28 & 0x100) == 0))
                {
                  sub_24D123FFC((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 2);
                  return;
                }
                double v8 = v27;
                sub_24D123FFC((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 2);
                BOOL v9 = v8 == *(double *)&v17;
                goto LABEL_8;
              }
              if (v23 != 1) {
                goto LABEL_48;
              }
              if (v28)
              {
                if (!v18)
                {
                  uint64_t v66 = v21;
                  uint64_t v79 = v22;
                  uint64_t v83 = v21;
                  uint64_t v67 = v22;
                  uint64_t v68 = v17;
                  uint64_t v69 = v17;
                  uint64_t v70 = v99;
                  uint64_t v59 = v100;
                  uint64_t v71 = v101;
                  uint64_t v60 = v102;
                  sub_24D123FFC(0, v69, v19, v99, v101, v100, v102, v20, v79, v83, 1);
                  char v85 = 1;
                  uint64_t v78 = v67;
                  uint64_t v82 = v66;
                  id v61 = 0;
                  goto LABEL_55;
                }
                uint64_t v38 = v35;
                uint64_t v87 = v35;
                uint64_t v89 = v34;
                uint64_t v90 = *(void *)&v27;
                uint64_t v91 = v33;
                uint64_t v92 = v31;
                uint64_t v88 = v29;
                sub_24D114FEC(0, (unint64_t *)&qword_269858310);
                sub_24D123FFC((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 1);
                sub_24D123FFC(v28, v90, v30, v88, v92, v32, v89, v91, v36, v38, 1);
                sub_24D123FFC((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 1);
                char v86 = sub_24D149378();
                sub_24D12BF7C((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 1);
                sub_24D12BF7C(v28, v90, v30, v88, v92, v32, v89, v91, v36, v87, 1);
                sub_24D12BF7C((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 1);
                uint64_t v2 = a2;
                unint64_t v7 = v97;
                uint64_t v3 = a1;
                int64_t v4 = v98;
                if ((v86 & 1) == 0) {
                  return;
                }
                goto LABEL_10;
              }
              if (v18)
              {
                uint64_t v72 = v21;
                uint64_t v80 = v22;
                uint64_t v84 = v21;
                uint64_t v73 = (void *)v18;
                uint64_t v74 = v22;
                uint64_t v68 = v17;
                uint64_t v75 = v17;
                uint64_t v70 = v99;
                uint64_t v59 = v100;
                uint64_t v71 = v101;
                uint64_t v60 = v102;
                sub_24D123FFC(v73, v75, v19, v99, v101, v100, v102, v20, v80, v84, 1);
                char v85 = 1;
                uint64_t v78 = v74;
                uint64_t v82 = v72;
                id v61 = v73;
LABEL_55:
                uint64_t v62 = v68;
                uint64_t v63 = v19;
                uint64_t v64 = v70;
                uint64_t v65 = v71;
LABEL_49:
                sub_24D12BF7C(v61, v62, v63, v64, v65, v59, v60, v20, v78, v82, v85);
                return;
              }
              uint64_t v76 = v22;
              uint64_t v81 = v21;
              uint64_t v48 = v17;
              uint64_t v49 = v19;
              uint64_t v50 = v35;
              uint64_t v51 = *(void *)&v27;
              uint64_t v52 = v31;
              uint64_t v53 = v29;
              uint64_t v54 = v34;
              uint64_t v55 = v33;
              sub_24D123FFC(0, v48, v49, v99, v101, v100, v102, v20, v76, v81, 1);
              sub_24D123FFC(0, v51, v30, v53, v52, v32, v54, v55, v36, v50, 1);
              uint64_t v2 = a2;
              unint64_t v7 = v97;
              uint64_t v3 = a1;
              int64_t v4 = v98;
              if (!v97) {
                goto LABEL_12;
              }
LABEL_11:
              uint64_t v97 = (v7 - 1) & v7;
              int64_t v98 = v4;
            }
            if (v23) {
              goto LABEL_48;
            }
            if (*(float *)&v28 != *(float *)&v18) {
              goto LABEL_50;
            }
            v39.i64[0] = v33;
            v39.i64[1] = __PAIR64__(v35, HIDWORD(v36));
            v40.i64[0] = __PAIR64__(HIDWORD(v28), LODWORD(v27));
            v40.i64[1] = __PAIR64__(v30, HIDWORD(v27));
            v41.i64[0] = __PAIR64__(v32, HIDWORD(v31));
            v41.i64[1] = v34;
            v42.i64[0] = __PAIR64__(v29, HIDWORD(v30));
            v42.i64[1] = __PAIR64__(v31, HIDWORD(v29));
            v43.i64[0] = __PAIR64__(v99, HIDWORD(v19));
            v43.i64[1] = __PAIR64__(v101, HIDWORD(v99));
            v44.i64[0] = __PAIR64__(HIDWORD(v18), v17);
            v44.i64[1] = __PAIR64__(v19, HIDWORD(v17));
            v45.i64[0] = __PAIR64__(v100, HIDWORD(v101));
            v45.i64[1] = v102;
            v46.i64[0] = v20;
            v46.i64[1] = __PAIR64__(v21, HIDWORD(v22));
            if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v40, v44), (int16x8_t)vceqq_f32(v42, v43)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v41, v45), (int16x8_t)vceqq_f32(v39, v46))), 7uLL))) & 1) == 0)
            {
LABEL_50:
              sub_24D123FFC((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 0);
              return;
            }
            float v47 = *((float *)&v35 + 1);
            sub_24D123FFC((id)v18, v17, v19, v99, v101, v100, v102, v20, v22, v21, 0);
            BOOL v9 = v47 == *((float *)&v21 + 1);
LABEL_8:
            uint64_t v2 = a2;
            unint64_t v7 = v97;
            uint64_t v3 = a1;
            int64_t v4 = v98;
            if (!v9) {
              return;
            }
LABEL_10:
            if (!v7) {
              continue;
            }
            goto LABEL_11;
          }
          while (1)
          {
            int64_t v13 = v14 + 1;
            if (__OFADD__(v14, 1)) {
              break;
            }
            if (v13 >= v94) {
              return;
            }
            unint64_t v12 = *(void *)(v93 + 8 * v13);
            ++v14;
            if (v12) {
              goto LABEL_27;
            }
          }
        }
        break;
      }
      __break(1u);
    }
  }
}

unint64_t sub_24D12B8E4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24D1493A8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24D149508();
        swift_bridgeObjectRetain();
        sub_24D149288();
        uint64_t v9 = sub_24D149528();
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
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
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

unint64_t sub_24D12BABC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24D1493A8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24D149508();
        swift_bridgeObjectRetain();
        sub_24D149288();
        uint64_t v9 = sub_24D149528();
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
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          uint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            _OWORD *v15 = *v16;
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

unint64_t sub_24D12BC94(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24D1493A8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_24D1494F8();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t result = v15 + 88 * v3;
            uint64_t v16 = (const void *)(v15 + 88 * v6);
            if (88 * v3 < (uint64_t)(88 * v6)
              || (result < (unint64_t)v16 + 88 ? (v17 = v3 == v6) : (v17 = 0), int64_t v3 = v6, !v17))
            {
              uint64_t result = (unint64_t)memmove((void *)result, v16, 0x58uLL);
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
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

double sub_24D12BE48(uint64_t a1)
{
  *(void *)(a1 + 208) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void sub_24D12BE70(void *a1)
{
  id v2 = objc_msgSend(a1, sel_layer);
  id v3 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v3, sel_displayScale);
  double v5 = v4;

  objc_msgSend(v2, sel_setRasterizationScale_, v5);
  unint64_t v6 = sub_24D12A1A8();
  id v10 = objc_msgSend(v6, sel_layer);

  id v7 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v7, sel_displayScale);
  double v9 = v8;

  objc_msgSend(v10, sel_setRasterizationScale_, v9);
}

void sub_24D12BF7C(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11 == 1) {
}
  }

id sub_24D12BF90(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    return sub_24D123FFC(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
  return result;
}

uint64_t sub_24D12BFB0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 80);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), v4);
  return a1;
}

void sub_24D12C00C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    sub_24D12BF7C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

BOOL sub_24D12C02C(void *a1)
{
  return *a1 == 0;
}

uint64_t sub_24D12C03C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_24D12C0A0()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters;
  id v2 = objc_msgSend(self, sel_rootSettings);
  unsigned __int8 v3 = objc_msgSend(v2, sel_suppressDropletEffectFilters);

  v0[v1] = v3;
  char v4 = &v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth];
  *char v4 = 0;
  v4[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView] = 0;
  uint64_t v5 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  *(void *)&v0[v5] = sub_24D123914(MEMORY[0x263F8EE78]);

  sub_24D149448();
  __break(1u);
}

void sub_24D12C1A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a1 == 0xD00000000000001CLL && a2 == 0x800000024D14BCF0 || (sub_24D1494C8() & 1) != 0)
    {
      sub_24D12ADB4();
    }
    else if (a1 == 0xD000000000000021 && a2 == 0x800000024D14BC90 || (sub_24D1494C8() & 1) != 0)
    {
      sub_24D12A484();
    }
  }
}

uint64_t sub_24D12C2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24D12C308()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor;
  unsigned __int8 v3 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor];
  type metadata accessor for CGColor(0);
  sub_24D12E2BC();
  id v4 = v3;
  char v5 = sub_24D1491C8();

  if (v5) {
    return;
  }
  char v6 = v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24];
  id v7 = objc_msgSend(v1, sel_layer);
  double v8 = *(void **)&v1[v2];
  if (v6)
  {
    uint64_t v9 = qword_26B189740;
    id v10 = v8;
    if (v9 == -1) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  uint64_t v11 = qword_26B1890E8;
  id v12 = v8;
  if (v11 != -1) {
LABEL_9:
  }
    swift_once();
LABEL_6:
  id v13 = (id)sub_24D149258();
  objc_msgSend(v7, sel_setValue_forKeyPath_, v8, v13);
}

void sub_24D12C498(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke;
  double v3 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke];
  *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke] = a1;
  if (v3 != a1)
  {
    if ((a1 == 0.0) == (v3 != 0.0))
    {
      BOOL v4 = a1 == 0.0;
      id v5 = objc_msgSend(v1, sel_layer);
      objc_msgSend(v5, sel_setBorderPathIsBounds_, v4);
    }
    id v6 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v6, sel_setBorderWidth_, *(double *)&v1[v2]);
  }
}

void sub_24D12C588(double a1)
{
  uint64_t v3 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke;
  double v4 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke];
  *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke] = a1;
  if (v4 != a1)
  {
    if ((a1 == 0.0) == (v4 != 0.0))
    {
      id v5 = objc_msgSend(v1, sel_layer);
      id v6 = v5;
      if (a1 == 0.0)
      {
        objc_msgSend(v5, sel_setRimPathIsBounds_, 1);

        id v7 = objc_msgSend(v1, sel_layer);
        objc_msgSend(v7, sel_setRimOpacity_, 0.0);
      }
      else
      {
        objc_msgSend(v5, sel_setRimPathIsBounds_, 0);

        id v7 = objc_msgSend(v1, sel_layer);
        LODWORD(v8) = 1.0;
        objc_msgSend(v7, sel_setRimOpacity_, v8);
      }
    }
    id v9 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v9, sel_setRimWidth_, *(double *)&v1[v3]);
  }
}

char *sub_24D12C6DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, double a6, double a7, double a8, double a9)
{
  id v10 = v9;
  uint64_t ObjectType = swift_getObjectType();
  v10[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = 0;
  uint64_t v21 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty;
  id v22 = objc_allocWithZone(MEMORY[0x263F82E28]);
  uint64_t v23 = v10;
  *(void *)&v10[v21] = objc_msgSend(v22, sel_init);
  uint64_t v24 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor;
  id v25 = objc_msgSend(self, sel_blackColor);
  id v26 = objc_msgSend(v25, sel_CGColor);

  *(void *)&v23[v24] = v26;
  *(void *)&v23[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke] = 0;
  *(void *)&v23[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke] = 0;
  double v27 = &v23[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect];
  *(void *)double v27 = a1;
  *((void *)v27 + 1) = a2;
  *((void *)v27 + 2) = a3;
  v27[24] = a4 & 1;
  double v28 = *(void **)&v23[v24];
  *(void *)&v23[v24] = a5;
  id v29 = a5;

  v50.receiver = v23;
  v50.super_class = (Class)type metadata accessor for DropletEffectView();
  uint64_t v30 = (char *)objc_msgSendSuper2(&v50, sel_initWithFrame_, a6, a7, a8, a9);
  id v31 = objc_msgSend(v30, sel_layer);
  if (qword_26B1890D8 != -1) {
    swift_once();
  }
  objc_msgSend(v31, sel_setRimColor_, qword_26B189BA0);

  id v32 = objc_msgSend(v30, sel_layer);
  objc_msgSend(v32, sel_setBorderColor_, qword_26B189BA0);

  uint64_t v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v34 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_24D14B250;
  uint64_t v36 = *(void **)&v30[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty];
  *(void *)(v35 + 32) = v36;
  sub_24D1492D8();
  sub_24D114FEC(0, (unint64_t *)&unk_26B189790);
  id v37 = v36;
  uint64_t v38 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v33;
  *(void *)(v39 + 24) = ObjectType;
  uint64_t v48 = sub_24D12E384;
  uint64_t v49 = v39;
  uint64_t v44 = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  float32x4_t v46 = sub_24D142914;
  float v47 = &block_descriptor_1;
  float32x4_t v40 = _Block_copy(&v44);
  swift_retain();
  swift_release();
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v33;
  *(void *)(v41 + 24) = ObjectType;
  uint64_t v48 = sub_24D12E3A4;
  uint64_t v49 = v41;
  uint64_t v44 = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  float32x4_t v46 = sub_24D142914;
  float v47 = &block_descriptor_35;
  float32x4_t v42 = _Block_copy(&v44);
  swift_retain();
  swift_release();
  objc_msgSend(v34, sel__createTransformerWithInputAnimatableProperties_modelValueSetter_presentationValueSetter_, v38, v40, v42);
  _Block_release(v42);
  _Block_release(v40);

  sub_24D12D6C4(0, 0, 0, 0xFFu);
  swift_release();

  return v30;
}

void sub_24D12CB18(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (char *)MEMORY[0x25331EC50](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_layer);
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty], sel_value);
    id v5 = (void *)sub_24D149308();
    if (qword_26B189728 != -1) {
      swift_once();
    }
    id v6 = (void *)sub_24D149258();
    objc_msgSend(v4, sel_setValue_forKeyPath_, v5, v6);
  }
}

void sub_24D12CC1C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25331EC50](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty), sel_presentationValue);
    id v4 = (void *)sub_24D149308();
    if (qword_26B189728 != -1) {
      swift_once();
    }
    id v5 = (void *)sub_24D149258();
    objc_msgSend(v3, sel__setPresentationValue_forKey_, v4, v5);
  }
}

void sub_24D12CD2C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor);
}

id sub_24D12CD6C()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletEffectView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D12CF64()
{
  uint64_t v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for DropletEffectView();
  objc_msgSendSuper2(&v16, sel_layoutSubviews);
  id v2 = objc_msgSend(v0, sel_subviews);
  sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
  unint64_t v3 = sub_24D1492C8();

  if (v3 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_24D149468())
  {
    uint64_t v5 = 4;
    uint64_t v6 = 0;
    if ((v3 & 0xC000000000000001) != 0)
    {
LABEL_4:
      id v7 = (id)MEMORY[0x25331E4B0](v6, v3);
      goto LABEL_6;
    }
    while (1)
    {
      id v7 = *(id *)(v3 + 8 * v5);
LABEL_6:
      double v8 = v7;
      uint64_t v9 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      type metadata accessor for DropletBoundaryView();
      uint64_t v10 = swift_dynamicCastClass();
      if (v10)
      {
        uint64_t v11 = v10;
        objc_msgSend(v1, sel_bounds);
        CGRect v20 = *(CGRect *)(v11 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds);
        *(CGRect *)(v11 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds) = v19;
        if (!CGRectEqualToRect(v19, v20))
        {
          sub_24D12E158(v11 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v13);
          sub_24D12E158((uint64_t)v13, (uint64_t)v14);
          if (!sub_24D12C02C(v14))
          {
            v17[10] = v14[10];
            v17[11] = v14[11];
            v17[12] = v14[12];
            uint64_t v18 = v15;
            v17[6] = v14[6];
            v17[7] = v14[7];
            v17[8] = v14[8];
            v17[9] = v14[9];
            v17[2] = v14[2];
            v17[3] = v14[3];
            v17[4] = v14[4];
            v17[5] = v14[5];
            v17[0] = v14[0];
            v17[1] = v14[1];
            sub_24D148A58((double *)v17);
          }
        }
      }

      if (v9 == v4) {
        return swift_bridgeObjectRelease_n();
      }
      uint64_t v6 = ++v5 - 4;
      if ((v3 & 0xC000000000000001) != 0) {
        goto LABEL_4;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_24D12D1C8()
{
  id v0 = objc_msgSend(self, sel_whiteColor);
  id v1 = objc_msgSend(v0, sel_CGColor);

  qword_26B189BA0 = (uint64_t)v1;
}

uint64_t sub_24D12D22C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24D14B4B0;
  if (qword_26B189728 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_26B189C18;
  *(void *)(v0 + 32) = qword_26B189C10;
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = qword_26B1890F0;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_26B189BC8;
  *(void *)(v0 + 48) = qword_26B189BC0;
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = qword_26B1890E8;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)algn_26B189BB8;
  *(void *)(v0 + 64) = qword_26B189BB0;
  *(void *)(v0 + 72) = v5;
  uint64_t v6 = qword_26B189758;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)algn_26B189C58;
  *(void *)(v0 + 80) = qword_26B189C50;
  *(void *)(v0 + 88) = v7;
  uint64_t v8 = qword_26B189750;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = *(void *)algn_26B189C48;
  *(void *)(v0 + 96) = qword_26B189C40;
  *(void *)(v0 + 104) = v9;
  uint64_t v10 = qword_26B189738;
  swift_bridgeObjectRetain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = *(void *)algn_26B189C28;
  *(void *)(v0 + 112) = qword_26B189C20;
  *(void *)(v0 + 120) = v11;
  uint64_t v12 = qword_26B189740;
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)algn_26B189C38;
  *(void *)(v0 + 128) = qword_26B189C30;
  *(void *)(v0 + 136) = v13;
  *(void *)(v0 + 144) = 0x68746469576D6972;
  *(void *)(v0 + 152) = 0xE800000000000000;
  *(void *)(v0 + 160) = 0x6957726564726F62;
  *(void *)(v0 + 168) = 0xEB00000000687464;
  *(void *)(v0 + 176) = 0x6D695274666F73;
  *(void *)(v0 + 184) = 0xE700000000000000;
  qword_26B189BA8 = v0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D12D4B0(uint64_t a1)
{
  return sub_24D12D618(a1, MEMORY[0x263F15AD0], MEMORY[0x263F15BF8], &qword_26B189C50, algn_26B189C58);
}

uint64_t sub_24D12D4D0(uint64_t a1)
{
  return sub_24D12D618(a1, MEMORY[0x263F15AD0], MEMORY[0x263F15CA8], &qword_26B189C40, algn_26B189C48);
}

uint64_t sub_24D12D4F0(uint64_t a1)
{
  return sub_24D12D618(a1, MEMORY[0x263F15AD0], MEMORY[0x263F15C40], &qword_26B189C20, algn_26B189C28);
}

uint64_t sub_24D12D510(uint64_t a1)
{
  return sub_24D12D618(a1, MEMORY[0x263F15AD0], MEMORY[0x263F15C20], &qword_26B189C30, algn_26B189C38);
}

uint64_t sub_24D12D530()
{
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  sub_24D149268();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24D149298();
  qword_26B189C10 = 0x2E737265746C6966;
  *(void *)algn_26B189C18 = 0xE800000000000000;
  return result;
}

uint64_t sub_24D12D5D8(uint64_t a1)
{
  return sub_24D12D618(a1, MEMORY[0x263F15AD8], MEMORY[0x263F15BF8], &qword_26B189BC0, algn_26B189BC8);
}

uint64_t sub_24D12D5F8(uint64_t a1)
{
  return sub_24D12D618(a1, MEMORY[0x263F15AD8], MEMORY[0x263F15C20], &qword_26B189BB0, algn_26B189BB8);
}

uint64_t sub_24D12D618(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  sub_24D149268();
  sub_24D149298();
  swift_bridgeObjectRelease();
  sub_24D149298();
  sub_24D149268();
  sub_24D149298();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = 0x2E737265746C6966;
  *a5 = 0xE800000000000000;
  return result;
}

id sub_24D12D6C4(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 a4)
{
  uint64_t v8 = v4;
  double v9 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect];
  double v10 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 8];
  double v11 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 16];
  if (a4 == 255)
  {
    if ((v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24] & 1) == 0)
    {
LABEL_38:
      sub_24D149268();
      id v43 = objc_allocWithZone(MEMORY[0x263F157C8]);
      uint64_t v44 = (void *)sub_24D149258();
      swift_bridgeObjectRelease();
      id v35 = objc_msgSend(v43, sel_initWithType_, v44);

      uint64_t v45 = (void *)sub_24D1491B8();
      objc_msgSend(v35, sel_setValue_forKeyPath_, v45, *MEMORY[0x263F15BF8]);

      objc_msgSend(v35, sel_setValue_forKeyPath_, *(void *)&v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor], *MEMORY[0x263F15C20]);
      objc_msgSend(v35, sel_setEnabled_, (v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] & 1) == 0);
      id v39 = objc_msgSend(v8, sel_layer);
      id v46 = objc_msgSend(v8, sel_layer);
      id v41 = objc_msgSend(v46, sel_filters);

      if (!v41)
      {
        uint64_t v42 = MEMORY[0x263F8EE78];
        goto LABEL_41;
      }
      goto LABEL_39;
    }
LABEL_34:
    sub_24D149268();
    id v33 = objc_allocWithZone(MEMORY[0x263F157C8]);
    uint64_t v34 = (void *)sub_24D149258();
    swift_bridgeObjectRelease();
    id v35 = objc_msgSend(v33, sel_initWithType_, v34);

    uint64_t v36 = (void *)sub_24D1491B8();
    objc_msgSend(v35, sel_setValue_forKeyPath_, v36, *MEMORY[0x263F15BF8]);

    id v37 = (void *)sub_24D1491B8();
    objc_msgSend(v35, sel_setValue_forKeyPath_, v37, *MEMORY[0x263F15CA8]);

    uint64_t v38 = (void *)sub_24D1491B8();
    objc_msgSend(v35, sel_setValue_forKeyPath_, v38, *MEMORY[0x263F15C40]);

    objc_msgSend(v35, sel_setValue_forKeyPath_, *(void *)&v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor], *MEMORY[0x263F15C20]);
    objc_msgSend(v35, sel_setEnabled_, (v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] & 1) == 0);
    id v39 = objc_msgSend(v8, sel_layer);
    id v40 = objc_msgSend(v8, sel_layer);
    id v41 = objc_msgSend(v40, sel_filters);

    if (!v41)
    {
      uint64_t v42 = MEMORY[0x263F8EE78];
LABEL_41:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24D14B240;
      *(void *)(inited + 56) = sub_24D114FEC(0, (unint64_t *)&qword_26B189510);
      *(void *)(inited + 32) = v35;
      *(void *)&long long v53 = v42;
      id v48 = v35;
      sub_24D13E6E0(inited);
      uint64_t v49 = (void *)sub_24D1492B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v39, sel_setFilters_, v49);

      double v28 = *(void **)&v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty];
      goto LABEL_42;
    }
LABEL_39:
    uint64_t v42 = sub_24D1492C8();

    goto LABEL_41;
  }
  if ((a4 & 1) == 0)
  {
    if ((v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24] & 1) == 0)
    {
      double v5 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect];
      if (*(double *)&a1 == v9) {
        goto LABEL_25;
      }
      id v25 = objc_msgSend(v4, sel_layer, *(double *)&a1);
      id v26 = (void *)sub_24D1491B8();
      if (qword_26B1890F0 == -1) {
        goto LABEL_24;
      }
LABEL_52:
      swift_once();
LABEL_24:
      double v27 = (void *)sub_24D149258();
      objc_msgSend(v25, sel_setValue_forKeyPath_, v26, v27);

      goto LABEL_25;
    }
    double v12 = COERCE_DOUBLE(objc_msgSend(v4, sel_layer));
    id v13 = objc_msgSend(*(id *)&v12, sel_filters);
    if (!v13)
    {
      objc_msgSend(*(id *)&v12, sel_setFilters_, 0);

      long long v53 = 0u;
      long long v54 = 0u;
      goto LABEL_33;
    }
    uint64_t v14 = v13;
    uint64_t v15 = (void *)sub_24D1492C8();

    if (v15[2])
    {
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v16 = v15[2];
        if (v16)
        {
LABEL_10:
          uint64_t v17 = v16 - 1;
          sub_24D11C120(&v15[4 * v16], v52);
          v15[2] = v17;
          sub_24D11C120(v52, &v53);
          uint64_t v18 = (void *)sub_24D1492B8();
          swift_bridgeObjectRelease();
          objc_msgSend(*(id *)&v12, sel_setFilters_, v18);

LABEL_33:
          sub_24D1238B4((uint64_t)&v53);
          goto LABEL_34;
        }
        goto LABEL_47;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v15 = sub_24D14874C((uint64_t)v15);
    uint64_t v16 = v15[2];
    if (v16) {
      goto LABEL_10;
    }
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if ((v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24] & 1) == 0)
  {
    double v12 = COERCE_DOUBLE(objc_msgSend(v4, sel_layer));
    id v29 = objc_msgSend(*(id *)&v12, sel_filters);
    if (!v29)
    {
      objc_msgSend(*(id *)&v12, sel_setFilters_, 0);

      long long v53 = 0u;
      long long v54 = 0u;
      goto LABEL_37;
    }
    uint64_t v14 = v29;
    double v11 = MEMORY[0x263F8EE58];
    uint64_t v15 = (void *)sub_24D1492C8();

    if (v15[2])
    {
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v30 = v15[2];
        if (!v30)
        {
LABEL_50:
          __break(1u);
LABEL_51:
          swift_once();
          goto LABEL_14;
        }
        goto LABEL_31;
      }
LABEL_49:
      uint64_t v15 = sub_24D14874C((uint64_t)v15);
      uint64_t v30 = v15[2];
      if (!v30) {
        goto LABEL_50;
      }
LABEL_31:
      uint64_t v31 = v30 - 1;
      sub_24D11C120(&v15[4 * v30], v52);
      v15[2] = v31;
      sub_24D11C120(v52, &v53);
      id v32 = (void *)sub_24D1492B8();
      swift_bridgeObjectRelease();
      objc_msgSend(*(id *)&v12, sel_setFilters_, v32);

LABEL_37:
      sub_24D1238B4((uint64_t)&v53);
      goto LABEL_38;
    }
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  double v12 = *(double *)&a3;
  double v7 = *(double *)&a2;
  double v19 = *(double *)&a1;
  double v5 = v9;
  double v6 = v10;
  if (*(double *)&a1 == v9) {
    goto LABEL_15;
  }
  uint64_t v15 = objc_msgSend(v8, sel_layer, *(double *)&a1);
  uint64_t v14 = (void *)sub_24D1491B8();
  if (qword_26B189758 != -1) {
    goto LABEL_51;
  }
LABEL_14:
  CGRect v20 = (void *)sub_24D149258();
  objc_msgSend(v15, sel_setValue_forKeyPath_, v14, v20);

LABEL_15:
  double v21 = v12;
  if (v7 != v6)
  {
    id v22 = objc_msgSend(v8, sel_layer, v19);
    uint64_t v23 = (void *)sub_24D1491B8();
    if (qword_26B189750 != -1) {
      swift_once();
    }
    uint64_t v24 = (void *)sub_24D149258();
    objc_msgSend(v22, sel_setValue_forKeyPath_, v23, v24);
  }
  if (v21 != v11)
  {
    id v25 = objc_msgSend(v8, sel_layer);
    id v26 = (void *)sub_24D1491B8();
    if (qword_26B189738 == -1) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_25:
  double v28 = *(void **)&v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty];
  if (v5 <= 0.0) {
    goto LABEL_43;
  }
LABEL_42:
  double v50 = 1.0;
  if (v8[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] == 1) {
LABEL_43:
  }
    double v50 = 0.0;
  return objc_msgSend(v28, sel_setValue_, v50);
}

uint64_t type metadata accessor for DropletEffectView()
{
  return self;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DropletEffectView.Effect(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DropletEffectView.Effect(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_24D12E0CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_24D12E0D4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DropletEffectView.Effect()
{
  return &type metadata for DropletEffectView.Effect;
}

BOOL sub_24D12E0F0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return (*(unsigned char *)(a2 + 24) & 1) == 0 && v2 == v3;
  }
  if ((*(unsigned char *)(a2 + 24) & 1) == 0) {
    return 0;
  }
  BOOL v4 = v2 == v3;
  if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    BOOL v4 = 0;
  }
  return *(double *)(a1 + 16) == *(double *)(a2 + 16) && v4;
}

uint64_t sub_24D12E158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B189100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24D12E1C0()
{
  v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = 0;
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E28]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor;
  id v3 = objc_msgSend(self, sel_blackColor);
  id v4 = objc_msgSend(v3, sel_CGColor);

  *(void *)&v0[v2] = v4;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke] = 0;

  sub_24D149448();
  __break(1u);
}

unint64_t sub_24D12E2BC()
{
  unint64_t result = qword_26B189248;
  if (!qword_26B189248)
  {
    type metadata accessor for CGColor(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B189248);
  }
  return result;
}

uint64_t sub_24D12E314()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D12E34C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24D12E384()
{
  sub_24D12CB18(*(void *)(v0 + 16));
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

void sub_24D12E3A4()
{
  sub_24D12CC1C(*(void *)(v0 + 16));
}

BOOL sub_24D12E3B8(float *a1, float *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7]
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && a1[14] == a2[14]
      && a1[15] == a2[15]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19];
}

uint64_t sub_24D12E4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_24D12E500(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D12E520(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

ValueMetadata *type metadata accessor for KeylineWidth()
{
  return &type metadata for KeylineWidth;
}

void sub_24D12E5A0()
{
  xmmword_26B189C00 = 0uLL;
}

double sub_24D12E5B0@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result = (double)*a1 * 0.5;
  *a2 = result;
  a2[1] = result;
  return result;
}

double sub_24D12E5C8@<D0>(float *a1@<X0>, double *a2@<X8>)
{
  double result = *a1 * 0.5;
  *a2 = result;
  a2[1] = result;
  return result;
}

BOOL sub_24D12E5E0(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_24D12E60C()
{
  return MEMORY[0x263F8D640];
}

uint64_t sub_24D12E618()
{
  return MEMORY[0x263F8D748];
}

double DRPDropletContextSolidColorKeylineStyle.innerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.innerWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletContextSolidColorKeylineStyle.outerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.outerWidth.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletContextSolidColorKeylineStyle.keylineOutsets.getter()
{
  return sub_24D131D6C(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.keylineOutsets.setter(double a1, double a2, double a3, double a4)
{
  return sub_24D131E34(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets, a1, a2, a3, a4);
}

double DRPDropletContextSolidColorKeylineStyle.keylineFadeLengths.getter()
{
  return sub_24D131D6C(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.keylineFadeLengths.setter(double a1, double a2, double a3, double a4)
{
  return sub_24D131E34(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths, a1, a2, a3, a4);
}

double DRPDropletContextSolidColorKeylineStyle.normalizedStartLocation.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.normalizedStartLocation.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

double DRPDropletContextSolidColorKeylineStyle.normalizedStopLocation.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.normalizedStopLocation.setter(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

id DRPDropletContextSolidColorKeylineStyle.color.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void DRPDropletContextSolidColorKeylineStyle.color.setter(void *a1)
{
  char v3 = (void **)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color);
  swift_beginAccess();
  id v4 = *v3;
  *char v3 = a1;
}

id DRPDropletContextSolidColorKeylineStyle.init(width:boundaryFadeLength:color:)(void *a1, double a2, double a3)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithWidth_boundaryFadeLength_color_, a1, a2, a3);

  return v4;
}

{
  void *v3;
  id v5;

  double v5 = objc_msgSend(v3, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_color_, a1, 0.0, a2, -(a2 + a3), -(a2 + a3), -(a2 + a3), -(a2 + a3), *(void *)&a3, *(void *)&a3, *(void *)&a3, *(void *)&a3);

  return v5;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:color:)(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  id v19 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_color_, a1, a2, a3, a4, a5, a6, a7, *(void *)&a8, *(void *)&a9, a17, a18);

  return v19;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:color:)(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18)
{
  id v20 = objc_msgSend(v18, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, a1, *(void *)&a15, *(void *)&a16, a17, a18, 0, 0x3FF0000000000000);

  return v20;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:color:)(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, long long a18, uint64_t a19)
{
  id v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, a1, a2, a3, a4, a5, a6, a7, *(void *)&a8, *(void *)&a9, a17, a18, a19);

  return v20;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:color:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth) = a2;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth) = a3;
  double v21 = (double *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets);
  *double v21 = a4;
  v21[1] = a5;
  v21[2] = a6;
  v21[3] = a7;
  uint64_t v22 = v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths;
  *(double *)uint64_t v22 = a8;
  *(double *)(v22 + 8) = a9;
  *(void *)(v22 + 16) = a17;
  *(void *)(v22 + 24) = a18;
  *(void *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation) = a19;
  *(void *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation) = a20;
  *(void *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color) = a1;
  v24.super_class = (Class)DRPDropletContextSolidColorKeylineStyle;
  return objc_msgSendSuper2(&v24, sel_init);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24D12384C(a1, (uint64_t)v44);
  if (!v45)
  {
    sub_24D1238B4((uint64_t)v44);
    goto LABEL_18;
  }
  type metadata accessor for DRPDropletContextSolidColorKeylineStyle(v2);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    char v41 = 0;
    return v41 & 1;
  }
  objc_msgSend(v1, sel_innerWidth);
  double v4 = v3;
  objc_msgSend(v43, sel_innerWidth);
  if (v4 != v5) {
    goto LABEL_17;
  }
  objc_msgSend(v1, sel_outerWidth);
  double v7 = v6;
  objc_msgSend(v43, sel_outerWidth);
  if (v7 != v8) {
    goto LABEL_17;
  }
  objc_msgSend(v1, sel_keylineOutsets);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v43, sel_keylineOutsets);
  if (v10 != v20) {
    goto LABEL_17;
  }
  if (v12 != v17) {
    goto LABEL_17;
  }
  if (v14 != v18) {
    goto LABEL_17;
  }
  if (v16 != v19) {
    goto LABEL_17;
  }
  objc_msgSend(v1, sel_keylineFadeLengths);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  objc_msgSend(v43, sel_keylineFadeLengths);
  if (v22 != v32
    || v24 != v29
    || v26 != v30
    || v28 != v31
    || (objc_msgSend(v1, sel_normalizedStartLocation),
        double v34 = v33,
        objc_msgSend(v43, sel_normalizedStartLocation),
        v34 != v35)
    || (objc_msgSend(v1, sel_normalizedStopLocation),
        double v37 = v36,
        objc_msgSend(v43, sel_normalizedStopLocation),
        v37 != v38))
  {
LABEL_17:

    goto LABEL_18;
  }
  sub_24D114FEC(0, (unint64_t *)&unk_269858390);
  id v39 = objc_msgSend(v1, sel_color);
  id v40 = objc_msgSend(v43, sel_color);
  char v41 = sub_24D149378();

  return v41 & 1;
}

uint64_t type metadata accessor for DRPDropletContextSolidColorKeylineStyle(uint64_t a1)
{
  return sub_24D114FEC(a1, (unint64_t *)&unk_269858468);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.copy()@<X0>(void *a1@<X8>)
{
  objc_msgSend(v1, sel_innerWidth);
  double v30 = v3;
  objc_msgSend(v1, sel_outerWidth);
  double v29 = v4;
  objc_msgSend(v1, sel_keylineOutsets);
  double v27 = v6;
  double v28 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(v1, sel_keylineFadeLengths);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  objc_msgSend(v1, sel_normalizedStartLocation);
  uint64_t v20 = v19;
  objc_msgSend(v1, sel_normalizedStopLocation);
  uint64_t v22 = v21;
  id v23 = objc_msgSend(v1, sel_color);
  id v24 = objc_msgSend(objc_allocWithZone((Class)DRPDropletContextSolidColorKeylineStyle), sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, v23, v30, v29, v28, v27, v8, v10, v12, v14, v16, v18, v20, v22);

  uint64_t result = type metadata accessor for DRPDropletContextSolidColorKeylineStyle(v25);
  a1[3] = result;
  *a1 = v24;
  return result;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.description.getter()
{
  return sub_24D1335A0((void (*)(void))sub_24D12F550);
}

uint64_t sub_24D12F550()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24D14B5E0;
  strcpy((char *)v6, "innerWidth: ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  objc_msgSend(v0, sel_innerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v2 = v6[1];
  *(void *)(v1 + 32) = v6[0];
  *(void *)(v1 + 40) = v2;
  strcpy((char *)v6, "outerWidth: ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  objc_msgSend(v0, sel_outerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v3 = v6[1];
  *(void *)(v1 + 48) = v6[0];
  *(void *)(v1 + 56) = v3;
  sub_24D1493B8();
  sub_24D149298();
  objc_msgSend(v0, sel_keylineOutsets);
  type metadata accessor for UIEdgeInsets(0);
  sub_24D149438();
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0xE000000000000000;
  sub_24D1493B8();
  sub_24D149298();
  objc_msgSend(v0, sel_keylineFadeLengths);
  sub_24D149438();
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 88) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStartLocation);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = 0xD000000000000019;
  *(void *)(v1 + 104) = 0x800000024D14E940;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStopLocation);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = 0xD000000000000018;
  *(void *)(v1 + 120) = 0x800000024D14E960;
  id v4 = objc_msgSend(v0, sel_color);
  sub_24D14907C(v4);

  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 128) = strcpy((char *)v6, "color: ");
  *(void *)(v1 + 136) = 0xE700000000000000;
  return v1;
}

unint64_t sub_24D12F87C()
{
  unint64_t result = qword_2698583A0;
  if (!qword_2698583A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2698581A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698583A0);
  }
  return result;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.debugDescription.getter()
{
  return sub_24D1335A0((void (*)(void))sub_24D12F550);
}

void DRPDropletContextSolidColorKeylineStyle.init()()
{
}

id DRPDropletContextAdaptiveKeylineStyle.width.getter()
{
  return objc_msgSend(v0, sel_outerWidth);
}

id DRPDropletContextAdaptiveKeylineStyle.width.setter()
{
  return objc_msgSend(v0, sel_setOuterWidth_);
}

double DRPDropletContextAdaptiveKeylineStyle.innerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.innerWidth.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextAdaptiveKeylineStyle.outerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.outerWidth.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextAdaptiveKeylineStyle.keylineOutsets.getter()
{
  return sub_24D131D6C(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets);
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.keylineOutsets.setter(double a1, double a2, double a3, double a4)
{
  return sub_24D131E34(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets, a1, a2, a3, a4);
}

double DRPDropletContextAdaptiveKeylineStyle.keylineFadeLengths.getter()
{
  return sub_24D131D6C(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths);
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.keylineFadeLengths.setter(double a1, double a2, double a3, double a4)
{
  return sub_24D131E34(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths, a1, a2, a3, a4);
}

double DRPDropletContextAdaptiveKeylineStyle.normalizedStartLocation.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.normalizedStartLocation.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextAdaptiveKeylineStyle.normalizedStopLocation.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.normalizedStopLocation.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

__n128 DRPDropletContextAdaptiveKeylineStyle.adaptiveColorMatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  __n128 result = *(__n128 *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 DRPDropletContextAdaptiveKeylineStyle.adaptiveColorMatrix.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 48) = v4;
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)a1;
  *(__n128 *)(v3 + 16) = result;
  return result;
}

double sub_24D1300A8@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  objc_msgSend(*a1, sel_adaptiveColorMatrix);
  double result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  return result;
}

id sub_24D1300FC(_OWORD *a1, void **a2)
{
  uint64_t v2 = *a2;
  long long v3 = a1[1];
  v6[0] = *a1;
  v6[1] = v3;
  long long v4 = a1[3];
  void v6[2] = a1[2];
  v6[3] = v4;
  v6[4] = a1[4];
  return objc_msgSend(v2, sel_setAdaptiveColorMatrix_, v6);
}

id DRPDropletContextAdaptiveKeylineStyle.init(width:boundaryFadeLength:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  long long v8 = a1[3];
  v10[2] = a1[2];
  _OWORD v10[3] = v8;
  v10[4] = a1[4];
  return objc_msgSend(v6, sel_initWithWidth_boundaryFadeLength_adaptiveColorMatrix_, v10, a2, a3);
}

{
  void *v3;
  long long v4;
  long long v5;
  _OWORD v7[5];

  long long v4 = a1[1];
  v7[0] = *a1;
  v7[1] = v4;
  long long v5 = a1[3];
  v7[2] = a1[2];
  v7[3] = v5;
  v7[4] = a1[4];
  return objc_msgSend(v3, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_adaptiveColorMatrix_, v7, 0.0, a2, -(a2 + a3), -(a2 + a3), -(a2 + a3), -(a2 + a3), *(void *)&a3, *(void *)&a3, *(void *)&a3, *(void *)&a3);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  long long v26 = a1[1];
  v31[0] = *a1;
  v31[1] = v26;
  long long v27 = a1[3];
  v31[2] = a1[2];
  void v31[3] = v27;
  v31[4] = a1[4];
  return objc_msgSend(v25, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_adaptiveColorMatrix_, v31, a2, a3, a4, a5, a6, a7, *(void *)&a8, *(void *)&a9, a17, a18);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:adaptiveColorMatrix:)(_OWORD *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18)
{
  long long v19 = a1[1];
  v22[0] = *a1;
  v22[1] = v19;
  long long v20 = a1[3];
  v22[2] = a1[2];
  v22[3] = v20;
  v22[4] = a1[4];
  return objc_msgSend(v18, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v22, *(void *)&a15, *(void *)&a16, a17, a18, 0, 0x3FF0000000000000);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, long long a18, uint64_t a19)
{
  id v26 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  long long v27 = a1[1];
  v32[0] = *a1;
  v32[1] = v27;
  long long v28 = a1[3];
  v32[2] = a1[2];
  v32[3] = v28;
  v32[4] = a1[4];
  return objc_msgSend(v26, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v32, a2, a3, a4, a5, a6, a7, *(void *)&a8, *(void *)&a9, a17, a18, a19);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth) = a2;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth) = a3;
  uint64_t v21 = (double *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets);
  *uint64_t v21 = a4;
  v21[1] = a5;
  v21[2] = a6;
  v21[3] = a7;
  uint64_t v22 = v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths;
  *(double *)uint64_t v22 = a8;
  *(double *)(v22 + 8) = a9;
  *(void *)(v22 + 16) = a17;
  *(void *)(v22 + 24) = a18;
  *(void *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation) = a19;
  *(void *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation) = a20;
  id v23 = (_OWORD *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix);
  long long v24 = a1[3];
  v23[2] = a1[2];
  v23[3] = v24;
  v23[4] = a1[4];
  long long v25 = a1[1];
  *id v23 = *a1;
  v23[1] = v25;
  v27.super_class = (Class)DRPDropletContextAdaptiveKeylineStyle;
  return objc_msgSendSuper2(&v27, sel_init);
}

BOOL DRPDropletContextAdaptiveKeylineStyle.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24D12384C(a1, (uint64_t)&v43);
  if (!v45)
  {
    sub_24D1238B4((uint64_t)&v43);
    return 0;
  }
  type metadata accessor for DRPDropletContextAdaptiveKeylineStyle(v2);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  long long v3 = (void *)v42;
  objc_msgSend(v1, sel_innerWidth);
  double v5 = v4;
  objc_msgSend((id)v42, sel_innerWidth);
  if (v5 != v6) {
    goto LABEL_17;
  }
  objc_msgSend(v1, sel_outerWidth);
  double v8 = v7;
  objc_msgSend((id)v42, sel_outerWidth);
  if (v8 != v9) {
    goto LABEL_17;
  }
  objc_msgSend(v1, sel_keylineOutsets);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  objc_msgSend((id)v42, sel_keylineOutsets);
  if (v11 != v21) {
    goto LABEL_17;
  }
  if (v13 != v18) {
    goto LABEL_17;
  }
  if (v15 != v19) {
    goto LABEL_17;
  }
  if (v17 != v20) {
    goto LABEL_17;
  }
  objc_msgSend(v1, sel_keylineFadeLengths);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  objc_msgSend((id)v42, sel_keylineFadeLengths);
  if (v23 != v33
    || v25 != v30
    || v27 != v31
    || v29 != v32
    || (objc_msgSend(v1, sel_normalizedStartLocation),
        double v35 = v34,
        objc_msgSend((id)v42, sel_normalizedStartLocation),
        v35 != v36)
    || (objc_msgSend(v1, sel_normalizedStopLocation),
        double v38 = v37,
        objc_msgSend((id)v42, sel_normalizedStopLocation),
        v38 != v39))
  {
LABEL_17:

    return 0;
  }
  objc_msgSend(v1, sel_adaptiveColorMatrix);
  objc_msgSend((id)v42, sel_adaptiveColorMatrix, v43, v44, v45, v46, v47, v48);

  return sub_24D12E3B8((float *)&v42, (float *)&v43);
}

uint64_t type metadata accessor for DRPDropletContextAdaptiveKeylineStyle(uint64_t a1)
{
  return sub_24D114FEC(a1, &qword_26B1894F8);
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.copy()@<X0>(void *a1@<X8>)
{
  objc_msgSend(v1, sel_innerWidth);
  double v34 = v3;
  objc_msgSend(v1, sel_outerWidth);
  double v33 = v4;
  objc_msgSend(v1, sel_keylineOutsets);
  double v31 = v6;
  double v32 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(v1, sel_keylineFadeLengths);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  objc_msgSend(v1, sel_normalizedStartLocation);
  uint64_t v20 = v19;
  objc_msgSend(v1, sel_normalizedStopLocation);
  uint64_t v22 = v21;
  objc_msgSend(v1, sel_adaptiveColorMatrix);
  long long v29 = v36;
  long long v30 = v35;
  long long v27 = v38;
  long long v28 = v37;
  long long v26 = v39;
  id v23 = objc_allocWithZone((Class)DRPDropletContextAdaptiveKeylineStyle);
  long long v35 = v30;
  long long v36 = v29;
  long long v37 = v28;
  long long v38 = v27;
  long long v39 = v26;
  id v24 = objc_msgSend(v23, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, &v35, v34, v33, v32, v31, v8, v10, v12, v14, v16, v18, v20, v22);
  uint64_t result = type metadata accessor for DRPDropletContextAdaptiveKeylineStyle((uint64_t)v24);
  a1[3] = result;
  *a1 = v24;
  return result;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.description.getter()
{
  return sub_24D1335A0((void (*)(void))sub_24D130A84);
}

uint64_t sub_24D130A84()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24D14B5E0;
  strcpy((char *)&v8, "innerWidth: ");
  BYTE13(v8) = 0;
  HIWORD(v8) = -5120;
  objc_msgSend(v0, sel_innerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v2 = *((void *)&v8 + 1);
  *(void *)(v1 + 32) = v8;
  *(void *)(v1 + 40) = v2;
  strcpy((char *)&v8, "outerWidth: ");
  BYTE13(v8) = 0;
  HIWORD(v8) = -5120;
  objc_msgSend(v0, sel_outerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v3 = *((void *)&v8 + 1);
  *(void *)(v1 + 48) = v8;
  *(void *)(v1 + 56) = v3;
  sub_24D1493B8();
  sub_24D149298();
  objc_msgSend(v0, sel_keylineOutsets);
  type metadata accessor for UIEdgeInsets(0);
  sub_24D149438();
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0xE000000000000000;
  sub_24D1493B8();
  sub_24D149298();
  objc_msgSend(v0, sel_keylineFadeLengths);
  uint64_t v9 = v4;
  uint64_t v10 = v5;
  sub_24D149438();
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 88) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStartLocation);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = 0xD000000000000019;
  *(void *)(v1 + 104) = 0x800000024D14E940;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStopLocation);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = 0xD000000000000018;
  *(void *)(v1 + 120) = 0x800000024D14E960;
  *(void *)&long long v8 = 0;
  *((void *)&v8 + 1) = 0xE000000000000000;
  sub_24D1493B8();
  long long v11 = v8;
  sub_24D149298();
  objc_msgSend(v0, sel_adaptiveColorMatrix);
  type metadata accessor for CAColorMatrix(0);
  sub_24D149438();
  uint64_t v6 = *((void *)&v11 + 1);
  *(void *)(v1 + 128) = v11;
  *(void *)(v1 + 136) = v6;
  return v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.debugDescription.getter()
{
  return sub_24D1335A0((void (*)(void))sub_24D130A84);
}

void DRPDropletContextAdaptiveKeylineStyle.init()()
{
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.preferAudioReactivity.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.preferAudioReactivity.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.style.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.style.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.softRim.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_softRim);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.softRim.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_softRim);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.screenBlendMode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_screenBlendMode);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.screenBlendMode.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_screenBlendMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.alpha.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_alpha;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.alpha.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_alpha);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.innerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.innerWidth.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.outerWidth.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.outerWidth.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineBlurRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineBlurRadius.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineBlurRadius);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineInputAmount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineInputAmount.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputAmount);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineInputStart.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputStart;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineInputStart.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputStart);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineInputEnd.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputEnd;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineInputEnd.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputEnd);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.edrGain.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_edrGain;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.edrGain.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_edrGain);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineOutsets.getter()
{
  return sub_24D131D6C(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets);
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineOutsets.setter(double a1, double a2, double a3, double a4)
{
  return sub_24D131E34(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets, a1, a2, a3, a4);
}

double sub_24D131D18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  return *(double *)v3;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineFadeLengths.getter()
{
  return sub_24D131D6C(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths);
}

double sub_24D131D6C(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return *(double *)v2;
}

uint64_t sub_24D131DC0(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  long long v11 = (double *)(a1 + *a7);
  uint64_t result = swift_beginAccess();
  *long long v11 = a2;
  v11[1] = a3;
  v11[2] = a4;
  v11[3] = a5;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineFadeLengths.setter(double a1, double a2, double a3, double a4)
{
  return sub_24D131E34(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths, a1, a2, a3, a4);
}

uint64_t sub_24D131E34(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = (double *)(v5 + *a1);
  uint64_t result = swift_beginAccess();
  *uint64_t v10 = a2;
  v10[1] = a3;
  v10[2] = a4;
  _OWORD v10[3] = a5;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStartLocation.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStartLocation.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStopLocation.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStopLocation.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

void __swiftcall DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:)(DRPDropletContextIntelligentEdgeLightKeylineStyle *__return_ptr retstr, Swift::Bool preferringAudioReactivity)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v3, sel_initWithPreferringAudioReactivity_, preferringAudioReactivity);
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:)(char a1)
{
  return objc_msgSend(v1, sel_initWithPreferringAudioReactivity_style_, a1 & 1, 2);
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:)(char a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v4, sel_initWithPreferringAudioReactivity_style_, a1 & 1, a2);
}

{
  void *v2;
  id v5;
  void *v6;
  char **v7;
  char **v8;
  char **v9;
  char **v10;
  char **v11;
  char **v12;
  char **v13;
  char **v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  char v33;
  id v34;

  uint64_t v5 = objc_msgSend(self, sel_rootSettings);
  uint64_t v6 = v5;
  if (a2 == 1)
  {
    double v33 = a1;
    double v34 = v2;
    double v7 = &selRef_intelligentEdgeLightKeylineStyleSoftSmallWidth;
    long long v8 = &selRef_intelligentEdgeLightKeylineStyleSoftLargeEnd;
    uint64_t v9 = &selRef_intelligentEdgeLightKeylineStyleSoftLargeStart;
    uint64_t v10 = &selRef_intelligentEdgeLightKeylineStyleSoftLargeAmount;
    long long v11 = &selRef_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
    uint64_t v12 = &selRef_intelligentEdgeLightKeylineStyleSoftAlpha;
    uint64_t v13 = &selRef_intelligentEdgeLightKeylineStyleSoftScreenBlendMode;
    uint64_t v14 = &selRef_intelligentEdgeLightKeylineStyleSoftRimIsSoft;
  }
  else
  {
    if (a2 != 2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 1;
      long long v26 = 0.5;
      long long v30 = 0.0;
      id v24 = 0.50001;
      long long v28 = 0.0;
      uint64_t v22 = 0.5;
      uint64_t v20 = 0.0;
      uint64_t v18 = 0.0;
      goto LABEL_7;
    }
    double v33 = a1;
    double v34 = v2;
    double v7 = &selRef_intelligentEdgeLightKeylineStyleHardSmallWidth;
    long long v8 = &selRef_intelligentEdgeLightKeylineStyleHardLargeEnd;
    uint64_t v9 = &selRef_intelligentEdgeLightKeylineStyleHardLargeStart;
    uint64_t v10 = &selRef_intelligentEdgeLightKeylineStyleHardLargeAmount;
    long long v11 = &selRef_intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
    uint64_t v12 = &selRef_intelligentEdgeLightKeylineStyleHardAlpha;
    uint64_t v13 = &selRef_intelligentEdgeLightKeylineStyleHardScreenBlendMode;
    uint64_t v14 = &selRef_intelligentEdgeLightKeylineStyleHardRimIsSoft;
  }
  uint64_t v15 = [v5 *v14];
  uint64_t v16 = (uint64_t)[v6 *v13];
  [v6 *v12];
  uint64_t v18 = v17;
  [v6 *v11];
  uint64_t v20 = v19;
  [v6 *v10];
  uint64_t v22 = v21;
  [v6 *v9];
  id v24 = v23;
  [v6 *v8];
  long long v26 = v25;
  [v6 *v7];
  long long v28 = v27;
  objc_msgSend(v6, sel_intelligentEdgeLightEDRGainAmount);
  long long v30 = v29;
  uint64_t v2 = v34;
  a1 = v33;
LABEL_7:
  double v31 = objc_msgSend(v2, sel_initWithPreferringAudioReactivity_style_softRim_screenBlendMode_alpha_innerWidth_outerWidth_keylineBlurRadius_keylineInputAmount_keylineInputStart_keylineInputEnd_edrGain_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_, a1 & 1, a2, v15, v16, v18, 0.0, v28, v20, v22, v24, v26, v30, *MEMORY[0x263F834E8], *(void *)(MEMORY[0x263F834E8] + 8), *(void *)(MEMORY[0x263F834E8] + 16), *(void *)(MEMORY[0x263F834E8] + 24), *MEMORY[0x263F834E8],
          *(void *)(MEMORY[0x263F834E8] + 8),
          *(void *)(MEMORY[0x263F834E8] + 16),
          *(void *)(MEMORY[0x263F834E8] + 24),
          0,
          0x3FF0000000000000);

  return v31;
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:softRim:screenBlendMode:alpha:innerWidth:outerWidth:keylineBlurRadius:keylineInputAmount:keylineInputStart:keylineInputEnd:edrGain:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:)(char a1, uint64_t a2, char a3, char a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v16, sel_initWithPreferringAudioReactivity_style_softRim_screenBlendMode_alpha_innerWidth_outerWidth_keylineBlurRadius_keylineInputAmount_keylineInputStart_keylineInputEnd_edrGain_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_, a1 & 1, a2, a3 & 1, a4 & 1, a5, a6, a7, a8, a9, a10, a11, a12);
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:softRim:screenBlendMode:alpha:innerWidth:outerWidth:keylineBlurRadius:keylineInputAmount:keylineInputStart:keylineInputEnd:edrGain:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:)(char a1, uint64_t a2, char a3, char a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, uint64_t a18, uint64_t a19, long long a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  *(unsigned char *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity) = a1;
  *(void *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style) = a2;
  *(unsigned char *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_softRim) = a3;
  *(unsigned char *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_screenBlendMode) = a4;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_alpha) = a5;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth) = a6;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth) = a7;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineBlurRadius) = a8;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputAmount) = a9;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputStart) = a10;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputEnd) = a11;
  *(double *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_edrGain) = a12;
  uint64_t v25 = v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets;
  *(_OWORD *)uint64_t v25 = a17;
  *(void *)(v25 + 16) = a18;
  *(void *)(v25 + 24) = a19;
  uint64_t v26 = v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths;
  *(_OWORD *)uint64_t v26 = a20;
  *(void *)(v26 + 16) = a21;
  *(void *)(v26 + 24) = a22;
  *(void *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation) = a23;
  *(void *)(v24 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation) = a24;
  v28.super_class = (Class)DRPDropletContextIntelligentEdgeLightKeylineStyle;
  return objc_msgSendSuper2(&v28, sel_init);
}

BOOL DRPDropletContextIntelligentEdgeLightKeylineStyle.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24D12384C(a1, (uint64_t)v64);
  if (v65)
  {
    type metadata accessor for DRPDropletContextIntelligentEdgeLightKeylineStyle(v2);
    if (swift_dynamicCast())
    {
      unsigned int v3 = objc_msgSend(v1, sel_preferAudioReactivity);
      if (v3 == objc_msgSend(v63, sel_preferAudioReactivity))
      {
        id v4 = objc_msgSend(v1, sel_style);
        if (v4 == objc_msgSend(v63, sel_style))
        {
          unsigned int v5 = objc_msgSend(v1, sel_softRim);
          if (v5 == objc_msgSend(v63, sel_softRim))
          {
            unsigned int v6 = objc_msgSend(v1, sel_screenBlendMode);
            if (v6 == objc_msgSend(v63, sel_screenBlendMode))
            {
              objc_msgSend(v1, sel_alpha);
              double v8 = v7;
              objc_msgSend(v63, sel_alpha);
              if (v8 == v9)
              {
                objc_msgSend(v1, sel_innerWidth);
                double v11 = v10;
                objc_msgSend(v63, sel_innerWidth);
                if (v11 == v12)
                {
                  objc_msgSend(v1, sel_outerWidth);
                  double v14 = v13;
                  objc_msgSend(v63, sel_outerWidth);
                  if (v14 == v15)
                  {
                    objc_msgSend(v1, sel_keylineBlurRadius);
                    double v17 = v16;
                    objc_msgSend(v63, sel_keylineBlurRadius);
                    if (v17 == v18)
                    {
                      objc_msgSend(v1, sel_keylineInputAmount);
                      double v20 = v19;
                      objc_msgSend(v63, sel_keylineInputAmount);
                      if (v20 == v21)
                      {
                        objc_msgSend(v1, sel_keylineInputStart);
                        double v23 = v22;
                        objc_msgSend(v63, sel_keylineInputStart);
                        if (v23 == v24)
                        {
                          objc_msgSend(v1, sel_keylineInputEnd);
                          double v26 = v25;
                          objc_msgSend(v63, sel_keylineInputEnd);
                          if (v26 == v27)
                          {
                            objc_msgSend(v1, sel_edrGain);
                            double v29 = v28;
                            objc_msgSend(v63, sel_edrGain);
                            if (v29 == v30)
                            {
                              objc_msgSend(v1, sel_keylineOutsets);
                              double v32 = v31;
                              double v34 = v33;
                              double v36 = v35;
                              double v38 = v37;
                              objc_msgSend(v63, sel_keylineOutsets);
                              if (v32 == v42 && v34 == v39 && v36 == v40 && v38 == v41)
                              {
                                objc_msgSend(v1, sel_keylineFadeLengths);
                                double v44 = v43;
                                double v46 = v45;
                                double v48 = v47;
                                double v50 = v49;
                                objc_msgSend(v63, sel_keylineFadeLengths);
                                if (v44 == v54 && v46 == v51 && v48 == v52 && v50 == v53)
                                {
                                  objc_msgSend(v1, sel_normalizedStartLocation);
                                  double v56 = v55;
                                  objc_msgSend(v63, sel_normalizedStartLocation);
                                  if (v56 == v57)
                                  {
                                    objc_msgSend(v1, sel_normalizedStopLocation);
                                    double v59 = v58;
                                    objc_msgSend(v63, sel_normalizedStopLocation);
                                    double v61 = v60;

                                    return v59 == v61;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    sub_24D1238B4((uint64_t)v64);
  }
  return 0;
}

uint64_t type metadata accessor for DRPDropletContextIntelligentEdgeLightKeylineStyle(uint64_t a1)
{
  return sub_24D114FEC(a1, &qword_269858478);
}

uint64_t sub_24D132A68(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_24D149388();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_24D1238B4((uint64_t)v10);
  return v8 & 1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.copy()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(v1, sel_preferAudioReactivity);
  id v5 = objc_msgSend(v2, sel_style);
  id v6 = objc_msgSend(v2, sel_softRim);
  id v7 = objc_msgSend(v2, sel_screenBlendMode);
  objc_msgSend(v2, sel_alpha);
  double v44 = v8;
  objc_msgSend(v2, sel_innerWidth);
  double v43 = v9;
  objc_msgSend(v2, sel_outerWidth);
  double v42 = v10;
  objc_msgSend(v2, sel_keylineBlurRadius);
  double v41 = v11;
  objc_msgSend(v2, sel_keylineInputAmount);
  double v40 = v12;
  objc_msgSend(v2, sel_keylineInputStart);
  double v39 = v13;
  objc_msgSend(v2, sel_keylineInputEnd);
  double v38 = v14;
  objc_msgSend(v2, sel_edrGain);
  double v37 = v15;
  objc_msgSend(v2, sel_keylineOutsets);
  uint64_t v35 = v17;
  uint64_t v36 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  objc_msgSend(v2, sel_keylineFadeLengths);
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  objc_msgSend(v2, sel_normalizedStartLocation);
  uint64_t v31 = v30;
  objc_msgSend(v2, sel_normalizedStopLocation);
  id v33 = objc_msgSend(objc_allocWithZone((Class)DRPDropletContextIntelligentEdgeLightKeylineStyle), sel_initWithPreferringAudioReactivity_style_softRim_screenBlendMode_alpha_innerWidth_outerWidth_keylineBlurRadius_keylineInputAmount_keylineInputStart_keylineInputEnd_edrGain_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_, v4, v5, v6, v7, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v19, v21, v23,
          v25,
          v27,
          v29,
          v31,
          v32);
  uint64_t result = type metadata accessor for DRPDropletContextIntelligentEdgeLightKeylineStyle((uint64_t)v33);
  a1[3] = result;
  *a1 = v33;
  return result;
}

uint64_t sub_24D132D24(void *a1, uint64_t a2, void (*a3)(void *__return_ptr))
{
  id v4 = a1;
  a3(v7);

  __swift_project_boxed_opaque_existential_0(v7, v7[3]);
  uint64_t v5 = sub_24D1494B8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.description.getter()
{
  return sub_24D1335A0((void (*)(void))sub_24D132DCC);
}

uint64_t sub_24D132DCC()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24D14B420;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  v6[1] = 0x800000024D14E840;
  objc_msgSend(v0, sel_preferAudioReactivity);
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = 0xD000000000000017;
  *(void *)(v1 + 40) = v6[1];
  strcpy((char *)v6, "style: ");
  v6[1] = 0xE700000000000000;
  objc_msgSend(v0, sel_style);
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v6[0];
  *(void *)(v1 + 56) = v6[1];
  strcpy((char *)v6, "softRim: ");
  WORD1(v6[1]) = 0;
  HIDWORD(v6[1]) = -385875968;
  objc_msgSend(v0, sel_softRim);
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v6[0];
  *(void *)(v1 + 72) = v6[1];
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  v6[1] = 0x800000024D14E860;
  objc_msgSend(v0, sel_screenBlendMode);
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = 0xD000000000000011;
  *(void *)(v1 + 88) = v6[1];
  objc_msgSend(v0, sel_alpha);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = strcpy((char *)v6, "alpha: ");
  *(void *)(v1 + 104) = 0xE700000000000000;
  strcpy((char *)v6, "innerWidth: ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  objc_msgSend(v0, sel_innerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v2 = v6[1];
  *(void *)(v1 + 112) = v6[0];
  *(void *)(v1 + 120) = v2;
  strcpy((char *)v6, "outerWidth: ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  objc_msgSend(v0, sel_outerWidth);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v3 = v6[1];
  *(void *)(v1 + 128) = v6[0];
  *(void *)(v1 + 136) = v3;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_keylineBlurRadius);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 144) = 0xD000000000000013;
  *(void *)(v1 + 152) = 0x800000024D14E880;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_keylineInputAmount);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 160) = 0xD000000000000014;
  *(void *)(v1 + 168) = 0x800000024D14E8A0;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_keylineInputStart);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 176) = 0xD000000000000013;
  *(void *)(v1 + 184) = 0x800000024D14E8C0;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_keylineInputEnd);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 192) = 0xD000000000000011;
  *(void *)(v1 + 200) = 0x800000024D14E8E0;
  strcpy((char *)v6, "edrGain: ");
  WORD1(v6[1]) = 0;
  HIDWORD(v6[1]) = -385875968;
  objc_msgSend(v0, sel_edrGain);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v4 = v6[1];
  *(void *)(v1 + 208) = v6[0];
  *(void *)(v1 + 216) = v4;
  sub_24D1493B8();
  sub_24D149298();
  objc_msgSend(v0, sel_keylineOutsets);
  type metadata accessor for UIEdgeInsets(0);
  sub_24D149438();
  *(void *)(v1 + 224) = 0;
  *(void *)(v1 + 232) = 0xE000000000000000;
  sub_24D1493B8();
  sub_24D149298();
  objc_msgSend(v0, sel_keylineFadeLengths);
  sub_24D149438();
  *(void *)(v1 + 240) = 0;
  *(void *)(v1 + 248) = 0xE000000000000000;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStartLocation);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 256) = 0xD000000000000019;
  *(void *)(v1 + 264) = 0x800000024D14E940;
  sub_24D1493B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStopLocation);
  sub_24D149318();
  sub_24D149298();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 272) = 0xD000000000000018;
  *(void *)(v1 + 280) = 0x800000024D14E960;
  return v1;
}

id sub_24D1334B8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698581A0);
  sub_24D12F87C();
  sub_24D149248();

  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.debugDescription.getter()
{
  return sub_24D1335A0((void (*)(void))sub_24D132DCC);
}

uint64_t sub_24D1335A0(void (*a1)(void))
{
  a1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698581A0);
  sub_24D12F87C();
  uint64_t v1 = sub_24D149248();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t DRPDropletIntelligentLightStyle.debugDescription.getter(uint64_t a1)
{
  uint64_t v1 = 0x6567644564726168;
  uint64_t v2 = 0x6E776F6E6B6E75;
  if (a1 == 1) {
    uint64_t v2 = 0x6567644574666F73;
  }
  if (a1 != 2) {
    uint64_t v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 1701736302;
  }
}

id _sSo39DRPDropletContextSolidColorKeylineStyleC9DropletUIEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

void DRPDropletContextIntelligentEdgeLightKeylineStyle.init()()
{
}

char *keypath_get_selector_width()
{
  return sel_width;
}

id sub_24D133748@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_width);
  *a2 = v4;
  return result;
}

id sub_24D13377C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWidth_, *a1);
}

char *keypath_get_selector_innerWidth()
{
  return sel_innerWidth;
}

id sub_24D13379C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_innerWidth);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_outerWidth()
{
  return sel_outerWidth;
}

char *keypath_get_selector_keylineOutsets()
{
  return sel_keylineOutsets;
}

id sub_24D1337E8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineOutsets, a2);
}

id sub_24D1337F4(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineOutsets_);
}

char *keypath_get_selector_keylineFadeLengths()
{
  return sel_keylineFadeLengths;
}

id sub_24D13380C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineFadeLengths, a2);
}

id sub_24D133818(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineFadeLengths_);
}

char *keypath_get_selector_normalizedStartLocation()
{
  return sel_normalizedStartLocation;
}

id sub_24D133830(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNormalizedStartLocation_, *a1);
}

char *keypath_get_selector_normalizedStopLocation()
{
  return sel_normalizedStopLocation;
}

id sub_24D133850@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_normalizedStopLocation);
  *a2 = v4;
  return result;
}

id sub_24D133884(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNormalizedStopLocation_, *a1);
}

char *keypath_get_selector_color()
{
  return sel_color;
}

id sub_24D1338A4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_color);
  *a2 = result;
  return result;
}

id sub_24D1338E0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColor_, *a1);
}

id sub_24D1338F4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInnerWidth_, *a1);
}

id sub_24D133908@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_outerWidth);
  *a2 = v4;
  return result;
}

id sub_24D13393C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOuterWidth_, *a1);
}

id sub_24D133950@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineOutsets, a2);
}

id sub_24D13395C(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineOutsets_);
}

id sub_24D133968@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineFadeLengths, a2);
}

id sub_24D133974(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineFadeLengths_);
}

id sub_24D133980@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_normalizedStartLocation);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_adaptiveColorMatrix()
{
  return sel_adaptiveColorMatrix;
}

char *keypath_get_selector_preferAudioReactivity()
{
  return sel_preferAudioReactivity;
}

id sub_24D1339D4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_preferAudioReactivity);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D133A08(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferAudioReactivity_, *a1);
}

char *keypath_get_selector_style()
{
  return sel_style;
}

id sub_24D133A28@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_style);
  *a2 = result;
  return result;
}

id sub_24D133A5C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStyle_, *a1);
}

char *keypath_get_selector_softRim()
{
  return sel_softRim;
}

id sub_24D133A7C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_softRim);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D133AB0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSoftRim_, *a1);
}

char *keypath_get_selector_screenBlendMode()
{
  return sel_screenBlendMode;
}

id sub_24D133AD0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_screenBlendMode);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D133B04(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScreenBlendMode_, *a1);
}

char *keypath_get_selector_alpha()
{
  return sel_alpha;
}

id sub_24D133B24@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_alpha);
  *a2 = v4;
  return result;
}

id sub_24D133B58(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAlpha_, *a1);
}

char *keypath_get_selector_keylineBlurRadius()
{
  return sel_keylineBlurRadius;
}

id sub_24D133B78@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineBlurRadius);
  *a2 = v4;
  return result;
}

id sub_24D133BAC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineBlurRadius_, *a1);
}

char *keypath_get_selector_keylineInputAmount()
{
  return sel_keylineInputAmount;
}

id sub_24D133BCC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineInputAmount);
  *a2 = v4;
  return result;
}

id sub_24D133C00(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineInputAmount_, *a1);
}

char *keypath_get_selector_keylineInputStart()
{
  return sel_keylineInputStart;
}

id sub_24D133C20@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineInputStart);
  *a2 = v4;
  return result;
}

id sub_24D133C54(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineInputStart_, *a1);
}

char *keypath_get_selector_keylineInputEnd()
{
  return sel_keylineInputEnd;
}

id sub_24D133C74@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineInputEnd);
  *a2 = v4;
  return result;
}

id sub_24D133CA8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineInputEnd_, *a1);
}

char *keypath_get_selector_edrGain()
{
  return sel_edrGain;
}

id sub_24D133CC8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_edrGain);
  *a2 = v4;
  return result;
}

id sub_24D133CFC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdrGain_, *a1);
}

id sub_24D133D10@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineOutsets, a2);
}

id sub_24D133D1C(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineOutsets_);
}

id sub_24D133D28@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineFadeLengths, a2);
}

id keypath_get_5Tm@<X0>(id *a1@<X0>, SEL *a2@<X3>, void *a3@<X8>)
{
  id result = [*a1 *a2];
  *a3 = v5;
  a3[1] = v6;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

id sub_24D133D68(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineFadeLengths_);
}

id keypath_set_6Tm(double *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*a2, *a5, *a1, a1[1], a1[2], a1[3]);
}

void sub_24D133DF8(double a1)
{
  double v2 = *(double *)((char *)v1
                 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  *(double *)((char *)v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence) = a1;
  if (v2 != a1)
  {
    sub_24D12C03C((uint64_t)v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v4, &qword_26B189100);
    sub_24D12C03C((uint64_t)v4, (uint64_t)v5, &qword_26B189100);
    if (!sub_24D12C02C(v5))
    {
      v7[10] = v5[10];
      v7[11] = v5[11];
      v7[12] = v5[12];
      uint64_t v8 = v6;
      v7[6] = v5[6];
      v7[7] = v5[7];
      v7[8] = v5[8];
      v7[9] = v5[9];
      v7[2] = v5[2];
      v7[3] = v5[3];
      void v7[4] = v5[4];
      v7[5] = v5[5];
      uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
      v7[0] = v5[0];
      v7[1] = v5[1];
      (*(void (**)(_OWORD *))(v3 + 144))(v7);
    }
  }
}

id sub_24D133EF0()
{
  return objc_msgSend(v0, sel_removeFromSuperview);
}

BOOL sub_24D133F00(uint64_t *a1, uint64_t *a2)
{
  BOOL result = 0;
  uint64_t v4 = *a1;
  long long v5 = *(_OWORD *)(a1 + 7);
  long long v36 = *(_OWORD *)(a1 + 5);
  long long v37 = v5;
  long long v6 = *(_OWORD *)(a1 + 9);
  long long v7 = *(_OWORD *)(a1 + 11);
  long long v8 = *(_OWORD *)(a1 + 13);
  long long v9 = *(_OWORD *)(a1 + 15);
  long long v10 = *(_OWORD *)(a1 + 17);
  long long v11 = *(_OWORD *)(a1 + 19);
  long long v12 = *(_OWORD *)(a1 + 21);
  long long v13 = *(_OWORD *)(a1 + 23);
  long long v14 = *(_OWORD *)(a1 + 25);
  uint64_t v15 = *a2;
  long long v16 = *(_OWORD *)(a2 + 5);
  long long v17 = *(_OWORD *)(a2 + 9);
  long long v40 = *(_OWORD *)(a2 + 7);
  long long v41 = v17;
  long long v38 = v6;
  long long v39 = v16;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 1), *(float64x2_t *)(a2 + 1)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 3), *(float64x2_t *)(a2 + 3)))), 0xFuLL))) & 1) != 0&& v4 == v15)
  {
    long long v26 = v14;
    long long v27 = v13;
    long long v28 = v12;
    long long v29 = v11;
    long long v30 = v10;
    long long v31 = v9;
    long long v32 = v8;
    long long v33 = v7;
    long long v24 = *(_OWORD *)(a2 + 13);
    long long v25 = *(_OWORD *)(a2 + 11);
    long long v22 = *(_OWORD *)(a2 + 17);
    long long v23 = *(_OWORD *)(a2 + 15);
    long long v20 = *(_OWORD *)(a2 + 21);
    long long v21 = *(_OWORD *)(a2 + 19);
    long long v18 = *(_OWORD *)(a2 + 25);
    long long v19 = *(_OWORD *)(a2 + 23);
    if (sub_24D149338())
    {
      *(_OWORD *)&a.m11 = v33;
      *(_OWORD *)&a.m13 = v32;
      *(_OWORD *)&a.m21 = v31;
      *(_OWORD *)&a.m23 = v30;
      *(_OWORD *)&a.m31 = v29;
      *(_OWORD *)&a.m33 = v28;
      *(_OWORD *)&a.m41 = v27;
      *(_OWORD *)&a.m43 = v26;
      *(_OWORD *)&b.m11 = v25;
      *(_OWORD *)&b.m13 = v24;
      *(_OWORD *)&b.m21 = v23;
      *(_OWORD *)&b.m23 = v22;
      *(_OWORD *)&b.m31 = v21;
      *(_OWORD *)&b.m33 = v20;
      *(_OWORD *)&b.m41 = v19;
      *(_OWORD *)&b.m43 = v18;
      return CATransform3DEqualToTransform(&a, &b);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *sub_24D134078(char *a1)
{
  uint64_t v3 = (uint64_t)&v1[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry];
  sub_24D12BE48((uint64_t)v74);
  sub_24D12C03C((uint64_t)v74, v3, &qword_26B189100);
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence] = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
  v46.receiver = v1;
  v46.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  id v4 = objc_msgSendSuper2(&v46, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  sub_24D12C03C((uint64_t)&v47, (uint64_t)&v45, &qword_26B189230);
  long long v5 = &a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
  swift_beginAccess();
  long long v6 = *(void **)v5;
  long long v7 = v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)long long v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    long long v6 = sub_24D148570(0, v6[2] + 1, 1, v6);
    *(void *)long long v5 = v6;
  }
  unint64_t v10 = v6[2];
  unint64_t v9 = v6[3];
  if (v10 >= v9 >> 1)
  {
    long long v6 = sub_24D148570((void *)(v9 > 1), v10 + 1, 1, v6);
    *(void *)long long v5 = v6;
  }
  void v6[2] = v10 + 1;
  sub_24D12C03C((uint64_t)&v45, (uint64_t)&v6[v10 + 4], &qword_26B189230);
  long long v11 = a1;
  objc_msgSend(v11, sel_bounds);
  uint64_t v42 = v13;
  uint64_t v43 = v12;
  objc_msgSend(v11, sel_center);
  uint64_t v40 = v15;
  uint64_t v41 = v14;
  objc_msgSend(v11, sel_transform);
  uint64_t v38 = v48;
  long long v39 = v47;
  uint64_t v36 = v50;
  uint64_t v37 = v49;
  double v34 = v52;
  uint64_t v35 = v51;
  objc_msgSend(v11, sel_transform3D);
  long long v16 = v47;
  uint64_t v17 = v48;
  uint64_t v18 = v49;
  uint64_t v19 = v50;
  uint64_t v20 = v51;
  long long v21 = v52;
  uint64_t v22 = v53;
  uint64_t v31 = v54;
  uint64_t v32 = v55;
  long long v29 = v57;
  uint64_t v30 = v56;
  uint64_t v27 = v59;
  long long v28 = v58;
  uint64_t v26 = v60;
  uint64_t v23 = v61;
  uint64_t v33 = v62;

  double v47 = v11;
  uint64_t v48 = v43;
  uint64_t v49 = v42;
  uint64_t v50 = v41;
  uint64_t v51 = v40;
  double v52 = v39;
  uint64_t v53 = v38;
  uint64_t v54 = v37;
  uint64_t v55 = v36;
  uint64_t v56 = v35;
  double v57 = v34;
  double v58 = v16;
  uint64_t v59 = v17;
  uint64_t v60 = v18;
  uint64_t v61 = v19;
  uint64_t v62 = v20;
  uint64_t v63 = v21;
  uint64_t v64 = v22;
  uint64_t v65 = v31;
  uint64_t v66 = v32;
  uint64_t v67 = v30;
  uint64_t v68 = v29;
  uint64_t v69 = v28;
  uint64_t v70 = v27;
  uint64_t v71 = v26;
  uint64_t v72 = v23;
  uint64_t v73 = v33;
  v44[0] = v11;
  v44[1] = v43;
  v44[2] = v42;
  v44[3] = v41;
  v44[4] = v40;
  v44[5] = v39;
  v44[6] = v38;
  v44[7] = v37;
  v44[8] = v36;
  v44[9] = v35;
  v44[10] = v34;
  v44[11] = v16;
  v44[12] = v17;
  v44[13] = v18;
  v44[14] = v19;
  v44[15] = v20;
  v44[16] = v21;
  v44[17] = v22;
  v44[18] = v31;
  v44[19] = v32;
  v44[20] = v30;
  v44[21] = v29;
  v44[22] = v28;
  v44[23] = v27;
  unsigned char v44[24] = v26;
  v44[25] = v23;
  v44[26] = v33;
  nullsub_1(v44);
  uint64_t v24 = (uint64_t)v7 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry;
  sub_24D12C03C((uint64_t)v44, (uint64_t)v7 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, &qword_26B189100);
  (*(void (**)(char **))((*MEMORY[0x263F8EED0] & *v7) + 0x90))(&v47);
  sub_24D12C03C((uint64_t)v44, v24, &qword_26B189100);

  return v7;
}

id sub_24D1345FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletParticipantTrackingView()
{
  return self;
}

__n128 __swift_memcpy216_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  __n128 result = *(__n128 *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 192);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DropletParticipantTrackingView.ParticipantGeometry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 216)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for DropletParticipantTrackingView.ParticipantGeometry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
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
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 216) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 216) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DropletParticipantTrackingView.ParticipantGeometry()
{
  return &type metadata for DropletParticipantTrackingView.ParticipantGeometry;
}

void sub_24D134760(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24D12384C(a1, (uint64_t)v11);
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v10 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  long long v6 = __swift_project_boxed_opaque_existential_0(v11, v12);
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v6, v6);
  unint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = sub_24D1494B8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (a3) {
LABEL_3:
  }
    a3 = (void *)sub_24D149258();
LABEL_4:
  objc_msgSend(v3, sel__setVelocity_forKey_, v10, a3);
  swift_unknownObjectRelease();
}

id DRPDropletAnimationCoordinator.defaultBehaviorSettings.getter()
{
  uint64_t v1 = OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings;
  if (*(void *)(v0 + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings))
  {
    id v2 = *(id *)(v0 + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings);
  }
  else
  {
    id v2 = sub_24D1349D4();
    *(void *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t DRPDropletAnimationCoordinator.defaultBehaviorSettings.setter(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings) = a1;
  return swift_unknownObjectRelease();
}

id sub_24D1349D4()
{
  uint64_t v0 = sub_24D149208();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  long long v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7C480]), sel_init);
  objc_msgSend(v5, sel_setDefaultValues);
  objc_msgSend(v5, sel_setBehaviorType_, 1);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F622D0]), sel_initWithDefaultValues);
  if (result)
  {
    uint64_t v7 = result;
    (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F7C468], v0);
    sub_24D1491F8();
    int v9 = v8;
    int v11 = v10;
    int v13 = v12;
    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v4, v0);
    v18[15] = 1;
    sub_24D11C130();
    uint64_t v14 = sub_24D149218();
    LODWORD(v15) = v9;
    LODWORD(v16) = v11;
    LODWORD(v17) = v13;
    objc_msgSend(v7, sel_setFrameRateRange_highFrameRateReason_, v14, v15, v16, v17);
    objc_msgSend(v5, sel_setPreferredFrameRateRange_, v7);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall DRPDropletAnimationCoordinator.apply(_:animated:tracking:containerView:contextView:)(DRPDropletViewConfiguration *_, Swift::Bool animated, Swift::Bool tracking, DRPDropletContainerView *containerView, DRPDropletContextView *contextView)
{
  void (*v56)(void *__return_ptr);
  id v57;
  DRPDropletContainerView *v58;
  DRPDropletContextView *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(void *__return_ptr);
  void *v63;
  id v64;
  DRPDropletContainerView *v65;
  DRPDropletContextView *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(void *__return_ptr);
  void *v70;
  id v71;
  DRPDropletContainerView *v72;
  DRPDropletContextView *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(void *__return_ptr);
  void *v77;
  id v78;
  DRPDropletContainerView *v79;
  DRPDropletContextView *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(void *__return_ptr);
  void *v84;
  id v85;
  DRPDropletContainerView *v86;
  DRPDropletContextView *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(void *__return_ptr);
  void *v91;
  id v92;
  DRPDropletContainerView *v93;
  DRPDropletContextView *v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(void *__return_ptr);
  void *v98;
  id v99;
  DRPDropletContainerView *v100;
  DRPDropletContextView *v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(void *__return_ptr);
  void *v105;
  id v106;
  DRPDropletContainerView *v107;
  DRPDropletContextView *v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(void *__return_ptr);
  void *v112;
  id v113;
  id v114;
  DRPDropletContextView *v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(void *__return_ptr);
  void *v119;
  id v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(void *__return_ptr);
  void *v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(void *__return_ptr);
  void *v133;
  id v134;
  id v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  DRPDropletViewConfiguration *v148;
  DRPDropletContainerView *v149;
  DRPDropletContextView *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  void *aBlock;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t, uint64_t);
  void *v166;
  uint64_t (*v167)(uint64_t, uint64_t);
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;

  int v9 = containerView;
  int v11 = (uint64_t *)((char *)containerView + OBJC_IVAR___DRPDropletContainerView_participantViews);
  swift_beginAccess();
  uint64_t v12 = *v11;
  if ((*v11 & 0xC000000000000001) != 0)
  {
    int v13 = (unsigned char *)MEMORY[0x25331E4B0](0);
  }
  else
  {
    if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_39;
    }
    int v13 = *(id *)(v12 + 32);
  }
  uint64_t v14 = v13;
  swift_endAccess();
  uint64_t v7 = *(unsigned __int8 **)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 48];
  uint64_t v15 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 56];
  v160 = v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80];
  v151 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 72];
  v152 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 64];
  v153 = *(void **)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  v154 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 8];
  v155 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 16];
  v156 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 24];
  v157 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 32];
  v158 = *(void *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 40];
  sub_24D123FFC(v153, v154, v155, v156, v157, v158, (uint64_t)v7, v15, v152, v151, v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80]);

  v159 = v5;
  if (![(DRPDropletViewConfiguration *)_ keylineStyle]) {
    goto LABEL_32;
  }
  self;
  double v16 = (void *)swift_dynamicCastObjCClass();
  if (!v16)
  {
    self;
    uint64_t v18 = (void *)swift_dynamicCastObjCClass();
    if (v18)
    {
      v145 = v15;
      long long v146 = (uint64_t)v7;
      v148 = _;
      v149 = v9;
      v150 = contextView;
      objc_msgSend(v18, sel_adaptiveColorMatrix);
      id v17 = aBlock;
      uint64_t v19 = v164;
      uint64_t v21 = (uint64_t)v165;
      uint64_t v20 = (uint64_t)v166;
      uint64_t v22 = (uint64_t)v167;
      uint64_t v23 = v168;
      uint64_t v24 = v169;
      uint64_t v25 = v171;
      uint64_t v26 = v172;
      swift_unknownObjectRelease();
      if (v160 == 2)
      {
        char v27 = 0;
        uint64_t v28 = v170;
LABEL_35:
        sub_24D12BF7C(v17, v19, v21, v20, v22, v23, v24, v28, v25, v26, v27);
        objc_super v46 = (void *)sub_24D149258();
        uint64_t v47 = swift_allocObject();
        int v9 = v149;
        swift_unknownObjectWeakInit();
        v167 = sub_24D13794C;
        v168 = v47;
        aBlock = (void *)MEMORY[0x263EF8330];
        v164 = 1107296256;
        v165 = sub_24D11E0A4;
        v166 = &block_descriptor_2;
        uint64_t v48 = _Block_copy(&aBlock);
        swift_release();
        _ = v148;
        [(DRPDropletViewConfiguration *)v148 addAnimationCompletionBlockForKeyPath:v46 animationCompletionBlock:v48];
        _Block_release(v48);

        contextView = v150;
        goto LABEL_43;
      }
      sub_24D12BF7C(v153, v154, v155, v156, v157, v158, v146, v145, v152, v151, v160);
      goto LABEL_42;
    }
    self;
    uint64_t v29 = swift_dynamicCastObjCClass();
    if (v29)
    {
      uint64_t v30 = (void *)v29;
      swift_unknownObjectRetain();
      objc_msgSend(v30, sel_preferAudioReactivity);
      objc_msgSend(v30, sel_screenBlendMode);
      objc_msgSend(v30, sel_alpha);
      swift_unknownObjectRelease_n();
      if (v160 == 2) {
        goto LABEL_43;
      }
      uint64_t v144 = v15;
      uint64_t v6 = *v11;
      v149 = v9;
      v150 = contextView;
      v148 = _;
      if ((unint64_t)*v11 >> 62) {
        goto LABEL_40;
      }
      uint64_t v31 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      for (; v31; uint64_t v31 = sub_24D149468())
      {
        uint64_t v32 = 0;
        unint64_t v33 = v6 & 0xC000000000000001;
        v143 = v6 + 32;
        double v34 = (void *)MEMORY[0x263F8EED0];
        v142 = v31;
        uint64_t v147 = v6 & 0xC000000000000001;
        while (1)
        {
          uint64_t v35 = v7;
          uint64_t v36 = v33
              ? (unsigned __int8 *)MEMORY[0x25331E4B0](v32, v6)
              : (unsigned __int8 *)*(id *)(v143 + 8 * v32);
          uint64_t v7 = v36;
          BOOL v37 = __OFADD__(v32++, 1);
          if (v37) {
            break;
          }
          uint64_t v38 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden;
          int v39 = v36[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden];
          v36[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden] = 0;
          if (v39 == 1)
          {
            uint64_t v40 = &v36[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
            swift_beginAccess();
            uint64_t v41 = *(void *)(*(void *)v40 + 16);
            if (v41)
            {
              uint64_t v42 = v6;
              uint64_t v43 = *(void *)v40 + 32;
              swift_bridgeObjectRetain_n();
              do
              {
                sub_24D12C2A0(v43, (uint64_t)&aBlock);
                double v44 = (void *)MEMORY[0x25331EC50](&aBlock);
                if (v44)
                {
                  char v45 = v44;
                  (*(void (**)(unsigned __int8 *, void))((*v34 & *v44) + 0xD0))(v7, v7[v38]);
                }
                sub_24D13796C((uint64_t)&aBlock);
                v43 += 8;
                --v41;
              }
              while (v41);

              swift_bridgeObjectRelease_n();
              uint64_t v6 = v42;
              uint64_t v31 = v142;
            }
            else
            {
            }
            unint64_t v33 = v147;
          }
          else
          {
          }
          uint64_t v7 = v35;
          if (v32 == v31) {
            goto LABEL_41;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        swift_bridgeObjectRetain_n();
      }
LABEL_41:
      swift_bridgeObjectRelease();
      sub_24D12BF7C(v153, v154, v155, v156, v157, v158, (uint64_t)v7, v144, v152, v151, v160);
      swift_bridgeObjectRelease();
LABEL_42:
      int v9 = v149;
      contextView = v150;
      _ = v148;
      goto LABEL_43;
    }
    swift_unknownObjectRelease();
LABEL_32:
    id v17 = 0;
    goto LABEL_33;
  }
  id v17 = objc_msgSend(v16, sel_color);
  swift_unknownObjectRelease();
LABEL_33:
  char v27 = 1;
  if (v160 == 2)
  {
    v148 = _;
    v149 = v9;
    v150 = contextView;
    uint64_t v26 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = 0;
    uint64_t v24 = 0;
    uint64_t v23 = 0;
    uint64_t v22 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    goto LABEL_35;
  }
  sub_24D12BF7C(v153, v154, v155, v156, v157, v158, (uint64_t)v7, v15, v152, v151, v160);
  sub_24D12BF7C(v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
LABEL_43:
  [(DRPDropletViewConfiguration *)_ copy];
  sub_24D149388();
  swift_unknownObjectRelease();
  type metadata accessor for DRPDropletViewConfiguration(0);
  swift_dynamicCast();
  uint64_t v49 = qword_26B189190;
  id v50 = v173;
  uint64_t v51 = v9;
  double v52 = contextView;
  if (v49 != -1) {
    swift_once();
  }
  uint64_t v53 = qword_26B189170;
  uint64_t v54 = *(void *)algn_26B189178;
  uint64_t v56 = (void (*)(void *__return_ptr))qword_26B189180;
  uint64_t v55 = (void *)unk_26B189188;
  double v57 = v50;
  double v58 = v51;
  uint64_t v59 = v52;
  sub_24D135D50(v53, v54, v56, v55, animated, tracking, v57, v58, v59, (uint64_t)sub_24D135D04, 0);

  if (qword_26B189168 != -1) {
    swift_once();
  }
  uint64_t v60 = qword_26B189140;
  uint64_t v61 = *(void *)algn_26B189148;
  uint64_t v62 = (void (*)(void *__return_ptr))qword_26B189150;
  uint64_t v63 = (void *)unk_26B189158;
  uint64_t v64 = v57;
  uint64_t v65 = v58;
  uint64_t v66 = v59;
  sub_24D135D50(v60, v61, v62, v63, animated, tracking, v64, v65, v66, (uint64_t)sub_24D1365DC, 0);

  if (qword_26B189318 != -1) {
    swift_once();
  }
  uint64_t v67 = qword_26B1892F0;
  uint64_t v68 = *(void *)algn_26B1892F8;
  uint64_t v69 = (void (*)(void *__return_ptr))qword_26B189300;
  uint64_t v70 = (void *)unk_26B189308;
  uint64_t v71 = v64;
  uint64_t v72 = v65;
  uint64_t v73 = v66;
  sub_24D135D50(v67, v68, v69, v70, animated, tracking, v71, v72, v73, (uint64_t)sub_24D13662C, 0);

  if (qword_26B189370 != -1) {
    swift_once();
  }
  uint64_t v74 = qword_26B189350;
  uint64_t v75 = *(void *)algn_26B189358;
  uint64_t v76 = (void (*)(void *__return_ptr))qword_26B189360;
  uint64_t v77 = (void *)unk_26B189368;
  uint64_t v78 = v71;
  uint64_t v79 = v72;
  uint64_t v80 = v73;
  sub_24D135D50(v74, v75, v76, v77, animated, tracking, v78, v79, v80, (uint64_t)sub_24D136698, 0);

  if (qword_26B189788 != -1) {
    swift_once();
  }
  uint64_t v81 = qword_26B189760;
  uint64_t v82 = *(void *)algn_26B189768;
  uint64_t v83 = (void (*)(void *__return_ptr))qword_26B189770;
  uint64_t v84 = (void *)unk_26B189778;
  char v85 = v78;
  char v86 = v79;
  uint64_t v87 = v80;
  sub_24D135D50(v81, v82, v83, v84, animated, tracking, v85, v86, v87, (uint64_t)sub_24D1366E4, 0);

  if (qword_26B189340 != -1) {
    swift_once();
  }
  uint64_t v88 = qword_26B189320;
  uint64_t v89 = *(void *)algn_26B189328;
  uint64_t v90 = (void (*)(void *__return_ptr))qword_26B189330;
  uint64_t v91 = (void *)unk_26B189338;
  uint64_t v92 = v85;
  uint64_t v93 = v86;
  int64_t v94 = v87;
  sub_24D135D50(v88, v89, v90, v91, animated, tracking, v92, v93, v94, (uint64_t)sub_24D136734, 0);

  if (qword_26B189438 != -1) {
    swift_once();
  }
  unint64_t v95 = qword_26B189410;
  int64_t v96 = *(void *)algn_26B189418;
  uint64_t v97 = (void (*)(void *__return_ptr))qword_26B189420;
  int64_t v98 = (void *)unk_26B189428;
  uint64_t v99 = v92;
  uint64_t v100 = v93;
  uint64_t v101 = v94;
  sub_24D135D50(v95, v96, v97, v98, animated, tracking, v99, v100, v101, (uint64_t)sub_24D1367A8, 0);

  if (qword_26B1893A8 != -1) {
    swift_once();
  }
  uint64_t v102 = qword_26B189380;
  char v103 = *(void *)algn_26B189388;
  char v104 = (void (*)(void *__return_ptr))qword_26B189390;
  unint64_t v105 = (void *)unk_26B189398;
  uint64_t v106 = v99;
  BOOL v107 = v100;
  uint64_t v108 = v101;
  sub_24D135D50(v102, v103, v104, v105, animated, tracking, v106, v107, v108, (uint64_t)sub_24D1367F4, 0);

  if (qword_26B1893D0 != -1) {
    swift_once();
  }
  char v109 = qword_26B1893B0;
  unint64_t v110 = *(void *)algn_26B1893B8;
  char v111 = (void (*)(void *__return_ptr))qword_26B1893C0;
  id v112 = (void *)unk_26B1893C8;
  uint64_t v113 = v106;
  uint64_t v114 = v107;
  v115 = v108;
  sub_24D135D50(v109, v110, v111, v112, animated, tracking, v113, v114, v115, (uint64_t)sub_24D136860, 0);

  if (qword_26B189400 != -1) {
    swift_once();
  }
  uint64_t v116 = qword_26B1893E0;
  uint64_t v117 = *(void *)algn_26B1893E8;
  uint64_t v118 = (void (*)(void *__return_ptr))qword_26B1893F0;
  uint64_t v119 = (void *)unk_26B1893F8;
  id v120 = v113;
  double v121 = v114;
  double v122 = v115;
  sub_24D135D50(v116, v117, v118, v119, animated, tracking, v120, v121, v122, (uint64_t)sub_24D1368CC, 0);

  if (qword_26B189468 != -1) {
    swift_once();
  }
  double v123 = qword_26B189440;
  id v124 = *(void *)algn_26B189448;
  id v125 = (void (*)(void *__return_ptr))qword_26B189450;
  double v126 = (void *)unk_26B189458;
  uint64_t v127 = v120;
  int64_t v128 = v121;
  uint64_t v129 = v122;
  sub_24D135D50(v123, v124, v125, v126, animated, tracking, v127, v128, v129, (uint64_t)sub_24D13693C, 0);

  if (qword_26B189490 != -1) {
    swift_once();
  }
  double v130 = qword_26B189470;
  long long v131 = *(void *)algn_26B189478;
  long long v132 = (void (*)(void *__return_ptr))qword_26B189480;
  int64_t v133 = (void *)unk_26B189488;
  uint64_t v134 = v127;
  uint64_t v135 = v128;
  v136 = v129;
  sub_24D135D50(v130, v131, v132, v133, animated, tracking, v134, v135, v136, (uint64_t)sub_24D136AF8, 0);

  v137 = *(void **)(v159 + OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable);
  id v138 = v135;
  id v139 = v137;
  objc_msgSend(v139, sel_setObject_forKey_, v134, v138);

  id v140 = *(void *)(v159 + OBJC_IVAR___DRPDropletAnimationCoordinator_id);
  BOOL v37 = __OFADD__(v140, 1);
  id v141 = v140 + 1;
  if (v37) {
    __break(1u);
  }
  else {
    *(void *)(v159 + OBJC_IVAR___DRPDropletAnimationCoordinator_id) = v141;
  }
}

uint64_t sub_24D135AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x25331EC50](v3);
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = (unint64_t *)(result + OBJC_IVAR___DRPDropletContainerView_participantViews);
    swift_beginAccess();
    unint64_t v7 = *v6;
    swift_bridgeObjectRetain();

    if (v7 >> 62) {
      goto LABEL_22;
    }
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v8; uint64_t v8 = sub_24D149468())
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7 & 0xC000000000000001;
      unint64_t v25 = v7 + 32;
      int v11 = (void *)MEMORY[0x263F8EED0];
      unint64_t v24 = v7 & 0xC000000000000001;
      while (1)
      {
        uint64_t v12 = v10
            ? (unsigned __int8 *)MEMORY[0x25331E4B0](v9, v7)
            : (unsigned __int8 *)*(id *)(v25 + 8 * v9);
        int v13 = v12;
        if (__OFADD__(v9++, 1)) {
          break;
        }
        uint64_t v15 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden;
        int v16 = v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden];
        v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden] = 1;
        if (v16 == 1)
        {

          if (v9 == v8) {
            return swift_bridgeObjectRelease_n();
          }
        }
        else
        {
          id v17 = &v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          uint64_t v18 = *(void *)(*(void *)v17 + 16);
          if (v18)
          {
            uint64_t v19 = v8;
            unint64_t v20 = v7;
            uint64_t v21 = *(void *)v17 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_24D12C2A0(v21, (uint64_t)v26);
              uint64_t v22 = (void *)MEMORY[0x25331EC50](v26);
              if (v22)
              {
                uint64_t v23 = v22;
                (*(void (**)(unsigned __int8 *, void))((*v11 & *v22) + 0xD0))(v13, v13[v15]);
              }
              sub_24D13796C((uint64_t)v26);
              v21 += 8;
              --v18;
            }
            while (v18);

            swift_bridgeObjectRelease_n();
            unint64_t v7 = v20;
            uint64_t v8 = v19;
            unint64_t v10 = v24;
          }
          else
          {
          }
          if (v9 == v8) {
            return swift_bridgeObjectRelease_n();
          }
        }
      }
      __break(1u);
LABEL_22:
      swift_bridgeObjectRetain();
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

id sub_24D135D04(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_boundaryOutsets);
  return objc_msgSend(a4, sel_setBoundaryOutsets_);
}

uint64_t sub_24D135D50(uint64_t a1, uint64_t a2, void (*a3)(void *__return_ptr), void *a4, char a5, char a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11)
{
  void (*v51)(void *__return_ptr);
  id v52;
  id v53;
  char v54;
  uint64_t v55;
  void (*v57)(uint64_t, uint64_t, id, id, void, uint64_t (*)(), uint64_t, void (*)(char, char), uint64_t);
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(char, char);
  uint64_t (*v62)(uint64_t);
  uint64_t v63;
  uint64_t aBlock;
  uint64_t v65;
  uint64_t (*v66)(uint64_t);
  void *v67;
  uint64_t (*v68)();
  uint64_t v69;
  unsigned char v70[136];
  uint64_t v71;
  unsigned char v72[136];
  unsigned char v73[136];
  void v74[17];
  void v75[17];
  unsigned char v76[144];

  uint64_t v12 = v11;
  id v20 = objc_msgSend(*(id *)&v12[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v20)
  {
    id v21 = v20;
    a3(v74);
    sub_24D137B3C((uint64_t)v74, (uint64_t)v75);

    sub_24D137B3C((uint64_t)v75, (uint64_t)v70);
    nullsub_1(v70);
  }
  else
  {
    sub_24D137F88((uint64_t)v70);
  }
  sub_24D12C03C((uint64_t)v70, (uint64_t)v76, &qword_26B1892C8);
  ((void (*)(void *__return_ptr, void *))a3)(v75, a7);
  sub_24D137B3C((uint64_t)v75, (uint64_t)v72);
  sub_24D12C03C((uint64_t)v76, (uint64_t)v73, &qword_26B1892C8);
  if (sub_24D137FA8((uint64_t)v73) == 1)
  {
    uint64_t v51 = a3;
    sub_24D137B3C((uint64_t)v72, (uint64_t)&aBlock);
    nullsub_1(&aBlock);
    sub_24D12C03C((uint64_t)v76, (uint64_t)v70, &qword_26B1892C8);
    sub_24D12C03C((uint64_t)&aBlock, (uint64_t)&v71, &qword_26B1892C8);
    sub_24D1387B0((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D137FBC);
    sub_24D137FDC((uint64_t)v70);
  }
  else
  {
    sub_24D12C03C((uint64_t)v76, (uint64_t)&aBlock, &qword_26B1892C8);
    sub_24D137B3C((uint64_t)&aBlock, (uint64_t)v70);
    sub_24D1387B0((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13881C);
    char v22 = sub_24D1382FC((uint64_t)v70, (uint64_t)v75);
    sub_24D1387B0((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D1380D4);
    if (v22)
    {
      sub_24D1387B0((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13810C);
      return sub_24D1387B0((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D1380D4);
    }
    uint64_t v51 = a3;
  }
  uint64_t v23 = (void *)sub_24D149258();
  id v24 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v23);

  uint64_t v54 = a6;
  if (v24)
  {
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v24;
    uint64_t v62 = sub_24D1382F4;
  }
  else
  {
    uint64_t v62 = 0;
    uint64_t v25 = 0;
  }
  uint64_t v63 = a1;
  uint64_t v26 = (void *)sub_24D149258();
  id v27 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v26);

  uint64_t v55 = a2;
  double v52 = a4;
  uint64_t v60 = v25;
  if (v27)
  {
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = v27;
    uint64_t v61 = sub_24D124CFC;
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v59 = 0;
  }
  aBlock = sub_24D1494A8();
  uint64_t v65 = v28;
  sub_24D149298();
  swift_bridgeObjectRetain();
  sub_24D149298();
  swift_bridgeObjectRelease();
  uint64_t v29 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v29);

  if ((a5 & 1) == 0)
  {
    double v58 = v30;
    uint64_t v53 = self;
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = a10;
    *(void *)(v43 + 24) = a11;
    *(unsigned char *)(v43 + 32) = 0;
    *(unsigned char *)(v43 + 33) = v54 & 1;
    *(void *)(v43 + 40) = a7;
    *(void *)(v43 + 48) = a8;
    *(void *)(v43 + 56) = a9;
    *(void *)(v43 + 64) = v62;
    *(void *)(v43 + 72) = v60;
    uint64_t v68 = sub_24D138130;
    uint64_t v69 = v43;
    aBlock = MEMORY[0x263EF8330];
    uint64_t v65 = 1107296256;
    uint64_t v66 = sub_24D142914;
    uint64_t v67 = &block_descriptor_79;
    double v44 = _Block_copy(&aBlock);
    id v45 = a7;
    id v46 = a8;
    id v47 = a9;
    swift_retain();
    sub_24D123500((uint64_t)v62);
    swift_release();
    objc_msgSend(v53, sel__performWithoutRetargetingAnimations_, v44);
    _Block_release(v44);
    if (v27)
    {
      swift_retain();
      v61(1, 0);
      sub_24D124CB4((uint64_t)v61);
    }
    id v48 = objc_msgSend(v45, sel_anyAnimationCompletionBlock);
    if (v48)
    {
      uint64_t v49 = (void (**)(void, void, void, void))v48;
      id v50 = (void *)sub_24D149258();
      ((void (**)(void, void *, uint64_t, void))v49)[2](v49, v50, 1, 0);

      _Block_release(v49);
    }
    if (v58)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_24D1387B0((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13810C);
      sub_24D124CB4((uint64_t)v62);
      sub_24D124CB4((uint64_t)v61);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_24D1387B0((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13810C);
      sub_24D124CB4((uint64_t)v62);
      sub_24D124CB4((uint64_t)v61);
    }
    return sub_24D1387B0((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D1380D4);
  }
  uint64_t v31 = (void *)sub_24D149258();
  id v32 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v31);

  if (!v32)
  {
    id v33 = objc_msgSend(v12, sel_defaultBehaviorSettings);
    swift_getObjectType();
    id v32 = sub_24D136F64();
    swift_unknownObjectRelease();
  }
  double v57 = *(void (**)(uint64_t, uint64_t, id, id, void, uint64_t (*)(), uint64_t, void (*)(char, char), uint64_t))&v12[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = a10;
  *(void *)(v34 + 24) = a11;
  *(unsigned char *)(v34 + 32) = 1;
  *(unsigned char *)(v34 + 33) = v54 & 1;
  *(void *)(v34 + 40) = a7;
  *(void *)(v34 + 48) = a8;
  *(void *)(v34 + 56) = a9;
  *(void *)(v34 + 64) = v62;
  *(void *)(v34 + 72) = v60;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v61;
  *(void *)(v35 + 24) = v59;
  *(unsigned char *)(v35 + 32) = 1;
  *(unsigned char *)(v35 + 33) = v54 & 1;
  *(void *)(v35 + 40) = a7;
  *(void *)(v35 + 48) = a8;
  *(void *)(v35 + 56) = a9;
  *(void *)(v35 + 64) = v63;
  *(void *)(v35 + 72) = a2;
  *(void *)(v35 + 80) = v51;
  *(void *)(v35 + 88) = v52;
  *(void *)(v35 + 96) = v30;
  id v36 = a7;
  id v37 = a8;
  id v38 = a9;
  swift_bridgeObjectRetain();
  id v39 = v36;
  id v40 = v37;
  id v41 = v38;
  swift_retain();
  swift_retain();
  sub_24D123500((uint64_t)v62);
  sub_24D123500((uint64_t)v61);
  swift_retain();
  swift_unknownObjectRetain();
  v57(v63, v55, v39, v32, v54 & 1, sub_24D138130, v34, sub_24D138268, v35);
  sub_24D1387B0((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13810C);
  sub_24D124CB4((uint64_t)v62);
  sub_24D124CB4((uint64_t)v61);
  swift_unknownObjectRelease();
  sub_24D1387B0((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D1380D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

id sub_24D1365DC(int a1, int a2, id a3, void *a4)
{
  id v5 = objc_msgSend(a3, sel_boundaryEdges);
  return objc_msgSend(a4, sel_setBoundaryEdges_, v5);
}

void sub_24D13662C(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  id v6 = objc_msgSend(a3, sel_dropletColor);
  objc_msgSend(a5, sel_setDropletColor_, v6);
}

id sub_24D136698(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  objc_msgSend(a3, sel_dropletRadius);
  return objc_msgSend(a5, sel_setDropletRadius_);
}

id sub_24D1366E4(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  id v6 = objc_msgSend(a3, sel_disableDropletEffectFilters);
  return objc_msgSend(a5, sel_setDisableDropletEffectFilters_, v6);
}

uint64_t sub_24D136734(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  objc_msgSend(a5, sel_applyKeylineStyle_forContainerView_, objc_msgSend(a3, sel_keylineStyle), a4);
  return swift_unknownObjectRelease();
}

id sub_24D1367A8(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerCornerRadius);
  return objc_msgSend(a4, sel_setContinuousCornerRadius_);
}

id sub_24D1367F4(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerWidth);
  objc_msgSend(a4, sel_bounds);
  return objc_msgSend(a4, sel_setBounds_);
}

id sub_24D136860(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerHeight);
  objc_msgSend(a4, sel_bounds);
  return objc_msgSend(a4, sel_setBounds_);
}

id sub_24D1368CC(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerTransform);
  return objc_msgSend(a4, sel_setTransform3D_, &v6);
}

uint64_t sub_24D13693C(char a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = self;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a1;
  *(unsigned char *)(v11 + 17) = a2;
  *(void *)(v11 + 24) = a3;
  *(void *)(v11 + 32) = a4;
  *(void *)(v11 + 40) = a5;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_24D137BC0;
  *(void *)(v12 + 24) = v11;
  v18[4] = sub_24D138CEC;
  v18[5] = v12;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_24D136AD0;
  v18[3] = &block_descriptor_28;
  int v13 = _Block_copy(v18);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  swift_retain();
  swift_release();
  objc_msgSend((id)v10, sel__modifyAnimationsByDecomposingGeometricTypes_animations_, 1, v13);
  _Block_release(v13);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10) {
    __break(1u);
  }
  return result;
}

uint64_t sub_24D136AD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_24D136AF8(char a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = self;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a1;
  *(unsigned char *)(v11 + 17) = a2;
  *(void *)(v11 + 24) = a3;
  *(void *)(v11 + 32) = a4;
  *(void *)(v11 + 40) = a5;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_24D137A40;
  *(void *)(v12 + 24) = v11;
  v18[4] = sub_24D137AB8;
  v18[5] = v12;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_24D136AD0;
  v18[3] = &block_descriptor_16;
  int v13 = _Block_copy(v18);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  swift_retain();
  swift_release();
  objc_msgSend((id)v10, sel__modifyAnimationsByDecomposingGeometricTypes_animations_, 1, v13);
  _Block_release(v13);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10) {
    __break(1u);
  }
  return result;
}

void sub_24D136D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = self;
  uint64_t v21 = a6;
  uint64_t v22 = a7;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_24D142914;
  id v20 = &block_descriptor_4;
  id v15 = _Block_copy(&v17);
  swift_retain();
  swift_release();
  uint64_t v21 = a8;
  uint64_t v22 = a9;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_24D11E0A4;
  id v20 = &block_descriptor_7;
  id v16 = _Block_copy(&v17);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel__animateUsingSpringBehavior_tracking_animations_completion_, a4, a5 & 1, v15, v16);
  _Block_release(v16);
  _Block_release(v15);
}

void *sub_24D136F64()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    swift_unknownObjectRetain();
    objc_msgSend(v2, sel_copy);
    sub_24D149388();
    swift_unknownObjectRelease();
    sub_24D149348();
    swift_dynamicCast();
    uint64_t v3 = (void *)sub_24D149258();
    objc_msgSend(v5, sel_setName_, v3);

    swift_unknownObjectRelease();
    return v5;
  }
  else
  {
    swift_unknownObjectRetain();
  }
  return (void *)v0;
}

void sub_24D137054(char a1, char a2, void (*a3)(void, void), int a4, int a5, id a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  if (a3) {
    a3(a1 & 1, a2 & 1);
  }
  id v16 = objc_msgSend(a6, sel_anyAnimationCompletionBlock);
  if (v16)
  {
    uint64_t v17 = (void (**)(void, void, void, void))v16;
    uint64_t v18 = (void *)sub_24D149258();
    ((void (**)(void, void *, void, void))v17)[2](v17, v18, a1 & 1, a2 & 1);

    _Block_release(v17);
  }
  if (a13)
  {
    objc_msgSend(a13, sel_invalidate);
  }
}

uint64_t sub_24D1371A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  swift_getAtKeyPath();

  v6[0] = v5;
  sub_24D137E50((uint64_t)v6);
  return sub_24D137B3C((uint64_t)v6, a2);
}

uint64_t sub_24D137214@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  swift_getAtKeyPath();

  v6[0] = v5;
  sub_24D137B30((uint64_t)v6);
  return sub_24D137B3C((uint64_t)v6, a2);
}

uint64_t sub_24D137284@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  swift_getAtKeyPath();

  v13[4] = v9;
  v13[5] = v10;
  v13[6] = v11;
  v13[7] = v12;
  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  sub_24D137C90((uint64_t)v13);
  return sub_24D137B3C((uint64_t)v13, a2);
}

uint64_t sub_24D137328@<X0>(void *a1@<X0>, void (*a2)(void *)@<X2>, uint64_t a3@<X8>)
{
  id v5 = a1;
  swift_getAtKeyPath();

  v8[0] = v7;
  a2(v8);
  return sub_24D137B3C((uint64_t)v8, a3);
}

uint64_t sub_24D1373A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  swift_getAtKeyPath();

  v6[0] = v5;
  sub_24D137F7C((uint64_t)v6);
  return sub_24D137B3C((uint64_t)v6, a2);
}

uint64_t sub_24D137410@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  swift_getAtKeyPath();

  v7[0] = v5;
  v7[1] = v6;
  sub_24D1388B4((uint64_t)v7);
  return sub_24D137B3C((uint64_t)v7, a2);
}

uint64_t sub_24D137480(uint64_t a1, uint64_t a2)
{
  sub_24D137B3C(a1, (uint64_t)v4);
  sub_24D137B3C(a2, (uint64_t)v5);
  return sub_24D1382FC((uint64_t)v4, (uint64_t)v5) & 1;
}

uint64_t sub_24D1374CC()
{
  uint64_t result = swift_getKeyPath();
  qword_26B189440 = 0x587265746E6563;
  *(void *)algn_26B189448 = 0xE700000000000000;
  qword_26B189450 = (uint64_t)sub_24D137B28;
  unk_26B189458 = result;
  return result;
}

uint64_t sub_24D137520()
{
  uint64_t result = swift_getKeyPath();
  qword_26B189470 = 0x597265746E6563;
  *(void *)algn_26B189478 = 0xE700000000000000;
  qword_26B189480 = (uint64_t)sub_24D137B28;
  unk_26B189488 = result;
  return result;
}

uint64_t sub_24D137574()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26B189140, "boundaryEdges");
  *(_WORD *)&algn_26B189148[6] = -4864;
  qword_26B189150 = (uint64_t)sub_24D137F74;
  unk_26B189158 = result;
  return result;
}

uint64_t sub_24D1375D4()
{
  uint64_t result = swift_getKeyPath();
  qword_26B189170 = 0x797261646E756F62;
  *(void *)algn_26B189178 = 0xEF7374657374754FLL;
  qword_26B189180 = (uint64_t)sub_24D1388AC;
  unk_26B189188 = result;
  return result;
}

uint64_t sub_24D137634()
{
  uint64_t result = swift_getKeyPath();
  qword_26B189410 = 0xD000000000000015;
  *(void *)algn_26B189418 = 0x800000024D14B750;
  qword_26B189420 = (uint64_t)sub_24D137B28;
  unk_26B189428 = result;
  return result;
}

uint64_t sub_24D13768C()
{
  uint64_t result = swift_getKeyPath();
  qword_26B1893B0 = 0x656E6961746E6F63;
  *(void *)algn_26B1893B8 = 0xEF74686769654872;
  qword_26B1893C0 = (uint64_t)sub_24D137B28;
  unk_26B1893C8 = result;
  return result;
}

uint64_t sub_24D1376EC()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26B189380, "containerWidth");
  algn_26B189388[7] = -18;
  qword_26B189390 = (uint64_t)sub_24D137B28;
  unk_26B189398 = result;
  return result;
}

uint64_t sub_24D13774C()
{
  uint64_t result = swift_getKeyPath();
  qword_26B1893E0 = 0xD000000000000012;
  *(void *)algn_26B1893E8 = 0x800000024D14B6A0;
  qword_26B1893F0 = (uint64_t)sub_24D137C88;
  unk_26B1893F8 = result;
  return result;
}

uint64_t sub_24D1377A4()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26B1892F0, "dropletColor");
  algn_26B1892F8[5] = 0;
  *(_WORD *)&algn_26B1892F8[6] = -5120;
  qword_26B189300 = (uint64_t)sub_24D137EF0;
  unk_26B189308 = result;
  return result;
}

uint64_t sub_24D137800()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26B189350, "dropletRadius");
  *(_WORD *)&algn_26B189358[6] = -4864;
  qword_26B189360 = (uint64_t)sub_24D137B28;
  unk_26B189368 = result;
  return result;
}

uint64_t sub_24D137860()
{
  uint64_t result = swift_getKeyPath();
  qword_26B189760 = 0xD00000000000001BLL;
  *(void *)algn_26B189768 = 0x800000024D14B7D0;
  qword_26B189770 = (uint64_t)sub_24D137E48;
  unk_26B189778 = result;
  return result;
}

uint64_t sub_24D1378B8()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26B189320, "keylineStyle");
  algn_26B189328[5] = 0;
  *(_WORD *)&algn_26B189328[6] = -5120;
  qword_26B189330 = (uint64_t)sub_24D137DC4;
  unk_26B189338 = result;
  return result;
}

uint64_t sub_24D137914()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D13794C(uint64_t a1, uint64_t a2)
{
  return sub_24D135AA8(a1, a2, v2);
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

uint64_t sub_24D13796C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *keypath_get_selector_defaultBehaviorSettings()
{
  return sel_defaultBehaviorSettings;
}

id sub_24D1379D8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_defaultBehaviorSettings);
  *a2 = result;
  return result;
}

id sub_24D137A14(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDefaultBehaviorSettings_, *a1);
}

uint64_t type metadata accessor for DRPDropletAnimationCoordinator(uint64_t a1)
{
  return sub_24D114FEC(a1, (unint64_t *)&unk_2698584C0);
}

id sub_24D137A40()
{
  uint64_t v1 = *(void **)(v0 + 32);
  objc_msgSend(*(id *)(v0 + 24), sel_centerY);
  objc_msgSend(v1, sel_center);
  return objc_msgSend(v1, sel_setCenter_);
}

uint64_t sub_24D137AA8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D137AB8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_24D137AE0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_centerY);
  *a2 = v4;
  return result;
}

id sub_24D137B14(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterY_, *a1);
}

uint64_t sub_24D137B28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D137214(a1, a2);
}

uint64_t sub_24D137B30(uint64_t result)
{
  *(unsigned char *)(result + 128) = 1;
  return result;
}

uint64_t sub_24D137B3C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  long long v2 = *(_OWORD *)(a1 + 16);
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  long long v5 = *(_OWORD *)(a1 + 80);
  long long v6 = *(_OWORD *)(a1 + 96);
  long long v7 = *(_OWORD *)(a1 + 112);
  *(unsigned char *)(a2 + 128) = *(unsigned char *)(a1 + 128);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(_OWORD *)(a2 + 80) = v5;
  return a2;
}

uint64_t objectdestroy_9Tm()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

id sub_24D137BC0()
{
  uint64_t v1 = *(void **)(v0 + 32);
  objc_msgSend(*(id *)(v0 + 24), sel_centerX);
  double v3 = v2;
  objc_msgSend(v1, sel_center);
  return objc_msgSend(v1, sel_setCenter_, v3);
}

uint64_t sub_24D137C28()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_24D137C38@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_centerX);
  *a2 = v4;
  return result;
}

id sub_24D137C6C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterX_, *a1);
}

uint64_t sub_24D137C88@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D137284(a1, a2);
}

uint64_t sub_24D137C90(uint64_t result)
{
  *(unsigned char *)(result + 128) = 2;
  return result;
}

id sub_24D137C9C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_containerHeight);
  *a2 = v4;
  return result;
}

id sub_24D137CD0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerHeight_, *a1);
}

id sub_24D137CE4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_containerWidth);
  *a2 = v4;
  return result;
}

id sub_24D137D18(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerWidth_, *a1);
}

id sub_24D137D2C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_containerCornerRadius);
  *a2 = v4;
  return result;
}

id sub_24D137D60(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerCornerRadius_, *a1);
}

id sub_24D137D74@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineStyle);
  *a2 = result;
  return result;
}

id sub_24D137DB0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineStyle_, *a1);
}

uint64_t sub_24D137DC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D137328(a1, (void (*)(void *))sub_24D137DF4, a2);
}

uint64_t sub_24D137DF4(uint64_t result)
{
  *(unsigned char *)(result + 128) = 3;
  return result;
}

id sub_24D137E00@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_disableDropletEffectFilters);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D137E34(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDisableDropletEffectFilters_, *a1);
}

uint64_t sub_24D137E48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D1371A4(a1, a2);
}

uint64_t sub_24D137E50(uint64_t result)
{
  *(unsigned char *)(result + 128) = 0;
  return result;
}

id sub_24D137E58@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dropletRadius);
  *a2 = v4;
  return result;
}

id sub_24D137E8C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletRadius_, *a1);
}

id sub_24D137EA0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dropletColor);
  *a2 = result;
  return result;
}

id sub_24D137EDC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletColor_, *a1);
}

uint64_t sub_24D137EF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D137328(a1, (void (*)(void *))sub_24D137F20, a2);
}

uint64_t sub_24D137F20(uint64_t result)
{
  *(unsigned char *)(result + 128) = 4;
  return result;
}

id sub_24D137F2C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_24D137F60(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

uint64_t sub_24D137F74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D1373A0(a1, a2);
}

uint64_t sub_24D137F7C(uint64_t result)
{
  *(unsigned char *)(result + 128) = 5;
  return result;
}

double sub_24D137F88(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 128) = -1;
  return result;
}

uint64_t sub_24D137FA8(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 128);
  if (v1 > 6) {
    return (v1 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

id sub_24D137FBC(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a17 == 4) {
    return result;
  }
  if (a17 == 3) {
    return (id)swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_24D137FDC(uint64_t a1)
{
  id v16 = *(void **)(a1 + 136);
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v15 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 160);
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 176);
  uint64_t v6 = *(void *)(a1 + 184);
  uint64_t v7 = *(void *)(a1 + 192);
  long long v13 = *(_OWORD *)(a1 + 216);
  long long v14 = *(_OWORD *)(a1 + 200);
  long long v12 = *(_OWORD *)(a1 + 232);
  uint64_t v9 = *(void *)(a1 + 248);
  uint64_t v8 = *(void *)(a1 + 256);
  unsigned __int8 v10 = *(unsigned char *)(a1 + 264);
  sub_24D1380D4(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(unsigned char *)(a1 + 128));
  sub_24D1380D4(v16, v15, v2, v3, v4, v5, v6, v7, v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9, v8, v10);
  return a1;
}

void sub_24D1380D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned __int8 a17)
{
  if (a17 != 255) {
    sub_24D13810C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
  }
}

void sub_24D13810C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a17 == 4)
  {
  }
  else if (a17 == 3)
  {
    swift_unknownObjectRelease();
  }
}

uint64_t objectdestroy_75Tm()
{
  swift_release();

  if (*(void *)(v0 + 64)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24D138198()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 64);
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t, void, void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), *(unsigned __int8 *)(v0 + 33), v1, *(void *)(v0 + 48), *(void *)(v0 + 56));
  if (v2) {
    return v2(v1);
  }
  return result;
}

uint64_t sub_24D1381F8()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

void sub_24D138268(char a1, char a2)
{
  if (*(unsigned char *)(v2 + 33)) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  sub_24D137054(a1, a2, *(void (**)(void, void))(v2 + 16), *(void *)(v2 + 24), v3 | *(unsigned __int8 *)(v2 + 32), *(id *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 72), *(void *)(v2 + 80), *(void *)(v2 + 88), *(void **)(v2 + 96));
}

uint64_t sub_24D1382BC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D1382F4(uint64_t a1)
{
  return sub_24D11DC30(a1, *(void *)(v1 + 16));
}

uint64_t sub_24D1382FC(uint64_t a1, uint64_t a2)
{
  sub_24D137B3C(a1, (uint64_t)v53);
  switch(sub_24D138854((uint64_t)v53))
  {
    case 1u:
      double v6 = *(double *)nullsub_1(v53);
      sub_24D137B3C(a2, (uint64_t)v52);
      if (sub_24D138854((uint64_t)v52) != 1) {
        goto LABEL_28;
      }
      unsigned __int8 v5 = v6 == *(double *)nullsub_1(v52);
      break;
    case 2u:
      uint64_t v7 = nullsub_1(v53);
      CGFloat v8 = *(double *)v7;
      CGFloat v9 = *(double *)(v7 + 8);
      CGFloat v10 = *(double *)(v7 + 16);
      CGFloat v11 = *(double *)(v7 + 24);
      CGFloat v12 = *(double *)(v7 + 32);
      CGFloat v13 = *(double *)(v7 + 40);
      CGFloat v14 = *(double *)(v7 + 48);
      CGFloat v15 = *(double *)(v7 + 56);
      CGFloat v46 = *(double *)(v7 + 72);
      CGFloat v47 = *(double *)(v7 + 64);
      CGFloat v44 = *(double *)(v7 + 88);
      CGFloat v45 = *(double *)(v7 + 80);
      CGFloat v42 = *(double *)(v7 + 104);
      CGFloat v43 = *(double *)(v7 + 96);
      CGFloat v40 = *(double *)(v7 + 120);
      CGFloat v41 = *(double *)(v7 + 112);
      sub_24D137B3C(a2, (uint64_t)v52);
      if (sub_24D138854((uint64_t)v52) != 2) {
        goto LABEL_28;
      }
      id v16 = (long long *)nullsub_1(v52);
      long long v17 = *v16;
      long long v18 = v16[1];
      long long v19 = v16[2];
      long long v20 = v16[3];
      long long v21 = v16[4];
      long long v22 = v16[5];
      long long v23 = v16[6];
      long long v24 = v16[7];
      a.CGFloat m11 = v8;
      a.m12 = v9;
      a.m13 = v10;
      a.m14 = v11;
      a.m21 = v12;
      a.m22 = v13;
      a.m23 = v14;
      a.m24 = v15;
      a.m31 = v47;
      a.m32 = v46;
      a.m33 = v45;
      a.m34 = v44;
      a.m41 = v43;
      a.m42 = v42;
      a.m43 = v41;
      a.m44 = v40;
      *(_OWORD *)&b.CGFloat m11 = v17;
      *(_OWORD *)&b.m13 = v18;
      *(_OWORD *)&b.m21 = v19;
      *(_OWORD *)&b.m23 = v20;
      *(_OWORD *)&b.m31 = v21;
      *(_OWORD *)&b.m33 = v22;
      *(_OWORD *)&b.m41 = v23;
      *(_OWORD *)&b.m43 = v24;
      unsigned __int8 v5 = CATransform3DEqualToTransform(&a, &b);
      break;
    case 3u:
      uint64_t v25 = nullsub_1(v53);
      sub_24D12C03C(v25, (uint64_t)&b, &qword_26B1894F0);
      sub_24D12C03C((uint64_t)&b, (uint64_t)&a, &qword_26B1894F0);
      CGFloat m11 = a.m11;
      if (*(void *)&a.m11)
      {
        sub_24D137B3C(a2, (uint64_t)v52);
        if (sub_24D138854((uint64_t)v52) != 3) {
          goto LABEL_28;
        }
        uint64_t v27 = nullsub_1(v52);
        sub_24D12C03C(v27, (uint64_t)v50, &qword_26B1894F0);
        sub_24D12C03C((uint64_t)v50, (uint64_t)&v51, &qword_26B1894F0);
        if (!v51) {
          goto LABEL_28;
        }
        unsigned __int8 v5 = objc_msgSend(*(id *)&m11, sel_isEqual_);
      }
      else
      {
        sub_24D137B3C(a2, (uint64_t)v52);
        if (sub_24D138854((uint64_t)v52) != 3) {
          goto LABEL_28;
        }
        uint64_t v38 = nullsub_1(v52);
        sub_24D12C03C(v38, (uint64_t)v50, &qword_26B1894F0);
        sub_24D12C03C((uint64_t)v50, (uint64_t)&v51, &qword_26B1894F0);
        unsigned __int8 v5 = v51 == 0;
      }
      break;
    case 4u:
      uint64_t v28 = *(void *)nullsub_1(v53);
      sub_24D137B3C(a2, (uint64_t)v52);
      if (sub_24D138854((uint64_t)v52) != 4) {
        goto LABEL_28;
      }
      uint64_t v29 = *(void *)nullsub_1(v52);
      if (v28)
      {
        if (!v29) {
          goto LABEL_28;
        }
        sub_24D114FEC(0, (unint64_t *)&qword_269858310);
        sub_24D1387B0(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D137FBC);
        sub_24D1387B0(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D137FBC);
        unsigned __int8 v5 = sub_24D149378();
        sub_24D1387B0(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13810C);
        sub_24D1387B0(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D13810C);
      }
      else
      {
        if (v29) {
          goto LABEL_28;
        }
        sub_24D1387B0(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D137FBC);
        sub_24D1387B0(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D137FBC);
        unsigned __int8 v5 = 1;
      }
      break;
    case 5u:
      uint64_t v30 = *(void *)nullsub_1(v53);
      sub_24D137B3C(a2, (uint64_t)v52);
      if (sub_24D138854((uint64_t)v52) != 5) {
        goto LABEL_28;
      }
      unsigned __int8 v5 = v30 == *(void *)nullsub_1(v52);
      break;
    case 6u:
      uint64_t v31 = (double *)nullsub_1(v53);
      double v33 = *v31;
      double v32 = v31[1];
      double v35 = v31[2];
      double v34 = v31[3];
      sub_24D137B3C(a2, (uint64_t)v52);
      if (sub_24D138854((uint64_t)v52) != 6) {
        goto LABEL_28;
      }
      id v36 = (double *)nullsub_1(v52);
      if (v33 != *v36) {
        goto LABEL_28;
      }
      BOOL v37 = v32 == v36[1];
      if (v35 != v36[2]) {
        BOOL v37 = 0;
      }
      unsigned __int8 v5 = v34 == v36[3] && v37;
      break;
    default:
      char v4 = *(unsigned char *)nullsub_1(v53);
      sub_24D137B3C(a2, (uint64_t)v52);
      if (sub_24D138854((uint64_t)v52)) {
LABEL_28:
      }
        unsigned __int8 v5 = 0;
      else {
        unsigned __int8 v5 = ((v4 & 1) == 0) ^ *(unsigned char *)nullsub_1(v52);
      }
      break;
  }
  return v5 & 1;
}

uint64_t sub_24D1387B0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 128);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), v4);
  return a1;
}

id sub_24D13881C(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned __int8 a17)
{
  if (a17 != 255) {
    return sub_24D137FBC(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
  }
  return result;
}

uint64_t sub_24D138854(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

id sub_24D13885C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryOutsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_24D138894(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryOutsets_, *a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_24D1388AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D137410(a1, a2);
}

uint64_t sub_24D1388B4(uint64_t result)
{
  *(unsigned char *)(result + 128) = 6;
  return result;
}

void destroy for KnownValue(uint64_t a1)
{
}

uint64_t initializeWithCopy for KnownValue(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  char v20 = *(unsigned char *)(a2 + 128);
  sub_24D137FBC(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(unsigned char *)(a1 + 128) = v20;
  return a1;
}

uint64_t assignWithCopy for KnownValue(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  char v34 = *(unsigned char *)(a2 + 128);
  sub_24D137FBC(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34);
  CGFloat v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 120);
  char v25 = *(unsigned char *)(a1 + 128);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 80) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 120) = v33;
  *(unsigned char *)(a1 + 128) = v34;
  sub_24D13810C(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25);
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for KnownValue(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 128);
  long long v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 120);
  char v17 = *(unsigned char *)(a1 + 128);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  long long v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(unsigned char *)(a1 + 128) = v3;
  sub_24D13810C(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for KnownValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 129)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 128);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for KnownValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)__n128 result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 129) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 129) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 128) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24D138CD4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 128) = a2;
  return result;
}

ValueMetadata *type metadata accessor for KnownValue()
{
  return &type metadata for KnownValue;
}

void sub_24D138D1C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80);
  if (v2 != 255)
  {
    id v3 = *(id *)v1;
    uint64_t v4 = *(void *)(v1 + 8);
    uint64_t v5 = *(void *)(v1 + 16);
    uint64_t v59 = *(void *)(v1 + 72);
    uint64_t v60 = *(void *)(v1 + 64);
    uint64_t v65 = *(void *)(v1 + 56);
    uint64_t v66 = *(void *)(v1 + 24);
    uint64_t v62 = *(void *)(v1 + 40);
    uint64_t v63 = *(void *)(v1 + 32);
    uint64_t v61 = *(void *)(v1 + 48);
    sub_24D123FFC(*(id *)v1, v4, v5, v66, v63, v62, v61, v65, v60, v59, v2);
    unint64_t v6 = sub_24D12885C();
    unint64_t v51 = v6;
    if (v6 >> 62) {
      goto LABEL_44;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = sub_24D149468())
    {
      uint64_t v8 = 0;
      int v56 = v2;
      uint64_t v54 = v4;
      uint64_t v55 = v3;
      uint64_t v52 = v7;
      uint64_t v53 = v5;
      while ((v51 & 0xC000000000000001) != 0)
      {
        uint64_t v11 = (char *)MEMORY[0x25331E4B0](v8, v51);
        BOOL v12 = __OFADD__(v8, 1);
        uint64_t v13 = v8 + 1;
        if (v12) {
          goto LABEL_43;
        }
LABEL_14:
        uint64_t v57 = v13;
        double v58 = v11;
        uint64_t v14 = (uint64_t)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
        uint64_t v71 = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 8];
        unint64_t v72 = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
        *(_OWORD *)uint64_t v68 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 16];
        *(void *)&v68[16] = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 32];
        *(void *)&v68[24] = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 40];
        uint64_t v69 = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 48];
        uint64_t v64 = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 56];
        uint64_t v67 = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 64];
        uint64_t v70 = *(void *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 72];
        int v73 = v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80];
        *(void *)uint64_t v14 = v3;
        *(void *)(v14 + 8) = v4;
        *(void *)(v14 + 16) = v5;
        *(void *)(v14 + 24) = v66;
        *(void *)(v14 + 32) = v63;
        *(void *)(v14 + 40) = v62;
        *(void *)(v14 + 48) = v61;
        *(void *)(v14 + 56) = v65;
        *(void *)(v14 + 64) = v60;
        *(void *)(v14 + 72) = v59;
        *(unsigned char *)(v14 + 80) = v2;
        sub_24D12BF90(v3, v4, v5, v66, v63, v62, v61, v65, v60, v59, v2);
        sub_24D12BF90(v3, v4, v5, v66, v63, v62, v61, v65, v60, v59, v2);
        sub_24D123FFC((id)v72, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, v73);
        sub_24D12BF7C((id)v72, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, v73);
        uint64_t v16 = *(void **)v14;
        double v15 = *(double *)(v14 + 8);
        uint64_t v17 = *(void *)(v14 + 16);
        uint64_t v18 = *(void *)(v14 + 24);
        uint64_t v19 = *(void *)(v14 + 32);
        uint64_t v20 = *(void *)(v14 + 40);
        uint64_t v21 = *(void *)(v14 + 56);
        uint64_t v22 = *(void *)(v14 + 64);
        uint64_t v23 = *(void *)(v14 + 72);
        if (!*(unsigned char *)(v14 + 80))
        {
          uint64_t v24 = (void *)MEMORY[0x263F8EED0];
          char v25 = v58;
          if (!v73 && *(float *)&v16 == *(float *)&v72)
          {
            v28.i64[0] = *(void *)(v14 + 56);
            v28.i64[1] = __PAIR64__(v23, HIDWORD(v22));
            v29.i64[0] = __PAIR64__(HIDWORD(v16), LODWORD(v15));
            v29.i64[1] = __PAIR64__(v17, HIDWORD(v15));
            v30.i64[0] = __PAIR64__(v20, HIDWORD(v19));
            v30.i64[1] = *(void *)(v14 + 48);
            v31.i64[0] = __PAIR64__(v18, HIDWORD(v17));
            v31.i64[1] = __PAIR64__(v19, HIDWORD(v18));
            v32.i64[0] = __PAIR64__(HIDWORD(v72), v71);
            v32.i64[1] = __PAIR64__(*(unsigned int *)v68, HIDWORD(v71));
            v33.i64[0] = *(void *)&v68[20];
            v33.i64[1] = v69;
            v34.i64[0] = v64;
            v34.i64[1] = __PAIR64__(v70, HIDWORD(v67));
            if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v29, v32), (int16x8_t)vceqq_f32(v31, *(float32x4_t *)&v68[4])), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v30, v33), (int16x8_t)vceqq_f32(v28, v34))), 7uLL))) & 1) != 0&& *((float *)&v23 + 1) == *((float *)&v70 + 1))
            {
              goto LABEL_39;
            }
          }
          goto LABEL_32;
        }
        uint64_t v24 = (void *)MEMORY[0x263F8EED0];
        if (*(unsigned char *)(v14 + 80) == 1)
        {
          char v25 = v58;
          if (v73 != 1) {
            goto LABEL_32;
          }
          if (!v16)
          {
            if (!v72)
            {
              uint64_t v42 = *(void *)(v14 + 8);
              uint64_t v46 = *(void *)(v14 + 16);
              uint64_t v43 = *(void *)(v14 + 32);
              uint64_t v44 = *(void *)(v14 + 48);
              sub_24D123FFC(0, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, 1);
              sub_24D123FFC(0, v42, v46, v18, v43, v20, v44, v21, v22, v23, 1);
              int v2 = v56;
              uint64_t v4 = v54;
              id v3 = v55;
              uint64_t v5 = v53;
              sub_24D12C00C(v55, v54, v53, v66, v63, v62, v61, v65, v60, v59, v56);
              sub_24D12BF7C(0, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, 1);
              goto LABEL_40;
            }
            goto LABEL_32;
          }
          if (!v72) {
            goto LABEL_32;
          }
          uint64_t v48 = *(void *)(v14 + 8);
          uint64_t v49 = *(void *)(v14 + 48);
          uint64_t v50 = *(void *)(v14 + 32);
          uint64_t v47 = *(void *)(v14 + 24);
          uint64_t v26 = *(void *)(v14 + 16);
          sub_24D139F98();
          uint64_t v45 = v23;
          sub_24D123FFC((id)v72, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, 1);
          sub_24D123FFC(v16, v48, v26, v47, v50, v20, v49, v21, v22, v23, 1);
          char v27 = sub_24D149378();
          sub_24D12BF7C((id)v72, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, 1);
          sub_24D12BF7C(v16, v48, v26, v47, v50, v20, v49, v21, v22, v45, 1);
          if ((v27 & 1) == 0) {
            goto LABEL_32;
          }
LABEL_39:
          int v2 = v56;
          uint64_t v4 = v54;
          id v3 = v55;
          uint64_t v5 = v53;
          sub_24D12C00C(v55, v54, v53, v66, v63, v62, v61, v65, v60, v59, v56);
          sub_24D12BF7C((id)v72, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, v73);
LABEL_40:
          uint64_t v8 = v57;

          if (v57 == v52) {
            goto LABEL_45;
          }
        }
        else
        {
          char v25 = v58;
          if (v73 == 2
            && (v72 & 1) != ((*(void *)v14 & 1) == 0)
            && ((v72 >> 8) & 1) != ((*(void *)v14 & 0x100) == 0)
            && v15 == *(double *)&v71)
          {
            goto LABEL_39;
          }
LABEL_32:
          double v35 = &v25[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          uint64_t v36 = *(void *)(*(void *)v35 + 16);
          if (v36)
          {
            uint64_t v37 = *(void *)v35 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_24D12C2A0(v37, (uint64_t)v74);
              uint64_t v38 = MEMORY[0x25331EC50](v74);
              if (v38)
              {
                id v39 = (void *)v38;
                sub_24D12406C(v14, (uint64_t)v75);
                CGFloat v40 = *(void (**)(char *, unsigned char *))((*v24 & *v39) + 0xF0);
                sub_24D139F3C((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
                v40(v25, v75);
                sub_24D139F3C((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
              }
              sub_24D13796C((uint64_t)v74);
              v37 += 8;
              --v36;
            }
            while (v36);
            swift_bridgeObjectRelease_n();
          }
          CGFloat v41 = (void *)MEMORY[0x25331EC50](&v25[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineParticipantView]);
          if (!v41) {
            goto LABEL_39;
          }
          uint64_t v9 = v41;
          if (*(unsigned char *)(v14 + 80) == 2) {
            double v10 = 1.0;
          }
          else {
            double v10 = 0.0;
          }
          objc_msgSend(v41, sel_setAlpha_, v10);

          int v2 = v56;
          uint64_t v4 = v54;
          id v3 = v55;
          uint64_t v5 = v53;
          sub_24D12C00C(v55, v54, v53, v66, v63, v62, v61, v65, v60, v59, v56);
          sub_24D12BF7C((id)v72, v71, *(uint64_t *)v68, *(uint64_t *)&v68[8], *(uint64_t *)&v68[16], *(uint64_t *)&v68[24], v69, v64, v67, v70, v73);

          uint64_t v8 = v57;
          if (v57 == v52) {
            goto LABEL_45;
          }
        }
      }
      uint64_t v11 = (char *)*(id *)(v51 + 32 + 8 * v8);
      BOOL v12 = __OFADD__(v8, 1);
      uint64_t v13 = v8 + 1;
      if (!v12) {
        goto LABEL_14;
      }
LABEL_43:
      __break(1u);
LABEL_44:
      swift_bridgeObjectRetain();
    }
LABEL_45:
    swift_bridgeObjectRelease_n();
    sub_24D12C00C(v3, v4, v5, v66, v63, v62, v61, v65, v60, v59, v2);
  }
}

void sub_24D1395D0(double a1, double a2)
{
  id v3 = (double *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth);
  double v4 = *(double *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth);
  double v5 = *(double *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth + 8);
  *id v3 = a1;
  v3[1] = a2;
  if (v4 != a1 || v5 != a2)
  {
    uint64_t v7 = (double *)(*(void *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView)
                  + OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth);
    double v8 = *v7;
    double v9 = v7[1];
    *uint64_t v7 = a1;
    v7[1] = a2;
    if (v8 != a1 || v9 != a2)
    {
      uint64_t v11 = sub_24D12A19C();
      sub_24D12C498(*v7);

      BOOL v12 = sub_24D12A19C();
      sub_24D12C588(v7[1]);
    }
  }
}

char *sub_24D1396A4(double a1, double a2, double a3, double a4)
{
  double v9 = &v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  *(void *)double v9 = 0;
  v9[8] = 1;
  double v10 = &v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference];
  *(_OWORD *)double v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v10[32] = 1;
  uint64_t v11 = &v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *((_OWORD *)v11 + 4) = 0u;
  v11[80] = -1;
  uint64_t v12 = OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth;
  uint64_t v13 = qword_26B188F60;
  uint64_t v14 = v4;
  if (v13 != -1) {
    swift_once();
  }
  *(_OWORD *)&v14[v12] = xmmword_26B189C00;
  *(void *)&v14[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions] = 0;
  BSRectWithSize();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v15, v17, v19, v21);
  *(void *)&v14[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView] = v23;
  id v24 = objc_allocWithZone((Class)type metadata accessor for DropletGroupView());
  *(void *)&v14[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView] = sub_24D128ED0(v23, v16, v18, v20, v22, 0.0);

  v34.receiver = v14;
  v34.super_class = (Class)type metadata accessor for DropletShapeView();
  id v25 = objc_msgSendSuper2(&v34, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v27 = (char *)v25;
  swift_retain();
  float32x4_t v28 = (void *)sub_24D149258();
  v33[4] = sub_24D139F1C;
  v33[5] = v26;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 1107296256;
  v33[2] = sub_24D139AB4;
  v33[3] = &block_descriptor_3;
  float32x4_t v29 = _Block_copy(v33);
  id v30 = objc_msgSend(self, sel_assertionWithIdentifier_stateDidChangeHandler_, v28, v29);

  _Block_release(v29);
  swift_release();
  swift_release();
  float32x4_t v31 = *(void **)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  *(void *)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions] = v30;

  objc_msgSend(v27, sel_addSubview_, *(void *)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView]);
  objc_msgSend(v27, sel_addSubview_, *(void *)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]);

  return v27;
}

void sub_24D1399C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25331EC50](v2);
  if (v3)
  {
    double v4 = (char *)v3;
    double v5 = *(void **)(v3 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
    if (v5)
    {
      unint64_t v6 = *(void **)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
      uint64_t v7 = objc_msgSend(v5, sel_isActive) ^ 1;
      id v8 = objc_msgSend(v6, sel_layer);
      objc_msgSend(v8, sel_setShouldRasterize_, v7);

      double v9 = sub_24D12A1A8();
      id v10 = objc_msgSend(v9, sel_layer);

      objc_msgSend(v10, sel_setShouldRasterize_, v7);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_24D139AB4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_24D139B60()
{
  id result = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    v2.receiver = v0;
    v2.super_class = (Class)type metadata accessor for DropletShapeView();
    return objc_msgSendSuper2(&v2, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24D139CB0()
{
  uint64_t v1 = v0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for DropletShapeView();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  uint64_t v3 = sub_24D12A1A8();
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);

  double v4 = *(void **)&v1[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView];
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
  objc_msgSend(v1, sel_bounds);
  return objc_msgSend(v2, sel_setFrame_);
}

uint64_t type metadata accessor for DropletShapeView()
{
  return self;
}

void sub_24D139DE0()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  *(void *)uint64_t v1 = 0;
  v1[8] = 1;
  objc_super v2 = &v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference];
  *(_OWORD *)objc_super v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  uint64_t v3 = &v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[80] = -1;
  uint64_t v4 = OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth;
  if (qword_26B188F60 != -1) {
    swift_once();
  }
  *(_OWORD *)&v0[v4] = xmmword_26B189C00;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions] = 0;

  sub_24D149448();
  __break(1u);
}

uint64_t sub_24D139EE4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D139F1C(uint64_t a1)
{
  sub_24D1399C0(a1, v1);
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

uint64_t sub_24D139F3C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 80);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), v4);
  return a1;
}

unint64_t sub_24D139F98()
{
  unint64_t result = qword_269858310;
  if (!qword_269858310)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269858310);
  }
  return result;
}

void sub_24D139FD8(float *a1)
{
  uint64_t v2 = &v1[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
  if (*(float *)&v1[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix] != *a1
    || *((float *)v2 + 1) != a1[1]
    || *((float *)v2 + 2) != a1[2]
    || *((float *)v2 + 3) != a1[3]
    || *((float *)v2 + 4) != a1[4]
    || *((float *)v2 + 5) != a1[5]
    || *((float *)v2 + 6) != a1[6]
    || *((float *)v2 + 7) != a1[7]
    || *((float *)v2 + 8) != a1[8]
    || *((float *)v2 + 9) != a1[9]
    || *((float *)v2 + 10) != a1[10]
    || *((float *)v2 + 12) != a1[12]
    || *((float *)v2 + 13) != a1[13]
    || *((float *)v2 + 14) != a1[14]
    || *((float *)v2 + 15) != a1[15]
    || *((float *)v2 + 17) != a1[17]
    || *((float *)v2 + 18) != a1[18]
    || *((float *)v2 + 19) != a1[19])
  {
    id v3 = objc_msgSend(v1, sel_layer);
    long long v9 = *((_OWORD *)v2 + 1);
    long long v7 = *((_OWORD *)v2 + 3);
    long long v8 = *((_OWORD *)v2 + 2);
    long long v6 = *((_OWORD *)v2 + 4);
    v10[0] = *(_OWORD *)v2;
    v10[1] = v9;
    _OWORD v10[2] = v8;
    _OWORD v10[3] = v7;
    v10[4] = v6;
    id v4 = objc_msgSend(self, sel_valueWithCAColorMatrix_, v10);
    if (qword_26B189298 != -1) {
      swift_once();
    }
    double v5 = (void *)sub_24D149258();
    objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);
  }
}

char *sub_24D13A254(double a1, double a2, double a3, double a4)
{
  long long v9 = &v4[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
  id v10 = (objc_class *)type metadata accessor for AnimatableAdaptiveColorMatrixView();
  *(_OWORD *)long long v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  v33.receiver = v4;
  v33.super_class = v10;
  uint64_t v11 = (char *)objc_msgSendSuper2(&v33, sel_initWithFrame_, a1, a2, a3, a4);
  id v12 = objc_msgSend(v11, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setAllowsInPlaceFiltering_, 1);

  sub_24D149268();
  id v13 = objc_allocWithZone(MEMORY[0x263F157C8]);
  uint64_t v14 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithType_, v14);

  uint64_t v16 = *MEMORY[0x263F15B40];
  sub_24D149268();
  id v17 = objc_allocWithZone(MEMORY[0x263F157C8]);
  double v18 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_initWithType_, v18);

  long long v31 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 16];
  long long v29 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 48];
  long long v30 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 32];
  long long v28 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 64];
  v32[0] = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
  v32[1] = v31;
  v32[2] = v30;
  v32[3] = v29;
  v32[4] = v28;
  id v20 = objc_msgSend(self, sel_valueWithCAColorMatrix_, v32);
  objc_msgSend(v19, sel_setValue_forKey_, v20, v16);

  id v21 = objc_msgSend(v11, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_24D14B3F0;
  uint64_t v23 = sub_24D114FEC(0, (unint64_t *)&qword_26B189510);
  *(void *)(v22 + 32) = v15;
  *(void *)(v22 + 88) = v23;
  *(void *)(v22 + 56) = v23;
  *(void *)(v22 + 64) = v19;
  id v24 = v15;
  id v25 = v19;
  uint64_t v26 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setFilters_, v26);

  return v11;
}

id sub_24D13A718()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnimatableAdaptiveColorMatrixView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnimatableAdaptiveColorMatrixView()
{
  return self;
}

uint64_t sub_24D13A770()
{
  sub_24D149268();
  sub_24D149298();
  swift_bridgeObjectRelease();
  sub_24D149298();
  sub_24D149268();
  sub_24D149298();
  uint64_t result = swift_bridgeObjectRelease();
  qword_26B189BF0 = 0x2E737265746C6966;
  *(void *)algn_26B189BF8 = 0xE800000000000000;
  return result;
}

uint64_t sub_24D13A814(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24D1494C8();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  long long v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24D1494C8() & 1) != 0) {
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

uint64_t sub_24D13A8DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_24D149468())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x25331E4B0](0, a2);
LABEL_5:
      long long v6 = v5;
      sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
      char v7 = sub_24D149378();

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
        char v14 = sub_24D149378();

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
      MEMORY[0x25331E4B0](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_24D149378();
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

uint64_t DRPDropletContextView.disableDropletEffectFilters.getter()
{
  uint64_t v0 = (char *)sub_24D13AC18();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                          + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);

  return v1;
}

void DRPDropletContextView.disableDropletEffectFilters.setter(char a1)
{
  int v2 = a1 & 1;
  uint64_t v3 = (char *)sub_24D13AC18();
  uint64_t v4 = *(void *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  int v5 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);
  *(unsigned char *)(v4 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters) = a1;
  if (v5 != v2)
  {
    long long v6 = v3;
    sub_24D12ADB4();
    uint64_t v3 = v6;
  }
}

id sub_24D13AC18()
{
  uint64_t v1 = OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView;
  int v2 = *(void **)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DropletShapeView()), sel_initWithFrame_, v4, v5, v6, v7);
    uint64_t v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    int v2 = 0;
  }
  id v10 = v2;
  return v3;
}

uint64_t DRPDropletContextView.boundaryEdges.getter()
{
  uint64_t v0 = (char *)sub_24D13AC18();
  id v1 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  int v2 = v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference + 8];

  if (v2 != 1) {
    return (uint64_t)v1;
  }
  unint64_t v3 = sub_24D13B074();
  unint64_t v4 = v3;
  if (!(v3 >> 62))
  {
    uint64_t result = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t result = sub_24D149468();
  if (!result) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x25331E4B0](0, v4);
    goto LABEL_7;
  }
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v4 + 32);
LABEL_7:
    double v7 = v6;
    swift_bridgeObjectRelease();
    id v1 = objc_msgSend(v7, sel_boundaryEdges);

    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

void DRPDropletContextView.boundaryEdges.setter(uint64_t a1)
{
  int v2 = (char *)sub_24D13AC18();
  unint64_t v3 = &v2[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  *(void *)unint64_t v3 = a1;
  v3[8] = 0;
  id v21 = v2;
  unint64_t v4 = sub_24D12885C();
  unint64_t v5 = v4;
  if (v4 >> 62) {
    goto LABEL_20;
  }
  uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_24D149468())
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 & 0xC000000000000001;
    unint64_t v23 = v5 + 32;
    uint64_t v9 = (void *)MEMORY[0x263F8EED0];
    uint64_t v22 = v6;
    unint64_t v24 = v5 & 0xC000000000000001;
    while (1)
    {
      id v10 = v8 ? (char *)MEMORY[0x25331E4B0](v7, v5) : (char *)*(id *)(v23 + 8 * v7);
      char v11 = v10;
      if (__OFADD__(v7++, 1)) {
        break;
      }
      uint64_t v13 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges;
      uint64_t v14 = *(void *)&v10[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
      *(void *)&v10[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = a1;
      if (v14 == a1)
      {

        if (v7 == v6) {
          goto LABEL_18;
        }
      }
      else
      {
        id v15 = &v10[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
        swift_beginAccess();
        uint64_t v16 = *(void *)(*(void *)v15 + 16);
        if (v16)
        {
          unint64_t v17 = v5;
          uint64_t v18 = *(void *)v15 + 32;
          swift_bridgeObjectRetain_n();
          do
          {
            sub_24D12C2A0(v18, (uint64_t)v25);
            id v19 = (void *)MEMORY[0x25331EC50](v25);
            if (v19)
            {
              id v20 = v19;
              (*(void (**)(char *, void))((*v9 & *v19) + 0xC8))(v11, *(void *)&v11[v13]);
            }
            sub_24D13796C((uint64_t)v25);
            v18 += 8;
            --v16;
          }
          while (v16);

          swift_bridgeObjectRelease_n();
          unint64_t v5 = v17;
          uint64_t v6 = v22;
        }
        else
        {
        }
        unint64_t v8 = v24;
        if (v7 == v6) {
          goto LABEL_18;
        }
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease_n();
}

uint64_t sub_24D13B074()
{
  id v0 = sub_24D13D3CC();
  id v1 = objc_msgSend(v0, sel_subviews);

  sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
  unint64_t v2 = sub_24D1492C8();

  uint64_t v9 = MEMORY[0x263F8EE78];
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease();
    return v8;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24D149468();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x25331E4B0](i, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * i + 32);
      }
      uint64_t v7 = v6;
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x25331E390]();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24D1492E8();
        }
        sub_24D1492F8();
        sub_24D1492D8();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v8 = v9;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

double DRPDropletContextView.dropletRadius.getter()
{
  id v0 = (char *)sub_24D13AC18();
  double v1 = *(double *)(*(void *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);

  return v1;
}

void DRPDropletContextView.dropletRadius.setter(double a1)
{
  unint64_t v2 = (char *)sub_24D13AC18();
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  uint64_t v4 = OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence;
  double v5 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  *(double *)(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence) = a1;
  if (v5 == a1)
  {
  }
  else
  {
    id v28 = v2;
    sub_24D12C03C(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v33, &qword_26B189100);
    sub_24D12C03C((uint64_t)v33, (uint64_t)v34, &qword_26B189100);
    sub_24D12C02C(v34);
    unint64_t v6 = sub_24D12885C();
    unint64_t v7 = v6;
    if (v6 >> 62) {
      goto LABEL_24;
    }
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v8; uint64_t v8 = sub_24D149468())
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7 & 0xC000000000000001;
      unint64_t v32 = v7 + 32;
      char v11 = (void *)MEMORY[0x263F8EED0];
      uint64_t v29 = v4;
      unint64_t v30 = v7 & 0xC000000000000001;
      uint64_t v31 = v3;
      while (1)
      {
        unint64_t v12 = v10 ? (char *)MEMORY[0x25331E4B0](v9, v7) : (char *)*(id *)(v32 + 8 * v9);
        uint64_t v13 = v12;
        if (__OFADD__(v9++, 1)) {
          break;
        }
        double v15 = *(double *)(v3 + v4);
        uint64_t v16 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence;
        double v17 = *(double *)&v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
        *(double *)&v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v15;
        if (v15 == v17)
        {

          if (v9 == v8) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v18 = v8;
          unint64_t v19 = v7;
          id v20 = &v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          uint64_t v21 = *(void *)(*(void *)v20 + 16);
          if (v21)
          {
            uint64_t v22 = *(void *)v20 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_24D12C2A0(v22, (uint64_t)v33);
              unint64_t v23 = (void *)MEMORY[0x25331EC50](v33);
              if (v23)
              {
                unint64_t v24 = v23;
                (*(void (**)(double))((*v11 & *v23) + 0x68))(*(double *)&v13[v16]);
              }
              sub_24D13796C((uint64_t)v33);
              v22 += 8;
              --v21;
            }
            while (v21);

            swift_bridgeObjectRelease_n();
            uint64_t v4 = v29;
          }
          else
          {
          }
          unint64_t v7 = v19;
          uint64_t v8 = v18;
          unint64_t v10 = v30;
          uint64_t v3 = v31;
          if (v9 == v8) {
            goto LABEL_22;
          }
        }
      }
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
    }
LABEL_22:
    swift_bridgeObjectRelease_n();
    id v25 = sub_24D12A19C();
    sub_24D114348(*(double *)(v3 + v4));

    uint64_t v26 = sub_24D12A36C();
    sub_24D114348(*(double *)(v3 + v4));

    char v27 = sub_24D12A1A8();
    sub_24D114348(*(double *)(v3 + v4));
  }
}

void *DRPDropletContextView.dropletColor.getter()
{
  double v1 = (void **)(v0 + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void DRPDropletContextView.dropletColor.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;
  sub_24D13B7D4(v4);
}

void sub_24D13B7D4(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = (void **)&v2[OBJC_IVAR___DRPDropletContextView_dropletColor];
  swift_beginAccess();
  id v5 = *v4;
  if (*v4)
  {
    if (a1)
    {
      sub_24D114FEC(0, (unint64_t *)&qword_269858310);
      id v6 = a1;
      id v7 = v5;
      char v8 = sub_24D149378();

      if (v8) {
        return;
      }
    }
  }
  else if (!a1)
  {
    return;
  }
  id v9 = sub_24D13AC18();
  unint64_t v10 = *v4;
  if (*v4)
  {
    id v11 = *v4;
  }
  else
  {
    id v11 = objc_msgSend(self, sel_blackColor);
    unint64_t v10 = 0;
  }
  id v12 = v10;
  id v13 = objc_msgSend(v2, sel_traitCollection);
  id v14 = objc_msgSend(v11, sel_resolvedColorWithTraitCollection_, v13);

  id v15 = objc_msgSend(v14, sel_CGColor);
  sub_24D1286C4(v15);
}

uint64_t DRPDropletContextView.keylineStyle.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t DRPDropletContextView.keylineStyle.setter(uint64_t a1)
{
  id v3 = &v1[OBJC_IVAR___DRPDropletContextView_keylineStyle];
  swift_beginAccess();
  *(void *)id v3 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  objc_msgSend(v1, sel_applyKeylineStyle_forContainerView_, *(void *)v3, 0);
  return swift_unknownObjectRelease();
}

uint64_t DRPDropletContextView.applyKeylineStyle(_:for:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!a1) {
    goto LABEL_11;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    id v5 = (void *)v4;
    swift_unknownObjectRetain_n();
    id v6 = sub_24D13AC18();
    objc_msgSend(v5, sel_innerWidth);
    double v8 = v7;
    objc_msgSend(v5, sel_outerWidth);
    sub_24D1395D0(v8, v9);

    unint64_t v10 = (char *)sub_24D13AC18();
    id v11 = (char *)*(id *)&v10[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

    id v12 = sub_24D12A19C();
    id v13 = objc_msgSend(v12, sel_layer);
    unsigned int v14 = objc_msgSend(v13, sel_softRim);

    if (v14) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
  self;
  uint64_t v15 = swift_dynamicCastObjCClass();
  if (v15)
  {
    id v5 = (void *)v15;
    swift_unknownObjectRetain_n();
    id v16 = sub_24D13AC18();
    objc_msgSend(v5, sel_innerWidth);
    double v18 = v17;
    objc_msgSend(v5, sel_outerWidth);
    sub_24D1395D0(v18, v19);

    id v20 = (char *)sub_24D13AC18();
    id v11 = (char *)*(id *)&v20[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

    id v12 = sub_24D12A19C();
    id v21 = objc_msgSend(v12, sel_layer);
    unsigned int v22 = objc_msgSend(v21, sel_softRim);

    if (v22)
    {
LABEL_7:
      id v23 = objc_msgSend(v12, sel_layer);
      objc_msgSend(v23, sel_setSoftRim_, 0);
      swift_unknownObjectRelease();

LABEL_14:
      id v11 = v12;
      id v12 = (char *)v23;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  self;
  uint64_t v24 = swift_dynamicCastObjCClass();
  if (!v24)
  {
LABEL_11:
    unint64_t v51 = (unint64_t)sub_24D13AC18();
    if (qword_26B188F60 != -1) {
      goto LABEL_84;
    }
    goto LABEL_12;
  }
  id v5 = (void *)v24;
  swift_unknownObjectRetain_n();
  id v25 = sub_24D13AC18();
  objc_msgSend(v5, sel_innerWidth);
  double v27 = v26;
  objc_msgSend(v5, sel_outerWidth);
  sub_24D1395D0(v27, v28);

  id v29 = sub_24D13AC18();
  objc_msgSend(v5, sel_keylineInputEnd);
  uint64_t v31 = v30;
  objc_msgSend(v5, sel_keylineInputStart);
  uint64_t v33 = v32;
  objc_msgSend(v5, sel_keylineInputEnd);
  uint64_t v35 = v34;
  uint64_t v36 = sub_24D12A36C();
  uint64_t v37 = &v36[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect];
  uint64_t v38 = *(void *)&v36[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 8];
  CGFloat v40 = *(void **)&v36[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 16];
  unsigned __int8 v41 = v36[OBJC_IVAR____TtC9DropletUI17DropletEffectView_effect + 24];
  *(void *)uint64_t v37 = v31;
  *((void *)v37 + 1) = v33;
  *((void *)v37 + 2) = v35;
  v37[24] = 1;
  sub_24D12D6C4(v38, v39, v40, v41);

  id v42 = sub_24D13AC18();
  objc_msgSend(v5, sel_keylineBlurRadius);
  double v44 = v43;
  id v45 = sub_24D12A2B8();
  sub_24D114348(v44);

  uint64_t v46 = (char *)sub_24D13AC18();
  id v11 = (char *)*(id *)&v46[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

  id v47 = objc_msgSend(v5, sel_softRim);
  id v12 = sub_24D12A19C();
  id v48 = objc_msgSend(v12, sel_layer);
  unsigned int v49 = objc_msgSend(v48, sel_softRim);

  if (v47 != v49)
  {
    id v50 = objc_msgSend(v12, sel_layer);
    objc_msgSend(v50, sel_setSoftRim_, v47);
    swift_unknownObjectRelease();

    id v11 = v12;
    id v12 = (char *)v50;
    goto LABEL_17;
  }
LABEL_15:
  swift_unknownObjectRelease();
  while (1)
  {
LABEL_17:

    if (a2)
    {
      type metadata accessor for DRPDropletContainerView();
      uint64_t v55 = (double *)(id)a2;
      sub_24D149458();

      int v56 = (uint64_t **)((char *)v55 + OBJC_IVAR___DRPDropletContainerView_participantViews);
      swift_beginAccess();
      unint64_t v51 = (unint64_t)*v56;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (!(v51 >> 62)) {
        goto LABEL_19;
      }
      goto LABEL_71;
    }
    uint64_t v61 = (char *)sub_24D13AC18();
    id v136 = v3;
    double v123 = v5;
    if (!v3)
    {
      id v63 = 0;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      goto LABEL_30;
    }
    self;
    uint64_t v62 = (void *)swift_dynamicCastObjCClass();
    if (v62)
    {
      id v63 = objc_msgSend(v62, sel_color);
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      id v3 = 0;
LABEL_30:
      uint64_t v67 = 0;
      uint64_t v68 = 0;
LABEL_31:
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      uint64_t v71 = 0;
      char v72 = 1;
      goto LABEL_32;
    }
    self;
    uint64_t v117 = (void *)swift_dynamicCastObjCClass();
    if (v117)
    {
      objc_msgSend(v117, sel_adaptiveColorMatrix);
      char v72 = 0;
      id v63 = v141;
      uint64_t v64 = v142;
      uint64_t v65 = v143;
      uint64_t v66 = v144;
      id v3 = v145;
      uint64_t v67 = v146;
      uint64_t v68 = v147;
      uint64_t v69 = v148;
      uint64_t v70 = v149;
      uint64_t v71 = v150;
    }
    else
    {
      self;
      uint64_t v68 = (void *)swift_dynamicCastObjCClass();
      if (!v68)
      {
        id v63 = 0;
        uint64_t v64 = 0;
        uint64_t v65 = 0;
        uint64_t v66 = 0;
        id v3 = 0;
        uint64_t v67 = 0;
        goto LABEL_31;
      }
      swift_unknownObjectRetain();
      unsigned int v118 = objc_msgSend(v68, sel_preferAudioReactivity);
      unsigned int v119 = objc_msgSend(v68, sel_screenBlendMode);
      objc_msgSend(v68, sel_alpha);
      uint64_t v121 = v120;
      swift_unknownObjectRelease();
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      id v3 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      uint64_t v71 = 0;
      uint64_t v122 = 256;
      if (!v119) {
        uint64_t v122 = 0;
      }
      id v63 = (id)(v122 | v118);
      uint64_t v64 = v121;
      char v72 = 2;
    }
LABEL_32:
    uint64_t v124 = v71;
    uint64_t v125 = v70;
    int v73 = &v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
    v137 = *(void **)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
    id v139 = v61;
    uint64_t v133 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 16];
    uint64_t v134 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 8];
    uint64_t v131 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 32];
    uint64_t v132 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 24];
    uint64_t v129 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 48];
    uint64_t v130 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 40];
    uint64_t v127 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 64];
    uint64_t v128 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 56];
    uint64_t v126 = *(void *)&v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 72];
    unsigned __int8 v74 = v61[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80];
    *(void *)int v73 = v63;
    *((void *)v73 + 1) = v64;
    *((void *)v73 + 2) = v65;
    *((void *)v73 + 3) = v66;
    *((void *)v73 + 4) = v3;
    *((void *)v73 + 5) = v67;
    *((void *)v73 + 6) = v68;
    *((void *)v73 + 7) = v69;
    *((void *)v73 + 8) = v70;
    *((void *)v73 + 9) = v71;
    v73[80] = v72;
    a2 = v65;
    char v75 = v72;
    sub_24D123FFC(v63, v64, v65, v66, (uint64_t)v3, v67, (uint64_t)v68, v69, v70, v71, v72);
    sub_24D12C00C(v137, v134, v133, v132, v131, v130, v129, v128, v127, v126, v74);
    sub_24D138D1C();
    sub_24D12BF7C(v63, v64, a2, v66, (uint64_t)v3, v67, (uint64_t)v68, v69, v125, v124, v75);

    uint64_t v76 = (char *)sub_24D13AC18();
    if (v136)
    {
      objc_msgSend(v136, sel_keylineFadeLengths);
      double v78 = v77;
      double v80 = v79;
      double v82 = v81;
      double v84 = v83;
    }
    else
    {
      double v78 = *MEMORY[0x263F834E8];
      double v80 = *(double *)(MEMORY[0x263F834E8] + 8);
      double v82 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v84 = *(double *)(MEMORY[0x263F834E8] + 24);
    }
    char v85 = (double *)&v76[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference];
    double *v85 = v78;
    v85[1] = v80;
    v85[2] = v82;
    v85[3] = v84;
    *((unsigned char *)v85 + 32) = 0;
    unint64_t v86 = sub_24D12885C();
    unint64_t v87 = v86;
    uint64_t v135 = v76;
    if (v86 >> 62) {
      break;
    }
    uint64_t v88 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v88) {
      goto LABEL_61;
    }
LABEL_37:
    uint64_t v89 = 0;
    unint64_t v90 = v87 & 0xC000000000000001;
    unint64_t v140 = v87 + 32;
    unint64_t v51 = (unint64_t)&OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths;
    uint64_t v91 = (void *)MEMORY[0x263F8EED0];
    unint64_t v138 = v87 & 0xC000000000000001;
    while (1)
    {
      uint64_t v92 = v90 ? (char *)MEMORY[0x25331E4B0](v89, v87) : (char *)*(id *)(v140 + 8 * v89);
      uint64_t v93 = v92;
      if (__OFADD__(v89++, 1)) {
        break;
      }
      a2 = (uint64_t)&v92[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
      double v95 = *(double *)&v92[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
      double v96 = *(double *)&v92[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 8];
      double v97 = *(double *)&v92[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
      double v98 = *(double *)&v92[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 24];
      *(double *)a2 = v78;
      *(double *)(a2 + 8) = v80;
      *(double *)(a2 + 16) = v82;
      *(double *)(a2 + 24) = v84;
      if (v78 == v95 && v80 == v96 && v82 == v97 && v84 == v98)
      {

        if (v89 == v88) {
          goto LABEL_61;
        }
      }
      else
      {
        uint64_t v102 = &v92[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
        swift_beginAccess();
        id v3 = *(void **)v102;
        uint64_t v103 = *(void *)(*(void *)v102 + 16);
        if (v103)
        {
          uint64_t v104 = v88;
          unint64_t v105 = v87;
          uint64_t v106 = (uint64_t)v3 + 32;
          swift_bridgeObjectRetain_n();
          do
          {
            sub_24D12C2A0(v106, (uint64_t)v151);
            BOOL v107 = (void *)MEMORY[0x25331EC50](v151);
            if (v107)
            {
              uint64_t v108 = v107;
              (*(void (**)(void *, double, double, double, double))((*v91 & *v107) + 0xE0))(v93, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
            }
            sub_24D13796C((uint64_t)v151);
            v106 += 8;
            --v103;
          }
          while (v103);

          swift_bridgeObjectRelease_n();
          unint64_t v87 = v105;
          uint64_t v88 = v104;
          unint64_t v90 = v138;
        }
        else
        {
        }
        unint64_t v51 = (unint64_t)&OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths;
        if (v89 == v88) {
          goto LABEL_61;
        }
      }
    }
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    swift_once();
LABEL_12:
    sub_24D1395D0(*(double *)&xmmword_26B189C00, *((double *)&xmmword_26B189C00 + 1));

    uint64_t v52 = (char *)sub_24D13AC18();
    id v11 = (char *)*(id *)&v52[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

    id v12 = sub_24D12A19C();
    id v53 = objc_msgSend(v12, sel_layer);
    unsigned int v54 = objc_msgSend(v53, sel_softRim);

    if (v54)
    {
      id v23 = objc_msgSend(v12, sel_layer);
      objc_msgSend(v23, sel_setSoftRim_, 0);

      id v5 = 0;
      goto LABEL_14;
    }
    id v5 = 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v88 = sub_24D149468();
  if (v88) {
    goto LABEL_37;
  }
LABEL_61:
  swift_bridgeObjectRelease_n();

  unint64_t v109 = sub_24D13B074();
  unint64_t v110 = v109;
  unint64_t v152 = MEMORY[0x263F8EE78];
  if (v109 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24D149468();
    uint64_t v111 = result;
  }
  else
  {
    uint64_t v111 = *(void *)((v109 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  id v3 = v136;
  id v5 = v123;
  if (v111)
  {
    if (v111 < 1)
    {
      __break(1u);
      return result;
    }
    a2 = 0;
    do
    {
      if ((v110 & 0xC000000000000001) != 0) {
        uint64_t v113 = (char *)MEMORY[0x25331E4B0](a2, v110);
      }
      else {
        uint64_t v113 = (char *)*(id *)(v110 + 8 * a2 + 32);
      }
      uint64_t v114 = v113;
      ++a2;
      v115 = (unint64_t *)&v113[OBJC_IVAR___DRPDropletContainerView_participantViews];
      swift_beginAccess();
      unint64_t v116 = *v115;
      swift_bridgeObjectRetain();

      sub_24D13E7E8(v116, sub_24D13ED04);
    }
    while (v111 != a2);
    swift_bridgeObjectRelease_n();
    unint64_t v51 = v152;
    if (v152 >> 62) {
      goto LABEL_71;
    }
LABEL_19:
    uint64_t v57 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v57) {
      goto LABEL_72;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRelease_n();
  unint64_t v51 = MEMORY[0x263F8EE78];
  if (!(MEMORY[0x263F8EE78] >> 62)) {
    goto LABEL_19;
  }
LABEL_71:
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_24D149468();
  if (!v57) {
    goto LABEL_72;
  }
LABEL_20:
  if (v57 < 1) {
    goto LABEL_83;
  }
  uint64_t v58 = 0;
  do
  {
    if ((v51 & 0xC000000000000001) != 0) {
      id v59 = (id)MEMORY[0x25331E4B0](v58, v51);
    }
    else {
      id v59 = *(id *)(v51 + 8 * v58 + 32);
    }
    uint64_t v60 = v59;
    ++v58;
    unint64_t v152 = (unint64_t)v59;
    sub_24D13C7A0((uint64_t *)&v152, v3);
  }
  while (v57 != v58);
LABEL_72:

  return swift_bridgeObjectRelease_n();
}

id sub_24D13C7A0(uint64_t *a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = *a1;
  if (a2)
  {
    objc_msgSend(a2, sel_keylineFadeLengths);
  }
  else
  {
    double v4 = *MEMORY[0x263F834E8];
    double v5 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v7 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  double v8 = (double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths);
  double v9 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths);
  double v10 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 8);
  double v11 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16);
  double v12 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 24);
  *double v8 = v4;
  v8[1] = v5;
  v8[2] = v6;
  v8[3] = v7;
  if (v4 != v9 || v5 != v10 || v6 != v11 || v7 != v12)
  {
    id v16 = (uint64_t *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    swift_beginAccess();
    uint64_t v17 = *v16;
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v19 = v17 + 32;
      swift_bridgeObjectRetain();
      id v20 = (void *)MEMORY[0x263F8EED0];
      do
      {
        id v21 = (void *)MEMORY[0x25331EC50](v19);
        if (v21)
        {
          unsigned int v22 = v21;
          (*(void (**)(uint64_t, double, double, double, double))((*v20 & *v21) + 0xE0))(v3, *v8, v8[1], v8[2], v8[3]);
        }
        v19 += 8;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    objc_msgSend(v2, sel_keylineOutsets);
  }
  else
  {
    double v23 = *MEMORY[0x263F834E8];
    double v24 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v25 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v26 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  double v27 = (double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets);
  double v28 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets);
  double v29 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 8);
  double v30 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 16);
  double v31 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 24);
  *double v27 = v23;
  v27[1] = v24;
  v27[2] = v25;
  v27[3] = v26;
  if (v23 != v28 || v24 != v29 || v25 != v30 || v26 != v31)
  {
    uint64_t v35 = (uint64_t *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    swift_beginAccess();
    uint64_t v36 = *v35;
    uint64_t v37 = *(void *)(v36 + 16);
    if (v37)
    {
      uint64_t v38 = v36 + 32;
      swift_bridgeObjectRetain();
      uint64_t v39 = (void *)MEMORY[0x263F8EED0];
      do
      {
        CGFloat v40 = (void *)MEMORY[0x25331EC50](v38);
        if (v40)
        {
          unsigned __int8 v41 = v40;
          (*(void (**)(uint64_t, double, double, double, double))((*v39 & *v40) + 0xE8))(v3, *v27, v27[1], v27[2], v27[3]);
        }
        v38 += 8;
        --v37;
      }
      while (v37);
      swift_bridgeObjectRelease();
    }
  }
  id v120 = v2;
  if (!v2)
  {
    uint64_t v43 = v3;
    id v44 = 0;
    id v45 = 0;
    uint64_t v46 = 0;
    goto LABEL_44;
  }
  self;
  id v42 = (void *)swift_dynamicCastObjCClass();
  if (v42)
  {
    uint64_t v43 = v3;
    id v44 = objc_msgSend(v42, sel_color);
    id v45 = 0;
LABEL_42:
    uint64_t v46 = 0;
    id v2 = 0;
LABEL_44:
    uint64_t v47 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    char v51 = 1;
LABEL_45:
    char v121 = v51;
    goto LABEL_46;
  }
  self;
  double v77 = (void *)swift_dynamicCastObjCClass();
  uint64_t v43 = v3;
  if (!v77)
  {
    self;
    id v45 = (void *)swift_dynamicCastObjCClass();
    if (v45)
    {
      swift_unknownObjectRetain();
      unsigned int v123 = objc_msgSend(v45, sel_preferAudioReactivity);
      unsigned int v99 = objc_msgSend(v45, sel_screenBlendMode);
      objc_msgSend(v45, sel_alpha);
      uint64_t v101 = v100;
      swift_unknownObjectRelease();
      uint64_t v46 = 0;
      id v2 = 0;
      uint64_t v47 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v102 = 256;
      if (!v99) {
        uint64_t v102 = 0;
      }
      id v44 = (id)(v102 | v123);
      id v45 = v101;
      char v51 = 2;
      goto LABEL_45;
    }
    id v44 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v77, sel_adaptiveColorMatrix);
  char v121 = 0;
  id v44 = (id)v128[0];
  id v45 = (void *)v128[1];
  uint64_t v46 = v128[2];
  id v2 = (id)v128[3];
  uint64_t v47 = v128[4];
  uint64_t v48 = v128[7];
  uint64_t v124 = v128[6];
  uint64_t v125 = v128[5];
  uint64_t v49 = v128[8];
  uint64_t v50 = v128[9];
LABEL_46:
  uint64_t v111 = v43;
  uint64_t v52 = v43 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType;
  sub_24D12406C(v52, (uint64_t)v128);
  uint64_t v118 = *(void *)(v52 + 8);
  unsigned int v119 = *(void **)v52;
  uint64_t v116 = *(void *)(v52 + 24);
  uint64_t v117 = *(void *)(v52 + 16);
  uint64_t v114 = *(void *)(v52 + 40);
  uint64_t v115 = *(void *)(v52 + 32);
  uint64_t v112 = *(void *)(v52 + 56);
  uint64_t v113 = *(void *)(v52 + 48);
  uint64_t v110 = *(void *)(v52 + 64);
  uint64_t v109 = *(void *)(v52 + 72);
  char v108 = *(unsigned char *)(v52 + 80);
  *(void *)uint64_t v52 = v44;
  *(void *)(v52 + 8) = v45;
  *(void *)(v52 + 16) = v46;
  *(void *)(v52 + 24) = v2;
  *(void *)(v52 + 32) = v47;
  *(void *)(v52 + 40) = v125;
  *(void *)(v52 + 48) = v124;
  *(void *)(v52 + 56) = v48;
  uint64_t v122 = v48;
  *(void *)(v52 + 64) = v49;
  *(void *)(v52 + 72) = v50;
  *(unsigned char *)(v52 + 80) = v121;
  sub_24D13EEB0((uint64_t)v128, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
  uint64_t v103 = v49;
  uint64_t v104 = (uint64_t)v45;
  unint64_t v105 = v44;
  uint64_t v106 = (uint64_t)v2;
  uint64_t v107 = v46;
  sub_24D123FFC(v44, (uint64_t)v45, v46, (uint64_t)v2, v47, v125, v124, v48, v49, v50, v121);
  sub_24D12BF7C(v119, v118, v117, v116, v115, v114, v113, v112, v110, v109, v108);
  sub_24D12406C(v52, (uint64_t)v127);
  sub_24D13EEB0((uint64_t)v127, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
  char v53 = sub_24D144E40((uint64_t)v127, (uint64_t)v128);
  sub_24D13EEB0((uint64_t)v127, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
  unsigned int v54 = v120;
  if ((v53 & 1) == 0)
  {
    uint64_t v55 = (uint64_t *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    swift_beginAccess();
    uint64_t v56 = *v55;
    uint64_t v57 = *(void *)(*v55 + 16);
    if (v57)
    {
      uint64_t v58 = v56 + 32;
      swift_bridgeObjectRetain();
      id v59 = (void *)MEMORY[0x263F8EED0];
      do
      {
        uint64_t v60 = MEMORY[0x25331EC50](v58);
        if (v60)
        {
          uint64_t v61 = (void *)v60;
          sub_24D12406C(v52, (uint64_t)v126);
          uint64_t v62 = *(void (**)(uint64_t, unsigned char *))((*v59 & *v61) + 0xF0);
          sub_24D13EEB0((uint64_t)v126, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
          v62(v111, v126);
          sub_24D13EEB0((uint64_t)v126, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
        }
        v58 += 8;
        --v57;
      }
      while (v57);
      swift_bridgeObjectRelease();
      unsigned int v54 = v120;
    }
    id v63 = (void *)MEMORY[0x25331EC50](v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineParticipantView);
    if (v63)
    {
      uint64_t v64 = v63;
      double v65 = 0.0;
      if (*(unsigned char *)(v52 + 80) == 2) {
        double v65 = 1.0;
      }
      objc_msgSend(v63, sel_setAlpha_, v65);
    }
  }
  sub_24D12BF7C(v105, v104, v107, v106, v47, v125, v124, v122, v103, v50, v121);
  id result = (id)sub_24D13EEB0((uint64_t)v128, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
  if (v54) {
    id result = objc_msgSend(v54, sel_normalizedStartLocation);
  }
  else {
    double v67 = 0.99;
  }
  uint64_t v68 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation;
  double v69 = *(double *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation);
  *(double *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation) = v67;
  if (v67 != v69)
  {
    uint64_t v70 = (uint64_t *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    id result = (id)swift_beginAccess();
    uint64_t v71 = *v70;
    uint64_t v72 = *(void *)(v71 + 16);
    if (v72)
    {
      uint64_t v73 = v71 + 32;
      swift_bridgeObjectRetain();
      unsigned __int8 v74 = (void *)MEMORY[0x263F8EED0];
      do
      {
        char v75 = (void *)MEMORY[0x25331EC50](v73);
        if (v75)
        {
          uint64_t v76 = v75;
          (*(void (**)(uint64_t, double))((*v74 & *v75) + 0x100))(v111, *(double *)(v111 + v68));
        }
        v73 += 8;
        --v72;
      }
      while (v72);
      id result = (id)swift_bridgeObjectRelease();
    }
  }
  if (v54) {
    id result = objc_msgSend(v54, sel_normalizedStopLocation);
  }
  else {
    double v78 = 1.0;
  }
  uint64_t v79 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation;
  double v80 = *(double *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation);
  *(double *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation) = v78;
  if (v78 != v80)
  {
    double v81 = (uint64_t *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    id result = (id)swift_beginAccess();
    uint64_t v82 = *v81;
    uint64_t v83 = *(void *)(v82 + 16);
    if (v83)
    {
      uint64_t v84 = v82 + 32;
      swift_bridgeObjectRetain();
      char v85 = (void *)MEMORY[0x263F8EED0];
      do
      {
        unint64_t v86 = (void *)MEMORY[0x25331EC50](v84);
        if (v86)
        {
          unint64_t v87 = v86;
          (*(void (**)(uint64_t, double))((*v85 & *v86) + 0x108))(v111, *(double *)(v111 + v79));
        }
        v84 += 8;
        --v83;
      }
      while (v83);
      id result = (id)swift_bridgeObjectRelease();
    }
  }
  if (v54)
  {
    self;
    id result = (id)swift_dynamicCastObjCClass();
    if (result)
    {
      uint64_t v88 = result;
      swift_unknownObjectRetain();
      objc_msgSend(v88, sel_edrGain);
      uint64_t v89 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineEDRGain;
      double v90 = *(double *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineEDRGain);
      *(double *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineEDRGain) = v91;
      if (v91 == v90) {
        return (id)swift_unknownObjectRelease();
      }
      uint64_t v92 = (uint64_t *)(v111 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
      swift_beginAccess();
      uint64_t v93 = *v92;
      uint64_t v94 = *(void *)(v93 + 16);
      if (!v94)
      {
        return (id)swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v95 = v93 + 32;
        swift_bridgeObjectRetain();
        double v96 = (void *)MEMORY[0x263F8EED0];
        do
        {
          double v97 = (void *)MEMORY[0x25331EC50](v95);
          if (v97)
          {
            double v98 = v97;
            (*(void (**)(uint64_t, double))((*v96 & *v97) + 0xF8))(v111, *(double *)(v111 + v89));
          }
          v95 += 8;
          --v94;
        }
        while (v94);
        swift_unknownObjectRelease();
        return (id)swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

void __swiftcall DRPDropletContextView.addContainer(contentView:)(DRPDropletContainerView *__return_ptr retstr, UIView_optional *contentView)
{
  type metadata accessor for DRPDropletContainerView();
  uint64_t v3 = contentView;
  double v4 = sub_24D13AC18();
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  char v6 = v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference + 8];
  sub_24D12C03C((uint64_t)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference], (uint64_t)v21, &qword_26B189280);
  sub_24D12C03C((uint64_t)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference], (uint64_t)v22, &qword_26B1890F8);
  sub_24D13EEB0((uint64_t)v22, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF90);
  double v7 = sub_24D128B00(v5, v6, (uint64_t)v21, (uint64_t)v22);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  id v13 = v12;
  sub_24D13EEB0((uint64_t)v22, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12C00C);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView], sel_insertSubview_atIndex_, v13, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_24D14B9E0;
  *(void *)(v14 + 32) = v7;
  *(void *)(v14 + 40) = v9;
  *(void *)(v14 + 48) = v11;
  uint64_t v20 = v14;
  sub_24D1492D8();

  uint64_t v15 = sub_24D124E08(contentView, v20);
  id v16 = sub_24D13AC18();
  uint64_t v17 = *(void *)&v16[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  char v18 = v16[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference + 8];

  if ((v18 & 1) == 0) {
    objc_msgSend(v15, sel_setBoundaryEdges_, v17);
  }
  id v19 = sub_24D13D3CC();
  objc_msgSend(v19, sel_addSubview_, v15);
}

id sub_24D13D3CC()
{
  uint64_t v1 = OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView;
  id v2 = *(void **)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v4, v5, v6, v7);
    uint64_t v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    id v2 = 0;
  }
  id v10 = v2;
  return v3;
}

Swift::Void __swiftcall DRPDropletContextView.removeContainer(_:)(DRPDropletContainerView *a1)
{
  id v2 = [(DRPDropletContainerView *)a1 superview];
  id v3 = sub_24D13D3CC();
  id v4 = v3;
  if (v2)
  {

    if (v2 != v4) {
      goto LABEL_57;
    }
    id v42 = a1;
    double v5 = (Class *)((char *)&a1->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_participantViews);
    swift_beginAccess();
    unsigned __int8 v41 = v5;
    uint64_t v43 = *v5;
    if (*v5 >> 62)
    {
LABEL_58:
      swift_bridgeObjectRetain_n();
      uint64_t v44 = sub_24D149468();
      if (v44) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      uint64_t v44 = v6;
      if (v6)
      {
LABEL_5:
        uint64_t v7 = 0;
        do
        {
          if ((v43 & 0xC000000000000001) != 0) {
            id v8 = (id)MEMORY[0x25331E4B0](v7, v43);
          }
          else {
            id v8 = *(id *)(v43 + 32 + 8 * v7);
          }
          uint64_t v9 = v8;
          if (__OFADD__(v7++, 1))
          {
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
            goto LABEL_56;
          }
          id v45 = sub_24D13AC18();
          uint64_t v11 = sub_24D12A19C();
          id v12 = objc_msgSend(v11, sel_subviews);

          sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
          uint64_t v13 = sub_24D1492C8();

          uint64_t v14 = sub_24D12A36C();
          id v15 = objc_msgSend(v14, sel_subviews);

          unint64_t v16 = sub_24D1492C8();
          sub_24D13E7E8(v16, sub_24D13EB48);
          unint64_t v17 = v13;
          char v18 = sub_24D12A1A8();
          id v19 = objc_msgSend(v18, sel_subviews);

          unint64_t v20 = sub_24D1492C8();
          sub_24D13E7E8(v20, sub_24D13EB48);
          unint64_t v46 = MEMORY[0x263F8EE78];
          if (v17 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v21 = sub_24D149468();
            if (!v21)
            {
LABEL_27:
              swift_bridgeObjectRelease();
              unint64_t v25 = MEMORY[0x263F8EE78];
              goto LABEL_28;
            }
          }
          else
          {
            uint64_t v21 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v21) {
              goto LABEL_27;
            }
          }
          if (v21 < 1) {
            goto LABEL_54;
          }
          for (uint64_t i = 0; i != v21; ++i)
          {
            if ((v17 & 0xC000000000000001) != 0) {
              id v23 = (id)MEMORY[0x25331E4B0](i, v17);
            }
            else {
              id v23 = *(id *)(v17 + 8 * i + 32);
            }
            double v24 = v23;
            type metadata accessor for DropletParticipantView();
            if (swift_dynamicCastClass())
            {
              MEMORY[0x25331E390]();
              if (*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_24D1492E8();
              }
              sub_24D1492F8();
              sub_24D1492D8();
            }
            else
            {
            }
          }
          swift_bridgeObjectRelease();
          unint64_t v25 = v46;
LABEL_28:
          swift_bridgeObjectRelease();
          if (v25 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v26 = sub_24D149468();
            if (!v26) {
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v26) {
              goto LABEL_6;
            }
          }
          if ((v25 & 0xC000000000000001) != 0) {
            id v27 = (id)MEMORY[0x25331E4B0](0, v25);
          }
          else {
            id v27 = *(id *)(v25 + 32);
          }
          double v28 = v27;
          type metadata accessor for DropletParticipantView();
          char v29 = sub_24D149378();

          if (v29)
          {
LABEL_33:
            swift_bridgeObjectRelease_n();

            id v30 = sub_24D13AC18();
            objc_msgSend(v9, sel_removeFromSuperview);

            continue;
          }
          if (v26 != 1)
          {
            if ((v25 & 0xC000000000000001) != 0)
            {
              MEMORY[0x25331E4B0](1, v25);
              char v31 = sub_24D149378();
              swift_unknownObjectRelease();
              if (v31) {
                goto LABEL_33;
              }
              if (v26 != 2)
              {
                uint64_t v32 = 2;
                do
                {
                  MEMORY[0x25331E4B0](v32, v25);
                  uint64_t v33 = v32 + 1;
                  if (__OFADD__(v32, 1)) {
                    goto LABEL_55;
                  }
                  char v34 = sub_24D149378();
                  swift_unknownObjectRelease();
                  if (v34) {
                    goto LABEL_33;
                  }
                  ++v32;
                }
                while (v33 != v26);
              }
            }
            else
            {
              id v35 = *(id *)(v25 + 40);
              char v36 = sub_24D149378();

              if (v36) {
                goto LABEL_33;
              }
              if (v26 != 2)
              {
                uint64_t v37 = 6;
                while (1)
                {
                  uint64_t v38 = v37 - 3;
                  if (__OFADD__(v37 - 4, 1)) {
                    break;
                  }
                  id v39 = *(id *)(v25 + 8 * v37);
                  char v40 = sub_24D149378();

                  if (v40) {
                    goto LABEL_33;
                  }
                  ++v37;
                  if (v38 == v26) {
                    goto LABEL_6;
                  }
                }
LABEL_56:
                __break(1u);
LABEL_57:
                __break(1u);
                goto LABEL_58;
              }
            }
          }
LABEL_6:
          swift_bridgeObjectRelease_n();

          objc_msgSend(v9, sel_removeFromSuperview);
        }
        while (v7 != v44);
      }
    }
    swift_bridgeObjectRelease_n();
    *unsigned __int8 v41 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    [(DRPDropletContainerView *)v42 removeFromSuperview];
  }
  else
  {

    __break(1u);
  }
}

char *DRPDropletContextView.acquireGeometricChangeAssertion(forReason:)()
{
  id result = (char *)sub_24D13AC18();
  uint64_t v1 = *(void **)&result[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  if (v1)
  {
    id v2 = result;
    id v3 = v1;
    id v4 = (void *)sub_24D149258();
    id v5 = objc_msgSend(v3, sel_acquireForReason_, v4);

    return (char *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall DRPDropletContextView.invalidate()()
{
  uint64_t v0 = (char *)sub_24D13AC18();
  id v1 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];

  objc_msgSend(v1, sel_invalidate);
}

void __swiftcall DRPDropletContextView.init(frame:)(DRPDropletContextView *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

uint64_t DRPDropletContextView.init(frame:)()
{
  *(void *)(v0 + OBJC_IVAR___DRPDropletContextView_dropletColor) = 0;
  *(void *)(v0 + OBJC_IVAR___DRPDropletContextView_keylineStyle) = 0;
  *(void *)(v0 + OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView) = 0;
  *(void *)(v0 + OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView) = 0;
  v22.super_class = (Class)DRPDropletContextView;
  id v1 = objc_msgSendSuper2(&v22, sel_initWithFrame_);
  id v2 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v2, sel_setAllowsHitTesting_, 0);

  id v3 = v1;
  id v4 = sub_24D13AC18();
  objc_msgSend(v3, sel_addSubview_, v4);

  id v5 = v3;
  id v6 = sub_24D13D3CC();
  objc_msgSend(v5, sel_addSubview_, v6);

  id v7 = objc_msgSend(v5, sel_subviews);
  sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
  unint64_t v8 = sub_24D1492C8();

  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_24D149268();
    id v14 = objc_allocWithZone(MEMORY[0x263F157C8]);
    id v15 = (void *)sub_24D149258();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v14, sel_initWithType_, v15);

    unint64_t v17 = (void *)sub_24D149308();
    objc_msgSend(v16, sel_setValue_forKey_, v17, *MEMORY[0x263F15C98]);

    id v18 = objc_msgSend(v5, sel_layer);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_24D14B240;
    *(void *)(v19 + 56) = sub_24D114FEC(0, (unint64_t *)&qword_26B189510);
    *(void *)(v19 + 32) = v16;
    id v20 = v16;
    uint64_t v21 = (void *)sub_24D1492B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_setFilters_, v21);

    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24D149468();
  uint64_t v9 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v12 = (id)MEMORY[0x25331E4B0](i, v8);
      }
      else {
        id v12 = *(id *)(v8 + 8 * i + 32);
      }
      uint64_t v13 = v12;
      objc_msgSend(v12, sel_setOverrideUserInterfaceStyle_, 2);
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void __swiftcall DRPDropletContextView.init(coder:)(DRPDropletContextView_optional *__return_ptr retstr, NSCoder coder)
{
}

void DRPDropletContextView.init(coder:)()
{
  *(void *)&v0[OBJC_IVAR___DRPDropletContextView_dropletColor] = 0;
  *(void *)&v0[OBJC_IVAR___DRPDropletContextView_keylineStyle] = 0;
  *(void *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView] = 0;
  *(void *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView] = 0;

  sub_24D149448();
  __break(1u);
}

id sub_24D13E29C()
{
  id v1 = (char *)sub_24D13AC18();
  id v2 = *(void **)&v1[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  id v3 = v2;

  if (v2)
  {
    if (objc_msgSend(v3, sel_isActive)) {
      objc_msgSend(v3, sel_invalidate);
    }
  }
  v5.receiver = v0;
  v5.super_class = (Class)DRPDropletContextView;
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

void __swiftcall DRPDropletContextView.hitTest(_:with:)(UIView_optional *__return_ptr retstr, CGPoint _, UIEvent_optional with)
{
  v9.super_class = (Class)DRPDropletContextView;
  id v4 = -[UIView_optional hitTest:withEvent:](&v9, sel_hitTest_withEvent_, with.value.super.isa, _.x, _.y);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    if (v4 == v3
      || (id v6 = objc_msgSend(v3, sel_subviews),
          sub_24D114FEC(0, (unint64_t *)&unk_26B189500),
          unint64_t v7 = sub_24D1492C8(),
          v6,
          char v8 = sub_24D13A8DC(v5, v7),
          swift_bridgeObjectRelease(),
          id v3 = (id)v5,
          (v8 & 1) != 0))
    {
    }
  }
}

Swift::Void __swiftcall DRPDropletContextView.layoutSubviews()()
{
  v15.super_class = (Class)DRPDropletContextView;
  objc_msgSendSuper2(&v15, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = objc_msgSend(v0, sel_subviews);
  sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
  unint64_t v10 = sub_24D1492C8();

  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24D149468();
  if (!v11) {
    goto LABEL_10;
  }
LABEL_3:
  if (v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if ((v10 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x25331E4B0](i, v10);
      }
      else {
        id v13 = *(id *)(v10 + 8 * i + 32);
      }
      id v14 = v13;
      objc_msgSend(v13, sel_setFrame_, v2, v4, v6, v8);
    }
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_24D13E6E0(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_24D148468((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_24D13E7D0(unint64_t a1)
{
  return sub_24D13E7E8(a1, sub_24D13EB48);
}

uint64_t sub_24D13E7E8(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24D149468();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24D149468();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x25331E4C0](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *uint64_t v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24D149468();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();
  return sub_24D1492D8();
}

id sub_24D13E9BC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_disableDropletEffectFilters);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24D13E9F0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDisableDropletEffectFilters_, *a1);
}

id sub_24D13EA04@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_24D13EA38(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

id sub_24D13EA4C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dropletRadius);
  *a2 = v4;
  return result;
}

id sub_24D13EA80(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletRadius_, *a1);
}

id sub_24D13EA94@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dropletColor);
  *a2 = result;
  return result;
}

id sub_24D13EAD0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletColor_, *a1);
}

id sub_24D13EAE4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_keylineStyle);
  *a2 = result;
  return result;
}

id sub_24D13EB20(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineStyle_, *a1);
}

uint64_t type metadata accessor for DRPDropletContextView(uint64_t a1)
{
  return sub_24D114FEC(a1, &qword_269858590);
}

uint64_t sub_24D13EB48(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24D149468();
    id result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_24D149468();
      id result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_24D13EF0C(&qword_26B189240, &qword_26B189238);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B189238);
            uint64_t v10 = sub_24D1272F4(v13, i, a3);
            id v12 = *v11;
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
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
        sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
        swift_arrayInitWithCopy();
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

uint64_t sub_24D13ED04(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24D149468();
    id result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_24D149468();
      id result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_24D13EF0C(&qword_2698585A0, &qword_269858598);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269858598);
            uint64_t v10 = sub_24D127288(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
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
        type metadata accessor for DropletParticipantView();
        swift_arrayInitWithCopy();
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

uint64_t sub_24D13EEB0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 80);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), v4);
  return a1;
}

uint64_t sub_24D13EF0C(unint64_t *a1, uint64_t *a2)
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

id sub_24D13EF5C(float *a1)
{
  objc_msgSend(v1, sel_setM11_, *a1);
  objc_msgSend(v1, sel_setM12_, a1[1]);
  objc_msgSend(v1, sel_setM13_, a1[2]);
  objc_msgSend(v1, sel_setM14_, a1[3]);
  objc_msgSend(v1, sel_setM15_, a1[4]);
  objc_msgSend(v1, sel_setM21_, a1[5]);
  objc_msgSend(v1, sel_setM22_, a1[6]);
  objc_msgSend(v1, sel_setM23_, a1[7]);
  objc_msgSend(v1, sel_setM24_, a1[8]);
  objc_msgSend(v1, sel_setM25_, a1[9]);
  objc_msgSend(v1, sel_setM31_, a1[10]);
  objc_msgSend(v1, sel_setM32_, a1[11]);
  objc_msgSend(v1, sel_setM33_, a1[12]);
  objc_msgSend(v1, sel_setM34_, a1[13]);
  objc_msgSend(v1, sel_setM35_, a1[14]);
  objc_msgSend(v1, sel_setM41_, a1[15]);
  objc_msgSend(v1, sel_setM42_, a1[16]);
  objc_msgSend(v1, sel_setM43_, a1[17]);
  objc_msgSend(v1, sel_setM44_, a1[18]);
  double v3 = a1[19];
  return objc_msgSend(v1, sel_setM45_, v3);
}

double DRPDropletCAColorMatrixPrototypeSettings.m11.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m11;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m11.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m11);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m12.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m12;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m12.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m12);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m13.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m13;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m13.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m13);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m14.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m14;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m14.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m14);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m15.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m15;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m15.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m15);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m21.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m21;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m21.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m21);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m22.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m22;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m22.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m22);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m23.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m23;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m23.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m23);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m24.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m24;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m24.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m24);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m25.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m25;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m25.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m25);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m31.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m31;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m31.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m31);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m32.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m32;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m32.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m32);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m33.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m33;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m33.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m33);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m34.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m34;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m34.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m34);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m35.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m35;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m35.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m35);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m41.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m41;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m41.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m41);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m42.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m42;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m42.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m42);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m43.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m43;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m43.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m43);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m44.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m44;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m44.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m44);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m45.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m45;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m45.setter(double a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m45);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

float DRPDropletCAColorMatrixPrototypeSettings.caColorMatrix.getter@<S0>(uint64_t a1@<X8>)
{
  [v1 m11];
  *(float *)&double v3 = v3;
  int v42 = LODWORD(v3);
  [v1 m12];
  *(float *)&double v4 = v4;
  int v41 = LODWORD(v4);
  [v1 m13];
  *(float *)&double v5 = v5;
  int v40 = LODWORD(v5);
  [v1 m14];
  *(float *)&double v6 = v6;
  int v39 = LODWORD(v6);
  [v1 m15];
  *(float *)&double v7 = v7;
  int v38 = LODWORD(v7);
  [v1 m21];
  *(float *)&double v8 = v8;
  int v37 = LODWORD(v8);
  [v1 m22];
  *(float *)&double v9 = v9;
  int v36 = LODWORD(v9);
  [v1 m23];
  *(float *)&double v10 = v10;
  int v35 = LODWORD(v10);
  [v1 m24];
  *(float *)&double v11 = v11;
  int v34 = LODWORD(v11);
  [v1 m25];
  *(float *)&double v12 = v12;
  int v33 = LODWORD(v12);
  [v1 m31];
  *(float *)&double v13 = v13;
  int v32 = LODWORD(v13);
  [v1 m32];
  float v15 = v14;
  [v1 m33];
  float v17 = v16;
  [v1 m34];
  float v19 = v18;
  [v1 m35];
  float v21 = v20;
  [v1 m41];
  float v23 = v22;
  [v1 m42];
  float v25 = v24;
  [v1 m43];
  float v27 = v26;
  [v1 m44];
  float v29 = v28;
  [v1 m45];
  float result = v30;
  *(_DWORD *)a1 = v42;
  *(_DWORD *)(a1 + 4) = v41;
  *(_DWORD *)(a1 + 8) = v40;
  *(_DWORD *)(a1 + 12) = v39;
  *(_DWORD *)(a1 + 16) = v38;
  *(_DWORD *)(a1 + 20) = v37;
  *(_DWORD *)(a1 + 24) = v36;
  *(_DWORD *)(a1 + 28) = v35;
  *(_DWORD *)(a1 + 32) = v34;
  *(_DWORD *)(a1 + 36) = v33;
  *(_DWORD *)(a1 + 40) = v32;
  *(float *)(a1 + 44) = v15;
  *(float *)(a1 + 48) = v17;
  *(float *)(a1 + 52) = v19;
  *(float *)(a1 + 56) = v21;
  *(float *)(a1 + 60) = v23;
  *(float *)(a1 + 64) = v25;
  *(float *)(a1 + 68) = v27;
  *(float *)(a1 + 72) = v29;
  *(float *)(a1 + 76) = result;
  return result;
}

Swift::Void __swiftcall DRPDropletCAColorMatrixPrototypeSettings.setDefaultValues()()
{
  v0.super_class = (Class)DRPDropletCAColorMatrixPrototypeSettings;
  objc_msgSendSuper2(&v0, sel_setDefaultValues);
  memset(v1, 0, sizeof(v1));
  sub_24D13EF5C((float *)v1);
}

uint64_t static DRPDropletCAColorMatrixPrototypeSettings.ignoresKey(_:)(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a1 == 0x4D726F6C6F436163 && a2 == 0xED00007869727461) {
    return 1;
  }
  return sub_24D1494C8();
}

Swift::String_optional __swiftcall DRPDropletCAColorMatrixPrototypeSettings.drillDownSummary()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858648);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24D14B9F0;
  [v0 m11];
  uint64_t v3 = v2;
  uint64_t v4 = MEMORY[0x263F8EF38];
  *(void *)(v1 + 56) = MEMORY[0x263F8EF38];
  unint64_t v5 = sub_24D14221C();
  *(void *)(v1 + 64) = v5;
  *(void *)(v1 + 32) = v3;
  [v0 m12];
  *(void *)(v1 + 96) = v4;
  *(void *)(v1 + 104) = v5;
  *(void *)(v1 + 72) = v6;
  [v0 m13];
  *(void *)(v1 + 136) = v4;
  *(void *)(v1 + 144) = v5;
  *(void *)(v1 + 112) = v7;
  [v0 m14];
  *(void *)(v1 + 176) = v4;
  *(void *)(v1 + 184) = v5;
  *(void *)(v1 + 152) = v8;
  [v0 m15];
  *(void *)(v1 + 216) = v4;
  *(void *)(v1 + 224) = v5;
  *(void *)(v1 + 192) = v9;
  [v0 m21];
  *(void *)(v1 + 256) = v4;
  *(void *)(v1 + 264) = v5;
  *(void *)(v1 + 232) = v10;
  [v0 m22];
  *(void *)(v1 + 296) = v4;
  *(void *)(v1 + 304) = v5;
  *(void *)(v1 + 272) = v11;
  [v0 m23];
  *(void *)(v1 + 336) = v4;
  *(void *)(v1 + 344) = v5;
  *(void *)(v1 + 312) = v12;
  [v0 m24];
  *(void *)(v1 + 376) = v4;
  *(void *)(v1 + 384) = v5;
  *(void *)(v1 + 352) = v13;
  [v0 m25];
  *(void *)(v1 + 416) = v4;
  *(void *)(v1 + 424) = v5;
  *(void *)(v1 + 392) = v14;
  [v0 m31];
  *(void *)(v1 + 456) = v4;
  *(void *)(v1 + 464) = v5;
  *(void *)(v1 + 432) = v15;
  [v0 m32];
  *(void *)(v1 + 496) = v4;
  *(void *)(v1 + 504) = v5;
  *(void *)(v1 + 472) = v16;
  [v0 m33];
  *(void *)(v1 + 536) = v4;
  *(void *)(v1 + 544) = v5;
  *(void *)(v1 + 512) = v17;
  [v0 m34];
  *(void *)(v1 + 576) = v4;
  *(void *)(v1 + 584) = v5;
  *(void *)(v1 + 552) = v18;
  [v0 m35];
  *(void *)(v1 + 616) = v4;
  *(void *)(v1 + 624) = v5;
  *(void *)(v1 + 592) = v19;
  [v0 m41];
  *(void *)(v1 + 656) = v4;
  *(void *)(v1 + 664) = v5;
  *(void *)(v1 + 632) = v20;
  [v0 m42];
  *(void *)(v1 + 696) = v4;
  *(void *)(v1 + 704) = v5;
  *(void *)(v1 + 672) = v21;
  [v0 m43];
  *(void *)(v1 + 736) = v4;
  *(void *)(v1 + 744) = v5;
  *(void *)(v1 + 712) = v22;
  [v0 m44];
  *(void *)(v1 + 776) = v4;
  *(void *)(v1 + 784) = v5;
  *(void *)(v1 + 752) = v23;
  [v0 m45];
  *(void *)(v1 + 816) = v4;
  *(void *)(v1 + 824) = v5;
  *(void *)(v1 + 792) = v24;
  uint64_t v25 = sub_24D149278();
  result.value._object = v26;
  result.value._countAndFlagsBits = v25;
  return result;
}

void _sSo40DRPDropletCAColorMatrixPrototypeSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24D14BA00;
  uint64_t v1 = (void *)sub_24D149258();
  uint64_t v2 = (void *)sub_24D149258();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v1, v2);

  if (!v4)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (!objc_msgSend(v4, sel_precision_, 3))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  sub_24D114FEC(0, &qword_2698580F0);
  swift_dynamicCast();

  *(void *)(v0 + 32) = v69;
  unint64_t v5 = (void *)sub_24D149258();
  uint64_t v6 = (void *)sub_24D149258();
  id v7 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v5, v6);

  if (!v7)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (!objc_msgSend(v7, sel_precision_, 3))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 40) = v69;
  uint64_t v8 = (void *)sub_24D149258();
  uint64_t v9 = (void *)sub_24D149258();
  id v10 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v8, v9);

  if (!v10)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (!objc_msgSend(v10, sel_precision_, 3))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 48) = v69;
  uint64_t v11 = (void *)sub_24D149258();
  uint64_t v12 = (void *)sub_24D149258();
  id v13 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v11, v12);

  if (!v13)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (!objc_msgSend(v13, sel_precision_, 3))
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 56) = v69;
  uint64_t v14 = (void *)sub_24D149258();
  uint64_t v15 = (void *)sub_24D149258();
  id v16 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v14, v15);

  if (!v16)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (!objc_msgSend(v16, sel_precision_, 3))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 64) = v69;
  uint64_t v17 = (void *)sub_24D149258();
  uint64_t v18 = (void *)sub_24D149258();
  id v19 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v17, v18);

  if (!v19)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (!objc_msgSend(v19, sel_precision_, 3))
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 72) = v69;
  uint64_t v20 = (void *)sub_24D149258();
  uint64_t v21 = (void *)sub_24D149258();
  id v22 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v20, v21);

  if (!v22)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (!objc_msgSend(v22, sel_precision_, 3))
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 80) = v69;
  uint64_t v23 = (void *)sub_24D149258();
  uint64_t v24 = (void *)sub_24D149258();
  id v25 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v23, v24);

  if (!v25)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (!objc_msgSend(v25, sel_precision_, 3))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 88) = v69;
  double v26 = (void *)sub_24D149258();
  float v27 = (void *)sub_24D149258();
  id v28 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v26, v27);

  if (!v28)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  if (!objc_msgSend(v28, sel_precision_, 3))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 96) = v69;
  float v29 = (void *)sub_24D149258();
  double v30 = (void *)sub_24D149258();
  id v31 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v29, v30);

  if (!v31)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (!objc_msgSend(v31, sel_precision_, 3))
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 104) = v69;
  int v32 = (void *)sub_24D149258();
  int v33 = (void *)sub_24D149258();
  id v34 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v32, v33);

  if (!v34)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (!objc_msgSend(v34, sel_precision_, 3))
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 112) = v69;
  int v35 = (void *)sub_24D149258();
  int v36 = (void *)sub_24D149258();
  id v37 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v35, v36);

  if (!v37)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (!objc_msgSend(v37, sel_precision_, 3))
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 120) = v69;
  int v38 = (void *)sub_24D149258();
  int v39 = (void *)sub_24D149258();
  id v40 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v38, v39);

  if (!v40)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!objc_msgSend(v40, sel_precision_, 3))
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 128) = v69;
  int v41 = (void *)sub_24D149258();
  int v42 = (void *)sub_24D149258();
  id v43 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v41, v42);

  if (!v43)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (!objc_msgSend(v43, sel_precision_, 3))
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 136) = v69;
  uint64_t v44 = (void *)sub_24D149258();
  id v45 = (void *)sub_24D149258();
  id v46 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v44, v45);

  if (!v46)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (!objc_msgSend(v46, sel_precision_, 3))
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 144) = v69;
  uint64_t v47 = (void *)sub_24D149258();
  uint64_t v48 = (void *)sub_24D149258();
  id v49 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v47, v48);

  if (!v49)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  if (!objc_msgSend(v49, sel_precision_, 3))
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 152) = v69;
  uint64_t v50 = (void *)sub_24D149258();
  char v51 = (void *)sub_24D149258();
  id v52 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v50, v51);

  if (!v52)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (!objc_msgSend(v52, sel_precision_, 3))
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 160) = v69;
  char v53 = (void *)sub_24D149258();
  unsigned int v54 = (void *)sub_24D149258();
  id v55 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v53, v54);

  if (!v55)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (!objc_msgSend(v55, sel_precision_, 3))
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 168) = v69;
  uint64_t v56 = (void *)sub_24D149258();
  uint64_t v57 = (void *)sub_24D149258();
  id v58 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v56, v57);

  if (!v58)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (!objc_msgSend(v58, sel_precision_, 3))
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 176) = v69;
  id v59 = (void *)sub_24D149258();
  uint64_t v60 = (void *)sub_24D149258();
  id v61 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v59, v60);

  if (!v61)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  if (!objc_msgSend(v61, sel_precision_, 3))
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  sub_24D149388();
  swift_unknownObjectRelease();
  sub_24D11C120(v70, v71);
  swift_dynamicCast();

  *(void *)(v0 + 184) = v69;
  *(void *)&v71[0] = v0;
  sub_24D1492D8();
  unint64_t v62 = *(void *)&v71[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_24D14B240;
  uint64_t v64 = self;
  sub_24D128090(v62);
  swift_bridgeObjectRelease();
  double v65 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  id v66 = objc_msgSend(v64, sel_sectionWithRows_, v65);

  if (v66)
  {
    *(void *)(v63 + 56) = sub_24D114FEC(0, &qword_269858100);
    *(void *)(v63 + 32) = v66;
    double v67 = (void *)sub_24D149258();
    uint64_t v68 = (void *)sub_24D1492B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v64, sel_moduleWithTitle_contents_, v67, v68);

    return;
  }
LABEL_83:
  __break(1u);
}

unint64_t sub_24D14221C()
{
  unint64_t result = qword_269858650;
  if (!qword_269858650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858650);
  }
  return result;
}

void *keypath_get_selector_m11()
{
  return &sel_m11;
}

id sub_24D14227C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m11];
  *a2 = v4;
  return result;
}

id sub_24D1422B0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM11_, *a1);
}

void *keypath_get_selector_m12()
{
  return &sel_m12;
}

id sub_24D1422D0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m12];
  *a2 = v4;
  return result;
}

id sub_24D142304(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM12_, *a1);
}

void *keypath_get_selector_m13()
{
  return &sel_m13;
}

id sub_24D142324@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m13];
  *a2 = v4;
  return result;
}

id sub_24D142358(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM13_, *a1);
}

void *keypath_get_selector_m14()
{
  return &sel_m14;
}

id sub_24D142378@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m14];
  *a2 = v4;
  return result;
}

id sub_24D1423AC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM14_, *a1);
}

void *keypath_get_selector_m15()
{
  return &sel_m15;
}

id sub_24D1423CC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m15];
  *a2 = v4;
  return result;
}

id sub_24D142400(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM15_, *a1);
}

void *keypath_get_selector_m21()
{
  return &sel_m21;
}

id sub_24D142420@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m21];
  *a2 = v4;
  return result;
}

id sub_24D142454(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM21_, *a1);
}

void *keypath_get_selector_m22()
{
  return &sel_m22;
}

id sub_24D142474@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m22];
  *a2 = v4;
  return result;
}

id sub_24D1424A8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM22_, *a1);
}

void *keypath_get_selector_m23()
{
  return &sel_m23;
}

id sub_24D1424C8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m23];
  *a2 = v4;
  return result;
}

id sub_24D1424FC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM23_, *a1);
}

void *keypath_get_selector_m24()
{
  return &sel_m24;
}

id sub_24D14251C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m24];
  *a2 = v4;
  return result;
}

id sub_24D142550(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM24_, *a1);
}

void *keypath_get_selector_m25()
{
  return &sel_m25;
}

id sub_24D142570@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m25];
  *a2 = v4;
  return result;
}

id sub_24D1425A4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM25_, *a1);
}

void *keypath_get_selector_m31()
{
  return &sel_m31;
}

id sub_24D1425C4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m31];
  *a2 = v4;
  return result;
}

id sub_24D1425F8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM31_, *a1);
}

void *keypath_get_selector_m32()
{
  return &sel_m32;
}

id sub_24D142618@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m32];
  *a2 = v4;
  return result;
}

id sub_24D14264C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM32_, *a1);
}

void *keypath_get_selector_m33()
{
  return &sel_m33;
}

id sub_24D14266C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m33];
  *a2 = v4;
  return result;
}

id sub_24D1426A0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM33_, *a1);
}

void *keypath_get_selector_m34()
{
  return &sel_m34;
}

id sub_24D1426C0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m34];
  *a2 = v4;
  return result;
}

id sub_24D1426F4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM34_, *a1);
}

void *keypath_get_selector_m35()
{
  return &sel_m35;
}

id sub_24D142714@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m35];
  *a2 = v4;
  return result;
}

id sub_24D142748(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM35_, *a1);
}

void *keypath_get_selector_m41()
{
  return &sel_m41;
}

id sub_24D142768@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m41];
  *a2 = v4;
  return result;
}

id sub_24D14279C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM41_, *a1);
}

void *keypath_get_selector_m42()
{
  return &sel_m42;
}

id sub_24D1427BC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m42];
  *a2 = v4;
  return result;
}

id sub_24D1427F0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM42_, *a1);
}

void *keypath_get_selector_m43()
{
  return &sel_m43;
}

id sub_24D142810@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m43];
  *a2 = v4;
  return result;
}

id sub_24D142844(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM43_, *a1);
}

void *keypath_get_selector_m44()
{
  return &sel_m44;
}

id sub_24D142864@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m44];
  *a2 = v4;
  return result;
}

id sub_24D142898(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM44_, *a1);
}

void *keypath_get_selector_m45()
{
  return &sel_m45;
}

id sub_24D1428B8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 m45];
  *a2 = v4;
  return result;
}

id sub_24D1428EC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM45_, *a1);
}

uint64_t type metadata accessor for DRPDropletCAColorMatrixPrototypeSettings(uint64_t a1)
{
  return sub_24D114FEC(a1, &qword_269858658);
}

uint64_t sub_24D142914(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24D142958(uint64_t a1, uint64_t a2)
{
  sub_24D12406C(a1, (uint64_t)v4);
  sub_24D12406C(a2, (uint64_t)v5);
  return sub_24D144E40((uint64_t)v4, (uint64_t)v5) & 1;
}

id sub_24D1429A4()
{
  BSRectWithSize();
  UIRectCenteredAboutPoint();
  UIEdgeInsetsInsetRect(v1, v2, v3, v4, -*(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets], -*(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 8]);
  BSRectWithSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  UIRectGetCenter();
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v0, sel_bounds);
  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  if (!CGRectEqualToRect(v25, v26))
  {
    objc_msgSend(v0, sel_setBounds_, v6, v8, v10, v12);
    id v17 = sub_24D143B68();
    objc_msgSend(v17, sel_setFrame_, v6, v8, v10, v12);

    id v18 = sub_24D143AB4();
    objc_msgSend(v18, sel_setFrame_, v6, v8, v10, v12);

    id v19 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView];
    if (v19) {
      objc_msgSend(v19, sel_setFrame_, v6, v8, v10, v12);
    }
    sub_24D143F98();
  }
  id result = objc_msgSend(v0, sel_center);
  if (v22 != v14 || v21 != v16)
  {
    return objc_msgSend(v0, sel_setCenter_, v14, v16);
  }
  return result;
}

id sub_24D142B9C(uint64_t a1, char a2)
{
  return objc_msgSend(v2, sel_setHidden_, a2 & 1);
}

id sub_24D142BB4()
{
  return objc_msgSend(v0, sel_setAlpha_);
}

void sub_24D142BC4(double a1, double a2, double a3, double a4)
{
  double v5 = (double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths);
  double v6 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths);
  double v7 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 8);
  double v8 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 16);
  double v9 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 24);
  *double v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  if (v6 != a1 || v7 != a2 || v8 != a3 || v9 != a4) {
    sub_24D143F98();
  }
}

void sub_24D142BFC(double a1, double a2, double a3, double a4)
{
  double v5 = (double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets];
  double v6 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets];
  double v7 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 8];
  double v8 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 16];
  double v9 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 24];
  *double v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  if (v6 != a1 || v7 != a2 || v8 != a3 || v9 != a4)
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    objc_msgSend(v4, sel_layoutIfNeeded);
  }
}

void sub_24D142C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType;
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 16);
  uint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8);
  double v16 = *(void **)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 24);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 32);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 40);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48);
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56);
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 64);
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72);
  char v12 = *(unsigned char *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80);
  uint64_t v13 = a2;
  uint64_t v17 = a2;
  sub_24D12406C(a2, v4);
  sub_24D139F3C(v13, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
  sub_24D139F3C(v13, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
  sub_24D123FFC(v16, v15, v5, v6, v7, v8, v14, v10, v9, v11, v12);
  sub_24D12BF7C(v16, v15, v5, v6, v7, v8, v14, v10, v9, v11, v12);
  sub_24D144A68();
  sub_24D139F3C(v17, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
  sub_24D12BF7C(v16, v15, v5, v6, v7, v8, v14, v10, v9, v11, v12);
}

void sub_24D142DF8(double a1)
{
  double v2 = *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStartLocation);
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStartLocation) = a1;
  if (v2 != a1)
  {
    unint64_t v3 = sub_24D143C1C();
    unint64_t v4 = v3;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_24D149468();
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v6 = 0;
        do
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v7 = (id)MEMORY[0x25331E4B0](v6, v4);
          }
          else {
            id v7 = *(id *)(v4 + 8 * v6 + 32);
          }
          uint64_t v8 = v7;
          ++v6;
          sub_24D1277C8();
          sub_24D12794C();
        }
        while (v5 != v6);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

void sub_24D142F00(double a1)
{
  double v2 = *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStopLocation);
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStopLocation) = a1;
  if (v2 != a1)
  {
    unint64_t v3 = sub_24D143C1C();
    unint64_t v4 = v3;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_24D149468();
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v6 = 0;
        do
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v7 = (id)MEMORY[0x25331E4B0](v6, v4);
          }
          else {
            id v7 = *(id *)(v4 + 8 * v6 + 32);
          }
          uint64_t v8 = v7;
          ++v6;
          sub_24D1277C8();
          sub_24D12794C();
        }
        while (v5 != v6);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

void sub_24D143008()
{
  uint64_t v1 = v0;
  unsigned __int8 v2 = objc_msgSend(v0, sel_isHidden);
  uint64_t v3 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView;
  unint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView];
  if (v2)
  {
    if (v4)
    {
      id v22 = v4;
      objc_msgSend(v22, sel_setAlpha_, 0.0);
      objc_msgSend(v22, sel_setHidden_, 1);
    }
  }
  else
  {
    if (v4) {
      goto LABEL_8;
    }
    objc_msgSend(v0, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_edrGain];
    id v14 = objc_allocWithZone((Class)type metadata accessor for AnimatableIntelligentView());
    id v15 = sub_24D145ED8(1, v6, v8, v10, v12, v13);
    objc_msgSend(v15, sel_setAlpha_, 0.0);
    id v16 = sub_24D143AB4();
    objc_msgSend(v1, sel_insertSubview_aboveSubview_, v15, v16);

    uint64_t v17 = self;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v1;
    aBlock[4] = sub_24D145108;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24D142914;
    aBlock[3] = &block_descriptor_4;
    id v19 = _Block_copy(aBlock);
    uint64_t v20 = v1;
    swift_release();
    objc_msgSend(v17, sel__performWithoutRetargetingAnimations_, v19);
    _Block_release(v19);
    double v21 = *(void **)&v1[v3];
    *(void *)&v1[v3] = v15;

    unint64_t v4 = *(void **)&v1[v3];
    if (v4) {
LABEL_8:
    }
      objc_msgSend(v4, sel_setHidden_, 0);
  }
}

void sub_24D143258(double a1)
{
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_edrGain) = a1;
  unsigned __int8 v2 = *(char **)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView);
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_edrGain;
    *(double *)&v2[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_edrGain] = a1;
    unint64_t v4 = v2;
    id v5 = sub_24D1464B0();
    sub_24D14526C(*(double *)&v2[v3]);
  }
}

uint64_t sub_24D1433B4(unsigned char *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[80] = 1;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView] = 0;
  uint64_t v41 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 8];
  int v42 = *(void **)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  uint64_t v4 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 24];
  uint64_t v40 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 16];
  uint64_t v5 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 32];
  uint64_t v6 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 40];
  uint64_t v7 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 48];
  uint64_t v8 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 56];
  uint64_t v9 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 64];
  uint64_t v10 = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 72];
  char v11 = a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80];
  char v53 = *(void **)v3;
  uint64_t v52 = *((void *)v3 + 1);
  uint64_t v51 = *((void *)v3 + 2);
  uint64_t v50 = *((void *)v3 + 3);
  uint64_t v49 = *((void *)v3 + 4);
  uint64_t v48 = *((void *)v3 + 5);
  uint64_t v47 = *((void *)v3 + 6);
  uint64_t v46 = *((void *)v3 + 7);
  uint64_t v45 = *((void *)v3 + 8);
  uint64_t v44 = *((void *)v3 + 9);
  char v43 = v3[80];
  *(void *)uint64_t v3 = v42;
  *((void *)v3 + 1) = v41;
  *((void *)v3 + 2) = v40;
  *((void *)v3 + 3) = v4;
  *((void *)v3 + 4) = v5;
  *((void *)v3 + 5) = v6;
  *((void *)v3 + 6) = v7;
  *((void *)v3 + 7) = v8;
  *((void *)v3 + 8) = v9;
  *((void *)v3 + 9) = v10;
  v3[80] = v11;
  double v12 = v1;
  sub_24D123FFC(v42, v41, v40, v4, v5, v6, v7, v8, v9, v10, v11);
  sub_24D12BF7C(v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43);
  double v13 = &v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths];
  long long v14 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
  *(_OWORD *)double v13 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
  *((_OWORD *)v13 + 1) = v14;
  id v15 = &v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets];
  long long v16 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 16];
  *(_OWORD *)id v15 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets];
  *((_OWORD *)v15 + 1) = v16;
  *(void *)&v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStartLocation] = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation];
  *(void *)&v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStopLocation] = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation];
  *(void *)&v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_edrGain] = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineEDRGain];

  uint64_t v17 = a1;
  uint64_t v18 = sub_24D134078(v17);
  id v19 = self;
  uint64_t v20 = v18;
  id v21 = objc_msgSend(v19, sel_rootSettings);
  objc_msgSend(v21, sel_addKeyObserver_, v20);

  sub_24D14410C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D14B460;
  *(void *)(inited + 32) = sub_24D143B68();
  *(void *)(inited + 40) = sub_24D143AB4();
  sub_24D1492D8();
  unint64_t v23 = inited;
  unint64_t v24 = sub_24D143C1C();
  if (v24 >> 62)
  {
    sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
    unint64_t v25 = sub_24D149458();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24D1494D8();
    sub_24D114FEC(0, (unint64_t *)&unk_26B189500);
    unint64_t v25 = v24;
  }
  swift_bridgeObjectRelease();
  sub_24D13E7D0(v25);
  unint64_t v26 = v23;
  if (v23 >> 62)
  {
    int v33 = v20;
    swift_bridgeObjectRetain();
    uint64_t result = sub_24D149468();
    uint64_t v27 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v27 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v28 = v20;
    uint64_t result = swift_bridgeObjectRetain();
    if (!v27) {
      goto LABEL_13;
    }
  }
  if (v27 < 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  for (uint64_t i = 0; i != v27; ++i)
  {
    if ((v26 & 0xC000000000000001) != 0) {
      id v31 = (id)MEMORY[0x25331E4B0](i, v26);
    }
    else {
      id v31 = *(id *)(v26 + 8 * i + 32);
    }
    int v32 = v31;
    objc_msgSend(v20, sel_addSubview_, v31);
  }
LABEL_13:

  swift_bridgeObjectRelease_n();
  sub_24D144A68();
  sub_24D143F98();
  unint64_t v34 = sub_24D143C1C();
  unint64_t v35 = v34;
  if (!(v34 >> 62))
  {
    uint64_t v36 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v36) {
      goto LABEL_15;
    }
LABEL_22:
    swift_bridgeObjectRelease_n();

    return (uint64_t)v20;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24D149468();
  uint64_t v36 = result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_15:
  if (v36 >= 1)
  {
    uint64_t v37 = 0;
    do
    {
      if ((v35 & 0xC000000000000001) != 0) {
        id v38 = (id)MEMORY[0x25331E4B0](v37, v35);
      }
      else {
        id v38 = *(id *)(v35 + 8 * v37 + 32);
      }
      int v39 = v38;
      ++v37;
      sub_24D1277C8();
      sub_24D12794C();
    }
    while (v36 != v37);
    goto LABEL_22;
  }
LABEL_24:
  __break(1u);
  return result;
}

void sub_24D143910()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for DropletBackgroundView();
  objc_msgSendSuper2(&v8, sel_layoutSubviews);
  id v1 = sub_24D143B68();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  id v2 = sub_24D143AB4();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v4, sel_setFrame_);
  }
  sub_24D12C03C((uint64_t)&v0[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry], (uint64_t)v5, &qword_26B189100);
  sub_24D12C03C((uint64_t)v5, (uint64_t)v6, &qword_26B189100);
  if (!sub_24D12C02C(v6))
  {
    long long v19 = v6[10];
    long long v20 = v6[11];
    long long v21 = v6[12];
    uint64_t v22 = v7;
    long long v15 = v6[6];
    long long v16 = v6[7];
    long long v17 = v6[8];
    long long v18 = v6[9];
    long long v11 = v6[2];
    long long v12 = v6[3];
    long long v13 = v6[4];
    long long v14 = v6[5];
    long long v9 = v6[0];
    long long v10 = v6[1];
    sub_24D1429A4();
  }
  sub_24D143F98();
}

id sub_24D143AB4()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AnimatableAdaptiveColorMatrixView()), sel_initWithFrame_, v4, v5, v6, v7);
    long long v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    id v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_24D143B68()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v4, v5, v6, v7);
    long long v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    id v2 = 0;
  }
  id v10 = v2;
  return v3;
}

uint64_t sub_24D143C1C()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews;
  if (*(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews);
  }
  else
  {
    uint64_t v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B189540);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_24D14B480;
    *(void *)(v4 + 32) = sub_24D143CE0();
    *(void *)(v4 + 40) = sub_24D143D78();
    *(void *)(v4 + 48) = sub_24D143E20();
    *(void *)(v4 + 56) = sub_24D143EDC();
    sub_24D1492D8();
    uint64_t v2 = v4;
    *(void *)(v3 + v1) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_24D143CE0()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    double Width = CGRectGetWidth(v9);
    id v5 = sub_24D128500(1, 0.0, 0.0, Width, *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths], 0.0, 1.0);
    double v6 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_24D143D78()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView];
  }
  else
  {
    double v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 8];
    objc_msgSend(v0, sel_bounds);
    double Height = CGRectGetHeight(v10);
    id v6 = sub_24D128500(0, 0.0, 0.0, v4, Height, 0.0, 1.0);
    id v7 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_24D143E20()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView];
  }
  else
  {
    double v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 16];
    objc_msgSend(v0, sel_bounds);
    double v5 = CGRectGetHeight(v11) - v4;
    objc_msgSend(v0, sel_bounds);
    double Width = CGRectGetWidth(v12);
    id v7 = sub_24D128500(1, 0.0, v5, Width, v4, 1.0, 0.0);
    id v8 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_24D143EDC()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView];
  }
  else
  {
    double v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 24];
    objc_msgSend(v0, sel_bounds);
    double v5 = CGRectGetWidth(v11) - v4;
    objc_msgSend(v0, sel_bounds);
    double Height = CGRectGetHeight(v12);
    id v7 = sub_24D128500(0, v5, 0.0, v4, Height, 1.0, 0.0);
    id v8 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

void sub_24D143F98()
{
  id v1 = sub_24D143CE0();
  objc_msgSend(v0, sel_bounds);
  CGFloat Width = CGRectGetWidth(v13);
  id v3 = (double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths];
  objc_msgSend(v1, sel_setFrame_, 0.0, 0.0, Width, *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths]);

  id v4 = sub_24D143E20();
  double v5 = v3[2];
  objc_msgSend(v0, sel_bounds);
  CGFloat v6 = CGRectGetHeight(v14) - v5;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v4, sel_setFrame_, 0.0, v6, CGRectGetWidth(v15), v5);

  id v7 = sub_24D143D78();
  double v8 = v3[1];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v7, sel_setFrame_, 0.0, 0.0, v8, CGRectGetHeight(v16));

  id v11 = sub_24D143EDC();
  double v9 = v3[3];
  objc_msgSend(v0, sel_bounds);
  CGFloat v10 = CGRectGetWidth(v17) - v9;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v11, sel_setFrame_, v10, 0.0, v9, CGRectGetHeight(v18));
}

uint64_t sub_24D14410C()
{
  id v1 = objc_msgSend(self, sel_rootSettings);
  unsigned int v2 = objc_msgSend(v1, sel_suppressCompositingFilterDestOut);

  if (!v2)
  {
    uint64_t v15 = sub_24D149268();
    uint64_t v17 = v16;
    unint64_t v18 = sub_24D143C1C();
    unint64_t v19 = v18;
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_24D149468();
      uint64_t v20 = result;
      if (result) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v20)
      {
LABEL_16:
        uint64_t v22 = v20 - 1;
        if (v20 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v23 = 0;
        if ((v19 & 0xC000000000000001) == 0) {
          goto LABEL_19;
        }
LABEL_18:
        for (id i = (id)MEMORY[0x25331E4B0](v23, v19); ; id i = *(id *)(v19 + 8 * v23 + 32))
        {
          unint64_t v25 = i;
          id v26 = objc_msgSend(i, sel_layer);
          id v27 = objc_msgSend(v26, sel_compositingFilter);

          if (v27)
          {
            sub_24D149388();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v33, 0, sizeof(v33));
          }
          sub_24D12C03C((uint64_t)v33, (uint64_t)&v34, &qword_26B189550);
          if (!*((void *)&v35 + 1)) {
            break;
          }
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_30;
          }
          if (v31 == v15 && v32 == v17)
          {

            swift_bridgeObjectRelease();
            if (v22 == v23) {
              goto LABEL_35;
            }
            goto LABEL_31;
          }
          char v30 = sub_24D1494C8();
          swift_bridgeObjectRelease();
          if ((v30 & 1) == 0) {
            goto LABEL_30;
          }

          if (v22 == v23) {
            goto LABEL_35;
          }
LABEL_31:
          ++v23;
          if ((v19 & 0xC000000000000001) != 0) {
            goto LABEL_18;
          }
LABEL_19:
          ;
        }
        sub_24D1238B4((uint64_t)&v34);
LABEL_30:
        id v28 = objc_msgSend(v25, sel_layer);
        float v29 = (void *)sub_24D149258();
        objc_msgSend(v28, sel_setCompositingFilter_, v29);

        if (v22 == v23) {
          goto LABEL_35;
        }
        goto LABEL_31;
      }
    }
LABEL_35:
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  id v3 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v3, sel_displayScale);

  unint64_t v4 = sub_24D143C1C();
  unint64_t v5 = v4;
  if (v4 >> 62) {
    goto LABEL_37;
  }
  uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_24D149468())
  {
    uint64_t v7 = 4;
    uint64_t v8 = 0;
    if ((v5 & 0xC000000000000001) != 0)
    {
LABEL_5:
      id v9 = (id)MEMORY[0x25331E4B0](v8, v5);
      goto LABEL_7;
    }
    while (1)
    {
      id v9 = *(id *)(v5 + 8 * v7);
LABEL_7:
      CGFloat v10 = v9;
      uint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        break;
      }
      id v12 = objc_msgSend(v9, sel_layer);
      id v13 = objc_msgSend(v12, sel_compositingFilter);

      if (v13)
      {
        sub_24D149388();
        swift_unknownObjectRelease();
        sub_24D1238B4((uint64_t)&v34);
        id v14 = objc_msgSend(v10, sel_layer);
        objc_msgSend(v14, sel_setCompositingFilter_, 0);

        if (v11 == v6) {
          return swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        sub_24D1238B4((uint64_t)&v34);

        if (v11 == v6) {
          return swift_bridgeObjectRelease_n();
        }
      }
      uint64_t v8 = ++v7 - 4;
      if ((v5 & 0xC000000000000001) != 0) {
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_24D14451C()
{
  sub_24D12BF7C(*(id *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 16), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 24), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 32), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 40), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 64), *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72), *(unsigned char *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80));

  swift_bridgeObjectRelease();
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView);
}

id sub_24D1445F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletBackgroundView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletBackgroundView()
{
  return self;
}

void destroy for DropletBackgroundView.BackgroundType(uint64_t a1)
{
}

uint64_t initializeWithCopy for DropletBackgroundView.BackgroundType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(unsigned char *)(a2 + 80);
  sub_24D123FFC(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for DropletBackgroundView.BackgroundType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  char v25 = *(unsigned char *)(a2 + 80);
  sub_24D123FFC(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  id v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  sub_24D12BF7C(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for DropletBackgroundView.BackgroundType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  long long v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  sub_24D12BF7C(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for DropletBackgroundView.BackgroundType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DropletBackgroundView.BackgroundType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24D144A48(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t sub_24D144A50(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DropletBackgroundView.BackgroundType()
{
  return &type metadata for DropletBackgroundView.BackgroundType;
}

void sub_24D144A68()
{
  uint64_t v1 = v0;
  long long v2 = *(void **)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 16);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 24);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 32);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 40);
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48);
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 64);
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72);
  id v37 = *(id *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80))
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80) == 1)
    {
      uint64_t v33 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56);
      long long v35 = *(void **)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType);
      id v10 = v2;
      id v11 = sub_24D143AB4();
      objc_msgSend(v11, sel_setAlpha_, 0.0);

      uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView);
      if (v12) {
        objc_msgSend(v12, sel_setAlpha_, 0.0);
      }
      id v13 = sub_24D143B68();
      objc_msgSend(v13, sel_setBackgroundColor_, v10);

      id v14 = sub_24D143B68();
      objc_msgSend(v14, sel_setAlpha_, 1.0);

      sub_24D12BF7C(v35, (uint64_t)v37, v4, v3, v6, v5, v7, v33, v8, v9, 1);
    }
    else
    {
      id v21 = sub_24D143B68();
      objc_msgSend(v21, sel_setAlpha_, 0.0);

      id v22 = sub_24D143AB4();
      objc_msgSend(v22, sel_setAlpha_, 0.0);

      uint64_t v23 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView;
      uint64_t v24 = *(void **)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView);
      if (v24)
      {
        objc_msgSend(v24, sel_setHidden_, 0);
        char v25 = *(void **)(v1 + v23);
        if (v25)
        {
          id v26 = objc_msgSend(v25, sel_layer);
          char v27 = (char)v2;
          if (((unsigned __int16)v2 & 0x100) != 0)
          {
            sub_24D149268();
            uint64_t v28 = sub_24D149258();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v28 = 0;
          }
          objc_msgSend(v26, sel_setCompositingFilter_, v28);

          swift_unknownObjectRelease();
          float v29 = *(void **)(v1 + v23);
          if (v29)
          {
            id v30 = v29;
            sub_24D145D20(v27 & 1);

            uint64_t v31 = *(void **)(v1 + v23);
            if (v31)
            {
              objc_msgSend(v31, sel_setAlpha_, *(double *)&v37);
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v34 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56);
    uint64_t v36 = *(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType);
    uint64_t v32 = HIDWORD(*(void *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8));
    id v15 = sub_24D143B68();
    objc_msgSend(v15, sel_setAlpha_, 0.0);

    long long v16 = *(void **)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView);
    if (v16) {
      objc_msgSend(v16, sel_setAlpha_, 0.0);
    }
    uint64_t v17 = (char *)sub_24D143AB4();
    uint64_t v18 = &v17[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
    long long v19 = *(_OWORD *)&v17[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 48];
    v39[2] = *(_OWORD *)&v17[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 32];
    v39[3] = v19;
    v39[4] = *(_OWORD *)&v17[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 64];
    long long v20 = *(_OWORD *)&v17[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 16];
    v39[0] = *(_OWORD *)&v17[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
    v39[1] = v20;
    *(_DWORD *)uint64_t v18 = v36;
    *((_DWORD *)v18 + 1) = HIDWORD(v2);
    *((_DWORD *)v18 + 2) = v37;
    *((_DWORD *)v18 + 3) = v32;
    *((void *)v18 + 2) = v4;
    *((void *)v18 + 3) = v3;
    *((void *)v18 + 4) = v6;
    *((void *)v18 + 5) = v5;
    *((void *)v18 + 6) = v7;
    *((void *)v18 + 7) = v34;
    *((void *)v18 + 8) = v8;
    *((void *)v18 + 9) = v9;
    sub_24D139FD8((float *)v39);

    id v38 = sub_24D143AB4();
    objc_msgSend(v38, sel_setAlpha_, 1.0);
  }
}

uint64_t sub_24D144E40(uint64_t a1, uint64_t a2)
{
  sub_24D12406C(a1, (uint64_t)v33);
  if (v40)
  {
    if (v40 == 1)
    {
      uint64_t v4 = *(void *)&v33[0];
      sub_24D12406C(a2, (uint64_t)v25);
      if (v32 == 1)
      {
        if (v4)
        {
          if (v25[0].i64[0])
          {
            sub_24D114FEC(0, (unint64_t *)&qword_269858310);
            sub_24D139F3C(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
            sub_24D139F3C(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
            char v5 = sub_24D149378();
            sub_24D139F3C(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
            sub_24D139F3C(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D12BF7C);
            return v5 & 1;
          }
        }
        else if (!v25[0].i64[0])
        {
          sub_24D139F3C(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
          sub_24D139F3C(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_24D123FFC);
          char v5 = 1;
          return v5 & 1;
        }
      }
LABEL_19:
      char v5 = 0;
      return v5 & 1;
    }
    int v15 = LOBYTE(v33[0]);
    int v16 = BYTE1(v33[0]);
    double v17 = *((double *)v33 + 1);
    sub_24D12406C(a2, (uint64_t)v25);
    if (v32 != 2) {
      goto LABEL_19;
    }
    char v5 = 0;
    if (v15 == v25[0].u8[0] && ((v16 ^ v25[0].u8[1]) & 1) == 0)
    {
      BOOL v14 = v17 == *(double *)&v25[0].i64[1];
LABEL_15:
      char v5 = v14;
    }
  }
  else
  {
    uint64_t v23 = v34;
    float32x4_t v24 = (float32x4_t)v33[1];
    unsigned int v20 = v35;
    int8x16_t v21 = v36;
    int32x4_t v22 = (int32x4_t)v33[0];
    float v6 = v38;
    __int32 v19 = v37;
    float v7 = v39;
    sub_24D12406C(a2, (uint64_t)v25);
    if (v32) {
      goto LABEL_19;
    }
    char v5 = 0;
    v8.i64[0] = v26;
    v8.i32[2] = v27;
    v9.i64[0] = v23;
    v10.i64[0] = vrev64q_s32(v22).u64[0];
    v10.i64[1] = v22.i64[1];
    v9.i64[1] = __PAIR64__(v21.u32[0], v20);
    float32x4_t v11 = (float32x4_t)vextq_s8(v21, (int8x16_t)v8, 4uLL);
    v11.i32[3] = v19;
    v12.i64[0] = vrev64q_s32(v25[0]).u64[0];
    v12.i64[1] = v25[0].i64[1];
    v8.i32[3] = v28.i32[0];
    float32x4_t v13 = (float32x4_t)vextq_s8(v28, (int8x16_t)v8, 4uLL);
    v13.i32[3] = v29;
    if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v10, v12), (int16x8_t)vceqq_f32(v24, (float32x4_t)v25[1])), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v9, v8), (int16x8_t)vceqq_f32(v11, v13))), 7uLL))) & 1) != 0&& v6 == v30)
    {
      BOOL v14 = v7 == v31;
      goto LABEL_15;
    }
  }
  return v5 & 1;
}

uint64_t sub_24D1450D0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24D145108()
{
  uint64_t v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_setNeedsLayout);
  return objc_msgSend(v1, sel_layoutIfNeeded);
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

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_24D145188()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  v1[80] = 1;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView] = 0;

  sub_24D149448();
  __break(1u);
}

void sub_24D14526C(double a1)
{
  id v3 = objc_msgSend(v1, sel_layer, 1.0);
  objc_msgSend(v3, sel_setWantsExtendedDynamicRangeContent_, a1 > 1.0);

  id v4 = objc_msgSend(v1, sel_layer);
  *(float *)&double v5 = a1;
  objc_msgSend(v4, sel_setGain_, v5);

  id v6 = objc_msgSend(v1, sel_layer);
  float v7 = (void *)sub_24D149308();
  id v8 = (id)sub_24D149258();
  objc_msgSend(v6, sel_setValue_forKey_, v7, v8);
}

void sub_24D145384(float *a1)
{
  uint64_t v2 = &v1[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
  if (*(float *)&v1[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix] != *a1
    || *((float *)v2 + 1) != a1[1]
    || *((float *)v2 + 2) != a1[2]
    || *((float *)v2 + 3) != a1[3]
    || *((float *)v2 + 4) != a1[4]
    || *((float *)v2 + 5) != a1[5]
    || *((float *)v2 + 6) != a1[6]
    || *((float *)v2 + 7) != a1[7]
    || *((float *)v2 + 8) != a1[8]
    || *((float *)v2 + 9) != a1[9]
    || *((float *)v2 + 10) != a1[10]
    || *((float *)v2 + 12) != a1[12]
    || *((float *)v2 + 13) != a1[13]
    || *((float *)v2 + 14) != a1[14]
    || *((float *)v2 + 15) != a1[15]
    || *((float *)v2 + 17) != a1[17]
    || *((float *)v2 + 18) != a1[18]
    || *((float *)v2 + 19) != a1[19])
  {
    id v3 = objc_msgSend(v1, sel_layer);
    long long v9 = *((_OWORD *)v2 + 1);
    long long v7 = *((_OWORD *)v2 + 3);
    long long v8 = *((_OWORD *)v2 + 2);
    long long v6 = *((_OWORD *)v2 + 4);
    v10[0] = *(_OWORD *)v2;
    v10[1] = v9;
    _OWORD v10[2] = v8;
    _OWORD v10[3] = v7;
    v10[4] = v6;
    id v4 = objc_msgSend(self, sel_valueWithCAColorMatrix_, v10);
    if (qword_26B189298 != -1) {
      swift_once();
    }
    double v5 = (void *)sub_24D149258();
    objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);
  }
}

id sub_24D1455C4(char a1, long long *a2, double a3, double a4, double a5, double a6, double a7)
{
  *(void *)&v7[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView] = 0;
  int v15 = &v7[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
  int v16 = (objc_class *)type metadata accessor for AnimatableLightView();
  uint64_t v17 = *((void *)a2 + 8);
  uint64_t v18 = *((void *)a2 + 9);
  long long v19 = a2[3];
  long long v40 = a2[2];
  long long v41 = *a2;
  long long v20 = a2[1];
  v15[2] = v40;
  v15[3] = v19;
  v15[4] = a2[4];
  long long v38 = a2[1];
  long long v39 = v19;
  _OWORD *v15 = *a2;
  v15[1] = v20;
  v7[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_preferringAudioReactivity] = a1;
  v45.receiver = v7;
  v45.super_class = v16;
  id v21 = objc_msgSendSuper2(&v45, sel_initWithFrame_preferringAudioReactivity_, a1 & 1, a3, a4, a5, a6);
  sub_24D149268();
  id v22 = objc_allocWithZone(MEMORY[0x263F157C8]);
  id v23 = v21;
  float32x4_t v24 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_initWithType_, v24);

  v42[0] = v41;
  v42[1] = v38;
  v42[2] = v40;
  v42[3] = v39;
  uint64_t v43 = v17;
  uint64_t v44 = v18;
  id v26 = objc_msgSend(self, sel_valueWithCAColorMatrix_, v42);
  objc_msgSend(v25, sel_setValue_forKeyPath_, v26, *MEMORY[0x263F15C30]);

  __int32 v27 = (void *)sub_24D149308();
  objc_msgSend(v25, sel_setValue_forKeyPath_, v27, *MEMORY[0x263F15C70]);

  int8x16_t v28 = (void *)sub_24D149308();
  objc_msgSend(v25, sel_setValue_forKeyPath_, v28, *MEMORY[0x263F15BE8]);

  id v29 = objc_msgSend(v23, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_24D14B240;
  *(void *)(v30 + 56) = sub_24D1466C8();
  *(void *)(v30 + 32) = v25;
  id v31 = v25;
  char v32 = (void *)sub_24D1492B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setFilters_, v32);

  id v33 = sub_24D145AAC();
  id v34 = sub_24D145B70();
  objc_msgSend(v33, sel_addSubview_, v34);

  id v35 = v23;
  id v36 = sub_24D145AAC();
  objc_msgSend(v35, sel_setMaskView_, v36);

  sub_24D14526C(a7);
  return v35;
}

uint64_t sub_24D145AA0(uint64_t a1)
{
  return sub_24D146404(a1, &qword_26B189120);
}

id sub_24D145AAC()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F83010]), sel_initWithFrame_preferringAudioReactivity_, v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_preferringAudioReactivity], v4, v5, v6, v7);
    long long v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_24D145B70()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v4, v5, v6, v7);
    id v9 = objc_msgSend(self, sel_whiteColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);

    id v10 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v11 = v2;
  return v3;
}

id sub_24D145C94()
{
  return sub_24D14665C(0, type metadata accessor for AnimatableLightView);
}

uint64_t type metadata accessor for AnimatableLightView()
{
  return self;
}

void sub_24D145D20(char a1)
{
  uint64_t v2 = OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity;
  int v3 = v1[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity];
  v1[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity] = a1;
  if (v3 != (a1 & 1))
  {
    double v4 = v1;
    id v5 = sub_24D1464B0();
    objc_msgSend(v5, sel_removeFromSuperview);

    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    LOBYTE(v5) = v4[v2];
    id v14 = objc_msgSend(self, sel_rootSettings);
    id v15 = objc_msgSend(v14, sel_intelligentEdgeLightKeylineStyleColorMatrix);

    objc_msgSend(v15, sel_caColorMatrix);
    double v16 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_edrGain];
    id v17 = objc_allocWithZone((Class)type metadata accessor for AnimatableLightView());
    id v18 = sub_24D1455C4((char)v5, &v21, v7, v9, v11, v13, v16);
    long long v19 = *(void **)&v4[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView];
    *(void *)&v4[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView] = v18;

    id v20 = sub_24D1464B0();
    objc_msgSend(v4, sel_addSubview_, v20);
  }
}

id sub_24D145ED8(char a1, double a2, double a3, double a4, double a5, double a6)
{
  *(void *)&v6[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView] = 0;
  v6[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity] = a1;
  *(double *)&v6[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_edrGain] = a6;
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for AnimatableIntelligentView();
  id v11 = objc_msgSendSuper2(&v15, sel_initWithFrame_, a2, a3, a4, a5);
  id v12 = sub_24D1464B0();
  objc_msgSend(v11, sel_addSubview_, v12);

  id v13 = objc_msgSend(self, sel_rootSettings);
  objc_msgSend(v13, sel_addKeyObserver_, v11);

  return v11;
}

void sub_24D1461D0(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    self;
    uint64_t v6 = swift_dynamicCastObjCClass();
    if (v6 && a3 != 0)
    {
      if (double v8 = (void *)v6, a2 == 0xD00000000000002BLL) && a3 == 0x800000024D14C3D0 || (sub_24D1494C8())
      {
        id v19 = a1;
        double v9 = (char *)sub_24D1464B0();
        id v10 = objc_msgSend(v8, sel_intelligentEdgeLightKeylineStyleColorMatrix);
        objc_msgSend(v10, sel_caColorMatrix);
        long long v17 = v21;
        long long v18 = v20;
        long long v15 = v23;
        long long v16 = v22;
        long long v14 = v24;

        id v11 = &v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
        long long v12 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 48];
        long long v22 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 32];
        long long v23 = v12;
        long long v24 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 64];
        long long v13 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 16];
        long long v20 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
        long long v21 = v13;
        *(_OWORD *)id v11 = v18;
        *((_OWORD *)v11 + 1) = v17;
        *((_OWORD *)v11 + 2) = v16;
        *((_OWORD *)v11 + 3) = v15;
        *((_OWORD *)v11 + 4) = v14;
        sub_24D145384((float *)&v20);
      }
    }
  }
}

uint64_t sub_24D1463F8(uint64_t a1)
{
  return sub_24D146404(a1, &qword_26B189198);
}

uint64_t sub_24D146404(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24D14B3F0;
  *(void *)(v3 + 32) = 1852399975;
  *(void *)(v3 + 40) = 0xE400000000000000;
  if (qword_26B189298 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)algn_26B189BF8;
  *(void *)(v3 + 48) = qword_26B189BF0;
  *(void *)(v3 + 56) = v4;
  *a2 = v3;
  return swift_bridgeObjectRetain();
}

id sub_24D1464B0()
{
  uint64_t v1 = OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView];
  }
  else
  {
    uint64_t v4 = v0;
    objc_msgSend(v0, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    char v13 = v0[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity];
    id v14 = objc_msgSend(self, sel_rootSettings);
    id v15 = objc_msgSend(v14, sel_intelligentEdgeLightKeylineStyleColorMatrix);

    objc_msgSend(v15, sel_caColorMatrix);
    double v16 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_edrGain];
    id v17 = objc_allocWithZone((Class)type metadata accessor for AnimatableLightView());
    id v18 = sub_24D1455C4(v13, &v22, v6, v8, v10, v12, v16);
    id v19 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v18;
    id v3 = v18;

    uint64_t v2 = 0;
  }
  id v20 = v2;
  return v3;
}

id sub_24D146644(uint64_t a1)
{
  return sub_24D14665C(a1, type metadata accessor for AnimatableIntelligentView);
}

id sub_24D14665C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for AnimatableIntelligentView()
{
  return self;
}

unint64_t sub_24D1466C8()
{
  unint64_t result = qword_26B189510;
  if (!qword_26B189510)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B189510);
  }
  return result;
}

id sub_24D14675C(void *a1, uint64_t a2, SEL *a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for DropletParticipantView();
  return objc_msgSendSuper2(&v5, *a3);
}

void sub_24D1467B0(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, SEL *a7, SEL *a8)
{
  id v15 = (objc_class *)type metadata accessor for DropletParticipantView();
  v34.receiver = a1;
  v34.super_class = v15;
  double v16 = *a7;
  id v17 = a1;
  objc_msgSendSuper2(&v34, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  v33.receiver = v17;
  v33.super_class = v15;
  objc_msgSendSuper2(&v33, *a8, a2, a3, a4, a5);
  [v17 *a7];
  v36.origin.double x = v26;
  v36.origin.double y = v27;
  v36.size.double width = v28;
  v36.size.double height = v29;
  v35.origin.double x = v19;
  v35.origin.double y = v21;
  v35.size.double width = v23;
  v35.size.double height = v25;
  if (CGRectEqualToRect(v35, v36)
    || (uint64_t v30 = &v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews],
        swift_beginAccess(),
        (uint64_t v31 = *(void *)(*(void *)v30 + 16)) == 0))
  {
  }
  else
  {
    uint64_t v32 = *(void *)v30 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_24D146914(v32, v17, a7);
      v32 += 8;
      --v31;
    }
    while (v31);

    swift_bridgeObjectRelease();
  }
}

void sub_24D146914(uint64_t a1, void *a2, SEL *a3)
{
  uint64_t v5 = MEMORY[0x25331EC50]();
  if (v5)
  {
    double v6 = (void *)v5;
    [a2 *a3];
    id v7 = a2;
    objc_msgSend(v7, sel_bounds);
    uint64_t v9 = v8;
    uint64_t v32 = v8;
    uint64_t v35 = v10;
    objc_msgSend(v7, sel_center);
    uint64_t v12 = v11;
    uint64_t v31 = v11;
    uint64_t v33 = v13;
    objc_msgSend(v7, sel_transform);
    id v14 = v45;
    id v30 = v45;
    uint64_t v38 = v46;
    uint64_t v72 = v47;
    uint64_t v41 = v48;
    uint64_t v37 = v49;
    id v43 = v50;
    objc_msgSend(v7, sel_transform3D);
    id v15 = v45;
    uint64_t v16 = v48;
    uint64_t v28 = v48;
    id v29 = v45;
    uint64_t v34 = v49;
    uint64_t v17 = v51;
    id v42 = v50;
    uint64_t v21 = v52;
    uint64_t v22 = v46;
    uint64_t v18 = v54;
    uint64_t v39 = v53;
    uint64_t v40 = v47;
    uint64_t v26 = v54;
    uint64_t v27 = v51;
    id v20 = v55;
    uint64_t v19 = v57;
    id v36 = v56;
    uint64_t v24 = v59;
    uint64_t v25 = v58;
    uint64_t v23 = v60;

    id v45 = v7;
    uint64_t v46 = v9;
    uint64_t v47 = v35;
    uint64_t v48 = v12;
    uint64_t v49 = v33;
    id v50 = v14;
    uint64_t v51 = v38;
    uint64_t v52 = v72;
    uint64_t v53 = v41;
    uint64_t v54 = v37;
    id v55 = v43;
    id v56 = v15;
    uint64_t v57 = v22;
    uint64_t v58 = v40;
    uint64_t v59 = v16;
    uint64_t v60 = v34;
    id v61 = v42;
    uint64_t v62 = v17;
    uint64_t v63 = v21;
    uint64_t v64 = v39;
    uint64_t v65 = v18;
    id v66 = v20;
    id v67 = v36;
    uint64_t v68 = v19;
    uint64_t v69 = v25;
    uint64_t v70 = v24;
    uint64_t v71 = v23;
    (*(void (**)(id *))((*MEMORY[0x263F8EED0] & *v6) + 0x90))(&v45);
    v44[0] = v7;
    v44[1] = v32;
    v44[2] = v35;
    v44[3] = v31;
    v44[4] = v33;
    v44[5] = v30;
    v44[6] = v38;
    v44[7] = v72;
    v44[8] = v41;
    v44[9] = v37;
    v44[10] = v43;
    v44[11] = v29;
    v44[12] = v22;
    v44[13] = v40;
    v44[14] = v28;
    v44[15] = v34;
    v44[16] = v42;
    v44[17] = v27;
    v44[18] = v21;
    v44[19] = v39;
    v44[20] = v26;
    v44[21] = v20;
    v44[22] = v36;
    v44[23] = v19;
    unsigned char v44[24] = v25;
    v44[25] = v24;
    v44[26] = v23;
    nullsub_1(v44);
    sub_24D12E158((uint64_t)v44, (uint64_t)v6 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);
  }
}

char *sub_24D146C88(double a1, double a2)
{
  id v3 = v2;
  double v6 = (objc_class *)type metadata accessor for DropletParticipantView();
  v88.receiver = v3;
  v88.super_class = v6;
  objc_msgSendSuper2(&v88, sel_center);
  double v8 = v7;
  double v10 = v9;
  v87.receiver = v3;
  v87.super_class = v6;
  objc_msgSendSuper2(&v87, sel_setCenter_, a1, a2);
  unint64_t result = (char *)objc_msgSend(v3, sel_center);
  if (v8 != v13 || v10 != v12)
  {
    id v15 = &v3[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
    swift_beginAccess();
    unint64_t result = *(char **)v15;
    uint64_t v16 = *(void *)(*(void *)v15 + 16);
    if (v16)
    {
      uint64_t v17 = result + 32;
      swift_bridgeObjectRetain();
      uint64_t v18 = (void *)MEMORY[0x263F8EED0];
      do
      {
        uint64_t v19 = MEMORY[0x25331EC50](v17);
        if (v19)
        {
          id v20 = (void *)v19;
          objc_msgSend(v3, sel_center);
          uint64_t v21 = v3;
          objc_msgSend(v21, sel_bounds);
          uint64_t v23 = v22;
          uint64_t v47 = v22;
          uint64_t v50 = v24;
          objc_msgSend(v21, sel_center);
          uint64_t v26 = v25;
          uint64_t v46 = v25;
          uint64_t v48 = v27;
          objc_msgSend(v21, sel_transform);
          uint64_t v28 = v60;
          id v45 = v60;
          uint64_t v56 = v63;
          uint64_t v52 = v64;
          uint64_t v53 = v61;
          uint64_t v58 = v65;
          uint64_t v59 = v62;
          objc_msgSend(v21, sel_transform3D);
          id v29 = v60;
          uint64_t v30 = v63;
          uint64_t v43 = v63;
          uint64_t v44 = v60;
          uint64_t v49 = v64;
          uint64_t v31 = v66;
          uint64_t v57 = v65;
          uint64_t v36 = v67;
          uint64_t v37 = v61;
          uint64_t v32 = v69;
          uint64_t v54 = v68;
          uint64_t v55 = v62;
          uint64_t v41 = v69;
          uint64_t v42 = v66;
          uint64_t v35 = v70;
          uint64_t v33 = v72;
          uint64_t v51 = v71;
          uint64_t v40 = v74;
          uint64_t v38 = v73;
          uint64_t v39 = v75;

          v89[0] = v21;
          v89[1] = v23;
          v89[2] = v50;
          v89[3] = v26;
          v89[4] = v48;
          v89[5] = v28;
          v89[6] = v53;
          v89[7] = v59;
          v89[8] = v56;
          v89[9] = v52;
          v89[10] = v58;
          v89[11] = v29;
          v89[12] = v37;
          v89[13] = v55;
          v89[14] = v30;
          v89[15] = v49;
          v89[16] = v57;
          v89[17] = v31;
          v89[18] = v36;
          v89[19] = v54;
          v89[20] = v32;
          v89[21] = v35;
          v89[22] = v51;
          v89[23] = v33;
          v89[24] = v38;
          uint64_t v34 = *v18 & *v20;
          v89[25] = v40;
          v89[26] = v39;
          (*(void (**)(void *))(v34 + 144))(v89);
          uint64_t v60 = v21;
          uint64_t v61 = v47;
          uint64_t v62 = v50;
          uint64_t v63 = v46;
          uint64_t v64 = v48;
          uint64_t v65 = v45;
          uint64_t v66 = v53;
          uint64_t v67 = v59;
          uint64_t v68 = v56;
          uint64_t v69 = v52;
          uint64_t v70 = v58;
          uint64_t v71 = v44;
          uint64_t v72 = v37;
          uint64_t v73 = v55;
          uint64_t v74 = v43;
          uint64_t v75 = v49;
          uint64_t v76 = v57;
          uint64_t v77 = v42;
          uint64_t v78 = v36;
          uint64_t v79 = v54;
          uint64_t v80 = v41;
          double v81 = v35;
          uint64_t v82 = v51;
          uint64_t v83 = v33;
          uint64_t v84 = v38;
          uint64_t v85 = v40;
          uint64_t v86 = v39;
          nullsub_1(&v60);
          sub_24D12E158((uint64_t)&v60, (uint64_t)v20 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);
        }
        v17 += 8;
        --v16;
      }
      while (v16);
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_24D1471C4(uint64_t a1, void *a2)
{
  uint64_t v3 = MEMORY[0x25331EC50]();
  if (v3)
  {
    objc_super v4 = (void *)v3;
    objc_msgSend(a2, sel_transform);
    id v5 = a2;
    objc_msgSend(v5, sel_bounds);
    uint64_t v7 = v6;
    uint64_t v30 = v6;
    uint64_t v33 = v8;
    objc_msgSend(v5, sel_center);
    uint64_t v10 = v9;
    uint64_t v29 = v9;
    uint64_t v31 = v11;
    objc_msgSend(v5, sel_transform);
    id v12 = v43;
    id v28 = v43;
    uint64_t v36 = v44;
    uint64_t v70 = v45;
    uint64_t v39 = v46;
    uint64_t v35 = v47;
    id v41 = v48;
    objc_msgSend(v5, sel_transform3D);
    id v13 = v43;
    uint64_t v14 = v46;
    uint64_t v26 = v46;
    id v27 = v43;
    uint64_t v32 = v47;
    uint64_t v15 = v49;
    id v40 = v48;
    uint64_t v19 = v50;
    uint64_t v20 = v44;
    uint64_t v16 = v52;
    uint64_t v37 = v51;
    uint64_t v38 = v45;
    uint64_t v24 = v52;
    uint64_t v25 = v49;
    id v18 = v53;
    uint64_t v17 = v55;
    id v34 = v54;
    uint64_t v22 = v57;
    uint64_t v23 = v56;
    uint64_t v21 = v58;

    id v43 = v5;
    uint64_t v44 = v7;
    uint64_t v45 = v33;
    uint64_t v46 = v10;
    uint64_t v47 = v31;
    id v48 = v12;
    uint64_t v49 = v36;
    uint64_t v50 = v70;
    uint64_t v51 = v39;
    uint64_t v52 = v35;
    id v53 = v41;
    id v54 = v13;
    uint64_t v55 = v20;
    uint64_t v56 = v38;
    uint64_t v57 = v14;
    uint64_t v58 = v32;
    id v59 = v40;
    uint64_t v60 = v15;
    uint64_t v61 = v19;
    uint64_t v62 = v37;
    uint64_t v63 = v16;
    id v64 = v18;
    id v65 = v34;
    uint64_t v66 = v17;
    uint64_t v67 = v23;
    uint64_t v68 = v22;
    uint64_t v69 = v21;
    (*(void (**)(id *))((*MEMORY[0x263F8EED0] & *v4) + 0x90))(&v43);
    v42[0] = v5;
    v42[1] = v30;
    v42[2] = v33;
    v42[3] = v29;
    _OWORD v42[4] = v31;
    v42[5] = v28;
    v42[6] = v36;
    v42[7] = v70;
    v42[8] = v39;
    v42[9] = v35;
    v42[10] = v41;
    v42[11] = v27;
    v42[12] = v20;
    v42[13] = v38;
    v42[14] = v26;
    v42[15] = v32;
    v42[16] = v40;
    v42[17] = v25;
    v42[18] = v19;
    v42[19] = v37;
    v42[20] = v24;
    v42[21] = v18;
    v42[22] = v34;
    v42[23] = v17;
    v42[24] = v23;
    v42[25] = v22;
    v42[26] = v21;
    nullsub_1(v42);
    sub_24D12E158((uint64_t)v42, (uint64_t)v4 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);
  }
}

void sub_24D1476F8(uint64_t a1, void *a2)
{
  uint64_t v3 = MEMORY[0x25331EC50]();
  if (v3)
  {
    objc_super v4 = (void *)v3;
    objc_msgSend(a2, sel_transform3D);
    id v5 = a2;
    objc_msgSend(v5, sel_bounds);
    uint64_t v70 = v6;
    uint64_t v41 = v7;
    objc_msgSend(v5, sel_center);
    uint64_t v38 = v9;
    uint64_t v39 = v8;
    objc_msgSend(v5, sel_transform);
    id v10 = v43;
    uint64_t v11 = v44;
    uint64_t v30 = v44;
    id v31 = v43;
    uint64_t v12 = v45;
    uint64_t v13 = v46;
    uint64_t v28 = v46;
    uint64_t v29 = v45;
    uint64_t v24 = v47;
    id v36 = v48;
    objc_msgSend(v5, sel_transform3D);
    id v14 = v43;
    uint64_t v15 = v46;
    uint64_t v26 = v46;
    id v27 = v43;
    uint64_t v32 = v44;
    uint64_t v33 = v47;
    uint64_t v16 = v49;
    id v40 = v48;
    uint64_t v25 = v49;
    uint64_t v34 = v50;
    uint64_t v35 = v45;
    uint64_t v17 = v52;
    uint64_t v37 = v51;
    id v22 = v54;
    id v23 = v53;
    uint64_t v20 = v56;
    uint64_t v21 = v55;
    uint64_t v18 = v58;
    uint64_t v19 = v57;

    id v43 = v5;
    uint64_t v44 = v70;
    uint64_t v45 = v41;
    uint64_t v46 = v39;
    uint64_t v47 = v38;
    id v48 = v10;
    uint64_t v49 = v11;
    uint64_t v50 = v12;
    uint64_t v51 = v13;
    uint64_t v52 = v24;
    id v53 = v36;
    id v54 = v14;
    uint64_t v55 = v32;
    uint64_t v56 = v35;
    uint64_t v57 = v15;
    uint64_t v58 = v33;
    id v59 = v40;
    uint64_t v60 = v16;
    uint64_t v61 = v34;
    uint64_t v62 = v37;
    uint64_t v63 = v17;
    id v64 = v23;
    id v65 = v22;
    uint64_t v66 = v21;
    uint64_t v67 = v20;
    uint64_t v68 = v19;
    uint64_t v69 = v18;
    (*(void (**)(id *))((*MEMORY[0x263F8EED0] & *v4) + 0x90))(&v43);
    v42[0] = v5;
    v42[1] = v70;
    v42[2] = v41;
    v42[3] = v39;
    _OWORD v42[4] = v38;
    v42[5] = v31;
    v42[6] = v30;
    v42[7] = v29;
    v42[8] = v28;
    v42[9] = v24;
    v42[10] = v36;
    v42[11] = v27;
    v42[12] = v32;
    v42[13] = v35;
    v42[14] = v26;
    v42[15] = v33;
    v42[16] = v40;
    v42[17] = v25;
    v42[18] = v34;
    v42[19] = v37;
    v42[20] = v17;
    v42[21] = v23;
    v42[22] = v22;
    v42[23] = v21;
    v42[24] = v20;
    v42[25] = v19;
    v42[26] = v18;
    nullsub_1(v42);
    sub_24D12E158((uint64_t)v42, (uint64_t)v4 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);
  }
}

uint64_t sub_24D148010()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    unint64_t v4 = 0;
    uint64_t v5 = 5;
    while (1)
    {
      sub_24D12C2A0(v2 + v5 * 8 - 8, (uint64_t)v17);
      uint64_t v6 = (void *)MEMORY[0x25331EC50](v17);

      sub_24D1276AC((uint64_t)v17, &qword_26B189230);
      if (!v6) {
        break;
      }
      ++v4;
      ++v5;
      if (v3 == v4)
      {
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v8 = *(void *)(*v1 + 16);
        goto LABEL_10;
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    int64_t v8 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_37;
    }
    uint64_t v9 = *v1;
    unint64_t v10 = *(void *)(*v1 + 16);
    if (v8 != v10)
    {
      unint64_t v11 = v4 + 1;
      while (v11 < v10)
      {
        sub_24D12C2A0(v9 + v5 * 8, (uint64_t)v17);
        uint64_t v12 = (void *)MEMORY[0x25331EC50](v17);

        uint64_t result = sub_24D1276AC((uint64_t)v17, &qword_26B189230);
        if (v12)
        {
          if (v11 != v4)
          {
            if ((v4 & 0x8000000000000000) != 0) {
              goto LABEL_31;
            }
            uint64_t v13 = (void *)*v1;
            unint64_t v14 = *(void *)(*v1 + 16);
            if (v4 >= v14) {
              goto LABEL_32;
            }
            uint64_t result = sub_24D12C2A0((uint64_t)&v13[v4 + 4], (uint64_t)v17);
            if (v11 >= v14) {
              goto LABEL_33;
            }
            sub_24D12C2A0((uint64_t)&v13[v5], (uint64_t)v16);
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            uint64_t *v1 = (uint64_t)v13;
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_24D148760(v13);
              uint64_t v13 = (void *)result;
              uint64_t *v1 = result;
            }
            if (v4 >= v13[2]) {
              goto LABEL_34;
            }
            uint64_t result = sub_24D1489F0((uint64_t)v16, (uint64_t)&v13[v4 + 4]);
            if (v11 >= *(void *)(*v1 + 16)) {
              goto LABEL_35;
            }
            uint64_t result = sub_24D1489F0((uint64_t)v17, *v1 + v5 * 8);
          }
          if (__OFADD__(v4++, 1)) {
            goto LABEL_30;
          }
        }
        int64_t v8 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_29;
        }
        uint64_t v9 = *v1;
        unint64_t v10 = *(void *)(*v1 + 16);
        ++v11;
        ++v5;
        if (v8 == v10) {
          goto LABEL_9;
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
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
LABEL_9:
    uint64_t v3 = v4;
LABEL_10:
    if (v8 >= v3) {
      goto LABEL_11;
    }
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
  }
  else
  {
    int64_t v8 = 0;
LABEL_11:
    sub_24D1488AC(v3, v8);
    return swift_endAccess();
  }
  return result;
}

id sub_24D148288()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletParticipantView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletParticipantView()
{
  return self;
}

char *sub_24D148364(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B189530);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24D148468(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B189548);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24D148570(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1892C0);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    _OWORD v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 < a4 || v10 + 4 >= &a4[v8 + 4])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10 != a4)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_24D1486D0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24D149468();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x25331E4C0);
}

char *sub_24D14874C(uint64_t a1)
{
  return sub_24D148468(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_24D148760(void *a1)
{
  return sub_24D148570(0, a1[2], 0, a1);
}

void sub_24D148774()
{
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_isIntelligentLightViewHidden] = 1;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
  uint64_t v2 = *MEMORY[0x263F834E8];
  uint64_t v3 = *(void *)(MEMORY[0x263F834E8] + 8);
  uint64_t v4 = *(void *)(MEMORY[0x263F834E8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F834E8] + 24);
  void *v1 = *MEMORY[0x263F834E8];
  v1[1] = v3;
  v1[2] = v4;
  v1[3] = v5;
  unint64_t v6 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
  *unint64_t v6 = v2;
  v6[1] = v3;
  void v6[2] = v4;
  v6[3] = v5;
  int64_t v7 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets];
  *int64_t v7 = v2;
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = v5;
  uint64_t v8 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  v8[80] = 1;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineEDRGain] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation] = 0x3FF0000000000000;
  *(void *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews] = MEMORY[0x263F8EE78];

  sub_24D149448();
  __break(1u);
}

uint64_t sub_24D1488AC(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_24D148570(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v12 = v4[2];
  if (__OFSUB__(v12, a2)) {
    goto LABEL_27;
  }
  if (v6 < a2 || &v4[v6 + 4] >= &v4[a2 + 4 + v12 - a2])
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v6 != a2)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFADD__(v13, v8);
  uint64_t v15 = v13 - v7;
  if (!v14)
  {
    v4[2] = v15;
LABEL_21:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24D1489F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B189230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

double *sub_24D148A58(double *result)
{
  double v3 = result[3];
  double v2 = result[4];
  switch(*(void *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge])
  {
    case 1:
      double v4 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
      double v2 = CGRectGetMinY(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds])
         + v4 * -0.5;
      goto LABEL_6;
    case 2:
      double v5 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 8];
      double v3 = CGRectGetMinX(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds])
         + v5 * -0.5;
      goto LABEL_6;
    case 4:
      double v7 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 16];
      double v2 = v7 * 0.5
         + CGRectGetMaxY(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds]);
      goto LABEL_6;
    case 8:
      double v6 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 24];
      double v3 = v6 * 0.5
         + CGRectGetMaxX(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds]);
LABEL_6:
      BSRectWithSize();
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      objc_msgSend(v1, sel_bounds);
      v21.origin.double x = v9;
      v21.origin.double y = v11;
      v21.size.double width = v13;
      v21.size.double height = v15;
      if (!CGRectEqualToRect(v20, v21)) {
        objc_msgSend(v1, sel_setBounds_, v9, v11, v13, v15);
      }
      uint64_t result = (double *)objc_msgSend(v1, sel_center);
      if (v17 != v3 || v16 != v2)
      {
        uint64_t result = (double *)objc_msgSend(v1, sel_setCenter_, v3, v2);
      }
      break;
    default:
      return result;
  }
  return result;
}

id sub_24D148C8C(uint64_t a1, char a2)
{
  int v3 = v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden];
  v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden] = a2;
  if (v3 != (a2 & 1))
  {
    BOOL v4 = (a2 & 1) != 0
      || (*(void *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge] & ~*(void *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges]) != 0;
    return objc_msgSend(v2, sel_setHidden_, v4);
  }
  return result;
}

id sub_24D148CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges];
  *(void *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges] = a2;
  if (v3 != a2)
  {
    BOOL v4 = (v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden] & 1) != 0
      || (*(void *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge] & ~a2) != 0;
    return objc_msgSend(v2, sel_setHidden_, v4);
  }
  return result;
}

void sub_24D148D40(double a1, double a2, double a3, double a4)
{
  double v5 = (double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
  double v6 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
  double v7 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 8];
  double v8 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 16];
  double v9 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 24];
  *double v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  if (v6 != a1 || v7 != a2 || v8 != a3 || v9 != a4)
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    objc_msgSend(v4, sel_layoutIfNeeded);
  }
}

void *sub_24D148DB8(char *a1, uint64_t a2)
{
  BOOL v4 = &v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds];
  *(_OWORD *)BOOL v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *(void *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge] = a2;
  double v5 = v2;
  unsigned __int8 v6 = objc_msgSend(a1, sel_isHidden);
  v5[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden] = v6;
  *(void *)&v5[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges] = *(void *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
  double v7 = &v5[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
  long long v8 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 16];
  *(_OWORD *)double v7 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
  *((_OWORD *)v7 + 1) = v8;

  double v9 = a1;
  double v10 = sub_24D134078(v9);
  BOOL v11 = (*((unsigned char *)v10 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden) & 1) != 0
     || (*(void *)((char *)v10 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge) & ~*(void *)((char *)v10 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges)) != 0;
  double v12 = v10;
  objc_msgSend(v12, sel_setHidden_, v11);

  return v12;
}

id sub_24D149024()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletBoundaryView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletBoundaryView()
{
  return self;
}

uint64_t sub_24D14907C(void *a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 7104878;
  }
  uint64_t v13 = 0;
  v14[0] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v1 = a1;
  objc_msgSend(v1, sel_getRed_green_blue_alpha_, v14, &v13, &v12, &v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858648);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24D14BAF0;
  uint64_t v3 = v14[0];
  uint64_t v4 = MEMORY[0x263F8EF38];
  *(void *)(v2 + 56) = MEMORY[0x263F8EF38];
  unint64_t v5 = sub_24D14221C();
  *(void *)(v2 + 64) = v5;
  *(void *)(v2 + 32) = v3;
  uint64_t v6 = v13;
  *(void *)(v2 + 96) = v4;
  *(void *)(v2 + 104) = v5;
  *(void *)(v2 + 72) = v6;
  uint64_t v7 = v12;
  *(void *)(v2 + 136) = v4;
  *(void *)(v2 + 144) = v5;
  *(void *)(v2 + 112) = v7;
  uint64_t v8 = v11;
  *(void *)(v2 + 176) = v4;
  *(void *)(v2 + 184) = v5;
  *(void *)(v2 + 152) = v8;
  uint64_t v9 = sub_24D149278();

  return v9;
}

uint64_t sub_24D1491B8()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_24D1491C8()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_24D1491D8()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_24D1491E8()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_24D1491F8()
{
  return MEMORY[0x270F79580]();
}

uint64_t sub_24D149208()
{
  return MEMORY[0x270F79588]();
}

uint64_t sub_24D149218()
{
  return MEMORY[0x270F79590]();
}

uint64_t sub_24D149228()
{
  return MEMORY[0x270F81B48]();
}

uint64_t sub_24D149238()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24D149248()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24D149258()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D149268()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D149278()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24D149288()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D149298()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D1492A8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24D1492B8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D1492C8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D1492D8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24D1492E8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24D1492F8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24D149308()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24D149318()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24D149328()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24D149338()
{
  return MEMORY[0x270EE58F8]();
}

uint64_t sub_24D149348()
{
  return MEMORY[0x270F79598]();
}

uint64_t sub_24D149358()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_24D149368()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_24D149378()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24D149388()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D1493A8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24D1493B8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D1493C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24D1493D8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24D1493E8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24D1493F8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24D149408()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24D149418()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24D149428()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24D149438()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24D149448()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24D149458()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_24D149468()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24D149478()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24D149488()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24D149498()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D1494A8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D1494B8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24D1494C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D1494D8()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_24D1494E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D1494F8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24D149508()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D149518()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24D149528()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t CAColorMatrixMakeMultiplyColor()
{
  return MEMORY[0x270EFB778]();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x270EFB900](a, b);
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x270EFB990]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F82E58]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}