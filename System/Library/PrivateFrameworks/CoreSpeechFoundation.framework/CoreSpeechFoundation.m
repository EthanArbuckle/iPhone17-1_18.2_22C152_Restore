void sub_1BA1AA7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BA1ABCD0()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_1BA1ABD48(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_1BA1ABD88@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return result;
}

uint64_t sub_1BA1ABDD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  return result;
}

uint64_t (*sub_1BA1ABE14())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1BA1ABE80())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BA1ABED8()
{
  swift_beginAccess();
  return *(void *)(v0 + 40);
}

uint64_t sub_1BA1ABF10(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t sub_1BA1ABF50@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 40);
  return result;
}

uint64_t sub_1BA1ABF98(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 40) = v2;
  return result;
}

uint64_t (*sub_1BA1ABFDC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BA1AC070()
{
  swift_beginAccess();
  return *(void *)(v0 + 48);
}

uint64_t sub_1BA1AC0E8(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t sub_1BA1AC128@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 48);
  return result;
}

uint64_t sub_1BA1AC170(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 48) = v2;
  return result;
}

uint64_t (*sub_1BA1AC1B4())()
{
  return j__swift_endAccess;
}

uint64_t CSEnhancedEndpointerModelTypeDefault.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA1AC2A8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BA1AC358(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA1AC3AC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA1AC3F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BA1AC4F0())()
{
  return j_j__swift_endAccess;
}

uint64_t _s20CoreSpeechFoundation36CSEnhancedEndpointerModelTypeDefaultCfD_0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

void sub_1BA1AC580(void *a1)
{
  id v2 = objc_msgSend(a1, sel_toFeatureArray);
  sub_1BA1ADC30();
  unint64_t v3 = sub_1BA2523A8();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1BA2523E8();
    swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      goto LABEL_12;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x1BA9E62C0](i, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    v7 = v6;
    id v8 = objc_msgSend(objc_msgSend(v1, sel_modelType), sel_featureCount);
    swift_unknownObjectRelease();
    if (i < (uint64_t)v8)
    {
      id v9 = objc_msgSend(v1, sel_multiArray);
      objc_msgSend(v9, sel_setObject_atIndexedSubscript_, v7, i);

      v7 = v9;
    }
  }
LABEL_12:
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v1, sel_multiArray);
  id v11 = v10;
}

id sub_1BA1AC7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType;
  type metadata accessor for CSEnhancedEndpointerModelTypeDefault();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1BA25E2C0;
  *(void *)(v9 + 32) = 0xE700000000000000;
  *(void *)(v9 + 40) = ObjectType;
  *(void *)(v9 + 48) = 3;
  *(void *)&v4[v8] = v9;
  objc_allocWithZone(MEMORY[0x1E4F1E9A0]);
  id v10 = v4;
  id v11 = sub_1BA1AD2F0(a1, a2);
  if (v3)
  {

    swift_unknownObjectRelease();
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)&v10[OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray] = v11;

    v13.receiver = v10;
    v13.super_class = ObjectType;
    return objc_msgSendSuper2(&v13, sel_init);
  }
}

uint64_t sub_1BA1ACA28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + *a4) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

id sub_1BA1ACAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC20CoreSpeechFoundation39CSEnhancedEndpointerInputVectorAcoustic_modelType;
  type metadata accessor for CSEnhancedEndpointerModelTypeAcoustic();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1BA25E2D0;
  *(void *)(v9 + 32) = 0xE800000000000000;
  *(void *)(v9 + 40) = ObjectType;
  *(void *)(v9 + 48) = 4;
  *(void *)&v4[v8] = v9;
  objc_allocWithZone(MEMORY[0x1E4F1E9A0]);
  id v10 = v4;
  id v11 = sub_1BA1AD2F0(a1, a2);
  if (v3)
  {

    swift_unknownObjectRelease();
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)&v10[OBJC_IVAR____TtC20CoreSpeechFoundation39CSEnhancedEndpointerInputVectorAcoustic_multiArray] = v11;

    v13.receiver = v10;
    v13.super_class = ObjectType;
    return objc_msgSendSuper2(&v13, sel_init);
  }
}

uint64_t sub_1BA1ACBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  sub_1BA1ADC30();
  uint64_t v8 = sub_1BA2523A8();
  return a6(v8, a4);
}

id sub_1BA1ACCA8(char *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)&a1[*a3];
  uint64_t v4 = a1;
  id v5 = objc_msgSend(v3, sel_modelName);
  sub_1BA252378();

  id v6 = (void *)sub_1BA252368();
  swift_bridgeObjectRelease();
  return v6;
}

id sub_1BA1ACD80()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BA1ACE04()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB6F52E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BA25E2E0;
  type metadata accessor for CSEnhancedEndpointerModelTypeDefault();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BA25E2C0;
  *(void *)(v1 + 32) = 0xE700000000000000;
  *(void *)(v1 + 40) = type metadata accessor for CSEnhancedEndpointerInputVectorDefault();
  *(void *)(v1 + 48) = 3;
  *(void *)(v0 + 32) = v1;
  type metadata accessor for CSEnhancedEndpointerModelTypeAcoustic();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BA25E2D0;
  *(void *)(v2 + 32) = 0xE800000000000000;
  *(void *)(v2 + 40) = type metadata accessor for CSEnhancedEndpointerInputVectorAcoustic();
  *(void *)(v2 + 48) = 4;
  *(void *)(v0 + 40) = v2;
  uint64_t result = sub_1BA2523B8();
  qword_1EB6F5960 = v0;
  return result;
}

uint64_t sub_1BA1ACED8(unint64_t a1, uint64_t a2)
{
  return sub_1BA1AD3DC(a1, a2);
}

id CSEnhancedEndpointerInputVectorFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CSEnhancedEndpointerInputVectorFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSEnhancedEndpointerInputVectorFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CSEnhancedEndpointerInputVectorFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSEnhancedEndpointerInputVectorFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1BA1AD098(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_1BA2523C8();
    swift_bridgeObjectRelease();
    sub_1BA2523F8();
    sub_1BA252388();
    swift_bridgeObjectRelease();
    sub_1BA252388();
    sub_1BA2523C8();
    sub_1BA2523F8();
    swift_bridgeObjectRelease();
    sub_1BA252388();
    sub_1BA2523F8();
    sub_1BA252388();
    swift_bridgeObjectRelease();
    sub_1BA252388();
    unint64_t v3 = 0xD000000000000020;
    swift_bridgeObjectRetain();
    sub_1BA252388();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BA2523C8();
    swift_bridgeObjectRelease();
    unint64_t v3 = 0xD000000000000017;
    sub_1BA2523F8();
    sub_1BA252388();
    swift_bridgeObjectRelease();
    sub_1BA252388();
  }
  return v3;
}

unint64_t sub_1BA1AD2D8()
{
  return sub_1BA1AD098(*(void *)v0, *(unsigned char *)(v0 + 8));
}

id sub_1BA1AD2F0(uint64_t a1, uint64_t a2)
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  sub_1BA1ADC30();
  uint64_t v4 = (void *)sub_1BA252398();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithShape_dataType_error_, v4, a2, v9);

  if (v5)
  {
    id v6 = v9[0];
  }
  else
  {
    id v7 = v9[0];
    sub_1BA252358();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_1BA1AD3DC(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!(a1 >> 62))
  {
    id v6 = *(id *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6 == (id)2) {
      goto LABEL_3;
    }
LABEL_24:
    sub_1BA1ADBDC();
    swift_allocError();
    *(void *)uint64_t v19 = v6;
    *(unsigned char *)(v19 + 8) = 0;
    goto LABEL_25;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  id v6 = (id)sub_1BA2523E8();
  swift_bridgeObjectRelease();
  if (v6 != (id)2) {
    goto LABEL_24;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x1BA9E62C0](1, a1);
LABEL_6:
    uint64_t v8 = v7;
    id v6 = objc_msgSend(v7, sel_integerValue, v21);

    if (qword_1EB6F56B0 == -1) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    id v7 = *(id *)(a1 + 40);
    goto LABEL_6;
  }
  __break(1u);
LABEL_29:
  swift_once();
LABEL_7:
  uint64_t v9 = qword_1EB6F5960;
  v21 = v3;
  uint64_t v22 = a2;
  if (!((unint64_t)qword_1EB6F5960 >> 62))
  {
    uint64_t v10 = *(void *)((qword_1EB6F5960 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1BA2523E8();
  if (!v10)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_1BA1ADBDC();
    swift_allocError();
    *(void *)uint64_t v15 = v6;
    *(unsigned char *)(v15 + 8) = 1;
LABEL_25:
    swift_willThrow();
    return a2;
  }
LABEL_9:
  a2 = 4;
  unint64_t v3 = &selRef_audioPacketDeliveryCount;
  while (1)
  {
    uint64_t v11 = a2 - 4;
    if ((v9 & 0xC000000000000001) != 0)
    {
      v12 = (void *)MEMORY[0x1BA9E62C0](a2 - 4, v9);
      BOOL v13 = __OFADD__(v11, 1);
      uint64_t v14 = a2 - 3;
      if (v13) {
        goto LABEL_22;
      }
    }
    else
    {
      v12 = *(void **)(v9 + 8 * a2);
      swift_unknownObjectRetain();
      BOOL v13 = __OFADD__(v11, 1);
      uint64_t v14 = a2 - 3;
      if (v13)
      {
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
    }
    if (objc_msgSend(v12, sel_featureCount, v21) == v6) {
      break;
    }
    swift_unknownObjectRelease();
    ++a2;
    if (v14 == v10) {
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_inputVector);
  swift_getObjCClassMetadata();
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1BA1ADC30();
  v17 = (void *)sub_1BA252398();
  v23[0] = 0;
  a2 = (uint64_t)objc_msgSend(v16, sel_initWithShape_dataType_error_, v17, v22, v23);

  if (a2)
  {
    id v18 = v23[0];
  }
  else
  {
    a2 = (uint64_t)v23[0];
    sub_1BA252358();

    swift_willThrow();
  }
  swift_unknownObjectRelease();
  return a2;
}

uint64_t type metadata accessor for CSEnhancedEndpointerInputVectorFactory()
{
  return self;
}

uint64_t type metadata accessor for CSEnhancedEndpointerModelTypeDefault()
{
  return self;
}

uint64_t method lookup function for CSEnhancedEndpointerModelTypeDefault(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CSEnhancedEndpointerModelTypeDefault);
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.featureCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.featureCount.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.featureCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.modelName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.modelName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.modelName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.inputVector.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.inputVector.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.inputVector.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.endpointerType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.endpointerType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.endpointerType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t type metadata accessor for CSEnhancedEndpointerModelTypeAcoustic()
{
  return self;
}

uint64_t method lookup function for CSEnhancedEndpointerModelTypeAcoustic(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CSEnhancedEndpointerModelTypeAcoustic);
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.featureCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.featureCount.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.featureCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.modelName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.modelName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.modelName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.inputVector.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.inputVector.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.inputVector.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.endpointerType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.endpointerType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeAcoustic.endpointerType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t type metadata accessor for CSEnhancedEndpointerInputVectorDefault()
{
  return self;
}

uint64_t type metadata accessor for CSEnhancedEndpointerInputVectorAcoustic()
{
  return self;
}

uint64_t method lookup function for CSEnhancedEndpointerInputVectorFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CSEnhancedEndpointerInputVectorFactory);
}

uint64_t dispatch thunk of static CSEnhancedEndpointerInputVectorFactory.inputVector(shape:dataType:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for CSEndpointerType()
{
  if (!qword_1E9F3F768)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9F3F768);
    }
  }
}

unint64_t sub_1BA1ADBDC()
{
  unint64_t result = qword_1E9F3F770;
  if (!qword_1E9F3F770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F3F770);
  }
  return result;
}

unint64_t sub_1BA1ADC30()
{
  unint64_t result = qword_1EB6F52D8;
  if (!qword_1EB6F52D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB6F52D8);
  }
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

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CSEnhancedEndpointerInputVectorError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CSEnhancedEndpointerInputVectorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BA1ADD58(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1BA1ADD64(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CSEnhancedEndpointerInputVectorError()
{
  return &type metadata for CSEnhancedEndpointerInputVectorError;
}

void sub_1BA1ADF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1AE12C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __CFString *a17, void *a18, __CFString *a19, __CFString *a20)
{
  if (a2)
  {
    v21 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      uint64_t v22 = NSString;
      (*(void (**)(void *))(*(void *)v21 + 16))(v21);
      v23 = [v22 stringWithFormat:@"mil2Bnns compilation Failed with exception : %s"];
      v24 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "+[CSMil2BnnsUtils _compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:mil"
                                        "ConfigPath:compilationFramework:error:]";
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v23;
        _os_log_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      a17 = @"reason";
      a18 = v23;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a18 forKeys:&a17 count:1];
      [v25 errorWithDomain:@"com.apple.corespeech" code:2256 userInfo:v26];
      objc_claimAutoreleasedReturnValue();

      __cxa_end_catch();
    }
    else
    {
      v27 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "+[CSMil2BnnsUtils _compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:mil"
                                        "ConfigPath:compilationFramework:error:]";
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = @"mil2Bnns compilation unkown failure from EAR";
        _os_log_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&buf, 0x16u);
      }
      v28 = (void *)MEMORY[0x1E4F28C58];
      a19 = @"reason";
      a20 = @"mil2Bnns compilation unkown failure from EAR";
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a20 forKeys:&a19 count:1];
      [v28 errorWithDomain:@"com.apple.corespeech" code:2256 userInfo:v29];
      objc_claimAutoreleasedReturnValue();

      __cxa_end_catch();
    }
    JUMPOUT(0x1BA1AE04CLL);
  }
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1BA1AE548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1AE6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1AE84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSModelEngineCacheLookUpHandler(const char *a1, const char *a2, char *a3, size_t a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [NSString stringWithUTF8String:a1];
  uint64_t v9 = [v8 stringByStandardizingPath];

  if (v9 && [v9 length])
  {
    uint64_t v10 = +[CSMil2BnnsUtils readBnnsIrFromCacheMapWithMilFile:v9];
    uint64_t v11 = [v10 stringByStandardizingPath];

    bzero(a3, a4);
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v13 = v12;
    if (!v11 || ([v12 fileExistsAtPath:v11] & 1) == 0)
    {
      uint64_t v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 136315394;
        *(void *)&v27[4] = "CSModelEngineCacheLookUpHandler";
        *(_WORD *)&v27[12] = 2112;
        *(void *)&v27[14] = v11;
        _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s bnnsIr cache path: %@ file does not exist", v27, 0x16u);
      }
      id v15 = v9;
      if (!+[CSUtils isBridgeOS])
      {
        *(void *)v27 = MEMORY[0x1E4F143A8];
        *(void *)&v27[8] = 3221225472;
        *(void *)&v27[16] = ___ZL35sendAnalyticsEventBnnsIrFileMissingP8NSString_block_invoke;
        v28 = (const char *)&unk_1E61FF3B8;
        id v29 = v15;
        AnalyticsSendEventLazy();
      }
    }
    id v16 = [v11 pathExtension];
    v17 = [NSString stringWithUTF8String:a2];
    char v18 = [v16 isEqualToString:v17];

    if (v18)
    {
      id v19 = v11;
      v20 = (const char *)[v19 UTF8String];
      id v21 = v19;
      size_t v22 = strlen((const char *)[v21 UTF8String]);
      strncpy(a3, v20, v22);
      a3[strlen((const char *)[v21 UTF8String])] = 0;
      v23 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 136315650;
        *(void *)&v27[4] = "CSModelEngineCacheLookUpHandler";
        *(_WORD *)&v27[12] = 2080;
        *(void *)&v27[14] = a3;
        *(_WORD *)&v27[22] = 2080;
        v28 = a1;
        _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Caching bnnsIr %s to mil path %s", v27, 0x20u);
      }
    }
    else
    {
      v25 = (id)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [NSString stringWithUTF8String:a1];
        *(_DWORD *)v27 = 136315394;
        *(void *)&v27[4] = "CSModelEngineCacheLookUpHandler";
        *(_WORD *)&v27[12] = 2112;
        *(void *)&v27[14] = v26;
        _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s invalid for milPath: %@", v27, 0x16u);
      }
    }
  }
  else
  {
    v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315138;
      *(void *)&v27[4] = "CSModelEngineCacheLookUpHandler";
      _os_log_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_DEFAULT, "%s compute Engine caching Input Mil path invalid or empty", v27, 0xCu);
    }
  }
}

void sub_1BA1AEC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL35sendAnalyticsEventBnnsIrFileMissingP8NSString_block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"MissingIrFileCount";
  v4[1] = @"MissingIrFileForMilFileName";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = &unk_1F13B8158;
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

void sub_1BA1AF238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BA1AF3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLFSystemShellSwitcherClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ClarityFoundationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = __ClarityFoundationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E61FF3D8;
    uint64_t v6 = 0;
    ClarityFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ClarityFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CLFSystemShellSwitcher");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getCLFSystemShellSwitcherClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ClarityFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClarityFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BA1B150C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
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

id AudioInjectionXPCGetInterface()
{
  v53[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13DC7C0];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  unsigned int v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_pingpong_completion_ argumentIndex:0 ofReply:0];

  int v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  uint64_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_pingpong_completion_ argumentIndex:0 ofReply:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_ argumentIndex:1 ofReply:0];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_ argumentIndex:2 ofReply:0];

  BOOL v13 = (void *)MEMORY[0x1E4F1CAD0];
  v49[0] = objc_opt_class();
  v49[1] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  id v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_ argumentIndex:3 ofReply:0];

  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  char v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_ argumentIndex:2 ofReply:1];

  id v19 = (void *)MEMORY[0x1E4F1CAD0];
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  id v21 = [v19 setWithArray:v20];
  [v0 setClasses:v21 forSelector:sel_injectAudio_toDeviceWithUUID_withScaleFactor_completion_ argumentIndex:0 ofReply:0];

  size_t v22 = (void *)MEMORY[0x1E4F1CAD0];
  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v24 = [v22 setWithArray:v23];
  [v0 setClasses:v24 forSelector:sel_injectAudio_toDeviceWithUUID_withScaleFactor_completion_ argumentIndex:1 ofReply:0];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v27 = [v25 setWithArray:v26];
  [v0 setClasses:v27 forSelector:sel_injectAudio_toDeviceWithUUID_withScaleFactor_withNumChannels_completion_ argumentIndex:0 ofReply:0];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  uint64_t v30 = [v28 setWithArray:v29];
  [v0 setClasses:v30 forSelector:sel_injectAudio_toDeviceWithUUID_withScaleFactor_withNumChannels_completion_ argumentIndex:1 ofReply:0];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v33 = [v31 setWithArray:v32];
  [v0 setClasses:v33 forSelector:sel_connectDeviceWithUUID_completion_ argumentIndex:0 ofReply:0];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v36 = [v34 setWithArray:v35];
  [v0 setClasses:v36 forSelector:sel_disconnectDeviceWithUUID_completion_ argumentIndex:0 ofReply:0];

  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v39 = [v37 setWithArray:v38];
  [v0 setClasses:v39 forSelector:sel_primaryInputDeviceUUIDWithCompletion_ argumentIndex:2 ofReply:1];

  return v0;
}

uint64_t _AssistantPrefsChangedNotification(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = AFPreferencesAssistantEnabled();
  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = @"Disabled";
    if (v3) {
      long long v5 = @"Enabled";
    }
    int v7 = 136315394;
    uint64_t v8 = "_AssistantPrefsChangedNotification";
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri Enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return [a2 _didReceiveSiriSettingChanged:v3 != 0];
}

uint64_t __Block_byref_object_copy__304(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__305(uint64_t a1)
{
}

void sub_1BA1B59B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (uint64_t (**)(void, void, void, void))MEMORY[0x1BA9E7570](a5);
  uint64_t v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

void CSLogInitIfNeededWithSubsystemType(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __CSLogInitIfNeededWithSubsystemType_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CSLogInitIfNeededWithSubsystemType_once != -1) {
    dispatch_once(&CSLogInitIfNeededWithSubsystemType_once, block);
  }
}

void __CSLogInitIfNeededWithSubsystemType_block_invoke()
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (const char *)CSLoggingSubsystem;
  os_log_t v1 = os_log_create((const char *)CSLoggingSubsystem, (const char *)kCSLoggingContextFramework);
  uint64_t v2 = (void *)CSLogContextFacilityCoreSpeech;
  CSLogContextFacilityCoreSpeech = (uint64_t)v1;

  os_log_t v3 = os_log_create(v0, (const char *)kCSLoggingCategoryVT);
  int v4 = (void *)CSLogCategoryVT;
  CSLogCategoryVT = (uint64_t)v3;

  os_log_t v5 = os_log_create(v0, (const char *)kCSLoggingCategoryEP);
  uint64_t v6 = (void *)CSLogCategoryEP;
  CSLogCategoryEP = (uint64_t)v5;

  os_log_t v7 = os_log_create(v0, (const char *)kCSLoggingCategorySDSD);
  uint64_t v8 = (void *)CSLogCategorySDSD;
  CSLogCategorySDSD = (uint64_t)v7;

  os_log_t v9 = os_log_create(v0, (const char *)kCSLoggingCategoryAsset);
  uint64_t v10 = (void *)CSLogCategoryAsset;
  CSLogCategoryAsset = (uint64_t)v9;

  os_log_t v11 = os_log_create(v0, (const char *)kCSLoggingCategoryRequest);
  v12 = (void *)CSLogCategoryRequest;
  CSLogCategoryRequest = (uint64_t)v11;

  os_log_t v13 = os_log_create(v0, (const char *)kCSLoggingCategoryAudio);
  uint64_t v14 = (void *)CSLogCategoryAudio;
  CSLogCategoryAudio = (uint64_t)v13;

  os_log_t v15 = os_log_create(v0, (const char *)kCSLoggingCategoryASV);
  id v16 = (void *)CSLogCategoryASV;
  CSLogCategoryASV = (uint64_t)v15;

  os_log_t v17 = os_log_create(v0, (const char *)kCSLoggingCategoryAdBlocker);
  char v18 = (void *)CSLogCategoryAdBlocker;
  CSLogCategoryAdBlocker = (uint64_t)v17;

  os_log_t v19 = os_log_create(v0, (const char *)kCSLoggingCategorySpkrId);
  v20 = (void *)CSLogCategorySpkrId;
  CSLogCategorySpkrId = (uint64_t)v19;

  os_log_t v21 = os_log_create(v0, (const char *)kCSLoggingCategoryAttending);
  size_t v22 = (void *)CSLogCategoryAttending;
  CSLogCategoryAttending = (uint64_t)v21;

  id v23 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v24 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v23;

  v25 = (void *)_dateFormatter;
  v26 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v25 setLocale:v26];

  [(id)_dateFormatter setDateFormat:@"yyyyMMdd-HHmmss"];
  v27 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315394;
    id v29 = "CSLogInitIfNeededWithSubsystemType_block_invoke";
    __int16 v30 = 2080;
    v31 = "Unknown";
    _os_log_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_DEFAULT, "%s ::: CoreSpeech logging initialized (%s)", (uint8_t *)&v28, 0x16u);
  }
}

void CSLogInitIfNeeded()
{
}

void SSRLogInitIfNeeded()
{
  if (SSRLogInitIfNeeded_once != -1) {
    dispatch_once(&SSRLogInitIfNeeded_once, &__block_literal_global_716);
  }
  CSLogInitIfNeededWithSubsystemType(0);
}

void __SSRLogInitIfNeeded_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = os_log_create((const char *)SSRLoggingSubsystem, (const char *)kSSRLoggingContextFramework);
  os_log_t v1 = (void *)SSRLogContextFacilityCoreSpeech;
  SSRLogContextFacilityCoreSpeech = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  os_log_t v3 = (void *)_ssrDateFormatter;
  _ssrDateFormatter = (uint64_t)v2;

  int v4 = (void *)_ssrDateFormatter;
  os_log_t v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [(id)_ssrDateFormatter setDateFormat:@"yyyyMMdd-HHmmss"];
  uint64_t v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "SSRLogInitIfNeeded_block_invoke";
    __int16 v9 = 2080;
    uint64_t v10 = "Unknown";
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s ::: SSR logging initialized (%s)", (uint8_t *)&v7, 0x16u);
  }
}

CSAudioSpectralMeterImpl *std::unique_ptr<CSAudioSpectralMeterImpl>::reset[abi:ne180100](CSAudioSpectralMeterImpl **a1, CSAudioSpectralMeterImpl *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    CSAudioSpectralMeterImpl::~CSAudioSpectralMeterImpl(result);
    JUMPOUT(0x1BA9E6B40);
  }
  return result;
}

void sub_1BA1B655C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1B6628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA1B67BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }

  _Unwind_Resume(a1);
}

void *std::vector<float>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1BA1B6870(_Unwind_Exception *exception_object)
{
  os_log_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1BA1B68EC(_Unwind_Exception *exception_object)
{
  os_log_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E61FEFB0, MEMORY[0x1E4FBA1C8]);
}

void sub_1BA1B6A14(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1BA1B6B50(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  MEMORY[0x1BA9E6B40](v12, 0x10B0C4088403731);
  if (a2 == 2)
  {
    os_log_t v15 = __cxa_begin_catch(a1);
    id v16 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      os_log_t v19 = *(uint64_t (**)(void *))(*(void *)v15 + 16);
      v20 = v16;
      uint64_t v21 = v19(v15);
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "-[CSAudioSpectralMeter initWithSampleRate:windowSize:]";
      WORD6(buf) = 2080;
      *(void *)((char *)&buf + 14) = v21;
      _os_log_fault_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_FAULT, "%s Invalid Argument Passed to Constructor of CSAudioSpectralMeterImpl. %s", (uint8_t *)&buf, 0x16u);
    }
  }
  else
  {
    if (a2 != 1)
    {

      _Unwind_Resume(a1);
    }
    os_log_t v17 = __cxa_begin_catch(a1);
    char v18 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      size_t v22 = *(uint64_t (**)(void *))(*(void *)v17 + 16);
      id v23 = v18;
      uint64_t v24 = v22(v17);
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "-[CSAudioSpectralMeter initWithSampleRate:windowSize:]";
      WORD6(buf) = 2080;
      *(void *)((char *)&buf + 14) = v24;
      _os_log_fault_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_FAULT, "%s Failed to allocate CSAudioSpectralMeterImpl. %s", (uint8_t *)&buf, 0x16u);
    }
  }
  __cxa_end_catch();
  JUMPOUT(0x1BA1B6B10);
}

uint64_t CSAudioPowerServiceGetXPCInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13DC820];
}

void sub_1BA1B84F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1B85A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA1B8660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA1B87B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1B886C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSSiriUserSupportBaseURL()
{
  if (CSSiriUserSupportBaseURL_once != -1) {
    dispatch_once(&CSSiriUserSupportBaseURL_once, &__block_literal_global_1335);
  }
  os_log_t v0 = (void *)CSSiriUserSupportBaseURL_sUserSupportBaseURL;
  return v0;
}

void __CSSiriUserSupportBaseURL_block_invoke()
{
  AFUserSupportDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3 isDirectory:1];
  uint64_t v1 = (void *)CSSiriUserSupportBaseURL_sUserSupportBaseURL;
  CSSiriUserSupportBaseURL_sUserSupportBaseURL = v0;

  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 createDirectoryAtURL:CSSiriUserSupportBaseURL_sUserSupportBaseURL withIntermediateDirectories:1 attributes:0 error:0];
}

uint64_t CSSiriRefreshDeviceExperimentGroup()
{
  if (AFIsInternalInstall())
  {
    uint64_t v0 = +[CSSiriPreferences sharedPreferences];
    uint64_t v1 = [v0 internalUserClassification];

    if (v1)
    {
      _sIsCarryDevice = v1 == 1;
    }
    else
    {
      id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v3 = [v2 persistentDomainForName:@"com.apple.da"];
      uint64_t v4 = [v3 objectForKey:@"ExperimentGroup"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v4 isEqualToString:@"walkabout"]) {
          char v5 = 1;
        }
        else {
          char v5 = [v4 isEqualToString:@"carry"];
        }
      }
      else
      {
        char v5 = 0;
      }
      _sIsCarryDevice = v5;
    }
  }
  return _sIsCarryDevice;
}

uint64_t CSIsCarryDevice()
{
  return _sIsCarryDevice;
}

void sub_1BA1BBA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA1BC9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1479(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1480(uint64_t a1)
{
}

void sub_1BA1BCC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCRFetchCarPlayCapabilitiesSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CarKitLibrary();
  uint64_t result = dlsym(v2, "CRFetchCarPlayCapabilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRFetchCarPlayCapabilitiesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CarKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CarKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CarKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E61FF500;
    uint64_t v5 = 0;
    CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = CarKitLibraryCore_frameworkLibrary;
    if (CarKitLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CarKitLibraryCore_frameworkLibrary;
}

uint64_t __CarKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BA1BD240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCRCapabilitiesUserInfoKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CarKitLibrary();
  uint64_t result = dlsym(v2, "CRCapabilitiesUserInfoKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRCapabilitiesUserInfoKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CRSessionStatusCapabilitiesUpdatedNotificationCallback()
{
  id v0 = +[CSCarKitUtils sharedInstance];
  [v0 handleCarCapabilitiesUpdatedWithCompletion:0];
}

void std::default_delete<CSAudioZeroFilterImpl<unsigned short>>::operator()[abi:ne180100](uint64_t a1)
{
  id v2 = *(void **)(a1 + 56);
  if (v2)
  {
    *(void *)(a1 + 64) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1BA9E6B40);
}

void sub_1BA1BFF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (v12) {
    operator delete(v12);
  }
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a1);
}

void sub_1BA1C021C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a1);
}

void sub_1BA1C07E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1C08E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1C9FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__2020(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2021(uint64_t a1)
{
}

void sub_1BA1CA4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA1CCA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)bnnsIrMappedWeight;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA1CCCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CD1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CD418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSFMil2bnnsComputeBackend;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA1CDBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (v21) {
    operator delete(v21);
  }
  if (__p) {
    operator delete(__p);
  }
  if (a20) {
    operator delete(a20);
  }

  _Unwind_Resume(a1);
}

void *std::vector<char const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = 8 * a2;
    uint64_t v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_1BA1CDDB4(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA1CE21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CE5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CE7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CEA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  if (a12) {
    operator delete(a12);
  }

  _Unwind_Resume(a1);
}

void sub_1BA1CEE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CEF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CF0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CF2B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CF58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CF844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CFA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1CFF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BA1D018C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1D030C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1D071C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2434(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2435(uint64_t a1)
{
}

uint64_t __CSIsHorseman_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CSIsHorseman_isHorseman = result;
  return result;
}

uint64_t __CSIsIPad_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  CSIsIPad_isIPad = result == 3;
  return result;
}

id CSResourcePathInSystemDomainMaskByAppending(void *a1, int a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v20 = a1;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v3)
  {
    uint64_t v6 = 0;
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(obj);
      }
      __int16 v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (a2)
      {
        uint64_t v10 = @"/";
        if (!+[CSUtils isDarwinOS])
        {
          CPSystemRootDirectory();
          uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        id v11 = [(__CFString *)v10 stringByAppendingPathComponent:v9];
      }
      else
      {
        id v11 = v9;
      }
      uint64_t v12 = [v11 stringByAppendingPathComponent:v20];
      uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v14 = [v13 fileExistsAtPath:v12];

      if (v14)
      {
        id v15 = v12;

        ++v5;
        uint64_t v6 = v15;
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  }
  while (v4);
  if (v5 != 1)
  {
    if (v5)
    {
      uint64_t v16 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315394;
      v26 = "CSResourcePathInSystemDomainMaskByAppending";
      __int16 v27 = 2112;
      id v28 = v20;
      os_log_t v17 = "%s More than 1 path %@ are founded in system domain mask, returning the last one as default";
LABEL_25:
      _os_log_fault_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_FAULT, v17, buf, 0x16u);
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v16 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315394;
    v26 = "CSResourcePathInSystemDomainMaskByAppending";
    __int16 v27 = 2112;
    id v28 = v20;
    os_log_t v17 = "%s Resource path %@ is not founded in system domain mask, returning nil path";
    goto LABEL_25;
  }
LABEL_21:

  return v6;
}

void __CSIsInternalBuild_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  CSIsInternalBuild_isInternal = [v0 BOOLValue];
}

void __CSIsVirtualMachine_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID()) {
      CSIsVirtualMachine_isVM = CFBooleanGetValue(v1) == 1;
    }
    CFRelease(v1);
  }
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    if (CSIsVirtualMachine_isVM) {
      uint64_t v4 = @"YES";
    }
    else {
      uint64_t v4 = @"NO";
    }
    int v5 = 136315394;
    uint64_t v6 = "CSIsVirtualMachine_block_invoke";
    __int16 v7 = 2114;
    size_t v8 = v4;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s isVirtualMachine ? %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

uint64_t __CSHasAOP_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CSHasAOP_hasAOP = result;
  return result;
}

uint64_t CSIsWatch()
{
  return 0;
}

uint64_t CSIsIPhone()
{
  return 1;
}

uint64_t CSIsIOS()
{
  return 1;
}

uint64_t CSIsTV()
{
  return 0;
}

uint64_t CSIsXR()
{
  return 0;
}

uint64_t CSIsSimulator()
{
  return 0;
}

uint64_t CSIsEmbedded()
{
  return 1;
}

uint64_t CSIsMac()
{
  return 0;
}

uint64_t CSIsASMacWithAOP()
{
  return 0;
}

uint64_t CSIsOSX()
{
  return 0;
}

uint64_t CSHasAOP()
{
  if (CSHasAOP_onceToken != -1) {
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_38);
  }
  return CSHasAOP_hasAOP;
}

BOOL CSIsGibraltarMac()
{
  BOOL result = +[CSUtils hasRemoteCoreSpeech];
  if (result)
  {
    return +[CSUtils hasRemoteBuiltInMic];
  }
  return result;
}

uint64_t CSIsMacMini()
{
  return 0;
}

uint64_t CSIsTorpedo()
{
  if (CSIsTorpedo_onceToken != -1) {
    dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2863);
  }
  return CSIsTorpedo_isTorpedo;
}

uint64_t __CSIsTorpedo_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CSIsTorpedo_isTorpedo = result;
  return result;
}

uint64_t CSIsHorseman()
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

uint64_t CSIsHorsemanLiveOn()
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman) {
    return 0;
  }
  CFBooleanRef v0 = (void *)CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  uint64_t v2 = [v0 isEqualToString:@"walkabout"];

  return v2;
}

uint64_t CSIsHorsemanJunior()
{
  if (CSIsHorsemanJunior_onceToken != -1) {
    dispatch_once(&CSIsHorsemanJunior_onceToken, &__block_literal_global_20);
  }
  return CSIsHorsemanJunior_isHorsemanJunior;
}

unint64_t __CSIsHorsemanJunior_block_invoke()
{
  unint64_t result = +[CSUtils horsemanDeviceType];
  CSIsHorsemanJunior_isHorsemanJunior = result == 2;
  return result;
}

uint64_t CSIsCommunalDevice()
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

uint64_t CSIsIPad()
{
  if (CSIsIPad_onceToken != -1) {
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_22);
  }
  return CSIsIPad_isIPad;
}

uint64_t CSIsVirtualMachine()
{
  if (CSIsVirtualMachine_onceToken != -1) {
    dispatch_once(&CSIsVirtualMachine_onceToken, &__block_literal_global_27);
  }
  return CSIsVirtualMachine_isVM;
}

uint64_t CSSupportsVibrator()
{
  if (CSSupportsVibrator_onceToken != -1) {
    dispatch_once(&CSSupportsVibrator_onceToken, &__block_literal_global_43);
  }
  return CSSupportsVibrator_hasHaptic;
}

uint64_t __CSSupportsVibrator_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CSSupportsVibrator_hasHaptic = result;
  return result;
}

uint64_t CSSupportsUSBTypeC()
{
  if (CSSupportsUSBTypeC_onceToken != -1) {
    dispatch_once(&CSSupportsUSBTypeC_onceToken, &__block_literal_global_48);
  }
  return CSSupportsUSBTypeC_supportsUSBTypeC;
}

uint64_t __CSSupportsUSBTypeC_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CSSupportsUSBTypeC_supportsUSBTypeC = result;
  return result;
}

uint64_t CSIsBridgeOS()
{
  return 0;
}

uint64_t CSIsAppleSiliconMac()
{
  return 0;
}

uint64_t CSIsInternalBuild()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  return CSIsInternalBuild_isInternal;
}

uint64_t CSUsesMirroredCensorSetting()
{
  return 0;
}

uint64_t CSUsesExplicitContentAllowedForCensorSetting()
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

BOOL CSShouldCensorSpeech()
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  int v0 = CSIsHorseman_isHorseman;
  CFBooleanRef v1 = [MEMORY[0x1E4F74228] sharedConnection];
  uint64_t v2 = v1;
  if (v0) {
    BOOL v3 = [v1 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FF0]] != 1;
  }
  else {
    BOOL v3 = [v1 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F20]] == 1;
  }

  return v3;
}

__CFString *CSSystemRootDirectory()
{
  if (+[CSUtils isDarwinOS])
  {
    int v0 = @"/";
  }
  else
  {
    CPSystemRootDirectory();
    int v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

double CSMachAbsoluteTimeGetTimeInterval(unint64_t a1)
{
  if (_CSMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
  }
  return *(double *)&_CSMachAbsoluteTimeRate_rate * (double)a1 / 1000000000.0;
}

uint64_t CSMachAbsoluteTimeAddTimeInterval(uint64_t a1, double a2)
{
  if (_CSMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
  }
  return (unint64_t)(a2 * 1000000000.0 / *(double *)&_CSMachAbsoluteTimeRate_rate) + a1;
}

uint64_t CSMachAbsoluteTimeSubtractTimeInterval(uint64_t a1, double a2)
{
  if (_CSMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
  }
  return a1 - (unint64_t)(a2 * 1000000000.0 / *(double *)&_CSMachAbsoluteTimeRate_rate);
}

uint64_t CSMachAbsoluteTimeToMachContinuousTime(uint64_t a1)
{
  return a1;
}

void CSSafeSetOutErrorWithNSError(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    *a1 = v3;
  }
  else if (v3)
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      __int16 v7 = "CSSafeSetOutErrorWithNSError";
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_1BA1DBA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3123(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3124(uint64_t a1)
{
}

void sub_1BA1DD80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1DDC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA1DDD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1DDE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1DE04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1DE3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4403(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4404(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4622(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4623(uint64_t a1)
{
}

void NonlinearBeepCanceller::NonlinearBeepCanceller(NonlinearBeepCanceller *this)
{
  *(_DWORD *)this = 4;
  *(_OWORD *)((char *)this + 4) = xmmword_1BA25E690;
  *(_OWORD *)((char *)this + 20) = xmmword_1BA25E6A0;
  *(_OWORD *)((char *)this + 36) = xmmword_1BA25E6B0;
  *(_OWORD *)((char *)this + 52) = xmmword_1BA25E6C0;
  *(void *)((char *)this + 68) = 0x4000000001;
  *((_DWORD *)this + 19) = 16000;
  *(_OWORD *)((char *)this + 84) = xmmword_1BA25E6D0;
  *(void *)((char *)this + 108) = 0x1E3CE50800000000;
  *(void *)((char *)this + 100) = 0x3F0000003B000000;
  bzero((char *)this + 116, 0x2E4uLL);
}

{
  *(_DWORD *)this = 4;
  *(_OWORD *)((char *)this + 4) = xmmword_1BA25E690;
  *(_OWORD *)((char *)this + 20) = xmmword_1BA25E6A0;
  *(_OWORD *)((char *)this + 36) = xmmword_1BA25E6B0;
  *(_OWORD *)((char *)this + 52) = xmmword_1BA25E6C0;
  *(void *)((char *)this + 68) = 0x4000000001;
  *((_DWORD *)this + 19) = 16000;
  *(_OWORD *)((char *)this + 84) = xmmword_1BA25E6D0;
  *(void *)((char *)this + 108) = 0x1E3CE50800000000;
  *(void *)((char *)this + 100) = 0x3F0000003B000000;
  bzero((char *)this + 116, 0x2E4uLL);
}

void NonlinearBeepCanceller::nl_init(NonlinearBeepCanceller *this, int a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10, int a11, int a12, int a13, int a14, int a15, int a16, float a17, unsigned int a18)
{
  *(_DWORD *)this = a2;
  *((float *)this + 6) = __exp10f(a5 / 10.0);
  *((float *)this + 7) = a6;
  *((float *)this + 8) = a7;
  *((float *)this + 9) = a8;
  *((float *)this + 10) = __exp10f(a9 / 10.0);
  float v31 = __exp10f(a17 / 10.0);
  *((void *)this + 14) = 507307272;
  *((_DWORD *)this + 13) = a11;
  *((_DWORD *)this + 14) = a12;
  *((_DWORD *)this + 15) = a13 & 0xFFFFFFFE;
  *((_DWORD *)this + 16) = a14;
  *((_DWORD *)this + 17) = a15;
  *((_DWORD *)this + 18) = a16;
  *((_DWORD *)this + 19) = a18;
  vDSP_Length v32 = (a13 & 0xFFFFFFFE) * a16;
  *((_DWORD *)this + 21) = v32;
  *((_DWORD *)this + 22) = v32;
  *((_DWORD *)this + 23) = v32 >> 1;
  *((_DWORD *)this + 24) = (v32 >> 1) + 1;
  *((_DWORD *)this + 27) = 0;
  *((float *)this + 11) = a10;
  *((float *)this + 12) = v31;
  *((void *)this + 105) = vDSP_DFT_zrop_CreateSetup(*((vDSP_DFT_Setup *)this + 105), v32, vDSP_DFT_FORWARD);
  *((void *)this + 106) = vDSP_DFT_zrop_CreateSetup(*((vDSP_DFT_Setup *)this + 106), *((unsigned int *)this + 22), vDSP_DFT_INVERSE);
  *((float *)this + 25) = 2.0 / (float)((float)*((unsigned int *)this + 22) * (float)*((unsigned int *)this + 15));
  *((_DWORD *)this + 26) = 1056964608;
  float v33 = (float)*((unsigned int *)this + 18) / (float)*((unsigned int *)this + 19);
  if (a3 <= 0.0)
  {
    *((_DWORD *)this + 1) = 0;
    *((_DWORD *)this + 5) = -1082130432;
    float v36 = 0.0;
  }
  else
  {
    float v34 = -v33 / a3;
    float v35 = expf(v34);
    *((float *)this + 1) = v35;
    *((float *)this + 5) = -(float)(1.0 - v35);
    float v36 = 0.0;
    if (v35 > 0.0) {
      float v36 = sqrtf(v35);
    }
  }
  *((float *)this + 4) = v36;
  float v37 = 0.0;
  if (a4 > 0.0)
  {
    float v38 = -v33 / a4;
    float v37 = expf(v38);
  }
  *((float *)this + 2) = v37;
  *((float *)this + 3) = 1.0 - v37;
  unint64_t v39 = *((unsigned int *)this + 17);
  unsigned int v165 = *((_DWORD *)this + 14);
  unsigned int v163 = *((_DWORD *)this + 13);
  long long v173 = *(_OWORD *)((char *)this + 168);
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0;
  uint64_t v174 = *((void *)this + 23);
  *((void *)this + 23) = 0;
  v175 = (void **)&v173;
  std::vector<std::vector<unsigned int>>::__destroy_vector::operator()[abi:ne180100](&v175);
  v40 = this;
  uint64_t v42 = (void *)*((void *)this + 21);
  uint64_t v41 = (void *)*((void *)this + 22);
  unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * (v41 - v42);
  unint64_t v168 = v39;
  _CF = v39 >= v43;
  BOOL v45 = v39 > v43;
  unint64_t v46 = v39 - v43;
  if (!v45)
  {
    if (!_CF)
    {
      v61 = &v42[3 * v168];
      if (v41 != v61)
      {
        v62 = (void *)*((void *)this + 22);
        do
        {
          v64 = (void *)*(v62 - 3);
          v62 -= 3;
          v63 = v64;
          if (v64)
          {
            *(v41 - 2) = v63;
            operator delete(v63);
          }
          uint64_t v41 = v62;
        }
        while (v62 != v61);
      }
      v40 = this;
      *((void *)this + 22) = v61;
    }
    goto LABEL_37;
  }
  uint64_t v47 = *((void *)this + 23);
  if (0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v41) >> 3) >= v46)
  {
    bzero(v41, 24 * ((24 * v46 - 24) / 0x18) + 24);
    v40 = this;
    *((void *)this + 22) = &v41[3 * ((24 * v46 - 24) / 0x18) + 3];
    goto LABEL_37;
  }
  unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v42) >> 3);
  unint64_t v49 = 0x5555555555555556 * ((v47 - (uint64_t)v42) >> 3);
  if (v49 <= v168) {
    unint64_t v49 = v168;
  }
  if (v48 >= 0x555555555555555) {
    unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v50 = v49;
  }
  if (v50 > 0xAAAAAAAAAAAAAAALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v51 = 3 * v50;
  uint64_t v52 = (char *)operator new(24 * v50);
  v53 = &v52[8 * (v41 - v42)];
  v54 = &v52[8 * v51];
  bzero(v53, 24 * ((24 * v46 - 24) / 0x18) + 24);
  v55 = &v53[24 * ((24 * v46 - 24) / 0x18) + 24];
  if (v41 == v42)
  {
    v40 = this;
    *((void *)this + 21) = v53;
    *((void *)this + 22) = v55;
    *((void *)this + 23) = v54;
    if (!v41) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v40 = this;
  do
  {
    *((void *)v53 - 3) = 0;
    *((void *)v53 - 2) = 0;
    v53 -= 24;
    *((void *)v53 + 2) = 0;
    long long v56 = *(_OWORD *)(v41 - 3);
    v41 -= 3;
    *(_OWORD *)v53 = v56;
    *((void *)v53 + 2) = v41[2];
    *uint64_t v41 = 0;
    v41[1] = 0;
    v41[2] = 0;
  }
  while (v41 != v42);
  v57 = (void *)*((void *)this + 21);
  uint64_t v41 = (void *)*((void *)this + 22);
  *((void *)this + 21) = v53;
  *((void *)this + 22) = v55;
  *((void *)this + 23) = v54;
  if (v41 != v57)
  {
    v58 = v41;
    do
    {
      v60 = (void *)*(v58 - 3);
      v58 -= 3;
      v59 = v60;
      if (v60)
      {
        *(v41 - 2) = v59;
        operator delete(v59);
      }
      uint64_t v41 = v58;
    }
    while (v58 != v57);
    uint64_t v41 = v57;
    v40 = this;
  }
  if (v41)
  {
LABEL_36:
    operator delete(v41);
    v40 = this;
  }
LABEL_37:
  if (v168)
  {
    for (uint64_t i = 0; i != v168; ++i)
    {
      if ((v163 >> i)) {
        unsigned int v66 = v165;
      }
      else {
        unsigned int v66 = 1;
      }
      if (v66)
      {
        for (unsigned int j = 1; j <= v66; j += 2)
        {
          uint64_t v68 = *((void *)v40 + 21) + 24 * i;
          v70 = (unsigned int **)(v68 + 8);
          v69 = *(unsigned int **)(v68 + 8);
          unint64_t v71 = *(void *)(v68 + 16);
          if ((unint64_t)v69 >= v71)
          {
            v73 = *(unsigned int **)v68;
            uint64_t v74 = ((uint64_t)v69 - *(void *)v68) >> 2;
            unint64_t v75 = v74 + 1;
            if ((unint64_t)(v74 + 1) >> 62) {
              goto LABEL_106;
            }
            uint64_t v76 = v71 - (void)v73;
            if (v76 >> 1 > v75) {
              unint64_t v75 = v76 >> 1;
            }
            if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v77 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v77 = v75;
            }
            if (v77)
            {
              unint64_t v77 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v77);
              v69 = *v70;
              v73 = *(unsigned int **)v68;
            }
            else
            {
              uint64_t v78 = 0;
            }
            v79 = (unsigned int *)(v77 + 4 * v74);
            unsigned int *v79 = j;
            v72 = v79 + 1;
            while (v69 != v73)
            {
              unsigned int v80 = *--v69;
              *--v79 = v80;
            }
            *(void *)uint64_t v68 = v79;
            *v70 = v72;
            *(void *)(v68 + 16) = v77 + 4 * v78;
            if (v73) {
              operator delete(v73);
            }
            v40 = this;
          }
          else
          {
            unsigned int *v69 = j;
            v72 = v69 + 1;
          }
          *v70 = v72;
        }
      }
    }
  }
  *((_DWORD *)v40 + 20) = 0;
  uint64_t v82 = *((void *)v40 + 21);
  uint64_t v81 = *((void *)v40 + 22);
  uint64_t v83 = v81 - v82;
  if (v81 != v82)
  {
    int v84 = 0;
    unint64_t v85 = 0xAAAAAAAAAAAAAAABLL * (v83 >> 3);
    v86 = (void *)(v82 + 8);
    unsigned int v87 = 1;
    do
    {
      v84 += (*v86 - *(v86 - 1)) >> 2;
      v86 += 3;
      BOOL v45 = v85 > v87++;
    }
    while (v45);
    *((_DWORD *)v40 + 20) = v84;
  }
  v89 = (uint64_t *)((char *)v40 + 192);
  v88 = (char *)*((void *)v40 + 24);
  unint64_t v90 = *(unsigned int *)v40;
  uint64_t v91 = *((void *)v40 + 26);
  if (v90 > (v91 - (uint64_t)v88) >> 2)
  {
    if (v88)
    {
      *((void *)this + 25) = v88;
      operator delete(v88);
      uint64_t v91 = 0;
      uint64_t *v89 = 0;
      v89[1] = 0;
      v89[2] = 0;
    }
    uint64_t v92 = v91 >> 1;
    if (v91 >> 1 <= v90) {
      uint64_t v92 = v90;
    }
    if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v93 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v93 = v92;
    }
    if (v93 >> 62) {
LABEL_106:
    }
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v94 = std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v93);
    *((void *)this + 24) = v94;
    *((void *)this + 26) = &v94[v95];
    v96 = (char *)&v94[v90];
    uint64_t v97 = 4 * v90;
    do
    {
      *v94++ = 0;
      v97 -= 4;
    }
    while (v97);
    goto LABEL_90;
  }
  v98 = (char *)*((void *)v40 + 25);
  unint64_t v99 = (v98 - v88) >> 2;
  if (v99 >= v90) {
    uint64_t v100 = *(unsigned int *)v40;
  }
  else {
    uint64_t v100 = (v98 - v88) >> 2;
  }
  if (v100)
  {
    v101 = (_DWORD *)*((void *)v40 + 24);
    do
    {
      *v101++ = 0;
      --v100;
    }
    while (v100);
  }
  if (v90 <= v99)
  {
    v96 = &v88[4 * v90];
LABEL_90:
    *((void *)this + 25) = v96;
    goto LABEL_91;
  }
  v102 = &v98[4 * (v90 - v99)];
  uint64_t v103 = 4 * v90 - 4 * v99;
  do
  {
    *(_DWORD *)v98 = 0;
    v98 += 4;
    v103 -= 4;
  }
  while (v103);
  *((void *)this + 25) = v102;
LABEL_91:
  unint64_t v104 = *((unsigned int *)this + 20);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 27, v104, &v173);
  unint64_t v105 = *((unsigned int *)this + 22);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 30, v105, &v173);
  unint64_t v106 = *((unsigned int *)this + 22);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 33, v106, &v173);
  unint64_t v107 = *((unsigned int *)this + 22);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 36, v107, &v173);
  unint64_t v108 = *((unsigned int *)this + 16);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 39, v108, &v173);
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 42, *((_DWORD *)this + 20), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 45, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 48, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 51, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 54, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 57, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 60, *((_DWORD *)this + 20), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 63, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 66, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 69, *((_DWORD *)this + 16), *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 72, *((_DWORD *)this + 16), *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 102, *((_DWORD *)this + 16), *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)this + 600, *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)this + 624, *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 81, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 84, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), *((float *)this + 12));
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 87, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 90, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), *((float *)this + 12));
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 93, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 96, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((void *)this + 99, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), 0.0);
  if (*(_DWORD *)this != 1)
  {
    unint64_t v110 = 0;
    uint64_t v111 = *v89;
    do
    {
      *(_DWORD *)(v111 + 4 * v110) = v110 + 1;
      ++v110;
    }
    while (v110 < (*(_DWORD *)this - 1));
  }
  uint64_t v112 = *((unsigned int *)this + 22);
  if (v112)
  {
    *(float *)v109.i32 = (float)v112;
    float32x4_t v154 = (float32x4_t)vdupq_lane_s32(v109, 0);
    uint64x2_t v155 = (uint64x2_t)vdupq_n_s64(v112 - 1);
    uint64_t v113 = (v112 + 3) & 0x1FFFFFFFCLL;
    uint64x2_t v114 = (uint64x2_t)xmmword_1BA25E6E0;
    uint64x2_t v115 = (uint64x2_t)xmmword_1BA25E6F0;
    uint32x4_t v116 = (uint32x4_t)xmmword_1BA25E700;
    v117 = (_DWORD *)(*((void *)this + 30) + 8);
    __asm
    {
      FMOV            V4.4S, #4.0
      FMOV            V1.4S, #1.0
    }
    float32x4_t v166 = _Q1;
    __asm { FMOV            V1.4S, #3.0 }
    float32x4_t v152 = _Q1;
    float32x4_t v153 = _Q4;
    float32x4_t v150 = (float32x4_t)vdupq_n_s32(0x3FC90FDBu);
    float64x2_t v151 = (float64x2_t)vdupq_n_s64(0x3FF459A5D6E6692DuLL);
    int64x2_t v149 = vdupq_n_s64(4uLL);
    do
    {
      int64x2_t v162 = (int64x2_t)v115;
      int64x2_t v164 = (int64x2_t)v114;
      int8x16_t v124 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_u64(v155, v115), (int32x4_t)vcgeq_u64(v155, v114));
      int32x4_t v161 = (int32x4_t)v116;
      float32x4_t v125 = vdivq_f32(vmulq_f32(vcvtq_f32_u32(v116), v153), v154);
      int8x16_t v126 = (int8x16_t)vcgtq_f32(v166, v125);
      v127.i64[0] = 0x4000000040000000;
      v127.i64[1] = 0x4000000040000000;
      int8x16_t v128 = (int8x16_t)vcgtq_f32(v127, v125);
      int8x16_t v129 = (int8x16_t)vcgtq_f32(v152, v125);
      float32x4_t v130 = vsubq_f32(v127, v125);
      v131.i64[0] = 0xC0000000C0000000;
      v131.i64[1] = 0xC0000000C0000000;
      int8x16_t v132 = vandq_s8(v124, v126);
      int8x16_t v133 = vbicq_s8(v124, v126);
      int32x4_t v134 = (int32x4_t)vandq_s8(v133, v128);
      int8x16_t v135 = vbicq_s8(v133, v128);
      int32x4_t v159 = (int32x4_t)vandq_s8(v135, v129);
      int8x16_t v160 = v132;
      int32x4_t v157 = (int32x4_t)vbicq_s8(v135, v129);
      int8x16_t v158 = (int8x16_t)v134;
      float32x4_t v136 = (float32x4_t)vbslq_s8((int8x16_t)v157, (int8x16_t)vaddq_f32(v130, v127), vbslq_s8((int8x16_t)v159, (int8x16_t)vaddq_f32(v125, v131), vbslq_s8((int8x16_t)v134, (int8x16_t)v130, (int8x16_t)v125)));
      int8x16_t v156 = (int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vorn_s8((int8x8_t)vmovn_s32(v157), vorr_s8((int8x8_t)vmovn_s32(v159), (int8x8_t)vmovn_s32(v134)))), 0x1FuLL));
      float32x4_t v172 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v136.f32), v151)), vmulq_f64(vcvt_hight_f64_f32(v136), v151)), v150);
      float v169 = cosf(v172.f32[1]);
      v137.f32[0] = cosf(v172.f32[0]);
      v137.f32[1] = v169;
      float32x4_t v170 = v137;
      float v138 = cosf(v172.f32[2]);
      float32x4_t v139 = v170;
      v139.f32[2] = v138;
      float32x4_t v171 = v139;
      float v140 = cosf(v172.f32[3]);
      float32x4_t v141 = v171;
      v141.f32[3] = v140;
      v142.i64[0] = 0x3F0000003F000000;
      v142.i64[1] = 0x3F0000003F000000;
      v143.i64[0] = 0xBF000000BF000000;
      v143.i64[1] = 0xBF000000BF000000;
      float32x4_t v144 = vmlaq_f32(v142, v143, v141);
      float32x4_t v145 = vmulq_f32(v144, v144);
      float32x4_t v146 = vsqrtq_f32((float32x4_t)vbslq_s8(v156, (int8x16_t)v145, (int8x16_t)vsubq_f32(v166, v145)));
      int16x4_t v147 = vmovn_s32((int32x4_t)vorrq_s8(vorrq_s8((int8x16_t)v157, vorrq_s8(v160, v158)), (int8x16_t)v159));
      if (v147.i8[0]) {
        *(v117 - 2) = v146.i32[0];
      }
      if (v147.i8[2]) {
        *(v117 - 1) = v146.i32[1];
      }
      if (v147.i8[4]) {
        _DWORD *v117 = v146.i32[2];
      }
      if (v147.i8[6]) {
        v117[1] = v146.i32[3];
      }
      uint64x2_t v114 = (uint64x2_t)vaddq_s64(v164, v149);
      uint64x2_t v115 = (uint64x2_t)vaddq_s64(v162, v149);
      v148.i64[0] = 0x400000004;
      v148.i64[1] = 0x400000004;
      uint32x4_t v116 = (uint32x4_t)vaddq_s32(v161, v148);
      v117 += 4;
      v113 -= 4;
    }
    while (v113);
  }
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    uint64_t v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 2;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 2;
    }
    if (v15)
    {
      uint64_t v16 = result;
      do
      {
        *(_DWORD *)uint64_t v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      os_log_t v17 = &v13[4 * (a2 - v14)];
      uint64_t v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)uint64_t v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a2) {
      uint64_t v8 = a2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    uint64_t v10 = a1[1];
    id v11 = &v10[4 * a2];
    uint64_t v12 = 4 * a2;
    do
    {
      *(_DWORD *)uint64_t v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  int v24 = 0;
  unint64_t v5 = a2;
  std::vector<float>::vector(&__p, a3, &v24);
  uint64_t v6 = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= a2)
  {
    unint64_t v12 = (a1[1] - (uint64_t)v6) / 24;
    if (v12 >= v5) {
      uint64_t v13 = v5;
    }
    else {
      uint64_t v13 = (a1[1] - (uint64_t)v6) / 24;
    }
    for (; v13; --v13)
    {
      if (v6 != (char *)&__p) {
        std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v6, (char *)__p, (uint64_t)v23, (v23 - (unsigned char *)__p) >> 2);
      }
      v6 += 24;
    }
    if (v5 <= v12)
    {
      uint64_t v17 = a1[1];
      uint64_t v18 = *a1 + 24 * v5;
      if (v17 != v18)
      {
        uint64_t v19 = a1[1];
        do
        {
          long long v21 = *(void **)(v19 - 24);
          v19 -= 24;
          id v20 = v21;
          if (v21)
          {
            *(void *)(v17 - 16) = v20;
            operator delete(v20);
          }
          uint64_t v17 = v19;
        }
        while (v19 != v18);
      }
      a1[1] = v18;
    }
    else
    {
      unint64_t v14 = (void *)a1[1];
      uint64_t v15 = &v14[3 * (v5 - v12)];
      uint64_t v16 = 24 * v5 - 24 * v12;
      do
      {
        *unint64_t v14 = 0;
        v14[1] = 0;
        v14[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v14, __p, (uint64_t)v23, (v23 - (unsigned char *)__p) >> 2);
        v14 += 3;
        v16 -= 24;
      }
      while (v16);
      a1[1] = (uint64_t)v15;
    }
  }
  else
  {
    std::vector<std::vector<float>>::__vdeallocate(a1);
    unint64_t v7 = 0x5555555555555556 * ((a1[2] - *a1) >> 3);
    if (v7 <= v5) {
      unint64_t v7 = v5;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= 0x555555555555555) {
      unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v8 = v7;
    }
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](a1, v8);
    unint64_t v9 = (void *)a1[1];
    uint64_t v10 = &v9[3 * v5];
    uint64_t v11 = 24 * v5;
    do
    {
      *unint64_t v9 = 0;
      v9[1] = 0;
      id v9[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v9, __p, (uint64_t)v23, (v23 - (unsigned char *)__p) >> 2);
      v9 += 3;
      v11 -= 24;
    }
    while (v11);
    a1[1] = (uint64_t)v10;
  }
  if (__p)
  {
    long long v23 = __p;
    operator delete(__p);
  }
}

void sub_1BA1EA46C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  int v24 = 0;
  unint64_t v6 = a3;
  std::vector<float>::vector(__p, a4, &v24);
  std::vector<std::vector<float>>::vector(&v22, v6, (uint64_t)__p);
  unint64_t v7 = a2;
  unint64_t v8 = *(void ***)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= a2)
  {
    unint64_t v14 = (*(void *)(a1 + 8) - (void)v8) / 24;
    if (v14 >= v7) {
      uint64_t v15 = v7;
    }
    else {
      uint64_t v15 = (*(void *)(a1 + 8) - (void)v8) / 24;
    }
    for (; v15; --v15)
    {
      if (v8 != (void **)&v22) {
        std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>((uint64_t)v8, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
      }
      v8 += 3;
    }
    if (v7 <= v14)
    {
      uint64_t v19 = *(void ***)(a1 + 8);
      uint64_t v20 = *(void *)a1 + 24 * v7;
      while (v19 != (void **)v20)
      {
        v19 -= 3;
        v25 = v19;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v25);
      }
      *(void *)(a1 + 8) = v20;
    }
    else
    {
      uint64_t v16 = *(void **)(a1 + 8);
      uint64_t v17 = &v16[3 * (v7 - v14)];
      uint64_t v18 = 24 * v7 - 24 * v14;
      do
      {
        *uint64_t v16 = 0;
        v16[1] = 0;
        v16[2] = 0;
        std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v16, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
        v16 += 3;
        v18 -= 24;
      }
      while (v18);
      *(void *)(a1 + 8) = v17;
    }
  }
  else
  {
    std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)a1);
    unint64_t v9 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v9 <= a2) {
      unint64_t v9 = a2;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((void *)a1, v10);
    uint64_t v11 = *(void **)(a1 + 8);
    unint64_t v12 = &v11[3 * a2];
    uint64_t v13 = 24 * v7;
    do
    {
      *uint64_t v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v11, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
      v11 += 3;
      v13 -= 24;
    }
    while (v13);
    *(void *)(a1 + 8) = v12;
  }
  v25 = (void **)&v22;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v25);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1BA1EA6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16)
{
  a16 = &a12;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_vector_init(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, float a6)
{
  float v48 = a6;
  unint64_t v9 = a4;
  std::vector<float>::vector(__p, a5, &v48);
  std::vector<std::vector<float>>::vector(&v43, v9, (uint64_t)__p);
  BOOL v45 = 0;
  unint64_t v46 = 0;
  uint64_t v47 = 0;
  unint64_t v49 = (void **)&v45;
  char v50 = 0;
  if (a3)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](&v45, a3);
    unint64_t v10 = v46;
    uint64_t v11 = &v46[3 * a3];
    uint64_t v12 = 24 * a3;
    do
    {
      *unint64_t v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v10, v43, v44, 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 3));
      v10 += 3;
      v12 -= 24;
    }
    while (v12);
    unint64_t v46 = v11;
  }
  unint64_t v13 = a2;
  uint64_t v14 = a1[2];
  uint64_t v15 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a1) >> 3) >= v13)
  {
    unint64_t v40 = (a1[1] - v15) / 24;
    uint64_t v41 = a1;
    if (v40 >= v13) {
      uint64_t v24 = v13;
    }
    else {
      uint64_t v24 = (a1[1] - v15) / 24;
    }
    if (!v24)
    {
LABEL_41:
      if (v13 <= v40)
      {
        float v38 = (void **)v41[1];
        uint64_t v39 = *v41 + 24 * v13;
        while (v38 != (void **)v39)
        {
          v38 -= 3;
          unint64_t v49 = v38;
          std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
        }
        v41[1] = v39;
      }
      else
      {
        float v35 = (void *)v41[1];
        float v36 = &v35[3 * (v13 - v40)];
        uint64_t v37 = 24 * v13 - 24 * v40;
        do
        {
          void *v35 = 0;
          v35[1] = 0;
          v35[2] = 0;
          std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v35, v45, v46, 0xAAAAAAAAAAAAAAABLL * (v46 - v45));
          v35 += 3;
          v37 -= 24;
        }
        while (v37);
        v41[1] = v36;
      }
      goto LABEL_49;
    }
    while (1)
    {
      if ((uint64_t **)v15 != &v45)
      {
        v26 = v45;
        v25 = v46;
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * (v46 - v45);
        id v28 = *(void ***)v15;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v15 + 16) - *(void *)v15) >> 3) >= v27)
        {
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v15 + 8) - (void)v28) >> 3) >= v27)
          {
            uint64_t v33 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(v45, v46, (uint64_t)v28);
            float v34 = *(void ***)(v15 + 8);
            while (v34 != (void **)v33)
            {
              v34 -= 3;
              unint64_t v49 = v34;
              std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v49);
            }
            *(void *)(v15 + 8) = v33;
            goto LABEL_40;
          }
          vDSP_Length v32 = &v45[(uint64_t)(*(void *)(v15 + 8) - (void)v28) >> 3];
          std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(v45, v32, (uint64_t)v28);
          float v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v15 + 16, v32, v25, *(void **)(v15 + 8));
        }
        else
        {
          std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)v15);
          if (v27 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v29 = 0x5555555555555556 * ((uint64_t)(*(void *)(v15 + 16) - *(void *)v15) >> 3);
          if (v29 <= v27) {
            unint64_t v29 = v27;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v15 + 16) - *(void *)v15) >> 3) >= 0x555555555555555) {
            unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v30 = v29;
          }
          std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((void *)v15, v30);
          float v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v15 + 16, v26, v25, *(void **)(v15 + 8));
        }
        *(void *)(v15 + 8) = v31;
      }
LABEL_40:
      v15 += 24;
      if (!--v24) {
        goto LABEL_41;
      }
    }
  }
  if (v15)
  {
    uint64_t v16 = (void **)a1[1];
    uint64_t v17 = (void *)*a1;
    if (v16 != (void **)v15)
    {
      do
      {
        v16 -= 3;
        unint64_t v49 = v16;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
      }
      while (v16 != (void **)v15);
      uint64_t v17 = (void *)*a1;
    }
    a1[1] = v15;
    operator delete(v17);
    uint64_t v14 = 0;
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
  uint64_t v19 = 2 * v18;
  if (2 * v18 <= v13) {
    uint64_t v19 = v13;
  }
  if (v18 >= 0x555555555555555) {
    unint64_t v20 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v20 = v19;
  }
  if (v20 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  long long v21 = operator new(24 * v20);
  *a1 = v21;
  a1[1] = v21;
  a1[2] = &v21[3 * v20];
  uint64_t v22 = &v21[3 * v13];
  uint64_t v23 = 24 * v13;
  do
  {
    void *v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v21, v45, v46, 0xAAAAAAAAAAAAAAABLL * (v46 - v45));
    v21 += 3;
    v23 -= 24;
  }
  while (v23);
  a1[1] = v22;
LABEL_49:
  unint64_t v49 = (void **)&v45;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
  unint64_t v49 = (void **)&v43;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v49);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1BA1EAB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21)
{
  a21 = &a14;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v6 = (_DWORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1BA1EAC34(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<float>>::vector(void *a1, unint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v6 = (void *)a1[1];
    uint64_t v7 = 3 * a2;
    uint64_t v8 = &v6[3 * a2];
    uint64_t v9 = 8 * v7;
    do
    {
      *unint64_t v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v6, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1BA1EACEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        unint64_t v6 = v4;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    id v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      unint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      unint64_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(void *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1BA1EAEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v3 = 3 * a2;
  uint64_t result = (char *)operator new(24 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v3];
  return result;
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      void v4[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v4, *v6, v6[1], 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3));
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1BA1EAFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1BA1EB04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void ****)(a1 + 16);
    uint64_t v4 = **(void ****)(a1 + 8);
    while (v3 != v4)
    {
      v3 -= 3;
      unint64_t v5 = v3;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
    }
  }
  return a1;
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      void v4[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1BA1EB170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = **(void **)(a1 + 16);
    uint64_t v3 = **(void **)(a1 + 8);
    if (v2 != v3)
    {
      uint64_t v4 = **(void **)(a1 + 16);
      do
      {
        uint64_t v6 = *(void **)(v4 - 24);
        v4 -= 24;
        unint64_t v5 = v6;
        if (v6)
        {
          *(void *)(v2 - 16) = v5;
          operator delete(v5);
        }
        uint64_t v2 = v4;
      }
      while (v4 != v3);
    }
  }
  return a1;
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    unint64_t v5 = a1;
    do
    {
      if (v5 != (uint64_t *)a3) {
        std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(a3, *v5, v5[1], 0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 3));
      }
      v5 += 3;
      a3 += 24;
    }
    while (v5 != a2);
  }
  return a3;
}

void std::vector<std::vector<std::vector<float>>>::__vdeallocate(void ***a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 3;
        unint64_t v5 = v3;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
      }
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  char v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    std::vector<std::vector<float>>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    uint64_t v13 = a2 + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(a2, v13, v9);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v8, v13, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  uint64_t v14 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(a2, a3, v9);
  uint64_t v15 = *(char **)(a1 + 8);
  if (v15 != v14)
  {
    uint64_t v16 = *(char **)(a1 + 8);
    do
    {
      unint64_t v18 = (void *)*((void *)v16 - 3);
      v16 -= 24;
      uint64_t v17 = v18;
      if (v18)
      {
        *((void *)v15 - 2) = v17;
        operator delete(v17);
      }
      uint64_t v15 = v16;
    }
    while (v16 != v14);
  }
  *(void *)(a1 + 8) = v14;
}

void sub_1BA1EB43C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1BA1EB444(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(uint64_t a1, uint64_t a2, char *a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      if ((char *)v5 != a3) {
        std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(a3, *(char **)v5, *(void *)(v5 + 8), (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
      }
      v5 += 24;
      a3 += 24;
    }
    while (v5 != a2);
  }
  return a3;
}

void std::vector<std::vector<float>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  char v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    char v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    char v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

void std::vector<std::vector<unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        uint64_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t NonlinearBeepCanceller::nl_proc(NonlinearBeepCanceller *this, const AudioBufferList *a2, const AudioBufferList *a3, AudioBufferList *a4, AudioBufferList *a5, AudioBufferList *a6, AudioBufferList *a7)
{
  uint64_t v9 = *((void *)this + 20);
  if (v9)
  {
    unint64_t v10 = *((void *)this + 19);
    do
    {
      --v9;
      *((void *)this + 19) = ++v10;
      *((void *)this + 20) = v9;
      if (v10 >= 0x800)
      {
        operator delete(**((void ***)this + 16));
        *((void *)this + 16) += 8;
        uint64_t v9 = *((void *)this + 20);
        unint64_t v10 = *((void *)this + 19) - 1024;
        *((void *)this + 19) = v10;
      }
    }
    while (v9);
  }
  uint64_t __C = 0;
  float v277 = 0.0;
  if (*((_DWORD *)this + 17))
  {
    v253 = a2;
    unsigned int v11 = 0;
    uint64_t v12 = 0;
    v271 = (float **)((char *)this + 288);
    while (1)
    {
      __src = (const float *)a3->mBuffers[v12].mData;
      vDSP_vmul(__src, 1, __src, 1, *((float **)this + 33), 1, *((unsigned int *)this + 18));
      if (*(void *)(*((void *)this + 21) + 24 * v12 + 8) != *(void *)(*((void *)this + 21) + 24 * v12)) {
        break;
      }
LABEL_118:
      if (++v12 >= (unint64_t)*((unsigned int *)this + 17))
      {
        uint64_t v270 = *((unsigned int *)this + 40);
        a2 = v253;
        goto LABEL_121;
      }
    }
    uint64_t v13 = 0;
    unsigned int v14 = 0;
    p_mData = &a6->mBuffers[v12].mData;
    uint64_t v262 = v12;
    while (1)
    {
      unint64_t v15 = *(char **)(*((void *)this + 42) + 24 * v11);
      memmove(v15, &v15[4 * *((unsigned int *)this + 18)], 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18)));
      memcpy((void *)(*(void *)(*((void *)this + 42) + 24 * v11)+ 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18))), __src, 4 * *((unsigned int *)this + 18));
      unsigned int v16 = *(_DWORD *)(*(void *)(*((void *)this + 21) + 24 * v12) + 4 * v13);
      if (v16 >= 2)
      {
        unsigned int v17 = v16 >> 1;
        do
        {
          vDSP_Length v18 = *((unsigned int *)this + 18);
          uint64_t v19 = (float *)(*(void *)(*((void *)this + 42) + 24 * v11)
                        + 4 * (*((_DWORD *)this + 22) - v18));
          vDSP_vmul(v19, 1, *((const float **)this + 33), 1, v19, 1, v18);
          --v17;
        }
        while (v17);
      }
      NonlinearBeepCanceller::fcn_wola_analysis(*((const vDSP_DFT_SetupStruct **)this + 105), *(const float **)(*((void *)this + 42) + 24 * v11), *((const float **)this + 30), v271, *(float **)(*(void *)(*((void *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27)), *((unsigned int *)this + 22), *((_DWORD *)this + 23), *((float *)this + 26));
      unint64_t v20 = *(float **)(*(void *)(*((void *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27));
      long long v21 = *(float **)(*(void *)(*((void *)this + 78) + 24 * v11) + 24 * *((unsigned int *)this + 27));
      uint64_t v22 = *((unsigned int *)this + 23);
      __A.realp = v20 + 1;
      __A.imagp = &v20[(v22 + 1)];
      vDSP_zvmags(&__A, 1, v21 + 1, 1, (v22 - 1));
      float *v21 = *v20 * *v20;
      v21[v22] = v20[v22] * v20[v22];
      uint64_t v23 = *((void *)this + 27);
      *(_DWORD *)(v23 + 4 * v11) = 0;
      LODWORD(v24) = *(_DWORD *)this;
      if (*(_DWORD *)this)
      {
        uint64_t v25 = 0;
        unint64_t v26 = 0;
        do
        {
          vDSP_meanv(*(const float **)(*(void *)(*((void *)this + 78) + 24 * v11) + v25), 1, (float *)&__C + 1, *((unsigned int *)this + 24));
          uint64_t v23 = *((void *)this + 27);
          float v27 = *(float *)(v23 + 4 * v11) + *((float *)&__C + 1);
          *(float *)(v23 + 4 * v11) = v27;
          ++v26;
          unint64_t v24 = *(unsigned int *)this;
          v25 += 24;
        }
        while (v26 < v24);
      }
      else
      {
        float v27 = 0.0;
      }
      float v28 = *((float *)this + 28) + (float)(v27 / (float)(*((_DWORD *)this + 22) * v24));
      *(float *)(v23 + 4 * v11) = v28;
      if ((float)(log10f(v28) * 10.0) <= *((float *)this + 11)) {
        goto LABEL_105;
      }
      unint64_t v29 = (char *)*((void *)this + 17);
      unint64_t v30 = (char *)*((void *)this + 16);
      uint64_t v31 = v29 - v30;
      uint64_t v32 = v29 == v30 ? 0 : ((v29 - v30) << 7) - 1;
      unint64_t v34 = *((void *)this + 19);
      uint64_t v33 = *((void *)this + 20);
      unint64_t v35 = v33 + v34;
      if (v32 == v33 + v34) {
        break;
      }
      uint64_t v12 = v262;
LABEL_104:
      *(_DWORD *)(*(void *)&v30[(v35 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v35 & 0x3FF)) = v11;
      *((void *)this + 20) = v33 + 1;
LABEL_105:
      uint64_t v127 = *((void *)this + 21);
      uint64_t v128 = *(void *)(v127 + 24 * v12);
      if (*(_DWORD *)(v128 + 4 * v13) == 1)
      {
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*(void *)(*((void *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27)), (const float **)this + 30, (const float **)(*((void *)this + 60) + 24 * v11), (const float **)v271, *p_mData, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        uint64_t v127 = *((void *)this + 21);
        uint64_t v128 = *(void *)(v127 + 24 * v12);
      }
      ++v11;
      uint64_t v13 = ++v14;
      if (v14 >= (unint64_t)((*(void *)(v127 + 24 * v12 + 8) - v128) >> 2)) {
        goto LABEL_118;
      }
    }
    unsigned int v269 = v14;
    if (v34 < 0x400)
    {
      float v48 = (char *)*((void *)this + 18);
      unint64_t v49 = (char *)*((void *)this + 15);
      uint64_t v263 = v31 >> 3;
      if (v31 >> 3 >= (unint64_t)((v48 - v49) >> 3))
      {
        if (v48 == v49) {
          unint64_t v52 = 1;
        }
        else {
          unint64_t v52 = (v48 - v49) >> 2;
        }
        v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v52);
        uint64_t v259 = v54;
        *(void *)&long long v55 = v53;
        *((void *)&v55 + 1) = &v53[8 * v263];
        *(_OWORD *)v274 = v55;
        long long v56 = operator new(0x1000uLL);
        *(void *)&long long v57 = &v53[8 * v263];
        *((void *)&v57 + 1) = &v53[8 * v259];
        v58 = (char *)v57;
        if (v263 == v259)
        {
          v59 = v53;
          uint64_t v60 = 8 * v263;
          unsigned int v14 = v269;
          if (v31 < 1)
          {
            v260 = v56;
            uint64_t v99 = v60 >> 2;
            if (v29 == v30) {
              unint64_t v100 = 1;
            }
            else {
              unint64_t v100 = v99;
            }
            v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v100);
            uint64_t v12 = v262;
            v58 = &v101[8 * (v100 >> 2)];
            *(void *)&long long v103 = v101;
            *((void *)&v103 + 1) = v58;
            *(_OWORD *)v274 = v103;
            *(void *)&long long v57 = v58;
            *((void *)&v57 + 1) = &v101[8 * v102];
            if (v59)
            {
              long long v264 = v57;
              unint64_t v104 = &v101[8 * (v100 >> 2)];
              operator delete(v59);
              v58 = v104;
              long long v57 = v264;
            }
            long long v56 = v260;
          }
          else
          {
            uint64_t v61 = v60 >> 3;
            if (v61 >= -1) {
              unint64_t v62 = v61 + 1;
            }
            else {
              unint64_t v62 = v61 + 2;
            }
            v58 = (char *)(v57 - 8 * (v62 >> 1));
            *(void *)&long long v57 = v58;
            *(float **)&long long v63 = v274[0];
            *((void *)&v63 + 1) = v58;
            *(_OWORD *)v274 = v63;
            uint64_t v12 = v262;
          }
        }
        else
        {
          uint64_t v12 = v262;
          unsigned int v14 = v269;
        }
        *(void *)v58 = v56;
        *(void *)&long long v57 = v57 + 8;
        uint64_t v105 = *((void *)this + 17);
        while (v105 != *((void *)this + 16))
        {
          unint64_t v106 = v274[1];
          if (v274[1] == v274[0])
          {
            unint64_t v108 = (float *)v57;
            if ((unint64_t)v57 >= *((void *)&v57 + 1))
            {
              if (*((float **)&v57 + 1) == v274[1]) {
                unint64_t v113 = 1;
              }
              else {
                unint64_t v113 = (uint64_t)(*((void *)&v57 + 1) - (unint64_t)v274[1]) >> 2;
              }
              uint64x2_t v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v113);
              unint64_t v107 = (float *)&v114[(2 * v113 + 6) & 0xFFFFFFFFFFFFFFF8];
              uint32x4_t v116 = v107;
              uint64_t v117 = (char *)v108 - (char *)v274[1];
              BOOL v64 = v108 == v274[1];
              unsigned int v14 = v269;
              if (!v64)
              {
                uint32x4_t v116 = (float *)((char *)v107 + (v117 & 0xFFFFFFFFFFFFFFF8));
                uint64_t v118 = 8 * (v117 >> 3);
                v119 = v107;
                v120 = v274[1];
                do
                {
                  uint64_t v121 = *(void *)v120;
                  v120 += 2;
                  *(void *)v119 = v121;
                  v119 += 2;
                  v118 -= 8;
                }
                while (v118);
              }
              *(void *)&long long v122 = v114;
              *((void *)&v122 + 1) = v107;
              *(_OWORD *)v274 = v122;
              *(void *)&long long v57 = v116;
              *((void *)&v57 + 1) = &v114[8 * v115];
              if (v106)
              {
                long long v265 = v57;
                operator delete(v106);
                long long v57 = v265;
              }
            }
            else
            {
              uint64_t v109 = (uint64_t)(*((void *)&v57 + 1) - v57) >> 3;
              if (v109 >= -1) {
                uint64_t v110 = v109 + 1;
              }
              else {
                uint64_t v110 = v109 + 2;
              }
              uint64_t v111 = v110 >> 1;
              uint64_t v112 = v57 + 8 * (v110 >> 1);
              unint64_t v107 = (float *)(v112 - (v57 - (unint64_t)v274[1]));
              if ((float *)v57 == v274[1])
              {
                unint64_t v108 = v274[1];
              }
              else
              {
                uint64_t v267 = *((void *)&v57 + 1);
                memmove((void *)(v112 - (v57 - (unint64_t)v274[1])), v274[1], v57 - (unint64_t)v274[1]);
                *((void *)&v57 + 1) = v267;
              }
              *(float **)&long long v123 = v274[0];
              *((void *)&v123 + 1) = v107;
              *(_OWORD *)v274 = v123;
              *(void *)&long long v57 = &v108[2 * v111];
              uint64_t v12 = v262;
              unsigned int v14 = v269;
            }
          }
          else
          {
            unint64_t v107 = v274[1];
          }
          uint64_t v124 = *(void *)(v105 - 8);
          v105 -= 8;
          *((void *)v107 - 1) = v124;
          *(float **)&long long v125 = v274[0];
          *((void *)&v125 + 1) = v274[1] - 2;
          *(_OWORD *)v274 = v125;
        }
        int8x16_t v126 = (void *)*((void *)this + 15);
        *(_OWORD *)((char *)this + 120) = *(_OWORD *)v274;
        *(_OWORD *)((char *)this + 136) = v57;
        if (v126) {
          operator delete(v126);
        }
        goto LABEL_103;
      }
      uint64_t v50 = v48 - v49;
      uint64_t v51 = operator new(0x1000uLL);
      if (v48 == v29)
      {
        unsigned int v14 = v269;
        if (v49 == v30)
        {
          unint64_t v77 = v51;
          if (v29 == v30) {
            unint64_t v78 = 1;
          }
          else {
            unint64_t v78 = v50 >> 2;
          }
          uint64_t v79 = 2 * v78;
          unsigned int v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v78);
          unint64_t v30 = &v80[(v79 + 6) & 0xFFFFFFFFFFFFFFF8];
          uint64_t v82 = (uint64_t *)*((void *)this + 16);
          uint64_t v83 = v30;
          uint64_t v84 = *((void *)this + 17) - (void)v82;
          if (v84)
          {
            uint64_t v83 = &v30[v84 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v85 = 8 * (v84 >> 3);
            v86 = v30;
            do
            {
              uint64_t v87 = *v82++;
              *(void *)v86 = v87;
              v86 += 8;
              v85 -= 8;
            }
            while (v85);
          }
          v88 = (void *)*((void *)this + 15);
          *((void *)this + 15) = v80;
          *((void *)this + 16) = v30;
          *((void *)this + 17) = v83;
          *((void *)this + 18) = &v80[8 * v81];
          uint64_t v51 = v77;
          if (v88)
          {
            operator delete(v88);
            uint64_t v51 = v77;
            unint64_t v30 = (char *)*((void *)this + 16);
          }
        }
        *((void *)v30 - 1) = v51;
        v89 = (char *)*((void *)this + 16);
        unint64_t v90 = (char *)*((void *)this + 17);
        *((void *)this + 16) = v89 - 8;
        uint64_t v91 = *((void *)v89 - 1);
        *((void *)this + 16) = v89;
        uint64_t v12 = v262;
        if (v90 == *((char **)this + 18))
        {
          unint64_t v92 = *((void *)this + 15);
          uint64_t v93 = (uint64_t)&v89[-v92];
          if ((unint64_t)v89 <= v92)
          {
            uint64_t v129 = (uint64_t)&v90[-v92];
            BOOL v64 = v129 == 0;
            uint64_t v130 = v129 >> 2;
            if (v64) {
              unint64_t v131 = 1;
            }
            else {
              unint64_t v131 = v130;
            }
            int8x16_t v132 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v131);
            int32x4_t v134 = &v132[8 * (v131 >> 2)];
            int8x16_t v135 = (uint64_t *)*((void *)this + 16);
            unint64_t v90 = v134;
            uint64_t v136 = *((void *)this + 17) - (void)v135;
            if (v136)
            {
              unint64_t v90 = &v134[v136 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v137 = 8 * (v136 >> 3);
              float v138 = &v132[8 * (v131 >> 2)];
              do
              {
                uint64_t v139 = *v135++;
                *(void *)float v138 = v139;
                v138 += 8;
                v137 -= 8;
              }
              while (v137);
            }
            float v140 = (void *)*((void *)this + 15);
            *((void *)this + 15) = v132;
            *((void *)this + 16) = v134;
            *((void *)this + 17) = v90;
            *((void *)this + 18) = &v132[8 * v133];
            if (v140)
            {
              operator delete(v140);
              unint64_t v90 = (char *)*((void *)this + 17);
            }
          }
          else
          {
            uint64_t v94 = v93 >> 3;
            BOOL v42 = v93 >> 3 < -1;
            uint64_t v95 = (v93 >> 3) + 2;
            if (v42) {
              uint64_t v96 = v95;
            }
            else {
              uint64_t v96 = v94 + 1;
            }
            uint64_t v97 = &v89[-8 * (v96 >> 1)];
            int64_t v98 = v90 - v89;
            if (v90 != v89)
            {
              memmove(&v89[-8 * (v96 >> 1)], v89, v90 - v89);
              v89 = (char *)*((void *)this + 16);
            }
            unint64_t v90 = &v97[v98];
            *((void *)this + 16) = &v89[-8 * (v96 >> 1)];
            *((void *)this + 17) = &v97[v98];
            unsigned int v14 = v269;
          }
        }
        *(void *)unint64_t v90 = v91;
        *((void *)this + 17) += 8;
        goto LABEL_103;
      }
      *(void *)unint64_t v29 = v51;
      *((void *)this + 17) += 8;
      uint64_t v12 = v262;
    }
    else
    {
      *((void *)this + 19) = v34 - 1024;
      uint64_t v38 = *(void *)v30;
      float v36 = v30 + 8;
      uint64_t v37 = v38;
      *((void *)this + 16) = v36;
      uint64_t v12 = v262;
      if (*((char **)this + 18) == v29)
      {
        unint64_t v39 = *((void *)this + 15);
        uint64_t v40 = (uint64_t)&v36[-v39];
        if ((unint64_t)v36 <= v39)
        {
          uint64_t v65 = (uint64_t)&v29[-v39];
          BOOL v64 = v65 == 0;
          uint64_t v66 = v65 >> 2;
          if (v64) {
            unint64_t v67 = 1;
          }
          else {
            unint64_t v67 = v66;
          }
          uint64_t v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v67);
          v70 = &v68[8 * (v67 >> 2)];
          unint64_t v71 = (uint64_t *)*((void *)this + 16);
          unint64_t v29 = v70;
          uint64_t v72 = *((void *)this + 17) - (void)v71;
          if (v72)
          {
            unint64_t v29 = &v70[v72 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v73 = 8 * (v72 >> 3);
            uint64_t v74 = &v68[8 * (v67 >> 2)];
            do
            {
              uint64_t v75 = *v71++;
              *(void *)uint64_t v74 = v75;
              v74 += 8;
              v73 -= 8;
            }
            while (v73);
          }
          uint64_t v76 = (void *)*((void *)this + 15);
          *((void *)this + 15) = v68;
          *((void *)this + 16) = v70;
          *((void *)this + 17) = v29;
          *((void *)this + 18) = &v68[8 * v69];
          if (v76)
          {
            operator delete(v76);
            unint64_t v29 = (char *)*((void *)this + 17);
          }
        }
        else
        {
          uint64_t v41 = v40 >> 3;
          BOOL v42 = v40 >> 3 < -1;
          uint64_t v43 = (v40 >> 3) + 2;
          if (v42) {
            uint64_t v44 = v43;
          }
          else {
            uint64_t v44 = v41 + 1;
          }
          BOOL v45 = &v36[-8 * (v44 >> 1)];
          int64_t v46 = v29 - v36;
          if (v29 == v36)
          {
            uint64_t v47 = v29;
          }
          else
          {
            memmove(&v36[-8 * (v44 >> 1)], v36, v29 - v36);
            BOOL v45 = &v36[-8 * (v44 >> 1)];
            uint64_t v47 = (char *)*((void *)this + 16);
          }
          unint64_t v29 = &v45[v46];
          *((void *)this + 16) = &v47[-8 * (v44 >> 1)];
          *((void *)this + 17) = &v45[v46];
          uint64_t v12 = v262;
        }
      }
      *(void *)unint64_t v29 = v37;
      *((void *)this + 17) += 8;
    }
    unsigned int v14 = v269;
LABEL_103:
    unint64_t v30 = (char *)*((void *)this + 16);
    uint64_t v33 = *((void *)this + 20);
    unint64_t v35 = *((void *)this + 19) + v33;
    goto LABEL_104;
  }
  uint64_t v270 = 0;
LABEL_121:
  if (*((_DWORD *)this + 16))
  {
    uint64_t v141 = 0;
    unint64_t v142 = 0;
    float32x4_t v143 = &a2->mBuffers[0].mData;
    do
    {
      float32x4_t v144 = *v143;
      v143 += 2;
      memmove(*(void **)(*((void *)this + 45) + v141), (const void *)(*(void *)(*((void *)this + 45) + v141) + 4 * *((unsigned int *)this + 18)), 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18)));
      memcpy((void *)(*(void *)(*((void *)this + 45) + v141)+ 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18))), v144, 4 * *((unsigned int *)this + 18));
      NonlinearBeepCanceller::fcn_wola_analysis(*((const vDSP_DFT_SetupStruct **)this + 105), *(const float **)(*((void *)this + 45) + v141), *((const float **)this + 30), (float **)this + 36, *(float **)(*((void *)this + 66) + v141), *((unsigned int *)this + 22), *((_DWORD *)this + 23), *((float *)this + 26));
      ++v142;
      unint64_t v145 = *((unsigned int *)this + 16);
      v141 += 24;
    }
    while (v142 < v145);
    if (v270)
    {
      if (v145)
      {
        for (unint64_t i = 0; i < v145; ++i)
        {
          vDSP_vclr(*(float **)(*((void *)this + 72) + 24 * i), 1, *((unsigned int *)this + 24));
          vDSP_vclr(*(float **)(*((void *)this + 48) + 24 * i), 1, *((unsigned int *)this + 22));
          unint64_t v147 = 0;
          uint64_t v148 = *(void *)(*((void *)this + 48) + 24 * i);
          int64x2_t v149 = (float *)(v148 + 4);
          float32x4_t v150 = (float *)(v148 + 4 * (*((_DWORD *)this + 23) + 1));
          __D.realp = v149;
          __D.imagp = v150;
          do
          {
            if (*((void *)this + 20) <= v147) {
LABEL_196:
            }
              std::__throw_out_of_range[abi:ne180100]();
            if (*(_DWORD *)this)
            {
              uint64_t v151 = 0;
              unint64_t v152 = 0;
              uint64_t v153 = *(unsigned int *)(*(void *)(*((void *)this + 16)
                                                 + (((*((void *)this + 19) + v147) >> 7) & 0x1FFFFFFFFFFFFF8))
                                     + 4 * ((*((void *)this + 19) + v147) & 0x3FF));
              do
              {
                uint64_t v154 = *(unsigned int *)(*((void *)this + 24) + 4 * v152);
                uint64x2_t v155 = *(float **)(*(void *)(*(void *)(*((void *)this + 81) + 24 * i) + 24 * v153) + v151);
                vDSP_vsmul(v155, 1, (const float *)this + 4, v155, 1, *((unsigned int *)this + 22));
                v154 *= 3;
                uint64_t v156 = *(void *)(*(void *)(*((void *)this + 75) + 24 * v153) + 8 * v154);
                int v157 = *((_DWORD *)this + 23);
                v283.realp = (float *)(v156 + 4);
                v283.imagp = (float *)(v156 + 4 * (v157 + 1));
                uint64_t v158 = *(void *)(*(void *)(*(void *)(*((void *)this + 81) + 24 * i) + 24 * v153) + v151);
                __B.realp = (float *)(v158 + 4);
                __B.imagp = (float *)(v158 + 4 * (v157 + 1));
                vDSP_zvma(&v283, 1, &__B, 1, &__D, 1, &__D, 1, (v157 - 1));
                int32x4_t v159 = *(float **)(*(void *)(*((void *)this + 75) + 24 * v153) + 8 * v154);
                int8x16_t v160 = *(float **)(*(void *)(*(void *)(*((void *)this + 81) + 24 * i) + 24 * v153) + v151);
                int32x4_t v161 = *(float **)(*((void *)this + 48) + 24 * i);
                *int32x4_t v161 = *v161 + (float)(*v159 * *v160);
                v161[*((unsigned int *)this + 23)] = v161[*((unsigned int *)this + 23)]
                                                   + (float)(v159[*((unsigned int *)this + 23)]
                                                           * v160[*((unsigned int *)this + 23)]);
                NonlinearBeepCanceller::fcn_smooth_psd(*(NonlinearBeepCanceller **)(*(void *)(*(void *)(*((void *)this + 84) + 24 * i) + 24 * v153)+ v151), *(const float **)(*(void *)(*(void *)(*((void *)this + 90) + 24 * i) + 24 * v153) + v151), *((float *)this + 1), *((float *)this + 5), (float *)1, *((float *)this + 10), *((_DWORD *)this + 24));
                vDSP_vmul(*(const float **)(*(void *)(*((void *)this + 78) + 24 * v153) + 8 * v154), 1, *(const float **)(*(void *)(*(void *)(*((void *)this + 84) + 24 * i) + 24 * v153) + v151), 1, *(float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * i) + 24 * v153) + v151), 1, *((unsigned int *)this + 24));
                vDSP_vadd(*(const float **)(*((void *)this + 72) + 24 * i), 1, *(const float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * i) + 24 * v153) + v151), 1, *(float **)(*((void *)this + 72) + 24 * i), 1, *((unsigned int *)this + 24));
                NonlinearBeepCanceller::fcn_complex_mult_by_psd(*(NonlinearBeepCanceller **)(*(void *)(*((void *)this + 75) + 24 * v153) + 8 * v154), *(const float **)(*(void *)(*(void *)(*((void *)this + 84) + 24 * i) + 24 * v153) + v151), *(float **)(*(void *)(*(void *)(*((void *)this + 87) + 24 * i) + 24 * v153) + v151), *((unsigned int *)this + 23));
                ++v152;
                v151 += 24;
              }
              while (v152 < *(unsigned int *)this);
            }
            ++v147;
          }
          while (v147 != v270);
          vDSP_vsub(*(const float **)(*((void *)this + 48) + 24 * i), 1, *(const float **)(*((void *)this + 66) + 24 * i), 1, *(float **)(*((void *)this + 63) + 24 * i), 1, *((unsigned int *)this + 22));
          int64x2_t v162 = *(float **)(*((void *)this + 63) + 24 * i);
          unsigned int v163 = *(float **)(*((void *)this + 69) + 24 * i);
          uint64_t v164 = *((unsigned int *)this + 23);
          __A.realp = v162 + 1;
          __A.imagp = &v162[(v164 + 1)];
          vDSP_zvmags(&__A, 1, v163 + 1, 1, (v164 - 1));
          *unsigned int v163 = *v162 * *v162;
          v163[v164] = v162[v164] * v162[v164];
          vDSP_meanv(*(const float **)(*((void *)this + 69) + 24 * i), 1, (float *)(*((void *)this + 39) + 4 * i), *((unsigned int *)this + 24));
          *(float *)(*((void *)this + 39) + 4 * i) = *((float *)this + 6)
                                                     + (float)(*(float *)(*((void *)this + 39) + 4 * i)
                                                             * *((float *)this + 7));
          unint64_t v145 = *((unsigned int *)this + 16);
        }
      }
      goto LABEL_137;
    }
    if (v145)
    {
      uint64_t v235 = 0;
      unint64_t v236 = 0;
      v237 = &a5->mBuffers[0].mData;
      v238 = &a4->mBuffers[0].mData;
      v239 = &a7->mBuffers[0].mData;
      do
      {
        v241 = *v239;
        v239 += 2;
        v240 = v241;
        v243 = *v238;
        v238 += 2;
        v242 = v243;
        v244 = (float *)*v237;
        v237 += 2;
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((void *)this + 66) + v235), (const float **)this + 30, (const float **)(*((void *)this + 57) + v235), (const float **)this + 36, v240, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        memcpy(v242, v240, 4 * *((unsigned int *)this + 18));
        vDSP_vclr(v244, 1, *((unsigned int *)this + 18));
        vDSP_vclr(*(float **)(*((void *)this + 51) + v235), 1, *((unsigned int *)this + 22));
        vDSP_vclr(*(float **)(*((void *)this + 54) + v235), 1, *((unsigned int *)this + 22));
        ++v236;
        v235 += 24;
      }
      while (v236 < *((unsigned int *)this + 16));
    }
LABEL_186:
    uint64_t v245 = *(unsigned int *)this;
    int v246 = *((_DWORD *)this + 27);
    if (v246 + 1 == v245) {
      int v247 = 0;
    }
    else {
      int v247 = v246 + 1;
    }
    *((_DWORD *)this + 27) = v247;
    if (v245)
    {
      uint64_t v248 = 0;
      do
      {
        uint64_t v249 = *((void *)this + 24);
        int v250 = *(_DWORD *)(v249 + v248);
        if (v250 + 1 == v245) {
          int v251 = 0;
        }
        else {
          int v251 = v250 + 1;
        }
        *(_DWORD *)(v249 + v248) = v251;
        v248 += 4;
      }
      while (4 * v245 != v248);
    }
    return 0;
  }
  if (!v270) {
    goto LABEL_186;
  }
  LODWORD(v145) = 0;
LABEL_137:
  float v165 = *((float *)this + 8);
  if (v165 > 0.0)
  {
    unsigned int v166 = 0;
    if (v270 <= 1) {
      uint64_t v167 = 1;
    }
    else {
      uint64_t v167 = v270;
    }
    *(void *)v272 = v167;
    float v168 = 0.0;
    int v169 = v145;
    do
    {
      if (v169)
      {
        unsigned int v266 = v166;
        unint64_t v170 = 0;
        uint64_t v171 = *((void *)this + 39);
        do
        {
          vDSP_vsadd(*(const float **)(*((void *)this + 72) + 24 * v170), 1, (const float *)(v171 + 4 * v170), *(float **)(*((void *)this + 102) + 24 * v170), 1, *((unsigned int *)this + 24));
          float32x4_t v172 = *(float **)(*((void *)this + 102) + 24 * v170);
          vDSP_svdiv((const float *)this + 9, v172, 1, v172, 1, *((unsigned int *)this + 24));
          NonlinearBeepCanceller::fcn_complex_mult_by_psd(*(NonlinearBeepCanceller **)(*((void *)this + 63) + 24 * v170), *(const float **)(*((void *)this + 102) + 24 * v170), *(float **)(*((void *)this + 63) + 24 * v170), *((unsigned int *)this + 23));
          vDSP_vclr(*(float **)(*((void *)this + 48) + 24 * v170), 1, *((unsigned int *)this + 22));
          unint64_t v173 = 0;
          uint64_t v174 = *(void *)(*((void *)this + 48) + 24 * v170);
          v175 = (float *)(v174 + 4);
          v176 = (float *)(v174 + 4 * (*((_DWORD *)this + 23) + 1));
          __D.realp = v175;
          __D.imagp = v176;
          do
          {
            if (*((void *)this + 20) <= v173) {
              goto LABEL_196;
            }
            if (*(_DWORD *)this)
            {
              uint64_t v177 = 0;
              unint64_t v178 = 0;
              uint64_t v179 = *(unsigned int *)(*(void *)(*((void *)this + 16)
                                                 + (((*((void *)this + 19) + v173) >> 7) & 0x1FFFFFFFFFFFFF8))
                                     + 4 * ((*((void *)this + 19) + v173) & 0x3FF));
              do
              {
                unsigned int v180 = *(_DWORD *)(*((void *)this + 24) + 4 * v178);
                uint64_t v181 = *(void *)(*(void *)(*(void *)(*((void *)this + 87) + 24 * v170) + 24 * v179) + v177);
                int v182 = *((_DWORD *)this + 23);
                v283.realp = (float *)(v181 + 4);
                v283.imagp = (float *)(v181 + 4 * (v182 + 1));
                uint64_t v183 = *(void *)(*((void *)this + 63) + 24 * v170);
                v279.realp = (float *)(v183 + 4);
                v279.imagp = (float *)(v183 + 4 * (v182 + 1));
                uint64_t v184 = *(void *)(*(void *)(*(void *)(*((void *)this + 81) + 24 * v170) + 24 * v179) + v177);
                __B.realp = (float *)(v184 + 4);
                __B.imagp = (float *)(v184 + 4 * (v182 + 1));
                vDSP_zvcma(&v283, 1, &v279, 1, &__B, 1, &__B, 1, (v182 - 1));
                v185 = *(float **)(*(void *)(*(void *)(*((void *)this + 87) + 24 * v170) + 24 * v179) + v177);
                v186 = *(float **)(*((void *)this + 63) + 24 * v170);
                v187 = (void *)(*((void *)this + 81) + 24 * v170);
                v188 = *(float **)(*(void *)(*v187 + 24 * v179) + v177);
                float *v188 = *v188 + (float)(*v185 * *v186);
                uint64_t v189 = *((unsigned int *)this + 23);
                v188[v189] = v188[v189] + (float)(v185[v189] * v186[v189]);
                uint64_t v190 = *(void *)(*(void *)(*((void *)this + 75) + 24 * v179) + 24 * v180);
                uint64_t v191 = (v189 + 1);
                v283.realp = (float *)(v190 + 4);
                v283.imagp = (float *)(v190 + 4 * v191);
                uint64_t v192 = *(void *)(*(void *)(*v187 + 24 * v179) + v177);
                __B.realp = (float *)(v192 + 4);
                __B.imagp = (float *)(v192 + 4 * v191);
                if ((float)(*((float *)this + 8) + -1.0) == v168)
                {
                  uint64_t v193 = *(void *)(*(void *)(*(void *)(*((void *)this + 93) + 24 * v170) + 24 * v179) + v177);
                  v281.realp = (float *)(v193 + 4);
                  v281.imagp = (float *)(v193 + 4 * v191);
                  vDSP_zvmul(&v283, 1, &__B, 1, &v281, 1, (v189 - 1), 1);
                  v194 = *(float **)(*(void *)(*((void *)this + 75) + 24 * v179) + 24 * v180);
                  v195 = *(float **)(*(void *)(*(void *)(*((void *)this + 81) + 24 * v170) + 24 * v179) + v177);
                  v196 = *(float **)(*(void *)(*(void *)(*((void *)this + 93) + 24 * v170) + 24 * v179) + v177);
                  float *v196 = *v194 * *v195;
                  v196[*((unsigned int *)this + 23)] = v194[*((unsigned int *)this + 23)]
                                                     * v195[*((unsigned int *)this + 23)];
                  v197 = *(float **)(*((void *)this + 48) + 24 * v170);
                  vDSP_vadd(v196, 1, v197, 1, v197, 1, *((unsigned int *)this + 22));
                }
                else
                {
                  v198 = *(float **)(*(void *)(*v187 + 24 * v179) + v177);
                  vDSP_vsmul(v198, 1, (const float *)this + 4, v198, 1, *((unsigned int *)this + 22));
                  vDSP_zvma(&v283, 1, &__B, 1, &__D, 1, &__D, 1, (*((_DWORD *)this + 23) - 1));
                  v199 = *(float **)(*(void *)(*((void *)this + 75) + 24 * v179) + 24 * v180);
                  v200 = *(float **)(*(void *)(*(void *)(*((void *)this + 81) + 24 * v170) + 24 * v179) + v177);
                  v201 = *(float **)(*((void *)this + 48) + 24 * v170);
                  float *v201 = *v201 + (float)(*v199 * *v200);
                  v201[*((unsigned int *)this + 23)] = v201[*((unsigned int *)this + 23)]
                                                     + (float)(v199[*((unsigned int *)this + 23)]
                                                             * v200[*((unsigned int *)this + 23)]);
                }
                ++v178;
                v177 += 24;
              }
              while (v178 < *(unsigned int *)this);
            }
            ++v173;
          }
          while (v173 != *(void *)v272);
          vDSP_vsub(*(const float **)(*((void *)this + 48) + 24 * v170), 1, *(const float **)(*((void *)this + 66) + 24 * v170), 1, *(float **)(*((void *)this + 63) + 24 * v170), 1, *((unsigned int *)this + 22));
          v202 = *(float **)(*((void *)this + 63) + 24 * v170);
          v203 = *(float **)(*((void *)this + 69) + 24 * v170);
          uint64_t v204 = *((unsigned int *)this + 23);
          __A.realp = v202 + 1;
          __A.imagp = &v202[(v204 + 1)];
          vDSP_zvmags(&__A, 1, v203 + 1, 1, (v204 - 1));
          float *v203 = *v202 * *v202;
          v203[v204] = v202[v204] * v202[v204];
          vDSP_meanv(*(const float **)(*((void *)this + 69) + 24 * v170), 1, (float *)(*((void *)this + 39) + 4 * v170), *((unsigned int *)this + 24));
          uint64_t v171 = *((void *)this + 39);
          *(float *)(v171 + 4 * v170) = *((float *)this + 6)
                                      + (float)(*(float *)(v171 + 4 * v170) * *((float *)this + 7));
          ++v170;
          unint64_t v145 = *((unsigned int *)this + 16);
        }
        while (v170 < v145);
        float v165 = *((float *)this + 8);
        int v169 = *((_DWORD *)this + 16);
        unsigned int v166 = v266;
      }
      float v168 = (float)++v166;
    }
    while (v165 > (float)v166);
  }
  if (v145)
  {
    unint64_t v205 = 0;
    if (v270 <= 1) {
      uint64_t v206 = 1;
    }
    else {
      uint64_t v206 = v270;
    }
    *(void *)v273 = v206;
    do
    {
      unint64_t v207 = 0;
      do
      {
        if (*((void *)this + 20) <= v207) {
          goto LABEL_196;
        }
        unint64_t v275 = v207;
        if (*(_DWORD *)this)
        {
          uint64_t v208 = 0;
          unint64_t v209 = 0;
          uint64_t v210 = *(unsigned int *)(*(void *)(*((void *)this + 16)
                                             + (((*((void *)this + 19) + v207) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((*((void *)this + 19) + v207) & 0x3FF));
          do
          {
            unsigned int v211 = *(_DWORD *)(*((void *)this + 24) + 4 * v209);
            vDSP_vmul(*(const float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *(const float **)(*((void *)this + 102) + 24 * v205), 1, *(float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *((unsigned int *)this + 24));
            vDSP_vmul(*(const float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *(const float **)(*(void *)(*(void *)(*((void *)this + 84) + 24 * v205) + 24 * v210) + v208), 1, *(float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *((unsigned int *)this + 24));
            v212 = *(float **)(*(void *)(*(void *)(*((void *)this + 84) + 24 * v205) + 24 * v210) + v208);
            vDSP_vsub(*(const float **)(*(void *)(*(void *)(*((void *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, v212, 1, v212, 1, *((unsigned int *)this + 24));
            v213 = *(float **)(*(void *)(*(void *)(*((void *)this + 84) + 24 * v205) + 24 * v210) + v208);
            vDSP_vabs(v213, 1, v213, 1, *((unsigned int *)this + 24));
            uint64_t v214 = *(void *)(*((void *)this + 63) + 24 * v205);
            uint64_t v215 = *(void *)(*(void *)(*(void *)(*((void *)this + 93) + 24 * v205) + 24 * v210) + v208);
            vDSP_vmma((const float *)(v214 + 4), 1, (const float *)(v215 + 4), 1, (const float *)(v214 + 4 * (*((_DWORD *)this + 23) + 1)), 1, (const float *)(v215 + 4 * (*((_DWORD *)this + 23) + 1)), 1, (float *)(*(void *)(*(void *)(*(void *)(*((void *)this + 96) + 24 * v205) + 24 * v210) + v208)+ 4), 1, (*((_DWORD *)this + 23) - 1));
            v216 = *(float **)(*((void *)this + 63) + 24 * v205);
            v217 = *(float **)(*(void *)(*(void *)(*((void *)this + 93) + 24 * v205) + 24 * v210) + v208);
            v218 = *(float **)(*(void *)(*(void *)(*((void *)this + 96) + 24 * v205) + 24 * v210) + v208);
            float *v218 = *v216 * *v217;
            v218[*((unsigned int *)this + 23)] = v216[*((unsigned int *)this + 23)] * v217[*((unsigned int *)this + 23)];
            vDSP_vsadd(*(const float **)(*(void *)(*((void *)this + 78) + 24 * v210) + 24 * v211), 1, (const float *)this + 6, *(float **)(*((void *)this + 69) + 24 * v205), 1, *((unsigned int *)this + 24));
            v219 = *(float **)(*(void *)(*(void *)(*((void *)this + 96) + 24 * v205) + 24 * v210) + v208);
            vDSP_vdiv(*(const float **)(*((void *)this + 69) + 24 * v205), 1, v219, 1, v219, 1, *((unsigned int *)this + 24));
            NonlinearBeepCanceller::fcn_smooth_psd(*(NonlinearBeepCanceller **)(*(void *)(*(void *)(*((void *)this + 90) + 24 * v205) + 24 * v210)+ v208), *(const float **)(*(void *)(*(void *)(*((void *)this + 96) + 24 * v205) + 24 * v210) + v208), *((float *)this + 2), *((float *)this + 3), 0, *((float *)this + 29), *((_DWORD *)this + 24));
            ++v209;
            v208 += 24;
          }
          while (v209 < *(unsigned int *)this);
        }
        unint64_t v207 = v275 + 1;
      }
      while (v275 + 1 != *(void *)v273);
      ++v205;
      unint64_t v220 = *((unsigned int *)this + 16);
    }
    while (v205 < v220);
    if (v220)
    {
      uint64_t v221 = 0;
      unint64_t v222 = 0;
      v223 = &a5->mBuffers[0].mData;
      v224 = &a4->mBuffers[0].mData;
      v225 = &a7->mBuffers[0].mData;
      do
      {
        v226 = (const float *)*v225;
        v227 = *v224;
        v276 = *v223;
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((void *)this + 66) + v221), (const float **)this + 30, (const float **)(*((void *)this + 57) + v221), (const float **)this + 36, *v225, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((void *)this + 63) + v221), (const float **)this + 30, (const float **)(*((void *)this + 51) + v221), (const float **)this + 36, v227, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((void *)this + 48) + v221), (const float **)this + 30, (const float **)(*((void *)this + 54) + v221), (const float **)this + 36, v276, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        vDSP_svesq(v226, 1, (float *)&__C, *((unsigned int *)this + 18));
        vDSP_svesq((const float *)v227, 1, &v277, *((unsigned int *)this + 18));
        if (v277 > (float)(*(float *)&__C * 3.0)) {
          memcpy(v227, v226, 4 * *((unsigned int *)this + 18));
        }
        ++v222;
        v221 += 24;
        v223 += 2;
        v224 += 2;
        v225 += 2;
      }
      while (v222 < *((unsigned int *)this + 16));
    }
  }
  uint64_t v228 = *(unsigned int *)this;
  int v229 = *((_DWORD *)this + 27);
  if (v229 + 1 == v228) {
    int v230 = 0;
  }
  else {
    int v230 = v229 + 1;
  }
  *((_DWORD *)this + 27) = v230;
  if (v228)
  {
    uint64_t v231 = 0;
    do
    {
      uint64_t v232 = *((void *)this + 24);
      int v233 = *(_DWORD *)(v232 + v231);
      if (v233 + 1 == v228) {
        int v234 = 0;
      }
      else {
        int v234 = v233 + 1;
      }
      *(_DWORD *)(v232 + v231) = v234;
      v231 += 4;
    }
    while (4 * v228 != v231);
  }
  return 0;
}

void sub_1BA1ECE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,long long a29)
{
  if ((void)a29) {
    operator delete((void *)a29);
  }
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_wola_analysis(const vDSP_DFT_SetupStruct *a1, const float *__A, const float *a3, float **a4, float *a5, vDSP_Length __N, unsigned int a7, float a8)
{
  vDSP_Length v11 = a7;
  __Z.realp = a5;
  __Z.imagp = &a5[a7];
  vDSP_vmul(__A, 1, a3, 1, *a4, 1, __N);
  uint64_t v12 = (const DSPComplex *)*a4;
  float __B = a8;
  vDSP_ctoz(v12, 2, &__Z, 1, v11);
  vDSP_DFT_Execute(a1, __Z.realp, __Z.imagp, __Z.realp, __Z.imagp);
  vDSP_vsmul(__Z.realp, 1, &__B, __Z.realp, 1, v11);
  vDSP_vsmul(__Z.imagp, 1, &__B, __Z.imagp, 1, v11);
}

void NonlinearBeepCanceller::fcn_wola_synthesis(const vDSP_DFT_SetupStruct *a1, const float *a2, const float **a3, const float **a4, const float **a5, void *a6, unsigned int a7, unsigned int a8, float a9, unsigned int a10)
{
  unsigned int v16 = (DSPComplex *)*a5;
  float __B = a9;
  memset(__Or, 0, sizeof(__Or));
  vDSP_Length __N = a8;
  LODWORD(__Z.realp) = 0;
  std::vector<float>::assign((char **)__Or, a8, &__Z);
  vDSP_Length v18 = __Or[0];
  __Z.realp = __Or[0];
  __Z.imagp = &__Or[0][a10];
  vDSP_DFT_Execute(a1, a2, &a2[a10], __Or[0], __Z.imagp);
  vDSP_ztoc(&__Z, 1, v16, 2, a10);
  vDSP_vsmul((const float *)v16, 1, &__B, (float *)v16, 1, __N);
  if (v18) {
    operator delete(v18);
  }
  vDSP_vma(*a3, 1, *a5, 1, *a4, 1, (float *)*a4, 1, __N);
  memcpy(a6, *a4, 4 * a7);
  unsigned int v19 = a8 - a7;
  memmove((void *)*a4, &(*a4)[a7], 4 * v19);
  vDSP_vclr((float *)&(*a4)[v19], 1, a7);
}

void sub_1BA1ED084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E61FEFB8, MEMORY[0x1E4FBA1D0]);
}

void sub_1BA1ED0E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_smooth_psd(NonlinearBeepCanceller *this, const float *a2, float a3, float a4, float *a5, float a6, unsigned int a7)
{
  int v7 = (int)a5;
  float v13 = a4;
  float __B = a3;
  float v12 = a6;
  vDSP_Length v11 = a7;
  vDSP_vsmul((const float *)this, 1, &__B, (float *)this, 1, a7);
  vDSP_vsma(a2, 1, &v13, (const float *)this, 1, (float *)this, 1, v11);
  if (v7) {
    vDSP_vabs((const float *)this, 1, (float *)this, 1, v11);
  }
  if (a6 > 0.0) {
    vDSP_vsadd((const float *)this, 1, &v12, (float *)this, 1, v11);
  }
}

float NonlinearBeepCanceller::fcn_complex_mult_by_psd(NonlinearBeepCanceller *this, const float *__B, float *__C, vDSP_Length __N)
{
  unsigned int v4 = __N;
  vDSP_vmul((const float *)this, 1, __B, 1, __C, 1, __N);
  vDSP_vmul((const float *)this + v4 + 1, 1, __B + 1, 1, &__C[v4 + 1], 1, v4 - 1);
  float result = *((float *)this + v4) * __B[v4];
  __C[v4] = result;
  return result;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  float result = std::logic_error::logic_error(a1, "deque");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void sub_1BA1EDE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA1F0C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5348(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5349(uint64_t a1)
{
}

void sub_1BA1F2314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned short>>::operator()[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }
  uint64_t v3 = a1[5];
  a1[5] = 0;
  if (v3) {
    MEMORY[0x1BA9E6B20](v3, 0x1000C80BDFB0063);
  }
  JUMPOUT(0x1BA9E6B40);
}

void sub_1BA1F2F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA1F3098(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9E6B20](v1, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

void corespeech::CSAudioCircularBufferImpl<unsigned short>::copySamples(void *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = *(void *)(a2 + 16);
  unint64_t v8 = *(void *)(a2 + 32);
  if (v8 >= v7) {
    unint64_t v9 = v8 - v7;
  }
  else {
    unint64_t v9 = 0;
  }
  if (v9 <= a3 && a4 > a3 && v8 >= a4 && v8 > a3 && v9 < a4) {
    operator new[]();
  }
  unsigned int v14 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    unsigned int v16 = "copySamples";
    __int16 v17 = 2050;
    unint64_t v18 = a3;
    __int16 v19 = 2050;
    unint64_t v20 = a4;
    __int16 v21 = 2050;
    unint64_t v22 = v9;
    __int16 v23 = 2050;
    unint64_t v24 = v8;
    _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
  }
  *a1 = 0;
}

void sub_1BA1F3588(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9E6B20](v1, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

void sub_1BA1F3774(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9E6B20](v1, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

void sub_1BA1F3CA4(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9E6B40](v3, 0x1090C40431A8F44);

  _Unwind_Resume(a1);
}

void sub_1BA1F4ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5756(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5757(uint64_t a1)
{
}

void sub_1BA1F5224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA1F7498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA1FB80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke_6668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8 = (uint64_t (**)(void, void, void, void))MEMORY[0x1BA9E7570](a5);
  uint64_t v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

void sub_1BA1FD26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA1FF144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1BA1FF5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1BA20436C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA204AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA204CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2055E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2057C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA206174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7237(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7238(uint64_t a1)
{
}

void sub_1BA206A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BA206CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BA207D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1BA20987C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
}

void sub_1BA20C144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_1BA211130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA21121C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BA211608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void _CSPreferencesSetValueForKey(void *a1, const __CFString *a2)
{
  id value = a1;
  if (+[CSUtils deviceRequirePowerAssertionHeld]) {

  }
  CFPreferencesSetAppValue(a2, value, @"com.apple.voicetrigger");
}

void _CSNotBackedupPreferencesSetValueForKey(void *a1, const __CFString *a2)
{
  id value = a1;
  if (+[CSUtils deviceRequirePowerAssertionHeld]) {

  }
  CFPreferencesSetAppValue(a2, value, @"com.apple.voicetrigger.notbackedup");
}

uint64_t __Block_byref_object_copy__7493(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7494(uint64_t a1)
{
}

void _CSPreferencesSetValueForKeyFromRoot(void *a1, const __CFString *a2)
{
  id value = a1;
  if (+[CSUtils deviceRequirePowerAssertionHeld]) {

  }
  CFPreferencesSetValue(a2, value, @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
}

void sub_1BA2166F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CSInternalPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

id _CSPreferencesValueForKey(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.voicetrigger");
  return v1;
}

id _CSNotBackedupPreferencesValueForKey(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.voicetrigger.notbackedup");
  return v1;
}

id _CSPreferencesValueForKeyFromRoot(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyValue(a1, @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return v1;
}

uint64_t CSNotBackedupInternalPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
}

void _CSNotBackedupPreferencesSetValueForKeyFromRoot(CFPropertyListRef value, CFStringRef key)
{
}

id _CSNotBackedupPreferencesValueForKeyFromRoot(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyValue(a1, @"com.apple.voicetrigger.notbackedup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return v1;
}

uint64_t *std::unique_ptr<BatchBeepCanceller>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *float result = a2;
  if (v2)
  {
    unint64_t v15 = (void **)(v2 + 600);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v15);
    unint64_t v15 = (void **)(v2 + 576);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v15);
    unint64_t v15 = (void **)(v2 + 552);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v15);
    unint64_t v15 = (void **)(v2 + 528);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v15);
    uint64_t v3 = *(void **)(v2 + 440);
    if (v3)
    {
      *(void *)(v2 + 448) = v3;
      operator delete(v3);
    }
    unsigned int v4 = *(void **)(v2 + 416);
    if (v4)
    {
      *(void *)(v2 + 424) = v4;
      operator delete(v4);
    }
    uint64_t v5 = *(void **)(v2 + 392);
    if (v5)
    {
      *(void *)(v2 + 400) = v5;
      operator delete(v5);
    }
    uint64_t v6 = *(void **)(v2 + 368);
    if (v6)
    {
      *(void *)(v2 + 376) = v6;
      operator delete(v6);
    }
    std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100]((uint64_t *)(v2 + 360), 0);
    unint64_t v7 = *(void **)(v2 + 192);
    if (v7)
    {
      *(void *)(v2 + 200) = v7;
      operator delete(v7);
    }
    unint64_t v8 = *(void **)(v2 + 160);
    if (v8)
    {
      *(void *)(v2 + 168) = v8;
      operator delete(v8);
    }
    uint64_t v9 = *(void **)(v2 + 136);
    if (v9)
    {
      *(void *)(v2 + 144) = v9;
      operator delete(v9);
    }
    unint64_t v10 = *(void **)(v2 + 112);
    if (v10)
    {
      *(void *)(v2 + 120) = v10;
      operator delete(v10);
    }
    vDSP_Length v11 = *(void **)(v2 + 88);
    if (v11)
    {
      *(void *)(v2 + 96) = v11;
      operator delete(v11);
    }
    float v12 = *(void **)(v2 + 48);
    if (v12)
    {
      *(void *)(v2 + 56) = v12;
      operator delete(v12);
    }
    float v13 = *(void **)(v2 + 24);
    if (v13)
    {
      *(void *)(v2 + 32) = v13;
      operator delete(v13);
    }
    unsigned int v14 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v14;
      operator delete(v14);
    }
    JUMPOUT(0x1BA9E6B40);
  }
  return result;
}

uint64_t *std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *float result = a2;
  if (v2)
  {
    uint64_t v3 = *(vDSP_DFT_SetupStruct **)(v2 + 840);
    if (v3) {
      vDSP_DFT_DestroySetup(v3);
    }
    unsigned int v4 = *(vDSP_DFT_SetupStruct **)(v2 + 848);
    if (v4) {
      vDSP_DFT_DestroySetup(v4);
    }
    unint64_t v20 = (void **)(v2 + 816);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 792);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 768);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 744);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 720);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 696);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 672);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 648);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 624);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 600);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 576);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 552);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 528);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 504);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 480);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 456);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 432);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 408);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 384);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 360);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    unint64_t v20 = (void **)(v2 + 336);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    uint64_t v5 = *(void **)(v2 + 312);
    if (v5)
    {
      *(void *)(v2 + 320) = v5;
      operator delete(v5);
    }
    uint64_t v6 = *(void **)(v2 + 288);
    if (v6)
    {
      *(void *)(v2 + 296) = v6;
      operator delete(v6);
    }
    unint64_t v7 = *(void **)(v2 + 264);
    if (v7)
    {
      *(void *)(v2 + 272) = v7;
      operator delete(v7);
    }
    unint64_t v8 = *(void **)(v2 + 240);
    if (v8)
    {
      *(void *)(v2 + 248) = v8;
      operator delete(v8);
    }
    uint64_t v9 = *(void **)(v2 + 216);
    if (v9)
    {
      *(void *)(v2 + 224) = v9;
      operator delete(v9);
    }
    unint64_t v10 = *(void **)(v2 + 192);
    if (v10)
    {
      *(void *)(v2 + 200) = v10;
      operator delete(v10);
    }
    unint64_t v20 = (void **)(v2 + 168);
    std::vector<std::vector<unsigned int>>::__destroy_vector::operator()[abi:ne180100](&v20);
    vDSP_Length v11 = *(void ***)(v2 + 128);
    float v12 = *(void ***)(v2 + 136);
    *(void *)(v2 + 160) = 0;
    unint64_t v13 = (char *)v12 - (char *)v11;
    if ((unint64_t)((char *)v12 - (char *)v11) >= 0x11)
    {
      do
      {
        operator delete(*v11);
        float v12 = *(void ***)(v2 + 136);
        vDSP_Length v11 = (void **)(*(void *)(v2 + 128) + 8);
        *(void *)(v2 + 128) = v11;
        unint64_t v13 = (char *)v12 - (char *)v11;
      }
      while ((unint64_t)((char *)v12 - (char *)v11) > 0x10);
    }
    unint64_t v14 = v13 >> 3;
    if (v14 == 1)
    {
      uint64_t v15 = 512;
    }
    else
    {
      if (v14 != 2)
      {
LABEL_26:
        if (v11 != v12)
        {
          do
          {
            unsigned int v16 = *v11++;
            operator delete(v16);
          }
          while (v11 != v12);
          uint64_t v18 = *(void *)(v2 + 128);
          uint64_t v17 = *(void *)(v2 + 136);
          if (v17 != v18) {
            *(void *)(v2 + 136) = v17 + ((v18 - v17 + 7) & 0xFFFFFFFFFFFFFFF8);
          }
        }
        __int16 v19 = *(void **)(v2 + 120);
        if (v19) {
          operator delete(v19);
        }
        JUMPOUT(0x1BA9E6B40);
      }
      uint64_t v15 = 1024;
    }
    *(void *)(v2 + 152) = v15;
    goto LABEL_26;
  }
  return result;
}

void std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    unsigned int v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint64_t v6 = v4;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __Block_byref_object_copy__7809(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7810(uint64_t a1)
{
}

void sub_1BA21AEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BatchBeepCanceller::reset(BatchBeepCanceller *this)
{
  *((void *)this + 23) = 0;
  *((unsigned char *)this + 228) = 0;
  *((void *)this + 27) = 0;
  *((void *)this + 31) = 0;
  if (*((void *)this + 45)) {
    std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100]((uint64_t *)this + 45, 0);
  }
  operator new();
}

void sub_1BA21B554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

uint64_t BatchBeepCanceller::feedFloat(BatchBeepCanceller *this, const float *a2, uint64_t a3, const float **a4)
{
  if (!a2)
  {
    *((_DWORD *)this + 56) = 0;
    BatchBeepCanceller::reset(this);
  }
  uint64_t v6 = a3;
  if (*((_DWORD *)this + 20) >= a3)
  {
    unsigned int v8 = *((_DWORD *)this + 56);
    if (v8)
    {
      BOOL v9 = v8 >= a3;
      int v10 = v8 - a3;
      if (v10 != 0 && v9)
      {
        *((_DWORD *)this + 56) = v10;
      }
      else
      {
        *((_DWORD *)this + 56) = 0;
        *((unsigned char *)this + 228) = 1;
        *((_DWORD *)this + 65) = -2;
        *((_DWORD *)this + 71) = 0;
        *(void *)((char *)this + 268) = 0;
        *(void *)((char *)this + 276) = 0;
      }
    }
    if (*((unsigned char *)this + 228))
    {
      if (a3) {
        memmove((void *)(*((void *)this + 20) + 4 * *((unsigned int *)this + 46)), a2, 4 * a3);
      }
      unsigned int v11 = *((_DWORD *)this + 46);
      unsigned int v12 = v11 + v6;
      *((_DWORD *)this + 46) = v12;
      BatchBeepCanceller::updateCrossCorrelation(this, v11, v12);
      unsigned int CrossCorrelationPeak = BatchBeepCanceller::findCrossCorrelationPeak(this, v11, v12);
      if (CrossCorrelationPeak)
      {
        unsigned int v14 = CrossCorrelationPeak;
        kdebug_trace();
        BatchBeepCanceller::doAdaptiveCancel(this, v14);
        kdebug_trace();
        *a4 = (const float *)(*((void *)this + 20) + 4 * *((unsigned int *)this + 47));
        BatchBeepCanceller::reset(this);
      }
      uint64_t v15 = (const float *)*((void *)this + 20);
      if ((*((_DWORD *)this + 20) + *((_DWORD *)this + 46)) > (unint64_t)((uint64_t)(*((void *)this + 21) - (void)v15) >> 2))
      {
        *a4 = &v15[*((unsigned int *)this + 47)];
        BatchBeepCanceller::reset(this);
      }
      uint64_t v6 = 0;
      *a4 = v15;
    }
    else
    {
      *a4 = a2;
    }
  }
  else
  {
    uint64_t v6 = 0;
    *a4 = 0;
  }
  return v6;
}

void BatchBeepCanceller::updateCrossCorrelation(BatchBeepCanceller *this, unsigned int a2, unsigned int a3)
{
  unsigned int v4 = *(const float **)this;
  uint64_t v5 = *((void *)this + 1) - *(void *)this;
  vDSP_Length v6 = v5 >> 2;
  if (v5 >> 2 <= (unint64_t)a3)
  {
    unint64_t v8 = (unint64_t)v5 >> 2;
    if (v8 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v8;
    }
    if (v8 > a3) {
      a3 = v8;
    }
    unsigned int v10 = v9 - v8;
    float v11 = 1.0 / (double)v6;
    float __B = v11;
    vDSP_Length v12 = a3 - v9;
    vDSP_conv((const float *)(*((void *)this + 20) + 4 * v10), 1, v4, 1, (float *)(*((void *)this + 24) + 4 * v10), 1, v12, v6);
    unint64_t v13 = (float *)(*((void *)this + 24) + 4 * v10);
    vDSP_vsmul(v13, 1, &__B, v13, 1, v12);
  }
}

uint64_t BatchBeepCanceller::findCrossCorrelationPeak(BatchBeepCanceller *this, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (uint64_t)(*((void *)this + 1) - *(void *)this) >> 2;
  if (a2 >= v3) {
    uint64_t v4 = a2 - v3;
  }
  else {
    uint64_t v4 = 0;
  }
  LODWORD(v5) = a3 - v3;
  if (a3 >= v3) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v3 >= a3) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = v3;
  }
  if (v6 > a2)
  {
    double v7 = *((double *)this + 31);
    uint64_t v8 = v6 - a2;
    unsigned int v9 = (float *)(*((void *)this + 20) + 4 * a2);
    do
    {
      float v10 = *v9++;
      double v7 = v7 + (float)(v10 * v10);
      --v8;
    }
    while (v8);
    *((double *)this + 31) = v7;
  }
  if (v4 >= v5)
  {
    float v16 = *((float *)this + 54);
    uint64_t v12 = *((void *)this + 20);
  }
  else
  {
    float v11 = 1.0 / (double)(unint64_t)v3;
    uint64_t v12 = *((void *)this + 20);
    uint64_t v13 = *((void *)this + 24);
    float v14 = *((float *)this + 61);
    double v15 = *((double *)this + 31);
    float v16 = *((float *)this + 54);
    uint64_t v17 = v12 + 4 * v3;
    do
    {
      float v18 = v15;
      float v19 = v11 * v18;
      if (v19 < 1.1755e-38) {
        float v19 = 1.1755e-38;
      }
      float v20 = sqrtf(v19);
      float v21 = *(float *)(v17 + 4 * v4);
      float v22 = *(float *)(v12 + 4 * v4);
      float v23 = fabsf(*(float *)(v13 + 4 * v4) / (float)(v20 * v14));
      if (v23 > v16)
      {
        *((float *)this + 54) = v23;
        *((_DWORD *)this + 55) = v4;
        float v16 = v23;
      }
      double v15 = v15 + (float)((float)(v21 * v21) - (float)(v22 * v22));
      ++v4;
    }
    while (v5 != v4);
    *((double *)this + 31) = v15;
  }
  unsigned int v24 = *((_DWORD *)this + 46);
  unsigned int v25 = *((_DWORD *)this + 55);
  unsigned int v26 = v5 - v25;
  if (((*((void *)this + 21) - v12) >> 2 < (unint64_t)(*((_DWORD *)this + 20) + v24)
     || v16 > *((float *)this + 64))
    && v26 >= *((_DWORD *)this + 60)
    && v24 > *((_DWORD *)this + 59))
  {
    return v25;
  }
  else
  {
    return 0;
  }
}

BatchBeepCanceller *BatchBeepCanceller::doAdaptiveCancel(BatchBeepCanceller *this, unsigned int a2)
{
  unsigned int v4 = *((_DWORD *)this + 84) * *((_DWORD *)this + 119) * *((_DWORD *)this + 87);
  signed int v5 = v4 - a2;
  if (v4 <= a2)
  {
    float v10 = (void *)*((void *)this + 52);
    uint64_t v11 = *((void *)this + 53) - (void)v10;
    uint64_t v7 = v11 >> 2;
    signed int v12 = a2 - v4;
    uint64_t v13 = *((void *)this + 20);
    signed int v33 = v12;
    if (((*((void *)this + 21) - v13) >> 2) - v12 >= (unint64_t)(v11 >> 2)) {
      memcpy(v10, (const void *)(v13 + 4 * v12), v11 << 30 >> 30);
    }
    signed int v5 = 0;
  }
  else
  {
    uint64_t v6 = (float *)*((void *)this + 52);
    LODWORD(v7) = ((*((void *)this + 53) - (void)v6) >> 2) - v5;
    vDSP_vclr(v6, 1, v5);
    uint64_t v8 = (const void *)*((void *)this + 20);
    uint64_t v9 = *((void *)this + 52);
    if (((*((void *)this + 53) - v9) >> 2) - v5 <= (unint64_t)((uint64_t)(*((void *)this + 21) - (void)v8) >> 2)) {
      memcpy((void *)(v9 + 4 * v5), v8, 4 * (int)v7);
    }
    signed int v33 = 0;
  }
  int v34 = v7;
  int v14 = *((_DWORD *)this + 84);
  int v15 = *((_DWORD *)this + 87);
  int v16 = *((_DWORD *)this + 119);
  vDSP_svesq((const float *)(*((void *)this + 46) + 4 * (v15 * v14 * v16 - *((_DWORD *)this + 118))), 1, (float *)this + 116, (uint64_t)(*((void *)this + 1) - *(void *)this) >> 2);
  vDSP_svesq((const float *)(*((void *)this + 52)+ 4 * (*((_DWORD *)this + 84) * *((_DWORD *)this + 119) * *((_DWORD *)this + 87))), 1, (float *)this + 117, (uint64_t)(*((void *)this + 1) - *(void *)this) >> 2);
  float __B = sqrtf(*((float *)this + 117) / *((float *)this + 116));
  vDSP_vsmul(*((const float **)this + 46), 1, &__B, *((float **)this + 49), 1, (uint64_t)(*((void *)this + 47) - *((void *)this + 46)) >> 2);
  unint64_t v17 = (*((void *)this + 53) - *((void *)this + 52)) >> 2;
  unsigned int v18 = *((_DWORD *)this + 87);
  if (v18 <= v17)
  {
    int v19 = 0;
    unsigned int v20 = v17 / v18;
    LODWORD(v17) = *((_DWORD *)this + 85);
    if (v20 <= 1) {
      int v21 = 1;
    }
    else {
      int v21 = v20;
    }
    do
    {
      if (v17)
      {
        unint64_t v22 = 0;
        uint64_t v23 = 16;
        do
        {
          memcpy(*(void **)(*((void *)this + 63) + v23), (const void *)(*((void *)this + 52) + 4 * (*((_DWORD *)this + 87) * v19)), 4 * *((unsigned int *)this + 87));
          ++v22;
          v23 += 16;
        }
        while (v22 < *((unsigned int *)this + 85));
      }
      if (*((_DWORD *)this + 86))
      {
        unint64_t v24 = 0;
        uint64_t v25 = 16;
        do
        {
          memcpy(*(void **)(*((void *)this + 65) + v25), (const void *)(*((void *)this + 49) + 4 * (*((_DWORD *)this + 87) * v19)), 4 * *((unsigned int *)this + 87));
          ++v24;
          v25 += 16;
        }
        while (v24 < *((unsigned int *)this + 86));
      }
      NonlinearBeepCanceller::nl_proc(*((NonlinearBeepCanceller **)this + 45), *((const AudioBufferList **)this + 63), *((const AudioBufferList **)this + 65), *((AudioBufferList **)this + 60), *((AudioBufferList **)this + 61), *((AudioBufferList **)this + 64), *((AudioBufferList **)this + 62));
      LODWORD(v17) = *((_DWORD *)this + 85);
      if (v17)
      {
        unint64_t v26 = 0;
        uint64_t v27 = 16;
        do
        {
          memcpy((void *)(*((void *)this + 55) + 4 * (*((_DWORD *)this + 87) * v19)), *(const void **)(*((void *)this + 60) + v27), 4 * *((unsigned int *)this + 87));
          ++v26;
          unint64_t v17 = *((unsigned int *)this + 85);
          v27 += 16;
        }
        while (v26 < v17);
      }
      ++v19;
    }
    while (v19 != v21);
  }
  int v28 = (v16 - 1) * v14;
  int v29 = v28 * v15 + v33;
  int v30 = v28 * v15 + v5;
  int v31 = v34 - (v14 + v28 - 1) * v15;
  *((_DWORD *)this + 71) = 0;
  *(void *)((char *)this + 268) = 0;
  *(void *)((char *)this + 276) = 0;
  *((_DWORD *)this + 65) = a2;
  BatchBeepCanceller::storeReportPart1(this, a2);
  memcpy((void *)(*((void *)this + 20) + 4 * v29), (const void *)(*((void *)this + 55)+ 4 * (v30 + (*((_DWORD *)this + 84) - 1) * *((_DWORD *)this + 87))), 4 * v31);
  return BatchBeepCanceller::storeReportPart2(this, a2);
}

BatchBeepCanceller *BatchBeepCanceller::storeReportPart1(BatchBeepCanceller *this, unsigned int a2)
{
  int v2 = *((_DWORD *)this + 66);
  if ((v2 & 4) != 0)
  {
    uint64_t v3 = (*((void *)this + 18) - *((void *)this + 17)) >> 2;
    uint64_t v4 = v3 + a2;
    float v5 = 0.0;
    if (v4 > a2)
    {
      uint64_t v6 = v4 - a2;
      uint64_t v7 = (float *)(*((void *)this + 20) + 4 * a2);
      do
      {
        float v8 = *v7++;
        float v5 = v5 + (float)(v8 * v8);
        --v6;
      }
      while (v6);
      float v5 = sqrtf(v5 / (float)v3);
    }
    *((float *)this + 69) = v5;
  }
  if ((v2 & 0x18) != 0)
  {
    uint64_t v9 = ((*((void *)this + 18) - *((void *)this + 17)) >> 2) + a2;
    float v10 = 0.0;
    if (v9 > a2)
    {
      uint64_t v11 = v9 - a2;
      signed int v12 = (float *)(*((void *)this + 20) + 4 * a2);
      do
      {
        float v13 = *v12++;
        float v14 = fabsf(v13);
        if (v10 < v14) {
          float v10 = v14;
        }
        --v11;
      }
      while (v11);
    }
    *((float *)this + 70) = v10;
  }
  if ((v2 & 0x10) != 0)
  {
    uint64_t v15 = (*((void *)this + 18) - *((void *)this + 17)) >> 2;
    uint64_t v16 = v15 + a2;
    float v17 = 0.0;
    if (v16 > a2)
    {
      unsigned int v18 = 0;
      uint64_t v20 = v16 - a2;
      int v21 = (float *)(*((void *)this + 20) + 4 * a2);
      do
      {
        float v22 = *v21++;
        float v19 = *((float *)this + 70) * 0.95;
        if (fabsf(v22) > v19) {
          ++v18;
        }
        --v20;
      }
      while (v20);
      float v17 = (float)v18 / (float)v15;
    }
    *((float *)this + 71) = v17;
  }
  return this;
}

BatchBeepCanceller *BatchBeepCanceller::storeReportPart2(BatchBeepCanceller *this, unsigned int a2)
{
  int v2 = *((_DWORD *)this + 66);
  if (v2)
  {
    uint64_t v3 = (float *)*((void *)this + 17);
    unint64_t v4 = *((void *)this + 18) - (void)v3;
    unint64_t v5 = v4 >> 2;
    if ((v4 >> 2))
    {
      uint64_t v6 = (v4 >> 2);
      float v7 = 0.0;
      do
      {
        float v8 = *v3++;
        float v7 = v7 + (float)(v8 * v8);
        --v6;
      }
      while (v6);
      float v9 = sqrtf(v7 / (float)v5);
    }
    else
    {
      float v9 = 0.0;
    }
    *((float *)this + 67) = v9;
    if ((v2 & 2) == 0) {
      return this;
    }
  }
  else if ((v2 & 2) == 0)
  {
    return this;
  }
  uint64_t v10 = (*((void *)this + 18) - *((void *)this + 17)) >> 2;
  uint64_t v11 = v10 + a2;
  float v12 = 0.0;
  if (v11 > a2)
  {
    uint64_t v13 = v11 - a2;
    float v14 = (float *)(*((void *)this + 20) + 4 * a2);
    do
    {
      float v15 = *v14++;
      float v12 = v12 + (float)(v15 * v15);
      --v13;
    }
    while (v13);
    float v12 = sqrtf(v12 / (float)v10);
  }
  *((float *)this + 68) = v12;
  return this;
}

void sub_1BA21C548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void BatchBeepCanceller::BatchBeepCanceller(BatchBeepCanceller *this)
{
  *((_DWORD *)this + 20) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 213) = 0u;
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 29) = 0;
  *((_DWORD *)this + 64) = 0;
  *((_DWORD *)this + 72) = 4;
  *(_OWORD *)((char *)this + 292) = xmmword_1BA25E710;
  *((_DWORD *)this + 77) = 2;
  *(_OWORD *)((char *)this + 312) = xmmword_1BA25E720;
  *(_OWORD *)((char *)this + 328) = xmmword_1BA25E6C0;
  *((void *)this + 43) = 0x4000000001;
  *((_DWORD *)this + 88) = 16000;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *(_OWORD *)((char *)this + 440) = 0u;
  *((void *)this + 57) = 0;
  *((_OWORD *)this + 37) = 0u;
  *((_OWORD *)this + 38) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
}

{
  *((_DWORD *)this + 20) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 213) = 0u;
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 29) = 0;
  *((_DWORD *)this + 64) = 0;
  *((_DWORD *)this + 72) = 4;
  *(_OWORD *)((char *)this + 292) = xmmword_1BA25E710;
  *((_DWORD *)this + 77) = 2;
  *(_OWORD *)((char *)this + 312) = xmmword_1BA25E720;
  *(_OWORD *)((char *)this + 328) = xmmword_1BA25E6C0;
  *((void *)this + 43) = 0x4000000001;
  *((_DWORD *)this + 88) = 16000;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *(_OWORD *)((char *)this + 440) = 0u;
  *((void *)this + 57) = 0;
  *((_OWORD *)this + 37) = 0u;
  *((_OWORD *)this + 38) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
}

uint64_t BatchBeepCanceller::initialize(BatchBeepCanceller *this, uint64_t a2, char *a3, unsigned int *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, unsigned int *a8, _DWORD *a9, _DWORD *a10)
{
  unint64_t v18 = *a4;
  if (this != (BatchBeepCanceller *)a2) {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this, *(char **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  }
  if (BatchBeepCanceller::updateLDL(this, a4, a3)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v20 = *(char **)a2;
  unint64_t v21 = *(void *)(a2 + 8) - *(void *)a2;
  unint64_t v22 = v21 >> 2;
  if ((v21 >> 2))
  {
    uint64_t v23 = (v21 >> 2);
    float v24 = 0.0;
    do
    {
      float v25 = *(float *)v20;
      v20 += 4;
      float v24 = v24 + (float)(v25 * v25);
      --v23;
    }
    while (v23);
    float v26 = sqrtf(v24 / (float)v22);
    *((float *)this + 61) = v26;
    if (v26 >= 1.1755e-38)
    {
      *((_DWORD *)this + 20) = *a5;
      *((_DWORD *)this + 59) = *a6;
      *((_DWORD *)this + 58) = *a9;
      unsigned int v27 = *a8;
      if (*a8 <= *a4) {
        unsigned int v27 = *a4;
      }
      *((_DWORD *)this + 60) = v27;
      *((_DWORD *)this + 64) = *a10;
      std::vector<float>::resize((char **)this + 11, v18);
      std::vector<float>::resize((char **)this + 14, v18);
      std::vector<float>::resize((char **)this + 17, v18 + ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 2));
      std::vector<float>::resize((char **)this + 20, *a5 + *a7 + ((*((void *)this + 1) - *(void *)this) >> 2));
      std::vector<float>::resize((char **)this + 24, (*a7 + *a5 + 1));
      *((_DWORD *)this + 56) = 0;
      BatchBeepCanceller::reset(this);
    }
  }
  else
  {
    *((_DWORD *)this + 61) = 0;
  }
  return 4294967294;
}

void std::vector<float>::resize(char **a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    float v19 = &v3[4 * a2];
    goto LABEL_15;
  }
  unint64_t v6 = a2 - v5;
  float v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 2)
  {
    bzero(a1[1], 4 * v6);
    float v19 = &v4[4 * v6];
LABEL_15:
    a1[1] = v19;
    return;
  }
  if (a2 >> 62) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 1;
  if (v8 >> 1 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v10 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v10);
  float v12 = *a1;
  uint64_t v13 = a1[1];
  float v14 = &v11[4 * v5];
  uint64_t v16 = &v11[4 * v15];
  bzero(v14, 4 * v6);
  float v17 = &v14[4 * v6];
  while (v13 != v12)
  {
    int v18 = *((_DWORD *)v13 - 1);
    v13 -= 4;
    *((_DWORD *)v14 - 1) = v18;
    v14 -= 4;
  }
  *a1 = v14;
  a1[1] = v17;
  a1[2] = v16;
  if (v12)
  {
    operator delete(v12);
  }
}

uint64_t BatchBeepCanceller::updateLDL(BatchBeepCanceller *this, const unsigned int *a2, const char *a3)
{
  if (a3 && *a3) {
    return 0xFFFFFFFFLL;
  }
  std::vector<float>::vector(v26, *a2);
  uint64_t v6 = *a2;
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)this;
    unint64_t v9 = (uint64_t)(*((void *)this + 1) - *(void *)this) >> 2;
    unint64_t v10 = (float *)v26[0];
    do
    {
      double v11 = 0.0;
      if (v9 > v7)
      {
        uint64_t v12 = 0;
        unint64_t v13 = v7;
        do
        {
          double v11 = v11 + (float)(*(float *)(v8 + 4 * v13) * *(float *)(v8 + 4 * v12));
          unint64_t v13 = (v7 + v12++ + 1);
        }
        while (v9 > v13);
      }
      float v14 = 1.0 / (double)v9 * v11;
      v10[v7++] = v14;
    }
    while (v7 != v6);
  }
  std::vector<float>::vector(__p, (v6 * v6));
  unint64_t v15 = *a2;
  if (v15)
  {
    int v16 = 0;
    unint64_t v17 = 0;
    int v18 = v26[0];
    int v19 = v15 + 1;
    uint64_t v20 = __p[0];
    int v21 = *a2;
    int v22 = *a2;
    do
    {
      v20[(v19 * v17++)] = *v18;
      if (v17 < v15)
      {
        int v23 = v21;
        uint64_t v24 = 1;
        do
        {
          v20[(v16 + v24)] = v18[v24];
          v20[v23] = v18[v24++];
          v23 += v15;
        }
        while (v22 != v24);
      }
      --v22;
      v21 += v19;
      v16 += v19;
    }
    while (v17 != v15);
  }
  LDLDecomposition::decompose((uint64_t)this + 24, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  return 0;
}

void sub_1BA21CAB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void BatchBeepCanceller::initNonlinearBeepCanceller(BatchBeepCanceller *this)
{
  if (*((void *)this + 45)) {
    std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100]((uint64_t *)this + 45, 0);
  }
  operator new();
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t *a1, unsigned int a2, size_t __sz)
{
  int v3 = __sz;
  unint64_t v5 = a2;
  size_t v6 = __sz;
  unint64_t v7 = (char *)operator new(__sz);
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = (uint64_t)&v7[v3];
  do
    v7[v9++] = 0;
  while (v6 != v9);
  uint64_t v11 = a1[2];
  uint64_t v12 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v11 - *a1) >> 3) < v5)
  {
    if (v12)
    {
      std::vector<std::vector<float>>::__clear[abi:ne180100](a1);
      operator delete((void *)*a1);
      uint64_t v11 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 3);
    uint64_t v14 = 2 * v13;
    if (2 * v13 <= v5) {
      uint64_t v14 = v5;
    }
    if (v13 >= 0x555555555555555) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int v16 = operator new(24 * v15);
    *a1 = (uint64_t)v16;
    a1[1] = (uint64_t)v16;
    a1[2] = (uint64_t)&v16[3 * v15];
    unint64_t v17 = &v16[3 * v5];
    uint64_t v18 = 24 * v5;
    do
    {
      *int v16 = 0;
      v16[1] = 0;
      v16[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v16, v8, v10, v6);
      v16 += 3;
      v18 -= 24;
    }
    while (v18);
    goto LABEL_41;
  }
  unint64_t v33 = (a1[1] - v12) / 24;
  unint64_t v34 = v5;
  if (v33 >= v5) {
    uint64_t v19 = v5;
  }
  else {
    uint64_t v19 = (a1[1] - v12) / 24;
  }
  for (; v19; --v19)
  {
    unint64_t v20 = *(void *)(v12 + 16);
    int v21 = *(char **)v12;
    if (v20 - *(void *)v12 >= v6)
    {
      uint64_t v24 = *(unsigned char **)(v12 + 8);
      uint64_t v25 = v24 - v21;
      if (v24 - v21 < v6)
      {
        if (v24 != v21)
        {
          memmove(*(void **)v12, v8, v24 - v21);
          int v21 = *(char **)(v12 + 8);
        }
        if (v25 != v6) {
          memmove(v21, &v8[v25], v10 - (void)&v8[v25]);
        }
        *(void *)(v12 + 8) = &v21[v10 - (void)&v8[v25]];
        goto LABEL_37;
      }
    }
    else
    {
      if (v21)
      {
        *(void *)(v12 + 8) = v21;
        operator delete(v21);
        unint64_t v20 = 0;
        *(void *)uint64_t v12 = 0;
        *(void *)(v12 + 8) = 0;
        *(void *)(v12 + 16) = 0;
      }
      uint64_t v22 = 2 * v20;
      if (2 * v20 <= v6) {
        uint64_t v22 = v6;
      }
      if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v23 = v22;
      }
      std::vector<unsigned char>::__vallocate[abi:ne180100]((void *)v12, v23);
      int v21 = *(char **)(v12 + 8);
    }
    if (v3) {
      memmove(v21, v8, v6);
    }
    *(void *)(v12 + 8) = &v21[v6];
LABEL_37:
    v12 += 24;
  }
  if (v34 > v33)
  {
    float v26 = (void *)a1[1];
    unint64_t v17 = &v26[3 * (v34 - v33)];
    uint64_t v27 = 24 * v34 - 24 * v33;
    do
    {
      void *v26 = 0;
      v26[1] = 0;
      v26[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v26, v8, v10, v6);
      v26 += 3;
      v27 -= 24;
    }
    while (v27);
LABEL_41:
    a1[1] = (uint64_t)v17;
    goto LABEL_48;
  }
  uint64_t v28 = a1[1];
  uint64_t v29 = *a1 + 24 * v34;
  if (v28 != v29)
  {
    uint64_t v30 = a1[1];
    do
    {
      uint64_t v32 = *(void **)(v30 - 24);
      v30 -= 24;
      int v31 = v32;
      if (v32)
      {
        *(void *)(v28 - 16) = v31;
        operator delete(v31);
      }
      uint64_t v28 = v30;
    }
    while (v30 != v29);
  }
  a1[1] = v29;
LABEL_48:
  operator delete(v8);
}

void sub_1BA21D158(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    size_t v6 = result;
    float result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      float result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1BA21D1E0(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  float result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t LDLDecomposition::decompose(uint64_t a1, uint64_t *a2)
{
  *(_DWORD *)(a1 + 48) = 0;
  unint64_t v4 = a2[1] - *a2;
  unint64_t v5 = v4 >> 2;
  unsigned int v6 = -1;
  do
    ++v6;
  while (v6 * v6 < v5);
  uint64_t result = 0xFFFFFFFFLL;
  if (v6 && v6 * v6 == v5)
  {
    std::vector<float>::resize((char **)a1, (v4 >> 2));
    std::vector<float>::resize((char **)(a1 + 24), v6);
    int v8 = 0;
    uint64_t v9 = 0;
    *(_DWORD *)(a1 + 48) = v6;
    uint64_t v10 = *a2;
    uint64_t v11 = *(void *)(a1 + 24);
    uint64_t v12 = 1;
    unsigned int v13 = v6;
    uint64_t v14 = *(char **)a1;
    do
    {
      uint64_t v15 = v9 + v6 * v9;
      float v16 = *(float *)(v10 + 4 * v15);
      *(float *)(v11 + 4 * v9) = v16;
      if (v9)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          float v16 = v16
              + (float)((float)-(float)(*(float *)&v14[4 * (v8 + i)]
                                      * *(float *)&v14[4 * (v8 + i)])
                      * *(float *)(v11 + 4 * i));
          *(float *)(v11 + 4 * v9) = v16;
        }
      }
      uint64_t v18 = v9 + 1;
      unsigned int v19 = v13;
      uint64_t v20 = v12;
      if (v9 + 1 < (unint64_t)v6)
      {
        do
        {
          uint64_t v21 = v9 + v6 * v20;
          float v22 = *(float *)(v10 + 4 * v21);
          if (v9)
          {
            for (uint64_t j = 0; j != v9; ++j)
              float v22 = v22
                  + (float)((float)-(float)(*(float *)&v14[4 * v19 + 4 * j]
                                          * *(float *)&v14[4 * (v8 + j)])
                          * *(float *)(v11 + 4 * j));
          }
          *(float *)&v14[4 * v21] = v22 / *(float *)(v11 + 4 * v9);
          ++v20;
          v19 += v6;
        }
        while (v20 != v6);
      }
      *(_DWORD *)&v14[4 * v15] = 1065353216;
      ++v12;
      v8 += v6;
      v13 += v6;
      ++v9;
    }
    while (v18 != v6);
    return 0;
  }
  return result;
}

void LDLDecomposition::LDLDecomposition(LDLDecomposition *this)
{
  *((_DWORD *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

{
  *((_DWORD *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

uint64_t LDLDecomposition::wholeSquareRoot(LDLDecomposition *this, unsigned int a2)
{
  unsigned int v2 = -1;
  do
    ++v2;
  while (v2 * v2 < a2);
  if (v2 * v2 == a2) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t LDLDecomposition::ldl_solve(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  if (!*((_DWORD *)a1 + 12)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1] - *a2;
  uint64_t v5 = *a3;
  if ((v4 & 0x3FFFFFFFCLL) != 0)
  {
    int v6 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = v4 >> 2;
    uint64_t v9 = *a1;
    uint64_t v10 = (v4 >> 2);
    do
    {
      float v11 = *(float *)(v3 + 4 * v7);
      *(float *)(v5 + 4 * v7) = v11;
      if (v7)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          float v11 = v11 - (float)(*(float *)(v9 + 4 * (v6 + i)) * *(float *)(v5 + 4 * i));
          *(float *)(v5 + 4 * v7) = v11;
        }
      }
      ++v7;
      v6 += v8;
    }
    while (v7 != v10);
  }
  uint64_t v13 = a3[1] - v5;
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = a1[3];
    do
    {
      *(float *)(v5 + 4 * v14) = *(float *)(v5 + 4 * v14) / *(float *)(v15 + 4 * v14);
      ++v14;
    }
    while (v13 >> 2 > (unint64_t)v14);
  }
  unint64_t v16 = (unint64_t)v13 >> 2;
  if (v16)
  {
    int v17 = 0;
    unsigned int v18 = v16 - 1;
    uint64_t v19 = *a1;
    unsigned int v20 = v16 - 1 + v16 * v16;
    unsigned int v21 = v16;
    do
    {
      if (v21 < v16)
      {
        float v22 = *(float *)(v5 + 4 * v18);
        unsigned int v23 = v20;
        int v24 = v17;
        uint64_t v25 = (float *)(v5 + 4 * v21);
        do
        {
          float v26 = *v25++;
          float v22 = v22 - (float)(*(float *)(v19 + 4 * v23) * v26);
          *(float *)(v5 + 4 * v18) = v22;
          v23 += v16;
          --v24;
        }
        while (v24);
      }
      --v18;
      --v21;
      ++v17;
      v20 += ~v16;
    }
    while (v18 < v16);
  }
  return 0;
}

double BatchBeepCanceller::rms(void *a1, unsigned int a2)
{
  uint64_t v2 = (a1[1] - *a1) >> 2;
  unsigned int v3 = v2 - a2;
  if (v2 <= a2) {
    return 0.0;
  }
  unint64_t v4 = a2 - (unint64_t)v2;
  uint64_t v5 = (float *)(*a1 + 4 * a2);
  double result = 0.0;
  do
  {
    float v7 = *v5++;
    *(float *)&double result = *(float *)&result + (float)(v7 * v7);
  }
  while (!__CFADD__(v4++, 1));
  *(float *)&double result = sqrtf(*(float *)&result / (float)v3);
  return result;
}

BatchBeepCanceller *BatchBeepCanceller::resetBeepInfo(BatchBeepCanceller *this, int a2)
{
  *((_DWORD *)this + 65) = a2;
  *((_DWORD *)this + 71) = 0;
  *(void *)((char *)this + 268) = 0;
  *(void *)((char *)this + 276) = 0;
  return this;
}

uint64_t BatchBeepCanceller::feed(BatchBeepCanceller *this, const __int16 *a2, unsigned int a3, const __int16 **a4)
{
  *a4 = 0;
  return 0;
}

BatchBeepCanceller *BatchBeepCanceller::beepComing(BatchBeepCanceller *this, int a2)
{
  if (!*((unsigned char *)this + 228))
  {
    *((_DWORD *)this + 65) = -3;
    *((_DWORD *)this + 71) = 0;
    *(void *)((char *)this + 268) = 0;
    *(void *)((char *)this + 276) = 0;
  }
  *((_DWORD *)this + 56) = a2 + 1;
  return this;
}

BatchBeepCanceller *BatchBeepCanceller::recordBeepInfo(BatchBeepCanceller *this, char a2)
{
  *((_DWORD *)this + 65) = -4;
  *((_DWORD *)this + 71) = 0;
  *(void *)((char *)this + 268) = 0;
  *(void *)((char *)this + 276) = 0;
  *((_DWORD *)this + 66) = a2 & 0x1F;
  return this;
}

uint64_t BatchBeepCanceller::lastBeepInfo(uint64_t a1, _OWORD *a2)
{
  if (a2)
  {
    long long v2 = *(_OWORD *)(a1 + 260);
    *(_OWORD *)((char *)a2 + 12) = *(_OWORD *)(a1 + 272);
    *a2 = v2;
  }
  return *(unsigned int *)(a1 + 260);
}

BatchBeepCanceller *BatchBeepCanceller::doBatchCancel(BatchBeepCanceller *this, unsigned int a2)
{
  uint64_t v5 = (char *)this + 112;
  unint64_t v4 = (void *)*((void *)this + 14);
  unsigned int v6 = *((_DWORD *)v5 + 30);
  BOOL v7 = a2 >= v6;
  unsigned int v8 = a2 - v6;
  if (v7) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  unint64_t v10 = *((void *)v5 + 1) - (void)v4;
  if (v10) {
    memmove(v4, (const void *)(*((void *)this + 24) + 4 * v9), 4 * ((v10 >> 2) + v9) - 4 * v9);
  }
  LDLDecomposition::ldl_solve((uint64_t *)this + 3, (uint64_t *)v5, (uint64_t *)this + 11);
  *(void *)((char *)this + 268) = 0;
  *(void *)((char *)this + 276) = 0;
  *((_DWORD *)this + 71) = 0;
  *((_DWORD *)this + 65) = a2;
  BatchBeepCanceller::storeReportPart1(this, v9);
  BatchBeepCanceller::convolve((uint64_t *)this + 17, (uint64_t *)this, (uint64_t *)this + 11);
  uint64_t v11 = *((void *)this + 17);
  uint64_t v12 = *((void *)this + 18);
  uint64_t v13 = v12 - v11;
  if (v12 != v11)
  {
    uint64_t v14 = 0;
    unint64_t v15 = v13 >> 2;
    uint64_t v16 = *((void *)this + 20);
    do
    {
      *(float *)(v16 + 4 * (v9 + v14)) = *(float *)(v16 + 4 * (v9 + v14))
                                                       - *(float *)(v11 + 4 * v14);
      ++v14;
    }
    while (v15 > v14);
  }
  return BatchBeepCanceller::storeReportPart2(this, v9);
}

uint64_t *BatchBeepCanceller::convolve(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *result;
  uint64_t v4 = result[1] - *result;
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = v4 >> 2;
    uint64_t v7 = *a2;
    unint64_t v8 = (unint64_t)(a2[1] - *a2) >> 2;
    uint64_t v9 = *a3;
    unint64_t v10 = (unint64_t)(a3[1] - *a3) >> 2;
    unsigned int v11 = 1;
    do
    {
      if (v11 >= v8) {
        double result = (uint64_t *)(v11 - v8);
      }
      else {
        double result = 0;
      }
      unsigned int v12 = v5 + 1;
      if ((int)v5 + 1 >= v8) {
        unsigned int v13 = v5 + 1 - v8;
      }
      else {
        unsigned int v13 = 0;
      }
      if (v12 >= v10) {
        unint64_t v14 = v10;
      }
      else {
        unint64_t v14 = v12;
      }
      float v15 = 0.0;
      if (v13 < v14)
      {
        double result = (uint64_t *)(v5 - (void)result);
        LODWORD(v16) = v11 - v8;
        if (v11 >= v8) {
          unint64_t v16 = v16;
        }
        else {
          unint64_t v16 = 0;
        }
        do
        {
          float v15 = v15 + (float)(*(float *)(v9 + 4 * v16++) * *(float *)(v7 + 4 * result));
          double result = (uint64_t *)((char *)result - 1);
        }
        while (v16 < v14);
      }
      *(float *)(v3 + 4 * v5) = v15;
      ++v11;
      ++v5;
    }
    while (v6 > v12);
  }
  return result;
}

double BatchBeepCanceller::rms(void *a1, unsigned int a2, unsigned int a3)
{
  if (a3 <= a2) {
    return 0.0;
  }
  unint64_t v3 = a3 - (unint64_t)a2;
  uint64_t v4 = (float *)(*a1 + 4 * a2);
  double result = 0.0;
  do
  {
    float v6 = *v4++;
    *(float *)&double result = *(float *)&result + (float)(v6 * v6);
    --v3;
  }
  while (v3);
  *(float *)&double result = sqrtf(*(float *)&result / (float)(a3 - a2));
  return result;
}

void *BatchBeepCanceller::maxabs(void *result, unsigned int a2, unsigned int a3)
{
  float v3 = 0.0;
  if (a2 < a3)
  {
    unint64_t v4 = a3 - (unint64_t)a2;
    uint64_t v5 = (float *)(*result + 4 * a2);
    do
    {
      float v6 = *v5++;
      float v7 = fabsf(v6);
      if (v3 < v7) {
        float v3 = v7;
      }
      --v4;
    }
    while (v4);
  }
  return result;
}

float BatchBeepCanceller::proportionAbsAboveBound(void *a1, unsigned int a2, unsigned int a3, float a4)
{
  float v4 = 0.0;
  if (a3 > a2)
  {
    unsigned int v5 = 0;
    unint64_t v6 = a3 - (unint64_t)a2;
    float v7 = (float *)(*a1 + 4 * a2);
    do
    {
      float v8 = *v7++;
      if (fabsf(v8) > a4) {
        ++v5;
      }
      --v6;
    }
    while (v6);
    return (float)v5 / (float)(a3 - a2);
  }
  return v4;
}

void sub_1BA21DB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA21FD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA22018C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AFLanguageDidChangeCallback(uint64_t a1, void *a2)
{
  return [a2 _didReceiveLanguageCodeUpdate];
}

void sub_1BA223158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8556(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8557(uint64_t a1)
{
}

id getkSymptomDiagnosticReplySuccess()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v0 = (void **)getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  uint64_t v8 = getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySuccessSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SymptomDiagnosticReporterLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSymptomDiagnosticReplySuccess");
    getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = v6[3];
    int v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    float v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

id getkSymptomDiagnosticReplySessionID()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v0 = (void **)getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
  uint64_t v8 = getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SymptomDiagnosticReporterLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSymptomDiagnosticReplySessionID");
    getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr = v6[3];
    int v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    float v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

id getkSymptomDiagnosticReplyReason()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v0 = (void **)getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  uint64_t v8 = getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SymptomDiagnosticReporterLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSymptomDiagnosticReplyReason");
    getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = v6[3];
    int v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    float v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

id getkSymptomDiagnosticReplyReasonString()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v0 = (void **)getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  uint64_t v8 = getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SymptomDiagnosticReporterLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSymptomDiagnosticReplyReasonString");
    getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr = v6[3];
    int v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    float v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

void *__getkSymptomDiagnosticReplyReasonStringSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SymptomDiagnosticReporterLibrary();
  double result = dlsym(v2, "kSymptomDiagnosticReplyReasonString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SymptomDiagnosticReporterLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __SymptomDiagnosticReporterLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6200650;
    uint64_t v5 = 0;
    SymptomDiagnosticReporterLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
    if (SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
}

uint64_t __SymptomDiagnosticReporterLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SymptomDiagnosticReporterLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkSymptomDiagnosticReplyReasonSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplyReason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticReplySessionIDSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplySessionID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticReplySuccessSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplySuccess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BA225F70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getSDRDiagnosticReporterClass_block_invoke(uint64_t a1)
{
  SymptomDiagnosticReporterLibrary();
  Class result = objc_getClass("SDRDiagnosticReporter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSDRDiagnosticReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    float v3 = (void *)abort_report_np();
    return (Class)+[CSDiagnosticReporter sharedInstance];
  }
  return result;
}

uint64_t HandleDeviceLockStateChanged(uint64_t a1, void *a2)
{
  return [a2 screenLockStateChanged];
}

void sub_1BA22C714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA22FCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA230554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA231CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA231E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA232214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA232614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA2329E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA232BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void createFloatArray(uint64_t a1)
{
  if (!a1)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Length must be > 0");
    __cxa_throw(exception, (struct type_info *)off_1E61FEFC0, MEMORY[0x1E4FBA1E8]);
  }
  size_t v1 = 4 * a1;
  long long v2 = malloc_type_malloc(4 * a1, 0x3BB9EF10uLL);
  if (!v2)
  {
    SEL v4 = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v5 = std::bad_alloc::bad_alloc(v4);
    __cxa_throw(v5, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  bzero(v2, v1);
}

void sub_1BA234110(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::invalid_argument::invalid_argument[abi:ne180100](std::logic_error *a1, const char *a2)
{
  Class result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
  return result;
}

uint64_t nextPowerOf2(uint64_t result)
{
  if (!result) {
    return 1;
  }
  if ((result & (result - 1)) != 0) {
    return 2 * (1 << log2f((float)(unint64_t)result));
  }
  return result;
}

void CSAudioSpectralMeterImpl::CSAudioSpectralMeterImpl(CSAudioSpectralMeterImpl *this, float a2)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)((char *)this + 120) = 0u;
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  operator new();
}

void sub_1BA2344E8(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9E6B40](v2, 0x1080C402C641090);
  uint64_t v5 = (void *)v1[21];
  if (v5)
  {
    v1[22] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)v1[18];
  if (v6)
  {
    v1[19] = v6;
    operator delete(v6);
  }
  uint64_t v7 = *v3;
  if (*v3)
  {
    v1[16] = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)v1[13];
  v1[13] = 0;
  if (v8) {
    std::default_delete<corespeech::CSAudioCircularBufferImpl<float>>::operator()[abi:ne180100](v8);
  }
  _Unwind_Resume(a1);
}

void std::default_delete<corespeech::CSAudioCircularBufferImpl<float>>::operator()[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }
  uint64_t v3 = a1[5];
  a1[5] = 0;
  if (v3) {
    MEMORY[0x1BA9E6B20](v3, 0x1000C8052888210);
  }
  JUMPOUT(0x1BA9E6B40);
}

void CSAudioSpectralMeterImpl::~CSAudioSpectralMeterImpl(CSAudioSpectralMeterImpl *this)
{
  uint64_t v2 = (void *)*((void *)this + 13);
  *((void *)this + 13) = 0;
  if (v2) {
    std::default_delete<corespeech::CSAudioCircularBufferImpl<float>>::operator()[abi:ne180100](v2);
  }
  uint64_t v3 = (OpaqueFFTSetup *)*((void *)this + 10);
  if (v3) {
    vDSP_destroy_fftsetup(v3);
  }
  SEL v4 = (void *)*((void *)this + 7);
  if (v4)
  {
    free(v4);
    *((void *)this + 7) = 0;
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    free(v5);
    *((void *)this + 8) = 0;
  }
  uint64_t v6 = (void *)*((void *)this + 11);
  if (v6) {
    free(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 12);
  if (v7) {
    free(v7);
  }
  uint64_t v8 = (void *)*((void *)this + 9);
  if (v8)
  {
    free(v8);
    *((void *)this + 9) = 0;
  }
  uint64_t v9 = (void **)((char *)this + 120);
  *((void *)this + 16) = *((void *)this + 15);
  std::vector<unsigned int>::shrink_to_fit((std::vector<unsigned int> *)this + 5);
  unint64_t v10 = (void **)((char *)this + 144);
  *((void *)this + 19) = *((void *)this + 18);
  std::vector<float>::shrink_to_fit((char **)this + 18);
  *((void *)this + 22) = *((void *)this + 21);
  std::vector<float>::shrink_to_fit((char **)this + 21);
  unsigned int v11 = (void *)*((void *)this + 21);
  if (v11)
  {
    *((void *)this + 22) = v11;
    operator delete(v11);
  }
  unsigned int v12 = *v10;
  if (*v10)
  {
    *((void *)this + 19) = v12;
    operator delete(v12);
  }
  unsigned int v13 = *v9;
  if (*v9)
  {
    *((void *)this + 16) = v13;
    operator delete(v13);
  }
  unint64_t v14 = (void *)*((void *)this + 13);
  *((void *)this + 13) = 0;
  if (v14) {
    std::default_delete<corespeech::CSAudioCircularBufferImpl<float>>::operator()[abi:ne180100](v14);
  }
}

void std::vector<unsigned int>::shrink_to_fit(std::vector<unsigned int> *this)
{
  id value = this->__end_cap_.__value_;
  begin = this->__begin_;
  std::vector<unsigned int>::pointer end = this->__end_;
  unint64_t v5 = end - begin;
  if (v5 >= value - begin) {
    return;
  }
  if (end == begin)
  {
    unint64_t v10 = 0;
    uint64_t v8 = (unsigned int *)(4 * v5);
    goto LABEL_8;
  }
  uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(end - begin);
  std::vector<unsigned int>::pointer v7 = this->__begin_;
  begin = this->__end_;
  uint64_t v8 = (unsigned int *)&v6[4 * v5];
  unint64_t v10 = (unsigned int *)&v6[4 * v9];
  if (begin == this->__begin_)
  {
LABEL_8:
    unsigned int v11 = v8;
    goto LABEL_9;
  }
  unsigned int v11 = v8;
  do
  {
    unsigned int v12 = *--begin;
    *--unsigned int v11 = v12;
  }
  while (begin != v7);
  begin = v7;
LABEL_9:
  this->__begin_ = v11;
  this->__end_ = v8;
  this->__end_cap_.__value_ = v10;
  if (begin)
  {
    operator delete(begin);
  }
}

void std::vector<float>::shrink_to_fit(char **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = *a1;
  SEL v4 = a1[1];
  unint64_t v5 = (v4 - v3) >> 2;
  if (v5 >= (v2 - v3) >> 2) {
    return;
  }
  if (v4 == v3)
  {
    unint64_t v10 = 0;
    uint64_t v8 = 4 * v5;
    goto LABEL_8;
  }
  uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((v4 - v3) >> 2);
  std::vector<unsigned int>::pointer v7 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v8 = (uint64_t)&v6[4 * v5];
  unint64_t v10 = &v6[4 * v9];
  if (v3 == *a1)
  {
LABEL_8:
    uint64_t v11 = v8;
    goto LABEL_9;
  }
  uint64_t v11 = v8;
  do
  {
    int v12 = *((_DWORD *)v3 - 1);
    v3 -= 4;
    *(_DWORD *)(v11 - 4) = v12;
    v11 -= 4;
  }
  while (v3 != v7);
  uint64_t v3 = v7;
LABEL_9:
  *a1 = (char *)v11;
  a1[1] = (char *)v8;
  a1[2] = v10;
  if (v3)
  {
    operator delete(v3);
  }
}

void CSAudioSpectralMeterImpl::setOutputFrequencyBandsInHz(std::vector<unsigned int> *this, uint64_t *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a2[1] == *a2)
  {
    v59 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v63 = "setOutputFrequencyBandsInHz";
      _os_log_fault_impl(&dword_1BA1A5000, v59, OS_LOG_TYPE_FAULT, "%s Number of Output Frequency Bands must be > 0.", buf, 0xCu);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "CSAudioSpectralMeterImpl: Number of Output Frequency Bands must be > 0.");
    __cxa_throw(exception, (struct type_info *)off_1E61FEFC0, MEMORY[0x1E4FBA1E8]);
  }
  LOBYTE(this->__begin_) = 1;
  SEL v4 = this + 5;
  this[5].__end_ = this[5].__begin_;
  std::vector<unsigned int>::shrink_to_fit(this + 5);
  uint64_t v5 = a2[1] - *a2;
  p_std::vector<unsigned int>::pointer begin = &v4->__begin_;
  if (v5 >> 2 > (unint64_t)(this[5].__end_cap_.__value_ - v4->__begin_))
  {
    if (v5 < 0) {
LABEL_68:
    }
      std::vector<float>::__throw_length_error[abi:ne180100]();
    int64_t v6 = (char *)this[5].__end_ - (char *)v4->__begin_;
    std::vector<unsigned int>::pointer v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v5 >> 2);
    uint64_t v8 = (unsigned int *)&v7[v6 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v10 = (unsigned int *)&v7[4 * v9];
    std::vector<unsigned int>::pointer begin = this[5].__begin_;
    std::vector<unsigned int>::pointer end = this[5].__end_;
    unsigned int v13 = v8;
    if (end != begin)
    {
      unsigned int v13 = v8;
      do
      {
        unsigned int v14 = *--end;
        *--unsigned int v13 = v14;
      }
      while (end != begin);
    }
    this[5].__begin_ = v13;
    this[5].__end_ = v8;
    this[5].__end_cap_.__value_ = v10;
    if (begin) {
      operator delete(begin);
    }
  }
  float v15 = this + 6;
  this[6].__end_ = this[6].__begin_;
  std::vector<float>::shrink_to_fit((char **)&this[6]);
  std::vector<float>::reserve((void **)&this[6].__begin_, (a2[1] - *a2) >> 2);
  unint64_t v16 = this + 7;
  this[7].__end_ = this[7].__begin_;
  std::vector<float>::shrink_to_fit((char **)&this[7]);
  std::vector<float>::reserve((void **)&this[7].__begin_, (a2[1] - *a2) >> 2);
  std::vector<unsigned int>::pointer v17 = this->__end_;
  if ((int)v17 >= 0) {
    int v18 = (int)this->__end_;
  }
  else {
    int v18 = v17 + 1;
  }
  uint64_t v19 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v20 = 0;
    unsigned int v21 = 0;
    float v22 = *((float *)&this->__begin_ + 1) / (float)(unint64_t)v17;
    unsigned int v23 = v18 >> 1;
    do
    {
      unsigned int v24 = vcvtps_u32_f32(*(float *)(v19 + 4 * v20) / v22);
      if (v23 >= v24) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v23;
      }
      std::vector<unsigned int>::pointer v27 = this[5].__end_;
      id value = this[5].__end_cap_.__value_;
      if (v27 >= value)
      {
        std::vector<unsigned int>::pointer v29 = *p_begin;
        uint64_t v30 = v27 - *p_begin;
        unint64_t v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62) {
          goto LABEL_68;
        }
        uint64_t v32 = (char *)value - (char *)v29;
        if (v32 >> 1 > v31) {
          unint64_t v31 = v32 >> 1;
        }
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v33 = v31;
        }
        if (v33)
        {
          unint64_t v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v33);
          std::vector<unsigned int>::pointer v29 = this[5].__begin_;
          std::vector<unsigned int>::pointer v27 = this[5].__end_;
        }
        else
        {
          uint64_t v34 = 0;
        }
        unint64_t v35 = (unsigned int *)(v33 + 4 * v30);
        unsigned int *v35 = v25;
        uint64_t v28 = v35 + 1;
        while (v27 != v29)
        {
          unsigned int v36 = *--v27;
          *--unint64_t v35 = v36;
        }
        this[5].__begin_ = v35;
        this[5].__end_ = v28;
        this[5].__end_cap_.__value_ = (unsigned int *)(v33 + 4 * v34);
        if (v29) {
          operator delete(v29);
        }
      }
      else
      {
        id *v27 = v25;
        uint64_t v28 = v27 + 1;
      }
      this[5].__end_ = v28;
      std::vector<unsigned int>::pointer v38 = this[6].__end_;
      uint64_t v37 = this[6].__end_cap_.__value_;
      if (v38 >= v37)
      {
        std::vector<unsigned int>::pointer v40 = v15->__begin_;
        uint64_t v41 = v38 - v15->__begin_;
        unint64_t v42 = v41 + 1;
        if ((unint64_t)(v41 + 1) >> 62) {
          goto LABEL_67;
        }
        uint64_t v43 = (char *)v37 - (char *)v40;
        if (v43 >> 1 > v42) {
          unint64_t v42 = v43 >> 1;
        }
        if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v44 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v44 = v42;
        }
        if (v44)
        {
          unint64_t v44 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v44);
          std::vector<unsigned int>::pointer v40 = this[6].__begin_;
          std::vector<unsigned int>::pointer v38 = this[6].__end_;
        }
        else
        {
          uint64_t v45 = 0;
        }
        int64_t v46 = (unsigned int *)(v44 + 4 * v41);
        *int64_t v46 = 0;
        unint64_t v39 = v46 + 1;
        while (v38 != v40)
        {
          unsigned int v47 = *--v38;
          *--int64_t v46 = v47;
        }
        this[6].__begin_ = v46;
        this[6].__end_ = v39;
        this[6].__end_cap_.__value_ = (unsigned int *)(v44 + 4 * v45);
        if (v40) {
          operator delete(v40);
        }
      }
      else
      {
        void *v38 = 0;
        unint64_t v39 = v38 + 1;
      }
      this[6].__end_ = v39;
      std::vector<unsigned int>::pointer v49 = this[7].__end_;
      float v48 = this[7].__end_cap_.__value_;
      if (v49 >= v48)
      {
        std::vector<unsigned int>::pointer v51 = v16->__begin_;
        uint64_t v52 = v49 - v16->__begin_;
        unint64_t v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 62) {
LABEL_67:
        }
          std::vector<float>::__throw_length_error[abi:ne180100]();
        uint64_t v54 = (char *)v48 - (char *)v51;
        if (v54 >> 1 > v53) {
          unint64_t v53 = v54 >> 1;
        }
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v55 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v55 = v53;
        }
        if (v55)
        {
          unint64_t v55 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v55);
          std::vector<unsigned int>::pointer v51 = this[7].__begin_;
          std::vector<unsigned int>::pointer v49 = this[7].__end_;
        }
        else
        {
          uint64_t v56 = 0;
        }
        long long v57 = (unsigned int *)(v55 + 4 * v52);
        unsigned int *v57 = 0;
        uint64_t v50 = v57 + 1;
        while (v49 != v51)
        {
          unsigned int v58 = *--v49;
          *--long long v57 = v58;
        }
        this[7].__begin_ = v57;
        this[7].__end_ = v50;
        this[7].__end_cap_.__value_ = (unsigned int *)(v55 + 4 * v56);
        if (v51) {
          operator delete(v51);
        }
      }
      else
      {
        *std::vector<unsigned int>::pointer v49 = 0;
        uint64_t v50 = v49 + 1;
      }
      this[7].__end_ = v50;
      uint64_t v19 = *a2;
      uint64_t v20 = ++v21;
    }
    while (v21 < (unint64_t)((a2[1] - *a2) >> 2));
  }
  LOBYTE(this->__begin_) = 0;
}

void sub_1BA234CE4(_Unwind_Exception *exception_object)
{
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    SEL v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    std::vector<unsigned int>::pointer v7 = &v4[4 * v6];
    uint64_t v8 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    unint64_t v10 = v5;
    if (v9 != *a1)
    {
      unint64_t v10 = v5;
      do
      {
        int v11 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

CSAudioSpectralMeterImpl *CSAudioSpectralMeterImpl::setSmoothingFactor(CSAudioSpectralMeterImpl *this, float a2)
{
  if (a2 > 0.99) {
    a2 = 0.99;
  }
  if (a2 < 0.0) {
    a2 = 0.0;
  }
  *((float *)this + 12) = a2;
  return this;
}

CSAudioSpectralMeterImpl *CSAudioSpectralMeterImpl::reset(CSAudioSpectralMeterImpl *this)
{
  *((void *)this + 14) = 0;
  *((void *)this + 5) = 0;
  uint64_t v1 = *((void *)this + 13);
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  return this;
}

void CSAudioSpectralMeterImpl::processFloatBuffer(CSAudioSpectralMeterImpl *this, float *a2, unint64_t a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)this)
  {
    uint64_t v5 = (unint64_t *)*((void *)this + 13);
    unint64_t v6 = v5[2];
    if (*v5)
    {
      unint64_t v7 = 0;
      unint64_t v40 = a3 - v6;
      uint64_t __n = 4 * a3;
      unint64_t v42 = a2;
      do
      {
        unint64_t v8 = v5[3];
        uint64_t v9 = *(char **)(v5[6] + 8 * v7);
        unint64_t v10 = &a2[v7 * a3];
        unint64_t v11 = v6 - v8;
        unint64_t v12 = a3 - (v6 - v8);
        if (a3 <= v6 - v8)
        {
          memcpy(&v9[4 * v8], &a2[v7 * a3], __n);
          unint64_t v12 = v8 + a3;
        }
        else
        {
          if (a3 >= v6)
          {
            unint64_t v12 = (v8 + v40) % v6;
            unint64_t v16 = &v10[v40];
            memcpy(&v9[4 * v12], v16, 4 * (v6 - v12));
            unsigned int v14 = &v16[v6 - v12];
            float v15 = v9;
            size_t v13 = 4 * v12;
          }
          else
          {
            memcpy(&v9[4 * v8], &a2[v7 * a3], 4 * v11);
            size_t v13 = 4 * v12;
            unsigned int v14 = &v10[v11];
            float v15 = v9;
          }
          memcpy(v15, v14, v13);
        }
        ++v7;
        a2 = v42;
      }
      while (v7 < *v5);
    }
    else
    {
      unint64_t v12 = v5[3];
    }
    unint64_t v17 = v5[4] + a3;
    void v5[3] = v12 % v6;
    v5[4] = v17;
    unint64_t v18 = *((void *)this + 5) + a3;
    *((void *)this + 5) = v18;
    unint64_t v19 = *((void *)this + 1);
    if (v18 >= v19)
    {
      unint64_t v20 = *((void *)this + 14);
      do
      {
        uint64_t v21 = *((void *)this + 13);
        unint64_t v22 = v20 + v19;
        unint64_t v23 = *(void *)(v21 + 16);
        unint64_t v24 = *(void *)(v21 + 32);
        if (v24 >= v23) {
          unint64_t v25 = v24 - v23;
        }
        else {
          unint64_t v25 = 0;
        }
        if (v25 > v20 || v20 >= v22 || v24 < v22 || v24 <= v20 || v25 >= v22)
        {
          uint64_t v30 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            unint64_t v44 = "readBuffer";
            __int16 v45 = 2050;
            unint64_t v46 = v20;
            __int16 v47 = 2050;
            unint64_t v48 = v20 + v19;
            __int16 v49 = 2050;
            unint64_t v50 = v25;
            __int16 v51 = 2050;
            unint64_t v52 = v24;
            _os_log_impl(&dword_1BA1A5000, v30, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
          }
        }
        else
        {
          uint64_t v31 = *((void *)this + 8);
          unint64_t v32 = v20 % v23;
          unint64_t v33 = **(char ***)(v21 + 48);
          uint64_t v34 = &v33[4 * v32];
          if (v32 >= v22 % v23)
          {
            unint64_t v37 = v23 - v32;
            memcpy(*((void **)this + 8), v34, 4 * (v23 - v32));
            unsigned int v36 = (void *)(v31 + 4 * v37);
            size_t v35 = 4 * (v19 - v37);
            uint64_t v34 = v33;
          }
          else
          {
            size_t v35 = 4 * v19;
            unsigned int v36 = (void *)*((void *)this + 8);
          }
          memcpy(v36, v34, v35);
        }
        vDSP_vmul(*((const float **)this + 8), 1, *((const float **)this + 7), 1, *((float **)this + 8), 1, *((void *)this + 1));
        vDSP_ctoz(*((const DSPComplex **)this + 8), 2, (const DSPSplitComplex *)((char *)this + 88), 1, *((void *)this + 1) >> 1);
        vDSP_fft_zrip(*((FFTSetup *)this + 10), (const DSPSplitComplex *)((char *)this + 88), 1, *((void *)this + 3), 1);
        vDSP_vsmul(*((const float **)this + 11), 1, (const float *)this + 8, *((float **)this + 11), 1, *((void *)this + 1) >> 1);
        vDSP_vsmul(*((const float **)this + 12), 1, (const float *)this + 8, *((float **)this + 12), 1, *((void *)this + 1) >> 1);
        vDSP_zvabs((const DSPSplitComplex *)((char *)this + 88), 1, *((float **)this + 9), 1, *((void *)this + 1) >> 1);
        unint64_t v19 = *((void *)this + 1);
        uint64_t v38 = *((void *)this + 2);
        unint64_t v39 = v38 - v19 + *((void *)this + 5);
        *((void *)this + 5) = v39;
        unint64_t v20 = v19 - v38 + *((void *)this + 14);
        *((void *)this + 14) = v20;
      }
      while (v39 >= v19);
    }
  }
}

uint64_t CSAudioSpectralMeterImpl::getFrequencyMagnitudesResult(CSAudioSpectralMeterImpl *this)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *((void *)this + 15);
  uint64_t v2 = *((void *)this + 16);
  if (v1 == v2)
  {
    unint64_t v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      unint64_t v18 = "getFrequencyMagnitudesResult";
      _os_log_fault_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_FAULT, "%s Output Frequency Band Limits are nil. setOutputFrequencyBands() must be called first.", (uint8_t *)&v17, 0xCu);
    }
    return 0;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = (v2 - v1) >> 2;
    uint64_t v8 = *((void *)this + 18);
    uint64_t result = (uint64_t)this + 144;
    uint64_t v7 = v8;
    uint64_t v9 = *(void *)(result + 24);
    unint64_t v10 = 1;
    do
    {
      unint64_t v11 = *(unsigned int *)(v1 + 4 * v4);
      float v12 = 0.0;
      if (v10 < v11)
      {
        unint64_t v13 = v11 - v10;
        unsigned int v14 = (float *)(*((void *)this + 9) + 4 * v10);
        do
        {
          float v15 = *v14++;
          float v12 = v12 + v15;
          --v13;
        }
        while (v13);
        unint64_t v10 = *(unsigned int *)(v1 + 4 * v4);
      }
      *(float *)(v9 + 4 * v4) = v12;
      *(float *)(v7 + 4 * v4) = (float)(v12 * (float)(1.0 - *((float *)this + 12)))
                              + (float)(*((float *)this + 12) * *(float *)(v7 + 4 * v4));
      ++v4;
    }
    while (v5 > v4);
  }
  return result;
}

void ___Z37AudioDataAnalysisManagerLibraryLoaderv_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = dlopen("/usr/lib/libAudioIssueDetector.dylib", 1);
  if (v0) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v2 = 136315138;
    int64_t v3 = dlerror();
    _os_log_error_impl(&dword_1BA1A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "dlerror : libAudioIssueDetector ADAM: %s", (uint8_t *)&v2, 0xCu);
  }
  uint64_t v0 = dlopen("/usr/local/lib/libAudioIssueDetector.dylib", 1);
  if (v0)
  {
LABEL_5:
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = dlsym(v0, "AudioDataAnalysisManagerCreate");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = dlsym(v0, "AudioDataAnalysisManagerDispose");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerReset");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = dlsym(v0, "AudioDataAnalysisManagerUpdateReportingSessions");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = dlsym(v0, "AudioDataAnalysisManagerCreateNodePCM");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerCreateNodeSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerRemoveNode");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = dlsym(v0, "AudioDataAnalysisManagerInitialize");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerIsSessionInitialized");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(void, void, void, void, void))dlsym(v0, "AudioDataAnalysisManagerProcessAudio");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerProcessSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerCreateNodeEnvSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerCreateNodeEnvSoundClass");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerProcessEnvSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerProcessEnvSoundClass");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerSetDeviceInfo");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerRegisterDeviceInfo");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerSetDeviceConnectionState");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerStartServices");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerConnectedWiredDeviceIsHeadphone");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerSetApplicationBundleID");
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v1 = dlerror();
    int v2 = 136315138;
    int64_t v3 = v1;
    _os_log_error_impl(&dword_1BA1A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "dlerror : libAudioIssueDetector ADAM: %s", (uint8_t *)&v2, 0xCu);
  }
}

void sub_1BA23625C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

void sub_1BA23645C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA23659C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSAdamSpeechMetricsManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA236758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

unint64_t isDNSAvailable()
{
  if (!nwi_state_copy()) {
    return 0;
  }
  if (nwi_state_get_first_ifstate() && (nwi_ifstate_get_flags() & 4) != 0)
  {
    unint64_t v0 = 1;
  }
  else if (nwi_state_get_first_ifstate())
  {
    unint64_t v0 = ((unint64_t)nwi_ifstate_get_flags() >> 2) & 1;
  }
  else
  {
    unint64_t v0 = 0;
  }
  nwi_state_release();
  return v0;
}

void sub_1BA239E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10997(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10998(uint64_t a1)
{
}

void sub_1BA23A550(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t _vtPhraseTypeDidChangeNotificationReceived(uint64_t a1, void *a2)
{
  return [a2 vtPhraseTypeDidChangeNotificationReceived];
}

void sub_1BA23BA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23BAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23BCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23BDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23BE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23C2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA23C9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BA23CC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23CE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1BA23CFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23D460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23D834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA23DBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA23DE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23DEA0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    uint64_t v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[CSKeywordAnalyzerQuasar _recognizeWavData:length:]";
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s recognizeWavData failed", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1BA23DE74);
  }
  _Unwind_Resume(a1);
}

void sub_1BA23E074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11385(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11386(uint64_t a1)
{
}

void sub_1BA23E29C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    uint64_t v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[CSKeywordAnalyzerQuasar endAudio]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s endAudio failed", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1BA23E270);
  }
  _Unwind_Resume(a1);
}

void sub_1BA23E928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23EADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA23F95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA240210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__11630(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11631(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__12122(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12123(uint64_t a1)
{
}

void sub_1BA2463AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA24693C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA247FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _jarvisTriggerModeDidChange(uint64_t a1, void *a2)
{
  return [a2 _notifyJarvisTriggerModeDidChanged];
}

uint64_t __Block_byref_object_copy__12656(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12657(uint64_t a1)
{
}

void sub_1BA24A9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12738(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12739(uint64_t a1)
{
}

void sub_1BA24B0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMSNMonitorEndExceptionSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)MediaSafetyNetLibrary();
  uint64_t result = dlsym(v2, "MSNMonitorEndException");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSNMonitorEndExceptionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaSafetyNetLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MediaSafetyNetLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MediaSafetyNetLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E62010D0;
    uint64_t v5 = 0;
    MediaSafetyNetLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = MediaSafetyNetLibraryCore_frameworkLibrary;
    if (MediaSafetyNetLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return MediaSafetyNetLibraryCore_frameworkLibrary;
}

uint64_t __MediaSafetyNetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaSafetyNetLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BA24B73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMSNMonitorBeginExceptionSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)MediaSafetyNetLibrary();
  uint64_t result = dlsym(v2, "MSNMonitorBeginException");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSNMonitorBeginExceptionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BA24D164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA24DDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _BTAccessoryEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return [a5 accessoryManager:a1 accessoryEvent:a2 device:a3 accessoryState:a4];
}

uint64_t _BTLocalDeviceStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 localDevice:a1 event:a2 result:a3];
}

uint64_t _BTServiceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return [a6 device:a1 serviceMask:a2 serviceEventType:a3 serviceSpecificEvent:a4 result:a5];
}

void _BTSessionEventCallback(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if ((a2 - 2) < 2)
  {
    id v8 = v7;
    [v7 _sessionTerminated:a1];
  }
  else if (a2 == 1)
  {
    id v8 = v7;
    [v7 _sessionDetached:a1];
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    id v8 = v7;
    [v7 _sessionAttached:a1 result:a3];
  }
  id v7 = v8;
LABEL_8:
}

void sub_1BA250CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13495(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13496(uint64_t a1)
{
}

uint64_t sub_1BA252318()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1BA252328()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1BA252338()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1BA252348()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1BA252358()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BA252368()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BA252378()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BA252388()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BA252398()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BA2523A8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BA2523B8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BA2523C8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BA2523D8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BA2523E8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BA2523F8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BA252408()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BA252418()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BA252428()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BA252438()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t ADPAssertionCreateWithDispatchQueue()
{
  return MEMORY[0x1F410A130]();
}

uint64_t ADPAssertionDestroy()
{
  return MEMORY[0x1F410A138]();
}

uint64_t ADPAssertionSetCancelHandler()
{
  return MEMORY[0x1F410A140]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x1F410AC88]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x1F410ACA0]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x1F410ACC8]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1F410ACE0]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1F410ACE8]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD58]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1F410ADD0]();
}

uint64_t AFPreferencesAssistantEnabled()
{
  return MEMORY[0x1F410ADF8]();
}

uint64_t AFPreferencesMobileUserSessionLanguage()
{
  return MEMORY[0x1F410AE08]();
}

uint64_t AFPreferencesStartAlertEnabled()
{
  return MEMORY[0x1F410AE18]();
}

uint64_t AFUserSupportDirectoryPath()
{
  return MEMORY[0x1F410AF80]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1F410B4E0](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x1F410B4E8](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1F410B508](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F410B530](inAudioConverter, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioHardwareGetProperty(AudioHardwarePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F40D6FD8](*(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x1F40D6FF8](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x1F40D7000](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, outDataSize);
}

uint64_t BNNSDataLayoutGetRank()
{
  return MEMORY[0x1F40D0F88]();
}

uint64_t BNNSGraphCompileFromFile_v2()
{
  return MEMORY[0x1F40D1178]();
}

uint64_t BNNSGraphCompileOptionsDestroy()
{
  return MEMORY[0x1F40D1188]();
}

uint64_t BNNSGraphCompileOptionsMakeDefault()
{
  return MEMORY[0x1F40D11B8]();
}

uint64_t BNNSGraphCompileOptionsSetFileWriteFSyncBarrier()
{
  return MEMORY[0x1F40D11C0]();
}

uint64_t BNNSGraphCompileOptionsSetGenerateDebugInfo()
{
  return MEMORY[0x1F40D11D0]();
}

uint64_t BNNSGraphCompileOptionsSetOptimizationPreference()
{
  return MEMORY[0x1F40D1200]();
}

uint64_t BNNSGraphCompileOptionsSetOutputPathWithPermissionsAndProtectionClass()
{
  return MEMORY[0x1F40D1218]();
}

uint64_t BNNSGraphCompileOptionsSetPredefinedOptimizations()
{
  return MEMORY[0x1F40D1220]();
}

uint64_t BNNSGraphCompileOptionsSetTargetSingleThread()
{
  return MEMORY[0x1F40D1238]();
}

uint64_t BNNSGraphCompileOptionsSetWeightsPathWithPermissions()
{
  return MEMORY[0x1F40D1250]();
}

uint64_t BNNSGraphContextDestroy_v2()
{
  return MEMORY[0x1F40D1258]();
}

uint64_t BNNSGraphContextExecute_v2()
{
  return MEMORY[0x1F40D1270]();
}

uint64_t BNNSGraphContextGetTensorDescriptor_v2()
{
  return MEMORY[0x1F40D1290]();
}

uint64_t BNNSGraphContextMake()
{
  return MEMORY[0x1F40D12A8]();
}

uint64_t BNNSGraphContextSetWeights()
{
  return MEMORY[0x1F40D1300]();
}

uint64_t BNNSGraphGetInputCount()
{
  return MEMORY[0x1F40D1360]();
}

uint64_t BNNSGraphGetInputNames_v2()
{
  return MEMORY[0x1F40D1368]();
}

uint64_t BNNSGraphGetOutputCount()
{
  return MEMORY[0x1F40D1378]();
}

uint64_t BNNSGraphGetOutputNames_v2()
{
  return MEMORY[0x1F40D1388]();
}

uint64_t BNNSGraphGetWorkspaceSize_v2()
{
  return MEMORY[0x1F40D1398]();
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x1F412F5D0]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger()
{
  return MEMORY[0x1F412F5E0]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x1F412F618]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1F412F680]();
}

uint64_t BTDeviceAddressToString()
{
  return MEMORY[0x1F412F688]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x1F412F6B0]();
}

uint64_t BTDeviceFromIdentifier()
{
  return MEMORY[0x1F412F6C0]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x1F412F6C8]();
}

uint64_t BTDeviceIsTemporaryPairedNotInContacts()
{
  return MEMORY[0x1F412F730]();
}

uint64_t BTDeviceSupportsHS()
{
  return MEMORY[0x1F412F738]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x1F412F768]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x1F412F788]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x1F412F7A0]();
}

uint64_t BTLocalDeviceGetSharingAddresses()
{
  return MEMORY[0x1F412F7D0]();
}

uint64_t BTLocalDeviceIsSharingEnabled()
{
  return MEMORY[0x1F412F7D8]();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return MEMORY[0x1F412F800]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x1F412F878]();
}

uint64_t BTServiceRemoveCallbacks()
{
  return MEMORY[0x1F412F880]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1F412F890]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x1F412F8A8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8C8]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096D0]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1F41098F8]();
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B6C0](inURL, *(void *)&inFileType, inStreamDesc, inChannelLayout, *(void *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1F410B6C8](inExtAudioFile);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B6E0](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1F410B6E8](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSeek(ExtAudioFileRef inExtAudioFile, SInt64 inFrameOffset)
{
  return MEMORY[0x1F410B6F0](inExtAudioFile, inFrameOffset);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F410B6F8](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1F410B710](inExtAudioFile, *(void *)&inNumberFrames, ioData);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F78](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x1F40E8FB8](*(void *)&theAssertion, theProperty, theValue);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1F4116EA8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1F4145DA8]();
}

uint64_t QuasarC_setComputeEngineCacheLookupHandler()
{
  return MEMORY[0x1F4117BE8]();
}

uint64_t SASCodecForString()
{
  return MEMORY[0x1F4149DD0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t _AFBackedUpPreferencesValueForKey()
{
  return MEMORY[0x1F410AF98]();
}

uint64_t _AFPreferencesValueForKey()
{
  return MEMORY[0x1F410AFF0]();
}

uint64_t _AFPreferencesValueForKeyWithContext()
{
  return MEMORY[0x1F410AFF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1F40C9BC8](a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_pthread_root_queue_create()
{
  return MEMORY[0x1F40CBB98]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t exclaves_audio_buffer_copyout()
{
  return MEMORY[0x1F40CBF80]();
}

uint64_t exclaves_audio_buffer_create()
{
  return MEMORY[0x1F40CBF88]();
}

uint64_t exclaves_sensor_create()
{
  return MEMORY[0x1F40CBF90]();
}

uint64_t exclaves_sensor_start()
{
  return MEMORY[0x1F40CBF98]();
}

uint64_t exclaves_sensor_status()
{
  return MEMORY[0x1F40CBFA0]();
}

uint64_t exclaves_sensor_stop()
{
  return MEMORY[0x1F40CBFA8]();
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint64_t nd_close()
{
  return MEMORY[0x1F41681F8]();
}

uint64_t nd_create()
{
  return MEMORY[0x1F4168200]();
}

uint64_t nd_error()
{
  return MEMORY[0x1F4168208]();
}

uint64_t nd_getoption()
{
  return MEMORY[0x1F4168210]();
}

uint64_t nd_getphraseresults()
{
  return MEMORY[0x1F4168218]();
}

uint64_t nd_getresults()
{
  return MEMORY[0x1F4168220]();
}

uint64_t nd_getsupervector()
{
  return MEMORY[0x1F4168228]();
}

uint64_t nd_initialize()
{
  return MEMORY[0x1F4168230]();
}

uint64_t nd_phrasecount()
{
  return MEMORY[0x1F4168238]();
}

uint64_t nde_create()
{
  return MEMORY[0x1F4168260]();
}

uint64_t nde_enable_multiinstance()
{
  return MEMORY[0x1F4168270]();
}

uint64_t nde_process_v2()
{
  return MEMORY[0x1F4168278]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40CD038](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x1F40CD098]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x1F40CD0A8]();
}

uint64_t nwi_state_get_first_ifstate()
{
  return MEMORY[0x1F40CD0B0]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x1F40CD0C0]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x1F40CD0D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD948](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

uint64_t remote_device_cancel()
{
  return MEMORY[0x1F4149688]();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return MEMORY[0x1F4149698]();
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x1F41496B8]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x1F41496C0]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x1F41496D8]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x1F4149720]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x1F4149748]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x1F4149750]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1980](__Previous, __Length, *(void *)&__Direction);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1F40D19F0](__Log2n, *(void *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_hamm_window(float *__C, vDSP_Length __N, int __Flag)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_svdiv(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfix16(const float *__A, vDSP_Stride __IA, __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vflt16(const __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vmma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvabs(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvcma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_zvma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1F40CEB90]();
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1F40CEB98]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x1F40CED10]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1F41497E8]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1F4149800]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x1F4149830]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1F4149860]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x1F4149868]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1F4149880]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}