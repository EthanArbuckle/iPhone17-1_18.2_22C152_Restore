uint64_t sub_4F54(int a1, int a2, void *aBlock)
{
  uint64_t v3;
  void *v4;
  uint64_t (__cdecl *v6)();
  uint64_t v7;

  *(void *)(v3 + 16) = _Block_copy(aBlock);
  v6 = (uint64_t (__cdecl *)())((char *)&dword_C400 + dword_C400);
  v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_5000;
  return v6();
}

uint64_t sub_5000(void *a1)
{
  v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id sub_5500()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationsDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ComplicationsDataSource()
{
  return self;
}

BOOL sub_5558(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_556C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_557C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_5588(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_6F88;
  return v6();
}

uint64_t sub_5654(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_6F88;
  return v7();
}

uint64_t sub_5720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_7080();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_7070();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_6DC8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_7060();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_58C4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_59A0;
  return v6(a1);
}

uint64_t sub_59A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_5A98(uint64_t a1, uint64_t a2)
{
  sub_70E0();
  sub_7040();
  Swift::Int v4 = sub_70F0();

  return sub_5E28(a1, a2, v4);
}

uint64_t sub_5B10(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_69B4(&qword_C3B0);
  char v36 = a2;
  uint64_t v6 = sub_70B0();
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
    v22 = (void *)(v5 + 64);
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
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_70E0();
    sub_7040();
    uint64_t result = sub_70F0();
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
    v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  v22 = (void *)(v5 + 64);
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

unint64_t sub_5E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_70C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_70C0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_5F0C()
{
  v1 = v0;
  sub_69B4(&qword_C3B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_70A0();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
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

uint64_t sub_60C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_5A98(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_5F0C();
LABEL_7:
    uint64_t v18 = (void *)*a5;
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
  sub_5B10(v15, a4 & 1);
  unint64_t v21 = sub_5A98(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_70D0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
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

uint64_t sub_6234()
{
  return _swift_task_switch(sub_6250, 0, 0);
}

uint64_t sub_6250()
{
  id v1 = objc_allocWithZone((Class)CLKWidgetComplicationDescriptor);
  NSString v2 = sub_7020();
  NSString v3 = sub_7020();
  NSString v4 = sub_7020();
  id v5 = [v1 initWithExtensionBundleIdentifier:v2 containerBundleIdentifier:v3 kind:v4 intent:0];

  uint64_t v6 = *(uint64_t (**)(id))(v0 + 8);
  return v6(v5);
}

id sub_6354()
{
  uint64_t v0 = self;
  NSString v1 = sub_7020();
  id v2 = [v0 _symbolImageProviderWithSystemName:v1];

  id v3 = [self systemGreenColor];
  [v2 setTintColor:v3];

  type metadata accessor for ComplicationsDataSource();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = self;
  id v6 = v2;
  unint64_t v7 = (objc_class *)[v5 bundleForClass:ObjCClassFromMetadata];
  v11._countAndFlagsBits = 0xE000000000000000;
  v12._object = (void *)0x80000000000075B0;
  v12._countAndFlagsBits = 0xD000000000000020;
  v13.value._countAndFlagsBits = 0;
  v13.value._object = 0;
  v8.super.isa = v7;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  sub_6FC0(v12, v13, v8, v14, v11);

  NSString v9 = sub_7020();
  swift_bridgeObjectRelease();
  [v6 setAccessibilityLabel:v9];

  return v6;
}

id sub_64CC()
{
  uint64_t v0 = self;
  NSString v1 = sub_7020();
  id v2 = [v0 _symbolImageProviderWithSystemName:v1];

  id v3 = self;
  id v4 = v2;
  id v5 = [v3 systemGreenColor];
  [v4 setTintColor:v5];

  type metadata accessor for ComplicationsDataSource();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  unint64_t v7 = self;
  id v8 = v4;
  NSString v9 = (objc_class *)[v7 bundleForClass:ObjCClassFromMetadata];
  v13._countAndFlagsBits = 0xE000000000000000;
  v14._object = (void *)0x80000000000075B0;
  v14._countAndFlagsBits = 0xD000000000000020;
  v15.value._countAndFlagsBits = 0;
  v15.value._object = 0;
  v10.super.isa = v9;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  sub_6FC0(v14, v15, v10, v16, v13);

  NSString v11 = sub_7020();
  swift_bridgeObjectRelease();
  [v8 setAccessibilityLabel:v11];

  return v8;
}

id sub_6658(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v1 = sub_64CC();
      id v2 = (objc_class *)CLKComplicationTemplateModularSmallSimpleImage;
      goto LABEL_10;
    case 2:
      id v1 = sub_64CC();
      id v2 = (objc_class *)CLKComplicationTemplateUtilitarianSmallSquare;
      goto LABEL_10;
    case 4:
      id v1 = sub_64CC();
      id v2 = (objc_class *)CLKComplicationTemplateCircularSmallSimpleImage;
      goto LABEL_10;
    case 7:
      id v1 = sub_64CC();
      id v2 = (objc_class *)CLKComplicationTemplateExtraLargeSimpleImage;
      goto LABEL_10;
    case 8:
      id v1 = sub_6354();
      id v2 = (objc_class *)CLKComplicationTemplateGraphicCornerCircularImage;
      goto LABEL_10;
    case 9:
      id v1 = sub_6354();
      id v2 = (objc_class *)CLKComplicationTemplateGraphicCircularImage;
      goto LABEL_10;
    case 10:
      id v1 = sub_6354();
      id v3 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCircularImage) initWithImageProvider:v1];
      uint64_t v4 = sub_7030();
      uint64_t v6 = v5;
      id v7 = v3;
      Class isa = sub_7050().super.super.isa;
      id v9 = [v7 metadata];
      sub_69B4(&qword_C3A8);
      uint64_t v10 = sub_7010();

      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v14 = v10;
      sub_60C4((uint64_t)isa, v4, v6, isUniquelyReferenced_nonNull_native, &v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Class v12 = sub_7000().super.isa;
      swift_bridgeObjectRelease();
      [v7 setMetadata:v12];

      goto LABEL_11;
    case 12:
      id v1 = sub_6354();
      id v2 = (objc_class *)CLKComplicationTemplateGraphicExtraLargeCircularImage;
LABEL_10:
      id v7 = [objc_allocWithZone(v2) initWithImageProvider:v1];
LABEL_11:

      return v7;
    default:
      sub_7090();
      __break(1u);
      JUMPOUT(0x6980);
  }
}

uint64_t sub_69B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_69F8()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_6A40()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_6B00;
  uint64_t v6 = (uint64_t (*)(int, int, void *))((char *)&dword_C3C0 + dword_C3C0);
  return v6(v2, v3, v4);
}

uint64_t sub_6B00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_6BF8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_6F88;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_C3D0 + dword_C3D0);
  return v6(v2, v3, v4);
}

uint64_t sub_6CBC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_6CFC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_6F88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_C3E0 + dword_C3E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_6DC8(uint64_t a1)
{
  uint64_t v2 = sub_69B4(&qword_C3B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_6E28()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_6E60(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_6B00;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_C3F0 + dword_C3F0);
  return v6(a1, v4);
}

uint64_t sub_6F18(unint64_t a1)
{
  return (a1 < 0xD) & (0x1795u >> a1);
}

void type metadata accessor for CLKComplicationFamily()
{
  if (!qword_C408)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_C408);
    }
  }
}

uint64_t sub_6F8C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_6FC0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

NSDate sub_6FD0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_6FE0()
{
  return Date.init()();
}

uint64_t sub_6FF0()
{
  return type metadata accessor for Date();
}

NSDictionary sub_7000()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_7010()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_7020()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_7030()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_7040()
{
  return String.hash(into:)();
}

NSNumber sub_7050()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_7060()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_7070()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_7080()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_7090()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_70A0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_70B0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_70C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_70D0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_70E0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_70F0()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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