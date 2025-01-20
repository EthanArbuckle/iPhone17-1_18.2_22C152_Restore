uint64_t static AppManager.sceneConfigurator.setter(uint64_t a1)
{
  unsigned char v3[40];

  if (qword_26AEBA7A0 != -1) {
    swift_once();
  }
  sub_22F3A41A8(a1, (uint64_t)v3);
  swift_beginAccess();
  sub_22F3A4208((uint64_t)v3, (uint64_t)&xmmword_26AEBAA60);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

void sub_22F3A0624()
{
  if (!qword_2686BE538)
  {
    sub_22F3BD288();
    unint64_t v0 = sub_22F3BD8E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2686BE538);
    }
  }
}

uint64_t sub_22F3A067C()
{
  uint64_t result = sub_22F3BCE38();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_22F3BD088();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_22F3BD1C8();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

void sub_22F3A07A4()
{
  sub_22F3BCDF8();
  if (v0 <= 0x3F)
  {
    sub_22F3A0624();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_22F3A0974()
{
  id v1 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v2 = MEMORY[0x263F8EE80];
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 24) = v2;
  return v0;
}

uint64_t sub_22F3A09B8(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5 = sub_22F3BD548();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  uint64_t result = *a3;
  if (*a3)
  {
    sub_22F3BD688();
    uint64_t result = *MEMORY[0x263F51868];
    if (*MEMORY[0x263F51868])
    {
      sub_22F3BD688();
      return sub_22F3BD538();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void UIView.annotate(with:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v25 = v0;
  sub_22F3BCE38();
  OUTLINED_FUNCTION_0_1();
  v24[1] = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_9();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA930);
  uint64_t v4 = OUTLINED_FUNCTION_24(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6();
  uint64_t v5 = sub_22F3BD088();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)v24 - v12;
  v14 = *(void (**)(void))(v7 + 16);
  OUTLINED_FUNCTION_3_2();
  v14();
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v13, v5);
  if (v15 == *MEMORY[0x263EFB8F8])
  {
    uint64_t v16 = OUTLINED_FUNCTION_13_0();
    v17(v16);
    sub_22F3BCDF8();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_4();
    v18();
LABEL_8:
    OUTLINED_FUNCTION_10();
    return;
  }
  if (v15 == *MEMORY[0x263EFB8F0])
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v5);
LABEL_7:
    uint64_t v27 = v25;
    OUTLINED_FUNCTION_3_2();
    v14();
    OUTLINED_FUNCTION_15_0();
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_22F3A36A8(&qword_26AEBA900, MEMORY[0x263EFB6A0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
    sub_22F3A3004();
    OUTLINED_FUNCTION_12_0();
    sub_22F3A2FC4();
    sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2A8();
    OUTLINED_FUNCTION_4();
    v23();
    sub_22F3A36F0(v1, &qword_26AEBA930);
    goto LABEL_8;
  }
  if (v15 == *MEMORY[0x263EFB8E8])
  {
    uint64_t v19 = OUTLINED_FUNCTION_13_0();
    v20(v19);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA898);
    sub_22F3A36F0((uint64_t)&v13[*(int *)(v21 + 48)], &qword_26AEBA8E8);
    sub_22F3BD108();
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(char *))(v22 + 8))(v13);
    goto LABEL_7;
  }
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_22F3BD978();
  sub_22F3BD678();
  OUTLINED_FUNCTION_3_2();
  v14();
  sub_22F3BD9F8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v5);
  sub_22F3BDA18();
  __break(1u);
}

uint64_t (*sub_22F3A0F0C())()
{
  return j__swift_endAccess;
}

id AppEntityViewAnnotation.init<A>(entityType:identifier:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA888);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_3_1();
  uint64_t v45 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA890);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_3_1();
  uint64_t v43 = v6;
  uint64_t v41 = sub_22F3BD418();
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_1();
  uint64_t v37 = sub_22F3BD1C8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_1();
  uint64_t v40 = v10;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v11);
  uint64_t v38 = sub_22F3BD108();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6_0();
  uint64_t v17 = v16 - v15;
  OUTLINED_FUNCTION_5();
  v18();
  uint64_t v19 = v39;
  sub_22F3BD0F8();
  v20 = &v19[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_data];
  uint64_t v21 = (uint64_t)&v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA898) + 48)];
  OUTLINED_FUNCTION_5();
  v22();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v37);
  uint64_t v23 = *MEMORY[0x263EFB8E8];
  sub_22F3BD088();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *, uint64_t))(v24 + 104))(v20, v23);
  uint64_t v25 = sub_22F3BCE38();
  OUTLINED_FUNCTION_1();
  uint64_t v27 = v26;
  OUTLINED_FUNCTION_5();
  v28();
  *(_DWORD *)&v19[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_interactionId] = sub_22F3BD0D8();
  sub_22F3BD408();
  __swift_storeEnumTagSinglePayload(v43, 1, 1, v41);
  uint64_t v29 = sub_22F3BD1A8();
  __swift_storeEnumTagSinglePayload(v45, 1, 1, v29);
  sub_22F3BD1B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(&v19[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_displayRepresentation], v40, v37);
  *(void *)&v19[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_structuredDataRepresentations] = sub_22F3BD0E8();
  uint64_t v30 = sub_22F3BD0C8();
  uint64_t v32 = v31;
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v38);
  v33 = (uint64_t *)&v19[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_entityDescription];
  uint64_t *v33 = v30;
  v33[1] = v32;

  v46.receiver = v19;
  v46.super_class = (Class)type metadata accessor for AppEntityViewAnnotation();
  id v34 = objc_msgSendSuper2(&v46, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(a3, v25);
  OUTLINED_FUNCTION_4();
  v35();
  return v34;
}

uint64_t sub_22F3A13D0()
{
  type metadata accessor for AppUIKitBridge();
  uint64_t v0 = swift_allocObject();
  sub_22F3A0974();
  sub_22F3BCF88();
  sub_22F3BCF68();
  sub_22F3A42F0((unint64_t *)&unk_26AEBAA00, v1, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  swift_retain();
  sub_22F3BCF78();
  swift_release();
  swift_release();
  if (qword_26AEBAA10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22F3BD548();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AEBAAD0);
  uint64_t v3 = sub_22F3BD528();
  os_log_type_t v4 = sub_22F3BD818();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22F39E000, v3, v4, "Instantiated AppUIKitBridge", v5, 2u);
    MEMORY[0x230FB6730](v5, -1, -1);
  }

  return v0;
}

uint64_t sub_22F3A1534()
{
  return UIView.bridge.getter();
}

uint64_t UIView.bridge.getter()
{
  if (qword_26AEBA9F8 != -1) {
    swift_once();
  }
  sub_22F3A36A8((unint64_t *)&unk_26AEBA960, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  return swift_retain();
}

uint64_t sub_22F3A1618()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  swift_beginAccess();
  return MEMORY[0x230FB67E0](v1);
}

uint64_t sub_22F3A1664()
{
  return UIView.viewProvider.getter();
}

uint64_t UIView.setEntityProvider<A>(_:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = (uint64_t *)(v9 - v8);
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
  uint64_t v30 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16);
  v30(boxed_opaque_existential_1, a1, a2);
  objc_msgSend(v2, sel_bounds);
  uint64_t v14 = sub_22F3BD358();
  swift_allocObject();
  uint64_t v31 = sub_22F3BD348();
  if (qword_26AEBAA10 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_22F3BD548();
  __swift_project_value_buffer(v15, (uint64_t)qword_26AEBAAD0);
  id v16 = v2;
  uint64_t v17 = sub_22F3BD528();
  os_log_type_t v18 = sub_22F3BD838();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v29 = a1;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v32[0] = v28;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v27 = v19;
    uint64_t v20 = a2;
    id v21 = objc_msgSend(v16, sel_description);
    uint64_t v22 = sub_22F3BD648();
    unint64_t v24 = v23;

    a2 = v20;
    sub_22F3A1B4C(v22, v24, v32);
    sub_22F3BD908();

    a1 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22F39E000, v17, v18, "Attaching custom entity provider to view: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FB6730](v28, -1, -1);
    MEMORY[0x230FB6730](v27, -1, -1);
  }
  else
  {
  }
  uint64_t v33 = v14;
  uint64_t v25 = (void (*)(uint64_t))MEMORY[0x263EFBF48];
  uint64_t v34 = sub_22F3A36A8(&qword_26AEBA838, MEMORY[0x263EFBF48]);
  uint64_t v35 = sub_22F3A36A8(&qword_26AEBA848, v25);
  v32[0] = v31;
  swift_retain();
  sub_22F3BD8D8();
  sub_22F3BCF88();
  sub_22F3BCF68();
  sub_22F3BD368();
  v30(v10, a1, a2);
  sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
  swift_unknownObjectRetain();
  sub_22F3BD378();
  sub_22F3BCF78();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_22F3A1B4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22F3A1C7C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22F3A1C20((uint64_t)v12, *a3);
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
      sub_22F3A1C20((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22F3A1C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22F3A1C7C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_22F3ABDAC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22F3BD918();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_22F3ABE84(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_22F3BD9A8();
    if (!v8)
    {
      uint64_t result = sub_22F3BDA08();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void sub_22F3A1E34()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = v0;
  uint64_t v2 = sub_22F3BD088();
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  OUTLINED_FUNCTION_7_2();
  uint64_t v10 = MEMORY[0x230FB67E0](v9);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    if (qword_26AEBA9F8 != -1) {
      swift_once();
    }
    uint64_t v12 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BE550) + 48);
    uint64_t v13 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode;
    sub_22F3BCDF8();
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v8, v13);
    swift_retain();
    *(void *)uint64_t v12 = objc_msgSend(v11, sel_hash);
    *(unsigned char *)(v12 + 8) = 0;
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x263EFB8F8], v2);
    type metadata accessor for AppUIKitBridge();
    sub_22F3A2FC4();
    sub_22F3A2F7C((unint64_t *)&unk_26AEBA960, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
    sub_22F3A2F7C((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F7C((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F7C(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F7C((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BCEA8();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  }
  sub_22F3A2108(0);
  OUTLINED_FUNCTION_10();
}

void sub_22F3A2108(void *a1)
{
}

void UIAppIntentInteraction.init<A>(intent:perform:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v3 = sub_22F3BCDF8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = &v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent];
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0;
  uint64_t v11 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
  uint64_t v12 = sub_22F3BD288();
  OUTLINED_FUNCTION_23_0(v11, v13, v14, v12);
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] = 0;
  uint64_t v15 = v0;
  sub_22F3A271C(v2);
  sub_22F3BCDD8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(&v15[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode], v9, v3);
  sub_22F3BCF88();
  sub_22F3BCF68();
  sub_22F3BCDE8();
  sub_22F3BCF58();
  swift_release();

  v16.receiver = v15;
  v16.super_class = (Class)type metadata accessor for UIAppIntentInteraction();
  objc_msgSendSuper2(&v16, sel_init);
  sub_22F3A272C(v2);
  OUTLINED_FUNCTION_10();
}

void sub_22F3A2310()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22F3BCDF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22F3BD088();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  swift_beginAccess();
  uint64_t v11 = (void *)MEMORY[0x230FB67E0](v10);

  if (v11 && (*(unsigned char *)(v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion) & 1) == 0)
  {
    uint64_t v24 = v7;
    uint64_t v12 = MEMORY[0x230FB67E0](v10);
    if (v12
      && (uint64_t v13 = (void *)v12,
          uint64_t v25 = v12,
          sub_22F3A2FC4(),
          sub_22F3A2F7C((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4),
          uint64_t v14 = (void *)sub_22F3BD2C8(),
          v13,
          v14))
    {
      uint64_t v15 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BE550) + 48)];
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode, v2);
      objc_super v16 = (void *)MEMORY[0x230FB67E0](v10);
      uint64_t v25 = (uint64_t)v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE560);
      sub_22F3A2F7C((unint64_t *)&unk_2686BE568, (void (*)(uint64_t))sub_22F3A2FC4);
      uint64_t v17 = sub_22F3BD8F8();

      *(void *)uint64_t v15 = v17;
      v15[8] = 0;
      uint64_t v18 = v24;
      (*(void (**)(char *, void, uint64_t))(v24 + 104))(v9, *MEMORY[0x263EFB8F8], v6);
      sub_22F3BD208();

      (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v6);
    }
    else
    {
      sub_22F3BD238();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode, v2);
      uint64_t v19 = (void *)MEMORY[0x230FB67E0](v10);
      uint64_t v25 = (uint64_t)v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE560);
      sub_22F3A2F7C((unint64_t *)&unk_2686BE568, (void (*)(uint64_t))sub_22F3A2FC4);
      sub_22F3BD8F8();

      uint64_t v20 = (void *)sub_22F3BD228();
      uint64_t v21 = MEMORY[0x230FB67E0](v10);
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        UIView.updateViewProvider(with:)(v20);
      }
    }
  }
}

uint64_t type metadata accessor for UIAppIntentInteraction()
{
  uint64_t result = qword_26AEBA878;
  if (!qword_26AEBA878) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F3A271C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22F3A272C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_22F3A273C()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v72 = sub_22F3BD288();
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v66 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE548);
  uint64_t v12 = OUTLINED_FUNCTION_24(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v66 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE540);
  uint64_t v15 = OUTLINED_FUNCTION_24(v14);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (long long *)((char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  uint64_t v67 = (uint64_t)&v66 - v19;
  sub_22F3BCE38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v74 = v20;
  uint64_t v75 = v21;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_3_1();
  uint64_t v73 = v22;
  uint64_t v76 = sub_22F3BD088();
  OUTLINED_FUNCTION_0_4();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_6_0();
  uint64_t v28 = v27 - v26;
  id v29 = v2;
  sub_22F3A2108(v2);
  if (!v2)
  {
    if ((v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] & 1) == 0) {
      goto LABEL_17;
    }
    v50 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v51 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
    OUTLINED_FUNCTION_7_2();
    sub_22F3BB21C(v51, (uint64_t)v18, &qword_2686BE540);
    uint64_t v52 = v72;
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v72) != 1)
    {
      uint64_t v55 = v4;
      v56 = *(void (**)(char *, long long *, uint64_t))(v4 + 32);
      v57 = v10;
      v56(v10, v18, v52);
      uint64_t v58 = sub_22F3BD788();
      uint64_t v59 = v66;
      OUTLINED_FUNCTION_23_0(v66, v60, v61, v58);
      (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v50, v57, v52);
      sub_22F3BD768();
      uint64_t v62 = sub_22F3BD758();
      unint64_t v63 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
      uint64_t v64 = swift_allocObject();
      uint64_t v65 = MEMORY[0x263F8F500];
      *(void *)(v64 + 16) = v62;
      *(void *)(v64 + 24) = v65;
      v56((char *)(v64 + v63), (long long *)v50, v52);
      sub_22F3BA73C(v59, (uint64_t)&unk_2686BEBA0, v64);
      swift_release();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v52);
      goto LABEL_17;
    }
    v53 = &qword_2686BE540;
    v54 = v18;
    goto LABEL_16;
  }
  uint64_t v30 = qword_26AEBA9F8;
  id v31 = v29;
  if (v30 != -1) {
    swift_once();
  }
  uint64_t v70 = qword_26AEBAAC8;
  uint64_t v32 = v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BE550) + 48);
  v71 = v0;
  sub_22F3BCDF8();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_14_1();
  v33();
  swift_retain();
  *(void *)uint64_t v32 = objc_msgSend(v31, sel_hash);
  *(unsigned char *)(v32 + 8) = 0;
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v28, *MEMORY[0x263EFB8F8], v76);
  v79[0] = MEMORY[0x263F8EE78];
  sub_22F3A2F7C(&qword_26AEBA900, MEMORY[0x263EFB6A0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
  sub_22F3A3004();
  sub_22F3BD938();
  uint64_t v69 = type metadata accessor for AppUIKitBridge();
  unint64_t v68 = sub_22F3A2FC4();
  sub_22F3A2F7C((unint64_t *)&unk_26AEBA960, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  sub_22F3A2F7C((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3A2F7C((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3A2F7C(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3A2F7C((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3BCE88();

  swift_release();
  uint64_t v34 = v71;
  OUTLINED_FUNCTION_4();
  v35();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, v76);
  if (v34[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] == 1)
  {
    id v36 = v31;
    id v37 = objc_msgSend(v36, sel_window);

    if (!v37)
    {

      goto LABEL_17;
    }
    uint64_t v38 = &v34[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
    OUTLINED_FUNCTION_7_2();
    uint64_t v39 = (uint64_t)v38;
    uint64_t v40 = v67;
    sub_22F3BB21C(v39, v67, &qword_2686BE540);
    if (__swift_getEnumTagSinglePayload(v40, 1, v72) == 1)
    {
      sub_22F3A36F0(v40, &qword_2686BE540);
      uint64_t v41 = (uint64_t)&v34[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent];
      OUTLINED_FUNCTION_7_2();
      sub_22F3BB21C(v41, (uint64_t)&v77, &qword_2686BE530);
      if (v78)
      {
        sub_22F3AA744(&v77, (uint64_t)v79);
        uint64_t v42 = sub_22F3BD788();
        uint64_t v43 = v66;
        OUTLINED_FUNCTION_23_0(v66, v44, v45, v42);
        sub_22F3AB5C8((uint64_t)v79, (uint64_t)&v77);
        sub_22F3BD768();
        objc_super v46 = v34;
        uint64_t v47 = sub_22F3BD758();
        v48 = (void *)swift_allocObject();
        uint64_t v49 = MEMORY[0x263F8F500];
        v48[2] = v47;
        v48[3] = v49;
        v48[4] = v46;
        sub_22F3AA744(&v77, (uint64_t)(v48 + 5));
        sub_22F3BA73C(v43, (uint64_t)&unk_2686BEBB8, (uint64_t)v48);
        swift_release();

        __swift_destroy_boxed_opaque_existential_0((uint64_t)v79);
        goto LABEL_17;
      }

      v53 = &qword_2686BE530;
      v54 = &v77;
    }
    else
    {

      v53 = &qword_2686BE540;
      v54 = (long long *)v40;
    }
LABEL_16:
    sub_22F3A36F0((uint64_t)v54, v53);
  }
LABEL_17:
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22F3A2F34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22F3A2F7C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22F3A2FC4()
{
  unint64_t result = qword_26AEBA9A0;
  if (!qword_26AEBA9A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AEBA9A0);
  }
  return result;
}

unint64_t sub_22F3A3004()
{
  unint64_t result = qword_26AEBA920;
  if (!qword_26AEBA920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AEBA918);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEBA920);
  }
  return result;
}

uint64_t type metadata accessor for AppUIKitBridge()
{
  return self;
}

uint64_t sub_22F3A307C(void *a1)
{
  return UIView.updateViewProvider(with:)(a1);
}

uint64_t UIView.updateViewProvider(with:)(void *a1)
{
  sub_22F3BD238();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263EFBDA0];
  sub_22F3A36A8(&qword_26AEBA908, MEMORY[0x263EFBDA0]);
  sub_22F3A36A8(&qword_26AEBA910, v2);
  id v3 = a1;
  return sub_22F3BD8D8();
}

void UIView.appEntityIdentifier.setter()
{
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v2;
  uint64_t v4 = sub_22F3BCE38();
  OUTLINED_FUNCTION_0_1();
  uint64_t v26 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA930);
  uint64_t v8 = OUTLINED_FUNCTION_24(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA840);
  uint64_t v10 = OUTLINED_FUNCTION_24(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_6_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_22F3BD108();
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_6_0();
  uint64_t v20 = v19 - v18;
  sub_22F3A3740(v3, v13, &qword_26AEBA840);
  if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1)
  {
    sub_22F3A36F0(v13, &qword_26AEBA840);
    sub_22F3A2FC4();
    sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2D8();
    sub_22F3A36F0(v3, &qword_26AEBA840);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v20, v13, v14);
    uint64_t v21 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA898) + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v20, v14);
    uint64_t v22 = sub_22F3BD1C8();
    __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
    uint64_t v23 = *MEMORY[0x263EFB8E8];
    uint64_t v24 = sub_22F3BD088();
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 104))(v1, v23, v24);
    __swift_storeEnumTagSinglePayload(v1, 0, 1, v24);
    sub_22F3A36A8(&qword_26AEBA900, MEMORY[0x263EFB6A0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
    sub_22F3A3004();
    sub_22F3BD938();
    sub_22F3A2FC4();
    sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2A8();
    sub_22F3A36F0(v3, &qword_26AEBA840);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v0, v4);
    sub_22F3A36F0(v1, &qword_26AEBA930);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  }
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22F3A36A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22F3A36F0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4();
  v3();
  return a1;
}

uint64_t sub_22F3A3740(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
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

id OUTLINED_FUNCTION_0_0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  return objc_msgSend(v12, (SEL)(v13 + 2906), a1, 1, &a12);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return MEMORY[0x270F9DCD8](0, v0);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_22F3BD938();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_22F3BD2D8();
}

void OUTLINED_FUNCTION_8()
{
  JUMPOUT(0x230FB6730);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  return a1 - 8;
}

__n128 OUTLINED_FUNCTION_1_0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(int a1@<W8>)
{
  uint64_t result = **v2;
  *(void *)(v1 + a1) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return 0x696669746E656469;
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + a1;
  *(void *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 8) = 1;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_22F3BD808();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t OUTLINED_FUNCTION_8_0()
{
  return 0xD000000000000012;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(v3, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(v3 + *(int *)(a3 + 20) + 24);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_22F3BD488();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0 + 8;
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

void __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_22F3BD488();
  OUTLINED_FUNCTION_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  }
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t sub_22F3A4194(uint64_t a1)
{
  return sub_22F3A09B8(a1, qword_26AEBAAD0, MEMORY[0x263F51860]);
}

uint64_t sub_22F3A41A8(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_8_2();
  (*v3)(a2);
  return a2;
}

uint64_t sub_22F3A4208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3A4270()
{
  uint64_t result = sub_22F3A13D0();
  qword_26AEBAAC8 = result;
  return result;
}

double sub_22F3A4290()
{
  qword_26AEBAA80 = 0;
  double result = 0.0;
  xmmword_26AEBAA60 = 0u;
  *(_OWORD *)algn_26AEBAA70 = 0u;
  return result;
}

uint64_t type metadata accessor for AppEntityViewAnnotation()
{
  uint64_t result = qword_26AEBA8D8;
  if (!qword_26AEBA8D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F3A42F0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for LNStructuredDataRepresentations(uint64_t a1)
{
}

void type metadata accessor for Event(uint64_t a1)
{
}

void type metadata accessor for LNSymbolImagePlatform(uint64_t a1)
{
}

void sub_22F3A4374(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22F3A43BC()
{
  return sub_22F3A4754(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_22F3A43F0(uint64_t a1, id *a2)
{
  uint64_t result = sub_22F3BD628();
  *a2 = 0;
  return result;
}

uint64_t sub_22F3A446C(uint64_t a1, id *a2)
{
  char v3 = sub_22F3BD638();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22F3A44EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3A4514();
  *a1 = result;
  return result;
}

uint64_t sub_22F3A4514()
{
  sub_22F3BD648();
  uint64_t v0 = sub_22F3BD618();
  swift_bridgeObjectRelease();
  return v0;
}

void *sub_22F3A454C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_22F3A455C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22F3A4568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22F3BD618();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22F3A45B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3A45DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22F3A45E0(uint64_t a1)
{
  uint64_t v2 = sub_22F3A46E0(&qword_2686BE5B0);
  uint64_t v3 = sub_22F3A46E0(&qword_2686BE5B8);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22F3A4678()
{
  return sub_22F3A46E0(&qword_2686BE598);
}

uint64_t sub_22F3A46AC()
{
  return sub_22F3A46E0(&qword_2686BE5A0);
}

uint64_t sub_22F3A46E0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LNSymbolImagePlatform(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22F3A4724()
{
  return sub_22F3A4754(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_22F3A4754(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_22F3BD648();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22F3A4794()
{
  return sub_22F3A479C();
}

uint64_t sub_22F3A479C()
{
  sub_22F3BD648();
  sub_22F3BD668();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22F3A47F0()
{
  return sub_22F3A47F8();
}

uint64_t sub_22F3A47F8()
{
  sub_22F3BD648();
  sub_22F3BDAF8();
  sub_22F3BD668();
  uint64_t v0 = sub_22F3BDB18();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22F3A486C()
{
  return sub_22F3B0A00();
}

uint64_t sub_22F3A4878()
{
  return sub_22F3A46E0(&qword_2686BE5A8);
}

id static ShareableEntity<>.configuration(from:)()
{
  return sub_22F3A4AF8();
}

char *keypath_get_selector_itemProvidersForActivityItemsConfiguration()
{
  return sel_itemProvidersForActivityItemsConfiguration;
}

void sub_22F3A49AC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_itemProvidersForActivityItemsConfiguration);
  sub_22F3A5168(0, (unint64_t *)&qword_2686BE698);
  uint64_t v4 = sub_22F3BD6D8();

  *a2 = v4;
}

uint64_t sub_22F3A4A2C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_22F3A4A88()
{
  return sub_22F3A4A2C();
}

unint64_t sub_22F3A4AA4()
{
  unint64_t result = qword_2686BE690;
  if (!qword_2686BE690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2686BE688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE690);
  }
  return result;
}

id sub_22F3A4AF8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_22F3A5168(0, (unint64_t *)&qword_2686BE698);
  uint64_t v1 = (void *)sub_22F3BD6C8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithItemProviders_, v1);

  return v2;
}

id static ShareableEntity.configuration(from:)()
{
  sub_22F3A5168(0, &qword_2686BE680);
  swift_getKeyPath();
  OUTLINED_FUNCTION_3_0();
  sub_22F3A5168(0, (unint64_t *)&qword_2686BE698);
  swift_getWitnessTable();
  OUTLINED_FUNCTION_0();
  sub_22F3A4CF4(v0, v1, v2, v3, v4, v5, v6, v7);
  swift_release();
  return sub_22F3A4AF8();
}

uint64_t sub_22F3A4C80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3BD068();
  *a1 = result;
  return result;
}

uint64_t sub_22F3A4CC8()
{
  return swift_getAtKeyPath();
}

uint64_t sub_22F3A4CF4(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  objc_super v46 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v31 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = sub_22F3BD7D8();
  if (!v20) {
    return sub_22F3BD708();
  }
  uint64_t v21 = v20;
  uint64_t v49 = sub_22F3BD9D8();
  uint64_t v38 = sub_22F3BD9E8();
  sub_22F3BD9B8();
  uint64_t v42 = a6;
  uint64_t result = sub_22F3BD7C8();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v40 = (void (**)(char *))(v39 + 2);
    uint64_t v41 = v14;
    ++v39;
    while (1)
    {
      uint64_t v23 = (void (*)(char *, void))sub_22F3BD7F8();
      uint64_t v24 = v12;
      uint64_t v25 = v12;
      uint64_t v26 = AssociatedTypeWitness;
      (*v40)(v24);
      v23(v48, 0);
      uint64_t v27 = v47;
      v44(v25, v46);
      if (v27) {
        break;
      }
      uint64_t v47 = 0;
      (*v39)(v25, v26);
      sub_22F3BD9C8();
      sub_22F3BD7E8();
      --v21;
      uint64_t v12 = v25;
      if (!v21)
      {
        uint64_t v28 = v36;
        uint64_t v29 = v37;
        uint64_t v30 = v32;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v32, v19, v37);
        sub_22F3BD968();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        return v49;
      }
    }
    (*v39)(v25, v26);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v46, v34);
  }
  return result;
}

uint64_t sub_22F3A5168(uint64_t a1, unint64_t *a2)
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

uint64_t DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)@<X0>(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v36 = a1;
  if (a2)
  {
    self;
    id v8 = a2;
    id v16 = OUTLINED_FUNCTION_0_0((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v35, v36, v37, 0);
    id v17 = v38;
    if (v16)
    {
      sub_22F3BD458();

      if (!a3) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = (void *)sub_22F3BD3F8();

      swift_willThrow();
      if (!a3) {
        goto LABEL_11;
      }
    }
  }
  else if (!a3)
  {
    goto LABEL_11;
  }
  self;
  id v20 = a3;
  id v28 = OUTLINED_FUNCTION_0_0((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27, v35, v36, v37, 0);
  id v29 = v39;
  if (v28)
  {
    sub_22F3BD458();
  }
  else
  {
    uint64_t v30 = v29;
    uint64_t v31 = (void *)sub_22F3BD3F8();

    swift_willThrow();
  }
LABEL_11:
  type metadata accessor for LNSymbolImagePlatform(0);
  uint64_t v32 = @"UIKit";
  sub_22F3BD198();

  uint64_t v33 = sub_22F3BD1A8();
  return __swift_storeEnumTagSinglePayload(a4, 0, 1, v33);
}

uint64_t sub_22F3A53A4(uint64_t a1)
{
  uint64_t v2 = sub_22F3BCE38();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_22F3A54EC((uint64_t)v4);
}

uint64_t sub_22F3A5470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_state;
  swift_beginAccess();
  sub_22F3BCE38();
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_22F3A54EC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_state;
  swift_beginAccess();
  sub_22F3BCE38();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  return swift_endAccess();
}

uint64_t (*sub_22F3A5570())()
{
  return j__swift_endAccess;
}

id AppEntityViewAnnotation.__allocating_init<A>(entity:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return AppEntityViewAnnotation.init<A>(entity:state:)(a1, a2, a3, a4);
}

id AppEntityViewAnnotation.init<A>(entity:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_22F3BD1C8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v34 = v9;
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v12 = v11 - v10;
  sub_22F3BD108();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_6_0();
  int v14 = v4;
  sub_22F3BCEE8();
  int v15 = (uint64_t *)&v14[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_data];
  v15[3] = a3;
  v15[4] = a4;
  __swift_allocate_boxed_opaque_existential_1(v15);
  OUTLINED_FUNCTION_1();
  uint64_t v17 = v16;
  uint64_t v32 = a1;
  OUTLINED_FUNCTION_5();
  v18();
  uint64_t v19 = *MEMORY[0x263EFB8F0];
  sub_22F3BD088();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t *, uint64_t))(v20 + 104))(v15, v19);
  uint64_t v21 = sub_22F3BCE38();
  OUTLINED_FUNCTION_1();
  uint64_t v23 = v22;
  OUTLINED_FUNCTION_5();
  v24();
  *(_DWORD *)&v14[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_interactionId] = sub_22F3BD0D8();
  *(void *)&v14[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_structuredDataRepresentations] = sub_22F3BD0E8();
  sub_22F3BD2F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(&v14[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_displayRepresentation], v12, v35);
  uint64_t v25 = sub_22F3BD0C8();
  uint64_t v27 = v26;
  OUTLINED_FUNCTION_4();
  v28();
  id v29 = (uint64_t *)&v14[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_entityDescription];
  *id v29 = v25;
  v29[1] = v27;

  v36.receiver = v14;
  v36.super_class = (Class)type metadata accessor for AppEntityViewAnnotation();
  id v30 = objc_msgSendSuper2(&v36, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(a2, v21);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v32, a3);
  return v30;
}

id AppEntityViewAnnotation.__allocating_init<A>(entityType:identifier:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return AppEntityViewAnnotation.init<A>(entityType:identifier:state:)(a1, a2, a3);
}

id AppEntityViewAnnotation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AppEntityViewAnnotation.init()()
{
}

id AppEntityViewAnnotation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppEntityViewAnnotation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22F3A59F0@<X0>(uint64_t a1@<X8>)
{
  return sub_22F3A5470(a1);
}

uint64_t sub_22F3A5A18()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t method lookup function for AppEntityViewAnnotation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppEntityViewAnnotation);
}

uint64_t dispatch thunk of AppEntityViewAnnotation.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.state.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.state.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.__allocating_init<A>(entity:state:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.__allocating_init<A>(entityType:identifier:state:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t ShortcutsUIButton.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  swift_beginAccess();
  sub_22F3BD508();
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_22F3A5B78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  swift_beginAccess();
  uint64_t v4 = sub_22F3BD508();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_22F3A5C00(uint64_t a1)
{
  uint64_t v2 = sub_22F3BD508();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return ShortcutsUIButton.style.setter((uint64_t)v4);
}

uint64_t ShortcutsUIButton.style.setter(uint64_t a1)
{
  uint64_t v4 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  OUTLINED_FUNCTION_3();
  sub_22F3BD508();
  OUTLINED_FUNCTION_0_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v4, a1, v2);
  swift_endAccess();
  sub_22F3A5D58();
  uint64_t v6 = OUTLINED_FUNCTION_1_1();
  return v7(v6);
}

void sub_22F3A5D58()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22F3BD508();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22F3BD4C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v16 = OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView], sel_removeFromSuperview);
  *(void *)(swift_allocObject() + 16) = v1;
  uint64_t v11 = v1;
  sub_22F3BD4B8();
  uint64_t v12 = &v11[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v12, v2);
  sub_22F3A6A7C();
  sub_22F3BD5A8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BE6D0));
  int v14 = (void *)sub_22F3BD588();
  objc_msgSend(v11, sel_addSubview_, v14);
  objc_msgSend(v14, sel_setAutoresizingMask_, 18);
  objc_msgSend(v11, sel_bounds);
  objc_msgSend(v14, sel_setFrame_);
  int v15 = *(void **)&v1[v16];
  *(void *)&v1[v16] = v14;
}

void (*ShortcutsUIButton.style.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22F3A6098;
}

void sub_22F3A6098(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_22F3A5D58();
  }
}

char *ShortcutsUIButton.__allocating_init(style:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return ShortcutsUIButton.init(style:)(a1);
}

char *ShortcutsUIButton.init(style:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  uint64_t v5 = v1;
  sub_22F3BD4F8();
  *(void *)&v5[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView] = 0;
  uint64_t v6 = &v5[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;

  v15.receiver = v5;
  v15.super_class = ObjectType;
  uint64_t v7 = (char *)objc_msgSendSuper2(&v15, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = &v7[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  OUTLINED_FUNCTION_3();
  sub_22F3BD508();
  OUTLINED_FUNCTION_0_2();
  uint64_t v10 = *(void (**)(char *, uint64_t, char *))(v9 + 24);
  uint64_t v11 = v7;
  v10(v8, a1, v4);
  swift_endAccess();
  sub_22F3A5D58();

  uint64_t v12 = OUTLINED_FUNCTION_1_1();
  v13(v12);
  return v11;
}

uint64_t sub_22F3A6210(void *a1)
{
  swift_getObjectType();
  id v3 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  uint64_t v4 = v1;
  sub_22F3BD4F8();
  uint64_t v5 = OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView;
  *(void *)&v4[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView] = 0;
  uint64_t v6 = (uint64_t *)&v4[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler];
  *uint64_t v6 = 0;
  v6[1] = 0;

  sub_22F3BD508();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v7 + 8))(v3);

  sub_22F3A272C(*v6);
  swift_deallocPartialClassInstance();
  return 0;
}

CGSize __swiftcall ShortcutsUIButton.sizeThatFits(_:)(CGSize a1)
{
  double height = a1.height;
  double width = a1.width;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView];
  if (v4)
  {
    objc_msgSend(v4, sel_sizeThatFits_, a1.width, a1.height);
  }
  else
  {
    v8.receiver = v1;
    v8.super_class = (Class)swift_getObjectType();
    objc_msgSendSuper2(&v8, sel_sizeThatFits_, width, height);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

uint64_t ShortcutsUIButton.addTarget(_:action:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22F3A6540(a1, (uint64_t)v10);
  uint64_t v6 = swift_allocObject();
  sub_22F3A65E8((uint64_t)v10, v6 + 16);
  *(void *)(v6 + 48) = a3;
  *(void *)(v6 + 56) = a2;
  uint64_t v7 = (uint64_t (**)())(v3 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);
  *uint64_t v7 = sub_22F3A6650;
  v7[1] = (uint64_t (*)())v6;
  return sub_22F3A272C(v8);
}

uint64_t sub_22F3A649C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22F3A6540(a1, (uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA8D0);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    if (a2 == 64)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_performSelector_, a3);
      id v6 = v7;
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22F3A6540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3A65A8()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22F3A65E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3A6650()
{
  return sub_22F3A649C(v0 + 16, *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_22F3A66E4(uint64_t result)
{
  uint64_t v1 = *(void (**)(uint64_t))(result + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_22F3A272C((uint64_t)v1);
  }
  return result;
}

id ShortcutsUIButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ShortcutsUIButton.init(frame:)()
{
}

id ShortcutsUIButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22F3A68BC()
{
  return type metadata accessor for ShortcutsUIButton();
}

uint64_t type metadata accessor for ShortcutsUIButton()
{
  uint64_t result = qword_2686BE6B0;
  if (!qword_2686BE6B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F3A690C()
{
  uint64_t result = sub_22F3BD508();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ShortcutsUIButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ShortcutsUIButton);
}

uint64_t dispatch thunk of ShortcutsUIButton.__allocating_init(style:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_22F3A69DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA8D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F3A6A3C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F3A6A74()
{
  return sub_22F3A66E4(*(void *)(v0 + 16));
}

unint64_t sub_22F3A6A7C()
{
  unint64_t result = qword_2686BE6C8;
  if (!qword_2686BE6C8)
  {
    sub_22F3BD4C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE6C8);
  }
  return result;
}

uint64_t sub_22F3A6ACC@<X0>(uint64_t a1@<X8>)
{
  return UITableViewAppIntentsDataSource.tableView(_:appEntityIdentifierForRowAt:)(a1);
}

uint64_t UITableViewAppIntentsDataSource.tableView(_:appEntityIdentifierForRowAt:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22F3BD108();

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t UITableView.appIntentsDataSource.getter()
{
  return 0;
}

uint64_t sub_22F3A6B38()
{
  uint64_t v0 = swift_unknownObjectRetain();
  return UITableView.appIntentsDataSource.setter(v0);
}

uint64_t (*UITableView.appIntentsDataSource.modify(void *a1))()
{
  *a1 = 0;
  a1[1] = 0;
  return sub_22F3A6B80;
}

uint64_t sub_22F3A6B80()
{
  return swift_unknownObjectRelease();
}

void sub_22F3A6B88(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t dispatch thunk of UITableViewAppIntentsDataSource.tableView(_:appEntityIdentifierForRowAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void UISceneConnectionOptions._appIntentExecution.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_12();
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v26 = type metadata accessor for _AppIntentExecution(0);
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v27);
  uint64_t v28 = OUTLINED_FUNCTION_4_0();
  uint64_t v29 = type metadata accessor for _AppIntentExecution.Container(v28);
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_15();
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&a9 - v32;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE520);
  uint64_t v35 = OUTLINED_FUNCTION_24(v34);
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  id v38 = (char *)&a9 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&a9 - v39;
  sub_22F3A8EFC();
  sub_22F3BD8B8();
  sub_22F3A9074((uint64_t)v40, (uint64_t)v38, &qword_2686BE520);
  uint64_t v41 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v29) != 1)
  {
    sub_22F3A9014((uint64_t)v38, (uint64_t)v33, (void (*)(void))type metadata accessor for _AppIntentExecution.Container);
    sub_22F3A8F48((uint64_t)v33, v21);
    uint64_t v42 = v20 + *(int *)(v26 + 20);
    sub_22F3BD488();
    *(_OWORD *)uint64_t v42 = 0u;
    *(_OWORD *)(v42 + 16) = 0u;
    *(void *)(v42 + 32) = 0;
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(uint64_t, uint64_t))(v43 + 32))(v20, v21);
    uint64_t v44 = v21 + *(int *)(v29 + 20);
    sub_22F3A36F0(v42, &qword_2686BE530);
    sub_22F3A8FAC(v44, v42);
    sub_22F3A9014(v20, v25, (void (*)(void))type metadata accessor for _AppIntentExecution);
    sub_22F3AA41C((uint64_t)v33, (void (*)(void))type metadata accessor for _AppIntentExecution.Container);
    uint64_t v41 = 0;
  }
  __swift_storeEnumTagSinglePayload(v25, v41, 1, v26);
  sub_22F3A36F0((uint64_t)v40, &qword_2686BE520);
  OUTLINED_FUNCTION_10();
}

void _AppIntentExecution.callAsFunction<A>(for:handler:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v28 = v4;
  uint64_t v29 = v3;
  v26[1] = v5;
  uint64_t v27 = sub_22F3BCD98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - v9;
  uint64_t v11 = sub_22F3BD8E8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v26 - v15;
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = v17;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)v26 - v23;
  uint64_t v25 = v0 + *(int *)(type metadata accessor for _AppIntentExecution(0) + 20);
  sub_22F3A9074(v25, (uint64_t)&v30, &qword_2686BE530);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE530);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v2);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v16, v2);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v22, v24, v2);
    sub_22F3BCD78();
    v29(v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v27);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v2);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v2);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  }
  OUTLINED_FUNCTION_10();
}

uint64_t _AppIntentExecution.withExtendedNavigation(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE548);
  uint64_t v6 = OUTLINED_FUNCTION_24(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6();
  if (qword_2686BE578 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_22F3BD548();
  __swift_project_value_buffer(v7, (uint64_t)qword_2686BFAD8);
  uint64_t v8 = sub_22F3BD528();
  os_log_type_t v9 = sub_22F3BD838();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_22F39E000, v8, v9, "Client requested extended navigation time", v10, 2u);
    MEMORY[0x230FB6730](v10, -1, -1);
  }

  sub_22F3BCE78();
  sub_22F3BCE58();
  uint64_t v11 = sub_22F3BD788();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  void v12[3] = 0;
  v12[4] = a1;
  v12[5] = a2;
  swift_retain();
  sub_22F3A7300(v2, (uint64_t)&unk_2686BE6E8, (uint64_t)v12);
  sub_22F3BCE48();
  swift_release();
  return swift_release();
}

uint64_t sub_22F3A7234(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_22F3AAB24;
  return v7();
}

uint64_t sub_22F3A7300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22F3BD788();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22F3A36F0(a1, &qword_2686BE548);
  }
  else
  {
    sub_22F3BD778();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22F3BD738();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t static NSPredicate.matchingAnyExecution<A>(of:)()
{
  sub_22F3A5168(0, &qword_2686BE6F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6F8);
  uint64_t v0 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v0 + 16) = xmmword_22F3BF300;
  uint64_t v1 = sub_22F3BCF28();
  uint64_t v3 = v2;
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 64) = sub_22F3A9B10();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  return OUTLINED_FUNCTION_14();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_22F3A5168(0, &qword_2686BE6F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6F8);
  uint64_t v0 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v0 + 16) = xmmword_22F3BF300;
  uint64_t v1 = sub_22F3BCF28();
  uint64_t v3 = v2;
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 64) = sub_22F3A9B10();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  return OUTLINED_FUNCTION_14();
}

id static NSPredicate.matching<A>(intent:)()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22F3BF310;
  sub_22F3A5168(0, &qword_2686BE6F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6F8);
  uint64_t v1 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v1 + 16) = xmmword_22F3BF300;
  uint64_t v2 = sub_22F3BCF28();
  uint64_t v4 = v3;
  *(void *)(v1 + 56) = MEMORY[0x263F8D310];
  *(void *)(v1 + 64) = sub_22F3A9B10();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  OUTLINED_FUNCTION_8_0();
  *(void *)(v0 + 32) = sub_22F3BD808();
  sub_22F3BD6E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE710);
  sub_22F3BCF08();
  swift_bridgeObjectRelease();
  sub_22F3A5168(0, &qword_2686BE718);
  return sub_22F3A7FC0(v0, (SEL *)&selRef_andPredicateWithSubpredicates_);
}

uint64_t sub_22F3A7738(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6F8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22F3BF300;
  swift_bridgeObjectRetain();
  sub_22F3BD678();
  sub_22F3BD678();
  sub_22F3A5168(0, &qword_2686BE6F0);
  sub_22F3BD678();
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 64) = sub_22F3A9B10();
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  return sub_22F3BD808();
}

id static NSPredicate.matching<A>(intent:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_0();
  sub_22F3BCD98();
  sub_22F3BCD88();
  id v7 = static NSPredicate.matching<A>(intent:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, a2);
  return v7;
}

void static NSPredicate.matchingAll<A, B>(intent:parameters:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v2;
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v26 = v6;
  if (v2 == 1)
  {
    OUTLINED_FUNCTION_17();
    uint64_t TupleTypeMetadata = OUTLINED_FUNCTION_21();
  }
  else
  {
    MEMORY[0x270FA5388](v1);
    OUTLINED_FUNCTION_11();
    if (v3)
    {
      unint64_t v8 = v26 & 0xFFFFFFFFFFFFFFFELL;
      os_log_type_t v9 = v0;
      uint64_t v10 = v3;
      do
      {
        v5 += 8;
        v8 += 8;
        sub_22F3BD0A8();
        *v9++ = sub_22F3BDB48();
        --v10;
      }
      while (v10);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v27 = TupleTypeMetadata;
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_22F3BF310;
  sub_22F3A5168(0, &qword_2686BE6F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6F8);
  uint64_t v15 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v15 + 16) = xmmword_22F3BF300;
  uint64_t v16 = sub_22F3BCF28();
  uint64_t v18 = v17;
  *(void *)(v15 + 56) = MEMORY[0x263F8D310];
  *(void *)(v15 + 64) = sub_22F3A9B10();
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v18;
  OUTLINED_FUNCTION_8_0();
  *(void *)(v14 + 32) = sub_22F3BD808();
  uint64_t v28 = v14;
  uint64_t v19 = sub_22F3BD6E8();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    uint64_t v20 = (int *)(v27 + 32);
    uint64_t v21 = &v28;
    uint64_t v22 = v3;
    do
    {
      if (v3 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v20;
      }
      OUTLINED_FUNCTION_9_0(v23);
      *v21++ = v24;
      swift_retain();
      v20 += 4;
      --v22;
    }
    while (v22);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE710);
  OUTLINED_FUNCTION_23();
  sub_22F3BCF18();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v5, v27);
  uint64_t v25 = v28;
  sub_22F3A5168(0, &qword_2686BE718);
  sub_22F3A7FC0(v25, (SEL *)&selRef_andPredicateWithSubpredicates_);
  OUTLINED_FUNCTION_10();
}

{
  sub_22F3A805C();
}

uint64_t sub_22F3A7BEC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_22F3BD6E8();
}

void static NSPredicate.matchingAny<A, B>(intent:parameters:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v2;
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v27 = v6;
  if (v2 == 1)
  {
    OUTLINED_FUNCTION_17();
    uint64_t TupleTypeMetadata = OUTLINED_FUNCTION_21();
  }
  else
  {
    MEMORY[0x270FA5388](v1);
    OUTLINED_FUNCTION_11();
    if (v3)
    {
      unint64_t v8 = v27 & 0xFFFFFFFFFFFFFFFELL;
      os_log_type_t v9 = v0;
      uint64_t v10 = v3;
      do
      {
        v5 += 8;
        v8 += 8;
        sub_22F3BD0A8();
        *v9++ = sub_22F3BDB48();
        --v10;
      }
      while (v10);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v28 = TupleTypeMetadata;
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_0();
  uint64_t v12 = sub_22F3A5168(0, &qword_2686BE6F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE6F8);
  uint64_t v13 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v13 + 16) = xmmword_22F3BF300;
  uint64_t v14 = sub_22F3BCF28();
  uint64_t v16 = v15;
  *(void *)(v13 + 56) = MEMORY[0x263F8D310];
  *(void *)(v13 + 64) = sub_22F3A9B10();
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  OUTLINED_FUNCTION_8_0();
  uint64_t v17 = (void *)v12;
  uint64_t v18 = sub_22F3BD808();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    uint64_t v19 = (int *)(v28 + 32);
    uint64_t v20 = v17;
    uint64_t v21 = v3;
    do
    {
      if (v3 == 1) {
        int v22 = 0;
      }
      else {
        int v22 = *v19;
      }
      OUTLINED_FUNCTION_9_0(v22);
      *v20++ = v23;
      swift_retain();
      v19 += 4;
      --v21;
    }
    while (v21);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE710);
  OUTLINED_FUNCTION_23();
  sub_22F3BCF18();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4();
  v24();
  sub_22F3A5168(0, &qword_2686BE718);
  id v25 = sub_22F3A7FC0(v30, (SEL *)&selRef_orPredicateWithSubpredicates_);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_22F3BF320;
  *(void *)(v26 + 32) = v18;
  *(void *)(v26 + 40) = v25;
  uint64_t v29 = v26;
  sub_22F3BD6E8();
  sub_22F3A7FC0(v29, (SEL *)&selRef_andPredicateWithSubpredicates_);
  OUTLINED_FUNCTION_10();
}

{
  sub_22F3A805C();
}

id sub_22F3A7FC0(uint64_t a1, SEL *a2)
{
  sub_22F3A5168(0, &qword_2686BE6F0);
  uint64_t v3 = (void *)sub_22F3BD6C8();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, v3);

  return v4;
}

void sub_22F3A805C()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v7 = 8 * v3;
  uint64_t v31 = v9;
  uint64_t v32 = v8;
  uint64_t v33 = v10;
  uint64_t v30 = v5;
  if (v3 == 1)
  {
    OUTLINED_FUNCTION_17();
    uint64_t TupleTypeMetadata = OUTLINED_FUNCTION_21();
  }
  else
  {
    uint64_t v34 = v29;
    MEMORY[0x270FA5388](v0);
    uint64_t v12 = v2;
    if (v4)
    {
      unint64_t v13 = v32 & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v14 = (void *)((char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v15 = v4;
      do
      {
        v6 += 8;
        v13 += 8;
        sub_22F3BD0A8();
        *v14++ = sub_22F3BDB48();
        --v15;
      }
      while (v15);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v2 = v12;
  }
  uint64_t v34 = (void *)TupleTypeMetadata;
  OUTLINED_FUNCTION_0_1();
  v29[2] = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5_0();
  v29[1] = v29;
  OUTLINED_FUNCTION_0_1();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_6();
  sub_22F3BCD98();
  uint64_t v21 = sub_22F3BCD88();
  v29[0] = v29;
  MEMORY[0x270FA5388](v21);
  int v22 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4)
  {
    uint64_t v23 = (int *)(v34 + 4);
    uint64_t v24 = v22;
    uint64_t v25 = v4;
    do
    {
      if (v4 == 1) {
        int v26 = 0;
      }
      else {
        int v26 = *v23;
      }
      OUTLINED_FUNCTION_9_0(v26);
      *v24++ = v27;
      swift_retain();
      v23 += 4;
      --v25;
    }
    while (v25);
  }
  v31(v6, v22, v4, v2, v30, v33, v32);
  (*(void (**)(unint64_t, uint64_t))(v19 + 8))(v6, v2);
  OUTLINED_FUNCTION_4();
  v28();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22F3A82D8()
{
  return sub_22F3BDB08();
}

uint64_t sub_22F3A8300()
{
  return sub_22F3BDB18();
}

uint64_t sub_22F3A8344()
{
  return 1;
}

uint64_t sub_22F3A8354()
{
  return sub_22F3BDB18();
}

BOOL sub_22F3A83A4()
{
  uint64_t v0 = sub_22F3BDA58();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_22F3A83FC()
{
  return sub_22F3BDB18();
}

uint64_t sub_22F3A8458()
{
  return sub_22F3BD668();
}

uint64_t sub_22F3A8478()
{
  return sub_22F3BDB18();
}

BOOL sub_22F3A84CC@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_22F3A83A4();
  *a1 = result;
  return result;
}

uint64_t sub_22F3A8504@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j__OUTLINED_FUNCTION_7();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22F3A8530@<X0>(BOOL *a1@<X8>)
{
  uint64_t result = sub_22F3A83EC();
  *a1 = result != 0;
  return result;
}

uint64_t sub_22F3A8560()
{
  return 0;
}

void sub_22F3A856C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22F3A8578(uint64_t a1)
{
  unint64_t v2 = sub_22F3AA4DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22F3A85B4(uint64_t a1)
{
  unint64_t v2 = sub_22F3AA4DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22F3A85F0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE7C0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22F3AA4DC();
  sub_22F3BDB38();
  sub_22F3BD488();
  sub_22F3AA324(&qword_2686BE7C8, MEMORY[0x263F07508]);
  sub_22F3BDA78();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v2);
}

uint64_t sub_22F3A8740@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = (void *)a2;
  sub_22F3BD488();
  OUTLINED_FUNCTION_0_1();
  uint64_t v43 = v7;
  uint64_t v44 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15();
  MEMORY[0x270FA5388](v8);
  uint64_t v45 = (char *)&v37 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE798);
  OUTLINED_FUNCTION_0_1();
  uint64_t v46 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_4_0();
  uint64_t v14 = type metadata accessor for _AppIntentExecution.Container(v13);
  uint64_t v15 = OUTLINED_FUNCTION_24(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6();
  uint64_t v17 = v3 + *(int *)(v16 + 28);
  *(void *)(v17 + 32) = 0;
  *(_OWORD *)uint64_t v17 = 0u;
  *(_OWORD *)(v17 + 16) = 0u;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22F3AA4DC();
  uint64_t v18 = v50;
  uint64_t v19 = (uint64_t)a1;
  sub_22F3BDB28();
  if (v18)
  {
LABEL_3:
    __swift_destroy_boxed_opaque_existential_0(v19);
    return sub_22F3A36F0(v17, &qword_2686BE530);
  }
  uint64_t v50 = v3;
  uint64_t v41 = v4;
  uint64_t v20 = v43;
  sub_22F3AA324(&qword_2686BE7A8, MEMORY[0x263F07508]);
  uint64_t v22 = v44;
  uint64_t v21 = v45;
  sub_22F3BDA68();
  sub_22F3BCE78();
  sub_22F3BCE58();
  sub_22F3BCE68();
  swift_release();
  if (!v48)
  {
    uint64_t v50 = v17;
    sub_22F3A36F0((uint64_t)&v47, &qword_2686BE530);
    if (qword_2686BE578 != -1) {
      swift_once();
    }
    uint64_t v42 = a1;
    uint64_t v40 = v10;
    uint64_t v26 = sub_22F3BD548();
    uint64_t v27 = (void (*)(uint64_t))__swift_project_value_buffer(v26, (uint64_t)qword_2686BFAD8);
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v41, v21, v22);
    uint64_t v28 = sub_22F3BD528();
    os_log_type_t v29 = sub_22F3BD828();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(void *)&v49[0] = v39;
      id v38 = v30;
      *(_DWORD *)uint64_t v30 = 136315138;
      sub_22F3AA324(&qword_2686BE7B8, MEMORY[0x263F07508]);
      uint64_t v31 = sub_22F3BDA88();
      uint64_t v27 = (void (*)(uint64_t))v32;
      *(void *)&long long v47 = sub_22F3A1B4C(v31, v32, (uint64_t *)v49);
      uint64_t v21 = v45;
      sub_22F3BD908();
      swift_bridgeObjectRelease();
      uint64_t v33 = OUTLINED_FUNCTION_13();
      v27(v33);
      uint64_t v34 = v38;
      _os_log_impl(&dword_22F39E000, v28, v29, "Failed to find contents for %s", v38, 0xCu);
      uint64_t v35 = v39;
      swift_arrayDestroy();
      MEMORY[0x230FB6730](v35, -1, -1);
      MEMORY[0x230FB6730](v34, -1, -1);
    }
    else
    {
      uint64_t v36 = OUTLINED_FUNCTION_13();
      v27(v36);
    }

    sub_22F3AA528();
    swift_allocError();
    swift_willThrow();
    ((void (*)(char *, uint64_t))v27)(v21, v22);
    uint64_t v19 = (uint64_t)v42;
    uint64_t v17 = v50;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v2, v40);
    goto LABEL_3;
  }
  OUTLINED_FUNCTION_4();
  v24();
  sub_22F3AA744(&v47, (uint64_t)v49);
  uint64_t v25 = v50;
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v50, v21, v22);
  sub_22F3A36F0(v17, &qword_2686BE530);
  sub_22F3AA744(v49, v17);
  sub_22F3A8F48(v25, (uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_22F3AA41C(v25, (void (*)(void))type metadata accessor for _AppIntentExecution.Container);
}

uint64_t sub_22F3A8C58()
{
  OUTLINED_FUNCTION_18();
  sub_22F3AA324(&qword_2686BE7D0, MEMORY[0x263F07508]);

  return sub_22F3BD608();
}

uint64_t sub_22F3A8CD4()
{
  return sub_22F3BDB18();
}

uint64_t sub_22F3A8D5C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22F3A8740(a1, a2);
}

uint64_t sub_22F3A8D74(void *a1)
{
  return sub_22F3A85F0(a1);
}

uint64_t sub_22F3A8D94()
{
  return sub_22F3BDB18();
}

uint64_t (*sub_22F3A8E1C(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_unknownObjectRetain();
  return sub_22F3AA88C;
}

uint64_t type metadata accessor for _AppIntentExecution(uint64_t a1)
{
  return sub_22F3A8EC8(a1, (uint64_t *)&unk_2686BE4E8);
}

uint64_t type metadata accessor for _AppIntentExecution.Container(uint64_t a1)
{
  return sub_22F3A8EC8(a1, qword_2686BE508);
}

uint64_t sub_22F3A8EC8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_22F3A8EFC()
{
  unint64_t result = qword_2686BE4F8;
  if (!qword_2686BE4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE4F8);
  }
  return result;
}

uint64_t sub_22F3A8F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _AppIntentExecution.Container(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3A8FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3A9014(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_22F3A9074(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_1();
  uint64_t v4 = OUTLINED_FUNCTION_26();
  v5(v4);
  return a2;
}

uint64_t sub_22F3A90C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(a1, a2, ObjectType, a4);
}

uint64_t sub_22F3A9124(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *, char *))
{
  uint64_t v6 = type metadata accessor for _AppIntentExecution.Container(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for _AppIntentExecution(0);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  sub_22F3A8F48(a2, (uint64_t)v9);
  uint64_t v17 = (uint64_t)&v14[*(int *)(v11 + 28)];
  uint64_t v18 = sub_22F3BD488();
  *(_OWORD *)uint64_t v17 = 0u;
  *(_OWORD *)(v17 + 16) = 0u;
  *(void *)(v17 + 32) = 0;
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v14, v9, v18);
  sub_22F3AA3B4((uint64_t)&v9[*(int *)(v7 + 28)], v17);
  sub_22F3A9014((uint64_t)v14, (uint64_t)v16, (void (*)(void))type metadata accessor for _AppIntentExecution);
  uint64_t v21 = a1;
  a3(&v21, v16);
  sub_22F3AA41C((uint64_t)v16, (void (*)(void))type metadata accessor for _AppIntentExecution);
  return swift_release();
}

uint64_t (*sub_22F3A92E0())@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v1 = off_26B76FD60;
  uint64_t v0 = *(void *)algn_26B76FD68;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  swift_retain();
  return sub_22F3AA470;
}

uint64_t sub_22F3A9350@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void)@<X1>, void *a3@<X8>)
{
  uint64_t v4 = a2(*a1, a1[1]);
  uint64_t v6 = v5;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v4;
  *(void *)(result + 24) = v6;
  *a3 = sub_22F3AA4B0;
  a3[1] = result;
  return result;
}

uint64_t sub_22F3A93C4(void (**a1)(uint64_t *, char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  swift_retain();

  return sub_22F3A9124(a2, a3, v5);
}

uint64_t sub_22F3A9420()
{
  OUTLINED_FUNCTION_25();
  v0[4] = v1;
  v0[5] = v2;
  v0[3] = v3;
  uint64_t v4 = type metadata accessor for _AppIntentExecution.Container(0);
  v0[6] = v4;
  OUTLINED_FUNCTION_24(v4);
  v0[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3A94B0, 0, 0);
}

uint64_t sub_22F3A94B0()
{
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22F3BF310;
  sub_22F3BD488();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v2, v1);
  uint64_t v8 = v2 + *(int *)(v3 + 20);
  sub_22F3A5168(0, &qword_2686BE7E0);
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(void *)(v8 + 32) = 0;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  *(void *)(v9 + 24) = v4;
  swift_retain();
  id v10 = sub_22F3A9834((uint64_t)sub_22F3AA75C, v9);
  sub_22F3A8EFC();
  uint64_t v11 = sub_22F3BD558();
  sub_22F3AA41C(v0[7], (void (*)(void))type metadata accessor for _AppIntentExecution.Container);

  *(void *)(v6 + 32) = v11;
  sub_22F3BD6E8();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v6);
}

id sub_22F3A9834(uint64_t a1, uint64_t a2)
{
  v5[4] = a1;
  v5[5] = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_22F3A98E4;
  v5[3] = &block_descriptor;
  uint64_t v2 = _Block_copy(v5);
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_responderWithHandler_, v2);
  _Block_release(v2);
  swift_release();
  return v3;
}

void sub_22F3A98E4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22F3A994C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22F3A998C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_22F3A9A4C;
  return sub_22F3A7234(a1, v4, v5, v6);
}

uint64_t sub_22F3A9A4C()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_22();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

unint64_t sub_22F3A9B10()
{
  unint64_t result = qword_2686BE700;
  if (!qword_2686BE700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE700);
  }
  return result;
}

uint64_t dispatch thunk of _AppIntentSceneDelegate.scene(_:willPerform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    id v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *id v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *id v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for _AppIntentExecution(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for _AppIntentExecution(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

void type metadata accessor for _AppIntentExecution.Definition()
{
}

uint64_t *_s17_AppIntents_UIKit19_AppIntentExecutionVwCP_0(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1();
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    uint64_t v7 = v4;
    sub_22F3BD488();
    OUTLINED_FUNCTION_2_1();
    uint64_t v8 = OUTLINED_FUNCTION_26();
    v9(v8);
    uint64_t v10 = *(int *)(v7 + 20);
    uint64_t v11 = (uint64_t)a1 + v10;
    uint64_t v12 = (uint64_t)a2 + v10;
    uint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 24);
    if (v13)
    {
      uint64_t v14 = OUTLINED_FUNCTION_20(v11, v12, v13);
      (*v15)(v14);
    }
    else
    {
      OUTLINED_FUNCTION_28(v11, v12);
    }
  }
  return a1;
}

uint64_t _s17_AppIntents_UIKit19_AppIntentExecutionVwxx_0(uint64_t a1, uint64_t a2)
{
  sub_22F3BD488();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4();
  v4();
  uint64_t result = a1 + *(int *)(a2 + 20);
  if (*(void *)(result + 24))
  {
    return __swift_destroy_boxed_opaque_existential_0(result);
  }
  return result;
}

uint64_t _s17_AppIntents_UIKit19_AppIntentExecutionVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v3, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = v3 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 24);
  if (v10)
  {
    uint64_t v11 = OUTLINED_FUNCTION_20(v8, v9, v10);
    (*v12)(v11);
  }
  else
  {
    OUTLINED_FUNCTION_28(v8, v9);
  }
  return v3;
}

uint64_t _s17_AppIntents_UIKit19_AppIntentExecutionVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v3, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = v3 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *((void *)v9 + 3);
  if (!*(void *)(v3 + v7 + 24))
  {
    if (v10)
    {
      *(void *)(v8 + 24) = v10;
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      (**(void (***)(uint64_t, long long *))(v10 - 8))(v8, v9);
      return v3;
    }
LABEL_7:
    long long v11 = *v9;
    long long v12 = v9[1];
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(_OWORD *)uint64_t v8 = v11;
    *(_OWORD *)(v8 + 16) = v12;
    return v3;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_0(v8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v8, (uint64_t *)v9);
  return v3;
}

uint64_t _s17_AppIntents_UIKit19_AppIntentExecutionVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22F3BD488();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t _s17_AppIntents_UIKit19_AppIntentExecutionVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v3, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = v3 + v7;
  if (*(void *)(v3 + v7 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(v3 + v7);
  }
  long long v9 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  return v3;
}

uint64_t sub_22F3AA1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t sub_22F3AA1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t sub_22F3AA200()
{
  uint64_t result = sub_22F3BD488();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22F3AA294()
{
  return sub_22F3AA324(&qword_2686BE780, (void (*)(uint64_t))type metadata accessor for _AppIntentExecution.Container);
}

uint64_t sub_22F3AA2DC()
{
  return sub_22F3AA324(&qword_2686BE788, (void (*)(uint64_t))type metadata accessor for _AppIntentExecution.Container);
}

uint64_t sub_22F3AA324(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22F3AA36C()
{
  return sub_22F3AA324(&qword_2686BE790, (void (*)(uint64_t))type metadata accessor for _AppIntentExecution.Container);
}

uint64_t sub_22F3AA3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3AA41C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4();
  v3();
  return a1;
}

uint64_t sub_22F3AA470@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_22F3A9350(a1, *(uint64_t (**)(void, void))(v2 + 16), a2);
}

uint64_t sub_22F3AA478()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22F3AA4B0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_22F3AA4DC()
{
  unint64_t result = qword_2686BE7A0;
  if (!qword_2686BE7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE7A0);
  }
  return result;
}

unint64_t sub_22F3AA528()
{
  unint64_t result = qword_2686BE7B0;
  if (!qword_2686BE7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE7B0);
  }
  return result;
}

uint64_t sub_22F3AA574(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22F3AA650;
  return v6(a1);
}

uint64_t sub_22F3AA650()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_22();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_22F3AA718(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

uint64_t sub_22F3AA744(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22F3AA75C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_22F3AA79C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_22F3A9A4C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2686BE7F0 + dword_2686BE7F0);
  return v6(a1, v4);
}

uint64_t sub_22F3AA854()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22F3AA88C(uint64_t a1, uint64_t a2)
{
  return sub_22F3A90C4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_22F3AA8A4()
{
  return 0;
}

void type metadata accessor for _AppIntentExecutionError()
{
}

uint64_t sub_22F3AA8B8(unsigned int *a1, int a2)
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

unsigned char *sub_22F3AA908(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22F3AA9A4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for _AppIntentExecution.Container.CodingKeys()
{
}

unint64_t sub_22F3AA9DC()
{
  unint64_t result = qword_2686BE800;
  if (!qword_2686BE800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE800);
  }
  return result;
}

unint64_t sub_22F3AAA2C()
{
  unint64_t result = qword_2686BE808;
  if (!qword_2686BE808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE808);
  }
  return result;
}

unint64_t sub_22F3AAA7C()
{
  unint64_t result = qword_2686BE810;
  if (!qword_2686BE810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE810);
  }
  return result;
}

unint64_t sub_22F3AAACC()
{
  unint64_t result = qword_2686BE818;
  if (!qword_2686BE818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BE818);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_22F3BD0A8();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_22F3BDB48();
}

__n128 OUTLINED_FUNCTION_28(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t sub_22F3AABBC@<X0>(uint64_t a1@<X8>)
{
  return UICollectionViewAppIntentsDataSource.collectionView(_:appEntityIdentifierForItemAt:)(a1);
}

uint64_t UICollectionViewAppIntentsDataSource.collectionView(_:appEntityIdentifierForItemAt:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22F3BD108();

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t UICollectionView.appIntentsDataSource.getter()
{
  return 0;
}

uint64_t sub_22F3AAC28()
{
  uint64_t v0 = swift_unknownObjectRetain();
  return UICollectionView.appIntentsDataSource.setter(v0);
}

uint64_t (*UICollectionView.appIntentsDataSource.modify(void *a1))()
{
  *a1 = 0;
  a1[1] = 0;
  return sub_22F3A6B80;
}

void sub_22F3AAC70(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t dispatch thunk of UICollectionViewAppIntentsDataSource.collectionView(_:appEntityIdentifierForItemAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

id UIKitBridgeLoader.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id UIKitBridgeLoader.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIKitBridgeLoader();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for UIKitBridgeLoader()
{
  return self;
}

id UIKitBridgeLoader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIKitBridgeLoader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static UIKitBridgeLoader.loadBridge()()
{
  if (qword_26AEBA9F8 != -1) {
    return swift_once();
  }
  return result;
}

uint64_t UIView.appEntityIdentifier.getter()
{
  return sub_22F3BD298();
}

void sub_22F3AAE44(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA840);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22F3A3740(a1, (uint64_t)&v4 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26AEBA840);
  UIView.appEntityIdentifier.setter();
}

void (*UIView.appEntityIdentifier.modify(void *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA840);
  OUTLINED_FUNCTION_24(v3);
  size_t v5 = *(void *)(v4 + 64);
  a1[2] = malloc(v5);
  a1[3] = malloc(v5);
  *a1 = v1;
  sub_22F3A2FC4();
  sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3BD298();
  return sub_22F3AAFB4;
}

void sub_22F3AAFB4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  if (a2)
  {
    sub_22F3A3740(*(void *)(a1 + 24), (uint64_t)v2, &qword_26AEBA840);
    UIView.appEntityIdentifier.setter();
    sub_22F3A36F0((uint64_t)v3, &qword_26AEBA840);
  }
  else
  {
    UIView.appEntityIdentifier.setter();
  }
  free(v3);

  free(v2);
}

uint64_t sub_22F3AB038()
{
  return UIView.appEntityIdentifier.getter();
}

void sub_22F3AB05C()
{
}

void (*sub_22F3AB080(void *a1))(uint64_t a1, char a2)
{
  size_t v3 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA840) - 8) + 64);
  a1[1] = malloc(v3);
  uint64_t v4 = malloc(v3);
  uint64_t v5 = *v1;
  a1[2] = v4;
  a1[3] = v5;
  *a1 = v5;
  sub_22F3A2FC4();
  sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
  sub_22F3BD298();
  return sub_22F3AB15C;
}

void sub_22F3AB15C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  size_t v3 = *(void **)(a1 + 8);
  if (a2)
  {
    sub_22F3A3740(*(void *)(a1 + 16), (uint64_t)v3, &qword_26AEBA840);
    UIView.appEntityIdentifier.setter();
    sub_22F3A36F0((uint64_t)v2, &qword_26AEBA840);
  }
  else
  {
    UIView.appEntityIdentifier.setter();
  }
  free(v2);

  free(v3);
}

void UIView.setRepresentedAppEntity(_:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = sub_22F3BCE38();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA930);
  uint64_t v11 = OUTLINED_FUNCTION_24(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6();
  sub_22F3A3740(v5, (uint64_t)&v15, &qword_26AEBA8C8);
  if (v16)
  {
    sub_22F3AA744(&v15, (uint64_t)v17);
    *(void *)&long long v15 = v3;
    sub_22F3AB5C8((uint64_t)v17, v2);
    uint64_t v12 = *MEMORY[0x263EFB8F0];
    uint64_t v13 = sub_22F3BD088();
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 104))(v2, v12, v13);
    OUTLINED_FUNCTION_15_0();
    sub_22F3A36A8(&qword_26AEBA900, MEMORY[0x263EFB6A0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
    sub_22F3A3004();
    OUTLINED_FUNCTION_12_0();
    sub_22F3A2FC4();
    sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2A8();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    sub_22F3A36F0(v2, &qword_26AEBA930);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  }
  else
  {
    sub_22F3A36F0((uint64_t)&v15, &qword_26AEBA8C8);
    v17[0] = v3;
    sub_22F3A2FC4();
    sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    OUTLINED_FUNCTION_5_1();
  }
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22F3AB5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Void __swiftcall UIView.removeAnnotation()()
{
}

void UIView.setRepresentedAppEntity<A>(_:identifier:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v46 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  v38[1] = v6;
  sub_22F3BCE38();
  OUTLINED_FUNCTION_0_1();
  uint64_t v41 = v8;
  uint64_t v42 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_1();
  uint64_t v40 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA930);
  uint64_t v11 = OUTLINED_FUNCTION_24(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_8_1();
  sub_22F3BD108();
  OUTLINED_FUNCTION_0_1();
  uint64_t v44 = v13;
  uint64_t v45 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v43 = v14;
  uint64_t v39 = v3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = sub_22F3BD8E8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v38 - v20;
  OUTLINED_FUNCTION_0_1();
  uint64_t v23 = v22;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v38 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  os_log_type_t v29 = (char *)v38 - v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v5, v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
    uint64_t v48 = v46;
    sub_22F3A2FC4();
    sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2D8();
  }
  else
  {
    v38[0] = v23;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v29, v21, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v27, v29, AssociatedTypeWitness);
    uint64_t v30 = v43;
    sub_22F3BD0F8();
    uint64_t v48 = v46;
    uint64_t v31 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA898) + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v1, v30, v45);
    uint64_t v32 = sub_22F3BD1C8();
    __swift_storeEnumTagSinglePayload(v31, 1, 1, v32);
    uint64_t v33 = *MEMORY[0x263EFB8E8];
    uint64_t v34 = sub_22F3BD088();
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 104))(v1, v33, v34);
    __swift_storeEnumTagSinglePayload(v1, 0, 1, v34);
    uint64_t v47 = MEMORY[0x263F8EE78];
    sub_22F3A36A8(&qword_26AEBA900, MEMORY[0x263EFB6A0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
    sub_22F3A3004();
    sub_22F3BD938();
    sub_22F3A2FC4();
    uint64_t v39 = sub_22F3A36A8((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A36A8((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2A8();
    OUTLINED_FUNCTION_4();
    v36();
    sub_22F3A36F0(v1, &qword_26AEBA930);
    OUTLINED_FUNCTION_4();
    v37();
    (*(void (**)(char *, uint64_t))(v38[0] + 8))(v29, AssociatedTypeWitness);
  }
  OUTLINED_FUNCTION_10();
}

void *sub_22F3ABDAC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22F3BDA38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_22F3ABE84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22F3ABF1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_22F3AC0F8(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_22F3AC0F8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22F3ABF1C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_22F3BD698();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_22F3AC090(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_22F3BD988();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_22F3BDA38();
  __break(1u);
LABEL_14:
  uint64_t result = sub_22F3BDA08();
  __break(1u);
  return result;
}

void *sub_22F3AC090(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE820);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22F3AC0F8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE820);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_22F3AC2A8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_22F3AC1D0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22F3AC1D0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22F3BDA38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_22F3AC2A8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22F3BDA38();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_22F3AC338()
{
  return UIView.appEntityIdentifier.getter();
}

uint64_t SiriTipUIView.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  swift_beginAccess();
  sub_22F3BD4E8();
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_22F3AC3E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  swift_beginAccess();
  uint64_t v4 = sub_22F3BD4E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_22F3AC46C(uint64_t a1)
{
  uint64_t v2 = sub_22F3BD4E8();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return SiriTipUIView.style.setter((uint64_t)v4);
}

uint64_t SiriTipUIView.style.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  OUTLINED_FUNCTION_3();
  uint64_t v4 = sub_22F3BD4E8();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v3, a1, v4);
  swift_endAccess();
  sub_22F3AC5DC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
}

void sub_22F3AC5DC()
{
  uint64_t v1 = v0;
  uint64_t v25 = sub_22F3BD4E8();
  uint64_t v2 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22F3BD4A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE888);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v26 = OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView], sel_removeFromSuperview);
  swift_bridgeObjectRetain();
  sub_22F3ACE08();
  sub_22F3BD498();
  uint64_t v10 = &v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style];
  swift_beginAccess();
  uint64_t v11 = v25;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v10, v25);
  sub_22F3AE62C(&qword_2686BE890, MEMORY[0x263F20088]);
  sub_22F3BD598();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v11);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v12 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2686BE898));
  uint64_t v13 = (void *)sub_22F3BD588();
  objc_msgSend(v1, sel_addSubview_, v13);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v13, sel_setContentHuggingPriority_forAxis_, 1, v14);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v13, sel_setContentCompressionResistancePriority_forAxis_, 0, v15);
  LODWORD(v16) = 1148846080;
  objc_msgSend(v13, sel_setContentCompressionResistancePriority_forAxis_, 1, v16);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v17 = objc_msgSend(v13, sel_widthAnchor);
  id v18 = objc_msgSend(v1, sel_widthAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

  objc_msgSend(v19, sel_setActive_, 1);
  id v20 = objc_msgSend(v13, sel_heightAnchor);
  id v21 = objc_msgSend(v1, sel_heightAnchor);
  id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

  objc_msgSend(v22, sel_setActive_, 1);
  sub_22F3BD578();
  uint64_t v23 = *(void **)&v1[v26];
  *(void *)&v1[v26] = v13;
}

uint64_t (*SiriTipUIView.style.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_3();
  return sub_22F3ACA5C;
}

uint64_t SiriTipUIView.isPresented.getter()
{
  OUTLINED_FUNCTION_1_2();
  return *v0;
}

void SiriTipUIView.isPresented.setter(char a1)
{
}

uint64_t SiriTipUIView.allowsDismissal.getter()
{
  OUTLINED_FUNCTION_1_2();
  return *v0;
}

uint64_t sub_22F3ACB50@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void SiriTipUIView.allowsDismissal.setter(char a1)
{
}

void sub_22F3ACBB0(char a1, void *a2)
{
  uint64_t v4 = (unsigned char *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  sub_22F3AC5DC();
}

uint64_t (*SiriTipUIView.allowsDismissal.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_3();
  return sub_22F3ACA5C;
}

void sub_22F3ACC50(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_22F3AC5DC();
  }
}

uint64_t SiriTipUIView.loadOnAppear.getter()
{
  OUTLINED_FUNCTION_1_2();
  return *v0;
}

uint64_t SiriTipUIView.loadOnAppear.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SiriTipUIView.loadOnAppear.modify())()
{
  return j__swift_endAccess;
}

void sub_22F3ACD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase + 8);
  if (!v4)
  {
    if (!a2) {
      return;
    }
    goto LABEL_10;
  }
  if (!a2
    || (*(void *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase) == a1 ? (BOOL v5 = v4 == a2) : (BOOL v5 = 0),
        !v5 && (sub_22F3BDA98() & 1) == 0))
  {
LABEL_10:
    sub_22F3AC5DC();
  }
}

uint64_t sub_22F3ACDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase + 8);
  *uint64_t v3 = a1;
  v3[1] = a2;
  sub_22F3ACD4C(v4, v5);

  return swift_bridgeObjectRelease();
}

uint64_t sub_22F3ACE08()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal);
  swift_beginAccess();
  if (*v1 != 1) {
    return 0;
  }
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_22F3BD768();
  swift_retain();
  uint64_t v3 = sub_22F3BD758();
  uint64_t v4 = (void *)swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8F500];
  v4[2] = v3;
  v4[3] = v5;
  v4[4] = v2;
  swift_release();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v7 = sub_22F3BD758();
  int64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = v5;
  v8[4] = v6;
  swift_release();
  sub_22F3BD5B8();
  return v10;
}

void sub_22F3ACF98(uint64_t a1@<X2>, unsigned __int8 *a2@<X8>)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x230FB67E0](v3);
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned __int8 v6 = objc_msgSend(v4, sel_isPresented);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }
  *a2 = v6;
}

void sub_22F3AD010(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a4 + 16;
  swift_beginAccess();
  unsigned __int8 v6 = (void *)MEMORY[0x230FB67E0](v5);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_setIsPresented_, v4);
  }
}

char *SiriTipUIView.__allocating_init(style:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return SiriTipUIView.init(style:)(a1);
}

char *SiriTipUIView.init(style:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = v1;
  sub_22F3BD4D8();
  v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_isPresented] = 1;
  v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal] = 0;
  v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView] = 0;
  uint64_t v5 = &v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase];
  *uint64_t v5 = 0;
  v5[1] = 0;
  unsigned __int8 v6 = &v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
  *unsigned __int8 v6 = 0;
  v6[1] = 0;

  v11.receiver = v4;
  v11.super_class = ObjectType;
  uint64_t v7 = (char *)objc_msgSendSuper2(&v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  int64_t v8 = &v7[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style];
  OUTLINED_FUNCTION_3();
  sub_22F3BD4E8();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *, uint64_t))(v9 + 40))(v8, a1);
  swift_endAccess();
  return v7;
}

uint64_t sub_22F3AD1D4(void *a1)
{
  swift_getObjectType();
  id v3 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style];
  uint64_t v4 = v1;
  sub_22F3BD4D8();
  v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_isPresented] = 1;
  v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal] = 0;
  v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear] = 0;
  uint64_t v5 = OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView;
  *(void *)&v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView] = 0;
  unsigned __int8 v6 = &v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase];
  *(void *)unsigned __int8 v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = (uint64_t *)&v4[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
  *uint64_t v7 = 0;
  v7[1] = 0;

  sub_22F3BD4E8();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v8 + 8))(v3);

  swift_bridgeObjectRelease();
  sub_22F3A272C(*v7);

  swift_deallocPartialClassInstance();
  return 0;
}

id SiriTipUIView.intrinsicContentSize.getter()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView];
  if (v1) {
    return objc_msgSend(v1, sel_intrinsicContentSize);
  }
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v3, sel_intrinsicContentSize);
}

CGSize __swiftcall SiriTipUIView.sizeThatFits(_:)(CGSize a1)
{
  double height = a1.height;
  double width = a1.width;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView];
  if (v4)
  {
    objc_msgSend(v4, sel_sizeThatFits_, a1.width, a1.height);
  }
  else
  {
    v8.receiver = v1;
    v8.super_class = (Class)swift_getObjectType();
    objc_msgSendSuper2(&v8, sel_sizeThatFits_, width, height);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

Swift::Void __swiftcall SiriTipUIView.didMoveToWindow()()
{
  v7.receiver = v0;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_didMoveToWindow);
  id v1 = objc_msgSend(v0, sel_window);

  if (v1 && !*(void *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase + 8])
  {
    uint64_t v2 = (uint64_t *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    if (v3)
    {
      uint64_t v4 = v2[1];
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v3;
      *(void *)(v5 + 24) = v4;
      swift_retain_n();
      sub_22F3AD61C((uint64_t)sub_22F3AD5F4, v5);
      sub_22F3A272C(v3);
      swift_release();
      uint64_t v6 = *v2;
      *uint64_t v2 = 0;
      v2[1] = 0;
      sub_22F3A272C(v6);
    }
  }
}

uint64_t sub_22F3AD5BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22F3AD5F4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22F3AD61C(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v23 = a1;
  uint64_t v2 = sub_22F3BD5C8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v28 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22F3BD858();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  objc_super v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22F3BD848();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_22F3BD5F8();
  uint64_t v26 = *(void *)(v10 - 8);
  uint64_t v27 = v10;
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3AE4C8();
  sub_22F3BD5E8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22F3AE62C(&qword_2686BE858, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE860);
  sub_22F3AE56C(&qword_2686BE868, &qword_2686BE860);
  sub_22F3BD938();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F130], v5);
  uint64_t v13 = (void *)sub_22F3BD888();
  double v14 = (void *)swift_allocObject();
  uint64_t v15 = v24;
  v14[2] = v23;
  v14[3] = v15;
  double v16 = v25;
  v14[4] = v25;
  aBlock[4] = sub_22F3AE548;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22F3AE14C;
  aBlock[3] = &block_descriptor_0;
  id v17 = _Block_copy(aBlock);
  swift_retain();
  id v18 = v16;
  sub_22F3BD5D8();
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_22F3AE62C(&qword_2686BE870, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE878);
  sub_22F3AE56C(&qword_2686BE880, &qword_2686BE878);
  id v20 = v28;
  uint64_t v19 = v29;
  sub_22F3BD938();
  MEMORY[0x230FB5E20](0, v12, v20, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v19);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v27);
  return swift_release();
}

uint64_t SiriTipUIView.setIntent<A>(intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = &v3[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear];
  swift_beginAccess();
  if (*v9 == 1 && (id v10 = objc_msgSend(v3, sel_window), v10, !v10))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
    unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a2;
    *(void *)(v16 + 24) = a3;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
    id v17 = (uint64_t (**)())&v3[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    uint64_t v18 = *(void *)&v3[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    *id v17 = sub_22F3ADDB8;
    v17[1] = (uint64_t (*)())v16;
    return sub_22F3A272C(v18);
  }
  else
  {
    sub_22F3BCF88();
    sub_22F3BCF68();
    uint64_t v11 = sub_22F3BCF38();
    uint64_t v13 = v12;
    swift_release();
    return sub_22F3ACDB8(v11, v13);
  }
}

uint64_t sub_22F3ADCBC()
{
  sub_22F3BCF88();
  sub_22F3BCF68();
  uint64_t v0 = sub_22F3BCF38();
  swift_release();
  return v0;
}

uint64_t sub_22F3ADD30()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_22F3ADDB8()
{
  return sub_22F3ADCBC();
}

uint64_t sub_22F3ADDE0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = sub_22F3BD5C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_22F3BD5F8();
  uint64_t v6 = *(void *)(v19 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1(v7);
  uint64_t v12 = v11;
  sub_22F3AE4C8();
  uint64_t v13 = (void *)sub_22F3BD868();
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = v10;
  v15[4] = v12;
  aBlock[4] = sub_22F3AE620;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22F3AE14C;
  aBlock[3] = &block_descriptor_21;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  sub_22F3BD5D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22F3AE62C(&qword_2686BE870, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE878);
  sub_22F3AE56C(&qword_2686BE880, &qword_2686BE878);
  sub_22F3BD938();
  MEMORY[0x230FB5E20](0, v9, v5, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v19);
}

void sub_22F3AE0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x230FB67E0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    swift_bridgeObjectRetain();
    sub_22F3ACDB8(a2, a3);
  }
}

uint64_t sub_22F3AE150(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id SiriTipUIView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void SiriTipUIView.init(frame:)()
{
}

id SiriTipUIView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *keypath_get_selector_isPresented()
{
  return sel_isPresented;
}

id sub_22F3AE284@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isPresented);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F3AE2B8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPresented_, *a1);
}

void sub_22F3AE2D0(char *a1)
{
}

uint64_t sub_22F3AE398()
{
  return type metadata accessor for SiriTipUIView();
}

uint64_t type metadata accessor for SiriTipUIView()
{
  uint64_t result = qword_2686BE840;
  if (!qword_2686BE840) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F3AE3E8()
{
  uint64_t result = sub_22F3BD4E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriTipUIView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriTipUIView);
}

uint64_t dispatch thunk of SiriTipUIView.__allocating_init(style:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

unint64_t sub_22F3AE4C8()
{
  unint64_t result = qword_2686BE850;
  if (!qword_2686BE850)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2686BE850);
  }
  return result;
}

uint64_t sub_22F3AE508()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22F3AE548()
{
  return sub_22F3ADDE0(*(uint64_t (**)(uint64_t))(v0 + 16));
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

uint64_t sub_22F3AE56C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22F3AE5BC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F3AE5F4()
{
  return objectdestroy_17Tm(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

void sub_22F3AE620()
{
  sub_22F3AE0D4(v0[2], v0[3], v0[4]);
}

uint64_t sub_22F3AE62C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22F3AE674()
{
  return objectdestroy_17Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

void sub_22F3AE6A0(unsigned __int8 *a1@<X8>)
{
  sub_22F3ACF98(*(void *)(v1 + 32), a1);
}

uint64_t sub_22F3AE6AC()
{
  return objectdestroy_17Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_17Tm(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 32));

  return MEMORY[0x270FA0238](v2, 40, 7);
}

void sub_22F3AE730(unsigned __int8 *a1)
{
  sub_22F3AD010(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_22F3AE744(uint64_t a1)
{
  return sub_22F3A09B8(a1, qword_2686BFAD8, MEMORY[0x263F51858]);
}

uint64_t UIAppEntityInteraction.entityIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entityIdentifier;
  sub_22F3BD108();
  OUTLINED_FUNCTION_2_1();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t sub_22F3AE7C4(uint64_t a1)
{
  uint64_t v2 = sub_22F3BCE38();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_22F3AE904((uint64_t)v4);
}

uint64_t sub_22F3AE890@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state;
  OUTLINED_FUNCTION_4_1();
  sub_22F3BCE38();
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_22F3AE904(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state;
  swift_beginAccess();
  sub_22F3BCE38();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  return swift_endAccess();
}

uint64_t (*sub_22F3AE988())()
{
  return j__swift_endAccess;
}

uint64_t sub_22F3AEA18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_4_1();
  return MEMORY[0x230FB67E0](v1);
}

void sub_22F3AEAB8(void *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x230FB67E0](v3);
  swift_unknownObjectWeakAssign();
  sub_22F3AEB60(v4);
}

void sub_22F3AEB30(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_22F3AEAB8(v1);
}

void sub_22F3AEB60(void *a1)
{
  uint64_t v3 = sub_22F3BD088();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v54[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_22F3BCE38();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = &v54[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA930);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v54[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view];
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x230FB67E0](v13);
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    uint64_t v61 = v8;
    if (qword_26AEBAA10 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_22F3BD548();
    __swift_project_value_buffer(v16, (uint64_t)qword_26AEBAAD0);
    id v17 = v1;
    id v18 = v15;
    uint64_t v19 = v17;
    id v20 = v18;
    id v21 = sub_22F3BD528();
    os_log_type_t v22 = sub_22F3BD818();
    int v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v59 = v3;
      uint64_t v25 = v24;
      v56 = (void *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v64 = (unsigned char *)v57;
      *(_DWORD *)uint64_t v25 = 136315650;
      uint64_t v60 = v4;
      sub_22F3BD108();
      uint64_t v58 = v7;
      sub_22F3A2F34(&qword_2686BE528, MEMORY[0x263EFB9E0]);
      uint64_t v26 = sub_22F3BDA88();
      uint64_t v63 = sub_22F3A1B4C(v26, v27, (uint64_t *)&v64);
      int v55 = v23;
      sub_22F3BD908();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 1024;
      int v28 = *(_DWORD *)&v19[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId];

      LODWORD(v63) = v28;
      sub_22F3BD908();

      *(_WORD *)(v25 + 18) = 2112;
      uint64_t v63 = (uint64_t)v20;
      id v29 = v20;
      uint64_t v7 = v58;
      uint64_t v4 = v60;
      sub_22F3BD908();
      uint64_t v30 = v56;
      void *v56 = v15;

      _os_log_impl(&dword_22F39E000, v21, (os_log_type_t)v55, "Entity %s attached %u to view %@", (uint8_t *)v25, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE7E8);
      swift_arrayDestroy();
      MEMORY[0x230FB6730](v30, -1, -1);
      uint64_t v31 = v57;
      swift_arrayDestroy();
      MEMORY[0x230FB6730](v31, -1, -1);
      uint64_t v32 = v25;
      uint64_t v3 = v59;
      MEMORY[0x230FB6730](v32, -1, -1);
    }
    else
    {
    }
    uint64_t v64 = v20;
    sub_22F3AB5C8((uint64_t)&v19[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity], (uint64_t)v12);
    (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v12, *MEMORY[0x263EFB8F0], v3);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v3);
    uint64_t v63 = MEMORY[0x263F8EE78];
    sub_22F3A2F34(&qword_26AEBA900, MEMORY[0x263EFB6A0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
    sub_22F3A3004();
    uint64_t v50 = v62;
    sub_22F3BD938();
    sub_22F3A2FC4();
    sub_22F3A2F34((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3BD2A8();
    (*(void (**)(unsigned char *, uint64_t))(v61 + 8))(v50, v7);
    sub_22F3B09A0((uint64_t)v12);
  }
  else if (a1)
  {
    uint64_t v60 = v4;
    uint64_t v33 = qword_26AEBAA10;
    id v34 = a1;
    if (v33 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_22F3BD548();
    __swift_project_value_buffer(v35, (uint64_t)qword_26AEBAAD0);
    uint64_t v36 = v1;
    id v37 = v34;
    id v38 = v36;
    id v39 = v37;
    uint64_t v40 = sub_22F3BD528();
    os_log_type_t v41 = sub_22F3BD818();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v62 = (unsigned char *)swift_slowAlloc();
      uint64_t v64 = v62;
      *(_DWORD *)uint64_t v43 = 136315650;
      LODWORD(v58) = v42;
      sub_22F3BD108();
      uint64_t v59 = v3;
      sub_22F3A2F34(&qword_2686BE528, MEMORY[0x263EFB9E0]);
      uint64_t v44 = sub_22F3BDA88();
      uint64_t v63 = sub_22F3A1B4C(v44, v45, (uint64_t *)&v64);
      sub_22F3BD908();

      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 1024;
      int v46 = *(_DWORD *)&v38[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId];

      LODWORD(v63) = v46;
      sub_22F3BD908();

      *(_WORD *)(v43 + 18) = 2112;
      uint64_t v63 = (uint64_t)v39;
      id v47 = v39;
      uint64_t v3 = v59;
      sub_22F3BD908();
      uint64_t v48 = v61;
      *(void *)uint64_t v61 = a1;

      _os_log_impl(&dword_22F39E000, v40, (os_log_type_t)v58, "Entity %s removed %u from view %@", (uint8_t *)v43, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE7E8);
      swift_arrayDestroy();
      MEMORY[0x230FB6730](v48, -1, -1);
      uint64_t v49 = v62;
      swift_arrayDestroy();
      MEMORY[0x230FB6730](v49, -1, -1);
      MEMORY[0x230FB6730](v43, -1, -1);
    }
    else
    {
    }
    uint64_t v64 = v39;
    sub_22F3A2FC4();
    sub_22F3A2F34((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
    uint64_t v51 = sub_22F3BD2C8();
    if (v51)
    {
      uint64_t v52 = (void *)v51;
      sub_22F3AB5C8((uint64_t)&v38[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity], (uint64_t)v6);
      uint64_t v53 = v60;
      (*(void (**)(unsigned char *, void, uint64_t))(v60 + 104))(v6, *MEMORY[0x263EFB8F0], v3);
      sub_22F3BD218();
      (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v6, v3);
      UIView.updateViewProvider(with:)(v52);
    }
  }
}

void (*sub_22F3AF560(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_4_1();
  v3[3] = MEMORY[0x230FB67E0](v4);
  return sub_22F3AF5DC;
}

void sub_22F3AF5DC(uint64_t a1, char a2)
{
  id v2 = *(void **)a1;
  uint64_t v4 = (id *)(*(void *)a1 + 24);
  id v3 = *v4;
  if (a2)
  {
    id v5 = v3;
    sub_22F3AEAB8(v3);
  }
  else
  {
    sub_22F3AEAB8(*(void **)(*(void *)a1 + 24));
  }

  free(v2);
}

void sub_22F3AF648()
{
  uint64_t v2 = v0;
  sub_22F3BD088();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9();
  uint64_t v4 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_4_1();
  uint64_t v5 = MEMORY[0x230FB67E0](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (qword_26AEBA9F8 != -1) {
      swift_once();
    }
    sub_22F3AB5C8(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity, v1);
    uint64_t v7 = OUTLINED_FUNCTION_3_3();
    v8(v7);
    type metadata accessor for AppUIKitBridge();
    sub_22F3A2FC4();
    sub_22F3A2F34((unint64_t *)&unk_26AEBA960, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
    sub_22F3A2F34((unint64_t *)&unk_26AEBA9B0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34(&qword_26AEBA9C0, (void (*)(uint64_t))sub_22F3A2FC4);
    sub_22F3A2F34((unint64_t *)&unk_26AEBA980, (void (*)(uint64_t))sub_22F3A2FC4);
    swift_retain();
    sub_22F3BCEA8();

    swift_release();
    uint64_t v9 = OUTLINED_FUNCTION_6_1();
    v10(v9);
  }
  sub_22F3AEAB8(0);
}

uint64_t sub_22F3AF910(void *a1)
{
  a1;
  sub_22F3AEAB8(a1);
  uint64_t result = 0;
  if (a1)
  {
    sub_22F3A2FC4();
    sub_22F3A2F34((unint64_t *)&unk_26AEBA970, (void (*)(uint64_t))sub_22F3A2FC4);
    uint64_t result = sub_22F3BD178();
  }
  uint64_t v4 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId;
  *(void *)uint64_t v4 = result;
  *(unsigned char *)(v4 + 8) = a1 == 0;
  return result;
}

id UIAppEntityInteraction.__deallocating_deinit()
{
  sub_22F3BD088();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_9();
  if ((v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId + 8] & 1) == 0)
  {
    if (qword_26AEBA9F8 != -1) {
      swift_once();
    }
    sub_22F3AB5C8((uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity], v1);
    uint64_t v3 = OUTLINED_FUNCTION_3_3();
    v4(v3);
    type metadata accessor for AppUIKitBridge();
    sub_22F3A2F34((unint64_t *)&unk_26AEBA960, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
    swift_retain();
    sub_22F3BCE98();
    swift_release();
    uint64_t v5 = OUTLINED_FUNCTION_6_1();
    v6(v5);
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for UIAppEntityInteraction();
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

id UIAppEntityInteraction.__allocating_init(entity:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UIAppEntityInteraction.init(entity:)(a1);
}

id UIAppEntityInteraction.init(entity:)(void *a1)
{
  sub_22F3BCE38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v27 = v4;
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_0();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_22F3BD108();
  OUTLINED_FUNCTION_0_4();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_7_0(OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v15 = v1;
  sub_22F3BCEE8();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(&v15[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entityIdentifier], v14, v8);
  sub_22F3AB5C8((uint64_t)a1, (uint64_t)&v15[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity]);
  uint64_t v29 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22F3BCEE8();
  int v16 = sub_22F3BD0D8();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
  *(_DWORD *)&v15[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId] = v16;
  sub_22F3BCE18();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(&v15[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state], v7, v28);
  if (qword_26AEBAA10 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_22F3BD548();
  __swift_project_value_buffer(v17, (uint64_t)qword_26AEBAAD0);
  id v18 = v15;
  uint64_t v19 = sub_22F3BD528();
  os_log_type_t v20 = sub_22F3BD818();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315394;
    sub_22F3A2F34(&qword_2686BE528, MEMORY[0x263EFB9E0]);
    uint64_t v22 = sub_22F3BDA88();
    sub_22F3A1B4C(v22, v23, &v30);
    sub_22F3BD908();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 1024;

    sub_22F3BD908();
    _os_log_impl(&dword_22F39E000, v19, v20, "Entity %s interaction %u created", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  uint64_t v24 = (objc_class *)type metadata accessor for UIAppEntityInteraction();
  v31.receiver = v18;
  v31.super_class = v24;
  id v25 = objc_msgSendSuper2(&v31, sel_init);
  __swift_destroy_boxed_opaque_existential_0(v29);
  return v25;
}

id UIAppEntityInteraction.__allocating_init(entity:state:)(void *a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return UIAppEntityInteraction.init(entity:state:)(a1, a2);
}

id UIAppEntityInteraction.init(entity:state:)(void *a1, uint64_t a2)
{
  uint64_t v32 = sub_22F3BCE38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v30 = v9 - v8;
  uint64_t v10 = sub_22F3BD108();
  OUTLINED_FUNCTION_0_4();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_9();
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_7_0(OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v14 = v2;
  sub_22F3BCEE8();
  (*(void (**)(void))(v12 + 32))();
  sub_22F3AB5C8((uint64_t)a1, (uint64_t)&v14[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22F3BCEE8();
  int v15 = sub_22F3BD0D8();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v10);
  *(_DWORD *)&v14[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId] = v15;
  int v16 = &v14[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v17(&v14[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state], a2, v32);
  if (qword_26AEBAA10 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_22F3BD548();
  __swift_project_value_buffer(v18, (uint64_t)qword_26AEBAAD0);
  uint64_t v19 = v14;
  os_log_type_t v20 = sub_22F3BD528();
  os_log_type_t v21 = sub_22F3BD818();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v29 = (void (*)(uint64_t, char *, uint64_t))v17;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315650;
    sub_22F3A2F34(&qword_2686BE528, MEMORY[0x263EFB9E0]);
    uint64_t v23 = sub_22F3BDA88();
    sub_22F3A1B4C(v23, v24, &v33);
    sub_22F3BD908();

    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 1024;

    sub_22F3BD908();
    *(_WORD *)(v22 + 18) = 2048;
    OUTLINED_FUNCTION_4_1();
    v29(v30, v16, v32);
    sub_22F3BCE28();
    uint64_t v25 = v6;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v30, v32);

    sub_22F3BD908();
    _os_log_impl(&dword_22F39E000, v20, v21, "Entity %s with interaction %u and UI state %ld created", (uint8_t *)v22, 0x1Cu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {

    uint64_t v25 = v6;
  }
  uint64_t v26 = (objc_class *)type metadata accessor for UIAppEntityInteraction();
  v34.receiver = v19;
  v34.super_class = v26;
  id v27 = objc_msgSendSuper2(&v34, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a2, v32);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v27;
}

id UIAppEntityInteraction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void UIAppEntityInteraction.init()()
{
}

uint64_t type metadata accessor for UIAppEntityInteraction()
{
  uint64_t result = qword_26AEBA788;
  if (!qword_26AEBA788) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F3B066C@<X0>(uint64_t a1@<X8>)
{
  return sub_22F3AE890(a1);
}

uint64_t sub_22F3B0694@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3AEA18();
  *a1 = result;
  return result;
}

uint64_t sub_22F3B06C4()
{
  return type metadata accessor for UIAppEntityInteraction();
}

uint64_t sub_22F3B06CC()
{
  uint64_t result = sub_22F3BD108();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_22F3BCE38();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for UIAppEntityInteraction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIAppEntityInteraction);
}

uint64_t dispatch thunk of UIAppEntityInteraction.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.state.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.state.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.view.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.view.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.view.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.willMove(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.didMove(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.__allocating_init(entity:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.__allocating_init(entity:state:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t sub_22F3B09A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA930);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F3B0A00()
{
  uint64_t v0 = sub_22F3BD648();
  uint64_t v2 = v1;
  if (v0 == sub_22F3BD648() && v2 == v3)
  {
    char v5 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_30();
    char v5 = sub_22F3BDA98();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t static AppManager.registerUIKitHooks()()
{
  if (qword_26AEBA9F8 != -1) {
    return swift_once();
  }
  return result;
}

unint64_t sub_22F3B0AB4(char a1)
{
  if (!a1) {
    return 0xD000000000000036;
  }
  if (a1 == 1) {
    return 0xD00000000000003CLL;
  }
  return 0xD000000000000033;
}

BOOL sub_22F3B0B10(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_22F3B0B20()
{
  return sub_22F3BDB08();
}

uint64_t sub_22F3B0B48()
{
  return sub_22F3BDB18();
}

BOOL sub_22F3B0B90(char *a1, char *a2)
{
  return sub_22F3B0B10(*a1, *a2);
}

uint64_t sub_22F3B0B9C()
{
  return sub_22F3B0B48();
}

uint64_t sub_22F3B0BA4()
{
  return sub_22F3B0B20();
}

uint64_t sub_22F3B0BAC()
{
  return sub_22F3BDB18();
}

unint64_t sub_22F3B0BF0()
{
  return sub_22F3B0AB4(*v0);
}

uint64_t sub_22F3B0C04()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3BA400;
  return IntentSceneConfigurator.scene(_:navigateToViewsFor:)();
}

uint64_t sub_22F3B0C90()
{
  return sub_22F3B10CC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentSceneConfigurator.scene(_:navigateToViewsFor:)()
{
  return sub_22F3B10CC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22F3B0D00()
{
  OUTLINED_FUNCTION_25();
  sub_22F3BD768();
  *(void *)(v0 + 16) = OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_33();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_22F3B0D78()
{
  OUTLINED_FUNCTION_2_2();
  swift_release();
  sub_22F3B90A8();
  uint64_t v0 = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_55(v0, v1);
  OUTLINED_FUNCTION_11_0();
  return v2();
}

uint64_t sub_22F3B0DF0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3BA400;
  return sub_22F3B0D00();
}

uint64_t sub_22F3B0E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2686BE970 + dword_2686BE970);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_22F3BA400;
  return v7(a1, a2);
}

uint64_t static AppManager.sceneConfigurator.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AEBA7A0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_4_1();
  sub_22F3B9848((uint64_t)&xmmword_26AEBAA60, (uint64_t)&v3, &qword_26AEBA828);
  if (v4) {
    return sub_22F3AA744(&v3, a1);
  }
  *(void *)(a1 + 24) = &unk_26E2A8FE0;
  *(void *)(a1 + 32) = &off_26E2A8FB8;
  return sub_22F3BA1B0((uint64_t)&v3, (uint64_t)&qword_26AEBA828);
}

void (*static AppManager.sceneConfigurator.modify(void *a1))(uint64_t *a1, char a2)
{
  long long v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  static AppManager.sceneConfigurator.getter((uint64_t)v3);
  return sub_22F3B104C;
}

void sub_22F3B104C(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    uint64_t v3 = OUTLINED_FUNCTION_42();
    sub_22F3A41A8(v3, v4);
    static AppManager.sceneConfigurator.setter((uint64_t)v2 + 40);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    static AppManager.sceneConfigurator.setter(*a1);
  }

  free(v2);
}

uint64_t AppEntityVisualState.init(with:)()
{
  return sub_22F3BCE18();
}

uint64_t sub_22F3B10CC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22F3B10D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a3;
  v4[8] = a4;
  v4[6] = a1;
  v4[9] = sub_22F3BD1F8();
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA48);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA50);
  v4[12] = swift_task_alloc();
  sub_22F3BD768();
  v4[13] = sub_22F3BD758();
  uint64_t v6 = sub_22F3BD738();
  return MEMORY[0x270FA2498](sub_22F3B1204, v6, v5);
}

uint64_t sub_22F3B1204()
{
  swift_release();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_4_1();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v0 + 96);
    uint64_t v4 = *(uint64_t **)(v0 + 48);
    objc_msgSend(*(id *)(Strong + 16), sel_sendAction_to_from_forEvent_, *(void *)(v0 + 64), 0, 0, 0);
    *(_WORD *)(v0 + 112) = 257;
    uint64_t v5 = sub_22F3BD1E8();
    OUTLINED_FUNCTION_23_0(v3, v6, v7, v5);
    uint64_t v8 = sub_22F3BD008();
    OUTLINED_FUNCTION_23_0(v2, v9, v10, v8);
    *(void *)(v0 + 40) = MEMORY[0x263F8EE78];
    sub_22F3A42F0(&qword_2686BEA58, 255, MEMORY[0x263EFBD20]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA60);
    sub_22F3B9BDC(&qword_2686BEA68, &qword_2686BEA60);
    sub_22F3BD938();
    v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA70);
    v4[4] = sub_22F3B9BDC(&qword_2686BEA78, &qword_2686BEA70);
    __swift_allocate_boxed_opaque_existential_1(v4);
    sub_22F3B9C20();
    sub_22F3B9C6C();
    sub_22F3BD1D8();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
  }
  else
  {
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v12();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v11();
}

uint64_t sub_22F3B1530()
{
  OUTLINED_FUNCTION_25();
  *(unsigned char *)(v1 + 96) = v2;
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v0;
  *(void *)(v1 + 16) = v4;
  *(void *)(v1 + 24) = v5;
  *(void *)(v1 + 48) = *v0;
  uint64_t v6 = sub_22F3BD2E8();
  *(void *)(v1 + 56) = v6;
  OUTLINED_FUNCTION_1_3(v6);
  *(void *)(v1 + 64) = v7;
  *(void *)(v1 + 72) = OUTLINED_FUNCTION_40();
  *(void *)(v1 + 80) = swift_task_alloc();
  sub_22F3BD768();
  *(void *)(v1 + 88) = OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_33();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_22F3B1618()
{
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  swift_release();
  sub_22F3BCEF8();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_5();
  v5();
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v6 == *MEMORY[0x263EFBED0])
  {
    OUTLINED_FUNCTION_6_2();
    v8();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_35();
    uint64_t v9 = OUTLINED_FUNCTION_52();
    *(void *)(v9 + 16) = v1;
    *(void *)(v9 + 24) = sel_cut_;
LABEL_15:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = OUTLINED_FUNCTION_58();
    return v18(v17);
  }
  if (v6 == *MEMORY[0x263EFBED8])
  {
    OUTLINED_FUNCTION_6_2();
    v10();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_35();
    uint64_t v11 = OUTLINED_FUNCTION_52();
    *(void *)(v11 + 16) = v1;
    *(void *)(v11 + 24) = sel_copy_;
    goto LABEL_15;
  }
  if (v6 == *MEMORY[0x263EFBEF0])
  {
    OUTLINED_FUNCTION_6_2();
    v12();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_35();
    uint64_t v13 = OUTLINED_FUNCTION_52();
    *(void *)(v13 + 16) = v1;
    *(void *)(v13 + 24) = sel_paste_;
    goto LABEL_15;
  }
  if (v6 == *MEMORY[0x263EFBEE8])
  {
    OUTLINED_FUNCTION_6_2();
    v14();
    OUTLINED_FUNCTION_37();
    swift_weakInit();
    goto LABEL_15;
  }
  if (v6 == *MEMORY[0x263EFBEB0]) {
    goto LABEL_14;
  }
  if (v6 == *MEMORY[0x263EFBEC8] || v6 == *MEMORY[0x263EFBEC0])
  {
    OUTLINED_FUNCTION_6_2();
    v15();
    swift_retain();
    goto LABEL_15;
  }
  if (v6 == *MEMORY[0x263EFBEB8])
  {
LABEL_14:
    OUTLINED_FUNCTION_6_2();
    v16();
    goto LABEL_15;
  }
  uint64_t v20 = v0[10];
  if (v6 == *MEMORY[0x263EFBEE0])
  {
    uint64_t v21 = v0[7];
    uint64_t v22 = v0[8];
    sub_22F3A42F0((unint64_t *)&unk_26AEBA960, v7, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
    sub_22F3BCEB8();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    goto LABEL_15;
  }
  uint64_t v24 = v0[8];
  uint64_t v23 = v0[9];
  uint64_t v25 = v0[7];
  sub_22F3BCE08();
  sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_1();
  v26();
  swift_willThrow();
  id v27 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v27(v20, v25);
  v27(v23, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_22F3B1B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA90);
  v3[13] = swift_task_alloc();
  uint64_t v4 = sub_22F3BCFF8();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  sub_22F3BD768();
  v3[17] = sub_22F3BD758();
  uint64_t v6 = sub_22F3BD738();
  v3[18] = v6;
  v3[19] = v5;
  return MEMORY[0x270FA2498](sub_22F3B1C7C, v6, v5);
}

uint64_t sub_22F3B1C7C()
{
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_1();
  uint64_t Strong = swift_weakLoadStrong();
  v0[20] = Strong;
  if (!Strong)
  {
    swift_release();
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    uint64_t v19 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_27_0(v19, v20);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v21();
    swift_willThrow();
    goto LABEL_10;
  }
  uint64_t v2 = Strong;
  sub_22F3A41A8(v0[11], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
  OUTLINED_FUNCTION_59();
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v22 = v0[13];
    uint64_t v23 = v0[11];
    OUTLINED_FUNCTION_23_0(v22, v3, v4, v0[14]);
    swift_release();
    sub_22F3BA1B0(v22, (uint64_t)&unk_2686BEA90);
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    OUTLINED_FUNCTION_9_1();
    sub_22F3A41A8(v23, v24);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v25();
    swift_willThrow();
    swift_release();
    goto LABEL_10;
  }
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];
  uint64_t v8 = v0[13];
  uint64_t v7 = v0[14];
  OUTLINED_FUNCTION_63();
  __swift_storeEnumTagSinglePayload(v9, v10, v11, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v8, v7);
  id v12 = objc_msgSend(*(id *)(v2 + 16), sel_appintents_responderForKeyEvents);
  v0[21] = v12;
  id v13 = objc_msgSend(v12, sel_undoManager);
  v0[22] = v13;
  if (!v13)
  {
    uint64_t v26 = v0[16];
    uint64_t v27 = v0[14];
    uint64_t v28 = v0[15];
    swift_release();
    sub_22F3BD388();
    sub_22F3A42F0(&qword_2686BEA98, 255, MEMORY[0x263EFBFB0]);
    uint64_t v29 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_27_0(v29, v30);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v31();
    swift_willThrow();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
LABEL_10:
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_41();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v14 = (uint64_t *)v0[10];
  id v15 = v13;
  sub_22F3BCFD8();
  v14[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAA0);
  v14[4] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v14);
  swift_task_alloc();
  OUTLINED_FUNCTION_29();
  v0[23] = v16;
  *int v16 = v17;
  v16[1] = sub_22F3B20A8;
  OUTLINED_FUNCTION_41();
  return MEMORY[0x270EE0E50]();
}

uint64_t sub_22F3B20A8()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 192) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v1 + 152);
  uint64_t v6 = *(void *)(v1 + 144);
  if (v0) {
    uint64_t v7 = sub_22F3B224C;
  }
  else {
    uint64_t v7 = sub_22F3B21B8;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

void sub_22F3B21B8()
{
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_54();
  swift_release();

  swift_release();
  uint64_t v2 = OUTLINED_FUNCTION_38();
  v3(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_41();
  __asm { BRAA            X1, X16 }
}

void sub_22F3B224C()
{
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_54();
  uint64_t v3 = *(void *)(v0 + 80);
  swift_release();

  swift_release();
  uint64_t v4 = OUTLINED_FUNCTION_38();
  v5(v4);
  __swift_deallocate_boxed_opaque_existential_1(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_41();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_22F3B22F0(uint64_t a1, uint64_t a2)
{
  v2[17] = a1;
  v2[18] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAA8);
  v2[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B2384, 0, 0);
}

uint64_t sub_22F3B2384()
{
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAB0);
  if (OUTLINED_FUNCTION_20_0())
  {
    uint64_t v2 = v1[19];
    sub_22F3AA744(v0, (uint64_t)(v1 + 2));
    __swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
    uint64_t v3 = sub_22F3BD468();
    OUTLINED_FUNCTION_23_0(v2, v4, v5, v3);
    uint64_t v6 = (uint8_t *)sub_22F3B25D8();
    sub_22F3BC594(v6);
    uint64_t v10 = (uint64_t *)v1[17];
    sub_22F3BA1B0(v1[19], (uint64_t)&unk_2686BEAA8);

    v10[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA70);
    v10[4] = sub_22F3B9BDC(&qword_2686BEA78, &qword_2686BEA70);
    __swift_allocate_boxed_opaque_existential_1(v10);
    sub_22F3BD018();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 2));
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
  }
  else
  {
    uint64_t v7 = v1[18];
    OUTLINED_FUNCTION_34();
    sub_22F3BA1B0((uint64_t)v0, (uint64_t)&unk_2686BEAB8);
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    OUTLINED_FUNCTION_9_1();
    sub_22F3A41A8(v7, v8);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v9();
    swift_willThrow();
    swift_task_dealloc();
    OUTLINED_FUNCTION_11_0();
  }
  return v11();
}

id sub_22F3B25D8()
{
  id v0 = objc_msgSend(self, sel_generalPasteboard);

  return v0;
}

uint64_t sub_22F3B2618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE548);
  v3[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAC0);
  v3[21] = swift_task_alloc();
  uint64_t v4 = sub_22F3BD448();
  v3[22] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[23] = v5;
  v3[24] = *(void *)(v5 + 64);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B2754, 0, 0);
}

uint64_t sub_22F3B2754()
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAC8);
  if (OUTLINED_FUNCTION_20_0())
  {
    uint64_t v2 = v1[19];
    sub_22F3AA744(v0, (uint64_t)(v1 + 2));
    uint64_t v3 = *(void **)(v2 + 16);
    v1[27] = v3;
    sub_22F3BD768();
    id v4 = v3;
    v1[28] = sub_22F3BD758();
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_16();
    return MEMORY[0x270FA2498](v5, v6, v7);
  }
  else
  {
    uint64_t v9 = v1[18];
    OUTLINED_FUNCTION_34();
    sub_22F3BA1B0((uint64_t)v0, (uint64_t)&unk_2686BEAD0);
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    OUTLINED_FUNCTION_9_1();
    sub_22F3A41A8(v9, v10);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v11();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_16();
    return v13(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

uint64_t sub_22F3B2928()
{
  OUTLINED_FUNCTION_25();
  uint64_t v1 = *(void **)(v0 + 216);
  swift_release();
  *(void *)(v0 + 232) = sub_22F3B2FA0();

  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_22F3B2994()
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19_0();
  if (v0[29])
  {
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    swift_task_alloc();
    OUTLINED_FUNCTION_29();
    v0[30] = v1;
    *uint64_t v1 = v2;
    v1[1] = sub_22F3B2B3C;
    OUTLINED_FUNCTION_16();
    return sub_22F3B31E8(v3, v4, v5);
  }
  else
  {
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v8();
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_16();
    return v10(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

uint64_t sub_22F3B2B3C()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v5 = v4;
  *(void *)(v6 + 248) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_22F3B2C18()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  uint64_t v4 = (void *)v0[29];
  if (EnumTagSinglePayload == 1)
  {
    sub_22F3BA1B0(v1, (uint64_t)&qword_2686BEAC0);
    sub_22F3BD138();
    sub_22F3A42F0(&qword_2686BEAE0, 255, MEMORY[0x263EFBB10]);
    OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v5();
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    uint64_t v7 = v0[25];
    uint64_t v8 = v0[23];
    uint64_t v9 = v0[24];
    uint64_t v10 = v0[20];
    uint64_t v22 = v10;
    uint64_t v23 = (void *)v0[29];
    uint64_t v24 = (uint64_t *)v0[17];
    uint64_t v11 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32);
    v11(v0[26], v1, v2);
    uint64_t v12 = sub_22F3BD788();
    OUTLINED_FUNCTION_23_0(v10, v13, v14, v12);
    uint64_t v15 = v7;
    OUTLINED_FUNCTION_5();
    v16();
    unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = 0;
    *(void *)(v18 + 24) = 0;
    v11(v18 + v17, v15, v2);
    *(void *)(v18 + ((v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = v23;
    id v19 = v23;
    sub_22F3BA73C(v22, (uint64_t)&unk_2686BEAF0, v18);
    swift_release();
    v24[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEA70);
    v24[4] = sub_22F3B9BDC(&qword_2686BEA78, &qword_2686BEA70);
    __swift_allocate_boxed_opaque_existential_1(v24);
    sub_22F3BD018();

    OUTLINED_FUNCTION_24_0();
    v20();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
  }
  return v6();
}

uint64_t sub_22F3B2F0C()
{
  OUTLINED_FUNCTION_2_2();

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v1();
}

void *sub_22F3B2FA0()
{
  id v1 = objc_msgSend(v0, sel_connectedScenes);
  sub_22F3A5168(0, &qword_2686BE9B8);
  sub_22F3B9EE8();
  OUTLINED_FUNCTION_42();
  uint64_t v2 = sub_22F3BD7A8();

  sub_22F3B8580(v2);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  self;
  uint64_t v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {
LABEL_13:

    return 0;
  }
  id v6 = objc_msgSend(v5, sel_windows);
  sub_22F3A5168(0, &qword_2686BEB18);
  unint64_t v7 = sub_22F3BD6D8();

  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_24:
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_22F3BDA28();
  if (!v8)
  {
LABEL_12:
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v9 = 4;
  while (1)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v10 = (id)MEMORY[0x230FB5F40](v9 - 4, v7);
    }
    else {
      id v10 = *(id *)(v7 + 8 * v9);
    }
    uint64_t v11 = v10;
    uint64_t v12 = v9 - 3;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (objc_msgSend(v10, sel_isKeyWindow)) {
      break;
    }

    ++v9;
    if (v12 == v8) {
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease_n();
  id v15 = objc_msgSend(v11, sel_rootViewController);
  if (!v15)
  {

    return 0;
  }
  uint64_t v16 = v15;
  id v17 = objc_msgSend(v15, sel_presentedViewController);
  if (v17)
  {
    do
    {
      uint64_t v13 = v17;

      id v17 = objc_msgSend(v13, sel_presentedViewController);
      uint64_t v16 = v13;
    }
    while (v17);
  }
  else
  {
    uint64_t v13 = v16;
  }

  return v13;
}

uint64_t sub_22F3B31E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_22F3BCFB8();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[9] = AssociatedTypeWitness;
  v4[10] = *(void *)(AssociatedTypeWitness - 8);
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B3330, 0, 0);
}

uint64_t sub_22F3B3330()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_31();
  sub_22F3BD098();
  swift_getAssociatedConformanceWitness();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *id v1 = v0;
  v1[1] = sub_22F3B33F4;
  uint64_t v2 = OUTLINED_FUNCTION_57();
  return MEMORY[0x270EE1B70](v2);
}

uint64_t sub_22F3B33F4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v5 = v4;
  *(void *)(v6 + 104) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_0();
  v7();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_22F3B3524()
{
  OUTLINED_FUNCTION_2_2();
  sub_22F3BCF98();
  OUTLINED_FUNCTION_24_0();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_4();
  return v1();
}

uint64_t sub_22F3B35B0()
{
  OUTLINED_FUNCTION_25();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v0();
}

uint64_t sub_22F3B3618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = sub_22F3BD448();
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B36D8, 0, 0);
}

uint64_t sub_22F3B36D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_36();
  uint64_t v16 = v14[19];
  uint64_t v15 = v14[20];
  uint64_t v17 = v14[18];
  uint64_t v31 = v14[17];
  uint64_t v18 = v14[16];
  sub_22F3A5168(0, &qword_2686BEAF8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_22F3BF310;
  sub_22F3A5168(0, &qword_2686BEB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
  *(void *)(v19 + 32) = sub_22F3B3A54(v15);
  sub_22F3BD6E8();
  id v20 = sub_22F3B3AF0();
  v14[21] = v20;
  v14[2] = v14;
  v14[7] = v14 + 15;
  v14[3] = sub_22F3B3898;
  uint64_t v21 = swift_continuation_init();
  v14[10] = MEMORY[0x263EF8330];
  v14[11] = 0x40000000;
  v14[12] = sub_22F3B3B78;
  v14[13] = &block_descriptor_56;
  v14[14] = v21;
  objc_msgSend(v20, sel_presentOverViewController_completionHandler_, v31, v14 + 10);
  OUTLINED_FUNCTION_21_0();
  return MEMORY[0x270FA23F0](v22, v23, v24, v25, v26, v27, v28, v29, v14 + 15, v31, v19, a12, a13, a14);
}

uint64_t sub_22F3B3898()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 176) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_22F3B3978()
{
  OUTLINED_FUNCTION_25();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_4();
  return v1();
}

uint64_t sub_22F3B39E0()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = *(void **)(v0 + 168);
  swift_willThrow();

  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v2();
}

id sub_22F3B3A54(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_22F3BD428();
  id v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  uint64_t v5 = sub_22F3BD448();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

id sub_22F3B3AF0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_22F3A5168(0, &qword_2686BEB00);
  uint64_t v1 = (void *)sub_22F3BD6C8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithItems_, v1);

  return v2;
}

uint64_t sub_22F3B3B78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_22F3B3C04(v3, (uint64_t)v4);
  }
  else
  {
    sub_22F3A5168(0, &qword_2686BEB00);
    uint64_t v6 = sub_22F3BD6D8();
    return sub_22F3B3C68(v3, v6);
  }
}

uint64_t sub_22F3B3C04(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEB08);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;

  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_22F3B3C68(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_22F3B3C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[28] = a2;
  v3[29] = a3;
  v3[27] = a1;
  uint64_t v4 = sub_22F3BCFC8();
  v3[30] = v4;
  v3[31] = *(void *)(v4 - 8);
  v3[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAC0);
  v3[33] = swift_task_alloc();
  uint64_t v5 = sub_22F3BD448();
  v3[34] = v5;
  v3[35] = *(void *)(v5 - 8);
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B3DE8, 0, 0);
}

uint64_t sub_22F3B3DE8()
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19_0();
  sub_22F3A41A8(*(void *)(v0 + 224), v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEB20);
  if (OUTLINED_FUNCTION_20_0())
  {
    sub_22F3AA744((long long *)(v0 + 96), v0 + 16);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    swift_task_alloc();
    OUTLINED_FUNCTION_29();
    *(void *)(v0 + 304) = v1;
    *uint64_t v1 = v2;
    v1[1] = sub_22F3B3FEC;
    OUTLINED_FUNCTION_16();
    return sub_22F3B463C(v3, v4, v5);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 224);
    OUTLINED_FUNCTION_34();
    sub_22F3BA1B0(v0 + 96, (uint64_t)&unk_2686BEB28);
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    OUTLINED_FUNCTION_9_1();
    sub_22F3A41A8(v8, v9);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v10();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_16();
    return v12(v11, v12, v13, v14, v15, v16, v17, v18);
  }
}

uint64_t sub_22F3B3FEC()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v5 = v4;
  *(void *)(v6 + 312) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_22F3B40C8()
{
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v1 = *(void *)(v0 + 272);
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    sub_22F3BA1B0(v2, (uint64_t)&unk_2686BEAC0);
    sub_22F3BD0B8();
    sub_22F3A42F0(&qword_2686BEB38, 255, MEMORY[0x263EFB9D0]);
    uint64_t v3 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_27_0(v3, v4);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v5();
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 288);
    uint64_t v8 = *(void *)(v0 + 296);
    uint64_t v9 = *(void *)(v0 + 280);
    uint64_t v10 = *(void *)(v0 + 248);
    uint64_t v29 = *(void *)(v0 + 256);
    uint64_t v30 = *(void *)(v0 + 240);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v8, v2, v1);
    sub_22F3A5168(0, &qword_2686BEAF8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_22F3BF310;
    sub_22F3A5168(0, &qword_2686BEB00);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v8, v1);
    *(void *)(v11 + 32) = sub_22F3B3A54(v7);
    sub_22F3BD6E8();
    id v12 = sub_22F3B3AF0();
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    swift_getDynamicType();
    sub_22F3BD148();
    int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 88))(v29, v30);
    if (v13 == *MEMORY[0x263EFB768])
    {
      objc_msgSend(v12, sel_setEditingMode_, 2);
    }
    else if (v13 == *MEMORY[0x263EFB760])
    {
      objc_msgSend(v12, sel_setEditingMode_, 1);
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
    }
    uint64_t v14 = *(void *)(v0 + 280);
    uint64_t v28 = *(void *)(v0 + 296);
    uint64_t v27 = *(void *)(v0 + 272);
    uint64_t v15 = *(void **)(v0 + 224);
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(uint64_t **)(v0 + 216);
    uint64_t v18 = v15[3];
    uint64_t v26 = v15[4];
    __swift_project_boxed_opaque_existential_1(v15, v18);
    uint64_t v19 = OUTLINED_FUNCTION_52();
    *(void *)(v19 + 16) = v16;
    *(void *)(v19 + 24) = v12;
    sub_22F3A41A8(v0 + 16, v0 + 136);
    uint64_t v20 = swift_allocObject();
    sub_22F3AA744((long long *)(v0 + 136), v20 + 16);
    *(void *)(OUTLINED_FUNCTION_37() + 16) = v12;
    uint64_t v21 = sub_22F3BCFB8();
    uint64_t v22 = sub_22F3A42F0(&qword_2686BEB70, 255, MEMORY[0x263EFB730]);
    *(void *)(v0 + 176) = v18;
    uint64_t v23 = MEMORY[0x263F8E628];
    *(void *)(v0 + 184) = v21;
    *(void *)(v0 + 192) = v23;
    *(void *)(v0 + 200) = v26;
    *(void *)(v0 + 208) = v22;
    v17[3] = sub_22F3BD318();
    v17[4] = swift_getWitnessTable();
    id v24 = v12;
    swift_retain();
    sub_22F3B5494(v17);
    swift_release();
    swift_release();
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v28, v27);
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
  }
  return v6();
}

uint64_t sub_22F3B45B4()
{
  OUTLINED_FUNCTION_2_2();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v1();
}

uint64_t sub_22F3B463C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_22F3BCFB8();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[9] = AssociatedTypeWitness;
  v4[10] = *(void *)(AssociatedTypeWitness - 8);
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B4784, 0, 0);
}

uint64_t sub_22F3B4784()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_31();
  sub_22F3BD168();
  swift_getAssociatedConformanceWitness();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3B4848;
  uint64_t v2 = OUTLINED_FUNCTION_57();
  return MEMORY[0x270EE1B70](v2);
}

uint64_t sub_22F3B4848()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v5 = v4;
  *(void *)(v6 + 104) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_0();
  v7();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_22F3B4978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a3;
  v4[18] = a4;
  v4[16] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEB78);
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEAC0);
  v4[20] = swift_task_alloc();
  uint64_t v5 = sub_22F3BD448();
  v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B4AAC, 0, 0);
}

uint64_t sub_22F3B4AAC()
{
  OUTLINED_FUNCTION_25();
  uint64_t v1 = *(void **)(v0[17] + 16);
  v0[25] = v1;
  sub_22F3BD768();
  id v2 = v1;
  v0[26] = sub_22F3BD758();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_33();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_22F3B4B3C()
{
  OUTLINED_FUNCTION_25();
  uint64_t v1 = *(void **)(v0 + 200);
  swift_release();
  *(void *)(v0 + 216) = sub_22F3B2FA0();

  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_22F3B4BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19_0();
  uint64_t v14 = v13[27];
  if (v14)
  {
    uint64_t v15 = (void *)v13[18];
    v13[2] = v13;
    v13[7] = v13 + 15;
    v13[3] = sub_22F3B4D8C;
    uint64_t v16 = swift_continuation_init();
    v13[10] = MEMORY[0x263EF8330];
    v13[11] = 0x40000000;
    v13[12] = sub_22F3B3B78;
    v13[13] = &block_descriptor_75;
    v13[14] = v16;
    objc_msgSend(v15, sel_presentOverViewController_completionHandler_, v14, v13 + 10);
    OUTLINED_FUNCTION_16();
    return MEMORY[0x270FA23F0](v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, v13);
  }
  else
  {
    sub_22F3BCE08();
    sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
    uint64_t v25 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_27_0(v25, v26);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v27();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_16();
    return v29(v28, v29, v30, v31, v32, v33, v34, v35);
  }
}

uint64_t sub_22F3B4D8C()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 224) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_22F3B4E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_36();
  unint64_t v15 = v14[15];
  if (!(v15 >> 62))
  {
    if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v38 = v14[20];
    uint64_t v37 = v14[21];
    swift_bridgeObjectRelease();
    __swift_storeEnumTagSinglePayload(v38, 1, 1, v37);
LABEL_10:
    id v39 = (void *)v14[27];
    sub_22F3BA1B0(v14[20], (uint64_t)&qword_2686BEAC0);
    sub_22F3BD0B8();
    sub_22F3A42F0(&qword_2686BEB38, 255, MEMORY[0x263EFB9D0]);
    uint64_t v40 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_27_0(v40, v41);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_12_1();
    v42();
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_22F3BDA28();
  swift_bridgeObjectRelease();
  if (!v36) {
    goto LABEL_9;
  }
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v16 = (id)MEMORY[0x230FB5F40](0, v15);
  }
  else
  {
    if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v16 = *(id *)(v15 + 32);
  }
  uint64_t v17 = v16;
  uint64_t v19 = v14[22];
  uint64_t v18 = v14[23];
  uint64_t v21 = v14[20];
  uint64_t v20 = v14[21];
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v17, sel_url);

  sub_22F3BD438();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
  v23(v21, v18, v20);
  OUTLINED_FUNCTION_63();
  __swift_storeEnumTagSinglePayload(v24, v25, v26, v20);
  if (__swift_getEnumTagSinglePayload(v21, 1, v20) == 1) {
    goto LABEL_10;
  }
  a10 = (void *)v14[27];
  uint64_t v27 = v14[24];
  uint64_t v28 = v14[21];
  uint64_t v29 = v14[22];
  uint64_t v30 = v14[19];
  uint64_t v31 = OUTLINED_FUNCTION_30();
  ((void (*)(uint64_t))v23)(v31);
  OUTLINED_FUNCTION_5();
  v32();
  uint64_t v33 = sub_22F3BD518();
  OUTLINED_FUNCTION_23_0(v30, v34, v35, v33);
  OUTLINED_FUNCTION_13_1();
  sub_22F3BCFA8();

  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_4();
LABEL_11:
  OUTLINED_FUNCTION_21_0();
  v44(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_22F3B5164()
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19_0();
  uint64_t v1 = *(void **)(v0 + 216);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_16();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_22F3B51F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  return MEMORY[0x270FA2498](sub_22F3B5210, 0, 0);
}

uint64_t sub_22F3B5210()
{
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  sub_22F3BD158();
  OUTLINED_FUNCTION_3_4();
  return v1();
}

uint64_t sub_22F3B5290(uint64_t a1)
{
  *(void *)(v1 + 120) = a1;
  return MEMORY[0x270FA2498](sub_22F3B52B0, 0, 0);
}

uint64_t sub_22F3B52B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_2_2();
  unint64_t v15 = (void *)v14[15];
  v14[2] = v14;
  v14[3] = sub_22F3B53A0;
  uint64_t v16 = swift_continuation_init();
  v14[10] = MEMORY[0x263EF8330];
  v14[11] = 0x40000000;
  v14[12] = sub_22F3B5488;
  v14[13] = &block_descriptor_74;
  v14[14] = v16;
  objc_msgSend(v15, sel_cancelPresentationWithCompletionHandler_, v14 + 10);
  return MEMORY[0x270FA23F0](v14 + 2, v17, v18, v19, v20, v21, v22, v23, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_22F3B53A0()
{
  OUTLINED_FUNCTION_25();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_22();
  *uint64_t v2 = v1;
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_22F3B5470()
{
  OUTLINED_FUNCTION_3_4();
  return v0();
}

uint64_t sub_22F3B5488(uint64_t a1)
{
  return j__swift_continuation_resume(*(void *)(a1 + 32));
}

uint64_t sub_22F3B5494@<X0>(uint64_t *a1@<X8>)
{
  sub_22F3BCFB8();
  sub_22F3A42F0(&qword_2686BEB70, 255, MEMORY[0x263EFB730]);
  sub_22F3BD318();
  sub_22F3B885C();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t result = sub_22F3BD308();
  *a1 = result;
  return result;
}

uint64_t sub_22F3B55C0(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEB80);
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_22F3BD128();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B56B0, 0, 0);
}

uint64_t sub_22F3B56B0()
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19_0();
  sub_22F3A41A8(v0[8], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
  OUTLINED_FUNCTION_58();
  int v1 = swift_dynamicCast();
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  if (v1)
  {
    OUTLINED_FUNCTION_63();
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v3);
    if (__swift_getEnumTagSinglePayload(v2, 1, v3) != 1)
    {
      uint64_t v7 = (uint64_t *)v0[7];
      (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[9], v0[10]);
      v7[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEB88);
      v7[4] = swift_getOpaqueTypeConformance2();
      __swift_allocate_boxed_opaque_existential_1(v7);
      swift_task_alloc();
      OUTLINED_FUNCTION_29();
      v0[13] = v8;
      *uint64_t v8 = v9;
      v8[1] = sub_22F3B590C;
      OUTLINED_FUNCTION_16();
      return MEMORY[0x270EE1628](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v0[9], 1, 1, v0[10]);
  }
  uint64_t v18 = v0[8];
  sub_22F3BA1B0(v0[9], (uint64_t)&unk_2686BEB80);
  sub_22F3BCE08();
  sub_22F3A42F0(&qword_2686BE9E0, 255, MEMORY[0x263EFB690]);
  OUTLINED_FUNCTION_9_1();
  sub_22F3A41A8(v18, v19);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_1();
  v20();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_16();
  return v22(v21, v22, v23, v24, v25, v26, v27, v28);
}

uint64_t sub_22F3B590C()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v5 = v4;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_22F3B59E8()
{
  OUTLINED_FUNCTION_25();
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_4();
  return v1();
}

uint64_t sub_22F3B5A64()
{
  OUTLINED_FUNCTION_25();
  uint64_t v1 = *(void *)(v0 + 56);
  OUTLINED_FUNCTION_6_2();
  v2();
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v3();
}

uint64_t sub_22F3B5AE8()
{
  OUTLINED_FUNCTION_25();
  v1[49] = v2;
  v1[50] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9A8);
  v1[51] = OUTLINED_FUNCTION_40();
  v1[52] = swift_task_alloc();
  sub_22F3BD768();
  v1[53] = OUTLINED_FUNCTION_49();
  uint64_t v4 = OUTLINED_FUNCTION_28_0();
  v1[54] = v4;
  v1[55] = v3;
  return MEMORY[0x270FA2498](sub_22F3B5BA0, v4, v3);
}

uint64_t sub_22F3B5BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_36();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_26AEBA7A0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_4_1();
  uint64_t v25 = OUTLINED_FUNCTION_58();
  sub_22F3B9848(v25, v26, v27);
  if (*(void *)(v22 + 128))
  {
    uint64_t v28 = (void *)(v22 + 64);
    sub_22F3AA744((long long *)(v22 + 104), v22 + 64);
    if (qword_26AEBAA10 != -1) {
      swift_once();
    }
    uint64_t v29 = *(void *)(v22 + 392);
    uint64_t v30 = sub_22F3BD548();
    *(void *)(v22 + 448) = __swift_project_value_buffer(v30, (uint64_t)qword_26AEBAAD0);
    sub_22F3A41A8(v29, v22 + 144);
    uint64_t v31 = sub_22F3BD528();
    os_log_type_t v32 = sub_22F3BD838();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      a11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136446210;
      sub_22F3A41A8(v22 + 144, v22 + 184);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
      uint64_t v34 = sub_22F3BD658();
      *(void *)(v22 + 384) = sub_22F3A1B4C(v34, v35, &a11);
      sub_22F3BD908();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0(v22 + 144);
      _os_log_impl(&dword_22F39E000, v31, v32, "Invoking navigation for %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      uint64_t v28 = (void *)(v22 + 64);
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0(v22 + 144);
    }

    uint64_t v49 = *(void *)(v22 + 400);
    uint64_t v50 = *(void *)(v22 + 96);
    __swift_project_boxed_opaque_existential_1(v28, *(void *)(v22 + 88));
    uint64_t v51 = *(void **)(v49 + 16);
    *(void *)(v22 + 456) = v51;
    uint64_t v62 = *(void *)(v50 + 8) + **(int **)(v50 + 8);
    v51;
    swift_task_alloc();
    OUTLINED_FUNCTION_29();
    *(void *)(v22 + 464) = v52;
    *uint64_t v52 = v53;
    v52[1] = sub_22F3B5FC8;
    OUTLINED_FUNCTION_21_0();
    return v60(v54, v55, v56, v57, v58, v59, v60, v61, v62, v50 + 8, a11, a12, a13, a14);
  }
  else
  {
    swift_release();
    sub_22F3BA1B0(v22 + 104, (uint64_t)&qword_26AEBA828);
    if (qword_26AEBAA10 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_22F3BD548();
    __swift_project_value_buffer(v36, (uint64_t)qword_26AEBAAD0);
    uint64_t v37 = sub_22F3BD528();
    os_log_type_t v38 = sub_22F3BD818();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v39 = 0;
      _os_log_impl(&dword_22F39E000, v37, v38, "App does not adopt IntentSceneConfigurator, skipping", v39, 2u);
      OUTLINED_FUNCTION_8();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
    OUTLINED_FUNCTION_21_0();
    return v41(v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_22F3B5FC8()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_7_1();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v6 = v5;
  *(void *)(v3 + 472) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 432);
    uint64_t v8 = *(void *)(v3 + 440);
    uint64_t v9 = sub_22F3B6A88;
  }
  else
  {

    uint64_t v7 = *(void *)(v3 + 432);
    uint64_t v8 = *(void *)(v3 + 440);
    uint64_t v9 = sub_22F3B60B0;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

void sub_22F3B60B0()
{
  uint64_t v1 = (void *)v0[47];
  if (v1)
  {
    v0[62] = v1;
    v0[63] = v1;
    __swift_project_boxed_opaque_existential_1(v0 + 8, v0[11]);
    id v2 = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[64] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_22F3B68E8;
    OUTLINED_FUNCTION_32();
    __asm { BRAA            X5, X16 }
  }
  if (objc_msgSend(*(id *)(v0[50] + 16), sel_supportsMultipleScenes))
  {
    sub_22F3A41A8(v0[49], (uint64_t)(v0 + 28));
    uint64_t v6 = sub_22F3BD528();
    os_log_type_t v7 = sub_22F3BD838();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136446210;
      sub_22F3A41A8((uint64_t)(v0 + 28), (uint64_t)(v0 + 33));
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9C0);
      uint64_t v9 = sub_22F3BD658();
      v0[46] = sub_22F3A1B4C(v9, v10, &v22);
      sub_22F3BD908();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 28));
      _os_log_impl(&dword_22F39E000, v6, v7, "Requesting new UIscene for %{public}s)", v8, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 28));
    }

    uint64_t v14 = *(void **)(v0[50] + 16);
    v0[6] = sub_22F3B6BAC;
    v0[7] = 0;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_22F3B6DA0;
    v0[5] = &block_descriptor_1;
    uint64_t v15 = _Block_copy(v0 + 2);
    id v16 = v14;
    objc_msgSend(v16, sel_requestSceneSessionActivation_userActivity_options_errorHandler_, 0, 0, 0, v15);
    _Block_release(v15);

    id v17 = objc_msgSend(self, sel_defaultCenter);
    v0[60] = sub_22F3BD8A8();

    swift_task_alloc();
    OUTLINED_FUNCTION_29();
    v0[61] = v18;
    *uint64_t v18 = v19;
    v18[1] = sub_22F3B650C;
    OUTLINED_FUNCTION_32();
    __asm { BR              X2 }
  }
  swift_release();
  sub_22F3B90A8();
  OUTLINED_FUNCTION_9_1();
  unsigned char *v11 = 2;
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 8));
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_32();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_22F3B650C()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_22();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  swift_release();
  uint64_t v4 = *(void *)(v1 + 440);
  uint64_t v5 = *(void *)(v1 + 432);
  return MEMORY[0x270FA2498](sub_22F3B6644, v5, v4);
}

uint64_t sub_22F3B6644()
{
  OUTLINED_FUNCTION_22_0();
  uint64_t v1 = *(void *)(v0 + 408);
  sub_22F3B9848(*(void *)(v0 + 416), v1, &qword_2686BE9A8);
  uint64_t v2 = sub_22F3BD3B8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 416);
  if (EnumTagSinglePayload == 1)
  {
    sub_22F3BA1B0(*(void *)(v0 + 416), (uint64_t)&qword_2686BE9A8);
    sub_22F3BA1B0(v4, (uint64_t)&qword_2686BE9A8);
    *(_OWORD *)(v0 + 304) = 0u;
    *(_OWORD *)(v0 + 320) = 0u;
LABEL_8:
    sub_22F3BA1B0(v0 + 304, (uint64_t)&qword_26AEBA8D0);
LABEL_9:
    swift_release();
    sub_22F3B90A8();
    uint64_t v14 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_55(v14, v15);
    __swift_destroy_boxed_opaque_existential_0(v0 + 64);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_11_0();
    return v16();
  }
  sub_22F3BD3A8();
  sub_22F3BA1B0(v5, (uint64_t)&qword_2686BE9A8);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_4();
  v6();
  if (!*(void *)(v0 + 328)) {
    goto LABEL_8;
  }
  sub_22F3A5168(0, &qword_2686BE9B8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v7 = *(void **)(v0 + 360);
  *(void *)(v0 + 496) = 0;
  *(void *)(v0 + 504) = v7;
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 64), v8);
  id v17 = (uint64_t (*)(id, uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 16) + **(int **)(v9 + 16));
  id v10 = v7;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v11;
  void *v11 = v0;
  v11[1] = sub_22F3B68E8;
  uint64_t v12 = *(void *)(v0 + 392);
  return v17(v10, v12, v8, v9);
}

uint64_t sub_22F3B68E8()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_7_1();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 520) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v1 + 440);
  uint64_t v6 = *(void *)(v1 + 432);
  if (v0) {
    uint64_t v7 = sub_22F3B6B14;
  }
  else {
    uint64_t v7 = sub_22F3B69F8;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_22F3B69F8()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v2 = *(void **)(v0 + 496);
  uint64_t v1 = *(void **)(v0 + 504);

  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_4();
  return v3();
}

uint64_t sub_22F3B6A88()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = *(void **)(v0 + 456);
  swift_release();

  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v2();
}

uint64_t sub_22F3B6B14()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v2 = *(void **)(v0 + 496);
  uint64_t v1 = *(void **)(v0 + 504);

  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v3();
}

void sub_22F3B6BAC(void *a1)
{
  if (qword_26AEBAA10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22F3BD548();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AEBAAD0);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_22F3BD528();
  os_log_type_t v5 = sub_22F3BD838();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_getErrorValue();
    uint64_t v8 = sub_22F3BDAA8();
    sub_22F3A1B4C(v8, v9, &v11);
    sub_22F3BD908();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22F39E000, oslog, v5, "Unable to request scene activation. %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FB6730](v7, -1, -1);
    MEMORY[0x230FB6730](v6, -1, -1);
  }
  else
  {
  }
}

void sub_22F3B6DA0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22F3B6E08(uint64_t a1, void *a2)
{
  v2[3] = a1;
  v2[4] = a2;
  v2[5] = *a2;
  uint64_t v3 = sub_22F3BD3B8();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE9A8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_22F3BD898();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22F3B6F7C, 0, 0);
}

uint64_t sub_22F3B6F7C()
{
  OUTLINED_FUNCTION_19_0();
  v0[2] = v0[4];
  sub_22F3A42F0(&qword_2686BE9C8, 255, MEMORY[0x263F07C98]);
  swift_retain();
  sub_22F3BD798();
  v0[13] = *MEMORY[0x263F83948];
  sub_22F3A42F0(&qword_2686BE9D0, 255, MEMORY[0x263F07C88]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3B70CC;
  uint64_t v2 = OUTLINED_FUNCTION_47();
  return MEMORY[0x270FA1E80](v2);
}

uint64_t sub_22F3B70CC()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_7_1();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v6 = v5;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_6_2();
    v7();
  }
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_22F3B71B8()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    OUTLINED_FUNCTION_6_2();
    v3();
    uint64_t v4 = OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_23_0(v4, v5, v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
    return v8();
  }
  else
  {
    uint64_t v11 = v0[7];
    uint64_t v10 = v0[8];
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
    v0[16] = v12;
    v0[17] = (v11 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v12(v10, v1, v2);
    sub_22F3BD768();
    v0[18] = OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_33();
    return MEMORY[0x270FA2498](v13, v14, v15);
  }
}

uint64_t sub_22F3B72E0()
{
  OUTLINED_FUNCTION_2_2();
  swift_release();
  uint64_t v1 = (void *)sub_22F3BD398();
  uint64_t v2 = sub_22F3BD648();
  uint64_t v4 = v3;
  if (v2 == sub_22F3BD648() && v4 == v5)
  {
    char v7 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_59();
    char v7 = sub_22F3BDA98();
  }
  *(unsigned char *)(v0 + 152) = v7 & 1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_22F3B73AC()
{
  OUTLINED_FUNCTION_19_0();
  if (*(unsigned char *)(v0 + 152) == 1)
  {
    uint64_t v1 = *(void (**)(uint64_t))(v0 + 128);
    OUTLINED_FUNCTION_6_2();
    v2();
    uint64_t v3 = OUTLINED_FUNCTION_58();
    v1(v3);
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_63();
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_4();
    return v8();
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
    v10();
    sub_22F3A42F0(&qword_2686BE9D0, 255, MEMORY[0x263F07C88]);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v11;
    void *v11 = v0;
    v11[1] = sub_22F3B70CC;
    uint64_t v12 = OUTLINED_FUNCTION_47();
    return MEMORY[0x270FA1E80](v12);
  }
}

uint64_t sub_22F3B7528()
{
  OUTLINED_FUNCTION_25();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v0();
}

uint64_t sub_22F3B7598()
{
  OUTLINED_FUNCTION_25();
  v0[3] = v1;
  uint64_t v2 = sub_22F3BD048();
  v0[4] = v2;
  OUTLINED_FUNCTION_1_3(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_56();
  uint64_t v4 = sub_22F3BCE38();
  v0[7] = v4;
  OUTLINED_FUNCTION_1_3(v4);
  v0[8] = v5;
  v0[9] = OUTLINED_FUNCTION_56();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEBA8F0);
  v0[10] = OUTLINED_FUNCTION_56();
  uint64_t v6 = sub_22F3BD188();
  v0[11] = v6;
  OUTLINED_FUNCTION_1_3(v6);
  v0[12] = v7;
  v0[13] = OUTLINED_FUNCTION_40();
  v0[14] = swift_task_alloc();
  uint64_t v8 = sub_22F3BD088();
  v0[15] = v8;
  OUTLINED_FUNCTION_1_3(v8);
  v0[16] = v9;
  v0[17] = OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_22F3B76E8()
{
  sub_22F3BD268();
  sub_22F3BD248();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_22F3B95B0(v1);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_22F3BD258();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v0[16];
    unint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v22 = *(void *)(v4 + 72);
    uint64_t v20 = v0[12];
    uint64_t v21 = (void (**)(uint64_t))(v20 + 32);
    swift_bridgeObjectRetain();
    uint64_t v6 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v24 = v3;
      uint64_t v7 = v0[10];
      uint64_t v23 = v0[11];
      OUTLINED_FUNCTION_5();
      v8();
      v0[2] = MEMORY[0x263F8EE78];
      sub_22F3A42F0(&qword_26AEBA900, 255, MEMORY[0x263EFB6A0]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AEBA918);
      sub_22F3B9BDC((unint64_t *)&qword_26AEBA920, &qword_26AEBA918);
      sub_22F3BD938();
      sub_22F3BD038();
      sub_22F3BD078();
      OUTLINED_FUNCTION_4();
      v9();
      OUTLINED_FUNCTION_4();
      v10();
      OUTLINED_FUNCTION_4();
      v11();
      if (__swift_getEnumTagSinglePayload(v7, 1, v23) == 1)
      {
        sub_22F3BA1B0(v0[10], (uint64_t)&unk_26AEBA8F0);
      }
      else
      {
        uint64_t v12 = *v21;
        ((void (*)(void, void, void))*v21)(v0[14], v0[10], v0[11]);
        uint64_t v13 = OUTLINED_FUNCTION_42();
        v12(v13);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_22F3B90F4(0, *(void *)(v6 + 16) + 1, 1, v6);
        }
        unint64_t v15 = *(void *)(v6 + 16);
        unint64_t v14 = *(void *)(v6 + 24);
        if (v15 >= v14 >> 1) {
          uint64_t v6 = sub_22F3B90F4(v14 > 1, v15 + 1, 1, v6);
        }
        uint64_t v16 = v0[13];
        uint64_t v17 = v0[11];
        *(void *)(v6 + 16) = v15 + 1;
        ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v6+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v15, v16, v17);
      }
      v5 += v22;
      --v3;
    }
    while (v24 != 1);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(uint64_t))v0[1];
  return v18(v6);
}

uint64_t sub_22F3B7ADC()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22F3B7B04()
{
  sub_22F3B7ADC();
  uint64_t v0 = OUTLINED_FUNCTION_44();

  return MEMORY[0x270FA0228](v0);
}

uint64_t sub_22F3B7B30()
{
  v1[2] = v0;
  v1[3] = *v0;
  sub_22F3BD768();
  v1[4] = sub_22F3BD758();
  uint64_t v3 = sub_22F3BD738();
  return MEMORY[0x270FA2498](sub_22F3B7BF0, v3, v2);
}

uint64_t sub_22F3B7BF0()
{
  OUTLINED_FUNCTION_25();
  swift_release();
  sub_22F3A42F0((unint64_t *)&unk_26AEBA960, v1, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  uint64_t v2 = sub_22F3BCED8();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_22F3B7C94()
{
  v1[2] = v0;
  v1[3] = *v0;
  sub_22F3BD768();
  v1[4] = sub_22F3BD758();
  uint64_t v3 = sub_22F3BD738();
  return MEMORY[0x270FA2498](sub_22F3B7D54, v3, v2);
}

uint64_t sub_22F3B7D54()
{
  OUTLINED_FUNCTION_25();
  swift_release();
  sub_22F3A42F0((unint64_t *)&unk_26AEBA960, v1, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  uint64_t v2 = sub_22F3BCEC8();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_22F3B7DF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3B7EB4;
  return sub_22F3B1530();
}

uint64_t sub_22F3B7EB4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v3 = v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v2 + 8);
  if (!v0) {
    uint64_t v4 = OUTLINED_FUNCTION_30();
  }
  return v5(v4);
}

uint64_t sub_22F3B7F8C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3B8020;
  return sub_22F3B5AE8();
}

uint64_t sub_22F3B8020()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_22();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v3();
}

uint64_t sub_22F3B80E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3B8174;
  return sub_22F3B7598();
}

uint64_t sub_22F3B8174()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_22F3B8244(uint64_t a1)
{
  return MEMORY[0x270EE0A68](a1, *v1);
}

uint64_t sub_22F3B8270(uint64_t a1)
{
  return MEMORY[0x270EE0A68](a1, *v1);
}

uint64_t sub_22F3B829C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *v5;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_22F3BA3FC;
  return MEMORY[0x270EE0A60](a1, a2, a3, v11, a5);
}

uint64_t sub_22F3B8388()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3B8434;
  return sub_22F3A9420();
}

uint64_t sub_22F3B8434()
{
  OUTLINED_FUNCTION_25();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_22();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_22F3B8500()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22F3B8538(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

void sub_22F3B8580(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22F3BD948();
    sub_22F3A5168(0, &qword_2686BE9B8);
    sub_22F3B9EE8();
    sub_22F3BD7B8();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    int64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v3 = 0;
  }
  uint64_t v16 = v2;
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    int64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v8)
    {
      unint64_t v14 = *(void *)(v17 + 8 * v13);
      int64_t v11 = v3 + 1;
      if (v14) {
        goto LABEL_28;
      }
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_34;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      int64_t v11 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_34;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      int64_t v11 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_34;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            if (!objc_msgSend(v12, sel_activationState, v16))
            {
              self;
              if (swift_dynamicCastObjCClass()) {
                break;
              }
            }

            int64_t v3 = v11;
            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!sub_22F3BD958()) {
              break;
            }
            sub_22F3A5168(0, &qword_2686BE9B8);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v12 = v23;
            swift_unknownObjectRelease();
            int64_t v11 = v3;
            uint64_t v9 = v4;
          }
          while (v23);
        }
        goto LABEL_34;
      }
      int64_t v11 = v3 + 5;
      if (v3 + 5 < v8)
      {
        unint64_t v14 = *(void *)(v17 + 8 * v11);
        if (!v14)
        {
          int64_t v15 = v3 + 6;
          while (v15 < v8)
          {
            unint64_t v14 = *(void *)(v17 + 8 * v15++);
            if (v14)
            {
              int64_t v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_34;
        }
        goto LABEL_28;
      }
    }
LABEL_34:
    sub_22F3B9828();
    return;
  }
  __break(1u);
}

id sub_22F3B885C()
{
  id v0 = objc_msgSend(self, sel_progressWithTotalUnitCount_, 0);

  return v0;
}

uint64_t UIView.isVisible.getter()
{
  return objc_msgSend(v0, sel_isHiddenOrHasHiddenAncestor) ^ 1;
}

void UIView.visualState.getter()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v7 = v0;
    objc_msgSend(v2, sel_state);
    goto LABEL_6;
  }
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    id v7 = v0;
    objc_msgSend(v4, sel_isSelected);
    objc_msgSend(v4, sel_isHighlighted);
    objc_msgSend(v4, sel_isFocused);
    objc_msgSend(v4, sel_isEditing);
LABEL_6:
    sub_22F3BCE18();

    return;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = v0;
    objc_msgSend(v6, sel_isSelected);
    objc_msgSend(v6, sel_isHighlighted);
    objc_msgSend(v6, sel_isFocused);
    goto LABEL_6;
  }
  objc_msgSend(v0, sel_isFocused);

  sub_22F3BCE18();
}

uint64_t UIView.geometry.getter()
{
  id v1 = objc_msgSend(v0, sel_window);
  if (v1
    && (uint64_t v2 = v1,
        id v3 = objc_msgSend(v1, sel_screen),
        v2,
        id v4 = objc_msgSend(v3, sel_fixedCoordinateSpace),
        v3,
        v4))
  {
    objc_msgSend(v0, sel_frame);
    objc_msgSend(v0, sel_convertPoint_toCoordinateSpace_, v4);
    v7.origin.x = OUTLINED_FUNCTION_60();
    CGRectGetWidth(v7);
    v8.origin.x = OUTLINED_FUNCTION_60();
    CGRectGetHeight(v8);
    sub_22F3BD028();
    return swift_unknownObjectRelease();
  }
  else
  {
    return sub_22F3BD038();
  }
}

uint64_t sub_22F3B8C2C()
{
  return UIView.isVisible.getter() & 1;
}

void sub_22F3B8C54()
{
}

uint64_t sub_22F3B8C78()
{
  return UIView.geometry.getter();
}

id sub_22F3B8C9C(uint64_t a1, uint64_t a2)
{
  return sub_22F3B8CB4(a1, a2, (SEL *)&selRef_frame);
}

id sub_22F3B8CA8(uint64_t a1, uint64_t a2)
{
  return sub_22F3B8CB4(a1, a2, (SEL *)&selRef_bounds);
}

id sub_22F3B8CB4(uint64_t a1, uint64_t a2, SEL *a3)
{
  return sub_22F3B8CDC(a3);
}

id sub_22F3B8CDC(SEL *a1)
{
  return [v1 *a1];
}

void **initializeBufferWithCopyOfBuffer for IntentSceneConfiguration(void **a1, void **a2)
{
  id v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for IntentSceneConfiguration(id *a1)
{
}

void **assignWithCopy for IntentSceneConfiguration(void **a1, void **a2)
{
  id v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for IntentSceneConfiguration(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for IntentSceneConfiguration(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IntentSceneConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_22F3B8E3C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_22F3B8E54(void *result, int a2)
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
  *uint64_t result = v2;
  return result;
}

void type metadata accessor for IntentSceneConfiguration()
{
}

uint64_t dispatch thunk of IntentSceneConfigurator.application(_:sceneFor:)()
{
  OUTLINED_FUNCTION_22_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 8) + **(int **)(v0 + 8));
  uint64_t v10 = swift_task_alloc();
  int64_t v11 = (void *)OUTLINED_FUNCTION_10_0(v10);
  void *v11 = v12;
  v11[1] = sub_22F3BA400;
  return v14(v9, v7, v5, v3, v1);
}

uint64_t dispatch thunk of IntentSceneConfigurator.scene(_:navigateToViewsFor:)()
{
  OUTLINED_FUNCTION_22_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  int64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 16) + **(int **)(v1 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22F3BA400;
  return v11(v8, v6, v4, v2);
}

void type metadata accessor for DefaultIntentSceneConfigurator()
{
}

unint64_t sub_22F3B90A8()
{
  unint64_t result = qword_2686BE980;
  if (!qword_2686BE980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2686BE980);
  }
  return result;
}

uint64_t sub_22F3B90F4(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
    int64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE990);
  uint64_t v10 = *(void *)(sub_22F3BD188() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_22F3BDA08();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_22F3BD188() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_22F3B9480(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22F3B9320(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_22F3B9320(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_22F3BD188() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_22F3BDA38();
  __break(1u);
  return result;
}

uint64_t sub_22F3B9480(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_22F3BDA38();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_22F3BD188(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_22F3BD188();
    return MEMORY[0x270FA01D8](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_22F3B95B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE998);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 4);
  uint64_t v5 = sub_22F3B9694(&v7, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_22F3B9828();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_22F3B9694(void *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_DWORD *)(*(void *)(a4 + 48) + 4 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_22F3B9828()
{
  return swift_release();
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

uint64_t sub_22F3B9848(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_2();
  uint64_t v4 = OUTLINED_FUNCTION_42();
  v5(v4);
  return a2;
}

uint64_t sub_22F3B98A4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_46();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_22F3BA400;
  uint64_t v3 = OUTLINED_FUNCTION_25_0();
  return sub_22F3B3C88(v3, v4, v5);
}

uint64_t sub_22F3B9934()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_46();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_22F3BA400;
  uint64_t v3 = OUTLINED_FUNCTION_25_0();
  return sub_22F3B2618(v3, v4, v5);
}

uint64_t sub_22F3B99C4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F3B99FC()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_46();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_22F3BA400;
  uint64_t v3 = OUTLINED_FUNCTION_25_0();
  return sub_22F3B1B54(v3, v4, v5);
}

uint64_t sub_22F3B9A8C()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_44();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_22F3B9ABC()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_22F3BA400;
  uint64_t v3 = OUTLINED_FUNCTION_14_0();
  return sub_22F3B10D8(v3, v4, v5, v6);
}

uint64_t sub_22F3B9B4C()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_22F3B8020;
  uint64_t v3 = OUTLINED_FUNCTION_14_0();
  return sub_22F3B10D8(v3, v4, v5, v6);
}

uint64_t sub_22F3B9BDC(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_22F3B9C20()
{
  unint64_t result = qword_2686BEA80;
  if (!qword_2686BEA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BEA80);
  }
  return result;
}

unint64_t sub_22F3B9C6C()
{
  unint64_t result = qword_2686BEA88;
  if (!qword_2686BEA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BEA88);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x230FB6730);
  }
  return result;
}

uint64_t sub_22F3B9D0C()
{
  uint64_t v1 = sub_22F3BD448();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_22F3B9DF4()
{
  OUTLINED_FUNCTION_19_0();
  uint64_t v2 = v1;
  uint64_t v3 = sub_22F3BD448();
  OUTLINED_FUNCTION_1_3(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v10 = *(void *)(v0 + 24);
  uint64_t v11 = v0 + v8;
  uint64_t v12 = *(void *)(v0 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = swift_task_alloc();
  unint64_t v14 = (void *)OUTLINED_FUNCTION_10_0(v13);
  *unint64_t v14 = v15;
  v14[1] = sub_22F3BA400;
  return sub_22F3B3618(v2, v9, v10, v11, v12);
}

unint64_t sub_22F3B9EE8()
{
  unint64_t result = qword_2686BEB10;
  if (!qword_2686BEB10)
  {
    sub_22F3A5168(255, &qword_2686BE9B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BEB10);
  }
  return result;
}

uint64_t sub_22F3B9F48()
{
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_44();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_22F3B9F80()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_22F3BA400;
  uint64_t v3 = OUTLINED_FUNCTION_14_0();
  return sub_22F3B4978(v3, v4, v5, v6);
}

uint64_t sub_22F3BA010()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22F3BA048()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_46();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22F3BA400;
  uint64_t v3 = OUTLINED_FUNCTION_30();
  return sub_22F3B51F0(v3, v4, v0 + 16);
}

uint64_t sub_22F3BA0E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F3BA120()
{
  OUTLINED_FUNCTION_25();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22F3BA400;
  return sub_22F3B5290(v2);
}

uint64_t sub_22F3BA1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)OUTLINED_FUNCTION_27_0(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(v3);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_4();
  v4();
  return v2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_22F3BA20C(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22F3BA294(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22F3BA360);
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

uint64_t sub_22F3BA388(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22F3BA390(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for IntentNavigationError()
{
}

unint64_t sub_22F3BA3AC()
{
  unint64_t result = qword_2686BEB90;
  if (!qword_2686BEB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2686BEB90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_22F3BD738();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return *(void *)(v0 + 24);
}

double OUTLINED_FUNCTION_34()
{
  double result = 0.0;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(void *)(v0 + 32) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return *(void *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return *(void *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_22F3BD758();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_53()
{
  uint64_t v2 = *(void *)(v0 + 144);
  return sub_22F3A41A8(v2, v0 + 56);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return *(void *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_55(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return *(void *)(v0 + 64);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59()
{
  return v0;
}

double OUTLINED_FUNCTION_60()
{
  return v0;
}

uint64_t sub_22F3BA73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_22F3BD788();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_22F3A36F0(a1, &qword_2686BE548);
  }
  else
  {
    sub_22F3BD778();
    OUTLINED_FUNCTION_4();
    v6();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22F3BD738();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

BOOL sub_22F3BA880(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22F3BA890()
{
  return sub_22F3BDB08();
}

uint64_t sub_22F3BA8B8()
{
  return sub_22F3BDB18();
}

BOOL sub_22F3BA900(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22F3BA880(*a1, *a2);
}

uint64_t sub_22F3BA90C()
{
  return sub_22F3BA8B8();
}

uint64_t sub_22F3BA914()
{
  return sub_22F3BA890();
}

void sub_22F3BA978(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_22F3A2108(v1);
}

void (*sub_22F3BA9A8(void *a1))(id **a1, char a2)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x230FB67E0](v5);
  return sub_22F3BAA2C;
}

void sub_22F3BAA2C(id **a1, char a2)
{
  int v3 = *a1;
  id v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if (a2)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    sub_22F3A2310();
  }

  free(v3);
}

uint64_t sub_22F3BAAB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  void v5[6] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE540);
  v5[7] = swift_task_alloc();
  sub_22F3BD768();
  v5[8] = sub_22F3BD758();
  uint64_t v7 = sub_22F3BD738();
  v5[9] = v7;
  v5[10] = v6;
  return MEMORY[0x270FA2498](sub_22F3BAB78, v7, v6);
}

uint64_t sub_22F3BAB78()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  id v4 = __swift_project_boxed_opaque_existential_1(v1, v2);
  sub_22F3BD338();
  v0[11] = sub_22F3BD328();
  uint64_t v8 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x263EFBF28] + MEMORY[0x263EFBF28]);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[12] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_22F3BAC64;
  uint64_t v6 = v0[7];
  return v8(v6, v4, v2, v3);
}

uint64_t sub_22F3BAC64()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_15_2();
  *id v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v6 = v5;
  v3[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    uint64_t v9 = sub_22F3BAE1C;
  }
  else
  {
    swift_release();
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    uint64_t v9 = sub_22F3BAD48;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_22F3BAD48()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  swift_release();
  uint64_t v3 = sub_22F3BD288();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v3);
  uint64_t v4 = v2 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier;
  swift_beginAccess();
  sub_22F3BC4F0(v1, v4, &qword_2686BE540);
  swift_endAccess();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_22F3BAE1C()
{
  OUTLINED_FUNCTION_25();
  swift_release();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return v0();
}

uint64_t sub_22F3BAE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_22F3BD768();
  v4[3] = sub_22F3BD758();
  uint64_t v6 = sub_22F3BD738();
  v4[4] = v6;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_22F3BAF24, v6, v5);
}

uint64_t sub_22F3BAF24()
{
  OUTLINED_FUNCTION_25();
  sub_22F3BD338();
  *(void *)(v0 + 48) = sub_22F3BD328();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_21_1();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3BAFC4;
  uint64_t v2 = OUTLINED_FUNCTION_17_1();
  return v3(v2);
}

uint64_t sub_22F3BAFC4()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_15_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v6 = v5;
  v3[8] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[4];
    uint64_t v8 = v3[5];
    uint64_t v9 = sub_22F3BB108;
  }
  else
  {
    swift_release();
    uint64_t v7 = v3[4];
    uint64_t v8 = v3[5];
    uint64_t v9 = sub_22F3BB0A8;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_22F3BB0A8()
{
  OUTLINED_FUNCTION_25();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22F3BB108()
{
  OUTLINED_FUNCTION_25();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_11_0();
  return v0();
}

uint64_t sub_22F3BB174()
{
  uint64_t v0 = sub_22F3BD288();
  OUTLINED_FUNCTION_5_2(v0);
  OUTLINED_FUNCTION_19_1();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_10_0(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_22F3B8020;
  uint64_t v4 = OUTLINED_FUNCTION_12_2();
  return sub_22F3BAE8C(v4, v5, v6, v7);
}

uint64_t sub_22F3BB21C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_14_1();
  v4();
  return a2;
}

uint64_t sub_22F3BB270()
{
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 40);

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_22F3BB2B8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_10_0(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_22F3BA400;
  return sub_22F3BAAB0(a1, v3, v4, v5, (uint64_t)(v1 + 5));
}

void UIAppIntentInteraction.__allocating_init<A>(intent:perform:)()
{
  id v1 = objc_allocWithZone(v0);
  UIAppIntentInteraction.init<A>(intent:perform:)();
}

void UIAppIntentInteraction.__allocating_init<A>(intent:perform:suggestedIntent:)()
{
  id v1 = objc_allocWithZone(v0);
  UIAppIntentInteraction.init<A>(intent:perform:suggestedIntent:)();
}

void UIAppIntentInteraction.init<A>(intent:perform:suggestedIntent:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v23 = v5;
  uint64_t v7 = v6;
  uint64_t v8 = sub_22F3BCDF8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent];
  *(_OWORD *)uint64_t v15 = 0u;
  *(_OWORD *)(v15 + 16) = 0u;
  *(void *)(v15 + 32) = 0;
  uint64_t v16 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
  uint64_t v17 = sub_22F3BD288();
  OUTLINED_FUNCTION_23_0(v16, v18, v19, v17);
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] = 1;
  uint64_t v20 = v0;
  sub_22F3A271C(v7);
  sub_22F3BCDD8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 32))(&v20[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode], v14, v8);
  v25[3] = v4;
  v25[4] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  uint64_t v22 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v22 + 16))(boxed_opaque_existential_1, v23, v4);
  swift_beginAccess();
  sub_22F3BC4F0((uint64_t)v25, v15, &qword_2686BE530);
  swift_endAccess();
  sub_22F3BCF88();
  sub_22F3BCF68();
  sub_22F3BCDE8();
  sub_22F3BCF58();
  swift_release();

  v24.receiver = v20;
  v24.super_class = (Class)type metadata accessor for UIAppIntentInteraction();
  objc_msgSendSuper2(&v24, sel_init);
  sub_22F3A272C(v7);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v4);
  OUTLINED_FUNCTION_10();
}

void UIAppIntentInteraction.__deallocating_deinit()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = sub_22F3BD088();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_1();
  uint64_t v58 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE548);
  uint64_t v7 = OUTLINED_FUNCTION_24(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE540);
  uint64_t v12 = OUTLINED_FUNCTION_24(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v62 = v13;
  uint64_t v14 = sub_22F3BD288();
  OUTLINED_FUNCTION_0_4();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v59 = v19;
  uint64_t v60 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v61 = (char *)&v55 - v20;
  if (qword_26AEBAA10 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_22F3BD548();
  __swift_project_value_buffer(v21, (uint64_t)qword_26AEBAAD0);
  uint64_t v22 = v0;
  uint64_t v23 = sub_22F3BD528();
  os_log_type_t v24 = sub_22F3BD818();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v57 = v1;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v56 = v3;
    uint64_t v28 = v27;
    uint64_t v65 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v55 = v16;
    sub_22F3BCDE8();
    uint64_t v29 = sub_22F3BDB78();
    uint64_t v64 = sub_22F3A1B4C(v29, v30, &v65);
    uint64_t v16 = v55;
    sub_22F3BD908();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22F39E000, v23, v24, "AppIntent %s unassociated from view", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v31 = v28;
    uint64_t v3 = v56;
    MEMORY[0x230FB6730](v31, -1, -1);
    os_log_type_t v32 = v26;
    uint64_t v1 = v57;
    MEMORY[0x230FB6730](v32, -1, -1);
  }
  else
  {
  }
  if (v22[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] == 1)
  {
    uint64_t v33 = &v22[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
    OUTLINED_FUNCTION_7_2();
    uint64_t v34 = (uint64_t)v33;
    uint64_t v35 = v62;
    sub_22F3BB21C(v34, v62, &qword_2686BE540);
    if (__swift_getEnumTagSinglePayload(v35, 1, v14) == 1)
    {
      sub_22F3A36F0(v35, &qword_2686BE540);
    }
    else
    {
      uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
      uint64_t v47 = v61;
      v46(v61, v35, v14);
      uint64_t v48 = sub_22F3BD788();
      OUTLINED_FUNCTION_23_0(v10, v49, v50, v48);
      uint64_t v51 = v60;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v60, v47, v14);
      unint64_t v52 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = 0;
      *(void *)(v53 + 24) = 0;
      v46((char *)(v53 + v52), (uint64_t)v51, v14);
      sub_22F3BA73C(v10, (uint64_t)&unk_2686BEBC8, v53);
      swift_release();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v47, v14);
    }
  }
  else
  {
    uint64_t v36 = &v22[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view];
    swift_beginAccess();
    uint64_t v37 = MEMORY[0x230FB67E0](v36);
    if (v37)
    {
      os_log_type_t v38 = (void *)v37;
      uint64_t v64 = v37;
      sub_22F3A2FC4();
      sub_22F3A2F7C((unint64_t *)&unk_26AEBA990, (void (*)(uint64_t))sub_22F3A2FC4);
      id v39 = (void *)sub_22F3BD2C8();

      if (v39)
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BE550);
        uint64_t v41 = v58;
        uint64_t v42 = v58 + *(int *)(v40 + 48);
        sub_22F3BCDF8();
        OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_14_1();
        v43();
        uint64_t v44 = (void *)MEMORY[0x230FB67E0](v36);
        uint64_t v64 = (uint64_t)v44;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2686BE560);
        sub_22F3A2F7C((unint64_t *)&unk_2686BE568, (void (*)(uint64_t))sub_22F3A2FC4);
        uint64_t v45 = sub_22F3BD8F8();

        *(void *)uint64_t v42 = v45;
        *(unsigned char *)(v42 + 8) = 0;
        (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v41, *MEMORY[0x263EFB8F8], v1);
        sub_22F3BD218();

        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v41, v1);
      }
    }
    sub_22F3BCF88();
    sub_22F3BCF68();
    sub_22F3BCDE8();
    sub_22F3BCF48();
    swift_release();
  }
  uint64_t v54 = (objc_class *)type metadata accessor for UIAppIntentInteraction();
  v63.receiver = v22;
  v63.super_class = v54;
  objc_msgSendSuper2(&v63, sel_dealloc);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22F3BBCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_22F3BBD00, 0, 0);
}

uint64_t sub_22F3BBD00()
{
  OUTLINED_FUNCTION_25();
  sub_22F3BD338();
  *(void *)(v0 + 24) = sub_22F3BD328();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_21_1();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22F3BBDA0;
  uint64_t v2 = OUTLINED_FUNCTION_17_1();
  return v3(v2);
}

uint64_t sub_22F3BBDA0()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_15_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_22();
  *uint64_t v6 = v5;
  *(void *)(v3 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_22F3BBEA0, 0, 0);
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_11_0();
    return v7();
  }
}

uint64_t sub_22F3BBEA0()
{
  OUTLINED_FUNCTION_25();
  swift_release();
  OUTLINED_FUNCTION_11_0();
  return v0();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_22F3BD288();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_22F3BBFA4()
{
  uint64_t v0 = sub_22F3BD288();
  OUTLINED_FUNCTION_5_2(v0);
  OUTLINED_FUNCTION_19_1();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_10_0(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_22F3BA400;
  uint64_t v4 = OUTLINED_FUNCTION_12_2();
  return sub_22F3BBCE0(v4, v5, v6, v7);
}

id UIAppIntentInteraction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void UIAppIntentInteraction.init()()
{
}

uint64_t sub_22F3BC18C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3A1618();
  *a1 = result;
  return result;
}

uint64_t sub_22F3BC1BC()
{
  return type metadata accessor for UIAppIntentInteraction();
}

uint64_t method lookup function for UIAppIntentInteraction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIAppIntentInteraction);
}

uint64_t dispatch thunk of UIAppIntentInteraction.view.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.view.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.view.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.willMove(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.didMove(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.__allocating_init<A>(intent:perform:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.__allocating_init<A>(intent:perform:suggestedIntent:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t getEnumTagSinglePayload for ViewIntentError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ViewIntentError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22F3BC45CLL);
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

unsigned char *sub_22F3BC484(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ViewIntentError()
{
  return &type metadata for ViewIntentError;
}

unint64_t sub_22F3BC4A4()
{
  unint64_t result = qword_2686BEBD0;
  if (!qword_2686BEBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BEBD0);
  }
  return result;
}

uint64_t sub_22F3BC4F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_task_alloc();
}

uint64_t sub_22F3BC594(uint8_t *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v10 - v6;
  sub_22F3BD058();
  swift_getAssociatedConformanceWitness();
  AppEntity.copyToPasteboard(_:localOnly:expirationDate:)(a1, 0, v8, AssociatedTypeWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, AssociatedTypeWitness);
}

void AppEntity.copyToPasteboard(_:localOnly:expirationDate:)(uint8_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v48 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v48 - v17;
  uint64_t v21 = sub_22F3BCB40(v4, v19, v20);
  if (v21)
  {
    uint64_t v51 = (uint8_t *)v21;
    unint64_t v52 = a1;
    uint64_t v53 = v5;
    if (qword_26AEBAA10 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_22F3BD548();
    __swift_project_value_buffer(v22, (uint64_t)qword_26AEBAAD0);
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v23(v18, v4, a4);
    os_log_type_t v24 = sub_22F3BD528();
    os_log_type_t v25 = sub_22F3BD838();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v54 = v50;
      uint64_t v49 = v26;
      *(_DWORD *)uint64_t v26 = 136315138;
      v48[1] = v26 + 4;
      v23(v16, (uint64_t)v18, a4);
      uint64_t v27 = sub_22F3BD658();
      uint64_t v29 = sub_22F3A1B4C(v27, v28, &v54);
      OUTLINED_FUNCTION_4_2(v29);
      sub_22F3BD908();
      swift_bridgeObjectRelease();
      uint64_t v30 = OUTLINED_FUNCTION_3_5();
      v31(v30);
      _os_log_impl(&dword_22F39E000, v24, v25, "Putting content for %s on pasteboard", v49, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
      uint64_t v42 = OUTLINED_FUNCTION_3_5();
      v43(v42);
    }

    sub_22F3BCD34();
    uint64_t v44 = (void *)sub_22F3BD6C8();
    swift_bridgeObjectRelease();
    [(uint8_t *)v52 setItemProviders:v44 localOnly:0 expirationDate:0];
  }
  else
  {
    if (qword_26AEBAA10 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_22F3BD548();
    __swift_project_value_buffer(v32, (uint64_t)qword_26AEBAAD0);
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v33(v13, v4, a4);
    uint64_t v34 = sub_22F3BD528();
    os_log_type_t v35 = sub_22F3BD828();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v54 = v53;
      unint64_t v52 = v36;
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v51 = v36 + 4;
      v33(v16, (uint64_t)v13, a4);
      uint64_t v37 = sub_22F3BD658();
      uint64_t v39 = sub_22F3A1B4C(v37, v38, &v54);
      OUTLINED_FUNCTION_4_2(v39);
      sub_22F3BD908();
      swift_bridgeObjectRelease();
      uint64_t v40 = OUTLINED_FUNCTION_2_3();
      v41(v40);
      _os_log_impl(&dword_22F39E000, v34, v35, "%s does not support NSItemProvider", v52, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
      uint64_t v45 = OUTLINED_FUNCTION_2_3();
      v46(v45);
    }

    sub_22F3BCCE8();
    swift_allocError();
    *uint64_t v47 = 1;
    swift_willThrow();
  }
}

uint64_t sub_22F3BCB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEBF0);
  if (OUTLINED_FUNCTION_1_4())
  {
    id v9 = objc_msgSend((id)v16, sel_itemProvidersForActivityItemsConfiguration);
    sub_22F3BCD34();
    uint64_t v10 = sub_22F3BD6D8();
    swift_unknownObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686BEBF8);
    if (OUTLINED_FUNCTION_1_4())
    {
      sub_22F3AA744(&v16, (uint64_t)v15);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BEC00);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_22F3BF310;
      __swift_project_boxed_opaque_existential_1(v15, v15[3]);
      *(void *)(v11 + 32) = sub_22F3BD068();
      uint64_t v14 = v11;
      sub_22F3BD6E8();
      uint64_t v10 = v14;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a3);
  return v10;
}

unint64_t sub_22F3BCCE8()
{
  unint64_t result = qword_2686BEBE0;
  if (!qword_2686BEBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BEBE0);
  }
  return result;
}

unint64_t sub_22F3BCD34()
{
  unint64_t result = qword_2686BE698;
  if (!qword_2686BE698)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2686BE698);
  }
  return result;
}

uint64_t sub_22F3BCD78()
{
  return MEMORY[0x270EE09B8]();
}

uint64_t sub_22F3BCD88()
{
  return MEMORY[0x270EE09C0]();
}

uint64_t sub_22F3BCD98()
{
  return MEMORY[0x270EE09C8]();
}

uint64_t sub_22F3BCDC8()
{
  return MEMORY[0x270EE0A70]();
}

uint64_t sub_22F3BCDD8()
{
  return MEMORY[0x270EE0B08]();
}

uint64_t sub_22F3BCDE8()
{
  return MEMORY[0x270EE0B10]();
}

uint64_t sub_22F3BCDF8()
{
  return MEMORY[0x270EE0B20]();
}

uint64_t sub_22F3BCE08()
{
  return MEMORY[0x270EE0B48]();
}

uint64_t sub_22F3BCE18()
{
  return MEMORY[0x270EE0B90]();
}

uint64_t sub_22F3BCE28()
{
  return MEMORY[0x270EE0BA0]();
}

uint64_t sub_22F3BCE38()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_22F3BCE48()
{
  return MEMORY[0x270EE0BD0]();
}

uint64_t sub_22F3BCE58()
{
  return MEMORY[0x270EE0BD8]();
}

uint64_t sub_22F3BCE68()
{
  return MEMORY[0x270EE0BE0]();
}

uint64_t sub_22F3BCE78()
{
  return MEMORY[0x270EE0BE8]();
}

uint64_t sub_22F3BCE88()
{
  return MEMORY[0x270EE0C08]();
}

uint64_t sub_22F3BCE98()
{
  return MEMORY[0x270EE0C10]();
}

uint64_t sub_22F3BCEA8()
{
  return MEMORY[0x270EE0C18]();
}

uint64_t sub_22F3BCEB8()
{
  return MEMORY[0x270EE0C20]();
}

uint64_t sub_22F3BCEC8()
{
  return MEMORY[0x270EE0C28]();
}

uint64_t sub_22F3BCED8()
{
  return MEMORY[0x270EE0C30]();
}

uint64_t sub_22F3BCEE8()
{
  return MEMORY[0x270EE0C60]();
}

uint64_t sub_22F3BCEF8()
{
  return MEMORY[0x270EE0C78]();
}

uint64_t sub_22F3BCF08()
{
  return MEMORY[0x270EE0CE0]();
}

uint64_t sub_22F3BCF18()
{
  return MEMORY[0x270EE0CE8]();
}

uint64_t sub_22F3BCF28()
{
  return MEMORY[0x270EE0D30]();
}

uint64_t sub_22F3BCF38()
{
  return MEMORY[0x270EE0D50]();
}

uint64_t sub_22F3BCF48()
{
  return MEMORY[0x270EE0D60]();
}

uint64_t sub_22F3BCF58()
{
  return MEMORY[0x270EE0D68]();
}

uint64_t sub_22F3BCF68()
{
  return MEMORY[0x270EE0D70]();
}

uint64_t sub_22F3BCF78()
{
  return MEMORY[0x270EE0D80]();
}

uint64_t sub_22F3BCF88()
{
  return MEMORY[0x270EE0D88]();
}

uint64_t sub_22F3BCF98()
{
  return MEMORY[0x270EE0DD8]();
}

uint64_t sub_22F3BCFA8()
{
  return MEMORY[0x270EE0DE0]();
}

uint64_t sub_22F3BCFB8()
{
  return MEMORY[0x270EE0DF8]();
}

uint64_t sub_22F3BCFC8()
{
  return MEMORY[0x270EE0E20]();
}

uint64_t sub_22F3BCFD8()
{
  return MEMORY[0x270EE0E48]();
}

uint64_t sub_22F3BCFF8()
{
  return MEMORY[0x270EE0E58]();
}

uint64_t sub_22F3BD008()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_22F3BD018()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_22F3BD028()
{
  return MEMORY[0x270EE0FC0]();
}

uint64_t sub_22F3BD038()
{
  return MEMORY[0x270EE0FC8]();
}

uint64_t sub_22F3BD048()
{
  return MEMORY[0x270EE0FD0]();
}

uint64_t sub_22F3BD058()
{
  return MEMORY[0x270EE0FE0]();
}

uint64_t sub_22F3BD068()
{
  return MEMORY[0x270EE1030]();
}

uint64_t sub_22F3BD078()
{
  return MEMORY[0x270EE1140]();
}

uint64_t sub_22F3BD088()
{
  return MEMORY[0x270EE1148]();
}

uint64_t sub_22F3BD098()
{
  return MEMORY[0x270EE1168]();
}

uint64_t sub_22F3BD0A8()
{
  return MEMORY[0x270EE1340]();
}

uint64_t sub_22F3BD0B8()
{
  return MEMORY[0x270EE1398]();
}

uint64_t sub_22F3BD0C8()
{
  return MEMORY[0x270EE13A0]();
}

uint64_t sub_22F3BD0D8()
{
  return MEMORY[0x270EE13A8]();
}

uint64_t sub_22F3BD0E8()
{
  return MEMORY[0x270EE13B0]();
}

uint64_t sub_22F3BD0F8()
{
  return MEMORY[0x270EE13B8]();
}

uint64_t sub_22F3BD108()
{
  return MEMORY[0x270EE13C0]();
}

uint64_t sub_22F3BD128()
{
  return MEMORY[0x270EE1630]();
}

uint64_t sub_22F3BD138()
{
  return MEMORY[0x270EE1650]();
}

uint64_t sub_22F3BD148()
{
  return MEMORY[0x270EE1658]();
}

uint64_t sub_22F3BD158()
{
  return MEMORY[0x270EE1660]();
}

uint64_t sub_22F3BD168()
{
  return MEMORY[0x270EE1668]();
}

uint64_t sub_22F3BD178()
{
  return MEMORY[0x270EE16B8]();
}

uint64_t sub_22F3BD188()
{
  return MEMORY[0x270EE1878]();
}

uint64_t sub_22F3BD198()
{
  return MEMORY[0x270EE18E0]();
}

uint64_t sub_22F3BD1A8()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_22F3BD1B8()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_22F3BD1C8()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_22F3BD1D8()
{
  return MEMORY[0x270EE1990]();
}

uint64_t sub_22F3BD1E8()
{
  return MEMORY[0x270EE19C0]();
}

uint64_t sub_22F3BD1F8()
{
  return MEMORY[0x270EE1A00]();
}

uint64_t sub_22F3BD208()
{
  return MEMORY[0x270EE1AF0]();
}

uint64_t sub_22F3BD218()
{
  return MEMORY[0x270EE1B00]();
}

uint64_t sub_22F3BD228()
{
  return MEMORY[0x270EE1B08]();
}

uint64_t sub_22F3BD238()
{
  return MEMORY[0x270EE1B18]();
}

uint64_t sub_22F3BD248()
{
  return MEMORY[0x270EE1B38]();
}

uint64_t sub_22F3BD258()
{
  return MEMORY[0x270EE1B40]();
}

uint64_t sub_22F3BD268()
{
  return MEMORY[0x270EE1B48]();
}

uint64_t sub_22F3BD288()
{
  return MEMORY[0x270EE1C30]();
}

uint64_t sub_22F3BD298()
{
  return MEMORY[0x270EE1D00]();
}

uint64_t sub_22F3BD2A8()
{
  return MEMORY[0x270EE1D08]();
}

uint64_t sub_22F3BD2B8()
{
  return MEMORY[0x270EE1D10]();
}

uint64_t sub_22F3BD2C8()
{
  return MEMORY[0x270EE1D18]();
}

uint64_t sub_22F3BD2D8()
{
  return MEMORY[0x270EE1D20]();
}

uint64_t sub_22F3BD2E8()
{
  return MEMORY[0x270EE1D68]();
}

uint64_t sub_22F3BD2F8()
{
  return MEMORY[0x270EE1D90]();
}

uint64_t sub_22F3BD308()
{
  return MEMORY[0x270EE1DC0]();
}

uint64_t sub_22F3BD318()
{
  return MEMORY[0x270EE1DC8]();
}

uint64_t sub_22F3BD328()
{
  return MEMORY[0x270EE1E50]();
}

uint64_t sub_22F3BD338()
{
  return MEMORY[0x270EE1E58]();
}

uint64_t sub_22F3BD348()
{
  return MEMORY[0x270EE1E78]();
}

uint64_t sub_22F3BD358()
{
  return MEMORY[0x270EE1E80]();
}

uint64_t sub_22F3BD368()
{
  return MEMORY[0x270EE1EB8]();
}

uint64_t sub_22F3BD378()
{
  return MEMORY[0x270EE1EC0]();
}

uint64_t sub_22F3BD388()
{
  return MEMORY[0x270EE1EC8]();
}

uint64_t sub_22F3BD398()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_22F3BD3A8()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_22F3BD3B8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22F3BD3C8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_22F3BD3D8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_22F3BD3E8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_22F3BD3F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22F3BD408()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_22F3BD418()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_22F3BD428()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22F3BD438()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22F3BD448()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22F3BD458()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22F3BD468()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22F3BD478()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_22F3BD488()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22F3BD498()
{
  return MEMORY[0x270F07DE8]();
}

uint64_t sub_22F3BD4A8()
{
  return MEMORY[0x270F07DF0]();
}

uint64_t sub_22F3BD4B8()
{
  return MEMORY[0x270F07DF8]();
}

uint64_t sub_22F3BD4C8()
{
  return MEMORY[0x270F07E00]();
}

uint64_t sub_22F3BD4D8()
{
  return MEMORY[0x270F07E18]();
}

uint64_t sub_22F3BD4E8()
{
  return MEMORY[0x270F07E20]();
}

uint64_t sub_22F3BD4F8()
{
  return MEMORY[0x270F07E28]();
}

uint64_t sub_22F3BD508()
{
  return MEMORY[0x270F07E30]();
}

uint64_t sub_22F3BD518()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22F3BD528()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22F3BD538()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22F3BD548()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22F3BD558()
{
  return MEMORY[0x270F82250]();
}

uint64_t sub_22F3BD568()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_22F3BD578()
{
  return MEMORY[0x270EFFD78]();
}

uint64_t sub_22F3BD588()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_22F3BD598()
{
  return MEMORY[0x270F07E60]();
}

uint64_t sub_22F3BD5A8()
{
  return MEMORY[0x270F07E70]();
}

uint64_t sub_22F3BD5B8()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_22F3BD5C8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22F3BD5D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22F3BD5E8()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_22F3BD5F8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22F3BD608()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22F3BD618()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22F3BD628()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22F3BD638()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22F3BD648()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22F3BD658()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22F3BD668()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22F3BD678()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22F3BD688()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_22F3BD698()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22F3BD6A8()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_22F3BD6B8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22F3BD6C8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22F3BD6D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22F3BD6E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22F3BD708()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22F3BD718()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22F3BD738()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22F3BD758()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22F3BD768()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22F3BD778()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22F3BD788()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22F3BD798()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_22F3BD7A8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22F3BD7B8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22F3BD7C8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22F3BD7D8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22F3BD7E8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22F3BD7F8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22F3BD808()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_22F3BD818()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22F3BD828()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22F3BD838()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22F3BD848()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22F3BD858()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22F3BD868()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22F3BD878()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22F3BD888()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22F3BD898()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_22F3BD8A8()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_22F3BD8B8()
{
  return MEMORY[0x270F82700]();
}

uint64_t _sSo6UIViewC17_AppIntents_UIKitE12viewProvider21UIIntelligenceSupport012IntelligencebC16PayloadProviding_AE0i10SubelementK0pSgvg_0()
{
  return MEMORY[0x270F828E8]();
}

uint64_t sub_22F3BD8D8()
{
  return MEMORY[0x270F828F0]();
}

uint64_t sub_22F3BD8E8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22F3BD8F8()
{
  return MEMORY[0x270F9E3D8]();
}

uint64_t sub_22F3BD908()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22F3BD918()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22F3BD928()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22F3BD938()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22F3BD948()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22F3BD958()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22F3BD968()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_22F3BD978()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22F3BD988()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22F3BD998()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22F3BD9A8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22F3BD9B8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22F3BD9C8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22F3BD9D8()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22F3BD9E8()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22F3BD9F8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22F3BDA08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22F3BDA18()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22F3BDA28()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22F3BDA38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22F3BDA58()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22F3BDA68()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22F3BDA78()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22F3BDA88()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22F3BDA98()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22F3BDAA8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22F3BDAB8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22F3BDAC8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22F3BDAD8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22F3BDAE8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22F3BDAF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22F3BDB08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22F3BDB18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22F3BDB28()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22F3BDB38()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22F3BDB48()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t sub_22F3BDB78()
{
  return MEMORY[0x270FA0128]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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