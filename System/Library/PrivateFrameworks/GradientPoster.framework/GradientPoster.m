double Look.GradientOptions.init()@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 1.0;
  *a1 = xmmword_230F18710;
  return result;
}

double Look.GradientOptions.backlightProgress.getter()
{
  return *(double *)v0;
}

void Look.GradientOptions.backlightProgress.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*Look.GradientOptions.backlightProgress.modify())()
{
  return nullsub_1;
}

double Look.GradientOptions.unlockProgress.getter()
{
  return *(double *)(v0 + 8);
}

void Look.GradientOptions.unlockProgress.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*Look.GradientOptions.unlockProgress.modify())()
{
  return nullsub_1;
}

uint64_t sub_230F0FE34()
{
  switch(*v0)
  {
    case 1:
    case 2:
    case 3:
    case 5:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_230F18720;
      uint64_t v2 = *MEMORY[0x263F15EC0];
      v3 = self;
      *(void *)(v1 + 32) = objc_msgSend(v3, sel_functionWithName_, v2);
      id v4 = objc_msgSend(v3, sel_functionWithName_, *MEMORY[0x263F15EB0]);
      break;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_230F18720;
      id v15 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v16) = 995211031;
      LODWORD(v17) = 1003599639;
      LODWORD(v18) = 1054578888;
      LODWORD(v19) = 1065245842;
      *(void *)(v1 + 32) = objc_msgSend(v15, sel_initWithControlPoints__::, v16, v17, v18, v19);
      id v20 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v21) = 1054280253;
      LODWORD(v22) = 1058556766;
      LODWORD(v23) = 1065245842;
      id v4 = objc_msgSend(v20, sel_initWithControlPoints__::, v21, 0.0, v23, v22);
      break;
    default:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_230F18720;
      id v5 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1007263783;
      LODWORD(v7) = 1053458170;
      LODWORD(v8) = 1057444436;
      LODWORD(v9) = 1.0;
      *(void *)(v1 + 32) = objc_msgSend(v5, sel_initWithControlPoints__::, v6, v7, v8, v9);
      id v10 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v11) = 1058912443;
      LODWORD(v12) = -1152272617;
      LODWORD(v13) = 1.0;
      LODWORD(v14) = 1.0;
      id v4 = objc_msgSend(v10, sel_initWithControlPoints__::, v11, v12, v13, v14);
      break;
  }
  *(void *)(v1 + 40) = v4;
  sub_230F18090();
  return v1;
}

uint64_t sub_230F10080()
{
  uint64_t v1 = (uint64_t)*(&off_264BC31A8 + *v0);
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_230F1756C(0, v2, 0);
    uint64_t v4 = 0;
    uint64_t v3 = v9;
    unint64_t v5 = *(void *)(v9 + 16);
    do
    {
      double v6 = *(double *)(v1 + 8 * v4 + 32);
      unint64_t v7 = *(void *)(v9 + 24);
      if (v5 >= v7 >> 1) {
        sub_230F1756C((char *)(v7 > 1), v5 + 1, 1);
      }
      ++v4;
      *(void *)(v9 + 16) = v5 + 1;
      *(double *)(v9 + 8 * v5++ + 32) = v6 + (0.5 - v6) * 0.0;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
  }
  return v3;
}

GradientPoster::Look::Variant_optional __swiftcall Look.Variant.init(rawValue:)(Swift::String rawValue)
{
  int64_t v2 = v1;
  unint64_t v3 = sub_230F18180();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *int64_t v2 = v5;
  return result;
}

void *static Look.Variant.allCases.getter()
{
  return &unk_26E5D9CA0;
}

unint64_t Look.Variant.rawValue.getter()
{
  return ((unint64_t)*v0 << 48) + 0x31746573657270;
}

uint64_t sub_230F10214(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_230F10220(*a1, *a2);
}

uint64_t sub_230F10220(unsigned __int8 a1, unsigned __int8 a2)
{
  if ((unint64_t)a1 << 48 == (unint64_t)a2 << 48) {
    char v2 = 1;
  }
  else {
    char v2 = sub_230F18190();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_230F10298()
{
  return sub_230F102A0();
}

uint64_t sub_230F102A0()
{
  return sub_230F181C0();
}

uint64_t sub_230F10308()
{
  sub_230F18060();

  return swift_bridgeObjectRelease();
}

uint64_t sub_230F10350()
{
  return sub_230F10358();
}

uint64_t sub_230F10358()
{
  return sub_230F181C0();
}

GradientPoster::Look::Variant_optional sub_230F103BC(Swift::String *a1)
{
  return Look.Variant.init(rawValue:)(*a1);
}

void sub_230F103C8(void *a1@<X8>)
{
  *a1 = ((unint64_t)*v1 << 48) + 0x31746573657270;
  a1[1] = 0xE700000000000000;
}

void sub_230F103EC(void *a1@<X8>)
{
  *a1 = &unk_26E5D9CA0;
}

id Look.baseColor.getter()
{
  return *v0;
}

void Look.variant.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

void static Look.load(userInfo:bundle:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v6 = sub_230F1127C((uint64_t)v17), (v7 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_230F112C0((uint64_t)v17);
  if (!*((void *)&v19 + 1))
  {
    sub_230F11314((uint64_t)&v18);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    LOBYTE(v9) = 0;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = 0x746E6169726176;
  v8._object = (void *)0xE700000000000000;
  Look.Variant.init(rawValue:)(v8);
  LOBYTE(v9) = v17[0];
  if (v17[0] == 6) {
    unint64_t v9 = 0x40302010005uLL >> (8 * sub_230F116C4());
  }
  else {
    swift_bridgeObjectRelease();
  }
LABEL_11:
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_230F1127C((uint64_t)v17), (v11 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_230F112C0((uint64_t)v17);
  if (*((void *)&v19 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE38);
    if (swift_dynamicCast())
    {
      id v12 = _sSo7UIColorC14GradientPosterE4load8userInfoABSgSDys11AnyHashableVypG_tFZ_0(0x6F6C6F4365736162);
      swift_bridgeObjectRelease();
      if (!v12) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
  }
  else
  {
    sub_230F11314((uint64_t)&v18);
  }
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v13 = sub_230F1127C((uint64_t)v17), (v14 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_230F112C0((uint64_t)v17);
  if (*((void *)&v19 + 1))
  {
    if (swift_dynamicCast())
    {
      id v15 = a2;
      double v16 = (void *)sub_230F18040();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(self, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v16, v15, 0);

      if (v12) {
        goto LABEL_31;
      }
    }
  }
  else
  {
    sub_230F11314((uint64_t)&v18);
  }
  id v12 = _sSo7UIColorC14GradientPosterE4load8userInfoABSgSDys11AnyHashableVypG_tFZ_0(a1);
  if (!v12)
  {
LABEL_30:
    id v12 = 0;
    LOBYTE(v9) = 0;
  }
LABEL_31:
  *(void *)a3 = v12;
  *(unsigned char *)(a3 + 8) = v9;
}

GradientPoster::Look __swiftcall Look.init(baseColor:variant:)(UIColor baseColor, GradientPoster::Look::Variant variant)
{
  char v3 = *(unsigned char *)variant;
  *(UIColor *)uint64_t v2 = baseColor;
  *(unsigned char *)(v2 + 8) = v3;
  result.baseColor = baseColor;
  result.variant = variant;
  return result;
}

unint64_t Look.userInfo.getter()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F18730;
  uint64_t v3 = MEMORY[0x263F8D310];
  sub_230F180E0();
  unint64_t v4 = UIColor.userInfo.getter();
  *(void *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE38);
  *(void *)(inited + 72) = v4;
  sub_230F180E0();
  *(void *)(inited + 168) = v3;
  *(void *)(inited + 144) = (v1 << 48) + 0x31746573657270;
  *(void *)(inited + 152) = 0xE700000000000000;
  return sub_230F1086C(inited);
}

unint64_t sub_230F1086C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF20);
  uint64_t v2 = sub_230F18170();
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
    sub_230F11C38(v6, (uint64_t)v15);
    unint64_t result = sub_230F1127C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_230F11CA0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

id Look.upperColor.getter()
{
  id v0 = sub_230F11F30(1.0);
  sub_230F1206C();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_230F11480(v1, (uint64_t)&unk_26E5DA1B0, (double (*)(uint64_t, double, double))sub_230F11D84);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_230F12DFC(v3);
  swift_bridgeObjectRelease();
  sub_230F12118(v4);
  float64x2_t v19 = v5;
  swift_bridgeObjectRelease();
  v6.f64[0] = sub_230F11108((float64x2_t)0, 0.0, v19);
  float64x2_t v7 = v6;
  __asm { FMOV            V0.2D, #1.0 }
  float64_t v13 = sub_230F111BC(_Q0, _Q0.f64[0], v7);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v13, v14, v15, v16);

  return v17;
}

uint64_t Look.gradientIn(bounds:options:)@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = a1[1];
  uint64_t v5 = *(unsigned __int8 *)(v2 + 8);
  id v6 = sub_230F11F30(*a1);
  v7.f64[0] = sub_230F1206C();
  float64x2_t v59 = v7;
  switch(v5)
  {
    case 5:
      swift_bridgeObjectRelease();
      float64x2_t v56 = v59;
      break;
    default:
      char v8 = sub_230F18190();
      swift_bridgeObjectRelease();
      float64x2_t v56 = v59;
      if ((v8 & 1) == 0)
      {
        if (qword_26AF0DE28 != -1) {
          swift_once();
        }
        uint64_t v9 = (void *)swift_bridgeObjectRetain();
        sub_230F12118(v9);
        long double v57 = v10;
        swift_bridgeObjectRelease();
        pow(v57, 10.0);
        pow(1.0 - v57, 10.0);
        if (qword_26AF0DE30 != -1) {
          swift_once();
        }
        long long v11 = (void *)swift_bridgeObjectRetain();
        sub_230F12118(v11);
        float64x2_t v56 = v12;
        swift_bridgeObjectRelease();
      }
      break;
  }
  double v13 = 1.0 - v4;
  if (v4 < 0.5) {
    double v13 = v4;
  }
  double v14 = v13 + v13;
  uint64_t v15 = (uint64_t)*(&off_264BC31A8 + (char)v5);
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_230F10080();
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_230F11480(v15, v16, (double (*)(uint64_t, double, double))sub_230F1176C);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = swift_bridgeObjectRelease();
  if (v14 <= 1.0) {
    v20.n128_f64[0] = v14 * (v14 * v14) * (v14 * (v14 * 6.0 + -15.0) + 10.0);
  }
  else {
    v20.n128_f64[0] = 1.0;
  }
  if (v14 < 0.0) {
    v20.n128_f64[0] = 0.0;
  }
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v21 = swift_bridgeObjectRetain();
  sub_230F11480(v21, (uint64_t)&unk_26E5DA1E8, (double (*)(uint64_t, double, double))sub_230F11D84);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  v24 = (void *)sub_230F12DFC(v18);
  swift_bridgeObjectRelease();
  v25 = (void *)sub_230F12DFC(v23);
  swift_bridgeObjectRelease();
  sub_230F12118(v25);
  float64x2_t v55 = v26;
  swift_bridgeObjectRelease();
  sub_230F12118(v24);
  float64x2_t v58 = v27;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_230F18740;
  v29.f64[0] = sub_230F11108((float64x2_t)0, 0.0, v55);
  float64x2_t v30 = v29;
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v60 = _Q0;
  float64_t v36 = sub_230F111BC(_Q0, _Q0.f64[0], v30);
  *(void *)(v28 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v36, v37, v38, v39);
  v40.f64[0] = sub_230F11108((float64x2_t)0, 0.0, v56);
  float64_t v41 = sub_230F111BC(v60, v60.f64[0], v40);
  *(void *)(v28 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v41, v42, v43, v44);
  v45.f64[0] = sub_230F11108((float64x2_t)0, 0.0, v58);
  float64_t v46 = sub_230F111BC(v60, v60.f64[0], v45);
  *(void *)(v28 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v46, v47, v48, v49);
  sub_230F18090();
  sub_230F154C4(v28, a2);
  *(_OWORD *)(a2 + 24) = xmmword_230F18750;
  *(_OWORD *)(a2 + 40) = xmmword_230F18760;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE70);
  uint64_t v50 = swift_allocObject();
  uint64_t v51 = v50;
  *(_OWORD *)(v50 + 16) = xmmword_230F18770;
  *(void *)(v50 + 32) = 0;
  double v52 = 0.33;
  if (v5 != 2) {
    double v52 = 0.5;
  }
  *(double *)(v50 + 40) = v52;
  *(void *)(v50 + 48) = 0x3FF0000000000000;
  swift_bridgeObjectRelease();
  *(void *)(a2 + 16) = v51;
  uint64_t v53 = sub_230F0FE34();

  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 64) = v53;
  return result;
}

BOOL sub_230F110D8(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_230F110EC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_230F110FC(void *a1@<X8>)
{
  *a1 = *v1;
}

float64_t sub_230F11108(float64x2_t a1, double a2, float64x2_t a3)
{
  double v3 = a1.f64[0];
  unsigned __int8 v4 = vmovn_s64(vcgtq_f64(a1, a3)).u8[0];
  if ((*(void *)&a3.f64[0] & 0xFFFFFFFFFFFFFLL) == 0) {
    a1.f64[0] = a3.f64[0];
  }
  if ((~*(void *)&a3.f64[0] & 0x7FF0000000000000) != 0) {
    a1.f64[0] = a3.f64[0];
  }
  if (v4) {
    a1.f64[0] = v3;
  }
  return a1.f64[0];
}

float64_t sub_230F111BC(float64x2_t a1, double a2, float64x2_t a3)
{
  double v3 = a1.f64[0];
  unsigned __int8 v4 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(a3, a1))).u8[0];
  if ((*(void *)&a3.f64[0] & 0xFFFFFFFFFFFFFLL) == 0) {
    a1.f64[0] = a3.f64[0];
  }
  if ((~*(void *)&a3.f64[0] & 0x7FF0000000000000) != 0) {
    a1.f64[0] = a3.f64[0];
  }
  if ((v4 & 1) == 0) {
    a1.f64[0] = v3;
  }
  return a1.f64[0];
}

unint64_t sub_230F1127C(uint64_t a1)
{
  uint64_t v2 = sub_230F180C0();

  return sub_230F113B8(a1, v2);
}

uint64_t sub_230F112C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_230F11314(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268716110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

unint64_t sub_230F113B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_230F11CB0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x230FCF350](v9, a1);
      sub_230F112C0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_230F11480(uint64_t a1, uint64_t a2, double (*a3)(uint64_t, double, double))
{
  unint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a2 + 16);
  if (v6 >= v5) {
    int64_t v7 = *(void *)(a1 + 16);
  }
  else {
    int64_t v7 = *(void *)(a2 + 16);
  }
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_230F1756C(0, v7, 0);
  int64_t v27 = v6;
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  unint64_t v28 = v5;
  int64_t v26 = v7;
  if (v7)
  {
    unint64_t v8 = v5;
    uint64_t v9 = (double *)(a1 + 32);
    double v10 = (double *)(a2 + 32);
    swift_bridgeObjectRetain();
    uint64_t v11 = swift_bridgeObjectRetain();
    unint64_t v12 = v6;
    unint64_t v13 = v8;
    while (v13)
    {
      if (!v12) {
        goto LABEL_26;
      }
      double v14 = a3(v11, *v9, *v10);
      unint64_t v16 = *(void *)(v33 + 16);
      unint64_t v15 = *(void *)(v33 + 24);
      if (v16 >= v15 >> 1) {
        uint64_t v11 = (uint64_t)sub_230F1756C((char *)(v15 > 1), v16 + 1, 1);
      }
      --v12;
      *(void *)(v33 + 16) = v16 + 1;
      *(double *)(v33 + 8 * v16 + 32) = v14;
      --v13;
      ++v10;
      ++v9;
      if (!--v7) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = swift_bridgeObjectRetain();
LABEL_13:
    if (v28 <= v27)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v17 = 0;
    if (v26 <= v27) {
      int64_t v18 = v27;
    }
    else {
      int64_t v18 = v26;
    }
    int64_t v31 = v18 - v26;
    unint64_t v19 = v28 - v26;
    uint64_t v20 = 8 * v26 + 32;
    uint64_t v21 = v30 + v20;
    uint64_t v22 = v29 + v20;
    while (v19 != v17)
    {
      if (v27 - v26 == v17) {
        goto LABEL_24;
      }
      if (v31 == v17) {
        goto LABEL_28;
      }
      double v23 = a3(v11, *(double *)(v21 + 8 * v17), *(double *)(v22 + 8 * v17));
      unint64_t v25 = *(void *)(v33 + 16);
      unint64_t v24 = *(void *)(v33 + 24);
      if (v25 >= v24 >> 1) {
        uint64_t v11 = (uint64_t)sub_230F1756C((char *)(v24 > 1), v25 + 1, 1);
      }
      *(void *)(v33 + 16) = v25 + 1;
      *(double *)(v33 + 8 * v25 + 32) = v23;
      if (v19 == ++v17) {
        goto LABEL_24;
      }
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_230F116C4()
{
  unint64_t v0 = sub_230F18180();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_230F11710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double sub_230F1176C(double a1, double a2)
{
  return (a2 - a1) * *(double *)(v2 + 16) + a1;
}

unint64_t sub_230F11784()
{
  unint64_t result = qword_26AF0DF40;
  if (!qword_26AF0DF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF0DF40);
  }
  return result;
}

unint64_t sub_230F117DC()
{
  unint64_t result = qword_268716118;
  if (!qword_268716118)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268716120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268716118);
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

uint64_t initializeBufferWithCopyOfBuffer for Look(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for Look(id *a1)
{
}

uint64_t assignWithCopy for Look(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for Look(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Look(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Look(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Look()
{
  return &type metadata for Look;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Look.GradientOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Look.GradientOptions(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Look.GradientOptions()
{
  return &type metadata for Look.GradientOptions;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Look.Variant(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Look.Variant(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x230F11BC8);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_230F11BF0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_230F11BF8(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Look.Variant()
{
  return &type metadata for Look.Variant;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
}

uint64_t sub_230F11C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_230F11CA0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_230F11CB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void type metadata accessor for ATXPosterDescriptorFocus(uint64_t a1)
{
}

void sub_230F11D34(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t UIColor.userInfo.getter()
{
  v11[41] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11[0] = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if ((objc_msgSend(v0, sel_getRed_green_blue_alpha_, v11, &v10, &v9, &v8) & 1) == 0)
  {
    uint64_t v10 = 0x3FF0000000000000;
    v11[0] = 0x3FF0000000000000;
    uint64_t v8 = 0x3FF0000000000000;
    uint64_t v9 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F189A0;
  sub_230F180E0();
  uint64_t v2 = v11[0];
  uint64_t v3 = MEMORY[0x263F8EF38];
  *(void *)(inited + 96) = MEMORY[0x263F8EF38];
  *(void *)(inited + 72) = v2;
  sub_230F180E0();
  uint64_t v4 = v10;
  *(void *)(inited + 168) = v3;
  *(void *)(inited + 144) = v4;
  sub_230F180E0();
  uint64_t v5 = v9;
  *(void *)(inited + 240) = v3;
  *(void *)(inited + 216) = v5;
  sub_230F180E0();
  uint64_t v6 = v8;
  *(void *)(inited + 312) = v3;
  *(void *)(inited + 288) = v6;
  return sub_230F1086C(inited);
}

id sub_230F11F30(double a1)
{
  uint64_t v2 = v1;
  v8[1] = *(double *)MEMORY[0x263EF8340];
  if (a1 < 1.0)
  {
    double v7 = 0.0;
    v8[0] = 0.0;
    double v5 = 1.0;
    double v6 = 0.0;
    if (objc_msgSend(v1, sel_getHue_saturation_brightness_alpha_, v8, &v7, &v6, &v5)) {
      return objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, v8[0], v7, v6 * 0.5 + (v6 - v6 * 0.5) * a1, v5);
    }
    uint64_t v2 = v1;
  }

  return v2;
}

double sub_230F1206C()
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  v10[0] = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (objc_msgSend(v0, sel_getRed_green_blue_alpha_, v10, &v9, &v8, &v7)) {
    return *(double *)v10;
  }
  double result = 1.0;
  __asm { FMOV            V2.2D, #1.0 }
  return result;
}

uint64_t sub_230F12118(void *a1)
{
  uint64_t result = sub_230F12F50(a1);
  if (*(void *)(result + 16) >= 4uLL) {
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_230F121F0(uint64_t a1, double a2)
{
  __double2 v3 = __sincos_stret(a2 * 3.14159265 + a2 * 3.14159265 + -3.14159265);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F189A0;
  *(void *)(inited + 32) = &unk_26E5D9E98;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_230F189B0;
  *(void *)(v5 + 32) = 0;
  *(double *)(v5 + 40) = v3.__cosval + -1.0 + 1.0;
  *(double *)(v5 + 48) = -v3.__sinval;
  *(void *)(v5 + 56) = 0;
  double v6 = (v3.__cosval + -1.0) * 0.5;
  *(double *)(v5 + 64) = v3.__sinval * 0.5 - v6;
  *(void *)(inited + 40) = v5;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_230F189B0;
  *(void *)(v7 + 32) = 0;
  *(double *)(v7 + 40) = v3.__sinval;
  *(double *)(v7 + 48) = v3.__cosval + -1.0 + 1.0;
  *(void *)(v7 + 56) = 0;
  *(double *)(v7 + 64) = v3.__sinval * -0.5 - v6;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = &unk_26E5D9EE0;
  uint64_t v8 = sub_230F12A04((void *)inited, a1);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE40);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_230F12364(uint64_t a1, double a2)
{
  double v3 = a2 + a2;
  double v4 = 0.5 - (a2 + a2) * 0.5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F189A0;
  *(void *)(inited + 32) = &unk_26E5D9F28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_230F189B0;
  *(void *)(v6 + 32) = 0;
  *(double *)(v6 + 40) = v3;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 56) = 0;
  *(double *)(v6 + 64) = v4;
  *(void *)(inited + 40) = v6;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_230F189B0;
  *(void *)(v7 + 32) = 0;
  *(void *)(v7 + 40) = 0;
  *(double *)(v7 + 48) = v3;
  *(void *)(v7 + 56) = 0;
  *(double *)(v7 + 64) = v4;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = &unk_26E5D9F70;
  uint64_t v8 = sub_230F12A04((void *)inited, a1);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE40);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_230F1248C(uint64_t a1, double a2)
{
  double v3 = a2 + a2 + -1.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F189A0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_230F189B0;
  *(double *)(v5 + 32) = 1.0 - fabs(v3);
  double v6 = 0.0;
  if (v3 >= 0.0) {
    double v6 = v3;
  }
  *(void *)(v5 + 48) = 0;
  *(void *)(v5 + 56) = 0;
  *(void *)(v5 + 40) = 0;
  *(double *)(v5 + 64) = v6;
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = &unk_26E5D9FB8;
  *(void *)(inited + 48) = &unk_26E5DA000;
  *(void *)(inited + 56) = &unk_26E5DA048;
  uint64_t v7 = sub_230F12A04((void *)inited, a1);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE40);
  swift_arrayDestroy();
  return v7;
}

double sub_230F125A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE78);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_230F189A0;
  *(void *)(v0 + 32) = &unk_26E5D9D78;
  *(void *)(v0 + 40) = &unk_26E5D9DC0;
  *(void *)(v0 + 48) = &unk_26E5D9E08;
  *(void *)(v0 + 56) = &unk_26E5D9E50;
  qword_26AF0E050 = v0;
  return result;
}

double sub_230F12608()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE78);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_230F189A0;
  *(void *)(v0 + 32) = &unk_26E5DA090;
  *(void *)(v0 + 40) = &unk_26E5DA0D8;
  *(void *)(v0 + 48) = &unk_26E5DA120;
  *(void *)(v0 + 56) = &unk_26E5DA168;
  qword_26AF0E058 = v0;
  return result;
}

uint64_t sub_230F12670()
{
  v7[1] = *(double *)MEMORY[0x263EF8340];
  v7[0] = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  uint64_t v4 = 0;
  unsigned int v1 = objc_msgSend(v0, sel_getRed_green_blue_alpha_, v7, &v6, &v5, &v4);
  double v2 = 0.0;
  if (v1) {
    double v2 = v7[0] * 0.299 + v6 * 0.587 + v5 * 0.114;
  }
  return *(void *)&v2;
}

char *sub_230F12730(uint64_t a1)
{
  return sub_230F177B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id _sSo7UIColorC14GradientPosterE4load8userInfoABSgSDys11AnyHashableVypG_tFZ_0(uint64_t a1)
{
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v2 = sub_230F1127C((uint64_t)v11), (v3 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_230F112C0((uint64_t)v11);
  if (!*((void *)&v13 + 1)) {
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_230F1127C((uint64_t)v11), (v5 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_230F112C0((uint64_t)v11);
  if (!*((void *)&v13 + 1)) {
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v6 = sub_230F1127C((uint64_t)v11), (v7 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_230F112C0((uint64_t)v11);
  if (!*((void *)&v13 + 1)) {
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  sub_230F180E0();
  if (*(void *)(a1 + 16) && (unint64_t v8 = sub_230F1127C((uint64_t)v11), (v9 & 1) != 0))
  {
    sub_230F11710(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_230F112C0((uint64_t)v11);
  if (!*((void *)&v13 + 1))
  {
LABEL_26:
    sub_230F11314((uint64_t)&v12);
    return 0;
  }
  if (swift_dynamicCast()) {
    return objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, COERCE_DOUBLE(6579570), COERCE_DOUBLE(0x6E65657267), COERCE_DOUBLE(1702194274), COERCE_DOUBLE(0x6168706C61));
  }
  return 0;
}

uint64_t sub_230F12A04(void *a1, uint64_t a2)
{
  uint64_t v6 = sub_230F180A0();
  *(void *)(v6 + 16) = 5;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(void *)(v6 + 64) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE40);
  char v7 = (void *)sub_230F180A0();
  double v7[2] = 4;
  v7[4] = v6;
  v7[5] = v6;
  v7[6] = v6;
  v7[7] = v6;
  if (a1[2] < 4uLL)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (*(void *)(a2 + 16) < 4uLL)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  unint64_t v2 = v7;
  uint64_t v30 = a1;
  uint64_t v32 = *(void *)(a2 + 56);
  uint64_t v33 = a1 + 4;
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v10 = a2 + 32;
  a2 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(v10 + 8);
  swift_bridgeObjectRetain_n();
  unint64_t v11 = 0;
  while (2)
  {
    unint64_t v12 = 0;
    unint64_t v31 = v11 + 1;
    do
    {
      uint64_t v13 = v33[v12];
      if (*(void *)(v13 + 16) < 4uLL)
      {
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      if (v11 >= *(void *)(v32 + 16)) {
        goto LABEL_35;
      }
      if (v11 >= *(void *)(v8 + 16)) {
        goto LABEL_36;
      }
      if (v11 >= *(void *)(v9 + 16)) {
        goto LABEL_37;
      }
      if (v11 >= *(void *)(a2 + 16)) {
        goto LABEL_38;
      }
      if (v12 >= v2[2]) {
        goto LABEL_39;
      }
      double v3 = *(double *)(v32 + 32 + 8 * v11);
      double v14 = *(double *)(v13 + 48);
      double v15 = *(double *)(v13 + 56);
      double v16 = *(double *)(v8 + 32 + 8 * v11);
      double v17 = *(double *)(v9 + 32 + 8 * v11);
      double v18 = *(double *)(v13 + 32);
      double v19 = *(double *)(v13 + 40);
      double v20 = *(double *)(a2 + 32 + 8 * v11);
      uint64_t v21 = v2;
      v2 += v12;
      uint64_t v6 = v2[4];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v2[4] = v6;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v6 = (uint64_t)sub_230F12730(v6);
        v2[4] = v6;
      }
      if (v11 >= *(void *)(v6 + 16)) {
        goto LABEL_40;
      }
      unint64_t v2 = v21;
      ++v12;
      *(double *)(v6 + 8 * v11 + 32) = v15 * v3 + v14 * v16 + v19 * v17 + v18 * v20;
    }
    while (v12 != 4);
    ++v11;
    if (v31 != 5) {
      continue;
    }
    break;
  }
  if (*(void *)(*v33 + 16) < 5uLL) {
    goto LABEL_43;
  }
  if (!v21[2]) {
    goto LABEL_44;
  }
  double v3 = *(double *)(*v33 + 64);
  uint64_t v6 = v21[4];
  char v23 = swift_isUniquelyReferenced_nonNull_native();
  v21[4] = v6;
  if ((v23 & 1) == 0) {
LABEL_45:
  }
    uint64_t v6 = (uint64_t)sub_230F12730(v6);
  if (*(void *)(v6 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_47;
  }
  *(double *)(v6 + 64) = v3 + *(double *)(v6 + 64);
  v2[4] = v6;
  uint64_t v24 = v30[5];
  if (*(void *)(v24 + 16) < 5uLL)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v2[2] >= 2uLL)
  {
    double v3 = *(double *)(v24 + 64);
    uint64_t v6 = v2[5];
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    v2[5] = v6;
    if (v25) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t v6 = (uint64_t)sub_230F12730(v6);
LABEL_24:
  if (*(void *)(v6 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_51;
  }
  *(double *)(v6 + 64) = v3 + *(double *)(v6 + 64);
  v2[5] = v6;
  uint64_t v26 = v30[6];
  if (*(void *)(v26 + 16) < 5uLL)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v2[2] >= 3uLL)
  {
    double v3 = *(double *)(v26 + 64);
    uint64_t v6 = v2[6];
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    v2[6] = v6;
    if (v27) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t v6 = (uint64_t)sub_230F12730(v6);
LABEL_28:
  if (*(void *)(v6 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_55;
  }
  *(double *)(v6 + 64) = v3 + *(double *)(v6 + 64);
  v2[6] = v6;
  uint64_t v28 = v30[7];
  if (*(void *)(v28 + 16) < 5uLL)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (v2[2] >= 4uLL)
  {
    double v3 = *(double *)(v28 + 64);
    a2 = v2[7];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    v2[7] = a2;
    if (result) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  __break(1u);
LABEL_57:
  uint64_t result = (uint64_t)sub_230F12730(a2);
  a2 = result;
LABEL_32:
  if (*(void *)(a2 + 16) < 5uLL)
  {
    __break(1u);
  }
  else
  {
    *(double *)(a2 + 64) = v3 + *(double *)(a2 + 64);
    v2[7] = a2;
    return (uint64_t)v2;
  }
  return result;
}

uint64_t sub_230F12DFC(uint64_t a1)
{
  if (qword_26AF0DE28 != -1) {
    swift_once();
  }
  if (*(void *)(a1 + 16) == 3)
  {
    double v2 = *(double *)(a1 + 32);
    uint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v4 = sub_230F121F0(v3, v2);
    uint64_t v5 = sub_230F12364(v4, *(double *)(a1 + 40));
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_230F1248C(v5, *(double *)(a1 + 48));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26AF0DE30 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_230F12A04((void *)qword_26AF0E058, v6);
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    uint64_t result = sub_230F18150();
    __break(1u);
  }
  return result;
}

uint64_t sub_230F12F50(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE98);
  uint64_t result = sub_230F180A0();
  *(void *)(result + 16) = 4;
  if (a1[2] < 4uLL)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v3 = a1[4];
  unint64_t v4 = *(void *)(v3 + 16);
  if (!v4)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v4 == 1)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v4 < 3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v4 == 3)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v4 < 5)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  long long v5 = *(_OWORD *)(v3 + 48);
  uint64_t v6 = *(void *)(v3 + 64);
  *(_OWORD *)(result + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(result + 48) = v5;
  *(void *)(result + 64) = v6;
  uint64_t v7 = a1[5];
  unint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v8 == 1)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v8 < 3)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v8 == 3)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v8 < 5)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  long long v9 = *(_OWORD *)(v7 + 48);
  uint64_t v10 = *(void *)(v7 + 64);
  *(_OWORD *)(result + 80) = *(_OWORD *)(v7 + 32);
  *(_OWORD *)(result + 96) = v9;
  *(void *)(result + 112) = v10;
  uint64_t v11 = a1[6];
  unint64_t v12 = *(void *)(v11 + 16);
  if (!v12)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v12 == 1)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v12 < 3)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v12 == 3)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v12 < 5)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  long long v13 = *(_OWORD *)(v11 + 48);
  uint64_t v14 = *(void *)(v11 + 64);
  *(_OWORD *)(result + 128) = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(result + 144) = v13;
  *(void *)(result + 160) = v14;
  uint64_t v15 = a1[7];
  unint64_t v16 = *(void *)(v15 + 16);
  if (!v16)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v16 == 1)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v16 < 3)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v16 == 3)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v16 >= 5)
  {
    long long v17 = *(_OWORD *)(v15 + 48);
    uint64_t v18 = *(void *)(v15 + 64);
    *(_OWORD *)(result + 176) = *(_OWORD *)(v15 + 32);
    *(_OWORD *)(result + 192) = v17;
    *(void *)(result + 208) = v18;
    return result;
  }
LABEL_43:
  __break(1u);
  return result;
}

Swift::Void __swiftcall UIView.applyFullscreenConstraints(forView:)(UIView *forView)
{
  double v2 = v1;
  unint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_230F189F0;
  id v6 = objc_msgSend(v2, sel_leadingAnchor);
  uint64_t v7 = [(UIView *)forView leadingAnchor];
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v5 + 32) = v8;
  id v9 = objc_msgSend(v2, sel_trailingAnchor);
  uint64_t v10 = [(UIView *)forView trailingAnchor];
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v5 + 40) = v11;
  id v12 = objc_msgSend(v2, sel_topAnchor);
  long long v13 = [(UIView *)forView topAnchor];
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v5 + 48) = v14;
  id v15 = objc_msgSend(v2, sel_bottomAnchor);
  unint64_t v16 = [(UIView *)forView bottomAnchor];
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v5 + 56) = v17;
  sub_230F18090();
  sub_230F1547C(0, &qword_26AF0DE58);
  id v18 = (id)sub_230F18080();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);
}

id sub_230F13460()
{
  return sub_230F14E00(type metadata accessor for GradientLayerView);
}

double sub_230F13478()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_230F134C0(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*sub_230F13514())()
{
  return j_j__swift_endAccess;
}

double sub_230F13570()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_230F135B8(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*sub_230F1360C())()
{
  return j__swift_endAccess;
}

double sub_230F1366C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_230F136B4(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*sub_230F13708())()
{
  return j_j__swift_endAccess;
}

id sub_230F13764()
{
  uint64_t v1 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView;
  double v2 = *(void **)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView);
  }
  else
  {
    type metadata accessor for GradientLayerView();
    id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    double v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_230F137D8()
{
  uint64_t v1 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer;
  double v2 = *(void **)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer);
  }
  else
  {
    id v4 = sub_230F13764();
    id v5 = objc_msgSend(v4, sel_layer);

    self;
    uint64_t v3 = swift_dynamicCastObjCClassUnconditional();
    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v7 = v5;

    double v2 = 0;
  }
  id v8 = v2;
  return v3;
}

uint64_t sub_230F13884(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_230F156B0((uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_230F18740;
  id v7 = self;
  *(void *)(v6 + 32) = objc_msgSend(v7, sel_whiteColor);
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a1;
  sub_230F18090();
  uint64_t v8 = v6;
  id v9 = a1;
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_230F18740;
  *(void *)(v10 + 32) = objc_msgSend(v7, sel_blackColor);
  *(void *)(v10 + 40) = v9;
  *(void *)(v10 + 48) = v9;
  sub_230F18090();
  id v11 = v9;
  swift_bridgeObjectRelease();
  uint64_t v12 = v17[2];
  char v13 = v20;
  uint64_t v14 = v21;
  uint64_t v15 = v3 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  *(void *)uint64_t v15 = v8;
  *(void *)(v15 + 8) = v10;
  *(void *)(v15 + 16) = v12;
  *(_OWORD *)(v15 + 24) = v18;
  *(_OWORD *)(v15 + 40) = v19;
  *(unsigned char *)(v15 + 56) = v13;
  *(void *)(v15 + 64) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v3 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle) = a2;
  sub_230F14AFC(1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_230F13A84(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  *(void *)uint64_t v8 = *(void *)a1;
  *(void *)(v8 + 8) = v4;
  *(void *)(v8 + 16) = v5;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(a1 + 40);
  *(unsigned char *)(v8 + 56) = v6;
  *(void *)(v8 + 64) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_230F14AFC(a2);
}

void sub_230F13B60(CGFloat a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  uint64_t v7 = *(void **)&v2[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView];
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v8, sel_removeFromSuperview);
    id v9 = *(void **)&v3[v6];
    *(void *)&v3[v6] = 0;
  }
  uint64_t v10 = (double *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress];
  swift_beginAccess();
  double v11 = *v10;
  uint64_t v12 = (double *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress];
  swift_beginAccess();
  double v13 = *v12;
  uint64_t v14 = (double *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle];
  swift_beginAccess();
  CGFloat v15 = *v14;
  *uint64_t v14 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v16 = (void *)sub_230F137D8();
  uint64_t v17 = OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle;
  sub_230F15860(v16, *(void *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle], 0, a1, v11, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (a2 > 0.0)
  {
    *(CFTimeInterval *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp] = CACurrentMediaTime() + a2;
    *(CGFloat *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = v15;
    long long v18 = *(void **)&v3[v6];
    if (v18
      || (objc_msgSend(v3, sel_bounds),
          v23 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GradientLayerView()), sel_initWithFrame_, v19, v20, v21, v22), objc_msgSend(v3, sel_addSubview_, v23), v24 = *(void **)&v3[v6], *(void *)&v3[v6] = v23, v24, (long long v18 = *(void **)&v3[v6]) != 0))
    {
      id v25 = objc_msgSend(v18, sel_layer);
      if (v25)
      {
        uint64_t v26 = v25;
        self;
        uint64_t v27 = swift_dynamicCastObjCClass();
        if (v27)
        {
          uint64_t v28 = (void *)v27;
          uint64_t v29 = *(void *)&v3[v17];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_230F15860(v28, v29, 0, v15, v11, v13);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = *(void **)&v3[v6];
          if (v30)
          {
            id v31 = v30;
            objc_msgSend(v31, sel_setAlpha_, 0.0);
          }
        }
      }
    }
  }
}

void sub_230F13EB4(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_230F137D8();
  uint64_t v5 = OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle;
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle];
  uint64_t v7 = (CGFloat *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle];
  swift_beginAccess();
  sub_230F15860(v4, v6, 0, *v7, 0.0, 1.0);

  uint64_t v8 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  id v9 = *(void **)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView];
  if (v9) {
    goto LABEL_9;
  }
  objc_msgSend(v1, sel_bounds);
  double v11 = v10;
  double v13 = v12;
  double v14 = a1;
  double v16 = v15;
  double v18 = v17;
  id v19 = objc_allocWithZone((Class)type metadata accessor for GradientLayerView());
  double v20 = v16;
  a1 = v14;
  id v21 = objc_msgSend(v19, sel_initWithFrame_, v11, v13, v20, v18);
  objc_msgSend(v2, sel_addSubview_, v21);
  double v22 = *(void **)&v2[v8];
  *(void *)&v2[v8] = v21;

  id v9 = *(void **)&v2[v8];
  if (v9)
  {
LABEL_9:
    id v23 = objc_msgSend(v9, sel_layer);
    if (v23)
    {
      uint64_t v24 = v23;
      self;
      id v25 = (void *)swift_dynamicCastObjCClass();
      if (v25)
      {
        uint64_t v26 = v25;
        CGFloat v27 = *v7;
        *(CGFloat *)&v2[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = *v7;
        sub_230F15860(v25, *(void *)&v2[v5], 0, v27, 0.0, 1.0);
        uint64_t v28 = self;
        objc_msgSend(v28, sel_begin);
        objc_msgSend(v28, sel_setDisableActions_, 1);
        *(float *)&double v29 = a1;
        objc_msgSend(v26, sel_setOpacity_, v29);
        objc_msgSend(v28, sel_commit);
      }
    }
  }
}

void sub_230F1415C(uint64_t a1, char a2)
{
  if (*(void *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle) != a1)
  {
    *(void *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle) = a1;
    sub_230F14AFC(a2 & 1);
  }
}

void sub_230F14180(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer;
  if (!*(void *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer])
  {
    CFTimeInterval v4 = CACurrentMediaTime();
    uint64_t v5 = self;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v1;
    *(CFTimeInterval *)(v6 + 24) = v4;
    *(double *)(v6 + 32) = a1;
    v11[4] = sub_230F14F28;
    v11[5] = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_230F14370;
    v11[3] = &block_descriptor;
    uint64_t v7 = _Block_copy(v11);
    uint64_t v8 = v1;
    swift_release();
    id v9 = objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v7, 0.0166666667);
    _Block_release(v7);
    double v10 = *(void **)&v1[v2];
    *(void *)&v1[v2] = v9;
  }
}

void sub_230F142BC(void *a1, uint64_t a2, double a3, double a4)
{
  CFTimeInterval v8 = CACurrentMediaTime();
  id v9 = (double *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
  double v10 = (v8 - a3) / a4;
  swift_beginAccess();
  *id v9 = v10;
  sub_230F14AFC(0);
  if (*v9 > 1.0)
  {
    objc_msgSend(a1, sel_invalidate, *v9);
    double v11 = *(void **)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer);
    *(void *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer) = 0;

    *id v9 = 0.0;
  }
}

void sub_230F14370(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_230F143D8(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer;
  if (!*(void *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer])
  {
    id v4 = (double *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress];
    swift_beginAccess();
    double v5 = *v4;
    if (*v4 <= 0.5) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    CFTimeInterval v7 = CACurrentMediaTime();
    CFTimeInterval v8 = self;
    uint64_t v9 = swift_allocObject();
    *(CFTimeInterval *)(v9 + 16) = v7;
    *(double *)(v9 + 24) = a1;
    *(void *)(v9 + 32) = v1;
    *(double *)(v9 + 40) = v5;
    *(double *)(v9 + 48) = v6;
    aBlock[4] = sub_230F14F84;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_230F14370;
    aBlock[3] = &block_descriptor_8;
    double v10 = _Block_copy(aBlock);
    double v11 = v1;
    swift_release();
    id v12 = objc_msgSend(v8, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v10, 0.0166666667);
    _Block_release(v10);
    double v13 = *(void **)&v1[v2];
    *(void *)&v1[v2] = v12;
  }
}

void sub_230F14558(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  CFTimeInterval v10 = (CACurrentMediaTime() - a3) / a4;
  double v11 = (double *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
  swift_beginAccess();
  *double v11 = (a6 - a5) * v10 + a5;
  sub_230F14AFC(0);
  if (v10 > 1.0)
  {
    objc_msgSend(a1, sel_invalidate);
    id v12 = *(void **)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer);
    *(void *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer) = 0;

    *double v11 = a6;
  }
}

id GradientView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id GradientView.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (uint64_t)v4 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  CFTimeInterval v10 = v4;
  sub_230F156B0(v9);
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle] = 1;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress] = 0x3FF0000000000000;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp] = 0;
  *(void *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView] = 0;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for GradientView();
  id v11 = objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v12 = sub_230F13764();
  objc_msgSend(v11, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

  id v13 = v11;
  id v14 = sub_230F13764();
  objc_msgSend(v13, sel_addSubview_, v14);

  sub_230F14AFC(0);
  return v13;
}

id GradientView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t GradientView.init(coder:)(void *a1)
{
  uint64_t v3 = (uint64_t)v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  id v4 = v1;
  sub_230F156B0(v3);

  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle] = 1;
  uint64_t v5 = OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer] = 0;
  uint64_t v6 = OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress] = 0x3FF0000000000000;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle] = 0;
  uint64_t v7 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView] = 0;
  uint64_t v8 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp] = 0;
  uint64_t v9 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  *(void *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView] = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  CFTimeInterval v10 = *(void **)&v4[v9];
  type metadata accessor for GradientView();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_230F14A10()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for GradientView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  id v1 = sub_230F13764();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v3, sel_setFrame_);
  }
}

void sub_230F14AFC(char a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  objc_super v4 = *(void **)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView);
  if (v4)
  {
    id v5 = v4;
    if (*(double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp) <= CACurrentMediaTime())
    {
      objc_msgSend(v5, sel_removeFromSuperview);
      uint64_t v6 = *(void **)(v2 + v3);
      *(void *)(v2 + v3) = 0;

      id v5 = v6;
    }
  }
  uint64_t v7 = (double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
  swift_beginAccess();
  double v8 = *v7;
  uint64_t v9 = (double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
  swift_beginAccess();
  double v10 = *v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = (void *)sub_230F137D8();
  uint64_t v21 = OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle;
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle);
  id v13 = (CGFloat *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle);
  swift_beginAccess();
  sub_230F15860(v11, v12, a1 & 1, *v13, v8, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v14 = *(void **)(v2 + v3);
  if (v14)
  {
    id v15 = objc_msgSend(v14, sel_layer);
    if (v15)
    {
      objc_super v16 = v15;
      self;
      uint64_t v17 = swift_dynamicCastObjCClass();
      if (v17)
      {
        double v18 = (void *)v17;
        uint64_t v19 = *(void *)(v2 + v21);
        CGFloat v20 = *(double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_230F15860(v18, v19, a1 & 1, v20, v8, v10);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
}

uint64_t type metadata accessor for GradientLayerView()
{
  return self;
}

id GradientView.__deallocating_deinit()
{
  return sub_230F14E00(type metadata accessor for GradientView);
}

id sub_230F14E00(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_230F14EF0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_230F14F28(void *a1)
{
  sub_230F142BC(a1, *(void *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32));
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

uint64_t sub_230F14F4C()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_230F14F84(void *a1)
{
  sub_230F14558(a1, *(void *)(v1 + 32), *(double *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t type metadata accessor for GradientView()
{
  return self;
}

double sub_230F14FB8@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress, a2);
}

uint64_t sub_230F14FC4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
}

double sub_230F14FD0@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress, a2);
}

uint64_t sub_230F14FDC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
}

double sub_230F14FE8@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle, a2);
}

double keypath_getTm@<D0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  objc_super v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

uint64_t sub_230F15044(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle);
}

uint64_t keypath_setTm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t method lookup function for GradientView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GradientView);
}

uint64_t dispatch thunk of GradientView.rollingAnimProgress.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of GradientView.rollingAnimProgress.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of GradientView.rollingAnimProgress.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of GradientView.wakeProgress.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of GradientView.wakeProgress.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of GradientView.wakeProgress.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of GradientView.rotationAngle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of GradientView.rotationAngle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of GradientView.rotationAngle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of GradientView.setupFromCaseColor(_:style:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of GradientView.setupGradient(_:animated:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of GradientView.updateGradientLayerRotationAngle(_:duration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of GradientView.updateTransition(from:to:progress:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of GradientView.updateStyle(_:animated:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of GradientView.runUnlockAnimation(duration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of GradientView.runWakeAnimation(duration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t sub_230F1547C(uint64_t a1, unint64_t *a2)
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

double sub_230F154C4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F18740;
  uint64_t v5 = self;
  *(void *)(inited + 32) = objc_msgSend(v5, sel_whiteColor);
  *(void *)(inited + 40) = objc_msgSend(v5, sel_systemBlueColor);
  *(void *)(inited + 48) = objc_msgSend(v5, sel_whiteColor);
  sub_230F18090();
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_230F18740;
  *(void *)(v6 + 32) = objc_msgSend(v5, sel_blackColor);
  *(void *)(v6 + 40) = objc_msgSend(v5, sel_systemBlueColor);
  *(void *)(v6 + 48) = objc_msgSend(v5, sel_blackColor);
  sub_230F18090();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE70);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_230F18770;
  *(_OWORD *)(v7 + 32) = xmmword_230F18A50;
  *(void *)(v7 + 48) = 0x3FF0000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = a1;
  *(void *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 24) = xmmword_230F18750;
  double result = 0.5;
  *(_OWORD *)(a2 + 40) = xmmword_230F18760;
  *(unsigned char *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = MEMORY[0x263F8EE78];
  return result;
}

double sub_230F156B0@<D0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_230F18740;
  objc_super v3 = self;
  *(void *)(v2 + 32) = objc_msgSend(v3, sel_whiteColor);
  *(void *)(v2 + 40) = objc_msgSend(v3, sel_systemBlueColor);
  *(void *)(v2 + 48) = objc_msgSend(v3, sel_whiteColor);
  sub_230F18090();
  uint64_t v4 = v2;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_230F18740;
  *(void *)(v5 + 32) = objc_msgSend(v3, sel_blackColor);
  *(void *)(v5 + 40) = objc_msgSend(v3, sel_systemBlueColor);
  *(void *)(v5 + 48) = objc_msgSend(v3, sel_blackColor);
  sub_230F18090();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE70);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_230F18770;
  *(_OWORD *)(v6 + 32) = xmmword_230F18A50;
  *(void *)(v6 + 48) = 0x3FF0000000000000;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 24) = xmmword_230F18750;
  double result = 0.5;
  *(_OWORD *)(a1 + 40) = xmmword_230F18760;
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = MEMORY[0x263F8EE78];
  return result;
}

void sub_230F15860(void *a1, uint64_t a2, char a3, CGFloat a4, double a5, double a6)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  double v10 = *v6;
  unint64_t v11 = *((void *)v6 + 1);
  uint64_t v12 = *((void *)v6 + 2);
  CGFloat v115 = v6[4];
  CGFloat v116 = v6[3];
  CGFloat v117 = v6[6];
  CGFloat v118 = v6[5];
  uint64_t v119 = *((char *)v6 + 56);
  double v13 = v6[8];
  if ((a3 & 1) == 0)
  {
    id v14 = self;
    objc_msgSend(v14, sel_begin);
    objc_msgSend(v14, sel_setDisableActions_, 1);
  }
  double v15 = 0.0;
  if (a5 >= 0.0) {
    double v15 = a5;
  }
  if (a5 >= 1.0) {
    double v16 = 1.0;
  }
  else {
    double v16 = v15;
  }
  if (a2 == 2) {
    unint64_t v17 = v11;
  }
  else {
    unint64_t v17 = *(void *)&v10;
  }
  swift_bridgeObjectRetain();
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_230F18160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v18 != 3)
  {
    sub_230F18150();
    __break(1u);
    return;
  }
  double v19 = v16 * v16 * (3.0 - (v16 + v16));
  *(void *)&t1.CGFloat a = MEMORY[0x263F8EE78];
  sub_230F18120();
  uint64_t v20 = 0;
  do
  {
    if ((v17 & 0xC000000000000001) != 0) {
      id v21 = (id)MEMORY[0x230FCF370](v20, v17);
    }
    else {
      id v21 = *(id *)(v17 + 8 * v20 + 32);
    }
    double v22 = v21;
    if (a6 < 1.0)
    {
      t2.CGFloat a = 0.0;
      double v126 = 0.0;
      v127.CGFloat a = 0.0;
      double v125 = 1.0;
      if (objc_msgSend(v21, sel_getHue_saturation_brightness_alpha_, &t2, &v127, &v126, &v125))
      {
        double v16 = v126 * 0.5 + (v126 - v126 * 0.5) * a6;
        objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, t2.a, v127.a, v16, v125);
      }
    }
    ++v20;
    sub_230F18100();
    sub_230F18130();
    sub_230F18140();
    sub_230F18110();
  }
  while (v20 != 3);
  CGFloat a = t1.a;
  swift_bridgeObjectRelease();
  if (*(void *)(v12 + 16) == 3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE70);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_230F18770;
    *(_OWORD *)(v12 + 32) = xmmword_230F18A50;
    *(void *)(v12 + 48) = 0x3FF0000000000000;
  }
  CGFloat v24 = v13;
  if (*(void *)&v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_230F18160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((*(void *)&v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v25 == 2)
  {
    swift_bridgeObjectRetain();
    int64_t v26 = *(void *)(v12 + 16);
    if (v26) {
      goto LABEL_29;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    CGFloat v28 = MEMORY[0x263F8EE78];
    goto LABEL_36;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_230F18720;
  uint64_t v32 = *MEMORY[0x263F15EC0];
  uint64_t v33 = self;
  *(void *)(v31 + 32) = objc_msgSend(v33, sel_functionWithName_, v32);
  *(void *)(v31 + 40) = objc_msgSend(v33, sel_functionWithName_, *MEMORY[0x263F15EB0]);
  *(void *)&t1.CGFloat a = v31;
  sub_230F18090();
  CGFloat v24 = t1.a;
  int64_t v26 = *(void *)(v12 + 16);
  if (!v26) {
    goto LABEL_35;
  }
LABEL_29:
  *(void *)&t1.CGFloat a = MEMORY[0x263F8EE78];
  sub_230F1756C(0, v26, 0);
  uint64_t v27 = 0;
  CGFloat v28 = t1.a;
  unint64_t v29 = *(void *)(*(void *)&t1.a + 16);
  a6 = 3.0;
  do
  {
    double v16 = *(double *)(v12 + 8 * v27 + 32);
    t1.CGFloat a = v28;
    unint64_t v30 = *(void *)(*(void *)&v28 + 24);
    if (v29 >= v30 >> 1)
    {
      sub_230F1756C((char *)(v30 > 1), v29 + 1, 1);
      CGFloat v28 = t1.a;
    }
    ++v27;
    *(void *)(*(void *)&v28 + 16) = v29 + 1;
    *(double *)(*(void *)&v28 + 8 * v29++ + 32) = v16 / 3.0;
  }
  while (v26 != v27);
  swift_bridgeObjectRelease();
LABEL_36:
  v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE88);
  uint64_t inited = swift_initStackObject();
  float64_t v36 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_230F18A60;
  if ((*(void *)&a & 0xC000000000000001) != 0)
  {
    *(void *)(inited + 32) = MEMORY[0x230FCF370](0, *(void *)&a);
    v36[5] = MEMORY[0x230FCF370](1, *(void *)&a);
    v36[6] = MEMORY[0x230FCF370](2, *(void *)&a);
    v36[7] = MEMORY[0x230FCF370](1, *(void *)&a);
    v36[8] = MEMORY[0x230FCF370](0, *(void *)&a);
    v36[9] = MEMORY[0x230FCF370](1, *(void *)&a);
    id v52 = (id)MEMORY[0x230FCF370](2, *(void *)&a);
    goto LABEL_41;
  }
  unint64_t v37 = *(void *)((*(void *)&a & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v37)
  {
    __break(1u);
    goto LABEL_62;
  }
  double v38 = *(void **)(*(void *)&a + 32);
  *(void *)(inited + 32) = v38;
  if (v37 == 1)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  double v39 = *(void **)(*(void *)&a + 40);
  *(void *)(inited + 40) = v39;
  if (v37 < 3)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  float64x2_t v40 = *(void **)(*(void *)&a + 48);
  *(void *)(inited + 48) = v40;
  float64_t v41 = *(void **)(*(void *)&a + 40);
  *(void *)(inited + 56) = v41;
  double v42 = *(void **)(*(void *)&a + 32);
  *(void *)(inited + 64) = v42;
  double v43 = v24;
  double v44 = *(void **)(*(void *)&a + 40);
  *(void *)(inited + 72) = v44;
  float64x2_t v45 = *(void **)(*(void *)&a + 48);
  id v46 = v38;
  id v47 = v39;
  id v48 = v40;
  id v49 = v41;
  id v50 = v42;
  id v51 = v44;
  CGFloat v24 = v43;
  id v52 = v45;
LABEL_41:
  v34 = v52;
  swift_bridgeObjectRelease();
  v36[10] = v34;
  *(void *)&t1.CGFloat a = v36;
  sub_230F18090();
  CGFloat a = t1.a;
  float64_t v36 = (void *)*MEMORY[0x263F15EB8];
  id v53 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
  unint64_t v54 = *(void *)(*(void *)&v28 + 16);
  if (!v54)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v54 == 1)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (v54 < 3)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v34 = v53;
  double v55 = *(double *)(*(void *)&v28 + 32);
  double v16 = *(double *)(*(void *)&v28 + 40);
  a6 = *(double *)(*(void *)&v28 + 48);
  swift_bridgeObjectRelease();
  uint64_t v56 = swift_allocObject();
  float64_t v36 = (void *)v56;
  *(_OWORD *)(v56 + 16) = xmmword_230F18A70;
  double v113 = v55;
  double v114 = v19;
  if ((*(void *)&v24 & 0xC000000000000001) == 0)
  {
    uint64_t v57 = *(void *)((*(void *)&v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v57)
    {
      float64x2_t v58 = *(void **)(*(void *)&v24 + 32);
      *(void *)(v56 + 32) = v58;
      if (v57 != 1)
      {
        float64x2_t v59 = *(void **)(*(void *)&v24 + 40);
        *(void *)(v56 + 40) = v59;
        *(void *)(v56 + 48) = v34;
        *(void *)(v56 + 56) = v34;
        *(void *)(v56 + 64) = v58;
        id v60 = v34;
        id v61 = v58;
        id v62 = v59;
        id v63 = v61;
        id v64 = v62;
        goto LABEL_48;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
LABEL_67:
  v36[4] = MEMORY[0x230FCF370](0, *(void *)&v24);
  v36[5] = MEMORY[0x230FCF370](1, *(void *)&v24);
  v36[6] = v34;
  v36[7] = v34;
  id v104 = v34;
  v36[8] = MEMORY[0x230FCF370](0, *(void *)&v24);
  id v64 = (id)MEMORY[0x230FCF370](1, *(void *)&v24);
LABEL_48:
  id v65 = v64;
  swift_bridgeObjectRelease();
  double v108 = v16 + 0.333333333;
  double v109 = a6 + 0.333333333;
  double v110 = v16;
  double v111 = v16 + 0.666666667;
  double v112 = a6;
  double v121 = a6 + 0.666666667;
  v36[9] = v65;
  *(void *)&t1.CGFloat a = v36;
  sub_230F18090();
  CGAffineTransformMakeTranslation(&t1, -0.5, -0.5);
  CGFloat v66 = t1.a;
  CGFloat b = t1.b;
  CGFloat c = t1.c;
  CGFloat d = t1.d;
  CGFloat tx = t1.tx;
  CGFloat ty = t1.ty;
  CGAffineTransformMakeRotation(&t1, a4);
  long long v72 = *(_OWORD *)&t1.a;
  long long v73 = *(_OWORD *)&t1.c;
  long long v74 = *(_OWORD *)&t1.tx;
  t1.CGFloat a = v66;
  t1.CGFloat b = b;
  t1.CGFloat c = c;
  t1.CGFloat d = d;
  t1.CGFloat tx = tx;
  t1.CGFloat ty = ty;
  *(_OWORD *)&t2.CGFloat a = v72;
  *(_OWORD *)&t2.CGFloat c = v73;
  *(_OWORD *)&t2.CGFloat tx = v74;
  CGAffineTransformConcat(&v127, &t1, &t2);
  long long v105 = *(_OWORD *)&v127.c;
  long long v106 = *(_OWORD *)&v127.a;
  CGFloat v76 = v127.tx;
  CGFloat v75 = v127.ty;
  t1.CGFloat a = v66;
  t1.CGFloat b = b;
  t1.CGFloat c = c;
  t1.CGFloat d = d;
  t1.CGFloat tx = tx;
  t1.CGFloat ty = ty;
  CGAffineTransformInvert(&t2, &t1);
  *(_OWORD *)&t1.CGFloat a = v106;
  *(_OWORD *)&t1.CGFloat c = v105;
  t1.CGFloat tx = v76;
  t1.CGFloat ty = v75;
  CGAffineTransformConcat(&v127, &t1, &t2);
  CGAffineTransform t1 = v127;
  v131.y = v115;
  v131.x = v116;
  CGPoint v77 = CGPointApplyAffineTransform(v131, &t1);
  CGAffineTransformMakeTranslation(&t1, -0.5, -0.5);
  long long v78 = *(_OWORD *)&t1.a;
  CGFloat v79 = t1.c;
  CGFloat v80 = t1.d;
  long long v81 = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeRotation(&t1, a4);
  long long v82 = *(_OWORD *)&t1.a;
  long long v83 = *(_OWORD *)&t1.c;
  long long v84 = *(_OWORD *)&t1.tx;
  *(_OWORD *)&t1.CGFloat a = v78;
  t1.CGFloat c = v79;
  t1.CGFloat d = v80;
  *(_OWORD *)&t1.CGFloat tx = v81;
  *(_OWORD *)&t2.CGFloat a = v82;
  *(_OWORD *)&t2.CGFloat c = v83;
  *(_OWORD *)&t2.CGFloat tx = v84;
  CGAffineTransformConcat(&v127, &t1, &t2);
  *(_OWORD *)angleCGFloat a = *(_OWORD *)&v127.a;
  long long v107 = *(_OWORD *)&v127.c;
  CGFloat v85 = v127.tx;
  CGFloat v86 = v127.ty;
  *(_OWORD *)&t1.CGFloat a = v78;
  t1.CGFloat c = v79;
  t1.CGFloat d = v80;
  *(_OWORD *)&t1.CGFloat tx = v81;
  CGAffineTransformInvert(&t2, &t1);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)anglea;
  *(_OWORD *)&t1.CGFloat c = v107;
  t1.CGFloat tx = v85;
  t1.CGFloat ty = v86;
  CGAffineTransformConcat(&v127, &t1, &t2);
  CGAffineTransform t1 = v127;
  v132.y = v117;
  v132.x = v118;
  CGPoint v87 = CGPointApplyAffineTransform(v132, &t1);
  double v88 = v87.x - v77.x;
  double v89 = v87.y - v77.y;
  v90 = (void *)**((void **)&unk_264BC3238 + v119);
  sub_230F18050();
  id v91 = v90;
  v92 = (void *)sub_230F18040();
  swift_bridgeObjectRelease();

  objc_msgSend(a1, sel_setType_, v92);
  *(void *)&t2.CGFloat a = MEMORY[0x263F8EE78];
  sub_230F1758C(0, 7, 0);
  uint64_t v93 = 0;
  CGFloat v94 = t2.a;
  do
  {
    if ((*(void *)&a & 0xC000000000000001) != 0) {
      id v95 = (id)MEMORY[0x230FCF370](v93, *(void *)&a);
    }
    else {
      id v95 = *(id *)(*(void *)&a + 8 * v93 + 32);
    }
    v96 = v95;
    id v97 = objc_msgSend(v95, sel_CGColor);
    type metadata accessor for CGColor(0);
    t1.CGFloat d = v98;

    *(void *)&t1.CGFloat a = v97;
    t2.CGFloat a = v94;
    unint64_t v100 = *(void *)(*(void *)&v94 + 16);
    unint64_t v99 = *(void *)(*(void *)&v94 + 24);
    if (v100 >= v99 >> 1)
    {
      sub_230F1758C((char *)(v99 > 1), v100 + 1, 1);
      CGFloat v94 = t2.a;
    }
    ++v93;
    *(void *)(*(void *)&v94 + 16) = v100 + 1;
    sub_230F11CA0(&t1, (_OWORD *)(*(void *)&v94 + 32 * v100 + 32));
  }
  while (v93 != 7);
  swift_bridgeObjectRelease();
  v101 = (void *)sub_230F18080();
  swift_release();
  objc_msgSend(a1, sel_setColors_, v101);

  sub_230F1547C(0, &qword_26AF0DE60);
  v102 = (void *)sub_230F18080();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInterpolations_, v102);

  *(void *)&t1.CGFloat a = MEMORY[0x263F8EE78];
  sub_230F18120();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v113);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v110);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v112);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v108);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v109);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v111);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v121);
  sub_230F18100();
  sub_230F18130();
  sub_230F18140();
  sub_230F18110();
  sub_230F1547C(0, &qword_26AF0DE68);
  v103 = (void *)sub_230F18080();
  swift_release();
  objc_msgSend(a1, sel_setLocations_, v103);

  objc_msgSend(a1, sel_setStartPoint_, v77.x - (v114 * v88 + v114 * v88), v77.y - (v114 * v89 + v114 * v89));
  objc_msgSend(a1, sel_setEndPoint_, v87.x + (2.0 - (v114 + v114)) * v88, v87.y + (2.0 - (v114 + v114)) * v89);
  if ((a3 & 1) == 0) {
    objc_msgSend(self, sel_commit);
  }
}

BOOL static GradientType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GradientType.hash(into:)()
{
  return sub_230F181B0();
}

uint64_t GradientType.hashValue.getter()
{
  return sub_230F181C0();
}

BOOL sub_230F16700(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_230F16714()
{
  return sub_230F181C0();
}

uint64_t sub_230F1675C()
{
  return sub_230F181B0();
}

uint64_t sub_230F16788()
{
  return sub_230F181C0();
}

BOOL sub_230F167D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (double *)(a1 + 40);
  uint64_t v6 = (double *)(a2 + 40);
  do
  {
    double v7 = *v5++;
    double v8 = v7;
    double v9 = *v6++;
    double v10 = v9;
    BOOL v12 = v4-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

id sub_230F16844(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  unint64_t v6 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_230F18160();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_230F18160();
    swift_bridgeObjectRelease();
    if (v7 == v28) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v7) = 0;
    return (id)(v7 & 1);
  }
  if (v7 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v7) {
    goto LABEL_38;
  }
  uint64_t v8 = v5 & 0xFFFFFFFFFFFFFF8;
  if (v5 < 0) {
    uint64_t v8 = v5;
  }
  if (!v6) {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v10 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v10 = v11;
  }
  if (v8 == v10)
  {
LABEL_38:
    LOBYTE(v7) = 1;
    return (id)(v7 & 1);
  }
  if ((v7 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v29 = v5 & 0xC000000000000001;
  if ((v5 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v5 + 32); ; id result = (id)MEMORY[0x230FCF370](0, v5))
  {
    double v13 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v14 = (id)MEMORY[0x230FCF370](0, a2);
LABEL_22:
    double v15 = v14;
    sub_230F1547C(0, (unint64_t *)a3);
    a3 = sub_230F180B0();

    if ((a3 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v16 = v7 - 1;
    if (v7 == 1) {
      return (id)(v7 & 1);
    }
    if (((a2 | v5) & 0xC000000000000001) != 0)
    {
      uint64_t v17 = 0;
      unint64_t v18 = v7 - 2;
      while (v16 != v17)
      {
        unint64_t v7 = v17 + 1;
        if (v29) {
          id v19 = (id)MEMORY[0x230FCF370](v17 + 1, v5);
        }
        else {
          id v19 = *(id *)(v5 + 40 + 8 * v17);
        }
        a3 = (uint64_t)v19;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x230FCF370](v17 + 1, a2);
        }
        else
        {
          if (v7 >= *(void *)(v9 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v17);
        }
        id v21 = v20;
        unint64_t v7 = sub_230F180B0();

        if ((v7 & 1) != 0 && v18 != v17++) {
          continue;
        }
        return (id)(v7 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v9 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      a3 = v23 - 1;
      CGFloat v24 = (void **)(v5 + 40);
      uint64_t v9 = a2 + 40;
      while (v16)
      {
        if (!a3) {
          goto LABEL_53;
        }
        int64_t v26 = *v24++;
        uint64_t v25 = v26;
        uint64_t v27 = *(void **)v9;
        v9 += 8;
        a2 = v25;
        uint64_t v5 = v27;
        unint64_t v7 = sub_230F180B0();

        if (v7)
        {
          --a3;
          if (--v16) {
            continue;
          }
        }
        return (id)(v7 & 1);
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
  if (*(void *)(v9 + 16))
  {
    id v14 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void *static Gradient.defaultGradientColors.getter()
{
  type metadata accessor for GradientView();
  ObjCClassFromMetadatCGFloat a = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v1 = self;
  uint64_t v2 = 0;
  objc_super v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v4 = *(void *)((char *)&unk_26E5DA220 + v2 + 32);
    uint64_t v5 = *(void *)((char *)&unk_26E5DA220 + v2 + 40);
    char v6 = *((unsigned char *)&unk_26E5DA220 + v2 + 48);
    swift_bridgeObjectRetain_n();
    id v7 = v14;
    uint64_t v8 = (void *)sub_230F18040();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v1, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v8, v7, 0);

    if (v9)
    {
      swift_bridgeObjectRetain();
      sub_230F18070();
      swift_bridgeObjectRetain();
      sub_230F18070();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        objc_super v3 = sub_230F178AC(0, v3[2] + 1, 1, v3);
      }
      unint64_t v11 = v3[2];
      unint64_t v10 = v3[3];
      if (v11 >= v10 >> 1) {
        objc_super v3 = sub_230F178AC((void *)(v10 > 1), v11 + 1, 1, v3);
      }
      v3[2] = v11 + 1;
      BOOL v12 = &v3[5 * v11];
      v12[4] = v4;
      v12[5] = v5;
      v12[6] = v9;
      *((unsigned char *)v12 + 56) = v6;
      v12[8] = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v2 += 24;
  }
  while (v2 != 216);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF38);
  swift_arrayDestroy();
  return v3;
}

void Gradient.luminance(for:in:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  unint64_t v17 = *v8;
  if (*v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_230F18160();
    swift_bridgeObjectRelease();
    if (v30 != 3) {
      return;
    }
  }
  else if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) != 3)
  {
    return;
  }
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  double MidY = CGRectGetMidY(v31);
  v32.origin.x = a5;
  v32.origin.y = a6;
  v32.size.width = a7;
  v32.size.height = a8;
  if (MidY / CGRectGetMaxY(v32) >= 0.5)
  {
    unint64_t v19 = v17 & 0xC000000000000001;
    if ((v17 & 0xC000000000000001) == 0)
    {
      if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        return;
      }
      id v25 = *(id *)(v17 + 40);
      goto LABEL_13;
    }
LABEL_25:
    id v25 = (id)MEMORY[0x230FCF370](1, v17);
LABEL_13:
    int64_t v26 = v25;
    sub_230F12670();
    char v28 = v27;

    if ((v28 & 1) == 0)
    {
      if (v19)
      {
        id v24 = (id)MEMORY[0x230FCF370](2, v17);
        goto LABEL_20;
      }
      if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
      {
        id v24 = *(id *)(v17 + 48);
        goto LABEL_20;
      }
      goto LABEL_28;
    }
    return;
  }
  unint64_t v19 = v17 & 0xC000000000000001;
  if ((v17 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v20 = *(id *)(v17 + 32);
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_25;
  }
  id v20 = (id)MEMORY[0x230FCF370](0, v17);
LABEL_7:
  id v21 = v20;
  sub_230F12670();
  char v23 = v22;

  if ((v23 & 1) == 0)
  {
    if (v19)
    {
      id v24 = (id)MEMORY[0x230FCF370](1, v17);
LABEL_20:
      unint64_t v29 = v24;
      sub_230F12670();

      return;
    }
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      id v24 = *(id *)(v17 + 40);
      goto LABEL_20;
    }
    goto LABEL_27;
  }
}

id sub_230F16FE8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF28);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230F18A80;
  *(void *)(v0 + 32) = 0x6C616E6F73726570;
  *(void *)(v0 + 40) = 0xE800000000000000;
  *(void *)(v0 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.0611111111, 0.421501706, 0.9376, 1.0);
  *(unsigned char *)(v0 + 56) = 0;
  *(_OWORD *)(v0 + 64) = xmmword_230F18A90;
  *(void *)(v0 + 80) = 0xE400000000000000;
  *(void *)(v0 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.552777778, 0.779134295, 0.901, 1.0);
  *(unsigned char *)(v0 + 96) = 0;
  *(_OWORD *)(v0 + 104) = xmmword_230F18AA0;
  *(void *)(v0 + 120) = 0xE500000000000000;
  *(void *)(v0 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.597222222, 0.907103825, 0.2928, 1.0);
  *(unsigned char *)(v0 + 136) = 1;
  *(_OWORD *)(v0 + 144) = xmmword_230F18AB0;
  *(void *)(v0 + 160) = 0xE700000000000000;
  *(void *)(v0 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.375, 0.742138365, 0.7791, 1.0);
  *(unsigned char *)(v0 + 176) = 0;
  *(_OWORD *)(v0 + 184) = xmmword_230F18AC0;
  *(void *)(v0 + 200) = 0xE600000000000000;
  *(void *)(v0 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.583333333, 0.72, 1.0, 1.0);
  *(unsigned char *)(v0 + 216) = 4;
  *(_OWORD *)(v0 + 224) = xmmword_230F18AD0;
  *(void *)(v0 + 240) = 0xEB00000000737365;
  *(void *)(v0 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.491666667, 1.0, 0.78, 1.0);
  *(unsigned char *)(v0 + 256) = 4;
  *(void *)(v0 + 264) = 9;
  *(void *)(v0 + 272) = 0x676E6964616572;
  *(void *)(v0 + 280) = 0xE700000000000000;
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, 0.0972222222, 0.66, 1.0, 1.0);
  *(void *)(v0 + 288) = result;
  *(unsigned char *)(v0 + 296) = 0;
  *(void *)(v0 + 304) = 7;
  qword_26AF0DEF8 = v0;
  return result;
}

id UIColor.init(h:s:l:)(double a1, double a2, double a3)
{
  double v4 = 1.0 - a3;
  if (1.0 - a3 >= a3) {
    double v4 = a3;
  }
  double v5 = v4 * a2 + a3;
  double v6 = 0.0;
  if (v5 > 0.0) {
    double v6 = 1.0 - a3 / v5 + 1.0 - a3 / v5;
  }
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v7, sel_initWithHue_saturation_brightness_alpha_, a1 / 360.0, v6, v5, 1.0);
}

uint64_t static Gradient.focusConfigs.getter()
{
  if (qword_26AF0DEF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static Gradient.focusConfigs.setter(uint64_t a1)
{
  if (qword_26AF0DEF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26AF0DEF8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Gradient.focusConfigs.modify())()
{
  if (qword_26AF0DEF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

UIColor __swiftcall UIColor.init(r:g:b:)(Swift::Int r, Swift::Int g, Swift::Int b)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (UIColor)objc_msgSend(v6, sel_initWithRed_green_blue_alpha_, (double)r / 255.0, (double)g / 255.0, (double)b / 255.0, 1.0);
}

UIColor __swiftcall UIColor.init(packedRGB:)(Swift::UInt32 packedRGB)
{
  unsigned int v1 = BYTE2(packedRGB);
  unsigned int v2 = BYTE1(packedRGB);
  unsigned int v3 = packedRGB;
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (UIColor)objc_msgSend(v4, sel_initWithRed_green_blue_alpha_, (double)v1 / 255.0, (double)v2 / 255.0, (double)v3 / 255.0, 1.0);
}

char *sub_230F1756C(char *a1, int64_t a2, char a3)
{
  id result = sub_230F175AC(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_230F1758C(char *a1, int64_t a2, char a3)
{
  id result = sub_230F176A8(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_230F175AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE80);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_230F176A8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE90);
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
  double v13 = v10 + 32;
  id v14 = a4 + 32;
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

char *sub_230F177B0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DE80);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_230F178AC(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF28);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0DF00);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _s14GradientPoster0A0V2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(unsigned __int8 *)(a1 + 56);
  unint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  float64x2_t v16 = *(float64x2_t *)(a1 + 24);
  float64x2_t v17 = *(float64x2_t *)(a1 + 40);
  float64x2_t v14 = *(float64x2_t *)(a2 + 24);
  float64x2_t v15 = *(float64x2_t *)(a2 + 40);
  int v8 = *(unsigned __int8 *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  if ((sub_230F16844(*(void *)a1, *(void *)a2, (uint64_t)&unk_26AF0DF10) & 1) != 0
    && (sub_230F16844(v2, v6, (uint64_t)&unk_26AF0DF10) & 1) != 0)
  {
    BOOL v10 = sub_230F167D0(v3, v7);
    unsigned __int8 v11 = 0;
    if (v10
      && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v16, v14), (int32x4_t)vceqq_f64(v17, v15))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) == 0&& v4 == v8)
    {
      unsigned __int8 v11 = sub_230F16844(v5, v9, (uint64_t)&qword_26AF0DE60);
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }
  return v11 & 1;
}

unint64_t sub_230F17B2C()
{
  unint64_t result = qword_268716198;
  if (!qword_268716198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268716198);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GradientType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GradientType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x230F17CDCLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GradientType()
{
  return &type metadata for GradientType;
}

uint64_t initializeBufferWithCopyOfBuffer for Gradient(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Gradient()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Gradient(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Gradient(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Gradient(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Gradient(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Gradient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Gradient()
{
  return &type metadata for Gradient;
}

uint64_t sub_230F1800C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_230F18040()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_230F18050()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_230F18060()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_230F18070()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_230F18080()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_230F18090()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_230F180A0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_230F180B0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_230F180C0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_230F180D0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_230F180E0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_230F180F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_230F18100()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_230F18110()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_230F18120()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_230F18130()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_230F18140()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_230F18150()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_230F18160()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_230F18170()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_230F18180()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_230F18190()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_230F181A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_230F181B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_230F181C0()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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