uint64_t PauseConversationAction.isPaused.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23PauseConversationAction_isPaused);
}

uint64_t PauseConversationAction.__allocating_init(conversationUUID:isPaused:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  PauseConversationAction.init(conversationUUID:isPaused:)(a1, a2);
  return v4;
}

uint64_t PauseConversationAction.init(conversationUUID:isPaused:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v19 = sub_244567560();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2445675A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_allocWithZone(MEMORY[0x263EFC968]);
  swift_retain();
  v14 = (void *)sub_244567570();
  id v15 = objc_msgSend(v13, sel_initWithCallUUID_onHold_, v14, a2 & 1);

  *(unsigned char *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit23PauseConversationAction_isPaused) = a2;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  *(void *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v9);
  v16 = (void *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  void *v16 = 0;
  v16[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v8, v19);
  return v3;
}

uint64_t sub_24454AC6C(void *a1)
{
  uint64_t v3 = sub_244567560();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2445675A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  unsigned __int8 v11 = objc_msgSend(a1, sel_isOnHold);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit23PauseConversationAction_isPaused) = v11;
  swift_release();
  id v12 = objc_msgSend(a1, sel_callUUID);
  sub_244567590();

  sub_244567540();
  *(void *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v10, v7);
  id v13 = (void *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *id v13 = 0;
  v13[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v6, v3);
  return v1;
}

void sub_24454AE78()
{
}

uint64_t PauseConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t sub_24454AF84(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t PauseConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24454B0B0()
{
  return type metadata accessor for PauseConversationAction();
}

uint64_t type metadata accessor for PauseConversationAction()
{
  uint64_t result = qword_268E884C8;
  if (!qword_268E884C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24454B104()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for PauseConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PauseConversationAction);
}

uint64_t dispatch thunk of PauseConversationAction.__allocating_init(conversationUUID:isPaused:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_24454B174()
{
  return sub_244567B30();
}

uint64_t sub_24454B1BC()
{
  return sub_244567B10();
}

uint64_t sub_24454B1E8()
{
  return sub_244567B30();
}

BOOL sub_24454B22C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void type metadata accessor for HandleType(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_24454B268(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *sub_24454B2B0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24454B2C0(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_24454B2D0()
{
  unint64_t result = qword_268E884E8;
  if (!qword_268E884E8)
  {
    type metadata accessor for HandleType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E884E8);
  }
  return result;
}

id sub_24454B38C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CallObserverDelegateWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CallObserverDelegateWrapper()
{
  return self;
}

uint64_t sub_24454B48C()
{
  uint64_t v0 = sub_244567630();
  __swift_allocate_value_buffer(v0, qword_268E88BA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268E88BA0);
  return sub_244567620();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_24454B59C(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v29[0] = a3;
  uint64_t v5 = sub_2445675A0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unsigned __int8 v11 = (char *)v29 - v10;
  id v12 = objc_msgSend(a2, sel_UUID);
  sub_244567590();

  uint64_t v13 = *a1;
  if (!*(void *)(*a1 + 16) || (unint64_t v14 = sub_244556D50((uint64_t)v11), (v15 & 1) == 0))
  {
    v20 = *(void (**)(char *, uint64_t))(v6 + 8);
    v20(v11, v5);
    type metadata accessor for Conversation(0);
    swift_allocObject();
    id v21 = a2;
    uint64_t v16 = sub_24454DFB8(v21);

    id v22 = objc_msgSend(v21, sel_UUID);
    sub_244567590();

    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *a1;
    *a1 = 0x8000000000000000;
    sub_2445573D0(v16, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
    *a1 = v30;
    swift_bridgeObjectRelease();
    v20(v9, v5);
LABEL_10:
    *(void *)v29[0] = v16;
    return;
  }
  uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  swift_retain();
  v17(v11, v5);
  id v18 = a2;
  if ((objc_msgSend(v18, sel_hasEnded) & 1) != 0
    || (objc_msgSend(v18, sel_isOnHold) & 1) != 0)
  {
  }
  else
  {
    objc_msgSend(v18, sel_hasConnected);
  }
  MEMORY[0x270FA5388](v19);
  LOBYTE(v29[-2]) = v24;
  uint64_t v26 = v25 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v25 + 16);
  v27 = (os_unfair_lock_s *)(v25 + ((*(unsigned int *)(*(void *)v25 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v27);
  uint64_t v28 = v29[1];
  sub_24454B934(v26);
  if (!v28)
  {
    os_unfair_lock_unlock(v27);
    goto LABEL_10;
  }
  os_unfair_lock_unlock(v27);
  __break(1u);
}

uint64_t sub_24454B8D8()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ConversationCache()
{
  return self;
}

uint64_t sub_24454B934(uint64_t a1)
{
  return sub_24454CFF0(a1, *(unsigned char *)(v1 + 16));
}

uint64_t ConversationManager.Configuration.ringtoneName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConversationManager.Configuration.ringtoneName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *objc_super v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ConversationManager.Configuration.ringtoneName.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.iconTemplateImageData.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24454BA0C(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t sub_24454BA0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24454BA20(a1, a2);
  }
  return a1;
}

uint64_t sub_24454BA20(uint64_t a1, unint64_t a2)
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

uint64_t ConversationManager.Configuration.iconTemplateImageData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24454BAB0(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t sub_24454BAB0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24454BAC4(a1, a2);
  }
  return a1;
}

uint64_t sub_24454BAC4(uint64_t a1, unint64_t a2)
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

uint64_t (*ConversationManager.Configuration.iconTemplateImageData.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.maximumConversationGroups.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t ConversationManager.Configuration.maximumConversationGroups.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.maximumConversationGroups.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.maximumConversationsPerConversationGroup.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t ConversationManager.Configuration.maximumConversationsPerConversationGroup.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.maximumConversationsPerConversationGroup.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.includesConversationInRecents.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t ConversationManager.Configuration.includesConversationInRecents.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.includesConversationInRecents.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.supportsVideo.getter()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t ConversationManager.Configuration.supportsVideo.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 49) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.supportsVideo.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.supportedHandleTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ConversationManager.Configuration.supportedHandleTypes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*ConversationManager.Configuration.supportedHandleTypes.modify())()
{
  return nullsub_1;
}

id sub_24454BC50()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v6 = *(unsigned __int8 *)(v0 + 49);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC958]), sel_init);
  if (v1) {
    uint64_t v8 = (void *)sub_244567690();
  }
  else {
    uint64_t v8 = 0;
  }
  objc_msgSend(v7, sel_setRingtoneSound_, v8);

  if (v2 >> 60 == 15) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (void *)sub_244567520();
  }
  objc_msgSend(v7, sel_setIconTemplateImageData_, v9);

  objc_msgSend(v7, sel_setMaximumCallGroups_, v4);
  objc_msgSend(v7, sel_setMaximumCallsPerCallGroup_, v3);
  objc_msgSend(v7, sel_setIncludesCallsInRecents_, v5);
  objc_msgSend(v7, sel_setSupportsVideo_, v6);
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_24454BDDC(v10);
  swift_bridgeObjectRelease();
  sub_244560D38(v11);
  swift_bridgeObjectRelease();
  sub_244567800();
  objc_msgSend(v7, sel_setSupportsDynamicSystemUI_, 1);
  return v7;
}

uint64_t sub_24454BDDC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_244550770(0, v1, 0);
  uint64_t v2 = v15;
  uint64_t result = sub_2445600BC(a1);
  uint64_t v5 = result;
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_14;
    }
    uint64_t v10 = *(unsigned __int8 *)(*(void *)(a1 + 48) + v5);
    unint64_t v12 = *(void *)(v15 + 16);
    unint64_t v11 = *(void *)(v15 + 24);
    if (v12 >= v11 >> 1) {
      sub_244550770(v11 > 1, v12 + 1, 1);
    }
    *(void *)(v15 + 16) = v12 + 1;
    *(void *)(v15 + 8 * v12 + 32) = v10 + 1;
    uint64_t result = sub_244560160(v5, v7, v9 & 1, a1);
    uint64_t v5 = result;
    uint64_t v7 = v13;
    char v9 = v14 & 1;
    if (!--v1)
    {
      sub_24454C350(result, v13, v14 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t ConversationManager.Configuration.init(ringtoneName:iconTemplateImageData:maximumConversationGroups:maximumConversationsPerConversationGroup:includesConversationInRecents:supportsVideo:supportedHandleTypes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 49) = a8;
  *(void *)(a9 + 56) = a10;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Handle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s14descr26F92FD41V13ConfigurationVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >> 60 != 15) {
    sub_24454BAC4(*(void *)(a1 + 16), v2);
  }

  return swift_bridgeObjectRelease();
}

uint64_t _s14descr26F92FD41V13ConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    uint64_t v7 = *(void *)v5;
    sub_24454BA20(v7, v6);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s14descr26F92FD41V13ConfigurationVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_24454BA20(*v4, *(void *)(a2 + 24));
      uint64_t v8 = *(void *)(a1 + 16);
      unint64_t v9 = *(void *)(a1 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v5;
      sub_24454BAC4(v8, v9);
      goto LABEL_8;
    }
    sub_24454C18C(a1 + 16);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_24454BA20(*v4, *(void *)(a2 + 24));
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
LABEL_8:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24454C18C(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s14descr26F92FD41V13ConfigurationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = (void *)(a2 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 24);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = *v5;
      *(void *)(a1 + 24) = v7;
      sub_24454BAC4(v8, v6);
      goto LABEL_6;
    }
    sub_24454C18C(a1 + 16);
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
LABEL_6:
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14descr26F92FD41V13ConfigurationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14descr26F92FD41V13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationManager.Configuration()
{
  return &type metadata for ConversationManager.Configuration;
}

uint64_t sub_24454C350(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void Conversation.uuid.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  unint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454C700(v4, a1);

  os_unfair_lock_unlock(v5);
}

void sub_24454C40C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  unint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454C700(v4, a2);

  os_unfair_lock_unlock(v5);
}

uint64_t sub_24454C4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2445675A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *(void *)(*(void *)a2 + 16);
  uint64_t v13 = v7;
  uint64_t v9 = v8 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v8 + 16);
  uint64_t v10 = (os_unfair_lock_s *)(v8 + ((*(unsigned int *)(*(void *)v8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v10);
  sub_24454C770(v9);
  os_unfair_lock_unlock(v10);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t Conversation.uuid.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454C770(v4);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = sub_2445675A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
}

uint64_t sub_24454C700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2445675A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_24454C770(uint64_t a1)
{
  return sub_24454DF48(a1);
}

void (*Conversation.uuid.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = sub_2445675A0();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  unint64_t v7 = malloc(v6);
  uint64_t v8 = *(uint64_t **)(v1 + 16);
  v3[3] = v7;
  v3[4] = v8;
  uint64_t v9 = *v8;
  uint64_t v10 = *(void *)(*MEMORY[0x263F8DD00] + *v8 + 16);
  v3[5] = v10;
  uint64_t v11 = (uint64_t)v8 + v10;
  uint64_t v12 = *(unsigned int *)(v9 + 48);
  *((_DWORD *)v3 + 14) = v12;
  uint64_t v13 = (os_unfair_lock_s *)((char *)v8 + ((v12 + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v13);
  sub_24454C700(v11, (uint64_t)v7);
  v3[6] = 0;
  os_unfair_lock_unlock(v13);
  return sub_24454C8D4;
}

void sub_24454C8D4(uint64_t **a1, char a2)
{
  unint64_t v2 = *a1;
  uint64_t v4 = (void *)(*a1)[3];
  uint64_t v3 = (*a1)[4];
  uint64_t v6 = (*a1)[1];
  uint64_t v5 = (void *)(*a1)[2];
  uint64_t v7 = **a1;
  uint64_t v8 = (os_unfair_lock_s *)(v3 + ((*((unsigned int *)*a1 + 14) + 3) & 0x1FFFFFFFCLL));
  uint64_t v9 = v3 + (*a1)[5];
  if (a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[2], v4, v7);
    MEMORY[0x270FA5388](v10);
    os_unfair_lock_lock(v8);
    sub_24454C770(v9);
    os_unfair_lock_unlock(v8);
    uint64_t v11 = *(void (**)(void *, uint64_t))(v6 + 8);
    v11(v5, v7);
    v11(v4, v7);
  }
  else
  {
    ((void (*)(void))MEMORY[0x270FA5388])();
    os_unfair_lock_lock(v8);
    sub_24454C770(v9);
    os_unfair_lock_unlock(v8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v7);
  }
  free(v4);
  free(v5);
  free(v2);
}

void Conversation.state.getter(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454CC54(v4, a1);

  os_unfair_lock_unlock(v5);
}

void sub_24454CAFC(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454CC54(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_24454CBAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a2 + 16);
  uint64_t v3 = v2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_24454DF04(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_24454CC54@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = type metadata accessor for InternalConversationState(0);
  *a2 = *(unsigned char *)(a1 + *(int *)(result + 20));
  return result;
}

void Conversation.localMember.getter(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454CEF0(v4, a1);

  os_unfair_lock_unlock(v5);
}

double sub_24454CD4C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_24454CEF0(v4, (uint64_t *)v9);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = v10;
  double result = *(double *)v9;
  long long v8 = v9[1];
  *(_OWORD *)a2 = v9[0];
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v6;
  return result;
}

void *sub_24454CE04(uint64_t a1, uint64_t a2)
{
  sub_24454DDBC(a1, (uint64_t)v7);
  uint64_t v3 = *(void *)(*(void *)a2 + 16);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  sub_24454DE84(v7, (void (*)(void, void, void, void, void))sub_24454DE40);
  os_unfair_lock_lock(v5);
  sub_24454DE24(v4);
  os_unfair_lock_unlock(v5);
  return sub_24454DE84(v7, (void (*)(void, void, void, void, void))sub_24454DEC0);
}

uint64_t sub_24454CEF0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for InternalConversationState(0) + 24));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  *a2 = *v3;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  return sub_24454DE40(v4, v5, v6);
}

uint64_t sub_24454CF50(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for InternalConversationState(0) + 24));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  sub_24454DE84(a2, (void (*)(void, void, void, void, void))sub_24454DE40);
  sub_24454DEC0(v4, v5, v6);
  return sub_24454DDBC((uint64_t)a2, (uint64_t)v3);
}

uint64_t sub_24454CFF0(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for InternalConversationState(0);
  *(unsigned char *)(a1 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t Conversation.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit12Conversation___observationRegistrar;
  uint64_t v2 = sub_244567600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t Conversation.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit12Conversation___observationRegistrar;
  uint64_t v2 = sub_244567600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t Conversation.debugDescription.getter()
{
  uint64_t v1 = sub_2445675A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v11[0] = 0;
  *((void *)&v11[0] + 1) = 0xE000000000000000;
  sub_2445678E0();
  long long v13 = v11[0];
  sub_2445676E0();
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = v5 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v5 + 16);
  uint64_t v7 = (os_unfair_lock_s *)(v5 + ((*(unsigned int *)(*(void *)v5 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  sub_24454C700(v6, (uint64_t)v4);
  os_unfair_lock_unlock(v7);
  sub_24454D3E8();
  sub_244567AC0();
  sub_2445676E0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_2445676E0();
  os_unfair_lock_lock(v7);
  sub_24454CC54(v6, v11);
  os_unfair_lock_unlock(v7);
  LOBYTE(v9[0]) = v11[0];
  sub_2445679B0();
  sub_2445676E0();
  os_unfair_lock_lock(v7);
  sub_24454CEF0(v6, (uint64_t *)v11);
  os_unfair_lock_unlock(v7);
  v9[0] = v11[0];
  v9[1] = v11[1];
  uint64_t v10 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E885D0);
  sub_2445676B0();
  sub_2445676E0();
  swift_bridgeObjectRelease();
  sub_2445676E0();
  return v13;
}

unint64_t sub_24454D3E8()
{
  unint64_t result = qword_268E885C8;
  if (!qword_268E885C8)
  {
    sub_2445675A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E885C8);
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

uint64_t sub_24454D484()
{
  return Conversation.debugDescription.getter();
}

uint64_t sub_24454D4C0()
{
  return type metadata accessor for Conversation(0);
}

uint64_t type metadata accessor for Conversation(uint64_t a1)
{
  return sub_24454DCE4(a1, (uint64_t *)&unk_268E885D8);
}

uint64_t sub_24454D4E8()
{
  uint64_t result = sub_244567600();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for Conversation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Conversation);
}

void *sub_24454D5A0(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2445675A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *((void *)v10 + 2);
    if (v11)
    {
      *uint64_t v9 = *v10;
      *((void *)v9 + 1) = *((void *)v10 + 1);
      *((void *)v9 + 2) = v11;
      uint64_t v12 = *((void *)v10 + 4);
      *((void *)v9 + 3) = *((void *)v10 + 3);
      *((void *)v9 + 4) = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v14 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v14;
      *((void *)v9 + 4) = *((void *)v10 + 4);
    }
  }
  return a1;
}

uint64_t sub_24454D6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = *(void *)(a1 + *(int *)(a2 + 24) + 16);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24454D744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
    *(void *)(v8 + 8) = *(void *)(v9 + 8);
    *(void *)(v8 + 16) = v10;
    uint64_t v11 = *(void *)(v9 + 32);
    *(void *)(v8 + 24) = *(void *)(v9 + 24);
    *(void *)(v8 + 32) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
  }
  return a1;
}

uint64_t sub_24454D808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 16);
  uint64_t v11 = *((void *)v9 + 2);
  if (v10)
  {
    if (v11)
    {
      *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
      *(void *)(v8 + 8) = *((void *)v9 + 1);
      *(void *)(v8 + 16) = *((void *)v9 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v8 + 24) = *((void *)v9 + 3);
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24454D950(v8);
      uint64_t v12 = *((void *)v9 + 4);
      long long v13 = v9[1];
      *(_OWORD *)uint64_t v8 = *v9;
      *(_OWORD *)(v8 + 16) = v13;
      *(void *)(v8 + 32) = v12;
    }
  }
  else if (v11)
  {
    *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
    *(void *)(v8 + 8) = *((void *)v9 + 1);
    *(void *)(v8 + 16) = *((void *)v9 + 2);
    *(void *)(v8 + 24) = *((void *)v9 + 3);
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v14 = *v9;
    long long v15 = v9[1];
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(_OWORD *)uint64_t v8 = v14;
    *(_OWORD *)(v8 + 16) = v15;
  }
  return a1;
}

uint64_t sub_24454D950(uint64_t a1)
{
  return a1;
}

uint64_t sub_24454D9A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t sub_24454DA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (!*(void *)(a1 + v7 + 16)) {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {
    sub_24454D950(a1 + v7);
LABEL_5:
    long long v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
    return a1;
  }
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(void *)(v8 + 16) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 32);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  *(void *)(v8 + 32) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24454DB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24454DB20);
}

uint64_t sub_24454DB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2445675A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 16);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_24454DBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24454DC04);
}

uint64_t sub_24454DC04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2445675A0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 16) = a2;
  }
  return result;
}

uint64_t type metadata accessor for InternalConversationState(uint64_t a1)
{
  return sub_24454DCE4(a1, (uint64_t *)&unk_268E885E8);
}

uint64_t sub_24454DCE4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24454DD1C()
{
  uint64_t result = sub_2445675A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24454DDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E885D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24454DE24(uint64_t a1)
{
  return sub_24454CF50(a1, *(void **)(v1 + 16));
}

uint64_t sub_24454DE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_24454DE84(void *a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_24454DEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24454DF04(uint64_t a1)
{
  char v3 = *(unsigned char *)(v1 + 16);
  uint64_t result = type metadata accessor for InternalConversationState(0);
  *(unsigned char *)(a1 + *(int *)(result + 20)) = v3;
  return result;
}

uint64_t sub_24454DF48(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = sub_2445675A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, v3, v4);
}

uint64_t sub_24454DFB8(void *a1)
{
  uint64_t v3 = sub_2445675A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for InternalConversationState(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2445675F0();
  id v10 = objc_msgSend(a1, sel_UUID);
  sub_244567590();

  id v11 = a1;
  if (objc_msgSend(v11, sel_hasEnded))
  {

    char v12 = 5;
  }
  else if (objc_msgSend(v11, sel_isOnHold))
  {

    char v12 = 3;
  }
  else
  {
    unsigned int v13 = objc_msgSend(v11, sel_hasConnected);

    if (v13) {
      char v12 = 2;
    }
    else {
      char v12 = 0;
    }
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v6, v3);
  v9[*(int *)(v7 + 20)] = v12;
  long long v14 = &v9[*(int *)(v7 + 24)];
  *((void *)v14 + 4) = 0;
  *(_OWORD *)long long v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E885F8);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + ((*(unsigned int *)(*(void *)v15 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_24454E244((uint64_t)v9, v15 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v15 + 16));
  sub_24454E2A8((uint64_t)v9);
  *(void *)(v1 + 16) = v15;
  return v1;
}

uint64_t sub_24454E244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalConversationState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24454E2A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalConversationState(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

void ConversationAction.uuid.getter()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction), sel_UUID));
  sub_244567590();
}

uint64_t ConversationAction.conversationUUID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24454E4E0(&OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, MEMORY[0x263F07508], a1);
}

uint64_t ConversationAction.state.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  swift_beginAccess();
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return sub_24454E4AC(v4, v5);
}

uint64_t sub_24454E4AC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t ConversationAction.timeoutDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24454E4E0(&OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, MEMORY[0x263F07490], a1);
}

uint64_t sub_24454E4E0@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  uint64_t v7 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, v6, v7);
}

uint64_t ConversationAction.__allocating_init(conversationUUID:timeoutDate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_244567560();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2445675A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC8C0]), sel_init);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  uint64_t v14 = (*(uint64_t (**)(char *, char *, id))(v2 + 112))(v12, v8, v13);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v14;
}

uint64_t sub_24454E75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a3;
  uint64_t v7 = v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v8 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a1, v8);
  uint64_t v9 = (void *)(v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v11 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a2, v11);
  return v6;
}

Swift::Void __swiftcall ConversationAction.fulfill()()
{
}

Swift::Void __swiftcall ConversationAction.fail()()
{
}

id sub_24454E878(const char *a1, SEL *a2)
{
  uint64_t v5 = v2;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_244567630();
  __swift_project_value_buffer(v6, (uint64_t)qword_268E88BA0);
  swift_retain_n();
  uint64_t v7 = sub_244567610();
  os_log_type_t v8 = sub_2445677F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    type metadata accessor for ConversationAction();
    swift_retain();
    uint64_t v11 = sub_2445676C0();
    uint64_t v14 = sub_24454EB60(v11, v12, &v15);
    sub_244567830();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244549000, v7, v8, a1, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v10, -1, -1);
    MEMORY[0x245692540](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction), *a2, v14, v15);
}

uint64_t ConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24454EB60(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24454EC34(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24454F354((uint64_t)v12, *a3);
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
      sub_24454F354((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24454EC34(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_244567840();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24454EDF0(a5, a6);
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
  uint64_t v8 = sub_244567950();
  if (!v8)
  {
    sub_2445679C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_244567A10();
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

uint64_t sub_24454EDF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24454EE88(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24454F068(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24454F068(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24454EE88(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24454F000(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2445678F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2445679C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2445676F0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_244567A10();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2445679C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24454F000(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E88610);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24454F068(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E88610);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_244567A10();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ConversationAction()
{
  uint64_t result = qword_268E88600;
  if (!qword_268E88600) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24454F204()
{
  return type metadata accessor for ConversationAction();
}

uint64_t sub_24454F20C()
{
  uint64_t result = sub_2445675A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_244567560();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for ConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConversationAction);
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

uint64_t sub_24454F354(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t Conversation.State.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 6;
  if (result < 6) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t Conversation.State.rawValue.getter()
{
  return *v0;
}

BOOL sub_24454F3D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24454F3E4@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return Conversation.State.init(rawValue:)(*a1, a2);
}

void sub_24454F3EC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24454F3F8()
{
  return sub_244567710();
}

uint64_t sub_24454F458()
{
  return sub_244567700();
}

unint64_t sub_24454F4AC()
{
  unint64_t result = qword_268E88618;
  if (!qword_268E88618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88618);
  }
  return result;
}

uint64_t sub_24454F500()
{
  return sub_244567B30();
}

uint64_t sub_24454F548()
{
  return sub_244567B10();
}

uint64_t sub_24454F574()
{
  return sub_244567B30();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s5StateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s5StateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24454F724);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_24454F74C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24454F754(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Conversation.State()
{
  return &type metadata for Conversation.State;
}

unint64_t sub_24454F76C()
{
  unint64_t result = qword_268E88620;
  if (!qword_268E88620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88620);
  }
  return result;
}

uint64_t sub_24454F7C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    sub_244567980();
    uint64_t v4 = a1 + 64;
    do
    {
      uint64_t v5 = *(unsigned __int8 *)(v4 - 32) + 1;
      id v6 = objc_allocWithZone(MEMORY[0x263EFC938]);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      BOOL v7 = (void *)sub_244567690();
      swift_bridgeObjectRelease();
      id v8 = objc_msgSend(v6, sel_initWithType_value_, v5, v7);

      int64_t v9 = (void *)sub_244567690();
      objc_msgSend(v8, sel_setSiriDisplayName_, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_244567960();
      sub_244567990();
      sub_2445679A0();
      sub_244567970();
      v4 += 40;
      --v2;
    }
    while (v2);
    return v10;
  }
  return result;
}

uint64_t StartConversationAction.handles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StartConversationAction.isVideo.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_isVideo);
}

uint64_t StartConversationAction.__allocating_init(conversationUUID:handles:isVideo:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = swift_allocObject();
  StartConversationAction.init(conversationUUID:handles:isVideo:)(a1, a2, a3);
  return v6;
}

uint64_t StartConversationAction.init(conversationUUID:handles:isVideo:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  char v5 = a3;
  int v23 = a3;
  uint64_t v8 = sub_244567560();
  uint64_t v24 = *(void *)(v8 - 8);
  uint64_t v25 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_2445675A0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_handles) = a2;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_isVideo) = v5;
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_24454F7C0(v15);
  swift_bridgeObjectRelease();
  id v16 = objc_allocWithZone(MEMORY[0x263EFC978]);
  uint64_t v17 = (void *)sub_244567570();
  sub_24454FC44();
  id v18 = (void *)sub_244567730();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_initWithCallUUID_handles_, v17, v18);

  objc_msgSend(v19, sel_setVideo_, v23 & 1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  *(void *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v19;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v14, v11);
  v20 = (void *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  void *v20 = 0;
  v20[1] = 0;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v24 + 32))(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v10, v25);
  return v4;
}

unint64_t sub_24454FC44()
{
  unint64_t result = qword_268E88628;
  if (!qword_268E88628)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268E88628);
  }
  return result;
}

uint64_t sub_24454FC84(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_244567560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2445675A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  id v12 = objc_msgSend(a1, sel_handles);
  sub_24454FC44();
  unint64_t v13 = sub_244567740();

  if (!(v13 >> 62))
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_17:
    *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_handles) = v17;
    unsigned __int8 v33 = objc_msgSend(a1, sel_isVideo);
    *(unsigned char *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_isVideo) = v33;
    swift_release();
    id v34 = objc_msgSend(a1, sel_callUUID);
    sub_244567590();

    sub_244567540();
    *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v11, v8);
    v35 = (void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
    void *v35 = 0;
    v35[1] = 0;
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v4);
    return v2;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_2445679D0();
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v46 = v14;
  uint64_t v47 = MEMORY[0x263F8EE78];
  uint64_t result = sub_244550790(0, v14 & ~(v14 >> 63), 0);
  if ((v46 & 0x8000000000000000) == 0)
  {
    v36 = v11;
    uint64_t v37 = v9;
    uint64_t v38 = v8;
    v39 = a1;
    v40 = v7;
    uint64_t v41 = v5;
    uint64_t v42 = v4;
    uint64_t v43 = v2;
    uint64_t v16 = 0;
    unint64_t v44 = v13 & 0xC000000000000001;
    unint64_t v45 = v13;
    uint64_t v17 = v47;
    do
    {
      if (v44) {
        id v18 = (id)MEMORY[0x245691DF0](v16, v45);
      }
      else {
        id v18 = *(id *)(v45 + 8 * v16 + 32);
      }
      id v19 = v18;
      id v20 = objc_msgSend(v18, sel_value, v36, v37, v38, v39, v40, v41, v42, v43);
      uint64_t v21 = sub_2445676A0();
      uint64_t v23 = v22;

      id v24 = objc_msgSend(v19, sel_type);
      if (v24 == (id)3) {
        char v25 = 2;
      }
      else {
        char v25 = v24 == (id)2;
      }
      id v26 = objc_msgSend(v19, sel_value);
      uint64_t v27 = sub_2445676A0();
      uint64_t v29 = v28;

      uint64_t v47 = v17;
      unint64_t v31 = *(void *)(v17 + 16);
      unint64_t v30 = *(void *)(v17 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_244550790(v30 > 1, v31 + 1, 1);
        uint64_t v17 = v47;
      }
      *(void *)(v17 + 16) = v31 + 1;
      uint64_t v32 = v17 + 40 * v31;
      *(unsigned char *)(v32 + 32) = v25;
      ++v16;
      *(void *)(v32 + 40) = v21;
      *(void *)(v32 + 48) = v23;
      *(void *)(v32 + 56) = v27;
      *(void *)(v32 + 64) = v29;
    }
    while (v46 != v16);
    swift_bridgeObjectRelease();
    uint64_t v4 = v42;
    uint64_t v2 = v43;
    BOOL v7 = v40;
    uint64_t v5 = v41;
    uint64_t v8 = v38;
    a1 = v39;
    uint64_t v11 = v36;
    uint64_t v9 = v37;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void StartConversationAction.fulfill(dateStarted:)(uint64_t a1)
{
  uint64_t v3 = sub_244567560();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_244567630();
  __swift_project_value_buffer(v7, (uint64_t)qword_268E88BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  swift_retain_n();
  uint64_t v8 = sub_244567610();
  os_log_type_t v9 = sub_2445677F0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v19[1] = a1;
    uint64_t v11 = v10;
    v19[0] = swift_slowAlloc();
    uint64_t v20 = v1;
    uint64_t v21 = v19[0];
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_retain();
    uint64_t v12 = sub_2445676C0();
    uint64_t v20 = sub_24454EB60(v12, v13, &v21);
    sub_244567830();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_244550648();
    uint64_t v14 = sub_244567AC0();
    uint64_t v20 = sub_24454EB60(v14, v15, &v21);
    sub_244567830();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _os_log_impl(&dword_244549000, v8, v9, "Fulfilling action %s with dateStarted %s", (uint8_t *)v11, 0x16u);
    uint64_t v16 = v19[0];
    swift_arrayDestroy();
    MEMORY[0x245692540](v16, -1, -1);
    MEMORY[0x245692540](v11, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  self;
  uint64_t v17 = (void *)swift_dynamicCastObjCClassUnconditional();
  id v18 = (void *)sub_244567530();
  objc_msgSend(v17, sel_fulfillWithDateStarted_, v18);
}

void sub_2445503F4()
{
}

uint64_t sub_244550424()
{
  return swift_bridgeObjectRelease();
}

uint64_t StartConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StartConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

unint64_t sub_244550648()
{
  unint64_t result = qword_268E88630;
  if (!qword_268E88630)
  {
    sub_244567560();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88630);
  }
  return result;
}

uint64_t sub_2445506A0()
{
  return type metadata accessor for StartConversationAction();
}

uint64_t type metadata accessor for StartConversationAction()
{
  uint64_t result = qword_268E88638;
  if (!qword_268E88638) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2445506F4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartConversationAction);
}

uint64_t dispatch thunk of StartConversationAction.__allocating_init(conversationUUID:handles:isVideo:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_244550770(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2445507B0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_244550790(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_244550910(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2445507B0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E88650);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_244567A10();
  __break(1u);
  return result;
}

uint64_t sub_244550910(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E88648);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_244567A10();
  __break(1u);
  return result;
}

uint64_t MergeConversationAction.conversationUUIDToMergeWith.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith;
  uint64_t v4 = sub_2445675A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t MergeConversationAction.__allocating_init(conversationUUID:conversationUUIDToMergeWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  MergeConversationAction.init(conversationUUID:conversationUUIDToMergeWith:)(a1, a2);
  return v4;
}

uint64_t MergeConversationAction.init(conversationUUID:conversationUUIDToMergeWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_244567560();
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v28 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2445675A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  size_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88658);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v26 = a2;
  v15(v14, a2, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  swift_retain();
  uint64_t v27 = a1;
  uint64_t v16 = (void *)sub_244567570();
  uint64_t v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) != 1)
  {
    uint64_t v17 = (void *)sub_244567570();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC960]), sel_initWithCallUUID_callUUIDToGroupWith_, v16, v17);

  uint64_t v19 = v26;
  v15((char *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith), v26, v8);
  swift_release();
  uint64_t v20 = v27;
  v15(v11, v27, v8);
  uint64_t v21 = v28;
  sub_244567540();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v22(v19, v8);
  v22(v20, v8);
  *(void *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v11, v8);
  uint64_t v23 = (void *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v23 = 0;
  v23[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v21, v30);
  return v3;
}

uint64_t sub_244550EBC(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_244567560();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2445675A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith, a2, v9);
  id v13 = objc_msgSend(a1, sel_callUUID);
  sub_244567590();

  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v9);
  uint64_t v14 = (void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  void *v14 = 0;
  v14[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v8, v5);
  return v2;
}

void sub_2445510E4()
{
}

uint64_t sub_244551114()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith;
  uint64_t v2 = sub_2445675A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t MergeConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v4 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v5 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  v3(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith, v2);
  return v0;
}

uint64_t MergeConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v4 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v5 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  v3(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith, v2);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v6, v7);
}

uint64_t sub_2445513D4()
{
  return type metadata accessor for MergeConversationAction();
}

uint64_t type metadata accessor for MergeConversationAction()
{
  uint64_t result = qword_268E88660;
  if (!qword_268E88660) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_244551428()
{
  uint64_t result = sub_2445675A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MergeConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MergeConversationAction);
}

uint64_t dispatch thunk of MergeConversationAction.__allocating_init(conversationUUID:conversationUUIDToMergeWith:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t sub_2445514E4(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = sub_244567A00();
  uint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_244558AB4(v16, (uint64_t)v9, a2);
    unint64_t result = sub_244556D50((uint64_t)v9);
    if (v19) {
      break;
    }
    unint64_t v20 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = v11[6];
    uint64_t v22 = sub_2445675A0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v20, v9, v22);
    *(void *)(v11[7] + 8 * v20) = *(void *)&v9[v13];
    uint64_t v23 = v11[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    _OWORD v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

uint64_t sub_2445516D0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v2) {
      break;
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t result = sub_244567980();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = MEMORY[0x245691DF0](v4, a1);
      }
      else
      {
        uint64_t v5 = *(void *)(a1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      id v6 = *(id *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction);
      swift_release();
      sub_244567960();
      sub_244567990();
      sub_2445679A0();
      sub_244567970();
      if (v2 == v4) {
        return v7;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2445679D0();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ConversationManager.conversations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2445518C0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
  sub_2445675C0();
  swift_release();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_244551970()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ConversationManager()
{
  uint64_t result = qword_268E886C0;
  if (!qword_268E886C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ConversationManager.delegate.getter()
{
  swift_beginAccess();
  return MEMORY[0x2456925F0](v0 + 32);
}

uint64_t ConversationManager.delegate.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 40) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*ConversationManager.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2456925F0](v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  v3[3] = v4;
  v3[4] = v5;
  return sub_244551BCC;
}

void sub_244551BCC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 40) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t sub_244551C50()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244551D08@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
  sub_2445675C0();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 80);
  return swift_bridgeObjectRetain();
}

uint64_t sub_244551DC8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_244551EA8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 80) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244551F10()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244551FC8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
  sub_2445675C0();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 88);
  return swift_bridgeObjectRetain();
}

uint64_t sub_244552088()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_244552168(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 88) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t ConversationManager.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v1 + 136);
  char v5 = *(unsigned char *)(v1 + 144);
  char v6 = *(unsigned char *)(v1 + 145);
  uint64_t v7 = *(void *)(v1 + 152);
  *(void *)a1 = *(void *)(v1 + 96);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  long long v9 = *(_OWORD *)(v1 + 120);
  *(_OWORD *)(a1 + 24) = v9;
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 49) = v6;
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  sub_24454BA0C(v3, v9);

  return swift_bridgeObjectRetain();
}

uint64_t ConversationManager.pendingActions.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 64), sel_pendingTransactions);
  sub_244558A60(0, &qword_268E88680);
  unint64_t v2 = sub_244567740();

  unint64_t v3 = sub_244552318(v2);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v4 = sub_244557FAC(v3, v0);
  swift_bridgeObjectRelease();
  swift_release();
  return v4;
}

uint64_t sub_244552318(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_2445679D0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x245691DF0](i - 4, a1) : *(id *)(a1 + 8 * i);
      char v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_actions);
      sub_244558A60(0, &qword_268E88698);
      unint64_t v8 = sub_244567740();

      sub_2445578E4(v8);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

id ConversationManager.__allocating_init(configuration:)(long long *a1)
{
  long long v1 = a1[1];
  long long v6 = *a1;
  long long v7 = v1;
  long long v2 = a1[3];
  id result = objc_msgSend(self, sel_sharedInstance, v6, v7, a1[2], v2);
  if (result)
  {
    id v4 = result;
    uint64_t v5 = sub_2445582B4((uint64_t *)&v6, result);

    return (id)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2445524F4(long long *a1, void *a2, uint64_t a3)
{
  long long v36 = a1[1];
  long long v37 = *a1;
  uint64_t v6 = *((void *)a1 + 4);
  uint64_t v7 = *((void *)a1 + 5);
  char v8 = *((unsigned char *)a1 + 48);
  char v9 = *((unsigned char *)a1 + 49);
  uint64_t v10 = *((void *)a1 + 7);
  *(void *)(v3 + 40) = 0;
  swift_unknownObjectWeakInit();
  sub_2445675F0();
  *(_OWORD *)(v3 + 96) = v37;
  *(_OWORD *)(v3 + 112) = v36;
  *(void *)(v3 + 128) = v6;
  *(void *)(v3 + 136) = v7;
  *(unsigned char *)(v3 + 144) = v8;
  *(unsigned char *)(v3 + 145) = v9;
  *(void *)(v3 + 152) = v10;
  id v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CallProviderWrapper()), sel_init);
  *(void *)(v3 + 64) = a2;
  *(void *)(v3 + 72) = v11;
  *(void *)(v3 + 16) = a3;
  id v12 = objc_allocWithZone(MEMORY[0x263EFC8D8]);
  id v13 = a2;
  swift_retain();
  id v14 = objc_msgSend(v12, sel_init);
  *(void *)(v3 + 48) = v14;
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)(v3 + 80) = sub_2445514E4(MEMORY[0x263F8EE78], &qword_268E88700, &qword_268E886D8);
  *(void *)(v3 + 88) = sub_2445514E4(v15, &qword_268E88700, &qword_268E886D8);
  id v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CallObserverDelegateWrapper()), sel_init);
  *(void *)(v3 + 56) = v16;
  *(void *)(v3 + 24) = v15;
  id v17 = objc_msgSend(v14, sel_callObserver);
  objc_msgSend(v17, sel_setDelegate_queue_, v16, 0);

  id v18 = (void *)(*(void *)(v3 + 56)
                 + OBJC_IVAR____TtC20LiveCommunicationKit27CallObserverDelegateWrapper_onCallChanged);
  *id v18 = sub_2445587E8;
  v18[1] = v3;
  swift_retain();
  swift_release();
  char v19 = (void *)(*(void *)(v3 + 72) + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidReset);
  *char v19 = sub_2445587EC;
  v19[1] = v3;
  swift_retain();
  swift_release();
  unint64_t v20 = (void *)(*(void *)(v3 + 72) + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidBegin);
  void *v20 = sub_2445587F0;
  v20[1] = v3;
  swift_retain();
  swift_release();
  uint64_t v21 = (void *)(*(void *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidActivateAudioSession);
  *uint64_t v21 = sub_2445587F4;
  v21[1] = v3;
  swift_retain();
  swift_release();
  uint64_t v22 = (void *)(*(void *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidDeactivateAudioSession);
  *uint64_t v22 = sub_2445587F8;
  v22[1] = v3;
  swift_retain();
  swift_release();
  uint64_t v23 = (void *)(*(void *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderTimedOutPerformingAction);
  *uint64_t v23 = sub_244558BF8;
  v23[1] = v3;
  swift_retain();
  swift_release();
  BOOL v24 = (void *)(*(void *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAction);
  *BOOL v24 = sub_2445587FC;
  v24[1] = v3;
  swift_retain();
  swift_release();
  uint64_t v25 = (uint64_t (**)(void *))(*(void *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformStartCallAction);
  *uint64_t v25 = sub_244558800;
  v25[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  uint64_t v26 = (uint64_t (**)(void *))(*(void *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAnswerCallAction);
  *uint64_t v26 = sub_244558850;
  v26[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  uint64_t v27 = (uint64_t (**)(void *))(*(void *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformEndCallAction);
  os_unfair_lock_s *v27 = sub_244558888;
  v27[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  uint64_t v28 = (uint64_t (**)(void *))(*(void *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetHeldCallAction);
  *uint64_t v28 = sub_2445588C0;
  v28[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  uint64_t v29 = (void *)(*(void *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetGroupCallAction);
  *uint64_t v29 = sub_244558910;
  v29[1] = v3;
  swift_retain();
  swift_release();
  uint64_t v30 = (uint64_t (**)(void *))(*(void *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetMutedCallAction);
  *uint64_t v30 = sub_244558914;
  v30[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  unint64_t v31 = (uint64_t (**)(void *))(*(void *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformPlayDTMFCallAction);
  *unint64_t v31 = sub_244558964;
  v31[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  uint64_t v32 = *(void **)(v3 + 72);
  id v33 = *(id *)(v3 + 64);
  id v34 = v32;
  objc_msgSend(v33, sel_setDelegate_queue_, v34, 0);

  swift_release();
  return v3;
}

uint64_t sub_244552A00(void *a1)
{
  uint64_t v2 = v1;
  id v4 = *(os_unfair_lock_s **)(*(void *)(v1 + 16) + 16);
  uint64_t v5 = (uint64_t *)&v4[4];
  uint64_t v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_244558A44(v5, (uint64_t)v27);
  os_unfair_lock_unlock(v6);
  uint64_t v7 = v27[0];
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_244567630();
  __swift_project_value_buffer(v8, (uint64_t)qword_268E88BA0);
  id v9 = a1;
  swift_retain_n();
  id v10 = v9;
  id v11 = sub_244567610();
  os_log_type_t v12 = sub_2445677F0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v27[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    sub_244558A60(0, &qword_268E886F0);
    id v15 = v10;
    uint64_t v16 = sub_2445676C0();
    sub_24454EB60(v16, v17, v27);
    sub_244567830();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    type metadata accessor for Conversation(0);
    swift_retain();
    uint64_t v18 = sub_2445676C0();
    sub_24454EB60(v18, v19, v27);
    sub_244567830();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244549000, v11, v12, "Call changed %s %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245692540](v14, -1, -1);
    MEMORY[0x245692540](v13, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  id v20 = objc_msgSend(*(id *)(v2 + 48), sel_callObserver);
  id v21 = objc_msgSend(v20, sel_calls);

  sub_244558A60(0, &qword_268E886F0);
  uint64_t v22 = (os_unfair_lock_s *)sub_244567740();

  swift_retain();
  sub_244557DFC(v22);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v27[0] = v2;
  sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
  sub_2445675B0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (MEMORY[0x2456925F0](v2 + 32))
  {
    uint64_t v24 = *(void *)(v2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8))(v2, v7, ObjectType, v24);
    swift_unknownObjectRelease();
  }
  return swift_release();
}

uint64_t sub_244552E4C()
{
  uint64_t v1 = v0;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_244567630();
  __swift_project_value_buffer(v2, (uint64_t)qword_268E88BA0);
  uint64_t v3 = sub_244567610();
  os_log_type_t v4 = sub_2445677F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_24454EB60(0xD000000000000013, 0x800000024456A880, v10);
    sub_244567830();
    _os_log_impl(&dword_244549000, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v6, -1, -1);
    MEMORY[0x245692540](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x2456925F0](v1 + 32);
  if (result)
  {
    uint64_t v8 = *(void *)(v1 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v1, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_244553024()
{
  uint64_t v1 = v0;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_244567630();
  __swift_project_value_buffer(v2, (uint64_t)qword_268E88BA0);
  uint64_t v3 = sub_244567610();
  os_log_type_t v4 = sub_2445677F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_24454EB60(0xD000000000000013, 0x800000024456A860, v10);
    sub_244567830();
    _os_log_impl(&dword_244549000, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v6, -1, -1);
    MEMORY[0x245692540](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x2456925F0](v1 + 32);
  if (result)
  {
    uint64_t v8 = *(void *)(v1 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v1, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2445531FC(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_244567630();
  __swift_project_value_buffer(v4, (uint64_t)qword_268E88BA0);
  uint64_t v5 = sub_244567610();
  os_log_type_t v6 = sub_2445677F0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v12[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_24454EB60(0xD000000000000024, 0x800000024456A830, v12);
    sub_244567830();
    _os_log_impl(&dword_244549000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v8, -1, -1);
    MEMORY[0x245692540](v7, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x2456925F0](v2 + 32);
  if (result)
  {
    uint64_t v10 = *(void *)(v2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(v2, a1, ObjectType, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2445533DC(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_244567630();
  __swift_project_value_buffer(v4, (uint64_t)qword_268E88BA0);
  uint64_t v5 = sub_244567610();
  os_log_type_t v6 = sub_2445677F0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v12[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_24454EB60(0xD000000000000026, 0x800000024456A800, v12);
    sub_244567830();
    _os_log_impl(&dword_244549000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v8, -1, -1);
    MEMORY[0x245692540](v7, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x2456925F0](v2 + 32);
  if (result)
  {
    uint64_t v10 = *(void *)(v2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, a1, ObjectType, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_2445535BC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2445675A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_244567630();
  __swift_project_value_buffer(v8, (uint64_t)qword_268E88BA0);
  id v9 = a1;
  uint64_t v10 = sub_244567610();
  os_log_type_t v11 = sub_2445677F0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v36 = v4;
    uint64_t v13 = v12;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = v5;
    v39[0] = v34;
    *(_DWORD *)uint64_t v13 = 136315394;
    v37[0] = (id)sub_24454EB60(0xD000000000000025, 0x800000024456A7D0, v39);
    sub_244567830();
    *(_WORD *)(v13 + 12) = 2080;
    v37[0] = v9;
    sub_244558A60(0, &qword_268E88698);
    id v14 = v9;
    uint64_t v15 = sub_2445676C0();
    v37[0] = (id)sub_24454EB60(v15, v16, v39);
    sub_244567830();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244549000, v10, v11, "%s %s", (uint8_t *)v13, 0x16u);
    uint64_t v17 = v34;
    swift_arrayDestroy();
    uint64_t v5 = v35;
    MEMORY[0x245692540](v17, -1, -1);
    uint64_t v18 = v13;
    uint64_t v4 = v36;
    MEMORY[0x245692540](v18, -1, -1);
  }
  else
  {
  }
  id v19 = objc_msgSend(v9, sel_UUID);
  sub_244567590();

  swift_getKeyPath();
  v39[0] = v2;
  sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
  sub_2445675C0();
  swift_release();
  swift_beginAccess();
  uint64_t v20 = *(void *)(v2 + 88);
  if (*(void *)(v20 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_244556D50((uint64_t)v7);
    if (v22)
    {
      uint64_t v23 = *(void *)(*(void *)(v20 + 56) + 8 * v21);
      swift_retain();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_beginAccess();
      if (MEMORY[0x2456925F0](v2 + 32))
      {
        uint64_t v24 = *(void *)(v2 + 40);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 40))(v2, v23, ObjectType, v24);
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
      return;
    }
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v26 = v9;
  uint64_t v27 = sub_244567610();
  os_log_type_t v28 = sub_2445677E0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v37[0] = (id)v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v38 = (uint64_t)v26;
    sub_244558A60(0, &qword_268E88698);
    id v31 = v26;
    uint64_t v32 = sub_2445676C0();
    uint64_t v38 = sub_24454EB60(v32, v33, (uint64_t *)v37);
    sub_244567830();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244549000, v27, v28, "Timed out performing unknown action %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v30, -1, -1);
    MEMORY[0x245692540](v29, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_244553B4C(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v6 = sub_244567560();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2445675A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(0);
  uint64_t v14 = swift_allocObject();
  id v15 = a1;
  id v16 = objc_msgSend(v15, sel_callUUID, v19, v20);
  sub_244567590();

  sub_244567540();
  *(void *)(v14 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v14 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v13, v10);
  uint64_t v17 = (void *)(v14 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v17 = 0;
  v17[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v14 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v9, v6);
  sub_244556900(v14, v15);
  return swift_release();
}

uint64_t sub_244553D70(void *a1)
{
  uint64_t v25 = sub_244567560();
  uint64_t v2 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88658);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2445675A0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v25 - v13;
  id v15 = objc_msgSend(a1, sel_callUUIDToGroupWith);
  if (v15)
  {
    id v16 = v15;
    sub_244567590();

    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v17(v7, v12, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v17(v14, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
      type metadata accessor for MergeConversationAction();
      swift_allocObject();
      id v18 = a1;
      uint64_t v19 = sub_244550EBC(v18, (uint64_t)v12);
      sub_244556900(v19, v18);
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_244558508((uint64_t)v7);
  type metadata accessor for UnmergeConversationAction();
  uint64_t v21 = swift_allocObject();
  id v22 = a1;
  id v23 = objc_msgSend(v22, sel_callUUID);
  sub_244567590();

  sub_244567540();
  *(void *)(v21 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v21 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v8);
  uint64_t v24 = (void *)(v21 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v24 = 0;
  v24[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v21 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v4, v25);
  sub_244556900(v21, v22);
  return swift_release();
}

uint64_t sub_244554168(void *a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void))
{
  a3(0);
  swift_allocObject();
  id v6 = a1;
  uint64_t v7 = a4();
  sub_244556900(v7, v6);

  return swift_release();
}

uint64_t ConversationManager.perform(_:)(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88690);
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  v2[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2445542D4, 0, 0);
}

uint64_t sub_2445542D4()
{
  id v22 = v0;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_244567630();
  __swift_project_value_buffer(v1, (uint64_t)qword_268E88BA0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_244567610();
  os_log_type_t v3 = sub_2445677F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v21 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v6 = type metadata accessor for ConversationAction();
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = MEMORY[0x245691C30](v7, v6);
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    v0[19] = sub_24454EB60(v8, v10, &v21);
    sub_244567830();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244549000, v2, v3, "Performing actions %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245692540](v5, -1, -1);
    MEMORY[0x245692540](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v12 = v0[23];
  uint64_t v11 = v0[24];
  uint64_t v14 = v0[21];
  uint64_t v13 = v0[22];
  sub_2445516D0(v0[20]);
  id v15 = objc_allocWithZone(MEMORY[0x263EFC980]);
  sub_244558A60(0, &qword_268E88698);
  id v16 = (void *)sub_244567730();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_initWithActions_, v16);
  v0[25] = v17;

  id v18 = *(void **)(v14 + 48);
  v0[2] = v0;
  v0[3] = sub_244554678;
  swift_continuation_init();
  v0[17] = v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E886A0);
  sub_244567790();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 32))(boxed_opaque_existential_0, v11, v13);
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_244554870;
  v0[13] = &block_descriptor;
  objc_msgSend(v18, sel_requestTransaction_completion_, v17, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_244554678()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_2445547F4;
  }
  else {
    uint64_t v2 = sub_244554788;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_244554788()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2445547F4()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_244554870(uint64_t a1, void *a2)
{
  __swift_project_boxed_opaque_existential_0((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a2)
  {
    id v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E88690);
    sub_2445677A0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E88690);
    sub_2445677B0();
  }
}

uint64_t ConversationManager.reportNewIncomingConversation(uuid:update:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 240) = a1;
  *(void *)(v3 + 248) = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88690);
  *(void *)(v3 + 256) = v5;
  *(void *)(v3 + 264) = *(void *)(v5 - 8);
  *(void *)(v3 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E88658);
  *(void *)(v3 + 280) = swift_task_alloc();
  *(void *)(v3 + 288) = swift_task_alloc();
  uint64_t v6 = sub_2445675A0();
  *(void *)(v3 + 296) = v6;
  *(void *)(v3 + 304) = *(void *)(v6 - 8);
  *(void *)(v3 + 312) = swift_task_alloc();
  *(void *)(v3 + 320) = swift_task_alloc();
  *(void *)(v3 + 328) = swift_task_alloc();
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 336) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 352) = v7;
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 368) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 384) = v8;
  *(unsigned char *)(v3 + 145) = *(unsigned char *)(a2 + 64);
  return MEMORY[0x270FA2498](sub_244554A8C, 0, 0);
}

uint64_t sub_244554A8C()
{
  uint64_t v62 = v0;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v54 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 304);
  uint64_t v7 = sub_244567630();
  __swift_project_value_buffer(v7, (uint64_t)qword_268E88BA0);
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v50(v4, v54, v6);
  sub_24454DE40(v3, v2, v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24454DE40(v3, v2, v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v8 = sub_244567610();
  os_log_type_t v9 = sub_2445677F0();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v48 = v9;
    log = v8;
    uint64_t v10 = *(void *)(v0 + 328);
    uint64_t v11 = *(void *)(v0 + 296);
    uint64_t v12 = *(void *)(v0 + 304);
    uint64_t v13 = *(void *)(v0 + 280);
    uint64_t v14 = *(void *)(v0 + 288);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(void *)&v58[0] = v47;
    *(_DWORD *)uint64_t v15 = 136315650;
    *(void *)(v0 + 216) = sub_24454EB60(0xD00000000000002BLL, 0x800000024456A520, (uint64_t *)v58);
    sub_244567830();
    *(_WORD *)(v15 + 12) = 2080;
    v50(v14, v10, v11);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v14, 0, 1, v11);
    sub_244558AB4(v14, v13, &qword_268E88658);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
    {
      sub_244558508(*(void *)(v0 + 280));
      unint64_t v16 = 0xE300000000000000;
      uint64_t v44 = 7104878;
    }
    else
    {
      uint64_t v20 = *(void *)(v0 + 312);
      uint64_t v21 = *(void *)(v0 + 320);
      uint64_t v23 = *(void *)(v0 + 296);
      uint64_t v22 = *(void *)(v0 + 304);
      (*(void (**)(uint64_t, void, uint64_t))(v22 + 32))(v21, *(void *)(v0 + 280), v23);
      v50(v20, v21, v23);
      uint64_t v44 = sub_2445676C0();
      unint64_t v16 = v24;
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
    char v55 = *(unsigned char *)(v0 + 145);
    uint64_t v51 = *(void *)(v0 + 392);
    long long v46 = *(_OWORD *)(v0 + 376);
    uint64_t v25 = *(void *)(v0 + 360);
    uint64_t v45 = *(void *)(v0 + 368);
    uint64_t v26 = *(void *)(v0 + 344);
    uint64_t v27 = *(void *)(v0 + 352);
    uint64_t v28 = *(void *)(v0 + 336);
    uint64_t v43 = *(void *)(v0 + 328);
    uint64_t v30 = *(void *)(v0 + 296);
    uint64_t v29 = *(void *)(v0 + 304);
    sub_244558508(*(void *)(v0 + 288));
    *(void *)(v0 + 224) = sub_24454EB60(v44, v16, (uint64_t *)v58);
    sub_244567830();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v43, v30);
    *(_WORD *)(v15 + 22) = 2080;
    *(void *)(v0 + 80) = v28;
    *(void *)(v0 + 88) = v26;
    *(void *)(v0 + 96) = v27;
    *(void *)(v0 + 104) = v25;
    *(void *)(v0 + 112) = v45;
    *(_OWORD *)(v0 + 120) = v46;
    *(void *)(v0 + 136) = v51;
    *(unsigned char *)(v0 + 144) = v55;
    sub_24454DE40(v28, v26, v27);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2445676C0();
    *(void *)(v0 + 232) = sub_24454EB60(v31, v32, (uint64_t *)v58);
    sub_244567830();
    swift_bridgeObjectRelease();
    sub_24454DEC0(v28, v26, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24454DEC0(v28, v26, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244549000, log, v48, "%s %s %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x245692540](v47, -1, -1);
    MEMORY[0x245692540](v15, -1, -1);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 344);
    uint64_t v17 = *(void *)(v0 + 352);
    uint64_t v19 = *(void *)(v0 + 336);
    (*(void (**)(void, void))(*(void *)(v0 + 304) + 8))(*(void *)(v0 + 328), *(void *)(v0 + 296));
    sub_24454DEC0(v19, v18, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24454DEC0(v19, v18, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  char v33 = *(unsigned char *)(v0 + 145);
  uint64_t v34 = *(void *)(v0 + 384);
  uint64_t v35 = *(void *)(v0 + 392);
  long long v53 = *(_OWORD *)(v0 + 352);
  long long v56 = *(_OWORD *)(v0 + 368);
  long long v52 = *(_OWORD *)(v0 + 336);
  uint64_t v36 = *(void *)(v0 + 264);
  uint64_t v37 = *(void *)(v0 + 272);
  uint64_t v38 = *(void *)(v0 + 256);
  v57 = *(void **)(*(void *)(v0 + 248) + 64);
  uint64_t v39 = sub_244567570();
  *(void *)(v0 + 400) = v39;
  v58[0] = v52;
  v58[1] = v53;
  v58[2] = v56;
  uint64_t v59 = v34;
  uint64_t v60 = v35;
  char v61 = v33;
  id v40 = sub_24455D668();
  *(void *)(v0 + 408) = v40;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_244555198;
  swift_continuation_init();
  *(void *)(v0 + 208) = v38;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 184));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E886A0);
  sub_244567790();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v36 + 32))(boxed_opaque_existential_0, v37, v38);
  *(void *)(v0 + 152) = MEMORY[0x263EF8330];
  *(void *)(v0 + 160) = 1107296256;
  *(void *)(v0 + 168) = sub_244554870;
  *(void *)(v0 + 176) = &block_descriptor_4;
  objc_msgSend(v57, sel_reportNewIncomingCallWithUUID_update_completion_, v39, v40);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_244555198()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 416) = v1;
  if (v1) {
    uint64_t v2 = sub_244555368;
  }
  else {
    uint64_t v2 = sub_2445552A8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2445552A8()
{
  uint64_t v1 = *(void **)(v0 + 400);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_244555368()
{
  uint64_t v1 = (void *)v0[51];
  uint64_t v2 = (void *)v0[50];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void ConversationManager.reportConversationEvent(_:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = a2;
  uint64_t v68 = sub_244567560();
  uint64_t v3 = *(void *)(v68 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v68);
  v67 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  long long v8 = (char *)&v65 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v65 - v9;
  uint64_t v11 = sub_2445675A0();
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v72 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v65 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v65 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v65 - v21;
  uint64_t v23 = type metadata accessor for Conversation.Event();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244558568(a1, (uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v57 = v3;
      uint64_t v58 = v68;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v25, v68);
      uint64_t v59 = (void *)v69[8];
      uint64_t v60 = *(void *)(v70 + 16);
      uint64_t v61 = v60 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v60 + 16);
      uint64_t v62 = (os_unfair_lock_s *)(v60 + ((*(unsigned int *)(*(void *)v60 + 48) + 3) & 0x1FFFFFFFCLL));
      os_unfair_lock_lock(v62);
      sub_24454C700(v61, (uint64_t)v20);
      os_unfair_lock_unlock(v62);
      uint64_t v63 = (void *)sub_244567570();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v20, v72);
      v64 = (void *)sub_244567530();
      objc_msgSend(v59, sel_reportOutgoingCallWithUUID_startedConnectingAtDate_, v63, v64);

      (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v58);
      break;
    case 2u:
      uint64_t v39 = v3;
      uint64_t v40 = v68;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v25, v68);
      uint64_t v41 = (void *)v69[8];
      uint64_t v42 = *(void *)(v70 + 16);
      uint64_t v43 = v42 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v42 + 16);
      uint64_t v44 = (os_unfair_lock_s *)(v42 + ((*(unsigned int *)(*(void *)v42 + 48) + 3) & 0x1FFFFFFFCLL));
      os_unfair_lock_lock(v44);
      sub_24454C700(v43, (uint64_t)v17);
      os_unfair_lock_unlock(v44);
      uint64_t v45 = (void *)sub_244567570();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v17, v72);
      long long v46 = (void *)sub_244567530();
      objc_msgSend(v41, sel_reportOutgoingCallWithUUID_connectedAtDate_, v45, v46);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v40);
      break;
    case 3u:
      uint64_t v47 = v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0) + 48)];
      uint64_t v48 = v3;
      v50 = v67;
      uint64_t v49 = v68;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v67, v25, v68);
      uint64_t v51 = (void *)v69[8];
      uint64_t v52 = *(void *)(v70 + 16);
      uint64_t v53 = v52 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v52 + 16);
      uint64_t v54 = (os_unfair_lock_s *)(v52 + ((*(unsigned int *)(*(void *)v52 + 48) + 3) & 0x1FFFFFFFCLL));
      os_unfair_lock_lock(v54);
      sub_24454C700(v53, (uint64_t)v14);
      os_unfair_lock_unlock(v54);
      char v55 = (void *)sub_244567570();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v72);
      long long v56 = (void *)sub_244567530();
      objc_msgSend(v51, sel_reportCallWithUUID_endedAtDate_reason_, v55, v56, v47 + 1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v49);
      break;
    default:
      uint64_t v26 = *(void *)v25;
      uint64_t v27 = *((void *)v25 + 1);
      uint64_t v28 = *((void *)v25 + 2);
      uint64_t v29 = *((void *)v25 + 3);
      uint64_t v30 = *((void *)v25 + 4);
      uint64_t v31 = *((void *)v25 + 5);
      uint64_t v66 = *((void *)v25 + 6);
      uint64_t v32 = *((void *)v25 + 7);
      LODWORD(v67) = v25[64];
      char v33 = (void *)v69[8];
      uint64_t v68 = v32;
      v69 = v33;
      uint64_t v34 = *(void *)(v70 + 16);
      uint64_t v35 = v34 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v34 + 16);
      uint64_t v36 = (os_unfair_lock_s *)(v34 + ((*(unsigned int *)(*(void *)v34 + 48) + 3) & 0x1FFFFFFFCLL));
      os_unfair_lock_lock(v36);
      sub_24454C700(v35, (uint64_t)v22);
      os_unfair_lock_unlock(v36);
      uint64_t v37 = (void *)sub_244567570();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v22, v72);
      uint64_t v73 = v26;
      uint64_t v74 = v27;
      uint64_t v75 = v28;
      uint64_t v76 = v29;
      uint64_t v77 = v30;
      uint64_t v78 = v31;
      uint64_t v79 = v66;
      uint64_t v80 = v68;
      char v81 = (char)v67;
      id v38 = sub_24455D668();
      sub_24454DEC0(v26, v27, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v69, sel_reportCallWithUUID_updated_, v37, v38);

      break;
  }
}

uint64_t static ConversationManager.reportNewIncomingVoIPPushPayload(_:)(uint64_t a1)
{
  v1[20] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88690);
  v1[21] = v2;
  v1[22] = *(void *)(v2 - 8);
  v1[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_244555BF4, 0, 0);
}

uint64_t sub_244555BF4()
{
  uint64_t v18 = v0;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_244567630();
  __swift_project_value_buffer(v1, (uint64_t)qword_268E88BA0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_244567610();
  os_log_type_t v3 = sub_2445677F0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t type = v3;
    uint64_t v4 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[18] = sub_24454EB60(0xD000000000000024, 0x800000024456A550, &v17);
    sub_244567830();
    *(_WORD *)(v4 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_244567650();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[19] = sub_24454EB60(v5, v7, &v17);
    sub_244567830();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244549000, v2, type, "%s %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245692540](v14, -1, -1);
    MEMORY[0x245692540](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = v0[22];
  uint64_t v8 = v0[23];
  uint64_t v10 = v0[21];
  typea = self;
  uint64_t v11 = sub_244567640();
  v0[24] = v11;
  v0[2] = v0;
  v0[3] = sub_244555FA4;
  swift_continuation_init();
  v0[17] = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E886A0);
  sub_244567790();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 32))(boxed_opaque_existential_0, v8, v10);
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_244554870;
  v0[13] = &block_descriptor_8;
  objc_msgSend(typea, sel_reportNewIncomingVoIPPushPayload_completion_, v11, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_244555FA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_244556120;
  }
  else {
    uint64_t v2 = sub_2445560B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2445560B4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_244556120()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

Swift::Void __swiftcall ConversationManager.invalidate()()
{
  objc_msgSend(*(id *)(v0 + 64), sel_invalidate);
}

uint64_t ConversationManager.pendingConversationActions(of:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v37 = a2;
  uint64_t v36 = sub_2445675A0();
  uint64_t v5 = *(void *)(v36 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v36);
  uint64_t v35 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v34 = (char *)&v27 - v8;
  id v9 = objc_msgSend(*(id *)(v3 + 64), sel_pendingTransactions);
  sub_244558A60(0, &qword_268E88680);
  unint64_t v10 = sub_244567740();

  unint64_t v11 = sub_244552318(v10);
  swift_bridgeObjectRelease();
  swift_retain();
  unint64_t v12 = sub_244557FAC(v11, v3);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v38 = MEMORY[0x263F8EE78];
  if (v12 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2445679D0();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13)
    {
LABEL_3:
      unint64_t v14 = v12 & 0xC000000000000001;
      uint64_t v32 = (void (**)(uint64_t, uint64_t))(v5 + 8);
      char v33 = (void (**)(char *, char *, uint64_t))(v5 + 16);
      uint64_t v15 = 4;
      uint64_t v30 = v13;
      unint64_t v31 = v12;
      uint64_t v28 = a1;
      unint64_t v29 = v12 & 0xC000000000000001;
      uint64_t v16 = v36;
      while (1)
      {
        uint64_t v5 = v15 - 4;
        if (v14)
        {
          uint64_t v17 = (void *)MEMORY[0x245691DF0](v15 - 4, v12);
          uint64_t v18 = v15 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v17 = *(void **)(v12 + 8 * v15);
          swift_retain();
          uint64_t v18 = v15 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        if (*v17 == a1)
        {
          uint64_t v19 = (char *)v17 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
          swift_beginAccess();
          uint64_t v20 = v34;
          (*v33)(v34, v19, v16);
          uint64_t v21 = *(void *)(v37 + 16);
          uint64_t v22 = v21 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v21 + 16);
          uint64_t v23 = (os_unfair_lock_s *)(v21 + ((*(unsigned int *)(*(void *)v21 + 48) + 3) & 0x1FFFFFFFCLL));
          os_unfair_lock_lock(v23);
          uint64_t v24 = v35;
          sub_24454C700(v22, v35);
          os_unfair_lock_unlock(v23);
          LOBYTE(v23) = sub_244567580();
          uint64_t v25 = *v32;
          (*v32)(v24, v16);
          v25((uint64_t)v20, v16);
          if (v23)
          {
            sub_244567960();
            sub_244567990();
            sub_2445679A0();
            sub_244567970();
          }
          else
          {
            swift_release();
          }
          a1 = v28;
          unint64_t v14 = v29;
          uint64_t v13 = v30;
          unint64_t v12 = v31;
        }
        else
        {
          swift_release();
        }
        ++v15;
        if (v18 == v13)
        {
          swift_bridgeObjectRelease();
          return v38;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_244556570(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2445675A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  swift_beginAccess();
  id v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v15 = v4;
  v9(v7, v8, v4);
  swift_getKeyPath();
  uint64_t v17 = v2;
  sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
  swift_retain();
  sub_2445675C0();
  swift_release();
  uint64_t v17 = v2;
  swift_getKeyPath();
  sub_2445675E0();
  swift_release();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = 0x8000000000000000;
  sub_2445573DC(a1, (uint64_t)v7, isUniquelyReferenced_nonNull_native, &qword_268E886D8);
  *(void *)(v2 + 80) = v16;
  swift_bridgeObjectRelease();
  unint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  swift_endAccess();
  uint64_t v17 = v2;
  swift_getKeyPath();
  sub_2445675D0();
  swift_release();
  id v12 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                              + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction), sel_UUID));
  sub_244567590();

  swift_getKeyPath();
  uint64_t v17 = v2;
  swift_retain();
  sub_2445675C0();
  swift_release();
  uint64_t v17 = v2;
  swift_getKeyPath();
  sub_2445675E0();
  swift_release();
  swift_beginAccess();
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *(void *)(v2 + 88);
  *(void *)(v2 + 88) = 0x8000000000000000;
  sub_2445573DC(a1, (uint64_t)v7, v13, &qword_268E886D8);
  *(void *)(v2 + 88) = v16;
  swift_bridgeObjectRelease();
  v11(v7, v15);
  swift_endAccess();
  uint64_t v17 = v2;
  swift_getKeyPath();
  sub_2445675D0();
  return swift_release();
}

uint64_t sub_244556900(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_244567630();
  __swift_project_value_buffer(v6, (uint64_t)qword_268E88BA0);
  id v7 = a2;
  swift_retain_n();
  id v8 = v7;
  id v9 = sub_244567610();
  os_log_type_t v10 = sub_2445677F0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)uint64_t v11 = 136315650;
    uint64_t v12 = sub_244567900();
    sub_24454EB60(v12, v13, v23);
    sub_244567830();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_244558A60(0, &qword_268E88698);
    id v14 = v8;
    uint64_t v15 = sub_2445676C0();
    sub_24454EB60(v15, v16, v23);
    sub_244567830();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 22) = 2080;
    type metadata accessor for ConversationAction();
    swift_retain();
    uint64_t v17 = sub_2445676C0();
    sub_24454EB60(v17, v18, v23);
    sub_244567830();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244549000, v9, v10, "%s %s %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x245692540](v22, -1, -1);
    MEMORY[0x245692540](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  sub_244556570(a1);
  swift_beginAccess();
  uint64_t result = MEMORY[0x2456925F0](v3 + 32);
  if (result)
  {
    uint64_t v20 = *(void *)(v3 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 32))(v3, a1, ObjectType, v20);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t ConversationManager.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_2445585CC(v0 + 32);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 112);
  unint64_t v2 = *(void *)(v0 + 120);
  swift_bridgeObjectRelease();
  sub_24454BAB0(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit19ConversationManager___observationRegistrar;
  uint64_t v4 = sub_244567600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t ConversationManager.__deallocating_deinit()
{
  ConversationManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

unint64_t sub_244556D50(uint64_t a1)
{
  sub_2445675A0();
  sub_2445589E0(&qword_268E886E0, MEMORY[0x263F07508]);
  uint64_t v2 = sub_244567660();

  return sub_244556DE8(a1, v2);
}

unint64_t sub_244556DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_2445675A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_2445589E0(&qword_268E886E8, MEMORY[0x263F07508]);
      char v15 = sub_244567680();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_244556FA8(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_2445675A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  int v48 = a2;
  uint64_t v12 = sub_2445679F0();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  uint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    uint64_t v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
      swift_retain();
    }
    sub_2445589E0(&qword_268E886E0, MEMORY[0x263F07508]);
    uint64_t result = sub_244567660();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  uint64_t v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

uint64_t sub_2445573D0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2445573DC(a1, a2, a3, &qword_268E886F8);
}

uint64_t sub_2445573DC(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  uint64_t v6 = (void **)v4;
  uint64_t v27 = a1;
  uint64_t v9 = sub_2445675A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_244556D50(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v6;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7];
      uint64_t result = swift_release();
      *(void *)(v22 + 8 * v15) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_244557650(a4);
    goto LABEL_7;
  }
  sub_244556FA8(v18, a3 & 1, a4);
  unint64_t v24 = sub_244556D50(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = sub_244567AF0();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  uint64_t v21 = *v6;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  return sub_244557598(v15, (uint64_t)v12, v27, v21);
}

uint64_t sub_244557598(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2445675A0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_244557650(uint64_t *a1)
{
  uint64_t v3 = sub_2445675A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = sub_2445679E0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v26 = v9;
    return result;
  }
  uint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v27 = v7 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = v4 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2445578E4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2445679D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2445679D0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x245691E00](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_244557AB0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2445679D0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_244567760();
}

uint64_t sub_244557AB0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2445679D0();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2445679D0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_244558B18();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268E88710);
          uint64_t v12 = sub_244557CC4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_244558A60(0, &qword_268E88698);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_244567A10();
  __break(1u);
  return result;
}

void (*sub_244557CC4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_244557D74(v6, a2, a3);
  return sub_244557D2C;
}

void sub_244557D2C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_244557D74(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x245691DF0](a2, a3);
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
    return sub_244557DF4;
  }
  __break(1u);
  return result;
}

void sub_244557DF4(id *a1)
{
}

void sub_244557DFC(os_unfair_lock_s *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v12[2] = MEMORY[0x263F8EE78];
    sub_244567980();
    if (v4 < 0)
    {
      __break(1u);
LABEL_16:
      os_unfair_lock_unlock(v3);
      __break(1u);
      return;
    }
    uint64_t v5 = 0;
    unint64_t v11 = (unint64_t)v3 & 0xC000000000000001;
    unint64_t v6 = v3;
    while (v4 != v5)
    {
      if (v11) {
        id v7 = (id)MEMORY[0x245691DF0](v5, v3);
      }
      else {
        id v7 = *(id *)&v3[2 * v5 + 8]._os_unfair_lock_opaque;
      }
      uint64_t v8 = v7;
      MEMORY[0x270FA5388](v7);
      uint64_t v10 = (uint64_t *)&v9[4];
      uint64_t v3 = v9 + 6;
      os_unfair_lock_lock(v9 + 6);
      sub_244558C0C(v10, (uint64_t)v12);
      if (v2) {
        goto LABEL_16;
      }
      uint64_t v2 = 0;
      ++v5;
      os_unfair_lock_unlock(v3);

      sub_244567960();
      sub_244567990();
      sub_2445679A0();
      sub_244567970();
      uint64_t v3 = v6;
      if (v4 == v5) {
        return;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2445679D0();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_244557FAC(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v21 = sub_2445675A0();
  uint64_t v6 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2445679D0();
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      unint64_t v20 = a1 & 0xC000000000000001;
      v18[1] = v3;
      v18[2] = a2 + OBJC_IVAR____TtC20LiveCommunicationKit19ConversationManager___observationRegistrar;
      swift_beginAccess();
      uint64_t v10 = (void (**)(char *, uint64_t))(v6 + 8);
      uint64_t v11 = 4;
      unint64_t v19 = a1;
      while (1)
      {
        uint64_t v6 = v11 - 4;
        if (v20) {
          id v13 = (id)MEMORY[0x245691DF0](v11 - 4, a1);
        }
        else {
          id v13 = *(id *)(a1 + 8 * v11);
        }
        id v14 = v13;
        a1 = v11 - 3;
        if (__OFADD__(v6, 1))
        {
          __break(1u);
          goto LABEL_18;
        }
        id v15 = objc_msgSend(v13, sel_UUID);
        sub_244567590();

        swift_getKeyPath();
        uint64_t v22 = a2;
        sub_2445589E0(&qword_268E88678, (void (*)(uint64_t))type metadata accessor for ConversationManager);
        sub_2445675C0();
        swift_release();
        uint64_t v3 = *(uint64_t **)(a2 + 88);
        if (v3[2])
        {
          swift_bridgeObjectRetain();
          sub_244556D50((uint64_t)v8);
          if (v16)
          {
            swift_retain();
            swift_bridgeObjectRelease();
            (*v10)(v8, v21);

            uint64_t v3 = &v23;
            MEMORY[0x245691C00]();
            if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_244567770();
            }
            sub_244567780();
            sub_244567760();
            goto LABEL_6;
          }
          swift_bridgeObjectRelease();
        }
        (*v10)(v8, v21);

LABEL_6:
        ++v11;
        BOOL v12 = a1 == v9;
        a1 = v19;
        if (v12)
        {
          swift_bridgeObjectRelease();
          return v23;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2445582B4(uint64_t *a1, void *a2)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  uint64_t v8 = a1[7];
  swift_bridgeObjectRetain();
  sub_24454BA0C(v6, v7);
  swift_bridgeObjectRetain();
  if (objc_msgSend(a2, sel_isGreenTea)) {
    char v9 = 0;
  }
  else {
    char v9 = *((unsigned char *)a1 + 48);
  }
  char v20 = v9;
  uint64_t v10 = a1[4];
  uint64_t v11 = a1[5];
  char v12 = *((unsigned char *)a1 + 49);
  id v13 = sub_24454BC50();
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC950]), sel_initWithConfiguration_, v13);

  type metadata accessor for ConversationCache();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v5;
  unint64_t v16 = sub_2445514E4(MEMORY[0x263F8EE78], &qword_268E88708, &qword_268E886F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E886D0);
  uint64_t v17 = swift_allocObject();
  *(_DWORD *)(v17 + 24) = 0;
  *(void *)(v17 + 16) = v16;
  *(void *)(v14 + 16) = v17;
  swift_bridgeObjectRetain();
  sub_24454BA0C(v6, v7);
  sub_24454BAB0(v6, v7);
  swift_bridgeObjectRelease();
  *(void *)&long long v22 = v15;
  *((void *)&v22 + 1) = v4;
  uint64_t v23 = v6;
  unint64_t v24 = v7;
  uint64_t v25 = v10;
  uint64_t v26 = v11;
  char v27 = v20;
  char v28 = v12;
  uint64_t v29 = v8;
  type metadata accessor for ConversationManager();
  uint64_t v18 = swift_allocObject();
  sub_2445524F4(&v22, v21, v14);
  swift_bridgeObjectRelease();
  sub_24454BAB0(v6, v7);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  return sub_24454F354(a2 + 32, a1 + 32);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
}

uint64_t sub_244558508(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88658);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244558568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Conversation.Event();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445585CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2445585F4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 32;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2456925F0](v4);
  uint64_t v6 = *(void *)(v3 + 40);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_244558650(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 40) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_2445586AC()
{
  return type metadata accessor for ConversationManager();
}

uint64_t sub_2445586B4()
{
  uint64_t result = sub_244567600();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ConversationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConversationManager);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_244558800(void *a1)
{
  return sub_244554168(a1, v1, (void (*)(void))type metadata accessor for StartConversationAction, (uint64_t (*)(void))sub_24454FC84);
}

uint64_t sub_244558850(void *a1)
{
  return sub_244553B4C(a1, (void (*)(void))type metadata accessor for JoinConversationAction, (uint64_t)"onManagerPerformAnswerCallAction(_:)", 36);
}

uint64_t sub_244558888(void *a1)
{
  return sub_244553B4C(a1, (void (*)(void))type metadata accessor for EndConversationAction, (uint64_t)"onManagerPerformEndCallAction(_:)", 33);
}

uint64_t sub_2445588C0(void *a1)
{
  return sub_244554168(a1, v1, (void (*)(void))type metadata accessor for PauseConversationAction, (uint64_t (*)(void))sub_24454AC6C);
}

uint64_t sub_244558914(void *a1)
{
  return sub_244554168(a1, v1, (void (*)(void))type metadata accessor for MuteConversationAction, (uint64_t (*)(void))sub_24456702C);
}

uint64_t sub_244558964(void *a1)
{
  return sub_244554168(a1, v1, (void (*)(void))type metadata accessor for PlayToneAction, (uint64_t (*)(void))sub_244561650);
}

uint64_t sub_2445589C4()
{
  return sub_244552168(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2445589E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_244558A28()
{
  return sub_244551EA8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_244558A44(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24454B59C(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_244558A60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_244558A9C()
{
  return sub_244558BBC();
}

uint64_t sub_244558AB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_244558B18()
{
  unint64_t result = qword_268E88718;
  if (!qword_268E88718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E88710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88718);
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

uint64_t sub_244558BBC()
{
  *(void *)(*(void *)(v0 + 16) + 24) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_244558C0C(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t JoinConversationAction.__allocating_init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  JoinConversationAction.init(conversationUUID:)(a1);
  return v2;
}

uint64_t JoinConversationAction.init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_244567560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2445675A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone(MEMORY[0x263EFC8C8]);
  id v13 = (void *)sub_244567570();
  id v14 = objc_msgSend(v12, sel_initWithCallUUID_, v13);

  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v14;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v11, v8);
  uint64_t v15 = (void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v15 = 0;
  v15[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v4);
  return v2;
}

void JoinConversationAction.fulfill(dateConnected:)(uint64_t a1)
{
  uint64_t v3 = sub_244567560();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_244567630();
  __swift_project_value_buffer(v7, (uint64_t)qword_268E88BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  swift_retain_n();
  uint64_t v8 = sub_244567610();
  os_log_type_t v9 = sub_2445677F0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v19[1] = a1;
    uint64_t v11 = v10;
    v19[0] = swift_slowAlloc();
    uint64_t v20 = v1;
    uint64_t v21 = v19[0];
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_retain();
    uint64_t v12 = sub_2445676C0();
    uint64_t v20 = sub_24454EB60(v12, v13, &v21);
    sub_244567830();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_244550648();
    uint64_t v14 = sub_244567AC0();
    uint64_t v20 = sub_24454EB60(v14, v15, &v21);
    sub_244567830();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _os_log_impl(&dword_244549000, v8, v9, "Fulfilling action %s with dateConnected %s", (uint8_t *)v11, 0x16u);
    uint64_t v16 = v19[0];
    swift_arrayDestroy();
    MEMORY[0x245692540](v16, -1, -1);
    MEMORY[0x245692540](v11, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  self;
  uint64_t v17 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v18 = (void *)sub_244567530();
  objc_msgSend(v17, sel_fulfillWithDateConnected_, v18);
}

void sub_2445591EC()
{
}

uint64_t JoinConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t JoinConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_244559410()
{
  return type metadata accessor for JoinConversationAction();
}

uint64_t type metadata accessor for JoinConversationAction()
{
  uint64_t result = qword_268E88720;
  if (!qword_268E88720) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_244559464()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for JoinConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for JoinConversationAction);
}

uint64_t dispatch thunk of JoinConversationAction.__allocating_init(conversationUUID:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t Conversation.Event.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_244567560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for Conversation.Event();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_244558568(v2, (uint64_t)v10);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v10, v4);
      sub_244567B10();
      sub_24455BB94(&qword_268E88730, MEMORY[0x263F07490]);
      sub_244567670();
      goto LABEL_5;
    case 3u:
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v10, v4);
      sub_244567B10();
      sub_24455BB94(&qword_268E88730, MEMORY[0x263F07490]);
      sub_244567670();
      sub_244567B10();
LABEL_5:
      uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      break;
    default:
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *((void *)v10 + 1);
      uint64_t v13 = *((void *)v10 + 2);
      uint64_t v14 = *((void *)v10 + 3);
      uint64_t v15 = *((void *)v10 + 4);
      uint64_t v16 = *((void *)v10 + 5);
      uint64_t v17 = *((void *)v10 + 6);
      uint64_t v18 = *((void *)v10 + 7);
      int v21 = v10[64];
      sub_244567B10();
      uint64_t v22 = v11;
      uint64_t v23 = v12;
      uint64_t v24 = v13;
      uint64_t v25 = v14;
      uint64_t v26 = v15;
      uint64_t v27 = v16;
      uint64_t v28 = v17;
      uint64_t v29 = v18;
      char v30 = v21;
      Conversation.Update.hash(into:)(a1);
      sub_24454DEC0(v11, v12, v13);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t type metadata accessor for Conversation.Event()
{
  uint64_t result = qword_268E887F0;
  if (!qword_268E887F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_244559834(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2445598CC()
{
  return sub_244559834(*v0);
}

uint64_t sub_2445598D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24455D11C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2445598FC()
{
  return 0;
}

void sub_244559908(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_244559914(uint64_t a1)
{
  unint64_t v2 = sub_24455B7F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244559950(uint64_t a1)
{
  unint64_t v2 = sub_24455B7F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24455998C()
{
  return 1;
}

uint64_t sub_24455999C()
{
  return 12383;
}

void sub_2445599AC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2445599B8(uint64_t a1)
{
  unint64_t v2 = sub_24455B8F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2445599F4(uint64_t a1)
{
  unint64_t v2 = sub_24455B8F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_244559A30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_244559A48()
{
  if (*v0) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_244559A64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24455D2B8(a1, a2);
  *a3 = result;
  return result;
}

void sub_244559A8C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_244559A98(uint64_t a1)
{
  unint64_t v2 = sub_24455B848();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244559AD4(uint64_t a1)
{
  unint64_t v2 = sub_24455B848();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244559B10(uint64_t a1)
{
  unint64_t v2 = sub_24455B944();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244559B4C(uint64_t a1)
{
  unint64_t v2 = sub_24455B944();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244559B88()
{
  return sub_244567B30();
}

uint64_t sub_244559BCC()
{
  return sub_244567B10();
}

uint64_t sub_244559BF4()
{
  return sub_244567B30();
}

uint64_t sub_244559C34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_244567AD0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_244559CB4(uint64_t a1)
{
  unint64_t v2 = sub_24455B998();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244559CF0(uint64_t a1)
{
  unint64_t v2 = sub_24455B998();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Conversation.Event.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88738);
  uint64_t v60 = *(void *)(v2 - 8);
  uint64_t v61 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v59 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88740);
  uint64_t v57 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  long long v56 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88748);
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_244567560();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v63 = v6;
  uint64_t v64 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v62 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v52 = (char *)&v50 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v50 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88750);
  uint64_t v51 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Conversation.Event();
  MEMORY[0x270FA5388](v17);
  unint64_t v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88758);
  uint64_t v66 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  int v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_24455B7F4();
  uint64_t v68 = v21;
  sub_244567B50();
  sub_244558568(v67, (uint64_t)v19);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v32 = v63;
      uint64_t v31 = v64;
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v13, v19, v63);
      LOBYTE(v70) = 1;
      sub_24455B944();
      uint64_t v33 = v53;
      unint64_t v35 = v68;
      uint64_t v34 = v69;
      sub_244567A80();
      sub_24455BB94(&qword_268E88770, MEMORY[0x263F07490]);
      uint64_t v36 = v55;
      sub_244567AB0();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v33, v36);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v32);
      goto LABEL_5;
    case 2u:
      uint64_t v38 = v63;
      uint64_t v37 = v64;
      uint64_t v39 = v52;
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v52, v19, v63);
      LOBYTE(v70) = 2;
      sub_24455B8F0();
      uint64_t v40 = v56;
      unint64_t v35 = v68;
      uint64_t v34 = v69;
      sub_244567A80();
      sub_24455BB94(&qword_268E88770, MEMORY[0x263F07490]);
      uint64_t v41 = v58;
      sub_244567AB0();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v40, v41);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v38);
LABEL_5:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v35, v34);
      break;
    case 3u:
      LODWORD(v67) = v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0) + 48)];
      uint64_t v43 = v63;
      uint64_t v42 = v64;
      uint64_t v44 = v62;
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v62, v19, v63);
      LOBYTE(v70) = 3;
      sub_24455B848();
      uint64_t v45 = v59;
      uint64_t v47 = v68;
      uint64_t v46 = v69;
      sub_244567A80();
      LOBYTE(v70) = 0;
      sub_24455BB94(&qword_268E88770, MEMORY[0x263F07490]);
      uint64_t v48 = v61;
      uint64_t v49 = v65;
      sub_244567AB0();
      if (v49)
      {
        (*(void (**)(char *, uint64_t))(v60 + 8))(v45, v48);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v43);
      }
      else
      {
        LOBYTE(v70) = v67;
        char v79 = 1;
        sub_24455B89C();
        sub_244567AB0();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v45, v48);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v62, v43);
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v47, v46);
      break;
    default:
      uint64_t v22 = (char *)*((void *)v19 + 1);
      uint64_t v67 = *(void *)v19;
      uint64_t v23 = v67;
      uint64_t v24 = *((void *)v19 + 2);
      uint64_t v61 = *((void *)v19 + 3);
      uint64_t v62 = v22;
      uint64_t v25 = *((void *)v19 + 4);
      uint64_t v26 = *((void *)v19 + 5);
      uint64_t v27 = *((void *)v19 + 6);
      uint64_t v63 = *((void *)v19 + 7);
      uint64_t v64 = v24;
      char v28 = v19[64];
      LOBYTE(v70) = 0;
      sub_24455B998();
      sub_244567A80();
      uint64_t v70 = v23;
      uint64_t v29 = (uint64_t)v62;
      uint64_t v71 = v62;
      uint64_t v72 = v24;
      uint64_t v73 = v61;
      uint64_t v74 = v25;
      uint64_t v75 = v26;
      uint64_t v76 = v27;
      uint64_t v77 = v63;
      char v78 = v28;
      sub_24455B9EC();
      sub_244567AB0();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v16, v14);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v68, v69);
      sub_24454DEC0(v67, v29, v64);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t Conversation.Event.hashValue.getter()
{
  sub_244567B00();
  Conversation.Event.hash(into:)((uint64_t)v1);
  return sub_244567B30();
}

uint64_t Conversation.Event.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E887A0);
  uint64_t v60 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v74 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E887A8);
  uint64_t v67 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v73 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E887B0);
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v72 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E887B8);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v70 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E887C0);
  uint64_t v69 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for Conversation.Event();
  uint64_t v9 = MEMORY[0x270FA5388](v75);
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v55 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v55 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v55 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v55 - v21;
  uint64_t v23 = a1[3];
  uint64_t v76 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v23);
  sub_24455B7F4();
  uint64_t v24 = (uint64_t)v82;
  sub_244567B40();
  if (v24) {
    goto LABEL_9;
  }
  long long v56 = v20;
  uint64_t v57 = v17;
  uint64_t v58 = v14;
  uint64_t v25 = v70;
  uint64_t v26 = v72;
  uint64_t v59 = v11;
  uint64_t v27 = v73;
  char v28 = v74;
  v82 = v22;
  uint64_t v29 = v71;
  uint64_t v30 = sub_244567A70();
  if (*(void *)(v30 + 16) != 1)
  {
    uint64_t v38 = sub_244567940();
    swift_allocError();
    uint64_t v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E887C8);
    uint64_t *v40 = v75;
    sub_244567A30();
    sub_244567930();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, *MEMORY[0x263F8DCB0], v38);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v29);
LABEL_9:
    uint64_t v44 = (uint64_t)v76;
    return __swift_destroy_boxed_opaque_existential_0(v44);
  }
  switch(*(unsigned char *)(v30 + 32))
  {
    case 1:
      LOBYTE(v77) = 1;
      sub_24455B944();
      uint64_t v41 = v26;
      sub_244567A20();
      sub_244567560();
      sub_24455BB94(&qword_268E887D0, MEMORY[0x263F07490]);
      uint64_t v42 = (uint64_t)v57;
      uint64_t v43 = v65;
      sub_244567A60();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v41, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v29);
      uint64_t v44 = (uint64_t)v76;
      swift_storeEnumTagMultiPayload();
      uint64_t v45 = (uint64_t)v82;
      sub_24455BA94(v42, (uint64_t)v82);
      goto LABEL_12;
    case 2:
      LOBYTE(v77) = 2;
      sub_24455B8F0();
      uint64_t v46 = v27;
      sub_244567A20();
      sub_244567560();
      sub_24455BB94(&qword_268E887D0, MEMORY[0x263F07490]);
      uint64_t v47 = (uint64_t)v58;
      uint64_t v48 = v63;
      sub_244567A60();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v46, v48);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v29);
      swift_storeEnumTagMultiPayload();
      uint64_t v37 = v47;
      goto LABEL_11;
    case 3:
      LOBYTE(v77) = 3;
      sub_24455B848();
      uint64_t v49 = v28;
      sub_244567A20();
      sub_244567560();
      LOBYTE(v77) = 0;
      sub_24455BB94(&qword_268E887D0, MEMORY[0x263F07490]);
      uint64_t v50 = (uint64_t)v59;
      uint64_t v51 = v66;
      sub_244567A60();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
      LOBYTE(v77) = 1;
      sub_24455BA40();
      sub_244567A60();
      uint64_t v53 = v69;
      uint64_t v73 = 0;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v49, v51);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v8, v29);
      swift_storeEnumTagMultiPayload();
      uint64_t v45 = (uint64_t)v82;
      sub_24455BA94(v50, (uint64_t)v82);
      uint64_t v44 = (uint64_t)v76;
      uint64_t v54 = v68;
      goto LABEL_13;
    default:
      LOBYTE(v77) = 0;
      sub_24455B998();
      uint64_t v31 = v25;
      sub_244567A20();
      sub_24455BAF8();
      uint64_t v32 = v62;
      sub_244567A60();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v29);
      char v33 = v81;
      long long v34 = v78;
      unint64_t v35 = v56;
      *long long v56 = v77;
      v35[1] = v34;
      long long v36 = v80;
      v35[2] = v79;
      v35[3] = v36;
      *((unsigned char *)v35 + 64) = v33;
      swift_storeEnumTagMultiPayload();
      uint64_t v37 = (uint64_t)v35;
LABEL_11:
      uint64_t v45 = (uint64_t)v82;
      sub_24455BA94(v37, (uint64_t)v82);
      uint64_t v44 = (uint64_t)v76;
LABEL_12:
      uint64_t v54 = v68;
LABEL_13:
      sub_24455BA94(v45, v54);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_0(v44);
}

uint64_t sub_24455B170@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Conversation.Event.init(from:)(a1, a2);
}

uint64_t sub_24455B188(void *a1)
{
  return Conversation.Event.encode(to:)(a1);
}

uint64_t sub_24455B1A0()
{
  sub_244567B00();
  Conversation.Event.hash(into:)((uint64_t)v1);
  return sub_244567B30();
}

uint64_t sub_24455B1E4()
{
  sub_244567B00();
  Conversation.Event.hash(into:)((uint64_t)v1);
  return sub_244567B30();
}

uint64_t _s20LiveCommunicationKit12ConversationC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = a2;
  uint64_t v3 = sub_244567560();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v64 = v3;
  uint64_t v65 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v63 = (uint64_t)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v61 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v61 - v10;
  uint64_t v12 = type metadata accessor for Conversation.Event();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v61 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v61 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v61 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88878);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v27 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = (uint64_t)&v27[*(int *)(v25 + 56)];
  sub_244558568(a1, (uint64_t)v27);
  sub_244558568(v66, v28);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_244558568((uint64_t)v27, (uint64_t)v21);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v40 = v64;
        uint64_t v39 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(v11, v28, v64);
        char updated = sub_244567550();
        uint64_t v41 = *(void (**)(char *, uint64_t))(v39 + 8);
        v41(v11, v40);
        v41(v21, v40);
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v64);
      goto LABEL_14;
    case 2u:
      sub_244558568((uint64_t)v27, (uint64_t)v18);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v36 = v64;
        uint64_t v35 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(v9, v28, v64);
        char updated = sub_244567550();
        uint64_t v38 = *(void (**)(char *, uint64_t))(v35 + 8);
        v38(v9, v36);
        v38(v18, v36);
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v65 + 8))(v18, v64);
      goto LABEL_14;
    case 3u:
      sub_244558568((uint64_t)v27, (uint64_t)v15);
      uint64_t v42 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0) + 48);
      int v43 = v15[v42];
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        (*(void (**)(char *, uint64_t))(v65 + 8))(v15, v64);
        goto LABEL_14;
      }
      int v44 = *(unsigned __int8 *)(v28 + v42);
      uint64_t v46 = v64;
      uint64_t v45 = v65;
      uint64_t v47 = v63;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v63, v28, v64);
      char v48 = sub_244567550();
      uint64_t v49 = *(void (**)(char *, uint64_t))(v45 + 8);
      v49(v15, v46);
      if (v48)
      {
        char updated = v43 == v44;
        v49((char *)v47, v46);
        goto LABEL_17;
      }
      v49((char *)v47, v46);
      sub_24455C2EC((uint64_t)v27);
      goto LABEL_15;
    default:
      sub_244558568((uint64_t)v27, (uint64_t)v23);
      uint64_t v29 = *(void *)v23;
      uint64_t v30 = *((void *)v23 + 1);
      uint64_t v31 = *((void *)v23 + 2);
      uint64_t v32 = *((void *)v23 + 3);
      uint64_t v34 = *((void *)v23 + 4);
      uint64_t v33 = *((void *)v23 + 5);
      uint64_t v66 = *((void *)v23 + 6);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_24454DEC0(v29, v30, v31);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_14:
        sub_24455D37C((uint64_t)v27);
LABEL_15:
        char updated = 0;
      }
      else
      {
        char v50 = v23[64];
        uint64_t v51 = *((void *)v23 + 7);
        uint64_t v52 = *(void *)v28;
        uint64_t v53 = *(void *)(v28 + 8);
        uint64_t v54 = *(void *)(v28 + 16);
        uint64_t v55 = *(void *)(v28 + 24);
        uint64_t v57 = *(void *)(v28 + 32);
        uint64_t v56 = *(void *)(v28 + 40);
        char v58 = *(unsigned char *)(v28 + 64);
        uint64_t v63 = v29;
        v70[0] = v29;
        v70[1] = v30;
        uint64_t v64 = v31;
        v70[2] = v31;
        v70[3] = v32;
        uint64_t v62 = v34;
        v70[4] = v34;
        v70[5] = v33;
        uint64_t v65 = v33;
        v70[6] = v66;
        v70[7] = v51;
        char v71 = v50;
        v67[0] = v52;
        v67[1] = v53;
        v67[2] = v54;
        v67[3] = v55;
        uint64_t v59 = v54;
        v67[4] = v57;
        v67[5] = v56;
        long long v61 = *(_OWORD *)(v28 + 48);
        long long v68 = v61;
        char v69 = v58;
        char updated = _s20LiveCommunicationKit12ConversationC6UpdateV2eeoiySbAE_AEtFZ_0((uint64_t)v70, (uint64_t)v67);
        sub_24454DEC0(v52, v53, v59);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24454DEC0(v63, v30, v64);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_17:
        sub_24455C2EC((uint64_t)v27);
      }
      return updated & 1;
  }
}

unint64_t sub_24455B7F4()
{
  unint64_t result = qword_268E88760;
  if (!qword_268E88760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88760);
  }
  return result;
}

unint64_t sub_24455B848()
{
  unint64_t result = qword_268E88768;
  if (!qword_268E88768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88768);
  }
  return result;
}

unint64_t sub_24455B89C()
{
  unint64_t result = qword_268E88778;
  if (!qword_268E88778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88778);
  }
  return result;
}

unint64_t sub_24455B8F0()
{
  unint64_t result = qword_268E88780;
  if (!qword_268E88780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88780);
  }
  return result;
}

unint64_t sub_24455B944()
{
  unint64_t result = qword_268E88788;
  if (!qword_268E88788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88788);
  }
  return result;
}

unint64_t sub_24455B998()
{
  unint64_t result = qword_268E88790;
  if (!qword_268E88790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88790);
  }
  return result;
}

unint64_t sub_24455B9EC()
{
  unint64_t result = qword_268E88798;
  if (!qword_268E88798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88798);
  }
  return result;
}

unint64_t sub_24455BA40()
{
  unint64_t result = qword_268E887D8;
  if (!qword_268E887D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E887D8);
  }
  return result;
}

uint64_t sub_24455BA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Conversation.Event();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24455BAF8()
{
  unint64_t result = qword_268E887E0;
  if (!qword_268E887E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E887E0);
  }
  return result;
}

uint64_t sub_24455BB4C()
{
  return sub_24455BB94(&qword_268E887E8, (void (*)(uint64_t))type metadata accessor for Conversation.Event);
}

uint64_t sub_24455BB94(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s5EventOwCP(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        uint64_t v9 = sub_244567560();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
      case 3u:
        uint64_t v10 = sub_244567560();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
        *(unsigned char *)(a1 + *(int *)(v11 + 48)) = *((unsigned char *)a2 + *(int *)(v11 + 48));
        break;
      default:
        uint64_t v6 = a2[2];
        if (v6)
        {
          *(unsigned char *)a1 = *(unsigned char *)a2;
          *(void *)(a1 + 8) = a2[1];
          *(void *)(a1 + 16) = v6;
          uint64_t v7 = a2[4];
          *(void *)(a1 + 24) = a2[3];
          *(void *)(a1 + 32) = v7;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v12 = *((_OWORD *)a2 + 1);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v12;
          *(void *)(a1 + 32) = a2[4];
        }
        uint64_t v13 = a2[6];
        *(void *)(a1 + 40) = a2[5];
        *(void *)(a1 + 48) = v13;
        *(void *)(a1 + 56) = a2[7];
        *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t _s5EventOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      if (*(void *)(a1 + 16))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 1:
    case 2:
    case 3:
      uint64_t v3 = sub_244567560();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s5EventOwcp(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v6 = sub_244567560();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      break;
    case 3u:
      uint64_t v7 = sub_244567560();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
      *(unsigned char *)(a1 + *(int *)(v8 + 48)) = *(unsigned char *)(a2 + *(int *)(v8 + 48));
      break;
    default:
      uint64_t v4 = *(void *)(a2 + 16);
      if (v4)
      {
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(void *)(a1 + 16) = v4;
        uint64_t v5 = *(void *)(a2 + 32);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = v5;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v9;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
      }
      uint64_t v10 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v10;
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t _s5EventOwca(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    sub_24455C2EC(a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        uint64_t v4 = sub_244567560();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
      case 3u:
        uint64_t v5 = sub_244567560();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
        *(unsigned char *)(a1 + *(int *)(v6 + 48)) = *((unsigned char *)a2 + *(int *)(v6 + 48));
        break;
      default:
        if (*((void *)a2 + 2))
        {
          *(unsigned char *)a1 = *(unsigned char *)a2;
          *(void *)(a1 + 8) = *((void *)a2 + 1);
          *(void *)(a1 + 16) = *((void *)a2 + 2);
          *(void *)(a1 + 24) = *((void *)a2 + 3);
          *(void *)(a1 + 32) = *((void *)a2 + 4);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v7 = *a2;
          long long v8 = a2[1];
          *(void *)(a1 + 32) = *((void *)a2 + 4);
          *(_OWORD *)a1 = v7;
          *(_OWORD *)(a1 + 16) = v8;
        }
        *(void *)(a1 + 40) = *((void *)a2 + 5);
        *(void *)(a1 + 48) = *((void *)a2 + 6);
        uint64_t v9 = *((void *)a2 + 7);
        *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
        *(void *)(a1 + 56) = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24455C2EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Conversation.Event();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *_s5EventOwtk(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v8 = sub_244567560();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
    a1[*(int *)(v9 + 48)] = a2[*(int *)(v9 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_244567560();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

unsigned char *_s5EventOwta(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24455C2EC((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v8 = sub_244567560();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E886B0);
      a1[*(int *)(v9 + 48)] = a2[*(int *)(v9 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_244567560();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s5EventOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t _s5EventOwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24455C6AC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24455C6BC()
{
  v2[4] = "A";
  uint64_t result = sub_244567560();
  if (v1 <= 0x3F)
  {
    uint64_t v3 = *(void *)(result - 8) + 64;
    uint64_t v4 = v3;
    swift_getTupleTypeLayout2();
    uint64_t v5 = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s5EventO10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s5EventO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x24455C8C4);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s5EventO10CodingKeysOMa()
{
  return &_s5EventO10CodingKeysON;
}

uint64_t sub_24455C908()
{
  return 0;
}

ValueMetadata *_s5EventO29ConversationUpdatedCodingKeysOMa()
{
  return &_s5EventO29ConversationUpdatedCodingKeysON;
}

ValueMetadata *_s5EventO39ConversationStartedConnectingCodingKeysOMa()
{
  return &_s5EventO39ConversationStartedConnectingCodingKeysON;
}

uint64_t _s5StateO16FailedCodingKeysOwet(unsigned int *a1, int a2)
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

unsigned char *_s5EventO29ConversationUpdatedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24455CA1CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s5EventO31ConversationConnectedCodingKeysOMa()
{
  return &_s5EventO31ConversationConnectedCodingKeysON;
}

uint64_t _s5EventO27ConversationEndedCodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s5EventO27ConversationEndedCodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24455CBB0);
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

unsigned char *sub_24455CBD8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s5EventO27ConversationEndedCodingKeysOMa()
{
  return &_s5EventO27ConversationEndedCodingKeysON;
}

unint64_t sub_24455CBF8()
{
  unint64_t result = qword_268E88800;
  if (!qword_268E88800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88800);
  }
  return result;
}

unint64_t sub_24455CC50()
{
  unint64_t result = qword_268E88808;
  if (!qword_268E88808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88808);
  }
  return result;
}

unint64_t sub_24455CCA8()
{
  unint64_t result = qword_268E88810;
  if (!qword_268E88810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88810);
  }
  return result;
}

unint64_t sub_24455CD00()
{
  unint64_t result = qword_268E88818;
  if (!qword_268E88818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88818);
  }
  return result;
}

unint64_t sub_24455CD58()
{
  unint64_t result = qword_268E88820;
  if (!qword_268E88820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88820);
  }
  return result;
}

unint64_t sub_24455CDB0()
{
  unint64_t result = qword_268E88828;
  if (!qword_268E88828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88828);
  }
  return result;
}

unint64_t sub_24455CE08()
{
  unint64_t result = qword_268E88830;
  if (!qword_268E88830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88830);
  }
  return result;
}

unint64_t sub_24455CE60()
{
  unint64_t result = qword_268E88838;
  if (!qword_268E88838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88838);
  }
  return result;
}

unint64_t sub_24455CEB8()
{
  unint64_t result = qword_268E88840;
  if (!qword_268E88840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88840);
  }
  return result;
}

unint64_t sub_24455CF10()
{
  unint64_t result = qword_268E88848;
  if (!qword_268E88848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88848);
  }
  return result;
}

unint64_t sub_24455CF68()
{
  unint64_t result = qword_268E88850;
  if (!qword_268E88850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88850);
  }
  return result;
}

unint64_t sub_24455CFC0()
{
  unint64_t result = qword_268E88858;
  if (!qword_268E88858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88858);
  }
  return result;
}

unint64_t sub_24455D018()
{
  unint64_t result = qword_268E88860;
  if (!qword_268E88860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88860);
  }
  return result;
}

unint64_t sub_24455D070()
{
  unint64_t result = qword_268E88868;
  if (!qword_268E88868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88868);
  }
  return result;
}

unint64_t sub_24455D0C8()
{
  unint64_t result = qword_268E88870;
  if (!qword_268E88870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88870);
  }
  return result;
}

uint64_t sub_24455D11C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024456A940 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000024456A960 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024456A980 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024456A9A0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_244567AD0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24455D2B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_244567AD0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24455D37C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88878);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:conversationChanged:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManagerDidBegin(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManagerDidReset(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:perform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:timedOutPerforming:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:didActivate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:didDeactivate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_24455D46C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_244567980();
    uint64_t result = sub_2445600C0(v1);
    int64_t v4 = result;
    int v6 = v5;
    char v8 = v7 & 1;
    uint64_t v16 = v1;
    uint64_t v17 = v1 + 56;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(v1 + 32))
    {
      if (((*(void *)(v17 + (((unint64_t)v4 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
        goto LABEL_11;
      }
      if (*(_DWORD *)(v1 + 36) != v6) {
        goto LABEL_12;
      }
      uint64_t v9 = *(unsigned __int8 *)(*(void *)(v1 + 48) + 40 * v4) + 1;
      char v18 = v8;
      id v10 = objc_allocWithZone(MEMORY[0x263EFC938]);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v11 = (void *)sub_244567690();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(v10, sel_initWithType_value_, v9, v11);

      uint64_t v13 = (void *)sub_244567690();
      objc_msgSend(v12, sel_setSiriDisplayName_, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_244567960();
      sub_244567990();
      uint64_t v1 = v16;
      sub_2445679A0();
      sub_244567970();
      uint64_t result = sub_244560164(v4, v6, v18 & 1, v16);
      int64_t v4 = result;
      int v6 = v14;
      char v8 = v15 & 1;
      if (!--v2)
      {
        sub_24454C350(result, v14, v8);
        return v19;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

id sub_24455D668()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  unint64_t v4 = *(void *)(v0 + 56);
  char v5 = *(unsigned char *)(v0 + 64);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC8F0]), sel_init);
  if (v3)
  {
    unint64_t v7 = sub_24455D46C(v3);
    sub_244560DE4(v7);
    swift_bridgeObjectRelease();
    sub_24454FC44();
    sub_24456113C(&qword_268E888F0, (void (*)(uint64_t))sub_24454FC44);
    char v8 = (void *)sub_2445677C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setRemoteParticipantHandles_, v8);
  }
  if (v2)
  {
    unint64_t v9 = sub_24455D46C(v2);
    sub_244560DE4(v9);
    swift_bridgeObjectRelease();
    sub_24454FC44();
    sub_24456113C(&qword_268E888F0, (void (*)(uint64_t))sub_24454FC44);
    id v10 = (void *)sub_2445677C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setActiveRemoteParticipantHandles_, v10);
  }
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, sel_setHasVideo_, (v4 >> 3) & 1);
    objc_msgSend(v6, sel_setSupportsDTMF_, (v4 >> 4) & 1);
    objc_msgSend(v6, sel_setSupportsHolding_, v4 & 1);
    objc_msgSend(v6, sel_setSupportsGrouping_, (v4 >> 1) & 1);
    objc_msgSend(v6, sel_setSupportsUngrouping_, (v4 >> 2) & 1);
  }
  if (v1)
  {
    uint64_t v11 = (void *)sub_244567690();
    objc_msgSend(v6, sel_setLocalMemberHandleValue_, v11);
  }
  return v6;
}

uint64_t Conversation.Update.localMember.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  return sub_24454DE40(v2, v3, v4);
}

__n128 Conversation.Update.localMember.setter(long long *a1)
{
  __n128 v4 = (__n128)a1[1];
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  sub_24454DEC0(*v1, v1[1], v1[2]);
  __n128 result = v4;
  *(_OWORD *)uint64_t v1 = v5;
  *((__n128 *)v1 + 1) = v4;
  v1[4] = v2;
  return result;
}

uint64_t (*Conversation.Update.localMember.modify())()
{
  return nullsub_1;
}

uint64_t Conversation.Update.members.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Conversation.Update.members.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*Conversation.Update.members.modify())()
{
  return nullsub_1;
}

uint64_t Conversation.Update.activeRemoteMembers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Conversation.Update.activeRemoteMembers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*Conversation.Update.activeRemoteMembers.modify())()
{
  return nullsub_1;
}

void Conversation.Update.capabilities.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 64);
  *(void *)a1 = *(void *)(v1 + 56);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t Conversation.Update.capabilities.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)(v1 + 56) = *(void *)result;
  *(unsigned char *)(v1 + 64) = v2;
  return result;
}

uint64_t (*Conversation.Update.capabilities.modify())()
{
  return nullsub_1;
}

__n128 Conversation.Update.init(localMember:members:activeRemoteMembers:capabilities:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *a4;
  char v7 = *((unsigned char *)a4 + 8);
  __n128 result = *(__n128 *)a1;
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a5 = *(_OWORD *)a1;
  *(_OWORD *)(a5 + 16) = v9;
  *(void *)(a5 + 32) = v5;
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = v6;
  *(unsigned char *)(a5 + 64) = v7;
  return result;
}

uint64_t Conversation.Update.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 40);
  uint64_t v5 = *(void *)(v2 + 48);
  int v7 = *(unsigned __int8 *)(v2 + 64);
  if (v4)
  {
    uint64_t v9 = *(void *)v2;
    uint64_t v8 = *(void *)(v2 + 8);
    sub_244567B20();
    sub_244567B10();
    sub_24454DE40(v9, v8, v4);
    swift_bridgeObjectRetain();
    sub_2445676D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2445676D0();
    swift_bridgeObjectRelease();
    sub_24454DEC0(v9, v8, v4);
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_244567B20();
    if (v6)
    {
LABEL_3:
      sub_244567B20();
      swift_bridgeObjectRetain();
      sub_24455FED0(a1, v6);
      swift_bridgeObjectRelease();
      if (v5) {
        goto LABEL_4;
      }
LABEL_8:
      sub_244567B20();
      if (v7) {
        return sub_244567B20();
      }
      goto LABEL_9;
    }
  }
  sub_244567B20();
  if (!v5) {
    goto LABEL_8;
  }
LABEL_4:
  sub_244567B20();
  swift_bridgeObjectRetain();
  sub_24455FED0(a1, v5);
  swift_bridgeObjectRelease();
  if (v7) {
    return sub_244567B20();
  }
LABEL_9:
  sub_244567B20();
  return sub_244567B10();
}

unint64_t sub_24455DBC4()
{
  unint64_t result = 0x6D654D6C61636F6CLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x737265626D656DLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x696C696261706163;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24455DC68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_244560F58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24455DC90(uint64_t a1)
{
  unint64_t v2 = sub_24456050C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24455DCCC(uint64_t a1)
{
  unint64_t v2 = sub_24456050C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Conversation.Update.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88880);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *v1;
  long long v18 = v1[1];
  long long v19 = v8;
  uint64_t v10 = *((void *)v1 + 4);
  uint64_t v9 = *((void *)v1 + 5);
  uint64_t v16 = *((void *)v1 + 6);
  uint64_t v17 = v9;
  uint64_t v15 = *((void *)v1 + 7);
  int v23 = *((unsigned __int8 *)v1 + 64);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_24456050C();
  sub_244567B50();
  long long v20 = v19;
  long long v21 = v18;
  uint64_t v22 = v10;
  char v24 = 0;
  sub_244560560();
  sub_244567A90();
  if (!v2)
  {
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    *(void *)&long long v20 = v17;
    char v24 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E88898);
    sub_24456065C(&qword_268E888A0, (void (*)(void))sub_244560560);
    sub_244567A90();
    *(void *)&long long v20 = v12;
    char v24 = 2;
    sub_244567A90();
    *(void *)&long long v20 = v11;
    BYTE8(v20) = v23;
    char v24 = 3;
    sub_2445605B4();
    sub_244567A90();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t Conversation.Update.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 64);
  long long v2 = v0[1];
  long long v6 = *v0;
  long long v7 = v2;
  long long v3 = v0[3];
  long long v8 = v0[2];
  long long v9 = v3;
  char v10 = v1;
  sub_244567B00();
  Conversation.Update.hash(into:)((uint64_t)v5);
  return sub_244567B30();
}

uint64_t Conversation.Update.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E888B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_24456050C();
  sub_244567B40();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  else
  {
    char v41 = 0;
    sub_244560608();
    sub_244567A40();
    uint64_t v31 = v6;
    uint64_t v29 = a2;
    uint64_t v11 = v36;
    uint64_t v10 = v37;
    uint64_t v12 = v38;
    uint64_t v35 = v39;
    uint64_t v13 = v40;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88898);
    char v41 = 1;
    uint64_t v32 = v11;
    uint64_t v33 = v10;
    uint64_t v34 = v12;
    sub_24454DE40(v11, v10, v12);
    sub_24456065C(&qword_268E888C0, (void (*)(void))sub_244560608);
    uint64_t v30 = v14;
    sub_244567A40();
    uint64_t v15 = v32;
    uint64_t v28 = v13;
    uint64_t v16 = v36;
    char v41 = 2;
    swift_bridgeObjectRetain();
    sub_244567A40();
    uint64_t v17 = v36;
    char v41 = 3;
    sub_2445606CC();
    swift_bridgeObjectRetain();
    sub_244567A40();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v5);
    uint64_t v18 = v35;
    uint64_t v31 = v36;
    LODWORD(v30) = v37;
    uint64_t v20 = v33;
    uint64_t v19 = v34;
    uint64_t v21 = v28;
    sub_24454DE40(v15, v33, v34);
    sub_24454DEC0(v15, v20, v19);
    uint64_t v22 = v29;
    *uint64_t v29 = v15;
    v22[1] = v20;
    v22[2] = v19;
    v22[3] = v18;
    v22[4] = v21;
    v22[5] = v16;
    uint64_t v23 = v31;
    v22[6] = v17;
    v22[7] = v23;
    *((unsigned char *)v22 + 64) = v30;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    uint64_t v24 = v15;
    uint64_t v25 = v20;
    uint64_t v26 = v19;
  }
  sub_24454DEC0(v24, v25, v26);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24455E464@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return Conversation.Update.init(from:)(a1, a2);
}

uint64_t sub_24455E47C(void *a1)
{
  return Conversation.Update.encode(to:)(a1);
}

uint64_t sub_24455E494()
{
  char v1 = *((unsigned char *)v0 + 64);
  long long v2 = v0[1];
  long long v6 = *v0;
  long long v7 = v2;
  long long v3 = v0[3];
  long long v8 = v0[2];
  long long v9 = v3;
  char v10 = v1;
  sub_244567B00();
  Conversation.Update.hash(into:)((uint64_t)v5);
  return sub_244567B30();
}

uint64_t sub_24455E4F4()
{
  char v1 = *((unsigned char *)v0 + 64);
  long long v2 = v0[1];
  long long v6 = *v0;
  long long v7 = v2;
  long long v3 = v0[3];
  long long v8 = v0[2];
  long long v9 = v3;
  char v10 = v1;
  sub_244567B00();
  Conversation.Update.hash(into:)((uint64_t)v5);
  return sub_244567B30();
}

uint64_t sub_24455E550(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v28 = result;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v34 = a2 + 56;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v31 = (v6 - 1) & v6;
  int64_t v32 = v3;
  for (unint64_t i = __clz(__rbit64(v6)) | (v3 << 6); ; unint64_t i = __clz(__rbit64(v9)) + (v10 << 6))
  {
    uint64_t v12 = (void *)(*(void *)(result + 48) + 40 * i);
    int v13 = *(unsigned __int8 *)v12;
    uint64_t v15 = v12[1];
    uint64_t v14 = v12[2];
    uint64_t v17 = v12[3];
    uint64_t v16 = v12[4];
    sub_244567B00();
    sub_244567B10();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_2445676D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2445676D0();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_244567B30();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
    {
LABEL_41:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v21 = ~v19;
    uint64_t v22 = *(void *)(a2 + 48);
    while (1)
    {
      uint64_t v23 = (void *)(v22 + 40 * v20);
      if (*(unsigned __int8 *)v23 == v13)
      {
        uint64_t v24 = v23[3];
        uint64_t v25 = v23[4];
        BOOL v26 = v23[1] == v15 && v23[2] == v14;
        if (v26 || (sub_244567AD0() & 1) != 0)
        {
          BOOL v27 = v24 == v17 && v25 == v16;
          if (v27 || (sub_244567AD0() & 1) != 0) {
            break;
          }
        }
      }
      unint64_t v20 = (v20 + 1) & v21;
      if (((*(void *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
        goto LABEL_41;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v3 = v32;
    uint64_t v2 = a2;
    uint64_t result = v28;
    unint64_t v6 = v31;
    if (v31) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v8 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v8 >= v30) {
      return 1;
    }
    unint64_t v9 = *(void *)(v29 + 8 * v8);
    int64_t v10 = v3 + 1;
    if (!v9)
    {
      int64_t v10 = v8 + 1;
      if (v8 + 1 >= v30) {
        return 1;
      }
      unint64_t v9 = *(void *)(v29 + 8 * v10);
      if (!v9)
      {
        int64_t v10 = v8 + 2;
        if (v8 + 2 >= v30) {
          return 1;
        }
        unint64_t v9 = *(void *)(v29 + 8 * v10);
        if (!v9)
        {
          int64_t v10 = v8 + 3;
          if (v8 + 3 >= v30) {
            return 1;
          }
          unint64_t v9 = *(void *)(v29 + 8 * v10);
          if (!v9) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v31 = (v9 - 1) & v9;
    int64_t v32 = v10;
  }
  int64_t v11 = v8 + 4;
  if (v11 >= v30) {
    return 1;
  }
  unint64_t v9 = *(void *)(v29 + 8 * v11);
  if (v9)
  {
    int64_t v10 = v11;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v9 = *(void *)(v29 + 8 * v10);
    ++v11;
    if (v9) {
      goto LABEL_23;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_24455E874(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_244567B00();
  sub_244567B10();
  uint64_t v6 = sub_244567B30();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_24455F3CC(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_24455E994(void *a1, void *a2)
{
  int64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_244567890();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_24454FC44();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_244567880();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_24455EC14(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_24455F0A8();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_24455F348((uint64_t)v8, v22);
    *int64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_244567810();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_24454FC44();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_244567820();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_244567820();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_24455F51C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_24455EC14(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E888F8);
    uint64_t v2 = sub_2445678D0();
    uint64_t v14 = v2;
    sub_244567870();
    if (sub_2445678A0())
    {
      sub_24454FC44();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_24455F0A8();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_244567810();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_2445678A0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_24455EDFC()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E88908);
  uint64_t result = sub_2445678C0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v26;
                }
                char v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_244567B00();
      sub_244567B10();
      uint64_t result = sub_244567B30();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v1 = v4;
  return result;
}

uint64_t sub_24455F0A8()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E888F8);
  uint64_t v3 = sub_2445678C0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                char v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_244567810();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v1 = v4;
  return result;
}

unint64_t sub_24455F348(uint64_t a1, uint64_t a2)
{
  sub_244567810();
  unint64_t result = sub_244567860();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24455F3CC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24455EDFC();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_24455F694();
      goto LABEL_14;
    }
    sub_24455F9D8();
  }
  uint64_t v8 = *v3;
  sub_244567B00();
  sub_244567B10();
  unint64_t result = sub_244567B30();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for HandleType(0);
      unint64_t result = sub_244567AE0();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void sub_24455F51C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24455F0A8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_24455F82C();
      goto LABEL_14;
    }
    sub_24455FC54();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_244567810();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_24454FC44();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_244567820();

    if (v12)
    {
LABEL_13:
      sub_244567AE0();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_244567820();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_24455F694()
{
  char v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E88908);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2445678B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *char v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_24455F82C()
{
  char v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E888F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2445678B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *char v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24455F9D8()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E88908);
  uint64_t result = sub_2445678C0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *char v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_244567B00();
    sub_244567B10();
    uint64_t result = sub_244567B30();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    char v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24455FC54()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E888F8);
  uint64_t v3 = sub_2445678C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *char v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_244567810();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    char v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24455FED0(uint64_t a1, uint64_t a2)
{
  sub_244567B30();
  uint64_t v3 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_19;
    }
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_244567B10();
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    if (!v13) {
      break;
    }
LABEL_16:
    uint64_t v6 = (v13 - 1) & v13;
LABEL_5:
    sub_244567B00();
    sub_244567B10();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_2445676D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2445676D0();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_244567B30();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  int64_t v14 = v10 + 1;
  if (v10 + 1 >= v7) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v10 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    ++v14;
    if (v13) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_2445600C0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_244560164(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t _s20LiveCommunicationKit12ConversationC6UpdateV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  char v10 = *(unsigned char *)(a1 + 64);
  uint64_t v12 = *(void *)a2;
  uint64_t v11 = *(void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 16);
  uint64_t v14 = *(void *)(a2 + 24);
  uint64_t v16 = *(void *)(a2 + 32);
  uint64_t v15 = *(void *)(a2 + 40);
  uint64_t v18 = *(void *)(a2 + 48);
  uint64_t v17 = *(void *)(a2 + 56);
  char v19 = *(unsigned char *)(a2 + 64);
  if (!v5)
  {
    if (!v13) {
      goto LABEL_12;
    }
LABEL_17:
    sub_24454DE40(v12, v11, v13);
    sub_24454DEC0(v2, v3, v5);
    sub_24454DEC0(v12, v11, v13);
    return 0;
  }
  if (!v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  if (v12 != v2) {
    return 0;
  }
  if (v3 == v11 && v5 == v13) {
    goto LABEL_36;
  }
  uint64_t v56 = *(void *)(a1 + 56);
  uint64_t v57 = *(void *)(a1 + 40);
  char v20 = *(unsigned char *)(a1 + 64);
  char v21 = *(unsigned char *)(a2 + 64);
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(a2 + 56);
  uint64_t v24 = *(void *)(a2 + 48);
  uint64_t v25 = *(void *)(a2 + 40);
  char v26 = sub_244567AD0();
  uint64_t v15 = v25;
  uint64_t v8 = v56;
  uint64_t v6 = v57;
  uint64_t v18 = v24;
  uint64_t v17 = v23;
  uint64_t v9 = v22;
  char v19 = v21;
  char v10 = v20;
  char v27 = v26;
  uint64_t result = 0;
  if (v27)
  {
LABEL_36:
    if (v4 == v14 && v7 == v16) {
      goto LABEL_12;
    }
    uint64_t v29 = v8;
    char v30 = v10;
    char v31 = v19;
    uint64_t v32 = v9;
    uint64_t v33 = v17;
    uint64_t v34 = v18;
    uint64_t v35 = v6;
    uint64_t v36 = v15;
    char v37 = sub_244567AD0();
    uint64_t v15 = v36;
    uint64_t v6 = v35;
    uint64_t v18 = v34;
    uint64_t v17 = v33;
    uint64_t v9 = v32;
    char v19 = v31;
    char v10 = v30;
    uint64_t v8 = v29;
    char v38 = v37;
    uint64_t result = 0;
    if (v38)
    {
LABEL_12:
      if (v6)
      {
        if (!v15) {
          return 0;
        }
        uint64_t v39 = v8;
        char v40 = v10;
        char v41 = v19;
        uint64_t v42 = v9;
        uint64_t v43 = v17;
        uint64_t v44 = v18;
        uint64_t v45 = v15;
        swift_bridgeObjectRetain();
        uint64_t v46 = swift_bridgeObjectRetain();
        char v47 = sub_24455E550(v46, v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v18 = v44;
        uint64_t v17 = v43;
        uint64_t v9 = v42;
        char v19 = v41;
        char v10 = v40;
        uint64_t v8 = v39;
        if ((v47 & 1) == 0) {
          return 0;
        }
      }
      else if (v15)
      {
        return 0;
      }
      if (v9)
      {
        if (!v18) {
          return 0;
        }
        uint64_t v48 = v8;
        char v49 = v10;
        char v50 = v19;
        uint64_t v51 = v17;
        uint64_t v52 = v18;
        swift_bridgeObjectRetain();
        uint64_t v53 = swift_bridgeObjectRetain();
        char v54 = sub_24455E550(v53, v52);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v17 = v51;
        char v19 = v50;
        char v10 = v49;
        uint64_t v8 = v48;
        if ((v54 & 1) == 0) {
          return 0;
        }
      }
      else if (v18)
      {
        return 0;
      }
      if (v10)
      {
        if (v19) {
          return 1;
        }
      }
      else
      {
        if (v8 == v17) {
          char v55 = v19;
        }
        else {
          char v55 = 1;
        }
        if ((v55 & 1) == 0) {
          return 1;
        }
      }
      return 0;
    }
  }
  return result;
}

unint64_t sub_24456050C()
{
  unint64_t result = qword_268E88888;
  if (!qword_268E88888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88888);
  }
  return result;
}

unint64_t sub_244560560()
{
  unint64_t result = qword_268E88890;
  if (!qword_268E88890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88890);
  }
  return result;
}

unint64_t sub_2445605B4()
{
  unint64_t result = qword_268E888A8;
  if (!qword_268E888A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888A8);
  }
  return result;
}

unint64_t sub_244560608()
{
  unint64_t result = qword_268E888B8;
  if (!qword_268E888B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888B8);
  }
  return result;
}

uint64_t sub_24456065C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E88898);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2445606CC()
{
  unint64_t result = qword_268E888C8;
  if (!qword_268E888C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888C8);
  }
  return result;
}

unint64_t sub_244560724()
{
  unint64_t result = qword_268E888D0;
  if (!qword_268E888D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888D0);
  }
  return result;
}

uint64_t _s6UpdateVwxx(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s6UpdateVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6UpdateVwca(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 2);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24454D950(a1);
      uint64_t v5 = *((void *)a2 + 4);
      long long v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v7 = *a2;
    long long v8 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)a2 + 7);
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 56) = v9;
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s6UpdateVwta(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 16);
  if (!v4)
  {
    sub_24454D950(a1);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    goto LABEL_6;
  }
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t _s6UpdateVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s6UpdateVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Conversation.Update()
{
  return &type metadata for Conversation.Update;
}

unsigned char *_s6UpdateV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x244560BF8);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s6UpdateV10CodingKeysOMa()
{
  return &_s6UpdateV10CodingKeysON;
}

unint64_t sub_244560C34()
{
  unint64_t result = qword_268E888D8;
  if (!qword_268E888D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888D8);
  }
  return result;
}

unint64_t sub_244560C8C()
{
  unint64_t result = qword_268E888E0;
  if (!qword_268E888E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888E0);
  }
  return result;
}

unint64_t sub_244560CE4()
{
  unint64_t result = qword_268E888E8;
  if (!qword_268E888E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E888E8);
  }
  return result;
}

uint64_t sub_244560D38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for HandleType(0);
  sub_24456113C(&qword_268E88900, type metadata accessor for HandleType);
  uint64_t result = sub_2445677D0();
  uint64_t v7 = result;
  if (v2)
  {
    unsigned int v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_24455E874(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_244560DE4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2445679D0();
    swift_bridgeObjectRelease();
  }
  sub_24454FC44();
  sub_24456113C(&qword_268E888F0, (void (*)(uint64_t))sub_24454FC44);
  uint64_t result = sub_2445677D0();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2445679D0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x245691DF0](i, a1);
        sub_24455E994(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        long long v8 = *v7++;
        sub_24455E994(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_244560F58(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D654D6C61636F6CLL && a2 == 0xEB00000000726562;
  if (v2 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737265626D656DLL && a2 == 0xE700000000000000 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024456A9C0 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x696C696261706163 && a2 == 0xEC00000073656974)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_244567AD0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24456113C(unint64_t *a1, void (*a2)(uint64_t))
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

LiveCommunicationKit::PlayToneAction::Tone_optional __swiftcall PlayToneAction.Tone.init(rawValue:)(Swift::Int rawValue)
{
  unsigned int v2 = 0x2010003u >> (8 * rawValue);
  if ((unint64_t)rawValue >= 4) {
    LOBYTE(v2) = 3;
  }
  *unint64_t v1 = v2;
  return (LiveCommunicationKit::PlayToneAction::Tone_optional)rawValue;
}

uint64_t PlayToneAction.Tone.rawValue.getter()
{
  return *v0 + 1;
}

uint64_t sub_2445611B4()
{
  return sub_244567B30();
}

uint64_t sub_2445611FC()
{
  return sub_244567B10();
}

uint64_t sub_24456122C()
{
  return sub_244567B30();
}

LiveCommunicationKit::PlayToneAction::Tone_optional sub_244561270(Swift::Int *a1)
{
  return PlayToneAction.Tone.init(rawValue:)(*a1);
}

void sub_244561278(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t PlayToneAction.digits.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_digits);
  swift_bridgeObjectRetain();
  return v1;
}

void PlayToneAction.tone.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone);
}

uint64_t PlayToneAction.__allocating_init(conversationUUID:digits:tone:)(char *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v8 = swift_allocObject();
  PlayToneAction.init(conversationUUID:digits:tone:)(a1, a2, a3, a4);
  return v8;
}

uint64_t PlayToneAction.init(conversationUUID:digits:tone:)(char *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v5 = v4;
  uint64_t v33 = a1;
  uint64_t v10 = sub_244567560();
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v38 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2445675A0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v35 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = *a4;
  uint64_t v32 = v18;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v34((char *)&v31 - v16, (uint64_t)a1, v12);
  uint64_t v31 = v18 + 1;
  id v19 = objc_allocWithZone(MEMORY[0x263EFC948]);
  swift_retain();
  swift_bridgeObjectRetain();
  char v20 = (void *)sub_244567570();
  uint64_t v21 = a2;
  uint64_t v22 = (void *)sub_244567690();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v19, sel_initWithCallUUID_digits_type_, v20, v22, v31);

  uint64_t v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  v24(v17, v12);
  uint64_t v25 = (void *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_digits);
  *uint64_t v25 = v21;
  v25[1] = a3;
  *(unsigned char *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = v32;
  swift_release();
  char v26 = v35;
  char v27 = v33;
  v34(v35, (uint64_t)v33, v12);
  uint64_t v28 = v36;
  sub_244567540();
  v24(v27, v12);
  *(void *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v26, v12);
  uint64_t v29 = (void *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v29 = 0;
  v29[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v28, v38);
  return v5;
}

uint64_t sub_244561650(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v35 = sub_244567560();
  uint64_t v4 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  char v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2445675A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  id v11 = objc_msgSend(a1, sel_digits);
  uint64_t v12 = sub_2445676A0();
  uint64_t v14 = v13;

  uint64_t v15 = (uint64_t *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_digits);
  *uint64_t v15 = v12;
  v15[1] = v14;
  id v16 = objc_msgSend(a1, sel_type);
  if (v16 == (id)1)
  {
LABEL_11:
    *(unsigned char *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = 0;
    goto LABEL_12;
  }
  if (v16 == (id)2)
  {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = 1;
    goto LABEL_12;
  }
  if (v16 != (id)3)
  {
    if (qword_268E884C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_244567630();
    __swift_project_value_buffer(v17, (uint64_t)qword_268E88BA0);
    id v18 = a1;
    id v19 = sub_244567610();
    os_log_type_t v20 = sub_2445677F0();
    int v34 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      os_log_t v32 = v19;
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v37 = v31;
      uint64_t v21 = v33;
      *(_DWORD *)uint64_t v33 = 136315138;
      id v36 = objc_msgSend(v18, sel_type, v21 + 4);
      uint64_t v22 = sub_2445676C0();
      id v36 = (id)sub_24454EB60(v22, v23, &v37);
      sub_244567830();

      swift_bridgeObjectRelease();
      os_log_t v24 = v32;
      uint64_t v25 = v33;
      uint64_t v26 = v31;
      swift_arrayDestroy();
      MEMORY[0x245692540](v26, -1, -1);
      MEMORY[0x245692540](v25, -1, -1);
    }
    else
    {
    }
    goto LABEL_11;
  }
  *(unsigned char *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = 2;
LABEL_12:
  swift_release();
  id v27 = objc_msgSend(a1, sel_callUUID);
  sub_244567590();

  sub_244567540();
  *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v10, v7);
  uint64_t v28 = (void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v28 = 0;
  v28[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v6, v35);
  return v2;
}

void sub_244561A70()
{
}

uint64_t sub_244561AA0()
{
  return swift_bridgeObjectRelease();
}

uint64_t PlayToneAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlayToneAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

unint64_t sub_244561CD4()
{
  unint64_t result = qword_268E88910;
  if (!qword_268E88910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88910);
  }
  return result;
}

uint64_t sub_244561D28()
{
  return type metadata accessor for PlayToneAction();
}

uint64_t type metadata accessor for PlayToneAction()
{
  uint64_t result = qword_268E88918;
  if (!qword_268E88918) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_244561D7C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for PlayToneAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlayToneAction);
}

uint64_t dispatch thunk of PlayToneAction.__allocating_init(conversationUUID:digits:tone:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t getEnumTagSinglePayload for PlayToneAction.Tone(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PlayToneAction.Tone(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x244561F50);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayToneAction.Tone()
{
  return &type metadata for PlayToneAction.Tone;
}

uint64_t sub_244561FA0(char *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = *(void (**)(uint64_t))&a1[*a4];
  id v6 = a3;
  BOOL v7 = a1;
  uint64_t v8 = swift_retain();
  v5(v8);

  return swift_release();
}

uint64_t sub_244562088(char *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  BOOL v7 = *(void (**)(id))&a1[*a5];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1;
  swift_retain();
  v7(v9);

  return swift_release();
}

id sub_244562118()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidReset];
  *(void *)uint64_t v1 = nullsub_1;
  *((void *)v1 + 1) = 0;
  int v2 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidBegin];
  *(void *)int v2 = nullsub_1;
  *((void *)v2 + 1) = 0;
  int v3 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidActivateAudioSession];
  *(void *)int v3 = nullsub_1;
  *((void *)v3 + 1) = 0;
  unsigned int v4 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidDeactivateAudioSession];
  *(void *)unsigned int v4 = nullsub_1;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderTimedOutPerformingAction];
  *(void *)uint64_t v5 = nullsub_1;
  *((void *)v5 + 1) = 0;
  id v6 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAction];
  *(void *)id v6 = nullsub_1;
  *((void *)v6 + 1) = 0;
  BOOL v7 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformStartCallAction];
  *(void *)BOOL v7 = nullsub_1;
  *((void *)v7 + 1) = 0;
  id v8 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAnswerCallAction];
  *(void *)id v8 = nullsub_1;
  *((void *)v8 + 1) = 0;
  id v9 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformEndCallAction];
  *(void *)id v9 = nullsub_1;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetHeldCallAction];
  *(void *)uint64_t v10 = nullsub_1;
  *((void *)v10 + 1) = 0;
  id v11 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetMutedCallAction];
  *(void *)id v11 = nullsub_1;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetGroupCallAction];
  *(void *)uint64_t v12 = nullsub_1;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformPlayDTMFCallAction];
  *(void *)uint64_t v13 = nullsub_1;
  *((void *)v13 + 1) = 0;
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for CallProviderWrapper();
  return objc_msgSendSuper2(&v15, sel_init);
}

id sub_244562310()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CallProviderWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CallProviderWrapper()
{
  return self;
}

uint64_t EndConversationAction.__allocating_init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  EndConversationAction.init(conversationUUID:)(a1);
  return v2;
}

uint64_t EndConversationAction.init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_244567560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2445675A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone(MEMORY[0x263EFC930]);
  uint64_t v13 = (void *)sub_244567570();
  id v14 = objc_msgSend(v12, sel_initWithCallUUID_, v13);

  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v14;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v11, v8);
  objc_super v15 = (void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *objc_super v15 = 0;
  v15[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v4);
  return v2;
}

void EndConversationAction.fulfill(dateEnded:)(uint64_t a1)
{
  uint64_t v3 = sub_244567560();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E884C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_244567630();
  __swift_project_value_buffer(v7, (uint64_t)qword_268E88BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  swift_retain_n();
  uint64_t v8 = sub_244567610();
  os_log_type_t v9 = sub_2445677F0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v19[1] = a1;
    uint64_t v11 = v10;
    v19[0] = swift_slowAlloc();
    uint64_t v20 = v1;
    uint64_t v21 = v19[0];
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_retain();
    uint64_t v12 = sub_2445676C0();
    uint64_t v20 = sub_24454EB60(v12, v13, &v21);
    sub_244567830();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_244550648();
    uint64_t v14 = sub_244567AC0();
    uint64_t v20 = sub_24454EB60(v14, v15, &v21);
    sub_244567830();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _os_log_impl(&dword_244549000, v8, v9, "Fulfilling action %s with dateEnded %s", (uint8_t *)v11, 0x16u);
    uint64_t v16 = v19[0];
    swift_arrayDestroy();
    MEMORY[0x245692540](v16, -1, -1);
    MEMORY[0x245692540](v11, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  self;
  uint64_t v17 = (void *)swift_dynamicCastObjCClassUnconditional();
  id v18 = (void *)sub_244567530();
  objc_msgSend(v17, sel_fulfillWithDateEnded_, v18);
}

void sub_244562A60()
{
}

uint64_t EndConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t EndConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_244562C84()
{
  return type metadata accessor for EndConversationAction();
}

uint64_t type metadata accessor for EndConversationAction()
{
  uint64_t result = qword_268E88A00;
  if (!qword_268E88A00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for EndConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EndConversationAction);
}

uint64_t dispatch thunk of EndConversationAction.__allocating_init(conversationUUID:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t UnmergeConversationAction.__allocating_init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  UnmergeConversationAction.init(conversationUUID:)(a1);
  return v2;
}

uint64_t UnmergeConversationAction.init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v20 = sub_244567560();
  uint64_t v4 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2445675A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88658);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, 1, 1, v7);
  uint64_t v14 = (void *)sub_244567570();
  unint64_t v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    unint64_t v15 = (void *)sub_244567570();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC960]), sel_initWithCallUUID_callUUIDToGroupWith_, v14, v15);

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  *(void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v10, v7);
  uint64_t v17 = (void *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *uint64_t v17 = 0;
  v17[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v6, v20);
  return v2;
}

void sub_244563038()
{
}

uint64_t UnmergeConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t UnmergeConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24456325C()
{
  return type metadata accessor for UnmergeConversationAction();
}

uint64_t type metadata accessor for UnmergeConversationAction()
{
  uint64_t result = qword_268E88A10;
  if (!qword_268E88A10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for UnmergeConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UnmergeConversationAction);
}

uint64_t dispatch thunk of UnmergeConversationAction.__allocating_init(conversationUUID:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t Conversation.EndedReason.init(rawValue:)@<X0>(unint64_t result@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v2 = 0x40302010005uLL >> (8 * result);
  if (result >= 6) {
    LOBYTE(v2) = 5;
  }
  *a2 = v2;
  return result;
}

uint64_t Conversation.EndedReason.rawValue.getter()
{
  return *v0 + 1;
}

unint64_t sub_244563310@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return Conversation.EndedReason.init(rawValue:)(*a1, a2);
}

uint64_t sub_244563318()
{
  return sub_244567710();
}

uint64_t sub_244563378()
{
  return sub_244567700();
}

unint64_t sub_2445633CC()
{
  unint64_t result = qword_268E88A20;
  if (!qword_268E88A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A20);
  }
  return result;
}

uint64_t _s11EndedReasonOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s11EndedReasonOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x24456357CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Conversation.EndedReason()
{
  return &type metadata for Conversation.EndedReason;
}

unint64_t sub_2445635B4()
{
  unint64_t result = qword_268E88A28;
  if (!qword_268E88A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A28);
  }
  return result;
}

uint64_t sub_244563608@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
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

uint64_t Conversation.Capabilities.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static Conversation.Capabilities.pausing.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static Conversation.Capabilities.merging.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static Conversation.Capabilities.unmerging.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static Conversation.Capabilities.video.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static Conversation.Capabilities.playingTones.getter(void *a1@<X8>)
{
  *a1 = 16;
}

uint64_t Conversation.Capabilities.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t Conversation.Capabilities.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Conversation.Capabilities.rawValue.modify())()
{
  return nullsub_1;
}

unint64_t sub_2445636D8()
{
  unint64_t result = qword_268E88A30;
  if (!qword_268E88A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A30);
  }
  return result;
}

unint64_t sub_244563730()
{
  unint64_t result = qword_268E88A38;
  if (!qword_268E88A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A38);
  }
  return result;
}

void *sub_244563784@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_244563790()
{
  return sub_244567710();
}

uint64_t sub_2445637F0()
{
  return sub_244567700();
}

unint64_t sub_244563844()
{
  unint64_t result = qword_268E88A40;
  if (!qword_268E88A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A40);
  }
  return result;
}

unint64_t sub_24456389C()
{
  unint64_t result = qword_268E88A48;
  if (!qword_268E88A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A48);
  }
  return result;
}

void sub_2445638F0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2445638F8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_24456390C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_244563920@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_244563934(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_244563964@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_244563990@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2445639B4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2445639C8(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2445639DC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2445639F0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_244563A04(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_244563A18(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_244563A2C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_244563A40()
{
  return *v0 == 0;
}

uint64_t sub_244563A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_244563A68(void *result)
{
  *v1 &= ~*result;
  return result;
}

ValueMetadata *type metadata accessor for Conversation.Capabilities()
{
  return &type metadata for Conversation.Capabilities;
}

uint64_t ConversationAction.State.hash(into:)()
{
  if (*(void *)(v0 + 8) <= 2uLL) {
    return sub_244567B10();
  }
  sub_244567B10();

  return sub_2445676D0();
}

uint64_t sub_244563B30()
{
  uint64_t result = 1701602409;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x676E696E6E7572;
      break;
    case 2:
      uint64_t result = 0x6574656C706D6F63;
      break;
    case 3:
      uint64_t result = 0x64656C696166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_244563BB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2445658B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244563BDC(uint64_t a1)
{
  unint64_t v2 = sub_244564E24();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244563C18(uint64_t a1)
{
  unint64_t v2 = sub_244564E24();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244563C54()
{
  return 0;
}

uint64_t sub_244563C60(uint64_t a1)
{
  unint64_t v2 = sub_244564ECC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244563C9C(uint64_t a1)
{
  unint64_t v2 = sub_244564ECC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244563CD8()
{
  return 0x6E6F73616572;
}

uint64_t sub_244563CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_244567AD0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_244563D7C(uint64_t a1)
{
  unint64_t v2 = sub_244564E78();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244563DB8(uint64_t a1)
{
  unint64_t v2 = sub_244564E78();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244563DF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_244563E24(uint64_t a1)
{
  unint64_t v2 = sub_244564F74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244563E60(uint64_t a1)
{
  unint64_t v2 = sub_244564F74();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244563E9C(uint64_t a1)
{
  unint64_t v2 = sub_244564F20();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244563ED8(uint64_t a1)
{
  unint64_t v2 = sub_244564F20();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConversationAction.State.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88A50);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v30 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88A58);
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  MEMORY[0x270FA5388](v6);
  id v27 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88A60);
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88A68);
  uint64_t v24 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88A70);
  uint64_t v33 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *v2;
  uint64_t v18 = v2[1];
  uint64_t v23 = v17;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_244564E24();
  sub_244567B50();
  switch(v18)
  {
    case 0:
      char v34 = 0;
      sub_244564F74();
      sub_244567A80();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
    case 1:
      char v35 = 1;
      sub_244564F20();
      sub_244567A80();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
    case 2:
      char v36 = 2;
      sub_244564ECC();
      uint64_t v19 = v27;
      sub_244567A80();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
  char v37 = 3;
  sub_244564E78();
  uint64_t v21 = v30;
  sub_244567A80();
  uint64_t v22 = v32;
  sub_244567AA0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
}

uint64_t ConversationAction.State.hashValue.getter()
{
  unint64_t v1 = *(void *)(v0 + 8);
  sub_244567B00();
  sub_244567B10();
  if (v1 > 2) {
    sub_2445676D0();
  }
  return sub_244567B30();
}

uint64_t ConversationAction.State.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v47 = a2;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88AA0);
  uint64_t v44 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v46 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88AA8);
  uint64_t v38 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88AB0);
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88AB8);
  uint64_t v39 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88AC0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v48 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v14);
  sub_244564E24();
  uint64_t v15 = v49;
  sub_244567B40();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
  }
  id v16 = v9;
  uint64_t v36 = v7;
  uint64_t v37 = 0;
  uint64_t v17 = v6;
  uint64_t v19 = v45;
  uint64_t v18 = v46;
  uint64_t v49 = v11;
  uint64_t v20 = v47;
  uint64_t v21 = sub_244567A70();
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_244567940();
    swift_allocError();
    id v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E887C8);
    void *v27 = &type metadata for ConversationAction.State;
    sub_244567A30();
    sub_244567930();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v10);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
  }
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v51 = 1;
      sub_244564F20();
      uint64_t v28 = v37;
      sub_244567A20();
      if (v28) {
        goto LABEL_12;
      }
      uint64_t v37 = 0;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v42);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v10);
      uint64_t v24 = 0;
      uint64_t v23 = 1;
      goto LABEL_16;
    case 2:
      char v52 = 2;
      sub_244564ECC();
      uint64_t v29 = v37;
      sub_244567A20();
      if (v29) {
        goto LABEL_12;
      }
      uint64_t v37 = 0;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v10);
      uint64_t v24 = 0;
      uint64_t v23 = 2;
      goto LABEL_16;
    case 3:
      char v53 = 3;
      sub_244564E78();
      uint64_t v30 = v37;
      sub_244567A20();
      if (v30) {
        goto LABEL_12;
      }
      uint64_t v32 = v41;
      uint64_t v33 = sub_244567A50();
      uint64_t v34 = v49;
      uint64_t v37 = 0;
      uint64_t v24 = v33;
      uint64_t v23 = v35;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v18, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v10);
      goto LABEL_16;
    default:
      char v50 = 0;
      sub_244564F74();
      uint64_t v22 = v37;
      sub_244567A20();
      uint64_t v23 = v22;
      if (v22)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v10);
        return __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
      }
      uint64_t v37 = 0;
      (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v10);
      uint64_t v24 = 0;
LABEL_16:
      uint64_t *v20 = v24;
      v20[1] = v23;
      uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
      break;
  }
  return result;
}

uint64_t sub_244564B44@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ConversationAction.State.init(from:)(a1, a2);
}

uint64_t sub_244564B5C(void *a1)
{
  return ConversationAction.State.encode(to:)(a1);
}

uint64_t sub_244564B74()
{
  unint64_t v1 = *(void *)(v0 + 8);
  sub_244567B00();
  sub_244567B10();
  if (v1 > 2) {
    sub_2445676D0();
  }
  return sub_244567B30();
}

uint64_t sub_244564C04()
{
  if (*(void *)(v0 + 8) <= 2uLL) {
    return sub_244567B10();
  }
  sub_244567B10();

  return sub_2445676D0();
}

uint64_t sub_244564C9C()
{
  unint64_t v1 = *(void *)(v0 + 8);
  sub_244567B00();
  sub_244567B10();
  if (v1 > 2) {
    sub_2445676D0();
  }
  return sub_244567B30();
}

uint64_t _s20LiveCommunicationKit18ConversationActionC5StateO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      unint64_t v3 = 0;
      char v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      unint64_t v3 = 1;
      char v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5) {
        char v6 = 1;
      }
      else {
        char v6 = sub_244567AD0();
      }
      goto LABEL_12;
    }
LABEL_11:
    char v6 = 0;
LABEL_12:
    sub_24454E4AC(v4, v5);
    sub_24454E4AC(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2) {
    goto LABEL_11;
  }
  char v6 = 1;
  unint64_t v3 = 2;
LABEL_13:
  sub_24454AF84(v2, v3);
  sub_24454AF84(v4, v5);
  return v6 & 1;
}

unint64_t sub_244564E24()
{
  unint64_t result = qword_268E88A78;
  if (!qword_268E88A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A78);
  }
  return result;
}

unint64_t sub_244564E78()
{
  unint64_t result = qword_268E88A80;
  if (!qword_268E88A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A80);
  }
  return result;
}

unint64_t sub_244564ECC()
{
  unint64_t result = qword_268E88A88;
  if (!qword_268E88A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A88);
  }
  return result;
}

unint64_t sub_244564F20()
{
  unint64_t result = qword_268E88A90;
  if (!qword_268E88A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A90);
  }
  return result;
}

unint64_t sub_244564F74()
{
  unint64_t result = qword_268E88A98;
  if (!qword_268E88A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88A98);
  }
  return result;
}

unint64_t sub_244564FCC()
{
  unint64_t result = qword_268E88AC8;
  if (!qword_268E88AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AC8);
  }
  return result;
}

unint64_t _s5StateOwxx(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s5StateOwCP_0(uint64_t a1, uint64_t a2)
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

void *_s5StateOwca(void *a1, void *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t _s5StateOwta(uint64_t a1, uint64_t a2)
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

uint64_t _s5StateOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _s5StateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_244565248(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_244565260(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationAction.State()
{
  return &type metadata for ConversationAction.State;
}

unsigned char *_s5StateO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x24456535CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s5StateO10CodingKeysOMa()
{
  return &_s5StateO10CodingKeysON;
}

ValueMetadata *_s5StateO14IdleCodingKeysOMa()
{
  return &_s5StateO14IdleCodingKeysON;
}

ValueMetadata *_s5StateO17RunningCodingKeysOMa()
{
  return &_s5StateO17RunningCodingKeysON;
}

ValueMetadata *_s5StateO18CompleteCodingKeysOMa()
{
  return &_s5StateO18CompleteCodingKeysON;
}

unsigned char *_s5StateO16FailedCodingKeysOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x244565460);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s5StateO16FailedCodingKeysOMa()
{
  return &_s5StateO16FailedCodingKeysON;
}

unint64_t sub_24456549C()
{
  unint64_t result = qword_268E88AD0;
  if (!qword_268E88AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AD0);
  }
  return result;
}

unint64_t sub_2445654F4()
{
  unint64_t result = qword_268E88AD8;
  if (!qword_268E88AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AD8);
  }
  return result;
}

unint64_t sub_24456554C()
{
  unint64_t result = qword_268E88AE0;
  if (!qword_268E88AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AE0);
  }
  return result;
}

unint64_t sub_2445655A4()
{
  unint64_t result = qword_268E88AE8;
  if (!qword_268E88AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AE8);
  }
  return result;
}

unint64_t sub_2445655FC()
{
  unint64_t result = qword_268E88AF0;
  if (!qword_268E88AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AF0);
  }
  return result;
}

unint64_t sub_244565654()
{
  unint64_t result = qword_268E88AF8;
  if (!qword_268E88AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88AF8);
  }
  return result;
}

unint64_t sub_2445656AC()
{
  unint64_t result = qword_268E88B00;
  if (!qword_268E88B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B00);
  }
  return result;
}

unint64_t sub_244565704()
{
  unint64_t result = qword_268E88B08;
  if (!qword_268E88B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B08);
  }
  return result;
}

unint64_t sub_24456575C()
{
  unint64_t result = qword_268E88B10;
  if (!qword_268E88B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B10);
  }
  return result;
}

unint64_t sub_2445657B4()
{
  unint64_t result = qword_268E88B18;
  if (!qword_268E88B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B18);
  }
  return result;
}

unint64_t sub_24456580C()
{
  unint64_t result = qword_268E88B20;
  if (!qword_268E88B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B20);
  }
  return result;
}

unint64_t sub_244565864()
{
  unint64_t result = qword_268E88B28;
  if (!qword_268E88B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B28);
  }
  return result;
}

uint64_t sub_2445658B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696E6E7572 && a2 == 0xE700000000000000 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE800000000000000 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_244567AD0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

char *Handle.init(type:value:displayName:)@<X0>(char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v9 = *result;
  if (!a5)
  {
    unint64_t result = (char *)swift_bridgeObjectRetain();
    a4 = a2;
    a5 = a3;
  }
  *(unsigned char *)a6 = v9;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

LiveCommunicationKit::Handle::Kind_optional __swiftcall Handle.Kind.init(rawValue:)(Swift::Int rawValue)
{
  unsigned int v2 = 0x2010003u >> (8 * rawValue);
  if ((unint64_t)rawValue >= 4) {
    LOBYTE(v2) = 3;
  }
  *unint64_t v1 = v2;
  return (LiveCommunicationKit::Handle::Kind_optional)rawValue;
}

uint64_t Handle.Kind.rawValue.getter()
{
  return *v0 + 1;
}

LiveCommunicationKit::Handle::Kind_optional sub_244565AE4(Swift::Int *a1)
{
  return Handle.Kind.init(rawValue:)(*a1);
}

uint64_t sub_244565AEC()
{
  return sub_244567710();
}

uint64_t sub_244565B4C()
{
  return sub_244567700();
}

void Handle.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *Handle.type.setter(unsigned char *result)
{
  *unint64_t v1 = *result;
  return result;
}

uint64_t (*Handle.type.modify())()
{
  return nullsub_1;
}

uint64_t Handle.value.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Handle.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*Handle.value.modify())()
{
  return nullsub_1;
}

uint64_t Handle.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Handle.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*Handle.displayName.modify())()
{
  return nullsub_1;
}

uint64_t Handle.hash(into:)()
{
  sub_244567B10();
  swift_bridgeObjectRetain();
  sub_2445676D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2445676D0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244565D7C()
{
  uint64_t v1 = 0x65756C6176;
  if (*v0 != 1) {
    uint64_t v1 = 0x4E79616C70736964;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_244565DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_244566BC4(a1, a2);
  *a3 = result;
  return result;
}

void sub_244565DFC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_244565E08(uint64_t a1)
{
  unint64_t v2 = sub_2445665F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244565E44(uint64_t a1)
{
  unint64_t v2 = sub_2445665F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Handle.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88B30);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  v12[2] = *((void *)v1 + 2);
  void v12[3] = v9;
  uint64_t v10 = *((void *)v1 + 3);
  v12[0] = *((void *)v1 + 4);
  v12[1] = v10;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2445665F4();
  sub_244567B50();
  char v16 = v8;
  char v15 = 0;
  sub_244566648();
  sub_244567AB0();
  if (!v2)
  {
    char v14 = 1;
    sub_244567AA0();
    char v13 = 2;
    sub_244567AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t Handle.hashValue.getter()
{
  return sub_244567B30();
}

uint64_t Handle.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E88B48);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2445665F4();
  sub_244567B40();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v22 = 0;
  sub_24456669C();
  sub_244567A60();
  int v9 = v23;
  char v21 = 1;
  uint64_t v10 = sub_244567A50();
  uint64_t v12 = v11;
  uint64_t v18 = v10;
  int v19 = v9;
  char v20 = 2;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_244567A50();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(unsigned char *)a2 = v19;
  *(void *)(a2 + 8) = v18;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v15;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244566334@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Handle.init(from:)(a1, a2);
}

uint64_t sub_24456634C(void *a1)
{
  return Handle.encode(to:)(a1);
}

uint64_t sub_244566364()
{
  return sub_244567B30();
}

uint64_t sub_244566404()
{
  sub_244567B10();
  swift_bridgeObjectRetain();
  sub_2445676D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2445676D0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244566498()
{
  return sub_244567B30();
}

uint64_t _s20LiveCommunicationKit6HandleV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2) {
    return 0;
  }
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  BOOL v6 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v6 || (char v7 = sub_244567AD0(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_244567AD0();
    }
  }
  return result;
}

unint64_t sub_2445665F4()
{
  unint64_t result = qword_268E88B38;
  if (!qword_268E88B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B38);
  }
  return result;
}

unint64_t sub_244566648()
{
  unint64_t result = qword_268E88B40;
  if (!qword_268E88B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B40);
  }
  return result;
}

unint64_t sub_24456669C()
{
  unint64_t result = qword_268E88B50;
  if (!qword_268E88B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B50);
  }
  return result;
}

unint64_t sub_2445666F4()
{
  unint64_t result = qword_268E88B58;
  if (!qword_268E88B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B58);
  }
  return result;
}

unint64_t sub_24456674C()
{
  unint64_t result = qword_268E88B60;
  if (!qword_268E88B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B60);
  }
  return result;
}

uint64_t destroy for Handle()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for Handle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Handle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Handle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Handle()
{
  return &type metadata for Handle;
}

ValueMetadata *type metadata accessor for Handle.Kind()
{
  return &type metadata for Handle.Kind;
}

unsigned char *_s20LiveCommunicationKit6HandleV4KindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x244566A84);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Handle.CodingKeys()
{
  return &type metadata for Handle.CodingKeys;
}

unint64_t sub_244566AC0()
{
  unint64_t result = qword_268E88B68;
  if (!qword_268E88B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B68);
  }
  return result;
}

unint64_t sub_244566B18()
{
  unint64_t result = qword_268E88B70;
  if (!qword_268E88B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B70);
  }
  return result;
}

unint64_t sub_244566B70()
{
  unint64_t result = qword_268E88B78;
  if (!qword_268E88B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B78);
  }
  return result;
}

uint64_t sub_244566BC4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_244567AD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_244567AD0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_244566D1C()
{
  unint64_t result = qword_268E88B80;
  if (!qword_268E88B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E88B80);
  }
  return result;
}

uint64_t MuteConversationAction.isMuted.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit22MuteConversationAction_isMuted);
}

uint64_t MuteConversationAction.__allocating_init(conversationUUID:isMuted:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  MuteConversationAction.init(conversationUUID:isMuted:)(a1, a2);
  return v4;
}

uint64_t MuteConversationAction.init(conversationUUID:isMuted:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v19 = sub_244567560();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  char v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2445675A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_allocWithZone(MEMORY[0x263EFC970]);
  swift_retain();
  uint64_t v14 = (void *)sub_244567570();
  id v15 = objc_msgSend(v13, sel_initWithCallUUID_muted_, v14, a2 & 1);

  *(unsigned char *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit22MuteConversationAction_isMuted) = a2;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_244567540();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  *(void *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v9);
  char v16 = (void *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  void *v16 = 0;
  v16[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v8, v19);
  return v3;
}

uint64_t sub_24456702C(void *a1)
{
  uint64_t v3 = sub_244567560();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2445675A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  unsigned __int8 v11 = objc_msgSend(a1, sel_isMuted);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit22MuteConversationAction_isMuted) = v11;
  swift_release();
  id v12 = objc_msgSend(a1, sel_callUUID);
  sub_244567590();

  sub_244567540();
  *(void *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v10, v7);
  id v13 = (void *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *id v13 = 0;
  v13[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v6, v3);
  return v1;
}

void sub_244567238()
{
}

uint64_t MuteConversationAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t MuteConversationAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  uint64_t v2 = sub_2445675A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24454AF84(*(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(void *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  uint64_t v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  uint64_t v4 = sub_244567560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24456745C()
{
  return type metadata accessor for MuteConversationAction();
}

uint64_t type metadata accessor for MuteConversationAction()
{
  uint64_t result = qword_268E88B88;
  if (!qword_268E88B88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2445674B0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for MuteConversationAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MuteConversationAction);
}

uint64_t dispatch thunk of MuteConversationAction.__allocating_init(conversationUUID:isMuted:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_244567520()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_244567530()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_244567540()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_244567550()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_244567560()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_244567570()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_244567580()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_244567590()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2445675A0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2445675B0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2445675C0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2445675D0()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2445675E0()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2445675F0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_244567600()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_244567610()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_244567620()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_244567630()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_244567640()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_244567650()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_244567660()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_244567670()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_244567680()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_244567690()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2445676A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2445676B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2445676C0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_2445676D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2445676E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2445676F0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_244567700()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_244567710()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_244567720()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_244567730()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_244567740()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_244567750()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_244567760()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_244567770()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_244567780()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_244567790()
{
  return MEMORY[0x270FA1E10]();
}

uint64_t sub_2445677A0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2445677B0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2445677C0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2445677D0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2445677E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2445677F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_244567800()
{
  return MEMORY[0x270F9CF78]();
}

uint64_t sub_244567810()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_244567820()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_244567830()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_244567840()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_244567860()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_244567870()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_244567880()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_244567890()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2445678A0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2445678B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2445678C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2445678D0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_2445678E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2445678F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_244567900()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_244567910()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_244567920()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_244567930()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_244567940()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_244567950()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_244567960()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_244567970()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_244567980()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_244567990()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2445679A0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2445679B0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2445679C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2445679D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2445679E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2445679F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_244567A00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_244567A10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_244567A20()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_244567A30()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_244567A40()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_244567A50()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_244567A60()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_244567A70()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_244567A80()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_244567A90()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_244567AA0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_244567AB0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_244567AC0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_244567AD0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_244567AE0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_244567AF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_244567B00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_244567B10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_244567B20()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_244567B30()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_244567B40()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_244567B50()
{
  return MEMORY[0x270F9FD98]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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