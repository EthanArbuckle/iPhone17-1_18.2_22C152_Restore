uint64_t type metadata accessor for __RKEntityRemovalTrigger()
{
  return self;
}

uint64_t @objc __RKEntityPlacementTrigger.copy(with:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 16) = 0;
  *(unsigned char *)(result + 18) = 0;
  return result;
}

uint64_t __RKEntityRemovalTrigger.deinit()
{
  return v0;
}

uint64_t __RKEntityRemovalTrigger.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t __RKEntityInteraction.__allocating_init(trigger:action:accessibilityDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for __RKEntityInteraction();
  uint64_t v8 = swift_allocObject();
  __RKEntityInteraction.init(trigger:action:)(a1, a2);
  swift_beginAccess();
  *(void *)(v8 + 48) = a3;
  *(void *)(v8 + 56) = a4;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t __RKEntityInteraction.enabled.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t __RKEntityInteraction.enabled.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 40) = a1;
  return result;
}

uint64_t (*__RKEntityInteraction.enabled.modify())()
{
  return static __RKSimulationSceneCoordinator.shared.modify;
}

uint64_t key path setter for __RKEntityInteraction.accessibilityDescription : __RKEntityInteraction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t __RKEntityInteraction.accessibilityDescription.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t __RKEntityInteraction.accessibilityDescription.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t __RKEntityInteraction.__allocating_init(trigger:action:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  __RKEntityInteraction.init(trigger:action:)(a1, a2);
  return v4;
}

uint64_t type metadata accessor for __RKEntityInteraction()
{
  return self;
}

uint64_t __RKEntityInteraction.init(trigger:action:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a2;
  *(void *)(v2 + 32) = 0;
  v5 = (uint64_t *)(v2 + 24);
  *(unsigned char *)(v2 + 40) = 1;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22831E4E0;
  *(void *)(inited + 32) = a1;
  uint64_t v30 = inited;
  specialized Array._endMutation()();
  unint64_t v7 = v30;
  type metadata accessor for __RKEntityTriggerGroup();
  uint64_t v8 = swift_dynamicCastClass();
  swift_retain_n();
  if (v8)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    unint64_t v7 = *(void *)(v8 + 24);
    swift_bridgeObjectRetain();
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t result = swift_retain();
  }
  if (v7 >> 62) {
    goto LABEL_40;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
  {
LABEL_41:
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return v29;
  }
  while (2)
  {
    if (v10 >= 1)
    {
      swift_beginAccess();
      uint64_t v11 = 0;
      while (1)
      {
        if ((v7 & 0xC000000000000001) != 0) {
          MEMORY[0x22A689930](v11, v7);
        }
        else {
          swift_retain();
        }
        type metadata accessor for __RKEntityProximityTrigger();
        uint64_t v12 = swift_dynamicCastClass();
        if (!v12) {
          goto LABEL_31;
        }
        uint64_t v13 = v12;
        uint64_t v14 = swift_beginAccess();
        int v15 = *(unsigned __int8 *)(v13 + 36);
        if (v15 == 1) {
          break;
        }
        if (v15 != 2) {
          goto LABEL_31;
        }
        uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 432))(v14);
        swift_release();
        if (v16)
        {
          swift_beginAccess();
          *(unsigned char *)(v16 + 88) = 1;
          *(void *)(v29 + 32) = v16;
LABEL_31:
          swift_release();
        }
        if (v10 == ++v11) {
          goto LABEL_41;
        }
      }
      type metadata accessor for __RKEntityActionGroup();
      uint64_t v17 = swift_dynamicCastClass();
      if (!v17) {
        goto LABEL_31;
      }
      uint64_t v18 = v17;
      v19 = (uint64_t *)(v17 + 112);
      swift_beginAccess();
      unint64_t v20 = *(void *)(v18 + 112);
      if (v20 >> 62)
      {
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v28 == 2) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_retain();
        swift_retain();
        if (v21 == 2)
        {
LABEL_19:
          uint64_t v22 = *v19;
          if ((*v19 & 0xC000000000000001) != 0)
          {
            swift_bridgeObjectRetain();
            uint64_t v23 = MEMORY[0x22A689930](0, v22);
            swift_bridgeObjectRelease();
          }
          else
          {
            if (!*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_38:
              __break(1u);
LABEL_39:
              __break(1u);
LABEL_40:
              swift_bridgeObjectRetain();
              uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
              uint64_t result = swift_bridgeObjectRelease();
              if (!v10) {
                goto LABEL_41;
              }
              continue;
            }
            uint64_t v23 = *(void *)(v22 + 32);
            swift_retain();
          }
          uint64_t *v5 = v23;
          swift_release();
          uint64_t v24 = *v19;
          if ((*v19 & 0xC000000000000001) != 0)
          {
            swift_bridgeObjectRetain();
            uint64_t v25 = MEMORY[0x22A689930](1, v24);
            swift_bridgeObjectRelease();
          }
          else
          {
            if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL) {
              goto LABEL_38;
            }
            uint64_t v25 = *(void *)(v24 + 40);
            swift_retain();
          }
          swift_beginAccess();
          *(unsigned char *)(v25 + 88) = 1;
          swift_release();
          uint64_t v26 = *v19;
          if ((v26 & 0xC000000000000001) != 0)
          {
            swift_bridgeObjectRetain();
            uint64_t v27 = MEMORY[0x22A689930](1, v26);
          }
          else
          {
            if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL) {
              goto LABEL_39;
            }
            uint64_t v27 = *(void *)(v26 + 40);
            swift_bridgeObjectRetain();
            swift_retain();
          }
          swift_release_n();
          swift_release();
          swift_bridgeObjectRelease();
          *(void *)(v29 + 32) = v27;
          goto LABEL_31;
        }
      }
      swift_release();
      swift_release();
      goto LABEL_31;
    }
    break;
  }
  __break(1u);
  return result;
}

void __RKEntityInteraction.fire(context:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22831E4E0;
  swift_beginAccess();
  *(void *)(inited + 32) = *(void *)(v2 + 16);
  v19[0] = inited;
  specialized Array._endMutation()();
  type metadata accessor for __RKEntityTriggerGroup();
  uint64_t v6 = swift_dynamicCastClass();
  swift_retain();
  if (v6)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    unint64_t inited = *(void *)(v6 + 24);
    swift_bridgeObjectRetain();
    swift_release();
  }
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return;
  }
  if ((inited & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      MEMORY[0x22A689930](i, inited);
      type metadata accessor for __RKEntityProximityTrigger();
      uint64_t v9 = swift_dynamicCastClass();
      if (v9
        && (uint64_t v10 = (unsigned char *)v9, swift_beginAccess(), v10[36] - 1 <= 1)
        && (swift_beginAccess(), v10[38] == 1))
      {
        swift_beginAccess();
        v10[18] = 1;
        swift_unknownObjectRelease();
        swift_beginAccess();
        *(unsigned char *)(v3 + 18) = 1;
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    type metadata accessor for __RKEntityProximityTrigger();
    for (uint64_t j = 0; j != v7; ++j)
    {
      uint64_t v12 = swift_dynamicCastClass();
      if (v12)
      {
        uint64_t v13 = (unsigned char *)v12;
        swift_beginAccess();
        if (v13[36] - 1 <= 1)
        {
          swift_beginAccess();
          if (v13[38] == 1)
          {
            swift_beginAccess();
            v13[18] = 1;
            swift_beginAccess();
            *(unsigned char *)(v3 + 18) = 1;
          }
        }
      }
    }
  }
LABEL_21:
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 32) && (swift_beginAccess(), *(unsigned char *)(v3 + 18) == 1))
  {
    v19[0] = v3;
    v19[1] = v4;
    swift_retain();
    __RKEntityAction.performAction(with:)(v19);
    swift_release();
    *(unsigned char *)(v3 + 18) = 0;
  }
  else
  {
    swift_beginAccess();
    v18[0] = v3;
    v18[1] = v4;
    swift_retain();
    __RKEntityAction.performAction(with:)(v18);
    swift_release();
  }
  uint64_t v14 = (objc_class *)type metadata accessor for RKEntityInteractionAccessibilityWrapper();
  int v15 = (char *)objc_allocWithZone(v14);
  *(void *)&v15[OBJC_IVAR____TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper_interaction] = v2;
  v17.receiver = v15;
  v17.super_class = v14;
  swift_retain();
  id v16 = objc_msgSendSuper2(&v17, sel_init);
  objc_msgSend(v16, sel_didFire);
}

uint64_t type metadata accessor for RKEntityInteractionAccessibilityWrapper()
{
  return self;
}

uint64_t __RKEntityInteraction.description.getter()
{
  strcpy((char *)v10, "Interaction: ");
  HIWORD(v10[1]) = -4864;
  swift_beginAccess();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + 16) + 192);
  uint64_t v2 = swift_retain();
  v3._countAndFlagsBits = v1(v2);
  String.append(_:)(v3);
  swift_release();
  swift_bridgeObjectRelease();
  v10[3] = 32;
  v10[4] = 0xE100000000000000;
  swift_beginAccess();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + 24) + 440);
  uint64_t v5 = swift_retain();
  v6._countAndFlagsBits = v4(v5);
  String.append(_:)(v6);
  swift_release();
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 10;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = 32;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10[0];
}

uint64_t __RKEntityInteraction.clone(matching:newEntity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void **)(v2 + 16);
  swift_beginAccess();
  Swift::String v6 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)(v2 + 16) + 200);
  swift_retain();
  uint64_t v7 = v6(a1, a2);
  swift_release();
  swift_beginAccess();
  Swift::String v8 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)(v2 + 24) + 472);
  swift_retain();
  uint64_t v9 = v8(a1, a2);
  char v11 = v10;
  swift_release();
  if (!v7)
  {
    if (v9)
    {
      if ((v11 & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v13 = *v5;
      swift_retain_n();
      objc_msgSend(v13, sel_copyWithZone_, 0);
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      type metadata accessor for __RKEntityTrigger();
      if (swift_dynamicCast())
      {
        type metadata accessor for __RKEntityInteraction();
        uint64_t v12 = swift_allocObject();
        __RKEntityInteraction.init(trigger:action:)(v15, v9);
        swift_release_n();
        return v12;
      }
      swift_release_n();
    }
    return 0;
  }
  if (!v9)
  {
LABEL_8:
    swift_release();
    return 0;
  }
  type metadata accessor for __RKEntityInteraction();
  uint64_t v12 = swift_allocObject();
  __RKEntityInteraction.init(trigger:action:)(v7, v9);
  return v12;
}

uint64_t __RKEntityInteraction.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t __RKEntityInteraction.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance __RKEntityInteraction()
{
  return __RKEntityInteraction.description.getter();
}

uint64_t sub_2282E7494@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_2282E74E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_retain();
}

uint64_t sub_2282E7534@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 40);
  return result;
}

uint64_t sub_2282E757C(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 40) = v2;
  return result;
}

uint64_t sub_2282E75C0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for __RKEntityInteraction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for __RKEntityInteraction);
}

uint64_t dispatch thunk of __RKEntityInteraction.trigger.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of __RKEntityInteraction.action.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of __RKEntityInteraction.enabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of __RKEntityInteraction.enabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of __RKEntityInteraction.enabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of __RKEntityInteraction.accessibilityDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of __RKEntityInteraction.accessibilityDescription.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of __RKEntityInteraction.accessibilityDescription.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of __RKEntityInteraction.__allocating_init(trigger:action:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of __RKEntityInteraction.fire(context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of __RKEntityInteraction.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of __RKEntityInteraction.clone(matching:newEntity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

id RKEntityInteractionAccessibilityWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RKEntityInteractionAccessibilityWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t InteractionsLogger.init<A>(_:_:)@<X0>(uint64_t a1@<X3>, void *a2@<X8>)
{
  v3._countAndFlagsBits = opaqueDescriptionOf<A>(_:)(a1);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8285;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8250;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  uint64_t result = swift_unknownObjectRelease();
  *a2 = 91;
  a2[1] = 0xE100000000000000;
  return result;
}

void InteractionsLogger.debug(_:)(uint64_t (*a1)(void), uint64_t a2)
{
}

void InteractionsLogger.info(_:)(uint64_t (*a1)(void), uint64_t a2)
{
}

void InteractionsLogger.debug(_:)(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(uint64_t (*)(void), uint64_t))
{
  uint64_t v5 = v3[1];
  v7[0] = *v3;
  v7[1] = v5;
  os_log_type_t v6 = a3(a1, a2);
  specialized InteractionsLogger.log(_:_:)(v6, v7, a1);
}

void InteractionsLogger.error(_:)(uint64_t (*a1)(void), uint64_t a2)
{
}

uint64_t opaqueDescriptionOf<A>(_:)(uint64_t a1)
{
  if (!a1) {
    return 7104878;
  }
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

void InteractionsLogger.init(_:)(uint64_t *a1@<X8>)
{
  uint64_t v4 = StaticString.description.getter();
  uint64_t v5 = v2;
  v3._countAndFlagsBits = 8250;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  *a1 = v4;
  a1[1] = v5;
}

Swift::Void __swiftcall InteractionsLogger.dumpStack()()
{
  unint64_t v1 = v0[1];
  uint64_t v24 = *v0;
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  uint64_t v2 = static ForceEffectLogger.logger;
  if (interactionsLoggingEnabled)
  {
    Swift::String v3 = (void **)swift_slowAlloc();
    int v4 = backtrace(v3, 256);
    uint64_t v23 = backtrace_symbols(v3, v4);
    if (v23)
    {
      uint64_t v25 = v24;
      unint64_t v26 = v1;
      os_log_type_t v5 = static os_log_type_t.debug.getter();
      specialized InteractionsLogger.log(_:_:)(v5, &v25);
      if (v4 < 0)
      {
        __break(1u);
        goto LABEL_25;
      }
      if (v4)
      {
        uint64_t v6 = v4;
        unint64_t v7 = 0x2681BB000uLL;
        Swift::String v8 = v23;
        do
        {
          if (*v8++)
          {
            uint64_t v10 = String.init(cString:)();
            unint64_t v12 = v11;
          }
          else
          {
            unint64_t v12 = 0xE300000000000000;
            uint64_t v10 = 7104878;
          }
          os_log_type_t v13 = static os_log_type_t.debug.getter();
          if (*((unsigned char *)v2 + 304) == 1)
          {
            os_log_type_t v14 = v13;
            uint64_t v15 = *(void *)(v7 + 2744);
            swift_bridgeObjectRetain();
            if (v15 != -1) {
              swift_once();
            }
            uint64_t v16 = type metadata accessor for Logger();
            __swift_project_value_buffer(v16, (uint64_t)interactionsLogger);
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            objc_super v17 = Logger.logObject.getter();
            if (os_log_type_enabled(v17, v14))
            {
              uint64_t v18 = swift_slowAlloc();
              uint64_t v19 = swift_slowAlloc();
              uint64_t v25 = v19;
              *(_DWORD *)uint64_t v18 = 136315394;
              swift_bridgeObjectRetain();
              *(void *)(v18 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v1, &v25);
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v18 + 12) = 2080;
              swift_bridgeObjectRetain();
              *(void *)(v18 + 14) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v25);
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_227DD2000, v17, v14, "%s%s", (uint8_t *)v18, 0x16u);
              swift_arrayDestroy();
              uint64_t v20 = v19;
              uint64_t v2 = static ForceEffectLogger.logger;
              MEMORY[0x22A696500](v20, -1, -1);
              uint64_t v21 = v18;
              unint64_t v7 = 0x2681BB000;
              MEMORY[0x22A696500](v21, -1, -1);
              swift_bridgeObjectRelease();
            }
            else
            {

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          --v6;
        }
        while (v6);
      }
      uint64_t v25 = v24;
      unint64_t v26 = v1;
      os_log_type_t v22 = static os_log_type_t.debug.getter();
      specialized InteractionsLogger.log(_:_:)(v22, &v25);
      free(v23);
    }
LABEL_25:
    JUMPOUT(0x22A696500);
  }
}

void one-time initialization function for interactionsLoggingEnabled()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  unint64_t v1 = (void *)MEMORY[0x22A688A50](0xD00000000000001CLL, 0x8000000228361B70);
  unsigned __int8 v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  interactionsLoggingEnabled = v2;
}

uint64_t one-time initialization function for interactionsLogger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, interactionsLogger);
  __swift_project_value_buffer(v0, (uint64_t)interactionsLogger);
  return Logger.init(subsystem:category:)();
}

void specialized InteractionsLogger.log(_:_:)(os_log_type_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x69796F7274736544, 0xEA0000000000676ELL, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x64657461657243, 0xE700000000000000, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x8000000228362480, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001CLL, 0x80000002283624A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ELL, 0x80000002283624E0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x80000002283624C0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001CLL, 0x8000000228362510, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x2928706F7473, 0xE600000000000000, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000033, 0x8000000228362420, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000019, 0x8000000228362460, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x80000002283623F0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x8000000228362340, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000047, 0x8000000228362360, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003CLL, 0x80000002283623B0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000042, 0x8000000228362150, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x6920797469746E65, 0xED00006C696E2073, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ELL, 0x80000002283621A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001CLL, 0x80000002283621E0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000017, 0x80000002283621C0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x8000000228362200, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x8000000228362230, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000036, 0x8000000228362250, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000034, 0x8000000228362300, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000030, 0x8000000228361E30, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002DLL, 0x8000000228361DD0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000024, 0x8000000228361E00, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000016, 0x8000000228361E90, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x8000000228361E70, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002CLL, 0x8000000228362120, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000030, 0x80000002283620E0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000025, 0x8000000228361CF0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000033, 0x8000000228361CB0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000031, 0x8000000228361B90, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003DLL, 0x8000000228361BD0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000043, 0x8000000228361C10, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000004BLL, 0x8000000228361C60, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002DLL, 0x8000000228362530, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000036, 0x8000000228361290, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000036, 0x8000000228361370, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000004BLL, 0x80000002283613B0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000023, 0x8000000228361400, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000037, 0x80000002283614A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000004CLL, 0x8000000228361450, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x8000000228361620, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001CLL, 0x80000002283614E0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000023, 0x8000000228361500, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000023, 0x8000000228361530, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001CLL, 0x8000000228361560, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000022, 0x8000000228361580, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ELL, 0x80000002283615B0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x8000000228361600, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x80000002283615D0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ALL, 0x8000000228361640, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x8000000228361660, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000013, 0x8000000228361680, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000034, 0x8000000228361860, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000011, 0x80000002283616A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x80000002283616C0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000032, 0x80000002283618A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002CLL, 0x80000002283618E0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x8000000228361910, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000024, 0x8000000228361940, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000046, 0x80000002283619F0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x80000002283611D0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000050, 0x8000000228361200, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x8000000228361260, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000017, 0x8000000228360F50, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001BLL, 0x8000000228361130, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000030, 0x8000000228360F70, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000057, 0x8000000228360FF0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003ELL, 0x8000000228360FB0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x80000002283610A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000045, 0x8000000228361050, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000005BLL, 0x80000002283610D0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000035, 0x8000000228361150, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000030, 0x8000000228361190, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000055, 0x8000000228361EB0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003FLL, 0x8000000228361F10, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003CLL, 0x8000000228361FB0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000005BLL, 0x8000000228361F50, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000004ELL, 0x8000000228361FF0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000041, 0x8000000228362040, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000046, 0x8000000228362090, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000028, 0x8000000228362560, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002CLL, 0x80000002283625C0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, 0x8000000228362590, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000021, 0x80000002283625F0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000038, 0x8000000228362620, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000031, 0x8000000228362660, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x80000002283626A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x80000002283626D0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000028, 0x8000000228362700, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000023, 0x8000000228362730, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000035, 0x8000000228362760, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003CLL, 0x8000000228361970, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000019, 0x80000002283619D0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x8000000228361DA0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000045, 0x80000002283612F0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ALL, 0x8000000228362860, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000023, 0x8000000228362880, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ALL, 0x80000002283628B0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000048, 0x80000002283627A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000067, 0x80000002283627F0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x8000000228361340, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, 0x8000000228362970, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000033, 0x80000002283628E0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000026, 0x8000000228362920, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000013, 0x8000000228362A00, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000012, 0x8000000228362950, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x6E696E7275746552, 0xEE00657572742067, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000012, 0x8000000228361B10, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000044, 0x8000000228361AC0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000003BLL, 0x8000000228361B30, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x8000000228362290, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000048, 0x80000002283622B0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000030, 0x8000000228362A20, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001FLL, 0x8000000228362A60, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000023, 0x8000000228362A80, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000039, 0x80000002283629C0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000019, 0x80000002283629A0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x7265746E45, 0xE500000000000000, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x657661654CLL, 0xE500000000000000, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ALL, 0x80000002283612D0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x8000000228361D40, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, 0x8000000228361D70, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x8000000228361D20, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x2D2D2D2D2D2D2D2DLL, 0xEA00000000002D2DLL, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x8000000228361A90, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x8000000228361A40, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000024, 0x8000000228361A60, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x676E697461647055, 0xED00006564616620, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001BLL, 0x80000002283619B0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000010, 0x8000000228361430, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x8000000228361840, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000037, 0x8000000228361800, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000038, 0x80000002283617C0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000040, 0x80000002283616F0, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000031, 0x8000000228361740, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = a1;
    if (os_log_type_enabled(v6, a1))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000037, 0x8000000228361780, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_227DD2000, v6, v7, "%s%s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v9, -1, -1);
      MEMORY[0x22A696500](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void InteractionsLogger.log(_:_:)(os_log_type_t a1, uint64_t (*a2)(void))
{
  uint64_t v6 = *v2;
  unint64_t v5 = v2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    uint64_t v7 = a2();
    unint64_t v9 = v8;
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    unint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = a1;
    if (os_log_type_enabled(v11, a1))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v9, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_227DD2000, v11, v12, "%s%s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v14, -1, -1);
      MEMORY[0x22A696500](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

void InteractionsLogger.default(_:)(uint64_t (*a1)(void), uint64_t a2)
{
}

void InteractionsLogger.fault(_:)(uint64_t (*a1)(void), uint64_t a2)
{
}

void specialized InteractionsLogger.log(_:_:)(os_log_type_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = *a2;
  unint64_t v5 = a2[1];
  if (one-time initialization token for interactionsLoggingEnabled != -1) {
    swift_once();
  }
  if (interactionsLoggingEnabled)
  {
    uint64_t v7 = a3();
    unint64_t v9 = v8;
    if (one-time initialization token for interactionsLogger != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)interactionsLogger);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    unint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = a1;
    if (os_log_type_enabled(v11, a1))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v9, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_227DD2000, v11, v12, "%s%s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v14, -1, -1);
      MEMORY[0x22A696500](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

ValueMetadata *type metadata accessor for InteractionsLogger()
{
  return &type metadata for InteractionsLogger;
}

uint64_t static ImageHelper.enumerateImageFilesInFolderShallowly(_:sorted:)(uint64_t a1, int a2)
{
  int v101 = a2;
  v126[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL, Date));
  uint64_t v115 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v113 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v112 = (char *)&v100 - v9;
  MEMORY[0x270FA5388](v10);
  v114 = (char *)&v100 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v12 - 8);
  v118 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v123 = *(void *)(v14 - 8);
  v124 = (void *)v14;
  MEMORY[0x270FA5388](v14);
  v116 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v120 = (char *)&v100 - v17;
  MEMORY[0x270FA5388](v18);
  v121 = (char *)&v100 - v19;
  MEMORY[0x270FA5388](v20);
  v104 = (char *)&v100 - v21;
  MEMORY[0x270FA5388](v22);
  v106 = (char *)&v100 - v23;
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  URL._bridgeToObjectiveC()(v25);
  uint64_t v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NSURLResourceKey>);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_22830EC60;
  uint64_t v29 = (void *)*MEMORY[0x263EFF610];
  *(void *)(v28 + 32) = *MEMORY[0x263EFF610];
  type metadata accessor for NSURLResourceKey(0);
  id v30 = v29;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v126[0] = 0;
  id v103 = v24;
  id v32 = objc_msgSend(v24, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v27, isa, 0, v126);

  v33 = v126[0];
  if (!v32)
  {
    v50 = v126[0];
    v34 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger == -1)
    {
LABEL_18:
      uint64_t v51 = type metadata accessor for Logger();
      __swift_project_value_buffer(v51, (uint64_t)logger);
      v52 = v34;
      v53 = v34;
      v54 = Logger.logObject.getter();
      os_log_type_t v55 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        v57 = (void *)swift_slowAlloc();
        uint64_t v125 = (uint64_t)v34;
        v126[0] = v57;
        *(_DWORD *)v56 = 136446210;
        unint64_t v3 = v56 + 4;
        v58 = v34;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        uint64_t v59 = String.init<A>(describing:)();
        uint64_t v125 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v60, (uint64_t *)v126);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_227DD2000, v54, v55, "contentsOfDirectory error: %{public}s", v56, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A696500](v57, -1, -1);
        MEMORY[0x22A696500](v56, -1, -1);
      }
      else
      {
      }
      lazy protocol witness table accessor for type ImageHelper.LoadError and conformance ImageHelper.LoadError();
      swift_allocError();
      *(void *)uint64_t v80 = v34;
      *(void *)(v80 + 8) = 0;
      *(unsigned char *)(v80 + 16) = 0;
      swift_willThrow();

      return (uint64_t)v3;
    }
LABEL_50:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v102 = v2;
  v34 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v35 = v33;

  v126[0] = (void *)MEMORY[0x263F8EE78];
  v117 = v34;
  v110 = (void (**)(uint64_t, void *))v34[2];
  v111 = v6;
  if (v110)
  {
    unint64_t v36 = 0;
    v109 = (void *)(v123 + 16);
    uint64_t v107 = v123 + 48;
    uint64_t v119 = v123 + 32;
    v105 = (void (**)(char *, void *))(v123 + 8);
    uint64_t v108 = v123 + 56;
    unint64_t v100 = (v123 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v37 = v120;
    uint64_t v38 = (uint64_t)v118;
    v39 = v106;
    unint64_t v3 = v124;
    while (v36 < v117[2])
    {
      uint64_t v40 = v123;
      unint64_t v41 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
      uint64_t v42 = *(void *)(v123 + 72);
      (*(void (**)(uint64_t, unint64_t, void *))(v123 + 16))(v38, (unint64_t)v117 + v41 + v42 * v36, v3);
      v43 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v40 + 56);
      v43(v38, 0, 1, v3);
      if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v40 + 48))(v38, 1, v3) == 1) {
        goto LABEL_22;
      }
      v34 = *(void **)v119;
      (*(void (**)(char *, uint64_t, void *))v119)(v39, v38, v124);
      v44 = v39;
      if ((URL.isFileURL.getter() & 1) == 0) {
        goto LABEL_4;
      }
      URL.pathExtension.getter();
      Swift::String v45 = String.lowercased()();
      swift_bridgeObjectRelease();
      if (one-time initialization token for validImageSuffixes != -1) {
        swift_once();
      }
      char v46 = specialized Set.contains(_:)(v45._countAndFlagsBits, (uint64_t)v45._object, static ImageHelper.validImageSuffixes);
      swift_bridgeObjectRelease();
      v37 = v120;
      v44 = v106;
      if (v46)
      {
        ((void (*)(char *, char *, void *))v34)(v104, v106, v124);
        v47 = v126[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v47[2] + 1, 1);
          v47 = v126[0];
        }
        unint64_t v49 = v47[2];
        unint64_t v48 = v47[3];
        if (v49 >= v48 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
          v47 = v126[0];
        }
        v47[2] = v49 + 1;
        ((void (*)(char *, char *, void *))v34)((char *)v47 + v41 + v49 * v42, v104, v124);
        v126[0] = v47;
        v37 = v120;
        v39 = v106;
      }
      else
      {
LABEL_4:
        (*v105)(v44, v124);
        v39 = v44;
      }
      ++v36;
      uint64_t v38 = (uint64_t)v118;
      if (v110 == (void (**)(uint64_t, void *))v36)
      {
        v43((uint64_t)v118, 1, 1, v124);
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_50;
  }
  v37 = v120;
  uint64_t v38 = (uint64_t)v118;
  (*(void (**)(char *, uint64_t, uint64_t, void *))(v123 + 56))(v118, 1, 1, v124);
LABEL_22:
  swift_bridgeObjectRelease();
  outlined destroy of BodyTrackingComponent?(v38, &demangling cache variable for type metadata for URL?);
  unint64_t v3 = v126[0];
  if ((v101 & 1) == 0) {
    goto LABEL_46;
  }
  int64_t v61 = v126[0][2];
  if (v61)
  {
    v126[0] = (void *)MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v61, 0);
    v62 = v124;
    v63 = *(char **)(v123 + 16);
    v64 = (char *)v3 + ((*(unsigned __int8 *)(v123 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80));
    v117 = *(void **)(v123 + 72);
    v118 = v63;
    uint64_t v119 = v123 + 16;
    v109 = v3;
    v110 = (void (**)(uint64_t, void *))(v123 + 8);
    uint64_t v65 = (uint64_t)v114;
    v66 = v63;
    do
    {
      uint64_t v67 = (uint64_t)v121;
      ((void (*)(char *, char *, void *))v66)(v121, v64, v62);
      uint64_t v68 = v65 + *(int *)(v122 + 48);
      ((void (*)(uint64_t, uint64_t, void *))v66)(v65, v67, v62);
      uint64_t v69 = (uint64_t)v111;
      static ImageHelper.extractDateTimeOriginal(url:)(v67, (uint64_t)v111);
      ((void (*)(char *, uint64_t, void *))v66)(v37, v67, v62);
      uint64_t v70 = (uint64_t)v37;
      uint64_t v71 = type metadata accessor for Date();
      uint64_t v72 = *(void *)(v71 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v69, 1, v71) == 1)
      {
        static ImageHelper.creationDate(for:)(v70, v68);
        outlined destroy of BodyTrackingComponent?(v69, &demangling cache variable for type metadata for Date?);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 32))(v68, v69, v71);
      }
      uint64_t v73 = v70;
      v74 = (void (*)(char *, void *))*v110;
      v75 = v124;
      (*v110)(v73, v124);
      v74(v121, v75);
      v76 = v126[0];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v65 = (uint64_t)v114;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v76[2] + 1, 1);
        v76 = v126[0];
      }
      unint64_t v79 = v76[2];
      unint64_t v78 = v76[3];
      if (v79 >= v78 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v78 > 1, v79 + 1, 1);
        v76 = v126[0];
      }
      v76[2] = v79 + 1;
      outlined init with take of (URL, Date)(v65, (uint64_t)v76+ ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80))+ *(void *)(v115 + 72) * v79);
      v64 = (char *)v117 + (void)v64;
      --v61;
      v37 = v120;
    }
    while (v61);
    swift_release();
  }
  else
  {
    swift_release();
    v76 = (void *)MEMORY[0x263F8EE78];
  }
  v126[0] = v76;
  swift_bridgeObjectRetain();
  uint64_t v81 = v102;
  specialized MutableCollection<>.sort(by:)(v126);
  if (!v81)
  {
    swift_bridgeObjectRelease();
    v82 = v126[0];
    int64_t v83 = v126[0][2];
    if (!v83)
    {
      swift_release();

      return MEMORY[0x263F8EE78];
    }
    uint64_t v102 = 0;
    v126[0] = (void *)MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v83, 0);
    v84 = v116;
    uint64_t v85 = (uint64_t)v82 + ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80));
    uint64_t v119 = *(void *)(v115 + 72);
    v117 = v82;
    v118 = (char *)(v123 + 16);
    v86 = (void (**)(void, void, void))(v123 + 32);
    uint64_t v87 = (uint64_t)v112;
    do
    {
      v121 = (char *)v83;
      outlined init with copy of (Int, URL)(v85, v87, &demangling cache variable for type metadata for (URL, Date));
      uint64_t v88 = *(int *)(v122 + 48);
      v89 = v86;
      v90 = v124;
      v91 = v113;
      v92 = &v113[v88];
      v120 = (char *)(v87 + v88);
      (*(void (**)(char *, uint64_t, void *))v118)(v113, v87, v124);
      uint64_t v93 = type metadata accessor for Date();
      uint64_t v94 = *(void *)(v93 - 8);
      (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v92, v120, v93);
      v95 = v90;
      v86 = v89;
      v96 = (void (*)(char *, char *, void *))*v89;
      v96(v84, v91, v95);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v92, v93);
      outlined destroy of BodyTrackingComponent?(v87, &demangling cache variable for type metadata for (URL, Date));
      unint64_t v3 = v126[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1);
        unint64_t v3 = v126[0];
      }
      unint64_t v98 = v3[2];
      unint64_t v97 = v3[3];
      v84 = v116;
      if (v98 >= v97 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v97 > 1, v98 + 1, 1);
        v84 = v116;
        unint64_t v3 = v126[0];
      }
      v3[2] = v98 + 1;
      v96((char *)v3+ ((*(unsigned __int8 *)(v123 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80))+ *(void *)(v123 + 72) * v98, v84, v124);
      v126[0] = v3;
      v85 += v119;
      int64_t v83 = (int64_t)(v121 - 1);
    }
    while (v121 != (char *)1);
    swift_release();
LABEL_46:

    return (uint64_t)v3;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t one-time initialization function for validImageSuffixes()
{
  Swift::Int v0 = specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for validImageSuffixes);
  uint64_t result = swift_arrayDestroy();
  static ImageHelper.validImageSuffixes = v0;
  return result;
}

uint64_t static ImageHelper.extractDateTimeOriginal(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (NSURL *)((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (char *)((char *)&v29 - (char *)v10);
  URL._bridgeToObjectiveC()(v10);
  CFURLRef v13 = v12;
  uint64_t v14 = CGImageSourceCreateWithURL(v12, 0);

  if (v14)
  {
    unint64_t v15 = specialized static ImageHelper.createMetadataFromImageSource(imageSource:index:url:)(v14, 0, a1);
    type metadata accessor for PhotogrammetryMetadataHelper();
    *(void *)(swift_initStackObject() + 16) = v15;
    PhotogrammetryMetadataHelper.dateTimeOriginal.getter(v11);
    swift_release();

    uint64_t v16 = type metadata accessor for Date();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, v16) == 1)
    {
      outlined destroy of BodyTrackingComponent?((uint64_t)v11, &demangling cache variable for type metadata for Date?);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a2, 1, 1, v16);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a2, v11, v16);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a2, 0, 1, v16);
    }
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)logger);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v29 = a2;
      uint64_t v24 = v23;
      *(_DWORD *)uint64_t v22 = 141558274;
      uint64_t v30 = 1752392040;
      uint64_t v31 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v25 = URL.path.getter();
      uint64_t v30 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      _os_log_impl(&dword_227DD2000, v20, v21, "Error in CGImageSourceCreateWithURL for %{mask.hash}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      uint64_t v27 = v24;
      a2 = v29;
      MEMORY[0x22A696500](v27, -1, -1);
      MEMORY[0x22A696500](v22, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    uint64_t v28 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a2, 1, 1, v28);
  }
}

uint64_t static ImageHelper.creationDate(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v33 = type metadata accessor for URL();
  uint64_t v35 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  v34 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URLResourceValues();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  CFURLRef v13 = (char *)&v33 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NSURLResourceKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22830EC60;
  unint64_t v15 = (void *)*MEMORY[0x263EFF610];
  *(void *)(inited + 32) = *MEMORY[0x263EFF610];
  id v16 = v15;
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating();
  type metadata accessor for NSURLResourceKey(0);
  swift_arrayDestroy();
  uint64_t v17 = a1;
  URL.resourceValues(forKeys:)();
  swift_bridgeObjectRelease();
  URLResourceValues.creationDate.getter();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  outlined init with copy of (Int, URL)((uint64_t)v13, (uint64_t)v10, &demangling cache variable for type metadata for Date?);
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  int v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v10, 1, v18);
  uint64_t v22 = v34;
  uint64_t v21 = v35;
  if (v20 == 1)
  {
    outlined destroy of BodyTrackingComponent?((uint64_t)v10, &demangling cache variable for type metadata for Date?);
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    __swift_project_value_buffer(v23, (uint64_t)logger);
    uint64_t v24 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v22, v17, v33);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = v22;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 141558274;
      uint64_t v37 = 1752392040;
      uint64_t v38 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v28 + 12) = 2080;
      uint64_t v30 = URL.path.getter();
      uint64_t v37 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v27, v33);
      _os_log_impl(&dword_227DD2000, v25, v26, "creation data is nil for: \"%{mask.hash}s\".", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v29, -1, -1);
      MEMORY[0x22A696500](v28, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v24);
    }

    static Date.distantPast.getter();
    return outlined destroy of BodyTrackingComponent?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    outlined destroy of BodyTrackingComponent?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(v36, v10, v18);
  }
}

uint64_t type metadata accessor for ImageHelper()
{
  return self;
}

void specialized MutableCollection<>.sort(by:)(void **a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL, Date))
                 - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v3);
  }
  uint64_t v4 = v3[2];
  v5[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v5[1] = v4;
  specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v5);
  *a1 = v3;
}

void specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL, Date));
  uint64_t v4 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  uint64_t v127 = (uint64_t)&v122 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v137 = (uint64_t)&v122 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (uint64_t)&v122 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v132 = (uint64_t)&v122 - v11;
  Swift::Int v12 = a1[1];
  Swift::Int v13 = _minimumMergeRunLength(_:)(v12);
  if (v13 >= v12)
  {
    if (v12 < 0) {
      goto LABEL_141;
    }
    if (v12) {
      specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v12, 1, a1);
    }
    return;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_149;
  }
  uint64_t v130 = v4;
  v135 = a1;
  Swift::Int v123 = v13;
  if (v12 < 2)
  {
    uint64_t v18 = (char *)MEMORY[0x263F8EE78];
    unint64_t v129 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v122 = MEMORY[0x263F8EE78];
    if (v12 != 1)
    {
      unint64_t v20 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_107:
      uint64_t v115 = v18;
      if (v20 >= 2)
      {
        uint64_t v116 = *v135;
        do
        {
          unint64_t v117 = v20 - 2;
          if (v20 < 2) {
            goto LABEL_136;
          }
          if (!v116) {
            goto LABEL_148;
          }
          uint64_t v118 = *(void *)&v115[16 * v117 + 32];
          uint64_t v119 = *(void *)&v115[16 * v20 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v116 + *(void *)(v130 + 72) * v118, v116 + *(void *)(v130 + 72) * *(void *)&v115[16 * v20 + 16], v116 + *(void *)(v130 + 72) * v119, v129);
          if (v2) {
            break;
          }
          if (v119 < v118) {
            goto LABEL_137;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v115 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v115);
          }
          if (v117 >= *((void *)v115 + 2)) {
            goto LABEL_138;
          }
          v120 = &v115[16 * v117 + 32];
          *(void *)v120 = v118;
          *((void *)v120 + 1) = v119;
          unint64_t v121 = *((void *)v115 + 2);
          if (v20 > v121) {
            goto LABEL_139;
          }
          memmove(&v115[16 * v20 + 16], &v115[16 * v20 + 32], 16 * (v121 - v20));
          *((void *)v115 + 2) = v121 - 1;
          unint64_t v20 = v121 - 1;
        }
        while (v121 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(void *)(v122 + 16) = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v15 = v14 >> 1;
    uint64_t v16 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v122 = v16;
    unint64_t v129 = v16 + ((v17 + 32) & ~v17);
  }
  Swift::Int v19 = 0;
  uint64_t v18 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    Swift::Int v21 = v19;
    Swift::Int v22 = v19 + 1;
    Swift::Int v128 = v19;
    if (v19 + 1 >= v12)
    {
      Swift::Int v31 = v19 + 1;
      break;
    }
    uint64_t v125 = v2;
    uint64_t v23 = *v135;
    Swift::Int v24 = *(void *)(v130 + 72);
    uint64_t v25 = v132;
    outlined init with copy of (Int, URL)(*v135 + v24 * v22, v132, &demangling cache variable for type metadata for (URL, Date));
    Swift::Int v134 = v12;
    uint64_t v26 = v133;
    outlined init with copy of (Int, URL)(v23 + v24 * v21, v133, &demangling cache variable for type metadata for (URL, Date));
    int v27 = static Date.< infix(_:_:)();
    uint64_t v28 = v26;
    Swift::Int v12 = v134;
    outlined destroy of BodyTrackingComponent?(v28, &demangling cache variable for type metadata for (URL, Date));
    uint64_t v29 = v25;
    uint64_t v30 = v23;
    outlined destroy of BodyTrackingComponent?(v29, &demangling cache variable for type metadata for (URL, Date));
    Swift::Int v31 = v21 + 2;
    uint64_t v131 = v30;
    Swift::Int v138 = v24;
    if (v21 + 2 >= v12)
    {
      uint64_t v2 = v125;
      if ((v27 & 1) == 0) {
        break;
      }
    }
    else
    {
      v124 = v18;
      uint64_t v32 = v24 * v22;
      Swift::Int v33 = v24 * v31;
      do
      {
        Swift::Int v34 = v31;
        uint64_t v35 = v132;
        outlined init with copy of (Int, URL)(v30 + v33, v132, &demangling cache variable for type metadata for (URL, Date));
        uint64_t v36 = v133;
        outlined init with copy of (Int, URL)(v30 + v32, v133, &demangling cache variable for type metadata for (URL, Date));
        int v37 = static Date.< infix(_:_:)();
        outlined destroy of BodyTrackingComponent?(v36, &demangling cache variable for type metadata for (URL, Date));
        outlined destroy of BodyTrackingComponent?(v35, &demangling cache variable for type metadata for (URL, Date));
        if ((v27 ^ v37))
        {
          Swift::Int v31 = v34;
          uint64_t v18 = v124;
          uint64_t v2 = v125;
          Swift::Int v21 = v128;
          Swift::Int v12 = v134;
          if ((v27 & 1) == 0) {
            goto LABEL_23;
          }
          goto LABEL_43;
        }
        Swift::Int v31 = v34 + 1;
        v30 += v138;
        Swift::Int v12 = v134;
      }
      while (v134 != v34 + 1);
      Swift::Int v31 = v134;
      uint64_t v18 = v124;
      uint64_t v2 = v125;
      Swift::Int v21 = v128;
      if ((v27 & 1) == 0) {
        break;
      }
    }
LABEL_43:
    if (v31 < v21) {
      goto LABEL_142;
    }
    if (v21 >= v31) {
      break;
    }
    v124 = v18;
    uint64_t v125 = v2;
    uint64_t v52 = 0;
    Swift::Int v53 = v138;
    uint64_t v54 = v138 * (v31 - 1);
    Swift::Int v55 = v31 * v138;
    Swift::Int v56 = v31;
    Swift::Int v57 = v21;
    uint64_t v58 = v21 * v138;
    uint64_t v38 = v135;
    do
    {
      Swift::Int v59 = v56;
      if (v57 != v56 + v52 - 1)
      {
        uint64_t v60 = v131;
        if (!v131) {
          goto LABEL_147;
        }
        unint64_t v61 = v131 + v58;
        uint64_t v62 = v131 + v54;
        outlined init with take of (URL, Date)(v131 + v58, v127);
        if (v58 < v54 || v61 >= v60 + v55)
        {
          swift_arrayInitWithTakeFrontToBack();
          Swift::Int v53 = v138;
        }
        else
        {
          Swift::Int v53 = v138;
          if (v58 != v54) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        outlined init with take of (URL, Date)(v127, v62);
        uint64_t v38 = v135;
      }
      ++v57;
      --v52;
      Swift::Int v56 = v59;
      v54 -= v53;
      v55 -= v53;
      v58 += v53;
    }
    while (v57 < v59 + v52);
    uint64_t v18 = v124;
    uint64_t v2 = v125;
    Swift::Int v31 = v59;
    Swift::Int v21 = v128;
    Swift::Int v12 = v134;
    if (v56 < v134) {
      goto LABEL_24;
    }
LABEL_58:
    if (v31 < v21) {
      goto LABEL_135;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v18 + 2) + 1, 1, v18);
    }
    unint64_t v64 = *((void *)v18 + 2);
    unint64_t v63 = *((void *)v18 + 3);
    unint64_t v20 = v64 + 1;
    Swift::Int v134 = v31;
    if (v64 >= v63 >> 1) {
      uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v63 > 1), v64 + 1, 1, v18);
    }
    uint64_t v65 = v2;
    *((void *)v18 + 2) = v20;
    v66 = v18 + 32;
    uint64_t v67 = &v18[16 * v64 + 32];
    Swift::Int v68 = v134;
    *(void *)uint64_t v67 = v21;
    *((void *)v67 + 1) = v68;
    if (v64)
    {
      while (1)
      {
        unint64_t v69 = v20 - 1;
        if (v20 >= 4)
        {
          v74 = &v66[16 * v20];
          uint64_t v75 = *((void *)v74 - 8);
          uint64_t v76 = *((void *)v74 - 7);
          BOOL v80 = __OFSUB__(v76, v75);
          uint64_t v77 = v76 - v75;
          if (v80) {
            goto LABEL_124;
          }
          uint64_t v79 = *((void *)v74 - 6);
          uint64_t v78 = *((void *)v74 - 5);
          BOOL v80 = __OFSUB__(v78, v79);
          uint64_t v72 = v78 - v79;
          char v73 = v80;
          if (v80) {
            goto LABEL_125;
          }
          unint64_t v81 = v20 - 2;
          v82 = &v66[16 * v20 - 32];
          uint64_t v84 = *(void *)v82;
          uint64_t v83 = *((void *)v82 + 1);
          BOOL v80 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          if (v80) {
            goto LABEL_127;
          }
          BOOL v80 = __OFADD__(v72, v85);
          uint64_t v86 = v72 + v85;
          if (v80) {
            goto LABEL_130;
          }
          if (v86 >= v77)
          {
            v104 = &v66[16 * v69];
            uint64_t v106 = *(void *)v104;
            uint64_t v105 = *((void *)v104 + 1);
            BOOL v80 = __OFSUB__(v105, v106);
            uint64_t v107 = v105 - v106;
            if (v80) {
              goto LABEL_134;
            }
            BOOL v97 = v72 < v107;
            goto LABEL_95;
          }
        }
        else
        {
          if (v20 != 3)
          {
            uint64_t v98 = *((void *)v18 + 4);
            uint64_t v99 = *((void *)v18 + 5);
            BOOL v80 = __OFSUB__(v99, v98);
            uint64_t v91 = v99 - v98;
            char v92 = v80;
            goto LABEL_89;
          }
          uint64_t v71 = *((void *)v18 + 4);
          uint64_t v70 = *((void *)v18 + 5);
          BOOL v80 = __OFSUB__(v70, v71);
          uint64_t v72 = v70 - v71;
          char v73 = v80;
        }
        if (v73) {
          goto LABEL_126;
        }
        unint64_t v81 = v20 - 2;
        uint64_t v87 = &v66[16 * v20 - 32];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v90 = __OFSUB__(v88, v89);
        uint64_t v91 = v88 - v89;
        char v92 = v90;
        if (v90) {
          goto LABEL_129;
        }
        uint64_t v93 = &v66[16 * v69];
        uint64_t v95 = *(void *)v93;
        uint64_t v94 = *((void *)v93 + 1);
        BOOL v80 = __OFSUB__(v94, v95);
        uint64_t v96 = v94 - v95;
        if (v80) {
          goto LABEL_132;
        }
        if (__OFADD__(v91, v96)) {
          goto LABEL_133;
        }
        if (v91 + v96 >= v72)
        {
          BOOL v97 = v72 < v96;
LABEL_95:
          if (v97) {
            unint64_t v69 = v81;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v92) {
          goto LABEL_128;
        }
        unint64_t v100 = &v66[16 * v69];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v80 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v80) {
          goto LABEL_131;
        }
        if (v103 < v91) {
          goto LABEL_14;
        }
LABEL_97:
        unint64_t v108 = v69 - 1;
        if (v69 - 1 >= v20)
        {
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
          goto LABEL_144;
        }
        if (!*v135) {
          goto LABEL_146;
        }
        v109 = v18;
        v110 = &v66[16 * v108];
        uint64_t v111 = *(void *)v110;
        v112 = &v66[16 * v69];
        uint64_t v113 = *((void *)v112 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(*v135 + *(void *)(v130 + 72) * *(void *)v110, *v135 + *(void *)(v130 + 72) * *(void *)v112, *v135 + *(void *)(v130 + 72) * v113, v129);
        if (v65) {
          goto LABEL_118;
        }
        if (v113 < v111) {
          goto LABEL_121;
        }
        if (v69 > *((void *)v109 + 2)) {
          goto LABEL_122;
        }
        *(void *)v110 = v111;
        *(void *)&v66[16 * v108 + 8] = v113;
        unint64_t v114 = *((void *)v109 + 2);
        if (v69 >= v114) {
          goto LABEL_123;
        }
        uint64_t v18 = v109;
        unint64_t v20 = v114 - 1;
        memmove(&v66[16 * v69], v112 + 16, 16 * (v114 - 1 - v69));
        *((void *)v109 + 2) = v114 - 1;
        if (v114 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v20 = 1;
LABEL_14:
    Swift::Int v12 = v135[1];
    Swift::Int v19 = v134;
    uint64_t v2 = v65;
    if (v134 >= v12) {
      goto LABEL_107;
    }
  }
LABEL_23:
  uint64_t v38 = v135;
  if (v31 >= v12) {
    goto LABEL_58;
  }
LABEL_24:
  if (__OFSUB__(v31, v21)) {
    goto LABEL_140;
  }
  if (v31 - v21 >= v123) {
    goto LABEL_58;
  }
  if (__OFADD__(v21, v123)) {
    goto LABEL_143;
  }
  if (v21 + v123 >= v12) {
    Swift::Int v39 = v12;
  }
  else {
    Swift::Int v39 = v21 + v123;
  }
  if (v39 >= v21)
  {
    if (v31 != v39)
    {
      v124 = v18;
      uint64_t v125 = v2;
      uint64_t v40 = *(void *)(v130 + 72);
      uint64_t v41 = v40 * (v31 - 1);
      uint64_t v131 = v40;
      Swift::Int v138 = v31 * v40;
      Swift::Int v126 = v39;
      do
      {
        uint64_t v43 = 0;
        Swift::Int v44 = v21;
        Swift::Int v134 = v31;
        while (1)
        {
          uint64_t v45 = *v38;
          uint64_t v46 = v132;
          outlined init with copy of (Int, URL)(v138 + v43 + *v38, v132, &demangling cache variable for type metadata for (URL, Date));
          uint64_t v47 = v41;
          uint64_t v48 = v41 + v43 + v45;
          uint64_t v49 = v133;
          outlined init with copy of (Int, URL)(v48, v133, &demangling cache variable for type metadata for (URL, Date));
          LOBYTE(v45) = static Date.< infix(_:_:)();
          outlined destroy of BodyTrackingComponent?(v49, &demangling cache variable for type metadata for (URL, Date));
          outlined destroy of BodyTrackingComponent?(v46, &demangling cache variable for type metadata for (URL, Date));
          if ((v45 & 1) == 0) {
            break;
          }
          uint64_t v50 = *v38;
          if (!*v38) {
            goto LABEL_145;
          }
          uint64_t v41 = v47;
          uint64_t v51 = v50 + v47 + v43;
          outlined init with take of (URL, Date)(v50 + v138 + v43, v137);
          Swift::Int v42 = v134;
          swift_arrayInitWithTakeFrontToBack();
          outlined init with take of (URL, Date)(v137, v51);
          v43 -= v131;
          ++v44;
          uint64_t v38 = v135;
          if (v42 == v44) {
            goto LABEL_34;
          }
        }
        Swift::Int v42 = v134;
        uint64_t v41 = v47;
LABEL_34:
        Swift::Int v31 = v42 + 1;
        v41 += v131;
        v138 += v131;
        Swift::Int v21 = v128;
      }
      while (v31 != v126);
      Swift::Int v31 = v126;
      uint64_t v18 = v124;
      uint64_t v2 = v125;
    }
    goto LABEL_58;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = a1;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL, Date));
  MEMORY[0x270FA5388](v27);
  uint64_t v28 = (uint64_t)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v22 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v22 - v13;
  uint64_t v26 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v15 = *(void *)(v12 + 72);
    uint64_t v30 = v15 * (v26 - 1);
    uint64_t v25 = v15;
    uint64_t v29 = v15 * v26;
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v17 = v24;
    while (1)
    {
      uint64_t v18 = *a4;
      outlined init with copy of (Int, URL)(v29 + v16 + *a4, (uint64_t)v14, &demangling cache variable for type metadata for (URL, Date));
      outlined init with copy of (Int, URL)(v30 + v16 + v18, (uint64_t)v10, &demangling cache variable for type metadata for (URL, Date));
      LOBYTE(v18) = static Date.< infix(_:_:)();
      outlined destroy of BodyTrackingComponent?((uint64_t)v10, &demangling cache variable for type metadata for (URL, Date));
      outlined destroy of BodyTrackingComponent?((uint64_t)v14, &demangling cache variable for type metadata for (URL, Date));
      if ((v18 & 1) == 0)
      {
LABEL_4:
        v30 += v25;
        v29 += v25;
        if (++v26 == v23) {
          return;
        }
        goto LABEL_5;
      }
      uint64_t v19 = *a4;
      if (!*a4) {
        break;
      }
      unint64_t v20 = a4;
      uint64_t v21 = v19 + v30 + v16;
      outlined init with take of (URL, Date)(v19 + v29 + v16, v28);
      swift_arrayInitWithTakeFrontToBack();
      outlined init with take of (URL, Date)(v28, v21);
      v16 -= v25;
      ++v17;
      a4 = v20;
      if (v26 == v17) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL, Date));
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_62;
  }
  int64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_63;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v13;
  unint64_t v47 = a1;
  unint64_t v46 = a4;
  uint64_t v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v25 = a4 + v18;
      unint64_t v45 = a4 + v18;
      unint64_t v47 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        uint64_t v27 = -v13;
        unint64_t v41 = a4;
        unint64_t v42 = a1;
        do
        {
          unint64_t v28 = a3 + v27;
          outlined init with copy of (Int, URL)(v25 + v27, (uint64_t)v11, &demangling cache variable for type metadata for (URL, Date));
          unint64_t v29 = a2 + v27;
          unint64_t v30 = a3;
          uint64_t v31 = (uint64_t)v11;
          uint64_t v32 = v43;
          outlined init with copy of (Int, URL)(a2 + v27, v43, &demangling cache variable for type metadata for (URL, Date));
          char v33 = static Date.< infix(_:_:)();
          uint64_t v34 = v32;
          uint64_t v11 = (char *)v31;
          outlined destroy of BodyTrackingComponent?(v34, &demangling cache variable for type metadata for (URL, Date));
          outlined destroy of BodyTrackingComponent?(v31, &demangling cache variable for type metadata for (URL, Date));
          if (v33)
          {
            if (v30 < a2 || v28 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v37 = v41;
              unint64_t v36 = v42;
            }
            else
            {
              BOOL v35 = v30 == a2;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
              if (!v35) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v47 += v27;
          }
          else
          {
            unint64_t v38 = v45;
            v45 += v27;
            if (v30 < v38 || v28 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v29 = a2;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
            }
            else
            {
              BOOL v35 = v30 == v38;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
              if (!v35) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v29 = a2;
            }
          }
          unint64_t v25 = v45;
          if (v45 <= v37) {
            break;
          }
          a2 = v29;
          a3 = v28;
        }
        while (v29 > v36);
      }
      goto LABEL_60;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v42 = a4 + v17;
    unint64_t v45 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v20 = v43;
      do
      {
        outlined init with copy of (Int, URL)(a2, (uint64_t)v11, &demangling cache variable for type metadata for (URL, Date));
        outlined init with copy of (Int, URL)(a4, v20, &demangling cache variable for type metadata for (URL, Date));
        char v21 = static Date.< infix(_:_:)();
        outlined destroy of BodyTrackingComponent?(v20, &demangling cache variable for type metadata for (URL, Date));
        outlined destroy of BodyTrackingComponent?((uint64_t)v11, &demangling cache variable for type metadata for (URL, Date));
        unint64_t v22 = v47;
        if (v21)
        {
          unint64_t v23 = a2 + v13;
          if (v47 < a2 || v47 >= v23)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 == a2)
          {
            unint64_t v22 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v24 = v46 + v13;
          if (v47 < v46 || v47 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 != v46)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v46 = v24;
          unint64_t v23 = a2;
        }
        unint64_t v47 = v22 + v13;
        a4 = v46;
        if (v46 >= v42) {
          break;
        }
        a2 = v23;
      }
      while (v23 < a3);
    }
LABEL_60:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v47, &v46, (uint64_t *)&v45);
    return 1;
  }
LABEL_64:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NSURLResourceKey>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      id v7 = v6;
      String.hash(into:)();
      Swift::Int v8 = Hasher._finalize()();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v17 = v16;
        if (v15 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v24 = v23;
          if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UInt32>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    id v7 = *(void *)(v3 + 40);
    Swift::Int v8 = ~(-1 << *(unsigned char *)(v3 + 32));
    while (1)
    {
      uint64_t v9 = *(_DWORD *)(v6 + 4 * v4);
      uint64_t result = MEMORY[0x22A68A330](v7, v9, 4);
      unint64_t v11 = result & v8;
      unint64_t v12 = (result & (unint64_t)v8) >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * v12);
      uint64_t v14 = 1 << (result & v8);
      uint64_t v15 = *(void *)(v3 + 48);
      if ((v14 & v13) != 0)
      {
        while (*(_DWORD *)(v15 + 4 * v11) != v9)
        {
          unint64_t v11 = (v11 + 1) & v8;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        *(void *)(v5 + 8 * v12) = v14 | v13;
        *(_DWORD *)(v15 + 4 * v11) = v9;
        uint64_t v16 = *(void *)(v3 + 16);
        uint64_t v17 = __OFADD__(v16, 1);
        uint64_t v18 = v16 + 1;
        if (v17)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v18;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t specialized static ImageHelper.calculateTotalImagesSizeInFolderShallowly(_:)()
{
  v56[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v52 = type metadata accessor for URLResourceValues();
  uint64_t v0 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v2 = (char *)v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  Swift::Int v53 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v6 - 8);
  Swift::Int v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(v10);
  unint64_t v12 = v11;
  v56[0] = 0;
  id v13 = objc_msgSend(v9, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v11, 0, 0, v56);

  id v14 = v56[0];
  if (v13)
  {
    uint64_t v51 = v2;
    uint64_t v54 = v3;
    uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v16 = v14;

    uint64_t v17 = *(void *)(v15 + 16);
    if (v17)
    {
      uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v18 = v4 + 16;
      uint64_t v50 = v19;
      unint64_t v20 = v15 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
      uint64_t v42 = *(void *)(v18 + 56);
      unint64_t v47 = (void (**)(char *, char *, uint64_t))(v18 + 16);
      uint64_t v48 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 32);
      unint64_t v46 = (void *)*MEMORY[0x263EFF770];
      uint64_t v43 = (void (**)(char *, uint64_t))(v0 + 8);
      uint64_t v44 = (void (**)(char *, uint64_t))(v18 - 8);
      v40[1] = v15;
      swift_bridgeObjectRetain();
      uint64_t v0 = 0;
      uint64_t v49 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 40);
      v40[0] = (v18 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      long long v45 = xmmword_22830EC60;
      uint64_t v21 = v54;
      while (1)
      {
        v50(v8, v20, v21);
        uint64_t v22 = *v49;
        (*v49)(v8, 0, 1, v21);
        if ((*v48)(v8, 1, v21) == 1) {
          break;
        }
        unint64_t v41 = v22;
        uint64_t v23 = v18;
        uint64_t v24 = v53;
        uint64_t v25 = v8;
        (*v47)(v53, v8, v21);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NSURLResourceKey>);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v45;
        char v27 = v46;
        *(void *)(inited + 32) = v46;
        id v28 = v27;
        specialized Set.init(_nonEmptyArrayLiteral:)(inited);
        swift_setDeallocating();
        type metadata accessor for NSURLResourceKey(0);
        swift_arrayDestroy();
        BOOL v29 = v51;
        uint64_t v30 = v55;
        URL.resourceValues(forKeys:)();
        uint64_t v55 = v30;
        if (v30)
        {
          swift_bridgeObjectRelease();
          (*v44)(v24, v54);
          swift_bridgeObjectRelease_n();
          return v0;
        }
        swift_bridgeObjectRelease();
        uint64_t v31 = URLResourceValues.totalFileAllocatedSize.getter();
        char v33 = v32;
        (*v43)(v29, v52);
        if (v33) {
          uint64_t v34 = 0;
        }
        else {
          uint64_t v34 = v31;
        }
        BOOL v35 = __OFADD__(v34, v0);
        v0 += v34;
        if (v35) {
          __break(1u);
        }
        uint64_t v21 = v54;
        (*v44)(v24, v54);
        v20 += v42;
        --v17;
        uint64_t v18 = v23;
        Swift::Int v8 = v25;
        if (!v17)
        {
          v41(v25, 1, 1, v21);
          break;
        }
      }
    }
    else
    {
      unint64_t v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
      swift_bridgeObjectRetain();
      uint64_t v0 = 0;
      v38(v8, 1, 1, v54);
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v36 = v56[0];
    uint64_t v37 = _convertNSErrorToError(_:)();

    uint64_t v55 = v37;
    swift_willThrow();
  }
  return v0;
}

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        id v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

unint64_t specialized static ImageHelper.createMetadataFromImageSource(imageSource:index:url:)(CGImageSource *a1, size_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(a1, a2, 0);
  if (!v10)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)logger);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 141558274;
      uint64_t v21 = 1752392040;
      uint64_t v22 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v17 + 12) = 2080;
      lazy protocol witness table accessor for type URL and conformance URL();
      uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v21 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      _os_log_impl(&dword_227DD2000, v15, v16, "Can't get CGImageProperties for EXIF for %{mask.hash}s!", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A696500](v18, -1, -1);
      MEMORY[0x22A696500](v17, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }

    return specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  }
  CFDictionaryRef v11 = v10;
  uint64_t v22 = 0;
  unint64_t result = static Dictionary._forceBridgeFromObjectiveC(_:result:)();
  uint64_t v13 = v22;
  if (v22)
  {

    return v13;
  }
  __break(1u);
  return result;
}

void specialized static ImageHelper.logFilenames(files:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v38 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v41 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v50 = __swift_project_value_buffer(v11, (uint64_t)logger);
  unint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_227DD2000, v12, v13, "Files: [", v14, 2u);
    MEMORY[0x22A696500](v14, -1, -1);
  }

  uint64_t v15 = *(void *)(a1 + 16);
  v38[2] = a1;
  if (v15)
  {
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v17 = v3 + 16;
    os_log_type_t v16 = v18;
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    uint64_t v20 = *(void *)(v17 + 56);
    uint64_t v48 = (unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 32);
    long long v45 = (void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v46 = v20;
    uint64_t v44 = (void (**)(char *, uint64_t))(v17 - 8);
    swift_bridgeObjectRetain();
    uint64_t v49 = (void (**)(char *, void, uint64_t, uint64_t))(v17 + 40);
    v38[1] = (v17 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    *(void *)&long long v21 = 141558274;
    long long v39 = v21;
    v38[3] = MEMORY[0x263F8EE58] + 8;
    uint64_t v22 = v41;
    uint64_t v40 = v17;
    unint64_t v47 = v18;
    uint64_t v43 = v8;
    while (1)
    {
      v16(v22, v19, v2);
      uint64_t v24 = (void (*)(void, void, void, void))*v49;
      (*v49)(v22, 0, 1, v2);
      if ((*v48)(v22, 1, v2) == 1) {
        break;
      }
      (*v45)(v8, v22, v2);
      v16(v5, (uint64_t)v8, v2);
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v25, v26))
      {
        char v27 = v5;
        uint64_t v28 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t v51 = v29;
        *(_DWORD *)uint64_t v28 = v39;
        *(void *)(v28 + 4) = 1752392040;
        *(_WORD *)(v28 + 12) = 2080;
        lazy protocol witness table accessor for type URL and conformance URL();
        uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v28 + 14) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v51);
        swift_bridgeObjectRelease();
        uint64_t v42 = v24;
        char v32 = *v44;
        (*v44)(v27, v2);
        _os_log_impl(&dword_227DD2000, v25, v26, "%{mask.hash}s", (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A696500](v29, -1, -1);
        uint64_t v33 = v28;
        uint64_t v5 = v27;
        uint64_t v22 = v41;
        MEMORY[0x22A696500](v33, -1, -1);

        uint64_t v8 = v43;
        v32(v43, v2);
        uint64_t v24 = v42;
      }
      else
      {

        BOOL v23 = *v44;
        (*v44)(v5, v2);
        uint64_t v8 = v43;
        v23(v43, v2);
      }
      os_log_type_t v16 = v47;
      v19 += v46;
      if (!--v15)
      {
        v24(v22, 1, 1, v2);
        break;
      }
    }
  }
  else
  {
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    swift_bridgeObjectRetain();
    v34(v41, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  BOOL v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl(&dword_227DD2000, v35, v36, "]  // Files", v37, 2u);
    MEMORY[0x22A696500](v37, -1, -1);
  }
}

unint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<__REAsset>);
      unint64_t result = static _SetStorage.allocate(capacity:)();
      unint64_t v3 = result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!v2)
  {
LABEL_4:
    uint64_t v5 = *(void *)(v4 + 16);
    if (!v5) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_8:
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    return v3;
  }
LABEL_9:
  unint64_t v7 = v3 + 56;
  if ((v1 & 0xC000000000000001) == 0)
  {
    uint64_t v21 = 0;
    unint64_t v22 = v1 + 32;
    uint64_t v23 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      if (v21 == v23) {
        goto LABEL_35;
      }
      uint64_t v26 = *(void *)(v22 + 8 * v21);
      Hasher.init(_seed:)();
      Swift::UInt v27 = *(void *)(v26 + 16);
      Hasher._combine(_:)(v27);
      unint64_t result = Hasher._finalize()();
      uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      uint64_t v33 = *(void *)(v3 + 48);
      if (((1 << v29) & v31) == 0) {
        goto LABEL_23;
      }
      if (*(void *)(*(void *)(v33 + 8 * v29) + 16) != v27) {
        break;
      }
LABEL_25:
      if (++v21 == v5) {
        return v3;
      }
    }
    uint64_t v34 = ~v28;
    while (1)
    {
      unint64_t v29 = (v29 + 1) & v34;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) == 0) {
        break;
      }
      if (*(void *)(*(void *)(v33 + 8 * v29) + 16) == v27) {
        goto LABEL_25;
      }
    }
LABEL_23:
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(v33 + 8 * v29) = v26;
    uint64_t v24 = *(void *)(v3 + 16);
    BOOL v9 = __OFADD__(v24, 1);
    uint64_t v25 = v24 + 1;
    if (v9) {
      goto LABEL_36;
    }
    *(void *)(v3 + 16) = v25;
    unint64_t result = swift_retain();
    goto LABEL_25;
  }
  uint64_t v8 = 0;
  while (1)
  {
    unint64_t result = MEMORY[0x22A689930](v8, v1);
    BOOL v9 = __OFADD__(v8++, 1);
    if (v9) {
      break;
    }
    unint64_t v10 = result;
    Hasher.init(_seed:)();
    Swift::UInt v11 = *(void *)(v10 + 16);
    Hasher._combine(_:)(v11);
    unint64_t result = Hasher._finalize()();
    uint64_t v12 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v13 = result & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)(v7 + 8 * (v13 >> 6));
    uint64_t v16 = 1 << v13;
    uint64_t v17 = *(void *)(v3 + 48);
    if (((1 << v13) & v15) == 0) {
      goto LABEL_19;
    }
    if (*(void *)(*(void *)(v17 + 8 * v13) + 16) == v11)
    {
LABEL_11:
      swift_unknownObjectRelease();
      if (v8 == v5) {
        return v3;
      }
    }
    else
    {
      uint64_t v18 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v18;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)(v7 + 8 * (v13 >> 6));
        uint64_t v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0) {
          break;
        }
        if (*(void *)(*(void *)(v17 + 8 * v13) + 16) == v11) {
          goto LABEL_11;
        }
      }
LABEL_19:
      *(void *)(v7 + 8 * v14) = v16 | v15;
      *(void *)(v17 + 8 * v13) = v10;
      uint64_t v19 = *(void *)(v3 + 16);
      BOOL v9 = __OFADD__(v19, 1);
      uint64_t v20 = v19 + 1;
      if (v9) {
        goto LABEL_34;
      }
      *(void *)(v3 + 16) = v20;
      if (v8 == v5) {
        return v3;
      }
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t specialized static ImageHelper.getMaximumInputImageDimension()()
{
  if (MEMORY[0x263F36960]) {
    BOOL v0 = MEMORY[0x263F36968] == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)logger);
    unint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      BOOL v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_227DD2000, v7, v8, "Runtime doesn't have PhotogrammetrySession hardware specs, using default...", v9, 2u);
      MEMORY[0x22A696500](v9, -1, -1);
    }

    return 0x2000;
  }
  else
  {
    type metadata accessor for PhotogrammetrySession();
    uint64_t v1 = type metadata accessor for PhotogrammetrySession.HardwareSpecs();
    uint64_t v2 = *(void *)(v1 - 8);
    MEMORY[0x270FA5388](v1);
    uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    static PhotogrammetrySession.hardwareSpecs.getter();
    uint64_t v5 = PhotogrammetrySession.HardwareSpecs.maxImageDim.getter();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v5;
}

uint64_t specialized static ImageHelper.getMaximumNumberOfInputSamples()()
{
  if (MEMORY[0x263F36970]) {
    BOOL v0 = MEMORY[0x263F36978] == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)logger);
    unint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      BOOL v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_227DD2000, v7, v8, "Runtime doesn't have PhotogrammetrySession hardware specs, using default...", v9, 2u);
      MEMORY[0x22A696500](v9, -1, -1);
    }

    type metadata accessor for ObjectCaptureSession();
    uint64_t v1 = type metadata accessor for ObjectCaptureSession.HardwareSpecs();
    uint64_t v2 = *(void *)(v1 - 8);
    MEMORY[0x270FA5388](v1);
    uint64_t v4 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    static ObjectCaptureSession.hardwareSpecs.getter();
    uint64_t v5 = ObjectCaptureSession.HardwareSpecs.maxNumImages.getter();
  }
  else
  {
    type metadata accessor for PhotogrammetrySession();
    uint64_t v1 = type metadata accessor for PhotogrammetrySession.HardwareSpecs();
    uint64_t v2 = *(void *)(v1 - 8);
    MEMORY[0x270FA5388](v1);
    uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    static PhotogrammetrySession.hardwareSpecs.getter();
    uint64_t v5 = PhotogrammetrySession.HardwareSpecs.maxNumSamples.getter();
  }
  uint64_t v11 = v5;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v11;
}

unint64_t lazy protocol witness table accessor for type ImageHelper.LoadError and conformance ImageHelper.LoadError()
{
  unint64_t result = lazy protocol witness table cache variable for type ImageHelper.LoadError and conformance ImageHelper.LoadError;
  if (!lazy protocol witness table cache variable for type ImageHelper.LoadError and conformance ImageHelper.LoadError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImageHelper.LoadError and conformance ImageHelper.LoadError);
  }
  return result;
}

uint64_t outlined init with take of (URL, Date)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL, Date));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id outlined copy of ImageHelper.LoadError(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

void destroy for ImageHelper.LoadError(uint64_t a1)
{
}

void outlined consume of ImageHelper.LoadError(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ImageHelper.LoadError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of ImageHelper.LoadError(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ImageHelper.LoadError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of ImageHelper.LoadError(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of ImageHelper.LoadError(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ImageHelper.LoadError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of ImageHelper.LoadError(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for ImageHelper.LoadError()
{
  return &type metadata for ImageHelper.LoadError;
}

uint64_t StateMachineResource.__allocating_init(graph:)(uint64_t *a1)
{
  uint64_t v2 = swift_allocObject();
  StateMachineResource.init(graph:)(a1);
  return v2;
}

uint64_t *StateMachineResource.init(graph:)(uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)v1;
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  uint64_t v14 = v4;
  uint64_t v15 = v3;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  StateMachineGraph.checkIntegrity()((uint64_t)v18);
  unsigned __int8 v7 = v19;
  if (v19 == 255)
  {
    uint64_t v14 = v4;
    uint64_t v15 = v3;
    uint64_t v16 = v5;
    uint64_t v17 = v6;
    v2[6] = static StateMachineGraphCreator.createCoreAsset(from:)((uint64_t)&v14);
    uint64_t v11 = v2[2];
    uint64_t v12 = v2[3];
    v2[2] = v4;
    v2[3] = v3;
    v2[4] = v5;
    v2[5] = v6;
    outlined consume of StateMachineGraph?(v11, v12);
  }
  else
  {
    uint64_t v9 = v18[0];
    uint64_t v8 = v18[1];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type StateMachineError and conformance StateMachineError();
    swift_allocError();
    *(void *)uint64_t v10 = v9;
    *(void *)(v10 + 8) = v8;
    *(unsigned char *)(v10 + 16) = v7;
    swift_willThrow();
    outlined consume of StateMachineGraph?(v2[2], v2[3]);
    type metadata accessor for StateMachineResource();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type StateMachineError and conformance StateMachineError()
{
  unint64_t result = lazy protocol witness table cache variable for type StateMachineError and conformance StateMachineError;
  if (!lazy protocol witness table cache variable for type StateMachineError and conformance StateMachineError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StateMachineError and conformance StateMachineError);
  }
  return result;
}

uint64_t type metadata accessor for StateMachineResource()
{
  return self;
}

uint64_t StateMachineResource.deinit()
{
  REAssetSetSwiftObject();
  RERelease();
  outlined consume of StateMachineGraph?(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return v0;
}

uint64_t StateMachineResource.__deallocating_deinit()
{
  REAssetSetSwiftObject();
  RERelease();
  outlined consume of StateMachineGraph?(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return swift_deallocClassInstance();
}

uint64_t StateMachineResource.graph.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = v1[3];
  if (result) {
    goto LABEL_3;
  }
  static StateMachineGraphCreator.createGraph(from:)();
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  v1[2] = v8;
  *(_OWORD *)(v1 + 3) = v9;
  v1[5] = v10;
  outlined consume of StateMachineGraph?(v4, v5);
  uint64_t result = v1[3];
  if (result)
  {
LABEL_3:
    uint64_t v7 = v1[4];
    uint64_t v6 = v1[5];
    *a1 = v1[2];
    a1[1] = result;
    a1[2] = v7;
    a1[3] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall StateMachineResource.discardCachedGraph()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  outlined consume of StateMachineGraph?(v1, v2);
}

uint64_t method lookup function for StateMachineResource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StateMachineResource);
}

uint64_t dispatch thunk of StateMachineResource.__allocating_init(graph:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of StateMachineResource.graph.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of StateMachineResource.discardCachedGraph()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

void __swiftcall _Proto_BlendShapeMeshDescriptor_v1.init(meshName:meshType:meshPartName:)(RealityFoundation::_Proto_BlendShapeMeshDescriptor_v1 *__return_ptr retstr, Swift::String meshName, RealityFoundation::_Proto_MeshType_v1 meshType, Swift::String_optional meshPartName)
{
  RealityFoundation::_Proto_MeshType_v1 v4 = *(unsigned char *)meshType;
  retstr->meshName = meshName;
  retstr->meshType = v4;
  retstr->meshPartName = meshPartName;
}

BOOL static _Proto_MeshType_v1.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void _Proto_MeshType_v1.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int _Proto_MeshType_v1.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t _Proto_BlendShapeMeshDescriptor_v1.meshName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _Proto_BlendShapeMeshDescriptor_v1.meshName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*_Proto_BlendShapeMeshDescriptor_v1.meshName.modify())(void, void)
{
  return destructiveProjectEnumData for __RKEntityInteractionsComponent.Registration.RegistrationError;
}

void _Proto_BlendShapeMeshDescriptor_v1.meshType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *_Proto_BlendShapeMeshDescriptor_v1.meshType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*_Proto_BlendShapeMeshDescriptor_v1.meshType.modify())(void, void)
{
  return destructiveProjectEnumData for __RKEntityInteractionsComponent.Registration.RegistrationError;
}

uint64_t _Proto_BlendShapeMeshDescriptor_v1.meshPartName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _Proto_BlendShapeMeshDescriptor_v1.meshPartName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*_Proto_BlendShapeMeshDescriptor_v1.meshPartName.modify())(void, void)
{
  return destructiveProjectEnumData for __RKEntityInteractionsComponent.Registration.RegistrationError;
}

unint64_t lazy protocol witness table accessor for type _Proto_MeshType_v1 and conformance _Proto_MeshType_v1()
{
  unint64_t result = lazy protocol witness table cache variable for type _Proto_MeshType_v1 and conformance _Proto_MeshType_v1;
  if (!lazy protocol witness table cache variable for type _Proto_MeshType_v1 and conformance _Proto_MeshType_v1)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _Proto_MeshType_v1 and conformance _Proto_MeshType_v1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for _Proto_MeshType_v1(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2282FF800);
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

ValueMetadata *type metadata accessor for _Proto_MeshType_v1()
{
  return &type metadata for _Proto_MeshType_v1;
}

uint64_t initializeWithCopy for _Proto_BlendShapeMeshDescriptor_v1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for _Proto_BlendShapeMeshDescriptor_v1(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for _Proto_BlendShapeMeshDescriptor_v1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for _Proto_BlendShapeMeshDescriptor_v1()
{
  return &type metadata for _Proto_BlendShapeMeshDescriptor_v1;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t static Measurement.== infix<A, B>(_:_:)()
{
  return MEMORY[0x270EEDF80]();
}

uint64_t type metadata accessor for Measurement()
{
  return MEMORY[0x270EEE068]();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t static CharacterSet.urlQueryAllowed.getter()
{
  return MEMORY[0x270EEE100]();
}

uint64_t static CharacterSet.controlCharacters.getter()
{
  return MEMORY[0x270EEE130]();
}

uint64_t static CharacterSet.illegalCharacters.getter()
{
  return MEMORY[0x270EEE140]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x270EEE188]();
}

uint64_t CharacterSet.formUnion(_:)()
{
  return MEMORY[0x270EEE238]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEE378]();
}

uint64_t Notification.userInfo.getter()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t type metadata accessor for Notification()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t URLComponents.url.getter()
{
  return MEMORY[0x270EEE520]();
}

uint64_t URLComponents.path.setter()
{
  return MEMORY[0x270EEE568]();
}

uint64_t URLComponents.init()()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t type metadata accessor for URLComponents()
{
  return MEMORY[0x270EEE610]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x270EEE648]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t type metadata accessor for AttributedString()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t AttributedString.init(_:)()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t URLResourceValues.allValues.getter()
{
  return MEMORY[0x270EEEED8]();
}

uint64_t URLResourceValues.creationDate.getter()
{
  return MEMORY[0x270EEEF00]();
}

uint64_t URLResourceValues.totalFileAllocatedSize.getter()
{
  return MEMORY[0x270EEEFA0]();
}

uint64_t URLResourceValues.volumeAvailableCapacityForImportantUsage.getter()
{
  return MEMORY[0x270EEEFC0]();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEF238]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x270EEF250]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x270EEF268]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x270EEF278]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEF288]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return MEMORY[0x270EEF868]();
}

uint64_t static LocalizedStringResource.== infix(_:_:)()
{
  return MEMORY[0x270EEF890]();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t URL.standardizedFileURL.getter()
{
  return MEMORY[0x270EEFBB0]();
}

uint64_t URL.isFileURL.getter()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t URL.standardized.getter()
{
  return MEMORY[0x270EEFC00]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t URL.pathComponents.getter()
{
  return MEMORY[0x270EEFC70]();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t URL.hasDirectoryPath.getter()
{
  return MEMORY[0x270EEFCD0]();
}

uint64_t URL.lastPathComponent.getter()
{
  return MEMORY[0x270EEFCE0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::Void __swiftcall URL.appendPathComponent(_:)(Swift::String a1)
{
}

uint64_t URL.deletingPathExtension()()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t URL.withUnsafeFileSystemRepresentation<A>(_:)()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = MEMORY[0x270EEFE68](percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x270EEFFE8]();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.copyBytes(to:count:)()
{
  return MEMORY[0x270EF0268]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x270EF0700]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.description.getter()
{
  return MEMORY[0x270EF0C70]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t UUID.init(uuid:)()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t Logger.init()()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t ObjectCaptureSession.HardwareSpecs.maxNumImages.getter()
{
  return MEMORY[0x270F1A960]();
}

uint64_t type metadata accessor for ObjectCaptureSession.HardwareSpecs()
{
  return MEMORY[0x270F1A968]();
}

uint64_t static ObjectCaptureSession.hardwareSpecs.getter()
{
  return MEMORY[0x270F1A970]();
}

uint64_t type metadata accessor for ObjectCaptureSession()
{
  return MEMORY[0x270F1AB30]();
}

uint64_t PhotogrammetrySample.objectMask.getter()
{
  return MEMORY[0x270F1AB38]();
}

uint64_t PhotogrammetrySample.objectMask.setter()
{
  return MEMORY[0x270F1AB40]();
}

uint64_t PhotogrammetrySample.depthDataMap.getter()
{
  return MEMORY[0x270F1AB48]();
}

uint64_t PhotogrammetrySample.depthDataMap.setter()
{
  return MEMORY[0x270F1AB50]();
}

uint64_t PhotogrammetrySample.staticSegmentID.getter()
{
  return MEMORY[0x270F1AB58]();
}

uint64_t PhotogrammetrySample.init(id:image:)()
{
  return MEMORY[0x270F1AB60]();
}

uint64_t PhotogrammetrySample.Scene.boundingBox.getter()
{
  return MEMORY[0x270F1AB70]();
}

uint64_t type metadata accessor for PhotogrammetrySample.Scene()
{
  return MEMORY[0x270F1AB78]();
}

uint64_t PhotogrammetrySample.image.getter()
{
  return MEMORY[0x270F1AB80]();
}

uint64_t PhotogrammetrySample.scene.getter()
{
  return MEMORY[0x270F1AB88]();
}

uint64_t PhotogrammetrySample.Camera.intrinsics.getter()
{
  return MEMORY[0x270F1AB90]();
}

uint64_t PhotogrammetrySample.Camera.calibrationData.getter()
{
  return MEMORY[0x270F1AB98]();
}

uint64_t PhotogrammetrySample.Camera.transform.getter()
{
  return MEMORY[0x270F1ABA8]();
}

uint64_t type metadata accessor for PhotogrammetrySample.Camera()
{
  return MEMORY[0x270F1ABB0]();
}

uint64_t PhotogrammetrySample.Object.boundingBox.getter()
{
  return MEMORY[0x270F1ABB8]();
}

uint64_t type metadata accessor for PhotogrammetrySample.Object()
{
  return MEMORY[0x270F1ABC0]();
}

uint64_t PhotogrammetrySample.camera.getter()
{
  return MEMORY[0x270F1ABC8]();
}

uint64_t PhotogrammetrySample.object.getter()
{
  return MEMORY[0x270F1ABD0]();
}

uint64_t PhotogrammetrySample.gravity.setter()
{
  return MEMORY[0x270F1ABE0]();
}

uint64_t PhotogrammetrySample.metadata.setter()
{
  return MEMORY[0x270F1ABF0]();
}

uint64_t type metadata accessor for PhotogrammetrySample()
{
  return MEMORY[0x270F1ABF8]();
}

uint64_t PhotogrammetrySession.PointCloud.Point.position.getter()
{
  return MEMORY[0x270F1AC08]();
}

uint64_t type metadata accessor for PhotogrammetrySession.PointCloud.Point()
{
  return MEMORY[0x270F1AC10]();
}

uint64_t type metadata accessor for PhotogrammetrySession.PointCloud()
{
  return MEMORY[0x270F1AC20]();
}

uint64_t type metadata accessor for PhotogrammetrySession.ProcessStage()
{
  return MEMORY[0x270F1AC30]();
}

uint64_t PhotogrammetrySession.Configuration.snapshotURL.setter()
{
  return MEMORY[0x270F1AC38]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Configuration.SampleOrdering()
{
  return MEMORY[0x270F1AC40]();
}

uint64_t PhotogrammetrySession.Configuration.sampleOrdering.setter()
{
  return MEMORY[0x270F1AC48]();
}

uint64_t PhotogrammetrySession.Configuration.ignoreBoundingBox.setter()
{
  return MEMORY[0x270F1AC58]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Configuration.FeatureSensitivity()
{
  return MEMORY[0x270F1AC60]();
}

uint64_t PhotogrammetrySession.Configuration.featureSensitivity.setter()
{
  return MEMORY[0x270F1AC68]();
}

uint64_t PhotogrammetrySession.Configuration.isObjectMaskingEnabled.setter()
{
  return MEMORY[0x270F1AC70]();
}

uint64_t PhotogrammetrySession.Configuration.init()()
{
  return MEMORY[0x270F1AC78]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Configuration()
{
  return MEMORY[0x270F1AC80]();
}

uint64_t PhotogrammetrySession.HardwareSpecs.maxImageDim.getter()
{
  return MEMORY[0x270F1AC88]();
}

uint64_t PhotogrammetrySession.HardwareSpecs.maxNumSamples.getter()
{
  return MEMORY[0x270F1AC90]();
}

uint64_t type metadata accessor for PhotogrammetrySession.HardwareSpecs()
{
  return MEMORY[0x270F1AC98]();
}

uint64_t PhotogrammetrySession.init(configuration:)()
{
  return MEMORY[0x270F1ACA0]();
}

uint64_t static PhotogrammetrySession.hardwareSpecs.getter()
{
  return MEMORY[0x270F1ACA8]();
}

uint64_t dispatch thunk of PhotogrammetrySession.outputPublisher.getter()
{
  return MEMORY[0x270F1ACB0]();
}

uint64_t PhotogrammetrySession.init(photogrammetrySamples:configuration:)()
{
  return MEMORY[0x270F1ACB8]();
}

uint64_t static PhotogrammetrySession.getNumberOfSamplesInSnapshot(snapshotURL:)()
{
  return MEMORY[0x270F1ACC0]();
}

uint64_t static PhotogrammetrySession.isDeviceCompatibleWithSnapshot(snapshotURL:)()
{
  return MEMORY[0x270F1ACC8]();
}

uint64_t static PhotogrammetrySession.isConfigurationCompatibleWithSnapshot(configuration:snapshotURL:)()
{
  return MEMORY[0x270F1ACD0]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Error()
{
  return MEMORY[0x270F1ACD8]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Poses()
{
  return MEMORY[0x270F1ACE8]();
}

uint64_t dispatch thunk of PhotogrammetrySession.close()()
{
  return MEMORY[0x270F1ACF0]();
}

uint64_t PhotogrammetrySession.Output.ProgressInfo.processStage.getter()
{
  return MEMORY[0x270F1ACF8]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Output.ProgressInfo()
{
  return MEMORY[0x270F1AD08]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Output()
{
  return MEMORY[0x270F1AD10]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Result()
{
  return MEMORY[0x270F1AD18]();
}

uint64_t static PhotogrammetrySession.Request.== infix(_:_:)()
{
  return MEMORY[0x270F1AD28]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Request.Detail()
{
  return MEMORY[0x270F1AD30]();
}

uint64_t PhotogrammetrySession.Request.Geometry.rootTransform.getter()
{
  return MEMORY[0x270F1AD38]();
}

uint64_t PhotogrammetrySession.Request.Geometry.init(orientedBoundsTransform:rootTransform:)()
{
  return MEMORY[0x270F1AD40]();
}

uint64_t PhotogrammetrySession.Request.Geometry.orientedBoundsTransform.getter()
{
  return MEMORY[0x270F1AD48]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Request.Geometry()
{
  return MEMORY[0x270F1AD50]();
}

uint64_t type metadata accessor for PhotogrammetrySession.Request()
{
  return MEMORY[0x270F1AD58]();
}

uint64_t PhotogrammetrySession.init(imagesURL:configuration:)()
{
  return MEMORY[0x270F1AD68]();
}

uint64_t type metadata accessor for PhotogrammetrySession()
{
  return MEMORY[0x270F1AD70]();
}

uint64_t static ObjectCaptureImageFolderReader.loadPhotogrammetrySample(id:url:)()
{
  return MEMORY[0x270F1ADB0]();
}

uint64_t type metadata accessor for ObjectCaptureImageFolderReader()
{
  return MEMORY[0x270F1ADB8]();
}

uint64_t dispatch thunk of CustomCombineIdentifierConvertible.combineIdentifier.getter()
{
  return MEMORY[0x270EE3820]();
}

uint64_t CustomCombineIdentifierConvertible<>.combineIdentifier.getter()
{
  return MEMORY[0x270EE3828]();
}

uint64_t type metadata accessor for Publishers.CompactMap()
{
  return MEMORY[0x270EE3880]();
}

uint64_t type metadata accessor for Publishers.PrefetchStrategy()
{
  return MEMORY[0x270EE3928]();
}

uint64_t dispatch thunk of Subscriber.receive(completion:)()
{
  return MEMORY[0x270EE3AE0]();
}

uint64_t dispatch thunk of Subscriber.receive(subscription:)()
{
  return MEMORY[0x270EE3AE8]();
}

uint64_t dispatch thunk of Subscriber.receive(_:)()
{
  return MEMORY[0x270EE3AF0]();
}

uint64_t dispatch thunk of Cancellable.cancel()()
{
  return MEMORY[0x270EE3AF8]();
}

uint64_t Cancellable.store<A>(in:)()
{
  return MEMORY[0x270EE3B08]();
}

uint64_t static Subscribers.Demand.== infix(_:_:)()
{
  return MEMORY[0x270EE3B40]();
}

uint64_t static Subscribers.Demand.unlimited.getter()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t AnyPublisher.init<A>(_:)()
{
  return MEMORY[0x270EE3B68]();
}

uint64_t dispatch thunk of Subscription.request(_:)()
{
  return MEMORY[0x270EE3B78]();
}

uint64_t type metadata accessor for AnySubscriber()
{
  return MEMORY[0x270EE3B80]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t type metadata accessor for AnySubscriberBox()
{
  return MEMORY[0x270EE3C08]();
}

uint64_t AnySubscriberBox.__allocating_init(_:)()
{
  return MEMORY[0x270EE3C10]();
}

uint64_t dispatch thunk of AnySubscriberBase.receive(_:)()
{
  return MEMORY[0x270EE3C38]();
}

uint64_t CurrentValueSubject.send(completion:)()
{
  return MEMORY[0x270EE3C80]();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t CurrentValueSubject.value.setter()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t type metadata accessor for CurrentValueSubject()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t CurrentValueSubject.__allocating_init(_:)()
{
  return MEMORY[0x270EE3CB0]();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t AsyncThrowingPublisher.makeAsyncIterator()()
{
  return MEMORY[0x270EE3CC8]();
}

uint64_t AsyncThrowingPublisher.init(_:)()
{
  return MEMORY[0x270EE3CD8]();
}

uint64_t Empty.init(completeImmediately:)()
{
  return MEMORY[0x270EE3D50]();
}

uint64_t type metadata accessor for Future()
{
  return MEMORY[0x270EE3D68]();
}

uint64_t Future.init(_:)()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t Publisher.first(where:)()
{
  return MEMORY[0x270EE3EB0]();
}

uint64_t Publisher.buffer(size:prefetch:whenFull:)()
{
  return MEMORY[0x270EE3F10]();
}

uint64_t Publisher.values.getter()
{
  return MEMORY[0x270EE3F38]();
}

uint64_t Publisher.subscribe<A>(_:)()
{
  return MEMORY[0x270EE3FD0]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x270EE4008]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t GeometryCollection.subscript.getter()
{
  return MEMORY[0x270F30290]();
}

uint64_t triangulateByEarClipping(points:accumuluatedOutlineIndexCount:triangleVertexIndices:)()
{
  return MEMORY[0x270F30298]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t Set.init()()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x270F9D010]();
}

uint64_t static BinaryFloatingPoint<>._convert<A>(from:)()
{
  return MEMORY[0x270F9D030]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x270F9D050]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1820]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1830]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return MEMORY[0x270F9D088]();
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.Index.hash(into:)()
{
  return MEMORY[0x270F9D100]();
}

uint64_t Dictionary.Index._asCocoa.modify()
{
  return MEMORY[0x270F9D110]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x270F9D220]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t Character._isSingleScalar.getter()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x270F9D490]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.init(utf8String:)()
{
  return MEMORY[0x270EF1890]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.init(cString:encoding:)()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t static String.Encoding.ascii.getter()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

Swift::String __swiftcall String.init(_:)(NSString a1)
{
  uint64_t v1 = MEMORY[0x270EF1B18](a1);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x270F9D600]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.init(unsafeUninitializedCapacity:initializingUTF8With:)()
{
  return MEMORY[0x270F9D6E0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x270F9D750]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D758]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D760]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x270F9D7D8]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x270F9D808]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D880](a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = MEMORY[0x270F9D898](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x270F9D908]();
}

uint64_t Sequence<>.makeIterator()()
{
  return MEMORY[0x270F9D928]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x270F9D940]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x270F9D948]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t Sequence.reduce<A>(into:_:)()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t UnsafeRawPointer.load<A>(fromByteOffset:as:)()
{
  return MEMORY[0x270F9DA38]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA80]();
}

{
  return MEMORY[0x270F9DA98]();
}

{
  return MEMORY[0x270F9DAD8]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB00]();
}

{
  return MEMORY[0x270F9DB18]();
}

{
  return MEMORY[0x270F9DB58]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1B98]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t Array.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x270F9DBD8]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD28]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1BD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA1F48]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t type metadata accessor for AsyncStream()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA1F90]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x270FA1FD8]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C18]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x270F9DDF0]();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C48]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

Swift::Void __swiftcall Set.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t Set.count.getter()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t Set.insert(_:)()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x270F9DFD0]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return MEMORY[0x270F9E0A8]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection<>.popFirst()()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E178]();
}

uint64_t Collection<>.firstIndex(of:)()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t RangeReplaceableCollection<>.removeAll(where:)()
{
  return MEMORY[0x270F9E2F0]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x270F9E330]();
}

uint64_t CFErrorRef._code.getter()
{
  return MEMORY[0x270EF1D60]();
}

uint64_t CFErrorRef._domain.getter()
{
  return MEMORY[0x270EF1D68]();
}

uint64_t CFErrorRef._userInfo.getter()
{
  return MEMORY[0x270EF1D70]();
}

uint64_t CGColorRef.components.getter()
{
  return MEMORY[0x270EE5820]();
}

void __swiftcall SPRotation3D.init(_:)(SPRotation3D *__return_ptr retstr, simd_quatd *a2)
{
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

void __swiftcall simd_float4x4.init(_:)(simd_float4x4 *__return_ptr retstr, simd_quatf *a2)
{
}

uint64_t CGMutablePathRef.addArc(center:radius:startAngle:endAngle:clockwise:transform:)()
{
  return MEMORY[0x270EE58C8]();
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t NSAttributedString.init(_:)()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t OS_geom_inset_evaluator_2d.init(points:accumulatedOutlineIndexCount:)()
{
  return MEMORY[0x270F302A0]();
}

uint64_t NSArray.makeIterator()()
{
  return MEMORY[0x270EF20D8]();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x270EF2198](integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x270FA1190]();
}

uint64_t NSString.init(stringLiteral:)()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t static OS_os_log.default.getter()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x270F9E378]();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return MEMORY[0x270F9E400]();
}

uint64_t Substring.index(after:)()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t Substring.index(before:)()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t Substring.distance(from:to:)()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x270F9E4F8]();
}

{
  return MEMORY[0x270F9E508]();
}

uint64_t Substring.init(_:)()
{
  return MEMORY[0x270F9E500]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x270EF2478]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t StringProtocol.removingPercentEncoding.getter()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t StringProtocol.hash.getter()
{
  return MEMORY[0x270EF2550]();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return MEMORY[0x270EF2560]();
}

uint64_t StringProtocol.cString(using:)()
{
  return MEMORY[0x270EF2578]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x270F9E640]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x270F9E648]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x270F9E650]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x270F9E658]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return MEMORY[0x270F9E660]();
}

{
  return MEMORY[0x270F9E668]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return MEMORY[0x270F9E698]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x270F9E708]();
}

uint64_t ArraySlice.init<A>(_:)()
{
  return MEMORY[0x270F9E718]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x270F9E800]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x270F9E848]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x270F9E858]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x270F9E878]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyIterator.next()()
{
  return MEMORY[0x270F9E8F0]();
}

uint64_t AnyIterator.init(_:)()
{
  return MEMORY[0x270F9E908]();
}

uint64_t AnySequence.init<A>(_:)()
{
  return MEMORY[0x270F9E918]();
}

uint64_t dispatch thunk of SIMDStorage.init()()
{
  return MEMORY[0x270F9E940]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.getter()
{
  return MEMORY[0x270F9E948]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.setter()
{
  return MEMORY[0x270F9E950]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x270F9E968]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x270F9E9A0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _typeByName(_:)()
{
  return MEMORY[0x270F9E9B8]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t OpaquePointer.debugDescription.getter()
{
  return MEMORY[0x270F9EAF0]();
}

uint64_t OpaquePointer.hashValue.getter()
{
  return MEMORY[0x270F9EAF8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t ContiguousArray.count.getter()
{
  return MEMORY[0x270F9EC18]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.remove(at:)()
{
  return MEMORY[0x270F9EC58]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t ContiguousArray.subscript.getter()
{
  return MEMORY[0x270F9ECB8]();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t dispatch thunk of CustomReflectable.customMirror.getter()
{
  return MEMORY[0x270F9EE00]();
}

uint64_t __CocoaDictionary.startIndex.getter()
{
  return MEMORY[0x270F9EF48]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t __CocoaDictionary.Index.dictionary.getter()
{
  return MEMORY[0x270F9EF60]();
}

uint64_t __CocoaDictionary.Index.handleBitPattern.getter()
{
  return MEMORY[0x270F9EF68]();
}

uint64_t __CocoaDictionary.Index.age.getter()
{
  return MEMORY[0x270F9EF78]();
}

uint64_t __CocoaDictionary.Index.key.getter()
{
  return MEMORY[0x270F9EF80]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t __CocoaDictionary.index(after:)()
{
  return MEMORY[0x270F9EF90]();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return MEMORY[0x270F9EFA8]();
}

{
  return MEMORY[0x270F9EFB0]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t __CocoaDictionary.formIndex(after:isUnique:)()
{
  return MEMORY[0x270F9EFE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x270F9F000]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x270F9F010]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x270F9F038]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x270F9F040]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x270F9F048]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x270F9F050]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x270F9F1A8]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedUnkeyedContainer(forKey:)()
{
  return MEMORY[0x270F9F248]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

{
  return MEMORY[0x270F9F278]();
}

{
  return MEMORY[0x270F9F280]();
}

{
  return MEMORY[0x270F9F288]();
}

{
  return MEMORY[0x270F9F290]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F300]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F350]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedDecodingContainer.contains(_:)()
{
  return MEMORY[0x270F9F368]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x270F9F378]();
}

uint64_t KeyedDecodingContainer.init<A>(_:)()
{
  return MEMORY[0x270F9F380]();
}

uint64_t KeyedEncodingContainer.nestedUnkeyedContainer(forKey:)()
{
  return MEMORY[0x270F9F388]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3B8]();
}

{
  return MEMORY[0x270F9F3C0]();
}

{
  return MEMORY[0x270F9F3C8]();
}

{
  return MEMORY[0x270F9F3D0]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F438]();
}

{
  return MEMORY[0x270F9F440]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F490]();
}

{
  return MEMORY[0x270F9F498]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return MEMORY[0x270F9F4B0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F558]();
}

{
  return MEMORY[0x270F9F570]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x270F9F578]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return MEMORY[0x270F9F5B0]();
}

{
  return MEMORY[0x270F9F5B8]();
}

{
  return MEMORY[0x270F9F5C0]();
}

{
  return MEMORY[0x270F9F5C8]();
}

{
  return MEMORY[0x270F9F5D0]();
}

{
  return MEMORY[0x270F9F5E0]();
}

{
  return MEMORY[0x270F9F5E8]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent<A>(_:)()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F5F0]();
}

{
  return MEMORY[0x270F9F5F8]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F630]();
}

{
  return MEMORY[0x270F9F650]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F658]();
}

uint64_t UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F718]();
}

{
  return MEMORY[0x270F9F720]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x270F9F730]();
}

uint64_t isKnownUniquelyReferenced<A>(_:)()
{
  return MEMORY[0x270F9F768]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x270F9F818]();
}

uint64_t SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F860]();
}

{
  return MEMORY[0x270F9F868]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F8F8]();
}

{
  return MEMORY[0x270F9F900]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x270F9F918]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F960]();
}

{
  return MEMORY[0x270F9F968]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F988]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F9B0]();
}

{
  return MEMORY[0x270F9F9B8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t _diagnoseUnavailableCodeReached()()
{
  return MEMORY[0x270F9FA50]();
}

uint64_t dispatch thunk of CustomPlaygroundDisplayConvertible.playgroundDescription.getter()
{
  return MEMORY[0x270F9FA78]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t SIMD.description.getter()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t SIMD.init<A>(_:)()
{
  return MEMORY[0x270F9FAF8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t type metadata accessor for SIMD2()
{
  return MEMORY[0x270F9FB88]();
}

uint64_t type metadata accessor for SIMD3()
{
  return MEMORY[0x270F9FB90]();
}

uint64_t type metadata accessor for SIMD4()
{
  return MEMORY[0x270F9FB98]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC38]();
}

{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x270F9FC88]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x270F9FCE0]();
}

uint64_t Mirror.init<A, B>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x270F9FCE8]();
}

uint64_t Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x270F9FCF0]();
}

uint64_t dispatch thunk of Decoder.unkeyedContainer()()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.unkeyedContainer()()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t static Duration.seconds(_:)()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x270FA0090]();
}

uint64_t dispatch thunk of CodingKey.init(stringValue:)()
{
  return MEMORY[0x270FA0098]();
}

uint64_t dispatch thunk of CodingKey.intValue.getter()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t dispatch thunk of CodingKey.init(intValue:)()
{
  return MEMORY[0x270FA00A8]();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t TaskLocal.get()()
{
  return MEMORY[0x270FA23B8]();
}

uint64_t TaskLocal.withValue<A>(_:operation:file:line:)()
{
  return MEMORY[0x270FA23C0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B70](gray, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CFTypeID CMClockGetTypeID(void)
{
  return MEMORY[0x270EE7AB0]();
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return MEMORY[0x270EE7F30](allocator, sourceClock, timebaseOut);
}

CFTypeID CMTimebaseGetTypeID(void)
{
  return MEMORY[0x270EE7F60]();
}

CFStringRef CTFontCopyFullName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE9A48](font);
}

CFStringRef CTFontCopyName(CTFontRef font, CFStringRef nameKey)
{
  return (CFStringRef)MEMORY[0x270EE9A60](font, nameKey);
}

CFStringRef CTFontCopyNameForGlyph(CTFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x270EE9A70](font, glyph);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x270EE9AD8](*(void *)&uiType, language, size);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x270EE9C40](font);
  return result;
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return MEMORY[0x270EE9C60](font);
}

CFDictionaryRef CTFrameGetFrameAttributes(CTFrameRef frame)
{
  return (CFDictionaryRef)MEMORY[0x270EE9D08](frame);
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x270EE9D18](frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return (CGPathRef)MEMORY[0x270EE9D20](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x270EE9DC0](line);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x270EE9E50](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

uint64_t CoreIKCreateJSONBufferFromRig()
{
  return MEMORY[0x270F1A460]();
}

uint64_t CoreIKDestroyRig()
{
  return MEMORY[0x270F1A490]();
}

uint64_t CoreIKGenericConstraintGetBase()
{
  return MEMORY[0x270F1A518]();
}

uint64_t CoreIKGenericConstraintGetLookAtTarget()
{
  return MEMORY[0x270F1A528]();
}

uint64_t CoreIKGenericConstraintHasLookAtEnabled()
{
  return MEMORY[0x270F1A548]();
}

uint64_t CoreIKGenericConstraintSetLookAtTarget()
{
  return MEMORY[0x270F1A560]();
}

uint64_t CoreIKGenericConstraintSetTargetParameters()
{
  return MEMORY[0x270F1A578]();
}

uint64_t CoreIKGenericSolverCreate()
{
  return MEMORY[0x270F1A5A0]();
}

uint64_t CoreIKGenericSolverGetConstraint()
{
  return MEMORY[0x270F1A5B0]();
}

uint64_t CoreIKGenericSolverGetConstraintCount()
{
  return MEMORY[0x270F1A5B8]();
}

uint64_t CoreIKGenericSolverGetJointCount()
{
  return MEMORY[0x270F1A5D8]();
}

uint64_t CoreIKGenericSolverGetPGain()
{
  return MEMORY[0x270F1A5E8]();
}

uint64_t CoreIKGenericSolverGetTargetRestPose()
{
  return MEMORY[0x270F1A5F8]();
}

uint64_t CoreIKGenericSolverRigSetLookAtAxis()
{
  return MEMORY[0x270F1A608]();
}

uint64_t CoreIKGenericSolverRigSetLookAtEnabled()
{
  return MEMORY[0x270F1A610]();
}

uint64_t CoreIKGenericSolverRigSetUsesLocalSpaceLookAtAxis()
{
  return MEMORY[0x270F1A618]();
}

uint64_t CoreIKGenericSolverRigSetUsesModelSpaceLookAtAxis()
{
  return MEMORY[0x270F1A620]();
}

uint64_t CoreIKGenericSolverSolve()
{
  return MEMORY[0x270F1A650]();
}

uint64_t CoreIKGetConstraintTarget()
{
  return MEMORY[0x270F1A678]();
}

uint64_t CoreIKRigAddConstraint()
{
  return MEMORY[0x270F1A6B8]();
}

uint64_t CoreIKRigAddJoint()
{
  return MEMORY[0x270F1A6C0]();
}

uint64_t CoreIKRigConstraintSetPositionAsPoleEnabled()
{
  return MEMORY[0x270F1A6C8]();
}

uint64_t CoreIKRigCreateEmpty()
{
  return MEMORY[0x270F1A6D0]();
}

uint64_t CoreIKRigFinalize()
{
  return MEMORY[0x270F1A6D8]();
}

uint64_t CoreIKRigGetLimitsGain()
{
  return MEMORY[0x270F1A6E0]();
}

uint64_t CoreIKRigGetMaxIterations()
{
  return MEMORY[0x270F1A6E8]();
}

uint64_t CoreIKRigGetRetargetingGain()
{
  return MEMORY[0x270F1A6F0]();
}

uint64_t CoreIKRigGetSettings()
{
  return MEMORY[0x270F1A6F8]();
}

uint64_t CoreIKRigSetPCoefficient()
{
  return MEMORY[0x270F1A700]();
}

uint64_t CoreIKRigUpdateSettings()
{
  return MEMORY[0x270F1A708]();
}

uint64_t DRBufferCreateUnmanaged()
{
  return MEMORY[0x270F26130]();
}

uint64_t DRBufferDescriptorCreate()
{
  return MEMORY[0x270F26138]();
}

uint64_t DRBufferDescriptorSetCapacity()
{
  return MEMORY[0x270F26140]();
}

uint64_t DRBufferDescriptorSetSizeMultiple()
{
  return MEMORY[0x270F26148]();
}

uint64_t DRBufferGetBytesUsed()
{
  return MEMORY[0x270F26150]();
}

uint64_t DRBufferRead()
{
  return MEMORY[0x270F26158]();
}

uint64_t DRBufferReadUsing()
{
  return MEMORY[0x270F26160]();
}

uint64_t DRBufferReplace()
{
  return MEMORY[0x270F26168]();
}

uint64_t DRBufferReplaceUsing()
{
  return MEMORY[0x270F26170]();
}

uint64_t DRBufferSetBytesUsed()
{
  return MEMORY[0x270F26178]();
}

uint64_t DRBufferUpdate()
{
  return MEMORY[0x270F26180]();
}

uint64_t DRContextCreateBuffer()
{
  return MEMORY[0x270F261C8]();
}

uint64_t DRContextCreateMesh()
{
  return MEMORY[0x270F261D0]();
}

uint64_t DRContextCreateTexture()
{
  return MEMORY[0x270F261D8]();
}

uint64_t DRMeshCopyDescriptor()
{
  return MEMORY[0x270F26238]();
}

uint64_t DRMeshCreateUnmanaged()
{
  return MEMORY[0x270F26240]();
}

uint64_t DRMeshDescriptorCreate()
{
  return MEMORY[0x270F26250]();
}

uint64_t DRMeshDescriptorGetIndexCapacity()
{
  return MEMORY[0x270F26258]();
}

uint64_t DRMeshDescriptorGetIndexType()
{
  return MEMORY[0x270F26260]();
}

uint64_t DRMeshDescriptorGetVertexAttributeCount()
{
  return MEMORY[0x270F26268]();
}

uint64_t DRMeshDescriptorGetVertexAttributeFormat()
{
  return MEMORY[0x270F26270]();
}

uint64_t DRMeshDescriptorGetVertexBufferCount()
{
  return MEMORY[0x270F26278]();
}

uint64_t DRMeshDescriptorGetVertexCapacity()
{
  return MEMORY[0x270F26280]();
}

uint64_t DRMeshDescriptorGetVertexLayout()
{
  return MEMORY[0x270F26288]();
}

uint64_t DRMeshDescriptorGetVertexLayoutCount()
{
  return MEMORY[0x270F26290]();
}

uint64_t DRMeshDescriptorSetIndexCapacity()
{
  return MEMORY[0x270F26298]();
}

uint64_t DRMeshDescriptorSetIndexType()
{
  return MEMORY[0x270F262A0]();
}

uint64_t DRMeshDescriptorSetVertexAttributeCount()
{
  return MEMORY[0x270F262A8]();
}

uint64_t DRMeshDescriptorSetVertexAttributeFormat()
{
  return MEMORY[0x270F262B0]();
}

uint64_t DRMeshDescriptorSetVertexBufferCount()
{
  return MEMORY[0x270F262B8]();
}

uint64_t DRMeshDescriptorSetVertexCapacity()
{
  return MEMORY[0x270F262C0]();
}

uint64_t DRMeshDescriptorSetVertexLayout()
{
  return MEMORY[0x270F262C8]();
}

uint64_t DRMeshDescriptorSetVertexLayoutCount()
{
  return MEMORY[0x270F262D0]();
}

uint64_t DRMeshGetPartAt()
{
  return MEMORY[0x270F262E0]();
}

uint64_t DRMeshGetPartCount()
{
  return MEMORY[0x270F262E8]();
}

uint64_t DRMeshReadIndices()
{
  return MEMORY[0x270F262F8]();
}

uint64_t DRMeshReadIndicesUsing()
{
  return MEMORY[0x270F26300]();
}

uint64_t DRMeshReadVertices()
{
  return MEMORY[0x270F26308]();
}

uint64_t DRMeshReadVerticesUsing()
{
  return MEMORY[0x270F26310]();
}

uint64_t DRMeshReplaceIndices()
{
  return MEMORY[0x270F26318]();
}

uint64_t DRMeshReplaceIndicesUsing()
{
  return MEMORY[0x270F26320]();
}

uint64_t DRMeshReplaceVertices()
{
  return MEMORY[0x270F26328]();
}

uint64_t DRMeshReplaceVerticesUsing()
{
  return MEMORY[0x270F26330]();
}

uint64_t DRMeshSetPartAt()
{
  return MEMORY[0x270F26338]();
}

uint64_t DRMeshSetPartCount()
{
  return MEMORY[0x270F26340]();
}

uint64_t DRMeshUpdateIndices()
{
  return MEMORY[0x270F26348]();
}

uint64_t DRMeshUpdateVertices()
{
  return MEMORY[0x270F26350]();
}

uint64_t DRTextureCreateUnmanaged()
{
  return MEMORY[0x270F263B0]();
}

uint64_t DRTextureDescriptorCreate()
{
  return MEMORY[0x270F263B8]();
}

uint64_t DRTextureDescriptorSetArrayLength()
{
  return MEMORY[0x270F263F8]();
}

uint64_t DRTextureDescriptorSetDepth()
{
  return MEMORY[0x270F26400]();
}

uint64_t DRTextureDescriptorSetHeight()
{
  return MEMORY[0x270F26408]();
}

uint64_t DRTextureDescriptorSetMipmapLevelCount()
{
  return MEMORY[0x270F26410]();
}

uint64_t DRTextureDescriptorSetPixelFormat()
{
  return MEMORY[0x270F26418]();
}

uint64_t DRTextureDescriptorSetSwizzle()
{
  return MEMORY[0x270F26420]();
}

uint64_t DRTextureDescriptorSetTextureType()
{
  return MEMORY[0x270F26428]();
}

uint64_t DRTextureDescriptorSetTextureUsage()
{
  return MEMORY[0x270F26430]();
}

uint64_t DRTextureDescriptorSetWidth()
{
  return MEMORY[0x270F26438]();
}

uint64_t DRTextureReadTexture()
{
  return MEMORY[0x270F26440]();
}

uint64_t DRTextureReplaceTexture()
{
  return MEMORY[0x270F26448]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x270EF5EA0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t REAABBCenter()
{
  return MEMORY[0x270F1BC48]();
}

uint64_t REAABBContainsBox()
{
  return MEMORY[0x270F1BC58]();
}

uint64_t REAABBContainsPoint()
{
  return MEMORY[0x270F1BC60]();
}

uint64_t REAABBEmpty()
{
  return MEMORY[0x270F1BC68]();
}

uint64_t REAABBExpandedToIncludeBox()
{
  return MEMORY[0x270F1BC70]();
}

uint64_t REAABBExpandedToIncludePoint()
{
  return MEMORY[0x270F1BC78]();
}

uint64_t REAABBExtents()
{
  return MEMORY[0x270F1BC80]();
}

uint64_t REAABBInit()
{
  return MEMORY[0x270F1BC88]();
}

uint64_t REAABBIntersectsBox()
{
  return MEMORY[0x270F1BC90]();
}

uint64_t REAABBIsEmpty()
{
  return MEMORY[0x270F1BC98]();
}

uint64_t REAABBTransform()
{
  return MEMORY[0x270F1BCA8]();
}

uint64_t REAREnvironmentProbeComponentGetComponentType()
{
  return MEMORY[0x270F1BCB0]();
}

uint64_t REAREnvironmentProbeComponentGetExtents()
{
  return MEMORY[0x270F1BCB8]();
}

uint64_t REAREnvironmentProbeComponentGetTexture()
{
  return MEMORY[0x270F1BCC0]();
}

uint64_t REAREnvironmentProbeComponentGetUseAsBackground()
{
  return MEMORY[0x270F1BCC8]();
}

uint64_t REAREnvironmentProbeComponentSetExtents()
{
  return MEMORY[0x270F1BCD8]();
}

uint64_t REAREnvironmentProbeComponentSetTexture()
{
  return MEMORY[0x270F1BCE8]();
}

uint64_t REAREnvironmentProbeComponentSetUseAsBackground()
{
  return MEMORY[0x270F1BCF0]();
}

uint64_t REARSegmentationComponentGetCameraTextureCbCr()
{
  return MEMORY[0x270F1BCF8]();
}

uint64_t REARSegmentationComponentGetCameraTextureY()
{
  return MEMORY[0x270F1BD00]();
}

uint64_t REARSegmentationComponentGetComponentType()
{
  return MEMORY[0x270F1BD08]();
}

uint64_t REARSegmentationComponentGetEstimatedDepthData()
{
  return MEMORY[0x270F1BD10]();
}

uint64_t REARSegmentationComponentGetSegmentationBuffer()
{
  return MEMORY[0x270F1BD18]();
}

uint64_t REARSegmentationComponentSetCameraTextureCbCr()
{
  return MEMORY[0x270F1BD20]();
}

uint64_t REARSegmentationComponentSetCameraTextureY()
{
  return MEMORY[0x270F1BD28]();
}

uint64_t REARSegmentationComponentSetEstimatedDepthData()
{
  return MEMORY[0x270F1BD30]();
}

uint64_t REARSegmentationComponentSetSegmentationBuffer()
{
  return MEMORY[0x270F1BD38]();
}

uint64_t REAccessibilityComponentAddCustomAction()
{
  return MEMORY[0x270F1BD40]();
}

uint64_t REAccessibilityComponentAddCustomContent()
{
  return MEMORY[0x270F1BD48]();
}

uint64_t REAccessibilityComponentAddCustomRotor()
{
  return MEMORY[0x270F1BD50]();
}

uint64_t REAccessibilityComponentAddSystemRotor()
{
  return MEMORY[0x270F1BD58]();
}

uint64_t REAccessibilityComponentClearCustomActions()
{
  return MEMORY[0x270F1BD60]();
}

uint64_t REAccessibilityComponentClearCustomContent()
{
  return MEMORY[0x270F1BD68]();
}

uint64_t REAccessibilityComponentClearCustomRotors()
{
  return MEMORY[0x270F1BD70]();
}

uint64_t REAccessibilityComponentClearSystemRotors()
{
  return MEMORY[0x270F1BD78]();
}

uint64_t REAccessibilityComponentGetComponentType()
{
  return MEMORY[0x270F1BD80]();
}

uint64_t REAccessibilityComponentGetCustomActionAtIndex()
{
  return MEMORY[0x270F1BD88]();
}

uint64_t REAccessibilityComponentGetCustomActionsCount()
{
  return MEMORY[0x270F1BD90]();
}

uint64_t REAccessibilityComponentGetCustomContentCount()
{
  return MEMORY[0x270F1BD98]();
}

uint64_t REAccessibilityComponentGetCustomContentImportanceAtIndex()
{
  return MEMORY[0x270F1BDA0]();
}

uint64_t REAccessibilityComponentGetCustomContentLabelAtIndex()
{
  return MEMORY[0x270F1BDA8]();
}

uint64_t REAccessibilityComponentGetCustomContentValueAtIndex()
{
  return MEMORY[0x270F1BDB0]();
}

uint64_t REAccessibilityComponentGetCustomRotorAtIndex()
{
  return MEMORY[0x270F1BDB8]();
}

uint64_t REAccessibilityComponentGetCustomRotorsCount()
{
  return MEMORY[0x270F1BDC0]();
}

uint64_t REAccessibilityComponentGetDescription()
{
  return MEMORY[0x270F1BDC8]();
}

uint64_t REAccessibilityComponentGetIdentifier()
{
  return MEMORY[0x270F1BDD0]();
}

uint64_t REAccessibilityComponentGetLabel()
{
  return MEMORY[0x270F1BDD8]();
}

uint64_t REAccessibilityComponentGetSystemActions()
{
  return MEMORY[0x270F1BDE0]();
}

uint64_t REAccessibilityComponentGetSystemRotorAtIndex()
{
  return MEMORY[0x270F1BDE8]();
}

uint64_t REAccessibilityComponentGetSystemRotorsCount()
{
  return MEMORY[0x270F1BDF0]();
}

uint64_t REAccessibilityComponentGetTraits()
{
  return MEMORY[0x270F1BDF8]();
}

uint64_t REAccessibilityComponentGetValue()
{
  return MEMORY[0x270F1BE00]();
}

uint64_t REAccessibilityComponentIsEnabled()
{
  return MEMORY[0x270F1BE08]();
}

uint64_t REAccessibilityComponentIsRoot()
{
  return MEMORY[0x270F1BE10]();
}

uint64_t REAccessibilityComponentSetDescription()
{
  return MEMORY[0x270F1BE18]();
}

uint64_t REAccessibilityComponentSetEnabled()
{
  return MEMORY[0x270F1BE20]();
}

uint64_t REAccessibilityComponentSetIdentifier()
{
  return MEMORY[0x270F1BE28]();
}

uint64_t REAccessibilityComponentSetIsRoot()
{
  return MEMORY[0x270F1BE30]();
}

uint64_t REAccessibilityComponentSetLabel()
{
  return MEMORY[0x270F1BE38]();
}

uint64_t REAccessibilityComponentSetSystemActions()
{
  return MEMORY[0x270F1BE40]();
}

uint64_t REAccessibilityComponentSetTraits()
{
  return MEMORY[0x270F1BE48]();
}

uint64_t REAccessibilityComponentSetValue()
{
  return MEMORY[0x270F1BE50]();
}

uint64_t REAcousticMeshComponentAddAbsorptionCoefficients()
{
  return MEMORY[0x270F1BE58]();
}

uint64_t REAcousticMeshComponentAddScatteringCoefficients()
{
  return MEMORY[0x270F1BE60]();
}

uint64_t REAcousticMeshComponentAddSoundReductionIndices()
{
  return MEMORY[0x270F1BE68]();
}

uint64_t REAcousticMeshComponentClearAllMaterials()
{
  return MEMORY[0x270F1BE70]();
}

uint64_t REAcousticMeshComponentCopyAllAbsorptionCoefficients()
{
  return MEMORY[0x270F1BE78]();
}

uint64_t REAcousticMeshComponentCopyAllAbsorptionFrequencies()
{
  return MEMORY[0x270F1BE80]();
}

uint64_t REAcousticMeshComponentCopyAllAbsorptionIdentifiers()
{
  return MEMORY[0x270F1BE88]();
}

uint64_t REAcousticMeshComponentCopyAllScatteringCoefficients()
{
  return MEMORY[0x270F1BE90]();
}

uint64_t REAcousticMeshComponentCopyAllScatteringFrequencies()
{
  return MEMORY[0x270F1BE98]();
}

uint64_t REAcousticMeshComponentCopyAllScatteringIdentifiers()
{
  return MEMORY[0x270F1BEA0]();
}

uint64_t REAcousticMeshComponentCopyAllSoundReductionFrequencies()
{
  return MEMORY[0x270F1BEA8]();
}

uint64_t REAcousticMeshComponentCopyAllSoundReductionIdentifiers()
{
  return MEMORY[0x270F1BEB0]();
}

uint64_t REAcousticMeshComponentCopyAllSoundReductionIndices()
{
  return MEMORY[0x270F1BEB8]();
}

uint64_t REAcousticMeshComponentGetComponentType()
{
  return MEMORY[0x270F1BEC8]();
}

uint64_t REAcousticMeshComponentGetMeshAsset()
{
  return MEMORY[0x270F1BED0]();
}

uint64_t REAcousticMeshComponentSetMeshAsset()
{
  return MEMORY[0x270F1BEE8]();
}

uint64_t REAdaptiveResolutionComponentGetComponentType()
{
  return MEMORY[0x270F1BEF0]();
}

uint64_t REAdaptiveResolutionStateComponentGetComponentType()
{
  return MEMORY[0x270F1BEF8]();
}

uint64_t REAdaptiveResolutionStateComponentGetPixelsPerMeter()
{
  return MEMORY[0x270F1BF00]();
}

uint64_t REAmbientAudioComponentGetComponentType()
{
  return MEMORY[0x270F1BF08]();
}

uint64_t REAmbientAudioComponentGetDecibelGain()
{
  return MEMORY[0x270F1BF10]();
}

uint64_t REAmbientAudioComponentSetDecibelGain()
{
  return MEMORY[0x270F1BF18]();
}

uint64_t REAmbientLightComponentGetColorGamut3F()
{
  return MEMORY[0x270F1BF20]();
}

uint64_t REAmbientLightComponentGetComponentType()
{
  return MEMORY[0x270F1BF28]();
}

uint64_t REAmbientLightComponentGetIntensity()
{
  return MEMORY[0x270F1BF30]();
}

uint64_t REAmbientLightComponentSetColorGamut3F()
{
  return MEMORY[0x270F1BF38]();
}

uint64_t REAmbientLightComponentSetIntensity()
{
  return MEMORY[0x270F1BF40]();
}

uint64_t REAnchorComponentGetAnchorIdentifier()
{
  return MEMORY[0x270F1BF48]();
}

uint64_t REAnchorComponentGetComponentType()
{
  return MEMORY[0x270F1BF58]();
}

uint64_t REAnchorComponentSetAnchorIdentifier()
{
  return MEMORY[0x270F1BF80]();
}

uint64_t REAnchorComponentSetAnchoredLocally()
{
  return MEMORY[0x270F1BF88]();
}

uint64_t REAnchorComponentSetEnableShadows()
{
  return MEMORY[0x270F1BF90]();
}

uint64_t REAnchorComponentSetRequiresLocalAnchoring()
{
  return MEMORY[0x270F1BFA8]();
}

uint64_t REAnchorComponentSetWorldTransform()
{
  return MEMORY[0x270F1BFB8]();
}

uint64_t REAnchoringComponentGetComponentType()
{
  return MEMORY[0x270F1BFE0]();
}

uint64_t REAnchoringComponentGetDescriptorAlignment()
{
  return MEMORY[0x270F1BFF0]();
}

uint64_t REAnchoringComponentGetDescriptorAnchorIdentifier()
{
  return MEMORY[0x270F1BFF8]();
}

uint64_t REAnchoringComponentGetDescriptorBounds()
{
  return MEMORY[0x270F1C000]();
}

uint64_t REAnchoringComponentGetDescriptorClassification()
{
  return MEMORY[0x270F1C010]();
}

uint64_t REAnchoringComponentGetDescriptorPhysicsSimulation()
{
  return MEMORY[0x270F1C018]();
}

uint64_t REAnchoringComponentGetDescriptorResourceGroup()
{
  return MEMORY[0x270F1C020]();
}

uint64_t REAnchoringComponentGetDescriptorResourceName()
{
  return MEMORY[0x270F1C028]();
}

uint64_t REAnchoringComponentGetDescriptorResourceStyle()
{
  return MEMORY[0x270F1C030]();
}

uint64_t REAnchoringComponentGetDescriptorTransform()
{
  return MEMORY[0x270F1C038]();
}

uint64_t REAnchoringComponentGetDescriptorType()
{
  return MEMORY[0x270F1C040]();
}

uint64_t REAnchoringComponentGetMode()
{
  return MEMORY[0x270F1C050]();
}

uint64_t REAnchoringComponentGetPreviousWorldTransform()
{
  return MEMORY[0x270F1C058]();
}

uint64_t REAnchoringComponentGetTrackingImageHeight()
{
  return MEMORY[0x270F1C068]();
}

uint64_t REAnchoringComponentGetTrackingImageWidth()
{
  return MEMORY[0x270F1C078]();
}

uint64_t REAnchoringComponentSetDescriptorAlignment()
{
  return MEMORY[0x270F1C0A0]();
}

uint64_t REAnchoringComponentSetDescriptorAnchorIdentifier()
{
  return MEMORY[0x270F1C0A8]();
}

uint64_t REAnchoringComponentSetDescriptorBounds()
{
  return MEMORY[0x270F1C0B0]();
}

uint64_t REAnchoringComponentSetDescriptorClassification()
{
  return MEMORY[0x270F1C0C0]();
}

uint64_t REAnchoringComponentSetDescriptorPhysicsSimulation()
{
  return MEMORY[0x270F1C0C8]();
}

uint64_t REAnchoringComponentSetDescriptorResourceGroup()
{
  return MEMORY[0x270F1C0D0]();
}

uint64_t REAnchoringComponentSetDescriptorResourceName()
{
  return MEMORY[0x270F1C0D8]();
}

uint64_t REAnchoringComponentSetDescriptorResourceStyle()
{
  return MEMORY[0x270F1C0E0]();
}

uint64_t REAnchoringComponentSetDescriptorTransform()
{
  return MEMORY[0x270F1C0E8]();
}

uint64_t REAnchoringComponentSetDescriptorType()
{
  return MEMORY[0x270F1C0F0]();
}

uint64_t REAnchoringComponentSetMode()
{
  return MEMORY[0x270F1C100]();
}

uint64_t REAnchoringComponentSetPreviousWorldTransform()
{
  return MEMORY[0x270F1C108]();
}

uint64_t REAnchoringComponentSetTrackingImage()
{
  return MEMORY[0x270F1C118]();
}

uint64_t REAnimationAssetGetName()
{
  return MEMORY[0x270F1C128]();
}

uint64_t REAnimationAssetGetTotalDuration()
{
  return MEMORY[0x270F1C130]();
}

uint64_t REAnimationClipDefaultParametersEx()
{
  return MEMORY[0x270F1C138]();
}

uint64_t REAnimationComponentAllAnimationsCompleted()
{
  return MEMORY[0x270F1C148]();
}

uint64_t REAnimationComponentCopyDefaultTimebaseRef()
{
  return MEMORY[0x270F1C150]();
}

uint64_t REAnimationComponentEntrySetRequest()
{
  return MEMORY[0x270F1C158]();
}

uint64_t REAnimationComponentGetAnimationParentTimebase()
{
  return MEMORY[0x270F1C160]();
}

uint64_t REAnimationComponentGetBlendFactor()
{
  return MEMORY[0x270F1C168]();
}

uint64_t REAnimationComponentGetComponentType()
{
  return MEMORY[0x270F1C170]();
}

uint64_t REAnimationComponentGetCurrentPlaybackTime()
{
  return MEMORY[0x270F1C178]();
}

uint64_t REAnimationComponentGetDuration()
{
  return MEMORY[0x270F1C180]();
}

uint64_t REAnimationComponentGetEntryCount()
{
  return MEMORY[0x270F1C188]();
}

uint64_t REAnimationComponentGetPlaybackSpeed()
{
  return MEMORY[0x270F1C190]();
}

uint64_t REAnimationComponentHasRunningAnimations()
{
  return MEMORY[0x270F1C198]();
}

uint64_t REAnimationComponentIsCompleted()
{
  return MEMORY[0x270F1C1A0]();
}

uint64_t REAnimationComponentIsPaused()
{
  return MEMORY[0x270F1C1A8]();
}

uint64_t REAnimationComponentIsValid()
{
  return MEMORY[0x270F1C1B0]();
}

uint64_t REAnimationComponentPauseAnimation()
{
  return MEMORY[0x270F1C1B8]();
}

uint64_t REAnimationComponentPlay()
{
  return MEMORY[0x270F1C1C0]();
}

uint64_t REAnimationComponentResumeAnimation()
{
  return MEMORY[0x270F1C1C8]();
}

uint64_t REAnimationComponentSetAnimationParentTimebase()
{
  return MEMORY[0x270F1C1D0]();
}

uint64_t REAnimationComponentSetCurrentPlaybackTime()
{
  return MEMORY[0x270F1C1D8]();
}

uint64_t REAnimationComponentSetDefaultTimebaseID()
{
  return MEMORY[0x270F1C1E0]();
}

uint64_t REAnimationComponentSetParentAnimation()
{
  return MEMORY[0x270F1C1E8]();
}

uint64_t REAnimationComponentStopAllAnimations()
{
  return MEMORY[0x270F1C1F0]();
}

uint64_t REAnimationComponentStopAnimation()
{
  return MEMORY[0x270F1C1F8]();
}

uint64_t REAnimationComponentStopAnimationWithTime()
{
  return MEMORY[0x270F1C200]();
}

uint64_t REAnimationHandoffDefaultDescEx()
{
  return MEMORY[0x270F1C208]();
}

uint64_t REAnimationLibraryAssetGetDefaultEntryKey()
{
  return MEMORY[0x270F1C210]();
}

uint64_t REAnimationLibraryAssetGetEntry()
{
  return MEMORY[0x270F1C218]();
}

uint64_t REAnimationLibraryAssetGetEntryCount()
{
  return MEMORY[0x270F1C228]();
}

uint64_t REAnimationLibraryAssetGetEntryIndexFromKey()
{
  return MEMORY[0x270F1C230]();
}

uint64_t REAnimationLibraryAssetGetKeyCount()
{
  return MEMORY[0x270F1C238]();
}

uint64_t REAnimationLibraryAssetGetKeys()
{
  return MEMORY[0x270F1C240]();
}

uint64_t REAnimationLibraryComponentAssignAnimationLibraryAsset()
{
  return MEMORY[0x270F1C248]();
}

uint64_t REAnimationLibraryComponentCopySkeletalQueryResultAnimationName()
{
  return MEMORY[0x270F1C250]();
}

uint64_t REAnimationLibraryComponentCopyTransformQueryResultAnimationName()
{
  return MEMORY[0x270F1C258]();
}

uint64_t REAnimationLibraryComponentCreateDefaultAnimation()
{
  return MEMORY[0x270F1C260]();
}

uint64_t REAnimationLibraryComponentCreateQueryAllSkeletalAnimations()
{
  return MEMORY[0x270F1C268]();
}

uint64_t REAnimationLibraryComponentCreateQueryAllTransformAnimations()
{
  return MEMORY[0x270F1C270]();
}

uint64_t REAnimationLibraryComponentDefaultGlobalSceneName()
{
  return MEMORY[0x270F1C278]();
}

uint64_t REAnimationLibraryComponentDefaultLocalSubtreeSceneName()
{
  return MEMORY[0x270F1C280]();
}

uint64_t REAnimationLibraryComponentGetAnimationLibraryAsset()
{
  return MEMORY[0x270F1C288]();
}

uint64_t REAnimationLibraryComponentGetComponentType()
{
  return MEMORY[0x270F1C290]();
}

uint64_t REAnimationLibraryComponentGetSkeletalQueryResultAnimationClipAsset()
{
  return MEMORY[0x270F1C298]();
}

uint64_t REAnimationLibraryComponentGetSkeletalQueryResultAnimationCount()
{
  return MEMORY[0x270F1C2A0]();
}

uint64_t REAnimationLibraryComponentGetSkeletalQueryResultCount()
{
  return MEMORY[0x270F1C2A8]();
}

uint64_t REAnimationLibraryComponentGetTransformQueryResultAnimationAsset()
{
  return MEMORY[0x270F1C2B0]();
}

uint64_t REAnimationLibraryComponentGetTransformQueryResultCount()
{
  return MEMORY[0x270F1C2B8]();
}

uint64_t REAnimationLibraryDefinitionAddEntryAsset()
{
  return MEMORY[0x270F1C2C0]();
}

uint64_t REAnimationLibraryDefinitionAddKeyedEntryIndex()
{
  return MEMORY[0x270F1C2C8]();
}

uint64_t REAnimationLibraryDefinitionCreate()
{
  return MEMORY[0x270F1C2D8]();
}

uint64_t REAnimationLibraryDefinitionCreateAnimationLibraryAsset()
{
  return MEMORY[0x270F1C2E0]();
}

uint64_t REAnimationLibraryDefinitionCreateFromAnimationLibraryAsset()
{
  return MEMORY[0x270F1C2E8]();
}

uint64_t REAnimationLibraryDefinitionGetEntryAsset()
{
  return MEMORY[0x270F1C2F8]();
}

uint64_t REAnimationLibraryDefinitionGetEntryCount()
{
  return MEMORY[0x270F1C308]();
}

uint64_t REAnimationLibraryDefinitionSetDefaultEntryKey()
{
  return MEMORY[0x270F1C318]();
}

uint64_t REAnimationSceneAssetCreateWithTimeline()
{
  return MEMORY[0x270F1C320]();
}

uint64_t REAnimationSceneAssetGetRootTimeline()
{
  return MEMORY[0x270F1C330]();
}

uint64_t REAnimationServiceGetRootTimebase()
{
  return MEMORY[0x270F1C350]();
}

uint64_t REArchiveGetDefaultEnvelopeVersion()
{
  return MEMORY[0x270F1C358]();
}

uint64_t REAssetComputeEstimatedMemorySize()
{
  return MEMORY[0x270F1C378]();
}

uint64_t REAssetCopyDependencyArray()
{
  return MEMORY[0x270F1C380]();
}

uint64_t REAssetCopyDescription()
{
  return MEMORY[0x270F1C388]();
}

uint64_t REAssetDynamicArrayGetAsset()
{
  return MEMORY[0x270F1C3B0]();
}

uint64_t REAssetDynamicArrayGetSize()
{
  return MEMORY[0x270F1C3B8]();
}

uint64_t REAssetGetAssetId()
{
  return MEMORY[0x270F1C3C0]();
}

uint64_t REAssetGetAssetManager()
{
  return MEMORY[0x270F1C3C8]();
}

uint64_t REAssetGetSwiftObject()
{
  return MEMORY[0x270F1C3D0]();
}

uint64_t REAssetGetType()
{
  return MEMORY[0x270F1C3D8]();
}

uint64_t REAssetHandleAssetType()
{
  return MEMORY[0x270F1C3F0]();
}

uint64_t REAssetHandleConvertToMutable()
{
  return MEMORY[0x270F1C3F8]();
}

uint64_t REAssetHandleCopyAssetIdentifierString()
{
  return MEMORY[0x270F1C400]();
}

uint64_t REAssetHandleCopyCompiledExtension()
{
  return MEMORY[0x270F1C408]();
}

uint64_t REAssetHandleCopyLoadFailedMessage()
{
  return MEMORY[0x270F1C410]();
}

uint64_t REAssetHandleCreateFromAssetRegistrationOptions()
{
  return MEMORY[0x270F1C418]();
}

uint64_t REAssetHandleCreateNewMutableWithAssetDescriptors()
{
  return MEMORY[0x270F1C420]();
}

uint64_t REAssetHandleCreateWithAssetDescriptor()
{
  return MEMORY[0x270F1C428]();
}

uint64_t REAssetHandleGetOrCreateImmutableWithAssetDescriptors()
{
  return MEMORY[0x270F1C430]();
}

uint64_t REAssetHandleIsLoaded()
{
  return MEMORY[0x270F1C438]();
}

uint64_t REAssetHandleLoadAsync()
{
  return MEMORY[0x270F1C440]();
}

uint64_t REAssetHandleLoadFailed()
{
  return MEMORY[0x270F1C448]();
}

uint64_t REAssetHandleLoadNow()
{
  return MEMORY[0x270F1C450]();
}

uint64_t REAssetHandleLoadNowFromOtherQueue()
{
  return MEMORY[0x270F1C458]();
}

uint64_t REAssetHandleResolvesToSameAssetPath()
{
  return MEMORY[0x270F1C460]();
}

uint64_t REAssetLoadRequestAddAsset()
{
  return MEMORY[0x270F1C478]();
}

uint64_t REAssetLoadRequestAddEntity()
{
  return MEMORY[0x270F1C480]();
}

uint64_t REAssetLoadRequestCopyError()
{
  return MEMORY[0x270F1C488]();
}

uint64_t REAssetLoadRequestGetState()
{
  return MEMORY[0x270F1C498]();
}

uint64_t REAssetLoadRequestGetStats()
{
  return MEMORY[0x270F1C4A0]();
}

uint64_t REAssetLoadRequestSetCompletionHandler()
{
  return MEMORY[0x270F1C4A8]();
}

uint64_t REAssetLoadRequestSetLoadAndWaitForResourceSharingClients()
{
  return MEMORY[0x270F1C4B0]();
}

uint64_t REAssetLoadRequestSetShouldBlockECSSendsUntilCompleted()
{
  return MEMORY[0x270F1C4B8]();
}

uint64_t REAssetLoadRequestStatsForEachStat()
{
  return MEMORY[0x270F1C4C0]();
}

uint64_t REAssetLoadRequestWaitForCompletion()
{
  return MEMORY[0x270F1C4C8]();
}

uint64_t REAssetLoadRequestWaitForCompletionFromOtherQueue()
{
  return MEMORY[0x270F1C4D0]();
}

uint64_t REAssetManagerAVPlayerMemoryAssetCreate()
{
  return MEMORY[0x270F1C4D8]();
}

uint64_t REAssetManagerAVSampleBufferVideoRendererMemoryAssetCreate()
{
  return MEMORY[0x270F1C4E0]();
}

uint64_t REAssetManagerAddCleanupCallback()
{
  return MEMORY[0x270F1C4E8]();
}

uint64_t REAssetManagerAssetHandleCreateWithBundleResource()
{
  return MEMORY[0x270F1C4F0]();
}

uint64_t REAssetManagerCollisionMeshAssetCreateFromMesh()
{
  return MEMORY[0x270F1C4F8]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateBox()
{
  return MEMORY[0x270F1C500]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateCapsule()
{
  return MEMORY[0x270F1C508]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateCollisionMesh()
{
  return MEMORY[0x270F1C510]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateCompound()
{
  return MEMORY[0x270F1C518]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateConvexPolyhedron()
{
  return MEMORY[0x270F1C520]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateConvexPolyhedronFromMesh()
{
  return MEMORY[0x270F1C528]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateConvexPolyhedronNullable()
{
  return MEMORY[0x270F1C530]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateFromCollisionShape()
{
  return MEMORY[0x270F1C540]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateSphere()
{
  return MEMORY[0x270F1C550]();
}

uint64_t REAssetManagerCopyVideoMaterialAsset()
{
  return MEMORY[0x270F1C558]();
}

uint64_t REAssetManagerCreateAssetHandle()
{
  return MEMORY[0x270F1C560]();
}

uint64_t REAssetManagerCreateAssetHandleForURL()
{
  return MEMORY[0x270F1C568]();
}

uint64_t REAssetManagerCreateAssetRequest()
{
  return MEMORY[0x270F1C570]();
}

uint64_t REAssetManagerCreateMeshAssetWithDirectMesh()
{
  return MEMORY[0x270F1C578]();
}

uint64_t REAssetManagerCreateTextureAssetFromData()
{
  return MEMORY[0x270F1C580]();
}

uint64_t REAssetManagerFindAssetsOfType_REKit_Only()
{
  return MEMORY[0x270F1C598]();
}

uint64_t REAssetManagerGetEngineQueue()
{
  return MEMORY[0x270F1C5A0]();
}

uint64_t REAssetManagerImageBasedLightCreateWithCubeMapNullableAsync()
{
  return MEMORY[0x270F1C5A8]();
}

uint64_t REAssetManagerImageBasedLightMemoryAssetCreateFromReiblFileAsync()
{
  return MEMORY[0x270F1C5B0]();
}

uint64_t REAssetManagerLoadRawDataForAssetDescriptor()
{
  return MEMORY[0x270F1C5C0]();
}

uint64_t REAssetManagerMaterialAssetBuilderBuild()
{
  return MEMORY[0x270F1C5C8]();
}

uint64_t REAssetManagerMaterialDefinitionAssetBuilderBuild()
{
  return MEMORY[0x270F1C5D8]();
}

uint64_t REAssetManagerMaterialDefinitionAssetBuilderUpdateExistingAsset()
{
  return MEMORY[0x270F1C5E0]();
}

uint64_t REAssetManagerMaterialMemoryAssetCreate()
{
  return MEMORY[0x270F1C5E8]();
}

uint64_t REAssetManagerMemoryAssetCreateWithRemotePlayer()
{
  return MEMORY[0x270F1C5F0]();
}

uint64_t REAssetManagerMeshAssetCreateFromModelsAndSkeletonsWithOptionsNullable()
{
  return MEMORY[0x270F1C608]();
}

uint64_t REAssetManagerMeshAssetCreateFromModelsWithOptionsAsyncWithError()
{
  return MEMORY[0x270F1C610]();
}

uint64_t REAssetManagerMeshAssetCreateFromModelsWithOptionsNullable()
{
  return MEMORY[0x270F1C618]();
}

uint64_t REAssetManagerMeshMemoryAssetCreate()
{
  return MEMORY[0x270F1C620]();
}

uint64_t REAssetManagerMeshMemoryAssetCreate3dText()
{
  return MEMORY[0x270F1C630]();
}

uint64_t REAssetManagerPhysicsMaterialAssetCreate2()
{
  return MEMORY[0x270F1C640]();
}

uint64_t REAssetManagerPostLoadProcessImageBasedLightAsset()
{
  return MEMORY[0x270F1C648]();
}

uint64_t REAssetManagerPreloadVideoAssetOnce()
{
  return MEMORY[0x270F1C650]();
}

uint64_t REAssetManagerRegisterAndCreateFileNameAliasAssetDescriptor()
{
  return MEMORY[0x270F1C658]();
}

uint64_t REAssetManagerRegisterAssetResolver()
{
  return MEMORY[0x270F1C668]();
}

uint64_t REAssetManagerResolveAssetDescriptor()
{
  return MEMORY[0x270F1C678]();
}

uint64_t REAssetManagerSceneAssetCreate()
{
  return MEMORY[0x270F1C680]();
}

uint64_t REAssetManagerSceneAssetCreateFromEntity()
{
  return MEMORY[0x270F1C688]();
}

uint64_t REAssetManagerShaderLibraryMemoryAssetCreateWithNetworkIdentifier()
{
  return MEMORY[0x270F1C698]();
}

uint64_t REAssetManagerTextureMemoryAssetCreateWithCGImage()
{
  return MEMORY[0x270F1C6A0]();
}

uint64_t REAssetManagerTextureMemoryAssetCreateWithMTLTexture()
{
  return MEMORY[0x270F1C6A8]();
}

uint64_t REAssetManagerTimelineAssetCreateOrbitAnimation()
{
  return MEMORY[0x270F1C6B0]();
}

uint64_t REAssetManagerTimelineAssetCreateSRTAnimation()
{
  return MEMORY[0x270F1C6B8]();
}

uint64_t REAssetManagerTimelineAssetCreateSRTAnimationClipEx()
{
  return MEMORY[0x270F1C6C0]();
}

uint64_t REAssetManagerTimelineAssetCreateSRTSampledAnimation()
{
  return MEMORY[0x270F1C6C8]();
}

uint64_t REAssetManagerTimelineAssetCreateTimelineClipEx()
{
  return MEMORY[0x270F1C6D0]();
}

uint64_t REAssetManagerTimelineAssetCreateTimelineGroup()
{
  return MEMORY[0x270F1C6D8]();
}

uint64_t REAssetManagerVideoMemoryAssetCreate()
{
  return MEMORY[0x270F1C6E8]();
}

uint64_t REAssetManagerVideoMemoryAssetCreateWithoutTarget()
{
  return MEMORY[0x270F1C6F0]();
}

uint64_t REAssetRegistrationOptionsCreate()
{
  return MEMORY[0x270F1C718]();
}

uint64_t REAssetRegistrationOptionsSetIsMutable()
{
  return MEMORY[0x270F1C720]();
}

uint64_t REAssetServiceCreateTextureAssetWithDirectTexture()
{
  return MEMORY[0x270F1C730]();
}

uint64_t REAssetServiceMeshAssetCreateMutable()
{
  return MEMORY[0x270F1C738]();
}

uint64_t REAssetSetNetworkSharingMode()
{
  return MEMORY[0x270F1C750]();
}

uint64_t REAssetSetSwiftObject()
{
  return MEMORY[0x270F1C758]();
}

uint64_t REAssetTypeStatsGetCumulativeFileSize()
{
  return MEMORY[0x270F1C760]();
}

uint64_t REAssetTypeStatsGetCumulativeLoadTime()
{
  return MEMORY[0x270F1C768]();
}

uint64_t REAssetTypeStatsGetTypeName()
{
  return MEMORY[0x270F1C770]();
}

uint64_t REAssetWithMetadataCreate()
{
  return MEMORY[0x270F1C778]();
}

uint64_t REAssetWithMetadataSetConfigurationNames()
{
  return MEMORY[0x270F1C780]();
}

uint64_t REAssetWithMetadataSetSceneMetadata()
{
  return MEMORY[0x270F1C790]();
}

uint64_t REAssetWithMetadataSetTreatAsScene()
{
  return MEMORY[0x270F1C798]();
}

uint64_t REAudioAnimationComponentGetComponentType()
{
  return MEMORY[0x270F1C7A0]();
}

uint64_t REAudioAnimationComponentSetLinearGain()
{
  return MEMORY[0x270F1C7B8]();
}

uint64_t REAudioAnimationComponentSetMute()
{
  return MEMORY[0x270F1C7C8]();
}

uint64_t REAudioFileAssetCloneWithConfiguration()
{
  return MEMORY[0x270F1C7D0]();
}

uint64_t REAudioFileAssetConfigurationCreate()
{
  return MEMORY[0x270F1C7E8]();
}

uint64_t REAudioFileAssetConfigurationDestroy()
{
  return MEMORY[0x270F1C7F0]();
}

uint64_t REAudioFileAssetConfigurationSetCalibrationLevel()
{
  return MEMORY[0x270F1C830]();
}

uint64_t REAudioFileAssetConfigurationSetCalibrationMode()
{
  return MEMORY[0x270F1C838]();
}

uint64_t REAudioFileAssetConfigurationSetInputMode()
{
  return MEMORY[0x270F1C840]();
}

uint64_t REAudioFileAssetConfigurationSetLayoutTag()
{
  return MEMORY[0x270F1C848]();
}

uint64_t REAudioFileAssetConfigurationSetMixGroupName()
{
  return MEMORY[0x270F1C850]();
}

uint64_t REAudioFileAssetConfigurationSetNormalizationMode()
{
  return MEMORY[0x270F1C858]();
}

uint64_t REAudioFileAssetConfigurationSetRandomizeStart()
{
  return MEMORY[0x270F1C860]();
}

uint64_t REAudioFileAssetConfigurationSetShouldLoop()
{
  return MEMORY[0x270F1C868]();
}

uint64_t REAudioFileAssetConfigurationSetStreaming()
{
  return MEMORY[0x270F1C870]();
}

uint64_t REAudioFileAssetConfigurationSetTargetLUFS()
{
  return MEMORY[0x270F1C878]();
}

uint64_t REAudioFileAssetCreateWithBufferAndConfiguration()
{
  return MEMORY[0x270F1C880]();
}

uint64_t REAudioFileAssetCreateWithDescriptor()
{
  return MEMORY[0x270F1C888]();
}

uint64_t REAudioFileAssetDescriptorCreateWithBundleResource()
{
  return MEMORY[0x270F1C8A0]();
}

uint64_t REAudioFileAssetDescriptorCreateWithURL()
{
  return MEMORY[0x270F1C8A8]();
}

uint64_t REAudioFileAssetGetAudioAssetID()
{
  return MEMORY[0x270F1C8B0]();
}

uint64_t REAudioFileAssetGetCalibrationLevel()
{
  return MEMORY[0x270F1C8B8]();
}

uint64_t REAudioFileAssetGetCalibrationMode()
{
  return MEMORY[0x270F1C8C0]();
}

uint64_t REAudioFileAssetGetInputMode()
{
  return MEMORY[0x270F1C8C8]();
}

uint64_t REAudioFileAssetGetLayoutTag()
{
  return MEMORY[0x270F1C8D0]();
}

uint64_t REAudioFileAssetGetLengthInSeconds()
{
  return MEMORY[0x270F1C8D8]();
}

uint64_t REAudioFileAssetGetLoopCount()
{
  return MEMORY[0x270F1C8E0]();
}

uint64_t REAudioFileAssetGetMixGroupName()
{
  return MEMORY[0x270F1C8E8]();
}

uint64_t REAudioFileAssetGetNormalizationMode()
{
  return MEMORY[0x270F1C8F0]();
}

uint64_t REAudioFileAssetGetRandomizeStart()
{
  return MEMORY[0x270F1C8F8]();
}

uint64_t REAudioFileAssetGetStreaming()
{
  return MEMORY[0x270F1C900]();
}

uint64_t REAudioFileAssetGetTargetLUFS()
{
  return MEMORY[0x270F1C908]();
}

uint64_t REAudioFileAssetIsCompletelyLoaded()
{
  return MEMORY[0x270F1C910]();
}

uint64_t REAudioFileAssetIsEqual()
{
  return MEMORY[0x270F1C918]();
}

uint64_t REAudioFileAssetSetInputMode()
{
  return MEMORY[0x270F1C928]();
}

uint64_t REAudioFileAssetSetLayoutTag()
{
  return MEMORY[0x270F1C930]();
}

uint64_t REAudioFileAssetSetLoopCount()
{
  return MEMORY[0x270F1C938]();
}

uint64_t REAudioFileAssetSetMixGroupName()
{
  return MEMORY[0x270F1C940]();
}

uint64_t REAudioFileGetAVAudioFormat()
{
  return MEMORY[0x270F1C950]();
}

uint64_t REAudioFileGroupAssetCreateWithFileAssets()
{
  return MEMORY[0x270F1C958]();
}

uint64_t REAudioFileGroupAssetGetAssetAtIndex()
{
  return MEMORY[0x270F1C960]();
}

uint64_t REAudioFileGroupAssetGetAssetCount()
{
  return MEMORY[0x270F1C968]();
}

uint64_t REAudioGeneratorAssetCreate()
{
  return MEMORY[0x270F1C970]();
}

uint64_t REAudioGeneratorAssetCreateWithRenderBlock()
{
  return MEMORY[0x270F1C978]();
}

uint64_t REAudioGeneratorAssetGetComponentDescription()
{
  return MEMORY[0x270F1C980]();
}

uint64_t REAudioGeneratorAssetSetComponentDescription()
{
  return MEMORY[0x270F1C988]();
}

uint64_t REAudioGeneratorAssetSetLayoutTag()
{
  return MEMORY[0x270F1C990]();
}

uint64_t REAudioGeneratorBlockConfigurationCreate()
{
  return MEMORY[0x270F1C998]();
}

uint64_t REAudioGeneratorBlockConfigurationDestroy()
{
  return MEMORY[0x270F1C9A0]();
}

uint64_t REAudioGeneratorBlockConfigurationSetLayoutTag()
{
  return MEMORY[0x270F1C9A8]();
}

uint64_t REAudioGeneratorBlockConfigurationSetMixGroupName()
{
  return MEMORY[0x270F1C9B0]();
}

uint64_t REAudioLibraryComponentCopyAssetNames()
{
  return MEMORY[0x270F1C9B8]();
}

uint64_t REAudioLibraryComponentGetAssetForName()
{
  return MEMORY[0x270F1C9C0]();
}

uint64_t REAudioLibraryComponentGetComponentType()
{
  return MEMORY[0x270F1C9C8]();
}

uint64_t REAudioLibraryComponentRegisterAsset()
{
  return MEMORY[0x270F1C9D0]();
}

uint64_t REAudioLibraryComponentUnregisterAsset()
{
  return MEMORY[0x270F1C9D8]();
}

uint64_t REAudioMixGroupsComponentAddMixGroup()
{
  return MEMORY[0x270F1C9E0]();
}

uint64_t REAudioMixGroupsComponentCreateMixGroupID()
{
  return MEMORY[0x270F1C9E8]();
}

uint64_t REAudioMixGroupsComponentFadeGroup()
{
  return MEMORY[0x270F1C9F0]();
}

uint64_t REAudioMixGroupsComponentGetComponentType()
{
  return MEMORY[0x270F1C9F8]();
}

uint64_t REAudioMixGroupsComponentGetGroups()
{
  return MEMORY[0x270F1CA00]();
}

uint64_t REAudioMixGroupsComponentHasGroup()
{
  return MEMORY[0x270F1CA08]();
}

uint64_t REAudioMixGroupsComponentRemoveGroup()
{
  return MEMORY[0x270F1CA10]();
}

uint64_t REAudioMixGroupsComponentUpdateGroup()
{
  return MEMORY[0x270F1CA18]();
}

uint64_t REAudioMixGroupsComponentUpdateGroupGain()
{
  return MEMORY[0x270F1CA20]();
}

uint64_t REAudioMixerComponentGetComponentType()
{
  return MEMORY[0x270F1CA28]();
}

uint64_t REAudioPlayerComponentAddDidChangeStateCallback()
{
  return MEMORY[0x270F1CA30]();
}

uint64_t REAudioPlayerComponentCleanupToken()
{
  return MEMORY[0x270F1CA38]();
}

uint64_t REAudioPlayerComponentCopySizeOfAudioPlayerComponentFromEntity()
{
  return MEMORY[0x270F1CA40]();
}

uint64_t REAudioPlayerComponentCopySourceClockOrTimebase()
{
  return MEMORY[0x270F1CA48]();
}

uint64_t REAudioPlayerComponentFadeTokenToGainWithDuration()
{
  return MEMORY[0x270F1CA50]();
}

uint64_t REAudioPlayerComponentGetAudioUnitForToken()
{
  return MEMORY[0x270F1CA58]();
}

uint64_t REAudioPlayerComponentGetComponentType()
{
  return MEMORY[0x270F1CA60]();
}

uint64_t REAudioPlayerComponentGetDecibelGainForToken()
{
  return MEMORY[0x270F1CA68]();
}

uint64_t REAudioPlayerComponentGetDirectSendLevelForToken()
{
  return MEMORY[0x270F1CA70]();
}

uint64_t REAudioPlayerComponentGetPlaybackRateForToken()
{
  return MEMORY[0x270F1CA78]();
}

uint64_t REAudioPlayerComponentGetReverbSendLevelForToken()
{
  return MEMORY[0x270F1CA80]();
}

uint64_t REAudioPlayerComponentIsStreamPendingPlay()
{
  return MEMORY[0x270F1CA88]();
}

uint64_t REAudioPlayerComponentIsStreamPlaying()
{
  return MEMORY[0x270F1CA90]();
}

uint64_t REAudioPlayerComponentPauseToken()
{
  return MEMORY[0x270F1CA98]();
}

uint64_t REAudioPlayerComponentPlayToken()
{
  return MEMORY[0x270F1CAA0]();
}

uint64_t REAudioPlayerComponentPlaybackPositionForToken()
{
  return MEMORY[0x270F1CAA8]();
}

uint64_t REAudioPlayerComponentPrepareAsset()
{
  return MEMORY[0x270F1CAB0]();
}

uint64_t REAudioPlayerComponentRegisterAsset()
{
  return MEMORY[0x270F1CAB8]();
}

uint64_t REAudioPlayerComponentRemoveCallback()
{
  return MEMORY[0x270F1CAC0]();
}

uint64_t REAudioPlayerComponentSetCompletionHandler()
{
  return MEMORY[0x270F1CAC8]();
}

uint64_t REAudioPlayerComponentSetDecibelGainForToken()
{
  return MEMORY[0x270F1CAD0]();
}

uint64_t REAudioPlayerComponentSetDidPrepareAudioUnitCallback()
{
  return MEMORY[0x270F1CAD8]();
}

uint64_t REAudioPlayerComponentSetDirectSendLevelForToken()
{
  return MEMORY[0x270F1CAE0]();
}

uint64_t REAudioPlayerComponentSetLinearGainForToken()
{
  return MEMORY[0x270F1CAE8]();
}

uint64_t REAudioPlayerComponentSetOneShotSound()
{
  return MEMORY[0x270F1CAF0]();
}

uint64_t REAudioPlayerComponentSetPlaybackPositionForToken()
{
  return MEMORY[0x270F1CAF8]();
}

uint64_t REAudioPlayerComponentSetPlaybackRateForToken()
{
  return MEMORY[0x270F1CB00]();
}

uint64_t REAudioPlayerComponentSetRemoveFromSceneCallback()
{
  return MEMORY[0x270F1CB08]();
}

uint64_t REAudioPlayerComponentSetReverbSendLevelForToken()
{
  return MEMORY[0x270F1CB10]();
}

uint64_t REAudioPlayerComponentSetSourceClockOrTimebase()
{
  return MEMORY[0x270F1CB18]();
}

uint64_t REAudioPlayerComponentStopAll()
{
  return MEMORY[0x270F1CB20]();
}

uint64_t REAudioPlayerComponentStopToken()
{
  return MEMORY[0x270F1CB28]();
}

uint64_t REAudioSceneServiceSetExternalSourceControl()
{
  return MEMORY[0x270F1CB30]();
}

uint64_t REAudioSceneServiceSetSTSControl()
{
  return MEMORY[0x270F1CB38]();
}

uint64_t REAudioServiceInsertPostProcessingEffect()
{
  return MEMORY[0x270F1CB40]();
}

uint64_t REAudioServiceStartAudioEngine()
{
  return MEMORY[0x270F1CB48]();
}

uint64_t REAudioServiceStopAudioEngine()
{
  return MEMORY[0x270F1CB50]();
}

uint64_t REBillboardComponentGetBlendFactor()
{
  return MEMORY[0x270F1CB60]();
}

uint64_t REBillboardComponentGetComponentType()
{
  return MEMORY[0x270F1CB68]();
}

uint64_t REBillboardComponentGetForwardDirection()
{
  return MEMORY[0x270F1CB70]();
}

uint64_t REBillboardComponentGetRotationAxis()
{
  return MEMORY[0x270F1CB78]();
}

uint64_t REBillboardComponentGetUpDirection()
{
  return MEMORY[0x270F1CB80]();
}

uint64_t REBillboardComponentGetUseRotationAxis()
{
  return MEMORY[0x270F1CB88]();
}

uint64_t REBillboardComponentGetUseUpDirection()
{
  return MEMORY[0x270F1CB90]();
}

uint64_t REBillboardComponentSetBlendFactor()
{
  return MEMORY[0x270F1CB98]();
}

uint64_t REBillboardComponentSetForwardDirection()
{
  return MEMORY[0x270F1CBA0]();
}

uint64_t REBillboardComponentSetRotationAxis()
{
  return MEMORY[0x270F1CBA8]();
}

uint64_t REBillboardComponentSetUpDirection()
{
  return MEMORY[0x270F1CBB0]();
}

uint64_t REBillboardComponentSetUseRotationAxis()
{
  return MEMORY[0x270F1CBB8]();
}

uint64_t REBillboardComponentSetUseUpDirection()
{
  return MEMORY[0x270F1CBC0]();
}

uint64_t REBindKeyEscape()
{
  return MEMORY[0x270F1CBC8]();
}

uint64_t REBindKeyUnescape()
{
  return MEMORY[0x270F1CBD0]();
}

uint64_t REBindPointBoundComponent()
{
  return MEMORY[0x270F1CBD8]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesDouble()
{
  return MEMORY[0x270F1CBE0]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesDouble2()
{
  return MEMORY[0x270F1CBE8]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesDouble3()
{
  return MEMORY[0x270F1CBF0]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesDouble4()
{
  return MEMORY[0x270F1CBF8]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesFloat()
{
  return MEMORY[0x270F1CC00]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesFloat2()
{
  return MEMORY[0x270F1CC08]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesFloat3()
{
  return MEMORY[0x270F1CC10]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesFloat4()
{
  return MEMORY[0x270F1CC18]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesInt64()
{
  return MEMORY[0x270F1CC20]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesSRT()
{
  return MEMORY[0x270F1CC28]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesUInt16()
{
  return MEMORY[0x270F1CC30]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesUInt32()
{
  return MEMORY[0x270F1CC38]();
}

uint64_t REBindPointCreateReferenceForEntityAnimatedValuesUInt8()
{
  return MEMORY[0x270F1CC40]();
}

uint64_t REBindPointCreateReferenceForEntityDouble()
{
  return MEMORY[0x270F1CC48]();
}

uint64_t REBindPointCreateReferenceForEntityDouble2()
{
  return MEMORY[0x270F1CC50]();
}

uint64_t REBindPointCreateReferenceForEntityDouble3()
{
  return MEMORY[0x270F1CC58]();
}

uint64_t REBindPointCreateReferenceForEntityDouble4()
{
  return MEMORY[0x270F1CC60]();
}

uint64_t REBindPointCreateReferenceForEntityFloat()
{
  return MEMORY[0x270F1CC68]();
}

uint64_t REBindPointCreateReferenceForEntityFloat2()
{
  return MEMORY[0x270F1CC70]();
}

uint64_t REBindPointCreateReferenceForEntityFloat3()
{
  return MEMORY[0x270F1CC78]();
}

uint64_t REBindPointCreateReferenceForEntityFloat4()
{
  return MEMORY[0x270F1CC80]();
}

uint64_t REBindPointCreateReferenceForEntityInt64()
{
  return MEMORY[0x270F1CC88]();
}

uint64_t REBindPointCreateReferenceForEntityUInt16()
{
  return MEMORY[0x270F1CC90]();
}

uint64_t REBindPointCreateReferenceForEntityUInt32()
{
  return MEMORY[0x270F1CC98]();
}

uint64_t REBindPointCreateReferenceForEntityUInt8()
{
  return MEMORY[0x270F1CCA0]();
}

uint64_t REBindPointDestroy()
{
  return MEMORY[0x270F1CCA8]();
}

uint64_t REBindPointGetBool()
{
  return MEMORY[0x270F1CCB0]();
}

uint64_t REBindPointGetDouble()
{
  return MEMORY[0x270F1CCB8]();
}

uint64_t REBindPointGetDouble2()
{
  return MEMORY[0x270F1CCC0]();
}

uint64_t REBindPointGetDouble3()
{
  return MEMORY[0x270F1CCC8]();
}

uint64_t REBindPointGetDouble4()
{
  return MEMORY[0x270F1CCD0]();
}

uint64_t REBindPointGetFloat()
{
  return MEMORY[0x270F1CCD8]();
}

uint64_t REBindPointGetFloat2()
{
  return MEMORY[0x270F1CCE0]();
}

uint64_t REBindPointGetFloat3()
{
  return MEMORY[0x270F1CCE8]();
}

uint64_t REBindPointGetFloat4()
{
  return MEMORY[0x270F1CCF0]();
}

uint64_t REBindPointGetInt64()
{
  return MEMORY[0x270F1CCF8]();
}

uint64_t REBindPointGetQuatF()
{
  return MEMORY[0x270F1CD00]();
}

uint64_t REBindPointGetSRT()
{
  return MEMORY[0x270F1CD08]();
}

uint64_t REBindPointGetString()
{
  return MEMORY[0x270F1CD10]();
}

uint64_t REBindPointIsOverrideEnabled()
{
  return MEMORY[0x270F1CD18]();
}

uint64_t REBindPointIsValid()
{
  return MEMORY[0x270F1CD20]();
}

uint64_t REBindPointSetBool()
{
  return MEMORY[0x270F1CD28]();
}

uint64_t REBindPointSetDouble()
{
  return MEMORY[0x270F1CD30]();
}

uint64_t REBindPointSetDouble2()
{
  return MEMORY[0x270F1CD38]();
}

uint64_t REBindPointSetDouble3()
{
  return MEMORY[0x270F1CD40]();
}

uint64_t REBindPointSetDouble4()
{
  return MEMORY[0x270F1CD48]();
}

uint64_t REBindPointSetFloat()
{
  return MEMORY[0x270F1CD50]();
}

uint64_t REBindPointSetFloat2()
{
  return MEMORY[0x270F1CD58]();
}

uint64_t REBindPointSetFloat3()
{
  return MEMORY[0x270F1CD60]();
}

uint64_t REBindPointSetFloat4()
{
  return MEMORY[0x270F1CD68]();
}

uint64_t REBindPointSetInt16()
{
  return MEMORY[0x270F1CD70]();
}

uint64_t REBindPointSetInt32()
{
  return MEMORY[0x270F1CD78]();
}

uint64_t REBindPointSetInt64()
{
  return MEMORY[0x270F1CD80]();
}

uint64_t REBindPointSetInt8()
{
  return MEMORY[0x270F1CD88]();
}

uint64_t REBindPointSetOverrideEnabled()
{
  return MEMORY[0x270F1CD90]();
}

uint64_t REBindPointSetQuatF()
{
  return MEMORY[0x270F1CD98]();
}

uint64_t REBindPointSetSRT()
{
  return MEMORY[0x270F1CDA0]();
}

uint64_t REBindPointSetString()
{
  return MEMORY[0x270F1CDA8]();
}

uint64_t REBindPointSetUInt16()
{
  return MEMORY[0x270F1CDB0]();
}

uint64_t REBindPointSetUInt32()
{
  return MEMORY[0x270F1CDB8]();
}

uint64_t REBindPointSetUInt8()
{
  return MEMORY[0x270F1CDC0]();
}

uint64_t REBlendShapeWeightsComponentGetBlendShapeWeightsCount()
{
  return MEMORY[0x270F1CDC8]();
}

uint64_t REBlendShapeWeightsComponentGetBlendShapeWeightsDefinition()
{
  return MEMORY[0x270F1CDD0]();
}

uint64_t REBlendShapeWeightsComponentGetBlendWeight()
{
  return MEMORY[0x270F1CDD8]();
}

uint64_t REBlendShapeWeightsComponentGetBlendWeightCount()
{
  return MEMORY[0x270F1CDE0]();
}

uint64_t REBlendShapeWeightsComponentGetBlendWeights()
{
  return MEMORY[0x270F1CDE8]();
}

uint64_t REBlendShapeWeightsComponentGetComponentType()
{
  return MEMORY[0x270F1CDF0]();
}

uint64_t REBlendShapeWeightsComponentSetBlendShapeWeightsDefinition()
{
  return MEMORY[0x270F1CE00]();
}

uint64_t REBlendShapeWeightsComponentSetBlendWeight()
{
  return MEMORY[0x270F1CE08]();
}

uint64_t REBlendShapeWeightsDefinitionAssetCreateAssetForMesh()
{
  return MEMORY[0x270F1CE18]();
}

uint64_t REBlendShapeWeightsDefinitionAssetCreateAssetWithDefinitions()
{
  return MEMORY[0x270F1CE20]();
}

uint64_t REBlendShapeWeightsDefinitionAssetCreateAssetWithDefinitionsAndWeightNames()
{
  return MEMORY[0x270F1CE28]();
}

uint64_t REBlendShapeWeightsDefinitionAssetGetBlendShapeName()
{
  return MEMORY[0x270F1CE30]();
}

uint64_t REBlendShapeWeightsDefinitionAssetGetBlendShapeWeightsCount()
{
  return MEMORY[0x270F1CE38]();
}

uint64_t REBlendShapeWeightsDefinitionAssetGetBlendShapeWeightsMeshMap()
{
  return MEMORY[0x270F1CE40]();
}

uint64_t REBlendShapeWeightsDefinitionAssetGetBlendShapeWeightsMeshMapCount()
{
  return MEMORY[0x270F1CE48]();
}

uint64_t REBlendShapeWeightsDefinitionAssetGetBlendWeightCount()
{
  return MEMORY[0x270F1CE50]();
}

uint64_t REBlendShapeWeightsDefinitionAssetGetBlendWeightName()
{
  return MEMORY[0x270F1CE58]();
}

uint64_t REBodyTrackingComponentGetComponentType()
{
  return MEMORY[0x270F1CE60]();
}

uint64_t REBodyTrackingComponentGetTargetBodyIdentifier()
{
  return MEMORY[0x270F1CE68]();
}

uint64_t REBodyTrackingComponentGetTargetType()
{
  return MEMORY[0x270F1CE70]();
}

uint64_t REBodyTrackingComponentIsPaused()
{
  return MEMORY[0x270F1CE78]();
}

uint64_t REBodyTrackingComponentSetIsPaused()
{
  return MEMORY[0x270F1CE80]();
}

uint64_t REBodyTrackingComponentSetTargetBodyIdentifier()
{
  return MEMORY[0x270F1CE88]();
}

uint64_t REBodyTrackingComponentSetTargetType()
{
  return MEMORY[0x270F1CE90]();
}

uint64_t REBoxShapeCreate()
{
  return MEMORY[0x270F1CE98]();
}

uint64_t REBoxShapeGetExtent()
{
  return MEMORY[0x270F1CEA0]();
}

uint64_t REBuiltinTextureAssetDescriptorCreate()
{
  return MEMORY[0x270F1CEA8]();
}

uint64_t RECGColorToColorGamut()
{
  return MEMORY[0x270F1CEB0]();
}

uint64_t RECIntrospectionAlloc()
{
  return MEMORY[0x270F1CEB8]();
}

uint64_t RECIntrospectionFree()
{
  return MEMORY[0x270F1CED0]();
}

uint64_t RECIntrospectionStructRegister()
{
  return MEMORY[0x270F1CED8]();
}

uint64_t RECIntrospectionStructUnregister()
{
  return MEMORY[0x270F1CEE0]();
}

uint64_t RECameraViewDescriptorsComponentAddSpecifyCommandFromTexture()
{
  return MEMORY[0x270F1CEF8]();
}

uint64_t RECameraViewDescriptorsComponentAddViewDescriptor()
{
  return MEMORY[0x270F1CF00]();
}

uint64_t RECameraViewDescriptorsComponentCameraViewDescriptorCopySettingStruct()
{
  return MEMORY[0x270F1CF08]();
}

uint64_t RECameraViewDescriptorsComponentCameraViewDescriptorSetSettingStruct()
{
  return MEMORY[0x270F1CF10]();
}

uint64_t RECameraViewDescriptorsComponentCameraViewDescriptorSetViewport()
{
  return MEMORY[0x270F1CF18]();
}

uint64_t RECameraViewDescriptorsComponentClearCameraViewDescriptors()
{
  return MEMORY[0x270F1CF20]();
}

uint64_t RECameraViewDescriptorsComponentGetComponentType()
{
  return MEMORY[0x270F1CF28]();
}

uint64_t RECameraViewDescriptorsComponentSetForceWaitOnPipelineCompilation()
{
  return MEMORY[0x270F1CF38]();
}

uint64_t RECameraViewDescriptorsComponentSetRasterizationRateMap()
{
  return MEMORY[0x270F1CF40]();
}

uint64_t RECameraViewDescriptorsComponentSetRenderOrder()
{
  return MEMORY[0x270F1CF48]();
}

uint64_t RECameraViewDescriptorsComponentSetViewMode()
{
  return MEMORY[0x270F1CF50]();
}

uint64_t RECapsuleShapeCreate()
{
  return MEMORY[0x270F1CF58]();
}

uint64_t RECapsuleShapeGetHeight()
{
  return MEMORY[0x270F1CF60]();
}

uint64_t RECapsuleShapeGetRadius()
{
  return MEMORY[0x270F1CF68]();
}

uint64_t REChannelAudioComponentGetComponentType()
{
  return MEMORY[0x270F1CF70]();
}

uint64_t REChannelAudioComponentGetDecibelGain()
{
  return MEMORY[0x270F1CF78]();
}

uint64_t REChannelAudioComponentSetDecibelGain()
{
  return MEMORY[0x270F1CF80]();
}

uint64_t RECharacterControllerCollisionResultGetCollisionCount()
{
  return MEMORY[0x270F1CF88]();
}

uint64_t RECharacterControllerCollisionResultGetHitEntityAtCollisionIndex()
{
  return MEMORY[0x270F1CF90]();
}

uint64_t RECharacterControllerCollisionResultGetHitFlags()
{
  return MEMORY[0x270F1CF98]();
}

uint64_t RECharacterControllerCollisionResultGetHitNormalAtCollisionIndex()
{
  return MEMORY[0x270F1CFA0]();
}

uint64_t RECharacterControllerCollisionResultGetHitPositionAtCollisionIndex()
{
  return MEMORY[0x270F1CFA8]();
}

uint64_t RECharacterControllerCollisionResultGetMoveDirectionAtCollisionIndex()
{
  return MEMORY[0x270F1CFB0]();
}

uint64_t RECharacterControllerCollisionResultGetMoveDistanceAtCollisionIndex()
{
  return MEMORY[0x270F1CFB8]();
}

uint64_t RECharacterControllerComponentGetCollisionGroup()
{
  return MEMORY[0x270F1CFC0]();
}

uint64_t RECharacterControllerComponentGetCollisionMask()
{
  return MEMORY[0x270F1CFC8]();
}

uint64_t RECharacterControllerComponentGetComponentType()
{
  return MEMORY[0x270F1CFD0]();
}

uint64_t RECharacterControllerComponentGetHeight()
{
  return MEMORY[0x270F1CFD8]();
}

uint64_t RECharacterControllerComponentGetRadius()
{
  return MEMORY[0x270F1CFE0]();
}

uint64_t RECharacterControllerComponentGetSkinWidth()
{
  return MEMORY[0x270F1CFE8]();
}

uint64_t RECharacterControllerComponentGetSlopeLimit()
{
  return MEMORY[0x270F1CFF0]();
}

uint64_t RECharacterControllerComponentGetStepLimit()
{
  return MEMORY[0x270F1CFF8]();
}

uint64_t RECharacterControllerComponentGetUpVector()
{
  return MEMORY[0x270F1D000]();
}

uint64_t RECharacterControllerComponentGetVelocity()
{
  return MEMORY[0x270F1D008]();
}

uint64_t RECharacterControllerComponentMoveEx()
{
  return MEMORY[0x270F1D010]();
}

uint64_t RECharacterControllerComponentOnGround()
{
  return MEMORY[0x270F1D018]();
}

uint64_t RECharacterControllerComponentSetCollisionFilter()
{
  return MEMORY[0x270F1D020]();
}

uint64_t RECharacterControllerComponentSetHeight()
{
  return MEMORY[0x270F1D028]();
}

uint64_t RECharacterControllerComponentSetPosition()
{
  return MEMORY[0x270F1D030]();
}

uint64_t RECharacterControllerComponentSetRadius()
{
  return MEMORY[0x270F1D038]();
}

uint64_t RECharacterControllerComponentSetSkinWidth()
{
  return MEMORY[0x270F1D040]();
}

uint64_t RECharacterControllerComponentSetSlopeLimit()
{
  return MEMORY[0x270F1D048]();
}

uint64_t RECharacterControllerComponentSetStepLimit()
{
  return MEMORY[0x270F1D050]();
}

uint64_t RECharacterControllerComponentSetUpVector()
{
  return MEMORY[0x270F1D058]();
}

uint64_t RECharacterControllerComponentStateGetComponentType()
{
  return MEMORY[0x270F1D060]();
}

uint64_t REClippingPrimitiveComponentClipToBox()
{
  return MEMORY[0x270F1D0A8]();
}

uint64_t REClippingPrimitiveComponentGetComponentType()
{
  return MEMORY[0x270F1D0B0]();
}

uint64_t REClippingPrimitiveComponentGetFeatherIntervalFractionPerNegativeEdge()
{
  return MEMORY[0x270F1D0B8]();
}

uint64_t REClippingPrimitiveComponentGetFeatherIntervalFractionPerPositiveEdge()
{
  return MEMORY[0x270F1D0C0]();
}

uint64_t REClippingPrimitiveComponentGetFeatherUseCubicFalloff()
{
  return MEMORY[0x270F1D0C8]();
}

uint64_t REClippingPrimitiveComponentGetLocalBounds()
{
  return MEMORY[0x270F1D0D0]();
}

uint64_t REClippingPrimitiveComponentGetShouldClipChildren()
{
  return MEMORY[0x270F1D0D8]();
}

uint64_t REClippingPrimitiveComponentGetShouldClipSelf()
{
  return MEMORY[0x270F1D0E0]();
}

uint64_t REClippingPrimitiveComponentSetFeatherIntervalFractionPerEdge()
{
  return MEMORY[0x270F1D0E8]();
}

uint64_t REClippingPrimitiveComponentSetFeatherUseCubicFalloff()
{
  return MEMORY[0x270F1D0F0]();
}

uint64_t REClippingPrimitiveComponentSetShouldClipChildren()
{
  return MEMORY[0x270F1D0F8]();
}

uint64_t REClippingPrimitiveComponentSetShouldClipSelf()
{
  return MEMORY[0x270F1D100]();
}

uint64_t REColliderComponentGetCollisionObject()
{
  return MEMORY[0x270F1D108]();
}

uint64_t REColliderComponentGetComponentType()
{
  return MEMORY[0x270F1D110]();
}

uint64_t REColliderComponentGetGroup()
{
  return MEMORY[0x270F1D118]();
}

uint64_t REColliderComponentGetInteractionType()
{
  return MEMORY[0x270F1D120]();
}

uint64_t REColliderComponentGetMask()
{
  return MEMORY[0x270F1D128]();
}

uint64_t REColliderComponentGetShape()
{
  return MEMORY[0x270F1D130]();
}

uint64_t REColliderComponentSetGroup()
{
  return MEMORY[0x270F1D138]();
}

uint64_t REColliderComponentSetInteractionType()
{
  return MEMORY[0x270F1D140]();
}

uint64_t REColliderComponentSetMask()
{
  return MEMORY[0x270F1D148]();
}

uint64_t REColliderComponentSetShape()
{
  return MEMORY[0x270F1D150]();
}

uint64_t RECollisionCastConfigurationInitToDefault()
{
  return MEMORY[0x270F1D158]();
}

uint64_t RECollisionCastConfigurationSetFilter()
{
  return MEMORY[0x270F1D160]();
}

uint64_t RECollisionCastConfigurationSetQueryType()
{
  return MEMORY[0x270F1D168]();
}

uint64_t RECollisionCastConvexVsEntitySimulation()
{
  return MEMORY[0x270F1D170]();
}

uint64_t RECollisionCastConvexVsScene()
{
  return MEMORY[0x270F1D178]();
}

uint64_t RECollisionCastHitCollectionCount()
{
  return MEMORY[0x270F1D180]();
}

uint64_t RECollisionCastHitCollectionCreate()
{
  return MEMORY[0x270F1D188]();
}

uint64_t RECollisionCastHitCollectionDestroy()
{
  return MEMORY[0x270F1D190]();
}

uint64_t RECollisionCastHitCollectionGetByIndex()
{
  return MEMORY[0x270F1D198]();
}

uint64_t RECollisionCastHitGetFaceIndex()
{
  return MEMORY[0x270F1D1A0]();
}

uint64_t RECollisionCastHitGetFaceUV()
{
  return MEMORY[0x270F1D1A8]();
}

uint64_t RECollisionCastHitGetHitPercentage()
{
  return MEMORY[0x270F1D1B0]();
}

uint64_t RECollisionCastHitGetNormal()
{
  return MEMORY[0x270F1D1B8]();
}

uint64_t RECollisionCastHitGetObject()
{
  return MEMORY[0x270F1D1C0]();
}

uint64_t RECollisionCastHitGetPosition()
{
  return MEMORY[0x270F1D1C8]();
}

uint64_t RECollisionCastHitGetShapeIndex()
{
  return MEMORY[0x270F1D1D0]();
}

uint64_t RECollisionCastHitHasTriangleMeshHitInfo()
{
  return MEMORY[0x270F1D1D8]();
}

uint64_t RECollisionCastRayVsEntitySimulation()
{
  return MEMORY[0x270F1D1E0]();
}

uint64_t RECollisionCastRayVsScene()
{
  return MEMORY[0x270F1D1E8]();
}

uint64_t RECollisionMeshCreateFromSIMDPositions()
{
  return MEMORY[0x270F1D1F0]();
}

uint64_t RECollisionMeshCreateWithFormatV2()
{
  return MEMORY[0x270F1D200]();
}

uint64_t RECollisionMeshExtractIndices()
{
  return MEMORY[0x270F1D210]();
}

uint64_t RECollisionMeshExtractVertexPositions()
{
  return MEMORY[0x270F1D218]();
}

uint64_t RECollisionMeshGetIndexCount()
{
  return MEMORY[0x270F1D220]();
}

uint64_t RECollisionMeshGetVertexCount()
{
  return MEMORY[0x270F1D228]();
}

uint64_t RECollisionMeshShapeGetMesh()
{
  return MEMORY[0x270F1D230]();
}

uint64_t RECollisionObjectCreate()
{
  return MEMORY[0x270F1D238]();
}

uint64_t RECollisionObjectDestroy()
{
  return MEMORY[0x270F1D240]();
}

uint64_t RECollisionObjectGetEntity()
{
  return MEMORY[0x270F1D248]();
}

uint64_t RECollisionObjectGetShape()
{
  return MEMORY[0x270F1D250]();
}

uint64_t RECollisionObjectGetUserData()
{
  return MEMORY[0x270F1D258]();
}

uint64_t RECollisionObjectSetPose()
{
  return MEMORY[0x270F1D260]();
}

uint64_t RECollisionShapeAssetGetCollisionShape()
{
  return MEMORY[0x270F1D268]();
}

uint64_t RECollisionShapeAssetGetType()
{
  return MEMORY[0x270F1D270]();
}

uint64_t RECollisionShapeDestroy()
{
  return MEMORY[0x270F1D278]();
}

uint64_t RECollisionShapeGetBoundingBox()
{
  return MEMORY[0x270F1D280]();
}

uint64_t RECollisionShapeGetType()
{
  return MEMORY[0x270F1D288]();
}

uint64_t RECollisionWorldGetContactsObjectVsEntitySimulationAdHoc()
{
  return MEMORY[0x270F1D290]();
}

uint64_t RECollisionWorldGetContactsObjectVsSceneAdHoc()
{
  return MEMORY[0x270F1D298]();
}

uint64_t REComponentClassFromType()
{
  return MEMORY[0x270F1D2B0]();
}

uint64_t REComponentCreateByClass()
{
  return MEMORY[0x270F1D2D0]();
}

uint64_t REComponentCreateByType()
{
  return MEMORY[0x270F1D2D8]();
}

uint64_t REComponentGetClass()
{
  return MEMORY[0x270F1D2E8]();
}

uint64_t REComponentGetEntity()
{
  return MEMORY[0x270F1D2F0]();
}

uint64_t REComponentQueryDestroy()
{
  return MEMORY[0x270F1D308]();
}

uint64_t REComponentTypeSetCloneCallback()
{
  return MEMORY[0x270F1D318]();
}

uint64_t REComposeMatrix()
{
  return MEMORY[0x270F1D320]();
}

uint64_t RECompoundShapeAssetGetChildCount()
{
  return MEMORY[0x270F1D328]();
}

uint64_t RECompoundShapeAssetGetChildPose()
{
  return MEMORY[0x270F1D330]();
}

uint64_t RECompoundShapeAssetGetChildShape()
{
  return MEMORY[0x270F1D338]();
}

uint64_t REConeShapeGetHeight()
{
  return MEMORY[0x270F1D340]();
}

uint64_t REConeShapeGetRadius()
{
  return MEMORY[0x270F1D348]();
}

uint64_t REContactSetCollectionCreate()
{
  return MEMORY[0x270F1D350]();
}

uint64_t REContactSetCollectionDestroy()
{
  return MEMORY[0x270F1D358]();
}

uint64_t REContactSetCollectionGetIterator()
{
  return MEMORY[0x270F1D360]();
}

uint64_t REContactSetCollectionIteratorCurrent()
{
  return MEMORY[0x270F1D368]();
}

uint64_t REContactSetCollectionIteratorNext()
{
  return MEMORY[0x270F1D370]();
}

uint64_t REContactSetCount()
{
  return MEMORY[0x270F1D378]();
}

uint64_t REContactSetGetAveragePosition()
{
  return MEMORY[0x270F1D380]();
}

uint64_t REContactSetGetImpulse()
{
  return MEMORY[0x270F1D388]();
}

uint64_t REContactSetGetMaxPenetrationDepth()
{
  return MEMORY[0x270F1D390]();
}

uint64_t REContactSetGetNormal()
{
  return MEMORY[0x270F1D398]();
}

uint64_t REContactSetGetPenetrationDepth()
{
  return MEMORY[0x270F1D3A0]();
}

uint64_t REContactSetGetPositionAWorld()
{
  return MEMORY[0x270F1D3A8]();
}

uint64_t REContactSetGetPositionBWorld()
{
  return MEMORY[0x270F1D3B0]();
}

uint64_t REContactSetGetTotalImpulse()
{
  return MEMORY[0x270F1D3B8]();
}

uint64_t REContactSetHasContact()
{
  return MEMORY[0x270F1D3C0]();
}

uint64_t REContactSetNeedsSwap()
{
  return MEMORY[0x270F1D3C8]();
}

uint64_t REContactSetObjectA()
{
  return MEMORY[0x270F1D3D0]();
}

uint64_t REContactSetObjectB()
{
  return MEMORY[0x270F1D3D8]();
}

uint64_t REConvertIntrinsicEulersToMatrices3x3()
{
  return MEMORY[0x270F1D3E0]();
}

uint64_t REConvexPolyhedronShapeCreateNullable()
{
  return MEMORY[0x270F1D3F0]();
}

uint64_t REConvexPolyhedronShapeExtractMeshTriangleIndices()
{
  return MEMORY[0x270F1D3F8]();
}

uint64_t REConvexPolyhedronShapeExtractPositions()
{
  return MEMORY[0x270F1D400]();
}

uint64_t REConvexPolyhedronShapeGetPositionCount()
{
  return MEMORY[0x270F1D408]();
}

uint64_t RECreateBackEase()
{
  return MEMORY[0x270F1D418]();
}

uint64_t RECreateBackEaseEx()
{
  return MEMORY[0x270F1D420]();
}

uint64_t RECreateBounceEase()
{
  return MEMORY[0x270F1D428]();
}

uint64_t RECreateBounceEaseEx()
{
  return MEMORY[0x270F1D430]();
}

uint64_t RECreateCGColorFromColorGamut()
{
  return MEMORY[0x270F1D438]();
}

uint64_t RECreateCircleEase()
{
  return MEMORY[0x270F1D440]();
}

uint64_t RECreateCircleEaseEx()
{
  return MEMORY[0x270F1D448]();
}

uint64_t RECreateCubeTextureDataFromLatLong()
{
  return MEMORY[0x270F1D450]();
}

uint64_t RECreateCubicBezierEaseEx()
{
  return MEMORY[0x270F1D458]();
}

uint64_t RECreateElasticEase()
{
  return MEMORY[0x270F1D460]();
}

uint64_t RECreateElasticEaseEx()
{
  return MEMORY[0x270F1D468]();
}

uint64_t RECreateExponentialEase()
{
  return MEMORY[0x270F1D470]();
}

uint64_t RECreateExponentialEaseEx()
{
  return MEMORY[0x270F1D478]();
}

uint64_t RECreateHermiteEase()
{
  return MEMORY[0x270F1D480]();
}

uint64_t RECreateHermiteEaseEx()
{
  return MEMORY[0x270F1D488]();
}

uint64_t RECreateLoadTraceTypeBitFieldSignpostArg()
{
  return MEMORY[0x270F1D490]();
}

uint64_t RECreateLogarithmicEase()
{
  return MEMORY[0x270F1D498]();
}

uint64_t RECreateLogarithmicEaseEx()
{
  return MEMORY[0x270F1D4A0]();
}

uint64_t RECreateMeshSortGroup()
{
  return MEMORY[0x270F1D4A8]();
}

uint64_t RECreatePowerEase()
{
  return MEMORY[0x270F1D4B0]();
}

uint64_t RECreatePowerEaseEx()
{
  return MEMORY[0x270F1D4B8]();
}

uint64_t RECreateSineEase()
{
  return MEMORY[0x270F1D4C0]();
}

uint64_t RECreateSineEaseEx()
{
  return MEMORY[0x270F1D4C8]();
}

uint64_t RECreateWorldRoot()
{
  return MEMORY[0x270F1D4D0]();
}

uint64_t RECustomComponentGetObject()
{
  return MEMORY[0x270F1D4D8]();
}

uint64_t RECustomComponentTypeCreate()
{
  return MEMORY[0x270F1D4E8]();
}

uint64_t RECustomComponentTypeCreateWithIsTransient()
{
  return MEMORY[0x270F1D4F0]();
}

uint64_t RECustomComponentTypeDestroy()
{
  return MEMORY[0x270F1D4F8]();
}

uint64_t RECustomComponentTypeGetObjectIntrospection()
{
  return MEMORY[0x270F1D508]();
}

uint64_t RECustomMatrixCameraComponentCalculateWorldPose()
{
  return MEMORY[0x270F1D520]();
}

uint64_t RECustomMatrixCameraComponentGetComponentType()
{
  return MEMORY[0x270F1D528]();
}

uint64_t RECustomMatrixCameraComponentGetLocalEyePose()
{
  return MEMORY[0x270F1D530]();
}

uint64_t RECustomMatrixCameraComponentGetProjectionMatrix()
{
  return MEMORY[0x270F1D538]();
}

uint64_t RECustomMatrixCameraComponentSetAutoFitFullScreenAspect()
{
  return MEMORY[0x270F1D540]();
}

uint64_t RECustomMatrixCameraComponentSetLocalEyePose()
{
  return MEMORY[0x270F1D548]();
}

uint64_t RECustomMatrixCameraComponentSetProjectionFromMatrix()
{
  return MEMORY[0x270F1D550]();
}

uint64_t RECustomSkeletalPoseID()
{
  return MEMORY[0x270F1D558]();
}

uint64_t RECustomSystemAnimationPlaybackID()
{
  return MEMORY[0x270F1D560]();
}

uint64_t RECustomSystemEnqueueUpdateWithDeadline()
{
  return MEMORY[0x270F1D568]();
}

uint64_t RECustomSystemGetSwiftSystemForScene()
{
  return MEMORY[0x270F1D570]();
}

uint64_t RECustomSystemMeshDeformerID()
{
  return MEMORY[0x270F1D578]();
}

uint64_t RECustomSystemNetworkReceiveID()
{
  return MEMORY[0x270F1D580]();
}

uint64_t RECustomSystemNetworkSendID()
{
  return MEMORY[0x270F1D588]();
}

uint64_t RECustomSystemPhysicsID()
{
  return MEMORY[0x270F1D590]();
}

uint64_t RECustomSystemSetScheduleType()
{
  return MEMORY[0x270F1D5A0]();
}

uint64_t RECustomSystemSetUpdateInterval()
{
  return MEMORY[0x270F1D5A8]();
}

uint64_t RECustomSystemUpdateContextGetDeltaTime()
{
  return MEMORY[0x270F1D5B0]();
}

uint64_t RECustomSystemUpdateContextGetSystemsArePausedInEditor()
{
  return MEMORY[0x270F1D5B8]();
}

uint64_t RECylinderShapeGetHeight()
{
  return MEMORY[0x270F1D5C0]();
}

uint64_t RECylinderShapeGetRadius()
{
  return MEMORY[0x270F1D5C8]();
}

uint64_t REDebugMeshComponentGetComponentType()
{
  return MEMORY[0x270F1D5D0]();
}

uint64_t REDebugMeshComponentGetShaderDebugMode()
{
  return MEMORY[0x270F1D5D8]();
}

uint64_t REDebugMeshComponentReset()
{
  return MEMORY[0x270F1D5E0]();
}

uint64_t REDebugMeshComponentSetShaderDebugMode()
{
  return MEMORY[0x270F1D5E8]();
}

uint64_t REDecoderBeginContainer()
{
  return MEMORY[0x270F1D5F8]();
}

uint64_t REDecoderClose()
{
  return MEMORY[0x270F1D600]();
}

uint64_t REDecoderContainerElementCount()
{
  return MEMORY[0x270F1D608]();
}

uint64_t REDecoderContainerGetKeyAndOffset()
{
  return MEMORY[0x270F1D610]();
}

uint64_t REDecoderContainerSetOffset()
{
  return MEMORY[0x270F1D618]();
}

uint64_t REDecoderCreate()
{
  return MEMORY[0x270F1D620]();
}

uint64_t REDecoderDestroy()
{
  return MEMORY[0x270F1D628]();
}

uint64_t REDecoderGetStatus()
{
  return MEMORY[0x270F1D630]();
}

uint64_t REDecoderIsAtEndOfContainer()
{
  return MEMORY[0x270F1D638]();
}

uint64_t REDecoderOpen()
{
  return MEMORY[0x270F1D640]();
}

uint64_t REDecoderReadBool()
{
  return MEMORY[0x270F1D648]();
}

uint64_t REDecoderReadDouble()
{
  return MEMORY[0x270F1D650]();
}

uint64_t REDecoderReadFloat()
{
  return MEMORY[0x270F1D658]();
}

uint64_t REDecoderReadString()
{
  return MEMORY[0x270F1D660]();
}

uint64_t REDecoderSetFromCFData()
{
  return MEMORY[0x270F1D668]();
}

uint64_t REDecoderTryReadNil()
{
  return MEMORY[0x270F1D670]();
}

uint64_t REDecomposeMatrix()
{
  return MEMORY[0x270F1D678]();
}

uint64_t REDeferredActivationComponentGetComponentType()
{
  return MEMORY[0x270F1D680]();
}

uint64_t REDirectMaterialParametersArrayComponentClear()
{
  return MEMORY[0x270F1D6B8]();
}

uint64_t REDirectMaterialParametersArrayComponentGetComponentType()
{
  return MEMORY[0x270F1D6C0]();
}

uint64_t REDirectMaterialParametersArrayComponentGetData()
{
  return MEMORY[0x270F1D6C8]();
}

uint64_t REDirectMaterialParametersArrayComponentIsBufferShared()
{
  return MEMORY[0x270F1D6D0]();
}

uint64_t REDirectMaterialParametersArrayComponentSetData()
{
  return MEMORY[0x270F1D6D8]();
}

uint64_t REDirectParameterBufferCopy()
{
  return MEMORY[0x270F1D6E0]();
}

uint64_t REDirectParameterBufferCreate()
{
  return MEMORY[0x270F1D6E8]();
}

uint64_t REDirectParameterBufferCreateWithSize()
{
  return MEMORY[0x270F1D6F0]();
}

uint64_t REDirectParameterBufferGetDirectBuffer()
{
  return MEMORY[0x270F1D6F8]();
}

uint64_t REDirectParameterBufferGetSize()
{
  return MEMORY[0x270F1D700]();
}

uint64_t REDirectParameterBufferGetTextureAssetAtOffset()
{
  return MEMORY[0x270F1D708]();
}

uint64_t REDirectParameterBufferResize()
{
  return MEMORY[0x270F1D710]();
}

uint64_t REDirectParameterBufferSetTextureAssetAtOffset()
{
  return MEMORY[0x270F1D718]();
}

uint64_t REDirectionalLightComponentGetColorGamut3F()
{
  return MEMORY[0x270F1D720]();
}

uint64_t REDirectionalLightComponentGetComponentType()
{
  return MEMORY[0x270F1D728]();
}

uint64_t REDirectionalLightComponentGetIntensity()
{
  return MEMORY[0x270F1D730]();
}

uint64_t REDirectionalLightComponentGetIsProxy()
{
  return MEMORY[0x270F1D738]();
}

uint64_t REDirectionalLightComponentSetColorGamut3F()
{
  return MEMORY[0x270F1D740]();
}

uint64_t REDirectionalLightComponentSetIntensity()
{
  return MEMORY[0x270F1D748]();
}

uint64_t REDirectionalLightComponentSetIsProxy()
{
  return MEMORY[0x270F1D750]();
}

uint64_t REDirectionalLightShadowMapComponentGetAutomaticallyAdjustsShadowProjection()
{
  return MEMORY[0x270F1D758]();
}

uint64_t REDirectionalLightShadowMapComponentGetComponentType()
{
  return MEMORY[0x270F1D760]();
}

uint64_t REDirectionalLightShadowMapComponentGetCullModeEx()
{
  return MEMORY[0x270F1D768]();
}

uint64_t REDirectionalLightShadowMapComponentGetDepthBias()
{
  return MEMORY[0x270F1D770]();
}

uint64_t REDirectionalLightShadowMapComponentGetDistance()
{
  return MEMORY[0x270F1D778]();
}

uint64_t REDirectionalLightShadowMapComponentGetOrthographicScale()
{
  return MEMORY[0x270F1D780]();
}

uint64_t REDirectionalLightShadowMapComponentGetZFar()
{
  return MEMORY[0x270F1D788]();
}

uint64_t REDirectionalLightShadowMapComponentGetZNear()
{
  return MEMORY[0x270F1D790]();
}

uint64_t REDirectionalLightShadowMapComponentSetAutomaticallyAdjustsShadowProjection()
{
  return MEMORY[0x270F1D798]();
}

uint64_t REDirectionalLightShadowMapComponentSetCullMode()
{
  return MEMORY[0x270F1D7A0]();
}

uint64_t REDirectionalLightShadowMapComponentSetDepthBias()
{
  return MEMORY[0x270F1D7A8]();
}

uint64_t REDirectionalLightShadowMapComponentSetDistance()
{
  return MEMORY[0x270F1D7B0]();
}

uint64_t REDirectionalLightShadowMapComponentSetOrthographicScale()
{
  return MEMORY[0x270F1D7B8]();
}

uint64_t REDirectionalLightShadowMapComponentSetZFar()
{
  return MEMORY[0x270F1D7C0]();
}

uint64_t REDirectionalLightShadowMapComponentSetZNear()
{
  return MEMORY[0x270F1D7C8]();
}

uint64_t REDockingRegionComponentGetBounds()
{
  return MEMORY[0x270F1D7D0]();
}

uint64_t REDockingRegionComponentSetBounds()
{
  return MEMORY[0x270F1D7D8]();
}

uint64_t REDrawableGetTexture()
{
  return MEMORY[0x270F1D7E0]();
}

uint64_t REDynamicLightShadowComponentGetCastsShadow()
{
  return MEMORY[0x270F1D808]();
}

uint64_t REDynamicLightShadowComponentGetComponentType()
{
  return MEMORY[0x270F1D810]();
}

uint64_t REDynamicLightShadowComponentSetCastsShadow()
{
  return MEMORY[0x270F1D818]();
}

uint64_t REECSManagerAddScene()
{
  return MEMORY[0x270F1D838]();
}

uint64_t REECSManagerCreateRealityRendererSceneGroup()
{
  return MEMORY[0x270F1D840]();
}

uint64_t REECSManagerGetCustomSystemAtID()
{
  return MEMORY[0x270F1D848]();
}

uint64_t REECSManagerGetDefaultCustomSystemUpdateInterval()
{
  return MEMORY[0x270F1D850]();
}

uint64_t REECSManagerGetServiceLocator()
{
  return MEMORY[0x270F1D860]();
}

uint64_t REECSManagerRemoveScene()
{
  return MEMORY[0x270F1D870]();
}

uint64_t REECSManagerSceneCount()
{
  return MEMORY[0x270F1D878]();
}

uint64_t REECSManagerSetDefaultCustomSystemScheduleType()
{
  return MEMORY[0x270F1D880]();
}

uint64_t REECSManagerSetDefaultCustomSystemUpdateInterval()
{
  return MEMORY[0x270F1D888]();
}

uint64_t REECSManagerSetSwiftObject()
{
  return MEMORY[0x270F1D890]();
}

uint64_t REECSManagerSetSystemsArePausedInEditor()
{
  return MEMORY[0x270F1D898]();
}

uint64_t REECSManagerSystemsArePausedInEditor()
{
  return MEMORY[0x270F1D8A0]();
}

uint64_t REEDRColorManagementComponentSetHeadroomCallback()
{
  return MEMORY[0x270F1D8B8]();
}

uint64_t REEasingFunctionEvaluateEx()
{
  return MEMORY[0x270F1D8C0]();
}

uint64_t REEasingFunctionSetMode()
{
  return MEMORY[0x270F1D8C8]();
}

uint64_t REEasingFunctionSetModeEx()
{
  return MEMORY[0x270F1D8D0]();
}

uint64_t REEncoderBeginContainer()
{
  return MEMORY[0x270F1D8D8]();
}

uint64_t REEncoderClose()
{
  return MEMORY[0x270F1D8E0]();
}

uint64_t REEncoderCopyToCFData()
{
  return MEMORY[0x270F1D8E8]();
}

uint64_t REEncoderCreate()
{
  return MEMORY[0x270F1D8F0]();
}

uint64_t REEncoderDestroy()
{
  return MEMORY[0x270F1D8F8]();
}

uint64_t REEncoderGetStatus()
{
  return MEMORY[0x270F1D900]();
}

uint64_t REEncoderOpen()
{
  return MEMORY[0x270F1D908]();
}

uint64_t REEncoderWriteBool()
{
  return MEMORY[0x270F1D910]();
}

uint64_t REEncoderWriteDouble()
{
  return MEMORY[0x270F1D918]();
}

uint64_t REEncoderWriteFloat()
{
  return MEMORY[0x270F1D920]();
}

uint64_t REEncoderWriteInt16()
{
  return MEMORY[0x270F1D928]();
}

uint64_t REEncoderWriteInt64()
{
  return MEMORY[0x270F1D930]();
}

uint64_t REEncoderWriteInt8()
{
  return MEMORY[0x270F1D938]();
}

uint64_t REEncoderWriteNil()
{
  return MEMORY[0x270F1D940]();
}

uint64_t REEncoderWriteString()
{
  return MEMORY[0x270F1D948]();
}

uint64_t REEncoderWriteUInt16()
{
  return MEMORY[0x270F1D950]();
}

uint64_t REEncoderWriteUInt8()
{
  return MEMORY[0x270F1D958]();
}

uint64_t REEngineConfigurationClone()
{
  return MEMORY[0x270F1D960]();
}

uint64_t REEngineConfigurationCopyInstanceID()
{
  return MEMORY[0x270F1D968]();
}

uint64_t REEngineConfigurationCreateDefault()
{
  return MEMORY[0x270F1D970]();
}

uint64_t REEngineConfigurationCreateFromEngine()
{
  return MEMORY[0x270F1D978]();
}

uint64_t REEngineConfigurationGetAssetRuntimeSizeLimitForResourceShareClient()
{
  return MEMORY[0x270F1D980]();
}

uint64_t REEngineConfigurationGetClockMode()
{
  return MEMORY[0x270F1D988]();
}

uint64_t REEngineConfigurationGetDevice()
{
  return MEMORY[0x270F1D990]();
}

uint64_t REEngineConfigurationGetEnableInteractions()
{
  return MEMORY[0x270F1D998]();
}

uint64_t REEngineConfigurationGetEngineQueue()
{
  return MEMORY[0x270F1D9A0]();
}

uint64_t REEngineConfigurationGetForExportOnly()
{
  return MEMORY[0x270F1D9A8]();
}

uint64_t REEngineConfigurationGetIsHostingSharedAudioSimulation()
{
  return MEMORY[0x270F1D9B0]();
}

uint64_t REEngineConfigurationGetRenderFlags()
{
  return MEMORY[0x270F1D9B8]();
}

uint64_t REEngineConfigurationGetServicesToCreate()
{
  return MEMORY[0x270F1D9C0]();
}

uint64_t REEngineConfigurationGetServicesToUpdate()
{
  return MEMORY[0x270F1D9C8]();
}

uint64_t REEngineConfigurationGetStartupOptions()
{
  return MEMORY[0x270F1D9D0]();
}

uint64_t REEngineConfigurationGetUseMetal()
{
  return MEMORY[0x270F1D9D8]();
}

uint64_t REEngineConfigurationGetUsePhysicsSceneSystem()
{
  return MEMORY[0x270F1D9E0]();
}

uint64_t REEngineConfigurationGetUseRealityIO()
{
  return MEMORY[0x270F1D9E8]();
}

uint64_t REEngineConfigurationGetUserData()
{
  return MEMORY[0x270F1D9F0]();
}

uint64_t REEngineConfigurationSetClockMode()
{
  return MEMORY[0x270F1DA00]();
}

uint64_t REEngineConfigurationSetDevice()
{
  return MEMORY[0x270F1DA08]();
}

uint64_t REEngineConfigurationSetEngineQueue()
{
  return MEMORY[0x270F1DA18]();
}

uint64_t REEngineConfigurationSetInstanceID()
{
  return MEMORY[0x270F1DA28]();
}

uint64_t REEngineConfigurationSetRenderFlags()
{
  return MEMORY[0x270F1DA38]();
}

uint64_t REEngineConfigurationSetServicesToCreate()
{
  return MEMORY[0x270F1DA40]();
}

uint64_t REEngineConfigurationSetServicesToUpdate()
{
  return MEMORY[0x270F1DA48]();
}

uint64_t REEngineConfigurationSetStartupOptions()
{
  return MEMORY[0x270F1DA50]();
}

uint64_t REEngineCreate()
{
  return MEMORY[0x270F1DA78]();
}

uint64_t REEngineCreateDrawingManager()
{
  return MEMORY[0x270F1DA80]();
}

uint64_t REEngineCreateOverlayForRealityRenderer()
{
  return MEMORY[0x270F1DA88]();
}

uint64_t REEngineGetAcceptingInput()
{
  return MEMORY[0x270F1DA90]();
}

uint64_t REEngineGetCurrentTime()
{
  return MEMORY[0x270F1DA98]();
}

uint64_t REEngineGetDeltaTime()
{
  return MEMORY[0x270F1DAA0]();
}

uint64_t REEngineGetEventBus()
{
  return MEMORY[0x270F1DAA8]();
}

uint64_t REEngineGetPreferredFramesPerSecond()
{
  return MEMORY[0x270F1DAB0]();
}

uint64_t REEngineGetServiceLocator()
{
  return MEMORY[0x270F1DAB8]();
}

uint64_t REEngineGetShared()
{
  return MEMORY[0x270F1DAC0]();
}

uint64_t REEngineGetSwiftObject()
{
  return MEMORY[0x270F1DAC8]();
}

uint64_t REEngineInitWithConfiguration()
{
  return MEMORY[0x270F1DAD0]();
}

uint64_t REEngineIsRunning()
{
  return MEMORY[0x270F1DAD8]();
}

uint64_t REEngineOverlayEnterFrame()
{
  return MEMORY[0x270F1DAE0]();
}

uint64_t REEngineOverlayFrameCommit()
{
  return MEMORY[0x270F1DAE8]();
}

uint64_t REEngineOverlayFrameExit()
{
  return MEMORY[0x270F1DAF0]();
}

uint64_t REEngineOverlayFramePrepare()
{
  return MEMORY[0x270F1DAF8]();
}

uint64_t REEngineOverlayFrameSimulate()
{
  return MEMORY[0x270F1DB00]();
}

uint64_t REEngineOverlayGetCurrentTime()
{
  return MEMORY[0x270F1DB08]();
}

uint64_t REEngineOverlayIsEngineInsideTick()
{
  return MEMORY[0x270F1DB10]();
}

uint64_t REEngineOverlaySetRealityRendererSceneGroup()
{
  return MEMORY[0x270F1DB18]();
}

uint64_t REEngineSetAcceptingInput()
{
  return MEMORY[0x270F1DB20]();
}

uint64_t REEngineSetCallbacksEx()
{
  return MEMORY[0x270F1DB28]();
}

uint64_t REEngineSetShared()
{
  return MEMORY[0x270F1DB38]();
}

uint64_t REEngineSetSwiftObject()
{
  return MEMORY[0x270F1DB40]();
}

uint64_t REEngineStart()
{
  return MEMORY[0x270F1DB48]();
}

uint64_t REEngineStop()
{
  return MEMORY[0x270F1DB50]();
}

uint64_t REEngineUnsetCallbacksEx()
{
  return MEMORY[0x270F1DB58]();
}

uint64_t REEngineUsesMetal()
{
  return MEMORY[0x270F1DB60]();
}

uint64_t REEntityAddComponentNoEvents()
{
  return MEMORY[0x270F1DB70]();
}

uint64_t REEntityAddCustomComponent()
{
  return MEMORY[0x270F1DB78]();
}

uint64_t REEntityAddExistingComponent()
{
  return MEMORY[0x270F1DB80]();
}

uint64_t REEntityAddLoadTraceComponent()
{
  return MEMORY[0x270F1DB88]();
}

uint64_t REEntityCalculateWorldOrientation()
{
  return MEMORY[0x270F1DB98]();
}

uint64_t REEntityCharacterGetJointCount()
{
  return MEMORY[0x270F1DBA0]();
}

uint64_t REEntityCharacterSetup()
{
  return MEMORY[0x270F1DBA8]();
}

uint64_t REEntityComputeLocalBoundingBox()
{
  return MEMORY[0x270F1DBB0]();
}

uint64_t REEntityComputeMeshBounds()
{
  return MEMORY[0x270F1DBB8]();
}

uint64_t REEntityCopy()
{
  return MEMORY[0x270F1DBC0]();
}

uint64_t REEntityCopyTextureMetrics()
{
  return MEMORY[0x270F1DBC8]();
}

uint64_t REEntityCreate()
{
  return MEMORY[0x270F1DBD0]();
}

uint64_t REEntityFindAssetDependencies()
{
  return MEMORY[0x270F1DBD8]();
}

uint64_t REEntityFindInHierarchyByName()
{
  return MEMORY[0x270F1DBE0]();
}

uint64_t REEntityGetChild()
{
  return MEMORY[0x270F1DBE8]();
}

uint64_t REEntityGetChildCount()
{
  return MEMORY[0x270F1DBF0]();
}

uint64_t REEntityGetChildren()
{
  return MEMORY[0x270F1DBF8]();
}

uint64_t REEntityGetComponent()
{
  return MEMORY[0x270F1DC00]();
}

uint64_t REEntityGetComponentAtIndex()
{
  return MEMORY[0x270F1DC08]();
}

uint64_t REEntityGetComponentByClass()
{
  return MEMORY[0x270F1DC10]();
}

uint64_t REEntityGetComponentCount()
{
  return MEMORY[0x270F1DC18]();
}

uint64_t REEntityGetCustomComponent()
{
  return MEMORY[0x270F1DC20]();
}

uint64_t REEntityGetLocalId()
{
  return MEMORY[0x270F1DC28]();
}

uint64_t REEntityGetName()
{
  return MEMORY[0x270F1DC30]();
}

uint64_t REEntityGetOrAddComponent()
{
  return MEMORY[0x270F1DC38]();
}

uint64_t REEntityGetOrAddComponentByClass()
{
  return MEMORY[0x270F1DC40]();
}

uint64_t REEntityGetOrAddCustomComponent()
{
  return MEMORY[0x270F1DC48]();
}

uint64_t REEntityGetParent()
{
  return MEMORY[0x270F1DC50]();
}

uint64_t REEntityGetProjectiveShadowClusterID()
{
  return MEMORY[0x270F1DC58]();
}

uint64_t REEntityGetSceneNullable()
{
  return MEMORY[0x270F1DC60]();
}

uint64_t REEntityGetSelfEnabled()
{
  return MEMORY[0x270F1DC68]();
}

uint64_t REEntityGetSwiftObject()
{
  return MEMORY[0x270F1DC70]();
}

uint64_t REEntityInsertChild()
{
  return MEMORY[0x270F1DC80]();
}

uint64_t REEntityIsActive()
{
  return MEMORY[0x270F1DC88]();
}

uint64_t REEntityIsAnchored()
{
  return MEMORY[0x270F1DC90]();
}

uint64_t REEntityIsBeingDestroyed()
{
  return MEMORY[0x270F1DC98]();
}

uint64_t REEntityIsEnabledInHierarchy()
{
  return MEMORY[0x270F1DCA0]();
}

uint64_t REEntityIsNonHiddenAndInHierarchy()
{
  return MEMORY[0x270F1DCA8]();
}

uint64_t REEntityQueryDestroy()
{
  return MEMORY[0x270F1DCB0]();
}

uint64_t REEntityRemoveComponent()
{
  return MEMORY[0x270F1DCC0]();
}

uint64_t REEntityRemoveComponentByClass()
{
  return MEMORY[0x270F1DCC8]();
}

uint64_t REEntityRemoveCustomComponent()
{
  return MEMORY[0x270F1DCD0]();
}

uint64_t REEntityRemoveFromSceneOrParent()
{
  return MEMORY[0x270F1DCD8]();
}

uint64_t REEntitySendAddAndActivateComponentEvents()
{
  return MEMORY[0x270F1DCE0]();
}

uint64_t REEntitySetName()
{
  return MEMORY[0x270F1DCE8]();
}

uint64_t REEntitySetParent()
{
  return MEMORY[0x270F1DCF0]();
}

uint64_t REEntitySetSelfEnabled()
{
  return MEMORY[0x270F1DCF8]();
}

uint64_t REEntitySetSwiftObject()
{
  return MEMORY[0x270F1DD00]();
}

uint64_t REEntityTextureMetricsCopyNthTextureAssetId()
{
  return MEMORY[0x270F1DD10]();
}

uint64_t REEntityTextureMetricsGetNthTextureByteSize()
{
  return MEMORY[0x270F1DD18]();
}

uint64_t REEntityTextureMetricsGetNthTextureDimensions()
{
  return MEMORY[0x270F1DD20]();
}

uint64_t REEntityTextureMetricsGetTexturesCount()
{
  return MEMORY[0x270F1DD28]();
}

uint64_t REEntityTryGetSkeletalJointPinPose()
{
  return MEMORY[0x270F1DD30]();
}

uint64_t REEnvironmentLightingConfigurationComponentGetComponentType()
{
  return MEMORY[0x270F1DD58]();
}

uint64_t REEnvironmentLightingConfigurationComponentGetEnvironmentLightingWeight()
{
  return MEMORY[0x270F1DD60]();
}

uint64_t REEnvironmentLightingConfigurationComponentSetEnvironmentLightingWeight()
{
  return MEMORY[0x270F1DD68]();
}

uint64_t REEventBusMakeID()
{
  return MEMORY[0x270F1DD70]();
}

uint64_t REEventBusSetSwiftObject()
{
  return MEMORY[0x270F1DD78]();
}

uint64_t REEventBusSubscribeWithMatch()
{
  return MEMORY[0x270F1DD88]();
}

uint64_t REEventBusUnsubscribe()
{
  return MEMORY[0x270F1DD90]();
}

uint64_t REForceEffectComponentForceEffectHasSpatialFalloff()
{
  return MEMORY[0x270F1DDA8]();
}

uint64_t REForceEffectComponentForceEffectHasTimedFalloff()
{
  return MEMORY[0x270F1DDB0]();
}

uint64_t REForceEffectComponentForceEffectRemoveSpatialFalloff()
{
  return MEMORY[0x270F1DDB8]();
}

uint64_t REForceEffectComponentForceEffectRemoveTimedFalloff()
{
  return MEMORY[0x270F1DDC0]();
}

uint64_t REForceEffectComponentGetComponentType()
{
  return MEMORY[0x270F1DDC8]();
}

uint64_t REForceEffectComponentGetForceEffectBoundSphereRadius()
{
  return MEMORY[0x270F1DDD0]();
}

uint64_t REForceEffectComponentGetForceEffectCount()
{
  return MEMORY[0x270F1DDD8]();
}

uint64_t REForceEffectComponentGetForceEffectEventKey()
{
  return MEMORY[0x270F1DDE0]();
}

uint64_t REForceEffectComponentGetForceEffectMask()
{
  return MEMORY[0x270F1DDE8]();
}

uint64_t REForceEffectComponentGetForceEffectOrientation()
{
  return MEMORY[0x270F1DDF0]();
}

uint64_t REForceEffectComponentGetForceEffectPosition()
{
  return MEMORY[0x270F1DDF8]();
}

uint64_t REForceEffectComponentGetForceEffectSpatialFalloffRate()
{
  return MEMORY[0x270F1DE00]();
}

uint64_t REForceEffectComponentGetForceEffectStrengthScale()
{
  return MEMORY[0x270F1DE08]();
}

uint64_t REForceEffectComponentGetForceEffectTimedFalloffDuration()
{
  return MEMORY[0x270F1DE10]();
}

uint64_t REForceEffectComponentGetForceEffectTimedFalloffRate()
{
  return MEMORY[0x270F1DE18]();
}

uint64_t REForceEffectComponentGetForceEffectUserClass()
{
  return MEMORY[0x270F1DE20]();
}

uint64_t REForceEffectComponentGetForceEffectUserData()
{
  return MEMORY[0x270F1DE28]();
}

uint64_t REForceEffectComponentGetForceEffectUserDataSize()
{
  return MEMORY[0x270F1DE30]();
}

uint64_t REForceEffectComponentRemoveSimulationState()
{
  return MEMORY[0x270F1DE38]();
}

uint64_t REForceEffectComponentResizeForceEffectUserData()
{
  return MEMORY[0x270F1DE40]();
}

uint64_t REForceEffectComponentResizeForceEffects()
{
  return MEMORY[0x270F1DE48]();
}

uint64_t REForceEffectComponentSetAndRetainForceEffectUserClass()
{
  return MEMORY[0x270F1DE50]();
}

uint64_t REForceEffectComponentSetForceEffectBoundSphereRadius()
{
  return MEMORY[0x270F1DE58]();
}

uint64_t REForceEffectComponentSetForceEffectEventKey()
{
  return MEMORY[0x270F1DE60]();
}

uint64_t REForceEffectComponentSetForceEffectForceMode()
{
  return MEMORY[0x270F1DE68]();
}

uint64_t REForceEffectComponentSetForceEffectInputs()
{
  return MEMORY[0x270F1DE70]();
}

uint64_t REForceEffectComponentSetForceEffectMask()
{
  return MEMORY[0x270F1DE78]();
}

uint64_t REForceEffectComponentSetForceEffectOrientation()
{
  return MEMORY[0x270F1DE80]();
}

uint64_t REForceEffectComponentSetForceEffectPosition()
{
  return MEMORY[0x270F1DE88]();
}

uint64_t REForceEffectComponentSetForceEffectSpatialFalloffRate()
{
  return MEMORY[0x270F1DE90]();
}

uint64_t REForceEffectComponentSetForceEffectStrengthScale()
{
  return MEMORY[0x270F1DE98]();
}

uint64_t REForceEffectComponentSetForceEffectSubscription()
{
  return MEMORY[0x270F1DEA0]();
}

uint64_t REForceEffectComponentSetForceEffectTimedFalloffDuration()
{
  return MEMORY[0x270F1DEA8]();
}

uint64_t REForceEffectComponentSetForceEffectTimedFalloffRate()
{
  return MEMORY[0x270F1DEB0]();
}

uint64_t REForceEffectComponentSetSimulationState()
{
  return MEMORY[0x270F1DEB8]();
}

uint64_t REForceEffectEventFilter()
{
  return MEMORY[0x270F1DEC0]();
}

uint64_t REFromToByAnimationDefaultParameters()
{
  return MEMORY[0x270F1DEC8]();
}

uint64_t REFunctionLinkBuilderCreate()
{
  return MEMORY[0x270F1DED0]();
}

uint64_t REFunctionLinkBuilderSetFunctionConstantValues()
{
  return MEMORY[0x270F1DED8]();
}

uint64_t REFunctionLinkBuilderSetLinkedFunctionLibrary()
{
  return MEMORY[0x270F1DEE0]();
}

uint64_t REFunctionLinkBuilderSetLinkedFunctionName()
{
  return MEMORY[0x270F1DEE8]();
}

uint64_t REFunctionLinkBuilderSetLinkedShaderAPIs()
{
  return MEMORY[0x270F1DEF0]();
}

uint64_t REFunctionLinkBuilderSetShaderStage()
{
  return MEMORY[0x270F1DEF8]();
}

uint64_t REFunctionLinkCopyLinkedFunctionName()
{
  return MEMORY[0x270F1DF00]();
}

uint64_t REFunctionLinkGetConstantValues()
{
  return MEMORY[0x270F1DF08]();
}

uint64_t REFunctionLinkGetLinkedFunctionLibrary()
{
  return MEMORY[0x270F1DF10]();
}

uint64_t REFunctionLinkGetLinkedShaderAPIAtIndex()
{
  return MEMORY[0x270F1DF18]();
}

uint64_t REFunctionLinkGetLinkedShaderAPICount()
{
  return MEMORY[0x270F1DF20]();
}

uint64_t REFunctionLinkGetStage()
{
  return MEMORY[0x270F1DF28]();
}

uint64_t REGeomBuildBoxDefaultOptions()
{
  return MEMORY[0x270F1DF30]();
}

uint64_t REGeomBuildBoxWithRoundedCornersDefaultOptions()
{
  return MEMORY[0x270F1DF38]();
}

uint64_t REGeomBuildCapsuleDefaultOptions()
{
  return MEMORY[0x270F1DF40]();
}

uint64_t REGeomBuildConeDefaultOptions()
{
  return MEMORY[0x270F1DF48]();
}

uint64_t REGeomBuildCylinderDefaultOptions()
{
  return MEMORY[0x270F1DF50]();
}

uint64_t REGeomBuildExtrudedTextDefaultOptions()
{
  return MEMORY[0x270F1DF58]();
}

uint64_t REGeomBuildPlaneDefaultOptions()
{
  return MEMORY[0x270F1DF60]();
}

uint64_t REGeomBuildSphereDefaultOptions()
{
  return MEMORY[0x270F1DF68]();
}

uint64_t REGeomInstanceCreate()
{
  return MEMORY[0x270F1DF70]();
}

uint64_t REGeomMeshCreateFromCoreAttributes()
{
  return MEMORY[0x270F1DF78]();
}

uint64_t REGeomModelDescriptorAddAttributeDouble()
{
  return MEMORY[0x270F1DF88]();
}

uint64_t REGeomModelDescriptorAddAttributeFloat()
{
  return MEMORY[0x270F1DF90]();
}

uint64_t REGeomModelDescriptorAddAttributeInt16()
{
  return MEMORY[0x270F1DF98]();
}

uint64_t REGeomModelDescriptorAddAttributeInt32()
{
  return MEMORY[0x270F1DFA0]();
}

uint64_t REGeomModelDescriptorAddAttributeInt8()
{
  return MEMORY[0x270F1DFA8]();
}

uint64_t REGeomModelDescriptorAddAttributeUInt16()
{
  return MEMORY[0x270F1DFB0]();
}

uint64_t REGeomModelDescriptorAddAttributeUInt32()
{
  return MEMORY[0x270F1DFB8]();
}

uint64_t REGeomModelDescriptorAddAttributeUInt8()
{
  return MEMORY[0x270F1DFC0]();
}

uint64_t REGeomModelDescriptorAddAttributeVector2F()
{
  return MEMORY[0x270F1DFC8]();
}

uint64_t REGeomModelDescriptorAddAttributeVector3F()
{
  return MEMORY[0x270F1DFD0]();
}

uint64_t REGeomModelDescriptorAddAttributeVector4F()
{
  return MEMORY[0x270F1DFD8]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeDouble()
{
  return MEMORY[0x270F1DFE0]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeFloat()
{
  return MEMORY[0x270F1DFE8]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeInt16()
{
  return MEMORY[0x270F1DFF0]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeInt32()
{
  return MEMORY[0x270F1DFF8]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeInt8()
{
  return MEMORY[0x270F1E000]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeUInt16()
{
  return MEMORY[0x270F1E008]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeUInt32()
{
  return MEMORY[0x270F1E010]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeUInt8()
{
  return MEMORY[0x270F1E018]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeVector2F()
{
  return MEMORY[0x270F1E020]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeVector3F()
{
  return MEMORY[0x270F1E028]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeVector4F()
{
  return MEMORY[0x270F1E030]();
}

uint64_t REGeomModelDescriptorAddSkinningData()
{
  return MEMORY[0x270F1E038]();
}

uint64_t REGeomModelDescriptorCreate()
{
  return MEMORY[0x270F1E048]();
}

uint64_t REGeomModelDescriptorSetMaterialAssignmentForModel()
{
  return MEMORY[0x270F1E0F0]();
}

uint64_t REGeomModelDescriptorSetMaterialAssignmentsPerFace()
{
  return MEMORY[0x270F1E0F8]();
}

uint64_t REGeomModelDescriptorSetName()
{
  return MEMORY[0x270F1E100]();
}

uint64_t REGetCoreREBundle()
{
  return MEMORY[0x270F1E118]();
}

uint64_t REGetMaxRealityFileConfigurationSceneCount()
{
  return MEMORY[0x270F1E120]();
}

uint64_t REGetRetainCount()
{
  return MEMORY[0x270F1E128]();
}

uint64_t REGroundingShadowComponentGetCastsShadow()
{
  return MEMORY[0x270F1E148]();
}

uint64_t REGroundingShadowComponentGetComponentType()
{
  return MEMORY[0x270F1E150]();
}

uint64_t REGroundingShadowComponentGetFadeBehaviorNearPhysicalObjects()
{
  return MEMORY[0x270F1E158]();
}

uint64_t REGroundingShadowComponentGetReceivesShadow()
{
  return MEMORY[0x270F1E160]();
}

uint64_t REGroundingShadowComponentSetCastsShadow()
{
  return MEMORY[0x270F1E168]();
}

uint64_t REGroundingShadowComponentSetFadeBehaviorNearPhysicalObjects()
{
  return MEMORY[0x270F1E170]();
}

uint64_t REGroundingShadowComponentSetReceivesShadow()
{
  return MEMORY[0x270F1E178]();
}

uint64_t REHideEntity()
{
  return MEMORY[0x270F1E180]();
}

uint64_t REHierarchicalFadeComponentGetComponentType()
{
  return MEMORY[0x270F1E188]();
}

uint64_t REHierarchicalFadeComponentGetOpacity()
{
  return MEMORY[0x270F1E190]();
}

uint64_t REHierarchicalFadeComponentSetOpacity()
{
  return MEMORY[0x270F1E198]();
}

uint64_t REIBLAssetGetDiffuseTexture()
{
  return MEMORY[0x270F1E1A8]();
}

uint64_t REIBLAssetGetSkyboxTexture()
{
  return MEMORY[0x270F1E1B0]();
}

uint64_t REIBLAssetGetSpecularTexture()
{
  return MEMORY[0x270F1E1B8]();
}

uint64_t REIkParametersComopnentTaskGetRotationTargetBlendWeight()
{
  return MEMORY[0x270F1E1C0]();
}

uint64_t REIkParametersComponentEnsureSolversInit()
{
  return MEMORY[0x270F1E1C8]();
}

uint64_t REIkParametersComponentGetAsset()
{
  return MEMORY[0x270F1E1D0]();
}

uint64_t REIkParametersComponentGetComponentType()
{
  return MEMORY[0x270F1E1D8]();
}

uint64_t REIkParametersComponentGetSolverCount()
{
  return MEMORY[0x270F1E1E0]();
}

uint64_t REIkParametersComponentGetSolverNodeName()
{
  return MEMORY[0x270F1E1E8]();
}

uint64_t REIkParametersComponentJointGetName()
{
  return MEMORY[0x270F1E1F0]();
}

uint64_t REIkParametersComponentJointGetRetargetingGain()
{
  return MEMORY[0x270F1E1F8]();
}

uint64_t REIkParametersComponentJointGetRetargetingGainPerAxis()
{
  return MEMORY[0x270F1E200]();
}

uint64_t REIkParametersComponentJointGetRotationStiffness()
{
  return MEMORY[0x270F1E208]();
}

uint64_t REIkParametersComponentJointSetRetargetingGainPerAxis()
{
  return MEMORY[0x270F1E210]();
}

uint64_t REIkParametersComponentJointSetRotationStiffness()
{
  return MEMORY[0x270F1E218]();
}

uint64_t REIkParametersComponentResetSolver()
{
  return MEMORY[0x270F1E220]();
}

uint64_t REIkParametersComponentSolverGetJointCount()
{
  return MEMORY[0x270F1E230]();
}

uint64_t REIkParametersComponentSolverGetMaxIterations()
{
  return MEMORY[0x270F1E238]();
}

uint64_t REIkParametersComponentSolverGetRetargetingGain()
{
  return MEMORY[0x270F1E240]();
}

uint64_t REIkParametersComponentSolverGetTaskCount()
{
  return MEMORY[0x270F1E248]();
}

uint64_t REIkParametersComponentSolverSetMaxIterations()
{
  return MEMORY[0x270F1E250]();
}

uint64_t REIkParametersComponentSolverSetRetargetingGain()
{
  return MEMORY[0x270F1E258]();
}

uint64_t REIkParametersComponentTaskGetLookAtTarget()
{
  return MEMORY[0x270F1E260]();
}

uint64_t REIkParametersComponentTaskGetName()
{
  return MEMORY[0x270F1E268]();
}

uint64_t REIkParametersComponentTaskGetPositionTargetBlendWeight()
{
  return MEMORY[0x270F1E270]();
}

uint64_t REIkParametersComponentTaskGetTargetName()
{
  return MEMORY[0x270F1E278]();
}

uint64_t REIkParametersComponentTaskGetTargetPosition()
{
  return MEMORY[0x270F1E280]();
}

uint64_t REIkParametersComponentTaskGetTargetRotation()
{
  return MEMORY[0x270F1E288]();
}

uint64_t REIkParametersComponentTaskHasLookAtEnabled()
{
  return MEMORY[0x270F1E290]();
}

uint64_t REIkParametersComponentTaskHasPositionEnabled()
{
  return MEMORY[0x270F1E298]();
}

uint64_t REIkParametersComponentTaskHasRotationEnabled()
{
  return MEMORY[0x270F1E2A0]();
}

uint64_t REIkParametersComponentTaskSetLookAtTarget()
{
  return MEMORY[0x270F1E2A8]();
}

uint64_t REIkParametersComponentTaskSetPositionTargetBlendWeight()
{
  return MEMORY[0x270F1E2B0]();
}

uint64_t REIkParametersComponentTaskSetRotationTargetBlendWeight()
{
  return MEMORY[0x270F1E2B8]();
}

uint64_t REIkParametersComponentTaskSetTargetPosition()
{
  return MEMORY[0x270F1E2C0]();
}

uint64_t REIkParametersComponentTaskSetTargetRotation()
{
  return MEMORY[0x270F1E2C8]();
}

uint64_t REIkRigAssetBuilderAddRig()
{
  return MEMORY[0x270F1E2D0]();
}

uint64_t REIkRigAssetBuilderCreate()
{
  return MEMORY[0x270F1E2D8]();
}

uint64_t REIkRigAssetCreate()
{
  return MEMORY[0x270F1E2E0]();
}

uint64_t REIkRigAssetGetDefinitionCount()
{
  return MEMORY[0x270F1E2E8]();
}

uint64_t REIkRigAssetGetDefinitionOutputTarget()
{
  return MEMORY[0x270F1E2F0]();
}

uint64_t REIkRigAssetGetDefinitionRig()
{
  return MEMORY[0x270F1E2F8]();
}

uint64_t REIkRigAssetGetDefinitionSolverID()
{
  return MEMORY[0x270F1E300]();
}

uint64_t REIkRigAssetGetDefinitionSourceTarget()
{
  return MEMORY[0x270F1E308]();
}

uint64_t REImageBasedLightComponentGetBlendIBLsFactor()
{
  return MEMORY[0x270F1E310]();
}

uint64_t REImageBasedLightComponentGetComponentType()
{
  return MEMORY[0x270F1E318]();
}

uint64_t REImageBasedLightComponentGetEnableBlend()
{
  return MEMORY[0x270F1E320]();
}

uint64_t REImageBasedLightComponentGetIBL()
{
  return MEMORY[0x270F1E328]();
}

uint64_t REImageBasedLightComponentGetIBLBlend()
{
  return MEMORY[0x270F1E330]();
}

uint64_t REImageBasedLightComponentGetIntensityExponent()
{
  return MEMORY[0x270F1E338]();
}

uint64_t REImageBasedLightComponentGetRotationEnabled()
{
  return MEMORY[0x270F1E340]();
}

uint64_t REImageBasedLightComponentIsGlobalIBL()
{
  return MEMORY[0x270F1E348]();
}

uint64_t REImageBasedLightComponentSetBlendIBLsFactor()
{
  return MEMORY[0x270F1E350]();
}

uint64_t REImageBasedLightComponentSetEnableBlend()
{
  return MEMORY[0x270F1E360]();
}

uint64_t REImageBasedLightComponentSetGlobalIBL()
{
  return MEMORY[0x270F1E368]();
}

uint64_t REImageBasedLightComponentSetIBL()
{
  return MEMORY[0x270F1E370]();
}

uint64_t REImageBasedLightComponentSetIBLBlendNullable()
{
  return MEMORY[0x270F1E378]();
}

uint64_t REImageBasedLightComponentSetIBLNullable()
{
  return MEMORY[0x270F1E380]();
}

uint64_t REImageBasedLightComponentSetIntensityExponent()
{
  return MEMORY[0x270F1E388]();
}

uint64_t REImageBasedLightComponentSetRotationEnabled()
{
  return MEMORY[0x270F1E3A0]();
}

uint64_t REImageBasedLightReceiverComponentGetComponentType()
{
  return MEMORY[0x270F1E3A8]();
}

uint64_t REImageBasedLightReceiverComponentGetIBLEntityNullable()
{
  return MEMORY[0x270F1E3B0]();
}

uint64_t REImageBasedLightReceiverComponentSetIBLEntity()
{
  return MEMORY[0x270F1E3B8]();
}

uint64_t REInputManagerNotify()
{
  return MEMORY[0x270F1E3C0]();
}

uint64_t REInputTargetComponentGetAllowsDirectInput()
{
  return MEMORY[0x270F1E3C8]();
}

uint64_t REInputTargetComponentGetAllowsIndirectInput()
{
  return MEMORY[0x270F1E3D0]();
}

uint64_t REInputTargetComponentGetComponentType()
{
  return MEMORY[0x270F1E3D8]();
}

uint64_t REInputTargetComponentIsEnabled()
{
  return MEMORY[0x270F1E3E0]();
}

uint64_t REInputTargetComponentSetAllowsDirectInput()
{
  return MEMORY[0x270F1E3E8]();
}

uint64_t REInputTargetComponentSetAllowsIndirectInput()
{
  return MEMORY[0x270F1E3F0]();
}

uint64_t REInputTargetComponentSetEnabled()
{
  return MEMORY[0x270F1E3F8]();
}

uint64_t REIsEntityHidden()
{
  return MEMORY[0x270F1E400]();
}

uint64_t REKeyValueComponentAddBoolValue()
{
  return MEMORY[0x270F1E408]();
}

uint64_t REKeyValueComponentAddDoubleValue()
{
  return MEMORY[0x270F1E410]();
}

uint64_t REKeyValueComponentAddFloat2Value()
{
  return MEMORY[0x270F1E418]();
}

uint64_t REKeyValueComponentAddFloat3Value()
{
  return MEMORY[0x270F1E420]();
}

uint64_t REKeyValueComponentAddFloat4Value()
{
  return MEMORY[0x270F1E428]();
}

uint64_t REKeyValueComponentAddFloatValue()
{
  return MEMORY[0x270F1E430]();
}

uint64_t REKeyValueComponentAddInt64Value()
{
  return MEMORY[0x270F1E438]();
}

uint64_t REKeyValueComponentAddIntValue()
{
  return MEMORY[0x270F1E440]();
}

uint64_t REKeyValueComponentAddQuatFValue()
{
  return MEMORY[0x270F1E448]();
}

uint64_t REKeyValueComponentAddRESRTValue()
{
  return MEMORY[0x270F1E450]();
}

uint64_t REKeyValueComponentAddStringValue()
{
  return MEMORY[0x270F1E458]();
}

uint64_t REKeyValueComponentGetComponentType()
{
  return MEMORY[0x270F1E460]();
}

uint64_t REKeyValueComponentGetStringValue()
{
  return MEMORY[0x270F1E468]();
}

uint64_t RELightComponentGetComponentType()
{
  return MEMORY[0x270F1E470]();
}

uint64_t RELinkedOnOrAfterFall2024OSVersions()
{
  return MEMORY[0x270F1E478]();
}

uint64_t REListenerComponentGetComponentType()
{
  return MEMORY[0x270F1E4A0]();
}

uint64_t REListenerComponentSetSystemListener()
{
  return MEMORY[0x270F1E4A8]();
}

uint64_t REMakeLookAtPose()
{
  return MEMORY[0x270F1E4B0]();
}

uint64_t REMakeMassFrame()
{
  return MEMORY[0x270F1E4B8]();
}

uint64_t REMakeSRT()
{
  return MEMORY[0x270F1E4D0]();
}

uint64_t REMakeSRTFromMatrix()
{
  return MEMORY[0x270F1E4D8]();
}

uint64_t REMaterialAssetBuilderAddFunctionLinkBuilder()
{
  return MEMORY[0x270F1E4E8]();
}

uint64_t REMaterialAssetBuilderCreate()
{
  return MEMORY[0x270F1E4F8]();
}

uint64_t REMaterialAssetBuilderSetBool()
{
  return MEMORY[0x270F1E500]();
}

uint64_t REMaterialAssetBuilderSetBufferFromBinding()
{
  return MEMORY[0x270F1E508]();
}

uint64_t REMaterialAssetBuilderSetColor4F()
{
  return MEMORY[0x270F1E518]();
}

uint64_t REMaterialAssetBuilderSetFloat()
{
  return MEMORY[0x270F1E520]();
}

uint64_t REMaterialAssetBuilderSetFloat2()
{
  return MEMORY[0x270F1E528]();
}

uint64_t REMaterialAssetBuilderSetFloat2x2()
{
  return MEMORY[0x270F1E530]();
}

uint64_t REMaterialAssetBuilderSetFloat3()
{
  return MEMORY[0x270F1E538]();
}

uint64_t REMaterialAssetBuilderSetFloat3x3()
{
  return MEMORY[0x270F1E540]();
}

uint64_t REMaterialAssetBuilderSetFloat4()
{
  return MEMORY[0x270F1E548]();
}

uint64_t REMaterialAssetBuilderSetFloat4x4()
{
  return MEMORY[0x270F1E550]();
}

uint64_t REMaterialAssetBuilderSetFunctionConstant()
{
  return MEMORY[0x270F1E558]();
}

uint64_t REMaterialAssetBuilderSetInt()
{
  return MEMORY[0x270F1E560]();
}

uint64_t REMaterialAssetBuilderSetInt2()
{
  return MEMORY[0x270F1E568]();
}

uint64_t REMaterialAssetBuilderSetInt3()
{
  return MEMORY[0x270F1E570]();
}

uint64_t REMaterialAssetBuilderSetInt4()
{
  return MEMORY[0x270F1E578]();
}

uint64_t REMaterialAssetBuilderSetMTLCullMode()
{
  return MEMORY[0x270F1E580]();
}

uint64_t REMaterialAssetBuilderSetMaterialDefinition()
{
  return MEMORY[0x270F1E588]();
}

uint64_t REMaterialAssetBuilderSetNeedsPassthroughBlur()
{
  return MEMORY[0x270F1E598]();
}

uint64_t REMaterialAssetBuilderSetNeedsVCABlur()
{
  return MEMORY[0x270F1E5A0]();
}

uint64_t REMaterialAssetBuilderSetTextureFromAsset()
{
  return MEMORY[0x270F1E5B0]();
}

uint64_t REMaterialAssetBuilderSetTextureFromBinding()
{
  return MEMORY[0x270F1E5B8]();
}

uint64_t REMaterialAssetBuilderSetUInt()
{
  return MEMORY[0x270F1E5C0]();
}

uint64_t REMaterialAssetBuilderSetUInt2()
{
  return MEMORY[0x270F1E5C8]();
}

uint64_t REMaterialAssetBuilderSetUInt3()
{
  return MEMORY[0x270F1E5D0]();
}

uint64_t REMaterialAssetBuilderSetUInt4()
{
  return MEMORY[0x270F1E5D8]();
}

uint64_t REMaterialAssetCopySamplerDescriptor()
{
  return MEMORY[0x270F1E5E8]();
}

uint64_t REMaterialAssetCopyShaderGraphParameterNames()
{
  return MEMORY[0x270F1E5F0]();
}

uint64_t REMaterialAssetGetBool()
{
  return MEMORY[0x270F1E5F8]();
}

uint64_t REMaterialAssetGetColor3F()
{
  return MEMORY[0x270F1E600]();
}

uint64_t REMaterialAssetGetColor4F()
{
  return MEMORY[0x270F1E608]();
}

uint64_t REMaterialAssetGetCullMode()
{
  return MEMORY[0x270F1E610]();
}

uint64_t REMaterialAssetGetFeatureFlags()
{
  return MEMORY[0x270F1E618]();
}

uint64_t REMaterialAssetGetFloat()
{
  return MEMORY[0x270F1E620]();
}

uint64_t REMaterialAssetGetFloat2F()
{
  return MEMORY[0x270F1E628]();
}

uint64_t REMaterialAssetGetFloat2x2F()
{
  return MEMORY[0x270F1E630]();
}

uint64_t REMaterialAssetGetFloat3F()
{
  return MEMORY[0x270F1E638]();
}

uint64_t REMaterialAssetGetFloat3x3F()
{
  return MEMORY[0x270F1E640]();
}

uint64_t REMaterialAssetGetFloat4F()
{
  return MEMORY[0x270F1E648]();
}

uint64_t REMaterialAssetGetFloat4x4F()
{
  return MEMORY[0x270F1E650]();
}

uint64_t REMaterialAssetGetFunctionConstant()
{
  return MEMORY[0x270F1E658]();
}

uint64_t REMaterialAssetGetFunctionLinkAtIndex()
{
  return MEMORY[0x270F1E660]();
}

uint64_t REMaterialAssetGetFunctionLinkCount()
{
  return MEMORY[0x270F1E668]();
}

uint64_t REMaterialAssetGetGeomFlattenedCustomParamNames()
{
  return MEMORY[0x270F1E670]();
}

uint64_t REMaterialAssetGetInt()
{
  return MEMORY[0x270F1E678]();
}

uint64_t REMaterialAssetGetInt2()
{
  return MEMORY[0x270F1E680]();
}

uint64_t REMaterialAssetGetInt3()
{
  return MEMORY[0x270F1E688]();
}

uint64_t REMaterialAssetGetInt4()
{
  return MEMORY[0x270F1E690]();
}

uint64_t REMaterialAssetGetMaterialDefinition()
{
  return MEMORY[0x270F1E698]();
}

uint64_t REMaterialAssetGetName()
{
  return MEMORY[0x270F1E6A0]();
}

uint64_t REMaterialAssetGetParameterType()
{
  return MEMORY[0x270F1E6A8]();
}

uint64_t REMaterialAssetGetParameterTypeWithHandle()
{
  return MEMORY[0x270F1E6B0]();
}

uint64_t REMaterialAssetGetSamplerNameBoundToTexture()
{
  return MEMORY[0x270F1E6B8]();
}

uint64_t REMaterialAssetGetSourceName()
{
  return MEMORY[0x270F1E6C0]();
}

uint64_t REMaterialAssetGetSurfFlattenedCustomParamNames()
{
  return MEMORY[0x270F1E6C8]();
}

uint64_t REMaterialAssetGetTextureAsset()
{
  return MEMORY[0x270F1E6D0]();
}

uint64_t REMaterialAssetGetTextureParameterType()
{
  return MEMORY[0x270F1E6D8]();
}

uint64_t REMaterialAssetGetType()
{
  return MEMORY[0x270F1E6E0]();
}

uint64_t REMaterialAssetGetUInt()
{
  return MEMORY[0x270F1E6E8]();
}

uint64_t REMaterialAssetGetUInt2()
{
  return MEMORY[0x270F1E6F0]();
}

uint64_t REMaterialAssetGetUInt3()
{
  return MEMORY[0x270F1E6F8]();
}

uint64_t REMaterialAssetGetUInt4()
{
  return MEMORY[0x270F1E700]();
}

uint64_t REMaterialAssetGetValidPassTechniqueMapping()
{
  return MEMORY[0x270F1E708]();
}

uint64_t REMaterialAssetHasGeometryModifierCustomParamsName()
{
  return MEMORY[0x270F1E710]();
}

uint64_t REMaterialAssetHasSurfaceShaderCustomParamsName()
{
  return MEMORY[0x270F1E718]();
}

uint64_t REMaterialAssetIsVisibleShaderGraphParameter()
{
  return MEMORY[0x270F1E720]();
}

uint64_t REMaterialAssetSetBool()
{
  return MEMORY[0x270F1E728]();
}

uint64_t REMaterialAssetSetColor4F()
{
  return MEMORY[0x270F1E730]();
}

uint64_t REMaterialAssetTechniqueHasVariation()
{
  return MEMORY[0x270F1E740]();
}

uint64_t REMaterialCreateDefaultSamplerDescriptor()
{
  return MEMORY[0x270F1E748]();
}

uint64_t REMaterialDefinitionAssetBuilderAddDebugMapping()
{
  return MEMORY[0x270F1E750]();
}

uint64_t REMaterialDefinitionAssetBuilderAddTechnique()
{
  return MEMORY[0x270F1E758]();
}

uint64_t REMaterialDefinitionAssetBuilderAddTechniqueDefaultVariation()
{
  return MEMORY[0x270F1E760]();
}

uint64_t REMaterialDefinitionAssetBuilderAddTechniqueVariation()
{
  return MEMORY[0x270F1E768]();
}

uint64_t REMaterialDefinitionAssetBuilderCreate()
{
  return MEMORY[0x270F1E770]();
}

uint64_t REMaterialDefinitionAssetBuilderSetDebugMappingEntry()
{
  return MEMORY[0x270F1E778]();
}

uint64_t REMaterialDefinitionAssetBuilderSetDebugMappingName()
{
  return MEMORY[0x270F1E780]();
}

uint64_t REMaterialDefinitionAssetBuilderSetLibrary()
{
  return MEMORY[0x270F1E788]();
}

uint64_t REMaterialDefinitionAssetBuilderSetName()
{
  return MEMORY[0x270F1E790]();
}

uint64_t REMaterialDefinitionAssetBuilderSetOverrideMaterial()
{
  return MEMORY[0x270F1E798]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueDebugMapping()
{
  return MEMORY[0x270F1E7A0]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueDefaultVariation()
{
  return MEMORY[0x270F1E7A8]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueFunctionConstant()
{
  return MEMORY[0x270F1E7B0]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueLibrary()
{
  return MEMORY[0x270F1E7B8]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueMapping()
{
  return MEMORY[0x270F1E7C0]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueName()
{
  return MEMORY[0x270F1E7C8]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniquePixelShaderEntry()
{
  return MEMORY[0x270F1E7D0]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniquePixelShaderLibrary()
{
  return MEMORY[0x270F1E7D8]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueStateAlphaBlend()
{
  return MEMORY[0x270F1E7E0]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueStateColorWriteMask()
{
  return MEMORY[0x270F1E7E8]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueStateCullMode()
{
  return MEMORY[0x270F1E7F0]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueStateDepthCompareFunction()
{
  return MEMORY[0x270F1E7F8]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueStateWriteDepth()
{
  return MEMORY[0x270F1E800]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueVariation()
{
  return MEMORY[0x270F1E808]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueVertexShaderEntry()
{
  return MEMORY[0x270F1E810]();
}

uint64_t REMaterialDefinitionAssetBuilderSetTechniqueVertexShaderLibrary()
{
  return MEMORY[0x270F1E818]();
}

uint64_t REMaterialDefinitionAssetGetParameterDisplayName()
{
  return MEMORY[0x270F1E820]();
}

uint64_t REMaterialDefinitionAssetGetParameterKeys()
{
  return MEMORY[0x270F1E828]();
}

uint64_t REMaterialDefinitionAssetHasTechniqueWithHash()
{
  return MEMORY[0x270F1E830]();
}

uint64_t REMaterialParameterBlockArrayComponentBorrowBlockValueAtIndex()
{
  return MEMORY[0x270F1E838]();
}

uint64_t REMaterialParameterBlockArrayComponentGetBlockValueAtIndex()
{
  return MEMORY[0x270F1E848]();
}

uint64_t REMaterialParameterBlockArrayComponentGetComponentType()
{
  return MEMORY[0x270F1E850]();
}

uint64_t REMaterialParameterBlockArrayComponentGetHashedPassTechniqueMappingAtIndex()
{
  return MEMORY[0x270F1E858]();
}

uint64_t REMaterialParameterBlockArrayComponentHashTechniqueName()
{
  return MEMORY[0x270F1E860]();
}

uint64_t REMaterialParameterBlockArrayComponentResize()
{
  return MEMORY[0x270F1E868]();
}

uint64_t REMaterialParameterBlockArrayComponentReturnBlockValueAtIndex()
{
  return MEMORY[0x270F1E870]();
}

uint64_t REMaterialParameterBlockArrayComponentSetBlockValueAtIndex()
{
  return MEMORY[0x270F1E880]();
}

uint64_t REMaterialParameterBlockArrayComponentSize()
{
  return MEMORY[0x270F1E888]();
}

uint64_t REMaterialParameterBlockValueAddHashedPassTechniqueMapping()
{
  return MEMORY[0x270F1E8D8]();
}

uint64_t REMaterialParameterBlockValueBindTextureToSamplerWithDefaultArray()
{
  return MEMORY[0x270F1E8E0]();
}

uint64_t REMaterialParameterBlockValueClearParameter()
{
  return MEMORY[0x270F1E8E8]();
}

uint64_t REMaterialParameterBlockValueClearSwizzleForTexture()
{
  return MEMORY[0x270F1E8F0]();
}

uint64_t REMaterialParameterBlockValueClearUVIndexForTexture()
{
  return MEMORY[0x270F1E8F8]();
}

uint64_t REMaterialParameterBlockValueCopy()
{
  return MEMORY[0x270F1E900]();
}

uint64_t REMaterialParameterBlockValueCopyParameterNameArray()
{
  return MEMORY[0x270F1E908]();
}

uint64_t REMaterialParameterBlockValueCopySampler()
{
  return MEMORY[0x270F1E910]();
}

uint64_t REMaterialParameterBlockValueCreate()
{
  return MEMORY[0x270F1E918]();
}

uint64_t REMaterialParameterBlockValueGetBool()
{
  return MEMORY[0x270F1E920]();
}

uint64_t REMaterialParameterBlockValueGetColor3()
{
  return MEMORY[0x270F1E928]();
}

uint64_t REMaterialParameterBlockValueGetColor4()
{
  return MEMORY[0x270F1E930]();
}

uint64_t REMaterialParameterBlockValueGetFloat()
{
  return MEMORY[0x270F1E938]();
}

uint64_t REMaterialParameterBlockValueGetFloat2()
{
  return MEMORY[0x270F1E940]();
}

uint64_t REMaterialParameterBlockValueGetFloat2x2()
{
  return MEMORY[0x270F1E948]();
}

uint64_t REMaterialParameterBlockValueGetFloat3()
{
  return MEMORY[0x270F1E950]();
}

uint64_t REMaterialParameterBlockValueGetFloat3x3()
{
  return MEMORY[0x270F1E958]();
}

uint64_t REMaterialParameterBlockValueGetFloat4()
{
  return MEMORY[0x270F1E960]();
}

uint64_t REMaterialParameterBlockValueGetFloat4x4()
{
  return MEMORY[0x270F1E968]();
}

uint64_t REMaterialParameterBlockValueGetInt()
{
  return MEMORY[0x270F1E970]();
}

uint64_t REMaterialParameterBlockValueGetInt2()
{
  return MEMORY[0x270F1E978]();
}

uint64_t REMaterialParameterBlockValueGetInt3()
{
  return MEMORY[0x270F1E980]();
}

uint64_t REMaterialParameterBlockValueGetInt4()
{
  return MEMORY[0x270F1E988]();
}

uint64_t REMaterialParameterBlockValueGetParameterType()
{
  return MEMORY[0x270F1E990]();
}

uint64_t REMaterialParameterBlockValueGetPassTechniqueMapping()
{
  return MEMORY[0x270F1E998]();
}

uint64_t REMaterialParameterBlockValueGetSamplerNameBoundToTexture()
{
  return MEMORY[0x270F1E9A0]();
}

uint64_t REMaterialParameterBlockValueGetSwizzleForTexture()
{
  return MEMORY[0x270F1E9A8]();
}

uint64_t REMaterialParameterBlockValueGetTexture()
{
  return MEMORY[0x270F1E9B0]();
}

uint64_t REMaterialParameterBlockValueGetUInt()
{
  return MEMORY[0x270F1E9B8]();
}

uint64_t REMaterialParameterBlockValueGetUInt2()
{
  return MEMORY[0x270F1E9C0]();
}

uint64_t REMaterialParameterBlockValueGetUInt3()
{
  return MEMORY[0x270F1E9C8]();
}

uint64_t REMaterialParameterBlockValueGetUInt4()
{
  return MEMORY[0x270F1E9D0]();
}

uint64_t REMaterialParameterBlockValueGetUVIndexForTexture()
{
  return MEMORY[0x270F1E9D8]();
}

uint64_t REMaterialParameterBlockValueNumberOfTexturesWithNonZeroUVIndex()
{
  return MEMORY[0x270F1E9E0]();
}

uint64_t REMaterialParameterBlockValueRemovePassTechniqueMapping()
{
  return MEMORY[0x270F1E9E8]();
}

uint64_t REMaterialParameterBlockValueSetColor3()
{
  return MEMORY[0x270F1E9F8]();
}

uint64_t REMaterialParameterBlockValueSetColor4()
{
  return MEMORY[0x270F1EA00]();
}

uint64_t REMaterialParameterBlockValueSetFloat()
{
  return MEMORY[0x270F1EA08]();
}

uint64_t REMaterialParameterBlockValueSetFloat2()
{
  return MEMORY[0x270F1EA10]();
}

uint64_t REMaterialParameterBlockValueSetFloat4()
{
  return MEMORY[0x270F1EA30]();
}

uint64_t REMaterialParameterBlockValueSetSampler()
{
  return MEMORY[0x270F1EA60]();
}

uint64_t REMaterialParameterBlockValueSetSwizzleForTexture()
{
  return MEMORY[0x270F1EA68]();
}

uint64_t REMaterialParameterBlockValueSetTextureFromAsset()
{
  return MEMORY[0x270F1EA70]();
}

uint64_t REMaterialParameterBlockValueSetUVIndexForTexture()
{
  return MEMORY[0x270F1EA98]();
}

uint64_t REMaterialParametersServiceCreatePbrParameters()
{
  return MEMORY[0x270F1EAA0]();
}

uint64_t REMaterialParametersServiceCreateUnlitParameters()
{
  return MEMORY[0x270F1EAA8]();
}

uint64_t REMaterialParametersServiceFindPbrParametersByID()
{
  return MEMORY[0x270F1EAB0]();
}

uint64_t REMaterialParametersServiceFindUnlitParametersByID()
{
  return MEMORY[0x270F1EAB8]();
}

uint64_t REMaterialParametersServiceGetParametersTypeForID()
{
  return MEMORY[0x270F1EAC0]();
}

uint64_t REMaterialRenderStateArrayComponentClearCullModeAtIndex()
{
  return MEMORY[0x270F1EAC8]();
}

uint64_t REMaterialRenderStateArrayComponentClearReadsDepthAtIndex()
{
  return MEMORY[0x270F1EAD0]();
}

uint64_t REMaterialRenderStateArrayComponentClearTriangleFillModeAtIndex()
{
  return MEMORY[0x270F1EAD8]();
}

uint64_t REMaterialRenderStateArrayComponentClearWritesDepthAtIndex()
{
  return MEMORY[0x270F1EAE0]();
}

uint64_t REMaterialRenderStateArrayComponentGetComponentType()
{
  return MEMORY[0x270F1EAE8]();
}

uint64_t REMaterialRenderStateArrayComponentGetCullModeAtIndex()
{
  return MEMORY[0x270F1EAF0]();
}

uint64_t REMaterialRenderStateArrayComponentGetReadsDepthAtIndex()
{
  return MEMORY[0x270F1EAF8]();
}

uint64_t REMaterialRenderStateArrayComponentGetTriangleFillModeAtIndex()
{
  return MEMORY[0x270F1EB00]();
}

uint64_t REMaterialRenderStateArrayComponentGetWritesDepthAtIndex()
{
  return MEMORY[0x270F1EB08]();
}

uint64_t REMaterialRenderStateArrayComponentResize()
{
  return MEMORY[0x270F1EB10]();
}

uint64_t REMaterialRenderStateArrayComponentSetCullModeAtIndex()
{
  return MEMORY[0x270F1EB18]();
}

uint64_t REMaterialRenderStateArrayComponentSetReadsDepthAtIndex()
{
  return MEMORY[0x270F1EB20]();
}

uint64_t REMaterialRenderStateArrayComponentSetTriangleFillModeAtIndex()
{
  return MEMORY[0x270F1EB28]();
}

uint64_t REMaterialRenderStateArrayComponentSetWritesDepthAtIndex()
{
  return MEMORY[0x270F1EB30]();
}

uint64_t REMaterialRenderStateArrayComponentSize()
{
  return MEMORY[0x270F1EB38]();
}

uint64_t REMeshAssetCopyModelPartSkinInfluenceEndIndices()
{
  return MEMORY[0x270F1EB60]();
}

uint64_t REMeshAssetCopyModelPartSkinInfluences()
{
  return MEMORY[0x270F1EB68]();
}

uint64_t REMeshAssetCopySkeletonInverseBindPoseTransforms()
{
  return MEMORY[0x270F1EB70]();
}

uint64_t REMeshAssetCreateBoxDescriptor()
{
  return MEMORY[0x270F1EB78]();
}

uint64_t REMeshAssetCreateBoxWithRoundedCornersDescriptor()
{
  return MEMORY[0x270F1EB80]();
}

uint64_t REMeshAssetCreateCapsuleDescriptor()
{
  return MEMORY[0x270F1EB88]();
}

uint64_t REMeshAssetCreateConeDescriptor()
{
  return MEMORY[0x270F1EB90]();
}

uint64_t REMeshAssetCreateCylinderDescriptor()
{
  return MEMORY[0x270F1EB98]();
}

uint64_t REMeshAssetCreateExtrudedTextDescriptor()
{
  return MEMORY[0x270F1EBA0]();
}

uint64_t REMeshAssetCreatePlaneDescriptor()
{
  return MEMORY[0x270F1EBA8]();
}

uint64_t REMeshAssetCreateSphereDescriptor()
{
  return MEMORY[0x270F1EBB0]();
}

uint64_t REMeshAssetGetAverageInfluenceCount()
{
  return MEMORY[0x270F1EBE0]();
}

uint64_t REMeshAssetGetBlendShapeDefinitionCountForPart()
{
  return MEMORY[0x270F1EBE8]();
}

uint64_t REMeshAssetGetBlendShapeDefinitionNameForPart()
{
  return MEMORY[0x270F1EBF0]();
}

uint64_t REMeshAssetGetBlendShapeGroupCount()
{
  return MEMORY[0x270F1EBF8]();
}

uint64_t REMeshAssetGetBlendShapeGroupDefinitionCount()
{
  return MEMORY[0x270F1EC00]();
}

uint64_t REMeshAssetGetBlendShapeOffsetsForPart()
{
  return MEMORY[0x270F1EC08]();
}

uint64_t REMeshAssetGetDirectMesh()
{
  return MEMORY[0x270F1EC10]();
}

uint64_t REMeshAssetGetInstanceCount()
{
  return MEMORY[0x270F1EC18]();
}

uint64_t REMeshAssetGetInstanceModelIndex()
{
  return MEMORY[0x270F1EC20]();
}

uint64_t REMeshAssetGetInstanceName()
{
  return MEMORY[0x270F1EC28]();
}

uint64_t REMeshAssetGetInstanceTransform()
{
  return MEMORY[0x270F1EC30]();
}

uint64_t REMeshAssetGetMaxMaterialIndex()
{
  return MEMORY[0x270F1EC38]();
}

uint64_t REMeshAssetGetModelCount()
{
  return MEMORY[0x270F1EC40]();
}

uint64_t REMeshAssetGetModelName()
{
  return MEMORY[0x270F1EC48]();
}

uint64_t REMeshAssetGetModelPartBufferAttributeCount()
{
  return MEMORY[0x270F1EC50]();
}

uint64_t REMeshAssetGetModelPartBufferAttributeData()
{
  return MEMORY[0x270F1EC58]();
}

uint64_t REMeshAssetGetModelPartBufferAttributeRate()
{
  return MEMORY[0x270F1EC60]();
}

uint64_t REMeshAssetGetModelPartBufferAttributeType()
{
  return MEMORY[0x270F1EC68]();
}

uint64_t REMeshAssetGetModelPartBufferCount()
{
  return MEMORY[0x270F1EC70]();
}

uint64_t REMeshAssetGetModelPartBufferName()
{
  return MEMORY[0x270F1EC78]();
}

uint64_t REMeshAssetGetModelPartCount()
{
  return MEMORY[0x270F1EC80]();
}

uint64_t REMeshAssetGetModelPartMaterial()
{
  return MEMORY[0x270F1EC88]();
}

uint64_t REMeshAssetGetModelPartName()
{
  return MEMORY[0x270F1EC90]();
}

uint64_t REMeshAssetGetModelPartSkeletonIndex()
{
  return MEMORY[0x270F1EC98]();
}

uint64_t REMeshAssetGetModelPartSkinUniformInfluenceCount()
{
  return MEMORY[0x270F1ECA0]();
}

uint64_t REMeshAssetGetModelVertexCount()
{
  return MEMORY[0x270F1ECA8]();
}

uint64_t REMeshAssetGetSkeletonBindPoseTransform()
{
  return MEMORY[0x270F1ECB8]();
}

uint64_t REMeshAssetGetSkeletonJointCount()
{
  return MEMORY[0x270F1ECC0]();
}

uint64_t REMeshAssetGetSkeletonJointName()
{
  return MEMORY[0x270F1ECC8]();
}

uint64_t REMeshAssetGetSkeletonJointParent()
{
  return MEMORY[0x270F1ECD0]();
}

uint64_t REMeshAssetGetSkeletonName()
{
  return MEMORY[0x270F1ECD8]();
}

uint64_t REMeshAssetGetTotalSkeletonCount()
{
  return MEMORY[0x270F1ECE0]();
}

uint64_t REMeshAssetModelPartBufferAttributeIsSlow()
{
  return MEMORY[0x270F1ECE8]();
}

uint64_t REMeshAssetReplaceAllWithDirectMesh()
{
  return MEMORY[0x270F1ECF0]();
}

uint64_t REMeshAssetReplaceAllWithResource()
{
  return MEMORY[0x270F1ED00]();
}

uint64_t REMeshAssetReplaceAllWithSkinnedModels()
{
  return MEMORY[0x270F1ED08]();
}

uint64_t REMeshAttributeDescriptorArraySetCustomName()
{
  return MEMORY[0x270F1ED10]();
}

uint64_t REMeshAttributeDescriptorCopyAdjacencyDataToBuffer()
{
  return MEMORY[0x270F1ED18]();
}

uint64_t REMeshAttributeDescriptorCopyBitangentsToBuffer()
{
  return MEMORY[0x270F1ED20]();
}

uint64_t REMeshAttributeDescriptorCopyBlendShapeOffsetsToBuffer()
{
  return MEMORY[0x270F1ED28]();
}

uint64_t REMeshAttributeDescriptorCopyColor3sToBuffer()
{
  return MEMORY[0x270F1ED30]();
}

uint64_t REMeshAttributeDescriptorCopyColor4sToBuffer()
{
  return MEMORY[0x270F1ED38]();
}

uint64_t REMeshAttributeDescriptorCopyCustom2sToBuffer()
{
  return MEMORY[0x270F1ED40]();
}

uint64_t REMeshAttributeDescriptorCopyCustom3sToBuffer()
{
  return MEMORY[0x270F1ED48]();
}

uint64_t REMeshAttributeDescriptorCopyCustom4sToBuffer()
{
  return MEMORY[0x270F1ED50]();
}

uint64_t REMeshAttributeDescriptorCopyInfluenceDataToBuffer()
{
  return MEMORY[0x270F1ED58]();
}

uint64_t REMeshAttributeDescriptorCopyJointInfluencesToBuffer()
{
  return MEMORY[0x270F1ED60]();
}

uint64_t REMeshAttributeDescriptorCopyNormalsToBuffer()
{
  return MEMORY[0x270F1ED68]();
}

uint64_t REMeshAttributeDescriptorCopyPositionsToBuffer()
{
  return MEMORY[0x270F1ED70]();
}

uint64_t REMeshAttributeDescriptorCopySkinInfluenceEndIndicesToBuffer()
{
  return MEMORY[0x270F1ED78]();
}

uint64_t REMeshAttributeDescriptorCopyTangentsToBuffer()
{
  return MEMORY[0x270F1ED80]();
}

uint64_t REMeshAttributeDescriptorCopyUVsToBuffer()
{
  return MEMORY[0x270F1ED88]();
}

uint64_t REMeshAttributeDescriptorCopyValenceDataToBuffer()
{
  return MEMORY[0x270F1ED90]();
}

uint64_t REMeshAttributesDescriptorCreate()
{
  return MEMORY[0x270F1ED98]();
}

uint64_t REMeshCompileOptionsClearAttributeCompressionType()
{
  return MEMORY[0x270F1EDA0]();
}

uint64_t REMeshCompileOptionsCreate()
{
  return MEMORY[0x270F1EDA8]();
}

uint64_t REMeshCompileOptionsGetAttributeCompressionType()
{
  return MEMORY[0x270F1EDB0]();
}

uint64_t REMeshCompileOptionsGetGenerateDecimatedMesh()
{
  return MEMORY[0x270F1EDB8]();
}

uint64_t REMeshCompileOptionsGetGenerateVertexFaceAdjacencyAttributes()
{
  return MEMORY[0x270F1EDC0]();
}

uint64_t REMeshCompileOptionsGetMergeVerticesIfPolygonSoup()
{
  return MEMORY[0x270F1EDC8]();
}

uint64_t REMeshCompileOptionsGetPreserveSharpFeatures()
{
  return MEMORY[0x270F1EDD0]();
}

uint64_t REMeshCompileOptionsGetPreserveSubdivisonSurfaceData()
{
  return MEMORY[0x270F1EDD8]();
}

uint64_t REMeshCompileOptionsGetReorderVertexCaching()
{
  return MEMORY[0x270F1EDE0]();
}

uint64_t REMeshCompileOptionsGetRepairTangents()
{
  return MEMORY[0x270F1EDE8]();
}

uint64_t REMeshCompileOptionsSetAttributeCompressionType()
{
  return MEMORY[0x270F1EDF0]();
}

uint64_t REMeshComponentAddMaterial()
{
  return MEMORY[0x270F1EE30]();
}

uint64_t REMeshComponentAddMaterialWithParameters()
{
  return MEMORY[0x270F1EE38]();
}

uint64_t REMeshComponentComputeTriangleCount()
{
  return MEMORY[0x270F1EE40]();
}

uint64_t REMeshComponentGetBoundsMargin()
{
  return MEMORY[0x270F1EE48]();
}

uint64_t REMeshComponentGetComponentType()
{
  return MEMORY[0x270F1EE50]();
}

uint64_t REMeshComponentGetMaterialAtIndex()
{
  return MEMORY[0x270F1EE58]();
}

uint64_t REMeshComponentGetMaterialCount()
{
  return MEMORY[0x270F1EE60]();
}

uint64_t REMeshComponentGetMaterialParametersIDAtIndex()
{
  return MEMORY[0x270F1EE68]();
}

uint64_t REMeshComponentGetMesh()
{
  return MEMORY[0x270F1EE70]();
}

uint64_t REMeshComponentRemoveAllMaterials()
{
  return MEMORY[0x270F1EE78]();
}

uint64_t REMeshComponentSetBoundsMargin()
{
  return MEMORY[0x270F1EE80]();
}

uint64_t REMeshComponentSetMaterialAtIndex()
{
  return MEMORY[0x270F1EE88]();
}

uint64_t REMeshComponentSetMaterialWithParametersAtIndex()
{
  return MEMORY[0x270F1EE90]();
}

uint64_t REMeshComponentSetMesh()
{
  return MEMORY[0x270F1EE98]();
}

uint64_t REMeshDefinitionCreateWithAttributes()
{
  return MEMORY[0x270F1EEA0]();
}

uint64_t REMeshDefinitionSetAttributeWithData()
{
  return MEMORY[0x270F1EEA8]();
}

uint64_t REMeshDefinitionSetCustomAttributeWithData()
{
  return MEMORY[0x270F1EEB8]();
}

uint64_t REMeshDefinitionSetIndicesWithData()
{
  return MEMORY[0x270F1EEC8]();
}

uint64_t REMeshDefinitionSetIndicesWithDataUInt16()
{
  return MEMORY[0x270F1EED0]();
}

uint64_t REMeshDefinitionSetIndicesWithDataUInt32()
{
  return MEMORY[0x270F1EED8]();
}

uint64_t REMeshDefinitionSetSkeletonName()
{
  return MEMORY[0x270F1EEE0]();
}

uint64_t REMeshDeformationComponentGetComponentType()
{
  return MEMORY[0x270F1EEE8]();
}

uint64_t REMeshInstanceDefinitionCreate()
{
  return MEMORY[0x270F1EEF0]();
}

uint64_t REMeshModelDefinitionAppendLevel()
{
  return MEMORY[0x270F1EEF8]();
}

uint64_t REMeshModelDefinitionAppendTrianglesWithName()
{
  return MEMORY[0x270F1EF08]();
}

uint64_t REMeshModelDefinitionCopyName()
{
  return MEMORY[0x270F1EF10]();
}

uint64_t REMeshModelDefinitionCreate()
{
  return MEMORY[0x270F1EF18]();
}

uint64_t REMeshModelDefinitionSetName()
{
  return MEMORY[0x270F1EF20]();
}

uint64_t REMeshResourceDefinitionCreate()
{
  return MEMORY[0x270F1EF28]();
}

uint64_t REMeshSortingComponentCheckIfEqual()
{
  return MEMORY[0x270F1EF30]();
}

uint64_t REMeshSortingComponentCopySortGroup()
{
  return MEMORY[0x270F1EF38]();
}

uint64_t REMeshSortingComponentGetComponentType()
{
  return MEMORY[0x270F1EF40]();
}

uint64_t REMeshSortingComponentGetDepthPriorityInSortGroup()
{
  return MEMORY[0x270F1EF48]();
}

uint64_t REMeshSortingComponentGetIsUI()
{
  return MEMORY[0x270F1EF50]();
}

uint64_t REMeshSortingComponentGetPriorityInSortGroup()
{
  return MEMORY[0x270F1EF58]();
}

uint64_t REMeshSortingComponentSetDepthPriorityInSortGroup()
{
  return MEMORY[0x270F1EF60]();
}

uint64_t REMeshSortingComponentSetIsUI()
{
  return MEMORY[0x270F1EF68]();
}

uint64_t REMeshSortingComponentSetPriorityInSortGroup()
{
  return MEMORY[0x270F1EF70]();
}

uint64_t REMeshSortingComponentSetSortGroup()
{
  return MEMORY[0x270F1EF78]();
}

uint64_t REMetricLoadFile()
{
  return MEMORY[0x270F1EF80]();
}

uint64_t REMotionStateComponentGetAngularVelocity()
{
  return MEMORY[0x270F1EF88]();
}

uint64_t REMotionStateComponentGetComponentType()
{
  return MEMORY[0x270F1EF90]();
}

uint64_t REMotionStateComponentGetLinearVelocity()
{
  return MEMORY[0x270F1EF98]();
}

uint64_t REMotionStateComponentSetAngularVelocity()
{
  return MEMORY[0x270F1EFA0]();
}

uint64_t REMotionStateComponentSetLinearVelocity()
{
  return MEMORY[0x270F1EFA8]();
}

uint64_t RENetCompatibilityCheckCompatibility()
{
  return MEMORY[0x270F1EFB0]();
}

uint64_t RENetCompatibilityCreateDataFromToken()
{
  return MEMORY[0x270F1EFB8]();
}

uint64_t RENetCompatibilityCreateLocalToken()
{
  return MEMORY[0x270F1EFC0]();
}

uint64_t RENetCompatibilityCreateTokenFromData()
{
  return MEMORY[0x270F1EFC8]();
}

uint64_t RENetSyncBufferWrite()
{
  return MEMORY[0x270F1EFD0]();
}

uint64_t RENetworkComponentGetComponentType()
{
  return MEMORY[0x270F1EFE0]();
}

uint64_t RENetworkComponentGuid()
{
  return MEMORY[0x270F1EFE8]();
}

uint64_t RENetworkComponentIsAuthoritative()
{
  return MEMORY[0x270F1EFF0]();
}

uint64_t RENetworkComponentIsOwnershipLocked()
{
  return MEMORY[0x270F1EFF8]();
}

uint64_t RENetworkComponentLockEntity()
{
  return MEMORY[0x270F1F000]();
}

uint64_t RENetworkComponentRequestOwnershipV2()
{
  return MEMORY[0x270F1F010]();
}

uint64_t RENetworkComponentSetAlwaysMigrate()
{
  return MEMORY[0x270F1F018]();
}

uint64_t RENetworkComponentSetSuppressMarkDirty()
{
  return MEMORY[0x270F1F020]();
}

uint64_t RENetworkComponentShouldAlwaysMigrate()
{
  return MEMORY[0x270F1F028]();
}

uint64_t RENetworkComponentUnlockEntity()
{
  return MEMORY[0x270F1F030]();
}

uint64_t RENetworkMarkComponentDirty()
{
  return MEMORY[0x270F1F038]();
}

uint64_t RENetworkMarkEntityMetadataDirty()
{
  return MEMORY[0x270F1F040]();
}

uint64_t RENetworkSystemAddObserver()
{
  return MEMORY[0x270F1F048]();
}

uint64_t RENetworkSystemObserverCreateEx()
{
  return MEMORY[0x270F1F050]();
}

uint64_t RENetworkSystemObserverOnComponentDidUpdate()
{
  return MEMORY[0x270F1F058]();
}

uint64_t RENetworkSystemObserverOnLocalComponentDidUpdate()
{
  return MEMORY[0x270F1F060]();
}

uint64_t RENetworkSystemObserverOnLocalComponentWillRemove()
{
  return MEMORY[0x270F1F068]();
}

uint64_t RENetworkSystemObserverOnLocalEntityDidCreate()
{
  return MEMORY[0x270F1F070]();
}

uint64_t RENetworkSystemObserverOnLocalEntityWillDestroy()
{
  return MEMORY[0x270F1F078]();
}

uint64_t RENetworkSystemRemoveObserver()
{
  return MEMORY[0x270F1F080]();
}

uint64_t REOpacityServiceGetComputedOpacity()
{
  return MEMORY[0x270F1F090]();
}

uint64_t REOrthographicCameraComponentGetComponentType()
{
  return MEMORY[0x270F1F0A0]();
}

uint64_t REOrthographicCameraComponentGetFar()
{
  return MEMORY[0x270F1F0A8]();
}

uint64_t REOrthographicCameraComponentGetNear()
{
  return MEMORY[0x270F1F0B0]();
}

uint64_t REOrthographicCameraComponentGetScale()
{
  return MEMORY[0x270F1F0B8]();
}

uint64_t REOrthographicCameraComponentGetScaleDirection()
{
  return MEMORY[0x270F1F0C0]();
}

uint64_t REOrthographicCameraComponentSetFar()
{
  return MEMORY[0x270F1F0C8]();
}

uint64_t REOrthographicCameraComponentSetNear()
{
  return MEMORY[0x270F1F0D0]();
}

uint64_t REOrthographicCameraComponentSetScale()
{
  return MEMORY[0x270F1F0D8]();
}

uint64_t REOrthographicCameraComponentSetScaleDirection()
{
  return MEMORY[0x270F1F0E0]();
}

uint64_t REPbrMaterialParametersGetColorTexture()
{
  return MEMORY[0x270F1F0E8]();
}

uint64_t REPbrMaterialParametersGetColorTint()
{
  return MEMORY[0x270F1F0F0]();
}

uint64_t REPbrMaterialParametersGetEmissiveScale()
{
  return MEMORY[0x270F1F0F8]();
}

uint64_t REPbrMaterialParametersGetOpacityThreshold()
{
  return MEMORY[0x270F1F100]();
}

uint64_t REPbrMaterialParametersGetUVOffset0()
{
  return MEMORY[0x270F1F108]();
}

uint64_t REPbrMaterialParametersGetUVOffset1()
{
  return MEMORY[0x270F1F110]();
}

uint64_t REPbrMaterialParametersGetUVTransform0()
{
  return MEMORY[0x270F1F118]();
}

uint64_t REPbrMaterialParametersGetUVTransform1()
{
  return MEMORY[0x270F1F120]();
}

uint64_t REPbrMaterialParametersHasClearcoat()
{
  return MEMORY[0x270F1F128]();
}

uint64_t REPbrMaterialParametersHasSheen()
{
  return MEMORY[0x270F1F130]();
}

uint64_t REPbrMaterialParametersIsAnisotropic()
{
  return MEMORY[0x270F1F138]();
}

uint64_t REPbrMaterialParametersSetColorTexture()
{
  return MEMORY[0x270F1F140]();
}

uint64_t REPbrMaterialParametersSetColorTint()
{
  return MEMORY[0x270F1F148]();
}

uint64_t REPbrMaterialParametersSetNormalTexture()
{
  return MEMORY[0x270F1F158]();
}

uint64_t REPerspectiveCameraComponentGetComponentType()
{
  return MEMORY[0x270F1F178]();
}

uint64_t REPerspectiveCameraComponentGetFar()
{
  return MEMORY[0x270F1F180]();
}

uint64_t REPerspectiveCameraComponentGetFieldOfView()
{
  return MEMORY[0x270F1F188]();
}

uint64_t REPerspectiveCameraComponentGetFieldOfViewDirection()
{
  return MEMORY[0x270F1F190]();
}

uint64_t REPerspectiveCameraComponentGetNear()
{
  return MEMORY[0x270F1F198]();
}

uint64_t REPerspectiveCameraComponentSetFar()
{
  return MEMORY[0x270F1F1A0]();
}

uint64_t REPerspectiveCameraComponentSetFieldOfView()
{
  return MEMORY[0x270F1F1A8]();
}

uint64_t REPerspectiveCameraComponentSetFieldOfViewDirection()
{
  return MEMORY[0x270F1F1B0]();
}

uint64_t REPerspectiveCameraComponentSetNear()
{
  return MEMORY[0x270F1F1B8]();
}

uint64_t REPhysicsForceEffectSimplexNoiseDerivative4()
{
  return MEMORY[0x270F1F1C0]();
}

uint64_t REPhysicsJointDefinitionArrayAddPhysicsJointDefinition()
{
  return MEMORY[0x270F1F1C8]();
}

uint64_t REPhysicsJointDefinitionArrayCreate()
{
  return MEMORY[0x270F1F1D0]();
}

uint64_t REPhysicsJointDefinitionCreateCustomJoint()
{
  return MEMORY[0x270F1F1D8]();
}

uint64_t REPhysicsJointDefinitionCreateDistanceJoint()
{
  return MEMORY[0x270F1F1E0]();
}

uint64_t REPhysicsJointDefinitionCreateFixedJoint()
{
  return MEMORY[0x270F1F1E8]();
}

uint64_t REPhysicsJointDefinitionCreatePrismaticJoint()
{
  return MEMORY[0x270F1F1F0]();
}

uint64_t REPhysicsJointDefinitionCreateRevoluteJoint()
{
  return MEMORY[0x270F1F1F8]();
}

uint64_t REPhysicsJointDefinitionCreateSphericalJoint()
{
  return MEMORY[0x270F1F200]();
}

uint64_t REPhysicsJointDefinitionDistanceJointGetDistanceLimit()
{
  return MEMORY[0x270F1F208]();
}

uint64_t REPhysicsJointDefinitionDistanceJointGetTolerance()
{
  return MEMORY[0x270F1F210]();
}

uint64_t REPhysicsJointDefinitionGetAngularLimit()
{
  return MEMORY[0x270F1F218]();
}

uint64_t REPhysicsJointDefinitionGetChecksForCollisions()
{
  return MEMORY[0x270F1F220]();
}

uint64_t REPhysicsJointDefinitionGetEntity()
{
  return MEMORY[0x270F1F228]();
}

uint64_t REPhysicsJointDefinitionGetJointType()
{
  return MEMORY[0x270F1F230]();
}

uint64_t REPhysicsJointDefinitionGetLinearLimit()
{
  return MEMORY[0x270F1F238]();
}

uint64_t REPhysicsJointDefinitionGetOffsetFromPin()
{
  return MEMORY[0x270F1F240]();
}

uint64_t REPhysicsJointDefinitionGetPinName()
{
  return MEMORY[0x270F1F248]();
}

uint64_t REPhysicsJointDefinitionPrismaticJointGetLinearLimitX()
{
  return MEMORY[0x270F1F250]();
}

uint64_t REPhysicsJointDefinitionRevoluteJointGetAngularLimitX()
{
  return MEMORY[0x270F1F258]();
}

uint64_t REPhysicsJointDefinitionSphericalJointGetAngularLimitYZ()
{
  return MEMORY[0x270F1F260]();
}

uint64_t REPhysicsJointsComponentAddPhysicsJointDefinition()
{
  return MEMORY[0x270F1F268]();
}

uint64_t REPhysicsJointsComponentGetComponentType()
{
  return MEMORY[0x270F1F270]();
}

uint64_t REPhysicsJointsComponentGetJointCount()
{
  return MEMORY[0x270F1F278]();
}

uint64_t REPhysicsJointsComponentGetPhysicsJointDefinitionAtIndex()
{
  return MEMORY[0x270F1F280]();
}

uint64_t REPhysicsJointsComponentIsJointAtIndexActive()
{
  return MEMORY[0x270F1F288]();
}

uint64_t REPhysicsJointsComponentSetPhysicsJointDefinitionArray()
{
  return MEMORY[0x270F1F290]();
}

uint64_t REPhysicsMaterialAssetGetDynamicFriction()
{
  return MEMORY[0x270F1F298]();
}

uint64_t REPhysicsMaterialAssetGetRestitution()
{
  return MEMORY[0x270F1F2A0]();
}

uint64_t REPhysicsMaterialAssetGetStaticFriction()
{
  return MEMORY[0x270F1F2A8]();
}

uint64_t REPhysicsOriginComponentGetComponentType()
{
  return MEMORY[0x270F1F2B0]();
}

uint64_t REPhysicsSimulationComponentGetComponentType()
{
  return MEMORY[0x270F1F2B8]();
}

uint64_t REPhysicsSimulationComponentGetGravityOverride()
{
  return MEMORY[0x270F1F2C0]();
}

uint64_t REPhysicsSimulationComponentGetKinematicVsKinematicFlag()
{
  return MEMORY[0x270F1F2C8]();
}

uint64_t REPhysicsSimulationComponentGetKinematicVsStaticFlag()
{
  return MEMORY[0x270F1F2D0]();
}

uint64_t REPhysicsSimulationComponentGetParentTimebase()
{
  return MEMORY[0x270F1F2D8]();
}

uint64_t REPhysicsSimulationComponentGetSolverIterations()
{
  return MEMORY[0x270F1F2E0]();
}

uint64_t REPhysicsSimulationComponentSetGravityOverride()
{
  return MEMORY[0x270F1F2E8]();
}

uint64_t REPhysicsSimulationComponentSetKinematicFlags()
{
  return MEMORY[0x270F1F2F0]();
}

uint64_t REPhysicsSimulationComponentSetParentTimebase()
{
  return MEMORY[0x270F1F2F8]();
}

uint64_t REPhysicsSimulationComponentSetSolverIterations()
{
  return MEMORY[0x270F1F300]();
}

uint64_t REPhysicsSimulationServiceGetDefaultGravity()
{
  return MEMORY[0x270F1F308]();
}

uint64_t REPhysicsSimulationServiceGetDefaultInitialAngularDamping()
{
  return MEMORY[0x270F1F310]();
}

uint64_t REPhysicsSimulationServiceGetDefaultInitialLinearDamping()
{
  return MEMORY[0x270F1F318]();
}

uint64_t REPhysicsSimulationServiceGetRootSimulationEntity()
{
  return MEMORY[0x270F1F320]();
}

uint64_t REPhysicsSimulationServiceSetDefaultGravity()
{
  return MEMORY[0x270F1F330]();
}

uint64_t REPinComponentAddPin()
{
  return MEMORY[0x270F1F338]();
}

uint64_t REPinComponentGetComponentType()
{
  return MEMORY[0x270F1F340]();
}

uint64_t REPinComponentGetPinByName()
{
  return MEMORY[0x270F1F348]();
}

uint64_t REPinComponentGetPinCount()
{
  return MEMORY[0x270F1F350]();
}

uint64_t REPinComponentGetPinNameAtIndex()
{
  return MEMORY[0x270F1F358]();
}

uint64_t REPinComponentGetPinOffsetPoseAtIndex()
{
  return MEMORY[0x270F1F360]();
}

uint64_t REPinComponentGetSkeletalJointNameAtIndex()
{
  return MEMORY[0x270F1F368]();
}

uint64_t REPinComponentIsSkeletalJointPinAtIndex()
{
  return MEMORY[0x270F1F370]();
}

uint64_t REPinComponentRemoveAllPins()
{
  return MEMORY[0x270F1F378]();
}

uint64_t REPinComponentRemovePin()
{
  return MEMORY[0x270F1F380]();
}

uint64_t REPinCreateExt()
{
  return MEMORY[0x270F1F388]();
}

uint64_t REPinGetOffsetPose()
{
  return MEMORY[0x270F1F390]();
}

uint64_t REPinGetSkeletalJointName()
{
  return MEMORY[0x270F1F398]();
}

uint64_t REPinIsSkeletalJointPin()
{
  return MEMORY[0x270F1F3A0]();
}

uint64_t REPointLightComponentGetAttenuationFalloffExponent()
{
  return MEMORY[0x270F1F3A8]();
}

uint64_t REPointLightComponentGetAttenuationRadius()
{
  return MEMORY[0x270F1F3B0]();
}

uint64_t REPointLightComponentGetColorGamut3F()
{
  return MEMORY[0x270F1F3B8]();
}

uint64_t REPointLightComponentGetComponentType()
{
  return MEMORY[0x270F1F3C0]();
}

uint64_t REPointLightComponentGetIntensity()
{
  return MEMORY[0x270F1F3C8]();
}

uint64_t REPointLightComponentSetAttenuationFalloffExponent()
{
  return MEMORY[0x270F1F3D0]();
}

uint64_t REPointLightComponentSetAttenuationRadius()
{
  return MEMORY[0x270F1F3D8]();
}

uint64_t REPointLightComponentSetColorGamut3F()
{
  return MEMORY[0x270F1F3E0]();
}

uint64_t REPointLightComponentSetIntensity()
{
  return MEMORY[0x270F1F3E8]();
}

uint64_t REPointLightShadowMapComponentGetComponentType()
{
  return MEMORY[0x270F1F3F0]();
}

uint64_t REPointLightShadowMapComponentGetCullModeEx()
{
  return MEMORY[0x270F1F3F8]();
}

uint64_t REPointLightShadowMapComponentGetDepthBias()
{
  return MEMORY[0x270F1F400]();
}

uint64_t REPointLightShadowMapComponentGetZFar()
{
  return MEMORY[0x270F1F408]();
}

uint64_t REPointLightShadowMapComponentGetZNear()
{
  return MEMORY[0x270F1F410]();
}

uint64_t REPointLightShadowMapComponentSetCullMode()
{
  return MEMORY[0x270F1F418]();
}

uint64_t REPointLightShadowMapComponentSetDepthBias()
{
  return MEMORY[0x270F1F420]();
}

uint64_t REPointLightShadowMapComponentSetZFar()
{
  return MEMORY[0x270F1F428]();
}

uint64_t REPointLightShadowMapComponentSetZNear()
{
  return MEMORY[0x270F1F430]();
}

uint64_t REPortalComponentGetAllowsCrossing()
{
  return MEMORY[0x270F1F438]();
}

uint64_t REPortalComponentGetClipPlaneNormal()
{
  return MEMORY[0x270F1F440]();
}

uint64_t REPortalComponentGetClipPlanePosition()
{
  return MEMORY[0x270F1F448]();
}

uint64_t REPortalComponentGetComponentType()
{
  return MEMORY[0x270F1F450]();
}

uint64_t REPortalComponentGetCrossPlaneNormal()
{
  return MEMORY[0x270F1F458]();
}

uint64_t REPortalComponentGetCrossPlanePosition()
{
  return MEMORY[0x270F1F460]();
}

uint64_t REPortalComponentGetTargetWorldEntity()
{
  return MEMORY[0x270F1F468]();
}

uint64_t REPortalComponentGetUseClipPlane()
{
  return MEMORY[0x270F1F470]();
}

uint64_t REPortalComponentSetAllowsCrossing()
{
  return MEMORY[0x270F1F478]();
}

uint64_t REPortalComponentSetClipPlaneNormal()
{
  return MEMORY[0x270F1F480]();
}

uint64_t REPortalComponentSetClipPlanePosition()
{
  return MEMORY[0x270F1F488]();
}

uint64_t REPortalComponentSetCrossPlaneNormal()
{
  return MEMORY[0x270F1F490]();
}

uint64_t REPortalComponentSetCrossPlanePosition()
{
  return MEMORY[0x270F1F498]();
}

uint64_t REPortalComponentSetInheritsIBL()
{
  return MEMORY[0x270F1F4A0]();
}

uint64_t REPortalComponentSetInheritsProbeLighting()
{
  return MEMORY[0x270F1F4A8]();
}

uint64_t REPortalComponentSetTargetWorldEntity()
{
  return MEMORY[0x270F1F4B0]();
}

uint64_t REPortalComponentSetUseClipPlane()
{
  return MEMORY[0x270F1F4B8]();
}

uint64_t REPortalComponentUnsetTargetWorldRoot()
{
  return MEMORY[0x270F1F4C0]();
}

uint64_t REPortalCrossingFlagsComponentSetEnabled()
{
  return MEMORY[0x270F1F4C8]();
}

uint64_t REPortalCrossingFlagsComponentSetInherited()
{
  return MEMORY[0x270F1F4D0]();
}

uint64_t REPoseAreAlmostEqualWithDefaultTolerance()
{
  return MEMORY[0x270F1F4D8]();
}

uint64_t REPoseIdentity()
{
  return MEMORY[0x270F1F4E0]();
}

uint64_t REPoseMultiply()
{
  return MEMORY[0x270F1F4E8]();
}

uint64_t REProjectiveShadowReceiverComponentAddToEntity()
{
  return MEMORY[0x270F1F598]();
}

uint64_t REProjectiveShadowReceiverComponentGetComponentType()
{
  return MEMORY[0x270F1F5A0]();
}

uint64_t REProjectiveShadowReceiverComponentGetShadowIntensity()
{
  return MEMORY[0x270F1F5A8]();
}

uint64_t REQueryConnectEntityPredicates()
{
  return MEMORY[0x270F1F5B8]();
}

uint64_t REQueryCreateComponentQuery()
{
  return MEMORY[0x270F1F5C0]();
}

uint64_t REQueryCreateCustomComponentPredicate()
{
  return MEMORY[0x270F1F5C8]();
}

uint64_t REQueryCreateCustomEntityPredicate()
{
  return MEMORY[0x270F1F5D0]();
}

uint64_t REQueryCreateEntityQuery()
{
  return MEMORY[0x270F1F5D8]();
}

uint64_t REQueryCreateHasEntityPredicate()
{
  return MEMORY[0x270F1F5E0]();
}

uint64_t REQueryCreateIsChildCallbackEntityPredicate()
{
  return MEMORY[0x270F1F5E8]();
}

uint64_t REQueryCreateIsChildEntityPredicate()
{
  return MEMORY[0x270F1F5F0]();
}

uint64_t REQueryCreateIsDescendantCallbackEntityPredicate()
{
  return MEMORY[0x270F1F5F8]();
}

uint64_t REQueryCreateIsDescendantEntityPredicate()
{
  return MEMORY[0x270F1F600]();
}

uint64_t REQueryEvaluateComponentQuery()
{
  return MEMORY[0x270F1F608]();
}

uint64_t REQueryEvaluateEntityQuery()
{
  return MEMORY[0x270F1F610]();
}

uint64_t REQueryEvaluateEntityQueryWithRootEntity()
{
  return MEMORY[0x270F1F618]();
}

uint64_t RERayTracedShadowReceiverComponentGetComponentType()
{
  return MEMORY[0x270F1F620]();
}

uint64_t RERealityFileAssetDescriptorAsSceneDescriptor()
{
  return MEMORY[0x270F1F628]();
}

uint64_t RERealityFileAssetDescriptorGetFilename()
{
  return MEMORY[0x270F1F630]();
}

uint64_t RERealityFileAssetWriteReportCreate()
{
  return MEMORY[0x270F1F638]();
}

uint64_t RERealityFileAssetWriteReportGetError()
{
  return MEMORY[0x270F1F640]();
}

uint64_t RERealityFileAssetWriteReportGetSerializationString()
{
  return MEMORY[0x270F1F648]();
}

uint64_t RERealityFileCopyConfigurationNamesAtSetIndex()
{
  return MEMORY[0x270F1F650]();
}

uint64_t RERealityFileCopyConfigurationSetNames()
{
  return MEMORY[0x270F1F658]();
}

uint64_t RERealityFileCopyDefaultConfigurationNames()
{
  return MEMORY[0x270F1F660]();
}

uint64_t RERealityFileCopyTextureDescriptor()
{
  return MEMORY[0x270F1F668]();
}

uint64_t RERealityFileCopyURLFromDescriptor()
{
  return MEMORY[0x270F1F670]();
}

uint64_t RERealityFileCreateAssetDescriptorFromLabel()
{
  return MEMORY[0x270F1F678]();
}

uint64_t RERealityFileCreateAssetDescriptorWithEntryNameAndPostLoad()
{
  return MEMORY[0x270F1F680]();
}

uint64_t RERealityFileCreateAssetDescriptorWithEntryNameAndTextureDownsampleHint()
{
  return MEMORY[0x270F1F688]();
}

uint64_t RERealityFileCreateByOpeningFileAtURL()
{
  return MEMORY[0x270F1F690]();
}

uint64_t RERealityFileGetAssetDescriptorAtIndex()
{
  return MEMORY[0x270F1F698]();
}

uint64_t RERealityFileGetAssetDescriptorCount()
{
  return MEMORY[0x270F1F6A0]();
}

uint64_t RERealityFileGetCertifiedFreeOfChangeSceneActions()
{
  return MEMORY[0x270F1F6A8]();
}

uint64_t RERealityFileGetMajorVersionNumber()
{
  return MEMORY[0x270F1F6B0]();
}

uint64_t RERealityFileGetMinVersionFromRealityFileHeader()
{
  return MEMORY[0x270F1F6B8]();
}

uint64_t RERealityFileGetRealityFileAssetDescriptorWithConfigurationSpecifications()
{
  return MEMORY[0x270F1F6C0]();
}

uint64_t RERealityFileGetRealityFileHeader()
{
  return MEMORY[0x270F1F6C8]();
}

uint64_t RERealityFileHeaderCreateFromVersionInfo()
{
  return MEMORY[0x270F1F6D0]();
}

uint64_t RERealityFileMountFileAtURL()
{
  return MEMORY[0x270F1F6D8]();
}

uint64_t RERealityFileMountFileAtURLWithAliasName()
{
  return MEMORY[0x270F1F6E0]();
}

uint64_t RERealityFileMountFileInBundle()
{
  return MEMORY[0x270F1F6E8]();
}

uint64_t RERealityFilePostLoadProcessing()
{
  return MEMORY[0x270F1F6F0]();
}

uint64_t RERealityFileUnmount()
{
  return MEMORY[0x270F1F6F8]();
}

uint64_t RERealityFileWriterAddPathRemappingCustomizationCallback()
{
  return MEMORY[0x270F1F700]();
}

uint64_t RERealityFileWriterAddRemappingCustomizationCallback()
{
  return MEMORY[0x270F1F708]();
}

uint64_t RERealityFileWriterAddSceneRemappingCallback()
{
  return MEMORY[0x270F1F710]();
}

uint64_t RERealityFileWriterCertifyFreeOfChangeSceneActions()
{
  return MEMORY[0x270F1F718]();
}

uint64_t RERealityFileWriterClose()
{
  return MEMORY[0x270F1F720]();
}

uint64_t RERealityFileWriterCreateWithParameters()
{
  return MEMORY[0x270F1F728]();
}

uint64_t RERealityFileWriterGetDefaultVersion()
{
  return MEMORY[0x270F1F730]();
}

uint64_t RERealityFileWriterGetMaxVersion()
{
  return MEMORY[0x270F1F738]();
}

uint64_t RERealityFileWriterGetVersionFromDeploymentTarget()
{
  return MEMORY[0x270F1F740]();
}

uint64_t RERealityFileWriterOpen()
{
  return MEMORY[0x270F1F748]();
}

uint64_t RERealityFileWriterSetCompressionMethod()
{
  return MEMORY[0x270F1F750]();
}

uint64_t RERealityFileWriterSetConfigurationSetNames()
{
  return MEMORY[0x270F1F758]();
}

uint64_t RERealityFileWriterSetDefaultConfigurationNames()
{
  return MEMORY[0x270F1F760]();
}

uint64_t RERealityFileWriterWriteAsset()
{
  return MEMORY[0x270F1F770]();
}

uint64_t RERealityFileWriterWriteAssetArrayAndDependencies()
{
  return MEMORY[0x270F1F778]();
}

uint64_t RERealityFileWriterWriteDataEntry()
{
  return MEMORY[0x270F1F780]();
}

uint64_t RERealityFileWritingParametersCreate()
{
  return MEMORY[0x270F1F788]();
}

uint64_t RERealityFileWritingParametersSetCrossEngineValidationDisablement()
{
  return MEMORY[0x270F1F790]();
}

uint64_t RERealityFileWritingParametersSetMajorVersion()
{
  return MEMORY[0x270F1F798]();
}

uint64_t RERealityFileWritingParametersSetMakeSnapshotOfDynamicTextures()
{
  return MEMORY[0x270F1F7A0]();
}

uint64_t RERealityFileWritingParametersSetRestrictedToSeed()
{
  return MEMORY[0x270F1F7A8]();
}

uint64_t RERealityFileWritingParametersSetTargetPlatform()
{
  return MEMORY[0x270F1F7B0]();
}

uint64_t RERectAreaLightComponentGetComponentType()
{
  return MEMORY[0x270F1F7B8]();
}

uint64_t REReferenceComponentGetBundlePath()
{
  return MEMORY[0x270F1F7D8]();
}

uint64_t REReferenceComponentGetComponentType()
{
  return MEMORY[0x270F1F7E0]();
}

uint64_t REReferenceComponentGetEntityName()
{
  return MEMORY[0x270F1F7E8]();
}

uint64_t REReferenceComponentGetLoadingPolicy()
{
  return MEMORY[0x270F1F7F0]();
}

uint64_t REReferenceComponentGetLoadingState()
{
  return MEMORY[0x270F1F7F8]();
}

uint64_t REReferenceComponentGetReferenceSourceType()
{
  return MEMORY[0x270F1F800]();
}

uint64_t REReferenceComponentGetSubscene()
{
  return MEMORY[0x270F1F808]();
}

uint64_t REReferenceComponentSetBundlePath()
{
  return MEMORY[0x270F1F810]();
}

uint64_t REReferenceComponentSetEntityName()
{
  return MEMORY[0x270F1F818]();
}

uint64_t REReferenceComponentSetLoadingPolicy()
{
  return MEMORY[0x270F1F820]();
}

uint64_t REReferenceComponentSetLoadingState()
{
  return MEMORY[0x270F1F828]();
}

uint64_t REReferenceComponentSetSubscene()
{
  return MEMORY[0x270F1F830]();
}

uint64_t RERegisterCustomSystem()
{
  return MEMORY[0x270F1F838]();
}

uint64_t RERegisterSwiftCodableCallbacks()
{
  return MEMORY[0x270F1F840]();
}

uint64_t RERegisterSwiftCodableComponent()
{
  return MEMORY[0x270F1F848]();
}

uint64_t RERelease()
{
  return MEMORY[0x270F1F850]();
}

uint64_t RERemoteEffectsComponentGetColorTint()
{
  return MEMORY[0x270F1F858]();
}

uint64_t RERemoteEffectsComponentGetComponentType()
{
  return MEMORY[0x270F1F860]();
}

uint64_t RERemoteEffectsComponentGetGlowAppearDurationOverride()
{
  return MEMORY[0x270F1F868]();
}

uint64_t RERemoteEffectsComponentGetGlowDisappearDurationOverride()
{
  return MEMORY[0x270F1F870]();
}

uint64_t RERemoteEffectsComponentGetIntensityMultiplier()
{
  return MEMORY[0x270F1F878]();
}

uint64_t RERemoteEffectsComponentGetOpacityFunction()
{
  return MEMORY[0x270F1F880]();
}

uint64_t RERemoteEffectsComponentGetStyle()
{
  return MEMORY[0x270F1F888]();
}

uint64_t RERemoteEffectsComponentIsHierarchical()
{
  return MEMORY[0x270F1F890]();
}

uint64_t RERemoteEffectsComponentResetGlowAppearDurationOverride()
{
  return MEMORY[0x270F1F898]();
}

uint64_t RERemoteEffectsComponentResetGlowDisappearDurationOverride()
{
  return MEMORY[0x270F1F8A0]();
}

uint64_t RERemoteEffectsComponentSetColorTint()
{
  return MEMORY[0x270F1F8A8]();
}

uint64_t RERemoteEffectsComponentSetEnableEntityHoverEffect()
{
  return MEMORY[0x270F1F8B0]();
}

uint64_t RERemoteEffectsComponentSetGlowAppearDurationOverride()
{
  return MEMORY[0x270F1F8B8]();
}

uint64_t RERemoteEffectsComponentSetGlowDisappearDurationOverride()
{
  return MEMORY[0x270F1F8C0]();
}

uint64_t RERemoteEffectsComponentSetIntensityMultiplier()
{
  return MEMORY[0x270F1F8C8]();
}

uint64_t RERemoteEffectsComponentSetIsHierarchical()
{
  return MEMORY[0x270F1F8D0]();
}

uint64_t RERemoteEffectsComponentSetOpacityFunction()
{
  return MEMORY[0x270F1F8D8]();
}

uint64_t RERemoteEffectsComponentSetStyle()
{
  return MEMORY[0x270F1F8E0]();
}

uint64_t RERemoteEffectsComponentSetVersion()
{
  return MEMORY[0x270F1F8E8]();
}

uint64_t RERenderFrameSettingsAddGpuSignalEvent()
{
  return MEMORY[0x270F1F920]();
}

uint64_t RERenderFrameSettingsAddGpuWaitEvent()
{
  return MEMORY[0x270F1F928]();
}

uint64_t RERenderFrameSettingsSetTotalTime()
{
  return MEMORY[0x270F1F930]();
}

uint64_t RERenderFrameWorkloadAddCompletedHandler()
{
  return MEMORY[0x270F1F938]();
}

uint64_t RERenderFrameWorkloadAddScheduledHandler()
{
  return MEMORY[0x270F1F940]();
}

uint64_t RERenderFrameWorkloadCommit()
{
  return MEMORY[0x270F1F948]();
}

uint64_t RERenderFrameWorkloadConfigure()
{
  return MEMORY[0x270F1F958]();
}

uint64_t RERenderGraphAssetSetRuntimeNodeSettingBool()
{
  return MEMORY[0x270F1F960]();
}

uint64_t RERenderGraphAssetSetRuntimeNodeStringSetting()
{
  return MEMORY[0x270F1F968]();
}

uint64_t RERenderGraphDataStructAddBool()
{
  return MEMORY[0x270F1F970]();
}

uint64_t RERenderGraphDataStructAddFloat4()
{
  return MEMORY[0x270F1F978]();
}

uint64_t RERenderGraphEmitterAssetExecute()
{
  return MEMORY[0x270F1F980]();
}

uint64_t RERenderGraphEmitterAssetRegisterProviders()
{
  return MEMORY[0x270F1F988]();
}

uint64_t RERenderGraphEmitterAssetUnregisterProviders()
{
  return MEMORY[0x270F1F990]();
}

uint64_t RERenderManagerCreateRenderFrameSettings()
{
  return MEMORY[0x270F1F9A0]();
}

uint64_t RERenderManagerCreateRenderFrameWorkload()
{
  return MEMORY[0x270F1F9A8]();
}

uint64_t RERenderManagerGetRenderCommandQueue()
{
  return MEMORY[0x270F1F9C8]();
}

uint64_t RERenderManagerGetRenderDevice()
{
  return MEMORY[0x270F1F9D0]();
}

uint64_t RERenderOptionsComponentGetCastsShadowsOverride()
{
  return MEMORY[0x270F1FA38]();
}

uint64_t RERenderOptionsComponentGetComponentType()
{
  return MEMORY[0x270F1FA40]();
}

uint64_t RERenderOptionsComponentGetVisibilityMode()
{
  return MEMORY[0x270F1FA48]();
}

uint64_t RERenderOptionsComponentSetVisibilityMode()
{
  return MEMORY[0x270F1FA50]();
}

uint64_t RERetain()
{
  return MEMORY[0x270F1FA58]();
}

uint64_t REReverbComponentGetComponentType()
{
  return MEMORY[0x270F1FA60]();
}

uint64_t REReverbComponentGetReverbPreset()
{
  return MEMORY[0x270F1FA68]();
}

uint64_t REReverbComponentSetPriority()
{
  return MEMORY[0x270F1FA70]();
}

uint64_t REReverbComponentSetReverbPreset()
{
  return MEMORY[0x270F1FA78]();
}

uint64_t REReverbComponentSetReverbPresetWithBlend()
{
  return MEMORY[0x270F1FA80]();
}

uint64_t RERigAssetCreateBipedToBipedAutoRetargetAsset()
{
  return MEMORY[0x270F1FA88]();
}

uint64_t RERigComponentGetComponentType()
{
  return MEMORY[0x270F1FA90]();
}

uint64_t RERigComponentSetRig()
{
  return MEMORY[0x270F1FA98]();
}

uint64_t RERigidBodyApplyLinearImpulse()
{
  return MEMORY[0x270F1FAA0]();
}

uint64_t RERigidBodyClearForces()
{
  return MEMORY[0x270F1FAA8]();
}

uint64_t RERigidBodyComponentAddUserAngularImpulse()
{
  return MEMORY[0x270F1FAB0]();
}

uint64_t RERigidBodyComponentAddUserForce()
{
  return MEMORY[0x270F1FAB8]();
}

uint64_t RERigidBodyComponentAddUserLinearImpulse()
{
  return MEMORY[0x270F1FAC0]();
}

uint64_t RERigidBodyComponentAddUserTorque()
{
  return MEMORY[0x270F1FAC8]();
}

uint64_t RERigidBodyComponentGetAngularDamping()
{
  return MEMORY[0x270F1FAD0]();
}

uint64_t RERigidBodyComponentGetCCDEnabled()
{
  return MEMORY[0x270F1FAD8]();
}

uint64_t RERigidBodyComponentGetComponentType()
{
  return MEMORY[0x270F1FAE0]();
}

uint64_t RERigidBodyComponentGetGravityEnabled()
{
  return MEMORY[0x270F1FAE8]();
}

uint64_t RERigidBodyComponentGetLinearDamping()
{
  return MEMORY[0x270F1FAF0]();
}

uint64_t RERigidBodyComponentGetLockRotationX()
{
  return MEMORY[0x270F1FAF8]();
}

uint64_t RERigidBodyComponentGetLockRotationY()
{
  return MEMORY[0x270F1FB00]();
}

uint64_t RERigidBodyComponentGetLockRotationZ()
{
  return MEMORY[0x270F1FB08]();
}

uint64_t RERigidBodyComponentGetLockTranslationX()
{
  return MEMORY[0x270F1FB10]();
}

uint64_t RERigidBodyComponentGetLockTranslationY()
{
  return MEMORY[0x270F1FB18]();
}

uint64_t RERigidBodyComponentGetLockTranslationZ()
{
  return MEMORY[0x270F1FB20]();
}

uint64_t RERigidBodyComponentGetMassFrame()
{
  return MEMORY[0x270F1FB28]();
}

uint64_t RERigidBodyComponentGetMaterial()
{
  return MEMORY[0x270F1FB30]();
}

uint64_t RERigidBodyComponentGetMotionType()
{
  return MEMORY[0x270F1FB38]();
}

uint64_t RERigidBodyComponentGetRigidBody()
{
  return MEMORY[0x270F1FB40]();
}

uint64_t RERigidBodyComponentIncrementVersion()
{
  return MEMORY[0x270F1FB48]();
}

uint64_t RERigidBodyComponentSetAngularDamping()
{
  return MEMORY[0x270F1FB50]();
}

uint64_t RERigidBodyComponentSetCCDEnabled()
{
  return MEMORY[0x270F1FB58]();
}

uint64_t RERigidBodyComponentSetCCDVelocityThreshold()
{
  return MEMORY[0x270F1FB60]();
}

uint64_t RERigidBodyComponentSetCanSleep()
{
  return MEMORY[0x270F1FB68]();
}

uint64_t RERigidBodyComponentSetGravityEnabled()
{
  return MEMORY[0x270F1FB70]();
}

uint64_t RERigidBodyComponentSetLinearDamping()
{
  return MEMORY[0x270F1FB78]();
}

uint64_t RERigidBodyComponentSetLockRotationX()
{
  return MEMORY[0x270F1FB80]();
}

uint64_t RERigidBodyComponentSetLockRotationY()
{
  return MEMORY[0x270F1FB88]();
}

uint64_t RERigidBodyComponentSetLockRotationZ()
{
  return MEMORY[0x270F1FB90]();
}

uint64_t RERigidBodyComponentSetLockTranslationX()
{
  return MEMORY[0x270F1FB98]();
}

uint64_t RERigidBodyComponentSetLockTranslationY()
{
  return MEMORY[0x270F1FBA0]();
}

uint64_t RERigidBodyComponentSetLockTranslationZ()
{
  return MEMORY[0x270F1FBA8]();
}

uint64_t RERigidBodyComponentSetMassFrame()
{
  return MEMORY[0x270F1FBB0]();
}

uint64_t RERigidBodyComponentSetMaterial()
{
  return MEMORY[0x270F1FBB8]();
}

uint64_t RERigidBodyComponentSetMotionType()
{
  return MEMORY[0x270F1FBC0]();
}

uint64_t RERigidBodyComponentTeleport()
{
  return MEMORY[0x270F1FBC8]();
}

uint64_t RERigidBodyGetEntity()
{
  return MEMORY[0x270F1FBD0]();
}

uint64_t RERigidBodyGetMassFrame()
{
  return MEMORY[0x270F1FBD8]();
}

uint64_t RERigidBodySleep()
{
  return MEMORY[0x270F1FBE0]();
}

uint64_t RERigidBodyWakeUp()
{
  return MEMORY[0x270F1FBE8]();
}

uint64_t RESRTIdentity()
{
  return MEMORY[0x270F1FBF0]();
}

uint64_t RESRTInverse()
{
  return MEMORY[0x270F1FBF8]();
}

uint64_t RESRTLerp()
{
  return MEMORY[0x270F1FC00]();
}

uint64_t RESRTMatrix()
{
  return MEMORY[0x270F1FC08]();
}

uint64_t RESampledAnimationDefaultParameters()
{
  return MEMORY[0x270F1FC10]();
}

uint64_t RESceneAddDefaultSystems()
{
  return MEMORY[0x270F1FC18]();
}

uint64_t RESceneAddEDRColorManagementComponent()
{
  return MEMORY[0x270F1FC20]();
}

uint64_t RESceneAddEntity()
{
  return MEMORY[0x270F1FC28]();
}

uint64_t RESceneAssetGetRequiredRealityFileVersion()
{
  return MEMORY[0x270F1FC38]();
}

uint64_t RESceneCompatibilityVariantGetFileName()
{
  return MEMORY[0x270F1FC40]();
}

uint64_t RESceneCompatibilityVariantGetVersion()
{
  return MEMORY[0x270F1FC48]();
}

uint64_t RESceneCreate()
{
  return MEMORY[0x270F1FC50]();
}

uint64_t RESceneDereferenceComponentCollectionPosition()
{
  return MEMORY[0x270F1FC58]();
}

uint64_t RESceneDescriptorAddSceneCompatibilityVariant()
{
  return MEMORY[0x270F1FC60]();
}

uint64_t RESceneDescriptorCreateFromParams()
{
  return MEMORY[0x270F1FC68]();
}

uint64_t RESceneDescriptorGetSceneCompatibilityVariantAtIndex()
{
  return MEMORY[0x270F1FC70]();
}

uint64_t RESceneDescriptorGetSceneCompatibilityVariantCount()
{
  return MEMORY[0x270F1FC78]();
}

uint64_t RESceneDescriptorGetSceneIdentifier()
{
  return MEMORY[0x270F1FC80]();
}

uint64_t RESceneDescriptorGetSceneName()
{
  return MEMORY[0x270F1FC88]();
}

uint64_t RESceneDescriptorIsEqual()
{
  return MEMORY[0x270F1FC90]();
}

uint64_t RESceneFindEntity()
{
  return MEMORY[0x270F1FC98]();
}

uint64_t RESceneFindEntityByName()
{
  return MEMORY[0x270F1FCA0]();
}

uint64_t RESceneFindFirstCameraComponent()
{
  return MEMORY[0x270F1FCA8]();
}

uint64_t RESceneGetAllEntitiesArray()
{
  return MEMORY[0x270F1FCB0]();
}

uint64_t RESceneGetComponentsOfClass()
{
  return MEMORY[0x270F1FCB8]();
}

uint64_t RESceneGetComponentsOfCustomType()
{
  return MEMORY[0x270F1FCC0]();
}

uint64_t RESceneGetComponentsOfType()
{
  return MEMORY[0x270F1FCC8]();
}

uint64_t RESceneGetECSManagerNullable()
{
  return MEMORY[0x270F1FCD0]();
}

uint64_t RESceneGetEntitiesArray()
{
  return MEMORY[0x270F1FCD8]();
}

uint64_t RESceneGetEntityIndexInParent()
{
  return MEMORY[0x270F1FCE0]();
}

uint64_t RESceneGetEventBus()
{
  return MEMORY[0x270F1FCE8]();
}

uint64_t RESceneGetName()
{
  return MEMORY[0x270F1FCF8]();
}

uint64_t RESceneGetSwiftObject()
{
  return MEMORY[0x270F1FD00]();
}

uint64_t RESceneImportGetUSDActionAssets()
{
  return MEMORY[0x270F1FD10]();
}

uint64_t RESceneImportOperationCopySceneIdentifierAtIndex()
{
  return MEMORY[0x270F1FD18]();
}

uint64_t RESceneImportOperationCopySceneNameAtIndex()
{
  return MEMORY[0x270F1FD20]();
}

uint64_t RESceneImportOperationCopySourceURL()
{
  return MEMORY[0x270F1FD28]();
}

uint64_t RESceneImportOperationCreateWithBundleResource()
{
  return MEMORY[0x270F1FD30]();
}

uint64_t RESceneImportOperationCreateWithURL()
{
  return MEMORY[0x270F1FD38]();
}

uint64_t RESceneImportOperationGetSceneAsset()
{
  return MEMORY[0x270F1FD40]();
}

uint64_t RESceneImportOperationGetSceneAssetAtIndex()
{
  return MEMORY[0x270F1FD48]();
}

uint64_t RESceneImportOperationGetSceneCount()
{
  return MEMORY[0x270F1FD50]();
}

uint64_t RESceneImportOperationGetServiceLocator()
{
  return MEMORY[0x270F1FD58]();
}

uint64_t RESceneImportOperationIsSceneActiveAtIndex()
{
  return MEMORY[0x270F1FD60]();
}

uint64_t RESceneImportOperationSetGenerateDecimatedMesh()
{
  return MEMORY[0x270F1FD80]();
}

uint64_t RESceneImportOperationSetIsolateFromEngine()
{
  return MEMORY[0x270F1FD88]();
}

uint64_t RESceneImportOperationSetMergeIntoSingleEntity()
{
  return MEMORY[0x270F1FD90]();
}

uint64_t RESceneImportOperationSetRootSceneAssetPath()
{
  return MEMORY[0x270F1FD98]();
}

uint64_t RESceneImportOperationSetSceneCreateCompletionHandler()
{
  return MEMORY[0x270F1FDA0]();
}

uint64_t RESceneImportOperationSetUnitType()
{
  return MEMORY[0x270F1FDA8]();
}

uint64_t RESceneImportOperationSetVertexCacheOptimize()
{
  return MEMORY[0x270F1FDB0]();
}

uint64_t RESceneIsFromActiveRealityRendererSceneGroup()
{
  return MEMORY[0x270F1FDB8]();
}

uint64_t RESceneLoadFromAsset()
{
  return MEMORY[0x270F1FDC0]();
}

uint64_t RESceneRemoveEDRColorManagementComponent()
{
  return MEMORY[0x270F1FDC8]();
}

uint64_t RESceneRemoveEntity()
{
  return MEMORY[0x270F1FDD0]();
}

uint64_t RESceneSetEntityAtIndex()
{
  return MEMORY[0x270F1FDE8]();
}

uint64_t RESceneSetRealityRendererSceneGroup()
{
  return MEMORY[0x270F1FDF0]();
}

uint64_t RESceneSetRequiresAnchoring()
{
  return MEMORY[0x270F1FDF8]();
}

uint64_t RESceneSetSwiftObject()
{
  return MEMORY[0x270F1FE00]();
}

uint64_t RESceneSpaceRootComponentFindComponentInHierarchy()
{
  return MEMORY[0x270F1FE08]();
}

uint64_t RESceneSpaceRootComponentGetIsImmersiveSpaceOpen()
{
  return MEMORY[0x270F1FE10]();
}

uint64_t RESceneSpaceRootComponentGetIsSelfInImmersiveSpace()
{
  return MEMORY[0x270F1FE18]();
}

uint64_t RESceneSpaceRootComponentGetSceneToImmersiveTransform()
{
  return MEMORY[0x270F1FE20]();
}

uint64_t RESceneUnderstandingComponentGetComponentType()
{
  return MEMORY[0x270F1FE28]();
}

uint64_t RESceneUnderstandingComponentGetSourceType()
{
  return MEMORY[0x270F1FE38]();
}

uint64_t RESceneUnderstandingComponentIsEntityType()
{
  return MEMORY[0x270F1FE40]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentGetComponentType()
{
  return MEMORY[0x270F1FE58]();
}

uint64_t RESceneUnderstandingRootComponentGetComponentType()
{
  return MEMORY[0x270F1FE90]();
}

uint64_t RESerializedMaterialParameterHandleCreate()
{
  return MEMORY[0x270F1FEB0]();
}

uint64_t RESerializedMaterialParameterHandleGetKey()
{
  return MEMORY[0x270F1FEB8]();
}

uint64_t RESerializedMaterialParameterHandleGetKeyUnownedCString()
{
  return MEMORY[0x270F1FEC0]();
}

uint64_t REServiceLocatorGetAnimationManager()
{
  return MEMORY[0x270F1FEC8]();
}

uint64_t REServiceLocatorGetAssetManager()
{
  return MEMORY[0x270F1FED0]();
}

uint64_t REServiceLocatorGetAudioSceneService()
{
  return MEMORY[0x270F1FED8]();
}

uint64_t REServiceLocatorGetAudioService()
{
  return MEMORY[0x270F1FEE0]();
}

uint64_t REServiceLocatorGetDirectResourceService()
{
  return MEMORY[0x270F1FEF0]();
}

uint64_t REServiceLocatorGetECSService()
{
  return MEMORY[0x270F1FEF8]();
}

uint64_t REServiceLocatorGetEngine()
{
  return MEMORY[0x270F1FF00]();
}

uint64_t REServiceLocatorGetEventBus()
{
  return MEMORY[0x270F1FF08]();
}

uint64_t REServiceLocatorGetMaterialParametersService()
{
  return MEMORY[0x270F1FF10]();
}

uint64_t REServiceLocatorGetNetworkSystem()
{
  return MEMORY[0x270F1FF18]();
}

uint64_t REServiceLocatorGetOpacityService()
{
  return MEMORY[0x270F1FF20]();
}

uint64_t REServiceLocatorGetPhysicsSimulationService()
{
  return MEMORY[0x270F1FF28]();
}

uint64_t REServiceLocatorGetRenderManager()
{
  return MEMORY[0x270F1FF38]();
}

uint64_t REServiceLocatorGetResourceSharingService()
{
  return MEMORY[0x270F1FF40]();
}

uint64_t REServiceLocatorGetSwiftObject()
{
  return MEMORY[0x270F1FF58]();
}

uint64_t REServiceLocatorGetTimebaseService()
{
  return MEMORY[0x270F1FF60]();
}

uint64_t REServiceLocatorSetSwiftObject()
{
  return MEMORY[0x270F1FF68]();
}

uint64_t REShaderLibraryAssetGetMetalLibrary()
{
  return MEMORY[0x270F1FF70]();
}

uint64_t REShadowMapComponentGetComponentType()
{
  return MEMORY[0x270F1FFA0]();
}

uint64_t REShadowsGetEnableDefaultShadows()
{
  return MEMORY[0x270F1FFB8]();
}

uint64_t RESignpostEmitREAssetEntityLoadEndedImpulse()
{
  return MEMORY[0x270F1FFC0]();
}

uint64_t RESignpostEmitREAssetEntityLoadStartedImpulse()
{
  return MEMORY[0x270F1FFC8]();
}

uint64_t RESkeletalPoseComponentCanAccessPostUpdatePoses()
{
  return MEMORY[0x270F1FFD0]();
}

uint64_t RESkeletalPoseComponentEnsureSkeletalPosesInitialized()
{
  return MEMORY[0x270F1FFD8]();
}

uint64_t RESkeletalPoseComponentGetComponentType()
{
  return MEMORY[0x270F1FFE0]();
}

uint64_t RESkeletalPoseComponentGetJointCount()
{
  return MEMORY[0x270F1FFE8]();
}

uint64_t RESkeletalPoseComponentGetJointName()
{
  return MEMORY[0x270F1FFF0]();
}

uint64_t RESkeletalPoseComponentGetJointTransforms()
{
  return MEMORY[0x270F1FFF8]();
}

uint64_t RESkeletalPoseComponentGetModelSpaceJointCount()
{
  return MEMORY[0x270F20000]();
}

uint64_t RESkeletalPoseComponentGetModelSpaceJointName()
{
  return MEMORY[0x270F20008]();
}

uint64_t RESkeletalPoseComponentGetPoseName()
{
  return MEMORY[0x270F20010]();
}

uint64_t RESkeletalPoseComponentGetPostUpdatePoseJoints()
{
  return MEMORY[0x270F20018]();
}

uint64_t RESkeletalPoseComponentGetSkeletalPoseDefinition()
{
  return MEMORY[0x270F20020]();
}

uint64_t RESkeletalPoseComponentGetSkeletonCount()
{
  return MEMORY[0x270F20028]();
}

uint64_t RESkeletalPoseComponentPostUpdatePoseCount()
{
  return MEMORY[0x270F20030]();
}

uint64_t RESkeletalPoseComponentPostUpdatePoseJointCount()
{
  return MEMORY[0x270F20038]();
}

uint64_t RESkeletalPoseComponentSetJointTransform()
{
  return MEMORY[0x270F20040]();
}

uint64_t RESkeletalPoseComponentSetJointTransforms()
{
  return MEMORY[0x270F20048]();
}

uint64_t RESkeletalPoseComponentSetModelSpaceJointTransforms()
{
  return MEMORY[0x270F20050]();
}

uint64_t RESkeletalPoseComponentSetPoseName()
{
  return MEMORY[0x270F20058]();
}

uint64_t RESkeletalPoseComponentSetPostUpdatePoseJoints()
{
  return MEMORY[0x270F20060]();
}

uint64_t RESkeletalPoseComponentSetSkeletalPoseDefinition()
{
  return MEMORY[0x270F20068]();
}

uint64_t RESkeletalPoseDefinitionAssetCreateAssetForMesh()
{
  return MEMORY[0x270F20070]();
}

uint64_t RESkeletalPoseDefinitionAssetCreateAssetWithDefinitionsEx()
{
  return MEMORY[0x270F20078]();
}

uint64_t RESkeletalPoseDefinitionAssetGetJointCount()
{
  return MEMORY[0x270F20080]();
}

uint64_t RESkeletalPoseDefinitionAssetGetJointDefaultTransform()
{
  return MEMORY[0x270F20088]();
}

uint64_t RESkeletalPoseDefinitionAssetGetJointName()
{
  return MEMORY[0x270F20090]();
}

uint64_t RESkeletalPoseDefinitionAssetGetModelSpaceJointCount()
{
  return MEMORY[0x270F20098]();
}

uint64_t RESkeletalPoseDefinitionAssetGetModelSpaceJointDefaultTransform()
{
  return MEMORY[0x270F200A0]();
}

uint64_t RESkeletalPoseDefinitionAssetGetModelSpaceJointName()
{
  return MEMORY[0x270F200A8]();
}

uint64_t RESkeletalPoseDefinitionAssetGetModelSpacePoseCount()
{
  return MEMORY[0x270F200B0]();
}

uint64_t RESkeletalPoseDefinitionAssetGetPoseCount()
{
  return MEMORY[0x270F200B8]();
}

uint64_t RESkeletalPoseDefinitionAssetGetPoseMeshMapCountEx()
{
  return MEMORY[0x270F200C0]();
}

uint64_t RESkeletalPoseDefinitionAssetGetPoseMeshMapEx()
{
  return MEMORY[0x270F200C8]();
}

uint64_t RESkeletonAssetGetJointCount()
{
  return MEMORY[0x270F200D0]();
}

uint64_t RESkeletonAssetGetJointLocalRestTransform()
{
  return MEMORY[0x270F200D8]();
}

uint64_t RESkeletonAssetGetJointName()
{
  return MEMORY[0x270F200E0]();
}

uint64_t RESkeletonAssetGetJointParentIndex()
{
  return MEMORY[0x270F200E8]();
}

uint64_t RESkeletonAssetGetName()
{
  return MEMORY[0x270F200F0]();
}

uint64_t RESkeletonDefinitionCreate()
{
  return MEMORY[0x270F200F8]();
}

uint64_t RESkeletonDefinitionCreateGeomSkeletonV2()
{
  return MEMORY[0x270F20108]();
}

uint64_t RESkeletonDefinitionCreateSkeletonAsset()
{
  return MEMORY[0x270F20110]();
}

uint64_t RESkeletonDefinitionGetLocalRestPoses()
{
  return MEMORY[0x270F20118]();
}

uint64_t RESkeletonDefinitionGetParentIndices()
{
  return MEMORY[0x270F20120]();
}

uint64_t RESkeletonDefinitionSetInverseBindPoses()
{
  return MEMORY[0x270F20128]();
}

uint64_t RESkeletonDefinitionSetJointCount()
{
  return MEMORY[0x270F20130]();
}

uint64_t RESkeletonDefinitionSetJointName()
{
  return MEMORY[0x270F20138]();
}

uint64_t RESkeletonDefinitionSetLocalRestPoses()
{
  return MEMORY[0x270F20148]();
}

uint64_t RESkeletonDefinitionSetName()
{
  return MEMORY[0x270F20150]();
}

uint64_t RESkeletonDefinitionSetParentIndices()
{
  return MEMORY[0x270F20158]();
}

uint64_t RESkeletonDefinitionValidate()
{
  return MEMORY[0x270F20160]();
}

uint64_t RESkyboxComponentGetComponentType()
{
  return MEMORY[0x270F20168]();
}

uint64_t RESkyboxComponentGetMaterial()
{
  return MEMORY[0x270F20170]();
}

uint64_t RESkyboxComponentSetMaterial()
{
  return MEMORY[0x270F20178]();
}

uint64_t RESpatialAudioComponentGetComponentType()
{
  return MEMORY[0x270F20180]();
}

uint64_t RESpatialAudioComponentGetDecibelGain()
{
  return MEMORY[0x270F20188]();
}

uint64_t RESpatialAudioComponentGetDirectSendLevel()
{
  return MEMORY[0x270F20190]();
}

uint64_t RESpatialAudioComponentGetDirectivityFocus()
{
  return MEMORY[0x270F20198]();
}

uint64_t RESpatialAudioComponentGetDirectivitySphericalCapDiameter()
{
  return MEMORY[0x270F201A0]();
}

uint64_t RESpatialAudioComponentGetDirectivitySphericalCapOpeningAngle()
{
  return MEMORY[0x270F201A8]();
}

uint64_t RESpatialAudioComponentGetReverbSendLevel()
{
  return MEMORY[0x270F201B0]();
}

uint64_t RESpatialAudioComponentGetRolloffFactor()
{
  return MEMORY[0x270F201B8]();
}

uint64_t RESpatialAudioComponentGetSourceDirectivityMode()
{
  return MEMORY[0x270F201C0]();
}

uint64_t RESpatialAudioComponentSetDecibelGain()
{
  return MEMORY[0x270F201C8]();
}

uint64_t RESpatialAudioComponentSetDirectSendLevel()
{
  return MEMORY[0x270F201D0]();
}

uint64_t RESpatialAudioComponentSetDirectivityFocus()
{
  return MEMORY[0x270F201D8]();
}

uint64_t RESpatialAudioComponentSetDirectivitySphericalCap()
{
  return MEMORY[0x270F201E0]();
}

uint64_t RESpatialAudioComponentSetReverbSendLevel()
{
  return MEMORY[0x270F201E8]();
}

uint64_t RESpatialAudioComponentSetRolloffFactor()
{
  return MEMORY[0x270F201F0]();
}

uint64_t RESpatialAudioComponentSetSourceDirectivityMode()
{
  return MEMORY[0x270F201F8]();
}

uint64_t RESphereShapeCreate()
{
  return MEMORY[0x270F20200]();
}

uint64_t RESphereShapeGetRadius()
{
  return MEMORY[0x270F20208]();
}

uint64_t RESpotLightComponentGetAttenuationFalloffExponent()
{
  return MEMORY[0x270F20210]();
}

uint64_t RESpotLightComponentGetAttenuationRadius()
{
  return MEMORY[0x270F20218]();
}

uint64_t RESpotLightComponentGetColorGamut3F()
{
  return MEMORY[0x270F20220]();
}

uint64_t RESpotLightComponentGetComponentType()
{
  return MEMORY[0x270F20228]();
}

uint64_t RESpotLightComponentGetInnerAngle()
{
  return MEMORY[0x270F20230]();
}

uint64_t RESpotLightComponentGetIntensity()
{
  return MEMORY[0x270F20238]();
}

uint64_t RESpotLightComponentGetOuterAngle()
{
  return MEMORY[0x270F20240]();
}

uint64_t RESpotLightComponentSetAttenuationFalloffExponent()
{
  return MEMORY[0x270F20248]();
}

uint64_t RESpotLightComponentSetAttenuationRadius()
{
  return MEMORY[0x270F20250]();
}

uint64_t RESpotLightComponentSetColorGamut3F()
{
  return MEMORY[0x270F20258]();
}

uint64_t RESpotLightComponentSetInnerAngle()
{
  return MEMORY[0x270F20260]();
}

uint64_t RESpotLightComponentSetIntensity()
{
  return MEMORY[0x270F20268]();
}

uint64_t RESpotLightComponentSetOuterAngle()
{
  return MEMORY[0x270F20270]();
}

uint64_t RESpotLightShadowMapComponentGetComponentType()
{
  return MEMORY[0x270F20278]();
}

uint64_t RESpotLightShadowMapComponentGetCullModeEx()
{
  return MEMORY[0x270F20280]();
}

uint64_t RESpotLightShadowMapComponentGetDepthBias()
{
  return MEMORY[0x270F20288]();
}

uint64_t RESpotLightShadowMapComponentGetZFar()
{
  return MEMORY[0x270F20290]();
}

uint64_t RESpotLightShadowMapComponentGetZNear()
{
  return MEMORY[0x270F20298]();
}

uint64_t RESpotLightShadowMapComponentSetCullMode()
{
  return MEMORY[0x270F202A0]();
}

uint64_t RESpotLightShadowMapComponentSetDepthBias()
{
  return MEMORY[0x270F202A8]();
}

uint64_t RESpotLightShadowMapComponentSetZFar()
{
  return MEMORY[0x270F202B0]();
}

uint64_t RESpotLightShadowMapComponentSetZNear()
{
  return MEMORY[0x270F202B8]();
}

uint64_t REStateMachineAssetBoolConditionCreate()
{
  return MEMORY[0x270F202C0]();
}

uint64_t REStateMachineAssetCommandAddParameterBool()
{
  return MEMORY[0x270F202C8]();
}

uint64_t REStateMachineAssetCommandAddParameterDouble()
{
  return MEMORY[0x270F202D0]();
}

uint64_t REStateMachineAssetCommandAddParameterFloat()
{
  return MEMORY[0x270F202D8]();
}

uint64_t REStateMachineAssetCommandAddParameterInt()
{
  return MEMORY[0x270F202E0]();
}

uint64_t REStateMachineAssetCommandAddParameterString()
{
  return MEMORY[0x270F202E8]();
}

uint64_t REStateMachineAssetCommandCreate()
{
  return MEMORY[0x270F202F0]();
}

uint64_t REStateMachineAssetCommandGetEntityBindTarget()
{
  return MEMORY[0x270F202F8]();
}

uint64_t REStateMachineAssetCommandGetParameterBool()
{
  return MEMORY[0x270F20300]();
}

uint64_t REStateMachineAssetCommandGetParameterCount()
{
  return MEMORY[0x270F20308]();
}

uint64_t REStateMachineAssetCommandGetParameterDouble()
{
  return MEMORY[0x270F20310]();
}

uint64_t REStateMachineAssetCommandGetParameterFloat()
{
  return MEMORY[0x270F20318]();
}

uint64_t REStateMachineAssetCommandGetParameterInt()
{
  return MEMORY[0x270F20320]();
}

uint64_t REStateMachineAssetCommandGetParameterNameAtIndex()
{
  return MEMORY[0x270F20328]();
}

uint64_t REStateMachineAssetCommandGetParameterStringAsChars()
{
  return MEMORY[0x270F20330]();
}

uint64_t REStateMachineAssetCommandGetType()
{
  return MEMORY[0x270F20338]();
}

uint64_t REStateMachineAssetFloatConditionCreate()
{
  return MEMORY[0x270F20340]();
}

uint64_t REStateMachineAssetGetAnyState()
{
  return MEMORY[0x270F20348]();
}

uint64_t REStateMachineAssetGetInitialStateName()
{
  return MEMORY[0x270F20350]();
}

uint64_t REStateMachineAssetGetStateAtIndex()
{
  return MEMORY[0x270F20358]();
}

uint64_t REStateMachineAssetGetStateCount()
{
  return MEMORY[0x270F20360]();
}

uint64_t REStateMachineAssetIntConditionCreate()
{
  return MEMORY[0x270F20368]();
}

uint64_t REStateMachineAssetSingleGraphCreate()
{
  return MEMORY[0x270F20370]();
}

uint64_t REStateMachineAssetStateAddCommand()
{
  return MEMORY[0x270F20378]();
}

uint64_t REStateMachineAssetStateAddTransition()
{
  return MEMORY[0x270F20380]();
}

uint64_t REStateMachineAssetStateCreate()
{
  return MEMORY[0x270F20388]();
}

uint64_t REStateMachineAssetStateGetCommandAtIndex()
{
  return MEMORY[0x270F20390]();
}

uint64_t REStateMachineAssetStateGetCommandCount()
{
  return MEMORY[0x270F20398]();
}

uint64_t REStateMachineAssetStateGetExitTime()
{
  return MEMORY[0x270F203A0]();
}

uint64_t REStateMachineAssetStateGetName()
{
  return MEMORY[0x270F203A8]();
}

uint64_t REStateMachineAssetStateGetTransitionAtIndex()
{
  return MEMORY[0x270F203B0]();
}

uint64_t REStateMachineAssetStateGetTransitionCount()
{
  return MEMORY[0x270F203B8]();
}

uint64_t REStateMachineAssetStateGraphAddState()
{
  return MEMORY[0x270F203C0]();
}

uint64_t REStateMachineAssetStateGraphCreate()
{
  return MEMORY[0x270F203C8]();
}

uint64_t REStateMachineAssetStateSetExitTime()
{
  return MEMORY[0x270F203D0]();
}

uint64_t REStateMachineAssetTransitionAddCondition()
{
  return MEMORY[0x270F203D8]();
}

uint64_t REStateMachineAssetTransitionConditionGetConditionOperator()
{
  return MEMORY[0x270F203E0]();
}

uint64_t REStateMachineAssetTransitionConditionGetConstantBool()
{
  return MEMORY[0x270F203E8]();
}

uint64_t REStateMachineAssetTransitionConditionGetConstantFloat()
{
  return MEMORY[0x270F203F0]();
}

uint64_t REStateMachineAssetTransitionConditionGetConstantInt()
{
  return MEMORY[0x270F203F8]();
}

uint64_t REStateMachineAssetTransitionConditionGetParameterName()
{
  return MEMORY[0x270F20400]();
}

uint64_t REStateMachineAssetTransitionConditionGetParameterType()
{
  return MEMORY[0x270F20408]();
}

uint64_t REStateMachineAssetTransitionConditionGetType()
{
  return MEMORY[0x270F20410]();
}

uint64_t REStateMachineAssetTransitionCreate()
{
  return MEMORY[0x270F20418]();
}

uint64_t REStateMachineAssetTransitionGetConditionAtIndex()
{
  return MEMORY[0x270F20420]();
}

uint64_t REStateMachineAssetTransitionGetConditionCount()
{
  return MEMORY[0x270F20428]();
}

uint64_t REStateMachineAssetTransitionGetInterruptionType()
{
  return MEMORY[0x270F20430]();
}

uint64_t REStateMachineAssetTransitionGetName()
{
  return MEMORY[0x270F20438]();
}

uint64_t REStateMachineAssetTransitionGetToStateName()
{
  return MEMORY[0x270F20440]();
}

uint64_t REStateMachineAssetTransitionGetTransitionTime()
{
  return MEMORY[0x270F20448]();
}

uint64_t REStateMachineAssetTriggerConditionCreate()
{
  return MEMORY[0x270F20450]();
}

uint64_t REStateMachineComponentAddBoundParameter()
{
  return MEMORY[0x270F20458]();
}

uint64_t REStateMachineComponentAssignAsset()
{
  return MEMORY[0x270F20460]();
}

uint64_t REStateMachineComponentGetBoundParameterBindTargetAtIndex()
{
  return MEMORY[0x270F20468]();
}

uint64_t REStateMachineComponentGetBoundParameterCount()
{
  return MEMORY[0x270F20470]();
}

uint64_t REStateMachineComponentGetBoundParameterIndexAtName()
{
  return MEMORY[0x270F20478]();
}

uint64_t REStateMachineComponentGetBoundParameterNameAtIndex()
{
  return MEMORY[0x270F20480]();
}

uint64_t REStateMachineComponentGetBoundParameterTypeAtIndex()
{
  return MEMORY[0x270F20488]();
}

uint64_t REStateMachineComponentGetComponentType()
{
  return MEMORY[0x270F20490]();
}

uint64_t REStateMachineComponentGetCurrentStateName()
{
  return MEMORY[0x270F20498]();
}

uint64_t REStateMachineComponentGetStateMachineAsset()
{
  return MEMORY[0x270F204A0]();
}

uint64_t REStateMachineComponentHasBoundParameterAtName()
{
  return MEMORY[0x270F204A8]();
}

uint64_t REStateMachineComponentRemoveAllBoundParameters()
{
  return MEMORY[0x270F204B0]();
}

uint64_t REStateMachineComponentRemoveBoundParameterAtName()
{
  return MEMORY[0x270F204B8]();
}

uint64_t REStateMachineComponentSetBoundParameterBindTargetAtIndex()
{
  return MEMORY[0x270F204C0]();
}

uint64_t REStatic3DTextComponentGetComponentType()
{
  return MEMORY[0x270F204C8]();
}

uint64_t REStatic3DTextComponentGetExtrusionDepth()
{
  return MEMORY[0x270F204D0]();
}

uint64_t REStatic3DTextComponentGetFont()
{
  return MEMORY[0x270F204D8]();
}

uint64_t REStatic3DTextComponentGetFontSize()
{
  return MEMORY[0x270F204E0]();
}

uint64_t REStatic3DTextComponentGetLineBreakMode()
{
  return MEMORY[0x270F204E8]();
}

uint64_t REStatic3DTextComponentGetSegmentDensity()
{
  return MEMORY[0x270F204F0]();
}

uint64_t REStatic3DTextComponentGetText()
{
  return MEMORY[0x270F204F8]();
}

uint64_t REStatic3DTextComponentGetTextAlignment()
{
  return MEMORY[0x270F20500]();
}

uint64_t REStatic3DTextComponentGetTextFrameOrigin()
{
  return MEMORY[0x270F20508]();
}

uint64_t REStatic3DTextComponentGetTextFrameSize()
{
  return MEMORY[0x270F20510]();
}

uint64_t REStatic3DTextComponentGetVerticalTextAlignment()
{
  return MEMORY[0x270F20518]();
}

uint64_t REStructBuilderAddMemberArrayWithCountDataTypeWithTag()
{
  return MEMORY[0x270F20578]();
}

uint64_t REStructBuilderAddMemberCStyleArrayDataTypeWithTag()
{
  return MEMORY[0x270F20580]();
}

uint64_t REStructBuilderAddMemberDataTypeWithTag()
{
  return MEMORY[0x270F20588]();
}

uint64_t REStructBuilderCreate()
{
  return MEMORY[0x270F20598]();
}

uint64_t REStructBuilderDestroy()
{
  return MEMORY[0x270F205A0]();
}

uint64_t REStructBuilderInit()
{
  return MEMORY[0x270F205A8]();
}

uint64_t RETextComponentGetAttributedString()
{
  return MEMORY[0x270F205B8]();
}

uint64_t RETextComponentGetBackgroundColor()
{
  return MEMORY[0x270F205C0]();
}

uint64_t RETextComponentGetComponentType()
{
  return MEMORY[0x270F205C8]();
}

uint64_t RETextComponentGetCornerRadius()
{
  return MEMORY[0x270F205D0]();
}

uint64_t RETextComponentGetEdgeInsets()
{
  return MEMORY[0x270F205D8]();
}

uint64_t RETextComponentGetSize()
{
  return MEMORY[0x270F205E0]();
}

uint64_t RETextComponentSetAttributedString()
{
  return MEMORY[0x270F205E8]();
}

uint64_t RETextComponentSetBackgroundColor()
{
  return MEMORY[0x270F205F0]();
}

uint64_t RETextComponentSetCornerRadius()
{
  return MEMORY[0x270F205F8]();
}

uint64_t RETextComponentSetEdgeInsets()
{
  return MEMORY[0x270F20600]();
}

uint64_t RETextComponentSetRenderBlock()
{
  return MEMORY[0x270F20608]();
}

uint64_t RETextComponentSetSize()
{
  return MEMORY[0x270F20610]();
}

uint64_t RETextureAssetCopyToDestination()
{
  return MEMORY[0x270F20618]();
}

uint64_t RETextureAssetCreateCompressedTextureAssetData()
{
  return MEMORY[0x270F20620]();
}

uint64_t RETextureAssetDataCreateWithTexture()
{
  return MEMORY[0x270F20628]();
}

uint64_t RETextureAssetDataGetPixelFormat()
{
  return MEMORY[0x270F20630]();
}

uint64_t RETextureAssetDataGetTextureType()
{
  return MEMORY[0x270F20638]();
}

uint64_t RETextureAssetGetDimensions()
{
  return MEMORY[0x270F20648]();
}

uint64_t RETextureAssetGetMipmapLevelCount()
{
  return MEMORY[0x270F20650]();
}

uint64_t RETextureAssetGetPixelFormat()
{
  return MEMORY[0x270F20658]();
}

uint64_t RETextureAssetGetSemantic()
{
  return MEMORY[0x270F20660]();
}

uint64_t RETextureAssetGetSize()
{
  return MEMORY[0x270F20668]();
}

uint64_t RETextureAssetGetTextureType()
{
  return MEMORY[0x270F20670]();
}

uint64_t RETextureAssetMakeMutableAndReplaceWithData()
{
  return MEMORY[0x270F20678]();
}

uint64_t RETextureAssetRemoveDrawableQueue()
{
  return MEMORY[0x270F20680]();
}

uint64_t RETextureAssetReplaceAllWithDirectTexture()
{
  return MEMORY[0x270F20688]();
}

uint64_t RETextureAssetReplaceDrawableQueue()
{
  return MEMORY[0x270F20690]();
}

uint64_t RETextureBuilderCreateAssetAsync()
{
  return MEMORY[0x270F20698]();
}

uint64_t RETextureBuilderCreateAssetSync()
{
  return MEMORY[0x270F206A0]();
}

uint64_t RETextureBuilderCreateWithDescriptor()
{
  return MEMORY[0x270F206A8]();
}

uint64_t RETextureBuilderEncodeBlitCommands()
{
  return MEMORY[0x270F206B0]();
}

uint64_t RETextureBuilderSetColorGamut()
{
  return MEMORY[0x270F206B8]();
}

uint64_t RETextureBuilderSetSemantic()
{
  return MEMORY[0x270F206C0]();
}

uint64_t RETextureDrawableQueueCreateNextDrawable()
{
  return MEMORY[0x270F206C8]();
}

uint64_t RETextureDrawableQueueCreateNextDrawableWithTimeout()
{
  return MEMORY[0x270F206D0]();
}

uint64_t RETextureDrawableQueueCreateNextDrawableWithTimeoutAndPollingInterval()
{
  return MEMORY[0x270F206D8]();
}

uint64_t RETextureDrawableQueueCreateWithDescriptor()
{
  return MEMORY[0x270F206E0]();
}

uint64_t RETextureDrawableQueueDescriptorCreate()
{
  return MEMORY[0x270F206E8]();
}

uint64_t RETextureDrawableQueueDescriptorSetHeight()
{
  return MEMORY[0x270F206F0]();
}

uint64_t RETextureDrawableQueueDescriptorSetMipMapMode()
{
  return MEMORY[0x270F206F8]();
}

uint64_t RETextureDrawableQueueDescriptorSetPixelFormat()
{
  return MEMORY[0x270F20700]();
}

uint64_t RETextureDrawableQueueDescriptorSetPresentsWithNextUpdate()
{
  return MEMORY[0x270F20708]();
}

uint64_t RETextureDrawableQueueDescriptorSetResourceOptions()
{
  return MEMORY[0x270F20710]();
}

uint64_t RETextureDrawableQueueDescriptorSetShareable()
{
  return MEMORY[0x270F20718]();
}

uint64_t RETextureDrawableQueueDescriptorSetTextureUsage()
{
  return MEMORY[0x270F20720]();
}

uint64_t RETextureDrawableQueueDescriptorSetWidth()
{
  return MEMORY[0x270F20728]();
}

uint64_t RETextureImportOperationCreateAsset()
{
  return MEMORY[0x270F20750]();
}

uint64_t RETextureImportOperationCreateAssetData()
{
  return MEMORY[0x270F20758]();
}

uint64_t RETextureImportOperationCreateFromImageArray()
{
  return MEMORY[0x270F20760]();
}

uint64_t RETextureImportOperationCreateWithBundleResource()
{
  return MEMORY[0x270F20768]();
}

uint64_t RETextureImportOperationCreateWithCGImage()
{
  return MEMORY[0x270F20770]();
}

uint64_t RETextureImportOperationCreateWithURL()
{
  return MEMORY[0x270F20780]();
}

uint64_t RETextureImportOperationRun()
{
  return MEMORY[0x270F20790]();
}

uint64_t RETextureImportOperationSetASTCCompressionOptions()
{
  return MEMORY[0x270F20798]();
}

uint64_t RETextureImportOperationSetAssetResourceName()
{
  return MEMORY[0x270F207A0]();
}

uint64_t RETextureImportOperationSetColorSpaceName()
{
  return MEMORY[0x270F207A8]();
}

uint64_t RETextureImportOperationSetCompressionType()
{
  return MEMORY[0x270F207B0]();
}

uint64_t RETextureImportOperationSetMipmapMode()
{
  return MEMORY[0x270F207D0]();
}

uint64_t RETextureImportOperationSetSemantic()
{
  return MEMORY[0x270F207E0]();
}

uint64_t RETimebaseComponentAddTimebase()
{
  return MEMORY[0x270F207F0]();
}

uint64_t RETimebaseComponentGetComponentType()
{
  return MEMORY[0x270F207F8]();
}

uint64_t RETimebaseServiceCreateEngineSourceTimebase()
{
  return MEMORY[0x270F20800]();
}

uint64_t RETimelineDefinitionAddChildTimeline()
{
  return MEMORY[0x270F20808]();
}

uint64_t RETimelineDefinitionBlendTreeAddAdditiveBlend()
{
  return MEMORY[0x270F20810]();
}

uint64_t RETimelineDefinitionBlendTreeAddBlend()
{
  return MEMORY[0x270F20818]();
}

uint64_t RETimelineDefinitionBlendTreeAddConnection()
{
  return MEMORY[0x270F20820]();
}

uint64_t RETimelineDefinitionBlendTreeAddTimelineSource()
{
  return MEMORY[0x270F20828]();
}

uint64_t RETimelineDefinitionBlendTreeConnectionCount()
{
  return MEMORY[0x270F20830]();
}

uint64_t RETimelineDefinitionBlendTreeConnectionGetSource()
{
  return MEMORY[0x270F20838]();
}

uint64_t RETimelineDefinitionBlendTreeConnectionGetTarget()
{
  return MEMORY[0x270F20840]();
}

uint64_t RETimelineDefinitionBlendTreeNodeCount()
{
  return MEMORY[0x270F20848]();
}

uint64_t RETimelineDefinitionBlendTreeNodeGetName()
{
  return MEMORY[0x270F20850]();
}

uint64_t RETimelineDefinitionBlendTreeNodeGetWeight()
{
  return MEMORY[0x270F20858]();
}

uint64_t RETimelineDefinitionBlendTreeNodeGetWeightPath()
{
  return MEMORY[0x270F20860]();
}

uint64_t RETimelineDefinitionBlendTreeNodeIsBlend()
{
  return MEMORY[0x270F20868]();
}

uint64_t RETimelineDefinitionBlendTreeNodeIsBlendAdditive()
{
  return MEMORY[0x270F20870]();
}

uint64_t RETimelineDefinitionBlendTreeNodeIsClipSource()
{
  return MEMORY[0x270F20878]();
}

uint64_t RETimelineDefinitionCreateBlendTreeNodeSourceRef()
{
  return MEMORY[0x270F20888]();
}

uint64_t RETimelineDefinitionCreateChildTimelineRef()
{
  return MEMORY[0x270F20890]();
}

uint64_t RETimelineDefinitionCreateClipSourceRef()
{
  return MEMORY[0x270F20898]();
}

uint64_t RETimelineDefinitionCreateFloatBlendTree()
{
  return MEMORY[0x270F208A0]();
}

uint64_t RETimelineDefinitionCreateFromTimeline()
{
  return MEMORY[0x270F208A8]();
}

uint64_t RETimelineDefinitionCreateFromToByBlendShapeWeightsAnimation()
{
  return MEMORY[0x270F208B0]();
}

uint64_t RETimelineDefinitionCreateFromToByDoubleAnimation()
{
  return MEMORY[0x270F208B8]();
}

uint64_t RETimelineDefinitionCreateFromToByFloat2Animation()
{
  return MEMORY[0x270F208C0]();
}

uint64_t RETimelineDefinitionCreateFromToByFloat3Animation()
{
  return MEMORY[0x270F208C8]();
}

uint64_t RETimelineDefinitionCreateFromToByFloat4Animation()
{
  return MEMORY[0x270F208D0]();
}

uint64_t RETimelineDefinitionCreateFromToByFloatAnimation()
{
  return MEMORY[0x270F208D8]();
}

uint64_t RETimelineDefinitionCreateFromToByQuaternionAnimation()
{
  return MEMORY[0x270F208E0]();
}

uint64_t RETimelineDefinitionCreateFromToBySRTAnimation()
{
  return MEMORY[0x270F208E8]();
}

uint64_t RETimelineDefinitionCreateFromToBySkeletalPoseAnimation()
{
  return MEMORY[0x270F208F0]();
}

uint64_t RETimelineDefinitionCreateOrbitAnimation()
{
  return MEMORY[0x270F208F8]();
}

uint64_t RETimelineDefinitionCreateSampledBlendShapeWeightsAnimation()
{
  return MEMORY[0x270F20900]();
}

uint64_t RETimelineDefinitionCreateSampledSRTAnimation()
{
  return MEMORY[0x270F20910]();
}

uint64_t RETimelineDefinitionCreateSampledSkeletalPoseAnimation()
{
  return MEMORY[0x270F20918]();
}

uint64_t RETimelineDefinitionCreateTimelineAsset()
{
  return MEMORY[0x270F20920]();
}

uint64_t RETimelineDefinitionCreateTimelineClip()
{
  return MEMORY[0x270F20928]();
}

uint64_t RETimelineDefinitionCreateTimelineGroup()
{
  return MEMORY[0x270F20930]();
}

uint64_t RETimelineDefinitionCreateTypedEventTimeline()
{
  return MEMORY[0x270F20938]();
}

uint64_t RETimelineDefinitionEventTimelineAddEvent()
{
  return MEMORY[0x270F20940]();
}

uint64_t RETimelineDefinitionEventTimelineAddParameter()
{
  return MEMORY[0x270F20948]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventCount()
{
  return MEMORY[0x270F20950]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventDuration()
{
  return MEMORY[0x270F20958]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventParameterData()
{
  return MEMORY[0x270F20960]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventParameterDataSize()
{
  return MEMORY[0x270F20968]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventStartTime()
{
  return MEMORY[0x270F20970]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventSwiftParameter()
{
  return MEMORY[0x270F20978]();
}

uint64_t RETimelineDefinitionEventTimelineGetEventTypeName()
{
  return MEMORY[0x270F20980]();
}

uint64_t RETimelineDefinitionEventTimelineGetParameterCount()
{
  return MEMORY[0x270F20988]();
}

uint64_t RETimelineDefinitionEventTimelineGetParameterName()
{
  return MEMORY[0x270F20990]();
}

uint64_t RETimelineDefinitionEventTimelineSetAndRetainSwiftConstantData()
{
  return MEMORY[0x270F20998]();
}

uint64_t RETimelineDefinitionEventTimelineSetAndRetainSwiftParameter()
{
  return MEMORY[0x270F209A0]();
}

uint64_t RETimelineDefinitionEventTimelineSetConstantData()
{
  return MEMORY[0x270F209A8]();
}

uint64_t RETimelineDefinitionEventTimelineSetParameterData()
{
  return MEMORY[0x270F209B0]();
}

uint64_t RETimelineDefinitionEventTimelineSetReversible()
{
  return MEMORY[0x270F209B8]();
}

uint64_t RETimelineDefinitionGetAnimationLayer()
{
  return MEMORY[0x270F209C0]();
}

uint64_t RETimelineDefinitionGetAxis()
{
  return MEMORY[0x270F209C8]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsByValue()
{
  return MEMORY[0x270F209D0]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsByWeightCount()
{
  return MEMORY[0x270F209D8]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsFromValue()
{
  return MEMORY[0x270F209E0]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsFromWeightCount()
{
  return MEMORY[0x270F209E8]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsFromWeightName()
{
  return MEMORY[0x270F209F0]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsIndexWeightValue()
{
  return MEMORY[0x270F209F8]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsToValue()
{
  return MEMORY[0x270F20A00]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsToWeightCount()
{
  return MEMORY[0x270F20A08]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsWeightName()
{
  return MEMORY[0x270F20A10]();
}

uint64_t RETimelineDefinitionGetBlendShapeWeightsWeightsCount()
{
  return MEMORY[0x270F20A18]();
}

uint64_t RETimelineDefinitionGetChildrenTimelineCount()
{
  return MEMORY[0x270F20A20]();
}

uint64_t RETimelineDefinitionGetClipDelay()
{
  return MEMORY[0x270F20A28]();
}

uint64_t RETimelineDefinitionGetClipDuration()
{
  return MEMORY[0x270F20A30]();
}

uint64_t RETimelineDefinitionGetClipEnd()
{
  return MEMORY[0x270F20A38]();
}

uint64_t RETimelineDefinitionGetClipLoopBehavior()
{
  return MEMORY[0x270F20A40]();
}

uint64_t RETimelineDefinitionGetClipOffset()
{
  return MEMORY[0x270F20A48]();
}

uint64_t RETimelineDefinitionGetClipSpeed()
{
  return MEMORY[0x270F20A50]();
}

uint64_t RETimelineDefinitionGetClipStart()
{
  return MEMORY[0x270F20A58]();
}

uint64_t RETimelineDefinitionGetDoubleByValue()
{
  return MEMORY[0x270F20A60]();
}

uint64_t RETimelineDefinitionGetDoubleFromValue()
{
  return MEMORY[0x270F20A68]();
}

uint64_t RETimelineDefinitionGetDoubleToValue()
{
  return MEMORY[0x270F20A70]();
}

uint64_t RETimelineDefinitionGetDoubleValues()
{
  return MEMORY[0x270F20A78]();
}

uint64_t RETimelineDefinitionGetDuration()
{
  return MEMORY[0x270F20A80]();
}

uint64_t RETimelineDefinitionGetEndTime()
{
  return MEMORY[0x270F20A88]();
}

uint64_t RETimelineDefinitionGetFillMode()
{
  return MEMORY[0x270F20A90]();
}

uint64_t RETimelineDefinitionGetFloat2ByValue()
{
  return MEMORY[0x270F20A98]();
}

uint64_t RETimelineDefinitionGetFloat2FromValue()
{
  return MEMORY[0x270F20AA0]();
}

uint64_t RETimelineDefinitionGetFloat2ToValue()
{
  return MEMORY[0x270F20AA8]();
}

uint64_t RETimelineDefinitionGetFloat2Values()
{
  return MEMORY[0x270F20AB0]();
}

uint64_t RETimelineDefinitionGetFloat3ByValue()
{
  return MEMORY[0x270F20AB8]();
}

uint64_t RETimelineDefinitionGetFloat3FromValue()
{
  return MEMORY[0x270F20AC0]();
}

uint64_t RETimelineDefinitionGetFloat3ToValue()
{
  return MEMORY[0x270F20AC8]();
}

uint64_t RETimelineDefinitionGetFloat3Values()
{
  return MEMORY[0x270F20AD0]();
}

uint64_t RETimelineDefinitionGetFloat4ByValue()
{
  return MEMORY[0x270F20AD8]();
}

uint64_t RETimelineDefinitionGetFloat4FromValue()
{
  return MEMORY[0x270F20AE0]();
}

uint64_t RETimelineDefinitionGetFloat4ToValue()
{
  return MEMORY[0x270F20AE8]();
}

uint64_t RETimelineDefinitionGetFloat4Values()
{
  return MEMORY[0x270F20AF0]();
}

uint64_t RETimelineDefinitionGetFloatByValue()
{
  return MEMORY[0x270F20AF8]();
}

uint64_t RETimelineDefinitionGetFloatFromValue()
{
  return MEMORY[0x270F20B00]();
}

uint64_t RETimelineDefinitionGetFloatToValue()
{
  return MEMORY[0x270F20B08]();
}

uint64_t RETimelineDefinitionGetFloatValues()
{
  return MEMORY[0x270F20B10]();
}

uint64_t RETimelineDefinitionGetFrameInterval()
{
  return MEMORY[0x270F20B18]();
}

uint64_t RETimelineDefinitionGetInterpolationEnabled()
{
  return MEMORY[0x270F20B20]();
}

uint64_t RETimelineDefinitionGetName()
{
  return MEMORY[0x270F20B28]();
}

uint64_t RETimelineDefinitionGetOrientToPath()
{
  return MEMORY[0x270F20B30]();
}

uint64_t RETimelineDefinitionGetQuaternionByValue()
{
  return MEMORY[0x270F20B38]();
}

uint64_t RETimelineDefinitionGetQuaternionFromValue()
{
  return MEMORY[0x270F20B40]();
}

uint64_t RETimelineDefinitionGetQuaternionToValue()
{
  return MEMORY[0x270F20B48]();
}

uint64_t RETimelineDefinitionGetQuaternionValues()
{
  return MEMORY[0x270F20B50]();
}

uint64_t RETimelineDefinitionGetRotationCount()
{
  return MEMORY[0x270F20B58]();
}

uint64_t RETimelineDefinitionGetSRTByValue()
{
  return MEMORY[0x270F20B60]();
}

uint64_t RETimelineDefinitionGetSRTFromValue()
{
  return MEMORY[0x270F20B68]();
}

uint64_t RETimelineDefinitionGetSRTToValue()
{
  return MEMORY[0x270F20B70]();
}

uint64_t RETimelineDefinitionGetSRTValues()
{
  return MEMORY[0x270F20B78]();
}

uint64_t RETimelineDefinitionGetSkeletalJointCount()
{
  return MEMORY[0x270F20B80]();
}

uint64_t RETimelineDefinitionGetSkeletalJointName()
{
  return MEMORY[0x270F20B88]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseByJointCount()
{
  return MEMORY[0x270F20B90]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseByValue()
{
  return MEMORY[0x270F20B98]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseFromJointCount()
{
  return MEMORY[0x270F20BA0]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseFromJointName()
{
  return MEMORY[0x270F20BA8]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseFromValue()
{
  return MEMORY[0x270F20BB0]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseIndexJointValue()
{
  return MEMORY[0x270F20BB8]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseRotationChannelMask()
{
  return MEMORY[0x270F20BC0]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseScaleChannelMask()
{
  return MEMORY[0x270F20BC8]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseToJointCount()
{
  return MEMORY[0x270F20BD0]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseToValue()
{
  return MEMORY[0x270F20BD8]();
}

uint64_t RETimelineDefinitionGetSkeletalPoseTranslationChannelMask()
{
  return MEMORY[0x270F20BE0]();
}

uint64_t RETimelineDefinitionGetSpinClockwise()
{
  return MEMORY[0x270F20BE8]();
}

uint64_t RETimelineDefinitionGetStartTime()
{
  return MEMORY[0x270F20BF0]();
}

uint64_t RETimelineDefinitionGetStartTransform()
{
  return MEMORY[0x270F20BF8]();
}

uint64_t RETimelineDefinitionGetTargetPath()
{
  return MEMORY[0x270F20C00]();
}

uint64_t RETimelineDefinitionGetTimelineType()
{
  return MEMORY[0x270F20C08]();
}

uint64_t RETimelineDefinitionGetValueCount()
{
  return MEMORY[0x270F20C10]();
}

uint64_t RETimelineDefinitionIsAdditive()
{
  return MEMORY[0x270F20C18]();
}

uint64_t RETimelineDefinitionSetAdditive()
{
  return MEMORY[0x270F20C20]();
}

uint64_t RETimelineDefinitionSetAnimationLayer()
{
  return MEMORY[0x270F20C28]();
}

uint64_t RETimelineDefinitionSetAxis()
{
  return MEMORY[0x270F20C30]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsByValues()
{
  return MEMORY[0x270F20C38]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsByWeightName()
{
  return MEMORY[0x270F20C40]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsFromValues()
{
  return MEMORY[0x270F20C50]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsFromWeightName()
{
  return MEMORY[0x270F20C58]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsIndexValues()
{
  return MEMORY[0x270F20C60]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsSampleCount()
{
  return MEMORY[0x270F20C68]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsToValues()
{
  return MEMORY[0x270F20C70]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsToWeightName()
{
  return MEMORY[0x270F20C78]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsWeightName()
{
  return MEMORY[0x270F20C80]();
}

uint64_t RETimelineDefinitionSetBlendShapeWeightsWeightsCount()
{
  return MEMORY[0x270F20C88]();
}

uint64_t RETimelineDefinitionSetClipDelay()
{
  return MEMORY[0x270F20C90]();
}

uint64_t RETimelineDefinitionSetClipDuration()
{
  return MEMORY[0x270F20C98]();
}

uint64_t RETimelineDefinitionSetClipEnd()
{
  return MEMORY[0x270F20CA0]();
}

uint64_t RETimelineDefinitionSetClipLoopBehavior()
{
  return MEMORY[0x270F20CA8]();
}

uint64_t RETimelineDefinitionSetClipOffset()
{
  return MEMORY[0x270F20CB0]();
}

uint64_t RETimelineDefinitionSetClipSpeed()
{
  return MEMORY[0x270F20CB8]();
}

uint64_t RETimelineDefinitionSetClipStart()
{
  return MEMORY[0x270F20CC0]();
}

uint64_t RETimelineDefinitionSetDoubleByValue()
{
  return MEMORY[0x270F20CC8]();
}

uint64_t RETimelineDefinitionSetDoubleFromValue()
{
  return MEMORY[0x270F20CD0]();
}

uint64_t RETimelineDefinitionSetDoubleToValue()
{
  return MEMORY[0x270F20CD8]();
}

uint64_t RETimelineDefinitionSetDuration()
{
  return MEMORY[0x270F20CE0]();
}

uint64_t RETimelineDefinitionSetEasingFunctionEx()
{
  return MEMORY[0x270F20CE8]();
}

uint64_t RETimelineDefinitionSetEndTime()
{
  return MEMORY[0x270F20CF0]();
}

uint64_t RETimelineDefinitionSetFillMode()
{
  return MEMORY[0x270F20CF8]();
}

uint64_t RETimelineDefinitionSetFloat2ByValue()
{
  return MEMORY[0x270F20D00]();
}

uint64_t RETimelineDefinitionSetFloat2FromValue()
{
  return MEMORY[0x270F20D08]();
}

uint64_t RETimelineDefinitionSetFloat2ToValue()
{
  return MEMORY[0x270F20D10]();
}

uint64_t RETimelineDefinitionSetFloat3ByValue()
{
  return MEMORY[0x270F20D18]();
}

uint64_t RETimelineDefinitionSetFloat3FromValue()
{
  return MEMORY[0x270F20D20]();
}

uint64_t RETimelineDefinitionSetFloat3ToValue()
{
  return MEMORY[0x270F20D28]();
}

uint64_t RETimelineDefinitionSetFloat4ByValue()
{
  return MEMORY[0x270F20D30]();
}

uint64_t RETimelineDefinitionSetFloat4FromValue()
{
  return MEMORY[0x270F20D38]();
}

uint64_t RETimelineDefinitionSetFloat4ToValue()
{
  return MEMORY[0x270F20D40]();
}

uint64_t RETimelineDefinitionSetFloatByValue()
{
  return MEMORY[0x270F20D48]();
}

uint64_t RETimelineDefinitionSetFloatFromValue()
{
  return MEMORY[0x270F20D50]();
}

uint64_t RETimelineDefinitionSetFloatToValue()
{
  return MEMORY[0x270F20D58]();
}

uint64_t RETimelineDefinitionSetFrameInterval()
{
  return MEMORY[0x270F20D68]();
}

uint64_t RETimelineDefinitionSetInterpolationEnabled()
{
  return MEMORY[0x270F20D70]();
}

uint64_t RETimelineDefinitionSetName()
{
  return MEMORY[0x270F20D78]();
}

uint64_t RETimelineDefinitionSetOrientToPath()
{
  return MEMORY[0x270F20D80]();
}

uint64_t RETimelineDefinitionSetQuaternionByValue()
{
  return MEMORY[0x270F20D88]();
}

uint64_t RETimelineDefinitionSetQuaternionFromValue()
{
  return MEMORY[0x270F20D90]();
}

uint64_t RETimelineDefinitionSetQuaternionToValue()
{
  return MEMORY[0x270F20D98]();
}

uint64_t RETimelineDefinitionSetRotationCount()
{
  return MEMORY[0x270F20DA0]();
}

uint64_t RETimelineDefinitionSetSRTByValue()
{
  return MEMORY[0x270F20DA8]();
}

uint64_t RETimelineDefinitionSetSRTFromValue()
{
  return MEMORY[0x270F20DB0]();
}

uint64_t RETimelineDefinitionSetSRTToValue()
{
  return MEMORY[0x270F20DB8]();
}

uint64_t RETimelineDefinitionSetSRTValues()
{
  return MEMORY[0x270F20DC0]();
}

uint64_t RETimelineDefinitionSetSkeletalJointCount()
{
  return MEMORY[0x270F20DC8]();
}

uint64_t RETimelineDefinitionSetSkeletalJointName()
{
  return MEMORY[0x270F20DD0]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseByJointName()
{
  return MEMORY[0x270F20DD8]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseByValue()
{
  return MEMORY[0x270F20DE0]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseFromJointName()
{
  return MEMORY[0x270F20DE8]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseFromValue()
{
  return MEMORY[0x270F20DF0]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseIndexValues()
{
  return MEMORY[0x270F20DF8]();
}

uint64_t RETimelineDefinitionSetSkeletalPosePoseCount()
{
  return MEMORY[0x270F20E00]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseRotationChannelMask()
{
  return MEMORY[0x270F20E08]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseScaleChannelMask()
{
  return MEMORY[0x270F20E10]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseToJointName()
{
  return MEMORY[0x270F20E18]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseToValue()
{
  return MEMORY[0x270F20E20]();
}

uint64_t RETimelineDefinitionSetSkeletalPoseTranslationChannelMask()
{
  return MEMORY[0x270F20E28]();
}

uint64_t RETimelineDefinitionSetSpinClockwise()
{
  return MEMORY[0x270F20E40]();
}

uint64_t RETimelineDefinitionSetStartTime()
{
  return MEMORY[0x270F20E48]();
}

uint64_t RETimelineDefinitionSetStartTransform()
{
  return MEMORY[0x270F20E50]();
}

uint64_t RETimelineDefinitionSetTargetPath()
{
  return MEMORY[0x270F20E58]();
}

uint64_t RETimelineEventFilter()
{
  return MEMORY[0x270F20E60]();
}

uint64_t RETimelineEventGetAnimatedType()
{
  return MEMORY[0x270F20E68]();
}

uint64_t RETimelineEventGetDefaultSourceDoubleValue()
{
  return MEMORY[0x270F20E70]();
}

uint64_t RETimelineEventGetDefaultSourceFloatValue()
{
  return MEMORY[0x270F20E78]();
}

uint64_t RETimelineEventGetDefaultSourceQuaternionFValue()
{
  return MEMORY[0x270F20E80]();
}

uint64_t RETimelineEventGetDefaultSourceSRTValue()
{
  return MEMORY[0x270F20E88]();
}

uint64_t RETimelineEventGetDefaultSourceVector2FValue()
{
  return MEMORY[0x270F20E90]();
}

uint64_t RETimelineEventGetDefaultSourceVector3FValue()
{
  return MEMORY[0x270F20E98]();
}

uint64_t RETimelineEventGetDefaultSourceVector4FValue()
{
  return MEMORY[0x270F20EA0]();
}

uint64_t RETimelineEventGetDefaultTargetDoubleValue()
{
  return MEMORY[0x270F20EA8]();
}

uint64_t RETimelineEventGetDefaultTargetFloatValue()
{
  return MEMORY[0x270F20EB0]();
}

uint64_t RETimelineEventGetDefaultTargetQuaternionFValue()
{
  return MEMORY[0x270F20EB8]();
}

uint64_t RETimelineEventGetDefaultTargetSRTValue()
{
  return MEMORY[0x270F20EC0]();
}

uint64_t RETimelineEventGetDefaultTargetVector2FValue()
{
  return MEMORY[0x270F20EC8]();
}

uint64_t RETimelineEventGetDefaultTargetVector3FValue()
{
  return MEMORY[0x270F20ED0]();
}

uint64_t RETimelineEventGetDefaultTargetVector4FValue()
{
  return MEMORY[0x270F20ED8]();
}

uint64_t RETimelineEventGetParameterData()
{
  return MEMORY[0x270F20EE0]();
}

uint64_t RETimelineEventGetParameterDataSize()
{
  return MEMORY[0x270F20EE8]();
}

uint64_t RETimelineEventGetSkeletalPoseJointCount()
{
  return MEMORY[0x270F20EF0]();
}

uint64_t RETimelineEventGetSwiftConstantData()
{
  return MEMORY[0x270F20EF8]();
}

uint64_t RETimelineEventGetSwiftParameter()
{
  return MEMORY[0x270F20F00]();
}

uint64_t RETimelineEventSetAnimatedDoubleValue()
{
  return MEMORY[0x270F20F08]();
}

uint64_t RETimelineEventSetAnimatedFloatValue()
{
  return MEMORY[0x270F20F10]();
}

uint64_t RETimelineEventSetAnimatedQuaternionFValue()
{
  return MEMORY[0x270F20F18]();
}

uint64_t RETimelineEventSetAnimatedSRTValue()
{
  return MEMORY[0x270F20F20]();
}

uint64_t RETimelineEventSetAnimatedSkeletalPoseJointValue()
{
  return MEMORY[0x270F20F28]();
}

uint64_t RETimelineEventSetAnimatedSkeletalPoseJoints()
{
  return MEMORY[0x270F20F30]();
}

uint64_t RETimelineEventSetAnimatedVector2FValue()
{
  return MEMORY[0x270F20F38]();
}

uint64_t RETimelineEventSetAnimatedVector3FValue()
{
  return MEMORY[0x270F20F40]();
}

uint64_t RETimelineEventSetAnimatedVector4FValue()
{
  return MEMORY[0x270F20F48]();
}

uint64_t RETransformComponentGetComponentType()
{
  return MEMORY[0x270F20F50]();
}

uint64_t RETransformComponentGetLocalPose()
{
  return MEMORY[0x270F20F58]();
}

uint64_t RETransformComponentGetLocalSRT()
{
  return MEMORY[0x270F20F60]();
}

uint64_t RETransformComponentGetLocalScale()
{
  return MEMORY[0x270F20F68]();
}

uint64_t RETransformComponentGetLocalUnanimatedSRT()
{
  return MEMORY[0x270F20F70]();
}

uint64_t RETransformComponentGetParentWorldMatrix4x4F()
{
  return MEMORY[0x270F20F78]();
}

uint64_t RETransformComponentGetWorldMatrix4x4F()
{
  return MEMORY[0x270F20F80]();
}

uint64_t RETransformComponentGetWorldOrientation()
{
  return MEMORY[0x270F20F88]();
}

uint64_t RETransformComponentGetWorldPose()
{
  return MEMORY[0x270F20F90]();
}

uint64_t RETransformComponentGetWorldSRT()
{
  return MEMORY[0x270F20FA0]();
}

uint64_t RETransformComponentGetWorldUnanimatedMatrix4x4F()
{
  return MEMORY[0x270F20FA8]();
}

uint64_t RETransformComponentIsAnimated()
{
  return MEMORY[0x270F20FB0]();
}

uint64_t RETransformComponentSetLocalSRT()
{
  return MEMORY[0x270F20FC0]();
}

uint64_t RETransformComponentSetWorldAnimatedMatrix4x4F()
{
  return MEMORY[0x270F20FD0]();
}

uint64_t RETransformComponentSetWorldAnimatedSRT()
{
  return MEMORY[0x270F20FD8]();
}

uint64_t RETransformComponentSetWorldMatrix4x4F()
{
  return MEMORY[0x270F20FE0]();
}

uint64_t RETransformComponentSetWorldOrientation()
{
  return MEMORY[0x270F20FE8]();
}

uint64_t REUISortingComponentGetComponentType()
{
  return MEMORY[0x270F210F0]();
}

uint64_t REUISortingComponentGetSortCategory()
{
  return MEMORY[0x270F210F8]();
}

uint64_t REUISortingComponentGetSortPriorityHint()
{
  return MEMORY[0x270F21100]();
}

uint64_t REUISortingComponentSetSortCategory()
{
  return MEMORY[0x270F21108]();
}

uint64_t REUISortingComponentSetSortPriorityHint()
{
  return MEMORY[0x270F21110]();
}

uint64_t REUISortingComponentSetUsesMeshBoundingBox()
{
  return MEMORY[0x270F21118]();
}

uint64_t REUnlitMaterialParametersGetColorTexture()
{
  return MEMORY[0x270F21120]();
}

uint64_t REUnlitMaterialParametersGetColorTint()
{
  return MEMORY[0x270F21128]();
}

uint64_t REUnlitMaterialParametersGetDisableTonemap()
{
  return MEMORY[0x270F21130]();
}

uint64_t REUnlitMaterialParametersGetOpacityThreshold()
{
  return MEMORY[0x270F21138]();
}

uint64_t REUnlitMaterialParametersSetColorTexture()
{
  return MEMORY[0x270F21140]();
}

uint64_t REUnlitMaterialParametersSetColorTint()
{
  return MEMORY[0x270F21148]();
}

uint64_t REVFXAssetEnumerateBuiltInAssets()
{
  return MEMORY[0x270F21158]();
}

uint64_t REVFXAssetEnumerateParameterInfosWithEnum()
{
  return MEMORY[0x270F21160]();
}

uint64_t REVFXAssetFindParameterInfoWithEnum()
{
  return MEMORY[0x270F21168]();
}

uint64_t REVFXAssetGetBuiltInEffectsBundle()
{
  return MEMORY[0x270F21178]();
}

uint64_t REVFXEmitterComponentAddCollisionPlane()
{
  return MEMORY[0x270F21180]();
}

uint64_t REVFXEmitterComponentGetAcceleration()
{
  return MEMORY[0x270F21188]();
}

uint64_t REVFXEmitterComponentGetAnimationRepeatMode()
{
  return MEMORY[0x270F21190]();
}

uint64_t REVFXEmitterComponentGetBillboardAxis()
{
  return MEMORY[0x270F21198]();
}

uint64_t REVFXEmitterComponentGetBillboardAxisVariation()
{
  return MEMORY[0x270F211A0]();
}

uint64_t REVFXEmitterComponentGetBillboardMode()
{
  return MEMORY[0x270F211A8]();
}

uint64_t REVFXEmitterComponentGetBirthDirection()
{
  return MEMORY[0x270F211B0]();
}

uint64_t REVFXEmitterComponentGetBirthLocation()
{
  return MEMORY[0x270F211B8]();
}

uint64_t REVFXEmitterComponentGetBirthLocationVertex()
{
  return MEMORY[0x270F211C0]();
}

uint64_t REVFXEmitterComponentGetBirthRate()
{
  return MEMORY[0x270F211C8]();
}

uint64_t REVFXEmitterComponentGetBirthRateVariation()
{
  return MEMORY[0x270F211D0]();
}

uint64_t REVFXEmitterComponentGetBlendMode()
{
  return MEMORY[0x270F211D8]();
}

uint64_t REVFXEmitterComponentGetBurstCount()
{
  return MEMORY[0x270F211E0]();
}

uint64_t REVFXEmitterComponentGetBurstCountVariation()
{
  return MEMORY[0x270F211E8]();
}

uint64_t REVFXEmitterComponentGetBurstRestartCount()
{
  return MEMORY[0x270F211F0]();
}

uint64_t REVFXEmitterComponentGetCollisionPlanes()
{
  return MEMORY[0x270F211F8]();
}

uint64_t REVFXEmitterComponentGetCollisions()
{
  return MEMORY[0x270F21200]();
}

uint64_t REVFXEmitterComponentGetColorEvolutionPower()
{
  return MEMORY[0x270F21208]();
}

uint64_t REVFXEmitterComponentGetColumnCount()
{
  return MEMORY[0x270F21210]();
}

uint64_t REVFXEmitterComponentGetComponentType()
{
  return MEMORY[0x270F21218]();
}

uint64_t REVFXEmitterComponentGetDampingFactor()
{
  return MEMORY[0x270F21220]();
}

uint64_t REVFXEmitterComponentGetEmissionDirection()
{
  return MEMORY[0x270F21228]();
}

uint64_t REVFXEmitterComponentGetEmissionDuration()
{
  return MEMORY[0x270F21230]();
}

uint64_t REVFXEmitterComponentGetEmissionDurationVariation()
{
  return MEMORY[0x270F21238]();
}

uint64_t REVFXEmitterComponentGetEmitterShape()
{
  return MEMORY[0x270F21240]();
}

uint64_t REVFXEmitterComponentGetEmitterShapeSize()
{
  return MEMORY[0x270F21248]();
}

uint64_t REVFXEmitterComponentGetEndColorRangeA()
{
  return MEMORY[0x270F21250]();
}

uint64_t REVFXEmitterComponentGetEndColorRangeB()
{
  return MEMORY[0x270F21258]();
}

uint64_t REVFXEmitterComponentGetFrameRate()
{
  return MEMORY[0x270F21260]();
}

uint64_t REVFXEmitterComponentGetFrameRateVariation()
{
  return MEMORY[0x270F21268]();
}

uint64_t REVFXEmitterComponentGetIdleDuration()
{
  return MEMORY[0x270F21270]();
}

uint64_t REVFXEmitterComponentGetIdleDurationVariation()
{
  return MEMORY[0x270F21278]();
}

uint64_t REVFXEmitterComponentGetInitialFrame()
{
  return MEMORY[0x270F21280]();
}

uint64_t REVFXEmitterComponentGetInitialFrameVariation()
{
  return MEMORY[0x270F21288]();
}

uint64_t REVFXEmitterComponentGetIsAnimated()
{
  return MEMORY[0x270F21290]();
}

uint64_t REVFXEmitterComponentGetIsEmitting()
{
  return MEMORY[0x270F21298]();
}

uint64_t REVFXEmitterComponentGetIsLightingEnabled()
{
  return MEMORY[0x270F212A0]();
}

uint64_t REVFXEmitterComponentGetIsLocalFields()
{
  return MEMORY[0x270F212A8]();
}

uint64_t REVFXEmitterComponentGetIsLocalSimulationSpace()
{
  return MEMORY[0x270F212B0]();
}

uint64_t REVFXEmitterComponentGetIsSpawningEnabled()
{
  return MEMORY[0x270F212B8]();
}

uint64_t REVFXEmitterComponentGetLoops()
{
  return MEMORY[0x270F212C0]();
}

uint64_t REVFXEmitterComponentGetNoiseAnimationSpeed()
{
  return MEMORY[0x270F212C8]();
}

uint64_t REVFXEmitterComponentGetNoiseScale()
{
  return MEMORY[0x270F212D0]();
}

uint64_t REVFXEmitterComponentGetNoiseStrength()
{
  return MEMORY[0x270F212D8]();
}

uint64_t REVFXEmitterComponentGetOpacityOverLife()
{
  return MEMORY[0x270F212E0]();
}

uint64_t REVFXEmitterComponentGetParticleAngle()
{
  return MEMORY[0x270F212E8]();
}

uint64_t REVFXEmitterComponentGetParticleAngleVariation()
{
  return MEMORY[0x270F212F0]();
}

uint64_t REVFXEmitterComponentGetParticleAngularVelocity()
{
  return MEMORY[0x270F212F8]();
}

uint64_t REVFXEmitterComponentGetParticleAngularVelocityVariation()
{
  return MEMORY[0x270F21300]();
}

uint64_t REVFXEmitterComponentGetParticleBounce()
{
  return MEMORY[0x270F21308]();
}

uint64_t REVFXEmitterComponentGetParticleFriction()
{
  return MEMORY[0x270F21310]();
}

uint64_t REVFXEmitterComponentGetParticleImage()
{
  return MEMORY[0x270F21318]();
}

uint64_t REVFXEmitterComponentGetParticleLifeSpan()
{
  return MEMORY[0x270F21320]();
}

uint64_t REVFXEmitterComponentGetParticleLifeSpanVariation()
{
  return MEMORY[0x270F21328]();
}

uint64_t REVFXEmitterComponentGetParticleMass()
{
  return MEMORY[0x270F21330]();
}

uint64_t REVFXEmitterComponentGetParticleMassVariation()
{
  return MEMORY[0x270F21338]();
}

uint64_t REVFXEmitterComponentGetParticleSize()
{
  return MEMORY[0x270F21340]();
}

uint64_t REVFXEmitterComponentGetParticleSizeVariation()
{
  return MEMORY[0x270F21348]();
}

uint64_t REVFXEmitterComponentGetParticleSpeed()
{
  return MEMORY[0x270F21350]();
}

uint64_t REVFXEmitterComponentGetParticleSpeedVariation()
{
  return MEMORY[0x270F21358]();
}

uint64_t REVFXEmitterComponentGetRadialAmount()
{
  return MEMORY[0x270F21360]();
}

uint64_t REVFXEmitterComponentGetRadialGravityCenter()
{
  return MEMORY[0x270F21368]();
}

uint64_t REVFXEmitterComponentGetRadialGravityStrength()
{
  return MEMORY[0x270F21370]();
}

uint64_t REVFXEmitterComponentGetRestartCount()
{
  return MEMORY[0x270F21378]();
}

uint64_t REVFXEmitterComponentGetRowCount()
{
  return MEMORY[0x270F21380]();
}

uint64_t REVFXEmitterComponentGetSimulationRate()
{
  return MEMORY[0x270F21388]();
}

uint64_t REVFXEmitterComponentGetSimulationState()
{
  return MEMORY[0x270F21390]();
}

uint64_t REVFXEmitterComponentGetSizeMultiplierAtEndOfLifespan()
{
  return MEMORY[0x270F21398]();
}

uint64_t REVFXEmitterComponentGetSizeMultiplierAtEndOfLifespanPower()
{
  return MEMORY[0x270F213A0]();
}

uint64_t REVFXEmitterComponentGetSortOrder()
{
  return MEMORY[0x270F213A8]();
}

uint64_t REVFXEmitterComponentGetSpawnInheritParentColor()
{
  return MEMORY[0x270F213B0]();
}

uint64_t REVFXEmitterComponentGetSpawnOccasion()
{
  return MEMORY[0x270F213B8]();
}

uint64_t REVFXEmitterComponentGetSpawnSpreadFactor()
{
  return MEMORY[0x270F213C0]();
}

uint64_t REVFXEmitterComponentGetSpawnSpreadFactorVariation()
{
  return MEMORY[0x270F213C8]();
}

uint64_t REVFXEmitterComponentGetSpawnVelocityFactor()
{
  return MEMORY[0x270F213D0]();
}

uint64_t REVFXEmitterComponentGetSpreadingAngle()
{
  return MEMORY[0x270F213D8]();
}

uint64_t REVFXEmitterComponentGetStartColorRangeA()
{
  return MEMORY[0x270F213E0]();
}

uint64_t REVFXEmitterComponentGetStartColorRangeB()
{
  return MEMORY[0x270F213E8]();
}

uint64_t REVFXEmitterComponentGetStretchFactor()
{
  return MEMORY[0x270F213F0]();
}

uint64_t REVFXEmitterComponentGetTorusInnerRadius()
{
  return MEMORY[0x270F213F8]();
}

uint64_t REVFXEmitterComponentGetUseEndColor()
{
  return MEMORY[0x270F21400]();
}

uint64_t REVFXEmitterComponentGetUseEndColorRange()
{
  return MEMORY[0x270F21408]();
}

uint64_t REVFXEmitterComponentGetUseStartColorRange()
{
  return MEMORY[0x270F21410]();
}

uint64_t REVFXEmitterComponentGetVortexDirection()
{
  return MEMORY[0x270F21418]();
}

uint64_t REVFXEmitterComponentGetVortexStrength()
{
  return MEMORY[0x270F21420]();
}

uint64_t REVFXEmitterComponentGetWarmupDuration()
{
  return MEMORY[0x270F21428]();
}

uint64_t REVFXEmitterComponentMarkDirty()
{
  return MEMORY[0x270F21430]();
}

uint64_t REVFXEmitterComponentRemoveCollisionPlane()
{
  return MEMORY[0x270F21438]();
}

uint64_t REVFXEmitterComponentResetSimulation()
{
  return MEMORY[0x270F21440]();
}

uint64_t REVFXEmitterComponentSetAcceleration()
{
  return MEMORY[0x270F21448]();
}

uint64_t REVFXEmitterComponentSetAnimationRepeatMode()
{
  return MEMORY[0x270F21450]();
}

uint64_t REVFXEmitterComponentSetBillboardAxis()
{
  return MEMORY[0x270F21458]();
}

uint64_t REVFXEmitterComponentSetBillboardAxisVariation()
{
  return MEMORY[0x270F21460]();
}

uint64_t REVFXEmitterComponentSetBillboardMode()
{
  return MEMORY[0x270F21468]();
}

uint64_t REVFXEmitterComponentSetBirthDirection()
{
  return MEMORY[0x270F21470]();
}

uint64_t REVFXEmitterComponentSetBirthLocation()
{
  return MEMORY[0x270F21478]();
}

uint64_t REVFXEmitterComponentSetBirthLocationVertex()
{
  return MEMORY[0x270F21480]();
}

uint64_t REVFXEmitterComponentSetBirthRate()
{
  return MEMORY[0x270F21488]();
}

uint64_t REVFXEmitterComponentSetBirthRateVariation()
{
  return MEMORY[0x270F21490]();
}

uint64_t REVFXEmitterComponentSetBlendMode()
{
  return MEMORY[0x270F21498]();
}

uint64_t REVFXEmitterComponentSetBurstCount()
{
  return MEMORY[0x270F214A0]();
}

uint64_t REVFXEmitterComponentSetBurstCountVariation()
{
  return MEMORY[0x270F214A8]();
}

uint64_t REVFXEmitterComponentSetBurstRestartCount()
{
  return MEMORY[0x270F214B0]();
}

uint64_t REVFXEmitterComponentSetCollision()
{
  return MEMORY[0x270F214B8]();
}

uint64_t REVFXEmitterComponentSetColorEvolutionPower()
{
  return MEMORY[0x270F214C0]();
}

uint64_t REVFXEmitterComponentSetColumnCount()
{
  return MEMORY[0x270F214C8]();
}

uint64_t REVFXEmitterComponentSetDampingFactor()
{
  return MEMORY[0x270F214D0]();
}

uint64_t REVFXEmitterComponentSetEmissionDirection()
{
  return MEMORY[0x270F214D8]();
}

uint64_t REVFXEmitterComponentSetEmissionDuration()
{
  return MEMORY[0x270F214E0]();
}

uint64_t REVFXEmitterComponentSetEmissionDurationVariation()
{
  return MEMORY[0x270F214E8]();
}

uint64_t REVFXEmitterComponentSetEmitterShape()
{
  return MEMORY[0x270F214F0]();
}

uint64_t REVFXEmitterComponentSetEmitterShapeSize()
{
  return MEMORY[0x270F214F8]();
}

uint64_t REVFXEmitterComponentSetEndColorRangeA()
{
  return MEMORY[0x270F21500]();
}

uint64_t REVFXEmitterComponentSetEndColorRangeB()
{
  return MEMORY[0x270F21508]();
}

uint64_t REVFXEmitterComponentSetFrameRate()
{
  return MEMORY[0x270F21510]();
}

uint64_t REVFXEmitterComponentSetFrameRateVariation()
{
  return MEMORY[0x270F21518]();
}

uint64_t REVFXEmitterComponentSetIdleDuration()
{
  return MEMORY[0x270F21520]();
}

uint64_t REVFXEmitterComponentSetIdleDurationVariation()
{
  return MEMORY[0x270F21528]();
}

uint64_t REVFXEmitterComponentSetInitialFrame()
{
  return MEMORY[0x270F21530]();
}

uint64_t REVFXEmitterComponentSetInitialFrameVariation()
{
  return MEMORY[0x270F21538]();
}

uint64_t REVFXEmitterComponentSetIsAnimated()
{
  return MEMORY[0x270F21540]();
}

uint64_t REVFXEmitterComponentSetIsEmitting()
{
  return MEMORY[0x270F21548]();
}

uint64_t REVFXEmitterComponentSetIsLightingEnabled()
{
  return MEMORY[0x270F21550]();
}

uint64_t REVFXEmitterComponentSetIsLocalFields()
{
  return MEMORY[0x270F21558]();
}

uint64_t REVFXEmitterComponentSetIsLocalSimulationSpace()
{
  return MEMORY[0x270F21560]();
}

uint64_t REVFXEmitterComponentSetIsSpawningEnabled()
{
  return MEMORY[0x270F21568]();
}

uint64_t REVFXEmitterComponentSetLoops()
{
  return MEMORY[0x270F21570]();
}

uint64_t REVFXEmitterComponentSetNoiseAnimationSpeed()
{
  return MEMORY[0x270F21578]();
}

uint64_t REVFXEmitterComponentSetNoiseScale()
{
  return MEMORY[0x270F21580]();
}

uint64_t REVFXEmitterComponentSetNoiseStrength()
{
  return MEMORY[0x270F21588]();
}

uint64_t REVFXEmitterComponentSetOpacityOverLife()
{
  return MEMORY[0x270F21590]();
}

uint64_t REVFXEmitterComponentSetParticleAngle()
{
  return MEMORY[0x270F21598]();
}

uint64_t REVFXEmitterComponentSetParticleAngleVariation()
{
  return MEMORY[0x270F215A0]();
}

uint64_t REVFXEmitterComponentSetParticleAngularVelocity()
{
  return MEMORY[0x270F215A8]();
}

uint64_t REVFXEmitterComponentSetParticleAngularVelocityVariation()
{
  return MEMORY[0x270F215B0]();
}

uint64_t REVFXEmitterComponentSetParticleBounce()
{
  return MEMORY[0x270F215B8]();
}

uint64_t REVFXEmitterComponentSetParticleFriction()
{
  return MEMORY[0x270F215C0]();
}

uint64_t REVFXEmitterComponentSetParticleImage()
{
  return MEMORY[0x270F215C8]();
}

uint64_t REVFXEmitterComponentSetParticleLifeSpan()
{
  return MEMORY[0x270F215D0]();
}

uint64_t REVFXEmitterComponentSetParticleLifeSpanVariation()
{
  return MEMORY[0x270F215D8]();
}

uint64_t REVFXEmitterComponentSetParticleMass()
{
  return MEMORY[0x270F215E0]();
}

uint64_t REVFXEmitterComponentSetParticleMassVariation()
{
  return MEMORY[0x270F215E8]();
}

uint64_t REVFXEmitterComponentSetParticleSize()
{
  return MEMORY[0x270F215F0]();
}

uint64_t REVFXEmitterComponentSetParticleSizeVariation()
{
  return MEMORY[0x270F215F8]();
}

uint64_t REVFXEmitterComponentSetParticleSpeed()
{
  return MEMORY[0x270F21600]();
}

uint64_t REVFXEmitterComponentSetParticleSpeedVariation()
{
  return MEMORY[0x270F21608]();
}

uint64_t REVFXEmitterComponentSetRadialAmount()
{
  return MEMORY[0x270F21610]();
}

uint64_t REVFXEmitterComponentSetRadialGravityCenter()
{
  return MEMORY[0x270F21618]();
}

uint64_t REVFXEmitterComponentSetRadialGravityStrength()
{
  return MEMORY[0x270F21620]();
}

uint64_t REVFXEmitterComponentSetRestartCount()
{
  return MEMORY[0x270F21628]();
}

uint64_t REVFXEmitterComponentSetRowCount()
{
  return MEMORY[0x270F21630]();
}

uint64_t REVFXEmitterComponentSetSimulationRate()
{
  return MEMORY[0x270F21638]();
}

uint64_t REVFXEmitterComponentSetSimulationState()
{
  return MEMORY[0x270F21640]();
}

uint64_t REVFXEmitterComponentSetSizeMultiplierAtEndOfLifespan()
{
  return MEMORY[0x270F21648]();
}

uint64_t REVFXEmitterComponentSetSizeMultiplierAtEndOfLifespanPower()
{
  return MEMORY[0x270F21650]();
}

uint64_t REVFXEmitterComponentSetSortOrder()
{
  return MEMORY[0x270F21658]();
}

uint64_t REVFXEmitterComponentSetSpawnInheritParentColor()
{
  return MEMORY[0x270F21660]();
}

uint64_t REVFXEmitterComponentSetSpawnOccasion()
{
  return MEMORY[0x270F21668]();
}

uint64_t REVFXEmitterComponentSetSpawnSpreadFactor()
{
  return MEMORY[0x270F21670]();
}

uint64_t REVFXEmitterComponentSetSpawnSpreadFactorVariation()
{
  return MEMORY[0x270F21678]();
}

uint64_t REVFXEmitterComponentSetSpawnVelocityFactor()
{
  return MEMORY[0x270F21680]();
}

uint64_t REVFXEmitterComponentSetSpreadingAngle()
{
  return MEMORY[0x270F21688]();
}

uint64_t REVFXEmitterComponentSetStartColorRangeA()
{
  return MEMORY[0x270F21690]();
}

uint64_t REVFXEmitterComponentSetStartColorRangeB()
{
  return MEMORY[0x270F21698]();
}

uint64_t REVFXEmitterComponentSetStretchFactor()
{
  return MEMORY[0x270F216A0]();
}

uint64_t REVFXEmitterComponentSetTorusInnerRadius()
{
  return MEMORY[0x270F216A8]();
}

uint64_t REVFXEmitterComponentSetUseEndColorRange()
{
  return MEMORY[0x270F216B8]();
}

uint64_t REVFXEmitterComponentSetUseStartColorRange()
{
  return MEMORY[0x270F216C0]();
}

uint64_t REVFXEmitterComponentSetVortexDirection()
{
  return MEMORY[0x270F216C8]();
}

uint64_t REVFXEmitterComponentSetVortexStrength()
{
  return MEMORY[0x270F216D0]();
}

uint64_t REVFXEmitterComponentSetWarmupDuration()
{
  return MEMORY[0x270F216D8]();
}

uint64_t REVFXEmitterComponentUpdateCollisionPlane()
{
  return MEMORY[0x270F216E0]();
}

uint64_t REVFXGetLibraryURLForSystemName()
{
  return MEMORY[0x270F216E8]();
}

uint64_t REVFXSceneComponentGetAsset()
{
  return MEMORY[0x270F216F8]();
}

uint64_t REVFXSceneComponentGetComponentType()
{
  return MEMORY[0x270F21700]();
}

uint64_t REVFXSceneComponentGetParameterBool()
{
  return MEMORY[0x270F21708]();
}

uint64_t REVFXSceneComponentGetParameterFloat()
{
  return MEMORY[0x270F21710]();
}

uint64_t REVFXSceneComponentGetParameterFloat2()
{
  return MEMORY[0x270F21718]();
}

uint64_t REVFXSceneComponentGetParameterFloat3()
{
  return MEMORY[0x270F21720]();
}

uint64_t REVFXSceneComponentGetParameterFloat3x3()
{
  return MEMORY[0x270F21728]();
}

uint64_t REVFXSceneComponentGetParameterFloat4()
{
  return MEMORY[0x270F21730]();
}

uint64_t REVFXSceneComponentGetParameterFloat4x4()
{
  return MEMORY[0x270F21738]();
}

uint64_t REVFXSceneComponentGetParameterInt()
{
  return MEMORY[0x270F21740]();
}

uint64_t REVFXSceneComponentGetParameterInt16()
{
  return MEMORY[0x270F21748]();
}

uint64_t REVFXSceneComponentGetParameterInt32()
{
  return MEMORY[0x270F21750]();
}

uint64_t REVFXSceneComponentGetParameterInt64()
{
  return MEMORY[0x270F21758]();
}

uint64_t REVFXSceneComponentGetParameterInt8()
{
  return MEMORY[0x270F21760]();
}

uint64_t REVFXSceneComponentGetParameterKeyframeAnimation()
{
  return MEMORY[0x270F21768]();
}

uint64_t REVFXSceneComponentGetParameterString()
{
  return MEMORY[0x270F21770]();
}

uint64_t REVFXSceneComponentGetParameterUInt16()
{
  return MEMORY[0x270F21778]();
}

uint64_t REVFXSceneComponentGetParameterUInt32()
{
  return MEMORY[0x270F21780]();
}

uint64_t REVFXSceneComponentGetParameterUInt64()
{
  return MEMORY[0x270F21788]();
}

uint64_t REVFXSceneComponentGetParameterUInt8()
{
  return MEMORY[0x270F21790]();
}

uint64_t REVFXSceneComponentGetSimulationRate()
{
  return MEMORY[0x270F21798]();
}

uint64_t REVFXSceneComponentGetSimulationState()
{
  return MEMORY[0x270F217A0]();
}

uint64_t REVFXSceneComponentGetSimulationTime()
{
  return MEMORY[0x270F217A8]();
}

uint64_t REVFXSceneComponentResetSimulation()
{
  return MEMORY[0x270F217C0]();
}

uint64_t REVFXSceneComponentSetAsset()
{
  return MEMORY[0x270F217C8]();
}

uint64_t REVFXSceneComponentSetParameterBool()
{
  return MEMORY[0x270F217D0]();
}

uint64_t REVFXSceneComponentSetParameterFloat()
{
  return MEMORY[0x270F217D8]();
}

uint64_t REVFXSceneComponentSetParameterFloat2()
{
  return MEMORY[0x270F217E0]();
}

uint64_t REVFXSceneComponentSetParameterFloat3()
{
  return MEMORY[0x270F217E8]();
}

uint64_t REVFXSceneComponentSetParameterFloat3x3()
{
  return MEMORY[0x270F217F0]();
}

uint64_t REVFXSceneComponentSetParameterFloat4()
{
  return MEMORY[0x270F217F8]();
}

uint64_t REVFXSceneComponentSetParameterFloat4x4()
{
  return MEMORY[0x270F21800]();
}

uint64_t REVFXSceneComponentSetParameterInt()
{
  return MEMORY[0x270F21808]();
}

uint64_t REVFXSceneComponentSetParameterInt16()
{
  return MEMORY[0x270F21810]();
}

uint64_t REVFXSceneComponentSetParameterInt32()
{
  return MEMORY[0x270F21818]();
}

uint64_t REVFXSceneComponentSetParameterInt64()
{
  return MEMORY[0x270F21820]();
}

uint64_t REVFXSceneComponentSetParameterInt8()
{
  return MEMORY[0x270F21828]();
}

uint64_t REVFXSceneComponentSetParameterKeyframeAnimation()
{
  return MEMORY[0x270F21830]();
}

uint64_t REVFXSceneComponentSetParameterString()
{
  return MEMORY[0x270F21838]();
}

uint64_t REVFXSceneComponentSetParameterUInt16()
{
  return MEMORY[0x270F21840]();
}

uint64_t REVFXSceneComponentSetParameterUInt32()
{
  return MEMORY[0x270F21848]();
}

uint64_t REVFXSceneComponentSetParameterUInt64()
{
  return MEMORY[0x270F21850]();
}

uint64_t REVFXSceneComponentSetParameterUInt8()
{
  return MEMORY[0x270F21858]();
}

uint64_t REVFXSceneComponentSetPortalPaddingForCollisions()
{
  return MEMORY[0x270F21860]();
}

uint64_t REVFXSceneComponentSetSimulationRate()
{
  return MEMORY[0x270F21868]();
}

uint64_t REVFXSceneComponentSetSimulationState()
{
  return MEMORY[0x270F21870]();
}

uint64_t REVFXSceneComponentSetSimulationTime()
{
  return MEMORY[0x270F21878]();
}

uint64_t REVFXSceneComponentStartCollidingOutsidePortal()
{
  return MEMORY[0x270F21880]();
}

uint64_t REVFXSceneComponentStartFetchingParameter()
{
  return MEMORY[0x270F21888]();
}

uint64_t REVFXSceneComponentStopCollidingOutsidePortal()
{
  return MEMORY[0x270F21890]();
}

uint64_t REVFXSceneComponentStopFetchingParameter()
{
  return MEMORY[0x270F21898]();
}

uint64_t REVideoAssetGetAVPlayer()
{
  return MEMORY[0x270F218A8]();
}

uint64_t REVideoAssetGetAVSampleBufferVideoRenderer()
{
  return MEMORY[0x270F218B0]();
}

uint64_t REVideoAssetGetAudioInputMode()
{
  return MEMORY[0x270F218B8]();
}

uint64_t REVideoAssetGetFileAssetCount()
{
  return MEMORY[0x270F218C0]();
}

uint64_t REVideoAssetGetRemotePlayer()
{
  return MEMORY[0x270F218C8]();
}

uint64_t REVideoAssetGetReverbSendLevelDecibels()
{
  return MEMORY[0x270F218D0]();
}

uint64_t REVideoAssetSetAVPlayer()
{
  return MEMORY[0x270F218D8]();
}

uint64_t REVideoAssetSetAudioInputMode()
{
  return MEMORY[0x270F218E0]();
}

uint64_t REVideoAssetSetRemotePlayer()
{
  return MEMORY[0x270F218E8]();
}

uint64_t REVideoAssetSetReverbSendLevelDecibels()
{
  return MEMORY[0x270F218F0]();
}

uint64_t REVideoComponentAddRealityKitDefaultAttachmentsOnAllMaterials()
{
  return MEMORY[0x270F218F8]();
}

uint64_t REVideoComponentGetComponentType()
{
  return MEMORY[0x270F21900]();
}

uint64_t REVideoComponentGetCurrentImageSize()
{
  return MEMORY[0x270F21908]();
}

uint64_t REVideoComponentGetCurrentViewingMode()
{
  return MEMORY[0x270F21910]();
}

uint64_t REVideoComponentGetDesiredViewingMode()
{
  return MEMORY[0x270F21918]();
}

uint64_t REVideoComponentGetFadeThreshold()
{
  return MEMORY[0x270F21920]();
}

uint64_t REVideoComponentGetMaterialAsset()
{
  return MEMORY[0x270F21928]();
}

uint64_t REVideoComponentGetVideoAsset()
{
  return MEMORY[0x270F21930]();
}

uint64_t REVideoComponentSetDesiredViewingMode()
{
  return MEMORY[0x270F21938]();
}

uint64_t REVideoComponentSetFadeThreshold()
{
  return MEMORY[0x270F21940]();
}

uint64_t REVideoComponentSetMaterialAsset()
{
  return MEMORY[0x270F21948]();
}

uint64_t REVideoComponentSetVideoAsset()
{
  return MEMORY[0x270F21950]();
}

uint64_t REVideoPlayerComponentGetComponentType()
{
  return MEMORY[0x270F21958]();
}

uint64_t REVideoPlayerComponentGetDesiredViewingMode()
{
  return MEMORY[0x270F21960]();
}

uint64_t REVideoPlayerComponentGetEnableReflections()
{
  return MEMORY[0x270F21968]();
}

uint64_t REVideoPlayerComponentGetGuid()
{
  return MEMORY[0x270F21970]();
}

uint64_t REVideoPlayerComponentGetLowLatencyEnabled()
{
  return MEMORY[0x270F21978]();
}

uint64_t REVideoPlayerComponentGetScreenAspectRatioAnimationEnabled()
{
  return MEMORY[0x270F21980]();
}

uint64_t REVideoPlayerComponentGetScreenDeferAspectRatioTransitionToApp()
{
  return MEMORY[0x270F21988]();
}

uint64_t REVideoPlayerComponentGetScreenRoundedCornerEnabled()
{
  return MEMORY[0x270F21990]();
}

uint64_t REVideoPlayerComponentGetVideoAsset()
{
  return MEMORY[0x270F21998]();
}

uint64_t REVideoPlayerComponentPreloadVideoAsset()
{
  return MEMORY[0x270F219A0]();
}

uint64_t REVideoPlayerComponentSetEnableReflections()
{
  return MEMORY[0x270F219A8]();
}

uint64_t REVideoPlayerComponentSetGuid()
{
  return MEMORY[0x270F219B0]();
}

uint64_t REVideoPlayerComponentSetLowLatencyEnabled()
{
  return MEMORY[0x270F219B8]();
}

uint64_t REVideoPlayerComponentSetScreenAspectRatioAnimationEnabled()
{
  return MEMORY[0x270F219C0]();
}

uint64_t REVideoPlayerComponentSetScreenDeferAspectRatioTransitionToApp()
{
  return MEMORY[0x270F219C8]();
}

uint64_t REVideoPlayerComponentSetScreenRoundedCornerEnabled()
{
  return MEMORY[0x270F219D0]();
}

uint64_t REVideoPlayerComponentSetVideoAsset()
{
  return MEMORY[0x270F219D8]();
}

uint64_t REVideoPlayerComponentStartBlurVideoFadeIn()
{
  return MEMORY[0x270F219E0]();
}

uint64_t REVideoPlayerComponentStartBlurVideoFadeOut()
{
  return MEMORY[0x270F219E8]();
}

uint64_t REVideoPlayerStatusComponentDidUpdateInApp()
{
  return MEMORY[0x270F219F0]();
}

uint64_t REVideoPlayerStatusComponentGetComponentType()
{
  return MEMORY[0x270F219F8]();
}

uint64_t REVideoPlayerStatusComponentGetCurrentPlayerScreenSize()
{
  return MEMORY[0x270F21A00]();
}

uint64_t REVideoPlayerStatusComponentGetCurrentPlayerScreenVideoDimension()
{
  return MEMORY[0x270F21A08]();
}

uint64_t REVideoPlayerStatusComponentGetCurrentSceneSize()
{
  return MEMORY[0x270F21A10]();
}

uint64_t REVideoPlayerStatusComponentGetSafeZoneRadius()
{
  return MEMORY[0x270F21A18]();
}

uint64_t REVirtualEnvironmentProbeComponentAddResource()
{
  return MEMORY[0x270F21A20]();
}

uint64_t REVirtualEnvironmentProbeComponentClearResources()
{
  return MEMORY[0x270F21A28]();
}

uint64_t REVirtualEnvironmentProbeComponentGetComponentType()
{
  return MEMORY[0x270F21A30]();
}

uint64_t REVirtualEnvironmentProbeComponentGetIntensityExponent()
{
  return MEMORY[0x270F21A38]();
}

uint64_t REVirtualEnvironmentProbeComponentGetRelativeWeight()
{
  return MEMORY[0x270F21A40]();
}

uint64_t REVirtualEnvironmentProbeComponentGetResource()
{
  return MEMORY[0x270F21A48]();
}

uint64_t REVirtualEnvironmentProbeComponentGetResourceCount()
{
  return MEMORY[0x270F21A50]();
}

uint64_t REVirtualEnvironmentProbeComponentSetIntensityExponent()
{
  return MEMORY[0x270F21A58]();
}

uint64_t REVirtualEnvironmentProbeComponentSetRelativeWeight()
{
  return MEMORY[0x270F21A60]();
}

uint64_t REWorldRootComponentCopyWorldRoot()
{
  return MEMORY[0x270F21A70]();
}

uint64_t REWorldRootComponentGetComponentType()
{
  return MEMORY[0x270F21A78]();
}

uint64_t REWorldRootComponentSetWorldRoot()
{
  return MEMORY[0x270F21A80]();
}

uint64_t REZipArchiveCopyFileAsData()
{
  return MEMORY[0x270F21A88]();
}

uint64_t RFARKitDataProviderCreate()
{
  return MEMORY[0x270F59780]();
}

uint64_t RFARKitDataProviderGetARSession()
{
  return MEMORY[0x270F59788]();
}

uint64_t RFARKitDataProviderSetARSession()
{
  return MEMORY[0x270F59790]();
}

uint64_t RFAnchorDataProviderCreate()
{
  return MEMORY[0x270F59798]();
}

uint64_t RFAnchorManagementServiceCleanupWithServiceLocator()
{
  return MEMORY[0x270F597A0]();
}

uint64_t RFAnchorManagementServiceCreate()
{
  return MEMORY[0x270F597A8]();
}

uint64_t RFAnchorManagementServiceUpdateByDeltaTime()
{
  return MEMORY[0x270F597B0]();
}

uint64_t RFAnchorManagementSetClientNeedImageAnchoring()
{
  return MEMORY[0x270F597B8]();
}

uint64_t RFAnchorManagementSetClientNeedObjectAnchoring()
{
  return MEMORY[0x270F597C0]();
}

uint64_t RFAnchorManagementSetClientNeedPlaneAnchoring()
{
  return MEMORY[0x270F597C8]();
}

uint64_t RFAnchorManagementSetClientNeedWorldAnchoring()
{
  return MEMORY[0x270F597D0]();
}

uint64_t RFAnchorManagementSetNeedClientAnchoring()
{
  return MEMORY[0x270F597D8]();
}

uint64_t RFAnchorManagementUpdateAnchoringInScene()
{
  return MEMORY[0x270F597E0]();
}

uint64_t RFAtmospherePlacementServiceCreate()
{
  return MEMORY[0x270F597E8]();
}

uint64_t RFEnvironmentProbePlacementServiceCreate()
{
  return MEMORY[0x270F597F0]();
}

uint64_t RFEnvironmentProbePlacementServiceSetOnProbeDataCreatedCallback()
{
  return MEMORY[0x270F597F8]();
}

uint64_t RFEnvironmentProbePlacementServiceSetOnProbeDataRemovedCallback()
{
  return MEMORY[0x270F59800]();
}

uint64_t RFLoggingServiceCreate()
{
  return MEMORY[0x270F59808]();
}

uint64_t RFMeshReconstructionServiceCreate()
{
  return MEMORY[0x270F59810]();
}

uint64_t RFServiceManagerCleanUp()
{
  return MEMORY[0x270F59818]();
}

uint64_t RFServiceManagerCreate()
{
  return MEMORY[0x270F59820]();
}

uint64_t RFServiceManagerGenerateSnapshot()
{
  return MEMORY[0x270F59828]();
}

uint64_t RFServiceManagerGetARKitDataProvider()
{
  return MEMORY[0x270F59830]();
}

uint64_t RFServiceManagerGetAnchorManagementService()
{
  return MEMORY[0x270F59838]();
}

uint64_t RFServiceManagerGetEnvironmentProbePlacementService()
{
  return MEMORY[0x270F59840]();
}

uint64_t RFServiceManagerSetARKitDataProvider()
{
  return MEMORY[0x270F59848]();
}

uint64_t RFServiceManagerSetAnchorDataProvider()
{
  return MEMORY[0x270F59850]();
}

uint64_t RFServiceManagerSetAnchorManagementService()
{
  return MEMORY[0x270F59858]();
}

uint64_t RFServiceManagerSetAtmospherePlacementService()
{
  return MEMORY[0x270F59860]();
}

uint64_t RFServiceManagerSetEnvironmentProbePlacementService()
{
  return MEMORY[0x270F59868]();
}

uint64_t RFServiceManagerSetLoggingService()
{
  return MEMORY[0x270F59870]();
}

uint64_t RFServiceManagerSetMeshReconstructionService()
{
  return MEMORY[0x270F59878]();
}

uint64_t RIOEntityUsingMaterialCreateFromInMemoryDataBufferAsync()
{
  return MEMORY[0x270F21E28]();
}

uint64_t RIOEntityUsingMaterialCreateFromInMemoryMtlxDataBufferAsync()
{
  return MEMORY[0x270F21E30]();
}

uint64_t RIOEntityUsingMaterialCreateFromMtlxURLAsync()
{
  return MEMORY[0x270F21E38]();
}

uint64_t RIOImportSessionCreateWithStage()
{
  return MEMORY[0x270F21E80]();
}

uint64_t RIOImportSessionGetEntityAtPrimPath()
{
  return MEMORY[0x270F21EC0]();
}

uint64_t RIOImportSessionGetRootEntity()
{
  return MEMORY[0x270F21EE8]();
}

uint64_t RIOImportSessionGetStage()
{
  return MEMORY[0x270F21EF8]();
}

uint64_t RIOImportSessionSetSceneUpdatePassCompletion()
{
  return MEMORY[0x270F21F88]();
}

uint64_t RIOImportSessionUpdate()
{
  return MEMORY[0x270F21F98]();
}

uint64_t RIOPxrSdfLayerSetCustomLayerData()
{
  return MEMORY[0x270F221D0]();
}

uint64_t RIOPxrSdfPathCopyString()
{
  return MEMORY[0x270F222C8]();
}

uint64_t RIOPxrSdfPathCreateFromCString()
{
  return MEMORY[0x270F22378]();
}

uint64_t RIOPxrTfTokenCreateWithCString()
{
  return MEMORY[0x270F22810]();
}

uint64_t RIOPxrTfTokenEmpty()
{
  return MEMORY[0x270F22818]();
}

uint64_t RIOPxrUsdEditTargetCreateWithLayer()
{
  return MEMORY[0x270F228E8]();
}

uint64_t RIOPxrUsdObjectCopyPath()
{
  return MEMORY[0x270F22968]();
}

uint64_t RIOPxrUsdPrimAddReference()
{
  return MEMORY[0x270F229C0]();
}

uint64_t RIOPxrUsdPrimCopyChildren()
{
  return MEMORY[0x270F229F8]();
}

uint64_t RIOPxrUsdPrimCopyVariantSet()
{
  return MEMORY[0x270F22A30]();
}

uint64_t RIOPxrUsdPrimCopyVariantSets()
{
  return MEMORY[0x270F22A38]();
}

uint64_t RIOPxrUsdPrimCreateCreateRelationship()
{
  return MEMORY[0x270F22A48]();
}

uint64_t RIOPxrUsdPrimHasVariantSets()
{
  return MEMORY[0x270F22B40]();
}

uint64_t RIOPxrUsdRelationshipSetTargets()
{
  return MEMORY[0x270F22C08]();
}

uint64_t RIOPxrUsdStageCopyDefaultPrim()
{
  return MEMORY[0x270F22CA0]();
}

uint64_t RIOPxrUsdStageCopyEditTarget()
{
  return MEMORY[0x270F22CA8]();
}

uint64_t RIOPxrUsdStageCopyRootLayer()
{
  return MEMORY[0x270F22CC0]();
}

uint64_t RIOPxrUsdStageCopySessionLayer()
{
  return MEMORY[0x270F22CC8]();
}

uint64_t RIOPxrUsdStageCreateInMemory()
{
  return MEMORY[0x270F22CE8]();
}

uint64_t RIOPxrUsdStageCreatePrimIfNeeded()
{
  return MEMORY[0x270F22CF0]();
}

uint64_t RIOPxrUsdStageHasPrimAtPrimPath()
{
  return MEMORY[0x270F22D88]();
}

uint64_t RIOPxrUsdStageSetEditTarget()
{
  return MEMORY[0x270F22DD8]();
}

uint64_t RIOPxrUsdVariantSetClearVariantSelection()
{
  return MEMORY[0x270F22E50]();
}

uint64_t RIOPxrUsdVariantSetCopyVariantNames()
{
  return MEMORY[0x270F22E68]();
}

uint64_t RIOPxrUsdVariantSetCopyVariantSelection()
{
  return MEMORY[0x270F22E70]();
}

uint64_t RIOPxrUsdVariantSetHasAuthoredVariantSelection()
{
  return MEMORY[0x270F22E78]();
}

uint64_t RIOPxrUsdVariantSetsCopySetNames()
{
  return MEMORY[0x270F22EA0]();
}

uint64_t RIOPxrUsdVariantSetsCopyVariantSet()
{
  return MEMORY[0x270F22EB0]();
}

uint64_t RIOPxrUsdVariantSetsHasVariantSet()
{
  return MEMORY[0x270F22EB8]();
}

uint64_t RIOPxrUsdVariantSetsSetSelection()
{
  return MEMORY[0x270F22EC0]();
}

uint64_t RIOPxrVtValueCreateWithBool()
{
  return MEMORY[0x270F22FA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _REArchiveOperationArchiveToURL()
{
  return MEMORY[0x270F21A98]();
}

uint64_t _REArchiveOperationCreateWithURL()
{
  return MEMORY[0x270F21AA0]();
}

uint64_t _REArchiveOperationRelease()
{
  return MEMORY[0x270F21AA8]();
}

uint64_t _REArchiveOperationSetArchiveCompressionLevel()
{
  return MEMORY[0x270F21AB0]();
}

uint64_t _REArchiveOperationSetEnvelopeVersion()
{
  return MEMORY[0x270F21AB8]();
}

uint64_t _REArchiveOperationSetProgress()
{
  return MEMORY[0x270F21AC0]();
}

uint64_t _REArchiveOperationSetStreamCompression()
{
  return MEMORY[0x270F21AC8]();
}

uint64_t _REArchiveOperationUnarchiveToURL()
{
  return MEMORY[0x270F21AD0]();
}

uint64_t _REArchiveOperationUnarchiveToURLWithProfiling()
{
  return MEMORY[0x270F21AD8]();
}

uint64_t _REAssetManagerGetServiceLocatorForLegacyAPIWorkaround()
{
  return MEMORY[0x270F21AE0]();
}

uint64_t _REAssetManagerIsFullLoadTracingEnabled()
{
  return MEMORY[0x270F21AE8]();
}

uint64_t _RERenderManagerExportTextureAssetToKTXWithErrorHandling()
{
  return MEMORY[0x270F21AF0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

double _simd_orient_pd2(simd_double2 a1, simd_double2 a2, simd_double2 a3)
{
  MEMORY[0x270ED82F0]((__n128)a1, (__n128)a2, (__n128)a3);
  return result;
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270ED86D8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

uint64_t geom_collection_data_2d()
{
  return MEMORY[0x270F302B8]();
}

uint64_t geom_collection_size_d()
{
  return MEMORY[0x270F302D8]();
}

uint64_t geom_collection_size_u()
{
  return MEMORY[0x270F302E0]();
}

uint64_t geom_create_collection_2d()
{
  return MEMORY[0x270F302F8]();
}

uint64_t geom_create_collection_d()
{
  return MEMORY[0x270F30308]();
}

uint64_t geom_create_collection_u()
{
  return MEMORY[0x270F30318]();
}

uint64_t geom_cubic_bezier_tangent_at_2d()
{
  return MEMORY[0x270F30338]();
}

uint64_t geom_inset_evaluator_advance_inset_to_2d()
{
  return MEMORY[0x270F30340]();
}

uint64_t geom_inset_evaluator_extract_joiner_mesh_2d()
{
  return MEMORY[0x270F30348]();
}

uint64_t geom_inset_evaluator_extract_offset_curve_2d()
{
  return MEMORY[0x270F30350]();
}

uint64_t geom_inset_evaluator_get_computed_inset_distance_2d()
{
  return MEMORY[0x270F30358]();
}

uint64_t geom_quadratic_bezier_tangent_at_2d()
{
  return MEMORY[0x270F30388]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x270FA0638]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x270FA0640]();
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

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x270FA0660]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x270FA0668]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x270EDB8B0](*(void *)&target_task, act_list, act_listCnt);
}