__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_246550248(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_246550268(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

uint64_t initializeBufferWithCopyOfBuffer for ManagedAppReply(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_2465502E4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_246550304(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_246550344(uint64_t a1, uint64_t a2)
{
  return sub_2465504B0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24655035C(uint64_t a1, id *a2)
{
  uint64_t result = sub_24659DCE8();
  *a2 = 0;
  return result;
}

uint64_t sub_2465503D4(uint64_t a1, id *a2)
{
  char v3 = sub_24659DCF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_246550454@<X0>(uint64_t *a1@<X8>)
{
  sub_24659DD08();
  uint64_t v2 = sub_24659DCD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_246550498(uint64_t a1, uint64_t a2)
{
  return sub_2465504B0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2465504B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24659DD08();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2465504F4()
{
  sub_24659DD08();
  sub_24659DD38();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246550548()
{
  sub_24659DD08();
  sub_24659E1B8();
  sub_24659DD38();
  uint64_t v0 = sub_24659E1F8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2465505BC()
{
  uint64_t v0 = sub_24659DD08();
  uint64_t v2 = v1;
  if (v0 == sub_24659DD08() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24659E158();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_246550670(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2465506B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24659DCD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_246550700@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659DD08();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24655072C(uint64_t a1)
{
  uint64_t v2 = sub_24655082C((unint64_t *)&qword_268F8B9D0);
  uint64_t v3 = sub_24655082C(&qword_268F8B9D8);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2465507C4()
{
  return sub_24655082C(&qword_268F8B9B8);
}

uint64_t sub_2465507F8()
{
  return sub_24655082C(&qword_268F8B9C0);
}

uint64_t sub_24655082C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246550870()
{
  return sub_24655082C(&qword_268F8B9C8);
}

uint64_t sub_2465508AC()
{
  sub_246550978(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for OfferViewModel()
{
  return self;
}

uint64_t sub_24655091C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_246550928@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659D118();
  *a1 = result;
  return result;
}

uint64_t sub_246550978(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

__n128 sub_246550990@<Q0>(char *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  char v3 = *a1;
  float64x2_t v4 = (float64x2_t)xmmword_24659EC10;
  char v5 = 1;
  double v6 = 5.0;
  double v7 = 9.5;
  char v8 = 0;
  switch(*a1)
  {
    case 1:
      char v5 = 0;
      float64x2_t v4 = (float64x2_t)xmmword_24659EC20;
      char v8 = 1;
      goto LABEL_5;
    case 2:
      char v8 = 0;
      char v5 = 0;
      double v9 = a3 * 3.0;
      double v10 = a3 * 21.0;
      double v11 = a3 * 29.0;
      float64x2_t v12 = vaddq_f64(vmulq_n_f64((float64x2_t)xmmword_24659EC30, a3), (float64x2_t)xmmword_24659EC40);
      char v13 = 1;
      double v6 = 6.0;
      double v7 = 12.0;
      goto LABEL_7;
    case 3:
      char v8 = 0;
      char v5 = 0;
      float64x2_t v4 = (float64x2_t)xmmword_24659EC20;
LABEL_5:
      double v6 = 6.0;
      double v7 = 12.0;
      goto LABEL_6;
    default:
LABEL_6:
      char v13 = 0;
      double v11 = a3 * 28.0;
      float64x2_t v12 = vmulq_n_f64(v4, a3);
      double v9 = a3 + a3;
      double v10 = a3 * 17.0;
LABEL_7:
      *(double *)a2 = v11;
      *(double *)(a2 + 8) = (v11 - v9) * 0.5;
      *(double *)(a2 + 16) = v11 * 0.5;
      *(double *)(a2 + 24) = v11 * 0.5;
      double v14 = (v11 - (v9 + v9)) / 2.5;
      *(_OWORD *)(a2 + 32) = xmmword_24659EC50;
      *(_OWORD *)(a2 + 48) = xmmword_24659EC60;
      *(void *)(a2 + 64) = 0x3FF0000000000000;
      *(double *)(a2 + 72) = v9;
      *(double *)(a2 + 80) = v14;
      double v15 = v11 * 0.5 - v14 * 0.5;
      *(double *)(a2 + 88) = v14;
      *(double *)(a2 + 96) = v15;
      *(double *)(a2 + 104) = v15;
      __asm { FMOV            V0.2D, #1.0 }
      *(__n128 *)(a2 + 112) = result;
      *(double *)(a2 + 128) = v10;
      *(double *)(a2 + 136) = v6;
      *(double *)(a2 + 144) = v7;
      *(double *)(a2 + 152) = v6;
      *(double *)(a2 + 160) = v7;
      *(float64x2_t *)(a2 + 168) = v12;
      *(unsigned char *)(a2 + 184) = v13;
      *(unsigned char *)(a2 + 185) = v5;
      *(unsigned char *)(a2 + 186) = v8;
      *(unsigned char *)(a2 + 187) = 0;
      *(unsigned char *)(a2 + 188) = v3;
      return result;
  }
}

void sub_246550AF8(double a1)
{
  uint64_t v2 = (void *)sub_24659DCD8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B9E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24659EC70;
  float64x2_t v4 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  char v5 = self;
  double v6 = *MEMORY[0x263F81800];
  id v7 = v4;
  id v8 = objc_msgSend(v5, sel_systemFontOfSize_weight_, a1, v6);
  *(void *)(inited + 64) = sub_246550CCC();
  *(void *)(inited + 40) = v8;
  sub_246550D0C(inited);
  type metadata accessor for Key(0);
  sub_246550E28();
  double v9 = (void *)sub_24659DCA8();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_boundingRectWithSize_options_attributes_context_, 1, v9, 0, 1.79769313e308, 1.79769313e308);
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

unint64_t sub_246550CCC()
{
  unint64_t result = qword_268F8B9E8;
  if (!qword_268F8B9E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F8B9E8);
  }
  return result;
}

unint64_t sub_246550D0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    char v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B9F0);
  uint64_t v2 = sub_24659E058();
  char v3 = (void *)v2;
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
    sub_246550F14(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_246550E80(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_246550F7C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_246550E28()
{
  unint64_t result = qword_268F8B9D0;
  if (!qword_268F8B9D0)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8B9D0);
  }
  return result;
}

unint64_t sub_246550E80(uint64_t a1)
{
  sub_24659DD08();
  sub_24659E1B8();
  sub_24659DD38();
  uint64_t v2 = sub_24659E1F8();
  swift_bridgeObjectRelease();

  return sub_246550F8C(a1, v2);
}

uint64_t sub_246550F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B9F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_246550F7C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_246550F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24659DD08();
    uint64_t v8 = v7;
    if (v6 == sub_24659DD08() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24659E158();
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
          uint64_t v13 = sub_24659DD08();
          uint64_t v15 = v14;
          if (v13 == sub_24659DD08() && v15 == v16) {
            break;
          }
          char v18 = sub_24659E158();
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

uint64_t sub_246551104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(unsigned char *)(v3 + 32) = v4;
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BA00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24659EC80;
  swift_retain();
  uint64_t v6 = sub_2465787AC();
  uint64_t v8 = v7;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v7;
  uint64_t v9 = sub_2465787AC();
  uint64_t v11 = v10;
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v10;
  uint64_t v12 = sub_2465787AC();
  uint64_t v14 = v13;
  *(void *)(inited + 64) = v12;
  *(void *)(inited + 72) = v13;
  uint64_t v24 = sub_2465787AC();
  uint64_t v16 = v15;
  *(void *)(inited + 80) = v24;
  *(void *)(inited + 88) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_24659DD48();
  uint64_t v18 = sub_24659DD48();
  BOOL v19 = v18 < v17;
  if (v18 >= v17) {
    uint64_t v20 = v8;
  }
  else {
    uint64_t v20 = v11;
  }
  if (v19) {
    uint64_t v6 = v9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24659DD48();
  if (sub_24659DD48() < v21)
  {
    uint64_t v20 = v14;
    uint64_t v6 = v12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_24659DD48();
  if (sub_24659DD48() < v22)
  {
    uint64_t v6 = v24;
    uint64_t v20 = v16;
  }
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 40) = v6;
  *(void *)(v3 + 48) = v20;
  return v3;
}

uint64_t sub_2465512F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_24659DE08();
  v5[3] = sub_24659DDF8();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_2465513AC;
  return sub_246551548(a5);
}

uint64_t sub_2465513AC()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24659DDD8();
  return MEMORY[0x270FA2498](sub_2465514E8, v1, v0);
}

uint64_t sub_2465514E8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246551548(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  sub_24659DE08();
  v2[15] = sub_24659DDF8();
  uint64_t v4 = sub_24659DDD8();
  return MEMORY[0x270FA2498](sub_246551614, v4, v3);
}

uint64_t sub_246551614()
{
  v45 = v0;
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)v0[13];
  swift_release();
  v0[2] = 0;
  MEMORY[0x24C52FEA0](v0 + 2, 8);
  uint64_t v2 = v0[2];
  v0[2] = 0;
  id v3 = objc_msgSend(v1, sel_makeXPCConnectionWithError_, v0 + 2);
  uint64_t v4 = (void *)v0[2];
  if (v3)
  {
    unint64_t v5 = v3;
    uint64_t v6 = v2 << 32;
    uint64_t v41 = v0[14];
    uint64_t v7 = self;
    id v8 = v4;
    id v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26FAC74B0);
    objc_msgSend(v5, sel_setRemoteObjectInterface_, v9);

    objc_msgSend(v5, sel_resume);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v6;
    *(void *)(v10 + 24) = 0;
    *(unsigned char *)(v10 + 32) = 0;
    v0[6] = sub_246555280;
    v0[7] = v10;
    uint64_t v39 = MEMORY[0x263EF8330];
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_2465522E4;
    v0[5] = &block_descriptor;
    uint64_t v11 = _Block_copy(v0 + 2);
    swift_release();
    id v12 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);
    sub_24659E008();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BB18);
    if (swift_dynamicCast()) {
      uint64_t v13 = (void *)v0[12];
    }
    else {
      uint64_t v13 = 0;
    }
    sub_24659CE18();
    swift_allocObject();
    sub_24659CE08();
    uint64_t v14 = v41 + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent;
    type metadata accessor for AppExtensionHostView(0);
    uint64_t v15 = sub_24659CF68();
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v14;
    LOBYTE(v14) = *(unsigned char *)(v14 + 8);
    sub_246552D38(v18, v14);
    sub_2465676C4(v18, v14, &v42);
    sub_246552EF4(v18, v14);
    char v19 = v42;
    v0[2] = v15;
    v0[3] = v17;
    *((unsigned char *)v0 + 32) = v19;
    sub_2465552A4();
    uint64_t v20 = sub_24659CDF8();
    unint64_t v22 = v21;
    swift_release();
    swift_bridgeObjectRelease();
    if (v13)
    {
      swift_unknownObjectRetain();
      v40 = (void *)sub_24659CE78();
      uint64_t v34 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v6;
      *(void *)(v35 + 24) = 0;
      *(unsigned char *)(v35 + 32) = 0;
      *(void *)(v35 + 40) = v34;
      v0[6] = sub_2465553CC;
      v0[7] = v35;
      v0[2] = v39;
      v0[3] = 1107296256;
      v0[4] = sub_24655284C;
      v0[5] = &block_descriptor_26;
      v36 = _Block_copy(v0 + 2);
      swift_release();
      objc_msgSend(v13, sel_setWithManagedAppViewData_reply_, v40, v36);
      swift_unknownObjectRelease();
      sub_2465552F8(v20, v22);

      swift_unknownObjectRelease();
      _Block_release(v36);
    }
    else
    {
      sub_2465552F8(v20, v22);
    }
  }
  else
  {
    id v23 = v4;
    uint64_t v24 = (void *)sub_24659CE38();

    swift_willThrow();
    if (qword_268F8B980 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_24659D0C8();
    __swift_project_value_buffer(v25, (uint64_t)qword_268F8EDD0);
    id v26 = v24;
    id v27 = v24;
    v28 = sub_24659D0A8();
    os_log_type_t v29 = sub_24659DF18();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v44[0] = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v42 = 5527621;
      unint64_t v43 = 0xE300000000000000;
      *((_DWORD *)v0 + 4) = v2;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      v0[2] = sub_2465574C8(v42, v43, v44);
      sub_24659DFE8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v32 = sub_24659E1A8();
      v0[2] = sub_2465574C8(v32, v33, v44);
      sub_24659DFE8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24654E000, v28, v29, "[%s]: Cannot make connection to extension. %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v31, -1, -1);
      MEMORY[0x24C52FE90](v30, -1, -1);
    }
    else
    {
    }
  }
  v37 = (uint64_t (*)(void))v0[1];
  return v37();
}

uint64_t sub_246551CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659DE38();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24659DE28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246555440(a1, &qword_268F8BAE8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24659DDD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_246551FB0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24659D0C8();
  __swift_project_value_buffer(v8, (uint64_t)qword_268F8EDD0);
  sub_246555430(a2, a3, a4 & 1);
  id v9 = a1;
  sub_246555430(a2, a3, a4 & 1);
  id v10 = a1;
  oslog = sub_24659D0A8();
  os_log_type_t v11 = sub_24659DF18();
  if (os_log_type_enabled(oslog, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    if (a4)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = a2;
      unint64_t v15 = a3;
    }
    else
    {
      sub_24659DD58();
      swift_bridgeObjectRelease();
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
    }
    sub_2465574C8(v14, v15, &v19);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    sub_246555270(a2, a3, a4 & 1);
    sub_246555270(a2, a3, a4 & 1);
    *(_WORD *)(v12 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v16 = sub_24659E1A8();
    sub_2465574C8(v16, v17, &v19);
    sub_24659DFE8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24654E000, oslog, v11, "[%s]: Failed to create proxy to extension. %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v13, -1, -1);
    MEMORY[0x24C52FE90](v12, -1, -1);
  }
  else
  {
    sub_246555270(a2, a3, a4 & 1);
    sub_246555270(a2, a3, a4 & 1);
  }
}

void sub_2465522E4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24655234C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v10 = type metadata accessor for AppExtensionHostView(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24659CDE8();
  swift_allocObject();
  sub_24659CDD8();
  sub_2465553DC();
  sub_24659CDC8();
  uint64_t v13 = a6 + 16;
  swift_release();
  uint64_t v14 = v44;
  uint64_t v15 = v45;
  long long v16 = v46;
  uint64_t v17 = v47;
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24659D0C8();
  __swift_project_value_buffer(v18, (uint64_t)qword_268F8EDD0);
  sub_246555430(a3, a4, a5 & 1);
  sub_246555430(a3, a4, a5 & 1);
  uint64_t v19 = sub_24659D0A8();
  int v20 = sub_24659DF08();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    int v39 = v20;
    uint64_t v40 = v13;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v41 = v38;
    *(_DWORD *)uint64_t v21 = 136315394;
    if (a5)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = a3;
      unint64_t v23 = a4;
    }
    else
    {
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      int v48 = HIDWORD(a3);
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v22 = v44;
      unint64_t v23 = v45;
    }
    uint64_t v44 = sub_2465574C8(v22, v23, &v41);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    sub_246555270(a3, a4, a5 & 1);
    sub_246555270(a3, a4, a5 & 1);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v24 = sub_24659DE98();
    uint64_t v44 = sub_2465574C8(v24, v25, &v41);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24654E000, v19, (os_log_type_t)v39, "[%s]: Setting cell bounds %s", (uint8_t *)v21, 0x16u);
    uint64_t v26 = v38;
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v26, -1, -1);
    MEMORY[0x24C52FE90](v21, -1, -1);

    uint64_t v13 = v40;
  }
  else
  {
    sub_246555270(a3, a4, a5 & 1);
    sub_246555270(a3, a4, a5 & 1);
  }
  swift_beginAccess();
  uint64_t v27 = MEMORY[0x24C52FF50](v13);
  if (v27)
  {
    v28 = (void *)v27;
    sub_246554B58(v27 + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent, (uint64_t)v12);

    os_log_type_t v29 = (uint64_t *)&v12[*(int *)(v10 + 24)];
    unint64_t v30 = v29[1];
    uint64_t v31 = v29[2];
    uint64_t v44 = *v29;
    unint64_t v45 = v30;
    *(void *)&long long v46 = v31;
    uint64_t v41 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BB30);
    sub_24659DBA8();
    sub_246554BBC((uint64_t)v12, type metadata accessor for AppExtensionHostView);
  }
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C52FF50](v13);
  if (result)
  {
    unint64_t v33 = (void *)result;
    sub_246554B58(result + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent, (uint64_t)v12);

    uint64_t v34 = &v12[*(int *)(v10 + 28)];
    unint64_t v35 = *((void *)v34 + 1);
    uint64_t v44 = *(void *)v34;
    unint64_t v45 = v35;
    long long v36 = *((_OWORD *)v34 + 2);
    long long v46 = *((_OWORD *)v34 + 1);
    long long v47 = v36;
    uint64_t v41 = v15;
    long long v42 = v16;
    uint64_t v43 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BB38);
    sub_24659DBA8();
    return sub_246554BBC((uint64_t)v12, type metadata accessor for AppExtensionHostView);
  }
  return result;
}

uint64_t sub_24655284C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = sub_24659CE88();
  unint64_t v7 = v6;

  v3(v5, v7);
  sub_2465552F8(v5, v7);

  return swift_release();
}

id sub_246552904()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246552998()
{
  return type metadata accessor for AppExtensionHostView.Coordinator(0);
}

uint64_t type metadata accessor for AppExtensionHostView.Coordinator(uint64_t a1)
{
  return sub_246552D64(a1, (uint64_t *)&unk_268F8BA68);
}

void sub_2465529C0()
{
  type metadata accessor for AppExtensionHostView(319);
  if (v0 <= 0x3F)
  {
    sub_246553C44(319, &qword_268F8BA78, MEMORY[0x263F04D80]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for AppExtensionHostView(uint64_t a1)
{
  return sub_246552D64(a1, (uint64_t *)&unk_268F8BA90);
}

unint64_t sub_246552AC8(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v28 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_246552D38(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = sub_24659CFE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)(a1 + v13);
    long long v16 = (void *)(a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    v15[2] = v16[2];
    uint64_t v18 = a1 + v14;
    uint64_t v19 = a2 + v14;
    uint64_t v20 = *(void *)(v19 + 8);
    *(void *)uint64_t v18 = *(void *)v19;
    *(void *)(v18 + 8) = v20;
    long long v21 = *(_OWORD *)(v19 + 32);
    *(_OWORD *)(v18 + 16) = *(_OWORD *)(v19 + 16);
    *(_OWORD *)(v18 + 32) = v21;
    uint64_t v22 = a3[8];
    __dst = (char *)(a1 + v22);
    unint64_t v23 = (char *)(a2 + v22);
    uint64_t v24 = type metadata accessor for AppExtensionHostView.Configuration(0);
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v26(v23, 1, v24))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
      memcpy(__dst, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      uint64_t v29 = sub_24659CF38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(__dst, v23, v29);
      uint64_t v30 = *(int *)(v24 + 20);
      uint64_t v31 = &__dst[v30];
      uint64_t v32 = &v23[v30];
      uint64_t v33 = *((void *)v32 + 1);
      *(void *)uint64_t v31 = *(void *)v32;
      *((void *)v31 + 1) = v33;
      uint64_t v34 = *(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56);
      swift_bridgeObjectRetain();
      v34(__dst, 0, 1, v24);
    }
  }
  return a1;
}

uint64_t sub_246552D38(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for AppExtensionHostView.Configuration(uint64_t a1)
{
  return sub_246552D64(a1, qword_268F8BAA8);
}

uint64_t sub_246552D64(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246552D9C(uint64_t a1, uint64_t a2)
{
  sub_246552EF4(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = sub_24659CF38();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v6, v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_246552EF4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_246552F00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  v14[2] = v15[2];
  uint64_t v17 = a1 + v13;
  uint64_t v18 = a2 + v13;
  uint64_t v19 = *(void *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  *(void *)(v17 + 8) = v19;
  long long v20 = *(_OWORD *)(v18 + 32);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)(v18 + 16);
  *(_OWORD *)(v17 + 32) = v20;
  uint64_t v21 = a3[8];
  __dst = (char *)(a1 + v21);
  uint64_t v22 = (char *)(a2 + v21);
  uint64_t v23 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v25(v22, 1, v23))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(__dst, v22, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v27 = sub_24659CF38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(__dst, v22, v27);
    uint64_t v28 = *(int *)(v23 + 20);
    uint64_t v29 = &__dst[v28];
    uint64_t v30 = &v22[v28];
    uint64_t v31 = *((void *)v30 + 1);
    *(void *)uint64_t v29 = *(void *)v30;
    *((void *)v29 + 1) = v31;
    uint64_t v32 = *(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56);
    swift_bridgeObjectRetain();
    v32(__dst, 0, 1, v23);
  }
  return a1;
}

uint64_t sub_246553120(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_retain();
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  v18[2] = v19[2];
  v18[3] = v19[3];
  v18[4] = v19[4];
  v18[5] = v19[5];
  uint64_t v20 = a3[8];
  uint64_t v21 = (char *)(a1 + v20);
  uint64_t v22 = (char *)(a2 + v20);
  uint64_t v23 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v18) = v25(v21, 1, v23);
  int v26 = v25(v22, 1, v23);
  if (!v18)
  {
    if (!v26)
    {
      uint64_t v34 = sub_24659CF38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v21, v22, v34);
      uint64_t v35 = *(int *)(v23 + 20);
      long long v36 = &v21[v35];
      uint64_t v37 = &v22[v35];
      *(void *)long long v36 = *(void *)v37;
      *((void *)v36 + 1) = *((void *)v37 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_246554BBC((uint64_t)v21, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_6;
  }
  if (v26)
  {
LABEL_6:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v21, v22, *(void *)(*(void *)(v32 - 8) + 64));
    return a1;
  }
  uint64_t v27 = sub_24659CF38();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v21, v22, v27);
  uint64_t v28 = *(int *)(v23 + 20);
  uint64_t v29 = &v21[v28];
  uint64_t v30 = &v22[v28];
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  uint64_t v31 = *(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56);
  swift_bridgeObjectRetain();
  v31(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_246553434(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = (long long *)(a2 + v10);
  long long v14 = *v13;
  *(void *)(v12 + 16) = *((void *)v13 + 2);
  *(_OWORD *)uint64_t v12 = v14;
  uint64_t v15 = (_OWORD *)(a1 + v11);
  uint64_t v16 = (_OWORD *)(a2 + v11);
  long long v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  v15[2] = v16[2];
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)(a1 + v18);
  uint64_t v20 = (char *)(a2 + v18);
  uint64_t v21 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_24659CF38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v19, v20, v24);
    *(_OWORD *)&v19[*(int *)(v21 + 20)] = *(_OWORD *)&v20[*(int *)(v21 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

uint64_t sub_2465535FC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t)a2 + v10;
  uint64_t v13 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = (uint64_t)a2 + v14;
  *(void *)(a1 + v14) = *(uint64_t *)((char *)a2 + v14);
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_release();
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (uint64_t)a2 + v17;
  *(void *)(a1 + v17) = *(uint64_t *)((char *)a2 + v17);
  swift_release();
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  swift_release();
  long long v20 = *(_OWORD *)(v19 + 32);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)(v19 + 16);
  *(_OWORD *)(v18 + 32) = v20;
  uint64_t v21 = a3[8];
  uint64_t v22 = (char *)(a1 + v21);
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v25 = *(void *)(v24 - 8);
  int v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  LODWORD(v19) = v26(v22, 1, v24);
  int v27 = v26(v23, 1, v24);
  if (!v19)
  {
    if (!v27)
    {
      uint64_t v31 = sub_24659CF38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v22, v23, v31);
      uint64_t v32 = *(int *)(v24 + 20);
      uint64_t v33 = &v22[v32];
      uint64_t v34 = &v23[v32];
      uint64_t v36 = *(void *)v34;
      uint64_t v35 = *((void *)v34 + 1);
      *(void *)uint64_t v33 = v36;
      *((void *)v33 + 1) = v35;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_246554BBC((uint64_t)v22, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_6;
  }
  if (v27)
  {
LABEL_6:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  uint64_t v28 = sub_24659CF38();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v22, v23, v28);
  *(_OWORD *)&v22[*(int *)(v24 + 20)] = *(_OWORD *)&v23[*(int *)(v24 + 20)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t sub_2465538A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2465538BC);
}

uint64_t sub_2465538BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24659CFE8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[6] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[8];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_2465539F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246553A08);
}

uint64_t sub_246553A08(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_24659CFE8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[8];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_246553B40()
{
  sub_24659CFE8();
  if (v0 <= 0x3F)
  {
    sub_246553C44(319, &qword_268F8BAA0, (void (*)(uint64_t))type metadata accessor for AppExtensionHostView.Configuration);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_246553C44(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24659DFD8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_246553C98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24659CF38();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_246553D70(uint64_t a1)
{
  uint64_t v2 = sub_24659CF38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_246553DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659CF38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246553E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659CF38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246553F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659CF38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246553F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659CF38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246554014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246554028);
}

uint64_t sub_246554028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659CF38();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2465540EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246554100);
}

uint64_t sub_246554100(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24659CF38();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2465541C0()
{
  uint64_t result = sub_24659CF38();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246554254()
{
  return sub_246554B14(&qword_268F8BAC0);
}

void sub_246554288(void *a1)
{
  uint64_t v2 = sub_24659CEC8();
  MEMORY[0x270FA5388](v2 - 8);
  v29[1] = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24659CF38();
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAD0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = 0;
  MEMORY[0x24C52FEA0](&v33, 8);
  int v17 = v33;
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v18 = type metadata accessor for AppExtensionHostView(0);
    sub_246554E7C(v31 + *(int *)(v18 + 32), (uint64_t)v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
    {
      uint64_t v19 = sub_24659DFB8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
      id v20 = a1;
    }
    else
    {
      sub_246554EE4((uint64_t)v13, (uint64_t)v10);
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v6, v10, v4);
      id v27 = a1;
      swift_bridgeObjectRetain();
      sub_24659CED8();
      sub_24659DFA8();
      sub_246554BBC((uint64_t)v10, type metadata accessor for AppExtensionHostView.Configuration);
      uint64_t v28 = sub_24659DFB8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v16, 0, 1, v28);
    }
    sub_24659DFC8();
  }
  else
  {
    if (qword_268F8B980 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_24659D0C8();
    __swift_project_value_buffer(v21, (uint64_t)qword_268F8EDD0);
    uint64_t v22 = sub_24659D0A8();
    os_log_type_t v23 = sub_24659DF18();
    if (os_log_type_enabled(v22, v23))
    {
      int v24 = v17;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v33 = 5527621;
      unint64_t v34 = 0xE300000000000000;
      uint64_t v35 = v26;
      int v32 = v24;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_2465574C8(v33, v34, &v35);
      sub_24659DFE8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24654E000, v22, v23, "[%s]: No HostingViewController found", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v26, -1, -1);
      MEMORY[0x24C52FE90](v25, -1, -1);
    }
  }
}

id sub_2465547B8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E68]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAE0);
  sub_24659D768();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

uint64_t sub_24655483C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246554B58(v5, (uint64_t)v4);
  uint64_t v6 = (objc_class *)type metadata accessor for AppExtensionHostView.Coordinator(0);
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_identity];
  uint64_t v9 = sub_24659CF38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_246554B58((uint64_t)v4, (uint64_t)&v7[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent]);
  v12.receiver = v7;
  v12.super_class = v6;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  uint64_t result = sub_246554BBC((uint64_t)v4, type metadata accessor for AppExtensionHostView);
  *a2 = v10;
  return result;
}

uint64_t sub_24655496C()
{
  return sub_24659D6F8();
}

uint64_t sub_2465549A8()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_2465549B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246554B14(&qword_268F8BAC8);

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_246554A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246554B14(&qword_268F8BAC8);

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_246554AB4()
{
  return sub_24659D938();
}

void sub_246554AD0()
{
}

uint64_t sub_246554B14(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppExtensionHostView(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246554B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppExtensionHostView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246554BBC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_246554C54(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_246554D30;
  return v6(a1);
}

uint64_t sub_246554D30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_246554E28()
{
  unint64_t result = qword_268F8BAD8;
  if (!qword_268F8BAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BAD8);
  }
  return result;
}

uint64_t sub_246554E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246554EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246554F48()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_246554F90(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_246555050;
  return sub_2465512F0(a1, v4, v5, v7, v6);
}

uint64_t sub_246555050()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246555144()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24655517C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_246555050;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268F8BB00 + dword_268F8BB00);
  return v6(a1, v4);
}

uint64_t sub_246555234()
{
  sub_246555270(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_246555270(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_246555280(void *a1)
{
  sub_246551FB0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
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

unint64_t sub_2465552A4()
{
  unint64_t result = qword_268F8BB20;
  if (!qword_268F8BB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BB20);
  }
  return result;
}

uint64_t sub_2465552F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_246555350()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246555388()
{
  sub_246555270(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2465553CC(uint64_t a1, uint64_t a2)
{
  return sub_24655234C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32), *(void *)(v2 + 40));
}

unint64_t sub_2465553DC()
{
  unint64_t result = qword_268F8BB28;
  if (!qword_268F8BB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BB28);
  }
  return result;
}

uint64_t sub_246555430(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_246555440(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t MADViewServiceExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v18[0] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v18 - v10;
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  objc_super v12 = (objc_class *)type metadata accessor for MADViewServiceConfiguration.ExportedObject();
  uint64_t v13 = (char *)objc_allocWithZone(v12);
  *(void *)&v13[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection] = 0;
  v19.receiver = v13;
  v19.super_class = v12;
  id v14 = objc_msgSendSuper2(&v19, sel_init, v18[0]);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, AssociatedTypeWitness);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v15, v9, AssociatedTypeWitness);
  v18[1] = v14;
  swift_getAssociatedConformanceWitness();
  sub_246555870();
  sub_24659CEA8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, AssociatedTypeWitness);
}

uint64_t type metadata accessor for MADViewServiceConfiguration.ExportedObject()
{
  return self;
}

uint64_t sub_2465556F4()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_246555794@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);

  return v6(a1, v4, AssociatedTypeWitness);
}

unint64_t sub_246555870()
{
  unint64_t result = qword_268F8BBB8;
  if (!qword_268F8BBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BBB8);
  }
  return result;
}

uint64_t MADViewServiceScene.body.getter(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  type metadata accessor for ExportedObject();
  uint64_t v5 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBC8);
  sub_24659D178();
  *(void *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_connection) = 0;
  uint64_t v6 = (void *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  v7[2] = v9;
  v7[3] = v8;
  v7[4] = v4;
  v7[5] = v3;
  v7[6] = v5;
  swift_retain();
  swift_retain();
  return sub_24659CE98();
}

uint64_t type metadata accessor for ExportedObject()
{
  uint64_t result = qword_268F8BC90;
  if (!qword_268F8BC90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246555A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void *)(a4 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  objc_super v12 = (char *)&v17 - v11;
  v14(v13);
  sub_246598AFC(v10, a4, a5);
  unint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, a4);
  sub_246598AFC(v12, a4, a5);
  return ((uint64_t (*)(char *, uint64_t))v15)(v12, a4);
}

uint64_t sub_246555B88()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_246555BC8()
{
  return sub_246555A4C(v0[4], v0[5], v0[6], v0[2], v0[3]);
}

uint64_t sub_246555BD8(void *a1)
{
  objc_msgSend(a1, sel_setExportedObject_, v1);

  return sub_246555C1C(a1);
}

uint64_t sub_246555C1C(void *a1)
{
  objc_msgSend(a1, sel_auditToken);
  unsigned __int8 v3 = sub_246558218(v12, v13, v14, v15);
  if (v3)
  {
    objc_msgSend(a1, sel_setExportedObject_, v1);
    id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FAC74B0);
    objc_msgSend(a1, sel_setExportedInterface_, v4);

    objc_msgSend(a1, sel_resume);
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_connection);
    *(void *)(v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_connection) = a1;

    id v6 = a1;
  }
  else
  {
    if (qword_268F8B980 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24659D0C8();
    __swift_project_value_buffer(v7, (uint64_t)qword_268F8EDD0);
    uint64_t v8 = sub_24659D0A8();
    os_log_type_t v9 = sub_24659DF18();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_24654E000, v8, v9, "Invalidating ViewService connection due to missing entitlements.", v10, 2u);
      MEMORY[0x24C52FE90](v10, -1, -1);
    }

    objc_msgSend(a1, sel_invalidate);
  }
  return v3 & 1;
}

uint64_t MADViewServiceScene.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ExportedObject.managedAppViewConfiguration.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();

  return swift_release();
}

double sub_246555E50@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_246555EDC()
{
  return sub_24659D1C8();
}

uint64_t ExportedObject.managedAppViewConfiguration.setter()
{
  return sub_24659D1C8();
}

void (*ExportedObject.managedAppViewConfiguration.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_246556078;
}

void sub_246556078(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t ExportedObject.$managedAppViewConfiguration.getter()
{
  return swift_endAccess();
}

uint64_t sub_246556144()
{
  return swift_endAccess();
}

uint64_t sub_2465561AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBE0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  os_log_type_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBD8);
  sub_24659D198();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t ExportedObject.$managedAppViewConfiguration.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBD8);
  sub_24659D198();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*ExportedObject.$managedAppViewConfiguration.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBE0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBD8);
  sub_24659D188();
  swift_endAccess();
  return sub_24655655C;
}

void sub_24655655C(uint64_t a1, char a2)
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
    sub_24659D198();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_24659D198();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t ExportedObject.set(managedAppViewData:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = sub_24659DC78();
  uint64_t v27 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24659DC98();
  uint64_t v26 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24659CDE8();
  swift_allocObject();
  sub_24659CDD8();
  sub_246556BB4();
  sub_24659CDC8();
  swift_release();
  uint64_t v28 = a4;
  uint64_t v15 = aBlock;
  uint64_t v14 = v30;
  uint64_t v16 = a3;
  LOBYTE(a3) = (_BYTE)v31;
  sub_246557B20();
  uint64_t v25 = sub_24659DF88();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v4;
  *(void *)(v17 + 24) = v15;
  *(void *)(v17 + 32) = v14;
  *(unsigned char *)(v17 + 40) = a3;
  uint64_t v33 = sub_246557BA0;
  uint64_t v34 = v17;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v30 = 1107296256;
  uint64_t v31 = sub_246556C98;
  int v32 = &block_descriptor_0;
  uint64_t v18 = _Block_copy(&aBlock);
  swift_retain();
  sub_24659DC88();
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_246557BC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BC00);
  sub_246557C20();
  uint64_t v19 = v28;
  sub_24659E018();
  id v20 = (void *)v25;
  MEMORY[0x24C52F5B0](0, v13, v10, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
  swift_release();
  uint64_t v21 = (void *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  uint64_t v22 = *(void *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  *uint64_t v21 = v16;
  v21[1] = v19;
  sub_2465574B8(v22);
  return swift_retain();
}

unint64_t sub_246556BB4()
{
  unint64_t result = qword_268F8BBE8;
  if (!qword_268F8BBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BBE8);
  }
  return result;
}

uint64_t sub_246556C08()
{
  return sub_24659D1C8();
}

uint64_t ExportedObject.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  sub_2465574B8(*(void *)(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply));
  return v0;
}

uint64_t ExportedObject.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  sub_2465574B8(*(void *)(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_246556EBC(void *a1)
{
  uint64_t v14 = 0;
  MEMORY[0x24C52FEA0](&v14, 8);
  uint64_t v3 = v14 << 32;
  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FAC74B0);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v4);

  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v3;
  *(void *)(v6 + 32) = 0;
  *(unsigned char *)(v6 + 40) = 0;
  uint64_t v18 = sub_246558024;
  uint64_t v19 = v6;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_246556C98;
  uint64_t v17 = &block_descriptor_29;
  uint64_t v7 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v7);
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v3;
  *(void *)(v9 + 32) = 0;
  *(unsigned char *)(v9 + 40) = 0;
  uint64_t v18 = sub_24655808C;
  uint64_t v19 = v9;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_246556C98;
  uint64_t v17 = &block_descriptor_36;
  uint64_t v10 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v10);
  _Block_release(v10);
  uint64_t v11 = *(void **)(v1
                 + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection);
  *(void *)(v1
            + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection) = a1;
  id v12 = a1;

  objc_msgSend(v12, sel_resume);
  return 1;
}

uint64_t sub_24655711C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_246557160(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(void), const char *a6)
{
  uint64_t v11 = a1 + 16;
  swift_beginAccess();
  id v12 = (char *)MEMORY[0x24C52FF50](v11);
  if (v12)
  {
    uint64_t v13 = *(void **)&v12[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection];
    *(void *)&v12[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection] = 0;
  }
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24659D0C8();
  __swift_project_value_buffer(v14, (uint64_t)qword_268F8EDD0);
  sub_246555430(a2, a3, a4 & 1);
  sub_246555430(a2, a3, a4 & 1);
  uint64_t v15 = sub_24659D0A8();
  os_log_type_t v16 = a5();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v21 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    if (a4)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = a2;
      unint64_t v20 = a3;
    }
    else
    {
      sub_24659DD58();
      swift_bridgeObjectRelease();
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v19 = 0;
      unint64_t v20 = 0xE000000000000000;
    }
    sub_2465574C8(v19, v20, &v21);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    sub_246555270(a2, a3, a4 & 1);
    sub_246555270(a2, a3, a4 & 1);
    _os_log_impl(&dword_24654E000, v15, v16, a6, v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v18, -1, -1);
    MEMORY[0x24C52FE90](v17, -1, -1);
  }
  else
  {
    sub_246555270(a2, a3, a4 & 1);
    sub_246555270(a2, a3, a4 & 1);
  }
}

id sub_246557448()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MADViewServiceConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246557490(void *a1)
{
  return sub_246556EBC(a1) & 1;
}

uint64_t sub_2465574B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2465574C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24655759C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2465581B8((uint64_t)v12, *a3);
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
      sub_2465581B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24655759C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24659DFF8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_246557758(a5, a6);
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
  uint64_t v8 = sub_24659E038();
  if (!v8)
  {
    sub_24659E048();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24659E068();
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

uint64_t sub_246557758(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2465577F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2465579D0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2465579D0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2465577F0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_246557968(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24659E028();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24659E048();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24659DD68();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24659E068();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24659E048();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_246557968(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BCA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2465579D0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BCA8);
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
  uint64_t result = sub_24659E068();
  __break(1u);
  return result;
}

unint64_t sub_246557B20()
{
  unint64_t result = qword_268F8BBF0;
  if (!qword_268F8BBF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F8BBF0);
  }
  return result;
}

uint64_t sub_246557B60()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_246557BA0()
{
  return sub_246556C08();
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

unint64_t sub_246557BC8()
{
  unint64_t result = qword_268F8BBF8;
  if (!qword_268F8BBF8)
  {
    sub_24659DC78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BBF8);
  }
  return result;
}

unint64_t sub_246557C20()
{
  unint64_t result = qword_268F8BC08[0];
  if (!qword_268F8BC08[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BC00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268F8BC08);
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

uint64_t sub_246557CC4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_246557D00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of MADViewServiceExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_246557D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void *sub_246557D68(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_246557D98()
{
  return swift_release();
}

void *sub_246557DA0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_246557DDC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_246557E10(uint64_t *a1, int a2)
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

uint64_t sub_246557E58(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for MADViewServiceScene()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_246557EAC()
{
  return type metadata accessor for ExportedObject();
}

void sub_246557EB4()
{
  sub_246557F70();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ExportedObject(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ExportedObject);
}

void sub_246557F70()
{
  if (!qword_268F8BCA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BBC8);
    unint64_t v0 = sub_24659D1D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8BCA0);
    }
  }
}

uint64_t sub_246557FCC()
{
  return MEMORY[0x263F04E30];
}

ValueMetadata *type metadata accessor for MADViewServiceConfiguration()
{
  return &type metadata for MADViewServiceConfiguration;
}

uint64_t sub_246557FE8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_246558024()
{
}

uint64_t objectdestroy_25Tm()
{
  swift_release();
  sub_246555270(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_24655808C()
{
}

void sub_2465580AC(uint64_t (*a1)(void), const char *a2)
{
  sub_246557160(*(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned char *)(v2 + 40), a1, a2);
}

uint64_t sub_2465580D8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_246558110()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_24659CE78();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
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

uint64_t sub_2465581B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_246558218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *(void *)v12.val = a1;
  *(void *)&v12.val[2] = a2;
  *(void *)&v12.val[4] = a3;
  *(void *)&v12.val[6] = a4;
  SecTaskRef v5 = SecTaskCreateWithAuditToken(v4, &v12);
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v5;
  int64_t v7 = (__CFString *)sub_24659DCD8();
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, v7, 0);

  if (v8)
  {
    self;
    id v9 = (id)swift_dynamicCastObjCClass();
    if (v9)
    {
      uint64_t v10 = sub_24659DCD8();
      id v9 = objc_msgSend(v9, sel_containsObject_, v10);

      unint64_t v6 = (__SecTask *)v10;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_246558388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

void sub_246558390()
{
  type metadata accessor for ManagedAppCellContext();
  if (v0 <= 0x3F)
  {
    sub_24655C308(319, (unint64_t *)&qword_268F8BD38, MEMORY[0x263F18520]);
    if (v1 <= 0x3F)
    {
      sub_24655C2AC();
      if (v2 <= 0x3F)
      {
        sub_24655C308(319, (unint64_t *)&qword_268F8BD50, MEMORY[0x263F19A00]);
        if (v3 <= 0x3F)
        {
          sub_24655C35C();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void *sub_246558554(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_24659D278();
  uint64_t v108 = *(void *)(v7 - 8);
  uint64_t v109 = v7;
  int v8 = *(_DWORD *)(v108 + 80);
  unint64_t v9 = *(void *)(v108 + 64);
  if (v9 <= 8) {
    unint64_t v9 = 8;
  }
  unint64_t v115 = v9;
  uint64_t v10 = sub_24659CE68();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(_DWORD *)(v11 + 80);
  uint64_t v112 = v11;
  uint64_t v113 = v10;
  if (*(_DWORD *)(v11 + 84)) {
    unint64_t v13 = *(void *)(v11 + 64);
  }
  else {
    unint64_t v13 = *(void *)(v11 + 64) + 1;
  }
  size_t __n = v13;
  if (v13 <= 8) {
    unint64_t v13 = 8;
  }
  unint64_t v116 = v13;
  uint64_t v14 = sub_24659D5D8();
  uint64_t v110 = *(void *)(v14 - 8);
  uint64_t v111 = v14;
  int v15 = *(_DWORD *)(v110 + 80);
  unint64_t v16 = *(void *)(v110 + 64);
  if (v16 <= 8) {
    unint64_t v16 = 8;
  }
  unint64_t v117 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v114 = *(void *)(v17 - 8);
  uint64_t v18 = *(_DWORD *)(v114 + 80);
  uint64_t v19 = *(void *)(v114 + 64);
  int v20 = v12 | v8 | v15 | *(_DWORD *)(v5 + 80);
  unsigned int v21 = v20 & 0xF8 | *(_DWORD *)(v114 + 80);
  if (v21 > 7
    || ((v20 | *(_DWORD *)(v114 + 80)) & 0x100000) != 0
    || (unint64_t v22 = (((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
             + 63) & 0xFFFFFFFFFFFFFFF8,
        uint64_t v23 = v8 & 0xF8,
        unint64_t v24 = ~v23 & 0xFFFFFFFFFFFFFFF8,
        uint64_t v25 = v23 + 16,
        uint64_t v26 = v12 & 0xF8 | 7,
        ((v19
        + v18
        + ((v19
          + v18
          + ((v117
            + 1
            + v18
            + ((v116
              + 1
              + (v15 & 0xF8 | 7)
              + ((v115 + v26 + 1 + ((v23 + 16 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~(v15 & 0xF8 | 7))) & ~v18)) & ~v18)) & ~v18)
      + v19 > 0x18))
  {
    uint64_t v38 = *a2;
    *a1 = *a2;
    uint64_t v39 = v38 + (((v21 | 7) + 16) & ~(unint64_t)(v21 | 7));
    swift_retain();
  }
  else
  {
    uint64_t v100 = v12 & 0xF8 | 7;
    uint64_t v101 = v115 + v26 + 1;
    unint64_t v102 = v116 + 1;
    uint64_t v103 = v15 & 0xF8 | 7;
    unint64_t v104 = v117 + 1;
    uint64_t v105 = v19 + v18;
    uint64_t v106 = v17;
    (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
    unint64_t v27 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v99 = (char *)a2 + 7;
    unint64_t v28 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v29 = *(void *)v28;
    uint64_t v30 = *(void *)(v28 + 8);
    char v31 = *(unsigned char *)(v28 + 16);
    sub_246558E8C(*(void *)v28, v30, v31);
    *(void *)unint64_t v27 = v29;
    *(void *)(v27 + 8) = v30;
    *(unsigned char *)(v27 + 16) = v31;
    *(void *)(v27 + 24) = *(void *)(v28 + 24);
    unint64_t v32 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v33 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v34 = *(void *)(v33 + 24);
    swift_bridgeObjectRetain();
    if (v34 < 0xFFFFFFFF)
    {
      long long v40 = *(_OWORD *)(v33 + 16);
      *(_OWORD *)unint64_t v32 = *(_OWORD *)v33;
      *(_OWORD *)(v32 + 16) = v40;
    }
    else
    {
      uint64_t v35 = *(void *)v33;
      uint64_t v36 = *(void *)(v33 + 8);
      char v37 = *(unsigned char *)(v33 + 16);
      sub_246558E8C(*(void *)v33, v36, v37);
      *(void *)unint64_t v32 = v35;
      *(void *)(v32 + 8) = v36;
      *(unsigned char *)(v32 + 16) = v37;
      *(void *)(v32 + 24) = *(void *)(v33 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v41 = (v32 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v42 = (v33 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v42 + 24) < 0xFFFFFFFFuLL)
    {
      long long v46 = *(_OWORD *)(v42 + 16);
      *(_OWORD *)unint64_t v41 = *(_OWORD *)v42;
      *(_OWORD *)(v41 + 16) = v46;
    }
    else
    {
      uint64_t v43 = *(void *)v42;
      uint64_t v44 = *(void *)(v42 + 8);
      char v45 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v44, v45);
      *(void *)unint64_t v41 = v43;
      *(void *)(v41 + 8) = v44;
      *(unsigned char *)(v41 + 16) = v45;
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v47 = v22 + 16;
    unint64_t v48 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v49 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v49 + 24) < 0xFFFFFFFFuLL)
    {
      long long v53 = *(_OWORD *)(v49 + 16);
      *(_OWORD *)unint64_t v48 = *(_OWORD *)v49;
      *(_OWORD *)(v48 + 16) = v53;
    }
    else
    {
      uint64_t v50 = *(void *)v49;
      uint64_t v51 = *(void *)(v49 + 8);
      char v52 = *(unsigned char *)(v49 + 16);
      sub_246558E8C(*(void *)v49, v51, v52);
      *(void *)unint64_t v48 = v50;
      *(void *)(v48 + 8) = v51;
      *(unsigned char *)(v48 + 16) = v52;
      *(void *)(v48 + 24) = *(void *)(v49 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v54 = (v48 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v55 = (v49 + 39) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v56 = *(void *)v55;
    uint64_t v57 = *(void *)(v55 + 8);
    char v58 = *(unsigned char *)(v55 + 16);
    sub_246558E9C(*(void *)v55, v57, v58);
    *(void *)unint64_t v54 = v56;
    *(void *)(v54 + 8) = v57;
    *(unsigned char *)(v54 + 16) = v58;
    v59 = (void *)((v48 + 63) & 0xFFFFFFFFFFFFFFF8);
    v60 = (void *)((v49 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v61 = v60[1];
    void *v59 = *v60;
    v59[1] = v61;
    unint64_t v62 = ((unint64_t)a1 + v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v63 = (unint64_t)&v99[v47] & 0xFFFFFFFFFFFFFFF8;
    uint64_t v64 = *(void *)v63;
    LOBYTE(v57) = *(unsigned char *)(v63 + 8);
    swift_retain();
    sub_246552D38(v64, v57);
    *(void *)unint64_t v62 = v64;
    *(unsigned char *)(v62 + 8) = v57;
    v65 = (void *)((v25 + v62) & v24);
    v66 = (unsigned __int8 *)((v25 + v63) & v24);
    unsigned int v67 = v66[v115];
    unsigned int v68 = v67 - 2;
    if (v67 < 2)
    {
      unint64_t v71 = v116;
      unint64_t v70 = v117;
      uint64_t v72 = v113;
      uint64_t v73 = v103;
    }
    else
    {
      if (v115 <= 3) {
        uint64_t v69 = v115;
      }
      else {
        uint64_t v69 = 4;
      }
      unint64_t v71 = v116;
      unint64_t v70 = v117;
      uint64_t v72 = v113;
      uint64_t v73 = v103;
      switch(v69)
      {
        case 1:
          int v74 = *v66;
          if (v115 < 4) {
            goto LABEL_34;
          }
          goto LABEL_36;
        case 2:
          int v74 = *(unsigned __int16 *)v66;
          if (v115 >= 4) {
            goto LABEL_36;
          }
          goto LABEL_34;
        case 3:
          int v74 = *(unsigned __int16 *)v66 | (v66[2] << 16);
          if (v115 < 4) {
            goto LABEL_34;
          }
          goto LABEL_36;
        case 4:
          int v74 = *(_DWORD *)v66;
          if (v115 < 4) {
LABEL_34:
          }
            unsigned int v67 = (v74 | (v68 << (8 * v115))) + 2;
          else {
LABEL_36:
          }
            unsigned int v67 = v74 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v75 = ~v100;
    if (v67 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v108 + 16))(v65, v66, v109);
      char v76 = 1;
    }
    else
    {
      void *v65 = *(void *)v66;
      swift_retain();
      char v76 = 0;
    }
    *((unsigned char *)v65 + v115) = v76;
    v77 = (void *)(((unint64_t)v65 + v101) & v75);
    v78 = (unsigned __int8 *)((unint64_t)&v66[v101] & v75);
    unsigned int v79 = v78[v71];
    unsigned int v80 = v79 - 2;
    if (v79 < 2)
    {
      uint64_t v82 = v112;
    }
    else
    {
      if (v71 <= 3) {
        uint64_t v81 = v71;
      }
      else {
        uint64_t v81 = 4;
      }
      uint64_t v82 = v112;
      switch(v81)
      {
        case 1:
          int v83 = *v78;
          if (v71 < 4) {
            goto LABEL_51;
          }
          goto LABEL_53;
        case 2:
          int v83 = *(unsigned __int16 *)v78;
          if (v71 >= 4) {
            goto LABEL_53;
          }
          goto LABEL_51;
        case 3:
          int v83 = *(unsigned __int16 *)v78 | (v78[2] << 16);
          if (v71 < 4) {
            goto LABEL_51;
          }
          goto LABEL_53;
        case 4:
          int v83 = *(_DWORD *)v78;
          if (v71 < 4) {
LABEL_51:
          }
            unsigned int v79 = (v83 | (v80 << (8 * v71))) + 2;
          else {
LABEL_53:
          }
            unsigned int v79 = v83 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v84 = ~v73;
    if (v79 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v82 + 48))(v78, 1, v72))
      {
        memcpy(v77, v78, __n);
      }
      else
      {
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v82 + 16))(v77, v78, v72);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v82 + 56))(v77, 0, 1, v72);
      }
      *((unsigned char *)v77 + v71) = 1;
    }
    else
    {
      void *v77 = *(void *)v78;
      *((unsigned char *)v77 + v71) = 0;
      swift_retain();
    }
    v85 = (void *)(((unint64_t)v77 + v102 + v73) & v84);
    v86 = (unsigned __int8 *)((unint64_t)&v78[v102 + v73] & v84);
    unsigned int v87 = v86[v70];
    unsigned int v88 = v87 - 2;
    if (v87 >= 2)
    {
      if (v70 <= 3) {
        uint64_t v89 = v70;
      }
      else {
        uint64_t v89 = 4;
      }
      switch(v89)
      {
        case 1:
          int v90 = *v86;
          if (v70 < 4) {
            goto LABEL_70;
          }
          goto LABEL_72;
        case 2:
          int v90 = *(unsigned __int16 *)v86;
          if (v70 >= 4) {
            goto LABEL_72;
          }
          goto LABEL_70;
        case 3:
          int v90 = *(unsigned __int16 *)((unint64_t)&v78[v102 + v73] & v84) | (*(unsigned __int8 *)(((unint64_t)&v78[v102 + v73] & v84) + 2) << 16);
          if (v70 < 4) {
            goto LABEL_70;
          }
          goto LABEL_72;
        case 4:
          int v90 = *(_DWORD *)v86;
          if (v70 < 4) {
LABEL_70:
          }
            unsigned int v87 = (v90 | (v88 << (8 * v70))) + 2;
          else {
LABEL_72:
          }
            unsigned int v87 = v90 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v91 = ~v18;
    if (v87 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v110 + 16))(v85, v86, v111);
      char v92 = 1;
    }
    else
    {
      void *v85 = *(void *)v86;
      swift_retain();
      char v92 = 0;
    }
    *((unsigned char *)v85 + v70) = v92;
    unint64_t v93 = ((unint64_t)v85 + v104 + v18) & v91;
    unint64_t v94 = (unint64_t)&v86[v104 + v18] & v91;
    v95 = *(void (**)(unint64_t, unint64_t, uint64_t))(v114 + 16);
    v95(v93, v94, v106);
    unint64_t v96 = (v105 + v93) & v91;
    unint64_t v97 = (v105 + v94) & v91;
    v95(v96, v97, v106);
    v95((v105 + v96) & v91, (v105 + v97) & v91, v106);
    return a1;
  }
  return (void *)v39;
}

uint64_t sub_246558E8C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_246558E9C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_246558EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  unint64_t v5 = (a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24655947C(*(void *)v5, *(void *)(v5 + 8), *(unsigned char *)(v5 + 16));
  swift_bridgeObjectRelease();
  unint64_t v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v7, *(void *)(v7 + 8), *(unsigned char *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v8 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v8 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v8, *(void *)(v8 + 8), *(unsigned char *)(v8 + 16));
    swift_bridgeObjectRelease();
  }
  sub_246550978(*(void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  swift_release();
  unint64_t v9 = (a1
      + ((((((((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_246552EF4(*(void *)v9, *(unsigned char *)(v9 + 8));
  uint64_t v10 = sub_24659D278();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  unint64_t v13 = (unsigned __int8 *)((v9 + v12 + 9) & ~v12);
  if (*(void *)(v11 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(v11 + 64);
  }
  unsigned int v15 = v13[v14];
  unsigned int v16 = v15 - 2;
  if (v15 >= 2)
  {
    if (v14 <= 3) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = 4;
    }
    switch(v17)
    {
      case 1:
        int v18 = *v13;
        goto LABEL_19;
      case 2:
        int v18 = *(unsigned __int16 *)v13;
        goto LABEL_19;
      case 3:
        int v18 = *(unsigned __int16 *)v13 | (v13[2] << 16);
        goto LABEL_19;
      case 4:
        int v18 = *(_DWORD *)v13;
LABEL_19:
        int v19 = (v18 | (v16 << (8 * v14))) + 2;
        unsigned int v15 = v18 + 2;
        if (v14 < 4) {
          unsigned int v15 = v19;
        }
        break;
      default:
        break;
    }
  }
  if (v15 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(v13, v10);
  }
  else {
    swift_release();
  }
  int v20 = &v13[v14];
  uint64_t v21 = sub_24659CE68();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(_DWORD *)(v22 + 80) & 0xF8 | 7;
  unint64_t v24 = (unsigned __int8 *)((unint64_t)&v20[v23 + 1] & ~v23);
  unint64_t v25 = *(void *)(v22 + 64);
  if (!*(_DWORD *)(v22 + 84)) {
    ++v25;
  }
  if (v25 <= 8) {
    uint64_t v26 = 8;
  }
  else {
    uint64_t v26 = v25;
  }
  unsigned int v27 = v24[v26];
  unsigned int v28 = v27 - 2;
  if (v27 >= 2)
  {
    if (v26 <= 3) {
      uint64_t v29 = v26;
    }
    else {
      uint64_t v29 = 4;
    }
    switch(v29)
    {
      case 1:
        int v30 = *v24;
        goto LABEL_38;
      case 2:
        int v30 = *(unsigned __int16 *)v24;
        goto LABEL_38;
      case 3:
        int v30 = *(unsigned __int16 *)v24 | (v24[2] << 16);
        goto LABEL_38;
      case 4:
        int v30 = *(_DWORD *)v24;
LABEL_38:
        int v31 = (v30 | (v28 << (8 * v26))) + 2;
        unsigned int v27 = v30 + 2;
        if (v26 < 4) {
          unsigned int v27 = v31;
        }
        break;
      default:
        break;
    }
  }
  if (v27 == 1)
  {
    if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v22 + 48))(v24, 1, v21)) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v22 + 8))(v24, v21);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v32 = sub_24659D5D8();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(_DWORD *)(v33 + 80) & 0xF8 | 7;
  uint64_t v35 = (unsigned __int8 *)((unint64_t)&v24[v26 + 1 + v34] & ~v34);
  if (*(void *)(v33 + 64) <= 8uLL) {
    uint64_t v36 = 8;
  }
  else {
    uint64_t v36 = *(void *)(v33 + 64);
  }
  unsigned int v37 = v35[v36];
  unsigned int v38 = v37 - 2;
  if (v37 >= 2)
  {
    if (v36 <= 3) {
      uint64_t v39 = v36;
    }
    else {
      uint64_t v39 = 4;
    }
    switch(v39)
    {
      case 1:
        int v40 = *v35;
        goto LABEL_56;
      case 2:
        int v40 = *(unsigned __int16 *)v35;
        goto LABEL_56;
      case 3:
        int v40 = *(unsigned __int16 *)v35 | (v35[2] << 16);
        goto LABEL_56;
      case 4:
        int v40 = *(_DWORD *)v35;
LABEL_56:
        int v41 = (v40 | (v38 << (8 * v36))) + 2;
        unsigned int v37 = v40 + 2;
        if (v36 < 4) {
          unsigned int v37 = v41;
        }
        break;
      default:
        break;
    }
  }
  if (v37 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v33 + 8))(v35, v32);
  }
  else {
    swift_release();
  }
  unint64_t v42 = &v35[v36];
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  uint64_t v51 = v44 + 8;
  uint64_t v45 = *(unsigned __int8 *)(v44 + 80);
  uint64_t v46 = (unint64_t)&v42[v45 + 1] & ~v45;
  v50(v46, v43);
  uint64_t v47 = *(void *)(v51 + 56) + v45;
  uint64_t v48 = (v47 + v46) & ~v45;
  v50(v48, v43);

  return ((uint64_t (*)(uint64_t, uint64_t))v50)((v47 + v48) & ~v45, v43);
}

uint64_t sub_24655947C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24655948C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  unint64_t v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = *(void *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    long long v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    uint64_t v15 = *(void *)v13;
    uint64_t v16 = *(void *)(v13 + 8);
    char v17 = *(unsigned char *)(v13 + 16);
    sub_246558E8C(*(void *)v13, v16, v17);
    *(void *)unint64_t v12 = v15;
    *(void *)(v12 + 8) = v16;
    *(unsigned char *)(v12 + 16) = v17;
    *(void *)(v12 + 24) = *(void *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    long long v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    uint64_t v21 = *(void *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    char v23 = *(unsigned char *)(v20 + 16);
    sub_246558E8C(*(void *)v20, v22, v23);
    *(void *)unint64_t v19 = v21;
    *(void *)(v19 + 8) = v22;
    *(unsigned char *)(v19 + 16) = v23;
    *(void *)(v19 + 24) = *(void *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    long long v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)unint64_t v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    uint64_t v27 = *(void *)v26;
    uint64_t v28 = *(void *)(v26 + 8);
    char v29 = *(unsigned char *)(v26 + 16);
    sub_246558E8C(*(void *)v26, v28, v29);
    *(void *)unint64_t v25 = v27;
    *(void *)(v25 + 8) = v28;
    *(unsigned char *)(v25 + 16) = v29;
    *(void *)(v25 + 24) = *(void *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  uint64_t v34 = *(void *)(v32 + 8);
  char v35 = *(unsigned char *)(v32 + 16);
  sub_246558E9C(*(void *)v32, v34, v35);
  *(void *)unint64_t v31 = v33;
  *(void *)(v31 + 8) = v34;
  *(unsigned char *)(v31 + 16) = v35;
  uint64_t v36 = (void *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v37 = (void *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v38 = v37[1];
  void *v36 = *v37;
  v36[1] = v38;
  unint64_t v39 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v40 = (a1 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (a2 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v42 = *(void *)v41;
  LOBYTE(v33) = *(unsigned char *)(v41 + 8);
  swift_retain();
  sub_246552D38(v42, v33);
  *(void *)unint64_t v40 = v42;
  *(unsigned char *)(v40 + 8) = v33;
  uint64_t v43 = sub_24659D278();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(_DWORD *)(v44 + 80) & 0xF8;
  uint64_t v46 = v45 + 16;
  unint64_t v47 = v45 + 16 + v40;
  unint64_t v48 = ~v45 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v49 = (void *)(v47 & v48);
  uint64_t v50 = (unsigned __int8 *)((v46 + v41) & v48);
  if (*(void *)(v44 + 64) <= 8uLL) {
    uint64_t v51 = 8;
  }
  else {
    uint64_t v51 = *(void *)(*(void *)(v43 - 8) + 64);
  }
  unsigned int v52 = v50[v51];
  unsigned int v53 = v52 - 2;
  if (v52 >= 2)
  {
    if (v51 <= 3) {
      uint64_t v54 = v51;
    }
    else {
      uint64_t v54 = 4;
    }
    switch(v54)
    {
      case 1:
        int v55 = *v50;
        goto LABEL_22;
      case 2:
        int v55 = *(unsigned __int16 *)v50;
        goto LABEL_22;
      case 3:
        int v55 = *(unsigned __int16 *)((v46 + v41) & v48) | (*(unsigned __int8 *)(((v46 + v41) & v48) + 2) << 16);
        goto LABEL_22;
      case 4:
        int v55 = *(_DWORD *)v50;
LABEL_22:
        int v56 = (v55 | (v53 << (8 * v51))) + 2;
        unsigned int v52 = v55 + 2;
        if (v51 < 4) {
          unsigned int v52 = v56;
        }
        break;
      default:
        break;
    }
  }
  if (v52 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v44 + 16))(v49, v50, v43);
    char v57 = 1;
  }
  else
  {
    *unint64_t v49 = *(void *)v50;
    swift_retain();
    char v57 = 0;
  }
  *((unsigned char *)v49 + v51) = v57;
  uint64_t v58 = v51 + 1;
  uint64_t v59 = sub_24659CE68();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(_DWORD *)(v60 + 80) & 0xF8 | 7;
  unint64_t v62 = (unint64_t)&v50[v58 + v61];
  unint64_t v63 = (void *)(((unint64_t)v49 + v58 + v61) & ~v61);
  uint64_t v64 = (unsigned __int8 *)(v62 & ~v61);
  if (*(_DWORD *)(v60 + 84)) {
    size_t v65 = *(void *)(v60 + 64);
  }
  else {
    size_t v65 = *(void *)(v60 + 64) + 1;
  }
  if (v65 <= 8) {
    uint64_t v66 = 8;
  }
  else {
    uint64_t v66 = v65;
  }
  unsigned int v67 = v64[v66];
  unsigned int v68 = v67 - 2;
  if (v67 >= 2)
  {
    if (v66 <= 3) {
      uint64_t v69 = v66;
    }
    else {
      uint64_t v69 = 4;
    }
    switch(v69)
    {
      case 1:
        int v70 = *v64;
        goto LABEL_42;
      case 2:
        int v70 = *(unsigned __int16 *)v64;
        goto LABEL_42;
      case 3:
        int v70 = *(unsigned __int16 *)v64 | (v64[2] << 16);
        goto LABEL_42;
      case 4:
        int v70 = *(_DWORD *)v64;
LABEL_42:
        int v71 = (v70 | (v68 << (8 * v66))) + 2;
        unsigned int v67 = v70 + 2;
        if (v66 < 4) {
          unsigned int v67 = v71;
        }
        break;
      default:
        break;
    }
  }
  if (v67 == 1)
  {
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v60 + 48))(v64, 1, v59))
    {
      memcpy(v63, v64, v65);
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v60 + 16))(v63, v64, v59);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v60 + 56))(v63, 0, 1, v59);
    }
    *((unsigned char *)v63 + v66) = 1;
  }
  else
  {
    *unint64_t v63 = *(void *)v64;
    *((unsigned char *)v63 + v66) = 0;
    swift_retain();
  }
  uint64_t v72 = sub_24659D5D8();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(_DWORD *)(v73 + 80) & 0xF8 | 7;
  uint64_t v75 = v66 + v74 + 1;
  char v76 = (void *)(((unint64_t)v63 + v75) & ~v74);
  v77 = (unsigned __int8 *)((unint64_t)&v64[v75] & ~v74);
  if (*(void *)(v73 + 64) <= 8uLL) {
    uint64_t v78 = 8;
  }
  else {
    uint64_t v78 = *(void *)(v73 + 64);
  }
  unsigned int v79 = v77[v78];
  unsigned int v80 = v79 - 2;
  if (v79 >= 2)
  {
    if (v78 <= 3) {
      uint64_t v81 = v78;
    }
    else {
      uint64_t v81 = 4;
    }
    switch(v81)
    {
      case 1:
        int v82 = *v77;
        goto LABEL_62;
      case 2:
        int v82 = *(unsigned __int16 *)v77;
        goto LABEL_62;
      case 3:
        int v82 = *(unsigned __int16 *)v77 | (v77[2] << 16);
        goto LABEL_62;
      case 4:
        int v82 = *(_DWORD *)v77;
LABEL_62:
        int v83 = (v82 | (v80 << (8 * v78))) + 2;
        unsigned int v79 = v82 + 2;
        if (v78 < 4) {
          unsigned int v79 = v83;
        }
        break;
      default:
        break;
    }
  }
  if (v79 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v73 + 16))(v76, v77, v72);
    char v84 = 1;
  }
  else
  {
    *char v76 = *(void *)v77;
    swift_retain();
    char v84 = 0;
  }
  *((unsigned char *)v76 + v78) = v84;
  uint64_t v85 = v78 + 1;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v87 = *(void *)(v86 - 8);
  unsigned int v88 = *(void (**)(unint64_t, unint64_t, uint64_t))(v87 + 16);
  uint64_t v89 = v87 + 16;
  uint64_t v90 = *(unsigned __int8 *)(v87 + 80);
  unint64_t v91 = ((unint64_t)v76 + v85 + v90) & ~v90;
  unint64_t v92 = (unint64_t)&v77[v85 + v90] & ~v90;
  v88(v91, v92, v86);
  uint64_t v93 = *(void *)(v89 + 48) + v90;
  unint64_t v94 = (v93 + v91) & ~v90;
  unint64_t v95 = (v93 + v92) & ~v90;
  v88(v94, v95, v86);
  v88((v93 + v94) & ~v90, (v93 + v95) & ~v90, v86);
  return a1;
}

uint64_t sub_246559BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  uint64_t v12 = *(void *)v7;
  uint64_t v13 = *(void *)(v7 + 8);
  char v14 = *(unsigned char *)(v7 + 16);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  sub_24655947C(v12, v13, v14);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = *(void *)(v16 + 24);
  if (*(void *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v24 = *(void *)v16;
      uint64_t v25 = *(void *)(v16 + 8);
      char v26 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v25, v26);
      *(void *)unint64_t v15 = v24;
      *(void *)(v15 + 8) = v25;
      *(unsigned char *)(v15 + 16) = v26;
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v18 = *(void *)v16;
      uint64_t v19 = *(void *)(v16 + 8);
      char v20 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v19, v20);
      uint64_t v21 = *(void *)v15;
      uint64_t v22 = *(void *)(v15 + 8);
      char v23 = *(unsigned char *)(v15 + 16);
      *(void *)unint64_t v15 = v18;
      *(void *)(v15 + 8) = v19;
      *(unsigned char *)(v15 + 16) = v20;
      sub_24655947C(v21, v22, v23);
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_24655947C(*(void *)v15, *(void *)(v15 + 8), *(unsigned char *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  long long v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  unint64_t v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = *(void *)(v29 + 24);
  if (*(void *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v37 = *(void *)v29;
      uint64_t v38 = *(void *)(v29 + 8);
      char v39 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v38, v39);
      *(void *)unint64_t v28 = v37;
      *(void *)(v28 + 8) = v38;
      *(unsigned char *)(v28 + 16) = v39;
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v31 = *(void *)v29;
      uint64_t v32 = *(void *)(v29 + 8);
      char v33 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v32, v33);
      uint64_t v34 = *(void *)v28;
      uint64_t v35 = *(void *)(v28 + 8);
      char v36 = *(unsigned char *)(v28 + 16);
      *(void *)unint64_t v28 = v31;
      *(void *)(v28 + 8) = v32;
      *(unsigned char *)(v28 + 16) = v33;
      sub_24655947C(v34, v35, v36);
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_24655947C(*(void *)v28, *(void *)(v28 + 8), *(unsigned char *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  long long v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)unint64_t v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  unint64_t v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = *(void *)(v42 + 24);
  if (*(void *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v50 = *(void *)v42;
      uint64_t v51 = *(void *)(v42 + 8);
      char v52 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v51, v52);
      *(void *)unint64_t v41 = v50;
      *(void *)(v41 + 8) = v51;
      *(unsigned char *)(v41 + 16) = v52;
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v44 = *(void *)v42;
      uint64_t v45 = *(void *)(v42 + 8);
      char v46 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v45, v46);
      uint64_t v47 = *(void *)v41;
      uint64_t v48 = *(void *)(v41 + 8);
      char v49 = *(unsigned char *)(v41 + 16);
      *(void *)unint64_t v41 = v44;
      *(void *)(v41 + 8) = v45;
      *(unsigned char *)(v41 + 16) = v46;
      sub_24655947C(v47, v48, v49);
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_24655947C(*(void *)v41, *(void *)(v41 + 8), *(unsigned char *)(v41 + 16));
    swift_bridgeObjectRelease();
  }
  long long v53 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)unint64_t v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + 16) = v53;
LABEL_22:
  unint64_t v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v56 = *(void *)v55;
  uint64_t v57 = *(void *)(v55 + 8);
  char v58 = *(unsigned char *)(v55 + 16);
  sub_246558E9C(*(void *)v55, v57, v58);
  uint64_t v59 = *(void *)v54;
  uint64_t v60 = *(void *)(v54 + 8);
  *(void *)unint64_t v54 = v56;
  *(void *)(v54 + 8) = v57;
  char v61 = *(unsigned char *)(v54 + 16);
  *(unsigned char *)(v54 + 16) = v58;
  sub_246550978(v59, v60, v61);
  unint64_t v62 = (void *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v63 = (void *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v64 = v63[1];
  *unint64_t v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  unint64_t v65 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v66 = (a1 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v67 = (a2 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v68 = *(void *)v67;
  LOBYTE(v56) = *(unsigned char *)(v67 + 8);
  sub_246552D38(*(void *)v67, v56);
  uint64_t v69 = *(void *)v66;
  char v70 = *(unsigned char *)(v66 + 8);
  *(void *)unint64_t v66 = v68;
  *(unsigned char *)(v66 + 8) = v56;
  sub_246552EF4(v69, v70);
  uint64_t v71 = sub_24659D278();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  uint64_t v74 = v73 + 16;
  unint64_t v75 = v73 + 16 + v66;
  unint64_t v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  v77 = (unsigned __int8 *)(v75 & v76);
  uint64_t v78 = (unsigned __int8 *)((v74 + v67) & v76);
  if (*(void *)(v72 + 64) <= 8uLL) {
    uint64_t v79 = 8;
  }
  else {
    uint64_t v79 = *(void *)(*(void *)(v71 - 8) + 64);
  }
  if (v77 != v78)
  {
    uint64_t v80 = v71;
    unsigned int v81 = v77[v79];
    unsigned int v82 = v81 - 2;
    if (v81 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v83 = v79;
      }
      else {
        uint64_t v83 = 4;
      }
      switch(v83)
      {
        case 1:
          int v84 = *v77;
          if (v79 >= 4) {
            goto LABEL_40;
          }
          goto LABEL_36;
        case 2:
          int v84 = *(unsigned __int16 *)v77;
          if (v79 >= 4) {
            goto LABEL_40;
          }
          goto LABEL_36;
        case 3:
          int v84 = *(unsigned __int16 *)(v75 & v76) | (*(unsigned __int8 *)((v75 & v76) + 2) << 16);
          if (v79 < 4) {
            goto LABEL_36;
          }
          goto LABEL_40;
        case 4:
          int v84 = *(_DWORD *)v77;
          if (v79 < 4)
          {
LABEL_36:
            unsigned int v81 = (v84 | (v82 << (8 * v79))) + 2;
            break;
          }
LABEL_40:
          if (v84 != -1) {
            goto LABEL_41;
          }
          goto LABEL_38;
        default:
          break;
      }
    }
    if (v81 == 1) {
LABEL_38:
    }
      (*(void (**)(unsigned __int8 *, uint64_t))(v72 + 8))(v77, v71);
    else {
LABEL_41:
    }
      swift_release();
    unsigned int v85 = v78[v79];
    unsigned int v86 = v85 - 2;
    if (v85 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v87 = v79;
      }
      else {
        uint64_t v87 = 4;
      }
      switch(v87)
      {
        case 1:
          int v88 = *v78;
          if (v79 >= 4) {
            goto LABEL_56;
          }
          goto LABEL_52;
        case 2:
          int v88 = *(unsigned __int16 *)v78;
          if (v79 >= 4) {
            goto LABEL_56;
          }
          goto LABEL_52;
        case 3:
          int v88 = *(unsigned __int16 *)v78 | (v78[2] << 16);
          if (v79 < 4) {
            goto LABEL_52;
          }
          goto LABEL_56;
        case 4:
          int v88 = *(_DWORD *)v78;
          if (v79 < 4)
          {
LABEL_52:
            unsigned int v85 = (v88 | (v86 << (8 * v79))) + 2;
            break;
          }
LABEL_56:
          if (v88 != -1) {
            goto LABEL_57;
          }
          goto LABEL_54;
        default:
          break;
      }
    }
    if (v85 == 1)
    {
LABEL_54:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v72 + 16))(v77, v78, v80);
      v77[v79] = 1;
    }
    else
    {
LABEL_57:
      *(void *)v77 = *(void *)v78;
      v77[v79] = 0;
      swift_retain();
    }
  }
  uint64_t v89 = sub_24659CE68();
  uint64_t v90 = *(void *)(v89 - 8);
  int v91 = *(_DWORD *)(v90 + 84);
  uint64_t v92 = *(_DWORD *)(v90 + 80) & 0xF8 | 7;
  uint64_t v93 = v79 + v92 + 1;
  unint64_t v94 = (unint64_t)&v77[v93];
  unint64_t v95 = (unint64_t)&v78[v93];
  unint64_t v96 = (unsigned __int8 *)(v94 & ~v92);
  unint64_t v97 = (unsigned __int8 *)(v95 & ~v92);
  unint64_t v98 = *(void *)(v90 + 64);
  if (v96 != v97)
  {
    uint64_t v99 = v89;
    if (v91) {
      size_t v100 = *(void *)(v90 + 64);
    }
    else {
      size_t v100 = v98 + 1;
    }
    if (v100 <= 8) {
      uint64_t v101 = 8;
    }
    else {
      uint64_t v101 = v100;
    }
    unsigned int v102 = v96[v101];
    unsigned int v103 = v102 - 2;
    if (v102 >= 2)
    {
      if (v101 <= 3) {
        uint64_t v104 = v101;
      }
      else {
        uint64_t v104 = 4;
      }
      switch(v104)
      {
        case 1:
          int v105 = *v96;
          if (v101 >= 4) {
            goto LABEL_80;
          }
          goto LABEL_75;
        case 2:
          int v105 = *(unsigned __int16 *)v96;
          if (v101 >= 4) {
            goto LABEL_80;
          }
          goto LABEL_75;
        case 3:
          int v105 = *(unsigned __int16 *)v96 | (v96[2] << 16);
          if (v101 < 4) {
            goto LABEL_75;
          }
          goto LABEL_80;
        case 4:
          int v105 = *(_DWORD *)v96;
          if (v101 < 4)
          {
LABEL_75:
            unsigned int v102 = (v105 | (v103 << (8 * v101))) + 2;
            break;
          }
LABEL_80:
          if (v105 != -1) {
            goto LABEL_81;
          }
          goto LABEL_77;
        default:
          break;
      }
    }
    if (v102 == 1)
    {
LABEL_77:
      if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v90 + 48))(v96, 1, v89)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v90 + 8))(v96, v99);
      }
    }
    else
    {
LABEL_81:
      swift_release();
    }
    unsigned int v106 = v97[v101];
    unsigned int v107 = v106 - 2;
    if (v106 >= 2)
    {
      if (v101 <= 3) {
        uint64_t v108 = v101;
      }
      else {
        uint64_t v108 = 4;
      }
      switch(v108)
      {
        case 1:
          int v109 = *v97;
          if (v101 >= 4) {
            goto LABEL_99;
          }
          goto LABEL_92;
        case 2:
          int v109 = *(unsigned __int16 *)v97;
          if (v101 >= 4) {
            goto LABEL_99;
          }
          goto LABEL_92;
        case 3:
          int v109 = *(unsigned __int16 *)v97 | (v97[2] << 16);
          if (v101 < 4) {
            goto LABEL_92;
          }
          goto LABEL_99;
        case 4:
          int v109 = *(_DWORD *)v97;
          if (v101 < 4)
          {
LABEL_92:
            unsigned int v106 = (v109 | (v107 << (8 * v101))) + 2;
            break;
          }
LABEL_99:
          if (v109 != -1) {
            goto LABEL_100;
          }
          goto LABEL_94;
        default:
          break;
      }
    }
    if (v106 == 1)
    {
LABEL_94:
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v90 + 48))(v97, 1, v99))
      {
        memcpy(v96, v97, v100);
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v90 + 16))(v96, v97, v99);
        (*(void (**)(unsigned __int8 *, void, uint64_t, uint64_t))(v90 + 56))(v96, 0, 1, v99);
      }
      v96[v101] = 1;
    }
    else
    {
LABEL_100:
      *(void *)unint64_t v96 = *(void *)v97;
      v96[v101] = 0;
      swift_retain();
    }
  }
  if (v91) {
    unint64_t v110 = v98;
  }
  else {
    unint64_t v110 = v98 + 1;
  }
  uint64_t v111 = 8;
  if (v110 <= 8) {
    uint64_t v112 = 8;
  }
  else {
    uint64_t v112 = v110;
  }
  uint64_t v113 = sub_24659D5D8();
  uint64_t v114 = *(void *)(v113 - 8);
  uint64_t v115 = *(_DWORD *)(v114 + 80) & 0xF8 | 7;
  uint64_t v116 = v112 + v115 + 1;
  unint64_t v117 = (unsigned __int8 *)((unint64_t)&v96[v116] & ~v115);
  v118 = (unsigned __int8 *)((unint64_t)&v97[v116] & ~v115);
  if (*(void *)(v114 + 64) > 8uLL) {
    uint64_t v111 = *(void *)(v114 + 64);
  }
  if (v117 != v118)
  {
    uint64_t v119 = v113;
    unsigned int v120 = v117[v111];
    unsigned int v121 = v120 - 2;
    if (v120 >= 2)
    {
      if (v111 <= 3) {
        uint64_t v122 = v111;
      }
      else {
        uint64_t v122 = 4;
      }
      switch(v122)
      {
        case 1:
          int v123 = *v117;
          goto LABEL_119;
        case 2:
          int v123 = *(unsigned __int16 *)v117;
          goto LABEL_119;
        case 3:
          int v123 = *(unsigned __int16 *)v117 | (v117[2] << 16);
          goto LABEL_119;
        case 4:
          int v123 = *(_DWORD *)v117;
LABEL_119:
          int v124 = (v123 | (v121 << (8 * v111))) + 2;
          unsigned int v120 = v123 + 2;
          if (v111 < 4) {
            unsigned int v120 = v124;
          }
          break;
        default:
          break;
      }
    }
    if (v120 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v114 + 8))(v117, v113);
    }
    else {
      swift_release();
    }
    unsigned int v125 = v118[v111];
    unsigned int v126 = v125 - 2;
    if (v125 >= 2)
    {
      if (v111 <= 3) {
        uint64_t v127 = v111;
      }
      else {
        uint64_t v127 = 4;
      }
      switch(v127)
      {
        case 1:
          int v128 = *v118;
          goto LABEL_133;
        case 2:
          int v128 = *(unsigned __int16 *)v118;
          goto LABEL_133;
        case 3:
          int v128 = *(unsigned __int16 *)v118 | (v118[2] << 16);
          goto LABEL_133;
        case 4:
          int v128 = *(_DWORD *)v118;
LABEL_133:
          int v129 = (v128 | (v126 << (8 * v111))) + 2;
          unsigned int v125 = v128 + 2;
          if (v111 < 4) {
            unsigned int v125 = v129;
          }
          break;
        default:
          break;
      }
    }
    if (v125 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v114 + 16))(v117, v118, v119);
      v117[v111] = 1;
    }
    else
    {
      *(void *)unint64_t v117 = *(void *)v118;
      v117[v111] = 0;
      swift_retain();
    }
  }
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v131 = *(void *)(v130 - 8);
  v132 = *(void (**)(unint64_t, unint64_t, uint64_t))(v131 + 24);
  uint64_t v133 = v131 + 24;
  uint64_t v134 = *(unsigned __int8 *)(v131 + 80);
  uint64_t v135 = v111 + v134 + 1;
  unint64_t v136 = (unint64_t)&v117[v135] & ~v134;
  unint64_t v137 = (unint64_t)&v118[v135] & ~v134;
  v132(v136, v137, v130);
  uint64_t v138 = *(void *)(v133 + 40) + v134;
  unint64_t v139 = (v138 + v136) & ~v134;
  unint64_t v140 = (v138 + v137) & ~v134;
  v132(v139, v140, v130);
  v132((v138 + v139) & ~v134, (v138 + v140) & ~v134, v130);
  return a1;
}

uint64_t sub_24655A7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  unint64_t v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v18 = v17[1];
  *unint64_t v16 = *v17;
  v16[1] = v18;
  unint64_t v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v21 = *(unsigned char *)(v20 + 16);
  *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  *(unsigned char *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v23 = (a1 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (a2 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v22) = *(unsigned char *)(v24 + 8);
  *(void *)unint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = v22;
  uint64_t v25 = sub_24659D278();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  uint64_t v28 = v27 + 16;
  unint64_t v29 = v27 + 16 + v23;
  unint64_t v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = (void *)(v29 & v30);
  uint64_t v32 = (unsigned __int8 *)((v28 + v24) & v30);
  if (*(void *)(v26 + 64) <= 8uLL) {
    uint64_t v33 = 8;
  }
  else {
    uint64_t v33 = *(void *)(*(void *)(v25 - 8) + 64);
  }
  unsigned int v34 = v32[v33];
  unsigned int v35 = v34 - 2;
  if (v34 >= 2)
  {
    if (v33 <= 3) {
      uint64_t v36 = v33;
    }
    else {
      uint64_t v36 = 4;
    }
    switch(v36)
    {
      case 1:
        int v37 = *v32;
        goto LABEL_13;
      case 2:
        int v37 = *(unsigned __int16 *)v32;
        goto LABEL_13;
      case 3:
        int v37 = *(unsigned __int16 *)v32 | (v32[2] << 16);
        goto LABEL_13;
      case 4:
        int v37 = *(_DWORD *)v32;
LABEL_13:
        int v38 = (v37 | (v35 << (8 * v33))) + 2;
        unsigned int v34 = v37 + 2;
        if (v33 < 4) {
          unsigned int v34 = v38;
        }
        break;
      default:
        break;
    }
  }
  if (v34 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v26 + 32))(v31, v32, v25);
    char v39 = 1;
  }
  else
  {
    char v39 = 0;
    *uint64_t v31 = *(void *)v32;
  }
  *((unsigned char *)v31 + v33) = v39;
  uint64_t v40 = v33 + 1;
  uint64_t v41 = sub_24659CE68();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(_DWORD *)(v42 + 80) & 0xF8 | 7;
  unint64_t v44 = (unint64_t)&v32[v40 + v43];
  uint64_t v45 = (void *)(((unint64_t)v31 + v40 + v43) & ~v43);
  char v46 = (unsigned __int8 *)(v44 & ~v43);
  if (*(_DWORD *)(v42 + 84)) {
    size_t v47 = *(void *)(v42 + 64);
  }
  else {
    size_t v47 = *(void *)(v42 + 64) + 1;
  }
  if (v47 <= 8) {
    uint64_t v48 = 8;
  }
  else {
    uint64_t v48 = v47;
  }
  unsigned int v49 = v46[v48];
  unsigned int v50 = v49 - 2;
  if (v49 >= 2)
  {
    if (v48 <= 3) {
      uint64_t v51 = v48;
    }
    else {
      uint64_t v51 = 4;
    }
    switch(v51)
    {
      case 1:
        int v52 = *v46;
        goto LABEL_33;
      case 2:
        int v52 = *(unsigned __int16 *)v46;
        goto LABEL_33;
      case 3:
        int v52 = *(unsigned __int16 *)v46 | (v46[2] << 16);
        goto LABEL_33;
      case 4:
        int v52 = *(_DWORD *)v46;
LABEL_33:
        int v53 = (v52 | (v50 << (8 * v48))) + 2;
        unsigned int v49 = v52 + 2;
        if (v48 < 4) {
          unsigned int v49 = v53;
        }
        break;
      default:
        break;
    }
  }
  if (v49 == 1)
  {
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v42 + 48))(v46, 1, v41))
    {
      memcpy(v45, v46, v47);
      char v54 = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v42 + 32))(v45, v46, v41);
      char v54 = 1;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v41);
    }
  }
  else
  {
    char v54 = 0;
    void *v45 = *(void *)v46;
  }
  *((unsigned char *)v45 + v48) = v54;
  uint64_t v55 = sub_24659D5D8();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(_DWORD *)(v56 + 80) & 0xF8 | 7;
  uint64_t v58 = v48 + v57 + 1;
  uint64_t v59 = (void *)(((unint64_t)v45 + v58) & ~v57);
  uint64_t v60 = (unsigned __int8 *)((unint64_t)&v46[v58] & ~v57);
  if (*(void *)(v56 + 64) <= 8uLL) {
    uint64_t v61 = 8;
  }
  else {
    uint64_t v61 = *(void *)(v56 + 64);
  }
  unsigned int v62 = v60[v61];
  unsigned int v63 = v62 - 2;
  if (v62 >= 2)
  {
    if (v61 <= 3) {
      uint64_t v64 = v61;
    }
    else {
      uint64_t v64 = 4;
    }
    switch(v64)
    {
      case 1:
        int v65 = *v60;
        goto LABEL_52;
      case 2:
        int v65 = *(unsigned __int16 *)v60;
        goto LABEL_52;
      case 3:
        int v65 = *(unsigned __int16 *)v60 | (v60[2] << 16);
        goto LABEL_52;
      case 4:
        int v65 = *(_DWORD *)v60;
LABEL_52:
        int v66 = (v65 | (v63 << (8 * v61))) + 2;
        unsigned int v62 = v65 + 2;
        if (v61 < 4) {
          unsigned int v62 = v66;
        }
        break;
      default:
        break;
    }
  }
  if (v62 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v56 + 32))(v59, v60, v55);
    char v67 = 1;
  }
  else
  {
    char v67 = 0;
    void *v59 = *(void *)v60;
  }
  *((unsigned char *)v59 + v61) = v67;
  uint64_t v68 = v61 + 1;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v70 = *(void *)(v69 - 8);
  uint64_t v71 = *(void (**)(unint64_t, unint64_t, uint64_t))(v70 + 32);
  uint64_t v72 = v70 + 32;
  uint64_t v73 = *(unsigned __int8 *)(v70 + 80);
  unint64_t v74 = ((unint64_t)v59 + v68 + v73) & ~v73;
  unint64_t v75 = (unint64_t)&v60[v68 + v73] & ~v73;
  v71(v74, v75, v69);
  uint64_t v76 = *(void *)(v72 + 32) + v73;
  unint64_t v77 = (v76 + v74) & ~v73;
  unint64_t v78 = (v76 + v75) & ~v73;
  v71(v77, v78, v69);
  v71((v76 + v77) & ~v73, (v76 + v78) & ~v73, v69);
  return a1;
}

uint64_t sub_24655AE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  char v9 = *(unsigned char *)(v8 + 16);
  uint64_t v10 = *(void *)v7;
  uint64_t v11 = *(void *)(v7 + 8);
  char v12 = *(unsigned char *)(v7 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = v9;
  sub_24655947C(v10, v11, v12);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRelease();
  unint64_t v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      char v15 = *(unsigned char *)(v14 + 16);
      uint64_t v16 = *(void *)v13;
      uint64_t v17 = *(void *)(v13 + 8);
      char v18 = *(unsigned char *)(v13 + 16);
      *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
      *(unsigned char *)(v13 + 16) = v15;
      sub_24655947C(v16, v17, v18);
      *(void *)(v13 + 24) = *(void *)(v14 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_24655947C(*(void *)v13, *(void *)(v13 + 8), *(unsigned char *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  long long v19 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v19;
LABEL_6:
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v21 + 24) >= 0xFFFFFFFFuLL)
    {
      char v22 = *(unsigned char *)(v21 + 16);
      uint64_t v23 = *(void *)v20;
      uint64_t v24 = *(void *)(v20 + 8);
      char v25 = *(unsigned char *)(v20 + 16);
      *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
      *(unsigned char *)(v20 + 16) = v22;
      sub_24655947C(v23, v24, v25);
      *(void *)(v20 + 24) = *(void *)(v21 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_24655947C(*(void *)v20, *(void *)(v20 + 8), *(unsigned char *)(v20 + 16));
    swift_bridgeObjectRelease();
  }
  long long v26 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v26;
LABEL_11:
  unint64_t v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v27 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v28 + 24) >= 0xFFFFFFFFuLL)
    {
      char v29 = *(unsigned char *)(v28 + 16);
      uint64_t v30 = *(void *)v27;
      uint64_t v31 = *(void *)(v27 + 8);
      char v32 = *(unsigned char *)(v27 + 16);
      *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
      *(unsigned char *)(v27 + 16) = v29;
      sub_24655947C(v30, v31, v32);
      *(void *)(v27 + 24) = *(void *)(v28 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_24655947C(*(void *)v27, *(void *)(v27 + 8), *(unsigned char *)(v27 + 16));
    swift_bridgeObjectRelease();
  }
  long long v33 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v33;
LABEL_16:
  unint64_t v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v36 = *(unsigned char *)(v35 + 16);
  uint64_t v37 = *(void *)v34;
  uint64_t v38 = *(void *)(v34 + 8);
  *(_OWORD *)unint64_t v34 = *(_OWORD *)v35;
  char v39 = *(unsigned char *)(v34 + 16);
  *(unsigned char *)(v34 + 16) = v36;
  sub_246550978(v37, v38, v39);
  *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v28 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  unint64_t v40 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v41 = (a1 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (a2 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  char v43 = *(unsigned char *)(v42 + 8);
  uint64_t v44 = *(void *)v41;
  char v45 = *(unsigned char *)(v41 + 8);
  *(void *)unint64_t v41 = *(void *)v42;
  *(unsigned char *)(v41 + 8) = v43;
  sub_246552EF4(v44, v45);
  uint64_t v46 = sub_24659D278();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(_DWORD *)(v47 + 80) & 0xF8;
  uint64_t v49 = v48 + 16;
  unint64_t v50 = v48 + 16 + v41;
  unint64_t v51 = ~v48 & 0xFFFFFFFFFFFFFFF8;
  int v52 = (unsigned __int8 *)(v50 & v51);
  int v53 = (unsigned __int8 *)((v49 + v42) & v51);
  if (*(void *)(v47 + 64) <= 8uLL) {
    uint64_t v54 = 8;
  }
  else {
    uint64_t v54 = *(void *)(*(void *)(v46 - 8) + 64);
  }
  if (v52 != v53)
  {
    uint64_t v55 = v46;
    unsigned int v56 = v52[v54];
    unsigned int v57 = v56 - 2;
    if (v56 >= 2)
    {
      if (v54 <= 3) {
        uint64_t v58 = v54;
      }
      else {
        uint64_t v58 = 4;
      }
      switch(v58)
      {
        case 1:
          int v59 = *v52;
          goto LABEL_29;
        case 2:
          int v59 = *(unsigned __int16 *)v52;
          goto LABEL_29;
        case 3:
          int v59 = *(unsigned __int16 *)(v50 & v51) | (*(unsigned __int8 *)((v50 & v51) + 2) << 16);
          goto LABEL_29;
        case 4:
          int v59 = *(_DWORD *)v52;
LABEL_29:
          int v60 = (v59 | (v57 << (8 * v54))) + 2;
          unsigned int v56 = v59 + 2;
          if (v54 < 4) {
            unsigned int v56 = v60;
          }
          break;
        default:
          break;
      }
    }
    if (v56 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v47 + 8))(v52, v46);
    }
    else {
      swift_release();
    }
    unsigned int v61 = v53[v54];
    unsigned int v62 = v61 - 2;
    if (v61 >= 2)
    {
      if (v54 <= 3) {
        uint64_t v63 = v54;
      }
      else {
        uint64_t v63 = 4;
      }
      switch(v63)
      {
        case 1:
          int v64 = *v53;
          goto LABEL_43;
        case 2:
          int v64 = *(unsigned __int16 *)v53;
          goto LABEL_43;
        case 3:
          int v64 = *(unsigned __int16 *)v53 | (v53[2] << 16);
          goto LABEL_43;
        case 4:
          int v64 = *(_DWORD *)v53;
LABEL_43:
          int v65 = (v64 | (v62 << (8 * v54))) + 2;
          unsigned int v61 = v64 + 2;
          if (v54 < 4) {
            unsigned int v61 = v65;
          }
          break;
        default:
          break;
      }
    }
    if (v61 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v47 + 32))(v52, v53, v55);
      char v66 = 1;
    }
    else
    {
      char v66 = 0;
      *(void *)int v52 = *(void *)v53;
    }
    v52[v54] = v66;
  }
  uint64_t v67 = sub_24659CE68();
  uint64_t v68 = *(void *)(v67 - 8);
  int v69 = *(_DWORD *)(v68 + 84);
  uint64_t v70 = *(_DWORD *)(v68 + 80) & 0xF8 | 7;
  uint64_t v71 = v54 + v70 + 1;
  unint64_t v72 = (unint64_t)&v52[v71];
  unint64_t v73 = (unint64_t)&v53[v71];
  unint64_t v74 = (unsigned __int8 *)(v72 & ~v70);
  unint64_t v75 = (unsigned __int8 *)(v73 & ~v70);
  unint64_t v76 = *(void *)(v68 + 64);
  if (v74 != v75)
  {
    uint64_t v77 = v67;
    if (v69) {
      size_t v78 = *(void *)(v68 + 64);
    }
    else {
      size_t v78 = v76 + 1;
    }
    if (v78 <= 8) {
      uint64_t v79 = 8;
    }
    else {
      uint64_t v79 = v78;
    }
    unsigned int v80 = v74[v79];
    unsigned int v81 = v80 - 2;
    if (v80 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v82 = v79;
      }
      else {
        uint64_t v82 = 4;
      }
      switch(v82)
      {
        case 1:
          int v83 = *v74;
          goto LABEL_65;
        case 2:
          int v83 = *(unsigned __int16 *)v74;
          goto LABEL_65;
        case 3:
          int v83 = *(unsigned __int16 *)v74 | (v74[2] << 16);
          goto LABEL_65;
        case 4:
          int v83 = *(_DWORD *)v74;
LABEL_65:
          int v84 = (v83 | (v81 << (8 * v79))) + 2;
          unsigned int v80 = v83 + 2;
          if (v79 < 4) {
            unsigned int v80 = v84;
          }
          break;
        default:
          break;
      }
    }
    if (v80 == 1)
    {
      if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v68 + 48))(v74, 1, v67)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v68 + 8))(v74, v77);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v85 = v75[v79];
    unsigned int v86 = v85 - 2;
    if (v85 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v87 = v79;
      }
      else {
        uint64_t v87 = 4;
      }
      switch(v87)
      {
        case 1:
          int v88 = *v75;
          goto LABEL_80;
        case 2:
          int v88 = *(unsigned __int16 *)v75;
          goto LABEL_80;
        case 3:
          int v88 = *(unsigned __int16 *)v75 | (v75[2] << 16);
          goto LABEL_80;
        case 4:
          int v88 = *(_DWORD *)v75;
LABEL_80:
          int v89 = (v88 | (v86 << (8 * v79))) + 2;
          unsigned int v85 = v88 + 2;
          if (v79 < 4) {
            unsigned int v85 = v89;
          }
          break;
        default:
          break;
      }
    }
    if (v85 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v68 + 48))(v75, 1, v77))
      {
        memcpy(v74, v75, v78);
        char v90 = 1;
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v68 + 32))(v74, v75, v77);
        char v90 = 1;
        (*(void (**)(unsigned __int8 *, void, uint64_t, uint64_t))(v68 + 56))(v74, 0, 1, v77);
      }
    }
    else
    {
      char v90 = 0;
      *(void *)unint64_t v74 = *(void *)v75;
    }
    v74[v79] = v90;
  }
  if (v69) {
    unint64_t v91 = v76;
  }
  else {
    unint64_t v91 = v76 + 1;
  }
  uint64_t v92 = 8;
  if (v91 <= 8) {
    uint64_t v93 = 8;
  }
  else {
    uint64_t v93 = v91;
  }
  uint64_t v94 = sub_24659D5D8();
  uint64_t v95 = *(void *)(v94 - 8);
  uint64_t v96 = *(_DWORD *)(v95 + 80) & 0xF8 | 7;
  uint64_t v97 = v93 + v96 + 1;
  unint64_t v98 = (unsigned __int8 *)((unint64_t)&v74[v97] & ~v96);
  uint64_t v99 = (unsigned __int8 *)((unint64_t)&v75[v97] & ~v96);
  if (*(void *)(v95 + 64) > 8uLL) {
    uint64_t v92 = *(void *)(v95 + 64);
  }
  if (v98 != v99)
  {
    uint64_t v100 = v94;
    unsigned int v101 = v98[v92];
    unsigned int v102 = v101 - 2;
    if (v101 >= 2)
    {
      if (v92 <= 3) {
        uint64_t v103 = v92;
      }
      else {
        uint64_t v103 = 4;
      }
      switch(v103)
      {
        case 1:
          int v104 = *v98;
          goto LABEL_106;
        case 2:
          int v104 = *(unsigned __int16 *)v98;
          goto LABEL_106;
        case 3:
          int v104 = *(unsigned __int16 *)v98 | (v98[2] << 16);
          goto LABEL_106;
        case 4:
          int v104 = *(_DWORD *)v98;
LABEL_106:
          int v105 = (v104 | (v102 << (8 * v92))) + 2;
          unsigned int v101 = v104 + 2;
          if (v92 < 4) {
            unsigned int v101 = v105;
          }
          break;
        default:
          break;
      }
    }
    if (v101 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v95 + 8))(v98, v94);
    }
    else {
      swift_release();
    }
    unsigned int v106 = v99[v92];
    unsigned int v107 = v106 - 2;
    if (v106 >= 2)
    {
      if (v92 <= 3) {
        uint64_t v108 = v92;
      }
      else {
        uint64_t v108 = 4;
      }
      switch(v108)
      {
        case 1:
          int v109 = *v99;
          goto LABEL_120;
        case 2:
          int v109 = *(unsigned __int16 *)v99;
          goto LABEL_120;
        case 3:
          int v109 = *(unsigned __int16 *)v99 | (v99[2] << 16);
          goto LABEL_120;
        case 4:
          int v109 = *(_DWORD *)v99;
LABEL_120:
          int v110 = (v109 | (v107 << (8 * v92))) + 2;
          unsigned int v106 = v109 + 2;
          if (v92 < 4) {
            unsigned int v106 = v110;
          }
          break;
        default:
          break;
      }
    }
    if (v106 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v95 + 32))(v98, v99, v100);
      char v111 = 1;
    }
    else
    {
      char v111 = 0;
      *(void *)unint64_t v98 = *(void *)v99;
    }
    v98[v92] = v111;
  }
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = *(void (**)(unint64_t, unint64_t, uint64_t))(v113 + 40);
  uint64_t v115 = v113 + 40;
  uint64_t v116 = *(unsigned __int8 *)(v113 + 80);
  uint64_t v117 = v92 + v116 + 1;
  unint64_t v118 = (unint64_t)&v98[v117] & ~v116;
  unint64_t v119 = (unint64_t)&v99[v117] & ~v116;
  v114(v118, v119, v112);
  uint64_t v120 = *(void *)(v115 + 24) + v116;
  unint64_t v121 = (v120 + v118) & ~v116;
  unint64_t v122 = (v120 + v119) & ~v116;
  v114(v121, v122, v112);
  v114((v120 + v121) & ~v116, (v120 + v122) & ~v116, v112);
  return a1;
}

uint64_t sub_24655B860(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v41 = *(_DWORD *)(v3 + 84);
  if (v41 <= 0x7FFFFFFF) {
    unsigned int v4 = 0x7FFFFFFF;
  }
  else {
    unsigned int v4 = *(_DWORD *)(v3 + 84);
  }
  uint64_t v5 = *(void *)(sub_24659D278() - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  if (v6 <= 8) {
    unint64_t v6 = 8;
  }
  unint64_t v42 = v6;
  uint64_t v7 = *(void *)(sub_24659CE68() - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(sub_24659D5D8() - 8);
  if (*(void *)(v10 + 64) <= 8uLL) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = *(void *)(v10 + 64);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0) - 8);
  uint64_t v13 = v12;
  unsigned int v14 = *(_DWORD *)(v12 + 84);
  if (v14 <= v4) {
    unsigned int v15 = v4;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v16 = *(void *)(v3 + 64);
  if (v8) {
    unint64_t v17 = v9;
  }
  else {
    unint64_t v17 = v9 + 1;
  }
  uint64_t v18 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = *(void *)(v12 + 64);
  if (v17 <= 8) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = v17;
  }
  uint64_t result = a2;
  if (a2)
  {
    unint64_t v22 = (((((((((v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
         + 63) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = *(_DWORD *)(v5 + 80) & 0xF8;
    unint64_t v24 = ~v23 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = v23 + 16;
    uint64_t v26 = *(_DWORD *)(v7 + 80) & 0xF8 | 7;
    uint64_t v27 = v42 + v26 + 1;
    uint64_t v28 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
    uint64_t v29 = v20 + v28 + 1;
    uint64_t v30 = v11 + v18 + 1;
    if (a2 <= v15) {
      goto LABEL_38;
    }
    uint64_t v31 = ((v19
          + v18
          + ((v19
            + v18
            + ((v30 + ((v29 + ((v27 + ((v25 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v28)) & ~v18)) & ~v18)) & ~v18)
        + v19;
    char v32 = 8 * v31;
    if (v31 > 3)
    {
LABEL_21:
      int v33 = *((unsigned __int8 *)a1 + v31);
      if (!*((unsigned char *)a1 + v31)) {
        goto LABEL_38;
      }
      goto LABEL_28;
    }
    unsigned int v34 = ((a2 - v15 + ~(-1 << v32)) >> v32) + 1;
    if (HIWORD(v34))
    {
      int v33 = *(_DWORD *)((char *)a1 + v31);
      if (!v33) {
        goto LABEL_38;
      }
    }
    else
    {
      if (v34 <= 0xFF)
      {
        if (v34 < 2)
        {
LABEL_38:
          if (v4 >= v14)
          {
            if (v41 < 0x7FFFFFFF)
            {
              unint64_t v40 = *(void *)((((unint64_t)a1 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
              if (v40 >= 0xFFFFFFFF) {
                LODWORD(v40) = -1;
              }
              return (v40 + 1);
            }
            else
            {
              char v39 = *(uint64_t (**)(unsigned __int16 *))(v3 + 48);
              return v39(a1);
            }
          }
          else
          {
            uint64_t v38 = *(uint64_t (**)(unint64_t))(v13 + 48);
            return v38((v30
                      + ((v29
                        + ((v27 + ((v25 + (((unint64_t)a1 + v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v28)) & ~v18);
          }
        }
        goto LABEL_21;
      }
      int v33 = *(unsigned __int16 *)((char *)a1 + v31);
      if (!*(unsigned __int16 *)((char *)a1 + v31)) {
        goto LABEL_38;
      }
    }
LABEL_28:
    int v35 = (v33 - 1) << v32;
    if (v31 > 3) {
      int v35 = 0;
    }
    if (v31)
    {
      if (v31 <= 3) {
        int v36 = v31;
      }
      else {
        int v36 = 4;
      }
      switch(v36)
      {
        case 2:
          int v37 = *a1;
          break;
        case 3:
          int v37 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v37 = *(_DWORD *)a1;
          break;
        default:
          int v37 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v37 = 0;
    }
    return v15 + (v37 | v35) + 1;
  }
  return result;
}

void sub_24655BD0C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v42 = *(_DWORD *)(v4 + 84);
  if (v42 <= 0x7FFFFFFF) {
    unsigned int v5 = 0x7FFFFFFF;
  }
  else {
    unsigned int v5 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v6 = *(void *)(sub_24659D278() - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  uint64_t v8 = 8;
  uint64_t v9 = *(void *)(sub_24659CE68() - 8);
  int v10 = *(_DWORD *)(v9 + 84);
  unint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(sub_24659D5D8() - 8);
  if (*(void *)(v12 + 64) > 8uLL) {
    uint64_t v8 = *(void *)(v12 + 64);
  }
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0) - 8);
  uint64_t v14 = v13;
  unsigned int v15 = *(_DWORD *)(v13 + 84);
  if (v15 <= v5) {
    unsigned int v16 = v5;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v17 = *(void *)(v4 + 64);
  unint64_t v18 = (((((((((v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(v13 + 64);
  uint64_t v21 = *(_DWORD *)(v6 + 80) & 0xF8;
  unint64_t v22 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = v21 + 16;
  uint64_t v24 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  uint64_t v25 = v7 + v24 + 1;
  if (v10) {
    unint64_t v26 = v11;
  }
  else {
    unint64_t v26 = v11 + 1;
  }
  if (v26 <= 8) {
    unint64_t v26 = 8;
  }
  uint64_t v27 = *(_DWORD *)(v12 + 80) & 0xF8 | 7;
  uint64_t v28 = v26 + v27 + 1;
  uint64_t v29 = v8 + v19 + 1;
  size_t v30 = ((v20
        + v19
        + ((v20
          + v19
          + ((v29 + ((v28 + ((v25 + ((v23 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~v27)) & ~v19)) & ~v19)) & ~v19)
      + v20;
  if (a3 <= v16)
  {
    int v32 = 0;
    uint64_t v31 = a1;
  }
  else
  {
    uint64_t v31 = a1;
    if (v30 <= 3)
    {
      unsigned int v36 = ((a3 - v16 + ~(-1 << (8 * v30))) >> (8 * v30)) + 1;
      if (HIWORD(v36))
      {
        int v32 = 4;
      }
      else if (v36 >= 0x100)
      {
        int v32 = 2;
      }
      else
      {
        int v32 = v36 > 1;
      }
    }
    else
    {
      int v32 = 1;
    }
  }
  if (v16 < a2)
  {
    unsigned int v33 = ~v16 + a2;
    if (v30 < 4)
    {
      int v34 = (v33 >> (8 * v30)) + 1;
      if (v30)
      {
        int v37 = v33 & ~(-1 << (8 * v30));
        bzero(v31, v30);
        if (v30 == 3)
        {
          *(_WORD *)uint64_t v31 = v37;
          v31[2] = BYTE2(v37);
        }
        else if (v30 == 2)
        {
          *(_WORD *)uint64_t v31 = v37;
        }
        else
        {
          *uint64_t v31 = v37;
        }
      }
    }
    else
    {
      bzero(v31, v30);
      *(_DWORD *)uint64_t v31 = v33;
      int v34 = 1;
    }
    switch(v32)
    {
      case 1:
        v31[v30] = v34;
        return;
      case 2:
        *(_WORD *)&v31[v30] = v34;
        return;
      case 3:
        goto LABEL_61;
      case 4:
        *(_DWORD *)&v31[v30] = v34;
        return;
      default:
        return;
    }
  }
  size_t v35 = v18 + 16;
  switch(v32)
  {
    case 1:
      v31[v30] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&v31[v30] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_61:
      __break(1u);
      JUMPOUT(0x24655C26CLL);
    case 4:
      *(_DWORD *)&v31[v30] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (a2)
      {
LABEL_37:
        if (v5 >= v15)
        {
          if (v5 >= a2)
          {
            if (v42 < 0x7FFFFFFF)
            {
              unsigned int v41 = (void *)((unint64_t)&v31[v17 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                v41[2] = 0;
                v41[3] = 0;
                *unsigned int v41 = a2 ^ 0x80000000;
                v41[1] = 0;
              }
              else
              {
                v41[3] = a2 - 1;
              }
            }
            else
            {
              unint64_t v40 = *(void (**)(unsigned char *, void))(v4 + 56);
              v40(v31, a2);
            }
          }
          else if (v18 != -16)
          {
            bzero(v31, v35);
            *(_DWORD *)uint64_t v31 = ~v5 + a2;
          }
        }
        else
        {
          unint64_t v38 = (v29
               + ((v28 + ((v25 + ((v23 + ((unint64_t)&v31[v35 + 7] & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~v27)) & ~v19;
          char v39 = *(void (**)(unint64_t, void))(v14 + 56);
          v39(v38, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for DefaultManagedAppCell()
{
  return __swift_instantiateGenericMetadata();
}

void sub_24655C2AC()
{
  if (!qword_268F8BD40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD48);
    unint64_t v0 = sub_24659D288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8BD40);
    }
  }
}

void sub_24655C308(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24659D288();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_24655C35C()
{
  if (!qword_268F8BD58)
  {
    sub_24655C3B8();
    unint64_t v0 = sub_24659D2D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8BD58);
    }
  }
}

unint64_t sub_24655C3B8()
{
  unint64_t result = qword_268F8BD60;
  if (!qword_268F8BD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BD60);
  }
  return result;
}

uint64_t sub_24655C40C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24655C450(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 36);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_246552D38(*(void *)v2, v4);
  char v5 = sub_2465678D8(v3, v4);
  sub_246552EF4(v3, v4);
  return v5 & 1;
}

uint64_t sub_24655C4B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  uint64_t v3 = sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD78);
  swift_getTupleTypeMetadata3();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB28();
  uint64_t v4 = sub_24659D3E8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v56 = MEMORY[0x263F19100];
  uint64_t v44 = v4;
  uint64_t v51 = v4;
  uint64_t v52 = swift_getWitnessTable();
  uint64_t v48 = v52;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v40 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v39 = (uint64_t)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v38 = (char *)&v37 - v8;
  uint64_t v51 = v3;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD80);
  uint64_t v53 = type metadata accessor for OfferView();
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD88);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB98();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD90);
  sub_24659D3E8();
  swift_getTupleTypeMetadata2();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v9 = sub_24659DB28();
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v47 = v9;
  uint64_t v51 = v9;
  uint64_t v52 = v46;
  uint64_t v10 = swift_getOpaqueTypeMetadata2();
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unsigned int v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_24659D5D8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = OpaqueTypeMetadata2;
  uint64_t v20 = sub_24659D628();
  uint64_t v41 = *(void *)(v20 - 8);
  uint64_t v42 = v20;
  MEMORY[0x270FA5388](v20);
  unint64_t v22 = (char *)&v37 - v21;
  sub_246567B18((uint64_t)v19);
  char v23 = sub_24659D5C8();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if (v23)
  {
    sub_24655CCA0(a1, (uint64_t)v13);
    uint64_t v51 = v47;
    uint64_t v52 = v46;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_246598AFC(v13, v10, OpaqueTypeConformance2);
    uint64_t v25 = *(void (**)(char *, uint64_t))(v37 + 8);
    v25(v13, v10);
    sub_246598AFC(v15, v10, OpaqueTypeConformance2);
    uint64_t v26 = v44;
    uint64_t v51 = v44;
    uint64_t v52 = v48;
    swift_getOpaqueTypeConformance2();
    sub_246598B38((uint64_t)v13, v10);
    v25(v13, v10);
    v25(v15, v10);
  }
  else
  {
    uint64_t v27 = v39;
    sub_24655D01C(a1, v39);
    uint64_t v26 = v44;
    uint64_t v51 = v44;
    uint64_t v52 = v48;
    uint64_t v28 = swift_getOpaqueTypeConformance2();
    uint64_t v29 = v38;
    uint64_t v30 = v43;
    sub_246598AFC(v27, v43, v28);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v31(v27, v30);
    sub_246598AFC(v29, v30, v28);
    uint64_t v51 = v47;
    uint64_t v52 = v46;
    swift_getOpaqueTypeConformance2();
    sub_246598C30(v27, v10, v30);
    v31(v27, v30);
    v31((uint64_t)v29, v30);
  }
  uint64_t v51 = v47;
  uint64_t v52 = v46;
  uint64_t v32 = swift_getOpaqueTypeConformance2();
  uint64_t v51 = v26;
  uint64_t v52 = v48;
  uint64_t v33 = swift_getOpaqueTypeConformance2();
  uint64_t v49 = v32;
  uint64_t v50 = v33;
  uint64_t v34 = v42;
  uint64_t v35 = swift_getWitnessTable();
  sub_246598AFC(v22, v34, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v22, v34);
}

uint64_t sub_24655CCA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v15 = sub_24659D6C8();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  uint64_t v19 = sub_24659D3E8();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD80);
  uint64_t v21 = type metadata accessor for OfferView();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD88);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB98();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD90);
  sub_24659D3E8();
  swift_getTupleTypeMetadata2();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v8 = sub_24659DB28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - v10;
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v16 = v7;
  uint64_t v17 = v12;
  uint64_t v18 = v2;
  sub_24659D568();
  sub_24659DB18();
  sub_24659D6B8();
  swift_getWitnessTable();
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_24655D01C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v32 = sub_24659D6C8();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v29 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_24659D5D8();
  uint64_t v4 = *(void *)(v28 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v28);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v27 = (uint64_t)&v23 - v8;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD78);
  swift_getTupleTypeMetadata3();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v10 = sub_24659DB28();
  uint64_t v24 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = sub_24659D3E8();
  uint64_t v25 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v23 - v14;
  sub_24659D568();
  uint64_t v16 = *(void *)(a1 + 24);
  uint64_t v33 = v9;
  uint64_t v34 = v16;
  uint64_t v35 = v26;
  sub_24659DB18();
  uint64_t v17 = v27;
  sub_246567B18(v27);
  uint64_t v18 = v28;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F199E8], v28);
  sub_246561628(v17, (uint64_t)v7);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19(v7, v18);
  v19((char *)v17, v18);
  sub_24659DBD8();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24659D9B8();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
  uint64_t v20 = v29;
  sub_24659D6B8();
  uint64_t v36 = WitnessTable;
  uint64_t v37 = MEMORY[0x263F19100];
  swift_getWitnessTable();
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v15, v13);
}

uint64_t sub_24655D588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v33 = a1;
  uint64_t v32 = v2;
  uint64_t v4 = sub_24659D3E8();
  uint64_t v36 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v31 - v5;
  sub_24659D758();
  uint64_t v7 = sub_24659D3E8();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_24659D3E8();
  uint64_t v41 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v34 = (char *)&v31 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v35 = sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v38 = sub_24659D3E8();
  uint64_t v12 = sub_24659D628();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v39 = v12;
  uint64_t v40 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v31 - v14;
  sub_24659DBD8();
  uint64_t v16 = *(void *)(a1 + 24);
  sub_24659D9A8();
  uint64_t v57 = v16;
  uint64_t v58 = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24659D968();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v4);
  uint64_t v18 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v55 = WitnessTable;
  uint64_t v56 = v18;
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v20 = v34;
  sub_24659D998();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
  uint64_t v21 = v31;
  LOBYTE(WitnessTable) = sub_24655C450(v33);
  uint64_t v44 = v32;
  uint64_t v45 = v16;
  uint64_t v46 = v21;
  unint64_t v22 = sub_246560E3C();
  uint64_t v53 = v19;
  unint64_t v54 = v22;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v51 = v23;
  uint64_t v52 = v24;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v49 = v25;
  uint64_t v50 = v26;
  uint64_t v27 = v38;
  uint64_t v28 = swift_getWitnessTable();
  sub_246591CA0(WitnessTable & 1, (void (*)(uint64_t))sub_246561500, (uint64_t)v43, v10, v27, v23, v28, (uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v10);
  sub_24659D7B8();
  uint64_t v47 = v28;
  uint64_t v48 = v23;
  uint64_t v29 = v39;
  swift_getWitnessTable();
  sub_24659D9D8();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v15, v29);
}

uint64_t sub_24655DB08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v62 = a3;
  uint64_t v68 = a2;
  uint64_t v65 = a1;
  uint64_t v78 = a5;
  uint64_t v70 = sub_24659D278();
  uint64_t v67 = *(void *)(v70 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v70);
  char v66 = &v59.i8[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v64 = (uint64_t)v59.i64 - v8;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE78);
  MEMORY[0x270FA5388](v77);
  uint64_t v72 = (uint64_t)v59.i64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24659D3F8();
  uint64_t v60 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v63 = &v59.i8[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (int64x2_t *)((char *)&v59 - v13);
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v71 = sub_24659D3E8();
  uint64_t v75 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v79 = &v59.i8[-v15];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v74 = sub_24659D3E8();
  uint64_t v76 = *(void *)(v74 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v74);
  int v69 = &v59.i8[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  unint64_t v73 = &v59.i8[-v18];
  uint64_t v19 = &v14->i8[*(int *)(v10 + 20)];
  uint64_t v20 = *MEMORY[0x263F19860];
  uint64_t v21 = sub_24659D598();
  unint64_t v22 = *(void (**)(__int8 *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104);
  v22(v19, v20, v21);
  int64x2_t v59 = vdupq_n_s64(0x4033400000000000uLL);
  *uint64_t v14 = v59;
  uint64_t v88 = a4;
  uint64_t v89 = MEMORY[0x263F18860];
  uint64_t v61 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v86 = WitnessTable;
  uint64_t v87 = v24;
  uint64_t v25 = swift_getWitnessTable();
  unint64_t v26 = sub_246560E3C();
  uint64_t v84 = v25;
  unint64_t v85 = v26;
  uint64_t v27 = swift_getWitnessTable();
  sub_24656150C(&qword_268F8BE80, MEMORY[0x263F19048]);
  uint64_t v28 = v60;
  sub_24659D9E8();
  uint64_t v29 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_246561554((uint64_t)v14, MEMORY[0x263F19048]);
  uint64_t v30 = (int64x2_t *)v63;
  v22(&v63[*(int *)(v28 + 20)], v20, v21);
  *uint64_t v30 = v59;
  type metadata accessor for DefaultManagedAppCell();
  uint64_t v31 = v64;
  sub_246567ADC(v64);
  uint64_t v32 = v67;
  uint64_t v33 = v66;
  uint64_t v34 = v70;
  (*(void (**)(__int8 *, void, uint64_t))(v67 + 104))(v66, *MEMORY[0x263F18508], v70);
  uint64_t v35 = v33;
  LOBYTE(v33) = sub_24659D268();
  uint64_t v36 = *(void (**)(__int8 *, uint64_t))(v32 + 8);
  v36(v35, v34);
  v36((__int8 *)v31, v34);
  uint64_t v37 = self;
  uint64_t v38 = &selRef_systemGray6Color;
  if ((v33 & 1) == 0) {
    uint64_t v38 = &selRef_secondarySystemFillColor;
  }
  uint64_t v39 = MEMORY[0x24C52F0B0]([v37 *v38]);
  sub_24659D298();
  uint64_t v40 = v72;
  sub_2465615B4((uint64_t)v30, v72, v29);
  uint64_t v41 = v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE88) + 36);
  long long v42 = v91;
  *(_OWORD *)uint64_t v41 = v90;
  *(_OWORD *)(v41 + 16) = v42;
  *(void *)(v41 + 32) = v92;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE90);
  *(void *)(v40 + *(int *)(v43 + 52)) = v39;
  *(_WORD *)(v40 + *(int *)(v43 + 56)) = 256;
  uint64_t v44 = sub_24659DBD8();
  uint64_t v46 = v45;
  uint64_t v47 = (uint64_t *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE98) + 36));
  *uint64_t v47 = v44;
  v47[1] = v46;
  sub_246561554((uint64_t)v30, v29);
  sub_24659DBD8();
  uint64_t v48 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v82 = v27;
  uint64_t v83 = v48;
  uint64_t v49 = v71;
  uint64_t v50 = swift_getWitnessTable();
  sub_246561BA4(&qword_268F8BEA0, &qword_268F8BE78);
  uint64_t v51 = v69;
  uint64_t v52 = v79;
  sub_24659D9C8();
  sub_246555440(v40, &qword_268F8BE78);
  (*(void (**)(__int8 *, uint64_t))(v75 + 8))(v52, v49);
  uint64_t v53 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v80 = v50;
  uint64_t v81 = v53;
  uint64_t v54 = v74;
  uint64_t v55 = swift_getWitnessTable();
  uint64_t v56 = v73;
  sub_246598AFC(v51, v54, v55);
  uint64_t v57 = *(void (**)(__int8 *, uint64_t))(v76 + 8);
  v57(v51, v54);
  sub_246598AFC(v56, v54, v55);
  return ((uint64_t (*)(__int8 *, uint64_t))v57)(v56, v54);
}

uint64_t sub_24655E37C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24659D838();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ManagedAppCellContext();
  sub_24659D7D8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1A680], v2);
  sub_24659D848();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v6 = sub_24659D8B8();
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v12 = v11;
  uint64_t result = swift_release();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v10 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_24655E500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 40));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  sub_246561068(*v3, v5, v6, v7);
  uint64_t v8 = sub_24659D868();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = sub_24659D658();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = v8;
  *(_DWORD *)(a1 + 48) = result;
  return result;
}

__n128 sub_24655E594@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE50);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24659D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 44));
  uint64_t v11 = v10[1];
  uint64_t v12 = v10[2];
  uint64_t v13 = v10[3];
  uint64_t v38 = *v10;
  uint64_t v37 = v11;
  uint64_t v35 = v12;
  uint64_t v36 = v13;
  sub_246561068(v38, v11, v12, v13);
  sub_246567B18((uint64_t)v9);
  char v14 = sub_24659D5C8();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v33 = v6;
  v15(v9, v6);
  if (v14)
  {
    uint64_t v34 = sub_24659D858();
  }
  else
  {
    uint64_t v16 = sub_24659D7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 1, 1, v16);
    uint64_t v34 = sub_24659D818();
    sub_246555440((uint64_t)v5, &qword_268F8BE50);
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v32 = KeyPath;
  uint64_t v18 = sub_24659DA78();
  uint64_t v19 = swift_getKeyPath();
  sub_246567B18((uint64_t)v9);
  char v20 = sub_24659D5C8();
  v15(v9, v33);
  LODWORD(v33) = v20 & 1;
  if (v20) {
    double v21 = 0.0;
  }
  else {
    double v21 = 62.0;
  }
  uint64_t v22 = v38;
  uint64_t v23 = v37;
  uint64_t v40 = v38;
  uint64_t v41 = v37;
  char v24 = v35;
  uint64_t v25 = v36;
  uint64_t v42 = v35;
  uint64_t v43 = v36;
  uint64_t v44 = KeyPath;
  uint64_t v45 = v34;
  uint64_t v46 = v19;
  uint64_t v47 = v18;
  sub_24659DBD8();
  sub_24659200C(0.0, 1, 0.0, 1, v21, v33, 0.0, 1, v39, 0.0, 1, 0.0, 1);
  sub_246560F80(v22, v23, v24, v25);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v26 = swift_getKeyPath();
  long long v27 = v39[9];
  *(_OWORD *)(a1 + 128) = v39[8];
  *(_OWORD *)(a1 + 144) = v27;
  *(_OWORD *)(a1 + 160) = v39[10];
  long long v28 = v39[5];
  *(_OWORD *)(a1 + 64) = v39[4];
  *(_OWORD *)(a1 + 80) = v28;
  long long v29 = v39[7];
  *(_OWORD *)(a1 + 96) = v39[6];
  *(_OWORD *)(a1 + 112) = v29;
  long long v30 = v39[1];
  *(_OWORD *)a1 = v39[0];
  *(_OWORD *)(a1 + 16) = v30;
  __n128 result = (__n128)v39[3];
  *(_OWORD *)(a1 + 32) = v39[2];
  *(__n128 *)(a1 + 48) = result;
  *(void *)(a1 + 176) = v26;
  *(void *)(a1 + 184) = 2;
  *(unsigned char *)(a1 + 192) = 0;
  return result;
}

uint64_t sub_24655E94C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 48));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  sub_246561068(*v3, v5, v6, v7);
  uint64_t v8 = sub_24659D868();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = sub_24659D658();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = v8;
  *(_DWORD *)(a1 + 48) = result;
  return result;
}

uint64_t sub_24655E9E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ManagedAppCellContext();
  uint64_t v4 = *(int *)(v3 + 56);
  uint64_t v5 = v1 + *(int *)(v3 + 52);
  uint64_t v6 = *(void *)(v5 + 8);
  char v7 = *(unsigned char *)(v5 + 16);
  v12[0] = *(void *)v5;
  v12[1] = v6;
  char v13 = v7;
  uint64_t v8 = v1 + v4;
  uint64_t v9 = *(void *)(v1 + v4);
  uint64_t v10 = *(void *)(v8 + 8);
  sub_246558E9C(v12[0], v6, v7);
  swift_retain();
  return OfferView.init(offerState:action:)((uint64_t)v12, v9, v10, a1);
}

uint64_t sub_24655EA5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v43 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BEA8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD78);
  uint64_t v9 = MEMORY[0x270FA5388](v42);
  uint64_t v40 = (uint64_t)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v41 = (uint64_t)v36 - v11;
  uint64_t v39 = a2;
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  v36[1] = sub_24659D3E8();
  uint64_t v37 = sub_24659D628();
  uint64_t v12 = sub_24659D3E8();
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v36[0] = (char *)v36 - v16;
  uint64_t v17 = type metadata accessor for DefaultManagedAppCell();
  sub_24655D588(v17, (uint64_t)v15);
  v51[15] = a3;
  v51[16] = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v19 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  v51[13] = WitnessTable;
  v51[14] = v19;
  uint64_t v20 = swift_getWitnessTable();
  unint64_t v21 = sub_246560E3C();
  v51[11] = v20;
  v51[12] = v21;
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v23 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  v51[9] = v22;
  v51[10] = v23;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  v51[7] = v24;
  v51[8] = v25;
  v51[5] = swift_getWitnessTable();
  v51[6] = v22;
  v51[3] = swift_getWitnessTable();
  v51[4] = MEMORY[0x263F18C10];
  uint64_t v37 = swift_getWitnessTable();
  sub_246598AFC(v15, v12, v37);
  uint64_t v26 = v38;
  long long v27 = *(void (**)(char *, uint64_t))(v38 + 8);
  v27(v15, v12);
  *(void *)uint64_t v8 = sub_24659D5F8();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BEB0);
  sub_24655F044(v44, (uint64_t)&v8[*(int *)(v28 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = v40;
  sub_246561BE8((uint64_t)v8, v40, &qword_268F8BEA8);
  uint64_t v31 = v42;
  uint64_t v32 = v30 + *(int *)(v42 + 36);
  *(void *)uint64_t v32 = KeyPath;
  *(void *)(v32 + 8) = 2;
  *(unsigned char *)(v32 + 16) = 0;
  sub_246555440((uint64_t)v8, &qword_268F8BEA8);
  uint64_t v33 = v41;
  sub_246561C4C(v30, v41, &qword_268F8BD78);
  uint64_t v34 = (char *)v36[0];
  (*(void (**)(char *, void, uint64_t))(v26 + 16))(v15, v36[0], v12);
  v51[0] = v15;
  sub_246561BE8(v33, v30, &qword_268F8BD78);
  uint64_t v49 = 0;
  char v50 = 1;
  v51[1] = v30;
  v51[2] = &v49;
  v48[0] = v12;
  v48[1] = v31;
  v48[2] = MEMORY[0x263F1B6B0];
  uint64_t v45 = v37;
  unint64_t v46 = sub_246561A40();
  uint64_t v47 = MEMORY[0x263F1B698];
  sub_24658A30C((uint64_t)v51, 3uLL, (uint64_t)v48);
  sub_246555440(v33, &qword_268F8BD78);
  v27(v34, v12);
  sub_246555440(v30, &qword_268F8BD78);
  return ((uint64_t (*)(char *, uint64_t))v27)(v15, v12);
}

uint64_t sub_24655F044@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a1;
  uint64_t v64 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BEC8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BED0);
  MEMORY[0x270FA5388](v61);
  uint64_t v59 = (uint64_t)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BED8);
  uint64_t v67 = *(void *)(v63 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v63);
  uint64_t v60 = (char *)v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v62 = (char *)v55 - v8;
  uint64_t v9 = sub_24659D6C8();
  uint64_t v56 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD80);
  uint64_t v66 = *(void *)(v58 - 8);
  uint64_t v13 = v66;
  uint64_t v14 = MEMORY[0x270FA5388](v58);
  uint64_t v16 = (char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v65 = (char *)v55 - v17;
  uint64_t v18 = sub_24659D5F8();
  sub_24656079C((uint64_t)&v68);
  uint64_t v19 = *(void *)&v69[64];
  char v20 = v70;
  long long v21 = v68;
  long long v22 = *(_OWORD *)v69;
  long long v23 = *(_OWORD *)&v69[16];
  long long v24 = *(_OWORD *)&v69[32];
  long long v25 = *(_OWORD *)&v69[48];
  long long v68 = (unint64_t)v18;
  v69[0] = 0;
  *(_OWORD *)&v69[8] = v21;
  *(_OWORD *)&v69[24] = v22;
  *(_OWORD *)&v69[40] = v23;
  *(_OWORD *)&v69[56] = v24;
  long long v70 = v25;
  uint64_t v71 = v19;
  char v72 = v20;
  sub_24659D6A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BDC0);
  sub_246561BA4(&qword_268F8BDC8, &qword_268F8BDC0);
  v55[0] = v16;
  sub_24659D978();
  uint64_t v26 = v10 + 8;
  long long v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  v55[1] = v26;
  v27(v12, v9);
  sub_246560E90(*(uint64_t *)&v69[8], *(uint64_t *)&v69[16], v69[24], *(uint64_t *)&v69[32], *(uint64_t *)&v69[40], *(uint64_t *)&v69[48], v69[56], *(uint64_t *)&v69[64], v70, SBYTE8(v70), v71, v72);
  uint64_t v28 = v65;
  uint64_t v29 = v58;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v65, v16, v58);
  *(void *)uint64_t v4 = sub_24659D568();
  *((void *)v4 + 1) = 0x4020000000000000;
  v4[16] = 0;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BEE0);
  sub_24655F6A0((uint64_t)&v4[*(int *)(v30 + 44)]);
  LOBYTE(v18) = sub_24659D798();
  sub_24659D258();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v39 = v59;
  sub_246561BE8((uint64_t)v4, v59, &qword_268F8BEC8);
  uint64_t v40 = v39 + *(int *)(v61 + 36);
  *(unsigned char *)uint64_t v40 = v18;
  *(void *)(v40 + 8) = v32;
  *(void *)(v40 + 16) = v34;
  *(void *)(v40 + 24) = v36;
  *(void *)(v40 + 32) = v38;
  *(unsigned char *)(v40 + 40) = 0;
  sub_246555440((uint64_t)v4, &qword_268F8BEC8);
  sub_24659D6A8();
  sub_246561B04();
  uint64_t v41 = v60;
  sub_24659D978();
  v27(v12, v56);
  sub_246555440(v39, &qword_268F8BED0);
  uint64_t v42 = v67;
  uint64_t v43 = v62;
  uint64_t v44 = v63;
  (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v62, v41, v63);
  uint64_t v45 = *(void (**)(uint64_t, char *, uint64_t))(v66 + 16);
  unint64_t v46 = (char *)v55[0];
  uint64_t v47 = v28;
  uint64_t v48 = v29;
  v45(v55[0], v47, v29);
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v49(v41, v43, v44);
  uint64_t v50 = v64;
  v45(v64, v46, v48);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BEF8);
  v49((char *)(v50 + *(int *)(v51 + 48)), v41, v44);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v67 + 8);
  v52(v43, v44);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v66 + 8);
  v53(v65, v48);
  v52(v41, v44);
  return ((uint64_t (*)(char *, uint64_t))v53)(v46, v48);
}

uint64_t sub_24655F6A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v1 = type metadata accessor for OfferView();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF00);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  type metadata accessor for DefaultManagedAppCell();
  sub_24655E9E0((uint64_t)v3);
  sub_2465615B4((uint64_t)v3, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for OfferView);
  *(void *)&v8[*(int *)(v5 + 44)] = 0x3FF0000000000000;
  sub_246561554((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for OfferView);
  sub_246561C4C((uint64_t)v8, (uint64_t)v10, &qword_268F8BF00);
  uint64_t v11 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AF8(v11))
  {
    sub_24655E594((uint64_t)v18);
    v20[10] = v18[10];
    v20[11] = v18[11];
    char v21 = v19;
    v20[6] = v18[6];
    v20[7] = v18[7];
    v20[8] = v18[8];
    v20[9] = v18[9];
    v20[2] = v18[2];
    v20[3] = v18[3];
    v20[4] = v18[4];
    v20[5] = v18[5];
    v20[0] = v18[0];
    v20[1] = v18[1];
    nullsub_1(v20);
  }
  else
  {
    sub_246560FC4((uint64_t)v20);
  }
  sub_246561C4C((uint64_t)v20, (uint64_t)v22, &qword_268F8BD88);
  sub_246561BE8((uint64_t)v10, (uint64_t)v8, &qword_268F8BF00);
  sub_246561C4C((uint64_t)v22, (uint64_t)v17, &qword_268F8BD88);
  uint64_t v12 = v16;
  sub_246561BE8((uint64_t)v8, v16, &qword_268F8BF00);
  uint64_t v13 = v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF08) + 48);
  sub_246561C4C((uint64_t)v17, (uint64_t)v18, &qword_268F8BD88);
  sub_246561C4C((uint64_t)v18, v13, &qword_268F8BD88);
  sub_2465613E8((uint64_t)v18, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246560FE8);
  sub_246555440((uint64_t)v10, &qword_268F8BF00);
  sub_246561C4C((uint64_t)v17, (uint64_t)v20, &qword_268F8BD88);
  sub_2465613E8((uint64_t)v20, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246561464);
  return sub_246555440((uint64_t)v8, &qword_268F8BF00);
}

uint64_t sub_24655F974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  uint64_t v36 = sub_24659D3E8();
  uint64_t v37 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD80);
  uint64_t v38 = type metadata accessor for OfferView();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD88);
  swift_getTupleTypeMetadata();
  v22[2] = sub_24659DC28();
  v22[1] = swift_getWitnessTable();
  uint64_t v6 = sub_24659DB98();
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v22 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD90);
  uint64_t v9 = sub_24659D3E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v22[0] = (char *)v22 - v14;
  sub_24659D5F8();
  uint64_t v15 = v24;
  type metadata accessor for DefaultManagedAppCell();
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  uint64_t v26 = a2;
  uint64_t v27 = v15;
  uint64_t v28 = a1;
  sub_24659DB88();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24659D9F8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  uint64_t v17 = sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
  uint64_t v34 = WitnessTable;
  uint64_t v35 = v17;
  uint64_t v18 = swift_getWitnessTable();
  char v19 = (char *)v22[0];
  sub_246598AFC(v13, v9, v18);
  char v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v13, v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v19, v9);
  uint64_t v32 = 0;
  char v33 = 0;
  uint64_t v36 = (uint64_t)v13;
  uint64_t v37 = &v32;
  v31[0] = v9;
  v31[1] = MEMORY[0x263F1B6B0];
  uint64_t v29 = v18;
  uint64_t v30 = MEMORY[0x263F1B698];
  sub_24658A30C((uint64_t)&v36, 2uLL, (uint64_t)v31);
  v20(v19, v9);
  return ((uint64_t (*)(char *, uint64_t))v20)(v13, v9);
}

uint64_t sub_24655FDF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v78 = a1;
  uint64_t v75 = a4;
  uint64_t v74 = type metadata accessor for OfferView();
  uint64_t v6 = MEMORY[0x270FA5388](v74);
  uint64_t v76 = (uint64_t)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v80 = (uint64_t)&v58 - v8;
  uint64_t v9 = sub_24659D6C8();
  uint64_t v69 = *(void *)(v9 - 8);
  uint64_t v70 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v65 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD80);
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v72 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v82 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v64 = (char *)&v58 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v66 = (char *)&v58 - v16;
  uint64_t v60 = a2;
  sub_24659D3E8();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v73 = sub_24659D3E8();
  uint64_t v81 = sub_24659D628();
  uint64_t v17 = sub_24659D3E8();
  uint64_t v79 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  char v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  long long v22 = (char *)&v58 - v21;
  uint64_t v59 = type metadata accessor for DefaultManagedAppCell();
  sub_24655D588(v59, (uint64_t)v20);
  uint64_t v105 = a3;
  uint64_t v106 = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v103 = WitnessTable;
  uint64_t v104 = v24;
  uint64_t v25 = swift_getWitnessTable();
  unint64_t v26 = sub_246560E3C();
  uint64_t v101 = v25;
  unint64_t v102 = v26;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v99 = v27;
  uint64_t v100 = v28;
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v30 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v97 = v29;
  uint64_t v98 = v30;
  uint64_t v95 = swift_getWitnessTable();
  uint64_t v96 = v27;
  uint64_t v93 = swift_getWitnessTable();
  uint64_t v94 = MEMORY[0x263F18C10];
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v81 = (uint64_t)v22;
  uint64_t v63 = v31;
  sub_246598AFC(v20, v17, v31);
  uint64_t v32 = *(uint64_t (**)(char *, uint64_t))(v79 + 8);
  uint64_t v77 = v20;
  uint64_t v73 = v17;
  uint64_t v67 = v32;
  uint64_t v68 = v79 + 8;
  v32(v20, v17);
  uint64_t v33 = sub_24659D5F8();
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  uint64_t v34 = v107;
  sub_24656079C((uint64_t)&v107);
  uint64_t v35 = *(void *)&v108[64];
  char v36 = v109;
  long long v37 = v107;
  long long v38 = *(_OWORD *)v108;
  long long v39 = *(_OWORD *)&v108[16];
  long long v40 = *(_OWORD *)&v108[32];
  long long v41 = *(_OWORD *)&v108[48];
  *(void *)&long long v107 = v33;
  *((void *)&v107 + 1) = v34;
  v108[0] = 0;
  *(_OWORD *)&v108[8] = v37;
  *(_OWORD *)&v108[24] = v38;
  *(_OWORD *)&v108[40] = v39;
  *(_OWORD *)&v108[56] = v40;
  long long v109 = v41;
  uint64_t v110 = v35;
  char v111 = v36;
  uint64_t v42 = v65;
  sub_24659D6A8();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BDC0);
  uint64_t v61 = sub_246561BA4(&qword_268F8BDC8, &qword_268F8BDC0);
  uint64_t v62 = v43;
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v42, v70);
  sub_246560E90(*(uint64_t *)&v108[8], *(uint64_t *)&v108[16], v108[24], *(uint64_t *)&v108[32], *(uint64_t *)&v108[40], *(uint64_t *)&v108[48], v108[56], *(uint64_t *)&v108[64], v109, SBYTE8(v109), v110, v111);
  uint64_t v44 = v71;
  uint64_t v45 = v66;
  uint64_t v46 = v72;
  (*(void (**)(void))(v71 + 32))();
  sub_24655E9E0(v80);
  uint64_t v47 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AF8(v47))
  {
    sub_24655E594((uint64_t)v88);
    v91[10] = v88[10];
    v91[11] = v88[11];
    char v92 = v89;
    v91[6] = v88[6];
    v91[7] = v88[7];
    v91[8] = v88[8];
    v91[9] = v88[9];
    v91[2] = v88[2];
    v91[3] = v88[3];
    v91[4] = v88[4];
    v91[5] = v88[5];
    v91[0] = v88[0];
    v91[1] = v88[1];
    nullsub_1(v91);
  }
  else
  {
    sub_246560FC4((uint64_t)v91);
  }
  sub_246561C4C((uint64_t)v91, (uint64_t)&v107, &qword_268F8BD88);
  uint64_t v48 = v77;
  uint64_t v49 = v73;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v77, v81, v73);
  v90[0] = v48;
  uint64_t v50 = v82;
  uint64_t v51 = v45;
  uint64_t v52 = v46;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v82, v45, v46);
  v90[1] = v50;
  uint64_t v53 = v80;
  uint64_t v54 = v76;
  sub_2465615B4(v80, v76, (uint64_t (*)(void))type metadata accessor for OfferView);
  v90[2] = v54;
  sub_246561C4C((uint64_t)&v107, (uint64_t)v88, &qword_268F8BD88);
  v90[3] = v88;
  sub_2465613E8((uint64_t)&v107, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246560FE8);
  v87[0] = v49;
  v87[1] = v52;
  v87[2] = v74;
  v87[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD88);
  uint64_t v83 = v63;
  *(void *)&v91[0] = v62;
  *((void *)&v91[0] + 1) = v61;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v85 = sub_24656150C(&qword_268F8BDD0, (void (*)(uint64_t))type metadata accessor for OfferView);
  unint64_t v86 = sub_2465610AC();
  sub_24658A30C((uint64_t)v90, 4uLL, (uint64_t)v87);
  sub_2465613E8((uint64_t)&v107, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246561464);
  sub_246561554(v53, (uint64_t (*)(void))type metadata accessor for OfferView);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v44 + 8);
  v55(v51, v52);
  uint64_t v56 = v67;
  v67((char *)v81, v49);
  sub_246561C4C((uint64_t)v88, (uint64_t)v91, &qword_268F8BD88);
  sub_2465613E8((uint64_t)v91, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246561464);
  sub_246561554(v54, (uint64_t (*)(void))type metadata accessor for OfferView);
  v55(v82, v52);
  return v56(v77, v49);
}

double sub_24656079C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1 = type metadata accessor for ManagedAppCellContext();
  BOOL v2 = sub_246591AE0(v1);
  type metadata accessor for DefaultManagedAppCell();
  if (v2)
  {
    sub_24655E94C((uint64_t)&v19);
    long long v3 = v19;
    long long v4 = v20;
    sub_24655E37C((uint64_t)&v19);
    long long v5 = v19;
    char v6 = v20;
    sub_246561068(v3, *((uint64_t *)&v3 + 1), v4, *((uint64_t *)&v4 + 1));
    swift_retain();
    swift_retain();
    sub_246558E8C(v5, *((uint64_t *)&v5 + 1), v6);
    swift_bridgeObjectRetain();
    sub_246561068(v3, *((uint64_t *)&v3 + 1), v4, *((uint64_t *)&v4 + 1));
    swift_retain();
    swift_retain();
    sub_246558E8C(v5, *((uint64_t *)&v5 + 1), v6);
    swift_bridgeObjectRetain();
    sub_24655947C(v5, *((uint64_t *)&v5 + 1), v6);
    swift_bridgeObjectRelease();
    sub_246560F80(v3, *((uint64_t *)&v3 + 1), v4, *((uint64_t *)&v4 + 1));
    swift_release();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE60);
    sub_246561BA4(&qword_268F8BE68, &qword_268F8BE58);
    sub_246561BA4(&qword_268F8BE70, &qword_268F8BE60);
    sub_24659D618();
    sub_24655947C(v5, *((uint64_t *)&v5 + 1), v6);
    swift_bridgeObjectRelease();
    sub_246560F80(v3, *((uint64_t *)&v3 + 1), v4, *((uint64_t *)&v4 + 1));
    swift_release();
    swift_release();
  }
  else
  {
    sub_24655E37C((uint64_t)&v19);
    long long v7 = v19;
    char v8 = v20;
    sub_24655E500((uint64_t)&v19);
    long long v9 = v19;
    long long v10 = v20;
    sub_246558E8C(v7, *((uint64_t *)&v7 + 1), v8);
    swift_bridgeObjectRetain();
    sub_246561068(v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
    swift_retain();
    swift_retain();
    sub_246558E8C(v7, *((uint64_t *)&v7 + 1), v8);
    swift_bridgeObjectRetain();
    sub_246561068(v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
    swift_retain();
    swift_retain();
    sub_246560F80(v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
    swift_release();
    swift_release();
    sub_24655947C(v7, *((uint64_t *)&v7 + 1), v8);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE60);
    sub_246561BA4(&qword_268F8BE68, &qword_268F8BE58);
    sub_246561BA4(&qword_268F8BE70, &qword_268F8BE60);
    sub_24659D618();
    sub_246560F80(v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
    swift_release();
    swift_release();
    sub_24655947C(v7, *((uint64_t *)&v7 + 1), v8);
    swift_bridgeObjectRelease();
  }
  double result = *(double *)&v19;
  long long v12 = v20;
  long long v13 = v21;
  long long v14 = v22;
  long long v15 = v23;
  uint64_t v16 = v24;
  char v17 = v25;
  *(_OWORD *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *(_OWORD *)(a1 + 48) = v14;
  *(_OWORD *)(a1 + 64) = v15;
  *(void *)(a1 + 80) = v16;
  *(unsigned char *)(a1 + 88) = v17;
  return result;
}

uint64_t sub_246560BE4@<X0>(uint64_t *a1@<X8>)
{
  return sub_246560C0C(&qword_268F8BF30, a1);
}

uint64_t sub_246560BF8@<X0>(uint64_t *a1@<X8>)
{
  return sub_246560C0C(&qword_268F8BF28, a1);
}

uint64_t sub_246560C0C@<X0>(uint64_t *a1@<X3>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(a1);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_246560C60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for ManagedAppCellContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  long long v13 = (int *)type metadata accessor for DefaultManagedAppCell();
  uint64_t v14 = a6 + v13[9];
  *(void *)uint64_t v14 = a2;
  *(unsigned char *)(v14 + 8) = a3 & 1;
  sub_246561C4C(a4, a6 + v13[10], &qword_268F8BF10);
  sub_246561C4C(a5, a6 + v13[11], &qword_268F8BF18);
  long long v15 = (uint64_t *)(a6 + v13[12]);
  *long long v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  swift_storeEnumTagMultiPayload();
  sub_24655C3B8();
  sub_24659D2B8();
  sub_24659D2B8();
  return sub_24659D2B8();
}

uint64_t sub_246560E24@<X0>(uint64_t a1@<X8>)
{
  return sub_24655F974(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_246560E30@<X0>(uint64_t a1@<X8>)
{
  return sub_24655FDF4(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_246560E3C()
{
  unint64_t result = qword_268F8BDA8;
  if (!qword_268F8BDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BDA8);
  }
  return result;
}

uint64_t sub_246560E90(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (a12)
  {
    sub_24655947C(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    sub_246560F80(a5, a6, a7, a8);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_246560F80(a1, a2, a3, a4);
    swift_release();
    swift_release();
    sub_24655947C(a8, a9, a10 & 1);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_246560F80(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24655947C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

double sub_246560FC4(uint64_t a1)
{
  *(unsigned char *)(a1 + 192) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_246560FE8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246561068(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_246561068(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_246558E8C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2465610AC()
{
  unint64_t result = qword_268F8BDD8;
  if (!qword_268F8BDD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD88);
    sub_246561120();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BDD8);
  }
  return result;
}

unint64_t sub_246561120()
{
  unint64_t result = qword_268F8BDE0;
  if (!qword_268F8BDE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BDE8);
    sub_2465611C0();
    sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BDE0);
  }
  return result;
}

unint64_t sub_2465611C0()
{
  unint64_t result = qword_268F8BDF0;
  if (!qword_268F8BDF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BDF8);
    sub_24656123C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BDF0);
  }
  return result;
}

unint64_t sub_24656123C()
{
  unint64_t result = qword_268F8BE00;
  if (!qword_268F8BE00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BE08);
    sub_2465612DC();
    sub_246561BA4(&qword_268F8BE40, &qword_268F8BE48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BE00);
  }
  return result;
}

unint64_t sub_2465612DC()
{
  unint64_t result = qword_268F8BE10;
  if (!qword_268F8BE10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BE18);
    sub_24656137C();
    sub_246561BA4(&qword_268F8BE30, &qword_268F8BE38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BE10);
  }
  return result;
}

unint64_t sub_24656137C()
{
  unint64_t result = qword_268F8BE20;
  if (!qword_268F8BE20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BE20);
  }
  return result;
}

uint64_t sub_2465613E8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 192);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    v4);
  return a1;
}

uint64_t sub_246561464(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246560F80(result, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_246561500@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24655DB08(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_24656150C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246561554(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2465615B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24656161C@<X0>(uint64_t a1@<X8>)
{
  return sub_24655EA5C(v1[4], v1[2], v1[3], a1);
}

BOOL sub_246561628(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a2;
  uint64_t v3 = sub_24659D5D8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  long long v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v18 - v8;
  long long v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a1, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = *MEMORY[0x263F199C0];
  if (v12 != *MEMORY[0x263F199C0])
  {
    if (v12 == *MEMORY[0x263F199F0])
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199F8])
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199E8]) {
      goto LABEL_7;
    }
    if (v12 == *MEMORY[0x263F199B8])
    {
      unint64_t v13 = 4;
    }
    else if (v12 == *MEMORY[0x263F199C8])
    {
      unint64_t v13 = 5;
    }
    else if (v12 == *MEMORY[0x263F199A0])
    {
      unint64_t v13 = 6;
    }
    else if (v12 == *MEMORY[0x263F199D8])
    {
      unint64_t v13 = 7;
    }
    else if (v12 == *MEMORY[0x263F199D0])
    {
      unint64_t v13 = 8;
    }
    else if (v12 == *MEMORY[0x263F199E0])
    {
      unint64_t v13 = 9;
    }
    else if (v12 == *MEMORY[0x263F199A8])
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != *MEMORY[0x263F199B0])
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == *MEMORY[0x263F199F0])
  {
    unint64_t v16 = 1;
  }
  else if (v15 == *MEMORY[0x263F199F8])
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != *MEMORY[0x263F199E8])
    {
      if (v15 == *MEMORY[0x263F199B8])
      {
        unint64_t v16 = 4;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199C8])
      {
        unint64_t v16 = 5;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199A0])
      {
        unint64_t v16 = 6;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199D8])
      {
        unint64_t v16 = 7;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199D0])
      {
        unint64_t v16 = 8;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199E0])
      {
        unint64_t v16 = 9;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199A8])
      {
        unint64_t v16 = 10;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199B0])
      {
        unint64_t v16 = 11;
        return v13 < v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 < v16;
}

unint64_t sub_246561A40()
{
  unint64_t result = qword_268F8BEB8;
  if (!qword_268F8BEB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD78);
    sub_246561BA4(&qword_268F8BEC0, &qword_268F8BEA8);
    sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BEB8);
  }
  return result;
}

unint64_t sub_246561B04()
{
  unint64_t result = qword_268F8BEE8;
  if (!qword_268F8BEE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BED0);
    sub_246561BA4(&qword_268F8BEF0, &qword_268F8BEC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BEE8);
  }
  return result;
}

uint64_t sub_246561BA4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_246561BE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246561C4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_246561CC8()
{
  return swift_getWitnessTable();
}

uint64_t OfferView.init(offerState:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v7 = sub_24659D878();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)a1;
  uint64_t v23 = *(void *)(a1 + 8);
  HIDWORD(v22) = *(unsigned __int8 *)(a1 + 16);
  *(void *)a4 = swift_getKeyPath();
  *(unsigned char *)(a4 + 8) = 0;
  int v12 = (int *)type metadata accessor for OfferView();
  unint64_t v13 = (uint64_t *)(a4 + v12[5]);
  *unint64_t v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = a4 + v12[6];
  *(void *)uint64_t v14 = swift_getKeyPath();
  *(void *)(v14 + 8) = 0;
  *(unsigned char *)(v14 + 16) = 0;
  uint64_t v15 = a4 + v12[8];
  char v28 = 0;
  sub_24659DAB8();
  uint64_t v16 = v26;
  *(unsigned char *)uint64_t v15 = v25;
  *(void *)(v15 + 8) = v16;
  uint64_t v25 = 0x4059000000000000;
  sub_24655C3B8();
  sub_24659D2B8();
  uint64_t v25 = 0x402E000000000000;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1A6C0], v7);
  sub_24659D2A8();
  uint64_t v25 = v11;
  uint64_t v26 = v23;
  char v27 = BYTE4(v22);
  type metadata accessor for OfferViewModel();
  swift_allocObject();
  swift_retain();
  sub_246551104((uint64_t)&v25, v24, a3);
  swift_release();
  sub_246568C38(&qword_268F8BF38, (void (*)(uint64_t))type metadata accessor for OfferViewModel);
  uint64_t v17 = sub_24659D388();
  uint64_t v19 = v18;
  uint64_t result = swift_release();
  long long v21 = (uint64_t *)(a4 + v12[7]);
  *long long v21 = v17;
  v21[1] = v19;
  return result;
}

uint64_t static OfferView.Space.== infix(_:_:)()
{
  return 1;
}

uint64_t OfferView.Space.hash(into:)()
{
  return sub_24659E1C8();
}

uint64_t OfferView.Space.hashValue.getter()
{
  return sub_24659E1F8();
}

uint64_t sub_2465623B0()
{
  return 1;
}

uint64_t sub_2465623B8()
{
  return sub_24659E1F8();
}

uint64_t sub_2465623FC()
{
  return sub_24659E1C8();
}

uint64_t sub_246562424()
{
  return sub_24659E1F8();
}

uint64_t OfferView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = sub_24659D5B8();
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OfferView();
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF48);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)v1;
  char v13 = *(unsigned char *)(v1 + 8);
  sub_246552D38(*(void *)v1, v13);
  sub_2465676C4(v12, v13, &v27);
  sub_246552EF4(v12, v13);
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  sub_246550990(&v27, (uint64_t)v28, *(double *)v28 / 100.0);
  sub_246562808(v1, (uint64_t)v28, (uint64_t)v8);
  sub_2465681E0(v1, (uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v23 + 80) + 205) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v15 = (_OWORD *)swift_allocObject();
  long long v16 = v28[9];
  v15[9] = v28[8];
  v15[10] = v16;
  v15[11] = v29[0];
  *(_OWORD *)((char *)v15 + 189) = *(_OWORD *)((char *)v29 + 13);
  long long v17 = v28[5];
  v15[5] = v28[4];
  v15[6] = v17;
  long long v18 = v28[7];
  v15[7] = v28[6];
  v15[8] = v18;
  long long v19 = v28[1];
  v15[1] = v28[0];
  v15[2] = v19;
  long long v20 = v28[3];
  v15[3] = v28[2];
  v15[4] = v20;
  sub_24656841C((uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v15 + v14);
  sub_246561BE8((uint64_t)v8, (uint64_t)v11, &qword_268F8BF40);
  long long v21 = &v11[*(int *)(v9 + 36)];
  *(void *)long long v21 = sub_246566E8C;
  *((void *)v21 + 1) = 0;
  *((void *)v21 + 2) = sub_246568480;
  *((void *)v21 + 3) = v15;
  sub_246555440((uint64_t)v8, &qword_268F8BF40);
  sub_24659D5A8();
  sub_2465684F4();
  sub_24659D988();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v26);
  return sub_246555440((uint64_t)v11, &qword_268F8BF48);
}

uint64_t sub_246562808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v157 = a2;
  uint64_t v162 = a3;
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFF8);
  MEMORY[0x270FA5388](v127);
  int v129 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C0B0);
  uint64_t v5 = MEMORY[0x270FA5388](v143);
  uint64_t v128 = (uint64_t)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v130 = (uint64_t)&v126 - v7;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C110);
  MEMORY[0x270FA5388](v140);
  uint64_t v142 = (uint64_t)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C118);
  MEMORY[0x270FA5388](v136);
  unint64_t v137 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C0A0);
  MEMORY[0x270FA5388](v141);
  uint64_t v138 = (char *)&v126 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C090);
  MEMORY[0x270FA5388](v161);
  v144 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C120);
  MEMORY[0x270FA5388](v131);
  v132 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C080);
  MEMORY[0x270FA5388](v149);
  unint64_t v14 = (char *)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)&v155 + 1) = type metadata accessor for Style.CapsuleButtonStyle();
  MEMORY[0x270FA5388](*((void *)&v155 + 1));
  v150 = (uint64_t *)((char *)&v126 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&long long v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C000);
  uint64_t v152 = *(void *)(v155 - 8);
  MEMORY[0x270FA5388](v155);
  v151 = (char *)&v126 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C128);
  uint64_t v154 = *(void *)(v156 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v156);
  unint64_t v139 = (char *)&v126 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v153 = (char *)&v126 - v19;
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C070);
  uint64_t v126 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  long long v21 = (char *)&v126 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C130);
  MEMORY[0x270FA5388](v158);
  uint64_t v160 = (uint64_t)&v126 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C138);
  MEMORY[0x270FA5388](v145);
  uint64_t v147 = (uint64_t)&v126 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C140);
  MEMORY[0x270FA5388](v133);
  uint64_t v25 = (char *)&v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF88);
  MEMORY[0x270FA5388](v146);
  uint64_t v134 = (char *)&v126 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF78);
  MEMORY[0x270FA5388](v159);
  v148 = (char *)&v126 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFA8);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)&v126 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF98);
  uint64_t v32 = MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v126 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  char v36 = (char *)&v126 - v35;
  uint64_t v37 = type metadata accessor for OfferView();
  uint64_t v38 = a1;
  uint64_t v39 = *(void *)(a1 + *(int *)(v37 + 28) + 8);
  uint64_t v41 = *(void *)(v39 + 16);
  uint64_t v40 = *(void *)(v39 + 24);
  if (*(unsigned char *)(v39 + 32))
  {
    if (*(unsigned char *)(v39 + 32) != 1)
    {
      switch(v41)
      {
        case 1:
          MEMORY[0x270FA5388](v37);
          swift_retain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C158);
          sub_24656A3E4();
          sub_24659DB08();
          uint64_t v71 = v126;
          uint64_t v72 = v135;
          (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v25, v21, v135);
          swift_storeEnumTagMultiPayload();
          sub_24656A754(&qword_268F8BF90, &qword_268F8BF98, (void (*)(void))sub_246568748);
          sub_246561BA4(&qword_268F8C068, &qword_268F8C070);
          uint64_t v73 = (uint64_t)v134;
          sub_24659D618();
          sub_246561BE8(v73, v147, &qword_268F8BF88);
          swift_storeEnumTagMultiPayload();
          sub_24656867C();
          sub_246568C80();
          uint64_t v74 = (uint64_t)v148;
          sub_24659D618();
          sub_246555440(v73, &qword_268F8BF88);
          sub_246561BE8(v74, v160, &qword_268F8BF78);
          swift_storeEnumTagMultiPayload();
          sub_246568640();
          sub_246568D9C();
          sub_24659D618();
          sub_246555440(v74, &qword_268F8BF78);
          return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v21, v72);
        case 3:
          swift_storeEnumTagMultiPayload();
          uint64_t v96 = sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
          uint64_t v97 = sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
          long long v167 = v155;
          *(void *)&long long v168 = v96;
          *((void *)&v168 + 1) = v97;
          swift_getOpaqueTypeConformance2();
          uint64_t v98 = (uint64_t)v138;
          sub_24659D618();
          sub_246561BE8(v98, v142, &qword_268F8C0A0);
          swift_storeEnumTagMultiPayload();
          sub_246568DD8();
          sub_246568EFC();
          uint64_t v99 = (uint64_t)v144;
          sub_24659D618();
          sub_246555440(v98, &qword_268F8C0A0);
          uint64_t v100 = &qword_268F8C090;
          sub_246561BE8(v99, v160, &qword_268F8C090);
          swift_storeEnumTagMultiPayload();
          sub_246568640();
          sub_246568D9C();
          sub_24659D618();
          uint64_t v69 = v99;
          goto LABEL_10;
        case 4:
          uint64_t v101 = sub_2465787AC();
          long long v102 = *(_OWORD *)(v157 + 152);
          long long v167 = *(_OWORD *)(v157 + 136);
          long long v168 = v102;
          uint64_t v104 = *(void *)(v157 + 168);
          uint64_t v103 = *(void *)(v157 + 176);
          char v105 = *(unsigned char *)(v157 + 184);
          MEMORY[0x270FA5388](v101);
          swift_retain_n();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
          sub_24656A200();
          uint64_t v106 = v151;
          sub_24659DB08();
          uint64_t KeyPath = swift_getKeyPath();
          uint64_t v108 = (uint64_t)v150;
          uint64_t *v150 = KeyPath;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
          swift_storeEnumTagMultiPayload();
          long long v109 = (int *)*((void *)&v155 + 1);
          *(unsigned char *)(v108 + *(int *)(*((void *)&v155 + 1) + 20)) = v105;
          uint64_t v110 = (_OWORD *)(v108 + v109[6]);
          long long v111 = v168;
          *uint64_t v110 = v167;
          v110[1] = v111;
          *(void *)(v108 + v109[7]) = v104;
          *(void *)(v108 + v109[8]) = v103;
          sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
          sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
          uint64_t v112 = v153;
          uint64_t v113 = v155;
          sub_24659D918();
          sub_24656A2A8(v108);
          (*(void (**)(char *, uint64_t))(v152 + 8))(v106, v113);
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v114 = swift_getKeyPath();
          uint64_t v115 = swift_allocObject();
          *(unsigned char *)(v115 + 16) = 1;
          uint64_t v116 = v154;
          uint64_t v117 = (uint64_t)v129;
          uint64_t v118 = v156;
          (*(void (**)(char *, char *, uint64_t))(v154 + 16))(v129, v112, v156);
          unint64_t v119 = (uint64_t *)(v117 + *(int *)(v127 + 36));
          *unint64_t v119 = v114;
          v119[1] = (uint64_t)sub_24656A36C;
          v119[2] = v115;
          (*(void (**)(char *, uint64_t))(v116 + 8))(v112, v118);
          uint64_t v120 = sub_24659DA78();
          uint64_t v121 = swift_getKeyPath();
          uint64_t v122 = v128;
          sub_246561BE8(v117, v128, &qword_268F8BFF8);
          int v123 = (uint64_t *)(v122 + *(int *)(v143 + 36));
          *int v123 = v121;
          v123[1] = v120;
          sub_246555440(v117, &qword_268F8BFF8);
          uint64_t v100 = &qword_268F8C0B0;
          uint64_t v124 = v130;
          sub_246561C4C(v122, v130, &qword_268F8C0B0);
          sub_246561BE8(v124, v142, &qword_268F8C0B0);
          swift_storeEnumTagMultiPayload();
          sub_246568DD8();
          sub_246568EFC();
          uint64_t v125 = (uint64_t)v144;
          sub_24659D618();
          sub_246561BE8(v125, v160, &qword_268F8C090);
          swift_storeEnumTagMultiPayload();
          sub_246568640();
          sub_246568D9C();
          sub_24659D618();
          sub_246555440(v125, &qword_268F8C090);
          uint64_t v69 = v124;
LABEL_10:
          uint64_t v70 = v100;
          return sub_246555440(v69, v70);
        default:
          uint64_t v75 = sub_2465787AC();
          v144 = v76;
          long long v77 = *(_OWORD *)(v157 + 152);
          long long v167 = *(_OWORD *)(v157 + 136);
          long long v168 = v77;
          uint64_t v79 = *(void *)(v157 + 168);
          uint64_t v78 = *(void *)(v157 + 176);
          char v80 = *(unsigned char *)(v157 + 184);
          MEMORY[0x270FA5388](v75);
          swift_retain_n();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
          sub_24656A200();
          uint64_t v81 = v151;
          sub_24659DB08();
          uint64_t v82 = swift_getKeyPath();
          uint64_t v83 = (uint64_t)v150;
          uint64_t *v150 = v82;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
          swift_storeEnumTagMultiPayload();
          uint64_t v84 = (int *)*((void *)&v155 + 1);
          *(unsigned char *)(v83 + *(int *)(*((void *)&v155 + 1) + 20)) = v80;
          uint64_t v85 = (_OWORD *)(v83 + v84[6]);
          long long v86 = v168;
          _OWORD *v85 = v167;
          v85[1] = v86;
          *(void *)(v83 + v84[7]) = v79;
          *(void *)(v83 + v84[8]) = v78;
          uint64_t v87 = sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
          uint64_t v88 = sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
          char v89 = v139;
          uint64_t v90 = (uint64_t)v14;
          uint64_t v91 = v155;
          sub_24659D918();
          sub_24656A2A8(v83);
          (*(void (**)(char *, uint64_t))(v152 + 8))(v81, v91);
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v92 = v154;
          uint64_t v93 = v153;
          uint64_t v94 = v156;
          (*(void (**)(char *, char *, uint64_t))(v154 + 32))(v153, v89, v156);
          (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v132, v93, v94);
          swift_storeEnumTagMultiPayload();
          uint64_t v163 = v91;
          v164 = v84;
          uint64_t v165 = v87;
          uint64_t v166 = v88;
          swift_getOpaqueTypeConformance2();
          sub_24659D618();
          sub_246561BE8(v90, v147, &qword_268F8C080);
          swift_storeEnumTagMultiPayload();
          sub_24656867C();
          sub_246568C80();
          uint64_t v95 = (uint64_t)v148;
          sub_24659D618();
          sub_246555440(v90, &qword_268F8C080);
          sub_246561BE8(v95, v160, &qword_268F8BF78);
          swift_storeEnumTagMultiPayload();
          sub_246568640();
          sub_246568D9C();
          sub_24659D618();
          sub_246555440(v95, &qword_268F8BF78);
          return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v93, v94);
      }
    }
    long long v42 = *(_OWORD *)(v157 + 152);
    long long v167 = *(_OWORD *)(v157 + 136);
    long long v168 = v42;
    uint64_t v44 = *(void *)(v157 + 168);
    uint64_t v43 = *(void *)(v157 + 176);
    char v45 = *(unsigned char *)(v157 + 184);
    MEMORY[0x270FA5388](v37);
    swift_retain_n();
    sub_246558E9C(v41, v40, 1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
    sub_24656A200();
    uint64_t v46 = v151;
    sub_24659DB08();
    uint64_t v47 = swift_getKeyPath();
    uint64_t v48 = (uint64_t)v150;
    uint64_t *v150 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
    swift_storeEnumTagMultiPayload();
    uint64_t v49 = (int *)*((void *)&v155 + 1);
    *(unsigned char *)(v48 + *(int *)(*((void *)&v155 + 1) + 20)) = v45;
    uint64_t v50 = (_OWORD *)(v48 + v49[6]);
    long long v51 = v168;
    *uint64_t v50 = v167;
    v50[1] = v51;
    *(void *)(v48 + v49[7]) = v44;
    *(void *)(v48 + v49[8]) = v43;
    uint64_t v52 = sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
    uint64_t v53 = sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
    uint64_t v54 = v139;
    uint64_t v55 = v155;
    sub_24659D918();
    sub_24656A2A8(v48);
    (*(void (**)(char *, uint64_t))(v152 + 8))(v46, v55);
    sub_246550978(v41, v40, 1);
    swift_release();
    uint64_t v56 = v154;
    uint64_t v57 = v153;
    uint64_t v58 = v54;
    uint64_t v59 = v156;
    (*(void (**)(char *, char *, uint64_t))(v154 + 32))(v153, v58, v156);
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v137, v57, v59);
    swift_storeEnumTagMultiPayload();
    uint64_t v163 = v55;
    v164 = v49;
    uint64_t v165 = v52;
    uint64_t v166 = v53;
    swift_getOpaqueTypeConformance2();
    uint64_t v60 = (uint64_t)v138;
    sub_24659D618();
    sub_246561BE8(v60, v142, &qword_268F8C0A0);
    swift_storeEnumTagMultiPayload();
    sub_246568DD8();
    sub_246568EFC();
    uint64_t v61 = (uint64_t)v144;
    sub_24659D618();
    sub_246555440(v60, &qword_268F8C0A0);
    sub_246561BE8(v61, v160, &qword_268F8C090);
    swift_storeEnumTagMultiPayload();
    sub_246568640();
    sub_246568D9C();
    sub_24659D618();
    sub_246555440(v61, &qword_268F8C090);
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v57, v59);
  }
  else
  {
    sub_246564520(*(void *)(v39 + 16), v40 & 1, v38, v157, (uint64_t)v30);
    sub_24659DBD8();
    sub_24659D408();
    sub_246561BE8((uint64_t)v30, (uint64_t)v34, &qword_268F8BFA8);
    uint64_t v63 = &v34[*(int *)(v31 + 36)];
    long long v64 = v172;
    *((_OWORD *)v63 + 4) = v171;
    *((_OWORD *)v63 + 5) = v64;
    *((_OWORD *)v63 + 6) = v173;
    long long v65 = v168;
    *(_OWORD *)uint64_t v63 = v167;
    *((_OWORD *)v63 + 1) = v65;
    long long v66 = v170;
    *((_OWORD *)v63 + 2) = v169;
    *((_OWORD *)v63 + 3) = v66;
    sub_246555440((uint64_t)v30, &qword_268F8BFA8);
    sub_246561C4C((uint64_t)v34, (uint64_t)v36, &qword_268F8BF98);
    sub_246561BE8((uint64_t)v36, (uint64_t)v25, &qword_268F8BF98);
    swift_storeEnumTagMultiPayload();
    sub_24656A754(&qword_268F8BF90, &qword_268F8BF98, (void (*)(void))sub_246568748);
    sub_246561BA4(&qword_268F8C068, &qword_268F8C070);
    uint64_t v67 = (uint64_t)v134;
    sub_24659D618();
    sub_246561BE8(v67, v147, &qword_268F8BF88);
    swift_storeEnumTagMultiPayload();
    sub_24656867C();
    sub_246568C80();
    uint64_t v68 = (uint64_t)v148;
    sub_24659D618();
    sub_246555440(v67, &qword_268F8BF88);
    sub_246561BE8(v68, v160, &qword_268F8BF78);
    swift_storeEnumTagMultiPayload();
    sub_246568640();
    sub_246568D9C();
    sub_24659D618();
    sub_246555440(v68, &qword_268F8BF78);
    uint64_t v69 = (uint64_t)v36;
    uint64_t v70 = &qword_268F8BF98;
    return sub_246555440(v69, v70);
  }
}

uint64_t sub_246564520@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  LODWORD(v120) = a2;
  uint64_t v119 = a1;
  uint64_t v135 = a5;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C1A8);
  MEMORY[0x270FA5388](v132);
  uint64_t v134 = (uint64_t)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFC8);
  uint64_t v8 = MEMORY[0x270FA5388](v133);
  uint64_t v10 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v109 - v11;
  uint64_t v13 = (int *)type metadata accessor for Style.CapsuleButtonStyle();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (uint64_t *)((char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C000);
  uint64_t v121 = *(void *)(v16 - 8);
  uint64_t v122 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C128);
  uint64_t v126 = *(void *)(v19 - 8);
  uint64_t v127 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v125 = (char *)&v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFF8);
  uint64_t v21 = MEMORY[0x270FA5388](v124);
  uint64_t v23 = (char *)&v109 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v109 - v24;
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFE8);
  uint64_t v26 = MEMORY[0x270FA5388](v128);
  uint64_t v111 = (uint64_t)&v109 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v110 = (uint64_t)&v109 - v28;
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFD8);
  uint64_t v29 = MEMORY[0x270FA5388](v129);
  uint64_t v123 = (uint64_t)&v109 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v113 = (uint64_t)&v109 - v31;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C050);
  MEMORY[0x270FA5388](v114);
  uint64_t v112 = (uint64_t)&v109 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C040);
  uint64_t v33 = MEMORY[0x270FA5388](v130);
  uint64_t v116 = (char *)&v109 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v115 = (char *)&v109 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v117 = (uint64_t)&v109 - v37;
  uint64_t v38 = type metadata accessor for OfferView();
  uint64_t v39 = *(int *)(v38 + 28);
  uint64_t v118 = (char *)a3;
  uint64_t v40 = (long long *)(a4 + 136);
  uint64_t v131 = a4;
  if (v120)
  {
    long long v62 = *(_OWORD *)(a4 + 152);
    long long v161 = *v40;
    long long v162 = v62;
    uint64_t v63 = *(void *)(a4 + 168);
    uint64_t v64 = *(void *)(a4 + 176);
    char v65 = *(unsigned char *)(a4 + 184);
    MEMORY[0x270FA5388](v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
    sub_24656A200();
    sub_24659DB08();
    *uint64_t v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v15 + v13[5]) = v65;
    long long v66 = (_OWORD *)((char *)v15 + v13[6]);
    long long v67 = v162;
    _OWORD *v66 = v161;
    v66[1] = v67;
    *(uint64_t *)((char *)v15 + v13[7]) = v63;
    *(uint64_t *)((char *)v15 + v13[8]) = v64;
    sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
    sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
    uint64_t v68 = v125;
    uint64_t v69 = v122;
    sub_24659D918();
    sub_24656A2A8((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v121 + 8))(v18, v69);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v71 = swift_allocObject();
    *(unsigned char *)(v71 + 16) = 1;
    uint64_t v73 = v126;
    uint64_t v72 = v127;
    (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v25, v68, v127);
    uint64_t v74 = (uint64_t *)&v25[*(int *)(v124 + 36)];
    *uint64_t v74 = KeyPath;
    v74[1] = (uint64_t)sub_24656AD5C;
    v74[2] = v71;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v68, v72);
    sub_24659DBD8();
    sub_24659D408();
    uint64_t v75 = v110;
    sub_246561BE8((uint64_t)v25, v110, &qword_268F8BFF8);
    uint64_t v76 = (_OWORD *)(v75 + *(int *)(v128 + 36));
    long long v77 = v159;
    v76[4] = v158;
    v76[5] = v77;
    v76[6] = v160;
    long long v78 = v155;
    *uint64_t v76 = v154;
    v76[1] = v78;
    long long v79 = v157;
    v76[2] = v156;
    v76[3] = v79;
    sub_246555440((uint64_t)v25, &qword_268F8BFF8);
    uint64_t v80 = v113;
    sub_246561BE8(v75, v113, &qword_268F8BFE8);
    *(void *)(v80 + *(int *)(v129 + 36)) = 0;
    sub_246555440(v75, &qword_268F8BFE8);
    uint64_t v81 = v131;
    if (*(unsigned char *)(v131 + 185)) {
      uint64_t v82 = sub_24659DBD8();
    }
    else {
      uint64_t v82 = sub_24659DBE8();
    }
    uint64_t v91 = v82;
    uint64_t v92 = v83;
    sub_246565FB0(v81, (uint64_t)v118, (uint64_t)&v138);
    uint64_t v93 = v112;
    sub_246561BE8(v80, v112, &qword_268F8BFD8);
    uint64_t v94 = v93 + *(int *)(v114 + 36);
    long long v95 = v151;
    *(_OWORD *)(v94 + 192) = v150;
    *(_OWORD *)(v94 + 208) = v95;
    *(_OWORD *)(v94 + 224) = v152;
    uint64_t v96 = v153;
    long long v97 = v147;
    *(_OWORD *)(v94 + 128) = v146;
    *(_OWORD *)(v94 + 144) = v97;
    long long v98 = v149;
    *(_OWORD *)(v94 + 160) = v148;
    *(_OWORD *)(v94 + 176) = v98;
    long long v99 = v143;
    *(_OWORD *)(v94 + 64) = v142;
    *(_OWORD *)(v94 + 80) = v99;
    long long v100 = v145;
    *(_OWORD *)(v94 + 96) = v144;
    *(_OWORD *)(v94 + 112) = v100;
    long long v101 = v139;
    *(_OWORD *)uint64_t v94 = v138;
    *(_OWORD *)(v94 + 16) = v101;
    long long v102 = v141;
    *(_OWORD *)(v94 + 32) = v140;
    *(_OWORD *)(v94 + 48) = v102;
    *(void *)(v94 + 240) = v96;
    *(void *)(v94 + 248) = v91;
    *(void *)(v94 + 256) = v92;
    sub_246555440(v80, &qword_268F8BFD8);
    sub_246568B6C();
    uint64_t v103 = (uint64_t)v116;
    sub_24659D968();
    sub_246555440(v93, &qword_268F8C050);
    uint64_t v136 = sub_2465787AC();
    uint64_t v137 = v104;
    sub_24656A60C();
    char v105 = v115;
    sub_24659D3D8();
    swift_bridgeObjectRelease();
    uint64_t v88 = &qword_268F8C040;
    sub_246555440(v103, &qword_268F8C040);
    uint64_t v106 = (uint64_t)v105;
    uint64_t v107 = v117;
    sub_246561C4C(v106, v117, &qword_268F8C040);
    sub_246561BE8(v107, v134, &qword_268F8C040);
    swift_storeEnumTagMultiPayload();
    sub_24656887C();
    sub_246568AC0();
    sub_24659D618();
    uint64_t v90 = v107;
  }
  else
  {
    uint64_t v117 = a3 + v39;
    uint64_t v118 = v10;
    uint64_t v120 = (uint64_t)v12;
    long long v41 = *(_OWORD *)(a4 + 152);
    long long v154 = *v40;
    long long v155 = v41;
    uint64_t v42 = *(void *)(a4 + 168);
    uint64_t v43 = *(void *)(a4 + 176);
    char v44 = *(unsigned char *)(a4 + 184);
    MEMORY[0x270FA5388](v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
    sub_24656A200();
    sub_24659DB08();
    *uint64_t v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v15 + v13[5]) = v44;
    char v45 = (_OWORD *)((char *)v15 + v13[6]);
    long long v46 = v155;
    _OWORD *v45 = v154;
    v45[1] = v46;
    *(uint64_t *)((char *)v15 + v13[7]) = v42;
    *(uint64_t *)((char *)v15 + v13[8]) = v43;
    sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
    sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
    uint64_t v47 = v125;
    uint64_t v48 = v122;
    sub_24659D918();
    sub_24656A2A8((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v121 + 8))(v18, v48);
    swift_bridgeObjectRelease();
    uint64_t v49 = swift_getKeyPath();
    uint64_t v50 = swift_allocObject();
    *(unsigned char *)(v50 + 16) = 1;
    uint64_t v52 = v126;
    uint64_t v51 = v127;
    (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v23, v47, v127);
    uint64_t v53 = (uint64_t *)&v23[*(int *)(v124 + 36)];
    *uint64_t v53 = v49;
    v53[1] = (uint64_t)sub_24656AD5C;
    v53[2] = v50;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v47, v51);
    sub_24659DBD8();
    sub_24659D408();
    uint64_t v54 = v111;
    sub_246561BE8((uint64_t)v23, v111, &qword_268F8BFF8);
    uint64_t v55 = (_OWORD *)(v54 + *(int *)(v128 + 36));
    long long v56 = v143;
    v55[4] = v142;
    v55[5] = v56;
    v55[6] = v144;
    long long v57 = v139;
    *uint64_t v55 = v138;
    v55[1] = v57;
    long long v58 = v141;
    void v55[2] = v140;
    v55[3] = v58;
    sub_246555440((uint64_t)v23, &qword_268F8BFF8);
    uint64_t v59 = v123;
    sub_246561BE8(v54, v123, &qword_268F8BFE8);
    *(void *)(v59 + *(int *)(v129 + 36)) = 0;
    sub_246555440(v54, &qword_268F8BFE8);
    if (*(unsigned char *)(v131 + 185)) {
      uint64_t v60 = sub_24659DBD8();
    }
    else {
      uint64_t v60 = sub_24659DBE8();
    }
    uint64_t v129 = v60;
    uint64_t v84 = v61;
    uint64_t v85 = (uint64_t)v118;
    long long v86 = &v118[*(int *)(v133 + 36)];
    MEMORY[0x270FA5388](v60);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C1B8);
    sub_24656A67C();
    sub_24659DB08();
    uint64_t v87 = (uint64_t *)&v86[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C030) + 36)];
    *uint64_t v87 = v129;
    v87[1] = v84;
    sub_246561C4C(v123, v85, &qword_268F8BFD8);
    uint64_t v88 = &qword_268F8BFC8;
    uint64_t v89 = v120;
    sub_246561C4C(v85, v120, &qword_268F8BFC8);
    sub_246561BE8(v89, v134, &qword_268F8BFC8);
    swift_storeEnumTagMultiPayload();
    sub_24656887C();
    sub_246568AC0();
    sub_24659D618();
    uint64_t v90 = v89;
  }
  return sub_246555440(v90, v88);
}

uint64_t sub_246565454(double a1)
{
  sub_24659DBD8();
  sub_2465657C4((uint64_t)v10);
  long long v26 = v10[12];
  long long v27 = v10[13];
  long long v28 = v10[14];
  long long v29 = v10[15];
  long long v22 = v10[8];
  long long v23 = v10[9];
  long long v24 = v10[10];
  long long v25 = v10[11];
  long long v18 = v10[4];
  long long v19 = v10[5];
  long long v20 = v10[6];
  long long v21 = v10[7];
  long long v14 = v10[0];
  long long v15 = v10[1];
  long long v16 = v10[2];
  long long v17 = v10[3];
  char v11 = 0;
  sub_24659DBD8();
  sub_24659D2E8();
  char v13 = v8;
  char v12 = v9;
  sub_2465787AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C1F8);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_24659EC70;
  double v3 = a1 * 100.0;
  if ((~COERCE__INT64(a1 * 100.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = sub_24659E148();
    uint64_t v7 = v6;
    v4[7] = MEMORY[0x263F8D310];
    v4[8] = sub_24656A870();
    v4[4] = v5;
    v4[5] = v7;
    sub_24659DD18();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C1D0);
    sub_24656A754(&qword_268F8C1C8, &qword_268F8C1D0, (void (*)(void))sub_24656A7D0);
    sub_24656A60C();
    sub_24659D958();
    swift_bridgeObjectRelease();
    return sub_24656A8C4((uint64_t)v10);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2465657C4@<X0>(uint64_t a1@<X8>)
{
  sub_24659DA28();
  uint64_t v9 = sub_24659DA38();
  swift_release();
  sub_24659D8A8();
  sub_24659D298();
  if (qword_268F8B968 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_268F8EDC0;
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  swift_retain();
  sub_24659D8A8();
  sub_24659D298();
  uint64_t v8 = sub_24659DA08();
  uint64_t v4 = swift_getKeyPath();
  MEMORY[0x270FA5388](v4);
  sub_24659D8A8();
  uint64_t v6 = sub_24659DA08();
  uint64_t v3 = swift_getKeyPath();
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v12;
  *(void *)(a1 + 32) = v13;
  *(unsigned char *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v16;
  *(void *)(a1 + 64) = v17;
  *(void *)(a1 + 72) = v18;
  *(void *)(a1 + 80) = v19;
  *(void *)(a1 + 88) = KeyPath;
  *(void *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = v20;
  *(void *)(a1 + 112) = v21;
  *(void *)(a1 + 120) = v22;
  *(void *)(a1 + 128) = v23;
  *(unsigned char *)(a1 + 136) = v24;
  *(void *)(a1 + 144) = v25;
  *(void *)(a1 + 152) = v26;
  *(void *)(a1 + 160) = v27;
  *(void *)(a1 + 168) = v28;
  *(void *)(a1 + 176) = v29;
  *(void *)(a1 + 184) = v4;
  *(void *)(a1 + 192) = v8;
  *(void *)(a1 + 200) = v30;
  *(void *)(a1 + 208) = v31;
  *(void *)(a1 + 216) = v32;
  *(void *)(a1 + 224) = v33;
  *(unsigned char *)(a1 + 232) = v34;
  *(void *)(a1 + 240) = v3;
  *(void *)(a1 + 248) = v6;
  swift_retain();
  sub_24656AA40(v10, v11, v12, v13, v14);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24656AA40(v20, v21, v22, v23, v24);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24656AA40(v30, v31, v32, v33, v34);
  swift_retain();
  swift_retain();
  sub_24656AA04(v30, v31, v32, v33, v34);
  swift_release();
  swift_release();
  sub_24656AA04(v20, v21, v22, v23, v24);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24656AA04(v10, v11, v12, v13, v14);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246565DB4()
{
  return sub_24659D898();
}

uint64_t sub_246565E08()
{
  return sub_24659D898();
}

uint64_t sub_246565E64()
{
  uint64_t v0 = sub_24659D598();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F19860], v0);
  v5[0] = 0x3FF0000000000000;
  v5[1] = 0;
  v5[2] = 0;
  v5[3] = 0x3FF0000000000000;
  v5[4] = 0;
  v5[5] = 0;
  sub_24659D888();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_246565FB0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OfferView();
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = a1;
  sub_24659D8A8();
  uint64_t v40 = v44;
  uint64_t v39 = v45;
  uint64_t v38 = v46;
  uint64_t v37 = v47;
  int v36 = v48;
  sub_24659D298();
  uint64_t v9 = v49;
  uint64_t v10 = v50;
  uint64_t v11 = v51;
  uint64_t v35 = v52;
  uint64_t v12 = v53;
  if (qword_268F8B968 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_268F8EDC0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v14 = a2 + *(int *)(v6 + 32);
  char v15 = *(unsigned char *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  LOBYTE(v54) = *(unsigned char *)v14;
  uint64_t v55 = v16;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C208);
  sub_24659DAC8();
  if (v43) {
    double v17 = 6.28318531;
  }
  else {
    double v17 = 0.0;
  }
  sub_24659DC68();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_24659DC08();
  uint64_t v32 = sub_24659DBF8();
  swift_release();
  LOBYTE(v54) = v15;
  uint64_t v55 = v16;
  sub_24659DAC8();
  char v22 = v43;
  sub_2465681E0(a2, (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v23 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v24 = swift_allocObject();
  sub_24656841C((uint64_t)v8, v24 + v23);
  sub_2465681E0(a2, (uint64_t)v8);
  uint64_t v25 = swift_allocObject();
  sub_24656841C((uint64_t)v8, v25 + v23);
  sub_24659DBD8();
  sub_24659D2E8();
  uint64_t v26 = v54;
  uint64_t v27 = v56;
  char v43 = v55;
  char v42 = v57;
  uint64_t v28 = v39;
  *(void *)a3 = v40;
  *(void *)(a3 + 8) = v28;
  uint64_t v29 = v37;
  *(void *)(a3 + 16) = v38;
  *(void *)(a3 + 24) = v29;
  *(unsigned char *)(a3 + 32) = v36;
  *(void *)(a3 + 40) = v9;
  *(void *)(a3 + 48) = v10;
  *(void *)(a3 + 56) = v11;
  *(void *)(a3 + 64) = v35;
  *(void *)(a3 + 72) = v12;
  *(void *)(a3 + 80) = KeyPath;
  *(void *)(a3 + 88) = v13;
  *(double *)(a3 + 96) = v17;
  *(void *)(a3 + 104) = v19;
  *(void *)(a3 + 112) = v21;
  *(void *)(a3 + 120) = v32;
  *(unsigned char *)(a3 + 128) = v22;
  *(void *)(a3 + 136) = sub_24656AA64;
  *(void *)(a3 + 144) = v24;
  *(_OWORD *)(a3 + 168) = 0u;
  *(_OWORD *)(a3 + 152) = 0u;
  *(void *)(a3 + 184) = sub_24656AC4C;
  *(void *)(a3 + 192) = v25;
  *(void *)(a3 + 200) = v26;
  *(unsigned char *)(a3 + 208) = v43;
  *(void *)(a3 + 216) = v27;
  *(unsigned char *)(a3 + 224) = v42;
  double result = v58[0];
  *(_OWORD *)(a3 + 232) = *(_OWORD *)v58;
  return result;
}

uint64_t sub_2465663D0()
{
  return sub_24659D898();
}

uint64_t sub_246566424()
{
  return sub_24659DAD8();
}

uint64_t sub_246566490()
{
  return sub_24659DAD8();
}

uint64_t sub_2465664F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE50);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v74 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for Style.CapsuleButtonStyle();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C000);
  uint64_t v62 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C128);
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFF8);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFE8);
  MEMORY[0x270FA5388](v65);
  uint64_t v67 = (uint64_t)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BFD8);
  MEMORY[0x270FA5388](v66);
  uint64_t v69 = (uint64_t)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C180);
  MEMORY[0x270FA5388](v68);
  uint64_t v70 = (uint64_t)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C170);
  MEMORY[0x270FA5388](v72);
  uint64_t v73 = (uint64_t)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C158);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v71 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_2465787AC();
  uint64_t v23 = *(void *)(a1 + 168);
  uint64_t v24 = *(void *)(a1 + 176);
  char v25 = *(unsigned char *)(a1 + 184);
  uint64_t v76 = v22;
  uint64_t v77 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
  sub_24656A200();
  sub_24659DB08();
  *uint64_t v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v7 + v5[5]) = v25;
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t)v15;
  uint64_t v29 = (_OWORD *)((char *)v7 + v5[6]);
  long long v30 = *(_OWORD *)(v27 + 152);
  *uint64_t v29 = *(_OWORD *)(v27 + 136);
  v29[1] = v30;
  *(uint64_t *)((char *)v7 + v5[7]) = v23;
  *(uint64_t *)((char *)v7 + v5[8]) = v24;
  sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
  sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
  uint64_t v31 = v61;
  sub_24659D918();
  sub_24656A2A8((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v9, v31);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = 1;
  uint64_t v34 = v63;
  uint64_t v35 = v64;
  (*(void (**)(uint64_t, char *, uint64_t))(v63 + 16))(v28, v11, v64);
  int v36 = (uint64_t *)(v28 + *(int *)(v13 + 44));
  uint64_t *v36 = KeyPath;
  v36[1] = (uint64_t)sub_24656AD5C;
  void v36[2] = v33;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
  sub_24659DBD8();
  sub_24659D408();
  uint64_t v37 = v67;
  sub_246561BE8(v28, v67, &qword_268F8BFF8);
  uint64_t v38 = (_OWORD *)(v37 + *(int *)(v65 + 36));
  long long v39 = v85;
  v38[4] = v84;
  v38[5] = v39;
  v38[6] = v86;
  long long v40 = v81;
  *uint64_t v38 = v80;
  v38[1] = v40;
  long long v41 = v83;
  v38[2] = v82;
  v38[3] = v41;
  sub_246555440(v28, &qword_268F8BFF8);
  uint64_t v42 = v69;
  sub_246561BE8(v37, v69, &qword_268F8BFE8);
  *(void *)(v42 + *(int *)(v66 + 36)) = 0;
  sub_246555440(v37, &qword_268F8BFE8);
  sub_24659DA28();
  uint64_t v43 = sub_24659DA38();
  swift_release();
  LOBYTE(v28) = sub_24659D788();
  uint64_t v44 = v70;
  sub_246561BE8(v42, v70, &qword_268F8BFD8);
  uint64_t v45 = v44 + *(int *)(v68 + 36);
  *(void *)uint64_t v45 = v43;
  *(unsigned char *)(v45 + 8) = v28;
  sub_246555440(v42, &qword_268F8BFD8);
  if (*(unsigned char *)(v27 + 185)) {
    uint64_t v46 = sub_24659DBD8();
  }
  else {
    uint64_t v46 = sub_24659DBE8();
  }
  uint64_t v48 = v46;
  uint64_t v49 = v47;
  uint64_t v50 = sub_24659DAA8();
  sub_24659D808();
  uint64_t v51 = sub_24659D7E8();
  uint64_t v52 = (uint64_t)v74;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v74, 1, 1, v51);
  uint64_t v53 = sub_24659D818();
  sub_246555440(v52, &qword_268F8BE50);
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = v73;
  sub_246561BE8(v44, v73, &qword_268F8C180);
  uint64_t v56 = (uint64_t *)(v55 + *(int *)(v72 + 36));
  *uint64_t v56 = v50;
  v56[1] = v54;
  v56[2] = v53;
  v56[3] = v48;
  v56[4] = v49;
  sub_246555440(v44, &qword_268F8C180);
  uint64_t v78 = sub_2465787AC();
  uint64_t v79 = v57;
  sub_24656A490();
  sub_24656A60C();
  uint64_t v58 = (uint64_t)v71;
  sub_24659D948();
  swift_bridgeObjectRelease();
  sub_246555440(v55, &qword_268F8C170);
  return sub_246561C4C(v58, v75, &qword_268F8C158);
}

uint64_t sub_246566E8C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_24659D638();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24656A1A4();
  sub_24659D668();
  sub_24659D308();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v7;
  a1[1] = v9;
  a1[2] = v11;
  a1[3] = v13;
  return result;
}

uint64_t sub_246566FA8(uint64_t a1, long long *a2, uint64_t a3)
{
  double v5 = *(double *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  double v6 = *(double *)(a1 + 16);
  long long v7 = a2[9];
  long long v34 = a2[8];
  long long v35 = v7;
  v36[0] = a2[10];
  *(_OWORD *)((char *)v36 + 13) = *(long long *)((char *)a2 + 173);
  long long v8 = a2[5];
  long long v30 = a2[4];
  long long v31 = v8;
  long long v9 = a2[7];
  long long v32 = a2[6];
  long long v33 = v9;
  long long v10 = a2[1];
  long long v26 = *a2;
  long long v27 = v10;
  long long v11 = a2[3];
  long long v28 = a2[2];
  long long v29 = v11;
  uint64_t v12 = type metadata accessor for OfferView();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  sub_246550AF8(v25);
  double v14 = v13;
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)a3;
  char v18 = *(unsigned char *)(a3 + 8);
  sub_246552D38(*(void *)a3, v18);
  sub_2465676C4(v17, v18, &v26);
  sub_246552EF4(v17, v18);
  if (v26 - 1 >= 3) {
    double v5 = v5 + v6 - v14;
  }
  uint64_t v19 = a3 + *(int *)(v12 + 24);
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *(void *)(v19 + 8);
  char v22 = *(unsigned char *)(v19 + 16);
  sub_246569320();
  uint64_t v23 = (void (*)(long long *))sub_246567E08(v20, v21, v22);
  sub_246568410();
  *(double *)&long long v26 = v5;
  *((void *)&v26 + 1) = v4;
  *(double *)&long long v27 = v14;
  *((void *)&v27 + 1) = v16;
  v23(&v26);
  return swift_release();
}

uint64_t sub_246567150@<X0>(uint64_t a1@<X8>)
{
  sub_24656A60C();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_24659D8D8();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v8 = v7;
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

void sub_2465671F0(void *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

uint64_t (*EnvironmentValues.reportOfferButtonFrame.getter())(double, double, double, double)
{
  sub_246568F9C();
  sub_24659D538();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_246569028;
}

double sub_246567278@<D0>(_OWORD *a1@<X8>)
{
  sub_246568F9C();
  sub_24659D538();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2465672C8()
{
  return sub_24659D548();
}

uint64_t EnvironmentValues.reportOfferButtonFrame.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_246568F9C();
  return sub_24659D548();
}

void (*EnvironmentValues.reportOfferButtonFrame.modify(void *a1))(uint64_t **a1, char a2)
{
  long long v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_246568F9C();
  sub_24659D538();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = *((_OWORD *)v3 + 1);
  *long long v3 = sub_246569028;
  v3[1] = v4;
  return sub_246567450;
}

void sub_246567450(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  if (a2)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    *(void *)(v5 + 24) = v3;
    v2[2] = (uint64_t)sub_24656902C;
    v2[3] = v5;
    swift_retain();
    sub_24659D548();
    swift_release();
  }
  else
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v3;
    v2[2] = (uint64_t)sub_24656902C;
    v2[3] = v6;
    sub_24659D548();
  }

  free(v2);
}

uint64_t sub_246567540@<X0>(unsigned char *a1@<X8>)
{
  sub_24656ACF8();
  uint64_t result = sub_24659D538();
  *a1 = v3;
  return result;
}

uint64_t sub_246567590@<X0>(unsigned char *a1@<X8>)
{
  sub_24656ACF8();
  uint64_t result = sub_24659D538();
  *a1 = v3;
  return result;
}

uint64_t sub_2465675E0()
{
  return sub_24659D548();
}

uint64_t sub_24656762C()
{
  return sub_24659D548();
}

uint64_t type metadata accessor for OfferView()
{
  uint64_t result = qword_268F8C0E0;
  if (!qword_268F8C0E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2465676C4@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = sub_24659D528();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  long long v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a3 = a1;
  }
  else
  {
    sub_246552D38(a1, 0);
    os_log_type_t v11 = sub_24659DF28();
    uint64_t v12 = sub_24659D778();
    os_log_type_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      double v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v17[1] = a3;
      uint64_t v16 = v15;
      uint64_t v18 = v15;
      *(_DWORD *)double v14 = 136315138;
      v17[2] = sub_2465574C8(0x656C797453, 0xE500000000000000, &v18);
      sub_24659DFE8();
      _os_log_impl(&dword_24654E000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v16, -1, -1);
      MEMORY[0x24C52FE90](v14, -1, -1);
    }

    sub_24659D518();
    swift_getAtKeyPath();
    sub_246552EF4(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_2465678D8(uint64_t a1, char a2)
{
  uint64_t v4 = sub_24659D528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_24659DF28();
  uint64_t v9 = sub_24659D778();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    uint64_t v14 = sub_2465574C8(1819242306, 0xE400000000000000, &v15);
    sub_24659DFE8();
    _os_log_impl(&dword_24654E000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v12, -1, -1);
    MEMORY[0x24C52FE90](v11, -1, -1);
  }

  sub_24659D518();
  swift_getAtKeyPath();
  sub_246552EF4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_246567ADC@<X0>(uint64_t a1@<X8>)
{
  return sub_246567B50(&qword_268F8BF30, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_246567B18@<X0>(uint64_t a1@<X8>)
{
  return sub_246567B50(&qword_268F8BF20, MEMORY[0x263F19A00], 0xD000000000000013, 0x80000002465A0F70, a1);
}

uint64_t sub_246567B50@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_24659D528();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246561BE8(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_24659DF28();
    uint64_t v21 = sub_24659D778();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v26 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v27 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v30 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v29 = sub_2465574C8(v28, v26, &v30);
      sub_24659DFE8();
      _os_log_impl(&dword_24654E000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v24, -1, -1);
      MEMORY[0x24C52FE90](v23, -1, -1);
    }

    sub_24659D518();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_246567E08(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_24659D528();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v9 = sub_24659DF28();
    os_log_type_t v10 = sub_24659D778();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      v15[0] = v12 + 4;
      v15[1] = sub_2465574C8(0x2974636552474328, 0xEE002928203E2D20, &v16);
      sub_24659DFE8();
      _os_log_impl(&dword_24654E000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v13, -1, -1);
      MEMORY[0x24C52FE90](v12, -1, -1);
    }

    sub_24659D518();
    swift_getAtKeyPath();
    sub_246568410();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v16;
  }
  return a1;
}

uint64_t sub_246568038@<X0>(uint64_t a1@<X8>)
{
  return sub_246567B50(&qword_268F8C100, MEMORY[0x263F18D80], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_246568078()
{
  return sub_24659D438();
}

uint64_t sub_24656809C()
{
  return sub_24659D438();
}

uint64_t sub_2465680C0(uint64_t a1)
{
  uint64_t v2 = sub_24659D5D8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24659D448();
}

double sub_24656818C@<D0>(_OWORD *a1@<X8>)
{
  sub_246568F9C();
  sub_24659D538();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2465681E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OfferView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246568244()
{
  uint64_t v1 = (int *)type metadata accessor for OfferView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 205) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_246552EF4(*(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v6 = v0 + v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24659D5D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v2 | 7;
  uint64_t v9 = v3 + v4;
  sub_246568410();
  swift_release();
  swift_release();
  uint64_t v10 = v5 + v1[9];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(v5 + v1[10], v11);

  return MEMORY[0x270FA0238](v0, v9, v8);
}

uint64_t sub_246568410()
{
  return swift_release();
}

uint64_t sub_24656841C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OfferView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246568480(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for OfferView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 205) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_246566FA8(a1, (long long *)(v1 + 16), v4);
}

unint64_t sub_2465684F4()
{
  unint64_t result = qword_268F8BF50;
  if (!qword_268F8BF50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BF48);
    sub_246568594();
    sub_246561BA4(&qword_268F8C0B8, &qword_268F8C0C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BF50);
  }
  return result;
}

unint64_t sub_246568594()
{
  unint64_t result = qword_268F8BF58;
  if (!qword_268F8BF58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BF40);
    sub_2465687F4(&qword_268F8BF60, &qword_268F8BF68, (void (*)(void))sub_246568640, (void (*)(void))sub_246568D9C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BF58);
  }
  return result;
}

uint64_t sub_246568640()
{
  return sub_2465687F4(&qword_268F8BF70, &qword_268F8BF78, (void (*)(void))sub_24656867C, (void (*)(void))sub_246568C80);
}

unint64_t sub_24656867C()
{
  unint64_t result = qword_268F8BF80;
  if (!qword_268F8BF80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BF88);
    sub_24656A754(&qword_268F8BF90, &qword_268F8BF98, (void (*)(void))sub_246568748);
    sub_246561BA4(&qword_268F8C068, &qword_268F8C070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BF80);
  }
  return result;
}

unint64_t sub_246568748()
{
  unint64_t result = qword_268F8BFA0;
  if (!qword_268F8BFA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BFA8);
    sub_2465687F4(&qword_268F8BFB0, &qword_268F8BFB8, (void (*)(void))sub_24656887C, (void (*)(void))sub_246568AC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BFA0);
  }
  return result;
}

uint64_t sub_2465687F4(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
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

unint64_t sub_24656887C()
{
  unint64_t result = qword_268F8BFC0;
  if (!qword_268F8BFC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BFC8);
    sub_24656A754(&qword_268F8BFD0, &qword_268F8BFD8, (void (*)(void))sub_246568948);
    sub_246561BA4(&qword_268F8C028, &qword_268F8C030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BFC0);
  }
  return result;
}

uint64_t sub_246568948()
{
  return sub_24656A754(&qword_268F8BFE0, &qword_268F8BFE8, (void (*)(void))sub_246568978);
}

unint64_t sub_246568978()
{
  unint64_t result = qword_268F8BFF0;
  if (!qword_268F8BFF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BFF8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C000);
    type metadata accessor for Style.CapsuleButtonStyle();
    sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
    sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_246561BA4(&qword_268F8C018, &qword_268F8C020);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8BFF0);
  }
  return result;
}

unint64_t sub_246568AC0()
{
  unint64_t result = qword_268F8C038;
  if (!qword_268F8C038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C040);
    sub_246568B6C();
    sub_246568C38(&qword_268F8BDA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C038);
  }
  return result;
}

unint64_t sub_246568B6C()
{
  unint64_t result = qword_268F8C048;
  if (!qword_268F8C048)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C050);
    sub_24656A754(&qword_268F8BFD0, &qword_268F8BFD8, (void (*)(void))sub_246568948);
    sub_246561BA4(&qword_268F8C058, &qword_268F8C060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C048);
  }
  return result;
}

uint64_t sub_246568C38(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_246568C80()
{
  unint64_t result = qword_268F8C078;
  if (!qword_268F8C078)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C080);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C000);
    type metadata accessor for Style.CapsuleButtonStyle();
    sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
    sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C078);
  }
  return result;
}

uint64_t sub_246568D9C()
{
  return sub_2465687F4(&qword_268F8C088, &qword_268F8C090, (void (*)(void))sub_246568DD8, (void (*)(void))sub_246568EFC);
}

unint64_t sub_246568DD8()
{
  unint64_t result = qword_268F8C098;
  if (!qword_268F8C098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C0A0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C000);
    type metadata accessor for Style.CapsuleButtonStyle();
    sub_246561BA4(&qword_268F8C008, &qword_268F8C000);
    sub_246568C38(&qword_268F8C010, (void (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C098);
  }
  return result;
}

unint64_t sub_246568EFC()
{
  unint64_t result = qword_268F8C0A8;
  if (!qword_268F8C0A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C0B0);
    sub_246568978();
    sub_246561BA4(&qword_268F8BE40, &qword_268F8BE48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C0A8);
  }
  return result;
}

unint64_t sub_246568F9C()
{
  unint64_t result = qword_268F8C0C8;
  if (!qword_268F8C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C0C8);
  }
  return result;
}

uint64_t sub_246568FF0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246569030(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = *(uint64_t (**)(void *))(v4 + 16);
  *(double *)uint64_t v7 = a1;
  *(double *)&v7[1] = a2;
  *(double *)&v7[2] = a3;
  *(double *)&v7[3] = a4;
  return v5(v7);
}

uint64_t sub_24656906C(double *a1)
{
  return (*(uint64_t (**)(double, double, double, double))(v1 + 16))(*a1, a1[1], a1[2], a1[3]);
}

unint64_t sub_2465690A0()
{
  unint64_t result = qword_268F8C0D0;
  if (!qword_268F8C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C0D0);
  }
  return result;
}

uint64_t sub_2465690F4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t initializeBufferWithCopyOfBuffer for OfferView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_246552D38(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_24659D5D8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = a1 + v14;
    uint64_t v16 = (uint64_t *)(a2 + v14);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    char v19 = *((unsigned char *)v16 + 16);
    sub_246569320();
    *(void *)uint64_t v15 = v17;
    *(void *)(v15 + 8) = v18;
    *(unsigned char *)(v15 + 16) = v19;
    uint64_t v20 = a3[7];
    uint64_t v21 = a3[8];
    uint64_t v22 = (void *)(a1 + v20);
    uint64_t v23 = (void *)(a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a1 + v21;
    uint64_t v26 = a2 + v21;
    *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
    *(void *)(v25 + 8) = *(void *)(v26 + 8);
    uint64_t v27 = a3[9];
    uint64_t v28 = a1 + v27;
    uint64_t v29 = a2 + v27;
    swift_retain();
    swift_retain();
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
    long long v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16);
    v31(v28, v29, v30);
    v31(a1 + a3[10], a2 + a3[10], v30);
  }
  return a1;
}

uint64_t sub_246569320()
{
  return swift_retain();
}

uint64_t destroy for OfferView(uint64_t a1, int *a2)
{
  sub_246552EF4(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24659D5D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_246568410();
  swift_release();
  swift_release();
  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v10)((void *)(v7 - 8), v6, v7);
  uint64_t v8 = a1 + a2[10];

  return v10(v8, v7);
}

uint64_t initializeWithCopy for OfferView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24659D5D8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  char v17 = *((unsigned char *)v14 + 16);
  sub_246569320();
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(unsigned char *)(v13 + 16) = v17;
  uint64_t v18 = a3[7];
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v18);
  uint64_t v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a1 + v19;
  uint64_t v24 = a2 + v19;
  *(unsigned char *)uint64_t v23 = *(unsigned char *)v24;
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  uint64_t v25 = a3[9];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  swift_retain();
  swift_retain();
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16);
  v29(v26, v27, v28);
  v29(a1 + a3[10], a2 + a3[10], v28);
  return a1;
}

uint64_t assignWithCopy for OfferView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_246555440(a1 + v10, &qword_268F8BF20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_24659D5D8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  char v19 = *((unsigned char *)v16 + 16);
  sub_246569320();
  *(void *)uint64_t v15 = v17;
  *(void *)(v15 + 8) = v18;
  *(unsigned char *)(v15 + 16) = v19;
  sub_246568410();
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  uint64_t v23 = a3[8];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(unsigned char *)uint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_retain();
  swift_release();
  uint64_t v26 = a3[9];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 24);
  v30(v27, v28, v29);
  v30(a1 + a3[10], a2 + a3[10], v29);
  return a1;
}

uint64_t initializeWithTake for OfferView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_24659D5D8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = (long long *)(a2 + v11);
  long long v15 = *v14;
  *(unsigned char *)(v13 + 16) = *((unsigned char *)v14 + 16);
  *(_OWORD *)uint64_t v13 = v15;
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v16 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32);
  v20(v17, v18, v19);
  v20(a1 + a3[10], a2 + a3[10], v19);
  return a1;
}

uint64_t assignWithTake for OfferView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_246555440(a1 + v10, &qword_268F8BF20);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_24659D5D8();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t)a2 + v15;
  char v18 = *(unsigned char *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = v18;
  sub_246568410();
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)((char *)a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_release();
  uint64_t v24 = a3[8];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (uint64_t)a2 + v24;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_release();
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = (uint64_t)a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  long long v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40);
  v31(v28, v29, v30);
  v31(a1 + a3[10], (uint64_t)a2 + a3[10], v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246569BE0);
}

uint64_t sub_246569BE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C0D8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[7] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[9];
    return v14(v16, a2, v15);
  }
}

uint64_t storeEnumTagSinglePayload for OfferView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246569D30);
}

uint64_t sub_246569D30(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C0D8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[7] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[9];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_246569E6C()
{
  sub_246569F5C();
  if (v0 <= 0x3F)
  {
    sub_24655C35C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_246569F5C()
{
  if (!qword_268F8BD50)
  {
    sub_24659D5D8();
    unint64_t v0 = sub_24659D288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8BD50);
    }
  }
}

uint64_t getEnumTagSinglePayload for OfferView.Space(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for OfferView.Space(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24656A0A4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24656A0CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for OfferView.Space()
{
  return &type metadata for OfferView.Space;
}

unint64_t sub_24656A0E8()
{
  unint64_t result = qword_268F8C0F0;
  if (!qword_268F8C0F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C0F8);
    sub_2465684F4();
    sub_246568C38(&qword_268F8BDA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C0F0);
  }
  return result;
}

ValueMetadata *_s28__Key_reportOfferButtonFrameVMa()
{
  return &_s28__Key_reportOfferButtonFrameVN;
}

unint64_t sub_24656A1A4()
{
  unint64_t result = qword_268F8C108;
  if (!qword_268F8C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C108);
  }
  return result;
}

uint64_t sub_24656A1F8@<X0>(uint64_t a1@<X8>)
{
  return sub_246567150(a1);
}

unint64_t sub_24656A200()
{
  unint64_t result = qword_268F8C150;
  if (!qword_268F8C150)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C148);
    sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C150);
  }
  return result;
}

uint64_t sub_24656A2A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Style.CapsuleButtonStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24656A304@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24659D4B8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24656A334()
{
  return sub_24659D4C8();
}

uint64_t sub_24656A35C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_24656A36C(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_24656A384@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659D4F8();
  *a1 = result;
  return result;
}

uint64_t sub_24656A3B0()
{
  return sub_24659D508();
}

uint64_t sub_24656A3DC@<X0>(uint64_t a1@<X8>)
{
  return sub_2465664F8(*(void *)(v1 + 24), a1);
}

unint64_t sub_24656A3E4()
{
  unint64_t result = qword_268F8C160;
  if (!qword_268F8C160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C158);
    sub_24656A490();
    sub_246568C38(&qword_268F8BDA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C160);
  }
  return result;
}

unint64_t sub_24656A490()
{
  unint64_t result = qword_268F8C168;
  if (!qword_268F8C168)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C170);
    sub_24656A530();
    sub_246561BA4(&qword_268F8C198, &qword_268F8C1A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C168);
  }
  return result;
}

unint64_t sub_24656A530()
{
  unint64_t result = qword_268F8C178;
  if (!qword_268F8C178)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C180);
    sub_24656A754(&qword_268F8BFD0, &qword_268F8BFD8, (void (*)(void))sub_246568948);
    sub_246561BA4(&qword_268F8C188, &qword_268F8C190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C178);
  }
  return result;
}

uint64_t sub_24656A5FC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_24656A60C()
{
  unint64_t result = qword_268F8C1B0;
  if (!qword_268F8C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C1B0);
  }
  return result;
}

uint64_t sub_24656A660()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_24656A670()
{
  return sub_246565454(*(double *)(v0 + 24));
}

unint64_t sub_24656A67C()
{
  unint64_t result = qword_268F8C1C0;
  if (!qword_268F8C1C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C1B8);
    sub_24656A754(&qword_268F8C1C8, &qword_268F8C1D0, (void (*)(void))sub_24656A7D0);
    sub_246568C38(&qword_268F8BDA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C1C0);
  }
  return result;
}

uint64_t sub_24656A754(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_24656A7D0()
{
  unint64_t result = qword_268F8C1D8;
  if (!qword_268F8C1D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C1E0);
    sub_246561BA4(&qword_268F8C1E8, &qword_268F8C1F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C1D8);
  }
  return result;
}

unint64_t sub_24656A870()
{
  unint64_t result = qword_268F8C200;
  if (!qword_268F8C200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C200);
  }
  return result;
}

uint64_t sub_24656A8C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = *(void *)(a1 + 104);
  uint64_t v9 = *(void *)(a1 + 128);
  uint64_t v10 = *(void *)(a1 + 120);
  uint64_t v16 = *(void *)(a1 + 208);
  uint64_t v17 = *(void *)(a1 + 200);
  uint64_t v15 = *(void *)(a1 + 216);
  uint64_t v14 = *(void *)(a1 + 224);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 40);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 136);
  unsigned __int8 v13 = *(unsigned char *)(a1 + 232);
  swift_release();
  sub_24656AA04(v2, v3, v4, v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24656AA04(v12, v11, v10, v9, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24656AA04(v17, v16, v15, v14, v13);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_24656AA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24656AA1C()
{
  return sub_246565DB4();
}

uint64_t sub_24656AA2C()
{
  return sub_246565E08();
}

uint64_t sub_24656AA38()
{
  return sub_246565E64();
}

uint64_t sub_24656AA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24656AA58()
{
  return sub_2465663D0();
}

uint64_t sub_24656AA64()
{
  return sub_24656AC64((uint64_t (*)(uint64_t))sub_246566424);
}

uint64_t objectdestroy_67Tm()
{
  uint64_t v1 = (int *)type metadata accessor for OfferView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_246552EF4(*(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v6 = v0 + v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24659D5D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v2 | 7;
  uint64_t v9 = v3 + v4;
  sub_246568410();
  swift_release();
  swift_release();
  uint64_t v10 = v5 + v1[9];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(v5 + v1[10], v11);

  return MEMORY[0x270FA0238](v0, v9, v8);
}

uint64_t sub_24656AC4C()
{
  return sub_24656AC64((uint64_t (*)(uint64_t))sub_246566490);
}

uint64_t sub_24656AC64(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for OfferView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_24656ACD8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_24656ACF8()
{
  unint64_t result = qword_268F8C210;
  if (!qword_268F8C210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C210);
  }
  return result;
}

uint64_t ViewServiceContext.deinit()
{
  return v0;
}

uint64_t ViewServiceContext.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ViewServiceContext()
{
  return self;
}

uint64_t method lookup function for ViewServiceContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ViewServiceContext);
}

uint64_t ManagedAppCellViewModel.name.getter()
{
  return sub_24656AFF8();
}

uint64_t sub_24656ADCC@<X0>(void *a1@<X8>)
{
  return sub_24656B078(a1);
}

uint64_t sub_24656ADE4()
{
  return sub_24656B10C();
}

uint64_t ManagedAppCellViewModel.name.setter()
{
  return sub_24656B1A4();
}

void (*ManagedAppCellViewModel.name.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_24656AE9C;
}

uint64_t ManagedAppCellViewModel.$name.getter()
{
  return sub_24656C2B0((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_268F8C238);
}

uint64_t ManagedAppCellViewModel.$name.setter(uint64_t a1)
{
  return sub_24656C520(a1, &qword_268F8C240, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_268F8C238);
}

void (*ManagedAppCellViewModel.$name.modify(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C240);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C238);
  sub_24659D188();
  swift_endAccess();
  return sub_24656AFE0;
}

uint64_t ManagedAppCellViewModel.subtitle.getter()
{
  return sub_24656AFF8();
}

uint64_t sub_24656AFF8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24656B064@<X0>(void *a1@<X8>)
{
  return sub_24656B078(a1);
}

uint64_t sub_24656B078@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24656B0F8()
{
  return sub_24656B10C();
}

uint64_t sub_24656B10C()
{
  return sub_24659D1C8();
}

uint64_t ManagedAppCellViewModel.subtitle.setter()
{
  return sub_24656B1A4();
}

uint64_t sub_24656B1A4()
{
  return sub_24659D1C8();
}

void (*ManagedAppCellViewModel.subtitle.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_24656AE9C;
}

uint64_t ManagedAppCellViewModel.$subtitle.getter()
{
  return sub_24656C2B0((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_268F8C238);
}

uint64_t ManagedAppCellViewModel.$subtitle.setter(uint64_t a1)
{
  return sub_24656C520(a1, &qword_268F8C240, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_268F8C238);
}

void (*ManagedAppCellViewModel.$subtitle.modify(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C240);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C238);
  sub_24659D188();
  swift_endAccess();
  return sub_24656AFE0;
}

uint64_t ManagedAppCellViewModel.iconImageURL.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();

  return swift_release();
}

uint64_t sub_24656B460()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();

  return swift_release();
}

uint64_t sub_24656B4E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_246561BE8(a1, (uint64_t)&v9 - v6, &qword_268F8BD48);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246561BE8((uint64_t)v7, (uint64_t)v5, &qword_268F8BD48);
  swift_retain();
  sub_24659D1C8();
  return sub_246555440((uint64_t)v7, &qword_268F8BD48);
}

uint64_t ManagedAppCellViewModel.iconImageURL.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246561BE8(a1, (uint64_t)v4, &qword_268F8BD48);
  swift_retain();
  sub_24659D1C8();
  return sub_246555440(a1, &qword_268F8BD48);
}

void (*ManagedAppCellViewModel.iconImageURL.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_24656AE9C;
}

uint64_t ManagedAppCellViewModel.$iconImageURL.getter()
{
  return sub_24656C2B0((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_268F8C258);
}

uint64_t ManagedAppCellViewModel.$iconImageURL.setter(uint64_t a1)
{
  return sub_24656C520(a1, &qword_268F8C260, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_268F8C258);
}

void (*ManagedAppCellViewModel.$iconImageURL.modify(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C260);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C258);
  sub_24659D188();
  swift_endAccess();
  return sub_24656AFE0;
}

uint64_t ManagedAppCellViewModel.style.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();

  return swift_release();
}

uint64_t sub_24656B910@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24656B994()
{
  return sub_24659D1C8();
}

uint64_t ManagedAppCellViewModel.style.setter()
{
  return sub_24659D1C8();
}

void (*ManagedAppCellViewModel.style.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_24656AE9C;
}

uint64_t ManagedAppCellViewModel.$style.getter()
{
  return sub_24656C2B0((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_268F8C270);
}

uint64_t ManagedAppCellViewModel.$style.setter(uint64_t a1)
{
  return sub_24656C520(a1, &qword_268F8C278, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_268F8C270);
}

void (*ManagedAppCellViewModel.$style.modify(void *a1))(uint64_t, char)
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C278);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C270);
  sub_24659D188();
  swift_endAccess();
  return sub_24656AFE0;
}

uint64_t ManagedAppCellViewModel.offerState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();

  return swift_release();
}

double sub_24656BCC0@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_24656BD4C(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246558E9C(v1, v2, v3);
  swift_retain();
  return sub_24659D1C8();
}

uint64_t ManagedAppCellViewModel.offerState.setter()
{
  return sub_24659D1C8();
}

void (*ManagedAppCellViewModel.offerState.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_24656AE9C;
}

uint64_t ManagedAppCellViewModel.$offerState.getter()
{
  return sub_24656C2B0((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_268F8C288);
}

uint64_t ManagedAppCellViewModel.$offerState.setter(uint64_t a1)
{
  return sub_24656C520(a1, &qword_268F8C290, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_268F8C288);
}

void (*ManagedAppCellViewModel.$offerState.modify(void *a1))(uint64_t, char)
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C290);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C288);
  sub_24659D188();
  swift_endAccess();
  return sub_24656AFE0;
}

uint64_t ManagedAppCellViewModel.isInitial.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24656C0A4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24659D1B8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24656C128()
{
  return sub_24659D1C8();
}

uint64_t ManagedAppCellViewModel.isInitial.setter()
{
  return sub_24659D1C8();
}

void (*ManagedAppCellViewModel.isInitial.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24659D1A8();
  return sub_24656AE9C;
}

uint64_t ManagedAppCellViewModel.$isInitial.getter()
{
  return sub_24656C2B0((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_268F8C2A0);
}

uint64_t sub_24656C2B0(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_24656C318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_24656C388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unsigned __int8 v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_24659D198();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t ManagedAppCellViewModel.$isInitial.setter(uint64_t a1)
{
  return sub_24656C520(a1, &qword_268F8C2A8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_268F8C2A0);
}

uint64_t sub_24656C520(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_24659D198();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

void (*ManagedAppCellViewModel.$isInitial.modify(void *a1))(uint64_t, char)
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2A8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2A0);
  sub_24659D188();
  swift_endAccess();
  return sub_24656AFE0;
}

uint64_t ManagedAppCellViewModel.offerAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerAction);
  swift_retain();
  return v1;
}

uint64_t sub_24656C79C()
{
  uint64_t v1 = 0;
  uint64_t result = MEMORY[0x24C52FEA0](&v1, 8);
  qword_268F8C218 = v1 << 32;
  qword_268F8C220 = 0;
  byte_268F8C228 = 0;
  return result;
}

uint64_t ManagedAppCellViewModel.__allocating_init(exportedObject:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ManagedAppCellViewModel.init(exportedObject:)(a1);
  return v2;
}

void *ManagedAppCellViewModel.init(exportedObject:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v161 = *v1;
  uint64_t v162 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2B0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v151 = v3;
  uint64_t v152 = v4;
  MEMORY[0x270FA5388](v3);
  long long v149 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2B8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v153 = v6;
  uint64_t v154 = v7;
  MEMORY[0x270FA5388](v6);
  long long v150 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2C0);
  uint64_t v148 = *(void *)(v147 - 8);
  MEMORY[0x270FA5388](v147);
  long long v146 = (char *)&v111 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2C8);
  MEMORY[0x270FA5388](v10 - 8);
  long long v160 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = sub_24659DF78();
  uint64_t v166 = *(void *)(v163 - 8);
  MEMORY[0x270FA5388](v163);
  long long v159 = (char *)&v111 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2D0);
  uint64_t v143 = *(void *)(v142 - 8);
  MEMORY[0x270FA5388](v142);
  long long v140 = (char *)&v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2D8);
  uint64_t v145 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  long long v141 = (char *)&v111 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C290);
  uint64_t v138 = *(void *)(v139 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v139);
  uint64_t v137 = (char *)&v111 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v134 = (char *)&v111 - v17;
  uint64_t v135 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2E0);
  uint64_t v136 = *(v135 - 1);
  MEMORY[0x270FA5388](v135);
  uint64_t v132 = (char *)&v111 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2E8);
  uint64_t v130 = *(void *)(v129 - 8);
  MEMORY[0x270FA5388](v129);
  uint64_t v128 = (char *)&v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C278);
  uint64_t v126 = *(void *)(v127 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v127);
  uint64_t v125 = (char *)&v111 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v124 = (char *)&v111 - v22;
  uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBE0);
  uint64_t v165 = *(void *)(v156 - 8);
  MEMORY[0x270FA5388](v156);
  long long v155 = (char *)&v111 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2F0);
  uint64_t v123 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  uint64_t v117 = (char *)&v111 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2F8);
  MEMORY[0x270FA5388](v25 - 8);
  v164 = (char *)&v111 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C300);
  MEMORY[0x270FA5388](v27 - 8);
  long long v167 = (char *)&v111 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2A0);
  uint64_t v133 = *(void *)(v158 - 8);
  MEMORY[0x270FA5388](v158);
  uint64_t v131 = (char *)&v111 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C288);
  uint64_t v121 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  uint64_t v120 = (char *)&v111 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C270);
  uint64_t v119 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  uint64_t v118 = (char *)&v111 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C258);
  uint64_t v114 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388](v116);
  uint64_t v112 = (char *)&v111 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  uint64_t v33 = MEMORY[0x270FA5388](v111);
  long long v35 = (char *)&v111 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v111 - v36;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C238);
  uint64_t v39 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  long long v41 = (char *)&v111 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = (char *)v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name;
  *(void *)&long long v169 = 0;
  *((void *)&v169 + 1) = 0xE000000000000000;
  sub_24659D178();
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
  v43(v42, v41, v38);
  uint64_t v44 = (char *)v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle;
  *(void *)&long long v169 = 0;
  *((void *)&v169 + 1) = 0xE000000000000000;
  sub_24659D178();
  v43(v44, v41, v38);
  uint64_t v45 = (char *)v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL;
  uint64_t v46 = sub_24659CE68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v37, 1, 1, v46);
  sub_246561BE8((uint64_t)v37, (uint64_t)v35, &qword_268F8BD48);
  uint64_t v47 = v112;
  sub_24659D178();
  sub_246555440((uint64_t)v37, &qword_268F8BD48);
  (*(void (**)(char *, char *, uint64_t))(v114 + 32))(v45, v47, v116);
  uint64_t v48 = (char *)v2 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style;
  LOBYTE(v169) = 1;
  uint64_t v49 = v118;
  sub_24659D178();
  (*(void (**)(char *, char *, uint64_t))(v119 + 32))(v48, v49, v113);
  uint64_t v50 = (char *)v2 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState;
  long long v169 = xmmword_24659F5F0;
  char v170 = 2;
  uint64_t v51 = v120;
  sub_24659D178();
  (*(void (**)(char *, char *, uint64_t))(v121 + 32))(v50, v51, v157);
  uint64_t v52 = (char *)v2 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial;
  LOBYTE(v169) = 1;
  uint64_t v53 = v131;
  sub_24659D178();
  (*(void (**)(char *, char *, uint64_t))(v133 + 32))(v52, v53, v158);
  *(void *)((char *)v2
            + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_appStateSubscription) = 0;
  *(void *)((char *)v2 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_subscriptions) = MEMORY[0x263F8EE88];
  uint64_t v54 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_viewBoundsSubject;
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C320);
  swift_allocObject();
  *(void *)((char *)v2 + v54) = sub_24659D138();
  uint64_t v55 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerFrameSubject;
  uint64_t v131 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C330);
  swift_allocObject();
  *(void *)((char *)v2 + v55) = sub_24659D138();
  uint64_t v56 = sub_24659CFE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v167, 1, 1, v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C338);
  swift_allocObject();
  long long v167 = (char *)sub_24659D168();
  uint64_t v57 = sub_24659CF58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v164, 1, 1, v57);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C340);
  swift_allocObject();
  v164 = (char *)sub_24659D168();
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C348);
  swift_allocObject();
  uint64_t v58 = sub_24659D138();
  uint64_t v59 = (uint64_t (**)())((char *)v2
                       + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerAction);
  void *v59 = sub_24656E450;
  v59[1] = (uint64_t (*)())v58;
  uint64_t v158 = v58;
  uint64_t v120 = (char *)(v162 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration);
  swift_beginAccess();
  swift_retain();
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BBD8);
  uint64_t v60 = v155;
  sub_24659D188();
  swift_endAccess();
  uint64_t v119 = sub_246561BA4(&qword_268F8C350, &qword_268F8BBE0);
  uint64_t v61 = v117;
  uint64_t v62 = v156;
  sub_24659D1F8();
  uint64_t v63 = *(char **)(v165 + 8);
  v165 += 8;
  uint64_t v118 = v63;
  ((void (*)(char *, uint64_t))v63)(v60, v62);
  swift_beginAccess();
  uint64_t v64 = v124;
  sub_24659D188();
  swift_endAccess();
  sub_246561BA4(&qword_268F8C358, &qword_268F8C2F0);
  uint64_t v65 = v122;
  sub_24659D228();
  (*(void (**)(char *, uint64_t))(v123 + 8))(v61, v65);
  uint64_t v66 = v126;
  uint64_t v67 = v127;
  (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v125, v64, v127);
  swift_beginAccess();
  sub_24659D198();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v64, v67);
  long long v168 = v167;
  swift_beginAccess();
  swift_retain();
  sub_24659D188();
  swift_endAccess();
  sub_246561BA4(&qword_268F8C360, &qword_268F8C338);
  sub_246561BA4(&qword_268F8C368, &qword_268F8C278);
  uint64_t v68 = v128;
  sub_24659D0D8();
  uint64_t v69 = swift_allocObject();
  swift_weakInit();
  uint64_t v70 = swift_allocObject();
  *(void *)(v70 + 16) = sub_24656E928;
  *(void *)(v70 + 24) = v69;
  uint64_t v127 = MEMORY[0x263EFDA08];
  sub_246561BA4(&qword_268F8C370, &qword_268F8C2E8);
  uint64_t v71 = v129;
  sub_24659D218();
  swift_release();
  (*(void (**)(char *, uint64_t))(v130 + 8))(v68, v71);
  uint64_t v115 = v2;
  swift_beginAccess();
  sub_24659D0E8();
  swift_endAccess();
  swift_release();
  uint64_t v72 = v164;
  *(void *)&long long v169 = v164;
  sub_246561BA4(&qword_268F8C378, &qword_268F8C340);
  uint64_t v73 = v132;
  sub_24659D1E8();
  swift_beginAccess();
  uint64_t v74 = v134;
  sub_24659D188();
  swift_endAccess();
  uint64_t v130 = MEMORY[0x263EFDA38];
  sub_246561BA4(&qword_268F8C380, &qword_268F8C2E0);
  uint64_t v75 = v135;
  sub_24659D228();
  (*(void (**)(char *, void *))(v136 + 8))(v73, v75);
  uint64_t v76 = v138;
  uint64_t v77 = v139;
  (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v137, v74, v139);
  swift_beginAccess();
  sub_24659D198();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v74, v77);
  *(void *)&long long v169 = v158;
  uint64_t v78 = swift_allocObject();
  *(void *)(v78 + 16) = v167;
  *(void *)(v78 + 24) = v72;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C388);
  uint64_t v157 = MEMORY[0x263EFDD88];
  sub_246561BA4(&qword_268F8C390, &qword_268F8C348);
  uint64_t v79 = v140;
  sub_24659D1E8();
  swift_release();
  long long v80 = v159;
  sub_24659DF68();
  uint64_t v134 = (char *)sub_246557B20();
  *(void *)&long long v169 = sub_24659DF88();
  uint64_t v138 = sub_24659DF48();
  uint64_t v81 = *(void *)(v138 - 8);
  uint64_t v137 = *(char **)(v81 + 56);
  uint64_t v139 = v81 + 56;
  uint64_t v82 = (uint64_t)v160;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v137)(v160, 1, 1, v138);
  sub_246561BA4(&qword_268F8C398, &qword_268F8C2D0);
  uint64_t v136 = sub_246574FB4(&qword_268F8C3A0, (void (*)(uint64_t))sub_246557B20);
  long long v83 = v141;
  uint64_t v84 = v142;
  sub_24659D208();
  sub_246555440(v82, &qword_268F8C2C8);

  long long v85 = *(void **)(v166 + 8);
  v166 += 8;
  uint64_t v135 = v85;
  ((void (*)(char *, uint64_t))v85)(v80, v163);
  (*(void (**)(char *, uint64_t))(v143 + 8))(v79, v84);
  uint64_t v86 = swift_allocObject();
  uint64_t v87 = v161;
  *(void *)(v86 + 16) = v161;
  uint64_t v143 = MEMORY[0x263EFDC48];
  sub_246561BA4(&qword_268F8C3A8, &qword_268F8C2D8);
  uint64_t v88 = v144;
  sub_24659D218();
  swift_release();
  (*(void (**)(char *, uint64_t))(v145 + 8))(v83, v88);
  swift_beginAccess();
  sub_24659D0E8();
  swift_endAccess();
  swift_release();
  uint64_t v89 = swift_allocObject();
  *(void *)(v89 + 16) = 0;
  swift_beginAccess();
  uint64_t v90 = v155;
  sub_24659D188();
  swift_endAccess();
  uint64_t v91 = v146;
  uint64_t v92 = v156;
  sub_24659D1E8();
  ((void (*)(char *, uint64_t))v118)(v90, v92);
  uint64_t v93 = swift_allocObject();
  uint64_t v94 = v115;
  swift_weakInit();
  long long v95 = (void *)swift_allocObject();
  v95[2] = v89;
  v95[3] = v93;
  uint64_t v96 = v162;
  long long v97 = v167;
  v95[4] = v162;
  v95[5] = v97;
  v95[6] = v164;
  v95[7] = v87;
  sub_246561BA4(&qword_268F8C3B0, &qword_268F8C2C0);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v98 = v147;
  sub_24659D218();
  swift_release();
  (*(void (**)(char *, uint64_t))(v148 + 8))(v91, v98);
  swift_beginAccess();
  sub_24659D0E8();
  swift_endAccess();
  swift_release();
  uint64_t v99 = *(void *)((char *)v94
                  + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_viewBoundsSubject);
  long long v168 = *(char **)((char *)v94
                  + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerFrameSubject);
  *(void *)&long long v169 = v99;
  sub_246561BA4(&qword_268F8C3B8, &qword_268F8C320);
  sub_246561BA4(&qword_268F8C3C0, &qword_268F8C330);
  swift_retain();
  swift_retain();
  long long v100 = v149;
  sub_24659D0D8();
  long long v101 = v159;
  sub_24659DF58();
  *(void *)&long long v169 = sub_24659DF88();
  long long v102 = v160;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v137)(v160, 1, 1, v138);
  sub_246561BA4(&qword_268F8C3C8, &qword_268F8C2B0);
  uint64_t v103 = v150;
  uint64_t v104 = (uint64_t)v102;
  uint64_t v105 = v151;
  sub_24659D208();
  sub_246555440(v104, &qword_268F8C2C8);

  ((void (*)(char *, uint64_t))v135)(v101, v163);
  (*(void (**)(char *, uint64_t))(v152 + 8))(v100, v105);
  uint64_t v106 = swift_allocObject();
  uint64_t v107 = v161;
  *(void *)(v106 + 16) = v96;
  *(void *)(v106 + 24) = v107;
  uint64_t v108 = swift_allocObject();
  *(void *)(v108 + 16) = sub_246574004;
  *(void *)(v108 + 24) = v106;
  sub_246561BA4(&qword_268F8C3D0, &qword_268F8C2B8);
  swift_retain();
  uint64_t v109 = v153;
  sub_24659D218();
  swift_release();
  (*(void (**)(char *, uint64_t))(v154 + 8))(v103, v109);
  swift_beginAccess();
  sub_24659D0E8();
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v94;
}

uint64_t sub_24656E450()
{
  return sub_24659D128();
}

uint64_t sub_24656E484@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  if (*(void *)(result + 8)) {
    *a2 = *(unsigned char *)(result + 16);
  }
  else {
    *a2 = 1;
  }
  return result;
}

uint64_t sub_24656E4A4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24656E4DC(uint64_t a1, char *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C300);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24659CFE8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a2;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_246561BE8(a1, (uint64_t)v12, &qword_268F8C300);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      swift_release();
      return sub_246555440((uint64_t)v12, &qword_268F8C300);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      uint64_t v19 = sub_24659CF78();
      unint64_t v21 = v20;
      swift_getKeyPath();
      uint64_t v29 = v17;
      swift_getKeyPath();
      uint64_t v30 = v19;
      unint64_t v31 = v21;
      swift_retain();
      sub_24659D1C8();
      if (v29 == 2) {
        uint64_t v22 = sub_24659CFB8();
      }
      else {
        uint64_t v22 = sub_24659CFD8();
      }
      if (v23) {
        uint64_t v24 = v22;
      }
      else {
        uint64_t v24 = 0;
      }
      if (v23) {
        unint64_t v25 = v23;
      }
      else {
        unint64_t v25 = 0xE000000000000000;
      }
      uint64_t v26 = HIBYTE(v25) & 0xF;
      if ((v25 & 0x2000000000000000) == 0) {
        uint64_t v26 = v24 & 0xFFFFFFFFFFFFLL;
      }
      if (!v26)
      {
        swift_bridgeObjectRelease();
        uint64_t v27 = *(void *)(sub_24659CFA8() + 16);
        swift_bridgeObjectRelease();
        if (v27)
        {
          uint64_t v30 = sub_24659CFA8();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C488);
          sub_246561BA4(&qword_268F8C490, &qword_268F8C488);
          uint64_t v24 = sub_24659DD88();
          unint64_t v25 = v28;
          swift_bridgeObjectRelease();
        }
        else
        {
          unint64_t v25 = 0xE100000000000000;
          uint64_t v24 = 32;
        }
      }
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v30 = v24;
      unint64_t v31 = v25;
      swift_retain();
      sub_24659D1C8();
      sub_24659CFC8();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_246561BE8((uint64_t)v9, (uint64_t)v7, &qword_268F8BD48);
      swift_retain();
      sub_24659D1C8();
      sub_246555440((uint64_t)v9, &qword_268F8BD48);
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v30) = 0;
      sub_24659D1C8();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
  }
  return result;
}

uint64_t sub_24656E928(uint64_t a1, char *a2)
{
  return sub_24656E4DC(a1, a2);
}

uint64_t sub_24656E930()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24656E968(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C480);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_24656E9B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24659CF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2F8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246561BE8(a1, (uint64_t)v13, &qword_268F8C2F8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4);
  if (result == 1)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = -1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v13, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    ManagedContentOfferState.init(appState:)((uint64_t)v8, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return result;
}

uint64_t sub_24656EB84@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2F8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24659CF58();
  uint64_t v22 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C300);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24659CFE8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24659D158();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_246555440((uint64_t)v10, &qword_268F8C300);
LABEL_5:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C388);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 1, 1, v16);
  }
  unint64_t v21 = a1;
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v15(v14, v10, v11);
  sub_24659D158();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v4, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    sub_246555440((uint64_t)v4, &qword_268F8C2F8);
    a1 = v21;
    goto LABEL_5;
  }
  uint64_t v22 = *(void *)(v22 + 32);
  ((void (*)(char *, char *, uint64_t))v22)(v7, v4, v5);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C388);
  uint64_t v19 = v21;
  unint64_t v20 = &v21[*(int *)(v18 + 48)];
  v15(v21, v14, v11);
  ((void (*)(char *, char *, uint64_t))v22)(v20, v7, v5);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v19, 0, 1, v18);
}

uint64_t sub_24656EF04()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24656EF44@<X0>(char *a1@<X8>)
{
  return sub_24656EB84(a1);
}

uint64_t sub_24656EF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAE8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v56 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C388);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24659CF58();
  uint64_t v10 = *(void **)(v9 - 8);
  uint64_t v51 = v10[8];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v55 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v53 = (char *)&v43 - v13;
  uint64_t v14 = sub_24659CFE8();
  uint64_t v50 = *(void *)(*(void *)(v14 - 8) + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v46 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v43 - v17;
  uint64_t v19 = *(int *)(v6 + 56);
  unint64_t v20 = &v8[v19];
  uint64_t v21 = a1 + v19;
  uint64_t v23 = v22;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v22 + 16);
  uint64_t v24 = a1;
  uint64_t v26 = v25;
  v45(v8, v24);
  uint64_t v54 = v10;
  uint64_t v43 = (void (*)(char *, uint64_t, uint64_t))v10[2];
  v43(v20, v21, v9);
  uint64_t v27 = *(void (**)(unint64_t, char *, uint64_t))(v23 + 32);
  uint64_t v48 = v18;
  uint64_t v49 = v27;
  v27((unint64_t)v18, v8, v26);
  uint64_t v47 = (void (*)(char *, char *, uint64_t))v10[4];
  unint64_t v28 = v53;
  uint64_t v44 = v9;
  v47(v53, v20, v9);
  uint64_t v29 = sub_24659DE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v56, 1, 1, v29);
  v43(v55, (uint64_t)v28, v9);
  uint64_t v30 = v46;
  unint64_t v31 = v18;
  uint64_t v32 = v26;
  ((void (*)(char *, char *, uint64_t))v45)(v46, v31, v26);
  sub_24659DE08();
  uint64_t v33 = sub_24659DDF8();
  unint64_t v34 = (*((unsigned __int8 *)v54 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v54 + 80);
  uint64_t v35 = v23;
  unint64_t v36 = (v51 + *(unsigned __int8 *)(v23 + 80) + v34) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v37 = (v50 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = MEMORY[0x263F8F500];
  *(void *)(v38 + 16) = v33;
  *(void *)(v38 + 24) = v39;
  unint64_t v40 = v38 + v34;
  uint64_t v41 = v44;
  v47((char *)v40, v55, v44);
  v49(v38 + v36, v30, v32);
  *(void *)(v38 + v37) = v52;
  sub_246551CC0(v56, (uint64_t)&unk_268F8C478, v38);
  swift_release();
  ((void (*)(char *, uint64_t))v54[1])(v53, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v48, v32);
}

uint64_t sub_24656F3AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24656F3BC(uint64_t a1)
{
  return sub_24656EF4C(a1, *(void *)(v1 + 16));
}

uint64_t sub_24656F3C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24656F3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = sub_24659CFE8();
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  uint64_t v7 = sub_24659CF58();
  v5[23] = v7;
  v5[24] = *(void *)(v7 - 8);
  v5[25] = swift_task_alloc();
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  sub_24659DE08();
  v5[29] = sub_24659DDF8();
  uint64_t v9 = sub_24659DDD8();
  v5[30] = v9;
  v5[31] = v8;
  return MEMORY[0x270FA2498](sub_24656F590, v9, v8);
}

uint64_t sub_24656F590()
{
  uint64_t v82 = v0;
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  os_log_t loga = *(os_log_t *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v8 = sub_24659D0C8();
  *(void *)(v0 + 256) = __swift_project_value_buffer(v8, (uint64_t)qword_268F8EDD0);
  uint64_t v9 = *(void (**)(uint64_t, void, uint64_t))(v4 + 16);
  *(void *)(v0 + 264) = v9;
  *(void *)(v0 + 272) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v76 = v9;
  v9(v2, v1, v3);
  uint64_t v10 = *(void (**)(os_log_t, uint64_t, uint64_t))(v6 + 16);
  *(void *)(v0 + 280) = v10;
  *(void *)(v0 + 288) = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(loga, v7, v5);
  uint64_t v11 = sub_24659D0A8();
  os_log_type_t v12 = sub_24659DF38();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v79 = v14;
    *(_DWORD *)uint64_t v13 = 136315650;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    uint64_t v15 = qword_268F8C218;
    log = v11;
    os_log_type_t v73 = v12;
    uint64_t v72 = v14;
    if (byte_268F8C228 == 1)
    {
      unint64_t v16 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v22 = HIDWORD(qword_268F8C218);
      uint64_t v80 = 0;
      unint64_t v81 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 376) = v22;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v15 = v80;
      unint64_t v16 = v81;
    }
    uint64_t v23 = *(void *)(v0 + 224);
    uint64_t v25 = *(void *)(v0 + 184);
    uint64_t v24 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 152);
    uint64_t v67 = *(void *)(v0 + 176);
    uint64_t v69 = *(void *)(v0 + 144);
    *(void *)(v0 + 120) = sub_2465574C8(v15, v16, &v79);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
    uint64_t v27 = sub_24659E148();
    *(void *)(v0 + 64) = sub_2465574C8(v27, v28, &v79);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v20(v23, v25);
    *(_WORD *)(v13 + 22) = 2080;
    uint64_t v29 = sub_24659CF78();
    *(void *)(v0 + 88) = sub_2465574C8(v29, v30, &v79);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v21(v67, v69);
    _os_log_impl(&dword_24654E000, log, v73, "[%s] Receieved offer action for:%s on %s.", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v72, -1, -1);
    MEMORY[0x24C52FE90](v13, -1, -1);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 144);
    uint64_t v19 = *(void *)(v0 + 152);
    unint64_t v20 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 192) + 8);
    v20(*(void *)(v0 + 224), *(void *)(v0 + 184));
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v21(v17, v18);
  }
  *(void *)(v0 + 296) = v21;
  *(void *)(v0 + 304) = v20;
  uint64_t v31 = *(void *)(v0 + 216);
  uint64_t v32 = *(void *)(v0 + 184);
  uint64_t v33 = *(void *)(v0 + 192);
  v76(v31, *(void *)(v0 + 128), v32);
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 88))(v31, v32);
  if (v34 == *MEMORY[0x263F10700])
  {
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 96))(*(void *)(v0 + 216), *(void *)(v0 + 184));
    swift_release();
    sub_24659D078();
    *(void *)(v0 + 328) = sub_24659D048();
    uint64_t v35 = (void *)swift_task_alloc();
    *(void *)(v0 + 336) = v35;
    *uint64_t v35 = v0;
    v35[1] = sub_246570610;
    uint64_t v36 = *(void *)(v0 + 136);
    return MEMORY[0x270EF5708](v36);
  }
  int v37 = v34;
  if (v34 == *MEMORY[0x263F106C0])
  {
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 96))(*(void *)(v0 + 216), *(void *)(v0 + 184));
    swift_release();
    sub_24659D078();
    *(void *)(v0 + 352) = sub_24659D048();
    uint64_t v38 = (void *)swift_task_alloc();
    *(void *)(v0 + 360) = v38;
    *uint64_t v38 = v0;
    v38[1] = sub_24657072C;
    uint64_t v39 = *(void *)(v0 + 136);
    return MEMORY[0x270EF5700](v39);
  }
  if (v34 == *MEMORY[0x263F106E8])
  {
    uint64_t v40 = *(void *)(v0 + 216);
    uint64_t v41 = *(void *)(v0 + 184);
    uint64_t v42 = *(void *)(v0 + 192);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v42 + 96))(v40, v41);
LABEL_22:
    swift_release();
LABEL_23:
    uint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
    uint64_t v44 = *(void *)(v0 + 168);
    uint64_t v46 = *(void *)(v0 + 136);
    uint64_t v45 = *(void *)(v0 + 144);
    (*(void (**)(void, void, void))(v0 + 264))(*(void *)(v0 + 208), *(void *)(v0 + 128), *(void *)(v0 + 184));
    v43(v44, v46, v45);
    uint64_t v47 = sub_24659D0A8();
    os_log_type_t v48 = sub_24659DF38();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      uint64_t v79 = v77;
      *(_DWORD *)uint64_t v49 = 136315650;
      if (qword_268F8B960 != -1) {
        swift_once();
      }
      os_log_type_t v78 = v48;
      uint64_t v50 = qword_268F8C218;
      if (byte_268F8C228 == 1)
      {
        unint64_t v51 = qword_268F8C220;
        swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v56 = HIDWORD(qword_268F8C218);
        uint64_t v80 = 0;
        unint64_t v81 = 0xE000000000000000;
        sub_24659DD58();
        swift_bridgeObjectRelease();
        *(_DWORD *)(v0 + 384) = v56;
        sub_246554E28();
        sub_24659DD78();
        sub_24659DD58();
        swift_bridgeObjectRelease();
        uint64_t v50 = v80;
        unint64_t v51 = v81;
      }
      uint64_t v57 = *(void *)(v0 + 208);
      uint64_t v58 = *(void *)(v0 + 184);
      uint64_t v59 = *(void *)(v0 + 168);
      uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
      uint64_t v70 = *(void *)(v0 + 144);
      uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
      *(void *)(v0 + 40) = sub_2465574C8(v50, v51, &v79);
      sub_24659DFE8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
      uint64_t v60 = sub_24659E148();
      *(void *)(v0 + 48) = sub_2465574C8(v60, v61, &v79);
      sub_24659DFE8();
      swift_bridgeObjectRelease();
      v68(v57, v58);
      *(_WORD *)(v49 + 22) = 2080;
      uint64_t v62 = sub_24659CF78();
      *(void *)(v0 + 56) = sub_2465574C8(v62, v63, &v79);
      sub_24659DFE8();
      swift_bridgeObjectRelease();
      v71(v59, v70);
      _os_log_impl(&dword_24654E000, v47, v78, "[%s] Offer action for:%s on %s completed.", (uint8_t *)v49, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v77, -1, -1);
      MEMORY[0x24C52FE90](v49, -1, -1);
    }
    else
    {
      uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
      uint64_t v53 = *(void *)(v0 + 168);
      uint64_t v54 = *(void *)(v0 + 144);
      (*(void (**)(void, void))(v0 + 304))(*(void *)(v0 + 208), *(void *)(v0 + 184));
      v52(v53, v54);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v64 = *(uint64_t (**)(void))(v0 + 8);
    return v64();
  }
  if (v34 == *MEMORY[0x263F10708]) {
    goto LABEL_22;
  }
  if (v34 != *MEMORY[0x263F106F0])
  {
    int v65 = *MEMORY[0x263F106F8];
    swift_release();
    if (v37 != v65) {
      v20(*(void *)(v0 + 216), *(void *)(v0 + 184));
    }
    goto LABEL_23;
  }
  uint64_t v55 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v55;
  *uint64_t v55 = v0;
  v55[1] = sub_2465700A8;
  return MEMORY[0x270EF5698]();
}

uint64_t sub_2465700A8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 248);
  uint64_t v4 = *(void *)(v2 + 240);
  if (v0) {
    uint64_t v5 = sub_246570848;
  }
  else {
    uint64_t v5 = sub_2465701E4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2465701E4()
{
  uint64_t v31 = v0;
  swift_release();
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  (*(void (**)(void, void, void))(v0 + 264))(*(void *)(v0 + 208), *(void *)(v0 + 128), *(void *)(v0 + 184));
  v1(v2, v4, v3);
  uint64_t v5 = sub_24659D0A8();
  os_log_type_t v6 = sub_24659DF38();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v28 = v26;
    *(_DWORD *)uint64_t v7 = 136315650;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    os_log_type_t v27 = v6;
    uint64_t v8 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v9 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v13 = HIDWORD(qword_268F8C218);
      uint64_t v29 = 0;
      unint64_t v30 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 384) = v13;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v8 = v29;
      unint64_t v9 = v30;
    }
    uint64_t v14 = *(void *)(v0 + 208);
    uint64_t v15 = *(void *)(v0 + 184);
    uint64_t v16 = *(void *)(v0 + 168);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v24 = *(void *)(v0 + 144);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    *(void *)(v0 + 40) = sub_2465574C8(v8, v9, &v28);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
    uint64_t v17 = sub_24659E148();
    *(void *)(v0 + 48) = sub_2465574C8(v17, v18, &v28);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v23(v14, v15);
    *(_WORD *)(v7 + 22) = 2080;
    uint64_t v19 = sub_24659CF78();
    *(void *)(v0 + 56) = sub_2465574C8(v19, v20, &v28);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v25(v16, v24);
    _os_log_impl(&dword_24654E000, v5, v27, "[%s] Offer action for:%s on %s completed.", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v26, -1, -1);
    MEMORY[0x24C52FE90](v7, -1, -1);
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v11 = *(void *)(v0 + 168);
    uint64_t v12 = *(void *)(v0 + 144);
    (*(void (**)(void, void))(v0 + 304))(*(void *)(v0 + 208), *(void *)(v0 + 184));
    v10(v11, v12);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_246570610()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 344) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 240);
    uint64_t v4 = *(void *)(v2 + 248);
    uint64_t v5 = sub_246570D48;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 240);
    uint64_t v4 = *(void *)(v2 + 248);
    uint64_t v5 = sub_2465752F0;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24657072C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 240);
    uint64_t v4 = *(void *)(v2 + 248);
    uint64_t v5 = sub_246571250;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 240);
    uint64_t v4 = *(void *)(v2 + 248);
    uint64_t v5 = sub_2465752F0;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_246570848()
{
  uint64_t v46 = v0;
  uint64_t v1 = *(void **)(v0 + 320);
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 128);
  swift_release();
  v2(v3, v8, v4);
  unint64_t v9 = v1;
  v39(v5, v7, v6);
  id v10 = v1;
  id v11 = v1;
  uint64_t v12 = sub_24659D0A8();
  os_log_type_t v13 = sub_24659DF18();
  log = v12;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v41 = v9;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v43 = v38;
    *(_DWORD *)uint64_t v14 = 136315906;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    os_log_type_t v40 = v13;
    uint64_t v15 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v16 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v23 = HIDWORD(qword_268F8C218);
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 380) = v23;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v15 = v44;
      unint64_t v16 = v45;
    }
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 184);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v36 = *(void *)(v0 + 144);
    int v37 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    *(void *)(v0 + 72) = sub_2465574C8(v15, v16, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
    uint64_t v27 = sub_24659E148();
    *(void *)(v0 + 80) = sub_2465574C8(v27, v28, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v35(v24, v25);
    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v29 = sub_24659CF78();
    *(void *)(v0 + 104) = sub_2465574C8(v29, v30, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v37(v26, v36);
    *(_WORD *)(v14 + 32) = 2080;
    swift_getErrorValue();
    uint64_t v31 = sub_24659E1A8();
    *(void *)(v0 + 112) = sub_2465574C8(v31, v32, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24654E000, log, v40, "[%s] Offer action for:%s on %s failed. %s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v38, -1, -1);
    MEMORY[0x24C52FE90](v14, -1, -1);
  }
  else
  {
    unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 200);
    uint64_t v20 = *(void *)(v0 + 184);
    uint64_t v21 = *(void *)(v0 + 160);
    uint64_t v22 = *(void *)(v0 + 144);

    v17(v19, v20);
    v18(v21, v22);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_246570D48()
{
  uint64_t v46 = v0;
  swift_release();
  uint64_t v1 = *(void **)(v0 + 344);
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 128);
  swift_release();
  v2(v3, v8, v4);
  unint64_t v9 = v1;
  v39(v5, v7, v6);
  id v10 = v1;
  id v11 = v1;
  uint64_t v12 = sub_24659D0A8();
  os_log_type_t v13 = sub_24659DF18();
  log = v12;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v41 = v9;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v43 = v38;
    *(_DWORD *)uint64_t v14 = 136315906;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    os_log_type_t v40 = v13;
    uint64_t v15 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v16 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v23 = HIDWORD(qword_268F8C218);
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 380) = v23;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v15 = v44;
      unint64_t v16 = v45;
    }
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 184);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v36 = *(void *)(v0 + 144);
    int v37 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    *(void *)(v0 + 72) = sub_2465574C8(v15, v16, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
    uint64_t v27 = sub_24659E148();
    *(void *)(v0 + 80) = sub_2465574C8(v27, v28, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v35(v24, v25);
    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v29 = sub_24659CF78();
    *(void *)(v0 + 104) = sub_2465574C8(v29, v30, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v37(v26, v36);
    *(_WORD *)(v14 + 32) = 2080;
    swift_getErrorValue();
    uint64_t v31 = sub_24659E1A8();
    *(void *)(v0 + 112) = sub_2465574C8(v31, v32, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24654E000, log, v40, "[%s] Offer action for:%s on %s failed. %s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v38, -1, -1);
    MEMORY[0x24C52FE90](v14, -1, -1);
  }
  else
  {
    unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 200);
    uint64_t v20 = *(void *)(v0 + 184);
    uint64_t v21 = *(void *)(v0 + 160);
    uint64_t v22 = *(void *)(v0 + 144);

    v17(v19, v20);
    v18(v21, v22);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_246571250()
{
  uint64_t v46 = v0;
  swift_release();
  uint64_t v1 = *(void **)(v0 + 368);
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 128);
  swift_release();
  v2(v3, v8, v4);
  unint64_t v9 = v1;
  v39(v5, v7, v6);
  id v10 = v1;
  id v11 = v1;
  uint64_t v12 = sub_24659D0A8();
  os_log_type_t v13 = sub_24659DF18();
  log = v12;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v41 = v9;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v43 = v38;
    *(_DWORD *)uint64_t v14 = 136315906;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    os_log_type_t v40 = v13;
    uint64_t v15 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v16 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v23 = HIDWORD(qword_268F8C218);
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 380) = v23;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v15 = v44;
      unint64_t v16 = v45;
    }
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 184);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v36 = *(void *)(v0 + 144);
    int v37 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    *(void *)(v0 + 72) = sub_2465574C8(v15, v16, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
    uint64_t v27 = sub_24659E148();
    *(void *)(v0 + 80) = sub_2465574C8(v27, v28, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v35(v24, v25);
    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v29 = sub_24659CF78();
    *(void *)(v0 + 104) = sub_2465574C8(v29, v30, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    v37(v26, v36);
    *(_WORD *)(v14 + 32) = 2080;
    swift_getErrorValue();
    uint64_t v31 = sub_24659E1A8();
    *(void *)(v0 + 112) = sub_2465574C8(v31, v32, &v43);
    sub_24659DFE8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24654E000, log, v40, "[%s] Offer action for:%s on %s failed. %s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v38, -1, -1);
    MEMORY[0x24C52FE90](v14, -1, -1);
  }
  else
  {
    unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 200);
    uint64_t v20 = *(void *)(v0 + 184);
    uint64_t v21 = *(void *)(v0 + 160);
    uint64_t v22 = *(void *)(v0 + 144);

    v17(v19, v20);
    v18(v21, v22);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_246571758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  *(unsigned char *)(a2 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_246571770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAE8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_24659DE38();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  sub_24659DE08();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v17 = sub_24659DDF8();
  unint64_t v18 = (void *)swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  void v18[2] = v17;
  v18[3] = v19;
  v18[4] = a4;
  v18[5] = a5;
  v18[6] = v16;
  v18[7] = a6;
  v18[8] = a7;
  swift_release();
  sub_246573A74((uint64_t)v14, (uint64_t)&unk_268F8C420, (uint64_t)v18);
  sub_24659D0F8();
  swift_allocObject();
  uint64_t v20 = sub_24659D108();
  swift_beginAccess();
  *(void *)(a2 + 16) = v20;
  return swift_release();
}

uint64_t sub_246571998()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2465719F0(uint64_t a1)
{
  return sub_246571770(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_246571A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  uint64_t v9 = sub_24659D088();
  v8[21] = v9;
  v8[22] = *(void *)(v9 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAE8);
  v8[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C300);
  v8[26] = swift_task_alloc();
  v8[27] = swift_task_alloc();
  uint64_t v10 = sub_24659CFE8();
  v8[28] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v8[29] = v11;
  v8[30] = *(void *)(v11 + 64);
  v8[31] = swift_task_alloc();
  v8[32] = swift_task_alloc();
  v8[33] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C430);
  v8[34] = v12;
  v8[35] = *(void *)(v12 - 8);
  v8[36] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C438);
  v8[37] = swift_task_alloc();
  uint64_t v13 = sub_24659D028();
  v8[38] = v13;
  v8[39] = *(void *)(v13 - 8);
  v8[40] = swift_task_alloc();
  uint64_t v14 = sub_24659D008();
  v8[41] = v14;
  v8[42] = *(void *)(v14 - 8);
  v8[43] = swift_task_alloc();
  v8[44] = sub_24659DE08();
  v8[45] = sub_24659DDF8();
  uint64_t v16 = sub_24659DDD8();
  v8[46] = v16;
  v8[47] = v15;
  return MEMORY[0x270FA2498](sub_246571D48, v16, v15);
}

uint64_t sub_246571D48()
{
  uint64_t v20 = v0;
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24659D0C8();
  *(void *)(v0 + 384) = __swift_project_value_buffer(v1, (uint64_t)qword_268F8EDD0);
  uint64_t v2 = sub_24659D0A8();
  os_log_type_t v3 = sub_24659DF38();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v17 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v7 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v8 = HIDWORD(qword_268F8C218);
      uint64_t v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 408) = v8;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v6 = v18;
      unint64_t v7 = v19;
    }
    *(void *)(v0 + 120) = sub_2465574C8(v6, v7, &v17);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24654E000, v2, v3, "[%s] Awaiting apps", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v5, -1, -1);
    MEMORY[0x24C52FE90](v4, -1, -1);
  }

  uint64_t v10 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 320);
  uint64_t v11 = *(void *)(v0 + 304);
  sub_24659D078();
  sub_24659D048();
  MEMORY[0x24C52E650]();
  swift_release();
  sub_24659D018();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_beginAccess();
  uint64_t v12 = sub_24659DDF8();
  *(void *)(v0 + 392) = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_24657209C;
  uint64_t v14 = *(void *)(v0 + 296);
  uint64_t v15 = MEMORY[0x263F8F500];
  return MEMORY[0x270EF56D0](v14, v12, v15);
}

uint64_t sub_24657209C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 376);
  uint64_t v3 = *(void *)(v1 + 368);
  return MEMORY[0x270FA2498](sub_2465721E0, v3, v2);
}

uint64_t sub_2465721E0()
{
  uint64_t v92 = v0;
  uint64_t v1 = *(void *)(v0 + 296);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v0 + 280) + 48))(v1, 1, *(void *)(v0 + 272)) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 336) + 8))(*(void *)(v0 + 344), *(void *)(v0 + 328));
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
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  sub_246574CFC(v1, *(void *)(v0 + 288));
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = *(uint64_t **)(v0 + 288);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 192);
    uint64_t v8 = *(void *)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 176);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v9 + 32))(v6, v5, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = sub_24659D0A8();
    os_log_type_t v11 = sub_24659DF18();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 184);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v16 = *(void *)(v0 + 176);
    if (v12)
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v91 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      sub_246574FB4(&qword_268F8C440, MEMORY[0x263F10748]);
      uint64_t v19 = sub_24659E1A8();
      *(void *)(v17 + 4) = sub_2465574C8(v19, v20, &v91);
      swift_bridgeObjectRelease();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v21(v13, v15);
      _os_log_impl(&dword_24654E000, v10, v11, "%s", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v18, -1, -1);
      MEMORY[0x24C52FE90](v17, -1, -1);

      v21(v14, v15);
    }
    else
    {

      uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v29(v13, v15);
      v29(v14, v15);
    }
    goto LABEL_44;
  }
  uint64_t v22 = *v5;
  swift_bridgeObjectRetain_n();
  unint64_t v23 = sub_24659D0A8();
  os_log_type_t v24 = sub_24659DF38();
  uint64_t v87 = v22;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(void *)(v0 + 112) = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    uint64_t v27 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v28 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v31 = HIDWORD(qword_268F8C218);
      *(void *)(v0 + 96) = 0;
      *(void *)(v0 + 104) = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 92) = v31;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void *)(v0 + 96);
      unint64_t v28 = *(void *)(v0 + 104);
    }
    *(void *)(v25 + 4) = sub_2465574C8(v27, v28, (uint64_t *)(v0 + 112));
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2048;
    uint64_t v22 = v87;
    uint64_t v32 = *(void *)(v87 + 16);
    swift_bridgeObjectRelease();
    *(void *)(v25 + 14) = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24654E000, v23, v24, "[%s] Receieved %ld app(s)", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v26, -1, -1);
    MEMORY[0x24C52FE90](v25, -1, -1);

    uint64_t v30 = *(void *)(v87 + 16);
    if (v30) {
      goto LABEL_18;
    }
LABEL_29:
    uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 232) + 56);
    v42(*(void *)(v0 + 216), 1, 1, *(void *)(v0 + 224));
    goto LABEL_32;
  }

  swift_bridgeObjectRelease_n();
  uint64_t v30 = *(void *)(v22 + 16);
  if (!v30) {
    goto LABEL_29;
  }
LABEL_18:
  uint64_t v33 = *(void *)(v0 + 232);
  uint64_t v34 = v22 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
  uint64_t v89 = *(void *)(v33 + 72);
  uint64_t v35 = *(void (**)(void, uint64_t, void))(v33 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v35(*(void *)(v0 + 256), v34, *(void *)(v0 + 224));
    uint64_t v36 = sub_24659CF68();
    uint64_t v38 = v37;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24659D1B8();
    swift_release();
    swift_release();
    uint64_t v39 = *(void *)(v0 + 80);
    if (!v39)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    if (v36 == *(void *)(v0 + 72) && v38 == v39) {
      break;
    }
    char v41 = sub_24659E158();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v41) {
      goto LABEL_31;
    }
LABEL_20:
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 224));
    v34 += v89;
    if (!--v30)
    {
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_31:
  uint64_t v43 = *(void *)(v0 + 256);
  uint64_t v44 = *(void *)(v0 + 224);
  uint64_t v45 = *(void *)(v0 + 232);
  uint64_t v46 = *(void *)(v0 + 216);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v46, v43, v44);
  uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56);
  v42(v46, 0, 1, v44);
LABEL_32:
  uint64_t v48 = *(void *)(v0 + 224);
  uint64_t v47 = *(void *)(v0 + 232);
  uint64_t v49 = *(void *)(v0 + 216);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v49, 1, v48) == 1)
  {
    sub_246555440(*(void *)(v0 + 216), &qword_268F8C300);
    goto LABEL_44;
  }
  uint64_t v50 = *(void *)(v0 + 264);
  uint64_t v51 = *(void *)(v0 + 224);
  uint64_t v52 = *(void *)(v0 + 232);
  uint64_t v53 = *(void *)(v0 + 208);
  uint64_t v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32);
  v90(v50, *(void *)(v0 + 216), v51);
  uint64_t v88 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16);
  v88(v53, v50, v51);
  v42(v53, 0, 1, v51);
  sub_24659D148();
  sub_246555440(v53, &qword_268F8C300);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v55 = *(void *)(v0 + 264);
    uint64_t v56 = *(void *)(v0 + 248);
    uint64_t v85 = *(void *)(v0 + 240);
    uint64_t v57 = *(void *)(v0 + 224);
    uint64_t v83 = v56;
    uint64_t v84 = *(void *)(v0 + 232);
    uint64_t v81 = Strong;
    uint64_t v82 = v57;
    uint64_t v58 = *(void *)(v0 + 200);
    uint64_t v59 = *(void *)(v0 + 152);
    uint64_t v86 = *(void *)(v0 + 160);
    uint64_t v60 = sub_24659DE38();
    uint64_t v61 = *(void *)(v60 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v58, 1, 1, v60);
    v88(v56, v55, v57);
    swift_retain();
    uint64_t v62 = sub_24659DDF8();
    unint64_t v63 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    unint64_t v64 = (v85 + v63 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v65 = swift_allocObject();
    uint64_t v66 = MEMORY[0x263F8F500];
    *(void *)(v65 + 16) = v62;
    *(void *)(v65 + 24) = v66;
    v90(v65 + v63, v83, v82);
    *(void *)(v65 + v64) = v59;
    *(void *)(v65 + ((v64 + 15) & 0xFFFFFFFFFFFFFFF8)) = v86;
    int v67 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v58, 1, v60);
    uint64_t v68 = *(void *)(v0 + 200);
    if (v67 == 1)
    {
      sub_246555440(*(void *)(v0 + 200), &qword_268F8BAE8);
      if (*(void *)(v65 + 16)) {
        goto LABEL_37;
      }
LABEL_40:
      uint64_t v69 = 0;
      uint64_t v71 = 0;
    }
    else
    {
      sub_24659DE28();
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v68, v60);
      if (!*(void *)(v65 + 16)) {
        goto LABEL_40;
      }
LABEL_37:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v69 = sub_24659DDD8();
      uint64_t v71 = v70;
      swift_unknownObjectRelease();
    }
    uint64_t v72 = swift_allocObject();
    *(void *)(v72 + 16) = &unk_268F8C450;
    *(void *)(v72 + 24) = v65;
    if (v71 | v69)
    {
      *(void *)(v0 + 16) = 0;
      *(void *)(v0 + 24) = 0;
      *(void *)(v0 + 32) = v69;
      *(void *)(v0 + 40) = v71;
    }
    uint64_t v73 = *(void *)(v0 + 264);
    uint64_t v75 = *(void *)(v0 + 224);
    uint64_t v74 = *(void *)(v0 + 232);
    swift_task_create();
    sub_24659D0F8();
    swift_allocObject();
    uint64_t v76 = sub_24659D108();
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
    *(void *)(v81 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_appStateSubscription) = v76;
    swift_release();
    swift_release();
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 264), *(void *)(v0 + 224));
  }
LABEL_44:
  uint64_t v77 = sub_24659DDF8();
  *(void *)(v0 + 392) = v77;
  os_log_type_t v78 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v78;
  void *v78 = v0;
  v78[1] = sub_24657209C;
  uint64_t v79 = *(void *)(v0 + 296);
  uint64_t v80 = MEMORY[0x263F8F500];
  return MEMORY[0x270EF56D0](v79, v77, v80);
}

uint64_t sub_246572D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  uint64_t v6 = sub_24659CF58();
  v5[9] = v6;
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2F8);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C458);
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C460);
  v5[18] = v8;
  v5[19] = *(void *)(v8 - 8);
  v5[20] = swift_task_alloc();
  uint64_t v9 = sub_24659CFE8();
  v5[21] = v9;
  v5[22] = *(void *)(v9 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = sub_24659DE08();
  v5[26] = sub_24659DDF8();
  uint64_t v11 = sub_24659DDD8();
  v5[27] = v11;
  v5[28] = v10;
  return MEMORY[0x270FA2498](sub_246572FAC, v11, v10);
}

uint64_t sub_246572FAC()
{
  uint64_t v37 = v0;
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v5 = sub_24659D0C8();
  *(void *)(v0 + 232) = __swift_project_value_buffer(v5, (uint64_t)qword_268F8EDD0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 240) = v6;
  *(void *)(v0 + 248) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v1, v3);
  uint64_t v7 = sub_24659D0A8();
  os_log_type_t v8 = sub_24659DF38();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v34 = v32;
    *(_DWORD *)uint64_t v9 = 136315394;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    os_log_type_t v33 = v8;
    uint64_t v10 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v11 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v16 = HIDWORD(qword_268F8C218);
      uint64_t v35 = 0;
      unint64_t v36 = 0xE000000000000000;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 300) = v16;
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v10 = v35;
      unint64_t v11 = v36;
    }
    uint64_t v17 = *(void *)(v0 + 192);
    uint64_t v19 = *(void *)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 176);
    *(void *)(v0 + 40) = sub_2465574C8(v10, v11, &v34);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v20 = sub_24659CF78();
    *(void *)(v0 + 48) = sub_2465574C8(v20, v21, &v34);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void (**)(void, void))(v18 + 8);
    uint64_t v13 = v18 + 8;
    uint64_t v14 = v22;
    v22(v17, v19);
    _os_log_impl(&dword_24654E000, v7, v33, "[%s] Awaiting state for %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v32, -1, -1);
    MEMORY[0x24C52FE90](v9, -1, -1);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 176);
    uint64_t v15 = *(void (**)(void, void))(v12 + 8);
    uint64_t v13 = v12 + 8;
    uint64_t v14 = v15;
    v15(*(void *)(v0 + 192), *(void *)(v0 + 168));
  }

  *(void *)(v0 + 256) = v13;
  *(void *)(v0 + 264) = v14;
  uint64_t v24 = *(void *)(v0 + 128);
  uint64_t v23 = *(void *)(v0 + 136);
  uint64_t v25 = *(void *)(v0 + 120);
  sub_24659CF98();
  sub_24659DE48();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  *(void *)(v0 + 272) = v14;
  uint64_t v26 = sub_24659DDF8();
  *(void *)(v0 + 280) = v26;
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_2465733A0;
  uint64_t v28 = *(void *)(v0 + 144);
  uint64_t v29 = *(void *)(v0 + 112);
  uint64_t v30 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v29, v26, v30, v28);
}

uint64_t sub_2465733A0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 224);
  uint64_t v3 = *(void *)(v1 + 216);
  return MEMORY[0x270FA2498](sub_2465734E4, v3, v2);
}

uint64_t sub_2465734E4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v8 = *(void *)(v0 + 168);
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v11 = *(void *)(v0 + 56);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v9, v1, v2);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v12(v10, v9, v2);
    v6(v7, v11, v8);
    uint64_t v13 = sub_24659D0A8();
    os_log_type_t v14 = sub_24659DF38();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(void *)(v0 + 32) = v45;
      *(_DWORD *)uint64_t v15 = 136315650;
      if (qword_268F8B960 != -1) {
        swift_once();
      }
      os_log_type_t v46 = v14;
      uint64_t v47 = v12;
      uint64_t v16 = qword_268F8C218;
      if (byte_268F8C228 == 1)
      {
        unint64_t v17 = qword_268F8C220;
        swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v23 = HIDWORD(qword_268F8C218);
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0xE000000000000000;
        sub_24659DD58();
        swift_bridgeObjectRelease();
        *(_DWORD *)(v0 + 296) = v23;
        sub_246554E28();
        sub_24659DD78();
        sub_24659DD58();
        swift_bridgeObjectRelease();
        uint64_t v16 = *(void *)(v0 + 16);
        unint64_t v17 = *(void *)(v0 + 24);
      }
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
      uint64_t v24 = *(void *)(v0 + 184);
      uint64_t v43 = *(void *)(v0 + 168);
      uint64_t v25 = *(void *)(v0 + 80);
      uint64_t v26 = *(void *)(v0 + 88);
      uint64_t v27 = *(void *)(v0 + 72);
      *(void *)(v15 + 4) = sub_2465574C8(v16, v17, (uint64_t *)(v0 + 32));
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      sub_246574FB4(&qword_268F8C468, MEMORY[0x263F10710]);
      uint64_t v28 = sub_24659E148();
      *(void *)(v15 + 14) = sub_2465574C8(v28, v29, (uint64_t *)(v0 + 32));
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v22(v26, v27);
      *(_WORD *)(v15 + 22) = 2080;
      uint64_t v30 = sub_24659CF78();
      *(void *)(v15 + 24) = sub_2465574C8(v30, v31, (uint64_t *)(v0 + 32));
      swift_bridgeObjectRelease();
      uint64_t v32 = v24;
      uint64_t v18 = (uint64_t *)(v0 + 264);
      v44(v32, v43);
      _os_log_impl(&dword_24654E000, v13, v46, "[%s] Received state %s for %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C52FE90](v45, -1, -1);
      MEMORY[0x24C52FE90](v15, -1, -1);

      uint64_t v12 = v47;
    }
    else
    {
      uint64_t v18 = (uint64_t *)(v0 + 272);
      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
      uint64_t v20 = *(void *)(v0 + 184);
      uint64_t v21 = *(void *)(v0 + 168);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 80) + 8);
      v22(*(void *)(v0 + 88), *(void *)(v0 + 72));
      v19(v20, v21);
    }
    uint64_t v33 = *v18;
    uint64_t v35 = *(void *)(v0 + 96);
    uint64_t v34 = *(void *)(v0 + 104);
    uint64_t v36 = *(void *)(v0 + 72);
    uint64_t v37 = *(void *)(v0 + 80);
    v12(v34, v35, v36);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    sub_24659D148();
    sub_246555440(v34, &qword_268F8C2F8);
    v22(v35, v36);
    *(void *)(v0 + 272) = v33;
    uint64_t v38 = sub_24659DDF8();
    *(void *)(v0 + 280) = v38;
    uint64_t v39 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v39;
    *uint64_t v39 = v0;
    v39[1] = sub_2465733A0;
    uint64_t v40 = *(void *)(v0 + 144);
    uint64_t v41 = *(void *)(v0 + 112);
    uint64_t v42 = MEMORY[0x263F8F500];
    return MEMORY[0x270FA1F68](v41, v38, v42, v40);
  }
}

uint64_t sub_246573A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24659DE38();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24659DE28();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_246555440(a1, &qword_268F8BAE8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24659DDD8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_246573BFC(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  sub_24659CE18();
  swift_allocObject();
  sub_24659CE08();
  uint64_t v30 = *(void *)&a3;
  double v31 = a4;
  double v32 = a5;
  double v33 = a6;
  double v34 = a7;
  sub_246574A98();
  uint64_t v13 = sub_24659CDF8();
  unint64_t v15 = v14;
  swift_release();
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_24659D0C8();
  __swift_project_value_buffer(v16, (uint64_t)qword_268F8EDD0);
  unint64_t v17 = sub_24659D0A8();
  os_log_type_t v18 = sub_24659DF08();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    v29[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    if (qword_268F8B960 != -1) {
      swift_once();
    }
    uint64_t v21 = qword_268F8C218;
    if (byte_268F8C228 == 1)
    {
      unint64_t v22 = qword_268F8C220;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v30 = 0;
      double v31 = -2.68156159e154;
      sub_24659DD58();
      swift_bridgeObjectRelease();
      sub_246554E28();
      sub_24659DD78();
      sub_24659DD58();
      swift_bridgeObjectRelease();
      uint64_t v21 = 0;
      unint64_t v22 = 0xE000000000000000;
    }
    uint64_t v30 = sub_2465574C8(v21, v22, v29);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v30 = *(void *)&a3;
    double v31 = a4;
    double v32 = a5;
    double v33 = a6;
    double v34 = a7;
    uint64_t v23 = sub_24659DD28();
    uint64_t v30 = sub_2465574C8(v23, v24, v29);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24654E000, v17, v18, "[%s] Replying bounds %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v20, -1, -1);
    MEMORY[0x24C52FE90](v19, -1, -1);
  }

  uint64_t v25 = *(void (**)(uint64_t, unint64_t))(a1
                                                         + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  if (!v25) {
    return sub_246574AEC(v13, v15);
  }
  if (v15 >> 60 == 15) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = v13;
  }
  if (v15 >> 60 == 15) {
    unint64_t v27 = 0xC000000000000000;
  }
  else {
    unint64_t v27 = v15;
  }
  sub_246574B00((uint64_t)v25);
  sub_246574B10(v13, v15);
  v25(v26, v27);
  sub_246574AEC(v13, v15);
  sub_2465574B8((uint64_t)v25);
  return sub_2465552F8(v26, v27);
}

uint64_t sub_246573FCC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246574004(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return sub_246573BFC(*(void *)(v6 + 16), a1, a2, a3, a4, a5, a6);
}

uint64_t sub_24657400C(double *a1)
{
  return (*(uint64_t (**)(double, double, double, double, double, double))(v1 + 16))(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
}

Swift::Void __swiftcall ManagedAppCellViewModel.report(viewSize:)(CGSize viewSize)
{
}

Swift::Void __swiftcall ManagedAppCellViewModel.report(buttonFrame:)(__C::CGRect buttonFrame)
{
}

uint64_t static ManagedAppCellViewModel.color(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24659D278();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24659D528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24659D518();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  sub_24659D428();
  sub_24659DA58();
  uint64_t v12 = (void *)sub_24659DA68();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F18508], v4);
  LOBYTE(a2) = sub_24659D268();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v13 = 0.0;
  if (a2) {
    double v13 = 1.0;
  }
  CGColorRef GenericGray = CGColorCreateGenericGray(v13, 1.0);
  AXSSContrastRatioForColor();
  if (v15 >= 3.0)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    swift_retain();
  }
  else
  {
    a1 = sub_24659DA48();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return a1;
}

uint64_t ManagedAppCellViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C238);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C270);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C2A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ManagedAppCellViewModel.__deallocating_deinit()
{
  ManagedAppCellViewModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_246574574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24656C318(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_268F8C238);
}

uint64_t sub_24657459C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24656C388(a1, a2, a3, a4, &qword_268F8C240, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_268F8C238);
}

uint64_t sub_2465745CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24656C318(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_268F8C238);
}

uint64_t sub_2465745F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24656C388(a1, a2, a3, a4, &qword_268F8C240, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_268F8C238);
}

uint64_t sub_246574624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24656C318(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_268F8C258);
}

uint64_t sub_24657464C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24656C388(a1, a2, a3, a4, &qword_268F8C260, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_268F8C258);
}

uint64_t sub_24657467C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24656C318(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_268F8C270);
}

uint64_t sub_2465746A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24656C388(a1, a2, a3, a4, &qword_268F8C278, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_268F8C270);
}

uint64_t sub_2465746D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24656C318(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_268F8C288);
}

uint64_t sub_2465746FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24656C388(a1, a2, a3, a4, &qword_268F8C290, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_268F8C288);
}

uint64_t sub_24657472C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24656C318(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_268F8C2A0);
}

uint64_t sub_246574754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24656C388(a1, a2, a3, a4, &qword_268F8C2A8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_268F8C2A0);
}

uint64_t sub_246574784()
{
  return type metadata accessor for ManagedAppCellViewModel();
}

uint64_t type metadata accessor for ManagedAppCellViewModel()
{
  uint64_t result = qword_268F8C3D8;
  if (!qword_268F8C3D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2465747D8()
{
  sub_246574A50(319, &qword_268F8C3E8);
  if (v0 <= 0x3F)
  {
    sub_2465749F4();
    if (v1 <= 0x3F)
    {
      sub_246574A50(319, &qword_268F8C3F8);
      if (v2 <= 0x3F)
      {
        sub_246574A50(319, &qword_268F8C400);
        if (v3 <= 0x3F)
        {
          sub_246574A50(319, &qword_268F8C408);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t method lookup function for ManagedAppCellViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ManagedAppCellViewModel);
}

uint64_t dispatch thunk of ManagedAppCellViewModel.__allocating_init(exportedObject:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

void sub_2465749F4()
{
  if (!qword_268F8C3F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD48);
    unint64_t v0 = sub_24659D1D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8C3F0);
    }
  }
}

void sub_246574A50(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_24659D1D8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unint64_t sub_246574A98()
{
  unint64_t result = qword_268F8C410;
  if (!qword_268F8C410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268F8C410);
  }
  return result;
}

uint64_t sub_246574AEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2465552F8(a1, a2);
  }
  return a1;
}

uint64_t sub_246574B00(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_246574B10(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_246574B24(a1, a2);
  }
  return a1;
}

uint64_t sub_246574B24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_246574B7C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_246574BD4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_246555050;
  return sub_246571A00(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_246574CB0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C428);
  uint64_t v2 = MEMORY[0x263F8EE60] + 8;
  uint64_t v3 = MEMORY[0x263F8E4E0];

  return MEMORY[0x270FA1FB0](v0, v2, v1, v3);
}

uint64_t sub_246574CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246574D6C()
{
  uint64_t v1 = sub_24659CFE8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_246574E5C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24659CFE8() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_2465752F4;
  return sub_246572D38(a1, v6, v7, v8, v9);
}

uint64_t sub_246574F90()
{
  return MEMORY[0x270FA1FB0](v0, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E628], MEMORY[0x263F8E658]);
}

uint64_t sub_246574FB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246574FFC()
{
  uint64_t v1 = sub_24659CF58();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_24659CFE8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_246575160(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(sub_24659CF58() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_24659CFE8() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v9;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v13;
  *uint64_t v13 = v3;
  v13[1] = sub_246555050;
  return sub_24656F3FC(a1, v10, v11, v1 + v6, v12);
}

ValueMetadata *type metadata accessor for Style()
{
  return &type metadata for Style;
}

void *sub_246575308(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24659D278();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v10 = (_OWORD *)((char *)a1 + v9);
    uint64_t v11 = (_OWORD *)((char *)a2 + v9);
    long long v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  }
  return a1;
}

uint64_t sub_246575448(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24659D278();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_2465754EC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24659D278();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v8 = (_OWORD *)((char *)a1 + v7);
  uint64_t v9 = (_OWORD *)((char *)a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

void *sub_2465755DC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_246555440((uint64_t)a1, &qword_268F8BF30);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24659D278();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

char *sub_246575704(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24659D278();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  uint64_t v9 = &a1[v8];
  long long v10 = &a2[v8];
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  uint64_t v12 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  return a1;
}

char *sub_2465757FC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_246555440((uint64_t)a1, &qword_268F8BF30);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24659D278();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  uint64_t v9 = &a1[v8];
  long long v10 = &a2[v8];
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  uint64_t v12 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  return a1;
}

uint64_t sub_24657590C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246575920);
}

uint64_t sub_246575920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF10);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_2465759F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246575A08);
}

uint64_t sub_246575A08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF10);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t type metadata accessor for Style.CapsuleButtonStyle()
{
  uint64_t result = qword_268F8C498;
  if (!qword_268F8C498) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246575B14()
{
  sub_246575BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_246575BC4()
{
  if (!qword_268F8BD38)
  {
    sub_24659D278();
    unint64_t v0 = sub_24659D288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8BD38);
    }
  }
}

uint64_t sub_246575C1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246575C38()
{
  uint64_t v0 = sub_24659DA18();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v3 + 104))(v2, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x24C52F0A0](v2, 0.949019608, 0.949019608, 0.968627451, 1.0);
  qword_268F8EDC0 = result;
  return result;
}

uint64_t sub_246575D18()
{
  sub_24659DA28();
  uint64_t v0 = sub_24659DA38();
  uint64_t result = swift_release();
  qword_268F8EDC8 = v0;
  return result;
}

uint64_t sub_246575D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v119 = a1;
  uint64_t v116 = a2;
  uint64_t v4 = sub_24659DBB8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v115 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_24659D3A8();
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v112 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4A8);
  MEMORY[0x270FA5388](v108);
  uint64_t v111 = (uint64_t)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4B0);
  MEMORY[0x270FA5388](v110);
  uint64_t v86 = (uint64_t)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v91 = sub_24659D678();
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  unsigned int v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4B8);
  MEMORY[0x270FA5388](v89);
  uint64_t v12 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4C0);
  uint64_t v92 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  unint64_t v14 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4C8);
  MEMORY[0x270FA5388](v88);
  uint64_t v118 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4D0);
  MEMORY[0x270FA5388](v97);
  uint64_t v99 = (uint64_t)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4D8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v96 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v100 = (uint64_t)&v85 - v20;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4E0);
  MEMORY[0x270FA5388](v95);
  long long v102 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4E8);
  MEMORY[0x270FA5388](v98);
  uint64_t v104 = (uint64_t)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4F0);
  MEMORY[0x270FA5388](v101);
  uint64_t v106 = (char *)&v85 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C4F8);
  MEMORY[0x270FA5388](v103);
  uint64_t v109 = (uint64_t)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C500);
  MEMORY[0x270FA5388](v105);
  uint64_t v107 = (uint64_t)&v85 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_24659D278();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v85 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  double v32 = (char *)&v85 - v31;
  uint64_t v33 = type metadata accessor for Style.CapsuleButtonStyle();
  uint64_t v87 = *(int *)(v33 + 20);
  int v34 = *(unsigned __int8 *)(v2 + v87);
  uint64_t v117 = v2;
  if (v34 == 1)
  {
    uint64_t v94 = sub_24659DA08();
  }
  else
  {
    sub_246567ADC((uint64_t)v32);
    (*(void (**)(char *, void, uint64_t))(v27 + 104))(v30, *MEMORY[0x263F18508], v26);
    char v35 = sub_24659D268();
    uint64_t v36 = *(void (**)(char *, uint64_t))(v27 + 8);
    v36(v30, v26);
    v36(v32, v26);
    if (v35)
    {
      if (qword_268F8B968 != -1) {
        swift_once();
      }
      uint64_t v37 = qword_268F8EDC0;
    }
    else
    {
      if (qword_268F8B970 != -1) {
        swift_once();
      }
      uint64_t v37 = qword_268F8EDC8;
    }
    uint64_t v94 = v37;
    swift_retain();
    uint64_t v3 = v117;
  }
  sub_24659D688();
  uint64_t v38 = sub_24659D7C8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v40 = v90;
  uint64_t v41 = v91;
  (*(void (**)(char *, char *, void))(v90 + 16))(v12, v10, v91);
  uint64_t v42 = (uint64_t *)&v12[*(int *)(v89 + 36)];
  *uint64_t v42 = KeyPath;
  v42[1] = v38;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v41);
  sub_24659D7F8();
  sub_246576CB0();
  sub_24659D908();
  sub_246555440((uint64_t)v12, &qword_268F8C4B8);
  uint64_t v43 = (long long *)(v3 + *(int *)(v33 + 24));
  long long v91 = *v43;
  uint64_t v44 = *((void *)v43 + 2);
  uint64_t v45 = *((void *)v43 + 3);
  LOBYTE(v38) = sub_24659D788();
  uint64_t v46 = v92;
  uint64_t v47 = v118;
  uint64_t v48 = v93;
  (*(void (**)(uint64_t, char *, uint64_t))(v92 + 16))(v118, v14, v93);
  uint64_t v49 = v47 + *(int *)(v88 + 36);
  *(unsigned char *)uint64_t v49 = v38;
  *(_OWORD *)(v49 + 8) = v91;
  *(void *)(v49 + 24) = v44;
  *(void *)(v49 + 32) = v45;
  uint64_t v50 = v117;
  *(unsigned char *)(v49 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v48);
  sub_24659DBD8();
  sub_24659D408();
  uint64_t v51 = v118;
  uint64_t v52 = v99;
  sub_246561BE8(v118, v99, &qword_268F8C4C8);
  uint64_t v53 = (_OWORD *)(v52 + *(int *)(v97 + 36));
  long long v54 = v125;
  v53[4] = v124;
  v53[5] = v54;
  v53[6] = v126;
  long long v55 = v121;
  *uint64_t v53 = v120;
  v53[1] = v55;
  long long v56 = v123;
  v53[2] = v122;
  v53[3] = v56;
  sub_246555440(v51, &qword_268F8C4C8);
  uint64_t v57 = (uint64_t)v96;
  if (*(unsigned char *)(v50 + v87))
  {
    uint64_t v58 = sub_24659DA28();
    uint64_t v59 = v86;
    sub_246561BE8(v52, v86, &qword_268F8C4D0);
    *(void *)(v59 + *(int *)(v110 + 36)) = v58;
    sub_246561BE8(v59, v111, &qword_268F8C4B0);
    swift_storeEnumTagMultiPayload();
    sub_246576DA8();
    sub_2465770B4(&qword_268F8C520, &qword_268F8C4D0, (void (*)(void))sub_246576E74);
    sub_24659D618();
    sub_246555440(v59, &qword_268F8C4B0);
  }
  else
  {
    sub_246561BE8(v52, v111, &qword_268F8C4D0);
    swift_storeEnumTagMultiPayload();
    sub_246576DA8();
    sub_2465770B4(&qword_268F8C520, &qword_268F8C4D0, (void (*)(void))sub_246576E74);
    sub_24659D618();
  }
  uint64_t v60 = v100;
  sub_246561C4C(v57, v100, &qword_268F8C4D8);
  sub_246555440(v52, &qword_268F8C4D0);
  uint64_t v61 = v112;
  sub_24659D398();
  uint64_t v62 = (uint64_t)v102;
  uint64_t v63 = v113;
  uint64_t v64 = v114;
  (*(void (**)(char *, char *, uint64_t))(v113 + 16))(&v102[*(int *)(v95 + 36)], v61, v114);
  sub_246561BE8(v60, v62, &qword_268F8C4D8);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v61, v64);
  sub_246555440(v60, &qword_268F8C4D8);
  char v65 = sub_24659D788();
  uint64_t v66 = v104;
  sub_246561BE8(v62, v104, &qword_268F8C4E0);
  uint64_t v67 = v66 + *(int *)(v98 + 36);
  *(void *)uint64_t v67 = v94;
  *(unsigned char *)(v67 + 8) = v65;
  swift_retain();
  sub_246555440(v62, &qword_268F8C4E0);
  uint64_t v68 = *MEMORY[0x263F19860];
  uint64_t v69 = sub_24659D598();
  uint64_t v70 = (uint64_t)v115;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v69 - 8) + 104))(v115, v68, v69);
  uint64_t v71 = (uint64_t)v106;
  uint64_t v72 = (uint64_t)&v106[*(int *)(v101 + 36)];
  sub_246576F24(v70, v72);
  *(_WORD *)(v72 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C540) + 36)) = 256;
  sub_246561BE8(v66, v71, &qword_268F8C4E8);
  sub_246576F88(v70);
  sub_246555440(v66, &qword_268F8C4E8);
  if (sub_24659D698()) {
    double v73 = 0.8;
  }
  else {
    double v73 = 1.0;
  }
  sub_24659DC68();
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v78 = v109;
  sub_246561BE8(v71, v109, &qword_268F8C4F0);
  uint64_t v79 = v78 + *(int *)(v103 + 36);
  *(double *)uint64_t v79 = v73;
  *(double *)(v79 + 8) = v73;
  *(void *)(v79 + 16) = v75;
  *(void *)(v79 + 24) = v77;
  sub_246555440(v71, &qword_268F8C4F0);
  uint64_t v80 = sub_24659DC18();
  char v81 = sub_24659D698();
  swift_release();
  uint64_t v82 = v107;
  sub_246561BE8(v78, v107, &qword_268F8C4F8);
  uint64_t v83 = v82 + *(int *)(v105 + 36);
  *(void *)uint64_t v83 = v80;
  *(unsigned char *)(v83 + 8) = v81 & 1;
  sub_246555440(v78, &qword_268F8C4F8);
  return sub_246561C4C(v82, v116, &qword_268F8C500);
}

uint64_t sub_246576C00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659D498();
  *a1 = result;
  return result;
}

uint64_t sub_246576C2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659D498();
  *a1 = result;
  return result;
}

uint64_t sub_246576C58()
{
  return sub_24659D4A8();
}

uint64_t sub_246576C84()
{
  return sub_24659D4A8();
}

unint64_t sub_246576CB0()
{
  unint64_t result = qword_268F8C508;
  if (!qword_268F8C508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4B8);
    sub_246576D50();
    sub_246561BA4(&qword_268F8BE30, &qword_268F8BE38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C508);
  }
  return result;
}

unint64_t sub_246576D50()
{
  unint64_t result = qword_268F8C510;
  if (!qword_268F8C510)
  {
    sub_24659D678();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C510);
  }
  return result;
}

unint64_t sub_246576DA8()
{
  unint64_t result = qword_268F8C518;
  if (!qword_268F8C518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4B0);
    sub_2465770B4(&qword_268F8C520, &qword_268F8C4D0, (void (*)(void))sub_246576E74);
    sub_246561BA4(&qword_268F8C530, &qword_268F8C538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C518);
  }
  return result;
}

unint64_t sub_246576E74()
{
  unint64_t result = qword_268F8C528;
  if (!qword_268F8C528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4B8);
    sub_246576CB0();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C528);
  }
  return result;
}

uint64_t sub_246576F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24659DBB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246576F88(uint64_t a1)
{
  uint64_t v2 = sub_24659DBB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_246576FE8()
{
  unint64_t result = qword_268F8C548;
  if (!qword_268F8C548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C500);
    sub_2465770B4(&qword_268F8C550, &qword_268F8C4F8, (void (*)(void))sub_246577130);
    sub_246561BA4(&qword_268F8C5A0, &qword_268F8C5A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C548);
  }
  return result;
}

uint64_t sub_2465770B4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_246577130()
{
  unint64_t result = qword_268F8C558;
  if (!qword_268F8C558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4F0);
    sub_2465771D0();
    sub_246561BA4(&qword_268F8C598, &qword_268F8C540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C558);
  }
  return result;
}

unint64_t sub_2465771D0()
{
  unint64_t result = qword_268F8C560;
  if (!qword_268F8C560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4E8);
    sub_246577270();
    sub_246561BA4(&qword_268F8C588, &qword_268F8C590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C560);
  }
  return result;
}

unint64_t sub_246577270()
{
  unint64_t result = qword_268F8C568;
  if (!qword_268F8C568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4E0);
    sub_246577310();
    sub_246561BA4(&qword_268F8C578, &qword_268F8C580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C568);
  }
  return result;
}

unint64_t sub_246577310()
{
  unint64_t result = qword_268F8C570;
  if (!qword_268F8C570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C4D8);
    sub_246576DA8();
    sub_2465770B4(&qword_268F8C520, &qword_268F8C4D0, (void (*)(void))sub_246576E74);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C570);
  }
  return result;
}

void static ManagedContentStyle.automatic.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static ManagedContentStyle.compact.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static ManagedContentStyle.header.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

_ManagedAppDistribution_SwiftUI::ManagedContentStyle::Style_optional __swiftcall ManagedContentStyle.Style.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (_ManagedAppDistribution_SwiftUI::ManagedContentStyle::Style_optional)rawValue;
}

uint64_t ManagedContentStyle.Style.rawValue.getter()
{
  return *v0;
}

BOOL sub_2465773F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24657740C()
{
  unint64_t result = qword_268F8C5B0;
  if (!qword_268F8C5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5B0);
  }
  return result;
}

uint64_t sub_246577460()
{
  return sub_24659E1F8();
}

uint64_t sub_2465774A8()
{
  return sub_24659E1C8();
}

uint64_t sub_2465774D4()
{
  return sub_24659E1F8();
}

_ManagedAppDistribution_SwiftUI::ManagedContentStyle::Style_optional sub_246577518(Swift::Int *a1)
{
  return ManagedContentStyle.Style.init(rawValue:)(*a1);
}

void sub_246577520(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24657752C()
{
  return sub_24659DDC8();
}

uint64_t sub_24657758C()
{
  return sub_24659DDB8();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentStyle()
{
  return &type metadata for ManagedContentStyle;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI19ManagedContentStyleV5StyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s31_ManagedAppDistribution_SwiftUI19ManagedContentStyleV5StyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24657775CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_246577784(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24657778C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentStyle.Style()
{
  return &type metadata for ManagedContentStyle.Style;
}

unint64_t sub_2465777A4()
{
  unint64_t result = qword_268F8C5B8;
  if (!qword_268F8C5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5B8);
  }
  return result;
}

uint64_t ManagedContentOfferState.init(appState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24659CF48();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unsigned int v10 = (char *)&v28 - v9;
  uint64_t v11 = sub_24659CF58();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v15 == *MEMORY[0x263F10700])
  {
    uint64_t v29 = a2;
    (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
    uint64_t v16 = swift_projectBox();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v10, v16, v4);
    v17(v8, (uint64_t)v10, v4);
    int v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
    if (v18 == *MEMORY[0x263F106E0])
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      uint64_t result = swift_release();
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      char v22 = 2;
      a2 = v29;
    }
    else if (v18 == *MEMORY[0x263F106D0])
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      uint64_t result = swift_release();
      uint64_t v21 = 0;
      char v22 = 2;
      uint64_t v20 = 1;
      a2 = v29;
    }
    else
    {
      if (v18 == *MEMORY[0x263F106D8])
      {
        uint64_t v20 = sub_2465787AC();
        uint64_t v21 = v24;
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        uint64_t result = swift_release();
        char v22 = 1;
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
        uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
        v25(v10, v4);
        v25(v8, v4);
        uint64_t result = swift_release();
        uint64_t v21 = 0;
        char v22 = 2;
        uint64_t v20 = 3;
      }
      a2 = v29;
    }
  }
  else
  {
    int v23 = v15;
    if (v15 == *MEMORY[0x263F106C0])
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
      uint64_t v20 = *(void *)(*(void *)v14 + 16);
      uint64_t result = swift_release();
      uint64_t v21 = 0;
      char v22 = 0;
    }
    else
    {
      if (v15 == *MEMORY[0x263F106E8])
      {
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
        (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
        uint64_t result = swift_release();
      }
      else
      {
        if (v15 == *MEMORY[0x263F10708])
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
          uint64_t v21 = 0;
          char v22 = 2;
          uint64_t v20 = 4;
          goto LABEL_21;
        }
        if (v15 == *MEMORY[0x263F106F0])
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
          uint64_t v21 = 0;
          uint64_t v20 = 2;
          char v22 = 2;
          goto LABEL_21;
        }
        int v26 = *MEMORY[0x263F106F8];
        uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
        uint64_t result = v27(a1, v11);
        if (v23 != v26)
        {
          uint64_t result = v27((uint64_t)v14, v11);
          uint64_t v21 = 0;
          char v22 = 2;
          uint64_t v20 = 3;
          goto LABEL_21;
        }
      }
      uint64_t v20 = 0;
      char v22 = 0;
      uint64_t v21 = 1;
    }
  }
LABEL_21:
  *(void *)a2 = v20;
  *(void *)(a2 + 8) = v21;
  *(unsigned char *)(a2 + 16) = v22;
  return result;
}

void static ManagedContentOfferState.neverInstalled.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 2;
}

double static ManagedContentOfferState.notInstalled.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 1;
  *(_OWORD *)a1 = xmmword_24659FAE0;
  *(unsigned char *)(a1 + 16) = 2;
  return result;
}

double static ManagedContentOfferState.installed.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 2;
  *(_OWORD *)a1 = xmmword_24659FAF0;
  *(unsigned char *)(a1 + 16) = 2;
  return result;
}

double static ManagedContentOfferState.noninteractive.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 3;
  *(_OWORD *)a1 = xmmword_24659F5F0;
  *(unsigned char *)(a1 + 16) = 2;
  return result;
}

uint64_t static ManagedContentOfferState.installing(progress:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2 & 1;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t static ManagedContentOfferState.custom(title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t ManagedContentOfferState.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (*(unsigned char *)(v0 + 16))
  {
    if (*(unsigned char *)(v0 + 16) == 1)
    {
      sub_24659E1C8();
      return sub_24659DD38();
    }
    else
    {
      return sub_24659E1C8();
    }
  }
  else
  {
    sub_24659E1C8();
    if (v1)
    {
      return sub_24659E1D8();
    }
    else
    {
      sub_24659E1D8();
      return sub_24659E1E8();
    }
  }
}

uint64_t static ManagedContentOfferState.== infix(_:_:)(long long *a1, long long *a2)
{
  char v2 = *((unsigned char *)a1 + 16);
  char v3 = *((unsigned char *)a2 + 16);
  long long v7 = *a1;
  char v8 = v2;
  long long v5 = *a2;
  char v6 = v3;
  return _s31_ManagedAppDistribution_SwiftUI0A17ContentOfferStateV0G0O2eeoiySbAE_AEtFZ_0((uint64_t)&v7, (uint64_t)&v5) & 1;
}

uint64_t ManagedContentOfferState.hashValue.getter()
{
  return sub_24659E1F8();
}

uint64_t sub_246577F7C()
{
  return sub_24659E1F8();
}

uint64_t sub_246577FDC()
{
  return sub_24659E1F8();
}

uint64_t sub_246578034(long long *a1, long long *a2)
{
  char v2 = *((unsigned char *)a1 + 16);
  char v3 = *((unsigned char *)a2 + 16);
  long long v7 = *a1;
  char v8 = v2;
  long long v5 = *a2;
  char v6 = v3;
  return _s31_ManagedAppDistribution_SwiftUI0A17ContentOfferStateV0G0O2eeoiySbAE_AEtFZ_0((uint64_t)&v7, (uint64_t)&v5) & 1;
}

uint64_t ManagedContentOfferState.Offer.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (*(unsigned char *)(v0 + 16))
  {
    if (*(unsigned char *)(v0 + 16) == 1)
    {
      sub_24659E1C8();
      return sub_24659DD38();
    }
    else
    {
      return sub_24659E1C8();
    }
  }
  else
  {
    sub_24659E1C8();
    if (v1)
    {
      return sub_24659E1D8();
    }
    else
    {
      sub_24659E1D8();
      return sub_24659E1E8();
    }
  }
}

uint64_t ManagedContentOfferState.Offer.hashValue.getter()
{
  return sub_24659E1F8();
}

uint64_t sub_2465781D8()
{
  return sub_24659E1F8();
}

uint64_t sub_246578230()
{
  return sub_24659E1F8();
}

uint64_t _s31_ManagedAppDistribution_SwiftUI0A17ContentOfferStateV0G0O2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(uint64_t *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16))
    {
      sub_246550978(*(void *)a1, v3, 0);
      sub_246550978(v5, v6, 0);
      if (v3)
      {
        if ((v6 & 1) == 0) {
          goto LABEL_59;
        }
      }
      else if ((v6 & 1) != 0 || *(double *)&v2 != *(double *)&v5)
      {
        goto LABEL_59;
      }
      char v9 = 1;
      return v9 & 1;
    }
LABEL_58:
    sub_246558E9C(v5, v6, v7);
    sub_246550978(v2, v3, v4);
    sub_246550978(v5, v6, v7);
LABEL_59:
    char v9 = 0;
    return v9 & 1;
  }
  if (v4 == 1)
  {
    if (v7 == 1)
    {
      if (v2 == v5 && v3 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = sub_24659E158();
      }
      sub_246558E9C(v5, v6, 1);
      sub_246558E9C(v2, v3, 1);
      sub_246550978(v2, v3, 1);
      sub_246550978(v5, v6, 1);
      return v9 & 1;
    }
    swift_bridgeObjectRetain();
    goto LABEL_58;
  }
  switch(v2)
  {
    case 1:
      if (v7 != 2 || v5 != 1 || v6 != 0) {
        goto LABEL_58;
      }
      sub_246550978(*(void *)a1, v3, 2);
      char v9 = 1;
      sub_246550978(1, 0, 2);
      return v9 & 1;
    case 2:
      if (v7 != 2 || v5 != 2 || v6 != 0) {
        goto LABEL_58;
      }
      sub_246550978(*(void *)a1, v3, 2);
      uint64_t v11 = 2;
      goto LABEL_64;
    case 3:
      if (v7 != 2 || v5 != 3 || v6 != 0) {
        goto LABEL_58;
      }
      sub_246550978(*(void *)a1, v3, 2);
      uint64_t v11 = 3;
      goto LABEL_64;
    case 4:
      if (v7 != 2 || v5 != 4 || v6 != 0) {
        goto LABEL_58;
      }
      sub_246550978(*(void *)a1, v3, 2);
      uint64_t v11 = 4;
      goto LABEL_64;
    default:
      if (v7 != 2 || (v6 | v5) != 0) {
        goto LABEL_58;
      }
      sub_246550978(*(void *)a1, v3, 2);
      uint64_t v11 = 0;
LABEL_64:
      sub_246550978(v11, 0, 2);
      char v9 = 1;
      break;
  }
  return v9 & 1;
}

unint64_t sub_2465784FC()
{
  unint64_t result = qword_268F8C5C0;
  if (!qword_268F8C5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5C0);
  }
  return result;
}

unint64_t sub_246578554()
{
  unint64_t result = qword_268F8C5C8;
  if (!qword_268F8C5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5C8);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentOfferState()
{
  return &type metadata for ManagedContentOfferState;
}

uint64_t destroy for ManagedContentOfferState.Offer(uint64_t a1)
{
  return sub_246550978(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_246558E9C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_246558E9C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_246550978(v6, v7, v8);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_246550978(v4, v5, v6);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_246578768(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_246578780(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentOfferState.Offer()
{
  return &type metadata for ManagedContentOfferState.Offer;
}

uint64_t sub_2465787AC()
{
  uint64_t v0 = sub_24659CE68();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unsigned int v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24659CE48();
  id v4 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v5 = (void *)sub_24659CE58();
  id v6 = objc_msgSend(v4, sel_initWithURL_, v5);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = sub_24659CE28();

  return v8;
}

BOOL sub_246578954(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_246578974()
{
  if (*v0) {
    return 0x656C797473;
  }
  else {
    return 0x4449707061;
  }
}

uint64_t sub_2465789A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246579B2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2465789C8()
{
  return 0;
}

void sub_2465789D4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2465789E0(uint64_t a1)
{
  unint64_t v2 = sub_246578C2C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246578A1C(uint64_t a1)
{
  unint64_t v2 = sub_246578C2C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ManagedAppViewConfiguration.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C5D0);
  uint64_t v9 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246578C2C();
  sub_24659E238();
  char v13 = 0;
  sub_24659E128();
  if (!v2)
  {
    char v12 = v10;
    char v11 = 1;
    sub_246578C80();
    sub_24659E138();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_246578C2C()
{
  unint64_t result = qword_268F8C5D8;
  if (!qword_268F8C5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5D8);
  }
  return result;
}

unint64_t sub_246578C80()
{
  unint64_t result = qword_268F8C5E0;
  if (!qword_268F8C5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5E0);
  }
  return result;
}

uint64_t ManagedAppViewConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C5E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246578C2C();
  sub_24659E218();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v9 = sub_24659E108();
  uint64_t v11 = v10;
  char v15 = 1;
  sub_246578ED0();
  swift_bridgeObjectRetain();
  sub_24659E118();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v12 = v16;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_246578ED0()
{
  unint64_t result = qword_268F8C5F0;
  if (!qword_268F8C5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C5F0);
  }
  return result;
}

uint64_t sub_246578F24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ManagedAppViewConfiguration.init(from:)(a1, a2);
}

uint64_t sub_246578F3C(void *a1)
{
  return ManagedAppViewConfiguration.encode(to:)(a1);
}

uint64_t sub_246578F54()
{
  if (*v0) {
    return 0x617246726566666FLL;
  }
  else {
    return 0x6769654877656976;
  }
}

uint64_t sub_246578F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246579C10(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246578FBC(uint64_t a1)
{
  unint64_t v2 = sub_246579204();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246578FF8(uint64_t a1)
{
  unint64_t v2 = sub_246579204();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ManagedAppReply.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C5F8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246579204();
  sub_24659E238();
  v14[0] = v9;
  char v15 = 0;
  sub_246579258();
  sub_24659E138();
  if (!v2)
  {
    v14[0] = v8;
    v14[1] = v10;
    v14[2] = v11;
    v14[3] = v12;
    char v15 = 1;
    type metadata accessor for CGRect(0);
    sub_246579504(&qword_268F8C610);
    sub_24659E138();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_246579204()
{
  unint64_t result = qword_268F8C600;
  if (!qword_268F8C600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C600);
  }
  return result;
}

unint64_t sub_246579258()
{
  unint64_t result = qword_268F8C608;
  if (!qword_268F8C608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C608);
  }
  return result;
}

uint64_t ManagedAppReply.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C618);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246579204();
  sub_24659E218();
  if (!v2)
  {
    char v14 = 0;
    sub_2465794B0();
    sub_24659E118();
    uint64_t v9 = *(void *)&v13[0];
    type metadata accessor for CGRect(0);
    char v14 = 1;
    sub_246579504(&qword_268F8C628);
    sub_24659E118();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v10 = v13[0];
    long long v11 = v13[1];
    *(void *)a2 = v9;
    *(_OWORD *)(a2 + 8) = v10;
    *(_OWORD *)(a2 + 24) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2465794B0()
{
  unint64_t result = qword_268F8C620;
  if (!qword_268F8C620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C620);
  }
  return result;
}

uint64_t sub_246579504(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246579548@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ManagedAppReply.init(from:)(a1, a2);
}

uint64_t sub_246579560(void *a1)
{
  return ManagedAppReply.encode(to:)(a1);
}

uint64_t destroy for ManagedAppViewConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s31_ManagedAppDistribution_SwiftUI27ManagedAppViewConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ManagedAppViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for ManagedAppViewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAppViewConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagedAppViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppViewConfiguration()
{
  return &type metadata for ManagedAppViewConfiguration;
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

uint64_t getEnumTagSinglePayload for ManagedAppReply(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ManagedAppReply(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppReply()
{
  return &type metadata for ManagedAppReply;
}

ValueMetadata *type metadata accessor for ManagedAppReply.CodingKeys()
{
  return &type metadata for ManagedAppReply.CodingKeys;
}

uint64_t getEnumTagSinglePayload for LogKey.Prefix(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s31_ManagedAppDistribution_SwiftUI15ManagedAppReplyV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x2465798D8);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_246579900(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppViewConfiguration.CodingKeys()
{
  return &type metadata for ManagedAppViewConfiguration.CodingKeys;
}

unint64_t sub_246579920()
{
  unint64_t result = qword_268F8C630;
  if (!qword_268F8C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C630);
  }
  return result;
}

unint64_t sub_246579978()
{
  unint64_t result = qword_268F8C638;
  if (!qword_268F8C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C638);
  }
  return result;
}

unint64_t sub_2465799D0()
{
  unint64_t result = qword_268F8C640;
  if (!qword_268F8C640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C640);
  }
  return result;
}

unint64_t sub_246579A28()
{
  unint64_t result = qword_268F8C648;
  if (!qword_268F8C648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C648);
  }
  return result;
}

unint64_t sub_246579A80()
{
  unint64_t result = qword_268F8C650;
  if (!qword_268F8C650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C650);
  }
  return result;
}

unint64_t sub_246579AD8()
{
  unint64_t result = qword_268F8C658[0];
  if (!qword_268F8C658[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268F8C658);
  }
  return result;
}

uint64_t sub_246579B2C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449707061 && a2 == 0xE500000000000000;
  if (v2 || (sub_24659E158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24659E158();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246579C10(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6769654877656976 && a2 == 0xEA00000000007468 || (sub_24659E158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617246726566666FLL && a2 == 0xEA0000000000656DLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24659E158();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246579D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void sub_246579D30()
{
  type metadata accessor for ManagedAppCellContext();
  if (v0 <= 0x3F)
  {
    sub_24655C308(319, (unint64_t *)&qword_268F8BD38, MEMORY[0x263F18520]);
    if (v1 <= 0x3F)
    {
      sub_24655C2AC();
      if (v2 <= 0x3F)
      {
        sub_24655C308(319, (unint64_t *)&qword_268F8BD50, MEMORY[0x263F19A00]);
        if (v3 <= 0x3F)
        {
          sub_24655C35C();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void *sub_246579EF0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  unint64_t v101 = (((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = sub_24659D278();
  uint64_t v97 = *(void *)(v7 - 8);
  uint64_t v98 = v7;
  int v8 = *(_DWORD *)(v97 + 80);
  uint64_t v102 = (v8 & 0xF8) + 16;
  unint64_t v103 = ~(unint64_t)(v8 & 0xF8) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v97 + 64) <= 8uLL) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = *(void *)(*(void *)(v7 - 8) + 64);
  }
  uint64_t v110 = sub_24659CE68();
  uint64_t v10 = *(void *)(v110 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  uint64_t v108 = v10;
  uint64_t v12 = v11 & 0xF8 | 7;
  uint64_t v105 = v9 + v12 + 1;
  uint64_t v106 = v9;
  uint64_t v104 = v12;
  unint64_t v13 = (v105 + ((v102 + ((v101 + 23) & 0xFFFFFFFFFFFFFFF8)) & v103)) & ~v12;
  if (*(_DWORD *)(v10 + 84)) {
    unint64_t v14 = *(void *)(v10 + 64);
  }
  else {
    unint64_t v14 = *(void *)(v10 + 64) + 1;
  }
  size_t __n = v14;
  if (v14 <= 8) {
    unint64_t v14 = 8;
  }
  unint64_t v109 = v14;
  unint64_t v15 = v14 + 1;
  uint64_t v16 = sub_24659D5D8();
  uint64_t v99 = *(void *)(v16 - 8);
  uint64_t v100 = v16;
  int v17 = *(_DWORD *)(v99 + 80);
  unint64_t v111 = v15;
  uint64_t v107 = v17 & 0xF8 | 7;
  unint64_t v18 = (v15 + v107 + v13) & ~v107;
  unint64_t v19 = *(void *)(v99 + 64);
  if (v19 <= 8) {
    unint64_t v19 = 8;
  }
  unint64_t v112 = v19;
  unint64_t v20 = v19 + 1;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(_DWORD *)(v22 + 80);
  unint64_t v113 = v20;
  int v24 = v11 | v8 | v17 | *(_DWORD *)(v5 + 80);
  unsigned int v25 = v24 & 0xF8 | v23;
  if (((v20 + v23 + v18) & ~v23) + *(void *)(v22 + 64) > 0x18
    || ((v24 | *(_DWORD *)(v22 + 80)) & 0x100000) != 0
    || v25 > 7)
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    uint64_t v29 = v28 + (((v25 | 7) + 16) & ~(unint64_t)(v25 | 7));
    swift_retain();
  }
  else
  {
    uint64_t v30 = *(_DWORD *)(v22 + 80);
    uint64_t v94 = *(void *)(v21 - 8);
    uint64_t v95 = v21;
    (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
    unint64_t v31 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v115 = (char *)a2 + 7;
    unint64_t v32 = (unint64_t)&v115[v6] & 0xFFFFFFFFFFFFFFF8;
    uint64_t v33 = *(void *)v32;
    uint64_t v34 = *(void *)(v32 + 8);
    char v35 = *(unsigned char *)(v32 + 16);
    sub_246558E8C(*(void *)v32, v34, v35);
    *(void *)unint64_t v31 = v33;
    *(void *)(v31 + 8) = v34;
    *(unsigned char *)(v31 + 16) = v35;
    *(void *)(v31 + 24) = *(void *)(v32 + 24);
    unint64_t v36 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v37 = (v32 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v38 = *(void *)(v37 + 24);
    swift_bridgeObjectRetain();
    if (v38 < 0xFFFFFFFF)
    {
      long long v42 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)unint64_t v36 = *(_OWORD *)v37;
      *(_OWORD *)(v36 + 16) = v42;
    }
    else
    {
      uint64_t v39 = *(void *)v37;
      uint64_t v40 = *(void *)(v37 + 8);
      char v41 = *(unsigned char *)(v37 + 16);
      sub_246558E8C(*(void *)v37, v40, v41);
      *(void *)unint64_t v36 = v39;
      *(void *)(v36 + 8) = v40;
      *(unsigned char *)(v36 + 16) = v41;
      *(void *)(v36 + 24) = *(void *)(v37 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v43 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v44 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v44 + 24) < 0xFFFFFFFFuLL)
    {
      long long v48 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)unint64_t v43 = *(_OWORD *)v44;
      *(_OWORD *)(v43 + 16) = v48;
    }
    else
    {
      uint64_t v45 = *(void *)v44;
      uint64_t v46 = *(void *)(v44 + 8);
      char v47 = *(unsigned char *)(v44 + 16);
      sub_246558E8C(*(void *)v44, v46, v47);
      *(void *)unint64_t v43 = v45;
      *(void *)(v43 + 8) = v46;
      *(unsigned char *)(v43 + 16) = v47;
      *(void *)(v43 + 24) = *(void *)(v44 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v49 = v101 + 16;
    unint64_t v50 = (v43 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v51 = (v44 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v51 + 24) < 0xFFFFFFFFuLL)
    {
      long long v55 = *(_OWORD *)(v51 + 16);
      *(_OWORD *)unint64_t v50 = *(_OWORD *)v51;
      *(_OWORD *)(v50 + 16) = v55;
    }
    else
    {
      uint64_t v52 = *(void *)v51;
      uint64_t v53 = *(void *)(v51 + 8);
      char v54 = *(unsigned char *)(v51 + 16);
      sub_246558E8C(*(void *)v51, v53, v54);
      *(void *)unint64_t v50 = v52;
      *(void *)(v50 + 8) = v53;
      *(unsigned char *)(v50 + 16) = v54;
      *(void *)(v50 + 24) = *(void *)(v51 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v56 = (v50 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v57 = (v51 + 39) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v58 = *(void *)v57;
    uint64_t v59 = *(void *)(v57 + 8);
    char v60 = *(unsigned char *)(v57 + 16);
    sub_246558E9C(*(void *)v57, v59, v60);
    *(void *)unint64_t v56 = v58;
    *(void *)(v56 + 8) = v59;
    *(unsigned char *)(v56 + 16) = v60;
    uint64_t v61 = (void *)((v50 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v62 = (void *)((v51 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v63 = v62[1];
    *uint64_t v61 = *v62;
    v61[1] = v63;
    unint64_t v64 = ((unint64_t)a1 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v65 = (unint64_t)&v115[v49] & 0xFFFFFFFFFFFFFFF8;
    uint64_t v66 = *(void *)v65;
    LOBYTE(v59) = *(unsigned char *)(v65 + 8);
    swift_retain();
    sub_246552D38(v66, v59);
    *(void *)unint64_t v64 = v66;
    *(unsigned char *)(v64 + 8) = v59;
    uint64_t v67 = (void *)((v102 + v64) & v103);
    uint64_t v68 = (unsigned __int8 *)((v102 + v65) & v103);
    unsigned int v69 = v68[v106];
    unsigned int v70 = v69 - 2;
    if (v69 < 2)
    {
      uint64_t v72 = v110;
      unint64_t v73 = v109;
      uint64_t v74 = v107;
    }
    else
    {
      if (v106 <= 3) {
        uint64_t v71 = v106;
      }
      else {
        uint64_t v71 = 4;
      }
      uint64_t v72 = v110;
      unint64_t v73 = v109;
      uint64_t v74 = v107;
      switch(v71)
      {
        case 1:
          int v75 = *v68;
          if (v106 < 4) {
            goto LABEL_40;
          }
          goto LABEL_42;
        case 2:
          int v75 = *(unsigned __int16 *)v68;
          if (v106 >= 4) {
            goto LABEL_42;
          }
          goto LABEL_40;
        case 3:
          int v75 = *(unsigned __int16 *)((v102 + v65) & v103) | (*(unsigned __int8 *)(((v102 + v65) & v103) + 2) << 16);
          if (v106 < 4) {
            goto LABEL_40;
          }
          goto LABEL_42;
        case 4:
          int v75 = *(_DWORD *)v68;
          if (v106 < 4) {
LABEL_40:
          }
            unsigned int v69 = (v75 | (v70 << (8 * v106))) + 2;
          else {
LABEL_42:
          }
            unsigned int v69 = v75 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v76 = ~v104;
    if (v69 == 1)
    {
      (*(void (**)(void *, unint64_t, uint64_t))(v97 + 16))(v67, (v102 + v65) & v103, v98);
      char v77 = 1;
    }
    else
    {
      *uint64_t v67 = *(void *)v68;
      swift_retain();
      char v77 = 0;
    }
    *((unsigned char *)v67 + v106) = v77;
    uint64_t v78 = (void *)(((unint64_t)v67 + v105) & v76);
    uint64_t v79 = (unsigned __int8 *)((unint64_t)&v68[v105] & v76);
    unsigned int v80 = v79[v73];
    unsigned int v81 = v80 - 2;
    if (v80 < 2)
    {
      uint64_t v83 = v108;
    }
    else
    {
      if (v73 <= 3) {
        uint64_t v82 = v73;
      }
      else {
        uint64_t v82 = 4;
      }
      uint64_t v83 = v108;
      switch(v82)
      {
        case 1:
          int v84 = *v79;
          if (v73 < 4) {
            goto LABEL_57;
          }
          goto LABEL_59;
        case 2:
          int v84 = *(unsigned __int16 *)v79;
          if (v73 >= 4) {
            goto LABEL_59;
          }
          goto LABEL_57;
        case 3:
          int v84 = *(unsigned __int16 *)v79 | (v79[2] << 16);
          if (v73 < 4) {
            goto LABEL_57;
          }
          goto LABEL_59;
        case 4:
          int v84 = *(_DWORD *)v79;
          if (v73 < 4) {
LABEL_57:
          }
            unsigned int v80 = (v84 | (v81 << (8 * v73))) + 2;
          else {
LABEL_59:
          }
            unsigned int v80 = v84 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v85 = ~v74;
    if (v80 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v83 + 48))(v79, 1, v72))
      {
        memcpy(v78, v79, __n);
      }
      else
      {
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v83 + 16))(v78, v79, v72);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v83 + 56))(v78, 0, 1, v72);
      }
      *((unsigned char *)v78 + v73) = 1;
    }
    else
    {
      void *v78 = *(void *)v79;
      *((unsigned char *)v78 + v73) = 0;
      swift_retain();
    }
    uint64_t v86 = (void *)(((unint64_t)v78 + v111 + v74) & v85);
    uint64_t v87 = (unsigned __int8 *)((unint64_t)&v79[v111 + v74] & v85);
    unsigned int v88 = v87[v112];
    unsigned int v89 = v88 - 2;
    if (v88 >= 2)
    {
      if (v112 <= 3) {
        uint64_t v90 = v112;
      }
      else {
        uint64_t v90 = 4;
      }
      switch(v90)
      {
        case 1:
          int v91 = *v87;
          if (v112 < 4) {
            goto LABEL_76;
          }
          goto LABEL_78;
        case 2:
          int v91 = *(unsigned __int16 *)v87;
          if (v112 >= 4) {
            goto LABEL_78;
          }
          goto LABEL_76;
        case 3:
          int v91 = *(unsigned __int16 *)((unint64_t)&v79[v111 + v74] & v85) | (*(unsigned __int8 *)(((unint64_t)&v79[v111 + v74] & v85) + 2) << 16);
          if (v112 < 4) {
            goto LABEL_76;
          }
          goto LABEL_78;
        case 4:
          int v91 = *(_DWORD *)v87;
          if (v112 < 4) {
LABEL_76:
          }
            unsigned int v88 = (v91 | (v89 << (8 * v112))) + 2;
          else {
LABEL_78:
          }
            unsigned int v88 = v91 + 2;
          break;
        default:
          break;
      }
    }
    if (v88 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v99 + 16))(v86, v87, v100);
      char v92 = 1;
    }
    else
    {
      void *v86 = *(void *)v87;
      swift_retain();
      char v92 = 0;
    }
    *((unsigned char *)v86 + v112) = v92;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v94 + 16))(((unint64_t)v86 + v113 + v30) & ~v30, (unint64_t)&v87[v113 + v30] & ~v30, v95);
    return a1;
  }
  return (void *)v29;
}

uint64_t sub_24657A7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  unint64_t v5 = (a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24655947C(*(void *)v5, *(void *)(v5 + 8), *(unsigned char *)(v5 + 16));
  swift_bridgeObjectRelease();
  unint64_t v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v7, *(void *)(v7 + 8), *(unsigned char *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v8 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v8 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v8, *(void *)(v8 + 8), *(unsigned char *)(v8 + 16));
    swift_bridgeObjectRelease();
  }
  sub_246550978(*(void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  swift_release();
  unint64_t v9 = (a1
      + ((((((((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_246552EF4(*(void *)v9, *(unsigned char *)(v9 + 8));
  uint64_t v10 = sub_24659D278();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  unint64_t v13 = (unsigned __int8 *)((v9 + v12 + 9) & ~v12);
  if (*(void *)(v11 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(v11 + 64);
  }
  unsigned int v15 = v13[v14];
  unsigned int v16 = v15 - 2;
  if (v15 >= 2)
  {
    if (v14 <= 3) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = 4;
    }
    switch(v17)
    {
      case 1:
        int v18 = *v13;
        goto LABEL_19;
      case 2:
        int v18 = *(unsigned __int16 *)v13;
        goto LABEL_19;
      case 3:
        int v18 = *(unsigned __int16 *)v13 | (v13[2] << 16);
        goto LABEL_19;
      case 4:
        int v18 = *(_DWORD *)v13;
LABEL_19:
        int v19 = (v18 | (v16 << (8 * v14))) + 2;
        unsigned int v15 = v18 + 2;
        if (v14 < 4) {
          unsigned int v15 = v19;
        }
        break;
      default:
        break;
    }
  }
  if (v15 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(v13, v10);
  }
  else {
    swift_release();
  }
  unint64_t v20 = &v13[v14];
  uint64_t v21 = sub_24659CE68();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(_DWORD *)(v22 + 80) & 0xF8 | 7;
  int v24 = (unsigned __int8 *)((unint64_t)&v20[v23 + 1] & ~v23);
  unint64_t v25 = *(void *)(v22 + 64);
  if (!*(_DWORD *)(v22 + 84)) {
    ++v25;
  }
  if (v25 <= 8) {
    uint64_t v26 = 8;
  }
  else {
    uint64_t v26 = v25;
  }
  unsigned int v27 = v24[v26];
  unsigned int v28 = v27 - 2;
  if (v27 >= 2)
  {
    if (v26 <= 3) {
      uint64_t v29 = v26;
    }
    else {
      uint64_t v29 = 4;
    }
    switch(v29)
    {
      case 1:
        int v30 = *v24;
        goto LABEL_38;
      case 2:
        int v30 = *(unsigned __int16 *)v24;
        goto LABEL_38;
      case 3:
        int v30 = *(unsigned __int16 *)v24 | (v24[2] << 16);
        goto LABEL_38;
      case 4:
        int v30 = *(_DWORD *)v24;
LABEL_38:
        int v31 = (v30 | (v28 << (8 * v26))) + 2;
        unsigned int v27 = v30 + 2;
        if (v26 < 4) {
          unsigned int v27 = v31;
        }
        break;
      default:
        break;
    }
  }
  if (v27 == 1)
  {
    if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v22 + 48))(v24, 1, v21)) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v22 + 8))(v24, v21);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v32 = sub_24659D5D8();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(_DWORD *)(v33 + 80) & 0xF8 | 7;
  char v35 = (unsigned __int8 *)((unint64_t)&v24[v26 + 1 + v34] & ~v34);
  if (*(void *)(v33 + 64) <= 8uLL) {
    uint64_t v36 = 8;
  }
  else {
    uint64_t v36 = *(void *)(v33 + 64);
  }
  unsigned int v37 = v35[v36];
  unsigned int v38 = v37 - 2;
  if (v37 >= 2)
  {
    if (v36 <= 3) {
      uint64_t v39 = v36;
    }
    else {
      uint64_t v39 = 4;
    }
    switch(v39)
    {
      case 1:
        int v40 = *v35;
        goto LABEL_56;
      case 2:
        int v40 = *(unsigned __int16 *)v35;
        goto LABEL_56;
      case 3:
        int v40 = *(unsigned __int16 *)v35 | (v35[2] << 16);
        goto LABEL_56;
      case 4:
        int v40 = *(_DWORD *)v35;
LABEL_56:
        int v41 = (v40 | (v38 << (8 * v36))) + 2;
        unsigned int v37 = v40 + 2;
        if (v36 < 4) {
          unsigned int v37 = v41;
        }
        break;
      default:
        break;
    }
  }
  if (v37 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v33 + 8))(v35, v32);
  }
  else {
    swift_release();
  }
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v43 = *(void *)(v42 - 8);
  unint64_t v44 = *(uint64_t (**)(unint64_t, uint64_t))(v43 + 8);
  uint64_t v45 = v42;
  unint64_t v46 = (unint64_t)&v35[v36 + 1 + *(unsigned __int8 *)(v43 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);

  return v44(v46, v45);
}

uint64_t sub_24657AD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  unint64_t v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = *(void *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    long long v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    uint64_t v15 = *(void *)v13;
    uint64_t v16 = *(void *)(v13 + 8);
    char v17 = *(unsigned char *)(v13 + 16);
    sub_246558E8C(*(void *)v13, v16, v17);
    *(void *)unint64_t v12 = v15;
    *(void *)(v12 + 8) = v16;
    *(unsigned char *)(v12 + 16) = v17;
    *(void *)(v12 + 24) = *(void *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    long long v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    uint64_t v21 = *(void *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    char v23 = *(unsigned char *)(v20 + 16);
    sub_246558E8C(*(void *)v20, v22, v23);
    *(void *)unint64_t v19 = v21;
    *(void *)(v19 + 8) = v22;
    *(unsigned char *)(v19 + 16) = v23;
    *(void *)(v19 + 24) = *(void *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    long long v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)unint64_t v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    uint64_t v27 = *(void *)v26;
    uint64_t v28 = *(void *)(v26 + 8);
    char v29 = *(unsigned char *)(v26 + 16);
    sub_246558E8C(*(void *)v26, v28, v29);
    *(void *)unint64_t v25 = v27;
    *(void *)(v25 + 8) = v28;
    *(unsigned char *)(v25 + 16) = v29;
    *(void *)(v25 + 24) = *(void *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  uint64_t v34 = *(void *)(v32 + 8);
  char v35 = *(unsigned char *)(v32 + 16);
  sub_246558E9C(*(void *)v32, v34, v35);
  *(void *)unint64_t v31 = v33;
  *(void *)(v31 + 8) = v34;
  *(unsigned char *)(v31 + 16) = v35;
  uint64_t v36 = (void *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v37 = (void *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v38 = v37[1];
  void *v36 = *v37;
  v36[1] = v38;
  unint64_t v39 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v40 = (a1 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (a2 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v42 = *(void *)v41;
  LOBYTE(v33) = *(unsigned char *)(v41 + 8);
  swift_retain();
  sub_246552D38(v42, v33);
  *(void *)unint64_t v40 = v42;
  *(unsigned char *)(v40 + 8) = v33;
  uint64_t v43 = sub_24659D278();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(_DWORD *)(v44 + 80) & 0xF8;
  uint64_t v46 = v45 + 16;
  unint64_t v47 = v45 + 16 + v40;
  unint64_t v48 = ~v45 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v49 = (void *)(v47 & v48);
  unint64_t v50 = (unsigned __int8 *)((v46 + v41) & v48);
  if (*(void *)(v44 + 64) <= 8uLL) {
    uint64_t v51 = 8;
  }
  else {
    uint64_t v51 = *(void *)(*(void *)(v43 - 8) + 64);
  }
  unsigned int v52 = v50[v51];
  unsigned int v53 = v52 - 2;
  if (v52 >= 2)
  {
    if (v51 <= 3) {
      uint64_t v54 = v51;
    }
    else {
      uint64_t v54 = 4;
    }
    switch(v54)
    {
      case 1:
        int v55 = *v50;
        goto LABEL_22;
      case 2:
        int v55 = *(unsigned __int16 *)v50;
        goto LABEL_22;
      case 3:
        int v55 = *(unsigned __int16 *)((v46 + v41) & v48) | (*(unsigned __int8 *)(((v46 + v41) & v48) + 2) << 16);
        goto LABEL_22;
      case 4:
        int v55 = *(_DWORD *)v50;
LABEL_22:
        int v56 = (v55 | (v53 << (8 * v51))) + 2;
        unsigned int v52 = v55 + 2;
        if (v51 < 4) {
          unsigned int v52 = v56;
        }
        break;
      default:
        break;
    }
  }
  if (v52 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v44 + 16))(v49, v50, v43);
    char v57 = 1;
  }
  else
  {
    *unint64_t v49 = *(void *)v50;
    swift_retain();
    char v57 = 0;
  }
  *((unsigned char *)v49 + v51) = v57;
  uint64_t v58 = v51 + 1;
  uint64_t v59 = sub_24659CE68();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(_DWORD *)(v60 + 80) & 0xF8 | 7;
  unint64_t v62 = (unint64_t)&v50[v58 + v61];
  uint64_t v63 = (void *)(((unint64_t)v49 + v58 + v61) & ~v61);
  unint64_t v64 = (unsigned __int8 *)(v62 & ~v61);
  if (*(_DWORD *)(v60 + 84)) {
    size_t v65 = *(void *)(v60 + 64);
  }
  else {
    size_t v65 = *(void *)(v60 + 64) + 1;
  }
  if (v65 <= 8) {
    uint64_t v66 = 8;
  }
  else {
    uint64_t v66 = v65;
  }
  unsigned int v67 = v64[v66];
  unsigned int v68 = v67 - 2;
  if (v67 >= 2)
  {
    if (v66 <= 3) {
      uint64_t v69 = v66;
    }
    else {
      uint64_t v69 = 4;
    }
    switch(v69)
    {
      case 1:
        int v70 = *v64;
        goto LABEL_42;
      case 2:
        int v70 = *(unsigned __int16 *)v64;
        goto LABEL_42;
      case 3:
        int v70 = *(unsigned __int16 *)v64 | (v64[2] << 16);
        goto LABEL_42;
      case 4:
        int v70 = *(_DWORD *)v64;
LABEL_42:
        int v71 = (v70 | (v68 << (8 * v66))) + 2;
        unsigned int v67 = v70 + 2;
        if (v66 < 4) {
          unsigned int v67 = v71;
        }
        break;
      default:
        break;
    }
  }
  if (v67 == 1)
  {
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v60 + 48))(v64, 1, v59))
    {
      memcpy(v63, v64, v65);
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v60 + 16))(v63, v64, v59);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v60 + 56))(v63, 0, 1, v59);
    }
    *((unsigned char *)v63 + v66) = 1;
  }
  else
  {
    *uint64_t v63 = *(void *)v64;
    *((unsigned char *)v63 + v66) = 0;
    swift_retain();
  }
  uint64_t v72 = sub_24659D5D8();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(_DWORD *)(v73 + 80) & 0xF8 | 7;
  uint64_t v75 = v66 + v74 + 1;
  uint64_t v76 = (void *)(((unint64_t)v63 + v75) & ~v74);
  char v77 = (unsigned __int8 *)((unint64_t)&v64[v75] & ~v74);
  if (*(void *)(v73 + 64) <= 8uLL) {
    uint64_t v78 = 8;
  }
  else {
    uint64_t v78 = *(void *)(v73 + 64);
  }
  unsigned int v79 = v77[v78];
  unsigned int v80 = v79 - 2;
  if (v79 >= 2)
  {
    if (v78 <= 3) {
      uint64_t v81 = v78;
    }
    else {
      uint64_t v81 = 4;
    }
    switch(v81)
    {
      case 1:
        int v82 = *v77;
        goto LABEL_62;
      case 2:
        int v82 = *(unsigned __int16 *)v77;
        goto LABEL_62;
      case 3:
        int v82 = *(unsigned __int16 *)v77 | (v77[2] << 16);
        goto LABEL_62;
      case 4:
        int v82 = *(_DWORD *)v77;
LABEL_62:
        int v83 = (v82 | (v80 << (8 * v78))) + 2;
        unsigned int v79 = v82 + 2;
        if (v78 < 4) {
          unsigned int v79 = v83;
        }
        break;
      default:
        break;
    }
  }
  if (v79 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v73 + 16))(v76, v77, v72);
    char v84 = 1;
  }
  else
  {
    *uint64_t v76 = *(void *)v77;
    swift_retain();
    char v84 = 0;
  }
  *((unsigned char *)v76 + v78) = v84;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v86 = *(void *)(v85 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v86 + 16))(((unint64_t)v76 + v78 + *(unsigned __int8 *)(v86 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80), (unint64_t)&v77[v78 + 1 + *(unsigned __int8 *)(v86 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v86 + 80), v85);
  return a1;
}

uint64_t sub_24657B438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  uint64_t v12 = *(void *)v7;
  uint64_t v13 = *(void *)(v7 + 8);
  char v14 = *(unsigned char *)(v7 + 16);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  sub_24655947C(v12, v13, v14);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = *(void *)(v16 + 24);
  if (*(void *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v24 = *(void *)v16;
      uint64_t v25 = *(void *)(v16 + 8);
      char v26 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v25, v26);
      *(void *)unint64_t v15 = v24;
      *(void *)(v15 + 8) = v25;
      *(unsigned char *)(v15 + 16) = v26;
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v18 = *(void *)v16;
      uint64_t v19 = *(void *)(v16 + 8);
      char v20 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v19, v20);
      uint64_t v21 = *(void *)v15;
      uint64_t v22 = *(void *)(v15 + 8);
      char v23 = *(unsigned char *)(v15 + 16);
      *(void *)unint64_t v15 = v18;
      *(void *)(v15 + 8) = v19;
      *(unsigned char *)(v15 + 16) = v20;
      sub_24655947C(v21, v22, v23);
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_24655947C(*(void *)v15, *(void *)(v15 + 8), *(unsigned char *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  long long v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  unint64_t v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = *(void *)(v29 + 24);
  if (*(void *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v37 = *(void *)v29;
      uint64_t v38 = *(void *)(v29 + 8);
      char v39 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v38, v39);
      *(void *)unint64_t v28 = v37;
      *(void *)(v28 + 8) = v38;
      *(unsigned char *)(v28 + 16) = v39;
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v31 = *(void *)v29;
      uint64_t v32 = *(void *)(v29 + 8);
      char v33 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v32, v33);
      uint64_t v34 = *(void *)v28;
      uint64_t v35 = *(void *)(v28 + 8);
      char v36 = *(unsigned char *)(v28 + 16);
      *(void *)unint64_t v28 = v31;
      *(void *)(v28 + 8) = v32;
      *(unsigned char *)(v28 + 16) = v33;
      sub_24655947C(v34, v35, v36);
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_24655947C(*(void *)v28, *(void *)(v28 + 8), *(unsigned char *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  long long v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)unint64_t v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  unint64_t v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = *(void *)(v42 + 24);
  if (*(void *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v50 = *(void *)v42;
      uint64_t v51 = *(void *)(v42 + 8);
      char v52 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v51, v52);
      *(void *)unint64_t v41 = v50;
      *(void *)(v41 + 8) = v51;
      *(unsigned char *)(v41 + 16) = v52;
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v44 = *(void *)v42;
      uint64_t v45 = *(void *)(v42 + 8);
      char v46 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v45, v46);
      uint64_t v47 = *(void *)v41;
      uint64_t v48 = *(void *)(v41 + 8);
      char v49 = *(unsigned char *)(v41 + 16);
      *(void *)unint64_t v41 = v44;
      *(void *)(v41 + 8) = v45;
      *(unsigned char *)(v41 + 16) = v46;
      sub_24655947C(v47, v48, v49);
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_24655947C(*(void *)v41, *(void *)(v41 + 8), *(unsigned char *)(v41 + 16));
    swift_bridgeObjectRelease();
  }
  long long v53 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)unint64_t v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + 16) = v53;
LABEL_22:
  unint64_t v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v56 = *(void *)v55;
  uint64_t v57 = *(void *)(v55 + 8);
  char v58 = *(unsigned char *)(v55 + 16);
  sub_246558E9C(*(void *)v55, v57, v58);
  uint64_t v59 = *(void *)v54;
  uint64_t v60 = *(void *)(v54 + 8);
  *(void *)unint64_t v54 = v56;
  *(void *)(v54 + 8) = v57;
  char v61 = *(unsigned char *)(v54 + 16);
  *(unsigned char *)(v54 + 16) = v58;
  sub_246550978(v59, v60, v61);
  unint64_t v62 = (void *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v63 = (void *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v64 = v63[1];
  *unint64_t v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  unint64_t v65 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v66 = (a1 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v67 = (a2 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v68 = *(void *)v67;
  LOBYTE(v56) = *(unsigned char *)(v67 + 8);
  sub_246552D38(*(void *)v67, v56);
  uint64_t v69 = *(void *)v66;
  char v70 = *(unsigned char *)(v66 + 8);
  *(void *)unint64_t v66 = v68;
  *(unsigned char *)(v66 + 8) = v56;
  sub_246552EF4(v69, v70);
  uint64_t v71 = sub_24659D278();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  uint64_t v74 = v73 + 16;
  unint64_t v75 = v73 + 16 + v66;
  unint64_t v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  char v77 = (unsigned __int8 *)(v75 & v76);
  uint64_t v78 = (unsigned __int8 *)((v74 + v67) & v76);
  if (*(void *)(v72 + 64) <= 8uLL) {
    uint64_t v79 = 8;
  }
  else {
    uint64_t v79 = *(void *)(*(void *)(v71 - 8) + 64);
  }
  if (v77 != v78)
  {
    uint64_t v80 = v71;
    unsigned int v81 = v77[v79];
    unsigned int v82 = v81 - 2;
    if (v81 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v83 = v79;
      }
      else {
        uint64_t v83 = 4;
      }
      switch(v83)
      {
        case 1:
          int v84 = *v77;
          goto LABEL_35;
        case 2:
          int v84 = *(unsigned __int16 *)v77;
          goto LABEL_35;
        case 3:
          int v84 = *(unsigned __int16 *)(v75 & v76) | (*(unsigned __int8 *)((v75 & v76) + 2) << 16);
          goto LABEL_35;
        case 4:
          int v84 = *(_DWORD *)v77;
LABEL_35:
          int v85 = (v84 | (v82 << (8 * v79))) + 2;
          unsigned int v81 = v84 + 2;
          if (v79 < 4) {
            unsigned int v81 = v85;
          }
          break;
        default:
          break;
      }
    }
    if (v81 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v72 + 8))(v77, v71);
    }
    else {
      swift_release();
    }
    unsigned int v86 = v78[v79];
    unsigned int v87 = v86 - 2;
    if (v86 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v88 = v79;
      }
      else {
        uint64_t v88 = 4;
      }
      switch(v88)
      {
        case 1:
          int v89 = *v78;
          goto LABEL_49;
        case 2:
          int v89 = *(unsigned __int16 *)v78;
          goto LABEL_49;
        case 3:
          int v89 = *(unsigned __int16 *)v78 | (v78[2] << 16);
          goto LABEL_49;
        case 4:
          int v89 = *(_DWORD *)v78;
LABEL_49:
          int v90 = (v89 | (v87 << (8 * v79))) + 2;
          unsigned int v86 = v89 + 2;
          if (v79 < 4) {
            unsigned int v86 = v90;
          }
          break;
        default:
          break;
      }
    }
    if (v86 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v72 + 16))(v77, v78, v80);
      v77[v79] = 1;
    }
    else
    {
      *(void *)char v77 = *(void *)v78;
      v77[v79] = 0;
      swift_retain();
    }
  }
  uint64_t v91 = sub_24659CE68();
  uint64_t v92 = *(void *)(v91 - 8);
  int v93 = *(_DWORD *)(v92 + 84);
  uint64_t v94 = *(_DWORD *)(v92 + 80) & 0xF8 | 7;
  uint64_t v95 = v79 + v94 + 1;
  unint64_t v96 = (unint64_t)&v77[v95];
  unint64_t v97 = (unint64_t)&v78[v95];
  uint64_t v98 = (unsigned __int8 *)(v96 & ~v94);
  uint64_t v99 = (unsigned __int8 *)(v97 & ~v94);
  unint64_t v100 = *(void *)(v92 + 64);
  if (v98 != v99)
  {
    uint64_t v101 = v91;
    if (v93) {
      size_t v102 = *(void *)(v92 + 64);
    }
    else {
      size_t v102 = v100 + 1;
    }
    if (v102 <= 8) {
      uint64_t v103 = 8;
    }
    else {
      uint64_t v103 = v102;
    }
    unsigned int v104 = v98[v103];
    unsigned int v105 = v104 - 2;
    if (v104 >= 2)
    {
      if (v103 <= 3) {
        uint64_t v106 = v103;
      }
      else {
        uint64_t v106 = 4;
      }
      switch(v106)
      {
        case 1:
          int v107 = *v98;
          goto LABEL_70;
        case 2:
          int v107 = *(unsigned __int16 *)v98;
          goto LABEL_70;
        case 3:
          int v107 = *(unsigned __int16 *)v98 | (v98[2] << 16);
          goto LABEL_70;
        case 4:
          int v107 = *(_DWORD *)v98;
LABEL_70:
          int v108 = (v107 | (v105 << (8 * v103))) + 2;
          unsigned int v104 = v107 + 2;
          if (v103 < 4) {
            unsigned int v104 = v108;
          }
          break;
        default:
          break;
      }
    }
    if (v104 == 1)
    {
      if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v92 + 48))(v98, 1, v91)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v92 + 8))(v98, v101);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v109 = v99[v103];
    unsigned int v110 = v109 - 2;
    if (v109 >= 2)
    {
      if (v103 <= 3) {
        uint64_t v111 = v103;
      }
      else {
        uint64_t v111 = 4;
      }
      switch(v111)
      {
        case 1:
          int v112 = *v99;
          goto LABEL_85;
        case 2:
          int v112 = *(unsigned __int16 *)v99;
          goto LABEL_85;
        case 3:
          int v112 = *(unsigned __int16 *)v99 | (v99[2] << 16);
          goto LABEL_85;
        case 4:
          int v112 = *(_DWORD *)v99;
LABEL_85:
          int v113 = (v112 | (v110 << (8 * v103))) + 2;
          unsigned int v109 = v112 + 2;
          if (v103 < 4) {
            unsigned int v109 = v113;
          }
          break;
        default:
          break;
      }
    }
    if (v109 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v92 + 48))(v99, 1, v101))
      {
        memcpy(v98, v99, v102);
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v92 + 16))(v98, v99, v101);
        (*(void (**)(unsigned __int8 *, void, uint64_t, uint64_t))(v92 + 56))(v98, 0, 1, v101);
      }
      v98[v103] = 1;
    }
    else
    {
      *(void *)uint64_t v98 = *(void *)v99;
      v98[v103] = 0;
      swift_retain();
    }
  }
  if (v93) {
    unint64_t v114 = v100;
  }
  else {
    unint64_t v114 = v100 + 1;
  }
  uint64_t v115 = 8;
  if (v114 <= 8) {
    uint64_t v116 = 8;
  }
  else {
    uint64_t v116 = v114;
  }
  uint64_t v117 = sub_24659D5D8();
  uint64_t v118 = *(void *)(v117 - 8);
  uint64_t v119 = *(_DWORD *)(v118 + 80) & 0xF8 | 7;
  uint64_t v120 = v116 + v119 + 1;
  long long v121 = (unsigned __int8 *)((unint64_t)&v98[v120] & ~v119);
  long long v122 = (unsigned __int8 *)((unint64_t)&v99[v120] & ~v119);
  if (*(void *)(v118 + 64) > 8uLL) {
    uint64_t v115 = *(void *)(v118 + 64);
  }
  if (v121 != v122)
  {
    uint64_t v123 = v117;
    unsigned int v124 = v121[v115];
    unsigned int v125 = v124 - 2;
    if (v124 >= 2)
    {
      if (v115 <= 3) {
        uint64_t v126 = v115;
      }
      else {
        uint64_t v126 = 4;
      }
      switch(v126)
      {
        case 1:
          int v127 = *v121;
          goto LABEL_111;
        case 2:
          int v127 = *(unsigned __int16 *)v121;
          goto LABEL_111;
        case 3:
          int v127 = *(unsigned __int16 *)v121 | (v121[2] << 16);
          goto LABEL_111;
        case 4:
          int v127 = *(_DWORD *)v121;
LABEL_111:
          int v128 = (v127 | (v125 << (8 * v115))) + 2;
          unsigned int v124 = v127 + 2;
          if (v115 < 4) {
            unsigned int v124 = v128;
          }
          break;
        default:
          break;
      }
    }
    if (v124 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v118 + 8))(v121, v117);
    }
    else {
      swift_release();
    }
    unsigned int v129 = v122[v115];
    unsigned int v130 = v129 - 2;
    if (v129 >= 2)
    {
      if (v115 <= 3) {
        uint64_t v131 = v115;
      }
      else {
        uint64_t v131 = 4;
      }
      switch(v131)
      {
        case 1:
          int v132 = *v122;
          goto LABEL_125;
        case 2:
          int v132 = *(unsigned __int16 *)v122;
          goto LABEL_125;
        case 3:
          int v132 = *(unsigned __int16 *)v122 | (v122[2] << 16);
          goto LABEL_125;
        case 4:
          int v132 = *(_DWORD *)v122;
LABEL_125:
          int v133 = (v132 | (v130 << (8 * v115))) + 2;
          unsigned int v129 = v132 + 2;
          if (v115 < 4) {
            unsigned int v129 = v133;
          }
          break;
        default:
          break;
      }
    }
    if (v129 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v118 + 16))(v121, v122, v123);
      v121[v115] = 1;
    }
    else
    {
      *(void *)long long v121 = *(void *)v122;
      v121[v115] = 0;
      swift_retain();
    }
  }
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v135 = *(void *)(v134 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v135 + 24))((unint64_t)&v121[v115 + 1 + *(unsigned __int8 *)(v135 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v135 + 80), (unint64_t)&v122[v115 + 1 + *(unsigned __int8 *)(v135 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v135 + 80), v134);
  return a1;
}

uint64_t sub_24657BF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  unint64_t v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v18 = v17[1];
  *unint64_t v16 = *v17;
  v16[1] = v18;
  unint64_t v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v21 = *(unsigned char *)(v20 + 16);
  *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  *(unsigned char *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v23 = (a1 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (a2 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v22) = *(unsigned char *)(v24 + 8);
  *(void *)unint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = v22;
  uint64_t v25 = sub_24659D278();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  uint64_t v28 = v27 + 16;
  unint64_t v29 = v27 + 16 + v23;
  unint64_t v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = (void *)(v29 & v30);
  uint64_t v32 = (unsigned __int8 *)((v28 + v24) & v30);
  if (*(void *)(v26 + 64) <= 8uLL) {
    uint64_t v33 = 8;
  }
  else {
    uint64_t v33 = *(void *)(*(void *)(v25 - 8) + 64);
  }
  unsigned int v34 = v32[v33];
  unsigned int v35 = v34 - 2;
  if (v34 >= 2)
  {
    if (v33 <= 3) {
      uint64_t v36 = v33;
    }
    else {
      uint64_t v36 = 4;
    }
    switch(v36)
    {
      case 1:
        int v37 = *v32;
        goto LABEL_13;
      case 2:
        int v37 = *(unsigned __int16 *)v32;
        goto LABEL_13;
      case 3:
        int v37 = *(unsigned __int16 *)v32 | (v32[2] << 16);
        goto LABEL_13;
      case 4:
        int v37 = *(_DWORD *)v32;
LABEL_13:
        int v38 = (v37 | (v35 << (8 * v33))) + 2;
        unsigned int v34 = v37 + 2;
        if (v33 < 4) {
          unsigned int v34 = v38;
        }
        break;
      default:
        break;
    }
  }
  if (v34 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v26 + 32))(v31, v32, v25);
    char v39 = 1;
  }
  else
  {
    char v39 = 0;
    *uint64_t v31 = *(void *)v32;
  }
  *((unsigned char *)v31 + v33) = v39;
  uint64_t v40 = v33 + 1;
  uint64_t v41 = sub_24659CE68();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(_DWORD *)(v42 + 80) & 0xF8 | 7;
  unint64_t v44 = (unint64_t)&v32[v40 + v43];
  uint64_t v45 = (void *)(((unint64_t)v31 + v40 + v43) & ~v43);
  char v46 = (unsigned __int8 *)(v44 & ~v43);
  if (*(_DWORD *)(v42 + 84)) {
    size_t v47 = *(void *)(v42 + 64);
  }
  else {
    size_t v47 = *(void *)(v42 + 64) + 1;
  }
  if (v47 <= 8) {
    uint64_t v48 = 8;
  }
  else {
    uint64_t v48 = v47;
  }
  unsigned int v49 = v46[v48];
  unsigned int v50 = v49 - 2;
  if (v49 >= 2)
  {
    if (v48 <= 3) {
      uint64_t v51 = v48;
    }
    else {
      uint64_t v51 = 4;
    }
    switch(v51)
    {
      case 1:
        int v52 = *v46;
        goto LABEL_33;
      case 2:
        int v52 = *(unsigned __int16 *)v46;
        goto LABEL_33;
      case 3:
        int v52 = *(unsigned __int16 *)v46 | (v46[2] << 16);
        goto LABEL_33;
      case 4:
        int v52 = *(_DWORD *)v46;
LABEL_33:
        int v53 = (v52 | (v50 << (8 * v48))) + 2;
        unsigned int v49 = v52 + 2;
        if (v48 < 4) {
          unsigned int v49 = v53;
        }
        break;
      default:
        break;
    }
  }
  if (v49 == 1)
  {
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v42 + 48))(v46, 1, v41))
    {
      memcpy(v45, v46, v47);
      char v54 = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v42 + 32))(v45, v46, v41);
      char v54 = 1;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v41);
    }
  }
  else
  {
    char v54 = 0;
    void *v45 = *(void *)v46;
  }
  *((unsigned char *)v45 + v48) = v54;
  uint64_t v55 = sub_24659D5D8();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(_DWORD *)(v56 + 80) & 0xF8 | 7;
  uint64_t v58 = v48 + v57 + 1;
  uint64_t v59 = (void *)(((unint64_t)v45 + v58) & ~v57);
  uint64_t v60 = (unsigned __int8 *)((unint64_t)&v46[v58] & ~v57);
  if (*(void *)(v56 + 64) <= 8uLL) {
    uint64_t v61 = 8;
  }
  else {
    uint64_t v61 = *(void *)(v56 + 64);
  }
  unsigned int v62 = v60[v61];
  unsigned int v63 = v62 - 2;
  if (v62 >= 2)
  {
    if (v61 <= 3) {
      uint64_t v64 = v61;
    }
    else {
      uint64_t v64 = 4;
    }
    switch(v64)
    {
      case 1:
        int v65 = *v60;
        goto LABEL_52;
      case 2:
        int v65 = *(unsigned __int16 *)v60;
        goto LABEL_52;
      case 3:
        int v65 = *(unsigned __int16 *)v60 | (v60[2] << 16);
        goto LABEL_52;
      case 4:
        int v65 = *(_DWORD *)v60;
LABEL_52:
        int v66 = (v65 | (v63 << (8 * v61))) + 2;
        unsigned int v62 = v65 + 2;
        if (v61 < 4) {
          unsigned int v62 = v66;
        }
        break;
      default:
        break;
    }
  }
  if (v62 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v56 + 32))(v59, v60, v55);
    char v67 = 1;
  }
  else
  {
    char v67 = 0;
    void *v59 = *(void *)v60;
  }
  *((unsigned char *)v59 + v61) = v67;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v69 = *(void *)(v68 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v69 + 32))(((unint64_t)v59 + v61 + *(unsigned __int8 *)(v69 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80), (unint64_t)&v60[v61 + 1 + *(unsigned __int8 *)(v69 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v69 + 80), v68);
  return a1;
}

uint64_t sub_24657C548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  char v9 = *(unsigned char *)(v8 + 16);
  uint64_t v10 = *(void *)v7;
  uint64_t v11 = *(void *)(v7 + 8);
  char v12 = *(unsigned char *)(v7 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = v9;
  sub_24655947C(v10, v11, v12);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRelease();
  unint64_t v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      char v15 = *(unsigned char *)(v14 + 16);
      uint64_t v16 = *(void *)v13;
      uint64_t v17 = *(void *)(v13 + 8);
      char v18 = *(unsigned char *)(v13 + 16);
      *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
      *(unsigned char *)(v13 + 16) = v15;
      sub_24655947C(v16, v17, v18);
      *(void *)(v13 + 24) = *(void *)(v14 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_24655947C(*(void *)v13, *(void *)(v13 + 8), *(unsigned char *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  long long v19 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v19;
LABEL_6:
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v21 + 24) >= 0xFFFFFFFFuLL)
    {
      char v22 = *(unsigned char *)(v21 + 16);
      uint64_t v23 = *(void *)v20;
      uint64_t v24 = *(void *)(v20 + 8);
      char v25 = *(unsigned char *)(v20 + 16);
      *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
      *(unsigned char *)(v20 + 16) = v22;
      sub_24655947C(v23, v24, v25);
      *(void *)(v20 + 24) = *(void *)(v21 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_24655947C(*(void *)v20, *(void *)(v20 + 8), *(unsigned char *)(v20 + 16));
    swift_bridgeObjectRelease();
  }
  long long v26 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v26;
LABEL_11:
  unint64_t v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v27 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v28 + 24) >= 0xFFFFFFFFuLL)
    {
      char v29 = *(unsigned char *)(v28 + 16);
      uint64_t v30 = *(void *)v27;
      uint64_t v31 = *(void *)(v27 + 8);
      char v32 = *(unsigned char *)(v27 + 16);
      *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
      *(unsigned char *)(v27 + 16) = v29;
      sub_24655947C(v30, v31, v32);
      *(void *)(v27 + 24) = *(void *)(v28 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_24655947C(*(void *)v27, *(void *)(v27 + 8), *(unsigned char *)(v27 + 16));
    swift_bridgeObjectRelease();
  }
  long long v33 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v33;
LABEL_16:
  unint64_t v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v36 = *(unsigned char *)(v35 + 16);
  uint64_t v37 = *(void *)v34;
  uint64_t v38 = *(void *)(v34 + 8);
  *(_OWORD *)unint64_t v34 = *(_OWORD *)v35;
  char v39 = *(unsigned char *)(v34 + 16);
  *(unsigned char *)(v34 + 16) = v36;
  sub_246550978(v37, v38, v39);
  *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v28 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  unint64_t v40 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v41 = (a1 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (a2 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  char v43 = *(unsigned char *)(v42 + 8);
  uint64_t v44 = *(void *)v41;
  char v45 = *(unsigned char *)(v41 + 8);
  *(void *)unint64_t v41 = *(void *)v42;
  *(unsigned char *)(v41 + 8) = v43;
  sub_246552EF4(v44, v45);
  uint64_t v46 = sub_24659D278();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(_DWORD *)(v47 + 80) & 0xF8;
  uint64_t v49 = v48 + 16;
  unint64_t v50 = v48 + 16 + v41;
  unint64_t v51 = ~v48 & 0xFFFFFFFFFFFFFFF8;
  int v52 = (unsigned __int8 *)(v50 & v51);
  int v53 = (unsigned __int8 *)((v49 + v42) & v51);
  if (*(void *)(v47 + 64) <= 8uLL) {
    uint64_t v54 = 8;
  }
  else {
    uint64_t v54 = *(void *)(*(void *)(v46 - 8) + 64);
  }
  if (v52 != v53)
  {
    uint64_t v55 = v46;
    unsigned int v56 = v52[v54];
    unsigned int v57 = v56 - 2;
    if (v56 >= 2)
    {
      if (v54 <= 3) {
        uint64_t v58 = v54;
      }
      else {
        uint64_t v58 = 4;
      }
      switch(v58)
      {
        case 1:
          int v59 = *v52;
          goto LABEL_29;
        case 2:
          int v59 = *(unsigned __int16 *)v52;
          goto LABEL_29;
        case 3:
          int v59 = *(unsigned __int16 *)(v50 & v51) | (*(unsigned __int8 *)((v50 & v51) + 2) << 16);
          goto LABEL_29;
        case 4:
          int v59 = *(_DWORD *)v52;
LABEL_29:
          int v60 = (v59 | (v57 << (8 * v54))) + 2;
          unsigned int v56 = v59 + 2;
          if (v54 < 4) {
            unsigned int v56 = v60;
          }
          break;
        default:
          break;
      }
    }
    if (v56 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v47 + 8))(v52, v46);
    }
    else {
      swift_release();
    }
    unsigned int v61 = v53[v54];
    unsigned int v62 = v61 - 2;
    if (v61 >= 2)
    {
      if (v54 <= 3) {
        uint64_t v63 = v54;
      }
      else {
        uint64_t v63 = 4;
      }
      switch(v63)
      {
        case 1:
          int v64 = *v53;
          goto LABEL_43;
        case 2:
          int v64 = *(unsigned __int16 *)v53;
          goto LABEL_43;
        case 3:
          int v64 = *(unsigned __int16 *)v53 | (v53[2] << 16);
          goto LABEL_43;
        case 4:
          int v64 = *(_DWORD *)v53;
LABEL_43:
          int v65 = (v64 | (v62 << (8 * v54))) + 2;
          unsigned int v61 = v64 + 2;
          if (v54 < 4) {
            unsigned int v61 = v65;
          }
          break;
        default:
          break;
      }
    }
    if (v61 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v47 + 32))(v52, v53, v55);
      char v66 = 1;
    }
    else
    {
      char v66 = 0;
      *(void *)int v52 = *(void *)v53;
    }
    v52[v54] = v66;
  }
  uint64_t v67 = sub_24659CE68();
  uint64_t v68 = *(void *)(v67 - 8);
  int v69 = *(_DWORD *)(v68 + 84);
  uint64_t v70 = *(_DWORD *)(v68 + 80) & 0xF8 | 7;
  uint64_t v71 = v54 + v70 + 1;
  unint64_t v72 = (unint64_t)&v52[v71];
  unint64_t v73 = (unint64_t)&v53[v71];
  uint64_t v74 = (unsigned __int8 *)(v72 & ~v70);
  unint64_t v75 = (unsigned __int8 *)(v73 & ~v70);
  unint64_t v76 = *(void *)(v68 + 64);
  if (v74 != v75)
  {
    uint64_t v77 = v67;
    if (v69) {
      size_t v78 = *(void *)(v68 + 64);
    }
    else {
      size_t v78 = v76 + 1;
    }
    if (v78 <= 8) {
      uint64_t v79 = 8;
    }
    else {
      uint64_t v79 = v78;
    }
    unsigned int v80 = v74[v79];
    unsigned int v81 = v80 - 2;
    if (v80 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v82 = v79;
      }
      else {
        uint64_t v82 = 4;
      }
      switch(v82)
      {
        case 1:
          int v83 = *v74;
          goto LABEL_65;
        case 2:
          int v83 = *(unsigned __int16 *)v74;
          goto LABEL_65;
        case 3:
          int v83 = *(unsigned __int16 *)v74 | (v74[2] << 16);
          goto LABEL_65;
        case 4:
          int v83 = *(_DWORD *)v74;
LABEL_65:
          int v84 = (v83 | (v81 << (8 * v79))) + 2;
          unsigned int v80 = v83 + 2;
          if (v79 < 4) {
            unsigned int v80 = v84;
          }
          break;
        default:
          break;
      }
    }
    if (v80 == 1)
    {
      if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v68 + 48))(v74, 1, v67)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v68 + 8))(v74, v77);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v85 = v75[v79];
    unsigned int v86 = v85 - 2;
    if (v85 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v87 = v79;
      }
      else {
        uint64_t v87 = 4;
      }
      switch(v87)
      {
        case 1:
          int v88 = *v75;
          goto LABEL_80;
        case 2:
          int v88 = *(unsigned __int16 *)v75;
          goto LABEL_80;
        case 3:
          int v88 = *(unsigned __int16 *)v75 | (v75[2] << 16);
          goto LABEL_80;
        case 4:
          int v88 = *(_DWORD *)v75;
LABEL_80:
          int v89 = (v88 | (v86 << (8 * v79))) + 2;
          unsigned int v85 = v88 + 2;
          if (v79 < 4) {
            unsigned int v85 = v89;
          }
          break;
        default:
          break;
      }
    }
    if (v85 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v68 + 48))(v75, 1, v77))
      {
        memcpy(v74, v75, v78);
        char v90 = 1;
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v68 + 32))(v74, v75, v77);
        char v90 = 1;
        (*(void (**)(unsigned __int8 *, void, uint64_t, uint64_t))(v68 + 56))(v74, 0, 1, v77);
      }
    }
    else
    {
      char v90 = 0;
      *(void *)uint64_t v74 = *(void *)v75;
    }
    v74[v79] = v90;
  }
  if (v69) {
    unint64_t v91 = v76;
  }
  else {
    unint64_t v91 = v76 + 1;
  }
  uint64_t v92 = 8;
  if (v91 <= 8) {
    uint64_t v93 = 8;
  }
  else {
    uint64_t v93 = v91;
  }
  uint64_t v94 = sub_24659D5D8();
  uint64_t v95 = *(void *)(v94 - 8);
  uint64_t v96 = *(_DWORD *)(v95 + 80) & 0xF8 | 7;
  uint64_t v97 = v93 + v96 + 1;
  uint64_t v98 = (unsigned __int8 *)((unint64_t)&v74[v97] & ~v96);
  uint64_t v99 = (unsigned __int8 *)((unint64_t)&v75[v97] & ~v96);
  if (*(void *)(v95 + 64) > 8uLL) {
    uint64_t v92 = *(void *)(v95 + 64);
  }
  if (v98 != v99)
  {
    uint64_t v100 = v94;
    unsigned int v101 = v98[v92];
    unsigned int v102 = v101 - 2;
    if (v101 >= 2)
    {
      if (v92 <= 3) {
        uint64_t v103 = v92;
      }
      else {
        uint64_t v103 = 4;
      }
      switch(v103)
      {
        case 1:
          int v104 = *v98;
          goto LABEL_106;
        case 2:
          int v104 = *(unsigned __int16 *)v98;
          goto LABEL_106;
        case 3:
          int v104 = *(unsigned __int16 *)v98 | (v98[2] << 16);
          goto LABEL_106;
        case 4:
          int v104 = *(_DWORD *)v98;
LABEL_106:
          int v105 = (v104 | (v102 << (8 * v92))) + 2;
          unsigned int v101 = v104 + 2;
          if (v92 < 4) {
            unsigned int v101 = v105;
          }
          break;
        default:
          break;
      }
    }
    if (v101 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v95 + 8))(v98, v94);
    }
    else {
      swift_release();
    }
    unsigned int v106 = v99[v92];
    unsigned int v107 = v106 - 2;
    if (v106 >= 2)
    {
      if (v92 <= 3) {
        uint64_t v108 = v92;
      }
      else {
        uint64_t v108 = 4;
      }
      switch(v108)
      {
        case 1:
          int v109 = *v99;
          goto LABEL_120;
        case 2:
          int v109 = *(unsigned __int16 *)v99;
          goto LABEL_120;
        case 3:
          int v109 = *(unsigned __int16 *)v99 | (v99[2] << 16);
          goto LABEL_120;
        case 4:
          int v109 = *(_DWORD *)v99;
LABEL_120:
          int v110 = (v109 | (v107 << (8 * v92))) + 2;
          unsigned int v106 = v109 + 2;
          if (v92 < 4) {
            unsigned int v106 = v110;
          }
          break;
        default:
          break;
      }
    }
    if (v106 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v95 + 32))(v98, v99, v100);
      char v111 = 1;
    }
    else
    {
      char v111 = 0;
      *(void *)uint64_t v98 = *(void *)v99;
    }
    v98[v92] = v111;
  }
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v113 = *(void *)(v112 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v113 + 40))((unint64_t)&v98[v92 + 1 + *(unsigned __int8 *)(v113 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v113 + 80), (unint64_t)&v99[v92 + 1 + *(unsigned __int8 *)(v113 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v113 + 80), v112);
  return a1;
}

uint64_t sub_24657CF30(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v41 = *(_DWORD *)(v3 + 84);
  if (v41 <= 0x7FFFFFFF) {
    unsigned int v4 = 0x7FFFFFFF;
  }
  else {
    unsigned int v4 = *(_DWORD *)(v3 + 84);
  }
  uint64_t v5 = *(void *)(sub_24659D278() - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  if (v6 <= 8) {
    unint64_t v6 = 8;
  }
  unint64_t v42 = v6;
  uint64_t v7 = *(void *)(sub_24659CE68() - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(sub_24659D5D8() - 8);
  if (*(void *)(v10 + 64) <= 8uLL) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = *(void *)(v10 + 64);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0) - 8);
  uint64_t v13 = v12;
  unsigned int v14 = *(_DWORD *)(v12 + 84);
  if (v14 <= v4) {
    unsigned int v15 = v4;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v16 = *(void *)(v3 + 64);
  if (v8) {
    unint64_t v17 = v9;
  }
  else {
    unint64_t v17 = v9 + 1;
  }
  uint64_t v18 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = *(void *)(v12 + 64);
  if (v17 <= 8) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = v17;
  }
  uint64_t result = a2;
  if (a2)
  {
    unint64_t v22 = (((((((((v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
         + 63) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = *(_DWORD *)(v5 + 80) & 0xF8;
    unint64_t v24 = ~v23 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = v23 + 16;
    uint64_t v26 = *(_DWORD *)(v7 + 80) & 0xF8 | 7;
    uint64_t v27 = v42 + v26 + 1;
    uint64_t v28 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
    uint64_t v29 = v20 + v28 + 1;
    uint64_t v30 = v11 + v18 + 1;
    if (a2 <= v15) {
      goto LABEL_38;
    }
    uint64_t v31 = ((v30 + ((v29 + ((v27 + ((v25 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v28)) & ~v18) + v19;
    char v32 = 8 * v31;
    if (v31 > 3)
    {
LABEL_21:
      int v33 = *((unsigned __int8 *)a1 + v31);
      if (!*((unsigned char *)a1 + v31)) {
        goto LABEL_38;
      }
      goto LABEL_28;
    }
    unsigned int v34 = ((a2 - v15 + ~(-1 << v32)) >> v32) + 1;
    if (HIWORD(v34))
    {
      int v33 = *(_DWORD *)((char *)a1 + v31);
      if (!v33) {
        goto LABEL_38;
      }
    }
    else
    {
      if (v34 <= 0xFF)
      {
        if (v34 < 2)
        {
LABEL_38:
          if (v4 >= v14)
          {
            if (v41 < 0x7FFFFFFF)
            {
              unint64_t v40 = *(void *)((((unint64_t)a1 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
              if (v40 >= 0xFFFFFFFF) {
                LODWORD(v40) = -1;
              }
              return (v40 + 1);
            }
            else
            {
              char v39 = *(uint64_t (**)(unsigned __int16 *))(v3 + 48);
              return v39(a1);
            }
          }
          else
          {
            uint64_t v38 = *(uint64_t (**)(unint64_t))(v13 + 48);
            return v38((v30
                      + ((v29
                        + ((v27 + ((v25 + (((unint64_t)a1 + v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v28)) & ~v18);
          }
        }
        goto LABEL_21;
      }
      int v33 = *(unsigned __int16 *)((char *)a1 + v31);
      if (!*(unsigned __int16 *)((char *)a1 + v31)) {
        goto LABEL_38;
      }
    }
LABEL_28:
    int v35 = (v33 - 1) << v32;
    if (v31 > 3) {
      int v35 = 0;
    }
    if (v31)
    {
      if (v31 <= 3) {
        int v36 = v31;
      }
      else {
        int v36 = 4;
      }
      switch(v36)
      {
        case 2:
          int v37 = *a1;
          break;
        case 3:
          int v37 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v37 = *(_DWORD *)a1;
          break;
        default:
          int v37 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v37 = 0;
    }
    return v15 + (v37 | v35) + 1;
  }
  return result;
}

void sub_24657D3C8(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v42 = *(_DWORD *)(v4 + 84);
  if (v42 <= 0x7FFFFFFF) {
    unsigned int v5 = 0x7FFFFFFF;
  }
  else {
    unsigned int v5 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v6 = *(void *)(sub_24659D278() - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  uint64_t v8 = 8;
  uint64_t v9 = *(void *)(sub_24659CE68() - 8);
  int v10 = *(_DWORD *)(v9 + 84);
  unint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(sub_24659D5D8() - 8);
  if (*(void *)(v12 + 64) > 8uLL) {
    uint64_t v8 = *(void *)(v12 + 64);
  }
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0) - 8);
  uint64_t v14 = v13;
  unsigned int v15 = *(_DWORD *)(v13 + 84);
  if (v15 <= v5) {
    unsigned int v16 = v5;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v17 = *(void *)(v4 + 64);
  unint64_t v18 = (((((((((v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(v13 + 64);
  uint64_t v21 = *(_DWORD *)(v6 + 80) & 0xF8;
  unint64_t v22 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = v21 + 16;
  uint64_t v24 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  uint64_t v25 = v7 + v24 + 1;
  if (v10) {
    unint64_t v26 = v11;
  }
  else {
    unint64_t v26 = v11 + 1;
  }
  if (v26 <= 8) {
    unint64_t v26 = 8;
  }
  uint64_t v27 = *(_DWORD *)(v12 + 80) & 0xF8 | 7;
  uint64_t v28 = v26 + v27 + 1;
  uint64_t v29 = v8 + v19 + 1;
  size_t v30 = ((v29 + ((v28 + ((v25 + ((v23 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~v27)) & ~v19) + v20;
  if (a3 <= v16)
  {
    int v32 = 0;
    uint64_t v31 = a1;
  }
  else
  {
    uint64_t v31 = a1;
    if (v30 <= 3)
    {
      unsigned int v36 = ((a3 - v16 + ~(-1 << (8 * v30))) >> (8 * v30)) + 1;
      if (HIWORD(v36))
      {
        int v32 = 4;
      }
      else if (v36 >= 0x100)
      {
        int v32 = 2;
      }
      else
      {
        int v32 = v36 > 1;
      }
    }
    else
    {
      int v32 = 1;
    }
  }
  if (v16 < a2)
  {
    unsigned int v33 = ~v16 + a2;
    if (v30 < 4)
    {
      int v34 = (v33 >> (8 * v30)) + 1;
      if (v30)
      {
        int v37 = v33 & ~(-1 << (8 * v30));
        bzero(v31, v30);
        if (v30 == 3)
        {
          *(_WORD *)uint64_t v31 = v37;
          void v31[2] = BYTE2(v37);
        }
        else if (v30 == 2)
        {
          *(_WORD *)uint64_t v31 = v37;
        }
        else
        {
          *uint64_t v31 = v37;
        }
      }
    }
    else
    {
      bzero(v31, v30);
      *(_DWORD *)uint64_t v31 = v33;
      int v34 = 1;
    }
    switch(v32)
    {
      case 1:
        v31[v30] = v34;
        return;
      case 2:
        *(_WORD *)&v31[v30] = v34;
        return;
      case 3:
        goto LABEL_61;
      case 4:
        *(_DWORD *)&v31[v30] = v34;
        return;
      default:
        return;
    }
  }
  size_t v35 = v18 + 16;
  switch(v32)
  {
    case 1:
      v31[v30] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&v31[v30] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_61:
      __break(1u);
      JUMPOUT(0x24657D914);
    case 4:
      *(_DWORD *)&v31[v30] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (a2)
      {
LABEL_37:
        if (v5 >= v15)
        {
          if (v5 >= a2)
          {
            if (v42 < 0x7FFFFFFF)
            {
              unsigned int v41 = (void *)((unint64_t)&v31[v17 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                v41[2] = 0;
                v41[3] = 0;
                *unsigned int v41 = a2 ^ 0x80000000;
                v41[1] = 0;
              }
              else
              {
                v41[3] = a2 - 1;
              }
            }
            else
            {
              unint64_t v40 = *(void (**)(unsigned char *, void))(v4 + 56);
              v40(v31, a2);
            }
          }
          else if (v18 != -16)
          {
            bzero(v31, v35);
            *(_DWORD *)uint64_t v31 = ~v5 + a2;
          }
        }
        else
        {
          unint64_t v38 = (v29
               + ((v28 + ((v25 + ((v23 + ((unint64_t)&v31[v35 + 7] & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~v27)) & ~v19;
          char v39 = *(void (**)(unint64_t, void))(v14 + 56);
          v39(v38, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for HeaderManagedAppCell()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24657D954()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24657D998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  uint64_t v3 = sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6E0);
  swift_getTupleTypeMetadata3();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v4 = sub_24659DB28();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v49 = v4;
  uint64_t v58 = v4;
  uint64_t v59 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  uint64_t v5 = sub_24659D3E8();
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v40 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v39 = (char *)&v38 - v8;
  uint64_t v58 = v3;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6E8);
  uint64_t v60 = type metadata accessor for OfferView();
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6F0);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB98();
  sub_24659D3E8();
  swift_getTupleTypeMetadata2();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v9 = sub_24659DB28();
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v44 = v9;
  uint64_t v58 = v9;
  uint64_t v59 = v10;
  uint64_t v47 = v10;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v38 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unsigned int v16 = (char *)&v38 - v15;
  uint64_t v17 = sub_24659D5D8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24659D628();
  uint64_t v42 = *(void *)(v21 - 8);
  uint64_t v43 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v46 = (char *)&v38 - v22;
  sub_246567B18((uint64_t)v20);
  char v23 = sub_24659D5C8();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v24 = MEMORY[0x263F18C10];
  if (v23)
  {
    sub_24657E1D4(a1, (uint64_t)v14);
    uint64_t v25 = v44;
    uint64_t v58 = v44;
    uint64_t v59 = v47;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_246598AFC(v14, OpaqueTypeMetadata2, OpaqueTypeConformance2);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v38 + 8);
    v27(v14, OpaqueTypeMetadata2);
    sub_246598AFC(v16, OpaqueTypeMetadata2, OpaqueTypeConformance2);
    uint64_t v58 = v49;
    uint64_t v59 = WitnessTable;
    uint64_t v50 = swift_getOpaqueTypeConformance2();
    uint64_t v51 = v24;
    swift_getWitnessTable();
    sub_246598B38((uint64_t)v14, OpaqueTypeMetadata2);
    v27(v14, OpaqueTypeMetadata2);
    v27(v16, OpaqueTypeMetadata2);
  }
  else
  {
    uint64_t v28 = v40;
    sub_24657E684(a1, v40);
    uint64_t v58 = v49;
    uint64_t v59 = WitnessTable;
    uint64_t v56 = swift_getOpaqueTypeConformance2();
    uint64_t v57 = v24;
    uint64_t v29 = swift_getWitnessTable();
    size_t v30 = v39;
    sub_246598AFC(v28, v5, v29);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
    v31(v28, v5);
    sub_246598AFC(v30, v5, v29);
    uint64_t v25 = v44;
    uint64_t v58 = v44;
    uint64_t v59 = v47;
    swift_getOpaqueTypeConformance2();
    sub_246598C30(v28, OpaqueTypeMetadata2, v5);
    v31(v28, v5);
    v31((uint64_t)v30, v5);
  }
  uint64_t v58 = v25;
  uint64_t v59 = v47;
  uint64_t v32 = swift_getOpaqueTypeConformance2();
  uint64_t v58 = v49;
  uint64_t v59 = WitnessTable;
  uint64_t v54 = swift_getOpaqueTypeConformance2();
  uint64_t v55 = v24;
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v52 = v32;
  uint64_t v53 = v33;
  uint64_t v34 = v43;
  uint64_t v35 = swift_getWitnessTable();
  unsigned int v36 = v46;
  sub_246598AFC(v46, v34, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v36, v34);
}

uint64_t sub_24657E1D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v29 = a2;
  uint64_t v3 = sub_24659D6C8();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v25 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void *)(a1 + 16);
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  uint64_t v33 = sub_24659D3E8();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6E8);
  uint64_t v35 = type metadata accessor for OfferView();
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6F0);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB98();
  sub_24659D3E8();
  swift_getTupleTypeMetadata2();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v5 = sub_24659DB28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v33 = v5;
  uint64_t v34 = WitnessTable;
  uint64_t v22 = MEMORY[0x263F1AE68];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v11 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unsigned int v16 = (char *)&v22 - v15;
  uint64_t v17 = *(void *)(v24 + 24);
  uint64_t v30 = v23;
  uint64_t v31 = v17;
  uint64_t v32 = v26;
  sub_24659D568();
  sub_24659DB18();
  uint64_t v18 = v25;
  sub_24659D6B8();
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v28);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v33 = v5;
  uint64_t v34 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_246598AFC(v14, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v14, OpaqueTypeMetadata2);
  sub_246598AFC(v16, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, OpaqueTypeMetadata2);
}

uint64_t sub_24657E684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v24 = a2;
  uint64_t v3 = sub_24659D6C8();
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(a1 + 16);
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6E0);
  swift_getTupleTypeMetadata3();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v5 = sub_24659DB28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = v5;
  uint64_t v29 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v11 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v13 = (char *)&v17 - v12;
  sub_24659D558();
  uint64_t v14 = *(void *)(v19 + 24);
  uint64_t v25 = v18;
  uint64_t v26 = v14;
  uint64_t v27 = v21;
  sub_24659DB18();
  uint64_t v15 = v20;
  sub_24659D6B8();
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24659D7A8();
  uint64_t v28 = v5;
  uint64_t v29 = WitnessTable;
  swift_getOpaqueTypeConformance2();
  sub_24659D9D8();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, OpaqueTypeMetadata2);
}

uint64_t sub_24657EA7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v36 = a1;
  sub_24659D758();
  uint64_t v37 = v2;
  uint64_t v4 = sub_24659D3E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v35 - v6;
  uint64_t v8 = sub_24659D3E8();
  uint64_t v39 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = sub_24659D3E8();
  uint64_t v45 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v38 = (char *)&v35 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v40 = sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v42 = sub_24659D3E8();
  uint64_t v13 = sub_24659D628();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v43 = v13;
  uint64_t v44 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v41 = (uint64_t)&v35 - v15;
  uint64_t v16 = *(void *)(a1 + 24);
  sub_24659D968();
  uint64_t v17 = sub_246584410(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v61 = v16;
  uint64_t v62 = v17;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24659D998();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24659DBD8();
  unint64_t v19 = sub_246560E3C();
  uint64_t v59 = WitnessTable;
  unint64_t v60 = v19;
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v21 = v38;
  sub_24659D9A8();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
  uint64_t v22 = v35;
  uint64_t v23 = v35 + *(int *)(v36 + 36);
  uint64_t v24 = *(void *)v23;
  LOBYTE(v10) = *(unsigned char *)(v23 + 8);
  sub_246552D38(*(void *)v23, (char)v10);
  char v25 = sub_2465678D8(v24, (char)v10);
  sub_246552EF4(v24, (char)v10);
  uint64_t v48 = v37;
  uint64_t v49 = v16;
  uint64_t v50 = v22;
  uint64_t v57 = v20;
  uint64_t v58 = MEMORY[0x263F18860];
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v27 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v55 = v26;
  uint64_t v56 = v27;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v29 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v53 = v28;
  uint64_t v54 = v29;
  uint64_t v30 = v42;
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v32 = v41;
  sub_246591CA0(v25 & 1, (void (*)(uint64_t))sub_246583E74, (uint64_t)v47, v11, v30, v26, v31, v41);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v21, v11);
  sub_24659D7B8();
  uint64_t v51 = v31;
  uint64_t v52 = v26;
  uint64_t v33 = v43;
  swift_getWitnessTable();
  sub_24659D9D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v32, v33);
}

uint64_t sub_24657F040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v60 = a3;
  uint64_t v66 = a2;
  uint64_t v63 = a1;
  uint64_t v76 = a5;
  uint64_t v68 = sub_24659D278();
  uint64_t v65 = *(void *)(v68 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v68);
  int v64 = &v57.i8[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v62 = (uint64_t)v57.i64 - v8;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE78);
  MEMORY[0x270FA5388](v75);
  uint64_t v70 = (uint64_t)v57.i64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24659D3F8();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v61 = &v57.i8[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (int64x2_t *)((char *)&v57 - v13);
  sub_24659D758();
  sub_24659D3E8();
  uint64_t v58 = sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v69 = sub_24659D3E8();
  uint64_t v73 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v77 = &v57.i8[-v15];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v72 = sub_24659D3E8();
  uint64_t v74 = *(void *)(v72 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v72);
  uint64_t v67 = &v57.i8[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  uint64_t v71 = &v57.i8[-v18];
  unint64_t v19 = &v14->i8[*(int *)(v10 + 20)];
  uint64_t v20 = *MEMORY[0x263F19860];
  uint64_t v21 = sub_24659D598();
  uint64_t v22 = *(void (**)(__int8 *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104);
  v22(v19, v20, v21);
  int64x2_t v57 = vdupq_n_s64(0x4039D00000000000uLL);
  *uint64_t v14 = v57;
  uint64_t v23 = sub_246584410(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v86 = a4;
  uint64_t v87 = v23;
  uint64_t v59 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v25 = sub_246560E3C();
  uint64_t v84 = WitnessTable;
  unint64_t v85 = v25;
  uint64_t v82 = swift_getWitnessTable();
  uint64_t v83 = MEMORY[0x263F18860];
  uint64_t v26 = swift_getWitnessTable();
  sub_246584410(&qword_268F8BE80, MEMORY[0x263F19048]);
  sub_24659D9E8();
  uint64_t v27 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_246561554((uint64_t)v14, MEMORY[0x263F19048]);
  uint64_t v28 = (int64x2_t *)v61;
  v22(&v61[*(int *)(v10 + 20)], v20, v21);
  int64x2_t *v28 = v57;
  uint64_t v29 = (uint64_t)v28;
  type metadata accessor for HeaderManagedAppCell();
  uint64_t v30 = v62;
  sub_246567ADC(v62);
  uint64_t v31 = v65;
  uint64_t v32 = v64;
  uint64_t v33 = v68;
  (*(void (**)(__int8 *, void, uint64_t))(v65 + 104))(v64, *MEMORY[0x263F18508], v68);
  LOBYTE(v28) = sub_24659D268();
  uint64_t v34 = *(void (**)(__int8 *, uint64_t))(v31 + 8);
  v34(v32, v33);
  v34((__int8 *)v30, v33);
  uint64_t v35 = self;
  uint64_t v36 = &selRef_systemGray6Color;
  if ((v28 & 1) == 0) {
    uint64_t v36 = &selRef_secondarySystemFillColor;
  }
  uint64_t v37 = MEMORY[0x24C52F0B0]([v35 *v36]);
  sub_24659D298();
  uint64_t v38 = v70;
  sub_2465615B4(v29, v70, v27);
  uint64_t v39 = v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE88) + 36);
  long long v40 = v89;
  *(_OWORD *)uint64_t v39 = v88;
  *(_OWORD *)(v39 + 16) = v40;
  *(void *)(v39 + 32) = v90;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE90);
  *(void *)(v38 + *(int *)(v41 + 52)) = v37;
  *(_WORD *)(v38 + *(int *)(v41 + 56)) = 256;
  uint64_t v42 = sub_24659DBD8();
  uint64_t v44 = v43;
  uint64_t v45 = (uint64_t *)(v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE98) + 36));
  uint64_t *v45 = v42;
  v45[1] = v44;
  sub_246561554(v29, v27);
  sub_24659DBD8();
  uint64_t v46 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v80 = v26;
  uint64_t v81 = v46;
  uint64_t v47 = v69;
  uint64_t v48 = swift_getWitnessTable();
  sub_246561BA4(&qword_268F8BEA0, &qword_268F8BE78);
  uint64_t v49 = v67;
  uint64_t v50 = v77;
  sub_24659D9C8();
  sub_246555440(v38, &qword_268F8BE78);
  (*(void (**)(__int8 *, uint64_t))(v73 + 8))(v50, v47);
  uint64_t v51 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v78 = v48;
  uint64_t v79 = v51;
  uint64_t v52 = v72;
  uint64_t v53 = swift_getWitnessTable();
  uint64_t v54 = v71;
  sub_246598AFC(v49, v52, v53);
  uint64_t v55 = *(void (**)(__int8 *, uint64_t))(v74 + 8);
  v55(v49, v52);
  sub_246598AFC(v54, v52, v53);
  return ((uint64_t (*)(__int8 *, uint64_t))v55)(v54, v52);
}

uint64_t sub_24657F8A8()
{
  type metadata accessor for ManagedAppCellContext();
  sub_24659D828();
  uint64_t v0 = sub_24659D8B8();
  uint64_t v2 = v1;
  char v4 = v3;
  swift_release();
  swift_getKeyPath();
  sub_24659D7F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C148);
  sub_24656A200();
  sub_24659D908();
  sub_24655947C(v0, v2, v4 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24657F9C8@<X0>(uint64_t a1@<X8>)
{
  char v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 40));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  sub_246561068(*v3, v5, v6, v7);
  uint64_t v8 = sub_24659D7C8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = swift_getKeyPath();
  char v11 = sub_24659D798();
  sub_24659D258();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t result = sub_24659D658();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = 2;
  *(unsigned char *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v17;
  *(void *)(a1 + 104) = v19;
  *(unsigned char *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 116) = result;
  return result;
}

__n128 sub_24657FAC0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE50);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v32[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_24659D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 44));
  uint64_t v11 = v10[1];
  uint64_t v12 = v10[2];
  uint64_t v13 = v10[3];
  uint64_t v37 = *v10;
  uint64_t v36 = v11;
  uint64_t v35 = v12;
  uint64_t v14 = v13;
  sub_246561068(v37, v11, v12, v13);
  sub_246567B18((uint64_t)v9);
  char v15 = sub_24659D5C8();
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v16(v9, v6);
  if (v15)
  {
    uint64_t v34 = sub_24659D858();
  }
  else
  {
    uint64_t v17 = sub_24659D7E8();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
    uint64_t v34 = sub_24659D818();
    sub_246555440((uint64_t)v5, &qword_268F8BE50);
  }
  uint64_t KeyPath = swift_getKeyPath();
  int v19 = sub_24659D658();
  sub_246567B18((uint64_t)v9);
  char v20 = sub_24659D5C8();
  v16(v9, v6);
  int v33 = v20 & 1;
  if (v20) {
    double v21 = 0.0;
  }
  else {
    double v21 = 80.0;
  }
  uint64_t v22 = v37;
  uint64_t v23 = v36;
  uint64_t v40 = v37;
  uint64_t v41 = v36;
  char v24 = v35;
  uint64_t v42 = v35;
  uint64_t v43 = v14;
  uint64_t v44 = KeyPath;
  uint64_t v45 = v34;
  int v46 = v19;
  sub_24659DBD8();
  sub_2465921C4(0.0, 1, 0.0, 1, v21, v33, 0.0, 1, (uint64_t)v38, 0.0, 1, 0.0, 1);
  sub_246560F80(v22, v23, v24, v14);
  swift_release();
  swift_release();
  uint64_t v25 = swift_getKeyPath();
  long long v26 = v38[9];
  *(_OWORD *)(a1 + 128) = v38[8];
  *(_OWORD *)(a1 + 144) = v26;
  uint64_t v27 = v39;
  long long v28 = v38[5];
  *(_OWORD *)(a1 + 64) = v38[4];
  *(_OWORD *)(a1 + 80) = v28;
  long long v29 = v38[7];
  *(_OWORD *)(a1 + 96) = v38[6];
  *(_OWORD *)(a1 + 112) = v29;
  long long v30 = v38[1];
  *(_OWORD *)a1 = v38[0];
  *(_OWORD *)(a1 + 16) = v30;
  __n128 result = (__n128)v38[3];
  *(_OWORD *)(a1 + 32) = v38[2];
  *(__n128 *)(a1 + 48) = result;
  *(void *)(a1 + 160) = v27;
  *(void *)(a1 + 168) = v25;
  *(void *)(a1 + 176) = 2;
  *(unsigned char *)(a1 + 184) = 0;
  return result;
}

uint64_t sub_24657FE2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 48));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  sub_246561068(*v3, v5, v6, v7);
  uint64_t v8 = sub_24659D7D8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = sub_24659D648();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = v8;
  *(_DWORD *)(a1 + 48) = result;
  return result;
}

uint64_t sub_24657FEC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v43 = a4;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C6E0);
  uint64_t v6 = MEMORY[0x270FA5388](v42);
  uint64_t v41 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char **)((char *)&v34 - v8);
  sub_24659D758();
  uint64_t v38 = a2;
  sub_24659D3E8();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  uint64_t v36 = sub_24659D628();
  uint64_t v9 = sub_24659D3E8();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v35 = (char *)&v34 - v13;
  uint64_t v14 = type metadata accessor for HeaderManagedAppCell();
  sub_24657EA7C(v14, (uint64_t)v12);
  uint64_t v15 = sub_246584410(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  v50[15] = a3;
  v50[16] = v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v17 = sub_246560E3C();
  v50[13] = WitnessTable;
  v50[14] = v17;
  v50[11] = swift_getWitnessTable();
  v50[12] = MEMORY[0x263F18860];
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  v50[9] = v18;
  v50[10] = v19;
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v21 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  v50[7] = v20;
  v50[8] = v21;
  v50[5] = swift_getWitnessTable();
  v50[6] = v18;
  v50[3] = swift_getWitnessTable();
  v50[4] = MEMORY[0x263F18C10];
  uint64_t v36 = swift_getWitnessTable();
  uint64_t v22 = v35;
  uint64_t v34 = v12;
  sub_246598AFC(v12, v9, v36);
  uint64_t v23 = v37;
  char v24 = *(void (**)(char *, uint64_t))(v37 + 8);
  v24(v12, v9);
  uint64_t v25 = (void *)swift_allocObject();
  uint64_t v26 = v38;
  v25[2] = v38;
  v25[3] = a3;
  v25[4] = 0x405D800000000000;
  uint64_t v27 = (uint64_t)v40;
  void *v40 = 0x405D800000000000;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C6E0);
  sub_24658043C(v39, v26, a3, v27 + *(int *)(v28 + 44));
  swift_release();
  long long v29 = v34;
  long long v30 = v22;
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v34, v22, v9);
  v50[0] = v29;
  uint64_t v31 = v29;
  uint64_t v32 = v41;
  sub_246561BE8(v27, v41, &qword_268F8C6E0);
  uint64_t v48 = 0;
  char v49 = 1;
  v50[1] = v32;
  v50[2] = &v48;
  v47[0] = v9;
  v47[1] = v42;
  v47[2] = MEMORY[0x263F1B6B0];
  uint64_t v44 = v36;
  unint64_t v45 = sub_246583E8C();
  uint64_t v46 = MEMORY[0x263F1B698];
  sub_24658A30C((uint64_t)v50, 3uLL, (uint64_t)v47);
  sub_246555440(v27, &qword_268F8C6E0);
  v24(v30, v9);
  sub_246555440(v32, &qword_268F8C6E0);
  return ((uint64_t (*)(char *, uint64_t))v24)(v31, v9);
}

uint64_t sub_24658043C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  uint64_t v44 = a4;
  uint64_t v45 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C790);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v43 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v40 - v7;
  uint64_t v42 = sub_24659D6C8();
  uint64_t v9 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C798);
  MEMORY[0x270FA5388](v40);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7A0);
  uint64_t v14 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7A8);
  uint64_t v18 = v17 - 8;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - v22;
  *(void *)uint64_t v13 = sub_24659D5F8();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7B0);
  sub_246580894(&v13[*(int *)(v24 + 44)]);
  sub_24659D6A8();
  sub_246561BA4(&qword_268F8C7B8, &qword_268F8C798);
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v42);
  sub_246555440((uint64_t)v13, &qword_268F8C798);
  LOBYTE(v13) = sub_24659D7A8();
  sub_24659D258();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v33 = v41;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v21, v16, v41);
  uint64_t v34 = &v21[*(int *)(v18 + 44)];
  *uint64_t v34 = (char)v13;
  *((void *)v34 + 1) = v26;
  *((void *)v34 + 2) = v28;
  *((void *)v34 + 3) = v30;
  *((void *)v34 + 4) = v32;
  v34[40] = 0;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v33);
  sub_246561C4C((uint64_t)v21, (uint64_t)v23, &qword_268F8C7A8);
  *(void *)uint64_t v8 = sub_24659D568();
  *((void *)v8 + 1) = 0x4020000000000000;
  v8[16] = 0;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7C0);
  sub_246580CDC((uint64_t)&v8[*(int *)(v35 + 44)]);
  sub_246561BE8((uint64_t)v23, (uint64_t)v21, &qword_268F8C7A8);
  uint64_t v36 = v43;
  sub_246561BE8((uint64_t)v8, v43, &qword_268F8C790);
  uint64_t v37 = v44;
  sub_246561BE8((uint64_t)v21, v44, &qword_268F8C7A8);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7C8);
  sub_246561BE8(v36, v37 + *(int *)(v38 + 48), &qword_268F8C790);
  sub_246555440((uint64_t)v8, &qword_268F8C790);
  sub_246555440((uint64_t)v23, &qword_268F8C7A8);
  sub_246555440(v36, &qword_268F8C790);
  return sub_246555440((uint64_t)v21, &qword_268F8C7A8);
}

uint64_t sub_246580894@<X0>(char *a1@<X8>)
{
  char v49 = a1;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C758);
  uint64_t v1 = *(void *)(v58 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v58);
  uint64_t v56 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v35 - v4;
  type metadata accessor for HeaderManagedAppCell();
  uint64_t v6 = v5;
  sub_24657F8A8();
  sub_24657F9C8((uint64_t)&v59);
  uint64_t v53 = v59;
  uint64_t v50 = v60;
  uint64_t v51 = v61;
  uint64_t v52 = v62;
  uint64_t v57 = v63;
  uint64_t v54 = v65;
  uint64_t v55 = v64;
  uint64_t v46 = v66;
  int v45 = v67;
  int v44 = v68;
  uint64_t v43 = v69;
  uint64_t v42 = v70;
  uint64_t v41 = v71;
  uint64_t v40 = v72;
  int v39 = v73;
  int v38 = v74;
  uint64_t v7 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AE0(v7))
  {
    sub_24657FE2C((uint64_t)&v59);
    uint64_t v48 = v59;
    uint64_t v8 = v61;
    uint64_t v47 = v60;
    uint64_t v10 = v62;
    uint64_t v9 = v63;
    uint64_t v11 = v64;
    int v12 = v65;
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v47 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
  }
  uint64_t v37 = v1;
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  uint64_t v14 = v56;
  uint64_t v36 = v6;
  uint64_t v15 = v6;
  uint64_t v16 = v58;
  v13(v56, v15, v58);
  uint64_t v17 = v49;
  v13(v49, v14, v16);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7D8);
  uint64_t v19 = &v17[*(int *)(v18 + 48)];
  uint64_t v20 = v53;
  uint64_t v21 = v54;
  uint64_t v22 = v50;
  *(void *)uint64_t v19 = v53;
  *((void *)v19 + 1) = v22;
  uint64_t v23 = v22;
  LOBYTE(v22) = v51;
  *((void *)v19 + 2) = v51;
  char v24 = v22;
  uint64_t v25 = v52;
  uint64_t v26 = v57;
  *((void *)v19 + 3) = v52;
  *((void *)v19 + 4) = v26;
  *((void *)v19 + 5) = v55;
  *((void *)v19 + 6) = v21;
  *((void *)v19 + 7) = v46;
  v19[64] = v45;
  v19[72] = v44;
  uint64_t v27 = v42;
  *((void *)v19 + 10) = v43;
  *((void *)v19 + 11) = v27;
  uint64_t v28 = v40;
  *((void *)v19 + 12) = v41;
  *((void *)v19 + 13) = v28;
  v19[112] = v39;
  *((_DWORD *)v19 + 29) = v38;
  uint64_t v29 = &v17[*(int *)(v18 + 64)];
  uint64_t v30 = v48;
  uint64_t v31 = v47;
  *(void *)uint64_t v29 = v48;
  *((void *)v29 + 1) = v31;
  *((void *)v29 + 2) = v8;
  *((void *)v29 + 3) = v10;
  *((void *)v29 + 4) = v9;
  *((void *)v29 + 5) = v11;
  *((_DWORD *)v29 + 12) = v12;
  sub_246561068(v20, v23, v24, v25);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_246583DDC(v30, v31, v8, v10, v9);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v33 = v58;
  v32(v36, v58);
  sub_246583E28(v30, v31, v8, v10, v9);
  sub_246560F80(v53, v50, v51, v52);
  swift_release();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v32)(v56, v33);
}

uint64_t sub_246580CDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v1 = type metadata accessor for OfferView();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF00);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  type metadata accessor for HeaderManagedAppCell();
  sub_24655E9E0((uint64_t)v3);
  sub_2465615B4((uint64_t)v3, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for OfferView);
  *(void *)&v8[*(int *)(v5 + 44)] = 0x3FF0000000000000;
  sub_246561554((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for OfferView);
  sub_246561C4C((uint64_t)v8, (uint64_t)v10, &qword_268F8BF00);
  uint64_t v11 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AF8(v11))
  {
    sub_24657FAC0((uint64_t)v18);
    v20[8] = v18[8];
    v20[9] = v18[9];
    v21[0] = v19[0];
    *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)v19 + 9);
    v20[4] = v18[4];
    v20[5] = v18[5];
    v20[6] = v18[6];
    v20[7] = v18[7];
    v20[0] = v18[0];
    v20[1] = v18[1];
    v20[2] = v18[2];
    v20[3] = v18[3];
    nullsub_1(v20);
  }
  else
  {
    sub_246583A3C(v20);
  }
  sub_246561C4C((uint64_t)v20, (uint64_t)v22, &qword_268F8C6F0);
  sub_246561BE8((uint64_t)v10, (uint64_t)v8, &qword_268F8BF00);
  sub_246561C4C((uint64_t)v22, (uint64_t)v17, &qword_268F8C6F0);
  uint64_t v12 = v16;
  sub_246561BE8((uint64_t)v8, v16, &qword_268F8BF00);
  uint64_t v13 = v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7D0) + 48);
  sub_246561C4C((uint64_t)v17, (uint64_t)v18, &qword_268F8C6F0);
  sub_246561C4C((uint64_t)v18, v13, &qword_268F8C6F0);
  sub_246583CF0((uint64_t)v18, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246583A60);
  sub_246555440((uint64_t)v10, &qword_268F8BF00);
  sub_246561C4C((uint64_t)v17, (uint64_t)v20, &qword_268F8C6F0);
  sub_246583CF0((uint64_t)v20, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246583D6C);
  return sub_246555440((uint64_t)v8, &qword_268F8BF00);
}

uint64_t sub_246580FB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  uint64_t v35 = sub_24659D3E8();
  uint64_t v36 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6E8);
  uint64_t v37 = type metadata accessor for OfferView();
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6F0);
  swift_getTupleTypeMetadata();
  _OWORD v21[2] = sub_24659DC28();
  v21[1] = swift_getWitnessTable();
  uint64_t v6 = sub_24659DB98();
  uint64_t v22 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v21 - v7;
  uint64_t v9 = sub_24659D3E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v21[0] = (char *)v21 - v14;
  sub_24659D5F8();
  uint64_t v15 = v23;
  type metadata accessor for HeaderManagedAppCell();
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  uint64_t v25 = a2;
  uint64_t v26 = v15;
  uint64_t v27 = a1;
  sub_24659DB88();
  sub_24659D7A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24659D9D8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
  uint64_t v33 = WitnessTable;
  uint64_t v34 = MEMORY[0x263F18C10];
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v18 = (char *)v21[0];
  sub_246598AFC(v13, v9, v17);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v18, v9);
  uint64_t v31 = 0;
  char v32 = 0;
  uint64_t v35 = (uint64_t)v13;
  uint64_t v36 = &v31;
  v30[0] = v9;
  v30[1] = MEMORY[0x263F1B6B0];
  uint64_t v28 = v17;
  uint64_t v29 = MEMORY[0x263F1B698];
  sub_24658A30C((uint64_t)&v35, 2uLL, (uint64_t)v30);
  v19(v18, v9);
  return ((uint64_t (*)(char *, uint64_t))v19)(v13, v9);
}

uint64_t sub_246581418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v84 = a1;
  uint64_t v80 = a4;
  uint64_t v79 = type metadata accessor for OfferView();
  uint64_t v6 = MEMORY[0x270FA5388](v79);
  uint64_t v81 = (uint64_t)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v68 = (uint64_t)v64 - v8;
  uint64_t v9 = sub_24659D6C8();
  uint64_t v75 = *(void *)(v9 - 8);
  uint64_t v76 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v71 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C6F8);
  MEMORY[0x270FA5388](v86);
  uint64_t v12 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C6E8);
  uint64_t v83 = *(void *)(v74 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v74);
  uint64_t v87 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v70 = (char *)v64 - v16;
  MEMORY[0x270FA5388](v15);
  long long v88 = (char *)v64 - v17;
  sub_24659D758();
  uint64_t v67 = a2;
  sub_24659D3E8();
  uint64_t v72 = (uint64_t (*)(char *, uint64_t))sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v73 = sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v77 = sub_24659D3E8();
  uint64_t v78 = sub_24659D628();
  uint64_t v18 = sub_24659D3E8();
  uint64_t v85 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v64 - v22;
  uint64_t v66 = a3;
  uint64_t v24 = type metadata accessor for HeaderManagedAppCell();
  sub_24657EA7C(v24, (uint64_t)v21);
  uint64_t v25 = sub_246584410(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v111 = a3;
  uint64_t v112 = v25;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v27 = sub_246560E3C();
  uint64_t v109 = WitnessTable;
  unint64_t v110 = v27;
  uint64_t v107 = swift_getWitnessTable();
  uint64_t v108 = MEMORY[0x263F18860];
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v29 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v105 = v28;
  uint64_t v106 = v29;
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v31 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v103 = v30;
  uint64_t v104 = v31;
  uint64_t v101 = swift_getWitnessTable();
  uint64_t v102 = v28;
  uint64_t v99 = swift_getWitnessTable();
  uint64_t v100 = MEMORY[0x263F18C10];
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v77 = (uint64_t)v23;
  uint64_t v69 = v32;
  sub_246598AFC(v21, v18, v32);
  uint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v85 + 8);
  uint64_t v82 = v21;
  uint64_t v78 = v18;
  uint64_t v72 = v33;
  uint64_t v73 = v85 + 8;
  v33(v21, v18);
  uint64_t v34 = sub_24659D5F8();
  v64[1] = v24;
  uint64_t v35 = v84;
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  uint64_t v36 = v113[0];
  *(void *)uint64_t v12 = v34;
  *((void *)v12 + 1) = v36;
  v12[16] = 0;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C700);
  uint64_t v38 = v35;
  sub_246581D9C((uint64_t)&v12[*(int *)(v37 + 44)]);
  int v39 = v71;
  sub_24659D6A8();
  uint64_t v40 = sub_246561BA4(&qword_268F8C708, &qword_268F8C6F8);
  uint64_t v41 = v70;
  uint64_t v65 = v40;
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v39, v76);
  sub_246555440((uint64_t)v12, &qword_268F8C6F8);
  uint64_t v42 = v74;
  (*(void (**)(char *, char *))(v83 + 32))(v88, v41);
  uint64_t v43 = type metadata accessor for ManagedAppCellContext();
  uint64_t v44 = *(int *)(v43 + 56);
  uint64_t v45 = v38 + *(int *)(v43 + 52);
  uint64_t v46 = *(void *)(v45 + 8);
  char v47 = *(unsigned char *)(v45 + 16);
  v113[0] = *(void *)v45;
  v113[1] = v46;
  char v114 = v47;
  uint64_t v48 = *(void *)(v38 + v44);
  uint64_t v49 = *(void *)(v38 + v44 + 8);
  sub_246558E9C(v113[0], v46, v47);
  swift_retain();
  uint64_t v50 = v68;
  OfferView.init(offerState:action:)((uint64_t)v113, v48, v49, v68);
  if (sub_246591AF8(v43))
  {
    sub_24657FAC0((uint64_t)v94);
    v97[8] = v94[8];
    v97[9] = v94[9];
    v98[0] = v95[0];
    *(_OWORD *)((char *)v98 + 9) = *(_OWORD *)((char *)v95 + 9);
    v97[4] = v94[4];
    v97[5] = v94[5];
    v97[6] = v94[6];
    v97[7] = v94[7];
    v97[0] = v94[0];
    v97[1] = v94[1];
    v97[2] = v94[2];
    v97[3] = v94[3];
    nullsub_1(v97);
  }
  else
  {
    sub_246583A3C(v97);
  }
  sub_246561C4C((uint64_t)v97, (uint64_t)v113, &qword_268F8C6F0);
  uint64_t v51 = v82;
  uint64_t v53 = v77;
  uint64_t v52 = v78;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v82, v77, v78);
  v96[0] = v51;
  uint64_t v54 = v83;
  uint64_t v55 = v87;
  uint64_t v56 = v42;
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v87, v88, v42);
  v96[1] = v55;
  uint64_t v57 = v50;
  uint64_t v58 = v50;
  uint64_t v59 = v81;
  sub_2465615B4(v58, v81, (uint64_t (*)(void))type metadata accessor for OfferView);
  v96[2] = v59;
  sub_246561C4C((uint64_t)v113, (uint64_t)v94, &qword_268F8C6F0);
  v96[3] = v94;
  sub_246583CF0((uint64_t)v113, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246583A60);
  v93[0] = v52;
  v93[1] = v56;
  v93[2] = v79;
  v93[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C6F0);
  uint64_t v89 = v69;
  *(void *)&v97[0] = v86;
  *((void *)&v97[0] + 1) = v65;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v91 = sub_246584410(&qword_268F8BDD0, (void (*)(uint64_t))type metadata accessor for OfferView);
  unint64_t v92 = sub_246583AC0();
  sub_24658A30C((uint64_t)v96, 4uLL, (uint64_t)v93);
  sub_246583CF0((uint64_t)v113, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246583D6C);
  sub_246561554(v57, (uint64_t (*)(void))type metadata accessor for OfferView);
  uint64_t v60 = *(void (**)(char *, uint64_t))(v54 + 8);
  v60(v88, v56);
  uint64_t v61 = v53;
  uint64_t v62 = v72;
  v72((char *)v61, v52);
  sub_246561C4C((uint64_t)v94, (uint64_t)v97, &qword_268F8C6F0);
  sub_246583CF0((uint64_t)v97, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_246583D6C);
  sub_246561554(v59, (uint64_t (*)(void))type metadata accessor for OfferView);
  v60(v87, v56);
  return v62(v82, v52);
}

uint64_t sub_246581D9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C758);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AE0(v9))
  {
    type metadata accessor for HeaderManagedAppCell();
    sub_24657FE2C((uint64_t)&v56);
    uint64_t v51 = v58;
    uint64_t v52 = v56;
    uint64_t v54 = v59;
    uint64_t v55 = v57;
    uint64_t v50 = v60;
    uint64_t v53 = v61;
    int v49 = v62;
  }
  else
  {
    type metadata accessor for HeaderManagedAppCell();
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v50 = 0;
    uint64_t v53 = 0;
    int v49 = 0;
  }
  sub_24657F8A8();
  sub_24657F9C8((uint64_t)&v56);
  uint64_t v33 = v56;
  uint64_t v10 = v58;
  uint64_t v32 = v57;
  uint64_t v11 = v59;
  uint64_t v36 = v60;
  uint64_t v35 = v61;
  uint64_t v34 = v62;
  uint64_t v44 = v63;
  int v43 = v64;
  int v42 = v65;
  long long v41 = v66;
  uint64_t v40 = v67;
  uint64_t v39 = v68;
  int v38 = v69;
  int v37 = v70;
  uint64_t v46 = v3;
  char v47 = v8;
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v12(v6, v8, v2);
  uint64_t v13 = v51;
  uint64_t v14 = v55;
  *(void *)a1 = v52;
  *(void *)(a1 + 8) = v14;
  uint64_t v15 = v54;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v15;
  uint64_t v16 = v50;
  uint64_t v51 = v13;
  uint64_t v17 = v53;
  *(void *)(a1 + 32) = v50;
  *(void *)(a1 + 40) = v17;
  int v18 = v49;
  *(_DWORD *)(a1 + 48) = v49;
  int v49 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C760);
  uint64_t v20 = v6;
  uint64_t v48 = v6;
  uint64_t v45 = v2;
  uint64_t v21 = v19;
  v12((char *)(a1 + *(int *)(v19 + 48)), v20, v2);
  uint64_t v22 = a1 + *(int *)(v21 + 64);
  uint64_t v23 = v33;
  uint64_t v24 = v32;
  *(void *)uint64_t v22 = v33;
  *(void *)(v22 + 8) = v24;
  *(void *)(v22 + 16) = v10;
  *(void *)(v22 + 24) = v11;
  uint64_t v25 = v35;
  *(void *)(v22 + 32) = v36;
  *(void *)(v22 + 40) = v25;
  uint64_t v26 = v44;
  *(void *)(v22 + 48) = v34;
  *(void *)(v22 + 56) = v26;
  *(unsigned char *)(v22 + 64) = v43;
  *(unsigned char *)(v22 + 72) = v42;
  *(_OWORD *)(v22 + 80) = v41;
  uint64_t v27 = v39;
  *(void *)(v22 + 96) = v40;
  *(void *)(v22 + 104) = v27;
  *(unsigned char *)(v22 + 112) = v38;
  *(_DWORD *)(v22 + 116) = v37;
  sub_246583DDC(v52, v55, v13, v54, v16);
  uint64_t v28 = v23;
  sub_246561068(v23, v24, v10, v11);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v46 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v30 = v45;
  v29(v47, v45);
  sub_246560F80(v28, v24, v10, v11);
  swift_release();
  swift_release();
  swift_release();
  v29(v48, v30);
  return sub_246583E28(v52, v55, v51, v54, v50);
}

uint64_t sub_2465821E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ManagedAppCellContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  uint64_t v5 = (int *)type metadata accessor for HeaderManagedAppCell();
  uint64_t v6 = a2 + v5[9];
  *(void *)uint64_t v6 = swift_getKeyPath();
  *(unsigned char *)(v6 + 8) = 0;
  uint64_t v7 = (uint64_t *)(a2 + v5[10]);
  *uint64_t v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF30);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (uint64_t *)(a2 + v5[11]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF28);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (uint64_t *)(a2 + v5[12]);
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  swift_storeEnumTagMultiPayload();
  sub_24655C3B8();
  return sub_24659D2B8();
}

uint64_t sub_24658235C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v50 = a1;
  uint64_t v51 = a3;
  uint64_t v49 = sub_24659D338();
  uint64_t v8 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24659D378();
  sub_246584410(&qword_268F8C808, MEMORY[0x263F18AB8]);
  uint64_t v12 = sub_24659DEB8();
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (!v12) {
    goto LABEL_9;
  }
  uint64_t v14 = v12;
  uint64_t v54 = MEMORY[0x263F8EE78];
  sub_2465843F0(0, v12 & ~(v12 >> 63), 0);
  uint64_t result = sub_24659DEA8();
  if ((v14 & 0x8000000000000000) == 0)
  {
    char v16 = a4;
    uint64_t v17 = (void (**)(char *))(v8 + 16);
    char v18 = a2;
    uint64_t v19 = (void (**)(char *, uint64_t))(v8 + 8);
    char v20 = v18 & 1;
    int v46 = v16 & 1;
    uint64_t v47 = v11;
    uint64_t v48 = a5;
    do
    {
      uint64_t v21 = (void (*)(char *, void))sub_24659DEF8();
      uint64_t v22 = v49;
      (*v17)(v10);
      v21(v53, 0);
      v53[0] = v20;
      char v52 = v46;
      sub_24659D318();
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      (*v19)(v10, v22);
      uint64_t v13 = v54;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2465843F0(0, *(void *)(v13 + 16) + 1, 1);
        uint64_t v13 = v54;
      }
      unint64_t v28 = *(void *)(v13 + 16);
      unint64_t v27 = *(void *)(v13 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_2465843F0(v27 > 1, v28 + 1, 1);
        uint64_t v13 = v54;
      }
      *(void *)(v13 + 16) = v28 + 1;
      uint64_t v29 = v13 + 16 * v28;
      *(void *)(v29 + 32) = v24;
      *(void *)(v29 + 40) = v26;
      sub_24659DEE8();
      --v14;
    }
    while (v14);
LABEL_9:
    uint64_t v30 = *(void *)(v13 + 16);
    if (!v30) {
      return swift_bridgeObjectRelease();
    }
    if (v30 == 1)
    {
      uint64_t v31 = 0;
      double v32 = 0.0;
    }
    else
    {
      uint64_t v31 = v30 & 0x7FFFFFFFFFFFFFFELL;
      uint64_t v33 = (double *)(v13 + 56);
      double v32 = 0.0;
      uint64_t v34 = v30 & 0x7FFFFFFFFFFFFFFELL;
      do
      {
        double v35 = *(v33 - 2);
        double v36 = *v33;
        v33 += 4;
        double v32 = v32 + v35 + v36;
        v34 -= 2;
      }
      while (v34);
      if (v30 == v31)
      {
LABEL_18:
        double v40 = *(double *)(v13 + 32);
        uint64_t v41 = v30 - 1;
        if (v41)
        {
          int v42 = (double *)(v13 + 48);
          do
          {
            double v43 = *v42;
            v42 += 2;
            double v44 = v43;
            if (v40 < v43) {
              double v40 = v44;
            }
            --v41;
          }
          while (v41);
        }
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v37 = v30 - v31;
    int v38 = (double *)(v13 + 16 * v31 + 40);
    do
    {
      double v39 = *v38;
      v38 += 2;
      double v32 = v32 + v39;
      --v37;
    }
    while (v37);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_2465826BC(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  int v93 = a4;
  uint64_t v94 = a1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v89 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F8);
  uint64_t v86 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v97 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C800);
  MEMORY[0x270FA5388](v88);
  uint64_t v87 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_24659D338();
  uint64_t v22 = *(void *)(v98 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v98);
  uint64_t v84 = (char *)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v81 - v25;
  uint64_t v27 = sub_24659D378();
  uint64_t v28 = sub_246584410(&qword_268F8C808, MEMORY[0x263F18AB8]);
  uint64_t v29 = sub_24659DEB8();
  uint64_t v30 = MEMORY[0x263F8EE78];
  int v95 = a2;
  uint64_t v96 = v27;
  uint64_t v90 = v22;
  if (v29)
  {
    uint64_t v31 = v29;
    uint64_t v101 = MEMORY[0x263F8EE78];
    sub_2465843F0(0, v29 & ~(v29 >> 63), 0);
    uint64_t result = sub_24659DEA8();
    if (v31 < 0)
    {
      __break(1u);
      return result;
    }
    double v33 = a9;
    uint64_t v34 = a5;
    uint64_t v91 = (void (**)(char *))(v22 + 16);
    uint64_t v92 = a3;
    do
    {
      uint64_t v35 = v28;
      uint64_t v36 = v34;
      uint64_t v37 = v35;
      int v38 = (void (*)(unsigned char *, void))sub_24659DEF8();
      uint64_t v39 = v98;
      (*v91)(v26);
      v38(v100, 0);
      v100[0] = a2 & 1;
      char v99 = v93 & 1;
      sub_24659D318();
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v26, v39);
      uint64_t v30 = v101;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2465843F0(0, *(void *)(v30 + 16) + 1, 1);
        uint64_t v30 = v101;
      }
      unint64_t v45 = *(void *)(v30 + 16);
      unint64_t v44 = *(void *)(v30 + 24);
      if (v45 >= v44 >> 1)
      {
        sub_2465843F0(v44 > 1, v45 + 1, 1);
        uint64_t v30 = v101;
      }
      *(void *)(v30 + 16) = v45 + 1;
      uint64_t v46 = v30 + 16 * v45;
      *(void *)(v46 + 32) = v41;
      *(void *)(v46 + 40) = v43;
      uint64_t v34 = v36;
      uint64_t v28 = v37;
      sub_24659DEE8();
      --v31;
      LOBYTE(a2) = v95;
    }
    while (v31);
    a9 = v33;
    a5 = v34;
  }
  uint64_t v47 = *(void *)(v30 + 16);
  if (!v47)
  {
    double v50 = 0.0;
    uint64_t v48 = v90;
    goto LABEL_19;
  }
  uint64_t v48 = v90;
  if (v47 == 1)
  {
    uint64_t v49 = 0;
    double v50 = 0.0;
LABEL_17:
    uint64_t v55 = v47 - v49;
    uint64_t v56 = (double *)(v30 + 16 * v49 + 40);
    do
    {
      double v57 = *v56;
      v56 += 2;
      double v50 = v50 + v57;
      --v55;
    }
    while (v55);
    goto LABEL_19;
  }
  uint64_t v49 = v47 & 0x7FFFFFFFFFFFFFFELL;
  uint64_t v51 = (double *)(v30 + 56);
  double v50 = 0.0;
  uint64_t v52 = v47 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v53 = *(v51 - 2);
    double v54 = *v51;
    v51 += 4;
    double v50 = v50 + v53 + v54;
    v52 -= 2;
  }
  while (v52);
  if (v47 != v49) {
    goto LABEL_17;
  }
LABEL_19:
  double v82 = v50;
  double v83 = a10;
  uint64_t v58 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v96 - 8) + 16))(v87, a5, v96);
  *(void *)&v58[*(int *)(v88 + 52)] = v30;
  uint64_t v59 = sub_246582FB4(1);
  uint64_t v60 = *(void *)(v59 + 16);
  if (v60)
  {
    uint64_t v92 = v28;
    uint64_t v94 = a5;
    uint64_t v61 = (uint64_t)v97;
    uint64_t v62 = &v97[*(int *)(v85 + 48)];
    unint64_t v63 = (*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
    uint64_t v91 = (void (**)(char *))v59;
    uint64_t v64 = v59 + v63;
    uint64_t v65 = *(void *)(v86 + 72);
    long long v66 = (void (**)(char *, uint64_t))(v48 + 8);
    double v67 = 0.0;
    char v68 = v95;
    char v69 = v93;
    do
    {
      sub_246561BE8(v64, v61, &qword_268F8C7F8);
      double v70 = *((double *)v62 + 1);
      v102.origin.x = a6;
      v102.origin.y = a7;
      v102.size.width = a8;
      v102.size.height = a9;
      CGRectGetMinX(v102);
      v103.origin.x = a6;
      v103.origin.y = a7;
      v103.size.width = a8;
      v103.size.height = a9;
      CGRectGetMinY(v103);
      sub_24659DC48();
      v100[0] = v68 & 1;
      LOBYTE(v101) = v69 & 1;
      sub_24659D328();
      uint64_t v61 = (uint64_t)v97;
      (*v66)(v97, v98);
      double v67 = v67 + v70;
      v64 += v65;
      --v60;
    }
    while (v60);
    swift_bridgeObjectRelease();
    char v71 = v68;
    uint64_t v48 = v90;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v71 = v95;
  }
  char v72 = sub_24659DEC8();
  uint64_t v73 = (uint64_t)v89;
  if (v72)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56))(v89, 1, 1, v98);
    return sub_246555440(v73, &qword_268F8C7F0);
  }
  sub_24659DED8();
  sub_246584410(&qword_268F8C810, MEMORY[0x263F18AB8]);
  sub_24659DCB8();
  uint64_t v74 = (void (*)(unsigned char *, void))sub_24659DEF8();
  uint64_t v75 = v98;
  (*(void (**)(uint64_t))(v48 + 16))(v73);
  v74(v100, 0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v73, 0, 1, v75);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v73, 1, v75) == 1) {
    return sub_246555440(v73, &qword_268F8C7F0);
  }
  uint64_t v76 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v84, v73, v75);
  v104.origin.x = a6;
  v104.origin.y = a7;
  v104.size.width = a8;
  v104.size.height = a9;
  CGRectGetMinX(v104);
  CGFloat v77 = a6;
  CGFloat v78 = a7;
  CGFloat v79 = a8;
  CGFloat v80 = a9;
  if (v82 >= v83)
  {
    CGRectGetMinY(*(CGRect *)&v77);
    sub_24659DC48();
  }
  else
  {
    CGRectGetMaxY(*(CGRect *)&v77);
    sub_24659DC58();
  }
  v100[0] = v71 & 1;
  LOBYTE(v101) = v93 & 1;
  sub_24659D328();
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v76, v75);
}

uint64_t sub_246582FB4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F0);
  MEMORY[0x270FA5388](v4 - 8);
  CGFloat v78 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24659D338();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F8);
  uint64_t v73 = *(void *)(v75 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v75);
  uint64_t v72 = (uint64_t)v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v83 = (uint64_t)v59 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v74 = (char *)v59 - v14;
  *(void *)&long long v80 = sub_24659D378();
  uint64_t v15 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  CGFloat v79 = (char *)v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C818);
  uint64_t result = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v63 = a1;
    if (!a1)
    {
      uint64_t v30 = sub_24658489C(v2);
      sub_246555440(v2, &qword_268F8C800);
      return v30;
    }
    char v71 = v9;
    uint64_t v60 = v7;
    uint64_t v85 = (void *)MEMORY[0x263F8EE78];
    uint64_t v86 = MEMORY[0x263F8EE78];
    (*(void (**)(char *, uint64_t, void))(v15 + 32))(v79, v2, v80);
    uint64_t v21 = (void (*)(uint64_t))MEMORY[0x263F18AB8];
    sub_246584410(&qword_268F8C820, MEMORY[0x263F18AB8]);
    sub_24659DD98();
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C800);
    uint64_t v23 = &v20[*(int *)(v17 + 52)];
    *(void *)uint64_t v23 = *(void *)(v2 + *(int *)(v22 + 52));
    *((void *)v23 + 1) = 0;
    double v82 = v23;
    uint64_t v76 = *(int *)(v17 + 56);
    v20[v76] = 0;
    uint64_t v24 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C828) + 36)];
    uint64_t v25 = sub_246584410(&qword_268F8C808, v21);
    double v70 = v24;
    uint64_t v26 = *(void *)v24;
    CGFloat v77 = v20;
    sub_24659DED8();
    if (v26 == v84[0])
    {
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56);
LABEL_5:
      uint64_t v28 = (uint64_t)v78;
      v27(v78, 1, 1, v6);
LABEL_6:
      sub_246555440(v28, &qword_268F8C7F0);
LABEL_7:
      uint64_t v29 = (uint64_t)v77;
      v77[v76] = 1;
LABEL_8:
      sub_246555440(v29, &qword_268F8C818);
      uint64_t v30 = v86;
      swift_release();
      return v30;
    }
    unint64_t v31 = 0;
    char v69 = (void (**)(char *))(v60 + 16);
    char v68 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    double v67 = (void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v65 = (unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48);
    uint64_t v81 = (uint64_t (**)(char *, uint64_t, uint64_t))(v60 + 32);
    long long v66 = (void *)(v60 + 56);
    v59[1] = (v60 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v32 = v63;
    double v33 = v71;
    uint64_t v34 = (uint64_t)v77;
    uint64_t v35 = v80;
    uint64_t v61 = v6;
    uint64_t v64 = v25;
    while (1)
    {
      uint64_t v40 = (void (*)(uint64_t *, void))sub_24659DEF8();
      uint64_t v41 = v78;
      (*v69)(v78);
      v40(v84, 0);
      uint64_t v42 = v79;
      uint64_t v43 = v34;
      uint64_t v28 = (uint64_t)v41;
      (*v68)(v79, v43, v35);
      sub_24659DEE8();
      (*v67)(v42, v35);
      unint64_t v44 = (void (*)(char *, void, uint64_t, uint64_t))*v66;
      ((void (*)(char *, void, uint64_t, uint64_t))*v66)(v41, 0, 1, v6);
      if ((*v65)(v41, 1, v6) == 1) {
        goto LABEL_6;
      }
      uint64_t v45 = v35;
      uint64_t v46 = *v81;
      uint64_t result = (*v81)(v33, v28, v6);
      uint64_t v48 = *(void *)v82;
      unint64_t v47 = *((void *)v82 + 1);
      unint64_t v49 = *(void *)(*(void *)v82 + 16);
      if (v47 == v49)
      {
        (*(void (**)(char *, uint64_t))(v60 + 8))(v33, v6);
        goto LABEL_7;
      }
      if (v47 >= v49)
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        break;
      }
      uint64_t v62 = v44;
      long long v80 = *(_OWORD *)(v48 + 16 * v47 + 32);
      *((void *)v82 + 1) = v47 + 1;
      uint64_t v50 = (uint64_t)v74;
      uint64_t v51 = *(int *)(v75 + 48);
      v46(v74, (uint64_t)v33, v6);
      *(_OWORD *)(v50 + v51) = v80;
      uint64_t result = sub_246561C4C(v50, v83, &qword_268F8C7F8);
      uint64_t v58 = v85;
      unint64_t v52 = v85[2];
      if ((uint64_t)v52 >= v32)
      {
        if (v31 >= v52) {
          goto LABEL_37;
        }
        unint64_t v53 = (*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
        uint64_t v54 = *(void *)(v73 + 72);
        sub_246561BE8((uint64_t)v85 + v53 + v54 * v31, v72, &qword_268F8C7F8);
        uint64_t v55 = v86;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246584458(0, *(void *)(v55 + 16) + 1, 1);
          uint64_t v55 = v86;
        }
        unint64_t v57 = *(void *)(v55 + 16);
        unint64_t v56 = *(void *)(v55 + 24);
        if (v57 >= v56 >> 1)
        {
          sub_246584458(v56 > 1, v57 + 1, 1);
          uint64_t v55 = v86;
        }
        *(void *)(v55 + 16) = v57 + 1;
        sub_246561C4C(v72, v55 + v53 + v57 * v54, &qword_268F8C7F8);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_246584820(v58);
          uint64_t v58 = (void *)result;
          uint64_t v85 = (void *)result;
        }
        uint64_t v32 = v63;
        double v33 = v71;
        if (v31 >= v58[2]) {
          goto LABEL_38;
        }
        sub_246584834(v83, (uint64_t)v58 + v53 + v54 * v31++);
        uint64_t v6 = v61;
        if ((uint64_t)v31 >= v32)
        {
          uint64_t v29 = (uint64_t)v77;
          int v38 = v70;
          if (v77[v76]) {
            goto LABEL_8;
          }
          unint64_t v31 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246584458(0, v52 + 1, 1);
          uint64_t v58 = v85;
        }
        unint64_t v37 = v58[2];
        unint64_t v36 = v58[3];
        if (v37 >= v36 >> 1)
        {
          sub_246584458(v36 > 1, v37 + 1, 1);
          uint64_t v58 = v85;
        }
        v58[2] = v37 + 1;
        sub_246561C4C(v83, (uint64_t)v58+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(void *)(v73 + 72) * v37, &qword_268F8C7F8);
        double v33 = v71;
      }
      uint64_t v29 = (uint64_t)v77;
      int v38 = v70;
      if (v77[v76]) {
        goto LABEL_8;
      }
LABEL_16:
      uint64_t v39 = *(void *)v38;
      uint64_t v34 = v29;
      uint64_t v35 = v45;
      sub_24659DED8();
      if (v39 == v84[0])
      {
        uint64_t v27 = v62;
        goto LABEL_5;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24658387C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_24658235C(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_246583898(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  return sub_2465826BC(a1, a2 & 1, a3, a4 & 1, a5, a6, a7, a8, a9, *v9);
}

uint64_t sub_2465838B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_246583924(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_2465838EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_246583924(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_246583924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_246583968(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24659D238();
  return sub_2465839D8;
}

void sub_2465839D8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_246583A24@<X0>(uint64_t a1@<X8>)
{
  return sub_246580FB4(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_246583A30@<X0>(uint64_t a1@<X8>)
{
  return sub_246581418(v1[4], v1[2], v1[3], a1);
}

double sub_246583A3C(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 169) = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
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

uint64_t sub_246583A60(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246561068(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_246583AC0()
{
  unint64_t result = qword_268F8C710;
  if (!qword_268F8C710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6F0);
    sub_246583B34();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C710);
  }
  return result;
}

unint64_t sub_246583B34()
{
  unint64_t result = qword_268F8C718;
  if (!qword_268F8C718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C720);
    sub_246583BD4();
    sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C718);
  }
  return result;
}

unint64_t sub_246583BD4()
{
  unint64_t result = qword_268F8C728;
  if (!qword_268F8C728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C730);
    sub_246583C50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C728);
  }
  return result;
}

unint64_t sub_246583C50()
{
  unint64_t result = qword_268F8C738;
  if (!qword_268F8C738)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C740);
    sub_2465612DC();
    sub_246561BA4(&qword_268F8C748, &qword_268F8C750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C738);
  }
  return result;
}

uint64_t sub_246583CF0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 184);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_246583D6C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246560F80(result, a2, a3, a4);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_246583DDC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246561068(result, a2, a3, a4);
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_246583E28(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246560F80(result, a2, a3, a4);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_246583E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24657F040(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_246583E80@<X0>(uint64_t a1@<X8>)
{
  return sub_24657FEC0(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_246583E8C()
{
  unint64_t result = qword_268F8C768;
  if (!qword_268F8C768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C6E0);
    sub_246561BA4(&qword_268F8C770, &qword_268F8C778);
    sub_246561BA4(&qword_268F8C780, &qword_268F8C788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C768);
  }
  return result;
}

uint64_t sub_246583F50()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

ValueMetadata *type metadata accessor for HeaderLayout()
{
  return &type metadata for HeaderLayout;
}

uint64_t sub_246583F90()
{
  return swift_getWitnessTable();
}

unint64_t sub_246584344()
{
  unint64_t result = qword_268F8C7E0;
  if (!qword_268F8C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C7E0);
  }
  return result;
}

unint64_t sub_24658439C()
{
  unint64_t result = qword_268F8C7E8;
  if (!qword_268F8C7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C7E8);
  }
  return result;
}

uint64_t sub_2465843F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_246584478(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_246584410(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246584458(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2465845D8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_246584478(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C838);
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
  uint64_t result = sub_24659E068();
  __break(1u);
  return result;
}

uint64_t sub_2465845D8(char a1, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C830);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F8) - 8);
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
  _OWORD v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F8) - 8);
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
  uint64_t result = sub_24659E068();
  __break(1u);
  return result;
}

uint64_t sub_246584820(void *a1)
{
  return sub_2465845D8(0, a1[2], 0, a1);
}

uint64_t sub_246584834(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24658489C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v109 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v92 - v5;
  uint64_t v7 = sub_24659D338();
  uint64_t v8 = *(void (***)(void, void, void))(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  *(void *)&long long v119 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v101 = (char *)&v92 - v11;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C7F8);
  uint64_t v12 = *(void *)(v111 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v111);
  uint64_t v108 = (void (**)(uint64_t))((char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v98 = (char *)&v92 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v100 = (uint64_t)&v92 - v17;
  uint64_t v18 = sub_24659D378();
  uint64_t v96 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v113 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C800);
  MEMORY[0x270FA5388](v20);
  unint64_t v22 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C818);
  MEMORY[0x270FA5388](v23);
  uint64_t v116 = (char *)&v92 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_246584410(&qword_268F8C820, MEMORY[0x263F18AB8]);
  uint64_t v114 = v18;
  uint64_t v117 = v25;
  uint64_t v26 = sub_24659DDA8();
  *(void *)&long long v118 = v20;
  uint64_t v27 = a1;
  if (*(void *)(*(void *)(a1 + *(int *)(v20 + 52)) + 16) >= v26) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = *(void *)(*(void *)(a1 + *(int *)(v20 + 52)) + 16);
  }
  char v99 = v6;
  uint64_t v115 = v12;
  if (v28 <= 0)
  {
    uint64_t v36 = *(unsigned __int8 *)(v12 + 80);
    CGRect v102 = (char *)MEMORY[0x263F8EE78];
    unint64_t v34 = *(void *)(MEMORY[0x263F8EE78] + 24);
    uint64_t v94 = v36;
    uint64_t v97 = (v36 + 32) & ~v36;
  }
  else
  {
    uint64_t v29 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C830);
    uint64_t v30 = *(void *)(v12 + 72);
    uint64_t v8 = (void (**)(void, void, void))((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v94 = *(unsigned __int8 *)(v12 + 80);
    CGRect v102 = (char *)swift_allocObject();
    size_t v31 = _swift_stdlib_malloc_size(v102);
    if (!v30)
    {
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    int64_t v32 = v31 - (void)v8;
    if (v31 - (void)v8 == 0x8000000000000000 && v30 == -1) {
      goto LABEL_68;
    }
    uint64_t v97 = (uint64_t)v8;
    uint64_t v8 = v29;
    unint64_t v34 = 2 * (v32 / v30);
    uint64_t v35 = v102;
    *((void *)v102 + 2) = v28;
    *((void *)v35 + 3) = v34;
  }
  sub_246561BE8(v27, (uint64_t)v22, &qword_268F8C800);
  (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v113, v22, v114);
  unint64_t v37 = v116;
  sub_24659DD98();
  int v38 = &v37[*(int *)(v23 + 52)];
  *(void *)int v38 = *(void *)&v22[*(int *)(v118 + 52)];
  *((void *)v38 + 1) = 0;
  uint64_t v112 = *(int *)(v23 + 56);
  v37[v112] = 0;
  if (v28 < 0)
  {
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  unint64_t v110 = v38;
  uint64_t v39 = &v102[v97];
  unint64_t v40 = v34 >> 1;
  uint64_t v117 = v7;
  int v95 = v8;
  if (!v28)
  {
    unint64_t v56 = v8;
    goto LABEL_24;
  }
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C828);
  uint64_t v42 = &v116[*(int *)(v41 + 36)];
  uint64_t v106 = (void (**)(uint64_t))(v8 + 2);
  uint64_t v105 = (void (**)(char *, char *, uint64_t))(v96 + 16);
  CGRect v104 = (void (**)(char *, uint64_t))(v96 + 8);
  uint64_t v107 = (void (**)(char *, uint64_t, uint64_t))(v8 + 7);
  CGRect v103 = (unsigned int (**)(uint64_t, uint64_t, void))(v8 + 6);
  uint64_t v43 = v8 + 4;
  unint64_t v93 = (v34 >> 1) - v28;
  uint64_t v44 = v114;
  uint64_t v45 = (uint64_t)v109;
  do
  {
    uint64_t v46 = v116;
    if (v116[v112])
    {
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    uint64_t v47 = *(void *)v42;
    uint64_t v8 = (void (**)(void, void, void))sub_246584410(&qword_268F8C808, MEMORY[0x263F18AB8]);
    sub_24659DED8();
    if (v47 == v120[0]) {
      goto LABEL_69;
    }
    uint64_t v48 = (void (*)(void *, void))sub_24659DEF8();
    unint64_t v49 = (void (**)(void, void, void))v117;
    (*v106)(v45);
    v48(v120, 0);
    uint64_t v50 = v113;
    (*v105)(v113, v46, v44);
    uint64_t v8 = v49;
    sub_24659DEE8();
    (*v104)(v50, v44);
    ((void (*)(uint64_t, void, uint64_t, void))*v107)(v45, 0, 1, v49);
    if ((*v103)(v45, 1, v49) == 1)
    {
LABEL_70:
      sub_246555440(v45, &qword_268F8C7F0);
      __break(1u);
LABEL_71:
      uint64_t result = ((uint64_t (*)(void, void (**)(void, void, void)))v95[1])(v119, v8);
      __break(1u);
      return result;
    }
    uint64_t v51 = (void (*)(void (**)(uint64_t), void, void))*v43;
    (*v43)(v119, v45, v49);
    unint64_t v52 = *((void *)v110 + 1);
    unint64_t v53 = *(void *)(*(void *)v110 + 16);
    if (v52 == v53) {
      goto LABEL_71;
    }
    if (v52 >= v53) {
      goto LABEL_59;
    }
    long long v118 = *(_OWORD *)(*(void *)v110 + 16 * v52 + 32);
    *((void *)v110 + 1) = v52 + 1;
    uint64_t v54 = *(int *)(v111 + 48);
    uint64_t v55 = (uint64_t)v108;
    v51(v108, v119, v8);
    *(_OWORD *)(v55 + v54) = v118;
    sub_246561C4C(v55, (uint64_t)v39, &qword_268F8C7F8);
    v39 += *(void *)(v115 + 72);
    --v28;
  }
  while (v28);
  unint64_t v56 = v95;
  unint64_t v40 = v93;
  if (v116[v112])
  {
    unint64_t v57 = v102;
    uint64_t v58 = (uint64_t)v116;
    goto LABEL_54;
  }
LABEL_24:
  uint64_t v59 = sub_246584410(&qword_268F8C808, MEMORY[0x263F18AB8]);
  uint64_t v108 = (void (**)(uint64_t))(v56 + 2);
  uint64_t v109 = (char *)v59;
  uint64_t v106 = (void (**)(uint64_t))(v96 + 8);
  uint64_t v107 = (void (**)(char *, uint64_t, uint64_t))(v96 + 16);
  *(void *)&long long v118 = v56 + 7;
  uint64_t v105 = (void (**)(char *, char *, uint64_t))(v56 + 6);
  uint64_t v8 = v56 + 4;
  CGRect v104 = (void (**)(char *, uint64_t))(v94 | 7);
  uint64_t v60 = v114;
  uint64_t v58 = (uint64_t)v116;
  uint64_t v61 = (uint64_t)v99;
  while (2)
  {
    uint64_t v62 = *(void *)(v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C828) + 36));
    sub_24659DED8();
    if (v62 == v120[0])
    {
      uint64_t v67 = (uint64_t)v99;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v118)(v99, 1, 1, v117);
LABEL_51:
      sub_246555440(v67, &qword_268F8C7F0);
      goto LABEL_53;
    }
    uint64_t v63 = (void (*)(void *, void))sub_24659DEF8();
    uint64_t v64 = v60;
    uint64_t v65 = v117;
    (*v108)(v61);
    v63(v120, 0);
    long long v66 = v113;
    (*v107)(v113, v58, v64);
    sub_24659DEE8();
    uint64_t v67 = v61;
    ((void (*)(char *, uint64_t))*v106)(v66, v64);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))v118)(v61, 0, 1, v65);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))*v105)(v61, 1, v65) == 1) {
      goto LABEL_51;
    }
    char v68 = (void (*)(char *, char *, uint64_t))*v8;
    (*v8)(v101, v61, v65);
    unint64_t v69 = *((void *)v110 + 1);
    unint64_t v70 = *(void *)(*(void *)v110 + 16);
    if (v69 != v70)
    {
      if (v69 >= v70) {
        goto LABEL_60;
      }
      long long v119 = *(_OWORD *)(*(void *)v110 + 16 * v69 + 32);
      *((void *)v110 + 1) = v69 + 1;
      uint64_t v71 = *(int *)(v111 + 48);
      uint64_t v72 = (uint64_t)v98;
      v68(v98, v101, v117);
      *(_OWORD *)(v72 + v71) = v119;
      sub_246561C4C(v72, v100, &qword_268F8C7F8);
      if (v40)
      {
        unint64_t v57 = v102;
        goto LABEL_47;
      }
      unint64_t v73 = *((void *)v102 + 3);
      if ((uint64_t)((v73 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_62;
      }
      int64_t v74 = v73 & 0xFFFFFFFFFFFFFFFELL;
      if (v74 <= 1) {
        uint64_t v75 = 1;
      }
      else {
        uint64_t v75 = v74;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C830);
      uint64_t v76 = *(void *)(v115 + 72);
      uint64_t v77 = v97;
      unint64_t v57 = (char *)swift_allocObject();
      size_t v78 = _swift_stdlib_malloc_size(v57);
      if (!v76) {
        goto LABEL_63;
      }
      int64_t v79 = v78 - v77;
      uint64_t v80 = v77;
      if (v78 - v77 == 0x8000000000000000 && v76 == -1) {
        goto LABEL_65;
      }
      uint64_t v81 = v79 / v76;
      *((void *)v57 + 2) = v75;
      *((void *)v57 + 3) = 2 * (v79 / v76);
      double v82 = &v57[v80];
      uint64_t v83 = v102;
      uint64_t v84 = *((void *)v102 + 3) >> 1;
      uint64_t v85 = v84 * v76;
      if (*((void *)v102 + 2))
      {
        if (v57 < v102 || v82 >= &v102[v80 + v85])
        {
          swift_arrayInitWithTakeFrontToBack();
LABEL_44:
          uint64_t v83 = v102;
        }
        else if (v57 != v102)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_44;
        }
        *((void *)v83 + 2) = 0;
      }
      uint64_t v39 = &v82[v85];
      unint64_t v40 = (v81 & 0x7FFFFFFFFFFFFFFFLL) - v84;
      swift_release();
LABEL_47:
      uint64_t v60 = v114;
      BOOL v86 = __OFSUB__(v40--, 1);
      if (v86) {
        goto LABEL_61;
      }
      sub_246561C4C(v100, (uint64_t)v39, &qword_268F8C7F8);
      uint64_t v58 = (uint64_t)v116;
      v39 += *(void *)(v115 + 72);
      char v87 = v116[v112];
      CGRect v102 = v57;
      if (v87) {
        goto LABEL_54;
      }
      continue;
    }
    break;
  }
  ((void (*)(char *, uint64_t))v95[1])(v101, v117);
LABEL_53:
  uint64_t v58 = (uint64_t)v116;
  v116[v112] = 1;
  unint64_t v57 = v102;
LABEL_54:
  sub_246555440(v58, &qword_268F8C818);
  unint64_t v88 = *((void *)v57 + 3);
  if (v88 >= 2)
  {
    unint64_t v89 = v88 >> 1;
    BOOL v86 = __OFSUB__(v89, v40);
    unint64_t v90 = v89 - v40;
    if (!v86)
    {
      *((void *)v57 + 2) = v90;
      return (uint64_t)v57;
    }
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    uint64_t v45 = (uint64_t)v109;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v107)(v109, 1, 1, v117);
    goto LABEL_70;
  }
  return (uint64_t)v57;
}

uint64_t sub_24658554C(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 4144959;
  }
  else {
    uint64_t v2 = 5527621;
  }
  if (a2) {
    uint64_t v3 = 4144959;
  }
  else {
    uint64_t v3 = 5527621;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_24659E158();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_2465855BC(char *a1, char *a2)
{
  return sub_24658554C(*a1, *a2);
}

uint64_t sub_2465855C8()
{
  return sub_24659E1F8();
}

uint64_t sub_246585630()
{
  sub_24659DD38();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24658567C()
{
  return sub_24659E1F8();
}

uint64_t sub_2465856E0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24659E0F8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_246585740(uint64_t *a1@<X8>)
{
  uint64_t v2 = 5527621;
  if (*v1) {
    uint64_t v2 = 4144959;
  }
  *a1 = v2;
  a1[1] = 0xE300000000000000;
}

uint64_t sub_246585768(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_24659DD58();
    swift_bridgeObjectRelease();
    sub_246554E28();
    sub_24659DD78();
    sub_24659DD58();
    swift_bridgeObjectRelease();
    return 0;
  }
  return a1;
}

uint64_t sub_246585828()
{
  return sub_246585768(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_246585834@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24659E208();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = sub_24659E168();
  uint64_t v7 = v6;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_246585908(void *a1)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  char v4 = *(unsigned char *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24659E228();
  sub_246585768(v2, v3, v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  sub_24659E188();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

ValueMetadata *type metadata accessor for LogKey()
{
  return &type metadata for LogKey;
}

uint64_t destroy for LogKey.Representation(uint64_t a1)
{
  return sub_246555270(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_246555430(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_246555430(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_246555270(v6, v7, v8);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_246555270(v4, v5, v6);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_246585B7C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_246585B84(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LogKey.Representation()
{
  return &type metadata for LogKey.Representation;
}

void *sub_246585BA0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_246585C8C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_246585BD4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24659E228();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_246585E18();
  sub_24659E198();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

void *sub_246585C8C(void *a1)
{
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24659E208();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    sub_246585D74();
    sub_24659E178();
    uint64_t v3 = v5;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

unint64_t sub_246585D74()
{
  unint64_t result = qword_268F8C840;
  if (!qword_268F8C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C840);
  }
  return result;
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

unint64_t sub_246585E18()
{
  unint64_t result = qword_268F8C848;
  if (!qword_268F8C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C848);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LogKey.Prefix(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246585F38);
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

ValueMetadata *type metadata accessor for LogKey.Prefix()
{
  return &type metadata for LogKey.Prefix;
}

unint64_t sub_246585F74()
{
  unint64_t result = qword_268F8C850;
  if (!qword_268F8C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C850);
  }
  return result;
}

void sub_246585FD0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_246585FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

uint64_t sub_246585FE4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  __swift_allocate_value_buffer(v0, qword_268F8C858);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268F8C858);
  uint64_t v2 = sub_24659CE68();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t sub_24658607C@<X0>(uint64_t a1@<X8>)
{
  if (qword_268F8B978 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268F8C858);

  return sub_246586464(v3, a1);
}

uint64_t sub_2465860F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_246586398();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_24658615C()
{
  sub_246586334();

  return sub_24659D538();
}

uint64_t EnvironmentValues.isViewService.getter()
{
  sub_2465861E0();
  sub_24659D538();
  return v1;
}

unint64_t sub_2465861E0()
{
  unint64_t result = qword_268F8C870;
  if (!qword_268F8C870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C870);
  }
  return result;
}

uint64_t EnvironmentValues.isViewService.setter()
{
  return sub_24659D548();
}

uint64_t (*EnvironmentValues.isViewService.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_2465861E0();
  sub_24659D538();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_2465862E4;
}

uint64_t sub_2465862E4(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_24659D548();
}

ValueMetadata *type metadata accessor for ViewServiceKey()
{
  return &type metadata for ViewServiceKey;
}

unint64_t sub_246586334()
{
  unint64_t result = qword_268F8C878;
  if (!qword_268F8C878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C878);
  }
  return result;
}

ValueMetadata *type metadata accessor for IconKey()
{
  return &type metadata for IconKey;
}

unint64_t sub_246586398()
{
  unint64_t result = qword_268F8C880;
  if (!qword_268F8C880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD48);
    sub_24658640C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C880);
  }
  return result;
}

unint64_t sub_24658640C()
{
  unint64_t result = qword_268F8C888[0];
  if (!qword_268F8C888[0])
  {
    sub_24659CE68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268F8C888);
  }
  return result;
}

uint64_t sub_246586464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

void sub_246586530()
{
  type metadata accessor for ManagedAppCellContext();
  if (v0 <= 0x3F)
  {
    sub_24655C308(319, (unint64_t *)&qword_268F8BD38, MEMORY[0x263F18520]);
    if (v1 <= 0x3F)
    {
      sub_24655C2AC();
      if (v2 <= 0x3F)
      {
        sub_24655C308(319, (unint64_t *)&qword_268F8BD50, MEMORY[0x263F19A00]);
        if (v3 <= 0x3F)
        {
          sub_24655C35C();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void *sub_2465866F0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = sub_24659D278();
  uint64_t v105 = *(void *)(v6 - 8);
  uint64_t v106 = v6;
  int v7 = *(_DWORD *)(v105 + 80);
  if (*(void *)(v105 + 64) <= 8uLL) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  uint64_t v110 = sub_24659CE68();
  uint64_t v9 = *(void *)(v110 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v109 = v9;
  if (*(_DWORD *)(v9 + 84)) {
    unint64_t v11 = *(void *)(v9 + 64);
  }
  else {
    unint64_t v11 = *(void *)(v9 + 64) + 1;
  }
  size_t __n = v11;
  if (v11 <= 8) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = sub_24659D5D8();
  uint64_t v107 = *(void *)(v13 - 8);
  uint64_t v108 = v13;
  int v14 = *(_DWORD *)(v107 + 80);
  if (*(void *)(v107 + 64) <= 8uLL) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = *(void *)(*(void *)(v13 - 8) + 64);
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v112 = *(void *)(v16 - 8);
  uint64_t v17 = *(_DWORD *)(v112 + 80);
  uint64_t v18 = *(void *)(v112 + 64);
  int v19 = v10 | v7 | v14 | *(_DWORD *)(v4 + 80);
  unsigned int v20 = v19 & 0xF8 | *(_DWORD *)(v112 + 80);
  if (((v19 | *(_DWORD *)(v112 + 80)) & 0x100000) != 0
    || ((unint64_t v21 = (((((((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
              + 63) & 0xFFFFFFFFFFFFFFF8,
         unint64_t v22 = ~(unint64_t)(v7 & 0xF8) & 0xFFFFFFFFFFFFFFF8,
         uint64_t v23 = (v7 & 0xF8) + 16,
         uint64_t v24 = v10 & 0xF8 | 7,
         ((v18
         + v17
         + ((v15
           + 1
           + v17
           + ((v12
             + 1
             + (v14 & 0xF8 | 7)
             + ((v8 + v24 + 1 + ((v23 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~(v14 & 0xF8 | 7))) & ~v17)) & ~v17)
       + v18 <= 0x18)
      ? (BOOL v25 = v20 > 7)
      : (BOOL v25 = 1),
        v25))
  {
    uint64_t v37 = *a2;
    *a1 = *a2;
    uint64_t v38 = v37 + (((v20 | 7) + 16) & ~(unint64_t)(v20 | 7));
    swift_retain();
  }
  else
  {
    unint64_t v94 = v22;
    uint64_t v95 = v10 & 0xF8 | 7;
    uint64_t v96 = v8 + v24 + 1;
    uint64_t v97 = v8;
    uint64_t v98 = v12 + 1;
    uint64_t v99 = v14 & 0xF8 | 7;
    uint64_t v111 = *(_DWORD *)(v112 + 80);
    uint64_t v100 = v15 + 1;
    uint64_t v101 = v18 + v17;
    uint64_t v102 = v15;
    uint64_t v103 = v16;
    (*(void (**)(void *, void *, uint64_t))(v4 + 16))(a1, a2, v3);
    unint64_t v26 = ((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v114 = (char *)a2 + 7;
    unint64_t v27 = (unint64_t)&v114[v5] & 0xFFFFFFFFFFFFFFF8;
    uint64_t v28 = *(void *)v27;
    uint64_t v29 = *(void *)(v27 + 8);
    char v30 = *(unsigned char *)(v27 + 16);
    sub_246558E8C(*(void *)v27, v29, v30);
    *(void *)unint64_t v26 = v28;
    *(void *)(v26 + 8) = v29;
    *(unsigned char *)(v26 + 16) = v30;
    *(void *)(v26 + 24) = *(void *)(v27 + 24);
    unint64_t v31 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v32 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v33 = *(void *)(v32 + 24);
    swift_bridgeObjectRetain();
    if (v33 < 0xFFFFFFFF)
    {
      long long v39 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)unint64_t v31 = *(_OWORD *)v32;
      *(_OWORD *)(v31 + 16) = v39;
    }
    else
    {
      uint64_t v34 = *(void *)v32;
      uint64_t v35 = *(void *)(v32 + 8);
      char v36 = *(unsigned char *)(v32 + 16);
      sub_246558E8C(*(void *)v32, v35, v36);
      *(void *)unint64_t v31 = v34;
      *(void *)(v31 + 8) = v35;
      *(unsigned char *)(v31 + 16) = v36;
      *(void *)(v31 + 24) = *(void *)(v32 + 24);
      swift_bridgeObjectRetain();
    }
    uint64_t v40 = v12;
    unint64_t v41 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v42 = (v32 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v42 + 24) < 0xFFFFFFFFuLL)
    {
      long long v46 = *(_OWORD *)(v42 + 16);
      *(_OWORD *)unint64_t v41 = *(_OWORD *)v42;
      *(_OWORD *)(v41 + 16) = v46;
    }
    else
    {
      uint64_t v43 = *(void *)v42;
      uint64_t v44 = *(void *)(v42 + 8);
      char v45 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v44, v45);
      *(void *)unint64_t v41 = v43;
      *(void *)(v41 + 8) = v44;
      *(unsigned char *)(v41 + 16) = v45;
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v47 = v21 + 16;
    unint64_t v48 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v49 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v49 + 24) < 0xFFFFFFFFuLL)
    {
      long long v53 = *(_OWORD *)(v49 + 16);
      *(_OWORD *)unint64_t v48 = *(_OWORD *)v49;
      *(_OWORD *)(v48 + 16) = v53;
    }
    else
    {
      uint64_t v50 = *(void *)v49;
      uint64_t v51 = *(void *)(v49 + 8);
      char v52 = *(unsigned char *)(v49 + 16);
      sub_246558E8C(*(void *)v49, v51, v52);
      *(void *)unint64_t v48 = v50;
      *(void *)(v48 + 8) = v51;
      *(unsigned char *)(v48 + 16) = v52;
      *(void *)(v48 + 24) = *(void *)(v49 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v54 = (v48 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v55 = (v49 + 39) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v56 = *(void *)v55;
    uint64_t v57 = *(void *)(v55 + 8);
    char v58 = *(unsigned char *)(v55 + 16);
    sub_246558E9C(*(void *)v55, v57, v58);
    *(void *)unint64_t v54 = v56;
    *(void *)(v54 + 8) = v57;
    *(unsigned char *)(v54 + 16) = v58;
    uint64_t v59 = (void *)((v48 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v60 = (void *)((v49 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v61 = v60[1];
    void *v59 = *v60;
    v59[1] = v61;
    unint64_t v62 = ((unint64_t)a1 + v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v63 = (unint64_t)&v114[v47] & 0xFFFFFFFFFFFFFFF8;
    uint64_t v64 = *(void *)v63;
    LOBYTE(v57) = *(unsigned char *)(v63 + 8);
    swift_retain();
    sub_246552D38(v64, v57);
    *(void *)unint64_t v62 = v64;
    *(unsigned char *)(v62 + 8) = v57;
    uint64_t v65 = (void *)((v23 + v62) & v94);
    long long v66 = (unsigned __int8 *)((v23 + v63) & v94);
    unsigned int v67 = v66[v97];
    unsigned int v68 = v67 - 2;
    if (v67 < 2)
    {
      uint64_t v70 = v102;
      uint64_t v71 = v109;
      uint64_t v72 = v99;
    }
    else
    {
      if (v97 <= 3) {
        uint64_t v69 = v97;
      }
      else {
        uint64_t v69 = 4;
      }
      uint64_t v70 = v102;
      uint64_t v71 = v109;
      uint64_t v72 = v99;
      switch(v69)
      {
        case 1:
          int v73 = *v66;
          if (v97 < 4) {
            goto LABEL_39;
          }
          goto LABEL_41;
        case 2:
          int v73 = *(unsigned __int16 *)v66;
          if (v97 >= 4) {
            goto LABEL_41;
          }
          goto LABEL_39;
        case 3:
          int v73 = *(unsigned __int16 *)v66 | (v66[2] << 16);
          if (v97 < 4) {
            goto LABEL_39;
          }
          goto LABEL_41;
        case 4:
          int v73 = *(_DWORD *)v66;
          if (v97 < 4) {
LABEL_39:
          }
            unsigned int v67 = (v73 | (v68 << (8 * v97))) + 2;
          else {
LABEL_41:
          }
            unsigned int v67 = v73 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v74 = ~v95;
    if (v67 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v105 + 16))(v65, v66, v106);
      char v75 = 1;
    }
    else
    {
      void *v65 = *(void *)v66;
      swift_retain();
      char v75 = 0;
    }
    *((unsigned char *)v65 + v97) = v75;
    uint64_t v76 = (void *)(((unint64_t)v65 + v96) & v74);
    uint64_t v77 = (unsigned __int8 *)((unint64_t)&v66[v96] & v74);
    unsigned int v78 = v77[v40];
    unsigned int v79 = v78 - 2;
    if (v78 >= 2)
    {
      if (v40 <= 3) {
        uint64_t v80 = v40;
      }
      else {
        uint64_t v80 = 4;
      }
      switch(v80)
      {
        case 1:
          int v81 = *v77;
          if (v40 < 4) {
            goto LABEL_55;
          }
          goto LABEL_57;
        case 2:
          int v81 = *(unsigned __int16 *)v77;
          if (v40 >= 4) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 3:
          int v81 = *(unsigned __int16 *)((unint64_t)&v66[v96] & v74) | (*(unsigned __int8 *)(((unint64_t)&v66[v96] & v74)
                                                                                               + 2) << 16);
          if (v40 < 4) {
            goto LABEL_55;
          }
          goto LABEL_57;
        case 4:
          int v81 = *(_DWORD *)v77;
          if (v40 < 4) {
LABEL_55:
          }
            unsigned int v78 = (v81 | (v79 << (8 * v40))) + 2;
          else {
LABEL_57:
          }
            unsigned int v78 = v81 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v82 = ~v72;
    if (v78 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v71 + 48))(v77, 1, v110))
      {
        memcpy(v76, v77, __n);
      }
      else
      {
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v71 + 16))(v76, v77, v110);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v71 + 56))(v76, 0, 1, v110);
      }
      *((unsigned char *)v76 + v40) = 1;
    }
    else
    {
      *uint64_t v76 = *(void *)v77;
      *((unsigned char *)v76 + v40) = 0;
      swift_retain();
    }
    uint64_t v83 = (void *)(((unint64_t)v76 + v98 + v72) & v82);
    uint64_t v84 = (unsigned __int8 *)((unint64_t)&v77[v98 + v72] & v82);
    unsigned int v85 = v84[v70];
    unsigned int v86 = v85 - 2;
    if (v85 >= 2)
    {
      if (v70 <= 3) {
        uint64_t v87 = v70;
      }
      else {
        uint64_t v87 = 4;
      }
      switch(v87)
      {
        case 1:
          int v88 = *v84;
          if (v70 < 4) {
            goto LABEL_74;
          }
          goto LABEL_76;
        case 2:
          int v88 = *(unsigned __int16 *)v84;
          if (v70 >= 4) {
            goto LABEL_76;
          }
          goto LABEL_74;
        case 3:
          int v88 = *(unsigned __int16 *)((unint64_t)&v77[v98 + v72] & v82) | (*(unsigned __int8 *)(((unint64_t)&v77[v98 + v72] & v82) + 2) << 16);
          if (v70 < 4) {
            goto LABEL_74;
          }
          goto LABEL_76;
        case 4:
          int v88 = *(_DWORD *)v84;
          if (v70 < 4) {
LABEL_74:
          }
            unsigned int v85 = (v88 | (v86 << (8 * v70))) + 2;
          else {
LABEL_76:
          }
            unsigned int v85 = v88 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v89 = ~v111;
    if (v85 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v107 + 16))(v83, v84, v108);
      char v90 = 1;
    }
    else
    {
      *uint64_t v83 = *(void *)v84;
      swift_retain();
      char v90 = 0;
    }
    *((unsigned char *)v83 + v70) = v90;
    unint64_t v91 = ((unint64_t)v83 + v100 + v111) & v89;
    uint64_t v92 = *(void (**)(unint64_t, unint64_t, uint64_t))(v112 + 16);
    v92(v91, (unint64_t)&v84[v100 + v111] & v89, v103);
    v92((v101 + v91) & v89, (v101 + ((unint64_t)&v84[v100 + v111] & v89)) & v89, v103);
    return a1;
  }
  return (void *)v38;
}

uint64_t sub_246586FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  unint64_t v5 = (a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24655947C(*(void *)v5, *(void *)(v5 + 8), *(unsigned char *)(v5 + 16));
  swift_bridgeObjectRelease();
  unint64_t v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v7, *(void *)(v7 + 8), *(unsigned char *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v8 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v8 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v8, *(void *)(v8 + 8), *(unsigned char *)(v8 + 16));
    swift_bridgeObjectRelease();
  }
  sub_246550978(*(void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  swift_release();
  unint64_t v9 = (a1
      + ((((((((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_246552EF4(*(void *)v9, *(unsigned char *)(v9 + 8));
  uint64_t v10 = sub_24659D278();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  uint64_t v13 = (unsigned __int8 *)((v9 + v12 + 9) & ~v12);
  if (*(void *)(v11 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(v11 + 64);
  }
  unsigned int v15 = v13[v14];
  unsigned int v16 = v15 - 2;
  if (v15 >= 2)
  {
    if (v14 <= 3) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = 4;
    }
    switch(v17)
    {
      case 1:
        int v18 = *v13;
        goto LABEL_19;
      case 2:
        int v18 = *(unsigned __int16 *)v13;
        goto LABEL_19;
      case 3:
        int v18 = *(unsigned __int16 *)v13 | (v13[2] << 16);
        goto LABEL_19;
      case 4:
        int v18 = *(_DWORD *)v13;
LABEL_19:
        int v19 = (v18 | (v16 << (8 * v14))) + 2;
        unsigned int v15 = v18 + 2;
        if (v14 < 4) {
          unsigned int v15 = v19;
        }
        break;
      default:
        break;
    }
  }
  if (v15 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(v13, v10);
  }
  else {
    swift_release();
  }
  unsigned int v20 = &v13[v14];
  uint64_t v21 = sub_24659CE68();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(_DWORD *)(v22 + 80) & 0xF8 | 7;
  uint64_t v24 = (unsigned __int8 *)((unint64_t)&v20[v23 + 1] & ~v23);
  unint64_t v25 = *(void *)(v22 + 64);
  if (!*(_DWORD *)(v22 + 84)) {
    ++v25;
  }
  if (v25 <= 8) {
    uint64_t v26 = 8;
  }
  else {
    uint64_t v26 = v25;
  }
  unsigned int v27 = v24[v26];
  unsigned int v28 = v27 - 2;
  if (v27 >= 2)
  {
    if (v26 <= 3) {
      uint64_t v29 = v26;
    }
    else {
      uint64_t v29 = 4;
    }
    switch(v29)
    {
      case 1:
        int v30 = *v24;
        goto LABEL_38;
      case 2:
        int v30 = *(unsigned __int16 *)v24;
        goto LABEL_38;
      case 3:
        int v30 = *(unsigned __int16 *)v24 | (v24[2] << 16);
        goto LABEL_38;
      case 4:
        int v30 = *(_DWORD *)v24;
LABEL_38:
        int v31 = (v30 | (v28 << (8 * v26))) + 2;
        unsigned int v27 = v30 + 2;
        if (v26 < 4) {
          unsigned int v27 = v31;
        }
        break;
      default:
        break;
    }
  }
  if (v27 == 1)
  {
    if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v22 + 48))(v24, 1, v21)) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v22 + 8))(v24, v21);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v32 = sub_24659D5D8();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(_DWORD *)(v33 + 80) & 0xF8 | 7;
  uint64_t v35 = (unsigned __int8 *)((unint64_t)&v24[v26 + 1 + v34] & ~v34);
  if (*(void *)(v33 + 64) <= 8uLL) {
    uint64_t v36 = 8;
  }
  else {
    uint64_t v36 = *(void *)(v33 + 64);
  }
  unsigned int v37 = v35[v36];
  unsigned int v38 = v37 - 2;
  if (v37 >= 2)
  {
    if (v36 <= 3) {
      uint64_t v39 = v36;
    }
    else {
      uint64_t v39 = 4;
    }
    switch(v39)
    {
      case 1:
        int v40 = *v35;
        goto LABEL_56;
      case 2:
        int v40 = *(unsigned __int16 *)v35;
        goto LABEL_56;
      case 3:
        int v40 = *(unsigned __int16 *)v35 | (v35[2] << 16);
        goto LABEL_56;
      case 4:
        int v40 = *(_DWORD *)v35;
LABEL_56:
        int v41 = (v40 | (v38 << (8 * v36))) + 2;
        unsigned int v37 = v40 + 2;
        if (v36 < 4) {
          unsigned int v37 = v41;
        }
        break;
      default:
        break;
    }
  }
  if (v37 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v33 + 8))(v35, v32);
  }
  else {
    swift_release();
  }
  unint64_t v42 = &v35[v36];
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v49 = v44 + 8;
  uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  uint64_t v45 = *(unsigned __int8 *)(v44 + 80);
  uint64_t v46 = (unint64_t)&v42[v45 + 1] & ~v45;
  v50(v46, v43);
  uint64_t v47 = (*(void *)(v49 + 56) + v45 + v46) & ~v45;

  return ((uint64_t (*)(uint64_t, uint64_t))v50)(v47, v43);
}

uint64_t sub_246587590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  unint64_t v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = *(void *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    long long v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    uint64_t v15 = *(void *)v13;
    uint64_t v16 = *(void *)(v13 + 8);
    char v17 = *(unsigned char *)(v13 + 16);
    sub_246558E8C(*(void *)v13, v16, v17);
    *(void *)unint64_t v12 = v15;
    *(void *)(v12 + 8) = v16;
    *(unsigned char *)(v12 + 16) = v17;
    *(void *)(v12 + 24) = *(void *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    long long v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    uint64_t v21 = *(void *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    char v23 = *(unsigned char *)(v20 + 16);
    sub_246558E8C(*(void *)v20, v22, v23);
    *(void *)unint64_t v19 = v21;
    *(void *)(v19 + 8) = v22;
    *(unsigned char *)(v19 + 16) = v23;
    *(void *)(v19 + 24) = *(void *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    long long v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)unint64_t v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    uint64_t v27 = *(void *)v26;
    uint64_t v28 = *(void *)(v26 + 8);
    char v29 = *(unsigned char *)(v26 + 16);
    sub_246558E8C(*(void *)v26, v28, v29);
    *(void *)unint64_t v25 = v27;
    *(void *)(v25 + 8) = v28;
    *(unsigned char *)(v25 + 16) = v29;
    *(void *)(v25 + 24) = *(void *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  uint64_t v34 = *(void *)(v32 + 8);
  char v35 = *(unsigned char *)(v32 + 16);
  sub_246558E9C(*(void *)v32, v34, v35);
  *(void *)unint64_t v31 = v33;
  *(void *)(v31 + 8) = v34;
  *(unsigned char *)(v31 + 16) = v35;
  uint64_t v36 = (void *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v37 = (void *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v38 = v37[1];
  void *v36 = *v37;
  v36[1] = v38;
  unint64_t v39 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v40 = (a1 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (a2 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v42 = *(void *)v41;
  LOBYTE(v33) = *(unsigned char *)(v41 + 8);
  swift_retain();
  sub_246552D38(v42, v33);
  *(void *)unint64_t v40 = v42;
  *(unsigned char *)(v40 + 8) = v33;
  uint64_t v43 = sub_24659D278();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(_DWORD *)(v44 + 80) & 0xF8;
  uint64_t v46 = v45 + 16;
  unint64_t v47 = v45 + 16 + v40;
  unint64_t v48 = ~v45 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v49 = (void *)(v47 & v48);
  uint64_t v50 = (unsigned __int8 *)((v46 + v41) & v48);
  if (*(void *)(v44 + 64) <= 8uLL) {
    uint64_t v51 = 8;
  }
  else {
    uint64_t v51 = *(void *)(*(void *)(v43 - 8) + 64);
  }
  unsigned int v52 = v50[v51];
  unsigned int v53 = v52 - 2;
  if (v52 >= 2)
  {
    if (v51 <= 3) {
      uint64_t v54 = v51;
    }
    else {
      uint64_t v54 = 4;
    }
    switch(v54)
    {
      case 1:
        int v55 = *v50;
        goto LABEL_22;
      case 2:
        int v55 = *(unsigned __int16 *)v50;
        goto LABEL_22;
      case 3:
        int v55 = *(unsigned __int16 *)((v46 + v41) & v48) | (*(unsigned __int8 *)(((v46 + v41) & v48) + 2) << 16);
        goto LABEL_22;
      case 4:
        int v55 = *(_DWORD *)v50;
LABEL_22:
        int v56 = (v55 | (v53 << (8 * v51))) + 2;
        unsigned int v52 = v55 + 2;
        if (v51 < 4) {
          unsigned int v52 = v56;
        }
        break;
      default:
        break;
    }
  }
  if (v52 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v44 + 16))(v49, v50, v43);
    char v57 = 1;
  }
  else
  {
    *uint64_t v49 = *(void *)v50;
    swift_retain();
    char v57 = 0;
  }
  *((unsigned char *)v49 + v51) = v57;
  uint64_t v58 = v51 + 1;
  uint64_t v59 = sub_24659CE68();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(_DWORD *)(v60 + 80) & 0xF8 | 7;
  unint64_t v62 = (unint64_t)&v50[v58 + v61];
  unint64_t v63 = (void *)(((unint64_t)v49 + v58 + v61) & ~v61);
  uint64_t v64 = (unsigned __int8 *)(v62 & ~v61);
  if (*(_DWORD *)(v60 + 84)) {
    size_t v65 = *(void *)(v60 + 64);
  }
  else {
    size_t v65 = *(void *)(v60 + 64) + 1;
  }
  if (v65 <= 8) {
    uint64_t v66 = 8;
  }
  else {
    uint64_t v66 = v65;
  }
  unsigned int v67 = v64[v66];
  unsigned int v68 = v67 - 2;
  if (v67 >= 2)
  {
    if (v66 <= 3) {
      uint64_t v69 = v66;
    }
    else {
      uint64_t v69 = 4;
    }
    switch(v69)
    {
      case 1:
        int v70 = *v64;
        goto LABEL_42;
      case 2:
        int v70 = *(unsigned __int16 *)v64;
        goto LABEL_42;
      case 3:
        int v70 = *(unsigned __int16 *)v64 | (v64[2] << 16);
        goto LABEL_42;
      case 4:
        int v70 = *(_DWORD *)v64;
LABEL_42:
        int v71 = (v70 | (v68 << (8 * v66))) + 2;
        unsigned int v67 = v70 + 2;
        if (v66 < 4) {
          unsigned int v67 = v71;
        }
        break;
      default:
        break;
    }
  }
  if (v67 == 1)
  {
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v60 + 48))(v64, 1, v59))
    {
      memcpy(v63, v64, v65);
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v60 + 16))(v63, v64, v59);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v60 + 56))(v63, 0, 1, v59);
    }
    *((unsigned char *)v63 + v66) = 1;
  }
  else
  {
    *unint64_t v63 = *(void *)v64;
    *((unsigned char *)v63 + v66) = 0;
    swift_retain();
  }
  uint64_t v72 = sub_24659D5D8();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(_DWORD *)(v73 + 80) & 0xF8 | 7;
  uint64_t v75 = v66 + v74 + 1;
  uint64_t v76 = (void *)(((unint64_t)v63 + v75) & ~v74);
  uint64_t v77 = (unsigned __int8 *)((unint64_t)&v64[v75] & ~v74);
  if (*(void *)(v73 + 64) <= 8uLL) {
    uint64_t v78 = 8;
  }
  else {
    uint64_t v78 = *(void *)(v73 + 64);
  }
  unsigned int v79 = v77[v78];
  unsigned int v80 = v79 - 2;
  if (v79 >= 2)
  {
    if (v78 <= 3) {
      uint64_t v81 = v78;
    }
    else {
      uint64_t v81 = 4;
    }
    switch(v81)
    {
      case 1:
        int v82 = *v77;
        goto LABEL_62;
      case 2:
        int v82 = *(unsigned __int16 *)v77;
        goto LABEL_62;
      case 3:
        int v82 = *(unsigned __int16 *)v77 | (v77[2] << 16);
        goto LABEL_62;
      case 4:
        int v82 = *(_DWORD *)v77;
LABEL_62:
        int v83 = (v82 | (v80 << (8 * v78))) + 2;
        unsigned int v79 = v82 + 2;
        if (v78 < 4) {
          unsigned int v79 = v83;
        }
        break;
      default:
        break;
    }
  }
  if (v79 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v73 + 16))(v76, v77, v72);
    char v84 = 1;
  }
  else
  {
    *uint64_t v76 = *(void *)v77;
    swift_retain();
    char v84 = 0;
  }
  *((unsigned char *)v76 + v78) = v84;
  uint64_t v85 = v78 + 1;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v87 = *(void *)(v86 - 8);
  int v88 = *(void (**)(unint64_t, unint64_t, uint64_t))(v87 + 16);
  uint64_t v89 = v87 + 16;
  uint64_t v90 = *(unsigned __int8 *)(v87 + 80);
  unint64_t v91 = ((unint64_t)v76 + v85 + v90) & ~v90;
  unint64_t v92 = (unint64_t)&v77[v85 + v90] & ~v90;
  v88(v91, v92, v86);
  v88((*(void *)(v89 + 48) + v90 + v91) & ~v90, (*(void *)(v89 + 48) + v90 + v92) & ~v90, v86);
  return a1;
}

uint64_t sub_246587CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  uint64_t v12 = *(void *)v7;
  uint64_t v13 = *(void *)(v7 + 8);
  char v14 = *(unsigned char *)(v7 + 16);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  sub_24655947C(v12, v13, v14);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = *(void *)(v16 + 24);
  if (*(void *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v24 = *(void *)v16;
      uint64_t v25 = *(void *)(v16 + 8);
      char v26 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v25, v26);
      *(void *)unint64_t v15 = v24;
      *(void *)(v15 + 8) = v25;
      *(unsigned char *)(v15 + 16) = v26;
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v18 = *(void *)v16;
      uint64_t v19 = *(void *)(v16 + 8);
      char v20 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v19, v20);
      uint64_t v21 = *(void *)v15;
      uint64_t v22 = *(void *)(v15 + 8);
      char v23 = *(unsigned char *)(v15 + 16);
      *(void *)unint64_t v15 = v18;
      *(void *)(v15 + 8) = v19;
      *(unsigned char *)(v15 + 16) = v20;
      sub_24655947C(v21, v22, v23);
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_24655947C(*(void *)v15, *(void *)(v15 + 8), *(unsigned char *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  long long v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  unint64_t v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = *(void *)(v29 + 24);
  if (*(void *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v37 = *(void *)v29;
      uint64_t v38 = *(void *)(v29 + 8);
      char v39 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v38, v39);
      *(void *)unint64_t v28 = v37;
      *(void *)(v28 + 8) = v38;
      *(unsigned char *)(v28 + 16) = v39;
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v31 = *(void *)v29;
      uint64_t v32 = *(void *)(v29 + 8);
      char v33 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v32, v33);
      uint64_t v34 = *(void *)v28;
      uint64_t v35 = *(void *)(v28 + 8);
      char v36 = *(unsigned char *)(v28 + 16);
      *(void *)unint64_t v28 = v31;
      *(void *)(v28 + 8) = v32;
      *(unsigned char *)(v28 + 16) = v33;
      sub_24655947C(v34, v35, v36);
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_24655947C(*(void *)v28, *(void *)(v28 + 8), *(unsigned char *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  long long v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)unint64_t v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  unint64_t v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = *(void *)(v42 + 24);
  if (*(void *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v50 = *(void *)v42;
      uint64_t v51 = *(void *)(v42 + 8);
      char v52 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v51, v52);
      *(void *)unint64_t v41 = v50;
      *(void *)(v41 + 8) = v51;
      *(unsigned char *)(v41 + 16) = v52;
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v44 = *(void *)v42;
      uint64_t v45 = *(void *)(v42 + 8);
      char v46 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v45, v46);
      uint64_t v47 = *(void *)v41;
      uint64_t v48 = *(void *)(v41 + 8);
      char v49 = *(unsigned char *)(v41 + 16);
      *(void *)unint64_t v41 = v44;
      *(void *)(v41 + 8) = v45;
      *(unsigned char *)(v41 + 16) = v46;
      sub_24655947C(v47, v48, v49);
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_24655947C(*(void *)v41, *(void *)(v41 + 8), *(unsigned char *)(v41 + 16));
    swift_bridgeObjectRelease();
  }
  long long v53 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)unint64_t v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + 16) = v53;
LABEL_22:
  unint64_t v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v56 = *(void *)v55;
  uint64_t v57 = *(void *)(v55 + 8);
  char v58 = *(unsigned char *)(v55 + 16);
  sub_246558E9C(*(void *)v55, v57, v58);
  uint64_t v59 = *(void *)v54;
  uint64_t v60 = *(void *)(v54 + 8);
  *(void *)unint64_t v54 = v56;
  *(void *)(v54 + 8) = v57;
  char v61 = *(unsigned char *)(v54 + 16);
  *(unsigned char *)(v54 + 16) = v58;
  sub_246550978(v59, v60, v61);
  unint64_t v62 = (void *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v63 = (void *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v64 = v63[1];
  *unint64_t v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  unint64_t v65 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v66 = (a1 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v67 = (a2 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v68 = *(void *)v67;
  LOBYTE(v56) = *(unsigned char *)(v67 + 8);
  sub_246552D38(*(void *)v67, v56);
  uint64_t v69 = *(void *)v66;
  char v70 = *(unsigned char *)(v66 + 8);
  *(void *)unint64_t v66 = v68;
  *(unsigned char *)(v66 + 8) = v56;
  sub_246552EF4(v69, v70);
  uint64_t v71 = sub_24659D278();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  uint64_t v74 = v73 + 16;
  unint64_t v75 = v73 + 16 + v66;
  unint64_t v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v77 = (unsigned __int8 *)(v75 & v76);
  uint64_t v78 = (unsigned __int8 *)((v74 + v67) & v76);
  if (*(void *)(v72 + 64) <= 8uLL) {
    uint64_t v79 = 8;
  }
  else {
    uint64_t v79 = *(void *)(*(void *)(v71 - 8) + 64);
  }
  if (v77 != v78)
  {
    uint64_t v80 = v71;
    unsigned int v81 = v77[v79];
    unsigned int v82 = v81 - 2;
    if (v81 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v83 = v79;
      }
      else {
        uint64_t v83 = 4;
      }
      switch(v83)
      {
        case 1:
          int v84 = *v77;
          if (v79 >= 4) {
            goto LABEL_40;
          }
          goto LABEL_36;
        case 2:
          int v84 = *(unsigned __int16 *)v77;
          if (v79 >= 4) {
            goto LABEL_40;
          }
          goto LABEL_36;
        case 3:
          int v84 = *(unsigned __int16 *)(v75 & v76) | (*(unsigned __int8 *)((v75 & v76) + 2) << 16);
          if (v79 < 4) {
            goto LABEL_36;
          }
          goto LABEL_40;
        case 4:
          int v84 = *(_DWORD *)v77;
          if (v79 < 4)
          {
LABEL_36:
            unsigned int v81 = (v84 | (v82 << (8 * v79))) + 2;
            break;
          }
LABEL_40:
          if (v84 != -1) {
            goto LABEL_41;
          }
          goto LABEL_38;
        default:
          break;
      }
    }
    if (v81 == 1) {
LABEL_38:
    }
      (*(void (**)(unsigned __int8 *, uint64_t))(v72 + 8))(v77, v71);
    else {
LABEL_41:
    }
      swift_release();
    unsigned int v85 = v78[v79];
    unsigned int v86 = v85 - 2;
    if (v85 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v87 = v79;
      }
      else {
        uint64_t v87 = 4;
      }
      switch(v87)
      {
        case 1:
          int v88 = *v78;
          if (v79 >= 4) {
            goto LABEL_56;
          }
          goto LABEL_52;
        case 2:
          int v88 = *(unsigned __int16 *)v78;
          if (v79 >= 4) {
            goto LABEL_56;
          }
          goto LABEL_52;
        case 3:
          int v88 = *(unsigned __int16 *)v78 | (v78[2] << 16);
          if (v79 < 4) {
            goto LABEL_52;
          }
          goto LABEL_56;
        case 4:
          int v88 = *(_DWORD *)v78;
          if (v79 < 4)
          {
LABEL_52:
            unsigned int v85 = (v88 | (v86 << (8 * v79))) + 2;
            break;
          }
LABEL_56:
          if (v88 != -1) {
            goto LABEL_57;
          }
          goto LABEL_54;
        default:
          break;
      }
    }
    if (v85 == 1)
    {
LABEL_54:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v72 + 16))(v77, v78, v80);
      v77[v79] = 1;
    }
    else
    {
LABEL_57:
      *(void *)uint64_t v77 = *(void *)v78;
      v77[v79] = 0;
      swift_retain();
    }
  }
  uint64_t v89 = sub_24659CE68();
  uint64_t v90 = *(void *)(v89 - 8);
  int v91 = *(_DWORD *)(v90 + 84);
  uint64_t v92 = *(_DWORD *)(v90 + 80) & 0xF8 | 7;
  uint64_t v93 = v79 + v92 + 1;
  unint64_t v94 = (unint64_t)&v77[v93];
  unint64_t v95 = (unint64_t)&v78[v93];
  uint64_t v96 = (unsigned __int8 *)(v94 & ~v92);
  uint64_t v97 = (unsigned __int8 *)(v95 & ~v92);
  unint64_t v98 = *(void *)(v90 + 64);
  if (v96 != v97)
  {
    uint64_t v99 = v89;
    if (v91) {
      size_t v100 = *(void *)(v90 + 64);
    }
    else {
      size_t v100 = v98 + 1;
    }
    if (v100 <= 8) {
      uint64_t v101 = 8;
    }
    else {
      uint64_t v101 = v100;
    }
    unsigned int v102 = v96[v101];
    unsigned int v103 = v102 - 2;
    if (v102 >= 2)
    {
      if (v101 <= 3) {
        uint64_t v104 = v101;
      }
      else {
        uint64_t v104 = 4;
      }
      switch(v104)
      {
        case 1:
          int v105 = *v96;
          goto LABEL_74;
        case 2:
          int v105 = *(unsigned __int16 *)v96;
          goto LABEL_74;
        case 3:
          int v105 = *(unsigned __int16 *)v96 | (v96[2] << 16);
          goto LABEL_74;
        case 4:
          int v105 = *(_DWORD *)v96;
LABEL_74:
          int v106 = (v105 | (v103 << (8 * v101))) + 2;
          unsigned int v102 = v105 + 2;
          if (v101 < 4) {
            unsigned int v102 = v106;
          }
          break;
        default:
          break;
      }
    }
    if (v102 == 1)
    {
      if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v90 + 48))(v96, 1, v89)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v90 + 8))(v96, v99);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v107 = v97[v101];
    unsigned int v108 = v107 - 2;
    if (v107 >= 2)
    {
      if (v101 <= 3) {
        uint64_t v109 = v101;
      }
      else {
        uint64_t v109 = 4;
      }
      switch(v109)
      {
        case 1:
          int v110 = *v97;
          goto LABEL_89;
        case 2:
          int v110 = *(unsigned __int16 *)v97;
          goto LABEL_89;
        case 3:
          int v110 = *(unsigned __int16 *)v97 | (v97[2] << 16);
          goto LABEL_89;
        case 4:
          int v110 = *(_DWORD *)v97;
LABEL_89:
          int v111 = (v110 | (v108 << (8 * v101))) + 2;
          unsigned int v107 = v110 + 2;
          if (v101 < 4) {
            unsigned int v107 = v111;
          }
          break;
        default:
          break;
      }
    }
    if (v107 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v90 + 48))(v97, 1, v99))
      {
        memcpy(v96, v97, v100);
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v90 + 16))(v96, v97, v99);
        (*(void (**)(unsigned __int8 *, void, uint64_t, uint64_t))(v90 + 56))(v96, 0, 1, v99);
      }
      v96[v101] = 1;
    }
    else
    {
      *(void *)uint64_t v96 = *(void *)v97;
      v96[v101] = 0;
      swift_retain();
    }
  }
  if (v91) {
    unint64_t v112 = v98;
  }
  else {
    unint64_t v112 = v98 + 1;
  }
  uint64_t v113 = 8;
  if (v112 <= 8) {
    uint64_t v114 = 8;
  }
  else {
    uint64_t v114 = v112;
  }
  uint64_t v115 = sub_24659D5D8();
  uint64_t v116 = *(void *)(v115 - 8);
  uint64_t v117 = *(_DWORD *)(v116 + 80) & 0xF8 | 7;
  uint64_t v118 = v114 + v117 + 1;
  long long v119 = (unsigned __int8 *)((unint64_t)&v96[v118] & ~v117);
  uint64_t v120 = (unsigned __int8 *)((unint64_t)&v97[v118] & ~v117);
  if (*(void *)(v116 + 64) > 8uLL) {
    uint64_t v113 = *(void *)(v116 + 64);
  }
  if (v119 != v120)
  {
    uint64_t v121 = v115;
    unsigned int v122 = v119[v113];
    unsigned int v123 = v122 - 2;
    if (v122 >= 2)
    {
      if (v113 <= 3) {
        uint64_t v124 = v113;
      }
      else {
        uint64_t v124 = 4;
      }
      switch(v124)
      {
        case 1:
          int v125 = *v119;
          goto LABEL_115;
        case 2:
          int v125 = *(unsigned __int16 *)v119;
          goto LABEL_115;
        case 3:
          int v125 = *(unsigned __int16 *)v119 | (v119[2] << 16);
          goto LABEL_115;
        case 4:
          int v125 = *(_DWORD *)v119;
LABEL_115:
          int v126 = (v125 | (v123 << (8 * v113))) + 2;
          unsigned int v122 = v125 + 2;
          if (v113 < 4) {
            unsigned int v122 = v126;
          }
          break;
        default:
          break;
      }
    }
    if (v122 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v116 + 8))(v119, v115);
    }
    else {
      swift_release();
    }
    unsigned int v127 = v120[v113];
    unsigned int v128 = v127 - 2;
    if (v127 >= 2)
    {
      if (v113 <= 3) {
        uint64_t v129 = v113;
      }
      else {
        uint64_t v129 = 4;
      }
      switch(v129)
      {
        case 1:
          int v130 = *v120;
          goto LABEL_129;
        case 2:
          int v130 = *(unsigned __int16 *)v120;
          goto LABEL_129;
        case 3:
          int v130 = *(unsigned __int16 *)v120 | (v120[2] << 16);
          goto LABEL_129;
        case 4:
          int v130 = *(_DWORD *)v120;
LABEL_129:
          int v131 = (v130 | (v128 << (8 * v113))) + 2;
          unsigned int v127 = v130 + 2;
          if (v113 < 4) {
            unsigned int v127 = v131;
          }
          break;
        default:
          break;
      }
    }
    if (v127 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v116 + 16))(v119, v120, v121);
      v119[v113] = 1;
    }
    else
    {
      *(void *)long long v119 = *(void *)v120;
      v119[v113] = 0;
      swift_retain();
    }
  }
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v133 = *(void *)(v132 - 8);
  uint64_t v134 = *(void (**)(unint64_t, unint64_t, uint64_t))(v133 + 24);
  uint64_t v135 = v133 + 24;
  uint64_t v136 = *(unsigned __int8 *)(v133 + 80);
  uint64_t v137 = v113 + v136 + 1;
  unint64_t v138 = (unint64_t)&v119[v137] & ~v136;
  unint64_t v139 = (unint64_t)&v120[v137] & ~v136;
  v134(v138, v139, v132);
  v134((*(void *)(v135 + 40) + v136 + v138) & ~v136, (*(void *)(v135 + 40) + v136 + v139) & ~v136, v132);
  return a1;
}

uint64_t sub_246588854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  unint64_t v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v18 = v17[1];
  *unint64_t v16 = *v17;
  v16[1] = v18;
  unint64_t v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v21 = *(unsigned char *)(v20 + 16);
  *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  *(unsigned char *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v23 = (a1 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (a2 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v22) = *(unsigned char *)(v24 + 8);
  *(void *)unint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = v22;
  uint64_t v25 = sub_24659D278();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  uint64_t v28 = v27 + 16;
  unint64_t v29 = v27 + 16 + v23;
  unint64_t v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = (void *)(v29 & v30);
  uint64_t v32 = (unsigned __int8 *)((v28 + v24) & v30);
  if (*(void *)(v26 + 64) <= 8uLL) {
    uint64_t v33 = 8;
  }
  else {
    uint64_t v33 = *(void *)(*(void *)(v25 - 8) + 64);
  }
  unsigned int v34 = v32[v33];
  unsigned int v35 = v34 - 2;
  if (v34 >= 2)
  {
    if (v33 <= 3) {
      uint64_t v36 = v33;
    }
    else {
      uint64_t v36 = 4;
    }
    switch(v36)
    {
      case 1:
        int v37 = *v32;
        goto LABEL_13;
      case 2:
        int v37 = *(unsigned __int16 *)v32;
        goto LABEL_13;
      case 3:
        int v37 = *(unsigned __int16 *)v32 | (v32[2] << 16);
        goto LABEL_13;
      case 4:
        int v37 = *(_DWORD *)v32;
LABEL_13:
        int v38 = (v37 | (v35 << (8 * v33))) + 2;
        unsigned int v34 = v37 + 2;
        if (v33 < 4) {
          unsigned int v34 = v38;
        }
        break;
      default:
        break;
    }
  }
  if (v34 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v26 + 32))(v31, v32, v25);
    char v39 = 1;
  }
  else
  {
    char v39 = 0;
    *uint64_t v31 = *(void *)v32;
  }
  *((unsigned char *)v31 + v33) = v39;
  uint64_t v40 = v33 + 1;
  uint64_t v41 = sub_24659CE68();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(_DWORD *)(v42 + 80) & 0xF8 | 7;
  unint64_t v44 = (unint64_t)&v32[v40 + v43];
  uint64_t v45 = (void *)(((unint64_t)v31 + v40 + v43) & ~v43);
  char v46 = (unsigned __int8 *)(v44 & ~v43);
  if (*(_DWORD *)(v42 + 84)) {
    size_t v47 = *(void *)(v42 + 64);
  }
  else {
    size_t v47 = *(void *)(v42 + 64) + 1;
  }
  if (v47 <= 8) {
    uint64_t v48 = 8;
  }
  else {
    uint64_t v48 = v47;
  }
  unsigned int v49 = v46[v48];
  unsigned int v50 = v49 - 2;
  if (v49 >= 2)
  {
    if (v48 <= 3) {
      uint64_t v51 = v48;
    }
    else {
      uint64_t v51 = 4;
    }
    switch(v51)
    {
      case 1:
        int v52 = *v46;
        goto LABEL_33;
      case 2:
        int v52 = *(unsigned __int16 *)v46;
        goto LABEL_33;
      case 3:
        int v52 = *(unsigned __int16 *)v46 | (v46[2] << 16);
        goto LABEL_33;
      case 4:
        int v52 = *(_DWORD *)v46;
LABEL_33:
        int v53 = (v52 | (v50 << (8 * v48))) + 2;
        unsigned int v49 = v52 + 2;
        if (v48 < 4) {
          unsigned int v49 = v53;
        }
        break;
      default:
        break;
    }
  }
  if (v49 == 1)
  {
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v42 + 48))(v46, 1, v41))
    {
      memcpy(v45, v46, v47);
      char v54 = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v42 + 32))(v45, v46, v41);
      char v54 = 1;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v41);
    }
  }
  else
  {
    char v54 = 0;
    void *v45 = *(void *)v46;
  }
  *((unsigned char *)v45 + v48) = v54;
  uint64_t v55 = sub_24659D5D8();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(_DWORD *)(v56 + 80) & 0xF8 | 7;
  uint64_t v58 = v48 + v57 + 1;
  uint64_t v59 = (void *)(((unint64_t)v45 + v58) & ~v57);
  uint64_t v60 = (unsigned __int8 *)((unint64_t)&v46[v58] & ~v57);
  if (*(void *)(v56 + 64) <= 8uLL) {
    uint64_t v61 = 8;
  }
  else {
    uint64_t v61 = *(void *)(v56 + 64);
  }
  unsigned int v62 = v60[v61];
  unsigned int v63 = v62 - 2;
  if (v62 >= 2)
  {
    if (v61 <= 3) {
      uint64_t v64 = v61;
    }
    else {
      uint64_t v64 = 4;
    }
    switch(v64)
    {
      case 1:
        int v65 = *v60;
        goto LABEL_52;
      case 2:
        int v65 = *(unsigned __int16 *)v60;
        goto LABEL_52;
      case 3:
        int v65 = *(unsigned __int16 *)v60 | (v60[2] << 16);
        goto LABEL_52;
      case 4:
        int v65 = *(_DWORD *)v60;
LABEL_52:
        int v66 = (v65 | (v63 << (8 * v61))) + 2;
        unsigned int v62 = v65 + 2;
        if (v61 < 4) {
          unsigned int v62 = v66;
        }
        break;
      default:
        break;
    }
  }
  if (v62 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v56 + 32))(v59, v60, v55);
    char v67 = 1;
  }
  else
  {
    char v67 = 0;
    void *v59 = *(void *)v60;
  }
  *((unsigned char *)v59 + v61) = v67;
  uint64_t v68 = v61 + 1;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v70 = *(void *)(v69 - 8);
  uint64_t v71 = *(void (**)(unint64_t, unint64_t, uint64_t))(v70 + 32);
  uint64_t v72 = v70 + 32;
  uint64_t v73 = *(unsigned __int8 *)(v70 + 80);
  unint64_t v74 = ((unint64_t)v59 + v68 + v73) & ~v73;
  unint64_t v75 = (unint64_t)&v60[v68 + v73] & ~v73;
  v71(v74, v75, v69);
  v71((*(void *)(v72 + 32) + v73 + v74) & ~v73, (*(void *)(v72 + 32) + v73 + v75) & ~v73, v69);
  return a1;
}

uint64_t sub_246588E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  char v9 = *(unsigned char *)(v8 + 16);
  uint64_t v10 = *(void *)v7;
  uint64_t v11 = *(void *)(v7 + 8);
  char v12 = *(unsigned char *)(v7 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = v9;
  sub_24655947C(v10, v11, v12);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRelease();
  unint64_t v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      char v15 = *(unsigned char *)(v14 + 16);
      uint64_t v16 = *(void *)v13;
      uint64_t v17 = *(void *)(v13 + 8);
      char v18 = *(unsigned char *)(v13 + 16);
      *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
      *(unsigned char *)(v13 + 16) = v15;
      sub_24655947C(v16, v17, v18);
      *(void *)(v13 + 24) = *(void *)(v14 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_24655947C(*(void *)v13, *(void *)(v13 + 8), *(unsigned char *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  long long v19 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v19;
LABEL_6:
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v21 + 24) >= 0xFFFFFFFFuLL)
    {
      char v22 = *(unsigned char *)(v21 + 16);
      uint64_t v23 = *(void *)v20;
      uint64_t v24 = *(void *)(v20 + 8);
      char v25 = *(unsigned char *)(v20 + 16);
      *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
      *(unsigned char *)(v20 + 16) = v22;
      sub_24655947C(v23, v24, v25);
      *(void *)(v20 + 24) = *(void *)(v21 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_24655947C(*(void *)v20, *(void *)(v20 + 8), *(unsigned char *)(v20 + 16));
    swift_bridgeObjectRelease();
  }
  long long v26 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v26;
LABEL_11:
  unint64_t v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v27 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v28 + 24) >= 0xFFFFFFFFuLL)
    {
      char v29 = *(unsigned char *)(v28 + 16);
      uint64_t v30 = *(void *)v27;
      uint64_t v31 = *(void *)(v27 + 8);
      char v32 = *(unsigned char *)(v27 + 16);
      *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
      *(unsigned char *)(v27 + 16) = v29;
      sub_24655947C(v30, v31, v32);
      *(void *)(v27 + 24) = *(void *)(v28 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_24655947C(*(void *)v27, *(void *)(v27 + 8), *(unsigned char *)(v27 + 16));
    swift_bridgeObjectRelease();
  }
  long long v33 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v33;
LABEL_16:
  unint64_t v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v36 = *(unsigned char *)(v35 + 16);
  uint64_t v37 = *(void *)v34;
  uint64_t v38 = *(void *)(v34 + 8);
  *(_OWORD *)unint64_t v34 = *(_OWORD *)v35;
  char v39 = *(unsigned char *)(v34 + 16);
  *(unsigned char *)(v34 + 16) = v36;
  sub_246550978(v37, v38, v39);
  *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v28 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  unint64_t v40 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v41 = (a1 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (a2 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  char v43 = *(unsigned char *)(v42 + 8);
  uint64_t v44 = *(void *)v41;
  char v45 = *(unsigned char *)(v41 + 8);
  *(void *)unint64_t v41 = *(void *)v42;
  *(unsigned char *)(v41 + 8) = v43;
  sub_246552EF4(v44, v45);
  uint64_t v46 = sub_24659D278();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(_DWORD *)(v47 + 80) & 0xF8;
  uint64_t v49 = v48 + 16;
  unint64_t v50 = v48 + 16 + v41;
  unint64_t v51 = ~v48 & 0xFFFFFFFFFFFFFFF8;
  int v52 = (unsigned __int8 *)(v50 & v51);
  int v53 = (unsigned __int8 *)((v49 + v42) & v51);
  if (*(void *)(v47 + 64) <= 8uLL) {
    uint64_t v54 = 8;
  }
  else {
    uint64_t v54 = *(void *)(*(void *)(v46 - 8) + 64);
  }
  if (v52 != v53)
  {
    uint64_t v55 = v46;
    unsigned int v56 = v52[v54];
    unsigned int v57 = v56 - 2;
    if (v56 >= 2)
    {
      if (v54 <= 3) {
        uint64_t v58 = v54;
      }
      else {
        uint64_t v58 = 4;
      }
      switch(v58)
      {
        case 1:
          int v59 = *v52;
          goto LABEL_29;
        case 2:
          int v59 = *(unsigned __int16 *)v52;
          goto LABEL_29;
        case 3:
          int v59 = *(unsigned __int16 *)(v50 & v51) | (*(unsigned __int8 *)((v50 & v51) + 2) << 16);
          goto LABEL_29;
        case 4:
          int v59 = *(_DWORD *)v52;
LABEL_29:
          int v60 = (v59 | (v57 << (8 * v54))) + 2;
          unsigned int v56 = v59 + 2;
          if (v54 < 4) {
            unsigned int v56 = v60;
          }
          break;
        default:
          break;
      }
    }
    if (v56 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v47 + 8))(v52, v46);
    }
    else {
      swift_release();
    }
    unsigned int v61 = v53[v54];
    unsigned int v62 = v61 - 2;
    if (v61 >= 2)
    {
      if (v54 <= 3) {
        uint64_t v63 = v54;
      }
      else {
        uint64_t v63 = 4;
      }
      switch(v63)
      {
        case 1:
          int v64 = *v53;
          goto LABEL_43;
        case 2:
          int v64 = *(unsigned __int16 *)v53;
          goto LABEL_43;
        case 3:
          int v64 = *(unsigned __int16 *)v53 | (v53[2] << 16);
          goto LABEL_43;
        case 4:
          int v64 = *(_DWORD *)v53;
LABEL_43:
          int v65 = (v64 | (v62 << (8 * v54))) + 2;
          unsigned int v61 = v64 + 2;
          if (v54 < 4) {
            unsigned int v61 = v65;
          }
          break;
        default:
          break;
      }
    }
    if (v61 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v47 + 32))(v52, v53, v55);
      char v66 = 1;
    }
    else
    {
      char v66 = 0;
      *(void *)int v52 = *(void *)v53;
    }
    v52[v54] = v66;
  }
  uint64_t v67 = sub_24659CE68();
  uint64_t v68 = *(void *)(v67 - 8);
  int v69 = *(_DWORD *)(v68 + 84);
  uint64_t v70 = *(_DWORD *)(v68 + 80) & 0xF8 | 7;
  uint64_t v71 = v54 + v70 + 1;
  unint64_t v72 = (unint64_t)&v52[v71];
  unint64_t v73 = (unint64_t)&v53[v71];
  unint64_t v74 = (unsigned __int8 *)(v72 & ~v70);
  unint64_t v75 = (unsigned __int8 *)(v73 & ~v70);
  unint64_t v76 = *(void *)(v68 + 64);
  if (v74 != v75)
  {
    uint64_t v77 = v67;
    if (v69) {
      size_t v78 = *(void *)(v68 + 64);
    }
    else {
      size_t v78 = v76 + 1;
    }
    if (v78 <= 8) {
      uint64_t v79 = 8;
    }
    else {
      uint64_t v79 = v78;
    }
    unsigned int v80 = v74[v79];
    unsigned int v81 = v80 - 2;
    if (v80 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v82 = v79;
      }
      else {
        uint64_t v82 = 4;
      }
      switch(v82)
      {
        case 1:
          int v83 = *v74;
          goto LABEL_65;
        case 2:
          int v83 = *(unsigned __int16 *)v74;
          goto LABEL_65;
        case 3:
          int v83 = *(unsigned __int16 *)v74 | (v74[2] << 16);
          goto LABEL_65;
        case 4:
          int v83 = *(_DWORD *)v74;
LABEL_65:
          int v84 = (v83 | (v81 << (8 * v79))) + 2;
          unsigned int v80 = v83 + 2;
          if (v79 < 4) {
            unsigned int v80 = v84;
          }
          break;
        default:
          break;
      }
    }
    if (v80 == 1)
    {
      if (!(*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v68 + 48))(v74, 1, v67)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v68 + 8))(v74, v77);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v85 = v75[v79];
    unsigned int v86 = v85 - 2;
    if (v85 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v87 = v79;
      }
      else {
        uint64_t v87 = 4;
      }
      switch(v87)
      {
        case 1:
          int v88 = *v75;
          goto LABEL_80;
        case 2:
          int v88 = *(unsigned __int16 *)v75;
          goto LABEL_80;
        case 3:
          int v88 = *(unsigned __int16 *)v75 | (v75[2] << 16);
          goto LABEL_80;
        case 4:
          int v88 = *(_DWORD *)v75;
LABEL_80:
          int v89 = (v88 | (v86 << (8 * v79))) + 2;
          unsigned int v85 = v88 + 2;
          if (v79 < 4) {
            unsigned int v85 = v89;
          }
          break;
        default:
          break;
      }
    }
    if (v85 == 1)
    {
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v68 + 48))(v75, 1, v77))
      {
        memcpy(v74, v75, v78);
        char v90 = 1;
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v68 + 32))(v74, v75, v77);
        char v90 = 1;
        (*(void (**)(unsigned __int8 *, void, uint64_t, uint64_t))(v68 + 56))(v74, 0, 1, v77);
      }
    }
    else
    {
      char v90 = 0;
      *(void *)unint64_t v74 = *(void *)v75;
    }
    v74[v79] = v90;
  }
  if (v69) {
    unint64_t v91 = v76;
  }
  else {
    unint64_t v91 = v76 + 1;
  }
  uint64_t v92 = 8;
  if (v91 <= 8) {
    uint64_t v93 = 8;
  }
  else {
    uint64_t v93 = v91;
  }
  uint64_t v94 = sub_24659D5D8();
  uint64_t v95 = *(void *)(v94 - 8);
  uint64_t v96 = *(_DWORD *)(v95 + 80) & 0xF8 | 7;
  uint64_t v97 = v93 + v96 + 1;
  unint64_t v98 = (unsigned __int8 *)((unint64_t)&v74[v97] & ~v96);
  uint64_t v99 = (unsigned __int8 *)((unint64_t)&v75[v97] & ~v96);
  if (*(void *)(v95 + 64) > 8uLL) {
    uint64_t v92 = *(void *)(v95 + 64);
  }
  if (v98 != v99)
  {
    uint64_t v100 = v94;
    unsigned int v101 = v98[v92];
    unsigned int v102 = v101 - 2;
    if (v101 >= 2)
    {
      if (v92 <= 3) {
        uint64_t v103 = v92;
      }
      else {
        uint64_t v103 = 4;
      }
      switch(v103)
      {
        case 1:
          int v104 = *v98;
          goto LABEL_106;
        case 2:
          int v104 = *(unsigned __int16 *)v98;
          goto LABEL_106;
        case 3:
          int v104 = *(unsigned __int16 *)v98 | (v98[2] << 16);
          goto LABEL_106;
        case 4:
          int v104 = *(_DWORD *)v98;
LABEL_106:
          int v105 = (v104 | (v102 << (8 * v92))) + 2;
          unsigned int v101 = v104 + 2;
          if (v92 < 4) {
            unsigned int v101 = v105;
          }
          break;
        default:
          break;
      }
    }
    if (v101 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v95 + 8))(v98, v94);
    }
    else {
      swift_release();
    }
    unsigned int v106 = v99[v92];
    unsigned int v107 = v106 - 2;
    if (v106 >= 2)
    {
      if (v92 <= 3) {
        uint64_t v108 = v92;
      }
      else {
        uint64_t v108 = 4;
      }
      switch(v108)
      {
        case 1:
          int v109 = *v99;
          goto LABEL_120;
        case 2:
          int v109 = *(unsigned __int16 *)v99;
          goto LABEL_120;
        case 3:
          int v109 = *(unsigned __int16 *)v99 | (v99[2] << 16);
          goto LABEL_120;
        case 4:
          int v109 = *(_DWORD *)v99;
LABEL_120:
          int v110 = (v109 | (v107 << (8 * v92))) + 2;
          unsigned int v106 = v109 + 2;
          if (v92 < 4) {
            unsigned int v106 = v110;
          }
          break;
        default:
          break;
      }
    }
    if (v106 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v95 + 32))(v98, v99, v100);
      char v111 = 1;
    }
    else
    {
      char v111 = 0;
      *(void *)unint64_t v98 = *(void *)v99;
    }
    v98[v92] = v111;
  }
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = *(void (**)(unint64_t, unint64_t, uint64_t))(v113 + 40);
  uint64_t v115 = v113 + 40;
  uint64_t v116 = *(unsigned __int8 *)(v113 + 80);
  uint64_t v117 = v92 + v116 + 1;
  unint64_t v118 = (unint64_t)&v98[v117] & ~v116;
  unint64_t v119 = (unint64_t)&v99[v117] & ~v116;
  v114(v118, v119, v112);
  v114((*(void *)(v115 + 24) + v116 + v118) & ~v116, (*(void *)(v115 + 24) + v116 + v119) & ~v116, v112);
  return a1;
}

uint64_t sub_24658988C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v41 = *(_DWORD *)(v3 + 84);
  if (v41 <= 0x7FFFFFFF) {
    unsigned int v4 = 0x7FFFFFFF;
  }
  else {
    unsigned int v4 = *(_DWORD *)(v3 + 84);
  }
  uint64_t v5 = *(void *)(sub_24659D278() - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  if (v6 <= 8) {
    unint64_t v6 = 8;
  }
  unint64_t v42 = v6;
  uint64_t v7 = *(void *)(sub_24659CE68() - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(sub_24659D5D8() - 8);
  if (*(void *)(v10 + 64) <= 8uLL) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = *(void *)(v10 + 64);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0) - 8);
  uint64_t v13 = v12;
  unsigned int v14 = *(_DWORD *)(v12 + 84);
  if (v14 <= v4) {
    unsigned int v15 = v4;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v16 = *(void *)(v3 + 64);
  if (v8) {
    unint64_t v17 = v9;
  }
  else {
    unint64_t v17 = v9 + 1;
  }
  uint64_t v18 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = *(void *)(v12 + 64);
  if (v17 <= 8) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = v17;
  }
  uint64_t result = a2;
  if (a2)
  {
    unint64_t v22 = (((((((((v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
         + 63) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = *(_DWORD *)(v5 + 80) & 0xF8;
    unint64_t v24 = ~v23 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = v23 + 16;
    uint64_t v26 = *(_DWORD *)(v7 + 80) & 0xF8 | 7;
    uint64_t v27 = v42 + v26 + 1;
    uint64_t v28 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
    uint64_t v29 = v20 + v28 + 1;
    uint64_t v30 = v11 + v18 + 1;
    if (a2 <= v15) {
      goto LABEL_38;
    }
    uint64_t v31 = ((v19
          + v18
          + ((v30 + ((v29 + ((v27 + ((v25 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v28)) & ~v18)) & ~v18)
        + v19;
    char v32 = 8 * v31;
    if (v31 > 3)
    {
LABEL_21:
      int v33 = *((unsigned __int8 *)a1 + v31);
      if (!*((unsigned char *)a1 + v31)) {
        goto LABEL_38;
      }
      goto LABEL_28;
    }
    unsigned int v34 = ((a2 - v15 + ~(-1 << v32)) >> v32) + 1;
    if (HIWORD(v34))
    {
      int v33 = *(_DWORD *)((char *)a1 + v31);
      if (!v33) {
        goto LABEL_38;
      }
    }
    else
    {
      if (v34 <= 0xFF)
      {
        if (v34 < 2)
        {
LABEL_38:
          if (v4 >= v14)
          {
            if (v41 < 0x7FFFFFFF)
            {
              unint64_t v40 = *(void *)((((unint64_t)a1 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
              if (v40 >= 0xFFFFFFFF) {
                LODWORD(v40) = -1;
              }
              return (v40 + 1);
            }
            else
            {
              char v39 = *(uint64_t (**)(unsigned __int16 *))(v3 + 48);
              return v39(a1);
            }
          }
          else
          {
            uint64_t v38 = *(uint64_t (**)(unint64_t))(v13 + 48);
            return v38((v30
                      + ((v29
                        + ((v27 + ((v25 + (((unint64_t)a1 + v22 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v28)) & ~v18);
          }
        }
        goto LABEL_21;
      }
      int v33 = *(unsigned __int16 *)((char *)a1 + v31);
      if (!*(unsigned __int16 *)((char *)a1 + v31)) {
        goto LABEL_38;
      }
    }
LABEL_28:
    int v35 = (v33 - 1) << v32;
    if (v31 > 3) {
      int v35 = 0;
    }
    if (v31)
    {
      if (v31 <= 3) {
        int v36 = v31;
      }
      else {
        int v36 = 4;
      }
      switch(v36)
      {
        case 2:
          int v37 = *a1;
          break;
        case 3:
          int v37 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v37 = *(_DWORD *)a1;
          break;
        default:
          int v37 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v37 = 0;
    }
    return v15 + (v37 | v35) + 1;
  }
  return result;
}

void sub_246589D30(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v42 = *(_DWORD *)(v4 + 84);
  if (v42 <= 0x7FFFFFFF) {
    unsigned int v5 = 0x7FFFFFFF;
  }
  else {
    unsigned int v5 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v6 = *(void *)(sub_24659D278() - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  uint64_t v8 = 8;
  uint64_t v9 = *(void *)(sub_24659CE68() - 8);
  int v10 = *(_DWORD *)(v9 + 84);
  unint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(sub_24659D5D8() - 8);
  if (*(void *)(v12 + 64) > 8uLL) {
    uint64_t v8 = *(void *)(v12 + 64);
  }
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0) - 8);
  uint64_t v14 = v13;
  unsigned int v15 = *(_DWORD *)(v13 + 84);
  if (v15 <= v5) {
    unsigned int v16 = v5;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v17 = *(void *)(v4 + 64);
  unint64_t v18 = (((((((((v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(v13 + 64);
  uint64_t v21 = *(_DWORD *)(v6 + 80) & 0xF8;
  unint64_t v22 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = v21 + 16;
  uint64_t v24 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  uint64_t v25 = v7 + v24 + 1;
  if (v10) {
    unint64_t v26 = v11;
  }
  else {
    unint64_t v26 = v11 + 1;
  }
  if (v26 <= 8) {
    unint64_t v26 = 8;
  }
  uint64_t v27 = *(_DWORD *)(v12 + 80) & 0xF8 | 7;
  uint64_t v28 = v26 + v27 + 1;
  uint64_t v29 = v8 + v19 + 1;
  size_t v30 = ((v20
        + v19
        + ((v29 + ((v28 + ((v25 + ((v23 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~v27)) & ~v19)) & ~v19)
      + v20;
  if (a3 <= v16)
  {
    int v32 = 0;
    uint64_t v31 = a1;
  }
  else
  {
    uint64_t v31 = a1;
    if (v30 <= 3)
    {
      unsigned int v36 = ((a3 - v16 + ~(-1 << (8 * v30))) >> (8 * v30)) + 1;
      if (HIWORD(v36))
      {
        int v32 = 4;
      }
      else if (v36 >= 0x100)
      {
        int v32 = 2;
      }
      else
      {
        int v32 = v36 > 1;
      }
    }
    else
    {
      int v32 = 1;
    }
  }
  if (v16 < a2)
  {
    unsigned int v33 = ~v16 + a2;
    if (v30 < 4)
    {
      int v34 = (v33 >> (8 * v30)) + 1;
      if (v30)
      {
        int v37 = v33 & ~(-1 << (8 * v30));
        bzero(v31, v30);
        if (v30 == 3)
        {
          *(_WORD *)uint64_t v31 = v37;
          void v31[2] = BYTE2(v37);
        }
        else if (v30 == 2)
        {
          *(_WORD *)uint64_t v31 = v37;
        }
        else
        {
          *uint64_t v31 = v37;
        }
      }
    }
    else
    {
      bzero(v31, v30);
      *(_DWORD *)uint64_t v31 = v33;
      int v34 = 1;
    }
    switch(v32)
    {
      case 1:
        v31[v30] = v34;
        return;
      case 2:
        *(_WORD *)&v31[v30] = v34;
        return;
      case 3:
        goto LABEL_61;
      case 4:
        *(_DWORD *)&v31[v30] = v34;
        return;
      default:
        return;
    }
  }
  size_t v35 = v18 + 16;
  switch(v32)
  {
    case 1:
      v31[v30] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&v31[v30] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_61:
      __break(1u);
      JUMPOUT(0x24658A288);
    case 4:
      *(_DWORD *)&v31[v30] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (a2)
      {
LABEL_37:
        if (v5 >= v15)
        {
          if (v5 >= a2)
          {
            if (v42 < 0x7FFFFFFF)
            {
              unsigned int v41 = (void *)((unint64_t)&v31[v17 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                v41[2] = 0;
                v41[3] = 0;
                *unsigned int v41 = a2 ^ 0x80000000;
                v41[1] = 0;
              }
              else
              {
                v41[3] = a2 - 1;
              }
            }
            else
            {
              unint64_t v40 = *(void (**)(unsigned char *, void))(v4 + 56);
              v40(v31, a2);
            }
          }
          else if (v18 != -16)
          {
            bzero(v31, v35);
            *(_DWORD *)uint64_t v31 = ~v5 + a2;
          }
        }
        else
        {
          unint64_t v38 = (v29
               + ((v28 + ((v25 + ((v23 + ((unint64_t)&v31[v35 + 7] & 0xFFFFFFFFFFFFFFF8)) & v22)) & ~v24)) & ~v27)) & ~v19;
          char v39 = *(void (**)(unint64_t, void))(v14 + 56);
          v39(v38, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for CompactManagedAppCell()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24658A2C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24658A30C(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  unsigned int v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      int v10 = (long long *)(v5 + 2);
      unint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *unint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        unsigned int v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)unsigned int v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_24659DC38();
}

uint64_t sub_24658A4D0()
{
  return sub_24659D418();
}

uint64_t sub_24658A4F4(uint64_t a1)
{
  uint64_t v2 = sub_24659D278();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24659D428();
}

uint64_t sub_24658A5BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v45 = a2;
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C910);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C918);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C920);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v44 = sub_24659DB28();
  uint64_t v51 = v44;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v48 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v39 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v38 = (uint64_t)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int v37 = (char *)&v35 - v5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D3E8();
  sub_24659D3E8();
  uint64_t v51 = sub_24659D3E8();
  uint64_t WitnessTable = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C928);
  uint64_t v53 = type metadata accessor for OfferView();
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C930);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB98();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD90);
  sub_24659D3E8();
  swift_getTupleTypeMetadata2();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v6 = sub_24659DB28();
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v47 = v6;
  uint64_t v51 = v6;
  uint64_t WitnessTable = v46;
  uint64_t v7 = swift_getOpaqueTypeMetadata2();
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  int v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v35 - v11;
  uint64_t v13 = sub_24659D5D8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unsigned int v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = OpaqueTypeMetadata2;
  uint64_t v17 = sub_24659D628();
  uint64_t v40 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v20 = v42;
  sub_246567B18((uint64_t)v16);
  char v21 = sub_24659D5C8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v21)
  {
    sub_24658AE10(v20, (uint64_t)v10);
    uint64_t v51 = v47;
    uint64_t WitnessTable = v46;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_246598AFC(v10, v7, OpaqueTypeConformance2);
    int v23 = *(void (**)(char *, uint64_t))(v36 + 8);
    v23(v10, v7);
    sub_246598AFC(v12, v7, OpaqueTypeConformance2);
    uint64_t v24 = v44;
    uint64_t v51 = v44;
    uint64_t WitnessTable = v48;
    swift_getOpaqueTypeConformance2();
    sub_246598B38((uint64_t)v10, v7);
    v23(v10, v7);
    v23(v12, v7);
  }
  else
  {
    uint64_t v25 = v38;
    sub_24658B18C(v20, v38);
    uint64_t v24 = v44;
    uint64_t v51 = v44;
    uint64_t WitnessTable = v48;
    uint64_t v26 = swift_getOpaqueTypeConformance2();
    uint64_t v27 = v37;
    uint64_t v28 = v43;
    sub_246598AFC(v25, v43, v26);
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v29(v25, v28);
    sub_246598AFC(v27, v28, v26);
    uint64_t v51 = v47;
    uint64_t WitnessTable = v46;
    swift_getOpaqueTypeConformance2();
    sub_246598C30(v25, v7, v28);
    v29(v25, v28);
    v29((uint64_t)v27, v28);
  }
  uint64_t v51 = v47;
  uint64_t WitnessTable = v46;
  uint64_t v30 = swift_getOpaqueTypeConformance2();
  uint64_t v51 = v24;
  uint64_t WitnessTable = v48;
  uint64_t v31 = swift_getOpaqueTypeConformance2();
  uint64_t v49 = v30;
  uint64_t v50 = v31;
  uint64_t v32 = v41;
  uint64_t v33 = swift_getWitnessTable();
  sub_246598AFC(v19, v32, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v19, v32);
}

uint64_t sub_24658AE10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v15 = sub_24659D6C8();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  uint64_t v19 = sub_24659D3E8();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C928);
  uint64_t v21 = type metadata accessor for OfferView();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C930);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  sub_24659DB98();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD90);
  sub_24659D3E8();
  swift_getTupleTypeMetadata2();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v8 = sub_24659DB28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - v10;
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v16 = v7;
  uint64_t v17 = v12;
  uint64_t v18 = v2;
  sub_24659D568();
  sub_24659DB18();
  sub_24659D6B8();
  swift_getWitnessTable();
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_24658B18C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v15 = sub_24659D6C8();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  uint64_t v19 = sub_24659D3E8();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C910);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C918);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C920);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  swift_getWitnessTable();
  uint64_t v8 = sub_24659DB28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - v10;
  sub_24659D568();
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v16 = v7;
  uint64_t v17 = v12;
  uint64_t v18 = v2;
  sub_24659DB18();
  sub_24659D6B8();
  swift_getWitnessTable();
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_24658B4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_24659D3E8();
  uint64_t v41 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)v34 - v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v36 = sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v37 = sub_24659D3E8();
  uint64_t v7 = sub_24659D628();
  uint64_t v39 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v34 - v8;
  sub_24659D758();
  uint64_t v10 = sub_24659D3E8();
  uint64_t v40 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v34 - v11;
  uint64_t v13 = sub_24659D3E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v42 = v13;
  uint64_t v43 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v38 = (char *)v34 - v15;
  sub_24659DBD8();
  uint64_t v16 = *(void *)(a1 + 24);
  sub_24659D9A8();
  char v17 = sub_24655C450(a1);
  v34[1] = v34;
  uint64_t v46 = v4;
  uint64_t v47 = v16;
  uint64_t v48 = v2;
  uint64_t v59 = v16;
  uint64_t v60 = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v19 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v57 = WitnessTable;
  uint64_t v58 = v19;
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v21 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v55 = v20;
  uint64_t v56 = v21;
  uint64_t v22 = v37;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = v22;
  uint64_t v25 = v35;
  sub_246591CA0(v17 & 1, (void (*)(uint64_t))sub_24658FC68, (uint64_t)v45, v5, v24, WitnessTable, v23, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v5);
  uint64_t v53 = v23;
  uint64_t v54 = WitnessTable;
  uint64_t v26 = swift_getWitnessTable();
  sub_24659D968();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v7);
  uint64_t v27 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v51 = v26;
  uint64_t v52 = v27;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v29 = v38;
  sub_24659D998();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v10);
  sub_24659D7B8();
  id v30 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v30, sel_userInterfaceIdiom);

  unint64_t v31 = sub_246560E3C();
  uint64_t v49 = v28;
  unint64_t v50 = v31;
  uint64_t v32 = v42;
  swift_getWitnessTable();
  sub_24659D9D8();
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v29, v32);
}

uint64_t sub_24658BA58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v64 = a2;
  uint64_t v60 = a1;
  uint64_t v73 = a5;
  uint64_t v65 = sub_24659D278();
  uint64_t v62 = *(void *)(v65 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v65);
  unsigned int v61 = &v53.i8[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v58 = (uint64_t)v53.i64 - v8;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE78);
  MEMORY[0x270FA5388](v72);
  uint64_t v63 = (uint64_t)v53.i64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24659D3F8();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v55 = &v53.i8[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (int64x2_t *)((char *)&v53 - v13);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  uint64_t v67 = sub_24659D3E8();
  uint64_t v70 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v59 = &v53.i8[-v15];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  uint64_t v69 = sub_24659D3E8();
  uint64_t v71 = *(void *)(v69 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v69);
  char v66 = &v53.i8[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  uint64_t v68 = &v53.i8[-v18];
  uint64_t v19 = &v14->i8[*(int *)(v10 + 20)];
  uint64_t v20 = *MEMORY[0x263F19860];
  uint64_t v21 = sub_24659D598();
  uint64_t v22 = *(void (**)(__int8 *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104);
  v22(v19, v20, v21);
  int64x2_t v53 = vdupq_n_s64(0x402A400000000000uLL);
  *uint64_t v14 = v53;
  uint64_t v78 = a4;
  uint64_t v79 = MEMORY[0x263F18860];
  uint64_t v57 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24656150C(&qword_268F8BE80, MEMORY[0x263F19048]);
  sub_24659D9E8();
  uint64_t v23 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_246561554((uint64_t)v14, MEMORY[0x263F19048]);
  uint64_t v24 = (int64x2_t *)v55;
  v22(&v55[*(int *)(v10 + 20)], v20, v21);
  *uint64_t v24 = v53;
  uint64_t v25 = (uint64_t)v24;
  type metadata accessor for CompactManagedAppCell();
  uint64_t v26 = v58;
  sub_246567ADC(v58);
  uint64_t v27 = v62;
  uint64_t v28 = v61;
  uint64_t v29 = v65;
  (*(void (**)(__int8 *, void, uint64_t))(v62 + 104))(v61, *MEMORY[0x263F18508], v65);
  LOBYTE(v24) = sub_24659D268();
  id v30 = *(void (**)(__int8 *, uint64_t))(v27 + 8);
  v30(v28, v29);
  v30((__int8 *)v26, v29);
  unint64_t v31 = self;
  uint64_t v32 = &selRef_systemGray6Color;
  if ((v24 & 1) == 0) {
    uint64_t v32 = &selRef_secondarySystemFillColor;
  }
  uint64_t v33 = MEMORY[0x24C52F0B0]([v31 *v32]);
  sub_24659D298();
  uint64_t v34 = v63;
  sub_2465615B4(v25, v63, v23);
  uint64_t v35 = v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE88) + 36);
  long long v36 = v81;
  *(_OWORD *)uint64_t v35 = v80;
  *(_OWORD *)(v35 + 16) = v36;
  *(void *)(v35 + 32) = v82;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE90);
  *(void *)(v34 + *(int *)(v37 + 52)) = v33;
  *(_WORD *)(v34 + *(int *)(v37 + 56)) = 256;
  uint64_t v38 = sub_24659DBD8();
  uint64_t v40 = v39;
  uint64_t v41 = (uint64_t *)(v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE98) + 36));
  *uint64_t v41 = v38;
  v41[1] = v40;
  sub_246561554(v25, v23);
  sub_24659DBD8();
  uint64_t v42 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v76 = WitnessTable;
  uint64_t v77 = v42;
  uint64_t v43 = v67;
  uint64_t v44 = swift_getWitnessTable();
  sub_246561BA4(&qword_268F8BEA0, &qword_268F8BE78);
  uint64_t v45 = v66;
  uint64_t v46 = v59;
  sub_24659D9C8();
  sub_246555440(v34, &qword_268F8BE78);
  (*(void (**)(__int8 *, uint64_t))(v70 + 8))(v46, v43);
  uint64_t v47 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v74 = v44;
  uint64_t v75 = v47;
  uint64_t v48 = v69;
  uint64_t v49 = swift_getWitnessTable();
  unint64_t v50 = v68;
  sub_246598AFC(v45, v48, v49);
  uint64_t v51 = *(void (**)(__int8 *, uint64_t))(v71 + 8);
  v51(v45, v48);
  sub_246598AFC(v50, v48, v49);
  return ((uint64_t (*)(__int8 *, uint64_t))v51)(v50, v48);
}

uint64_t sub_24658C208@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24659D838();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ManagedAppCellContext();
  sub_24659D7D8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1A680], v2);
  sub_24659D848();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v6 = sub_24659D8B8();
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v12 = v11;
  uint64_t result = swift_release();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v10 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_24658C38C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 40));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  sub_246561068(*v3, v5, v6, v7);
  int v8 = sub_24659D658();
  uint64_t v9 = sub_24659D868();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = result;
  *(void *)(a1 + 48) = v9;
  return result;
}

double sub_24658C420@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BE50);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24659D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 44));
  uint64_t v11 = v10[1];
  uint64_t v12 = v10[2];
  uint64_t v13 = v10[3];
  uint64_t v35 = *v10;
  uint64_t v34 = v11;
  uint64_t v33 = v12;
  sub_246561068(v35, v11, v12, v13);
  sub_246567B18((uint64_t)v9);
  char v14 = sub_24659D5C8();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  if (v14)
  {
    uint64_t v16 = sub_24659D858();
  }
  else
  {
    uint64_t v17 = sub_24659D7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
    uint64_t v16 = sub_24659D818();
    sub_246555440((uint64_t)v5, &qword_268F8BE50);
  }
  uint64_t KeyPath = swift_getKeyPath();
  sub_246567B18((uint64_t)v9);
  char v19 = sub_24659D5C8();
  v15(v9, v6);
  if (v19) {
    double v20 = 0.0;
  }
  else {
    double v20 = 62.0;
  }
  uint64_t v21 = v35;
  uint64_t v22 = v34;
  uint64_t v37 = v35;
  uint64_t v38 = v34;
  char v23 = v33;
  uint64_t v39 = v33;
  uint64_t v40 = v13;
  uint64_t v41 = KeyPath;
  uint64_t v42 = v16;
  sub_24659DBD8();
  sub_2465923D0(0.0, 1, 0.0, 1, v20, v19 & 1, 0.0, 1, v36, 0.0, 1, 0.0, 1);
  sub_246560F80(v21, v22, v23, v13);
  swift_release();
  swift_release();
  uint64_t v24 = sub_24659DA78();
  uint64_t v25 = swift_getKeyPath();
  uint64_t v26 = swift_getKeyPath();
  long long v27 = v36[7];
  *(_OWORD *)(a1 + 96) = v36[6];
  *(_OWORD *)(a1 + 112) = v27;
  long long v28 = v36[9];
  *(_OWORD *)(a1 + 128) = v36[8];
  *(_OWORD *)(a1 + 144) = v28;
  long long v29 = v36[3];
  *(_OWORD *)(a1 + 32) = v36[2];
  *(_OWORD *)(a1 + 48) = v29;
  long long v30 = v36[5];
  *(_OWORD *)(a1 + 64) = v36[4];
  *(_OWORD *)(a1 + 80) = v30;
  double result = *(double *)v36;
  long long v32 = v36[1];
  *(_OWORD *)a1 = v36[0];
  *(_OWORD *)(a1 + 16) = v32;
  *(void *)(a1 + 160) = v25;
  *(void *)(a1 + 168) = v24;
  *(void *)(a1 + 176) = v26;
  *(void *)(a1 + 184) = 2;
  *(unsigned char *)(a1 + 192) = 0;
  return result;
}

uint64_t sub_24658C774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManagedAppCellContext() + 48));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  sub_246561068(*v3, v5, v6, v7);
  uint64_t v8 = sub_24659DA78();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = sub_24659D868();
  uint64_t result = swift_getKeyPath();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = KeyPath;
  a1[5] = v8;
  a1[6] = result;
  a1[7] = v10;
  return result;
}

uint64_t sub_24658C818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v108 = a1;
  uint64_t v109 = a3;
  uint64_t v101 = a4;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C920);
  uint64_t v5 = MEMORY[0x270FA5388](v98);
  uint64_t v102 = (uint64_t)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v99 = (uint64_t *)((char *)&v76 - v7);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C918);
  uint64_t v8 = MEMORY[0x270FA5388](v96);
  uint64_t v100 = (uint64_t)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v97 = (char *)&v76 - v10;
  uint64_t v11 = sub_24659D5D8();
  uint64_t v79 = *(void *)(v11 - 8);
  uint64_t v80 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v78 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v77 = (uint64_t)&v76 - v14;
  uint64_t v107 = a2;
  uint64_t v15 = type metadata accessor for CompactManagedAppCell();
  uint64_t v88 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v87 = (char *)&v76 - v16;
  uint64_t v17 = sub_24659D6C8();
  uint64_t v83 = *(void *)(v17 - 8);
  uint64_t v84 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v82 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C988);
  uint64_t v91 = *(void *)(v19 - 8);
  uint64_t v92 = v19;
  MEMORY[0x270FA5388](v19);
  int v104 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C910);
  uint64_t v21 = MEMORY[0x270FA5388](v105);
  uint64_t v95 = (uint64_t)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  int v89 = (char *)&v76 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v106 = (uint64_t)&v76 - v25;
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  uint64_t v90 = sub_24659D628();
  sub_24659D758();
  uint64_t v93 = sub_24659D3E8();
  uint64_t v94 = sub_24659D3E8();
  uint64_t v26 = sub_24659D3E8();
  uint64_t v103 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  long long v29 = (char *)&v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  unint64_t v31 = (char *)&v76 - v30;
  sub_24658B4A0(v15, (uint64_t)v29);
  uint64_t v129 = v109;
  uint64_t v130 = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v33 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  uint64_t v127 = WitnessTable;
  uint64_t v128 = v33;
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v35 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  uint64_t v125 = v34;
  uint64_t v126 = v35;
  uint64_t v123 = swift_getWitnessTable();
  uint64_t v124 = WitnessTable;
  uint64_t v36 = swift_getWitnessTable();
  uint64_t v37 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  uint64_t v121 = v36;
  uint64_t v122 = v37;
  uint64_t v38 = swift_getWitnessTable();
  unint64_t v39 = sub_246560E3C();
  uint64_t v119 = v38;
  unint64_t v120 = v39;
  uint64_t v117 = swift_getWitnessTable();
  uint64_t v118 = MEMORY[0x263F18C10];
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v90 = (uint64_t)v31;
  uint64_t v81 = v40;
  sub_246598AFC(v29, v26, v40);
  uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t))(v103 + 8);
  uint64_t v93 = (uint64_t)v29;
  uint64_t v94 = v26;
  unsigned int v85 = v41;
  uint64_t v86 = v103 + 8;
  v41((uint64_t)v29, v26);
  uint64_t v42 = sub_24659D5F8();
  uint64_t v43 = v108;
  sub_24658D468((uint64_t)v131);
  *(_OWORD *)((char *)&v133[10] + 7) = v131[10];
  *(_OWORD *)((char *)&v133[11] + 7) = v131[11];
  *(_OWORD *)((char *)&v133[12] + 7) = v131[12];
  *(_WORD *)((char *)&v133[13] + 7) = v132;
  *(_OWORD *)((char *)&v133[6] + 7) = v131[6];
  *(_OWORD *)((char *)&v133[7] + 7) = v131[7];
  *(_OWORD *)((char *)&v133[8] + 7) = v131[8];
  *(_OWORD *)((char *)&v133[9] + 7) = v131[9];
  *(_OWORD *)((char *)&v133[2] + 7) = v131[2];
  *(_OWORD *)((char *)&v133[3] + 7) = v131[3];
  *(_OWORD *)((char *)&v133[4] + 7) = v131[4];
  *(_OWORD *)((char *)&v133[5] + 7) = v131[5];
  *(_OWORD *)((char *)v133 + 7) = v131[0];
  *(_OWORD *)((char *)&v133[1] + 7) = v131[1];
  *(_OWORD *)((char *)&v116[10] + 1) = v133[10];
  *(_OWORD *)((char *)&v116[11] + 1) = v133[11];
  *(_OWORD *)((char *)&v116[12] + 1) = v133[12];
  *(_OWORD *)((char *)&v116[12] + 10) = *(_OWORD *)((char *)&v133[12] + 9);
  *(_OWORD *)((char *)&v116[6] + 1) = v133[6];
  *(_OWORD *)((char *)&v116[7] + 1) = v133[7];
  *(_OWORD *)((char *)&v116[8] + 1) = v133[8];
  *(_OWORD *)((char *)&v116[9] + 1) = v133[9];
  *(_OWORD *)((char *)&v116[2] + 1) = v133[2];
  *(_OWORD *)((char *)&v116[3] + 1) = v133[3];
  *(_OWORD *)((char *)&v116[4] + 1) = v133[4];
  *(_OWORD *)((char *)&v116[5] + 1) = v133[5];
  *(_OWORD *)((char *)v116 + 1) = v133[0];
  char v134 = 0;
  *(void *)&long long v115 = v42;
  *((void *)&v115 + 1) = 0x3FF0000000000000;
  LOBYTE(v116[0]) = 0;
  *(_OWORD *)((char *)&v116[1] + 1) = v133[1];
  uint64_t v44 = v82;
  sub_24659D6A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C990);
  sub_246561BA4(&qword_268F8C998, &qword_268F8C990);
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v44, v84);
  v135[12] = v116[11];
  v136[0] = v116[12];
  *(_OWORD *)((char *)v136 + 10) = *(_OWORD *)((char *)&v116[12] + 10);
  v135[8] = v116[7];
  v135[9] = v116[8];
  v135[11] = v116[10];
  v135[10] = v116[9];
  v135[4] = v116[3];
  v135[5] = v116[4];
  v135[7] = v116[6];
  v135[6] = v116[5];
  v135[0] = v115;
  v135[1] = v116[0];
  v135[3] = v116[2];
  v135[2] = v116[1];
  sub_24658FC80((uint64_t)v135);
  uint64_t v45 = v87;
  uint64_t v46 = type metadata accessor for ManagedAppCellContext();
  LOBYTE(v42) = sub_246591AE0(v46);
  uint64_t v47 = v88;
  uint64_t v48 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v45, v43, v15);
  if (v42)
  {
    (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v15);
    uint64_t v49 = 1;
  }
  else
  {
    uint64_t v50 = v77;
    sub_246567B18(v77);
    uint64_t v52 = (uint64_t)v78;
    uint64_t v51 = v79;
    uint64_t v53 = v80;
    (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, *MEMORY[0x263F199E8], v80);
    BOOL v54 = sub_24658FE30(v50, v52);
    uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
    v55(v52, v53);
    v55(v50, v53);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v48);
    if (v54) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = 2;
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v58 = v91;
  uint64_t v57 = v92;
  uint64_t v59 = (uint64_t)v89;
  uint64_t v60 = v104;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v89, v104, v92);
  uint64_t v61 = v59 + *(int *)(v105 + 36);
  *(void *)uint64_t v61 = KeyPath;
  *(void *)(v61 + 8) = v49;
  *(unsigned char *)(v61 + 16) = 0;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
  uint64_t v62 = v106;
  sub_246561C4C(v59, v106, &qword_268F8C910);
  *(void *)&long long v115 = 0x4030000000000000;
  BYTE8(v115) = 0;
  uint64_t v63 = (uint64_t)v97;
  sub_24659D968();
  uint64_t v64 = sub_24659D5E8();
  uint64_t v65 = (uint64_t)v99;
  uint64_t *v99 = v64;
  *(void *)(v65 + 8) = 0;
  *(unsigned char *)(v65 + 16) = 1;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C9A0);
  sub_24658DD3C(v65 + *(int *)(v66 + 44));
  uint64_t v68 = v93;
  uint64_t v67 = v94;
  uint64_t v69 = v90;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 16))(v93, v90, v94);
  *(void *)&long long v115 = v68;
  uint64_t v70 = v62;
  uint64_t v71 = v95;
  sub_246561BE8(v70, v95, &qword_268F8C910);
  *((void *)&v115 + 1) = v71;
  uint64_t v72 = v100;
  sub_246561BE8(v63, v100, &qword_268F8C918);
  *(void *)&v116[0] = v72;
  uint64_t v73 = v102;
  sub_246561BE8(v65, v102, &qword_268F8C920);
  *((void *)&v116[0] + 1) = v73;
  v114[0] = v67;
  v114[1] = v105;
  v114[2] = v96;
  v114[3] = v98;
  uint64_t v110 = v81;
  unint64_t v111 = sub_246590248();
  unint64_t v112 = sub_246590348();
  uint64_t v113 = sub_246561BA4(&qword_268F8C9B8, &qword_268F8C920);
  sub_24658A30C((uint64_t)&v115, 4uLL, (uint64_t)v114);
  sub_246555440(v65, &qword_268F8C920);
  sub_246555440(v63, &qword_268F8C918);
  sub_246555440(v106, &qword_268F8C910);
  uint64_t v74 = v85;
  v85(v69, v67);
  sub_246555440(v73, &qword_268F8C920);
  sub_246555440(v72, &qword_268F8C918);
  sub_246555440(v71, &qword_268F8C910);
  return v74(v68, v67);
}

double sub_24658D468@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AE0(v2))
  {
    type metadata accessor for CompactManagedAppCell();
    sub_24658C774((uint64_t *)&v127);
    uint64_t v3 = *((void *)&v127 + 1);
    long long v4 = v128;
    uint64_t v47 = *((void *)&v128 + 1);
    uint64_t v49 = *((void *)&v127 + 1);
    long long v5 = v129;
    uint64_t v56 = v127;
    long long v6 = v130;
    uint64_t KeyPath = swift_getKeyPath();
    char v50 = sub_24659D7A8();
    __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
    sub_24659D2C8();
    sub_24659D258();
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    sub_24658C208((uint64_t)&v127);
    uint64_t v43 = *((void *)&v127 + 1);
    char v15 = v128;
    uint64_t v45 = v127;
    uint64_t v46 = *((void *)&v128 + 1);
    char v44 = sub_24659D7A8();
    sub_24659D2C8();
    sub_24659D258();
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    *(void *)&v59[0] = v56;
    *((void *)&v59[0] + 1) = v3;
    v59[1] = v4;
    void v59[2] = v5;
    v59[3] = v6;
    *(void *)&long long v60 = KeyPath;
    *((void *)&v60 + 1) = 1;
    LOBYTE(v61) = 0;
    DWORD1(v61) = *(_DWORD *)&v58[3];
    *(_DWORD *)((char *)&v61 + 1) = *(_DWORD *)v58;
    BYTE8(v61) = v50;
    HIDWORD(v61) = *(_DWORD *)&v57[3];
    *(_DWORD *)((char *)&v61 + 9) = *(_DWORD *)v57;
    *(void *)&long long v62 = v8;
    *((void *)&v62 + 1) = v10;
    *(void *)&long long v63 = v12;
    *((void *)&v63 + 1) = v14;
    char v64 = 0;
    LOBYTE(v77) = 0;
    long long v75 = v62;
    long long v76 = v63;
    long long v73 = v60;
    long long v74 = v61;
    long long v71 = v5;
    long long v72 = v6;
    long long v69 = v59[0];
    long long v70 = v4;
    char v68 = v15;
    char v65 = 0;
    sub_246590400((uint64_t *)v59);
    sub_246558E8C(v45, v43, v15);
    swift_bridgeObjectRetain();
    sub_246561068(v56, v49, v4, v47);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_246558E8C(v45, v43, v15);
    swift_bridgeObjectRetain();
    sub_24655947C(v45, v43, v15);
    swift_bridgeObjectRelease();
    v78[0] = v56;
    v78[1] = v49;
    v78[2] = v4;
    v78[3] = v47;
    long long v79 = v5;
    long long v80 = v6;
    uint64_t v81 = KeyPath;
    uint64_t v82 = 1;
    char v83 = 0;
    *(_DWORD *)uint64_t v84 = *(_DWORD *)v58;
    *(_DWORD *)&v84[3] = *(_DWORD *)&v58[3];
    char v85 = v50;
    *(_DWORD *)uint64_t v86 = *(_DWORD *)v57;
    *(_DWORD *)&v86[3] = *(_DWORD *)&v57[3];
    uint64_t v87 = v8;
    uint64_t v88 = v10;
    uint64_t v89 = v12;
    uint64_t v90 = v14;
    char v91 = 0;
    sub_246590474(v78);
    long long v112 = v75;
    long long v113 = v76;
    long long v108 = v71;
    long long v109 = v72;
    long long v110 = v73;
    long long v111 = v74;
    long long v106 = v69;
    long long v107 = v70;
    uint64_t v114 = v77;
    uint64_t v115 = v45;
    uint64_t v116 = v43;
    char v117 = v15;
    *(_DWORD *)uint64_t v118 = v67[0];
    *(_DWORD *)&v118[3] = *(_DWORD *)((char *)v67 + 3);
    uint64_t v119 = v46;
    char v120 = v44;
    *(_DWORD *)uint64_t v121 = v66[0];
    *(_DWORD *)&v121[3] = *(_DWORD *)((char *)v66 + 3);
    uint64_t v122 = v17;
    uint64_t v123 = v19;
    uint64_t v124 = v21;
    uint64_t v125 = v23;
    char v126 = 0;
    sub_2465904E8((uint64_t)&v106);
    sub_246561C4C((uint64_t)&v106, (uint64_t)&v127, &qword_268F8C9C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C9D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C9D8);
    sub_246561BA4(&qword_268F8C9E0, &qword_268F8C9D0);
    sub_246561BA4(qword_268F8C9E8, &qword_268F8C9D8);
    sub_24659D618();
    sub_24655947C(v45, v43, v15);
    swift_bridgeObjectRelease();
    sub_246560F80(v56, v49, v4, v47);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    type metadata accessor for CompactManagedAppCell();
    sub_24658C208((uint64_t)&v127);
    long long v24 = v127;
    char v25 = v128;
    uint64_t v55 = *((void *)&v128 + 1);
    char v52 = sub_24659D7A8();
    __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
    sub_24659D2C8();
    sub_24659D258();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    sub_24658C38C((uint64_t)&v127);
    long long v34 = v127;
    long long v35 = v128;
    int v51 = v129;
    uint64_t v53 = *((void *)&v129 + 1);
    uint64_t v48 = v130;
    LOBYTE(v67[0]) = v25;
    LOBYTE(v66[0]) = 0;
    sub_246558E8C(v24, *((uint64_t *)&v24 + 1), v25);
    swift_bridgeObjectRetain();
    sub_246561068(v34, *((uint64_t *)&v34 + 1), v35, *((uint64_t *)&v35 + 1));
    swift_retain();
    swift_retain();
    sub_246558E8C(v24, *((uint64_t *)&v24 + 1), v25);
    swift_bridgeObjectRetain();
    sub_246561068(v34, *((uint64_t *)&v34 + 1), v35, *((uint64_t *)&v35 + 1));
    swift_retain();
    swift_retain();
    sub_246560F80(v34, *((uint64_t *)&v34 + 1), v35, *((uint64_t *)&v35 + 1));
    swift_release();
    swift_release();
    sub_24655947C(v24, *((uint64_t *)&v24 + 1), v25);
    swift_bridgeObjectRelease();
    long long v106 = v24;
    LOBYTE(v107) = v25;
    *(_DWORD *)((char *)&v107 + 1) = v69;
    DWORD1(v107) = *(_DWORD *)((char *)&v69 + 3);
    *((void *)&v107 + 1) = v55;
    LOBYTE(v108) = v52;
    *(_DWORD *)((char *)&v108 + 1) = v78[0];
    DWORD1(v108) = *(_DWORD *)((char *)v78 + 3);
    *((void *)&v108 + 1) = v27;
    *(void *)&long long v109 = v29;
    *((void *)&v109 + 1) = v31;
    *(void *)&long long v110 = v33;
    BYTE8(v110) = 0;
    *(_DWORD *)((char *)&v110 + 9) = v59[0];
    HIDWORD(v110) = *(_DWORD *)((char *)v59 + 3);
    long long v111 = v34;
    long long v112 = v35;
    LODWORD(v113) = v51;
    *((void *)&v113 + 1) = v53;
    uint64_t v114 = v48;
    sub_2465903F4((uint64_t)&v106);
    sub_246561C4C((uint64_t)&v106, (uint64_t)&v127, &qword_268F8C9C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C9D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C9D8);
    sub_246561BA4(&qword_268F8C9E0, &qword_268F8C9D0);
    sub_246561BA4(qword_268F8C9E8, &qword_268F8C9D8);
    sub_24659D618();
    sub_246560F80(v34, *((uint64_t *)&v34 + 1), v35, *((uint64_t *)&v35 + 1));
    swift_release();
    swift_release();
    sub_24655947C(v24, *((uint64_t *)&v24 + 1), v25);
    swift_bridgeObjectRelease();
  }
  long long v137 = v104;
  __int16 v138 = v105;
  long long v133 = v98;
  long long v134 = v99;
  long long v135 = v100;
  long long v136 = v101;
  long long v129 = v94;
  long long v130 = v95;
  long long v131 = v96;
  long long v132 = v97;
  long long v127 = v92;
  long long v128 = v93;
  long long v36 = v103;
  *(_OWORD *)(a1 + 160) = v102;
  *(_OWORD *)(a1 + 176) = v36;
  *(_OWORD *)(a1 + 192) = v137;
  *(_WORD *)(a1 + 208) = v138;
  long long v37 = v134;
  *(_OWORD *)(a1 + 96) = v133;
  *(_OWORD *)(a1 + 112) = v37;
  long long v38 = v136;
  *(_OWORD *)(a1 + 128) = v135;
  *(_OWORD *)(a1 + 144) = v38;
  long long v39 = v130;
  *(_OWORD *)(a1 + 32) = v129;
  *(_OWORD *)(a1 + 48) = v39;
  long long v40 = v132;
  *(_OWORD *)(a1 + 64) = v131;
  *(_OWORD *)(a1 + 80) = v40;
  double result = *(double *)&v127;
  long long v42 = v128;
  *(_OWORD *)a1 = v127;
  *(_OWORD *)(a1 + 16) = v42;
  return result;
}

uint64_t sub_24658DD3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v1 = type metadata accessor for OfferView();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF00);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  type metadata accessor for CompactManagedAppCell();
  sub_24655E9E0((uint64_t)v3);
  sub_2465615B4((uint64_t)v3, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for OfferView);
  *(void *)&v8[*(int *)(v5 + 44)] = 0x3FF0000000000000;
  sub_246561554((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for OfferView);
  sub_246561C4C((uint64_t)v8, (uint64_t)v10, &qword_268F8BF00);
  uint64_t v11 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AF8(v11))
  {
    sub_24658C420((uint64_t)v18);
    _OWORD v20[10] = v18[10];
    v20[11] = v18[11];
    char v21 = v19;
    v20[6] = v18[6];
    v20[7] = v18[7];
    v20[8] = v18[8];
    v20[9] = v18[9];
    v20[2] = v18[2];
    v20[3] = v18[3];
    v20[4] = v18[4];
    v20[5] = v18[5];
    v20[0] = v18[0];
    v20[1] = v18[1];
    nullsub_1(v20);
  }
  else
  {
    sub_246560FC4((uint64_t)v20);
  }
  sub_246561C4C((uint64_t)v20, (uint64_t)v22, &qword_268F8C930);
  sub_246561BE8((uint64_t)v10, (uint64_t)v8, &qword_268F8BF00);
  sub_246561C4C((uint64_t)v22, (uint64_t)v17, &qword_268F8C930);
  uint64_t v12 = v16;
  sub_246561BE8((uint64_t)v8, v16, &qword_268F8BF00);
  uint64_t v13 = v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8C9C0) + 48);
  sub_246561C4C((uint64_t)v17, (uint64_t)v18, &qword_268F8C930);
  sub_246561C4C((uint64_t)v18, v13, &qword_268F8C930);
  sub_24658F8E8((uint64_t)v18, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658F63C);
  sub_246555440((uint64_t)v10, &qword_268F8BF00);
  sub_246561C4C((uint64_t)v17, (uint64_t)v20, &qword_268F8C930);
  sub_24658F8E8((uint64_t)v20, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658F964);
  return sub_246555440((uint64_t)v8, &qword_268F8BF00);
}

uint64_t sub_24658E010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v34 = a4;
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D758();
  sub_24659D3E8();
  sub_24659D3E8();
  uint64_t v45 = sub_24659D3E8();
  uint64_t v46 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C928);
  uint64_t v47 = type metadata accessor for OfferView();
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C930);
  swift_getTupleTypeMetadata();
  sub_24659DC28();
  v28[1] = swift_getWitnessTable();
  uint64_t v6 = sub_24659DB98();
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v28 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD90);
  uint64_t v9 = sub_24659D3E8();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v31 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v28 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v29 = (char *)v28 - v15;
  sub_24659D5F8();
  uint64_t v16 = a3;
  type metadata accessor for CompactManagedAppCell();
  uint64_t v17 = v33;
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  uint64_t v35 = a2;
  uint64_t v36 = v16;
  uint64_t v37 = v17;
  sub_24659DB88();
  uint64_t v18 = type metadata accessor for ManagedAppCellContext();
  sub_246591AE0(v18);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24659D9F8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  uint64_t v20 = sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
  uint64_t v43 = WitnessTable;
  uint64_t v44 = v20;
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = v29;
  sub_246598AFC(v14, v9, v21);
  uint64_t v23 = v32;
  long long v24 = *(void (**)(char *, uint64_t))(v32 + 8);
  v24(v14, v9);
  char v25 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  uint64_t v26 = v31;
  v25(v31, v22, v9);
  uint64_t v41 = 0;
  char v42 = 0;
  uint64_t v45 = (uint64_t)v26;
  uint64_t v46 = &v41;
  v40[0] = v9;
  v40[1] = MEMORY[0x263F1B6B0];
  uint64_t v38 = v21;
  uint64_t v39 = MEMORY[0x263F1B698];
  sub_24658A30C((uint64_t)&v45, 2uLL, (uint64_t)v40);
  v24(v22, v9);
  return ((uint64_t (*)(char *, uint64_t))v24)(v26, v9);
}

uint64_t sub_24658E4EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v65 = a4;
  uint64_t v64 = type metadata accessor for OfferView();
  uint64_t v6 = MEMORY[0x270FA5388](v64);
  uint64_t v66 = (uint64_t)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v70 = (uint64_t)&v48 - v8;
  uint64_t v63 = sub_24659D6C8();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v56 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C928);
  uint64_t v60 = *(void *)(v62 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v62);
  long long v72 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v55 = (char *)&v48 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v57 = (char *)&v48 - v14;
  uint64_t v50 = a2;
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD68);
  sub_24659D3E8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8BD70);
  sub_24659D3E8();
  sub_24659D628();
  sub_24659D758();
  uint64_t v59 = sub_24659D3E8();
  uint64_t v71 = sub_24659D3E8();
  uint64_t v15 = sub_24659D3E8();
  uint64_t v69 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v48 - v19;
  uint64_t v49 = type metadata accessor for CompactManagedAppCell();
  sub_24658B4A0(v49, (uint64_t)v18);
  v83[49] = a3;
  v83[50] = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v22 = sub_246561BA4(&qword_268F8BDB0, &qword_268F8BD68);
  v83[47] = WitnessTable;
  v83[48] = v22;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = sub_246561BA4(&qword_268F8BDB8, &qword_268F8BD70);
  v83[45] = v23;
  v83[46] = v24;
  v83[43] = swift_getWitnessTable();
  v83[44] = WitnessTable;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
  v83[41] = v25;
  v83[42] = v26;
  uint64_t v27 = swift_getWitnessTable();
  unint64_t v28 = sub_246560E3C();
  v83[39] = v27;
  v83[40] = v28;
  v83[37] = swift_getWitnessTable();
  v83[38] = MEMORY[0x263F18C10];
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v71 = (uint64_t)v20;
  uint64_t v53 = v29;
  sub_246598AFC(v18, v15, v29);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t))(v69 + 8);
  uint64_t v67 = v18;
  uint64_t v54 = v15;
  uint64_t v58 = v30;
  uint64_t v59 = v69 + 8;
  v30(v18, v15);
  uint64_t v31 = sub_24659D5F8();
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  uint64_t v32 = v86[0];
  sub_24658EE6C(v84);
  v85[280] = 0;
  memcpy(&v85[7], v84, 0x110uLL);
  v83[0] = v31;
  v83[1] = v32;
  LOBYTE(v83[2]) = 0;
  memcpy((char *)&v83[2] + 1, v85, 0x117uLL);
  uint64_t v33 = v56;
  sub_24659D6A8();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C938);
  uint64_t v51 = sub_246561BA4(&qword_268F8C940, &qword_268F8C938);
  uint64_t v52 = v34;
  sub_24659D978();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v63);
  memcpy(v86, v83, 0x128uLL);
  sub_24658F4DC((uint64_t)v86);
  uint64_t v35 = v60;
  uint64_t v36 = v57;
  uint64_t v37 = v62;
  (*(void (**)(void))(v60 + 32))();
  sub_24655E9E0(v70);
  uint64_t v38 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AF8(v38))
  {
    sub_24658C420((uint64_t)v78);
    v81[10] = v78[10];
    v81[11] = v78[11];
    char v82 = v79;
    v81[6] = v78[6];
    v81[7] = v78[7];
    v81[8] = v78[8];
    v81[9] = v78[9];
    v81[2] = v78[2];
    v81[3] = v78[3];
    v81[4] = v78[4];
    v81[5] = v78[5];
    v81[0] = v78[0];
    v81[1] = v78[1];
    nullsub_1(v81);
  }
  else
  {
    sub_246560FC4((uint64_t)v81);
  }
  sub_246561C4C((uint64_t)v81, (uint64_t)v83, &qword_268F8C930);
  uint64_t v39 = v67;
  uint64_t v40 = v54;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v67, v71, v54);
  v80[0] = v39;
  uint64_t v41 = v72;
  uint64_t v42 = v37;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v72, v36, v37);
  v80[1] = v41;
  uint64_t v43 = v70;
  uint64_t v44 = v66;
  sub_2465615B4(v70, v66, (uint64_t (*)(void))type metadata accessor for OfferView);
  v80[2] = v44;
  sub_246561C4C((uint64_t)v83, (uint64_t)v78, &qword_268F8C930);
  v80[3] = v78;
  sub_24658F8E8((uint64_t)v83, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658F63C);
  v77[0] = v40;
  v77[1] = v42;
  v77[2] = v64;
  v77[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C930);
  uint64_t v73 = v53;
  *(void *)&v81[0] = v52;
  *((void *)&v81[0] + 1) = v51;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v75 = sub_24656150C(&qword_268F8BDD0, (void (*)(uint64_t))type metadata accessor for OfferView);
  unint64_t v76 = sub_24658F6B8();
  sub_24658A30C((uint64_t)v80, 4uLL, (uint64_t)v77);
  sub_24658F8E8((uint64_t)v83, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658F964);
  sub_246561554(v43, (uint64_t (*)(void))type metadata accessor for OfferView);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v35 + 8);
  v45(v36, v42);
  uint64_t v46 = v58;
  v58((char *)v71, v40);
  sub_246561C4C((uint64_t)v78, (uint64_t)v81, &qword_268F8C930);
  sub_24658F8E8((uint64_t)v81, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658F964);
  sub_246561554(v44, (uint64_t (*)(void))type metadata accessor for OfferView);
  v45(v72, v42);
  return v46(v67, v40);
}

uint64_t sub_24658EE6C@<X0>(void *a1@<X8>)
{
  uint64_t v1 = type metadata accessor for ManagedAppCellContext();
  if (sub_246591AE0(v1))
  {
    type metadata accessor for CompactManagedAppCell();
    sub_24658C774((uint64_t *)__src);
    long long v26 = __src[1];
    long long v28 = __src[0];
    long long v24 = __src[2];
    long long v2 = __src[3];
    uint64_t KeyPath = swift_getKeyPath();
    char v4 = sub_24659D7A8();
    __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
    sub_24659D2C8();
    sub_24659D258();
    v31[0] = 0;
    __src[0] = v28;
    __src[1] = v26;
    void __src[2] = v24;
    __src[3] = v2;
    *(void *)&__src[4] = KeyPath;
    *((void *)&__src[4] + 1) = 1;
    LOBYTE(__src[5]) = 0;
    DWORD1(__src[5]) = *(_DWORD *)((char *)v34 + 3);
    *(_DWORD *)((char *)&__src[5] + 1) = v34[0];
    BYTE8(__src[5]) = v4;
    HIDWORD(__src[5]) = *(_DWORD *)&v32[3];
    *(_DWORD *)((char *)&__src[5] + 9) = *(_DWORD *)v32;
    *(void *)&__src[6] = v5;
    *((void *)&__src[6] + 1) = v6;
    *(void *)&__src[7] = v7;
    *((void *)&__src[7] + 1) = v8;
    LOBYTE(__src[8]) = 0;
    nullsub_1(__src);
    sub_246561C4C((uint64_t)__src, (uint64_t)v35, &qword_268F8C980);
  }
  else
  {
    sub_24658FB60((uint64_t)__src);
    sub_246561C4C((uint64_t)__src, (uint64_t)v35, &qword_268F8C980);
    type metadata accessor for CompactManagedAppCell();
  }
  sub_24658C208((uint64_t)__src);
  long long v9 = __src[0];
  char v10 = __src[1];
  uint64_t v11 = *((void *)&__src[1] + 1);
  char v29 = sub_24659D7A8();
  __swift_instantiateConcreteTypeFromMangledName(qword_268F8BCB0);
  sub_24659D2C8();
  sub_24659D258();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  sub_24658C38C((uint64_t)__src);
  long long v20 = __src[0];
  long long v21 = __src[1];
  int v27 = __src[2];
  uint64_t v22 = *(void *)&__src[3];
  uint64_t v25 = *((void *)&__src[2] + 1);
  sub_246561C4C((uint64_t)v35, (uint64_t)v31, &qword_268F8C980);
  sub_246561C4C((uint64_t)v31, (uint64_t)v32, &qword_268F8C980);
  sub_246561C4C((uint64_t)v32, (uint64_t)__src, &qword_268F8C980);
  *(_OWORD *)((char *)&__src[8] + 8) = v9;
  BYTE8(__src[9]) = v10;
  *(void *)&__src[10] = v11;
  BYTE8(__src[10]) = v29;
  *(void *)&__src[11] = v13;
  *((void *)&__src[11] + 1) = v15;
  *(void *)&__src[12] = v17;
  *((void *)&__src[12] + 1) = v19;
  LOBYTE(__src[13]) = 0;
  *(_OWORD *)((char *)&__src[13] + 8) = v20;
  *(_OWORD *)((char *)&__src[14] + 8) = v21;
  DWORD2(__src[15]) = v27;
  *(void *)&__src[16] = v25;
  *((void *)&__src[16] + 1) = v22;
  memcpy(a1, __src, 0x110uLL);
  sub_24658FBFC((uint64_t)v32, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658FB7C);
  sub_246558E8C(v9, *((uint64_t *)&v9 + 1), v10);
  swift_bridgeObjectRetain();
  sub_246561068(v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1));
  swift_retain();
  swift_retain();
  sub_246560F80(v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1));
  swift_release();
  swift_release();
  sub_24655947C(v9, *((uint64_t *)&v9 + 1), v10);
  swift_bridgeObjectRelease();
  sub_246561C4C((uint64_t)v31, (uint64_t)v34, &qword_268F8C980);
  return sub_24658FBFC((uint64_t)v34, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24658F5BC);
}

uint64_t sub_24658F1EC@<X0>(uint64_t *a1@<X8>)
{
  return sub_246560C0C(&qword_268F8BF30, a1);
}

uint64_t sub_24658F200@<X0>(uint64_t *a1@<X8>)
{
  return sub_246560C0C(&qword_268F8BF28, a1);
}

uint64_t sub_24658F214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for ManagedAppCellContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  uint64_t v13 = (int *)type metadata accessor for CompactManagedAppCell();
  uint64_t v14 = a6 + v13[9];
  *(void *)uint64_t v14 = a2;
  *(unsigned char *)(v14 + 8) = a3 & 1;
  sub_246561C4C(a4, a6 + v13[10], &qword_268F8BF10);
  sub_246561C4C(a5, a6 + v13[11], &qword_268F8BF18);
  uint64_t v15 = (uint64_t *)(a6 + v13[12]);
  *uint64_t v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF20);
  swift_storeEnumTagMultiPayload();
  sub_24655C3B8();
  sub_24659D2B8();
  return sub_24659D2B8();
}

uint64_t sub_24658F398@<X0>(uint64_t a1@<X8>)
{
  return sub_24658E010(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_24658F3A4@<X0>(uint64_t a1@<X8>)
{
  return sub_24658E4EC(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_24658F3B0()
{
  return sub_24659D538();
}

uint64_t sub_24658F3F0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BD48);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_246561BE8(a1, (uint64_t)&v9 - v6, &qword_268F8BD48);
  sub_246561BE8((uint64_t)v7, (uint64_t)v5, &qword_268F8BD48);
  sub_246586334();
  sub_24659D548();
  return sub_246555440((uint64_t)v7, &qword_268F8BD48);
}

uint64_t sub_24658F4DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 168);
  char v4 = *(unsigned char *)(a1 + 176);
  uint64_t v5 = *(void *)(a1 + 240);
  uint64_t v6 = *(void *)(a1 + 248);
  uint64_t v7 = *(void *)(a1 + 256);
  uint64_t v8 = *(void *)(a1 + 264);
  sub_24658F5BC(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  sub_24655947C(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_246560F80(v5, v6, v7, v8);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_24658F5BC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246560F80(result, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24658F63C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246561068(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_24658F6B8()
{
  unint64_t result = qword_268F8C948;
  if (!qword_268F8C948)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C930);
    sub_24658F72C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C948);
  }
  return result;
}

unint64_t sub_24658F72C()
{
  unint64_t result = qword_268F8C950;
  if (!qword_268F8C950)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C958);
    sub_24658F7CC();
    sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C950);
  }
  return result;
}

unint64_t sub_24658F7CC()
{
  unint64_t result = qword_268F8C960;
  if (!qword_268F8C960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C968);
    sub_24658F86C();
    sub_246561BA4(&qword_268F8BE40, &qword_268F8BE48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C960);
  }
  return result;
}

unint64_t sub_24658F86C()
{
  unint64_t result = qword_268F8C970;
  if (!qword_268F8C970)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C978);
    sub_2465612DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C970);
  }
  return result;
}

uint64_t sub_24658F8E8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 192);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    v4);
  return a1;
}

uint64_t sub_24658F964(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246560F80(result, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24658F9E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659D478();
  *a1 = result;
  return result;
}

uint64_t sub_24658FA14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24659D478();
  *a1 = result;
  return result;
}

uint64_t sub_24658FA40()
{
  return sub_24659D488();
}

uint64_t sub_24658FA6C()
{
  return sub_24659D488();
}

uint64_t sub_24658FA98@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24659D4D8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24658FACC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24659D4D8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24658FB00()
{
  return sub_24659D4E8();
}

uint64_t sub_24658FB30()
{
  return sub_24659D4E8();
}

double sub_24658FB60(uint64_t a1)
{
  *(unsigned char *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_24658FB7C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_246561068(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_24658FBFC(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 128);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), v4);
  return a1;
}

uint64_t sub_24658FC68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24658BA58(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_24658FC74@<X0>(uint64_t a1@<X8>)
{
  return sub_24658C818(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_24658FC80(uint64_t a1)
{
  sub_24658FD0C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(_OWORD *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(unsigned char *)(a1 + 232),
    *(unsigned char *)(a1 + 233));
  return a1;
}

uint64_t sub_24658FD0C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,char a28)
{
  if (a28)
  {
    sub_24655947C(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    sub_246560F80(a11, a12, a13, a14);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_246560F80(a1, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_24655947C(a18, a19, a20 & 1);
    return swift_bridgeObjectRelease();
  }
}

BOOL sub_24658FE30(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v3 = sub_24659D5D8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - v8;
  char v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a2, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = *MEMORY[0x263F199C0];
  if (v12 != *MEMORY[0x263F199C0])
  {
    if (v12 == *MEMORY[0x263F199F0])
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199F8])
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199E8]) {
      goto LABEL_7;
    }
    if (v12 == *MEMORY[0x263F199B8])
    {
      unint64_t v13 = 4;
    }
    else if (v12 == *MEMORY[0x263F199C8])
    {
      unint64_t v13 = 5;
    }
    else if (v12 == *MEMORY[0x263F199A0])
    {
      unint64_t v13 = 6;
    }
    else if (v12 == *MEMORY[0x263F199D8])
    {
      unint64_t v13 = 7;
    }
    else if (v12 == *MEMORY[0x263F199D0])
    {
      unint64_t v13 = 8;
    }
    else if (v12 == *MEMORY[0x263F199E0])
    {
      unint64_t v13 = 9;
    }
    else if (v12 == *MEMORY[0x263F199A8])
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != *MEMORY[0x263F199B0])
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == *MEMORY[0x263F199F0])
  {
    unint64_t v16 = 1;
  }
  else if (v15 == *MEMORY[0x263F199F8])
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != *MEMORY[0x263F199E8])
    {
      if (v15 == *MEMORY[0x263F199B8])
      {
        unint64_t v16 = 4;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199C8])
      {
        unint64_t v16 = 5;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199A0])
      {
        unint64_t v16 = 6;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199D8])
      {
        unint64_t v16 = 7;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199D0])
      {
        unint64_t v16 = 8;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199E0])
      {
        unint64_t v16 = 9;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199A8])
      {
        unint64_t v16 = 10;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199B0])
      {
        unint64_t v16 = 11;
        return v13 < v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 < v16;
}

unint64_t sub_246590248()
{
  unint64_t result = qword_268F8C9A8;
  if (!qword_268F8C9A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C910);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C990);
    sub_246561BA4(&qword_268F8C998, &qword_268F8C990);
    swift_getOpaqueTypeConformance2();
    sub_246561BA4(&qword_268F8BD98, &qword_268F8BD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C9A8);
  }
  return result;
}

unint64_t sub_246590348()
{
  unint64_t result = qword_268F8C9B0;
  if (!qword_268F8C9B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8C918);
    sub_24656150C(&qword_268F8BDA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8C9B0);
  }
  return result;
}

uint64_t sub_2465903F4(uint64_t result)
{
  *(unsigned char *)(result + 209) = 1;
  return result;
}

uint64_t *sub_246590400(uint64_t *a1)
{
  return a1;
}

uint64_t *sub_246590474(uint64_t *a1)
{
  return a1;
}

uint64_t sub_2465904E8(uint64_t result)
{
  *(unsigned char *)(result + 209) = 0;
  return result;
}

uint64_t sub_2465904F8()
{
  return sub_24659D538();
}

uint64_t sub_24659053C()
{
  return sub_24659D418();
}

uint64_t sub_246590564()
{
  return swift_getWitnessTable();
}

uint64_t sub_246590928()
{
  uint64_t v0 = sub_24659D0C8();
  __swift_allocate_value_buffer(v0, qword_268F8EDD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268F8EDD0);
  return sub_24659D0B8();
}

uint64_t sub_246590994()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246590A54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)(v11 + 8);
    char v14 = *(unsigned char *)(v11 + 16);
    sub_246558E8C(*(void *)v11, v13, v14);
    *(void *)unint64_t v10 = v12;
    *(void *)(v10 + 8) = v13;
    *(unsigned char *)(v10 + 16) = v14;
    *(void *)(v10 + 24) = *(void *)(v11 + 24);
    unint64_t v15 = (v10 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v16 = (v11 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v17 = *(void *)(v16 + 24);
    swift_bridgeObjectRetain();
    if (v17 < 0xFFFFFFFF)
    {
      long long v21 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v21;
    }
    else
    {
      uint64_t v18 = *(void *)v16;
      uint64_t v19 = *(void *)(v16 + 8);
      char v20 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v19, v20);
      *(void *)unint64_t v15 = v18;
      *(void *)(v15 + 8) = v19;
      *(unsigned char *)(v15 + 16) = v20;
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v22 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v23 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v23 + 24) < 0xFFFFFFFFuLL)
    {
      long long v27 = *(_OWORD *)(v23 + 16);
      *(_OWORD *)unint64_t v22 = *(_OWORD *)v23;
      *(_OWORD *)(v22 + 16) = v27;
    }
    else
    {
      uint64_t v24 = *(void *)v23;
      uint64_t v25 = *(void *)(v23 + 8);
      char v26 = *(unsigned char *)(v23 + 16);
      sub_246558E8C(*(void *)v23, v25, v26);
      *(void *)unint64_t v22 = v24;
      *(void *)(v22 + 8) = v25;
      *(unsigned char *)(v22 + 16) = v26;
      *(void *)(v22 + 24) = *(void *)(v23 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v28 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v29 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v29 + 24) < 0xFFFFFFFFuLL)
    {
      long long v33 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)unint64_t v28 = *(_OWORD *)v29;
      *(_OWORD *)(v28 + 16) = v33;
    }
    else
    {
      uint64_t v30 = *(void *)v29;
      uint64_t v31 = *(void *)(v29 + 8);
      char v32 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v31, v32);
      *(void *)unint64_t v28 = v30;
      *(void *)(v28 + 8) = v31;
      *(unsigned char *)(v28 + 16) = v32;
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v34 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v35 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v36 = *(void *)v35;
    uint64_t v37 = *(void *)(v35 + 8);
    char v38 = *(unsigned char *)(v35 + 16);
    sub_246558E9C(*(void *)v35, v37, v38);
    *(void *)unint64_t v34 = v36;
    *(void *)(v34 + 8) = v37;
    *(unsigned char *)(v34 + 16) = v38;
    uint64_t v39 = (void *)((v28 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v40 = (void *)((v29 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v41 = v40[1];
    *uint64_t v39 = *v40;
    v39[1] = v41;
  }
  swift_retain();
  return v4;
}

uint64_t sub_246590CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24655947C(*(void *)v4, *(void *)(v4 + 8), *(unsigned char *)(v4 + 16));
  swift_bridgeObjectRelease();
  unint64_t v5 = (v4 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v5 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v5, *(void *)(v5 + 8), *(unsigned char *)(v5 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  unint64_t v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v7, *(void *)(v7 + 8), *(unsigned char *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  sub_246550978(*(void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));

  return swift_release();
}

uint64_t sub_246590E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  unint64_t v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = *(void *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    long long v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    uint64_t v15 = *(void *)v13;
    uint64_t v16 = *(void *)(v13 + 8);
    char v17 = *(unsigned char *)(v13 + 16);
    sub_246558E8C(*(void *)v13, v16, v17);
    *(void *)unint64_t v12 = v15;
    *(void *)(v12 + 8) = v16;
    *(unsigned char *)(v12 + 16) = v17;
    *(void *)(v12 + 24) = *(void *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    long long v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    uint64_t v21 = *(void *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    char v23 = *(unsigned char *)(v20 + 16);
    sub_246558E8C(*(void *)v20, v22, v23);
    *(void *)unint64_t v19 = v21;
    *(void *)(v19 + 8) = v22;
    *(unsigned char *)(v19 + 16) = v23;
    *(void *)(v19 + 24) = *(void *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    long long v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)unint64_t v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    uint64_t v27 = *(void *)v26;
    uint64_t v28 = *(void *)(v26 + 8);
    char v29 = *(unsigned char *)(v26 + 16);
    sub_246558E8C(*(void *)v26, v28, v29);
    *(void *)unint64_t v25 = v27;
    *(void *)(v25 + 8) = v28;
    *(unsigned char *)(v25 + 16) = v29;
    *(void *)(v25 + 24) = *(void *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  uint64_t v34 = *(void *)(v32 + 8);
  char v35 = *(unsigned char *)(v32 + 16);
  sub_246558E9C(*(void *)v32, v34, v35);
  *(void *)unint64_t v31 = v33;
  *(void *)(v31 + 8) = v34;
  *(unsigned char *)(v31 + 16) = v35;
  uint64_t v36 = (void *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v37 = (void *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v38 = v37[1];
  void *v36 = *v37;
  v36[1] = v38;
  swift_retain();
  return a1;
}

uint64_t sub_246591018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  sub_246558E8C(*(void *)v8, v10, v11);
  uint64_t v12 = *(void *)v7;
  uint64_t v13 = *(void *)(v7 + 8);
  char v14 = *(unsigned char *)(v7 + 16);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  sub_24655947C(v12, v13, v14);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = *(void *)(v16 + 24);
  if (*(void *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v24 = *(void *)v16;
      uint64_t v25 = *(void *)(v16 + 8);
      char v26 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v25, v26);
      *(void *)unint64_t v15 = v24;
      *(void *)(v15 + 8) = v25;
      *(unsigned char *)(v15 + 16) = v26;
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      uint64_t v18 = *(void *)v16;
      uint64_t v19 = *(void *)(v16 + 8);
      char v20 = *(unsigned char *)(v16 + 16);
      sub_246558E8C(*(void *)v16, v19, v20);
      uint64_t v21 = *(void *)v15;
      uint64_t v22 = *(void *)(v15 + 8);
      char v23 = *(unsigned char *)(v15 + 16);
      *(void *)unint64_t v15 = v18;
      *(void *)(v15 + 8) = v19;
      *(unsigned char *)(v15 + 16) = v20;
      sub_24655947C(v21, v22, v23);
      *(void *)(v15 + 24) = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_24655947C(*(void *)v15, *(void *)(v15 + 8), *(unsigned char *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  long long v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  unint64_t v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = *(void *)(v29 + 24);
  if (*(void *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v37 = *(void *)v29;
      uint64_t v38 = *(void *)(v29 + 8);
      char v39 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v38, v39);
      *(void *)unint64_t v28 = v37;
      *(void *)(v28 + 8) = v38;
      *(unsigned char *)(v28 + 16) = v39;
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      uint64_t v31 = *(void *)v29;
      uint64_t v32 = *(void *)(v29 + 8);
      char v33 = *(unsigned char *)(v29 + 16);
      sub_246558E8C(*(void *)v29, v32, v33);
      uint64_t v34 = *(void *)v28;
      uint64_t v35 = *(void *)(v28 + 8);
      char v36 = *(unsigned char *)(v28 + 16);
      *(void *)unint64_t v28 = v31;
      *(void *)(v28 + 8) = v32;
      *(unsigned char *)(v28 + 16) = v33;
      sub_24655947C(v34, v35, v36);
      *(void *)(v28 + 24) = *(void *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_24655947C(*(void *)v28, *(void *)(v28 + 8), *(unsigned char *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  long long v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)unint64_t v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  unint64_t v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = *(void *)(v42 + 24);
  if (*(void *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      uint64_t v50 = *(void *)v42;
      uint64_t v51 = *(void *)(v42 + 8);
      char v52 = *(unsigned char *)(v42 + 16);
      sub_246558E8C(*(void *)v42, v51, v52);
      *(void *)unint64_t v41 = v50;
      *(void *)(v41 + 8) = v51;
      *(unsigned char *)(v41 + 16) = v52;
      *(void *)(v41 + 24) = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
LABEL_21:
    long long v53 = *(_OWORD *)(v42 + 16);
    *(_OWORD *)unint64_t v41 = *(_OWORD *)v42;
    *(_OWORD *)(v41 + 16) = v53;
    goto LABEL_22;
  }
  if (v43 < 0xFFFFFFFF)
  {
    sub_24655947C(*(void *)v41, *(void *)(v41 + 8), *(unsigned char *)(v41 + 16));
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v44 = *(void *)v42;
  uint64_t v45 = *(void *)(v42 + 8);
  char v46 = *(unsigned char *)(v42 + 16);
  sub_246558E8C(*(void *)v42, v45, v46);
  uint64_t v47 = *(void *)v41;
  uint64_t v48 = *(void *)(v41 + 8);
  char v49 = *(unsigned char *)(v41 + 16);
  *(void *)unint64_t v41 = v44;
  *(void *)(v41 + 8) = v45;
  *(unsigned char *)(v41 + 16) = v46;
  sub_24655947C(v47, v48, v49);
  *(void *)(v41 + 24) = *(void *)(v42 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_22:
  unint64_t v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v56 = *(void *)v55;
  uint64_t v57 = *(void *)(v55 + 8);
  char v58 = *(unsigned char *)(v55 + 16);
  sub_246558E9C(*(void *)v55, v57, v58);
  uint64_t v59 = *(void *)v54;
  uint64_t v60 = *(void *)(v54 + 8);
  *(void *)unint64_t v54 = v56;
  *(void *)(v54 + 8) = v57;
  char v61 = *(unsigned char *)(v54 + 16);
  *(unsigned char *)(v54 + 16) = v58;
  sub_246550978(v59, v60, v61);
  uint64_t v62 = (void *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v63 = (void *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v64 = v63[1];
  *uint64_t v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2465913B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  char v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  unint64_t v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v18 = v17[1];
  *unint64_t v16 = *v17;
  v16[1] = v18;
  unint64_t v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v21 = *(unsigned char *)(v20 + 16);
  *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  *(unsigned char *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2465914B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v6) = *(unsigned char *)(v8 + 16);
  uint64_t v9 = *(void *)v7;
  uint64_t v10 = *(void *)(v7 + 8);
  char v11 = *(unsigned char *)(v7 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = v6;
  sub_24655947C(v9, v10, v11);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRelease();
  unint64_t v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v12 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v13 + 24) >= 0xFFFFFFFFuLL)
    {
      char v14 = *(unsigned char *)(v13 + 16);
      uint64_t v15 = *(void *)v12;
      uint64_t v16 = *(void *)(v12 + 8);
      char v17 = *(unsigned char *)(v12 + 16);
      *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
      *(unsigned char *)(v12 + 16) = v14;
      sub_24655947C(v15, v16, v17);
      *(void *)(v12 + 24) = *(void *)(v13 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_24655947C(*(void *)v12, *(void *)(v12 + 8), *(unsigned char *)(v12 + 16));
    swift_bridgeObjectRelease();
  }
  long long v18 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v18;
LABEL_6:
  unint64_t v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v19 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(void *)(v20 + 24) >= 0xFFFFFFFFuLL)
    {
      char v21 = *(unsigned char *)(v20 + 16);
      uint64_t v22 = *(void *)v19;
      uint64_t v23 = *(void *)(v19 + 8);
      char v24 = *(unsigned char *)(v19 + 16);
      *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
      *(unsigned char *)(v19 + 16) = v21;
      sub_24655947C(v22, v23, v24);
      *(void *)(v19 + 24) = *(void *)(v20 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_24655947C(*(void *)v19, *(void *)(v19 + 8), *(unsigned char *)(v19 + 16));
    swift_bridgeObjectRelease();
  }
  long long v25 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v25;
LABEL_11:
  unint64_t v26 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
LABEL_15:
    long long v32 = *(_OWORD *)(v27 + 16);
    *(_OWORD *)unint64_t v26 = *(_OWORD *)v27;
    *(_OWORD *)(v26 + 16) = v32;
    goto LABEL_16;
  }
  if (*(void *)(v27 + 24) < 0xFFFFFFFFuLL)
  {
    sub_24655947C(*(void *)v26, *(void *)(v26 + 8), *(unsigned char *)(v26 + 16));
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v28 = *(unsigned char *)(v27 + 16);
  uint64_t v29 = *(void *)v26;
  uint64_t v30 = *(void *)(v26 + 8);
  char v31 = *(unsigned char *)(v26 + 16);
  *(_OWORD *)unint64_t v26 = *(_OWORD *)v27;
  *(unsigned char *)(v26 + 16) = v28;
  sub_24655947C(v29, v30, v31);
  *(void *)(v26 + 24) = *(void *)(v27 + 24);
  swift_bridgeObjectRelease();
LABEL_16:
  unint64_t v33 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v35 = *(unsigned char *)(v34 + 16);
  uint64_t v36 = *(void *)v33;
  uint64_t v37 = *(void *)(v33 + 8);
  *(_OWORD *)unint64_t v33 = *(_OWORD *)v34;
  char v38 = *(unsigned char *)(v33 + 16);
  *(unsigned char *)(v33 + 16) = v35;
  sub_246550978(v36, v37, v38);
  *(_OWORD *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_246591710(_DWORD *a1, unsigned int a2, uint64_t a3)
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
  if (v7 < a2)
  {
    unint64_t v8 = ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
         + 63) & 0xFFFFFFFFFFFFFFF8)
       + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24659187CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_246591890(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  unint64_t v10 = ((((((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              unint64_t v19 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                _OWORD v19[2] = 0;
                v19[3] = 0;
                *unint64_t v19 = a2 ^ 0x80000000;
                v19[1] = 0;
              }
              else
              {
                v19[3] = a2 - 1;
              }
            }
            else
            {
              long long v18 = *(void (**)(void))(v6 + 56);
              v18();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, ((((((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x246591AA0);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for ManagedAppCellContext()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_246591AE0(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 48) + 24) != 0;
}

BOOL sub_246591AF8(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 44) + 24) != 0;
}

__n128 sub_246591B10@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, long long a11, uint64_t a12, uint64_t a13, __n128 a14, unint64_t a15, unint64_t a16, uint64_t *a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v34 = a17[1];
  uint64_t v35 = *a17;
  char v33 = *((unsigned char *)a17 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a20 - 8) + 32))(a9, a1, a20);
  long long v25 = (int *)type metadata accessor for ManagedAppCellContext();
  uint64_t v26 = a9 + v25[9];
  *(void *)uint64_t v26 = a2;
  *(void *)(v26 + 8) = a3;
  *(unsigned char *)(v26 + 16) = a4 & 1;
  *(void *)(v26 + 24) = a5;
  unint64_t v27 = (void *)(a9 + v25[10]);
  *unint64_t v27 = a6;
  v27[1] = a7;
  v27[2] = a8;
  v27[3] = a10;
  uint64_t v28 = a9 + v25[11];
  *(_OWORD *)uint64_t v28 = a11;
  *(void *)(v28 + 16) = a12;
  *(void *)(v28 + 24) = a13;
  uint64_t v29 = (__n128 *)(a9 + v25[12]);
  __n128 result = a14;
  *uint64_t v29 = a14;
  v29[1].n128_u64[0] = a15;
  v29[1].n128_u64[1] = a16;
  uint64_t v31 = a9 + v25[13];
  *(void *)uint64_t v31 = v35;
  *(void *)(v31 + 8) = v34;
  *(unsigned char *)(v31 + 16) = v33;
  long long v32 = (void *)(a9 + v25[14]);
  *long long v32 = a18;
  v32[1] = a19;
  return result;
}

uint64_t sub_246591CA0@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v39 = a7;
  uint64_t v40 = a6;
  uint64_t v33 = a3;
  uint64_t v34 = a2;
  int v35 = a1;
  uint64_t v38 = a8;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  int v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  int v16 = (char *)&v33 - v15;
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v14);
  char v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v33 - v22;
  uint64_t v24 = sub_24659D628();
  uint64_t v37 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v33 - v25;
  if (v35)
  {
    v34(v36);
    uint64_t v27 = v39;
    sub_246598AFC(v21, a5, v39);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v18 + 8);
    v28(v21, a5);
    sub_246598AFC(v23, a5, v27);
    sub_246598B38((uint64_t)v21, a5);
    v28(v21, a5);
    v28(v23, a5);
  }
  else
  {
    uint64_t v29 = v40;
    sub_246598AFC(v36, a4, v40);
    sub_246598AFC(v16, a4, v29);
    sub_246598C30((uint64_t)v13, a5, a4);
    uint64_t v30 = *(void (**)(char *, uint64_t))(v10 + 8);
    v30(v13, a4);
    v30(v16, a4);
  }
  uint64_t v41 = v39;
  uint64_t v42 = v40;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_246598AFC(v26, v24, WitnessTable);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v26, v24);
}

uint64_t *sub_24659200C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_24659DF28();
    uint64_t v23 = (void *)sub_24659D778();
    sub_24659D098();
  }
  sub_24659D408();
  long long v24 = *(_OWORD *)(v13 + 16);
  *a9 = *(_OWORD *)v13;
  a9[1] = v24;
  long long v25 = *(_OWORD *)(v13 + 48);
  a9[2] = *(_OWORD *)(v13 + 32);
  a9[3] = v25;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[4] = v27;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;

  return sub_2465984A0((uint64_t *)v13);
}

uint64_t sub_2465921C4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_24659DF28();
    uint64_t v23 = (void *)sub_24659D778();
    sub_24659D098();
  }
  sub_24659D408();
  long long v24 = *(_OWORD *)(v13 + 16);
  v34[0] = *(_OWORD *)v13;
  v34[1] = v24;
  long long v35 = *(_OWORD *)(v13 + 32);
  sub_246561C4C((uint64_t)v34, (uint64_t)v38, &qword_268F8BE28);
  long long v36 = v35;
  sub_246561C4C((uint64_t)&v36 + 8, (uint64_t)v37, &qword_268F8CB38);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 104) = v30;
  *(_OWORD *)(a9 + 120) = v31;
  *(_OWORD *)(a9 + 136) = v32;
  *(_OWORD *)(a9 + 152) = v33;
  *(_OWORD *)(a9 + 56) = v27;
  *(_OWORD *)(a9 + 72) = v28;
  *(_DWORD *)(a9 + 48) = *(_DWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 88) = v29;
  sub_246598440(v38);
  swift_retain();
  return sub_246598474((uint64_t)v37);
}

uint64_t sub_2465923D0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_24659DF28();
    uint64_t v23 = (void *)sub_24659D778();
    sub_24659D098();
  }
  sub_24659D408();
  sub_246561C4C((uint64_t)v13, (uint64_t)v36, &qword_268F8BE28);
  long long v34 = v13[2];
  sub_246561C4C((uint64_t)&v34 + 8, (uint64_t)v35, &qword_268F8CB38);
  long long v24 = v13[1];
  *a9 = *v13;
  a9[1] = v24;
  long long v25 = v13[2];
  a9[6] = v30;
  a9[7] = v31;
  a9[8] = v32;
  a9[9] = v33;
  a9[2] = v25;
  a9[3] = v27;
  a9[4] = v28;
  a9[5] = v29;
  sub_246598440(v36);
  swift_retain();
  return sub_246598474((uint64_t)v35);
}

__n128 sub_2465925B4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_24659DF28();
    uint64_t v23 = (void *)sub_24659D778();
    sub_24659D098();
  }
  sub_24659D408();
  sub_246561BE8(v13, a9, &qword_268F8CA88);
  long long v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8CA90) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *long long v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t ManagedAppView.init(app:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unsigned int v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v21 - v8;
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  uint64_t v10 = (int *)type metadata accessor for ManagedAppView(0);
  uint64_t v11 = (uint64_t *)(a2 + v10[5]);
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  sub_246561BE8((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_268F8BA80);
  sub_24659DAB8();
  sub_246555440((uint64_t)v9, (uint64_t *)&unk_268F8BA80);
  uint64_t v13 = (void *)(a2 + v10[7]);
  *(void *)&v21[0] = 0;
  sub_24659DAB8();
  uint64_t v14 = *((void *)&v22 + 1);
  *uint64_t v13 = v22;
  v13[1] = v14;
  uint64_t v15 = a2 + v10[8];
  type metadata accessor for CGRect(0);
  memset(v21, 0, sizeof(v21));
  sub_24659DAB8();
  uint64_t v16 = v24;
  long long v17 = v23;
  *(_OWORD *)uint64_t v15 = v22;
  *(_OWORD *)(v15 + 16) = v17;
  *(void *)(v15 + 32) = v16;
  uint64_t v18 = a2 + v10[9];
  uint64_t v19 = sub_24659CFE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18, a1, v19);
}

uint64_t ManagedAppView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v97 = a1;
  uint64_t v96 = type metadata accessor for MaskView(0) - 8;
  MEMORY[0x270FA5388](v96);
  long long v95 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_24659DE38();
  uint64_t v91 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v90 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ManagedAppView(0);
  uint64_t v6 = (int *)(v5 - 8);
  uint64_t v88 = *(void *)(v5 - 8);
  uint64_t v87 = *(void *)(v88 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v86 = (uint64_t)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v78 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_24659CFE8();
  uint64_t v72 = *(void *)(v98 - 8);
  uint64_t v10 = v72;
  MEMORY[0x270FA5388](v98);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = v12;
  uint64_t v13 = type metadata accessor for AppExtensionHostView(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CA80);
  MEMORY[0x270FA5388](v81);
  long long v80 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CA88);
  MEMORY[0x270FA5388](v18 - 8);
  char v85 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CA90);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v89 = (uint64_t)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CA98) - 8;
  MEMORY[0x270FA5388](v94);
  long long v93 = (char *)&v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *v1;
  char v24 = *(unsigned char *)(v2 + 8);
  sub_246552D38(v23, v24);
  sub_2465676C4(v23, v24, &v102);
  sub_246552EF4(v23, v24);
  double v25 = dbl_2465A07C8[(char)v102];
  uint64_t v75 = sub_246593360(v2);
  uint64_t v74 = v26;
  uint64_t v82 = v2 + v6[11];
  long long v27 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v83 = v10 + 16;
  uint64_t v84 = v27;
  ((void (*)(char *))v27)(v12);
  uint64_t v77 = (void *)(v2 + v6[9]);
  uint64_t v28 = v77[1];
  *(void *)&long long v99 = *v77;
  *((void *)&v99 + 1) = v28;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAA0);
  sub_24659DAE8();
  long long v29 = v102;
  uint64_t v30 = v103;
  uint64_t v31 = v2 + v6[10];
  uint64_t v32 = *(void *)(v31 + 32);
  long long v33 = *(_OWORD *)(v31 + 16);
  long long v99 = *(_OWORD *)v31;
  long long v100 = v33;
  uint64_t v101 = v32;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAA8);
  sub_24659DAE8();
  long long v34 = v102;
  long long v71 = v103;
  uint64_t v35 = v104;
  uint64_t v36 = v105;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  uint64_t v37 = (uint64_t)v78;
  sub_24659DAC8();
  *(void *)uint64_t v16 = swift_getKeyPath();
  v16[8] = 0;
  (*(void (**)(char *, char *, uint64_t))(v72 + 32))(&v16[v14[7]], v73, v98);
  uint64_t v38 = &v16[v14[8]];
  *(_OWORD *)uint64_t v38 = v29;
  *((void *)v38 + 2) = v30;
  uint64_t v39 = &v16[v14[9]];
  *(_OWORD *)uint64_t v39 = v34;
  *((_OWORD *)v39 + 1) = v71;
  *((void *)v39 + 4) = v35;
  *((void *)v39 + 5) = v36;
  sub_246561C4C(v37, (uint64_t)&v16[v14[10]], (uint64_t *)&unk_268F8BA80);
  uint64_t v40 = v2;
  uint64_t v41 = v86;
  sub_246595E84(v40, v86, type metadata accessor for ManagedAppView);
  unint64_t v42 = (*(unsigned __int8 *)(v88 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
  uint64_t v43 = swift_allocObject();
  sub_246598668(v41, v43 + v42, type metadata accessor for ManagedAppView);
  uint64_t v44 = v90;
  sub_24659DE18();
  uint64_t v45 = (uint64_t)v80;
  char v46 = &v80[*(int *)(v81 + 36)];
  uint64_t v47 = sub_24659D348();
  uint64_t v48 = v91;
  uint64_t v49 = v92;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(&v46[*(int *)(v47 + 20)], v44, v92);
  *(void *)char v46 = &unk_268F8CAC0;
  *((void *)v46 + 1) = v43;
  sub_246595E84((uint64_t)v16, v45, type metadata accessor for AppExtensionHostView);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v44, v49);
  sub_246595FC8((uint64_t)v16, type metadata accessor for AppExtensionHostView);
  *(void *)&long long v102 = v75;
  *((void *)&v102 + 1) = v74;
  sub_246595EEC();
  sub_24656A60C();
  uint64_t v50 = (uint64_t)v85;
  sub_24659D948();
  sub_246555440(v45, &qword_268F8CA80);
  swift_bridgeObjectRelease();
  uint64_t v51 = v77[1];
  *(void *)&long long v102 = *v77;
  *((void *)&v102 + 1) = v51;
  sub_24659DAC8();
  if (v25 > *(double *)&v99) {
    double v52 = v25;
  }
  else {
    double v52 = *(double *)&v99;
  }
  sub_24659DBE8();
  uint64_t v53 = v89;
  sub_2465925B4(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v89, v52, 0, 0.0, 1);
  sub_246555440(v50, &qword_268F8CA88);
  uint64_t v54 = (uint64_t)v95;
  v84(v95, v82, v98);
  uint64_t v55 = *(void *)(v31 + 32);
  long long v56 = *(_OWORD *)(v31 + 16);
  long long v102 = *(_OWORD *)v31;
  long long v103 = v56;
  uint64_t v104 = v55;
  sub_24659DAC8();
  long long v57 = v99;
  long long v58 = v100;
  uint64_t v59 = v96;
  *(double *)(v54 + *(int *)(v96 + 28)) = v25;
  uint64_t v60 = (_OWORD *)(v54 + *(int *)(v59 + 32));
  _OWORD *v60 = v57;
  v60[1] = v58;
  uint64_t v61 = v59;
  uint64_t v62 = v54 + *(int *)(v59 + 36);
  *(void *)uint64_t v62 = swift_getKeyPath();
  *(unsigned char *)(v62 + 8) = 0;
  uint64_t v63 = (uint64_t *)(v54 + *(int *)(v61 + 40));
  *uint64_t v63 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  swift_storeEnumTagMultiPayload();
  uint64_t v64 = sub_24659DBD8();
  uint64_t v66 = v65;
  uint64_t v67 = (uint64_t)v93;
  uint64_t v68 = (uint64_t)&v93[*(int *)(v94 + 44)];
  sub_246595E84(v54, v68, type metadata accessor for MaskView);
  uint64_t v69 = (uint64_t *)(v68 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAD8) + 36));
  *uint64_t v69 = v64;
  v69[1] = v66;
  sub_246561BE8(v53, v67, &qword_268F8CA90);
  sub_246595FC8(v54, type metadata accessor for MaskView);
  sub_246555440(v53, &qword_268F8CA90);
  return sub_246561C4C(v67, v97, &qword_268F8CA98);
}

uint64_t sub_246593360(uint64_t a1)
{
  type metadata accessor for ManagedAppView(0);
  uint64_t v2 = sub_24659CF78();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)a1;
  LOBYTE(a1) = *(unsigned char *)(a1 + 8);
  sub_246552D38(v5, a1);
  sub_2465676C4(v5, a1, &v15);
  sub_246552EF4(v5, a1);
  if (v15 == 2) {
    uint64_t v6 = sub_24659CFB8();
  }
  else {
    uint64_t v6 = sub_24659CFD8();
  }
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)(sub_24659CFA8() + 16);
    swift_bridgeObjectRelease();
    if (v8)
    {
      uint64_t v15 = sub_24659CFA8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C488);
      sub_246561BA4(&qword_268F8C490, &qword_268F8C488);
      uint64_t v8 = sub_24659DD88();
      unint64_t v9 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v9 = 0xE000000000000000;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BA00);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2465A05F0;
  *(void *)(v12 + 32) = v2;
  *(void *)(v12 + 40) = v4;
  *(void *)(v12 + 48) = v8;
  *(void *)(v12 + 56) = v9;
  uint64_t v15 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C488);
  sub_246561BA4(&qword_268F8CBE0, &qword_268F8C488);
  uint64_t v13 = sub_24659DCC8();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_246593540(uint64_t a1)
{
  v1[9] = a1;
  v1[10] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_24659DE08();
  v1[14] = sub_24659DDF8();
  uint64_t v3 = sub_24659DDD8();
  v1[15] = v3;
  v1[16] = v2;
  return MEMORY[0x270FA2498](sub_246593628, v3, v2);
}

uint64_t sub_246593628()
{
  uint64_t v1 = *(void *)(v0 + 104);
  *(_DWORD *)(v0 + 172) = *(_DWORD *)(type metadata accessor for ManagedAppView(0) + 24);
  *(void *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  sub_24659DAC8();
  uint64_t v2 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    sub_246555440(*(void *)(v0 + 104), (uint64_t *)&unk_268F8BA80);
    if (qword_268F8B988 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_268F8CA70;
    *(void *)(v0 + 144) = qword_268F8CA70;
    return MEMORY[0x270FA2498](sub_2465937AC, v3, 0);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 104);
    swift_release();
    sub_246555440(v4, (uint64_t *)&unk_268F8BA80);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_2465937AC()
{
  uint64_t v1 = *(void *)(v0[18] + 112);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[19] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C428);
  *uint64_t v2 = v0;
  v2[1] = sub_24659386C;
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v6 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v4, v1, v5, v3, v6);
}

uint64_t sub_24659386C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v5 = sub_246593A78;
  }
  else {
    uint64_t v5 = sub_2465939A8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2465939A8()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  swift_release();
  sub_246561BE8(v1, v2, (uint64_t *)&unk_268F8BA80);
  sub_24659DAD8();
  sub_246555440(v1, (uint64_t *)&unk_268F8BA80);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246593A78()
{
  uint64_t v19 = v0;
  swift_release();
  *(void *)(v0 + 40) = 0;
  MEMORY[0x24C52FEA0](v0 + 40, 8);
  uint64_t v1 = *(void *)(v0 + 40);
  if (qword_268F8B980 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 160);
  uint64_t v3 = sub_24659D0C8();
  __swift_project_value_buffer(v3, (uint64_t)qword_268F8EDD0);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_24659D0A8();
  os_log_type_t v7 = sub_24659DF18();
  BOOL v8 = os_log_type_enabled(v6, v7);
  unint64_t v9 = *(void **)(v0 + 160);
  if (v8)
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v16 = v11;
    uint64_t v17 = 5527621;
    unint64_t v18 = 0xE300000000000000;
    *(_DWORD *)(v0 + 168) = v1;
    sub_246554E28();
    sub_24659DD78();
    sub_24659DD58();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 48) = sub_2465574C8(v17, v18, &v16);
    sub_24659DFE8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v12 = sub_24659E1A8();
    *(void *)(v0 + 64) = sub_2465574C8(v12, v13, &v16);
    sub_24659DFE8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24654E000, v6, v7, "[%s] Configuration error: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C52FE90](v11, -1, -1);
    MEMORY[0x24C52FE90](v10, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_246593D68()
{
  type metadata accessor for ConfigurationCache();
  swift_allocObject();
  uint64_t result = sub_246593DA8();
  qword_268F8CA70 = result;
  return result;
}

uint64_t sub_246593DA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAE8);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v5 = sub_24659DE38();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_246555440((uint64_t)v4, &qword_268F8BAE8);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_24659DE28();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (*(void *)(v7 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_24659DDD8();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    uint64_t v12[2] = v8;
    uint64_t v12[3] = v9;
  }
  *(void *)(v1 + 112) = swift_task_create();
  return v1;
}

uint64_t sub_246593FC8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_24659CF38();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BB40);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  sub_24659CEF8();
  v1[8] = swift_task_alloc();
  v1[9] = sub_24659CF08();
  v1[10] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CBB8);
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CBC0);
  v1[14] = v4;
  v1[15] = *(void *)(v4 - 8);
  v1[16] = swift_task_alloc();
  uint64_t v5 = sub_24659CF28();
  v1[17] = v5;
  v1[18] = *(void *)(v5 - 8);
  v1[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246594240, 0, 0);
}

uint64_t sub_246594240()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  sub_24659CEE8();
  sub_24659CF18();
  sub_246598A74(&qword_268F8CBC8, MEMORY[0x263F04D48]);
  sub_24659E0D8();
  MEMORY[0x24C52F690](v3);
  sub_24659DE88();
  sub_24659E088();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_24659E0C8();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))&aD[*(int *)aD];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[20] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2465943FC;
  return v6(0, 0);
}

uint64_t sub_2465943FC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24659482C;
  }
  else {
    uint64_t v4 = sub_246594510;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_246594510()
{
  uint64_t v1 = v0[21];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[4] + 16))(v0[7], v1 + ((*(unsigned __int8 *)(v0[4] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[4] + 80)), v0[3]);
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = 1;
    }
    uint64_t v9 = v0[6];
    uint64_t v8 = v0[7];
    uint64_t v10 = v0[3];
    uint64_t v11 = v0[4];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v8, v2, 1, v10);
    swift_bridgeObjectRelease();
    sub_246561BE8(v8, v9, (uint64_t *)&unk_268F8BB40);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      uint64_t v12 = type metadata accessor for AppExtensionHostView.Configuration(0);
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v14 = v0[5];
      uint64_t v15 = v0[3];
      uint64_t v16 = v0[4];
      uint64_t v17 = v0[2];
      (*(void (**)(uint64_t, void, uint64_t))(v16 + 32))(v14, v0[6], v15);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v17, v14, v15);
      uint64_t v12 = type metadata accessor for AppExtensionHostView.Configuration(0);
      unint64_t v18 = (void *)(v17 + *(int *)(v12 + 20));
      *unint64_t v18 = 0xD000000000000014;
      v18[1] = 0x80000002465A0B70;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
      uint64_t v13 = 0;
    }
    uint64_t v20 = v0[18];
    uint64_t v19 = v0[19];
    uint64_t v22 = v0[16];
    uint64_t v21 = v0[17];
    uint64_t v23 = v0[14];
    uint64_t v24 = v0[15];
    uint64_t v25 = v0[7];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v0[2], v13, 1, v12);
    sub_246555440(v25, (uint64_t *)&unk_268F8BB40);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  else
  {
    uint64_t v4 = v0[18];
    uint64_t v3 = v0[19];
    uint64_t v5 = v0[17];
    uint64_t v6 = v0[2];
    (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_24659482C()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_246594934(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  if (a1)
  {
    swift_getObjectType();
    uint64_t v4 = sub_24659DDD8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v3[15] = v4;
  v3[16] = v6;
  return MEMORY[0x270FA2498](sub_2465949D4, v4, v6);
}

uint64_t sub_2465949D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CBC0);
  if (sub_24659E088())
  {
    uint64_t v1 = (void (*)(void *, void))sub_24659E0A8();
    --*v2;
    v1(v0 + 2, 0);
    v0[17] = sub_24659E098();
    uint64_t v3 = sub_24659CEF8();
    uint64_t v4 = sub_246598A74(&qword_268F8CBD8, MEMORY[0x263F04D38]);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[18] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_246594B80;
    uint64_t v6 = v0[12];
    uint64_t v7 = v0[13];
    return MEMORY[0x270FA1E88](v0 + 10, v6, v7, v0 + 11, v3, v4);
  }
  else
  {
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_246594B80()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 120);
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v5 = sub_246594CC4;
  }
  else
  {
    (*(void (**)(void))(v2 + 136))();
    uint64_t v3 = *(void *)(v2 + 120);
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v5 = sub_246594CA8;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_246594CA8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 80));
}

uint64_t sub_246594CC4()
{
  (*(void (**)(void))(v0 + 136))();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246594D38()
{
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_246594D70()
{
  return v0;
}

uint64_t sub_246594D7C()
{
  sub_24659DA28();
  uint64_t v0 = sub_24659DA38();
  uint64_t result = swift_release();
  qword_268F8CA78 = v0;
  return result;
}

__n128 sub_246594DC0@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24659D3C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for MaskView(0);
  sub_246568038((uint64_t)v7);
  char v9 = sub_24659D3B8();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  if (v9)
  {
    uint64_t v10 = a1 + *(int *)(v8 + 28);
    uint64_t v11 = *(void *)v10;
    char v12 = *(unsigned char *)(v10 + 8);
    sub_246552D38(*(void *)v10, v12);
    sub_2465676C4(v11, v12, &v63);
    sub_246552EF4(v11, v12);
    if (qword_268F8B990 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_268F8CA78;
    swift_retain();
    sub_24659D2F8();
    sub_24659D2F8();
    CGRectGetHeight(*(CGRect *)(a1 + *(int *)(v8 + 24)));
    sub_24659DBD8();
    sub_24659D2E8();
    *(void *)&long long v45 = v13;
    *((void *)&v45 + 1) = v54;
    v46.n128_u8[0] = BYTE8(v54);
    v46.n128_u64[1] = v55.n128_u64[0];
    LOBYTE(v47[0]) = v55.n128_u8[8];
    *(_OWORD *)((char *)v47 + 8) = v56;
    sub_246598988((uint64_t)&v45);
    sub_246561C4C((uint64_t)&v45, (uint64_t)v44, &qword_268F8CB88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB90);
    sub_246598750();
    sub_2465988F0();
    sub_24659D618();
  }
  else
  {
    uint64_t v14 = a1 + *(int *)(v8 + 28);
    uint64_t v15 = *(void *)v14;
    char v16 = *(unsigned char *)(v14 + 8);
    sub_246552D38(*(void *)v14, v16);
    sub_2465676C4(v15, v16, &v53);
    sub_246552EF4(v15, v16);
    switch(v53)
    {
      case 1:
        uint64_t v18 = sub_24659DBC8();
        uint64_t v20 = v19;
        sub_246595628((uint64_t)&v63);
        unsigned __int8 v31 = v64.n128_u8[0];
        char v30 = v65[0];
        char v29 = BYTE8(v66);
        v28[0] = BYTE8(v67);
        uint64_t v32 = v18;
        uint64_t v33 = v20;
        long long v34 = v63;
        LOBYTE(v35) = v64.n128_u8[0];
        *((void *)&v35 + 1) = v64.n128_u64[1];
        char v36 = v65[0];
        long long v37 = *(_OWORD *)&v65[8];
        uint64_t v38 = *(void *)&v65[24];
        uint64_t v39 = v66;
        char v40 = BYTE8(v66);
        uint64_t v41 = v67;
        char v42 = BYTE8(v67);
        long long v43 = v68;
        sub_246598980((uint64_t)&v32);
        goto LABEL_11;
      case 2:
        uint64_t v21 = sub_24659DBC8();
        uint64_t v23 = v22;
        sub_2465957B8((uint64_t)&v63);
        unsigned __int8 v31 = v64.n128_u8[0];
        char v30 = v65[0];
        char v29 = BYTE8(v66);
        v28[0] = BYTE8(v67);
        uint64_t v32 = v21;
        uint64_t v33 = v23;
        long long v34 = v63;
        LOBYTE(v35) = v64.n128_u8[0];
        *((void *)&v35 + 1) = v64.n128_u64[1];
        char v36 = v65[0];
        long long v37 = *(_OWORD *)&v65[8];
        uint64_t v38 = *(void *)&v65[24];
        uint64_t v39 = v66;
        char v40 = BYTE8(v66);
        uint64_t v41 = v67;
        char v42 = BYTE8(v67);
        long long v43 = v68;
        sub_24659896C((uint64_t)&v32);
LABEL_11:
        sub_246561C4C((uint64_t)&v32, (uint64_t)&v63, &qword_268F8CBA0);
        swift_retain();
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB78);
        sub_246561BA4(&qword_268F8CB70, &qword_268F8CB78);
        sub_24659D618();
        long long v68 = v60;
        *(_OWORD *)uint64_t v69 = v61;
        v69[16] = v62;
        *(_OWORD *)uint64_t v65 = v56;
        *(_OWORD *)&v65[16] = v57;
        long long v66 = v58;
        long long v67 = v59;
        long long v63 = v54;
        __n128 v64 = v55;
        sub_246598978((uint64_t)&v63);
        sub_246561C4C((uint64_t)&v63, (uint64_t)v44, &qword_268F8CB50);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB58);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB60);
        sub_2465987D0();
        sub_246598868();
        sub_24659D618();
        swift_release();
        goto LABEL_12;
      case 3:
        __n128 v46 = 0u;
        memset(v47, 0, 24);
        long long v45 = 0u;
        BYTE8(v47[1]) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB40);
        sub_246598750();
        sub_24659D618();
        sub_2465987C4((uint64_t)&v63);
        sub_246561C4C((uint64_t)&v63, (uint64_t)&v45, &qword_268F8CB50);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB58);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB60);
        sub_2465987D0();
        sub_246598868();
        sub_24659D618();
        goto LABEL_14;
      default:
        if (qword_268F8B990 != -1) {
          swift_once();
        }
        uint64_t v17 = qword_268F8CA78;
        swift_retain();
        sub_24659D2F8();
        CGRectGetWidth(*(CGRect *)(a1 + *(int *)(v8 + 24)));
        sub_24659D2F8();
        sub_24659DBD8();
        sub_24659D2E8();
        *(void *)&long long v45 = v17;
        *((void *)&v45 + 1) = v32;
        v46.n128_u64[0] = v33;
        v46.n128_u64[1] = v34;
        *(void *)&v47[0] = BYTE8(v34);
        *(_OWORD *)((char *)v47 + 8) = v35;
        BYTE8(v47[1]) = 0;
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB40);
        sub_246598750();
        sub_24659D618();
        sub_2465987C4((uint64_t)&v63);
        sub_246561C4C((uint64_t)&v63, (uint64_t)v44, &qword_268F8CB50);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB58);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB60);
        sub_2465987D0();
        sub_246598868();
        sub_24659D618();
LABEL_12:
        swift_release();
        long long v60 = v50;
        long long v61 = v51;
        __int16 v62 = v52;
        long long v56 = v47[0];
        long long v57 = v47[1];
        long long v58 = v48;
        long long v59 = v49;
        long long v54 = v45;
        __n128 v55 = v46;
LABEL_14:
        long long v50 = v60;
        long long v51 = v61;
        __int16 v52 = v62;
        v47[0] = v56;
        v47[1] = v57;
        long long v48 = v58;
        long long v49 = v59;
        long long v45 = v54;
        __n128 v46 = v55;
        sub_2465988E4((uint64_t)&v45);
        sub_246561C4C((uint64_t)&v45, (uint64_t)v44, &qword_268F8CB88);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB40);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CB90);
        sub_246598750();
        sub_2465988F0();
        sub_24659D618();
        break;
    }
  }
  long long v24 = *(_OWORD *)v69;
  *(_OWORD *)(a2 + 96) = v68;
  *(_OWORD *)(a2 + 112) = v24;
  *(_DWORD *)(a2 + 127) = *(_DWORD *)&v69[15];
  long long v25 = *(_OWORD *)&v65[16];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)v65;
  *(_OWORD *)(a2 + 48) = v25;
  long long v26 = v67;
  *(_OWORD *)(a2 + 64) = v66;
  *(_OWORD *)(a2 + 80) = v26;
  __n128 result = v64;
  *(_OWORD *)a2 = v63;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

double sub_246595628@<D0>(uint64_t a1@<X8>)
{
  if (qword_268F8B990 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_268F8CA78;
  swift_retain();
  sub_24659D2F8();
  sub_24659DBD8();
  sub_24659D2E8();
  sub_24659D2F8();
  type metadata accessor for MaskView(0);
  sub_24659D2F8();
  swift_retain();
  sub_24659D2F8();
  sub_24659DBD8();
  sub_24659D2E8();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v2;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v12;
  *(unsigned char *)(a1 + 88) = v13;
  double result = *(double *)&v14;
  *(_OWORD *)(a1 + 96) = v14;
  return result;
}

double sub_2465957B8@<D0>(uint64_t a1@<X8>)
{
  if (qword_268F8B990 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_268F8CA78;
  swift_retain();
  sub_24659D2F8();
  sub_24659DBD8();
  sub_24659D2E8();
  sub_24659D2F8();
  type metadata accessor for MaskView(0);
  swift_retain();
  sub_24659D2F8();
  sub_24659DBD8();
  sub_24659D2E8();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v2;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v12;
  *(unsigned char *)(a1 + 88) = v13;
  double result = *(double *)&v14;
  *(_OWORD *)(a1 + 96) = v14;
  return result;
}

uint64_t type metadata accessor for ManagedAppView(uint64_t a1)
{
  return sub_246552D64(a1, (uint64_t *)&unk_268F8CAE8);
}

uint64_t sub_246595958()
{
  return sub_24659D458();
}

uint64_t sub_24659597C(uint64_t a1)
{
  uint64_t v2 = sub_24659D3C8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24659D468();
}

uint64_t type metadata accessor for MaskView(uint64_t a1)
{
  return sub_246552D64(a1, (uint64_t *)&unk_268F8CB28);
}

uint64_t sub_246595A68@<X0>(uint64_t a1@<X0>, double (**a2)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_246595E84(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MaskView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_246598668((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for MaskView);
  *a2 = sub_2465986D0;
  a2[1] = (double (*)@<D0>(uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_246595B7C()
{
  uint64_t v1 = (int *)type metadata accessor for ManagedAppView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_246552EF4(*(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v6 = v0 + v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24659D3C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[6];
  uint64_t v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    uint64_t v10 = sub_24659CF38();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v8, v10);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = v5 + v1[9];
  uint64_t v12 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_246595DB8()
{
  uint64_t v2 = *(void *)(type metadata accessor for ManagedAppView(0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_246555050;
  return sub_246593540(v3);
}

uint64_t sub_246595E84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_246595EEC()
{
  unint64_t result = qword_268F8CAC8;
  if (!qword_268F8CAC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CA80);
    sub_246598A74(&qword_268F8BAC0, (void (*)(uint64_t))type metadata accessor for AppExtensionHostView);
    sub_246598A74(&qword_268F8CAD0, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CAC8);
  }
  return result;
}

uint64_t sub_246595FC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246596028()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t initializeBufferWithCopyOfBuffer for ManagedAppView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_246552D38(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_24659D3C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = (char *)(a1 + v14);
    char v16 = (char *)(a2 + v14);
    uint64_t v17 = type metadata accessor for AppExtensionHostView.Configuration(0);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      uint64_t v20 = sub_24659CF38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v15, v16, v20);
      uint64_t v21 = *(int *)(v17 + 20);
      uint64_t v22 = &v15[v21];
      uint64_t v23 = &v16[v21];
      uint64_t v24 = *((void *)v23 + 1);
      *(void *)uint64_t v22 = *(void *)v23;
      *((void *)v22 + 1) = v24;
      long long v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
      swift_bridgeObjectRetain();
      v25(v15, 0, 1, v17);
    }
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
    *(void *)&v15[*(int *)(v26 + 28)] = *(void *)&v16[*(int *)(v26 + 28)];
    uint64_t v27 = a3[7];
    uint64_t v28 = a3[8];
    char v29 = (void *)(a1 + v27);
    char v30 = (void *)(a2 + v27);
    uint64_t v31 = v30[1];
    *char v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = a1 + v28;
    uint64_t v33 = a2 + v28;
    long long v34 = *(_OWORD *)(v33 + 16);
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
    *(_OWORD *)(v32 + 16) = v34;
    *(void *)(v32 + 32) = *(void *)(v33 + 32);
    uint64_t v35 = a3[9];
    uint64_t v36 = a1 + v35;
    uint64_t v37 = a2 + v35;
    uint64_t v38 = sub_24659CFE8();
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    v39(v36, v37, v38);
  }
  return a1;
}

uint64_t destroy for ManagedAppView(uint64_t a1, int *a2)
{
  sub_246552EF4(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24659D3C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    uint64_t v8 = sub_24659CF38();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = a1 + a2[9];
  uint64_t v10 = sub_24659CFE8();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);

  return v11(v9, v10);
}

uint64_t initializeWithCopy for ManagedAppView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24659D3C8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = sub_24659CF38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v13, v14, v18);
    uint64_t v19 = *(int *)(v15 + 20);
    uint64_t v20 = &v13[v19];
    uint64_t v21 = &v14[v19];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)uint64_t v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    uint64_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
    swift_bridgeObjectRetain();
    v23(v13, 0, 1, v15);
  }
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  *(void *)&v13[*(int *)(v24 + 28)] = *(void *)&v14[*(int *)(v24 + 28)];
  uint64_t v25 = a3[7];
  uint64_t v26 = a3[8];
  uint64_t v27 = (void *)(a1 + v25);
  uint64_t v28 = (void *)(a2 + v25);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = a1 + v26;
  uint64_t v31 = a2 + v26;
  long long v32 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v32;
  *(void *)(v30 + 32) = *(void *)(v31 + 32);
  uint64_t v33 = a3[9];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = sub_24659CFE8();
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  v37(v34, v35, v36);
  return a1;
}

uint64_t assignWithCopy for ManagedAppView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_246555440(a1 + v10, &qword_268F8C100);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_24659D3C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      uint64_t v40 = sub_24659CF38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 24))(v15, v16, v40);
      uint64_t v41 = *(int *)(v17 + 20);
      char v42 = &v15[v41];
      long long v43 = &v16[v41];
      *(void *)char v42 = *(void *)v43;
      *((void *)v42 + 1) = *((void *)v43 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_246595FC8((uint64_t)v15, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_11;
  }
  if (v21)
  {
LABEL_11:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v15, v16, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_12;
  }
  uint64_t v22 = sub_24659CF38();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v15, v16, v22);
  uint64_t v23 = *(int *)(v17 + 20);
  uint64_t v24 = &v15[v23];
  uint64_t v25 = &v16[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
  swift_bridgeObjectRetain();
  v26(v15, 0, 1, v17);
LABEL_12:
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  *(void *)&v15[*(int *)(v28 + 28)] = *(void *)&v16[*(int *)(v28 + 28)];
  swift_retain();
  swift_release();
  uint64_t v29 = a3[7];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_retain();
  swift_release();
  uint64_t v32 = a3[8];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  v33[2] = v34[2];
  v33[3] = v34[3];
  v33[4] = v34[4];
  swift_retain();
  swift_release();
  uint64_t v35 = a3[9];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  uint64_t v38 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 24))(v36, v37, v38);
  return a1;
}

uint64_t initializeWithTake for ManagedAppView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_24659D3C8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = sub_24659CF38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v12, v13, v17);
    *(_OWORD *)&v12[*(int *)(v14 + 20)] = *(_OWORD *)&v13[*(int *)(v14 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  *(void *)&v12[*(int *)(v18 + 28)] = *(void *)&v13[*(int *)(v18 + 28)];
  uint64_t v19 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  long long v22 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v22;
  *(void *)(v20 + 32) = *(void *)(v21 + 32);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  return a1;
}

uint64_t assignWithTake for ManagedAppView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_246555440(a1 + v10, &qword_268F8C100);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_24659D3C8();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)(a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      uint64_t v38 = sub_24659CF38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 40))(v16, v17, v38);
      uint64_t v39 = *(int *)(v18 + 20);
      uint64_t v40 = &v16[v39];
      uint64_t v41 = &v17[v39];
      uint64_t v43 = *(void *)v41;
      uint64_t v42 = *((void *)v41 + 1);
      *(void *)uint64_t v40 = v43;
      *((void *)v40 + 1) = v42;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_246595FC8((uint64_t)v16, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_10;
  }
  if (v22)
  {
LABEL_10:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8BA80);
    memcpy(v16, v17, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_11;
  }
  uint64_t v23 = sub_24659CF38();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v16, v17, v23);
  *(_OWORD *)&v16[*(int *)(v18 + 20)] = *(_OWORD *)&v17[*(int *)(v18 + 20)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
LABEL_11:
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  *(void *)&v16[*(int *)(v25 + 28)] = *(void *)&v17[*(int *)(v25 + 28)];
  swift_release();
  uint64_t v26 = a3[7];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (uint64_t *)((char *)a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_release();
  uint64_t v29 = a3[8];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = (uint64_t)a2 + v29;
  long long v32 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v32;
  *(void *)(v30 + 32) = *(void *)(v31 + 32);
  swift_release();
  uint64_t v33 = a3[9];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = (uint64_t)a2 + v33;
  uint64_t v36 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 40))(v34, v35, v36);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAppView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246597198);
}

uint64_t sub_246597198(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAE0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[6];
    goto LABEL_5;
  }
  if (a2 == 2147483646)
  {
    unint64_t v13 = *(void *)(a1 + a3[7] + 8);
    if (v13 >= 0xFFFFFFFF) {
      LODWORD(v13) = -1;
    }
    int v14 = v13 - 1;
    if (v14 < 0) {
      int v14 = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = sub_24659CFE8();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[9];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for ManagedAppView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246597340);
}

uint64_t sub_246597340(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAE0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_5:
    unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(a1 + v11, a2, a2, v9);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAB0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[6];
    goto LABEL_5;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[7] + 8) = a2;
  }
  else
  {
    uint64_t v14 = sub_24659CFE8();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + a4[9];
    return v15(v17, a2, a2, v16);
  }
  return result;
}

void sub_2465974C8()
{
  sub_2465975EC();
  if (v0 <= 0x3F)
  {
    sub_246597644();
    if (v1 <= 0x3F)
    {
      sub_24659CFE8();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2465975EC()
{
  if (!qword_268F8CAF8)
  {
    sub_24659D3C8();
    unint64_t v0 = sub_24659D288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8CAF8);
    }
  }
}

void sub_246597644()
{
  if (!qword_268F8CB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268F8BA80);
    unint64_t v0 = sub_24659DAF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8CB00);
    }
  }
}

uint64_t type metadata accessor for ConfigurationCache()
{
  return self;
}

unint64_t sub_2465976C8()
{
  unint64_t result = qword_268F8CB08;
  if (!qword_268F8CB08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CA98);
    sub_246597768();
    sub_246561BA4(&qword_268F8CB20, &qword_268F8CAD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB08);
  }
  return result;
}

unint64_t sub_246597768()
{
  unint64_t result = qword_268F8CB10;
  if (!qword_268F8CB10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CA90);
    sub_2465977E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB10);
  }
  return result;
}

unint64_t sub_2465977E4()
{
  unint64_t result = qword_268F8CB18;
  if (!qword_268F8CB18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CA88);
    sub_246595EEC();
    sub_246598A74(&qword_268F8BDA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB18);
  }
  return result;
}

uint64_t *sub_246597890(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24659CFE8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v9 = (_OWORD *)((char *)a1 + v8);
    uint64_t v10 = (_OWORD *)((char *)a2 + v8);
    long long v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    unint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = *(void *)v14;
    char v16 = v14[8];
    sub_246552D38(*(void *)v14, v16);
    *(void *)unint64_t v13 = v15;
    v13[8] = v16;
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_24659D3C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_246597A34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_246552EF4(*(void *)(a1 + *(int *)(a2 + 28)), *(unsigned char *)(a1 + *(int *)(a2 + 28) + 8));
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24659D3C8();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_246597B30(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = *(unsigned char *)(v13 + 8);
  sub_246552D38(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_24659D3C8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    *uint64_t v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_246597C7C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  char v14 = *(unsigned char *)(v12 + 8);
  sub_246552D38(*(void *)v12, v14);
  uint64_t v15 = *(void *)v11;
  char v16 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = v14;
  sub_246552EF4(v15, v16);
  if (a1 != a2)
  {
    uint64_t v17 = a3[8];
    uint64_t v18 = (void *)(a1 + v17);
    uint64_t v19 = (void *)(a2 + v17);
    sub_246555440(a1 + v17, &qword_268F8C100);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_24659D3C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_246597E08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  uint64_t v15 = (void *)(a1 + v12);
  char v16 = (const void *)(a2 + v12);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_24659D3C8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

uint64_t sub_246597F4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  LOBYTE(v13) = *((unsigned char *)v13 + 8);
  uint64_t v15 = *(void *)v12;
  char v16 = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = (_BYTE)v13;
  sub_246552EF4(v15, v16);
  if (a1 != a2)
  {
    uint64_t v17 = a3[8];
    uint64_t v18 = (void *)(a1 + v17);
    uint64_t v19 = (const void *)(a2 + v17);
    sub_246555440(a1 + v17, &qword_268F8C100);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_24659D3C8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2465980B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2465980CC);
}

uint64_t sub_2465980CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24659CFE8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAE0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 32);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_2465981F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24659820C);
}

uint64_t sub_24659820C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24659CFE8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 28) + 8) = -(char)a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8CAE0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_24659833C()
{
  sub_24659CFE8();
  if (v0 <= 0x3F)
  {
    sub_2465975EC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_246598424()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_246598440(uint64_t *a1)
{
  return a1;
}

uint64_t sub_246598474(uint64_t a1)
{
  return a1;
}

uint64_t *sub_2465984A0(uint64_t *a1)
{
  return a1;
}

uint64_t sub_24659850C()
{
  unint64_t v1 = (int *)(type metadata accessor for MaskView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_24659CFE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  sub_246552EF4(*(void *)(v0 + v3 + v1[9]), *(unsigned char *)(v0 + v3 + v1[9] + 8));
  uint64_t v6 = v0 + v3 + v1[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8C100);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24659D3C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_246598668(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_2465986D0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MaskView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  *(void *)&double result = sub_246594DC0(v4, a1).n128_u64[0];
  return result;
}

unint64_t sub_246598750()
{
  unint64_t result = qword_268F8CB48;
  if (!qword_268F8CB48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CB40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB48);
  }
  return result;
}

uint64_t sub_2465987C4(uint64_t result)
{
  *(unsigned char *)(result + 129) = 1;
  return result;
}

unint64_t sub_2465987D0()
{
  unint64_t result = qword_268F8CB68;
  if (!qword_268F8CB68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CB58);
    sub_246561BA4(&qword_268F8CB70, &qword_268F8CB78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB68);
  }
  return result;
}

unint64_t sub_246598868()
{
  unint64_t result = qword_268F8CB80;
  if (!qword_268F8CB80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CB60);
    sub_246598750();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB80);
  }
  return result;
}

uint64_t sub_2465988E4(uint64_t result)
{
  *(unsigned char *)(result + 130) = 1;
  return result;
}

unint64_t sub_2465988F0()
{
  unint64_t result = qword_268F8CB98;
  if (!qword_268F8CB98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CB90);
    sub_2465987D0();
    sub_246598868();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CB98);
  }
  return result;
}

uint64_t sub_24659896C(uint64_t result)
{
  *(unsigned char *)(result + 128) = 1;
  return result;
}

uint64_t sub_246598978(uint64_t result)
{
  *(unsigned char *)(result + 129) = 0;
  return result;
}

uint64_t sub_246598980(uint64_t result)
{
  *(unsigned char *)(result + 128) = 0;
  return result;
}

uint64_t sub_246598988(uint64_t result)
{
  *(unsigned char *)(result + 130) = 0;
  return result;
}

uint64_t sub_246598990()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2465989C8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_246555050;
  return sub_246593FC8(a1);
}

uint64_t sub_246598A74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246598ABC()
{
  return sub_246561BA4(&qword_268F8CBE8, qword_268F8CBF0);
}

uint64_t sub_246598B00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_246598B38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24659D608();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24659D618();
}

uint64_t sub_246598C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24659D608();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24659D618();
}

uint64_t sub_246598D28@<X0>(unsigned char *a1@<X8>)
{
  sub_2465861E0();
  uint64_t result = sub_24659D538();
  *a1 = v3;
  return result;
}

uint64_t sub_246598D78()
{
  return sub_24659D548();
}

uint64_t sub_246598DC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  sub_246552D38(v3, v4);
  sub_2465676C4(v3, v4, a1);

  return sub_246552EF4(v3, v4);
}

uint64_t ManagedContentView.init(primaryLabel:secondaryLabel:tertiaryLabel:quaternaryLabel:offerState:offerAction:icon:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void (*a19)(uint64_t), uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v69 = a6;
  LODWORD(v68) = a5;
  uint64_t v73 = a4;
  LODWORD(v72) = a3;
  uint64_t v71 = a2;
  uint64_t v70 = a1;
  uint64_t v75 = a12;
  uint64_t v76 = a13;
  uint64_t v66 = a11;
  v62[3] = a10;
  uint64_t v65 = a9;
  uint64_t v63 = a8;
  uint64_t v74 = a15;
  MEMORY[0x270FA5388](a1);
  uint64_t v24 = (char *)v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for ManagedAppCellContext();
  uint64_t v26 = sub_24659DFD8();
  uint64_t v88 = *(void *)(v26 - 8);
  uint64_t v89 = v26;
  MEMORY[0x270FA5388](v26);
  uint64_t v83 = (uint64_t)v62 - v27;
  uint64_t v28 = *(void *)a16;
  uint64_t v81 = *(void *)(a16 + 8);
  uint64_t v82 = v28;
  int v80 = *(unsigned __int8 *)(a16 + 16);
  *(void *)a7 = swift_getKeyPath();
  *(unsigned char *)(a7 + 8) = 0;
  uint64_t v86 = a22;
  uint64_t v87 = a21;
  uint64_t v29 = a7 + *(int *)(type metadata accessor for ManagedContentView() + 36);
  uint64_t v30 = *(void *)(v25 - 8);
  uint64_t v78 = *(uint64_t (**)(void))(v30 + 56);
  uint64_t v79 = v29;
  uint64_t v85 = v25;
  uint64_t v77 = v30 + 56;
  uint64_t v31 = v78();
  uint64_t v84 = v24;
  a19(v31);
  uint64_t v73 = sub_24659D8C8();
  uint64_t v72 = v32;
  LODWORD(v70) = v33;
  uint64_t v71 = v34;
  sub_24659D578();
  LOBYTE(v25) = sub_24659D588();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v69 = 0;
    uint64_t v68 = 0;
    uint64_t v67 = 0;
    uint64_t v64 = 0;
  }
  else
  {
    uint64_t v69 = sub_24659D8C8();
    uint64_t v68 = v35;
    uint64_t v64 = v36;
    uint64_t v67 = v37 & 1;
  }
  sub_24659D578();
  char v38 = sub_24659D588();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v38)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v66 = 0;
    uint64_t v65 = 0;
    uint64_t v63 = 0;
    uint64_t v39 = 0;
  }
  else
  {
    uint64_t v66 = sub_24659D8C8();
    uint64_t v65 = v40;
    uint64_t v39 = v41;
    uint64_t v63 = v42 & 1;
  }
  sub_24659D578();
  char v43 = sub_24659D588();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v43)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = 0;
    unint64_t v45 = 0;
    unint64_t v46 = 0;
    unint64_t v47 = 0;
  }
  else
  {
    uint64_t v44 = sub_24659D8C8();
    unint64_t v45 = v48;
    unint64_t v47 = v49;
    unint64_t v46 = v50 & 1;
  }
  uint64_t v52 = v81;
  uint64_t v51 = v82;
  v90[0] = v82;
  v90[1] = v81;
  char v53 = v80;
  char v91 = v80;
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = a17;
  *(void *)(v54 + 24) = a18;
  *(void *)(v54 + 32) = v51;
  *(void *)(v54 + 40) = v52;
  char v55 = v70 & 1;
  *(unsigned char *)(v54 + 48) = v53;
  v61.n128_u64[0] = v44;
  v61.n128_u64[1] = v45;
  uint64_t v60 = v39;
  *((void *)&v59 + 1) = v65;
  *(void *)&long long v59 = v66;
  uint64_t v56 = v83;
  __n128 v57 = sub_246591B10((uint64_t)v84, v73, v72, v55, v71, v69, v68, v67, v83, v64, v59, v63, v60, v61, v46, v47, v90, (uint64_t)sub_2465994BC, v54,
          v87);
  ((void (*)(uint64_t, void, uint64_t, uint64_t, __n128))v78)(v56, 0, 1, v85, v57);
  sub_246558E9C(v51, v52, v53);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 40))(v79, v56, v89);
}

uint64_t type metadata accessor for ManagedContentView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t ManagedContentView.init(primaryLabel:secondaryLabel:tertiaryLabel:quaternaryLabel:offerState:offerAction:icon:)@<X0>(void (*a1)(uint64_t)@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void (*a8)(uint64_t)@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v77 = a9;
  uint64_t v78 = a8;
  uint64_t v70 = a6;
  uint64_t v71 = a7;
  MEMORY[0x270FA5388](a1);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ManagedAppCellContext();
  uint64_t v20 = sub_24659DFD8();
  uint64_t v73 = *(void *)(v20 - 8);
  uint64_t v74 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v72 = (uint64_t)&v52 - v21;
  uint64_t v68 = a12;
  uint64_t v69 = a11;
  uint64_t v22 = type metadata accessor for ManagedContentView();
  uint64_t v75 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v52 - v23;
  uint64_t v67 = *(void *)a5;
  uint64_t v65 = *(void *)(a5 + 8);
  int v63 = *(unsigned __int8 *)(a5 + 16);
  *(void *)uint64_t v24 = swift_getKeyPath();
  v24[8] = 0;
  uint64_t v76 = v22;
  uint64_t v25 = *(void *)(v19 - 8);
  uint64_t v26 = *(uint64_t (**)(void))(v25 + 56);
  __int16 v62 = &v24[*(int *)(v22 + 36)];
  uint64_t v64 = v19;
  __n128 v61 = v26;
  uint64_t v60 = v25 + 56;
  uint64_t v27 = v26();
  uint64_t v66 = v18;
  v78(v27);
  uint64_t v28 = *((void *)a1 + 3);
  uint64_t v78 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v28);
  uint64_t v59 = sub_24659E148();
  uint64_t v58 = v29;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  char v30 = sub_24659DEC8();
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if ((v30 & 1) == 0)
  {
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    uint64_t v31 = sub_24659E148();
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  uint64_t v55 = v33;
  uint64_t v56 = v32;
  uint64_t v57 = v31;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  if (sub_24659DEC8())
  {
    uint64_t v54 = 0;
    uint64_t v53 = 0;
    uint64_t v52 = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a3, a3[3]);
    uint64_t v54 = sub_24659E148();
    uint64_t v53 = v34;
    uint64_t v52 = MEMORY[0x263F8EE78];
  }
  __swift_project_boxed_opaque_existential_1(a4, a4[3]);
  if (sub_24659DEC8())
  {
    uint64_t v35 = 0;
    unint64_t v36 = 0;
    unint64_t v37 = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a4, a4[3]);
    uint64_t v35 = sub_24659E148();
    unint64_t v36 = v38;
    unint64_t v37 = MEMORY[0x263F8EE78];
  }
  uint64_t v39 = v67;
  uint64_t v40 = v65;
  v79[0] = v67;
  v79[1] = v65;
  char v41 = v63;
  char v80 = v63;
  uint64_t v42 = swift_allocObject();
  uint64_t v43 = v71;
  *(void *)(v42 + 16) = v70;
  *(void *)(v42 + 24) = v43;
  *(void *)(v42 + 32) = v39;
  *(void *)(v42 + 40) = v40;
  *(unsigned char *)(v42 + 48) = v41;
  unint64_t v51 = v37;
  v50.n128_u64[0] = v35;
  v50.n128_u64[1] = v36;
  *((void *)&v49 + 1) = v53;
  *(void *)&long long v49 = v54;
  uint64_t v44 = v72;
  __n128 v45 = sub_246591B10((uint64_t)v66, v59, v58, 0, MEMORY[0x263F8EE78], v57, v56, 0, v72, v55, v49, 0, v52, v50, 0, v51, v79, (uint64_t)sub_2465994BC, v42,
          v69);
  ((void (*)(uint64_t, void, uint64_t, uint64_t, __n128))v61)(v44, 0, 1, v64, v45);
  sub_246558E9C(v39, v40, v41);
  (*(void (**)(char *, uint64_t, uint64_t))(v73 + 40))(v62, v44, v74);
  uint64_t v47 = v75;
  uint64_t v46 = v76;
  (*(void (**)(uint64_t, char *, uint64_t))(v75 + 16))(v77, v24, v76);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v78);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v24, v46);
}

uint64_t ManagedContentView.body.getter@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v165 = a2;
  long long v171 = a1;
  uint64_t v3 = *((void *)a1 + 2);
  uint64_t v2 = *((void *)a1 + 3);
  uint64_t v4 = type metadata accessor for HeaderManagedAppCell();
  uint64_t v145 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v144 = (uint64_t)&v137 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v151 = (char *)&v137 - v7;
  uint64_t v8 = type metadata accessor for DefaultManagedAppCell();
  uint64_t v172 = v4;
  uint64_t v9 = sub_24659D628();
  uint64_t v152 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v155 = (uint64_t)&v137 - v11;
  uint64_t v150 = *(void *)(v8 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v149 = (uint64_t)&v137 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  long long v159 = (char *)&v137 - v14;
  uint64_t v15 = type metadata accessor for CompactManagedAppCell();
  uint64_t v168 = v8;
  uint64_t v16 = sub_24659D628();
  uint64_t v148 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v147 = (char *)&v137 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF18);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v154 = (uint64_t *)((char *)&v137 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BF10);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v153 = (uint64_t *)((char *)&v137 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v164 = v15;
  uint64_t v143 = *(void *)(v15 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v142 = (uint64_t)&v137 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  long long v146 = (char *)&v137 - v25;
  uint64_t v169 = v16;
  uint64_t v170 = v9;
  uint64_t v26 = sub_24659D628();
  uint64_t v162 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v161 = (char *)&v137 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  long long v160 = (char *)&v137 - v29;
  uint64_t v157 = v3;
  uint64_t v158 = v2;
  uint64_t v30 = type metadata accessor for ManagedAppCellContext();
  uint64_t v31 = sub_24659DFD8();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v137 - v34;
  uint64_t v36 = *(void *)(v30 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v33);
  uint64_t v156 = (char *)&v137 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)&v137 - v39;
  uint64_t v163 = sub_24659D628();
  uint64_t v167 = *(void *)(v163 - 8);
  MEMORY[0x270FA5388](v163);
  uint64_t v42 = (char *)&v137 - v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v35, v166 + v171[9], v31);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v35, 1, v30) == 1)
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v31);
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v44 = swift_getWitnessTable();
    uint64_t v208 = WitnessTable;
    uint64_t v209 = v44;
    uint64_t v45 = swift_getWitnessTable();
    uint64_t v46 = swift_getWitnessTable();
    uint64_t v206 = v44;
    uint64_t v207 = v46;
    uint64_t v47 = swift_getWitnessTable();
    uint64_t v204 = v45;
    uint64_t v205 = v47;
    uint64_t v48 = swift_getWitnessTable();
    sub_246598C30(v48, v26, MEMORY[0x263F1BA08]);
    uint64_t v49 = v165;
    uint64_t v50 = v163;
  }
  else
  {
    long long v141 = v42;
    uint64_t v137 = v26;
    unint64_t v51 = v40;
    uint64_t v52 = v36;
    uint64_t v53 = v51;
    (*(void (**)(void))(v36 + 32))();
    sub_246598DC4(&v195);
    unint64_t v139 = v53;
    uint64_t v140 = v36;
    uint64_t v138 = v30;
    switch(v195)
    {
      case 1:
        uint64_t v103 = (uint64_t)v156;
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v156, v53, v30);
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v105 = v153;
        sub_246560BE4(v153);
        long long v106 = v154;
        sub_246560BF8(v154);
        uint64_t v107 = v149;
        sub_246560C60(v103, KeyPath, 0, (uint64_t)v105, (uint64_t)v106, v149);
        uint64_t v108 = v168;
        uint64_t v109 = swift_getWitnessTable();
        uint64_t v110 = v150;
        long long v111 = *(void (**)(char *, uint64_t, uint64_t))(v150 + 16);
        long long v112 = v159;
        v111(v159, v107, v108);
        long long v113 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
        v113(v107, v108);
        long long v171 = (int *)v113;
        v111((char *)v107, (uint64_t)v112, v108);
        uint64_t v114 = v164;
        uint64_t v115 = swift_getWitnessTable();
        uint64_t v116 = (uint64_t)v147;
        sub_246598C30(v107, v114, v108);
        v113(v107, v108);
        uint64_t v179 = v115;
        uint64_t v180 = v109;
        uint64_t v117 = v169;
        swift_getWitnessTable();
        uint64_t v118 = swift_getWitnessTable();
        uint64_t v177 = v109;
        uint64_t v178 = v118;
        uint64_t v119 = v108;
        swift_getWitnessTable();
        uint64_t v69 = v160;
        sub_246598B38(v116, v117);
        (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v116, v117);
        ((void (*)(char *, uint64_t))v171)(v159, v119);
        break;
      case 2:
        uint64_t v72 = (uint64_t)v156;
        (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v156, v53, v30);
        uint64_t v73 = v144;
        sub_2465821E8(v72, v144);
        uint64_t v74 = v172;
        uint64_t v166 = swift_getWitnessTable();
        uint64_t v75 = v145;
        uint64_t v76 = *(void (**)(char *, uint64_t, uint64_t))(v145 + 16);
        uint64_t v77 = v151;
        v76(v151, v73, v74);
        uint64_t v78 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
        v78(v73, v74);
        long long v171 = (int *)v78;
        v76((char *)v73, (uint64_t)v77, v74);
        uint64_t v79 = v168;
        uint64_t v80 = swift_getWitnessTable();
        uint64_t v81 = v166;
        sub_246598C30(v73, v79, v74);
        v78(v73, v74);
        uint64_t v193 = swift_getWitnessTable();
        uint64_t v194 = v80;
        uint64_t v82 = v169;
        swift_getWitnessTable();
        uint64_t v191 = v80;
        uint64_t v192 = v81;
        uint64_t v83 = v82;
        uint64_t v84 = v170;
        swift_getWitnessTable();
        uint64_t v69 = v160;
        uint64_t v85 = v155;
        sub_246598C30(v155, v83, v84);
        (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v85, v84);
        uint64_t v70 = v151;
        uint64_t v71 = v74;
        goto LABEL_6;
      case 3:
        uint64_t v86 = (uint64_t)v156;
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v156, v53, v30);
        uint64_t v87 = swift_getKeyPath();
        uint64_t v88 = v153;
        sub_246560BE4(v153);
        uint64_t v89 = v154;
        sub_246560BF8(v154);
        uint64_t v90 = v149;
        sub_246560C60(v86, v87, 0, (uint64_t)v88, (uint64_t)v89, v149);
        uint64_t v91 = v168;
        uint64_t v92 = swift_getWitnessTable();
        uint64_t v93 = v150;
        uint64_t v94 = *(void (**)(char *, uint64_t, uint64_t))(v150 + 16);
        long long v95 = v159;
        v94(v159, v90, v91);
        uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
        v96(v90, v91);
        long long v171 = (int *)v96;
        v94((char *)v90, (uint64_t)v95, v91);
        uint64_t v97 = swift_getWitnessTable();
        uint64_t v98 = v155;
        sub_246598B38(v90, v91);
        v96(v90, v91);
        uint64_t v183 = swift_getWitnessTable();
        uint64_t v184 = v92;
        uint64_t v99 = v169;
        swift_getWitnessTable();
        uint64_t v181 = v92;
        uint64_t v182 = v97;
        uint64_t v100 = v91;
        uint64_t v101 = v99;
        uint64_t v102 = v170;
        swift_getWitnessTable();
        uint64_t v69 = v160;
        sub_246598C30(v98, v101, v102);
        (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v98, v102);
        ((void (*)(char *, uint64_t))v171)(v159, v100);
        break;
      default:
        uint64_t v54 = (uint64_t)v156;
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v156, v53, v30);
        uint64_t v55 = swift_getKeyPath();
        uint64_t v56 = v153;
        sub_24658F1EC(v153);
        uint64_t v57 = v154;
        sub_24658F200(v154);
        uint64_t v58 = v142;
        sub_24658F214(v54, v55, 0, (uint64_t)v56, (uint64_t)v57, v142);
        uint64_t v59 = v164;
        uint64_t v166 = swift_getWitnessTable();
        uint64_t v60 = v143;
        __n128 v61 = *(void (**)(char *, uint64_t, uint64_t))(v143 + 16);
        __int16 v62 = v146;
        v61(v146, v58, v59);
        int v63 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
        v63(v58, v59);
        long long v171 = (int *)v63;
        v61((char *)v58, (uint64_t)v62, v59);
        uint64_t v64 = swift_getWitnessTable();
        uint64_t v65 = (uint64_t)v147;
        uint64_t v66 = v166;
        sub_246598B38(v58, v59);
        v63(v58, v59);
        uint64_t v175 = v66;
        uint64_t v176 = v64;
        uint64_t v67 = v169;
        swift_getWitnessTable();
        uint64_t v68 = swift_getWitnessTable();
        uint64_t v173 = v64;
        uint64_t v174 = v68;
        swift_getWitnessTable();
        uint64_t v69 = v160;
        sub_246598B38(v65, v67);
        (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v65, v67);
        uint64_t v70 = v146;
        uint64_t v71 = v59;
LABEL_6:
        ((void (*)(char *, uint64_t))v171)(v70, v71);
        break;
    }
    uint64_t v49 = v165;
    uint64_t v120 = v137;
    uint64_t v50 = v163;
    uint64_t v121 = swift_getWitnessTable();
    uint64_t v122 = swift_getWitnessTable();
    uint64_t v189 = v121;
    uint64_t v190 = v122;
    uint64_t v123 = swift_getWitnessTable();
    uint64_t v124 = swift_getWitnessTable();
    uint64_t v187 = v122;
    uint64_t v188 = v124;
    uint64_t v125 = swift_getWitnessTable();
    uint64_t v185 = v123;
    uint64_t v186 = v125;
    swift_getWitnessTable();
    uint64_t v127 = (uint64_t)v161;
    uint64_t v126 = v162;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v161, v69, v120);
    long long v128 = v69;
    uint64_t v42 = v141;
    sub_246598B38(v127, v120);
    long long v129 = *(void (**)(uint64_t, uint64_t))(v126 + 8);
    v129(v127, v120);
    v129((uint64_t)v128, v120);
    (*(void (**)(char *, uint64_t))(v140 + 8))(v139, v138);
  }
  uint64_t v130 = swift_getWitnessTable();
  uint64_t v131 = swift_getWitnessTable();
  uint64_t v202 = v130;
  uint64_t v203 = v131;
  uint64_t v132 = swift_getWitnessTable();
  uint64_t v133 = swift_getWitnessTable();
  uint64_t v200 = v131;
  uint64_t v201 = v133;
  uint64_t v134 = swift_getWitnessTable();
  uint64_t v198 = v132;
  uint64_t v199 = v134;
  uint64_t v196 = swift_getWitnessTable();
  uint64_t v197 = MEMORY[0x263F1BA00];
  swift_getWitnessTable();
  uint64_t v135 = v167;
  (*(void (**)(uint64_t, char *, uint64_t))(v167 + 16))(v49, v42, v50);
  return (*(uint64_t (**)(char *, uint64_t))(v135 + 8))(v42, v50);
}

uint64_t View.managedContentStyle(_:)()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  swift_release();
  sub_246550978(*(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_24659ADC8()
{
  uint64_t v1 = *(uint64_t (**)(long long *))(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 48);
  long long v4 = *(_OWORD *)(v0 + 32);
  char v5 = v2;
  return v1(&v4);
}

uint64_t sub_24659AE10@<X0>(unsigned char *a1@<X8>)
{
  sub_2465861E0();
  uint64_t result = sub_24659D538();
  *a1 = v3;
  return result;
}

uint64_t sub_24659AE60()
{
  return sub_24659D548();
}

uint64_t sub_24659AEAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24659AEF0()
{
  type metadata accessor for ManagedAppCellContext();
  uint64_t result = sub_24659DFD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24659AF98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(unsigned int *)(v6 + 84);
  uint64_t v9 = v7 & 0xF8 | 7;
  uint64_t v10 = ~v9;
  uint64_t v11 = *(void *)(v6 + 64) + 7;
  if ((v7 & 0x1000F8) != 0
    || (((((((((v11 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8)
     + 16
     + (((v7 & 0xF8) + 16) & ~v9) > 0x18)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v9 + 16) & v10);
LABEL_23:
    swift_retain();
    return a1;
  }
  uint64_t v14 = *(void *)a2;
  char v15 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v15);
  *(void *)a1 = v14;
  *(unsigned char *)(a1 + 8) = v15;
  uint64_t v16 = (const void *)((a2 + 16) & v10);
  if (v8 < 0x7FFFFFFF)
  {
    unint64_t v17 = *(void *)((((unint64_t)v16 + v11) & 0xFFFFFFFFFFFFFFF8) + 24);
    if (v17 >= 0xFFFFFFFF) {
      LODWORD(v17) = -1;
    }
    if (v17 != -1) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (!(*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v16, v8, v5))
  {
LABEL_13:
    (*(void (**)(uint64_t, const void *, uint64_t))(v6 + 16))((a1 + 16) & v10, v16, v5);
    unint64_t v18 = (v11 + ((a1 + 16) & v10)) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v19 = ((unint64_t)v16 + v11) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    char v22 = *(unsigned char *)(v19 + 16);
    sub_246558E8C(*(void *)v19, v21, v22);
    *(void *)unint64_t v18 = v20;
    *(void *)(v18 + 8) = v21;
    *(unsigned char *)(v18 + 16) = v22;
    *(void *)(v18 + 24) = *(void *)(v19 + 24);
    unint64_t v23 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v25 = *(void *)(v24 + 24);
    swift_bridgeObjectRetain();
    if (v25 < 0xFFFFFFFF)
    {
      long long v29 = *(_OWORD *)(v24 + 16);
      *(_OWORD *)unint64_t v23 = *(_OWORD *)v24;
      *(_OWORD *)(v23 + 16) = v29;
    }
    else
    {
      uint64_t v26 = *(void *)v24;
      uint64_t v27 = *(void *)(v24 + 8);
      char v28 = *(unsigned char *)(v24 + 16);
      sub_246558E8C(*(void *)v24, v27, v28);
      *(void *)unint64_t v23 = v26;
      *(void *)(v23 + 8) = v27;
      *(unsigned char *)(v23 + 16) = v28;
      *(void *)(v23 + 24) = *(void *)(v24 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v31 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v31 + 24) < 0xFFFFFFFFuLL)
    {
      long long v35 = *(_OWORD *)(v31 + 16);
      *(_OWORD *)unint64_t v30 = *(_OWORD *)v31;
      *(_OWORD *)(v30 + 16) = v35;
    }
    else
    {
      uint64_t v32 = *(void *)v31;
      uint64_t v33 = *(void *)(v31 + 8);
      char v34 = *(unsigned char *)(v31 + 16);
      sub_246558E8C(*(void *)v31, v33, v34);
      *(void *)unint64_t v30 = v32;
      *(void *)(v30 + 8) = v33;
      *(unsigned char *)(v30 + 16) = v34;
      *(void *)(v30 + 24) = *(void *)(v31 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v36 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v37 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v37 + 24) < 0xFFFFFFFFuLL)
    {
      long long v41 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)unint64_t v36 = *(_OWORD *)v37;
      *(_OWORD *)(v36 + 16) = v41;
    }
    else
    {
      uint64_t v38 = *(void *)v37;
      uint64_t v39 = *(void *)(v37 + 8);
      char v40 = *(unsigned char *)(v37 + 16);
      sub_246558E8C(*(void *)v37, v39, v40);
      *(void *)unint64_t v36 = v38;
      *(void *)(v36 + 8) = v39;
      *(unsigned char *)(v36 + 16) = v40;
      *(void *)(v36 + 24) = *(void *)(v37 + 24);
      swift_bridgeObjectRetain();
    }
    unint64_t v42 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v43 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v44 = *(void *)v43;
    uint64_t v45 = *(void *)(v43 + 8);
    char v46 = *(unsigned char *)(v43 + 16);
    sub_246558E9C(*(void *)v43, v45, v46);
    *(void *)unint64_t v42 = v44;
    *(void *)(v42 + 8) = v45;
    *(unsigned char *)(v42 + 16) = v46;
    uint64_t v47 = (void *)((v36 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v48 = (void *)((v37 + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v49 = v48[1];
    *uint64_t v47 = *v48;
    v47[1] = v49;
    goto LABEL_23;
  }
LABEL_9:
  memcpy((void *)((a1 + 16) & v10), v16, (((((((((v11 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
  return a1;
}

uint64_t sub_24659B2D8(uint64_t a1, uint64_t a2)
{
  sub_246552EF4(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  uint64_t v7 = (a1 + v6 + 9) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  if (*(_DWORD *)(v5 + 84) >= 0x7FFFFFFFu)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v5 + 48))(v7);
    if (result) {
      return result;
    }
    goto LABEL_7;
  }
  unint64_t v10 = *(void *)(((v8 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  uint64_t result = (v10 + 1);
  if (v10 == -1)
  {
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
    unint64_t v11 = (v8 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    sub_24655947C(*(void *)v11, *(void *)(v11 + 8), *(unsigned char *)(v11 + 16));
    swift_bridgeObjectRelease();
    unint64_t v12 = (v11 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v12 + 24) >= 0xFFFFFFFFuLL)
    {
      sub_24655947C(*(void *)v12, *(void *)(v12 + 8), *(unsigned char *)(v12 + 16));
      swift_bridgeObjectRelease();
    }
    unint64_t v13 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v13 + 24) >= 0xFFFFFFFFuLL)
    {
      sub_24655947C(*(void *)v13, *(void *)(v13 + 8), *(unsigned char *)(v13 + 16));
      swift_bridgeObjectRelease();
    }
    unint64_t v14 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      sub_24655947C(*(void *)v14, *(void *)(v14 + 8), *(unsigned char *)(v14 + 16));
      swift_bridgeObjectRelease();
    }
    sub_246550978(*(void *)((v14 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v14 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v14 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
    return swift_release();
  }
  return result;
}

uint64_t sub_24659B4BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80) & 0xF8;
  uint64_t v11 = v10 + 16;
  unint64_t v12 = ~v10 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (void *)((v11 + a1) & v12);
  unint64_t v14 = (const void *)((v11 + a2) & v12);
  uint64_t v15 = *(void *)(v9 + 64) + 7;
  if (*(_DWORD *)(v9 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v16 = *(void *)((((unint64_t)v14 + v15) & 0xFFFFFFFFFFFFFFF8) + 24);
    if (v16 >= 0xFFFFFFFF) {
      LODWORD(v16) = -1;
    }
    if (v16 != -1) {
      goto LABEL_3;
    }
  }
  else if ((*(unsigned int (**)(const void *))(v9 + 48))(v14))
  {
LABEL_3:
    memcpy(v13, v14, (((((((((v15 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v13, v14, v8);
  unint64_t v17 = ((unint64_t)v13 + v15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = ((unint64_t)v14 + v15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  uint64_t v20 = *(void *)(v18 + 8);
  char v21 = *(unsigned char *)(v18 + 16);
  sub_246558E8C(*(void *)v18, v20, v21);
  *(void *)unint64_t v17 = v19;
  *(void *)(v17 + 8) = v20;
  *(unsigned char *)(v17 + 16) = v21;
  *(void *)(v17 + 24) = *(void *)(v18 + 24);
  unint64_t v22 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = *(void *)(v23 + 24);
  swift_bridgeObjectRetain();
  if (v24 < 0xFFFFFFFF)
  {
    long long v28 = *(_OWORD *)(v23 + 16);
    *(_OWORD *)unint64_t v22 = *(_OWORD *)v23;
    *(_OWORD *)(v22 + 16) = v28;
  }
  else
  {
    uint64_t v25 = *(void *)v23;
    uint64_t v26 = *(void *)(v23 + 8);
    char v27 = *(unsigned char *)(v23 + 16);
    sub_246558E8C(*(void *)v23, v26, v27);
    *(void *)unint64_t v22 = v25;
    *(void *)(v22 + 8) = v26;
    *(unsigned char *)(v22 + 16) = v27;
    *(void *)(v22 + 24) = *(void *)(v23 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v29 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v30 + 24) < 0xFFFFFFFFuLL)
  {
    long long v34 = *(_OWORD *)(v30 + 16);
    *(_OWORD *)unint64_t v29 = *(_OWORD *)v30;
    *(_OWORD *)(v29 + 16) = v34;
  }
  else
  {
    uint64_t v31 = *(void *)v30;
    uint64_t v32 = *(void *)(v30 + 8);
    char v33 = *(unsigned char *)(v30 + 16);
    sub_246558E8C(*(void *)v30, v32, v33);
    *(void *)unint64_t v29 = v31;
    *(void *)(v29 + 8) = v32;
    *(unsigned char *)(v29 + 16) = v33;
    *(void *)(v29 + 24) = *(void *)(v30 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v35 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v36 + 24) < 0xFFFFFFFFuLL)
  {
    long long v40 = *(_OWORD *)(v36 + 16);
    *(_OWORD *)unint64_t v35 = *(_OWORD *)v36;
    *(_OWORD *)(v35 + 16) = v40;
  }
  else
  {
    uint64_t v37 = *(void *)v36;
    uint64_t v38 = *(void *)(v36 + 8);
    char v39 = *(unsigned char *)(v36 + 16);
    sub_246558E8C(*(void *)v36, v38, v39);
    *(void *)unint64_t v35 = v37;
    *(void *)(v35 + 8) = v38;
    *(unsigned char *)(v35 + 16) = v39;
    *(void *)(v35 + 24) = *(void *)(v36 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v41 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v43 = *(void *)v42;
  uint64_t v44 = *(void *)(v42 + 8);
  char v45 = *(unsigned char *)(v42 + 16);
  sub_246558E9C(*(void *)v42, v44, v45);
  *(void *)unint64_t v41 = v43;
  *(void *)(v41 + 8) = v44;
  *(unsigned char *)(v41 + 16) = v45;
  char v46 = (void *)((v35 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v47 = (void *)((v36 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v48 = v47[1];
  *char v46 = *v47;
  v46[1] = v48;
  swift_retain();
  return a1;
}

uint64_t sub_24659B7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_246552D38(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  uint64_t v13 = *(_DWORD *)(v11 + 80) & 0xF8;
  uint64_t v14 = v13 + 16;
  unint64_t v15 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (void *)((v14 + a1) & v15);
  unint64_t v17 = (void *)((v14 + a2) & v15);
  uint64_t v18 = *(void *)(v11 + 64) + 7;
  size_t v19 = (((((((((v18 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v12 >= 0x7FFFFFFF)
  {
    uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
    unint64_t v21 = (v14 + a1) & v15;
    int v22 = v20(v16, v12, v10);
    int v23 = v20(v17, v12, v10);
    unint64_t v16 = (void *)v21;
    size_t v19 = (((((((((v18 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
          + 63) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    if (v22) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v26 = ((unint64_t)v16 + v18) & 0xFFFFFFFFFFFFFFF8;
    if (v23)
    {
      char v27 = v16;
      (*(void (**)(void *, uint64_t))(v11 + 8))(v16, v10);
      sub_24655947C(*(void *)v26, *(void *)(v26 + 8), *(unsigned char *)(v26 + 16));
      swift_bridgeObjectRelease();
      unint64_t v28 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)(v28 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_24655947C(*(void *)v28, *(void *)(v28 + 8), *(unsigned char *)(v28 + 16));
        swift_bridgeObjectRelease();
      }
      unint64_t v29 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)(v29 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_24655947C(*(void *)v29, *(void *)(v29 + 8), *(unsigned char *)(v29 + 16));
        swift_bridgeObjectRelease();
      }
      unint64_t v30 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)(v30 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_24655947C(*(void *)v30, *(void *)(v30 + 8), *(unsigned char *)(v30 + 16));
        swift_bridgeObjectRelease();
      }
      sub_246550978(*(void *)((v30 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v30 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v30 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
      swift_release();
      unint64_t v24 = v27;
      goto LABEL_16;
    }
    (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v16, v17, v10);
    unint64_t v43 = ((unint64_t)v17 + v18) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v44 = *(void *)v43;
    uint64_t v45 = *(void *)(v43 + 8);
    char v46 = *(unsigned char *)(v43 + 16);
    sub_246558E8C(*(void *)v43, v45, v46);
    uint64_t v47 = *(void *)v26;
    uint64_t v48 = *(void *)(v26 + 8);
    char v49 = *(unsigned char *)(v26 + 16);
    *(void *)unint64_t v26 = v44;
    *(void *)(v26 + 8) = v45;
    *(unsigned char *)(v26 + 16) = v46;
    sub_24655947C(v47, v48, v49);
    *(void *)(v26 + 24) = *(void *)(v43 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v50 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v51 = (v43 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v52 = *(void *)(v51 + 24);
    if (*(void *)(v50 + 24) < 0xFFFFFFFFuLL)
    {
      if (v52 >= 0xFFFFFFFF)
      {
        uint64_t v80 = *(void *)v51;
        uint64_t v81 = *(void *)(v51 + 8);
        char v82 = *(unsigned char *)(v51 + 16);
        sub_246558E8C(*(void *)v51, v81, v82);
        *(void *)unint64_t v50 = v80;
        *(void *)(v50 + 8) = v81;
        *(unsigned char *)(v50 + 16) = v82;
        *(void *)(v50 + 24) = *(void *)(v51 + 24);
        swift_bridgeObjectRetain();
        goto LABEL_34;
      }
    }
    else
    {
      if (v52 >= 0xFFFFFFFF)
      {
        uint64_t v53 = *(void *)v51;
        uint64_t v54 = *(void *)(v51 + 8);
        char v55 = *(unsigned char *)(v51 + 16);
        sub_246558E8C(*(void *)v51, v54, v55);
        uint64_t v56 = *(void *)v50;
        uint64_t v57 = *(void *)(v50 + 8);
        char v58 = *(unsigned char *)(v50 + 16);
        *(void *)unint64_t v50 = v53;
        *(void *)(v50 + 8) = v54;
        *(unsigned char *)(v50 + 16) = v55;
        sub_24655947C(v56, v57, v58);
        *(void *)(v50 + 24) = *(void *)(v51 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      sub_24655947C(*(void *)v50, *(void *)(v50 + 8), *(unsigned char *)(v50 + 16));
      swift_bridgeObjectRelease();
    }
    long long v83 = *(_OWORD *)(v51 + 16);
    *(_OWORD *)unint64_t v50 = *(_OWORD *)v51;
    *(_OWORD *)(v50 + 16) = v83;
LABEL_34:
    unint64_t v84 = (v50 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v85 = (v51 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v86 = *(void *)(v85 + 24);
    if (*(void *)(v84 + 24) < 0xFFFFFFFFuLL)
    {
      if (v86 >= 0xFFFFFFFF)
      {
        uint64_t v93 = *(void *)v85;
        uint64_t v94 = *(void *)(v85 + 8);
        char v95 = *(unsigned char *)(v85 + 16);
        sub_246558E8C(*(void *)v85, v94, v95);
        *(void *)unint64_t v84 = v93;
        *(void *)(v84 + 8) = v94;
        *(unsigned char *)(v84 + 16) = v95;
        *(void *)(v84 + 24) = *(void *)(v85 + 24);
        swift_bridgeObjectRetain();
        goto LABEL_41;
      }
    }
    else
    {
      if (v86 >= 0xFFFFFFFF)
      {
        uint64_t v87 = *(void *)v85;
        uint64_t v88 = *(void *)(v85 + 8);
        char v89 = *(unsigned char *)(v85 + 16);
        sub_246558E8C(*(void *)v85, v88, v89);
        uint64_t v90 = *(void *)v84;
        uint64_t v91 = *(void *)(v84 + 8);
        char v92 = *(unsigned char *)(v84 + 16);
        *(void *)unint64_t v84 = v87;
        *(void *)(v84 + 8) = v88;
        *(unsigned char *)(v84 + 16) = v89;
        sub_24655947C(v90, v91, v92);
        *(void *)(v84 + 24) = *(void *)(v85 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_41;
      }
      sub_24655947C(*(void *)v84, *(void *)(v84 + 8), *(unsigned char *)(v84 + 16));
      swift_bridgeObjectRelease();
    }
    long long v96 = *(_OWORD *)(v85 + 16);
    *(_OWORD *)unint64_t v84 = *(_OWORD *)v85;
    *(_OWORD *)(v84 + 16) = v96;
LABEL_41:
    unint64_t v97 = (v84 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v98 = (v85 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v99 = *(void *)(v98 + 24);
    if (*(void *)(v97 + 24) < 0xFFFFFFFFuLL)
    {
      if (v99 >= 0xFFFFFFFF)
      {
        uint64_t v106 = *(void *)v98;
        uint64_t v107 = *(void *)(v98 + 8);
        char v108 = *(unsigned char *)(v98 + 16);
        sub_246558E8C(*(void *)v98, v107, v108);
        *(void *)unint64_t v97 = v106;
        *(void *)(v97 + 8) = v107;
        *(unsigned char *)(v97 + 16) = v108;
        *(void *)(v97 + 24) = *(void *)(v98 + 24);
        swift_bridgeObjectRetain();
        goto LABEL_48;
      }
    }
    else
    {
      if (v99 >= 0xFFFFFFFF)
      {
        uint64_t v100 = *(void *)v98;
        uint64_t v101 = *(void *)(v98 + 8);
        char v102 = *(unsigned char *)(v98 + 16);
        sub_246558E8C(*(void *)v98, v101, v102);
        uint64_t v103 = *(void *)v97;
        uint64_t v104 = *(void *)(v97 + 8);
        char v105 = *(unsigned char *)(v97 + 16);
        *(void *)unint64_t v97 = v100;
        *(void *)(v97 + 8) = v101;
        *(unsigned char *)(v97 + 16) = v102;
        sub_24655947C(v103, v104, v105);
        *(void *)(v97 + 24) = *(void *)(v98 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
LABEL_48:
        unint64_t v110 = (v97 + 39) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v111 = (v98 + 39) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v112 = *(void *)v111;
        uint64_t v113 = *(void *)(v111 + 8);
        char v114 = *(unsigned char *)(v111 + 16);
        sub_246558E9C(*(void *)v111, v113, v114);
        uint64_t v115 = *(void *)v110;
        uint64_t v116 = *(void *)(v110 + 8);
        *(void *)unint64_t v110 = v112;
        *(void *)(v110 + 8) = v113;
        char v117 = *(unsigned char *)(v110 + 16);
        *(unsigned char *)(v110 + 16) = v114;
        sub_246550978(v115, v116, v117);
        uint64_t v118 = (void *)((v97 + 63) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v119 = (void *)((v98 + 63) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v120 = v119[1];
        void *v118 = *v119;
        v118[1] = v120;
        swift_retain();
        swift_release();
        return a1;
      }
      sub_24655947C(*(void *)v97, *(void *)(v97 + 8), *(unsigned char *)(v97 + 16));
      swift_bridgeObjectRelease();
    }
    long long v109 = *(_OWORD *)(v98 + 16);
    *(_OWORD *)unint64_t v97 = *(_OWORD *)v98;
    *(_OWORD *)(v97 + 16) = v109;
    goto LABEL_48;
  }
  unint64_t v25 = *(void *)((((unint64_t)v17 + v18) & 0xFFFFFFFFFFFFFFF8) + 24);
  if (v25 >= 0xFFFFFFFF) {
    LODWORD(v25) = -1;
  }
  int v23 = v25 + 1;
  if (*(void *)((((unint64_t)v16 + v18) & 0xFFFFFFFFFFFFFFF8) + 24) >= 0xFFFFFFFFuLL) {
    goto LABEL_8;
  }
LABEL_3:
  if (v23)
  {
    unint64_t v24 = v16;
LABEL_16:
    memcpy(v24, v17, v19);
    return a1;
  }
  uint64_t v31 = v16;
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v16, v17, v10);
  unint64_t v32 = ((unint64_t)v31 + v18) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = ((unint64_t)v17 + v18) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = *(void *)v33;
  uint64_t v35 = *(void *)(v33 + 8);
  char v36 = *(unsigned char *)(v33 + 16);
  sub_246558E8C(*(void *)v33, v35, v36);
  *(void *)unint64_t v32 = v34;
  *(void *)(v32 + 8) = v35;
  *(unsigned char *)(v32 + 16) = v36;
  *(void *)(v32 + 24) = *(void *)(v33 + 24);
  unint64_t v37 = (v32 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (v33 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v39 = *(void *)(v38 + 24);
  swift_bridgeObjectRetain();
  if (v39 < 0xFFFFFFFF)
  {
    long long v59 = *(_OWORD *)(v38 + 16);
    *(_OWORD *)unint64_t v37 = *(_OWORD *)v38;
    *(_OWORD *)(v37 + 16) = v59;
  }
  else
  {
    uint64_t v40 = *(void *)v38;
    uint64_t v41 = *(void *)(v38 + 8);
    char v42 = *(unsigned char *)(v38 + 16);
    sub_246558E8C(*(void *)v38, v41, v42);
    *(void *)unint64_t v37 = v40;
    *(void *)(v37 + 8) = v41;
    *(unsigned char *)(v37 + 16) = v42;
    *(void *)(v37 + 24) = *(void *)(v38 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v60 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v61 = (v38 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v61 + 24) < 0xFFFFFFFFuLL)
  {
    long long v65 = *(_OWORD *)(v61 + 16);
    *(_OWORD *)unint64_t v60 = *(_OWORD *)v61;
    *(_OWORD *)(v60 + 16) = v65;
  }
  else
  {
    uint64_t v62 = *(void *)v61;
    uint64_t v63 = *(void *)(v61 + 8);
    char v64 = *(unsigned char *)(v61 + 16);
    sub_246558E8C(*(void *)v61, v63, v64);
    *(void *)unint64_t v60 = v62;
    *(void *)(v60 + 8) = v63;
    *(unsigned char *)(v60 + 16) = v64;
    *(void *)(v60 + 24) = *(void *)(v61 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v66 = (v60 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v67 = (v61 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)(v67 + 24) < 0xFFFFFFFFuLL)
  {
    long long v71 = *(_OWORD *)(v67 + 16);
    *(_OWORD *)unint64_t v66 = *(_OWORD *)v67;
    *(_OWORD *)(v66 + 16) = v71;
  }
  else
  {
    uint64_t v68 = *(void *)v67;
    uint64_t v69 = *(void *)(v67 + 8);
    char v70 = *(unsigned char *)(v67 + 16);
    sub_246558E8C(*(void *)v67, v69, v70);
    *(void *)unint64_t v66 = v68;
    *(void *)(v66 + 8) = v69;
    *(unsigned char *)(v66 + 16) = v70;
    *(void *)(v66 + 24) = *(void *)(v67 + 24);
    swift_bridgeObjectRetain();
  }
  unint64_t v72 = (v66 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v73 = (v67 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v74 = *(void *)v73;
  uint64_t v75 = *(void *)(v73 + 8);
  char v76 = *(unsigned char *)(v73 + 16);
  sub_246558E9C(*(void *)v73, v75, v76);
  *(void *)unint64_t v72 = v74;
  *(void *)(v72 + 8) = v75;
  *(unsigned char *)(v72 + 16) = v76;
  uint64_t v77 = (void *)((v66 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v78 = (void *)((v67 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v79 = v78[1];
  void *v77 = *v78;
  v77[1] = v79;
  swift_retain();
  return a1;
}

uint64_t sub_24659BF58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v7 = v6 + 16;
  unint64_t v8 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  char v9 = (void *)((v7 + a1) & v8);
  uint64_t v10 = (const void *)((v7 + a2) & v8);
  uint64_t v11 = *(void *)(v5 + 64) + 7;
  if (*(_DWORD *)(v5 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v12 = *(void *)((((unint64_t)v10 + v11) & 0xFFFFFFFFFFFFFFF8) + 24);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    if (v12 != -1) {
      goto LABEL_3;
    }
LABEL_7:
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v9, v10, v4);
    uint64_t v13 = (_OWORD *)(((unint64_t)v9 + v11) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = (_OWORD *)(((unint64_t)v10 + v11) & 0xFFFFFFFFFFFFFFF8);
    long long v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    unint64_t v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v18 = v17[1];
    *unint64_t v16 = *v17;
    v16[1] = v18;
    size_t v19 = (_OWORD *)(((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v20 = (_OWORD *)(((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v21 = v20[1];
    *size_t v19 = *v20;
    v19[1] = v21;
    int v22 = (_OWORD *)(((unint64_t)v19 + 39) & 0xFFFFFFFFFFFFFFF8);
    int v23 = (_OWORD *)(((unint64_t)v20 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v24 = v23[1];
    *int v22 = *v23;
    v22[1] = v24;
    unint64_t v25 = ((unint64_t)v22 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = ((unint64_t)v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    char v27 = *(unsigned char *)(v26 + 16);
    *(_OWORD *)unint64_t v25 = *(_OWORD *)v26;
    *(unsigned char *)(v25 + 16) = v27;
    *(_OWORD *)(((unint64_t)v22 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v23 + 63) & 0xFFFFFFFFFFFFFFF8);
    return a1;
  }
  if (!(*(unsigned int (**)(const void *))(v5 + 48))(v10)) {
    goto LABEL_7;
  }
LABEL_3:
  memcpy(v9, v10, (((((((((v11 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
  return a1;
}

uint64_t sub_24659C148(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_246552EF4(v8, v9);
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  uint64_t v13 = *(_DWORD *)(v11 + 80) & 0xF8;
  uint64_t v14 = v13 + 16;
  unint64_t v15 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (void *)((v14 + a1) & v15);
  unint64_t v17 = (void *)(((unint64_t)a2 + v14) & v15);
  uint64_t v18 = *(void *)(v11 + 64) + 7;
  size_t v19 = (((((((((v18 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v12 < 0x7FFFFFFF)
  {
    unint64_t v25 = *(void *)((((unint64_t)v17 + v18) & 0xFFFFFFFFFFFFFFF8) + 24);
    if (v25 >= 0xFFFFFFFF) {
      LODWORD(v25) = -1;
    }
    int v23 = v25 + 1;
    if (*(void *)((((unint64_t)v16 + v18) & 0xFFFFFFFFFFFFFFF8) + 24) < 0xFFFFFFFFuLL) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v26 = ((unint64_t)v16 + v18) & 0xFFFFFFFFFFFFFFF8;
    if (v23)
    {
      char v27 = v16;
      (*(void (**)(void *, uint64_t))(v11 + 8))(v16, v10);
      sub_24655947C(*(void *)v26, *(void *)(v26 + 8), *(unsigned char *)(v26 + 16));
      swift_bridgeObjectRelease();
      unint64_t v28 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)(v28 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_24655947C(*(void *)v28, *(void *)(v28 + 8), *(unsigned char *)(v28 + 16));
        swift_bridgeObjectRelease();
      }
      unint64_t v29 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)(v29 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_24655947C(*(void *)v29, *(void *)(v29 + 8), *(unsigned char *)(v29 + 16));
        swift_bridgeObjectRelease();
      }
      unint64_t v30 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)(v30 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_24655947C(*(void *)v30, *(void *)(v30 + 8), *(unsigned char *)(v30 + 16));
        swift_bridgeObjectRelease();
      }
      sub_246550978(*(void *)((v30 + 39) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v30 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(((v30 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
      swift_release();
      long long v24 = v27;
      goto LABEL_16;
    }
    (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v16, v17, v10);
    unint64_t v47 = ((unint64_t)v17 + v18) & 0xFFFFFFFFFFFFFFF8;
    char v48 = *(unsigned char *)(v47 + 16);
    uint64_t v49 = *(void *)v26;
    uint64_t v50 = *(void *)(v26 + 8);
    char v51 = *(unsigned char *)(v26 + 16);
    *(_OWORD *)unint64_t v26 = *(_OWORD *)v47;
    *(unsigned char *)(v26 + 16) = v48;
    sub_24655947C(v49, v50, v51);
    *(void *)(v26 + 24) = *(void *)(v47 + 24);
    swift_bridgeObjectRelease();
    unint64_t v52 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v53 = (v47 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v52 + 24) >= 0xFFFFFFFFuLL)
    {
      if (*(void *)(v53 + 24) >= 0xFFFFFFFFuLL)
      {
        char v54 = *(unsigned char *)(v53 + 16);
        uint64_t v55 = *(void *)v52;
        uint64_t v56 = *(void *)(v52 + 8);
        char v57 = *(unsigned char *)(v52 + 16);
        *(_OWORD *)unint64_t v52 = *(_OWORD *)v53;
        *(unsigned char *)(v52 + 16) = v54;
        sub_24655947C(v55, v56, v57);
        *(void *)(v52 + 24) = *(void *)(v53 + 24);
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      sub_24655947C(*(void *)v52, *(void *)(v52 + 8), *(unsigned char *)(v52 + 16));
      swift_bridgeObjectRelease();
    }
    long long v58 = *(_OWORD *)(v53 + 16);
    *(_OWORD *)unint64_t v52 = *(_OWORD *)v53;
    *(_OWORD *)(v52 + 16) = v58;
LABEL_23:
    unint64_t v59 = (v52 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v60 = (v53 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v59 + 24) >= 0xFFFFFFFFuLL)
    {
      if (*(void *)(v60 + 24) >= 0xFFFFFFFFuLL)
      {
        char v61 = *(unsigned char *)(v60 + 16);
        uint64_t v62 = *(void *)v59;
        uint64_t v63 = *(void *)(v59 + 8);
        char v64 = *(unsigned char *)(v59 + 16);
        *(_OWORD *)unint64_t v59 = *(_OWORD *)v60;
        *(unsigned char *)(v59 + 16) = v61;
        sub_24655947C(v62, v63, v64);
        *(void *)(v59 + 24) = *(void *)(v60 + 24);
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      sub_24655947C(*(void *)v59, *(void *)(v59 + 8), *(unsigned char *)(v59 + 16));
      swift_bridgeObjectRelease();
    }
    long long v65 = *(_OWORD *)(v60 + 16);
    *(_OWORD *)unint64_t v59 = *(_OWORD *)v60;
    *(_OWORD *)(v59 + 16) = v65;
LABEL_28:
    unint64_t v66 = (v59 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v67 = (v60 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)(v66 + 24) >= 0xFFFFFFFFuLL)
    {
      if (*(void *)(v67 + 24) >= 0xFFFFFFFFuLL)
      {
        char v68 = *(unsigned char *)(v67 + 16);
        uint64_t v69 = *(void *)v66;
        uint64_t v70 = *(void *)(v66 + 8);
        char v71 = *(unsigned char *)(v66 + 16);
        *(_OWORD *)unint64_t v66 = *(_OWORD *)v67;
        *(unsigned char *)(v66 + 16) = v68;
        sub_24655947C(v69, v70, v71);
        *(void *)(v66 + 24) = *(void *)(v67 + 24);
        swift_bridgeObjectRelease();
LABEL_33:
        unint64_t v73 = (v66 + 39) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v74 = (v67 + 39) & 0xFFFFFFFFFFFFFFF8;
        char v75 = *(unsigned char *)(v74 + 16);
        uint64_t v76 = *(void *)v73;
        uint64_t v77 = *(void *)(v73 + 8);
        *(_OWORD *)unint64_t v73 = *(_OWORD *)v74;
        char v78 = *(unsigned char *)(v73 + 16);
        *(unsigned char *)(v73 + 16) = v75;
        sub_246550978(v76, v77, v78);
        *(_OWORD *)((v66 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v67 + 63) & 0xFFFFFFFFFFFFFFF8);
        swift_release();
        return a1;
      }
      sub_24655947C(*(void *)v66, *(void *)(v66 + 8), *(unsigned char *)(v66 + 16));
      swift_bridgeObjectRelease();
    }
    long long v72 = *(_OWORD *)(v67 + 16);
    *(_OWORD *)unint64_t v66 = *(_OWORD *)v67;
    *(_OWORD *)(v66 + 16) = v72;
    goto LABEL_33;
  }
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  unint64_t v21 = (v14 + a1) & v15;
  int v22 = v20(v16, v12, v10);
  int v23 = v20(v17, v12, v10);
  unint64_t v16 = (void *)v21;
  size_t v19 = (((((((((v18 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (!v22) {
    goto LABEL_8;
  }
LABEL_3:
  if (!v23)
  {
    uint64_t v31 = v16;
    (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v16, v17, v10);
    unint64_t v32 = (_OWORD *)(((unint64_t)v31 + v18) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v33 = (_OWORD *)(((unint64_t)v17 + v18) & 0xFFFFFFFFFFFFFFF8);
    long long v34 = v33[1];
    *unint64_t v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = (_OWORD *)(((unint64_t)v32 + 39) & 0xFFFFFFFFFFFFFFF8);
    char v36 = (_OWORD *)(((unint64_t)v33 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    unint64_t v38 = (_OWORD *)(((unint64_t)v35 + 39) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v39 = (_OWORD *)(((unint64_t)v36 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v40 = v39[1];
    *unint64_t v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = (_OWORD *)(((unint64_t)v38 + 39) & 0xFFFFFFFFFFFFFFF8);
    char v42 = (_OWORD *)(((unint64_t)v39 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v43 = v42[1];
    *uint64_t v41 = *v42;
    v41[1] = v43;
    unint64_t v44 = ((unint64_t)v41 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v45 = ((unint64_t)v42 + 39) & 0xFFFFFFFFFFFFFFF8;
    char v46 = *(unsigned char *)(v45 + 16);
    *(_OWORD *)unint64_t v44 = *(_OWORD *)v45;
    *(unsigned char *)(v44 + 16) = v46;
    *(_OWORD *)(((unint64_t)v41 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v42 + 63) & 0xFFFFFFFFFFFFFFF8);
    return a1;
  }
  long long v24 = v16;
LABEL_16:
  memcpy(v24, v17, v19);
  return a1;
}

uint64_t sub_24659C6B4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    int v6 = 0x7FFFFFFF;
  }
  else {
    int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v7 = *(_DWORD *)(v4 + 80) & 0xF8;
  uint64_t v8 = v7 | 7;
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  unsigned int v10 = a2 - (v6 - 1);
  if (a2 <= v6 - 1) {
    goto LABEL_19;
  }
  unint64_t v11 = ((v7 + 16) & ~v8)
      + (((((((((v9 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  int v12 = v11;
  if (v11) {
    goto LABEL_7;
  }
  unsigned int v15 = v10 + 1;
  if (HIWORD(v15))
  {
    int v13 = *(_DWORD *)((char *)a1 + v11);
    if (v13) {
      goto LABEL_15;
    }
LABEL_19:
    uint64_t v17 = ((unint64_t)a1 + v8 + 9) & ~v8;
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v19 = *(void *)(((v9 + v17) & 0xFFFFFFFFFFFFFFF8) + 24);
      if (v19 >= 0xFFFFFFFF) {
        LODWORD(v19) = -1;
      }
      unsigned int v18 = v19 + 1;
    }
    else
    {
      unsigned int v18 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v17);
    }
    if (v18 >= 2) {
      return v18 - 1;
    }
    else {
      return 0;
    }
  }
  if (v15 > 0xFF)
  {
    int v13 = *(unsigned __int16 *)((char *)a1 + v11);
    if (*(_WORD *)((char *)a1 + v11)) {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (v15 < 2) {
    goto LABEL_19;
  }
LABEL_7:
  int v13 = *((unsigned __int8 *)a1 + v11);
  if (!*((unsigned char *)a1 + v11)) {
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v16 = v13 - 1;
  if (v11)
  {
    unsigned int v16 = 0;
    int v12 = *a1;
  }
  return (v12 | v16) + v6;
}

void sub_24659C840(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  unsigned int v9 = v8 - 1;
  uint64_t v10 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v11 = v10 | 7;
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7;
  unint64_t v13 = (((((((((v12 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  uint64_t v14 = (v10 + 16) & ~(v10 | 7);
  unint64_t v15 = v13 + v14;
  BOOL v16 = a3 >= v8 - 1;
  unsigned int v17 = a3 - (v8 - 1);
  if (v17 == 0 || !v16)
  {
    int v18 = 0;
    if (v9 < a2)
    {
LABEL_10:
      unsigned int v19 = a2 - v8;
      if (v15)
      {
        bzero(a1, v13 + v14);
        *(_DWORD *)a1 = v19;
        LOWORD(v20) = 1;
        if (!v18) {
          return;
        }
LABEL_34:
        if (v18 == 2) {
          *(_WORD *)&a1[v15] = v20;
        }
        else {
          a1[v15] = v20;
        }
        return;
      }
LABEL_33:
      int v20 = (v19 >> (8 * v15)) + 1;
      if (!v18) {
        return;
      }
      goto LABEL_34;
    }
    goto LABEL_17;
  }
  if (v15)
  {
    int v18 = 1;
    if (v9 < a2) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  unsigned int v21 = v17 + 1;
  if (HIWORD(v21))
  {
    if (v9 < a2)
    {
      *(_DWORD *)&a1[v15] = a2 - v8 + 1;
      return;
    }
    *(_DWORD *)&a1[v15] = 0;
    goto LABEL_19;
  }
  if (v21 < 0x100)
  {
    int v18 = v21 > 1;
    if (v9 < a2)
    {
      unsigned int v19 = a2 - v8;
      goto LABEL_33;
    }
LABEL_17:
    if (v18) {
      a1[v15] = 0;
    }
    goto LABEL_19;
  }
  if (v9 < a2)
  {
    unsigned int v19 = a2 - v8;
    int v18 = 2;
    goto LABEL_33;
  }
  *(_WORD *)&a1[v15] = 0;
LABEL_19:
  if (a2)
  {
    int v22 = (_DWORD *)((unint64_t)&a1[v11 + 9] & ~v11);
    if (v9 >= a2 && a2 + 1 <= v8)
    {
      if (a2 != -1)
      {
        if (v7 < 0x7FFFFFFF)
        {
          char v27 = (void *)(((unint64_t)v22 + v12) & 0xFFFFFFFFFFFFFFF8);
          if (((a2 + 1) & 0x80000000) != 0)
          {
            v27[2] = 0;
            v27[3] = 0;
            *char v27 = a2 - 0x7FFFFFFF;
            v27[1] = 0;
          }
          else
          {
            v27[3] = a2;
          }
        }
        else
        {
          long long v24 = *(void (**)(unint64_t, uint64_t))(v6 + 56);
          unint64_t v25 = (unint64_t)&a1[v11 + 9] & ~v11;
          uint64_t v26 = a2 + 1;
          v24(v25, v26);
        }
      }
    }
    else if ((((((((((v12 & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      unsigned int v23 = a2 - v8;
      bzero(v22, (((((((((v12 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *int v22 = v23;
    }
  }
}

uint64_t sub_24659CA98()
{
  return swift_getWitnessTable();
}

uint64_t sub_24659CC34()
{
  return swift_getWitnessTable();
}

unint64_t sub_24659CCA4()
{
  unint64_t result = qword_268F8CC80;
  if (!qword_268F8CC80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8CC78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8CC80);
  }
  return result;
}

uint64_t sub_24659CD00()
{
  sub_24656ACF8();

  return sub_24659D538();
}

ValueMetadata *type metadata accessor for ManagedContentStyleEnvironmentKey()
{
  return &type metadata for ManagedContentStyleEnvironmentKey;
}

void sub_24659CD58(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24659CD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_24657740C();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_24659CDC8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24659CDD8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24659CDE8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24659CDF8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24659CE08()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24659CE18()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24659CE28()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_24659CE38()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24659CE48()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24659CE58()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24659CE68()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24659CE78()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24659CE88()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24659CE98()
{
  return MEMORY[0x270EEB958]();
}

uint64_t sub_24659CEA8()
{
  return MEMORY[0x270EEB968]();
}

uint64_t sub_24659CEB8()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_24659CEC8()
{
  return MEMORY[0x270EEB9A8]();
}

uint64_t sub_24659CED8()
{
  return MEMORY[0x270EEB9B0]();
}

uint64_t sub_24659CEE8()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_24659CEF8()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_24659CF08()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_24659CF18()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_24659CF28()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_24659CF38()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_24659CF48()
{
  return MEMORY[0x270EF5678]();
}

uint64_t sub_24659CF58()
{
  return MEMORY[0x270EF5680]();
}

uint64_t sub_24659CF68()
{
  return MEMORY[0x270EF5688]();
}

uint64_t sub_24659CF78()
{
  return MEMORY[0x270EF5690]();
}

uint64_t sub_24659CF98()
{
  return MEMORY[0x270EF56A0]();
}

uint64_t sub_24659CFA8()
{
  return MEMORY[0x270EF56A8]();
}

uint64_t sub_24659CFB8()
{
  return MEMORY[0x270EF56B0]();
}

uint64_t sub_24659CFC8()
{
  return MEMORY[0x270EF56B8]();
}

uint64_t sub_24659CFD8()
{
  return MEMORY[0x270EF56C0]();
}

uint64_t sub_24659CFE8()
{
  return MEMORY[0x270EF56C8]();
}

uint64_t sub_24659D008()
{
  return MEMORY[0x270EF56D8]();
}

uint64_t sub_24659D018()
{
  return MEMORY[0x270EF56E0]();
}

uint64_t sub_24659D028()
{
  return MEMORY[0x270EF56E8]();
}

uint64_t sub_24659D038()
{
  return MEMORY[0x270EF56F0]();
}

uint64_t sub_24659D048()
{
  return MEMORY[0x270EF56F8]();
}

uint64_t sub_24659D078()
{
  return MEMORY[0x270EF5710]();
}

uint64_t sub_24659D088()
{
  return MEMORY[0x270EF5718]();
}

uint64_t sub_24659D098()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24659D0A8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24659D0B8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24659D0C8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24659D0D8()
{
  return MEMORY[0x270EE3848]();
}

uint64_t sub_24659D0E8()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_24659D0F8()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_24659D108()
{
  return MEMORY[0x270EE3BC8]();
}

uint64_t sub_24659D118()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24659D128()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_24659D138()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_24659D148()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24659D158()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_24659D168()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_24659D178()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24659D188()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24659D198()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_24659D1A8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_24659D1B8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24659D1C8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24659D1D8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24659D1E8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_24659D1F8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_24659D208()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_24659D218()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24659D228()
{
  return MEMORY[0x270EE4018]();
}

uint64_t sub_24659D238()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_24659D248()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_24659D258()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24659D268()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_24659D278()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24659D288()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24659D298()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24659D2A8()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_24659D2B8()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_24659D2C8()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_24659D2D8()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_24659D2E8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24659D2F8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24659D308()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_24659D318()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_24659D328()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_24659D338()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_24659D348()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_24659D358()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_24659D378()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_24659D388()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_24659D398()
{
  return MEMORY[0x270EFFD10]();
}

uint64_t sub_24659D3A8()
{
  return MEMORY[0x270EFFD18]();
}

uint64_t sub_24659D3B8()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_24659D3C8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24659D3D8()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_24659D3E8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24659D3F8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24659D408()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24659D418()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_24659D428()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_24659D438()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_24659D448()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_24659D458()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_24659D468()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_24659D478()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24659D488()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24659D498()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24659D4A8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24659D4B8()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_24659D4C8()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_24659D4D8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24659D4E8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24659D4F8()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_24659D508()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_24659D518()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24659D528()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24659D538()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_24659D548()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_24659D558()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_24659D568()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24659D578()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24659D588()
{
  return MEMORY[0x270F01288]();
}

uint64_t sub_24659D598()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24659D5A8()
{
  return MEMORY[0x270F013F0]();
}

uint64_t sub_24659D5B8()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_24659D5C8()
{
  return MEMORY[0x270F01498]();
}

uint64_t sub_24659D5D8()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_24659D5E8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24659D5F8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24659D608()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24659D618()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24659D628()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24659D638()
{
  return MEMORY[0x270F018F0]();
}

uint64_t sub_24659D648()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_24659D658()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24659D668()
{
  return MEMORY[0x270F01F90]();
}

uint64_t sub_24659D678()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_24659D688()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_24659D698()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_24659D6A8()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_24659D6B8()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_24659D6C8()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_24659D6D8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24659D6E8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24659D6F8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24659D718()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24659D728()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24659D738()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24659D758()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_24659D768()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_24659D778()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24659D788()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24659D798()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24659D7A8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24659D7B8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24659D7C8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24659D7D8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24659D7E8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24659D7F8()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24659D808()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24659D818()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24659D828()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24659D838()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24659D848()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24659D858()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_24659D868()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_24659D878()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_24659D888()
{
  return MEMORY[0x270F02E78]();
}

uint64_t sub_24659D898()
{
  return MEMORY[0x270F02EA0]();
}

uint64_t sub_24659D8A8()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_24659D8B8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24659D8C8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24659D8D8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24659D8E8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24659D8F8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24659D908()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_24659D918()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_24659D928()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_24659D938()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24659D948()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_24659D958()
{
  return MEMORY[0x270F039D0]();
}

uint64_t sub_24659D968()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_24659D978()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_24659D988()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_24659D998()
{
  return MEMORY[0x270F03E90]();
}

uint64_t sub_24659D9A8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24659D9B8()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_24659D9C8()
{
  return MEMORY[0x270F040F8]();
}

uint64_t sub_24659D9D8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_24659D9E8()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_24659D9F8()
{
  return MEMORY[0x270F04260]();
}

uint64_t sub_24659DA08()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_24659DA18()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24659DA28()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24659DA38()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24659DA48()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24659DA58()
{
  return MEMORY[0x270F04508]();
}

uint64_t sub_24659DA68()
{
  return MEMORY[0x270F04510]();
}

uint64_t sub_24659DA78()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24659DA88()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24659DA98()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24659DAA8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24659DAB8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24659DAC8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24659DAD8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24659DAE8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_24659DAF8()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_24659DB08()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24659DB18()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_24659DB28()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_24659DB38()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_24659DB48()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_24659DB58()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_24659DB68()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_24659DB78()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_24659DB88()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24659DB98()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24659DBA8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_24659DBB8()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_24659DBC8()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_24659DBD8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24659DBE8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24659DBF8()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_24659DC08()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_24659DC18()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_24659DC28()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24659DC38()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24659DC48()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_24659DC58()
{
  return MEMORY[0x270F05378]();
}

uint64_t sub_24659DC68()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24659DC78()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24659DC88()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24659DC98()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24659DCA8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24659DCB8()
{
  return MEMORY[0x270F9D3F8]();
}

uint64_t sub_24659DCC8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24659DCD8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24659DCE8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24659DCF8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24659DD08()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24659DD18()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24659DD28()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24659DD38()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24659DD48()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24659DD58()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24659DD68()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24659DD78()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_24659DD88()
{
  return MEMORY[0x270EF1B70]();
}

uint64_t sub_24659DD98()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24659DDA8()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_24659DDB8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24659DDC8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24659DDD8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24659DDF8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24659DE08()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24659DE18()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24659DE28()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24659DE38()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24659DE48()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24659DE88()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24659DE98()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24659DEA8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24659DEB8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24659DEC8()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_24659DED8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24659DEE8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24659DEF8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24659DF08()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24659DF18()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24659DF28()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24659DF38()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24659DF48()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_24659DF58()
{
  return MEMORY[0x270FA0CF0]();
}

uint64_t sub_24659DF68()
{
  return MEMORY[0x270FA0D00]();
}

uint64_t sub_24659DF78()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_24659DF88()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24659DF98()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24659DFA8()
{
  return MEMORY[0x270EEB9E0]();
}

uint64_t sub_24659DFB8()
{
  return MEMORY[0x270EEB9F8]();
}

uint64_t sub_24659DFC8()
{
  return MEMORY[0x270EEBA08]();
}

uint64_t sub_24659DFD8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24659DFE8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24659DFF8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24659E008()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24659E018()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24659E028()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24659E038()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24659E048()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24659E058()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24659E068()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24659E078()
{
  return MEMORY[0x270FA2278]();
}

uint64_t sub_24659E088()
{
  return MEMORY[0x270FA2280]();
}

uint64_t sub_24659E098()
{
  return MEMORY[0x270FA2288]();
}

uint64_t sub_24659E0A8()
{
  return MEMORY[0x270FA2290]();
}

uint64_t sub_24659E0B8()
{
  return MEMORY[0x270FA2298]();
}

uint64_t sub_24659E0C8()
{
  return MEMORY[0x270FA22A0]();
}

uint64_t sub_24659E0D8()
{
  return MEMORY[0x270FA22A8]();
}

uint64_t sub_24659E0F8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24659E108()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24659E118()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24659E128()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24659E138()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24659E148()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24659E158()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24659E168()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_24659E178()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_24659E188()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_24659E198()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_24659E1A8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24659E1B8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24659E1C8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24659E1D8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24659E1E8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24659E1F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24659E208()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_24659E218()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24659E228()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_24659E238()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AXSSContrastRatioForColor()
{
  return MEMORY[0x270F09C58]();
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B70](gray, alpha);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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