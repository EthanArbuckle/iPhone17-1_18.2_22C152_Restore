uint64_t sub_1000050F0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_100007360();
  v2[4] = v3;
  v4 = *(void *)(v3 - 8);
  v2[5] = v4;
  v2[6] = *(void *)(v4 + 64);
  v2[7] = swift_task_alloc();
  v5 = sub_100007340();
  v2[8] = v5;
  v2[9] = *(void *)(v5 - 8);
  v2[10] = swift_task_alloc();
  sub_100007280();
  v2[11] = swift_task_alloc();
  v6 = sub_100007290();
  v2[12] = v6;
  v2[13] = *(void *)(v6 - 8);
  v2[14] = swift_task_alloc();
  v7 = (void *)swift_task_alloc();
  v2[15] = v7;
  *v7 = v2;
  v7[1] = sub_1000052D0;
  return ThumbnailRequest.data.getter();
}

uint64_t sub_1000052D0(uint64_t a1, uint64_t a2)
{
  v4 = (void *)*v3;
  v4[16] = a1;
  v4[17] = a2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_100005438, 0, 0);
  }
}

void sub_100005438()
{
  CFDataRef isa = sub_1000072B0().super.isa;
  CFArrayRef FontDescriptorsFromData = CTFontManagerCreateFontDescriptorsFromData(isa);

  CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, FontDescriptorsFromData);
  if (MutableCopy)
  {
    CFArrayRef v4 = MutableCopy;
    v18.length = CFArrayGetCount(v4);
    v18.location = 0;
    CFArraySortValues(v4, v18, (CFComparatorFunction)&CTFontManagerCompareFontDescriptors, 0);

    type metadata accessor for CTFontDescriptor(0);
    CFArrayRef v5 = v4;
    sub_1000073E0();

    uint64_t v12 = v0[16];
    unint64_t v11 = v0[17];
    uint64_t v14 = v0[13];
    uint64_t v13 = v0[14];
    uint64_t v15 = v0[12];
    sub_100007270();
    sub_100006628((uint64_t)&_swiftEmptyArrayStorage);
    sub_100006468(&qword_10000C098, (void (*)(uint64_t))&type metadata accessor for CocoaError);
    sub_1000072A0();
    sub_100007260();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    swift_willThrow();
    sub_100006754(v12, v11);
  }
  else
  {
    uint64_t v7 = v0[16];
    unint64_t v6 = v0[17];
    uint64_t v9 = v0[13];
    uint64_t v8 = v0[14];
    uint64_t v10 = v0[12];
    sub_100007270();
    sub_100006628((uint64_t)&_swiftEmptyArrayStorage);
    sub_100006468(&qword_10000C098, (void (*)(uint64_t))&type metadata accessor for CocoaError);
    sub_1000072A0();
    sub_100007260();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    swift_willThrow();
    sub_100006754(v7, v6);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v16 = (void (*)(void))v0[1];
  v16();
}

void sub_10000598C(CGContext *a1, CGFloat a2, double a3, double a4, double a5, double a6, uint64_t a7, const __CTLine *a8)
{
  uint64_t v15 = sub_100007340();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = ((uint64_t (*)(void))__chkstk_darwin)();
  v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v21 = (char *)&v33 - v20;
  sub_100007350();
  sub_100007330();
  CGFloat v23 = v22;
  v24 = *(void (**)(char *, uint64_t))(v16 + 8);
  v24(v21, v15);
  sub_100007350();
  sub_100007330();
  CGFloat v26 = v25;
  v24(v19, v15);
  CGContextScaleCTM(a1, v23, v26);
  CGContextSetGrayFillColor(a1, 1.0, 1.0);
  sub_100006F60(&qword_10000C0A0);
  v27._rawValue = (void *)swift_allocObject();
  CGPoint origin = CGRectInfinite.origin;
  CGSize size = CGRectInfinite.size;
  *((_OWORD *)v27._rawValue + 1) = xmmword_100007850;
  *((CGPoint *)v27._rawValue + 2) = origin;
  *((CGSize *)v27._rawValue + 3) = size;
  sub_100007400(v27);
  swift_bridgeObjectRelease();
  CGContextTranslateCTM(a1, a2, a2);
  CGContextSetGrayStrokeColor(a1, 0.4, 1.0);
  sub_100007350();
  sub_100007330();
  double v31 = v30;
  v24(v21, v15);
  CGContextSetLineWidth(a1, 1.0 / v31);
  CGContextSetShouldAntialias(a1, 0);
  sub_100006F60(&qword_10000C0A8);
  v32._rawValue = (void *)swift_allocObject();
  *((_OWORD *)v32._rawValue + 1) = xmmword_100007860;
  *((CGFloat *)v32._rawValue + 4) = -a2;
  *((double *)v32._rawValue + 5) = -a4;
  *((double *)v32._rawValue + 6) = a5;
  *((double *)v32._rawValue + 7) = -a4;
  *((CGFloat *)v32._rawValue + 8) = -a2;
  *((double *)v32._rawValue + 9) = a6 - a4;
  *((double *)v32._rawValue + 10) = a5;
  *((double *)v32._rawValue + 11) = a6 - a4;
  sub_1000073F0(v32);
  swift_bridgeObjectRelease();
  CGContextSetShouldAntialias(a1, 1);
  CGContextTranslateCTM(a1, -a3, -a4);
  CTLineDraw(a8, a1);
}

unint64_t sub_100005C50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006F60(&qword_10000C0C0);
  uint64_t v2 = (void *)sub_100007430();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  CFArrayRef v4 = (void **)(a1 + 40);
  while (1)
  {
    CFArrayRef v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_100006980((uint64_t)v6);
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

uint64_t sub_100005D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100007380();
  CFArrayRef v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100005DC4(uint64_t a1)
{
  uint64_t v2 = sub_100006468(&qword_10000C088, (void (*)(uint64_t))type metadata accessor for FontThumbnailExtension);

  return ThumbnailExtension.configuration.getter(a1, v2);
}

uint64_t sub_100005E40()
{
  uint64_t v0 = sub_1000073B0();
  __chkstk_darwin(v0 - 8);
  sub_1000073A0();
  return sub_100007370();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for FontThumbnailExtension()
{
  uint64_t result = qword_10000C120;
  if (!qword_10000C120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  CFArrayRef v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10000601C(uint64_t a1)
{
  uint64_t v2 = sub_100007380();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100006080(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000060E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000061AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006224);
}

uint64_t sub_100006224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  CFArrayRef v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100006290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000062A4);
}

uint64_t sub_1000062A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007380();
  CFArrayRef v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100006314()
{
  uint64_t result = sub_100007380();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000063A0()
{
  return sub_100006468(&qword_10000C000, (void (*)(uint64_t))type metadata accessor for FontThumbnailExtension);
}

uint64_t sub_1000063E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006468(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000064B0()
{
  return sub_1000072E0();
}

uint64_t sub_1000064FC()
{
  return sub_1000072D0();
}

Swift::Int sub_100006554()
{
  return sub_100007460();
}

uint64_t sub_1000065BC()
{
  swift_getWitnessTable();

  return sub_1000072C0();
}

unint64_t sub_100006628(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006F60(&qword_10000C0D0);
  uint64_t v2 = sub_100007430();
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
    sub_100006FD4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000067C0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000703C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100006754(uint64_t a1, unint64_t a2)
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

void type metadata accessor for CTFontDescriptor(uint64_t a1)
{
}

unint64_t sub_1000067C0(uint64_t a1, uint64_t a2)
{
  sub_100007450();
  sub_1000073D0();
  Swift::Int v4 = sub_100007460();

  return sub_100006838(a1, a2, v4);
}

unint64_t sub_100006838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_100007440() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_100007440() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_100007440()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_100006980(uint64_t a1)
{
  sub_100007450();
  type metadata accessor for CFString(0);
  sub_100006468(&qword_10000C0C8, type metadata accessor for CFString);
  sub_1000072D0();
  Swift::Int v2 = sub_100007460();

  return sub_100006A34(a1, v2);
}

unint64_t sub_100006A34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_100006468(&qword_10000C0C8, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_1000072C0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_1000072C0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100006B90(const __CTFontDescriptor *a1, double a2, double a3)
{
  CTFontRef v6 = sub_100006FA4(a1, 100.0);
  id v7 = (void *)CTFontCopySampleString();
  sub_100006F60(&qword_10000C0B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100007850;
  *(void *)(inited + 32) = kCTFontAttributeName;
  *(void *)(inited + 40) = v6;
  uint64_t v9 = (id)kCTFontAttributeName;
  id v10 = v6;
  sub_100005C50(inited);
  type metadata accessor for CFString(0);
  type metadata accessor for CTFont(0);
  sub_100006468(&qword_10000C0B8, type metadata accessor for CFString);
  Class isa = sub_1000073C0().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v12 = (const __CTLine *)CTLineCreateWithString();

  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v12, 8uLL);
  CGFloat x = BoundsWithOptions.origin.x;
  CGFloat y = BoundsWithOptions.origin.y;
  CGFloat width = BoundsWithOptions.size.width;
  CGFloat height = BoundsWithOptions.size.height;
  double v17 = CGRectGetWidth(BoundsWithOptions);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v18 = CGRectGetHeight(v27);
  if (v17 > v18) {
    double v18 = v17;
  }
  if (a3 >= a2) {
    double v19 = a2;
  }
  else {
    double v19 = a3;
  }
  CTFontRef v20 = sub_100006FA4(a1, v19 * (100.0 / v18));
  uint64_t v21 = swift_initStackObject();
  *(_OWORD *)(v21 + 16) = xmmword_100007850;
  *(void *)(v21 + 32) = v9;
  *(void *)(v21 + 40) = v20;
  double v22 = v9;
  v20;
  sub_100005C50(v21);
  Class v23 = sub_1000073C0().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v24 = CTLineCreateWithString();

  return v24;
}

uint64_t sub_100006DD0()
{
  uint64_t v1 = sub_100007360();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100006E94(CGContext *a1)
{
  uint64_t v3 = *(void *)(sub_100007360() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_10000598C(a1, *(CGFloat *)(v1 + v5), *(double *)(v1 + v6), *(double *)(v1 + v6 + 8), *(double *)(v1 + ((v6 + 39) & 0xFFFFFFFFFFFFFFF8)), *(double *)(v1 + ((((v6 + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), v1 + v4, *(const __CTLine **)(v1+ ((((((v6 + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_100006F60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

CTFontRef sub_100006FA4(const __CTFontDescriptor *a1, CGFloat a2)
{
  return CTFontCreateWithFontDescriptor(a1, a2, 0);
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for CTFont(uint64_t a1)
{
}

uint64_t sub_100006FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006F60(&qword_10000C0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000703C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

__n128 sub_10000704C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CTLine(uint64_t a1)
{
}

uint64_t sub_100007084(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000070A4(uint64_t result, int a2, int a3)
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

uint64_t sub_1000070E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100007114(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007120(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007140(uint64_t result, int a2, int a3)
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

void sub_100007180(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000071C8()
{
  return sub_100006468(&qword_10000C0B8, type metadata accessor for CFString);
}

uint64_t sub_100007210()
{
  return sub_100006468(&qword_10000C118, type metadata accessor for CFString);
}

uint64_t sub_100007260()
{
  return CocoaError._nsError.getter();
}

uint64_t sub_100007270()
{
  return static CocoaError.Code.fileReadCorruptFile.getter();
}

uint64_t sub_100007280()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_100007290()
{
  return type metadata accessor for CocoaError();
}

uint64_t sub_1000072A0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

NSData sub_1000072B0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000072C0()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_1000072D0()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_1000072E0()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000072F0()
{
  return static AppExtension.main()();
}

uint64_t sub_100007300()
{
  return static ThumbnailReply.cgRenderer(size:renderer:)();
}

uint64_t sub_100007320()
{
  return ThumbnailRequest.Options.maximumSize.getter();
}

uint64_t sub_100007330()
{
  return ThumbnailRequest.Options.scale.getter();
}

uint64_t sub_100007340()
{
  return type metadata accessor for ThumbnailRequest.Options();
}

uint64_t sub_100007350()
{
  return ThumbnailRequest.options.getter();
}

uint64_t sub_100007360()
{
  return type metadata accessor for ThumbnailRequest();
}

uint64_t sub_100007370()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_100007380()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_1000073A0()
{
  return static UTType.item.getter();
}

uint64_t sub_1000073B0()
{
  return type metadata accessor for UTType();
}

NSDictionary sub_1000073C0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000073D0()
{
  return String.hash(into:)();
}

uint64_t sub_1000073E0()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

void sub_1000073F0(Swift::OpaquePointer between)
{
}

void sub_100007400(Swift::OpaquePointer a1)
{
}

uint64_t sub_100007410()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100007420()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100007430()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100007440()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007450()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007460()
{
  return Hasher._finalize()();
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CTFontCopySampleString()
{
  return _CTFontCopySampleString();
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  return _CTFontGetXHeight(font);
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromData(CFDataRef data)
{
  return _CTFontManagerCreateFontDescriptorsFromData(data);
}

uint64_t CTLineCreateWithString()
{
  return _CTLineCreateWithString();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  return _CTLineGetBoundsWithOptions(line, options);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}