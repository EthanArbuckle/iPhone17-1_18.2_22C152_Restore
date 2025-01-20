unint64_t ATRawAssortmentServiceName.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_248678AD4(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_248678B18()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931CF88);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_248680560;
  sub_24867FE08();
  swift_bridgeObjectRelease();
  sub_24867FD28();
  sub_24867FD28();
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 32) = 0xD000000000000012;
  *(void *)(v0 + 40) = 0x8000000248680860;
  sub_24867FE88();
  return swift_bridgeObjectRelease();
}

uint64_t static ATRawAssortmentClient.printRawAssortment()()
{
  uint64_t v0 = self;
  v1 = &unk_26FC74800;
  id v2 = objc_msgSend(v0, sel_interfaceWithProtocol_, v1);
  id v3 = objc_allocWithZone(MEMORY[0x263F08D68]);
  v4 = (void *)sub_24867FCF8();
  v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 0);

  [v5 setRemoteObjectInterface:v2];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0xD00000000000002BLL;
  *(void *)(v6 + 24) = 0x80000002486806C0;
  v33 = sub_2486795BC;
  uint64_t v34 = v6;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v30 = 1107296256;
  v31 = sub_248678AD4;
  v32 = &block_descriptor;
  v7 = _Block_copy(&aBlock);
  swift_release();
  [v5 setInterruptionHandler:v7];
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0xD00000000000002BLL;
  *(void *)(v8 + 24) = 0x80000002486806C0;
  v33 = sub_24867960C;
  uint64_t v34 = v8;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v30 = 1107296256;
  v31 = sub_248678AD4;
  v32 = &block_descriptor_6;
  v9 = _Block_copy(&aBlock);
  swift_release();
  [v5 setInvalidationHandler:v9];
  _Block_release(v9);
  [v5 activate];

  v33 = sub_248679270;
  uint64_t v34 = 0;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v30 = 1107296256;
  v31 = sub_248679368;
  v32 = &block_descriptor_9;
  v10 = _Block_copy(&aBlock);
  id v11 = [v5 remoteObjectProxyWithErrorHandler:v10];
  _Block_release(v10);
  sub_24867FDF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931CF80);
  uint64_t v12 = swift_dynamicCast();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931CF88);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_248680560;
    unint64_t aBlock = 0;
    unint64_t v30 = 0xE000000000000000;
    sub_24867FE08();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD00000000000002ALL;
    unint64_t v30 = 0x8000000248680760;
    [v5 processIdentifier];
    sub_24867FE48();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    unint64_t v14 = aBlock;
    unint64_t v15 = v30;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    *(void *)(v13 + 32) = v14;
    *(void *)(v13 + 40) = v15;
    sub_24867FE88();
    swift_bridgeObjectRelease();
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v16;
    v33 = sub_2486796C0;
    uint64_t v34 = v17;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v30 = 1107296256;
    v31 = sub_2486793D0;
    v32 = &block_descriptor_15;
    v18 = _Block_copy(&aBlock);
    v19 = v16;
    swift_release();
    objc_msgSend(v28, sel_spotlightEmailAttributes_completionHandler_, 10, v18);
    _Block_release(v18);
    sub_24867FDA8();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v19;
    v33 = sub_2486796FC;
    uint64_t v34 = v20;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v30 = 1107296256;
    v31 = sub_2486793D0;
    v32 = &block_descriptor_21;
    v21 = _Block_copy(&aBlock);
    v22 = v19;
    swift_release();
    objc_msgSend(v28, sel_spotlightItemTitles_completionHandler_, 10, v21);
    _Block_release(v21);
    sub_24867FDA8();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v22;
    v33 = sub_248679734;
    uint64_t v34 = v23;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v30 = 1107296256;
    v31 = sub_2486793D0;
    v32 = &block_descriptor_27;
    v24 = _Block_copy(&aBlock);
    v25 = v22;
    swift_release();
    objc_msgSend(v28, sel_textOnScreenAX_, v24);
    _Block_release(v24);
    sub_24867FDA8();
    swift_unknownObjectRelease();

    v5 = v25;
  }
  else
  {
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_248680560;
    *(void *)(v26 + 56) = MEMORY[0x263F8D310];
    *(void *)(v26 + 32) = 0xD000000000000033;
    *(void *)(v26 + 40) = 0x8000000248680720;
    sub_24867FE88();
    swift_bridgeObjectRelease();
  }

  return v12;
}

uint64_t sub_248679270()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931CF88);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_248680560;
  sub_24867FE08();
  sub_24867FD28();
  swift_getErrorValue();
  sub_24867FE78();
  sub_24867FD28();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  sub_24867FE88();
  return swift_bridgeObjectRelease();
}

void sub_248679368(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2486793D0(uint64_t a1, uint64_t a2)
{
  id v2 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v3 = sub_24867FD18();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_retain();
  v2(v3, v5);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24867944C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931CF88);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_248680560;
  sub_24867FE08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24867FD28();
  swift_bridgeObjectRelease();
  sub_24867FD28();
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 40) = a6;
  sub_24867FE88();
  swift_bridgeObjectRelease();
  return sub_24867FDB8();
}

uint64_t ATRawAssortmentClient.deinit()
{
  return v0;
}

uint64_t ATRawAssortmentClient.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_248679584()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2486795BC()
{
  return sub_248678B18();
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

uint64_t sub_24867960C()
{
  return sub_248678B18();
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

uint64_t sub_248679688()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2486796C0(uint64_t a1, uint64_t a2)
{
  return sub_24867944C(a1, a2, *(void *)(v2 + 16), 16, 0x69616D65200A0A0ALL, 0xEB000000003A736CLL);
}

uint64_t sub_2486796FC(uint64_t a1, uint64_t a2)
{
  return sub_24867944C(a1, a2, *(void *)(v2 + 16), 21, 0xD000000000000010, 0x8000000248680800);
}

uint64_t sub_248679734(uint64_t a1, uint64_t a2)
{
  return sub_24867944C(a1, a2, *(void *)(v2 + 16), 24, 0xD000000000000013, 0x80000002486807E0);
}

uint64_t type metadata accessor for ATRawAssortmentClient()
{
  return self;
}

uint64_t method lookup function for ATRawAssortmentClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATRawAssortmentClient);
}

unint64_t ATPersonalizationServiceName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t static ATCalendarEvent.supportsSecureCoding.getter()
{
  return byte_26931CF90;
}

uint64_t static ATCalendarEvent.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26931CF90 = a1;
  return result;
}

uint64_t (*static ATCalendarEvent.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t ATCalendarEvent.eventTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  swift_bridgeObjectRetain();
  return v1;
}

id ATCalendarEvent.__allocating_init(eventTitle:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ATCalendarEvent.init(eventTitle:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ATCalendarEvent();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for ATCalendarEvent()
{
  return self;
}

id sub_248679AC8@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle + 8);
  objc_super v5 = (objc_class *)type metadata accessor for ATCalendarEvent();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(void *)v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v9, sel_init);
  a1[3] = v5;
  *a1 = result;
  return result;
}

void sub_248679BC4(void *a1)
{
  uint64_t v2 = (void *)sub_24867FCF8();
  id v3 = (id)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);
}

uint64_t ATCalendarEvent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATCalendarEvent.init(coder:)(a1);
}

uint64_t ATCalendarEvent.init(coder:)(void *a1)
{
  sub_24867EA20(0, &qword_26931CFA0);
  uint64_t v2 = sub_24867FDC8();
  if (v2)
  {
    id v3 = (void *)v2;
    sub_24867FD08();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_248679E70()
{
  return 34;
}

id ATCalendarEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ATCalendarEvent.init()()
{
}

id ATCalendarEvent.__deallocating_deinit()
{
  return sub_24867E3A4(type metadata accessor for ATCalendarEvent);
}

uint64_t static ATArrayOfCalendarEvents.supportsSecureCoding.getter()
{
  return byte_26931CF91;
}

uint64_t static ATArrayOfCalendarEvents.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26931CF91 = a1;
  return result;
}

uint64_t (*static ATArrayOfCalendarEvents.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATArrayOfCalendarEvents.calendarEvents.getter()
{
  return swift_bridgeObjectRetain();
}

id ATArrayOfCalendarEvents.__allocating_init(calendarEvents:)(uint64_t a1)
{
  return sub_24867C060(a1, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents);
}

id ATArrayOfCalendarEvents.init(calendarEvents:)(uint64_t a1)
{
  return sub_24867C0D8(a1, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents);
}

uint64_t type metadata accessor for ATArrayOfCalendarEvents()
{
  return self;
}

id sub_24867A1B0@<X0>(void *a1@<X8>)
{
  return sub_24867C1E0(&OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents, a1);
}

void sub_24867A1F0(void *a1)
{
}

id ATArrayOfCalendarEvents.__allocating_init(coder:)(void *a1)
{
  return sub_24867C4EC(a1, (void (*)(void))type metadata accessor for ATCalendarEvent, 0x7261646E656C6163, 0xEE0073746E657645, (SEL *)&selRef_initWithCalendarEvents_);
}

id ATArrayOfCalendarEvents.init(coder:)(void *a1)
{
  return sub_24867C5F4(a1, (void (*)(void))type metadata accessor for ATCalendarEvent, 0x7261646E656C6163, 0xEE0073746E657645, (SEL *)&selRef_initWithCalendarEvents_);
}

uint64_t sub_24867A348()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931CFB0);
    sub_24867E958();
    sub_24867FCE8();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    return 91;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_24867FE28();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24867E938(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x24C57AB90](v4, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = objc_msgSend(v5, sel_description);
      uint64_t v8 = sub_24867FD18();
      uint64_t v10 = v9;

      unint64_t v12 = *(void *)(v14 + 16);
      unint64_t v11 = *(void *)(v14 + 24);
      if (v12 >= v11 >> 1) {
        sub_24867E938(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      *(void *)(v14 + 16) = v12 + 1;
      uint64_t v13 = v14 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void ATArrayOfCalendarEvents.init()()
{
}

id ATArrayOfCalendarEvents.__deallocating_deinit()
{
  return sub_24867E3A4(type metadata accessor for ATArrayOfCalendarEvents);
}

uint64_t static ATPlayedMediaItem.supportsSecureCoding.getter()
{
  return byte_26931CF92;
}

uint64_t static ATPlayedMediaItem.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26931CF92 = a1;
  return result;
}

uint64_t (*static ATPlayedMediaItem.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATPlayedMediaItem.title.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.artist.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.album.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.link.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.bundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.mediaType.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  swift_bridgeObjectRetain();
  return v1;
}

double ATPlayedMediaItem.playTime.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
}

id ATPlayedMediaItem.__allocating_init(title:artist:album:link:bundleID:mediaType:playTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  v22 = (char *)objc_allocWithZone(v13);
  uint64_t v23 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title];
  *(void *)uint64_t v23 = a1;
  *((void *)v23 + 1) = a2;
  v24 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist];
  *(void *)v24 = a3;
  *((void *)v24 + 1) = a4;
  v25 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album];
  *(void *)v25 = a5;
  *((void *)v25 + 1) = a6;
  uint64_t v26 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link];
  *(void *)uint64_t v26 = a7;
  *((void *)v26 + 1) = a8;
  v27 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID];
  *(void *)v27 = a10;
  *((void *)v27 + 1) = a11;
  v28 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType];
  *(void *)v28 = a12;
  *((void *)v28 + 1) = a13;
  *(double *)&v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime] = a9;
  v31.receiver = v22;
  v31.super_class = v13;
  return objc_msgSendSuper2(&v31, sel_init);
}

id ATPlayedMediaItem.init(title:artist:album:link:bundleID:mediaType:playTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  unint64_t v15 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist];
  *(void *)unint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  dispatch_semaphore_t v16 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album];
  *(void *)dispatch_semaphore_t v16 = a5;
  *((void *)v16 + 1) = a6;
  uint64_t v17 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link];
  *(void *)uint64_t v17 = a7;
  *((void *)v17 + 1) = a8;
  v18 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID];
  *(void *)v18 = a10;
  *((void *)v18 + 1) = a11;
  v19 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType];
  *(void *)v19 = a12;
  *((void *)v19 + 1) = a13;
  *(double *)&v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime] = a9;
  v21.receiver = v13;
  v21.super_class = (Class)type metadata accessor for ATPlayedMediaItem();
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_24867ABB8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title + 8);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist + 8);
  uint64_t v22 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist);
  uint64_t v23 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album + 8);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link + 8);
  uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link);
  uint64_t v21 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID + 8);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType + 8);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
  unint64_t v11 = (objc_class *)type metadata accessor for ATPlayedMediaItem();
  unint64_t v12 = (char *)objc_allocWithZone(v11);
  uint64_t v13 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title];
  *(void *)uint64_t v13 = v23;
  *((void *)v13 + 1) = v2;
  uint64_t v14 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist];
  *(void *)uint64_t v14 = v22;
  *((void *)v14 + 1) = v3;
  unint64_t v15 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album];
  *(void *)unint64_t v15 = v21;
  *((void *)v15 + 1) = v4;
  dispatch_semaphore_t v16 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link];
  *(void *)dispatch_semaphore_t v16 = v20;
  *((void *)v16 + 1) = v5;
  uint64_t v17 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID];
  *(void *)uint64_t v17 = v7;
  *((void *)v17 + 1) = v6;
  v18 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType];
  *(void *)v18 = v8;
  *((void *)v18 + 1) = v9;
  *(void *)&v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime] = v10;
  v25.receiver = v12;
  v25.super_class = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v25, sel_init);
  a1[3] = v11;
  *a1 = result;
  return result;
}

void sub_24867ADB8(void *a1)
{
  uint64_t v3 = (void *)sub_24867FCF8();
  uint64_t v4 = (void *)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  uint64_t v5 = (void *)sub_24867FCF8();
  uint64_t v6 = (void *)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  uint64_t v7 = (void *)sub_24867FCF8();
  uint64_t v8 = (void *)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

  uint64_t v9 = (void *)sub_24867FCF8();
  uint64_t v10 = (void *)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  unint64_t v11 = (void *)sub_24867FCF8();
  unint64_t v12 = (void *)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  uint64_t v13 = (void *)sub_24867FCF8();
  uint64_t v14 = (void *)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);

  double v15 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
  id v16 = (id)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v16, v15);
}

uint64_t ATPlayedMediaItem.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATPlayedMediaItem.init(coder:)(a1);
}

uint64_t ATPlayedMediaItem.init(coder:)(void *a1)
{
  sub_24867EA20(0, &qword_26931CFA0);
  uint64_t v2 = sub_24867FDC8();
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    sub_24867FD08();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_24867B4C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType;
  id v3 = *(uint64_t **)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  uint64_t v4 = *(void *)(v2 + 8);
  BOOL v5 = v3 == (uint64_t *)1735290739 && v4 == 0xE400000000000000;
  if (v5 || (sub_24867FE68() & 1) != 0)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24867FE08();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24867FD28();
    double v7 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(void *)&v7 & 0x7FF0000000000000) != 0)
    {
      if (v7 > -9.22337204e18)
      {
        if (v7 < 9.22337204e18)
        {
LABEL_9:
          sub_24867FE48();
          sub_24867FD28();
          swift_bridgeObjectRelease();
          sub_24867FD28();
          swift_bridgeObjectRetain();
          sub_24867FD28();
          swift_bridgeObjectRelease();
          sub_24867FD28();
          return v14;
        }
        goto LABEL_41;
      }
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  BOOL v8 = v3 == (uint64_t *)0x74736163646F70 && v4 == 0xE700000000000000;
  if (v8 || (sub_24867FE68() & 1) != 0)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24867FE08();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    id v3 = &v14;
    uint64_t result = sub_24867FD28();
    double v9 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v9 <= -9.22337204e18)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v9 < 9.22337204e18) {
      goto LABEL_9;
    }
    __break(1u);
  }
  BOOL v10 = v3 == (uint64_t *)0x6F6F626F69647561 && v4 == 0xE90000000000006BLL;
  if (v10 || (sub_24867FE68() & 1) != 0)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24867FE08();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    id v3 = &v14;
    uint64_t result = sub_24867FD28();
    double v11 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(void *)&v11 & 0x7FF0000000000000) == 0)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    if (v11 <= -9.22337204e18)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v11 < 9.22337204e18) {
      goto LABEL_9;
    }
    __break(1u);
  }
  if (v3 == (uint64_t *)0xD000000000000010 && v4 == 0x8000000248680B30 || (sub_24867FE68() & 1) != 0)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24867FE08();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    sub_24867FD28();
    swift_bridgeObjectRetain();
    sub_24867FD28();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24867FD28();
    double v12 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
    {
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (v12 <= -9.22337204e18)
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v12 < 9.22337204e18) {
      goto LABEL_9;
    }
    __break(1u);
  }
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_24867FE08();
  sub_24867FD28();
  swift_bridgeObjectRetain();
  sub_24867FD28();
  swift_bridgeObjectRelease();
  sub_24867FD28();
  swift_bridgeObjectRetain();
  sub_24867FD28();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24867FD28();
  double v13 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (v13 > -9.22337204e18)
  {
    if (v13 < 9.22337204e18) {
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_49:
  __break(1u);
  return result;
}

void ATPlayedMediaItem.init()()
{
}

id ATPlayedMediaItem.__deallocating_deinit()
{
  return sub_24867E3A4(type metadata accessor for ATPlayedMediaItem);
}

uint64_t static ATArrayOfPlayedMediaItems.supportsSecureCoding.getter()
{
  return byte_26931CF93;
}

uint64_t static ATArrayOfPlayedMediaItems.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26931CF93 = a1;
  return result;
}

uint64_t (*static ATArrayOfPlayedMediaItems.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATArrayOfPlayedMediaItems.playedMediaItems.getter()
{
  return swift_bridgeObjectRetain();
}

id ATArrayOfPlayedMediaItems.__allocating_init(playedMediaItems:)(uint64_t a1)
{
  return sub_24867C060(a1, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems);
}

id sub_24867C060(uint64_t a1, void *a2)
{
  BOOL v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[*a2] = a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ATArrayOfPlayedMediaItems.init(playedMediaItems:)(uint64_t a1)
{
  return sub_24867C0D8(a1, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems);
}

id sub_24867C0D8(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  *(void *)&v3[*a2] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)a3();
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_24867C14C(char *a1, uint64_t a2, uint64_t a3, void (*a4)(void), void *a5, uint64_t (*a6)(void))
{
  a4();
  *(void *)&a1[*a5] = sub_24867FD48();
  v10.receiver = a1;
  v10.super_class = (Class)a6();
  return objc_msgSendSuper2(&v10, sel_init);
}

id sub_24867C1C0@<X0>(void *a1@<X8>)
{
  return sub_24867C1E0(&OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems, a1);
}

id sub_24867C1E0@<X0>(void *a1@<X1>, uint64_t (*a2)(void)@<X2>, void *a3@<X8>)
{
  uint64_t v6 = *(void *)(v3 + *a1);
  objc_super v7 = (objc_class *)a2();
  BOOL v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[*a1] = v6;
  v10.receiver = v8;
  v10.super_class = v7;
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v10, sel_init);
  a3[3] = v7;
  *a3 = result;
  return result;
}

id sub_24867C27C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  uint64_t v6 = *(void *)(a1 + *a4);
  objc_super v7 = (objc_class *)a5();
  BOOL v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[*a4] = v6;
  v10.receiver = v8;
  v10.super_class = v7;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v10, sel_init);
}

void sub_24867C2EC(void *a1)
{
}

void sub_24867C324(void *a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v4 = (void *)sub_24867FD38();
  id v5 = (id)sub_24867FCF8();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
}

void sub_24867C3F4(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  a5();
  id v7 = a3;
  id v8 = a1;
  double v9 = (void *)sub_24867FD38();
  id v10 = (id)sub_24867FCF8();
  objc_msgSend(v7, sel_encodeObject_forKey_, v9, v10);
}

id ATArrayOfPlayedMediaItems.__allocating_init(coder:)(void *a1)
{
  return sub_24867C4EC(a1, (void (*)(void))type metadata accessor for ATPlayedMediaItem, 0xD000000000000010, 0x8000000248680BB0, (SEL *)&selRef_initWithPlayedMediaItems_);
}

id sub_24867C4EC(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4, SEL *a5)
{
  id v8 = v5;
  id v10 = objc_allocWithZone(v8);
  a2();
  if (sub_24867FDD8())
  {
    double v11 = (void *)sub_24867FD38();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v10, *a5, v11);
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v12;
}

id ATArrayOfPlayedMediaItems.init(coder:)(void *a1)
{
  return sub_24867C5F4(a1, (void (*)(void))type metadata accessor for ATPlayedMediaItem, 0xD000000000000010, 0x8000000248680BB0, (SEL *)&selRef_initWithPlayedMediaItems_);
}

id sub_24867C5F4(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4, SEL *a5)
{
  id v7 = v5;
  a2();
  if (sub_24867FDD8())
  {
    double v9 = (void *)sub_24867FD38();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v7, *a5, v9);
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

id sub_24867C6EC(void *a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5, uint64_t a6, SEL *a7)
{
  a4();
  id v10 = a3;
  if (sub_24867FDD8())
  {
    double v11 = (void *)sub_24867FD38();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(a1, *a7, v11);

    return v12;
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

id sub_24867C7D0(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  id v5 = (void *)sub_24867FCF8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24867C840()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931CFB0);
    sub_24867E958();
    uint64_t v14 = sub_24867FCE8();
    swift_bridgeObjectRelease();
    return v14;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_24867FE28();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24867E938(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x24C57AB90](v4, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = objc_msgSend(v5, sel_description);
      uint64_t v8 = sub_24867FD18();
      uint64_t v10 = v9;

      unint64_t v12 = *(void *)(v15 + 16);
      unint64_t v11 = *(void *)(v15 + 24);
      if (v12 >= v11 >> 1) {
        sub_24867E938(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      *(void *)(v15 + 16) = v12 + 1;
      uint64_t v13 = v15 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void ATArrayOfPlayedMediaItems.init()()
{
}

id ATArrayOfPlayedMediaItems.__deallocating_deinit()
{
  return sub_24867E3A4(type metadata accessor for ATArrayOfPlayedMediaItems);
}

id ATPersonalizationClient.init()()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v2 = v0;
  uint64_t v3 = (void *)sub_24867FCF8();
  id v4 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v3, 4096);

  uint64_t v5 = OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_connection;
  *(void *)&v2[OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_connection] = v4;
  uint64_t v6 = self;
  id v7 = v4;
  id v8 = objc_msgSend(v6, sel_interfaceWithProtocol_, &unk_26FC74608);
  objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);

  uint64_t v9 = *(void **)&v2[v5];
  objc_msgSend(v9, sel_resume);
  aBlock[4] = sub_24867CCA0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248679368;
  aBlock[3] = &block_descriptor_0;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v9;
  id v12 = objc_msgSend(v11, sel_remoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);

  sub_24867FDF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D010);
  int v13 = swift_dynamicCast();
  uint64_t v14 = v17;
  if (!v13) {
    uint64_t v14 = 0;
  }
  *(void *)&v2[OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy] = v14;

  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for ATPersonalizationClient();
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t sub_24867CCA0(void *a1)
{
  uint64_t v2 = sub_24867FCD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24867FCC8();
  id v6 = a1;
  id v7 = a1;
  id v8 = sub_24867FCB8();
  os_log_type_t v9 = sub_24867FD98();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v17[0] = v2;
    id v11 = (uint8_t *)v10;
    id v12 = (void *)swift_slowAlloc();
    *(_DWORD *)id v11 = 138412290;
    id v13 = a1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v17[1] = v14;
    sub_24867FDE8();
    *id v12 = v14;

    _os_log_impl(&dword_248677000, v8, v9, "Received error from ArchetypeService: %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D1B8);
    swift_arrayDestroy();
    MEMORY[0x24C57AFE0](v12, -1, -1);
    uint64_t v15 = v11;
    uint64_t v2 = v17[0];
    MEMORY[0x24C57AFE0](v15, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24867CED0(char a1)
{
  *(void *)(v2 + 128) = v1;
  *(unsigned char *)(v2 + 136) = a1;
  return MEMORY[0x270FA2498](sub_24867CEF4, 0, 0);
}

uint64_t sub_24867CEF4()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 128) + OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(v0 + 136);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24867D040;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24867D138;
    *(void *)(v0 + 104) = &block_descriptor_1;
    *(void *)(v0 + 112) = v3;
    objc_msgSend(v1, sel_freeNowWithExcludeAllDayEvents_completionHandler_, v2, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4(0);
  }
}

uint64_t sub_24867D040()
{
  return MEMORY[0x270FA2498](sub_24867D120, 0, 0);
}

uint64_t sub_24867D120()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 120));
}

uint64_t sub_24867D138(uint64_t a1, void *a2)
{
  return sub_24867D7E0(a1, a2, &qword_26931D1B0);
}

uint64_t sub_24867D2BC(char a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  id v6 = a3;
  uint64_t v7 = swift_task_alloc();
  v3[4] = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_24867D394;
  *(void *)(v7 + 128) = v6;
  *(unsigned char *)(v7 + 136) = a1;
  return MEMORY[0x270FA2498](sub_24867CEF4, 0, 0);
}

uint64_t sub_24867D394(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_24867D4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[20] = a5;
  v6[21] = v5;
  v6[18] = a3;
  v6[19] = a4;
  v6[16] = a1;
  v6[17] = a2;
  return MEMORY[0x270FA2498](sub_24867D508, 0, 0);
}

uint64_t sub_24867D508()
{
  uint64_t v1 = *(void **)(v0[21] + OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy);
  if (v1)
  {
    uint64_t v3 = v0[17];
    uint64_t v2 = v0[18];
    uint64_t v4 = v0[16];
    uint64_t v5 = sub_24867FCF8();
    v0[22] = v5;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_24867D68C;
    uint64_t v6 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24867D7D4;
    v0[13] = &block_descriptor_2;
    v0[14] = v6;
    objc_msgSend(v1, sel_topPlayedMediaWithK_start_end_mediaType_completionHandler_, v4, v3, v2, v5, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7(0);
  }
}

uint64_t sub_24867D68C()
{
  return MEMORY[0x270FA2498](sub_24867D76C, 0, 0);
}

uint64_t sub_24867D76C()
{
  uint64_t v1 = *(void *)(v0 + 120);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24867D7D4(uint64_t a1, void *a2)
{
  return sub_24867D7E0(a1, a2, &qword_26931D1A8);
}

uint64_t sub_24867D7E0(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v8 = a2;
  uint64_t v5 = *(void *)(*(void *)(v4 + 64) + 40);
  id v6 = a2;
  sub_24867FAC8((uint64_t)&v8, v5, a3);
  return swift_continuation_resume();
}

uint64_t sub_24867D9E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *aBlock, void *a6)
{
  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  uint64_t v11 = sub_24867FD18();
  uint64_t v13 = v12;
  v6[4] = v12;
  id v14 = a6;
  uint64_t v15 = (void *)swift_task_alloc();
  v6[5] = v15;
  *uint64_t v15 = v6;
  v15[1] = sub_24867DAEC;
  v15[20] = v13;
  v15[21] = v14;
  v15[18] = a3;
  v15[19] = v11;
  v15[16] = a1;
  v15[17] = a2;
  return MEMORY[0x270FA2498](sub_24867D508, 0, 0);
}

uint64_t sub_24867DAEC(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_24867DC54(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return MEMORY[0x270FA2498](sub_24867DC78, 0, 0);
}

uint64_t sub_24867DC78()
{
  uint64_t v1 = *(void **)(v0[19] + OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy);
  if (v1)
  {
    uint64_t v2 = sub_24867FCF8();
    v0[20] = v2;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_24867DDE0;
    uint64_t v3 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24867DF2C;
    v0[13] = &block_descriptor_3;
    v0[14] = v3;
    objc_msgSend(v1, sel_currentLocationWithEffectiveBundleIdentifier_completionHandler_, v2, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void, void))v0[1];
    return v4(0, 0);
  }
}

uint64_t sub_24867DDE0()
{
  return MEMORY[0x270FA2498](sub_24867DEC0, 0, 0);
}

uint64_t sub_24867DEC0()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);

  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v2, v1);
}

uint64_t sub_24867DF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_24867FD18();
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = v3;
  v5[1] = a2;
  sub_24867FAC8((uint64_t)v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_26931D1A0);
  return swift_continuation_resume();
}

uint64_t sub_24867E118(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_24867FD18();
  uint64_t v7 = v6;
  v3[4] = v6;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  void *v9 = v3;
  v9[1] = sub_24867E204;
  v9[18] = v7;
  v9[19] = v8;
  v9[17] = v5;
  return MEMORY[0x270FA2498](sub_24867DC78, 0, 0);
}

uint64_t sub_24867E204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void **)(*v2 + 16);
  uint64_t v6 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  if (a2)
  {
    uint64_t v7 = (void *)sub_24867FCF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = *(void (***)(void, void))(v4 + 24);
  ((void (**)(void, void *))v8)[2](v8, v7);

  _Block_release(v8);
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

id ATPersonalizationClient.__deallocating_deinit()
{
  return sub_24867E3A4(type metadata accessor for ATPersonalizationClient);
}

id sub_24867E3A4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_24867E428(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_24867FCB4;
  return v6();
}

uint64_t sub_24867E4F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_24867FCB4;
  return v7();
}

uint64_t sub_24867E5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24867FD78();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24867FD68();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24867F590(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24867FD58();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24867E764(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24867E840;
  return v6(a1);
}

uint64_t sub_24867E840()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24867E938(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24867FB2C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

unint64_t sub_24867E958()
{
  unint64_t result = qword_26931CFB8;
  if (!qword_26931CFB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26931CFB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931CFB8);
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

uint64_t type metadata accessor for ATPlayedMediaItem()
{
  return self;
}

uint64_t sub_24867EA20(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for ATArrayOfPlayedMediaItems()
{
  return self;
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

uint64_t type metadata accessor for ATPersonalizationClient()
{
  return self;
}

uint64_t method lookup function for ATCalendarEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATCalendarEvent);
}

uint64_t dispatch thunk of ATCalendarEvent.__allocating_init(eventTitle:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ATCalendarEvent.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ATCalendarEvent.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ATCalendarEvent.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for ATArrayOfCalendarEvents(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATArrayOfCalendarEvents);
}

uint64_t dispatch thunk of ATArrayOfCalendarEvents.__allocating_init(calendarEvents:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ATArrayOfCalendarEvents.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ATArrayOfCalendarEvents.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ATArrayOfCalendarEvents.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for ATPlayedMediaItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATPlayedMediaItem);
}

uint64_t dispatch thunk of ATPlayedMediaItem.__allocating_init(title:artist:album:link:bundleID:mediaType:playTime:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ATPlayedMediaItem.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ATPlayedMediaItem.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ATPlayedMediaItem.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t method lookup function for ATArrayOfPlayedMediaItems(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATArrayOfPlayedMediaItems);
}

uint64_t dispatch thunk of ATArrayOfPlayedMediaItems.__allocating_init(playedMediaItems:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ATArrayOfPlayedMediaItems.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ATArrayOfPlayedMediaItems.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ATArrayOfPlayedMediaItems.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for ATPersonalizationClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATPersonalizationClient);
}

uint64_t dispatch thunk of ATPersonalizationClient.freeNow(excludeAllDayEvents:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x60);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24867FC9C;
  return v7(a1);
}

uint64_t dispatch thunk of ATPersonalizationClient.topPlayedMedia(k:start:end:mediaType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *(int **)((*MEMORY[0x263F8EED0] & *v5) + 0x68);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_24867EFE4;
  return v15(a1, a2, a3, a4, a5);
}

uint64_t sub_24867EFE4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of ATPersonalizationClient.currentLocation(effectiveBundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x70);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_24867F1FC;
  return v9(a1, a2);
}

uint64_t sub_24867F1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_24867F300()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24867F348()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24867FCB4;
  uint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_26931D120 + dword_26931D120);
  return v6(v2, v3, v4);
}

uint64_t sub_24867F400()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24867FCB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26931D130 + dword_26931D130);
  return v6(v2, v3, v4);
}

uint64_t sub_24867F4C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24867FCB4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26931D140 + dword_26931D140);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24867F590(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D118);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24867F5F0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24867F628(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24867F6E0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26931D150 + dword_26931D150);
  return v6(a1, v4);
}

uint64_t sub_24867F6E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24867F7D4()
{
  _Block_release(*(const void **)(v0 + 48));
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24867F81C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = (void *)v0[6];
  uint64_t v6 = (void *)v0[7];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_24867F6E0;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int, void *, void *))((char *)&dword_26931D160
                                                                              + dword_26931D160);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_24867F8F8()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24867F938()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24867FCB4;
  uint64_t v6 = (uint64_t (*)(char, void *, void *))((char *)&dword_26931D180 + dword_26931D180);
  return v6(v2, v4, v3);
}

uint64_t objectdestroy_36Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
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

uint64_t sub_24867FAC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24867FB2C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26931D1C0);
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
  id v14 = a4 + 32;
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
  uint64_t result = sub_24867FE38();
  __break(1u);
  return result;
}

uint64_t sub_24867FCB8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24867FCC8()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_24867FCD8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24867FCE8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24867FCF8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24867FD08()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24867FD18()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24867FD28()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24867FD38()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24867FD48()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24867FD58()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24867FD68()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24867FD78()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24867FD88()
{
  return MEMORY[0x270EF1C28]();
}

uint64_t sub_24867FD98()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24867FDA8()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_24867FDB8()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_24867FDC8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24867FDD8()
{
  return MEMORY[0x270EF2128]();
}

uint64_t sub_24867FDE8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24867FDF8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24867FE08()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24867FE18()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24867FE28()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24867FE38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24867FE48()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24867FE58()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24867FE68()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24867FE78()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24867FE88()
{
  return MEMORY[0x270F9FC28]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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